#version 410
#define M_PI 3.14159265358979323846

uniform mat4 mat_inverse;
uniform mat4 persp_inverse;
uniform sampler2D envMap;
uniform vec3 center;
uniform float radius;

uniform bool transparent;
uniform float shininess;
uniform float eta;

in vec4 position;
in vec4 vertColor;
in vec2 textCoords;
in vec4 vertNormal;

out vec4 fragColor;

float getFresnelReflected(in vec3 directionRay, in vec3 normal)
{
    float cosTheta = dot(-directionRay,normal);
    float ci = sqrt(eta*eta-(1-cosTheta*cosTheta));
    float FsTheta = ((cosTheta - ci)/(cosTheta + ci))*((cosTheta - ci)/(cosTheta + ci));
    float FpTheta = ((eta*eta*cosTheta - ci)/(eta*eta*cosTheta + ci));
    FpTheta = FpTheta * FpTheta;

    return (FsTheta + FpTheta)/2;
}

float getTheta1(in vec3 direction)
{
    float theta = 0.0;

    if(direction.x==0){
        if(direction.z<0){
            theta = -M_PI/2;
        }
        else if(direction.z>0){
            theta = M_PI/2;
        }
    } 
    else{
        theta = atan(direction.z/direction.x);
        if(direction.x<0){
            if(direction.z<0){
                theta = -M_PI - theta;
            }
            else{
                theta = M_PI - theta;
            }
        }
    }
    return theta;
}

float getTheta2(in vec3 direction)
{
    float longxz = direction.x*direction.x + direction.z*direction.z;
    float theta2 = 0.0;
    if(longxz == 0){
        if(direction.y !=0){
            if(direction.y > 0){
                theta2 = -M_PI;
            }
            else{
                theta2 = M_PI;
            }
        }
    }
    else{
        theta2 = atan(direction.y/sqrt(longxz));
    }
    return theta2;
}

vec4 getColorFromEnvironment(in vec3 direction)
{
    // TODO 
    float theta = getTheta1(direction);
    float theta2 = getTheta2(direction);
    if(length(direction)==0){
        return vec4(0,0,0,1);
    }
    return texture2D(envMap, vec2((theta+M_PI)/(2*M_PI),(theta2+M_PI/2)/M_PI));
}



bool raySphereIntersect(in vec3 start, in vec3 direction, out vec3 newPoint) {
    vec3 cp = start - center;
    float ps = dot(normalize(direction), cp);
    float delta = 4*(ps*ps - length(cp)*length(cp) + radius*radius);
    if(delta > 0){
        float lambda = (-2*ps - sqrt(delta))/2; 
        if(lambda <= 0.0001){
            lambda = (-2*ps + sqrt(delta))/2; 
        }
        if(lambda <= 0.0001){
            return false;
        }
        newPoint = center + cp + lambda*normalize(direction);
        return true; 
    }
    else{
        return false;
    }
}


vec4 getColorFromEnvironmentWithSphere(in vec3 start, in vec3 direction){

    vec3 newPoint;
    vec3 secondPoint;
    vec3 laNormal;
    vec4 couleur = vec4(0.0,0.0,0.0,1.0);
    vec3 direction2 = direction;
    vec3 start2 = start;
    float coefFres;
    float coefFres2=1;

    if(raySphereIntersect(start2, direction2, newPoint)){
        for(int i=0; i<4; i++){

            laNormal = normalize(newPoint - center);
            coefFres = getFresnelReflected(direction2, laNormal);
            vec3 reflectedRay = reflect(direction2, laNormal);
            vec3 refractedRay = refract(direction2, laNormal, eta);


            if(raySphereIntersect(newPoint, reflectedRay, secondPoint)){
                couleur = couleur + (1-coefFres)*coefFres2*getColorFromEnvironment(refractedRay);
                newPoint = secondPoint;
                coefFres2 = coefFres2 * coefFres;
                direction2 = reflectedRay;
            }
            else{

                couleur = couleur + coefFres*coefFres2*getColorFromEnvironment(reflectedRay);
                if(raySphereIntersect(newPoint, refractedRay, secondPoint)){

                    newPoint = secondPoint;
                    coefFres2 = coefFres2 * (1-coefFres);
                    direction2 = refractedRay;
                }
                else{
                    i=10;
                }
            }
        }
    }
    else{
        return getColorFromEnvironment(direction2);
    }
    return couleur;
    
}

void main(void)
{
    // Step 1: I need pixel coordinates. Division by w?

    vec4 worldPos = position;
    worldPos.z = 1; // near clipping plane
    worldPos = persp_inverse * worldPos;
    worldPos /= worldPos.w;
    worldPos.w = 0;
    worldPos = normalize(worldPos);

    // Step 2: ray direction:

    vec3 u = normalize((mat_inverse * worldPos).xyz);
    vec3 eye = (mat_inverse * vec4(0, 0, 0, 1)).xyz;

    // TODO
    

    vec4 resultColor = vec4(1,0,0,0.0);
    fragColor = getColorFromEnvironmentWithSphere(eye, u);
}


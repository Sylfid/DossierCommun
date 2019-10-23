#version 410

uniform float lightIntensity;
uniform bool blinnPhong;
uniform float shininess;
uniform float eta;
uniform sampler2D shadowMap;

in vec4 eyeVector;
in vec4 lightVector;
in vec4 vertColor;
in vec4 vertNormal;
in vec4 lightSpace;

out vec4 fragColor;

void main( void )
{
    // This is the place where there's work to be done

    vec4 ambient = 0.1 * vertColor * lightIntensity;
    vec4 lightVector2 = normalize(lightVector);
    vec4 eyeVector2 = normalize(eyeVector);    
    vec4 vertNormal2 = normalize(vertNormal);

    float ps = dot(vertNormal2, lightVector2);
    if(ps<0){ps=0;}
    vec4 diffuse = 0.9 * vertColor * ps * lightIntensity;

    vec4 H = (eyeVector2 + lightVector2);
    H = normalize(H);

    float cos_theta_d = dot(lightVector2, H);
    float c_i = pow(eta*eta - (1 - cos_theta_d*cos_theta_d), 1/2);
    float F_thetas = abs((cos_theta_d - c_i)/(cos_theta_d + c_i));
    F_thetas = F_thetas * F_thetas; 
    float F_thetap = abs((eta*eta*cos_theta_d - c_i)/(eta*eta*cos_theta_d + c_i));
    F_thetap = F_thetap * F_thetap;

    
    float ps1 = dot(vertNormal2,H);
    if(ps1<0){ps1=0;}

    vec4 specular = (F_thetas + F_thetap)/2 * vertColor * pow(ps1, shininess) * lightIntensity;
    
    
    fragColor = ambient + diffuse + specular;
}

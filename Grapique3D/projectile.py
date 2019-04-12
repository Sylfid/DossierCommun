from keyframe import *
from mesh import load_textured

class Projectile(KeyFrameControlNode):

    def __init__(self, objet, position_init, rotate_keys,
                 scale, vitesse):
        translate = {0: position_init, 1: position_init}
        scale2 = {0: scale, 1: scale}
        self.vitesse = vitesse;
        super().__init__(translate, rotate_keys, scale2)
        self.add(*load_textured(objet))
        
    def draw(self, projection, view, model, **param):
        taille = self.get_Taille_trans()
        if(glfw.get_time()> taille):
            self.add_value_trans(self.get_last_value_trans()
                                 + self.vitesse, taille + 1)
        super().draw(projection, view, model, **param)


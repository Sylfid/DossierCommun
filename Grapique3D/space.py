from node import Node
from keyframe import *
from mesh import load_textured
from transform import Trackball, identity, translate, rotate, scale, lerp, vec
from transform import (quaternion_slerp, quaternion_matrix, quaternion,
                       quaternion_from_euler)

class Planete(Node):

    def __init__(self, planete):
        super().__init__()
        self.add(*load_textured(planete))


class SystemeSolaire(Node):

    def __init__(self):

        super().__init__()
        soleil = Planete('objet3D/Sun_v2_L3.123cbc92ee65-5f03-4298-b1e6-b236b6b8b4aa/13913_Sun_v2_l3.obj')
        terre = Planete('objet3D/Earth_v1_L3.123cce489830-ca89-49f4-bb2a-c921cce7adb2/13902_Earth_v1_l3.obj')

        translate_keys_sun = {0: vec(0, 0, 0), 2: vec(0, 0, 0), 4: vec(0, 0, 0)}
        rotate_keys_sun = {0: quaternion(), 1:
                           quaternion_from_euler(90, 0, 0),
                       2: quaternion_from_euler(180, 0, 0), 3:
                           quaternion_from_euler(270,0,0),
                           4: quaternion()}
        scale_keys_sun = {0: 2, 2: 2, 4: 2}
        base = KeyFrameControlNode(translate_keys_sun,
                                   rotate_keys_sun, scale_keys_sun)
        base.add(soleil)

        translate_keys_earth = {0: vec(0, 3500, 00), 2: vec(0, 2500, 00),
                                4: vec(0, 3500, 00)}
        rotate_keys_earth = {0: quaternion(), 1:
                             quaternion_from_euler(90, 0, 0),
                       2: quaternion_from_euler(180, 0, 0), 3:
                             quaternion_from_euler(270,0,0), 4:
                             quaternion()}
        #rotate_keys_earth = {0: quaternion(), 2: quaternion(),
         #              3: quaternion(), 4: quaternion()}
        scale_keys_earth = {0: 1, 2: 1, 4: 1}

        terre_shape = KeyFrameControlNode(translate_keys_earth,
                                   rotate_keys_earth, scale_keys_earth)
        terre_shape.add(terre)                     


        rotate_keys_t_earth = {0: quaternion(), 2: quaternion(),
                       3: quaternion(), 4: quaternion()}
        rotate_keys_t_earth = {0: quaternion(), 2:
                             quaternion_from_euler(90, 0, 0),
                       4: quaternion_from_euler(180, 0, 0), 6:
                             quaternion_from_euler(270,0,0), 8:
                             quaternion()}
        translate_keys_t_earth = {0: vec(0, 0, 3500), 2: vec(0, 2475,
                                                           2475),
                                4: vec(0, 3500, 0),
                                6:vec(0,2475,-2475), 8: vec(0,
                                                            0,-3500),
                                10: vec(0, -2475, -2475), 12: vec(0,
                                                                  -3500,
                                                                  0),
                                14: vec(0, - 2475, 2475), 16: vec(0,
                                    0, 3500)}
        translate_keys_t_earth = {0: vec(0, 00, 00), 2: vec(0, 00, 00),
                                4: vec(0, 00, 00)}
        scale_keys_t_earth = {0: 1, 2: 1, 4: 1}

        transform_terre = KeyFrameControlNode(translate_keys_t_earth,
                                   rotate_keys_t_earth, scale_keys_t_earth)

        translate_keys_t_sun = {0: vec(0, 0, 00), 2: vec(0, 0, 00),
                                4: vec(0, 0, 00)}
        rotate_keys_t_sun = {0: quaternion(), 2: quaternion()}
        scale_keys_t_sun = {0: 1, 2: 1, 4: 1}

        transform_terre = KeyFrameControlNode(translate_keys_t_earth,
                                   rotate_keys_t_earth,
                                              scale_keys_t_earth)

        transform_terre.add(terre_shape)

        transform_base = KeyFrameControlNode(translate_keys_t_sun,
                                   rotate_keys_t_sun,
                                              scale_keys_t_sun)
        transform_base.add(base)
        transform_base.add(transform_terre)
        self.add(transform_base)

world: {}

### table

table(world): {
 shape: ssBox, Q: "t(0 0. .6)", size: [2.5, 2.5, .1, .02], color: [.3, .3, .3],
 contact: 1, logical: { },
 friction: .1
}

### one panda

Prefix: "l_"
#Include: <panda_fixRobotiq.g>
Include: <panda_fixGripper.g>

Prefix: False

Edit l_panda_base (table): { Q: "t(0 -.2 .05) d(90 0 0 1)" joint:rigid }

Edit l_panda_joint2: { q: -.5 }
Edit l_panda_joint4: { q: -2 }
Edit l_panda_joint7: { q: -.5 }

##############
### camera
##############
camera_1(world): {
 Q: "t(0.8 -.4 1.4) d(90 0 0 1) d(-155 1 0 0)",
 shape: marker, size: [.1],
 focalLength: 0.895, width: 640, height: 360, zRange: [.5, 100]
}

camera_2(world): {
 Q: "t(0.5 -.7 1.45) d(-155 1 0 0)",
 shape: marker, size: [.1],
 focalLength: 0.895, width: 640, height: 360, zRange: [.5, 100]
}

camera_3(world): {
 Q: "t(-0.1 .55 1.4) d(180 0 0 1) d(-155 1 0 0)",
 shape: marker, size: [.1],
 focalLength: 0.895, width: 640, height: 360, zRange: [.5, 100]
}

#camera_4(world): {
# Q: "t(-0.5 .2 1.3) d(-90 0 0 1) d(30 1 0 0)",
# shape: marker, size: [.1],
# focalLength: 0.895, width: 640, height: 360, zRange: [.5, 100]
#}

#cameraWrist(l_panda_joint7): {
##, Q: "d(180 0 1 0) d(-45 0 0 1) t(-.03 -.045 -.16) t(0 0 .01) d(-3 1 0 0) t(-0.00219142 -0.00549389 -0.00735351)"
# Q: "d(180 0 1 0) d(-45 0 0 1) t(-.03 -.045 -.16) t(0 0 .01) d(-3 1 0 0) p(-0.00219142 -0.00549389 -0.00735351 0.00384112 0.999974 0.00603637 -0.000190875) d(180 1 0 0)",
# shape: camera, size: [.1],
# focalLength: 0.895, width: 640, height: 360, zRange: [.1, 10]
#}

bellybutton(l_panda_joint2): {
 Q: "d(90 0 1 0) t(-.0184 .0 .0545)",
 shape: cylinder, size: [.001, .0125], color: [0, 0, 1]
}

##############
### boxes
##############
box1(crate_1): {
 shape: ssBox, Q: "t(-.1  0. .13) d(15 0 0 1)", size: [.2, .1, .2, .02], color: [.5, .1, .1],
 contact: 1, logical: { },
 friction: .1
}

box2(crate_2): {
 shape: ssBox, Q: "t(-.1  0. .16) d(-35 0 0 1)", size: [.15, .1, .26, .02], color: [.5, .5, .1],
 contact: 1, logical: { },
 friction: .1
}

##############
### crates
##############
crate_1(table): {
 shape: ssBox, Q: "t(.5 -.4 .08)", size: [.6, .6, .06, .02], color: [.895, .913, .745],
 contact: 1, logical: { },
 friction: .1
}

crate_1_1(crate_1): {
 shape: ssBox, Q: "t(.27 0. .13)", size: [.06, .6, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_1_2(crate_1): {
 shape: ssBox, Q: "t(-.27 0. .13)", size: [.06, .6, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_1_3(crate_1): {
 shape: ssBox, Q: "t(.0 .27 .13)", size: [.6, .06, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_1_4(crate_1): {
 shape: ssBox, Q: "t(.0 -.27 .13)", size: [.6, .06, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_2(table): {
 shape: ssBox, Q: "t(-.1 0.2 .08)", size: [.6, .6, .06, .02], color: [.895, .913, .745],
 contact: 1, logical: { },
 friction: .1
}

crate_2_1(crate_2): {
 shape: ssBox, Q: "t(.27 0. .13)", size: [.06, .6, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_2_2(crate_2): {
 shape: ssBox, Q: "t(-.27 0. .13)", size: [.06, .6, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_2_3(crate_2): {
 shape: ssBox, Q: "t(.0 .27 .13)", size: [.6, .06, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

crate_2_4(crate_2): {
 shape: ssBox, Q: "t(.0 -.27 .13)", size: [.6, .06, .2, .02], color: [.53, .38, .27],
 contact: 1, logical: { },
 friction: .1
}

world {}

table (world){
    shape:ssBox, Q: "t(0 0. .6)", size:[4. 4. .1 .02], color:[.3 .3 .3]
}

box (table){
  shape:ssBox, Q: "t(-0.3 0.25 .085) d(0 0 0 1)", size:[.6 .08 .1 .02], color:[.4 .8 .4], mass: .1, contact
  joint:rigid
}

Include: <../../../../rai-robotModels/panda/panda.g>
Edit panda_link0{ X: "t(0. -0.1 .65) d(90 0 0 1)" }

Edit panda_finger_joint1 { joint_active: False }

side:{ X:"t(0 0.15 0.75) d(0 0 0 1)" , shape:box, size: [0.2 0.03 0.2 0.5], color: [0 0 1], mass: .1, contact}
top:{ X:"t(0 0.25 0.86) d(0 0 0 1)" , shape:box, size: [0.2 0.22 0.03 0.5], color: [1 1 0], mass: .1, contact}
side2:{ X: "t(0 0.35 0.75) d(0 0 0 1)" , shape:box, size: [0.2 0.03 0.2 0.5], color: [1 0 0], mass: .1, contact}

final:{ X:"t(0.4 0.25 0.7) d(0 0 0 1)" , shape: marker, size: [.1]}

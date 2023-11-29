#include <KOMO/komo.h>
#include <string>
#include <map>
#include <Core/graph.h>
#include <Kin/switch.h>
#include <Optim/NLP_Solver.h>
#include <Kin/F_collisions.h>   // Added

using namespace std;

//===========================================================================

void testPickAndPlace(uint order){
  rai::Configuration C("tunnel.g");

//  rai::ConfigurationViewer V;
//  V.setConfiguration(C, "initial model", false);

  KOMO komo;

  komo.setConfig(C, true);
  if(order==2){
    komo.setTiming(2.5, 30, 5., 2);
    komo.addControlObjective({}, 2);
    komo.addControlObjective({}, 0, 1e-1);
  } else if(order==1) {
    komo.setTiming(3., 20, 5., 1);
    komo.addControlObjective({}, 1, 1e0);
    komo.addControlObjective({}, 0, 1e-2);
  } else if(order==0) {
    komo.setTiming(3., 1, 5., 1);
    komo.addControlObjective({}, 0, 1e0);
  }else NIY;
  komo.addQuaternionNorms();
  
  komo.pathConfig.report();

  //grasp
#if 0
  komo.addStableFrame(rai::SY_stable, "gripper", "gripper_box", "box");
  komo.addRigidSwitch({1., 2.}, {"gripper_box", "box"}, true);
#else
  komo.addModeSwitch({1., 2.}, rai::SY_stable, {"gripper", "box"}, true);
  komo.addObjective({}, FS_accumulatedCollisions, {}, OT_eq,{1e2});
#endif
  komo.addObjective({1.}, FS_positionDiff, {"gripper", "box"}, OT_eq, {1e2});
  komo.addObjective({1.}, FS_scalarProductXX, {"gripper", "box"}, OT_eq, {1e2}, {0.});
  komo.addObjective({1.}, FS_vectorZ, {"gripper"}, OT_eq, {1e2}, {0., 0., 1.});

  //slow - down - up
  if(order>0) komo.addObjective({1.}, FS_qItself, {}, OT_eq, {}, {}, 1);
  if(order>1) komo.addObjective({.9,1.1}, FS_position, {"gripper"}, OT_eq, {}, {0.,0.,.1}, 2);

  //place
#if 0
  komo.addStableFrame(rai::SY_stableOn, "table", "table_box", "box");
  komo.addRigidSwitch({2., -1.}, {"table_box", "box"}, false);
#else
  komo.addModeSwitch({2., -1.}, rai::SY_stableOn, {"table", "box"}, false);
#endif
  komo.addObjective({2.}, FS_positionDiff, {"box", "final"}, OT_eq, {1e2}, {0,0,0}); //arr({1,3},{0,0,1e2})
  komo.addObjective({2.}, FS_vectorXDiff, {"box", "final"}, OT_eq, {1e2}, {0., 0., 0});
//  komo.addObjective({2.}, FS_vectorZ, {"box"}, OT_eq, {1e2}, {0., 0., 1.});

  //slow - down - up
  if(order>0) komo.addObjective({2.}, FS_qItself, {}, OT_eq, {}, {}, 1);
  if(order>1) komo.addObjective({1.9,2.1}, FS_position, {"gripper"}, OT_eq, {}, {0.,0.,.1}, 2);

//  komo.add_jointLimits();

  komo.opt.verbose = 2;
//  komo.opt.animateOptimization = 2;

  NLP_Solver sol;
  auto ret = sol.setProblem(komo.nlp()) .solve();
  cout <<*ret <<endl;

  cout <<"REPORT\n" <<komo.report(true, true) <<endl;
 // cout <<"GRADS\n" <<sol.reportLangrangeGradients(komo.featureNames) <<endl;

  //komo.optimize();
  //komo.checkGradients();

  komo.view(true, "optimized motion");
  while(komo.view_play(true, .2));
}

//===========================================================================

void grasp(double t, KOMO& komo, const char* gripper, const char* box, bool firstTime){
  //grasp
#if 0
  komo.addStableFrame(rai::SY_stable, gripper, STRING(gripper <<'+' <<box), box);
  komo.addRigidSwitch({1., 2.}, {STRING(gripper <<'+' <<box), box}, true);
#else
  komo.addModeSwitch({t, t+1}, rai::SY_stable, {gripper, box}, firstTime);
#endif
//  komo.addObjective({t}, FS_positionDiff, {gripper, box}, OT_eq, {1e2});
  komo.addObjective({t}, FS_insideBox, {gripper, box}, OT_ineq, {1e2});
  komo.addObjective({t}, FS_scalarProductXX, {gripper, box}, OT_eq, {1e2}, {0.});
  komo.addObjective({t}, FS_vectorZ, {gripper}, OT_eq, {1e2}, {0., 0., 1.});

  //slow - down - up
//  if(komo.k_order>0) komo.addObjective({1.}, FS_qItself, {}, OT_eq, {}, {}, 1);
//  if(komo.k_order>1) komo.addObjective({.9,1.1}, FS_position, {gripper}, OT_eq, {}, {0.,0.,.1}, 2);
}

void place(double t, KOMO& komo, const char* gripper, const char* box, const char* table){
#if 0
  komo.addStableFrame(rai::SY_stableOn, table, STRING(table <<'+' <<box), box);
  komo.addRigidSwitch({2., -1.}, {STRING(table <<'+' <<box), box}, false);
#else
  komo.addModeSwitch({t, -1.}, rai::SY_stableOn, {table, box}, false);
#endif
//  komo.addObjective({2.}, FS_positionDiff, {"box", "table"}, OT_eq, {1e2}, {0,0,.08}); //arr({1,3},{0,0,1e2})
//  komo.addObjective({2.}, FS_vectorZ, {"gripper"}, OT_eq, {1e2}, {0., 0., 1.});

  //slow - down - up
//  if(komo.k_order>0) komo.addObjective({2.}, FS_qItself, {}, OT_eq, {}, {}, 1);
//  if(komo.k_order>1) komo.addObjective({1.9,2.1}, FS_position, {gripper}, OT_eq, {}, {0.,0.,.1}, 2);
}


//===========================================================================

int main(int argc,char** argv){
  rai::initCmdLine(argc,argv);

  testPickAndPlace(2);
//  testPickAndPlace(1);
//  testPickAndPlace(0);

//  testHandover(2);
//  testHandover(1);
//  testHandover(0);

  return 0;
}


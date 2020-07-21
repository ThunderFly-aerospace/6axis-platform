include <../../../parameters.scad>
include <../calculations.scad>

draft = false;

//@set_slicing_config(../../slicing/strong.ini)

//dil pro pripevneni priruby magnetu
use <../888_4004.scad>

rotate([0,180,0])
  888_4004(draft);

include <../../../parameters.scad>
include <../calculations.scad>

draft = false;
//@set_slicing_config(../../slicing/strong.ini)

//dil pro pripevneni priruby magnetu
use <../888_4006.scad>

  888_4006(draft);

include <../../../parameters.scad>
include <../calculations.scad>


//@set_slicing_config(../../slicing/strong.ini)

//dil pro pripevneni priruby magnetu
use <../888_4005.scad>

translate([0, 0, -vertical_distance_of_plaftorms + 10])
  888_4005(false);

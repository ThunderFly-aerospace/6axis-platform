include <../../../parameters.scad>
include <../calculations.scad>

draft = false;
//@set_slicing_config(../../slicing/strong.ini)

//dil pro pripevneni priruby magnetu
use <../888_4007.scad>

translate([-20,20,0])
  888_4007();

translate([-20,0,0])
  888_4007();

translate([-20,-20,0])
  888_4007();


translate([20,20,0])
  888_4007();

translate([20,0,0])
  888_4007();

translate([20,-20,0])
  888_4007();

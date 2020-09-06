include <../../../parameters.scad>
include <../calculations.scad>


//@set_slicing_config(../../slicing/strong.ini)

//dil pro pripevneni priruby magnetu
use <../888_4002.scad>

translate([-20,30,0])
rotate([0,180,0])
  888_4002();


translate([-20,0,0])
rotate([0,180,0])
  888_4002();

translate([-20,-30,0])
  rotate([0,180,0])
    888_4002();


translate([20,30,0])
  rotate([0,180,0])
    888_4002();


translate([20,0,0])
  rotate([0,180,0])
    888_4002();

translate([20,-30,0])
  rotate([0,180,0])
    888_4002();

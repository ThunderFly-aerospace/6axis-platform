include <../../parameters.scad>
include <calculations.scad>
use <lib/copyFunctions.scad>

draft = false;
$fn = draft ? 20 : 100;

module 888_4005(draft = true){

    height = 30;
    magnet_d = 75;
    cylinder_height = magnet_d/2;
    magnet_offset = -0;
    magnet_rotation = 45;
    magnet_height = 35;
    magnet_screw_length = 35 - 10; // délka šroubu pro upevnění příruby
    fixing_distance = 20;
    teeth_width = 35;

    difference()
    {
        translate([0, 0, vertical_distance_of_plaftorms - 10])
            difference()
            {
                union()
                {
                    // válec zkosit o úhel odpovídající správnému
                    // úhlu šroubu kulového kloubu
                    cylinder(d1 = platform_top_diameter,
                             d2 = platform_top_diameter - 12,
                             h = 20);

                    hull()
                    {
                        // válec zkosit o úhel odpovídající správnému
                        // úhlu šroubu kulového kloubu
                        translate([0, 0, 5])
                        cylinder(d1 = platform_top_diameter - 10,
                                 d2 = platform_top_diameter - 12,
                                 h = 15);
                        rotate([0,0,30])        // otočení do přední části platformy
                            translate([magnet_offset,0, height - 1])
                                cylinder(d = magnet_d , h = 1);
                    }

                    translate([0,0,25])
                    difference() {
                        cylinder(d = magnet_d+global_clearance+10, h = magnet_height+9.5);

                        cylinder(d = magnet_d+global_clearance, h = magnet_height+11);

                        for (i=[0:7]) rotate([0, 0, 45*i]){

                            translate([0,0,magnet_height+5])
                            linear_extrude(height = 10)
                            polygon(points=[[0,0],[magnet_d+11,teeth_width/2],[magnet_d+11,-teeth_width/2]]);
                        }
                    }
                }
                rotate([0,0,magnet_rotation])        // otočení do přední části platformy
                    translate([magnet_offset,0,0])
                        rotate([0,0,45])
                            for (i=[0:3]) rotate([0, 0, 90*i]){
                                translate([0, 70/2, height - magnet_screw_length + layer_thickness])
                                    cylinder(h = 2*cylinder_height, d = M4_screw_diameter);

                                translate([0, 70/2, 0])
                                   cylinder(h = height - magnet_screw_length, d1 = 3*M4_nut_diameter, d2 = 2*M4_nut_diameter);
                            }

                // otvor pro vývody
                rotate([0,0,magnet_rotation])        // otočení do přední části platformy
                  translate([magnet_offset,0,0])
                      translate([- 57/2, 0, 0])
                      {
                          cylinder(h = 100, d = 8);
                          cylinder(h = 8, d1 = 16, d2 = 8);
                      }
            }
        // Cut-out for piston bolts
        pistons_and_bearing();
    }
}


difference()
{
    // If not draft -> move to print position.
    if (!draft)
        translate([0, 0, -vertical_distance_of_plaftorms + 10])
            rotate([0, 0, 0])
            {
                888_4005(false);
            }
    else
    {
        888_4005(true);
    }
    // Cut-out cube
    if (draft)
        translate([0, 0, vertical_distance_of_plaftorms])
            cube([platform_base_diameter*2, platform_base_diameter*2, platform_height]);
}
    // Draft only - piston and bearing visualisation
    #if (draft)
        pistons_and_bearing();

// Diameter of the whole holder
diameter = 20;
knob_shaft_diameter = 9.6;
// Tooth diameter
tooth_diameter = 4;

module 888_4007(){
	difference(){
		union(){
			cylinder(r=diameter/2,h=8, center=true);
		}
		for ( i = [0 : 15 : 360] ){
			translate([sin(i)*diameter/2,cos(i)*diameter/2,0]) cylinder(r=tooth_diameter/2,h=9, $fn=16, center = true);
		}
		cylinder(d=knob_shaft_diameter,h=16,$fn=6, center = true);
	}
}

888_4007();

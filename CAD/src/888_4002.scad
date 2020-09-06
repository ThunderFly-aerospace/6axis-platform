include <../../parameters.scad>
//sroub pro propojení pistu k 3D vytisku je M6
//dno je tluste 3 mm
//sroub pro prřipojení 3D vytisku k lozisku je M6, hlava soubu je ulozena  blize k pistu.


module 888_4002(){
  piston_thread_height=13+1;
  connecting_height=piston_thread_height+M6_head_height;
  //velikost vnejsiho prumeru soucastky
  connecting_diameter=20;
  piston_thread_diameter=16+0.2;
  //seriznuti valce
  piston_cutout=12.1;
  bearing_ball_height=bearing_EFOM_10_h-0.8;
  bottom_height=3;
  hole_pozition=7;//posunuti diry pro pripevneni vytisku k pistu měřeno od širší části.
  insert_nut_connecting_pozition = connecting_height-hole_pozition+bottom_height;

  difference(){
      //cast ktera se pripevni na pist
      union(){
          translate([0,0,bottom_height])
              cylinder(h=connecting_height,d=connecting_diameter,$fn=100);
          cylinder(h=bottom_height, d1 = bearing_EFOM_10_d1+2, d2 = connecting_diameter, $fn=100);   //zkoseni dna

          //cast ktera prochazi kulovym loziskem
          translate([0,0,-((bearing_EFOM_10_h/2)-global_clearance)])
              cylinder(h=(bearing_EFOM_10_h/2)-global_clearance,d=bearing_EFOM_10_d1,$fn=100);
      }

      //vyrez pro nasazeni
      difference(){
           translate([0,0,bottom_height+M6_head_height])
              cylinder(h=piston_thread_height + global_clearance,d=piston_thread_diameter,$fn=100);

          translate([0,piston_cutout/2+5/2,bottom_height+M6_head_height+piston_thread_height/2])
              cube([piston_thread_diameter,5,piston_thread_height],center=true);
          translate([0,-piston_cutout/2-5/2,bottom_height+M6_head_height+piston_thread_height/2])
              cube([piston_thread_diameter,5,piston_thread_height],center=true);
      }
      //vyrez pro ulozeni hlavy sroubu M6 do dna
      translate([0,0,bottom_height])
          cylinder(h=M6_head_height, d=M6_nut_diameter,$fn=6);
          //cylinder(h=M6_head_height - layer_thickness, d=M6_nut_diameter,$fn=6);



      //pruchod pro sroub (zaslepeny kvuli tisku)
      translate([0,0,-((bearing_EFOM_10_h/2)-global_clearance)])
          cylinder(h=(bearing_EFOM_10_h/2)-global_clearance + bottom_height - layer_thickness, d=M6_screw_diameter,$fn=100);


      //otvor pro pripevneni na pist pomoci sroubu
      rotate([90,0,0]){
          translate([0,insert_nut_connecting_pozition,0])
              cylinder(h=connecting_diameter,d=M6_screw_diameter,$fn=100,center=true);
      //sestihran pro zapusteni matky pri montazi
          translate([0,insert_nut_connecting_pozition,connecting_diameter/2-M6_nut_height/2])
              cylinder(h=M6_nut_height/2,d=M6_nut_diameter,$fn=6);
          translate([0,insert_nut_connecting_pozition,-connecting_diameter/2])
              cylinder(h=M6_nut_height/2,d=M6_nut_diameter,$fn=6);
      }
  }
  //zaslepka pro tisk
  /*translate([0,0,bottom_height])
    cylinder(h=layer_thickness,d=connecting_diameter);
*/
}

difference(){
  888_4002();
  translate([0,0,-50]) cube(100);

}

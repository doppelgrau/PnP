difference() {
    union(){
         translate([0, 30.5, 0]) cylinder(h=47, r1=63.2, r2=48.2, $fn=6);
         translate([0, 30.5, 0]) cylinder(h=0.9, r=69.2, $fn=6);
    }
    translate([0, 30.5, 0]) cylinder(h=47, r1=61.6, r2=46.6, $fn=6);
    translate([0, 100, 0]) cube(200, center=true);
}

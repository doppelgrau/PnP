difference() {
    translate([0,-2,3]) cube([45,43,14], center=true);

    union() {
        difference() {
            cylinder(d=42, h=9);
            cylinder(d=38, h=9);
            translate([21,0,4.5]) cube([42, 42, 20], center=true);
        }
        translate([0, 19,0]) cube([8,5,9]);
        translate([-2, -23.9,0]) cube([10,5,9]);
        translate([-2, -26.4,0]) cube([10,5,20]);
        translate([7, -21.5,0]) rotate([0,0,10]) cube([50,2.4,9]);
        translate([0, -21.5,0]) rotate([0,0,175]) cube([50,0.5,20]);
    };
};
translate([-4,-25.5,-4]) cube([1,2,13.7]);
translate([8.6,-25.5,-4]) cube([1,2,13.7]);
translate([15.5,-23.5,10]) cube([7,7,7]);

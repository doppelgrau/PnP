difference() {
    union() {
        translate([0, 0, -5]) rotate([0,0,22.5]) cylinder(h=5, d=14.65, $fn=8);
        translate([0, 0, 25]) cube([50, 1.6, 50], center=true);
        translate([0, 0, 25]) cube([1.6, 50, 50], center=true);
        translate([0, 0, 0]) rotate([0,0,22.5]) cylinder(h=70, d1=14.65, d2=75, $fn=8);
    };
        union() {
        translate([0, 0, -5]) rotate([0,0,22.5]) cylinder(h=5, d=13.05, $fn=8);
        translate([0, 0, 0]) rotate([0,0,22.5]) cylinder(h=70, d1=13.05, d2=73.4, $fn=8);
    };

};
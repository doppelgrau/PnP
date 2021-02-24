difference() {
    minkowski() {cube([16-1.6-2,40-1.6-2, 10], center=true); cylinder(r=1, h=1, $fn=60, center=true);};
    translate([0,0,0.45]) minkowski() {cube([16-2*1.6-1,40-2*1.6-1, 10], center=true); cylinder(r=0.5, h=1, $fn=60, center=true);};
}
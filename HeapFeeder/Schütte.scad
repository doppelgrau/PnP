difference() {
    union() {
        translate([-5,0,10]) cube([55,50,20], center=true);
        intersection() {
            translate([15,-10.2,0]) rotate([0,-45,0]) linear_extrude(30) polygon(points=[[0,0],[40,0],[40,12.4],[0,12.4]]);
            translate([0,0,10]) cube([100,95,20], center=true);

        }
    }
    translate([8,-2,10.6]) cube([14,14,19], center = true);
    intersection() {
        translate([15,-9,1.2]) rotate([0,-45,0]) linear_extrude(30) polygon(points=[[0,0],[40,0],[40,10],[0,10]]);
        translate([28,-3,10.6]) cube([54,14,19], center = true);
    }
    translate([-25,-15,10]) cube([35,20,20], center=true);
    translate([-25,+15,10]) cube([35,20,20], center=true);

}
//translate([0,0,1]) cube([50,45,2], center=true);


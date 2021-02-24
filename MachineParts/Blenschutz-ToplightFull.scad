difference() {
    translate([-0.8, -0.8, -0.6]) cube([88.6,64,30]);
    cube([87,62.4,30]); // inside
    translate([5, 4, -1]) cube([78.6,56,30]); // opening of the top
    translate([-1, 31, -1]) cube([10,2,32]);  // opening
    translate([0, 12,-1]) cube([10,40,35]);
    translate([75,0,-1]) cube([12,12,35]);
    translate([75,50.4,-1]) cube([12,12,35]);
    translate([8,0,-1]) cube([12,12,35]);
    translate([8,50.4,-1]) cube([12,12,35]);

}
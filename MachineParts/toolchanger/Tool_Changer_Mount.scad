module holder() {
    difference()
    {
        $fn = 100;

        // Radius of nozzle tip where to hold
        r = 12 / 2;

        // Width of nozzle holder
        w = 20;
        // Border
        b = 6;
        // Distance between nozzles
        d = 15;
        h = 13.05;

        nozzles = 3;

        union()
        {
            cube([w, nozzles * d + 2 * b, h], false);
        }
        // Slot for nozzle slit
        for(i = [1:nozzles])
        {
            hull()
            {
                translate([10, b + d/2 + (i - 1) * d, h - 10]) cylinder(h + 2, r, r);
                translate([w + 10, b + d/2 + (i - 1) * d, h - 10]) cylinder(h + 2, r, r);
            }
        }
        // Screw holes for holding all layers together
        for(i = [1:nozzles - 1])
        {
            translate([w - 17, b + d + (i - 1) * d, h - 10]) cylinder(11, 1.6, 1.6);
            hull()
            {
                translate([w - 17, b + d + (i - 1) * d, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
                translate([-5, b + d + (i - 1) * d, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
            }
        }
        translate([w/2, 3, h - 10]) cylinder(11, 1.6, 1.6);
        hull() {
            translate([w/2,  3, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
            translate([w/2, -5, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
        }
        translate([w/2, nozzles * d + 2 * b - 3, h - 10]) cylinder(11, 1.6, 1.6);
        hull() {
            translate([w/2, nozzles * d + 2 * b - 3, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
            translate([w/2, nozzles * d + 2 * b + 5, h - 6]) cylinder(2.5, 3.3, 3.3, $fn = 6);
        }
    }
}

module plateMountingHole() {
    translate([0,0,0.5]) cube(5, center=true);
    // some 1,4mm Nails/wire for the magnets in the plates
    color("red") translate([3.35 +5,4-1.2,-1.2]) cube([10,1.6,1.5], center=true);
    color("red") translate([3.35 +5,4+1.2,-1.2]) cube([10,1.6,1.5], center=true);
}

module plateHolder(length=10, height=7) {
    translate([4, 4, 0]) plateMountingHole();
    translate([-4 + length * 8, 4, 0]) mirror([0,1,0]) rotate([0,0,180]) plateMountingHole();
    translate([4, -4 + height * 8, 0]) mirror([0,1,0]) plateMountingHole();
    translate([-4 + length * 8, -4 + height * 8, 0]) rotate([0,0,180]) plateMountingHole();

}

length=136;
width=72;
mountingHolesCenter=width-38;
difference() {
    union() {
        cube([length, width,3.05]);  // base plate
        translate([0, 13, 0]) holder();
        translate([20+20+14, 13+12+3*15, 0]) rotate([0,0,180]) holder();
        // some additional stiffness against bending
        translate([19, 13, 0]) cube([16, 7.5, 7]);
        translate([19, 32.5, 0]) cube([16, 3, 7]);
        translate([19, 47.5, 0]) cube([16, 3, 7]);
        translate([19, 62.5, 0]) cube([16, 7.5, 7]);
    }
    // mounting holes
    translate([3, mountingHolesCenter, -1]) cylinder(25, 1.6, 1.6, $fn=100);
    translate([20+20+14 - 3, mountingHolesCenter, -1]) cylinder(25, 1.6, 1.6, $fn=100);
    translate([length - 12 - 3, mountingHolesCenter, -1]) cylinder(25, 1.6, 1.6, $fn=100);
    translate([length - 12 - 3, mountingHolesCenter, 0.5]) cylinder(25, 3.2, 3.2, $fn=100);
    
    // holes for the mounting plates (trash and parts)
    platesOffset=2 * 20 + 14 + 2;
    translate([platesOffset, 0, 3.05]) plateHolder();
    translate([platesOffset, 56, 3.05]) plateHolder(length=5,height=2);
    translate([platesOffset + 40, 56, 3.05]) plateHolder(length=5,height=2);
}

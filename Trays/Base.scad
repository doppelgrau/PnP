// Base
perforatedSheetThickness = 1.4;  // mm
perforatedSheetHoleSize = 4.8;   // mm
perforatedSheetGridSize = 8;     // mm
// parameters
printTolerances = 0.05;         // mm to ajust for over extrusion of the printer
borderDistance  = 0.80;          // shrink the outside dimensions, so there is a bit of play between different parts
// part size
partThickness   = 02.85;         // mm above perforated sheet. at leat 2.85mm with the magnets
partLength      = 5;             // in grid-blocks
partWidth       = 2;             // in grid Blocks


module magnetPocket(center=[0,0,0],height=2.1, size=5.1) {
    translate(center) {
        translate([0,0,height/2]) cube([size + 2 * printTolerances,size + 2 * printTolerances, height], center = true);
    };
};

module foot(center=[0,0,0]) {
    translate(center) {
        translate([0,0,perforatedSheetThickness * 0.5]) cube([perforatedSheetHoleSize - 2 * printTolerances, perforatedSheetHoleSize - 2 * printTolerances, perforatedSheetThickness ], center = true);
    };
};
union() {
    difference() {
        translate([borderDistance, borderDistance, 2.55 - partThickness]) cube([partLength * perforatedSheetGridSize - 2 * borderDistance, partWidth * perforatedSheetGridSize - 2 * borderDistance, partThickness]);

        magnetPocket([8, 8, 0]);
        magnetPocket([partLength * perforatedSheetGridSize -8, 8, 0]);
        magnetPocket([8, partWidth * perforatedSheetGridSize - 8, 0]);
        magnetPocket([partLength * perforatedSheetGridSize -8, partWidth * perforatedSheetGridSize - 8, 0]);
//        translate([4, 4+24, 0]) {
//            translate([0,0,partThickness/2]) cube([8,8,2*partThickness], center = true);
//        };
    }
    foot([4, 4, 2.5]);
    foot([partLength * perforatedSheetGridSize -4, 4, 2.5]);
    foot([4, partWidth * perforatedSheetGridSize - 4, 2.5]);
    foot([partLength * perforatedSheetGridSize -4, partWidth * perforatedSheetGridSize - 4, 2.5]);
};

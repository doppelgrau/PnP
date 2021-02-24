// Text for Identifikation
label = "HF 02";
// Pocket
pocketWidth = 14;               // mm
pocketDepth = 25;               // mm
centerWidth = 7;                // space flat in the center, enough for largest nozzle and movement
// parameters
bottomThickness = 0.6;         // mm
wallThickness = 0.8;
// part size
borderSides = 2.5;              // mm
centerRow = 5;                  // mm
numerOfRows = 9;

module pocket(center=[0,0,0]) {
    translate(center) {
        union() {
            translate([0,0,(pocketWidth  - centerWidth) * (0.7 / 2) + pocketDepth / 2]) cube([pocketWidth, pocketWidth, (pocketDepth - (pocketWidth  - centerWidth) * 0.7)], center = true);
            translate([0,0,(pocketWidth  - centerWidth) * (0.7 / 2)]) intersection() {
                rotate([0, 0, 45]) cylinder(d1=1.414 * centerWidth, d2=1.414 * pocketWidth,  h=(pocketWidth  - centerWidth) * 0.7, center = true,$fn=4);
                rotate([0, 0, 45]) cylinder(d1=1.15 * centerWidth, d2=1.41 * pocketWidth,  h=(pocketWidth  - centerWidth) * 0.7, center = true,$fn=60);
            };
        };
    };
};

difference(){
    // full volume
    translate([-borderSides, 0, -bottomThickness]) cube([2 * borderSides + 2 * (2 * pocketWidth + 3 * wallThickness) + centerRow, wallThickness + numerOfRows * (pocketWidth + wallThickness), bottomThickness + pocketDepth]);
    // sides and center row
    translate([-borderSides, 0, 0]) cube([borderSides, wallThickness + numerOfRows * (pocketWidth + wallThickness), pocketDepth]);
    translate([2 * (2 * pocketWidth + 3 * wallThickness) + centerRow, 0, 0]) cube([borderSides, wallThickness + numerOfRows * (pocketWidth + wallThickness), pocketDepth]);
    translate([2 * pocketWidth + 3 * wallThickness, 0, (pocketWidth  - centerWidth ) * 0.7 + 0.45]) cube([centerRow, wallThickness + numerOfRows * (pocketWidth + wallThickness), pocketDepth]);
    // Text in the center row
    translate([2 * pocketWidth + 3 * wallThickness + centerRow / 2, 1, (pocketWidth  - centerWidth ) * 0.7]) linear_extrude(0.5) text(label, size=5, direction = "ttb", valign = "top", font="Liberation Sans:style=Bold");
    translate([2 * pocketWidth + 3 * wallThickness + centerRow / 2, wallThickness + numerOfRows * (pocketWidth + wallThickness) - 1, (pocketWidth  - centerWidth )]) linear_extrude(0.5) text(label, size=5, direction = "ttb", valign = "bottom", font="Liberation Sans:style=Bold");

    // pockets
    for (y =[wallThickness:(wallThickness + pocketWidth):(wallThickness + numerOfRows * (wallThickness + pocketWidth))]) 
        pocket([pocketWidth / 2 + wallThickness, pocketWidth / 2 + y, 0]);
    for (y =[wallThickness:(wallThickness + pocketWidth):(wallThickness + numerOfRows * (wallThickness + pocketWidth))]) 
        pocket([pocketWidth / 2 + wallThickness + (wallThickness + pocketWidth), pocketWidth / 2 + y, 0]);
    for (y =[wallThickness:(wallThickness + pocketWidth):(wallThickness + numerOfRows * (wallThickness + pocketWidth))]) 
        pocket([pocketWidth / 2 + 2 * wallThickness + 2 * (wallThickness + pocketWidth) + centerRow, pocketWidth / 2 + y, 0]);
    for (y =[wallThickness:(wallThickness + pocketWidth):(wallThickness + numerOfRows * (wallThickness + pocketWidth))]) 
        pocket([pocketWidth / 2 + 2 * wallThickness + 3 * (wallThickness + pocketWidth) + centerRow, pocketWidth / 2 + y, 0]);

    // special cutouts for visual hooming, screws or something like that
    //translate([-borderSides, 3 * (pocketWidth + wallThickness) + wallThickness + borderSides, -bottomThickness])
    //    cube([pocketWidth + wallThickness, 3 * pocketWidth + 2 * wallThickness - 2 * borderSides, bottomThickness + pocketDepth]);
    //translate([-borderSides, 3 * (pocketWidth + wallThickness) + wallThickness,])
    //    cube([borderSides + pocketWidth + wallThickness, 3 * pocketWidth + 2 * wallThickness, bottomThickness + pocketDepth]);

};

// "build space"
length=10;
width=7;
height=10.0;      // normal 10mm, heigh for RJ45 17.5

// divison
rows=2;
columns=4;

// general
tolerance=0.2;
turning=[0,0,90];

// Label
Text1="FCI";                // the shorter one
Text2="91601-308";    // the longer one

module reduceHeight(depth=0) {
    translate([0,0,-depth/2 + 0.1]) cube([2*length*8, 2*width*8, depth + 0.2], center=true);
}

// parts
module esp32_WROOM_32D() {
    height=3.2;
    translate([0,3.15,-height/2 + 0.01]) cube([18 + 2*tolerance, 25.5 + 2*tolerance, height], center=true);
    translate([-8,8.5,-height - 0.3]) cylinder(d=1, h=1, $fn=60); 
    translate([-4, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("ESP32", size=3, halign="center", valign="center");
    translate([0, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("WROOM", size=3, halign="center", valign="center");
    translate([4, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("32D", size=3, halign="center", valign="center");

    reduceHeight(1.5);
}

module esp32_WROOM_32U() {
    height=3.2;
    translate([0,0,-height/2 + 0.01]) cube([18 + 2*tolerance, 19.2 + 2*tolerance, height], center=true);
    translate([-8,8.5,-height - 0.3]) cylinder(d=1, h=1, $fn=60); 
    translate([-4, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("ESP32", size=3, halign="center", valign="center");
    translate([0, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("WROOM", size=3, halign="center", valign="center");
    translate([4, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("32U", size=3, halign="center", valign="center");

    reduceHeight(1.5);
}
    
module PQFP14x20() {
    height=3.1;
    translate([0,0,-height/2 + 0.01]) cube([17.2 + 2*tolerance, 23.2 + 2*tolerance, height], center=true);
    translate([-7.5,10.5,-height - 0.3]) cylinder(d=1, h=1, $fn=60); 
    translate([0, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("PQFP14x20", size=3, halign="center", valign="center");
    reduceHeight(1.5);
}

module Schurter_0031_8221() {
    height=3;
    translate([0,0,-height/2 + 0.01]) cube([9.8 + 2*tolerance, 22.2 + 2*tolerance, height], center=true);
    translate([0, 0,-height - 0.3]) rotate([0,0,90]) linear_extrude(1) text("Schurter", size=4, halign="center", valign="center");
}

module Pulse_H1164NL() {
    height=5.8;
    translate([0,0,-height/2 + 0.01]) cube([28.58 + 2*tolerance, 16 + 2*tolerance, height], center=true);
    translate([-13.5,-6.5,-height - 0.3]) cylinder(d=1, h=1, $fn=60); 
    translate([0, 3,-height - 0.3]) linear_extrude(1) text("Pulse", size=4, halign="center", valign="center");
    translate([0,-3,-height - 0.3]) linear_extrude(1) text("H1164NL", size=4, halign="center", valign="center");
    reduceHeight(3.5);
}

module ENCITECH_RJJS_88_143_E1V_039() {
    height=16; // addition 1.5 down => 17.5 volume needed 
    translate([0,0,-height/2 + 0.01]) cube([15.9 + 2*tolerance, 16.4 + 2*tolerance, height], center=true);
    translate([-2.4,0,-height/2 + 0.01]) cube([15.6 + 2*tolerance, 10.5 + 2*tolerance, height], center=true);
    translate([2.5, 5.075,-height/2 + 0.01]) cube([15.6 + 2*tolerance, 2.5 + 2*tolerance, height], center=true);
    translate([2.5,-5.075,-height/2 + 0.01]) cube([15.6 + 2*tolerance, 2.5 + 2*tolerance, height], center=true);
    translate([2.84, 5.715, -height - 1.5]) cylinder(d=2.1, h=2, $fn=30);
    translate([2.84,-5.715, -height - 1.5]) cylinder(d=2.1, h=2, $fn=30);    
    reduceHeight(8);
}

module FCI_91601_308() {
    height=8.2;
    translate([0,0,-height/2 + 0.01]) cube([20.3 + 2*tolerance, 3.5 + 2*tolerance, height], center=true);
    translate([0,0,-2.5 + 0.01]) cube([10 + 2*tolerance, 5.5 + 2*tolerance, 5], center=true);
    reduceHeight(2.5);
}


// main
difference() {
    cube([length * 8 - 1.6, width * 8 - 1.6, height]);
    for(x = [1 : columns]) for(y = [1 : rows]) {
       centerX = 0.2 + (x - 0.5) * (length * 8 - 2) / columns;
       centerY = 0.2 + (y - 0.5) * (width * 8 - 2) / rows;
       // part
       translate([centerX, centerY, height]) rotate(turning) FCI_91601_308();
    } 
    // text side
    translate([0.3, (width * 8 - 1.6) / 2, 3]) rotate([90,0,-90]) linear_extrude(1) text(text=Text1, size=4, halign="center", valign="center");
    translate([(length * 8 - 1.6) -0.3, (width * 8 - 1.6) / 2, 3]) rotate([90,0,90]) linear_extrude(1) text(text=Text1, size=4, halign="center", valign="center");
    translate([(length * 8 - 1.6) / 2, 0.3, 3]) rotate([90,0,0]) linear_extrude(1) text(text=Text2, size=4, halign="center", valign="center");
    translate([(length * 8 - 1.6) / 2, (width * 8 - 1.6) - 0.3, 3]) rotate([90,0,180]) linear_extrude(1) text(text=Text2, size=4, halign="center", valign="center");

    
    // optional text top
//    translate([(length * 8 - 1.6) / 2, (width * 8 - 1.6) / 2 +2.5, height - 0.3 - 8]) rotate([0,0,0]) linear_extrude(1) text("ENCITECH", size=4, halign="center", valign="center");
//    translate([(length * 8 - 1.6) / 2, (width * 8 - 1.6) / 2 -2.5, height - 0.3 - 8]) rotate([0,0,0]) linear_extrude(1) text("RJJS-88-143-E1V-039", size=4, halign="center", valign="center");
}
sm1X=53;
sm1Y=3;
sm2X=416;
sm2Y=3;

HomeX=65;
HomeY=73;

nozzleTrayX=278;
nozzleTrayY=0;


translate([0,0,-10]) color("LightSlateGray") square([762,545]); // space inside PNP
translate([sm1X,sm1Y -2,-9]) color("White",0.9) difference() { cube([224, 500, 1]); for(x = [4 : 8 : 224]) for(y = [6 : 8 : 500]) translate([x,y, 0.5]) cube([4.8, 4.8, 1.2], center=true);} // sheet metal
translate([sm2X,sm2Y -2,-9]) color("White",0.9) difference() { cube([248, 500, 1]); for(x = [4 : 8 : 248]) for(y = [6 : 8 : 500]) translate([x,y, 0.5]) cube([4.8, 4.8, 1.2], center=true);} // sheet metal
%translate([66,74,-6]) color("LemonChiffon", 0.25) square([585,415]); // camera
%translate([62.87,-4.75,-5]) color("Plum", 0.25) square([590,415]); // nozzle
// Grid on second sheet metal
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([0*8, 9*8-0.5]) square([232,1]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([0*8, 16*8-0.5]) square([232,1]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([0*8, 23*8-0.5]) square([232,1]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([0*8, 30*8-0.5]) square([232,1]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([0*8, 37*8-0.5]) square([232,1]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([0*8, 44*8-0.5]) square([232,1]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([10*8-0.5, 9*8]) square([1,336]);
%translate([sm2X, sm2Y, -4]) color("Green", 0.3) translate([20*8, 9*8]) square([8,336]);

// areas in front of the PCB
%translate([278,73,-0.1]) color("White", 0.2)  square([135,75]);
%translate([278, 0,-0.1]) color("White", 0.2)  square([136,72]);


// other machine features
%translate([nozzleTrayX + 54/2, nozzleTrayY + 13 + 57/2, 0]) union(){  color("SlateGray", 0.4)  square([54,57], center=true); color("Blue", 0.6) text("Nozzle Tip", halign="center", valign="center", size=8);};

%translate([nozzleTrayX + 56 + 20, nozzleTrayY + 56 + 8, 0]) union(){  color("SlateGray", 0.4)  square([40-1.6,16-1.6], center=true); color("Blue", 0.6) text("Trash", halign="center", valign="center", size=8);};

%translate([278,149,0]) color("SlateGray", 0.4)  square([130,190]);
%translate([278 + 65, 148 + 85,0]) color("Blue", 0.7) rotate([0,0,90]) text("PCB Area", halign="center", valign="center");

%translate([HomeX + 289, HomeY + 318,0]) color("SlateGray", 0.4)  circle(d=105, $fn=6);
%translate([HomeX + 289, HomeY + 318,0]) color("Blue", 0.7) text("Up Cam", halign="center", valign="center");


%translate([HomeX + 226.5 + 22 + 65/2, HomeY + 10.6, 0]) union(){  color("SlateGray", 0.4)  square([65,20], center=true); color("Blue", 0.6) text("DropBoxes", halign="center", valign="center", size=8);};


// HeapFeeder
%translate([sm1X + 8.8 + 0*72,sm1Y + 0.8 + 0*136, 0]) union(){  color("DodgerBlue", 0.4)  square([72-1.6, 136-1.6]); translate([40,20,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("HeapFeeder 1");};
%translate([sm1X + 8.8 + 1*72,sm1Y + 0.8 + 0*136, 0]) union(){  color("DodgerBlue", 0.4)  square([72-1.6, 136-1.6]); translate([40,20,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("HeapFeeder 2");};
%translate([sm1X + 8.8 + 2*72,sm1Y + 0.8 + 0*136, 0]) union(){  color("DodgerBlue", 0.4)  square([72-1.6, 136-1.6]); translate([40,20,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("HeapFeeder 3");};
%translate([sm1X + 8.8 + 0*72,sm1Y + 0.8 + 1*136, 0]) union(){  color("DodgerBlue", 0.4)  square([72-1.6, 136-1.6]); translate([40,20,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("HeapFeeder 4");};
%translate([sm1X + 8.8 + 1*72,sm1Y + 0.8 + 1*136, 0]) union(){  color("DodgerBlue", 0.4)  square([72-1.6, 136-1.6]); translate([40,20,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("HeapFeeder 5");};
%translate([sm1X + 8.8 + 2*72,sm1Y + 0.8 + 1*136, 0]) union(){  color("DodgerBlue", 0.4)  square([72-1.6, 136-1.6]); translate([40,20,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("HeapFeeder 6");};

// BlindsFeeder
%translate([sm1X + 0.8 + 16,sm1Y + 0.8 + 272, 0]) union(){  color("Cyan", 0.4)  square([104-1.6, 144-1.6]); color("Blue", 0.6) { translate([45,72,0.1]) rotate([0,0,90]) text("BlindsFeeder 1", halign="center");  translate([65,72,0.1]) rotate([0,0,90]) text("6x8mm, 5x12mm", halign="center", size=8);}; };
%translate([sm2X + 0.8 + 0,sm2Y + 0.8 + 352, 0]) union(){  color("Cyan", 0.4)  square([160-1.6, 56-1.6]);  color("Blue", 0.6) {translate([80,35, 0.1]) text("BlindsFeeder 2", halign="center"); translate([80,15, 0.1]) text("4x8mm, 5x12mm, 2x16mm", halign="center", size=8);}};
%translate([sm2X + 0.8 + 168,sm2Y + 0.8 + 37*8, 0]) union(){  color("Cyan", 0.4)  square([64-1.6, 112-1.6]); color("Blue", 0.6) { translate([25, 56,0.1]) rotate([0,0,90]) text("BlindsFeeder 3", halign="center");  translate([45,56,0.1]) rotate([0,0,90]) text("7x8mm, 2x12mm", halign="center", size=8);}; };

// StripFeeder
%translate([sm1X + 0.8 + 120,sm1Y + 0.8 + 272, 0]) union(){  color("Turquoise", 0.4)  square([104-1.6, 144-1.6]); translate([45,72,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("StripFeeder 1", halign="center");translate([65,72,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("5x16mm, 2x24mm", size=8, halign="center");};
%translate([sm2X + 0.8 + 80 + 40 -0.8,sm2Y + 0.8 + 240 + 56 -0.8, 0]) union(){  color("Turquoise", 0.4)  square([80-1.6, 112-1.6], center=true); rotate([0,0,90])  color("Blue", 0.6) { translate([0,15,0]) text("StripFeeder 2", halign="center", valign="center"); translate([0,0,0]) text("1x24mm, 1x32mm", size=8, halign="center", valign="center");translate([0,-15,0.1])text("1x44mm", size=8, halign="center", valign="center");}; };
%translate([sm2X + 0.8 + 80 + 39.2, sm2Y + 0.8 + 72 + 27.2, 0]) union(){  color("Turquoise", 0.4)  square([80-1.6, 56-1.6], center=true); color("Blue", 0.6) { translate([0,15,0]) text("Strip 3", halign="center", valign="center"); translate([0,0,0]) text("1x24mm", size=8, halign="center", valign="center");translate([0,-15,0.1])text("1x44mm", size=8, halign="center", valign="center");};};
%translate([sm2X + 0.8 + 000,sm2Y + 0.8 + 000, 0]) union(){  color("Turquoise", 0.4)  square([232-1.6, 72-1.6]); translate([116,40,0.1]) color("Blue", 0.6) text(halign="center", text="StripFeeder no Vision"); translate([116,20,0.1]) color("Blue", 0.6) text(size=8, halign="center", text="Capacitors - 2x 10mm, 1x6.3mm");};

// LoosePartFeeder
%translate([278 + 67.5,72 + 43.5,0]) color("Blue", 0.7) text("LoosePartFeeder", halign="center");

%translate([HomeX + 226.5 + 0 * 26.6, HomeY + 10.6 + 0 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T01", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 4 * 26.6, HomeY + 10.6 + 0 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T02", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 0 * 26.6, HomeY + 10.6 + 1 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T03", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 1 * 26.6, HomeY + 10.6 + 1 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T04", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 2 * 26.6, HomeY + 10.6 + 1 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T05", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 3 * 26.6, HomeY + 10.6 + 1 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T06", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 4 * 26.6, HomeY + 10.6 + 1 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T07", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 0 * 26.6, HomeY + 10.6 + 2 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T08", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 1 * 26.6, HomeY + 10.6 + 2 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T09", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 2 * 26.6, HomeY + 10.6 + 2 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T10", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 3 * 26.6, HomeY + 10.6 + 2 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T11", halign="center", valign="center",, size=8);};
%translate([HomeX + 226.5 + 4 * 26.6, HomeY + 10.6 + 2 * 25, 0]) union(){  color("YellowGreen", 0.4)  square([25,20], center=true); color("Blue", 0.6) text("T12", halign="center", valign="center",, size=8);};


// TrayFeeder
%translate([nozzleTrayX + 56 + 40, nozzleTrayY + 28, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6,56-1.6], center=true); color("Blue", 0.6) {translate([0,10,0]) text("Tray 1", halign="center", valign="center");translate([0,-10,0]) text("2x2", halign="center", valign="center", size=8);}};
%translate([nozzleTrayX + 56 + 40 + 20, nozzleTrayY + 56 + 8, 0]) union(){  color("PowderBlue", 0.4)  square([40-1.6,16-1.6], center=true); color("Blue", 0.6) text("Tray 2", halign="center", valign="center", size=8);};
%translate([sm2X + 0.8 + 00, sm2Y + 0.8 + 72, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6, 56-1.6]); translate([40,32,0.1]) color("Blue", 0.6) text("Tray 3", halign="center"); translate([40,15,0.1]) color("Blue", 0.6) text("2x2", halign="center", size=8);};
%translate([sm2X + 0.8 + 0, sm2Y + 0.8 + 72 + 1* 56, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6, 56-1.6]); translate([40,32,0.1]) color("Blue", 0.6) text("Tray 4", halign="center"); translate([40,15,0.1]) color("Blue", 0.6) text("2x4", halign="center", size=8);};
%translate([sm2X + 0.8 + 0, sm2Y + 0.8 + 72 + 2* 56, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6, 56-1.6]); translate([40,32,0.1]) color("Blue", 0.6) text("Tray 5", halign="center"); translate([40,15,0.1]) color("Blue", 0.6) text("2x4", halign="center", size=8);};
%translate([sm2X + 0.8 + 0, sm2Y + 0.8 + 72 + 3* 56, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6, 56-1.6]); translate([40,32,0.1]) color("Blue", 0.6) text("Tray 6", halign="center"); translate([40,15,0.1]) color("Blue", 0.6) text("2x4", halign="center", size=8);};


// Placeholder

%translate([sm2X + 0.8 + 0, sm2Y + 0.8 + 72 + 4* 56, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6, 56-1.6]); translate([40,32,0.1]) color("Blue", 0.6) text("TBD", halign="center"); translate([40,15,0.1]) color("Blue", 0.6) text("TBD", halign="center", size=8);};

%translate([sm2X + 0.8 + 168,sm2Y + 0.8 + 23*8, 0]) union(){  color("PowderBlue", 0.4)  square([64-1.6, 112-1.6]); translate([40,10,0.1]) rotate([0,0,90]) color("Blue", 0.6) text("TBD");};
%translate([sm2X + 0.8 + 168,sm2Y + 0.8 + 09*8, 0]) union(){  color("PowderBlue", 0.4)  square([64-1.6, 112-1.6]); translate([40,10,0.1]) rotate([0,0,90]) color("Blue", 0.6) text("TBD");};


%translate([sm2X + 0.8 + 80,sm2Y + 0.8 + 128, 0]) union(){  color("PowderBlue", 0.4)  square([80-1.6, 112-1.6]); translate([30,40,0.1]) rotate([0,0,90])  color("Blue", 0.6) text("TBD");};

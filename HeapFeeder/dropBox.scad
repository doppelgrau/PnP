$fn=90;

difference() {
    intersection() {
        translate([0, 0, 8.75]) cube([19.5, 19.5, 20], center=true);
        cylinder(h=20, d=25);
    }
    translate([0, 0, 12.5]) union(){
        cylinder(h=0.45, d=12.3);
        translate([0, 0, 0.45]) cylinder(h=6.5, d1=12.3, d2=21); 
    }

}


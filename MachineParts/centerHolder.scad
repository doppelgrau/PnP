module loosePart(label="todo", center=[0,0,0], border=1.5) {
    translate(center) {
        union() {
            translate([0, 0, border]) cube([35, 30, 20]);
            translate([0, 0, 0]) cube([25, 20, 20]);
            translate([11.5, 20.5, border - 0.3]) linear_extrude(0.5) text(label, size=4, font="Liberation Sans:style=Bold", halign="center");

        };
    };
};


difference(){
    translate([0, 0, -13]) cube([135,76.6,12.9]);
    // platz für die drop boxes und den trash
    translate([1.6 + 26.6 + 5.4 + 0 * 23, 2.4,-13]) cube([20.6, 20.6, 20]);
    translate([1.6 + 26.6 + 5.4  + 1 * 23, 2.4,-13]) cube([20.6, 20.6, 20]);
    translate([1.6 + 26.6 + 5.4  + 2 * 23, 2.4,-13]) cube([20.6, 20.6, 20]);
    // boxes
    loosePart("-1", center=[1.6 + 0 * 26.6, 1.6 + 0 * 25, -1], border=0.9);
    loosePart("-1", center=[1.6 + 4 * 26.6, 1.6 + 0 * 25, -1], border=0.9);
    
    loosePart("-1", center=[1.6 + 0 * 26.6, 1.6 + 1 * 25, -1], border=0.9);
    loosePart("-2", center=[1.6 + 1 * 26.6, 1.6 + 1 * 25, -2]);
    loosePart("-3", center=[1.6 + 2 * 26.6, 1.6 + 1 * 25, -3]);
    loosePart("-3", center=[1.6 + 3 * 26.6, 1.6 + 1 * 25, -3]);
    loosePart("-6", center=[1.6 + 4 * 26.6, 1.6 + 1 * 25, -6]);

    translate([0, 51.6, -4.5]) cube([5,26.6,20]);
    loosePart("-6",  center=[1.6 + 0 * 26.6, 1.6 + 2 * 25, -6]);
    loosePart("-8",  center=[1.6 + 1 * 26.6, 1.6 + 2 * 25, -8]);
    loosePart("-8",  center=[1.6 + 2 * 26.6, 1.6 + 2 * 25, -8]);
    loosePart("-10", center=[1.6 + 3 * 26.6, 1.6 + 2 * 25, -10]);
    loosePart("-10", center=[1.6 + 4 * 26.6, 1.6 + 2 * 25, -10]);

}
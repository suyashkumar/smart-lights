use <scad_modules/servo_clip_with_screws.scad>;
// 41
$fn = 30;
base_width = 65;
base_length = 120; 
base_depth = 3;

cutout_x = 24;
cutout_y = 21;
cutout_width = 34;
cutout_height = 67;

screw_x = 40;
screw_1_y = cutout_y-16;
screw_2_y = cutout_y + cutout_height + 16;
screw_dia = 5;

module face_plate() {
    difference() {
        cube([base_width, base_length, base_depth]);
        translate([cutout_x, cutout_y, 0])cube([cutout_width, cutout_height, base_depth]);
        translate([screw_x, screw_1_y, base_depth/2])cylinder(d=screw_dia, h=base_depth, center=true);
        translate([screw_x, screw_2_y, base_depth/2])cylinder(d=screw_dia, h=base_depth, center=true);
    }
}

module half_light_switch() {
    union() {
        face_plate();
        translate([22, cutout_y + 21 + 4.5 , 1])rotate([0,0,90])servo_clip();
    }
}

half_light_switch();
translate([2*base_width, 0, 0])mirror([1, 0, 0])half_light_switch();
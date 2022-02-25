bed_width = 1530;
bed_height = 500;
n_slats = 8;
slat_width = 150;

wide_support_thickness = 30;

mattress_height = 300;
mattress_length = 2030;

head_height = mattress_height + 300;
head_width = bed_width + 800;
head_thickness = 30;

bed_length = mattress_length + head_thickness;

side_table_width = (head_width - bed_width) / 2;

module long_support() {
  color([0, 0.5, 0.5]) {
    translate([-30, bed_width / 4, 300]) cube([bed_length + 60, 18, 200]);
  }
}

module wide_support() {
  translate([0, 0, 0]) cube([wide_support_thickness, bed_width, 500]);
}

module slat() {
  color([0.5, 0.5, 0]) {
    translate([0, 0, bed_height]) cube([bed_length, bed_width / 2, 18]);
  }
}

module mattress() {
  translate([head_thickness, 0, bed_height + 18]) color([0, 0, 1]) cube([mattress_length, bed_width, mattress_height]);
}

module head() {
  translate([0, -(head_width - bed_width) / 2, bed_height + 18]) cube([head_thickness, head_width, head_height]);
  /* color([0, 1, 0]) { */
  /*   translate([0, -(head_width - bed_width) / 2, 0]) cube([18, (head_width - bed_width) / 2, bed_height + head_height + 18]); */
  /*   translate([0, bed_width, 0]) cube([18, (head_width - bed_width) / 2, bed_height + head_height + 18]); */
  /* } */
}

module head_support() {
  translate([-50, 0, 0]) cube([50, 30, bed_height + 18 + head_height / 2]);
}

module side_table() {
  translate([0, -side_table_width, bed_height]) cube([side_table_width, side_table_width, 18]);
}

module side_support() {
  translate([70, 0, bed_height - 30]) cube([30, 500, 30]);
}

long_support();
translate([0, 2 * (bed_width - bed_width / 2 - 18) / 2, 0]) long_support();

wide_support();
translate([(bed_length - wide_support_thickness) / 2, 0, 0]) wide_support();
translate([2 * (bed_length - wide_support_thickness) / 2, 0, 0]) wide_support();

slat();
translate([0, bed_width / 2, 0]) slat();

mattress();

head();

translate([0, 200, 0]) head_support();
translate([0, bed_width - 30 - 200, 0]) head_support();

side_table();
translate([0, bed_width + side_table_width, 0]) side_table();

translate([0, -200, 0]) side_support();
translate([170, -200, 0]) side_support();
translate([0, bed_width - 500 + 200, 0]) side_support();
translate([170, bed_width - 500 + 200, 0]) side_support();

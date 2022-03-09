bed_width = 1530;
bed_height = 500;
n_slats = 8;
slat_width = 150;

long_support_thickness = 18;
long_support_height = 200;
wide_support_thickness = 30;
slat_thickness = 18;

mattress_height = 300;
mattress_length = 2030;

head_height = 600;  // mattress_height + 300;
head_width = 2250;  // bed_width + 800;
head_thickness = 30;

bed_length = mattress_length + head_thickness;

side_table_width = (head_width - bed_width) / 2;

module long_support() {
  f = 0.05;
  d = bed_length * f;
  x = bed_length - d;
  y = long_support_thickness;
  z = long_support_height;
  color([0, 0.5, 0.5]) {
    translate([0, 0, bed_height - long_support_height]) cube([x, y, z]);
  }
  echo("Long support: ", x, y, z);
}

module all_long_supports() {
  d = bed_width / 4;
  o1 = d;
  o2 = bed_width - d - long_support_thickness;
  translate([0, o1]) long_support();
  translate([0, o2]) long_support();
}

module wide_support() {
  f = 0.1;
  d = bed_width * f;
  w = bed_width - 2 * d;
  x = wide_support_thickness;
  y = w;
  z = bed_height;
  translate([0, d, 0]) cube([x, y, z]);
  echo("Wide support: ", x, y, z);
}

module all_wide_supports() {
  f = 0.1;
  d = bed_length * f;
  translate([d, 0, 0]) wide_support();
  translate([d + (bed_length - wide_support_thickness - 2 * d) / 2, 0, 0]) wide_support();
  translate([d + 2 * (bed_length - wide_support_thickness - 2 * d) / 2, 0, 0]) wide_support();
}

module slat() {
  x = bed_length;
  y = bed_width / 2;
  z = slat_thickness;
  color([0.5, 0.5, 0]) {
    translate([0, 0, bed_height]) cube([x, y, z]);
  }
  echo("Slat: ", x, y, z);
}

module mattress() {
  translate([head_thickness, 0, bed_height + 18]) color([0, 0, 1]) cube([mattress_length, bed_width, mattress_height]);
}

module head() {
  x = head_thickness;
  y = head_width;
  z = head_height;
  translate([0, -(head_width - bed_width) / 2, bed_height + 18]) cube([x, y, z]);
  echo("Head: ", x, y, z);
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

all_long_supports();

all_wide_supports();

slat();
translate([0, bed_width / 2, 0]) slat();

mattress();

head();

/* translate([0, 200, 0]) head_support(); */
/* translate([0, bed_width - 30 - 200, 0]) head_support(); */

/* side_table(); */
/* translate([0, bed_width + side_table_width, 0]) side_table(); */

/* translate([0, -200, 0]) side_support(); */
/* translate([170, -200, 0]) side_support(); */
/* translate([0, bed_width - 500 + 200, 0]) side_support(); */
/* translate([170, bed_width - 500 + 200, 0]) side_support(); */

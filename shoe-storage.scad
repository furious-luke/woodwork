use <utils.scad>;

width = 1000;
height = 560;
bucket_height = 150;
depth = 300;
thick = 30;
thin_thick = 18;

shoe_pair_width = 220;
shoe_pair_depth = 350;
shoe_pair_height = 150;
boot_pair_height = 150;

module lid() {
  translate([0, 0, thick/2]) cube([width, depth, thick], true);
}

module side() {
  side_height = height - thick;
  side_depth = depth - thick;
  translate([0, 0, side_height/2]) color([1, 0.5, 0.5]) cube([thick, side_depth, side_height], true);
}

module bottom() {
  bottom_width = width - 2*thick;
  bottom_depth = depth - 2*thick;
  translate([0, 0, thin_thick/2]) color([0.5, 1, 0.5]) cube([bottom_width, bottom_depth, thin_thick], true);
}

module front() {
  front_height = bucket_height - thick;
  translate([0, 0, front_height/2]) color([0.5, 0.5, 1]) cube([width, thick, front_height], true);
}

module back() {
  back_width = width - 2*thick;
  back_height = bucket_height - thick;
  translate([0, 0, back_height/2]) color([0.5, 0.5, 1]) cube([back_width, thick, back_height], true);
}

translate([0, 0, height - thick]) lid();
translate([-width/2 + thick/2, thick/2, 0]) side();
translate([+width/2 - thick/2, thick/2, 0]) side();
translate([0, 0, height - bucket_height]) bottom();
translate([0, depth/2 - thick/2, height - bucket_height]) back();
translate([0, -depth/2 + thick/2, height - bucket_height]) front();

translate([0, 0, 50]) drawer(width, (height - bucket_height - 50) / 2, depth, thick, thick, thin_thick, thin_thick, thin_thick);
translate([0, 0, 50 + (height - bucket_height - 50)/2]) drawer(width, (height - bucket_height - 50) / 2, depth, thick, thick, thin_thick, thin_thick, thin_thick);

translate([0, -depth/2 + thick/2, 25]) cube([width, thick, 50], true);

// translate([0, 0, height/2]) cube([width, depth, height], true);

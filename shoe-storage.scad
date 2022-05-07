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
  x = width;
  y = depth;
  z = thick;
  translate([0, 0, thick/2]) cube([x, y, z], true);
  echo("Lid: ", x, y ,z);
}

module side() {
  side_height = height - thick;
  side_depth = depth - thin_thick;
  translate([0, 0, side_height/2]) color([1, 0.5, 0.5]) cube([thick, side_depth, side_height], true);
  echo("Side: ", thick, side_depth, side_height);
}

module bottom() {
  x = width - 2*thick;
  y = depth - 2*thin_thick;
  z = thin_thick;
  translate([0, 0, thin_thick/2]) color([0.5, 1, 0.5]) cube([x, y, z], true);
  echo ("Bottom: ", x, y, z);
}

module front() {
  x = width;
  y = thin_thick;
  z = bucket_height - thick;
  translate([0, 0, z/2]) color([0.5, 0.5, 1]) cube([x, y, z], true);
  echo("Front: ", x, y, z);
}

module back() {
  x = width - 2*thick;
  y = thin_thick;
  z = bucket_height - thick;
  translate([0, 0, z/2]) color([0.5, 0.5, 1]) cube([x, y, z], true);
  echo("Back: ", x, y, z);
}

translate([0, 0, height - thick]) lid();
translate([-width/2 + thick/2, thin_thick/2, 0]) side();
translate([+width/2 - thick/2, thin_thick/2, 0]) side();
translate([0, 0, height - bucket_height]) bottom();
translate([0, depth/2 - thin_thick/2, height - bucket_height]) back();
translate([0, -depth/2 + thin_thick/2, height - bucket_height]) front();

translate([0, 0, 50]) drawer(width, (height - bucket_height - 50) / 2, depth, thick, thin_thick, thin_thick, thin_thick, thin_thick);
translate([0, 0, 50 + (height - bucket_height - 50)/2]) drawer(width, (height - bucket_height - 50) / 2, depth, thick, thin_thick, thin_thick, thin_thick, thin_thick);

translate([0, -depth/2 + thin_thick/2, 25]) cube([width, thin_thick, 50], true);
echo("Lower front: ", width, thin_thick, 50);

// translate([0, 0, height/2]) cube([width, depth, height], true);

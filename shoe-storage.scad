width = 1000;
height = 560;
bucket_height = 150;
depth = 300;
thick = 30;
thin_thick = 15;

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

module drawer() {
  drawer_width = width;
  drawer_height = (height - bucket_height - 50)/2;
  drawer_depth = depth;
  front_thickness = 30;
  side_thickness = front_thickness/2;
  back_thickness = side_thickness;
  bottom_thickness = side_thickness;
  side_offset = 30;
  inner_width = drawer_width - 2*side_offset;
  inner_depth = drawer_depth - front_thickness - back_thickness;
  side_height = (2/3)*drawer_height;
  // Sides.
  translate([-inner_width/2 + side_thickness/2, (front_thickness - back_thickness)/2, side_height/2])
    color([0, 1, 0])
    cube([side_thickness, inner_depth, side_height], true);
  translate([inner_width/2 - side_thickness/2, (front_thickness - back_thickness)/2, side_height/2])
    color([0, 1, 0])
    cube([side_thickness, inner_depth, side_height], true);
  // Bottom.
  translate([0, (front_thickness - back_thickness)/2, bottom_thickness/2])
    color([1, 0, 0])
    cube([inner_width - 2*side_thickness, inner_depth, bottom_thickness], true);
  // Front/back.
  translate([0, drawer_depth/2 - back_thickness/2, side_height/2])
    cube([inner_width, back_thickness, side_height], true);
  translate([0, -drawer_depth/2 + front_thickness/2, drawer_height/2])
    cube([drawer_width, front_thickness, drawer_height], true);
}

translate([0, 0, height - thick]) lid();
translate([-width/2 + thick/2, thick/2, 0]) side();
translate([+width/2 - thick/2, thick/2, 0]) side();
translate([0, 0, height - bucket_height]) bottom();
translate([0, depth/2 - thick/2, height - bucket_height]) back();
translate([0, -depth/2 + thick/2, height - bucket_height]) front();

translate([0, 0, 50]) drawer();
translate([0, 0, 50 + (height - bucket_height - 50)/2]) drawer();

translate([0, -depth/2 + thick/2, 25]) cube([width, thick, 50], true);

// translate([0, 0, height/2]) cube([width, depth, height], true);

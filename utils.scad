module drawer(width, height, depth, inset, front_thickness, side_thickness, back_thickness, bottom_thickness) {
  drawer_width = width;
  drawer_height = height - 2;
  drawer_depth = depth;
  side_offset = inset;
  inner_width = drawer_width - 2*side_offset;
  inner_depth = drawer_depth - front_thickness - back_thickness;
  side_height = (2/3)*drawer_height;
  translate([0, 0, 1]) {
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
    difference() {
      translate([0, -drawer_depth/2 + front_thickness/2, drawer_height/2])
        cube([drawer_width, front_thickness, drawer_height], true);
      translate([0, -(drawer_depth + 100)/2 + front_thickness/2, drawer_height / 2])
        rotate([90, 0, 0])
        cylinder(100, 30, 30, true);
    }
  }
}

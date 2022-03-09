v_height = 640;
h_width = 450;
thickness = 18;

support_width = 100;

module h_board(width=h_width, height=thickness, depth=300) {
  cube([width, depth, height], true);
}

module v_board(width=v_height, height=thickness, depth=300) {
  translate([thickness/2, 0, v_height/2]) rotate([0, -90, 0]) cube([width, depth, height], true);
}

translate([0, 0, -thickness/2]) h_board();
difference() {
  translate([0, 0, v_height + thickness/2]) h_board();
  // translate([-h_width/2 + 60/2 + 30 + 10, 100]) cylinder(10000, 60, center=true);
}
translate([-h_width/2, 0, 0]) v_board();
translate([-h_width/2 + support_width/2 + thickness, -50, v_height/2]) rotate([-90, -90, 0]) cube([v_height, support_width, 15], true);
translate([-h_width/2 + support_width/2 + thickness, 50, v_height/2]) rotate([-90, -90, 0]) cube([v_height, support_width, 15], true);

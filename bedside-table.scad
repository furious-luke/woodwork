v_height = 640;
h_width = 450;

module h_board(width=h_width, height=30, depth=300) {
  cube([width, depth, height], true);
}

module v_board(width=v_height, height=30, depth=300) {
  translate([30/2, 0, v_height/2]) rotate([0, -90, 0]) cube([width, depth, height], true);
}

translate([0, 0, -30/2]) h_board();
difference() {
  translate([0, 0, v_height + 30/2]) h_board();
  translate([-h_width/2 + 60/2 + 30 + 10, 100]) cylinder(10000, 60, center=true);
}
color([255, 0, 0]) translate([-h_width/2, 0, 0]) v_board();
translate([-h_width/2 + 150/2 + 30, -50, v_height/2]) rotate([-90, -90, 0]) cube([v_height, 150, 15], true);
translate([-h_width/2 + 150/2 + 30, 50, v_height/2]) rotate([-90, -90, 0]) cube([v_height, 150, 15], true);

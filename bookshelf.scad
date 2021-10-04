module board(width=1000, height=30, depth=300) {
  cube([width, depth, height], true);
}

module align_left(width, base_width) {
  translate([-base_width/2 + 30/2, 0]) rotate([0, -90]) translate([width/2 + 30/2, 0]) children();
}

module align_right(width, base_width) {
  translate([base_width/2 - 30/2, 0]) rotate([0, -90]) translate([width/2 + 30/2, 0]) children();
}

module left_vertical_board(width, base_width) {
  align_left(width=width, base_width=base_width) {
    board(width=width);
  }
}

module right_vertical_board(width, base_width) {
  align_right(width=600, base_width=2000) {
    board(width=600);
  }
}

translate([0, 0, 30/2]) {
  translate([0, 0]) board(width=30);
  translate([800, 0]) board(width=30);
}

translate([0, 0, 30 + 30/2]) {
  // base
  translate([30/2, 0]) board(width=1600, depth=300 + 1);

  w = 710 + 30 + 100;
  // support
  color([1, 0, 0]) translate([0, 0, -30*2]) left_vertical_board(width=w, base_width=1600);
  translate([-800 - 200 + 30/2, 0, w - 30 - 30/2]) board(width=1600, depth=300 - 1);

  translate([-1600 * 5/24 + 30, 0, 846 * 2/3]) board(width=1600 * 7/12);
  translate([-1600 * 3/24 + 30, 0, 846 * 1/3]) board(width=1600 * 9/12);
}

translate([-1305, 0, 710/2]) {
  translate([-950/2 + 30/2, -500/4]) rotate([0, -90]) board(width=710, depth=500);
  translate([950/2 - 30/2, -500/4]) rotate([0, -90]) board(width=710, depth=500);
  translate([0, -500/4, 710/2 + 30/2]) board(width=950, depth=500);
}

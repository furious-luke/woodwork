height = 850;
width = 200;
depth = 550;
front_thickness = 20;
side_thickness = 20;
panel_height = 100;
support_depth = panel_height;

module front() {
  color([0.7, 0.7, 0.9]) cube([width, front_thickness, height]);
}

module side_panel() {
  color([0.7, 0.9, 0.7]) cube([side_thickness, depth - front_thickness, panel_height]);
}

module support() {
  color([0.9, 0.7, 0.7]) cube([side_thickness, support_depth, height - 2*panel_height]);
}

front();
translate([width - side_thickness, front_thickness]) side_panel();
translate([width - side_thickness, front_thickness, height - panel_height]) side_panel();
translate([width - side_thickness, front_thickness, panel_height]) support();
translate([width - side_thickness, depth - support_depth, panel_height]) support();

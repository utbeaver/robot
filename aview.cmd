default units len=meter mass=kg force=newton
model create model=.sliderActuator fit_to_view=no
part attrib part_name=ground name_vis=off
part modify rigid_body mass_properties part_name=ground material=.materials.steel
force create body gravitational gravity=gravity x_comp=0.000000 y_comp=-9.806650 z_comp=0.000000
default attr size_of_icon=0.021000 
model attr model=.sliderActuator size_of_icon=0.021000
output set results model = .sliderActuator formatted = off
 output set results model =.sliderActuator xrf = off
int dialog dis dialog=.gui.moag
simulation set choice=cplusplus
defaults command_file on_error = ignore_command echo_commands = off update_screen = off
executive set numerical model = .sliderActuator integrator = hht
executive set numerical model = .sliderActuator hmax = 1.0e-3
defaults interface style=classic
view zoom auto=on
def att ico="off"
marker create marker_name=.sliderActuator.ground.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ground.cm visibility=on
marker create marker_name=.sliderActuator.ground.aligned location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, -90.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ground.aligned visibility=on
marker create marker_name=.sliderActuator.ground.ground_marker location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ground.ground_marker visibility=on
marker create marker_name=.sliderActuator.ground.LeftRevJ_marJ location=0.000000, 0.000000, 0.000000 orientation=9.712872, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.LeftRevJ_marJ visibility=on
marker create marker_name=.sliderActuator.ground.crank_linkLF_marI location=-0.086603, 0.050000, 0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.ground.crank_linkLF_marI visibility=on
marker create marker_name=.sliderActuator.ground.crank_linkLB_marI location=-0.086603, 0.050000, -0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.ground.crank_linkLB_marI visibility=on
marker create marker_name=.sliderActuator.ground.J11_marJ location=-0.047426, 0.015835, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.J11_marJ visibility=on
marker create marker_name=.sliderActuator.ground.J11B_marJ location=-0.047426, 0.015835, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.J11B_marJ visibility=on
marker create marker_name=.sliderActuator.ground.triangleFplatem1 location=0.000000, 0.000000, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleFplatem1 visibility=on
marker create marker_name=.sliderActuator.ground.triangleFplatem2 location=-0.047426, 0.015835, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleFplatem2 visibility=on
marker create marker_name=.sliderActuator.ground.triangleFplatem3 location=-0.093797, 0.034672, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleFplatem3 visibility=on
marker create marker_name=.sliderActuator.ground.triangleFplatem4 location=-0.093797, -0.133333, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleFplatem4 visibility=on
marker create marker_name=.sliderActuator.ground.triangleFplatem5 location=-0.015835, -0.133333, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleFplatem5 visibility=on
marker create marker_name=.sliderActuator.ground.triangleFplatem6 location=-0.015835, -0.047426, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleFplatem6 visibility=on
geom create shape plate plate=.sliderActuator.ground.triangleF marker_name=.sliderActuator.ground.triangleFplatem1, .sliderActuator.ground.triangleFplatem2, .sliderActuator.ground.triangleFplatem3, .sliderActuator.ground.triangleFplatem4, .sliderActuator.ground.triangleFplatem5, .sliderActuator.ground.triangleFplatem6 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.ground.triangleF type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.ground.triangleBplatem1 location=0.000000, 0.000000, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleBplatem1 visibility=on
marker create marker_name=.sliderActuator.ground.triangleBplatem2 location=-0.047426, 0.015835, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleBplatem2 visibility=on
marker create marker_name=.sliderActuator.ground.triangleBplatem3 location=-0.093797, 0.034672, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleBplatem3 visibility=on
marker create marker_name=.sliderActuator.ground.triangleBplatem4 location=-0.093797, -0.133333, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleBplatem4 visibility=on
marker create marker_name=.sliderActuator.ground.triangleBplatem5 location=-0.015835, -0.133333, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleBplatem5 visibility=on
marker create marker_name=.sliderActuator.ground.triangleBplatem6 location=-0.015835, -0.047426, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.triangleBplatem6 visibility=on
geom create shape plate plate=.sliderActuator.ground.triangleB marker_name=.sliderActuator.ground.triangleBplatem1, .sliderActuator.ground.triangleBplatem2, .sliderActuator.ground.triangleBplatem3, .sliderActuator.ground.triangleBplatem4, .sliderActuator.ground.triangleBplatem5, .sliderActuator.ground.triangleBplatem6 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.ground.triangleB type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
geometry create shape extrusion extrusion_name = .sliderActuator.ground.cyn2 reference_marker=.sliderActuator.ground.ground_marker  points_for_profile= &
0.005000, 0.000000, -0.068125, &
0.004193, 0.002723, -0.068125, &
0.002034, 0.004568, -0.068125, &
-0.000782, 0.004938, -0.068125, &
-0.003346, 0.003716, -0.068125, &
-0.004830, 0.001294, -0.068125, &
-0.004755, -0.001545, -0.068125, &
-0.003147, -0.003886, -0.068125, &
-0.000523, -0.004973, -0.068125, &
0.002270, -0.004455, -0.068125, &
0.004330, -0.002500, -0.068125, &
0.005000, 0.000000, -0.068125 &
length_along_z_axis=0.136250 analytical=yes &
relative_to=.sliderActuator.ground.ground_marker
entity attributes entity_name=.sliderActuator.ground.cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ground.cyn2 render=filled
marker create marker_name=.sliderActuator.ground.J11__marJ location=-0.015835, -0.047426, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.J11__marJ visibility=on
marker create marker_name=.sliderActuator.ground.J11B__marJ location=-0.015835, -0.047426, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ground.J11B__marJ visibility=on
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_Brace
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_Brace material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_Brace visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_Brace.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.LeftRevJ_marI location=0.000000, 0.000000, 0.000000 orientation=9.712872, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.LeftRevJ_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.braceGeo location=0.000000, 0.050000, 0.000000 orientation=90.000000, -90.000000, -90.000000 relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI 

entity attributes entity_name=.sliderActuator.SLM11_Brace.braceGeo visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.halfBracef reference_marker=.sliderActuator.SLM11_Brace.braceGeo  points_for_profile= &
0.010000, -0.033750, -0.010000, &
0.033750, -0.033750, -0.010000, &
0.033750, 0.033750, -0.010000, &
0.010000, 0.033750, -0.010000, &
0.010000, 0.040000, -0.010000, &
0.040000, 0.040000, -0.010000, &
0.040000, -0.040000, -0.010000, &
0.010000, -0.040000, -0.010000, &
0.010000, -0.033750, -0.010000 &
length_along_z_axis=0.120000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBracef type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.halfBracef render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.halfBraceb reference_marker=.sliderActuator.SLM11_Brace.braceGeo  points_for_profile= &
-0.010000, -0.033750, -0.010000, &
-0.033750, -0.033750, -0.010000, &
-0.033750, 0.033750, -0.010000, &
-0.010000, 0.033750, -0.010000, &
-0.010000, 0.040000, -0.010000, &
-0.040000, 0.040000, -0.010000, &
-0.040000, -0.040000, -0.010000, &
-0.010000, -0.040000, -0.010000, &
-0.010000, -0.033750, -0.010000 &
length_along_z_axis=0.120000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBraceb type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.halfBraceb render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.halfBracef1 reference_marker=.sliderActuator.SLM11_Brace.braceGeo  points_for_profile= &
0.010000, -0.021250, -0.254480, &
0.015000, -0.021250, -0.254480, &
0.015000, 0.033750, -0.254480, &
0.010000, 0.021250, -0.254480, &
0.010000, 0.040000, -0.254480, &
0.021250, 0.040000, -0.254480, &
0.021250, -0.040000, -0.254480, &
0.010000, -0.040000, -0.254480, &
0.010000, -0.021250, -0.254480 &
length_along_z_axis=0.244480 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBracef1 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.halfBracef1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.halfBraceb1 reference_marker=.sliderActuator.SLM11_Brace.braceGeo  points_for_profile= &
-0.010000, -0.021250, -0.254480, &
-0.015000, -0.021250, -0.254480, &
-0.015000, 0.033750, -0.254480, &
-0.010000, 0.021250, -0.254480, &
-0.010000, 0.040000, -0.254480, &
-0.021250, 0.040000, -0.254480, &
-0.021250, -0.040000, -0.254480, &
-0.010000, -0.040000, -0.254480, &
-0.010000, -0.021250, -0.254480 &
length_along_z_axis=0.244480 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBraceb1 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.halfBraceb1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.halfBrace2 reference_marker=.sliderActuator.SLM11_Brace.braceGeo  points_for_profile= &
-0.021250, 0.000000, -0.410000, &
-0.015000, 0.000000, -0.410000, &
-0.015000, 0.033750, -0.410000, &
0.015000, 0.033750, -0.410000, &
0.015000, 0.000000, -0.410000, &
0.021250, 0.000000, -0.410000, &
0.021250, 0.040000, -0.410000, &
-0.021250, 0.040000, -0.410000, &
-0.021250, 0.000000, -0.410000 &
length_along_z_axis=0.155520 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBrace2 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.halfBrace2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.frontEarL reference_marker=.sliderActuator.SLM11_Brace.LeftRevJ_marI  points_for_profile= &
-0.010000, 0.000000, 0.020000, &
-0.009397, -0.003420, 0.020000, &
-0.007660, -0.006428, 0.020000, &
-0.005000, -0.008660, 0.020000, &
-0.001736, -0.009848, 0.020000, &
0.001736, -0.009848, 0.020000, &
0.005000, -0.008660, 0.020000, &
0.007660, -0.006428, 0.020000, &
0.009397, -0.003420, 0.020000, &
0.010000, -0.000000, 0.020000, &
0.010000, 0.010000, 0.020000, &
-0.010000, 0.010000, 0.020000, &
-0.010000, 0.000000, 0.020000 &
length_along_z_axis=0.020000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM11_Brace.frontEarL type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.frontEarL render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.BackEarL reference_marker=.sliderActuator.SLM11_Brace.LeftRevJ_marI  points_for_profile= &
-0.010000, 0.000000, -0.040000, &
-0.009397, -0.003420, -0.040000, &
-0.007660, -0.006428, -0.040000, &
-0.005000, -0.008660, -0.040000, &
-0.001736, -0.009848, -0.040000, &
0.001736, -0.009848, -0.040000, &
0.005000, -0.008660, -0.040000, &
0.007660, -0.006428, -0.040000, &
0.009397, -0.003420, -0.040000, &
0.010000, -0.000000, -0.040000, &
0.010000, 0.010000, -0.040000, &
-0.010000, 0.010000, -0.040000, &
-0.010000, 0.000000, -0.040000 &
length_along_z_axis=0.020000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM11_Brace.BackEarL type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.BackEarL render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.BackEarR reference_marker=.sliderActuator.SLM11_Brace.LeftRevJ_marI  points_for_profile= &
0.164480, 0.100000, -0.033750, &
0.163877, 0.103420, -0.033750, &
0.162140, 0.106428, -0.033750, &
0.159480, 0.108660, -0.033750, &
0.156216, 0.109848, -0.033750, &
0.152744, 0.109848, -0.033750, &
0.149480, 0.108660, -0.033750, &
0.146820, 0.106428, -0.033750, &
0.145083, 0.103420, -0.033750, &
0.144480, 0.100000, -0.033750, &
0.144480, 0.090000, -0.033750, &
0.164480, 0.090000, -0.033750, &
0.164480, 0.100000, -0.033750 &
length_along_z_axis=0.022500 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM11_Brace.BackEarR type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.BackEarR render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.FrontEarR reference_marker=.sliderActuator.SLM11_Brace.LeftRevJ_marI  points_for_profile= &
0.164480, 0.100000, 0.011250, &
0.163877, 0.103420, 0.011250, &
0.162140, 0.106428, 0.011250, &
0.159480, 0.108660, 0.011250, &
0.156216, 0.109848, 0.011250, &
0.152744, 0.109848, 0.011250, &
0.149480, 0.108660, 0.011250, &
0.146820, 0.106428, 0.011250, &
0.145083, 0.103420, 0.011250, &
0.144480, 0.100000, 0.011250, &
0.144480, 0.090000, 0.011250, &
0.164480, 0.090000, 0.011250, &
0.164480, 0.100000, 0.011250 &
length_along_z_axis=0.022500 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM11_Brace.FrontEarR type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.FrontEarR render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.BackEarF reference_marker=.sliderActuator.SLM11_Brace.LeftRevJ_marI  points_for_profile= &
0.410000, 0.100000, -0.021250, &
0.409397, 0.103420, -0.021250, &
0.407660, 0.106428, -0.021250, &
0.405000, 0.108660, -0.021250, &
0.401736, 0.109848, -0.021250, &
0.398264, 0.109848, -0.021250, &
0.395000, 0.108660, -0.021250, &
0.392340, 0.106428, -0.021250, &
0.390603, 0.103420, -0.021250, &
0.390000, 0.100000, -0.021250, &
0.390000, 0.090000, -0.021250, &
0.410000, 0.090000, -0.021250, &
0.410000, 0.100000, -0.021250 &
length_along_z_axis=0.010000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM11_Brace.BackEarF type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.BackEarF render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.FrontEarF reference_marker=.sliderActuator.SLM11_Brace.LeftRevJ_marI  points_for_profile= &
0.410000, 0.100000, 0.011250, &
0.409397, 0.103420, 0.011250, &
0.407660, 0.106428, 0.011250, &
0.405000, 0.108660, 0.011250, &
0.401736, 0.109848, 0.011250, &
0.398264, 0.109848, 0.011250, &
0.395000, 0.108660, 0.011250, &
0.392340, 0.106428, 0.011250, &
0.390603, 0.103420, 0.011250, &
0.390000, 0.100000, 0.011250, &
0.390000, 0.090000, 0.011250, &
0.410000, 0.090000, 0.011250, &
0.410000, 0.100000, 0.011250 &
length_along_z_axis=0.010000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM11_Brace.FrontEarF type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.FrontEarF render=filled
marker create marker_name=.sliderActuator.SLM11_Brace.part2_bracef_marI location=0.154480, 0.100000, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Brace.part2_bracef_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.part2_braceb_marI location=0.154480, 0.100000, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Brace.part2_braceb_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.part21_bracef_marI location=0.000000, 0.000000, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Brace.part21_bracef_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.crank_brace_f_marJ location=0.400000, 0.100000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Brace.crank_brace_f_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.J13_marJ location=0.377395, 0.166051, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.J13_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.J13B_marJ location=0.377395, 0.166051, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.J13B_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.plateFplatem1 location=-0.100254, -0.007014, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateFplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.plateFplatem2 location=-0.113751, 0.071839, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateFplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.plateFplatem3 location=-0.183064, -0.080547, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateFplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_Brace.plateF marker_name=.sliderActuator.SLM11_Brace.plateFplatem1, .sliderActuator.SLM11_Brace.plateFplatem2, .sliderActuator.SLM11_Brace.plateFplatem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateF type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_Brace.plateBplatem1 location=-0.100254, -0.007014, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateBplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.plateBplatem2 location=-0.113751, 0.071839, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateBplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.plateBplatem3 location=-0.183064, -0.080547, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateBplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_Brace.plateB marker_name=.sliderActuator.SLM11_Brace.plateBplatem1, .sliderActuator.SLM11_Brace.plateBplatem2, .sliderActuator.SLM11_Brace.plateBplatem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_Brace.plateB type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_Brace.bal2_bal1_marJ location=-0.183064, -0.080547, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.bal2_bal1_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.chain_f12_chain_pair_mar location=-0.183064, -0.080547, 0.000000 orientation=0.000000, 0.000000, 23.749116 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_f12_chain_pair_mar visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.chain_f12_left_marJ location=-0.183064, -0.080547, 0.046250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_f12_left_marJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.chain_f12_belt reference_marker=.sliderActuator.SLM11_Brace.chain_f12_chain_pair_mar  points_for_profile= &
0.609047, -0.037500, 0.046875, &
0.610003, -0.035193, 0.046875, &
0.612311, -0.034237, 0.046875, &
0.614618, -0.035193, 0.046875, &
0.615574, -0.037500, 0.046875, &
0.618864, -0.037067, 0.046875, &
0.619190, -0.034591, 0.046875, &
0.621172, -0.033070, 0.046875, &
0.623648, -0.033396, 0.046875, &
0.625168, -0.035378, 0.046875, &
0.628235, -0.034108, 0.046875, &
0.627909, -0.031631, 0.046875, &
0.629429, -0.029650, 0.046875, &
0.631905, -0.029324, 0.046875, &
0.633887, -0.030844, 0.046875, &
0.636520, -0.028824, 0.046875, &
0.635564, -0.026517, 0.046875, &
0.636520, -0.024209, 0.046875, &
0.638827, -0.023253, 0.046875, &
0.641134, -0.024209, 0.046875, &
0.643155, -0.021576, 0.046875, &
0.641635, -0.019595, 0.046875, &
0.641961, -0.017118, 0.046875, &
0.643942, -0.015598, 0.046875, &
0.646418, -0.015924, 0.046875, &
0.647688, -0.012858, 0.046875, &
0.645707, -0.011337, 0.046875, &
0.645381, -0.008861, 0.046875, &
0.646901, -0.006880, 0.046875, &
0.649377, -0.006554, 0.046875, &
0.649811, -0.003263, 0.046875, &
0.647503, -0.002307, 0.046875, &
0.646547, 0.000000, 0.046875, &
0.647503, 0.002307, 0.046875, &
0.649811, 0.003263, 0.046875, &
0.649377, 0.006554, 0.046875, &
0.646901, 0.006880, 0.046875, &
0.645381, 0.008861, 0.046875, &
0.645707, 0.011337, 0.046875, &
0.647688, 0.012858, 0.046875, &
0.646418, 0.015924, 0.046875, &
0.643942, 0.015598, 0.046875, &
0.641961, 0.017118, 0.046875, &
0.641635, 0.019595, 0.046875, &
0.643155, 0.021576, 0.046875, &
0.641134, 0.024209, 0.046875, &
0.638827, 0.023253, 0.046875, &
0.636520, 0.024209, 0.046875, &
0.635564, 0.026517, 0.046875, &
0.636520, 0.028824, 0.046875, &
0.633887, 0.030844, 0.046875, &
0.631905, 0.029324, 0.046875, &
0.629429, 0.029650, 0.046875, &
0.627909, 0.031631, 0.046875, &
0.628235, 0.034108, 0.046875, &
0.625168, 0.035378, 0.046875, &
0.623648, 0.033396, 0.046875, &
0.621172, 0.033070, 0.046875, &
0.619190, 0.034591, 0.046875, &
0.618864, 0.037067, 0.046875, &
0.615574, 0.037500, 0.046875, &
0.614618, 0.035193, 0.046875, &
0.612311, 0.034237, 0.046875, &
0.610003, 0.035193, 0.046875, &
0.609047, 0.037500, 0.046875, &
0.605698, 0.037500, 0.046875, &
0.604742, 0.035193, 0.046875, &
0.602435, 0.034237, 0.046875, &
0.600127, 0.035193, 0.046875, &
0.599171, 0.037500, 0.046875, &
0.595822, 0.037500, 0.046875, &
0.594866, 0.035193, 0.046875, &
0.592559, 0.034237, 0.046875, &
0.590251, 0.035193, 0.046875, &
0.589295, 0.037500, 0.046875, &
0.585946, 0.037500, 0.046875, &
0.584990, 0.035193, 0.046875, &
0.582683, 0.034237, 0.046875, &
0.580375, 0.035193, 0.046875, &
0.579419, 0.037500, 0.046875, &
0.576070, 0.037500, 0.046875, &
0.575114, 0.035193, 0.046875, &
0.572807, 0.034237, 0.046875, &
0.570499, 0.035193, 0.046875, &
0.569544, 0.037500, 0.046875, &
0.566194, 0.037500, 0.046875, &
0.565238, 0.035193, 0.046875, &
0.562931, 0.034237, 0.046875, &
0.560623, 0.035193, 0.046875, &
0.559668, 0.037500, 0.046875, &
0.556318, 0.037500, 0.046875, &
0.555362, 0.035193, 0.046875, &
0.553055, 0.034237, 0.046875, &
0.550747, 0.035193, 0.046875, &
0.549792, 0.037500, 0.046875, &
0.546442, 0.037500, 0.046875, &
0.545486, 0.035193, 0.046875, &
0.543179, 0.034237, 0.046875, &
0.540871, 0.035193, 0.046875, &
0.539916, 0.037500, 0.046875, &
0.536566, 0.037500, 0.046875, &
0.535610, 0.035193, 0.046875, &
0.533303, 0.034237, 0.046875, &
0.530995, 0.035193, 0.046875, &
0.530040, 0.037500, 0.046875, &
0.526690, 0.037500, 0.046875, &
0.525734, 0.035193, 0.046875, &
0.523427, 0.034237, 0.046875, &
0.521119, 0.035193, 0.046875, &
0.520164, 0.037500, 0.046875, &
0.516814, 0.037500, 0.046875, &
0.515858, 0.035193, 0.046875, &
0.513551, 0.034237, 0.046875, &
0.511243, 0.035193, 0.046875, &
0.510288, 0.037500, 0.046875, &
0.506938, 0.037500, 0.046875, &
0.505982, 0.035193, 0.046875, &
0.503675, 0.034237, 0.046875, &
0.501367, 0.035193, 0.046875, &
0.500412, 0.037500, 0.046875, &
0.497062, 0.037500, 0.046875, &
0.496106, 0.035193, 0.046875, &
0.493799, 0.034237, 0.046875, &
0.491491, 0.035193, 0.046875, &
0.490536, 0.037500, 0.046875, &
0.487186, 0.037500, 0.046875, &
0.486230, 0.035193, 0.046875, &
0.483923, 0.034237, 0.046875, &
0.481615, 0.035193, 0.046875, &
0.480660, 0.037500, 0.046875, &
0.477310, 0.037500, 0.046875, &
0.476354, 0.035193, 0.046875, &
0.474047, 0.034237, 0.046875, &
0.471739, 0.035193, 0.046875, &
0.470784, 0.037500, 0.046875, &
0.467434, 0.037500, 0.046875, &
0.466478, 0.035193, 0.046875, &
0.464171, 0.034237, 0.046875, &
0.461864, 0.035193, 0.046875, &
0.460908, 0.037500, 0.046875, &
0.457558, 0.037500, 0.046875, &
0.456602, 0.035193, 0.046875, &
0.454295, 0.034237, 0.046875, &
0.451988, 0.035193, 0.046875, &
0.451032, 0.037500, 0.046875, &
0.447682, 0.037500, 0.046875, &
0.446726, 0.035193, 0.046875, &
0.444419, 0.034237, 0.046875, &
0.442112, 0.035193, 0.046875, &
0.441156, 0.037500, 0.046875, &
0.437806, 0.037500, 0.046875, &
0.436850, 0.035193, 0.046875, &
0.434543, 0.034237, 0.046875, &
0.432236, 0.035193, 0.046875, &
0.431280, 0.037500, 0.046875, &
0.427930, 0.037500, 0.046875, &
0.426974, 0.035193, 0.046875, &
0.424667, 0.034237, 0.046875, &
0.422360, 0.035193, 0.046875, &
0.421404, 0.037500, 0.046875, &
0.418054, 0.037500, 0.046875, &
0.417098, 0.035193, 0.046875, &
0.414791, 0.034237, 0.046875, &
0.412484, 0.035193, 0.046875, &
0.411528, 0.037500, 0.046875, &
0.408178, 0.037500, 0.046875, &
0.407222, 0.035193, 0.046875, &
0.404915, 0.034237, 0.046875, &
0.402608, 0.035193, 0.046875, &
0.401652, 0.037500, 0.046875, &
0.398302, 0.037500, 0.046875, &
0.397346, 0.035193, 0.046875, &
0.395039, 0.034237, 0.046875, &
0.392732, 0.035193, 0.046875, &
0.391776, 0.037500, 0.046875, &
0.388426, 0.037500, 0.046875, &
0.387470, 0.035193, 0.046875, &
0.385163, 0.034237, 0.046875, &
0.382856, 0.035193, 0.046875, &
0.381900, 0.037500, 0.046875, &
0.378550, 0.037500, 0.046875, &
0.377595, 0.035193, 0.046875, &
0.375287, 0.034237, 0.046875, &
0.372980, 0.035193, 0.046875, &
0.372024, 0.037500, 0.046875, &
0.368674, 0.037500, 0.046875, &
0.367719, 0.035193, 0.046875, &
0.365411, 0.034237, 0.046875, &
0.363104, 0.035193, 0.046875, &
0.362148, 0.037500, 0.046875, &
0.358798, 0.037500, 0.046875, &
0.357843, 0.035193, 0.046875, &
0.355535, 0.034237, 0.046875, &
0.353228, 0.035193, 0.046875, &
0.352272, 0.037500, 0.046875, &
0.348922, 0.037500, 0.046875, &
0.347967, 0.035193, 0.046875, &
0.345659, 0.034237, 0.046875, &
0.343352, 0.035193, 0.046875, &
0.342396, 0.037500, 0.046875, &
0.339046, 0.037500, 0.046875, &
0.338091, 0.035193, 0.046875, &
0.335783, 0.034237, 0.046875, &
0.333476, 0.035193, 0.046875, &
0.332520, 0.037500, 0.046875, &
0.329170, 0.037500, 0.046875, &
0.328215, 0.035193, 0.046875, &
0.325907, 0.034237, 0.046875, &
0.323600, 0.035193, 0.046875, &
0.322644, 0.037500, 0.046875, &
0.319294, 0.037500, 0.046875, &
0.318339, 0.035193, 0.046875, &
0.316031, 0.034237, 0.046875, &
0.313724, 0.035193, 0.046875, &
0.312768, 0.037500, 0.046875, &
0.309418, 0.037500, 0.046875, &
0.308463, 0.035193, 0.046875, &
0.306155, 0.034237, 0.046875, &
0.303848, 0.035193, 0.046875, &
0.302892, 0.037500, 0.046875, &
0.299542, 0.037500, 0.046875, &
0.298587, 0.035193, 0.046875, &
0.296279, 0.034237, 0.046875, &
0.293972, 0.035193, 0.046875, &
0.293016, 0.037500, 0.046875, &
0.289666, 0.037500, 0.046875, &
0.288711, 0.035193, 0.046875, &
0.286403, 0.034237, 0.046875, &
0.284096, 0.035193, 0.046875, &
0.283140, 0.037500, 0.046875, &
0.279791, 0.037500, 0.046875, &
0.278835, 0.035193, 0.046875, &
0.276527, 0.034237, 0.046875, &
0.274220, 0.035193, 0.046875, &
0.273264, 0.037500, 0.046875, &
0.269915, 0.037500, 0.046875, &
0.268959, 0.035193, 0.046875, &
0.266651, 0.034237, 0.046875, &
0.264344, 0.035193, 0.046875, &
0.263388, 0.037500, 0.046875, &
0.260039, 0.037500, 0.046875, &
0.259083, 0.035193, 0.046875, &
0.256775, 0.034237, 0.046875, &
0.254468, 0.035193, 0.046875, &
0.253512, 0.037500, 0.046875, &
0.250163, 0.037500, 0.046875, &
0.249207, 0.035193, 0.046875, &
0.246899, 0.034237, 0.046875, &
0.244592, 0.035193, 0.046875, &
0.243636, 0.037500, 0.046875, &
0.240287, 0.037500, 0.046875, &
0.239331, 0.035193, 0.046875, &
0.237023, 0.034237, 0.046875, &
0.234716, 0.035193, 0.046875, &
0.233760, 0.037500, 0.046875, &
0.230411, 0.037500, 0.046875, &
0.229455, 0.035193, 0.046875, &
0.227147, 0.034237, 0.046875, &
0.224840, 0.035193, 0.046875, &
0.223884, 0.037500, 0.046875, &
0.220535, 0.037500, 0.046875, &
0.219579, 0.035193, 0.046875, &
0.217271, 0.034237, 0.046875, &
0.214964, 0.035193, 0.046875, &
0.214008, 0.037500, 0.046875, &
0.210659, 0.037500, 0.046875, &
0.209703, 0.035193, 0.046875, &
0.207396, 0.034237, 0.046875, &
0.205088, 0.035193, 0.046875, &
0.204132, 0.037500, 0.046875, &
0.200783, 0.037500, 0.046875, &
0.199827, 0.035193, 0.046875, &
0.197520, 0.034237, 0.046875, &
0.195212, 0.035193, 0.046875, &
0.194256, 0.037500, 0.046875, &
0.190907, 0.037500, 0.046875, &
0.189951, 0.035193, 0.046875, &
0.187644, 0.034237, 0.046875, &
0.185336, 0.035193, 0.046875, &
0.184380, 0.037500, 0.046875, &
0.181031, 0.037500, 0.046875, &
0.180075, 0.035193, 0.046875, &
0.177768, 0.034237, 0.046875, &
0.175460, 0.035193, 0.046875, &
0.174504, 0.037500, 0.046875, &
0.171155, 0.037500, 0.046875, &
0.170199, 0.035193, 0.046875, &
0.167892, 0.034237, 0.046875, &
0.165584, 0.035193, 0.046875, &
0.164628, 0.037500, 0.046875, &
0.161279, 0.037500, 0.046875, &
0.160323, 0.035193, 0.046875, &
0.158016, 0.034237, 0.046875, &
0.155708, 0.035193, 0.046875, &
0.154752, 0.037500, 0.046875, &
0.151403, 0.037500, 0.046875, &
0.150447, 0.035193, 0.046875, &
0.148140, 0.034237, 0.046875, &
0.145832, 0.035193, 0.046875, &
0.144876, 0.037500, 0.046875, &
0.141527, 0.037500, 0.046875, &
0.140571, 0.035193, 0.046875, &
0.138264, 0.034237, 0.046875, &
0.135956, 0.035193, 0.046875, &
0.135001, 0.037500, 0.046875, &
0.131651, 0.037500, 0.046875, &
0.130695, 0.035193, 0.046875, &
0.128388, 0.034237, 0.046875, &
0.126080, 0.035193, 0.046875, &
0.125125, 0.037500, 0.046875, &
0.121775, 0.037500, 0.046875, &
0.120819, 0.035193, 0.046875, &
0.118512, 0.034237, 0.046875, &
0.116204, 0.035193, 0.046875, &
0.115249, 0.037500, 0.046875, &
0.111899, 0.037500, 0.046875, &
0.110943, 0.035193, 0.046875, &
0.108636, 0.034237, 0.046875, &
0.106328, 0.035193, 0.046875, &
0.105373, 0.037500, 0.046875, &
0.102023, 0.037500, 0.046875, &
0.101067, 0.035193, 0.046875, &
0.098760, 0.034237, 0.046875, &
0.096452, 0.035193, 0.046875, &
0.095497, 0.037500, 0.046875, &
0.092147, 0.037500, 0.046875, &
0.091191, 0.035193, 0.046875, &
0.088884, 0.034237, 0.046875, &
0.086576, 0.035193, 0.046875, &
0.085621, 0.037500, 0.046875, &
0.082271, 0.037500, 0.046875, &
0.081315, 0.035193, 0.046875, &
0.079008, 0.034237, 0.046875, &
0.076700, 0.035193, 0.046875, &
0.075745, 0.037500, 0.046875, &
0.072395, 0.037500, 0.046875, &
0.071439, 0.035193, 0.046875, &
0.069132, 0.034237, 0.046875, &
0.066824, 0.035193, 0.046875, &
0.065869, 0.037500, 0.046875, &
0.062519, 0.037500, 0.046875, &
0.061563, 0.035193, 0.046875, &
0.059256, 0.034237, 0.046875, &
0.056948, 0.035193, 0.046875, &
0.055993, 0.037500, 0.046875, &
0.052643, 0.037500, 0.046875, &
0.051687, 0.035193, 0.046875, &
0.049380, 0.034237, 0.046875, &
0.047072, 0.035193, 0.046875, &
0.046117, 0.037500, 0.046875, &
0.042767, 0.037500, 0.046875, &
0.041811, 0.035193, 0.046875, &
0.039504, 0.034237, 0.046875, &
0.037197, 0.035193, 0.046875, &
0.036241, 0.037500, 0.046875, &
0.032891, 0.037500, 0.046875, &
0.031935, 0.035193, 0.046875, &
0.029628, 0.034237, 0.046875, &
0.027321, 0.035193, 0.046875, &
0.026365, 0.037500, 0.046875, &
0.023015, 0.037500, 0.046875, &
0.022059, 0.035193, 0.046875, &
0.019752, 0.034237, 0.046875, &
0.017445, 0.035193, 0.046875, &
0.016489, 0.037500, 0.046875, &
0.013139, 0.037500, 0.046875, &
0.012183, 0.035193, 0.046875, &
0.009876, 0.034237, 0.046875, &
0.007569, 0.035193, 0.046875, &
0.006613, 0.037500, 0.046875, &
0.003263, 0.037500, 0.046875, &
0.002307, 0.035193, 0.046875, &
0.000000, 0.034237, 0.046875, &
-0.002307, 0.035193, 0.046875, &
-0.003263, 0.037500, 0.046875, &
-0.006554, 0.037067, 0.046875, &
-0.006880, 0.034591, 0.046875, &
-0.008861, 0.033070, 0.046875, &
-0.011337, 0.033396, 0.046875, &
-0.012858, 0.035378, 0.046875, &
-0.015924, 0.034108, 0.046875, &
-0.015598, 0.031631, 0.046875, &
-0.017118, 0.029650, 0.046875, &
-0.019595, 0.029324, 0.046875, &
-0.021576, 0.030844, 0.046875, &
-0.024209, 0.028824, 0.046875, &
-0.023253, 0.026517, 0.046875, &
-0.024209, 0.024209, 0.046875, &
-0.026517, 0.023253, 0.046875, &
-0.028824, 0.024209, 0.046875, &
-0.030844, 0.021576, 0.046875, &
-0.029324, 0.019595, 0.046875, &
-0.029650, 0.017118, 0.046875, &
-0.031631, 0.015598, 0.046875, &
-0.034108, 0.015924, 0.046875, &
-0.035378, 0.012858, 0.046875, &
-0.033396, 0.011337, 0.046875, &
-0.033070, 0.008861, 0.046875, &
-0.034591, 0.006880, 0.046875, &
-0.037067, 0.006554, 0.046875, &
-0.037500, 0.003263, 0.046875, &
-0.035193, 0.002307, 0.046875, &
-0.034237, 0.000000, 0.046875, &
-0.035193, -0.002307, 0.046875, &
-0.037500, -0.003263, 0.046875, &
-0.037067, -0.006554, 0.046875, &
-0.034591, -0.006880, 0.046875, &
-0.033070, -0.008861, 0.046875, &
-0.033396, -0.011337, 0.046875, &
-0.035378, -0.012858, 0.046875, &
-0.034108, -0.015924, 0.046875, &
-0.031631, -0.015598, 0.046875, &
-0.029650, -0.017118, 0.046875, &
-0.029324, -0.019595, 0.046875, &
-0.030844, -0.021576, 0.046875, &
-0.028824, -0.024209, 0.046875, &
-0.026517, -0.023253, 0.046875, &
-0.024209, -0.024209, 0.046875, &
-0.023253, -0.026517, 0.046875, &
-0.024209, -0.028824, 0.046875, &
-0.021576, -0.030844, 0.046875, &
-0.019595, -0.029324, 0.046875, &
-0.017118, -0.029650, 0.046875, &
-0.015598, -0.031631, 0.046875, &
-0.015924, -0.034108, 0.046875, &
-0.012858, -0.035378, 0.046875, &
-0.011337, -0.033396, 0.046875, &
-0.008861, -0.033070, 0.046875, &
-0.006880, -0.034591, 0.046875, &
-0.006554, -0.037067, 0.046875, &
-0.003263, -0.037500, 0.046875, &
-0.002307, -0.035193, 0.046875, &
0.000000, -0.034237, 0.046875, &
0.002307, -0.035193, 0.046875, &
0.003263, -0.037500, 0.046875, &
0.006613, -0.037500, 0.046875, &
0.007569, -0.035193, 0.046875, &
0.009876, -0.034237, 0.046875, &
0.012183, -0.035193, 0.046875, &
0.013139, -0.037500, 0.046875, &
0.016489, -0.037500, 0.046875, &
0.017445, -0.035193, 0.046875, &
0.019752, -0.034237, 0.046875, &
0.022059, -0.035193, 0.046875, &
0.023015, -0.037500, 0.046875, &
0.026365, -0.037500, 0.046875, &
0.027321, -0.035193, 0.046875, &
0.029628, -0.034237, 0.046875, &
0.031935, -0.035193, 0.046875, &
0.032891, -0.037500, 0.046875, &
0.036241, -0.037500, 0.046875, &
0.037197, -0.035193, 0.046875, &
0.039504, -0.034237, 0.046875, &
0.041811, -0.035193, 0.046875, &
0.042767, -0.037500, 0.046875, &
0.046117, -0.037500, 0.046875, &
0.047072, -0.035193, 0.046875, &
0.049380, -0.034237, 0.046875, &
0.051687, -0.035193, 0.046875, &
0.052643, -0.037500, 0.046875, &
0.055993, -0.037500, 0.046875, &
0.056948, -0.035193, 0.046875, &
0.059256, -0.034237, 0.046875, &
0.061563, -0.035193, 0.046875, &
0.062519, -0.037500, 0.046875, &
0.065869, -0.037500, 0.046875, &
0.066824, -0.035193, 0.046875, &
0.069132, -0.034237, 0.046875, &
0.071439, -0.035193, 0.046875, &
0.072395, -0.037500, 0.046875, &
0.075745, -0.037500, 0.046875, &
0.076700, -0.035193, 0.046875, &
0.079008, -0.034237, 0.046875, &
0.081315, -0.035193, 0.046875, &
0.082271, -0.037500, 0.046875, &
0.085621, -0.037500, 0.046875, &
0.086576, -0.035193, 0.046875, &
0.088884, -0.034237, 0.046875, &
0.091191, -0.035193, 0.046875, &
0.092147, -0.037500, 0.046875, &
0.095497, -0.037500, 0.046875, &
0.096452, -0.035193, 0.046875, &
0.098760, -0.034237, 0.046875, &
0.101067, -0.035193, 0.046875, &
0.102023, -0.037500, 0.046875, &
0.105373, -0.037500, 0.046875, &
0.106328, -0.035193, 0.046875, &
0.108636, -0.034237, 0.046875, &
0.110943, -0.035193, 0.046875, &
0.111899, -0.037500, 0.046875, &
0.115249, -0.037500, 0.046875, &
0.116204, -0.035193, 0.046875, &
0.118512, -0.034237, 0.046875, &
0.120819, -0.035193, 0.046875, &
0.121775, -0.037500, 0.046875, &
0.125125, -0.037500, 0.046875, &
0.126080, -0.035193, 0.046875, &
0.128388, -0.034237, 0.046875, &
0.130695, -0.035193, 0.046875, &
0.131651, -0.037500, 0.046875, &
0.135001, -0.037500, 0.046875, &
0.135956, -0.035193, 0.046875, &
0.138264, -0.034237, 0.046875, &
0.140571, -0.035193, 0.046875, &
0.141527, -0.037500, 0.046875, &
0.144876, -0.037500, 0.046875, &
0.145832, -0.035193, 0.046875, &
0.148140, -0.034237, 0.046875, &
0.150447, -0.035193, 0.046875, &
0.151403, -0.037500, 0.046875, &
0.154752, -0.037500, 0.046875, &
0.155708, -0.035193, 0.046875, &
0.158016, -0.034237, 0.046875, &
0.160323, -0.035193, 0.046875, &
0.161279, -0.037500, 0.046875, &
0.164628, -0.037500, 0.046875, &
0.165584, -0.035193, 0.046875, &
0.167892, -0.034237, 0.046875, &
0.170199, -0.035193, 0.046875, &
0.171155, -0.037500, 0.046875, &
0.174504, -0.037500, 0.046875, &
0.175460, -0.035193, 0.046875, &
0.177768, -0.034237, 0.046875, &
0.180075, -0.035193, 0.046875, &
0.181031, -0.037500, 0.046875, &
0.184380, -0.037500, 0.046875, &
0.185336, -0.035193, 0.046875, &
0.187644, -0.034237, 0.046875, &
0.189951, -0.035193, 0.046875, &
0.190907, -0.037500, 0.046875, &
0.194256, -0.037500, 0.046875, &
0.195212, -0.035193, 0.046875, &
0.197520, -0.034237, 0.046875, &
0.199827, -0.035193, 0.046875, &
0.200783, -0.037500, 0.046875, &
0.204132, -0.037500, 0.046875, &
0.205088, -0.035193, 0.046875, &
0.207396, -0.034237, 0.046875, &
0.209703, -0.035193, 0.046875, &
0.210659, -0.037500, 0.046875, &
0.214008, -0.037500, 0.046875, &
0.214964, -0.035193, 0.046875, &
0.217271, -0.034237, 0.046875, &
0.219579, -0.035193, 0.046875, &
0.220535, -0.037500, 0.046875, &
0.223884, -0.037500, 0.046875, &
0.224840, -0.035193, 0.046875, &
0.227147, -0.034237, 0.046875, &
0.229455, -0.035193, 0.046875, &
0.230411, -0.037500, 0.046875, &
0.233760, -0.037500, 0.046875, &
0.234716, -0.035193, 0.046875, &
0.237023, -0.034237, 0.046875, &
0.239331, -0.035193, 0.046875, &
0.240287, -0.037500, 0.046875, &
0.243636, -0.037500, 0.046875, &
0.244592, -0.035193, 0.046875, &
0.246899, -0.034237, 0.046875, &
0.249207, -0.035193, 0.046875, &
0.250163, -0.037500, 0.046875, &
0.253512, -0.037500, 0.046875, &
0.254468, -0.035193, 0.046875, &
0.256775, -0.034237, 0.046875, &
0.259083, -0.035193, 0.046875, &
0.260039, -0.037500, 0.046875, &
0.263388, -0.037500, 0.046875, &
0.264344, -0.035193, 0.046875, &
0.266651, -0.034237, 0.046875, &
0.268959, -0.035193, 0.046875, &
0.269915, -0.037500, 0.046875, &
0.273264, -0.037500, 0.046875, &
0.274220, -0.035193, 0.046875, &
0.276527, -0.034237, 0.046875, &
0.278835, -0.035193, 0.046875, &
0.279791, -0.037500, 0.046875, &
0.283140, -0.037500, 0.046875, &
0.284096, -0.035193, 0.046875, &
0.286403, -0.034237, 0.046875, &
0.288711, -0.035193, 0.046875, &
0.289666, -0.037500, 0.046875, &
0.293016, -0.037500, 0.046875, &
0.293972, -0.035193, 0.046875, &
0.296279, -0.034237, 0.046875, &
0.298587, -0.035193, 0.046875, &
0.299542, -0.037500, 0.046875, &
0.302892, -0.037500, 0.046875, &
0.303848, -0.035193, 0.046875, &
0.306155, -0.034237, 0.046875, &
0.308463, -0.035193, 0.046875, &
0.309418, -0.037500, 0.046875, &
0.312768, -0.037500, 0.046875, &
0.313724, -0.035193, 0.046875, &
0.316031, -0.034237, 0.046875, &
0.318339, -0.035193, 0.046875, &
0.319294, -0.037500, 0.046875, &
0.322644, -0.037500, 0.046875, &
0.323600, -0.035193, 0.046875, &
0.325907, -0.034237, 0.046875, &
0.328215, -0.035193, 0.046875, &
0.329170, -0.037500, 0.046875, &
0.332520, -0.037500, 0.046875, &
0.333476, -0.035193, 0.046875, &
0.335783, -0.034237, 0.046875, &
0.338091, -0.035193, 0.046875, &
0.339046, -0.037500, 0.046875, &
0.342396, -0.037500, 0.046875, &
0.343352, -0.035193, 0.046875, &
0.345659, -0.034237, 0.046875, &
0.347967, -0.035193, 0.046875, &
0.348922, -0.037500, 0.046875, &
0.352272, -0.037500, 0.046875, &
0.353228, -0.035193, 0.046875, &
0.355535, -0.034237, 0.046875, &
0.357843, -0.035193, 0.046875, &
0.358798, -0.037500, 0.046875, &
0.362148, -0.037500, 0.046875, &
0.363104, -0.035193, 0.046875, &
0.365411, -0.034237, 0.046875, &
0.367719, -0.035193, 0.046875, &
0.368674, -0.037500, 0.046875, &
0.372024, -0.037500, 0.046875, &
0.372980, -0.035193, 0.046875, &
0.375287, -0.034237, 0.046875, &
0.377595, -0.035193, 0.046875, &
0.378550, -0.037500, 0.046875, &
0.381900, -0.037500, 0.046875, &
0.382856, -0.035193, 0.046875, &
0.385163, -0.034237, 0.046875, &
0.387470, -0.035193, 0.046875, &
0.388426, -0.037500, 0.046875, &
0.391776, -0.037500, 0.046875, &
0.392732, -0.035193, 0.046875, &
0.395039, -0.034237, 0.046875, &
0.397346, -0.035193, 0.046875, &
0.398302, -0.037500, 0.046875, &
0.401652, -0.037500, 0.046875, &
0.402608, -0.035193, 0.046875, &
0.404915, -0.034237, 0.046875, &
0.407222, -0.035193, 0.046875, &
0.408178, -0.037500, 0.046875, &
0.411528, -0.037500, 0.046875, &
0.412484, -0.035193, 0.046875, &
0.414791, -0.034237, 0.046875, &
0.417098, -0.035193, 0.046875, &
0.418054, -0.037500, 0.046875, &
0.421404, -0.037500, 0.046875, &
0.422360, -0.035193, 0.046875, &
0.424667, -0.034237, 0.046875, &
0.426974, -0.035193, 0.046875, &
0.427930, -0.037500, 0.046875, &
0.431280, -0.037500, 0.046875, &
0.432236, -0.035193, 0.046875, &
0.434543, -0.034237, 0.046875, &
0.436850, -0.035193, 0.046875, &
0.437806, -0.037500, 0.046875, &
0.441156, -0.037500, 0.046875, &
0.442112, -0.035193, 0.046875, &
0.444419, -0.034237, 0.046875, &
0.446726, -0.035193, 0.046875, &
0.447682, -0.037500, 0.046875, &
0.451032, -0.037500, 0.046875, &
0.451988, -0.035193, 0.046875, &
0.454295, -0.034237, 0.046875, &
0.456602, -0.035193, 0.046875, &
0.457558, -0.037500, 0.046875, &
0.460908, -0.037500, 0.046875, &
0.461864, -0.035193, 0.046875, &
0.464171, -0.034237, 0.046875, &
0.466478, -0.035193, 0.046875, &
0.467434, -0.037500, 0.046875, &
0.470784, -0.037500, 0.046875, &
0.471739, -0.035193, 0.046875, &
0.474047, -0.034237, 0.046875, &
0.476354, -0.035193, 0.046875, &
0.477310, -0.037500, 0.046875, &
0.480660, -0.037500, 0.046875, &
0.481615, -0.035193, 0.046875, &
0.483923, -0.034237, 0.046875, &
0.486230, -0.035193, 0.046875, &
0.487186, -0.037500, 0.046875, &
0.490536, -0.037500, 0.046875, &
0.491491, -0.035193, 0.046875, &
0.493799, -0.034237, 0.046875, &
0.496106, -0.035193, 0.046875, &
0.497062, -0.037500, 0.046875, &
0.500412, -0.037500, 0.046875, &
0.501367, -0.035193, 0.046875, &
0.503675, -0.034237, 0.046875, &
0.505982, -0.035193, 0.046875, &
0.506938, -0.037500, 0.046875, &
0.510288, -0.037500, 0.046875, &
0.511243, -0.035193, 0.046875, &
0.513551, -0.034237, 0.046875, &
0.515858, -0.035193, 0.046875, &
0.516814, -0.037500, 0.046875, &
0.520164, -0.037500, 0.046875, &
0.521119, -0.035193, 0.046875, &
0.523427, -0.034237, 0.046875, &
0.525734, -0.035193, 0.046875, &
0.526690, -0.037500, 0.046875, &
0.530040, -0.037500, 0.046875, &
0.530995, -0.035193, 0.046875, &
0.533303, -0.034237, 0.046875, &
0.535610, -0.035193, 0.046875, &
0.536566, -0.037500, 0.046875, &
0.539916, -0.037500, 0.046875, &
0.540871, -0.035193, 0.046875, &
0.543179, -0.034237, 0.046875, &
0.545486, -0.035193, 0.046875, &
0.546442, -0.037500, 0.046875, &
0.549792, -0.037500, 0.046875, &
0.550747, -0.035193, 0.046875, &
0.553055, -0.034237, 0.046875, &
0.555362, -0.035193, 0.046875, &
0.556318, -0.037500, 0.046875, &
0.559668, -0.037500, 0.046875, &
0.560623, -0.035193, 0.046875, &
0.562931, -0.034237, 0.046875, &
0.565238, -0.035193, 0.046875, &
0.566194, -0.037500, 0.046875, &
0.569544, -0.037500, 0.046875, &
0.570499, -0.035193, 0.046875, &
0.572807, -0.034237, 0.046875, &
0.575114, -0.035193, 0.046875, &
0.576070, -0.037500, 0.046875, &
0.579419, -0.037500, 0.046875, &
0.580375, -0.035193, 0.046875, &
0.582683, -0.034237, 0.046875, &
0.584990, -0.035193, 0.046875, &
0.585946, -0.037500, 0.046875, &
0.589295, -0.037500, 0.046875, &
0.590251, -0.035193, 0.046875, &
0.592559, -0.034237, 0.046875, &
0.594866, -0.035193, 0.046875, &
0.595822, -0.037500, 0.046875, &
0.599171, -0.037500, 0.046875, &
0.600127, -0.035193, 0.046875, &
0.602435, -0.034237, 0.046875, &
0.604742, -0.035193, 0.046875, &
0.605698, -0.037500, 0.046875, &
0.602311, -0.038625, 0.046875, &
-0.000000, -0.038625, 0.046875, &
-0.013211, -0.036296, 0.046875, &
-0.024828, -0.029588, 0.046875, &
-0.033450, -0.019313, 0.046875, &
-0.038038, -0.006707, 0.046875, &
-0.038038, 0.006707, 0.046875, &
-0.033450, 0.019312, 0.046875, &
-0.024828, 0.029588, 0.046875, &
-0.013211, 0.036296, 0.046875, &
0.000000, 0.038625, 0.046875, &
0.612311, 0.038625, 0.046875, &
0.625451, 0.036321, 0.046875, &
0.637023, 0.029685, 0.046875, &
0.645648, 0.019507, 0.046875, &
0.650296, 0.007002, 0.046875, &
0.650412, -0.006338, 0.046875, &
0.645983, -0.018922, 0.046875, &
0.637538, -0.029249, 0.046875, &
0.626083, -0.036086, 0.046875, &
0.612985, -0.038619, 0.046875, &
0.609047, -0.037500, 0.046875 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.chain_f12_chain_pair_mar
entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_f12_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.chain_f12_belt render=filled
marker create marker_name=.sliderActuator.SLM11_Brace.chain_b23_chain_pair_mar location=-0.183064, -0.080547, 0.000000 orientation=0.000000, 0.000000, 23.749116 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_b23_chain_pair_mar visibility=on
marker create marker_name=.sliderActuator.SLM11_Brace.chain_b23_left_marJ location=-0.183064, -0.080547, -0.052500 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_b23_left_marJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Brace.chain_b23_belt reference_marker=.sliderActuator.SLM11_Brace.chain_b23_chain_pair_mar  points_for_profile= &
0.609047, -0.037500, -0.051875, &
0.610003, -0.035193, -0.051875, &
0.612311, -0.034237, -0.051875, &
0.614618, -0.035193, -0.051875, &
0.615574, -0.037500, -0.051875, &
0.618864, -0.037067, -0.051875, &
0.619190, -0.034591, -0.051875, &
0.621172, -0.033070, -0.051875, &
0.623648, -0.033396, -0.051875, &
0.625168, -0.035378, -0.051875, &
0.628235, -0.034108, -0.051875, &
0.627909, -0.031631, -0.051875, &
0.629429, -0.029650, -0.051875, &
0.631905, -0.029324, -0.051875, &
0.633887, -0.030844, -0.051875, &
0.636520, -0.028824, -0.051875, &
0.635564, -0.026517, -0.051875, &
0.636520, -0.024209, -0.051875, &
0.638827, -0.023253, -0.051875, &
0.641134, -0.024209, -0.051875, &
0.643155, -0.021576, -0.051875, &
0.641635, -0.019595, -0.051875, &
0.641961, -0.017118, -0.051875, &
0.643942, -0.015598, -0.051875, &
0.646418, -0.015924, -0.051875, &
0.647688, -0.012858, -0.051875, &
0.645707, -0.011337, -0.051875, &
0.645381, -0.008861, -0.051875, &
0.646901, -0.006880, -0.051875, &
0.649377, -0.006554, -0.051875, &
0.649811, -0.003263, -0.051875, &
0.647503, -0.002307, -0.051875, &
0.646547, 0.000000, -0.051875, &
0.647503, 0.002307, -0.051875, &
0.649811, 0.003263, -0.051875, &
0.649377, 0.006554, -0.051875, &
0.646901, 0.006880, -0.051875, &
0.645381, 0.008861, -0.051875, &
0.645707, 0.011337, -0.051875, &
0.647688, 0.012858, -0.051875, &
0.646418, 0.015924, -0.051875, &
0.643942, 0.015598, -0.051875, &
0.641961, 0.017118, -0.051875, &
0.641635, 0.019595, -0.051875, &
0.643155, 0.021576, -0.051875, &
0.641134, 0.024209, -0.051875, &
0.638827, 0.023253, -0.051875, &
0.636520, 0.024209, -0.051875, &
0.635564, 0.026517, -0.051875, &
0.636520, 0.028824, -0.051875, &
0.633887, 0.030844, -0.051875, &
0.631905, 0.029324, -0.051875, &
0.629429, 0.029650, -0.051875, &
0.627909, 0.031631, -0.051875, &
0.628235, 0.034108, -0.051875, &
0.625168, 0.035378, -0.051875, &
0.623648, 0.033396, -0.051875, &
0.621172, 0.033070, -0.051875, &
0.619190, 0.034591, -0.051875, &
0.618864, 0.037067, -0.051875, &
0.615574, 0.037500, -0.051875, &
0.614618, 0.035193, -0.051875, &
0.612311, 0.034237, -0.051875, &
0.610003, 0.035193, -0.051875, &
0.609047, 0.037500, -0.051875, &
0.605698, 0.037500, -0.051875, &
0.604742, 0.035193, -0.051875, &
0.602435, 0.034237, -0.051875, &
0.600127, 0.035193, -0.051875, &
0.599171, 0.037500, -0.051875, &
0.595822, 0.037500, -0.051875, &
0.594866, 0.035193, -0.051875, &
0.592559, 0.034237, -0.051875, &
0.590251, 0.035193, -0.051875, &
0.589295, 0.037500, -0.051875, &
0.585946, 0.037500, -0.051875, &
0.584990, 0.035193, -0.051875, &
0.582683, 0.034237, -0.051875, &
0.580375, 0.035193, -0.051875, &
0.579419, 0.037500, -0.051875, &
0.576070, 0.037500, -0.051875, &
0.575114, 0.035193, -0.051875, &
0.572807, 0.034237, -0.051875, &
0.570499, 0.035193, -0.051875, &
0.569544, 0.037500, -0.051875, &
0.566194, 0.037500, -0.051875, &
0.565238, 0.035193, -0.051875, &
0.562931, 0.034237, -0.051875, &
0.560623, 0.035193, -0.051875, &
0.559668, 0.037500, -0.051875, &
0.556318, 0.037500, -0.051875, &
0.555362, 0.035193, -0.051875, &
0.553055, 0.034237, -0.051875, &
0.550747, 0.035193, -0.051875, &
0.549792, 0.037500, -0.051875, &
0.546442, 0.037500, -0.051875, &
0.545486, 0.035193, -0.051875, &
0.543179, 0.034237, -0.051875, &
0.540871, 0.035193, -0.051875, &
0.539916, 0.037500, -0.051875, &
0.536566, 0.037500, -0.051875, &
0.535610, 0.035193, -0.051875, &
0.533303, 0.034237, -0.051875, &
0.530995, 0.035193, -0.051875, &
0.530040, 0.037500, -0.051875, &
0.526690, 0.037500, -0.051875, &
0.525734, 0.035193, -0.051875, &
0.523427, 0.034237, -0.051875, &
0.521119, 0.035193, -0.051875, &
0.520164, 0.037500, -0.051875, &
0.516814, 0.037500, -0.051875, &
0.515858, 0.035193, -0.051875, &
0.513551, 0.034237, -0.051875, &
0.511243, 0.035193, -0.051875, &
0.510288, 0.037500, -0.051875, &
0.506938, 0.037500, -0.051875, &
0.505982, 0.035193, -0.051875, &
0.503675, 0.034237, -0.051875, &
0.501367, 0.035193, -0.051875, &
0.500412, 0.037500, -0.051875, &
0.497062, 0.037500, -0.051875, &
0.496106, 0.035193, -0.051875, &
0.493799, 0.034237, -0.051875, &
0.491491, 0.035193, -0.051875, &
0.490536, 0.037500, -0.051875, &
0.487186, 0.037500, -0.051875, &
0.486230, 0.035193, -0.051875, &
0.483923, 0.034237, -0.051875, &
0.481615, 0.035193, -0.051875, &
0.480660, 0.037500, -0.051875, &
0.477310, 0.037500, -0.051875, &
0.476354, 0.035193, -0.051875, &
0.474047, 0.034237, -0.051875, &
0.471739, 0.035193, -0.051875, &
0.470784, 0.037500, -0.051875, &
0.467434, 0.037500, -0.051875, &
0.466478, 0.035193, -0.051875, &
0.464171, 0.034237, -0.051875, &
0.461864, 0.035193, -0.051875, &
0.460908, 0.037500, -0.051875, &
0.457558, 0.037500, -0.051875, &
0.456602, 0.035193, -0.051875, &
0.454295, 0.034237, -0.051875, &
0.451988, 0.035193, -0.051875, &
0.451032, 0.037500, -0.051875, &
0.447682, 0.037500, -0.051875, &
0.446726, 0.035193, -0.051875, &
0.444419, 0.034237, -0.051875, &
0.442112, 0.035193, -0.051875, &
0.441156, 0.037500, -0.051875, &
0.437806, 0.037500, -0.051875, &
0.436850, 0.035193, -0.051875, &
0.434543, 0.034237, -0.051875, &
0.432236, 0.035193, -0.051875, &
0.431280, 0.037500, -0.051875, &
0.427930, 0.037500, -0.051875, &
0.426974, 0.035193, -0.051875, &
0.424667, 0.034237, -0.051875, &
0.422360, 0.035193, -0.051875, &
0.421404, 0.037500, -0.051875, &
0.418054, 0.037500, -0.051875, &
0.417098, 0.035193, -0.051875, &
0.414791, 0.034237, -0.051875, &
0.412484, 0.035193, -0.051875, &
0.411528, 0.037500, -0.051875, &
0.408178, 0.037500, -0.051875, &
0.407222, 0.035193, -0.051875, &
0.404915, 0.034237, -0.051875, &
0.402608, 0.035193, -0.051875, &
0.401652, 0.037500, -0.051875, &
0.398302, 0.037500, -0.051875, &
0.397346, 0.035193, -0.051875, &
0.395039, 0.034237, -0.051875, &
0.392732, 0.035193, -0.051875, &
0.391776, 0.037500, -0.051875, &
0.388426, 0.037500, -0.051875, &
0.387470, 0.035193, -0.051875, &
0.385163, 0.034237, -0.051875, &
0.382856, 0.035193, -0.051875, &
0.381900, 0.037500, -0.051875, &
0.378550, 0.037500, -0.051875, &
0.377595, 0.035193, -0.051875, &
0.375287, 0.034237, -0.051875, &
0.372980, 0.035193, -0.051875, &
0.372024, 0.037500, -0.051875, &
0.368674, 0.037500, -0.051875, &
0.367719, 0.035193, -0.051875, &
0.365411, 0.034237, -0.051875, &
0.363104, 0.035193, -0.051875, &
0.362148, 0.037500, -0.051875, &
0.358798, 0.037500, -0.051875, &
0.357843, 0.035193, -0.051875, &
0.355535, 0.034237, -0.051875, &
0.353228, 0.035193, -0.051875, &
0.352272, 0.037500, -0.051875, &
0.348922, 0.037500, -0.051875, &
0.347967, 0.035193, -0.051875, &
0.345659, 0.034237, -0.051875, &
0.343352, 0.035193, -0.051875, &
0.342396, 0.037500, -0.051875, &
0.339046, 0.037500, -0.051875, &
0.338091, 0.035193, -0.051875, &
0.335783, 0.034237, -0.051875, &
0.333476, 0.035193, -0.051875, &
0.332520, 0.037500, -0.051875, &
0.329170, 0.037500, -0.051875, &
0.328215, 0.035193, -0.051875, &
0.325907, 0.034237, -0.051875, &
0.323600, 0.035193, -0.051875, &
0.322644, 0.037500, -0.051875, &
0.319294, 0.037500, -0.051875, &
0.318339, 0.035193, -0.051875, &
0.316031, 0.034237, -0.051875, &
0.313724, 0.035193, -0.051875, &
0.312768, 0.037500, -0.051875, &
0.309418, 0.037500, -0.051875, &
0.308463, 0.035193, -0.051875, &
0.306155, 0.034237, -0.051875, &
0.303848, 0.035193, -0.051875, &
0.302892, 0.037500, -0.051875, &
0.299542, 0.037500, -0.051875, &
0.298587, 0.035193, -0.051875, &
0.296279, 0.034237, -0.051875, &
0.293972, 0.035193, -0.051875, &
0.293016, 0.037500, -0.051875, &
0.289666, 0.037500, -0.051875, &
0.288711, 0.035193, -0.051875, &
0.286403, 0.034237, -0.051875, &
0.284096, 0.035193, -0.051875, &
0.283140, 0.037500, -0.051875, &
0.279791, 0.037500, -0.051875, &
0.278835, 0.035193, -0.051875, &
0.276527, 0.034237, -0.051875, &
0.274220, 0.035193, -0.051875, &
0.273264, 0.037500, -0.051875, &
0.269915, 0.037500, -0.051875, &
0.268959, 0.035193, -0.051875, &
0.266651, 0.034237, -0.051875, &
0.264344, 0.035193, -0.051875, &
0.263388, 0.037500, -0.051875, &
0.260039, 0.037500, -0.051875, &
0.259083, 0.035193, -0.051875, &
0.256775, 0.034237, -0.051875, &
0.254468, 0.035193, -0.051875, &
0.253512, 0.037500, -0.051875, &
0.250163, 0.037500, -0.051875, &
0.249207, 0.035193, -0.051875, &
0.246899, 0.034237, -0.051875, &
0.244592, 0.035193, -0.051875, &
0.243636, 0.037500, -0.051875, &
0.240287, 0.037500, -0.051875, &
0.239331, 0.035193, -0.051875, &
0.237023, 0.034237, -0.051875, &
0.234716, 0.035193, -0.051875, &
0.233760, 0.037500, -0.051875, &
0.230411, 0.037500, -0.051875, &
0.229455, 0.035193, -0.051875, &
0.227147, 0.034237, -0.051875, &
0.224840, 0.035193, -0.051875, &
0.223884, 0.037500, -0.051875, &
0.220535, 0.037500, -0.051875, &
0.219579, 0.035193, -0.051875, &
0.217271, 0.034237, -0.051875, &
0.214964, 0.035193, -0.051875, &
0.214008, 0.037500, -0.051875, &
0.210659, 0.037500, -0.051875, &
0.209703, 0.035193, -0.051875, &
0.207396, 0.034237, -0.051875, &
0.205088, 0.035193, -0.051875, &
0.204132, 0.037500, -0.051875, &
0.200783, 0.037500, -0.051875, &
0.199827, 0.035193, -0.051875, &
0.197520, 0.034237, -0.051875, &
0.195212, 0.035193, -0.051875, &
0.194256, 0.037500, -0.051875, &
0.190907, 0.037500, -0.051875, &
0.189951, 0.035193, -0.051875, &
0.187644, 0.034237, -0.051875, &
0.185336, 0.035193, -0.051875, &
0.184380, 0.037500, -0.051875, &
0.181031, 0.037500, -0.051875, &
0.180075, 0.035193, -0.051875, &
0.177768, 0.034237, -0.051875, &
0.175460, 0.035193, -0.051875, &
0.174504, 0.037500, -0.051875, &
0.171155, 0.037500, -0.051875, &
0.170199, 0.035193, -0.051875, &
0.167892, 0.034237, -0.051875, &
0.165584, 0.035193, -0.051875, &
0.164628, 0.037500, -0.051875, &
0.161279, 0.037500, -0.051875, &
0.160323, 0.035193, -0.051875, &
0.158016, 0.034237, -0.051875, &
0.155708, 0.035193, -0.051875, &
0.154752, 0.037500, -0.051875, &
0.151403, 0.037500, -0.051875, &
0.150447, 0.035193, -0.051875, &
0.148140, 0.034237, -0.051875, &
0.145832, 0.035193, -0.051875, &
0.144876, 0.037500, -0.051875, &
0.141527, 0.037500, -0.051875, &
0.140571, 0.035193, -0.051875, &
0.138264, 0.034237, -0.051875, &
0.135956, 0.035193, -0.051875, &
0.135001, 0.037500, -0.051875, &
0.131651, 0.037500, -0.051875, &
0.130695, 0.035193, -0.051875, &
0.128388, 0.034237, -0.051875, &
0.126080, 0.035193, -0.051875, &
0.125125, 0.037500, -0.051875, &
0.121775, 0.037500, -0.051875, &
0.120819, 0.035193, -0.051875, &
0.118512, 0.034237, -0.051875, &
0.116204, 0.035193, -0.051875, &
0.115249, 0.037500, -0.051875, &
0.111899, 0.037500, -0.051875, &
0.110943, 0.035193, -0.051875, &
0.108636, 0.034237, -0.051875, &
0.106328, 0.035193, -0.051875, &
0.105373, 0.037500, -0.051875, &
0.102023, 0.037500, -0.051875, &
0.101067, 0.035193, -0.051875, &
0.098760, 0.034237, -0.051875, &
0.096452, 0.035193, -0.051875, &
0.095497, 0.037500, -0.051875, &
0.092147, 0.037500, -0.051875, &
0.091191, 0.035193, -0.051875, &
0.088884, 0.034237, -0.051875, &
0.086576, 0.035193, -0.051875, &
0.085621, 0.037500, -0.051875, &
0.082271, 0.037500, -0.051875, &
0.081315, 0.035193, -0.051875, &
0.079008, 0.034237, -0.051875, &
0.076700, 0.035193, -0.051875, &
0.075745, 0.037500, -0.051875, &
0.072395, 0.037500, -0.051875, &
0.071439, 0.035193, -0.051875, &
0.069132, 0.034237, -0.051875, &
0.066824, 0.035193, -0.051875, &
0.065869, 0.037500, -0.051875, &
0.062519, 0.037500, -0.051875, &
0.061563, 0.035193, -0.051875, &
0.059256, 0.034237, -0.051875, &
0.056948, 0.035193, -0.051875, &
0.055993, 0.037500, -0.051875, &
0.052643, 0.037500, -0.051875, &
0.051687, 0.035193, -0.051875, &
0.049380, 0.034237, -0.051875, &
0.047072, 0.035193, -0.051875, &
0.046117, 0.037500, -0.051875, &
0.042767, 0.037500, -0.051875, &
0.041811, 0.035193, -0.051875, &
0.039504, 0.034237, -0.051875, &
0.037197, 0.035193, -0.051875, &
0.036241, 0.037500, -0.051875, &
0.032891, 0.037500, -0.051875, &
0.031935, 0.035193, -0.051875, &
0.029628, 0.034237, -0.051875, &
0.027321, 0.035193, -0.051875, &
0.026365, 0.037500, -0.051875, &
0.023015, 0.037500, -0.051875, &
0.022059, 0.035193, -0.051875, &
0.019752, 0.034237, -0.051875, &
0.017445, 0.035193, -0.051875, &
0.016489, 0.037500, -0.051875, &
0.013139, 0.037500, -0.051875, &
0.012183, 0.035193, -0.051875, &
0.009876, 0.034237, -0.051875, &
0.007569, 0.035193, -0.051875, &
0.006613, 0.037500, -0.051875, &
0.003263, 0.037500, -0.051875, &
0.002307, 0.035193, -0.051875, &
0.000000, 0.034237, -0.051875, &
-0.002307, 0.035193, -0.051875, &
-0.003263, 0.037500, -0.051875, &
-0.006554, 0.037067, -0.051875, &
-0.006880, 0.034591, -0.051875, &
-0.008861, 0.033070, -0.051875, &
-0.011337, 0.033396, -0.051875, &
-0.012858, 0.035378, -0.051875, &
-0.015924, 0.034108, -0.051875, &
-0.015598, 0.031631, -0.051875, &
-0.017118, 0.029650, -0.051875, &
-0.019595, 0.029324, -0.051875, &
-0.021576, 0.030844, -0.051875, &
-0.024209, 0.028824, -0.051875, &
-0.023253, 0.026517, -0.051875, &
-0.024209, 0.024209, -0.051875, &
-0.026517, 0.023253, -0.051875, &
-0.028824, 0.024209, -0.051875, &
-0.030844, 0.021576, -0.051875, &
-0.029324, 0.019595, -0.051875, &
-0.029650, 0.017118, -0.051875, &
-0.031631, 0.015598, -0.051875, &
-0.034108, 0.015924, -0.051875, &
-0.035378, 0.012858, -0.051875, &
-0.033396, 0.011337, -0.051875, &
-0.033070, 0.008861, -0.051875, &
-0.034591, 0.006880, -0.051875, &
-0.037067, 0.006554, -0.051875, &
-0.037500, 0.003263, -0.051875, &
-0.035193, 0.002307, -0.051875, &
-0.034237, 0.000000, -0.051875, &
-0.035193, -0.002307, -0.051875, &
-0.037500, -0.003263, -0.051875, &
-0.037067, -0.006554, -0.051875, &
-0.034591, -0.006880, -0.051875, &
-0.033070, -0.008861, -0.051875, &
-0.033396, -0.011337, -0.051875, &
-0.035378, -0.012858, -0.051875, &
-0.034108, -0.015924, -0.051875, &
-0.031631, -0.015598, -0.051875, &
-0.029650, -0.017118, -0.051875, &
-0.029324, -0.019595, -0.051875, &
-0.030844, -0.021576, -0.051875, &
-0.028824, -0.024209, -0.051875, &
-0.026517, -0.023253, -0.051875, &
-0.024209, -0.024209, -0.051875, &
-0.023253, -0.026517, -0.051875, &
-0.024209, -0.028824, -0.051875, &
-0.021576, -0.030844, -0.051875, &
-0.019595, -0.029324, -0.051875, &
-0.017118, -0.029650, -0.051875, &
-0.015598, -0.031631, -0.051875, &
-0.015924, -0.034108, -0.051875, &
-0.012858, -0.035378, -0.051875, &
-0.011337, -0.033396, -0.051875, &
-0.008861, -0.033070, -0.051875, &
-0.006880, -0.034591, -0.051875, &
-0.006554, -0.037067, -0.051875, &
-0.003263, -0.037500, -0.051875, &
-0.002307, -0.035193, -0.051875, &
0.000000, -0.034237, -0.051875, &
0.002307, -0.035193, -0.051875, &
0.003263, -0.037500, -0.051875, &
0.006613, -0.037500, -0.051875, &
0.007569, -0.035193, -0.051875, &
0.009876, -0.034237, -0.051875, &
0.012183, -0.035193, -0.051875, &
0.013139, -0.037500, -0.051875, &
0.016489, -0.037500, -0.051875, &
0.017445, -0.035193, -0.051875, &
0.019752, -0.034237, -0.051875, &
0.022059, -0.035193, -0.051875, &
0.023015, -0.037500, -0.051875, &
0.026365, -0.037500, -0.051875, &
0.027321, -0.035193, -0.051875, &
0.029628, -0.034237, -0.051875, &
0.031935, -0.035193, -0.051875, &
0.032891, -0.037500, -0.051875, &
0.036241, -0.037500, -0.051875, &
0.037197, -0.035193, -0.051875, &
0.039504, -0.034237, -0.051875, &
0.041811, -0.035193, -0.051875, &
0.042767, -0.037500, -0.051875, &
0.046117, -0.037500, -0.051875, &
0.047072, -0.035193, -0.051875, &
0.049380, -0.034237, -0.051875, &
0.051687, -0.035193, -0.051875, &
0.052643, -0.037500, -0.051875, &
0.055993, -0.037500, -0.051875, &
0.056948, -0.035193, -0.051875, &
0.059256, -0.034237, -0.051875, &
0.061563, -0.035193, -0.051875, &
0.062519, -0.037500, -0.051875, &
0.065869, -0.037500, -0.051875, &
0.066824, -0.035193, -0.051875, &
0.069132, -0.034237, -0.051875, &
0.071439, -0.035193, -0.051875, &
0.072395, -0.037500, -0.051875, &
0.075745, -0.037500, -0.051875, &
0.076700, -0.035193, -0.051875, &
0.079008, -0.034237, -0.051875, &
0.081315, -0.035193, -0.051875, &
0.082271, -0.037500, -0.051875, &
0.085621, -0.037500, -0.051875, &
0.086576, -0.035193, -0.051875, &
0.088884, -0.034237, -0.051875, &
0.091191, -0.035193, -0.051875, &
0.092147, -0.037500, -0.051875, &
0.095497, -0.037500, -0.051875, &
0.096452, -0.035193, -0.051875, &
0.098760, -0.034237, -0.051875, &
0.101067, -0.035193, -0.051875, &
0.102023, -0.037500, -0.051875, &
0.105373, -0.037500, -0.051875, &
0.106328, -0.035193, -0.051875, &
0.108636, -0.034237, -0.051875, &
0.110943, -0.035193, -0.051875, &
0.111899, -0.037500, -0.051875, &
0.115249, -0.037500, -0.051875, &
0.116204, -0.035193, -0.051875, &
0.118512, -0.034237, -0.051875, &
0.120819, -0.035193, -0.051875, &
0.121775, -0.037500, -0.051875, &
0.125125, -0.037500, -0.051875, &
0.126080, -0.035193, -0.051875, &
0.128388, -0.034237, -0.051875, &
0.130695, -0.035193, -0.051875, &
0.131651, -0.037500, -0.051875, &
0.135001, -0.037500, -0.051875, &
0.135956, -0.035193, -0.051875, &
0.138264, -0.034237, -0.051875, &
0.140571, -0.035193, -0.051875, &
0.141527, -0.037500, -0.051875, &
0.144876, -0.037500, -0.051875, &
0.145832, -0.035193, -0.051875, &
0.148140, -0.034237, -0.051875, &
0.150447, -0.035193, -0.051875, &
0.151403, -0.037500, -0.051875, &
0.154752, -0.037500, -0.051875, &
0.155708, -0.035193, -0.051875, &
0.158016, -0.034237, -0.051875, &
0.160323, -0.035193, -0.051875, &
0.161279, -0.037500, -0.051875, &
0.164628, -0.037500, -0.051875, &
0.165584, -0.035193, -0.051875, &
0.167892, -0.034237, -0.051875, &
0.170199, -0.035193, -0.051875, &
0.171155, -0.037500, -0.051875, &
0.174504, -0.037500, -0.051875, &
0.175460, -0.035193, -0.051875, &
0.177768, -0.034237, -0.051875, &
0.180075, -0.035193, -0.051875, &
0.181031, -0.037500, -0.051875, &
0.184380, -0.037500, -0.051875, &
0.185336, -0.035193, -0.051875, &
0.187644, -0.034237, -0.051875, &
0.189951, -0.035193, -0.051875, &
0.190907, -0.037500, -0.051875, &
0.194256, -0.037500, -0.051875, &
0.195212, -0.035193, -0.051875, &
0.197520, -0.034237, -0.051875, &
0.199827, -0.035193, -0.051875, &
0.200783, -0.037500, -0.051875, &
0.204132, -0.037500, -0.051875, &
0.205088, -0.035193, -0.051875, &
0.207396, -0.034237, -0.051875, &
0.209703, -0.035193, -0.051875, &
0.210659, -0.037500, -0.051875, &
0.214008, -0.037500, -0.051875, &
0.214964, -0.035193, -0.051875, &
0.217271, -0.034237, -0.051875, &
0.219579, -0.035193, -0.051875, &
0.220535, -0.037500, -0.051875, &
0.223884, -0.037500, -0.051875, &
0.224840, -0.035193, -0.051875, &
0.227147, -0.034237, -0.051875, &
0.229455, -0.035193, -0.051875, &
0.230411, -0.037500, -0.051875, &
0.233760, -0.037500, -0.051875, &
0.234716, -0.035193, -0.051875, &
0.237023, -0.034237, -0.051875, &
0.239331, -0.035193, -0.051875, &
0.240287, -0.037500, -0.051875, &
0.243636, -0.037500, -0.051875, &
0.244592, -0.035193, -0.051875, &
0.246899, -0.034237, -0.051875, &
0.249207, -0.035193, -0.051875, &
0.250163, -0.037500, -0.051875, &
0.253512, -0.037500, -0.051875, &
0.254468, -0.035193, -0.051875, &
0.256775, -0.034237, -0.051875, &
0.259083, -0.035193, -0.051875, &
0.260039, -0.037500, -0.051875, &
0.263388, -0.037500, -0.051875, &
0.264344, -0.035193, -0.051875, &
0.266651, -0.034237, -0.051875, &
0.268959, -0.035193, -0.051875, &
0.269915, -0.037500, -0.051875, &
0.273264, -0.037500, -0.051875, &
0.274220, -0.035193, -0.051875, &
0.276527, -0.034237, -0.051875, &
0.278835, -0.035193, -0.051875, &
0.279791, -0.037500, -0.051875, &
0.283140, -0.037500, -0.051875, &
0.284096, -0.035193, -0.051875, &
0.286403, -0.034237, -0.051875, &
0.288711, -0.035193, -0.051875, &
0.289666, -0.037500, -0.051875, &
0.293016, -0.037500, -0.051875, &
0.293972, -0.035193, -0.051875, &
0.296279, -0.034237, -0.051875, &
0.298587, -0.035193, -0.051875, &
0.299542, -0.037500, -0.051875, &
0.302892, -0.037500, -0.051875, &
0.303848, -0.035193, -0.051875, &
0.306155, -0.034237, -0.051875, &
0.308463, -0.035193, -0.051875, &
0.309418, -0.037500, -0.051875, &
0.312768, -0.037500, -0.051875, &
0.313724, -0.035193, -0.051875, &
0.316031, -0.034237, -0.051875, &
0.318339, -0.035193, -0.051875, &
0.319294, -0.037500, -0.051875, &
0.322644, -0.037500, -0.051875, &
0.323600, -0.035193, -0.051875, &
0.325907, -0.034237, -0.051875, &
0.328215, -0.035193, -0.051875, &
0.329170, -0.037500, -0.051875, &
0.332520, -0.037500, -0.051875, &
0.333476, -0.035193, -0.051875, &
0.335783, -0.034237, -0.051875, &
0.338091, -0.035193, -0.051875, &
0.339046, -0.037500, -0.051875, &
0.342396, -0.037500, -0.051875, &
0.343352, -0.035193, -0.051875, &
0.345659, -0.034237, -0.051875, &
0.347967, -0.035193, -0.051875, &
0.348922, -0.037500, -0.051875, &
0.352272, -0.037500, -0.051875, &
0.353228, -0.035193, -0.051875, &
0.355535, -0.034237, -0.051875, &
0.357843, -0.035193, -0.051875, &
0.358798, -0.037500, -0.051875, &
0.362148, -0.037500, -0.051875, &
0.363104, -0.035193, -0.051875, &
0.365411, -0.034237, -0.051875, &
0.367719, -0.035193, -0.051875, &
0.368674, -0.037500, -0.051875, &
0.372024, -0.037500, -0.051875, &
0.372980, -0.035193, -0.051875, &
0.375287, -0.034237, -0.051875, &
0.377595, -0.035193, -0.051875, &
0.378550, -0.037500, -0.051875, &
0.381900, -0.037500, -0.051875, &
0.382856, -0.035193, -0.051875, &
0.385163, -0.034237, -0.051875, &
0.387470, -0.035193, -0.051875, &
0.388426, -0.037500, -0.051875, &
0.391776, -0.037500, -0.051875, &
0.392732, -0.035193, -0.051875, &
0.395039, -0.034237, -0.051875, &
0.397346, -0.035193, -0.051875, &
0.398302, -0.037500, -0.051875, &
0.401652, -0.037500, -0.051875, &
0.402608, -0.035193, -0.051875, &
0.404915, -0.034237, -0.051875, &
0.407222, -0.035193, -0.051875, &
0.408178, -0.037500, -0.051875, &
0.411528, -0.037500, -0.051875, &
0.412484, -0.035193, -0.051875, &
0.414791, -0.034237, -0.051875, &
0.417098, -0.035193, -0.051875, &
0.418054, -0.037500, -0.051875, &
0.421404, -0.037500, -0.051875, &
0.422360, -0.035193, -0.051875, &
0.424667, -0.034237, -0.051875, &
0.426974, -0.035193, -0.051875, &
0.427930, -0.037500, -0.051875, &
0.431280, -0.037500, -0.051875, &
0.432236, -0.035193, -0.051875, &
0.434543, -0.034237, -0.051875, &
0.436850, -0.035193, -0.051875, &
0.437806, -0.037500, -0.051875, &
0.441156, -0.037500, -0.051875, &
0.442112, -0.035193, -0.051875, &
0.444419, -0.034237, -0.051875, &
0.446726, -0.035193, -0.051875, &
0.447682, -0.037500, -0.051875, &
0.451032, -0.037500, -0.051875, &
0.451988, -0.035193, -0.051875, &
0.454295, -0.034237, -0.051875, &
0.456602, -0.035193, -0.051875, &
0.457558, -0.037500, -0.051875, &
0.460908, -0.037500, -0.051875, &
0.461864, -0.035193, -0.051875, &
0.464171, -0.034237, -0.051875, &
0.466478, -0.035193, -0.051875, &
0.467434, -0.037500, -0.051875, &
0.470784, -0.037500, -0.051875, &
0.471739, -0.035193, -0.051875, &
0.474047, -0.034237, -0.051875, &
0.476354, -0.035193, -0.051875, &
0.477310, -0.037500, -0.051875, &
0.480660, -0.037500, -0.051875, &
0.481615, -0.035193, -0.051875, &
0.483923, -0.034237, -0.051875, &
0.486230, -0.035193, -0.051875, &
0.487186, -0.037500, -0.051875, &
0.490536, -0.037500, -0.051875, &
0.491491, -0.035193, -0.051875, &
0.493799, -0.034237, -0.051875, &
0.496106, -0.035193, -0.051875, &
0.497062, -0.037500, -0.051875, &
0.500412, -0.037500, -0.051875, &
0.501367, -0.035193, -0.051875, &
0.503675, -0.034237, -0.051875, &
0.505982, -0.035193, -0.051875, &
0.506938, -0.037500, -0.051875, &
0.510288, -0.037500, -0.051875, &
0.511243, -0.035193, -0.051875, &
0.513551, -0.034237, -0.051875, &
0.515858, -0.035193, -0.051875, &
0.516814, -0.037500, -0.051875, &
0.520164, -0.037500, -0.051875, &
0.521119, -0.035193, -0.051875, &
0.523427, -0.034237, -0.051875, &
0.525734, -0.035193, -0.051875, &
0.526690, -0.037500, -0.051875, &
0.530040, -0.037500, -0.051875, &
0.530995, -0.035193, -0.051875, &
0.533303, -0.034237, -0.051875, &
0.535610, -0.035193, -0.051875, &
0.536566, -0.037500, -0.051875, &
0.539916, -0.037500, -0.051875, &
0.540871, -0.035193, -0.051875, &
0.543179, -0.034237, -0.051875, &
0.545486, -0.035193, -0.051875, &
0.546442, -0.037500, -0.051875, &
0.549792, -0.037500, -0.051875, &
0.550747, -0.035193, -0.051875, &
0.553055, -0.034237, -0.051875, &
0.555362, -0.035193, -0.051875, &
0.556318, -0.037500, -0.051875, &
0.559668, -0.037500, -0.051875, &
0.560623, -0.035193, -0.051875, &
0.562931, -0.034237, -0.051875, &
0.565238, -0.035193, -0.051875, &
0.566194, -0.037500, -0.051875, &
0.569544, -0.037500, -0.051875, &
0.570499, -0.035193, -0.051875, &
0.572807, -0.034237, -0.051875, &
0.575114, -0.035193, -0.051875, &
0.576070, -0.037500, -0.051875, &
0.579419, -0.037500, -0.051875, &
0.580375, -0.035193, -0.051875, &
0.582683, -0.034237, -0.051875, &
0.584990, -0.035193, -0.051875, &
0.585946, -0.037500, -0.051875, &
0.589295, -0.037500, -0.051875, &
0.590251, -0.035193, -0.051875, &
0.592559, -0.034237, -0.051875, &
0.594866, -0.035193, -0.051875, &
0.595822, -0.037500, -0.051875, &
0.599171, -0.037500, -0.051875, &
0.600127, -0.035193, -0.051875, &
0.602435, -0.034237, -0.051875, &
0.604742, -0.035193, -0.051875, &
0.605698, -0.037500, -0.051875, &
0.602311, -0.038625, -0.051875, &
-0.000000, -0.038625, -0.051875, &
-0.013211, -0.036296, -0.051875, &
-0.024828, -0.029588, -0.051875, &
-0.033450, -0.019313, -0.051875, &
-0.038038, -0.006707, -0.051875, &
-0.038038, 0.006707, -0.051875, &
-0.033450, 0.019312, -0.051875, &
-0.024828, 0.029588, -0.051875, &
-0.013211, 0.036296, -0.051875, &
0.000000, 0.038625, -0.051875, &
0.612311, 0.038625, -0.051875, &
0.625451, 0.036321, -0.051875, &
0.637023, 0.029685, -0.051875, &
0.645648, 0.019507, -0.051875, &
0.650296, 0.007002, -0.051875, &
0.650412, -0.006338, -0.051875, &
0.645983, -0.018922, -0.051875, &
0.637538, -0.029249, -0.051875, &
0.626083, -0.036086, -0.051875, &
0.612985, -0.038619, -0.051875, &
0.609047, -0.037500, -0.051875 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.SLM11_Brace.chain_b23_chain_pair_mar
entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_b23_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Brace.chain_b23_belt render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_Brace material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBracef visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBraceb visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBracef1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBraceb1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.halfBrace2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.frontEarL visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.BackEarL visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.BackEarR visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.FrontEarR visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.BackEarF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.FrontEarF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.plateF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.plateB visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_f12_belt visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Brace.chain_b23_belt visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_LeftRevJ i_marker_name=.sliderActuator.SLM11_Brace.LeftRevJ_marI j_marker_name=.sliderActuator.ground.LeftRevJ_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_slider
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_slider material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_slider visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_slider.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_slider.slide_BaseMar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_Brace.braceGeo 

entity attributes entity_name=.sliderActuator.SLM11_slider.slide_BaseMar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_slider.slider reference_marker=.sliderActuator.SLM11_slider.slide_BaseMar  points_for_profile= &
0.015000, 0.027500, -0.120000, &
0.010000, 0.027500, -0.120000, &
0.010000, 0.040000, -0.120000, &
-0.010000, 0.040000, -0.120000, &
-0.010000, 0.027500, -0.120000, &
-0.015000, 0.027500, -0.120000, &
-0.015000, -0.040000, -0.120000, &
0.015000, -0.040000, -0.120000, &
0.015000, 0.027500, -0.120000 &
length_along_z_axis=0.020000 analytical=yes &
relative_to=.sliderActuator.SLM11_slider.slide_BaseMar
entity attributes entity_name=.sliderActuator.SLM11_slider.slider type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_slider.slider render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_slider.slider1 reference_marker=.sliderActuator.SLM11_slider.slide_BaseMar  points_for_profile= &
-0.010000, 0.033750, -0.100000, &
0.010000, 0.033750, -0.100000, &
0.010000, 0.040000, -0.100000, &
-0.010000, 0.040000, -0.100000, &
-0.010000, 0.033750, -0.100000 &
length_along_z_axis=0.110000 analytical=yes &
relative_to=.sliderActuator.SLM11_slider.slide_BaseMar
entity attributes entity_name=.sliderActuator.SLM11_slider.slider1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_slider.slider1 render=filled
marker create marker_name=.sliderActuator.SLM11_slider.toLinkL_F location=0.000000, 0.100000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_Brace.LeftRevJ_marI 

entity attributes entity_name=.sliderActuator.SLM11_slider.toLinkL_F visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_slider.slider2 reference_marker=.sliderActuator.SLM11_slider.toLinkL_F  points_for_profile= &
0.100000, -0.090000, -0.010000, &
0.100000, -0.100000, -0.010000, &
0.100603, -0.103420, -0.010000, &
0.102340, -0.106428, -0.010000, &
0.105000, -0.108660, -0.010000, &
0.108264, -0.109848, -0.010000, &
0.111736, -0.109848, -0.010000, &
0.115000, -0.108660, -0.010000, &
0.117660, -0.106428, -0.010000, &
0.119397, -0.103420, -0.010000, &
0.120000, -0.100000, -0.010000, &
0.120000, -0.090000, -0.010000, &
0.100000, -0.090000, -0.010000 &
length_along_z_axis=0.020000 analytical=yes &
relative_to=.sliderActuator.SLM11_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM11_slider.slider2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_slider.slider2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_slider.slider3 reference_marker=.sliderActuator.SLM11_slider.toLinkL_F  points_for_profile= &
0.115000, -0.100000, -0.021250, &
0.114193, -0.097277, -0.021250, &
0.112034, -0.095432, -0.021250, &
0.109218, -0.095062, -0.021250, &
0.106654, -0.096284, -0.021250, &
0.105170, -0.098706, -0.021250, &
0.105245, -0.101545, -0.021250, &
0.106853, -0.103886, -0.021250, &
0.109477, -0.104973, -0.021250, &
0.112270, -0.104455, -0.021250, &
0.114330, -0.102500, -0.021250, &
0.115000, -0.100000, -0.021250 &
length_along_z_axis=0.042500 analytical=yes &
relative_to=.sliderActuator.SLM11_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM11_slider.slider3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_slider.slider3 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_slider.slider4 reference_marker=.sliderActuator.SLM11_slider.toLinkL_F  points_for_profile= &
0.010000, 0.000000, -0.071250, &
0.008387, 0.005446, -0.071250, &
0.004067, 0.009135, -0.071250, &
-0.001564, 0.009877, -0.071250, &
-0.006691, 0.007431, -0.071250, &
-0.009659, 0.002588, -0.071250, &
-0.009511, -0.003090, -0.071250, &
-0.006293, -0.007771, -0.071250, &
-0.001045, -0.009945, -0.071250, &
0.004540, -0.008910, -0.071250, &
0.008660, -0.005000, -0.071250, &
0.010000, 0.000000, -0.071250 &
length_along_z_axis=0.142500 analytical=yes &
relative_to=.sliderActuator.SLM11_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM11_slider.slider4 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_slider.slider4 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_slider.slider5 reference_marker=.sliderActuator.SLM11_slider.toLinkL_F  points_for_profile= &
0.010000, 0.000000, -0.010000, &
0.009397, 0.003420, -0.010000, &
0.007660, 0.006428, -0.010000, &
0.005000, 0.008660, -0.010000, &
0.001736, 0.009848, -0.010000, &
-0.001736, 0.009848, -0.010000, &
-0.005000, 0.008660, -0.010000, &
-0.007660, 0.006428, -0.010000, &
-0.009397, 0.003420, -0.010000, &
-0.010000, 0.000000, -0.010000, &
-0.010000, -0.010000, -0.010000, &
0.010000, -0.010000, -0.010000, &
0.010000, 0.000000, -0.010000 &
length_along_z_axis=0.020000 analytical=yes &
relative_to=.sliderActuator.SLM11_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM11_slider.slider5 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_slider.slider5 render=filled
marker create marker_name=.sliderActuator.SLM11_slider.slider_linkF_marI location=0.000000, 0.100000, 0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_slider.slider_linkF_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_slider.slider_linkB_marJ location=0.000000, 0.100000, -0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_slider.slider_linkB_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_slider.slider_linkRF_marI location=0.110000, 0.000000, 0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_slider.slider_linkRF_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_slider.slider_linkRB_marI location=0.110000, 0.000000, -0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_slider.slider_linkRB_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_slider material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_slider.slider visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_slider.slider1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_slider.slider2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_slider.slider3 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_slider.slider4 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_slider.slider5 visibility=on color=WHITE

data_element create variable variable_name=.sliderActuator.SLM11_motionFunc function="(0.022240+sin(time/3*2*PI-0.199467)*0.112240)*1.000000"
constraint create joint translational joint_name=.sliderActuator.SLM11_SliderJoint i_marker_name=.sliderActuator.SLM11_slider.slide_BaseMar j_marker_name=.sliderActuator.SLM11_Brace.braceGeo
constraint create motion_generator motion_name=.sliderActuator.SLM11_SliderJoint_motion type_of_freedom=translational joint_name=.sliderActuator.SLM11_SliderJoint  function="-VARVAL(.sliderActuator.SLM11_motionFunc)"
measure create function measure=.sliderActuator.SLM11_ActForce function="-MOTION(.sliderActuator.SLM11_SliderJoint_motion, 0, 4, .sliderActuator.SLM11_Brace.braceGeo)" create_measure_display=no
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_LinkLF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkLF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkLF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_LinkLF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_LinkLF.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkLF.LinkLF_endI location=0.000000, 0.100000, 0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkLF.LinkLF_endJ location=-0.086603, 0.050000, 0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkLF.LinkLF_link_cyn1 reference_marker=.sliderActuator.SLM11_LinkLF.LinkLF_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkLF.LinkLF_endI
entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkLF.LinkLF_link_cyn2 reference_marker=.sliderActuator.SLM11_LinkLF.LinkLF_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkLF.LinkLF_endJ
entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_LinkLF.LinkLF_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_LinkLF.LinkLF_endI j_marker=.sliderActuator.SLM11_LinkLF.LinkLF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_csg1 base_object=.sliderActuator.SLM11_LinkLF.LinkLF_link object=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_csg2 base_object=.sliderActuator.SLM11_LinkLF.LinkLF_link_csg1 object=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_LinkLF.slider_linkF_marJ location=0.000000, 0.100000, 0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLF.slider_linkF_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkLF.crank_linkLF_marJ location=-0.086603, 0.050000, 0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLF.crank_linkLF_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkLF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkLF.LinkLF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_slider_linkF i_marker_name=.sliderActuator.SLM11_slider.slider_linkF_marI j_marker_name=.sliderActuator.SLM11_LinkLF.slider_linkF_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_crank_linkLF i_marker_name=.sliderActuator.ground.crank_linkLF_marI j_marker_name=.sliderActuator.SLM11_LinkLF.crank_linkLF_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_LinkLB
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkLB material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkLB visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_LinkLB.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_LinkLB.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkLB.LinkLB_endI location=0.000000, 0.100000, -0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkLB.LinkLB_endJ location=-0.086603, 0.050000, -0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkLB.LinkLB_link_cyn1 reference_marker=.sliderActuator.SLM11_LinkLB.LinkLB_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkLB.LinkLB_endI
entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkLB.LinkLB_link_cyn2 reference_marker=.sliderActuator.SLM11_LinkLB.LinkLB_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkLB.LinkLB_endJ
entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_LinkLB.LinkLB_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_LinkLB.LinkLB_endI j_marker=.sliderActuator.SLM11_LinkLB.LinkLB_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_csg1 base_object=.sliderActuator.SLM11_LinkLB.LinkLB_link object=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_csg2 base_object=.sliderActuator.SLM11_LinkLB.LinkLB_link_csg1 object=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_LinkLB.slider_linkB_marI location=0.000000, 0.100000, -0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLB.slider_linkB_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkLB.crank_linkLB_marJ location=-0.086603, 0.050000, -0.071250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkLB.crank_linkLB_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkLB material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkLB.LinkLB_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_slider_linkB i_marker_name=.sliderActuator.SLM11_LinkLB.slider_linkB_marI j_marker_name=.sliderActuator.SLM11_slider.slider_linkB_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_crank_linkLB i_marker_name=.sliderActuator.ground.crank_linkLB_marI j_marker_name=.sliderActuator.SLM11_LinkLB.crank_linkLB_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_LinkRF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkRF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkRF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_LinkRF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_LinkRF.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkRF.LinkRF_endI location=0.110000, 0.000000, 0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkRF.LinkRF_endJ location=0.208714, 0.015984, 0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkRF.LinkRF_link_cyn1 reference_marker=.sliderActuator.SLM11_LinkRF.LinkRF_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkRF.LinkRF_endI
entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkRF.LinkRF_link_cyn2 reference_marker=.sliderActuator.SLM11_LinkRF.LinkRF_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkRF.LinkRF_endJ
entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_LinkRF.LinkRF_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_LinkRF.LinkRF_endI j_marker=.sliderActuator.SLM11_LinkRF.LinkRF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_csg1 base_object=.sliderActuator.SLM11_LinkRF.LinkRF_link object=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_csg2 base_object=.sliderActuator.SLM11_LinkRF.LinkRF_link_csg1 object=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_LinkRF.slider_linkRF_marJ location=0.110000, 0.000000, 0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRF.slider_linkRF_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkRF.RevRJF_marJ location=0.208714, 0.015984, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRF.RevRJF_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkRF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkRF.LinkRF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_slider_linkRF i_marker_name=.sliderActuator.SLM11_slider.slider_linkRF_marI j_marker_name=.sliderActuator.SLM11_LinkRF.slider_linkRF_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_LinkRB
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkRB material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkRB visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_LinkRB.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_LinkRB.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkRB.LinkRB_endI location=0.110000, 0.000000, -0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkRB.LinkRB_endJ location=0.208714, 0.015984, -0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkRB.LinkRB_link_cyn1 reference_marker=.sliderActuator.SLM11_LinkRB.LinkRB_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkRB.LinkRB_endI
entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_LinkRB.LinkRB_link_cyn2 reference_marker=.sliderActuator.SLM11_LinkRB.LinkRB_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_LinkRB.LinkRB_endJ
entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_LinkRB.LinkRB_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_LinkRB.LinkRB_endI j_marker=.sliderActuator.SLM11_LinkRB.LinkRB_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_csg1 base_object=.sliderActuator.SLM11_LinkRB.LinkRB_link object=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_csg2 base_object=.sliderActuator.SLM11_LinkRB.LinkRB_link_csg1 object=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_LinkRB.slider_linkRB_marJ location=0.110000, 0.000000, -0.024375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRB.slider_linkRB_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_LinkRB.RevRJB_marJ location=0.208714, 0.015984, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_LinkRB.RevRJB_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_LinkRB material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_LinkRB.LinkRB_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_slider_linkRB i_marker_name=.sliderActuator.SLM11_slider.slider_linkRB_marI j_marker_name=.sliderActuator.SLM11_LinkRB.slider_linkRB_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_Part2
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_Part2 material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_Part2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_Part2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_Part2.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.RevRJF_marI location=0.208714, 0.015984, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.RevRJF_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.RevRJB_marI location=0.208714, 0.015984, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.RevRJB_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.part2_bracef_marJ location=0.154480, 0.100000, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.part2_bracef_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.part2_braceb_marJ location=0.154480, 0.100000, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.part2_braceb_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.trianglefplatem1 location=0.154480, 0.100000, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglefplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.trianglefplatem2 location=0.151218, 0.000053, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglefplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.trianglefplatem3 location=0.208714, 0.015984, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglefplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_Part2.trianglef marker_name=.sliderActuator.SLM11_Part2.trianglefplatem1, .sliderActuator.SLM11_Part2.trianglefplatem2, .sliderActuator.SLM11_Part2.trianglefplatem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglef type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_Part2.trianglebplatem1 location=0.154480, 0.100000, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglebplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.trianglebplatem2 location=0.151218, 0.000053, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglebplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.trianglebplatem3 location=0.208714, 0.015984, -0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglebplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_Part2.triangleb marker_name=.sliderActuator.SLM11_Part2.trianglebplatem1, .sliderActuator.SLM11_Part2.trianglebplatem2, .sliderActuator.SLM11_Part2.trianglebplatem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_Part2.triangleb type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_Part2.part21_link_marI location=0.208714, 0.015984, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.part21_link_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.part2_distalLinkf_marI location=0.151218, 0.000053, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.part2_distalLinkf_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_Part2.part2_distalLinkb_marI location=0.151218, 0.000053, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Part2.part2_distalLinkb_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_Part2 material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_Part2.trianglef visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Part2.triangleb visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_RevRJF i_marker_name=.sliderActuator.SLM11_Part2.RevRJF_marI j_marker_name=.sliderActuator.SLM11_LinkRF.RevRJF_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_RevRJB i_marker_name=.sliderActuator.SLM11_Part2.RevRJB_marI j_marker_name=.sliderActuator.SLM11_LinkRB.RevRJB_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_part2_bracef i_marker_name=.sliderActuator.SLM11_Brace.part2_bracef_marI j_marker_name=.sliderActuator.SLM11_Part2.part2_bracef_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_part2_braceb i_marker_name=.sliderActuator.SLM11_Brace.part2_braceb_marI j_marker_name=.sliderActuator.SLM11_Part2.part2_braceb_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_part21
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_part21 material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_part21 visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_part21.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_part21.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_part21.cynmar location=0.054234, -0.084016, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_part21.cynmar visibility=on
marker create marker_name=.sliderActuator.SLM11_part21.splateplatem1 location=0.000000, 0.000000, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_part21.splateplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_part21.splateplatem2 location=-0.003262, -0.099947, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_part21.splateplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_part21.splateplatem3 location=0.054234, -0.084016, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_part21.splateplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_part21.splate marker_name=.sliderActuator.SLM11_part21.splateplatem1, .sliderActuator.SLM11_part21.splateplatem2, .sliderActuator.SLM11_part21.splateplatem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_part21.splate type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_part21.cyn reference_marker=.sliderActuator.SLM11_part21.cynmar  points_for_profile= &
0.005000, 0.000000, 0.003125, &
0.004193, 0.002723, 0.003125, &
0.002034, 0.004568, 0.003125, &
-0.000782, 0.004938, 0.003125, &
-0.003346, 0.003716, 0.003125, &
-0.004830, 0.001294, 0.003125, &
-0.004755, -0.001545, 0.003125, &
-0.003147, -0.003886, 0.003125, &
-0.000523, -0.004973, 0.003125, &
0.002270, -0.004455, 0.003125, &
0.004330, -0.002500, 0.003125, &
0.005000, 0.000000, 0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_part21.cynmar
entity attributes entity_name=.sliderActuator.SLM11_part21.cyn type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_part21.cyn render=filled
marker create marker_name=.sliderActuator.SLM11_part21.part21_bracef_marJ location=0.000000, 0.000000, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_part21.part21_bracef_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_part21.part2_link_marI location=0.054234, -0.084016, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_part21.part2_link_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_part21.bal2_part21_marJ location=0.013646, -0.099065, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_part21.bal2_part21_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_part21 material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_part21.splate visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_part21.cyn visibility=on color=WHITE

part create rigid_body name_and_position part_name=.sliderActuator.SLM11_Link21_RF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_Link21_RF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_Link21_RF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_Link21_RF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_endI location=0.208714, 0.015984, 0.030625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_endJ location=0.054234, -0.084016, 0.030625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn1 reference_marker=.sliderActuator.SLM11_Link21_RF.Link21_RF_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_Link21_RF.Link21_RF_endI
entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn2 reference_marker=.sliderActuator.SLM11_Link21_RF.Link21_RF_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_Link21_RF.Link21_RF_endJ
entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_Link21_RF.Link21_RF_endI j_marker=.sliderActuator.SLM11_Link21_RF.Link21_RF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_csg1 base_object=.sliderActuator.SLM11_Link21_RF.Link21_RF_link object=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_csg2 base_object=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_csg1 object=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_Link21_RF.part21_link_marJ location=0.208714, 0.015984, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.part21_link_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_Link21_RF.part2_link_marJ location=0.054234, -0.084016, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.part2_link_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_Link21_RF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_Link21_RF.Link21_RF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_part21_bracef i_marker_name=.sliderActuator.SLM11_Brace.part21_bracef_marI j_marker_name=.sliderActuator.SLM11_part21.part21_bracef_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_part21_link i_marker_name=.sliderActuator.SLM11_Part2.part21_link_marI j_marker_name=.sliderActuator.SLM11_Link21_RF.part21_link_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_part2_link i_marker_name=.sliderActuator.SLM11_part21.part2_link_marI j_marker_name=.sliderActuator.SLM11_Link21_RF.part2_link_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_CrankFF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_CrankFF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_CrankFF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_CrankFF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.trianglef1platem1 location=0.400000, 0.100000, 0.055625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.trianglef1platem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.trianglef1platem2 location=0.396738, 0.000053, 0.055625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.trianglef1platem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.trianglef1platem3 location=0.755224, -0.083891, 0.055625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.trianglef1platem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_CrankFF.trianglef1 marker_name=.sliderActuator.SLM11_CrankFF.trianglef1platem1, .sliderActuator.SLM11_CrankFF.trianglef1platem2, .sliderActuator.SLM11_CrankFF.trianglef1platem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.trianglef1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_CrankFF.triangleb1platem1 location=0.400000, 0.100000, -0.055625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.triangleb1platem1 visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.triangleb1platem2 location=0.396738, 0.000053, -0.055625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.triangleb1platem2 visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.triangleb1platem3 location=0.755224, -0.083891, -0.055625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.triangleb1platem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM11_CrankFF.triangleb1 marker_name=.sliderActuator.SLM11_CrankFF.triangleb1platem1, .sliderActuator.SLM11_CrankFF.triangleb1platem2, .sliderActuator.SLM11_CrankFF.triangleb1platem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.triangleb1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_CrankFF.crank_brace_f_marI location=0.400000, 0.100000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.crank_brace_f_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.centM location=0.400000, 0.100000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.centM visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_CrankFF.connectRod reference_marker=.sliderActuator.SLM11_CrankFF.centM  points_for_profile= &
0.005000, 0.000000, -0.071250, &
0.004193, 0.002723, -0.071250, &
0.002034, 0.004568, -0.071250, &
-0.000782, 0.004938, -0.071250, &
-0.003346, 0.003716, -0.071250, &
-0.004830, 0.001294, -0.071250, &
-0.004755, -0.001545, -0.071250, &
-0.003147, -0.003886, -0.071250, &
-0.000523, -0.004973, -0.071250, &
0.002270, -0.004455, -0.071250, &
0.004330, -0.002500, -0.071250, &
0.005000, 0.000000, -0.071250 &
length_along_z_axis=0.142500 analytical=yes &
relative_to=.sliderActuator.SLM11_CrankFF.centM
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.connectRod type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_CrankFF.connectRod render=filled
marker create marker_name=.sliderActuator.SLM11_CrankFF.centM1 location=0.396738, 0.000053, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.centM1 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_CrankFF.connectRod2 reference_marker=.sliderActuator.SLM11_CrankFF.centM1  points_for_profile= &
0.005000, 0.000000, -0.058750, &
0.004193, 0.002723, -0.058750, &
0.002034, 0.004568, -0.058750, &
-0.000782, 0.004938, -0.058750, &
-0.003346, 0.003716, -0.058750, &
-0.004830, 0.001294, -0.058750, &
-0.004755, -0.001545, -0.058750, &
-0.003147, -0.003886, -0.058750, &
-0.000523, -0.004973, -0.058750, &
0.002270, -0.004455, -0.058750, &
0.004330, -0.002500, -0.058750, &
0.005000, 0.000000, -0.058750 &
length_along_z_axis=0.117500 analytical=yes &
relative_to=.sliderActuator.SLM11_CrankFF.centM1
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.connectRod2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_CrankFF.connectRod2 render=filled
marker create marker_name=.sliderActuator.SLM11_CrankFF.centM2 location=0.755224, -0.083891, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.centM2 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_CrankFF.connectRod3 reference_marker=.sliderActuator.SLM11_CrankFF.centM2  points_for_profile= &
0.005000, 0.000000, -0.058750, &
0.004193, 0.002723, -0.058750, &
0.002034, 0.004568, -0.058750, &
-0.000782, 0.004938, -0.058750, &
-0.003346, 0.003716, -0.058750, &
-0.004830, 0.001294, -0.058750, &
-0.004755, -0.001545, -0.058750, &
-0.003147, -0.003886, -0.058750, &
-0.000523, -0.004973, -0.058750, &
0.002270, -0.004455, -0.058750, &
0.004330, -0.002500, -0.058750, &
0.005000, 0.000000, -0.058750 &
length_along_z_axis=0.117500 analytical=yes &
relative_to=.sliderActuator.SLM11_CrankFF.centM2
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.connectRod3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_CrankFF.connectRod3 render=filled
marker create marker_name=.sliderActuator.SLM11_CrankFF.crank_distalLinkf_marI location=0.396738, 0.000053, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.crank_distalLinkf_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.crank_distalLinkb_marI location=0.396738, 0.000053, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.crank_distalLinkb_marI visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.J15_marJ location=0.758552, 0.044726, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.J15_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.J15B_marJ location=0.758552, 0.044726, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.J15B_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.chain_f01_chain_pair_mar location=0.377395, 0.166051, 0.000000 orientation=0.000000, 0.000000, -17.656691 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_f01_chain_pair_mar visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.chain_f01_left_marJ location=0.377395, 0.166051, 0.034688 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_f01_left_marJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_CrankFF.chain_f01_belt reference_marker=.sliderActuator.SLM11_CrankFF.chain_f01_chain_pair_mar  points_for_profile= &
0.396737, -0.037500, 0.035313, &
0.397693, -0.035193, 0.035313, &
0.400000, -0.034237, 0.035313, &
0.402307, -0.035193, 0.035313, &
0.403263, -0.037500, 0.035313, &
0.406554, -0.037067, 0.035313, &
0.406880, -0.034591, 0.035313, &
0.408861, -0.033070, 0.035313, &
0.411337, -0.033396, 0.035313, &
0.412858, -0.035378, 0.035313, &
0.415924, -0.034108, 0.035313, &
0.415598, -0.031631, 0.035313, &
0.417118, -0.029650, 0.035313, &
0.419595, -0.029324, 0.035313, &
0.421576, -0.030844, 0.035313, &
0.424209, -0.028824, 0.035313, &
0.423253, -0.026517, 0.035313, &
0.424209, -0.024209, 0.035313, &
0.426517, -0.023253, 0.035313, &
0.428824, -0.024209, 0.035313, &
0.430844, -0.021576, 0.035313, &
0.429324, -0.019595, 0.035313, &
0.429650, -0.017118, 0.035313, &
0.431631, -0.015598, 0.035313, &
0.434108, -0.015924, 0.035313, &
0.435378, -0.012858, 0.035313, &
0.433396, -0.011337, 0.035313, &
0.433070, -0.008861, 0.035313, &
0.434591, -0.006880, 0.035313, &
0.437067, -0.006554, 0.035313, &
0.437500, -0.003263, 0.035313, &
0.435193, -0.002307, 0.035313, &
0.434237, 0.000000, 0.035313, &
0.435193, 0.002307, 0.035313, &
0.437500, 0.003263, 0.035313, &
0.437067, 0.006554, 0.035313, &
0.434591, 0.006880, 0.035313, &
0.433070, 0.008861, 0.035313, &
0.433396, 0.011337, 0.035313, &
0.435378, 0.012858, 0.035313, &
0.434108, 0.015924, 0.035313, &
0.431631, 0.015598, 0.035313, &
0.429650, 0.017118, 0.035313, &
0.429324, 0.019595, 0.035313, &
0.430844, 0.021576, 0.035313, &
0.428824, 0.024209, 0.035313, &
0.426517, 0.023253, 0.035313, &
0.424209, 0.024209, 0.035313, &
0.423253, 0.026517, 0.035313, &
0.424209, 0.028824, 0.035313, &
0.421576, 0.030844, 0.035313, &
0.419595, 0.029324, 0.035313, &
0.417118, 0.029650, 0.035313, &
0.415598, 0.031631, 0.035313, &
0.415924, 0.034108, 0.035313, &
0.412858, 0.035378, 0.035313, &
0.411337, 0.033396, 0.035313, &
0.408861, 0.033070, 0.035313, &
0.406880, 0.034591, 0.035313, &
0.406554, 0.037067, 0.035313, &
0.403263, 0.037500, 0.035313, &
0.402307, 0.035193, 0.035313, &
0.400000, 0.034237, 0.035313, &
0.397693, 0.035193, 0.035313, &
0.396737, 0.037500, 0.035313, &
0.393263, 0.037500, 0.035313, &
0.392307, 0.035193, 0.035313, &
0.390000, 0.034237, 0.035313, &
0.387693, 0.035193, 0.035313, &
0.386737, 0.037500, 0.035313, &
0.383263, 0.037500, 0.035313, &
0.382307, 0.035193, 0.035313, &
0.380000, 0.034237, 0.035313, &
0.377693, 0.035193, 0.035313, &
0.376737, 0.037500, 0.035313, &
0.373263, 0.037500, 0.035313, &
0.372307, 0.035193, 0.035313, &
0.370000, 0.034237, 0.035313, &
0.367693, 0.035193, 0.035313, &
0.366737, 0.037500, 0.035313, &
0.363263, 0.037500, 0.035313, &
0.362307, 0.035193, 0.035313, &
0.360000, 0.034237, 0.035313, &
0.357693, 0.035193, 0.035313, &
0.356737, 0.037500, 0.035313, &
0.353263, 0.037500, 0.035313, &
0.352307, 0.035193, 0.035313, &
0.350000, 0.034237, 0.035313, &
0.347693, 0.035193, 0.035313, &
0.346737, 0.037500, 0.035313, &
0.343263, 0.037500, 0.035313, &
0.342307, 0.035193, 0.035313, &
0.340000, 0.034237, 0.035313, &
0.337693, 0.035193, 0.035313, &
0.336737, 0.037500, 0.035313, &
0.333263, 0.037500, 0.035313, &
0.332307, 0.035193, 0.035313, &
0.330000, 0.034237, 0.035313, &
0.327693, 0.035193, 0.035313, &
0.326737, 0.037500, 0.035313, &
0.323263, 0.037500, 0.035313, &
0.322307, 0.035193, 0.035313, &
0.320000, 0.034237, 0.035313, &
0.317693, 0.035193, 0.035313, &
0.316737, 0.037500, 0.035313, &
0.313263, 0.037500, 0.035313, &
0.312307, 0.035193, 0.035313, &
0.310000, 0.034237, 0.035313, &
0.307693, 0.035193, 0.035313, &
0.306737, 0.037500, 0.035313, &
0.303263, 0.037500, 0.035313, &
0.302307, 0.035193, 0.035313, &
0.300000, 0.034237, 0.035313, &
0.297693, 0.035193, 0.035313, &
0.296737, 0.037500, 0.035313, &
0.293263, 0.037500, 0.035313, &
0.292307, 0.035193, 0.035313, &
0.290000, 0.034237, 0.035313, &
0.287693, 0.035193, 0.035313, &
0.286737, 0.037500, 0.035313, &
0.283263, 0.037500, 0.035313, &
0.282307, 0.035193, 0.035313, &
0.280000, 0.034237, 0.035313, &
0.277693, 0.035193, 0.035313, &
0.276737, 0.037500, 0.035313, &
0.273263, 0.037500, 0.035313, &
0.272307, 0.035193, 0.035313, &
0.270000, 0.034237, 0.035313, &
0.267693, 0.035193, 0.035313, &
0.266737, 0.037500, 0.035313, &
0.263263, 0.037500, 0.035313, &
0.262307, 0.035193, 0.035313, &
0.260000, 0.034237, 0.035313, &
0.257693, 0.035193, 0.035313, &
0.256737, 0.037500, 0.035313, &
0.253263, 0.037500, 0.035313, &
0.252307, 0.035193, 0.035313, &
0.250000, 0.034237, 0.035313, &
0.247693, 0.035193, 0.035313, &
0.246737, 0.037500, 0.035313, &
0.243263, 0.037500, 0.035313, &
0.242307, 0.035193, 0.035313, &
0.240000, 0.034237, 0.035313, &
0.237693, 0.035193, 0.035313, &
0.236737, 0.037500, 0.035313, &
0.233263, 0.037500, 0.035313, &
0.232307, 0.035193, 0.035313, &
0.230000, 0.034237, 0.035313, &
0.227693, 0.035193, 0.035313, &
0.226737, 0.037500, 0.035313, &
0.223263, 0.037500, 0.035313, &
0.222307, 0.035193, 0.035313, &
0.220000, 0.034237, 0.035313, &
0.217693, 0.035193, 0.035313, &
0.216737, 0.037500, 0.035313, &
0.213263, 0.037500, 0.035313, &
0.212307, 0.035193, 0.035313, &
0.210000, 0.034237, 0.035313, &
0.207693, 0.035193, 0.035313, &
0.206737, 0.037500, 0.035313, &
0.203263, 0.037500, 0.035313, &
0.202307, 0.035193, 0.035313, &
0.200000, 0.034237, 0.035313, &
0.197693, 0.035193, 0.035313, &
0.196737, 0.037500, 0.035313, &
0.193263, 0.037500, 0.035313, &
0.192307, 0.035193, 0.035313, &
0.190000, 0.034237, 0.035313, &
0.187693, 0.035193, 0.035313, &
0.186737, 0.037500, 0.035313, &
0.183263, 0.037500, 0.035313, &
0.182307, 0.035193, 0.035313, &
0.180000, 0.034237, 0.035313, &
0.177693, 0.035193, 0.035313, &
0.176737, 0.037500, 0.035313, &
0.173263, 0.037500, 0.035313, &
0.172307, 0.035193, 0.035313, &
0.170000, 0.034237, 0.035313, &
0.167693, 0.035193, 0.035313, &
0.166737, 0.037500, 0.035313, &
0.163263, 0.037500, 0.035313, &
0.162307, 0.035193, 0.035313, &
0.160000, 0.034237, 0.035313, &
0.157693, 0.035193, 0.035313, &
0.156737, 0.037500, 0.035313, &
0.153263, 0.037500, 0.035313, &
0.152307, 0.035193, 0.035313, &
0.150000, 0.034237, 0.035313, &
0.147693, 0.035193, 0.035313, &
0.146737, 0.037500, 0.035313, &
0.143263, 0.037500, 0.035313, &
0.142307, 0.035193, 0.035313, &
0.140000, 0.034237, 0.035313, &
0.137693, 0.035193, 0.035313, &
0.136737, 0.037500, 0.035313, &
0.133263, 0.037500, 0.035313, &
0.132307, 0.035193, 0.035313, &
0.130000, 0.034237, 0.035313, &
0.127693, 0.035193, 0.035313, &
0.126737, 0.037500, 0.035313, &
0.123263, 0.037500, 0.035313, &
0.122307, 0.035193, 0.035313, &
0.120000, 0.034237, 0.035313, &
0.117693, 0.035193, 0.035313, &
0.116737, 0.037500, 0.035313, &
0.113263, 0.037500, 0.035313, &
0.112307, 0.035193, 0.035313, &
0.110000, 0.034237, 0.035313, &
0.107693, 0.035193, 0.035313, &
0.106737, 0.037500, 0.035313, &
0.103263, 0.037500, 0.035313, &
0.102307, 0.035193, 0.035313, &
0.100000, 0.034237, 0.035313, &
0.097693, 0.035193, 0.035313, &
0.096737, 0.037500, 0.035313, &
0.093263, 0.037500, 0.035313, &
0.092307, 0.035193, 0.035313, &
0.090000, 0.034237, 0.035313, &
0.087693, 0.035193, 0.035313, &
0.086737, 0.037500, 0.035313, &
0.083263, 0.037500, 0.035313, &
0.082307, 0.035193, 0.035313, &
0.080000, 0.034237, 0.035313, &
0.077693, 0.035193, 0.035313, &
0.076737, 0.037500, 0.035313, &
0.073263, 0.037500, 0.035313, &
0.072307, 0.035193, 0.035313, &
0.070000, 0.034237, 0.035313, &
0.067693, 0.035193, 0.035313, &
0.066737, 0.037500, 0.035313, &
0.063263, 0.037500, 0.035313, &
0.062307, 0.035193, 0.035313, &
0.060000, 0.034237, 0.035313, &
0.057693, 0.035193, 0.035313, &
0.056737, 0.037500, 0.035313, &
0.053263, 0.037500, 0.035313, &
0.052307, 0.035193, 0.035313, &
0.050000, 0.034237, 0.035313, &
0.047693, 0.035193, 0.035313, &
0.046737, 0.037500, 0.035313, &
0.043263, 0.037500, 0.035313, &
0.042307, 0.035193, 0.035313, &
0.040000, 0.034237, 0.035313, &
0.037693, 0.035193, 0.035313, &
0.036737, 0.037500, 0.035313, &
0.033263, 0.037500, 0.035313, &
0.032307, 0.035193, 0.035313, &
0.030000, 0.034237, 0.035313, &
0.027693, 0.035193, 0.035313, &
0.026737, 0.037500, 0.035313, &
0.023263, 0.037500, 0.035313, &
0.022307, 0.035193, 0.035313, &
0.020000, 0.034237, 0.035313, &
0.017693, 0.035193, 0.035313, &
0.016737, 0.037500, 0.035313, &
0.013263, 0.037500, 0.035313, &
0.012307, 0.035193, 0.035313, &
0.010000, 0.034237, 0.035313, &
0.007693, 0.035193, 0.035313, &
0.006737, 0.037500, 0.035313, &
0.003263, 0.037500, 0.035313, &
0.002307, 0.035193, 0.035313, &
0.000000, 0.034237, 0.035313, &
-0.002307, 0.035193, 0.035313, &
-0.003263, 0.037500, 0.035313, &
-0.006554, 0.037067, 0.035313, &
-0.006880, 0.034591, 0.035313, &
-0.008861, 0.033070, 0.035313, &
-0.011337, 0.033396, 0.035313, &
-0.012858, 0.035378, 0.035313, &
-0.015924, 0.034108, 0.035313, &
-0.015598, 0.031631, 0.035313, &
-0.017118, 0.029650, 0.035313, &
-0.019595, 0.029324, 0.035313, &
-0.021576, 0.030844, 0.035313, &
-0.024209, 0.028824, 0.035313, &
-0.023253, 0.026517, 0.035313, &
-0.024209, 0.024209, 0.035313, &
-0.026517, 0.023253, 0.035313, &
-0.028824, 0.024209, 0.035313, &
-0.030844, 0.021576, 0.035313, &
-0.029324, 0.019595, 0.035313, &
-0.029650, 0.017118, 0.035313, &
-0.031631, 0.015598, 0.035313, &
-0.034108, 0.015924, 0.035313, &
-0.035378, 0.012858, 0.035313, &
-0.033396, 0.011337, 0.035313, &
-0.033070, 0.008861, 0.035313, &
-0.034591, 0.006880, 0.035313, &
-0.037067, 0.006554, 0.035313, &
-0.037500, 0.003263, 0.035313, &
-0.035193, 0.002307, 0.035313, &
-0.034237, 0.000000, 0.035313, &
-0.035193, -0.002307, 0.035313, &
-0.037500, -0.003263, 0.035313, &
-0.037067, -0.006554, 0.035313, &
-0.034591, -0.006880, 0.035313, &
-0.033070, -0.008861, 0.035313, &
-0.033396, -0.011337, 0.035313, &
-0.035378, -0.012858, 0.035313, &
-0.034108, -0.015924, 0.035313, &
-0.031631, -0.015598, 0.035313, &
-0.029650, -0.017118, 0.035313, &
-0.029324, -0.019595, 0.035313, &
-0.030844, -0.021576, 0.035313, &
-0.028824, -0.024209, 0.035313, &
-0.026517, -0.023253, 0.035313, &
-0.024209, -0.024209, 0.035313, &
-0.023253, -0.026517, 0.035313, &
-0.024209, -0.028824, 0.035313, &
-0.021576, -0.030844, 0.035313, &
-0.019595, -0.029324, 0.035313, &
-0.017118, -0.029650, 0.035313, &
-0.015598, -0.031631, 0.035313, &
-0.015924, -0.034108, 0.035313, &
-0.012858, -0.035378, 0.035313, &
-0.011337, -0.033396, 0.035313, &
-0.008861, -0.033070, 0.035313, &
-0.006880, -0.034591, 0.035313, &
-0.006554, -0.037067, 0.035313, &
-0.003263, -0.037500, 0.035313, &
-0.002307, -0.035193, 0.035313, &
0.000000, -0.034237, 0.035313, &
0.002307, -0.035193, 0.035313, &
0.003263, -0.037500, 0.035313, &
0.006737, -0.037500, 0.035313, &
0.007693, -0.035193, 0.035313, &
0.010000, -0.034237, 0.035313, &
0.012307, -0.035193, 0.035313, &
0.013263, -0.037500, 0.035313, &
0.016737, -0.037500, 0.035313, &
0.017693, -0.035193, 0.035313, &
0.020000, -0.034237, 0.035313, &
0.022307, -0.035193, 0.035313, &
0.023263, -0.037500, 0.035313, &
0.026737, -0.037500, 0.035313, &
0.027693, -0.035193, 0.035313, &
0.030000, -0.034237, 0.035313, &
0.032307, -0.035193, 0.035313, &
0.033263, -0.037500, 0.035313, &
0.036737, -0.037500, 0.035313, &
0.037693, -0.035193, 0.035313, &
0.040000, -0.034237, 0.035313, &
0.042307, -0.035193, 0.035313, &
0.043263, -0.037500, 0.035313, &
0.046737, -0.037500, 0.035313, &
0.047693, -0.035193, 0.035313, &
0.050000, -0.034237, 0.035313, &
0.052307, -0.035193, 0.035313, &
0.053263, -0.037500, 0.035313, &
0.056737, -0.037500, 0.035313, &
0.057693, -0.035193, 0.035313, &
0.060000, -0.034237, 0.035313, &
0.062307, -0.035193, 0.035313, &
0.063263, -0.037500, 0.035313, &
0.066737, -0.037500, 0.035313, &
0.067693, -0.035193, 0.035313, &
0.070000, -0.034237, 0.035313, &
0.072307, -0.035193, 0.035313, &
0.073263, -0.037500, 0.035313, &
0.076737, -0.037500, 0.035313, &
0.077693, -0.035193, 0.035313, &
0.080000, -0.034237, 0.035313, &
0.082307, -0.035193, 0.035313, &
0.083263, -0.037500, 0.035313, &
0.086737, -0.037500, 0.035313, &
0.087693, -0.035193, 0.035313, &
0.090000, -0.034237, 0.035313, &
0.092307, -0.035193, 0.035313, &
0.093263, -0.037500, 0.035313, &
0.096737, -0.037500, 0.035313, &
0.097693, -0.035193, 0.035313, &
0.100000, -0.034237, 0.035313, &
0.102307, -0.035193, 0.035313, &
0.103263, -0.037500, 0.035313, &
0.106737, -0.037500, 0.035313, &
0.107693, -0.035193, 0.035313, &
0.110000, -0.034237, 0.035313, &
0.112307, -0.035193, 0.035313, &
0.113263, -0.037500, 0.035313, &
0.116737, -0.037500, 0.035313, &
0.117693, -0.035193, 0.035313, &
0.120000, -0.034237, 0.035313, &
0.122307, -0.035193, 0.035313, &
0.123263, -0.037500, 0.035313, &
0.126737, -0.037500, 0.035313, &
0.127693, -0.035193, 0.035313, &
0.130000, -0.034237, 0.035313, &
0.132307, -0.035193, 0.035313, &
0.133263, -0.037500, 0.035313, &
0.136737, -0.037500, 0.035313, &
0.137693, -0.035193, 0.035313, &
0.140000, -0.034237, 0.035313, &
0.142307, -0.035193, 0.035313, &
0.143263, -0.037500, 0.035313, &
0.146737, -0.037500, 0.035313, &
0.147693, -0.035193, 0.035313, &
0.150000, -0.034237, 0.035313, &
0.152307, -0.035193, 0.035313, &
0.153263, -0.037500, 0.035313, &
0.156737, -0.037500, 0.035313, &
0.157693, -0.035193, 0.035313, &
0.160000, -0.034237, 0.035313, &
0.162307, -0.035193, 0.035313, &
0.163263, -0.037500, 0.035313, &
0.166737, -0.037500, 0.035313, &
0.167693, -0.035193, 0.035313, &
0.170000, -0.034237, 0.035313, &
0.172307, -0.035193, 0.035313, &
0.173263, -0.037500, 0.035313, &
0.176737, -0.037500, 0.035313, &
0.177693, -0.035193, 0.035313, &
0.180000, -0.034237, 0.035313, &
0.182307, -0.035193, 0.035313, &
0.183263, -0.037500, 0.035313, &
0.186737, -0.037500, 0.035313, &
0.187693, -0.035193, 0.035313, &
0.190000, -0.034237, 0.035313, &
0.192307, -0.035193, 0.035313, &
0.193263, -0.037500, 0.035313, &
0.196737, -0.037500, 0.035313, &
0.197693, -0.035193, 0.035313, &
0.200000, -0.034237, 0.035313, &
0.202307, -0.035193, 0.035313, &
0.203263, -0.037500, 0.035313, &
0.206737, -0.037500, 0.035313, &
0.207693, -0.035193, 0.035313, &
0.210000, -0.034237, 0.035313, &
0.212307, -0.035193, 0.035313, &
0.213263, -0.037500, 0.035313, &
0.216737, -0.037500, 0.035313, &
0.217693, -0.035193, 0.035313, &
0.220000, -0.034237, 0.035313, &
0.222307, -0.035193, 0.035313, &
0.223263, -0.037500, 0.035313, &
0.226737, -0.037500, 0.035313, &
0.227693, -0.035193, 0.035313, &
0.230000, -0.034237, 0.035313, &
0.232307, -0.035193, 0.035313, &
0.233263, -0.037500, 0.035313, &
0.236737, -0.037500, 0.035313, &
0.237693, -0.035193, 0.035313, &
0.240000, -0.034237, 0.035313, &
0.242307, -0.035193, 0.035313, &
0.243263, -0.037500, 0.035313, &
0.246737, -0.037500, 0.035313, &
0.247693, -0.035193, 0.035313, &
0.250000, -0.034237, 0.035313, &
0.252307, -0.035193, 0.035313, &
0.253263, -0.037500, 0.035313, &
0.256737, -0.037500, 0.035313, &
0.257693, -0.035193, 0.035313, &
0.260000, -0.034237, 0.035313, &
0.262307, -0.035193, 0.035313, &
0.263263, -0.037500, 0.035313, &
0.266737, -0.037500, 0.035313, &
0.267693, -0.035193, 0.035313, &
0.270000, -0.034237, 0.035313, &
0.272307, -0.035193, 0.035313, &
0.273263, -0.037500, 0.035313, &
0.276737, -0.037500, 0.035313, &
0.277693, -0.035193, 0.035313, &
0.280000, -0.034237, 0.035313, &
0.282307, -0.035193, 0.035313, &
0.283263, -0.037500, 0.035313, &
0.286737, -0.037500, 0.035313, &
0.287693, -0.035193, 0.035313, &
0.290000, -0.034237, 0.035313, &
0.292307, -0.035193, 0.035313, &
0.293263, -0.037500, 0.035313, &
0.296737, -0.037500, 0.035313, &
0.297693, -0.035193, 0.035313, &
0.300000, -0.034237, 0.035313, &
0.302307, -0.035193, 0.035313, &
0.303263, -0.037500, 0.035313, &
0.306737, -0.037500, 0.035313, &
0.307693, -0.035193, 0.035313, &
0.310000, -0.034237, 0.035313, &
0.312307, -0.035193, 0.035313, &
0.313263, -0.037500, 0.035313, &
0.316737, -0.037500, 0.035313, &
0.317693, -0.035193, 0.035313, &
0.320000, -0.034237, 0.035313, &
0.322307, -0.035193, 0.035313, &
0.323263, -0.037500, 0.035313, &
0.326737, -0.037500, 0.035313, &
0.327693, -0.035193, 0.035313, &
0.330000, -0.034237, 0.035313, &
0.332307, -0.035193, 0.035313, &
0.333263, -0.037500, 0.035313, &
0.336737, -0.037500, 0.035313, &
0.337693, -0.035193, 0.035313, &
0.340000, -0.034237, 0.035313, &
0.342307, -0.035193, 0.035313, &
0.343263, -0.037500, 0.035313, &
0.346737, -0.037500, 0.035313, &
0.347693, -0.035193, 0.035313, &
0.350000, -0.034237, 0.035313, &
0.352307, -0.035193, 0.035313, &
0.353263, -0.037500, 0.035313, &
0.356737, -0.037500, 0.035313, &
0.357693, -0.035193, 0.035313, &
0.360000, -0.034237, 0.035313, &
0.362307, -0.035193, 0.035313, &
0.363263, -0.037500, 0.035313, &
0.366737, -0.037500, 0.035313, &
0.367693, -0.035193, 0.035313, &
0.370000, -0.034237, 0.035313, &
0.372307, -0.035193, 0.035313, &
0.373263, -0.037500, 0.035313, &
0.376737, -0.037500, 0.035313, &
0.377693, -0.035193, 0.035313, &
0.380000, -0.034237, 0.035313, &
0.382307, -0.035193, 0.035313, &
0.383263, -0.037500, 0.035313, &
0.386737, -0.037500, 0.035313, &
0.387693, -0.035193, 0.035313, &
0.390000, -0.034237, 0.035313, &
0.392307, -0.035193, 0.035313, &
0.393263, -0.037500, 0.035313, &
0.390000, -0.038625, 0.035313, &
-0.000000, -0.038625, 0.035313, &
-0.013211, -0.036296, 0.035313, &
-0.024828, -0.029588, 0.035313, &
-0.033450, -0.019313, 0.035313, &
-0.038038, -0.006707, 0.035313, &
-0.038038, 0.006707, 0.035313, &
-0.033450, 0.019312, 0.035313, &
-0.024828, 0.029588, 0.035313, &
-0.013211, 0.036296, 0.035313, &
0.000000, 0.038625, 0.035313, &
0.400000, 0.038625, 0.035313, &
0.413140, 0.036321, 0.035313, &
0.424713, 0.029685, 0.035313, &
0.433337, 0.019507, 0.035313, &
0.437985, 0.007002, 0.035313, &
0.438101, -0.006338, 0.035313, &
0.433673, -0.018922, 0.035313, &
0.425227, -0.029249, 0.035313, &
0.413772, -0.036086, 0.035313, &
0.400674, -0.038619, 0.035313, &
0.396737, -0.037500, 0.035313 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.SLM11_CrankFF.chain_f01_chain_pair_mar
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_f01_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_CrankFF.chain_f01_belt render=filled
marker create marker_name=.sliderActuator.SLM11_CrankFF.chain_b01_chain_pair_mar location=0.377395, 0.166051, 0.000000 orientation=0.000000, 0.000000, -17.656691 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_b01_chain_pair_mar visibility=on
marker create marker_name=.sliderActuator.SLM11_CrankFF.chain_b01_left_marJ location=0.377395, 0.166051, -0.036250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_b01_left_marJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_CrankFF.chain_b01_belt reference_marker=.sliderActuator.SLM11_CrankFF.chain_b01_chain_pair_mar  points_for_profile= &
0.396737, -0.037500, -0.035625, &
0.397693, -0.035193, -0.035625, &
0.400000, -0.034237, -0.035625, &
0.402307, -0.035193, -0.035625, &
0.403263, -0.037500, -0.035625, &
0.406554, -0.037067, -0.035625, &
0.406880, -0.034591, -0.035625, &
0.408861, -0.033070, -0.035625, &
0.411337, -0.033396, -0.035625, &
0.412858, -0.035378, -0.035625, &
0.415924, -0.034108, -0.035625, &
0.415598, -0.031631, -0.035625, &
0.417118, -0.029650, -0.035625, &
0.419595, -0.029324, -0.035625, &
0.421576, -0.030844, -0.035625, &
0.424209, -0.028824, -0.035625, &
0.423253, -0.026517, -0.035625, &
0.424209, -0.024209, -0.035625, &
0.426517, -0.023253, -0.035625, &
0.428824, -0.024209, -0.035625, &
0.430844, -0.021576, -0.035625, &
0.429324, -0.019595, -0.035625, &
0.429650, -0.017118, -0.035625, &
0.431631, -0.015598, -0.035625, &
0.434108, -0.015924, -0.035625, &
0.435378, -0.012858, -0.035625, &
0.433396, -0.011337, -0.035625, &
0.433070, -0.008861, -0.035625, &
0.434591, -0.006880, -0.035625, &
0.437067, -0.006554, -0.035625, &
0.437500, -0.003263, -0.035625, &
0.435193, -0.002307, -0.035625, &
0.434237, 0.000000, -0.035625, &
0.435193, 0.002307, -0.035625, &
0.437500, 0.003263, -0.035625, &
0.437067, 0.006554, -0.035625, &
0.434591, 0.006880, -0.035625, &
0.433070, 0.008861, -0.035625, &
0.433396, 0.011337, -0.035625, &
0.435378, 0.012858, -0.035625, &
0.434108, 0.015924, -0.035625, &
0.431631, 0.015598, -0.035625, &
0.429650, 0.017118, -0.035625, &
0.429324, 0.019595, -0.035625, &
0.430844, 0.021576, -0.035625, &
0.428824, 0.024209, -0.035625, &
0.426517, 0.023253, -0.035625, &
0.424209, 0.024209, -0.035625, &
0.423253, 0.026517, -0.035625, &
0.424209, 0.028824, -0.035625, &
0.421576, 0.030844, -0.035625, &
0.419595, 0.029324, -0.035625, &
0.417118, 0.029650, -0.035625, &
0.415598, 0.031631, -0.035625, &
0.415924, 0.034108, -0.035625, &
0.412858, 0.035378, -0.035625, &
0.411337, 0.033396, -0.035625, &
0.408861, 0.033070, -0.035625, &
0.406880, 0.034591, -0.035625, &
0.406554, 0.037067, -0.035625, &
0.403263, 0.037500, -0.035625, &
0.402307, 0.035193, -0.035625, &
0.400000, 0.034237, -0.035625, &
0.397693, 0.035193, -0.035625, &
0.396737, 0.037500, -0.035625, &
0.393263, 0.037500, -0.035625, &
0.392307, 0.035193, -0.035625, &
0.390000, 0.034237, -0.035625, &
0.387693, 0.035193, -0.035625, &
0.386737, 0.037500, -0.035625, &
0.383263, 0.037500, -0.035625, &
0.382307, 0.035193, -0.035625, &
0.380000, 0.034237, -0.035625, &
0.377693, 0.035193, -0.035625, &
0.376737, 0.037500, -0.035625, &
0.373263, 0.037500, -0.035625, &
0.372307, 0.035193, -0.035625, &
0.370000, 0.034237, -0.035625, &
0.367693, 0.035193, -0.035625, &
0.366737, 0.037500, -0.035625, &
0.363263, 0.037500, -0.035625, &
0.362307, 0.035193, -0.035625, &
0.360000, 0.034237, -0.035625, &
0.357693, 0.035193, -0.035625, &
0.356737, 0.037500, -0.035625, &
0.353263, 0.037500, -0.035625, &
0.352307, 0.035193, -0.035625, &
0.350000, 0.034237, -0.035625, &
0.347693, 0.035193, -0.035625, &
0.346737, 0.037500, -0.035625, &
0.343263, 0.037500, -0.035625, &
0.342307, 0.035193, -0.035625, &
0.340000, 0.034237, -0.035625, &
0.337693, 0.035193, -0.035625, &
0.336737, 0.037500, -0.035625, &
0.333263, 0.037500, -0.035625, &
0.332307, 0.035193, -0.035625, &
0.330000, 0.034237, -0.035625, &
0.327693, 0.035193, -0.035625, &
0.326737, 0.037500, -0.035625, &
0.323263, 0.037500, -0.035625, &
0.322307, 0.035193, -0.035625, &
0.320000, 0.034237, -0.035625, &
0.317693, 0.035193, -0.035625, &
0.316737, 0.037500, -0.035625, &
0.313263, 0.037500, -0.035625, &
0.312307, 0.035193, -0.035625, &
0.310000, 0.034237, -0.035625, &
0.307693, 0.035193, -0.035625, &
0.306737, 0.037500, -0.035625, &
0.303263, 0.037500, -0.035625, &
0.302307, 0.035193, -0.035625, &
0.300000, 0.034237, -0.035625, &
0.297693, 0.035193, -0.035625, &
0.296737, 0.037500, -0.035625, &
0.293263, 0.037500, -0.035625, &
0.292307, 0.035193, -0.035625, &
0.290000, 0.034237, -0.035625, &
0.287693, 0.035193, -0.035625, &
0.286737, 0.037500, -0.035625, &
0.283263, 0.037500, -0.035625, &
0.282307, 0.035193, -0.035625, &
0.280000, 0.034237, -0.035625, &
0.277693, 0.035193, -0.035625, &
0.276737, 0.037500, -0.035625, &
0.273263, 0.037500, -0.035625, &
0.272307, 0.035193, -0.035625, &
0.270000, 0.034237, -0.035625, &
0.267693, 0.035193, -0.035625, &
0.266737, 0.037500, -0.035625, &
0.263263, 0.037500, -0.035625, &
0.262307, 0.035193, -0.035625, &
0.260000, 0.034237, -0.035625, &
0.257693, 0.035193, -0.035625, &
0.256737, 0.037500, -0.035625, &
0.253263, 0.037500, -0.035625, &
0.252307, 0.035193, -0.035625, &
0.250000, 0.034237, -0.035625, &
0.247693, 0.035193, -0.035625, &
0.246737, 0.037500, -0.035625, &
0.243263, 0.037500, -0.035625, &
0.242307, 0.035193, -0.035625, &
0.240000, 0.034237, -0.035625, &
0.237693, 0.035193, -0.035625, &
0.236737, 0.037500, -0.035625, &
0.233263, 0.037500, -0.035625, &
0.232307, 0.035193, -0.035625, &
0.230000, 0.034237, -0.035625, &
0.227693, 0.035193, -0.035625, &
0.226737, 0.037500, -0.035625, &
0.223263, 0.037500, -0.035625, &
0.222307, 0.035193, -0.035625, &
0.220000, 0.034237, -0.035625, &
0.217693, 0.035193, -0.035625, &
0.216737, 0.037500, -0.035625, &
0.213263, 0.037500, -0.035625, &
0.212307, 0.035193, -0.035625, &
0.210000, 0.034237, -0.035625, &
0.207693, 0.035193, -0.035625, &
0.206737, 0.037500, -0.035625, &
0.203263, 0.037500, -0.035625, &
0.202307, 0.035193, -0.035625, &
0.200000, 0.034237, -0.035625, &
0.197693, 0.035193, -0.035625, &
0.196737, 0.037500, -0.035625, &
0.193263, 0.037500, -0.035625, &
0.192307, 0.035193, -0.035625, &
0.190000, 0.034237, -0.035625, &
0.187693, 0.035193, -0.035625, &
0.186737, 0.037500, -0.035625, &
0.183263, 0.037500, -0.035625, &
0.182307, 0.035193, -0.035625, &
0.180000, 0.034237, -0.035625, &
0.177693, 0.035193, -0.035625, &
0.176737, 0.037500, -0.035625, &
0.173263, 0.037500, -0.035625, &
0.172307, 0.035193, -0.035625, &
0.170000, 0.034237, -0.035625, &
0.167693, 0.035193, -0.035625, &
0.166737, 0.037500, -0.035625, &
0.163263, 0.037500, -0.035625, &
0.162307, 0.035193, -0.035625, &
0.160000, 0.034237, -0.035625, &
0.157693, 0.035193, -0.035625, &
0.156737, 0.037500, -0.035625, &
0.153263, 0.037500, -0.035625, &
0.152307, 0.035193, -0.035625, &
0.150000, 0.034237, -0.035625, &
0.147693, 0.035193, -0.035625, &
0.146737, 0.037500, -0.035625, &
0.143263, 0.037500, -0.035625, &
0.142307, 0.035193, -0.035625, &
0.140000, 0.034237, -0.035625, &
0.137693, 0.035193, -0.035625, &
0.136737, 0.037500, -0.035625, &
0.133263, 0.037500, -0.035625, &
0.132307, 0.035193, -0.035625, &
0.130000, 0.034237, -0.035625, &
0.127693, 0.035193, -0.035625, &
0.126737, 0.037500, -0.035625, &
0.123263, 0.037500, -0.035625, &
0.122307, 0.035193, -0.035625, &
0.120000, 0.034237, -0.035625, &
0.117693, 0.035193, -0.035625, &
0.116737, 0.037500, -0.035625, &
0.113263, 0.037500, -0.035625, &
0.112307, 0.035193, -0.035625, &
0.110000, 0.034237, -0.035625, &
0.107693, 0.035193, -0.035625, &
0.106737, 0.037500, -0.035625, &
0.103263, 0.037500, -0.035625, &
0.102307, 0.035193, -0.035625, &
0.100000, 0.034237, -0.035625, &
0.097693, 0.035193, -0.035625, &
0.096737, 0.037500, -0.035625, &
0.093263, 0.037500, -0.035625, &
0.092307, 0.035193, -0.035625, &
0.090000, 0.034237, -0.035625, &
0.087693, 0.035193, -0.035625, &
0.086737, 0.037500, -0.035625, &
0.083263, 0.037500, -0.035625, &
0.082307, 0.035193, -0.035625, &
0.080000, 0.034237, -0.035625, &
0.077693, 0.035193, -0.035625, &
0.076737, 0.037500, -0.035625, &
0.073263, 0.037500, -0.035625, &
0.072307, 0.035193, -0.035625, &
0.070000, 0.034237, -0.035625, &
0.067693, 0.035193, -0.035625, &
0.066737, 0.037500, -0.035625, &
0.063263, 0.037500, -0.035625, &
0.062307, 0.035193, -0.035625, &
0.060000, 0.034237, -0.035625, &
0.057693, 0.035193, -0.035625, &
0.056737, 0.037500, -0.035625, &
0.053263, 0.037500, -0.035625, &
0.052307, 0.035193, -0.035625, &
0.050000, 0.034237, -0.035625, &
0.047693, 0.035193, -0.035625, &
0.046737, 0.037500, -0.035625, &
0.043263, 0.037500, -0.035625, &
0.042307, 0.035193, -0.035625, &
0.040000, 0.034237, -0.035625, &
0.037693, 0.035193, -0.035625, &
0.036737, 0.037500, -0.035625, &
0.033263, 0.037500, -0.035625, &
0.032307, 0.035193, -0.035625, &
0.030000, 0.034237, -0.035625, &
0.027693, 0.035193, -0.035625, &
0.026737, 0.037500, -0.035625, &
0.023263, 0.037500, -0.035625, &
0.022307, 0.035193, -0.035625, &
0.020000, 0.034237, -0.035625, &
0.017693, 0.035193, -0.035625, &
0.016737, 0.037500, -0.035625, &
0.013263, 0.037500, -0.035625, &
0.012307, 0.035193, -0.035625, &
0.010000, 0.034237, -0.035625, &
0.007693, 0.035193, -0.035625, &
0.006737, 0.037500, -0.035625, &
0.003263, 0.037500, -0.035625, &
0.002307, 0.035193, -0.035625, &
0.000000, 0.034237, -0.035625, &
-0.002307, 0.035193, -0.035625, &
-0.003263, 0.037500, -0.035625, &
-0.006554, 0.037067, -0.035625, &
-0.006880, 0.034591, -0.035625, &
-0.008861, 0.033070, -0.035625, &
-0.011337, 0.033396, -0.035625, &
-0.012858, 0.035378, -0.035625, &
-0.015924, 0.034108, -0.035625, &
-0.015598, 0.031631, -0.035625, &
-0.017118, 0.029650, -0.035625, &
-0.019595, 0.029324, -0.035625, &
-0.021576, 0.030844, -0.035625, &
-0.024209, 0.028824, -0.035625, &
-0.023253, 0.026517, -0.035625, &
-0.024209, 0.024209, -0.035625, &
-0.026517, 0.023253, -0.035625, &
-0.028824, 0.024209, -0.035625, &
-0.030844, 0.021576, -0.035625, &
-0.029324, 0.019595, -0.035625, &
-0.029650, 0.017118, -0.035625, &
-0.031631, 0.015598, -0.035625, &
-0.034108, 0.015924, -0.035625, &
-0.035378, 0.012858, -0.035625, &
-0.033396, 0.011337, -0.035625, &
-0.033070, 0.008861, -0.035625, &
-0.034591, 0.006880, -0.035625, &
-0.037067, 0.006554, -0.035625, &
-0.037500, 0.003263, -0.035625, &
-0.035193, 0.002307, -0.035625, &
-0.034237, 0.000000, -0.035625, &
-0.035193, -0.002307, -0.035625, &
-0.037500, -0.003263, -0.035625, &
-0.037067, -0.006554, -0.035625, &
-0.034591, -0.006880, -0.035625, &
-0.033070, -0.008861, -0.035625, &
-0.033396, -0.011337, -0.035625, &
-0.035378, -0.012858, -0.035625, &
-0.034108, -0.015924, -0.035625, &
-0.031631, -0.015598, -0.035625, &
-0.029650, -0.017118, -0.035625, &
-0.029324, -0.019595, -0.035625, &
-0.030844, -0.021576, -0.035625, &
-0.028824, -0.024209, -0.035625, &
-0.026517, -0.023253, -0.035625, &
-0.024209, -0.024209, -0.035625, &
-0.023253, -0.026517, -0.035625, &
-0.024209, -0.028824, -0.035625, &
-0.021576, -0.030844, -0.035625, &
-0.019595, -0.029324, -0.035625, &
-0.017118, -0.029650, -0.035625, &
-0.015598, -0.031631, -0.035625, &
-0.015924, -0.034108, -0.035625, &
-0.012858, -0.035378, -0.035625, &
-0.011337, -0.033396, -0.035625, &
-0.008861, -0.033070, -0.035625, &
-0.006880, -0.034591, -0.035625, &
-0.006554, -0.037067, -0.035625, &
-0.003263, -0.037500, -0.035625, &
-0.002307, -0.035193, -0.035625, &
0.000000, -0.034237, -0.035625, &
0.002307, -0.035193, -0.035625, &
0.003263, -0.037500, -0.035625, &
0.006737, -0.037500, -0.035625, &
0.007693, -0.035193, -0.035625, &
0.010000, -0.034237, -0.035625, &
0.012307, -0.035193, -0.035625, &
0.013263, -0.037500, -0.035625, &
0.016737, -0.037500, -0.035625, &
0.017693, -0.035193, -0.035625, &
0.020000, -0.034237, -0.035625, &
0.022307, -0.035193, -0.035625, &
0.023263, -0.037500, -0.035625, &
0.026737, -0.037500, -0.035625, &
0.027693, -0.035193, -0.035625, &
0.030000, -0.034237, -0.035625, &
0.032307, -0.035193, -0.035625, &
0.033263, -0.037500, -0.035625, &
0.036737, -0.037500, -0.035625, &
0.037693, -0.035193, -0.035625, &
0.040000, -0.034237, -0.035625, &
0.042307, -0.035193, -0.035625, &
0.043263, -0.037500, -0.035625, &
0.046737, -0.037500, -0.035625, &
0.047693, -0.035193, -0.035625, &
0.050000, -0.034237, -0.035625, &
0.052307, -0.035193, -0.035625, &
0.053263, -0.037500, -0.035625, &
0.056737, -0.037500, -0.035625, &
0.057693, -0.035193, -0.035625, &
0.060000, -0.034237, -0.035625, &
0.062307, -0.035193, -0.035625, &
0.063263, -0.037500, -0.035625, &
0.066737, -0.037500, -0.035625, &
0.067693, -0.035193, -0.035625, &
0.070000, -0.034237, -0.035625, &
0.072307, -0.035193, -0.035625, &
0.073263, -0.037500, -0.035625, &
0.076737, -0.037500, -0.035625, &
0.077693, -0.035193, -0.035625, &
0.080000, -0.034237, -0.035625, &
0.082307, -0.035193, -0.035625, &
0.083263, -0.037500, -0.035625, &
0.086737, -0.037500, -0.035625, &
0.087693, -0.035193, -0.035625, &
0.090000, -0.034237, -0.035625, &
0.092307, -0.035193, -0.035625, &
0.093263, -0.037500, -0.035625, &
0.096737, -0.037500, -0.035625, &
0.097693, -0.035193, -0.035625, &
0.100000, -0.034237, -0.035625, &
0.102307, -0.035193, -0.035625, &
0.103263, -0.037500, -0.035625, &
0.106737, -0.037500, -0.035625, &
0.107693, -0.035193, -0.035625, &
0.110000, -0.034237, -0.035625, &
0.112307, -0.035193, -0.035625, &
0.113263, -0.037500, -0.035625, &
0.116737, -0.037500, -0.035625, &
0.117693, -0.035193, -0.035625, &
0.120000, -0.034237, -0.035625, &
0.122307, -0.035193, -0.035625, &
0.123263, -0.037500, -0.035625, &
0.126737, -0.037500, -0.035625, &
0.127693, -0.035193, -0.035625, &
0.130000, -0.034237, -0.035625, &
0.132307, -0.035193, -0.035625, &
0.133263, -0.037500, -0.035625, &
0.136737, -0.037500, -0.035625, &
0.137693, -0.035193, -0.035625, &
0.140000, -0.034237, -0.035625, &
0.142307, -0.035193, -0.035625, &
0.143263, -0.037500, -0.035625, &
0.146737, -0.037500, -0.035625, &
0.147693, -0.035193, -0.035625, &
0.150000, -0.034237, -0.035625, &
0.152307, -0.035193, -0.035625, &
0.153263, -0.037500, -0.035625, &
0.156737, -0.037500, -0.035625, &
0.157693, -0.035193, -0.035625, &
0.160000, -0.034237, -0.035625, &
0.162307, -0.035193, -0.035625, &
0.163263, -0.037500, -0.035625, &
0.166737, -0.037500, -0.035625, &
0.167693, -0.035193, -0.035625, &
0.170000, -0.034237, -0.035625, &
0.172307, -0.035193, -0.035625, &
0.173263, -0.037500, -0.035625, &
0.176737, -0.037500, -0.035625, &
0.177693, -0.035193, -0.035625, &
0.180000, -0.034237, -0.035625, &
0.182307, -0.035193, -0.035625, &
0.183263, -0.037500, -0.035625, &
0.186737, -0.037500, -0.035625, &
0.187693, -0.035193, -0.035625, &
0.190000, -0.034237, -0.035625, &
0.192307, -0.035193, -0.035625, &
0.193263, -0.037500, -0.035625, &
0.196737, -0.037500, -0.035625, &
0.197693, -0.035193, -0.035625, &
0.200000, -0.034237, -0.035625, &
0.202307, -0.035193, -0.035625, &
0.203263, -0.037500, -0.035625, &
0.206737, -0.037500, -0.035625, &
0.207693, -0.035193, -0.035625, &
0.210000, -0.034237, -0.035625, &
0.212307, -0.035193, -0.035625, &
0.213263, -0.037500, -0.035625, &
0.216737, -0.037500, -0.035625, &
0.217693, -0.035193, -0.035625, &
0.220000, -0.034237, -0.035625, &
0.222307, -0.035193, -0.035625, &
0.223263, -0.037500, -0.035625, &
0.226737, -0.037500, -0.035625, &
0.227693, -0.035193, -0.035625, &
0.230000, -0.034237, -0.035625, &
0.232307, -0.035193, -0.035625, &
0.233263, -0.037500, -0.035625, &
0.236737, -0.037500, -0.035625, &
0.237693, -0.035193, -0.035625, &
0.240000, -0.034237, -0.035625, &
0.242307, -0.035193, -0.035625, &
0.243263, -0.037500, -0.035625, &
0.246737, -0.037500, -0.035625, &
0.247693, -0.035193, -0.035625, &
0.250000, -0.034237, -0.035625, &
0.252307, -0.035193, -0.035625, &
0.253263, -0.037500, -0.035625, &
0.256737, -0.037500, -0.035625, &
0.257693, -0.035193, -0.035625, &
0.260000, -0.034237, -0.035625, &
0.262307, -0.035193, -0.035625, &
0.263263, -0.037500, -0.035625, &
0.266737, -0.037500, -0.035625, &
0.267693, -0.035193, -0.035625, &
0.270000, -0.034237, -0.035625, &
0.272307, -0.035193, -0.035625, &
0.273263, -0.037500, -0.035625, &
0.276737, -0.037500, -0.035625, &
0.277693, -0.035193, -0.035625, &
0.280000, -0.034237, -0.035625, &
0.282307, -0.035193, -0.035625, &
0.283263, -0.037500, -0.035625, &
0.286737, -0.037500, -0.035625, &
0.287693, -0.035193, -0.035625, &
0.290000, -0.034237, -0.035625, &
0.292307, -0.035193, -0.035625, &
0.293263, -0.037500, -0.035625, &
0.296737, -0.037500, -0.035625, &
0.297693, -0.035193, -0.035625, &
0.300000, -0.034237, -0.035625, &
0.302307, -0.035193, -0.035625, &
0.303263, -0.037500, -0.035625, &
0.306737, -0.037500, -0.035625, &
0.307693, -0.035193, -0.035625, &
0.310000, -0.034237, -0.035625, &
0.312307, -0.035193, -0.035625, &
0.313263, -0.037500, -0.035625, &
0.316737, -0.037500, -0.035625, &
0.317693, -0.035193, -0.035625, &
0.320000, -0.034237, -0.035625, &
0.322307, -0.035193, -0.035625, &
0.323263, -0.037500, -0.035625, &
0.326737, -0.037500, -0.035625, &
0.327693, -0.035193, -0.035625, &
0.330000, -0.034237, -0.035625, &
0.332307, -0.035193, -0.035625, &
0.333263, -0.037500, -0.035625, &
0.336737, -0.037500, -0.035625, &
0.337693, -0.035193, -0.035625, &
0.340000, -0.034237, -0.035625, &
0.342307, -0.035193, -0.035625, &
0.343263, -0.037500, -0.035625, &
0.346737, -0.037500, -0.035625, &
0.347693, -0.035193, -0.035625, &
0.350000, -0.034237, -0.035625, &
0.352307, -0.035193, -0.035625, &
0.353263, -0.037500, -0.035625, &
0.356737, -0.037500, -0.035625, &
0.357693, -0.035193, -0.035625, &
0.360000, -0.034237, -0.035625, &
0.362307, -0.035193, -0.035625, &
0.363263, -0.037500, -0.035625, &
0.366737, -0.037500, -0.035625, &
0.367693, -0.035193, -0.035625, &
0.370000, -0.034237, -0.035625, &
0.372307, -0.035193, -0.035625, &
0.373263, -0.037500, -0.035625, &
0.376737, -0.037500, -0.035625, &
0.377693, -0.035193, -0.035625, &
0.380000, -0.034237, -0.035625, &
0.382307, -0.035193, -0.035625, &
0.383263, -0.037500, -0.035625, &
0.386737, -0.037500, -0.035625, &
0.387693, -0.035193, -0.035625, &
0.390000, -0.034237, -0.035625, &
0.392307, -0.035193, -0.035625, &
0.393263, -0.037500, -0.035625, &
0.390000, -0.038625, -0.035625, &
-0.000000, -0.038625, -0.035625, &
-0.013211, -0.036296, -0.035625, &
-0.024828, -0.029588, -0.035625, &
-0.033450, -0.019313, -0.035625, &
-0.038038, -0.006707, -0.035625, &
-0.038038, 0.006707, -0.035625, &
-0.033450, 0.019312, -0.035625, &
-0.024828, 0.029588, -0.035625, &
-0.013211, 0.036296, -0.035625, &
0.000000, 0.038625, -0.035625, &
0.400000, 0.038625, -0.035625, &
0.413140, 0.036321, -0.035625, &
0.424713, 0.029685, -0.035625, &
0.433337, 0.019507, -0.035625, &
0.437985, 0.007002, -0.035625, &
0.438101, -0.006338, -0.035625, &
0.433673, -0.018922, -0.035625, &
0.425227, -0.029249, -0.035625, &
0.413772, -0.036086, -0.035625, &
0.400674, -0.038619, -0.035625, &
0.396737, -0.037500, -0.035625 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.SLM11_CrankFF.chain_b01_chain_pair_mar
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_b01_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_CrankFF.chain_b01_belt render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_CrankFF material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.trianglef1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.triangleb1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.connectRod visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.connectRod2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.connectRod3 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_f01_belt visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_CrankFF.chain_b01_belt visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_crank_brace_f i_marker_name=.sliderActuator.SLM11_CrankFF.crank_brace_f_marI j_marker_name=.sliderActuator.SLM11_Brace.crank_brace_f_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_distalLinkf
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_distalLinkf material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_distalLinkf visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_distalLinkf.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_endI location=0.151218, 0.000053, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_endJ location=0.396738, 0.000053, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn1 reference_marker=.sliderActuator.SLM11_distalLinkf.distalLinkf_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_distalLinkf.distalLinkf_endI
entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn2 reference_marker=.sliderActuator.SLM11_distalLinkf.distalLinkf_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_distalLinkf.distalLinkf_endJ
entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_distalLinkf.distalLinkf_endI j_marker=.sliderActuator.SLM11_distalLinkf.distalLinkf_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_csg1 base_object=.sliderActuator.SLM11_distalLinkf.distalLinkf_link object=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_csg2 base_object=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_csg1 object=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_distalLinkf.crank_distalLinkf_marJ location=0.396738, 0.000053, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.crank_distalLinkf_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_distalLinkf.part2_distalLinkf_marJ location=0.151218, 0.000053, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.part2_distalLinkf_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_distalLinkf material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_distalLinkf.distalLinkf_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_crank_distalLinkf i_marker_name=.sliderActuator.SLM11_CrankFF.crank_distalLinkf_marI j_marker_name=.sliderActuator.SLM11_distalLinkf.crank_distalLinkf_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_part2_distalLinkf i_marker_name=.sliderActuator.SLM11_Part2.part2_distalLinkf_marI j_marker_name=.sliderActuator.SLM11_distalLinkf.part2_distalLinkf_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM11_distalLinkb
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_distalLinkb material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_distalLinkb visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM11_distalLinkb.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.cm visibility=on
marker create marker_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_endI location=0.151218, 0.000053, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_endI visibility=on
marker create marker_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_endJ location=0.396738, 0.000053, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn1 reference_marker=.sliderActuator.SLM11_distalLinkb.distalLinkb_endI  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_distalLinkb.distalLinkb_endI
entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn2 reference_marker=.sliderActuator.SLM11_distalLinkb.distalLinkb_endJ  points_for_profile= &
0.015000, 0.000000, -0.003125, &
0.012580, 0.008170, -0.003125, &
0.006101, 0.013703, -0.003125, &
-0.002347, 0.014815, -0.003125, &
-0.010037, 0.011147, -0.003125, &
-0.014489, 0.003882, -0.003125, &
-0.014266, -0.004635, -0.003125, &
-0.009440, -0.011657, -0.003125, &
-0.001568, -0.014918, -0.003125, &
0.006810, -0.013365, -0.003125, &
0.012990, -0.007500, -0.003125, &
0.015000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM11_distalLinkb.distalLinkb_endJ
entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link width=0.018000 depth=0.005000 i_marker=.sliderActuator.SLM11_distalLinkb.distalLinkb_endI j_marker=.sliderActuator.SLM11_distalLinkb.distalLinkb_endJ

geometry create shape csg csg_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_csg1 base_object=.sliderActuator.SLM11_distalLinkb.distalLinkb_link object=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_csg2 base_object=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_csg1 object=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM11_distalLinkb.crank_distalLinkb_marJ location=0.396738, 0.000053, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.crank_distalLinkb_marJ visibility=on
marker create marker_name=.sliderActuator.SLM11_distalLinkb.part2_distalLinkb_marJ location=0.151218, 0.000053, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.part2_distalLinkb_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM11_distalLinkb material_type = steel
entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM11_distalLinkb.distalLinkb_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM11_crank_distalLinkb i_marker_name=.sliderActuator.SLM11_CrankFF.crank_distalLinkb_marI j_marker_name=.sliderActuator.SLM11_distalLinkb.crank_distalLinkb_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM11_part2_distalLinkb i_marker_name=.sliderActuator.SLM11_Part2.part2_distalLinkb_marI j_marker_name=.sliderActuator.SLM11_distalLinkb.part2_distalLinkb_marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkF11
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF11 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF11 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkF11.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkF11.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkF11.ParaLinkF11_endI location=-0.047426, 0.015835, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF11.ParaLinkF11_endJ location=0.329969, 0.181886, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn1 reference_marker=.sliderActuator.ParaLinkF11.ParaLinkF11_endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkF11.ParaLinkF11_endI
entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn2 reference_marker=.sliderActuator.ParaLinkF11.ParaLinkF11_endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkF11.ParaLinkF11_endJ
entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link width=0.009000 depth=0.005000 i_marker=.sliderActuator.ParaLinkF11.ParaLinkF11_endI j_marker=.sliderActuator.ParaLinkF11.ParaLinkF11_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_csg1 base_object=.sliderActuator.ParaLinkF11.ParaLinkF11_link object=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_csg2 base_object=.sliderActuator.ParaLinkF11.ParaLinkF11_link_csg1 object=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkF11.J11_marI location=-0.047426, 0.015835, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11.J11_marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF11.J12_marJ location=0.329969, 0.181886, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11.J12_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF11 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF11.ParaLinkF11_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J11 i_marker_name=.sliderActuator.ParaLinkF11.J11_marI j_marker_name=.sliderActuator.ground.J11_marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkB11
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB11 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB11 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkB11.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkB11.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkB11.ParaLinkB11_endI location=-0.047426, 0.015835, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB11.ParaLinkB11_endJ location=0.329969, 0.181886, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn1 reference_marker=.sliderActuator.ParaLinkB11.ParaLinkB11_endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkB11.ParaLinkB11_endI
entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn2 reference_marker=.sliderActuator.ParaLinkB11.ParaLinkB11_endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkB11.ParaLinkB11_endJ
entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link width=0.009000 depth=0.005000 i_marker=.sliderActuator.ParaLinkB11.ParaLinkB11_endI j_marker=.sliderActuator.ParaLinkB11.ParaLinkB11_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_csg1 base_object=.sliderActuator.ParaLinkB11.ParaLinkB11_link object=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_csg2 base_object=.sliderActuator.ParaLinkB11.ParaLinkB11_link_csg1 object=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkB11.J11B_marI location=-0.047426, 0.015835, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11.J11B_marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB11.J12B_marJ location=0.329969, 0.181886, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11.J12B_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB11 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB11.ParaLinkB11_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J11B i_marker_name=.sliderActuator.ParaLinkB11.J11B_marI j_marker_name=.sliderActuator.ground.J11B_marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkF11_
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF11_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF11_ visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkF11_.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkF11_.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__endI location=-0.015835, -0.047426, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__endJ location=0.361560, 0.118625, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn1 reference_marker=.sliderActuator.ParaLinkF11_.ParaLinkF11__endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkF11_.ParaLinkF11__endI
entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn2 reference_marker=.sliderActuator.ParaLinkF11_.ParaLinkF11__endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkF11_.ParaLinkF11__endJ
entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link width=0.009000 depth=0.005000 i_marker=.sliderActuator.ParaLinkF11_.ParaLinkF11__endI j_marker=.sliderActuator.ParaLinkF11_.ParaLinkF11__endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_csg1 base_object=.sliderActuator.ParaLinkF11_.ParaLinkF11__link object=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_csg2 base_object=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_csg1 object=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkF11_.J11__marI location=-0.015835, -0.047426, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11_.J11__marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF11_.J12__marJ location=0.361560, 0.118625, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF11_.J12__marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF11_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF11_.ParaLinkF11__link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J11_ i_marker_name=.sliderActuator.ParaLinkF11_.J11__marI j_marker_name=.sliderActuator.ground.J11__marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkB11_
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB11_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB11_ visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkB11_.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkB11_.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__endI location=-0.015835, -0.047426, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__endJ location=0.361560, 0.118625, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn1 reference_marker=.sliderActuator.ParaLinkB11_.ParaLinkB11__endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkB11_.ParaLinkB11__endI
entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn2 reference_marker=.sliderActuator.ParaLinkB11_.ParaLinkB11__endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkB11_.ParaLinkB11__endJ
entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link width=0.009000 depth=0.005000 i_marker=.sliderActuator.ParaLinkB11_.ParaLinkB11__endI j_marker=.sliderActuator.ParaLinkB11_.ParaLinkB11__endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_csg1 base_object=.sliderActuator.ParaLinkB11_.ParaLinkB11__link object=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_csg2 base_object=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_csg1 object=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkB11_.J11B__marI location=-0.015835, -0.047426, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11_.J11B__marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB11_.J12B__marJ location=0.361560, 0.118625, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB11_.J12B__marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB11_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB11_.ParaLinkB11__link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J11B_ i_marker_name=.sliderActuator.ParaLinkB11_.J11B__marI j_marker_name=.sliderActuator.ground.J11B__marJ
part create rigid_body name_and_position part_name=.sliderActuator.deltaF1
part mod rigid_body mass_properties part_name=.sliderActuator.deltaF1 material_type = steel
entity attributes entity_name=.sliderActuator.deltaF1 visibility=on color=WHITE

marker create marker_name=.sliderActuator.deltaF1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.deltaF1.cm visibility=on
marker create marker_name=.sliderActuator.deltaF1.paralmar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.paralmar visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleplatem1 location=0.377395, 0.166051, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleplatem1 visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleplatem2 location=0.329969, 0.181886, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleplatem2 visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleplatem3 location=0.361560, 0.118625, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleplatem3 visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleplatem4 location=0.385648, 0.116737, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleplatem4 visibility=on
geom create shape plate plate=.sliderActuator.deltaF1.triangle marker_name=.sliderActuator.deltaF1.triangleplatem1, .sliderActuator.deltaF1.triangleplatem2, .sliderActuator.deltaF1.triangleplatem3, .sliderActuator.deltaF1.triangleplatem4 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.deltaF1.triangle type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.deltaF1.J12_marI location=0.329969, 0.181886, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J12_marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.J13_marI location=0.377395, 0.166051, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J13_marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.J12__marI location=0.361560, 0.118625, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J12__marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleBplatem1 location=0.426709, 0.174303, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleBplatem1 visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleBplatem2 location=0.329969, 0.181886, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleBplatem2 visibility=on
marker create marker_name=.sliderActuator.deltaF1.triangleBplatem3 location=0.361560, 0.118625, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.triangleBplatem3 visibility=on
geom create shape plate plate=.sliderActuator.deltaF1.triangleB marker_name=.sliderActuator.deltaF1.triangleBplatem1, .sliderActuator.deltaF1.triangleBplatem2, .sliderActuator.deltaF1.triangleBplatem3 radius=0.010000 width=0.006250

entity attributes entity_name=.sliderActuator.deltaF1.triangleB type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.deltaF1.J12B_marI location=0.329969, 0.181886, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J12B_marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.J13B_marI location=0.377395, 0.166051, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J13B_marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.J12B__marI location=0.361560, 0.118625, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J12B__marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.J14_marI location=0.385648, 0.116737, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J14_marI visibility=on
marker create marker_name=.sliderActuator.deltaF1.J14B_marI location=0.426709, 0.174303, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF1.J14B_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.deltaF1 material_type = steel
entity attributes entity_name=.sliderActuator.deltaF1.triangle visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.deltaF1.triangleB visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.Paral1 i_marker_name=.sliderActuator.deltaF1.paralmar j_marker_name=.sliderActuator.ground.ground_marker
force create element_like bushing bushing_name=.sliderActuator.J12 i_marker_name=.sliderActuator.deltaF1.J12_marI j_marker_name=.sliderActuator.ParaLinkF11.J12_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
constraint create joint revolute joint_name=.sliderActuator.J13 i_marker_name=.sliderActuator.deltaF1.J13_marI j_marker_name=.sliderActuator.SLM11_Brace.J13_marJ
force create element_like bushing bushing_name=.sliderActuator.J12_ i_marker_name=.sliderActuator.deltaF1.J12__marI j_marker_name=.sliderActuator.ParaLinkF11_.J12__marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
force create element_like bushing bushing_name=.sliderActuator.J12B i_marker_name=.sliderActuator.deltaF1.J12B_marI j_marker_name=.sliderActuator.ParaLinkB11.J12B_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
constraint create joint revolute joint_name=.sliderActuator.J13B i_marker_name=.sliderActuator.deltaF1.J13B_marI j_marker_name=.sliderActuator.SLM11_Brace.J13B_marJ
force create element_like bushing bushing_name=.sliderActuator.J12B_ i_marker_name=.sliderActuator.deltaF1.J12B__marI j_marker_name=.sliderActuator.ParaLinkB11_.J12B__marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkF12
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF12 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF12 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkF12.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkF12.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkF12.ParaLinkF12_endI location=0.385648, 0.116737, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF12.ParaLinkF12_endJ location=0.766804, -0.004589, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn1 reference_marker=.sliderActuator.ParaLinkF12.ParaLinkF12_endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkF12.ParaLinkF12_endI
entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn2 reference_marker=.sliderActuator.ParaLinkF12.ParaLinkF12_endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkF12.ParaLinkF12_endJ
entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link width=0.009000 depth=0.005000 i_marker=.sliderActuator.ParaLinkF12.ParaLinkF12_endI j_marker=.sliderActuator.ParaLinkF12.ParaLinkF12_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_csg1 base_object=.sliderActuator.ParaLinkF12.ParaLinkF12_link object=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_csg2 base_object=.sliderActuator.ParaLinkF12.ParaLinkF12_link_csg1 object=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkF12.J14_marJ location=0.385648, 0.116737, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF12.J14_marJ visibility=on
marker create marker_name=.sliderActuator.ParaLinkF12.J16_marJ location=0.766804, -0.004589, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkF12.J16_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF12 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF12.ParaLinkF12_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J14 i_marker_name=.sliderActuator.deltaF1.J14_marI j_marker_name=.sliderActuator.ParaLinkF12.J14_marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkB12
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB12 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB12 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkB12.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkB12.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkB12.ParaLinkB12_endI location=0.426709, 0.174303, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB12.ParaLinkB12_endJ location=0.807866, 0.052978, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn1 reference_marker=.sliderActuator.ParaLinkB12.ParaLinkB12_endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkB12.ParaLinkB12_endI
entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn2 reference_marker=.sliderActuator.ParaLinkB12.ParaLinkB12_endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.ParaLinkB12.ParaLinkB12_endJ
entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link width=0.009000 depth=0.005000 i_marker=.sliderActuator.ParaLinkB12.ParaLinkB12_endI j_marker=.sliderActuator.ParaLinkB12.ParaLinkB12_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_csg1 base_object=.sliderActuator.ParaLinkB12.ParaLinkB12_link object=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_csg2 base_object=.sliderActuator.ParaLinkB12.ParaLinkB12_link_csg1 object=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkB12.J14B_marJ location=0.426709, 0.174303, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB12.J14B_marJ visibility=on
marker create marker_name=.sliderActuator.ParaLinkB12.J16B_marJ location=0.807866, 0.052978, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.ParaLinkB12.J16B_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB12 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB12.ParaLinkB12_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J14B i_marker_name=.sliderActuator.deltaF1.J14B_marI j_marker_name=.sliderActuator.ParaLinkB12.J14B_marJ
part create rigid_body name_and_position part_name=.sliderActuator.DeltaF2
part mod rigid_body mass_properties part_name=.sliderActuator.DeltaF2 material_type = steel
entity attributes entity_name=.sliderActuator.DeltaF2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.DeltaF2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.DeltaF2.cm visibility=on
marker create marker_name=.sliderActuator.DeltaF2.paralmar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF2.paralmar visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J15_marI location=0.758552, 0.044726, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF2.J15_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J16_marI location=0.766804, -0.004589, 0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF2.J16_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J15B_marI location=0.758552, 0.044726, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF2.J15B_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J16B_marI location=0.807866, 0.052978, -0.068125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF2.J16B_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF2.mar22 location=0.758552, 0.044726, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF2.mar22 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.LeftRevJ_marJ location=0.000000, 0.000000, 0.000000 orientation=9.712872, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.LeftRevJ_marJ visibility=on
marker create marker_name=.sliderActuator.DeltaF2.crank_linkLF_marI location=-0.064952, 0.037500, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.DeltaF2.crank_linkLF_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF2.crank_linkLB_marI location=-0.064952, 0.037500, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.DeltaF2.crank_linkLB_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J21_marJ location=-0.034799, 0.013975, 0.127031 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.J21_marJ visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J21B_marJ location=-0.034799, 0.013975, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.J21B_marJ visibility=on
marker create marker_name=.sliderActuator.DeltaF2.J21__marJ location=-0.013975, -0.034799, 0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.J21__marJ visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleFplatem1 location=0.049314, 0.008252, 0.061875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleFplatem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleFplatem2 location=0.000000, 0.000000, 0.061875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleFplatem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleFplatem3 location=0.008252, -0.049314, 0.061875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleFplatem3 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF2.triangleF marker_name=.sliderActuator.DeltaF2.triangleFplatem1, .sliderActuator.DeltaF2.triangleFplatem2, .sliderActuator.DeltaF2.triangleFplatem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF2.triangleF1platem1 location=0.049314, 0.008252, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF1platem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleF1platem2 location=-0.070348, 0.026004, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF1platem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleF1platem3 location=0.008252, -0.049314, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF1platem3 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF2.triangleF1 marker_name=.sliderActuator.DeltaF2.triangleF1platem1, .sliderActuator.DeltaF2.triangleF1platem2, .sliderActuator.DeltaF2.triangleF1platem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF2.triangleF2platem1 location=0.049314, 0.008252, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF2platem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleF2platem2 location=-0.034799, 0.013975, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF2platem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleF2platem3 location=-0.013975, -0.034799, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF2platem3 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleF2platem4 location=0.008252, -0.049314, 0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF2platem4 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF2.triangleF2 marker_name=.sliderActuator.DeltaF2.triangleF2platem1, .sliderActuator.DeltaF2.triangleF2platem2, .sliderActuator.DeltaF2.triangleF2platem3, .sliderActuator.DeltaF2.triangleF2platem4 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF2.triangleF2 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF2.triangleBplatem1 location=0.049314, 0.008252, -0.061875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleBplatem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleBplatem2 location=0.000000, 0.000000, -0.061875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleBplatem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleBplatem3 location=0.008252, -0.049314, -0.061875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleBplatem3 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF2.triangleB marker_name=.sliderActuator.DeltaF2.triangleBplatem1, .sliderActuator.DeltaF2.triangleBplatem2, .sliderActuator.DeltaF2.triangleBplatem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF2.triangleB1platem1 location=0.049314, 0.008252, -0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB1platem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleB1platem2 location=-0.070348, 0.026004, -0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB1platem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleB1platem3 location=0.008252, -0.049314, -0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB1platem3 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF2.triangleB1 marker_name=.sliderActuator.DeltaF2.triangleB1platem1, .sliderActuator.DeltaF2.triangleB1platem2, .sliderActuator.DeltaF2.triangleB1platem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF2.triangleB2platem1 location=0.049314, 0.008252, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB2platem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleB2platem2 location=-0.034799, 0.013975, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB2platem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleB2platem3 location=-0.013975, -0.034799, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB2platem3 visibility=on
marker create marker_name=.sliderActuator.DeltaF2.triangleB2platem4 location=0.008252, -0.049314, -0.074375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB2platem4 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF2.triangleB2 marker_name=.sliderActuator.DeltaF2.triangleB2platem1, .sliderActuator.DeltaF2.triangleB2platem2, .sliderActuator.DeltaF2.triangleB2platem3, .sliderActuator.DeltaF2.triangleB2platem4 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF2.triangleB2 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF2.cyn2 reference_marker=.sliderActuator.DeltaF2.mar22  points_for_profile= &
0.003750, 0.000000, -0.074375, &
0.003145, 0.002042, -0.074375, &
0.001525, 0.003426, -0.074375, &
-0.000587, 0.003704, -0.074375, &
-0.002509, 0.002787, -0.074375, &
-0.003622, 0.000971, -0.074375, &
-0.003566, -0.001159, -0.074375, &
-0.002360, -0.002914, -0.074375, &
-0.000392, -0.003729, -0.074375, &
0.001702, -0.003341, -0.074375, &
0.003248, -0.001875, -0.074375, &
0.003750, 0.000000, -0.074375 &
length_along_z_axis=0.136250 analytical=yes &
relative_to=.sliderActuator.DeltaF2.mar22
entity attributes entity_name=.sliderActuator.DeltaF2.cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF2.cyn2 render=filled
marker create marker_name=.sliderActuator.DeltaF2.J21B__marJ location=-0.013975, -0.034799, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF2.J21B__marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.DeltaF2 material_type = steel
entity attributes entity_name=.sliderActuator.DeltaF2.triangleF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF2.triangleF1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF2.triangleF2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF2.triangleB visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF2.triangleB1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF2.triangleB2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF2.cyn2 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.Paral2 i_marker_name=.sliderActuator.DeltaF2.paralmar j_marker_name=.sliderActuator.ground.ground_marker
constraint create joint revolute joint_name=.sliderActuator.J15 i_marker_name=.sliderActuator.DeltaF2.J15_marI j_marker_name=.sliderActuator.SLM11_CrankFF.J15_marJ
force create element_like bushing bushing_name=.sliderActuator.J16 i_marker_name=.sliderActuator.DeltaF2.J16_marI j_marker_name=.sliderActuator.ParaLinkF12.J16_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
constraint create joint revolute joint_name=.sliderActuator.J15B i_marker_name=.sliderActuator.DeltaF2.J15B_marI j_marker_name=.sliderActuator.SLM11_CrankFF.J15B_marJ
force create element_like bushing bushing_name=.sliderActuator.J16B i_marker_name=.sliderActuator.DeltaF2.J16B_marI j_marker_name=.sliderActuator.ParaLinkB12.J16B_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_Brace
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_Brace material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_Brace visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_Brace.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.LeftRevJ_marI location=0.000000, 0.000000, 0.000000 orientation=9.712872, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.SLM22_Brace.LeftRevJ_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.braceGeo location=0.000000, 0.037500, 0.000000 orientation=90.000000, -90.000000, -90.000000 relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI 

entity attributes entity_name=.sliderActuator.SLM22_Brace.braceGeo visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.halfBracef reference_marker=.sliderActuator.SLM22_Brace.braceGeo  points_for_profile= &
0.007500, -0.025313, -0.007500, &
0.025313, -0.025313, -0.007500, &
0.025313, 0.025313, -0.007500, &
0.007500, 0.025313, -0.007500, &
0.007500, 0.030000, -0.007500, &
0.030000, 0.030000, -0.007500, &
0.030000, -0.030000, -0.007500, &
0.007500, -0.030000, -0.007500, &
0.007500, -0.025313, -0.007500 &
length_along_z_axis=0.090000 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBracef type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.halfBracef render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.halfBraceb reference_marker=.sliderActuator.SLM22_Brace.braceGeo  points_for_profile= &
-0.007500, -0.025313, -0.007500, &
-0.025313, -0.025313, -0.007500, &
-0.025313, 0.025313, -0.007500, &
-0.007500, 0.025313, -0.007500, &
-0.007500, 0.030000, -0.007500, &
-0.030000, 0.030000, -0.007500, &
-0.030000, -0.030000, -0.007500, &
-0.007500, -0.030000, -0.007500, &
-0.007500, -0.025313, -0.007500 &
length_along_z_axis=0.090000 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBraceb type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.halfBraceb render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.halfBracef1 reference_marker=.sliderActuator.SLM22_Brace.braceGeo  points_for_profile= &
0.007500, -0.015938, -0.190860, &
0.011250, -0.015938, -0.190860, &
0.011250, 0.025313, -0.190860, &
0.007500, 0.015938, -0.190860, &
0.007500, 0.030000, -0.190860, &
0.015938, 0.030000, -0.190860, &
0.015938, -0.030000, -0.190860, &
0.007500, -0.030000, -0.190860, &
0.007500, -0.015938, -0.190860 &
length_along_z_axis=0.183360 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBracef1 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.halfBracef1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.halfBraceb1 reference_marker=.sliderActuator.SLM22_Brace.braceGeo  points_for_profile= &
-0.007500, -0.015938, -0.190860, &
-0.011250, -0.015938, -0.190860, &
-0.011250, 0.025313, -0.190860, &
-0.007500, 0.015938, -0.190860, &
-0.007500, 0.030000, -0.190860, &
-0.015938, 0.030000, -0.190860, &
-0.015938, -0.030000, -0.190860, &
-0.007500, -0.030000, -0.190860, &
-0.007500, -0.015938, -0.190860 &
length_along_z_axis=0.183360 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBraceb1 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.halfBraceb1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.halfBrace2 reference_marker=.sliderActuator.SLM22_Brace.braceGeo  points_for_profile= &
-0.015938, 0.000000, -0.407500, &
-0.011250, 0.000000, -0.407500, &
-0.011250, 0.025313, -0.407500, &
0.011250, 0.025313, -0.407500, &
0.011250, 0.000000, -0.407500, &
0.015938, 0.000000, -0.407500, &
0.015938, 0.030000, -0.407500, &
-0.015938, 0.030000, -0.407500, &
-0.015938, 0.000000, -0.407500 &
length_along_z_axis=0.216640 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBrace2 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.halfBrace2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.frontEarL reference_marker=.sliderActuator.SLM22_Brace.LeftRevJ_marI  points_for_profile= &
-0.007500, 0.000000, 0.015000, &
-0.007048, -0.002565, 0.015000, &
-0.005745, -0.004821, 0.015000, &
-0.003750, -0.006495, 0.015000, &
-0.001302, -0.007386, 0.015000, &
0.001302, -0.007386, 0.015000, &
0.003750, -0.006495, 0.015000, &
0.005745, -0.004821, 0.015000, &
0.007048, -0.002565, 0.015000, &
0.007500, -0.000000, 0.015000, &
0.007500, 0.007500, 0.015000, &
-0.007500, 0.007500, 0.015000, &
-0.007500, 0.000000, 0.015000 &
length_along_z_axis=0.015000 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM22_Brace.frontEarL type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.frontEarL render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.BackEarL reference_marker=.sliderActuator.SLM22_Brace.LeftRevJ_marI  points_for_profile= &
-0.007500, 0.000000, -0.030000, &
-0.007048, -0.002565, -0.030000, &
-0.005745, -0.004821, -0.030000, &
-0.003750, -0.006495, -0.030000, &
-0.001302, -0.007386, -0.030000, &
0.001302, -0.007386, -0.030000, &
0.003750, -0.006495, -0.030000, &
0.005745, -0.004821, -0.030000, &
0.007048, -0.002565, -0.030000, &
0.007500, -0.000000, -0.030000, &
0.007500, 0.007500, -0.030000, &
-0.007500, 0.007500, -0.030000, &
-0.007500, 0.000000, -0.030000 &
length_along_z_axis=0.015000 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM22_Brace.BackEarL type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.BackEarL render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.BackEarR reference_marker=.sliderActuator.SLM22_Brace.LeftRevJ_marI  points_for_profile= &
0.123360, 0.075000, -0.025313, &
0.122908, 0.077565, -0.025313, &
0.121605, 0.079821, -0.025313, &
0.119610, 0.081495, -0.025313, &
0.117162, 0.082386, -0.025313, &
0.114558, 0.082386, -0.025313, &
0.112110, 0.081495, -0.025313, &
0.110115, 0.079821, -0.025313, &
0.108812, 0.077565, -0.025313, &
0.108360, 0.075000, -0.025313, &
0.108360, 0.067500, -0.025313, &
0.123360, 0.067500, -0.025313, &
0.123360, 0.075000, -0.025313 &
length_along_z_axis=0.016875 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM22_Brace.BackEarR type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.BackEarR render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.FrontEarR reference_marker=.sliderActuator.SLM22_Brace.LeftRevJ_marI  points_for_profile= &
0.123360, 0.075000, 0.008438, &
0.122908, 0.077565, 0.008438, &
0.121605, 0.079821, 0.008438, &
0.119610, 0.081495, 0.008438, &
0.117162, 0.082386, 0.008438, &
0.114558, 0.082386, 0.008438, &
0.112110, 0.081495, 0.008438, &
0.110115, 0.079821, 0.008438, &
0.108812, 0.077565, 0.008438, &
0.108360, 0.075000, 0.008438, &
0.108360, 0.067500, 0.008438, &
0.123360, 0.067500, 0.008438, &
0.123360, 0.075000, 0.008438 &
length_along_z_axis=0.016875 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM22_Brace.FrontEarR type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.FrontEarR render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.BackEarF reference_marker=.sliderActuator.SLM22_Brace.LeftRevJ_marI  points_for_profile= &
0.407500, 0.075000, -0.015938, &
0.407048, 0.077565, -0.015938, &
0.405745, 0.079821, -0.015938, &
0.403750, 0.081495, -0.015938, &
0.401302, 0.082386, -0.015938, &
0.398698, 0.082386, -0.015938, &
0.396250, 0.081495, -0.015938, &
0.394255, 0.079821, -0.015938, &
0.392952, 0.077565, -0.015938, &
0.392500, 0.075000, -0.015938, &
0.392500, 0.067500, -0.015938, &
0.407500, 0.067500, -0.015938, &
0.407500, 0.075000, -0.015938 &
length_along_z_axis=0.007500 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM22_Brace.BackEarF type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.BackEarF render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.FrontEarF reference_marker=.sliderActuator.SLM22_Brace.LeftRevJ_marI  points_for_profile= &
0.407500, 0.075000, 0.008438, &
0.407048, 0.077565, 0.008438, &
0.405745, 0.079821, 0.008438, &
0.403750, 0.081495, 0.008438, &
0.401302, 0.082386, 0.008438, &
0.398698, 0.082386, 0.008438, &
0.396250, 0.081495, 0.008438, &
0.394255, 0.079821, 0.008438, &
0.392952, 0.077565, 0.008438, &
0.392500, 0.075000, 0.008438, &
0.392500, 0.067500, 0.008438, &
0.407500, 0.067500, 0.008438, &
0.407500, 0.075000, 0.008438 &
length_along_z_axis=0.007500 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM22_Brace.FrontEarF type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.FrontEarF render=filled
marker create marker_name=.sliderActuator.SLM22_Brace.part2_bracef_marI location=0.115860, 0.075000, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Brace.part2_bracef_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.part2_braceb_marI location=0.115860, 0.075000, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Brace.part2_braceb_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.part21_bracef_marI location=0.000000, 0.000000, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Brace.part21_bracef_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.crank_brace_f_marJ location=0.400000, 0.075000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Brace.crank_brace_f_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.sprocket_chain_b01_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_CrankFF.chain_b01_chain_pair_mar 

entity attributes entity_name=.sliderActuator.SLM22_Brace.sprocket_chain_b01_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Brace.chain_b01_right1 reference_marker=.sliderActuator.SLM22_Brace.sprocket_chain_b01_right_mar  points_for_profile= &
0.434237, 0.000000, -0.036250, &
0.433070, 0.008861, -0.036250, &
0.429650, 0.017118, -0.036250, &
0.424209, 0.024209, -0.036250, &
0.417118, 0.029650, -0.036250, &
0.408861, 0.033070, -0.036250, &
0.400000, 0.034237, -0.036250, &
0.391139, 0.033070, -0.036250, &
0.382882, 0.029650, -0.036250, &
0.375791, 0.024209, -0.036250, &
0.370350, 0.017118, -0.036250, &
0.366930, 0.008861, -0.036250, &
0.365763, 0.000000, -0.036250, &
0.366930, -0.008861, -0.036250, &
0.370350, -0.017118, -0.036250, &
0.375791, -0.024209, -0.036250, &
0.382882, -0.029650, -0.036250, &
0.391139, -0.033070, -0.036250, &
0.400000, -0.034237, -0.036250, &
0.408861, -0.033070, -0.036250, &
0.417118, -0.029650, -0.036250, &
0.424209, -0.024209, -0.036250, &
0.429650, -0.017118, -0.036250, &
0.433070, -0.008861, -0.036250, &
0.434237, 0.000000, -0.036250 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM22_Brace.sprocket_chain_b01_right_mar
entity attributes entity_name=.sliderActuator.SLM22_Brace.chain_b01_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Brace.chain_b01_right1 render=filled
marker create marker_name=.sliderActuator.SLM22_Brace.J23_marJ location=0.381613, 0.141409, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.SLM22_Brace.J23_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_Brace.J23B_marJ location=0.381613, 0.141409, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.SLM22_Brace.J23B_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_Brace material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBracef visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBraceb visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBracef1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBraceb1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.halfBrace2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.frontEarL visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.BackEarL visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.BackEarR visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.FrontEarR visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.BackEarF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.FrontEarF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Brace.chain_b01_right1 visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_LeftRevJ i_marker_name=.sliderActuator.SLM22_Brace.LeftRevJ_marI j_marker_name=.sliderActuator.DeltaF2.LeftRevJ_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_slider
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_slider material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_slider visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_slider.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_slider.slide_BaseMar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM22_Brace.braceGeo 

entity attributes entity_name=.sliderActuator.SLM22_slider.slide_BaseMar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_slider.slider reference_marker=.sliderActuator.SLM22_slider.slide_BaseMar  points_for_profile= &
0.011250, 0.020625, -0.090000, &
0.007500, 0.020625, -0.090000, &
0.007500, 0.030000, -0.090000, &
-0.007500, 0.030000, -0.090000, &
-0.007500, 0.020625, -0.090000, &
-0.011250, 0.020625, -0.090000, &
-0.011250, -0.030000, -0.090000, &
0.011250, -0.030000, -0.090000, &
0.011250, 0.020625, -0.090000 &
length_along_z_axis=0.015000 analytical=yes &
relative_to=.sliderActuator.SLM22_slider.slide_BaseMar
entity attributes entity_name=.sliderActuator.SLM22_slider.slider type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_slider.slider render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_slider.slider1 reference_marker=.sliderActuator.SLM22_slider.slide_BaseMar  points_for_profile= &
-0.007500, 0.025313, -0.075000, &
0.007500, 0.025313, -0.075000, &
0.007500, 0.030000, -0.075000, &
-0.007500, 0.030000, -0.075000, &
-0.007500, 0.025313, -0.075000 &
length_along_z_axis=0.082500 analytical=yes &
relative_to=.sliderActuator.SLM22_slider.slide_BaseMar
entity attributes entity_name=.sliderActuator.SLM22_slider.slider1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_slider.slider1 render=filled
marker create marker_name=.sliderActuator.SLM22_slider.toLinkL_F location=0.000000, 0.075000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM22_Brace.LeftRevJ_marI 

entity attributes entity_name=.sliderActuator.SLM22_slider.toLinkL_F visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_slider.slider2 reference_marker=.sliderActuator.SLM22_slider.toLinkL_F  points_for_profile= &
0.075000, -0.067500, -0.007500, &
0.075000, -0.075000, -0.007500, &
0.075452, -0.077565, -0.007500, &
0.076755, -0.079821, -0.007500, &
0.078750, -0.081495, -0.007500, &
0.081198, -0.082386, -0.007500, &
0.083802, -0.082386, -0.007500, &
0.086250, -0.081495, -0.007500, &
0.088245, -0.079821, -0.007500, &
0.089548, -0.077565, -0.007500, &
0.090000, -0.075000, -0.007500, &
0.090000, -0.067500, -0.007500, &
0.075000, -0.067500, -0.007500 &
length_along_z_axis=0.015000 analytical=yes &
relative_to=.sliderActuator.SLM22_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM22_slider.slider2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_slider.slider2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_slider.slider3 reference_marker=.sliderActuator.SLM22_slider.toLinkL_F  points_for_profile= &
0.086250, -0.075000, -0.015938, &
0.085645, -0.072958, -0.015938, &
0.084025, -0.071574, -0.015938, &
0.081913, -0.071296, -0.015938, &
0.079991, -0.072213, -0.015938, &
0.078878, -0.074029, -0.015938, &
0.078934, -0.076159, -0.015938, &
0.080140, -0.077914, -0.015938, &
0.082108, -0.078729, -0.015938, &
0.084202, -0.078341, -0.015938, &
0.085748, -0.076875, -0.015938, &
0.086250, -0.075000, -0.015938 &
length_along_z_axis=0.031875 analytical=yes &
relative_to=.sliderActuator.SLM22_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM22_slider.slider3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_slider.slider3 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_slider.slider4 reference_marker=.sliderActuator.SLM22_slider.toLinkL_F  points_for_profile= &
0.007500, 0.000000, -0.043125, &
0.006290, 0.004085, -0.043125, &
0.003051, 0.006852, -0.043125, &
-0.001173, 0.007408, -0.043125, &
-0.005018, 0.005574, -0.043125, &
-0.007244, 0.001941, -0.043125, &
-0.007133, -0.002318, -0.043125, &
-0.004720, -0.005829, -0.043125, &
-0.000784, -0.007459, -0.043125, &
0.003405, -0.006683, -0.043125, &
0.006495, -0.003750, -0.043125, &
0.007500, 0.000000, -0.043125 &
length_along_z_axis=0.086250 analytical=yes &
relative_to=.sliderActuator.SLM22_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM22_slider.slider4 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_slider.slider4 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_slider.slider5 reference_marker=.sliderActuator.SLM22_slider.toLinkL_F  points_for_profile= &
0.007500, 0.000000, -0.007500, &
0.007048, 0.002565, -0.007500, &
0.005745, 0.004821, -0.007500, &
0.003750, 0.006495, -0.007500, &
0.001302, 0.007386, -0.007500, &
-0.001302, 0.007386, -0.007500, &
-0.003750, 0.006495, -0.007500, &
-0.005745, 0.004821, -0.007500, &
-0.007048, 0.002565, -0.007500, &
-0.007500, 0.000000, -0.007500, &
-0.007500, -0.007500, -0.007500, &
0.007500, -0.007500, -0.007500, &
0.007500, 0.000000, -0.007500 &
length_along_z_axis=0.015000 analytical=yes &
relative_to=.sliderActuator.SLM22_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM22_slider.slider5 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_slider.slider5 render=filled
marker create marker_name=.sliderActuator.SLM22_slider.slider_linkF_marI location=0.000000, 0.075000, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_slider.slider_linkF_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_slider.slider_linkB_marJ location=0.000000, 0.075000, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_slider.slider_linkB_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_slider.slider_linkRF_marI location=0.082500, 0.000000, 0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_slider.slider_linkRF_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_slider.slider_linkRB_marI location=0.082500, 0.000000, -0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_slider.slider_linkRB_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_slider material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_slider.slider visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_slider.slider1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_slider.slider2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_slider.slider3 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_slider.slider4 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_slider.slider5 visibility=on color=WHITE

data_element create variable variable_name=.sliderActuator.SLM22_motionFunc function="(0.016680+sin(time/3*2*PI-0.199467)*0.084180)*0.000000"
constraint create joint translational joint_name=.sliderActuator.SLM22_SliderJoint i_marker_name=.sliderActuator.SLM22_slider.slide_BaseMar j_marker_name=.sliderActuator.SLM22_Brace.braceGeo
constraint create motion_generator motion_name=.sliderActuator.SLM22_SliderJoint_motion type_of_freedom=translational joint_name=.sliderActuator.SLM22_SliderJoint  function="-VARVAL(.sliderActuator.SLM22_motionFunc)"
measure create function measure=.sliderActuator.SLM22_ActForce function="-MOTION(.sliderActuator.SLM22_SliderJoint_motion, 0, 4, .sliderActuator.SLM22_Brace.braceGeo)" create_measure_display=no
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_LinkLF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkLF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkLF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_LinkLF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_LinkLF.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkLF.LinkLF_endI location=0.000000, 0.075000, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkLF.LinkLF_endJ location=-0.064952, 0.037500, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkLF.LinkLF_link_cyn1 reference_marker=.sliderActuator.SLM22_LinkLF.LinkLF_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkLF.LinkLF_endI
entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkLF.LinkLF_link_cyn2 reference_marker=.sliderActuator.SLM22_LinkLF.LinkLF_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkLF.LinkLF_endJ
entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_LinkLF.LinkLF_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_LinkLF.LinkLF_endI j_marker=.sliderActuator.SLM22_LinkLF.LinkLF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_csg1 base_object=.sliderActuator.SLM22_LinkLF.LinkLF_link object=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_csg2 base_object=.sliderActuator.SLM22_LinkLF.LinkLF_link_csg1 object=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_LinkLF.slider_linkF_marJ location=0.000000, 0.075000, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLF.slider_linkF_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkLF.crank_linkLF_marJ location=-0.064952, 0.037500, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLF.crank_linkLF_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkLF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkLF.LinkLF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_slider_linkF i_marker_name=.sliderActuator.SLM22_slider.slider_linkF_marI j_marker_name=.sliderActuator.SLM22_LinkLF.slider_linkF_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_crank_linkLF i_marker_name=.sliderActuator.DeltaF2.crank_linkLF_marI j_marker_name=.sliderActuator.SLM22_LinkLF.crank_linkLF_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_LinkLB
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkLB material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkLB visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_LinkLB.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_LinkLB.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkLB.LinkLB_endI location=0.000000, 0.075000, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkLB.LinkLB_endJ location=-0.064952, 0.037500, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkLB.LinkLB_link_cyn1 reference_marker=.sliderActuator.SLM22_LinkLB.LinkLB_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkLB.LinkLB_endI
entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkLB.LinkLB_link_cyn2 reference_marker=.sliderActuator.SLM22_LinkLB.LinkLB_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkLB.LinkLB_endJ
entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_LinkLB.LinkLB_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_LinkLB.LinkLB_endI j_marker=.sliderActuator.SLM22_LinkLB.LinkLB_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_csg1 base_object=.sliderActuator.SLM22_LinkLB.LinkLB_link object=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_csg2 base_object=.sliderActuator.SLM22_LinkLB.LinkLB_link_csg1 object=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_LinkLB.slider_linkB_marI location=0.000000, 0.075000, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLB.slider_linkB_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkLB.crank_linkLB_marJ location=-0.064952, 0.037500, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkLB.crank_linkLB_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkLB material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkLB.LinkLB_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_slider_linkB i_marker_name=.sliderActuator.SLM22_LinkLB.slider_linkB_marI j_marker_name=.sliderActuator.SLM22_slider.slider_linkB_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_crank_linkLB i_marker_name=.sliderActuator.DeltaF2.crank_linkLB_marI j_marker_name=.sliderActuator.SLM22_LinkLB.crank_linkLB_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_LinkRF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkRF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkRF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_LinkRF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_LinkRF.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkRF.LinkRF_endI location=0.082500, 0.000000, 0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkRF.LinkRF_endJ location=0.156536, 0.011988, 0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkRF.LinkRF_link_cyn1 reference_marker=.sliderActuator.SLM22_LinkRF.LinkRF_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkRF.LinkRF_endI
entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkRF.LinkRF_link_cyn2 reference_marker=.sliderActuator.SLM22_LinkRF.LinkRF_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkRF.LinkRF_endJ
entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_LinkRF.LinkRF_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_LinkRF.LinkRF_endI j_marker=.sliderActuator.SLM22_LinkRF.LinkRF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_csg1 base_object=.sliderActuator.SLM22_LinkRF.LinkRF_link object=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_csg2 base_object=.sliderActuator.SLM22_LinkRF.LinkRF_link_csg1 object=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_LinkRF.slider_linkRF_marJ location=0.082500, 0.000000, 0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRF.slider_linkRF_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkRF.RevRJF_marJ location=0.156536, 0.011988, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRF.RevRJF_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkRF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkRF.LinkRF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_slider_linkRF i_marker_name=.sliderActuator.SLM22_slider.slider_linkRF_marI j_marker_name=.sliderActuator.SLM22_LinkRF.slider_linkRF_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_LinkRB
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkRB material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkRB visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_LinkRB.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_LinkRB.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkRB.LinkRB_endI location=0.082500, 0.000000, -0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkRB.LinkRB_endJ location=0.156536, 0.011988, -0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkRB.LinkRB_link_cyn1 reference_marker=.sliderActuator.SLM22_LinkRB.LinkRB_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkRB.LinkRB_endI
entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_LinkRB.LinkRB_link_cyn2 reference_marker=.sliderActuator.SLM22_LinkRB.LinkRB_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_LinkRB.LinkRB_endJ
entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_LinkRB.LinkRB_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_LinkRB.LinkRB_endI j_marker=.sliderActuator.SLM22_LinkRB.LinkRB_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_csg1 base_object=.sliderActuator.SLM22_LinkRB.LinkRB_link object=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_csg2 base_object=.sliderActuator.SLM22_LinkRB.LinkRB_link_csg1 object=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_LinkRB.slider_linkRB_marJ location=0.082500, 0.000000, -0.018281 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRB.slider_linkRB_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_LinkRB.RevRJB_marJ location=0.156536, 0.011988, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_LinkRB.RevRJB_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_LinkRB material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_LinkRB.LinkRB_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_slider_linkRB i_marker_name=.sliderActuator.SLM22_slider.slider_linkRB_marI j_marker_name=.sliderActuator.SLM22_LinkRB.slider_linkRB_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_Part2
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_Part2 material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_Part2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_Part2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_Part2.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.RevRJF_marI location=0.156536, 0.011988, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.RevRJF_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.RevRJB_marI location=0.156536, 0.011988, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.RevRJB_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.part2_bracef_marJ location=0.115860, 0.075000, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.part2_bracef_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.part2_braceb_marJ location=0.115860, 0.075000, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.part2_braceb_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.trianglefplatem1 location=0.115860, 0.075000, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglefplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.trianglefplatem2 location=0.113413, 0.000040, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglefplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.trianglefplatem3 location=0.156536, 0.011988, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglefplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM22_Part2.trianglef marker_name=.sliderActuator.SLM22_Part2.trianglefplatem1, .sliderActuator.SLM22_Part2.trianglefplatem2, .sliderActuator.SLM22_Part2.trianglefplatem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglef type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_Part2.trianglebplatem1 location=0.115860, 0.075000, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglebplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.trianglebplatem2 location=0.113413, 0.000040, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglebplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.trianglebplatem3 location=0.156536, 0.011988, -0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglebplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM22_Part2.triangleb marker_name=.sliderActuator.SLM22_Part2.trianglebplatem1, .sliderActuator.SLM22_Part2.trianglebplatem2, .sliderActuator.SLM22_Part2.trianglebplatem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.SLM22_Part2.triangleb type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_Part2.part21_link_marI location=0.156536, 0.011988, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.part21_link_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.part2_distalLinkf_marI location=0.113413, 0.000040, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.part2_distalLinkf_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_Part2.part2_distalLinkb_marI location=0.113413, 0.000040, -0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Part2.part2_distalLinkb_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_Part2 material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_Part2.trianglef visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Part2.triangleb visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_RevRJF i_marker_name=.sliderActuator.SLM22_Part2.RevRJF_marI j_marker_name=.sliderActuator.SLM22_LinkRF.RevRJF_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_RevRJB i_marker_name=.sliderActuator.SLM22_Part2.RevRJB_marI j_marker_name=.sliderActuator.SLM22_LinkRB.RevRJB_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_part2_bracef i_marker_name=.sliderActuator.SLM22_Brace.part2_bracef_marI j_marker_name=.sliderActuator.SLM22_Part2.part2_bracef_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_part2_braceb i_marker_name=.sliderActuator.SLM22_Brace.part2_braceb_marI j_marker_name=.sliderActuator.SLM22_Part2.part2_braceb_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_part21
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_part21 material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_part21 visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_part21.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_part21.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_part21.cynmar location=0.040676, -0.063012, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_part21.cynmar visibility=on
marker create marker_name=.sliderActuator.SLM22_part21.splateplatem1 location=0.000000, 0.000000, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_part21.splateplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM22_part21.splateplatem2 location=-0.002447, -0.074960, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_part21.splateplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM22_part21.splateplatem3 location=0.040676, -0.063012, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_part21.splateplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM22_part21.splate marker_name=.sliderActuator.SLM22_part21.splateplatem1, .sliderActuator.SLM22_part21.splateplatem2, .sliderActuator.SLM22_part21.splateplatem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.SLM22_part21.splate type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_part21.cyn reference_marker=.sliderActuator.SLM22_part21.cynmar  points_for_profile= &
0.003750, 0.000000, 0.002344, &
0.003145, 0.002042, 0.002344, &
0.001525, 0.003426, 0.002344, &
-0.000587, 0.003704, 0.002344, &
-0.002509, 0.002787, 0.002344, &
-0.003622, 0.000971, 0.002344, &
-0.003566, -0.001159, 0.002344, &
-0.002360, -0.002914, 0.002344, &
-0.000392, -0.003729, 0.002344, &
0.001702, -0.003341, 0.002344, &
0.003248, -0.001875, 0.002344, &
0.003750, 0.000000, 0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_part21.cynmar
entity attributes entity_name=.sliderActuator.SLM22_part21.cyn type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_part21.cyn render=filled
marker create marker_name=.sliderActuator.SLM22_part21.part21_bracef_marJ location=0.000000, 0.000000, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_part21.part21_bracef_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_part21.part2_link_marI location=0.040676, -0.063012, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_part21.part2_link_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_part21.sprocket_chain_f01_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_CrankFF.chain_f01_chain_pair_mar 

entity attributes entity_name=.sliderActuator.SLM22_part21.sprocket_chain_f01_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_part21.chain_f01_right1 reference_marker=.sliderActuator.SLM22_part21.sprocket_chain_f01_right_mar  points_for_profile= &
0.434237, 0.000000, 0.034688, &
0.433070, 0.008861, 0.034688, &
0.429650, 0.017118, 0.034688, &
0.424209, 0.024209, 0.034688, &
0.417118, 0.029650, 0.034688, &
0.408861, 0.033070, 0.034688, &
0.400000, 0.034237, 0.034688, &
0.391139, 0.033070, 0.034688, &
0.382882, 0.029650, 0.034688, &
0.375791, 0.024209, 0.034688, &
0.370350, 0.017118, 0.034688, &
0.366930, 0.008861, 0.034688, &
0.365763, 0.000000, 0.034688, &
0.366930, -0.008861, 0.034688, &
0.370350, -0.017118, 0.034688, &
0.375791, -0.024209, 0.034688, &
0.382882, -0.029650, 0.034688, &
0.391139, -0.033070, 0.034688, &
0.400000, -0.034237, 0.034688, &
0.408861, -0.033070, 0.034688, &
0.417118, -0.029650, 0.034688, &
0.424209, -0.024209, 0.034688, &
0.429650, -0.017118, 0.034688, &
0.433070, -0.008861, 0.034688, &
0.434237, 0.000000, 0.034688 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.SLM22_part21.sprocket_chain_f01_right_mar
entity attributes entity_name=.sliderActuator.SLM22_part21.chain_f01_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_part21.chain_f01_right1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_part21 material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_part21.splate visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_part21.cyn visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_part21.chain_f01_right1 visibility=on color=WHITE

part create rigid_body name_and_position part_name=.sliderActuator.SLM22_Link21_RF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_Link21_RF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_Link21_RF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_Link21_RF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_endI location=0.156536, 0.011988, 0.022969 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_endJ location=0.040676, -0.063012, 0.022969 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn1 reference_marker=.sliderActuator.SLM22_Link21_RF.Link21_RF_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_Link21_RF.Link21_RF_endI
entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn2 reference_marker=.sliderActuator.SLM22_Link21_RF.Link21_RF_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_Link21_RF.Link21_RF_endJ
entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_Link21_RF.Link21_RF_endI j_marker=.sliderActuator.SLM22_Link21_RF.Link21_RF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_csg1 base_object=.sliderActuator.SLM22_Link21_RF.Link21_RF_link object=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_csg2 base_object=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_csg1 object=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_Link21_RF.part21_link_marJ location=0.156536, 0.011988, 0.027656 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.part21_link_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_Link21_RF.part2_link_marJ location=0.040676, -0.063012, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.part2_link_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_Link21_RF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_Link21_RF.Link21_RF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_part21_bracef i_marker_name=.sliderActuator.SLM22_Brace.part21_bracef_marI j_marker_name=.sliderActuator.SLM22_part21.part21_bracef_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_part21_link i_marker_name=.sliderActuator.SLM22_Part2.part21_link_marI j_marker_name=.sliderActuator.SLM22_Link21_RF.part21_link_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_part2_link i_marker_name=.sliderActuator.SLM22_part21.part2_link_marI j_marker_name=.sliderActuator.SLM22_Link21_RF.part2_link_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_CrankFF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_CrankFF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_CrankFF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_CrankFF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.trianglef1platem1 location=0.400000, 0.075000, 0.041719 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.trianglef1platem1 visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.trianglef1platem2 location=0.397553, 0.000040, 0.041719 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.trianglef1platem2 visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.trianglef1platem3 location=0.755224, -0.108891, 0.041719 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.trianglef1platem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM22_CrankFF.trianglef1 marker_name=.sliderActuator.SLM22_CrankFF.trianglef1platem1, .sliderActuator.SLM22_CrankFF.trianglef1platem2, .sliderActuator.SLM22_CrankFF.trianglef1platem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.trianglef1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_CrankFF.triangleb1platem1 location=0.400000, 0.075000, -0.041719 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.triangleb1platem1 visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.triangleb1platem2 location=0.397553, 0.000040, -0.041719 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.triangleb1platem2 visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.triangleb1platem3 location=0.755224, -0.108891, -0.041719 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.triangleb1platem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM22_CrankFF.triangleb1 marker_name=.sliderActuator.SLM22_CrankFF.triangleb1platem1, .sliderActuator.SLM22_CrankFF.triangleb1platem2, .sliderActuator.SLM22_CrankFF.triangleb1platem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.triangleb1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_CrankFF.crank_brace_f_marI location=0.400000, 0.075000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.crank_brace_f_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.centM location=0.400000, 0.075000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.centM visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_CrankFF.connectRod reference_marker=.sliderActuator.SLM22_CrankFF.centM  points_for_profile= &
0.003750, 0.000000, -0.053438, &
0.003145, 0.002042, -0.053438, &
0.001525, 0.003426, -0.053438, &
-0.000587, 0.003704, -0.053438, &
-0.002509, 0.002787, -0.053438, &
-0.003622, 0.000971, -0.053438, &
-0.003566, -0.001159, -0.053438, &
-0.002360, -0.002914, -0.053438, &
-0.000392, -0.003729, -0.053438, &
0.001702, -0.003341, -0.053438, &
0.003248, -0.001875, -0.053438, &
0.003750, 0.000000, -0.053438 &
length_along_z_axis=0.106875 analytical=yes &
relative_to=.sliderActuator.SLM22_CrankFF.centM
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.connectRod type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_CrankFF.connectRod render=filled
marker create marker_name=.sliderActuator.SLM22_CrankFF.centM1 location=0.397553, 0.000040, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.centM1 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_CrankFF.connectRod2 reference_marker=.sliderActuator.SLM22_CrankFF.centM1  points_for_profile= &
0.003750, 0.000000, -0.044063, &
0.003145, 0.002042, -0.044063, &
0.001525, 0.003426, -0.044063, &
-0.000587, 0.003704, -0.044063, &
-0.002509, 0.002787, -0.044063, &
-0.003622, 0.000971, -0.044063, &
-0.003566, -0.001159, -0.044063, &
-0.002360, -0.002914, -0.044063, &
-0.000392, -0.003729, -0.044063, &
0.001702, -0.003341, -0.044063, &
0.003248, -0.001875, -0.044063, &
0.003750, 0.000000, -0.044063 &
length_along_z_axis=0.088125 analytical=yes &
relative_to=.sliderActuator.SLM22_CrankFF.centM1
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.connectRod2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_CrankFF.connectRod2 render=filled
marker create marker_name=.sliderActuator.SLM22_CrankFF.centM2 location=0.755224, -0.108891, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.centM2 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_CrankFF.connectRod3 reference_marker=.sliderActuator.SLM22_CrankFF.centM2  points_for_profile= &
0.003750, 0.000000, -0.044063, &
0.003145, 0.002042, -0.044063, &
0.001525, 0.003426, -0.044063, &
-0.000587, 0.003704, -0.044063, &
-0.002509, 0.002787, -0.044063, &
-0.003622, 0.000971, -0.044063, &
-0.003566, -0.001159, -0.044063, &
-0.002360, -0.002914, -0.044063, &
-0.000392, -0.003729, -0.044063, &
0.001702, -0.003341, -0.044063, &
0.003248, -0.001875, -0.044063, &
0.003750, 0.000000, -0.044063 &
length_along_z_axis=0.088125 analytical=yes &
relative_to=.sliderActuator.SLM22_CrankFF.centM2
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.connectRod3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_CrankFF.connectRod3 render=filled
marker create marker_name=.sliderActuator.SLM22_CrankFF.crank_distalLinkf_marI location=0.397553, 0.000040, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.crank_distalLinkf_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.crank_distalLinkb_marI location=0.397553, 0.000040, -0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.crank_distalLinkb_marI visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.J25_marJ location=0.762769, 0.020084, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.J25_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_CrankFF.J25B_marJ location=0.762769, 0.020084, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.SLM22_CrankFF.J25B_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_CrankFF material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.trianglef1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.triangleb1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.connectRod visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.connectRod2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_CrankFF.connectRod3 visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_crank_brace_f i_marker_name=.sliderActuator.SLM22_CrankFF.crank_brace_f_marI j_marker_name=.sliderActuator.SLM22_Brace.crank_brace_f_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_distalLinkf
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_distalLinkf material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_distalLinkf visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_distalLinkf.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_endI location=0.113413, 0.000040, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_endJ location=0.397553, 0.000040, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn1 reference_marker=.sliderActuator.SLM22_distalLinkf.distalLinkf_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_distalLinkf.distalLinkf_endI
entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn2 reference_marker=.sliderActuator.SLM22_distalLinkf.distalLinkf_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_distalLinkf.distalLinkf_endJ
entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_distalLinkf.distalLinkf_endI j_marker=.sliderActuator.SLM22_distalLinkf.distalLinkf_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_csg1 base_object=.sliderActuator.SLM22_distalLinkf.distalLinkf_link object=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_csg2 base_object=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_csg1 object=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_distalLinkf.crank_distalLinkf_marJ location=0.397553, 0.000040, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.crank_distalLinkf_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_distalLinkf.part2_distalLinkf_marJ location=0.113413, 0.000040, 0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.part2_distalLinkf_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_distalLinkf material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_distalLinkf.distalLinkf_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_crank_distalLinkf i_marker_name=.sliderActuator.SLM22_CrankFF.crank_distalLinkf_marI j_marker_name=.sliderActuator.SLM22_distalLinkf.crank_distalLinkf_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_part2_distalLinkf i_marker_name=.sliderActuator.SLM22_Part2.part2_distalLinkf_marI j_marker_name=.sliderActuator.SLM22_distalLinkf.part2_distalLinkf_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM22_distalLinkb
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_distalLinkb material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_distalLinkb visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM22_distalLinkb.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.cm visibility=on
marker create marker_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_endI location=0.113413, 0.000040, -0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_endI visibility=on
marker create marker_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_endJ location=0.397553, 0.000040, -0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn1 reference_marker=.sliderActuator.SLM22_distalLinkb.distalLinkb_endI  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_distalLinkb.distalLinkb_endI
entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn2 reference_marker=.sliderActuator.SLM22_distalLinkb.distalLinkb_endJ  points_for_profile= &
0.011250, 0.000000, -0.002344, &
0.009435, 0.006127, -0.002344, &
0.004576, 0.010277, -0.002344, &
-0.001760, 0.011111, -0.002344, &
-0.007528, 0.008360, -0.002344, &
-0.010867, 0.002912, -0.002344, &
-0.010699, -0.003476, -0.002344, &
-0.007080, -0.008743, -0.002344, &
-0.001176, -0.011188, -0.002344, &
0.005107, -0.010024, -0.002344, &
0.009743, -0.005625, -0.002344, &
0.011250, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.SLM22_distalLinkb.distalLinkb_endJ
entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link width=0.013500 depth=0.003750 i_marker=.sliderActuator.SLM22_distalLinkb.distalLinkb_endI j_marker=.sliderActuator.SLM22_distalLinkb.distalLinkb_endJ

geometry create shape csg csg_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_csg1 base_object=.sliderActuator.SLM22_distalLinkb.distalLinkb_link object=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_csg2 base_object=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_csg1 object=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM22_distalLinkb.crank_distalLinkb_marJ location=0.397553, 0.000040, -0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.crank_distalLinkb_marJ visibility=on
marker create marker_name=.sliderActuator.SLM22_distalLinkb.part2_distalLinkb_marJ location=0.113413, 0.000040, -0.032344 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.part2_distalLinkb_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM22_distalLinkb material_type = steel
entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM22_distalLinkb.distalLinkb_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM22_crank_distalLinkb i_marker_name=.sliderActuator.SLM22_CrankFF.crank_distalLinkb_marI j_marker_name=.sliderActuator.SLM22_distalLinkb.crank_distalLinkb_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM22_part2_distalLinkb i_marker_name=.sliderActuator.SLM22_Part2.part2_distalLinkb_marI j_marker_name=.sliderActuator.SLM22_distalLinkb.part2_distalLinkb_marJ
part create rigid_body name_and_position part_name=.sliderActuator.idlerf1
part mod rigid_body mass_properties part_name=.sliderActuator.idlerf1 material_type = steel
entity attributes entity_name=.sliderActuator.idlerf1 visibility=on color=WHITE

marker create marker_name=.sliderActuator.idlerf1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.idlerf1.cm visibility=on
marker create marker_name=.sliderActuator.idlerf1.sprocket_chain_f01_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_CrankFF.chain_f01_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerf1.sprocket_chain_f01_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerf1.chain_f01_left1 reference_marker=.sliderActuator.idlerf1.sprocket_chain_f01_left_mar  points_for_profile= &
0.034237, 0.000000, 0.034688, &
0.033070, 0.008861, 0.034688, &
0.029650, 0.017118, 0.034688, &
0.024209, 0.024209, 0.034688, &
0.017118, 0.029650, 0.034688, &
0.008861, 0.033070, 0.034688, &
0.000000, 0.034237, 0.034688, &
-0.008861, 0.033070, 0.034688, &
-0.017118, 0.029650, 0.034688, &
-0.024209, 0.024209, 0.034688, &
-0.029650, 0.017118, 0.034688, &
-0.033070, 0.008861, 0.034688, &
-0.034237, 0.000000, 0.034688, &
-0.033070, -0.008861, 0.034688, &
-0.029650, -0.017118, 0.034688, &
-0.024209, -0.024209, 0.034688, &
-0.017118, -0.029650, 0.034688, &
-0.008861, -0.033070, 0.034688, &
-0.000000, -0.034237, 0.034688, &
0.008861, -0.033070, 0.034688, &
0.017118, -0.029650, 0.034688, &
0.024209, -0.024209, 0.034688, &
0.029650, -0.017118, 0.034688, &
0.033070, -0.008861, 0.034688, &
0.034237, 0.000000, 0.034688 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerf1.sprocket_chain_f01_left_mar
entity attributes entity_name=.sliderActuator.idlerf1.chain_f01_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerf1.chain_f01_left1 render=filled
marker create marker_name=.sliderActuator.idlerf1.chain_f01_left_marI location=0.377395, 0.166051, 0.034688 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.idlerf1.chain_f01_left_marI visibility=on
marker create marker_name=.sliderActuator.idlerf1.sprocket_chain_f12_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_Brace.chain_f12_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerf1.sprocket_chain_f12_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerf1.chain_f12_right1 reference_marker=.sliderActuator.idlerf1.sprocket_chain_f12_right_mar  points_for_profile= &
0.646547, 0.000000, 0.046250, &
0.645381, 0.008861, 0.046250, &
0.641961, 0.017118, 0.046250, &
0.636520, 0.024209, 0.046250, &
0.629429, 0.029650, 0.046250, &
0.621172, 0.033070, 0.046250, &
0.612311, 0.034237, 0.046250, &
0.603449, 0.033070, 0.046250, &
0.595192, 0.029650, 0.046250, &
0.588101, 0.024209, 0.046250, &
0.582661, 0.017118, 0.046250, &
0.579240, 0.008861, 0.046250, &
0.578074, 0.000000, 0.046250, &
0.579240, -0.008861, 0.046250, &
0.582661, -0.017118, 0.046250, &
0.588101, -0.024209, 0.046250, &
0.595192, -0.029650, 0.046250, &
0.603449, -0.033070, 0.046250, &
0.612311, -0.034237, 0.046250, &
0.621172, -0.033070, 0.046250, &
0.629429, -0.029650, 0.046250, &
0.636520, -0.024209, 0.046250, &
0.641961, -0.017118, 0.046250, &
0.645381, -0.008861, 0.046250, &
0.646547, 0.000000, 0.046250 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerf1.sprocket_chain_f12_right_mar
entity attributes entity_name=.sliderActuator.idlerf1.chain_f12_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerf1.chain_f12_right1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.idlerf1 material_type = steel
entity attributes entity_name=.sliderActuator.idlerf1.chain_f01_left1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.idlerf1.chain_f12_right1 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_f01_parallel i_marker_name=.sliderActuator.idlerf1.sprocket_chain_f01_left_mar j_marker_name=.sliderActuator.SLM22_part21.sprocket_chain_f01_right_mar
constraint create joint revolute joint_name=.sliderActuator.chain_f01_left i_marker_name=.sliderActuator.idlerf1.chain_f01_left_marI j_marker_name=.sliderActuator.SLM11_CrankFF.chain_f01_left_marJ
part create rigid_body name_and_position part_name=.sliderActuator.idlerb1
part mod rigid_body mass_properties part_name=.sliderActuator.idlerb1 material_type = steel
entity attributes entity_name=.sliderActuator.idlerb1 visibility=on color=WHITE

marker create marker_name=.sliderActuator.idlerb1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.idlerb1.cm visibility=on
marker create marker_name=.sliderActuator.idlerb1.sprocket_chain_b01_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_CrankFF.chain_b01_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerb1.sprocket_chain_b01_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerb1.chain_b01_left1 reference_marker=.sliderActuator.idlerb1.sprocket_chain_b01_left_mar  points_for_profile= &
0.034237, 0.000000, -0.036250, &
0.033070, 0.008861, -0.036250, &
0.029650, 0.017118, -0.036250, &
0.024209, 0.024209, -0.036250, &
0.017118, 0.029650, -0.036250, &
0.008861, 0.033070, -0.036250, &
0.000000, 0.034237, -0.036250, &
-0.008861, 0.033070, -0.036250, &
-0.017118, 0.029650, -0.036250, &
-0.024209, 0.024209, -0.036250, &
-0.029650, 0.017118, -0.036250, &
-0.033070, 0.008861, -0.036250, &
-0.034237, 0.000000, -0.036250, &
-0.033070, -0.008861, -0.036250, &
-0.029650, -0.017118, -0.036250, &
-0.024209, -0.024209, -0.036250, &
-0.017118, -0.029650, -0.036250, &
-0.008861, -0.033070, -0.036250, &
-0.000000, -0.034237, -0.036250, &
0.008861, -0.033070, -0.036250, &
0.017118, -0.029650, -0.036250, &
0.024209, -0.024209, -0.036250, &
0.029650, -0.017118, -0.036250, &
0.033070, -0.008861, -0.036250, &
0.034237, 0.000000, -0.036250 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerb1.sprocket_chain_b01_left_mar
entity attributes entity_name=.sliderActuator.idlerb1.chain_b01_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerb1.chain_b01_left1 render=filled
marker create marker_name=.sliderActuator.idlerb1.chain_b01_left_marI location=0.377395, 0.166051, -0.036250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.idlerb1.chain_b01_left_marI visibility=on
marker create marker_name=.sliderActuator.idlerb1.sprocket_chain_b23_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_Brace.chain_b23_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerb1.sprocket_chain_b23_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerb1.chain_b23_right1 reference_marker=.sliderActuator.idlerb1.sprocket_chain_b23_right_mar  points_for_profile= &
0.646547, 0.000000, -0.052500, &
0.645381, 0.008861, -0.052500, &
0.641961, 0.017118, -0.052500, &
0.636520, 0.024209, -0.052500, &
0.629429, 0.029650, -0.052500, &
0.621172, 0.033070, -0.052500, &
0.612311, 0.034237, -0.052500, &
0.603449, 0.033070, -0.052500, &
0.595192, 0.029650, -0.052500, &
0.588101, 0.024209, -0.052500, &
0.582661, 0.017118, -0.052500, &
0.579240, 0.008861, -0.052500, &
0.578074, 0.000000, -0.052500, &
0.579240, -0.008861, -0.052500, &
0.582661, -0.017118, -0.052500, &
0.588101, -0.024209, -0.052500, &
0.595192, -0.029650, -0.052500, &
0.603449, -0.033070, -0.052500, &
0.612311, -0.034237, -0.052500, &
0.621172, -0.033070, -0.052500, &
0.629429, -0.029650, -0.052500, &
0.636520, -0.024209, -0.052500, &
0.641961, -0.017118, -0.052500, &
0.645381, -0.008861, -0.052500, &
0.646547, 0.000000, -0.052500 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerb1.sprocket_chain_b23_right_mar
entity attributes entity_name=.sliderActuator.idlerb1.chain_b23_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerb1.chain_b23_right1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.idlerb1 material_type = steel
entity attributes entity_name=.sliderActuator.idlerb1.chain_b01_left1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.idlerb1.chain_b23_right1 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_b01_parallel i_marker_name=.sliderActuator.idlerb1.sprocket_chain_b01_left_mar j_marker_name=.sliderActuator.SLM22_Brace.sprocket_chain_b01_right_mar
constraint create joint revolute joint_name=.sliderActuator.chain_b01_left i_marker_name=.sliderActuator.idlerb1.chain_b01_left_marI j_marker_name=.sliderActuator.SLM11_CrankFF.chain_b01_left_marJ
part create rigid_body name_and_position part_name=.sliderActuator.bal2
part mod rigid_body mass_properties part_name=.sliderActuator.bal2 material_type = steel
entity attributes entity_name=.sliderActuator.bal2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.bal2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.bal2.cm visibility=on
marker create marker_name=.sliderActuator.bal2.cynMar location=-0.183064, -0.080547, 0.000000 orientation=162.343309, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.cynMar visibility=on
marker create marker_name=.sliderActuator.bal2.bal2_bal1_marI location=-0.183064, -0.080547, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.bal2_bal1_marI visibility=on
marker create marker_name=.sliderActuator.bal2.bal2_link_marI location=-0.169417, -0.179611, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.bal2_link_marI visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal2.cyn3b reference_marker=.sliderActuator.bal2.cynMar  points_for_profile= &
0.000000, 0.037500, -0.040000, &
-0.012826, 0.035238, -0.040000, &
-0.024105, 0.028727, -0.040000, &
-0.032476, 0.018750, -0.040000, &
-0.036930, 0.006512, -0.040000, &
-0.036930, -0.006512, -0.040000, &
-0.032476, -0.018750, -0.040000, &
-0.024105, -0.028727, -0.040000, &
-0.012826, -0.035238, -0.040000, &
-0.000000, -0.037500, -0.040000, &
0.200000, -0.037500, -0.040000, &
0.212826, -0.035238, -0.040000, &
0.224105, -0.028727, -0.040000, &
0.232476, -0.018750, -0.040000, &
0.236930, -0.006512, -0.040000, &
0.236930, 0.006512, -0.040000, &
0.232476, 0.018750, -0.040000, &
0.224105, 0.028727, -0.040000, &
0.212826, 0.035238, -0.040000, &
0.200000, 0.037500, -0.040000, &
0.000000, 0.037500, -0.040000 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal2.cynMar
entity attributes entity_name=.sliderActuator.bal2.cyn3b type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal2.cyn3b render=filled
marker create marker_name=.sliderActuator.bal2.frontplateplatem1 location=-0.169417, -0.179611, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.frontplateplatem1 visibility=on
marker create marker_name=.sliderActuator.bal2.frontplateplatem2 location=-0.183064, -0.080547, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.frontplateplatem2 visibility=on
marker create marker_name=.sliderActuator.bal2.frontplateplatem3 location=-0.373642, -0.019884, 0.036875 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.frontplateplatem3 visibility=on
geom create shape plate plate=.sliderActuator.bal2.frontplate marker_name=.sliderActuator.bal2.frontplateplatem1, .sliderActuator.bal2.frontplateplatem2, .sliderActuator.bal2.frontplateplatem3 radius=0.018750 width=0.006250

entity attributes entity_name=.sliderActuator.bal2.frontplate type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.bal2.chain_f32_chain_pair_mar location=-0.373642, -0.019884, 0.000000 orientation=0.000000, 0.000000, -17.656691 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.chain_f32_chain_pair_mar visibility=on
marker create marker_name=.sliderActuator.bal2.chain_f32_left_marJ location=-0.373642, -0.019884, 0.052500 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.chain_f32_left_marJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal2.chain_f32_belt reference_marker=.sliderActuator.bal2.chain_f32_chain_pair_mar  points_for_profile= &
0.196737, -0.037500, 0.053125, &
0.197693, -0.035193, 0.053125, &
0.200000, -0.034237, 0.053125, &
0.202307, -0.035193, 0.053125, &
0.203263, -0.037500, 0.053125, &
0.206554, -0.037067, 0.053125, &
0.206880, -0.034591, 0.053125, &
0.208861, -0.033070, 0.053125, &
0.211337, -0.033396, 0.053125, &
0.212858, -0.035378, 0.053125, &
0.215924, -0.034108, 0.053125, &
0.215598, -0.031631, 0.053125, &
0.217118, -0.029650, 0.053125, &
0.219595, -0.029324, 0.053125, &
0.221576, -0.030844, 0.053125, &
0.224209, -0.028824, 0.053125, &
0.223253, -0.026517, 0.053125, &
0.224209, -0.024209, 0.053125, &
0.226517, -0.023253, 0.053125, &
0.228824, -0.024209, 0.053125, &
0.230844, -0.021576, 0.053125, &
0.229324, -0.019595, 0.053125, &
0.229650, -0.017118, 0.053125, &
0.231631, -0.015598, 0.053125, &
0.234108, -0.015924, 0.053125, &
0.235378, -0.012858, 0.053125, &
0.233396, -0.011337, 0.053125, &
0.233070, -0.008861, 0.053125, &
0.234591, -0.006880, 0.053125, &
0.237067, -0.006554, 0.053125, &
0.237500, -0.003263, 0.053125, &
0.235193, -0.002307, 0.053125, &
0.234237, 0.000000, 0.053125, &
0.235193, 0.002307, 0.053125, &
0.237500, 0.003263, 0.053125, &
0.237067, 0.006554, 0.053125, &
0.234591, 0.006880, 0.053125, &
0.233070, 0.008861, 0.053125, &
0.233396, 0.011337, 0.053125, &
0.235378, 0.012858, 0.053125, &
0.234108, 0.015924, 0.053125, &
0.231631, 0.015598, 0.053125, &
0.229650, 0.017118, 0.053125, &
0.229324, 0.019595, 0.053125, &
0.230844, 0.021576, 0.053125, &
0.228824, 0.024209, 0.053125, &
0.226517, 0.023253, 0.053125, &
0.224209, 0.024209, 0.053125, &
0.223253, 0.026517, 0.053125, &
0.224209, 0.028824, 0.053125, &
0.221576, 0.030844, 0.053125, &
0.219595, 0.029324, 0.053125, &
0.217118, 0.029650, 0.053125, &
0.215598, 0.031631, 0.053125, &
0.215924, 0.034108, 0.053125, &
0.212858, 0.035378, 0.053125, &
0.211337, 0.033396, 0.053125, &
0.208861, 0.033070, 0.053125, &
0.206880, 0.034591, 0.053125, &
0.206554, 0.037067, 0.053125, &
0.203263, 0.037500, 0.053125, &
0.202307, 0.035193, 0.053125, &
0.200000, 0.034237, 0.053125, &
0.197693, 0.035193, 0.053125, &
0.196737, 0.037500, 0.053125, &
0.193263, 0.037500, 0.053125, &
0.192307, 0.035193, 0.053125, &
0.190000, 0.034237, 0.053125, &
0.187693, 0.035193, 0.053125, &
0.186737, 0.037500, 0.053125, &
0.183263, 0.037500, 0.053125, &
0.182307, 0.035193, 0.053125, &
0.180000, 0.034237, 0.053125, &
0.177693, 0.035193, 0.053125, &
0.176737, 0.037500, 0.053125, &
0.173263, 0.037500, 0.053125, &
0.172307, 0.035193, 0.053125, &
0.170000, 0.034237, 0.053125, &
0.167693, 0.035193, 0.053125, &
0.166737, 0.037500, 0.053125, &
0.163263, 0.037500, 0.053125, &
0.162307, 0.035193, 0.053125, &
0.160000, 0.034237, 0.053125, &
0.157693, 0.035193, 0.053125, &
0.156737, 0.037500, 0.053125, &
0.153263, 0.037500, 0.053125, &
0.152307, 0.035193, 0.053125, &
0.150000, 0.034237, 0.053125, &
0.147693, 0.035193, 0.053125, &
0.146737, 0.037500, 0.053125, &
0.143263, 0.037500, 0.053125, &
0.142307, 0.035193, 0.053125, &
0.140000, 0.034237, 0.053125, &
0.137693, 0.035193, 0.053125, &
0.136737, 0.037500, 0.053125, &
0.133263, 0.037500, 0.053125, &
0.132307, 0.035193, 0.053125, &
0.130000, 0.034237, 0.053125, &
0.127693, 0.035193, 0.053125, &
0.126737, 0.037500, 0.053125, &
0.123263, 0.037500, 0.053125, &
0.122307, 0.035193, 0.053125, &
0.120000, 0.034237, 0.053125, &
0.117693, 0.035193, 0.053125, &
0.116737, 0.037500, 0.053125, &
0.113263, 0.037500, 0.053125, &
0.112307, 0.035193, 0.053125, &
0.110000, 0.034237, 0.053125, &
0.107693, 0.035193, 0.053125, &
0.106737, 0.037500, 0.053125, &
0.103263, 0.037500, 0.053125, &
0.102307, 0.035193, 0.053125, &
0.100000, 0.034237, 0.053125, &
0.097693, 0.035193, 0.053125, &
0.096737, 0.037500, 0.053125, &
0.093263, 0.037500, 0.053125, &
0.092307, 0.035193, 0.053125, &
0.090000, 0.034237, 0.053125, &
0.087693, 0.035193, 0.053125, &
0.086737, 0.037500, 0.053125, &
0.083263, 0.037500, 0.053125, &
0.082307, 0.035193, 0.053125, &
0.080000, 0.034237, 0.053125, &
0.077693, 0.035193, 0.053125, &
0.076737, 0.037500, 0.053125, &
0.073263, 0.037500, 0.053125, &
0.072307, 0.035193, 0.053125, &
0.070000, 0.034237, 0.053125, &
0.067693, 0.035193, 0.053125, &
0.066737, 0.037500, 0.053125, &
0.063263, 0.037500, 0.053125, &
0.062307, 0.035193, 0.053125, &
0.060000, 0.034237, 0.053125, &
0.057693, 0.035193, 0.053125, &
0.056737, 0.037500, 0.053125, &
0.053263, 0.037500, 0.053125, &
0.052307, 0.035193, 0.053125, &
0.050000, 0.034237, 0.053125, &
0.047693, 0.035193, 0.053125, &
0.046737, 0.037500, 0.053125, &
0.043263, 0.037500, 0.053125, &
0.042307, 0.035193, 0.053125, &
0.040000, 0.034237, 0.053125, &
0.037693, 0.035193, 0.053125, &
0.036737, 0.037500, 0.053125, &
0.033263, 0.037500, 0.053125, &
0.032307, 0.035193, 0.053125, &
0.030000, 0.034237, 0.053125, &
0.027693, 0.035193, 0.053125, &
0.026737, 0.037500, 0.053125, &
0.023263, 0.037500, 0.053125, &
0.022307, 0.035193, 0.053125, &
0.020000, 0.034237, 0.053125, &
0.017693, 0.035193, 0.053125, &
0.016737, 0.037500, 0.053125, &
0.013263, 0.037500, 0.053125, &
0.012307, 0.035193, 0.053125, &
0.010000, 0.034237, 0.053125, &
0.007693, 0.035193, 0.053125, &
0.006737, 0.037500, 0.053125, &
0.003263, 0.037500, 0.053125, &
0.002307, 0.035193, 0.053125, &
0.000000, 0.034237, 0.053125, &
-0.002307, 0.035193, 0.053125, &
-0.003263, 0.037500, 0.053125, &
-0.006554, 0.037067, 0.053125, &
-0.006880, 0.034591, 0.053125, &
-0.008861, 0.033070, 0.053125, &
-0.011337, 0.033396, 0.053125, &
-0.012858, 0.035378, 0.053125, &
-0.015924, 0.034108, 0.053125, &
-0.015598, 0.031631, 0.053125, &
-0.017118, 0.029650, 0.053125, &
-0.019595, 0.029324, 0.053125, &
-0.021576, 0.030844, 0.053125, &
-0.024209, 0.028824, 0.053125, &
-0.023253, 0.026517, 0.053125, &
-0.024209, 0.024209, 0.053125, &
-0.026517, 0.023253, 0.053125, &
-0.028824, 0.024209, 0.053125, &
-0.030844, 0.021576, 0.053125, &
-0.029324, 0.019595, 0.053125, &
-0.029650, 0.017118, 0.053125, &
-0.031631, 0.015598, 0.053125, &
-0.034108, 0.015924, 0.053125, &
-0.035378, 0.012858, 0.053125, &
-0.033396, 0.011337, 0.053125, &
-0.033070, 0.008861, 0.053125, &
-0.034591, 0.006880, 0.053125, &
-0.037067, 0.006554, 0.053125, &
-0.037500, 0.003263, 0.053125, &
-0.035193, 0.002307, 0.053125, &
-0.034237, 0.000000, 0.053125, &
-0.035193, -0.002307, 0.053125, &
-0.037500, -0.003263, 0.053125, &
-0.037067, -0.006554, 0.053125, &
-0.034591, -0.006880, 0.053125, &
-0.033070, -0.008861, 0.053125, &
-0.033396, -0.011337, 0.053125, &
-0.035378, -0.012858, 0.053125, &
-0.034108, -0.015924, 0.053125, &
-0.031631, -0.015598, 0.053125, &
-0.029650, -0.017118, 0.053125, &
-0.029324, -0.019595, 0.053125, &
-0.030844, -0.021576, 0.053125, &
-0.028824, -0.024209, 0.053125, &
-0.026517, -0.023253, 0.053125, &
-0.024209, -0.024209, 0.053125, &
-0.023253, -0.026517, 0.053125, &
-0.024209, -0.028824, 0.053125, &
-0.021576, -0.030844, 0.053125, &
-0.019595, -0.029324, 0.053125, &
-0.017118, -0.029650, 0.053125, &
-0.015598, -0.031631, 0.053125, &
-0.015924, -0.034108, 0.053125, &
-0.012858, -0.035378, 0.053125, &
-0.011337, -0.033396, 0.053125, &
-0.008861, -0.033070, 0.053125, &
-0.006880, -0.034591, 0.053125, &
-0.006554, -0.037067, 0.053125, &
-0.003263, -0.037500, 0.053125, &
-0.002307, -0.035193, 0.053125, &
0.000000, -0.034237, 0.053125, &
0.002307, -0.035193, 0.053125, &
0.003263, -0.037500, 0.053125, &
0.006737, -0.037500, 0.053125, &
0.007693, -0.035193, 0.053125, &
0.010000, -0.034237, 0.053125, &
0.012307, -0.035193, 0.053125, &
0.013263, -0.037500, 0.053125, &
0.016737, -0.037500, 0.053125, &
0.017693, -0.035193, 0.053125, &
0.020000, -0.034237, 0.053125, &
0.022307, -0.035193, 0.053125, &
0.023263, -0.037500, 0.053125, &
0.026737, -0.037500, 0.053125, &
0.027693, -0.035193, 0.053125, &
0.030000, -0.034237, 0.053125, &
0.032307, -0.035193, 0.053125, &
0.033263, -0.037500, 0.053125, &
0.036737, -0.037500, 0.053125, &
0.037693, -0.035193, 0.053125, &
0.040000, -0.034237, 0.053125, &
0.042307, -0.035193, 0.053125, &
0.043263, -0.037500, 0.053125, &
0.046737, -0.037500, 0.053125, &
0.047693, -0.035193, 0.053125, &
0.050000, -0.034237, 0.053125, &
0.052307, -0.035193, 0.053125, &
0.053263, -0.037500, 0.053125, &
0.056737, -0.037500, 0.053125, &
0.057693, -0.035193, 0.053125, &
0.060000, -0.034237, 0.053125, &
0.062307, -0.035193, 0.053125, &
0.063263, -0.037500, 0.053125, &
0.066737, -0.037500, 0.053125, &
0.067693, -0.035193, 0.053125, &
0.070000, -0.034237, 0.053125, &
0.072307, -0.035193, 0.053125, &
0.073263, -0.037500, 0.053125, &
0.076737, -0.037500, 0.053125, &
0.077693, -0.035193, 0.053125, &
0.080000, -0.034237, 0.053125, &
0.082307, -0.035193, 0.053125, &
0.083263, -0.037500, 0.053125, &
0.086737, -0.037500, 0.053125, &
0.087693, -0.035193, 0.053125, &
0.090000, -0.034237, 0.053125, &
0.092307, -0.035193, 0.053125, &
0.093263, -0.037500, 0.053125, &
0.096737, -0.037500, 0.053125, &
0.097693, -0.035193, 0.053125, &
0.100000, -0.034237, 0.053125, &
0.102307, -0.035193, 0.053125, &
0.103263, -0.037500, 0.053125, &
0.106737, -0.037500, 0.053125, &
0.107693, -0.035193, 0.053125, &
0.110000, -0.034237, 0.053125, &
0.112307, -0.035193, 0.053125, &
0.113263, -0.037500, 0.053125, &
0.116737, -0.037500, 0.053125, &
0.117693, -0.035193, 0.053125, &
0.120000, -0.034237, 0.053125, &
0.122307, -0.035193, 0.053125, &
0.123263, -0.037500, 0.053125, &
0.126737, -0.037500, 0.053125, &
0.127693, -0.035193, 0.053125, &
0.130000, -0.034237, 0.053125, &
0.132307, -0.035193, 0.053125, &
0.133263, -0.037500, 0.053125, &
0.136737, -0.037500, 0.053125, &
0.137693, -0.035193, 0.053125, &
0.140000, -0.034237, 0.053125, &
0.142307, -0.035193, 0.053125, &
0.143263, -0.037500, 0.053125, &
0.146737, -0.037500, 0.053125, &
0.147693, -0.035193, 0.053125, &
0.150000, -0.034237, 0.053125, &
0.152307, -0.035193, 0.053125, &
0.153263, -0.037500, 0.053125, &
0.156737, -0.037500, 0.053125, &
0.157693, -0.035193, 0.053125, &
0.160000, -0.034237, 0.053125, &
0.162307, -0.035193, 0.053125, &
0.163263, -0.037500, 0.053125, &
0.166737, -0.037500, 0.053125, &
0.167693, -0.035193, 0.053125, &
0.170000, -0.034237, 0.053125, &
0.172307, -0.035193, 0.053125, &
0.173263, -0.037500, 0.053125, &
0.176737, -0.037500, 0.053125, &
0.177693, -0.035193, 0.053125, &
0.180000, -0.034237, 0.053125, &
0.182307, -0.035193, 0.053125, &
0.183263, -0.037500, 0.053125, &
0.186737, -0.037500, 0.053125, &
0.187693, -0.035193, 0.053125, &
0.190000, -0.034237, 0.053125, &
0.192307, -0.035193, 0.053125, &
0.193263, -0.037500, 0.053125, &
0.190000, -0.038625, 0.053125, &
-0.000000, -0.038625, 0.053125, &
-0.013211, -0.036296, 0.053125, &
-0.024828, -0.029588, 0.053125, &
-0.033450, -0.019313, 0.053125, &
-0.038038, -0.006707, 0.053125, &
-0.038038, 0.006707, 0.053125, &
-0.033450, 0.019312, 0.053125, &
-0.024828, 0.029588, 0.053125, &
-0.013211, 0.036296, 0.053125, &
0.000000, 0.038625, 0.053125, &
0.200000, 0.038625, 0.053125, &
0.213140, 0.036321, 0.053125, &
0.224713, 0.029685, 0.053125, &
0.233337, 0.019507, 0.053125, &
0.237985, 0.007002, 0.053125, &
0.238101, -0.006338, 0.053125, &
0.233673, -0.018922, 0.053125, &
0.225227, -0.029249, 0.053125, &
0.213772, -0.036086, 0.053125, &
0.200674, -0.038619, 0.053125, &
0.196737, -0.037500, 0.053125 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.bal2.chain_f32_chain_pair_mar
entity attributes entity_name=.sliderActuator.bal2.chain_f32_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal2.chain_f32_belt render=filled
marker create marker_name=.sliderActuator.bal2.bal3_bal2_marJ location=-0.373642, -0.019884, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.bal3_bal2_marJ visibility=on
marker create marker_name=.sliderActuator.bal2.chain_b34_chain_pair_mar location=-0.373642, -0.019884, 0.000000 orientation=0.000000, 0.000000, -17.656691 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal2.chain_b34_chain_pair_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal2.chain_b34_belt reference_marker=.sliderActuator.bal2.chain_b34_chain_pair_mar  points_for_profile= &
0.196737, -0.037500, -0.058125, &
0.197693, -0.035193, -0.058125, &
0.200000, -0.034237, -0.058125, &
0.202307, -0.035193, -0.058125, &
0.203263, -0.037500, -0.058125, &
0.206554, -0.037067, -0.058125, &
0.206880, -0.034591, -0.058125, &
0.208861, -0.033070, -0.058125, &
0.211337, -0.033396, -0.058125, &
0.212858, -0.035378, -0.058125, &
0.215924, -0.034108, -0.058125, &
0.215598, -0.031631, -0.058125, &
0.217118, -0.029650, -0.058125, &
0.219595, -0.029324, -0.058125, &
0.221576, -0.030844, -0.058125, &
0.224209, -0.028824, -0.058125, &
0.223253, -0.026517, -0.058125, &
0.224209, -0.024209, -0.058125, &
0.226517, -0.023253, -0.058125, &
0.228824, -0.024209, -0.058125, &
0.230844, -0.021576, -0.058125, &
0.229324, -0.019595, -0.058125, &
0.229650, -0.017118, -0.058125, &
0.231631, -0.015598, -0.058125, &
0.234108, -0.015924, -0.058125, &
0.235378, -0.012858, -0.058125, &
0.233396, -0.011337, -0.058125, &
0.233070, -0.008861, -0.058125, &
0.234591, -0.006880, -0.058125, &
0.237067, -0.006554, -0.058125, &
0.237500, -0.003263, -0.058125, &
0.235193, -0.002307, -0.058125, &
0.234237, 0.000000, -0.058125, &
0.235193, 0.002307, -0.058125, &
0.237500, 0.003263, -0.058125, &
0.237067, 0.006554, -0.058125, &
0.234591, 0.006880, -0.058125, &
0.233070, 0.008861, -0.058125, &
0.233396, 0.011337, -0.058125, &
0.235378, 0.012858, -0.058125, &
0.234108, 0.015924, -0.058125, &
0.231631, 0.015598, -0.058125, &
0.229650, 0.017118, -0.058125, &
0.229324, 0.019595, -0.058125, &
0.230844, 0.021576, -0.058125, &
0.228824, 0.024209, -0.058125, &
0.226517, 0.023253, -0.058125, &
0.224209, 0.024209, -0.058125, &
0.223253, 0.026517, -0.058125, &
0.224209, 0.028824, -0.058125, &
0.221576, 0.030844, -0.058125, &
0.219595, 0.029324, -0.058125, &
0.217118, 0.029650, -0.058125, &
0.215598, 0.031631, -0.058125, &
0.215924, 0.034108, -0.058125, &
0.212858, 0.035378, -0.058125, &
0.211337, 0.033396, -0.058125, &
0.208861, 0.033070, -0.058125, &
0.206880, 0.034591, -0.058125, &
0.206554, 0.037067, -0.058125, &
0.203263, 0.037500, -0.058125, &
0.202307, 0.035193, -0.058125, &
0.200000, 0.034237, -0.058125, &
0.197693, 0.035193, -0.058125, &
0.196737, 0.037500, -0.058125, &
0.193263, 0.037500, -0.058125, &
0.192307, 0.035193, -0.058125, &
0.190000, 0.034237, -0.058125, &
0.187693, 0.035193, -0.058125, &
0.186737, 0.037500, -0.058125, &
0.183263, 0.037500, -0.058125, &
0.182307, 0.035193, -0.058125, &
0.180000, 0.034237, -0.058125, &
0.177693, 0.035193, -0.058125, &
0.176737, 0.037500, -0.058125, &
0.173263, 0.037500, -0.058125, &
0.172307, 0.035193, -0.058125, &
0.170000, 0.034237, -0.058125, &
0.167693, 0.035193, -0.058125, &
0.166737, 0.037500, -0.058125, &
0.163263, 0.037500, -0.058125, &
0.162307, 0.035193, -0.058125, &
0.160000, 0.034237, -0.058125, &
0.157693, 0.035193, -0.058125, &
0.156737, 0.037500, -0.058125, &
0.153263, 0.037500, -0.058125, &
0.152307, 0.035193, -0.058125, &
0.150000, 0.034237, -0.058125, &
0.147693, 0.035193, -0.058125, &
0.146737, 0.037500, -0.058125, &
0.143263, 0.037500, -0.058125, &
0.142307, 0.035193, -0.058125, &
0.140000, 0.034237, -0.058125, &
0.137693, 0.035193, -0.058125, &
0.136737, 0.037500, -0.058125, &
0.133263, 0.037500, -0.058125, &
0.132307, 0.035193, -0.058125, &
0.130000, 0.034237, -0.058125, &
0.127693, 0.035193, -0.058125, &
0.126737, 0.037500, -0.058125, &
0.123263, 0.037500, -0.058125, &
0.122307, 0.035193, -0.058125, &
0.120000, 0.034237, -0.058125, &
0.117693, 0.035193, -0.058125, &
0.116737, 0.037500, -0.058125, &
0.113263, 0.037500, -0.058125, &
0.112307, 0.035193, -0.058125, &
0.110000, 0.034237, -0.058125, &
0.107693, 0.035193, -0.058125, &
0.106737, 0.037500, -0.058125, &
0.103263, 0.037500, -0.058125, &
0.102307, 0.035193, -0.058125, &
0.100000, 0.034237, -0.058125, &
0.097693, 0.035193, -0.058125, &
0.096737, 0.037500, -0.058125, &
0.093263, 0.037500, -0.058125, &
0.092307, 0.035193, -0.058125, &
0.090000, 0.034237, -0.058125, &
0.087693, 0.035193, -0.058125, &
0.086737, 0.037500, -0.058125, &
0.083263, 0.037500, -0.058125, &
0.082307, 0.035193, -0.058125, &
0.080000, 0.034237, -0.058125, &
0.077693, 0.035193, -0.058125, &
0.076737, 0.037500, -0.058125, &
0.073263, 0.037500, -0.058125, &
0.072307, 0.035193, -0.058125, &
0.070000, 0.034237, -0.058125, &
0.067693, 0.035193, -0.058125, &
0.066737, 0.037500, -0.058125, &
0.063263, 0.037500, -0.058125, &
0.062307, 0.035193, -0.058125, &
0.060000, 0.034237, -0.058125, &
0.057693, 0.035193, -0.058125, &
0.056737, 0.037500, -0.058125, &
0.053263, 0.037500, -0.058125, &
0.052307, 0.035193, -0.058125, &
0.050000, 0.034237, -0.058125, &
0.047693, 0.035193, -0.058125, &
0.046737, 0.037500, -0.058125, &
0.043263, 0.037500, -0.058125, &
0.042307, 0.035193, -0.058125, &
0.040000, 0.034237, -0.058125, &
0.037693, 0.035193, -0.058125, &
0.036737, 0.037500, -0.058125, &
0.033263, 0.037500, -0.058125, &
0.032307, 0.035193, -0.058125, &
0.030000, 0.034237, -0.058125, &
0.027693, 0.035193, -0.058125, &
0.026737, 0.037500, -0.058125, &
0.023263, 0.037500, -0.058125, &
0.022307, 0.035193, -0.058125, &
0.020000, 0.034237, -0.058125, &
0.017693, 0.035193, -0.058125, &
0.016737, 0.037500, -0.058125, &
0.013263, 0.037500, -0.058125, &
0.012307, 0.035193, -0.058125, &
0.010000, 0.034237, -0.058125, &
0.007693, 0.035193, -0.058125, &
0.006737, 0.037500, -0.058125, &
0.003263, 0.037500, -0.058125, &
0.002307, 0.035193, -0.058125, &
0.000000, 0.034237, -0.058125, &
-0.002307, 0.035193, -0.058125, &
-0.003263, 0.037500, -0.058125, &
-0.006554, 0.037067, -0.058125, &
-0.006880, 0.034591, -0.058125, &
-0.008861, 0.033070, -0.058125, &
-0.011337, 0.033396, -0.058125, &
-0.012858, 0.035378, -0.058125, &
-0.015924, 0.034108, -0.058125, &
-0.015598, 0.031631, -0.058125, &
-0.017118, 0.029650, -0.058125, &
-0.019595, 0.029324, -0.058125, &
-0.021576, 0.030844, -0.058125, &
-0.024209, 0.028824, -0.058125, &
-0.023253, 0.026517, -0.058125, &
-0.024209, 0.024209, -0.058125, &
-0.026517, 0.023253, -0.058125, &
-0.028824, 0.024209, -0.058125, &
-0.030844, 0.021576, -0.058125, &
-0.029324, 0.019595, -0.058125, &
-0.029650, 0.017118, -0.058125, &
-0.031631, 0.015598, -0.058125, &
-0.034108, 0.015924, -0.058125, &
-0.035378, 0.012858, -0.058125, &
-0.033396, 0.011337, -0.058125, &
-0.033070, 0.008861, -0.058125, &
-0.034591, 0.006880, -0.058125, &
-0.037067, 0.006554, -0.058125, &
-0.037500, 0.003263, -0.058125, &
-0.035193, 0.002307, -0.058125, &
-0.034237, 0.000000, -0.058125, &
-0.035193, -0.002307, -0.058125, &
-0.037500, -0.003263, -0.058125, &
-0.037067, -0.006554, -0.058125, &
-0.034591, -0.006880, -0.058125, &
-0.033070, -0.008861, -0.058125, &
-0.033396, -0.011337, -0.058125, &
-0.035378, -0.012858, -0.058125, &
-0.034108, -0.015924, -0.058125, &
-0.031631, -0.015598, -0.058125, &
-0.029650, -0.017118, -0.058125, &
-0.029324, -0.019595, -0.058125, &
-0.030844, -0.021576, -0.058125, &
-0.028824, -0.024209, -0.058125, &
-0.026517, -0.023253, -0.058125, &
-0.024209, -0.024209, -0.058125, &
-0.023253, -0.026517, -0.058125, &
-0.024209, -0.028824, -0.058125, &
-0.021576, -0.030844, -0.058125, &
-0.019595, -0.029324, -0.058125, &
-0.017118, -0.029650, -0.058125, &
-0.015598, -0.031631, -0.058125, &
-0.015924, -0.034108, -0.058125, &
-0.012858, -0.035378, -0.058125, &
-0.011337, -0.033396, -0.058125, &
-0.008861, -0.033070, -0.058125, &
-0.006880, -0.034591, -0.058125, &
-0.006554, -0.037067, -0.058125, &
-0.003263, -0.037500, -0.058125, &
-0.002307, -0.035193, -0.058125, &
0.000000, -0.034237, -0.058125, &
0.002307, -0.035193, -0.058125, &
0.003263, -0.037500, -0.058125, &
0.006737, -0.037500, -0.058125, &
0.007693, -0.035193, -0.058125, &
0.010000, -0.034237, -0.058125, &
0.012307, -0.035193, -0.058125, &
0.013263, -0.037500, -0.058125, &
0.016737, -0.037500, -0.058125, &
0.017693, -0.035193, -0.058125, &
0.020000, -0.034237, -0.058125, &
0.022307, -0.035193, -0.058125, &
0.023263, -0.037500, -0.058125, &
0.026737, -0.037500, -0.058125, &
0.027693, -0.035193, -0.058125, &
0.030000, -0.034237, -0.058125, &
0.032307, -0.035193, -0.058125, &
0.033263, -0.037500, -0.058125, &
0.036737, -0.037500, -0.058125, &
0.037693, -0.035193, -0.058125, &
0.040000, -0.034237, -0.058125, &
0.042307, -0.035193, -0.058125, &
0.043263, -0.037500, -0.058125, &
0.046737, -0.037500, -0.058125, &
0.047693, -0.035193, -0.058125, &
0.050000, -0.034237, -0.058125, &
0.052307, -0.035193, -0.058125, &
0.053263, -0.037500, -0.058125, &
0.056737, -0.037500, -0.058125, &
0.057693, -0.035193, -0.058125, &
0.060000, -0.034237, -0.058125, &
0.062307, -0.035193, -0.058125, &
0.063263, -0.037500, -0.058125, &
0.066737, -0.037500, -0.058125, &
0.067693, -0.035193, -0.058125, &
0.070000, -0.034237, -0.058125, &
0.072307, -0.035193, -0.058125, &
0.073263, -0.037500, -0.058125, &
0.076737, -0.037500, -0.058125, &
0.077693, -0.035193, -0.058125, &
0.080000, -0.034237, -0.058125, &
0.082307, -0.035193, -0.058125, &
0.083263, -0.037500, -0.058125, &
0.086737, -0.037500, -0.058125, &
0.087693, -0.035193, -0.058125, &
0.090000, -0.034237, -0.058125, &
0.092307, -0.035193, -0.058125, &
0.093263, -0.037500, -0.058125, &
0.096737, -0.037500, -0.058125, &
0.097693, -0.035193, -0.058125, &
0.100000, -0.034237, -0.058125, &
0.102307, -0.035193, -0.058125, &
0.103263, -0.037500, -0.058125, &
0.106737, -0.037500, -0.058125, &
0.107693, -0.035193, -0.058125, &
0.110000, -0.034237, -0.058125, &
0.112307, -0.035193, -0.058125, &
0.113263, -0.037500, -0.058125, &
0.116737, -0.037500, -0.058125, &
0.117693, -0.035193, -0.058125, &
0.120000, -0.034237, -0.058125, &
0.122307, -0.035193, -0.058125, &
0.123263, -0.037500, -0.058125, &
0.126737, -0.037500, -0.058125, &
0.127693, -0.035193, -0.058125, &
0.130000, -0.034237, -0.058125, &
0.132307, -0.035193, -0.058125, &
0.133263, -0.037500, -0.058125, &
0.136737, -0.037500, -0.058125, &
0.137693, -0.035193, -0.058125, &
0.140000, -0.034237, -0.058125, &
0.142307, -0.035193, -0.058125, &
0.143263, -0.037500, -0.058125, &
0.146737, -0.037500, -0.058125, &
0.147693, -0.035193, -0.058125, &
0.150000, -0.034237, -0.058125, &
0.152307, -0.035193, -0.058125, &
0.153263, -0.037500, -0.058125, &
0.156737, -0.037500, -0.058125, &
0.157693, -0.035193, -0.058125, &
0.160000, -0.034237, -0.058125, &
0.162307, -0.035193, -0.058125, &
0.163263, -0.037500, -0.058125, &
0.166737, -0.037500, -0.058125, &
0.167693, -0.035193, -0.058125, &
0.170000, -0.034237, -0.058125, &
0.172307, -0.035193, -0.058125, &
0.173263, -0.037500, -0.058125, &
0.176737, -0.037500, -0.058125, &
0.177693, -0.035193, -0.058125, &
0.180000, -0.034237, -0.058125, &
0.182307, -0.035193, -0.058125, &
0.183263, -0.037500, -0.058125, &
0.186737, -0.037500, -0.058125, &
0.187693, -0.035193, -0.058125, &
0.190000, -0.034237, -0.058125, &
0.192307, -0.035193, -0.058125, &
0.193263, -0.037500, -0.058125, &
0.190000, -0.038625, -0.058125, &
-0.000000, -0.038625, -0.058125, &
-0.013211, -0.036296, -0.058125, &
-0.024828, -0.029588, -0.058125, &
-0.033450, -0.019313, -0.058125, &
-0.038038, -0.006707, -0.058125, &
-0.038038, 0.006707, -0.058125, &
-0.033450, 0.019312, -0.058125, &
-0.024828, 0.029588, -0.058125, &
-0.013211, 0.036296, -0.058125, &
0.000000, 0.038625, -0.058125, &
0.200000, 0.038625, -0.058125, &
0.213140, 0.036321, -0.058125, &
0.224713, 0.029685, -0.058125, &
0.233337, 0.019507, -0.058125, &
0.237985, 0.007002, -0.058125, &
0.238101, -0.006338, -0.058125, &
0.233673, -0.018922, -0.058125, &
0.225227, -0.029249, -0.058125, &
0.213772, -0.036086, -0.058125, &
0.200674, -0.038619, -0.058125, &
0.196737, -0.037500, -0.058125 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.bal2.chain_b34_chain_pair_mar
entity attributes entity_name=.sliderActuator.bal2.chain_b34_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal2.chain_b34_belt render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.bal2 material_type = steel
entity attributes entity_name=.sliderActuator.bal2.cyn3b visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal2.frontplate visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal2.chain_f32_belt visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal2.chain_b34_belt visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.bal2_bal1 i_marker_name=.sliderActuator.bal2.bal2_bal1_marI j_marker_name=.sliderActuator.SLM11_Brace.bal2_bal1_marJ
part create rigid_body name_and_position part_name=.sliderActuator.bal_link_2_1
part mod rigid_body mass_properties part_name=.sliderActuator.bal_link_2_1 material_type = steel
entity attributes entity_name=.sliderActuator.bal_link_2_1 visibility=on color=WHITE

marker create marker_name=.sliderActuator.bal_link_2_1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.bal_link_2_1.cm visibility=on
marker create marker_name=.sliderActuator.bal_link_2_1.bal_link_2_1_endI location=0.013646, -0.099065, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_endI visibility=on
marker create marker_name=.sliderActuator.bal_link_2_1.bal_link_2_1_endJ location=-0.169417, -0.179611, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn1 reference_marker=.sliderActuator.bal_link_2_1.bal_link_2_1_endI  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal_link_2_1.bal_link_2_1_endI
entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn2 reference_marker=.sliderActuator.bal_link_2_1.bal_link_2_1_endJ  points_for_profile= &
0.007500, 0.000000, -0.003125, &
0.006290, 0.004085, -0.003125, &
0.003051, 0.006852, -0.003125, &
-0.001173, 0.007408, -0.003125, &
-0.005018, 0.005574, -0.003125, &
-0.007244, 0.001941, -0.003125, &
-0.007133, -0.002318, -0.003125, &
-0.004720, -0.005829, -0.003125, &
-0.000784, -0.007459, -0.003125, &
0.003405, -0.006683, -0.003125, &
0.006495, -0.003750, -0.003125, &
0.007500, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal_link_2_1.bal_link_2_1_endJ
entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link width=0.009000 depth=0.005000 i_marker=.sliderActuator.bal_link_2_1.bal_link_2_1_endI j_marker=.sliderActuator.bal_link_2_1.bal_link_2_1_endJ

geometry create shape csg csg_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_csg1 base_object=.sliderActuator.bal_link_2_1.bal_link_2_1_link object=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_csg2 base_object=.sliderActuator.bal_link_2_1.bal_link_2_1_link_csg1 object=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.bal_link_2_1.bal2_part21_marI location=0.013646, -0.099065, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal_link_2_1.bal2_part21_marI visibility=on
marker create marker_name=.sliderActuator.bal_link_2_1.bal2_link_marJ location=-0.169417, -0.179611, 0.049375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal_link_2_1.bal2_link_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.bal_link_2_1 material_type = steel
entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal_link_2_1.bal_link_2_1_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.bal2_part21 i_marker_name=.sliderActuator.bal_link_2_1.bal2_part21_marI j_marker_name=.sliderActuator.SLM11_part21.bal2_part21_marJ
constraint create joint revolute joint_name=.sliderActuator.bal2_link i_marker_name=.sliderActuator.bal2.bal2_link_marI j_marker_name=.sliderActuator.bal_link_2_1.bal2_link_marJ
part create rigid_body name_and_position part_name=.sliderActuator.idlerf2
part mod rigid_body mass_properties part_name=.sliderActuator.idlerf2 material_type = steel
entity attributes entity_name=.sliderActuator.idlerf2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.idlerf2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.idlerf2.cm visibility=on
marker create marker_name=.sliderActuator.idlerf2.sprocket_chain_f12_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_Brace.chain_f12_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerf2.sprocket_chain_f12_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerf2.chain_f12_left1 reference_marker=.sliderActuator.idlerf2.sprocket_chain_f12_left_mar  points_for_profile= &
0.034237, 0.000000, 0.046250, &
0.033070, 0.008861, 0.046250, &
0.029650, 0.017118, 0.046250, &
0.024209, 0.024209, 0.046250, &
0.017118, 0.029650, 0.046250, &
0.008861, 0.033070, 0.046250, &
0.000000, 0.034237, 0.046250, &
-0.008861, 0.033070, 0.046250, &
-0.017118, 0.029650, 0.046250, &
-0.024209, 0.024209, 0.046250, &
-0.029650, 0.017118, 0.046250, &
-0.033070, 0.008861, 0.046250, &
-0.034237, 0.000000, 0.046250, &
-0.033070, -0.008861, 0.046250, &
-0.029650, -0.017118, 0.046250, &
-0.024209, -0.024209, 0.046250, &
-0.017118, -0.029650, 0.046250, &
-0.008861, -0.033070, 0.046250, &
-0.000000, -0.034237, 0.046250, &
0.008861, -0.033070, 0.046250, &
0.017118, -0.029650, 0.046250, &
0.024209, -0.024209, 0.046250, &
0.029650, -0.017118, 0.046250, &
0.033070, -0.008861, 0.046250, &
0.034237, 0.000000, 0.046250 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerf2.sprocket_chain_f12_left_mar
entity attributes entity_name=.sliderActuator.idlerf2.chain_f12_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerf2.chain_f12_left1 render=filled
marker create marker_name=.sliderActuator.idlerf2.chain_f12_left_marI location=-0.183064, -0.080547, 0.046250 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.idlerf2.chain_f12_left_marI visibility=on
marker create marker_name=.sliderActuator.idlerf2.sprocket_chain_f32_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.bal2.chain_f32_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerf2.sprocket_chain_f32_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerf2.chain_f32_right1 reference_marker=.sliderActuator.idlerf2.sprocket_chain_f32_right_mar  points_for_profile= &
0.234237, 0.000000, 0.052500, &
0.233070, 0.008861, 0.052500, &
0.229650, 0.017118, 0.052500, &
0.224209, 0.024209, 0.052500, &
0.217118, 0.029650, 0.052500, &
0.208861, 0.033070, 0.052500, &
0.200000, 0.034237, 0.052500, &
0.191139, 0.033070, 0.052500, &
0.182882, 0.029650, 0.052500, &
0.175791, 0.024209, 0.052500, &
0.170350, 0.017118, 0.052500, &
0.166930, 0.008861, 0.052500, &
0.165763, 0.000000, 0.052500, &
0.166930, -0.008861, 0.052500, &
0.170350, -0.017118, 0.052500, &
0.175791, -0.024209, 0.052500, &
0.182882, -0.029650, 0.052500, &
0.191139, -0.033070, 0.052500, &
0.200000, -0.034237, 0.052500, &
0.208861, -0.033070, 0.052500, &
0.217118, -0.029650, 0.052500, &
0.224209, -0.024209, 0.052500, &
0.229650, -0.017118, 0.052500, &
0.233070, -0.008861, 0.052500, &
0.234237, 0.000000, 0.052500 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerf2.sprocket_chain_f32_right_mar
entity attributes entity_name=.sliderActuator.idlerf2.chain_f32_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerf2.chain_f32_right1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.idlerf2 material_type = steel
entity attributes entity_name=.sliderActuator.idlerf2.chain_f12_left1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.idlerf2.chain_f32_right1 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_f12_parallel i_marker_name=.sliderActuator.idlerf2.sprocket_chain_f12_left_mar j_marker_name=.sliderActuator.idlerf1.sprocket_chain_f12_right_mar
constraint create joint revolute joint_name=.sliderActuator.chain_f12_left i_marker_name=.sliderActuator.idlerf2.chain_f12_left_marI j_marker_name=.sliderActuator.SLM11_Brace.chain_f12_left_marJ
part create rigid_body name_and_position part_name=.sliderActuator.idlerb2
part mod rigid_body mass_properties part_name=.sliderActuator.idlerb2 material_type = steel
entity attributes entity_name=.sliderActuator.idlerb2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.idlerb2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.idlerb2.cm visibility=on
marker create marker_name=.sliderActuator.idlerb2.sprocket_chain_b23_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM11_Brace.chain_b23_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerb2.sprocket_chain_b23_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerb2.chain_b23_left1 reference_marker=.sliderActuator.idlerb2.sprocket_chain_b23_left_mar  points_for_profile= &
0.034237, 0.000000, -0.052500, &
0.033070, 0.008861, -0.052500, &
0.029650, 0.017118, -0.052500, &
0.024209, 0.024209, -0.052500, &
0.017118, 0.029650, -0.052500, &
0.008861, 0.033070, -0.052500, &
0.000000, 0.034237, -0.052500, &
-0.008861, 0.033070, -0.052500, &
-0.017118, 0.029650, -0.052500, &
-0.024209, 0.024209, -0.052500, &
-0.029650, 0.017118, -0.052500, &
-0.033070, 0.008861, -0.052500, &
-0.034237, 0.000000, -0.052500, &
-0.033070, -0.008861, -0.052500, &
-0.029650, -0.017118, -0.052500, &
-0.024209, -0.024209, -0.052500, &
-0.017118, -0.029650, -0.052500, &
-0.008861, -0.033070, -0.052500, &
-0.000000, -0.034237, -0.052500, &
0.008861, -0.033070, -0.052500, &
0.017118, -0.029650, -0.052500, &
0.024209, -0.024209, -0.052500, &
0.029650, -0.017118, -0.052500, &
0.033070, -0.008861, -0.052500, &
0.034237, 0.000000, -0.052500 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerb2.sprocket_chain_b23_left_mar
entity attributes entity_name=.sliderActuator.idlerb2.chain_b23_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerb2.chain_b23_left1 render=filled
marker create marker_name=.sliderActuator.idlerb2.chain_b23_left_marI location=-0.183064, -0.080547, -0.052500 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.idlerb2.chain_b23_left_marI visibility=on
marker create marker_name=.sliderActuator.idlerb2.sprocket_chain_b34_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.bal2.chain_b34_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerb2.sprocket_chain_b34_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerb2.chain_b34_right1 reference_marker=.sliderActuator.idlerb2.sprocket_chain_b34_right_mar  points_for_profile= &
0.234237, 0.000000, -0.058750, &
0.233070, 0.008861, -0.058750, &
0.229650, 0.017118, -0.058750, &
0.224209, 0.024209, -0.058750, &
0.217118, 0.029650, -0.058750, &
0.208861, 0.033070, -0.058750, &
0.200000, 0.034237, -0.058750, &
0.191139, 0.033070, -0.058750, &
0.182882, 0.029650, -0.058750, &
0.175791, 0.024209, -0.058750, &
0.170350, 0.017118, -0.058750, &
0.166930, 0.008861, -0.058750, &
0.165763, 0.000000, -0.058750, &
0.166930, -0.008861, -0.058750, &
0.170350, -0.017118, -0.058750, &
0.175791, -0.024209, -0.058750, &
0.182882, -0.029650, -0.058750, &
0.191139, -0.033070, -0.058750, &
0.200000, -0.034237, -0.058750, &
0.208861, -0.033070, -0.058750, &
0.217118, -0.029650, -0.058750, &
0.224209, -0.024209, -0.058750, &
0.229650, -0.017118, -0.058750, &
0.233070, -0.008861, -0.058750, &
0.234237, 0.000000, -0.058750 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerb2.sprocket_chain_b34_right_mar
entity attributes entity_name=.sliderActuator.idlerb2.chain_b34_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerb2.chain_b34_right1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.idlerb2 material_type = steel
entity attributes entity_name=.sliderActuator.idlerb2.chain_b23_left1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.idlerb2.chain_b34_right1 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_b23_parallel i_marker_name=.sliderActuator.idlerb2.sprocket_chain_b23_left_mar j_marker_name=.sliderActuator.idlerb1.sprocket_chain_b23_right_mar
constraint create joint revolute joint_name=.sliderActuator.chain_b23_left i_marker_name=.sliderActuator.idlerb2.chain_b23_left_marI j_marker_name=.sliderActuator.SLM11_Brace.chain_b23_left_marJ
part create rigid_body name_and_position part_name=.sliderActuator.bal3
part mod rigid_body mass_properties part_name=.sliderActuator.bal3 material_type = steel
entity attributes entity_name=.sliderActuator.bal3 visibility=on color=WHITE

marker create marker_name=.sliderActuator.bal3.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.bal3.cm visibility=on
marker create marker_name=.sliderActuator.bal3.linkF_endI location=-0.486165, -0.061580, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.linkF_endI visibility=on
marker create marker_name=.sliderActuator.bal3.linkF_endJ location=-0.373642, -0.019884, 0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.linkF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.linkF_link_cyn1 reference_marker=.sliderActuator.bal3.linkF_endI  points_for_profile= &
0.030000, 0.000000, -0.003125, &
0.025160, 0.016339, -0.003125, &
0.012202, 0.027406, -0.003125, &
-0.004693, 0.029631, -0.003125, &
-0.020074, 0.022294, -0.003125, &
-0.028978, 0.007765, -0.003125, &
-0.028532, -0.009271, -0.003125, &
-0.018880, -0.023314, -0.003125, &
-0.003136, -0.029836, -0.003125, &
0.013620, -0.026730, -0.003125, &
0.025981, -0.015000, -0.003125, &
0.030000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal3.linkF_endI
entity attributes entity_name=.sliderActuator.bal3.linkF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.linkF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.linkF_link_cyn2 reference_marker=.sliderActuator.bal3.linkF_endJ  points_for_profile= &
0.030000, 0.000000, -0.003125, &
0.025160, 0.016339, -0.003125, &
0.012202, 0.027406, -0.003125, &
-0.004693, 0.029631, -0.003125, &
-0.020074, 0.022294, -0.003125, &
-0.028978, 0.007765, -0.003125, &
-0.028532, -0.009271, -0.003125, &
-0.018880, -0.023314, -0.003125, &
-0.003136, -0.029836, -0.003125, &
0.013620, -0.026730, -0.003125, &
0.025981, -0.015000, -0.003125, &
0.030000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal3.linkF_endJ
entity attributes entity_name=.sliderActuator.bal3.linkF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.linkF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.bal3.linkF_link width=0.036000 depth=0.005000 i_marker=.sliderActuator.bal3.linkF_endI j_marker=.sliderActuator.bal3.linkF_endJ

geometry create shape csg csg_name=.sliderActuator.bal3.linkF_link_csg1 base_object=.sliderActuator.bal3.linkF_link object=.sliderActuator.bal3.linkF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.bal3.linkF_link_csg2 base_object=.sliderActuator.bal3.linkF_link_csg1 object=.sliderActuator.bal3.linkF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.bal3.linkF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.bal3.linkB_endI location=-0.486165, -0.061580, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.linkB_endI visibility=on
marker create marker_name=.sliderActuator.bal3.linkB_endJ location=-0.373642, -0.019884, -0.043125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.linkB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.linkB_link_cyn1 reference_marker=.sliderActuator.bal3.linkB_endI  points_for_profile= &
0.030000, 0.000000, -0.003125, &
0.025160, 0.016339, -0.003125, &
0.012202, 0.027406, -0.003125, &
-0.004693, 0.029631, -0.003125, &
-0.020074, 0.022294, -0.003125, &
-0.028978, 0.007765, -0.003125, &
-0.028532, -0.009271, -0.003125, &
-0.018880, -0.023314, -0.003125, &
-0.003136, -0.029836, -0.003125, &
0.013620, -0.026730, -0.003125, &
0.025981, -0.015000, -0.003125, &
0.030000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal3.linkB_endI
entity attributes entity_name=.sliderActuator.bal3.linkB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.linkB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.linkB_link_cyn2 reference_marker=.sliderActuator.bal3.linkB_endJ  points_for_profile= &
0.030000, 0.000000, -0.003125, &
0.025160, 0.016339, -0.003125, &
0.012202, 0.027406, -0.003125, &
-0.004693, 0.029631, -0.003125, &
-0.020074, 0.022294, -0.003125, &
-0.028978, 0.007765, -0.003125, &
-0.028532, -0.009271, -0.003125, &
-0.018880, -0.023314, -0.003125, &
-0.003136, -0.029836, -0.003125, &
0.013620, -0.026730, -0.003125, &
0.025981, -0.015000, -0.003125, &
0.030000, 0.000000, -0.003125 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal3.linkB_endJ
entity attributes entity_name=.sliderActuator.bal3.linkB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.linkB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.bal3.linkB_link width=0.036000 depth=0.005000 i_marker=.sliderActuator.bal3.linkB_endI j_marker=.sliderActuator.bal3.linkB_endJ

geometry create shape csg csg_name=.sliderActuator.bal3.linkB_link_csg1 base_object=.sliderActuator.bal3.linkB_link object=.sliderActuator.bal3.linkB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.bal3.linkB_link_csg2 base_object=.sliderActuator.bal3.linkB_link_csg1 object=.sliderActuator.bal3.linkB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.bal3.linkB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.bal3.bal3_bal2_marI location=-0.373642, -0.019884, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.bal3_bal2_marI visibility=on
marker create marker_name=.sliderActuator.bal3.sprocket_chain_b34_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.bal2.chain_b34_chain_pair_mar 

entity attributes entity_name=.sliderActuator.bal3.sprocket_chain_b34_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.chain_b34_left1 reference_marker=.sliderActuator.bal3.sprocket_chain_b34_left_mar  points_for_profile= &
0.034237, 0.000000, -0.058750, &
0.033070, 0.008861, -0.058750, &
0.029650, 0.017118, -0.058750, &
0.024209, 0.024209, -0.058750, &
0.017118, 0.029650, -0.058750, &
0.008861, 0.033070, -0.058750, &
0.000000, 0.034237, -0.058750, &
-0.008861, 0.033070, -0.058750, &
-0.017118, 0.029650, -0.058750, &
-0.024209, 0.024209, -0.058750, &
-0.029650, 0.017118, -0.058750, &
-0.033070, 0.008861, -0.058750, &
-0.034237, 0.000000, -0.058750, &
-0.033070, -0.008861, -0.058750, &
-0.029650, -0.017118, -0.058750, &
-0.024209, -0.024209, -0.058750, &
-0.017118, -0.029650, -0.058750, &
-0.008861, -0.033070, -0.058750, &
-0.000000, -0.034237, -0.058750, &
0.008861, -0.033070, -0.058750, &
0.017118, -0.029650, -0.058750, &
0.024209, -0.024209, -0.058750, &
0.029650, -0.017118, -0.058750, &
0.033070, -0.008861, -0.058750, &
0.034237, 0.000000, -0.058750 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal3.sprocket_chain_b34_left_mar
entity attributes entity_name=.sliderActuator.bal3.chain_b34_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.chain_b34_left1 render=filled
marker create marker_name=.sliderActuator.bal3.cyn_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.cyn_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.cyn reference_marker=.sliderActuator.bal3.cyn_mar  points_for_profile= &
-0.363642, -0.019884, -0.052500, &
-0.365255, -0.014438, -0.052500, &
-0.369574, -0.010748, -0.052500, &
-0.375206, -0.010007, -0.052500, &
-0.380333, -0.012452, -0.052500, &
-0.383301, -0.017296, -0.052500, &
-0.383152, -0.022974, -0.052500, &
-0.379935, -0.027655, -0.052500, &
-0.374687, -0.029829, -0.052500, &
-0.369102, -0.028794, -0.052500, &
-0.364981, -0.024884, -0.052500, &
-0.363642, -0.019884, -0.052500 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal3.cyn_mar
entity attributes entity_name=.sliderActuator.bal3.cyn type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.cyn render=filled
marker create marker_name=.sliderActuator.bal3.bal4_bal3_marJ location=-0.486165, -0.061580, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.bal4_bal3_marJ visibility=on
marker create marker_name=.sliderActuator.bal3.chain_f45_chain_pair_mar location=-0.486165, -0.061580, 0.000000 orientation=0.000000, 0.000000, 20.332528 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal3.chain_f45_chain_pair_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal3.chain_f45_belt reference_marker=.sliderActuator.bal3.chain_f45_chain_pair_mar  points_for_profile= &
0.116737, -0.037500, 0.046875, &
0.117693, -0.035193, 0.046875, &
0.120000, -0.034237, 0.046875, &
0.122307, -0.035193, 0.046875, &
0.123263, -0.037500, 0.046875, &
0.126554, -0.037067, 0.046875, &
0.126880, -0.034591, 0.046875, &
0.128861, -0.033070, 0.046875, &
0.131337, -0.033396, 0.046875, &
0.132858, -0.035378, 0.046875, &
0.135924, -0.034108, 0.046875, &
0.135598, -0.031631, 0.046875, &
0.137118, -0.029650, 0.046875, &
0.139595, -0.029324, 0.046875, &
0.141576, -0.030844, 0.046875, &
0.144209, -0.028824, 0.046875, &
0.143253, -0.026517, 0.046875, &
0.144209, -0.024209, 0.046875, &
0.146517, -0.023253, 0.046875, &
0.148824, -0.024209, 0.046875, &
0.150844, -0.021576, 0.046875, &
0.149324, -0.019595, 0.046875, &
0.149650, -0.017118, 0.046875, &
0.151631, -0.015598, 0.046875, &
0.154108, -0.015924, 0.046875, &
0.155378, -0.012858, 0.046875, &
0.153396, -0.011337, 0.046875, &
0.153070, -0.008861, 0.046875, &
0.154591, -0.006880, 0.046875, &
0.157067, -0.006554, 0.046875, &
0.157500, -0.003263, 0.046875, &
0.155193, -0.002307, 0.046875, &
0.154237, 0.000000, 0.046875, &
0.155193, 0.002307, 0.046875, &
0.157500, 0.003263, 0.046875, &
0.157067, 0.006554, 0.046875, &
0.154591, 0.006880, 0.046875, &
0.153070, 0.008861, 0.046875, &
0.153396, 0.011337, 0.046875, &
0.155378, 0.012858, 0.046875, &
0.154108, 0.015924, 0.046875, &
0.151631, 0.015598, 0.046875, &
0.149650, 0.017118, 0.046875, &
0.149324, 0.019595, 0.046875, &
0.150844, 0.021576, 0.046875, &
0.148824, 0.024209, 0.046875, &
0.146517, 0.023253, 0.046875, &
0.144209, 0.024209, 0.046875, &
0.143253, 0.026517, 0.046875, &
0.144209, 0.028824, 0.046875, &
0.141576, 0.030844, 0.046875, &
0.139595, 0.029324, 0.046875, &
0.137118, 0.029650, 0.046875, &
0.135598, 0.031631, 0.046875, &
0.135924, 0.034108, 0.046875, &
0.132858, 0.035378, 0.046875, &
0.131337, 0.033396, 0.046875, &
0.128861, 0.033070, 0.046875, &
0.126880, 0.034591, 0.046875, &
0.126554, 0.037067, 0.046875, &
0.123263, 0.037500, 0.046875, &
0.122307, 0.035193, 0.046875, &
0.120000, 0.034237, 0.046875, &
0.117693, 0.035193, 0.046875, &
0.116737, 0.037500, 0.046875, &
0.113263, 0.037500, 0.046875, &
0.112307, 0.035193, 0.046875, &
0.110000, 0.034237, 0.046875, &
0.107693, 0.035193, 0.046875, &
0.106737, 0.037500, 0.046875, &
0.103263, 0.037500, 0.046875, &
0.102307, 0.035193, 0.046875, &
0.100000, 0.034237, 0.046875, &
0.097693, 0.035193, 0.046875, &
0.096737, 0.037500, 0.046875, &
0.093263, 0.037500, 0.046875, &
0.092307, 0.035193, 0.046875, &
0.090000, 0.034237, 0.046875, &
0.087693, 0.035193, 0.046875, &
0.086737, 0.037500, 0.046875, &
0.083263, 0.037500, 0.046875, &
0.082307, 0.035193, 0.046875, &
0.080000, 0.034237, 0.046875, &
0.077693, 0.035193, 0.046875, &
0.076737, 0.037500, 0.046875, &
0.073263, 0.037500, 0.046875, &
0.072307, 0.035193, 0.046875, &
0.070000, 0.034237, 0.046875, &
0.067693, 0.035193, 0.046875, &
0.066737, 0.037500, 0.046875, &
0.063263, 0.037500, 0.046875, &
0.062307, 0.035193, 0.046875, &
0.060000, 0.034237, 0.046875, &
0.057693, 0.035193, 0.046875, &
0.056737, 0.037500, 0.046875, &
0.053263, 0.037500, 0.046875, &
0.052307, 0.035193, 0.046875, &
0.050000, 0.034237, 0.046875, &
0.047693, 0.035193, 0.046875, &
0.046737, 0.037500, 0.046875, &
0.043263, 0.037500, 0.046875, &
0.042307, 0.035193, 0.046875, &
0.040000, 0.034237, 0.046875, &
0.037693, 0.035193, 0.046875, &
0.036737, 0.037500, 0.046875, &
0.033263, 0.037500, 0.046875, &
0.032307, 0.035193, 0.046875, &
0.030000, 0.034237, 0.046875, &
0.027693, 0.035193, 0.046875, &
0.026737, 0.037500, 0.046875, &
0.023263, 0.037500, 0.046875, &
0.022307, 0.035193, 0.046875, &
0.020000, 0.034237, 0.046875, &
0.017693, 0.035193, 0.046875, &
0.016737, 0.037500, 0.046875, &
0.013263, 0.037500, 0.046875, &
0.012307, 0.035193, 0.046875, &
0.010000, 0.034237, 0.046875, &
0.007693, 0.035193, 0.046875, &
0.006737, 0.037500, 0.046875, &
0.003263, 0.037500, 0.046875, &
0.002307, 0.035193, 0.046875, &
0.000000, 0.034237, 0.046875, &
-0.002307, 0.035193, 0.046875, &
-0.003263, 0.037500, 0.046875, &
-0.006554, 0.037067, 0.046875, &
-0.006880, 0.034591, 0.046875, &
-0.008861, 0.033070, 0.046875, &
-0.011337, 0.033396, 0.046875, &
-0.012858, 0.035378, 0.046875, &
-0.015924, 0.034108, 0.046875, &
-0.015598, 0.031631, 0.046875, &
-0.017118, 0.029650, 0.046875, &
-0.019595, 0.029324, 0.046875, &
-0.021576, 0.030844, 0.046875, &
-0.024209, 0.028824, 0.046875, &
-0.023253, 0.026517, 0.046875, &
-0.024209, 0.024209, 0.046875, &
-0.026517, 0.023253, 0.046875, &
-0.028824, 0.024209, 0.046875, &
-0.030844, 0.021576, 0.046875, &
-0.029324, 0.019595, 0.046875, &
-0.029650, 0.017118, 0.046875, &
-0.031631, 0.015598, 0.046875, &
-0.034108, 0.015924, 0.046875, &
-0.035378, 0.012858, 0.046875, &
-0.033396, 0.011337, 0.046875, &
-0.033070, 0.008861, 0.046875, &
-0.034591, 0.006880, 0.046875, &
-0.037067, 0.006554, 0.046875, &
-0.037500, 0.003263, 0.046875, &
-0.035193, 0.002307, 0.046875, &
-0.034237, 0.000000, 0.046875, &
-0.035193, -0.002307, 0.046875, &
-0.037500, -0.003263, 0.046875, &
-0.037067, -0.006554, 0.046875, &
-0.034591, -0.006880, 0.046875, &
-0.033070, -0.008861, 0.046875, &
-0.033396, -0.011337, 0.046875, &
-0.035378, -0.012858, 0.046875, &
-0.034108, -0.015924, 0.046875, &
-0.031631, -0.015598, 0.046875, &
-0.029650, -0.017118, 0.046875, &
-0.029324, -0.019595, 0.046875, &
-0.030844, -0.021576, 0.046875, &
-0.028824, -0.024209, 0.046875, &
-0.026517, -0.023253, 0.046875, &
-0.024209, -0.024209, 0.046875, &
-0.023253, -0.026517, 0.046875, &
-0.024209, -0.028824, 0.046875, &
-0.021576, -0.030844, 0.046875, &
-0.019595, -0.029324, 0.046875, &
-0.017118, -0.029650, 0.046875, &
-0.015598, -0.031631, 0.046875, &
-0.015924, -0.034108, 0.046875, &
-0.012858, -0.035378, 0.046875, &
-0.011337, -0.033396, 0.046875, &
-0.008861, -0.033070, 0.046875, &
-0.006880, -0.034591, 0.046875, &
-0.006554, -0.037067, 0.046875, &
-0.003263, -0.037500, 0.046875, &
-0.002307, -0.035193, 0.046875, &
0.000000, -0.034237, 0.046875, &
0.002307, -0.035193, 0.046875, &
0.003263, -0.037500, 0.046875, &
0.006737, -0.037500, 0.046875, &
0.007693, -0.035193, 0.046875, &
0.010000, -0.034237, 0.046875, &
0.012307, -0.035193, 0.046875, &
0.013263, -0.037500, 0.046875, &
0.016737, -0.037500, 0.046875, &
0.017693, -0.035193, 0.046875, &
0.020000, -0.034237, 0.046875, &
0.022307, -0.035193, 0.046875, &
0.023263, -0.037500, 0.046875, &
0.026737, -0.037500, 0.046875, &
0.027693, -0.035193, 0.046875, &
0.030000, -0.034237, 0.046875, &
0.032307, -0.035193, 0.046875, &
0.033263, -0.037500, 0.046875, &
0.036737, -0.037500, 0.046875, &
0.037693, -0.035193, 0.046875, &
0.040000, -0.034237, 0.046875, &
0.042307, -0.035193, 0.046875, &
0.043263, -0.037500, 0.046875, &
0.046737, -0.037500, 0.046875, &
0.047693, -0.035193, 0.046875, &
0.050000, -0.034237, 0.046875, &
0.052307, -0.035193, 0.046875, &
0.053263, -0.037500, 0.046875, &
0.056737, -0.037500, 0.046875, &
0.057693, -0.035193, 0.046875, &
0.060000, -0.034237, 0.046875, &
0.062307, -0.035193, 0.046875, &
0.063263, -0.037500, 0.046875, &
0.066737, -0.037500, 0.046875, &
0.067693, -0.035193, 0.046875, &
0.070000, -0.034237, 0.046875, &
0.072307, -0.035193, 0.046875, &
0.073263, -0.037500, 0.046875, &
0.076737, -0.037500, 0.046875, &
0.077693, -0.035193, 0.046875, &
0.080000, -0.034237, 0.046875, &
0.082307, -0.035193, 0.046875, &
0.083263, -0.037500, 0.046875, &
0.086737, -0.037500, 0.046875, &
0.087693, -0.035193, 0.046875, &
0.090000, -0.034237, 0.046875, &
0.092307, -0.035193, 0.046875, &
0.093263, -0.037500, 0.046875, &
0.096737, -0.037500, 0.046875, &
0.097693, -0.035193, 0.046875, &
0.100000, -0.034237, 0.046875, &
0.102307, -0.035193, 0.046875, &
0.103263, -0.037500, 0.046875, &
0.106737, -0.037500, 0.046875, &
0.107693, -0.035193, 0.046875, &
0.110000, -0.034237, 0.046875, &
0.112307, -0.035193, 0.046875, &
0.113263, -0.037500, 0.046875, &
0.110000, -0.038625, 0.046875, &
-0.000000, -0.038625, 0.046875, &
-0.013211, -0.036296, 0.046875, &
-0.024828, -0.029588, 0.046875, &
-0.033450, -0.019313, 0.046875, &
-0.038038, -0.006707, 0.046875, &
-0.038038, 0.006707, 0.046875, &
-0.033450, 0.019312, 0.046875, &
-0.024828, 0.029588, 0.046875, &
-0.013211, 0.036296, 0.046875, &
0.000000, 0.038625, 0.046875, &
0.120000, 0.038625, 0.046875, &
0.133140, 0.036321, 0.046875, &
0.144713, 0.029685, 0.046875, &
0.153337, 0.019507, 0.046875, &
0.157985, 0.007002, 0.046875, &
0.158101, -0.006338, 0.046875, &
0.153673, -0.018922, 0.046875, &
0.145227, -0.029249, 0.046875, &
0.133772, -0.036086, 0.046875, &
0.120674, -0.038619, 0.046875, &
0.116737, -0.037500, 0.046875 &
length_along_z_axis=0.005000 analytical=yes &
relative_to=.sliderActuator.bal3.chain_f45_chain_pair_mar
entity attributes entity_name=.sliderActuator.bal3.chain_f45_belt type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal3.chain_f45_belt render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.bal3 material_type = steel
entity attributes entity_name=.sliderActuator.bal3.linkF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.linkF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.linkF_link visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.linkB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.linkB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.linkB_link visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.chain_b34_left1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.cyn visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal3.chain_f45_belt visibility=on color=WHITE

part create rigid_body name_and_position part_name=.sliderActuator.idlerf3
part mod rigid_body mass_properties part_name=.sliderActuator.idlerf3 material_type = steel
entity attributes entity_name=.sliderActuator.idlerf3 visibility=on color=WHITE

marker create marker_name=.sliderActuator.idlerf3.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.idlerf3.cm visibility=on
marker create marker_name=.sliderActuator.idlerf3.sprocket_chain_f32_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.bal2.chain_f32_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerf3.sprocket_chain_f32_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerf3.chain_f32_left1 reference_marker=.sliderActuator.idlerf3.sprocket_chain_f32_left_mar  points_for_profile= &
0.034237, 0.000000, 0.052500, &
0.033070, 0.008861, 0.052500, &
0.029650, 0.017118, 0.052500, &
0.024209, 0.024209, 0.052500, &
0.017118, 0.029650, 0.052500, &
0.008861, 0.033070, 0.052500, &
0.000000, 0.034237, 0.052500, &
-0.008861, 0.033070, 0.052500, &
-0.017118, 0.029650, 0.052500, &
-0.024209, 0.024209, 0.052500, &
-0.029650, 0.017118, 0.052500, &
-0.033070, 0.008861, 0.052500, &
-0.034237, 0.000000, 0.052500, &
-0.033070, -0.008861, 0.052500, &
-0.029650, -0.017118, 0.052500, &
-0.024209, -0.024209, 0.052500, &
-0.017118, -0.029650, 0.052500, &
-0.008861, -0.033070, 0.052500, &
-0.000000, -0.034237, 0.052500, &
0.008861, -0.033070, 0.052500, &
0.017118, -0.029650, 0.052500, &
0.024209, -0.024209, 0.052500, &
0.029650, -0.017118, 0.052500, &
0.033070, -0.008861, 0.052500, &
0.034237, 0.000000, 0.052500 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerf3.sprocket_chain_f32_left_mar
entity attributes entity_name=.sliderActuator.idlerf3.chain_f32_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerf3.chain_f32_left1 render=filled
marker create marker_name=.sliderActuator.idlerf3.chain_f32_left_marI location=-0.373642, -0.019884, 0.052500 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.idlerf3.chain_f32_left_marI visibility=on
marker create marker_name=.sliderActuator.idlerf3.sprocket_chain_f45_right_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.bal3.chain_f45_chain_pair_mar 

entity attributes entity_name=.sliderActuator.idlerf3.sprocket_chain_f45_right_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.idlerf3.chain_f45_right1 reference_marker=.sliderActuator.idlerf3.sprocket_chain_f45_right_mar  points_for_profile= &
0.154237, 0.000000, 0.046250, &
0.153070, 0.008861, 0.046250, &
0.149650, 0.017118, 0.046250, &
0.144209, 0.024209, 0.046250, &
0.137118, 0.029650, 0.046250, &
0.128861, 0.033070, 0.046250, &
0.120000, 0.034237, 0.046250, &
0.111139, 0.033070, 0.046250, &
0.102882, 0.029650, 0.046250, &
0.095791, 0.024209, 0.046250, &
0.090350, 0.017118, 0.046250, &
0.086930, 0.008861, 0.046250, &
0.085763, 0.000000, 0.046250, &
0.086930, -0.008861, 0.046250, &
0.090350, -0.017118, 0.046250, &
0.095791, -0.024209, 0.046250, &
0.102882, -0.029650, 0.046250, &
0.111139, -0.033070, 0.046250, &
0.120000, -0.034237, 0.046250, &
0.128861, -0.033070, 0.046250, &
0.137118, -0.029650, 0.046250, &
0.144209, -0.024209, 0.046250, &
0.149650, -0.017118, 0.046250, &
0.153070, -0.008861, 0.046250, &
0.154237, 0.000000, 0.046250 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.idlerf3.sprocket_chain_f45_right_mar
entity attributes entity_name=.sliderActuator.idlerf3.chain_f45_right1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.idlerf3.chain_f45_right1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.idlerf3 material_type = steel
entity attributes entity_name=.sliderActuator.idlerf3.chain_f32_left1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.idlerf3.chain_f45_right1 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_f32_parallel i_marker_name=.sliderActuator.idlerf3.sprocket_chain_f32_left_mar j_marker_name=.sliderActuator.idlerf2.sprocket_chain_f32_right_mar
constraint create joint revolute joint_name=.sliderActuator.chain_f32_left i_marker_name=.sliderActuator.idlerf3.chain_f32_left_marI j_marker_name=.sliderActuator.bal2.chain_f32_left_marJ
constraint create joint revolute joint_name=.sliderActuator.bal3_bal2 i_marker_name=.sliderActuator.bal3.bal3_bal2_marI j_marker_name=.sliderActuator.bal2.bal3_bal2_marJ
constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_b34_parallel i_marker_name=.sliderActuator.bal3.sprocket_chain_b34_left_mar j_marker_name=.sliderActuator.idlerb2.sprocket_chain_b34_right_mar
part create rigid_body name_and_position part_name=.sliderActuator.bal4
part mod rigid_body mass_properties part_name=.sliderActuator.bal4 material_type = steel
entity attributes entity_name=.sliderActuator.bal4 visibility=on color=WHITE

marker create marker_name=.sliderActuator.bal4.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.bal4.cm visibility=on
marker create marker_name=.sliderActuator.bal4.cynMar location=-0.486165, -0.061580, 0.000000 orientation=162.343309, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal4.cynMar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal4.cyn3 reference_marker=.sliderActuator.bal4.cynMar  points_for_profile= &
0.094866, 0.000000, -0.067500, &
0.081174, 0.046221, -0.067500, &
0.044518, 0.077529, -0.067500, &
-0.003276, 0.083821, -0.067500, &
-0.046786, 0.063067, -0.067500, &
-0.071974, 0.021965, -0.067500, &
-0.070712, -0.026225, -0.067500, &
-0.043408, -0.065953, -0.067500, &
0.001129, -0.084401, -0.067500, &
0.048528, -0.075616, -0.067500, &
0.083496, -0.042433, -0.067500, &
0.094866, 0.000000, -0.067500 &
length_along_z_axis=0.135000 analytical=yes &
relative_to=.sliderActuator.bal4.cynMar
entity attributes entity_name=.sliderActuator.bal4.cyn3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal4.cyn3 render=filled
marker create marker_name=.sliderActuator.bal4.bal4_bal3_marI location=-0.486165, -0.061580, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.bal4.bal4_bal3_marI visibility=on
marker create marker_name=.sliderActuator.bal4.sprocket_chain_f45_left_mar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.bal3.chain_f45_chain_pair_mar 

entity attributes entity_name=.sliderActuator.bal4.sprocket_chain_f45_left_mar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.bal4.chain_f45_left1 reference_marker=.sliderActuator.bal4.sprocket_chain_f45_left_mar  points_for_profile= &
0.034237, 0.000000, 0.046250, &
0.033070, 0.008861, 0.046250, &
0.029650, 0.017118, 0.046250, &
0.024209, 0.024209, 0.046250, &
0.017118, 0.029650, 0.046250, &
0.008861, 0.033070, 0.046250, &
0.000000, 0.034237, 0.046250, &
-0.008861, 0.033070, 0.046250, &
-0.017118, 0.029650, 0.046250, &
-0.024209, 0.024209, 0.046250, &
-0.029650, 0.017118, 0.046250, &
-0.033070, 0.008861, 0.046250, &
-0.034237, 0.000000, 0.046250, &
-0.033070, -0.008861, 0.046250, &
-0.029650, -0.017118, 0.046250, &
-0.024209, -0.024209, 0.046250, &
-0.017118, -0.029650, 0.046250, &
-0.008861, -0.033070, 0.046250, &
-0.000000, -0.034237, 0.046250, &
0.008861, -0.033070, 0.046250, &
0.017118, -0.029650, 0.046250, &
0.024209, -0.024209, 0.046250, &
0.029650, -0.017118, 0.046250, &
0.033070, -0.008861, 0.046250, &
0.034237, 0.000000, 0.046250 &
length_along_z_axis=0.006250 analytical=yes &
relative_to=.sliderActuator.bal4.sprocket_chain_f45_left_mar
entity attributes entity_name=.sliderActuator.bal4.chain_f45_left1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.bal4.chain_f45_left1 render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.bal4 material_type = steel
entity attributes entity_name=.sliderActuator.bal4.cyn3 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.bal4.chain_f45_left1 visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.bal4_bal3 i_marker_name=.sliderActuator.bal4.bal4_bal3_marI j_marker_name=.sliderActuator.bal3.bal4_bal3_marJ
constraint create primitive_joint orientation jprim_name=.sliderActuator.chain_f45_parallel i_marker_name=.sliderActuator.bal4.sprocket_chain_f45_left_mar j_marker_name=.sliderActuator.idlerf3.sprocket_chain_f45_right_mar
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkF21
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF21 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF21 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkF21.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkF21.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkF21.ParaLinkF21_endI location=-0.034799, 0.013975, 0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF21.ParaLinkF21_endJ location=0.346814, 0.155384, 0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn1 reference_marker=.sliderActuator.ParaLinkF21.ParaLinkF21_endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkF21.ParaLinkF21_endI
entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn2 reference_marker=.sliderActuator.ParaLinkF21.ParaLinkF21_endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkF21.ParaLinkF21_endJ
entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link width=0.006750 depth=0.003750 i_marker=.sliderActuator.ParaLinkF21.ParaLinkF21_endI j_marker=.sliderActuator.ParaLinkF21.ParaLinkF21_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_csg1 base_object=.sliderActuator.ParaLinkF21.ParaLinkF21_link object=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_csg2 base_object=.sliderActuator.ParaLinkF21.ParaLinkF21_link_csg1 object=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkF21.J21_marI location=-0.034799, 0.013975, 0.127031 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21.J21_marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF21.J22_marJ location=0.346814, 0.155384, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21.J22_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF21 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF21.ParaLinkF21_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J21 i_marker_name=.sliderActuator.ParaLinkF21.J21_marI j_marker_name=.sliderActuator.DeltaF2.J21_marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkB21
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB21 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB21 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkB21.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkB21.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkB21.ParaLinkB21_endI location=-0.034799, 0.013975, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB21.ParaLinkB21_endJ location=0.346814, 0.155384, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn1 reference_marker=.sliderActuator.ParaLinkB21.ParaLinkB21_endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkB21.ParaLinkB21_endI
entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn2 reference_marker=.sliderActuator.ParaLinkB21.ParaLinkB21_endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkB21.ParaLinkB21_endJ
entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link width=0.006750 depth=0.003750 i_marker=.sliderActuator.ParaLinkB21.ParaLinkB21_endI j_marker=.sliderActuator.ParaLinkB21.ParaLinkB21_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_csg1 base_object=.sliderActuator.ParaLinkB21.ParaLinkB21_link object=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_csg2 base_object=.sliderActuator.ParaLinkB21.ParaLinkB21_link_csg1 object=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkB21.J21B_marI location=-0.034799, 0.013975, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21.J21B_marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB21.J22B_marJ location=0.346814, 0.155384, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21.J22B_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB21 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB21.ParaLinkB21_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J21B i_marker_name=.sliderActuator.ParaLinkB21.J21B_marI j_marker_name=.sliderActuator.DeltaF2.J21B_marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkF21_
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF21_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF21_ visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkF21_.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkF21_.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__endI location=-0.013975, -0.034799, 0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__endJ location=0.367638, 0.106611, 0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn1 reference_marker=.sliderActuator.ParaLinkF21_.ParaLinkF21__endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkF21_.ParaLinkF21__endI
entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn2 reference_marker=.sliderActuator.ParaLinkF21_.ParaLinkF21__endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkF21_.ParaLinkF21__endJ
entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link width=0.006750 depth=0.003750 i_marker=.sliderActuator.ParaLinkF21_.ParaLinkF21__endI j_marker=.sliderActuator.ParaLinkF21_.ParaLinkF21__endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_csg1 base_object=.sliderActuator.ParaLinkF21_.ParaLinkF21__link object=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_csg2 base_object=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_csg1 object=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkF21_.J21__marI location=-0.013975, -0.034799, 0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21_.J21__marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF21_.J22__marJ location=0.367638, 0.106611, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF21_.J22__marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF21_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF21_.ParaLinkF21__link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J21_ i_marker_name=.sliderActuator.ParaLinkF21_.J21__marI j_marker_name=.sliderActuator.DeltaF2.J21__marJ
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkB21_
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB21_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB21_ visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkB21_.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkB21_.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__endI location=-0.013975, -0.034799, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__endJ location=0.367638, 0.106611, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn1 reference_marker=.sliderActuator.ParaLinkB21_.ParaLinkB21__endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkB21_.ParaLinkB21__endI
entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn2 reference_marker=.sliderActuator.ParaLinkB21_.ParaLinkB21__endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkB21_.ParaLinkB21__endJ
entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link width=0.006750 depth=0.003750 i_marker=.sliderActuator.ParaLinkB21_.ParaLinkB21__endI j_marker=.sliderActuator.ParaLinkB21_.ParaLinkB21__endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_csg1 base_object=.sliderActuator.ParaLinkB21_.ParaLinkB21__link object=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_csg2 base_object=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_csg1 object=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkB21_.J21B__marI location=-0.013975, -0.034799, -0.080625 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21_.J21B__marI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB21_.J22B__marJ location=0.367638, 0.106611, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB21_.J22B__marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB21_ material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB21_.ParaLinkB21__link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J21B_ i_marker_name=.sliderActuator.ParaLinkB21_.J21B__marI j_marker_name=.sliderActuator.DeltaF2.J21B__marJ
part create rigid_body name_and_position part_name=.sliderActuator.deltaF3
part mod rigid_body mass_properties part_name=.sliderActuator.deltaF3 material_type = steel
entity attributes entity_name=.sliderActuator.deltaF3 visibility=on color=WHITE

marker create marker_name=.sliderActuator.deltaF3.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.deltaF3.cm visibility=on
marker create marker_name=.sliderActuator.deltaF3.paralmar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.deltaF3.paralmar visibility=on
marker create marker_name=.sliderActuator.deltaF3.triangleplatem1 location=0.381613, 0.141409, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleplatem1 visibility=on
marker create marker_name=.sliderActuator.deltaF3.triangleplatem2 location=0.346814, 0.155384, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleplatem2 visibility=on
marker create marker_name=.sliderActuator.deltaF3.triangleplatem3 location=0.367638, 0.106611, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleplatem3 visibility=on
marker create marker_name=.sliderActuator.deltaF3.triangleplatem4 location=0.387802, 0.104424, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleplatem4 visibility=on
geom create shape plate plate=.sliderActuator.deltaF3.triangle marker_name=.sliderActuator.deltaF3.triangleplatem1, .sliderActuator.deltaF3.triangleplatem2, .sliderActuator.deltaF3.triangleplatem3, .sliderActuator.deltaF3.triangleplatem4 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.deltaF3.triangle type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.deltaF3.J22_marI location=0.346814, 0.155384, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J22_marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.J23_marI location=0.381613, 0.141409, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J23_marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.J22__marI location=0.367638, 0.106611, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J22__marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.mar2_df3 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.mar2_df3 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.deltaF3.cyn reference_marker=.sliderActuator.deltaF3.mar2_df3  points_for_profile= &
0.350564, 0.155384, -0.080625, &
0.349959, 0.157427, -0.080625, &
0.348340, 0.158810, -0.080625, &
0.346228, 0.159088, -0.080625, &
0.344305, 0.158171, -0.080625, &
0.343192, 0.156355, -0.080625, &
0.343248, 0.154226, -0.080625, &
0.344454, 0.152470, -0.080625, &
0.346422, 0.151655, -0.080625, &
0.348517, 0.152043, -0.080625, &
0.350062, 0.153509, -0.080625, &
0.350564, 0.155384, -0.080625 &
length_along_z_axis=0.161250 analytical=yes &
relative_to=.sliderActuator.deltaF3.mar2_df3
entity attributes entity_name=.sliderActuator.deltaF3.cyn type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.deltaF3.cyn render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.deltaF3.cyn1 reference_marker=.sliderActuator.deltaF3.mar2_df3  points_for_profile= &
0.371388, 0.106611, 0.051094, &
0.370783, 0.108653, 0.051094, &
0.369163, 0.110036, 0.051094, &
0.367051, 0.110314, 0.051094, &
0.365129, 0.109397, 0.051094, &
0.364016, 0.107581, 0.051094, &
0.364071, 0.105452, 0.051094, &
0.365278, 0.103696, 0.051094, &
0.367246, 0.102881, 0.051094, &
0.369340, 0.103269, 0.051094, &
0.370885, 0.104736, 0.051094, &
0.371388, 0.106611, 0.051094 &
length_along_z_axis=0.029531 analytical=yes &
relative_to=.sliderActuator.deltaF3.mar2_df3
entity attributes entity_name=.sliderActuator.deltaF3.cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.deltaF3.cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.deltaF3.cyn2 reference_marker=.sliderActuator.deltaF3.mar2_df3  points_for_profile= &
0.371388, 0.106611, -0.080625, &
0.370783, 0.108653, -0.080625, &
0.369163, 0.110036, -0.080625, &
0.367051, 0.110314, -0.080625, &
0.365129, 0.109397, -0.080625, &
0.364016, 0.107581, -0.080625, &
0.364071, 0.105452, -0.080625, &
0.365278, 0.103696, -0.080625, &
0.367246, 0.102881, -0.080625, &
0.369340, 0.103269, -0.080625, &
0.370885, 0.104736, -0.080625, &
0.371388, 0.106611, -0.080625 &
length_along_z_axis=0.029531 analytical=yes &
relative_to=.sliderActuator.deltaF3.mar2_df3
entity attributes entity_name=.sliderActuator.deltaF3.cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.deltaF3.cyn2 render=filled
marker create marker_name=.sliderActuator.deltaF3.triangleBplatem1 location=0.418599, 0.147599, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleBplatem1 visibility=on
marker create marker_name=.sliderActuator.deltaF3.triangleBplatem2 location=0.346814, 0.155384, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleBplatem2 visibility=on
marker create marker_name=.sliderActuator.deltaF3.triangleBplatem3 location=0.367638, 0.106611, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.triangleBplatem3 visibility=on
geom create shape plate plate=.sliderActuator.deltaF3.triangleB marker_name=.sliderActuator.deltaF3.triangleBplatem1, .sliderActuator.deltaF3.triangleBplatem2, .sliderActuator.deltaF3.triangleBplatem3 radius=0.007500 width=0.004688

entity attributes entity_name=.sliderActuator.deltaF3.triangleB type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.deltaF3.J22B_marI location=0.346814, 0.155384, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J22B_marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.J23B_marI location=0.381613, 0.141409, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J23B_marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.J22B__marI location=0.367638, 0.106611, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J22B__marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.J24_marI location=0.387802, 0.104424, 0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J24_marI visibility=on
marker create marker_name=.sliderActuator.deltaF3.J24B_marI location=0.418599, 0.147599, -0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.deltaF3.J24B_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.deltaF3 material_type = steel
entity attributes entity_name=.sliderActuator.deltaF3.triangle visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.deltaF3.cyn visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.deltaF3.cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.deltaF3.cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.deltaF3.triangleB visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.Paral3 i_marker_name=.sliderActuator.deltaF3.paralmar j_marker_name=.sliderActuator.ground.ground_marker
force create element_like bushing bushing_name=.sliderActuator.J22 i_marker_name=.sliderActuator.deltaF3.J22_marI j_marker_name=.sliderActuator.ParaLinkF21.J22_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
constraint create joint revolute joint_name=.sliderActuator.J23 i_marker_name=.sliderActuator.deltaF3.J23_marI j_marker_name=.sliderActuator.SLM22_Brace.J23_marJ
force create element_like bushing bushing_name=.sliderActuator.J22_ i_marker_name=.sliderActuator.deltaF3.J22__marI j_marker_name=.sliderActuator.ParaLinkF21_.J22__marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
force create element_like bushing bushing_name=.sliderActuator.J22B i_marker_name=.sliderActuator.deltaF3.J22B_marI j_marker_name=.sliderActuator.ParaLinkB21.J22B_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
constraint create joint revolute joint_name=.sliderActuator.J23B i_marker_name=.sliderActuator.deltaF3.J23B_marI j_marker_name=.sliderActuator.SLM22_Brace.J23B_marJ
force create element_like bushing bushing_name=.sliderActuator.J22B_ i_marker_name=.sliderActuator.deltaF3.J22B__marI j_marker_name=.sliderActuator.ParaLinkB21_.J22B__marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkF22
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF22 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF22 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkF22.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkF22.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkF22.ParaLinkF22_endI location=0.387802, 0.104424, 0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkF22.ParaLinkF22_endJ location=0.768959, -0.016902, 0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn1 reference_marker=.sliderActuator.ParaLinkF22.ParaLinkF22_endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkF22.ParaLinkF22_endI
entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn2 reference_marker=.sliderActuator.ParaLinkF22.ParaLinkF22_endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkF22.ParaLinkF22_endJ
entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link width=0.006750 depth=0.003750 i_marker=.sliderActuator.ParaLinkF22.ParaLinkF22_endI j_marker=.sliderActuator.ParaLinkF22.ParaLinkF22_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_csg1 base_object=.sliderActuator.ParaLinkF22.ParaLinkF22_link object=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_csg2 base_object=.sliderActuator.ParaLinkF22.ParaLinkF22_link_csg1 object=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkF22.J24_marJ location=0.387802, 0.104424, 0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF22.J24_marJ visibility=on
marker create marker_name=.sliderActuator.ParaLinkF22.J26_marJ location=0.768959, -0.016902, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkF22.J26_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkF22 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkF22.ParaLinkF22_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J24 i_marker_name=.sliderActuator.deltaF3.J24_marI j_marker_name=.sliderActuator.ParaLinkF22.J24_marJ
part create rigid_body name_and_position part_name=.sliderActuator.DeltaF4
part mod rigid_body mass_properties part_name=.sliderActuator.DeltaF4 material_type = steel
entity attributes entity_name=.sliderActuator.DeltaF4 visibility=on color=WHITE

marker create marker_name=.sliderActuator.DeltaF4.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.DeltaF4.cm visibility=on
marker create marker_name=.sliderActuator.DeltaF4.DeltaF4_endI location=0.762769, 0.020084, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_endI visibility=on
marker create marker_name=.sliderActuator.DeltaF4.DeltaF4_endJ location=0.768959, -0.016902, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF4.DeltaF4_link_cyn1 reference_marker=.sliderActuator.DeltaF4.DeltaF4_endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.DeltaF4.DeltaF4_endI
entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF4.DeltaF4_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF4.DeltaF4_link_cyn2 reference_marker=.sliderActuator.DeltaF4.DeltaF4_endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.DeltaF4.DeltaF4_endJ
entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF4.DeltaF4_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.DeltaF4.DeltaF4_link width=0.006750 depth=0.003750 i_marker=.sliderActuator.DeltaF4.DeltaF4_endI j_marker=.sliderActuator.DeltaF4.DeltaF4_endJ

geometry create shape csg csg_name=.sliderActuator.DeltaF4.DeltaF4_link_csg1 base_object=.sliderActuator.DeltaF4.DeltaF4_link object=.sliderActuator.DeltaF4.DeltaF4_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.DeltaF4.DeltaF4_link_csg2 base_object=.sliderActuator.DeltaF4.DeltaF4_link_csg1 object=.sliderActuator.DeltaF4.DeltaF4_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF4.paralmar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.ground.ground_marker 

entity attributes entity_name=.sliderActuator.DeltaF4.paralmar visibility=on
marker create marker_name=.sliderActuator.DeltaF4.J25_marI location=0.762769, 0.020084, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.J25_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF4.J26_marI location=0.768959, -0.016902, 0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.J26_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleBplatem1 location=0.768959, -0.016902, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleBplatem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleBplatem2 location=0.762769, 0.020084, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleBplatem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleBplatem3 location=0.762769, 0.026273, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleBplatem3 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleBplatem4 location=0.799755, 0.026273, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleBplatem4 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleBplatem5 location=0.799755, -0.016902, -0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleBplatem5 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF4.triangleB marker_name=.sliderActuator.DeltaF4.triangleBplatem1, .sliderActuator.DeltaF4.triangleBplatem2, .sliderActuator.DeltaF4.triangleBplatem3, .sliderActuator.DeltaF4.triangleBplatem4, .sliderActuator.DeltaF4.triangleBplatem5 radius=0.003750 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF4.triangleB type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF4.triangleFplatem1 location=0.768959, -0.016902, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleFplatem1 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleFplatem2 location=0.762769, 0.020084, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleFplatem2 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleFplatem3 location=0.762769, 0.026273, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleFplatem3 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleFplatem4 location=0.799755, 0.026273, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleFplatem4 visibility=on
marker create marker_name=.sliderActuator.DeltaF4.triangleFplatem5 location=0.799755, -0.016902, 0.051094 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.triangleFplatem5 visibility=on
geom create shape plate plate=.sliderActuator.DeltaF4.triangleF marker_name=.sliderActuator.DeltaF4.triangleFplatem1, .sliderActuator.DeltaF4.triangleFplatem2, .sliderActuator.DeltaF4.triangleFplatem3, .sliderActuator.DeltaF4.triangleFplatem4, .sliderActuator.DeltaF4.triangleFplatem5 radius=0.003750 width=0.004688

entity attributes entity_name=.sliderActuator.DeltaF4.triangleF type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.DeltaF4.J25B_marI location=0.762769, 0.020084, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.J25B_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF4.J26B_marI location=0.799755, 0.026273, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.J26B_marI visibility=on
marker create marker_name=.sliderActuator.DeltaF4.mar3_ location=0.768959, -0.016902, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.mar3_ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF4.cyn reference_marker=.sliderActuator.DeltaF4.mar3_  points_for_profile= &
0.003750, 0.000000, -0.053438, &
0.003145, 0.002042, -0.053438, &
0.001525, 0.003426, -0.053438, &
-0.000587, 0.003704, -0.053438, &
-0.002509, 0.002787, -0.053438, &
-0.003622, 0.000971, -0.053438, &
-0.003566, -0.001159, -0.053438, &
-0.002360, -0.002914, -0.053438, &
-0.000392, -0.003729, -0.053438, &
0.001702, -0.003341, -0.053438, &
0.003248, -0.001875, -0.053438, &
0.003750, 0.000000, -0.053438 &
length_along_z_axis=0.106875 analytical=yes &
relative_to=.sliderActuator.DeltaF4.mar3_
entity attributes entity_name=.sliderActuator.DeltaF4.cyn type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF4.cyn render=filled
marker create marker_name=.sliderActuator.DeltaF4.mar3 location=0.799755, 0.004686, 0.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.DeltaF4.mar3 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF4.bracketUp reference_marker=.sliderActuator.DeltaF4.mar3  points_for_profile= &
0.000000, 0.048750, 0.019244, &
-0.030796, 0.048750, 0.019244, &
-0.030796, -0.048750, 0.019244, &
0.000000, -0.048750, 0.019244, &
0.046406, -0.007500, 0.019244, &
0.048971, -0.007048, 0.019244, &
0.051227, -0.005745, 0.019244, &
0.052901, -0.003750, 0.019244, &
0.053792, -0.001302, 0.019244, &
0.053792, 0.001302, 0.019244, &
0.052901, 0.003750, 0.019244, &
0.051227, 0.005745, 0.019244, &
0.048971, 0.007048, 0.019244, &
0.046406, 0.007500, 0.019244, &
0.000000, 0.048750, 0.019244 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.DeltaF4.mar3
entity attributes entity_name=.sliderActuator.DeltaF4.bracketUp type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF4.bracketUp render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF4.bracketBot reference_marker=.sliderActuator.DeltaF4.mar3  points_for_profile= &
0.000000, 0.048750, -0.023931, &
-0.030796, 0.048750, -0.023931, &
-0.030796, -0.048750, -0.023931, &
0.000000, -0.048750, -0.023931, &
0.046406, -0.007500, -0.023931, &
0.048971, -0.007048, -0.023931, &
0.051227, -0.005745, -0.023931, &
0.052901, -0.003750, -0.023931, &
0.053792, -0.001302, -0.023931, &
0.053792, 0.001302, -0.023931, &
0.052901, 0.003750, -0.023931, &
0.051227, 0.005745, -0.023931, &
0.048971, 0.007048, -0.023931, &
0.046406, 0.007500, -0.023931, &
0.000000, 0.048750, -0.023931 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.DeltaF4.mar3
entity attributes entity_name=.sliderActuator.DeltaF4.bracketBot type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF4.bracketBot render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.DeltaF4.cyn3 reference_marker=.sliderActuator.DeltaF4.mar3  points_for_profile= &
0.050156, 0.000000, -0.021588, &
0.049551, 0.002042, -0.021588, &
0.047932, 0.003426, -0.021588, &
0.045820, 0.003704, -0.021588, &
0.043897, 0.002787, -0.021588, &
0.042784, 0.000971, -0.021588, &
0.042840, -0.001159, -0.021588, &
0.044046, -0.002914, -0.021588, &
0.046014, -0.003729, -0.021588, &
0.048109, -0.003341, -0.021588, &
0.049654, -0.001875, -0.021588, &
0.050156, 0.000000, -0.021588 &
length_along_z_axis=0.043175 analytical=yes &
relative_to=.sliderActuator.DeltaF4.mar3
entity attributes entity_name=.sliderActuator.DeltaF4.cyn3 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.DeltaF4.cyn3 render=filled
marker create marker_name=.sliderActuator.DeltaF4.J27_marJ location=0.046406, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF4.mar3 

entity attributes entity_name=.sliderActuator.DeltaF4.J27_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.DeltaF4 material_type = steel
entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.DeltaF4_link visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.triangleB visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.triangleF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.cyn visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.bracketUp visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.bracketBot visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.DeltaF4.cyn3 visibility=on color=WHITE

constraint create primitive_joint orientation jprim_name=.sliderActuator.Paral4 i_marker_name=.sliderActuator.DeltaF4.paralmar j_marker_name=.sliderActuator.ground.ground_marker
constraint create joint revolute joint_name=.sliderActuator.J25 i_marker_name=.sliderActuator.DeltaF4.J25_marI j_marker_name=.sliderActuator.SLM22_CrankFF.J25_marJ
force create element_like bushing bushing_name=.sliderActuator.J26 i_marker_name=.sliderActuator.DeltaF4.J26_marI j_marker_name=.sliderActuator.ParaLinkF22.J26_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
part create rigid_body name_and_position part_name=.sliderActuator.ParaLinkB22
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB22 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB22 visibility=on color=WHITE

marker create marker_name=.sliderActuator.ParaLinkB22.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.ParaLinkB22.cm visibility=on
marker create marker_name=.sliderActuator.ParaLinkB22.ParaLinkB22_endI location=0.418599, 0.147599, -0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_endI visibility=on
marker create marker_name=.sliderActuator.ParaLinkB22.ParaLinkB22_endJ location=0.799755, 0.026273, -0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn1 reference_marker=.sliderActuator.ParaLinkB22.ParaLinkB22_endI  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkB22.ParaLinkB22_endI
entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn2 reference_marker=.sliderActuator.ParaLinkB22.ParaLinkB22_endJ  points_for_profile= &
0.005625, 0.000000, -0.002344, &
0.004718, 0.003064, -0.002344, &
0.002288, 0.005139, -0.002344, &
-0.000880, 0.005556, -0.002344, &
-0.003764, 0.004180, -0.002344, &
-0.005433, 0.001456, -0.002344, &
-0.005350, -0.001738, -0.002344, &
-0.003540, -0.004371, -0.002344, &
-0.000588, -0.005594, -0.002344, &
0.002554, -0.005012, -0.002344, &
0.004871, -0.002813, -0.002344, &
0.005625, 0.000000, -0.002344 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.ParaLinkB22.ParaLinkB22_endJ
entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link width=0.006750 depth=0.003750 i_marker=.sliderActuator.ParaLinkB22.ParaLinkB22_endI j_marker=.sliderActuator.ParaLinkB22.ParaLinkB22_endJ

geometry create shape csg csg_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_csg1 base_object=.sliderActuator.ParaLinkB22.ParaLinkB22_link object=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_csg2 base_object=.sliderActuator.ParaLinkB22.ParaLinkB22_link_csg1 object=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.ParaLinkB22.J24B_marJ location=0.418599, 0.147599, -0.055781 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB22.J24B_marJ visibility=on
marker create marker_name=.sliderActuator.ParaLinkB22.J26B_marJ location=0.799755, 0.026273, -0.046406 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF2.mar22 

entity attributes entity_name=.sliderActuator.ParaLinkB22.J26B_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.ParaLinkB22 material_type = steel
entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.ParaLinkB22.ParaLinkB22_link visibility=on color=WHITE

force create element_like bushing bushing_name=.sliderActuator.J24B i_marker_name=.sliderActuator.deltaF3.J24B_marI j_marker_name=.sliderActuator.ParaLinkB22.J24B_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
constraint create joint revolute joint_name=.sliderActuator.J25B i_marker_name=.sliderActuator.DeltaF4.J25B_marI j_marker_name=.sliderActuator.SLM22_CrankFF.J25B_marJ
force create element_like bushing bushing_name=.sliderActuator.J26B i_marker_name=.sliderActuator.DeltaF4.J26B_marI j_marker_name=.sliderActuator.ParaLinkB22.J26B_marJ stiffness=100000000.000000, 100000000.000000, 100000000.000000 damping=10.000000, 10.000000, 10.000000 tstiffness=0.000000, 0.000000, 0.000000 tdamping=0.000000, 0.000000, 0.000000
force modify element_like bushing force_preload=0.000000, 0.000000, 0.000000 torque_preload=0.000000, 0.000000, 0.000000
part create rigid_body name_and_position part_name=.sliderActuator.part5
part mod rigid_body mass_properties part_name=.sliderActuator.part5 material_type = steel
entity attributes entity_name=.sliderActuator.part5 visibility=on color=WHITE

marker create marker_name=.sliderActuator.part5.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.part5.cm visibility=on
marker create marker_name=.sliderActuator.part5.mar4 location=0.046406, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF4.mar3 

entity attributes entity_name=.sliderActuator.part5.mar4 visibility=on
marker create marker_name=.sliderActuator.part5.J27_marI location=0.046406, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.DeltaF4.mar3 

entity attributes entity_name=.sliderActuator.part5.J27_marI visibility=on
marker create marker_name=.sliderActuator.part5.mar5 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 90.000000, 0.000000 relative_to=.sliderActuator.part5.mar4 

entity attributes entity_name=.sliderActuator.part5.mar5 visibility=on
marker create marker_name=.sliderActuator.part5.mar6 location=0.075994, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.mar5 

entity attributes entity_name=.sliderActuator.part5.mar6 visibility=on
marker create marker_name=.sliderActuator.part5.LeftRevJ_marJ location=0.000000, 0.000000, 0.000000 orientation=9.712872, 0.000000, 0.000000 relative_to=.sliderActuator.part5.mar6 

entity attributes entity_name=.sliderActuator.part5.LeftRevJ_marJ visibility=on
marker create marker_name=.sliderActuator.part5.crank_linkLF_marI location=-0.028868, 0.016667, 0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.part5.crank_linkLF_marI visibility=on
marker create marker_name=.sliderActuator.part5.crank_linkLB_marI location=-0.028868, 0.016667, -0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.part5.crank_linkLB_marI visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.part5.delta1 reference_marker=.sliderActuator.part5.mar4  points_for_profile= &
-0.003750, 0.006495, 0.023931, &
-0.005147, 0.005455, 0.023931, &
-0.006266, 0.004121, 0.023931, &
-0.007048, 0.002565, 0.023931, &
-0.007449, 0.000871, 0.023931, &
-0.007449, -0.000871, 0.023931, &
-0.007048, -0.002565, 0.023931, &
-0.006266, -0.004121, 0.023931, &
-0.005147, -0.005455, 0.023931, &
-0.003750, -0.006495, 0.023931, &
0.032819, -0.023750, 0.023931, &
0.032819, 0.023750, 0.023931, &
-0.003750, 0.006495, 0.023931 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.part5.mar4
entity attributes entity_name=.sliderActuator.part5.delta1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.part5.delta1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.part5.delta2 reference_marker=.sliderActuator.part5.mar4  points_for_profile= &
-0.003750, 0.006495, -0.028619, &
-0.005147, 0.005455, -0.028619, &
-0.006266, 0.004121, -0.028619, &
-0.007048, 0.002565, -0.028619, &
-0.007449, 0.000871, -0.028619, &
-0.007449, -0.000871, -0.028619, &
-0.007048, -0.002565, -0.028619, &
-0.006266, -0.004121, -0.028619, &
-0.005147, -0.005455, -0.028619, &
-0.003750, -0.006495, -0.028619, &
0.032819, -0.023750, -0.028619, &
0.032819, 0.023750, -0.028619, &
-0.003750, 0.006495, -0.028619 &
length_along_z_axis=0.004688 analytical=yes &
relative_to=.sliderActuator.part5.mar4
entity attributes entity_name=.sliderActuator.part5.delta2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.part5.delta2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.part5.platefront reference_marker=.sliderActuator.part5.mar5  points_for_profile= &
0.032819, -0.028619, 0.021667, &
0.081297, -0.005303, 0.021667, &
0.082138, -0.004302, 0.021667, &
0.082791, -0.003170, 0.021667, &
0.083239, -0.001941, 0.021667, &
0.083466, -0.000654, 0.021667, &
0.083466, 0.000654, 0.021667, &
0.083239, 0.001941, 0.021667, &
0.082791, 0.003170, 0.021667, &
0.082138, 0.004302, 0.021667, &
0.081297, 0.005303, 0.021667, &
0.032819, 0.028619, 0.021667, &
0.032819, -0.028619, 0.021667 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.part5.mar5
entity attributes entity_name=.sliderActuator.part5.platefront type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.part5.platefront render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.part5.plateback reference_marker=.sliderActuator.part5.mar5  points_for_profile= &
0.032819, -0.028619, -0.023750, &
0.081297, -0.005303, -0.023750, &
0.082138, -0.004302, -0.023750, &
0.082791, -0.003170, -0.023750, &
0.083239, -0.001941, -0.023750, &
0.083466, -0.000654, -0.023750, &
0.083466, 0.000654, -0.023750, &
0.083239, 0.001941, -0.023750, &
0.082791, 0.003170, -0.023750, &
0.082138, 0.004302, -0.023750, &
0.081297, 0.005303, -0.023750, &
0.032819, 0.028619, -0.023750, &
0.032819, -0.028619, -0.023750 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.part5.mar5
entity attributes entity_name=.sliderActuator.part5.plateback type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.part5.plateback render=filled
part mod rigid_body mass_properties part_name=.sliderActuator.part5 material_type = steel
entity attributes entity_name=.sliderActuator.part5.delta1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.part5.delta2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.part5.platefront visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.part5.plateback visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.J27 i_marker_name=.sliderActuator.part5.J27_marI j_marker_name=.sliderActuator.DeltaF4.J27_marJ
constraint create motion_generator axis=b3 motion_name=.sliderActuator.motion3 i_marker_name=.sliderActuator.part5.J27_marI j_marker_name=.sliderActuator.DeltaF4.J27_marJ time_derivative=displacement function="(90*sin(TIME/5.0*PI*2))*0d"
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_Brace
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_Brace material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_Brace visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_Brace.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_Brace.LeftRevJ_marI location=0.000000, 0.000000, 0.000000 orientation=9.712872, 0.000000, 0.000000 relative_to=.sliderActuator.part5.mar6 

entity attributes entity_name=.sliderActuator.SLM33_Brace.LeftRevJ_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_Brace.braceGeo location=0.000000, 0.016667, 0.000000 orientation=90.000000, -90.000000, -90.000000 relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI 

entity attributes entity_name=.sliderActuator.SLM33_Brace.braceGeo visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.halfBracef reference_marker=.sliderActuator.SLM33_Brace.braceGeo  points_for_profile= &
0.003333, -0.011250, -0.003333, &
0.011250, -0.011250, -0.003333, &
0.011250, 0.011250, -0.003333, &
0.003333, 0.011250, -0.003333, &
0.003333, 0.013333, -0.003333, &
0.013333, 0.013333, -0.003333, &
0.013333, -0.013333, -0.003333, &
0.003333, -0.013333, -0.003333, &
0.003333, -0.011250, -0.003333 &
length_along_z_axis=0.040000 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBracef type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.halfBracef render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.halfBraceb reference_marker=.sliderActuator.SLM33_Brace.braceGeo  points_for_profile= &
-0.003333, -0.011250, -0.003333, &
-0.011250, -0.011250, -0.003333, &
-0.011250, 0.011250, -0.003333, &
-0.003333, 0.011250, -0.003333, &
-0.003333, 0.013333, -0.003333, &
-0.013333, 0.013333, -0.003333, &
-0.013333, -0.013333, -0.003333, &
-0.003333, -0.013333, -0.003333, &
-0.003333, -0.011250, -0.003333 &
length_along_z_axis=0.040000 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBraceb type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.halfBraceb render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.halfBracef1 reference_marker=.sliderActuator.SLM33_Brace.braceGeo  points_for_profile= &
0.003333, -0.007083, -0.084827, &
0.005000, -0.007083, -0.084827, &
0.005000, 0.011250, -0.084827, &
0.003333, 0.007083, -0.084827, &
0.003333, 0.013333, -0.084827, &
0.007083, 0.013333, -0.084827, &
0.007083, -0.013333, -0.084827, &
0.003333, -0.013333, -0.084827, &
0.003333, -0.007083, -0.084827 &
length_along_z_axis=0.081493 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBracef1 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.halfBracef1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.halfBraceb1 reference_marker=.sliderActuator.SLM33_Brace.braceGeo  points_for_profile= &
-0.003333, -0.007083, -0.084827, &
-0.005000, -0.007083, -0.084827, &
-0.005000, 0.011250, -0.084827, &
-0.003333, 0.007083, -0.084827, &
-0.003333, 0.013333, -0.084827, &
-0.007083, 0.013333, -0.084827, &
-0.007083, -0.013333, -0.084827, &
-0.003333, -0.013333, -0.084827, &
-0.003333, -0.007083, -0.084827 &
length_along_z_axis=0.081493 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBraceb1 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.halfBraceb1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.halfBrace2 reference_marker=.sliderActuator.SLM33_Brace.braceGeo  points_for_profile= &
-0.007083, 0.000000, -0.123333, &
-0.005000, 0.000000, -0.123333, &
-0.005000, 0.011250, -0.123333, &
0.005000, 0.011250, -0.123333, &
0.005000, 0.000000, -0.123333, &
0.007083, 0.000000, -0.123333, &
0.007083, 0.013333, -0.123333, &
-0.007083, 0.013333, -0.123333, &
-0.007083, 0.000000, -0.123333 &
length_along_z_axis=0.038507 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.braceGeo
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBrace2 type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.halfBrace2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.frontEarL reference_marker=.sliderActuator.SLM33_Brace.LeftRevJ_marI  points_for_profile= &
-0.003333, 0.000000, 0.006667, &
-0.003132, -0.001140, 0.006667, &
-0.002553, -0.002143, 0.006667, &
-0.001667, -0.002887, 0.006667, &
-0.000579, -0.003283, 0.006667, &
0.000579, -0.003283, 0.006667, &
0.001667, -0.002887, 0.006667, &
0.002553, -0.002143, 0.006667, &
0.003132, -0.001140, 0.006667, &
0.003333, -0.000000, 0.006667, &
0.003333, 0.003333, 0.006667, &
-0.003333, 0.003333, 0.006667, &
-0.003333, 0.000000, 0.006667 &
length_along_z_axis=0.006667 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM33_Brace.frontEarL type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.frontEarL render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.BackEarL reference_marker=.sliderActuator.SLM33_Brace.LeftRevJ_marI  points_for_profile= &
-0.003333, 0.000000, -0.013333, &
-0.003132, -0.001140, -0.013333, &
-0.002553, -0.002143, -0.013333, &
-0.001667, -0.002887, -0.013333, &
-0.000579, -0.003283, -0.013333, &
0.000579, -0.003283, -0.013333, &
0.001667, -0.002887, -0.013333, &
0.002553, -0.002143, -0.013333, &
0.003132, -0.001140, -0.013333, &
0.003333, -0.000000, -0.013333, &
0.003333, 0.003333, -0.013333, &
-0.003333, 0.003333, -0.013333, &
-0.003333, 0.000000, -0.013333 &
length_along_z_axis=0.006667 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM33_Brace.BackEarL type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.BackEarL render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.BackEarR reference_marker=.sliderActuator.SLM33_Brace.LeftRevJ_marI  points_for_profile= &
0.054827, 0.033333, -0.011250, &
0.054626, 0.034473, -0.011250, &
0.054047, 0.035476, -0.011250, &
0.053160, 0.036220, -0.011250, &
0.052072, 0.036616, -0.011250, &
0.050915, 0.036616, -0.011250, &
0.049827, 0.036220, -0.011250, &
0.048940, 0.035476, -0.011250, &
0.048361, 0.034473, -0.011250, &
0.048160, 0.033333, -0.011250, &
0.048160, 0.030000, -0.011250, &
0.054827, 0.030000, -0.011250, &
0.054827, 0.033333, -0.011250 &
length_along_z_axis=0.007500 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM33_Brace.BackEarR type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.BackEarR render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.FrontEarR reference_marker=.sliderActuator.SLM33_Brace.LeftRevJ_marI  points_for_profile= &
0.054827, 0.033333, 0.003750, &
0.054626, 0.034473, 0.003750, &
0.054047, 0.035476, 0.003750, &
0.053160, 0.036220, 0.003750, &
0.052072, 0.036616, 0.003750, &
0.050915, 0.036616, 0.003750, &
0.049827, 0.036220, 0.003750, &
0.048940, 0.035476, 0.003750, &
0.048361, 0.034473, 0.003750, &
0.048160, 0.033333, 0.003750, &
0.048160, 0.030000, 0.003750, &
0.054827, 0.030000, 0.003750, &
0.054827, 0.033333, 0.003750 &
length_along_z_axis=0.007500 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM33_Brace.FrontEarR type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.FrontEarR render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.BackEarF reference_marker=.sliderActuator.SLM33_Brace.LeftRevJ_marI  points_for_profile= &
0.123333, 0.033333, -0.007083, &
0.123132, 0.034473, -0.007083, &
0.122553, 0.035476, -0.007083, &
0.121667, 0.036220, -0.007083, &
0.120579, 0.036616, -0.007083, &
0.119421, 0.036616, -0.007083, &
0.118333, 0.036220, -0.007083, &
0.117447, 0.035476, -0.007083, &
0.116868, 0.034473, -0.007083, &
0.116667, 0.033333, -0.007083, &
0.116667, 0.030000, -0.007083, &
0.123333, 0.030000, -0.007083, &
0.123333, 0.033333, -0.007083 &
length_along_z_axis=0.003333 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM33_Brace.BackEarF type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.BackEarF render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_Brace.FrontEarF reference_marker=.sliderActuator.SLM33_Brace.LeftRevJ_marI  points_for_profile= &
0.123333, 0.033333, 0.003750, &
0.123132, 0.034473, 0.003750, &
0.122553, 0.035476, 0.003750, &
0.121667, 0.036220, 0.003750, &
0.120579, 0.036616, 0.003750, &
0.119421, 0.036616, 0.003750, &
0.118333, 0.036220, 0.003750, &
0.117447, 0.035476, 0.003750, &
0.116868, 0.034473, 0.003750, &
0.116667, 0.033333, 0.003750, &
0.116667, 0.030000, 0.003750, &
0.123333, 0.030000, 0.003750, &
0.123333, 0.033333, 0.003750 &
length_along_z_axis=0.003333 analytical=yes &
relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI
entity attributes entity_name=.sliderActuator.SLM33_Brace.FrontEarF type_filter=Extrusion visibility=on color=.colors.YELLOW entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_Brace.FrontEarF render=filled
marker create marker_name=.sliderActuator.SLM33_Brace.part2_bracef_marI location=0.051493, 0.033333, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Brace.part2_bracef_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_Brace.part2_braceb_marI location=0.051493, 0.033333, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Brace.part2_braceb_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_Brace.crank_brace_f_marJ location=0.120000, 0.033333, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Brace.crank_brace_f_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_Brace material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBracef visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBraceb visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBracef1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBraceb1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.halfBrace2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.frontEarL visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.BackEarL visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.BackEarR visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.FrontEarR visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.BackEarF visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Brace.FrontEarF visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_LeftRevJ i_marker_name=.sliderActuator.SLM33_Brace.LeftRevJ_marI j_marker_name=.sliderActuator.part5.LeftRevJ_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_slider
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_slider material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_slider visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_slider.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_slider.slide_BaseMar location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM33_Brace.braceGeo 

entity attributes entity_name=.sliderActuator.SLM33_slider.slide_BaseMar visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_slider.slider reference_marker=.sliderActuator.SLM33_slider.slide_BaseMar  points_for_profile= &
0.005000, 0.009167, -0.040000, &
0.003333, 0.009167, -0.040000, &
0.003333, 0.013333, -0.040000, &
-0.003333, 0.013333, -0.040000, &
-0.003333, 0.009167, -0.040000, &
-0.005000, 0.009167, -0.040000, &
-0.005000, -0.013333, -0.040000, &
0.005000, -0.013333, -0.040000, &
0.005000, 0.009167, -0.040000 &
length_along_z_axis=0.006667 analytical=yes &
relative_to=.sliderActuator.SLM33_slider.slide_BaseMar
entity attributes entity_name=.sliderActuator.SLM33_slider.slider type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_slider.slider render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_slider.slider1 reference_marker=.sliderActuator.SLM33_slider.slide_BaseMar  points_for_profile= &
-0.003333, 0.011250, -0.033333, &
0.003333, 0.011250, -0.033333, &
0.003333, 0.013333, -0.033333, &
-0.003333, 0.013333, -0.033333, &
-0.003333, 0.011250, -0.033333 &
length_along_z_axis=0.036667 analytical=yes &
relative_to=.sliderActuator.SLM33_slider.slide_BaseMar
entity attributes entity_name=.sliderActuator.SLM33_slider.slider1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_slider.slider1 render=filled
marker create marker_name=.sliderActuator.SLM33_slider.toLinkL_F location=0.000000, 0.033333, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.SLM33_Brace.LeftRevJ_marI 

entity attributes entity_name=.sliderActuator.SLM33_slider.toLinkL_F visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_slider.slider2 reference_marker=.sliderActuator.SLM33_slider.toLinkL_F  points_for_profile= &
0.033333, -0.030000, -0.003333, &
0.033333, -0.033333, -0.003333, &
0.033534, -0.034473, -0.003333, &
0.034113, -0.035476, -0.003333, &
0.035000, -0.036220, -0.003333, &
0.036088, -0.036616, -0.003333, &
0.037245, -0.036616, -0.003333, &
0.038333, -0.036220, -0.003333, &
0.039220, -0.035476, -0.003333, &
0.039799, -0.034473, -0.003333, &
0.040000, -0.033333, -0.003333, &
0.040000, -0.030000, -0.003333, &
0.033333, -0.030000, -0.003333 &
length_along_z_axis=0.006667 analytical=yes &
relative_to=.sliderActuator.SLM33_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM33_slider.slider2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_slider.slider2 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_slider.slider3 reference_marker=.sliderActuator.SLM33_slider.toLinkL_F  points_for_profile= &
0.038333, -0.033333, -0.007083, &
0.038064, -0.032426, -0.007083, &
0.037345, -0.031811, -0.007083, &
0.036406, -0.031687, -0.007083, &
0.035551, -0.032095, -0.007083, &
0.035057, -0.032902, -0.007083, &
0.035082, -0.033848, -0.007083, &
0.035618, -0.034629, -0.007083, &
0.036492, -0.034991, -0.007083, &
0.037423, -0.034818, -0.007083, &
0.038110, -0.034167, -0.007083, &
0.038333, -0.033333, -0.007083 &
length_along_z_axis=0.014167 analytical=yes &
relative_to=.sliderActuator.SLM33_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM33_slider.slider3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_slider.slider3 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_slider.slider4 reference_marker=.sliderActuator.SLM33_slider.toLinkL_F  points_for_profile= &
0.003333, 0.000000, -0.023750, &
0.002796, 0.001815, -0.023750, &
0.001356, 0.003045, -0.023750, &
-0.000521, 0.003292, -0.023750, &
-0.002230, 0.002477, -0.023750, &
-0.003220, 0.000863, -0.023750, &
-0.003170, -0.001030, -0.023750, &
-0.002098, -0.002590, -0.023750, &
-0.000348, -0.003315, -0.023750, &
0.001513, -0.002970, -0.023750, &
0.002887, -0.001667, -0.023750, &
0.003333, 0.000000, -0.023750 &
length_along_z_axis=0.047500 analytical=yes &
relative_to=.sliderActuator.SLM33_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM33_slider.slider4 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_slider.slider4 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_slider.slider5 reference_marker=.sliderActuator.SLM33_slider.toLinkL_F  points_for_profile= &
0.003333, 0.000000, -0.003333, &
0.003132, 0.001140, -0.003333, &
0.002553, 0.002143, -0.003333, &
0.001667, 0.002887, -0.003333, &
0.000579, 0.003283, -0.003333, &
-0.000579, 0.003283, -0.003333, &
-0.001667, 0.002887, -0.003333, &
-0.002553, 0.002143, -0.003333, &
-0.003132, 0.001140, -0.003333, &
-0.003333, 0.000000, -0.003333, &
-0.003333, -0.003333, -0.003333, &
0.003333, -0.003333, -0.003333, &
0.003333, 0.000000, -0.003333 &
length_along_z_axis=0.006667 analytical=yes &
relative_to=.sliderActuator.SLM33_slider.toLinkL_F
entity attributes entity_name=.sliderActuator.SLM33_slider.slider5 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_slider.slider5 render=filled
marker create marker_name=.sliderActuator.SLM33_slider.slider_linkF_marI location=0.000000, 0.033333, 0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_slider.slider_linkF_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_slider.slider_linkB_marJ location=0.000000, 0.033333, -0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_slider.slider_linkB_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_slider.slider_linkRF_marI location=0.036667, 0.000000, 0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_slider.slider_linkRF_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_slider.slider_linkRB_marI location=0.036667, 0.000000, -0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_slider.slider_linkRB_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_slider material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_slider.slider visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_slider.slider1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_slider.slider2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_slider.slider3 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_slider.slider4 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_slider.slider5 visibility=on color=WHITE

data_element create variable variable_name=.sliderActuator.SLM33_motionFunc function="(0.007413+sin(time/3*2*PI-0.199467)*0.037413)*0.000000"
constraint create joint translational joint_name=.sliderActuator.SLM33_SliderJoint i_marker_name=.sliderActuator.SLM33_slider.slide_BaseMar j_marker_name=.sliderActuator.SLM33_Brace.braceGeo
constraint create motion_generator motion_name=.sliderActuator.SLM33_SliderJoint_motion type_of_freedom=translational joint_name=.sliderActuator.SLM33_SliderJoint  function="-VARVAL(.sliderActuator.SLM33_motionFunc)"
measure create function measure=.sliderActuator.SLM33_ActForce function="-MOTION(.sliderActuator.SLM33_SliderJoint_motion, 0, 4, .sliderActuator.SLM33_Brace.braceGeo)" create_measure_display=no
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_LinkLF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkLF material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkLF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_LinkLF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_LinkLF.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkLF.LinkLF_endI location=0.000000, 0.033333, 0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_endI visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkLF.LinkLF_endJ location=-0.028868, 0.016667, 0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkLF.LinkLF_link_cyn1 reference_marker=.sliderActuator.SLM33_LinkLF.LinkLF_endI  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkLF.LinkLF_endI
entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkLF.LinkLF_link_cyn2 reference_marker=.sliderActuator.SLM33_LinkLF.LinkLF_endJ  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkLF.LinkLF_endJ
entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM33_LinkLF.LinkLF_link width=0.006000 depth=0.001667 i_marker=.sliderActuator.SLM33_LinkLF.LinkLF_endI j_marker=.sliderActuator.SLM33_LinkLF.LinkLF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_csg1 base_object=.sliderActuator.SLM33_LinkLF.LinkLF_link object=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_csg2 base_object=.sliderActuator.SLM33_LinkLF.LinkLF_link_csg1 object=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_LinkLF.slider_linkF_marJ location=0.000000, 0.033333, 0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLF.slider_linkF_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkLF.crank_linkLF_marJ location=-0.028868, 0.016667, 0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLF.crank_linkLF_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkLF material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkLF.LinkLF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_slider_linkF i_marker_name=.sliderActuator.SLM33_slider.slider_linkF_marI j_marker_name=.sliderActuator.SLM33_LinkLF.slider_linkF_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_crank_linkLF i_marker_name=.sliderActuator.part5.crank_linkLF_marI j_marker_name=.sliderActuator.SLM33_LinkLF.crank_linkLF_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_LinkLB
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkLB material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkLB visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_LinkLB.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_LinkLB.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkLB.LinkLB_endI location=0.000000, 0.033333, -0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_endI visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkLB.LinkLB_endJ location=-0.028868, 0.016667, -0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkLB.LinkLB_link_cyn1 reference_marker=.sliderActuator.SLM33_LinkLB.LinkLB_endI  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkLB.LinkLB_endI
entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkLB.LinkLB_link_cyn2 reference_marker=.sliderActuator.SLM33_LinkLB.LinkLB_endJ  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkLB.LinkLB_endJ
entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM33_LinkLB.LinkLB_link width=0.006000 depth=0.001667 i_marker=.sliderActuator.SLM33_LinkLB.LinkLB_endI j_marker=.sliderActuator.SLM33_LinkLB.LinkLB_endJ

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_csg1 base_object=.sliderActuator.SLM33_LinkLB.LinkLB_link object=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_csg2 base_object=.sliderActuator.SLM33_LinkLB.LinkLB_link_csg1 object=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_LinkLB.slider_linkB_marI location=0.000000, 0.033333, -0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLB.slider_linkB_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkLB.crank_linkLB_marJ location=-0.028868, 0.016667, -0.023750 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkLB.crank_linkLB_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkLB material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkLB.LinkLB_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_slider_linkB i_marker_name=.sliderActuator.SLM33_LinkLB.slider_linkB_marI j_marker_name=.sliderActuator.SLM33_slider.slider_linkB_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_crank_linkLB i_marker_name=.sliderActuator.part5.crank_linkLB_marI j_marker_name=.sliderActuator.SLM33_LinkLB.crank_linkLB_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_LinkRF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkRF material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkRF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_LinkRF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_LinkRF.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkRF.LinkRF_endI location=0.036667, 0.000000, 0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_endI visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkRF.LinkRF_endJ location=0.069571, 0.005328, 0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkRF.LinkRF_link_cyn1 reference_marker=.sliderActuator.SLM33_LinkRF.LinkRF_endI  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkRF.LinkRF_endI
entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkRF.LinkRF_link_cyn2 reference_marker=.sliderActuator.SLM33_LinkRF.LinkRF_endJ  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkRF.LinkRF_endJ
entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM33_LinkRF.LinkRF_link width=0.006000 depth=0.001667 i_marker=.sliderActuator.SLM33_LinkRF.LinkRF_endI j_marker=.sliderActuator.SLM33_LinkRF.LinkRF_endJ

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_csg1 base_object=.sliderActuator.SLM33_LinkRF.LinkRF_link object=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_csg2 base_object=.sliderActuator.SLM33_LinkRF.LinkRF_link_csg1 object=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_LinkRF.slider_linkRF_marJ location=0.036667, 0.000000, 0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRF.slider_linkRF_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkRF.RevRJF_marJ location=0.069571, 0.005328, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRF.RevRJF_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkRF material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkRF.LinkRF_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_slider_linkRF i_marker_name=.sliderActuator.SLM33_slider.slider_linkRF_marI j_marker_name=.sliderActuator.SLM33_LinkRF.slider_linkRF_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_LinkRB
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkRB material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkRB visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_LinkRB.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_LinkRB.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkRB.LinkRB_endI location=0.036667, 0.000000, -0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_endI visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkRB.LinkRB_endJ location=0.069571, 0.005328, -0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkRB.LinkRB_link_cyn1 reference_marker=.sliderActuator.SLM33_LinkRB.LinkRB_endI  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkRB.LinkRB_endI
entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_LinkRB.LinkRB_link_cyn2 reference_marker=.sliderActuator.SLM33_LinkRB.LinkRB_endJ  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_LinkRB.LinkRB_endJ
entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM33_LinkRB.LinkRB_link width=0.006000 depth=0.001667 i_marker=.sliderActuator.SLM33_LinkRB.LinkRB_endI j_marker=.sliderActuator.SLM33_LinkRB.LinkRB_endJ

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_csg1 base_object=.sliderActuator.SLM33_LinkRB.LinkRB_link object=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_csg2 base_object=.sliderActuator.SLM33_LinkRB.LinkRB_link_csg1 object=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_LinkRB.slider_linkRB_marJ location=0.036667, 0.000000, -0.008125 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRB.slider_linkRB_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_LinkRB.RevRJB_marJ location=0.069571, 0.005328, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_LinkRB.RevRJB_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_LinkRB material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_LinkRB.LinkRB_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_slider_linkRB i_marker_name=.sliderActuator.SLM33_slider.slider_linkRB_marI j_marker_name=.sliderActuator.SLM33_LinkRB.slider_linkRB_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_Part2
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_Part2 material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_Part2 visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_Part2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_Part2.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.RevRJF_marI location=0.069571, 0.005328, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.RevRJF_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.RevRJB_marI location=0.069571, 0.005328, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.RevRJB_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.part2_bracef_marJ location=0.051493, 0.033333, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.part2_bracef_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.part2_braceb_marJ location=0.051493, 0.033333, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.part2_braceb_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.trianglefplatem1 location=0.051493, 0.033333, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglefplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.trianglefplatem2 location=0.050406, 0.000018, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglefplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.trianglefplatem3 location=0.069571, 0.005328, 0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglefplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM33_Part2.trianglef marker_name=.sliderActuator.SLM33_Part2.trianglefplatem1, .sliderActuator.SLM33_Part2.trianglefplatem2, .sliderActuator.SLM33_Part2.trianglefplatem3 radius=0.003333 width=0.002083

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglef type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_Part2.trianglebplatem1 location=0.051493, 0.033333, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglebplatem1 visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.trianglebplatem2 location=0.050406, 0.000018, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglebplatem2 visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.trianglebplatem3 location=0.069571, 0.005328, -0.012292 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglebplatem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM33_Part2.triangleb marker_name=.sliderActuator.SLM33_Part2.trianglebplatem1, .sliderActuator.SLM33_Part2.trianglebplatem2, .sliderActuator.SLM33_Part2.trianglebplatem3 radius=0.003333 width=0.002083

entity attributes entity_name=.sliderActuator.SLM33_Part2.triangleb type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_Part2.part2_distalLinkf_marI location=0.050406, 0.000018, 0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.part2_distalLinkf_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_Part2.part2_distalLinkb_marI location=0.050406, 0.000018, -0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_Part2.part2_distalLinkb_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_Part2 material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_Part2.trianglef visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_Part2.triangleb visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_RevRJF i_marker_name=.sliderActuator.SLM33_Part2.RevRJF_marI j_marker_name=.sliderActuator.SLM33_LinkRF.RevRJF_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_RevRJB i_marker_name=.sliderActuator.SLM33_Part2.RevRJB_marI j_marker_name=.sliderActuator.SLM33_LinkRB.RevRJB_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_part2_bracef i_marker_name=.sliderActuator.SLM33_Brace.part2_bracef_marI j_marker_name=.sliderActuator.SLM33_Part2.part2_bracef_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_part2_braceb i_marker_name=.sliderActuator.SLM33_Brace.part2_braceb_marI j_marker_name=.sliderActuator.SLM33_Part2.part2_braceb_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_CrankFF
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_CrankFF material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_CrankFF visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_CrankFF.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.trianglef1platem1 location=0.120000, 0.033333, 0.018542 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.trianglef1platem1 visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.trianglef1platem2 location=0.118913, 0.000018, 0.018542 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.trianglef1platem2 visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.trianglef1platem3 location=0.155522, 0.014944, 0.018542 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.trianglef1platem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM33_CrankFF.trianglef1 marker_name=.sliderActuator.SLM33_CrankFF.trianglef1platem1, .sliderActuator.SLM33_CrankFF.trianglef1platem2, .sliderActuator.SLM33_CrankFF.trianglef1platem3 radius=0.003333 width=0.002083

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.trianglef1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_CrankFF.triangleb1platem1 location=0.120000, 0.033333, -0.018542 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.triangleb1platem1 visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.triangleb1platem2 location=0.118913, 0.000018, -0.018542 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.triangleb1platem2 visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.triangleb1platem3 location=0.155522, 0.014944, -0.018542 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.triangleb1platem3 visibility=on
geom create shape plate plate=.sliderActuator.SLM33_CrankFF.triangleb1 marker_name=.sliderActuator.SLM33_CrankFF.triangleb1platem1, .sliderActuator.SLM33_CrankFF.triangleb1platem2, .sliderActuator.SLM33_CrankFF.triangleb1platem3 radius=0.003333 width=0.002083

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.triangleb1 type_filter=plate visibility=on color=.colors.WHITE entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_CrankFF.crank_brace_f_marI location=0.120000, 0.033333, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.crank_brace_f_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.centM location=0.120000, 0.033333, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.centM visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_CrankFF.connectRod reference_marker=.sliderActuator.SLM33_CrankFF.centM  points_for_profile= &
0.001667, 0.000000, -0.023750, &
0.001398, 0.000908, -0.023750, &
0.000678, 0.001523, -0.023750, &
-0.000261, 0.001646, -0.023750, &
-0.001115, 0.001239, -0.023750, &
-0.001610, 0.000431, -0.023750, &
-0.001585, -0.000515, -0.023750, &
-0.001049, -0.001295, -0.023750, &
-0.000174, -0.001658, -0.023750, &
0.000757, -0.001485, -0.023750, &
0.001443, -0.000833, -0.023750, &
0.001667, 0.000000, -0.023750 &
length_along_z_axis=0.047500 analytical=yes &
relative_to=.sliderActuator.SLM33_CrankFF.centM
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.connectRod type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_CrankFF.connectRod render=filled
marker create marker_name=.sliderActuator.SLM33_CrankFF.centM1 location=0.118913, 0.000018, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.centM1 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_CrankFF.connectRod2 reference_marker=.sliderActuator.SLM33_CrankFF.centM1  points_for_profile= &
0.001667, 0.000000, -0.019583, &
0.001398, 0.000908, -0.019583, &
0.000678, 0.001523, -0.019583, &
-0.000261, 0.001646, -0.019583, &
-0.001115, 0.001239, -0.019583, &
-0.001610, 0.000431, -0.019583, &
-0.001585, -0.000515, -0.019583, &
-0.001049, -0.001295, -0.019583, &
-0.000174, -0.001658, -0.019583, &
0.000757, -0.001485, -0.019583, &
0.001443, -0.000833, -0.019583, &
0.001667, 0.000000, -0.019583 &
length_along_z_axis=0.039167 analytical=yes &
relative_to=.sliderActuator.SLM33_CrankFF.centM1
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.connectRod2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_CrankFF.connectRod2 render=filled
marker create marker_name=.sliderActuator.SLM33_CrankFF.centM2 location=0.155522, 0.014944, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.centM2 visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_CrankFF.connectRod3 reference_marker=.sliderActuator.SLM33_CrankFF.centM2  points_for_profile= &
0.001667, 0.000000, -0.019583, &
0.001398, 0.000908, -0.019583, &
0.000678, 0.001523, -0.019583, &
-0.000261, 0.001646, -0.019583, &
-0.001115, 0.001239, -0.019583, &
-0.001610, 0.000431, -0.019583, &
-0.001585, -0.000515, -0.019583, &
-0.001049, -0.001295, -0.019583, &
-0.000174, -0.001658, -0.019583, &
0.000757, -0.001485, -0.019583, &
0.001443, -0.000833, -0.019583, &
0.001667, 0.000000, -0.019583 &
length_along_z_axis=0.039167 analytical=yes &
relative_to=.sliderActuator.SLM33_CrankFF.centM2
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.connectRod3 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_CrankFF.connectRod3 render=filled
marker create marker_name=.sliderActuator.SLM33_CrankFF.crank_distalLinkf_marI location=0.118913, 0.000018, 0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.crank_distalLinkf_marI visibility=on
marker create marker_name=.sliderActuator.SLM33_CrankFF.crank_distalLinkb_marI location=0.118913, 0.000018, -0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_CrankFF.crank_distalLinkb_marI visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_CrankFF material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.trianglef1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.triangleb1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.connectRod visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.connectRod2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_CrankFF.connectRod3 visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_crank_brace_f i_marker_name=.sliderActuator.SLM33_CrankFF.crank_brace_f_marI j_marker_name=.sliderActuator.SLM33_Brace.crank_brace_f_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_distalLinkf
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_distalLinkf material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_distalLinkf visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_distalLinkf.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_endI location=0.050406, 0.000018, 0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_endI visibility=on
marker create marker_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_endJ location=0.118913, 0.000018, 0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn1 reference_marker=.sliderActuator.SLM33_distalLinkf.distalLinkf_endI  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_distalLinkf.distalLinkf_endI
entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn2 reference_marker=.sliderActuator.SLM33_distalLinkf.distalLinkf_endJ  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_distalLinkf.distalLinkf_endJ
entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link width=0.006000 depth=0.001667 i_marker=.sliderActuator.SLM33_distalLinkf.distalLinkf_endI j_marker=.sliderActuator.SLM33_distalLinkf.distalLinkf_endJ

geometry create shape csg csg_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_csg1 base_object=.sliderActuator.SLM33_distalLinkf.distalLinkf_link object=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_csg2 base_object=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_csg1 object=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_distalLinkf.crank_distalLinkf_marJ location=0.118913, 0.000018, 0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.crank_distalLinkf_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_distalLinkf.part2_distalLinkf_marJ location=0.050406, 0.000018, 0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.part2_distalLinkf_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_distalLinkf material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_distalLinkf.distalLinkf_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_crank_distalLinkf i_marker_name=.sliderActuator.SLM33_CrankFF.crank_distalLinkf_marI j_marker_name=.sliderActuator.SLM33_distalLinkf.crank_distalLinkf_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_part2_distalLinkf i_marker_name=.sliderActuator.SLM33_Part2.part2_distalLinkf_marI j_marker_name=.sliderActuator.SLM33_distalLinkf.part2_distalLinkf_marJ
part create rigid_body name_and_position part_name=.sliderActuator.SLM33_distalLinkb
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_distalLinkb material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_distalLinkb visibility=on color=WHITE

marker create marker_name=.sliderActuator.SLM33_distalLinkb.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.cm visibility=on
marker create marker_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_endI location=0.050406, 0.000018, -0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_endI visibility=on
marker create marker_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_endJ location=0.118913, 0.000018, -0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_endJ visibility=on
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn1 reference_marker=.sliderActuator.SLM33_distalLinkb.distalLinkb_endI  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_distalLinkb.distalLinkb_endI
entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn1 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn1 render=filled
geometry create shape extrusion extrusion_name = .sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn2 reference_marker=.sliderActuator.SLM33_distalLinkb.distalLinkb_endJ  points_for_profile= &
0.005000, 0.000000, -0.001042, &
0.004193, 0.002723, -0.001042, &
0.002034, 0.004568, -0.001042, &
-0.000782, 0.004938, -0.001042, &
-0.003346, 0.003716, -0.001042, &
-0.004830, 0.001294, -0.001042, &
-0.004755, -0.001545, -0.001042, &
-0.003147, -0.003886, -0.001042, &
-0.000523, -0.004973, -0.001042, &
0.002270, -0.004455, -0.001042, &
0.004330, -0.002500, -0.001042, &
0.005000, 0.000000, -0.001042 &
length_along_z_axis=0.002083 analytical=yes &
relative_to=.sliderActuator.SLM33_distalLinkb.distalLinkb_endJ
entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn2 type_filter=Extrusion visibility=on color=.colors.WHITE entity_scope=all_color
geometry attributes geometry=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn2 render=filled
geometry create shape link link_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link width=0.006000 depth=0.001667 i_marker=.sliderActuator.SLM33_distalLinkb.distalLinkb_endI j_marker=.sliderActuator.SLM33_distalLinkb.distalLinkb_endJ

geometry create shape csg csg_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_csg1 base_object=.sliderActuator.SLM33_distalLinkb.distalLinkb_link object=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn1 type=union

geometry create shape csg csg_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_csg2 base_object=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_csg1 object=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn2 type=union


entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_csg2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
marker create marker_name=.sliderActuator.SLM33_distalLinkb.crank_distalLinkb_marJ location=0.118913, 0.000018, -0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.crank_distalLinkb_marJ visibility=on
marker create marker_name=.sliderActuator.SLM33_distalLinkb.part2_distalLinkb_marJ location=0.050406, 0.000018, -0.014375 orientation=0.000000, 0.000000, 0.000000 relative_to=.sliderActuator.part5.LeftRevJ_marJ 

entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.part2_distalLinkb_marJ visibility=on
part mod rigid_body mass_properties part_name=.sliderActuator.SLM33_distalLinkb material_type = steel
entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn1 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link_cyn2 visibility=on color=WHITE
entity attributes entity_name=.sliderActuator.SLM33_distalLinkb.distalLinkb_link visibility=on color=WHITE

constraint create joint revolute joint_name=.sliderActuator.SLM33_crank_distalLinkb i_marker_name=.sliderActuator.SLM33_CrankFF.crank_distalLinkb_marI j_marker_name=.sliderActuator.SLM33_distalLinkb.crank_distalLinkb_marJ
constraint create joint revolute joint_name=.sliderActuator.SLM33_part2_distalLinkb i_marker_name=.sliderActuator.SLM33_Part2.part2_distalLinkb_marI j_marker_name=.sliderActuator.SLM33_distalLinkb.part2_distalLinkb_marJ

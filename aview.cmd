default units len=mm mass=kg force=newton
model create model=.Robot fit_to_view=no
part attrib part_name=ground name_vis=off
part modify rigid_body mass_properties part_name=ground material=.materials.steel
force create body gravitational gravity=gravity x_comp=0.000000 y_comp=-9806.650000 z_comp=0.000000
default attr size_of_icon=10.000000 
model attr model=.Robot size_of_icon=10.000000
output set results model = .Robot formatted = off
 output set results model =.Robot xrf = off
int dialog dis dialog=.gui.moag
simulation set choice=cplusplus
defaults command_file on_error = ignore_command echo_commands = off update_screen = off
executive set numerical model = .Robot integrator = hht
executive set numerical model = .Robot hmax = 1.0e-3
marker create marker_name=.Robot.ground.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ground.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ground.aligned location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, -90.000000 relative_to=ground 

entity attributes entity_name=.Robot.ground.aligned visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ground.RobotBase location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ground.RobotBase visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ground.boxBot location=0.000000, 0.000000, -134.160000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ground.RobotBase 

entity attributes entity_name=.Robot.ground.boxBot visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ground.baseboxMar location=-75.000000, -75.000000, -0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ground.boxBot 

entity attributes entity_name=.Robot.ground.baseboxMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape block block_name=.Robot.ground.basebox diag_corner_coords=(150.000000), (150.000000), (37.500000) corner_marker=.Robot.ground.baseboxMar

entity attributes entity_name=.Robot.ground.basebox type_filter=Block visibility=on color=.colors.WHITE entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ground.groundJ location=0.000000, 0.000000, 37.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ground.boxBot 

entity attributes entity_name=.Robot.ground.groundJ visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.rot_base
part mod rigid_body mass_properties part_name=.Robot.rot_base material_type = steel

marker create marker_name=.Robot.rot_base.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.rot_base.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.baseI location=0.000000, 0.000000, 37.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ground.boxBot 

entity attributes entity_name=.Robot.rot_base.baseI visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.rot_base.disk length=7.500000 radius=106.066017  angle=359.0 center_marker=.Robot.rot_base.baseI

entity attributes entity_name=.Robot.rot_base.disk type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.z2you location=0.000000, 0.000000, 0.000000 orientation=0.000000, 90.000000, 0.000000 relative_to=.Robot.ground.RobotBase 

entity attributes entity_name=.Robot.rot_base.z2you visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceF location=0.000000, 0.000000, 52.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.z2you 

entity attributes entity_name=.Robot.rot_base.braceF visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.rot_base.braceFront reference_marker=.Robot.rot_base.braceF  points_for_profile= &
-75.000000, -89.160000, -7.500000, &
-45.000000, -89.160000, -7.500000, &
-45.000000, 0.000000, -7.500000, &
45.000000, 0.000000, -7.500000, &
45.000000, -89.160000, -7.500000, &
75.000000, -89.160000, -7.500000, &
75.000000, 0.000000, -7.500000, &
74.711779, 2.926355, -7.500000, &
73.858193, 5.740251, -7.500000, &
72.472044, 8.333553, -7.500000, &
70.606602, 10.606602, -7.500000, &
-14.246212, 95.459415, -7.500000, &
-16.793320, 97.503685, -7.500000, &
-19.722512, 98.948203, -7.500000, &
-22.894921, 99.724487, -7.500000, &
-26.160150, 99.795734, -7.500000, &
-29.363401, 99.158568, -7.500000, &
-32.352814, 97.843195, -7.500000, &
-34.986667, 95.911974, -7.500000, &
-37.140094, 93.456460, -7.500000, &
-38.711007, 90.593065, -7.500000, &
-73.858193, 5.740251, -7.500000, &
-74.354105, 4.354270, -7.500000, &
-74.711779, 2.926355, -7.500000, &
-74.927771, 1.470257, -7.500000, &
-75.000000, 0.000000, -7.500000, &
-75.000000, -89.160000, -7.500000 &
length_along_z_axis=15.000000 analytical=yes &
relative_to=.Robot.rot_base.braceF
entity attributes entity_name=.Robot.rot_base.braceFront type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.rot_base.braceFront render=filled
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceFR location=60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 45.000000 relative_to=.Robot.rot_base.braceF 

entity attributes entity_name=.Robot.rot_base.braceFR visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceFU location=-24.852814, 84.852814, 0.000000 orientation=0.000000, 0.000000, 45.000000 relative_to=.Robot.rot_base.braceF 

entity attributes entity_name=.Robot.rot_base.braceFU visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceFL location=-60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.braceF 

entity attributes entity_name=.Robot.rot_base.braceFL visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceB location=0.000000, 0.000000, -52.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.z2you 

entity attributes entity_name=.Robot.rot_base.braceB visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.rot_base.braceback reference_marker=.Robot.rot_base.braceB  points_for_profile= &
-75.000000, -89.160000, -7.500000, &
-45.000000, -89.160000, -7.500000, &
-45.000000, 0.000000, -7.500000, &
45.000000, 0.000000, -7.500000, &
45.000000, -89.160000, -7.500000, &
75.000000, -89.160000, -7.500000, &
75.000000, 0.000000, -7.500000, &
74.711779, 2.926355, -7.500000, &
73.858193, 5.740251, -7.500000, &
72.472044, 8.333553, -7.500000, &
70.606602, 10.606602, -7.500000, &
-14.246212, 95.459415, -7.500000, &
-16.793320, 97.503685, -7.500000, &
-19.722512, 98.948203, -7.500000, &
-22.894921, 99.724487, -7.500000, &
-26.160150, 99.795734, -7.500000, &
-29.363401, 99.158568, -7.500000, &
-32.352814, 97.843195, -7.500000, &
-34.986667, 95.911974, -7.500000, &
-37.140094, 93.456460, -7.500000, &
-38.711007, 90.593065, -7.500000, &
-73.858193, 5.740251, -7.500000, &
-74.354105, 4.354270, -7.500000, &
-74.711779, 2.926355, -7.500000, &
-74.927771, 1.470257, -7.500000, &
-75.000000, 0.000000, -7.500000, &
-75.000000, -89.160000, -7.500000 &
length_along_z_axis=15.000000 analytical=yes &
relative_to=.Robot.rot_base.braceB
entity attributes entity_name=.Robot.rot_base.braceback type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.rot_base.braceback render=filled
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceBR location=60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -45.000000 relative_to=.Robot.rot_base.braceB 

entity attributes entity_name=.Robot.rot_base.braceBR visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.rot_base.cynBR length=105.000000 radius=7.500000  angle=359.0 center_marker=.Robot.rot_base.braceBR

entity attributes entity_name=.Robot.rot_base.cynBR type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceBU location=-24.852814, 84.852814, 0.000000 orientation=0.000000, 0.000000, -45.000000 relative_to=.Robot.rot_base.braceB 

entity attributes entity_name=.Robot.rot_base.braceBU visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceBL location=-60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.braceB 

entity attributes entity_name=.Robot.rot_base.braceBL visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.disk_cne_mar location=60.000000, 0.000000, 54.000000 orientation=0.000000, 0.000000, 45.000000 relative_to=.Robot.rot_base.z2you 

entity attributes entity_name=.Robot.rot_base.disk_cne_mar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.baseMarkerI location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -29.173643 relative_to=.Robot.rot_base.disk_cne_mar 

entity attributes entity_name=.Robot.rot_base.baseMarkerI visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.tolink1 location=-103.920000, 60.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.baseMarkerI 

entity attributes entity_name=.Robot.rot_base.tolink1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.basemaralignedwithmar2_gnd location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.rot_base.baseMarkerI 

entity attributes entity_name=.Robot.rot_base.basemaralignedwithmar2_gnd visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.mar1_R location=-120.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.disk_cne_mar 

entity attributes entity_name=.Robot.rot_base.mar1_R visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.rot_base.triangle marker_name=.Robot.rot_base.basemaralignedwithmar2_gnd, .Robot.rot_base.tolink1, .Robot.rot_base.mar1_R radius=12.000000 width=12.000000
view zoom auto=on
marker create marker_name=.Robot.rot_base.brace2Paralnk1 location=0.000000, 0.000000, -11.250000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.braceFU 

entity attributes entity_name=.Robot.rot_base.brace2Paralnk1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.rot_base.braceToLnk2Mar location=-24.852814, -84.852814, -66.750000 orientation=0.000000, 0.000000, 29.712897 relative_to=ground 

entity attributes entity_name=.Robot.rot_base.braceToLnk2Mar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.rot_base material_type = steel
part mod rigid_body mass_properties part_name=.Robot.rot_base material_type = steel
part mod rigid_body mass_properties part_name=.Robot.rot_base material_type = steel
part mod rigid_body mass_properties part_name=.Robot.rot_base material_type = steel
part mod rigid_body mass_properties part_name=.Robot.rot_base material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.firstJ i_marker_name=.Robot.rot_base.baseI j_marker_name=.Robot.ground.groundJ
view zoom auto=on
constraint create motion_generator axis=b3 motion_name=.Robot.baseMotion i_marker_name=.Robot.rot_base.baseI j_marker_name=.Robot.ground.groundJ time_derivative=displacement function="0"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM11_Brace
part mod rigid_body mass_properties part_name=.Robot.SLM11_Brace material_type = steel

marker create marker_name=.Robot.SLM11_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM11_Brace.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.basemarker location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.baseMarkerI 

entity attributes entity_name=.Robot.SLM11_Brace.basemarker visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.basemaralignedwithmar2 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_Brace.basemaralignedwithmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.mar2alignedwithmar1 location=485.386444, 120.000000, -108.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_Brace.mar2alignedwithmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.braceGeoMar location=497.386444, 60.000000, -54.000000 orientation=90.000000, -90.000000, -90.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_Brace.braceGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM11_Brace.halfBraceL reference_marker=.Robot.SLM11_Brace.braceGeoMar  points_for_profile= &
6.000000, -48.000000, 0.000000, &
48.000000, -48.000000, 0.000000, &
48.000000, 48.000000, 0.000000, &
6.000000, 48.000000, 0.000000, &
6.000000, 36.000000, 0.000000, &
36.000000, 36.000000, 0.000000, &
36.000000, -36.000000, 0.000000, &
6.000000, -36.000000, 0.000000, &
6.000000, -48.000000, 0.000000 &
length_along_z_axis=509.386444 analytical=yes &
relative_to=.Robot.SLM11_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM11_Brace.halfBraceL type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM11_Brace.halfBraceL render=filled
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM11_Brace.halfBraceR reference_marker=.Robot.SLM11_Brace.braceGeoMar  points_for_profile= &
-6.000000, -36.000000, 0.000000, &
-36.000000, -36.000000, 0.000000, &
-36.000000, 36.000000, 0.000000, &
-6.000000, 36.000000, 0.000000, &
-6.000000, 48.000000, 0.000000, &
-48.000000, 48.000000, 0.000000, &
-48.000000, -48.000000, 0.000000, &
-6.000000, -48.000000, 0.000000, &
-6.000000, -36.000000, 0.000000 &
length_along_z_axis=509.386444 analytical=yes &
relative_to=.Robot.SLM11_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM11_Brace.halfBraceR type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM11_Brace.halfBraceR render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.brace2disk location=485.386444, 120.000000, -108.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_Brace.brace2disk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.toSlider location=0.000000, 60.000000, -54.000000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_Brace.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.lm11toPlate location=482.308396, -131.827959, -11.250000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.braceFR 

entity attributes entity_name=.Robot.SLM11_Brace.lm11toPlate visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Brace.lm11toPlate90 location=0.000000, 0.000000, -96.750000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.lm11toPlate 

entity attributes entity_name=.Robot.SLM11_Brace.lm11toPlate90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM11_Brace material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM11_Brace material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM11_RevJ i_marker_name=.Robot.SLM11_Brace.basemarker j_marker_name=.Robot.rot_base.baseMarkerI
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_rot1 function="AZ(.Robot.SLM11_Brace.basemaralignedwithmar2, .Robot.rot_base.disk_cne_mar)*RTOD"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM11_disk2
part mod rigid_body mass_properties part_name=.Robot.SLM11_disk2 material_type = steel

marker create marker_name=.Robot.SLM11_disk2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM11_disk2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.mar2 location=485.386444, 120.000000, -108.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_disk2.mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.baseMarkerII location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.mar2 

entity attributes entity_name=.Robot.SLM11_disk2.baseMarkerII visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.tolink2 location=65.081103, -100.818897, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.baseMarkerII 

entity attributes entity_name=.Robot.SLM11_disk2.tolink2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.shiftedmarBack location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -36.769519 relative_to=.Robot.SLM11_Brace.mar2alignedwithmar1 

entity attributes entity_name=.Robot.SLM11_disk2.shiftedmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.distalmarBack location=432.010444, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM11_disk2.distalmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.linkXdisk location=432.010444, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM11_disk2.linkXdisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.SLM11_disk2.triangle marker_name=.Robot.SLM11_disk2.mar2, .Robot.SLM11_disk2.tolink2, .Robot.SLM11_disk2.linkXdisk radius=12.000000 width=12.000000
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.shiftedmarFront location=0.000000, 0.000000, 105.600000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM11_disk2.shiftedmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_disk2.distalmarFront location=0.000000, 0.000000, 105.600000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.distalmarBack 

entity attributes entity_name=.Robot.SLM11_disk2.distalmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM11_disk2.link2 width=12.000000 depth=12.000000 i_marker=.Robot.SLM11_disk2.shiftedmarFront j_marker=.Robot.SLM11_disk2.distalmarFront


entity attributes entity_name=.Robot.SLM11_disk2.link2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM11_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM11_disk2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM11_RevJ2 i_marker_name=.Robot.SLM11_disk2.mar2 j_marker_name=.Robot.SLM11_Brace.brace2disk
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM11_slider
part mod rigid_body mass_properties part_name=.Robot.SLM11_slider material_type = steel

marker create marker_name=.Robot.SLM11_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM11_slider.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_slider.toBrace location=0.000000, 60.000000, -54.000000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_slider.toBrace visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_slider.sliderGeoMar location=0.000000, 60.000000, -54.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_slider.sliderGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM11_slider.sliderblock reference_marker=.Robot.SLM11_slider.sliderGeoMar  points_for_profile= &
444.010444, 60.000000, -6.000000, &
444.010444, -60.000000, -6.000000, &
-12.000000, -60.000000, -6.000000, &
-12.000000, 60.000000, -6.000000, &
444.010444, 60.000000, -6.000000 &
length_along_z_axis=12.000000 analytical=yes &
relative_to=.Robot.SLM11_slider.sliderGeoMar
entity attributes entity_name=.Robot.SLM11_slider.sliderblock type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM11_slider.sliderblock render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM11_slider.slider2link1 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_slider.slider2link1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM11_slider.sliderblock1 reference_marker=.Robot.SLM11_slider.slider2link1  points_for_profile= &
12.000000, 0.000000, -102.000000, &
11.276313, 4.104238, -102.000000, &
9.192538, 7.713446, -102.000000, &
6.000009, 10.392300, -102.000000, &
2.083792, 11.817691, -102.000000, &
-2.083761, 11.817696, -102.000000, &
-5.999982, 10.392315, -102.000000, &
-9.192517, 7.713470, -102.000000, &
-11.276302, 4.104268, -102.000000, &
-12.000000, 0.000032, -102.000000, &
12.000000, 0.000000, -102.000000 &
length_along_z_axis=96.000000 analytical=yes &
relative_to=.Robot.SLM11_slider.slider2link1
entity attributes entity_name=.Robot.SLM11_slider.sliderblock1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM11_slider.sliderblock1 render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM11_slider.slider2link2 location=432.010444, 0.000000, -108.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_slider.slider2link2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM11_slider.sliderblock2 reference_marker=.Robot.SLM11_slider.slider2link2  points_for_profile= &
-12.000000, 0.000032, 6.000000, &
-11.276324, -4.104208, 6.000000, &
-9.192558, -7.713422, 6.000000, &
-6.000037, -10.392284, 6.000000, &
-2.083823, -11.817685, 6.000000, &
2.083729, -11.817702, 6.000000, &
5.999954, -10.392331, 6.000000, &
9.192497, -7.713495, 6.000000, &
11.276291, -4.104298, 6.000000, &
12.000000, -0.000064, 6.000000, &
-12.000000, 0.000032, 6.000000 &
length_along_z_axis=96.000000 analytical=yes &
relative_to=.Robot.SLM11_slider.slider2link2
entity attributes entity_name=.Robot.SLM11_slider.sliderblock2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM11_slider.sliderblock2 render=filled
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM11_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM11_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM11_slider material_type = steel

view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_motionFunc function="26.688000+sin(time/5*PI-PI/2)*134.688000"
view zoom auto=on
constraint create joint translational joint_name=.Robot.SLM11_SliderJoint i_marker_name=.Robot.SLM11_slider.toBrace j_marker_name=.Robot.SLM11_Brace.toSlider
constraint create motion_generator motion_name=.Robot.SLM11_SliderJoint_motion type_of_freedom=translational joint_name=.Robot.SLM11_SliderJoint  function="VARVAL(.Robot.SLM11_motionFunc)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_Act_forceX function="JOINT(.Robot.SLM11_SliderJoint, 0, 2, .Robot.SLM11_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_Act_forceY function="JOINT(.Robot.SLM11_SliderJoint, 0, 3, .Robot.SLM11_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_Act_forceZ function="MOTION(.Robot.SLM11_SliderJoint_motion, 0, 4, .Robot.SLM11_Brace.toSlider)"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM11_Link1
part mod rigid_body mass_properties part_name=.Robot.SLM11_Link1 material_type = steel

marker create marker_name=.Robot.SLM11_Link1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM11_Link1.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Link1.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_slider.slider2link1 

entity attributes entity_name=.Robot.SLM11_Link1.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Link1.todisk1 location=-103.920000, 60.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_Brace.basemarker 

entity attributes entity_name=.Robot.SLM11_Link1.todisk1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM11_Link1.link width=12.000000 depth=12.000000 i_marker=.Robot.SLM11_Link1.toSlider j_marker=.Robot.SLM11_Link1.todisk1


entity attributes entity_name=.Robot.SLM11_Link1.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM11_Link1 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM11_Jslider_link1 i_marker_name=.Robot.SLM11_slider.slider2link1 j_marker_name=.Robot.SLM11_Link1.toSlider
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM11_Jdisk1_link1 i_marker_name=.Robot.SLM11_Link1.todisk1 j_marker_name=.Robot.rot_base.tolink1
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM11_Link2
part mod rigid_body mass_properties part_name=.Robot.SLM11_Link2 material_type = steel

marker create marker_name=.Robot.SLM11_Link2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM11_Link2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Link2.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_slider.slider2link2 

entity attributes entity_name=.Robot.SLM11_Link2.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM11_Link2.todisk location=65.081103, -100.818897, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.mar2 

entity attributes entity_name=.Robot.SLM11_Link2.todisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM11_Link2.link width=12.000000 depth=12.000000 i_marker=.Robot.SLM11_Link2.toSlider j_marker=.Robot.SLM11_Link2.todisk


entity attributes entity_name=.Robot.SLM11_Link2.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM11_Link2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM11_Jdisk2_link2 i_marker_name=.Robot.SLM11_Link2.todisk j_marker_name=.Robot.SLM11_disk2.tolink2
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM11_Jslider_link2 i_marker_name=.Robot.SLM11_slider.slider2link2 j_marker_name=.Robot.SLM11_Link2.toSlider
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_rot2 function="AZ(.Robot.SLM11_disk2.shiftedmarBack, .Robot.rot_base.disk_cne_mar)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_disk2_rot function="AZ(.Robot.SLM11_disk2.shiftedmarFront, .Robot.SLM11_Brace.mar2alignedwithmar1)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM11_disk1_rot function="AZ(.Robot.rot_base.disk_cne_mar, .Robot.SLM11_Brace.basemaralignedwithmar2)*RTOD"
view zoom auto=on
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk11
part mod rigid_body mass_properties part_name=.Robot.ParaLnk11 material_type = steel

marker create marker_name=.Robot.ParaLnk11.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk11.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk11.ParaLnk11I location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.brace2Paralnk1 

entity attributes entity_name=.Robot.ParaLnk11.ParaLnk11I visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk11.paraMar2 location=482.308396, -11.827959, -11.250000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.braceFR 

entity attributes entity_name=.Robot.ParaLnk11.paraMar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk11.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk11.ParaLnk11I j_marker=.Robot.ParaLnk11.paraMar2


entity attributes entity_name=.Robot.ParaLnk11.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk11 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.JParaLnk11_rotbase i_marker_name=.Robot.rot_base.brace2Paralnk1 j_marker_name=.Robot.ParaLnk11.ParaLnk11I
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk12
part mod rigid_body mass_properties part_name=.Robot.ParaLnk12 material_type = steel

marker create marker_name=.Robot.ParaLnk12.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk12.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk12.Lkn2ToBrace location=-24.852814, -84.852814, -66.750000 orientation=0.000000, 0.000000, 29.712897 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk12.Lkn2ToBrace visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk12.Lnk2ToPlate90 location=500.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk12.Lkn2ToBrace 

entity attributes entity_name=.Robot.ParaLnk12.Lnk2ToPlate90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk12.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk12.Lkn2ToBrace j_marker=.Robot.ParaLnk12.Lnk2ToPlate90


entity attributes entity_name=.Robot.ParaLnk12.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk12.Lnk2ToPlate90_ location=500.000000, 0.000000, 11.250000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk12.Lkn2ToBrace 

entity attributes entity_name=.Robot.ParaLnk12.Lnk2ToPlate90_ visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk12 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.paralnk2_brace i_marker_name=.Robot.ParaLnk12.Lkn2ToBrace j_marker_name=.Robot.rot_base.braceToLnk2Mar
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.firstPlate
part mod rigid_body mass_properties part_name=.Robot.firstPlate material_type = steel

marker create marker_name=.Robot.firstPlate.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.firstPlate.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate.firstPmar1 location=482.308396, -131.827959, -11.250000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.rot_base.braceFR 

entity attributes entity_name=.Robot.firstPlate.firstPmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate.firstPmar1Vertical location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -45.000000 relative_to=.Robot.firstPlate.firstPmar1 

entity attributes entity_name=.Robot.firstPlate.firstPmar1Vertical visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate.firstPmar2 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.firstPlate.firstPmar1Vertical 

entity attributes entity_name=.Robot.firstPlate.firstPmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate.firstPmar3 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk11.paraMar2 

entity attributes entity_name=.Robot.firstPlate.firstPmar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.firstPlate.plate marker_name=.Robot.firstPlate.firstPmar1, .Robot.firstPlate.firstPmar2, .Robot.firstPlate.firstPmar3 radius=15.000000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.firstPlate.toLink3J location=0.000000, 0.000000, -1.875000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.firstPlate.firstPmar2 

entity attributes entity_name=.Robot.firstPlate.toLink3J visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.firstPlate material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.J1stPlate_lm11brace i_marker_name=.Robot.firstPlate.firstPmar1 j_marker_name=.Robot.SLM11_Brace.lm11toPlate
view zoom auto=on
constraint create joint revolute joint_name=.Robot.J1stPlate_Paralnk1 i_marker_name=.Robot.firstPlate.firstPmar3 j_marker_name=.Robot.ParaLnk11.paraMar2
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk13
part mod rigid_body mass_properties part_name=.Robot.ParaLnk13 material_type = steel

marker create marker_name=.Robot.ParaLnk13.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk13.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk13.toLink3I location=0.000000, 120.000000, -1.875000 orientation=0.000000, 0.000000, -7.056621 relative_to=.Robot.firstPlate.firstPmar1Vertical 

entity attributes entity_name=.Robot.ParaLnk13.toLink3I visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk13.toLink3J location=432.010444, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk13.toLink3I 

entity attributes entity_name=.Robot.ParaLnk13.toLink3J visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk13.link3 width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk13.toLink3I j_marker=.Robot.ParaLnk13.toLink3J


entity attributes entity_name=.Robot.ParaLnk13.link3 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk13 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.ParaLnk12_1stPlat i_marker_name=.Robot.ParaLnk13.toLink3I j_marker_name=.Robot.firstPlate.toLink3J
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.secondPlate
part mod rigid_body mass_properties part_name=.Robot.secondPlate material_type = steel

marker create marker_name=.Robot.secondPlate.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.secondPlate.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.sndPmar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 7.056621 relative_to=.Robot.ParaLnk13.toLink3J 

entity attributes entity_name=.Robot.secondPlate.sndPmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.sndPmar3 location=0.000000, -120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.sndPmar1 

entity attributes entity_name=.Robot.secondPlate.sndPmar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.sndPmar2 location=84.852814, -84.852814, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.sndPmar1 

entity attributes entity_name=.Robot.secondPlate.sndPmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.cynMar location=0.000000, 0.000000, -127.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.sndPmar2 

entity attributes entity_name=.Robot.secondPlate.cynMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.secondPlate.Cyn length=127.500000 radius=12.000000  angle=359.0 center_marker=.Robot.secondPlate.cynMar

entity attributes entity_name=.Robot.secondPlate.Cyn type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.secondPlate.plate marker_name=.Robot.secondPlate.sndPmar1, .Robot.secondPlate.sndPmar2, .Robot.secondPlate.sndPmar3 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.secondPlate.sndPmar3_dup location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.distalmarFront 

entity attributes entity_name=.Robot.secondPlate.sndPmar3_dup visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.sndPmar2For2ndSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 45.000000 relative_to=.Robot.secondPlate.sndPmar2 

entity attributes entity_name=.Robot.secondPlate.sndPmar2For2ndSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.sndPmar1For2ndSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 45.000000 relative_to=.Robot.secondPlate.sndPmar1 

entity attributes entity_name=.Robot.secondPlate.sndPmar1For2ndSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.disk2_cen_mar location=0.000000, 0.000000, -7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.sndPmar2For2ndSlider 

entity attributes entity_name=.Robot.secondPlate.disk2_cen_mar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.baseMarkerI location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -29.173643 relative_to=.Robot.secondPlate.disk2_cen_mar 

entity attributes entity_name=.Robot.secondPlate.baseMarkerI visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.tolink1 location=-103.920000, 60.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.baseMarkerI 

entity attributes entity_name=.Robot.secondPlate.tolink1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.basemaralignedwithmar2_gnd location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.secondPlate.baseMarkerI 

entity attributes entity_name=.Robot.secondPlate.basemaralignedwithmar2_gnd visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secondPlate.mar1_R location=-120.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.disk2_cen_mar 

entity attributes entity_name=.Robot.secondPlate.mar1_R visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.secondPlate.triangle marker_name=.Robot.secondPlate.basemaralignedwithmar2_gnd, .Robot.secondPlate.tolink1, .Robot.secondPlate.mar1_R radius=12.000000 width=12.000000
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.secondPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.secondPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.secondPlate material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.paraLink3_2ndPlate i_marker_name=.Robot.secondPlate.sndPmar1 j_marker_name=.Robot.ParaLnk13.toLink3J
view zoom auto=on
constraint create joint revolute joint_name=.Robot.paraLink2_2ndPlate i_marker_name=.Robot.secondPlate.sndPmar3_dup j_marker_name=.Robot.SLM11_disk2.distalmarFront
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.firstPlate90
part mod rigid_body mass_properties part_name=.Robot.firstPlate90 material_type = steel

marker create marker_name=.Robot.firstPlate90.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.firstPlate90.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate90.firstPmar1Vertical90 location=0.000000, 0.000000, -96.750000 orientation=0.000000, 0.000000, 45.000000 relative_to=.Robot.firstPlate.firstPmar1 

entity attributes entity_name=.Robot.firstPlate90.firstPmar1Vertical90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate90.firstPmar2_90 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, -7.056621 relative_to=.Robot.firstPlate90.firstPmar1Vertical90 

entity attributes entity_name=.Robot.firstPlate90.firstPmar2_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.firstPlate90.firstPmar3_90 location=-84.852814, 84.852814, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.firstPlate90.firstPmar1Vertical90 

entity attributes entity_name=.Robot.firstPlate90.firstPmar3_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.firstPlate90.plate90 marker_name=.Robot.firstPlate90.firstPmar1Vertical90, .Robot.firstPlate90.firstPmar2_90, .Robot.firstPlate90.firstPmar3_90 radius=15.000000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.firstPlate90.Para_plate90 location=0.000000, 0.000000, 7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.firstPlate90.firstPmar2_90 

entity attributes entity_name=.Robot.firstPlate90.Para_plate90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.firstPlate90 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.J1stPlate90_lm11brace i_marker_name=.Robot.firstPlate90.firstPmar1Vertical90 j_marker_name=.Robot.SLM11_Brace.lm11toPlate90
view zoom auto=on
constraint create joint revolute joint_name=.Robot.paraLink2_Plate90 i_marker_name=.Robot.ParaLnk12.Lnk2ToPlate90_ j_marker_name=.Robot.firstPlate90.firstPmar3_90
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk14
part mod rigid_body mass_properties part_name=.Robot.ParaLnk14 material_type = steel

marker create marker_name=.Robot.ParaLnk14.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk14.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk14.ParaLnk14I location=0.000000, 0.000000, 7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.firstPlate90.firstPmar2_90 

entity attributes entity_name=.Robot.ParaLnk14.ParaLnk14I visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk14.ParaLnk14J location=0.000000, -432.010444, 7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.firstPlate90.firstPmar2_90 

entity attributes entity_name=.Robot.ParaLnk14.ParaLnk14J visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk14.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk14.ParaLnk14I j_marker=.Robot.ParaLnk14.ParaLnk14J


entity attributes entity_name=.Robot.ParaLnk14.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk14 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.paraLink4_Plate90 i_marker_name=.Robot.ParaLnk14.ParaLnk14I j_marker_name=.Robot.firstPlate90.Para_plate90
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.secPlate90
part mod rigid_body mass_properties part_name=.Robot.secPlate90 material_type = steel

marker create marker_name=.Robot.secPlate90.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.secPlate90.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar1_90 location=0.000000, 0.000000, -123.000000 orientation=0.000000, 0.000000, 90.000000 relative_to=.Robot.secondPlate.sndPmar3 

entity attributes entity_name=.Robot.secPlate90.secPmar1_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar2_90 location=120.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secPlate90.secPmar1_90 

entity attributes entity_name=.Robot.secPlate90.secPmar2_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar1d_90 location=-84.852814, -84.852814, 0.000000 orientation=0.000000, 0.000000, -45.000000 relative_to=.Robot.secPlate90.secPmar2_90 

entity attributes entity_name=.Robot.secPlate90.secPmar1d_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar2d_90 location=-120.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secPlate90.secPmar1d_90 

entity attributes entity_name=.Robot.secPlate90.secPmar2d_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar3_90 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secPlate90.secPmar1_90 

entity attributes entity_name=.Robot.secPlate90.secPmar3_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.secPlate90.plate marker_name=.Robot.secPlate90.secPmar3_90, .Robot.secPlate90.secPmar2d_90, .Robot.secPlate90.secPmar1d_90 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar3_90_pair location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk14.ParaLnk14J 

entity attributes entity_name=.Robot.secPlate90.secPmar3_90_pair visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secPmar1_90_pair location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM11_disk2.distalmarBack 

entity attributes entity_name=.Robot.secPlate90.secPmar1_90_pair visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.secPlate90.secplate_toParaLnk22 location=0.000000, 0.000000, -7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secPlate90.secPmar2d_90 

entity attributes entity_name=.Robot.secPlate90.secplate_toParaLnk22 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.secPlate90 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.lnk4_plate2_90 i_marker_name=.Robot.ParaLnk14.ParaLnk14J j_marker_name=.Robot.secPlate90.secPmar3_90_pair
view zoom auto=on
constraint create joint revolute joint_name=.Robot.part2_plate2_90 i_marker_name=.Robot.SLM11_disk2.distalmarBack j_marker_name=.Robot.secPlate90.secPmar1_90_pair
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM12_Brace
part mod rigid_body mass_properties part_name=.Robot.SLM12_Brace material_type = steel

marker create marker_name=.Robot.SLM12_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM12_Brace.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Brace.basemarker location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.baseMarkerI 

entity attributes entity_name=.Robot.SLM12_Brace.basemarker visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Brace.basemaralignedwithmar2 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_Brace.basemaralignedwithmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Brace.mar2alignedwithmar1 location=485.386444, 120.000000, -108.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_Brace.mar2alignedwithmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Brace.braceGeoMar location=497.386444, 60.000000, -54.000000 orientation=90.000000, -90.000000, -90.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_Brace.braceGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM12_Brace.halfBraceL reference_marker=.Robot.SLM12_Brace.braceGeoMar  points_for_profile= &
6.000000, -48.000000, 0.000000, &
48.000000, -48.000000, 0.000000, &
48.000000, 48.000000, 0.000000, &
6.000000, 48.000000, 0.000000, &
6.000000, 36.000000, 0.000000, &
36.000000, 36.000000, 0.000000, &
36.000000, -36.000000, 0.000000, &
6.000000, -36.000000, 0.000000, &
6.000000, -48.000000, 0.000000 &
length_along_z_axis=509.386444 analytical=yes &
relative_to=.Robot.SLM12_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM12_Brace.halfBraceL type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM12_Brace.halfBraceL render=filled
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM12_Brace.halfBraceR reference_marker=.Robot.SLM12_Brace.braceGeoMar  points_for_profile= &
-6.000000, -36.000000, 0.000000, &
-36.000000, -36.000000, 0.000000, &
-36.000000, 36.000000, 0.000000, &
-6.000000, 36.000000, 0.000000, &
-6.000000, 48.000000, 0.000000, &
-48.000000, 48.000000, 0.000000, &
-48.000000, -48.000000, 0.000000, &
-6.000000, -48.000000, 0.000000, &
-6.000000, -36.000000, 0.000000 &
length_along_z_axis=509.386444 analytical=yes &
relative_to=.Robot.SLM12_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM12_Brace.halfBraceR type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM12_Brace.halfBraceR render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM12_Brace.brace2disk location=485.386444, 120.000000, -108.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_Brace.brace2disk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Brace.toSlider location=0.000000, 60.000000, -54.000000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_Brace.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM12_Brace material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM12_Brace material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM12_RevJ i_marker_name=.Robot.SLM12_Brace.basemarker j_marker_name=.Robot.secondPlate.baseMarkerI
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_rot1 function="AZ(.Robot.SLM12_Brace.basemaralignedwithmar2, .Robot.secondPlate.disk2_cen_mar)*RTOD"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM12_disk2
part mod rigid_body mass_properties part_name=.Robot.SLM12_disk2 material_type = steel

marker create marker_name=.Robot.SLM12_disk2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM12_disk2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.mar2 location=485.386444, 120.000000, -108.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_disk2.mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.baseMarkerII location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.mar2 

entity attributes entity_name=.Robot.SLM12_disk2.baseMarkerII visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.tolink2 location=65.081103, -100.818897, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.baseMarkerII 

entity attributes entity_name=.Robot.SLM12_disk2.tolink2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.shiftedmarBack location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -36.769519 relative_to=.Robot.SLM12_Brace.mar2alignedwithmar1 

entity attributes entity_name=.Robot.SLM12_disk2.shiftedmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.distalmarBack location=432.010444, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM12_disk2.distalmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.linkXdisk location=432.010444, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM12_disk2.linkXdisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.SLM12_disk2.triangle marker_name=.Robot.SLM12_disk2.mar2, .Robot.SLM12_disk2.tolink2, .Robot.SLM12_disk2.linkXdisk radius=12.000000 width=12.000000
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.shiftedmarFront location=0.000000, 0.000000, 105.600000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM12_disk2.shiftedmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_disk2.distalmarFront location=0.000000, 0.000000, 105.600000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.distalmarBack 

entity attributes entity_name=.Robot.SLM12_disk2.distalmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM12_disk2.link2 width=12.000000 depth=12.000000 i_marker=.Robot.SLM12_disk2.shiftedmarFront j_marker=.Robot.SLM12_disk2.distalmarFront


entity attributes entity_name=.Robot.SLM12_disk2.link2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM12_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM12_disk2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM12_RevJ2 i_marker_name=.Robot.SLM12_disk2.mar2 j_marker_name=.Robot.SLM12_Brace.brace2disk
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM12_slider
part mod rigid_body mass_properties part_name=.Robot.SLM12_slider material_type = steel

marker create marker_name=.Robot.SLM12_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM12_slider.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_slider.toBrace location=0.000000, 60.000000, -54.000000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_slider.toBrace visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_slider.sliderGeoMar location=0.000000, 60.000000, -54.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_slider.sliderGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM12_slider.sliderblock reference_marker=.Robot.SLM12_slider.sliderGeoMar  points_for_profile= &
444.010444, 60.000000, -6.000000, &
444.010444, -60.000000, -6.000000, &
-12.000000, -60.000000, -6.000000, &
-12.000000, 60.000000, -6.000000, &
444.010444, 60.000000, -6.000000 &
length_along_z_axis=12.000000 analytical=yes &
relative_to=.Robot.SLM12_slider.sliderGeoMar
entity attributes entity_name=.Robot.SLM12_slider.sliderblock type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM12_slider.sliderblock render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM12_slider.slider2link1 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_slider.slider2link1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM12_slider.sliderblock1 reference_marker=.Robot.SLM12_slider.slider2link1  points_for_profile= &
12.000000, 0.000000, -102.000000, &
11.276313, 4.104238, -102.000000, &
9.192538, 7.713446, -102.000000, &
6.000009, 10.392300, -102.000000, &
2.083792, 11.817691, -102.000000, &
-2.083761, 11.817696, -102.000000, &
-5.999982, 10.392315, -102.000000, &
-9.192517, 7.713470, -102.000000, &
-11.276302, 4.104268, -102.000000, &
-12.000000, 0.000032, -102.000000, &
12.000000, 0.000000, -102.000000 &
length_along_z_axis=96.000000 analytical=yes &
relative_to=.Robot.SLM12_slider.slider2link1
entity attributes entity_name=.Robot.SLM12_slider.sliderblock1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM12_slider.sliderblock1 render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM12_slider.slider2link2 location=432.010444, 0.000000, -108.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_slider.slider2link2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM12_slider.sliderblock2 reference_marker=.Robot.SLM12_slider.slider2link2  points_for_profile= &
-12.000000, 0.000032, 6.000000, &
-11.276324, -4.104208, 6.000000, &
-9.192558, -7.713422, 6.000000, &
-6.000037, -10.392284, 6.000000, &
-2.083823, -11.817685, 6.000000, &
2.083729, -11.817702, 6.000000, &
5.999954, -10.392331, 6.000000, &
9.192497, -7.713495, 6.000000, &
11.276291, -4.104298, 6.000000, &
12.000000, -0.000064, 6.000000, &
-12.000000, 0.000032, 6.000000 &
length_along_z_axis=96.000000 analytical=yes &
relative_to=.Robot.SLM12_slider.slider2link2
entity attributes entity_name=.Robot.SLM12_slider.sliderblock2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM12_slider.sliderblock2 render=filled
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM12_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM12_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM12_slider material_type = steel

view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_motionFunc function="26.688000+sin(time/5*PI-PI/2)*134.688000"
view zoom auto=on
constraint create joint translational joint_name=.Robot.SLM12_SliderJoint i_marker_name=.Robot.SLM12_slider.toBrace j_marker_name=.Robot.SLM12_Brace.toSlider
constraint create motion_generator motion_name=.Robot.SLM12_SliderJoint_motion type_of_freedom=translational joint_name=.Robot.SLM12_SliderJoint  function="VARVAL(.Robot.SLM12_motionFunc)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_Act_forceX function="JOINT(.Robot.SLM12_SliderJoint, 0, 2, .Robot.SLM12_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_Act_forceY function="JOINT(.Robot.SLM12_SliderJoint, 0, 3, .Robot.SLM12_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_Act_forceZ function="MOTION(.Robot.SLM12_SliderJoint_motion, 0, 4, .Robot.SLM12_Brace.toSlider)"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM12_Link1
part mod rigid_body mass_properties part_name=.Robot.SLM12_Link1 material_type = steel

marker create marker_name=.Robot.SLM12_Link1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM12_Link1.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Link1.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_slider.slider2link1 

entity attributes entity_name=.Robot.SLM12_Link1.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Link1.todisk1 location=-103.920000, 60.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_Brace.basemarker 

entity attributes entity_name=.Robot.SLM12_Link1.todisk1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM12_Link1.link width=12.000000 depth=12.000000 i_marker=.Robot.SLM12_Link1.toSlider j_marker=.Robot.SLM12_Link1.todisk1


entity attributes entity_name=.Robot.SLM12_Link1.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM12_Link1 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM12_Jslider_link1 i_marker_name=.Robot.SLM12_slider.slider2link1 j_marker_name=.Robot.SLM12_Link1.toSlider
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM12_Jdisk1_link1 i_marker_name=.Robot.SLM12_Link1.todisk1 j_marker_name=.Robot.secondPlate.tolink1
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM12_Link2
part mod rigid_body mass_properties part_name=.Robot.SLM12_Link2 material_type = steel

marker create marker_name=.Robot.SLM12_Link2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM12_Link2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Link2.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_slider.slider2link2 

entity attributes entity_name=.Robot.SLM12_Link2.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM12_Link2.todisk location=65.081103, -100.818897, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.mar2 

entity attributes entity_name=.Robot.SLM12_Link2.todisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM12_Link2.link width=12.000000 depth=12.000000 i_marker=.Robot.SLM12_Link2.toSlider j_marker=.Robot.SLM12_Link2.todisk


entity attributes entity_name=.Robot.SLM12_Link2.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM12_Link2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM12_Jdisk2_link2 i_marker_name=.Robot.SLM12_Link2.todisk j_marker_name=.Robot.SLM12_disk2.tolink2
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM12_Jslider_link2 i_marker_name=.Robot.SLM12_slider.slider2link2 j_marker_name=.Robot.SLM12_Link2.toSlider
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_rot2 function="AZ(.Robot.SLM12_disk2.shiftedmarBack, .Robot.secondPlate.disk2_cen_mar)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_disk2_rot function="AZ(.Robot.SLM12_disk2.shiftedmarFront, .Robot.SLM12_Brace.mar2alignedwithmar1)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM12_disk1_rot function="AZ(.Robot.secondPlate.disk2_cen_mar, .Robot.SLM12_Brace.basemaralignedwithmar2)*RTOD"
view zoom auto=on
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk21
part mod rigid_body mass_properties part_name=.Robot.ParaLnk21 material_type = steel

marker create marker_name=.Robot.ParaLnk21.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk21.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk21.ParaLnk21Mar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secondPlate.sndPmar1For2ndSlider 

entity attributes entity_name=.Robot.ParaLnk21.ParaLnk21Mar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk21.ParaLnk21Mar2 location=482.308396, -131.827959, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk21.ParaLnk21Mar1 

entity attributes entity_name=.Robot.ParaLnk21.ParaLnk21Mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk21.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk21.ParaLnk21Mar1 j_marker=.Robot.ParaLnk21.ParaLnk21Mar2


entity attributes entity_name=.Robot.ParaLnk21.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk21 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.Plate1_ParaLnk21 i_marker_name=.Robot.ParaLnk21.ParaLnk21Mar1 j_marker_name=.Robot.secondPlate.sndPmar1For2ndSlider
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.TrdPlate
part mod rigid_body mass_properties part_name=.Robot.TrdPlate material_type = steel

marker create marker_name=.Robot.TrdPlate.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.TrdPlate.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate.TrdPmar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 7.056621 relative_to=.Robot.SLM12_disk2.shiftedmarFront 

entity attributes entity_name=.Robot.TrdPlate.TrdPmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate.TrdPmar2 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate.TrdPmar1 

entity attributes entity_name=.Robot.TrdPlate.TrdPmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate.TrdPmar3 location=-84.852814, 84.852814, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate.TrdPmar1 

entity attributes entity_name=.Robot.TrdPlate.TrdPmar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.TrdPlate.plate marker_name=.Robot.TrdPlate.TrdPmar1, .Robot.TrdPlate.TrdPmar2, .Robot.TrdPlate.TrdPmar3 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.TrdPlate.toLink21 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk21.ParaLnk21Mar2 

entity attributes entity_name=.Robot.TrdPlate.toLink21 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.TrdPlate material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.Plate3_ParaLnk21 i_marker_name=.Robot.ParaLnk21.ParaLnk21Mar2 j_marker_name=.Robot.TrdPlate.toLink21
view zoom auto=on
constraint create joint revolute joint_name=.Robot.plate3_toDisk2 i_marker_name=.Robot.TrdPlate.TrdPmar1 j_marker_name=.Robot.SLM12_disk2.shiftedmarFront
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.TrdPlate90
part mod rigid_body mass_properties part_name=.Robot.TrdPlate90 material_type = steel

marker create marker_name=.Robot.TrdPlate90.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.TrdPlate90.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate90.TrdPmar1d_90 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 97.056621 relative_to=.Robot.SLM12_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.TrdPlate90.TrdPmar1d_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate90.TrdPmar1_90 location=0.000000, 0.000000, -7.500000 orientation=0.000000, 0.000000, 97.056621 relative_to=.Robot.SLM12_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.TrdPlate90.TrdPmar1_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate90.TrdPmar2_90 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate90.TrdPmar1_90 

entity attributes entity_name=.Robot.TrdPlate90.TrdPmar2_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.TrdPlate90.TrdPmar3_90 location=-84.852814, 84.852814, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate90.TrdPmar1_90 

entity attributes entity_name=.Robot.TrdPlate90.TrdPmar3_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.TrdPlate90.plate90 marker_name=.Robot.TrdPlate90.TrdPmar1_90, .Robot.TrdPlate90.TrdPmar2_90, .Robot.TrdPlate90.TrdPmar3_90 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.TrdPlate90.Trdplate_toParaLnk22 location=0.000000, 0.000000, -7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate90.TrdPmar3_90 

entity attributes entity_name=.Robot.TrdPlate90.Trdplate_toParaLnk22 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.TrdPlate90 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.TrdPlatetoAxis i_marker_name=.Robot.TrdPlate90.TrdPmar1d_90 j_marker_name=.Robot.SLM12_disk2.shiftedmarBack
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk22
part mod rigid_body mass_properties part_name=.Robot.ParaLnk22 material_type = steel

marker create marker_name=.Robot.ParaLnk22.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk22.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk22.ParaLnk22Mar1 location=0.000000, 0.000000, -7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.secPlate90.secPmar2d_90 

entity attributes entity_name=.Robot.ParaLnk22.ParaLnk22Mar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk22.ParaLnk22Mar2 location=0.000000, 0.000000, -7.500000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate90.TrdPmar3_90 

entity attributes entity_name=.Robot.ParaLnk22.ParaLnk22Mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk22.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk22.ParaLnk22Mar1 j_marker=.Robot.ParaLnk22.ParaLnk22Mar2


entity attributes entity_name=.Robot.ParaLnk22.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk22 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.Paralnk22_secPlate i_marker_name=.Robot.ParaLnk22.ParaLnk22Mar1 j_marker_name=.Robot.secPlate90.secplate_toParaLnk22
view zoom auto=on
constraint create joint revolute joint_name=.Robot.Paralnk22_TrdPlate i_marker_name=.Robot.ParaLnk22.ParaLnk22Mar2 j_marker_name=.Robot.TrdPlate90.Trdplate_toParaLnk22
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk23
part mod rigid_body mass_properties part_name=.Robot.ParaLnk23 material_type = steel

marker create marker_name=.Robot.ParaLnk23.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk23.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk23.ParaLnk23Mar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate.TrdPmar2 

entity attributes entity_name=.Robot.ParaLnk23.ParaLnk23Mar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk23.ParaLnk23Mar2 location=428.738065, -53.072546, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.TrdPlate.TrdPmar2 

entity attributes entity_name=.Robot.ParaLnk23.ParaLnk23Mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk23.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk23.ParaLnk23Mar1 j_marker=.Robot.ParaLnk23.ParaLnk23Mar2


entity attributes entity_name=.Robot.ParaLnk23.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk23 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.ParaLnk23_TrdPlate i_marker_name=.Robot.ParaLnk23.ParaLnk23Mar1 j_marker_name=.Robot.TrdPlate.TrdPmar2
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.ParaLnk24
part mod rigid_body mass_properties part_name=.Robot.ParaLnk24 material_type = steel

marker create marker_name=.Robot.ParaLnk24.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.ParaLnk24.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk24.ParaLnk24Mar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -90.000000 relative_to=.Robot.TrdPlate90.TrdPmar2_90 

entity attributes entity_name=.Robot.ParaLnk24.ParaLnk24Mar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.ParaLnk24.ParaLnk24Mar2 location=428.738065, -53.072546, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk24.ParaLnk24Mar1 

entity attributes entity_name=.Robot.ParaLnk24.ParaLnk24Mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.ParaLnk24.link width=7.500000 depth=7.500000 i_marker=.Robot.ParaLnk24.ParaLnk24Mar1 j_marker=.Robot.ParaLnk24.ParaLnk24Mar2


entity attributes entity_name=.Robot.ParaLnk24.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.ParaLnk24 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.ParaLnk24_TrdPlate90 i_marker_name=.Robot.ParaLnk24.ParaLnk24Mar1 j_marker_name=.Robot.TrdPlate90.TrdPmar2_90
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.FthPlate
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel

marker create marker_name=.Robot.FthPlate.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.FthPlate.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk23.ParaLnk23Mar2 

entity attributes entity_name=.Robot.FthPlate.FthPmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar2 location=0.000000, -120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar1 

entity attributes entity_name=.Robot.FthPlate.FthPmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar3 location=60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar2 

entity attributes entity_name=.Robot.FthPlate.FthPmar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar4 location=60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar1 

entity attributes entity_name=.Robot.FthPlate.FthPmar4 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.FthPlate.plate marker_name=.Robot.FthPlate.FthPmar1, .Robot.FthPlate.FthPmar2, .Robot.FthPlate.FthPmar3, .Robot.FthPlate.FthPmar4 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar0_90 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.ParaLnk24.ParaLnk24Mar2 

entity attributes entity_name=.Robot.FthPlate.FthPmar0_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar1_90 location=120.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar0_90 

entity attributes entity_name=.Robot.FthPlate.FthPmar1_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar1d_90 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM12_disk2.distalmarBack 

entity attributes entity_name=.Robot.FthPlate.FthPmar1d_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar2_90 location=60.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar1_90 

entity attributes entity_name=.Robot.FthPlate.FthPmar2_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.FthPmar3_90 location=0.000000, 120.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar2_90 

entity attributes entity_name=.Robot.FthPlate.FthPmar3_90 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.FthPlate.plate90 marker_name=.Robot.FthPlate.FthPmar0_90, .Robot.FthPlate.FthPmar1_90, .Robot.FthPlate.FthPmar2_90, .Robot.FthPlate.FthPmar3_90 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.FthPlate.center_mar location=123.750000, 60.000000, -60.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar3 

entity attributes entity_name=.Robot.FthPlate.center_mar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.Cylinder_mar location=123.750000, 0.000000, -60.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar3 

entity attributes entity_name=.Robot.FthPlate.Cylinder_mar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.FthPlate.cyn length=120.000000 radius=7.500000  angle=359.0 center_marker=.Robot.FthPlate.Cylinder_mar

entity attributes entity_name=.Robot.FthPlate.cyn type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.UpPlate_mar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar4 

entity attributes entity_name=.Robot.FthPlate.UpPlate_mar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.UpPlate_mar2 location=0.000000, 0.000000, 120.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.Cylinder_mar 

entity attributes entity_name=.Robot.FthPlate.UpPlate_mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.UpPlate_mar3 location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar3_90 

entity attributes entity_name=.Robot.FthPlate.UpPlate_mar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.FthPlate.plateUp marker_name=.Robot.FthPlate.UpPlate_mar1, .Robot.FthPlate.UpPlate_mar2, .Robot.FthPlate.UpPlate_mar3 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.FthPlate.DnPlate_mar1 location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar3 

entity attributes entity_name=.Robot.FthPlate.DnPlate_mar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.DnPlate_mar2 location=0.000000, 0.000000, 120.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.Cylinder_mar 

entity attributes entity_name=.Robot.FthPlate.DnPlate_mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.DnPlate_mar3 location=0.000000, 0.000000, 0.000000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.FthPlate.FthPmar2_90 

entity attributes entity_name=.Robot.FthPlate.DnPlate_mar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.FthPlate.plateDn marker_name=.Robot.FthPlate.DnPlate_mar1, .Robot.FthPlate.DnPlate_mar2, .Robot.FthPlate.DnPlate_mar3 radius=7.500000 width=7.500000
view zoom auto=on
marker create marker_name=.Robot.FthPlate.lm13_basemar location=0.000000, 0.000000, 90.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.Cylinder_mar 

entity attributes entity_name=.Robot.FthPlate.lm13_basemar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.baseMarkerI location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -39.173643 relative_to=.Robot.FthPlate.lm13_basemar 

entity attributes entity_name=.Robot.FthPlate.baseMarkerI visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.tolink1 location=-83.136000, 48.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.baseMarkerI 

entity attributes entity_name=.Robot.FthPlate.tolink1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.basemaralignedwithmar2_gnd location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.FthPlate.baseMarkerI 

entity attributes entity_name=.Robot.FthPlate.basemaralignedwithmar2_gnd visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.FthPlate.mar1_R location=-96.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.lm13_basemar 

entity attributes entity_name=.Robot.FthPlate.mar1_R visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.FthPlate.triangle marker_name=.Robot.FthPlate.basemaralignedwithmar2_gnd, .Robot.FthPlate.tolink1, .Robot.FthPlate.mar1_R radius=9.600000 width=9.600000
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel
part mod rigid_body mass_properties part_name=.Robot.FthPlate material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.Fthplate_ParaLnk23 i_marker_name=.Robot.FthPlate.FthPmar1 j_marker_name=.Robot.ParaLnk23.ParaLnk23Mar2
view zoom auto=on
constraint create joint revolute joint_name=.Robot.Fthplate_lm12_DISK2 i_marker_name=.Robot.FthPlate.FthPmar2 j_marker_name=.Robot.SLM12_disk2.distalmarFront
view zoom auto=on
constraint create joint revolute joint_name=.Robot.Fthplate90_PataLnk24 i_marker_name=.Robot.FthPlate.FthPmar0_90 j_marker_name=.Robot.ParaLnk24.ParaLnk24Mar2
view zoom auto=on
constraint create joint revolute joint_name=.Robot.Fthplate90_lm12_disk2 i_marker_name=.Robot.FthPlate.FthPmar1d_90 j_marker_name=.Robot.SLM12_disk2.distalmarBack
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM13_Brace
part mod rigid_body mass_properties part_name=.Robot.SLM13_Brace material_type = steel

marker create marker_name=.Robot.SLM13_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM13_Brace.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Brace.basemarker location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.FthPlate.baseMarkerI 

entity attributes entity_name=.Robot.SLM13_Brace.basemarker visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Brace.basemaralignedwithmar2 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_Brace.basemaralignedwithmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Brace.mar2alignedwithmar1 location=388.309155, 96.000000, -86.400000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_Brace.mar2alignedwithmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Brace.braceGeoMar location=397.909155, 48.000000, -43.200000 orientation=90.000000, -90.000000, -90.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_Brace.braceGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM13_Brace.halfBraceL reference_marker=.Robot.SLM13_Brace.braceGeoMar  points_for_profile= &
4.800000, -38.400000, 0.000000, &
38.400000, -38.400000, 0.000000, &
38.400000, 38.400000, 0.000000, &
4.800000, 38.400000, 0.000000, &
4.800000, 28.800000, 0.000000, &
28.800000, 28.800000, 0.000000, &
28.800000, -28.800000, 0.000000, &
4.800000, -28.800000, 0.000000, &
4.800000, -38.400000, 0.000000 &
length_along_z_axis=407.509155 analytical=yes &
relative_to=.Robot.SLM13_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM13_Brace.halfBraceL type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM13_Brace.halfBraceL render=filled
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM13_Brace.halfBraceR reference_marker=.Robot.SLM13_Brace.braceGeoMar  points_for_profile= &
-4.800000, -28.800000, 0.000000, &
-28.800000, -28.800000, 0.000000, &
-28.800000, 28.800000, 0.000000, &
-4.800000, 28.800000, 0.000000, &
-4.800000, 38.400000, 0.000000, &
-38.400000, 38.400000, 0.000000, &
-38.400000, -38.400000, 0.000000, &
-4.800000, -38.400000, 0.000000, &
-4.800000, -28.800000, 0.000000 &
length_along_z_axis=407.509155 analytical=yes &
relative_to=.Robot.SLM13_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM13_Brace.halfBraceR type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM13_Brace.halfBraceR render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM13_Brace.brace2disk location=388.309155, 96.000000, -86.400000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_Brace.brace2disk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Brace.toSlider location=0.000000, 48.000000, -43.200000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_Brace.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM13_Brace material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_Brace material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM13_RevJ i_marker_name=.Robot.SLM13_Brace.basemarker j_marker_name=.Robot.FthPlate.baseMarkerI
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_rot1 function="AZ(.Robot.SLM13_Brace.basemaralignedwithmar2, .Robot.FthPlate.lm13_basemar)*RTOD"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM13_disk2
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel

marker create marker_name=.Robot.SLM13_disk2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM13_disk2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.mar2 location=388.309155, 96.000000, -86.400000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_disk2.mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.baseMarkerII location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.mar2 

entity attributes entity_name=.Robot.SLM13_disk2.baseMarkerII visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.tolink2 location=52.064883, -80.655118, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.baseMarkerII 

entity attributes entity_name=.Robot.SLM13_disk2.tolink2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.shiftedmarBack location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -1.869519 relative_to=.Robot.SLM13_Brace.mar2alignedwithmar1 

entity attributes entity_name=.Robot.SLM13_disk2.shiftedmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.distalmarBack location=103.682507, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM13_disk2.distalmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.linkXdisk location=103.682507, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM13_disk2.linkXdisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.linkXdisk1 location=0.000000, -96.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.linkXdisk 

entity attributes entity_name=.Robot.SLM13_disk2.linkXdisk1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.SLM13_disk2.triangleDn marker_name=.Robot.SLM13_disk2.mar2, .Robot.SLM13_disk2.tolink2, .Robot.SLM13_disk2.linkXdisk1, .Robot.SLM13_disk2.linkXdisk radius=9.600000 width=9.600000
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.upmar2 location=0.000000, 0.000000, 76.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.mar2 

entity attributes entity_name=.Robot.SLM13_disk2.upmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.upmar3 location=0.000000, 0.000000, 76.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.tolink2 

entity attributes entity_name=.Robot.SLM13_disk2.upmar3 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.upmar4 location=0.000000, 0.000000, 76.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.linkXdisk1 

entity attributes entity_name=.Robot.SLM13_disk2.upmar4 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.upmar1 location=0.000000, 0.000000, 76.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.linkXdisk 

entity attributes entity_name=.Robot.SLM13_disk2.upmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.SLM13_disk2.triangleUp marker_name=.Robot.SLM13_disk2.upmar2, .Robot.SLM13_disk2.upmar3, .Robot.SLM13_disk2.upmar4, .Robot.SLM13_disk2.upmar1 radius=9.600000 width=9.600000
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.SLM13_disk2.Cyn1 length=76.800000 radius=9.600000  angle=359.0 center_marker=.Robot.SLM13_disk2.linkXdisk1

entity attributes entity_name=.Robot.SLM13_disk2.Cyn1 type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.SLM13_disk2.Cyn2 length=76.800000 radius=9.600000  angle=359.0 center_marker=.Robot.SLM13_disk2.linkXdisk

entity attributes entity_name=.Robot.SLM13_disk2.Cyn2 type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.axis_joint location=0.000000, 0.000000, 38.400000 orientation=0.000000, -90.000000, 0.000000 relative_to=.Robot.SLM13_disk2.linkXdisk1 

entity attributes entity_name=.Robot.SLM13_disk2.axis_joint visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape cylinder cylinder_name=.Robot.SLM13_disk2.Cyn3 length=96.000000 radius=9.600000  angle=359.0 center_marker=.Robot.SLM13_disk2.axis_joint

entity attributes entity_name=.Robot.SLM13_disk2.Cyn3 type_filter=Cylinder visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.fornextJ location=0.000000, 0.000000, 19.200000 orientation=0.000000, 180.000000, 0.000000 relative_to=.Robot.SLM13_disk2.axis_joint 

entity attributes entity_name=.Robot.SLM13_disk2.fornextJ visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.shiftedmarFront location=0.000000, 0.000000, 84.480000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM13_disk2.shiftedmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.distalmarFront location=0.000000, 0.000000, 84.480000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.distalmarBack 

entity attributes entity_name=.Robot.SLM13_disk2.distalmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM13_disk2.link2 width=9.600000 depth=9.600000 i_marker=.Robot.SLM13_disk2.shiftedmarFront j_marker=.Robot.SLM13_disk2.distalmarFront


entity attributes entity_name=.Robot.SLM13_disk2.link2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.baseMarkerI location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -39.173643 relative_to=.Robot.SLM13_disk2.fornextJ 

entity attributes entity_name=.Robot.SLM13_disk2.baseMarkerI visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.tolink1 location=-62.352000, 36.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.baseMarkerI 

entity attributes entity_name=.Robot.SLM13_disk2.tolink1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.basemaralignedwithmar2_gnd location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM13_disk2.baseMarkerI 

entity attributes entity_name=.Robot.SLM13_disk2.basemaralignedwithmar2_gnd visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_disk2.mar1_R location=-72.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.fornextJ 

entity attributes entity_name=.Robot.SLM13_disk2.mar1_R visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.SLM13_disk2.triangle marker_name=.Robot.SLM13_disk2.basemaralignedwithmar2_gnd, .Robot.SLM13_disk2.tolink1, .Robot.SLM13_disk2.mar1_R radius=7.200000 width=7.200000
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_disk2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM13_RevJ2 i_marker_name=.Robot.SLM13_disk2.mar2 j_marker_name=.Robot.SLM13_Brace.brace2disk
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM13_slider
part mod rigid_body mass_properties part_name=.Robot.SLM13_slider material_type = steel

marker create marker_name=.Robot.SLM13_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM13_slider.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_slider.toBrace location=0.000000, 48.000000, -43.200000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_slider.toBrace visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_slider.sliderGeoMar location=0.000000, 48.000000, -43.200000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_slider.sliderGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM13_slider.sliderblock reference_marker=.Robot.SLM13_slider.sliderGeoMar  points_for_profile= &
355.208355, 48.000000, -4.800000, &
355.208355, -48.000000, -4.800000, &
-9.600000, -48.000000, -4.800000, &
-9.600000, 48.000000, -4.800000, &
355.208355, 48.000000, -4.800000 &
length_along_z_axis=9.600000 analytical=yes &
relative_to=.Robot.SLM13_slider.sliderGeoMar
entity attributes entity_name=.Robot.SLM13_slider.sliderblock type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM13_slider.sliderblock render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM13_slider.slider2link1 location=0.000000, 96.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_slider.slider2link1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM13_slider.sliderblock1 reference_marker=.Robot.SLM13_slider.slider2link1  points_for_profile= &
9.600000, 0.000000, -81.600000, &
9.021050, 3.283391, -81.600000, &
7.354030, 6.170757, -81.600000, &
4.800007, 8.313840, -81.600000, &
1.667034, 9.454152, -81.600000, &
-1.667009, 9.454157, -81.600000, &
-4.799985, 8.313852, -81.600000, &
-7.354014, 6.170776, -81.600000, &
-9.021041, 3.283415, -81.600000, &
-9.600000, 0.000025, -81.600000, &
9.600000, 0.000000, -81.600000 &
length_along_z_axis=76.800000 analytical=yes &
relative_to=.Robot.SLM13_slider.slider2link1
entity attributes entity_name=.Robot.SLM13_slider.sliderblock1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM13_slider.sliderblock1 render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM13_slider.slider2link2 location=345.608355, 0.000000, -86.400000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_slider.slider2link2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM13_slider.sliderblock2 reference_marker=.Robot.SLM13_slider.slider2link2  points_for_profile= &
-9.600000, 0.000025, 4.800000, &
-9.021059, -3.283367, 4.800000, &
-7.354047, -6.170737, 4.800000, &
-4.800029, -8.313827, 4.800000, &
-1.667059, -9.454148, 4.800000, &
1.666983, -9.454161, 4.800000, &
4.799963, -8.313865, 4.800000, &
7.353998, -6.170796, 4.800000, &
9.021033, -3.283439, 4.800000, &
9.600000, -0.000051, 4.800000, &
-9.600000, 0.000025, 4.800000 &
length_along_z_axis=76.800000 analytical=yes &
relative_to=.Robot.SLM13_slider.slider2link2
entity attributes entity_name=.Robot.SLM13_slider.sliderblock2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM13_slider.sliderblock2 render=filled
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM13_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM13_slider material_type = steel

view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_motionFunc function="21.350400+sin(time/5*PI-PI/2)*0.000000"
view zoom auto=on
constraint create joint translational joint_name=.Robot.SLM13_SliderJoint i_marker_name=.Robot.SLM13_slider.toBrace j_marker_name=.Robot.SLM13_Brace.toSlider
constraint create motion_generator motion_name=.Robot.SLM13_SliderJoint_motion type_of_freedom=translational joint_name=.Robot.SLM13_SliderJoint  function="VARVAL(.Robot.SLM13_motionFunc)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_Act_forceX function="JOINT(.Robot.SLM13_SliderJoint, 0, 2, .Robot.SLM13_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_Act_forceY function="JOINT(.Robot.SLM13_SliderJoint, 0, 3, .Robot.SLM13_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_Act_forceZ function="MOTION(.Robot.SLM13_SliderJoint_motion, 0, 4, .Robot.SLM13_Brace.toSlider)"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM13_Link1
part mod rigid_body mass_properties part_name=.Robot.SLM13_Link1 material_type = steel

marker create marker_name=.Robot.SLM13_Link1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM13_Link1.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Link1.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_slider.slider2link1 

entity attributes entity_name=.Robot.SLM13_Link1.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Link1.todisk1 location=-83.136000, 48.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_Brace.basemarker 

entity attributes entity_name=.Robot.SLM13_Link1.todisk1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM13_Link1.link width=9.600000 depth=9.600000 i_marker=.Robot.SLM13_Link1.toSlider j_marker=.Robot.SLM13_Link1.todisk1


entity attributes entity_name=.Robot.SLM13_Link1.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM13_Link1 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM13_Jslider_link1 i_marker_name=.Robot.SLM13_slider.slider2link1 j_marker_name=.Robot.SLM13_Link1.toSlider
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM13_Jdisk1_link1 i_marker_name=.Robot.SLM13_Link1.todisk1 j_marker_name=.Robot.FthPlate.tolink1
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM13_Link2
part mod rigid_body mass_properties part_name=.Robot.SLM13_Link2 material_type = steel

marker create marker_name=.Robot.SLM13_Link2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM13_Link2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Link2.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_slider.slider2link2 

entity attributes entity_name=.Robot.SLM13_Link2.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM13_Link2.todisk location=52.064883, -80.655118, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.mar2 

entity attributes entity_name=.Robot.SLM13_Link2.todisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM13_Link2.link width=9.600000 depth=9.600000 i_marker=.Robot.SLM13_Link2.toSlider j_marker=.Robot.SLM13_Link2.todisk


entity attributes entity_name=.Robot.SLM13_Link2.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM13_Link2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM13_Jdisk2_link2 i_marker_name=.Robot.SLM13_Link2.todisk j_marker_name=.Robot.SLM13_disk2.tolink2
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM13_Jslider_link2 i_marker_name=.Robot.SLM13_slider.slider2link2 j_marker_name=.Robot.SLM13_Link2.toSlider
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_rot2 function="AZ(.Robot.SLM13_disk2.shiftedmarBack, .Robot.FthPlate.lm13_basemar)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_disk2_rot function="AZ(.Robot.SLM13_disk2.shiftedmarFront, .Robot.SLM13_Brace.mar2alignedwithmar1)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM13_disk1_rot function="AZ(.Robot.FthPlate.lm13_basemar, .Robot.SLM13_Brace.basemaralignedwithmar2)*RTOD"
view zoom auto=on
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM14_Brace
part mod rigid_body mass_properties part_name=.Robot.SLM14_Brace material_type = steel

marker create marker_name=.Robot.SLM14_Brace.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM14_Brace.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Brace.basemarker location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM13_disk2.baseMarkerI 

entity attributes entity_name=.Robot.SLM14_Brace.basemarker visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Brace.basemaralignedwithmar2 location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_Brace.basemaralignedwithmar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Brace.mar2alignedwithmar1 location=291.231866, 72.000000, -64.800000 orientation=0.000000, 0.000000, 13.886540 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_Brace.mar2alignedwithmar1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Brace.braceGeoMar location=298.431866, 36.000000, -32.400000 orientation=90.000000, -90.000000, -90.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_Brace.braceGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM14_Brace.halfBraceL reference_marker=.Robot.SLM14_Brace.braceGeoMar  points_for_profile= &
3.600000, -28.800000, 0.000000, &
28.800000, -28.800000, 0.000000, &
28.800000, 28.800000, 0.000000, &
3.600000, 28.800000, 0.000000, &
3.600000, 21.600000, 0.000000, &
21.600000, 21.600000, 0.000000, &
21.600000, -21.600000, 0.000000, &
3.600000, -21.600000, 0.000000, &
3.600000, -28.800000, 0.000000 &
length_along_z_axis=305.631866 analytical=yes &
relative_to=.Robot.SLM14_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM14_Brace.halfBraceL type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM14_Brace.halfBraceL render=filled
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM14_Brace.halfBraceR reference_marker=.Robot.SLM14_Brace.braceGeoMar  points_for_profile= &
-3.600000, -21.600000, 0.000000, &
-21.600000, -21.600000, 0.000000, &
-21.600000, 21.600000, 0.000000, &
-3.600000, 21.600000, 0.000000, &
-3.600000, 28.800000, 0.000000, &
-28.800000, 28.800000, 0.000000, &
-28.800000, -28.800000, 0.000000, &
-3.600000, -28.800000, 0.000000, &
-3.600000, -21.600000, 0.000000 &
length_along_z_axis=305.631866 analytical=yes &
relative_to=.Robot.SLM14_Brace.braceGeoMar
entity attributes entity_name=.Robot.SLM14_Brace.halfBraceR type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM14_Brace.halfBraceR render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM14_Brace.brace2disk location=291.231866, 72.000000, -64.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_Brace.brace2disk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Brace.toSlider location=0.000000, 36.000000, -32.400000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_Brace.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM14_Brace material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM14_Brace material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM14_RevJ i_marker_name=.Robot.SLM14_Brace.basemarker j_marker_name=.Robot.SLM13_disk2.baseMarkerI
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_rot1 function="AZ(.Robot.SLM14_Brace.basemaralignedwithmar2, .Robot.SLM13_disk2.fornextJ)*RTOD"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM14_disk2
part mod rigid_body mass_properties part_name=.Robot.SLM14_disk2 material_type = steel

marker create marker_name=.Robot.SLM14_disk2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM14_disk2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.mar2 location=291.231866, 72.000000, -64.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_disk2.mar2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.baseMarkerII location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.mar2 

entity attributes entity_name=.Robot.SLM14_disk2.baseMarkerII visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.tolink2 location=39.048662, -60.491338, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.baseMarkerII 

entity attributes entity_name=.Robot.SLM14_disk2.tolink2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.shiftedmarBack location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, -1.869519 relative_to=.Robot.SLM14_Brace.mar2alignedwithmar1 

entity attributes entity_name=.Robot.SLM14_disk2.shiftedmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.distalmarBack location=155.523760, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM14_disk2.distalmarBack visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.linkXdisk location=155.523760, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM14_disk2.linkXdisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geom create shape plate plate=.Robot.SLM14_disk2.triangle marker_name=.Robot.SLM14_disk2.mar2, .Robot.SLM14_disk2.tolink2, .Robot.SLM14_disk2.linkXdisk radius=7.200000 width=7.200000
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.shiftedmarFront location=0.000000, 0.000000, 63.360000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.shiftedmarBack 

entity attributes entity_name=.Robot.SLM14_disk2.shiftedmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.distalmarFront location=0.000000, 0.000000, 63.360000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.distalmarBack 

entity attributes entity_name=.Robot.SLM14_disk2.distalmarFront visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_disk2.ballmar location=0.000000, 0.000000, 31.680000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.distalmarBack 

entity attributes entity_name=.Robot.SLM14_disk2.ballmar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape ellipsoid ellipsoid_name=.Robot.SLM14_disk2.ball x_scale_factor=180.000000 y_scale_factor=180.000000  z_scale_factor=180.000000  center_marker=.Robot.SLM14_disk2.ballmar

entity attributes entity_name=.Robot.SLM14_disk2.ball color=.colors.WHITE
 
view zoom auto=on
geometry create shape link link_name=.Robot.SLM14_disk2.link2 width=7.200000 depth=7.200000 i_marker=.Robot.SLM14_disk2.shiftedmarFront j_marker=.Robot.SLM14_disk2.distalmarFront


entity attributes entity_name=.Robot.SLM14_disk2.link2 type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM14_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM14_disk2 material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM14_disk2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM14_RevJ2 i_marker_name=.Robot.SLM14_disk2.mar2 j_marker_name=.Robot.SLM14_Brace.brace2disk
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM14_slider
part mod rigid_body mass_properties part_name=.Robot.SLM14_slider material_type = steel

marker create marker_name=.Robot.SLM14_slider.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM14_slider.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_slider.toBrace location=0.000000, 36.000000, -32.400000 orientation=90.000000, 90.000000, -90.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_slider.toBrace visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_slider.sliderGeoMar location=0.000000, 36.000000, -32.400000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_slider.sliderGeoMar visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM14_slider.sliderblock reference_marker=.Robot.SLM14_slider.sliderGeoMar  points_for_profile= &
266.406266, 36.000000, -3.600000, &
266.406266, -36.000000, -3.600000, &
-7.200000, -36.000000, -3.600000, &
-7.200000, 36.000000, -3.600000, &
266.406266, 36.000000, -3.600000 &
length_along_z_axis=7.200000 analytical=yes &
relative_to=.Robot.SLM14_slider.sliderGeoMar
entity attributes entity_name=.Robot.SLM14_slider.sliderblock type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM14_slider.sliderblock render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM14_slider.slider2link1 location=0.000000, 72.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_slider.slider2link1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM14_slider.sliderblock1 reference_marker=.Robot.SLM14_slider.slider2link1  points_for_profile= &
7.200000, 0.000000, -61.200000, &
6.765788, 2.462543, -61.200000, &
5.515523, 4.628068, -61.200000, &
3.600006, 6.235380, -61.200000, &
1.250275, 7.090614, -61.200000, &
-1.250256, 7.090618, -61.200000, &
-3.599989, 6.235389, -61.200000, &
-5.515510, 4.628082, -61.200000, &
-6.765781, 2.462561, -61.200000, &
-7.200000, 0.000019, -61.200000, &
7.200000, 0.000000, -61.200000 &
length_along_z_axis=57.600000 analytical=yes &
relative_to=.Robot.SLM14_slider.slider2link1
entity attributes entity_name=.Robot.SLM14_slider.sliderblock1 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM14_slider.sliderblock1 render=filled
view zoom auto=on
marker create marker_name=.Robot.SLM14_slider.slider2link2 location=259.206266, 0.000000, -64.800000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_slider.slider2link2 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape extrusion extrusion_name = .Robot.SLM14_slider.sliderblock2 reference_marker=.Robot.SLM14_slider.slider2link2  points_for_profile= &
-7.200000, 0.000019, 3.600000, &
-6.765794, -2.462525, 3.600000, &
-5.515535, -4.628053, 3.600000, &
-3.600022, -6.235370, 3.600000, &
-1.250294, -7.090611, 3.600000, &
1.250238, -7.090621, 3.600000, &
3.599972, -6.235399, 3.600000, &
5.515498, -4.628097, 3.600000, &
6.765775, -2.462579, 3.600000, &
7.200000, -0.000038, 3.600000, &
-7.200000, 0.000019, 3.600000 &
length_along_z_axis=57.600000 analytical=yes &
relative_to=.Robot.SLM14_slider.slider2link2
entity attributes entity_name=.Robot.SLM14_slider.sliderblock2 type_filter=Extrusion visibility=on color=.colors.RED entity_scope=all_color
geometry attributes geometry=.Robot.SLM14_slider.sliderblock2 render=filled
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM14_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM14_slider material_type = steel
part mod rigid_body mass_properties part_name=.Robot.SLM14_slider material_type = steel

view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_motionFunc function="16.012800+sin(time/5*PI-PI/2)*80.812800"
view zoom auto=on
constraint create joint translational joint_name=.Robot.SLM14_SliderJoint i_marker_name=.Robot.SLM14_slider.toBrace j_marker_name=.Robot.SLM14_Brace.toSlider
constraint create motion_generator motion_name=.Robot.SLM14_SliderJoint_motion type_of_freedom=translational joint_name=.Robot.SLM14_SliderJoint  function="VARVAL(.Robot.SLM14_motionFunc)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_Act_forceX function="JOINT(.Robot.SLM14_SliderJoint, 0, 2, .Robot.SLM14_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_Act_forceY function="JOINT(.Robot.SLM14_SliderJoint, 0, 3, .Robot.SLM14_Brace.toSlider)"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_Act_forceZ function="MOTION(.Robot.SLM14_SliderJoint_motion, 0, 4, .Robot.SLM14_Brace.toSlider)"
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM14_Link1
part mod rigid_body mass_properties part_name=.Robot.SLM14_Link1 material_type = steel

marker create marker_name=.Robot.SLM14_Link1.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM14_Link1.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Link1.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_slider.slider2link1 

entity attributes entity_name=.Robot.SLM14_Link1.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Link1.todisk1 location=-62.352000, 36.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_Brace.basemarker 

entity attributes entity_name=.Robot.SLM14_Link1.todisk1 visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM14_Link1.link width=7.200000 depth=7.200000 i_marker=.Robot.SLM14_Link1.toSlider j_marker=.Robot.SLM14_Link1.todisk1


entity attributes entity_name=.Robot.SLM14_Link1.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM14_Link1 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM14_Jslider_link1 i_marker_name=.Robot.SLM14_slider.slider2link1 j_marker_name=.Robot.SLM14_Link1.toSlider
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM14_Jdisk1_link1 i_marker_name=.Robot.SLM14_Link1.todisk1 j_marker_name=.Robot.SLM13_disk2.tolink1
view zoom auto=on
part create rigid_body name_and_position part_name=.Robot.SLM14_Link2
part mod rigid_body mass_properties part_name=.Robot.SLM14_Link2 material_type = steel

marker create marker_name=.Robot.SLM14_Link2.cm location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=ground 

entity attributes entity_name=.Robot.SLM14_Link2.cm visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Link2.toSlider location=0.000000, 0.000000, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_slider.slider2link2 

entity attributes entity_name=.Robot.SLM14_Link2.toSlider visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
marker create marker_name=.Robot.SLM14_Link2.todisk location=39.048662, -60.491338, 0.000000 orientation=0.000000, 0.000000, 0.000000 relative_to=.Robot.SLM14_disk2.mar2 

entity attributes entity_name=.Robot.SLM14_Link2.todisk visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
geometry create shape link link_name=.Robot.SLM14_Link2.link width=7.200000 depth=7.200000 i_marker=.Robot.SLM14_Link2.toSlider j_marker=.Robot.SLM14_Link2.todisk


entity attributes entity_name=.Robot.SLM14_Link2.link type_filter=Extrusion visibility=on color=.colors.GREEN entity_scope=all_color
view zoom auto=on
part mod rigid_body mass_properties part_name=.Robot.SLM14_Link2 material_type = steel

view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM14_Jdisk2_link2 i_marker_name=.Robot.SLM14_Link2.todisk j_marker_name=.Robot.SLM14_disk2.tolink2
view zoom auto=on
constraint create joint revolute joint_name=.Robot.SLM14_Jslider_link2 i_marker_name=.Robot.SLM14_slider.slider2link2 j_marker_name=.Robot.SLM14_Link2.toSlider
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_rot2 function="AZ(.Robot.SLM14_disk2.shiftedmarBack, .Robot.SLM13_disk2.fornextJ)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_disk2_rot function="AZ(.Robot.SLM14_disk2.shiftedmarFront, .Robot.SLM14_Brace.mar2alignedwithmar1)*RTOD"
view zoom auto=on
data_element create variable variable_name=.Robot.SLM14_disk1_rot function="AZ(.Robot.SLM13_disk2.fornextJ, .Robot.SLM14_Brace.basemaralignedwithmar2)*RTOD"
view zoom auto=on
view zoom auto=on
view zoom auto=on
simulation single trans type= static initial_static=no end_time=5 number_of_steps=50

; KISSlicer - PRO
; Windows
; version 1.6.3 Release Win64
; Built: May  3 2018, 10:24:43
; Running on 8 cores
;
; Saved: 2018-09-30 17:44:53
; 'mc_testmodel4_KISS.gcode'
;
; Anti-shrink gain x=1.000000, y=1.000000, z=1.000000
;
; *** Printer Settings ***
;
; printer_name = CubePrometheus+filaswitch+Duet
; profile_date = 2018-09-30 16:00:40
; bed_STL_filename = 
; extension = gcode
; cost_per_hour = 0
; g_code_prefix = 3B205354415254205343524950542053544152540A47
; ^   32310A4739300A4D38300A4D31303620503020533020203B20706172
; ^   7420636F6F6C696E672066616E2073706565640A4D383320203B2065
; ^   787472756465722072656C6174697665206D6F64650A4D3130342053
; ^   3C54454D503E2054303B207365742065787472756465722074656D70
; ^   0A4D31303420533C54454D503E2054313B2073657420657874727564
; ^   65722074656D700A4D31303420533C54454D503E2054323B20736574
; ^   2065787472756465722074656D700A4D31303420533C54454D503E20
; ^   54333B207365742065787472756465722074656D700A4D3134302053
; ^   3C4245443E203B20736574206265642074656D700A4D31393020533C
; ^   4245443E203B207761697420666F72206265642074656D700A473238
; ^   20203B20686F6D6520616C6C20776974686F7574206D657368206265
; ^   64206C6576656C0A473239203B206175746F6C6576656C0A4D313136
; ^   20203B207761697420616C6C2074656D70730A4D3130362050312053
; ^   32303020203B20686F7420656E642066616E2073706565640A473120
; ^   453320463330300A3B2053544152542053435249505420454E44
; > Decoded
; >   ; START SCRIPT START
; >   G21
; >   G90
; >   M80
; >   M106 P0 S0  ; part cooling fan speed
; >   M83  ; extruder relative mode
; >   M104 S<TEMP> T0; set extruder temp
; >   M104 S<TEMP> T1; set extruder temp
; >   M104 S<TEMP> T2; set extruder temp
; >   M104 S<TEMP> T3; set extruder temp
; >   M140 S<BED> ; set bed temp
; >   M190 S<BED> ; wait for bed temp
; >   G28  ; home all without mesh bed level
; >   G29 ; autolevel
; >   M116  ; wait all temps
; >   M106 P1 S200  ; hot end fan speed
; >   G1 E3 F300
; >   ; START SCRIPT END
; g_code_preheat = 3B20686561742074686520286E6578742C207468656
; ^   E2063757272656E742920657874727564657220776974686F7574207
; ^   7616974696E670A4D31303420533C54454D503E0A3B4D31303420533
; ^   C54454D503E20543C4558542B303E0A3B20556E636F6D6D656E74207
; ^   468652070726576696F7573206C696E6520746F20656E61626C65207
; ^   07265686561740A
; > Decoded
; >   ; heat the (next, then current) extruder without waiting
; >   M104 S<TEMP>
; >   ;M104 S<TEMP> T<EXT+0>
; >   ; Uncomment the previous line to enable preheat
; g_code_warm = 3B2053454C454354204E4557204558542053544152540A
; ^   4D31303420533C54454D503E0A3B20544F4F4C204348414E47450A54
; ^   3C4558542B303E0A3B20544F4F4C5F4348414E47455F454E440A3C4D
; ^   41544C3E0A
; > Decoded
; >   ; SELECT NEW EXT START
; >   M104 S<TEMP>
; >   ; TOOL CHANGE
; >   T<EXT+0>
; >   ; TOOL_CHANGE_END
; >   <MATL>
; g_code_same_warm = 3B204D6F766520746F20746865207374617274206
; ^   F6620746865206E65787420706174680A3B473120583C4E455854583
; ^   E20593C4E455854593E2046363030300A3B47342050300A3B2053616
; ^   D652065787472756465722C207761726D20616E6420776169740A4D3
; ^   1303420533C54454D503E0A4D31303920533C54454D503E
; > Decoded
; >   ; Move to the start of the next path
; >   ;G1 X<NEXTX> Y<NEXTY> F6000
; >   ;G4 P0
; >   ; Same extruder, warm and wait
; >   M104 S<TEMP>
; >   M109 S<TEMP>
; g_code_same_cool = 3B204E4F4E45
; > Decoded
; >   ; NONE
; g_code_cool = 3B204E4F4E45
; > Decoded
; >   ; NONE
; g_code_N_layers = NULL
; > Decoded
; g_code_postfix = 3B20454E44205343524950542053544152540A47342
; ^   03B20776169740A54300A4D313034205430205330203B207475726E2
; ^   06F6666206865617465720A4D313430205330203B207475726E206F6
; ^   66620686561746265640A47393120202020203B72656C61746976652
; ^   0706F736974696F6E696E670A473120452D332046333030203B72657
; ^   472616374207468652066696C616D656E74206120626974206265666
; ^   F7265206C696674696E6720746865206E6F7A7A6C6520746F2072656
; ^   C6561736520736F6D65206F66207468652070726573737572650A473
; ^   9302020202020202020203B6162736F6C75746520706F736974696F6
; ^   E696E670A4D313037203B207475726E206F66662066616E0A4731205
; ^   83020593134302046333530303B20686F6D652058205920617869730
; ^   A4731205A3134352046323530303B206C6F776572207A20617869730
; ^   A4D3834203B2064697361626C65206D6F746F72730A0A47342050333
; ^   0303030300A4D38312020202020202020203B207475726E206F66662
; ^   04154580A3B20454E442053435249505420454E44
; > Decoded
; >   ; END SCRIPT START
; >   G4 ; wait
; >   T0
; >   M104 T0 S0 ; turn off heater
; >   M140 S0 ; turn off heatbed
; >   G91     ;relative positioning
; >   G1 E-3 F300 ;retract the filament a bit before lifting t
; >   he nozzle to release some of the pressure
; >   G90         ;absolute positioning
; >   M107 ; turn off fan
; >   G1 X0 Y140 F3500; home X Y axis
; >   G1 Z145 F2500; lower z axis
; >   M84 ; disable motors
; >   G4 P300000
; >   M81         ; turn off ATX
; >   ; END SCRIPT END
; g_code_pause = 3B205061757365207468656E20526573756D650A3B207
; ^   57375616C6C79204D3020287479706963616C29206F72204D3120286
; ^   C65737320636F6D6D6F6E29206F72204D32323620286C65617374207
; ^   06F727461626C65290A4D300A
; > Decoded
; >   ; Pause then Resume
; >   ; usually M0 (typical) or M1 (less common) or M226 (leas
; >   t portable)
; >   M0
; post_process = NULL
; > Decoded
; every_N_layers = 0
; num_extruders = 4
; firmware_type = 1
; add_comments = 1
; g4p_uses_seconds = 0
; fan_on = M106
; fan_off = M107
; fan_pwm = 1
; add_m101_g10 = 0
; z_speed_mm_per_s = 15
; z_settle_mm = 0
; bed_size_x_mm = 145
; bed_size_y_mm = 148
; bed_size_z_mm = 148
; ext_radius = 0
; bed_offset_x_mm = 72.5
; bed_offset_y_mm = 74
; bed_offset_z_mm = 0
; bed_roughness_mm = 0
; round_bed = 0
; travel_speed_mm_per_s = 150
; rim_speed_mm_per_s = 150
; first_layer_speed_mm_per_s = 20
; dmax_per_layer_mm_per_s = 15
; xy_accel_mm_per_s_per_s = 3000
; xy_steps_per_mm = 160
; lo_speed_top_mm_per_s = 7.5
; lo_speed_perim_mm_per_s = 10
; lo_speed_loops_mm_per_s = 20
; lo_speed_solid_mm_per_s = 25
; lo_speed_sparse_mm_per_s = 30
; hi_speed_top_mm_per_s = 15
; hi_speed_perim_mm_per_s = 20
; hi_speed_loops_mm_per_s = 40
; hi_speed_solid_mm_per_s = 50
; hi_speed_sparse_mm_per_s = 60
; top_raft_speed_mm_per_s = 20
; bottom_raft_speed_mm_per_s = 10
; ext_gain_1 = 1
; ext_1_mat_name = PLA (Cube) LA
; ext_axis_1 = 0
; ext_gain_2 = 1
; ext_2_mat_name = PLA (Cube) LA
; ext_axis_2 = 0
; ext_Xoff_2 = 0
; ext_Yoff_2 = 0
; ext_gain_3 = 1
; ext_3_mat_name = PLA (Cube) LA
; ext_axis_3 = 0
; ext_Xoff_3 = 0
; ext_Yoff_3 = 0
; ext_gain_4 = 1
; ext_4_mat_name = PLA (Cube) LA
; ext_axis_4 = 0
; ext_Xoff_4 = 0
; ext_Yoff_4 = 0
; heat_time_coef_1 = 0.0015
; nozzle_dia_1 = 0.4
; nozzle_len_1 = 0.6
; drive_len_1 = 450
; heat_time_coef_2 = 0.0015
; nozzle_dia_2 = 0.4
; nozzle_len_2 = 0.6
; drive_len_2 = 450
; heat_time_coef_3 = 0.0015
; nozzle_dia_3 = 0.4
; nozzle_len_3 = 0.6
; drive_len_3 = 450
; heat_time_coef_4 = 0.0015
; nozzle_dia_4 = 0.4
; nozzle_len_4 = 0.6
; drive_len_4 = 450
; model_ext = 0
; support_ext = 0
; support_body_ext = 0
; raft_ext = 0
; ext_order_optimize = 0
; solid_loop_overlap_fraction = 0.5
; min_seg_len_mm = 0.0125
; z_step_mm = 0.0125
; max_nodes_per_s = 150
;
; *** Material Settings for Extruder 1 ***
;
; material_name = PLA (Cube) LA
; profile_date = 2018-09-08 21:58:53
; g_code_matl = 4D3537322044303A332053302E34202020203B20447565
; ^   7420507265737375726520416476616E63650A4D3130362050312053
; ^   3235352020202020203B20686F7420656E642066616E207370656564
; > Decoded
; >   M572 D0:3 S0.4    ; Duet Pressure Advance
; >   M106 P1 S255      ; hot end fan speed
; g_code_matl_custom = NULL
; > Decoded
; matl_user_notes = 4D6174657269616C2050726F66696C652057697A61
; ^   72640A3E204D6174657269616C3A20504C410A3E2046696C616D656E
; ^   74206469616D65746572203D20312E3735205B6D6D5D0A3E20457874
; ^   727573696F6E2074656D7065726174757265203D20323035205B435D
; ^   0A
; > Decoded
; >   Material Profile Wizard
; >   > Material: PLA
; >   > Filament diameter = 1.75 [mm]
; >   > Extrusion temperature = 205 [C]
; fan_Z_mm = 0.5
; fan_loops_percent = 100
; fan_inside_percent = 65
; fan_cool_percent = 100
; temperature_C = 205
; keep_warm_C = 154
; first_layer_C = 215
; bed_C = 60
; chamber_C = 0
; preheat_strategy = 3
; flow_min_mm3_per_s = 1
; flow_max_mm3_per_s = 10
; flow_cool_mm3_per_s = 1
; destring_length = 1.6
; preload_factor = 0
; matl_viscosity_over_elasticity_us = 0
; destring_min_mm = 2
; destring_trigger_mm = 1
; preload_speed_mm_per_s = 15
; destring_speed_mm_per_s = 50
; Z_lift_mm = 0.5
; min_layer_time_s = 10
; wipe_mm = 5
; cost_per_cm3 = 0.04
; flowrate_tweak = 1
; fiber_dia_mm = 1.75
; shrink_percent_xy = 0
; shrink_percent_y = 0
; shrink_percent_z = 0
; purge_vol_mm3 = 42
; purge_color_strength = 0.5
; color = 0
;
; *** Material Settings for Extruder 2 ***
;
; material_name = PLA (Cube) LA
; profile_date = 2018-09-08 21:58:53
; g_code_matl = 4D3537322044303A332053302E34202020203B20447565
; ^   7420507265737375726520416476616E63650A4D3130362050312053
; ^   3235352020202020203B20686F7420656E642066616E207370656564
; > Decoded
; >   M572 D0:3 S0.4    ; Duet Pressure Advance
; >   M106 P1 S255      ; hot end fan speed
; g_code_matl_custom = NULL
; > Decoded
; matl_user_notes = 4D6174657269616C2050726F66696C652057697A61
; ^   72640A3E204D6174657269616C3A20504C410A3E2046696C616D656E
; ^   74206469616D65746572203D20312E3735205B6D6D5D0A3E20457874
; ^   727573696F6E2074656D7065726174757265203D20323035205B435D
; ^   0A
; > Decoded
; >   Material Profile Wizard
; >   > Material: PLA
; >   > Filament diameter = 1.75 [mm]
; >   > Extrusion temperature = 205 [C]
; fan_Z_mm = 0.5
; fan_loops_percent = 100
; fan_inside_percent = 65
; fan_cool_percent = 100
; temperature_C = 205
; keep_warm_C = 154
; first_layer_C = 215
; bed_C = 60
; chamber_C = 0
; preheat_strategy = 3
; flow_min_mm3_per_s = 1
; flow_max_mm3_per_s = 10
; flow_cool_mm3_per_s = 1
; destring_length = 1.6
; preload_factor = 0
; matl_viscosity_over_elasticity_us = 0
; destring_min_mm = 2
; destring_trigger_mm = 1
; preload_speed_mm_per_s = 15
; destring_speed_mm_per_s = 50
; Z_lift_mm = 0.5
; min_layer_time_s = 10
; wipe_mm = 5
; cost_per_cm3 = 0.04
; flowrate_tweak = 1
; fiber_dia_mm = 1.75
; shrink_percent_xy = 0
; shrink_percent_y = 0
; shrink_percent_z = 0
; purge_vol_mm3 = 42
; purge_color_strength = 0.5
; color = 0
;
; *** Material Settings for Extruder 3 ***
;
; material_name = PLA (Cube) LA
; profile_date = 2018-09-08 21:58:53
; g_code_matl = 4D3537322044303A332053302E34202020203B20447565
; ^   7420507265737375726520416476616E63650A4D3130362050312053
; ^   3235352020202020203B20686F7420656E642066616E207370656564
; > Decoded
; >   M572 D0:3 S0.4    ; Duet Pressure Advance
; >   M106 P1 S255      ; hot end fan speed
; g_code_matl_custom = NULL
; > Decoded
; matl_user_notes = 4D6174657269616C2050726F66696C652057697A61
; ^   72640A3E204D6174657269616C3A20504C410A3E2046696C616D656E
; ^   74206469616D65746572203D20312E3735205B6D6D5D0A3E20457874
; ^   727573696F6E2074656D7065726174757265203D20323035205B435D
; ^   0A
; > Decoded
; >   Material Profile Wizard
; >   > Material: PLA
; >   > Filament diameter = 1.75 [mm]
; >   > Extrusion temperature = 205 [C]
; fan_Z_mm = 0.5
; fan_loops_percent = 100
; fan_inside_percent = 65
; fan_cool_percent = 100
; temperature_C = 205
; keep_warm_C = 154
; first_layer_C = 215
; bed_C = 60
; chamber_C = 0
; preheat_strategy = 3
; flow_min_mm3_per_s = 1
; flow_max_mm3_per_s = 10
; flow_cool_mm3_per_s = 1
; destring_length = 1.6
; preload_factor = 0
; matl_viscosity_over_elasticity_us = 0
; destring_min_mm = 2
; destring_trigger_mm = 1
; preload_speed_mm_per_s = 15
; destring_speed_mm_per_s = 50
; Z_lift_mm = 0.5
; min_layer_time_s = 10
; wipe_mm = 5
; cost_per_cm3 = 0.04
; flowrate_tweak = 1
; fiber_dia_mm = 1.75
; shrink_percent_xy = 0
; shrink_percent_y = 0
; shrink_percent_z = 0
; purge_vol_mm3 = 42
; purge_color_strength = 0.5
; color = 0
;
; *** Material Settings for Extruder 4 ***
;
; material_name = PLA (Cube) LA
; profile_date = 2018-09-08 21:58:53
; g_code_matl = 4D3537322044303A332053302E34202020203B20447565
; ^   7420507265737375726520416476616E63650A4D3130362050312053
; ^   3235352020202020203B20686F7420656E642066616E207370656564
; > Decoded
; >   M572 D0:3 S0.4    ; Duet Pressure Advance
; >   M106 P1 S255      ; hot end fan speed
; g_code_matl_custom = NULL
; > Decoded
; matl_user_notes = 4D6174657269616C2050726F66696C652057697A61
; ^   72640A3E204D6174657269616C3A20504C410A3E2046696C616D656E
; ^   74206469616D65746572203D20312E3735205B6D6D5D0A3E20457874
; ^   727573696F6E2074656D7065726174757265203D20323035205B435D
; ^   0A
; > Decoded
; >   Material Profile Wizard
; >   > Material: PLA
; >   > Filament diameter = 1.75 [mm]
; >   > Extrusion temperature = 205 [C]
; fan_Z_mm = 0.5
; fan_loops_percent = 100
; fan_inside_percent = 65
; fan_cool_percent = 100
; temperature_C = 205
; keep_warm_C = 154
; first_layer_C = 215
; bed_C = 60
; chamber_C = 0
; preheat_strategy = 3
; flow_min_mm3_per_s = 1
; flow_max_mm3_per_s = 10
; flow_cool_mm3_per_s = 1
; destring_length = 1.6
; preload_factor = 0
; matl_viscosity_over_elasticity_us = 0
; destring_min_mm = 2
; destring_trigger_mm = 1
; preload_speed_mm_per_s = 15
; destring_speed_mm_per_s = 50
; Z_lift_mm = 0.5
; min_layer_time_s = 10
; wipe_mm = 5
; cost_per_cm3 = 0.04
; flowrate_tweak = 1
; fiber_dia_mm = 1.75
; shrink_percent_xy = 0
; shrink_percent_y = 0
; shrink_percent_z = 0
; purge_vol_mm3 = 42
; purge_color_strength = 0.5
; color = 0
;
; *** Style Settings ***
;
; style_name = 0.45mm dc
; profile_date = 2018-09-29 20:43:08
; quality_percentage = 16
; layer_thickness_mm = 0.15
; max_layer_thickness_mm = 0.25
; first_layer_thickness_mm = 0.2
; unsupported_stepover_mm = 0.2
; supported_stepover_mm = 0.2
; extrusion_width_mm = 0.45
; num_loops = 2
; skin_thickness_mm = 1
; infill_extrusion_width = 0.55
; infill_density_denominator = 6
; stacked_layers = 1
; use_corners = 1
; force_joint_layers = 0
; loops_insideout = 1
; join_perimeter_loop = 1
; infill_st_oct_rnd = 0
; travel_mode = 1
; inset_surface_xy_mm = 0
; seam_jitter_degrees = 0
; seam_depth_scaler = 1
; seam_gap_scaler = 0.5
; seam_angle_degrees = 0
; crowning_threshold_mm = 1
;
; *** Support Settings ***
;
; support_name = No support, small brim
; profile_date = 2018-09-18 18:00:47
; support_sheathe = 0
; support_density = 0
; use_lower_interface = 1
; solid_interface = 0
; support_inflate_mm = 0
; support_gap_mm = 0.5
; interface_gap_mm = -75
; support_angle_deg = 50
; support_z_max_mm = -1
; sheathe_z_max_mm = -1
; raft_mode = 0
; prime_pillar_mode = 0
; pillar_placement = -3
; raft_inflate_mm = 2
; raft_hi_stride_mm = 1.5
; raft_hi_thick_mm = 0.25
; raft_hi_width_mm = 0.35
; raft_lo_stride_mm = 2.5
; raft_lo_thick_mm = 0.25
; raft_lo_width_mm = 0.5
; brim_mm = 1
; brim_ht_mm = 0
; brim_gap_mm = 0
; brim_fillet = 1
; interface_band_mm = 2
; interface_Z_gap_mm = 0
; first_Z_gap_mm = 0
; raft_interface_layers = 0
; raft_interface_bond = 0
; brim_latch = 0
; interface_angle_deg = 30
; interface_stride_mm = 1
; interface_width_mm = 0.5
; interface_1st_layer_width_mm = 0.5
;
; *** Actual Slicing Settings As Used ***
;
; layer_thickness_mm = 0.15
; max_layer_thickness_mm = 0.25
; first_layer_thickness_mm = 0.2
; unsupported_stepover_mm = 0.2
; supported_stepover_mm = 0.2
; extrusion_width = 0.45
; num_ISOs = 2
; wall_thickness = 1
; infill_style = 8
; support_style = 0
; use_lower_interface = 1
; solid_interface = 0
; support_angle = 49.9
; destring_min_mm = 2
; stacked_infill_layers = 1
; raft_style = 0
; raft_sees_prime_paths = 0
; raft_extra_interface_layers = 0
; raft_extra_interface_bond = 0
; brim_latch = 0
; raft_hi_stride_mm = 0
; raft_lo_stride_mm = 0
; oversample_res_mm = 0.125
; crowning_threshold_mm = 1
; loops_insideout = 1
; join_perimeter_loop = 1
; solid_loop_overlap_fraction = 0.5
; inflate_raft_mm = 0
; inflate_support_mm = 0
; model_support_gap_mm = 0.5
; model_interface_gap_mm = 0.3375
; brim_mm = 1
; brim_ht_mm = 0
; brim_gap_mm = 0
; infill_st_oct_rnd = 0
; travel_mode = 1
; support_Z_max_mm = 1e+020
; support_sheathe_off_main_both_int = 0
; inset_surface_xy_mm = 0
; seam_jitter_degrees = 0
; seam_depth_scaler = 1
; seam_gap_scaler = 0.5
; seam_angle_degrees = 0
; seam_use_corners = 1
; force_joint_layers = 0
; interface_band_mm = 2
; skip_N_support_layers = 0
; interface_angle_deg = 30
; interface_stride_mm = 1
; printer_z_step_mm = 0.0125
; model_and_int_share_ext = 1
; Speed vs Quality = 0.16
; Top Surface Speed = 13.80
; Perimeter Speed = 18.40
; Loops Speed = 36.80
; Solid Speed = 46.00
; Sparse Speed = 55.20
;
; *** G-code Prefix ***
;
; START SCRIPT START
G21
G90
M80
M106 P0 S0  ; part cooling fan speed
M83  ; extruder relative mode
M104 S215 T0; set extruder temp
M104 S215 T1; set extruder temp
M104 S215 T2; set extruder temp
M104 S215 T3; set extruder temp
M140 S60 ; set bed temp
M190 S60 ; wait for bed temp
G28  ; home all without mesh bed level
G29 ; autolevel
M116  ; wait all temps
M106 P1 S200  ; hot end fan speed
G1 E3 F300
; START SCRIPT END
;
; *** Main G-code ***
;
; BEGIN_LAYER_OBJECT z=0.200 z_thickness=0.200
;
; *** Selecting and Warming Extruder 1 to 215 C ***
; SELECT NEW EXT START
M104 S215
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X80.322 Y79.091 Z0.7 E0 F9000
G1 X80.322 Y79.091 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
;
; *** Preheating Ext 3 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T2
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 215 C ***
; heat the (next, then current) extruder without waiting
M104 S215
;M104 S215 T0
; Uncomment the previous line to enable preheat
;
G1 X80.23 Y79.25 E0.00684 F1200
G1 X79.956 Y79.725 E0.02053
G1 X79.498 Y80.516 E0.03422
G1 X78.857 Y81.625 E0.04791
G1 X78.033 Y83.05 E0.06159
G1 X77.802 Y83.253 E0.01154
G1 X77.486 Y83.319 E0.01205
G1 X67.504 Y83.315 E0.37353
G1 X67.102 Y83.165 E0.01605
G1 X66.872 Y82.889 E0.01343
G1 X64.627 Y79.002 E0.16796
G1 X64.263 Y78.988 E0.01364
G1 X59.934 Y78.985 E0.162
G1 X59.646 Y78.87 E0.01159
G1 X59.405 Y78.616 E0.0131
G1 X56.914 Y74.295 E0.18664
G1 X56.867 Y73.958 E0.0127
G1 X56.966 Y73.602 E0.01385
G1 X59.414 Y69.363 E0.18313
G1 X59.733 Y69.078 E0.01603
G1 X60.055 Y69.011 E0.0123
G1 X64.548 Y69.007 E0.16812
G1 X64.642 Y68.973 E0.00372
G1 X66.967 Y64.95 E0.17384
G1 X67.198 Y64.747 E0.01154
G1 X67.514 Y64.681 E0.01205
G1 X77.496 Y64.685 E0.37353
G1 X77.898 Y64.835 E0.01605
G1 X78.128 Y65.111 E0.01343
G1 X80.373 Y68.998 E0.16797
G1 X80.737 Y69.012 E0.01364
G1 X85.066 Y69.015 E0.16199
G1 X85.354 Y69.13 E0.0116
G1 X85.595 Y69.384 E0.01309
G1 X88.086 Y73.705 E0.18664
G1 X88.133 Y74.042 E0.0127
G1 X88.034 Y74.398 E0.01385
G1 X85.586 Y78.637 E0.18313
G1 X85.267 Y78.922 E0.01604
G1 X84.945 Y78.989 E0.01229
G1 X83.434 Y78.988 E0.05655
G1 X82.231 Y78.988 E0.045
G1 X81.337 Y78.988 E0.03345
G1 X80.752 Y78.988 E0.02189
G1 X80.475 Y78.988 E0.01035
G1 X80.452 Y78.994 E0.0009
;
; 'Loop Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X79.997 Y78.747 E0 F9000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
G1 X79.902 Y78.911 E0.00707 F1200
G1 X79.618 Y79.401 E0.0212
G1 X79.146 Y80.219 E0.03533
G1 X78.484 Y81.363 E0.04947
G1 X77.633 Y82.835 E0.06361
G1 X77.418 Y82.865 E0.00813
G1 X75.376 Y82.865 E0.07639
G1 X72.983 Y82.865 E0.08957
G1 X68.732 Y82.865 E0.15905
G1 X67.511 Y82.857 E0.04568
G1 X67.292 Y82.719 E0.00968
G1 X65.544 Y79.678 E0.13125
G1 X64.881 Y78.534 E0.0495
G1 X60.401 Y78.534 E0.16765
G1 X59.911 Y78.528 E0.01832
G1 X59.733 Y78.275 E0.01158
G1 X57.515 Y74.433 E0.166
G1 X57.327 Y74.093 E0.01454
G1 X57.346 Y73.853 E0.00904
G1 X59.802 Y69.602 E0.18369
G1 X59.998 Y69.466 E0.0089
G1 X64.442 Y69.466 E0.16631
G1 X64.88 Y69.467 E0.01636
G1 X67.367 Y65.165 E0.18593
G1 X67.582 Y65.135 E0.00813
G1 X72.017 Y65.135 E0.16596
G1 X76.268 Y65.135 E0.15905
G1 X77.489 Y65.143 E0.04569
G1 X77.708 Y65.281 E0.00968
G1 X79.456 Y68.322 E0.13125
G1 X80.119 Y69.466 E0.04949
; Prepare for Perimeter
G1 X84.599 Y69.466 E0.16765
G1 X85.089 Y69.472 E0.01832
G1 X85.267 Y69.725 E0.01159
G1 X87.485 Y73.567 E0.16599
G1 X87.673 Y73.907 E0.01454
G1 X87.654 Y74.147 E0.00904
G1 X85.198 Y78.398 E0.18369
G1 X85.002 Y78.534 E0.0089
G1 X83.462 Y78.534 E0.05764
G1 X82.208 Y78.534 E0.04693
G1 X81.24 Y78.534 E0.03622
G1 X80.558 Y78.534 E0.02552
G1 X80.12 Y78.533 E0.01636
G1 X80.085 Y78.594 E0.00264
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
G1 X77.633 Y82.835 E0 F1200
G1 X77.418 Y82.865 E0
G1 X77.357 Y82.865 E0
G1 X77.357 Y82.865 Z0.7 E0 F900
; Perimeter Length = 61.880119
;
; 'Perimeter Path', 0.7 [feed mm/s], 18.4 [head mm/s]
G1 X78.421 Y76.972 E0 F9000
G1 X78.421 Y76.972 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 18.400002, filament speed 0.688485, preload 0.000000
G1 X78.471 Y77.059 E0.00374 F1104
G1 X78.693 Y77.443 E0.01662
G1 X79.094 Y78.135 E0.0299
G1 X79.108 Y78.151 E0.00083
G1 X79.128 Y78.161 E0.00082
G1 X79.446 Y78.243 E0.01227
G1 X79.639 Y78.402 E0.00937
G1 X79.655 Y78.423 E0.00098
G1 X79.66 Y78.448 E0.00098
G1 X79.652 Y78.473 E0.00098
G1 X79.044 Y79.525 E0.04545
G1 X78.294 Y80.82 E0.05601
G1 X77.403 Y82.36 E0.06656
G1 X77.39 Y82.376 E0.00077
G1 X77.372 Y82.385 E0.00077
G1 X77.248 Y82.425 E0.00486
G1 X72.574 Y82.425 E0.17491
G1 X67.855 Y82.426 E0.17655
G1 X67.663 Y82.427 E0.00718
G1 X67.635 Y82.42 E0.0011
G1 X67.614 Y82.399 E0.0011
G1 X65.574 Y78.854 E0.15304
G1 X65.299 Y78.372 E0.02076
G1 X65.292 Y78.345 E0.00104
G1 X65.298 Y78.318 E0.00103
G1 X65.452 Y78.021 E0.01252
G1 X67.704 Y74.103 E0.16911
G1 X67.68 Y73.843 E0.00977
G1 X65.308 Y69.727 E0.17776
G1 X65.292 Y69.653 E0.00282
G1 X65.291 Y69.633 E0.00077
G1 X65.298 Y69.613 E0.00077
G1 X67.597 Y65.64 E0.17176
G1 X67.61 Y65.624 E0.00077
G1 X67.628 Y65.615 E0.00077
G1 X67.752 Y65.575 E0.00486
G1 X72.426 Y65.575 E0.17491
G1 X77.145 Y65.574 E0.17656
G1 X77.337 Y65.573 E0.00717
G1 X77.365 Y65.58 E0.0011
G1 X77.386 Y65.601 E0.0011
G1 X79.426 Y69.146 E0.15304
G1 X79.701 Y69.628 E0.02076
G1 X79.708 Y69.655 E0.00104
G1 X79.702 Y69.682 E0.00103
G1 X79.548 Y69.979 E0.01252
G1 X77.296 Y73.897 E0.16911
G1 X77.32 Y74.157 E0.00977
G1 X78.258 Y75.782 E0.07019
G1 X79.04 Y77.137 E0.05854
G1 X79.666 Y78.222 E0.04689
G1 X79.674 Y78.251 E0.00111
G1 X79.666 Y78.279 E0.00112
G1 X79.644 Y78.3 E0.00112
G1 X79.04 Y78.618 E0.02554
G1 X78.679 Y79.243 E0.02702
G1 X78.49 Y79.571 E0.01415
G1 X78.459 Y79.624 E0.00232
;
; 'Loop Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X78.441 Y79.655 E0 F9000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
G1 X78.36 Y79.794 E0.00603 F1200
G1 X78.118 Y80.213 E0.01808
G1 X77.714 Y80.91 E0.03014
G1 X77.149 Y81.885 E0.04219
G1 X77.073 Y81.972 E0.00432
G1 X75.759 Y81.972 E0.04916
G1 X74.185 Y81.972 E0.0589
G1 X72.351 Y81.972 E0.06863
G1 X67.902 Y81.971 E0.16646
G1 X65.797 Y78.333 E0.15731
G1 X68.106 Y74.321 E0.1732
G1 X68.164 Y73.912 E0.01545
G1 X68.065 Y73.602 E0.01219
G1 X65.815 Y69.697 E0.16862
G1 X65.883 Y69.516 E0.00725
G1 X67.851 Y66.115 E0.14703
G1 X67.927 Y66.028 E0.00433
; Prepare for Destring
G1 X77.098 Y66.029 E0.34315
G1 X79.203 Y69.667 E0.1573
G1 X78.331 Y71.183 E0.06545
G1 X77.561 Y72.52 E0.05773
G1 X76.894 Y73.679 E0.05002
G1 X76.836 Y74.088 E0.01545
G1 X76.935 Y74.398 E0.01219
G1 X77.582 Y75.518 E0.04839
G1 X78.043 Y76.318 E0.03456
G1 X78.32 Y76.798 E0.02073
G1 X78.413 Y76.958 E0.00692
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
G1 X76.935 Y74.398 E0 F1200
G1 X76.836 Y74.088 E0
G1 X76.894 Y73.679 E0
G1 X77.545 Y72.547 E0
G1 X77.545 Y72.547 Z0.7 E0 F900
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 69%
;
; 'Solid Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X74.89 Y81.745 E0 F9000
G1 X74.89 Y81.745 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
; Prepare for Destring
G1 X75.039 Y81.705 E0.00577 F1200
G1 X75.486 Y81.583 E0.01732
G1 X76.23 Y81.38 E0.02886
G1 X77.272 Y81.096 E0.04041
G1 X77.582 Y80.558 E0.02323
G1 X77.566 Y80.562 E0.00061
G1 X75.978 Y80.988 E0.06155
G1 X74.742 Y81.319 E0.04786
G1 X73.859 Y81.556 E0.03419
G1 X73.33 Y81.698 E0.02052
G1 X73.153 Y81.745 E0.00684
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
G1 X77.566 Y80.562 E0 F1200
G1 X77.582 Y80.558 E0
G1 X77.375 Y80.917 E0
G1 X77.375 Y80.917 Z0.7 E0 F900
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 69%
;
; 'Solid Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X71.414 Y81.745 E0 F9000
G1 X71.414 Y81.745 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
; Prepare for Destring
G1 X71.594 Y81.696 E0.00699 F1200
G1 X72.135 Y81.55 E0.02097
G1 X73.037 Y81.307 E0.03496
G1 X74.3 Y80.967 E0.04894
G1 X75.924 Y80.529 E0.06292
G1 X77.908 Y79.994 E0.0769
G1 X78.218 Y79.456 E0.02323
G1 X78.203 Y79.46 E0.00061
G1 X75.941 Y80.066 E0.08763
G1 X74.027 Y80.579 E0.07414
G1 X72.461 Y80.999 E0.06067
G1 X71.242 Y81.325 E0.04719
G1 X70.372 Y81.558 E0.03371
G1 X69.85 Y81.698 E0.02024
G1 X69.675 Y81.745 E0.00676
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
G1 X74.505 Y80.451 E0 F1200
G1 X74.505 Y80.451 Z0.7 E0 F900
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 69%
;
; 'Solid Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X68.016 Y81.724 E0 F9000
G1 X68.016 Y81.724 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
G1 X68.181 Y81.68 E0.00637 F1200
G1 X68.674 Y81.547 E0.01911
G1 X69.496 Y81.327 E0.03185
G1 X70.647 Y81.018 E0.0446
G1 X72.127 Y80.622 E0.05733
G1 X73.936 Y80.137 E0.07007
G1 X76.074 Y79.564 E0.08282
G1 X78.541 Y78.902 E0.09555
G1 X78.828 Y78.361 E0.02294
G1 X78.814 Y78.365 E0.00056
G1 X67.849 Y81.303 E0.42473
G1 X67.617 Y80.899 E0.01743
G1 X78.643 Y77.944 E0.42712
G1 X78.41 Y77.541 E0.01743
G1 X67.385 Y80.495 E0.42707
G1 X67.152 Y80.092 E0.01743
G1 X78.178 Y77.137 E0.42713
G1 X77.945 Y76.734 E0.01744
G1 X66.917 Y79.689 E0.42718
G1 X66.686 Y79.285 E0.01742
G1 X77.711 Y76.331 E0.42709
G1 X77.478 Y75.927 E0.01743
G1 X66.453 Y78.881 E0.42708
G1 X66.219 Y78.478 E0.01744
G1 X77.246 Y75.523 E0.42716
G1 X77.013 Y75.12 E0.01744
G1 X66.336 Y77.981 E0.41361
G1 X66.343 Y77.968 E0.00058
G1 X66.67 Y77.426 E0.02367
G1 X76.78 Y74.717 E0.39166
G1 X76.579 Y74.305 E0.01716
G1 X66.972 Y76.879 E0.37214
G1 X66.98 Y76.865 E0.00058
G1 X67.306 Y76.323 E0.02367
G1 X76.55 Y73.846 E0.35808
G1 X76.76 Y73.337 E0.02059
G1 X76.753 Y73.326 E0.00048
G1 X67.608 Y75.777 E0.35424
G1 X67.616 Y75.763 E0.00059
G1 X67.942 Y75.221 E0.02366
G1 X77.081 Y72.761 E0.35413
G1 X77.392 Y72.223 E0.02323
G1 X77.376 Y72.228 E0.00062
G1 X68.235 Y74.677 E0.3541
G1 X68.239 Y74.665 E0.00048
G1 X68.452 Y74.153 E0.02075
G1 X77.711 Y71.67 E0.35869
G1 X78.028 Y71.121 E0.02373
G1 X78.012 Y71.125 E0.00061
G1 X68.421 Y73.695 E0.37153
G1 X68.22 Y73.283 E0.01716
G1 X78.347 Y70.568 E0.39233
G1 X78.664 Y70.019 E0.02373
G1 X78.649 Y70.023 E0.00061
G1 X67.987 Y72.88 E0.413
G1 X67.754 Y72.477 E0.01744
G1 X78.781 Y69.522 E0.42716
G1 X78.547 Y69.119 E0.01744
G1 X67.522 Y72.073 E0.42708
G1 X67.289 Y71.669 E0.01743
G1 X78.314 Y68.715 E0.42709
G1 X78.083 Y68.311 E0.01741
G1 X67.055 Y71.266 E0.42719
G1 X66.822 Y70.863 E0.01743
G1 X77.848 Y67.908 E0.42713
G1 X77.615 Y67.505 E0.01744
G1 X66.59 Y70.459 E0.42707
G1 X66.357 Y70.056 E0.01743
G1 X77.383 Y67.101 E0.42712
G1 X77.151 Y66.697 E0.01743
; Prepare for Destring
G1 X66.172 Y69.639 E0.42529
G1 X66.178 Y69.627 E0.00051
G1 X66.462 Y69.096 E0.02255
G1 X68.926 Y68.435 E0.09545
G1 X71.062 Y67.863 E0.08274
G1 X72.87 Y67.379 E0.07002
G1 X74.349 Y66.982 E0.0573
G1 X75.5 Y66.674 E0.04459
G1 X76.323 Y66.453 E0.03188
G1 X76.817 Y66.321 E0.01915
G1 X76.984 Y66.276 E0.00645
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
G1 X72.154 Y67.57 E0 F1200
G1 X72.154 Y67.57 Z0.7 E0 F900
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 69%
;
; 'Solid Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X75.325 Y66.255 E0 F9000
G1 X75.325 Y66.255 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
; Prepare for Destring
G1 X75.151 Y66.302 E0.00675 F1200
G1 X74.628 Y66.442 E0.02027
G1 X73.756 Y66.675 E0.03377
G1 X72.535 Y67.002 E0.04728
G1 X70.966 Y67.423 E0.06078
G1 X69.048 Y67.937 E0.0743
G1 X66.782 Y68.544 E0.0878
G1 X66.789 Y68.531 E0.00058
G1 X67.116 Y67.989 E0.02367
G1 X69.093 Y67.459 E0.07658
G1 X70.71 Y67.026 E0.06266
G1 X71.968 Y66.689 E0.04874
G1 X72.867 Y66.448 E0.03481
G1 X73.406 Y66.303 E0.02089
G1 X73.586 Y66.255 E0.00698
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
G1 X68.757 Y67.549 E0 F1200
G1 X68.757 Y67.549 Z0.7 E0 F900
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 69%
;
; 'Solid Path', 0.7 [feed mm/s], 20.0 [head mm/s]
G1 X71.847 Y66.255 E0 F9000
G1 X71.847 Y66.255 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.000000, filament speed 0.748353, preload 0.000000
; Prepare for End-Of-Layer
G1 X71.67 Y66.303 E0.00686 F1200
G1 X71.138 Y66.445 E0.02059
G1 X70.252 Y66.682 E0.03431
G1 X69.012 Y67.015 E0.04804
G1 X67.418 Y67.442 E0.06177
G1 X67.426 Y67.428 E0.00058
G1 X67.752 Y66.887 E0.02367
G1 X68.783 Y66.61 E0.03995
G1 X69.52 Y66.413 E0.02855
G1 X69.962 Y66.294 E0.01712
G1 X70.11 Y66.255 E0.00571
; Blending Fan to Cool (10.6% blend)
; Blended Fan at 11%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.000000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X67.752 Y66.887 E0 F1200
G1 X67.426 Y67.428 E0
G1 X67.418 Y67.442 E0
G1 X69.264 Y66.947 E0
G1 X69.264 Y66.947 Z0.7 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 3 to 215 C ***
; SELECT NEW EXT START
M104 S215
; TOOL CHANGE
T2
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 9.005589 [s], Slowing (0.890x) to 10.0 [s] ***
; Perimeter Length = 31.976629
;
; 'Perimeter Path', 0.6 [feed mm/s], 16.4 [head mm/s]
G1 X65.909 Y72.621 Z0.7 E0 F9000
G1 X65.909 Y72.621 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 16.376001, filament speed 0.612751, preload 0.000000
;
; *** Preheating Ext 2 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T1
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 3 to 215 C ***
; heat the (next, then current) extruder without waiting
M104 S215
;M104 S215 T2
; Uncomment the previous line to enable preheat
;
G1 X65.938 Y72.672 E0.00218 F982.6
G1 X66.06 Y72.881 E0.00906
G1 X66.275 Y73.254 E0.01609
G1 X66.585 Y73.789 E0.02314
G1 X66.598 Y73.805 E0.00078
G1 X66.617 Y73.814 E0.00079
G1 X66.942 Y73.913 E0.0127
G1 X67.136 Y74.066 E0.00926
G1 X67.153 Y74.087 E0.001
G1 X67.158 Y74.113 E0.00099
G1 X67.15 Y74.138 E0.00099
G1 X66.536 Y75.2 E0.04591
G1 X65.779 Y76.51 E0.05659
G1 X64.88 Y78.067 E0.06727
G1 X64.859 Y78.087 E0.00109
G1 X64.831 Y78.095 E0.00109
G1 X60.349 Y78.095 E0.16771
G1 X60.195 Y78.094 E0.00575
G1 X60.17 Y78.088 E0.00096
G1 X60.151 Y78.072 E0.00096
G1 X60.025 Y77.904 E0.00786
; Prepare for TopLoop (0.66548)
G1 X57.812 Y74.065 E0.16579
G1 X57.79 Y74.003 E0.00247
G1 X57.787 Y73.979 E0.0009
G1 X57.794 Y73.956 E0.0009
G1 X60.11 Y69.947 E0.17324
G1 X60.13 Y69.927 E0.00104
G1 X60.156 Y69.919 E0.00104
G1 X60.476 Y69.904 E0.01199
G1 X64.793 Y69.911 E0.16151
G1 X64.912 Y69.986 E0.00527
G1 X65.81 Y71.541 E0.06718
G1 X66.56 Y72.841 E0.05618
G1 X67.164 Y73.887 E0.04519
G1 X67.171 Y73.916 E0.00112
G1 X67.163 Y73.945 E0.00112
G1 X67.141 Y73.965 E0.00112
G1 X66.548 Y74.271 E0.02496
G1 X66.196 Y74.882 E0.02638
G1 X66.006 Y75.211 E0.01421
G1 X65.97 Y75.273 E0.00271
;
; 'Loop Path', 0.7 [feed mm/s], 17.8 [head mm/s]
G1 X65.962 Y75.286 E0 F9000
; head speed 17.800001, filament speed 0.666034, preload 0.000000
G1 X65.878 Y75.433 E0.00634 F1068
G1 X65.624 Y75.872 E0.01901
G1 X65.2 Y76.606 E0.03168
; Prepare for Destring
G1 X64.607 Y77.632 E0.04435
G1 X64.145 Y77.642 E0.01731
G1 X62.451 Y77.64 E0.06339
G1 X60.396 Y77.639 E0.07689
G1 X58.333 Y74.051 E0.15485
G1 X58.331 Y73.938 E0.00424
G1 X60.38 Y70.399 E0.15301
G1 X60.533 Y70.358 E0.00594
G1 X62.105 Y70.359 E0.05881
G1 X63.462 Y70.36 E0.05078
G1 X64.604 Y70.361 E0.04275
G1 X65.149 Y71.305 E0.04078
G1 X65.538 Y71.98 E0.02914
G1 X65.772 Y72.385 E0.0175
G1 X65.85 Y72.521 E0.00586
; Fan set to Cool value 100%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 17.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 17.800001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X64.604 Y70.361 E0 F1068
G1 X62.097 Y70.359 E0
G1 X62.097 Y70.359 Z0.7 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 0.5 [feed mm/s], 12.3 [head mm/s]
G1 X62.642 Y70.585 E0 F9000
G1 X62.642 Y70.585 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 12.282000, filament speed 0.459564, preload 0.000000
; Prepare for Destring
G1 X62.493 Y70.625 E0.00576 F736.9
G1 X62.047 Y70.744 E0.01728
G1 X61.304 Y70.944 E0.02879
G1 X60.882 Y71.057 E0.01633
G1 X60.263 Y71.222 E0.02399
G1 X60.28 Y71.204 E0.00092
G1 X60.589 Y70.87 E0.01703
G1 X60.775 Y70.67 E0.01022
G1 X60.836 Y70.603 E0.00341
; Fan set to Cool value 100%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 17.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 17.800001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (0.646356)
G1 X60.28 Y71.204 E0 F1068
G1 X60.263 Y71.222 E0
G1 X62.642 Y70.585 E0
G1 X62.642 Y70.585 Z0.7 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 0.7 [feed mm/s], 17.8 [head mm/s]
G1 X64.294 Y70.608 E0 F9000
G1 X64.294 Y70.608 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 17.800001, filament speed 0.666034, preload 0.000000
G1 X64.119 Y70.656 E0.0068 F1068
G1 X63.592 Y70.798 E0.02042
G1 X62.714 Y71.036 E0.03402
G1 X61.486 Y71.368 E0.04762
G1 X59.906 Y71.795 E0.06124
G1 X59.596 Y72.333 E0.02323
G1 X59.611 Y72.329 E0.00061
G1 X64.624 Y70.986 E0.19419
G1 X64.859 Y71.389 E0.01745
G1 X59.27 Y72.898 E0.21661
G1 X58.959 Y73.435 E0.02323
G1 X58.975 Y73.431 E0.00061
G1 X65.092 Y71.792 E0.23695
G1 X65.324 Y72.196 E0.01742
G1 X58.638 Y73.987 E0.25899
G1 X58.861 Y74.393 E0.01734
G1 X65.556 Y72.599 E0.25936
G1 X65.791 Y73.002 E0.01745
G1 X59.093 Y74.797 E0.25946
G1 X59.327 Y75.2 E0.01744
G1 X66.023 Y73.406 E0.25937
G1 X66.255 Y73.81 E0.01743
G1 X59.561 Y75.604 E0.25933
G1 X59.793 Y76.007 E0.01742
G1 X66.198 Y74.291 E0.24811
G1 X66.19 Y74.304 E0.00059
G1 X65.864 Y74.846 E0.02367
; Prepare for End-Of-Layer
G1 X60.026 Y76.411 E0.22615
G1 X60.259 Y76.814 E0.01744
G1 X65.561 Y75.393 E0.20539
G1 X65.554 Y75.407 E0.00058
G1 X65.227 Y75.949 E0.02367
G1 X60.597 Y77.189 E0.17936
G1 X60.628 Y77.195 E0.00115
G1 X61.679 Y77.365 E0.03987
G1 X63.495 Y76.879 E0.07033
G1 X64.925 Y76.496 E0.0554
G1 X64.917 Y76.509 E0.00058
G1 X64.591 Y77.051 E0.02366
G1 X63.837 Y77.253 E0.02923
G1 X63.384 Y77.374 E0.01754
G1 X63.233 Y77.415 E0.00586
; Fan set to Cool value 100%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 17.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 17.800001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.591 Y77.051 E0 F1068
G1 X64.917 Y76.509 E0
G1 X64.925 Y76.496 E0
G1 X62.08 Y77.258 E0
G1 X62.08 Y77.258 Z0.7 E0 F900
;
; *** Cooling Extruder 3 to 0 C and Retiring ***
; NONE
;
;
; *** Selecting and Warming Extruder 2 to 215 C ***
; SELECT NEW EXT START
M104 S215
; TOOL CHANGE
T1
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 9.021646 [s], Slowing (0.891x) to 10.0 [s] ***
; Perimeter Length = 31.932077
;
; 'Perimeter Path', 0.6 [feed mm/s], 16.4 [head mm/s]
G1 X85.908 Y72.62 Z0.7 E0 F9000
G1 X85.908 Y72.62 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 16.394402, filament speed 0.613440, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 2 to 215 C ***
; heat the (next, then current) extruder without waiting
M104 S215
;M104 S215 T1
; Uncomment the previous line to enable preheat
;
G1 X85.937 Y72.671 E0.00218 F983.7
G1 X86.059 Y72.882 E0.00912
G1 X86.277 Y73.257 E0.01623
G1 X86.589 Y73.797 E0.02334
G1 X86.603 Y73.813 E0.00079
G1 X86.622 Y73.823 E0.0008
G1 X86.94 Y73.917 E0.0124
G1 X87.135 Y74.06 E0.00906
G1 X87.153 Y74.081 E0.00102
G1 X87.158 Y74.107 E0.00101
G1 X87.151 Y74.134 E0.00102
G1 X86.539 Y75.194 E0.04579
G1 X85.786 Y76.5 E0.05644
G1 X84.89 Y78.053 E0.06707
G1 X84.87 Y78.073 E0.00104
G1 X84.844 Y78.081 E0.00104
G1 X84.524 Y78.096 E0.012
G1 X80.207 Y78.089 E0.1615
G1 X80.088 Y78.014 E0.00528
; Prepare for TopLoop (0.650177)
G1 X77.813 Y74.064 E0.17057
G1 X77.795 Y73.984 E0.00308
G1 X77.795 Y73.963 E0.00077
G1 X77.802 Y73.943 E0.00078
G1 X80.12 Y69.933 E0.17332
G1 X80.141 Y69.913 E0.00109
G1 X80.169 Y69.905 E0.00109
G1 X84.651 Y69.905 E0.16771
G1 X84.805 Y69.906 E0.00574
G1 X84.83 Y69.912 E0.00097
G1 X84.849 Y69.928 E0.00096
G1 X84.975 Y70.096 E0.00786
G1 X85.847 Y71.606 E0.06521
G1 X86.576 Y72.869 E0.05458
G1 X87.163 Y73.886 E0.04393
G1 X87.17 Y73.915 E0.00113
G1 X87.162 Y73.944 E0.00112
G1 X87.14 Y73.964 E0.00113
G1 X86.555 Y74.259 E0.0245
G1 X86.23 Y74.822 E0.02435
G1 X86.042 Y75.147 E0.01401
G1 X85.992 Y75.234 E0.00379
;
; 'Loop Path', 0.7 [feed mm/s], 17.8 [head mm/s]
G1 X85.963 Y75.284 E0 F9000
; head speed 17.820002, filament speed 0.666783, preload 0.000000
G1 X85.879 Y75.429 E0.00626 F1069.2
G1 X85.627 Y75.864 E0.01879
G1 X85.208 Y76.588 E0.03131
; Prepare for Destring
G1 X84.62 Y77.601 E0.04383
G1 X84.467 Y77.642 E0.00594
G1 X83.308 Y77.641 E0.04337
G1 X81.951 Y77.64 E0.05078
G1 X80.395 Y77.639 E0.0582
G1 X78.297 Y73.998 E0.15724
G1 X80.393 Y70.368 E0.15684
G1 X80.855 Y70.358 E0.01731
G1 X82.293 Y70.359 E0.05379
G1 X83.542 Y70.36 E0.04676
G1 X84.604 Y70.361 E0.03973
G1 X85.149 Y71.305 E0.04079
G1 X85.539 Y71.98 E0.02914
G1 X85.772 Y72.384 E0.01749
G1 X85.85 Y72.519 E0.00582
; Fan set to Cool value 100%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 17.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 17.820000, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (0.645161)
G1 X84.604 Y70.361 E0 F1069.2
G1 X82.096 Y70.359 E0
G1 X82.096 Y70.359 Z0.7 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 0.7 [feed mm/s], 17.8 [head mm/s]
G1 X81.702 Y70.603 E0 F9000
G1 X81.702 Y70.603 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 17.820002, filament speed 0.666783, preload 0.000000
G1 X81.556 Y70.643 E0.00568 F1069.2
G1 X81.117 Y70.764 E0.01704
G1 X80.385 Y70.967 E0.0284
G1 X80.075 Y71.504 E0.02323
G1 X80.09 Y71.5 E0.0006
G1 X81.01 Y71.258 E0.03557
G1 X82.107 Y70.968 E0.04246
G1 X83.382 Y70.632 E0.04933
G1 X84.403 Y70.811 E0.03879
G1 X84.371 Y70.819 E0.00121
G1 X79.749 Y72.069 E0.17918
G1 X79.439 Y72.607 E0.02323
G1 X79.454 Y72.602 E0.00061
G1 X84.741 Y71.186 E0.20478
G1 X84.974 Y71.589 E0.01744
G1 X79.113 Y73.171 E0.22718
G1 X78.802 Y73.709 E0.02323
G1 X78.818 Y73.705 E0.00062
G1 X85.207 Y71.993 E0.24749
G1 X85.439 Y72.396 E0.01743
G1 X78.745 Y74.19 E0.25933
G1 X78.977 Y74.594 E0.01742
G1 X85.673 Y72.8 E0.25938
G1 X85.907 Y73.203 E0.01744
G1 X79.209 Y74.998 E0.25946
G1 X79.444 Y75.401 E0.01744
G1 X86.139 Y73.607 E0.25937
G1 X86.362 Y74.013 E0.01733
G1 X79.676 Y75.804 E0.259
G1 X79.909 Y76.208 E0.01742
; Prepare for Destring
G1 X86.041 Y74.565 E0.23755
G1 X86.033 Y74.578 E0.00058
G1 X85.72 Y75.116 E0.0233
G1 X80.141 Y76.611 E0.21612
G1 X80.376 Y77.014 E0.01744
G1 X85.404 Y75.667 E0.1948
G1 X85.397 Y75.68 E0.00058
G1 X85.084 Y76.219 E0.02329
G1 X83.508 Y76.641 E0.06106
G1 X82.282 Y76.969 E0.04749
G1 X81.406 Y77.204 E0.03392
G1 X80.881 Y77.345 E0.02035
G1 X80.706 Y77.392 E0.00678
; Fan set to Cool value 100%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 17.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 17.820000, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X85.084 Y76.219 E0 F1069.2
G1 X85.319 Y75.814 E0
G1 X85.319 Y75.814 Z0.7 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 0.5 [feed mm/s], 12.3 [head mm/s]
G1 X82.358 Y77.415 E0 F9000
G1 X82.358 Y77.415 Z0.2 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 12.295800, filament speed 0.460080, preload 0.000000
; Prepare for End-Of-Layer
G1 X82.507 Y77.375 E0.00576 F737.7
G1 X82.953 Y77.256 E0.01728
G1 X83.696 Y77.056 E0.02879
G1 X84.737 Y76.778 E0.04032
G1 X84.72 Y76.796 E0.00094
G1 X84.353 Y77.187 E0.02008
G1 X84.154 Y77.4 E0.01088
G1 X84.098 Y77.414 E0.00214
; Fan set to Cool value 100%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 17.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 17.820000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X84.154 Y77.4 E0 F1069.2
G1 X84.72 Y76.796 E0
G1 X84.737 Y76.778 E0
G1 X82.358 Y77.415 E0
; time estimate: pre = 10.004909, post = 55.130997
; Dwell time remaining = -45.130997
;
; Post-layer lift
G1 X82.358 Y77.415 Z0.95 E0 F900
; END_LAYER_OBJECT z=0.200
; BEGIN_LAYER_OBJECT z=0.450 z_thickness=0.250
;
; *** Cooling Extruder 2 to 0 C and Retiring ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.6 [feed mm/s], 35.0 [head mm/s]
G1 X80.987 Y75.246 Z0.95 E0 F9000
G1 X80.987 Y75.246 Z0.45 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.000000, filament speed 1.637022, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2100
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 88%
;
; 'Solid Path', 1.6 [feed mm/s], 35.0 [head mm/s]
G1 X81.001 Y74.432 E0 F9000
; head speed 35.000000, filament speed 1.637022, preload 0.000000
; Prepare for Destring
G1 X80.954 Y74.253 E0.00866 F2100
G1 X80.81 Y73.717 E0.02597
G1 X80.762 Y73.538 E0.00866
G1 X80.618 Y73.002 E0.02597
G1 X80.57 Y72.823 E0.00866
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 65%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 35.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 35.000000, filament speed 0.000000, preload 0.000000
G1 X81.001 Y74.432 E0 F2100
G1 X81.001 Y74.432 Z0.95 E0 F900
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 88%
;
; 'Solid Path', 1.6 [feed mm/s], 35.0 [head mm/s]
G1 X79.701 Y71.319 E0 F9000
G1 X79.701 Y71.319 Z0.45 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.000000, filament speed 1.637022, preload 0.000000
; Prepare for Destring
G1 X79.739 Y71.462 E0.00694 F2100
G1 X79.853 Y71.893 E0.02082
G1 X80.043 Y72.61 E0.03469
G1 X80.309 Y73.614 E0.04858
G1 X80.651 Y74.904 E0.06245
G1 X80.34 Y75.442 E0.02904
G1 X80.336 Y75.426 E0.00077
G1 X79.877 Y73.712 E0.08303
G1 X79.501 Y72.309 E0.06793
G1 X79.208 Y71.217 E0.05285
G1 X78.999 Y70.438 E0.03775
G1 X78.874 Y69.969 E0.02267
G1 X78.832 Y69.813 E0.00757
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 65%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 35.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 35.000000, filament speed 0.000000, preload 0.000000
; Prepare for Path
G1 X80.126 Y74.643 E0 F2100
G1 X80.126 Y74.643 Z0.95 E0 F900
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 88%
;
; 'Solid Path', 1.6 [feed mm/s], 35.0 [head mm/s]
G1 X77.962 Y68.306 E0 F9000
G1 X77.962 Y68.306 Z0.45 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.000000, filament speed 1.637022, preload 0.000000
; unsupported segments 9
; Unsupported degree: 0.236214
; Overhang(36.6)
G1 X78.004 Y68.463 E0.00761 F2100
G1 X78.13 Y68.934 E0.02282
G1 X78.339 Y69.72 E0.03804
G1 X78.632 Y70.82 E0.05325
G1 X79.009 Y72.235 E0.06847
G1 X79.47 Y73.964 E0.08368
G1 X80.014 Y76.007 E0.0989
G1 X79.704 Y76.544 E0.02904
G1 X79.7 Y76.528 E0.00077
G1 X77.106 Y66.891 E0.4668
G1 X76.552 Y66.521 E0.03113
G1 X76.557 Y66.54 E0.00089
G1 X77.073 Y68.463 E0.09312
G1 X77.494 Y70.036 E0.07619 F2066.4
G1 X77.822 Y71.26 E0.05925 F2032.7
G1 X78.056 Y72.134 E0.04233 F1999.1
G1 X78.197 Y72.659 E0.0254 F1965.4
G1 X78.244 Y72.834 E0.00846 F1931.8
G1 X78.289 Y73.005 E0.00828 F1898.1
G1 X78.425 Y73.518 E0.02483 F1864.5
G1 X78.652 Y74.373 E0.04137 F1830.9
G1 X78.97 Y75.57 E0.05793 F1797.2
G1 X79.378 Y77.109 E0.07448 F1763.6
G1 X79.068 Y77.647 E0.02904 F1729.9
G1 X79.063 Y77.631 E0.00077
G1 X78.546 Y75.7 E0.09349
G1 X78.123 Y74.12 E0.07649 F1763.6
G1 X77.793 Y72.891 E0.05951 F1797.2
G1 X77.558 Y72.013 E0.04251 F1830.9
G1 X77.417 Y71.486 E0.02552 F1864.5
G1 X77.37 Y71.31 E0.00852 F1898.1
G1 X77.318 Y71.118 E0.00934 F1931.8
G1 X77.163 Y70.539 E0.028 F1965.4
G1 X76.905 Y69.575 E0.04668 F1999.1
G1 X76.543 Y68.226 E0.06535 F2032.7
G1 X76.078 Y66.491 E0.08402 F2066.4
G1 X75.613 Y66.491 E0.02178 F2100
G1 X75.942 Y67.72 E0.05951 F2066.4
G1 X76.198 Y68.676 E0.04628 F2032.7
G1 X76.381 Y69.359 E0.03307 F1999.1
G1 X76.491 Y69.769 E0.01985 F1965.4
G1 X76.528 Y69.906 E0.00662 F1931.8
G1 X76.573 Y70.075 E0.00821 F1898.1
G1 X76.708 Y70.584 E0.02461 F1864.5
G1 X76.934 Y71.431 E0.04103 F1830.9
G1 X77.251 Y72.618 E0.05743 F1797.2
G1 X77.657 Y74.143 E0.07384 F1763.6
G1 X77.958 Y75.271 E0.05459 F1729.9
G1 X78.291 Y76.52 E0.06048
G1 X78.552 Y77.501 E0.04745 F1763.6
G1 X78.742 Y78.211 E0.0344 F1797.2
G1 X78.53 Y78.577 E0.01977 F1830.9
G1 X78.431 Y78.749 E0.00927 F1864.5
G1 X78.427 Y78.733 E0.00077 F1898.1
G1 X78.376 Y78.542 E0.00926 F1931.8
G1 X78.222 Y77.968 E0.02779 F1965.4
G1 X77.966 Y77.011 E0.04631 F1999.1
G1 X77.607 Y75.673 E0.06483 F2032.7
G1 X77.146 Y73.951 E0.08336 F2066.4
G1 X76.582 Y71.847 E0.10188 F2100
G1 X75.147 Y66.491 E0.25934
G1 X74.68 Y66.49 E0.02181
G1 X78.105 Y79.313 E0.62081
G1 X77.795 Y79.851 E0.02904
G1 X77.791 Y79.835 E0.00077
G1 X74.215 Y66.491 E0.64616
G1 X73.749 Y66.491 E0.02178
G1 X77.469 Y80.416 E0.67411
G1 X77.158 Y80.953 E0.02904
G1 X77.154 Y80.938 E0.00076
G1 X73.283 Y66.491 E0.69956
G1 X72.817 Y66.49 E0.02179
G1 X76.836 Y81.489 E0.72628
G1 X76.376 Y81.509 E0.02156
G1 X72.352 Y66.491 E0.7272
G1 X71.886 Y66.491 E0.02179
G1 X75.91 Y81.509 E0.72719
G1 X75.444 Y81.51 E0.02178
G1 X71.666 Y67.409 E0.68283
G1 X71.419 Y66.49 E0.04447
G1 X70.954 Y66.491 E0.02179
G1 X74.978 Y81.509 E0.72722
G1 X74.512 Y81.509 E0.02178
G1 X70.488 Y66.491 E0.7272
G1 X70.022 Y66.491 E0.02179
G1 X74.046 Y81.51 E0.72722
G1 X73.58 Y81.51 E0.02179
G1 X69.715 Y67.084 E0.69853
G1 X69.556 Y66.49 E0.02877
G1 X69.09 Y66.491 E0.02178
G1 X73.114 Y81.509 E0.72719
G1 X72.648 Y81.509 E0.02179
G1 X68.624 Y66.491 E0.7272
G1 X68.164 Y66.511 E0.02156
G1 X72.183 Y81.51 E0.72628
G1 X71.717 Y81.509 E0.0218
G1 X67.842 Y67.047 E0.70031
G1 X67.834 Y67.06 E0.00073
G1 X67.528 Y67.613 E0.02958
G1 X71.251 Y81.509 E0.67283
G1 X70.785 Y81.509 E0.02178
G1 X67.205 Y68.149 E0.64693
G1 X67.197 Y68.162 E0.00073
G1 X66.891 Y68.716 E0.02958
G1 X70.319 Y81.51 E0.61954
G1 X69.853 Y81.509 E0.0218
G1 X68.424 Y76.176 E0.25824
G1 X67.863 Y74.08 E0.10146
G1 X67.403 Y72.366 E0.08304 F2066.4
G1 X67.046 Y71.031 E0.0646 F2032.7
G1 X66.79 Y70.078 E0.04616 F1999.1
G1 X66.637 Y69.505 E0.02774 F1965.4
G1 X66.585 Y69.313 E0.0093 F1931.8
G1 X66.569 Y69.251 E0.00301 F1898.1
G1 X66.561 Y69.265 E0.00072 F1864.5
G1 X66.446 Y69.472 E0.01111 F1830.9
G1 X66.255 Y69.818 E0.01848 F1797.2
G1 X66.498 Y70.724 E0.04385 F1763.6
G1 X66.841 Y72.004 E0.06201 F1729.9
G1 X67.341 Y73.871 E0.09041
G1 X67.748 Y75.391 E0.0736 F1763.6
G1 X68.065 Y76.574 E0.05726 F1797.2
G1 X68.291 Y77.418 E0.04089 F1830.9
G1 X68.427 Y77.925 E0.02455 F1864.5
G1 X68.472 Y78.094 E0.00819 F1898.1
G1 X68.509 Y78.231 E0.00661 F1931.8
G1 X68.619 Y78.641 E0.01984 F1965.4
G1 X68.802 Y79.324 E0.03307 F1999.1
G1 X69.058 Y80.28 E0.04629 F2032.7
G1 X69.387 Y81.509 E0.05952 F2066.4
G1 X68.922 Y81.509 E0.02178 F2100
G1 X68.457 Y79.775 E0.084 F2066.4
G1 X68.095 Y78.425 E0.06534 F2032.7
G1 X67.837 Y77.461 E0.04668 F1999.1
G1 X67.682 Y76.883 E0.02801 F1965.4
G1 X67.63 Y76.69 E0.00936 F1931.8
G1 X67.583 Y76.514 E0.00852 F1898.1
G1 X67.442 Y75.986 E0.02557 F1864.5
G1 X67.206 Y75.106 E0.04261 F1830.9
G1 X66.876 Y73.874 E0.05966 F1797.2
G1 X66.451 Y72.289 E0.0767 F1763.6
G1 X65.932 Y70.353 E0.09375 F1729.9
G1 X65.925 Y70.367 E0.00073
G1 X65.618 Y70.92 E0.02958
G1 X66.028 Y72.449 E0.07402 F1763.6
G1 X66.347 Y73.638 E0.05757 F1797.2
G1 X66.574 Y74.487 E0.04112 F1830.9
G1 X66.711 Y74.997 E0.02467 F1864.5
G1 X66.756 Y75.166 E0.00823 F1898.1
G1 X66.803 Y75.342 E0.00849 F1931.8
G1 X66.944 Y75.868 E0.02547 F1965.4
G1 X67.179 Y76.745 E0.04245 F1999.1
G1 X67.508 Y77.972 E0.05943 F2032.7
G1 X67.931 Y79.55 E0.07641 F2066.4
; Prepare for Destring
G1 X68.448 Y81.479 E0.09339 F2100
G1 X68.434 Y81.469 E0.00078
G1 X67.875 Y81.081 E0.0318
G1 X65.296 Y71.456 E0.4661
G1 X65.288 Y71.469 E0.00073
G1 X64.982 Y72.023 E0.02958
G1 X65.527 Y74.058 E0.09856
G1 X65.989 Y75.78 E0.0834
G1 X66.366 Y77.189 E0.06823
G1 X66.66 Y78.285 E0.05307
G1 X66.87 Y79.068 E0.03791
G1 X66.996 Y79.538 E0.02274
G1 X67.038 Y79.694 E0.00758
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 65%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 35.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 35.000000, filament speed 0.000000, preload 0.000000
G1 X65.744 Y74.865 E0 F2100
G1 X65.744 Y74.865 Z0.95 E0 F900
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 88%
;
; 'Solid Path', 1.6 [feed mm/s], 35.0 [head mm/s]
G1 X66.168 Y78.187 E0 F9000
G1 X66.168 Y78.187 Z0.45 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.000000, filament speed 1.637022, preload 0.000000
; Prepare for Destring
G1 X66.126 Y78.031 E0.00757 F2100
G1 X66 Y77.562 E0.02272
G1 X65.791 Y76.78 E0.03785
G1 X65.498 Y75.685 E0.053
G1 X65.12 Y74.278 E0.06814
G1 X64.66 Y72.558 E0.08329
G1 X64.652 Y72.571 E0.00073
G1 X64.346 Y73.125 E0.02958
G1 X64.689 Y74.405 E0.06197
G1 X64.955 Y75.4 E0.04821
G1 X65.146 Y76.112 E0.03444
G1 X65.26 Y76.538 E0.02067
G1 X65.299 Y76.681 E0.00691
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 65%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 35.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 35.000000, filament speed 0.000000, preload 0.000000
G1 X64.346 Y73.125 E0 F2100
G1 X64.652 Y72.571 E0
G1 X64.66 Y72.558 E0
G1 X64.833 Y73.205 E0
G1 X64.833 Y73.205 Z0.95 E0 F900
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 88%
;
; 'Solid Path', 1.6 [feed mm/s], 35.0 [head mm/s]
G1 X64.43 Y75.177 E0 F9000
G1 X64.43 Y75.177 Z0.45 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.000000, filament speed 1.637022, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.384 Y75.006 E0.00831 F2100
G1 X64.246 Y74.491 E0.02492
G1 X64.2 Y74.319 E0.0083
G1 X64.062 Y73.805 E0.02492
G1 X64.016 Y73.633 E0.00831
; Blending Fan to Cool (65.4% blend)
; Blended Fan at 65%
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 35.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 35.000000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.43 Y75.177 E0 F2100
; time estimate: pre = 20.373999, post = 19.244652
; Dwell time remaining = -9.244651
;
; Post-layer lift
G1 X64.43 Y75.177 Z1.2 E0 F900
; END_LAYER_OBJECT z=0.450
; BEGIN_LAYER_OBJECT z=0.700 z_thickness=0.250
; fan %*255
M106 S255
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z1.2 E0 F9000
G1 X80.987 Y75.246 Z0.7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 50.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 50.000000, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z1.2 E0 F900
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X75.516 Y81.578 E0 F9000
G1 X75.516 Y81.578 Z0.7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X75.685 Y81.531 E0.00822 F2760
G1 X76.193 Y81.391 E0.02465
G1 X77.04 Y81.158 E0.0411
G1 X77.351 Y80.62 E0.02904
G1 X77.335 Y80.624 E0.00076
G1 X76.055 Y80.967 E0.062
G1 X75.059 Y81.234 E0.04821
G1 X74.348 Y81.425 E0.03444
G1 X73.921 Y81.539 E0.02067
G1 X73.779 Y81.577 E0.00688
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 50.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 50.000000, filament speed 0.000000, preload 0.000000
G1 X77.335 Y80.624 E0
G1 X77.351 Y80.62 E0
G1 X77.04 Y81.158 E0
G1 X76.384 Y81.339 E0
G1 X76.384 Y81.339 Z1.2 E0 F900
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X72.04 Y81.577 E0 F9000
G1 X72.04 Y81.577 Z0.7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X72.197 Y81.535 E0.00759 F2760
G1 X72.666 Y81.408 E0.02275
G1 X73.449 Y81.197 E0.03793
G1 X74.545 Y80.901 E0.0531
G1 X75.954 Y80.52 E0.06827
G1 X77.677 Y80.055 E0.08344
G1 X77.987 Y79.518 E0.02904
G1 X77.971 Y79.522 E0.00077
G1 X75.937 Y80.067 E0.09853
G1 X74.215 Y80.529 E0.08338
G1 X72.806 Y80.906 E0.06823
G1 X71.71 Y81.2 E0.05307
G1 X70.927 Y81.41 E0.03791
G1 X70.457 Y81.536 E0.02276
G1 X70.3 Y81.578 E0.00761
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 50.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 50.000000, filament speed 0.000000, preload 0.000000
G1 X75.129 Y80.284 E0
G1 X75.129 Y80.284 Z1.2 E0 F900
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X68.562 Y81.577 E0 F9000
G1 X68.562 Y81.577 Z0.7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X68.715 Y81.536 E0.00738 F2760
G1 X69.172 Y81.413 E0.02214
G1 X69.934 Y81.208 E0.0369
G1 X71 Y80.921 E0.05165
G1 X72.371 Y80.552 E0.06642
G1 X74.047 Y80.101 E0.08117
G1 X76.028 Y79.568 E0.09594
G1 X78.313 Y78.953 E0.11069
G1 X78.624 Y78.416 E0.02904
G1 X78.608 Y78.42 E0.00077
G1 X68.018 Y81.257 E0.51276
G1 X67.786 Y80.854 E0.02179
G1 X78.95 Y77.851 E0.54071
G1 X79.26 Y77.313 E0.02904
G1 X79.244 Y77.318 E0.00077
G1 X67.554 Y80.45 E0.56608
G1 X67.321 Y80.047 E0.02179
G1 X79.586 Y76.749 E0.59406
G1 X79.896 Y76.211 E0.02904
G1 X79.881 Y76.215 E0.00077
G1 X67.086 Y79.644 E0.61954
G1 X66.854 Y79.24 E0.02177
G1 X80.222 Y75.646 E0.64744
G1 X80.533 Y75.109 E0.02904
G1 X80.517 Y75.113 E0.00077
G1 X66.622 Y78.836 E0.67282
G1 X66.388 Y78.433 E0.0218
G1 X80.856 Y74.555 E0.70057
G1 X81.133 Y74.016 E0.02832
G1 X81.119 Y74.02 E0.00068
G1 X66.155 Y78.03 E0.72458
G1 X65.923 Y77.626 E0.02177
G1 X80.022 Y73.848 E0.68271
G1 X80.94 Y73.602 E0.04446
G1 X80.708 Y73.198 E0.02179
G1 X65.69 Y77.222 E0.72719
G1 X65.456 Y76.819 E0.0218
G1 X79.558 Y73.041 E0.68282
G1 X80.476 Y72.795 E0.04448
G1 X80.242 Y72.391 E0.02181
G1 X66.034 Y76.199 E0.68797
G1 X65.223 Y76.416 E0.03924
G1 X64.991 Y76.012 E0.02179
G1 X78.983 Y72.263 E0.6775
G1 X80.009 Y71.988 E0.0497
G1 X79.777 Y71.584 E0.02178
G1 X65.785 Y75.333 E0.67751
G1 X64.758 Y75.608 E0.04971
G1 X64.524 Y75.205 E0.02181
G1 X79.544 Y71.181 E0.72729
G1 X79.31 Y70.778 E0.02181
G1 X64.292 Y74.802 E0.72719
G1 X64.06 Y74.398 E0.02178
G1 X79.077 Y70.374 E0.72717
G1 X78.845 Y69.97 E0.02177
G1 X64.681 Y73.766 E0.68584
G1 X63.867 Y73.984 E0.03942
G1 X63.873 Y73.972 E0.00061
G1 X64.147 Y73.443 E0.02785
G1 X78.612 Y69.567 E0.70043
G1 X78.378 Y69.164 E0.0218
G1 X64.467 Y72.891 E0.67359
G1 X64.475 Y72.878 E0.00072
G1 X64.801 Y72.336 E0.02959
G1 X78.146 Y68.76 E0.64616
G1 X77.914 Y68.356 E0.02177
G1 X65.104 Y71.789 E0.62031
G1 X65.111 Y71.776 E0.00073
G1 X65.438 Y71.234 E0.02958
G1 X77.68 Y67.953 E0.59278
G1 X77.446 Y67.55 E0.02179
G1 X65.74 Y70.687 E0.56686
G1 X65.748 Y70.673 E0.00072
G1 X66.074 Y70.131 E0.02959
G1 X77.214 Y67.146 E0.53943
G1 X76.982 Y66.743 E0.02178
; Prepare for Destring
G1 X66.376 Y69.584 E0.51354
G1 X66.384 Y69.571 E0.00072
G1 X66.71 Y69.029 E0.02959
G1 X68.99 Y68.418 E0.11039
G1 X70.966 Y67.889 E0.09568
G1 X72.638 Y67.441 E0.08095
G1 X74.006 Y67.074 E0.06624
G1 X75.07 Y66.789 E0.05151
G1 X75.83 Y66.586 E0.0368
G1 X76.286 Y66.463 E0.02208
G1 X76.438 Y66.423 E0.00736
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 50.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 50.000000, filament speed 0.000000, preload 0.000000
G1 X71.608 Y67.717 E0
G1 X71.608 Y67.717 Z1.2 E0 F900
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X74.7 Y66.422 E0 F9000
G1 X74.7 Y66.422 Z0.7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X74.544 Y66.464 E0.0076 F2760
G1 X74.073 Y66.59 E0.02279
G1 X73.288 Y66.801 E0.03798
G1 X72.19 Y67.095 E0.05318
G1 X70.778 Y67.473 E0.06838
G1 X69.052 Y67.936 E0.08356
G1 X67.013 Y68.482 E0.09876
G1 X67.02 Y68.469 E0.00073
G1 X67.347 Y67.927 E0.02959
G1 X69.062 Y67.467 E0.08305
G1 X70.465 Y67.091 E0.06795
G1 X71.557 Y66.799 E0.05285
G1 X72.336 Y66.59 E0.03775
G1 X72.804 Y66.465 E0.02265
G1 X72.96 Y66.423 E0.00755
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 50.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 50.000000, filament speed 0.000000, preload 0.000000
G1 X68.13 Y67.717 E0
G1 X68.13 Y67.717 Z1.2 E0 F900
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.221 Y66.423 E0 F9000
G1 X71.221 Y66.423 Z0.7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for End-Of-Layer
G1 X71.078 Y66.461 E0.00692 F2760
G1 X70.65 Y66.576 E0.02075
G1 X69.935 Y66.767 E0.0346
G1 X68.935 Y67.035 E0.04843
G1 X67.649 Y67.38 E0.06227
G1 X67.657 Y67.366 E0.00072
G1 X67.983 Y66.825 E0.02957
G1 X68.78 Y66.611 E0.03863
G1 X69.259 Y66.483 E0.02319
G1 X69.419 Y66.44 E0.00774
; Blending Fan to Cool (75.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 50.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 50.000000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X67.983 Y66.825 E0
G1 X67.657 Y67.366 E0
G1 X67.649 Y67.38 E0
G1 X70.417 Y66.638 E0
; time estimate: pre = 17.483551, post = 16.078468
; Dwell time remaining = -6.078467
;
; Post-layer lift
G1 X70.417 Y66.638 Z1.4625 E0 F900
; END_LAYER_OBJECT z=0.700
; BEGIN_LAYER_OBJECT z=0.963 z_thickness=0.263
; fan %*255
M106 S255
;
; 'Loop Path', 1.8 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z1.4625 E0 F9000
G1 X80.987 Y75.246 Z0.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.807273, preload 0.000000
G1 X80.908 Y75.381 E0.00769 F2208
G1 X80.673 Y75.788 E0.02305
G1 X80.282 Y76.465 E0.03843
G1 X79.734 Y77.414 E0.0538
G1 X79.029 Y78.633 E0.06918
G1 X78.167 Y80.124 E0.08454
G1 X77.149 Y81.885 E0.09992
G1 X77.073 Y81.972 E0.00567
G1 X67.902 Y81.971 E0.45039
G1 X64.077 Y75.354 E0.37536
G1 X63.297 Y74.003 E0.07661
G1 X63.79 Y73.142 E0.04872
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.39859
G1 X67.927 Y66.028 E0.00567
G1 X77.098 Y66.029 E0.45039
G1 X78.088 Y67.741 E0.09712
G1 X78.925 Y69.189 E0.08218
G1 X79.61 Y70.375 E0.06723
G1 X80.143 Y71.297 E0.0523
G1 X80.524 Y71.955 E0.03735
G1 X80.752 Y72.35 E0.02241
G1 X80.828 Y72.482 E0.00747
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.903636, preload 0.000000
G1 X80.908 Y72.621 E0.00286 F1104
G1 X81.035 Y72.836 E0.01231
G1 X81.263 Y73.223 E0.02201
G1 X81.59 Y73.779 E0.03171
G1 X82.147 Y74.027 E0.02992
G1 X82.171 Y74.047 E0.00153
G1 X82.18 Y74.077 E0.00152
G1 X82.173 Y74.107 E0.00152
G1 X81.526 Y75.225 E0.06343
G1 X80.726 Y76.609 E0.07852
G1 X79.773 Y78.26 E0.09363
G1 X77.403 Y82.36 E0.23255
G1 X77.39 Y82.376 E0.00101
G1 X77.372 Y82.385 E0.00101
G1 X77.248 Y82.425 E0.00638
G1 X72.574 Y82.425 E0.22957
G1 X67.855 Y82.426 E0.23173
G1 X67.663 Y82.427 E0.00942
G1 X67.635 Y82.42 E0.00144
G1 X67.614 Y82.399 E0.00144
G1 X65.574 Y78.855 E0.20083
G1 X63.186 Y74.719 E0.23452
G1 X62.795 Y74.034 E0.03874
G1 X62.787 Y74.008 E0.00135
G1 X62.793 Y73.981 E0.00135
G1 X62.91 Y73.75 E0.01273
G1 X67.597 Y65.64 E0.46
G1 X67.61 Y65.624 E0.00101
G1 X67.628 Y65.615 E0.00101
G1 X67.752 Y65.575 E0.00638
G1 X72.426 Y65.575 E0.22957
G1 X77.145 Y65.574 E0.23173
G1 X77.337 Y65.573 E0.00941
G1 X77.365 Y65.58 E0.00145
G1 X77.386 Y65.601 E0.00144
G1 X79.426 Y69.145 E0.20083
G1 X80.359 Y70.762 E0.09168
G1 X81.155 Y72.141 E0.07817
G1 X81.814 Y73.281 E0.06467
G1 X82.141 Y73.847 E0.03211
G1 X82.148 Y73.883 E0.00178
G1 X82.131 Y73.915 E0.00178
G1 X81.92 Y74.125 E0.01465
G1 X81.605 Y74.208 E0.01595
G1 X81.586 Y74.217 E0.00109
G1 X81.571 Y74.234 E0.00108
G1 X81.22 Y74.842 E0.03449
G1 X81.035 Y75.162 E0.01813
G1 X81.004 Y75.215 E0.00304
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 92%
; fan %*255
M106 S235
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X81.001 Y74.432 E0 F9000
; head speed 46.000000, filament speed 2.259091, preload 0.000000
; Prepare for Destring
G1 X80.954 Y74.253 E0.00909 F2760
G1 X80.81 Y73.717 E0.02727
G1 X80.762 Y73.538 E0.00909
G1 X80.618 Y73.002 E0.02727
G1 X80.57 Y72.823 E0.00909
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.001 Y74.432 E0 F3312
G1 X81.001 Y74.432 Z1.4625 E0 F900
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 92%
; fan %*255
M106 S235
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X79.701 Y71.319 E0 F9000
G1 X79.701 Y71.319 Z0.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259091, preload 0.000000
; Prepare for Destring
G1 X79.739 Y71.462 E0.00729 F2760
G1 X79.853 Y71.893 E0.02185
G1 X80.043 Y72.61 E0.03644
G1 X80.309 Y73.614 E0.051
G1 X80.651 Y74.904 E0.06558
G1 X80.34 Y75.442 E0.03049
G1 X80.336 Y75.426 E0.0008
G1 X79.877 Y73.712 E0.08718
G1 X79.501 Y72.309 E0.07133
G1 X79.208 Y71.217 E0.05549
G1 X78.999 Y70.438 E0.03965
G1 X78.874 Y69.969 E0.02379
G1 X78.832 Y69.813 E0.00795
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X80.126 Y74.643 E0 F3312
G1 X80.126 Y74.643 Z1.4625 E0 F900
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 92%
; fan %*255
M106 S235
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X77.962 Y68.306 E0 F9000
G1 X77.962 Y68.306 Z0.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259091, preload 0.000000
G1 X78.004 Y68.463 E0.00799 F2760
G1 X78.13 Y68.934 E0.02396
G1 X78.339 Y69.72 E0.03994
G1 X78.632 Y70.82 E0.05592
G1 X79.009 Y72.235 E0.07189
G1 X79.47 Y73.964 E0.08786
G1 X80.014 Y76.007 E0.10385
G1 X79.704 Y76.544 E0.03049
G1 X79.7 Y76.528 E0.0008
G1 X77.106 Y66.891 E0.49015
G1 X76.552 Y66.521 E0.03269
G1 X76.557 Y66.54 E0.00093
G1 X79.378 Y77.109 E0.53722
G1 X79.068 Y77.647 E0.03049
G1 X79.063 Y77.631 E0.00081
G1 X76.078 Y66.491 E0.5664
G1 X75.613 Y66.491 E0.02287
G1 X78.742 Y78.211 E0.59574
G1 X78.431 Y78.749 E0.03049
G1 X78.427 Y78.733 E0.00081
G1 X75.147 Y66.491 E0.62241
G1 X74.68 Y66.49 E0.0229
G1 X78.105 Y79.313 E0.65185
G1 X77.795 Y79.851 E0.0305
G1 X77.791 Y79.835 E0.0008
G1 X74.215 Y66.491 E0.67847
G1 X73.749 Y66.491 E0.02287
G1 X77.469 Y80.416 E0.70781
G1 X77.158 Y80.953 E0.03049
G1 X77.154 Y80.938 E0.00081
G1 X73.283 Y66.491 E0.73453
G1 X72.817 Y66.49 E0.02288
G1 X76.836 Y81.489 E0.7626
G1 X76.376 Y81.509 E0.02263
G1 X72.352 Y66.491 E0.76356
G1 X71.886 Y66.491 E0.02288
G1 X75.91 Y81.509 E0.76355
G1 X75.444 Y81.51 E0.02287
G1 X71.666 Y67.409 E0.71697
G1 X71.419 Y66.49 E0.0467
G1 X70.954 Y66.491 E0.02287
G1 X74.978 Y81.509 E0.76358
G1 X74.512 Y81.509 E0.02288
G1 X70.488 Y66.491 E0.76356
G1 X70.022 Y66.491 E0.02288
G1 X74.046 Y81.51 E0.76358
G1 X73.58 Y81.51 E0.02288
G1 X69.715 Y67.084 E0.73345
G1 X69.556 Y66.49 E0.03022
G1 X69.09 Y66.491 E0.02286
G1 X73.114 Y81.509 E0.76355
G1 X72.648 Y81.509 E0.02288
G1 X68.624 Y66.491 E0.76356
G1 X68.164 Y66.511 E0.02264
G1 X72.183 Y81.51 E0.76259
G1 X71.717 Y81.509 E0.02289
G1 X67.842 Y67.047 E0.73533
G1 X67.834 Y67.06 E0.00076
G1 X67.528 Y67.613 E0.03107
G1 X71.251 Y81.509 E0.70646
G1 X70.785 Y81.509 E0.02288
G1 X67.205 Y68.149 E0.67927
G1 X67.197 Y68.162 E0.00076
G1 X66.891 Y68.716 E0.03107
G1 X70.319 Y81.51 E0.65051
G1 X69.853 Y81.509 E0.0229
G1 X66.569 Y69.251 E0.62322
G1 X66.561 Y69.265 E0.00076
G1 X66.255 Y69.818 E0.03107
G1 X69.387 Y81.509 E0.59439
G1 X68.922 Y81.509 E0.02287
G1 X65.932 Y70.353 E0.56721
G1 X65.925 Y70.367 E0.00076
G1 X65.618 Y70.92 E0.03107
; Prepare for Destring
G1 X68.448 Y81.479 E0.53681
G1 X68.434 Y81.469 E0.00081
G1 X67.875 Y81.081 E0.0334
G1 X65.296 Y71.456 E0.4894
G1 X65.288 Y71.469 E0.00076
G1 X64.982 Y72.023 E0.03107
G1 X65.527 Y74.057 E0.10341
G1 X65.988 Y75.778 E0.08752
G1 X66.366 Y77.187 E0.07162
G1 X66.659 Y78.283 E0.05573
G1 X66.869 Y79.066 E0.03982
G1 X66.995 Y79.537 E0.02393
G1 X67.038 Y79.694 E0.00803
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.744 Y74.865 E0 F3312
G1 X65.744 Y74.865 Z1.4625 E0 F900
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 92%
; fan %*255
M106 S235
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X66.168 Y78.187 E0 F9000
G1 X66.168 Y78.187 Z0.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259091, preload 0.000000
; Prepare for Destring
G1 X66.126 Y78.031 E0.00795 F2760
G1 X66 Y77.562 E0.02385
G1 X65.791 Y76.78 E0.03975
G1 X65.498 Y75.685 E0.05565
G1 X65.12 Y74.278 E0.07155
G1 X64.66 Y72.558 E0.08745
G1 X64.652 Y72.571 E0.00076
G1 X64.346 Y73.125 E0.03107
G1 X64.689 Y74.405 E0.06507
G1 X64.955 Y75.4 E0.05061
G1 X65.146 Y76.112 E0.03617
G1 X65.26 Y76.538 E0.0217
G1 X65.299 Y76.681 E0.00726
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.346 Y73.125 E0 F3312
G1 X64.652 Y72.571 E0
G1 X64.66 Y72.558 E0
G1 X64.833 Y73.205 E0
G1 X64.833 Y73.205 Z1.4625 E0 F900
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 92%
; fan %*255
M106 S235
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X64.43 Y75.177 E0 F9000
G1 X64.43 Y75.177 Z0.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259091, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.384 Y75.006 E0.00872 F2760
G1 X64.246 Y74.491 E0.02617
G1 X64.2 Y74.319 E0.00872
G1 X64.062 Y73.805 E0.02617
G1 X64.016 Y73.633 E0.00872
; Blending Fan to Cool (76.8% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.43 Y75.177 E0 F3312
; time estimate: pre = 16.949104, post = 15.628141
; Dwell time remaining = -5.628142
;
; Post-layer lift
G1 X64.43 Y75.177 Z1.7125 E0 F900
; END_LAYER_OBJECT z=0.963
; BEGIN_LAYER_OBJECT z=1.212 z_thickness=0.250
; fan %*255
M106 S255
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z1.7125 E0 F9000
G1 X80.987 Y75.246 Z1.2125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z1.7125 E0 F900
; Blending Fan to Cool (99.7% blend)
; Blended Fan at 100%
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X78.612 Y77.953 E0 F9000
G1 X78.612 Y77.953 Z1.2125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X78.798 Y77.89 E0.00918 F2760
G1 X78.98 Y77.656 E0.01384
G1 X79.244 Y77.318 E0.02008
G1 X79.223 Y77.323 E0.00103
G1 X78.393 Y77.546 E0.04019
G1 X78.276 Y77.111 E0.02105
G1 X79.586 Y76.749 E0.06355
G1 X79.896 Y76.211 E0.02904
G1 X79.881 Y76.215 E0.00076
G1 X78.171 Y76.673 E0.08279
G1 X77.798 Y76.319 E0.02404
G1 X77.801 Y76.307 E0.00059
G1 X80.222 Y75.646 E0.11741
G1 X80.533 Y75.109 E0.02904
G1 X80.517 Y75.113 E0.00077
G1 X77.492 Y75.923 E0.14646
G1 X77.376 Y75.489 E0.02104
G1 X80.856 Y74.555 E0.16853
G1 X81.133 Y74.016 E0.02832
G1 X81.119 Y74.02 E0.00067
G1 X76.998 Y75.124 E0.19955
G1 X76.713 Y74.735 E0.02256
G1 X80.94 Y73.602 E0.20469
G1 X80.708 Y73.198 E0.02178
; Prepare for Destring
G1 X76.597 Y74.3 E0.19908
G1 X76.648 Y73.82 E0.02257
G1 X80.476 Y72.795 E0.18534
G1 X80.242 Y72.391 E0.02181
G1 X76.989 Y73.263 E0.15751
G1 X76.997 Y73.25 E0.00073
G1 X77.323 Y72.708 E0.02958
G1 X80.009 Y71.988 E0.13007
G1 X79.777 Y71.584 E0.02179
G1 X78.651 Y71.886 E0.05448
G1 X77.625 Y72.161 E0.04969
G1 X77.633 Y72.147 E0.00072
G1 X77.959 Y71.606 E0.02958
G1 X79.544 Y71.181 E0.07675
G1 X79.31 Y70.778 E0.0218
G1 X78.262 Y71.059 E0.05076
G1 X78.269 Y71.045 E0.00072
G1 X78.594 Y70.504 E0.02955
G1 X78.958 Y70.406 E0.01759
G1 X79.079 Y70.374 E0.00588
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.594 Y70.504 E0 F3312
G1 X78.269 Y71.045 E0
G1 X78.262 Y71.059 E0
G1 X79.31 Y70.778 E0
G1 X79.544 Y71.181 E0
G1 X77.959 Y71.606 E0
G1 X77.633 Y72.147 E0
G1 X77.625 Y72.161 E0
G1 X77.636 Y72.158 E0
G1 X77.636 Y72.158 Z1.7125 E0 F900
; Blending Fan to Cool (99.7% blend)
; Blended Fan at 100%
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X66.322 Y70.065 E0 F9000
G1 X66.322 Y70.065 Z1.2125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X66.202 Y70.11 E0.00604 F2760
G1 X66.028 Y70.333 E0.01322
G1 X65.756 Y70.682 E0.0207
G1 X65.777 Y70.677 E0.00102
G1 X66.607 Y70.454 E0.04019
G1 X66.724 Y70.889 E0.02105
G1 X65.414 Y71.251 E0.06355
G1 X65.104 Y71.789 E0.02904
G1 X65.119 Y71.785 E0.00076
G1 X66.829 Y71.327 E0.08279
G1 X67.202 Y71.681 E0.02404
G1 X67.199 Y71.693 E0.00059
G1 X64.778 Y72.354 E0.11741
G1 X64.467 Y72.891 E0.02904
G1 X64.483 Y72.887 E0.00077
G1 X67.508 Y72.077 E0.14646
G1 X67.624 Y72.511 E0.02105
G1 X64.144 Y73.445 E0.16852
G1 X63.867 Y73.984 E0.02832
G1 X63.881 Y73.98 E0.00067
G1 X68.002 Y72.876 E0.19955
G1 X68.287 Y73.265 E0.02257
G1 X64.06 Y74.398 E0.20468
G1 X64.292 Y74.802 E0.02178
; Prepare for Destring
G1 X68.403 Y73.7 E0.19908
G1 X68.352 Y74.18 E0.02257
G1 X64.524 Y75.205 E0.18534
G1 X64.758 Y75.609 E0.02181
G1 X68.011 Y74.737 E0.15751
G1 X68.003 Y74.75 E0.00073
G1 X67.677 Y75.292 E0.02958
G1 X64.991 Y76.012 E0.13007
G1 X65.223 Y76.416 E0.02178
G1 X67.375 Y75.839 E0.10418
G1 X67.367 Y75.853 E0.00072
G1 X67.041 Y76.395 E0.02958
G1 X65.456 Y76.819 E0.07675
G1 X65.69 Y77.222 E0.0218
G1 X66.738 Y76.941 E0.05076
G1 X66.731 Y76.955 E0.00072
G1 X66.406 Y77.496 E0.02952
G1 X65.994 Y77.607 E0.01998
G1 X65.856 Y77.644 E0.00669
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X66.406 Y77.496 E0 F3312
G1 X66.731 Y76.955 E0
G1 X66.738 Y76.941 E0
G1 X65.69 Y77.222 E0
G1 X65.456 Y76.819 E0
G1 X67.041 Y76.395 E0
G1 X67.346 Y75.888 E0
G1 X67.346 Y75.888 Z1.7125 E0 F900
; Blending Fan to Cool (99.7% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z1.2125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X66.987 Y79.204 E0.00973 F3312
G1 X67.481 Y79.072 E0.0292
G1 X68.303 Y78.852 E0.04866
G1 X69.454 Y78.543 E0.06812
G1 X70.934 Y78.147 E0.08758
G1 X73.236 Y77.53 E0.13625
G1 X74.716 Y77.133 E0.08758
G1 X75.867 Y76.825 E0.06813
G1 X76.689 Y76.604 E0.04865
G1 X77.183 Y76.472 E0.0292
G1 X77.347 Y76.428 E0.00973
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X72.517 Y77.722 E0 F3312
G1 X72.517 Y77.722 Z1.7125 E0 F900
; Blending Fan to Cool (99.7% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z1.2125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.539 Y69.587 E0.00989 F3312
G1 X78.038 Y69.721 E0.02967
G1 X77.202 Y69.945 E0.04946
G1 X76.032 Y70.258 E0.06924
G1 X74.528 Y70.661 E0.08902
G1 X72.188 Y71.288 E0.13848
G1 X70.684 Y71.691 E0.08902
G1 X69.514 Y72.005 E0.06924
G1 X68.678 Y72.229 E0.04945
G1 X68.177 Y72.363 E0.02968
G1 X68.01 Y72.408 E0.00989
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.839 Y71.114 E0 F3312
; time estimate: pre = 10.075277, post = 8.580422
; Dwell time remaining = 1.419578
;
; Post-layer lift
G1 X72.839 Y71.114 Z1.9625 E0 F900
; END_LAYER_OBJECT z=1.212
; BEGIN_LAYER_OBJECT z=1.462 z_thickness=0.250
; *** Estimate 6.559636 [s], Slowing (0.619x) to 10.0 [s] ***
;
; 'Loop Path', 1.1 [feed mm/s], 22.8 [head mm/s]
G1 X80.987 Y75.246 Z1.9625 E0 F9000
G1 X80.987 Y75.246 Z1.4625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.779202, filament speed 1.065430, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F1366.8
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 11.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 11.389601, filament speed 0.532715, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F683.4
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F2050.1
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z1.9625 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z1.4625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
; Prepare for Destring
G1 X78.735 Y78.142 E0.01093 F2050.1
G1 X78.586 Y77.588 E0.03278
G1 X78.339 Y76.665 E0.05464
G1 X77.992 Y75.373 E0.0765
G1 X77.547 Y73.711 E0.09835
G1 X76.854 Y71.126 E0.153
G1 X76.409 Y69.464 E0.09835
G1 X76.063 Y68.171 E0.0765
G1 X75.815 Y67.248 E0.05464
G1 X75.667 Y66.694 E0.03278
G1 X75.617 Y66.509 E0.01093
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X76.912 Y71.339 E0 F2050.1
G1 X76.912 Y71.339 Z1.9625 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z1.4625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
G1 X65.285 Y76.63 E0.00901 F2050.1
G1 X65.163 Y76.173 E0.02704
G1 X64.96 Y75.411 E0.04507
G1 X64.676 Y74.345 E0.06309
G1 X64.311 Y72.973 E0.08111
G1 X64.677 Y72.415 E0.03817
G1 X65.093 Y71.65 E0.04982
G1 X65.563 Y70.876 E0.05174
G1 X66.012 Y70.092 E0.05164
; Prepare for End-Of-Layer
G1 X66.453 Y69.296 E0.05203
G1 X66.917 Y68.551 E0.05015
G1 X67.327 Y67.782 E0.04983
G1 X67.914 Y66.87 E0.06201
G1 X68.479 Y66.593 E0.03599
G1 X69.079 Y66.448 E0.03525
G1 X71.337 Y74.875 E0.49878
G1 X71.886 Y76.923 E0.12117
G1 X72.332 Y78.59 E0.09864
G1 X72.677 Y79.875 E0.07609
G1 X72.919 Y80.78 E0.05355
G1 X73.059 Y81.304 E0.03101
G1 X73.099 Y81.45 E0.00864
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X73.059 Y81.304 E0 F2050.1
G1 X71.805 Y76.62 E0
; time estimate: pre = 9.991534, post = 9.775316
; Dwell time remaining = 0.224684
;
; Post-layer lift
G1 X71.805 Y76.62 Z2.2125 E0 F900
; END_LAYER_OBJECT z=1.462
; BEGIN_LAYER_OBJECT z=1.712 z_thickness=0.250
; *** Estimate 6.133426 [s], Slowing (0.584x) to 10.0 [s] ***
;
; 'Loop Path', 1.0 [feed mm/s], 21.5 [head mm/s]
G1 X80.987 Y75.246 Z2.2125 E0 F9000
G1 X80.987 Y75.246 Z1.7125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 21.491203, filament speed 1.005188, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F1289.5
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 10.7 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 10.745602, filament speed 0.502594, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F644.7
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 32.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 32.236805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F1934.2
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z2.2125 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 1.8 [feed mm/s], 32.2 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z1.7125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 32.236809, filament speed 1.842845, preload 0.000000
G1 X78.524 Y69.591 E0.01078 F1934.2
G1 X77.978 Y69.737 E0.03233
G1 X77.067 Y69.981 E0.05388
G1 X75.793 Y70.322 E0.07544
G1 X74.154 Y70.762 E0.09699
G1 X72.151 Y71.298 E0.11855
G1 X63.956 Y73.494 E0.48496
; Prepare for End-Of-Layer
G1 X64.213 Y74.552 E0.06223
G1 X64.394 Y75.182 E0.03749
G1 X65.007 Y75.552 E0.04095
G1 X65.097 Y76.097 E0.03154
G1 X65.438 Y76.814 E0.04543
G1 X65.927 Y77.513 E0.04876
G1 X66.251 Y78.309 E0.04911
G1 X66.721 Y79.029 E0.04913
G1 X66.823 Y79.248 E0.01385
G1 X74.335 Y77.235 E0.44455
G1 X76.171 Y76.743 E0.10867
G1 X77.673 Y76.341 E0.08891
G1 X78.842 Y76.028 E0.06915
G1 X79.676 Y75.804 E0.0494
G1 X80.177 Y75.67 E0.02963
G1 X80.344 Y75.625 E0.00988
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 32.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 32.236805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.514 Y76.919 E0 F1934.2
; time estimate: pre = 10.002772, post = 9.809393
; Dwell time remaining = 0.190607
;
; Post-layer lift
G1 X75.514 Y76.919 Z2.4625 E0 F900
; END_LAYER_OBJECT z=1.712
; BEGIN_LAYER_OBJECT z=1.962 z_thickness=0.250
; *** Estimate 6.559636 [s], Slowing (0.619x) to 10.0 [s] ***
;
; 'Loop Path', 1.1 [feed mm/s], 22.8 [head mm/s]
G1 X80.987 Y75.246 Z2.4625 E0 F9000
G1 X80.987 Y75.246 Z1.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.779202, filament speed 1.065430, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F1366.8
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 11.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 11.389601, filament speed 0.532715, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F683.4
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F2050.1
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z2.4625 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z1.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
; Prepare for Destring
G1 X78.735 Y78.142 E0.01093 F2050.1
G1 X78.586 Y77.588 E0.03278
G1 X78.339 Y76.665 E0.05464
G1 X77.992 Y75.373 E0.0765
G1 X77.547 Y73.711 E0.09835
G1 X76.854 Y71.126 E0.153
G1 X76.409 Y69.464 E0.09835
G1 X76.063 Y68.171 E0.0765
G1 X75.815 Y67.248 E0.05464
G1 X75.667 Y66.694 E0.03278
G1 X75.617 Y66.509 E0.01093
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X76.912 Y71.339 E0 F2050.1
G1 X76.912 Y71.339 Z2.4625 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z1.9625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
G1 X65.285 Y76.63 E0.00901 F2050.1
G1 X65.163 Y76.173 E0.02704
G1 X64.96 Y75.411 E0.04507
G1 X64.676 Y74.345 E0.06309
G1 X64.311 Y72.973 E0.08111
G1 X64.677 Y72.415 E0.03817
G1 X65.093 Y71.65 E0.04982
G1 X65.563 Y70.876 E0.05174
G1 X66.012 Y70.092 E0.05164
; Prepare for End-Of-Layer
G1 X66.453 Y69.296 E0.05203
G1 X66.917 Y68.551 E0.05015
G1 X67.327 Y67.782 E0.04983
G1 X67.914 Y66.87 E0.06201
G1 X68.479 Y66.593 E0.03599
G1 X69.079 Y66.448 E0.03525
G1 X71.337 Y74.875 E0.49878
G1 X71.886 Y76.923 E0.12117
G1 X72.332 Y78.59 E0.09864
G1 X72.677 Y79.875 E0.07609
G1 X72.919 Y80.78 E0.05355
G1 X73.059 Y81.304 E0.03101
G1 X73.099 Y81.45 E0.00864
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X73.059 Y81.304 E0 F2050.1
G1 X71.805 Y76.62 E0
; time estimate: pre = 9.991534, post = 9.775316
; Dwell time remaining = 0.224684
;
; Post-layer lift
G1 X71.805 Y76.62 Z2.725 E0 F900
; END_LAYER_OBJECT z=1.962
; BEGIN_LAYER_OBJECT z=2.225 z_thickness=0.263
; *** Estimate 6.133426 [s], Slowing (0.584x) to 10.0 [s] ***
;
; 'Loop Path', 1.1 [feed mm/s], 21.5 [head mm/s]
G1 X80.987 Y75.246 Z2.725 E0 F9000
G1 X80.987 Y75.246 Z2.225 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 21.491205, filament speed 1.055449, preload 0.000000
G1 X80.908 Y75.381 E0.00769 F1289.5
G1 X80.673 Y75.788 E0.02305
G1 X80.282 Y76.465 E0.03843
G1 X79.734 Y77.414 E0.0538
G1 X79.029 Y78.633 E0.06918
G1 X78.167 Y80.124 E0.08454
G1 X77.149 Y81.885 E0.09992
G1 X77.073 Y81.972 E0.00567
G1 X67.902 Y81.971 E0.45039
G1 X64.077 Y75.354 E0.37536
G1 X63.297 Y74.003 E0.07661
G1 X63.79 Y73.142 E0.04873
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.39859
G1 X67.927 Y66.028 E0.00567
G1 X77.098 Y66.029 E0.45039
G1 X78.088 Y67.741 E0.09711
G1 X78.925 Y69.189 E0.08218
G1 X79.61 Y70.375 E0.06724
G1 X80.143 Y71.297 E0.05229
G1 X80.524 Y71.955 E0.03735
G1 X80.752 Y72.35 E0.02242
G1 X80.828 Y72.482 E0.00747
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 10.7 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 10.745603, filament speed 0.527724, preload 0.000000
G1 X80.908 Y72.621 E0.00286 F644.7
G1 X81.035 Y72.836 E0.01231
G1 X81.263 Y73.223 E0.02201
G1 X81.59 Y73.779 E0.03171
G1 X82.147 Y74.027 E0.02992
G1 X82.171 Y74.047 E0.00153
G1 X82.18 Y74.077 E0.00152
G1 X82.173 Y74.107 E0.00152
G1 X81.526 Y75.225 E0.06343
G1 X80.726 Y76.609 E0.07852
G1 X79.773 Y78.26 E0.09363
G1 X77.403 Y82.36 E0.23255
G1 X77.39 Y82.376 E0.00101
G1 X77.372 Y82.385 E0.00101
G1 X77.248 Y82.425 E0.00638
G1 X72.574 Y82.425 E0.22957
G1 X67.855 Y82.426 E0.23173
G1 X67.663 Y82.427 E0.00942
G1 X67.635 Y82.42 E0.00144
G1 X67.614 Y82.399 E0.00144
G1 X65.574 Y78.855 E0.20083
G1 X63.186 Y74.719 E0.23453
G1 X62.795 Y74.034 E0.03873
G1 X62.787 Y74.008 E0.00135
G1 X62.793 Y73.981 E0.00135
G1 X62.91 Y73.75 E0.01273
G1 X67.597 Y65.64 E0.46
G1 X67.61 Y65.624 E0.00101
G1 X67.628 Y65.615 E0.00101
G1 X67.752 Y65.575 E0.00638
G1 X72.426 Y65.575 E0.22957
G1 X77.145 Y65.574 E0.23173
G1 X77.337 Y65.573 E0.00942
G1 X77.365 Y65.58 E0.00144
G1 X77.386 Y65.601 E0.00144
G1 X79.426 Y69.145 E0.20083
G1 X80.359 Y70.762 E0.09168
G1 X81.155 Y72.141 E0.07818
G1 X81.814 Y73.281 E0.06466
G1 X82.141 Y73.847 E0.03211
G1 X82.148 Y73.883 E0.00178
G1 X82.131 Y73.915 E0.00178
G1 X81.92 Y74.125 E0.01465
G1 X81.605 Y74.208 E0.01595
G1 X81.586 Y74.217 E0.00109
G1 X81.571 Y74.234 E0.00108
G1 X81.22 Y74.842 E0.03449
G1 X81.035 Y75.162 E0.01814
G1 X81.004 Y75.215 E0.00303
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 32.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 32.236805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F1934.2
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z2.725 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 1.9 [feed mm/s], 32.2 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z2.225 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 32.236805, filament speed 1.934989, preload 0.000000
G1 X78.524 Y69.591 E0.01132 F1934.2
G1 X77.978 Y69.737 E0.03394
G1 X77.067 Y69.981 E0.05658
G1 X75.793 Y70.322 E0.07921
G1 X74.154 Y70.762 E0.10185
G1 X72.151 Y71.298 E0.12447
G1 X63.956 Y73.494 E0.50921
; Prepare for End-Of-Layer
G1 X64.213 Y74.552 E0.06534
G1 X64.394 Y75.182 E0.03936
G1 X65.007 Y75.552 E0.043
G1 X65.097 Y76.097 E0.03312
G1 X65.438 Y76.814 E0.0477
G1 X65.927 Y77.513 E0.0512
G1 X66.251 Y78.309 E0.05157
G1 X66.721 Y79.029 E0.05158
G1 X66.823 Y79.248 E0.01454
G1 X74.335 Y77.235 E0.46678
G1 X76.171 Y76.743 E0.1141
G1 X77.673 Y76.341 E0.09336
G1 X78.842 Y76.028 E0.07261
G1 X79.676 Y75.804 E0.05186
G1 X80.177 Y75.67 E0.03112
G1 X80.344 Y75.625 E0.01037
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 32.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 32.236805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.514 Y76.919 E0 F1934.2
; time estimate: pre = 10.002771, post = 9.809392
; Dwell time remaining = 0.190608
;
; Post-layer lift
G1 X75.514 Y76.919 Z2.975 E0 F900
; END_LAYER_OBJECT z=2.225
; BEGIN_LAYER_OBJECT z=2.475 z_thickness=0.250
; *** Estimate 6.559636 [s], Slowing (0.619x) to 10.0 [s] ***
;
; 'Loop Path', 1.1 [feed mm/s], 22.8 [head mm/s]
G1 X80.987 Y75.246 Z2.975 E0 F9000
G1 X80.987 Y75.246 Z2.475 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.779202, filament speed 1.065430, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F1366.8
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 11.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 11.389601, filament speed 0.532715, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F683.4
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F2050.1
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z2.975 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z2.475 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
; Prepare for Destring
G1 X78.735 Y78.142 E0.01093 F2050.1
G1 X78.586 Y77.588 E0.03278
G1 X78.339 Y76.665 E0.05464
G1 X77.992 Y75.373 E0.0765
G1 X77.547 Y73.711 E0.09835
G1 X76.854 Y71.126 E0.153
G1 X76.409 Y69.464 E0.09835
G1 X76.063 Y68.171 E0.0765
G1 X75.815 Y67.248 E0.05464
G1 X75.667 Y66.694 E0.03278
G1 X75.617 Y66.509 E0.01093
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X76.912 Y71.339 E0 F2050.1
G1 X76.912 Y71.339 Z2.975 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z2.475 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
G1 X65.285 Y76.63 E0.00901 F2050.1
G1 X65.163 Y76.173 E0.02704
G1 X64.96 Y75.411 E0.04507
G1 X64.676 Y74.345 E0.06309
G1 X64.311 Y72.973 E0.08111
G1 X64.677 Y72.415 E0.03817
G1 X65.093 Y71.65 E0.04982
G1 X65.563 Y70.876 E0.05174
G1 X66.012 Y70.092 E0.05164
; Prepare for End-Of-Layer
G1 X66.453 Y69.296 E0.05203
G1 X66.917 Y68.551 E0.05015
G1 X67.327 Y67.782 E0.04983
G1 X67.914 Y66.87 E0.06201
G1 X68.479 Y66.593 E0.03599
G1 X69.079 Y66.448 E0.03525
G1 X71.337 Y74.875 E0.49878
G1 X71.886 Y76.923 E0.12117
G1 X72.332 Y78.59 E0.09864
G1 X72.677 Y79.875 E0.07609
G1 X72.919 Y80.78 E0.05355
G1 X73.059 Y81.304 E0.03101
G1 X73.099 Y81.45 E0.00864
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X73.059 Y81.304 E0 F2050.1
G1 X71.805 Y76.62 E0
; time estimate: pre = 9.991534, post = 9.775316
; Dwell time remaining = 0.224684
;
; Post-layer lift
G1 X71.805 Y76.62 Z3.225 E0 F900
; END_LAYER_OBJECT z=2.475
; BEGIN_LAYER_OBJECT z=2.725 z_thickness=0.250
; *** Estimate 6.133426 [s], Slowing (0.584x) to 10.0 [s] ***
;
; 'Loop Path', 1.0 [feed mm/s], 21.5 [head mm/s]
G1 X80.987 Y75.246 Z3.225 E0 F9000
G1 X80.987 Y75.246 Z2.725 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 21.491203, filament speed 1.005188, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F1289.5
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 10.7 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 10.745602, filament speed 0.502594, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F644.7
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 32.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 32.236805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F1934.2
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z3.225 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 1.8 [feed mm/s], 32.2 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z2.725 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 32.236809, filament speed 1.842845, preload 0.000000
G1 X78.524 Y69.591 E0.01078 F1934.2
G1 X77.978 Y69.737 E0.03233
G1 X77.067 Y69.981 E0.05388
G1 X75.793 Y70.322 E0.07544
G1 X74.154 Y70.762 E0.09699
G1 X72.151 Y71.298 E0.11855
G1 X63.956 Y73.494 E0.48496
; Prepare for End-Of-Layer
G1 X64.213 Y74.552 E0.06223
G1 X64.394 Y75.182 E0.03749
G1 X65.007 Y75.552 E0.04095
G1 X65.097 Y76.097 E0.03154
G1 X65.438 Y76.814 E0.04543
G1 X65.927 Y77.513 E0.04876
G1 X66.251 Y78.309 E0.04911
G1 X66.721 Y79.029 E0.04913
G1 X66.823 Y79.248 E0.01385
G1 X74.335 Y77.235 E0.44455
G1 X76.171 Y76.743 E0.10867
G1 X77.673 Y76.341 E0.08891
G1 X78.842 Y76.028 E0.06915
G1 X79.676 Y75.804 E0.0494
G1 X80.177 Y75.67 E0.02963
G1 X80.344 Y75.625 E0.00988
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 32.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 32.236805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.514 Y76.919 E0 F1934.2
; time estimate: pre = 10.002772, post = 9.809393
; Dwell time remaining = 0.190607
;
; Post-layer lift
G1 X75.514 Y76.919 Z3.475 E0 F900
; END_LAYER_OBJECT z=2.725
; BEGIN_LAYER_OBJECT z=2.975 z_thickness=0.250
; *** Estimate 6.559636 [s], Slowing (0.619x) to 10.0 [s] ***
;
; 'Loop Path', 1.1 [feed mm/s], 22.8 [head mm/s]
G1 X80.987 Y75.246 Z3.475 E0 F9000
G1 X80.987 Y75.246 Z2.975 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.779202, filament speed 1.065430, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F1366.8
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.5 [feed mm/s], 11.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 11.389601, filament speed 0.532715, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F683.4
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F2050.1
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z3.475 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z2.975 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
; Prepare for Destring
G1 X78.735 Y78.142 E0.01093 F2050.1
G1 X78.586 Y77.588 E0.03278
G1 X78.339 Y76.665 E0.05464
G1 X77.992 Y75.373 E0.0765
G1 X77.547 Y73.711 E0.09835
G1 X76.854 Y71.126 E0.153
G1 X76.409 Y69.464 E0.09835
G1 X76.063 Y68.171 E0.0765
G1 X75.815 Y67.248 E0.05464
G1 X75.667 Y66.694 E0.03278
G1 X75.617 Y66.509 E0.01093
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
G1 X76.912 Y71.339 E0 F2050.1
G1 X76.912 Y71.339 Z3.475 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 2.0 [feed mm/s], 34.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z2.975 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.168800, filament speed 1.953289, preload 0.000000
G1 X65.285 Y76.63 E0.00901 F2050.1
G1 X65.163 Y76.173 E0.02704
G1 X64.96 Y75.411 E0.04507
G1 X64.676 Y74.345 E0.06309
G1 X64.311 Y72.973 E0.08111
G1 X64.677 Y72.415 E0.03817
G1 X65.093 Y71.65 E0.04982
G1 X65.563 Y70.876 E0.05174
G1 X66.012 Y70.092 E0.05164
; Prepare for End-Of-Layer
G1 X66.453 Y69.296 E0.05203
G1 X66.917 Y68.551 E0.05015
G1 X67.327 Y67.782 E0.04983
G1 X67.914 Y66.87 E0.06201
G1 X68.479 Y66.593 E0.03599
G1 X69.079 Y66.448 E0.03525
G1 X71.337 Y74.875 E0.49878
G1 X71.886 Y76.923 E0.12117
G1 X72.332 Y78.59 E0.09864
G1 X72.677 Y79.875 E0.07609
G1 X72.919 Y80.78 E0.05355
G1 X73.059 Y81.304 E0.03101
G1 X73.099 Y81.45 E0.00864
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 34.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 34.168800, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X73.059 Y81.304 E0 F2050.1
G1 X71.805 Y76.62 E0
; time estimate: pre = 9.991534, post = 9.775316
; Dwell time remaining = 0.224684
;
; Post-layer lift
G1 X71.805 Y76.62 Z3.7375 E0 F900
; END_LAYER_OBJECT z=2.975
; BEGIN_LAYER_OBJECT z=3.237 z_thickness=0.262
;
; 'Loop Path', 1.8 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z3.7375 E0 F9000
G1 X80.987 Y75.246 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.807271, preload 0.000000
G1 X80.908 Y75.381 E0.00769 F2208
G1 X80.673 Y75.788 E0.02305
G1 X80.282 Y76.465 E0.03843
G1 X79.734 Y77.414 E0.0538
G1 X79.029 Y78.633 E0.06918
G1 X78.167 Y80.124 E0.08454
G1 X77.149 Y81.885 E0.09992
G1 X77.073 Y81.972 E0.00567
G1 X67.902 Y81.971 E0.45039
G1 X64.077 Y75.354 E0.37535
G1 X63.297 Y74.003 E0.07662
G1 X63.79 Y73.142 E0.04872
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.39859
G1 X67.927 Y66.028 E0.00567
G1 X77.098 Y66.029 E0.45039
G1 X78.088 Y67.741 E0.09712
G1 X78.925 Y69.189 E0.08218
G1 X79.61 Y70.375 E0.06723
G1 X80.143 Y71.297 E0.0523
G1 X80.524 Y71.955 E0.03735
G1 X80.752 Y72.35 E0.02241
G1 X80.828 Y72.482 E0.00747
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.903636, preload 0.000000
G1 X80.908 Y72.621 E0.00286 F1104
G1 X81.035 Y72.836 E0.01231
G1 X81.263 Y73.223 E0.02201
G1 X81.59 Y73.779 E0.03171
G1 X82.147 Y74.027 E0.02992
G1 X82.171 Y74.047 E0.00153
G1 X82.18 Y74.077 E0.00152
G1 X82.173 Y74.107 E0.00152
G1 X81.526 Y75.225 E0.06343
G1 X80.726 Y76.609 E0.07852
G1 X79.773 Y78.26 E0.09363
G1 X77.403 Y82.36 E0.23255
G1 X77.39 Y82.376 E0.00101
G1 X77.372 Y82.385 E0.00101
G1 X77.248 Y82.425 E0.00638
G1 X72.574 Y82.425 E0.22957
G1 X67.855 Y82.426 E0.23173
G1 X67.663 Y82.427 E0.00942
G1 X67.635 Y82.42 E0.00144
G1 X67.614 Y82.399 E0.00144
G1 X65.574 Y78.855 E0.20083
G1 X63.186 Y74.719 E0.23452
G1 X62.795 Y74.034 E0.03874
G1 X62.787 Y74.008 E0.00135
G1 X62.793 Y73.981 E0.00135
G1 X62.91 Y73.75 E0.01273
G1 X67.597 Y65.64 E0.46
G1 X67.61 Y65.624 E0.00101
G1 X67.628 Y65.615 E0.00101
G1 X67.752 Y65.575 E0.00638
G1 X72.426 Y65.575 E0.22956
G1 X77.145 Y65.574 E0.23173
G1 X77.337 Y65.573 E0.00942
G1 X77.365 Y65.58 E0.00144
G1 X77.386 Y65.601 E0.00145
G1 X79.426 Y69.145 E0.20082
G1 X80.359 Y70.762 E0.09169
G1 X81.155 Y72.141 E0.07817
G1 X81.814 Y73.281 E0.06466
G1 X82.141 Y73.847 E0.03212
G1 X82.148 Y73.883 E0.00178
G1 X82.131 Y73.915 E0.00178
G1 X81.92 Y74.125 E0.01465
G1 X81.605 Y74.208 E0.01595
G1 X81.586 Y74.217 E0.00108
G1 X81.571 Y74.234 E0.00109
G1 X81.22 Y74.842 E0.03448
G1 X81.035 Y75.162 E0.01814
G1 X81.004 Y75.215 E0.00304
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X76.275 Y71.125 E0 F9000
G1 X76.275 Y71.125 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.694317, preload 0.000000
; Prepare for Destring
G1 X76.084 Y71.176 E0.0097 F2070
G1 X75.512 Y71.33 E0.02911
G1 X74.557 Y71.585 E0.04852
G1 X73.222 Y71.943 E0.06792
G1 X71.504 Y72.403 E0.08732
G1 X69.405 Y72.966 E0.10674
G1 X66.924 Y73.631 E0.12613
G1 X66.967 Y73.589 E0.00295
G1 X67.359 Y73.168 E0.02826
G1 X67.562 Y72.528 E0.03297
G1 X69.811 Y71.925 E0.11437
G1 X71.715 Y71.415 E0.09677
G1 X73.272 Y70.998 E0.07918
G1 X74.483 Y70.673 E0.0616
G1 X75.349 Y70.441 E0.044
G1 X75.869 Y70.302 E0.02642
G1 X76.042 Y70.256 E0.00883
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X71.212 Y71.55 E0 F3312
G1 X71.212 Y71.55 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X72.968 Y69.216 E0 F9000
G1 X72.968 Y69.216 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.694317, preload 0.000000
; Prepare for Destring
G1 X72.803 Y69.26 E0.00841 F2070
G1 X72.306 Y69.394 E0.02525
G1 X71.479 Y69.616 E0.04207
G1 X70.321 Y69.927 E0.05889
G1 X68.832 Y70.328 E0.07573
G1 X68.632 Y70.964 E0.03273
G1 X68.197 Y71.426 E0.0312
G1 X68.282 Y71.403 E0.00433
G1 X70.163 Y70.899 E0.09566
G1 X71.755 Y70.473 E0.08095
G1 X73.058 Y70.123 E0.06623
G1 X74.071 Y69.852 E0.05152
G1 X74.795 Y69.658 E0.0368
G1 X75.23 Y69.542 E0.02209
G1 X75.375 Y69.503 E0.00736
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X70.545 Y70.797 E0 F3312
G1 X70.545 Y70.797 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X76.943 Y71.878 E0 F9000
G1 X76.943 Y71.878 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.694317, preload 0.000000
G1 X76.79 Y71.919 E0.00777 F2070
G1 X76.331 Y72.042 E0.02333
G1 X75.567 Y72.247 E0.03887
G1 X74.496 Y72.533 E0.05442
G1 X73.12 Y72.902 E0.06996
G1 X71.438 Y73.353 E0.08552
G1 X69.45 Y73.885 E0.10106
G1 X67.157 Y74.5 E0.11662
G1 X67.39 Y75.369 E0.04419
; Prepare for Destring
G1 X77.61 Y72.631 E0.51965
G1 X77.843 Y73.5 E0.0442
G1 X75.55 Y74.114 E0.11657
G1 X73.563 Y74.647 E0.10104
G1 X71.882 Y75.097 E0.0855
G1 X70.505 Y75.466 E0.06996
G1 X69.435 Y75.753 E0.05443
G1 X68.67 Y75.958 E0.03888
G1 X68.211 Y76.081 E0.02335
G1 X68.057 Y76.122 E0.00781
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X72.887 Y74.828 E0 F3312
G1 X72.887 Y74.828 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X68.725 Y76.875 E0 F9000
G1 X68.725 Y76.875 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.694317, preload 0.000000
; Prepare for Destring
G1 X68.916 Y76.824 E0.0097 F2070
G1 X69.488 Y76.67 E0.02911
G1 X70.443 Y76.415 E0.04852
G1 X71.778 Y76.057 E0.06792
G1 X73.496 Y75.597 E0.08732
G1 X75.595 Y75.034 E0.10674
G1 X78.076 Y74.369 E0.12613
G1 X78.033 Y74.411 E0.00295
G1 X77.641 Y74.832 E0.02826
G1 X77.438 Y75.472 E0.03297
G1 X75.188 Y76.075 E0.11439
G1 X73.285 Y76.585 E0.0968
G1 X71.727 Y77.002 E0.07919
G1 X70.515 Y77.327 E0.06159
G1 X69.65 Y77.559 E0.044
G1 X69.131 Y77.698 E0.0264
G1 X68.958 Y77.744 E0.0088
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X73.788 Y76.45 E0 F3312
G1 X73.788 Y76.45 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X69.625 Y78.497 E0 F9000
G1 X69.625 Y78.497 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.694317, preload 0.000000
; Prepare for Destring
G1 X69.772 Y78.458 E0.00745 F2070
G1 X70.211 Y78.34 E0.02234
G1 X70.944 Y78.144 E0.03724
G1 X71.969 Y77.869 E0.05214
G1 X73.288 Y77.516 E0.06703
G1 X74.899 Y77.084 E0.08192
G1 X76.803 Y76.574 E0.09683
G1 X76.76 Y76.615 E0.00294
G1 X76.368 Y77.036 E0.02826
G1 X76.165 Y77.677 E0.03297
G1 X74.677 Y78.075 E0.07566
G1 X73.52 Y78.385 E0.05885
G1 X72.693 Y78.607 E0.04203
G1 X72.197 Y78.74 E0.02522
G1 X72.032 Y78.784 E0.00841
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.165 Y77.677 E0 F3312
G1 X76.368 Y77.036 E0
G1 X76.401 Y77 E0
G1 X76.401 Y77 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X69.815 Y78.446 E0 F9000
G1 X69.815 Y78.446 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200005, filament speed 3.313331, preload 0.000000
; Prepare for Destring
G1 X69.628 Y78.496 E0.01162 F3312
G1 X69.067 Y78.647 E0.03487
G1 X68.132 Y78.897 E0.05811
G1 X66.823 Y79.248 E0.08135
G1 X66.536 Y78.698 E0.03723
G1 X66.083 Y78.008 E0.04952
G1 X65.779 Y77.139 E0.05528
G1 X65.217 Y76.556 E0.04862
G1 X65.034 Y75.744 E0.05
G1 X64.812 Y75.432 E0.02296
G1 X64.337 Y75.015 E0.03794
G1 X64.074 Y73.989 E0.06357
G1 X63.956 Y73.494 E0.03055
G1 X65.322 Y73.128 E0.08487
G1 X66.384 Y72.843 E0.06601
G1 X67.143 Y72.64 E0.04715
G1 X67.598 Y72.518 E0.02829
G1 X67.75 Y72.477 E0.00943
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X63.956 Y73.494 E0 F3312
G1 X64.074 Y73.989 E0
G1 X64.214 Y74.535 E0
G1 X64.214 Y74.535 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X75.852 Y70.307 E0 F9000
G1 X75.852 Y70.307 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200005, filament speed 3.313331, preload 0.000000
; Prepare for Destring
G1 X76.031 Y70.259 E0.01108 F3312
G1 X76.566 Y70.115 E0.03326
G1 X77.992 Y69.733 E0.08865
G1 X78.528 Y69.59 E0.03326
G1 X78.706 Y69.542 E0.0111
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.852 Y70.307 E0 F3312
G1 X75.852 Y70.307 Z3.7375 E0 F900
; Blending Fan to Cool (97.6% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X80.344 Y75.625 E0 F9000
G1 X80.344 Y75.625 Z3.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200005, filament speed 3.313331, preload 0.000000
; Prepare for End-Of-Layer
G1 X80.195 Y75.665 E0.00927 F3312
G1 X79.747 Y75.785 E0.02782
G1 X79.001 Y75.985 E0.04636
G1 X77.956 Y76.265 E0.06491
G1 X77.21 Y76.465 E0.04636
G1 X76.763 Y76.585 E0.02782
G1 X76.613 Y76.625 E0.00927
; time estimate: pre = 10.714418, post = 9.954637
; Dwell time remaining = 0.045363
;
; Post-layer lift
G1 X76.613 Y76.625 Z3.9875 E0 F900
; END_LAYER_OBJECT z=3.237
; BEGIN_LAYER_OBJECT z=3.487 z_thickness=0.250
; fan %*255
M106 S255
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z3.9875 E0 F9000
G1 X80.987 Y75.246 Z3.4875 E0 F900
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X76.96 Y71.521 E0 F9000
G1 X76.96 Y71.521 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X77 Y71.669 E0.00717 F2070
G1 X77.118 Y72.113 E0.02152
G1 X77.316 Y72.854 E0.03585
G1 X77.593 Y73.891 E0.0502
G1 X77.949 Y75.224 E0.06455
G1 X77.498 Y75.715 E0.03116
G1 X77.315 Y76.323 E0.02972
G1 X77.293 Y76.238 E0.00412
G1 X75.276 Y68.711 E0.36449
G1 X74.406 Y68.944 E0.0421
G1 X76.676 Y77.429 E0.41081
G1 X76.225 Y77.919 E0.03117
G1 X76.043 Y78.528 E0.02971
G1 X76.02 Y78.443 E0.00413
G1 X73.421 Y68.742 E0.46972
G1 X72.551 Y68.975 E0.0421
; Prepare for Destring
G1 X75.29 Y79.196 E0.4949
G1 X74.42 Y79.428 E0.04209
G1 X73.751 Y76.932 E0.1209
G1 X73.172 Y74.768 E0.10478
G1 X72.681 Y72.937 E0.08867
G1 X72.279 Y71.438 E0.07255
G1 X71.967 Y70.273 E0.05644
G1 X71.744 Y69.44 E0.04032
G1 X71.61 Y68.94 E0.0242
G1 X71.565 Y68.773 E0.00809
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X72.859 Y73.603 E0 F3312
G1 X72.859 Y73.603 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X70.58 Y68.572 E0 F9000
G1 X70.58 Y68.572 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X70.624 Y68.738 E0.00806 F2070
G1 X70.758 Y69.237 E0.02419
G1 X70.981 Y70.07 E0.0403
G1 X71.293 Y71.235 E0.05644
G1 X71.695 Y72.734 E0.07255
G1 X72.319 Y75.065 E0.11286
G1 X72.721 Y76.563 E0.07256
G1 X73.033 Y77.728 E0.05643
G1 X73.256 Y78.561 E0.04031
G1 X73.39 Y79.06 E0.02418
G1 X73.435 Y79.227 E0.00807
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X72.141 Y74.397 E0 F3312
G1 X72.141 Y74.397 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X72.449 Y79.025 E0 F9000
G1 X72.449 Y79.025 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X72.406 Y78.865 E0.00773 F2070
G1 X72.278 Y78.386 E0.0232
G1 X72.064 Y77.588 E0.03866
G1 X71.764 Y76.47 E0.05413
G1 X71.379 Y75.033 E0.0696
G1 X70.78 Y72.797 E0.10826
G1 X70.395 Y71.36 E0.06959
G1 X70.095 Y70.242 E0.05413
G1 X69.881 Y69.443 E0.03867
G1 X69.753 Y68.964 E0.0232
G1 X69.71 Y68.804 E0.00773
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X71.004 Y73.634 E0 F3312
G1 X71.004 Y73.634 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X68.957 Y69.472 E0 F9000
G1 X68.957 Y69.472 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X68.998 Y69.625 E0.0074 F2070
G1 X69.121 Y70.084 E0.02222
G1 X69.326 Y70.848 E0.03702
G1 X69.613 Y71.919 E0.05182
G1 X69.982 Y73.295 E0.06664
G1 X70.555 Y75.435 E0.10365
G1 X70.924 Y76.811 E0.06664
G1 X71.211 Y77.882 E0.05183
G1 X71.416 Y78.646 E0.03702
G1 X71.539 Y79.105 E0.02221
G1 X71.579 Y79.258 E0.0074
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X70.285 Y74.428 E0 F3312
G1 X70.285 Y74.428 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X70.594 Y79.056 E0 F9000
G1 X70.594 Y79.056 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X70.547 Y78.883 E0.00838 F2070
G1 X70.408 Y78.364 E0.02515
G1 X70.176 Y77.498 E0.04191
G1 X69.852 Y76.287 E0.05867
G1 X69.434 Y74.729 E0.07544
G1 X68.924 Y72.825 E0.0922
G1 X68.321 Y70.574 E0.10896
G1 X68.307 Y70.633 E0.00281
G1 X68.138 Y71.183 E0.02691
G1 X67.685 Y71.678 E0.0314
G1 X68.226 Y73.697 E0.09778
G1 X68.684 Y75.406 E0.08273
G1 X69.058 Y76.804 E0.06769
G1 X69.35 Y77.891 E0.05265
G1 X69.558 Y78.668 E0.03761
G1 X69.683 Y79.134 E0.02256
G1 X69.724 Y79.289 E0.00752
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.3 Y74.227 E0 F3312
G1 X69.3 Y74.227 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X68.04 Y76.479 E0 F9000
G1 X68.04 Y76.479 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X68 Y76.331 E0.00717 F2070
G1 X67.881 Y75.887 E0.0215
G1 X67.683 Y75.147 E0.03584
G1 X67.405 Y74.111 E0.05017
G1 X67.207 Y73.371 E0.03584
G1 X67.088 Y72.927 E0.0215
G1 X67.048 Y72.779 E0.00717
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.04 Y76.479 E0 F3312
G1 X68.04 Y76.479 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X65.285 Y76.63 E0.009 F3312
G1 X65.163 Y76.174 E0.02701
G1 X64.959 Y75.413 E0.045
G1 X64.674 Y74.349 E0.06301
G1 X64.47 Y73.588 E0.04501
G1 X64.348 Y73.132 E0.02701
G1 X64.307 Y72.98 E0.009
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.326 Y76.782 E0 F3312
G1 X65.326 Y76.782 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X69.761 Y68.994 E0 F9000
G1 X69.761 Y68.994 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X69.717 Y68.828 E0.00983 F3312
G1 X69.583 Y68.33 E0.0295
G1 X69.361 Y67.499 E0.04917
G1 X69.05 Y66.336 E0.06882
G1 X69.754 Y66.441 E0.04071
G1 X70.608 Y66.465 E0.04886
G1 X71.46 Y66.447 E0.04873
G1 X72.353 Y66.473 E0.05104
G1 X73.196 Y66.438 E0.04824
G1 X74.09 Y66.481 E0.05116
G1 X74.963 Y66.486 E0.04988
G1 X75.615 Y66.5 E0.0373
G1 X76.041 Y68.092 E0.0942
G1 X76.39 Y69.394 E0.07708
G1 X76.662 Y70.407 E0.05995
G1 X76.856 Y71.131 E0.04284
G1 X76.972 Y71.565 E0.02571
G1 X77.011 Y71.71 E0.00859
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.717 Y66.881 E0 F3312
G1 X75.717 Y66.881 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X77.901 Y75.031 E0 F9000
G1 X77.901 Y75.031 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X77.936 Y75.163 E0.0078 F3312
G1 X78.042 Y75.559 E0.02341
G1 X78.219 Y76.218 E0.03901
G1 X78.466 Y77.14 E0.05461
G1 X78.643 Y77.8 E0.03901
G1 X78.749 Y78.195 E0.02341
G1 X78.784 Y78.327 E0.0078
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.901 Y75.031 E0 F3312
G1 X77.901 Y75.031 Z3.9875 E0 F900
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.398 Y78.835 E0 F9000
G1 X72.398 Y78.835 Z3.4875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.442 Y78.999 E0.00967 F3312
G1 X72.573 Y79.489 E0.02902
G1 X72.923 Y80.796 E0.07738
G1 X73.055 Y81.287 E0.02902
G1 X73.099 Y81.45 E0.00967
; Blending Fan to Cool (94.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.398 Y78.835 E0 F3312
; time estimate: pre = 11.623488, post = 10.842693
; Dwell time remaining = -0.842693
;
; Post-layer lift
G1 X72.398 Y78.835 Z4.2375 E0 F900
; END_LAYER_OBJECT z=3.487
; BEGIN_LAYER_OBJECT z=3.737 z_thickness=0.250
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z4.2375 E0 F9000
G1 X80.987 Y75.246 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X73.569 Y79.304 E0 F9000
G1 X73.569 Y79.304 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X73.718 Y79.264 E0.00725 F2070
G1 X74.168 Y79.144 E0.02176
G1 X75.366 Y78.823 E0.05802
G1 X75.815 Y78.702 E0.02176
G1 X75.965 Y78.662 E0.00726
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X73.569 Y79.304 E0 F3312
G1 X73.569 Y79.304 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X70.293 Y79.25 E0 F9000
G1 X70.293 Y79.25 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X70.468 Y79.203 E0.00849 F2070
G1 X70.994 Y79.062 E0.02546
G1 X71.87 Y78.826 E0.04244
G1 X73.097 Y78.497 E0.05942
G1 X74.675 Y78.073 E0.07639
G1 X76.603 Y77.556 E0.09337
G1 X76.802 Y76.92 E0.03117
G1 X77.238 Y76.457 E0.02972
G1 X77.153 Y76.48 E0.00412
G1 X75.04 Y77.046 E0.10228
G1 X73.253 Y77.525 E0.08655
G1 X71.791 Y77.917 E0.07082
G1 X70.653 Y78.222 E0.05507
G1 X69.841 Y78.44 E0.03934
G1 X69.353 Y78.57 E0.02361
G1 X69.191 Y78.614 E0.00787
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X74.02 Y77.32 E0 F3312
G1 X74.02 Y77.32 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X68.523 Y77.861 E0 F9000
G1 X68.523 Y77.861 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X68.714 Y77.81 E0.00924 F2070
G1 X69.287 Y77.656 E0.02773
G1 X70.241 Y77.4 E0.04622
G1 X71.577 Y77.041 E0.0647
G1 X73.295 Y76.58 E0.08318
G1 X75.394 Y76.017 E0.10167
G1 X77.876 Y75.351 E0.12016
G1 X78.075 Y74.715 E0.03117
G1 X78.511 Y74.253 E0.02972
G1 X78.426 Y74.276 E0.00412
G1 X67.856 Y77.108 E0.51182
G1 X67.623 Y76.239 E0.0421
G1 X78.278 Y73.384 E0.51595
G1 X78.045 Y72.514 E0.04209
G1 X66.955 Y75.486 E0.537
G1 X66.722 Y74.616 E0.04209
G1 X77.377 Y71.761 E0.51595
G1 X77.144 Y70.892 E0.04209
; Prepare for Destring
G1 X66.489 Y73.747 E0.51595
G1 X66.532 Y73.706 E0.00281
G1 X66.925 Y73.285 E0.02691
G1 X67.127 Y72.644 E0.0314
G1 X69.608 Y71.98 E0.12011
G1 X71.707 Y71.417 E0.10164
G1 X73.424 Y70.957 E0.08315
G1 X74.76 Y70.599 E0.06468
G1 X75.714 Y70.344 E0.04619
G1 X76.286 Y70.19 E0.02772
G1 X76.477 Y70.139 E0.00924
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X71.647 Y71.433 E0 F3312
G1 X71.647 Y71.433 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X75.809 Y69.386 E0 F9000
G1 X75.809 Y69.386 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X75.645 Y69.43 E0.00795 F2070
G1 X75.152 Y69.562 E0.02386
G1 X74.331 Y69.782 E0.03976
G1 X73.182 Y70.09 E0.05567
G1 X71.703 Y70.486 E0.07157
G1 X69.897 Y70.97 E0.08747
G1 X67.762 Y71.543 E0.10338
G1 X67.805 Y71.501 E0.00281
G1 X68.198 Y71.08 E0.02691
G1 X68.4 Y70.44 E0.0314
G1 X70.327 Y69.923 E0.09332
G1 X71.904 Y69.501 E0.07635
G1 X73.13 Y69.172 E0.05938
G1 X74.006 Y68.938 E0.04242
G1 X74.532 Y68.797 E0.02545
G1 X74.707 Y68.75 E0.00848
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.877 Y70.044 E0 F3312
G1 X69.877 Y70.044 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X71.431 Y68.696 E0 F9000
G1 X71.431 Y68.696 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X71.282 Y68.736 E0.00725 F2070
G1 X70.832 Y68.856 E0.02176
G1 X69.634 Y69.177 E0.05802
G1 X69.185 Y69.298 E0.02176
G1 X69.035 Y69.338 E0.00725
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X71.431 Y68.696 E0 F3312
G1 X71.431 Y68.696 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X67.315 Y72.594 E0 F9000
G1 X67.315 Y72.594 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X67.184 Y72.629 E0.0078 F3312
G1 X66.788 Y72.735 E0.02341
G1 X66.129 Y72.912 E0.03901
G1 X65.206 Y73.159 E0.05461
G1 X64.547 Y73.336 E0.03901
G1 X64.152 Y73.442 E0.02341
G1 X64.02 Y73.477 E0.0078
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X67.315 Y72.594 E0 F3312
G1 X67.315 Y72.594 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X66.983 Y79.205 E0.00946 F3312
G1 X67.462 Y79.077 E0.02838
G1 X68.741 Y78.734 E0.07569
G1 X69.221 Y78.606 E0.02838
G1 X69.381 Y78.563 E0.00946
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X66.823 Y79.248 E0 F3312
G1 X66.823 Y79.248 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X77.048 Y76.508 E0 F9000
G1 X77.048 Y76.508 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X77.18 Y76.473 E0.0078 F3312
G1 X77.575 Y76.367 E0.02341
G1 X78.235 Y76.19 E0.03901
G1 X79.157 Y75.943 E0.05461
G1 X79.817 Y75.767 E0.03901
G1 X80.212 Y75.661 E0.02341
G1 X80.344 Y75.625 E0.0078
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.048 Y76.508 E0 F3312
G1 X77.048 Y76.508 Z4.2375 E0 F900
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z3.7375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.555 Y69.582 E0.00895 F3312
G1 X78.101 Y69.704 E0.02685
G1 X76.892 Y70.028 E0.07157
G1 X76.438 Y70.149 E0.02685
G1 X76.287 Y70.19 E0.00897
; Blending Fan to Cool (95.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.706 Y69.542 E0 F3312
; time estimate: pre = 11.297942, post = 10.558350
; Dwell time remaining = -0.558349
;
; Post-layer lift
G1 X78.706 Y69.542 Z4.4875 E0 F900
; END_LAYER_OBJECT z=3.737
; BEGIN_LAYER_OBJECT z=3.987 z_thickness=0.250
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z4.4875 E0 F9000
G1 X80.987 Y75.246 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X76.727 Y70.651 E0 F9000
G1 X76.727 Y70.651 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X76.776 Y70.834 E0.00886 F2070
G1 X76.923 Y71.383 E0.02656
G1 X77.167 Y72.297 E0.04428
G1 X77.509 Y73.578 E0.06198
G1 X77.949 Y75.224 E0.0797
G1 X77.498 Y75.715 E0.03117
G1 X77.315 Y76.323 E0.02972
G1 X77.293 Y76.238 E0.00412
G1 X76.757 Y74.241 E0.0967
G1 X76.305 Y72.551 E0.08182
G1 X75.934 Y71.169 E0.06695
G1 X75.646 Y70.093 E0.05207
G1 X75.44 Y69.325 E0.0372
G1 X75.317 Y68.864 E0.02231
G1 X75.276 Y68.711 E0.00744
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.57 Y73.54 E0 F3312
G1 X76.57 Y73.54 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X74.29 Y68.509 E0 F9000
G1 X74.29 Y68.509 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X74.339 Y68.691 E0.00881 F2070
; Prepare for Destring
G1 X74.485 Y69.237 E0.02644
G1 X74.728 Y70.147 E0.04407
G1 X75.069 Y71.422 E0.06169
G1 X75.507 Y73.06 E0.07932
G1 X76.043 Y75.062 E0.09695
G1 X76.676 Y77.429 E0.11457
G1 X76.225 Y77.919 E0.03117
G1 X76.043 Y78.528 E0.02972
G1 X76.02 Y78.443 E0.00412
G1 X75.411 Y76.169 E0.11008
G1 X74.883 Y74.199 E0.09541
G1 X74.436 Y72.532 E0.08073
G1 X74.07 Y71.168 E0.06605
G1 X73.786 Y70.107 E0.05138
G1 X73.583 Y69.349 E0.0367
G1 X73.461 Y68.894 E0.02203
G1 X73.421 Y68.742 E0.00735
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.582 Y73.339 E0 F3312
G1 X75.582 Y73.339 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X72.435 Y68.54 E0 F9000
G1 X72.435 Y68.54 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X72.479 Y68.707 E0.00806 F2070
G1 X72.613 Y69.206 E0.02419
G1 X72.836 Y70.039 E0.04031
G1 X73.148 Y71.204 E0.05643
; Prepare for Destring
G1 X73.55 Y72.703 E0.07255
G1 X74.041 Y74.534 E0.08868
G1 X74.621 Y76.698 E0.1048
G1 X75.29 Y79.196 E0.12093
G1 X74.42 Y79.428 E0.04209
G1 X73.751 Y76.931 E0.12093
G1 X73.171 Y74.767 E0.1048
G1 X72.681 Y72.935 E0.08868
G1 X72.279 Y71.437 E0.07255
G1 X71.967 Y70.272 E0.05643
G1 X71.744 Y69.439 E0.04031
G1 X71.61 Y68.94 E0.02419
G1 X71.565 Y68.773 E0.00806
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X73.729 Y73.37 E0 F3312
G1 X73.729 Y73.37 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X70.58 Y68.572 E0 F9000
G1 X70.58 Y68.572 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X70.624 Y68.738 E0.00806 F2070
G1 X70.758 Y69.237 E0.02419
G1 X70.981 Y70.07 E0.04031
G1 X71.293 Y71.235 E0.05643
; Prepare for Destring
G1 X71.695 Y72.734 E0.07255
G1 X72.186 Y74.565 E0.08868
G1 X72.765 Y76.729 E0.1048
G1 X73.435 Y79.227 E0.12093
G1 X72.565 Y79.46 E0.04209
G1 X71.896 Y76.962 E0.12093
G1 X71.316 Y74.798 E0.1048
G1 X70.825 Y72.967 E0.08868
G1 X70.424 Y71.468 E0.07255
G1 X70.112 Y70.303 E0.05643
G1 X69.889 Y69.47 E0.04031
G1 X69.755 Y68.971 E0.02419
G1 X69.71 Y68.804 E0.00806
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X71.004 Y73.634 E0 F3312
G1 X71.004 Y73.634 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X68.957 Y69.472 E0 F9000
G1 X68.957 Y69.472 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X68.998 Y69.625 E0.0074 F2070
G1 X69.121 Y70.084 E0.02222
G1 X69.326 Y70.848 E0.03702
G1 X69.613 Y71.919 E0.05182
G1 X69.982 Y73.295 E0.06664
G1 X70.432 Y74.977 E0.08144
G1 X70.965 Y76.964 E0.09625
; Prepare for Destring
G1 X71.579 Y79.258 E0.11106
G1 X70.71 Y79.491 E0.0421
G1 X68.321 Y70.574 E0.43175
G1 X68.307 Y70.633 E0.00281
G1 X68.138 Y71.183 E0.02692
G1 X67.685 Y71.678 E0.0314
G1 X68.226 Y73.697 E0.09774
G1 X68.684 Y75.405 E0.08271
G1 X69.058 Y76.803 E0.06769
G1 X69.349 Y77.89 E0.05264
G1 X69.558 Y78.667 E0.03762
G1 X69.683 Y79.133 E0.02258
G1 X69.724 Y79.289 E0.00755
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.43 Y74.46 E0 F3312
G1 X68.43 Y74.46 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X68.273 Y77.349 E0 F9000
G1 X68.273 Y77.349 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X68.224 Y77.166 E0.00885 F2070
G1 X68.077 Y76.618 E0.02656
G1 X67.832 Y75.704 E0.04425
G1 X67.489 Y74.424 E0.06196
G1 X67.244 Y73.51 E0.04426
G1 X67.097 Y72.962 E0.02655
G1 X67.048 Y72.779 E0.00885
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.273 Y77.349 E0 F3312
G1 X68.273 Y77.349 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X65.285 Y76.63 E0.009 F3312
G1 X65.163 Y76.174 E0.02701
G1 X64.959 Y75.413 E0.045
G1 X64.674 Y74.349 E0.06301
G1 X64.47 Y73.588 E0.04501
G1 X64.348 Y73.132 E0.02701
G1 X64.307 Y72.98 E0.009
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.326 Y76.782 E0 F3312
G1 X65.326 Y76.782 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X69.761 Y68.994 E0 F9000
G1 X69.761 Y68.994 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X69.717 Y68.828 E0.00983 F3312
G1 X69.583 Y68.33 E0.0295
G1 X69.361 Y67.499 E0.04916
G1 X69.05 Y66.336 E0.06883
G1 X69.754 Y66.441 E0.04071
G1 X70.608 Y66.465 E0.04886
G1 X71.46 Y66.447 E0.04873
G1 X72.353 Y66.473 E0.05104
G1 X73.196 Y66.438 E0.04824
G1 X74.09 Y66.481 E0.05116
G1 X74.963 Y66.486 E0.04988
G1 X75.615 Y66.5 E0.0373
G1 X76.034 Y68.063 E0.09249
G1 X76.359 Y69.278 E0.07194
G1 X76.592 Y70.147 E0.05138
G1 X76.732 Y70.667 E0.03084
G1 X76.778 Y70.841 E0.01027
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.615 Y66.5 E0 F3312
G1 X75.109 Y66.489 E0
G1 X75.109 Y66.489 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X77.901 Y75.031 E0 F9000
G1 X77.901 Y75.031 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X77.936 Y75.163 E0.0078 F3312
G1 X78.042 Y75.559 E0.02341
G1 X78.219 Y76.218 E0.03901
G1 X78.466 Y77.14 E0.05461
G1 X78.643 Y77.8 E0.03901
G1 X78.749 Y78.195 E0.02341
G1 X78.784 Y78.327 E0.0078
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.901 Y75.031 E0 F3312
G1 X77.901 Y75.031 Z4.4875 E0 F900
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.514 Y79.27 E0 F9000
G1 X72.514 Y79.27 Z3.9875 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.551 Y79.406 E0.00807 F3312
G1 X72.66 Y79.815 E0.02419
G1 X72.953 Y80.905 E0.06452
G1 X73.062 Y81.314 E0.02419
G1 X73.099 Y81.45 E0.00807
; Blending Fan to Cool (94.1% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.514 Y79.27 E0 F3312
; time estimate: pre = 11.760931, post = 10.995336
; Dwell time remaining = -0.995335
;
; Post-layer lift
G1 X72.514 Y79.27 Z4.7375 E0 F900
; END_LAYER_OBJECT z=3.987
; BEGIN_LAYER_OBJECT z=4.238 z_thickness=0.250
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z4.7375 E0 F9000
G1 X80.987 Y75.246 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X73.37 Y79.357 E0 F9000
G1 X73.37 Y79.357 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X73.537 Y79.312 E0.00813 F2760
G1 X74.04 Y79.175 E0.02439
G1 X74.879 Y78.947 E0.04065
G1 X76.053 Y78.627 E0.05691
G1 X76.363 Y78.089 E0.02903
G1 X76.348 Y78.094 E0.00077
G1 X74.765 Y78.518 E0.07665
G1 X73.533 Y78.848 E0.05963
G1 X72.654 Y79.083 E0.04259
G1 X72.126 Y79.225 E0.02557
G1 X71.949 Y79.272 E0.00854
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.348 Y78.094 E0 F3312
G1 X76.363 Y78.089 E0
G1 X76.148 Y78.462 E0
G1 X76.148 Y78.462 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X70.121 Y79.296 E0 F9000
G1 X70.121 Y79.296 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X70.303 Y79.247 E0.00884 F2760
G1 X70.851 Y79.099 E0.02652
G1 X71.763 Y78.853 E0.04419
G1 X73.04 Y78.509 E0.06187
G1 X74.682 Y78.066 E0.07955
G1 X76.689 Y77.525 E0.09723
G1 X77 Y76.987 E0.02904
G1 X76.984 Y76.991 E0.00077
G1 X69.648 Y78.946 E0.35507
G1 X69.111 Y78.635 E0.02903
G1 X69.127 Y78.631 E0.00077
G1 X77.326 Y76.423 E0.39716
G1 X77.636 Y75.885 E0.02904
G1 X77.62 Y75.889 E0.00077
G1 X68.799 Y78.253 E0.42715
G1 X68.683 Y77.818 E0.02104
G1 X77.962 Y75.32 E0.44948
G1 X78.273 Y74.783 E0.02904
G1 X78.257 Y74.787 E0.00076
G1 X68.577 Y77.38 E0.46871
G1 X68.204 Y77.026 E0.02405
G1 X68.207 Y77.014 E0.00059
G1 X78.351 Y74.296 E0.49123
G1 X78.235 Y73.861 E0.02104
G1 X67.899 Y76.631 E0.50051
G1 X67.782 Y76.196 E0.02105
G1 X78.118 Y73.426 E0.50051
G1 X78.002 Y72.992 E0.02104
G1 X67.404 Y75.831 E0.51319
G1 X67.119 Y75.442 E0.02256
G1 X77.881 Y72.558 E0.52109
G1 X77.596 Y72.169 E0.02257
G1 X66.998 Y75.008 E0.51317
G1 X66.882 Y74.574 E0.02105
G1 X77.218 Y71.804 E0.50051
G1 X77.101 Y71.369 E0.02105
G1 X66.765 Y74.139 E0.50051
G1 X66.649 Y73.704 E0.02104
G1 X76.793 Y70.986 E0.4912
G1 X76.796 Y70.974 E0.0006
G1 X76.422 Y70.62 E0.02411
G1 X66.727 Y73.217 E0.46943
G1 X66.735 Y73.204 E0.00073
G1 X67.061 Y72.662 E0.02958
G1 X76.317 Y70.182 E0.4482
G1 X76.201 Y69.747 E0.02105
G1 X67.364 Y72.115 E0.42791
G1 X67.371 Y72.102 E0.00073
G1 X67.698 Y71.56 E0.02958
; Prepare for Destring
G1 X75.889 Y69.365 E0.39665
G1 X75.876 Y69.357 E0.00073
G1 X75.322 Y69.051 E0.02958
G1 X68 Y71.013 E0.35456
G1 X68.008 Y70.999 E0.00072
G1 X68.334 Y70.458 E0.02959
G1 X70.334 Y69.922 E0.09684
G1 X71.97 Y69.483 E0.07923
G1 X73.243 Y69.142 E0.06162
G1 X74.152 Y68.899 E0.04402
G1 X74.697 Y68.752 E0.02641
G1 X74.879 Y68.704 E0.0088
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X70.05 Y69.998 E0 F3312
G1 X70.05 Y69.998 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X73.051 Y68.728 E0 F9000
G1 X73.051 Y68.728 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X72.874 Y68.775 E0.00855 F2760
G1 X72.345 Y68.917 E0.02565
G1 X71.462 Y69.154 E0.04275
G1 X70.226 Y69.485 E0.05985
G1 X68.637 Y69.911 E0.07695
G1 X68.644 Y69.897 E0.00073
G1 X68.97 Y69.355 E0.02956
G1 X70.105 Y69.051 E0.05497
G1 X70.916 Y68.834 E0.03927
G1 X71.403 Y68.704 E0.02356
G1 X71.565 Y68.66 E0.00787
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.97 Y69.355 E0 F3312
G1 X68.644 Y69.897 E0
G1 X68.637 Y69.911 E0
G1 X70.245 Y69.48 E0
G1 X70.245 Y69.48 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.682 Y70.084 E0 F9000
G1 X76.682 Y70.084 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.809 Y70.05 E0.00749 F3312
G1 X77.188 Y69.948 E0.02245
G1 X78.2 Y69.677 E0.05989
G1 X78.58 Y69.576 E0.02246
G1 X78.706 Y69.542 E0.00748
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.682 Y70.084 E0 F3312
G1 X76.682 Y70.084 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X80.344 Y75.625 E0 F9000
G1 X80.344 Y75.625 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X80.183 Y75.668 E0.0095 F3312
G1 X79.702 Y75.797 E0.0285
G1 X78.417 Y76.141 E0.07601
G1 X77.936 Y76.27 E0.02851
G1 X77.775 Y76.314 E0.0095
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X80.344 Y75.625 E0 F3312
G1 X80.344 Y75.625 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X68.652 Y78.758 E0 F9000
G1 X68.652 Y78.758 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X68.538 Y78.789 E0.00677 F3312
G1 X68.195 Y78.88 E0.0203
G1 X67.281 Y79.126 E0.05412
G1 X66.938 Y79.217 E0.0203
G1 X66.823 Y79.248 E0.00678
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.652 Y78.758 E0 F3312
G1 X68.652 Y78.758 Z4.7375 E0 F900
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 97%
; fan %*255
M106 S247
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.02 Y73.477 E0 F9000
G1 X64.02 Y73.477 Z4.2375 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.18 Y73.434 E0.0095 F3312
G1 X64.662 Y73.305 E0.0285
G1 X65.946 Y72.961 E0.07601
G1 X66.428 Y72.832 E0.02851
G1 X66.588 Y72.789 E0.0095
; Blending Fan to Cool (90.6% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X64.02 Y73.477 E0 F3312
; time estimate: pre = 12.810852, post = 11.628983
; Dwell time remaining = -1.628983
;
; Post-layer lift
G1 X64.02 Y73.477 Z5 E0 F900
; END_LAYER_OBJECT z=4.238
; BEGIN_LAYER_OBJECT z=4.500 z_thickness=0.262
;
; 'Loop Path', 1.8 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z5 E0 F9000
G1 X80.987 Y75.246 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.807271, preload 0.000000
G1 X80.908 Y75.381 E0.00769 F2208
G1 X80.673 Y75.788 E0.02305
G1 X80.282 Y76.465 E0.03843
G1 X79.734 Y77.414 E0.0538
G1 X79.029 Y78.633 E0.06918
G1 X78.167 Y80.124 E0.08454
G1 X77.149 Y81.885 E0.09992
G1 X77.073 Y81.972 E0.00567
G1 X67.902 Y81.971 E0.45039
G1 X64.077 Y75.354 E0.37535
G1 X63.297 Y74.003 E0.07662
G1 X63.79 Y73.142 E0.04872
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.39859
G1 X67.927 Y66.028 E0.00567
G1 X77.098 Y66.029 E0.45039
G1 X78.088 Y67.741 E0.09712
G1 X78.925 Y69.189 E0.08218
G1 X79.61 Y70.375 E0.06723
G1 X80.143 Y71.297 E0.0523
G1 X80.524 Y71.955 E0.03735
G1 X80.752 Y72.35 E0.02241
G1 X80.828 Y72.482 E0.00747
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.903636, preload 0.000000
G1 X80.908 Y72.621 E0.00286 F1104
G1 X81.035 Y72.836 E0.01231
G1 X81.263 Y73.223 E0.02201
G1 X81.59 Y73.779 E0.03171
G1 X82.147 Y74.027 E0.02992
G1 X82.171 Y74.047 E0.00153
G1 X82.18 Y74.077 E0.00152
G1 X82.173 Y74.107 E0.00152
G1 X81.526 Y75.225 E0.06343
G1 X80.726 Y76.609 E0.07852
G1 X79.773 Y78.26 E0.09363
G1 X77.403 Y82.36 E0.23255
G1 X77.39 Y82.376 E0.00101
G1 X77.372 Y82.385 E0.00101
G1 X77.248 Y82.425 E0.00638
G1 X72.574 Y82.425 E0.22957
G1 X67.855 Y82.426 E0.23173
G1 X67.663 Y82.427 E0.00942
G1 X67.635 Y82.42 E0.00144
G1 X67.614 Y82.399 E0.00144
G1 X65.574 Y78.855 E0.20083
G1 X63.186 Y74.719 E0.23452
G1 X62.795 Y74.034 E0.03874
G1 X62.787 Y74.008 E0.00135
G1 X62.793 Y73.981 E0.00135
G1 X62.91 Y73.75 E0.01273
G1 X67.597 Y65.64 E0.46
G1 X67.61 Y65.624 E0.00101
G1 X67.628 Y65.615 E0.00101
G1 X67.752 Y65.575 E0.00638
G1 X72.426 Y65.575 E0.22956
G1 X77.145 Y65.574 E0.23173
G1 X77.337 Y65.573 E0.00942
G1 X77.365 Y65.58 E0.00144
G1 X77.386 Y65.601 E0.00145
G1 X79.426 Y69.145 E0.20082
G1 X80.359 Y70.762 E0.09169
G1 X81.155 Y72.141 E0.07817
G1 X81.814 Y73.281 E0.06466
G1 X82.141 Y73.847 E0.03212
G1 X82.148 Y73.883 E0.00178
G1 X82.131 Y73.915 E0.00178
G1 X81.92 Y74.125 E0.01465
G1 X81.605 Y74.208 E0.01595
G1 X81.586 Y74.217 E0.00108
G1 X81.571 Y74.234 E0.00109
G1 X81.22 Y74.842 E0.03448
G1 X81.035 Y75.162 E0.01814
G1 X81.004 Y75.215 E0.00304
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X78.126 Y72.393 E0 F9000
G1 X78.126 Y72.393 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259089, preload 0.000000
; Prepare for Destring
G1 X78.163 Y72.533 E0.00716 F2760
G1 X78.274 Y72.956 E0.02146
G1 X78.459 Y73.661 E0.03577
G1 X78.718 Y74.647 E0.05009
G1 X78.408 Y75.185 E0.03049
G1 X78.404 Y75.169 E0.0008
G1 X78.021 Y73.742 E0.07255
G1 X77.724 Y72.632 E0.05644
G1 X77.512 Y71.839 E0.0403
G1 X77.384 Y71.364 E0.02419
G1 X77.342 Y71.205 E0.00806
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.404 Y75.169 E0 F3312
G1 X78.408 Y75.185 E0
G1 X78.718 Y74.647 E0
G1 X78.652 Y74.396 E0
G1 X78.652 Y74.396 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X76.441 Y69.583 E0 F9000
G1 X76.441 Y69.583 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259089, preload 0.000000
G1 X76.487 Y69.754 E0.0087 F2760
G1 X76.623 Y70.268 E0.02612
G1 X76.851 Y71.124 E0.04352
G1 X77.17 Y72.323 E0.06094
G1 X77.581 Y73.865 E0.07834
G1 X78.082 Y75.749 E0.09576
G1 X77.772 Y76.287 E0.03049
G1 X77.767 Y76.271 E0.0008
G1 X75.683 Y68.492 E0.39552
G1 X75.203 Y68.44 E0.02369
G1 X77.446 Y76.852 E0.4275
G1 X77.135 Y77.389 E0.03049
G1 X77.131 Y77.373 E0.0008
G1 X74.77 Y68.563 E0.44795
G1 X74.277 Y68.417 E0.02525
G1 X74.267 Y68.426 E0.00062
G1 X76.809 Y77.954 E0.4843
G1 X76.499 Y78.492 E0.03049
G1 X76.495 Y78.476 E0.00081
G1 X73.781 Y68.35 E0.5148
G1 X73.347 Y68.467 E0.0221
G1 X76.186 Y79.065 E0.53885
G1 X75.797 Y79.349 E0.02368
G1 X72.915 Y68.594 E0.54683
G1 X72.422 Y68.448 E0.02525
G1 X72.412 Y68.457 E0.00062
G1 X75.364 Y79.471 E0.55999
G1 X74.929 Y79.587 E0.0221
G1 X71.926 Y68.382 E0.56973
G1 X71.492 Y68.498 E0.0221
G1 X74.493 Y79.699 E0.56949
G1 X74.013 Y79.647 E0.02369
G1 X70.987 Y68.353 E0.57425
G1 X70.507 Y68.301 E0.02369
G1 X73.508 Y79.502 E0.56949
G1 X73.074 Y79.618 E0.0221
G1 X70.071 Y68.413 E0.56973
G1 X69.636 Y68.529 E0.0221
G1 X72.591 Y79.555 E0.56061
G1 X72.579 Y79.552 E0.00062
G1 X72.085 Y79.405 E0.02532
G1 X69.203 Y68.65 E0.54678
G1 X68.813 Y68.935 E0.0237
G1 X71.653 Y79.533 E0.53883
G1 X71.219 Y79.65 E0.0221
G1 X68.501 Y69.508 E0.51561
G1 X68.493 Y69.522 E0.00077
G1 X68.187 Y70.075 E0.03106
G1 X70.732 Y79.574 E0.48293
G1 X70.724 Y79.583 E0.00062
G1 X70.23 Y79.436 E0.02532
G1 X67.865 Y70.611 E0.4487
G1 X67.857 Y70.624 E0.00077
G1 X67.551 Y71.178 E0.03106
; Prepare for Destring
G1 X69.797 Y79.56 E0.42617
G1 X69.317 Y79.508 E0.02369
G1 X67.228 Y71.713 E0.39631
G1 X67.221 Y71.726 E0.00076
G1 X66.914 Y72.28 E0.03107
G1 X67.417 Y74.154 E0.09527
G1 X67.827 Y75.687 E0.07796
G1 X68.147 Y76.88 E0.06065
G1 X68.376 Y77.733 E0.04336
G1 X68.513 Y78.245 E0.02605
G1 X68.559 Y78.417 E0.00874
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X67.265 Y73.588 E0 F3312
G1 X67.265 Y73.588 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Solid Path', 2.3 [feed mm/s], 46.0 [head mm/s]
G1 X67.658 Y76.795 E0 F9000
G1 X67.658 Y76.795 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 46.000000, filament speed 2.259089, preload 0.000000
; Prepare for Destring
G1 X67.616 Y76.636 E0.00809 F2760
G1 X67.488 Y76.158 E0.02428
G1 X67.275 Y75.362 E0.04047
G1 X66.976 Y74.248 E0.05666
G1 X66.592 Y72.815 E0.07284
G1 X66.584 Y72.829 E0.00076
G1 X66.278 Y73.382 E0.03104
G1 X66.531 Y74.327 E0.04806
G1 X66.712 Y75.002 E0.03432
G1 X66.821 Y75.407 E0.0206
G1 X66.857 Y75.542 E0.00687
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X66.278 Y73.382 E0 F3312
G1 X66.584 Y72.829 E0
G1 X66.592 Y72.815 E0
G1 X67.14 Y74.859 E0
G1 X67.14 Y74.859 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200005, filament speed 3.313331, preload 0.000000
; Prepare for Destring
G1 X65.285 Y76.63 E0.00945 F3312
G1 X65.163 Y76.174 E0.02836
G1 X64.959 Y75.413 E0.04725
G1 X64.674 Y74.349 E0.06616
G1 X64.47 Y73.588 E0.04726
G1 X64.348 Y73.132 E0.02836
G1 X64.307 Y72.98 E0.00945
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.326 Y76.782 E0 F3312
G1 X65.326 Y76.782 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X69.539 Y68.164 E0 F9000
G1 X69.539 Y68.164 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200005, filament speed 3.313331, preload 0.000000
; Prepare for Destring
G1 X69.508 Y68.05 E0.0071 F3312
G1 X69.416 Y67.707 E0.0213
G1 X69.264 Y67.136 E0.0355
G1 X69.05 Y66.336 E0.04969
G1 X69.754 Y66.441 E0.04275
G1 X70.608 Y66.465 E0.0513
G1 X71.46 Y66.447 E0.05116
G1 X72.353 Y66.473 E0.0536
G1 X73.196 Y66.438 E0.05065
G1 X74.09 Y66.481 E0.05372
G1 X74.963 Y66.486 E0.05237
G1 X75.615 Y66.5 E0.03917
G1 X75.836 Y67.324 E0.0512
G1 X75.993 Y67.913 E0.03658
G1 X76.088 Y68.266 E0.02194
G1 X76.12 Y68.383 E0.00731
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.615 Y66.5 E0 F3312
G1 X74.963 Y66.486 E0
G1 X74.09 Y66.481 E0
G1 X73.196 Y66.438 E0
G1 X72.566 Y66.464 E0
G1 X72.566 Y66.464 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X78.212 Y76.193 E0 F9000
G1 X78.212 Y76.193 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200005, filament speed 3.313331, preload 0.000000
; Prepare for Destring
G1 X78.248 Y76.326 E0.00829 F3312
G1 X78.355 Y76.726 E0.02486
G1 X78.641 Y77.793 E0.06631
G1 X78.748 Y78.194 E0.02486
G1 X78.784 Y78.327 E0.00829
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.212 Y76.193 E0 F3312
G1 X78.212 Y76.193 Z5 E0 F900
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.3 [feed mm/s], 55.2 [head mm/s]
G1 X72.709 Y79.997 E0 F9000
G1 X72.709 Y79.997 Z4.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; under-run speed gain 0.817669
; head speed 45.135315, filament speed 2.709207, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.752 Y80.158 E0.01004 F2708.1
G1 X72.882 Y80.643 E0.0301
G1 X72.926 Y80.804 E0.01003
G1 X73.055 Y81.289 E0.0301
G1 X73.099 Y81.45 E0.01004
; Blending Fan to Cool (87.7% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.709 Y79.997 E0 F3312
; time estimate: pre = 13.704419, post = 12.397610
; Dwell time remaining = -2.397610
;
; Post-layer lift
G1 X72.709 Y79.997 Z5.25 E0 F900
; END_LAYER_OBJECT z=4.500
; BEGIN_LAYER_OBJECT z=4.750 z_thickness=0.250
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z5.25 E0 F9000
G1 X80.987 Y75.246 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X76.254 Y79.05 E0 F9000
G1 X76.254 Y79.05 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X76.081 Y79.097 E0.00838 F2760
G1 X75.562 Y79.236 E0.02513
G1 X74.178 Y79.607 E0.06701
G1 X73.659 Y79.746 E0.02513
G1 X73.486 Y79.792 E0.00838
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.254 Y79.05 E0 F3312
G1 X76.254 Y79.05 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.631 Y79.823 E0 F9000
G1 X71.631 Y79.823 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X71.766 Y79.787 E0.00654 F2760
G1 X72.171 Y79.677 E0.01961
G1 X72.845 Y79.495 E0.03268
G1 X73.79 Y79.24 E0.04575
G1 X75.004 Y78.912 E0.05883
G1 X76.488 Y78.511 E0.0719
G1 X76.798 Y77.973 E0.02904
G1 X76.782 Y77.977 E0.00076
G1 X70.324 Y79.694 E0.31257
G1 X69.394 Y79.491 E0.04453
G1 X69.423 Y79.483 E0.0014
G1 X77.124 Y77.408 E0.37306
G1 X77.435 Y76.871 E0.02903
G1 X77.419 Y76.875 E0.00077
G1 X69.043 Y79.119 E0.40557
G1 X68.66 Y78.756 E0.02466
G1 X68.673 Y78.753 E0.00059
G1 X77.761 Y76.306 E0.44019
G1 X78.071 Y75.768 E0.02904
G1 X78.055 Y75.773 E0.00077
G1 X68.364 Y78.369 E0.46924
G1 X68.248 Y77.935 E0.02105
G1 X78.397 Y75.204 E0.49157
G1 X78.707 Y74.666 E0.02904
G1 X78.691 Y74.67 E0.00077
G1 X67.87 Y77.57 E0.52401
G1 X67.585 Y77.18 E0.02256
G1 X78.786 Y74.179 E0.54237
G1 X78.67 Y73.744 E0.02105
G1 X67.464 Y76.747 E0.5426
G1 X67.347 Y76.312 E0.02105
G1 X78.553 Y73.31 E0.5426
G1 X78.437 Y72.875 E0.02105
G1 X66.969 Y75.948 E0.55528
G1 X66.685 Y75.558 E0.02256
G1 X78.315 Y72.442 E0.56318
G1 X78.031 Y72.052 E0.02257
G1 X66.563 Y75.125 E0.55527
G1 X66.447 Y74.69 E0.02105
G1 X77.653 Y71.688 E0.5426
G1 X77.536 Y71.253 E0.02105
G1 X66.33 Y74.256 E0.5426
G1 X66.214 Y73.821 E0.02105
G1 X77.415 Y70.819 E0.54237
G1 X77.13 Y70.43 E0.02257
G1 X66.293 Y73.334 E0.52477
G1 X66.3 Y73.32 E0.00073
G1 X66.627 Y72.779 E0.02958
G1 X76.752 Y70.065 E0.49029
G1 X76.636 Y69.631 E0.02105
G1 X66.929 Y72.232 E0.47001
G1 X66.937 Y72.218 E0.00073
G1 X67.263 Y71.676 E0.02958
G1 X76.327 Y69.248 E0.43889
G1 X76.33 Y69.235 E0.00059
G1 X75.956 Y68.881 E0.02411
G1 X67.565 Y71.129 E0.4063
G1 X67.573 Y71.116 E0.00072
G1 X67.899 Y70.574 E0.02958
; Prepare for Destring
G1 X75.606 Y68.509 E0.37319
G1 X75.577 Y68.503 E0.00138
G1 X74.618 Y68.308 E0.04578
G1 X68.202 Y70.027 E0.31069
G1 X68.21 Y70.014 E0.00073
G1 X68.536 Y69.472 E0.02959
G1 X70.274 Y69.006 E0.08418
G1 X71.627 Y68.643 E0.06549
G1 X72.594 Y68.384 E0.04681
G1 X73.174 Y68.229 E0.02812
G1 X73.369 Y68.177 E0.00943
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.539 Y69.471 E0 F3312
G1 X68.539 Y69.471 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.514 Y68.208 E0 F9000
G1 X71.514 Y68.208 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X71.345 Y68.253 E0.00818 F2760
G1 X70.838 Y68.389 E0.02454
G1 X69.487 Y68.751 E0.06543
G1 X68.98 Y68.887 E0.02454
G1 X68.811 Y68.932 E0.00818
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X71.514 Y68.208 E0 F3312
G1 X71.514 Y68.208 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X66.154 Y72.905 E0 F9000
G1 X66.154 Y72.905 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X66.02 Y72.941 E0.00789 F3312
G1 X65.62 Y73.048 E0.02368
G1 X64.553 Y73.334 E0.06315
G1 X64.153 Y73.441 E0.02368
G1 X64.02 Y73.477 E0.0079
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X66.154 Y72.905 E0 F3312
G1 X66.154 Y72.905 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; under-run speed gain 0.785417
; head speed 43.355007, filament speed 2.478426, preload 0.000000
; Prepare for Destring
G1 X66.978 Y79.207 E0.00918 F2601.3
G1 X67.443 Y79.082 E0.02754
G1 X67.599 Y79.04 E0.00918
G1 X68.064 Y78.916 E0.02754
G1 X68.219 Y78.874 E0.00917
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X66.823 Y79.248 E0 F3312
G1 X66.823 Y79.248 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.21 Y76.197 E0 F9000
G1 X78.21 Y76.197 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.343 Y76.161 E0.00789 F3312
G1 X78.743 Y76.054 E0.02368
G1 X79.81 Y75.768 E0.06315
G1 X80.21 Y75.661 E0.02368
G1 X80.344 Y75.625 E0.0079
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.21 Y76.197 E0 F3312
G1 X78.21 Y76.197 Z5.25 E0 F900
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 96%
; fan %*255
M106 S245
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z4.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; under-run speed gain 0.882465
; head speed 48.712090, filament speed 2.784668, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.532 Y69.588 E0.01031 F2922.7
G1 X78.009 Y69.729 E0.03094
G1 X77.835 Y69.775 E0.01032
G1 X77.312 Y69.915 E0.03094
G1 X77.138 Y69.962 E0.01031
; Blending Fan to Cool (88.5% blend)
; Blended Fan at 100%
; fan %*255
M106 S255
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.706 Y69.542 E0 F3312
; time estimate: pre = 13.451810, post = 12.273002
; Dwell time remaining = -2.273002
;
; Post-layer lift
G1 X78.706 Y69.542 Z5.5 E0 F900
; END_LAYER_OBJECT z=4.750
; BEGIN_LAYER_OBJECT z=5.000 z_thickness=0.250
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z5.5 E0 F9000
G1 X80.987 Y75.246 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X78.009 Y71.958 E0 F9000
G1 X78.009 Y71.958 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X78.054 Y72.126 E0.00813 F2760
G1 X78.186 Y72.63 E0.02439
G1 X78.408 Y73.471 E0.04065
G1 X78.718 Y74.647 E0.05691
G1 X78.408 Y75.185 E0.02903
G1 X78.404 Y75.169 E0.00077
G1 X78.008 Y73.692 E0.0715
G1 X77.684 Y72.484 E0.05851
G1 X77.432 Y71.544 E0.0455
G1 X77.253 Y70.873 E0.03251
G1 X77.145 Y70.47 E0.01951
G1 X77.109 Y70.336 E0.0065
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.403 Y75.165 E0 F3312
G1 X78.403 Y75.165 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X76.215 Y68.74 E0 F9000
G1 X76.215 Y68.74 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X76.253 Y68.883 E0.00692 F2760
G1 X76.368 Y69.312 E0.02077
G1 X76.558 Y70.028 E0.03462
G1 X76.825 Y71.029 E0.04847
G1 X77.168 Y72.316 E0.06231
G1 X77.587 Y73.89 E0.07616
G1 X78.082 Y75.749 E0.09
G1 X77.772 Y76.287 E0.02904
G1 X77.767 Y76.271 E0.00077
G1 X75.675 Y68.507 E0.37611
G1 X75.138 Y68.196 E0.02904
G1 X75.142 Y68.212 E0.00077
G1 X77.446 Y76.852 E0.41821
G1 X77.135 Y77.389 E0.02903
G1 X77.131 Y77.373 E0.00077
G1 X74.651 Y68.117 E0.4482
G1 X74.216 Y68.234 E0.02104
G1 X76.809 Y77.954 E0.47053
G1 X76.499 Y78.492 E0.02903
G1 X76.495 Y78.476 E0.00077
G1 X73.784 Y68.361 E0.48976
G1 X73.291 Y68.215 E0.02404
G1 X73.282 Y68.224 E0.00059
G1 X76.186 Y79.065 E0.52495
G1 X75.797 Y79.349 E0.02257
G1 X72.796 Y68.149 E0.54237
G1 X72.361 Y68.265 E0.02104
G1 X75.364 Y79.471 E0.54261
G1 X74.929 Y79.587 E0.02104
G1 X71.929 Y68.393 E0.54208
G1 X71.436 Y68.247 E0.02404
G1 X71.427 Y68.255 E0.00059
G1 X74.494 Y79.704 E0.55437
G1 X74.06 Y79.82 E0.02105
G1 X70.94 Y68.18 E0.56365
G1 X70.506 Y68.296 E0.02104
G1 X73.577 Y79.757 E0.55496
G1 X73.565 Y79.754 E0.00059
G1 X73.071 Y79.607 E0.02412
G1 X70.071 Y68.413 E0.54202
G1 X69.636 Y68.529 E0.02105
G1 X72.639 Y79.735 E0.5426
G1 X72.204 Y79.851 E0.02105
G1 X69.203 Y68.65 E0.54237
G1 X68.814 Y68.935 E0.02257
G1 X71.722 Y79.788 E0.52553
G1 X71.71 Y79.785 E0.00059
G1 X71.215 Y79.638 E0.02411
G1 X68.501 Y69.508 E0.49049
G1 X68.493 Y69.522 E0.00072
G1 X68.187 Y70.075 E0.02959
G1 X70.784 Y79.766 E0.46924
G1 X70.349 Y79.883 E0.02105
G1 X67.865 Y70.611 E0.44896
G1 X67.857 Y70.624 E0.00073
G1 X67.551 Y71.178 E0.02958
; Prepare for Destring
G1 X69.862 Y79.804 E0.4177
G1 X69.849 Y79.796 E0.00073
G1 X69.307 Y79.47 E0.02958
G1 X67.228 Y71.713 E0.3756
G1 X67.221 Y71.726 E0.00073
G1 X66.914 Y72.28 E0.02958
G1 X67.411 Y74.132 E0.08967
G1 X67.831 Y75.699 E0.07587
G1 X68.174 Y76.981 E0.06208
G1 X68.441 Y77.978 E0.04828
G1 X68.632 Y78.69 E0.03449
G1 X68.747 Y79.117 E0.02069
G1 X68.785 Y79.26 E0.0069
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X67.491 Y74.43 E0 F3312
G1 X67.491 Y74.43 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X67.891 Y77.664 E0 F9000
G1 X67.891 Y77.664 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X67.855 Y77.53 E0.00652 F2760
G1 X67.747 Y77.126 E0.01957
G1 X67.567 Y76.452 E0.03261
G1 X67.314 Y75.509 E0.04565
G1 X66.989 Y74.297 E0.0587
G1 X66.592 Y72.815 E0.07175
G1 X66.584 Y72.829 E0.00072
G1 X66.278 Y73.382 E0.02957
G1 X66.582 Y74.517 E0.05495
G1 X66.799 Y75.327 E0.03926
G1 X66.93 Y75.814 E0.02358
G1 X66.973 Y75.977 E0.00787
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X66.278 Y73.382 E0 F3312
G1 X66.584 Y72.829 E0
G1 X66.592 Y72.815 E0
G1 X67.023 Y74.424 E0
G1 X67.023 Y74.424 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X65.326 Y76.782 E0 F9000
G1 X65.326 Y76.782 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X65.285 Y76.63 E0.009 F3312
G1 X65.163 Y76.174 E0.02701
G1 X64.959 Y75.413 E0.045
G1 X64.674 Y74.349 E0.06301
G1 X64.47 Y73.588 E0.04501
G1 X64.348 Y73.132 E0.02701
G1 X64.307 Y72.98 E0.009
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.326 Y76.782 E0 F3312
G1 X65.326 Y76.782 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X69.539 Y68.164 E0 F9000
G1 X69.539 Y68.164 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X69.508 Y68.05 E0.00676 F3312
G1 X69.416 Y67.707 E0.02029
G1 X69.264 Y67.136 E0.03381
G1 X69.05 Y66.336 E0.04733
G1 X69.754 Y66.441 E0.0407
G1 X70.608 Y66.465 E0.04886
G1 X71.46 Y66.447 E0.04873
G1 X72.353 Y66.473 E0.05104
G1 X73.196 Y66.438 E0.04825
G1 X74.09 Y66.481 E0.05115
G1 X74.963 Y66.486 E0.04989
G1 X75.615 Y66.5 E0.03729
G1 X75.835 Y67.32 E0.04855
G1 X75.992 Y67.906 E0.03468
G1 X76.086 Y68.258 E0.02082
G1 X76.118 Y68.375 E0.00695
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.615 Y66.5 E0 F3312
G1 X74.963 Y66.486 E0
G1 X74.09 Y66.481 E0
G1 X73.196 Y66.438 E0
G1 X72.558 Y66.464 E0
G1 X72.558 Y66.464 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.212 Y76.193 E0 F9000
G1 X78.212 Y76.193 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.248 Y76.326 E0.00789 F3312
G1 X78.355 Y76.726 E0.02368
G1 X78.641 Y77.793 E0.06315
G1 X78.748 Y78.194 E0.02368
G1 X78.784 Y78.327 E0.00789
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.212 Y76.193 E0 F3312
G1 X78.212 Y76.193 Z5.5 E0 F900
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.737 Y80.1 E0 F9000
G1 X72.737 Y80.1 Z5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; under-run speed gain 0.759613
; head speed 41.930622, filament speed 2.397000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.777 Y80.25 E0.00888 F2515.8
G1 X72.898 Y80.7 E0.02663
G1 X72.938 Y80.85 E0.00887
G1 X73.058 Y81.3 E0.02663
G1 X73.099 Y81.45 E0.00889
; Blending Fan to Cool (87.1% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.737 Y80.1 E0 F3312
; time estimate: pre = 13.881326, post = 12.607647
; Dwell time remaining = -2.607647
;
; Post-layer lift
G1 X72.737 Y80.1 Z5.75 E0 F900
; END_LAYER_OBJECT z=5.000
; BEGIN_LAYER_OBJECT z=5.250 z_thickness=0.250
; *** Estimate 9.638058 [s], Slowing (0.954x) to 10.0 [s] ***
; fan %*255
M106 S255
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X80.987 Y75.246 Z5.75 E0 F9000
G1 X80.987 Y75.246 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2106.4
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1053.2
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3159.6
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z5.75 E0 F900
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2106.4
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1053.2
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3159.6
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X77.328 Y76.433 E0 F9000
G1 X77.328 Y76.433 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X77.516 Y76.383 E0.01116 F3159.6
G1 X78.082 Y76.231 E0.03346
G1 X79.59 Y75.827 E0.08925
G1 X80.155 Y75.676 E0.03347
G1 X80.344 Y75.625 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.328 Y76.433 E0 F3159.6
G1 X77.328 Y76.433 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X78.57 Y69.578 E0.00808 F3159.6
G1 X78.16 Y69.688 E0.02422
G1 X77.069 Y69.98 E0.06458
G1 X76.66 Y70.09 E0.02424
G1 X76.523 Y70.127 E0.00809
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X78.706 Y69.542 E0 F3159.6
G1 X78.706 Y69.542 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X67.036 Y72.669 E0 F9000
G1 X67.036 Y72.669 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X66.847 Y72.719 E0.01116 F3159.6
G1 X66.282 Y72.871 E0.03346
G1 X64.774 Y73.275 E0.08925
G1 X64.208 Y73.427 E0.03347
G1 X64.02 Y73.477 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X67.036 Y72.669 E0 F3159.6
G1 X67.036 Y72.669 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.947 Y79.215 E0.00733 F3159.6
G1 X67.318 Y79.115 E0.02199
G1 X68.309 Y78.85 E0.05864
G1 X68.681 Y78.75 E0.02199
G1 X68.805 Y78.717 E0.00733
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.823 Y79.248 E0 F3159.6
G1 X66.823 Y79.248 Z5.75 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 5.748863 [s], Slowing (0.493x) to 10.0 [s] ***
;
; 'Loop Path', 0.8 [feed mm/s], 18.1 [head mm/s]
G1 X75.962 Y75.285 Z5.75 E0 F9000
G1 X75.962 Y75.285 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 18.142401, filament speed 0.848558, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F1088.5
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 9.1 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 9.071200, filament speed 0.424279, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F544.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1632.8
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X74.288 Y77.248 E0 F9000
G1 X74.288 Y77.248 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for Destring
G1 X74.368 Y77.11 E0.00744 F1360.7
G1 X74.606 Y76.697 E0.0223
G1 X74.59 Y76.701 E0.00077
G1 X73.699 Y76.94 E0.04316
G1 X73.062 Y77.111 E0.03084
G1 X72.68 Y77.213 E0.0185
G1 X72.552 Y77.247 E0.00617
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X74.59 Y76.701 E0 F1632.8
G1 X74.606 Y76.697 E0
G1 X74.288 Y77.248 E0
G1 X74.288 Y77.248 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X70.815 Y77.247 E0 F9000
G1 X70.815 Y77.247 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
G1 X70.98 Y77.202 E0.008 F1360.7
G1 X71.475 Y77.068 E0.02399
G1 X72.3 Y76.845 E0.03998
G1 X73.456 Y76.532 E0.05598
G1 X74.941 Y76.13 E0.07197
G1 X75.251 Y75.592 E0.02904
G1 X75.235 Y75.596 E0.00077
G1 X73.833 Y75.972 E0.06789
G1 X72.25 Y76.396 E0.07667
G1 X70.485 Y76.869 E0.08544
G1 X70.253 Y76.466 E0.02178
G1 X75.577 Y75.028 E0.25795
G1 X75.888 Y74.49 E0.02903
G1 X75.872 Y74.494 E0.00077
G1 X70.02 Y76.062 E0.28334
G1 X69.786 Y75.659 E0.02181
G1 X76.146 Y73.955 E0.30796
G1 X75.912 Y73.552 E0.02181
G1 X69.554 Y75.255 E0.30785
G1 X69.322 Y74.852 E0.02178
G1 X75.678 Y73.148 E0.30781
G1 X75.446 Y72.745 E0.02178
G1 X69.088 Y74.448 E0.30785
G1 X68.854 Y74.045 E0.02181
G1 X75.214 Y72.341 E0.30797
G1 X74.98 Y71.938 E0.02181
; Prepare for Destring
G1 X69.112 Y73.51 E0.2841
G1 X69.12 Y73.497 E0.00073
G1 X69.446 Y72.955 E0.02958
G1 X74.747 Y71.534 E0.25666
G1 X74.514 Y71.131 E0.02179
G1 X72.743 Y71.605 E0.08577
G1 X71.155 Y72.031 E0.07692
G1 X69.749 Y72.408 E0.06807
G1 X69.756 Y72.394 E0.00073
G1 X70.083 Y71.852 E0.02959
G1 X71.56 Y71.457 E0.07151
G1 X72.708 Y71.149 E0.05562
G1 X73.529 Y70.929 E0.03972
G1 X74.021 Y70.797 E0.02384
G1 X74.185 Y70.753 E0.00795
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X70.083 Y71.852 E0 F1632.8
G1 X69.756 Y72.394 E0
G1 X69.749 Y72.408 E0
G1 X69.85 Y72.381 E0
G1 X69.85 Y72.381 Z5.75 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X72.448 Y70.753 E0 F9000
G1 X72.448 Y70.753 Z5.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.319 Y70.787 E0.00621 F1360.7
G1 X71.934 Y70.89 E0.01865
G1 X71.293 Y71.062 E0.03107
G1 X70.394 Y71.303 E0.0435
G1 X70.401 Y71.291 E0.00068
G1 X70.62 Y70.891 E0.02132
G1 X70.693 Y70.757 E0.00711
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.401 Y71.291 E0 F1632.8
G1 X70.394 Y71.303 E0
G1 X72.448 Y70.753 E0
; time estimate: pre = 9.986054, post = 18.969128
; Dwell time remaining = -8.969128
;
; Post-layer lift
G1 X72.448 Y70.753 Z6 E0 F900
; END_LAYER_OBJECT z=5.250
; BEGIN_LAYER_OBJECT z=5.500 z_thickness=0.250
; *** Estimate 5.331194 [s], Slowing (0.454x) to 10.0 [s] ***
;
; 'Loop Path', 0.8 [feed mm/s], 16.7 [head mm/s]
G1 X75.962 Y75.285 Z6 E0 F9000
G1 X75.962 Y75.285 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 16.707203, filament speed 0.781430, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F1002.4
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 25.1 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 25.060802, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1503.6
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z6 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.0 [feed mm/s], 20.9 [head mm/s]
G1 X69.662 Y75.578 E0 F9000
G1 X69.662 Y75.578 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.884001, filament speed 0.976788, preload 0.000000
G1 X69.628 Y75.448 E0.00627 F1253
G1 X69.526 Y75.059 E0.01883
G1 X69.355 Y74.41 E0.03137
G1 X69.117 Y73.502 E0.04392
G1 X69.427 Y72.965 E0.02904
G1 X69.431 Y72.98 E0.00075
G1 X69.737 Y74.121 E0.05523
G1 X70.097 Y75.462 E0.06497
G1 X70.511 Y77.005 E0.07471
G1 X71.02 Y77.169 E0.02502
G1 X71.017 Y77.157 E0.00059
G1 X69.753 Y72.4 E0.2302
G1 X70.064 Y71.862 E0.02904
G1 X70.068 Y71.878 E0.00077
G1 X71.488 Y77.179 E0.25666
G1 X71.954 Y77.178 E0.02179
G1 X70.38 Y71.302 E0.28455
G1 X70.72 Y70.836 E0.02698
G1 X70.724 Y70.848 E0.00059
G1 X72.42 Y77.18 E0.3066
G1 X72.886 Y77.179 E0.02177
G1 X71.182 Y70.821 E0.30785
G1 X71.648 Y70.822 E0.0218
G1 X73.352 Y77.178 E0.3078
G1 X73.818 Y77.179 E0.0218
G1 X72.114 Y70.821 E0.30785
G1 X72.58 Y70.82 E0.02177
G1 X74.28 Y77.164 E0.30719
G1 X74.287 Y77.154 E0.00059
G1 X74.62 Y76.696 E0.02649
; Prepare for End-Of-Layer
G1 X73.046 Y70.822 E0.28445
G1 X73.512 Y70.821 E0.02179
G1 X74.936 Y76.138 E0.25742
G1 X74.944 Y76.124 E0.00073
G1 X75.25 Y75.571 E0.02959
G1 X73.984 Y70.844 E0.22887
G1 X73.992 Y70.835 E0.00059
G1 X74.49 Y70.996 E0.02447
G1 X74.905 Y72.545 E0.07504
G1 X75.266 Y73.892 E0.06521
G1 X75.573 Y75.035 E0.05537
G1 X75.58 Y75.022 E0.00073
G1 X75.887 Y74.468 E0.02959
G1 X75.647 Y73.573 E0.04335
G1 X75.475 Y72.933 E0.03097
G1 X75.373 Y72.55 E0.01859
G1 X75.338 Y72.422 E0.00619
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 25.1 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 25.060802, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.887 Y74.468 E0 F1503.6
G1 X75.58 Y75.022 E0
G1 X75.573 Y75.035 E0
G1 X74.995 Y72.879 E0
G1 X74.995 Y72.879 Z6 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z6 E0 F9000
G1 X80.987 Y75.246 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z6 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z6 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.734 Y78.138 E0.01116 F3312
G1 X78.582 Y77.573 E0.03346
G1 X78.178 Y76.065 E0.08925
G1 X78.026 Y75.499 E0.03347
G1 X77.976 Y75.311 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.784 Y78.327 E0 F3312
G1 X78.784 Y78.327 Z6 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.677 Y70.462 E0 F9000
G1 X76.677 Y70.462 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.634 Y70.304 E0.00938 F3312
G1 X76.507 Y69.828 E0.02814
G1 X76.294 Y69.036 E0.0469
G1 X75.997 Y67.926 E0.06565
G1 X75.615 Y66.5 E0.08442
G1 X74.506 Y66.472 E0.06342
G1 X73.649 Y66.496 E0.04902
G1 X72.821 Y66.425 E0.04749
G1 X71.877 Y66.495 E0.05411
G1 X71.081 Y66.423 E0.04569
G1 X70.15 Y66.476 E0.05328
G1 X69.139 Y66.341 E0.05835
G1 X69.079 Y66.448 E0.00699
G1 X69.341 Y67.426 E0.05788
G1 X69.528 Y68.125 E0.04135
G1 X69.64 Y68.544 E0.02482
G1 X69.678 Y68.684 E0.00829
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.079 Y66.448 E0 F3312
G1 X69.139 Y66.341 E0
G1 X70.15 Y66.476 E0
G1 X71.081 Y66.423 E0
G1 X71.688 Y66.478 E0
G1 X71.688 Y66.478 Z6 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.307 Y72.98 E0 F9000
G1 X64.307 Y72.98 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X64.348 Y73.132 E0.009 F3312
G1 X64.47 Y73.588 E0.02701
G1 X64.674 Y74.349 E0.045
G1 X64.959 Y75.413 E0.06301
G1 X65.163 Y76.174 E0.04501
G1 X65.285 Y76.63 E0.02701
G1 X65.326 Y76.782 E0.009
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.307 Y72.98 E0 F3312
G1 X64.307 Y72.98 Z6 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.567 Y79.465 E0 F9000
G1 X72.567 Y79.465 Z5.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.6 Y79.589 E0.00734 F3312
G1 X72.7 Y79.961 E0.02203
G1 X72.966 Y80.954 E0.05875
G1 X73.065 Y81.326 E0.02203
G1 X73.099 Y81.45 E0.00734
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.567 Y79.465 E0 F3312
; time estimate: pre = 10.023659, post = 18.961407
; Dwell time remaining = -8.961407
;
; Post-layer lift
G1 X72.567 Y79.465 Z6.25 E0 F900
; END_LAYER_OBJECT z=5.500
; BEGIN_LAYER_OBJECT z=5.750 z_thickness=0.250
; *** Estimate 9.638058 [s], Slowing (0.954x) to 10.0 [s] ***
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X80.987 Y75.246 Z6.25 E0 F9000
G1 X80.987 Y75.246 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2106.4
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1053.2
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3159.6
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z6.25 E0 F900
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2106.4
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1053.2
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3159.6
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X77.328 Y76.433 E0 F9000
G1 X77.328 Y76.433 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X77.516 Y76.383 E0.01116 F3159.6
G1 X78.082 Y76.231 E0.03346
G1 X79.59 Y75.827 E0.08925
G1 X80.155 Y75.676 E0.03347
G1 X80.344 Y75.625 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.328 Y76.433 E0 F3159.6
G1 X77.328 Y76.433 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X78.57 Y69.578 E0.00808 F3159.6
G1 X78.16 Y69.688 E0.02422
G1 X77.069 Y69.98 E0.06458
G1 X76.66 Y70.09 E0.02424
G1 X76.523 Y70.127 E0.00809
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X78.706 Y69.542 E0 F3159.6
G1 X78.706 Y69.542 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X67.036 Y72.669 E0 F9000
G1 X67.036 Y72.669 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X66.847 Y72.719 E0.01116 F3159.6
G1 X66.282 Y72.871 E0.03346
G1 X64.774 Y73.275 E0.08925
G1 X64.208 Y73.427 E0.03347
G1 X64.02 Y73.477 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X67.036 Y72.669 E0 F3159.6
G1 X67.036 Y72.669 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.947 Y79.215 E0.00733 F3159.6
G1 X67.318 Y79.115 E0.02199
G1 X68.309 Y78.85 E0.05864
G1 X68.681 Y78.75 E0.02199
G1 X68.805 Y78.717 E0.00733
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.823 Y79.248 E0 F3159.6
G1 X66.823 Y79.248 Z6.25 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 5.748863 [s], Slowing (0.493x) to 10.0 [s] ***
;
; 'Loop Path', 0.8 [feed mm/s], 18.1 [head mm/s]
G1 X75.962 Y75.285 Z6.25 E0 F9000
G1 X75.962 Y75.285 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 18.142401, filament speed 0.848558, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F1088.5
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 9.1 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 9.071200, filament speed 0.424279, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F544.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1632.8
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X74.288 Y77.248 E0 F9000
G1 X74.288 Y77.248 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for Destring
G1 X74.368 Y77.11 E0.00744 F1360.7
G1 X74.606 Y76.697 E0.0223
G1 X74.59 Y76.701 E0.00077
G1 X73.699 Y76.94 E0.04316
G1 X73.062 Y77.111 E0.03084
G1 X72.68 Y77.213 E0.0185
G1 X72.552 Y77.247 E0.00617
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X74.59 Y76.701 E0 F1632.8
G1 X74.606 Y76.697 E0
G1 X74.288 Y77.248 E0
G1 X74.288 Y77.248 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X70.815 Y77.247 E0 F9000
G1 X70.815 Y77.247 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
G1 X70.98 Y77.202 E0.008 F1360.7
G1 X71.475 Y77.068 E0.02399
G1 X72.3 Y76.845 E0.03998
G1 X73.456 Y76.532 E0.05598
G1 X74.941 Y76.13 E0.07197
G1 X75.251 Y75.592 E0.02904
G1 X75.235 Y75.596 E0.00077
G1 X73.833 Y75.972 E0.06789
G1 X72.25 Y76.396 E0.07667
G1 X70.485 Y76.869 E0.08544
G1 X70.253 Y76.466 E0.02178
G1 X75.577 Y75.028 E0.25795
G1 X75.888 Y74.49 E0.02903
G1 X75.872 Y74.494 E0.00077
G1 X70.02 Y76.062 E0.28334
G1 X69.786 Y75.659 E0.02181
G1 X76.146 Y73.955 E0.30796
G1 X75.912 Y73.552 E0.02181
G1 X69.554 Y75.255 E0.30785
G1 X69.322 Y74.852 E0.02178
G1 X75.678 Y73.148 E0.30781
G1 X75.446 Y72.745 E0.02178
G1 X69.088 Y74.448 E0.30785
G1 X68.854 Y74.045 E0.02181
G1 X75.214 Y72.341 E0.30797
G1 X74.98 Y71.938 E0.02181
; Prepare for Destring
G1 X69.112 Y73.51 E0.2841
G1 X69.12 Y73.497 E0.00073
G1 X69.446 Y72.955 E0.02958
G1 X74.747 Y71.534 E0.25666
G1 X74.514 Y71.131 E0.02179
G1 X72.743 Y71.605 E0.08577
G1 X71.155 Y72.031 E0.07692
G1 X69.749 Y72.408 E0.06807
G1 X69.756 Y72.394 E0.00073
G1 X70.083 Y71.852 E0.02959
G1 X71.56 Y71.457 E0.07151
G1 X72.708 Y71.149 E0.05562
G1 X73.529 Y70.929 E0.03972
G1 X74.021 Y70.797 E0.02384
G1 X74.185 Y70.753 E0.00795
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X70.083 Y71.852 E0 F1632.8
G1 X69.756 Y72.394 E0
G1 X69.749 Y72.408 E0
G1 X69.85 Y72.381 E0
G1 X69.85 Y72.381 Z6.25 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X72.448 Y70.753 E0 F9000
G1 X72.448 Y70.753 Z5.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.319 Y70.787 E0.00621 F1360.7
G1 X71.934 Y70.89 E0.01865
G1 X71.293 Y71.062 E0.03107
G1 X70.394 Y71.303 E0.0435
G1 X70.401 Y71.291 E0.00068
G1 X70.62 Y70.891 E0.02132
G1 X70.693 Y70.757 E0.00711
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.401 Y71.291 E0 F1632.8
G1 X70.394 Y71.303 E0
G1 X72.448 Y70.753 E0
; time estimate: pre = 9.986054, post = 18.969128
; Dwell time remaining = -8.969128
;
; Post-layer lift
G1 X72.448 Y70.753 Z6.5 E0 F900
; END_LAYER_OBJECT z=5.750
; BEGIN_LAYER_OBJECT z=6.000 z_thickness=0.250
; *** Estimate 5.331194 [s], Slowing (0.454x) to 10.0 [s] ***
;
; 'Loop Path', 0.8 [feed mm/s], 16.7 [head mm/s]
G1 X75.962 Y75.285 Z6.5 E0 F9000
G1 X75.962 Y75.285 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 16.707203, filament speed 0.781430, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F1002.4
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 25.1 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 25.060802, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1503.6
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z6.5 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.0 [feed mm/s], 20.9 [head mm/s]
G1 X69.662 Y75.578 E0 F9000
G1 X69.662 Y75.578 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.884001, filament speed 0.976788, preload 0.000000
G1 X69.628 Y75.448 E0.00627 F1253
G1 X69.526 Y75.059 E0.01883
G1 X69.355 Y74.41 E0.03137
G1 X69.117 Y73.502 E0.04392
G1 X69.427 Y72.965 E0.02904
G1 X69.431 Y72.98 E0.00075
G1 X69.737 Y74.121 E0.05523
G1 X70.097 Y75.462 E0.06497
G1 X70.511 Y77.005 E0.07471
G1 X71.02 Y77.169 E0.02502
G1 X71.017 Y77.157 E0.00059
G1 X69.753 Y72.4 E0.2302
G1 X70.064 Y71.862 E0.02904
G1 X70.068 Y71.878 E0.00077
G1 X71.488 Y77.179 E0.25666
G1 X71.954 Y77.178 E0.02179
G1 X70.38 Y71.302 E0.28455
G1 X70.72 Y70.836 E0.02698
G1 X70.724 Y70.848 E0.00059
G1 X72.42 Y77.18 E0.3066
G1 X72.886 Y77.179 E0.02177
G1 X71.182 Y70.821 E0.30785
G1 X71.648 Y70.822 E0.0218
G1 X73.352 Y77.178 E0.3078
G1 X73.818 Y77.179 E0.0218
G1 X72.114 Y70.821 E0.30785
G1 X72.58 Y70.82 E0.02177
G1 X74.28 Y77.164 E0.30719
G1 X74.287 Y77.154 E0.00059
G1 X74.62 Y76.696 E0.02649
; Prepare for End-Of-Layer
G1 X73.046 Y70.822 E0.28445
G1 X73.512 Y70.821 E0.02179
G1 X74.936 Y76.138 E0.25742
G1 X74.944 Y76.124 E0.00073
G1 X75.25 Y75.571 E0.02959
G1 X73.984 Y70.844 E0.22887
G1 X73.992 Y70.835 E0.00059
G1 X74.49 Y70.996 E0.02447
G1 X74.905 Y72.545 E0.07504
G1 X75.266 Y73.892 E0.06521
G1 X75.573 Y75.035 E0.05537
G1 X75.58 Y75.022 E0.00073
G1 X75.887 Y74.468 E0.02959
G1 X75.647 Y73.573 E0.04335
G1 X75.475 Y72.933 E0.03097
G1 X75.373 Y72.55 E0.01859
G1 X75.338 Y72.422 E0.00619
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 25.1 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 25.060802, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.887 Y74.468 E0 F1503.6
G1 X75.58 Y75.022 E0
G1 X75.573 Y75.035 E0
G1 X74.995 Y72.879 E0
G1 X74.995 Y72.879 Z6.5 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z6.5 E0 F9000
G1 X80.987 Y75.246 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.077 Y75.354 E0.35748
G1 X63.297 Y74.003 E0.07296
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z6.5 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z6.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.734 Y78.138 E0.01116 F3312
G1 X78.582 Y77.573 E0.03346
G1 X78.178 Y76.065 E0.08925
G1 X78.026 Y75.499 E0.03347
G1 X77.976 Y75.311 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.784 Y78.327 E0 F3312
G1 X78.784 Y78.327 Z6.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.677 Y70.462 E0 F9000
G1 X76.677 Y70.462 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.634 Y70.304 E0.00938 F3312
G1 X76.507 Y69.828 E0.02814
G1 X76.294 Y69.036 E0.0469
G1 X75.997 Y67.926 E0.06565
G1 X75.615 Y66.5 E0.08442
G1 X74.506 Y66.472 E0.06342
G1 X73.649 Y66.496 E0.04902
G1 X72.821 Y66.425 E0.04749
G1 X71.877 Y66.495 E0.05411
G1 X71.081 Y66.423 E0.04569
G1 X70.15 Y66.476 E0.05328
G1 X69.139 Y66.341 E0.05835
G1 X69.079 Y66.448 E0.00699
G1 X69.341 Y67.426 E0.05788
G1 X69.528 Y68.125 E0.04135
G1 X69.64 Y68.544 E0.02482
G1 X69.678 Y68.684 E0.00829
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.079 Y66.448 E0 F3312
G1 X69.139 Y66.341 E0
G1 X70.15 Y66.476 E0
G1 X71.081 Y66.423 E0
G1 X71.688 Y66.478 E0
G1 X71.688 Y66.478 Z6.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.307 Y72.98 E0 F9000
G1 X64.307 Y72.98 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X64.348 Y73.132 E0.009 F3312
G1 X64.47 Y73.588 E0.02701
G1 X64.674 Y74.349 E0.045
G1 X64.959 Y75.413 E0.06301
G1 X65.163 Y76.174 E0.04501
G1 X65.285 Y76.63 E0.02701
G1 X65.326 Y76.782 E0.009
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.307 Y72.98 E0 F3312
G1 X64.307 Y72.98 Z6.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.567 Y79.465 E0 F9000
G1 X72.567 Y79.465 Z6 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.6 Y79.589 E0.00734 F3312
G1 X72.7 Y79.961 E0.02203
G1 X72.966 Y80.954 E0.05875
G1 X73.065 Y81.326 E0.02203
G1 X73.099 Y81.45 E0.00734
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.567 Y79.465 E0 F3312
; time estimate: pre = 10.023659, post = 18.961407
; Dwell time remaining = -8.961407
;
; Post-layer lift
G1 X72.567 Y79.465 Z6.75 E0 F900
; END_LAYER_OBJECT z=6.000
; BEGIN_LAYER_OBJECT z=6.250 z_thickness=0.250
; *** Estimate 9.638059 [s], Slowing (0.954x) to 10.0 [s] ***
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X80.987 Y75.246 Z6.75 E0 F9000
G1 X80.987 Y75.246 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2106.4
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1053.2
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3159.6
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z6.75 E0 F900
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2106.4
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1053.2
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3159.6
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z6.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X77.328 Y76.433 E0 F9000
G1 X77.328 Y76.433 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X77.516 Y76.383 E0.01116 F3159.6
G1 X78.082 Y76.231 E0.03346
G1 X79.59 Y75.827 E0.08925
G1 X80.155 Y75.676 E0.03347
G1 X80.344 Y75.625 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.328 Y76.433 E0 F3159.6
G1 X77.328 Y76.433 Z6.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X78.57 Y69.578 E0.00808 F3159.6
G1 X78.16 Y69.688 E0.02422
G1 X77.069 Y69.98 E0.06458
G1 X76.66 Y70.09 E0.02424
G1 X76.523 Y70.127 E0.00809
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X78.706 Y69.542 E0 F3159.6
G1 X78.706 Y69.542 Z6.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X67.036 Y72.669 E0 F9000
G1 X67.036 Y72.669 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X66.847 Y72.719 E0.01116 F3159.6
G1 X66.282 Y72.871 E0.03346
G1 X64.774 Y73.275 E0.08925
G1 X64.208 Y73.427 E0.03347
G1 X64.02 Y73.477 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X67.036 Y72.669 E0 F3159.6
G1 X67.036 Y72.669 Z6.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.947 Y79.215 E0.00733 F3159.6
G1 X67.318 Y79.115 E0.02199
G1 X68.309 Y78.85 E0.05864
G1 X68.681 Y78.75 E0.02199
G1 X68.805 Y78.717 E0.00733
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.823 Y79.248 E0 F3159.6
G1 X66.823 Y79.248 Z6.75 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 3.015648 [s], Slowing (0.055x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z6.75 E0 F9000
G1 X75.962 Y75.285 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F182.2
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z6.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X74.286 Y70.726 E0 F9000
G1 X74.286 Y70.726 Z6.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.115 Y70.772 E0.01014 F436.4
G1 X73.601 Y70.91 E0.0304
G1 X72.745 Y71.139 E0.05068
G1 X71.546 Y71.46 E0.07096
G1 X70.69 Y71.69 E0.05068
G1 X70.176 Y71.828 E0.0304
G1 X70.005 Y71.873 E0.01014
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.286 Y70.726 E0 F182.2
; time estimate: pre = 10.030595, post = 19.339527
; Dwell time remaining = -9.339527
;
; Post-layer lift
G1 X74.286 Y70.726 Z7 E0 F900
; END_LAYER_OBJECT z=6.250
; BEGIN_LAYER_OBJECT z=6.500 z_thickness=0.250
; *** Estimate 3.095898 [s], Slowing (0.065x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z7 E0 F9000
G1 X75.962 Y75.285 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F215.3
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z7 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X70.365 Y71.249 E0 F9000
G1 X70.365 Y71.249 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.409 Y71.412 E0.00963 F436.4
G1 X70.54 Y71.9 E0.0289
G1 X70.758 Y72.714 E0.04817
G1 X71.063 Y73.853 E0.06743
G1 X71.237 Y74.503 E0.03849
G1 X71.543 Y75.643 E0.06743
G1 X71.761 Y76.457 E0.04817
G1 X71.892 Y76.945 E0.02891
G1 X71.935 Y77.108 E0.00966
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.641 Y72.279 E0 F215.3
G1 X70.641 Y72.279 Z7 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z7 E0 F9000
G1 X80.987 Y75.246 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z7 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z7 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.734 Y78.138 E0.01116 F3312
G1 X78.582 Y77.573 E0.03346
G1 X78.178 Y76.065 E0.08925
G1 X78.026 Y75.499 E0.03347
G1 X77.976 Y75.311 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.784 Y78.327 E0 F3312
G1 X78.784 Y78.327 Z7 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.677 Y70.462 E0 F9000
G1 X76.677 Y70.462 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.634 Y70.304 E0.00938 F3312
G1 X76.507 Y69.828 E0.02814
G1 X76.294 Y69.036 E0.0469
G1 X75.997 Y67.926 E0.06565
G1 X75.615 Y66.5 E0.08442
G1 X74.506 Y66.472 E0.06342
G1 X73.649 Y66.496 E0.04902
G1 X72.821 Y66.425 E0.04749
G1 X71.877 Y66.495 E0.05411
G1 X71.081 Y66.423 E0.04569
G1 X70.15 Y66.476 E0.05328
G1 X69.139 Y66.341 E0.05835
G1 X69.079 Y66.448 E0.00699
G1 X69.341 Y67.426 E0.05788
G1 X69.528 Y68.125 E0.04135
G1 X69.64 Y68.544 E0.02482
G1 X69.678 Y68.684 E0.00829
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.079 Y66.448 E0 F3312
G1 X69.139 Y66.341 E0
G1 X70.15 Y66.476 E0
G1 X71.081 Y66.423 E0
G1 X71.688 Y66.478 E0
G1 X71.688 Y66.478 Z7 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.307 Y72.98 E0 F9000
G1 X64.307 Y72.98 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X64.348 Y73.132 E0.009 F3312
G1 X64.47 Y73.588 E0.02701
G1 X64.674 Y74.349 E0.045
G1 X64.959 Y75.413 E0.06301
G1 X65.163 Y76.174 E0.04501
G1 X65.285 Y76.63 E0.02701
G1 X65.326 Y76.782 E0.009
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.307 Y72.98 E0 F3312
G1 X64.307 Y72.98 Z7 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.567 Y79.465 E0 F9000
G1 X72.567 Y79.465 Z6.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.6 Y79.589 E0.00734 F3312
G1 X72.7 Y79.961 E0.02203
G1 X72.966 Y80.954 E0.05875
G1 X73.065 Y81.326 E0.02203
G1 X73.099 Y81.45 E0.00734
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.567 Y79.465 E0 F3312
; time estimate: pre = 10.023661, post = 19.204086
; Dwell time remaining = -9.204086
;
; Post-layer lift
G1 X72.567 Y79.465 Z7.25 E0 F900
; END_LAYER_OBJECT z=6.500
; BEGIN_LAYER_OBJECT z=6.750 z_thickness=0.250
; *** Estimate 9.638059 [s], Slowing (0.954x) to 10.0 [s] ***
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X80.987 Y75.246 Z7.25 E0 F9000
G1 X80.987 Y75.246 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2106.4
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992256
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1053.2
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01212
G1 X67.597 Y65.64 E0.4381
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3159.6
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z7.25 E0 F900
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2106.4
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1053.2
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3159.6
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z7.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X77.328 Y76.433 E0 F9000
G1 X77.328 Y76.433 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X77.516 Y76.383 E0.01116 F3159.6
G1 X78.082 Y76.231 E0.03346
G1 X79.59 Y75.827 E0.08925
G1 X80.155 Y75.676 E0.03347
G1 X80.344 Y75.625 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.328 Y76.433 E0 F3159.6
G1 X77.328 Y76.433 Z7.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X78.57 Y69.578 E0.00808 F3159.6
G1 X78.16 Y69.688 E0.02422
G1 X77.069 Y69.98 E0.06458
G1 X76.66 Y70.09 E0.02424
G1 X76.523 Y70.127 E0.00809
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X78.706 Y69.542 E0 F3159.6
G1 X78.706 Y69.542 Z7.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X67.036 Y72.669 E0 F9000
G1 X67.036 Y72.669 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X66.847 Y72.719 E0.01116 F3159.6
G1 X66.282 Y72.871 E0.03346
G1 X64.774 Y73.275 E0.08925
G1 X64.208 Y73.427 E0.03347
G1 X64.02 Y73.477 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X67.036 Y72.669 E0 F3159.6
G1 X67.036 Y72.669 Z7.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.947 Y79.215 E0.00733 F3159.6
G1 X67.318 Y79.115 E0.02199
G1 X68.309 Y78.85 E0.05864
G1 X68.681 Y78.75 E0.02199
G1 X68.805 Y78.717 E0.00733
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.823 Y79.248 E0 F3159.6
G1 X66.823 Y79.248 Z7.25 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 3.015648 [s], Slowing (0.055x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z7.25 E0 F9000
G1 X75.962 Y75.285 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F182.2
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z7.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X74.286 Y70.726 E0 F9000
G1 X74.286 Y70.726 Z6.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.115 Y70.772 E0.01014 F436.4
G1 X73.601 Y70.91 E0.0304
G1 X72.745 Y71.139 E0.05068
G1 X71.546 Y71.46 E0.07096
G1 X70.69 Y71.69 E0.05068
G1 X70.176 Y71.828 E0.0304
G1 X70.005 Y71.873 E0.01014
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.286 Y70.726 E0 F182.2
; time estimate: pre = 10.030595, post = 19.339527
; Dwell time remaining = -9.339527
;
; Post-layer lift
G1 X74.286 Y70.726 Z7.5 E0 F900
; END_LAYER_OBJECT z=6.750
; BEGIN_LAYER_OBJECT z=7.000 z_thickness=0.250
; *** Estimate 3.095898 [s], Slowing (0.065x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z7.5 E0 F9000
G1 X75.962 Y75.285 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F215.3
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z7.5 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X70.365 Y71.249 E0 F9000
G1 X70.365 Y71.249 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.409 Y71.412 E0.00963 F436.4
G1 X70.54 Y71.9 E0.0289
G1 X70.758 Y72.714 E0.04817
G1 X71.063 Y73.853 E0.06743
G1 X71.237 Y74.503 E0.03849
G1 X71.543 Y75.643 E0.06743
G1 X71.761 Y76.457 E0.04817
G1 X71.892 Y76.945 E0.02891
G1 X71.935 Y77.108 E0.00966
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.641 Y72.279 E0 F215.3
G1 X70.641 Y72.279 Z7.5 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z7.5 E0 F9000
G1 X80.987 Y75.246 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z7.5 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z7.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.734 Y78.138 E0.01116 F3312
G1 X78.582 Y77.573 E0.03346
G1 X78.178 Y76.065 E0.08925
G1 X78.026 Y75.499 E0.03347
G1 X77.976 Y75.311 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.784 Y78.327 E0 F3312
G1 X78.784 Y78.327 Z7.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.677 Y70.462 E0 F9000
G1 X76.677 Y70.462 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.634 Y70.304 E0.00938 F3312
G1 X76.507 Y69.828 E0.02814
G1 X76.294 Y69.036 E0.0469
G1 X75.997 Y67.926 E0.06565
G1 X75.615 Y66.5 E0.08442
G1 X74.506 Y66.472 E0.06342
G1 X73.649 Y66.496 E0.04902
G1 X72.821 Y66.425 E0.04749
G1 X71.877 Y66.495 E0.05411
G1 X71.081 Y66.423 E0.04569
G1 X70.15 Y66.476 E0.05328
G1 X69.139 Y66.341 E0.05835
G1 X69.079 Y66.448 E0.00699
G1 X69.341 Y67.426 E0.05788
G1 X69.528 Y68.125 E0.04135
G1 X69.64 Y68.544 E0.02482
G1 X69.678 Y68.684 E0.00829
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.079 Y66.448 E0 F3312
G1 X69.139 Y66.341 E0
G1 X70.15 Y66.476 E0
G1 X71.081 Y66.423 E0
G1 X71.688 Y66.478 E0
G1 X71.688 Y66.478 Z7.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.307 Y72.98 E0 F9000
G1 X64.307 Y72.98 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X64.348 Y73.132 E0.009 F3312
G1 X64.47 Y73.588 E0.02701
G1 X64.674 Y74.349 E0.045
G1 X64.959 Y75.413 E0.06301
G1 X65.163 Y76.174 E0.04501
G1 X65.285 Y76.63 E0.02701
G1 X65.326 Y76.782 E0.009
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.307 Y72.98 E0 F3312
G1 X64.307 Y72.98 Z7.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.567 Y79.465 E0 F9000
G1 X72.567 Y79.465 Z7 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.6 Y79.589 E0.00734 F3312
G1 X72.7 Y79.961 E0.02203
G1 X72.966 Y80.954 E0.05875
G1 X73.065 Y81.326 E0.02203
G1 X73.099 Y81.45 E0.00734
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.567 Y79.465 E0 F3312
; time estimate: pre = 10.023661, post = 19.204086
; Dwell time remaining = -9.204087
;
; Post-layer lift
G1 X72.567 Y79.465 Z7.75 E0 F900
; END_LAYER_OBJECT z=7.000
; BEGIN_LAYER_OBJECT z=7.250 z_thickness=0.250
; *** Estimate 9.638060 [s], Slowing (0.954x) to 10.0 [s] ***
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X80.987 Y75.246 Z7.75 E0 F9000
G1 X80.987 Y75.246 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2106.4
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1053.2
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3159.6
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z7.75 E0 F900
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2106.4
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1053.2
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3159.6
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z7.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X77.328 Y76.433 E0 F9000
G1 X77.328 Y76.433 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X77.516 Y76.383 E0.01116 F3159.6
G1 X78.082 Y76.231 E0.03346
G1 X79.59 Y75.827 E0.08925
G1 X80.155 Y75.676 E0.03347
G1 X80.344 Y75.625 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.328 Y76.433 E0 F3159.6
G1 X77.328 Y76.433 Z7.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X78.57 Y69.578 E0.00808 F3159.6
G1 X78.16 Y69.688 E0.02422
G1 X77.069 Y69.98 E0.06458
G1 X76.66 Y70.09 E0.02424
G1 X76.523 Y70.127 E0.00809
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X78.706 Y69.542 E0 F3159.6
G1 X78.706 Y69.542 Z7.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X67.036 Y72.669 E0 F9000
G1 X67.036 Y72.669 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X66.847 Y72.719 E0.01116 F3159.6
G1 X66.282 Y72.871 E0.03346
G1 X64.774 Y73.275 E0.08925
G1 X64.208 Y73.427 E0.03347
G1 X64.02 Y73.477 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X67.036 Y72.669 E0 F3159.6
G1 X67.036 Y72.669 Z7.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.947 Y79.215 E0.00733 F3159.6
G1 X67.318 Y79.115 E0.02199
G1 X68.309 Y78.85 E0.05864
G1 X68.681 Y78.75 E0.02199
G1 X68.805 Y78.717 E0.00733
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.823 Y79.248 E0 F3159.6
G1 X66.823 Y79.248 Z7.75 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 3.015648 [s], Slowing (0.055x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z7.75 E0 F9000
G1 X75.962 Y75.285 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F182.2
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z7.75 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X74.286 Y70.726 E0 F9000
G1 X74.286 Y70.726 Z7.25 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.115 Y70.772 E0.01014 F436.4
G1 X73.601 Y70.91 E0.0304
G1 X72.745 Y71.139 E0.05068
G1 X71.546 Y71.46 E0.07096
G1 X70.69 Y71.69 E0.05068
G1 X70.176 Y71.828 E0.0304
G1 X70.005 Y71.873 E0.01014
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.286 Y70.726 E0 F182.2
; time estimate: pre = 10.030595, post = 19.339529
; Dwell time remaining = -9.339529
;
; Post-layer lift
G1 X74.286 Y70.726 Z8 E0 F900
; END_LAYER_OBJECT z=7.250
; BEGIN_LAYER_OBJECT z=7.500 z_thickness=0.250
; *** Estimate 3.095898 [s], Slowing (0.065x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z8 E0 F9000
G1 X75.962 Y75.285 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F215.3
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z8 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X70.365 Y71.249 E0 F9000
G1 X70.365 Y71.249 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.409 Y71.412 E0.00963 F436.4
G1 X70.54 Y71.9 E0.0289
G1 X70.758 Y72.714 E0.04817
G1 X71.063 Y73.853 E0.06743
G1 X71.237 Y74.503 E0.03849
G1 X71.543 Y75.643 E0.06743
G1 X71.761 Y76.457 E0.04817
G1 X71.892 Y76.945 E0.02891
G1 X71.935 Y77.108 E0.00966
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.641 Y72.279 E0 F215.3
G1 X70.641 Y72.279 Z8 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z8 E0 F9000
G1 X80.987 Y75.246 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z8 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z8 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.734 Y78.138 E0.01116 F3312
G1 X78.582 Y77.573 E0.03346
G1 X78.178 Y76.065 E0.08925
G1 X78.026 Y75.499 E0.03347
G1 X77.976 Y75.311 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.784 Y78.327 E0 F3312
G1 X78.784 Y78.327 Z8 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.677 Y70.462 E0 F9000
G1 X76.677 Y70.462 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.634 Y70.304 E0.00938 F3312
G1 X76.507 Y69.828 E0.02814
G1 X76.294 Y69.036 E0.0469
G1 X75.997 Y67.926 E0.06565
G1 X75.615 Y66.5 E0.08442
G1 X74.506 Y66.472 E0.06342
G1 X73.649 Y66.496 E0.04902
G1 X72.821 Y66.425 E0.04749
G1 X71.877 Y66.495 E0.05411
G1 X71.081 Y66.423 E0.04569
G1 X70.15 Y66.476 E0.05328
G1 X69.139 Y66.341 E0.05835
G1 X69.079 Y66.448 E0.00699
G1 X69.341 Y67.426 E0.05788
G1 X69.528 Y68.125 E0.04135
G1 X69.64 Y68.544 E0.02482
G1 X69.678 Y68.684 E0.00829
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.079 Y66.448 E0 F3312
G1 X69.139 Y66.341 E0
G1 X70.15 Y66.476 E0
G1 X71.081 Y66.423 E0
G1 X71.688 Y66.478 E0
G1 X71.688 Y66.478 Z8 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.307 Y72.98 E0 F9000
G1 X64.307 Y72.98 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X64.348 Y73.132 E0.009 F3312
G1 X64.47 Y73.588 E0.02701
G1 X64.674 Y74.349 E0.045
G1 X64.959 Y75.413 E0.06301
G1 X65.163 Y76.174 E0.04501
G1 X65.285 Y76.63 E0.02701
G1 X65.326 Y76.782 E0.009
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.307 Y72.98 E0 F3312
G1 X64.307 Y72.98 Z8 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.567 Y79.465 E0 F9000
G1 X72.567 Y79.465 Z7.5 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.6 Y79.589 E0.00734 F3312
G1 X72.7 Y79.961 E0.02203
G1 X72.966 Y80.954 E0.05875
G1 X73.065 Y81.326 E0.02203
G1 X73.099 Y81.45 E0.00734
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.567 Y79.465 E0 F3312
; time estimate: pre = 10.023661, post = 19.204086
; Dwell time remaining = -9.204087
;
; Post-layer lift
G1 X72.567 Y79.465 Z8.25 E0 F900
; END_LAYER_OBJECT z=7.500
; BEGIN_LAYER_OBJECT z=7.750 z_thickness=0.250
; *** Estimate 9.638060 [s], Slowing (0.954x) to 10.0 [s] ***
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X80.987 Y75.246 Z8.25 E0 F9000
G1 X80.987 Y75.246 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2106.4
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1053.2
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3159.6
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z8.25 E0 F900
;
; 'Loop Path', 1.6 [feed mm/s], 35.1 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 35.107204, filament speed 1.642036, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2106.4
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.8 [feed mm/s], 17.6 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 17.553602, filament speed 0.821018, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1053.2
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3159.6
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z8.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X77.328 Y76.433 E0 F9000
G1 X77.328 Y76.433 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X77.516 Y76.383 E0.01116 F3159.6
G1 X78.082 Y76.231 E0.03346
G1 X79.59 Y75.827 E0.08925
G1 X80.155 Y75.676 E0.03347
G1 X80.344 Y75.625 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X77.328 Y76.433 E0 F3159.6
G1 X77.328 Y76.433 Z8.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X78.706 Y69.542 E0 F9000
G1 X78.706 Y69.542 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X78.57 Y69.578 E0.00808 F3159.6
G1 X78.16 Y69.688 E0.02422
G1 X77.069 Y69.98 E0.06458
G1 X76.66 Y70.09 E0.02424
G1 X76.523 Y70.127 E0.00809
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X78.706 Y69.542 E0 F3159.6
G1 X78.706 Y69.542 Z8.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X67.036 Y72.669 E0 F9000
G1 X67.036 Y72.669 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for Destring
G1 X66.847 Y72.719 E0.01116 F3159.6
G1 X66.282 Y72.871 E0.03346
G1 X64.774 Y73.275 E0.08925
G1 X64.208 Y73.427 E0.03347
G1 X64.02 Y73.477 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
G1 X67.036 Y72.669 E0 F3159.6
G1 X67.036 Y72.669 Z8.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 3.0 [feed mm/s], 52.7 [head mm/s]
G1 X66.823 Y79.248 E0 F9000
G1 X66.823 Y79.248 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 52.660809, filament speed 3.010400, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.947 Y79.215 E0.00733 F3159.6
G1 X67.318 Y79.115 E0.02199
G1 X68.309 Y78.85 E0.05864
G1 X68.681 Y78.75 E0.02199
G1 X68.805 Y78.717 E0.00733
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 52.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 52.660805, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X66.823 Y79.248 E0 F3159.6
G1 X66.823 Y79.248 Z8.25 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 3.015648 [s], Slowing (0.055x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z8.25 E0 F9000
G1 X75.962 Y75.285 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F182.2
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z8.25 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X74.286 Y70.726 E0 F9000
G1 X74.286 Y70.726 Z7.75 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.115 Y70.772 E0.01014 F436.4
G1 X73.601 Y70.91 E0.0304
G1 X72.745 Y71.139 E0.05068
G1 X71.546 Y71.46 E0.07096
G1 X70.69 Y71.69 E0.05068
G1 X70.176 Y71.828 E0.0304
G1 X70.005 Y71.873 E0.01014
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.0 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.036000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.286 Y70.726 E0 F182.2
; time estimate: pre = 10.030595, post = 19.339529
; Dwell time remaining = -9.339529
;
; Post-layer lift
G1 X74.286 Y70.726 Z8.5 E0 F900
; END_LAYER_OBJECT z=7.750
; BEGIN_LAYER_OBJECT z=8.000 z_thickness=0.250
; *** Estimate 3.095898 [s], Slowing (0.065x) to 10.0 [s] ***
;
; 'Loop Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.962 Y75.285 Z8.5 E0 F9000
G1 X75.962 Y75.285 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F533.3
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02187
G1 X75.85 Y72.52 E0.0073
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F215.3
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z8.5 E0 F900
; Fan set to Cool value 100%
;
; 'Stacked Sparse Infill Path', 0.4 [feed mm/s], 7.3 [head mm/s]
G1 X70.365 Y71.249 E0 F9000
G1 X70.365 Y71.249 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 7.272727, filament speed 0.415752, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.409 Y71.412 E0.00963 F436.4
G1 X70.54 Y71.9 E0.0289
G1 X70.758 Y72.714 E0.04817
G1 X71.063 Y73.853 E0.06743
G1 X71.237 Y74.503 E0.03849
G1 X71.543 Y75.643 E0.06743
G1 X71.761 Y76.457 E0.04817
G1 X71.892 Y76.945 E0.02891
G1 X71.935 Y77.108 E0.00966
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 3.6 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 3.588000, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.641 Y72.279 E0 F215.3
G1 X70.641 Y72.279 Z8.5 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z8.5 E0 F9000
G1 X80.987 Y75.246 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z8.5 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z8.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X78.784 Y78.327 E0 F9000
G1 X78.784 Y78.327 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X78.734 Y78.138 E0.01116 F3312
G1 X78.582 Y77.573 E0.03346
G1 X78.178 Y76.065 E0.08925
G1 X78.026 Y75.499 E0.03347
G1 X77.976 Y75.311 E0.01116
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X78.784 Y78.327 E0 F3312
G1 X78.784 Y78.327 Z8.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X76.677 Y70.462 E0 F9000
G1 X76.677 Y70.462 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X76.634 Y70.304 E0.00938 F3312
G1 X76.507 Y69.828 E0.02814
G1 X76.294 Y69.036 E0.0469
G1 X75.997 Y67.926 E0.06565
G1 X75.615 Y66.5 E0.08442
G1 X74.506 Y66.472 E0.06342
G1 X73.649 Y66.496 E0.04902
G1 X72.821 Y66.425 E0.04749
G1 X71.877 Y66.495 E0.05411
G1 X71.081 Y66.423 E0.04569
G1 X70.15 Y66.476 E0.05328
G1 X69.139 Y66.341 E0.05835
G1 X69.079 Y66.448 E0.00699
G1 X69.341 Y67.426 E0.05788
G1 X69.528 Y68.125 E0.04135
G1 X69.64 Y68.544 E0.02482
G1 X69.678 Y68.684 E0.00829
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.079 Y66.448 E0 F3312
G1 X69.139 Y66.341 E0
G1 X70.15 Y66.476 E0
G1 X71.081 Y66.423 E0
G1 X71.688 Y66.478 E0
G1 X71.688 Y66.478 Z8.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X64.307 Y72.98 E0 F9000
G1 X64.307 Y72.98 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for Destring
G1 X64.348 Y73.132 E0.009 F3312
G1 X64.47 Y73.588 E0.02701
G1 X64.674 Y74.349 E0.045
G1 X64.959 Y75.413 E0.06301
G1 X65.163 Y76.174 E0.04501
G1 X65.285 Y76.63 E0.02701
G1 X65.326 Y76.782 E0.009
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.307 Y72.98 E0 F3312
G1 X64.307 Y72.98 Z8.5 E0 F900
; Blending Fan to Cool (99.9% blend)
; Blended Fan at 100%
;
; 'Stacked Sparse Infill Path', 3.2 [feed mm/s], 55.2 [head mm/s]
G1 X72.567 Y79.465 E0 F9000
G1 X72.567 Y79.465 Z8 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 55.200001, filament speed 3.155555, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.6 Y79.589 E0.00734 F3312
G1 X72.7 Y79.961 E0.02203
G1 X72.966 Y80.954 E0.05875
G1 X73.065 Y81.326 E0.02203
G1 X73.099 Y81.45 E0.00734
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.567 Y79.465 E0 F3312
; time estimate: pre = 10.023661, post = 19.204086
; Dwell time remaining = -9.204087
;
; Post-layer lift
G1 X72.567 Y79.465 Z8.7625 E0 F900
; END_LAYER_OBJECT z=8.000
; BEGIN_LAYER_OBJECT z=8.262 z_thickness=0.262
;
; 'Loop Path', 1.8 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z8.7625 E0 F9000
G1 X80.987 Y75.246 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.807265, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00769 F2208
G1 X80.673 Y75.788 E0.02305
G1 X80.282 Y76.465 E0.03843
G1 X79.734 Y77.414 E0.0538
G1 X79.029 Y78.633 E0.06918
G1 X78.167 Y80.124 E0.08454
G1 X77.149 Y81.885 E0.09992
G1 X77.073 Y81.972 E0.00567
G1 X67.902 Y81.971 E0.45038
G1 X64.146 Y75.474 E0.36857
G1 X63.297 Y74.003 E0.0834
G1 X63.79 Y73.142 E0.04873
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.39859
G1 X67.927 Y66.028 E0.00567
G1 X77.098 Y66.029 E0.45039
G1 X78.088 Y67.741 E0.09711
G1 X78.925 Y69.189 E0.08218
G1 X79.61 Y70.375 E0.06723
G1 X80.143 Y71.297 E0.0523
G1 X80.524 Y71.955 E0.03735
G1 X80.752 Y72.35 E0.02241
G1 X80.828 Y72.482 E0.00747
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.903632, preload 0.000000
G1 X80.908 Y72.621 E0.00286 F1104
G1 X81.035 Y72.836 E0.01231
G1 X81.263 Y73.223 E0.02201
G1 X81.59 Y73.779 E0.03171
G1 X82.147 Y74.027 E0.02992
G1 X82.171 Y74.047 E0.00152
G1 X82.18 Y74.077 E0.00153
G1 X82.173 Y74.107 E0.00152
G1 X81.526 Y75.225 E0.06343
G1 X80.726 Y76.609 E0.07852
G1 X79.773 Y78.26 E0.09363
G1 X77.403 Y82.36 E0.23255
G1 X77.39 Y82.376 E0.00101
G1 X77.372 Y82.385 E0.00101
G1 X77.248 Y82.425 E0.00638
G1 X72.574 Y82.425 E0.22956
G1 X67.855 Y82.426 E0.23173
G1 X67.663 Y82.427 E0.00942
G1 X67.635 Y82.42 E0.00144
G1 X67.614 Y82.399 E0.00145
G1 X65.574 Y78.855 E0.20082
G1 X63.186 Y74.719 E0.23453
G1 X62.795 Y74.034 E0.03874
G1 X62.787 Y74.008 E0.00135
G1 X62.793 Y73.981 E0.00135
G1 X62.91 Y73.75 E0.01273
G1 X67.597 Y65.64 E0.45999
G1 X67.61 Y65.624 E0.00101
G1 X67.628 Y65.615 E0.00101
G1 X67.752 Y65.575 E0.00638
G1 X72.426 Y65.575 E0.22957
G1 X77.145 Y65.574 E0.23173
G1 X77.337 Y65.573 E0.00941
G1 X77.365 Y65.58 E0.00145
G1 X77.386 Y65.601 E0.00144
G1 X79.426 Y69.145 E0.20083
G1 X80.359 Y70.762 E0.09168
G1 X81.155 Y72.141 E0.07817
G1 X81.814 Y73.281 E0.06467
G1 X82.141 Y73.847 E0.03211
G1 X82.148 Y73.883 E0.00178
G1 X82.131 Y73.915 E0.00178
G1 X81.92 Y74.125 E0.01465
G1 X81.605 Y74.208 E0.01595
G1 X81.586 Y74.217 E0.00108
G1 X81.571 Y74.234 E0.00109
G1 X81.22 Y74.842 E0.03448
G1 X81.035 Y75.162 E0.01814
G1 X81.004 Y75.215 E0.00304
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z8.7625 E0 F900
;
; 'Loop Path', 1.8 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.807265, preload 0.000000
G1 X77.442 Y75.478 E0.00759 F2208
G1 X77.209 Y75.879 E0.02276
G1 X76.823 Y76.548 E0.03794
G1 X76.281 Y77.484 E0.05311
G1 X75.584 Y78.687 E0.06828
G1 X75.301 Y78.923 E0.01809
G1 X74.994 Y79.018 E0.01577
G1 X73.515 Y79.017 E0.07267
G1 X71.827 Y79.016 E0.08287
G1 X69.932 Y79.015 E0.09308
G1 X69.553 Y78.841 E0.02048
G1 X69.336 Y78.557 E0.01758
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.24108
G1 X66.836 Y73.963 E0.0169
G1 X66.934 Y73.602 E0.01838
G1 X69.416 Y69.313 E0.24336
G1 X69.699 Y69.077 E0.01809
G1 X70.006 Y68.982 E0.01577
G1 X71.911 Y68.983 E0.09357
G1 X73.598 Y68.984 E0.08287
G1 X75.068 Y68.985 E0.07218
G1 X75.447 Y69.159 E0.02048
G1 X75.664 Y69.443 E0.01758
G1 X76.29 Y70.527 E0.06145
G1 X76.777 Y71.369 E0.04779
G1 X77.124 Y71.972 E0.03414
G1 X77.333 Y72.333 E0.02049
G1 X77.402 Y72.453 E0.00684
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.903632, preload 0.000000
G1 X77.479 Y72.587 E0.00184 F1104
G1 X77.592 Y72.783 E0.01109
G1 X77.807 Y73.155 E0.02114
G1 X78.124 Y73.705 E0.03119
G1 X78.132 Y73.731 E0.00131
G1 X78.127 Y73.757 E0.00131
G1 X78.11 Y73.778 E0.00131
G1 X77.698 Y74.099 E0.02566
G1 X77.14 Y75.079 E0.05538
G1 X76.455 Y76.283 E0.06805
G1 X75.859 Y77.306 E0.0581
G1 X75.194 Y78.449 E0.06495
G1 X74.988 Y78.564 E0.01161
G1 X70.431 Y78.565 E0.22376
G1 X69.972 Y78.559 E0.02259
G1 X69.788 Y78.438 E0.01077
G1 X67.425 Y74.339 E0.23236
G1 X67.291 Y74.091 E0.01386
G1 X67.337 Y73.806 E0.01417
G1 X69.783 Y69.574 E0.24005
G1 X70.012 Y69.436 E0.0131
G1 X74.569 Y69.435 E0.2238
G1 X75.028 Y69.441 E0.02259
G1 X75.212 Y69.562 E0.01077
G1 X76.152 Y71.193 E0.09247
G1 X76.941 Y72.56 E0.0775
G1 X77.577 Y73.663 E0.06255
G1 X77.705 Y73.919 E0.01405
G1 X78.011 Y74.174 E0.01957
G1 X78.101 Y74.226 E0.00506
G1 X78.121 Y74.247 E0.00143
G1 X78.128 Y74.275 E0.00142
G1 X78.121 Y74.303 E0.00143
G1 X77.797 Y74.864 E0.03182
G1 X77.599 Y75.207 E0.01945
G1 X77.562 Y75.269 E0.00355
G1 X77.526 Y75.332 E0.00356
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z8.7625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X77.927 Y80 E0 F9000
G1 X77.927 Y80 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.499996, filament speed 1.694310, preload 0.000000
; Prepare for Destring
G1 X77.753 Y80.046 E0.00882 F2070
G1 X77.233 Y80.186 E0.02646
G1 X76.365 Y80.418 E0.0441
G1 X75.151 Y80.744 E0.06174
G1 X74.457 Y80.93 E0.03528
G1 X73.243 Y81.255 E0.06174
G1 X72.375 Y81.487 E0.0441
G1 X71.855 Y81.627 E0.02646
G1 X71.682 Y81.673 E0.00882
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.511 Y80.379 E0 F3312
G1 X76.511 Y80.379 Z8.7625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X69.882 Y79.36 E0 F9000
G1 X69.882 Y79.36 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.499996, filament speed 1.694310, preload 0.000000
G1 X69.723 Y79.403 E0.00804 F2070
G1 X69.249 Y79.53 E0.02412
G1 X68.458 Y79.741 E0.04021
G1 X67.351 Y80.037 E0.05629
G1 X67.014 Y79.679 E0.02413
G1 X66.636 Y79.324 E0.0255
G1 X66.74 Y79.27 E0.00576
G1 X67.745 Y79.001 E0.05108
G1 X68.872 Y78.699 E0.05731
G1 X68.571 Y77.848 E0.04434
G1 X66.16 Y78.494 E0.12255
G1 X65.826 Y77.652 E0.0445
G1 X67.964 Y77.079 E0.10873
G1 X67.657 Y76.229 E0.04436
G1 X65.242 Y76.877 E0.12282
G1 X64.916 Y76.032 E0.04445
G1 X67.056 Y75.459 E0.10879
G1 X66.743 Y74.611 E0.04439
G1 X64.325 Y75.259 E0.12295
G1 X64.008 Y74.412 E0.04441
; Prepare for Destring
G1 X66.542 Y73.728 E0.12892
G1 X66.826 Y73.167 E0.03088
G1 X67.136 Y72.642 E0.02992
G1 X67.118 Y72.647 E0.00094
G1 X63.891 Y73.511 E0.16403
G1 X63.923 Y73.462 E0.0029
G1 X64.218 Y72.981 E0.02769
G1 X64.529 Y72.409 E0.032
G1 X67.782 Y71.531 E0.16547
G1 X68.088 Y70.971 E0.03135
G1 X68.409 Y70.437 E0.03057
G1 X68.39 Y70.442 E0.00095
G1 X66.668 Y70.904 E0.08754
G1 X65.164 Y71.307 E0.07648
G1 X65.196 Y71.257 E0.00289
G1 X65.491 Y70.777 E0.02769
G1 X65.802 Y70.204 E0.03201
G1 X66.969 Y69.892 E0.05932
G1 X67.877 Y69.648 E0.04615
G1 X68.525 Y69.475 E0.03298
G1 X68.915 Y69.37 E0.0198
G1 X69.045 Y69.335 E0.00664
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.802 Y70.204 E0 F3312
G1 X65.491 Y70.777 E0
G1 X65.196 Y71.257 E0
G1 X65.164 Y71.307 E0
G1 X65.52 Y71.212 E0
G1 X65.52 Y71.212 Z8.7625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X66.437 Y69.102 E0 F9000
G1 X66.437 Y69.102 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.499996, filament speed 1.694310, preload 0.000000
; Prepare for Destring
G1 X66.596 Y69.06 E0.0081 F2070
G1 X67.074 Y68.932 E0.02429
G1 X67.87 Y68.719 E0.04048
G1 X68.985 Y68.42 E0.05668
G1 X70.419 Y68.037 E0.07287
G1 X72.171 Y67.568 E0.08907
G1 X74.241 Y67.014 E0.10526
G1 X76.63 Y66.374 E0.12145
G1 X77.045 Y66.687 E0.02552
G1 X77.498 Y67.029 E0.02786
G1 X77.348 Y67.111 E0.00836
G1 X75.551 Y67.592 E0.09138
G1 X74.08 Y67.986 E0.07476
G1 X72.937 Y68.293 E0.05815
G1 X72.12 Y68.511 E0.04153
G1 X71.629 Y68.643 E0.02493
G1 X71.466 Y68.687 E0.0083
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.296 Y67.392 E0 F3312
G1 X76.296 Y67.392 Z8.7625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X69.646 Y66.379 E0 F9000
G1 X69.646 Y66.379 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.499996, filament speed 1.694310, preload 0.000000
; Prepare for Destring
G1 X69.525 Y66.412 E0.00617 F2070
G1 X69.161 Y66.51 E0.01851
G1 X68.555 Y66.675 E0.03084
G1 X67.706 Y66.905 E0.04319
G1 X67.4 Y67.47 E0.03155
G1 X67.073 Y68 E0.03059
G1 X67.088 Y67.996 E0.00071
G1 X68.991 Y67.486 E0.0968
G1 X70.549 Y67.069 E0.0792
G1 X71.761 Y66.744 E0.0616
G1 X72.626 Y66.512 E0.044
G1 X73.145 Y66.373 E0.0264
G1 X73.318 Y66.327 E0.0088
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.489 Y67.621 E0 F3312
G1 X68.489 Y67.621 Z8.7625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X75.118 Y68.64 E0 F9000
G1 X75.118 Y68.64 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.499996, filament speed 1.694310, preload 0.000000
G1 X75.277 Y68.597 E0.00804 F2070
G1 X75.751 Y68.47 E0.02412
G1 X76.542 Y68.259 E0.04021
G1 X77.649 Y67.963 E0.05629
G1 X77.986 Y68.321 E0.02413
G1 X78.364 Y68.676 E0.02551
G1 X78.26 Y68.73 E0.00576
G1 X77.255 Y68.999 E0.05107
G1 X76.128 Y69.301 E0.05731
G1 X76.429 Y70.152 E0.04434
G1 X78.84 Y69.506 E0.12255
G1 X79.174 Y70.348 E0.0445
G1 X77.036 Y70.921 E0.10873
G1 X77.343 Y71.771 E0.04436
G1 X79.758 Y71.123 E0.12282
G1 X80.084 Y71.968 E0.04445
G1 X77.944 Y72.541 E0.10879
G1 X78.257 Y73.389 E0.04439
G1 X80.675 Y72.741 E0.12295
G1 X80.992 Y73.588 E0.04441
; Prepare for Destring
G1 X78.458 Y74.272 E0.12892
G1 X78.174 Y74.833 E0.03088
G1 X77.864 Y75.358 E0.02992
G1 X77.882 Y75.353 E0.00094
G1 X81.109 Y74.489 E0.16403
G1 X81.077 Y74.538 E0.0029
G1 X80.782 Y75.019 E0.02769
G1 X80.471 Y75.591 E0.032
G1 X77.218 Y76.469 E0.16547
G1 X76.912 Y77.029 E0.03135
G1 X76.591 Y77.563 E0.03057
G1 X76.61 Y77.558 E0.00095
G1 X78.332 Y77.096 E0.08754
G1 X79.836 Y76.693 E0.07648
G1 X79.804 Y76.743 E0.00289
G1 X79.509 Y77.223 E0.02769
G1 X79.198 Y77.796 E0.032
G1 X78.03 Y78.109 E0.05936
G1 X77.122 Y78.352 E0.04617
G1 X76.474 Y78.526 E0.03298
G1 X76.084 Y78.63 E0.01979
G1 X75.955 Y78.665 E0.00659
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X79.198 Y77.796 E0 F3312
G1 X79.509 Y77.223 E0
G1 X79.804 Y76.743 E0
G1 X79.836 Y76.693 E0
G1 X79.48 Y76.788 E0
G1 X79.48 Y76.788 Z8.7625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.7 [feed mm/s], 34.5 [head mm/s]
G1 X73.534 Y79.313 E0 F9000
G1 X73.534 Y79.313 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.499996, filament speed 1.694310, preload 0.000000
G1 X73.371 Y79.357 E0.00831 F2070
G1 X72.88 Y79.489 E0.02492
G1 X72.063 Y79.707 E0.04153
; Prepare for End-Of-Layer
G1 X70.92 Y80.014 E0.05815
G1 X69.449 Y80.408 E0.07476
G1 X67.652 Y80.889 E0.09138
G1 X67.502 Y80.971 E0.00837
G1 X67.955 Y81.313 E0.02786
G1 X68.374 Y81.628 E0.02573
G1 X76.572 Y79.431 E0.41681
G1 X78.563 Y78.898 E0.10123
G1 X78.531 Y78.947 E0.00289
G1 X78.235 Y79.432 E0.02789
G1 X77.812 Y80.177 E0.04211
G1 X77.405 Y80.889 E0.04023
G1 X77.289 Y81.103 E0.01197
G1 X76.442 Y81.329 E0.04303
G1 X75.838 Y81.491 E0.03074
G1 X75.475 Y81.589 E0.01844
G1 X75.354 Y81.621 E0.00614
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X77.289 Y81.103 E0 F3312
G1 X77.405 Y80.889 E0
G1 X77.812 Y80.177 E0
G1 X78.235 Y79.432 E0
G1 X78.531 Y78.947 E0
G1 X78.563 Y78.898 E0
G1 X78.128 Y79.014 E0
G1 X78.128 Y79.014 Z8.7625 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 4.674408 [s], Slowing (0.388x) to 10.0 [s] ***
; fan %*255
M106 S255
;
; 'Loop Path', 0.7 [feed mm/s], 14.3 [head mm/s]
G1 X75.962 Y75.285 Z8.7625 E0 F9000
G1 X75.962 Y75.285 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 14.278400, filament speed 0.701219, preload 0.000000
G1 X75.878 Y75.431 E0.00829 F856.7
G1 X75.624 Y75.87 E0.02486
G1 X75.201 Y76.6 E0.04145
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05802
G1 X74.327 Y77.641 E0.01389
G1 X73.198 Y77.641 E0.05547
G1 X71.887 Y77.64 E0.06436
G1 X70.395 Y77.639 E0.07325
G1 X68.321 Y74.037 E0.20412
G1 X68.36 Y73.888 E0.00758
G1 X70.391 Y70.378 E0.19916
G1 X70.673 Y70.359 E0.01389
G1 X72.186 Y70.36 E0.07433
G1 X73.497 Y70.361 E0.06436
G1 X74.605 Y70.361 E0.05439
G1 X75.149 Y71.305 E0.05353
G1 X75.539 Y71.98 E0.03825
G1 X75.772 Y72.385 E0.02296
G1 X75.85 Y72.52 E0.00767
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.5 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.465645, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00286 F507.9
G1 X76.06 Y72.882 E0.01197
G1 X76.277 Y73.257 E0.02129
G1 X76.589 Y73.797 E0.03062
G1 X76.603 Y73.813 E0.00106
G1 X76.623 Y73.823 E0.00106
G1 X76.94 Y73.912 E0.01616
G1 X77.134 Y74.063 E0.0121
G1 X77.151 Y74.084 E0.00131
G1 X77.156 Y74.11 E0.00131
G1 X77.148 Y74.136 E0.00131
G1 X76.535 Y75.198 E0.06022
G1 X75.779 Y76.507 E0.07423
G1 X74.881 Y78.063 E0.08824
G1 X74.861 Y78.083 E0.00143
G1 X74.833 Y78.091 E0.00142
G1 X73.978 Y78.095 E0.04199
G1 X70.215 Y78.089 E0.18476
G1 X70.196 Y78.085 E0.00099
G1 X70.178 Y78.075 E0.00098
G1 X70.066 Y77.977 E0.00733
G1 X67.813 Y74.065 E0.22167
G1 X67.794 Y73.995 E0.00358
G1 X67.793 Y73.973 E0.00108
G1 X67.8 Y73.952 E0.00108
G1 X70.119 Y69.937 E0.2277
G1 X70.14 Y69.917 E0.00142
G1 X70.167 Y69.909 E0.00143
G1 X71.022 Y69.905 E0.04198
G1 X74.785 Y69.911 E0.18477
G1 X74.804 Y69.915 E0.00098
G1 X74.822 Y69.925 E0.00099
G1 X74.934 Y70.023 E0.00733
G1 X75.822 Y71.563 E0.08729
G1 X76.565 Y72.85 E0.07298
G1 X77.163 Y73.885 E0.05869
G1 X77.17 Y73.914 E0.00147
G1 X77.162 Y73.943 E0.00147
G1 X77.14 Y73.963 E0.00147
G1 X76.547 Y74.273 E0.03286
G1 X76.195 Y74.881 E0.0345
G1 X76.011 Y75.2 E0.01811
G1 X75.98 Y75.253 E0.00301
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 21.4 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 21.417601, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1285.1
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z8.7625 E0 F900
; Fan set to Cool value 100%
;
; 'Sparse Infill Path', 0.7 [feed mm/s], 13.4 [head mm/s]
G1 X70.579 Y70.788 E0 F9000
G1 X70.579 Y70.788 Z8.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.386001, filament speed 0.657393, preload 0.000000
G1 X70.819 Y70.723 E0.01223 F803.2
G1 X70.768 Y70.771 E0.00342
G1 X70.438 Y71.116 E0.02347
G1 X70.043 Y71.718 E0.03535
G1 X69.914 Y71.898 E0.01085
G1 X69.941 Y71.89 E0.00138
G1 X71.143 Y71.568 E0.0611
G1 X72.664 Y71.161 E0.0773
G1 X74.503 Y70.668 E0.09351
G1 X74.832 Y71.512 E0.04447
G1 X69.261 Y73.01 E0.28332
G1 X68.972 Y73.556 E0.03036
G1 X68.669 Y74.095 E0.03033
G1 X68.687 Y74.09 E0.00091
G1 X75.42 Y72.286 E0.34232
G1 X75.741 Y73.132 E0.04443
G1 X69.259 Y74.868 E0.32957
G1 X69.58 Y75.714 E0.04443
; Prepare for End-Of-Layer
G1 X76.331 Y73.905 E0.34323
G1 X76.303 Y73.953 E0.0027
G1 X76.027 Y74.446 E0.02776
G1 X75.739 Y74.99 E0.03024
G1 X70.168 Y76.488 E0.28331
G1 X70.497 Y77.332 E0.04447
G1 X72.371 Y76.83 E0.09526
G1 X73.9 Y76.42 E0.07776
G1 X75.086 Y76.102 E0.06027
G1 X75.053 Y76.154 E0.00301
G1 X74.755 Y76.652 E0.02847
G1 X74.442 Y77.2 E0.03102
G1 X74.181 Y77.277 E0.01338
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 21.4 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 21.417601, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.442 Y77.2 E0 F1285.1
G1 X74.755 Y76.652 E0
G1 X75.053 Y76.154 E0
G1 X75.086 Y76.102 E0
G1 X71.748 Y76.997 E0
; time estimate: pre = 10.008392, post = 23.442286
; Dwell time remaining = -13.442286
;
; Post-layer lift
G1 X71.748 Y76.997 Z9.0125 E0 F900
; END_LAYER_OBJECT z=8.262
; BEGIN_LAYER_OBJECT z=8.512 z_thickness=0.250
; *** Estimate 4.670692 [s], Slowing (0.375x) to 10.0 [s] ***
;
; 'Loop Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X75.962 Y75.285 Z9.0125 E0 F9000
G1 X75.962 Y75.285 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.800002, filament speed 0.645455, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F828
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.700003, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1242
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z9.0125 E0 F900
; Fan set to Cool value 100%
;
; 'Sparse Infill Path', 0.6 [feed mm/s], 12.9 [head mm/s]
G1 X69.068 Y73.363 E0 F9000
G1 X69.068 Y73.363 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 12.937500, filament speed 0.605114, preload 0.000000
G1 X69.114 Y73.521 E0.00769 F776.2
G1 X69.252 Y73.994 E0.02307
G1 X69.483 Y74.783 E0.03844
G1 X69.805 Y75.888 E0.05383
G1 X70.272 Y76.586 E0.03926
G1 X70.578 Y77.421 E0.04161
G1 X71.005 Y77.755 E0.02537
G1 X71.064 Y77.335 E0.01983
G1 X69.706 Y72.243 E0.2465
G1 X70.032 Y71.704 E0.02948
G1 X70.341 Y71.159 E0.02931
G1 X70.347 Y71.182 E0.00112
G1 X71.955 Y77.177 E0.29031
G1 X72.434 Y77.291 E0.02303
G1 X72.93 Y77.435 E0.02418
G1 X72.923 Y77.317 E0.00556
G1 X71.189 Y70.847 E0.31325
G1 X72.073 Y70.681 E0.04207
G1 X72.096 Y70.753 E0.00358
; Prepare for End-Of-Layer
G1 X73.822 Y77.197 E0.31199
G1 X74.681 Y76.923 E0.04214
G1 X73.046 Y70.824 E0.29536
G1 X73.935 Y70.661 E0.04224
G1 X74.453 Y72.595 E0.09368
G1 X74.907 Y74.288 E0.08197
G1 X75.295 Y75.739 E0.07026
G1 X75.323 Y75.688 E0.00273
G1 X75.606 Y75.191 E0.02671
G1 X75.931 Y74.655 E0.02935
G1 X75.647 Y73.586 E0.05172
G1 X75.444 Y72.823 E0.03694
G1 X75.323 Y72.365 E0.02217
G1 X75.282 Y72.212 E0.00738
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.700003, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.931 Y74.655 E0 F1242
G1 X75.606 Y75.191 E0
G1 X75.323 Y75.688 E0
G1 X75.295 Y75.739 E0
G1 X74.981 Y74.565 E0
G1 X74.981 Y74.565 Z9.0125 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z9.0125 E0 F9000
G1 X80.987 Y75.246 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z9.0125 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X77.949 Y75.211 E0 F9000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X77.984 Y75.341 E0.00629 F2070
G1 X78.087 Y75.731 E0.01889
G1 X78.26 Y76.381 E0.03147
G1 X78.503 Y77.292 E0.04407
G1 X78.814 Y78.462 E0.05665
G1 X78.478 Y79.01 E0.03006
G1 X78.182 Y79.558 E0.02912
G1 X78.178 Y79.543 E0.00069
G1 X77.775 Y78.037 E0.07294
G1 X77.313 Y76.313 E0.08349
G1 X77.286 Y76.364 E0.00271
G1 X77.009 Y76.861 E0.0266
G1 X76.679 Y77.402 E0.02965
G1 X77.546 Y80.672 E0.15823
G1 X77.221 Y81.108 E0.0254
G1 X76.884 Y81.538 E0.02556
G1 X76.827 Y81.454 E0.00478
G1 X76.04 Y78.517 E0.14217
G1 X76.028 Y78.534 E0.00097
G1 X75.715 Y78.948 E0.02428
G1 X75.293 Y79.206 E0.02313
G1 X75.944 Y81.638 E0.11776
G1 X75.951 Y81.756 E0.00555
G1 X75.45 Y81.608 E0.02442
G1 X74.974 Y81.495 E0.0229
G1 X74.403 Y79.364 E0.10317
G1 X73.885 Y79.352 E0.02422
G1 X73.455 Y79.264 E0.02055
G1 X73.447 Y79.274 E0.00059
; Prepare for Destring
G1 X74.086 Y81.657 E0.1154
G1 X74.093 Y81.775 E0.00555
G1 X73.594 Y81.632 E0.0243
G1 X73.117 Y81.519 E0.02293
G1 X72.544 Y79.381 E0.10352
G1 X71.773 Y79.32 E0.03616
G1 X71.583 Y79.273 E0.00915
G1 X72.227 Y81.675 E0.11631
G1 X72.235 Y81.791 E0.00546
G1 X71.736 Y81.652 E0.0242
G1 X71.26 Y81.542 E0.02289
G1 X70.687 Y79.405 E0.10346
G1 X69.863 Y79.297 E0.03887
G1 X69.718 Y79.266 E0.00691
G1 X70.368 Y81.692 E0.11743
G1 X69.932 Y81.631 E0.02059
G1 X69.407 Y81.581 E0.02466
G1 X69 Y80.063 E0.07347
G1 X68.684 Y78.883 E0.05716
G1 X68.458 Y78.039 E0.04085
G1 X68.322 Y77.533 E0.02453
G1 X68.277 Y77.363 E0.00821
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.407 Y81.581 E0 F3312
G1 X69.932 Y81.631 E0
G1 X70.037 Y81.646 E0
G1 X70.037 Y81.646 Z9.0125 E0 F900
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X65.369 Y76.943 E0 F9000
G1 X65.369 Y76.943 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X65.325 Y76.779 E0.00794 F2070
G1 X65.194 Y76.287 E0.0238
G1 X64.976 Y75.468 E0.03968
G1 X64.67 Y74.32 E0.05555
G1 X64.277 Y72.845 E0.07141
G1 X64.613 Y72.297 E0.03006
G1 X64.909 Y71.749 E0.02912
G1 X64.913 Y71.763 E0.00069
G1 X67.136 Y79.891 E0.39413
G1 X67.62 Y80.613 E0.04065
G1 X67.896 Y81.264 E0.03307
G1 X68.509 Y81.706 E0.03532
G1 X68.502 Y81.682 E0.00116
G1 X65.549 Y70.64 E0.53461
G1 X65.885 Y70.092 E0.03005
G1 X66.182 Y69.545 E0.02913
G1 X66.185 Y69.559 E0.00068
G1 X67.051 Y72.789 E0.15643
G1 X67.078 Y72.738 E0.00272
G1 X67.354 Y72.241 E0.02659
G1 X67.685 Y71.7 E0.02966
G1 X66.822 Y68.436 E0.15793
G1 X67.158 Y67.888 E0.03005
G1 X67.454 Y67.34 E0.02912
G1 X67.458 Y67.354 E0.00069
G1 X68.324 Y70.585 E0.15643
G1 X68.351 Y70.533 E0.00272
G1 X68.627 Y70.037 E0.02659
G1 X68.958 Y69.495 E0.02966
G1 X68.173 Y66.546 E0.14273
G1 X69.054 Y66.356 E0.04214
; Prepare for Destring
G1 X69.707 Y68.794 E0.11805
G1 X70.148 Y68.71 E0.02099
G1 X70.597 Y68.636 E0.02127
G1 X70.026 Y66.505 E0.1032
G1 X70.913 Y66.339 E0.04222
G1 X71.559 Y68.749 E0.11667
G1 X72.456 Y68.619 E0.04239
G1 X71.883 Y66.481 E0.10354
G1 X72.772 Y66.321 E0.04224
G1 X73.419 Y68.736 E0.11695
G1 X74.313 Y68.596 E0.04233
G1 X74.009 Y67.46 E0.05502
G1 X73.74 Y66.457 E0.04859
G1 X74.63 Y66.303 E0.04227
G1 X74.915 Y67.365 E0.05145
G1 X75.119 Y68.125 E0.03677
G1 X75.241 Y68.581 E0.02209
G1 X75.282 Y68.734 E0.00741
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X74.63 Y66.303 E0 F3312
G1 X73.74 Y66.457 E0
G1 X74.149 Y67.982 E0
G1 X74.149 Y67.982 Z9.0125 E0 F900
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X77.939 Y68.218 E0 F9000
G1 X77.939 Y68.218 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X77.983 Y68.382 E0.00794 F2070
G1 X78.114 Y68.873 E0.02381
G1 X78.334 Y69.693 E0.0397
G1 X78.642 Y70.841 E0.05556
G1 X79.037 Y72.316 E0.07145
G1 X79.52 Y74.12 E0.08732
G1 X80.091 Y76.251 E0.1032
G1 X80.118 Y76.198 E0.00276
G1 X80.387 Y75.703 E0.02637
G1 X80.727 Y75.147 E0.03048
G1 X80.333 Y73.675 E0.07128
G1 X80.026 Y72.53 E0.05544
G1 X79.807 Y71.712 E0.03961
G1 X79.675 Y71.221 E0.02378
G1 X79.631 Y71.057 E0.00794
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X80.727 Y75.147 E0 F3312
G1 X80.387 Y75.703 E0
G1 X80.333 Y75.803 E0
G1 X80.333 Y75.803 Z9.0125 E0 F900
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X76.723 Y70.637 E0 F9000
G1 X76.723 Y70.637 Z8.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X76.678 Y70.469 E0.00814 F2070
G1 X76.543 Y69.964 E0.02441
G1 X76.318 Y69.124 E0.0407
G1 X76.003 Y67.948 E0.05697
G1 X75.778 Y67.107 E0.04069
G1 X75.643 Y66.603 E0.02441
G1 X75.598 Y66.435 E0.00814
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X76.491 Y66.294 E0 F9000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for End-Of-Layer
G1 X76.538 Y66.467 E0.00837 F2070
G1 X76.677 Y66.985 E0.0251
G1 X76.908 Y67.849 E0.04184
G1 X77.232 Y69.059 E0.05857
G1 X77.649 Y70.614 E0.07531
G1 X78.297 Y73.033 E0.11714
G1 X78.714 Y74.588 E0.07531
G1 X79.038 Y75.798 E0.05857
G1 X79.27 Y76.662 E0.04184
G1 X79.409 Y77.18 E0.0251
G1 X79.455 Y77.353 E0.00837
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.161 Y72.523 E0 F3312
; time estimate: pre = 14.150640, post = 22.737698
; Dwell time remaining = -12.737699
;
; Post-layer lift
G1 X78.161 Y72.523 Z9.2625 E0 F900
; END_LAYER_OBJECT z=8.512
; BEGIN_LAYER_OBJECT z=8.762 z_thickness=0.250
; fan %*255
M106 S255
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z9.2625 E0 F9000
G1 X80.987 Y75.246 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z9.2625 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z9.2625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X77.927 Y80 E0 F9000
G1 X77.927 Y80 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X77.753 Y80.046 E0.0084 F2070
G1 X77.233 Y80.186 E0.0252
G1 X76.365 Y80.418 E0.042
G1 X75.151 Y80.744 E0.0588
G1 X74.457 Y80.93 E0.0336
G1 X73.243 Y81.255 E0.0588
G1 X72.375 Y81.487 E0.042
G1 X71.855 Y81.627 E0.0252
G1 X71.682 Y81.673 E0.0084
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.511 Y80.379 E0 F3312
G1 X76.511 Y80.379 Z9.2625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X69.882 Y79.36 E0 F9000
G1 X69.882 Y79.36 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X69.723 Y79.403 E0.00766 F2070
G1 X69.249 Y79.53 E0.02297
G1 X68.458 Y79.741 E0.03829
G1 X67.351 Y80.037 E0.05361
G1 X67.014 Y79.679 E0.02298
G1 X66.636 Y79.324 E0.0243
G1 X66.74 Y79.27 E0.00548
G1 X67.745 Y79.001 E0.04864
G1 X68.872 Y78.699 E0.05459
G1 X68.571 Y77.848 E0.04222
G1 X66.16 Y78.494 E0.11672
G1 X65.826 Y77.652 E0.04238
G1 X67.964 Y77.079 E0.10355
G1 X67.657 Y76.229 E0.04225
G1 X65.242 Y76.877 E0.11697
G1 X64.916 Y76.032 E0.04233
G1 X67.056 Y75.459 E0.10362
G1 X66.743 Y74.611 E0.04227
G1 X64.325 Y75.259 E0.1171
G1 X64.008 Y74.412 E0.04229
; Prepare for Destring
G1 X66.542 Y73.728 E0.12279
G1 X66.826 Y73.167 E0.0294
G1 X67.136 Y72.642 E0.0285
G1 X67.118 Y72.647 E0.0009
G1 X63.891 Y73.511 E0.15622
G1 X63.923 Y73.462 E0.00276
G1 X64.218 Y72.981 E0.02637
G1 X64.529 Y72.409 E0.03048
G1 X67.782 Y71.531 E0.15759
G1 X68.088 Y70.971 E0.02985
G1 X68.409 Y70.437 E0.02911
G1 X68.39 Y70.442 E0.00091
G1 X66.668 Y70.904 E0.08337
G1 X65.164 Y71.307 E0.07284
G1 X65.196 Y71.257 E0.00276
G1 X65.491 Y70.777 E0.02637
G1 X65.802 Y70.204 E0.03048
G1 X66.969 Y69.892 E0.0565
G1 X67.877 Y69.648 E0.04395
G1 X68.525 Y69.475 E0.03141
G1 X68.915 Y69.37 E0.01886
G1 X69.045 Y69.335 E0.00632
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.802 Y70.204 E0 F3312
G1 X65.491 Y70.777 E0
G1 X65.196 Y71.257 E0
G1 X65.164 Y71.307 E0
G1 X65.52 Y71.212 E0
G1 X65.52 Y71.212 Z9.2625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X66.437 Y69.102 E0 F9000
G1 X66.437 Y69.102 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X66.596 Y69.06 E0.00771 F2070
G1 X67.074 Y68.932 E0.02314
G1 X67.87 Y68.719 E0.03855
G1 X68.985 Y68.42 E0.05398
G1 X70.419 Y68.037 E0.06941
G1 X72.171 Y67.568 E0.08482
G1 X74.241 Y67.014 E0.10025
G1 X76.63 Y66.374 E0.11567
G1 X77.045 Y66.687 E0.0243
G1 X77.498 Y67.029 E0.02653
G1 X77.348 Y67.111 E0.00797
G1 X75.551 Y67.592 E0.08702
G1 X74.08 Y67.986 E0.07121
G1 X72.937 Y68.293 E0.05538
G1 X72.12 Y68.511 E0.03955
G1 X71.629 Y68.643 E0.02374
G1 X71.466 Y68.687 E0.00791
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.296 Y67.392 E0 F3312
G1 X76.296 Y67.392 Z9.2625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X69.646 Y66.379 E0 F9000
G1 X69.646 Y66.379 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X69.525 Y66.412 E0.00588 F2070
G1 X69.161 Y66.51 E0.01762
G1 X68.555 Y66.675 E0.02938
G1 X67.706 Y66.905 E0.04113
G1 X67.4 Y67.47 E0.03005
G1 X67.073 Y68 E0.02913
G1 X67.088 Y67.996 E0.00068
G1 X68.991 Y67.486 E0.09219
G1 X70.549 Y67.069 E0.07543
G1 X71.761 Y66.744 E0.05867
G1 X72.626 Y66.512 E0.0419
G1 X73.145 Y66.373 E0.02514
G1 X73.318 Y66.327 E0.00838
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.489 Y67.621 E0 F3312
G1 X68.489 Y67.621 Z9.2625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X75.118 Y68.64 E0 F9000
G1 X75.118 Y68.64 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X75.277 Y68.597 E0.00766 F2070
G1 X75.751 Y68.47 E0.02297
G1 X76.542 Y68.259 E0.03829
G1 X77.649 Y67.963 E0.05361
G1 X77.986 Y68.321 E0.02298
G1 X78.364 Y68.676 E0.0243
G1 X78.26 Y68.73 E0.00548
G1 X77.255 Y68.999 E0.04864
G1 X76.128 Y69.301 E0.05459
G1 X76.429 Y70.152 E0.04222
G1 X78.84 Y69.506 E0.11672
G1 X79.174 Y70.348 E0.04238
G1 X77.036 Y70.921 E0.10355
G1 X77.343 Y71.771 E0.04225
G1 X79.758 Y71.123 E0.11697
G1 X80.084 Y71.968 E0.04233
G1 X77.944 Y72.541 E0.10362
G1 X78.257 Y73.389 E0.04227
G1 X80.675 Y72.741 E0.1171
G1 X80.992 Y73.588 E0.04229
; Prepare for Destring
G1 X78.458 Y74.272 E0.12279
G1 X78.174 Y74.833 E0.0294
G1 X77.864 Y75.358 E0.0285
G1 X77.882 Y75.353 E0.0009
G1 X81.109 Y74.489 E0.15622
G1 X81.077 Y74.538 E0.00276
G1 X80.782 Y75.019 E0.02636
G1 X80.471 Y75.591 E0.03049
G1 X77.218 Y76.469 E0.15759
G1 X76.912 Y77.029 E0.02985
G1 X76.591 Y77.563 E0.02911
G1 X76.61 Y77.558 E0.00091
G1 X78.332 Y77.096 E0.08337
G1 X79.836 Y76.693 E0.07284
G1 X79.804 Y76.743 E0.00276
G1 X79.509 Y77.223 E0.02637
G1 X79.198 Y77.796 E0.03048
G1 X78.03 Y78.109 E0.05653
G1 X77.122 Y78.352 E0.04397
G1 X76.474 Y78.526 E0.03141
G1 X76.084 Y78.63 E0.01885
G1 X75.955 Y78.665 E0.00628
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X79.198 Y77.796 E0 F3312
G1 X79.509 Y77.223 E0
G1 X79.804 Y76.743 E0
G1 X79.836 Y76.693 E0
G1 X79.48 Y76.788 E0
G1 X79.48 Y76.788 Z9.2625 E0 F900
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 94%
; fan %*255
M106 S240
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X73.534 Y79.313 E0 F9000
G1 X73.534 Y79.313 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X73.371 Y79.357 E0.00791 F2070
G1 X72.88 Y79.489 E0.02374
G1 X72.063 Y79.707 E0.03955
; Prepare for End-Of-Layer
G1 X70.92 Y80.014 E0.05538
G1 X69.449 Y80.408 E0.07121
G1 X67.652 Y80.889 E0.08702
G1 X67.502 Y80.971 E0.00797
G1 X67.955 Y81.313 E0.02654
G1 X68.374 Y81.628 E0.0245
G1 X76.572 Y79.431 E0.39697
G1 X78.563 Y78.898 E0.0964
G1 X78.531 Y78.947 E0.00276
G1 X78.235 Y79.432 E0.02656
G1 X77.812 Y80.177 E0.0401
G1 X77.405 Y80.889 E0.03832
G1 X77.289 Y81.103 E0.0114
G1 X76.442 Y81.329 E0.04098
G1 X75.838 Y81.491 E0.02927
G1 X75.475 Y81.589 E0.01757
G1 X75.354 Y81.621 E0.00585
; Blending Fan to Cool (83.3% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X77.289 Y81.103 E0 F3312
G1 X77.405 Y80.889 E0
G1 X77.812 Y80.177 E0
G1 X78.235 Y79.432 E0
G1 X78.531 Y78.947 E0
G1 X78.563 Y78.898 E0
G1 X78.128 Y79.014 E0
G1 X78.128 Y79.014 Z9.2625 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 4.674408 [s], Slowing (0.376x) to 10.0 [s] ***
; fan %*255
M106 S255
;
; 'Loop Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X75.962 Y75.285 Z9.2625 E0 F9000
G1 X75.962 Y75.285 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.836802, filament speed 0.647176, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F830.2
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.755201, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1245.3
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z9.2625 E0 F900
; Fan set to Cool value 100%
;
; 'Sparse Infill Path', 0.6 [feed mm/s], 13.0 [head mm/s]
G1 X70.579 Y70.788 E0 F9000
G1 X70.579 Y70.788 Z8.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 12.972000, filament speed 0.606727, preload 0.000000
G1 X70.819 Y70.723 E0.01165 F778.3
G1 X70.768 Y70.771 E0.00325
G1 X70.438 Y71.116 E0.02236
G1 X70.043 Y71.718 E0.03367
G1 X69.914 Y71.898 E0.01033
G1 X69.941 Y71.89 E0.00131
G1 X71.143 Y71.568 E0.05819
G1 X72.664 Y71.161 E0.07362
G1 X74.503 Y70.668 E0.08906
G1 X74.832 Y71.512 E0.04235
G1 X69.261 Y73.01 E0.26983
G1 X68.972 Y73.556 E0.02891
G1 X68.669 Y74.095 E0.02889
G1 X68.687 Y74.09 E0.00087
G1 X75.42 Y72.286 E0.32602
G1 X75.741 Y73.132 E0.04231
G1 X69.259 Y74.868 E0.31388
G1 X69.58 Y75.714 E0.04231
; Prepare for End-Of-Layer
G1 X76.331 Y73.905 E0.32689
G1 X76.303 Y73.953 E0.00257
G1 X76.027 Y74.446 E0.02644
G1 X75.739 Y74.99 E0.0288
G1 X70.168 Y76.488 E0.26983
G1 X70.497 Y77.332 E0.04235
G1 X72.371 Y76.83 E0.09072
G1 X73.9 Y76.42 E0.07406
G1 X75.086 Y76.102 E0.0574
G1 X75.053 Y76.154 E0.00286
G1 X74.755 Y76.652 E0.02711
G1 X74.442 Y77.2 E0.02955
G1 X74.181 Y77.277 E0.01274
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.8 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.755201, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X74.442 Y77.2 E0 F1245.3
G1 X74.755 Y76.652 E0
G1 X75.053 Y76.154 E0
G1 X75.086 Y76.102 E0
G1 X71.748 Y76.997 E0
; time estimate: pre = 10.011876, post = 23.448536
; Dwell time remaining = -13.448535
;
; Post-layer lift
G1 X71.748 Y76.997 Z9.5125 E0 F900
; END_LAYER_OBJECT z=8.762
; BEGIN_LAYER_OBJECT z=9.012 z_thickness=0.250
; *** Estimate 4.670692 [s], Slowing (0.375x) to 10.0 [s] ***
;
; 'Loop Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X75.962 Y75.285 Z9.5125 E0 F9000
G1 X75.962 Y75.285 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.800002, filament speed 0.645455, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F828
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.700003, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1242
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z9.5125 E0 F900
; Fan set to Cool value 100%
;
; 'Sparse Infill Path', 0.6 [feed mm/s], 12.9 [head mm/s]
G1 X69.068 Y73.363 E0 F9000
G1 X69.068 Y73.363 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 12.937500, filament speed 0.605114, preload 0.000000
G1 X69.114 Y73.521 E0.00769 F776.2
G1 X69.252 Y73.994 E0.02307
G1 X69.483 Y74.783 E0.03844
G1 X69.805 Y75.888 E0.05383
G1 X70.272 Y76.586 E0.03926
G1 X70.578 Y77.421 E0.04161
G1 X71.005 Y77.755 E0.02537
G1 X71.064 Y77.335 E0.01983
G1 X69.706 Y72.243 E0.2465
G1 X70.032 Y71.704 E0.02948
G1 X70.341 Y71.159 E0.02931
G1 X70.347 Y71.182 E0.00112
G1 X71.955 Y77.177 E0.29031
G1 X72.434 Y77.291 E0.02303
G1 X72.93 Y77.435 E0.02418
G1 X72.923 Y77.317 E0.00556
G1 X71.189 Y70.847 E0.31325
G1 X72.073 Y70.681 E0.04207
G1 X72.096 Y70.753 E0.00358
; Prepare for End-Of-Layer
G1 X73.822 Y77.197 E0.31199
G1 X74.681 Y76.923 E0.04214
G1 X73.046 Y70.824 E0.29536
G1 X73.935 Y70.661 E0.04224
G1 X74.453 Y72.595 E0.09368
G1 X74.907 Y74.288 E0.08197
G1 X75.295 Y75.739 E0.07026
G1 X75.323 Y75.688 E0.00273
G1 X75.606 Y75.191 E0.02671
G1 X75.931 Y74.655 E0.02935
G1 X75.647 Y73.586 E0.05172
G1 X75.444 Y72.823 E0.03694
G1 X75.323 Y72.365 E0.02217
G1 X75.282 Y72.212 E0.00738
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 20.7 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 20.700003, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.931 Y74.655 E0 F1242
G1 X75.606 Y75.191 E0
G1 X75.323 Y75.688 E0
G1 X75.295 Y75.739 E0
G1 X74.981 Y74.565 E0
G1 X74.981 Y74.565 Z9.5125 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z9.5125 E0 F9000
G1 X80.987 Y75.246 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z9.5125 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X77.949 Y75.211 E0 F9000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X77.984 Y75.341 E0.00629 F2070
G1 X78.087 Y75.731 E0.01889
G1 X78.26 Y76.381 E0.03147
G1 X78.503 Y77.292 E0.04407
G1 X78.814 Y78.462 E0.05665
G1 X78.478 Y79.01 E0.03006
G1 X78.182 Y79.558 E0.02912
G1 X78.178 Y79.543 E0.00069
G1 X77.775 Y78.037 E0.07294
G1 X77.313 Y76.313 E0.08349
G1 X77.286 Y76.364 E0.00271
G1 X77.009 Y76.861 E0.0266
G1 X76.679 Y77.402 E0.02965
G1 X77.546 Y80.672 E0.15823
G1 X77.221 Y81.108 E0.0254
G1 X76.884 Y81.538 E0.02556
G1 X76.827 Y81.454 E0.00478
G1 X76.04 Y78.517 E0.14217
G1 X76.028 Y78.534 E0.00097
G1 X75.715 Y78.948 E0.02428
G1 X75.293 Y79.206 E0.02313
G1 X75.944 Y81.638 E0.11776
G1 X75.951 Y81.756 E0.00555
G1 X75.45 Y81.608 E0.02442
G1 X74.974 Y81.495 E0.0229
G1 X74.403 Y79.364 E0.10317
G1 X73.885 Y79.352 E0.02422
G1 X73.455 Y79.264 E0.02055
G1 X73.447 Y79.274 E0.00059
; Prepare for Destring
G1 X74.086 Y81.657 E0.1154
G1 X74.093 Y81.775 E0.00555
G1 X73.594 Y81.632 E0.0243
G1 X73.117 Y81.519 E0.02293
G1 X72.544 Y79.381 E0.10352
G1 X71.773 Y79.32 E0.03616
G1 X71.583 Y79.273 E0.00915
G1 X72.227 Y81.675 E0.11631
G1 X72.235 Y81.791 E0.00546
G1 X71.736 Y81.652 E0.0242
G1 X71.26 Y81.542 E0.02289
G1 X70.687 Y79.405 E0.10346
G1 X69.863 Y79.297 E0.03887
G1 X69.718 Y79.266 E0.00691
G1 X70.368 Y81.692 E0.11743
G1 X69.932 Y81.631 E0.02059
G1 X69.407 Y81.581 E0.02466
G1 X69 Y80.063 E0.07347
G1 X68.684 Y78.883 E0.05716
G1 X68.458 Y78.039 E0.04085
G1 X68.322 Y77.533 E0.02453
G1 X68.277 Y77.363 E0.00821
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.407 Y81.581 E0 F3312
G1 X69.932 Y81.631 E0
G1 X70.037 Y81.646 E0
G1 X70.037 Y81.646 Z9.5125 E0 F900
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X65.369 Y76.943 E0 F9000
G1 X65.369 Y76.943 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X65.325 Y76.779 E0.00794 F2070
G1 X65.194 Y76.287 E0.0238
G1 X64.976 Y75.468 E0.03968
G1 X64.67 Y74.32 E0.05555
G1 X64.277 Y72.845 E0.07141
G1 X64.613 Y72.297 E0.03006
G1 X64.909 Y71.749 E0.02912
G1 X64.913 Y71.763 E0.00069
G1 X67.136 Y79.891 E0.39413
G1 X67.62 Y80.613 E0.04065
G1 X67.896 Y81.264 E0.03307
G1 X68.509 Y81.706 E0.03532
G1 X68.502 Y81.682 E0.00116
G1 X65.549 Y70.64 E0.53461
G1 X65.885 Y70.092 E0.03005
G1 X66.182 Y69.545 E0.02913
G1 X66.185 Y69.559 E0.00068
G1 X67.051 Y72.789 E0.15643
G1 X67.078 Y72.738 E0.00272
G1 X67.354 Y72.241 E0.02659
G1 X67.685 Y71.7 E0.02966
G1 X66.822 Y68.436 E0.15793
G1 X67.158 Y67.888 E0.03005
G1 X67.454 Y67.34 E0.02912
G1 X67.458 Y67.354 E0.00069
G1 X68.324 Y70.585 E0.15643
G1 X68.351 Y70.533 E0.00272
G1 X68.627 Y70.037 E0.02659
G1 X68.958 Y69.495 E0.02966
G1 X68.173 Y66.546 E0.14273
G1 X69.054 Y66.356 E0.04214
; Prepare for Destring
G1 X69.707 Y68.794 E0.11805
G1 X70.148 Y68.71 E0.02099
G1 X70.597 Y68.636 E0.02127
G1 X70.026 Y66.505 E0.1032
G1 X70.913 Y66.339 E0.04222
G1 X71.559 Y68.749 E0.11667
G1 X72.456 Y68.619 E0.04239
G1 X71.883 Y66.481 E0.10354
G1 X72.772 Y66.321 E0.04224
G1 X73.419 Y68.736 E0.11695
G1 X74.313 Y68.596 E0.04233
G1 X74.009 Y67.46 E0.05502
G1 X73.74 Y66.457 E0.04859
G1 X74.63 Y66.303 E0.04227
G1 X74.915 Y67.365 E0.05145
G1 X75.119 Y68.125 E0.03677
G1 X75.241 Y68.581 E0.02209
G1 X75.282 Y68.734 E0.00741
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X74.63 Y66.303 E0 F3312
G1 X73.74 Y66.457 E0
G1 X74.149 Y67.982 E0
G1 X74.149 Y67.982 Z9.5125 E0 F900
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X77.939 Y68.218 E0 F9000
G1 X77.939 Y68.218 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for Destring
G1 X77.983 Y68.382 E0.00794 F2070
G1 X78.114 Y68.873 E0.02381
G1 X78.334 Y69.693 E0.0397
G1 X78.642 Y70.841 E0.05556
G1 X79.037 Y72.316 E0.07145
G1 X79.52 Y74.12 E0.08732
G1 X80.091 Y76.251 E0.1032
G1 X80.118 Y76.198 E0.00276
G1 X80.387 Y75.703 E0.02637
G1 X80.727 Y75.147 E0.03048
G1 X80.333 Y73.675 E0.07128
G1 X80.026 Y72.53 E0.05544
G1 X79.807 Y71.712 E0.03961
G1 X79.675 Y71.221 E0.02378
G1 X79.631 Y71.057 E0.00794
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X80.727 Y75.147 E0 F3312
G1 X80.387 Y75.703 E0
G1 X80.333 Y75.803 E0
G1 X80.333 Y75.803 Z9.5125 E0 F900
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
; fan %*255
M106 S242
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X76.723 Y70.637 E0 F9000
G1 X76.723 Y70.637 Z9.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
G1 X76.678 Y70.469 E0.00814 F2070
G1 X76.543 Y69.964 E0.02441
G1 X76.318 Y69.124 E0.0407
G1 X76.003 Y67.948 E0.05697
G1 X75.778 Y67.107 E0.04069
G1 X75.643 Y66.603 E0.02441
G1 X75.598 Y66.435 E0.00814
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 95%
;
; 'Sparse Infill Path', 1.6 [feed mm/s], 34.5 [head mm/s]
G1 X76.491 Y66.294 E0 F9000
; head speed 34.500000, filament speed 1.613636, preload 0.000000
; Prepare for End-Of-Layer
G1 X76.538 Y66.467 E0.00837 F2070
G1 X76.677 Y66.985 E0.0251
G1 X76.908 Y67.849 E0.04184
G1 X77.232 Y69.059 E0.05857
G1 X77.649 Y70.614 E0.07531
G1 X78.297 Y73.033 E0.11714
G1 X78.714 Y74.588 E0.07531
G1 X79.038 Y75.798 E0.05857
G1 X79.27 Y76.662 E0.04184
G1 X79.409 Y77.18 E0.0251
G1 X79.455 Y77.353 E0.00837
; Blending Fan to Cool (86.2% blend)
; Blended Fan at 99%
; fan %*255
M106 S252
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.161 Y72.523 E0 F3312
; time estimate: pre = 14.150640, post = 22.737698
; Dwell time remaining = -12.737699
;
; Post-layer lift
G1 X78.161 Y72.523 Z9.7625 E0 F900
; END_LAYER_OBJECT z=9.012
; BEGIN_LAYER_OBJECT z=9.262 z_thickness=0.250
; fan %*255
M106 S255
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z9.7625 E0 F9000
G1 X80.987 Y75.246 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z9.7625 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X78.398 Y78.942 E0 F9000
G1 X78.398 Y78.942 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X78.244 Y78.983 E0.00744 F2760
G1 X77.783 Y79.107 E0.02233
G1 X77.015 Y79.313 E0.0372
G1 X75.939 Y79.601 E0.05209
G1 X74.556 Y79.971 E0.06697
G1 X72.404 Y80.548 E0.10418
G1 X71.021 Y80.918 E0.06697
G1 X69.946 Y81.207 E0.05209
G1 X69.177 Y81.413 E0.03721
G1 X68.716 Y81.536 E0.02232
G1 X68.562 Y81.577 E0.00744
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X73.392 Y80.283 E0 F3312
G1 X73.392 Y80.283 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X70.3 Y81.578 E0 F9000
G1 X70.3 Y81.578 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X70.456 Y81.536 E0.0076 F2760
G1 X70.927 Y81.41 E0.02279
G1 X71.712 Y81.199 E0.03798
G1 X72.81 Y80.905 E0.05318
G1 X74.222 Y80.527 E0.06838
G1 X75.948 Y80.064 E0.08356
G1 X77.987 Y79.518 E0.09876
G1 X77.98 Y79.531 E0.00073
G1 X77.653 Y80.073 E0.02959
G1 X75.938 Y80.533 E0.08305
G1 X74.535 Y80.909 E0.06795
G1 X73.443 Y81.201 E0.05285
G1 X72.664 Y81.41 E0.03775
G1 X72.196 Y81.535 E0.02265
G1 X72.04 Y81.577 E0.00755
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.87 Y80.283 E0 F3312
G1 X76.87 Y80.283 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X73.779 Y81.577 E0 F9000
G1 X73.779 Y81.577 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X73.922 Y81.539 E0.00692 F2760
G1 X74.35 Y81.424 E0.02076
G1 X75.065 Y81.233 E0.03459
G1 X76.065 Y80.965 E0.04843
G1 X77.351 Y80.62 E0.06227
G1 X77.343 Y80.634 E0.00072
G1 X77.017 Y81.175 E0.02959
G1 X76.183 Y81.399 E0.04037
G1 X75.683 Y81.533 E0.02423
G1 X75.516 Y81.578 E0.00809
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.017 Y81.175 E0 F3312
G1 X77.343 Y80.634 E0
G1 X77.351 Y80.62 E0
G1 X74.648 Y81.344 E0
G1 X74.648 Y81.344 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X74.931 Y79.405 E0 F9000
G1 X74.931 Y79.405 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X74.739 Y79.456 E0.0093 F2760
G1 X74.163 Y79.611 E0.02789
G1 X73.203 Y79.868 E0.04649
G1 X71.859 Y80.228 E0.06509
G1 X70.131 Y80.691 E0.08369
G1 X68.018 Y81.257 E0.10228
G1 X67.786 Y80.854 E0.02178
G1 X69.428 Y80.414 E0.07953
G1 X70.772 Y80.054 E0.06507
G1 X71.817 Y79.773 E0.05061
G1 X72.564 Y79.573 E0.03616
G1 X73.012 Y79.453 E0.02171
G1 X73.162 Y79.413 E0.00725
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.332 Y80.707 E0 F3312
G1 X68.332 Y80.707 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.423 Y79.413 E0 F9000
G1 X71.423 Y79.413 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X71.268 Y79.455 E0.00749 F2760
G1 X70.804 Y79.579 E0.02249
G1 X70.03 Y79.786 E0.03748
G1 X68.947 Y80.077 E0.05246
G1 X67.554 Y80.45 E0.06746
G1 X67.321 Y80.047 E0.02179
G1 X68.452 Y79.743 E0.0548
G1 X69.715 Y79.405 E0.06117
G1 X69.7 Y79.397 E0.00082
G1 X69.115 Y79.1 E0.03069
G1 X67.086 Y79.644 E0.09823
G1 X66.854 Y79.24 E0.02177
G1 X68.882 Y78.696 E0.09818
G1 X68.649 Y78.293 E0.02179
G1 X66.622 Y78.836 E0.09815
G1 X66.388 Y78.433 E0.0218
G1 X68.417 Y77.889 E0.09822
G1 X68.184 Y77.486 E0.02178
G1 X66.155 Y78.03 E0.09827
G1 X65.923 Y77.626 E0.02178
G1 X67.95 Y77.083 E0.09816
G1 X67.717 Y76.679 E0.02179
G1 X65.69 Y77.222 E0.09815
G1 X65.456 Y76.819 E0.0218
G1 X67.485 Y76.275 E0.09826
G1 X67.252 Y75.872 E0.0218
G1 X65.223 Y76.416 E0.09823
G1 X64.991 Y76.012 E0.02178
G1 X67.018 Y75.469 E0.09816
G1 X66.786 Y75.065 E0.02178
G1 X64.758 Y75.609 E0.09818
G1 X64.524 Y75.205 E0.02181
G1 X66.556 Y74.661 E0.0984
G1 X66.393 Y74.239 E0.02116
G1 X64.292 Y74.802 E0.10175
G1 X64.06 Y74.398 E0.02178
G1 X66.392 Y73.772 E0.11295
G1 X66.607 Y73.262 E0.02589
G1 X66.601 Y73.251 E0.00059
G1 X63.867 Y73.984 E0.13236
G1 X63.873 Y73.972 E0.00061
G1 X64.147 Y73.443 E0.02785
G1 X66.923 Y72.698 E0.13445
G1 X67.24 Y72.148 E0.02965
G1 X67.224 Y72.153 E0.00076
G1 X64.467 Y72.891 E0.1335
G1 X64.475 Y72.878 E0.00073
G1 X64.801 Y72.336 E0.02957
G1 X67.559 Y71.595 E0.13358
G1 X67.876 Y71.046 E0.02966
G1 X67.861 Y71.05 E0.00075
G1 X65.104 Y71.789 E0.1335
G1 X65.111 Y71.776 E0.00073
G1 X65.437 Y71.234 E0.02958
G1 X68.195 Y70.493 E0.13358
G1 X68.513 Y69.944 E0.02965
G1 X68.497 Y69.948 E0.00076
G1 X65.74 Y70.687 E0.1335
G1 X65.748 Y70.673 E0.00073
G1 X66.074 Y70.131 E0.02957
G1 X68.814 Y69.383 E0.13289
G1 X69.408 Y68.772 E0.03981
G1 X69.381 Y68.779 E0.00128
G1 X66.376 Y69.584 E0.1455
G1 X66.384 Y69.571 E0.00073
G1 X66.71 Y69.029 E0.02959
G1 X68.989 Y68.419 E0.11033
G1 X70.964 Y67.889 E0.09563
G1 X72.635 Y67.442 E0.08093
G1 X74.003 Y67.075 E0.06622
G1 X75.067 Y66.79 E0.05153
G1 X75.827 Y66.586 E0.03682
G1 X76.284 Y66.464 E0.02212
G1 X76.438 Y66.423 E0.00743
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X77.049 Y66.725 E0 F9000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X76.907 Y66.763 E0.0069 F2760
G1 X76.479 Y66.877 E0.02069
G1 X75.767 Y67.068 E0.03449
G1 X74.77 Y67.335 E0.04829
G1 X72.348 Y67.984 E0.11726
G1 X71.351 Y68.252 E0.04829
G1 X70.639 Y68.442 E0.03449
G1 X70.211 Y68.557 E0.02069
G1 X70.069 Y68.595 E0.0069
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X74.898 Y67.301 E0 F3312
G1 X74.898 Y67.301 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X69.419 Y66.44 E0 F9000
G1 X69.419 Y66.44 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X69.258 Y66.483 E0.00782 F2760
G1 X68.773 Y66.614 E0.02346
G1 X67.966 Y66.831 E0.03909
G1 X67.649 Y67.38 E0.02966
G1 X67.665 Y67.376 E0.00077
G1 X68.945 Y67.033 E0.06199
G1 X69.941 Y66.766 E0.04822
G1 X70.652 Y66.575 E0.03443
G1 X71.079 Y66.461 E0.02067
G1 X71.221 Y66.423 E0.00689
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X67.665 Y67.376 E0 F3312
G1 X67.649 Y67.38 E0
G1 X67.966 Y66.831 E0
G1 X68.611 Y66.657 E0
G1 X68.611 Y66.657 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.838 Y68.587 E0 F9000
G1 X71.838 Y68.587 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X71.987 Y68.547 E0.00723 F2760
G1 X72.435 Y68.427 E0.0217
G1 X73.182 Y68.227 E0.03615
G1 X74.227 Y67.947 E0.05062
G1 X75.571 Y67.587 E0.06509
G1 X77.214 Y67.146 E0.07954
G1 X77.446 Y67.55 E0.02178
G1 X76.053 Y67.923 E0.06746
G1 X74.97 Y68.214 E0.05246
G1 X74.196 Y68.421 E0.03748
G1 X73.732 Y68.545 E0.02248
G1 X73.577 Y68.587 E0.0075
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.446 Y67.55 E0 F3312
G1 X77.214 Y67.146 E0
G1 X76.704 Y67.283 E0
G1 X76.704 Y67.283 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X72.96 Y66.423 E0 F9000
G1 X72.96 Y66.423 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X72.804 Y66.465 E0.00757 F2760
G1 X72.334 Y66.591 E0.02272
G1 X71.552 Y66.8 E0.03787
G1 X70.458 Y67.094 E0.05302
G1 X69.05 Y67.472 E0.06816
G1 X67.33 Y67.933 E0.0833
G1 X67.013 Y68.482 E0.02966
G1 X67.029 Y68.478 E0.00077
G1 X69.064 Y67.933 E0.09856
G1 X70.786 Y67.471 E0.08339
G1 X72.195 Y67.094 E0.06824
G1 X73.291 Y66.8 E0.05307
G1 X74.074 Y66.59 E0.0379
G1 X74.544 Y66.464 E0.02275
G1 X74.7 Y66.422 E0.00758
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.871 Y67.716 E0 F3312
G1 X69.871 Y67.716 Z9.7625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X75.189 Y68.621 E0 F9000
G1 X75.189 Y68.621 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X75.345 Y68.579 E0.00754 F2760
G1 X75.812 Y68.454 E0.02261
G1 X76.59 Y68.245 E0.03769
G1 X77.679 Y67.953 E0.05276
G1 X77.914 Y68.357 E0.02181
G1 X76.947 Y68.616 E0.04683
G1 X75.842 Y68.912 E0.05349
G1 X76.12 Y69.303 E0.02245
G1 X78.146 Y68.76 E0.09807
G1 X78.378 Y69.164 E0.02179
G1 X76.351 Y69.707 E0.09815
G1 X76.583 Y70.111 E0.02178
G1 X78.612 Y69.567 E0.09823
G1 X78.845 Y69.97 E0.02179
G1 X76.816 Y70.514 E0.09827
G1 X77.05 Y70.917 E0.0218
G1 X79.077 Y70.374 E0.09815
G1 X79.31 Y70.778 E0.02179
G1 X77.283 Y71.321 E0.09816
G1 X77.515 Y71.725 E0.02177
G1 X79.544 Y71.181 E0.09827
G1 X79.777 Y71.584 E0.02179
G1 X77.748 Y72.128 E0.09822
G1 X77.982 Y72.531 E0.0218
G1 X80.009 Y71.988 E0.09816
G1 X80.242 Y72.391 E0.02179
G1 X78.214 Y72.935 E0.09818
G1 X78.446 Y73.339 E0.02177
G1 X80.476 Y72.795 E0.09831
G1 X80.708 Y73.198 E0.02178
G1 X78.609 Y73.761 E0.10162
G1 X78.594 Y74.231 E0.02199
G1 X80.941 Y73.602 E0.11365
G1 X81.154 Y74.011 E0.02156
G1 X78.395 Y74.751 E0.13358
G1 X78.078 Y75.301 E0.02966
G1 X78.094 Y75.296 E0.00076
G1 X80.851 Y74.558 E0.1335
G1 X80.843 Y74.571 E0.00072
G1 X80.517 Y75.113 E0.02958
G1 X77.752 Y75.865 E0.13402
G1 X77.442 Y76.403 E0.02904
G1 X77.458 Y76.399 E0.00075
; Prepare for End-Of-Layer
G1 X80.215 Y75.66 E0.1335
G1 X80.207 Y75.673 E0.00073
G1 X79.881 Y76.215 E0.02958
G1 X77.116 Y76.967 E0.13401
G1 X76.806 Y77.505 E0.02904
G1 X76.821 Y77.501 E0.00076
G1 X79.578 Y76.762 E0.1335
G1 X79.57 Y76.776 E0.00072
G1 X79.244 Y77.317 E0.02958
G1 X76.48 Y78.07 E0.13402
G1 X76.169 Y78.607 E0.02904
G1 X76.185 Y78.603 E0.00075
G1 X77.657 Y78.209 E0.0713
G1 X78.942 Y77.864 E0.0622
G1 X78.934 Y77.878 E0.00073
G1 X78.608 Y78.42 E0.02957
G1 X77.477 Y78.723 E0.05476
G1 X76.598 Y78.958 E0.0426
G1 X75.969 Y79.127 E0.03043
G1 X75.592 Y79.228 E0.01828
G1 X75.465 Y79.262 E0.00612
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.608 Y78.42 E0 F3312
G1 X78.934 Y77.878 E0
G1 X78.942 Y77.864 E0
G1 X77.881 Y78.149 E0
G1 X77.881 Y78.149 Z9.7625 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 5.748863 [s], Slowing (0.493x) to 10.0 [s] ***
; fan %*255
M106 S255
;
; 'Loop Path', 0.8 [feed mm/s], 18.1 [head mm/s]
G1 X75.962 Y75.285 Z9.7625 E0 F9000
G1 X75.962 Y75.285 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 18.142401, filament speed 0.848558, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F1088.5
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 9.1 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 9.071200, filament speed 0.424279, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F544.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1632.8
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z9.7625 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X74.288 Y77.248 E0 F9000
G1 X74.288 Y77.248 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for Destring
G1 X74.368 Y77.11 E0.00744 F1360.7
G1 X74.606 Y76.697 E0.0223
G1 X74.59 Y76.701 E0.00077
G1 X73.699 Y76.94 E0.04316
G1 X73.062 Y77.111 E0.03084
G1 X72.68 Y77.213 E0.0185
G1 X72.552 Y77.247 E0.00617
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X74.59 Y76.701 E0 F1632.8
G1 X74.606 Y76.697 E0
G1 X74.288 Y77.248 E0
G1 X74.288 Y77.248 Z9.7625 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X70.815 Y77.247 E0 F9000
G1 X70.815 Y77.247 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
G1 X70.98 Y77.202 E0.008 F1360.7
G1 X71.475 Y77.068 E0.02399
G1 X72.3 Y76.845 E0.03998
G1 X73.456 Y76.532 E0.05598
G1 X74.941 Y76.13 E0.07197
G1 X75.251 Y75.592 E0.02904
G1 X75.235 Y75.596 E0.00077
G1 X73.833 Y75.972 E0.06789
G1 X72.25 Y76.396 E0.07667
G1 X70.485 Y76.869 E0.08544
G1 X70.253 Y76.466 E0.02178
G1 X75.577 Y75.028 E0.25795
G1 X75.888 Y74.49 E0.02903
G1 X75.872 Y74.494 E0.00077
G1 X70.02 Y76.062 E0.28334
G1 X69.786 Y75.659 E0.02181
G1 X76.146 Y73.955 E0.30796
G1 X75.912 Y73.552 E0.02181
G1 X69.554 Y75.255 E0.30785
G1 X69.322 Y74.852 E0.02178
G1 X75.678 Y73.148 E0.30781
G1 X75.446 Y72.745 E0.02178
G1 X69.088 Y74.448 E0.30785
G1 X68.854 Y74.045 E0.02181
G1 X75.214 Y72.341 E0.30797
G1 X74.98 Y71.938 E0.02181
; Prepare for Destring
G1 X69.112 Y73.51 E0.2841
G1 X69.12 Y73.497 E0.00073
G1 X69.446 Y72.955 E0.02958
G1 X74.747 Y71.534 E0.25666
G1 X74.514 Y71.131 E0.02179
G1 X72.743 Y71.605 E0.08577
G1 X71.155 Y72.031 E0.07692
G1 X69.749 Y72.408 E0.06807
G1 X69.756 Y72.394 E0.00073
G1 X70.083 Y71.852 E0.02959
G1 X71.56 Y71.457 E0.07151
G1 X72.708 Y71.149 E0.05562
G1 X73.529 Y70.929 E0.03972
G1 X74.021 Y70.797 E0.02384
G1 X74.185 Y70.753 E0.00795
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X70.083 Y71.852 E0 F1632.8
G1 X69.756 Y72.394 E0
G1 X69.749 Y72.408 E0
G1 X69.85 Y72.381 E0
G1 X69.85 Y72.381 Z9.7625 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X72.448 Y70.753 E0 F9000
G1 X72.448 Y70.753 Z9.2625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.319 Y70.787 E0.00621 F1360.7
G1 X71.934 Y70.89 E0.01865
G1 X71.293 Y71.062 E0.03107
G1 X70.394 Y71.303 E0.0435
G1 X70.401 Y71.291 E0.00068
G1 X70.62 Y70.891 E0.02132
G1 X70.693 Y70.757 E0.00711
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.401 Y71.291 E0 F1632.8
G1 X70.394 Y71.303 E0
G1 X72.448 Y70.753 E0
; time estimate: pre = 9.986054, post = 24.798159
; Dwell time remaining = -14.798159
;
; Post-layer lift
G1 X72.448 Y70.753 Z10.0125 E0 F900
; END_LAYER_OBJECT z=9.262
; BEGIN_LAYER_OBJECT z=9.512 z_thickness=0.250
; *** Estimate 5.331194 [s], Slowing (0.454x) to 10.0 [s] ***
;
; 'Loop Path', 0.8 [feed mm/s], 16.7 [head mm/s]
G1 X75.962 Y75.285 Z10.0125 E0 F9000
G1 X75.962 Y75.285 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 16.707203, filament speed 0.781430, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F1002.4
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 8.9 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 8.888888, filament speed 0.415752, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F533.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 25.1 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 25.060802, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1503.6
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z10.0125 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.0 [feed mm/s], 20.9 [head mm/s]
G1 X69.662 Y75.578 E0 F9000
G1 X69.662 Y75.578 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 20.884001, filament speed 0.976788, preload 0.000000
G1 X69.628 Y75.448 E0.00627 F1253
G1 X69.526 Y75.059 E0.01883
G1 X69.355 Y74.41 E0.03137
G1 X69.117 Y73.502 E0.04392
G1 X69.427 Y72.965 E0.02904
G1 X69.431 Y72.98 E0.00075
G1 X69.737 Y74.121 E0.05523
G1 X70.097 Y75.462 E0.06497
G1 X70.511 Y77.005 E0.07471
G1 X71.02 Y77.169 E0.02502
G1 X71.017 Y77.157 E0.00059
G1 X69.753 Y72.4 E0.2302
G1 X70.064 Y71.862 E0.02904
G1 X70.068 Y71.878 E0.00077
G1 X71.488 Y77.179 E0.25666
G1 X71.954 Y77.178 E0.02179
G1 X70.38 Y71.302 E0.28455
G1 X70.72 Y70.836 E0.02698
G1 X70.724 Y70.848 E0.00059
G1 X72.42 Y77.18 E0.3066
G1 X72.886 Y77.179 E0.02177
G1 X71.182 Y70.821 E0.30785
G1 X71.648 Y70.822 E0.0218
G1 X73.352 Y77.178 E0.3078
G1 X73.818 Y77.179 E0.0218
G1 X72.114 Y70.821 E0.30785
G1 X72.58 Y70.82 E0.02177
G1 X74.28 Y77.164 E0.30719
G1 X74.287 Y77.154 E0.00059
G1 X74.62 Y76.696 E0.02649
; Prepare for End-Of-Layer
G1 X73.046 Y70.822 E0.28445
G1 X73.512 Y70.821 E0.02179
G1 X74.936 Y76.138 E0.25742
G1 X74.944 Y76.124 E0.00073
G1 X75.25 Y75.571 E0.02959
G1 X73.984 Y70.844 E0.22887
G1 X73.992 Y70.835 E0.00059
G1 X74.49 Y70.996 E0.02447
G1 X74.905 Y72.545 E0.07504
G1 X75.266 Y73.892 E0.06521
G1 X75.573 Y75.035 E0.05537
G1 X75.58 Y75.022 E0.00073
G1 X75.887 Y74.468 E0.02959
G1 X75.647 Y73.573 E0.04335
G1 X75.475 Y72.933 E0.03097
G1 X75.373 Y72.55 E0.01859
G1 X75.338 Y72.422 E0.00619
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 25.1 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 25.060802, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.887 Y74.468 E0 F1503.6
G1 X75.58 Y75.022 E0
G1 X75.573 Y75.035 E0
G1 X74.995 Y72.879 E0
G1 X74.995 Y72.879 Z10.0125 E0 F900
;
; *** Cooling Extruder 4 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z10.0125 E0 F9000
G1 X80.987 Y75.246 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z10.0125 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X81.001 Y74.432 E0 F9000
G1 X81.001 Y74.432 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X80.954 Y74.253 E0.00866 F2760
G1 X80.81 Y73.717 E0.02597
G1 X80.762 Y73.538 E0.00866
G1 X80.618 Y73.002 E0.02597
G1 X80.57 Y72.823 E0.00866
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.001 Y74.432 E0 F3312
G1 X81.001 Y74.432 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X79.701 Y71.319 E0 F9000
G1 X79.701 Y71.319 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X79.739 Y71.462 E0.00694 F2760
G1 X79.853 Y71.893 E0.02082
G1 X80.043 Y72.61 E0.03469
G1 X80.309 Y73.614 E0.04858
G1 X80.651 Y74.904 E0.06245
G1 X80.34 Y75.442 E0.02904
G1 X80.336 Y75.426 E0.00077
G1 X79.877 Y73.712 E0.08303
G1 X79.501 Y72.309 E0.06793
G1 X79.208 Y71.217 E0.05285
G1 X78.999 Y70.438 E0.03775
G1 X78.874 Y69.969 E0.02267
G1 X78.832 Y69.813 E0.00757
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X80.126 Y74.643 E0 F3312
G1 X80.126 Y74.643 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X77.519 Y71.867 E0 F9000
G1 X77.519 Y71.867 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X77.479 Y71.717 E0.00723 F2760
G1 X77.359 Y71.269 E0.0217
G1 X77.159 Y70.523 E0.03615
G1 X76.879 Y69.477 E0.05062
G1 X76.519 Y68.133 E0.06508
G1 X76.078 Y66.491 E0.07955
G1 X76.544 Y66.49 E0.02178
G1 X79.378 Y77.109 E0.51405
G1 X79.068 Y77.647 E0.02904
G1 X79.063 Y77.631 E0.00075
G1 X78.325 Y74.874 E0.1335
G1 X78.317 Y74.887 E0.00073
G1 X78.011 Y75.441 E0.02958
G1 X78.742 Y78.211 E0.13401
G1 X78.431 Y78.749 E0.02904
G1 X78.427 Y78.733 E0.00076
G1 X77.688 Y75.976 E0.1335
G1 X77.681 Y75.99 E0.00073
G1 X77.374 Y76.543 E0.02957
G1 X78.105 Y79.313 E0.13402
G1 X77.795 Y79.851 E0.02904
G1 X77.791 Y79.836 E0.00075
G1 X77.052 Y77.079 E0.1335
G1 X77.044 Y77.092 E0.00073
G1 X76.738 Y77.645 E0.02958
G1 X77.469 Y80.416 E0.13401
G1 X77.158 Y80.953 E0.02904
G1 X77.154 Y80.938 E0.00076
G1 X76.415 Y78.181 E0.1335
G1 X76.408 Y78.194 E0.00073
G1 X76.098 Y78.734 E0.02911
G1 X76.836 Y81.489 E0.1334
G1 X76.376 Y81.509 E0.02156
G1 X75.747 Y79.162 E0.11365
G1 X75.347 Y79.41 E0.02199
G1 X75.91 Y81.509 E0.10163
G1 X75.444 Y81.51 E0.02177
G1 X74.9 Y79.48 E0.09831
G1 X74.435 Y79.481 E0.02178
G1 X74.978 Y81.509 E0.09817
G1 X74.512 Y81.509 E0.02179
G1 X73.969 Y79.482 E0.09816
G1 X73.503 Y79.481 E0.0218
G1 X74.046 Y81.51 E0.09822
G1 X73.58 Y81.51 E0.02179
G1 X73.037 Y79.48 E0.09827
G1 X72.571 Y79.482 E0.02177
; Prepare for Destring
G1 X73.114 Y81.509 E0.09816
G1 X72.648 Y81.509 E0.02179
G1 X72.105 Y79.482 E0.09815
G1 X71.639 Y79.481 E0.02181
G1 X72.183 Y81.51 E0.09826
G1 X71.717 Y81.509 E0.0218
G1 X71.173 Y79.481 E0.09822
G1 X70.708 Y79.482 E0.02178
G1 X71.251 Y81.509 E0.09815
G1 X70.785 Y81.509 E0.02179
G1 X70.242 Y79.484 E0.09808
G1 X69.764 Y79.439 E0.02244
G1 X70.06 Y80.543 E0.05349
G1 X70.319 Y81.51 E0.04683
G1 X69.853 Y81.509 E0.02181
G1 X69.561 Y80.419 E0.05276
G1 X69.353 Y79.641 E0.03769
G1 X69.228 Y79.174 E0.02261
G1 X69.186 Y79.018 E0.00754
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.853 Y81.509 E0 F3312
G1 X70.319 Y81.51 E0
G1 X69.813 Y79.622 E0
G1 X69.813 Y79.622 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X68.35 Y77.639 E0 F9000
G1 X68.35 Y77.639 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X68.392 Y77.794 E0.0075 F2760
G1 X68.516 Y78.258 E0.02248
G1 X68.724 Y79.032 E0.03748
G1 X69.014 Y80.116 E0.05246
G1 X69.387 Y81.509 E0.06746
G1 X68.922 Y81.509 E0.02178
G1 X68.482 Y79.867 E0.07954
G1 X68.121 Y78.523 E0.06508
G1 X67.841 Y77.478 E0.05061
G1 X67.641 Y76.731 E0.03616
G1 X67.521 Y76.283 E0.0217
G1 X67.481 Y76.133 E0.00724
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.775 Y80.963 E0 F3312
G1 X68.775 Y80.963 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X66.604 Y74.597 E0 F9000
G1 X66.604 Y74.597 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X66.655 Y74.788 E0.00926 F2760
G1 X66.808 Y75.362 E0.02776
G1 X67.065 Y76.317 E0.04628
G1 X67.423 Y77.655 E0.0648
G1 X67.884 Y79.376 E0.0833
; Prepare for Destring
G1 X68.448 Y81.479 E0.10182
G1 X68.434 Y81.469 E0.00077
G1 X67.875 Y81.081 E0.03181
G1 X65.296 Y71.456 E0.4661
G1 X65.288 Y71.469 E0.00072
G1 X64.982 Y72.023 E0.02959
G1 X65.527 Y74.058 E0.09856
G1 X65.989 Y75.78 E0.08339
G1 X66.366 Y77.189 E0.06824
G1 X66.66 Y78.285 E0.05306
G1 X66.87 Y79.068 E0.03791
G1 X66.996 Y79.538 E0.02275
G1 X67.038 Y79.694 E0.00758
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X65.744 Y74.865 E0 F3312
G1 X65.744 Y74.865 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X66.168 Y78.187 E0 F9000
G1 X66.168 Y78.187 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X66.126 Y78.031 E0.00757 F2760
G1 X66 Y77.562 E0.02272
G1 X65.791 Y76.78 E0.03785
G1 X65.498 Y75.685 E0.053
G1 X65.12 Y74.278 E0.06814
G1 X64.66 Y72.558 E0.08329
G1 X64.652 Y72.571 E0.00073
G1 X64.346 Y73.125 E0.02958
G1 X64.689 Y74.405 E0.06197
G1 X64.955 Y75.4 E0.04821
G1 X65.146 Y76.112 E0.03444
G1 X65.26 Y76.538 E0.02067
G1 X65.299 Y76.681 E0.00691
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.346 Y73.125 E0 F3312
G1 X64.652 Y72.571 E0
G1 X64.66 Y72.558 E0
G1 X64.833 Y73.205 E0
G1 X64.833 Y73.205 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X64.43 Y75.177 E0 F9000
G1 X64.43 Y75.177 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X64.384 Y75.006 E0.00831 F2760
G1 X64.246 Y74.491 E0.02492
G1 X64.2 Y74.319 E0.0083
G1 X64.062 Y73.805 E0.02492
G1 X64.016 Y73.633 E0.00831
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X64.43 Y75.177 E0 F3312
G1 X64.43 Y75.177 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X65.589 Y70.812 E0 F9000
G1 X65.589 Y70.812 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X65.623 Y70.937 E0.00605 F2760
G1 X65.723 Y71.312 E0.01815
G1 X65.891 Y71.937 E0.03025
G1 X66.125 Y72.811 E0.04235
G1 X66.426 Y73.936 E0.05444
G1 X66.434 Y73.91 E0.00125
G1 X66.659 Y73.065 E0.04089
G1 X66.323 Y71.791 E0.06166
G1 X65.94 Y70.34 E0.07018
G1 X66.251 Y69.802 E0.02903
G1 X66.255 Y69.818 E0.00076
G1 X66.994 Y72.575 E0.1335
G1 X67.001 Y72.561 E0.00073
G1 X67.308 Y72.008 E0.02958
G1 X66.577 Y69.238 E0.13401
G1 X66.887 Y68.7 E0.02904
G1 X66.891 Y68.716 E0.00075
G1 X67.63 Y71.473 E0.1335
G1 X67.638 Y71.459 E0.00073
G1 X67.944 Y70.906 E0.02958
G1 X67.213 Y68.135 E0.13401
G1 X67.523 Y67.598 E0.02904
G1 X67.528 Y67.613 E0.00076
G1 X68.266 Y70.37 E0.1335
G1 X68.274 Y70.357 E0.00073
G1 X68.58 Y69.804 E0.02958
G1 X67.841 Y67.041 E0.13375
G1 X68.17 Y66.532 E0.02832
G1 X68.173 Y66.546 E0.00066
G1 X68.905 Y69.278 E0.13229
G1 X68.913 Y69.268 E0.00059
G1 X69.249 Y68.822 E0.02611
G1 X68.625 Y66.491 E0.11286
G1 X69.09 Y66.491 E0.02178
G1 X69.653 Y68.592 E0.10175
G1 X70.1 Y68.522 E0.02117
G1 X69.556 Y66.49 E0.0984
G1 X70.022 Y66.491 E0.02181
G1 X70.565 Y68.519 E0.09817
G1 X71.031 Y68.518 E0.02178
G1 X70.488 Y66.491 E0.09817
G1 X70.954 Y66.49 E0.02178
G1 X71.497 Y68.519 E0.09822
G1 X71.963 Y68.52 E0.0218
G1 X71.42 Y66.49 E0.09826
G1 X71.886 Y66.491 E0.02181
G1 X72.429 Y68.518 E0.09815
G1 X72.895 Y68.518 E0.02179
G1 X72.352 Y66.491 E0.09815
; Prepare for Destring
G1 X72.817 Y66.49 E0.02178
G1 X73.361 Y68.52 E0.09827
G1 X73.827 Y68.519 E0.02178
G1 X73.283 Y66.491 E0.09823
G1 X73.749 Y66.491 E0.0218
G1 X74.292 Y68.518 E0.09815
G1 X74.758 Y68.518 E0.02179
G1 X74.215 Y66.491 E0.09817
G1 X74.68 Y66.49 E0.02178
G1 X75.244 Y68.545 E0.09966
G1 X75.788 Y68.886 E0.03007
G1 X75.784 Y68.869 E0.00081
G1 X75.448 Y67.615 E0.06073
G1 X75.147 Y66.491 E0.05443
G1 X75.613 Y66.491 E0.02179
G1 X75.986 Y67.884 E0.06745
G1 X76.276 Y68.968 E0.05246
G1 X76.484 Y69.742 E0.03748
G1 X76.608 Y70.206 E0.02249
G1 X76.65 Y70.361 E0.0075
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X75.613 Y66.491 E0 F3312
G1 X75.147 Y66.491 E0
G1 X75.283 Y67.001 E0
G1 X75.283 Y67.001 Z10.0125 E0 F900
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X77.962 Y68.306 E0 F9000
G1 X77.962 Y68.306 Z9.5125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.004 Y68.463 E0.00761 F2760
G1 X78.13 Y68.934 E0.02282
G1 X78.339 Y69.72 E0.03804
G1 X78.632 Y70.82 E0.05325
G1 X79.009 Y72.235 E0.06847
G1 X79.47 Y73.964 E0.08368
G1 X80.014 Y76.007 E0.0989
G1 X79.704 Y76.544 E0.02904
G1 X79.7 Y76.528 E0.00076
G1 X79.089 Y74.249 E0.1104
G1 X78.559 Y72.273 E0.09567
G1 X78.111 Y70.601 E0.08096
G1 X77.745 Y69.233 E0.06623
G1 X77.46 Y68.169 E0.05152
G1 X77.256 Y67.409 E0.0368
G1 X77.134 Y66.953 E0.02207
G1 X77.093 Y66.801 E0.00737
; Blending Fan to Cool (74.7% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.387 Y71.631 E0 F3312
; time estimate: pre = 17.584984, post = 24.700632
; Dwell time remaining = -14.700632
;
; Post-layer lift
G1 X78.387 Y71.631 Z10.2625 E0 F900
; END_LAYER_OBJECT z=9.512
; BEGIN_LAYER_OBJECT z=9.762 z_thickness=0.250
; fan %*255
M106 S255
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X80.987 Y75.246 Z10.2625 E0 F9000
G1 X80.987 Y75.246 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
;
; *** Preheating Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
G1 X80.908 Y75.381 E0.00732 F2208
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for Perimeter
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z10.2625 E0 F900
;
; 'Loop Path', 1.7 [feed mm/s], 36.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 36.800003, filament speed 1.721212, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F2208
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for Perimeter
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X78.398 Y78.942 E0 F9000
G1 X78.398 Y78.942 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X78.244 Y78.983 E0.00744 F2760
G1 X77.783 Y79.107 E0.02233
G1 X77.015 Y79.313 E0.0372
G1 X75.939 Y79.601 E0.05209
G1 X74.556 Y79.971 E0.06697
G1 X72.404 Y80.548 E0.10418
G1 X71.021 Y80.918 E0.06697
G1 X69.946 Y81.207 E0.05209
G1 X69.177 Y81.413 E0.03721
G1 X68.716 Y81.536 E0.02232
G1 X68.562 Y81.577 E0.00744
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X73.392 Y80.283 E0 F3312
G1 X73.392 Y80.283 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X70.3 Y81.578 E0 F9000
G1 X70.3 Y81.578 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X70.456 Y81.536 E0.0076 F2760
G1 X70.927 Y81.41 E0.02279
G1 X71.712 Y81.199 E0.03798
G1 X72.81 Y80.905 E0.05318
G1 X74.222 Y80.527 E0.06838
G1 X75.948 Y80.064 E0.08356
G1 X77.987 Y79.518 E0.09876
G1 X77.98 Y79.531 E0.00073
G1 X77.653 Y80.073 E0.02959
G1 X75.938 Y80.533 E0.08305
G1 X74.535 Y80.909 E0.06795
G1 X73.443 Y81.201 E0.05285
G1 X72.664 Y81.41 E0.03775
G1 X72.196 Y81.535 E0.02265
G1 X72.04 Y81.577 E0.00755
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X76.87 Y80.283 E0 F3312
G1 X76.87 Y80.283 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X73.779 Y81.577 E0 F9000
G1 X73.779 Y81.577 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X73.922 Y81.539 E0.00692 F2760
G1 X74.35 Y81.424 E0.02076
G1 X75.065 Y81.233 E0.03459
G1 X76.065 Y80.965 E0.04843
G1 X77.351 Y80.62 E0.06227
G1 X77.343 Y80.634 E0.00072
G1 X77.017 Y81.175 E0.02959
G1 X76.183 Y81.399 E0.04037
G1 X75.683 Y81.533 E0.02423
G1 X75.516 Y81.578 E0.00809
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.017 Y81.175 E0 F3312
G1 X77.343 Y80.634 E0
G1 X77.351 Y80.62 E0
G1 X74.648 Y81.344 E0
G1 X74.648 Y81.344 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X74.931 Y79.405 E0 F9000
G1 X74.931 Y79.405 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X74.739 Y79.456 E0.0093 F2760
G1 X74.163 Y79.611 E0.02789
G1 X73.203 Y79.868 E0.04649
G1 X71.859 Y80.228 E0.06509
G1 X70.131 Y80.691 E0.08369
G1 X68.018 Y81.257 E0.10228
G1 X67.786 Y80.854 E0.02178
G1 X69.428 Y80.414 E0.07953
G1 X70.772 Y80.054 E0.06507
G1 X71.817 Y79.773 E0.05061
G1 X72.564 Y79.573 E0.03616
G1 X73.012 Y79.453 E0.02171
G1 X73.162 Y79.413 E0.00725
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X68.332 Y80.707 E0 F3312
G1 X68.332 Y80.707 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.423 Y79.413 E0 F9000
G1 X71.423 Y79.413 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X71.268 Y79.455 E0.00749 F2760
G1 X70.804 Y79.579 E0.02249
G1 X70.03 Y79.786 E0.03748
G1 X68.947 Y80.077 E0.05246
G1 X67.554 Y80.45 E0.06746
G1 X67.321 Y80.047 E0.02179
G1 X68.452 Y79.743 E0.0548
G1 X69.715 Y79.405 E0.06117
G1 X69.7 Y79.397 E0.00082
G1 X69.115 Y79.1 E0.03069
G1 X67.086 Y79.644 E0.09823
G1 X66.854 Y79.24 E0.02177
G1 X68.882 Y78.696 E0.09818
G1 X68.649 Y78.293 E0.02179
G1 X66.622 Y78.836 E0.09815
G1 X66.388 Y78.433 E0.0218
G1 X68.417 Y77.889 E0.09822
G1 X68.184 Y77.486 E0.02178
G1 X66.155 Y78.03 E0.09827
G1 X65.923 Y77.626 E0.02178
G1 X67.95 Y77.083 E0.09816
G1 X67.717 Y76.679 E0.02179
G1 X65.69 Y77.222 E0.09815
G1 X65.456 Y76.819 E0.0218
G1 X67.485 Y76.275 E0.09826
G1 X67.252 Y75.872 E0.0218
G1 X65.223 Y76.416 E0.09823
G1 X64.991 Y76.012 E0.02178
G1 X67.018 Y75.469 E0.09816
G1 X66.786 Y75.065 E0.02178
G1 X64.758 Y75.609 E0.09818
G1 X64.524 Y75.205 E0.02181
G1 X66.556 Y74.661 E0.0984
G1 X66.393 Y74.239 E0.02116
G1 X64.292 Y74.802 E0.10175
G1 X64.06 Y74.398 E0.02178
G1 X66.392 Y73.772 E0.11295
G1 X66.607 Y73.262 E0.02589
G1 X66.601 Y73.251 E0.00059
G1 X63.867 Y73.984 E0.13236
G1 X63.873 Y73.972 E0.00061
G1 X64.147 Y73.443 E0.02785
G1 X66.923 Y72.698 E0.13445
G1 X67.24 Y72.148 E0.02965
G1 X67.224 Y72.153 E0.00076
G1 X64.467 Y72.891 E0.1335
G1 X64.475 Y72.878 E0.00073
G1 X64.801 Y72.336 E0.02957
G1 X67.559 Y71.595 E0.13358
G1 X67.876 Y71.046 E0.02966
G1 X67.861 Y71.05 E0.00075
G1 X65.104 Y71.789 E0.1335
G1 X65.111 Y71.776 E0.00073
G1 X65.437 Y71.234 E0.02958
G1 X68.195 Y70.493 E0.13358
G1 X68.513 Y69.944 E0.02965
G1 X68.497 Y69.948 E0.00076
G1 X65.74 Y70.687 E0.1335
G1 X65.748 Y70.673 E0.00073
G1 X66.074 Y70.131 E0.02957
G1 X68.814 Y69.383 E0.13289
G1 X69.408 Y68.772 E0.03981
G1 X69.381 Y68.779 E0.00128
G1 X66.376 Y69.584 E0.1455
G1 X66.384 Y69.571 E0.00073
G1 X66.71 Y69.029 E0.02959
G1 X68.989 Y68.419 E0.11033
G1 X70.964 Y67.889 E0.09563
G1 X72.635 Y67.442 E0.08093
G1 X74.003 Y67.075 E0.06622
G1 X75.067 Y66.79 E0.05153
G1 X75.827 Y66.586 E0.03682
G1 X76.284 Y66.464 E0.02212
G1 X76.438 Y66.423 E0.00743
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X77.049 Y66.725 E0 F9000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X76.907 Y66.763 E0.0069 F2760
G1 X76.479 Y66.877 E0.02069
G1 X75.767 Y67.068 E0.03449
G1 X74.77 Y67.335 E0.04829
G1 X72.348 Y67.984 E0.11726
G1 X71.351 Y68.252 E0.04829
G1 X70.639 Y68.442 E0.03449
G1 X70.211 Y68.557 E0.02069
G1 X70.069 Y68.595 E0.0069
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X74.898 Y67.301 E0 F3312
G1 X74.898 Y67.301 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X69.419 Y66.44 E0 F9000
G1 X69.419 Y66.44 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X69.258 Y66.483 E0.00782 F2760
G1 X68.773 Y66.614 E0.02346
G1 X67.966 Y66.831 E0.03909
G1 X67.649 Y67.38 E0.02966
G1 X67.665 Y67.376 E0.00077
G1 X68.945 Y67.033 E0.06199
G1 X69.941 Y66.766 E0.04822
G1 X70.652 Y66.575 E0.03443
G1 X71.079 Y66.461 E0.02067
G1 X71.221 Y66.423 E0.00689
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X67.665 Y67.376 E0 F3312
G1 X67.649 Y67.38 E0
G1 X67.966 Y66.831 E0
G1 X68.611 Y66.657 E0
G1 X68.611 Y66.657 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X71.838 Y68.587 E0 F9000
G1 X71.838 Y68.587 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X71.987 Y68.547 E0.00723 F2760
G1 X72.435 Y68.427 E0.0217
G1 X73.182 Y68.227 E0.03615
G1 X74.227 Y67.947 E0.05062
G1 X75.571 Y67.587 E0.06509
G1 X77.214 Y67.146 E0.07954
G1 X77.446 Y67.55 E0.02178
G1 X76.053 Y67.923 E0.06746
G1 X74.97 Y68.214 E0.05246
G1 X74.196 Y68.421 E0.03748
G1 X73.732 Y68.545 E0.02248
G1 X73.577 Y68.587 E0.0075
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X77.446 Y67.55 E0 F3312
G1 X77.214 Y67.146 E0
G1 X76.704 Y67.283 E0
G1 X76.704 Y67.283 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X72.96 Y66.423 E0 F9000
G1 X72.96 Y66.423 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
; Prepare for Destring
G1 X72.804 Y66.465 E0.00757 F2760
G1 X72.334 Y66.591 E0.02272
G1 X71.552 Y66.8 E0.03787
G1 X70.458 Y67.094 E0.05302
G1 X69.05 Y67.472 E0.06816
G1 X67.33 Y67.933 E0.0833
G1 X67.013 Y68.482 E0.02966
G1 X67.029 Y68.478 E0.00077
G1 X69.064 Y67.933 E0.09856
G1 X70.786 Y67.471 E0.08339
G1 X72.195 Y67.094 E0.06824
G1 X73.291 Y66.8 E0.05307
G1 X74.074 Y66.59 E0.0379
G1 X74.544 Y66.464 E0.02275
G1 X74.7 Y66.422 E0.00758
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
G1 X69.871 Y67.716 E0 F3312
G1 X69.871 Y67.716 Z10.2625 E0 F900
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 91%
; fan %*255
M106 S232
;
; 'Solid Path', 2.2 [feed mm/s], 46.0 [head mm/s]
G1 X75.189 Y68.621 E0 F9000
G1 X75.189 Y68.621 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 45.999996, filament speed 2.151515, preload 0.000000
G1 X75.345 Y68.579 E0.00754 F2760
G1 X75.812 Y68.454 E0.02261
G1 X76.59 Y68.245 E0.03769
G1 X77.679 Y67.953 E0.05276
G1 X77.914 Y68.357 E0.02181
G1 X76.947 Y68.616 E0.04683
G1 X75.842 Y68.912 E0.05349
G1 X76.12 Y69.303 E0.02245
G1 X78.146 Y68.76 E0.09807
G1 X78.378 Y69.164 E0.02179
G1 X76.351 Y69.707 E0.09815
G1 X76.583 Y70.111 E0.02178
G1 X78.612 Y69.567 E0.09823
G1 X78.845 Y69.97 E0.02179
G1 X76.816 Y70.514 E0.09827
G1 X77.05 Y70.917 E0.0218
G1 X79.077 Y70.374 E0.09815
G1 X79.31 Y70.778 E0.02179
G1 X77.283 Y71.321 E0.09816
G1 X77.515 Y71.725 E0.02177
G1 X79.544 Y71.181 E0.09827
G1 X79.777 Y71.584 E0.02179
G1 X77.748 Y72.128 E0.09822
G1 X77.982 Y72.531 E0.0218
G1 X80.009 Y71.988 E0.09816
G1 X80.242 Y72.391 E0.02179
G1 X78.214 Y72.935 E0.09818
G1 X78.446 Y73.339 E0.02177
G1 X80.476 Y72.795 E0.09831
G1 X80.708 Y73.198 E0.02178
G1 X78.609 Y73.761 E0.10162
G1 X78.594 Y74.231 E0.02199
G1 X80.941 Y73.602 E0.11365
G1 X81.154 Y74.011 E0.02156
G1 X78.395 Y74.751 E0.13358
G1 X78.078 Y75.301 E0.02966
G1 X78.094 Y75.296 E0.00076
G1 X80.851 Y74.558 E0.1335
G1 X80.843 Y74.571 E0.00072
G1 X80.517 Y75.113 E0.02958
G1 X77.752 Y75.865 E0.13402
G1 X77.442 Y76.403 E0.02904
G1 X77.458 Y76.399 E0.00075
; Prepare for End-Of-Layer
G1 X80.215 Y75.66 E0.1335
G1 X80.207 Y75.673 E0.00073
G1 X79.881 Y76.215 E0.02958
G1 X77.116 Y76.967 E0.13401
G1 X76.806 Y77.505 E0.02904
G1 X76.821 Y77.501 E0.00076
G1 X79.578 Y76.762 E0.1335
G1 X79.57 Y76.776 E0.00072
G1 X79.244 Y77.317 E0.02958
G1 X76.48 Y78.07 E0.13402
G1 X76.169 Y78.607 E0.02904
G1 X76.185 Y78.603 E0.00075
G1 X77.657 Y78.209 E0.0713
G1 X78.942 Y77.864 E0.0622
G1 X78.934 Y77.878 E0.00073
G1 X78.608 Y78.42 E0.02957
G1 X77.477 Y78.723 E0.05476
G1 X76.598 Y78.958 E0.0426
G1 X75.969 Y79.127 E0.03043
G1 X75.592 Y79.228 E0.01828
G1 X75.465 Y79.262 E0.00612
; Blending Fan to Cool (74.0% blend)
; Blended Fan at 98%
; fan %*255
M106 S250
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.608 Y78.42 E0 F3312
G1 X78.934 Y77.878 E0
G1 X78.942 Y77.864 E0
G1 X77.881 Y78.149 E0
G1 X77.881 Y78.149 Z10.2625 E0 F900
;
; *** Cooling Extruder 1 to 154 C ***
; NONE
;
;
; *** Selecting and Warming Extruder 4 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T3
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
; *** Estimate 5.748863 [s], Slowing (0.493x) to 10.0 [s] ***
; fan %*255
M106 S255
;
; 'Loop Path', 0.8 [feed mm/s], 18.1 [head mm/s]
G1 X75.962 Y75.285 Z10.2625 E0 F9000
G1 X75.962 Y75.285 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 18.142401, filament speed 0.848558, preload 0.000000
G1 X75.878 Y75.431 E0.00789 F1088.5
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for Perimeter
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.4 [feed mm/s], 9.1 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 9.071200, filament speed 0.424279, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F544.3
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X76.011 Y75.2 E0 F1632.8
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z10.2625 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X74.288 Y77.248 E0 F9000
G1 X74.288 Y77.248 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for Destring
G1 X74.368 Y77.11 E0.00744 F1360.7
G1 X74.606 Y76.697 E0.0223
G1 X74.59 Y76.701 E0.00077
G1 X73.699 Y76.94 E0.04316
G1 X73.062 Y77.111 E0.03084
G1 X72.68 Y77.213 E0.0185
G1 X72.552 Y77.247 E0.00617
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X74.59 Y76.701 E0 F1632.8
G1 X74.606 Y76.697 E0
G1 X74.288 Y77.248 E0
G1 X74.288 Y77.248 Z10.2625 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X70.815 Y77.247 E0 F9000
G1 X70.815 Y77.247 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
G1 X70.98 Y77.202 E0.008 F1360.7
G1 X71.475 Y77.068 E0.02399
G1 X72.3 Y76.845 E0.03998
G1 X73.456 Y76.532 E0.05598
G1 X74.941 Y76.13 E0.07197
G1 X75.251 Y75.592 E0.02904
G1 X75.235 Y75.596 E0.00077
G1 X73.833 Y75.972 E0.06789
G1 X72.25 Y76.396 E0.07667
G1 X70.485 Y76.869 E0.08544
G1 X70.253 Y76.466 E0.02178
G1 X75.577 Y75.028 E0.25795
G1 X75.888 Y74.49 E0.02903
G1 X75.872 Y74.494 E0.00077
G1 X70.02 Y76.062 E0.28334
G1 X69.786 Y75.659 E0.02181
G1 X76.146 Y73.955 E0.30796
G1 X75.912 Y73.552 E0.02181
G1 X69.554 Y75.255 E0.30785
G1 X69.322 Y74.852 E0.02178
G1 X75.678 Y73.148 E0.30781
G1 X75.446 Y72.745 E0.02178
G1 X69.088 Y74.448 E0.30785
G1 X68.854 Y74.045 E0.02181
G1 X75.214 Y72.341 E0.30797
G1 X74.98 Y71.938 E0.02181
; Prepare for Destring
G1 X69.112 Y73.51 E0.2841
G1 X69.12 Y73.497 E0.00073
G1 X69.446 Y72.955 E0.02958
G1 X74.747 Y71.534 E0.25666
G1 X74.514 Y71.131 E0.02179
G1 X72.743 Y71.605 E0.08577
G1 X71.155 Y72.031 E0.07692
G1 X69.749 Y72.408 E0.06807
G1 X69.756 Y72.394 E0.00073
G1 X70.083 Y71.852 E0.02959
G1 X71.56 Y71.457 E0.07151
G1 X72.708 Y71.149 E0.05562
G1 X73.529 Y70.929 E0.03972
G1 X74.021 Y70.797 E0.02384
G1 X74.185 Y70.753 E0.00795
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
G1 X70.083 Y71.852 E0 F1632.8
G1 X69.756 Y72.394 E0
G1 X69.749 Y72.408 E0
G1 X69.85 Y72.381 E0
G1 X69.85 Y72.381 Z10.2625 E0 F900
; Fan set to Cool value 100%
;
; 'Solid Path', 1.1 [feed mm/s], 22.7 [head mm/s]
G1 X72.448 Y70.753 E0 F9000
G1 X72.448 Y70.753 Z9.7625 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 22.677999, filament speed 1.060697, preload 0.000000
; Prepare for End-Of-Layer
G1 X72.319 Y70.787 E0.00621 F1360.7
G1 X71.934 Y70.89 E0.01865
G1 X71.293 Y71.062 E0.03107
G1 X70.394 Y71.303 E0.0435
G1 X70.401 Y71.291 E0.00068
G1 X70.62 Y70.891 E0.02132
G1 X70.693 Y70.757 E0.00711
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 27.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 27.213602, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X70.401 Y71.291 E0 F1632.8
G1 X70.394 Y71.303 E0
G1 X72.448 Y70.753 E0
; time estimate: pre = 9.986054, post = 24.798159
; Dwell time remaining = -14.798159
;
; Post-layer lift
G1 X72.448 Y70.753 Z10.5125 E0 F900
; END_LAYER_OBJECT z=9.762
; BEGIN_LAYER_OBJECT z=10.012 z_thickness=0.250
;
; 'Loop Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X75.962 Y75.285 Z10.5125 E0 F9000
G1 X75.962 Y75.285 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
;
; *** Preheating Ext 1 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T0
; Uncomment the previous line to enable preheat
;
;
; *** Resume on Ext 4 to 205 C ***
; heat the (next, then current) extruder without waiting
M104 S205
;M104 S205 T3
; Uncomment the previous line to enable preheat
;
G1 X75.878 Y75.431 E0.00789 F828
G1 X75.624 Y75.87 E0.02369
G1 X75.201 Y76.6 E0.03947
; Prepare for TopPerimeter (1)
G1 X74.609 Y77.622 E0.05525
G1 X74.327 Y77.641 E0.01323
G1 X73.198 Y77.641 E0.05284
G1 X71.887 Y77.64 E0.06129
G1 X70.395 Y77.639 E0.06976
G1 X68.321 Y74.037 E0.19441
G1 X68.36 Y73.888 E0.00721
G1 X70.391 Y70.378 E0.18968
G1 X70.673 Y70.359 E0.01323
G1 X72.186 Y70.36 E0.07079
G1 X73.497 Y70.361 E0.0613
G1 X74.605 Y70.361 E0.0518
G1 X75.149 Y71.305 E0.05098
G1 X75.539 Y71.98 E0.03642
G1 X75.772 Y72.385 E0.02186
G1 X75.85 Y72.52 E0.00731
; Perimeter Length = 31.938139
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X75.908 Y72.621 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X75.938 Y72.671 E0.00273 F1104
G1 X76.06 Y72.882 E0.01139
G1 X76.277 Y73.257 E0.02028
G1 X76.589 Y73.797 E0.02916
G1 X76.603 Y73.813 E0.00101
G1 X76.623 Y73.823 E0.00101
G1 X76.94 Y73.912 E0.01539
G1 X77.134 Y74.063 E0.01153
G1 X77.151 Y74.084 E0.00124
G1 X77.156 Y74.11 E0.00125
G1 X77.148 Y74.136 E0.00125
G1 X76.535 Y75.198 E0.05735
G1 X75.779 Y76.507 E0.0707
G1 X74.881 Y78.063 E0.08404
G1 X74.861 Y78.083 E0.00135
G1 X74.833 Y78.091 E0.00136
G1 X73.978 Y78.095 E0.03999
G1 X70.215 Y78.089 E0.17596
G1 X70.196 Y78.085 E0.00094
G1 X70.178 Y78.075 E0.00094
G1 X70.066 Y77.977 E0.00698
G1 X67.813 Y74.065 E0.21112
G1 X67.794 Y73.995 E0.00341
G1 X67.793 Y73.973 E0.00103
G1 X67.8 Y73.952 E0.00102
G1 X70.119 Y69.937 E0.21686
G1 X70.14 Y69.917 E0.00136
G1 X70.167 Y69.909 E0.00135
G1 X71.022 Y69.905 E0.03999
G1 X74.785 Y69.911 E0.17596
G1 X74.804 Y69.915 E0.00094
G1 X74.822 Y69.925 E0.00095
G1 X74.934 Y70.023 E0.00697
G1 X75.822 Y71.563 E0.08313
G1 X76.565 Y72.85 E0.06952
G1 X77.163 Y73.885 E0.05589
G1 X77.17 Y73.914 E0.0014
G1 X77.162 Y73.943 E0.0014
G1 X77.14 Y73.963 E0.0014
G1 X76.547 Y74.273 E0.03129
G1 X76.195 Y74.881 E0.03286
G1 X76.011 Y75.2 E0.01725
G1 X75.98 Y75.253 E0.00286
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X76.011 Y75.2 E0 F3312
G1 X76.547 Y74.273 E0
G1 X77.14 Y73.963 E0
G1 X77.162 Y73.943 E0
G1 X77.17 Y73.914 E0
G1 X77.163 Y73.885 E0
G1 X75.609 Y71.193 E0
G1 X75.609 Y71.193 Z10.5125 E0 F900
; Blending Fan to Cool (98.9% blend)
; Blended Fan at 100%
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X69.662 Y75.578 E0 F9000
G1 X69.662 Y75.578 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
G1 X69.628 Y75.448 E0.00627 F828
G1 X69.526 Y75.059 E0.01883
G1 X69.355 Y74.41 E0.03137
G1 X69.117 Y73.502 E0.04392
G1 X69.427 Y72.965 E0.02904
G1 X69.431 Y72.98 E0.00075
G1 X69.737 Y74.121 E0.05523
G1 X70.097 Y75.462 E0.06497
G1 X70.511 Y77.005 E0.07471
G1 X71.02 Y77.169 E0.02502
G1 X71.017 Y77.157 E0.00059
G1 X69.753 Y72.4 E0.2302
G1 X70.064 Y71.862 E0.02904
G1 X70.068 Y71.878 E0.00077
G1 X71.488 Y77.179 E0.25666
G1 X71.954 Y77.178 E0.02179
G1 X70.38 Y71.302 E0.28455
G1 X70.72 Y70.836 E0.02698
G1 X70.724 Y70.848 E0.00059
G1 X72.42 Y77.18 E0.3066
G1 X72.886 Y77.179 E0.02177
G1 X71.182 Y70.821 E0.30785
G1 X71.648 Y70.822 E0.0218
G1 X73.352 Y77.178 E0.3078
G1 X73.818 Y77.179 E0.0218
G1 X72.114 Y70.821 E0.30785
G1 X72.58 Y70.82 E0.02177
G1 X74.28 Y77.164 E0.30719
G1 X74.287 Y77.154 E0.00059
G1 X74.62 Y76.696 E0.02649
; Prepare for End-Of-Layer
G1 X73.046 Y70.822 E0.28445
G1 X73.512 Y70.821 E0.02179
G1 X74.936 Y76.138 E0.25742
G1 X74.944 Y76.124 E0.00073
G1 X75.25 Y75.571 E0.02959
G1 X73.984 Y70.844 E0.22887
G1 X73.992 Y70.835 E0.00059
G1 X74.49 Y70.996 E0.02447
G1 X74.905 Y72.545 E0.07504
G1 X75.266 Y73.892 E0.06521
G1 X75.573 Y75.035 E0.05537
G1 X75.58 Y75.022 E0.00073
G1 X75.887 Y74.468 E0.02959
G1 X75.647 Y73.573 E0.04335
G1 X75.475 Y72.933 E0.03097
G1 X75.373 Y72.55 E0.01859
G1 X75.338 Y72.422 E0.00619
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X75.887 Y74.468 E0 F3312
G1 X75.58 Y75.022 E0
G1 X75.573 Y75.035 E0
G1 X74.995 Y72.879 E0
G1 X74.995 Y72.879 Z10.5125 E0 F900
;
; *** Cooling Extruder 4 to 0 C and Retiring ***
; NONE
;
;
; *** Selecting and Warming Extruder 1 to 205 C ***
; SELECT NEW EXT START
M104 S205
; TOOL CHANGE
T0
; TOOL_CHANGE_END
M572 D0:3 S0.4    ; Duet Pressure Advance
M106 P1 S255      ; hot end fan speed
;
;
;
; 'Loop Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X80.987 Y75.246 Z10.5125 E0 F9000
G1 X80.987 Y75.246 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
G1 X80.908 Y75.381 E0.00732 F828
G1 X80.673 Y75.788 E0.02196
G1 X80.282 Y76.465 E0.0366
G1 X79.734 Y77.414 E0.05124
G1 X79.029 Y78.633 E0.06588
G1 X78.167 Y80.124 E0.08052
G1 X77.149 Y81.885 E0.09516
G1 X77.073 Y81.972 E0.0054
G1 X67.902 Y81.971 E0.42894
G1 X64.146 Y75.474 E0.35101
G1 X63.297 Y74.003 E0.07943
G1 X63.79 Y73.142 E0.04641
; Prepare for TopPerimeter (1)
G1 X67.851 Y66.115 E0.37961
G1 X67.927 Y66.028 E0.0054
G1 X77.098 Y66.029 E0.42894
G1 X78.088 Y67.741 E0.0925
G1 X78.925 Y69.189 E0.07826
G1 X79.61 Y70.375 E0.06403
G1 X80.143 Y71.297 E0.04981
G1 X80.524 Y71.955 E0.03557
G1 X80.752 Y72.35 E0.02135
G1 X80.828 Y72.482 E0.00711
; Perimeter Length = 61.992271
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X80.879 Y72.57 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X80.908 Y72.621 E0.00272 F1104
G1 X81.035 Y72.836 E0.01172
G1 X81.263 Y73.223 E0.02097
G1 X81.59 Y73.779 E0.0302
G1 X82.147 Y74.027 E0.0285
G1 X82.171 Y74.047 E0.00145
G1 X82.18 Y74.077 E0.00145
G1 X82.173 Y74.107 E0.00145
G1 X81.526 Y75.225 E0.0604
G1 X80.726 Y76.609 E0.07479
G1 X79.773 Y78.26 E0.08917
G1 X77.403 Y82.36 E0.22148
G1 X77.39 Y82.376 E0.00096
G1 X77.372 Y82.385 E0.00096
G1 X77.248 Y82.425 E0.00608
G1 X72.574 Y82.425 E0.21863
G1 X67.855 Y82.426 E0.2207
G1 X67.663 Y82.427 E0.00897
G1 X67.635 Y82.42 E0.00137
G1 X67.614 Y82.399 E0.00137
G1 X65.574 Y78.855 E0.19127
G1 X63.186 Y74.719 E0.22336
G1 X62.795 Y74.034 E0.03689
G1 X62.787 Y74.008 E0.00128
G1 X62.793 Y73.981 E0.00129
G1 X62.91 Y73.75 E0.01213
G1 X67.597 Y65.64 E0.43809
G1 X67.61 Y65.624 E0.00096
G1 X67.628 Y65.615 E0.00096
G1 X67.752 Y65.575 E0.00608
G1 X72.426 Y65.575 E0.21863
G1 X77.145 Y65.574 E0.2207
G1 X77.337 Y65.573 E0.00897
G1 X77.365 Y65.58 E0.00137
G1 X77.386 Y65.601 E0.00137
G1 X79.426 Y69.145 E0.19127
G1 X80.359 Y70.762 E0.08732
G1 X81.155 Y72.141 E0.07445
G1 X81.814 Y73.281 E0.06158
G1 X82.141 Y73.847 E0.03058
G1 X82.148 Y73.883 E0.0017
G1 X82.131 Y73.915 E0.0017
G1 X81.92 Y74.125 E0.01395
G1 X81.605 Y74.208 E0.01519
G1 X81.586 Y74.217 E0.00103
G1 X81.571 Y74.234 E0.00104
G1 X81.22 Y74.842 E0.03284
G1 X81.035 Y75.162 E0.01727
G1 X81.004 Y75.215 E0.0029
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopLoop (1)
G1 X81.035 Y75.162 E0 F3312
G1 X81.571 Y74.234 E0
G1 X81.586 Y74.217 E0
G1 X81.605 Y74.208 E0
G1 X81.92 Y74.125 E0
G1 X82.131 Y73.915 E0
G1 X82.148 Y73.883 E0
G1 X82.141 Y73.847 E0
G1 X81.814 Y73.281 E0
G1 X80.577 Y71.139 E0
G1 X80.577 Y71.139 Z10.5125 E0 F900
;
; 'Loop Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X77.519 Y75.344 E0 F9000
G1 X77.519 Y75.344 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
G1 X77.442 Y75.478 E0.00723 F828
G1 X77.209 Y75.879 E0.02167
G1 X76.823 Y76.548 E0.03613
G1 X76.281 Y77.484 E0.05059
G1 X75.584 Y78.687 E0.06503
G1 X75.301 Y78.923 E0.01723
G1 X74.994 Y79.018 E0.01502
G1 X73.515 Y79.017 E0.0692
G1 X71.827 Y79.016 E0.07893
G1 X69.932 Y79.015 E0.08865
G1 X69.553 Y78.841 E0.0195
G1 X69.336 Y78.557 E0.01674
; Prepare for TopPerimeter (1)
G1 X66.885 Y74.304 E0.22961
G1 X66.836 Y73.963 E0.01609
G1 X66.934 Y73.602 E0.0175
G1 X69.416 Y69.313 E0.23178
G1 X69.699 Y69.077 E0.01723
G1 X70.006 Y68.982 E0.01502
G1 X71.911 Y68.983 E0.08911
G1 X73.598 Y68.984 E0.07893
G1 X75.068 Y68.985 E0.06874
G1 X75.447 Y69.159 E0.0195
G1 X75.664 Y69.443 E0.01674
G1 X76.29 Y70.527 E0.05853
G1 X76.777 Y71.369 E0.04552
G1 X77.124 Y71.972 E0.03251
G1 X77.333 Y72.333 E0.01952
G1 X77.402 Y72.453 E0.00651
; Perimeter Length = 34.913509
;
; 'Perimeter Path', 0.9 [feed mm/s], 18.4 [head mm/s]
G1 X77.46 Y72.554 E0 F9000
; head speed 18.400002, filament speed 0.860606, preload 0.000000
G1 X77.479 Y72.587 E0.00175 F1104
G1 X77.592 Y72.783 E0.01057
G1 X77.807 Y73.155 E0.02013
G1 X78.124 Y73.705 E0.02971
G1 X78.132 Y73.731 E0.00124
G1 X78.127 Y73.757 E0.00125
G1 X78.11 Y73.778 E0.00124
G1 X77.698 Y74.099 E0.02444
G1 X77.14 Y75.079 E0.05274
G1 X76.455 Y76.283 E0.06482
G1 X75.859 Y77.306 E0.05533
G1 X75.194 Y78.449 E0.06186
G1 X74.988 Y78.564 E0.01106
G1 X70.431 Y78.565 E0.2131
G1 X69.972 Y78.559 E0.02151
G1 X69.788 Y78.438 E0.01027
G1 X67.425 Y74.339 E0.22129
G1 X67.291 Y74.091 E0.0132
G1 X67.337 Y73.806 E0.0135
G1 X69.783 Y69.574 E0.22861
G1 X70.012 Y69.436 E0.01248
G1 X74.569 Y69.435 E0.21315
G1 X75.028 Y69.441 E0.0215
G1 X75.212 Y69.562 E0.01027
G1 X76.152 Y71.193 E0.08806
G1 X76.941 Y72.56 E0.07381
G1 X77.577 Y73.663 E0.05957
G1 X77.705 Y73.919 E0.01339
G1 X78.011 Y74.174 E0.01863
G1 X78.101 Y74.226 E0.00482
G1 X78.121 Y74.247 E0.00136
G1 X78.128 Y74.275 E0.00136
G1 X78.121 Y74.303 E0.00135
G1 X77.797 Y74.864 E0.03031
G1 X77.599 Y75.207 E0.01853
G1 X77.562 Y75.269 E0.00338
G1 X77.526 Y75.332 E0.00339
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X77.562 Y75.269 E0 F3312
G1 X77.599 Y75.207 E0
G1 X78.121 Y74.303 E0
G1 X78.128 Y74.275 E0
G1 X78.121 Y74.247 E0
G1 X78.101 Y74.226 E0
G1 X78.011 Y74.174 E0
G1 X77.705 Y73.919 E0
G1 X77.577 Y73.663 E0
G1 X76.11 Y71.12 E0
G1 X76.11 Y71.12 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X81.001 Y74.432 E0 F9000
G1 X81.001 Y74.432 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
; Prepare for Destring
G1 X80.954 Y74.253 E0.00866 F828
G1 X80.81 Y73.717 E0.02597
G1 X80.762 Y73.538 E0.00866
G1 X80.618 Y73.002 E0.02597
G1 X80.57 Y72.823 E0.00866
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X81.001 Y74.432 E0 F3312
G1 X81.001 Y74.432 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X79.701 Y71.319 E0 F9000
G1 X79.701 Y71.319 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
; Prepare for Destring
G1 X79.739 Y71.462 E0.00694 F828
G1 X79.853 Y71.893 E0.02082
G1 X80.043 Y72.61 E0.03469
G1 X80.309 Y73.614 E0.04858
G1 X80.651 Y74.904 E0.06245
G1 X80.34 Y75.442 E0.02904
G1 X80.336 Y75.426 E0.00077
G1 X79.877 Y73.712 E0.08303
G1 X79.501 Y72.309 E0.06793
G1 X79.208 Y71.217 E0.05285
G1 X78.999 Y70.438 E0.03775
G1 X78.874 Y69.969 E0.02267
G1 X78.832 Y69.813 E0.00757
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X80.126 Y74.643 E0 F3312
G1 X80.126 Y74.643 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X77.519 Y71.867 E0 F9000
G1 X77.519 Y71.867 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
G1 X77.479 Y71.717 E0.00723 F828
G1 X77.359 Y71.269 E0.0217
G1 X77.159 Y70.523 E0.03615
G1 X76.879 Y69.477 E0.05062
G1 X76.519 Y68.133 E0.06508
G1 X76.078 Y66.491 E0.07955
G1 X76.544 Y66.49 E0.02178
G1 X79.378 Y77.109 E0.51405
G1 X79.068 Y77.647 E0.02904
G1 X79.063 Y77.631 E0.00075
G1 X78.325 Y74.874 E0.1335
G1 X78.317 Y74.887 E0.00073
G1 X78.011 Y75.441 E0.02958
G1 X78.742 Y78.211 E0.13401
G1 X78.431 Y78.749 E0.02904
G1 X78.427 Y78.733 E0.00076
G1 X77.688 Y75.976 E0.1335
G1 X77.681 Y75.99 E0.00073
G1 X77.374 Y76.543 E0.02957
G1 X78.105 Y79.313 E0.13402
G1 X77.795 Y79.851 E0.02904
G1 X77.791 Y79.836 E0.00075
G1 X77.052 Y77.079 E0.1335
G1 X77.044 Y77.092 E0.00073
G1 X76.738 Y77.645 E0.02958
G1 X77.469 Y80.416 E0.13401
G1 X77.158 Y80.953 E0.02904
G1 X77.154 Y80.938 E0.00076
G1 X76.415 Y78.181 E0.1335
G1 X76.408 Y78.194 E0.00073
G1 X76.098 Y78.734 E0.02911
G1 X76.836 Y81.489 E0.1334
G1 X76.376 Y81.509 E0.02156
G1 X75.747 Y79.162 E0.11365
G1 X75.347 Y79.41 E0.02199
G1 X75.91 Y81.509 E0.10163
G1 X75.444 Y81.51 E0.02177
G1 X74.9 Y79.48 E0.09831
G1 X74.435 Y79.481 E0.02178
G1 X74.978 Y81.509 E0.09817
G1 X74.512 Y81.509 E0.02179
G1 X73.969 Y79.482 E0.09816
G1 X73.503 Y79.481 E0.0218
G1 X74.046 Y81.51 E0.09822
G1 X73.58 Y81.51 E0.02179
G1 X73.037 Y79.48 E0.09827
G1 X72.571 Y79.482 E0.02177
; Prepare for Destring
G1 X73.114 Y81.509 E0.09816
G1 X72.648 Y81.509 E0.02179
G1 X72.105 Y79.482 E0.09815
G1 X71.639 Y79.481 E0.02181
G1 X72.183 Y81.51 E0.09826
G1 X71.717 Y81.509 E0.0218
G1 X71.173 Y79.481 E0.09822
G1 X70.708 Y79.482 E0.02178
G1 X71.251 Y81.509 E0.09815
G1 X70.785 Y81.509 E0.02179
G1 X70.242 Y79.484 E0.09808
G1 X69.764 Y79.439 E0.02244
G1 X70.06 Y80.543 E0.05349
G1 X70.319 Y81.51 E0.04683
G1 X69.853 Y81.509 E0.02181
G1 X69.561 Y80.419 E0.05276
G1 X69.353 Y79.641 E0.03769
G1 X69.228 Y79.174 E0.02261
G1 X69.186 Y79.018 E0.00754
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X69.853 Y81.509 E0 F3312
G1 X70.319 Y81.51 E0
G1 X69.813 Y79.622 E0
G1 X69.813 Y79.622 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X68.35 Y77.639 E0 F9000
G1 X68.35 Y77.639 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
; Prepare for Destring
G1 X68.392 Y77.794 E0.0075 F828
G1 X68.516 Y78.258 E0.02248
G1 X68.724 Y79.032 E0.03748
G1 X69.014 Y80.116 E0.05246
G1 X69.387 Y81.509 E0.06746
G1 X68.922 Y81.509 E0.02178
G1 X68.482 Y79.867 E0.07954
G1 X68.121 Y78.523 E0.06508
G1 X67.841 Y77.478 E0.05061
G1 X67.641 Y76.731 E0.03616
G1 X67.521 Y76.283 E0.0217
G1 X67.481 Y76.133 E0.00724
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X68.775 Y80.963 E0 F3312
G1 X68.775 Y80.963 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X66.604 Y74.597 E0 F9000
G1 X66.604 Y74.597 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
G1 X66.655 Y74.788 E0.00926 F828
G1 X66.808 Y75.362 E0.02776
G1 X67.065 Y76.317 E0.04628
G1 X67.423 Y77.655 E0.0648
G1 X67.884 Y79.376 E0.0833
; Prepare for Destring
G1 X68.448 Y81.479 E0.10182
G1 X68.434 Y81.469 E0.00077
G1 X67.875 Y81.081 E0.03181
G1 X65.296 Y71.456 E0.4661
G1 X65.288 Y71.469 E0.00072
G1 X64.982 Y72.023 E0.02959
G1 X65.527 Y74.058 E0.09856
G1 X65.989 Y75.78 E0.08339
G1 X66.366 Y77.189 E0.06824
G1 X66.66 Y78.285 E0.05306
G1 X66.87 Y79.068 E0.03791
G1 X66.996 Y79.538 E0.02275
G1 X67.038 Y79.694 E0.00758
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X65.744 Y74.865 E0 F3312
G1 X65.744 Y74.865 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X66.168 Y78.187 E0 F9000
G1 X66.168 Y78.187 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
; Prepare for Destring
G1 X66.126 Y78.031 E0.00757 F828
G1 X66 Y77.562 E0.02272
G1 X65.791 Y76.78 E0.03785
G1 X65.498 Y75.685 E0.053
G1 X65.12 Y74.278 E0.06814
G1 X64.66 Y72.558 E0.08329
G1 X64.652 Y72.571 E0.00073
G1 X64.346 Y73.125 E0.02958
G1 X64.689 Y74.405 E0.06197
G1 X64.955 Y75.4 E0.04821
G1 X65.146 Y76.112 E0.03444
G1 X65.26 Y76.538 E0.02067
G1 X65.299 Y76.681 E0.00691
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X64.346 Y73.125 E0 F3312
G1 X64.652 Y72.571 E0
G1 X64.66 Y72.558 E0
G1 X64.833 Y73.205 E0
G1 X64.833 Y73.205 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X64.43 Y75.177 E0 F9000
G1 X64.43 Y75.177 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
; Prepare for Destring
G1 X64.384 Y75.006 E0.00831 F828
G1 X64.246 Y74.491 E0.02492
G1 X64.2 Y74.319 E0.0083
G1 X64.062 Y73.805 E0.02492
G1 X64.016 Y73.633 E0.00831
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X64.43 Y75.177 E0 F3312
G1 X64.43 Y75.177 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X65.589 Y70.812 E0 F9000
G1 X65.589 Y70.812 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
G1 X65.623 Y70.937 E0.00605 F828
G1 X65.723 Y71.312 E0.01815
G1 X65.891 Y71.937 E0.03025
G1 X66.125 Y72.811 E0.04235
G1 X66.426 Y73.936 E0.05444
G1 X66.434 Y73.91 E0.00125
G1 X66.659 Y73.065 E0.04089
G1 X66.323 Y71.791 E0.06166
G1 X65.94 Y70.34 E0.07018
G1 X66.251 Y69.802 E0.02903
G1 X66.255 Y69.818 E0.00076
G1 X66.994 Y72.575 E0.1335
G1 X67.001 Y72.561 E0.00073
G1 X67.308 Y72.008 E0.02958
G1 X66.577 Y69.238 E0.13401
G1 X66.887 Y68.7 E0.02904
G1 X66.891 Y68.716 E0.00075
G1 X67.63 Y71.473 E0.1335
G1 X67.638 Y71.459 E0.00073
G1 X67.944 Y70.906 E0.02958
G1 X67.213 Y68.135 E0.13401
G1 X67.523 Y67.598 E0.02904
G1 X67.528 Y67.613 E0.00076
G1 X68.266 Y70.37 E0.1335
G1 X68.274 Y70.357 E0.00073
G1 X68.58 Y69.804 E0.02958
G1 X67.841 Y67.041 E0.13375
G1 X68.17 Y66.532 E0.02832
G1 X68.173 Y66.546 E0.00066
G1 X68.905 Y69.278 E0.13229
G1 X68.913 Y69.268 E0.00059
G1 X69.249 Y68.822 E0.02611
G1 X68.625 Y66.491 E0.11286
G1 X69.09 Y66.491 E0.02178
G1 X69.653 Y68.592 E0.10175
G1 X70.1 Y68.522 E0.02117
G1 X69.556 Y66.49 E0.0984
G1 X70.022 Y66.491 E0.02181
G1 X70.565 Y68.519 E0.09817
G1 X71.031 Y68.518 E0.02178
G1 X70.488 Y66.491 E0.09817
G1 X70.954 Y66.49 E0.02178
G1 X71.497 Y68.519 E0.09822
G1 X71.963 Y68.52 E0.0218
G1 X71.42 Y66.49 E0.09826
G1 X71.886 Y66.491 E0.02181
G1 X72.429 Y68.518 E0.09815
G1 X72.895 Y68.518 E0.02179
G1 X72.352 Y66.491 E0.09815
; Prepare for Destring
G1 X72.817 Y66.49 E0.02178
G1 X73.361 Y68.52 E0.09827
G1 X73.827 Y68.519 E0.02178
G1 X73.283 Y66.491 E0.09823
G1 X73.749 Y66.491 E0.0218
G1 X74.292 Y68.518 E0.09815
G1 X74.758 Y68.518 E0.02179
G1 X74.215 Y66.491 E0.09817
G1 X74.68 Y66.49 E0.02178
G1 X75.244 Y68.545 E0.09966
G1 X75.788 Y68.886 E0.03007
G1 X75.784 Y68.869 E0.00081
G1 X75.448 Y67.615 E0.06073
G1 X75.147 Y66.491 E0.05443
G1 X75.613 Y66.491 E0.02179
G1 X75.986 Y67.884 E0.06745
G1 X76.276 Y68.968 E0.05246
G1 X76.484 Y69.742 E0.03748
G1 X76.608 Y70.206 E0.02249
G1 X76.65 Y70.361 E0.0075
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for TopSolid (1)
G1 X75.613 Y66.491 E0 F3312
G1 X75.147 Y66.491 E0
G1 X75.283 Y67.001 E0
G1 X75.283 Y67.001 Z10.5125 E0 F900
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 74%
; fan %*255
M106 S189
;
; 'Solid Path', 0.6 [feed mm/s], 13.8 [head mm/s]
G1 X77.962 Y68.306 E0 F9000
G1 X77.962 Y68.306 Z10.0125 E0 F900
; 'Destring Prime'
G1 E1.6 F3000
; head speed 13.799998, filament speed 0.645454, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.004 Y68.463 E0.00761 F828
G1 X78.13 Y68.934 E0.02282
G1 X78.339 Y69.72 E0.03804
G1 X78.632 Y70.82 E0.05325
G1 X79.009 Y72.235 E0.06847
G1 X79.47 Y73.964 E0.08368
G1 X80.014 Y76.007 E0.0989
G1 X79.704 Y76.544 E0.02904
G1 X79.7 Y76.528 E0.00076
G1 X79.089 Y74.249 E0.1104
G1 X78.559 Y72.273 E0.09567
G1 X78.111 Y70.601 E0.08096
G1 X77.745 Y69.233 E0.06623
G1 X77.46 Y68.169 E0.05152
G1 X77.256 Y67.409 E0.0368
G1 X77.134 Y66.953 E0.02207
G1 X77.093 Y66.801 E0.00737
; Blending Fan to Cool (26.4% blend)
; Blended Fan at 81%
; fan %*255
M106 S207
;
; 'Destring/Wipe/Jump Path', 0.0 [feed mm/s], 55.2 [head mm/s]
; 'Destring Suck'
G1 E-1.6 F3000
; head speed 55.200001, filament speed 0.000000, preload 0.000000
; Prepare for End-Of-Layer
G1 X78.387 Y71.631 E0 F3312
; time estimate: pre = 32.075352, post = 40.876686
; Dwell time remaining = -30.876684
;
; Post-layer lift
G1 X78.387 Y71.631 Z10.8125 E0 F900
; END_LAYER_OBJECT z=10.012
;
; *** Cooling Extruder 1 to 0 C and Retiring ***
; NONE
;
; fan off
M107
; *** G-code Postfix ***
;
; END SCRIPT START
G4 ; wait
T0
M104 T0 S0 ; turn off heater
M140 S0 ; turn off heatbed
G91     ;relative positioning
G1 E-3 F300 ;retract the filament a bit before lifting the nozzle to release some of the pressure
G90         ;absolute positioning
M107 ; turn off fan
G1 X0 Y140 F3500; home X Y axis
G1 Z145 F2500; lower z axis
M84 ; disable motors
G4 P300000
M81         ; turn off ATX
; END SCRIPT END
;
;
;
; Estimated Build Time:   25.95 minutes
; Estimated Build Cost:   $0.06
;
; Filament used per extruder:
;    Ext 1 =   541.62 mm  (1.303 cm^3)
;    Ext 2 =     5.59 mm  (0.013 cm^3)
;    Ext 3 =     5.60 mm  (0.013 cm^3)
;    Ext 4 =    94.85 mm  (0.228 cm^3)
; Total Filament Length Used: 647.66 mm
; Total Filament Volume Used: 1.558 cm^3
;
; *** Extrusion Time Breakdown ***
; * estimated time in [s]
; * before possibly slowing down for 'cool'
; * not including Z-travel
;	......................................................................................
;	: Extruder #1 : Extruder #2 : Extruder #3 : Extruder #4 : Path Type                  :
;	:.............:.............:.............:.............:............................:
;	: 20.7463     : 0.100609    : 0.0793437   : 5.16817     : Jump Path                  :
;	: 0           : 0           : 0           : 0           : Pillar Path                :
;	: 0           : 0           : 0           : 0           : Raft Path                  :
;	: 0           > 0           > 0           > 0           > Support Interface Path     :
;	: 0           : 0           : 0           : 0           : Support (may Stack) Path   :
;	: 177.662     : 1.81215     : 1.82066     : 110.961     : Perimeter Path             :
;	: 92.3818     : 1.14027     : 1.14588     : 35.0254     : Loop Path                  :
;	: 122.226     > 5.06211     > 5.05571     > 30.5822     > Solid Path                 :
;	: 33.2773     : 0           : 0           : 9.27185     : Sparse Infill Path         :
;	: 13.897      : 0           : 0           : 3.14821     : Stacked Sparse Infill Path :
;	: 46.9623     : 0.906505    : 0.903999    : 29.6847     : Destring/Wipe/Jump Path    :
;	: 0           > 0           > 0           > 0           > Crown Path                 :
;	: 0           : 0           : 0           : 0           : Prime Pillar Path          :
;	: 0           : 0           : 0           : 0           : Travel Path                :
;	: 0           : 0           : 0           : 0           : Pause Point                :
;	: 365.136     > 63.0375     > 63.0375     > 2103.45     > Extruder Warm-Up           :
;	:.............:.............:.............:.............:............................:
; Total estimated (pre-cool) minutes: 55.73

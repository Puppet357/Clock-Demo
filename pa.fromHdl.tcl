
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name CLOCK -dir "E:/Xilinx ISE Projects/CLOCK/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "CLOCK.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {SEG7.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {DIV.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {COUNT60.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {CLOCK.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top CLOCK $srcset
add_files [list {CLOCK.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3

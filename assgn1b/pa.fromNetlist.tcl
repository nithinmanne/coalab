
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name assgn1b -dir "C:/Users/student/Desktop/1/assgn1b/planAhead_run_2" -part xc3s400pq208-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/student/Desktop/1/assgn1b/count01.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/student/Desktop/1/assgn1b} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "spartan3.ucf" [current_fileset -constrset]
add_files [list {spartan3.ucf}] -fileset [get_property constrset [current_run]]
link_design

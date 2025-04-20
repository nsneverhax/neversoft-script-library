
script Ragdoll_Bail_Get_Bone_Name 
	switch <bone>
		case bone_pelvis
		return bone_name = 'Pelvis'
		case bone_stomach_lower
		return bone_name = 'Ribs'
		case bone_thigh_l
		return bone_name = 'L.Thigh'
		case bone_thigh_r
		return bone_name = 'R.Thigh'
		case bone_knee_l
		return bone_name = 'L.Knee'
		case bone_knee_r
		return bone_name = 'R.Knee'
		case bone_ankle_l
		return bone_name = 'L.Ankle'
		case bone_ankle_r
		return bone_name = 'R.Ankle'
		case bone_neck
		return bone_name = 'Neck'
		case bone_bicep_l
		return bone_name = 'L.Bicep'
		case bone_bicep_r
		return bone_name = 'R.Bicep'
		case bone_forearm_l
		return bone_name = 'L.Forearm'
		case bone_forearm_r
		return bone_name = 'R.Forearm'
		case bone_palm_l
		return bone_name = 'L.Hand'
		case bone_palm_r
		return bone_name = 'R.Hand'
		default
		return
	endswitch
endscript
QuitBailMessageCount = 0

script Ragdoll_Quit_Bail_Message_UI 
	if ($QuitBailMessageCount < 24)
		change QuitBailMessageCount = ($QuitBailMessageCount + 1)
		ui_display_message \{text = "Tip: Press \\m5 to exit bail"
			type = instruction_general
			time = 5}
	endif
endscript

script Ragdoll_Hospital_Bill_UI 
	return
endscript

script Ragdoll_Bail_Message_Hide 
endscript

script Ragdoll_Bail_Short_Msg_Style 
	domorph time = 0 scale = 0.6 alpha = 0
	domorph time = 0.0 scale = 0.75 alpha = 0.3
	domorph time = 0.05 scale = 0.6 alpha = 1
	domorph time = 0.25 scale = 0.6 anim = ease_in
	domorph time = 2.0 scale = 0.55 anim = ease_out
	domorph time = 0.05 scale = 0.6
	domorph time = 0.05 scale = 0.45000002 alpha = 0.5
	domorph time = 0.1 scale = (12.0, 0.0) alpha = 0 anim = ease_in
	die
endscript

script Ragdoll_Bail_Msg_Quick 
	domorph \{alpha = 1
		scale = 1.0
		relative_scale}
endscript

script Ragdoll_Bail_Msg_Quick_Die 
	domorph \{time = 0.1
		alpha = 1
		scale = 2.0
		relative_scale}
	domorph \{time = 0.25
		alpha = 1
		scale = 1.0
		relative_scale}
	domorph \{time = 0.1
		alpha = 0
		scale = 1.0
		relative_scale}
	die
endscript

script Ragdoll_Bail_Msg_On_Off 
	domorph \{alpha = 1
		scale = 1.0
		relative_scale}
endscript

script Ragdoll_Bail_Figure_Percent 
	domorph \{time = 0.1
		alpha = 1.0
		scale = 1.0
		relative_scale}
	die
endscript

script ui_ragdoll_destroy_elements 
	if screenelementexists id = ragdoll_bail_container
		doscreenelementmorph id = ragdoll_bail_score scale = 1.1
		doscreenelementmorph id = ragdoll_bail_score rgba = [90 40 20 0] alpha = 0 time = 0.25
	endif
	wait 1 second
	if screenelementexists id = ragdoll_bail_container
		wait 1.5 seconds
		if screenelementexists id = ragdoll_bail_container
			doscreenelementmorph id = ragdoll_bail_container alpha = 0 time = 0.25
		endif
		wait 0.25 seconds
		if screenelementexists id = ragdoll_bail_container
			destroyscreenelement id = ragdoll_bail_container
		endif
	endif
endscript

script ui_ragdoll_hide_elements 
	if screenelementexists \{id = ragdoll_bail_container}
		setscreenelementprops \{id = ragdoll_bail_container
			hide}
	endif
endscript

script ui_ragdoll_show_elements 
	if screenelementexists \{id = ragdoll_bail_container}
		setscreenelementprops \{id = ragdoll_bail_container
			unhide}
	endif
endscript

g_debug_screenshot_util_bandmember = GUITARIST
g_debug_screenshot_util_bandmember_array = [
	GUITARIST
	BASSIST
	vocalist
	drummer
]
g_debug_screenshot_util_bone = bone_head
g_debug_screenshot_util_bone_array = [
	{
		bone = BONE_PELVIS
		text = qs(0x979c653c)
	}
	{
		bone = bone_head
		text = qs(0xba9759e2)
	}
	{
		bone = Bone_Neck
		text = qs(0x51698421)
	}
	{
		bone = bone_chest
		text = qs(0x0016bd4d)
	}
	{
		bone = Bone_Collar_R
		text = qs(0xeddbb2b5)
	}
	{
		bone = Bone_Collar_L
		text = qs(0x77c18033)
	}
	{
		bone = Bone_Bicep_R
		text = qs(0x0a0e25b6)
	}
	{
		bone = Bone_Bicep_L
		text = qs(0x10216526)
	}
	{
		bone = Bone_Forearm_R
		text = qs(0xf0a46492)
	}
	{
		bone = Bone_Forearm_L
		text = qs(0x66d31001)
	}
	{
		bone = Bone_Palm_R
		text = qs(0x428dda2c)
	}
	{
		bone = Bone_Palm_L
		text = qs(0xb77e2d88)
	}
	{
		bone = Bone_Knee_R
		text = qs(0x88645ef1)
	}
	{
		bone = Bone_Knee_L
		text = qs(0x42baec7a)
	}
]
g_debug_screenshot_util_lockto_bone = BONE_PELVIS
g_debug_screenshot_util_value1 = 150
g_debug_screenshot_util_value1_bound_low = 0
g_debug_screenshot_util_value1_bound_high = 300
g_debug_screenshot_util_value2 = 0
g_debug_screenshot_util_value2_bound_low = 0
g_debug_screenshot_util_value2_bound_high = 360
g_debug_screenshot_util_value3 = 0
g_debug_screenshot_util_value3_bound_low = -300
g_debug_screenshot_util_value3_bound_high = 300
g_debug_screenshot_util_value4 = 0
g_debug_screenshot_util_value4_bound_low = 0
g_debug_screenshot_util_value4_bound_high = 360
g_debug_screenshot_util_value5 = 72
g_debug_screenshot_util_value5_bound_low = 1
g_debug_screenshot_util_value5_bound_high = 99
g_debug_screenshot_util_debug_menu_hidden = 0
g_debug_screenshot_util_precise_tuning_enabled = 0
g_debug_screenshot_util_curr_increment = 10

script debug_screenshot_util_update_precise_tuning 
	if ($g_debug_screenshot_util_precise_tuning_enabled > 0)
		Change \{g_debug_screenshot_util_curr_increment = 1}
	else
		Change \{g_debug_screenshot_util_curr_increment = 10}
	endif
endscript

script debug_screenshot_util_additional_start_script 
	debug_screenshot_util_update_target_camera
	debug_screenshot_util_force_show_debug_menu
	debug_screenshot_util_update_precise_tuning
endscript

script debug_screenshot_util_back_script 
	debug_screenshot_util_force_show_debug_menu
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script debug_screenshot_util_update_target_camera 
	destroy_cameracuts
	kill_dummy_bg_camera
	UnPauseGame
	cos ($g_debug_screenshot_util_value2)
	x_coor = ($g_debug_screenshot_util_value1 * <cos>)
	sin ($g_debug_screenshot_util_value2)
	y_coor = ($g_debug_screenshot_util_value1 * <sin>)
	<cam_pos> = (((<x_coor> / 100.0) * (0.0, 1.0, 0.0)) + ((<y_coor> / 100.0) * (0.0, 0.0, 1.0)) + (($g_debug_screenshot_util_value3 / 100.0) * (1.0, 0.0, 0.0)))
	cos ($g_debug_screenshot_util_value4 / 2)
	sin ($g_debug_screenshot_util_value4 / 2)
	<cam_rotate> = ((<cos> * (0.0, 1.0, 0.0)) + (<sin> * (0.0, 0.0, 1.0)))
	KillCamAnim \{Name = debug_screenshot_util_target_cam}
	PlayIGCCam {
		Name = debug_screenshot_util_target_cam
		viewport = bg_viewport
		LockTo = ($g_debug_screenshot_util_bandmember)
		LockToBone = ($g_debug_screenshot_util_lockto_bone)
		LookAt = ($g_debug_screenshot_util_bandmember)
		LookAtBone = ($g_debug_screenshot_util_bone)
		Quat = <cam_rotate>
		Pos = <cam_pos>
		FOV = ($g_debug_screenshot_util_value5)
		play_hold
	}
	Wait \{2
		gameframe}
	GUITARIST :userviewerx_update_character
	BASSIST :userviewerx_update_character
	drummer :userviewerx_update_character
	vocalist :userviewerx_update_character
	PauseGame
endscript

script debug_screenshot_util_bandmember_get_value 
	return \{value = $g_debug_screenshot_util_bandmember}
endscript

script debug_screenshot_util_bandmember_get_text 
	RequireParams \{[
			value
		]
		all}
	<text> = qs(0x1f9d8c4a)
	switch <value>
		case GUITARIST
		<text> = qs(0x016ac53c)
		case BASSIST
		<text> = qs(0xa8cc1633)
		case vocalist
		<text> = qs(0xea5848cf)
		case drummer
		<text> = qs(0xf71edc04)
	endswitch
	return text = <text>
endscript

script debug_screenshot_util_bandmember_find_index 
	RequireParams \{[
			value
		]
		all}
	GetArraySize ($g_debug_screenshot_util_bandmember_array)
	<idx> = 0
	begin
	<curr_band_member> = ($g_debug_screenshot_util_bandmember_array [<idx>])
	if (<value> = <curr_band_member>)
		break
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
	return idx = <idx> array_Size = <array_Size>
endscript

script debug_screenshot_util_bandmember_update 
	RequireParams \{[
			idx
		]
		all}
	Change g_debug_screenshot_util_bandmember = ($g_debug_screenshot_util_bandmember_array [<idx>])
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_bandmember_option_left 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bandmember_find_index value = <value>
	<idx> = (<idx> - 1)
	if (<idx> < 0)
		<idx> = (<array_Size> - 1)
	endif
	debug_screenshot_util_bandmember_update idx = <idx>
endscript

script debug_screenshot_util_bandmember_option_right 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bandmember_find_index value = <value>
	<idx> = (<idx> + 1)
	if (<idx> = <array_Size>)
		<idx> = 0
	endif
	debug_screenshot_util_bandmember_update idx = <idx>
endscript

script debug_screenshot_util_bone_get_value 
	return \{value = $g_debug_screenshot_util_bone}
endscript

script debug_screenshot_util_bone_get_text 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bone_find_index value = <value>
	text = ($g_debug_screenshot_util_bone_array [<idx>].text)
	return text = <text>
endscript

script debug_screenshot_util_bone_update 
	RequireParams \{[
			idx
		]
		all}
	Change g_debug_screenshot_util_bone = ($g_debug_screenshot_util_bone_array [<idx>].bone)
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_bone_find_index 
	RequireParams \{[
			value
		]
		all}
	GetArraySize ($g_debug_screenshot_util_bone_array)
	<idx> = 0
	begin
	<curr_bone> = ($g_debug_screenshot_util_bone_array [<idx>].bone)
	if (<value> = <curr_bone>)
		break
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
	return idx = <idx> array_Size = <array_Size>
endscript

script debug_screenshot_util_bone_option_left 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bone_find_index value = <value>
	<idx> = (<idx> - 1)
	if (<idx> < 0)
		<idx> = (<array_Size> - 1)
	endif
	debug_screenshot_util_bone_update idx = <idx>
endscript

script debug_screenshot_util_bone_option_right 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bone_find_index value = <value>
	<idx> = (<idx> + 1)
	if (<idx> = <array_Size>)
		<idx> = 0
	endif
	debug_screenshot_util_bone_update idx = <idx>
endscript

script debug_screenshot_util_lockto_bone_get_value 
	return \{value = $g_debug_screenshot_util_lockto_bone}
endscript

script debug_screenshot_util_lockto_bone_get_text 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bone_find_index value = <value>
	text = ($g_debug_screenshot_util_bone_array [<idx>].text)
	return text = <text>
endscript

script debug_screenshot_util_lockto_bone_update 
	RequireParams \{[
			idx
		]
		all}
	Change g_debug_screenshot_util_lockto_bone = ($g_debug_screenshot_util_bone_array [<idx>].bone)
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_lockto_bone_option_left 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bone_find_index value = <value>
	<idx> = (<idx> - 1)
	if (<idx> < 0)
		<idx> = (<array_Size> - 1)
	endif
	debug_screenshot_util_lockto_bone_update idx = <idx>
endscript

script debug_screenshot_util_lockto_bone_option_right 
	RequireParams \{[
			value
		]
		all}
	debug_screenshot_util_bone_find_index value = <value>
	<idx> = (<idx> + 1)
	if (<idx> = <array_Size>)
		<idx> = 0
	endif
	debug_screenshot_util_lockto_bone_update idx = <idx>
endscript

script debug_screenshot_util_get_value_left \{Increment = 1}
	RequireParams \{[
			value
			low_bound
			high_bound
		]}
	<value> = (<value> - <Increment>)
	if (<value> < <low_bound>)
		<value> = <high_bound>
	endif
	return value = <value>
endscript

script debug_screenshot_util_get_value_right \{Increment = 1}
	RequireParams \{[
			value
			low_bound
			high_bound
		]}
	<value> = (<value> + <Increment>)
	if (<value> > <high_bound>)
		<value> = <low_bound>
	endif
	return value = <value>
endscript

script debug_screenshot_util_value1_get_value 
	return \{value = $g_debug_screenshot_util_value1}
endscript

script debug_screenshot_util_value1_get_text 
	formatText TextName = text qs(0x0bc409e2) a = <value>
	return text = <text>
endscript

script debug_screenshot_util_value1_update 
	RequireParams \{[
			value
		]}
	Change g_debug_screenshot_util_value1 = <value>
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_value1_option_left 
	debug_screenshot_util_get_value_left {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value1_bound_low)
		high_bound = ($g_debug_screenshot_util_value1_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value1_update value = <value>
endscript

script debug_screenshot_util_value1_option_right 
	debug_screenshot_util_get_value_right {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value1_bound_low)
		high_bound = ($g_debug_screenshot_util_value1_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value1_update value = <value>
endscript

script debug_screenshot_util_value2_get_value 
	return \{value = $g_debug_screenshot_util_value2}
endscript

script debug_screenshot_util_value2_get_text 
	formatText TextName = text qs(0x0bc409e2) a = <value>
	return text = <text>
endscript

script debug_screenshot_util_value2_update 
	RequireParams \{[
			value
		]}
	Change g_debug_screenshot_util_value2 = <value>
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_value2_option_left 
	debug_screenshot_util_get_value_left {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value2_bound_low)
		high_bound = ($g_debug_screenshot_util_value2_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value2_update value = <value>
endscript

script debug_screenshot_util_value2_option_right 
	debug_screenshot_util_get_value_right {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value2_bound_low)
		high_bound = ($g_debug_screenshot_util_value2_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value2_update value = <value>
endscript

script debug_screenshot_util_value3_get_value 
	return \{value = $g_debug_screenshot_util_value3}
endscript

script debug_screenshot_util_value3_get_text 
	formatText TextName = text qs(0x0bc409e2) a = <value>
	return text = <text>
endscript

script debug_screenshot_util_value3_update 
	RequireParams \{[
			value
		]}
	Change g_debug_screenshot_util_value3 = <value>
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_value3_option_left 
	debug_screenshot_util_get_value_left {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value3_bound_low)
		high_bound = ($g_debug_screenshot_util_value3_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value3_update value = <value>
endscript

script debug_screenshot_util_value3_option_right 
	debug_screenshot_util_get_value_right {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value3_bound_low)
		high_bound = ($g_debug_screenshot_util_value3_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value3_update value = <value>
endscript

script debug_screenshot_util_value4_get_value 
	return \{value = $g_debug_screenshot_util_value4}
endscript

script debug_screenshot_util_value4_get_text 
	formatText TextName = text qs(0x0bc409e2) a = <value>
	return text = <text>
endscript

script debug_screenshot_util_value4_update 
	RequireParams \{[
			value
		]}
	Change g_debug_screenshot_util_value4 = <value>
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_value4_option_left 
	debug_screenshot_util_get_value_left {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value4_bound_low)
		high_bound = ($g_debug_screenshot_util_value4_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value4_update value = <value>
endscript

script debug_screenshot_util_value4_option_right 
	debug_screenshot_util_get_value_right {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value4_bound_low)
		high_bound = ($g_debug_screenshot_util_value4_bound_high)
		Increment = ($g_debug_screenshot_util_curr_increment)
	}
	debug_screenshot_util_value4_update value = <value>
endscript

script debug_screenshot_util_value5_get_value 
	return \{value = $g_debug_screenshot_util_value5}
endscript

script debug_screenshot_util_value5_get_text 
	formatText TextName = text qs(0x0bc409e2) a = <value>
	return text = <text>
endscript

script debug_screenshot_util_value5_update 
	RequireParams \{[
			value
		]}
	Change g_debug_screenshot_util_value5 = <value>
	debug_screenshot_util_update_target_camera
endscript

script debug_screenshot_util_value5_option_left 
	debug_screenshot_util_get_value_left {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value5_bound_low)
		high_bound = ($g_debug_screenshot_util_value5_bound_high)
	}
	debug_screenshot_util_value5_update value = <value>
endscript

script debug_screenshot_util_value5_option_right 
	debug_screenshot_util_get_value_right {
		value = <value>
		low_bound = ($g_debug_screenshot_util_value5_bound_low)
		high_bound = ($g_debug_screenshot_util_value5_bound_high)
	}
	debug_screenshot_util_value5_update value = <value>
endscript

script debug_screenshot_util_force_show_debug_menu 
	generic_menu :se_setprops \{alpha = 1}
endscript

script debug_screenshot_util_toggle_debug_menu 
	generic_menu :se_getprops
	if (<alpha> = 0)
		generic_menu :se_setprops \{alpha = 1}
	else
		generic_menu :se_setprops \{alpha = 0}
	endif
endscript

script debug_screenshot_util_pause_unpause 
	if GameIsPaused
		UnPauseGame
	else
		PauseGame
	endif
endscript

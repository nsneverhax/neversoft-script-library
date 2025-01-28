Default_Font_Colors = [
	[
		200
		200
		200
		255
	]
	[
		180
		80
		80
		255
	]
	[
		80
		120
		180
		255
	]
	[
		80
		180
		120
		255
	]
	[
		180
		140
		60
		255
	]
	[
		200
		100
		40
		255
	]
	[
		140
		100
		180
		255
	]
	[
		0
		180
		180
		255
	]
	[
		0
		0
		0
		255
	]
	[
		40
		40
		40
		255
	]
	[
		90
		90
		90
		255
	]
	[
		140
		140
		140
		255
	]
]
bedroom_select_skater = came_from_new_life
lens_flare_visible_before_pause = 1
is_changing_levels = 0

script handle_pause_continue 
	root_window :GetTags
	if GotParam \{pause_controller}
		if NOT (<pause_controller> = <device_num>)
			return
		endif
	endif
	unpause_game_and_destroy_pause_menu
endscript

script pause_game_and_create_pause_menu 
	do_actual_pause <...>
	ui_change_state \{State = UIState_pausemenu}
endscript

script do_actual_pause 
	Printf \{"--- do_actual_pause"}
	if NOT CD
		DumpProgressLog
	endif
	if NOT InNetGame
		Printf \{"-------------------- PAUSING GAME ----------------------"}
		PauseGame
		GMan_PauseAllGoals
	endif
	if ScreenElementExists \{Id = root_window}
		SetScreenElementProps \{Id = root_window
			tags = {
				menu_state = ON
			}}
	endif
	if InNetGame
		if NOT IsObserving
			if ObjectExists \{Id = Skater}
				Skater :NetDisablePlayerInput
			endif
		endif
		EnableActuators \{0}
	endif
	if InSplitScreenGame
		EnableActuators \{0}
	endif
	Change \{viewer_buttons_enabled = 0}
endscript

script unpause_game_and_destroy_pause_menu 
	Printf \{"--- unpause_game_and_destroy_pause_menu"}
	do_actual_unpause <...>
	Printf \{"unpause_game_and_destroy_pause_menu 1"}
	ui_change_state \{State = UIState_Gameplay}
	Printf \{"unpause_game_and_destroy_pause_menu 2"}
endscript

script do_actual_unpause 
	Printf \{"--- do_actual_unpause"}
	Change \{check_for_unplugged_controllers = 0}
	ClearViewerObject
	DeBounce \{X
		Time = 0.3}
	DeBounce \{TRIANGLE
		Time = 0.3}
	DeBounce \{CIRCLE
		Time = 0.3}
	DeBounce \{SQUARE
		Time = 0.3}
	pause_menu_gradient \{OFF}
	Change \{inside_pause = 0}
	Change \{no_focus_sound = 1}
	if InNetGame
		if NOT IsObserving
			if ObjectExists \{Id = Skater}
				Skater :NetEnablePlayerInput
			endif
		endif
		EnableActuators \{1}
	endif
	if InSplitScreenGame
		EnableActuators \{1}
	endif
	if NOT InNetGame
		Printf \{'-------------------- UNPAUSING GAME ----------------------'}
		UnPauseGame
	endif
	PauseStream \{0}
	PauseMusic \{0}
	GMan_UnPauseAllGoals
	if NOT InNetGame
		if NOT GameModeEquals \{is_horse}
			UnPauseSkaters
		endif
	endif
	if GMan_HasActiveGoals
		GMan_ToggleAllGoalTriggers \{Hide = 1}
	endif
	Change \{check_for_unplugged_controllers = 1}
	if ScreenElementExists \{Id = root_window}
		SetScreenElementProps \{Id = root_window
			tags = {
				menu_state = OFF
			}}
	endif
	Change \{viewer_buttons_enabled = 1}
endscript

script enable_new_ui_system 
	MemPushContext \{AIHeap}
	RegisterBehaviors_Debug
	RegisterBehaviors_RunScript
	RegisterBehaviors_RunBehavior
	MemPopContext
	RegisterUIBehaviors
endscript
ui_controller_which_paused = 0

script handle_start_pressed 
	if NOT RenderingEnabled
		return
	endif
	if IsTrue \{$paused_for_hardware}
		Printf \{"handle_start_pressed: $paused_for_hardware is true, ending"}
		return
	endif
	if IsTrue \{$sysnotify_wait_in_progress}
		Printf \{"handle_start_pressed: $sysnotify_wait_in_progress is true, ending"}
		return
	endif
	if ($is_changing_levels = 1)
		Printf \{"handle_start_pressed: $is_changing_levels is true, ending"}
		return
	endif
	if IsTrue \{$ingame_save_active}
		Printf \{"handle_start_pressed: $ingame_save_active is true, ending"}
		return
	endif
	if InFrontEnd
		Printf \{"handle_start_pressed: InFrontEnd is true, ending"}
		return
	endif
	root_window :GetTags
	Change ui_controller_which_paused = <device_num>
	if CheckSumEquals A = <menu_state> B = ON
		if GotParam \{pause_controller}
			if NOT (<pause_controller> = -1)
				if NOT (<device_num> = <pause_controller>)
					return
				endif
			endif
		endif
		do_actual_unpause
		BroadCastEvent \{Type = event_unpause_game}
		ui_change_state \{State = UIState_Gameplay}
		Change \{inside_pause = 0}
	endif
	if CheckSumEquals A = <menu_state> B = OFF
		if NOT InMultiPlayerGame
			if NOT ControllerBoundToSkater controller = <device_num> Skater = 0
				return
			endif
		else
			if InSplitScreenGame
				if NOT ControllerBoundToSkater controller = <device_num> Skater = 0
					if NOT ControllerBoundToSkater controller = <device_num> Skater = 1
						return
					endif
				endif
			endif
		endif
		if InNetGame
			if NOT ControllerBoundToSkater controller = <device_num> Skater = 0
				return
			endif
		endif
		SetTags pause_controller = <device_num>
		if NOT InNetGame
			GetSkaterId
			if GetSkaterCamAnimParams Skater = <ObjID>
				if (<allow_pause> = 0)
					return
				endif
			endif
		endif
		BroadCastEvent \{Type = event_pause_game}
		if GMan_GoalIsActive \{goal = m_pro_burnquist}
			Wait \{2
				GameFrame}
		endif
		do_actual_pause
		set_pause_menu_allow_continue
		if InTraining
			ui_change_state \{State = UIState_Training_PauseMenu}
		else
			ui_change_state \{State = UIState_pausemenu}
		endif
	endif
endscript

script set_pause_menu_allow_continue 
	if GotParam \{OFF}
		root_window :SetTags \{no_exit_pause_menu = 1}
	else
		root_window :RemoveTags \{tags = [
				no_exit_pause_menu
			]}
	endif
endscript

script set_custom_restart 
	if NOT Skater :InAir
		Skater :SetCustomRestart \{Set}
	endif
endscript

script skip_to_custom_restart 
	Skater :SkipToCustomRestart
endscript

script set_sub_bg \{PARENT = current_menu_anchor
		Pos = (326.0, 115.0)
		Scale = (1.1700001, 1.1)
		just = [
			Center
			Top
		]}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <PARENT>
		texture = options_bg
		draw_behind_parent
		Pos = <Pos>
		Scale = <Scale>
		just = <just>
		rgba = [128 128 128 128]
		z_priority = 1
	}
endscript

script hide_everything 
	DoScreenElementMorph \{Id = root_window
		Time = 0
		Scale = 0}
endscript

script unhide_everything 
	DoScreenElementMorph \{Id = root_window
		Time = 0
		Scale = 1}
endscript

script hide_all_hud_sprites 
	dialog_box_exit no_pad_start <...>
	if ScreenElementExists \{Id = console_message_vmenu}
		DoScreenElementMorph \{Id = console_message_vmenu
			Time = 0
			Scale = 0}
	endif
	if ScreenElementExists \{Id = first_time_goal_info}
		DestroyScreenElement \{Id = first_time_goal_info}
	endif
	if ScreenElementExists \{Id = cutscene_camera_hud_anchor}
		Change \{camera_hud_is_hidden = 1}
		DoScreenElementMorph \{Id = cutscene_camera_hud_anchor
			Alpha = 0}
	endif
	if ScreenElementExists \{Id = the_time}
		SetScreenElementProps \{Id = the_time
			Hide}
	endif
	if ScreenElementExists \{Id = goal_viewport_parent}
		SetScreenElementProps \{Id = goal_viewport_parent
			Hide}
	endif
	if NOT GotParam \{ignore_speech_boxes}
		hide_speech_boxes
	endif
	if ScreenElementExists \{Id = digital_timer_anchor}
		SetScreenElementProps \{Id = digital_timer_anchor
			Hide}
	endif
	if ScreenElementExists \{Id = lightning_container}
		SetScreenElementProps \{Id = lightning_container
			Hide}
	endif
	xboxlive_message_container_hide
	hide_panel_messages
	pause_balance_meter
	pause_run_timer
	hide_goal_panel_messages
	GoalManager_HideGoalPoints
	hide_3d_goal_arrow
	hide_landing_msg
	hide_console_window
	hide_net_scores
	hide_comp_text
	hide_tips
	pause_trick_text
	hide_death_msg
	hide_compass_anchor
	hide_zone_messages
	hide_panel_stuff
	ui_ragdoll_hide_elements
endscript

script hide_all_hud_items 
	hide_all_hud_sprites <...>
	MaybeHideLensFlare
	if NOT InFrontEnd
		if NOT InMultiPlayerGame
			Change \{lens_flare_visible_before_pause = $DoUpdateLensFlare}
			Change \{DoUpdateLensFlare = 0}
		endif
	endif
	kill_blur
endscript

script show_all_hud_sprites 
	xboxlive_message_container_show
	show_panel_messages
	unhide_3d_goal_arrow
	unhide_landing_msg
	unhide_tips
	unhide_death_msg
	unhide_comp_text
	unpause_trick_text
	if NOT InNetGame
		unpause_trick_text
	endif
	Unpause_Balance_Meter
	unpause_run_timer
	unhide_speech_boxes
	if ScreenElementExists \{Id = cutscene_camera_hud_anchor}
		if (camera_hud_is_hidden = 1)
			Change \{camera_hud_is_hidden = 0}
			DoScreenElementMorph \{Id = cutscene_camera_hud_anchor
				Alpha = 1}
		endif
	endif
	if ScreenElementExists \{Id = lightning_container}
		SetScreenElementProps \{Id = lightning_container
			UnHide}
	endif
	if ScreenElementExists \{Id = the_time}
		SetScreenElementProps \{Id = the_time
			UnHide}
	endif
	if ScreenElementExists \{Id = goal_viewport_parent}
		SetScreenElementProps \{Id = goal_viewport_parent
			UnHide}
	endif
	if ScreenElementExists \{Id = digital_timer_anchor}
		SetScreenElementProps \{Id = digital_timer_anchor
			UnHide}
	endif
	show_goal_panel_messages
	if NOT InMultiPlayerGame
		if NOT GMan_HasActiveGoals
			GoalManager_ShowGoalPoints
		else
			GoalManager_HideGoalPoints
		endif
	endif
	if ObjectExists \{Id = console_message_vmenu}
		DoScreenElementMorph \{Id = console_message_vmenu
			Time = 0
			Scale = 1}
	endif
	if ($HIDEHUD = 1)
		Printf \{"hiding"}
		hide_root_window
	endif
	if GetGlobalFlag \{flag = $NO_DISPLAY_HUD}
		GoalManager_HideGoalPoints
		GoalManager_HidePoints
	endif
	if NOT GetGlobalFlag \{flag = $NO_DISPLAY_CHATWINDOW}
		unhide_console_window
	else
		hide_console_window
	endif
	if NOT GetGlobalFlag \{flag = $NO_DISPLAY_NET_SCORES}
		unhide_net_scores
	else
		hide_net_scores
	endif
	show_compass_anchor
	show_zone_messages
	show_panel_stuff
	ui_ragdoll_show_elements
endscript

script show_all_hud_items 
	if SkaterCamAnimFinished \{Name = igc_custom_camera_name}
		show_all_hud_sprites <...>
	endif
	if NOT InFrontEnd
		if NOT InMultiPlayerGame
			Change \{DoUpdateLensFlare = 1}
			UnHideLensFlare
		endif
	endif
endscript

script hide_speech_boxes 
	if ScreenElementExists \{Id = speech_box_anchor}
		SetScreenElementProps \{Id = speech_box_anchor
			block_events}
		DoScreenElementMorph \{Id = speech_box_anchor
			Scale = 0
			relative_scale}
	endif
	if ScreenElementExists \{Id = goal_start_dialog}
		SetScreenElementProps \{Id = goal_start_dialog
			block_events}
		DoScreenElementMorph \{Id = goal_start_dialog
			Scale = 0
			relative_scale}
	endif
	if ScreenElementExists \{Id = ped_speech_dialog}
		SetScreenElementProps \{Id = ped_speech_dialog
			block_events}
		DoScreenElementMorph \{Id = ped_speech_dialog
			Scale = 0
			relative_scale}
	endif
	if ScreenElementExists \{Id = goal_retry_anchor}
		SetScreenElementProps \{Id = goal_retry_anchor
			block_events}
		DoScreenElementMorph \{Id = goal_retry_anchor
			Scale = 0
			relative_scale}
	endif
	if ScreenElementExists \{Id = ped_hint_dialog}
		SetScreenElementProps \{Id = ped_hint_dialog
			block_events}
		DoScreenElementMorph \{Id = ped_hint_dialog
			Scale = 0
			relative_scale}
	endif
	if player1_panel_container :GetSingleTag \{grid_control_speech_box}
		if ScreenElementExists Id = <grid_control_speech_box>
			SetScreenElementProps Id = <grid_control_speech_box> block_events
			DoScreenElementMorph Id = <grid_control_speech_box> Scale = 0 relative_scale
		endif
	endif
endscript

script unhide_speech_boxes 
	if ScreenElementExists \{Id = speech_box_anchor}
		SetScreenElementProps \{Id = speech_box_anchor
			unblock_events}
		DoScreenElementMorph \{Id = speech_box_anchor
			Scale = 1
			relative_scale}
	endif
	if ScreenElementExists \{Id = goal_start_dialog}
		SetScreenElementProps \{Id = goal_start_dialog
			unblock_events}
		DoScreenElementMorph \{Id = goal_start_dialog
			Scale = 1
			relative_scale}
	endif
	if ScreenElementExists \{Id = ped_speech_dialog}
		SetScreenElementProps \{Id = ped_speech_dialog
			unblock_events}
		DoScreenElementMorph \{Id = ped_speech_dialog
			Scale = 1
			relative_scale}
	endif
	if ScreenElementExists \{Id = goal_retry_anchor}
		SetScreenElementProps \{Id = goal_retry_anchor
			unblock_events}
		DoScreenElementMorph \{Id = goal_retry_anchor
			Scale = 1
			relative_scale}
	endif
	if ScreenElementExists \{Id = ped_hint_dialog}
		SetScreenElementProps \{Id = ped_hint_dialog
			block_events}
		DoScreenElementMorph \{Id = ped_hint_dialog
			Scale = 1
			relative_scale}
	endif
	if player1_panel_container :GetSingleTag \{grid_control_speech_box}
		if ScreenElementExists Id = <grid_control_speech_box>
			SetScreenElementProps Id = <grid_control_speech_box> unblock_events
			DoScreenElementMorph Id = <grid_control_speech_box> Scale = 1 relative_scale
		endif
	endif
endscript

script kill_speech_boxes 
	if ScreenElementExists \{Id = speech_box_anchor}
		DestroyScreenElement \{Id = speech_box_anchor}
	endif
	if ScreenElementExists \{Id = goal_start_dialog}
		DestroyScreenElement \{Id = goal_start_dialog}
	endif
	if ScreenElementExists \{Id = ped_speech_dialog}
		DestroyScreenElement \{Id = ped_speech_dialog}
	endif
	if ScreenElementExists \{Id = goal_retry_anchor}
		DestroyScreenElement \{Id = goal_retry_anchor}
	endif
	if ScreenElementExists \{Id = ped_hint_dialog}
		DestroyScreenElement \{Id = ped_hint_dialog}
	endif
endscript

script hide_landing_msg 
	if ObjectExists \{Id = perfect}
		DoScreenElementMorph \{Id = perfect
			Time = 0
			Alpha = 0}
	endif
	if ObjectExists \{Id = perfect2}
		DoScreenElementMorph \{Id = perfect2
			Time = 0
			Alpha = 0}
	endif
endscript

script unhide_landing_msg 
	if ObjectExists \{Id = perfect}
		DoScreenElementMorph \{Id = perfect
			Time = 0
			Alpha = 0.5}
	endif
	if ObjectExists \{Id = perfect2}
		DoScreenElementMorph \{Id = perfect2
			Time = 0
			Alpha = 0.5}
	endif
endscript

script hide_3d_goal_arrow 
	if ScreenElementExists \{Id = DesignerCreated_3DArrowPointer}
		DoScreenElementMorph \{Id = DesignerCreated_3DArrowPointer
			Pos = (320.0, -300.0)}
	endif
	if ScreenElementExists \{Id = race_arrow}
		DoScreenElementMorph \{Id = race_arrow
			Pos = (320.0, -300.0)}
	endif
	if ScreenElementExists \{Id = ctf_arrow}
		DoScreenElementMorph \{Id = ctf_arrow
			Pos = (320.0, -300.0)}
	endif
endscript

script unhide_3d_goal_arrow 
	if ScreenElementExists \{Id = DesignerCreated_3DArrowPointer}
		DoScreenElementMorph \{Id = DesignerCreated_3DArrowPointer
			Pos = (320.0, 70.0)}
	endif
	if ScreenElementExists \{Id = race_arrow}
		DoScreenElementMorph \{Id = race_arrow
			Pos = (320.0, 70.0)}
	endif
	if ScreenElementExists \{Id = ctf_arrow}
		DoScreenElementMorph \{Id = ctf_arrow
			Pos = (320.0, 70.0)}
	endif
endscript

script hide_net_scores 
	if ObjectExists \{Id = net_score_1}
		DoScreenElementMorph \{Id = net_score_1
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_2}
		DoScreenElementMorph \{Id = net_score_2
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_3}
		DoScreenElementMorph \{Id = net_score_3
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_4}
		DoScreenElementMorph \{Id = net_score_4
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_5}
		DoScreenElementMorph \{Id = net_score_5
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_6}
		DoScreenElementMorph \{Id = net_score_6
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_7}
		DoScreenElementMorph \{Id = net_score_7
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = net_score_8}
		DoScreenElementMorph \{Id = net_score_8
			Time = 0
			Scale = 0}
	endif
endscript

script unhide_net_scores 
	if ObjectExists \{Id = net_score_1}
		DoScreenElementMorph \{Id = net_score_1
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_2}
		DoScreenElementMorph \{Id = net_score_2
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_3}
		DoScreenElementMorph \{Id = net_score_3
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_4}
		DoScreenElementMorph \{Id = net_score_4
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_5}
		DoScreenElementMorph \{Id = net_score_5
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_6}
		DoScreenElementMorph \{Id = net_score_6
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_7}
		DoScreenElementMorph \{Id = net_score_7
			Time = 0
			Scale = 1}
	endif
	if ObjectExists \{Id = net_score_8}
		DoScreenElementMorph \{Id = net_score_8
			Time = 0
			Scale = 1}
	endif
endscript

script hide_current_goal 
	if ObjectExists \{Id = current_goal}
		DoScreenElementMorph \{Id = current_goal
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = mp_goal_text}
		DoScreenElementMorph \{Id = mp_goal_text
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = sc_goal_text}
		DoScreenElementMorph \{Id = sc_goal_text
			Time = 0
			Scale = 0}
	endif
	if ObjectExists \{Id = Eric_score}
		DoScreenElementMorph \{Id = Eric_score
			Time = 0
			Scale = 0}
	endif
endscript
comp_texts = [
	Eric_Text
	Ron_Text
	Johnny_Text
	Chicken_Text
	Raven_Text
	final_scores
	goal_comp_out_of_bounds_warning
]

script hide_comp_text 
	GetArraySize \{$comp_texts}
	<Index> = 0
	begin
	<Id> = ($comp_texts [<Index>])
	if ObjectExists Id = <Id>
		DoScreenElementMorph Id = <Id> Time = 0 Scale = 0
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script unhide_comp_text 
	GetArraySize \{$comp_texts}
	<Index> = 0
	begin
	<Id> = ($comp_texts [<Index>])
	if ObjectExists Id = <Id>
		DoScreenElementMorph Id = <Id> Time = 0 Scale = 1
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script unhide_current_goal 
	if ObjectExists \{Id = current_goal}
		DoScreenElementMorph \{Id = current_goal
			Time = 0
			Scale = 0.83}
	endif
	if ObjectExists \{Id = mp_goal_text}
		DoScreenElementMorph \{Id = mp_goal_text
			Time = 0
			Scale = 0.83}
	endif
	if ObjectExists \{Id = sc_goal_text}
		DoScreenElementMorph \{Id = sc_goal_text
			Time = 0
			Scale = 0.83}
	endif
	if ObjectExists \{Id = Eric_score}
		DoScreenElementMorph \{Id = Eric_score
			Time = 0
			Scale = 0.83}
	endif
endscript

script hide_death_msg 
	if ObjectExists \{Id = death_message}
		DoScreenElementMorph \{Id = death_message
			Time = 0
			Scale = 0}
	endif
endscript

script unhide_death_msg 
	if ObjectExists \{Id = death_message}
		DoScreenElementMorph \{Id = death_message
			Time = 0
			Scale = 1}
	endif
endscript

script hide_tips 
	if ObjectExists \{Id = skater_hint}
		DoScreenElementMorph \{Id = skater_hint
			Time = 0
			Pos = (320.0, 11050.0)}
	endif
endscript

script unhide_tips 
	if ObjectExists \{Id = skater_hint}
		DoScreenElementMorph \{Id = skater_hint
			Time = 0
			Pos = (320.0, 150.0)}
	endif
endscript

script menu_quit_no 
	generic_menu_pad_back_sound
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script change_gamemode_career 
	Printf \{"********** CHANGING GAME MODE TO CAREER"}
	EnableSun
	SetGameType \{Career}
	SetCurrentGameType
	CareerFunc \{func = SetAppropriateNodeFlags}
endscript

script change_gamemode_classic 
	Printf \{"********** CHANGING GAME MODE TO CLASSIC"}
	EnableSun
	SetGameType \{Classic}
	SetCurrentGameType
	CareerFunc \{func = SetAppropriateNodeFlags}
endscript

script change_gamemode_coop 
	Printf \{"********** CHANGING GAME MODE TO CO-OP"}
	EnableSun
	SetGameType \{coop}
	SetCurrentGameType
	CareerFunc \{func = SetAppropriateNodeFlags}
endscript

script change_gamemode_net 
	Printf \{"********** CHANGING GAME MODE TO NET!!!"}
	DisableSun
	SetGameType \{net}
	SetCurrentGameType
	CareerFunc \{func = SetAppropriateNodeFlags}
endscript

script change_gamemode_singlesession 
	EnableSun
	SetGameType \{singlesession}
	SetCurrentGameType
	CareerFunc \{func = SetAppropriateNodeFlags}
endscript

script change_gamemode_freeskate_2p 
	DisableSun
	SetGameType \{freeskate2p}
	SetCurrentGameType
	CareerFunc \{func = SetAppropriateNodeFlags}
endscript

script animate_in 
	SetButtonEventMappings \{block_menu_input}
	SetScreenElementProps \{Id = root_window
		tags = {
			menu_state = entering
		}}
	LaunchEvent Type = Focus Target = <menu_id>
	DoMorph \{Time = 0.05
		Rot_Angle = 3
		Pos = (40.0, 0.0)
		Alpha = 1}
	DoMorph \{Time = 0.01
		Rot_Angle = 0
		Pos = (10.0, 0.0)}
	SetScreenElementProps \{Id = root_window
		tags = {
			menu_state = ON
		}}
	if NOT GotParam \{dont_unblock}
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script menu_onscreen \{menu_id = current_menu_anchor}
	DoMorph \{Scale = 1
		Time = 0}
	if GotParam \{Pos}
		DoMorph Pos = <Pos>
	endif
	SetProps \{just = [
			Center
			Center
		]}
	GetTags
	if GotParam \{focus_child}
		LaunchEvent Type = Focus Target = <menu_id> Data = {child_id = <focus_child>}
	else
		LaunchEvent Type = Focus Target = <Id>
	endif
	if NOT GotParam \{preserve_menu_state}
		SetScreenElementProps \{Id = root_window
			tags = {
				menu_state = ON
			}}
	endif
endscript

script animate_out \{menu_id = current_menu_anchor}
	SetButtonEventMappings \{block_menu_input}
	SetScreenElementProps \{Id = root_window
		tags = {
			menu_state = leaving
		}}
	GetTags
	SetProps \{just = [
			Center
			Center
		]}
	DoMorph \{Time = 0
		Scale = 1.0}
	DoMorph \{Time = 0.3
		Alpha = 0}
	SetScreenElementProps \{Id = root_window
		tags = {
			menu_state = OFF
		}}
	SetScreenElementLock \{Id = root_window
		OFF}
	DestroyScreenElement Id = <menu_id>
	SetButtonEventMappings \{unblock_menu_input}
endscript

script menu_offscreen 
	SetScreenElementProps \{Id = root_window
		tags = {
			menu_state = OFF
		}}
	SetScreenElementLock \{Id = root_window
		OFF}
	GetTags
	LaunchEvent Type = unfocus Target = <Id>
	DestroyScreenElement Id = <Id> recurse
endscript

script hide_root_window 
	SetScreenElementProps \{Id = root_window
		Hide}
endscript

script unhide_root_window 
	SetScreenElementProps \{Id = root_window
		UnHide}
endscript

script generic_menu_update_arrows \{menu_id = current_menu}
	if NOT ObjectExists Id = <up_arrow_id>
		return
	endif
	if NOT ObjectExists Id = <down_arrow_id>
		return
	endif
	if <menu_id> :Menu_SelectedIndexIs First
		SetScreenElementProps {
			Id = <up_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		SetScreenElementProps {
			Id = <up_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
	if <menu_id> :Menu_SelectedIndexIs LAST
		SetScreenElementProps {
			Id = <down_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		SetScreenElementProps {
			Id = <down_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
endscript

script generic_menu_pad_back 
	Printf \{"generic_menu_pad_back Parameters = "}
	generic_menu_pad_back_sound
	if GotParam \{callback}
		<callback> <...>
	endif
endscript

script generic_menu_pad_choose 
	if GotParam \{callback}
		<callback> <...>
	endif
endscript

script generic_menu_pad_back_sound 
endscript

script generic_menu_pad_up_down_sound 
endscript

script generic_menu_pad_choose_sound 
	SoundEvent \{Event = ui_sfx_select}
endscript
disable_menu_sounds = 0

script generic_menu_up_or_down_sound \{menu_id = current_menu}
	Printf \{"--- generic_menu_up_or_down_sound"}
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_scroll}
		SoundEvent \{Event = ui_sfx_scroll_add}
	endif
endscript

script generic_menu_scroll_sideways_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = Generic_menu_pad_sideways_SFX}
	endif
endscript

script generic_keyboard_sound 
endscript

script theme_menu_pad_choose_sound 
	SoundEvent \{Event = Generic_menu_pad_choose_SFX}
endscript

script generic_pause_exit_sound 
	SoundEvent \{Event = Generic_menu_pad_back_SFX}
endscript

script videophone_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if GotParam \{UP}
			SoundEvent \{Event = VP_menu_pad_up_SFX}
		endif
		if GotParam \{DOWN}
			SoundEvent \{Event = VP_menu_pad_down_SFX}
		endif
	endif
endscript

script Videophone_pad_back_sound 
	SoundEvent \{Event = VP_menu_pad_back_SFX}
endscript

script Videophone_pad_choose_sound 
	SoundEvent \{Event = VP_menu_pad_Select_SFX}
endscript

script cas_menu_pad_choose_sound 
	SoundEvent \{Event = CAS_menu_pad_choose_SFX}
endscript

script cas_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if GotParam \{UP}
			SoundEvent \{Event = CAS_menu_pad_up_SFX}
		endif
		if GotParam \{DOWN}
			SoundEvent \{Event = CAS_menu_pad_down_SFX}
		endif
	endif
endscript

script menu_audio_settings_band_volume_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_bandvol}
	endif
endscript

script menu_audio_settings_guitar_volume_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_guitvol}
	endif
endscript

script menu_audio_settings_fx_volume_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_crowdvol}
	endif
endscript

script menu_video_settings_lefty_flip_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = Box_Check_SFX}
	endif
endscript

script menu_video_settings_calibrate_strum_sound 
	if ($disable_menu_sounds = 0)
		generic_menu_up_or_down_sound
	endif
endscript

script menu_video_settings_calibrate_reset_to_zero_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_select}
	endif
endscript

script menu_song_complete_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_select}
	endif
endscript

script menu_get_sponsor_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_select}
	endif
endscript

script menu_setlist_bonus_tab_sound 
	Printf \{"here %s"
		S = $disable_menu_sounds}
	if ($disable_menu_sounds = 0)
		Printf \{"sklajkjahsdflhasdlasdf"}
		SoundEvent \{Event = ui_sfx_select}
	endif
endscript

script menu_setlist_downloads_tab_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_select}
	endif
endscript

script menu_setlist_setlist_tab_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{Event = ui_sfx_select}
	endif
endscript

script reset_gamemode 
	ResetToDefaultProfile \{Name = custom_story}
	CareerFunc \{func = Reset}
	if ObjectExists \{Id = Skater}
		Skater :RecordComponent_ResetComponent
	endif
	GMan_ResetCareer
	CareerFunc \{func = SetAppropriateNodeFlags}
	training_reset_checkpoints
	UnSetGlobalFlag \{flag = $CAREER_STARTED}
	GetArraySize \{$STORY_CLEAR_GLOBAL_FLAGS}
	Index = 0
	begin
	Printf "clearing global flag %d" D = ($STORY_CLEAR_GLOBAL_FLAGS [<Index>])
	UnSetGlobalFlag flag = ($STORY_CLEAR_GLOBAL_FLAGS [<Index>])
	<Index> = (<Index> + 1)
	repeat <array_Size>
	if GetGlobalFlag \{flag = $CHEAT_CAS_VANS_UNLOCKED}
		cheat_unlock_the_vans
	endif
endscript

script generic_menu_animate_in \{Menu = current_menu_anchor}
	if GotParam \{Force}
		<Menu> :SetTags animate_me = 1
	else
		if NOT <Menu> :GetSingleTag animate_me
			return
		endif
	endif
	if GotParam \{Pos}
		ScreenELementPos = <Pos>
	else
		GetScreenElementPosition Id = <Menu>
	endif
	DoScreenElementMorph Id = <Menu> Pos = (<ScreenELementPos> + (640.0, 0.0)) Time = 0
	DoScreenElementMorph Id = <Menu> Pos = <ScreenELementPos> Time = 0.15
	if NOT GotParam \{No_wait}
		Wait \{0.2
			Seconds}
	endif
endscript

script generic_menu_animate_out \{Menu = current_menu_anchor}
	if GotParam \{Force}
		<Menu> :SetTags animate_me = 1
	endif
	if NOT <Menu> :GetSingleTag animate_me
		return
	endif
	if GotParam \{Pos}
		ScreenELementPos = <Pos>
	else
		GetScreenElementPosition Id = <Menu>
	endif
	DoScreenElementMorph Id = <Menu> Pos = (<ScreenELementPos> + (640.0, 0.0)) Time = 0.15
	Wait \{0.2
		Seconds}
endscript

script generic_animate_out_last_menu 
	if ObjectExists \{Id = current_menu}
		if current_menu :GetSingleTag \{animate_me}
			generic_menu_animate_out \{Menu = current_menu}
			return
		endif
	endif
	if ObjectExists \{Id = current_menu_anchor}
		if current_menu_anchor :GetSingleTag \{animate_me}
			generic_menu_animate_out
			return
		endif
	endif
	if ObjectExists \{Id = sub_menu}
		if sub_menu :GetSingleTag \{animate_me}
			generic_menu_animate_out \{Force
				Menu = sub_menu
				Pos = (320.0, 240.0)}
			return
		endif
	endif
endscript

script RunScriptOnScreenElement_script 
	RunScriptOnScreenElement <...>
endscript

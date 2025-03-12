default_font_colors = [
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
	root_window :gettags
	if gotparam \{pause_controller}
		if NOT (<pause_controller> = <device_num>)
			return
		endif
	endif
	unpause_game_and_destroy_pause_menu
endscript

script pause_game_and_create_pause_menu 
	do_actual_pause <...>
	ui_change_state \{state = uistate_pausemenu}
endscript

script do_actual_pause 
	printf \{"--- do_actual_pause"}
	if NOT cd
		dumpprogresslog
	endif
	if NOT innetgame
		printf \{"-------------------- PAUSING GAME ----------------------"}
		pausegame
		gman_pauseallgoals
	endif
	if screenelementexists \{id = root_window}
		setscreenelementprops \{id = root_window
			tags = {
				menu_state = on
			}}
	endif
	if innetgame
		if NOT isobserving
			if objectexists \{id = skater}
				skater :netdisableplayerinput
			endif
		endif
		enableactuators \{0}
	endif
	if insplitscreengame
		enableactuators \{0}
	endif
	change \{viewer_buttons_enabled = 0}
endscript

script unpause_game_and_destroy_pause_menu 
	printf \{"--- unpause_game_and_destroy_pause_menu"}
	do_actual_unpause <...>
	printf \{"unpause_game_and_destroy_pause_menu 1"}
	ui_change_state \{state = uistate_gameplay}
	printf \{"unpause_game_and_destroy_pause_menu 2"}
endscript

script do_actual_unpause 
	printf \{"--- do_actual_unpause"}
	change \{check_for_unplugged_controllers = 0}
	clearviewerobject
	debounce \{x
		time = 0.3}
	debounce \{triangle
		time = 0.3}
	debounce \{circle
		time = 0.3}
	debounce \{square
		time = 0.3}
	pause_menu_gradient \{off}
	change \{inside_pause = 0}
	change \{no_focus_sound = 1}
	if innetgame
		if NOT isobserving
			if objectexists \{id = skater}
				skater :netenableplayerinput
			endif
		endif
		enableactuators \{1}
	endif
	if insplitscreengame
		enableactuators \{1}
	endif
	if NOT innetgame
		printf \{'-------------------- UNPAUSING GAME ----------------------'}
		unpausegame
	endif
	pausestream \{0}
	pausemusic \{0}
	gman_unpauseallgoals
	if NOT innetgame
		if NOT gamemodeequals \{is_horse}
			unpauseskaters
		endif
	endif
	if gman_hasactivegoals
		gman_toggleallgoaltriggers \{hide = 1}
	endif
	change \{check_for_unplugged_controllers = 1}
	if screenelementexists \{id = root_window}
		setscreenelementprops \{id = root_window
			tags = {
				menu_state = off
			}}
	endif
	change \{viewer_buttons_enabled = 1}
endscript

script enable_new_ui_system 
	mempushcontext \{aiheap}
	registerbehaviors_debug
	registerbehaviors_runscript
	registerbehaviors_runbehavior
	mempopcontext
	registeruibehaviors
endscript
ui_controller_which_paused = 0

script handle_start_pressed 
	if NOT renderingenabled
		return
	endif
	if istrue \{$paused_for_hardware}
		printf \{"handle_start_pressed: $paused_for_hardware is true, ending"}
		return
	endif
	if istrue \{$sysnotify_wait_in_progress}
		printf \{"handle_start_pressed: $sysnotify_wait_in_progress is true, ending"}
		return
	endif
	if ($is_changing_levels = 1)
		printf \{"handle_start_pressed: $is_changing_levels is true, ending"}
		return
	endif
	if istrue \{$ingame_save_active}
		printf \{"handle_start_pressed: $ingame_save_active is true, ending"}
		return
	endif
	if infrontend
		printf \{"handle_start_pressed: InFrontEnd is true, ending"}
		return
	endif
	root_window :gettags
	change ui_controller_which_paused = <device_num>
	if checksumequals a = <menu_state> b = on
		if gotparam \{pause_controller}
			if NOT (<pause_controller> = -1)
				if NOT (<device_num> = <pause_controller>)
					return
				endif
			endif
		endif
		do_actual_unpause
		broadcastevent \{type = event_unpause_game}
		ui_change_state \{state = uistate_gameplay}
		change \{inside_pause = 0}
	endif
	if checksumequals a = <menu_state> b = off
		if NOT inmultiplayergame
			if NOT controllerboundtoskater controller = <device_num> skater = 0
				return
			endif
		else
			if insplitscreengame
				if NOT controllerboundtoskater controller = <device_num> skater = 0
					if NOT controllerboundtoskater controller = <device_num> skater = 1
						return
					endif
				endif
			endif
		endif
		if innetgame
			if NOT controllerboundtoskater controller = <device_num> skater = 0
				return
			endif
		endif
		settags pause_controller = <device_num>
		if NOT innetgame
			getskaterid
			if getskatercamanimparams skater = <objid>
				if (<allow_pause> = 0)
					return
				endif
			endif
		endif
		broadcastevent \{type = event_pause_game}
		if gman_goalisactive \{goal = m_pro_burnquist}
			wait \{2
				gameframe}
		endif
		do_actual_pause
		set_pause_menu_allow_continue
		if intraining
			ui_change_state \{state = uistate_training_pausemenu}
		else
			ui_change_state \{state = uistate_pausemenu}
		endif
	endif
endscript

script set_pause_menu_allow_continue 
	if gotparam \{off}
		root_window :settags \{no_exit_pause_menu = 1}
	else
		root_window :removetags \{tags = [
				no_exit_pause_menu
			]}
	endif
endscript

script set_custom_restart 
	if NOT skater :inair
		skater :setcustomrestart \{set}
	endif
endscript

script skip_to_custom_restart 
	skater :skiptocustomrestart
endscript

script set_sub_bg \{parent = current_menu_anchor
		pos = (326.0, 115.0)
		scale = (1.1700001, 1.1)
		just = [
			center
			top
		]}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = options_bg
		draw_behind_parent
		pos = <pos>
		scale = <scale>
		just = <just>
		rgba = [128 128 128 128]
		z_priority = 1
	}
endscript

script hide_everything 
	doscreenelementmorph \{id = root_window
		time = 0
		scale = 0}
endscript

script unhide_everything 
	doscreenelementmorph \{id = root_window
		time = 0
		scale = 1}
endscript

script hide_all_hud_sprites 
	dialog_box_exit no_pad_start <...>
	if screenelementexists \{id = console_message_vmenu}
		doscreenelementmorph \{id = console_message_vmenu
			time = 0
			scale = 0}
	endif
	if screenelementexists \{id = first_time_goal_info}
		destroyscreenelement \{id = first_time_goal_info}
	endif
	if screenelementexists \{id = cutscene_camera_hud_anchor}
		change \{camera_hud_is_hidden = 1}
		doscreenelementmorph \{id = cutscene_camera_hud_anchor
			alpha = 0}
	endif
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			hide}
	endif
	if screenelementexists \{id = goal_viewport_parent}
		setscreenelementprops \{id = goal_viewport_parent
			hide}
	endif
	if NOT gotparam \{ignore_speech_boxes}
		hide_speech_boxes
	endif
	if screenelementexists \{id = digital_timer_anchor}
		setscreenelementprops \{id = digital_timer_anchor
			hide}
	endif
	if screenelementexists \{id = lightning_container}
		setscreenelementprops \{id = lightning_container
			hide}
	endif
	xboxlive_message_container_hide
	hide_panel_messages
	pause_balance_meter
	pause_run_timer
	hide_goal_panel_messages
	goalmanager_hidegoalpoints
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
	maybehidelensflare
	if NOT infrontend
		if NOT inmultiplayergame
			change \{lens_flare_visible_before_pause = $doupdatelensflare}
			change \{doupdatelensflare = 0}
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
	if NOT innetgame
		unpause_trick_text
	endif
	unpause_balance_meter
	unpause_run_timer
	unhide_speech_boxes
	if screenelementexists \{id = cutscene_camera_hud_anchor}
		if (camera_hud_is_hidden = 1)
			change \{camera_hud_is_hidden = 0}
			doscreenelementmorph \{id = cutscene_camera_hud_anchor
				alpha = 1}
		endif
	endif
	if screenelementexists \{id = lightning_container}
		setscreenelementprops \{id = lightning_container
			unhide}
	endif
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			unhide}
	endif
	if screenelementexists \{id = goal_viewport_parent}
		setscreenelementprops \{id = goal_viewport_parent
			unhide}
	endif
	if screenelementexists \{id = digital_timer_anchor}
		setscreenelementprops \{id = digital_timer_anchor
			unhide}
	endif
	show_goal_panel_messages
	if NOT inmultiplayergame
		if NOT gman_hasactivegoals
			goalmanager_showgoalpoints
		else
			goalmanager_hidegoalpoints
		endif
	endif
	if objectexists \{id = console_message_vmenu}
		doscreenelementmorph \{id = console_message_vmenu
			time = 0
			scale = 1}
	endif
	if ($hidehud = 1)
		printf \{"hiding"}
		hide_root_window
	endif
	if getglobalflag \{flag = $no_display_hud}
		goalmanager_hidegoalpoints
		goalmanager_hidepoints
	endif
	if NOT getglobalflag \{flag = $no_display_chatwindow}
		unhide_console_window
	else
		hide_console_window
	endif
	if NOT getglobalflag \{flag = $no_display_net_scores}
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
	if skatercamanimfinished \{name = igc_custom_camera_name}
		show_all_hud_sprites <...>
	endif
	if NOT infrontend
		if NOT inmultiplayergame
			change \{doupdatelensflare = 1}
			unhidelensflare
		endif
	endif
endscript

script hide_speech_boxes 
	if screenelementexists \{id = speech_box_anchor}
		setscreenelementprops \{id = speech_box_anchor
			block_events}
		doscreenelementmorph \{id = speech_box_anchor
			scale = 0
			relative_scale}
	endif
	if screenelementexists \{id = goal_start_dialog}
		setscreenelementprops \{id = goal_start_dialog
			block_events}
		doscreenelementmorph \{id = goal_start_dialog
			scale = 0
			relative_scale}
	endif
	if screenelementexists \{id = ped_speech_dialog}
		setscreenelementprops \{id = ped_speech_dialog
			block_events}
		doscreenelementmorph \{id = ped_speech_dialog
			scale = 0
			relative_scale}
	endif
	if screenelementexists \{id = goal_retry_anchor}
		setscreenelementprops \{id = goal_retry_anchor
			block_events}
		doscreenelementmorph \{id = goal_retry_anchor
			scale = 0
			relative_scale}
	endif
	if screenelementexists \{id = ped_hint_dialog}
		setscreenelementprops \{id = ped_hint_dialog
			block_events}
		doscreenelementmorph \{id = ped_hint_dialog
			scale = 0
			relative_scale}
	endif
	if player1_panel_container :getsingletag \{grid_control_speech_box}
		if screenelementexists id = <grid_control_speech_box>
			setscreenelementprops id = <grid_control_speech_box> block_events
			doscreenelementmorph id = <grid_control_speech_box> scale = 0 relative_scale
		endif
	endif
endscript

script unhide_speech_boxes 
	if screenelementexists \{id = speech_box_anchor}
		setscreenelementprops \{id = speech_box_anchor
			unblock_events}
		doscreenelementmorph \{id = speech_box_anchor
			scale = 1
			relative_scale}
	endif
	if screenelementexists \{id = goal_start_dialog}
		setscreenelementprops \{id = goal_start_dialog
			unblock_events}
		doscreenelementmorph \{id = goal_start_dialog
			scale = 1
			relative_scale}
	endif
	if screenelementexists \{id = ped_speech_dialog}
		setscreenelementprops \{id = ped_speech_dialog
			unblock_events}
		doscreenelementmorph \{id = ped_speech_dialog
			scale = 1
			relative_scale}
	endif
	if screenelementexists \{id = goal_retry_anchor}
		setscreenelementprops \{id = goal_retry_anchor
			unblock_events}
		doscreenelementmorph \{id = goal_retry_anchor
			scale = 1
			relative_scale}
	endif
	if screenelementexists \{id = ped_hint_dialog}
		setscreenelementprops \{id = ped_hint_dialog
			block_events}
		doscreenelementmorph \{id = ped_hint_dialog
			scale = 1
			relative_scale}
	endif
	if player1_panel_container :getsingletag \{grid_control_speech_box}
		if screenelementexists id = <grid_control_speech_box>
			setscreenelementprops id = <grid_control_speech_box> unblock_events
			doscreenelementmorph id = <grid_control_speech_box> scale = 1 relative_scale
		endif
	endif
endscript

script kill_speech_boxes 
	if screenelementexists \{id = speech_box_anchor}
		destroyscreenelement \{id = speech_box_anchor}
	endif
	if screenelementexists \{id = goal_start_dialog}
		destroyscreenelement \{id = goal_start_dialog}
	endif
	if screenelementexists \{id = ped_speech_dialog}
		destroyscreenelement \{id = ped_speech_dialog}
	endif
	if screenelementexists \{id = goal_retry_anchor}
		destroyscreenelement \{id = goal_retry_anchor}
	endif
	if screenelementexists \{id = ped_hint_dialog}
		destroyscreenelement \{id = ped_hint_dialog}
	endif
endscript

script hide_landing_msg 
	if objectexists \{id = perfect}
		doscreenelementmorph \{id = perfect
			time = 0
			alpha = 0}
	endif
	if objectexists \{id = perfect2}
		doscreenelementmorph \{id = perfect2
			time = 0
			alpha = 0}
	endif
endscript

script unhide_landing_msg 
	if objectexists \{id = perfect}
		doscreenelementmorph \{id = perfect
			time = 0
			alpha = 0.5}
	endif
	if objectexists \{id = perfect2}
		doscreenelementmorph \{id = perfect2
			time = 0
			alpha = 0.5}
	endif
endscript

script hide_3d_goal_arrow 
	if screenelementexists \{id = designercreated_3darrowpointer}
		doscreenelementmorph \{id = designercreated_3darrowpointer
			pos = (320.0, -300.0)}
	endif
	if screenelementexists \{id = race_arrow}
		doscreenelementmorph \{id = race_arrow
			pos = (320.0, -300.0)}
	endif
	if screenelementexists \{id = ctf_arrow}
		doscreenelementmorph \{id = ctf_arrow
			pos = (320.0, -300.0)}
	endif
endscript

script unhide_3d_goal_arrow 
	if screenelementexists \{id = designercreated_3darrowpointer}
		doscreenelementmorph \{id = designercreated_3darrowpointer
			pos = (320.0, 70.0)}
	endif
	if screenelementexists \{id = race_arrow}
		doscreenelementmorph \{id = race_arrow
			pos = (320.0, 70.0)}
	endif
	if screenelementexists \{id = ctf_arrow}
		doscreenelementmorph \{id = ctf_arrow
			pos = (320.0, 70.0)}
	endif
endscript

script hide_net_scores 
	if objectexists \{id = net_score_1}
		doscreenelementmorph \{id = net_score_1
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_2}
		doscreenelementmorph \{id = net_score_2
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_3}
		doscreenelementmorph \{id = net_score_3
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_4}
		doscreenelementmorph \{id = net_score_4
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_5}
		doscreenelementmorph \{id = net_score_5
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_6}
		doscreenelementmorph \{id = net_score_6
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_7}
		doscreenelementmorph \{id = net_score_7
			time = 0
			scale = 0}
	endif
	if objectexists \{id = net_score_8}
		doscreenelementmorph \{id = net_score_8
			time = 0
			scale = 0}
	endif
endscript

script unhide_net_scores 
	if objectexists \{id = net_score_1}
		doscreenelementmorph \{id = net_score_1
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_2}
		doscreenelementmorph \{id = net_score_2
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_3}
		doscreenelementmorph \{id = net_score_3
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_4}
		doscreenelementmorph \{id = net_score_4
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_5}
		doscreenelementmorph \{id = net_score_5
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_6}
		doscreenelementmorph \{id = net_score_6
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_7}
		doscreenelementmorph \{id = net_score_7
			time = 0
			scale = 1}
	endif
	if objectexists \{id = net_score_8}
		doscreenelementmorph \{id = net_score_8
			time = 0
			scale = 1}
	endif
endscript

script hide_current_goal 
	if objectexists \{id = current_goal}
		doscreenelementmorph \{id = current_goal
			time = 0
			scale = 0}
	endif
	if objectexists \{id = mp_goal_text}
		doscreenelementmorph \{id = mp_goal_text
			time = 0
			scale = 0}
	endif
	if objectexists \{id = sc_goal_text}
		doscreenelementmorph \{id = sc_goal_text
			time = 0
			scale = 0}
	endif
	if objectexists \{id = eric_score}
		doscreenelementmorph \{id = eric_score
			time = 0
			scale = 0}
	endif
endscript
comp_texts = [
	eric_text
	ron_text
	johnny_text
	chicken_text
	raven_text
	final_scores
	goal_comp_out_of_bounds_warning
]

script hide_comp_text 
	getarraysize \{$comp_texts}
	<index> = 0
	begin
	<id> = ($comp_texts [<index>])
	if objectexists id = <id>
		doscreenelementmorph id = <id> time = 0 scale = 0
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script unhide_comp_text 
	getarraysize \{$comp_texts}
	<index> = 0
	begin
	<id> = ($comp_texts [<index>])
	if objectexists id = <id>
		doscreenelementmorph id = <id> time = 0 scale = 1
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script unhide_current_goal 
	if objectexists \{id = current_goal}
		doscreenelementmorph \{id = current_goal
			time = 0
			scale = 0.83}
	endif
	if objectexists \{id = mp_goal_text}
		doscreenelementmorph \{id = mp_goal_text
			time = 0
			scale = 0.83}
	endif
	if objectexists \{id = sc_goal_text}
		doscreenelementmorph \{id = sc_goal_text
			time = 0
			scale = 0.83}
	endif
	if objectexists \{id = eric_score}
		doscreenelementmorph \{id = eric_score
			time = 0
			scale = 0.83}
	endif
endscript

script hide_death_msg 
	if objectexists \{id = death_message}
		doscreenelementmorph \{id = death_message
			time = 0
			scale = 0}
	endif
endscript

script unhide_death_msg 
	if objectexists \{id = death_message}
		doscreenelementmorph \{id = death_message
			time = 0
			scale = 1}
	endif
endscript

script hide_tips 
	if objectexists \{id = skater_hint}
		doscreenelementmorph \{id = skater_hint
			time = 0
			pos = (320.0, 11050.0)}
	endif
endscript

script unhide_tips 
	if objectexists \{id = skater_hint}
		doscreenelementmorph \{id = skater_hint
			time = 0
			pos = (320.0, 150.0)}
	endif
endscript

script menu_quit_no 
	generic_menu_pad_back_sound
	dialog_box_exit
	pause_game_and_create_pause_menu
endscript

script change_gamemode_career 
	printf \{"********** CHANGING GAME MODE TO CAREER"}
	enablesun
	setgametype \{career}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_classic 
	printf \{"********** CHANGING GAME MODE TO CLASSIC"}
	enablesun
	setgametype \{classic}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_coop 
	printf \{"********** CHANGING GAME MODE TO CO-OP"}
	enablesun
	setgametype \{coop}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_net 
	printf \{"********** CHANGING GAME MODE TO NET!!!"}
	disablesun
	setgametype \{net}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_singlesession 
	enablesun
	setgametype \{singlesession}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script change_gamemode_freeskate_2p 
	disablesun
	setgametype \{freeskate2p}
	setcurrentgametype
	careerfunc \{func = setappropriatenodeflags}
endscript

script animate_in 
	setbuttoneventmappings \{block_menu_input}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = entering
		}}
	launchevent type = focus target = <menu_id>
	domorph \{time = 0.05
		rot_angle = 3
		pos = (40.0, 0.0)
		alpha = 1}
	domorph \{time = 0.01
		rot_angle = 0
		pos = (10.0, 0.0)}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = on
		}}
	if NOT gotparam \{dont_unblock}
		setbuttoneventmappings \{unblock_menu_input}
	endif
endscript

script menu_onscreen \{menu_id = current_menu_anchor}
	domorph \{scale = 1
		time = 0}
	if gotparam \{pos}
		domorph pos = <pos>
	endif
	setprops \{just = [
			center
			center
		]}
	gettags
	if gotparam \{focus_child}
		launchevent type = focus target = <menu_id> data = {child_id = <focus_child>}
	else
		launchevent type = focus target = <id>
	endif
	if NOT gotparam \{preserve_menu_state}
		setscreenelementprops \{id = root_window
			tags = {
				menu_state = on
			}}
	endif
endscript

script animate_out \{menu_id = current_menu_anchor}
	setbuttoneventmappings \{block_menu_input}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = leaving
		}}
	gettags
	setprops \{just = [
			center
			center
		]}
	domorph \{time = 0
		scale = 1.0}
	domorph \{time = 0.3
		alpha = 0}
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	setscreenelementlock \{id = root_window
		off}
	destroyscreenelement id = <menu_id>
	setbuttoneventmappings \{unblock_menu_input}
endscript

script menu_offscreen 
	setscreenelementprops \{id = root_window
		tags = {
			menu_state = off
		}}
	setscreenelementlock \{id = root_window
		off}
	gettags
	launchevent type = unfocus target = <id>
	destroyscreenelement id = <id> recurse
endscript

script hide_root_window 
	setscreenelementprops \{id = root_window
		hide}
endscript

script unhide_root_window 
	setscreenelementprops \{id = root_window
		unhide}
endscript

script generic_menu_update_arrows \{menu_id = current_menu}
	if NOT objectexists id = <up_arrow_id>
		return
	endif
	if NOT objectexists id = <down_arrow_id>
		return
	endif
	if <menu_id> :menu_selectedindexis first
		setscreenelementprops {
			id = <up_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = <up_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
	if <menu_id> :menu_selectedindexis last
		setscreenelementprops {
			id = <down_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = <down_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
endscript

script generic_menu_pad_back 
	printf \{"generic_menu_pad_back Parameters = "}
	if gotparam \{callback}
		<callback> <...>
	endif
endscript

script generic_menu_pad_choose 
	if gotparam \{callback}
		<callback> <...>
	endif
endscript

script generic_menu_pad_back_sound 
	soundevent \{event = generic_menu_back_sfx}
endscript

script generic_menu_pad_up_down_sound 
endscript

script generic_menu_pad_choose_sound 
	soundevent \{event = ui_sfx_select}
endscript
disable_menu_sounds = 0

script generic_menu_up_or_down_sound \{menu_id = current_menu}
	printf \{"--- generic_menu_up_or_down_sound"}
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_scroll}
		soundevent \{event = ui_sfx_scroll_add}
	endif
endscript

script generic_menu_negative_sound \{menu_id = current_menu}
	printf \{"--- generic_menu_negative_sound"}
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_negative_sfx}
	endif
endscript

script generic_menu_scroll_sideways_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = generic_menu_pad_sideways_sfx}
	endif
endscript

script generic_keyboard_sound 
endscript

script theme_menu_pad_choose_sound 
	soundevent \{event = generic_menu_pad_choose_sfx}
endscript

script generic_pause_exit_sound 
	soundevent \{event = generic_menu_pad_back_sfx}
endscript

script videophone_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if gotparam \{up}
			soundevent \{event = vp_menu_pad_up_sfx}
		endif
		if gotparam \{down}
			soundevent \{event = vp_menu_pad_down_sfx}
		endif
	endif
endscript

script videophone_pad_back_sound 
	soundevent \{event = vp_menu_pad_back_sfx}
endscript

script videophone_pad_choose_sound 
	soundevent \{event = vp_menu_pad_select_sfx}
endscript

script cas_menu_pad_choose_sound 
	soundevent \{event = cas_menu_pad_choose_sfx}
endscript

script cas_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if gotparam \{up}
			soundevent \{event = cas_menu_pad_up_sfx}
		endif
		if gotparam \{down}
			soundevent \{event = cas_menu_pad_down_sfx}
		endif
	endif
endscript

script menu_audio_settings_band_volume_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_bandvol}
	endif
endscript

script menu_audio_settings_guitar_volume_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_guitvol}
	endif
endscript

script menu_audio_settings_fx_volume_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_crowdvol}
	endif
endscript

script menu_video_settings_lefty_flip_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = box_check_sfx}
	endif
endscript

script menu_video_settings_calibrate_strum_sound 
	if ($disable_menu_sounds = 0)
		generic_menu_up_or_down_sound
	endif
endscript

script menu_video_settings_calibrate_reset_to_zero_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_song_complete_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_get_sponsor_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_bonus_tab_sound 
	printf \{"here %s"
		s = $disable_menu_sounds}
	if ($disable_menu_sounds = 0)
		printf \{"sklajkjahsdflhasdlasdf"}
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_downloads_tab_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_setlist_tab_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script reset_gamemode 
	resettodefaultprofile \{name = custom_story}
	careerfunc \{func = reset}
	if objectexists \{id = skater}
		skater :recordcomponent_resetcomponent
	endif
	gman_resetcareer
	careerfunc \{func = setappropriatenodeflags}
	training_reset_checkpoints
	unsetglobalflag \{flag = $career_started}
	getarraysize \{$story_clear_global_flags}
	index = 0
	begin
	printf "clearing global flag %d" d = ($story_clear_global_flags [<index>])
	unsetglobalflag flag = ($story_clear_global_flags [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	if getglobalflag \{flag = $cheat_cas_vans_unlocked}
		cheat_unlock_the_vans
	endif
endscript

script generic_menu_animate_in \{menu = current_menu_anchor}
	if gotparam \{force}
		<menu> :settags animate_me = 1
	else
		if NOT <menu> :getsingletag animate_me
			return
		endif
	endif
	if gotparam \{pos}
		screenelementpos = <pos>
	else
		getscreenelementposition id = <menu>
	endif
	doscreenelementmorph id = <menu> pos = (<screenelementpos> + (640.0, 0.0)) time = 0
	doscreenelementmorph id = <menu> pos = <screenelementpos> time = 0.15
	if NOT gotparam \{no_wait}
		wait \{0.2
			seconds}
	endif
endscript

script generic_menu_animate_out \{menu = current_menu_anchor}
	if gotparam \{force}
		<menu> :settags animate_me = 1
	endif
	if NOT <menu> :getsingletag animate_me
		return
	endif
	if gotparam \{pos}
		screenelementpos = <pos>
	else
		getscreenelementposition id = <menu>
	endif
	doscreenelementmorph id = <menu> pos = (<screenelementpos> + (640.0, 0.0)) time = 0.15
	wait \{0.2
		seconds}
endscript

script generic_animate_out_last_menu 
	if objectexists \{id = current_menu}
		if current_menu :getsingletag \{animate_me}
			generic_menu_animate_out \{menu = current_menu}
			return
		endif
	endif
	if objectexists \{id = current_menu_anchor}
		if current_menu_anchor :getsingletag \{animate_me}
			generic_menu_animate_out
			return
		endif
	endif
	if objectexists \{id = sub_menu}
		if sub_menu :getsingletag \{animate_me}
			generic_menu_animate_out \{force
				menu = sub_menu
				pos = (320.0, 240.0)}
			return
		endif
	endif
endscript

script runscriptonscreenelement_script 
	runscriptonscreenelement <...>
endscript

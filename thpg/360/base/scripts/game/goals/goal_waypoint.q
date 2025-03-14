ui_current_goal_waypoint = null
ui_cannot_restore_r3 = false

script ui_user_add_goal_waypoint 
	if NOT goal_can_be_waypointed goal = <goal>
		return
	endif
	soundevent \{event = ui_toggle_checkbox_sfx}
	if checksumequals a = $ui_current_goal_waypoint b = <goal>
		<just_clear> = 1
	else
		<just_clear> = 0
	endif
	UI_Clear_User_Goal_Waypoint
	if (<just_clear> = 0)
		change ui_current_goal_waypoint = <goal>
		UI_Show_Goal_Waypoint_If_Set do_object_script_test = <do_object_script_test>
	endif
	view_goals_update_helper goal = <goal>
endscript

script UI_Show_Goal_Waypoint_If_Set \{do_object_script_test = true}
	<goal> = ($ui_current_goal_waypoint)
	if gman_goalexists goal = <goal>
		goal_get_activate_pos goal = <goal>
		<pos> = <activate_pos>
		goal_create_arrow_to_goal goal_id = <goal>
		if (<do_object_script_test> = true)
			if isobjectscript
				obj_getid
				UI_View_Goals_Set_Menu_Waypoint_Icon parent = <objid>
			endif
		endif
	endif
endscript

script UI_User_Waypointed_Goal 
	requireparams \{[
			goal
		]
		all}
	if checksumequals a = $ui_current_goal_waypoint b = <goal>
		return \{true}
	else
		return \{false}
	endif
endscript

script UI_View_Goals_Set_Menu_Waypoint_Icon 
	if screenelementexists \{id = ui_view_missions_waypoint_icon}
		destroyscreenelement \{id = ui_view_missions_waypoint_icon}
	endif
	createscreenelement {
		id = ui_view_missions_waypoint_icon
		parent = <parent>
		type = spriteelement
		pos = (-100.0, -5.0)
		texture = ($compass_bliptypes.waypoint.texture)
		rgba = ($compass_bliptypes.waypoint.rgba)
		scale = (0.9)
		z_priority = 200
	}
endscript

script UI_Clear_User_Goal_Waypoint 
	if screenelementexists \{id = ui_view_missions_waypoint_icon}
		destroyscreenelement \{id = ui_view_missions_waypoint_icon}
	endif
	change \{ui_current_goal_waypoint = null}
	goal_destroy_arrow
endscript

script goal_can_be_waypointed 
	return \{true}
endscript

script goal_track_prompt_for_next_goal 
	if NOT goal_has_completed_training
		return
	endif
	if goal_get_current_in_track track = <track> include_impress
		UI_Clear_User_Goal_Waypoint
		goal_destroy_prompt_for_next_goal
		gman_getconstant goal = <current_goal_in_track> name = start_zone
		if checksumequals a = <start_zone> b = z_crib
			<button_prompt> = 1
		else
			<button_prompt> = 1
		endif
		if NOT goal_get_title goal = <current_goal_in_track>
			gman_getgoalstring goal = <current_goal_in_track>
			<view_goals_title> = <goal_string>
		endif
		get_zone_ui_name zone = <start_zone>
		<zone_title> = <zone_ui_name>
		<track_info> = ($global_goal_track_info.<track>)
		if (<button_prompt> = 1)
			kill_r3_binding
			change ui_cannot_restore_r3 = true
			formattext textname = descrip "Next in %t, \\c5%g\\c0\\n%z\\n(Press \\bm)" t = (<track_info>.title) g = <view_goals_title> z = <zone_title>
			ui_display_message type = instruction text = <descrip> time = 30
			goal_ui_instruction :setprops event_handlers = [
				{pad_r3 show_waypoint_sfx}
				{pad_r3 goal_track_show_next_goal params = {next_goal = <current_goal_in_track>}}
			]
			runscriptonscreenelement id = goal_ui_instruction goal_prompt_wait_and_restore_r3
			skatercam0 :pausecameralockability time = 35.0
		else
			formattext textname = descrip "Next in %t, \\c5%g\\c0\\n%z\\n" t = (<track_info>.title) g = <view_goals_title> z = <zone_title>
			ui_display_message type = instruction text = <descrip> time = 30
		endif
		if screenelementexists id = goal_ui_instruction
			runscriptonscreenelement id = goal_ui_instruction ui_pausemenu_show_progress_bar params = {anchor_id = ui_show_progress_bar_anchor parent = goal_ui_instruction pos = (-60.0, -10.0) scale = (0.4, 0.6) fake_morph}
		endif
		ui_messages_check_all_positions
		launchevent type = focus target = goal_ui_instruction
	endif
endscript

script goal_prompt_wait_and_restore_r3 
	onexitrun \{goal_prompt_wait_and_restore_r3_onexit}
	block
endscript

script goal_prompt_wait_and_restore_r3_onexit 
	change \{ui_cannot_restore_r3 = false}
	restore_r3_binding
endscript

script goal_track_prompt_for_specific_goal 
	requireparams [goal] all
	if NOT goal_has_completed_training
		return
	endif
	UI_Clear_User_Goal_Waypoint
	goal_destroy_prompt_for_next_goal
	gman_getconstant goal = <goal> name = start_zone
	if checksumequals a = <start_zone> b = z_crib
		<button_prompt> = 1
	else
		<button_prompt> = 1
	endif
	if NOT goal_get_title goal = <goal>
		gman_getgoalstring goal = <goal>
		<view_goals_title> = <goal_string>
	endif
	get_zone_ui_name zone = <start_zone>
	<zone_title> = <zone_ui_name>
	if (<button_prompt> = 1)
		kill_r3_binding
		change ui_cannot_restore_r3 = true
		formattext textname = descrip "\\c5%g\\c0\\n%z\\n(Press \\bm)" g = <view_goals_title> z = <zone_title>
		ui_display_message type = instruction text = <descrip> time = 30
		goal_ui_instruction :setprops event_handlers = [
			{pad_r3 show_waypoint_sfx}
			{pad_r3 goal_track_show_next_goal params = {next_goal = <goal>}}
		]
		runscriptonscreenelement id = goal_ui_instruction goal_prompt_wait_and_restore_r3
		skatercam0 :pausecameralockability time = 35.0
	else
		formattext textname = descrip "\\c5%g\\c0\\n%z\\n" g = <view_goals_title> z = <zone_title>
		ui_display_message type = instruction text = <descrip> time = 30
	endif
	if screenelementexists id = goal_ui_instruction
		runscriptonscreenelement id = goal_ui_instruction ui_pausemenu_show_progress_bar params = {anchor_id = ui_show_progress_bar_anchor parent = goal_ui_instruction pos = (-60.0, -10.0) scale = (0.4, 0.6) fake_morph}
	endif
	ui_messages_check_all_positions
	launchevent type = focus target = goal_ui_instruction
endscript

script ui_show_milestone_progress_after_street_goal 
	if getglobalflag \{flag = $CAREER_TRAINING_DONE}
		if NOT gotparam \{no_wait}
			wait \{2.0
				seconds
				ignoreslomo}
		endif
		ui_display_message \{type = instruction
			text = ""
			time = 15}
		if screenelementexists \{id = goal_ui_instruction}
			runscriptonscreenelement \{id = goal_ui_instruction
				ui_pausemenu_show_progress_bar
				params = {
					parent = goal_ui_instruction
					pos = (-60.0, 30.0)
					scale = (0.4, 0.6)
					fake_morph
				}}
		endif
	endif
endscript

script goal_track_show_next_goal 
	change \{ui_cannot_restore_r3 = false}
	restore_r3_binding
	ui_user_add_goal_waypoint goal = <next_goal>
	if screenelementexists \{id = goal_ui_instruction}
		destroyscreenelement \{id = goal_ui_instruction}
	endif
endscript

script goal_create_arrow_to_goal 
	requireparams [goal_id] all
	goal_destroy_prompt_for_next_goal
	goal_get_activate_pos goal = <goal_id>
	if gotparam activate_pos
		gman_getconstant goal = <goal_id> name = start_zone
		if levelis load_z_crib
			if NOT checksumequals a = <start_zone> b = z_crib
				<activate_pos> = (424.93338, -0.0882, -543.8026)
			endif
		elseif checksumequals a = <start_zone> b = z_crib
			<activate_pos> = (382.5212, 4.2004, -307.4943)
		endif
		goal_create_arrow postopointto = <activate_pos>
		goal_arrow_element :setprops pos = (170.0, 70.0)
		createscreenelement {
			id = goal_arrow_element_shim
			parent = goal_arrow_element
			type = containerelement
			dims = (0.0, 75.0)
		}
		createscreenelement {
			local_id = text
			parent = goal_arrow_element
			type = textblockelement
			text = ""
			font = text_a1
			pos = (-110.0, 50.0)
			scale = 0.71999997
			rgba = [200 200 200 255]
			internal_just = [center top]
			just = [center top]
			dims = (250.0, 0.0)
			allow_expansion
			shadow
			shadow_offs = (1.0, 1.0)
		}
		runscriptonscreenelement id = goal_arrow_element goal_arrow_to_goal_update_distance params = {
			goal_pos = <activate_pos>
			dest_zone = <start_zone>
		}
		ui_messages_check_all_positions
	endif
endscript

script goal_arrow_to_goal_update_distance 
	requireparams [goal_pos dest_zone] all
	obj_getid
	resolvescreenelementid id = {<objid> child = text}
	<text_id> = <resolved_id>
	<near_distance> = 20.0
	begin
	if goal_is_in_destination_city dest_zone = <dest_zone>
		getdistance objecta = skater posb = <goal_pos>
		<dist_in_feet> = (<dist_atob> * 3.28084)
		formattext textname = dist_text "%d feet" d = <dist_in_feet> decimalplaces = 0
		<text_id> :setprops text = <dist_text>
		if (<dist_atob> <= $goal_utilities_trigger_radius_inner)
			<alpha> = 0
		elseif (<dist_atob> < <near_distance>)
			<alpha> = (<dist_atob> / <near_distance>)
		else
			<alpha> = 1.0
		endif
		domorph alpha = <alpha> time = 0
	else
		get_zone_ui_name zone = <dest_zone>
		if gotparam zone_ui_name
			<text_id> :setprops text = <zone_ui_name>
		endif
	endif
	wait 2 gameframes
	repeat
endscript

script goal_is_in_destination_city 
	requireparams [dest_zone] all
	get_current_zone_as_checksum
	get_zone_params zone = <current_zone>
	if gotparam zone_params
		<current_city> = (<zone_params>.area)
	endif
	if NOT gotparam current_city
		return false
	endif
	removeparameter zone_params
	get_zone_params zone = <dest_zone>
	if gotparam zone_params
		<dest_city> = (<zone_params>.area)
	endif
	if NOT gotparam dest_city
		return false
	endif
	if checksumequals a = <dest_city> b = <current_city>
		return true
	endif
endscript

script goal_destroy_prompt_for_next_goal 
	if screenelementexists \{id = goal_ui_instruction}
		destroyscreenelement \{id = goal_ui_instruction}
	endif
	goal_destroy_arrow
endscript

script can_show_in_game_episode_menu 
	if NOT gamemodeequals is_career
		printf 'no in-game goal menu: not career'
		return false
	endif
	if infrontend
		printf 'no in-game goal menu: in frontend'
		return false
	endif
	if root_window :getsingletag menu_state
		if checksumequals a = <menu_state> b = on
			printf 'no in-game goal menu: menu state is on'
			return false
		endif
	endif
	if gameispaused
		printf 'no in-game goal menu: game is paused'
		return false
	endif
	if gman_hasactivegoals
		printf 'no in-game goal menu: active goals'
		return false
	endif
	if screenelementexists id = in_game_episode_menu_anchor
		printf 'no in-game goal menu: already on screen'
		return false
	endif
	if skater :nailthetrick_isinnailthex
		printf 'no in-game goal menu: in NTX'
		return false
	endif
	if skater :held l3
		printf 'no in-game goal menu: held L3'
		return false
	endif
	if istrue $igc_playing
		printf 'no in-game goal menu: IGC playing'
		return false
	endif
	if screenelementexists id = ped_speech_dialog
		printf 'no in-game goal menu: ped speech dialog'
		return false
	endif
	if screenelementexists id = goal_start_dialog
		printf 'no in-game goal menu: goal start dialog'
		return false
	endif
	if isloadingscreenactive
		printf 'no in-game goal menu: not career'
		return false
	endif
	if NOT goal_has_completed_training
		printf 'no in-game goal menu: before training'
		return false
	endif
	if ($ui_cannot_restore_r3 = true)
		printf 'no in-game goal menu: not allowed'
		kill_r3_binding
		return false
	endif
	if ($cap_in_menu = 1)
		return false
	endif
	if skater :isskaterfocused
		return false
	endif
	if skater :inair
		return false
	endif
	if screenelementexists id = goal_photo_picture_handle
		return false
	endif
	if screenelementexists id = goal_photo_cam_handle
		return false
	endif
	if ve_is_recording
		return false
	endif
	if ve_is_playing
		return false
	endif
	return true
endscript

script goal_in_game_episode_menu 
	printf 'goal_in_game_episode_menu'
	if NOT can_show_in_game_episode_menu
		if screenelementexists id = in_game_episode_menu_anchor
			soundevent event = CAP_SFX_menu_hide
			goal_in_game_episode_menu_exit
		endif
		return
	endif
	goal_destroy_prompt_for_next_goal
	setscreenelementprops {
		id = root_window
		event_handlers = [
			{pad_start null_script}
		]
		replace_handlers
	}
	if screenelementexists id = in_game_episode_menu_anchor
		destroyscreenelement id = in_game_episode_menu_anchor
	else
		soundevent event = CAP_SFX_menu_show
	endif
	createscreenelement {
		id = in_game_episode_menu_anchor
		type = containerelement
		parent = root_window
		pos = (-120.0, 70.0)
		just = [left top]
		internal_just = [left top]
	}
	assignalias id = in_game_episode_menu_anchor alias = current_menu_anchor
	runscriptonscreenelement id = in_game_episode_menu_anchor goal_in_game_episode_menu_spawned
endscript

script goal_in_game_episode_menu_spawned 
	onexitrun goal_in_game_episode_menu_exit
	if screenelementexists id = goal_ui_instruction2
		goal_ui_instruction2 :setprops hide
	endif
	createscreenelement {
		id = in_game_episode_menu
		type = vmenu
		parent = in_game_episode_menu_anchor
		pos = (0.0, 25.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_back goal_in_game_episode_menu_exit}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	assignalias id = in_game_episode_menu alias = current_menu_anchor
	createscreenelement {
		type = containerelement
		parent = in_game_episode_menu
		dims = (275.0, 60.0)
		just = [left top]
		pos = (0.0, 0.0)
		child_anchor = [center top]
		not_focusable
	}
	<container_id> = <id>
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = text
		text = "current story"
		font = text_a1
		scale = (1.0, 0.8)
		rgba = [150 150 150 255]
		pos = (0.0, -10.0)
		just = [center center]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	goal_in_game_episode_menu_list {
		rgba = ($goal_career_ui_scheme.main)
		goal_track_list = [m_c1 m_c2 m_c3]
		goal_track_uber = m_cu
	}
	goal_in_game_episode_menu_list {
		rgba = ($goal_hardcore_ui_scheme.main)
		goal_track_list = [m_h1 m_h2 m_h3]
		goal_track_uber = m_hu
	}
	goal_in_game_episode_menu_list {
		rgba = ($goal_rigger_ui_scheme.main)
		goal_track_list = [m_r1 m_r2 m_r3]
		goal_track_uber = m_ru
	}
	if NOT GMan_GoalIsLocked goal = m_team_film
		if NOT gman_haswongoal goal = m_team_film
			goal_get_title goal = m_team_film
			goal_in_game_episode_menu_add_item {
				title = <view_goals_title>
				goal_id = m_team_film
				rgba = ($goal_generic_ui_scheme.main)
				font_scale = 0.7
			}
		endif
	endif
	<outline_dims> = (120.0, 90.0)
	setscreenelementlock id = in_game_episode_menu on
	setscreenelementlock id = in_game_episode_menu off
	getscreenelementdims id = in_game_episode_menu
	ui_create_messy_background {
		parent = <container_id>
		messy_id = ui_messy_background_title
		dims = ((120.0, 60.0) + (<width> * (1.0, 0.0)))
		pos = (0.0, -10.0)
		just = [center center]
		z_priority = -5
		rot_angle = 0
		alpha = 0.1
		rgba = ($goal_ui_scheme.main)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_alpha = 0.7
		shadow_offs = (10.0, 0.0)
	}
	ui_create_messy_background {
		parent = in_game_episode_menu_anchor
		dims = ((<height> * (0.0, 1.0)) + (<width> * (1.0, 0.0)) + <outline_dims> - (0.0, 105.0))
		pos = ((<outline_dims> * -0.5) + (0.0, 105.0))
		z_priority = -5
		rot_angle = 0
		alpha = 0.1
		rgba = ($goal_ui_scheme.main)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_alpha = 0.7
		shadow_offs = (10.0, 0.0)
	}
	doscreenelementmorph id = in_game_episode_menu_anchor pos = (120.0, 70.0) time = 0.15
	setslomo 0.75
	wait 2 gameframes
	setslomo 0.5
	wait 2 gameframes
	setslomo 0.25
	wait 3 gameframes
	setslomo 0.1
	wait 4 gameframes
	pausegame
	if screenelementexists id = bail_score_text
		destroyscreenelement id = bail_score_text
	endif
	ui_kill_message_hack id = ui_alert
	setslomo 1.0
	if skater :isskaterfocused
		toggle_focus
	endif
	launchevent type = focus target = in_game_episode_menu
	block
endscript

script goal_in_game_episode_menu_list 
	<font_scale> = 0.7
	if gotparam title
		createscreenelement {
			parent = in_game_episode_menu
			type = textelement
			text = <title>
			font = text_a1
			scale = <font_scale>
			rgba = <rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			not_focusable
		}
	endif
	<tracks_listed> = 0
	getarraysize <goal_track_list>
	<track_idx> = 0
	begin
	<track_id> = (<goal_track_list> [<track_idx>])
	<track_info> = ($global_goal_track_info.<track_id>)
	if NOT goal_is_track_won track = <track_id>
		if NOT GMan_GoalIsLocked goal = (<track_info>.goals [0])
			goal_in_game_episode_menu_add_item {
				title = (<track_info>.title)
				track_id = <track_id>
				rgba = <rgba>
				font_scale = <font_scale>
			}
			<tracks_listed> = (<tracks_listed> + 1)
		endif
	endif
	if NOT gman_haswongoal goal = (<track_info>.impress)
		if NOT GMan_GoalIsLocked goal = (<track_info>.impress)
			goal_get_title goal = (<track_info>.impress)
			goal_in_game_episode_menu_add_item {
				title = <view_goals_title>
				goal_id = (<track_info>.impress)
				rgba = <rgba>
				font_scale = <font_scale>
			}
			<tracks_listed> = (<tracks_listed> + 1)
		endif
	endif
	<track_idx> = (<track_idx> + 1)
	repeat <array_size>
	if NOT GMan_GoalIsLocked goal = <goal_track_uber>
		if NOT gman_haswongoal goal = <goal_track_uber>
			goal_get_title goal = <goal_track_uber>
			goal_in_game_episode_menu_add_item {
				title = <view_goals_title>
				goal_id = <goal_track_uber>
				rgba = <rgba>
				font_scale = <font_scale>
			}
			<tracks_listed> = (<tracks_listed> + 1)
		endif
	endif
	if (<tracks_listed> = 0)
		createscreenelement {
			parent = in_game_episode_menu
			type = textelement
			text = " all complete! "
			font = text_a1
			scale = <font_scale>
			rgba = <rgba>
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
			not_focusable
		}
	endif
endscript

script goal_in_game_episode_menu_add_item 
	getlowercasestring <title>
	createscreenelement {
		type = containerelement
		parent = in_game_episode_menu
		dims = (275.0, 40.0)
		just = [center center]
		child_anchor = [center center]
		event_handlers = [
			{focus goal_in_game_episode_menu_focus params = {focus = 1}}
			{unfocus goal_in_game_episode_menu_focus params = {focus = 0}}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_choose goal_in_game_episode_menu_choose params = {track_id = <track_id> goal_id = <goal_id>}}
		]
	}
	<container_id> = <id>
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = text
		text = <lowercasestring>
		font = text_a1
		scale = <font_scale>
		rgba = <rgba>
		pos = (-125.0, 0.0)
		just = [left center]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = bg
		texture = menu_highlight
		scale = (1.4, 1.2)
		rgba = [200 200 200 255]
		alpha = 0.0
	}
endscript

script goal_in_game_episode_menu_focus 
	gettags
	if (<focus> = 1)
		doscreenelementmorph {
			id = {<id> child = bg}
			alpha = 1.0
		}
	else
		doscreenelementmorph {
			id = {<id> child = bg}
			alpha = 0.0
		}
	endif
endscript

script goal_in_game_episode_menu_choose 
	debounce \{x
		time = 0.15
		clear = 1}
	if gotparam \{track_id}
		spawnscriptnow goal_track_prompt_for_next_goal params = {track = <track_id>}
	else
		spawnscriptnow goal_track_prompt_for_specific_goal params = {goal = <goal_id>}
	endif
	goal_in_game_episode_menu_exit
endscript

script goal_in_game_episode_menu_exit \{hide_only = false}
	if (<hide_only> = false)
		restore_start_key_binding
		unpausegame
		setslomo \{1.0}
		if screenelementexists \{id = goal_ui_instruction2}
			goal_ui_instruction2 :setprops \{unhide}
		endif
	endif
	if screenelementexists \{id = in_game_episode_menu_anchor}
		soundevent \{event = CAP_SFX_menu_hide}
		destroyscreenelement \{id = in_game_episode_menu_anchor}
	endif
endscript

script goal_has_completed_training 
	if gman_haswongoal \{goal = m_line_slums}
		return \{true}
	endif
	return \{false}
endscript

script kill_r3_binding 
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_r3
				null_script
			}
		]
		replace_handlers}
endscript

script restore_r3_binding 
	if ($ui_cannot_restore_r3 = true)
		kill_r3_binding
		return
	endif
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_r3
				goal_in_game_episode_menu
			}
		]
		replace_handlers}
endscript

script show_waypoint_sfx 
	soundevent \{event = SK9_show_waypoint_sfx}
endscript

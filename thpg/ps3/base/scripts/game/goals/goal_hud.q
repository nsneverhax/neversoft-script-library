goal_grade_text = [
	""
	"am"
	"pro"
	"sick"
]
goal_dev_show_progress = 0
ui_gray_text_color = [
	128
	128
	128
	255
]
goal_save_extra_data = 0

script goal_hud_create 
	if NOT screenelementexists \{id = goal_hud_container}
		createscreenelement \{id = goal_hud_container
			parent = root_window
			type = containerelement
			pos = (0.0, 0.0)
			just = [
				left
				top
			]
			dims = (1280.0, 720.0)}
	endif
endscript

script goal_hud_destroy 
	if screenelementexists \{id = goal_hud_container}
		destroyscreenelement \{id = goal_hud_container}
	endif
endscript

script goal_hud_hide 
	if screenelementexists \{id = goal_hud_container}
		doscreenelementmorph \{id = goal_hud_container
			time = 0
			alpha = 0}
	endif
endscript

script goal_hud_show 
	if screenelementexists \{id = goal_hud_container}
		doscreenelementmorph \{id = goal_hud_container
			time = 0
			alpha = 1}
	endif
endscript

script panel_message_goal blink_time = 0.1 final_pos = (1000.0, 27.0)
	if NOT gotparam dont_animate
		setprops just = [center top] internal_just = [center center] rgba = [220 220 220 255]
		domorph scale = 0 alpha = 0 relative_scale
		domorph pos = (<final_pos> + (0.0, 100.0)) scale = 0.5 time = 0.2 alpha = 0.5 anim = ease_in
	endif
	setprops internal_just = [center top] rgba = [200 160 50 255] just = [center top]
	domorph pos = <final_pos> scale = 1.0 time = 0.1 alpha = 1
	domorph pos = (<final_pos> + (0.0, -3.0)) scale = 0.6 time = 0.05
	domorph pos = <final_pos> scale = 1.0 time = 0.05
	launchevent broadcast type = panel_message_goal_done
	launchevent broadcast type = panel_message_goal_done2
	wait 5 seconds ignoreslomo
	if NOT gotparam net_die
		domorph pos = <final_pos> scale = 0.9 time = 1 alpha = 1 anim = ease_out
	else
		domorph pos = <final_pos> alpha = 0.0 time = 1 anim = ease_out
		die
	endif
endscript

script panel_message_generic_loss start_pos = (640.0, 185.0)
	setprops just = [center center] rgba = [220 220 220 200]
	runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = 1500}
	domorph pos = <start_pos> time = 0 scale = 0
	domorph time = 0.3 scale = 1.3
	domorph time = 0.2 scale = 1.0
	domorph pos = (<start_pos> + (-1.0, -1.0)) time = 0.1
	domorph pos = (<start_pos> + (1.0, 1.0)) time = 0.1
	domorph pos = (<start_pos> + (-1.0, -1.0)) time = 0.1
	domorph pos = (<start_pos> + (2.0, 1.0)) time = 0.1
	domorph pos = (<start_pos> + (-1.0, -1.0)) time = 0.1
	domorph pos = (<start_pos> + (1.0, 1.0)) time = 0.1
	domorph pos = (<start_pos> + (-1.0, -3.0)) time = 0.1
	domorph pos = (<start_pos> + (1.0, 1.0)) time = 0.1
	domorph pos = (<start_pos> + (-1.0, -1.0)) time = 0.1
	domorph pos = (<start_pos> + (1.0, 1.0)) time = 0.1
	domorph pos = (<start_pos> + (-2.0, -1.0)) time = 0.1
	domorph pos = (<start_pos> + (1.0, 2.0)) time = 0.1
endscript

script clock_morph 
	domorph \{scale = 0
		alpha = 0
		time = 0.1}
	domorph \{scale = 1.0
		alpha = 1
		time = 0.3}
endscript
goal_panel_message_ids = [
	goal_message
	death_message
	perfect
	mission_ui
]

script hide_goal_panel_messages 
	getarraysize \{$goal_panel_message_ids}
	<index> = 0
	begin
	hide_panel_message id = ($goal_panel_message_ids [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script show_goal_panel_messages 
	getarraysize \{$goal_panel_message_ids}
	<index> = 0
	begin
	show_panel_message id = ($goal_panel_message_ids [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script destroy_goal_panel_messages 
	getarraysize \{$goal_panel_message_ids}
	if gotparam \{all}
		<index> = 0
	else
		<index> = 4
		<array_size> = (<array_size> - 4)
	endif
	if (<index> < <array_size>)
		begin
		destroy_panel_message id = ($goal_panel_message_ids [<index>])
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script goal_points_animation 
	setprops rgba = [128 109 9 128]
	domorph time = 0 pos = (320.0, 85.0) scale = 2 alpha = 0
	domorph time = 0.1 scale = 1.8 alpha = 1 rot_angle = 0
	domorph time = 0.06 pos = (322.0, 88.0)
	domorph time = 0.06 pos = (318.0, 82.0)
	domorph time = 0.06 pos = (322.0, 88.0)
	domorph time = 0.05 pos = (318.0, 82.0)
	domorph time = 0.05 pos = (322.0, 88.0)
	domorph time = 0.05 pos = (318.0, 82.0)
	wait 0.2 second ignoreslomo
	domorph time = 0.5 pos = (320.0, 30.0) alpha = 0
	die
endscript

script goalmanager_hidepoints 
	doscreenelementmorph \{id = the_score_sprite
		alpha = 0}
	doscreenelementmorph \{id = the_score
		alpha = 0}
	if screenelementexists \{id = splitscreen_total_score_container}
		setscreenelementprops \{id = splitscreen_total_score_container
			hide}
	endif
	if screenelementexists id = (splitscreen_total_score_container + 1)
		setscreenelementprops id = (splitscreen_total_score_container + 1) hide
	endif
endscript

script goalmanager_showpoints 
	if NOT getglobalflag flag = $no_display_hud
		doscreenelementmorph {
			id = the_score_sprite
			alpha = 1
		}
		doscreenelementmorph {
			id = the_score
			alpha = 1
		}
		if screenelementexists id = player2_panel_container
			doscreenelementmorph id = player2_panel_container time = 0 scale = (2.0, 1.5)
			printf "scaling player2_panel_container"
		endif
		if screenelementexists id = splitscreen_total_score_container
			setscreenelementprops id = splitscreen_total_score_container unhide
		endif
		if screenelementexists id = (splitscreen_total_score_container + 1)
			setscreenelementprops id = (splitscreen_total_score_container + 1) unhide
		endif
	endif
endscript

script goal_exit_area_message 
	ui_display_message type = uberalert color = red text = <text>
endscript

script goal_exit_area_message_style 
	domorph time = 0.4 scale = (1.6, 1.6) alpha = 0.6
	domorph time = 0.4 scale = (2.4, 2.4) alpha = 1.0
	domorph time = 0.4 scale = (1.6, 1.6) alpha = 0.8
	domorph time = 0.1 scale = (2.0, 1.3) alpha = 0.7
	domorph time = 0.1 scale = (2.4, 1.0) alpha = 0.6
	domorph time = 0.1 scale = (2.8, 0.7) alpha = 0.4
	domorph time = 0.1 scale = (3.2, 0.4) alpha = 0.2
	domorph time = 0.1 scale = (3.6, 0.1) alpha = 0.05
	die
endscript

script goal_multiplayer_scoreboard_create 
	if screenelementexists id = goal_multiplayer_scoreboard
		destroyscreenelement id = goal_multiplayer_scoreboard
	endif
	<pos> = (35.0, 210.0)
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_multiplayer_scoreboard
		just = [left top]
		pos = <pos>
		z_priority = -7
	}
	<pos> = (0.0, 0.0)
	if gotparam player_color
		<player_rgba> = ($graffitiColors [<player_color>])
	else
		<player_rgba> = [70 70 128 255]
	endif
	createscreenelement {
		type = textelement
		parent = goal_multiplayer_scoreboard
		local_id = player_name
		just = [left top]
		pos = <pos>
		font = text_a1
		text = "YOU : "
		rgba = <player_rgba>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		scale = 0.4
	}
	createscreenelement {
		type = textelement
		parent = goal_multiplayer_scoreboard
		local_id = player_score
		just = [left top]
		pos = (<pos> + (140.0, 0.0))
		font = text_a1
		text = "0"
		rgba = <player_rgba>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		scale = 0.4
	}
	if NOT gotparam opponents
		opponents = [
			{name = "Name Not Provided"}
		]
	endif
	getarraysize opponents
	<index> = 0
	begin
	<pos> = (<pos> + (0.0, 14.0))
	formattext textname = text "%s : " s = (<opponents> [<index>].name)
	formattext checksumname = name_id 'name%n' n = <index>
	formattext checksumname = score_id 'score%n' n = <index>
	if structurecontains structure = (<opponents> [<index>]) color
		<opponent_color> = (<opponents> [<index>].color)
		<opponent_rgba> = ($graffitiColors [<opponent_color>])
	else
		<opponent_rgba> = [70 70 128 255]
	endif
	createscreenelement {
		type = textelement
		parent = goal_multiplayer_scoreboard
		local_id = <name_id>
		just = [left top]
		pos = <pos>
		font = text_a1
		text = <text>
		rgba = <opponent_rgba>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		scale = 0.4
	}
	createscreenelement {
		type = textelement
		parent = goal_multiplayer_scoreboard
		local_id = <score_id>
		just = [left top]
		pos = (<pos> + (140.0, 0.0))
		font = text_a1
		text = "0"
		rgba = <opponent_rgba>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		scale = 0.4
	}
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script goal_multiplayer_scoreboard_destroy 
	if screenelementexists \{id = goal_multiplayer_scoreboard}
		destroyscreenelement \{id = goal_multiplayer_scoreboard}
	endif
endscript

script goal_multiplayer_scoreboard_update 
	if screenelementexists id = goal_multiplayer_scoreboard
		if gotparam goal
			gman_getdata goal = <goal>
		else
			printf 'WARNING: When running goal_multiplayer_scoreboard_update you should provide a goal=goal_id'
		endif
		if gotparam player_score
			formattext textname = score "%n" n = <player_score>
			setscreenelementprops {
				id = {goal_multiplayer_scoreboard child = player_score}
				text = <score>
			}
		else
			printf 'WARNING: if you want to have the player score update, make sure that player_score is part of your goal data'
		endif
		if NOT gotparam opponents
			printf 'WARNING: if you want to have the opponents scores update, make sure that <opponents> = [{}] is part of your goal data'
			opponents = [
				{name = "Name Not Provided"}
			]
		endif
		getarraysize opponents
		<index> = 0
		begin
		if NOT gotparam opponent_scores
			<opponent_scores> = []
			<i> = 0
			begin
			<tmp_array> = [0]
			<opponent_scores> = (<opponent_scores> + <tmp_array>)
			<i> = (<i> + 1)
			repeat <array_size>
			printf 'WARNING: if you want to have the opponents scores update, make sure that <opponent_scores> = [] is part of your goal data'
		endif
		formattext textname = score "%n" n = (<opponent_scores> [<index>])
		formattext checksumname = score_id 'score%n' n = <index>
		formattext checksumname = name_id 'name%n' n = <index>
		setscreenelementprops {
			id = {goal_multiplayer_scoreboard child = <score_id>}
			text = <score>
		}
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script goal_hide_timer 
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			hide}
	endif
endscript

script goal_unhide_timer 
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			unhide}
	endif
endscript
goal_panel_total_messages_queued = 0
goal_panel_current_message = 1
goal_panel_queue_size = 0

script goal_panel_wait_and_reset_queue 
	wait \{2
		seconds
		ignoreslomo}
	change goal_panel_current_message = ($goal_panel_current_message + 1)
	change goal_panel_queue_size = ($goal_panel_queue_size -1)
	wait \{5
		seconds
		ignoreslomo}
	goal_panel_reset_queue
endscript

script goal_panel_reset_queue 
	change \{goal_panel_queue_size = 0}
	change \{goal_panel_total_messages_queued = 0}
	change \{goal_panel_current_message = 1}
	killspawnedscript \{name = goal_panel_wait_for_my_turn}
endscript

script goal_panel_wait_for_my_turn 
	if ($goal_panel_queue_size > 9)
		goto \{nullscript}
	endif
	change goal_panel_total_messages_queued = ($goal_panel_total_messages_queued + 1)
	change goal_panel_queue_size = ($goal_panel_queue_size + 1)
	my_turn = ($goal_panel_total_messages_queued)
	begin
	if (<my_turn> = $goal_panel_current_message)
		break
	endif
	wait \{1
		gameframes}
	repeat
	killspawnedscript \{name = goal_panel_wait_and_reset_queue}
	spawnscriptlater \{goal_panel_wait_and_reset_queue}
endscript

script goal_intro_screen 
	requireparams [goal_id] all
	fadetoblack on time = 0.1 alpha = 1
	if NOT goal_get_title goal = <goal_id>
		<view_goals_title> = "goal intro"
	endif
	getlowercasestring <view_goals_title>
	<view_goals_title> = <lowercasestring>
	gman_getgrade goal = <goal_id>
	if (<grade> > 0)
		formattext textname = grade_text "level achieved: %s" s = ($goal_grade_text [<grade>])
	else
		<grade_text> = "level achieved: unattempted"
	endif
	if NOT goal_get_dialog goal = <goal_id> checkpoint = <use_checkpoint>
		<view_goals_dialog> = ""
	endif
	if NOT get_goal_am_pro_sick_text goal = <goal_id> checkpoint = <use_checkpoint>
		<view_goals_text_am> = ""
		<view_goals_text_pro> = ""
		<view_goals_text_sick> = ""
	endif
	if screenelementexists id = goal_container
		destroyscreenelement id = goal_container
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_container
		event_handlers = [
			{pad_choose goal_intro_screen_continue params = {goal = <goal_id>}}
		]
	}
	root_window :settags menu_state = on
	assignalias id = goal_container alias = current_menu_anchor
	create_helper_text {
		parent = goal_container
		helper_text_elements = [
			{text = "\\m0 start goal"}
		]
	}
	runscriptonscreenelement id = goal_container ui_pausemenu_play_icon params = {pos = (400.0, 0.0) scale_mod = 0.75 left}
	createscreenelement {
		type = spriteelement
		parent = goal_container
		texture = cap_whitenoise
		pos = (975.0, 135.0)
		just = [center center]
		dims = (850.0, 105.0)
		rgba = [240 240 240 235]
		rot_angle = -2
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = goal_container
		texture = cap_whitenoise
		pos = (500.0, 580.0)
		just = [center center]
		dims = (-700.0, 200.0)
		rgba = [200 200 200 180]
		rot_angle = 100
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = goal_container
		texture = cap_whitenoise
		pos = (1200.0, 400.0)
		just = [center center]
		dims = (-400.0, -300.0)
		rgba = [180 180 180 125]
		rot_angle = 50
		z_priority = -1
	}
	createscreenelement {
		parent = goal_container
		type = spriteelement
		pos = (550.0, 85.0)
		dims = (730.0, 105.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		z_priority = -3
	}
	createscreenelement {
		type = textelement
		parent = goal_container
		text = <view_goals_title>
		font = text_a1
		scale = (1.05, 0.85)
		pos = (640.0, 115.0)
		just = [left center]
		rgba = [200 200 200 255]
		z_priority = 3
		shadow
		shadow_offs = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	printstruct <...>
	if (<width> > 510)
		<scale> = ((510.0 / <width>) * (1.05, 0.85))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	ui_create_messy_background {
		parent = goal_container
		dims = (640.0, 650.0)
		pos = (530.0, 150.0)
		z_priority = -5
		rot_angle = 19.5
	}
	createscreenelement {
		parent = goal_container
		type = spriteelement
		pos = (586.0, 150.0)
		dims = (700.0, 570.0)
		just = [left top]
		texture = white
		rgba = [0 0 0 255]
		z_priority = -3
	}
	createscreenelement {
		type = textelement
		parent = goal_container
		text = <grade_text>
		font = text_a1
		pos = (640.0, 160.0)
		just = [left top]
		scale = (0.85, 0.7)
		rgba = [128 128 128 255]
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = goal_container
		texture = menu_goal_underline
		pos = (595.0, 200.0)
		just = [left top]
		dims = (540.0, 8.0)
		rgba = [128 128 128 255]
		z_priority = 2
	}
	createscreenelement {
		type = textblockelement
		parent = goal_container
		text = <view_goals_dialog>
		font = text_a1
		pos = (640.0, 221.0)
		just = [left top]
		internal_just = [left top]
		dims = (720.0, 0.0)
		allow_expansion
		scale = (0.7, 0.6)
		rgba = [200 200 200 255]
		font_spacing = 2
		z_priority = 8
	}
	getscreenelementdims id = <id>
	<descrip_height> = ((0.0, 1.0) * <height> + (0.0, 0.0))
	<padding> = 8
	<text_height> = 0
	goal_intro_screen_grade_descrip {
		grade = 1
		best_grade = <grade>
		pos = ((548.0, 221.0) + <descrip_height>)
		text = <view_goals_text_am>
		scale = (0.7, 0.65000004)
	}
	if gotparam return_params
		<text_height> = (<text_height> + <return_params>.text_height + <padding>)
		removeparameter return_params
	endif
	goal_intro_screen_grade_descrip {
		grade = 2
		best_grade = <grade>
		pos = ((548.0, 221.0) + <descrip_height> + ((0.0, 1.0) * <text_height>))
		text = <view_goals_text_pro>
	}
	if gotparam return_params
		<text_height> = (<text_height> + <return_params>.text_height + <padding>)
		removeparameter return_params
	endif
	goal_intro_screen_grade_descrip {
		grade = 3
		best_grade = <grade>
		pos = ((548.0, 221.0) + <descrip_height> + ((0.0, 1.0) * <text_height>))
		text = <view_goals_text_sick>
	}
	fadetoblack off time = 0.25
	launchevent type = focus target = goal_container
	begin
	if NOT screenelementexists id = goal_container
		break
	endif
	wait 2 gameframes
	repeat
	root_window :settags menu_state = off
endscript

script goal_intro_screen_grade_descrip parent = goal_container last_grade = 0 best_grade = 0 z_priority = 5
	requireparams [grade pos text] all
	if (<text> = "")
		return
	endif
	switch <grade>
		case 1
		<icon> = icon_small_am
		<icon_scale> = 0.7
		case 2
		<icon> = icon_small_pro
		<icon_scale> = 1.0
		case 3
		<icon> = icon_small_sick
		<icon_scale> = 1.2
	endswitch
	if NOT (<best_grade> = <grade>)
		<alpha> = 0.7
	else
		<alpha> = 1.0
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		pos = <pos>
		scale = 1.0
	}
	<container_id> = <id>
	createscreenelement {
		type = containerelement
		parent = <container_id>
		pos = (40.0, 30.0)
		just = [center center]
		alpha = 1.0
		scale = 1.0
	}
	<icon_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = <icon>
		pos = (0.0, 0.0)
		just = [center center]
		dims = ((70.0, 70.0) * <icon_scale>)
		rgba = ($goal_ui_scheme.main)
		alpha = <alpha>
		z_priority = <z_priority>
	}
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = <icon>
		pos = (0.0, 0.0)
		just = [center center]
		dims = ((25.0, 25.0) * <icon_scale>)
		rgba = [220 220 220 255]
		alpha = <alpha>
		z_priority = (<z_priority> + 2)
	}
	rgba = ($goal_ui_scheme.main)
	if gotparam arcade
		rgba = [200 200 200 255]
	endif
	dims = (680.0, 0.0)
	if gotparam menu
		dims = (620.0, 0.0)
	endif
	createscreenelement {
		type = textblockelement
		parent = <container_id>
		text = <text>
		font = text_a1
		pos = (90.0, 20.0)
		just = [left top]
		internal_just = [left top]
		dims = <dims>
		scale = (0.75, 0.65000004)
		rgba = <rgba>
		alpha = <alpha>
		z_priority = (<z_priority> + 3)
		allow_expansion
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	return return_params = {container_id = <container_id> icon_id = <icon_id> text_id = <id> text_height = <height>}
endscript

script pulse_icon 
	begin
	domorph \{time = 0
		rot_angle = 0}
	wait \{0.5
		seconds
		ignoreslomo}
	domorph \{time = 0.5
		rot_angle = 360}
	repeat
endscript

script goal_intro_screen_continue 
	requireparams \{[
			goal
		]
		all}
	gman_passcheckpoint goal = <goal> do_rollout = 0
	die
endscript

script goal_intro_screen_quit 
	requireparams \{[
			goal
		]
		all}
	gman_deactivategoal goal = <goal>
	die
endscript

script goal_success_messages 
	requireparams [goal_id] all
	gman_getdata goal = <goal_id>
	goal_panel_wait_for_my_turn
	ui_kill_message_hack id = ui_alert_uber
	fadetoblack on alpha = 1 time = 0
	if NOT gotparam no_sound
		GMan_GetLifestyle goal = <goal_id>
		switch <lifestyle>
			case hardcore
			soundevent event = General_Goal_Success_Sound_sfx success_sfx_type = hardcore
			case rigger
			soundevent event = General_Goal_Success_Sound_sfx success_sfx_type = rigger
			case career
			soundevent event = General_Goal_Success_Sound_sfx success_sfx_type = career
			case none
			soundevent event = General_Goal_Success_Sound_sfx success_sfx_type = none
		endswitch
	endif
	if screenelementexists id = goal_container
		destroyscreenelement id = goal_container
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_container
	}
	goal_container :settags rewards_goal_id = <goal_id>
	root_window :settags menu_state = on
	assignalias id = goal_container alias = current_menu_anchor
	runscriptonscreenelement {
		goal_display_success_messages
		id = goal_container
		params = {
			goal = <goal_id>
			goal_rewards = <goal_rewards>
			give_rewards = <give_rewards>
		}
	}
endscript

script goal_ambient_success_messages 
	goal_update_wants_autosave goal = <goal_id>
	wait_time = 0.0
	if structurecontains structure = <goal_rewards> cash_reward_this_try
		if NOT ((<goal_rewards>.cash_reward_this_try) = 0)
			formattext {
				textname = success_text "$%c.00!" c = (<goal_rewards>.cash_reward_this_try)
				decimalplaces = 0
			}
			spawnscriptnow ui_display_message params = {type = alert text = <success_text> color = green}
			soundevent event = progress_cash_SFX
			wait_time = 3.0
		endif
	endif
	if structurecontains structure = <goal_rewards> skill_points
		if gotparam give_rewards
			formattext {
				textname = success_text "%g skill points!"
				g = (<goal_rewards>.skill_points)
				decimalplaces = 0
			}
			soundevent event = special_sound_in_otherm_modes
			spawnscriptnow ui_display_message params = {type = alert text = <success_text> color = amber wait_time = <wait_time>}
		endif
	endif
	goal_end_rewards goal_id = <goal_id> autosave = 1
endscript

script goal_update_wants_autosave 
	gman_getgrade goal = <goal>
	if gotparam give_rewards
		change goal_success_wants_autosave = <goal>
	elseif (<last_grade> > <previous_grade>)
		change goal_success_wants_autosave = <goal>
	elseif gman_getconstant goal = <goal> name = not_graded
		change goal_success_wants_autosave = <goal>
	endif
	if NOT getglobalflag flag = $CAREER_TRAINING_DONE
		if checksumequals a = <goal> b = m_line_slums
			change goal_success_wants_autosave = none
		endif
	endif
	if checksumequals a = <goal> b = m_r1_postvid
		change goal_success_wants_autosave = none
	endif
endscript
goal_success_wants_autosave = none

script goal_display_success_messages goal_rewards = {}
	printf 'goal_display_success_messages'
	requireparams [goal] all
	change goal_success_wants_autosave = none
	gman_getgoaltype goal = <goal>
	if checksumequals a = <goal_type> b = classic
		if istrue $signin_change_happening
			printf 'not showing success messages, player signing out'
			return
		endif
	endif
	if gotparam give_rewards
		if comparestructs struct1 = <goal_rewards> struct2 = {}
			<show_retry_goal> = 1
		else
			<show_retry_goal> = 0
		endif
	else
		<show_retry_goal> = 1
	endif
	if NOT gman_canretrylastgoal
		<show_retry_goal> = 0
	endif
	goal_presentation_hold_skater
	hide_all_hud_items
	goal_update_wants_autosave goal = <goal>
	if NOT gman_getconstant goal = <goal> name = success_show_only_rewards
		Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
		playigccam {
			name = goal_success_vanity
			controlscript = igc_aim_at_face
			params = {
				screenoffset = (0.67, 0.0)
				y_pos = 1.22
			}
			play_hold
		}
		if NOT goal_get_title goal = <goal>
			gman_getgoalstring goal = <goal>
			formattext textname = view_goals_title "%s" s = <goal_string>
		endif
		goal_get_descrip_list goal = <goal>
		gman_getgrade goal = <goal>
		switch <last_grade>
			case 1
			<last_grade_name> = "AM!"
			case 2
			<last_grade_name> = "PRO!"
			case 3
			<last_grade_name> = "SICK!"
			default
			<last_grade_name> = "none"
		endswitch
		if NOT get_goal_am_pro_sick_text goal = <goal>
			<view_goals_text_am> = ""
			<view_goals_text_pro> = ""
			<view_goals_text_sick> = ""
		endif
		if gotparam goal_rewards
			if structurecontains structure = <goal_rewards> cash_reward_this_try
				if ((<goal_rewards>.cash_reward_this_try) > 0)
					formattext textname = cash_text "cash earned $%c" c = (<goal_rewards>.cash_reward_this_try)
				endif
				soundevent event = progress_cash_SFX
			endif
		endif
		GMan_GetLifestyle goal = <goal>
		switch <lifestyle>
			case career
			<screen_title> = "CAREER\\nGOAL COMPLETE!"
			case hardcore
			<screen_title> = "HARDCORE\\nGOAL COMPLETE!"
			case rigger
			<screen_title> = "RIGGER\\nGOAL COMPLETE!"
			case none
			default
			<screen_title> = "GOAL COMPLETE!"
		endswitch
		if screenelementexists id = goal_initial_success_container
			destroyscreenelement id = goal_initial_success_container
		endif
		createscreenelement {
			id = goal_initial_success_container
			type = containerelement
			parent = goal_container
		}
		goal_display_success_bg {
			goal = <goal>
			title = <view_goals_title>
			parent = goal_initial_success_container
			retry = <show_retry_goal>
			pos_offset = (5.0, 0.0)
		}
		createscreenelement {
			type = textblockelement
			parent = goal_initial_success_container
			font = text_a1
			text = <screen_title>
			rgba = [200 200 200 255]
			internal_just = [left center]
			scale = (0.9, 0.6)
			dims = (600.0, 0.0)
			allow_expansion
			pos = (123.0, 195.0)
			just = [left center]
			z_priority = 3
			shadow
			shadow_offs = (2.0, 2.0)
		}
		if NOT gman_getconstant goal = <goal> name = not_graded
			createscreenelement {
				type = textelement
				parent = goal_initial_success_container
				font = text_a1
				text = "level achieved: "
				rgba = [128 128 128 255]
				scale = (1.0, 0.8)
				pos = (125.0, 225.0)
				just = [left top]
				z_priority = 3
				shadow
				shadow_offs = (2.0, 2.0)
			}
			getscreenelementdims id = <id>
			createscreenelement {
				type = textelement
				parent = goal_initial_success_container
				font = text_a1
				text = <last_grade_name>
				rgba = ($goal_ui_scheme.main)
				scale = (1.0, 0.8)
				pos = ((125.0, 225.0) + (1.0, 0.0) * <width>)
				just = [left top]
				z_priority = 3
				shadow
				shadow_offs = (-2.0, -2.0)
			}
		endif
		createscreenelement {
			type = spriteelement
			parent = goal_initial_success_container
			texture = menu_goal_underline
			dims = (500.0, 2.0)
			pos = (80.0, 263.0)
			just = [left top]
			rgba = [128 128 128 255]
		}
		if gotparam view_goals_descrip_list
			goal_show_descrip_list {
				goal = <goal>
				parent = goal_initial_success_container
				pos = (116.0, 282.0)
				animate = 1
			}
			fadetoblack off time = 0.25
		else
			fadetoblack off time = 0.25
			pos = (60.0, 250.0)
			goal_intro_screen_grade_descrip {
				parent = goal_initial_success_container
				grade = 1
				last_grade = <last_grade>
				best_grade = <grade>
				dims = (620.0, 400.0)
				pos = <pos>
				text = <view_goals_text_am>
			}
			if gotparam return_params
				am_params = <return_params>
				doscreenelementmorph {
					id = (<am_params>.container_id)
					alpha = 0.4
				}
				<pos> = (<pos> + ((0.0, 1.0) * ((<am_params>.text_height) + 8)))
				removeparameter return_params
			endif
			getscreenelementdims id = <id>
			goal_intro_screen_grade_descrip {
				parent = goal_initial_success_container
				grade = 2
				last_grade = <last_grade>
				best_grade = <grade>
				pos = <pos>
				text = <view_goals_text_pro>
			}
			if gotparam return_params
				pro_params = <return_params>
				doscreenelementmorph {
					id = (<pro_params>.container_id)
					alpha = 0.4
				}
				<pos> = (<pos> + ((0.0, 1.0) * ((<pro_params>.text_height) + 8)))
				removeparameter return_params
			endif
			goal_intro_screen_grade_descrip {
				parent = goal_initial_success_container
				grade = 3
				last_grade = <last_grade>
				best_grade = <grade>
				pos = <pos>
				text = <view_goals_text_sick>
			}
			if gotparam return_params
				sick_params = <return_params>
				doscreenelementmorph {
					id = (<sick_params>.container_id)
					alpha = 0.4
				}
				<i> = 1
				begin
				switch <i>
					case 1
					<rank_params> = <am_params>
					case 2
					<rank_params> = <pro_params>
					case 3
					<rank_params> = <sick_params>
				endswitch
				if NOT (<grade> < <i>)
					doscreenelementmorph id = (<rank_params>.text_id) rgba = [200 200 200 255] time = 0.25 scale = 1.2 relative_scale
					doscreenelementmorph id = (<rank_params>.container_id) alpha = 1.0 time = 0.25
					wait 0.25 seconds ignoreslomo
				endif
				if (<last_grade> = <i>)
					doscreenelementmorph id = (<rank_params>.container_id) alpha = 1.0 time = 0.5
					doscreenelementmorph id = (<rank_params>.text_id) rgba = ($goal_ui_scheme.main) time = 0.75 scale = 1.0 relative_scale
					runscriptonscreenelement id = (<rank_params>.icon_id) pulse_icon
				else
					doscreenelementmorph id = (<rank_params>.text_id) rgba = ($goal_ui_scheme.main) time = 0.75 scale = 1.0 relative_scale
					doscreenelementmorph id = (<rank_params>.container_id) alpha = 0.4 time = 0.4
				endif
				wait 0.6 seconds ignoreslomo
				<i> = (<i> + 1)
				repeat 3
				removeparameter return_params
			endif
		endif
		if gotparam cash_text
			createscreenelement {
				type = spriteelement
				parent = goal_initial_success_container
				texture = icon_cash
				dims = (95.0, 55.0)
				pos = (170.0, 570.0)
				just = [left top]
				rgba = [200 200 200 255]
				z_priority = 3
			}
			createscreenelement {
				type = textelement
				parent = goal_initial_success_container
				font = text_a1
				text = <cash_text>
				just = [left top]
				pos = (300.0, 585.0)
				rgba = [200 200 200 255]
				scale = (0.95, 0.7)
			}
		endif
		setscreenelementprops id = goal_container event_handlers = [
			{focus goal_success_refocus_pad_handler}
		]
		launchevent type = focus target = goal_success_pad_handler
		block untilevent = goal_display_success_messages_done
		fadetoblack on time = 0.1 alpha = 1
		wait 0.1 second ignoreslomo
		if screenelementexists id = goal_initial_success_container
			destroyscreenelement id = goal_initial_success_container
		endif
		killskatercamanim name = goal_success_vanity
	endif
	if gotparam give_rewards
		goal_display_reward_screens {
			goal = <goal>
			goal_rewards = <goal_rewards>
		}
		MakeSkaterGoto SkaterInit
	endif
	goal_container :goal_end_success_messages
endscript

script goal_success_refocus_pad_handler 
	if screenelementexists \{id = goal_success_pad_handler}
		launchevent \{type = focus
			target = goal_success_pad_handler}
	endif
	if screenelementexists \{id = goal_rewards_menu}
		launchevent \{type = focus
			target = goal_rewards_menu}
	endif
	if iscreated \{goal_success_rak}
		skater :hide
	endif
endscript

script goal_display_success_messages_autosave 
	printf 'goal_display_success_messages_autosave'
	if NOT ($goal_success_wants_autosave = none)
		goal = ($goal_success_wants_autosave)
		change goal_success_wants_autosave = none
		if ($goal_save_extra_data = 1)
			change goal_save_extra_data = 0
		endif
		if gman_getgoalstate goal = <goal> states = [goal_activating goal_activated goal_deactivating]
			printf "Tried to save while goal %g is in state %s" g = <goal> s = <goal_state>
		else
			BlockUntilScreenClear
			do_autosave
		endif
	endif
endscript

script goal_display_success_bg {title = ""
		parent = goal_container
		continue = 1
		retry = 0
		event_handlers = []
		helper = 1
		width = 760
		pos_offset = (0.0, 0.0)
	}
	<show_video_editor_option> = 0
	if (<retry> = 1)
		gman_getgoaltype goal = <goal>
		switch <goal_type>
			case film
			<show_video_editor_option> = 1
		endswitch
		if NOT gman_canretrylastgoal
			<retry> = 0
		endif
	endif
	<width_pair> = ((1.0, 0.0) * <width>)
	ui_create_messy_background {
		messy_id = ui_messy_background2
		parent = <parent>
		dims = ((0.0, 950.0) + <width_pair>)
		pos = (-200.0, 50.0)
		z_priority = -5
		rot_angle = -19
	}
	createscreenelement {
		parent = <parent>
		type = spriteelement
		pos = ((8.0, 98.0) + <pos_offset>)
		dims = (<width_pair> + (-160.0, 105.0))
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		z_priority = -3
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = cap_whitenoise
		pos = (165.0, 135.0)
		just = [center center]
		dims = (-840.0, -105.0)
		rgba = [240 240 240 235]
		rot_angle = 2
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = cap_whitenoise
		pos = (70.0, 580.0)
		just = [center center]
		dims = (-700.0, -200.0)
		rgba = [220 220 220 220]
		rot_angle = -100
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = cap_whitenoise
		pos = (625.0, 625.0)
		just = [center center]
		dims = (-600.0, 250.0)
		rgba = [200 200 200 115]
		rot_angle = 70
		z_priority = -1
	}
	createscreenelement {
		type = textelement
		parent = <parent>
		font = text_a1
		text = <title>
		scale = (1.1, 0.85)
		pos = ((115.0, 110.0) + <pos_offset>)
		just = [left top]
		rgba = [200 200 200 255]
		z_priority = 3
		shadow
		shadow_offs = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	if (<width> > 425)
		<scale> = ((425.0 / <width>) * (1.1, 0.85))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	if NOT gotparam noicon
		runscriptonscreenelement id = <parent> ui_pausemenu_play_icon params = {pos = (<width_pair> + (-200.0, 0.0)) scale_mod = 0.6}
	endif
	<helper_text_elements> = []
	if (<continue> = 1)
		addarrayelement array = <helper_text_elements> element = {text = "\\m0 continue"}
		<helper_text_elements> = <array>
	endif
	if (<retry> = 1)
		addarrayelement array = <helper_text_elements> element = {text = "\\m1 retry goal"}
		<helper_text_elements> = <array>
	endif
	if NOT game_progress_has_valid_save
		show_video_editor_option = 0
	endif
	if has_active_video_editor_cheats
		show_video_editor_option = 0
	endif
	if (<show_video_editor_option> = 1)
		addarrayelement array = <helper_text_elements> element = {text = "\\m8 go to video editor"}
		<helper_text_elements> = <array>
	endif
	create_helper_text {
		parent = <parent>
		helper_text_elements = <helper_text_elements>
	}
	createscreenelement {
		id = goal_success_pad_handler
		type = containerelement
		parent = <parent>
	}
	if (<continue> = 1)
		setscreenelementprops id = goal_success_pad_handler event_handlers = [
			{pad_choose goal_display_success_messages_continue}
		]
	endif
	if (<retry> = 1)
		setscreenelementprops id = goal_success_pad_handler event_handlers = [
			{pad_back goal_display_success_messages_retry params = {goal = <goal>}}
		]
	endif
	if (<show_video_editor_option> = 1)
		setscreenelementprops id = goal_success_pad_handler event_handlers = [
			{pad_btn_top goal_display_success_messages_goto_video_editor}
		]
	endif
endscript

script goal_display_reward_screens 
	if getglobalflag \{flag = $CAREER_TRAINING_DONE}
		gman_getgoaltype goal = <goal>
		switch <goal_type>
			case film
			<goal_rewards> = {<goal_rewards> show_ve_tutorial = true}
		endswitch
	endif
	ui_career_rewards {
		rewards = <goal_rewards>
		goal = <goal>
		title = "goal rewards"
	}
endscript

script goal_display_success_messages_continue 
	printf \{'goal_display_success_messages_continue'}
	generic_menu_pad_choose_sound
	goal_display_success_cleanup_cas
	goal_reward_kill_rigger_object
	skater :input_debounce \{x
		clear = 1}
	launchevent \{broadcast
		type = goal_display_success_messages_done}
endscript

script goal_display_success_messages_retry 
	kill_start_key_binding
	change \{goal_is_between_retries = 1}
	goal_display_success_messages_continue
	wait \{1
		gameframe}
	spawnscriptnow goal_display_success_messages_retry_do params = {goal = <goal>}
endscript

script goal_display_success_messages_retry_do 
	if gotparam \{goal}
		gman_getgoaltype goal = <goal>
		if checksumequals a = <goal_type> b = classic
			wait \{5
				gameframes}
		endif
	endif
	goal_retry_last_goal
endscript

script goal_display_success_messages_goto_movies 
	printf \{'goal_display_success_messages_goto_movies'}
	igc_temporarily_disable_rendering \{1
		gameframes}
	spawnscriptlater goal_display_success_messages_goto_movies_spawned params = {movie_type = <movie_type>}
	goal_display_success_messages_continue
endscript

script goal_display_success_messages_goto_movies_spawned 
	switch <movie_type>
		case ve_tutorial
		<title> = "video editor tutorials"
		<movies> = [
			{
				name = "Basics"
				movie = $VE_Insert_Remove_Video
			}
			{
				name = "Trimming Clips"
				movie = $VE_Trim02_Video
			}
			{
				name = "Screen FX"
				movie = $VE_FX_Video
			}
			{
				name = "Overlays"
				movie = $VE_Overlay_Insert_Move_Video
			}
			{
				name = "Putting it all together!"
				movie = $VE_Scoring_Video
			}
		]
		default
		return
	endswitch
	goal_presentation_pause
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	make_cas_menu {
		title = <title>
		pad_back_script = goal_display_success_messages_exit_movies
		pausemenu
	}
	foreachin <movies> do = goal_display_success_messages_add_movie_item
	cas_menu_finish
	block type = goal_success_movies_done
	Destroy_MenuFx
	generic_ui_destroy
endscript

script goal_display_success_messages_exit_movies 
	goal_presentation_unpause
	launchevent \{broadcast
		type = goal_success_movies_done}
endscript

script goal_display_success_messages_add_movie_item 
	add_cas_menu_item {
		text = <name>
		pad_choose_script = goal_display_success_play_movie
		pad_choose_params = {movie = <movie>}
	}
endscript

script goal_display_success_play_movie 
	requireparams [movie] all
	printf 'goal_display_success_play_movie'
	launchevent type = unfocus target = current_menu
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	main_menu_anchor :setprops hide block_events
	goal_presentation_subtitled_movie movie = <movie>
	goal_presentation_pause
	main_menu_anchor :setprops unhide unblock_events
	cas_menu_finish
	wait 2 gameframe
	fake_button type = pad_down
	fake_button type = pad_up
endscript

script goal_display_success_messages_goto_video_editor 
	printf \{'goal_display_success_messages_goto_video_editor'}
	spawnscriptlater \{ui_goto_video_editor_from_gameplay}
	goal_display_success_messages_continue
endscript

script ui_goto_video_editor_from_gameplay 
	wait \{15
		gameframes}
	begin
	wait \{2
		gameframes}
	BlockUntilScreenClear \{wait_for_auto_save = 1}
	repeat 3
	do_actual_pause
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script goal_success_message_grade_bar {anchor_id = am_container
		pos = (750.0, 750.0)
		grade = 1
		descrip = ""
		got_grade = 0
	}
	<grade_name> = ($goal_grade_text [<grade>])
	formattext textname = grade_descrip "%n: %d" n = <grade_name> d = <descrip>
	if (<got_grade> = <grade>)
		<bg_color> = [0 0 0 255]
		<text_color> = [200 200 200 255]
	else
		<bg_color> = [64 64 64 255]
		<text_color> = [0 0 0 255]
	endif
	createscreenelement {
		type = containerelement
		id = <anchor_id>
		parent = goal_container
		pos = <pos>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		dims = (500.0, 40.0)
		texture = white
		rgba = <bg_color>
		z_priority = 2.1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = goal_summary_bar_endcap
		rgba = <bg_color>
		dims = (256.0, 40.0)
		pos = (-250.0, 0.0)
		z_priority = 2.2
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = goal_summary_bar_endcap
		rgba = <bg_color>
		dims = (256.0, 40.0)
		pos = (350.0, 0.0)
		z_priority = 2.2
		flip_v
	}
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		scale = (1.0, 0.8)
		pos = (0.0, 5.0)
		font = text_a1
		text = <grade_descrip>
		rgba = <text_color>
		z_priority = 2.3
	}
endscript

script goal_end_success_messages 
	goal_viewport_kill \{all}
	Destroy_MenuFx
	getsingletag \{rewards_goal_id}
	goal_end_rewards goal_id = <rewards_goal_id> autosave = 1
	if gman_getgoalstate goal = <rewards_goal_id> states = [goal_rewards]
		gman_endgoaltransition goal = <rewards_goal_id> state = goal_rewards success = true
	endif
	show_all_hud_items
	goal_presentation_unhold_skater
	fadetoblack \{off
		time = 0.0}
	root_window :settags \{menu_state = off}
	spawnscriptnow goal_deactivated params = {goal_id = <rewards_goal_id>}
	die
endscript

script goal_fail_messages 
	gman_getdata goal = <goal_id>
	goal_panel_wait_for_my_turn
	soundevent event = goalutils_sfx_failgoal GoalTypeSfx = <view_goals_text>
	<message_text_one> = ""
	<message_text_btwn> = ""
	if gotparam view_goals_text
		<message_text_one> = <view_goals_text>
		<message_text_btwn> = ":  \\n"
	elseif gotparam goal_text
		<message_text_one> = <goal_text>
		<message_text_btwn> = ":  \\n"
	endif
	<message_text_two> = "failed!"
	formattext textname = ui_message_text "\\cC%a%b\\c0%c" a = <message_text_one> b = <message_text_btwn> c = <message_text_two>
	ui_display_message type = uberalert color = red text = <ui_message_text> has_background
	formattext textname = retry "%p (\\b8) %r" p = str_g_u_64 r = str_g_u_65
	retry_text = <retry>
endscript

script goal_record_create_tracker 
	goal_record_destroy_tracker
	createscreenelement {
		id = goal_record_tracker_container
		type = containerelement
		parent = player1_panel_container
		pos = (50.0, 120.0)
		just = [left top]
		internal_just = [left top]
	}
	createscreenelement {
		id = goal_record_tracker_text_label
		type = textelement
		parent = goal_record_tracker_container
		font = text_a1
		text = "Current:"
		just = [left top]
		rgba = [200 200 200 255]
		scale = 0.45000002
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (1.0, 1.0)
	}
	createscreenelement {
		id = goal_record_tracker_text
		type = textelement
		parent = goal_record_tracker_container
		font = text_a1
		text = "0"
		just = [left top]
		scale = 0.45000002
		pos = (80.0, 0.0)
		rgba = [200 200 200 255]
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (1.0, 1.0)
	}
	createscreenelement {
		id = goal_record_tracker_old_text_label
		type = textelement
		parent = goal_record_tracker_container
		font = text_a1
		text = "Record:"
		just = [left top]
		pos = (0.0, 25.0)
		rgba = [200 200 200 255]
		scale = 0.45000002
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (1.0, 1.0)
	}
	createscreenelement {
		id = goal_record_tracker_old_text
		type = textelement
		parent = goal_record_tracker_container
		font = text_a1
		text = <old_record>
		just = [left top]
		pos = (80.0, 25.0)
		rgba = [200 200 200 255]
		scale = 0.45000002
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (1.0, 1.0)
	}
endscript

script goal_record_destroy_tracker 
	if screenelementexists \{id = goal_record_tracker_container}
		destroyscreenelement \{id = goal_record_tracker_container}
	endif
endscript

script goal_dev_progress_create 
	if ($goal_dev_show_progress = 1)
		requireparams [goal] all
		goal_dev_progress_destroy
		if gman_getconstant goal = <goal> name = dev_progress
			createscreenelement {
				id = goal_dev_progress_container
				type = containerelement
				parent = root_window
				pos = (200.0, 670.0)
			}
			formattext textname = dev_text "goal development %p\\%" p = <dev_progress>
			createscreenelement {
				type = textblockelement
				parent = goal_dev_progress_container
				text = <dev_text>
				font = text_a1
				z_priority = 1000
				dims = (1200.0, 200.0)
				allow_expansion
				scale = (0.9, 0.7)
				rgba = [200 200 200 255]
				shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
			}
		endif
	endif
endscript

script goal_dev_progress_destroy 
	if screenelementexists \{id = goal_dev_progress_container}
		destroyscreenelement \{id = goal_dev_progress_container}
	endif
endscript

script goal_create_arrow id = goal_arrow_element
	if NOT checksumequals a = goal_arrow_element b = <id>
		if screenelementexists id = goal_arrow_element
			doscreenelementmorph id = goal_arrow_element alpha = 0
		endif
	endif
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	createscreenelement {
		type = element3d
		parent = player1_panel_container
		id = <id>
		model = 'GameObjects/HUD_arrow_alpha/HUD_arrow_alpha.mdl'
		cameraz = -1
		pos = (320.0, 90.0)
		active_viewport = 0
		alpha = 1
		scale = 0.5
		anglex = -1.0
		nodetopointto = <nodetopointto>
		postopointto = <postopointto>
		objecttopointto = <objecttopointto>
	}
endscript

script goal_destroy_arrow \{id = goal_arrow_element}
	if NOT checksumequals a = goal_arrow_element b = <id>
		if screenelementexists \{id = goal_arrow_element}
			doscreenelementmorph \{id = goal_arrow_element
				alpha = 1}
		endif
	endif
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script goal_comp_intermission_bg 
	ui_create_messy_background {
		parent = goal_intermission_container
		dims = (750.0, 650.0)
		pos = (260.0, 150.0)
		z_priority = -3
		rot_angle = -4
	}
	createscreenelement {
		parent = goal_intermission_container
		type = spriteelement
		pos = (250.0, 85.0)
		dims = (730.0, 105.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		z_priority = -1
		flip_v
	}
	createscreenelement {
		type = textelement
		parent = goal_intermission_container
		text = <title_text>
		font = text_a1
		scale = (1.1, 0.85)
		pos = (450.0, 115.0)
		just = [left center]
		rgba = [200 200 200 255]
		z_priority = 3
		shadow
		shadow_offs = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	if (<width> > 450)
		<scale> = ((450.0 / <width>) * (1.1, 0.85))
		doscreenelementmorph id = <id> time = 0 scale = <scale> alpha = 1.0
	endif
	createscreenelement {
		type = spriteelement
		parent = goal_intermission_container
		texture = menu_goal_underline
		pos = (400.0, 500.0)
		just = [left top]
		dims = (500.0, 8.0)
		rgba = [128 128 128 255]
		z_priority = -1
	}
	runscriptonscreenelement id = goal_intermission_container ui_pausemenu_play_icon params = {pos = (925.0, 0.0) scale_mod = 0.75}
	createscreenelement {
		type = spriteelement
		parent = goal_intermission_container
		texture = cap_whitenoise
		pos = (780.0, 135.0)
		just = [center center]
		dims = (-370.0, -125.0)
		rgba = [240 240 240 230]
		rot_angle = 6
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = goal_intermission_container
		texture = cap_whitenoise
		pos = (370.0, 580.0)
		just = [center center]
		dims = (-700.0, -200.0)
		rgba = [220 220 220 255]
		rot_angle = -100
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = goal_intermission_container
		texture = cap_whitenoise
		pos = (870.0, 625.0)
		just = [center center]
		dims = (-310.0, 180.0)
		rgba = [200 200 200 255]
		rot_angle = 90
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = goal_intermission_container
		texture = cap_whitenoise
		pos = (350.0, 115.0)
		just = [center center]
		dims = (150.0, 80.0)
		rgba = [240 240 240 255]
		rot_angle = 25
		z_priority = 0
	}
	createscreenelement {
		parent = goal_intermission_container
		type = spriteelement
		pos = (423.0, 100.0)
		dims = (-220.0, 50.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		rot_angle = 89
		z_priority = 0
		flip_v
	}
	createscreenelement {
		parent = goal_intermission_container
		type = spriteelement
		pos = (407.0, 322.0)
		dims = (300.0, 84.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		rot_angle = 179
		z_priority = 1
		flip_v
	}
endscript
goal_comp_intermission_active = 0

script goal_comp_intermission {title = "event: complete"
		description = ""
		evaluation = []
		show_retry = 1
		show_continue = 1
		default_option = retry
		retry_text = "retry event"
		continue_text = "continue"
		continue_action = continue
		point_label = "current comp points"
	}
	requireparams [goal_id] all
	change goal_comp_intermission_active = 1
	onexitrun goal_comp_intermission_destroy params = {goal_id = <goal_id>}
	gman_pausegoal goal = <goal_id>
	if gotparam placement
		switch <placement>
			case 1
			<ordinal> = "st"
			case 2
			<ordinal> = "nd"
			case 3
			<ordinal> = "rd"
			default
			<ordinal> = "th"
		endswitch
		formattext textname = placement_ordinal "%p%o" p = <placement> o = <ordinal>
	endif
	if gotparam curr_comp_points
		formattext textname = curr_comp_points_text "%c" c = <curr_comp_points>
	endif
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	goal_hud_create
	if screenelementexists id = goal_intermission_container
		destroyscreenelement id = goal_intermission_container
	endif
	createscreenelement {
		id = goal_intermission_container
		parent = goal_hud_container
		z_priority = 100
		type = containerelement
		just = [left top]
	}
	spawnscriptnow goal_comp_intermission_bg params = {title_text = <title>}
	goal_create_viewport_type {
		type = comp_intermission
		goal_string = 'goal_intermission_viewport'
		controlscript = igc_aim_at_face
		dist = 0.9
		y_pos = 1.5
		screenoffset = (0.0, 0.8)
		fov = 35.0
		rot_angle = -2
		appearance_priority = 1
	}
	setscreenelementprops id = goal_viewport_parent unhide
	getarraysize <evaluation>
	if (<array_size> > 0)
		createscreenelement {
			id = goal_int_eval_menu
			type = vmenu
			parent = goal_intermission_container
			pos = (435.0, 160.0)
			just = [left top]
			internal_just = [left top]
		}
		<i> = 0
		begin
		createscreenelement {
			type = containerelement
			parent = goal_int_eval_menu
			just = [left top]
			dims = (500.0, 32.0)
		}
		<row_parent> = <id>
		<eval_struct> = (<evaluation> [<i>])
		removeparameter col1
		col1 = (<eval_struct>.label)
		col1 = (<eval_struct>.col1)
		if NOT gotparam col1
			col1 = ""
		endif
		removeparameter col2
		col2 = (<eval_struct>.value)
		col2 = (<eval_struct>.col2)
		if NOT gotparam col2
			col2 = ""
		endif
		removeparameter col3
		col3 = (<eval_struct>.col3)
		if NOT gotparam col3
			col3 = ""
		endif
		removeparameter col3_LJ
		col3_LJ = (<eval_struct>.col3_LJ)
		if NOT gotparam col3_LJ
			col3_LJ = ""
		endif
		formattext textname = formatted_value decimalplaces = 1 "%v" v = <col1>
		createscreenelement {
			type = textelement
			parent = <row_parent>
			text = <formatted_value>
			font = text_a1
			pos = {(0.0, 0.5) proportional}
			scale = (0.95, 0.7)
			just = [left center]
			rgba = [200 200 200 255]
			z_priority = 3
			not_focusable
		}
		getscreenelementdims id = <id>
		if NOT (<col2> = "")
			if (<width> > 250)
				<scale> = ((250.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		elseif NOT ((<col3> = "") && (<col3_LJ> = ""))
			stringlength string = <col3>
			if (<str_len> <= 3)
				if (<width> > 420)
					<scale> = ((420.0 / <width>) * (0.95, 0.7))
					doscreenelementmorph id = <id> time = 0 scale = <scale>
				endif
			else
				if (<width> > 245)
					<scale> = ((245.0 / <width>) * (0.95, 0.7))
					doscreenelementmorph id = <id> time = 0 scale = <scale>
				endif
			endif
		else
			if (<width> > 500)
				<scale> = ((500.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		endif
		formattext textname = formatted_value decimalplaces = 1 "%v" v = <col2>
		createscreenelement {
			type = textelement
			parent = <row_parent>
			text = <formatted_value>
			font = text_a1
			pos = {(0.75, 0.5) proportional}
			scale = (0.95, 0.7)
			just = [right center]
			rgba = [200 200 200 255]
			z_priority = 3
		}
		getscreenelementdims id = <id>
		if NOT (<col1> = "")
			if (<width> > 120)
				<scale> = ((120.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		else
			if (<width> > 375)
				<scale> = ((375.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		endif
		formattext textname = formatted_value decimalplaces = 1 "%v" v = <col3>
		createscreenelement {
			type = textelement
			parent = <row_parent>
			text = <formatted_value>
			font = text_a1
			pos = {(1.0, 0.5) proportional}
			scale = (0.95, 0.7)
			just = [right center]
			rgba = [200 200 200 255]
			z_priority = 3
		}
		getscreenelementdims id = <id>
		if NOT (<col2> = "")
			if (<width> > 115)
				<scale> = ((115.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		elseif NOT (<col1> = "")
			if (<width> > 245)
				<scale> = ((245.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		else
			if (<width> > 500)
				<scale> = ((500.0 / <width>) * (0.95, 0.7))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
		endif
		formattext textname = formatted_value decimalplaces = 1 "%v" v = <col3_LJ>
		createscreenelement {
			type = textelement
			parent = <row_parent>
			text = <formatted_value>
			font = text_a1
			pos = {(0.85, 0.5) proportional}
			scale = (0.95, 0.7)
			just = [left center]
			rgba = [200 200 200 255]
			z_priority = 3
		}
		getscreenelementdims id = <id>
		if (<width> > 75)
			<scale> = ((75.0 / <width>) * (0.95, 0.7))
			doscreenelementmorph id = <id> time = 0 scale = <scale>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam placement
		createscreenelement {
			type = textelement
			parent = goal_intermission_container
			text = "you placed"
			font = text_a1
			pos = (450.0, 385.0)
			scale = (0.95, 0.7)
			just = [left top]
			rgba = [200 200 200 255]
			z_priority = 3
		}
		createscreenelement {
			type = textelement
			parent = <id>
			text = <placement_ordinal>
			font = text_a1
			pos = (490.0, 0.0)
			just = [right top]
			rgba = [200 200 200 255]
			z_priority = 3
		}
	endif
	if gotparam curr_comp_points
		createscreenelement {
			type = textelement
			parent = goal_intermission_container
			text = <point_label>
			font = text_a1
			pos = (450.0, 430.0)
			scale = (1.07, 0.75)
			just = [left top]
			rgba = ($goal_ui_scheme.main)
			z_priority = 3
		}
		createscreenelement {
			type = textelement
			parent = <id>
			text = <curr_comp_points_text>
			font = text_a1
			pos = (435.0, 0.0)
			just = [right top]
			rgba = ($goal_ui_scheme.main)
			z_priority = 3
		}
	endif
	createscreenelement {
		id = goal_int_options_menu
		type = vmenu
		parent = goal_intermission_container
		pos = (640.0, 520.0)
		just = [center top]
		internal_just = [center top]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	<button_handlers> = [
		{focus goal_comp_intermission_button_focus params = {focus = 1}}
		{unfocus goal_comp_intermission_button_focus params = {focus = 0}}
	]
	if (<show_retry> = 1)
		createscreenelement {
			id = giom_retry
			type = textelement
			parent = goal_int_options_menu
			text = <retry_text>
			font = text_a1
			scale = (1.1, 0.85)
			just = [center top]
			rgba = [128 128 128 255]
			z_priority = 3
			shadow
			shadow_offs = (1.0, 1.0)
			event_handlers = <button_handlers>
		}
		getscreenelementdims id = <id>
		if (<width> > 600)
			<scale> = ((600.0 / <width>) * (1.1, 0.85))
			doscreenelementmorph id = <id> time = 0 scale = <scale> alpha = 1.0
		endif
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose goal_comp_intermission_button_choose params = {action = retry goal = <goal_id>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
		}
	endif
	if (<show_continue> = 1)
		createscreenelement {
			id = giom_continue
			type = textelement
			parent = goal_int_options_menu
			text = <continue_text>
			font = text_a1
			scale = (1.1, 0.85)
			just = [center top]
			rgba = [128 128 128 255]
			z_priority = 3
			shadow
			shadow_offs = (1.0, 1.0)
			event_handlers = <button_handlers>
		}
		getscreenelementdims id = <id>
		if (<width> > 600)
			<scale> = ((600.0 / <width>) * (1.1, 0.85))
			doscreenelementmorph id = <id> time = 0 scale = <scale> alpha = 1.0
		endif
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose goal_comp_intermission_button_choose params = {action = <continue_action> goal = <goal_id>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
		}
	endif
	create_helper_text {
		parent = goal_intermission_container
		helper_text_elements = [
			{text = "\\m0 continue"}
		]
	}
	wait 0.5 seconds ignoreslomo
	if NOT checksumequals a = <default_option> b = retry
		launchevent type = focus target = goal_int_options_menu data = {child_id = giom_continue}
	else
		launchevent type = focus target = goal_int_options_menu
	endif
	block
endscript

script goal_comp_intermission_destroy 
	goal_viewport_kill \{all}
	Destroy_MenuFx
	if screenelementexists \{id = goal_intermission_container}
		destroyscreenelement \{id = goal_intermission_container}
	endif
	change \{goal_comp_intermission_active = 0}
	if gman_goalexists goal = <goal_id>
		gman_unpausegoal goal = <goal_id>
	endif
endscript

script goal_comp_intermission_button_focus 
	if (<focus> = 1)
		domorph rgba = ($goal_ui_scheme.main) time = 0
		<scale> = (1.1, 0.85)
		domorph time = 0 scale = <scale> alpha = 0.0
		if screenelementexists id = cas_menu_highlight
			destroyscreenelement id = cas_menu_highlight
		endif
		obj_getid
		getscreenelementdims id = <objid>
		createscreenelement {
			type = spriteelement
			id = cas_menu_highlight
			local_id = cas_menu_highlight
			texture = menu_highlight
			pos = (-20.0, 20.0)
			dims = ((40.0, 15.0) + (<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
			just = [left center]
			rgba = ($mainmenu_color_scheme.bar_color)
			parent = <objid>
			z_priority = -1
			Random (@ flip_h @ )
		}
		if (<width> > 600)
			<scale> = ((600.0 / <width>) * (1.1, 0.85))
		endif
		domorph time = 0 scale = <scale> alpha = 1.0
	else
		domorph rgba = [128 128 128 255] time = 0
	endif
endscript

script goal_comp_intermission_button_choose 
	requireparams [goal action] all
	skater :input_debounce x clear = 1
	if checksumequals a = <action> b = retry
		goal_comp_intermission_destroy goal_id = <goal>
		goal_retry_current_goal
	elseif checksumequals a = <action> b = continue
		gman_passcheckpoint goal = <goal> do_rollout = 0
	elseif checksumequals a = <action> b = fail
		gman_failcheckpoint goal = <goal> do_rollout = 0
	else
		gman_passcheckpoint goal = <goal> do_rollout = 0
	endif
	killspawnedscript name = goal_comp_intermission
endscript

script igc_aim_at_face dist = 1.0 y_pos = 1.22
	ccam_setcollision true
	begin
	skater :obj_getorientation
	<x> = (<x> * <dist>)
	<z> = (<z> * <dist>)
	ccam_domorph {
		lookatbone = bone_neck
		lockto = skater
		lookat = skater
		screenoffset = <screenoffset>
		pos = (<x> * (1.0, 0.0, 0.0) + <z> * (0.0, 0.0, 1.0) + <y_pos> * (0.0, 1.0, 0.0))
		quat = (-0.0031960001, -0.9966379, -0.047989)
		fov = <fov>
		locktoworldorientation
	}
	ccam_waitmorph
	wait 0.1 seconds
	repeat
endscript


script goal_generic_view_goal_pausemenu \{z_priority = 0
		parent = root_window
		skate9_arcade_hack = 0}
	requireparams \{[
			goal
		]
		all}
	if NOT goal_get_title goal = <goal>
		<view_goals_title> = qs(0x44b6cf9f)
	endif
	if goal_get_descrip_list goal = <goal>
		<view_goals_dialog> = qs(0x00000000)
	else
		<view_goals_dialog> = qs(0x00000000)
	endif
	if NOT get_goal_am_pro_sick_text goal = <goal>
		<view_goals_text_am> = qs(0x00000000)
		<view_goals_text_pro> = qs(0x00000000)
		<view_goals_text_sick> = qs(0x00000000)
	endif
	if (<skate9_arcade_hack> = 1)
		<view_goals_dialog> = qs(0xcbaa34fa)
	endif
	goal_generic_view_goal_pausemenu_display {
		goal = <goal>
		title = <view_goals_title>
		dialog_text = <view_goals_dialog>
		descrip_list = <view_goals_descrip_list>
		am_text = <view_goals_text_am>
		pro_text = <view_goals_text_pro>
		sick_text = <view_goals_text_sick>
		z_priority = <z_priority>
		parent = <parent>
	}
endscript

script goal_generic_view_goal_pausemenu_display \{z_priority = 0}
	requireparams \{[
			title
			dialog_text
			am_text
			pro_text
			sick_text
		]
		all}
	getlowercasestring <title>
	<title> = <lowercasestring>
	goal_generic_view_goal_pausemenu_kill
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = goal_view_goal_anchor
		pos = (900.0, 20.0)
		scale = 1
		z_priority = <z_priority>
	}
	if NOT gotparam \{arcade}
		createscreenelement {
			type = spriteelement
			parent = goal_view_goal_anchor
			texture = cap_whitenoise
			pos = (55.0, 115.0)
			just = [center center]
			dims = (650.0, 105.0)
			rgba = [220 220 220 215]
			rot_angle = 4
			z_priority = (<z_priority> + 2)
		}
		createscreenelement {
			type = spriteelement
			parent = goal_view_goal_anchor
			texture = cap_whitenoise
			pos = (140.0, 580.0)
			just = [center center]
			dims = (700.0, 200.0)
			rgba = [200 200 200 135]
			rot_angle = -34
			z_priority = (<z_priority> + 2)
		}
		createscreenelement {
			type = spriteelement
			parent = goal_view_goal_anchor
			texture = cap_whitenoise
			pos = (-170.0, 600.0)
			just = [center center]
			dims = (400.0, 370.0)
			rgba = [180 180 180 95]
			rot_angle = -90
			z_priority = (<z_priority> + 2)
		}
		createscreenelement {
			type = spriteelement
			parent = goal_view_goal_anchor
			texture = menu_headerbar
			pos = (45.0, 120.0)
			just = [center center]
			dims = (640.0, 105.0)
			rgba = ($goal_ui_scheme.main)
			z_priority = (<z_priority> + 1)
		}
		ui_create_messy_background {
			parent = goal_view_goal_anchor
			dims = (800.0, 585.0)
			pos = (-320.0, 85.0)
			z_priority = (<z_priority> - 5)
			rot_angle = 7.5
		}
	else
		setscreenelementprops \{id = goal_view_goal_anchor
			z_priority = 100}
		legacydoscreenelementmorph \{id = goal_view_goal_anchor
			pos = {
				(0.0, -25.0)
				relative
			}}
		<z_priority> = 100
		arcade = {arcade}
	endif
	createscreenelement {
		type = textelement
		parent = goal_view_goal_anchor
		id = goal_view_goal_title
		text = <title>
		font = text_a1
		pos = (-220.0, 100.0)
		scale = (1.1, 0.85)
		rgba = [220 220 220 255]
		shadow
		shadow_rgba = [10 10 10 255]
		shadow_offs = (2.0, 2.0)
		z_priority = (<z_priority> + 10)
		font_spacing = 2
		just = [left center]
		internal_just = [left top]
	}
	getscreenelementdims id = <id>
	if (<width> > 480)
		<scale> = ((480.0 / <width>) * (1.1, 0.85))
		legacydoscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	if gotparam \{arcade}
		getscreenelementdims id = <id>
		goal_arcade_menu_bg {
			parent = goal_view_goal_anchor
			local_id = bg
			pos = (((0.5, 0.0) * <width>) + (-220.0, 100.0))
			width = (<width> + 40)
			height = (<height> + 20)
			z_priority = 1
			bg_rgba = [60 170 255 100]
		}
		goal_arcade_menu_bg {
			parent = goal_view_goal_anchor
			local_id = shadow
			width = (<width> + 40)
			height = (<height> + 20)
			z_priority = 0
			pos = (((0.5, 0.0) * <width>) + (-218.0, 102.0))
			fg_rgba = [0 0 0 255]
			nobg
		}
	endif
	<descrip_height> = (0.0, 260.0)
	if gotparam \{descrip_list}
		goal_show_descrip_list {
			parent = goal_view_goal_anchor
			pos = (-220.0, 135.0)
			goal = <goal>
			<arcade>
		}
		getscreenelementdims \{id = view_goals_descrip_list_anchor}
		<descrip_height> = ((0.0, 1.0) * <height> + (0.0, 135.0))
	else
		createscreenelement {
			type = textblockelement
			parent = goal_view_goal_anchor
			text = <dialog_text>
			font = text_a1
			pos = (-220.0, 135.0)
			scale = (0.7, 0.6)
			rgba = [128 128 128 255]
			shadow
			shadow_rgba = [10 10 10 255]
			shadow_offs = (2.5, 2.5)
			z_priority = (<z_priority> + 10)
			dims = (700.0, 0.0)
			just = [left top]
			font_spacing = 3
			internal_just = [left top]
			allow_expansion
		}
		getscreenelementdims id = <id>
		<descrip_height> = ((0.0, 1.0) * <height> + (0.0, 145.0))
	endif
	createscreenelement {
		type = spriteelement
		parent = goal_view_goal_anchor
		texture = menu_goal_underline
		pos = ((20.0, 0.0) + <descrip_height>)
		just = [center center]
		dims = (520.0, 8.0)
		rgba = [128 128 128 255]
		z_priority = (<z_priority> + 2)
	}
	if gotparam \{goal}
		gman_getgrade goal = <goal>
	endif
	<padding> = 8
	<text_height> = 0
	if gotparam \{return_params}
		<text_height> = (<text_height> + <return_params>.text_height + <padding>)
		removeparameter \{return_params}
	endif
	if gotparam \{return_params}
		<text_height> = (<text_height> + <return_params>.text_height + <padding>)
		removeparameter \{return_params}
	endif
endscript

script goal_generic_view_goal_pausemenu_kill 
	if screenelementexists \{id = goal_view_goal_anchor}
		destroyscreenelement \{id = goal_view_goal_anchor}
	endif
endscript

script goal_get_descrip_list 
	requireparams \{[
			goal
		]
		all}
	if NOT gotparam \{checkpoint}
		gman_getcurrentcheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if structurecontains structure = <checkpoint_ui> view_goals_descrip_list
			return true view_goals_descrip_list = (<checkpoint_ui>.view_goals_descrip_list)
		endif
	endif
	return \{false}
endscript

script get_goal_am_pro_sick_text 
	requireparams \{[
			goal
		]
		all}
	if NOT gotparam \{checkpoint}
		gman_getcurrentcheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if structurecontains structure = <checkpoint_ui> view_goals_text_am
			if structurecontains structure = <checkpoint_ui> view_goals_text_pro
				if structurecontains structure = <checkpoint_ui> view_goals_text_sick
					return {
						true
						view_goals_text_am = (<checkpoint_ui>.view_goals_text_am)
						view_goals_text_pro = (<checkpoint_ui>.view_goals_text_pro)
						view_goals_text_sick = (<checkpoint_ui>.view_goals_text_sick)
					}
				endif
			endif
		endif
	endif
	gman_getconstants goal = <goal>
	if gotparam \{view_goals_text_am}
		if gotparam \{view_goals_text_pro}
			if gotparam \{view_goals_text_sick}
				return {
					true
					view_goals_text_am = <view_goals_text_am>
					view_goals_text_pro = <view_goals_text_pro>
					view_goals_text_sick = <view_goals_text_sick>
				}
			endif
		endif
	endif
	return \{false}
endscript

script goal_generic_view_goal_focus 
	ui_kill_message_hack \{id = ui_alert_uber}
	startrendering
	wait \{1
		second}
	if screenelementexists \{id = goal_classic_mode_view_goals_vmenu}
		launchevent \{type = focus
			target = goal_classic_mode_view_goals_vmenu}
	endif
endscript
view_goal_info_exiting = 0

script goal_generic_exit_menu \{do_pause = 1}
	change \{view_goal_info_exiting = 1}
	if screenelementexists \{id = goal_view_goal_anchor}
		destroyscreenelement \{id = goal_view_goal_anchor}
	endif
	if screenelementexists \{id = goal_classic_mode_view_bg_anchor}
		destroyscreenelement \{id = goal_classic_mode_view_bg_anchor}
	endif
	if gotparam \{callback_script}
		<callback_script> <callback_params>
	endif
	begin
	if gman_goalisfinisheddeactivating goal = <goal>
		break
	endif
	wait \{2
		gameframes}
	repeat
	if (<do_pause> = 1)
		enable_pause
		show_all_hud_items
	endif
	change \{view_goal_info_exiting = 0}
endscript

script goal_generic_video_pad_handler 
	if screenelementexists \{id = goal_generic_video_wait_anchor}
		destroyscreenelement \{id = goal_generic_video_wait_anchor}
	endif
	wait \{1
		second}
	createscreenelement \{type = containerelement
		id = goal_generic_video_wait_anchor
		parent = root_window
		event_handlers = [
			{
				pad_choose
				goal_generic_video_kill_button
			}
			{
				pad_start
				goal_generic_video_kill_button
			}
		]}
	launchevent \{type = focus
		target = goal_generic_video_wait_anchor}
endscript

script goal_generic_video_kill_button 
	killmovie \{textureslot = 0}
	skater :input_debounce \{x
		time = 0.25}
	die
endscript

script goal_generic_exit_menu_and_restart 
	gman_setdata goal = <goal> params = {goal_no_end_messages_during_retry = 1}
	change \{dont_create_speech_boxes = 1}
	goal_generic_exit_menu <...>
	gman_setdata goal = <goal> params = {goal_no_end_messages_during_retry = 0}
	goal_retry_last_goal
endscript

script goal_generic_view_leaderboard 
	printf \{'--- goal_generic_view_leaderboard'}
	if NOT gotparam \{from_view_goals}
		unpauseskaters
		pauseskaters
	endif
	if gotparam \{finish_goal}
		back_to_game = back_to_game
		helper_text_to_game = helper_text_to_game
	endif
	change \{current_leaderboard_type = me}
	goal_get_leaderboard_columns goal = <goal>
	gman_getgoaltype goal = <goal>
	change current_leaderboard_goal_type = <goal_type>
	request_leaderboard leaderboard_id = <goal> <back_to_game> <helper_text_to_game> <...> columns = <leaderboard_columns> leaderboard_type = <goal_type> listtype = me do_pause = <do_pause>
endscript

script goal_failed_retry_options \{txt = qs(0xfe82a453)}
	requireparams \{[
			goal
		]
		all}
	if NOT issoundeventplaying \{goalfail_nomusicmessing}
		if NOT issoundeventplaying \{goalutils_sfx_failgoal}
			soundevent \{event = goalfail_nomusicmessing}
		endif
	endif
	gman_pauseallgoals
	skater :killskater \{no_node}
	skater :pausephysics
	skater :disableplayerinput
	disable_pause
	pausegame
	<retry_text> = qs(0xd2e7f2b2)
	gman_getgoaltype goal = <goal>
	if (<goal_type> = classic)
		if gman_getdata goal = <goal> name = ended_from_end_run
			if (<ended_from_end_run> = false)
				<retry_text> = qs(0xb35ee5df)
			endif
		endif
	endif
	create_dialog_box {
		title = qs(0x5c9b76c1)
		text = <txt>
		pos = (320.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 255]
		text_scale = 0.6
		buttons = [
			{font = text_a1 text = <retry_text> pad_choose_script = goal_failed_retry_current}
			{font = text_a1 text = qs(0x67d9c56d) pad_choose_script = goal_failed_quit pad_choose_params = {goal = <goal>}}
		]
	}
	ui_kill_message_hack \{id = ui_alert_uber}
	startrendering
endscript

script goal_failed_retry_current 
	dialog_box_exit
	skater :unpausephysics
	skater :enableplayerinput
	skater :killskater \{no_node}
	enable_pause
	gman_unpauseallgoals
	unpausegame
	goal_retry_current_goal
endscript

script goal_failed_retry_first 
	dialog_box_exit
	skater :unpausephysics
	skater :enableplayerinput
	skater :killskater \{no_node}
	enable_pause
	gman_unpauseallgoals
	gman_spawnedsafefailcheckpoint goal = <goal>
	unpausegame
	goal_retry_last_goal
endscript

script goal_failed_quit 
	dialog_box_exit
	skater :unpausephysics
	skater :enableplayerinput
	skater :killskater \{no_node}
	enable_pause
	gman_unpauseallgoals
	unpausegame
	gman_spawnedsafefailcheckpoint goal = <goal>
endscript

script goal_show_descrip_list \{parent = root_window
		animate = 0}
	printf \{'-- goal_show_descrip_list'}
	if NOT gotparam \{goal}
		if NOT gman_getactivatedgoalid
			softassert \{qs(0x32a2e0ba)}
			return
		endif
		<goal> = <activated_goal_id>
	endif
	if NOT gotparam \{checkpoint}
		gman_getcurrentcheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if NOT gotparam \{list}
		if NOT goal_get_descrip_list goal = <goal>
			softassert qs(0xb2dbe096) c = <checkpoint>
			return
		endif
		<list> = <view_goals_descrip_list>
	endif
	if screenelementexists \{id = view_goals_descrip_list_anchor}
		destroyscreenelement \{id = view_goals_descrip_list_anchor}
	endif
	createscreenelement {
		id = view_goals_descrip_list_anchor
		type = vmenu
		parent = <parent>
		pos = <pos>
		just = [left top]
		internal_just = [left top]
	}
	color_params = {}
	if gotparam \{arcade}
		color_params = {has_rgba = $goal_arcade_text_unfocus}
	endif
	begin
	if getnextarrayelement <list> index = <index>
		goal_show_list_item {
			<element>
			sub_goal_info = <sub_goal_info>
			goal = <goal>
			checkpoint = <checkpoint>
			<color_params>
		}
	else
		break
	endif
	repeat
	setscreenelementlock \{id = view_goals_descrip_list_anchor
		on}
	setscreenelementlock \{id = view_goals_descrip_list_anchor
		off}
	if (<animate> = 1)
		spawnscriptnow goal_animate_descrip_list params = {
			list = <list>
			element = <element>
			goal = <goal>
			checkpoint = <checkpoint>
		}
	endif
endscript

script goal_animate_descrip_list 
	printf \{'-- goal_animate_descrip_list'}
	wait \{0.5
		seconds
		ignoreslomo}
	begin
	if getnextarrayelement <list> index = <index>
		goal_cross_out_list_item <element> goal = <goal> checkpoint = <checkpoint> index = <index>
	else
		break
	endif
	repeat
endscript

script goal_show_list_item \{has_rgba = [
			128
			128
			128
			255
		]
		not_rgba = [
			200
			200
			200
			255
		]}
	printf \{'-- goal_show_list_item'}
	requireparams \{[
			goal
		]
		all}
	if gman_flagfunc func = is_set goal = <goal> checkpoint = <checkpoint> tool = <flag_tool> params = {flag = <flag>}
		createscreenelement {
			type = textelement
			parent = view_goals_descrip_list_anchor
			font = text_a1
			text = <text>
			rgba = <has_rgba>
			scale = (0.75, 0.65000004)
		}
	else
		createscreenelement {
			type = textelement
			parent = view_goals_descrip_list_anchor
			font = text_a1
			text = <text>
			rgba = <not_rgba>
			scale = (0.75, 0.65000004)
		}
	endif
	getscreenelementdims id = <id>
	if (<width> > 475)
		<scale> = ((475.0 / <width>) * (0.75, 0.65000004))
		legacydoscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
endscript

script goal_cross_out_list_item 
	printf \{'-- goal_cross_out_list_item'}
	requireparams \{[
			goal
		]
		all}
	if gman_flagfunc func = was_set_this_try goal = <goal> checkpoint = <checkpoint> tool = <flag_tool> params = {flag = <flag>}
		resolvescreenelementid id = {view_goals_descrip_list_anchor child = <index>}
		if gotparam \{resolved_id}
			getscreenelementdims id = <resolved_id>
			createscreenelement {
				type = spriteelement
				parent = <resolved_id>
				pos = (0.0, 18.0)
				rgba = ($goal_ui_scheme.main)
				scale = (0.0, 2.0)
				texture = white
				just = [left top]
			}
			<strike_id> = <id>
			<strike_id> :legacydomorph scale = (<width> * (0.34, 0.0) + (0.0, 2.0)) time = 0.25
			gman_getgoaltype goal = <goal>
			if checksumequals a = <goal_type> b = classic
				if gman_getdata goal = <goal> name = goal_classic_achieved_pro
					if (<goal_classic_achieved_pro> = 1)
						return
					endif
				endif
				gman_getgrade goal = <goal>
				if (<grade> >= 2)
					gman_setdata goal = <goal> params = {goal_classic_achieved_pro = 1}
				endif
				if NOT screenelementexists id = <resolved_id>
					return
				endif
				createscreenelement {
					type = textelement
					parent = <resolved_id>
					pos = ((1.5, 0.0) * <width> + (150.0, 25.0))
					scale = 0.2
					rgba = ($goal_ui_scheme.main)
					font = text_a1
					text = qs(0x7c7e405e)
					just = [center center]
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
				soundevent \{event = midgoal_rank_sfx}
				<reward_id> = <id>
				if screenelementexists id = <reward_id>
					<reward_id> :legacydomorph scale = 1.4 time = 0.25
				endif
				if screenelementexists id = <reward_id>
					<reward_id> :legacydomorph scale = 0.9 time = 0.1
				endif
				if screenelementexists id = <reward_id>
					runscriptonscreenelement id = <reward_id> goal_cross_out_list_item_fade_and_die
				endif
			endif
		endif
	endif
endscript

script goal_cross_out_list_item_fade_and_die 
	wait \{1
		second
		ignoreslomo}
	legacydomorph \{alpha = 0.0
		time = 0.5}
	die
endscript

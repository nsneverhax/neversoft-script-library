is_boss_song = 0
is_guitar_controller = 0

script create_fail_song_menu 
	menu_font = fontgrid_title_gh3
	fail_song_menu_fade_out_lose_anim_sounds
	restore_player_selected_character_info \{player_status = player1_status}
	restore_player_selected_character_info \{player_status = player2_status}
	if isxenon
		writesongdatatofile
	endif
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> boss
		change \{is_boss_song = 1}
	else
		change \{is_boss_song = 0}
	endif
	<menu_pos> = (640.0, 420.0)
	<song_name_pos> = (640.0, 347.0)
	<completion_text_pos> = (640.0, 402.0)
	completion = 0
	get_song_end_time song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
		if (<completion> > 99)
			completion = 99
		endif
	endif
	casttointeger \{completion}
	if (($game_mode = p1_career))
		if ($is_boss_song = 1)
			<menu_pos> = (640.0, 420.0)
		else
			<menu_pos> = (640.0, 401.0)
			<song_name_pos> = (640.0, 338.0)
			<completion_text_pos> = (640.0, 390.0)
		endif
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		min = ($difficulty_list_props.($current_difficulty).index)
		mathmin a = <min> b = ($difficulty_list_props.($current_difficulty2).index)
		casttointeger \{min}
		difficulty_index = <min>
		get_difficulty_text_upper difficulty = ($difficulty_list [<difficulty_index>])
	else
		get_difficulty_text_upper difficulty = ($current_difficulty)
	endif
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	formattext textname = completion_text "%d" d = <completion>
	song_failed_off = (640.0, 217.0)
	z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = fail_song_scrolling_menu vmenuid = fail_song_vmenu_id use_backdrop = 0 spacing = -58 menu_pos = <menu_pos>
	create_pause_menu_frame z = (<z> - 10)
	setscreenelementprops \{id = fail_song_vmenu_id
		internal_just = [
			center
			center
		]}
	createscreenelement \{type = containerelement
		parent = root_window
		id = fail_song_static_text_container
		internal_just = [
			center
			center
		]
		pos = (0.0, 0.0)
		z_priority = 2}
	displaysprite parent = fail_song_static_text_container tex = dialog_title_bg flip_v pos = (416.0, 100.0) dims = (224.0, 224.0) z = <z>
	displaysprite parent = fail_song_static_text_container tex = dialog_title_bg pos = (640.0, 100.0) dims = (224.0, 224.0) z = <z>
	if ($is_boss_song = 1)
		title = "BATTLE LOST"
	else
		title = "SONG FAILED"
	endif
	createscreenelement {
		type = textelement
		parent = fail_song_static_text_container
		font = <menu_font>
		text = <title>
		just = [center center]
		pos = {<song_failed_off> relative}
		rgba = [223 223 223 255]
		scale = (1.2, 1.2)
		z_priority = (<z> + 0.1)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((285.0, 0.0) + (<height> * (0.0, 1.0))) keep_ar = 1 only_if_larger_x = 1 start_x_scale = 1.2 start_y_scale = 1.2
	if ($current_song = bossjoe)
		final_blow_powerup = -1
		<final_blow_powerup> = ($player2_status.final_blow_powerup)
		printf channel = trchen "FINAL BLOW %s" s = <final_blow_powerup>
		if (<final_blow_powerup> > -1)
			<completion_text_pos> = (420.0, 345.0)
			<completion_text_just> = [left center]
			<completion_fit_dims> = (400.0, 400.0)
			createscreenelement {
				type = hmenu
				parent = fail_song_static_text_container
				id = final_blow_stacker
				just = [right center]
				pos = (840.0, 400.0)
				internal_just = [right center]
				scale = <completion_text_scale>
			}
			<finalblow_scale> = 0.7
			createscreenelement {
				type = textelement
				font = <menu_font>
				parent = final_blow_stacker
				just = [center center]
				rgba = [210 130 0 255]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = (<z> + 0.1)
				scale = <finalblow_scale>
				text = "FINAL BLOW:"
				rgba = [223 223 223 255]
			}
			fit_text_in_rectangle {
				id = <id>
				dims = (320.0, 400.0)
				keep_ar = 1
				only_if_larger_x = 1
				start_x_scale = <finalblow_scale>
				start_y_scale = <finalblow_scale>
			}
			createscreenelement \{type = containerelement
				parent = final_blow_stacker
				dims = (64.0, 64.0)}
			final_blow_attack_icon = ($battlemode_powerups [<final_blow_powerup>].card_texture)
			createscreenelement {
				type = spriteelement
				parent = <id>
				texture = <final_blow_attack_icon>
				rgba = [255 255 255 255]
				just = [left top]
				pos = (10.0, -5.0)
				dims = (64.0, 64.0)
				z_priority = (<z> + 0.1)
			}
		else
			<completion_text_pos> = (640.0, 368.0)
			<completion_text_just> = [center center]
			<completion_fit_dims> = (425.0, 400.0)
		endif
		createscreenelement {
			type = hmenu
			parent = fail_song_static_text_container
			id = fail_completion_stacker
			just = <completion_text_just>
			pos = <completion_text_pos>
			internal_just = [center center]
			scale = <completion_text_scale>
		}
		<completion_text_params> = {
			type = textelement
			font = <menu_font>
			parent = fail_completion_stacker
			just = [center center]
			rgba = (($g_menu_colors).pink)
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 0.1)
		}
		lost_text = "JOE PERRY "
		createscreenelement <completion_text_params> scale = 2 text = <lost_text> rgba = [223 223 223 255]
		createscreenelement <completion_text_params> scale = 2 text = "WINS" rgba = [223 223 223 255]
		createscreenelement <completion_text_params> scale = 1 text = " "
		createscreenelement <completion_text_params> scale = 1 text = "ON"
		createscreenelement <completion_text_params> scale = 1 text = " "
		createscreenelement <completion_text_params> scale = 1 text = <difficulty_text>
		setscreenelementlock \{id = fail_completion_stacker
			on}
		fit_text_in_rectangle {
			id = fail_completion_stacker
			dims = <completion_fit_dims>
			keep_ar = 1
			only_if_larger_x = 1
			start_x_scale = <completion_text_scale>
			start_y_scale = <completion_text_scale>
		}
	else
		<song_title_scale> = 1.65
		fill_song_title_and_completion_details <...> parent = fail_song_static_text_container
	endif
	set_focus_color \{color = pink}
	set_unfocus_color \{color = dk_violet_grey}
	text_scale = (0.9, 0.95)
	if NOT english
		text_scale = (0.9, 0.85)
	endif
	displaysprite id = hi_right parent = fail_song_static_text_container tex = dialog_highlight pos = (770.0, 533.0) just [left top] scale = (1.0, 1.0) z = (<z> + 0.3) rgba = (($g_menu_colors).pink)
	displaysprite id = hi_left parent = fail_song_static_text_container tex = dialog_highlight flip_v just = [right top] pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 0.3) rgba = (($g_menu_colors).pink)
	if NOT gotparam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
	createscreenelement {
		type = containerelement
		parent = fail_song_vmenu_id
		event_handlers = [
			{focus retry_highlight_focus params = {id = song_failed_retry}}
			{unfocus retail_menu_unfocus params = {id = song_failed_retry}}
			{pad_choose fail_song_menu_select_retry_song}
		]
		dims = (100.0, 100.0)
		z_priority = (<z> + 0.1)
	}
	createscreenelement {
		type = textelement
		parent = <id>
		id = song_failed_retry
		font = <menu_font>
		text = "RETRY SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
		scale = <text_scale>
	}
	getscreenelementdims id = <id>
	if (<width> > 220)
		fit_text_in_rectangle id = <id> dims = ((220.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
	endif
	change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		change \{is_guitar_controller = 1}
	endif
	if (($game_mode = p1_career && $is_boss_song = 0))
		createscreenelement {
			type = containerelement
			parent = fail_song_vmenu_id
			event_handlers = [
				{focus practice_highlight_focus params = {id = song_failed_practice}}
				{unfocus retail_menu_unfocus params = {id = song_failed_practice}}
				{pad_choose fail_song_menu_select_practice}
			]
			dims = (100.0, 100.0)
			z_priority = (<z> + 0.1)
			<demo_mode_disable>
		}
		createscreenelement {
			type = textelement
			parent = <id>
			id = song_failed_practice
			font = <menu_font>
			text = "PRACTICE"
			rgba = ($menu_unfocus_color)
			scale = <text_scale>
			just = [center top]
			<demo_mode_disable>
		}
		setscreenelementprops {
			id = <id>
			exclusive_device = <exclusive_device>
			scale = <text_scale>
		}
		getscreenelementdims id = <id>
		if (<width> > 220)
			fit_text_in_rectangle id = <id> dims = ((220.0, 0.0) + <height> * (0.0, 1.0))
		endif
		displaysprite parent = fail_song_static_text_container tex = dialog_bg pos = (460.0, 412.0) dims = (360.0, 122.0) z = <z>
		displaysprite parent = fail_song_static_text_container tex = dialog_bg flip_h pos = (460.0, 534.0) dims = (360.0, 122.0) z = <z>
	elseif ($is_boss_song = 1 && $is_guitar_controller = 1)
		createscreenelement {
			type = containerelement
			parent = fail_song_vmenu_id
			event_handlers = [
				{focus practice_highlight_focus params = {id = song_failed_tutorial}}
				{unfocus retail_menu_unfocus params = {id = song_failed_tutorial}}
				{pad_choose fail_song_menu_select_tutorial}
			]
			dims = (100.0, 100.0)
			z_priority = (<z> + 0.1)
		}
		createscreenelement {
			type = textelement
			parent = <id>
			id = song_failed_tutorial
			font = <menu_font>
			text = "TUTORIAL"
			rgba = ($menu_unfocus_color)
			scale = <text_scale>
			just = [center top]
		}
		setscreenelementprops {
			id = <id>
			exclusive_device = <exclusive_device>
			scale = <text_scale>
		}
		getscreenelementdims id = <id>
		if (<width> > 220)
			fit_text_in_rectangle id = <id> dims = ((220.0, 0.0) + <height> * (0.0, 1.0))
		endif
		displaysprite parent = fail_song_static_text_container tex = dialog_bg pos = (460.0, 427.0) dims = (360.0, 122.0) z = <z>
		displaysprite parent = fail_song_static_text_container tex = dialog_bg flip_h pos = (460.0, 549.0) dims = (360.0, 122.0) z = <z>
	else
		displaysprite parent = fail_song_static_text_container tex = dialog_bg pos = (460.0, 430.0) dims = (360.0, 100.0) z = <z>
		displaysprite parent = fail_song_static_text_container tex = dialog_bg flip_h pos = (460.0, 530.0) dims = (360.0, 100.0) z = <z>
	endif
	createscreenelement {
		type = containerelement
		parent = fail_song_vmenu_id
		event_handlers = [
			{focus newsong_highlight_focus params = {id = song_failed_new_song}}
			{unfocus retail_menu_unfocus params = {id = song_failed_new_song}}
			{pad_choose fail_song_menu_select_new_song}
		]
		dims = (100.0, 100.0)
		z_priority = (<z> + 0.1)
	}
	createscreenelement {
		type = textelement
		parent = <id>
		id = song_failed_new_song
		font = <menu_font>
		text = "NEW SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
		scale = <text_scale>
	}
	getscreenelementdims id = <id>
	if (<width> > 220)
		fit_text_in_rectangle id = <id> dims = ((220.0, 0.0) + <height> * (0.0, 1.0))
	endif
	createscreenelement {
		type = containerelement
		parent = fail_song_vmenu_id
		event_handlers = [
			{focus quit_highlight_focus params = {id = song_failed_new_quit}}
			{unfocus retail_menu_unfocus params = {id = song_failed_new_quit}}
			{pad_choose fail_song_menu_select_quit}
		]
		dims = (100.0, 100.0)
		z_priority = (<z> + 0.1)
	}
	createscreenelement {
		type = textelement
		parent = <id>
		id = song_failed_new_quit
		font = <menu_font>
		text = "QUIT"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [center top]
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
		scale = <text_scale>
	}
	getscreenelementdims id = <id>
	if (<width> > 220)
		fit_text_in_rectangle id = <id> dims = ((220.0, 0.0) + <height> * (0.0, 1.0))
	endif
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 10000}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 10000}
	pausegame
	kill_start_key_binding
endscript

script fail_song_menu_fade_out_lose_anim_sounds 
	setsoundparams \{gh3_guit_axel_a_loss1
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guit_axel_a_loss2
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_drummer_lose_01
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_drummer_lose_02
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guit_izzy_a_loss1
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guit_john_a_loss1
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guit_john_a_loss2
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guitarist_judy_a_loss_armsup
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guitarist_judy_a_loss_stomp
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guit_lars_a_win2
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_singer_male_nslose4
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_guit_xavi_a_loss4
		vol = 0
		time = 1.0}
	setsoundparams \{gh3_singer_steven_lose01
		vol = 0
		time = 1.0}
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		ui_flow_manager_respond_to_action \{action = select_tutorial}
	endif
endscript

script destroy_fail_song_menu 
	clean_up_user_control_helpers
	restore_start_key_binding
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = fail_song_static_text_container}
endscript

script fail_song_menu_select_practice 
	gh3_sfx_fail_song_stop_sounds
	ui_flow_manager_respond_to_action \{action = select_practice}
endscript

script fail_song_menu_select_retry_song 
	gh3_sfx_fail_song_stop_sounds
	unpausegame
	ui_flow_manager_respond_to_action \{action = select_retry}
	restart_song
endscript

script fail_song_menu_select_new_song 
	gh3_sfx_fail_song_stop_sounds
	if ($coop_dlc_active = 1)
		change \{game_mode = p2_faceoff}
	endif
	ui_flow_manager_respond_to_action \{action = select_new_song}
endscript

script fail_song_menu_select_quit 
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript

script retry_highlight_focus 
	retail_menu_focus id = <id>
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			getscreenelementdims id = <id>
			setscreenelementprops id = hi_left pos = ((635.0, 475.0) - <width> * (0.5, 0.0)) flip_v
			setscreenelementprops id = hi_right pos = ((645.0, 475.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setscreenelementprops id = hi_left pos = ((635.0, 471.0) - <width> * (0.5, 0.0)) flip_v
						setscreenelementprops id = hi_right pos = ((645.0, 471.0) + <width> * (0.5, 0.0))
					endif
				else
					setscreenelementprops id = hi_left pos = ((635.0, 455.0) - <width> * (0.5, 0.0)) flip_v
					setscreenelementprops id = hi_right pos = ((645.0, 455.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script practice_highlight_focus 
	retail_menu_focus id = <id>
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			getscreenelementdims id = <id>
			setscreenelementprops id = hi_left pos = ((635.0, 495.0) - <width> * (0.5, 0.0)) flip_v
			setscreenelementprops id = hi_right pos = ((645.0, 495.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setscreenelementprops id = hi_left pos = ((635.0, 515.0) - <width> * (0.5, 0.0)) flip_v
						setscreenelementprops id = hi_right pos = ((645.0, 515.0) + <width> * (0.5, 0.0))
					endif
				else
					setscreenelementprops id = hi_left pos = ((635.0, 495.0) - <width> * (0.5, 0.0)) flip_v
					setscreenelementprops id = hi_right pos = ((645.0, 495.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script newsong_highlight_focus 
	retail_menu_focus id = <id>
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			getscreenelementdims id = <id>
			setscreenelementprops id = hi_left pos = ((635.0, 515.0) - <width> * (0.5, 0.0)) flip_v
			setscreenelementprops id = hi_right pos = ((645.0, 515.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setscreenelementprops id = hi_left pos = ((635.0, 555.0) - <width> * (0.5, 0.0)) flip_v
						setscreenelementprops id = hi_right pos = ((645.0, 555.0) + <width> * (0.5, 0.0))
					endif
				else
					setscreenelementprops id = hi_left pos = ((635.0, 535.0) - <width> * (0.5, 0.0)) flip_v
					setscreenelementprops id = hi_right pos = ((645.0, 535.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script quit_highlight_focus 
	retail_menu_focus id = <id>
	if screenelementexists \{id = hi_left}
		if screenelementexists \{id = hi_right}
			getscreenelementdims id = <id>
			setscreenelementprops id = hi_left pos = ((635.0, 555.0) - <width> * (0.5, 0.0)) flip_v
			setscreenelementprops id = hi_right pos = ((645.0, 555.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setscreenelementprops id = hi_left pos = ((635.0, 596.0) - <width> * (0.5, 0.0)) flip_v
						setscreenelementprops id = hi_right pos = ((645.0, 596.0) + <width> * (0.5, 0.0))
					endif
				else
					setscreenelementprops id = hi_left pos = ((635.0, 575.0) - <width> * (0.5, 0.0)) flip_v
					setscreenelementprops id = hi_right pos = ((645.0, 575.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script fill_song_title_and_completion_details 
	requireparams \{[
			parent
			uppercasestring
		]
		all}
	createscreenelement {
		type = textelement
		parent = <parent>
		id = fail_song_song_name
		font = <menu_font>
		just = [center center]
		text = <uppercasestring>
		pos = <song_name_pos>
		rgba = [223 223 223 255]
		scale = <song_title_scale>
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 0.1)
	}
	fit_text_in_rectangle {
		id = fail_song_song_name
		dims = (430.0, 65.0)
		keep_ar = 1
		only_if_larger_x = 1
		start_x_scale = <song_title_scale>
		start_y_scale = <song_title_scale>
	}
	<completion_text_scale> = 0.5
	createscreenelement {
		type = hmenu
		parent = <parent>
		id = fail_completion_stacker
		just = [center center]
		pos = <completion_text_pos>
		internal_just = [center center]
		scale = <completion_text_scale>
	}
	<completion_text_params> = {
		type = textelement
		font = <menu_font>
		parent = fail_completion_stacker
		just = [center center]
		rgba = (($g_menu_colors).light_brown)
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 0.1)
	}
	createscreenelement <completion_text_params> scale = 1 text = "COMPLETED"
	createscreenelement <completion_text_params> scale = 1 text = " "
	createscreenelement <completion_text_params> scale = 2 text = <completion_text>
	createscreenelement <completion_text_params> scale = 1 text = "% "
	createscreenelement <completion_text_params> scale = 1 text = "ON"
	createscreenelement <completion_text_params> scale = 1 text = " "
	createscreenelement <completion_text_params> scale = 2 text = <difficulty_text>
	setscreenelementlock \{id = fail_completion_stacker
		on}
	fit_text_in_rectangle {
		id = fail_completion_stacker
		dims = (405.0, 400.0)
		keep_ar = 1
		only_if_larger_x = 1
		start_x_scale = <completion_text_scale>
		start_y_scale = <completion_text_scale>
	}
endscript

skater_select_light0_heading = 60
skater_select_light1_heading = -190
skateshop_idle_anim = sk8_cas_career_stand
skater_rot_angle = 0
is_in_skater_select_menu = 0
main_menu_return_to_createamodes = 0

script wait_and_pause_skater \{time = 10}
	begin
	if objectexists \{id = skater}
		wait <time> gameframes
		if NOT gotparam \{dont_pause_music}
			pausemusic \{1}
		endif
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script SkateshopAI 
	SkaterInit NoEndRun ReturnControl noanims
	pausephysics
	cleareventhandlergroup `default`
	setqueuetricks NoTricks
	disableplayerinput
	SetRollingFriction 10000
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
	skater :unhide
	if gotparam BlendOk
	else
		BlendperiodOut 0
	endif
	if gotparam credits
		<name> = neversoft
	endif
	printf "------------- THIS SKATER IS: %n" n = <name>
	skater_playanim anim = ($skateshop_idle_anim)
	skater :SwitchOffBoard
endscript

script play_no_skater_cam 
	killskatercamanim \{all}
	setactivecamera \{id = skatercam0}
	playigccam \{skater = 0
		lockto = world
		pos = (0.0, 0.0, 0.0)
		quat = (0.000138, 0.999862, 0.011831999)
		fov = 72.0
		play_hold}
endscript
current_attract_movie = 0
movies_disabled = 0
in_options_menu = 0

script story_options_change_level 
	dialog_box_exit
	restore_start_key_binding
	if NOT gotparam \{continue_story}
		setglobalflag \{flag = $career_started}
	endif
	stopkeyboardhandler
	Zone_LoadLastPlayed
endscript

script launch_ss_menu 
	printf \{"--- launch_ss_menu"}
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_ss_menu <...>
endscript

script create_ss_menu 
	printf "--- create_ss_menu"
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if gotparam change_gamemode
		<change_gamemode>
	endif
	GetCurrentSkaterProfileIndex
	GetGameMode
	switch <gamemode>
		case freeskate
		if insplitscreengame
			if (<currentskaterprofileindex> = 1)
				<menu_title> = "PLAYER TWO"
				second_player = second_player
			else
				<menu_title> = "PLAYER ONE"
			endif
		else
			<menu_title> = "SKATER SELECT"
		endif
		default
		scriptassert 'Eh? TH9 only supports splitscreen freeskate for this UI menu'
		<menu_title> = "SKATER SELECT"
	endswitch
	make_cas_menu {
		menu_id = select_skater_ready_anchor
		title = <menu_title>
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = ss_menu_exit new_menu_script = launch_select_skater_menu <second_player> reset_skater = 0}
		pausemenu
	}
	kill_start_key_binding
	stars
	stars
	stars
	stars
	GetCurrentSkaterProfileIndex
	if insplitscreengame
		if (<currentskaterprofileindex> = 1)
			printf "1"
			add_cas_menu_item {
				text = "READY"
				pad_choose_script = ss_menu_exit
				pad_choose_params = {new_menu_script = launch_level_select_menu player_two}
				focus_params = {attract_timer}
				mark_first_input
				id = ss_play_level
			}
		else
			printf "2"
			add_cas_menu_item {
				text = "READY"
				pad_choose_script = ss_menu_exit
				pad_choose_params = {new_menu_script = player_1_ready}
				focus_params = {attract_timer}
				mark_first_input
				id = ss_play_level
			}
		endif
	else
		if gamemodeequals is_net
			if isxenon
				printf "3"
				add_cas_menu_item {
					text = "READY"
					pad_choose_script = ss_menu_exit
					pad_choose_params = {new_menu_script = launch_xbox_live play_cam}
					focus_params = {attract_timer}
					mark_first_input
					id = ss_play_level
				}
			else
				if (network_connection_type = internet)
					printf "4"
					add_cas_menu_item {
						text = "READY"
						pad_choose_script = ss_menu_exit
						pad_choose_params = {new_menu_script = select_internet_play}
						focus_params = {attract_timer}
						mark_first_input
						id = ss_play_level
					}
				else
					printf "5"
					add_cas_menu_item {
						text = "READY"
						pad_choose_script = ss_menu_exit
						pad_choose_params = {new_menu_script = select_lan_play}
						focus_params = {attract_timer}
						mark_first_input
						id = ss_play_level
					}
				endif
			endif
		else
			removeparameter callback
			printf "6"
			add_cas_menu_item {
				text = "PLAY LEVEL"
				pad_choose_script = ss_menu_exit
				pad_choose_params = {new_menu_script = launch_level_select_menu <...>}
				focus_params = {attract_timer}
				mark_first_input
				id = ss_play_level
			}
		endif
	endif
	if insplitscreengame
		add_cas_menu_item {
			text = "TRICK CONTROLS"
			pad_choose_script = ss_menu_exit
			pad_choose_params = {new_menu_script = ui_change_state state = UIstate_remaptricks}
		}
	else
		add_cas_menu_item {
			text = "TRICK CONTROLS"
			pad_choose_script = ss_menu_exit
			pad_choose_params = {new_menu_script = create_edit_tricks_menu from_ss_menu}
			focus_params = {attract_timer}
			mark_first_input
		}
	endif
	if gamemodeequals is_classic
		if (<currentskaterprofileindex> = 0)
			GetInitialsString
			formattext textname = initials_string "UPDATE INITIALS: %i" i = <string>
			add_cas_menu_item {
				text = <initials_string>
				pad_choose_script = ss_menu_exit
				pad_choose_params = {new_menu_script = high_scores_menu_enter_initials from_ss_menu = 1}
				focus_params = {attract_timer}
				mark_first_input
			}
		endif
	endif
	cas_menu_finish
endscript
network_connection_type = internet

script toggle_net_connection_type 
	GetCurrentSkaterProfileIndex
	GetGameMode
	switch network_connection_type
		case lan
		setnetworkmode internet_mode
		change network_connection_type = internet
		setscreenelementprops id = menu_connection text = "internet"
		case internet
		setnetworkmode lan_mode
		change network_connection_type = lan
		setscreenelementprops id = menu_connection text = "lan"
	endswitch
	if insplitscreengame
		if (<currentskaterprofileindex> = 1)
			setscreenelementprops {
				id = ss_play_level
				event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = launch_level_select_menu player_two}}]
				replace_handlers
			}
		else
			setscreenelementprops {
				id = ss_play_level
				event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = player_1_ready}}]
				replace_handlers
			}
		endif
	else
		if gamemodeequals is_net
			if (network_connection_type = internet)
				setscreenelementprops {
					id = ss_play_level
					event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = show_disclaimer}}]
					replace_handlers
				}
			else
				setscreenelementprops {
					id = ss_play_level
					event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = launch_network_select_lan_games_menu}}]
					replace_handlers
				}
			endif
		else
			setscreenelementprops {
				id = ss_play_level
				event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = launch_level_select_menu <...>}}]
				replace_handlers
			}
		endif
	endif
endscript

script player_1_ready 
	load_second_skater_profile
	GetSingleSkaterProfileInfo \{player = 1
		name}
	launch_select_skater_menu second_player current_skater = <name>
endscript

script ss_menu_exit 
	printf \{"--- ss_menu_exit"}
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	if gotparam \{hide_bg}
		play_no_skater_cam
	endif
	if gotparam \{new_menu_script}
		<new_menu_script> <...> animate_in = 1
	endif
	if (isxenon)
		if gamemodeequals \{is_net}
			if (<new_menu_script> = launch_select_skater_menu)
				setnetworkmode
			endif
		endif
	endif
endscript

script frame_skater_select 
	wait \{1
		frame}
	resetskaters \{node = Z_Mainmenu_TRG_ped_girl}
	killskatercamanim \{all}
	playigccam \{lockto = world
		pos = (-14.0732975, -5.5748167, -30.174664)
		quat = (0.003771, 0.9826829, -0.018605)
		fov = 74.0
		play_hold}
	skater :pause
endscript

script ss_setup_skater 
	printf 'ss_setup_skater'
	wait 1 frame
	resetskaters node = Z_Mainmenu_TRG_ped_girl
	killskatercamanim all
	if infrontend
		setshadowrenderingflags enable = 'false' object = 'skin'
		setshadowrenderingflags enable = 'false' object = 'nonskin'
		setshadowrenderingflags enable = 'false' object = 'env'
	endif
	playigccam {
		lockto = world
		pos = (-14.0732975, -5.5748167, -30.174664)
		quat = (0.003771, 0.9826829, -0.018605)
		fov = 74.0
		play_hold
	}
	MakeSkaterGoto ss_ai
	skater :disableplayerinput
	skater :pausephysics
endscript

script launch_select_skater_menu 
	printf \{"--- launch_select_skater_menu"}
	pulse_blur \{speed = 2
		start = 255}
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	SetMenuPadMappings \{[
			active
			use_as_first
		]}
	goalmanager_hidepoints
	create_select_skater_menu <...>
endscript

script select_skater_allow_load 
	printf \{"--- select_skater_allow_load"}
	printstruct <...>
	<allow_load> = true
	if isxenon
		printf \{"    isXenon"}
		if NOT checkforsignin local controller_index = <device_num>
			<allow_load> = false
			printf \{"    not signed in"}
		endif
	endif
	return <allow_load>
endscript

script ss_rotate_skater_left 
	if insplitscreengame
		GetCurrentSkaterProfileIndex
		<skater> = <currentskaterprofileindex>
	else
		<skater> = 0
	endif
	killspawnedscript \{name = ss_rotate_skater}
	spawnscriptlater \{ss_rotate_skater
		params = {
			angle = -3
			button = l1
		}}
endscript

script ss_rotate_skater_right 
	if insplitscreengame
		GetCurrentSkaterProfileIndex
		<skater> = <currentskaterprofileindex>
	else
		<skater> = 0
	endif
	killspawnedscript \{name = ss_rotate_skater}
	spawnscriptlater \{ss_rotate_skater
		params = {
			angle = 3
			button = r1
		}}
endscript

script ss_rotate_skater 
	begin
	if controllerpressed <button>
		skater :rotate y = <angle>
	else
		break
	endif
	wait \{1
		frame}
	repeat
endscript

script create_select_skater_helper_elements 
	if screenelementexists \{id = select_skater_anchor}
		<parent> = select_skater_anchor
	endif
	if screenelementexists \{id = current_menu_anchor}
		<parent> = current_menu_anchor
	endif
	if NOT gotparam \{parent}
		return
	endif
	create_helper_text {
		helper_text_elements = [
			{text = "\\m0 ACCEPT"}
			{text = "\\m1 BACK"}
		]
		parent = <parent>
	}
endscript

script create_select_skater_menu reset_skater = 1 cam_anim = selectSkater
	printf "--- create_select_skater_menu"
	printstruct <...>
	pushassetcontext context = z_mainmenu
	change is_in_skater_select_menu = 1
	igc_temporarily_disable_rendering 3 gameframes
	skater :add_skater_to_world
	spawnscript ss_setup_skater
	ResetComboRecords
	if gotparam change_gamemode
		<change_gamemode>
	endif
	the_title = "SKATER SELECTION"
	if insplitscreengame
		if NOT gotparam second_player
			the_title = "PLAYER ONE"
		else
			the_title = "PLAYER TWO"
		endif
	endif
	make_cas_menu {
		title = <the_title>
		menu_id = select_skater_anchor
		vmenu_id = select_skater_hmenu
		scrolling
		pausemenu
	}
	if insplitscreengame
		if NOT gotparam second_player
			current_menu_anchor :settags choosing_player1 = 1
		else
			current_menu_anchor :settags choosing_player1 = 0
		endif
	endif
	create_select_skater_vmenu
	if objectexists id = stats_block_anchor_parent
		destroyscreenelement id = stats_block_anchor_parent
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = stats_block_anchor_parent
		pos = (300.0, 190.0)
		just = [left top]
		scale = 1.0
	}
	cas_get_current_skater_name
	if ss_find_tag_index name = <current_skater>
		focus_index = <tag_index>
	endif
	cas_menu_finish no_helper_text index = <focus_index>
	popassetcontext
endscript

script ss_ai 
	blend_in_below_body_ik \{strength = 1
		blendduration = 0}
	skater :SwitchOffBoard
	ragdoll_markforreset
	skater_playanim blendperiod = 0.0 anim = ($skateshop_idle_anim) cycle
endscript

script reset_model_lights 
endscript

script create_ss_menu_bg scale = (32.0, 45.0) pos = (0.0, 0.0) color_scheme = $ss_color_scheme z_priority = -1 parent = current_menu_anchor alpha = 1 flourish_rot = 30 flourish_pos = (150.0, 50.0) flourish_scale = 1
	printf "--- create_ss_menu_bg"
	printf <color_scheme>
	main_z = <z_priority>
	createscreenelement {
		z_priority = <main_z>
		parent = <parent>
		type = spriteelement
		local_id = menu_bg_main
		texture = white2
		scale = <scale>
		rgba = (<color_scheme>.bg_color2)
		pos = <pos>
		just = [left top]
		alpha = <alpha>
	}
	getscreenelementprops id = <id>
	getscreenelementdims id = <id>
	bg_width = <width>
	bg_height = <height>
	bg_pos = <pos>
	createscreenelement {
		parent = <parent>
		type = spriteelement
		local_id = menu_bg_right
		texture = menu_generic_oversheet_l
		scale = 1
		flip_v
		flip_h
		rgba = (<color_scheme>.bg_color2)
		pos = (<bg_pos> + (<bg_width> * (1.0, 0.0)))
		z_priority = <main_z>
		alpha = <alpha>
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	doscreenelementmorph {
		id = <id>
		scale = ((1.0, 0.0) + (<bg_height> / (<height> * 1.0) + 0.1) * (0.0, 1.0))
		time = 0
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	doscreenelementmorph {
		id = <id>
		pos = (<pos> + <height> * (0.0, 0.5) + (<width> - 1) * (0.5, 0.0))
		time = 0
	}
	createscreenelement {
		parent = <parent>
		type = spriteelement
		local_id = menu_bg_left
		texture = menu_generic_oversheet_l
		scale = 1
		rgba = (<color_scheme>.bg_color2)
		pos = (0.0, 0.0)
		z_priority = <main_z>
		alpha = <alpha>
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	doscreenelementmorph {
		id = <id>
		scale = ((1.0, 0.0) + (<bg_height> / (<height> * 1.0) + 0.1) * (0.0, 1.0))
		time = 0
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	doscreenelementmorph {
		id = <id>
		pos = (<bg_pos> + <height> * (0.0, 0.5) - (<width> - 2) * (0.5, 0.0))
		time = 0
	}
	look = ((1.0, 0.0) + (<bg_height> / (<height> * 1.0)) * (0.0, 1.0))
	createscreenelement {
		parent = <parent>
		type = spriteelement
		local_id = menu_BG_bottom
		texture = menu_generic_oversheet_b
		scale = 1
		rgba = (<color_scheme>.bg_color2)
		pos = (<bg_pos> + (<bg_height> * (0.0, 1.0)))
		z_priority = <main_z>
		alpha = <alpha>
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	doscreenelementmorph {
		id = <id>
		scale = ((0.0, 1.0) + (<bg_width> / (<width> * 1.0)) * (1.0, 0.0))
		time = 0
	}
	getscreenelementdims id = <id>
	getscreenelementprops id = <id>
	doscreenelementmorph {
		id = <id>
		pos = (<pos> + <height> * (0.0, 0.5) + (<width>) * (0.5, 0.0))
		time = 0
	}
	createscreenelement {
		parent = <parent>
		type = spriteelement
		local_id = menu_bg_flourish
		texture = flourish_bg
		scale = <flourish_scale>
		rgba = [90 80 70 70]
		pos = <flourish_pos>
		rot_angle = <flourish_rot>
		z_priority = (<main_z> -1)
	}
endscript

script create_select_skater_vmenu scale = (1.14, 1.0) text = ""
	printf "--- create_select_skater_hmenu"
	ForEachSkaterProfile do = select_skater_menu_add_hmenu_items
	<extra_skater_unlocked> = 0
	GetCurrentSkaterProfileIndex
	setscreenelementprops {
		id = select_skater_hmenu
		event_handlers = [
		]
		replace_handlers
	}
	create_helper_text {
		helper_text_elements = [
			{text = "\\m0 ACCEPT"}
			{text = "\\m1 BACK"}
			{text = "\\md RANDOM GUEST SKATER"}
			{text = "\\be/\\bf ROTATE"}
		]
	}
	setscreenelementprops {
		id = select_skater_hmenu
		event_handlers = [
			{pad_option ss_random_guest params = {}}
			{pad_option generic_menu_pad_choose_sound}
		]
	}
	setscreenelementprops {
		id = select_skater_hmenu
		event_handlers = [
			{pad_l1 ss_rotate_skater_left}
			{pad_r1 ss_rotate_skater_right}
		]
	}
	if (<currentskaterprofileindex> = 1)
		setscreenelementprops {
			id = select_skater_hmenu
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back select_skater_menu_back params = {callback = back_from_player_two_select}}
			]
		}
	else
		setscreenelementprops {
			id = select_skater_hmenu
			event_handlers = [{pad_back generic_menu_pad_back_sound}
				{pad_back select_skater_menu_back params = {callback = create_main_menu}}
			]
		}
		setscreenelementprops {
			id = select_skater_hmenu
			event_handlers = [{pad_back ss_restore_self_shadow}]
		}
		if (insplitscreengame)
			setscreenelementprops {
				id = select_skater_hmenu
				event_handlers = [{pad_back change_gamemode_career}]
			}
		endif
	endif
	setscreenelementprops {
		id = select_skater_hmenu
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {scrolling up}}
			{pad_down generic_menu_up_or_down_sound params = {scrolling down}}]
	}
endscript

script ss_back_to_live_lobby 
	menu_stack_create_latest
endscript

script ss_random_guest 
	GetSingleSkaterProfileInfo player = 0 name
	old_player0_name = <name>
	GetCurrentSkaterProfileIndex
	orig_index = <currentskaterprofileindex>
	get_custom_2p_skater_name
	setcurrentskaterprofile 0
	selectcurrentskater name = <name>
	cas_set_random_appearance
	if (<orig_index> = 0)
		display_name = "Guest Skater 1"
	else
		display_name = "Guest Skater 2"
		selectcurrentskater name = <old_player0_name>
		syncplayer2profile
	endif
	setcurrentskaterprofile <orig_index>
	selectcurrentskater name = custom_story
	selectcurrentskater name = <name>
	SetSkaterProfileInfoByName name = <name> params = {skater_loaded = 1 display_name = <display_name>}
	change cas_skater_invalid = 1
	if (<orig_index> = 1)
		back_params = {second_player second_player_random}
	endif
	cas_ensure_skater_loaded name = <name>
	launch_select_skater_menu <back_params>
endscript

script menu_horiz_blink_arrow 
	terminateobjectsscripts id = <arrow_id>
	runscriptonscreenelement id = <arrow_id> menu_blink_arrow
endscript

script back_from_player_two_select 
	printf \{'back_from_player_two_select'}
	setcurrentskaterprofile \{0}
	igc_temporarily_disable_rendering \{5
		gameframes}
	change \{cas_skater_invalid = 1}
	change \{ss_second_player_first_time = 0}
	cas_get_current_skater_name
	cas_ensure_skater_loaded name = <current_skater>
	skater :obj_setoutlineflag \{off}
	launch_select_skater_menu \{from2p}
endscript

script check_player_one_picked 
	their_name = <name>
	if GetSingleSkaterProfileInfo \{player = 0
			name}
		if (<name> = <their_name>)
			return \{true}
		endif
	endif
	return \{false}
endscript

script select_skater_menu_add_hmenu_items 
	rgba = [80 80 80 98]
	if gotparam not_in_frontend
		return
	endif
	if gotparam sub_menu
		return
	endif
	if gotparam skater_loaded
		if (<skater_loaded> = 0)
			return
		endif
	endif
	GetCurrentSkaterProfileIndex
	if (<currentskaterprofileindex> = 0)
		if (<name> = custom_2p_2)
			return
		endif
	elseif (<currentskaterprofileindex> = 1)
		if (<name> = custom_2p_1)
			return
		endif
		if check_player_one_picked name = <name>
			return
		endif
	endif
	if gotparam is_secret
		current_menu_anchor :getsingletag did_secret_skater_heading
		if NOT gotparam did_secret_skater_heading
			add_cas_menu_item {
				cas_heading
				text = "SECRET SKATERS"
			}
			current_menu_anchor :settags did_secret_skater_heading
		endif
	endif
	disp_name = <display_name>
	pad_choose_script = select_skater_hmenu_choose
	additional_focus_script = ss_additional_skater_focus
	additional_unfocus_script = ss_additional_skater_unfocus
	additional_focus_params = {sel_scale = (0.42000002, 0.6) rot = 15 tweak_pos = (0.0, -10.0) name = <name>}
	additional_unfocus_params = {}
	icon = <select_icon>
	if NOT getglobalflag flag = $CHEAT_UNLOCK_ALL_SKATERS
		if gotparam lock_flag
			if NOT getglobalflag flag = <lock_flag>
				disp_name = "?????"
				pad_choose_script = nullscript
				additional_focus_params = {more_item}
				additional_unfocus_params = {more_item}
				icon = sel_secskater
				set_rgba = [64 64 64 255]
			endif
		endif
	endif
	if NOT gotparam done_custom
		if NOT ((<name> = custom_2p_1) || (<name> = custom_2p_2) || (<name> = custom_story))
			current_menu_anchor :settags done_custom
		endif
	endif
	current_menu_anchor :getsingletag did_pro_heading
	current_menu_anchor :getsingletag done_custom
	if gotparam done_custom
		if NOT gotparam did_pro_heading
			add_cas_menu_item {
				cas_heading
				text = "PRO SKATERS"
			}
			current_menu_anchor :settags did_pro_heading
		endif
	endif
	if ((<name> = custom_2p_1) || (<name> = custom_2p_2))
		add_cas_menu_item {
			cas_heading
			text = "GUEST SKATER"
		}
	endif
	if checksumequals a = <name> b = Ped_skater
		choose_script = select_skater_hmenu_choose
	else
		choose_script = select_skater_hmenu_choose
	endif
	if getscreenelementchildren id = current_menu
		getarraysize <children>
		tag_grid_x = <array_size>
	endif
	add_cas_menu_item {
		id = <name>
		text = <disp_name>
		<selectable>
		icon = <icon>
		additional_focus_script = <additional_focus_script>
		additional_focus_params = <additional_focus_params>
		additional_unfocus_script = <additional_unfocus_script>
		additional_unfocus_params = <additional_unfocus_params>
		pad_choose_script = <pad_choose_script>
		no_mask
		tag_grid_x = <tag_grid_x>
		rgba = <set_rgba>
	}
endscript

script ss_find_tag_index 
	if getscreenelementchildren \{id = current_menu}
		getarraysize <children>
		if (<array_size> > 0)
			i = 0
			begin
			if (<children> [<i>] = <name>)
				return true tag_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script ss_additional_skater_focus 
	printf \{"--- ss_additional_focus"}
	printstruct <...>
	killspawnedscript \{name = ss_wait_then_load_model}
	<id> :settags scale = <scale> rot_angle = <rot_angle> z_priority = <z_priority> pos = <pos> old_rgba = <rgba>
	if NOT gotparam \{more_item}
		spawnscript ss_wait_then_load_model params = {<...>}
	else
		skater :hide
	endif
endscript

script ss_wait_then_load_model 
	printf \{"--- ss_wait_then_load_model"}
	wait \{0.5
		seconds
		ignoreslomo}
	if ($is_in_skater_select_menu = 0)
		return
	endif
	ss_load_skater_model <...>
endscript
ss_second_player_first_time = 0

script ss_is_pro 
	if ((<name> = custom_2p_1) || (<name> = custom_2p_2) || (<name> = custom_story))
		return \{false}
	endif
	return \{true}
endscript

script ss_currently_has_pro_skater 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
	if gotparam \{name}
		if ss_is_pro name = <name>
			return \{true}
		endif
	endif
	return \{false}
endscript

script ss_load_skater_model 
	printf "--- ss_load_skater_model"
	if ($is_in_skater_select_menu = 0)
		return
	endif
	pushassetcontext context = z_mainmenu
	if infrontend
		if ($ss_second_player_first_time = 1)
			change ss_second_player_first_time = 0
		else
			cas_ensure_skater_loaded name = <name>
		endif
		get_current_skater_display_name
	endif
	popassetcontext
	playigccam {
		lockto = world
		pos = (-14.0732975, -5.5748167, -30.174664)
		quat = (0.003771, 0.9826829, -0.018605)
		fov = 74.0
		play_hold
	}
	if NOT scriptisrunning ss_ai
		MakeSkaterGoto ss_ai
	endif
	skater :SwitchOffBoard
	skater :obj_forceupdate
	skater :disableplayerinput
	skater :pausephysics
endscript

script ss_additional_skater_unfocus 
	printf \{"--- ss_additional_unfocus"}
	if gotparam \{more_item}
		skater :unhide
	endif
endscript

script ss_nada 
endscript

script ss_ped_menu_back 
	if screenelementexists id = ss_ped_menu_helper_text
		destroyscreenelement id = ss_ped_menu_helper_text
	endif
	doscreenelementmorph {
		id = ss_ped_menu_anchor
		pos = (-200.0, 0.0)
		time = 0.5
	}
	doscreenelementmorph {
		id = select_skater_anchor
		alpha = 1
		time = 0.5
	}
	wait 0.5 seconds
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	assignalias id = select_skater_anchor alias = current_menu_anchor
	assignalias id = select_skater_hmenu alias = current_menu
	launchevent type = focus target = current_menu
endscript

script get_current_skater_display_name 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> display_name
	return display_name = <display_name>
endscript

script select_skater_relight_skater 
	printf "--- select_skater_relight_skater"
	FakeLights percent = 100 prefix = TRG_TR_Level_Light
	setlightambientcolor r = (skater_ambient_color [0]) g = (skater_ambient_color [1]) b = (skater_ambient_color [2])
	setlightdiffusecolor index = 0 r = (skater_diffuse_color1 [0]) g = (skater_diffuse_color1 [1]) b = (skater_diffuse_color1 [2])
	setlightdiffusecolor index = 1 r = (skater_diffuse_color2 [0]) g = (skater_diffuse_color2 [1]) b = (skater_diffuse_color2 [2])
	setlightambientcolor r = (skater_ambient_color [0]) g = (skater_ambient_color [1]) b = (skater_ambient_color [2])
	setlightdiffusecolor index = 0 r = (skater_diffuse_color1 [0]) g = (skater_diffuse_color1 [1]) b = (skater_diffuse_color1 [2])
	setlightdiffusecolor index = 1 r = (skater_diffuse_color2 [0]) g = (skater_diffuse_color2 [1]) b = (skater_diffuse_color2 [2])
	setlightdirection index = 0 heading = skater_select_light0_heading pitch = 350
	setlightdirection index = 1 heading = skater_select_light1_heading pitch = 270
	setlightdirection index = 0 heading = skater_select_light0_heading pitch = 350
	setlightdirection index = 1 heading = skater_select_light1_heading pitch = 270
endscript

script select_skater_hmenu_focus 
	pushassetcontext context = z_mainmenu
	getsingletag id
	if infrontend
		cas_get_current_skater_name
		GetCurrentSkaterProfileIndex
		if (<name> = Ped_skater)
			setlightambientcolor r = 0 g = 0 b = 0
			setlightdiffusecolor index = 0 r = 0 g = 0 b = 0
			setlightdiffusecolor index = 1 r = 0 g = 0 b = 0
			setlightambientcolor r = 0 g = 0 b = 0
			setlightdiffusecolor index = 0 r = 0 g = 0 b = 0
			setlightdiffusecolor index = 1 r = 0 g = 0 b = 0
			FakeLights percent = 0 prefix = TRG_TR_Level_Light
		else
			select_skater_relight_skater
		endif
		MakeSkaterGoto SkateshopAI params = {}
		get_current_skater_display_name
	endif
	if objectexists id = stats_block_anchor
		destroyscreenelement id = stats_block_anchor
	endif
	if NOT (<name> = Ped_skater)
		setscreenelementlock id = stats_block_anchor_parent off
		stats_menu_create_stats_block {
			parent = stats_block_anchor_parent
			id = stats_block_anchor
			not_focusable
			on = on
			scale = 0.85
			pos = (0.0, 0.0)
		}
	endif
	popassetcontext
endscript

script highlight_box_pulse 
	begin
	doscreenelementmorph id = <id> time = 0.03 scale = (1.07, 1.05)
	wait \{0.2
		second}
	doscreenelementmorph id = <id> time = 0.03 scale = (1.1, 1.07)
	wait \{0.2
		second}
	repeat
endscript

script select_skater_hmenu_unfocus 
	gettags
	generic_menu_pad_up_down_sound
	setscreenelementprops {
		id = <id>
		rgba = [80 80 80 98]
	}
endscript

script select_skater_hmenu_choose 
	printf "--- select_skater_hmenu_choose"
	generic_menu_pad_choose_sound
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
	printf "should see currentSkaterProfileIndex"
	printstruct <...>
	if ControllerBoundToDifferentSkater controller = <device_num> skater = <currentskaterprofileindex>
		printf "returning, ControllerBoundToDifferentSkater"
		return
	endif
	current_menu_anchor :getsingletag choosing_player1
	if gotparam choosing_player1
		if (<choosing_player1>)
			if NOT (<device_num> = $device_selected_2player)
				printf "returning, this is not the person who selected 2player mode"
				return
			endif
		endif
	endif
	if infrontend
		getskaterid
		printf "profile index: %s" s = <currentskaterprofileindex>
		if gotparam device_num
			<controller_index> = <device_num>
			printf "device_num: %i" i = <device_num>
		else
			<controller_index> = <controller>
			printf "controller: %i" i = <controller>
		endif
		spawnscriptlater {
			ss_bind_controller_input
			params = {
				currentskaterprofileindex = <currentskaterprofileindex>
				controller_index = <controller_index>
			}
		}
		wait 2 gameframes
		ss_menu_choose_skater_exit
	else
		load_pro_skater_set_custom
		goalmanager_showpoints
		unpause_game_and_destroy_pause_menu
	endif
	ss_restore_self_shadow
endscript

script ss_menu_choose_skater_exit 
	ss_restore_self_shadow
	if objectexists id = select_skater_anchor
		destroyscreenelement id = select_skater_anchor
	endif
	if insplitscreengame
		launch_ss_menu <...>
	else
		if gamemodeequals is_net
			if AcceptedGameInvite
				ui_change_state state = UIstate_net_invite_ready
			else
				menu_stack_create_latest
			endif
		else
			printf "--- ui_change_state freeskate_ready"
			ui_change_state state = UIstate_freeskate_ready
		endif
	endif
endscript

script ss_restore_self_shadow 
	if infrontend
		setshadowrenderingflags \{enable = 'true'
			object = 'skin'}
		setshadowrenderingflags \{enable = 'true'
			object = 'nonskin'}
		setshadowrenderingflags \{enable = 'true'
			object = 'env'}
	endif
endscript

script ss_bind_controller_input \{currentskaterprofileindex = 0
		controller_index = 0}
	BindControllerToSkater skater_heap_index = <currentskaterprofileindex> controller = <controller_index>
	BindFrontEndToController front_end_pad = <currentskaterprofileindex> controller = <controller_index>
endscript

script select_skater_get_profile_info 
	getarraysize \{$master_skater_list}
	<index> = 0
	begin
	if checksumequals a = (($master_skater_list [<index>]).name) b = <skater_profile>
		return profile_info = ($master_skater_list [<index>])
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript
ss_default_ped_trick_mapping = 0
ss_default_ped_specials = 0
ss_first_time_in_2P = 1

script load_second_skater_profile 
	printf "REFRESHING SKATER MODEL"
	setcurrentskaterprofile 1
	killspawnedscript name = ss_wait_then_load_model
	cas_get_current_skater_name
	if ($ss_first_time_in_2P = 1)
		change ss_first_time_in_2P = 0
		current_skater = hawk
	endif
	if check_player_one_picked name = <current_skater>
		<current_skater> = hawk
		if check_player_one_picked name = <current_skater>
			<current_skater> = Burnquist
		endif
	endif
	igc_temporarily_disable_rendering 5 gameframes
	change cas_skater_invalid = 1
	cas_ensure_skater_loaded name = <current_skater>
	change ss_second_player_first_time = 1
	skater :obj_setoutlineflag off
	syncplayer2profile
endscript

script select_skater_menu_back 
	killspawnedscript \{name = highlight_box_pulse}
	if objectexists \{id = select_skater_anchor}
		destroyscreenelement \{id = select_skater_anchor}
		restore_start_key_binding
	endif
	killspawnedscript \{name = ss_wait_then_load_model}
	skater :cancelrotatedisplay
	FakeLights \{percent = 100
		prefix = TRG_TR_Level_Light}
	if NOT (<callback> = back_from_player_two_select)
		cas_ensure_skater_loaded \{name = custom_story}
		ui_destroy_2player_bg
		change \{is_in_skater_select_menu = 0}
	endif
	<callback> from_skater_select
endscript

script menu_blink_arrow 
	domorph \{alpha = 0}
	wait \{100
		ignoreslomo}
	domorph \{time = 0.3
		alpha = 1}
endscript

script blink_arrow 
	if NOT screenelementexists id = <id>
		return
	endif
	doscreenelementmorph id = <id> alpha = 0
	wait \{100
		ignoreslomo}
	doscreenelementmorph id = <id> time = 0.3 alpha = 1
endscript

script set_which_arrow 
	settags arrow_id = <arrow>
endscript

script menu_vert_blink_arrow menu_id = current_menu rgba = [128 128 128 128]
	if NOT objectexists id = <id>
		printf "bad arrow id"
		return
	endif
	terminateobjectsscripts id = <id>
	doscreenelementmorph {
		id = <id>
		alpha = 1
	}
	wait 1 gameframe
	<first_or_last> = 0
	if <menu_id> :menu_selectedindexis first
		<first_or_last> = 1
	endif
	if <menu_id> :menu_selectedindexis last
		<first_or_last> = 1
	endif
	if (<first_or_last> = 0)
		setscreenelementprops {id = <id> rgba = <rgba>}
		runscriptonscreenelement id = <id> menu_blink_arrow
	endif
endscript

script leave_front_end 
	restore_start_key_binding
endscript

script spawn_two_player 
	cleanup \{preserve_skaters}
	leaveserver
	flushdeadobjects
	initskaterheaps
	setservermode
	startserver
	setjoinmode \{$join_mode_play}
	joinserver
	begin
	if JoinServerComplete
		break
	else
		wait \{1}
	endif
	repeat
	ScreenElementSystemCleanup
	spawnscriptnow \{sync_abilities_across_profiles}
	SetShouldIgnoreUnboundControllers \{true}
endscript

script launch_two_player 
	killspawnedscript \{name = ss_wait_then_load_model}
	change \{is_in_skater_select_menu = 0}
	stars
	printf \{'Choosing character!'}
	setcurrentskaterprofile \{0}
	change \{cas_skater_invalid = 1}
	GetSingleSkaterProfileInfo \{player = 0
		name}
	cas_ensure_skater_loaded name = <name>
	SetMenuPadMappings \{[
			active
			use_as_first
		]}
	spawnscriptlater \{spawn_two_player
		notsessionspecific = 1}
endscript

script get_custom_2p_skater_name 
	GetCurrentSkaterProfileIndex
	if (<currentskaterprofileindex> = 0)
		return \{name = custom_2p_1}
	else
		return \{name = custom_2p_2}
	endif
endscript
attract_mode_movies = [
	'movies\\demo_1'
]

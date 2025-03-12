
script ui_create_character_selection 
	scene_swap_do \{name = main}
	change \{in_character_select = 1}
	set_cas_loading_setup \{setup = hidden}
	anim_paks_set_state \{state = frontend
		async = 1}
	cas_get_player
	if gotparam \{from_main_menu}
		change \{rich_presence_context = presence_rockstar_creator}
		change \{cas_started_from = main_menu}
		get_savegame_from_controller \{controller = $primary_controller}
	else
		change \{rich_presence_context = presence_menus}
		change \{cas_started_from = career_select}
		get_savegame_from_player player = <player>
	endif
	printf 'savegame=%s' s = <savegame>
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_TRG_Waypoint_' out = node_prefix
	extendcrc <node_prefix> 'Vocalist_Start' out = node
	change cas_node_name = <node>
	cas_set_object_node_pos player = <player>
	focus_index = 0
	focus_character_id = none
	if gotparam \{from_main_menu}
		pad_back_params = {savegame = <savegame> from_main_menu}
	else
		pad_back_params = {savegame = <savegame>}
		if NOT gotparam \{gone_into_charselect}
			printf 'Changing charid from %s to axel' s = ($g_charselect_previous_character_id)
		endif
	endif
	make_character_selection_menu {
		pad_back_script = character_select_back_out
		pad_back_params = <pad_back_params>
		vmenu_alias = create_character_selection_vmenu
	}
	create_character_selection_vmenu :se_setprops \{event_handlers = [
			{
				pad_up
				ui_character_selection_pad_up
			}
			{
				pad_down
				ui_character_selection_pad_down
			}
		]}
	characterprofilegetlist savegame = <savegame> categories = [cars]
	getarraysize <profile_list>
	if screenelementexists \{id = character_select_num_custom_profiles}
		destroyscreenelement \{id = character_select_num_custom_profiles}
	endif
	formattext textname = num_profiles_text qs(0x3ee1aa75) a = <array_size> b = $max_num_create_a_rockers
	createscreenelement {
		id = character_select_num_custom_profiles
		parent = root_window
		type = textblockelement
		pos = (135.0, 205.0)
		text = <num_profiles_text>
		font = fontgrid_text_a1
		scale = 1
		dims = (350.0, 80.0)
		rgba = [220 220 220 255]
		just = [left center]
		z_priority = 1000
		fit_width = `scale each line if larger`
	}
	<can_create_new_character> = 0
	if (<array_size> < $max_num_create_a_rockers)
		if gotparam \{from_main_menu}
			additional_focus_params = {from_main_menu savegame = <savegame>}
			additional_unfocus_params = {from_main_menu savegame = <savegame>}
		else
			additional_focus_params = {savegame = <savegame>}
			additional_unfocus_params = {savegame = <savegame>}
		endif
		add_character_selection_item {
			name = qs(0x68b4554a)
			bio = qs(0xf8d12f45)
			icon = icon_face
			pad_choose_script = create_new_custom_character
			pad_choose_params = {savegame = <savegame>}
			pad_btn_left_script = character_selection_randomize_car
			pad_btn_left_params = {is_female = 0}
			pad_btn_top_script = character_selection_randomize_car
			pad_btn_top_params = {is_female = 1}
			additional_focus_script = new_custom_char_focus
			additional_focus_params = {<additional_focus_params> vmenu = create_character_selection_vmenu deleted_car = <deleted_car>}
			additional_unfocus_script = change_character_unfocus
			additional_unfocus_params = <additional_unfocus_params>
		}
		new_rocker_id = <selection_item_id>
		if isavatarsysteminitialized
			add_character_selection_item {
				name = qs(0x96a2209c)
				bio = qs(0x8172e1df)
				icon = icon_face
				pad_choose_script = create_new_avatar_character
				pad_choose_params = {savegame = <savegame>}
				pad_btn_left_script = character_selection_randomize_avatar
				pad_btn_left_params = {is_female = 0}
				pad_btn_top_script = character_selection_randomize_avatar
				pad_btn_top_params = {is_female = 1}
				additional_focus_script = new_custom_avatar_focus
				additional_focus_params = {<additional_focus_params> vmenu = create_character_selection_vmenu deleted_car = <deleted_car>}
				additional_unfocus_script = change_character_unfocus
				additional_unfocus_params = <additional_unfocus_params>
			}
			<menu_index> = 2
		else
			<menu_index> = 1
		endif
		<can_create_new_character> = 1
	else
		if (($g_charselect_previous_character_id) = none)
			printf \{'Changing charid from *NONE* to axel'}
			set_charselect_previous_character_id \{id = gh_rocker_axel}
		endif
		<menu_index> = 0
	endif
	ui_event_remove_params \{param = deleted_car}
	characterprofilegetlist savegame = <savegame>
	getarraysize <profile_list>
	i = 0
	begin
	this_id = (<profile_list> [<i>])
	characterprofilegetstruct savegame = <savegame> name = <this_id>
	if gotparam \{from_main_menu}
		if profile_can_be_modified id = <this_id>
			choose_script = choose_character_to_edit
		else
			choose_script = nullscript
		endif
	else
		choose_script = choose_character_to_play
	endif
	getplayerinfo <player> part
	if gotparam \{from_main_menu}
		if display_character_logic profile_struct = <profile_struct> savegame = <savegame> from_main_menu part = <part>
			ok_to_select = 1
		else
			ok_to_select = 0
		endif
	else
		if display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = <part>
			ok_to_select = 1
		else
			ok_to_select = 0
		endif
	endif
	if (<ok_to_select> = 1)
		bio = (<profile_struct>.blurb)
		if is_completely_custom_musician id = <this_id>
			get_current_band_name
			printf \{qs(0x1feab727)}
			formattext textname = bio qs(0xf135a5ff) s = (<profile_struct>.fullname)
		endif
		characterprofilegettype savegame = <savegame> name = <this_id>
		if (<profile_type> = avatar)
			getplayerinfo <player> controller
			netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
			if (<name> = qs(0x00000000))
				formattext textname = name qs(0x72f23aff) d = <player>
			endif
			get_avatar_bio gamertag = <name>
		else
			if is_avatar_character savegame = <savegame> id = <this_id>
				get_created_avatar_bio profile_struct = <profile_struct>
			else
				if NOT is_completely_custom_musician id = <this_id>
					get_localized_bio id = <this_id>
				endif
			endif
		endif
		get_fullname_of_character savegame = <savegame> id = (<profile_struct>.name) profanity_allowed
		if gotparam \{from_main_menu}
			additional_focus_params = {character_id = <this_id> from_main_menu savegame = <savegame>}
			additional_unfocus_params = {character_id = <this_id> from_main_menu savegame = <savegame>}
		else
			additional_focus_params = {character_id = <this_id> savegame = <savegame>}
			additional_unfocus_params = {character_id = <this_id> savegame = <savegame>}
		endif
		add_character_selection_item {
			price = <price>
			bio = <bio>
			name = <fullname>
			icon = icon_face
			pad_choose_script = <choose_script>
			pad_choose_params = {character_id = <this_id> savegame = <savegame> price = <price>}
			additional_focus_script = change_character_focus
			additional_focus_params = {<additional_focus_params> vmenu = create_character_selection_vmenu}
			additional_unfocus_script = change_character_unfocus
			additional_unfocus_params = <additional_unfocus_params>
		}
		if (<this_id> = ($g_charselect_previous_character_id))
			focus_index = <menu_index>
			focus_character_id = <this_id>
		endif
		menu_index = (<menu_index> + 1)
	endif
	if gotparam \{price}
		removeparameter \{price}
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT gotparam \{gone_into_charselect}
		ui_event_add_params \{gone_into_charselect = 1}
		setbuttoneventmappings \{block_menu_input}
		pushunsafeforshutdown \{context = ui_character_select_load}
		if (<focus_character_id> = none)
			set_charselect_previous_character_id \{id = none}
			if gotparam \{new_rocker_id}
				new_custom_char_focus {
					id = <new_rocker_id>
					savegame = <savegame>
					vmenu = create_character_selection_vmenu
					from_main_menu
				}
			endif
		else
			cas_queue_new_character_profile id = <focus_character_id> player = ($cas_current_player) instrument = none savegame = <savegame>
		endif
		cas_queue_wait
		create_frontend_lock_targets
		lightshow_notingameplay_setmood \{mood = menu}
		popunsafeforshutdown \{context = ui_character_select_load}
		spawnscriptnow \{character_selection_menu_fix_input}
	endif
	set_cas_loading_setup \{setup = single}
	if screenelementexists \{id = generic_barrel_menu}
		generic_barrel_menu_finish no_helper_pills = 1 index = <focus_index>
		if screenelementexists \{id = barrel_menu_desc}
			barrel_menu_desc :se_getprops
			barrel_menu_desc :se_setprops {
				generic_barrel_window_dims = (((<generic_barrel_window_dims> [0]) * (1.0, 0.0)) + (((<generic_barrel_window_dims> [1] + 1.0)) * (0.0, 1.0)))
			}
		endif
	endif
	if screenelementexists \{id = character_selection}
		character_selection :se_setprops \{character_selection_control_pos = {
				(0.0, -30.0)
				relative
			}
			time = 0}
	endif
	if (($autolaunch_cas_instrument != none) || ($autolaunch_cas_new_char != none))
		spawnscriptdelayed frames = 10 create_new_custom_character params = {savegame = <savegame> do_wait}
		change \{autolaunch_cas_new_char = none}
	endif
	hide_glitch \{num_frames = 6}
	if NOT gotparam \{gone_into_charselect}
		wait \{2
			gameframes}
	endif
	spawnscriptlater \{hack_restore_camera}
	destroy_mainmenu_bg
endscript

script hack_restore_camera 
	change \{current_menu_camera = 'none'}
endscript

script character_selection_menu_fix_input 
	printf \{'character_selection_menu_fix_input'}
	setscriptcannotpause
	onexitrun \{character_selection_menu_fix_input_done}
	wait \{20
		gameframes}
	begin
	if NOT scriptisrunning \{task_menu_default_anim_in}
		break
	endif
	printf \{'waiting for task_menu_default_anim_in'}
	wait \{1
		gameframe}
	repeat
endscript

script character_selection_menu_fix_input_done 
	printf \{'character_selection_menu_fix_input_done'}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script get_localized_bio 
	requireparams \{[
			id
		]
		all}
	if characterprofileexists savegame = -1 name = <id>
		characterprofilegetstruct savegame = -1 name = <id>
		return bio = (<profile_struct>.blurb)
	endif
endscript

script ui_character_selection_pad_up 
	if screenelementexists \{id = generic_barrel_menu}
		if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_menu_up_arrow}
			<arrow_up_id> = <resolved_id>
		else
			scriptassert \{qs(0x5abff433)}
		endif
		<arrow_up_id> :obj_spawnscript ui_character_selection_do_scroll_glow
		<arrow_up_id> :obj_spawnscript ui_character_selection_do_arrow_pulse
	endif
endscript

script ui_character_selection_pad_down 
	if screenelementexists \{id = generic_barrel_menu}
		if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_menu_down_arrow}
			<arrow_down_id> = <resolved_id>
		else
			scriptassert \{qs(0x5abff433)}
		endif
		<arrow_down_id> :obj_spawnscript ui_character_selection_do_scroll_glow
		<arrow_down_id> :obj_spawnscript ui_character_selection_do_arrow_pulse params = {down = 1}
	endif
endscript

script ui_character_selection_do_scroll_glow 
	obj_getid
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		pos = (32.0, 32.0)
		rgba = [255 215 0 255]
		just = [center center]
		z_priority = 20
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops scale = 1.2 relative_scale
	<id> :se_setprops scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	wait \{0.2
		seconds}
	destroyscreenelement id = <id>
endscript

script ui_character_selection_do_arrow_pulse 
	obj_getid
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = mainmenu_wgt_barrel_arrow
		dims = (64.0, 64.0)
		pos = (32.0, 32.0)
		just = [center center]
		z_priority = 20
		rgba = ntscwhite
	}
	if gotparam \{down}
		<id> :se_setprops flip_h
	endif
	<id> :se_setprops scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops scale = 1.0 time = 0.1 relative_scale
	wait \{0.1
		seconds}
	destroyscreenelement id = <id>
endscript

script cleanup_charselect_ui 
	if screenelementexists \{id = character_select_num_custom_profiles}
		destroyscreenelement \{id = character_select_num_custom_profiles}
	endif
	destroy_character_selection_menu
endscript

script ui_destroy_character_selection 
	cleanup_charselect_ui
	change \{in_character_select = 0}
endscript

script ui_return_character_selection 
	if screenelementexists \{id = create_character_selection_vmenu}
		create_character_selection_vmenu :se_setprops \{unblock_events}
		launchevent \{type = focus
			target = create_character_selection_vmenu}
	endif
endscript

script ui_init_character_selection 
	requireparams \{[
			device_num
		]
		all}
	printscriptinfo \{'ui_init_character_selection'}
	printstruct <...>
	create_mainmenu_bg \{z_priority = 1000000}
	destroy_friend_feed
	stop_venue_effects
	if NOT gotparam \{gone_into_charselect}
	endif
	change \{respond_to_signin_changed = 1}
	cas_destroy_all_characters
	check_car_unlocks
	set_charselect_previous_character_id \{id = none}
	player = (<device_num> + 1)
	change cas_current_player = <player>
	formattext checksumname = player_name 'cas_player%i' i = <player>
	change cas_current_player_name = <player_name>
	get_savegame_from_controller controller = <device_num>
	setplayerinfo 1 controller = <device_num>
	hack_stop_ampzilla
endscript

script ui_deinit_character_selection 
	popdisablerendering \{context = going_into_car
		type = unchecked}
	set_cas_loading_setup \{setup = hidden}
	cleanup_charselect_ui
	if ($is_in_cas = 1)
		cas_free_resources
	endif
	start_venue_effects
	destroy_frontend_lock_targets
	change \{in_character_select = 0}
	change \{respond_to_signin_changed = 0}
	if NOT gotparam \{backed_out_safely}
		change \{in_character_select = 0}
		cas_destroy_all_characters
	else
	endif
	hack_start_ampzilla
endscript

script create_new_car_from_character_id 
	requireparams \{[
			character_id
			savegame
		]
		all}
	new_custom_character_name savegame = <savegame>
	characterprofilegetstruct name = <character_id> savegame = <savegame>
	profile_struct = {
		<profile_struct>
		name = <new_character_id>
	}
	add_new_custom_profile profile = <profile_struct> savegame = <savegame>
	return new_character_id = <new_character_id>
endscript

script create_new_custom_character 
	hide_glitch \{num_frames = 30}
	net_counter_increment \{counter_name = globalcounter_create_new_rocker}
	destroy_character_selection_menu
	cas_get_player
	formattext checksumname = id_checksum 'temporary_car_%d' d = <savegame> addtostringlookup = true
	create_new_car_from_character_id character_id = <id_checksum> savegame = <savegame>
	update_temporary_random_car slot = <savegame> savegame = <savegame>
	cas_edit_character_profile character_id = <new_character_id> savegame = <savegame>
	change \{cas_editing_new_character = true}
	if gotparam \{do_wait}
		begin
		if is_menu_camera_finished
			break
		endif
		wait \{1
			gameframe}
		repeat
		ui_event_wait_for_safe
	endif
	pushdisablerendering \{context = going_into_car
		type = unchecked}
	generic_event_choose state = uistate_customize_character_enter data = {force_id = cas_current_appearance new_data = {state_device = ($primary_controller)}}
endscript

script create_new_avatar_character 
	destroy_character_selection_menu
	cas_get_player
	formattext checksumname = id_checksum 'temporary_avatar_%d' d = <savegame> addtostringlookup = true
	create_new_car_from_character_id character_id = <id_checksum> savegame = <savegame>
	update_temporary_random_avatar slot = <savegame> savegame = <savegame>
	cas_edit_character_profile character_id = <new_character_id> savegame = <savegame>
	change \{cas_editing_new_character = true}
	if gotparam \{do_wait}
		begin
		if is_menu_camera_finished
			break
		endif
		wait \{1
			gameframe}
		repeat
		ui_event_wait_for_safe
	endif
	pushdisablerendering \{context = going_into_car
		type = unchecked}
	generic_event_choose state = uistate_customize_character_enter data = {force_id = cas_current_appearance new_data = {is_avatar = 1 state_device = ($primary_controller)}}
endscript

script character_selection_randomize_avatar 
	ui_sfx \{ui_type = select
		menustate = car}
	get_savegame_from_controller controller = ($primary_controller)
	formattext checksumname = id_checksum 'temporary_avatar_%d' d = <savegame> addtostringlookup = true
	characterprofilegetstruct name = <id_checksum> savegame = <savegame>
	change cas_current_appearance = (<profile_struct>.appearance)
	generate_random_avatar_profile name = <id_checksum> is_female = <is_female> savegame = <savegame>
	characterprofilesetstruct name = <id_checksum> savegame = <savegame> profile_struct = <profile>
	change \{cas_current_appearance = {
		}}
	cas_queue_new_character_profile id = <id_checksum> player = ($cas_current_player) instrument = none savegame = <savegame>
endscript

script character_selection_randomize_car 
	ui_sfx \{ui_type = select
		menustate = car}
	get_savegame_from_controller controller = ($primary_controller)
	formattext checksumname = id_checksum 'temporary_car_%d' d = <savegame> addtostringlookup = true
	characterprofilegetstruct name = <id_checksum> savegame = <savegame>
	change cas_current_appearance = (<profile_struct>.appearance)
	update_temporary_random_car is_female = <is_female> slot = <savegame> savegame = <savegame>
	change \{cas_current_appearance = {
		}}
	cas_queue_new_character_profile id = <id_checksum> player = ($cas_current_player) instrument = none savegame = <savegame>
endscript

script choose_character_to_edit \{event = menu_change}
	if NOT gotparam \{no_charsel}
		destroy_character_selection_menu
	endif
	character_select_num_custom_profiles :se_setprops \{alpha = 0.0}
	if isps3
		hide_glitch \{num_frames = 9}
	endif
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	change \{cas_editing_new_character = false}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	pushdisablerendering \{context = going_into_car
		type = unchecked}
	ui_event_wait event = <event> data = {state = uistate_customize_character_enter new_data = {state_device = ($primary_controller)}}
endscript

script choose_character_to_play \{device_num = !i1768515945}
	hide_glitch \{num_frames = 12}
	destroy_character_selection_menu
	cas_destroy_all_characters
	cas_get_player
	get_savegame_from_player player = <player>
	setplayerinfo <player> character_id = <character_id>
	setplayerinfo <player> character_savegame = <savegame>
	setplayerinfo <player> stored_character_index = 0
	globaltag_set_career_band_leader_choice savegame = <savegame> character_id = <character_id>
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	change \{g_lobby_state = quickplay}
	change \{g_lobby_enter_from_main_menu = 1}
	setglobaltags savegame = <savegame> user_options params = {quickplay_did_first_time_in = 1}
	ui_event_wait event = menu_replace data = {state = uistate_band_lobby device_num = <device_num>}
endscript

script check_character_vmenu_flag 
	requireparams \{[
			character_id
		]
		all}
	if getsingletag \{last_character_focused}
		if (<character_id> = <last_character_focused>)
			printf \{'Hack to get round the poxy barrel menu firing off two focus events'}
			return \{false}
		endif
	endif
	settags last_character_focused = <character_id>
	return \{true}
endscript

script change_character_focus 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	requireparams \{[
			savegame
			character_id
			id
			vmenu
		]
		all}
	characterprofilegetstruct name = <character_id> savegame = <savegame>
	can_reset = 1
	if is_completely_custom_musician id = <character_id>
		can_reset = 0
	elseif is_avatar_appearance appearance = (<profile_struct>.appearance)
		can_reset = 0
	elseif NOT profile_can_be_modified id = <character_id>
		can_reset = 0
	endif
	if (<can_reset> = 1)
		if NOT has_custom_rocker_been_modified id = <character_id> savegame = <savegame>
			can_reset = 0
		endif
	endif
	if NOT <vmenu> :check_character_vmenu_flag character_id = <character_id>
		skip_rebuild = 1
	endif
	character_selection_focus id = <id>
	set_charselect_previous_character_id id = <character_id>
	if is_completely_custom_musician id = <character_id>
		character_select_num_custom_profiles :se_setprops \{alpha = 1.0}
		cleanup_character_select_handlers
		setscreenelementprops {
			id = create_character_selection_vmenu
			event_handlers =
			[
				{pad_option character_select_delete_character params = {character_id = <character_id> savegame = <savegame>}}
				{pad_option ui_sfx params = {menustate = generic uitype = warningmessage}}
				{pad_l1 nullscript}
			]
			replace_handlers
		}
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if NOT gotparam \{from_main_menu}
			add_user_control_helper \{text = qs(0x57a22b82)
				button = yellow
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x271a1633)
			button = blue
			z = 100000}
	else
		character_select_num_custom_profiles :se_setprops \{alpha = 0.0}
		if profile_can_be_modified id = <character_id>
			if (<can_reset> = 1)
				if gotparam \{from_main_menu}
					<pad> = pad_option2
				else
					<pad> = pad_l1
				endif
				setscreenelementprops {
					id = create_character_selection_vmenu
					event_handlers =
					[
						{<pad> ui_event params = {
								event = menu_change
								data = {
									state = uistate_generic_dialog_box
									is_popup
									heading_text = qs(0xca83309b)
									body_text = qs(0x99035772)
									confirm_func = reset_preset_character
									confirm_func_params = {character_id = <character_id> savegame = <savegame>}
									cancel_func = ui_character_select_return
								}
							}
						}
						{<pad> ui_sfx params = {menustate = car uitype = select}}
						{pad_option nullscript}
					]
					replace_handlers
				}
			else
				cleanup_character_select_handlers
			endif
		else
			cleanup_character_select_handlers
		endif
		clean_up_user_control_helpers
		if gotparam \{from_main_menu}
			if profile_can_be_modified id = <character_id>
				add_user_control_helper \{text = qs(0xc18d5e76)
					button = green
					z = 100000}
			endif
		else
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if profile_can_be_modified id = <character_id>
			if gotparam \{from_main_menu}
				<instrument_button> = yellow
				<pad_button> = yellow
			else
				add_user_control_helper \{text = qs(0x57a22b82)
					button = yellow
					z = 100000}
				<instrument_button> = orange
				<pad_button> = lb
			endif
			<controller> = ($primary_controller)
			if (<can_reset> = 1)
				if ((isguitarcontroller controller = <controller>) || (isdrumcontroller controller = <controller>))
					add_user_control_helper text = qs(0x38ee4773) button = <instrument_button> z = 100000
				else
					add_user_control_helper text = qs(0x38ee4773) button = <pad_button> z = 100000
				endif
			endif
		endif
	endif
	if NOT gotparam \{from_main_menu}
		if profile_can_be_modified id = <character_id>
			setscreenelementprops {
				id = create_character_selection_vmenu
				event_handlers = [
					{pad_option2 ui_sfx params = {menustate = car uitype = select}}
					{pad_option2 choose_character_to_edit params = {character_id = <character_id> savegame = <savegame>}}
				]
				replace_handlers
			}
		endif
	endif
	if NOT gotparam \{skip_rebuild}
		cas_queue_add_request appearance = (<profile_struct>.appearance) player = ($cas_current_player) instrument = none
	endif
endscript

script character_select_delete_character 
	requireparams \{[
			character_id
			savegame
		]
		all}
	if screenelementexists \{id = create_character_selection_vmenu}
		launchevent \{type = unfocus
			target = create_character_selection_vmenu}
		create_character_selection_vmenu :se_setprops \{block_events}
	endif
	ui_event_wait event = menu_change data = {
		state = uistate_generic_dialog_box
		is_popup
		heading_text = qs(0x305859e8)
		body_text = qs(0xbfc216cf)
		confirm_func = delete_character_profile
		confirm_func_params = {character_id = <character_id> savegame = <savegame>}
		cancel_func = ui_character_select_return
	}
endscript

script ui_character_select_return 
	spawnscript \{ui_character_select_return_spawned}
endscript

script ui_character_select_return_spawned 
	ui_event \{event = menu_back}
	ui_event_wait \{event = menu_refresh}
endscript

script change_character_unfocus 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	requireparams \{[
			savegame
			id
		]
		all}
	character_selection_unfocus id = <id>
endscript

script character_select_back_out 
	if scriptisrunning \{ui_create_character_selection}
		return
	endif
	hide_glitch \{num_frames = 6}
	create_mainmenu_bg \{z_priority = 1000000}
	play_cameracut \{prefix = 'cameras_no_band'}
	set_cas_loading_setup \{setup = hidden}
	cleanup_charselect_ui
	ui_event_add_params \{backed_out_safely = 1}
	change \{in_character_select = 0}
	persistent_band_force_create_and_wait \{no_wait}
	generic_event_back \{nosound
		state = uistate_mainmenu}
endscript

script delete_character_profile 
	cas_destroy_all_characters
	requireparams \{[
			character_id
			savegame
		]
		all}
	delete_custom_profile id = <character_id> savegame = <savegame>
	cas_get_player
	if NOT characterprofileexists name = ($g_charselect_previous_character_id) savegame = <savegame>
		set_charselect_previous_character_id id = <character_id>
	endif
	ui_memcard_autosave_replace event = menu_back state = uistate_character_selection data = {savegame = <savegame> deleted_car = 1}
endscript

script reset_preset_character 
	cas_destroy_all_characters
	requireparams \{[
			savegame
			character_id
		]
		all}
	restore_custom_musician_parts id = <character_id> savegame = <savegame>
	if ($cas_started_from != main_menu)
		cas_queue_new_character_profile player = ($cas_current_player) id = <character_id> savegame = <savegame>
	endif
	ui_memcard_autosave_replace event = menu_back state = uistate_character_selection data = {savegame = <savegame>}
endscript

script cleanup_character_select_handlers 
	if screenelementexists \{id = create_character_selection_vmenu}
		setscreenelementprops \{id = create_character_selection_vmenu
			event_handlers = [
				{
					pad_option
					nullscript
				}
				{
					pad_l1
					nullscript
				}
				{
					pad_option2
					nullscript
				}
			]
			replace_handlers}
	endif
	clean_up_user_control_helpers
endscript

script new_custom_char_focus 
	requireparams \{[
			savegame
			vmenu
		]
		all}
	if NOT <vmenu> :check_character_vmenu_flag character_id = cas_current_appearance
		printf \{'new_custom_char_focus - already have the appearance'}
		return
	endif
	if NOT gotparam \{deleted_car}
		if scriptisrunning \{ui_create_character_selection}
			if ($g_charselect_previous_character_id != none)
				printf \{'new_custom_char_focus: Preventing during creation'}
				return
			endif
		endif
	endif
	set_charselect_previous_character_id \{id = none}
	cleanup_character_select_handlers
	character_selection_focus id = <id>
	character_select_num_custom_profiles :se_setprops \{alpha = 1.0}
	formattext checksumname = id_checksum 'temporary_car_%d' d = <savegame> addtostringlookup = true
	cas_queue_new_character_profile id = <id_checksum> player = ($cas_current_player) instrument = none savegame = <savegame>
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0xddfe29d4)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xcfa30924)
		button = blue
		z = 100000}
endscript

script new_custom_avatar_focus 
	<new_char> = Random (@ avatar_male @ avatar_female )
	if NOT <vmenu> :check_character_vmenu_flag character_id = <new_char>
		printf \{'new_custom_char_focus - already have the appearance'}
		return
	endif
	change cas_current_new_char_type = <new_char>
	set_charselect_previous_character_id \{id = none}
	cleanup_character_select_handlers
	character_selection_focus id = <id>
	character_select_num_custom_profiles :se_setprops \{alpha = 1.0}
	formattext checksumname = id_checksum 'temporary_avatar_%d' d = <savegame> addtostringlookup = true
	cas_queue_new_character_profile id = <id_checksum> player = ($cas_current_player) instrument = none savegame = <savegame>
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0xddfe29d4)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xcfa30924)
		button = blue
		z = 100000}
endscript

script display_character_logic 
	requireparams \{[
			savegame
			profile_struct
			part
		]
		all}
	if NOT gotparam \{from_main_menu}
		if NOT is_allowed_part profile_struct = <profile_struct> part = <part>
			if gotparam \{bandplay}
				if (<part> = guitar)
					if NOT is_allowed_part profile_struct = <profile_struct> part = bass
						return \{false}
					endif
				else
					return \{false}
				endif
			else
				return \{false}
			endif
		endif
	endif
	if characterprofilegetcategory name = (<profile_struct>.name)
		if ((<profile_category> = temporary) || (<profile_category> = debug))
			return \{false}
		endif
	endif
	if NOT isavatarsysteminitialized
		if is_avatar_appearance appearance = (<profile_struct>.appearance)
			return \{false}
		endif
	endif
	if is_profile_unlocked savegame = <savegame> profile_struct = <profile_struct>
		if is_selectable_profile profile_struct = <profile_struct>
			if NOT gotparam \{from_main_menu}
				return \{true}
			else
				if profile_can_be_modified id = (<profile_struct>.name)
					return \{true}
				else
					return \{false}
				endif
			endif
		else
			return \{false}
		endif
	endif
endscript

script get_avatar_bio 
	requireparams \{[
			gamertag
		]
		all}
	formattext textname = blurb qs(0x80d8a4fe) g = <gamertag>
	return bio = <blurb>
endscript

script get_created_avatar_bio 
	requireparams \{[
			profile_struct
		]
		all}
	if isavatarfemale avatar_meta_data = ((<profile_struct>.appearance.cas_full_body).avatar_meta_data)
		formattext textname = blurb qs(0xcb4b4213) f = (<profile_struct>.fullname)
	else
		formattext textname = blurb qs(0xf551e068) f = (<profile_struct>.fullname)
	endif
	return bio = <blurb>
endscript

script set_charselect_previous_character_id \{id = !q1768515945}
	printscriptinfo 'charselect_previous_character_id %s' s = <id>
	change g_charselect_previous_character_id = <id>
endscript

script hack_stop_ampzilla 
	if scriptexists \{z_credits_ampzilla_stopanimate}
		z_credits_ampzilla_stopanimate
		z_credits_trg_geo_ampzilla :anim_forcetodefaultpose \{default_anim_name = gh6_rocker_ampzilla_default}
		z_credits_trg_geo_ampzillasoft :anim_forcetodefaultpose \{default_anim_name = gh6_rocker_ampzilla_default}
	endif
endscript

script hack_start_ampzilla 
	if scriptexists \{z_credits_ampzilla_animate}
		z_credits_ampzilla_animate
	endif
endscript

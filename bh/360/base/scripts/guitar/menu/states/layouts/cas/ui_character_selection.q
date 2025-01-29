character_select_delete_sound = ui_menu_select_sfx
character_select_reset_sound = ui_menu_select_sfx
character_select_edit_sound = ui_menu_select_sfx

script ui_create_character_selection 
	Change \{in_character_select = 1}
	set_cas_loading_setup \{setup = hidden}
	make_character_selection_menu {
		pad_back_script = character_select_back_out
		pad_back_params = <pad_back_params>
		vmenu_alias = create_character_selection_vmenu
	}
	character_selection :SE_SetProps \{alpha = 0}
	spawnscriptnow ui_create_character_selection_spawned params = {<...>}
endscript

script ui_create_character_selection_spawned 
	anim_paks_set_state \{state = FrontEnd
		async = 1}
	Change \{rich_presence_context = presence_menus}
	cas_get_player
	if GotParam \{from_main_menu}
		Change \{cas_started_from = main_menu}
		get_savegame_from_controller \{controller = $primary_controller}
	else
		Change \{cas_started_from = career_select}
		get_savegame_from_player player = <player>
	endif
	printf 'savegame=%s' s = <savegame>
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_TRG_Waypoint_' out = node_prefix
	ExtendCrc <node_prefix> 'Vocalist_Start' out = node
	Change CAS_node_name = <node>
	cas_set_object_node_pos player = <player>
	focus_index = 0
	focus_character_id = None
	if GotParam \{from_main_menu}
		pad_back_params = {savegame = <savegame> from_main_menu}
	else
		pad_back_params = {savegame = <savegame>}
		if NOT GotParam \{gone_into_charselect}
			Change \{charselect_previous_character_id = GH_Rocker_Quinton}
		endif
	endif
	if NOT GotParam \{from_main_menu}
		ui_event_wait_for_safe
	endif
	AssignAlias \{id = create_character_selection_vmenu
		alias = current_menu}
	character_selection :SE_SetProps \{alpha = 1}
	menu_index = 0
	CharacterProfileGetList savegame = <savegame> categories = [cars]
	GetArraySize <profile_list>
	FormatText TextName = num_profiles_text qs(0xfdc0712c) a = <array_size> b = $max_num_create_a_rockers
	<can_create_new_character> = 0
	if (<array_size> < $max_num_create_a_rockers)
		if GotParam \{from_main_menu}
			additional_focus_params = {from_main_menu savegame = <savegame>}
			additional_unfocus_params = {from_main_menu savegame = <savegame>}
		else
			additional_focus_params = {savegame = <savegame>}
			additional_unfocus_params = {savegame = <savegame>}
		endif
		FormatText TextName = bio_text qs(0x1b770b7d) n = <num_profiles_text>
		add_character_selection_item {
			name = qs(0xa1ea347f)
			bio = <bio_text>
			icon = icon_face
			pad_choose_script = create_new_custom_character
			pad_choose_params = {savegame = <savegame>}
			additional_focus_script = new_custom_char_focus
			additional_focus_params = {<additional_focus_params> vmenu = current_menu deleted_car = <deleted_car>}
			additional_unfocus_script = change_character_unfocus
			additional_unfocus_params = <additional_unfocus_params>
		}
		new_rocker_id = <selection_item_id>
		menu_index = 1
		<can_create_new_character> = 1
	else
		if (($charselect_previous_character_id) = None)
			Change \{charselect_previous_character_id = GH_Rocker_Quinton}
		endif
	endif
	ui_event_remove_params \{param = deleted_car}
	CharacterProfileGetList savegame = <savegame>
	GetArraySize <profile_list>
	i = 0
	begin
	this_id = (<profile_list> [<i>])
	CharacterProfileGetStruct savegame = <savegame> name = <this_id>
	choose_script = choose_character_to_play
	if GotParam \{from_main_menu}
		if profile_can_be_modified id = <this_id>
			choose_script = choose_character_to_edit
		else
			choose_script = nullscript
		endif
	endif
	GetPlayerInfo <player> part
	if GotParam \{from_main_menu}
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
			printf \{qs(0x47c3df3d)}
			get_custom_musician_bio name = (<profile_struct>.fullname) Band = <band_name> genre = ((<profile_struct>.appearance).genre)
		endif
		CharacterProfileGetType savegame = <savegame> name = <this_id>
		if (<profile_type> = avatar)
			GetPlayerInfo <player> controller
			NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
			if (<name> = qs(0x00000000))
				FormatText TextName = name qs(0x72f23aff) d = <player>
			endif
			get_avatar_bio GamerTag = <name>
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
		if GotParam \{from_main_menu}
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
			additional_focus_params = {<additional_focus_params> vmenu = current_menu}
			additional_unfocus_script = change_character_unfocus
			additional_unfocus_params = <additional_unfocus_params>
		}
		if (<this_id> = ($charselect_previous_character_id))
			focus_index = <menu_index>
			focus_character_id = <this_id>
		endif
		menu_index = (<menu_index> + 1)
	endif
	if GotParam \{price}
		RemoveParameter \{price}
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT GotParam \{gone_into_charselect}
		ui_event_add_params \{gone_into_charselect = 1}
		SetButtonEventMappings \{block_menu_input}
		push_unsafe_for_shutdown \{reason = ui_character_select_load}
		root_window :SE_SetProps \{alpha = 0.0}
		if (<focus_character_id> = None)
			Change \{charselect_previous_character_id = None}
			if GotParam \{new_rocker_id}
				new_custom_char_focus {
					id = <new_rocker_id>
					savegame = <savegame>
					vmenu = create_character_selection_vmenu
					from_main_menu
				}
			endif
		else
			cas_queue_new_character_profile id = <focus_character_id> player = ($cas_current_player) instrument = None savegame = <savegame>
		endif
		cas_queue_wait
		stop_cameracut
		create_frontend_lock_targets
		hide_glitch \{num_frames = 6}
		LightShow_NotInGamePlay_SetMood \{mood = Menu}
		root_window :SE_SetProps \{alpha = 1.0}
		pop_unsafe_for_shutdown \{reason = ui_character_select_load}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	set_cas_loading_setup \{setup = single}
	GetScreenElementChildren \{id = create_character_selection_vmenu}
	generic_barrel_menu_item_focus id = (<children> [<focus_index>]) time = 0.0
	if NOT GotParam \{from_main_menu}
		LaunchEvent \{type = unfocus
			target = create_character_selection_vmenu}
	endif
	LaunchEvent type = focus target = create_character_selection_vmenu data = {child_index = <focus_index>}
	if ScreenElementExists \{id = character_selection}
		character_selection :SE_SetProps \{character_selection_control_pos = {
				(0.0, -30.0)
				relative
			}
			time = 0}
	endif
	if ($autolaunch_cas_soak_test = 1)
		spawnscriptlater \{cas_soak_test}
	endif
	if (($autolaunch_cas_instrument != None) || ($autolaunch_cas_new_char != None))
		SpawnScriptDelayed frames = 10 create_new_custom_character params = {savegame = <savegame> do_wait}
	endif
	StartRendering
endscript

script get_localized_bio 
	RequireParams \{[
			id
		]
		all}
	if CharacterProfileExists savegame = -1 name = <id>
		CharacterProfileGetStruct savegame = -1 name = <id>
		return bio = (<profile_struct>.blurb)
	endif
endscript

script get_car_photo_icon 
	RequireParams \{[
			profile_struct
			character_id
			savegame
		]
		all}
	ScriptAssert \{'Photos are cut from GH5'}
endscript

script cleanup_photo_assets 
	RequireParams \{[
			savegame
		]
		all}
	printf \{'cleanup_photo_assets'}
endscript

script cleanup_all_photo_assets 
	if IsXenonOrWinDX
		i = 0
		begin
		cleanup_photo_assets savegame = <i>
		i = (<i> + 1)
		repeat 4
	else
		cleanup_photo_assets \{savegame = 0}
	endif
endscript

script cleanup_charselect_ui 
	destroy_character_selection_menu
endscript

script ui_destroy_character_selection 
	cleanup_charselect_ui
	cleanup_all_photo_assets
	Change \{in_character_select = 0}
endscript

script ui_return_character_selection 
	create_character_selection_vmenu :SE_SetProps \{unblock_events}
	LaunchEvent \{type = focus
		target = create_character_selection_vmenu}
endscript

script ui_init_character_selection 
	RequireParams \{[
			device_num
		]
		all}
	printscriptinfo \{'ui_init_character_selection'}
	printstruct <...>
	Change \{respond_to_signin_changed = 1}
	cas_destroy_all_characters
	check_CAR_unlocks
	Change \{charselect_previous_character_id = None}
	player = (<device_num> + 1)
	Change cas_current_player = <player>
	FormatText checksumname = player_name 'cas_player%i' i = <player>
	Change cas_current_player_name = <player_name>
	get_savegame_from_controller controller = <device_num>
	SetPlayerInfo 1 controller = <device_num>
endscript

script ui_deinit_character_selection 
	set_cas_loading_setup \{setup = hidden}
	cleanup_charselect_ui
	if ($is_in_cas = 1)
		cas_free_resources
	endif
	destroy_frontend_lock_targets
	Change \{in_character_select = 0}
	Change \{respond_to_signin_changed = 0}
	if NOT GotParam \{backed_out_safely}
		Change \{in_character_select = 0}
		cas_destroy_all_characters
		if NOT is_accepting_invite_or_sigining_out
			SpawnScript \{persistent_band_create_band
				params = {
					startup = 1
					refresh = 1
				}}
		else
			persistent_band_force_unique_musicians
		endif
	else
		SpawnScript \{persistent_band_create_band
			params = {
				startup = 1
				refresh = 1
			}}
	endif
endscript

script create_new_car_from_character_id 
	RequireParams \{[
			character_id
			savegame
		]
		all}
	new_custom_character_name savegame = <savegame>
	CharacterProfileGetStruct name = <character_id> savegame = <savegame>
	profile_struct = {
		<profile_struct>
		name = <new_character_id>
	}
	add_new_custom_profile Profile = <profile_struct> savegame = <savegame>
	return new_character_id = <new_character_id>
endscript

script create_new_custom_character 
	destroy_character_selection_menu
	cas_get_player
	FormatText checksumname = id_checksum 'temporary_car_%d' d = <savegame> AddToStringLookup = true
	create_new_car_from_character_id character_id = <id_checksum> savegame = <savegame>
	update_temporary_random_car Slot = <savegame> savegame = <savegame>
	cas_edit_character_profile character_id = <new_character_id> savegame = <savegame>
	Change \{cas_editing_new_character = true}
	if GotParam \{do_wait}
		begin
		if is_menu_camera_finished
			break
		endif
		wait \{1
			gameframe}
		repeat
		ui_event_wait_for_safe
	endif
	ui_event event = menu_change data = {state = UIstate_create_character_gender state_device = ($primary_controller)}
endscript

script choose_character_to_edit \{event = menu_change}
	if NOT GotParam \{no_charsel}
		destroy_character_selection_menu
	endif
	if IsPS3
		hide_glitch \{num_frames = 9}
	endif
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	Change \{cas_editing_new_character = false}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_wait event = <event> data = {state = UIstate_customize_character_enter new_data = {state_device = ($primary_controller)}}
endscript

script choose_character_to_play \{num_states = 1}
	destroy_character_selection_menu
	cas_destroy_all_characters
	cas_get_player
	get_savegame_from_player player = <player>
	SetPlayerInfo <player> character_id = <character_id>
	SetPlayerInfo <player> character_savegame = <savegame>
	SetPlayerInfo <player> stored_character_index = 0
	globaltag_set_career_band_leader_choice savegame = <savegame> character_id = <character_id>
	ui_event \{event = menu_change
		data = {
			state = UIstate_band_name_logo
			from_career_flow
			first_time = 1
		}}
endscript

script check_character_vmenu_flag 
	RequireParams \{[
			character_id
		]
		all}
	if GetSingleTag \{last_character_focused}
		if (<character_id> = <last_character_focused>)
			printf \{'Hack to get round the poxy barrel menu firing off two focus events'}
			return \{false}
		endif
	endif
	SetTags last_character_focused = <character_id>
	return \{true}
endscript

script change_character_focus 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	RequireParams \{[
			savegame
			character_id
			id
			vmenu
		]
		all}
	CharacterProfileGetStruct name = <character_id> savegame = <savegame>
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
	Change charselect_previous_character_id = <character_id>
	if is_completely_custom_musician id = <character_id>
		cleanup_character_select_handlers
		SetScreenElementProps {
			id = current_menu
			event_handlers =
			[
				{pad_option character_select_delete_character params = {character_id = <character_id> savegame = <savegame>}}
				{pad_option ($character_select_delete_sound)}
				{pad_L1 nullscript}
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
		if NOT GotParam \{from_main_menu}
			add_user_control_helper \{text = qs(0x57a22b82)
				button = yellow
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x271a1633)
			button = blue
			z = 100000}
	else
		if profile_can_be_modified id = <character_id>
			if (<can_reset> = 1)
				if GotParam \{from_main_menu}
					<pad> = pad_option2
				else
					<pad> = pad_L1
				endif
				SetScreenElementProps {
					id = current_menu
					event_handlers =
					[
						{<pad> ui_event params = {
								event = menu_change
								data = {
									state = UIstate_generic_dialog_box
									is_popup
									heading_text = qs(0xbe3b3383)
									body_text = qs(0x63d56c13)
									confirm_func = reset_preset_character
									confirm_func_params = {character_id = <character_id> savegame = <savegame>}
								}
							}
						}
						{<pad> ($character_select_reset_sound)}
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
		if GotParam \{from_main_menu}
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
			if GotParam \{from_main_menu}
				<instrument_button> = yellow
				<pad_button> = yellow
			else
				add_user_control_helper \{text = qs(0x57a22b82)
					button = yellow
					z = 100000}
				<instrument_button> = orange
				<pad_button> = LB
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
	if NOT GotParam \{from_main_menu}
		if profile_can_be_modified id = <character_id>
			SetScreenElementProps {
				id = current_menu
				event_handlers = [
					{pad_option2 ($character_select_edit_sound)}
					{pad_option2 choose_character_to_edit params = {character_id = <character_id> savegame = <savegame>}}
				]
				replace_handlers
			}
		endif
	endif
	if NOT GotParam \{skip_rebuild}
		cas_queue_add_request appearance = (<profile_struct>.appearance) player = ($cas_current_player) instrument = None
	endif
endscript

script character_select_delete_character 
	RequireParams \{[
			character_id
			savegame
		]
		all}
	if ScreenElementExists \{id = create_character_selection_vmenu}
		LaunchEvent \{type = unfocus
			target = create_character_selection_vmenu}
		create_character_selection_vmenu :SE_SetProps \{block_events}
	endif
	ui_event_wait event = menu_change data = {
		state = UIstate_generic_dialog_box
		is_popup
		heading_text = qs(0xeea9914e)
		body_text = qs(0x5223ae70)
		confirm_func = delete_character_profile
		confirm_func_params = {character_id = <character_id> savegame = <savegame>}
	}
endscript

script change_character_unfocus 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	RequireParams \{[
			savegame
			id
		]
		all}
	character_selection_unfocus id = <id>
endscript

script character_select_back_out 
	if ScriptIsRunning \{ui_create_character_selection_spawned}
		return
	endif
	generic_menu_pad_back_sound
	hide_glitch \{num_frames = 6}
	play_cameracut \{prefix = 'cameras_no_band'}
	set_cas_loading_setup \{setup = hidden}
	cleanup_charselect_ui
	ui_event_add_params \{backed_out_safely = 1}
	Change \{in_character_select = 0}
	persistent_band_force_create_and_wait \{no_block}
	generic_event_back \{nosound}
endscript

script delete_character_profile 
	cas_destroy_all_characters
	RequireParams \{[
			character_id
			savegame
		]
		all}
	delete_custom_profile id = <character_id> savegame = <savegame>
	cas_get_player
	if NOT CharacterProfileExists name = ($charselect_previous_character_id) savegame = <savegame>
		Change charselect_previous_character_id = <character_id>
	endif
	ui_memcard_autosave_replace event = menu_back state = UIstate_character_selection data = {savegame = <savegame> deleted_car = 1}
endscript

script reset_preset_character 
	cas_destroy_all_characters
	RequireParams \{[
			savegame
			character_id
		]
		all}
	restore_custom_musician_parts id = <character_id> savegame = <savegame>
	if ($cas_started_from != main_menu)
		cas_queue_new_character_profile player = ($cas_current_player) id = <character_id> savegame = <savegame>
	endif
	ui_memcard_autosave_replace event = menu_back state = UIstate_character_selection data = {savegame = <savegame>}
endscript

script cleanup_character_select_handlers 
	if ScreenElementExists \{id = current_menu}
		SetScreenElementProps \{id = current_menu
			event_handlers = [
				{
					pad_option
					nullscript
				}
				{
					pad_L1
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
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script new_custom_char_focus 
	RequireParams \{[
			savegame
			vmenu
		]
		all}
	if NOT <vmenu> :check_character_vmenu_flag character_id = cas_current_appearance
		printf \{'new_custom_char_focus - already have the appearance'}
		return
	endif
	Change \{charselect_previous_character_id = None}
	cleanup_character_select_handlers
	character_selection_focus id = <id>
	FormatText checksumname = id_checksum 'temporary_car_%d' d = <savegame> AddToStringLookup = true
	cas_queue_new_character_profile id = <id_checksum> player = ($cas_current_player) instrument = None savegame = <savegame>
endscript

script display_character_logic 
	RequireParams \{[
			savegame
			profile_struct
			part
		]
		all}
	if NOT GotParam \{from_main_menu}
		if NOT is_allowed_part profile_struct = <profile_struct> part = <part>
			if GotParam \{bandplay}
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
	if CharacterProfileGetCategory name = (<profile_struct>.name)
		if ((<profile_category> = temporary) || (<profile_category> = debug))
			return \{false}
		endif
	endif
	if NOT IsAvatarSystemInitialized
		if is_avatar_appearance appearance = (<profile_struct>.appearance)
			return \{false}
		endif
	endif
	if is_profile_unlocked savegame = <savegame> profile_struct = <profile_struct>
		if is_selectable_profile profile_struct = <profile_struct>
			if NOT GotParam \{from_main_menu}
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

script get_custom_musician_bio 
	RequireParams \{[
			name
			Band
			genre
		]
		all}
	switch <genre>
		case rock
		FormatText TextName = blurb qs(0xb76c1756) n = <name> b = <Band>
		case Punk
		FormatText TextName = blurb qs(0xfc8ac53b) n = <name> b = <Band>
		case `Heavy	Metal`
		FormatText TextName = blurb qs(0x354be7df) n = <name> b = <Band>
		case `Glam	Rock`
		FormatText TextName = blurb qs(0xea0e9cf1) n = <name> b = <Band>
		case `Black	Metal`
		FormatText TextName = blurb qs(0x86aff5b7) n = <name> b = <Band>
		case `Classic	Rock`
		FormatText TextName = blurb qs(0x3395fc50) n = <name> b = <Band>
		case Goth
		FormatText TextName = blurb qs(0xc2891d82) n = <name> b = <Band>
		case Pop
		FormatText TextName = blurb qs(0xe4dfd26e) n = <name> b = <Band>
		case any
		FormatText TextName = blurb qs(0xb46801dd) n = <name> b = <Band>
		default
		ScriptAssert qs(0x8ae50da8) g = <genre> DoNotResolve
	endswitch
	return bio = <blurb>
endscript

script get_avatar_bio 
	RequireParams \{[
			GamerTag
		]
		all}
	FormatText TextName = blurb qs(0x80d8a4fe) g = <GamerTag>
	return bio = <blurb>
endscript

script get_created_avatar_bio 
	RequireParams \{[
			profile_struct
		]
		all}
	if IsAvatarFemale avatar_meta_data = ((<profile_struct>.appearance.CAS_Full_Body).avatar_meta_data)
		FormatText TextName = blurb qs(0x9eb424d5) f = (<profile_struct>.fullname)
	else
		FormatText TextName = blurb qs(0xfac65956) f = (<profile_struct>.fullname)
	endif
	return bio = <blurb>
endscript

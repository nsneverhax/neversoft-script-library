cas_from_main_menu = 0
customize_char_popup = 0
character_select_delete_sound = ui_menu_select_sfx
character_select_reset_sound = ui_menu_select_sfx
character_select_edit_sound = ui_menu_select_sfx

script ui_create_character_selection 
	Change \{respond_to_signin_changed = 1}
	set_cas_loading_setup \{setup = single}
	SpawnScriptNow ui_create_character_selection_spawned params = {<...>}
endscript

script ui_create_character_selection_spawned 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{rich_presence_context = presence_menus}
	Change \{achievements_creating_character = 0}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	lightshow_notingameplay_setmood \{mood = menu}
	if GotParam \{from_main_menu}
		Change \{cas_from_main_menu = 1}
	else
		Change \{cas_from_main_menu = 0}
	endif
	0xd3f993c8 \{full}
	SpawnScriptNow \{0x71e52185}
	cas_free_resources_camera_fix \{base_name = 'character_selection'}
	if ($customize_char_popup = 1)
		Change \{customize_char_popup = 0}
		begin
		if NOT ScreenElementExists \{id = dialog_box_container}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	cas_get_player_status
	get_savegame_from_player_status player_status = <player_status>

	0xce0505af
	cas_set_object_node_pos Player = ($cas_current_player) node = <0xb07e72b1>

	if NOT (($cas_from_main_menu) || (GotParam from_difficulty))
		current_character_id = ($<player_status>.character_id)
	endif
	focus_index = 0
	make_character_selection_menu {
		pad_back_script = character_select_back_out
		pad_back_params = {from_difficulty = <from_difficulty> savegame = <savegame>}
		vmenu_alias = create_character_selection_vmenu
	}
	menu_index = 0
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	if ScreenElementExists \{id = character_select_num_custom_profiles}
		DestroyScreenElement \{id = character_select_num_custom_profiles}
	endif
	formatText TextName = num_profiles_text qs(0x00296914) a = <array_Size> b = $max_num_create_a_rockers
	CreateScreenElement {
		id = character_select_num_custom_profiles
		parent = root_window
		Type = TextBlockElement
		Pos = (105.0, 195.0)
		text = <num_profiles_text>
		font = fontgrid_title_a1
		Scale = 1.1
		dims = (350.0, 80.0)
		rgba = [220 220 220 255]
		just = [left center]
		z_priority = 500
		fit_width = qs(0x01a4ebf1)
	}
	<can_create_new_character> = 0
	if (<array_Size> < $max_num_create_a_rockers)
		add_character_selection_item {
			Name = qs(0xa1ea347f)
			bio = qs(0x637a176a)
			pad_choose_script = create_new_custom_character
			pad_choose_params = {savegame = <savegame> 0x8bf11afc}
			additional_focus_script = new_custom_char_focus
			additional_focus_params = {savegame = <savegame>}
			additional_unfocus_script = change_character_unfocus
			additional_unfocus_params = {savegame = <savegame>}
		}
		menu_index = 1
		<can_create_new_character> = 1
	endif
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_ID = (<profile_struct>.Name)
	choose_script = choose_character_to_play
	if ($cas_from_main_menu)
		if profile_can_be_modified id = <this_ID> savegame = <savegame>
			choose_script = choose_character_to_edit
		else
			choose_script = nullscript
		endif
	else
	endif
	if display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = ($<player_status>.part) from_main_menu = <from_main_menu>
		bio = (<profile_struct>.blurb)
		if is_completely_custom_musician id = <this_ID> savegame = <savegame>
			get_current_band_name

			get_custom_musician_bio Name = (<profile_struct>.fullname) Band = <band_name> genre = ((<profile_struct>.appearance).genre)
		endif
		add_character_selection_item {
			price = <price>
			bio = <bio>
			Name = (<profile_struct>.fullname)
			icon = <icon>
			pad_choose_script = <choose_script>
			pad_choose_params = {character_id = <this_ID> savegame = <savegame> price = <price>}
			additional_focus_script = change_character_focus
			additional_focus_params = {character_id = <this_ID> savegame = <savegame>}
			additional_unfocus_script = change_character_unfocus
			additional_unfocus_params = {character_id = <this_ID> savegame = <savegame>}
		}
		if GotParam \{current_character_id}
			if (<this_ID> = <current_character_id>)
				focus_index = <menu_index>
			endif
		endif
		menu_index = (<menu_index> + 1)
	endif
	if GotParam \{price}
		RemoveParameter \{price}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	generic_barrel_menu_finish \{no_helper_pills = 1}
	generic_barrel_menu :se_setprops \{Pos = (465.0, 470.0)}
	current_menu :SetTags \{reload = 1}
	LaunchEvent Type = focus target = create_character_selection_vmenu data = {child_index = <focus_index>}
	character_selection_animate_in
	SoundEvent \{event = menu_character_bio_panel}
	if ($autolaunch_cas_soak_test = 1)
		SpawnScriptLater \{cas_soak_test}
	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_return_character_selection 
	current_menu :SetTags \{reload = 0}
endscript

script character_select_back_out_and_fix_cam 
	if GotParam \{from_difficulty}
		Change \{first_character_hub_enter = 1}
		generic_event_back \{nosound
			state = uistate_select_difficulty}
	else
		generic_event_back \{nosound}
	endif
endscript

script get_car_photo_icon 


endscript

script cleanup_photo_assets 


endscript

script cleanup_all_photo_assets 
	if isXenon
		i = 0
		begin
		cleanup_photo_assets savegame = <i>
		i = (<i> + 1)
		repeat 4
	else
		cleanup_photo_assets \{savegame = 0}
	endif
endscript

script ui_destroy_character_selection 
	if ScreenElementExists \{id = character_select_num_custom_profiles}
		DestroyScreenElement \{id = character_select_num_custom_profiles}
	endif
	destroy_character_selection_menu
	cleanup_all_photo_assets
endscript

script ui_init_character_selection 
	ps2_load_car_part_script
	0x9db2b00d
	if GotParam \{Player}
		Change cas_current_player = <Player>
		formatText checksumName = player_name 'cas_player%i' i = <Player>
		Change cas_current_player_name = <player_name>
	else
		Change \{cas_current_player = 1}
		Change \{cas_current_player_name = cas_player1}
	endif
	cas_get_player_status
	Change charselect_previous_character_id = ($<player_status>.character_id)
	get_savegame_from_player_status player_status = <player_status>
	create_frontend_lock_targets
	if NOT get_musician_profile_struct_by_id dont_assert id = ($charselect_previous_character_id) savegame = <savegame>
		stars

		stars
		Change \{charselect_previous_character_id = Axel}
	endif
	if ($cas_from_main_menu)
		cas_queue_kill_player Player = ($cas_current_player)
	else
		part = ($<player_status>.part)
		GetGlobalTags savegame = <savegame> last_singleplayer_character
		if NOT (<last_singleplayer_character> = None)
			if profile_exists id = <last_singleplayer_character> savegame = <savegame>
				cas_get_player_status
				Change structurename = <player_status> character_id = <last_singleplayer_character>
				cas_queue_new_character_profile id = <last_singleplayer_character> Player = ($cas_current_player) savegame = <savegame> hide_old_character = 1
			endif
		else
			cas_queue_kill_player Player = ($cas_current_player)
		endif
	endif
endscript

script ui_deinit_character_selection 
	SpawnScriptNow \{kill_watch_timer
		params = {
		}}
	cancel_all_cas_loads
	destroy_character_selection_menu
	if NOT ($cas_heap_state = in_game)
		cas_free_resources \{spawn
			block_scripts = 1}
	endif
	Change \{menu_over_ride_exclusive_device = -1}
	destroy_frontend_lock_targets
	Change \{customize_char_popup = 0}
endscript

script create_new_custom_character 
	if ($cas_heap_state = in_cas)

	endif
	if NOT ($cas_override_object = None)

	endif
	cas_load_and_setup_resources
	new_custom_character_name savegame = <savegame>
	if NOT GotParam \{0x8bf11afc}
		cas_destroy_all_characters
		is_female = Random (@ 0 @ 1 )
		if (<is_female> = 1)
			Profile = ($default_custom_musician_profile_female)
		else
			Profile = ($default_custom_musician_profile_male)
		endif
		Change cas_current_savegame = <savegame>
		generate_random_name is_female = <is_female>
		generate_random_genre
		SpawnScriptNow 0x4ec30caf params = {is_female = <is_female> genre = <genre>}
		0x40cc48b1
		Profile = {
			<Profile>
			Name = <new_character_id>
			fullname = <random_name>
			appearance = ($cas_current_appearance)
		}
	else
		0x40cc48b1
		get_is_female_from_appearance \{appearance = $cas_current_appearance}
		generate_random_name is_female = <is_female>
		Profile = {
			Name = <new_character_id>
			fullname = <random_name>
			allowed_parts = [drum vocals guitar bass]
			blurb = qs(0x03ac90f0)
			appearance = ($cas_current_appearance)
		}
	endif
	add_new_custom_profile Profile = <Profile> savegame = <savegame>
	cas_edit_character_profile character_id = <new_character_id> savegame = <savegame>
	Change \{cas_editing_new_character = true}
	0xea169d59 \{state = uistate_create_character_gender}
endscript

script choose_character_to_edit \{event = menu_change}
	if ($cas_heap_state = in_cas)

	endif
	StopRendering
	if NOT GotParam \{no_charsel}
		destroy_character_selection_menu
	endif
	cas_queue_block
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	if NOT ($cas_override_object = None)

	endif
	cas_load_and_setup_resources
	Change \{cas_editing_new_character = FALSE}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = <event> data = {state = uistate_customize_character}
endscript

script choose_character_to_play \{num_states = 1}
	Change \{first_character_hub_enter = 0}
	cancel_all_cas_loads
	cas_queue_wait
	cas_queue_block
	destroy_character_selection_menu
	kill_watch_timer
	cas_get_player_status
	Change structurename = <player_status> character_id = <character_id>
	SetGlobalTags savegame = <savegame> last_singleplayer_character params = {last_singleplayer_character = <character_id>}
	if NOT current_band_has_band_name
		create_loading_screen
		ui_event_wait event = menu_replace data = {state = uistate_band_name_logo event_params = {event = menu_back data = {num_states = <num_states>}} from_save = 1 controller = $primary_controller}
		return
	endif
	generic_event_back nosound data = {num_states = <num_states>}
endscript

script change_character_focus 

	KillSpawnedScript \{Name = 0xbfbe9bf7}
	KillSpawnedScript \{Name = 0x4ec30caf}
	SpawnScriptNow 0xbfbe9bf7 params = {<...>}
endscript

script 0xbfbe9bf7 
	current_menu :GetTags \{reload}
	current_menu :SetTags \{reload = 1}
	cleanup_character_select_handlers \{no_helpers}
	character_select_num_custom_profiles :se_setprops \{alpha = 0.0}
	character_selection_focus id = <id>
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	0x3b75ff90 = 0
	if profile_can_be_modified id = <character_id> savegame = <savegame> require_purchased = 1
		<0x3b75ff90> = 1
	endif
	clean_up_user_control_helpers
	if (<0x3b75ff90> || ($cas_from_main_menu = 0))
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<0x3b75ff90>)
		if NOT ($cas_from_main_menu)
			SetScreenElementProps {
				id = create_character_selection_vmenu
				event_handlers = [
					{pad_option2 ($character_select_edit_sound)}
					{pad_option2 choose_character_to_edit params = {character_id = <character_id> savegame = <savegame>}}
				]
				replace_handlers
			}
			add_user_control_helper \{text = qs(0x57a22b82)
				button = yellow
				z = 100000}
			if IsGuitarController controller = ($primary_controller)
				0x22a85891 = orange
			else
				0x22a85891 = blue
			endif
			0x4c11c237 = pad_square
		else
			0x22a85891 = yellow
			0x4c11c237 = pad_option2
		endif
		if is_completely_custom_musician id = <character_id> savegame = <savegame>
			character_select_num_custom_profiles :se_setprops \{alpha = 1.0}
			0x3defd39a = qs(0xfce67210)
			0x8185633e = qs(0x5223ae70)
			0xf8f86f4a = delete_character_profile
			0xee576875 = ($character_select_delete_sound)
			0x4228f41c = qs(0x271a1633)
		else
			0x3defd39a = qs(0x77dcbd95)
			0x8185633e = qs(0x63d56c13)
			0xf8f86f4a = reset_preset_character
			0xee576875 = ($character_select_reset_sound)
			0x4228f41c = qs(0x38ee4773)
		endif
		SetScreenElementProps {
			id = create_character_selection_vmenu
			event_handlers =
			[
				{<0x4c11c237> 0x76b5bfdb
					params = {
						title = <0x3defd39a>
						text = <0x8185633e>
						func = <0xf8f86f4a>
						character_id = <character_id>
						savegame = <savegame>
					}
				}
				{<0x4c11c237> <0xee576875>}
			]
			replace_handlers
		}
		add_user_control_helper text = <0x4228f41c> button = <0x22a85891> z = 100000
	endif
	if (<reload>)
		Wait ($0xc7b81333) Second
		cas_queue_wait
		cas_queue_add_request appearance = (<profile_struct>.appearance) Player = ($cas_current_player)
	endif
	0x361b76b3 \{stance = stance_old}
endscript

script 0x76b5bfdb 
	cleanup_character_select_handlers \{no_helpers}
	ui_event event = menu_change data = {
		state = uistate_generic_dialogue
		is_popup
		title = <title>
		text = <text>
		header_dims = (470.0, 120.0)
		choose_yes_func = <func>
		choose_yes_params = {character_id = <character_id> savegame = <savegame>}
	}
endscript

script change_character_unfocus 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}

	character_selection_unfocus id = <id>
endscript

script character_select_back_out 
	cancel_all_cas_loads
	KillSpawnedScript \{Name = 0xbfbe9bf7}
	KillSpawnedScript \{Name = 0x4ec30caf}
	if NOT (($cas_from_main_menu) || (GotParam from_difficulty))
		if profile_exists id = ($charselect_previous_character_id) savegame = <savegame>
			cas_get_player_status
			Change structurename = <player_status> character_id = ($charselect_previous_character_id)
			cas_queue_new_character_profile id = ($charselect_previous_character_id) Player = ($cas_current_player) savegame = <savegame> hide_old_character = 1
		endif
	else
		cas_destroy_all_characters
	endif
	character_select_back_out_and_fix_cam from_difficulty = <from_difficulty>
endscript

script delete_character_profile 
	cas_destroy_all_characters

	delete_custom_profile id = <character_id> savegame = <savegame>
	cas_get_player_status
	Change structurename = <player_status> character_id = ($charselect_previous_character_id)
	ui_memcard_autosave_replace event = menu_back state = uistate_character_selection data = {savegame = <savegame>}
endscript

script reset_preset_character 
	cas_destroy_all_characters

	restore_custom_musician_parts id = <character_id> savegame = <savegame>
	if NOT ($cas_from_main_menu)
		cas_queue_new_character_profile Player = ($cas_current_player) id = <character_id> savegame = <savegame>
	endif
	ui_memcard_autosave_replace event = menu_back state = uistate_character_selection data = {savegame = <savegame>}
endscript

script cleanup_character_select_handlers 
	SetScreenElementProps \{id = create_character_selection_vmenu
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
				pad_square
				nullscript
			}
			{
				pad_option2
				nullscript
			}
		]
		replace_handlers}
	if NOT GotParam \{no_helpers}
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript

script new_custom_char_focus 

	KillSpawnedScript \{Name = 0xbfbe9bf7}
	KillSpawnedScript \{Name = 0x4ec30caf}
	cancel_all_cas_loads
	cleanup_character_select_handlers
	character_select_num_custom_profiles :se_setprops \{alpha = 1.0}
	Change cas_current_savegame = <savegame>
	is_female = Random (@ 0 @ 1 )
	generate_random_genre
	<id> :se_setprops character_selection_item_text_alpha = 1.0
	SpawnScriptNow 0x4ec30caf params = {is_female = <is_female> genre = <genre> Wait}
	0x361b76b3 \{stance = stance_old}
endscript

script display_character_logic 

	if NOT GotParam \{from_main_menu}
		if NOT is_allowed_part profile_struct = <profile_struct> part = <part>
			if GotParam \{bandplay}
				if (<part> = guitar)
					if NOT is_allowed_part profile_struct = <profile_struct> part = bass
						return \{FALSE}
					endif
				else
					return \{FALSE}
				endif
			else
				return \{FALSE}
			endif
		endif
	endif
	if is_profile_unlocked savegame = <savegame> profile_struct = <profile_struct>
		if is_selectable_profile profile_struct = <profile_struct>
			if GotParam \{0x2f8e5ba4}
				if is_profile_purchased id = (<profile_struct>.Name) savegame = <savegame>
					if NOT GotParam \{from_main_menu}
						return \{true}
					else
						if profile_can_be_modified id = (<profile_struct>.Name) savegame = <savegame>
							return \{true}
						else
							return \{FALSE}
						endif
					endif
				endif
			else
				if NOT GotParam \{from_main_menu}
					return \{true}
				else
					if profile_can_be_modified id = (<profile_struct>.Name) savegame = <savegame>
						return \{true}
					else
						return \{FALSE}
					endif
				endif
			endif
		else
			return \{FALSE}
		endif
	endif
endscript

script get_custom_musician_bio 

	StringRemoveTrailingWhitespace string = <Band>
	StringToCharArray string = <new_string>
	GetArraySize <char_array>
	if (<array_Size> = 0)
		<Band> = qs(0xc40aec34)
	endif
	switch <genre>
		case rock
		formatText TextName = blurb qs(0x95fb7acf) n = <Name> b = <Band>
		case punk
		formatText TextName = blurb qs(0xe94b155b) n = <Name> b = <Band>
		case `heavy	metal`
		formatText TextName = blurb qs(0xa80688b8) n = <Name> b = <Band>
		case `glam	rock`
		formatText TextName = blurb qs(0xb93c4ca3) n = <Name> b = <Band>
		case `black	metal`
		formatText TextName = blurb qs(0x386cc385) n = <Name> b = <Band>
		case `classic	rock`
		formatText TextName = blurb qs(0xbb95c056) n = <Name> b = <Band>
		case goth
		formatText TextName = blurb qs(0xb3762de3) n = <Name> b = <Band>
		case pop
		formatText TextName = blurb qs(0x7e7fa45e) n = <Name> b = <Band>
		case any
		formatText TextName = blurb qs(0xcf4a5442) n = <Name> b = <Band>
		default

	endswitch
	return bio = <blurb>
endscript

script external_edit_character 
	Change \{cas_from_main_menu = 0}
	if GotParam \{Player}
		Change cas_current_player = <Player>
		formatText checksumName = player_name 'cas_player%i' i = <Player>
		Change cas_current_player_name = <player_name>
	else
		Change \{cas_current_player = 1}
		Change \{cas_current_player_name = cas_player1}
		Player = 1
	endif
	cancel_all_cas_loads except = ($cas_current_player)
	cas_get_player_status
	get_savegame_from_player_status player_status = <player_status>
	Change charselect_previous_character_id = ($<player_status>.character_id)
	0xce0505af
	cas_set_object_node_pos Player = ($cas_current_player) node = <0xb07e72b1>
	i = 1
	begin
	if NOT (<i> = <Player>)
		cas_queue_kill_player Player = <i>
	endif
	i = (<i> + 1)
	repeat 4
	current_character_id = ($<player_status>.character_id)
	Change menu_over_ride_exclusive_device = ($<player_status>.controller)
	if GotParam \{0x3d48d15c}
		Change menu_over_ride_exclusive_device = <0x3d48d15c>
	endif
	choose_character_to_edit character_id = <current_character_id> savegame = <savegame> no_charsel 0xebd541c9
endscript

script 0x71e52185 
	i = 0
	begin
	if cas_queue_is_busy \{in_queue_too}
		break
	endif
	if (<i> > 30)
		break
	endif
	Wait \{1
		gameframe}
	<i> = (<i> + 1)
	repeat
	cas_queue_wait
	0xe5a305c6
endscript

script 0x361b76b3 \{stance = stance_old}
	begin
	if cas_queue_is_busy \{in_queue_too}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	cas_queue_wait
	if getcurrentcasobject
		<cas_object> :Hide
	endif
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = <stance> no_wait
	endif
	if getcurrentcasobject
		<cas_object> :unhide
	endif
endscript

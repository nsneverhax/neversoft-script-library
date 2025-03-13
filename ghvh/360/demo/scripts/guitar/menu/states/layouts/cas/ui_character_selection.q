ss_focus_on_create_new_character = 0
cas_from_main_menu = 0
customize_char_popup = 0
character_select_delete_sound = ui_menu_select_sfx
character_select_reset_sound = ui_menu_select_sfx
character_select_edit_sound = ui_menu_select_sfx

script ui_create_character_selection 
	change \{respond_to_signin_changed = 1}
	spawnscriptnow \{cleanup_frontend_bg_movie}
	set_cas_loading_setup \{setup = single}
	spawnscriptnow ui_create_character_selection_spawned params = {<...>}
endscript

script ui_create_character_selection_spawned 
	frontend_load_soundcheck \{loadingscreen
		async = 0}
	change \{rich_presence_context = presence_menus}
	change \{achievements_creating_character = 0}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	if gotparam \{from_main_menu}
		change \{cas_from_main_menu = 1}
	else
		change \{cas_from_main_menu = 0}
	endif
	cas_free_resources_camera_fix \{base_name = 'character_selection'}
	if ($customize_char_popup = 1)
		change \{customize_char_popup = 0}
		begin
		if NOT screenelementexists \{id = popup_warning_container}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if (($signin_change_happening = 1) || ($invite_controller > -1))
		unblock_invites
		return
	endif
	cas_get_player_status
	get_savegame_from_player_status player_status = <player_status>
	printf 'savegame=%s' s = <savegame>
	cas_set_object_node_pos player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_select
	printf 'Current character is %s' s = ($<player_status>.character_id) donotresolve
	if ($ss_focus_on_create_new_character = 1)
		change \{ss_focus_on_create_new_character = 0}
	else
		if NOT gotparam \{from_main_menu}
			current_character_id = ($<player_status>.character_id)
		endif
	endif
	focus_index = 0
	create_band_money_display savegame = <savegame>
	make_character_selection_menu {
		pad_back_script = character_select_back_out
		pad_back_params = {from_difficulty = <from_difficulty> savegame = <savegame> from_main_menu = <from_main_menu>}
		vmenu_id = create_character_selection_vmenu
	}
	menu_index = 0
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	if screenelementexists \{id = character_select_num_custom_profiles}
		destroyscreenelement \{id = character_select_num_custom_profiles}
	endif
	formattext textname = num_rockstars_created_text qs(0x83493791) a = <array_size> b = $max_num_create_a_rockers
	character_selection :se_setprops rockstar_count_text = <num_rockstars_created_text>
	<can_create_new_character> = 0
	if (<array_size> < $max_num_create_a_rockers)
		add_character_selection_item {
			name = qs(0xa1ea347f)
			bio = qs(0x637a176a)
			pad_choose_script = create_new_custom_character
			pad_choose_params = {savegame = <savegame>}
			additional_focus_script = new_custom_char_focus
			additional_focus_params = {from_main_menu = <from_main_menu> savegame = <savegame>}
		}
		menu_index = 1
		<can_create_new_character> = 1
	endif
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_id = (<profile_struct>.name)
	choose_script = choose_character_to_play
	if gotparam \{from_main_menu}
		if profile_can_be_modified id = <this_id> savegame = <savegame>
			choose_script = choose_character_to_edit
			if NOT is_profile_purchased id = <this_id> savegame = <savegame>
				price = (<profile_struct>.price)
				choose_script = purchase_character_to_edit
			endif
		else
			choose_script = nullscript
		endif
	else
		if structurecontains structure = <profile_struct> price
			if NOT is_profile_purchased id = <this_id> savegame = <savegame>
				price = (<profile_struct>.price)
				choose_script = purchase_character_to_play
			endif
		endif
	endif
	if display_character_logic profile_struct = <profile_struct> savegame = <savegame> from_main_menu = <from_main_menu> part = ($<player_status>.part)
		get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <this_id>
		bio = (<profile_struct>.blurb)
		if is_completely_custom_musician id = <this_id> savegame = <savegame>
			get_current_band_name
			printf \{qs(0x47c3df3d)}
			if (<band_name> = qs(0x00000000))
				band_name = (<profile_struct>.fullname)
			endif
			get_custom_musician_bio name = (<profile_struct>.fullname) band = <band_name> genre = ((<profile_struct>.appearance).genre)
		endif
		add_character_selection_item {
			price = <price>
			bio = <bio>
			name = (<profile_struct>.fullname)
			icon = <icon>
			pad_choose_script = <choose_script>
			pad_choose_params = {character_id = <this_id> savegame = <savegame> price = <price>}
			additional_focus_script = change_character_focus
			additional_focus_params = {character_id = <this_id> from_main_menu = <from_main_menu> savegame = <savegame>}
		}
		if gotparam \{current_character_id}
			if (<this_id> = <current_character_id>)
				focus_index = <menu_index>
			endif
		endif
		menu_index = (<menu_index> + 1)
	endif
	if gotparam \{price}
		removeparameter \{price}
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<can_create_new_character> = 1)
		add_character_selection_item \{not_focusable}
	endif
	get_musician_profile_size savegame = <savegame>
	i = 0
	added = 0
	begin
	if (<added> = 8)
		break
	endif
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_id = (<profile_struct>.name)
	if display_character_logic profile_struct = <profile_struct> savegame = <savegame> from_main_menu = <from_main_menu> part = ($<player_status>.part)
		get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <this_id> skip_add
		add_character_selection_item {
			not_focusable
			icon = <icon>
		}
		added = (<added> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	menu_finish \{no_helper_text = 1}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent type = focus target = create_character_selection_vmenu data = {child_index = <focus_index>}
	if ($autolaunch_cas_soak_test = 1)
		spawnscriptlater \{cas_soak_test}
	endif
	if ($autolaunch_cas_artist = 1)
	endif
	unblock_invites
endscript

script wait_and_select 
	wait \{20
		gameframes}
	spawnscriptlater create_new_custom_character params = {savegame = <savegame>}
endscript

script character_select_back_out_and_fix_cam 
	if gotparam \{from_difficulty}
		change \{first_character_hub_enter = 1}
		generic_event_back \{nosound
			state = uistate_select_difficulty}
	else
		generic_event_back \{nosound}
	endif
endscript

script get_car_photo_icon 
	requireparams \{[
			profile_struct
			character_id
			savegame
		]
		all}
	icon = axel_mug
	if structurecontains structure = <profile_struct> preset_icon
		icon = (<profile_struct>.preset_icon)
	else
		if photoexistsinglobaltags savegame = <savegame> character_name = <character_id>
			formattext textname = savegamename '_%i' i = <savegame>
			extendcrc <character_id> <savegamename> out = custom_char_icon
			if NOT isassetloaded name = <custom_char_icon>
				if NOT gotparam \{skip_add}
					mempushcontext \{bottomupheap}
					photocreateimageasset savegame = <savegame> character_name = <character_id> asset_name = <custom_char_icon>
					mempopcontext
				endif
			endif
			icon = <custom_char_icon>
		endif
	endif
	return icon = <icon>
endscript

script cleanup_photo_assets 
	requireparams \{[
			savegame
		]
		all}
	printf \{channel = ui
		'cleanup_photo_assets'}
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_id = (<profile_struct>.name)
	formattext textname = savegamename '_%i' i = <savegame>
	extendcrc <this_id> <savegamename> out = custom_char_icon
	printf channel = ui 'deleting photo %d' d = <custom_char_icon> donotresolve
	photodeleteimageasset asset_name = <custom_char_icon>
	i = (<i> + 1)
	repeat <array_size>
endscript

script cleanup_all_photo_assets 
	if isxenon
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
	if screenelementexists \{id = character_select_num_custom_profiles}
		destroyscreenelement \{id = character_select_num_custom_profiles}
	endif
	destroy_character_selection_menu
	cas_get_player_status
	get_savegame_from_player_status player_status = <player_status>
	cleanup_all_photo_assets
endscript

script ui_init_character_selection 
	if gotparam \{player}
		change cas_current_player = <player>
		formattext checksumname = player_name 'cas_player%i' i = <player>
		change cas_current_player_name = <player_name>
	else
		change \{cas_current_player = 1}
		change \{cas_current_player_name = cas_player1}
	endif
	cas_get_player_status
	change charselect_previous_character_id = ($<player_status>.character_id)
	get_savegame_from_player_status player_status = <player_status>
	create_frontend_lock_targets
	if NOT get_musician_profile_struct_by_id dont_assert id = ($charselect_previous_character_id) savegame = <savegame>
		stars
		printf \{qs(0x24c718cb)}
		stars
		change \{charselect_previous_character_id = axel}
	endif
	if gotparam \{from_main_menu}
		cas_queue_kill_player player = ($cas_current_player)
		change \{ss_focus_on_create_new_character = 1}
	else
		part = ($<player_status>.part)
		getglobaltags savegame = <savegame> last_singleplayer_character
		if NOT (<last_singleplayer_character> = none)
			if profile_exists id = <last_singleplayer_character> savegame = <savegame>
				cas_get_player_status
				change structurename = <player_status> character_id = <last_singleplayer_character>
				cas_queue_new_character_profile id = <last_singleplayer_character> player = ($cas_current_player) savegame = <savegame> hide_old_character = 1
			endif
		else
			cas_queue_kill_player player = ($cas_current_player)
			change \{ss_focus_on_create_new_character = 1}
		endif
	endif
endscript

script ui_deinit_character_selection 
	destroy_character_selection_menu
	if NOT ($cas_heap_state = in_game)
		cas_free_resources \{spawn
			block_scripts = 1}
	endif
	change \{menu_over_ride_exclusive_device = -1}
	destroy_band_money_display
	destroy_frontend_lock_targets
	change \{customize_char_popup = 0}
endscript

script create_new_custom_character 
	hide_glitch \{num_frames = 20}
	if ($cas_heap_state = in_cas)
		scriptassert \{'Should in in_game heap state!'}
	endif
	cas_destroy_all_characters
	destroy_character_selection_menu
	cas_queue_block
	cas_get_player_status
	if NOT ($cas_override_object = none)
		scriptassert \{'cas_override_object != none'}
	endif
	cas_load_and_setup_resources
	new_custom_character_name savegame = <savegame>
	change cas_current_savegame = <savegame>
	if NOT structurecontains \{structure = $cas_current_appearance
			car_character}
		is_female = Random (@ 0 @ 1 )
		if (<is_female> = 1)
			profile = ($default_custom_musician_profile_female)
		else
			profile = ($default_custom_musician_profile_male)
		endif
		generate_random_name is_female = <is_female>
		generate_random_genre
		generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
		profile = {
			<profile>
			name = <new_character_id>
			fullname = <random_name>
			appearance = ($cas_current_appearance)
		}
	else
		get_is_female_from_appearance \{appearance = $cas_current_appearance}
		generate_random_name is_female = <is_female>
		profile = {
			name = <new_character_id>
			fullname = <random_name>
			allowed_parts = [drum vocals guitar bass]
			blurb = qs(0x03ac90f0)
			appearance = ($cas_current_appearance)
		}
	endif
	add_new_custom_profile profile = <profile> savegame = <savegame>
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) hide_old_character = 1
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	cas_edit_character_profile character_id = <new_character_id> savegame = <savegame>
	change \{cas_editing_new_character = true}
	ui_event \{event = menu_change
		data = {
			state = uistate_create_character_gender
		}}
endscript

script choose_character_to_edit \{event = menu_change}
	if ($cas_heap_state = in_cas)
		scriptassert \{'Should in in_game heap state!'}
	endif
	stoprendering
	if NOT gotparam \{no_charsel}
		destroy_character_selection_menu
	endif
	cas_queue_block
	cas_edit_character_profile character_id = <character_id> savegame = <savegame>
	if NOT ($cas_override_object = none)
		scriptassert \{'cas_override_object != none'}
	endif
	cas_load_and_setup_resources
	change \{cas_editing_new_character = false}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	begin
	if is_menu_camera_finished
		ui_event_wait event = <event> data = {state = uistate_customize_character}
		startrendering
		hide_glitch \{num_frames = 2}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script purchase_character_to_edit 
	generic_event_choose data = {state = uistate_character_purchase is_popup choose_yes_script = purchase_character_continue_to_edit choose_yes_params = {<...>} <...>}
endscript

script purchase_character_continue_to_edit 
	purchase_profile id = <character_id> savegame = <savegame>
	choose_character_to_edit <...> event = menu_replace
endscript

script purchase_character_to_play 
	generic_event_choose data = {state = uistate_character_purchase is_popup choose_yes_script = purchase_character_continue_to_play choose_yes_params = {<...>} <...>}
endscript

script purchase_character_continue_to_play 
	purchase_profile id = <character_id> savegame = <savegame>
	choose_character_to_play <...> num_states = 2
endscript

script choose_character_to_play \{num_states = 1}
	change \{first_character_hub_enter = 0}
	destroy_character_selection_menu
	cas_queue_block
	cas_get_player_status
	change structurename = <player_status> character_id = <character_id>
	setglobaltags savegame = <savegame> last_singleplayer_character params = {last_singleplayer_character = <character_id>}
	if NOT current_band_has_band_name
		ui_event_wait event = menu_replace data = {state = uistate_band_name_logo event_params = {event = menu_back data = {num_states = <num_states>}} from_save = 1 controller = $primary_controller}
		return
	endif
	generic_event_back nosound data = {num_states = <num_states>}
endscript

script change_character_focus 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	requireparams \{[
			savegame
			character_id
		]
		all}
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	if is_completely_custom_musician id = <character_id> savegame = <savegame>
		setscreenelementprops {
			id = create_character_selection_vmenu
			event_handlers =
			[
				{pad_option ui_event params = {
						event = menu_change
						data = {
							state = uistate_generic_dialogue
							is_popup
							title = qs(0xfce67210)
							text = qs(0x5223ae70)
							choose_yes_func = {
								delete_character_profile
								params = {character_id = <character_id> savegame = <savegame>}
							}
						}
					}
				}
				{pad_option ($character_select_delete_sound)}
				{pad_option2 nullscript}
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
		add_user_control_helper \{text = qs(0x271a1633)
			button = blue
			z = 100000}
	else
		if profile_can_be_modified id = <character_id> savegame = <savegame> require_purchased = 1
			if gotparam \{from_main_menu}
				<pad> = pad_option2
			else
				<pad> = pad_l1
			endif
			setscreenelementprops \{id = create_character_selection_vmenu
				event_handlers = [
					{
						pad_option
						nullscript
					}
				]
				replace_handlers}
		else
			cleanup_character_select_handlers
		endif
		clean_up_user_control_helpers
		if gotparam \{from_main_menu}
			if profile_can_be_modified id = <character_id> savegame = <savegame>
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
		if profile_can_be_modified id = <character_id> savegame = <savegame> require_purchased = 1
			if gotparam \{from_main_menu}
				<instrument_button> = yellow
				<pad_button> = yellow
			else
				<instrument_button> = orange
				<pad_button> = lb
			endif
			<controller> = ($primary_controller)
			if NOT (($menu_over_ride_exclusive_device) = -1)
				<controller> = ($menu_over_ride_exclusive_device)
			endif
		endif
	endif
	if NOT gotparam \{from_main_menu}
		if profile_can_be_modified id = <character_id> savegame = <savegame> require_purchased = 1
			setscreenelementprops {
				id = create_character_selection_vmenu
				event_handlers = [
					{pad_option2 ($character_select_edit_sound)}
				]
				replace_handlers
			}
		endif
	endif
	cas_queue_add_request appearance = (<profile_struct>.appearance) player = ($cas_current_player)
endscript

script character_select_back_out 
	cascancelloading
	if gotparam \{from_difficulty}
		cas_destroy_all_characters
	else
		if NOT gotparam \{from_main_menu}
			if profile_exists id = ($charselect_previous_character_id) savegame = <savegame>
				cas_get_player_status
				change structurename = <player_status> character_id = ($charselect_previous_character_id)
				cas_queue_new_character_profile id = ($charselect_previous_character_id) player = ($cas_current_player) savegame = <savegame> hide_old_character = 1
			endif
		endif
	endif
	character_select_back_out_and_fix_cam from_difficulty = <from_difficulty>
endscript

script delete_character_profile 
	cas_destroy_all_characters
	requireparams \{[
			character_id
			savegame
		]
		all}
	delete_custom_profile id = <character_id> savegame = <savegame>
	cas_get_player_status
	change structurename = <player_status> character_id = ($charselect_previous_character_id)
	photoremovefromglobaltags character_name = <character_id> savegame = <savegame>
	ui_event \{event = menu_back
		state = uistate_character_selection}
endscript

script reset_preset_character 
	cas_destroy_all_characters
	requireparams \{[
			savegame
			character_id
		]
		all}
	restore_custom_musician_parts id = <character_id> savegame = <savegame>
	if ($cas_from_main_menu = 0)
		cas_queue_new_character_profile player = ($cas_current_player) id = <character_id> savegame = <savegame>
	endif
	ui_memcard_autosave_replace event = menu_back state = uistate_character_selection data = {savegame = <savegame>}
endscript

script cleanup_character_select_handlers 
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
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script new_custom_char_focus 
	requireparams \{[
			savegame
		]
		all}
	cleanup_character_select_handlers
	is_female = Random (@ 0 @ 1 )
	if (<is_female> = 1)
		profile = ($default_custom_musician_profile_female)
	else
		profile = ($default_custom_musician_profile_male)
	endif
	change cas_current_savegame = <savegame>
	generate_random_name is_female = <is_female>
	generate_random_genre
	generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
	change cas_current_appearance = {
		($cas_current_appearance)
		car_character = 1
	}
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player)
endscript

script display_character_logic 
	requireparams \{[
			savegame
			profile_struct
			part
		]
		all}
	if checksumequals a = (<profile_struct>.name) b = jimi
		return \{false}
	endif
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
	if is_profile_unlocked savegame = <savegame> profile_struct = <profile_struct>
		if is_selectable_profile profile_struct = <profile_struct>
			if NOT gotparam \{from_main_menu}
				return \{true}
			else
				if profile_can_be_modified id = (<profile_struct>.name) savegame = <savegame>
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
	requireparams \{[
			name
			band
			genre
		]
		all}
	switch <genre>
		case rock
		formattext textname = blurb qs(0x50cd2801) n = <name> b = <band>
		case punk
		formattext textname = blurb qs(0xd3324bc4) n = <name> b = <band>
		case `heavy metal`
		formattext textname = blurb qs(0x10e3c7ab) n = <name> b = <band>
		case `glam rock`
		formattext textname = blurb qs(0x2a0d24e3) n = <name> b = <band>
		case `black metal`
		formattext textname = blurb qs(0x21ee9b88) n = <name> b = <band>
		case `classic rock`
		formattext textname = blurb qs(0x387d262c) n = <name> b = <band>
		case goth
		formattext textname = blurb qs(0x6b7f497f) n = <name> b = <band>
		case pop
		formattext textname = blurb qs(0xe34331a2) n = <name> b = <band>
		case any
		formattext textname = blurb qs(0x105c8fc0) n = <name> b = <band>
		default
		scriptassert qs(0x8ae50da8) g = <genre> donotresolve
	endswitch
	return bio = <blurb>
endscript

script external_edit_character 
	change \{cas_from_main_menu = 0}
	if gotparam \{player}
		change cas_current_player = <player>
		formattext checksumname = player_name 'cas_player%i' i = <player>
		change cas_current_player_name = <player_name>
	else
		change \{cas_current_player = 1}
		change \{cas_current_player_name = cas_player1}
	endif
	cancel_all_cas_loads except = ($cas_current_player)
	cas_get_player_status
	get_savegame_from_player_status player_status = <player_status>
	change charselect_previous_character_id = ($<player_status>.character_id)
	cas_set_object_node_pos player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_select
	current_character_id = ($<player_status>.character_id)
	cas_queue_new_character_profile id = <current_character_id> player = ($cas_current_player) savegame = <savegame>
	change menu_over_ride_exclusive_device = ($<player_status>.controller)
	choose_character_to_edit character_id = <current_character_id> savegame = <savegame> no_charsel
endscript

script is_custom_modified 
	requireparams \{[
			savegame
			id
		]
		all}
	if find_profile_by_id id = <id> savegame = <savegame>
		globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
		if (<index> < <array_size>)
			return \{false}
		else
			get_musician_profile_struct_by_index index = <index> savegame = <savegame>
			index = (<index> - <array_size>)
			getarraysize \{$preset_musician_profiles_modifiable}
			if (<index> < <array_size>)
				struct1 = ($preset_musician_profiles_modifiable [<index>].appearance)
				struct2 = (<profile_struct>.appearance)
				printstruct <...>
				if (comparestructs struct1 = <struct1> struct2 = <struct2>)
					return \{false}
				else
					return \{true}
				endif
			else
				return \{false}
			endif
		endif
	endif
endscript

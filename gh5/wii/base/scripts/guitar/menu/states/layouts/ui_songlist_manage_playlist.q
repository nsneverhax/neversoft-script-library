play_song_options = [
	{
		text = qs(0x9c35abe6)
		pad_choose_script = songlist_manage_playlist_select_create
		option_boolean_script = allow_songlist_manage_playlist_writes
	}
	{
		text = qs(0xf481e489)
		pad_choose_script = songlist_manage_playlist_load
	}
	{
		text = qs(0xed733529)
		pad_choose_script = songlist_manage_playlist_delete
		option_boolean_script = allow_songlist_manage_playlist_writes
	}
	{
		text = qs(0x8704b183)
		textureon = Options_Controller_Check
		textureoff = Options_Controller_X
		toggle_checksum = g_songlist_show_more_info
		pad_choose_script = songlist_manage_playlist_show_more_info_toggle
	}
	{
		text = qs(0xb6a78dc1)
		textureon = Options_Controller_Check
		textureoff = Options_Controller_X
		toggle_checksum = g_songlist_show_ghtunes
		pad_choose_script = songlist_manage_playlist_show_ghtunes_toggle
		option_boolean_script = allow_show_ghtunes_toggle
	}
]
playlist_options = [
	{
		text = qs(0xf481e489)
		pad_choose_script = songlist_manage_playlist_load
	}
	{
		text = qs(0x1840c8c2)
		pad_choose_script = songlist_manage_playlist_save
		option_boolean_script = allow_songlist_manage_playlist_writes
	}
	{
		text = qs(0x4d505751)
		pad_choose_script = songlist_manage_playlist_clear_query
		option_boolean_script = is_a_playlist_loaded
	}
	{
		text = qs(0x612ddd8d)
		pad_choose_script = songlist_manage_playlist_shuffle
		option_boolean_script = is_a_playlist_loaded
	}
	{
		text = qs(0xa96b67db)
		pad_choose_script = songlist_manage_playlist_select_play_one_song
		option_boolean_script = is_current_playlist_empty
	}
	{
		text = qs(0xed733529)
		pad_choose_script = songlist_manage_playlist_delete
		option_boolean_script = allow_songlist_manage_playlist_writes
	}
	{
		text = qs(0x8704b183)
		textureon = Options_Controller_Check
		textureoff = Options_Controller_X
		toggle_checksum = g_songlist_show_more_info
		pad_choose_script = songlist_manage_playlist_show_more_info_toggle
	}
	{
		text = qs(0xb6a78dc1)
		textureon = Options_Controller_Check
		textureoff = Options_Controller_X
		toggle_checksum = g_songlist_show_ghtunes
		pad_choose_script = songlist_manage_playlist_show_ghtunes_toggle
		option_boolean_script = allow_show_ghtunes_toggle
	}
]
g_songlist_manage_playlist_dirty = 0
g_songlist_refresh_menus = 0
g_first_empty_custom_playlist_slot = 0
g_current_loaded_custom_playlist_index = -1
g_songlist_show_more_info = 0
g_songlist_show_ghtunes = 1
g_gbm_exclusive_device = 0
g_gbm_savegame_device = 0

script ui_create_songlist_manage_playlist 
	sdcardmanagerfunc \{func = force_hold_ejects}
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	get_savegame_from_controller controller = <savegame_device>
	GetGlobalTags savegame = <savegame> custom_playlists param = custom_playlists
	Change custom_playlists = <custom_playlists>
	Change \{g_songlist_manage_playlist_dirty = 0}
	CreateScreenElement \{Type = descinterface
		desc = 'songlist_manage_playlist'
		id = songlist_manage_playlist
		parent = root_window
		z_priority = 99
		songlist_manage_playlist_main_cont_pos = (130.0, 140.0)
		songlist_manage_playlist_selection_bar_alpha = 0.0}
	songlist_manage_playlist :SetTags {
		show_more_info_on_enter = ($g_songlist_show_more_info)
		show_ghtunes_on_enter = ($g_songlist_show_ghtunes)
	}
	songlist_manage_playlist_setup_physics_elements
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if songlist_manage_playlist :desc_resolvealias \{Name = alias_songlist_manage_playlist_barrel_cont}
		AssignAlias id = <resolved_id> alias = songlist_manage_playlist_barrel_cont
	else
		ScriptAssert \{qs(0xeb80214d)}
	endif
	songlist_manage_playlist_setup_barrel exclusive_device = <exclusive_device> savegame_device = <savegame_device>
	songlist_manage_playlist_create_default_user_control_helpers
endscript

script songlist_manage_playlist_setup_barrel 
	if GotParam \{exclusive_device}
		Change g_gbm_exclusive_device = <exclusive_device>
	endif
	make_generic_barrel_menu {
		parent = songlist_manage_playlist_barrel_cont
		exclusive_device = ($g_gbm_exclusive_device)
		centered = 1
		Pos = (368.0, 300.0)
		z_priority = 100
		Scale = 0.9
		pad_back_script = songlist_manage_playlist_back
	}
	AssignAlias id = <vmenu_id> alias = barrel_menu
	if GotParam \{savegame_device}
		Change g_gbm_savegame_device = <savegame_device>
	endif
	if NOT GotParam \{no_options}
		songlist_manage_playlist_create_menu_options
		generic_barrel_menu_finish
	endif
endscript

script songlist_manage_playlist_setup_physics_elements 
	create_2d_spring_system \{desc_id = songlist_manage_playlist
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	if songlist_manage_playlist :desc_resolvealias \{Name = alias_playlist_manage2
			param = play_manage_id}
		<play_manage_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if songlist_manage_playlist :desc_resolvealias \{Name = alias_playlist_manage2
			param = play_manage_id}
		<play_manage_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'drose1'}
	endif
endscript

script songlist_manage_playlist_create_default_user_control_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script songlist_manage_playlist_accept_name 
	SoundEvent \{event = enter_band_name_finish}
	Change g_current_loaded_custom_playlist_index = ($g_first_empty_custom_playlist_slot)
	<playlist_entry> = {
		Name = <text>
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = custom_playlists index = ($g_first_empty_custom_playlist_slot) NewValue = <playlist_entry> globalarray
	songlist_manage_playlist_save_and_go_back exclusive_device = ($g_gbm_exclusive_device)
endscript

script songlist_manage_playlist_cancel_name 
	SoundEvent \{event = Generic_Menu_Back_SFX}
	ui_event event = menu_replace data = {
		is_popup
		state = uistate_songlist_manage_playlist
		exclusive_device = ($g_gbm_exclusive_device)
		savegame_device = ($g_gbm_savegame_device)
	}
endscript

script ui_destroy_songlist_manage_playlist 
	DestroyScreenElement \{id = songlist_manage_playlist}
	clean_up_user_control_helpers
	songlist_create_default_user_control_helpers \{mode = playlist}
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
endscript

script songlist_manage_playlist_create_menu_options 
	SpawnScriptNow \{menu_music_on}
	songlist_manage_playlist :se_setprops \{songlist_manage_playlists_text_text = qs(0x976cf9e7)}
	SongList :GetSingleTag \{mode}
	ExtendCrc <mode> '_options' out = options_array
	GetArraySize $<options_array>
	if (<array_Size> > 0)
		<num_menu_items> = 0
		<i> = 0
		begin
		<item_struct> = ($<options_array> [<i>])
		<continue> = 1
		if StructureContains structure = <item_struct> option_boolean_script
			if NOT (<item_struct>.option_boolean_script)
				<continue> = 0
			endif
		endif
		if (<continue> = 1)
			<num_menu_items> = (<num_menu_items> + 1)
			if StructureContains structure = <item_struct> toggle_checksum
				<toggle_checksum> = (<item_struct>.toggle_checksum)
				if (($<toggle_checksum>) = 0)
					<texture> = (<item_struct>.textureoff)
				else
					<texture> = (<item_struct>.textureon)
				endif
				add_generic_barrel_menu_icon_item {
					text = (<item_struct>.text)
					icon = <texture>
					text_focus_color = ($g_songlist_item_focus_rgba)
					text_unfocus_color = ($g_songlist_item_unfocus_rgba)
					pad_choose_script = (<item_struct>.pad_choose_script)
					pad_choose_sound = nullscript
					icon_first = 0
					dont_force_quit = 1
				}
			else
				add_generic_barrel_menu_text_item {
					text = (<item_struct>.text)
					text_focus_color = ($g_songlist_item_focus_rgba)
					text_unfocus_color = ($g_songlist_item_unfocus_rgba)
					pad_choose_sound = nullscript
					pad_choose_script = (<item_struct>.pad_choose_script)
				}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<num_menu_items> < 5)
			generic_barrel_menu_set_max_expansion max_expansion = <num_menu_items>
		endif
	endif
endscript

script songlist_manage_playlist_save 
	SoundEvent \{event = ui_sfx_select}
	if NOT is_a_playlist_loaded
		LaunchEvent \{Type = unfocus
			target = barrel_menu}
		barrel_menu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0x7d6a4901)
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_manage_playlist_destroy_dialog
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		if ($g_current_loaded_custom_playlist_index = -1)
			if get_first_empty_custom_playlist_slot
				songlist_manage_playlist_create_new_confirm index = <slot> exclusive_device = ($g_gbm_exclusive_device)
			else
				LaunchEvent \{Type = unfocus
					target = barrel_menu}
				barrel_menu :se_setprops \{block_events}
				create_dialog_box {
					heading_text = qs(0xaa163738)
					body_text = qs(0x7764e154)
					player_device = ($g_gbm_exclusive_device)
					options = [
						{
							func = songlist_manage_playlist_destroy_dialog
							text = qs(0x0e41fe46)
						}
					]
				}
			endif
		else
			LaunchEvent \{Type = unfocus
				target = barrel_menu}
			barrel_menu :se_setprops \{block_events}
			create_dialog_box {
				heading_text = qs(0xaa163738)
				body_text = qs(0xfdbc4b34)
				player_device = ($g_gbm_exclusive_device)
				back_button_script = songlist_manage_playlist_destroy_dialog
				options = [
					{
						func = songlist_manage_playlist_destroy_dialog
						text = qs(0xf7723015)
					}
					{
						func = songlist_manage_playlist_overwrite_confirm
						func_params = {exclusive_device = ($g_gbm_exclusive_device)}
						text = qs(0xf77909ae)
					}
					{
						func = songlist_manage_playlist_create_new_confirm
						func_params = {exclusive_device = ($g_gbm_exclusive_device)}
						text = qs(0xa1ea347f)
					}
				]
			}
		endif
	endif
endscript

script songlist_manage_playlist_overwrite_confirm 
	<index> = ($g_current_loaded_custom_playlist_index)
	<playlist_entry> = {
		Name = (($custom_playlists) [<index>].Name)
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = custom_playlists index = <index> NewValue = <playlist_entry> globalarray
	songlist_manage_playlist_save_and_go_back exclusive_device = ($g_gbm_exclusive_device)
endscript

script songlist_manage_playlist_create_new_confirm 
	songlist_manage_playlist_destroy_dialog
	if get_first_empty_custom_playlist_slot
		Change g_first_empty_custom_playlist_slot = <slot>
		formatText TextName = playlist_name qs(0xc0114aa1) i = (<slot> + 1)
		ui_event event = menu_replace data = {
			is_popup
			state = uistate_edit_name
			default_name = <playlist_name>
			char_limit = 18
			title = qs(0x3703427b)
			accept_script = songlist_manage_playlist_accept_name
			cancel_script = songlist_manage_playlist_cancel_name
			device_num = ($g_gbm_exclusive_device)
		}
	else
		LaunchEvent \{Type = unfocus
			target = barrel_menu}
		barrel_menu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0xaaf1b4f3)
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_manage_playlist_destroy_dialog
					text = qs(0xf7723015)
				}
				{
					func = songlist_manage_playlist_overwrite_confirm
					func_params = {exclusive_device = ($g_gbm_exclusive_device)}
					text = qs(0xf77909ae)
				}
			]
		}
	endif
endscript

script songlist_manage_playlist_select_create 
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	songlist_create_playlist \{no_detail_transition = 1}
	Wait \{2
		gameframes}
	Change \{g_songlist_refresh_menus = 1}
	songlist_manage_playlist_back
endscript

script songlist_manage_playlist_select_play_one_song 
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	songlist_create_play_song \{no_detail_transition = 1}
	Wait \{2
		gameframes}
	Change \{g_songlist_refresh_menus = 1}
	songlist_manage_playlist_back
endscript

script songlist_manage_playlist_load 
	destroy_generic_barrel_menu
	songlist_manage_playlist_setup_barrel \{no_options}
	SoundEvent \{event = ui_sfx_select}
	GetArraySize \{$locked_playlists}
	<locked_size> = <array_Size>
	GetArraySize \{$custom_playlists}
	<custom_size> = <array_Size>
	<total_size> = (<locked_size> + <custom_size>)
	if (<total_size> > 0)
		songlist_manage_playlist :se_setprops \{songlist_manage_playlists_text_text = qs(0xf481e489)}
		event_handlers = [
			{pad_back songlist_manage_playlist_back_to_initial_menu params = {back_sound}}
		]
		barrel_menu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		barrel_menu :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = barrel_menu}
		if (<locked_size> > 0)
			<i> = 0
			begin
			if NOT is_playlist_slot_empty playlists = locked slot = <i>
				<item_struct> = (($locked_playlists) [<i>])
				add_generic_barrel_menu_text_item {
					text = (<item_struct>.Name)
					text_focus_color = ($g_songlist_item_focus_rgba)
					text_unfocus_color = ($g_songlist_item_unfocus_rgba)
					pad_choose_script = songlist_manage_playlist_load_query
					pad_choose_params = {index = <i> text = (<item_struct>.Name) playlists = locked}
				}
			endif
			<i> = (<i> + 1)
			repeat <locked_size>
		endif
		<i> = 0
		begin
		if NOT is_playlist_slot_empty playlists = custom slot = <i>
			<item_struct> = (($custom_playlists) [<i>])
			add_generic_barrel_menu_text_item {
				text = (<item_struct>.Name)
				text_focus_color = ($g_songlist_item_focus_rgba)
				text_unfocus_color = ($g_songlist_item_unfocus_rgba)
				pad_choose_script = songlist_manage_playlist_load_query
				pad_choose_params = {index = <i> text = (<item_struct>.Name) playlists = custom}
			}
		endif
		<i> = (<i> + 1)
		repeat <custom_size>
		if (<total_size> < 5)
			generic_barrel_menu_set_max_expansion max_expansion = <total_size>
		endif
		generic_barrel_menu_finish
	endif
	songlist_manage_playlist_create_default_user_control_helpers
endscript

script songlist_manage_playlist_delete 
	SoundEvent \{event = ui_sfx_select}
	if NOT does_custom_playlist_exist
		LaunchEvent \{Type = unfocus
			target = barrel_menu}
		barrel_menu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0xb5d36d74)
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_manage_playlist_destroy_dialog
					text = qs(0x0e41fe46)
				}
			]
		}
		return
	endif
	destroy_generic_barrel_menu
	songlist_manage_playlist_setup_barrel \{no_options}
	GetArraySize \{$custom_playlists}
	if (<array_Size> > 0)
		songlist_manage_playlist :se_setprops \{songlist_manage_playlists_text_text = qs(0xed733529)}
		event_handlers = [
			{pad_back songlist_manage_playlist_back_to_initial_menu params = {back_sound}}
		]
		barrel_menu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		<i> = 0
		<num_menu_items> = 0
		begin
		if NOT is_playlist_slot_empty playlists = custom slot = <i>
			<num_menu_items> = (<num_menu_items> + 1)
			<item_struct> = (($custom_playlists) [<i>])
			add_generic_barrel_menu_text_item {
				text = (<item_struct>.Name)
				text_focus_color = ($g_songlist_item_focus_rgba)
				text_unfocus_color = ($g_songlist_item_unfocus_rgba)
				pad_choose_script = songlist_manage_playlist_deletion_query
				pad_choose_params = {index = <i>}
			}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<num_menu_items> < 5)
			generic_barrel_menu_set_max_expansion max_expansion = <num_menu_items>
		endif
		generic_barrel_menu_finish
	endif
	songlist_manage_playlist_create_default_user_control_helpers
endscript

script songlist_manage_playlist_clear_query 
	SoundEvent \{event = ui_sfx_select}
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	formatText \{TextName = clear_text
		qs(0xdde7cc6a)}
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <clear_text>
		player_device = ($g_gbm_exclusive_device)
		options = [
			{
				func = songlist_manage_playlist_destroy_dialog
				text = qs(0xf7723015)
			}
			{
				func = songlist_manage_playlist_clear_all
				text = qs(0x326e2d2f)
			}
		]
	}
endscript

script songlist_manage_playlist_clear_all 
	songlist_manage_playlist_destroy_dialog \{no_focus}
	songlist_clear
	SoundEvent \{event = ui_sfx_select}
	Change \{g_songlist_refresh_menus = 1}
	songlist_manage_playlist_back
endscript

script songlist_manage_playlist_shuffle 
	GetArraySize \{$current_playlist}
	SoundEvent \{event = ui_sfx_select}
	if (<array_Size> > 1)
		<i> = 0
		begin
		GetRandomValue a = 0 b = (<array_Size> - <i> - 1) Name = remaining_range integer
		<random_pos> = (<i> + <remaining_range>)
		<temp> = ($current_playlist [<i>])
		SetArrayElement ArrayName = current_playlist globalarray index = <i> NewValue = ($current_playlist [<random_pos>])
		SetArrayElement ArrayName = current_playlist globalarray index = <random_pos> NewValue = <temp>
		<i> = (<i> + 1)
		repeat (<array_Size> - 1)
		Change \{g_songlist_refresh_menus = 1}
	endif
	songlist_manage_playlist_back
endscript

script songlist_manage_playlist_item_focus 
endscript

script songlist_manage_playlist_item_unfocus 
endscript

script songlist_manage_playlist_destroy_dialog 
	destroy_dialog_box
	if NOT GotParam \{no_focus}
		if ScreenElementExists \{id = barrel_menu}
			barrel_menu :se_setprops \{unblock_events}
			LaunchEvent \{Type = focus
				target = barrel_menu}
		else
			songlist_manage_playlist_setup_barrel exclusive_device = <exclusive_device> savegame_device = <savegame_device>
		endif
	else
		LaunchEvent \{Type = unfocus
			target = barrel_menu}
		barrel_menu :se_setprops \{block_events}
	endif
	songlist_manage_playlist_create_default_user_control_helpers
endscript

script songlist_manage_playlist_deletion_query 
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	formatText TextName = deletion_text qs(0x9c3cfb6b) c = ((($custom_playlists) [<index>]).Name)
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <deletion_text>
		player_device = ($g_gbm_exclusive_device)
		options = [
			{
				func = songlist_manage_playlist_destroy_dialog
				text = qs(0xf7723015)
			}
			{
				func = songlist_manage_playlist_deletion_confirm
				func_params = {index = <index>}
				text = qs(0x326e2d2f)
			}
		]
	}
endscript

script songlist_manage_playlist_deletion_confirm 
	RequireParams \{[
			index
		]
		all}
	delete_custom_playlist_slot slot = <index>
	if (<index> = $g_current_loaded_custom_playlist_index)
		Change \{g_current_loaded_custom_playlist_index = -1}
	endif
	songlist_manage_playlist_destroy_dialog
	Change \{g_songlist_manage_playlist_dirty = 1}
	songlist_manage_playlist_back_to_initial_menu
endscript

script songlist_manage_playlist_load_query 
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	if is_a_playlist_loaded
		formatText TextName = load_text qs(0x167cfdb3) c = <text>
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = <load_text>
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_manage_playlist_destroy_dialog
					text = qs(0xf7723015)
				}
				{
					func = songlist_manage_playlist_load_confirm
					func_params = {index = <index> playlists = <playlists>}
					text = qs(0x326e2d2f)
				}
			]
		}
	else
		songlist_manage_playlist_load_confirm index = <index> playlists = <playlists>
	endif
endscript

script songlist_manage_playlist_load_confirm 
	RequireParams \{[
			index
		]
		all}
	songlist_manage_playlist_destroy_dialog \{no_focus}
	songlist_clear
	ExtendCrc <playlists> '_playlists' out = my_playlists
	songlist_manage_playlist_check_relevance {
		playlist = ((($<my_playlists>) [<index>]).playlist)
	}
	if (<list_relevant> = FALSE)
		LaunchEvent \{Type = unfocus
			target = barrel_menu}
		barrel_menu :se_setprops \{block_events}
		getnumplayersingame
		if (<num_players> > 1)
			formatText \{TextName = body_text
				qs(0x44218325)}
		else
			formatText \{TextName = body_text
				qs(0xfbc789d4)}
		endif
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = <body_text>
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_manage_playlist_load_confirm_finish
					func_params = {<...>}
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		songlist_manage_playlist_load_confirm_finish <...>
	endif
endscript

script songlist_manage_playlist_check_relevance playlist = ($current_playlist)
	<list_relevant> = true
	GetArraySize <playlist>
	if (<array_Size> > 0)
		<song_available_list> = []
		<i> = 0
		<available_count> = 0
		begin
		<song> = (<playlist> [<i>])
		<song_allowed> = FALSE
		get_ui_song_struct_items song = <song>
		if NOT GotParam \{song_not_found}
			if song_is_jamsession song = (<ui_struct>.song_checksum)
				gamemode_gettype
				if (<Type> = quickplay)
					<song_allowed> = true
				else
					<song_allowed> = FALSE
				endif
			elseif IsSongAvailable song = <song>
				if issongselectable song = <song>
					<song_allowed> = true
				endif
			endif
		else
			RemoveParameter \{song_not_found}
		endif
		if (<song_allowed> = true)
			AddArrayElement array = <song_available_list> element = true
			<song_available_list> = <array>
			<available_count> = (<available_count> + 1)
		else
			<list_relevant> = FALSE
			AddArrayElement array = <song_available_list> element = FALSE
			<song_available_list> = <array>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<list_relevant> = FALSE)
			<override_array> = []
			<i> = 0
			<override_i> = 0
			begin
			if (<song_available_list> [<i>] = true)
				AddArrayElement array = <override_array> element = (<playlist> [<i>])
				<override_array> = <array>
				<override_i> = (<override_i> + 1)
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if (<list_relevant> = true)
		return list_relevant = <list_relevant>
	else
		return list_relevant = <list_relevant> override_array = <override_array>
	endif
endscript

script songlist_manage_playlist_load_confirm_finish 
	songlist_manage_playlist_destroy_dialog \{no_focus}
	if NOT GotParam \{override_array}
		Change current_playlist = ((($<my_playlists>) [<index>]).playlist)
	else
		Change current_playlist = <override_array>
	endif
	if ScreenElementExists \{id = songlist_detail_playlist}
		songlist_detail_playlist :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	SongList :GetSingleTag \{mode}
	if (<mode> = play_song)
		songlist_manage_playlist_select_create
	else
		Change \{g_songlist_refresh_menus = 1}
		songlist_manage_playlist_back
	endif
	if (<playlists> = custom)
		Change g_current_loaded_custom_playlist_index = <index>
	endif
endscript

script songlist_manage_playlist_back_to_initial_menu 
	destroy_generic_barrel_menu
	songlist_manage_playlist_setup_barrel
	SoundEvent \{event = Generic_Menu_Back_SFX}
	songlist_manage_playlist_create_default_user_control_helpers
endscript

script songlist_manage_playlist_back 
	songlist_manage_playlist :GetTags
	if NOT (<show_more_info_on_enter> = ($g_songlist_show_more_info))
		Change \{g_songlist_manage_playlist_dirty = 1}
	endif
	if NOT (<show_ghtunes_on_enter> = ($g_songlist_show_ghtunes))
		Change \{g_songlist_manage_playlist_dirty = 1}
	endif
	if ($g_songlist_manage_playlist_dirty = 1)
		songlist_manage_playlist_save_and_go_back
		SpawnScriptNow \{menu_music_off}
	else
		SpawnScriptNow \{menu_music_off}
		generic_event_back \{nosound}
		if GotParam \{back_sound}
			SoundEvent \{event = Generic_Menu_Back_SFX}
		endif
	endif
endscript

script songlist_manage_playlist_save_and_go_back 
	gamemode_gettype
	if (<Type> = freeplay)
		ui_event \{event = menu_back
			data = {
				state = uistate_songlist
			}}
	else
		get_savegame_from_controller controller = ($g_gbm_savegame_device)
		SetGlobalTags savegame = <savegame> custom_playlists params = {custom_playlists = ($custom_playlists)}
		SetGlobalTags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_ghtunes = ($g_songlist_show_ghtunes)}
		ui_memcard_autosave_replace \{event = menu_back
			state = uistate_songlist
			is_popup}
	endif
endscript

script songlist_manage_playlist_show_more_info_toggle 
	if ($g_songlist_show_more_info = 0)
		Change \{g_songlist_show_more_info = 1}
		<new_texture> = Options_Controller_Check
		SoundEvent \{event = Box_Check_SFX}
	else
		Change \{g_songlist_show_more_info = 0}
		<new_texture> = Options_Controller_X
		SoundEvent \{event = box_uncheck_sfx}
	endif
	<icon_id> :SetProps texture = <new_texture>
	songlist_detail :Obj_SpawnScriptNow \{songlist_detail_transition
		params = {
			desc = songlist_detail
			force_transition
		}}
endscript

script songlist_manage_playlist_show_ghtunes_toggle 
	if ($g_songlist_show_ghtunes = 0)
		Change \{g_songlist_show_ghtunes = 1}
		<new_texture> = Options_Controller_Check
		SoundEvent \{event = Box_Check_SFX}
		songlist_clear_filterspec
	else
		Change \{g_songlist_show_ghtunes = 0}
		<new_texture> = Options_Controller_X
		SoundEvent \{event = box_uncheck_sfx}
		filterspec = [
			{
				key = song_source
				union_list = [jam]
				comparator = not_equal
			}
		]
		songlist_change_filterspec filterspec = <filterspec>
	endif
	<icon_id> :SetProps texture = <new_texture>
	Change \{g_songlist_refresh_menus = 1}
endscript

script allow_show_ghtunes_toggle 
	gamemode_gettype
	if (<Type> = quickplay)
		SongList :GetTags
		if NOT GotParam \{mode}
			return \{true}
		elseif (<mode> != playlist)
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

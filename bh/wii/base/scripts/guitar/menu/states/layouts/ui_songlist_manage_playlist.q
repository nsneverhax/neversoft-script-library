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
		option_boolean_script = 0x3eb68223
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
		option_boolean_script = 0x3eb68223
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
	sdcardmanagerfunc \{func = push_lock_card}
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	get_savegame_from_controller controller = <savegame_device>
	GetGlobalTags savegame = <savegame> custom_playlists param = custom_playlists
	Change custom_playlists = <custom_playlists>
	Change \{g_songlist_manage_playlist_dirty = 0}
	0xbad9748a
	songlist_manage_playlist :se_setprops \{alpha = 0}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	songlist_manage_playlist :obj_spawnscript \{0x3b059b86
		params = {
			id = songlist_manage_playlist
		}}
	barrel_menu :se_setprops \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_blocking_execute_script
				params = {
					pad_script = songlist_manage_playlist_back
				}
			}
		]
		tags = {
			smooth_morph_time = 0.1
		}}
	songlist_manage_playlist_setup_barrel exclusive_device = <exclusive_device> savegame_device = <savegame_device>
	barrel_menu :se_getprops
	barrel_menu :se_setprops {
		tags = {
			initial_pos = <Pos>
		}
	}
	songlist_manage_playlist_create_default_user_control_helpers
	LaunchEvent \{Type = focus
		target = barrel_menu}
endscript

script 0xbad9748a 
	if ScreenElementExists \{id = songlist_manage_playlist}
		songlist_manage_playlist :GetTags
		<tags> = <...>
		DestroyScreenElement \{id = songlist_manage_playlist}
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'songlist_manage_playlist'
		id = songlist_manage_playlist
		parent = root_window
		z_priority = 99
		songlist_manage_playlist_main_cont_pos = (0.0, 0.0)
		songlist_manage_playlist_selection_bar_alpha = 0.0
		tags = {
			<tags>
			show_more_info_on_enter = ($g_songlist_show_more_info)
			show_ghtunes_on_enter = ($g_songlist_show_ghtunes)
		}
	}
	if songlist_manage_playlist :desc_resolvealias \{Name = alias_songlist_manage_playlist_barrel_cont}
		AssignAlias id = <resolved_id> alias = songlist_manage_playlist_barrel_cont
	else
		ScriptAssert \{qs(0xeb80214d)}
	endif
	if NOT songlist_manage_playlist :desc_resolvealias \{Name = alias_songlist_vmenu
			param = songlist_vmenu}
		SoftAssert \{qs(0x7e5c61d5)}
		return
	endif
	AssignAlias id = <songlist_vmenu> alias = barrel_menu
	barrel_menu :se_setprops \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
		]
		replace_handlers}
endscript

script songlist_manage_playlist_setup_barrel 
	if GotParam \{exclusive_device}
		Change g_gbm_exclusive_device = <exclusive_device>
	endif
	if ScreenElementExists \{id = barrel_menu}
		DestroyScreenElement \{id = barrel_menu
			preserve_parent}
	endif
	barrel_menu :se_setprops {
		event_handlers = [
			{pad_back generic_blocking_execute_script params = {pad_script = songlist_manage_playlist_back}}
			{pad_back generic_menu_pad_back_sound}
		]
		replace_handlers
		exclusive_device = <exclusive_device>
	}
	if GotParam \{savegame_device}
		Change g_gbm_savegame_device = <savegame_device>
	endif
	if NOT GotParam \{no_options}
		songlist_manage_playlist_create_menu_options
	endif
endscript

script songlist_manage_playlist_setup_physics_elements 
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
	sdcardmanagerfunc \{func = 0x2b3134b4}
endscript

script songlist_manage_playlist_cancel_name 
	SoundEvent \{event = Generic_Menu_Back_SFX}
	ui_event event = menu_replace data = {
		is_popup
		state = uistate_songlist_manage_playlist
		exclusive_device = ($g_gbm_exclusive_device)
		savegame_device = ($g_gbm_savegame_device)
	}
	sdcardmanagerfunc \{func = 0x2b3134b4}
endscript

script ui_destroy_songlist_manage_playlist 
	DestroyScreenElement \{id = songlist_manage_playlist}
	clean_up_user_control_helpers
	songlist_create_default_user_control_helpers \{mode = playlist}
	sdcardmanagerfunc \{func = pop_lock_card}
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
					parent = barrel_menu
					icon = <texture>
					focus_script_params = {Scale = 1.2}
					pad_choose_script = (<item_struct>.pad_choose_script)
					pad_choose_sound = nullscript
					icon_first = 1
					dont_force_quit = 1
					menurow_internal_just = [left center]
					menurow_just = [left center]
					menurow_txt_item_internal_just = [left center]
				}
			else
				add_generic_barrel_menu_text_item {
					text = (<item_struct>.text)
					parent = barrel_menu
					focus_script_params = {Scale = 1.2}
					pad_choose_sound = nullscript
					pad_choose_script = (<item_struct>.pad_choose_script)
					menurow_internal_just = [left center]
					menurow_just = [left center]
				}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
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
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	<index> = ($g_current_loaded_custom_playlist_index)
	<playlist_entry> = {
		Name = (($custom_playlists) [<index>].Name)
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = custom_playlists index = <index> NewValue = <playlist_entry> globalarray
	songlist_manage_playlist_save_and_go_back exclusive_device = ($g_gbm_exclusive_device)
endscript

script songlist_manage_playlist_create_new_confirm 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	songlist_manage_playlist_destroy_dialog
	if get_first_empty_custom_playlist_slot
		Change g_first_empty_custom_playlist_slot = <slot>
		formatText TextName = playlist_name qs(0xc0114aa1) i = (<slot> + 1)
		gamemode_gettype
		if ((<Type> != freeplay) && ($g_songlist_manage_playlist_dirty = 1))
			get_savegame_from_controller controller = ($g_gbm_savegame_device)
			SetGlobalTags savegame = <savegame> custom_playlists params = {custom_playlists = ($custom_playlists)}
			SetGlobalTags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_ghtunes = ($g_songlist_show_ghtunes)}
			<event_func> = ui_memcard_autosave_replace
		else
			<event_func> = ui_event
		endif
		sdcardmanagerfunc \{func = 0x1f998e54}
		<event_func> event = menu_replace is_popup data = {
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
	SongList :Obj_SpawnScriptNow \{songlist_create_playlist
		params = {
			no_focus = 1
			no_refresh = 1
			no_detail_transition = 1
		}}
	Change \{g_songlist_refresh_menus = 1}
	songlist_manage_playlist_back
endscript

script songlist_manage_playlist_select_play_one_song 
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	songlist_clear_filterspec
	SongList :Obj_SpawnScriptNow \{songlist_create_play_song
		params = {
			no_focus = 1
			no_refresh = 1
			no_detail_transition = 1
		}}
	Change \{g_songlist_refresh_menus = 1}
	songlist_manage_playlist_back
endscript

script songlist_manage_playlist_load 
	barrel_menu :menu_getselectedindex
	songlist_manage_playlist :SetTags selected_index = <selected_index>
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	if ScreenElementExists \{id = barrel_menu}
		DestroyScreenElement \{id = barrel_menu
			preserve_parent}
	endif
	SoundEvent \{event = ui_sfx_select}
	GetArraySize \{$locked_playlists}
	<locked_size> = <array_Size>
	GetArraySize \{$custom_playlists}
	num_custom_playlists_that_exist
	<custom_size> = <num_custom_playlists>
	<total_size> = (<locked_size> + <custom_size>)
	if (<total_size> > 0)
		scrollbar_alpha = 0
		if (<total_size> > 7)
			<scrollbar_alpha> = 1
		endif
		unfocus_script = generic_barrel_menu_item_unfocus
		sound_script = generic_menu_up_or_down_sound
		if (<total_size> = 1)
			<unfocus_script> = nullscript
			<sound_script> = nullscript
		endif
		songlist_manage_playlist :se_setprops {
			songlist_manage_playlists_text_text = qs(0xf481e489)
			scrollbar_alpha = <scrollbar_alpha>
		}
		event_handlers = [
			{pad_up <sound_script> params = {up}}
			{pad_down <sound_script> params = {down}}
			{pad_back songlist_manage_playlist_back_to_initial_menu params = {back_sound}}
		]
		barrel_menu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		barrel_menu :se_getparentid
		<parent_id> :se_setprops Scale = (0.65000004, 0.65000004)
		barrel_menu :se_setprops \{unblock_events}
		if (<locked_size> > 0)
			<i> = 0
			begin
			if NOT is_playlist_slot_empty playlists = locked slot = <i>
				<item_struct> = (($locked_playlists) [<i>])
				add_generic_barrel_menu_text_item {
					text = (<item_struct>.Name)
					parent = barrel_menu
					text_focus_color = ($g_songlist_item_focus_rgba)
					text_unfocus_color = ($g_songlist_item_unfocus_rgba)
					focus_script_params = {Scale = 1.3}
					unfocus_script = <unfocus_script>
					pad_choose_script = songlist_manage_playlist_load_query
					pad_choose_params = {index = <i> text = (<item_struct>.Name) playlists = locked}
					menurow_just = [left center]
					menurow_internal_just = [left center]
					additional_focus_script = set_generic_menu_scrollbar_pos
					additional_focus_params = {id = songlist_manage_playlist menu_id = barrel_menu 0x586dbcf2 = 35 0xf6e0b026 = 268}
				}
			endif
			<i> = (<i> + 1)
			repeat <locked_size>
		endif
		if (<custom_size> > 0)
			<i> = 0
			begin
			if NOT is_playlist_slot_empty playlists = custom slot = <i>
				<item_struct> = (($custom_playlists) [<i>])
				add_generic_barrel_menu_text_item {
					text = (<item_struct>.Name)
					parent = barrel_menu
					text_focus_color = ($g_songlist_item_focus_rgba)
					text_unfocus_color = ($g_songlist_item_unfocus_rgba)
					focus_script_params = {Scale = 1.3}
					unfocus_script = <unfocus_script>
					pad_choose_script = songlist_manage_playlist_load_query
					pad_choose_params = {index = <i> text = (<item_struct>.Name) playlists = custom}
					menurow_just = [left center]
					menurow_internal_just = [left center]
					additional_focus_script = set_generic_menu_scrollbar_pos
					additional_focus_params = {id = songlist_manage_playlist menu_id = barrel_menu 0x586dbcf2 = 35 0xf6e0b026 = 268}
				}
			endif
			<i> = (<i> + 1)
			repeat <custom_size>
		endif
		LaunchEvent \{Type = focus
			target = barrel_menu
			data = {
				child_index = 0
			}}
	endif
	songlist_manage_playlist_create_default_user_control_helpers
endscript

script songlist_manage_playlist_delete 
	barrel_menu :menu_getselectedindex
	songlist_manage_playlist :SetTags selected_index = <selected_index>
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
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
	if ScreenElementExists \{id = barrel_menu}
		DestroyScreenElement \{id = barrel_menu
			preserve_parent}
	endif
	GetArraySize \{$custom_playlists}
	num_custom_playlists_that_exist
	if (<array_Size> > 0)
		scrollbar_alpha = 0
		if (<num_custom_playlists> > 7)
			<scrollbar_alpha> = 1
		endif
		unfocus_script = generic_barrel_menu_item_unfocus
		sound_script = generic_menu_up_or_down_sound
		if (<num_custom_playlists> = 1)
			<unfocus_script> = nullscript
			<sound_script> = nullscript
		endif
		songlist_manage_playlist :se_setprops {
			songlist_manage_playlists_text_text = qs(0xed733529)
			scrollbar_alpha = <scrollbar_alpha>
		}
		event_handlers = [
			{pad_up <sound_script> params = {up}}
			{pad_down <sound_script> params = {down}}
			{pad_back songlist_manage_playlist_back_to_initial_menu params = {back_sound}}
		]
		barrel_menu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		barrel_menu :se_getparentid
		<parent_id> :se_setprops Scale = (0.65000004, 0.65000004)
		<i> = 0
		<num_menu_items> = 0
		begin
		if NOT is_playlist_slot_empty playlists = custom slot = <i>
			<num_menu_items> = (<num_menu_items> + 1)
			<item_struct> = (($custom_playlists) [<i>])
			add_generic_barrel_menu_text_item {
				text = (<item_struct>.Name)
				parent = barrel_menu
				text_focus_color = ($g_songlist_item_focus_rgba)
				text_unfocus_color = ($g_songlist_item_unfocus_rgba)
				focus_script_params = {Scale = 1.3}
				unfocus_script = <unfocus_script>
				pad_choose_script = songlist_manage_playlist_deletion_query
				pad_choose_params = {index = <i>}
				menurow_just = [left center]
				menurow_internal_just = [left center]
				additional_focus_script = set_generic_menu_scrollbar_pos
				additional_focus_params = {id = songlist_manage_playlist menu_id = barrel_menu 0x586dbcf2 = 35 0xf6e0b026 = 268}
			}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		LaunchEvent \{Type = focus
			target = barrel_menu
			data = {
				child_index = 0
			}}
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
	0xbad9748a
	songlist_manage_playlist_setup_barrel
	barrel_menu :GetSingleTag \{initial_pos}
	barrel_menu :se_setprops Pos = <initial_pos>
	SoundEvent \{event = Generic_Menu_Back_SFX}
	songlist_manage_playlist_create_default_user_control_helpers
	songlist_manage_playlist :GetSingleTag \{selected_index}
	LaunchEvent Type = focus target = barrel_menu data = {child_index = <selected_index>}
endscript

script songlist_manage_playlist_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	LaunchEvent \{Type = unfocus
		target = barrel_menu}
	barrel_menu :se_setprops \{block_events}
	0xfe332183 \{id = songlist_manage_playlist}
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
	0xfe332183 \{id = songlist_manage_playlist}
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
	if ScreenElementExists id = <container_id>
		<container_id> :SetProps menurow_ico_item_texture = <new_texture>
	endif
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
	if ScreenElementExists id = <container_id>
		<container_id> :SetProps menurow_ico_item_texture = <new_texture>
	endif
	Change \{g_songlist_refresh_menus = 1}
endscript

script 0x3eb68223 
	gamemode_gettype
	if (<Type> = competitive)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script allow_show_ghtunes_toggle 
	gamemode_gettype
	if (<Type> = quickplay)
		SongList :GetTags
		if NOT GotParam \{mode}
			return \{true}
		elseif (<mode> != playlist && <mode> != music_store && <mode> != archive)
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script 0x3b059b86 \{id = songlist_manage_playlist}
	if ScreenElementExists id = <id>
		se_setprops \{songlist_manage_playlist_cont_pos = (-640.0, 0.0)
			alpha = 0}
		se_waitprops
		se_setprops \{songlist_manage_playlist_cont_pos = (5.0, 0.0)
			alpha = 1
			time = 0.2
			motion = ease_in}
		se_waitprops
		se_setprops \{songlist_manage_playlist_cont_pos = (-2.0, 0.0)
			alpha = 1
			time = 0.2
			motion = ease_out}
		se_waitprops
		se_setprops \{songlist_manage_playlist_cont_pos = (0.0, 0.0)
			alpha = 1
			time = 0.2
			motion = ease_in}
		se_waitprops
	endif
endscript

script 0xfe332183 \{id = songlist_manage_playlist}
	if ScreenElementExists id = <id>
		<id> :se_setprops songlist_manage_playlist_cont_pos = (-640.0, 0.0) alpha = 0 time = 0.2 motion = ease_out
		<id> :se_waitprops
	endif
endscript

script 0x8b579082 
	0xfe332183 \{id = songlist_manage_playlist}
	generic_event_back
endscript

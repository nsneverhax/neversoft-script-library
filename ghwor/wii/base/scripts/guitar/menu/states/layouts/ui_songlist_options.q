g_songlist_options_item_unfocus_rgba = [
	205
	185
	123
	255
]
g_songlist_options_item_focus_rgba = [
	249
	243
	190
	255
]
g_songlist_options_item_invalid_rgba = [
	170
	149
	83
	80
]
main_songlist_options = [
	{
		text = qs(0xa68ba095)
		pad_choose_script = songlist_main_options_play_song
		option_boolean_script = allow_play_song_option
		force_add = 1
		default_focus = 1
	}
	{
		text = qs(0x56ce7c26)
		option_boolean_script = allow_view_awards_option
		pad_choose_script = songlist_main_options_view_awards_help_page
	}
	{
		text = qs(0x6579b990)
		pad_choose_script = songlist_main_options_add_to_playlist
		option_boolean_script = allow_add_to_playlist_option
		default_focus = 1
	}
	{
		text = qs(0x7ef467a3)
		pad_choose_script = songlist_main_options_remove_from_playlist
		default_focus = 1
	}
	{
		text = qs(0x69494c03)
		pad_choose_script = songlist_main_options_download_similar
		option_boolean_script = allow_download_similar_songs_option
	}
	{
		text = qs(0x0c9cc77e)
		pad_choose_script = songlist_main_options_random_songs
		option_boolean_script = allow_random_songs_option
	}
	{
		text = qs(0xe2c7c0a4)
		pad_choose_script = songlist_main_options_go_to_playlist_options
	}
	{
		text = qs(0x04c18b76)
		pad_choose_script = songlist_main_options_go_to_display_options
	}
]
playlist_songlist_options = [
	{
		text = qs(0x54ba1bc5)
		pad_choose_script = songlist_options_clear_query
		option_boolean_script = is_a_playlist_loaded
	}
	{
		text = qs(0xf481e489)
		pad_choose_script = songlist_options_load
	}
	{
		text = qs(0x1840c8c2)
		pad_choose_script = songlist_options_save
		option_boolean_script = allow_songlist_options_writes
	}
	{
		text = qs(0x612ddd8d)
		pad_choose_script = songlist_options_shuffle
		option_boolean_script = is_a_playlist_loaded
	}
	{
		text = qs(0xed733529)
		pad_choose_script = songlist_options_delete
		option_boolean_script = allow_songlist_options_writes
	}
]
display_songlist_options = [
	{
		text = qs(0x8704b183)
		textureon = Options_Controller_Check
		textureoff = Options_Controller_X
		toggle_checksum = g_songlist_show_more_info
		pad_choose_script = songlist_options_show_more_info_toggle
	}
	{
		generate_option_text_script = songlist_options_generate_show_ghtunes_option_text
		textureon = Options_Controller_Check
		textureoff = Options_Controller_X
		toggle_checksum = g_songlist_show_ghtunes
		pad_choose_script = songlist_options_show_ghtunes_toggle
		option_boolean_script = allow_show_ghtunes_toggle
	}
]
music_store_songlist_options = [
]
songlist_options_ready_to_proceed = 0
g_songlist_options_dirty = 0
g_songlist_refresh_menus = 0
g_first_empty_custom_playlist_slot = 0
g_current_loaded_custom_playlist_index = -1
g_songlist_show_more_info = 0
g_songlist_show_ghtunes = 1
g_gbm_exclusive_device = 0
g_gbm_savegame_device = 0

script ui_create_songlist_options 
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	<passed_in_type> = <Type>
	if (<passed_in_type> = main)
		get_savegame_from_controller controller = <savegame_device>
		GetGlobalTags savegame = <savegame> custom_playlists param = custom_playlists
		Change custom_playlists = <custom_playlists>
	endif
	Change \{g_songlist_options_dirty = 0}
	CreateScreenElement \{Type = descinterface
		desc = 'songlist_options'
		id = songlist_options
		parent = root_window
		z_priority = 150
		Pos = (0.0, 0.0)
		songlist_options_vmenu_spacing_between = 1}
	songlist_options :se_getprops
	final_pos = <songlist_options_main_cont_pos>
	start_pos = (<final_pos> + (300.0, 0.0))
	songlist_options :se_setprops songlist_options_main_cont_pos = <start_pos>
	songlist_options :se_waitprops
	songlist_options :se_setprops songlist_options_main_cont_pos = (<final_pos> + (-3.0, 0.0)) motion = ease_in time = 0.1
	songlist_options :se_waitprops
	songlist_options :se_setprops songlist_options_main_cont_pos = <final_pos> motion = ease_out time = 0.1
	songlist_options :se_waitprops
	if songlist_options :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		AssignAlias id = <resolved_id> alias = songlist_options_scrollbar_wgt
		songlist_options :se_setprops \{songlist_options_scrollbar_cont_alpha = 1.0}
		generic_scrollbar_wgt_initialize \{id = songlist_options_scrollbar_wgt}
	else
		ScriptAssert \{qs(0x7631f46d)}
	endif
	songlist_options :SetTags {
		show_more_info_on_enter = ($g_songlist_show_more_info)
		show_ghtunes_on_enter = ($g_songlist_show_ghtunes)
	}
	if (<passed_in_type> = main)
		<song_options_bool_array> = [1 1]
		AddArrayElement array = <song_options_bool_array> element = (<song_options_struct>.add_song)
		<song_options_bool_array> = <array>
		AddArrayElement array = <song_options_bool_array> element = (<song_options_struct>.remove_song)
		<song_options_bool_array> = <array>
		<song_item_id> :se_getprops songlist_item_text_text
		songlist_options :SetTags {
			title_text = <songlist_item_text_text>
			song_item_id = <song_item_id>
			song_options_bool_array = <song_options_bool_array>
		}
		songlist_options_keep_focus id = <song_item_id>
	elseif (<passed_in_type> = music_store)
		Change \{music_store_songlist_options = [
			]}
		if ((<purchase_struct>.Type = patch) || (<purchase_struct>.Type = import))
			<title_text> = qs(0x976cf9e7)
		else
			<song_item_id> :se_getprops songlist_item_text_text
			<title_text> = <songlist_item_text_text>
		endif
		songlist_options :SetTags {
			purchase_checksum = (<purchase_struct>.song_checksum)
			title_text = <title_text>
		}
		songlist_options_keep_focus id = <song_item_id>
		if (<purchase_struct>.Type = song)
			<element> = {
				text = qs(0xdfb2b37f)
				pad_choose_script = songlist_options_music_store_preview_song
				pad_choose_params = {song_preview_asset_name = (<purchase_struct>.song_preview_asset_name)}
			}
			AddArrayElement array = ($music_store_songlist_options) element = <element>
			Change music_store_songlist_options = <array>
		endif
		is_album_pack_only = 0
		if (StructureContains structure = purchase_struct album_pack_only)
			is_album_pack_only = 1
		endif
		if (<purchase_struct>.purchased = 1 && <is_album_pack_only> = 0)
			<element> = {
				text = qs(0xe4742919)
				pad_choose_script = songlist_options_music_store_purchase_accepted
				pad_choose_params = {purchase_struct = <purchase_struct>}
			}
			AddArrayElement array = ($music_store_songlist_options) element = <element>
			Change music_store_songlist_options = <array>
		else
			if (<purchase_struct>.Type = patch)
				<element> = {
					text = qs(0x50535f0e)
					pad_choose_script = songlist_options_music_store_purchase_accepted
					pad_choose_params = {purchase_struct = <purchase_struct>}
				}
				AddArrayElement array = ($music_store_songlist_options) element = <element>
				Change music_store_songlist_options = <array>
			elseif (<purchase_struct>.Type = import)
				<element> = {
					text = qs(0xd26ec3cb)
					pad_choose_script = songlist_options_music_store_purchase_accepted
					pad_choose_params = {purchase_struct = <purchase_struct>}
				}
				AddArrayElement array = ($music_store_songlist_options) element = <element>
				Change music_store_songlist_options = <array>
				<element> = {
					pad_choose_script = music_store_purchase_new_view_go_back
					pad_choose_params = {purchase_struct = <purchase_struct> Type = SongList previous = special_offers}
					text = qs(0xc1621163)
				}
				AddArrayElement array = ($music_store_songlist_options) element = <element>
				Change music_store_songlist_options = <array>
			elseif (<purchase_struct>.Type = song)
				if NOT StructureContains \{structure = purchase_struct
						album_pack_only}
					<element> = {
						text = qs(0xe6d6f69f)
						pad_choose_script = songlist_options_music_store_purchase_accepted
						pad_choose_params = {purchase_struct = <purchase_struct>}
					}
					AddArrayElement array = ($music_store_songlist_options) element = <element>
					Change music_store_songlist_options = <array>
				endif
				if StructureContains \{structure = purchase_struct
						pack_list}
					<pack_list> = (<purchase_struct>.pack_list)
					GetArraySize <pack_list>
					if (<array_Size> > 0)
						AddArrayElement array = <pack_list> element = (<purchase_struct>.song_checksum)
						<filterspec> = [
							{
								key = song_checksum
								union_list = <array>
								comparator = equal
							}
						]
						if NOT songlist_options_music_store_request_page_when_ready {
								filterspec = <filterspec>
							}
							return
						endif
						begin
						if ($songlist_options_ready_to_proceed = 1)
							Change \{songlist_options_ready_to_proceed = 0}
							break
						endif
						Wait \{1
							gameframe}
						repeat
					endif
				endif
			else
				<element> = {
					text = qs(0xe6d6f69f)
					pad_choose_script = songlist_options_music_store_purchase_accepted
					pad_choose_params = {purchase_struct = <purchase_struct>}
				}
				AddArrayElement array = ($music_store_songlist_options) element = <element>
				Change music_store_songlist_options = <array>
				if ($g_music_store_viewing_pack_songs = 0)
					if StructureContains \{structure = purchase_struct
							pack_list}
						<pack_list> = (<purchase_struct>.pack_list)
						GetArraySize <pack_list>
						if (<array_Size> > 0)
							if NOT StructureContains \{structure = purchase_struct
									album_pack_only}
								<element> = {
									text = qs(0xc1621163)
									pad_choose_script = songlist_options_music_store_view_song_in_pack_go_back
									pad_choose_params = {pack_struct = <purchase_struct>}
								}
								AddArrayElement array = ($music_store_songlist_options) element = <element>
								Change music_store_songlist_options = <array>
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	if songlist_options :desc_resolvealias \{Name = alias_songlist_options_vmenu}
		AssignAlias id = <resolved_id> alias = songlist_options_vmenu
		songlist_options_vmenu :se_setprops \{event_handlers = [
				{
					menu_selection_changed
					ui_sfx
					params = {
						menustate = Generic
						uitype = scrollup
					}
				}
			]
			replace_handlers}
	else
		ScriptAssert \{qs(0x16858aa6)}
	endif
	if songlist_options :desc_resolvealias \{Name = alias_songlist_options_smenu}
		AssignAlias id = <resolved_id> alias = songlist_options_smenu
		songlist_options_smenu :SetTags \{treat_not_focusable_as_header}
	else
		ScriptAssert \{qs(0x5d0c7d66)}
	endif
	songlist_options_setup_menu {
		exclusive_device = <exclusive_device>
		savegame_device = <savegame_device>
		Type = <passed_in_type>
	}
	songlist_options_create_default_user_control_helpers
	LaunchEvent Type = focus target = songlist_options_vmenu data = {child_index = <focus_index>}
endscript

script ui_return_songlist_options 
	if GotParam \{bypass_return_script}
		if (($g_songlist_refresh_menus) = 1)
			Change \{g_songlist_refresh_menus = 0}
		endif
		ui_event_remove_params \{param = bypass_return_script}
		ui_event_remove_params \{param = bypass_return_params}
		if GotParam \{no_pivot}
			ui_event_remove_params \{param = no_pivot}
		endif
		SongList :Obj_SpawnScriptNow <bypass_return_script> params = {<bypass_return_params> no_pivot = 1}
		return
	endif
	songlist_options_create_default_user_control_helpers
endscript

script songlist_options_sd_event 
	generic_event_back \{state = uistate_songlist}
endscript

script songlist_options_setup_menu \{Type = main}
	if GotParam \{exclusive_device}
		Change g_gbm_exclusive_device = <exclusive_device>
	endif
	if GotParam \{savegame_device}
		Change g_gbm_savegame_device = <savegame_device>
	endif
	if ((<Type> = main) || (<Type> = sort) || (<Type> = Jump) || (<Type> = music_store))
		songlist_options_vmenu :se_setprops {
			event_handlers = [
				{pad_back songlist_options_back}
				{sdcard_event songlist_options_sd_event}
			]
			exclusive_device = ($g_gbm_exclusive_device)
			replace_handlers
		}
	elseif (<Type> = import_view)
		songlist_options_vmenu :se_setprops {
			event_handlers = [
				{pad_back songlist_options_go_to_menu params = {Type = music_store use_back_index = 1}}
				{sdcard_event songlist_options_sd_event}
			]
			exclusive_device = ($g_gbm_exclusive_device)
			replace_handlers
		}
	else
		songlist_options_vmenu :se_setprops {
			event_handlers = [
				{pad_back songlist_options_go_to_menu params = {Type = main use_back_index = 1}}
				{sdcard_event songlist_options_sd_event}
			]
			exclusive_device = ($g_gbm_exclusive_device)
			replace_handlers
		}
	endif
	if NOT GotParam \{no_options}
		if (<Type> = import_view)
			songlist_options_create_menu_options Type = <Type> purchase_struct = <purchase_struct>
		else
			songlist_options_create_menu_options Type = <Type>
		endif
	endif
	return focus_index = <focus_index>
endscript

script songlist_options_create_default_user_control_helpers \{no_green_button = 0}
	clean_up_user_control_helpers
	if (<no_green_button> = 0)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script songlist_options_accept_name 
	GetArraySize \{$custom_playlists}
	<i> = 0
	begin
	if ((($custom_playlists) [<i>]).Name = <text>)
		formatText TextName = warning_text qs(0x52b92bd3) n = <text>
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = <warning_text>
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_options_refresh_edit_name
					text = qs(0x0e41fe46)
				}
			]
		}
		return
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	SoundEvent \{event = audio_ui_text_entry_finish}
	Change g_current_loaded_custom_playlist_index = ($g_first_empty_custom_playlist_slot)
	<playlist_entry> = {
		Name = <text>
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = custom_playlists index = ($g_first_empty_custom_playlist_slot) NewValue = <playlist_entry> globalarray
	songlist_options_save_and_go_back exclusive_device = ($g_gbm_exclusive_device)
endscript

script songlist_options_refresh_edit_name 
	songlist_options_destroy_dialog \{no_focus = 1}
	ui_event \{event = menu_refresh}
endscript

script songlist_options_cancel_name 
	ui_sfx \{menustate = setlist
		uitype = back}
	ui_event event = menu_back data = {
		state = uistate_songlist_options
		exclusive_device = ($g_gbm_exclusive_device)
		savegame_device = ($g_gbm_savegame_device)
	}
	songlist_options_vmenu :se_setprops \{unblock_events}
endscript

script ui_destroy_songlist_options 
	DestroyScreenElement \{id = songlist_options}
	clean_up_user_control_helpers
	songlist_create_default_user_control_helpers \{mode = playlist}
endscript

script songlist_options_create_menu_options \{Type = main}
	if ((<Type> = main) || (<Type> = playlist) || (<Type> = display) || (<Type> = music_store))
		if (<Type> = main || <Type> = music_store)
			songlist_options :GetSingleTag \{title_text}
		elseif (<Type> = playlist)
			<title_text> = qs(0x69f92c4f)
		elseif (<Type> = display)
			<title_text> = qs(0x1b24235a)
		endif
		songlist_options :se_setprops {
			songlist_options_text_text = <title_text>
		}
		ExtendCrc <Type> '_songlist_options' out = options_array
		GetArraySize $<options_array>
		<options_array_size> = <array_Size>
		if (<options_array_size> > 0)
			<num_menu_items> = 0
			<i> = 0
			begin
			<item_struct> = ($<options_array> [<i>])
			<continue> = 1
			if StructureContains structure = <item_struct> pad_choose_params
				<pad_choose_params> = (<item_struct>.pad_choose_params)
			else
				<pad_choose_params> = {}
			endif
			<option_boolean_params> = {}
			if (<Type> = main)
				songlist_options :GetSingleTag \{song_options_bool_array}
				songlist_options :GetSingleTag \{song_item_id}
				<pad_choose_params> = {
					<pad_choose_params>
					song_item_id = <song_item_id>
				}
				<option_boolean_params> = {song_item_id = <song_item_id>}
				GetArraySize <song_options_bool_array>
				if (<i> < <array_Size>)
					if (<song_options_bool_array> [<i>] = 0)
						<continue> = 0
					endif
				endif
			endif
			if StructureContains structure = <item_struct> option_boolean_script
				if NOT (<item_struct>.option_boolean_script) <option_boolean_params>
					<continue> = 0
				endif
			endif
			<common_params> = {
				text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
			}
			if (<continue> = 0)
				if StructureContains structure = <item_struct> force_add
					<continue> = 1
					<common_params> = {
						text_unfocus_color = ($g_songlist_options_item_invalid_rgba)
						not_focusable
					}
				endif
			endif
			if (<continue> = 1)
				<num_menu_items> = (<num_menu_items> + 1)
				if StructureContains structure = <item_struct> generate_option_text_script
					(<item_struct>.generate_option_text_script)
				else
					<option_text> = (<item_struct>.text)
				endif
				<common_params> = {
					<common_params>
					text = <option_text>
					text_focus_color = ($g_songlist_options_item_focus_rgba)
					pad_choose_script = (<item_struct>.pad_choose_script)
					pad_choose_params = <pad_choose_params>
				}
				if StructureContains structure = <item_struct> not_focusable
					<common_params> = {
						<common_params>
						not_focusable
						text_unfocus_color = ($g_songlist_options_item_invalid_rgba)
					}
				endif
				if NOT StructureContains structure = <common_params> not_focusable
					if NOT GotParam \{focus_index}
						if StructureContains structure = <item_struct> default_focus
							<focus_index> = (<num_menu_items> - 1)
						endif
					endif
				endif
				if StructureContains structure = <item_struct> toggle_checksum
					<toggle_checksum> = (<item_struct>.toggle_checksum)
					if (($<toggle_checksum>) = 0)
						<texture> = (<item_struct>.textureoff)
					else
						<texture> = (<item_struct>.textureon)
					endif
					songlist_options_add_item {
						<common_params>
						icon = <texture>
						icon_first = 0
						dont_force_quit = 1
					}
				else
					songlist_options_add_item {
						<common_params>
					}
				endif
			endif
			<i> = (<i> + 1)
			repeat <options_array_size>
			generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <num_menu_items>
		endif
	elseif (<Type> = sort)
		songlist_options :se_setprops \{songlist_options_text_text = qs(0x00a93373)}
		GetArraySize \{$g_songlist_sort_array}
		if (<array_Size> > 0)
			songlist_get_sort_key
			<i> = 0
			<num_items> = 0
			begin
			<visibility> = (($g_songlist_sort_array) [<i>].visibility)
			if (<visibility> = Always)
				<item_is_valid> = 1
			elseif (<visibility> = never)
				<item_is_valid> = 0
			else
				songlist_component :membfunc_songlist_uistack_getmode
				if (<mode> != music_store && <visibility> = songlist_only)
					<item_is_valid> = 1
				elseif (<mode> = music_store && <visibility> = store_only)
					<item_is_valid> = 1
				else
					<item_is_valid> = 0
				endif
			endif
			if (<item_is_valid> = 1)
				if StructureContains structure = (($g_songlist_sort_array) [<i>]) extra_boolean_script
					if NOT ((($g_songlist_sort_array) [<i>]).extra_boolean_script)
						<item_is_valid> = 0
					endif
				endif
			endif
			if (<item_is_valid> = 1)
				songlist_options_add_item {
					text = (($g_songlist_sort_array) [<i>].text)
					text_focus_color = ($g_songlist_options_item_focus_rgba)
					text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
					pad_choose_script = songlist_options_sort
					pad_choose_params = {index = <i>}
					dont_force_quit = 1
				}
				if NOT GotParam \{focus_index}
					if (<sort_key> = (($g_songlist_sort_array) [<i>].key))
						<focus_index> = <num_items>
					endif
				endif
				<num_items> = (<num_items> + 1)
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <num_items>
		endif
	elseif (<Type> = Jump)
		formatText TextName = jump_title qs(0xf1a849d1) s = (($g_songlist_sort_array [($g_songlist_sort_index)]).text)
		songlist_options :se_setprops {
			songlist_options_text_text = <jump_title>
		}
		<header_type> = (($g_songlist_sort_array [($g_songlist_sort_index)]).header_type)
		GetScreenElementChildren \{id = current_menu}
		if GotParam \{children}
			current_menu :GetSingleTag \{tag_selected_index}
			if (<tag_selected_index> > 0)
				<j> = (<tag_selected_index> - 1)
				begin
				(<children> [<j>]) :GetSingleTag header
				if (<header> = 1)
					(<children> [<j>]) :GetSingleTag header_struct
				endif
				<j> = (<j> - 1)
				repeat <tag_selected_index>
			endif
		endif
		<header_array> = (($g_songlist_headers).<header_type>)
		GetArraySize <header_array>
		if (<array_Size> > 0)
			<i> = 0
			begin
			<curr_header_struct> = (<header_array> [<i>])
			if NOT StructureContains structure = <curr_header_struct> header_text_override
				<text> = (<curr_header_struct>.header_text)
			else
				<text> = (<curr_header_struct>.header_text_override)
			endif
			<params> = {
				text = <text>
				text_focus_color = ($g_songlist_options_item_focus_rgba)
				text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
				pad_choose_script = songlist_options_jump_to_header
				pad_choose_params = {header_type = <header_type> header_struct = <curr_header_struct> index = <i>}
				dont_force_quit = 1
			}
			if StructureContains structure = <curr_header_struct> valid
				if (<curr_header_struct>.valid = 0)
					<params> = {
						<params>
						not_focusable
						text_unfocus_color = ($g_songlist_options_item_invalid_rgba)
					}
				endif
			endif
			songlist_options_add_item {
				<params>
			}
			if NOT GotParam \{focus_index}
				if NOT GotParam \{header_struct}
					songlist_component :GetSingleTag \{sticky_header_struct}
					if (<sticky_header_struct>.header_text = <curr_header_struct>.header_text)
						<focus_index> = <i>
					endif
				else
					if (<header_struct>.header_text = <curr_header_struct>.header_text)
						<focus_index> = <i>
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <array_Size>
		endif
	elseif (<Type> = import_view)
		songlist_options :se_setprops \{songlist_options_text_text = qs(0xc73c962a)}
		<content_array> = (<purchase_struct>.contents)
		GetArraySize <content_array>
		if (<array_Size> > 0)
			<i> = 0
			begin
			<content_struct> = (<content_array> [<i>])
			CreateScreenElement {
				Type = descinterface
				desc = 'import_item'
				parent = songlist_options_vmenu
				autosizedims = true
				import_item_text_text = (<content_struct>.title)
				import_item_sub_text_text = (<content_struct>.artist)
				import_item_text_rgba = ($g_music_store_item_unfocus_rgba)
				import_item_sub_text_rgba = ($g_music_store_sub_item_unfocus_rgba)
			}
			<id> :se_setprops {
				event_handlers = [
					{focus songlist_options_import_view_focus params = {id = <id>}}
					{unfocus songlist_options_import_view_unfocus params = {id = <id>}}
				]
			}
			<i> = (<i> + 1)
			repeat <array_Size>
			generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <array_Size>
		endif
	endif
	return focus_index = <focus_index>
endscript

script allow_download_similar_songs_option 
	if isngc
		return \{FALSE}
	endif
	get_savegame_from_controller controller = ($g_gbm_savegame_device)
	if songlist_allow_music_store_toggling
		<song_item_id> :GetSingleTag song_checksum
		get_ui_song_struct_items song = <song_checksum> savegame = <savegame>
		if song_is_jamsession song = (<ui_struct>.song_checksum)
			return \{FALSE}
		else
			return \{true}
		endif
	else
		return \{FALSE}
	endif
endscript

script allow_popularity_sort_option 
	<total_plays_check> = 13
	<total_songs_played_check> = 7
	songlist_component :membfunc_songlist_uistack_getpopularitysortinfo
	if ((<total_plays> >= <total_plays_check>) && (<total_songs_played> >= <total_songs_played_check>))
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script allow_stars_sort_option 
	gamemode_gettype
	if (<Type> = quickplay)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script songlist_options_add_item {
		text_unfocus_color = ($menu_unfocus_color)
		text_focus_color = ($menu_focus_color)
		just = [left center]
	}
	<params> = {
		Type = descinterface
		parent = songlist_options_vmenu
		autosizedims = true
		menurow_txt_item_text = <text>
		menurow_highlight_bar_dims = (480.0, 48.0)
		menurow_txt_item_font = fontgrid_text_a1
		menurow_txt_item_rgba = <text_unfocus_color>
		menurow_txt_item_dims = (400.0, 40.0)
		menurow_just = <just>
		menurow_internal_just = <just>
		menurow_highlight_bar_pos = (200.0, -5.0)
		menurow_txt_desc_hmenu_pos = (0.0, 28.0)
		tags = {
			text_unfocus_color = <text_unfocus_color>
			text_focus_color = <text_focus_color>
		}
	}
	if NOT GotParam \{icon}
		<params> = {
			<params>
			desc = 'menurow_txt_desc'
			event_handlers = [
				{pad_up ui_sfx params = {menustate = setlist uitype = scrollup}}
				{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
				{focus songlist_options_focus params = {id = <id>}}
				{unfocus songlist_options_unfocus params = {id = <id>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
			]
		}
	else
		formatText \{checksumName = menurow_ico_item
			'menurow_ico_item_%i'
			i = $g_num_menu_items_with_icon}
		Change g_num_menu_items_with_icon = ($g_num_menu_items_with_icon + 1)
		<params> = {
			<params>
			menurow_ico_item_texture = <icon>
			event_handlers = [
				{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
				{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
				{focus songlist_options_focus params = {id = <id>}}
				{unfocus songlist_options_unfocus params = {id = <id>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params> icon_id = <menurow_ico_item>}}}
			]
		}
		if (<icon_first> = 1)
			<params> = {
				<params>
				desc = 'menurow_ico_txt_desc'
			}
		else
			<params> = {
				<params>
				desc = 'menurow_txt_ico_desc'
				menurow_highlight_bar_pos = (-140.0, 2.0)
				menurow_txt_ico_desc_hmenu_pos = (0.0, 28.0)
			}
		endif
	endif
	CreateScreenElement {
		<params>
	}
	if <id> :desc_resolvealias Name = alias_menurow_ico_item
		AssignAlias id = <resolved_id> alias = <menurow_ico_item>
	endif
	if GotParam \{not_focusable}
		<id> :se_setprops not_focusable
	endif
endscript

script songlist_options_focus \{time = 0.05}
	text_focus_color = ($menu_focus_color)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :GetSingleTag text_focus_color
	<id> :se_setprops {
		menurow_txt_item_font = fontgrid_text_a1
		menurow_txt_item_rgba = <text_focus_color>
		menurow_highlight_bar_alpha = 1.0
		motion = ease_in
		time = <time>
	}
	songlist_options_vmenu :GetSingleTag \{tag_selected_index}
	generic_scrollbar_wgt_update_thumb_pos id = songlist_options_scrollbar_wgt index = <tag_selected_index>
endscript

script songlist_options_unfocus \{time = 0.0}
	text_unfocus_color = ($menu_unfocus_color)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :GetSingleTag text_unfocus_color
	<id> :se_setprops {
		menurow_txt_item_font = fontgrid_text_a1
		menurow_txt_item_rgba = <text_unfocus_color>
		menurow_highlight_bar_alpha = 0.0
		motion = ease_in
		time = <time>
	}
endscript

script songlist_options_import_view_focus 
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		import_item_text_rgba = ($g_music_store_item_focus_rgba)
		import_item_sub_text_rgba = ($g_music_store_sub_item_focus_rgba)
		import_highlight_bar_alpha = 1.0
		motion = ease_in
		time = <time>
	}
	songlist_options_vmenu :GetSingleTag \{tag_selected_index}
	generic_scrollbar_wgt_update_thumb_pos id = songlist_options_scrollbar_wgt index = <tag_selected_index>
endscript

script songlist_options_import_view_unfocus 
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		import_item_text_rgba = ($g_music_store_item_unfocus_rgba)
		import_item_sub_text_rgba = ($g_music_store_sub_item_unfocus_rgba)
		import_highlight_bar_alpha = 0.0
		motion = ease_in
		time = <time>
	}
endscript

script songlist_options_jump_to_header \{header_type = !q1768515945
		header_struct = 0x69696969
		index = !i1768515945}
	switch <header_type>
		case alphabetical
		case genre
		case Source
		if NOT StructureContains structure = <header_struct> seek_first
			<text> = (<header_struct>.header_text)
		else
			<text> = (<header_struct>.seek_first)
		endif
		Change g_songlist_seek_first = <text>
		case year
		case Duration
		case Intensity
		case stars
		Change g_songlist_seek_first = (<header_struct>.lower)
		case popularity
		songlist_component :membfunc_songlist_uistack_getpopularitysortseekfirstdata index = <index>
		if GotParam \{seek_first_data}
			Change g_songlist_seek_first = <seek_first_data>
		endif
	endswitch
	Change \{g_songlist_refresh_menus = 1}
	Change \{g_songlist_requires_unblock = 1}
	if NOT GotParam \{seek_checksum}
		generic_event_back \{data = {
				no_pivot
			}}
	else
		generic_event_back data = {pivot_checksum = <seek_checksum>}
	endif
endscript

script songlist_options_sort \{index = !i1768515945}
	songlist_sort index = <index>
	generic_event_back \{data = {
			no_focus = 1
		}}
endscript

script songlist_options_save 
	ui_sfx \{menustate = setlist
		uitype = select}
	if NOT is_a_playlist_loaded
		LaunchEvent \{Type = unfocus
			target = songlist_options_vmenu}
		songlist_options_vmenu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0x7d6a4901)
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_options_destroy_dialog
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		if ($g_current_loaded_custom_playlist_index = -1)
			if get_first_empty_custom_playlist_slot
				songlist_options_create_new_confirm index = <slot> exclusive_device = ($g_gbm_exclusive_device)
			else
				LaunchEvent \{Type = unfocus
					target = songlist_options_vmenu}
				songlist_options_vmenu :se_setprops \{block_events}
				create_dialog_box {
					heading_text = qs(0xaa163738)
					body_text = qs(0x7764e154)
					player_device = ($g_gbm_exclusive_device)
					options = [
						{
							func = songlist_options_destroy_dialog
							text = qs(0x0e41fe46)
						}
					]
				}
			endif
		else
			LaunchEvent \{Type = unfocus
				target = songlist_options_vmenu}
			songlist_options_vmenu :se_setprops \{block_events}
			create_dialog_box {
				heading_text = qs(0xaa163738)
				body_text = qs(0xfdbc4b34)
				player_device = ($g_gbm_exclusive_device)
				back_button_script = songlist_options_destroy_dialog
				options = [
					{
						func = songlist_options_destroy_dialog
						text = qs(0xf7723015)
					}
					{
						func = songlist_options_overwrite_confirm
						func_params = {exclusive_device = ($g_gbm_exclusive_device)}
						text = qs(0xf77909ae)
					}
					{
						func = songlist_options_create_new_confirm
						func_params = {exclusive_device = ($g_gbm_exclusive_device)}
						text = qs(0xa1ea347f)
					}
				]
			}
		endif
	endif
endscript

script songlist_options_overwrite_confirm 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	<index> = ($g_current_loaded_custom_playlist_index)
	<playlist_entry> = {
		Name = (($custom_playlists) [<index>].Name)
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = custom_playlists index = <index> NewValue = <playlist_entry> globalarray
	songlist_options_save_and_go_back exclusive_device = ($g_gbm_exclusive_device)
endscript

script songlist_options_create_new_confirm 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	songlist_options_destroy_dialog
	if get_first_empty_custom_playlist_slot
		Change g_first_empty_custom_playlist_slot = <slot>
		formatText TextName = playlist_name qs(0xcf7d4875) i = (<slot> + 1)
		gamemode_gettype
		if ((<Type> != freeplay) && ($g_songlist_options_dirty = 1))
			get_savegame_from_controller controller = ($g_gbm_savegame_device)
			SetGlobalTags savegame = <savegame> custom_playlists params = {custom_playlists = ($custom_playlists)}
			SetGlobalTags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_ghtunes = ($g_songlist_show_ghtunes)}
			songlist_deinit_music_store
			<event_func> = ui_memcard_autosave_replace
		else
			<event_func> = ui_event
		endif
		<event_func> event = menu_change is_popup data = {
			is_popup
			state = uistate_edit_name
			default_name = <playlist_name>
			char_limit = 15
			title = qs(0x3703427b)
			accept_script = songlist_options_accept_name
			cancel_script = songlist_options_cancel_name
			device_num = ($g_gbm_exclusive_device)
		}
	else
		LaunchEvent \{Type = unfocus
			target = songlist_options_vmenu}
		songlist_options_vmenu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0xaaf1b4f3)
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_options_destroy_dialog
					text = qs(0xf7723015)
				}
				{
					func = songlist_options_overwrite_confirm
					func_params = {exclusive_device = ($g_gbm_exclusive_device)}
					text = qs(0xf77909ae)
				}
			]
		}
	endif
endscript

script songlist_options_select_create \{no_refresh = 0}
	LaunchEvent \{Type = unfocus
		target = songlist_options_vmenu}
	songlist_options_vmenu :se_setprops \{block_events}
	songlist_component :membfunc_songlist_uistack_setmode \{mode = playlist}
	if (<no_refresh> = 0)
		Change \{g_songlist_refresh_menus = 1}
	endif
	if GotParam \{data}
		songlist_options_back no_sound data = <data>
	else
		songlist_options_back \{no_sound}
	endif
endscript

script songlist_options_load 
	songlist_options_vmenu :obj_getintegertag \{tag_name = tag_selected_index}
	DestroyScreenElement \{id = songlist_options_vmenu
		preserve_parent}
	SetScreenElementLock \{id = songlist_options_vmenu
		OFF}
	SetScreenElementLock \{id = songlist_options_vmenu
		On}
	ui_sfx \{menustate = setlist
		uitype = select}
	GetArraySize \{$locked_playlists}
	<locked_size> = <array_Size>
	GetArraySize \{$custom_playlists}
	<custom_size> = <array_Size>
	<total_size> = (<locked_size> + <custom_size>)
	if (<total_size> > 0)
		songlist_options :se_setprops \{songlist_options_text_text = qs(0xf481e489)}
		event_handlers = [
			{pad_back songlist_options_go_to_menu params = {Type = playlist use_back_index = 1 back_index = <integer_value>}}
		]
		songlist_options_vmenu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		songlist_options_vmenu :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = songlist_options_vmenu}
		<num_menu_items> = 0
		if (<locked_size> > 0)
			<i> = 0
			begin
			if NOT is_playlist_slot_empty playlists = locked slot = <i>
				<num_menu_items> = (<num_menu_items> + 1)
				<item_struct> = (($locked_playlists) [<i>])
				songlist_options_add_item {
					text = (<item_struct>.Name)
					text_focus_color = ($g_songlist_options_item_focus_rgba)
					text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
					pad_choose_script = songlist_options_load_query
					pad_choose_params = {index = <i> text = (<item_struct>.Name) playlists = locked}
				}
			endif
			<i> = (<i> + 1)
			repeat <locked_size>
			generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <num_menu_items>
		endif
		<i> = 0
		begin
		if NOT is_playlist_slot_empty playlists = custom slot = <i>
			<num_menu_items> = (<num_menu_items> + 1)
			<item_struct> = (($custom_playlists) [<i>])
			songlist_options_add_item {
				text = (<item_struct>.Name)
				text_focus_color = ($g_songlist_options_item_focus_rgba)
				text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
				pad_choose_script = songlist_options_load_query
				pad_choose_params = {index = <i> text = (<item_struct>.Name) playlists = custom}
			}
		endif
		<i> = (<i> + 1)
		repeat <custom_size>
		generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <num_menu_items>
	endif
	songlist_options_create_default_user_control_helpers
endscript

script songlist_options_delete 
	ui_sfx \{menustate = setlist
		uitype = select}
	if NOT does_custom_playlist_exist
		LaunchEvent \{Type = unfocus
			target = songlist_options_vmenu}
		songlist_options_vmenu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0xb5d36d74)
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_options_destroy_dialog
					text = qs(0x0e41fe46)
				}
			]
		}
		return
	endif
	songlist_options_vmenu :obj_getintegertag \{tag_name = tag_selected_index}
	DestroyScreenElement \{id = songlist_options_vmenu
		preserve_parent}
	SetScreenElementLock \{id = songlist_options_vmenu
		OFF}
	SetScreenElementLock \{id = songlist_options_vmenu
		On}
	GetArraySize \{$custom_playlists}
	if (<array_Size> > 0)
		songlist_options :se_setprops \{songlist_options_text_text = qs(0xed733529)}
		event_handlers = [
			{pad_back songlist_options_go_to_menu params = {Type = playlist use_back_index = 1 back_index = <integer_value>}}
		]
		songlist_options_vmenu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		songlist_options_vmenu :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = songlist_options_vmenu}
		<i> = 0
		<num_menu_items> = 0
		begin
		if NOT is_playlist_slot_empty playlists = custom slot = <i>
			<num_menu_items> = (<num_menu_items> + 1)
			<item_struct> = (($custom_playlists) [<i>])
			songlist_options_add_item {
				text = (<item_struct>.Name)
				text_focus_color = ($g_songlist_options_item_focus_rgba)
				text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
				pad_choose_script = songlist_options_deletion_query
				pad_choose_params = {index = <i>}
			}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = <num_menu_items>
	endif
	songlist_options_create_default_user_control_helpers
endscript

script songlist_options_clear_query 
	LaunchEvent \{Type = unfocus
		target = songlist_options_vmenu}
	songlist_options_vmenu :se_setprops \{block_events}
	formatText \{TextName = clear_text
		qs(0xdde7cc6a)}
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <clear_text>
		player_device = ($g_gbm_exclusive_device)
		options = [
			{
				func = songlist_options_destroy_dialog
				text = qs(0xf7723015)
			}
			{
				func = songlist_options_clear_all
				text = qs(0xe6bedbca)
			}
		]
	}
endscript

script songlist_options_clear_all 
	songlist_options_destroy_dialog \{no_focus}
	songlist_clear
	ui_sfx \{menustate = setlist
		uitype = select}
	songlist_component :membfunc_songlist_uistack_setmode \{mode = play_song}
	Change \{g_songlist_refresh_menus = 1}
	songlist_options_back \{no_sound}
endscript

script songlist_options_shuffle 
	GetArraySize \{$current_playlist}
	ui_sfx \{menustate = setlist
		uitype = select}
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
		Change \{g_songlist_requires_unblock = 1}
	endif
	songlist_options_back \{no_sound}
endscript

script songlist_options_destroy_dialog 
	destroy_dialog_box
	if NOT GotParam \{no_focus}
		if ScreenElementExists \{id = songlist_options_vmenu}
			songlist_options_vmenu :se_setprops \{unblock_events}
			LaunchEvent \{Type = focus
				target = songlist_options_vmenu}
		else
			songlist_options_setup_menu exclusive_device = <exclusive_device> savegame_device = <savegame_device>
		endif
	else
		if ScreenElementExists \{id = songlist_options_vmenu}
			LaunchEvent \{Type = unfocus
				target = songlist_options_vmenu}
			songlist_options_vmenu :se_setprops \{block_events}
		endif
	endif
	songlist_options_create_default_user_control_helpers
endscript

script songlist_options_deletion_query 
	LaunchEvent \{Type = unfocus
		target = songlist_options_vmenu}
	songlist_options_vmenu :se_setprops \{block_events}
	formatText TextName = deletion_text qs(0x9c3cfb6b) c = ((($custom_playlists) [<index>]).Name)
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = <deletion_text>
		player_device = ($g_gbm_exclusive_device)
		options = [
			{
				func = songlist_options_destroy_dialog
				text = qs(0xf7723015)
			}
			{
				func = songlist_options_deletion_confirm
				func_params = {index = <index>}
				text = qs(0x271a1633)
			}
		]
	}
endscript

script songlist_options_deletion_confirm 
	RequireParams \{[
			index
		]
		all}
	delete_custom_playlist_slot slot = <index>
	if (<index> = $g_current_loaded_custom_playlist_index)
		Change \{g_current_loaded_custom_playlist_index = -1}
	endif
	songlist_options_destroy_dialog
	Change \{g_songlist_options_dirty = 1}
	songlist_options_back
endscript

script songlist_options_load_query 
	LaunchEvent \{Type = unfocus
		target = songlist_options_vmenu}
	songlist_options_vmenu :se_setprops \{block_events}
	if is_a_playlist_loaded
		formatText TextName = load_text qs(0x167cfdb3) c = <text>
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = <load_text>
			player_device = ($g_gbm_exclusive_device)
			options = [
				{
					func = songlist_options_destroy_dialog
					text = qs(0xf7723015)
				}
				{
					func = songlist_options_load_confirm
					func_params = {index = <index> playlists = <playlists>}
					text = qs(0xad5cfad4)
				}
			]
		}
	else
		ui_sfx \{menustate = setlist
			uitype = select}
		songlist_options_load_confirm index = <index> playlists = <playlists>
	endif
endscript

script songlist_options_load_confirm 
	RequireParams \{[
			index
		]
		all}
	songlist_options_destroy_dialog \{no_focus}
	songlist_clear
	ExtendCrc <playlists> '_playlists' out = my_playlists
	songlist_options_check_relevance {
		playlist = ((($<my_playlists>) [<index>]).playlist)
	}
	if StructureContains structure = (($<my_playlists>) [<index>]) suppress_unavailable_songs_warning
		songlist_options_load_confirm_finish <...>
	elseif (<list_relevant> = FALSE)
		LaunchEvent \{Type = unfocus
			target = songlist_options_vmenu}
		songlist_options_vmenu :se_setprops \{block_events}
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
					func = songlist_options_load_confirm_finish
					func_params = {<...>}
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		songlist_options_load_confirm_finish <...>
	endif
endscript

script songlist_options_check_relevance {
		0x5A playlist = ($current_playlist)
	}
	get_savegame_from_controller controller = ($g_gbm_savegame_device)
	<list_relevant> = true
	GetArraySize <playlist>
	if (<array_Size> > 0)
		<song_available_list> = []
		<i> = 0
		<available_count> = 0
		begin
		<song> = (<playlist> [<i>])
		<song_allowed> = FALSE
		get_ui_song_struct_items song = <song> savegame = <savegame>
		if NOT GotParam \{song_not_found}
			if song_is_jamsession song = (<ui_struct>.song_checksum)
				gamemode_gettype
				if (<Type> = quickplay)
					<song_allowed> = true
				else
					<song_allowed> = FALSE
				endif
			elseif IsSongAvailable song = <song> savegame = <savegame>
				if issongselectable song = <song> savegame = <savegame>
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

script songlist_options_load_confirm_finish 
	songlist_options_destroy_dialog \{no_focus}
	if NOT GotParam \{override_array}
		Change current_playlist = ((($<my_playlists>) [<index>]).playlist)
	else
		Change current_playlist = <override_array>
	endif
	if ScreenElementExists \{id = SongList}
		SongList :Obj_SpawnScriptNow \{songlist_calculate_playlist_duration}
	endif
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = play_song)
		songlist_options_select_create
	else
		Change \{g_songlist_refresh_menus = 1}
		Change \{g_songlist_requires_unblock = 1}
		songlist_options_back \{no_sound}
	endif
	if (<playlists> = custom)
		Change g_current_loaded_custom_playlist_index = <index>
	endif
endscript

script songlist_options_go_to_menu \{Type = !q1768515945
		use_back_index = 0}
	if (<use_back_index> = 0)
		songlist_options_vmenu :obj_getintegertag \{tag_name = tag_selected_index}
		songlist_options_vmenu :obj_setintegertag tag_name = back_index integer_value = <integer_value>
	endif
	DestroyScreenElement \{id = songlist_options_vmenu
		preserve_parent}
	SetScreenElementLock \{id = songlist_options_vmenu
		OFF}
	SetScreenElementLock \{id = songlist_options_vmenu
		On}
	if (<Type> = import_view)
		songlist_options_setup_menu Type = <Type> purchase_struct = <purchase_struct>
		<no_green_button> = 1
		songlist_options :se_setprops \{songlist_menu_wide_rule_bg_alpha = 1}
		songlist_options :se_setprops \{songlist_options_bg_alpha = 0}
		songlist_options :se_setprops \{songlist_options_vmenu_spacing_between = 3}
	else
		songlist_options_setup_menu Type = <Type>
		<no_green_button> = 0
		songlist_options :se_setprops \{songlist_options_bg_alpha = 1}
		songlist_options :se_setprops \{songlist_menu_wide_rule_bg_alpha = 0}
		songlist_options :se_setprops \{songlist_options_vmenu_spacing_between = 0}
	endif
	ui_sfx \{menustate = setlist
		uitype = back}
	songlist_options_create_default_user_control_helpers no_green_button = <no_green_button>
	if (<use_back_index> = 0)
		LaunchEvent \{Type = focus
			target = songlist_options_vmenu}
	else
		if NOT GotParam \{back_index}
			songlist_options_vmenu :obj_getintegertag \{tag_name = back_index}
			<back_index> = <integer_value>
		endif
		LaunchEvent \{Type = focus
			target = songlist_options_vmenu
			data = {
				child_index = 0
			}}
		Wait \{3
			gameframes}
		LaunchEvent \{Type = unfocus
			target = songlist_options_vmenu}
		LaunchEvent Type = focus target = songlist_options_vmenu data = {child_index = <back_index>}
	endif
endscript

script songlist_options_back \{data = {
		}}
	songlist_options :GetTags
	if NOT (<show_more_info_on_enter> = ($g_songlist_show_more_info))
		Change \{g_songlist_options_dirty = 1}
	endif
	if NOT (<show_ghtunes_on_enter> = ($g_songlist_show_ghtunes))
		Change \{g_songlist_options_dirty = 1}
		<data> = {
			<data>
			no_pivot = 1
		}
	endif
	if ($g_songlist_options_dirty = 1)
		songlist_options_save_and_go_back data = <data>
	else
		if NOT GotParam \{no_sound}
			ui_sfx \{menustate = setlist
				uitype = back}
		endif
		generic_event_back data = <data>
	endif
endscript

script songlist_options_save_and_go_back \{data = {
		}}
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
		songlist_deinit_music_store
		ui_memcard_autosave_replace event = menu_back state = uistate_songlist is_popup data = <data>
	endif
endscript

script songlist_options_show_more_info_toggle 
	if ($g_songlist_show_more_info = 0)
		Change \{g_songlist_show_more_info = 1}
		<new_texture> = Options_Controller_Check
		ui_sfx \{menustate = setlist
			uitype = toggleon}
		songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 0.0
			songlist_detail_frame_2_cont_alpha = 1.0}
	else
		Change \{g_songlist_show_more_info = 0}
		<new_texture> = Options_Controller_X
		ui_sfx \{menustate = setlist
			uitype = toggleoff}
		songlist_detail :se_setprops \{songlist_detail_frame_1_cont_alpha = 1.0
			songlist_detail_frame_2_cont_alpha = 0.0}
	endif
	<icon_id> :SetProps texture = <new_texture>
endscript

script songlist_options_show_ghtunes_toggle 
	if ($g_songlist_show_ghtunes = 0)
		Change \{g_songlist_show_ghtunes = 1}
		<new_texture> = Options_Controller_Check
		ui_sfx \{menustate = setlist
			uitype = toggleon}
		songlist_clear_filterspec
	else
		Change \{g_songlist_show_ghtunes = 0}
		<new_texture> = Options_Controller_X
		ui_sfx \{menustate = setlist
			uitype = toggleoff}
		filterspec = [
			{
				key = song_source
				union_list = [ghtunes]
				comparator = not_equal
			}
		]
		songlist_change_filterspec filterspec = <filterspec>
	endif
	<icon_id> :SetProps texture = <new_texture>
	Change \{g_songlist_refresh_menus = 1}
	Change \{g_songlist_requires_unblock = 1}
endscript

script songlist_options_generate_show_ghtunes_option_text 
	formatText \{TextName = ghtunes_text
		qs(0x3c71eff6)
		t = $content_source_ghtunes_artist_string}
	formatText TextName = option_text qs(0x061a5334) t = <ghtunes_text>
	return option_text = <option_text>
endscript

script allow_show_ghtunes_toggle 
	if inroadiebattlemode
		return \{FALSE}
	endif
	gamemode_gettype
	if (<Type> = quickplay)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script allow_play_song_option 
	<song_item_id> :GetSingleTag song_checksum
	if NOT is_current_playlist_empty
		return \{FALSE}
	endif
	get_savegame_from_controller controller = ($g_gbm_savegame_device)
	if issongselectable song = <song_checksum> savegame = <savegame>
		return \{true}
	else
		if GotParam \{song_not_patched}
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script songlist_main_options_play_song \{song_item_id = !q1768515945}
	play_band_lobby_complete_sfx
	songlist_options_back no_sound data = {bypass_return_script = songlist_item_add_to_playlist bypass_return_params = {id = <song_item_id> calculate_duration = 0}}
endscript

script allow_add_to_playlist_option 
	<song_item_id> :GetSingleTag song_checksum
	get_savegame_from_controller controller = ($g_gbm_savegame_device)
	if issongselectable song = <song_checksum> savegame = <savegame>
		get_ui_song_struct_items song = <song_checksum> savegame = <savegame>
		song_checksum = (<ui_struct>.song_checksum)
		if NOT song_is_jamsession song = <song_checksum>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script songlist_main_options_add_to_playlist \{song_item_id = !q1768515945}
	songlist_component :membfunc_songlist_uistack_getmode
	<song_item_id> :se_setprops songlist_source_icon_alpha = 0.0
	if (<mode> = playlist)
		songlist_options_back no_sound data = {initial_return_script = songlist_item_add_to_playlist initial_return_params = {no_focus = 1 id = <song_item_id>}}
	elseif (<mode> = play_song)
		songlist_component :membfunc_songlist_uistack_getrangestruct
		get_savegame_from_controller controller = ($g_gbm_savegame_device)
		if issongselectable song = (<range_struct>.song_checksum) savegame = <savegame>
			songlist_options_select_create no_refresh = 1 data = {initial_return_script = songlist_item_add_to_playlist initial_return_params = {no_focus = 1 id = <song_item_id>}}
		else
			songlist_options_back no_sound data = {initial_return_script = songlist_item_add_to_playlist initial_return_params = {no_focus = 1 id = <song_item_id>}}
		endif
	endif
endscript

script songlist_main_options_remove_from_playlist \{song_item_id = !q1768515945}
	if is_a_playlist_loaded
		if (<size> = 1)
			songlist_component :membfunc_songlist_uistack_setmode \{mode = play_song}
		endif
	endif
	songlist_options_back no_sound data = {initial_return_script = songlist_item_remove_from_playlist initial_return_params = {no_focus = 1 id = <song_item_id>}}
endscript

script allow_view_awards_option \{song_item_id = !q1768515945}
	gamemode_gettype
	if NOT checksumequals a = <Type> b = quickplay
		return \{FALSE}
	endif
	<song_item_id> :GetSingleTag song_checksum
	get_savegame_from_controller controller = ($g_gbm_savegame_device)
	get_ui_song_struct_items song = <song_checksum> savegame = <savegame>
	if song_is_jamsession song = (<ui_struct>.song_checksum)
		return \{FALSE}
	endif
	issongselectable song = <song_checksum> savegame = <savegame>
	if GotParam \{song_not_patched}
		return \{FALSE}
	elseif GotParam \{song_is_locked}
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script songlist_main_options_view_awards_help_page \{song_item_id = !q1768515945
		device_num = !i1768515945}
	hide_glitch \{num_frames = 20}
	universal_help_display_help_check help_context = challenge_tracker device_num = <device_num>
	setsoundbussparams \{Music_Setlist = {
			vol = -3
		}
		time = 1}
	ui_sfx \{menustate = Generic
		uitype = select}
	if (<show_help_page> = 1)
		<song_item_id> :GetSingleTag song_checksum
		songlist_options :GetTags
		generic_event_replace {
			state = uistate_universal_help
			data = {
				next_state_script = songlist_main_options_view_awards
				next_state_params = {
					song_item_id = <song_item_id>
					device_num = <device_num>
					from_help_page = 1
					show_more_info_on_enter = <show_more_info_on_enter>
					show_ghtunes_on_enter = <show_ghtunes_on_enter>
					song_checksum = <song_checksum>
				}
				device_num = <device_num>
				help_global_index = <help_index>
			}
		}
	else
		songlist_main_options_view_awards song_item_id = <song_item_id> device_num = <device_num>
	endif
endscript

script songlist_main_options_view_awards \{song_item_id = !q1768515945
		device_num = !i1768515945
		from_help_page = 0
		show_more_info_on_enter = 0
		show_ghtunes_on_enter = 0}
	if isps3
		if NOT GotParam \{no_restricted_check}
			if NOT NetSessionFunc \{func = isoldenoughforonline}
				ui_sfx \{menustate = leaderboard
					uitype = negativeselect}
				ui_leaderboard_get_error_text \{reason = content_restricted}
				if (<from_help_page> = 1)
					generic_event_replace {
						state = uistate_generic_dialog_box
						data = {
							is_popup
							confirm_text = qs(0xaec82a2f)
							confirm_func = songlist_main_options_view_awards
							confirm_func_params = {<...> no_restricted_check}
							heading_text = qs(0xaa163738)
							body_text = <error_text>
							cancel_text = qs(0xf7723015)
							cancel_func = generic_event_back
						}
					}
				else
					generic_event_choose {
						state = uistate_generic_dialog_box
						data = {
							is_popup
							confirm_text = qs(0xaec82a2f)
							confirm_func = songlist_main_options_view_awards
							confirm_func_params = {<...> no_restricted_check}
							heading_text = qs(0xaa163738)
							body_text = <error_text>
							cancel_text = qs(0xf7723015)
							cancel_func = generic_event_back
						}
					}
				endif
				return
			endif
		endif
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	<song_item_id> :GetSingleTag song_checksum
	gamemode_gettype
	if (<Type> = freeplay)
		ui_event event = menu_replace data = {state = uistate_award_case song = <song_checksum> device_num = <device_num> no_targeting}
	else
		if (<from_help_page> = 0)
			songlist_options :GetTags
		endif
		<need_autosave> = 0
		if NOT (<show_more_info_on_enter> = ($g_songlist_show_more_info))
			<need_autosave> = 1
		endif
		if NOT (<show_ghtunes_on_enter> = ($g_songlist_show_ghtunes))
			<need_autosave> = 1
		endif
		if inroadiebattlemode
			<no_targeting_struct> = {no_targeting}
		else
			<no_targeting_struct> = {}
		endif
		if (<need_autosave> = 1)
			get_savegame_from_controller controller = ($g_gbm_savegame_device)
			SetGlobalTags savegame = <savegame> custom_playlists params = {custom_playlists = ($custom_playlists)}
			SetGlobalTags savegame = <savegame> songlist_options params = {show_more_info = ($g_songlist_show_more_info) show_ghtunes = ($g_songlist_show_ghtunes)}
			songlist_deinit_music_store
			ui_memcard_autosave_replace {
				event = menu_replace
				data = {
					state = uistate_award_case
					song = <song_checksum>
					device_num = <device_num>
					<no_targeting_struct>
				}
			}
		else
			ui_event event = menu_replace data = {
				state = uistate_award_case
				song = <song_checksum>
				device_num = <device_num>
				<no_targeting_struct>
			}
		endif
	endif
endscript

script songlist_main_options_download_similar \{song_item_id = !q1768515945}
	<song_item_id> :GetSingleTag song_checksum
	songlist_options_back data = {bypass_return_script = songlist_go_to_music_store_tab bypass_return_params = {force_to_recommendations = 1 song_checksum = <song_checksum>}}
endscript

script allow_random_songs_option 
	gamemode_gettype
	if (<Type> = freeplay)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script songlist_main_options_random_songs 
	songlist_options_vmenu :obj_getintegertag \{tag_name = tag_selected_index}
	songlist_options_vmenu :obj_setintegertag tag_name = back_index integer_value = <integer_value>
	DestroyScreenElement \{id = songlist_options_vmenu
		preserve_parent}
	SetScreenElementLock \{id = songlist_options_vmenu
		OFF}
	SetScreenElementLock \{id = songlist_options_vmenu
		On}
	ui_sfx \{menustate = setlist
		uitype = select}
	<num_random_songs_array> = [1 3 5 10]
	GetArraySize <num_random_songs_array>
	if (<array_Size> > 0)
		songlist_options :se_setprops \{songlist_options_text_text = qs(0x0c9cc77e)}
		event_handlers = [
			{pad_back songlist_options_go_to_menu params = {Type = main use_back_index = 1}}
		]
		songlist_options_vmenu :se_setprops {
			event_handlers = <event_handlers>
			replace_handlers
		}
		songlist_options_vmenu :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = songlist_options_vmenu}
		<i> = 0
		begin
		formatText TextName = random_text qs(0xfd68af01) i = (<num_random_songs_array> [<i>])
		songlist_options_add_item {
			text = <random_text>
			text_focus_color = ($g_songlist_options_item_focus_rgba)
			text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
			pad_choose_script = songlist_main_options_random_processing
			pad_choose_params = {num_songs = (<num_random_songs_array> [<i>])}
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	songlist_options_add_item {
		text = qs(0x5bd73447)
		text_focus_color = ($g_songlist_options_item_focus_rgba)
		text_unfocus_color = ($g_songlist_options_item_unfocus_rgba)
		pad_choose_script = songlist_main_options_random_processing
		pad_choose_params = {num_songs = -1}
	}
	generic_scrollbar_wgt_set_resolution id = songlist_options_scrollbar_wgt num_elements = (<array_Size> + 1)
endscript

script songlist_main_options_random_processing \{num_songs = !i1768515945}
	ui_sfx \{menustate = setlist
		uitype = select}
	if NOT is_current_playlist_empty
		LaunchEvent \{Type = unfocus
			target = songlist_options_vmenu}
		songlist_options_vmenu :se_setprops \{block_events}
		create_dialog_box {
			heading_text = qs(0xcf5deb58)
			body_text = qs(0x3fb79e11)
			player_device = ($g_gbm_exclusive_device)
			back_button_script = songlist_main_options_random_processing_cancel
			options = [
				{
					func = songlist_main_options_random_processing_choose
					func_params = {num_songs = <num_songs>}
					text = qs(0x182f0173)
				}
				{
					func = songlist_main_options_random_processing_cancel
					text = qs(0xf7723015)
				}
			]
		}
	else
		songlist_main_options_generate_random_playlist num_songs = <num_songs>
	endif
endscript

script songlist_main_options_random_processing_choose \{num_songs = !i1768515945}
	fill_auto_save_playlist
	songlist_clear_playlist
	songlist_main_options_generate_random_playlist num_songs = <num_songs>
endscript

script songlist_main_options_random_processing_cancel 
	songlist_options_destroy_dialog
endscript

script songlist_main_options_generate_random_playlist \{num_songs = !i1768515945}
	songlist_options_destroy_dialog
	<random_playlist> = []
	songlist_component :membfunc_songlist_uistack_setupapplicablerandomindeces
	Change \{g_songlist_random_playlist = 1}
	if (<num_songs> = -1)
		Change \{g_songlist_infinite_playlist = 1}
		<num_songs> = 10
	endif
	<i> = 0
	begin
	if songlist_component :membfunc_songlist_uistack_getrandomsongstruct
		if song_is_jamsession song = (<random_song_struct>.song_checksum)
			formatText TextName = text '%a' a = (<random_song_struct>.FileName)
			formatText checksumName = song_checksum '%i' i = <text>
		else
			song_checksum = (<random_song_struct>.song_checksum)
		endif
		AddArrayElement array = <random_playlist> element = <song_checksum>
		<random_playlist> = <array>
	else
		printf \{qs(0x30fc5905)}
	endif
	repeat <num_songs>
	Change current_playlist = <random_playlist>
	songlist_options_back data = {bypass_return_script = songlist_continue bypass_return_params = {device_num = <device_num> autosave_playlist = 0}}
endscript

script songlist_main_options_go_to_playlist_options 
	songlist_options_go_to_menu \{Type = playlist}
endscript

script songlist_main_options_go_to_display_options 
	songlist_options_go_to_menu \{Type = display}
endscript

script songlist_options_keep_focus \{id = !q1768515945}
	songlist_component :membfunc_songlist_uistack_getmode
	<id> :GetSingleTag song_checksum
	if NOT (<mode> = music_store)
		get_savegame_from_controller controller = ($g_gbm_savegame_device)
		if NOT issongselectable song = <song_checksum> savegame = <savegame>
			<item_focus_rgba> = $g_songlist_invalid_item_unfocus_rgba
			<sub_item_focus_rgba> = $g_songlist_invalid_sub_item_unfocus_rgba
		else
			<item_focus_rgba> = ($g_songlist_item_focus_rgba)
			<sub_item_focus_rgba> = ($g_songlist_sub_item_focus_rgba)
		endif
		if NOT songlist_is_song_in_playlist song = <song_checksum>
			<id> :Obj_KillSpawnedScript Name = songlist_update_source_icon_alpha
			<id> :se_setprops songlist_source_icon_alpha = 1.0
		endif
	else
		<item_focus_rgba> = ($g_songlist_item_focus_rgba)
		<sub_item_focus_rgba> = ($g_songlist_sub_item_focus_rgba)
	endif
	<id> :se_setprops {
		songlist_item_text_rgba = <item_focus_rgba>
		songlist_item_sub_text_rgba = <sub_item_focus_rgba>
		songlist_item_highlight_bar_alpha = 0.3
	}
endscript

script songlist_options_music_store_request_page_when_ready \{filterspec = !a1768515945}
	songlist_component :membfunc_songlist_uistack_getlistname
	begin
	if contentmanfunc func = is_ready Name = <list_name>
		contentmanfunc {
			func = request_page
			current_page
			Name = <list_name>
			filterspec = <filterspec>
			callback = songlist_options_music_store_pack_callback_request_page
		}
		Change \{g_songlist_refresh_menus = 1}
		Change \{g_songlist_requires_unblock = 1}
		return \{true}
	endif
	Wait \{0.1
		Seconds}
	repeat 150
	callback_marketplace_content_general_timedout
	return \{FALSE}
endscript

script songlist_options_music_store_pack_callback_request_page 
	if (<content_size> > 0)
		songlist_component :membfunc_songlist_uistack_getlistname
		begin
		if contentmanfunc func = is_ready Name = <list_name>
			contentmanfunc {
				func = request_data
				Name = <list_name>
				start_index = 0
				end_index = (<content_size> - 1)
				callback = songlist_options_music_store_pack_callback_request_data
			}
			return
		endif
		Wait \{0.1
			Seconds}
		repeat 150
		callback_marketplace_content_general_timedout
	else
		Change \{songlist_options_ready_to_proceed = 1}
	endif
endscript

script songlist_options_music_store_pack_callback_request_data 
	<pack_index> = -1
	<album_index> = -1
	GetArraySize <Range>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if ((<Range> [<i>]).Type = pack)
			if (<pack_index> = -1)
				<pack_index> = <i>
			endif
		elseif ((<Range> [<i>]).Type = album)
			if (<album_index> = -1)
				<album_index> = <i>
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	songlist_component :GetSingleTag \{music_store_mode}
	if (<pack_index> >= 0 && <music_store_mode> != packs)
		if ($g_music_store_viewing_pack_songs = 0)
			<pack_struct> = (<Range> [<pack_index>])
			<element> = {
				text = qs(0xce5d2e92)
				pad_choose_script = songlist_options_music_store_view_pack_go_back
				pad_choose_params = {pack_struct = <pack_struct> Type = pack mode = packs}
			}
			AddArrayElement array = ($music_store_songlist_options) element = <element>
			Change music_store_songlist_options = <array>
		endif
	endif
	if (<album_index> >= 0 && <music_store_mode> != albums)
		<album_struct> = (<Range> [<album_index>])
		<element> = {
			text = qs(0x55c682ba)
			pad_choose_script = songlist_options_music_store_view_pack_go_back
			pad_choose_params = {pack_struct = <album_struct> Type = album mode = albums}
		}
		AddArrayElement array = ($music_store_songlist_options) element = <element>
		Change music_store_songlist_options = <array>
	endif
	Change \{songlist_options_ready_to_proceed = 1}
endscript

script songlist_options_music_store_purchase_accepted \{purchase_struct = 0x69696969}
	marketplacefunc \{func = clear_cart}
	net_counter_increment \{counter_name = globalcounter_music_store_purchase}
	if isXenon
		if ($shutdown_game_for_signin_change_flag = 0)
			music_store_purchase_content purchase_struct = <purchase_struct>
			ui_event event = menu_replace data = {is_popup state = uistate_music_store_scan_marketplace data = {purchase_struct = <purchase_struct>}}
		endif
	else
		songlist_options_music_store_go_to_terms purchase_struct = <purchase_struct>
	endif
endscript

script songlist_options_music_store_go_to_terms \{purchase_struct = 0x69696969}
	songlist_component :GetSingleTag \{exclusive_device}
	songlist_scrollbar_wgt :se_getprops \{scroll_thumb_pos}
	ui_event_wait event = menu_replace data = {
		no_sound
		state = uistate_music_store_terms
		is_popup
		exclusive_device = <exclusive_device>
		purchase_struct = <purchase_struct>
		product_long_description = <product_long_description>
		slider_pos = <scroll_thumb_pos>
	}
endscript

script songlist_options_music_store_preview_song \{song_preview_asset_name = 0x69696969}
	ui_sfx \{menustate = setlist
		uitype = select}
	music_store_request_preview_music music_name = <song_preview_asset_name>
endscript

script songlist_options_music_store_view_song_in_pack_go_back \{pack_struct = 0x69696969}
	ui_sfx \{menustate = setlist
		uitype = select}
	destroy_dialog_box
	songlist_component :SetTags \{music_store_seek_override = true}
	Change \{g_music_store_viewing_pack_songs = 1}
	setmusicstoresortbytype \{sort_by_type = true}
	pack_list = (<pack_struct>.pack_list)
	AddArrayElement array = <pack_list> element = (<pack_struct>.song_checksum)
	filterspec = [
		{
			key = song_checksum
			union_list = <array>
			comparator = equal
		}
	]
	songlist_component :membfunc_songlist_uistack_setfilterspec filterspec = <filterspec>
	songlist_options_back no_sound data = {
		no_pivot = 1
		bypass_return_script = songlist_music_store_view_pack_songs
		bypass_return_params = {
			ui_struct = <pack_struct>
		}
	}
endscript

script songlist_options_music_store_view_pack_go_back \{pack_struct = 0x69696969}
	ui_sfx \{menustate = setlist
		uitype = select}
	destroy_dialog_box
	songlist_change_sort_index index = ($g_songlist_sort_indexes.music_store)
	filterspec = [
		{
			key = Type
			value = <Type>
			comparator = equal
		}
	]
	songlist_component :membfunc_songlist_uistack_setfilterspec filterspec = <filterspec>
	songlist_component :SetTags music_store_mode = <mode>
	songlist_options_back no_sound data = {
		bypass_return_script = songlist_music_store_view_pack_songs
		bypass_return_params = {
			ui_struct = <pack_struct>
			new_pivot_checksum = (<pack_struct>.song_checksum)
		}
	}
endscript

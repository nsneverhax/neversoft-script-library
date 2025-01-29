g_music_store_hub_options = [
	{
		text = qs(0xd0aba4ef)
		mode = new_arrivals
		sort_index = 0
		filterspec = [
			{
				key = new_arrival
				value = 1
				comparator = equal
			}
		]
		preview_array = [
		]
	}
	{
		text = qs(0xd7809370)
		mode = songs
		sort_index = 0
		filterspec = [
			{
				key = Type
				value = song
				comparator = equal
			}
		]
		preview_array = [
		]
	}
	{
		text = qs(0x6d06b07b)
		mode = track_packs
		sort_index = 0
		filterspec = [
			{
				key = Type
				value = pack
				comparator = equal
			}
		]
		preview_array = [
		]
	}
	{
		text = qs(0xe04818ae)
		mode = albums
		sort_index = 1
		filterspec = [
			{
				key = Type
				value = album
				comparator = equal
			}
		]
		preview_array = [
		]
	}
]
g_music_store_title = qs(0xd0aba4ef)
g_music_store_hub_ticker_text = qs(0x8943cbb7)

script ui_create_music_store_hub 
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	destroy_dialog_box
	SpawnScriptNow \{audio_ui_menu_music_off}
	CreateScreenElement \{Type = descinterface
		desc = 'music_store_hub'
		id = music_store_hub
		parent = root_window
		Pos = (138.0, 180.0)
		z_priority = 99}
	music_store_hub :SetTags \{music_store_hub_options_index = 0
		completed_grab = 0}
	if isxenonorwindx
		music_store_hub :se_setprops \{ms_purchase_text_text = qs(0xb0bcf58b)}
	endif
	songlist_detail_album_text :Obj_KillSpawnedScript \{Name = scroll_ticker_text}
	songlist_detail_genre_text :Obj_KillSpawnedScript \{Name = scroll_ticker_text}
	songlist_detail_duration_text :Obj_KillSpawnedScript \{Name = scroll_ticker_text}
	if ScreenElementExists \{id = songlist_detail_songs_album_text}
		songlist_detail_songs_album_text :Obj_KillSpawnedScript \{Name = scroll_ticker_text}
	endif
	if ScreenElementExists \{id = songlist_detail_songs_genre_text}
		songlist_detail_songs_genre_text :Obj_KillSpawnedScript \{Name = scroll_ticker_text}
	endif
	if ScreenElementExists \{id = songlist_detail_songs_duration_text}
		songlist_detail_songs_duration_text :Obj_KillSpawnedScript \{Name = scroll_ticker_text}
	endif
	songlist_music_store_assign_text_aliases \{desc = music_store_hub}
	songlist_detail :se_setprops \{alpha = 0.0
		songlist_detail_songs_alpha = 0.0
		songlist_detail_albums_alpha = 1.0
		music_store_patch_popup_alpha = 0.0}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if music_store_hub :desc_resolvealias \{Name = alias_music_store_hub_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
	else
		ScriptAssert \{qs(0x5ffdb2cb)}
	endif
	if NOT GotParam \{exclusive_device}
		<exclusive_device> = ($primary_controller)
	endif
	current_menu :se_setprops exclusive_device = <exclusive_device>
	current_menu :SetTags exclusive_device = <exclusive_device>
	current_menu :se_setprops \{event_handlers = [
			{
				pad_up
				music_store_hub_scroll_up
			}
			{
				pad_down
				music_store_hub_scroll_down
			}
			{
				pad_back
				music_store_back_sfx
			}
			{
				pad_back
				music_store_hub_back
			}
		]}
	music_store_hub_create_menu_options exclusive_device = <exclusive_device>
	music_store_hub_create_default_user_control_helpers
	previewassetcache \{func = cancel_all_requests}
	SpawnScriptNow \{music_store_preview_content_source_grab}
	songlist_component :GetSingleTag \{tab_enabled}
	if (<tab_enabled> = 1)
		current_menu :se_setprops \{event_handlers = [
				{
					pad_btn_left
					generic_event_back
					params = {
						data = {
							bypass_return_script = songlist_go_to_song_library_tab
						}
					}
				}
			]}
		add_user_control_helper \{text = qs(0xae6cf896)
			button = blue
			z = 100000}
	endif
	music_store_focus_menu
endscript

script music_store_focus_menu 
	<child_index> = 0
	songlist_component :GetSingleTag \{music_store_mode}
	if GotParam \{music_store_mode}
		GetArraySize ($g_music_store_hub_options)
		if (<array_Size> > 0)
			<i> = 0
			begin
			if (<music_store_mode> = ((($g_music_store_hub_options) [<i>]).mode))
				<child_index> = <i>
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	songlist_component :SetTags \{music_store_mode = hub}
	LaunchEvent Type = focus target = current_menu data = {child_index = <child_index>}
endscript

script music_store_hub_create_default_user_control_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	if ui_event_exists_in_stack \{Name = 'band_lobby'}
		add_user_control_helper \{text = qs(0xf03b0975)
			button = red
			z = 100000}
	else
		add_user_control_helper \{text = qs(0x89152f9c)
			button = red
			z = 100000}
	endif
endscript

script ui_destroy_music_store_hub 
	if ScreenElementExists \{id = music_store_hub}
		music_store_hub :Obj_KillSpawnedScript \{Name = 0x92fefb19}
	endif
	if ScreenElementExists \{id = music_store_hub}
		DestroyScreenElement \{id = music_store_hub}
	endif
	if ScreenElementExists \{id = songlist_detail}
		songlist_detail :se_setprops \{alpha = 1.0}
	endif
	cleanup_music_store_preview_grab
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		songlist_music_store_assign_text_aliases
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers \{mode = music_store}
	endif
endscript

script ui_deinit_music_store_hub 
	cleanup_music_store_preview_grab
endscript

script music_store_hub_create_menu_options 
	GetArraySize \{$g_music_store_hub_options}
	if (<array_Size> > 0)
		<i> = 0
		begin
		<item_struct> = (($g_music_store_hub_options) [<i>])
		GetScreenElementChildren \{id = current_menu}
		<id> = (<children> [<i>])
		<array> = [
			{focus music_store_hub_item_focus params = {index = <i>}}
			{unfocus music_store_hub_item_unfocus params = {index = <i>}}
			{pad_choose generic_blocking_execute_script params = {pad_script = music_store_hub_choose pad_params = {index = <i>}}}
		]
		<id> :se_setprops {
			menurow_txt_item_text = (<item_struct>.text)
			event_handlers = <array>
			exclusive_device = <exclusive_device>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	generic_scrollbar_wgt_set_resolution id = songlist_scrollbar_wgt num_elements = <array_Size>
endscript

script music_store_hub_item_focus \{time = 0.1}
	RequireParams \{[
			index
		]
		all}
	GetScreenElementChildren \{id = current_menu}
	<id> = (<children> [<index>])
	<id> :se_setprops {
		menurow_txt_item_rgba = ($g_music_store_item_focus_rgba)
		menurow_txt_item_shadow_enabled = FALSE
		time = <time>
	}
	RemoveParameter \{children}
	GetScreenElementChildren id = <id>
	(<children> [1]) :se_setprops alpha = 1.0 time = <time>
	generic_scrollbar_wgt_update_thumb_pos id = songlist_scrollbar_wgt index = <index>
	SpawnScriptNow music_store_hub_cycle_preview params = {hub_options_index = <index>}
endscript

script music_store_hub_item_unfocus \{time = 0.1}
	RequireParams \{[
			index
		]
		all}
	GetScreenElementChildren \{id = current_menu}
	<id> = (<children> [<index>])
	<id> :se_setprops {
		menurow_txt_item_rgba = ($g_music_store_item_unfocus_rgba)
		menurow_txt_item_shadow_enabled = true
		time = <time>
	}
	if ScriptIsRunning \{music_store_hub_cycle_preview}
		KillSpawnedScript \{Name = music_store_hub_cycle_preview}
	endif
	RemoveParameter \{children}
	GetScreenElementChildren id = <id>
	(<children> [1]) :se_setprops alpha = 0.0 time = <time>
endscript

script music_store_hub_scroll_up 
	music_store_scroll_sfx \{params = {
			up
		}}
endscript

script music_store_hub_scroll_down 
	music_store_scroll_sfx \{params = {
			down
		}}
endscript

script music_store_hub_back 
	if ScriptIsRunning \{music_store_hub_choose}
		return
	endif
	marketplace_exit_check
endscript

script music_store_hub_choose 
	RequireParams \{[
			index
		]
		all}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	music_store_select_sfx
	songlist_component :SetTags \{music_store_seek_override = true}
	songlist_change_filterspec filterspec = ((($g_music_store_hub_options) [<index>]).filterspec)
	Change g_music_store_title = ((($g_music_store_hub_options) [<index>]).text)
	Change \{g_songlist_refresh_menus = 1}
	songlist_component :SetTags {
		music_store_mode = ((($g_music_store_hub_options) [<index>]).mode)
	}
	songlist_change_sort_index index = ((($g_music_store_hub_options) [<index>]).sort_index)
	generic_event_back \{nosound
		data = {
			no_pivot
		}}
endscript

script music_store_hub_cycle_items 
	if NOT ScreenElementExists \{id = music_store_hub}
		return
	endif
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	music_store_hub :Obj_KillSpawnedScript \{Name = 0x92fefb19}
	music_store_hub :Obj_SpawnScriptNow 0x92fefb19 params = {
		ui_struct = <content_item>
		hub_item_cycle = 1
		morph_time = 0.5
	}
endscript

script music_store_hub_cycle_preview \{cycle_time = 5.0}
	RequireParams \{[
			hub_options_index
		]
		all}
	if NOT ScreenElementExists \{id = music_store_hub}
		return
	endif
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	begin
	music_store_hub :GetSingleTag \{completed_grab}
	if (<completed_grab> = 1)
		break
	endif
	Wait \{3
		gameframes}
	repeat
	preview_array = (($g_music_store_hub_options [<hub_options_index>]).preview_array)
	songlist_component :membfunc_songlist_uistack_getlistname
	GetArraySize <preview_array>
	if (<array_Size> > 0)
		i = 0
		begin
		if contentmanfunc func = is_ready Name = <list_name>
			contentmanfunc {
				func = request_page
				Name = <list_name>
				single_item
				Seek = (<preview_array> [<i>])
				callback = music_store_hub_cycle_items
			}
		endif
		Wait <cycle_time> Seconds
		i = (<i> + 1)
		if (<i> >= <array_Size>)
			i = 0
		endif
		repeat
	else
		music_store_hub :Obj_KillSpawnedScript \{Name = 0x92fefb19}
		music_store_hub :se_setprops \{songlist_detail_cont_alpha = 0.0
			time = 0.5}
	endif
endscript

script music_store_preview_content_source_grab 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	GetArraySize ($g_music_store_hub_options)
	if (<array_Size> <= 0)
		return
	endif
	if NOT ScreenElementExists \{id = music_store_hub}
		return
	endif
	if NOT ScreenElementExists \{id = SongList}
		return
	endif
	Change \{generic_menu_block_input = 1}
	songlist_component :membfunc_songlist_uistack_getlistname
	printf \{'music_store_preview_content_source_grab'}
	music_store_hub :GetSingleTag \{music_store_hub_options_index}
	if (<music_store_hub_options_index> < <array_Size>)
		printf \{'music_store_preview_content_source_grab'}
		begin
		if contentmanfunc func = is_ready Name = <list_name>
			contentmanfunc {
				func = request_page
				Name = <list_name>
				current_page
				callback = music_store_preview_content_source_grab_callback
				filterspec = (($g_music_store_hub_options [<music_store_hub_options_index>]).filterspec)
				sortspec = {key = arrived_date alt_key = song_title}
			}
			return
		endif
		Wait \{1
			gameframe}
		repeat 1000
	else
		Change \{generic_menu_block_input = 0}
		music_store_hub :SetTags \{completed_grab = 1}
		return
	endif
endscript
g_music_store_preview_max_size = 10

script music_store_preview_content_source_grab_callback 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	printf \{'music_store_preview_content_source_grab_callback'}
	if NOT ScreenElementExists \{id = music_store_hub}
		Change \{generic_menu_block_input = 0}
		return
	endif
	if NOT ScreenElementExists \{id = SongList}
		Change \{generic_menu_block_input = 0}
		return
	endif
	songlist_component :membfunc_songlist_uistack_getlistname
	if (<page_size> > ($g_music_store_preview_max_size))
		page_size = ($g_music_store_preview_max_size)
	endif
	if (<page_size> > 0)
		contentmanfunc {
			func = request_data
			Name = <list_name>
			start_index = 0
			end_index = (<page_size> -1)
			callback = music_store_preview_content_source_grab_data_callback
		}
	else
		music_store_hub :GetSingleTag \{music_store_hub_options_index}
		music_store_hub_options_index = (<music_store_hub_options_index> + 1)
		music_store_hub :SetTags music_store_hub_options_index = <music_store_hub_options_index>
		SpawnScriptNow \{music_store_preview_content_source_grab}
	endif
endscript

script music_store_preview_content_source_grab_data_callback 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT ScreenElementExists \{id = music_store_hub}
		Change \{generic_menu_block_input = 0}
		return
	endif
	if NOT ScreenElementExists \{id = SongList}
		Change \{generic_menu_block_input = 0}
		return
	endif
	preview_array = []
	images = []
	GetArraySize <Range>
	if (<array_Size> > 0)
		i = 0
		begin
		AddArrayElement array = <preview_array> element = ((<Range> [<i>]).song_checksum)
		preview_array = <array>
		AddArrayElement array = <images> element = ((<Range> [<i>]).song_preview_asset_name)
		images = <array>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	previewassetcache func = request_image images = <images>
	music_store_hub :GetSingleTag \{music_store_hub_options_index}
	option_struct = {($g_music_store_hub_options [<music_store_hub_options_index>]) preview_array = <preview_array>}
	SetArrayElement ArrayName = g_music_store_hub_options globalarray index = <music_store_hub_options_index> NewValue = <option_struct>
	if NOT ScreenElementExists \{id = music_store_hub}
		Change \{generic_menu_block_input = 0}
		return
	endif
	music_store_hub :GetSingleTag \{music_store_hub_options_index}
	music_store_hub_options_index = (<music_store_hub_options_index> + 1)
	music_store_hub :SetTags music_store_hub_options_index = <music_store_hub_options_index>
	SpawnScriptNow \{music_store_preview_content_source_grab}
endscript

script cleanup_music_store_preview_grab 
	if ScriptIsRunning \{music_store_preview_content_source_grab}
		KillSpawnedScript \{Name = music_store_preview_content_source_grab}
	endif
	if ScriptIsRunning \{music_store_preview_content_source_grab_callback}
		KillSpawnedScript \{Name = music_store_preview_content_source_grab_callback}
	endif
	if ScriptIsRunning \{music_store_preview_content_source_grab_data_callback}
		KillSpawnedScript \{Name = music_store_preview_content_source_grab_data_callback}
	endif
	if ScriptIsRunning \{music_store_hub_cycle_preview}
		KillSpawnedScript \{Name = music_store_hub_cycle_preview}
	endif
	Change \{generic_menu_block_input = 0}
endscript

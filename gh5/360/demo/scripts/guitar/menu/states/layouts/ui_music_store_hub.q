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
				key = type
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
				key = type
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
				key = type
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
	setmenuautorepeattimes \{(0.3, 0.1)}
	destroy_dialog_box
	spawnscriptnow \{menu_music_off}
	createscreenelement \{type = descinterface
		desc = 'music_store_hub'
		id = music_store_hub
		parent = root_window
		pos = (138.0, 180.0)
		z_priority = 99}
	music_store_hub :settags \{music_store_hub_options_index = 0
		completed_grab = 0}
	if isxenonorwindx
		music_store_hub :se_setprops \{ms_purchase_text_text = qs(0xb0bcf58b)}
	endif
	if songlist :desc_resolvealias \{name = alias_music_store_ticker_window}
		assignalias id = <resolved_id> alias = music_store_ticker_window
	else
		scriptassert \{qs(0xbde1524d)}
	endif
	songlist_detail_album_text :obj_killspawnedscript \{name = scroll_ticker_text}
	songlist_detail_genre_text :obj_killspawnedscript \{name = scroll_ticker_text}
	songlist_detail_duration_text :obj_killspawnedscript \{name = scroll_ticker_text}
	if screenelementexists \{id = songlist_detail_songs_album_text}
		songlist_detail_songs_album_text :obj_killspawnedscript \{name = scroll_ticker_text}
	endif
	if screenelementexists \{id = songlist_detail_songs_genre_text}
		songlist_detail_songs_genre_text :obj_killspawnedscript \{name = scroll_ticker_text}
	endif
	if screenelementexists \{id = songlist_detail_songs_duration_text}
		songlist_detail_songs_duration_text :obj_killspawnedscript \{name = scroll_ticker_text}
	endif
	songlist_music_store_assign_text_aliases \{desc = music_store_hub}
	createscreenelement \{type = containerelement
		parent = music_store_ticker_window
		id = music_store_ticker_window_container}
	music_store_ticker_window :se_setprops \{alpha = 1.0
		time = 0.5}
	songlist_detail :se_setprops \{alpha = 0.0
		songlist_detail_songs_alpha = 0.0
		songlist_detail_albums_alpha = 1.0
		music_store_patch_popup_alpha = 0.0}
	netsessionfunc \{obj = motd
		func = get_demonware_motd
		params = {
			callback = music_store_hub_motd_callback
		}}
	songlist_hilight_bar_cont :se_setprops \{alpha = 0.0}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if music_store_hub :desc_resolvealias \{name = alias_music_store_hub_vmenu}
		assignalias id = <resolved_id> alias = current_menu
	else
		scriptassert \{qs(0x5ffdb2cb)}
	endif
	if NOT gotparam \{exclusive_device}
		<exclusive_device> = ($primary_controller)
	endif
	current_menu :se_setprops exclusive_device = <exclusive_device>
	current_menu :settags exclusive_device = <exclusive_device>
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
	change \{g_songlist_ignore_pivot_hack = 1}
	previewassetcache \{func = cancel_all_requests}
	spawnscriptnow \{music_store_preview_content_source_grab}
	music_store_focus_menu
endscript

script music_store_focus_menu 
	<child_index> = 0
	songlist :getsingletag \{music_store_mode}
	if gotparam \{music_store_mode}
		getarraysize ($g_music_store_hub_options)
		if (<array_size> > 0)
			<i> = 0
			begin
			if (<music_store_mode> = ((($g_music_store_hub_options) [<i>]).mode))
				<child_index> = <i>
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	songlist :settags \{music_store_mode = hub}
	launchevent type = focus target = current_menu data = {child_index = <child_index>}
endscript

script music_store_hub_motd_callback 
	if gotparam \{motd_text}
		change message_of_the_day = <motd_text>
	endif
	<ticker_text> = ($g_music_store_hub_ticker_text)
	if gotparam \{success}
		if (<success> = success)
			if globalexists \{name = motd_music_store}
				<ticker_text> = ($motd_music_store)
			endif
		endif
	endif
	if screenelementexists \{id = music_store_hub}
		music_store_hub :obj_spawnscriptlater scroll_ticker_text params = {
			ticker_text = <ticker_text>
			ticker_space = qs(0xc059c1be)
			ticker_pos = (128.0, 10.0)
			ticker_just = [left top]
			ticker_parent = music_store_ticker_window_container
			ticker_font = fontgrid_text_a1
			ticker_rgba1 = [113 121 133 255]
			ticker_rgba2 = [113 121 133 255]
			ticker_alpha = 1.0
			ticker_z_priority = 53
			time = 16
			use_shadow = 1
		}
	endif
endscript

script music_store_hub_create_default_user_control_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_hub 
	if screenelementexists \{id = music_store_ticker_window}
		music_store_ticker_window :se_setprops \{alpha = 0.0}
	endif
	if screenelementexists \{id = music_store_hub}
		music_store_hub :obj_killspawnedscript \{name = scroll_ticker_text}
		music_store_hub :obj_killspawnedscript \{name = songlist_music_store_item_focus}
	endif
	if screenelementexists \{id = music_store_hub}
		destroyscreenelement \{id = music_store_hub}
	endif
	if screenelementexists \{id = music_store_ticker_window_container}
		destroyscreenelement \{id = music_store_ticker_window_container}
	endif
	if screenelementexists \{id = songlist_hilight_bar_cont}
		songlist_hilight_bar_cont :se_setprops \{alpha = 1.0}
	endif
	if screenelementexists \{id = songlist_detail}
		songlist_detail :se_setprops \{alpha = 1.0}
	endif
	cleanup_music_store_preview_grab
	songlist_music_store_assign_text_aliases
	clean_up_user_control_helpers
	songlist_create_default_user_control_helpers \{mode = music_store}
endscript

script ui_deinit_music_store_hub 
	cleanup_music_store_preview_grab
endscript

script music_store_hub_create_menu_options 
	getarraysize \{$g_music_store_hub_options}
	if (<array_size> > 0)
		<i> = 0
		begin
		<item_struct> = (($g_music_store_hub_options) [<i>])
		getscreenelementchildren \{id = current_menu}
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
		repeat <array_size>
	endif
endscript

script music_store_hub_item_focus \{time = 0.1}
	requireparams \{[
			index
		]
		all}
	getscreenelementchildren \{id = current_menu}
	<id> = (<children> [<index>])
	<id> :se_setprops {
		menurow_txt_item_rgba = [22 26 30 255]
		menurow_txt_item_shadow_enabled = false
		time = <time>
	}
	removeparameter \{children}
	getscreenelementchildren id = <id>
	(<children> [1]) :se_setprops alpha = 1.0 time = <time>
	spawnscriptnow music_store_hub_cycle_preview params = {hub_options_index = <index>}
endscript

script music_store_hub_item_unfocus \{time = 0.1}
	requireparams \{[
			index
		]
		all}
	getscreenelementchildren \{id = current_menu}
	<id> = (<children> [<index>])
	<id> :se_setprops {
		menurow_txt_item_rgba = [113 121 133 255]
		menurow_txt_item_shadow_enabled = true
		time = <time>
	}
	if scriptisrunning \{music_store_hub_cycle_preview}
		killspawnedscript \{name = music_store_hub_cycle_preview}
	endif
	removeparameter \{children}
	getscreenelementchildren id = <id>
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
	if scriptisrunning \{music_store_hub_choose}
		return
	endif
	marketplace_exit_check
endscript

script music_store_hub_choose 
	requireparams \{[
			index
		]
		all}
	launchevent \{type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	music_store_select_sfx
	songlist_change_filterspec filterspec = ((($g_music_store_hub_options) [<index>]).filterspec)
	change g_music_store_title = ((($g_music_store_hub_options) [<index>]).text)
	change \{g_songlist_refresh_menus = 1}
	songlist :settags music_store_mode = ((($g_music_store_hub_options) [<index>]).mode)
	songlist_change_sort_index index = ((($g_music_store_hub_options) [<index>]).sort_index)
	generic_event_back \{nosound}
endscript

script music_store_hub_cycle_items 
	if NOT screenelementexists \{id = music_store_hub}
		return
	endif
	if NOT screenelementexists \{id = songlist}
		return
	endif
	music_store_hub :obj_killspawnedscript \{name = songlist_music_store_item_focus}
	music_store_hub :obj_spawnscriptnow songlist_music_store_item_focus params = {
		ui_struct = <content_item>
		hub_item_cycle = 1
		morph_time = 0.5
	}
endscript

script music_store_hub_cycle_preview \{cycle_time = 5.0}
	requireparams \{[
			hub_options_index
		]
		all}
	if NOT screenelementexists \{id = music_store_hub}
		return
	endif
	if NOT screenelementexists \{id = songlist}
		return
	endif
	begin
	music_store_hub :getsingletag \{completed_grab}
	if (<completed_grab> = 1)
		break
	endif
	wait \{3
		gameframes}
	repeat
	preview_array = (($g_music_store_hub_options [<hub_options_index>]).preview_array)
	songlist :getsingletag \{list_name}
	getarraysize <preview_array>
	if (<array_size> > 0)
		i = 0
		begin
		if contentmanfunc func = is_ready name = <list_name>
			contentmanfunc {
				func = request_page
				name = <list_name>
				single_item
				seek = (<preview_array> [<i>])
				callback = music_store_hub_cycle_items
			}
		endif
		wait <cycle_time> seconds
		i = (<i> + 1)
		if (<i> >= <array_size>)
			i = 0
		endif
		repeat
	else
		music_store_hub :obj_killspawnedscript \{name = songlist_music_store_item_focus}
		music_store_hub :se_setprops \{songlist_detail_cont_alpha = 0.0
			time = 0.5}
	endif
endscript

script music_store_preview_content_source_grab 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	getarraysize ($g_music_store_hub_options)
	if (<array_size> <= 0)
		return
	endif
	if NOT screenelementexists \{id = music_store_hub}
		return
	endif
	if NOT screenelementexists \{id = songlist}
		return
	endif
	change \{generic_menu_block_input = 1}
	songlist :getsingletag \{list_name}
	printf \{'music_store_preview_content_source_grab'}
	music_store_hub :getsingletag \{music_store_hub_options_index}
	if (<music_store_hub_options_index> < <array_size>)
		printf \{'music_store_preview_content_source_grab'}
		songlist :getsingletag \{list_name}
		begin
		if contentmanfunc func = is_ready name = <list_name>
			contentmanfunc {
				func = request_page
				name = <list_name>
				current_page
				callback = music_store_preview_content_source_grab_callback
				filterspec = (($g_music_store_hub_options [<music_store_hub_options_index>]).filterspec)
				sortspec = {key = arrived_date alt_key = song_title}
			}
			return
		endif
		wait \{1
			gameframe}
		repeat 1000
	else
		change \{generic_menu_block_input = 0}
		music_store_hub :settags \{completed_grab = 1}
		return
	endif
endscript
g_music_store_preview_max_size = 10

script music_store_preview_content_source_grab_callback 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	printf \{'music_store_preview_content_source_grab_callback'}
	if NOT screenelementexists \{id = music_store_hub}
		change \{generic_menu_block_input = 0}
		return
	endif
	if NOT screenelementexists \{id = songlist}
		change \{generic_menu_block_input = 0}
		return
	endif
	songlist :getsingletag \{list_name}
	if (<page_size> > ($g_music_store_preview_max_size))
		page_size = ($g_music_store_preview_max_size)
	endif
	if (<page_size> > 0)
		contentmanfunc {
			func = request_data
			name = <list_name>
			start_index = 0
			end_index = (<page_size> -1)
			callback = music_store_preview_content_source_grab_data_callback
		}
	else
		music_store_hub :getsingletag \{music_store_hub_options_index}
		music_store_hub_options_index = (<music_store_hub_options_index> + 1)
		music_store_hub :settags music_store_hub_options_index = <music_store_hub_options_index>
		spawnscriptnow \{music_store_preview_content_source_grab}
	endif
endscript

script music_store_preview_content_source_grab_data_callback 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if NOT screenelementexists \{id = music_store_hub}
		change \{generic_menu_block_input = 0}
		return
	endif
	if NOT screenelementexists \{id = songlist}
		change \{generic_menu_block_input = 0}
		return
	endif
	preview_array = []
	images = []
	getarraysize <range>
	if (<array_size> > 0)
		i = 0
		begin
		addarrayelement array = <preview_array> element = ((<range> [<i>]).song_checksum)
		preview_array = <array>
		addarrayelement array = <images> element = ((<range> [<i>]).song_preview_asset_name)
		images = <array>
		i = (<i> + 1)
		repeat <array_size>
	endif
	previewassetcache func = request_image images = <images>
	music_store_hub :getsingletag \{music_store_hub_options_index}
	option_struct = {($g_music_store_hub_options [<music_store_hub_options_index>]) preview_array = <preview_array>}
	setarrayelement arrayname = g_music_store_hub_options globalarray index = <music_store_hub_options_index> newvalue = <option_struct>
	if NOT screenelementexists \{id = music_store_hub}
		change \{generic_menu_block_input = 0}
		return
	endif
	music_store_hub :getsingletag \{music_store_hub_options_index}
	music_store_hub_options_index = (<music_store_hub_options_index> + 1)
	music_store_hub :settags music_store_hub_options_index = <music_store_hub_options_index>
	spawnscriptnow \{music_store_preview_content_source_grab}
endscript

script cleanup_music_store_preview_grab 
	if scriptisrunning \{music_store_preview_content_source_grab}
		killspawnedscript \{name = music_store_preview_content_source_grab}
	endif
	if scriptisrunning \{music_store_preview_content_source_grab_callback}
		killspawnedscript \{name = music_store_preview_content_source_grab_callback}
	endif
	if scriptisrunning \{music_store_preview_content_source_grab_data_callback}
		killspawnedscript \{name = music_store_preview_content_source_grab_data_callback}
	endif
	if scriptisrunning \{music_store_hub_cycle_preview}
		killspawnedscript \{name = music_store_hub_cycle_preview}
	endif
	change \{generic_menu_block_input = 0}
endscript

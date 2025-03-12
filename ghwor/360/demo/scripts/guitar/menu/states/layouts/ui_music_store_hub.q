
script ui_create_music_store_hub 
	setmenuautorepeattimes \{(0.3, 0.1)}
	destroy_dialog_box
	createscreenelement \{type = descinterface
		desc = 'music_store_hub'
		id = music_store_hub
		parent = root_window
		pos = (0.0, 0.0)
		z_priority = 150}
	if isps3
		music_store_set_playstation_logo \{desc = music_store_hub}
		music_store_hub :se_setprops \{music_store_playstation_logo_alpha = 1.0}
	endif
	music_store_hub :settags \{music_store_hub_options_index = 0
		completed_grab = 0}
	if screenelementexists \{id = songlist_detail}
		songlist_detail :se_setprops \{alpha = 0.0
			songlist_detail_cont_alpha = 0.0}
	endif
	if isxenonorwindx
		music_store_hub :se_setprops \{ms_purchase_text_text = qs(0xb0bcf58b)}
	else
		music_store_hub :se_setprops \{xenon_info_cont_alpha = 0.0}
	endif
	if music_store_hub :desc_resolvealias \{name = alias_music_store_hub_vmenu}
		assignalias id = <resolved_id> alias = music_store_hub_vmenu
	else
		scriptassert \{qs(0x5ffdb2cb)}
	endif
	if music_store_hub :desc_resolvealias \{name = alias_store_pack_contents_vmenu}
		assignalias id = <resolved_id> alias = store_pack_contents_vmenu
	else
		scriptassert \{qs(0xfd845456)}
	endif
	if NOT gotparam \{exclusive_device}
		<exclusive_device> = ($primary_controller)
	endif
	music_store_hub_vmenu :se_setprops exclusive_device = <exclusive_device>
	music_store_hub_vmenu :settags exclusive_device = <exclusive_device>
	music_store_hub_vmenu :se_setprops \{event_handlers = [
			{
				pad_up
				music_store_hub_scroll_up
			}
			{
				pad_down
				music_store_hub_scroll_down
			}
			{
				pad_btn_right
				music_store_back_sfx
				params = {
					generic
				}
			}
			{
				pad_btn_right
				music_store_hub_back
			}
		]}
	music_store_hub_create_menu_options exclusive_device = <exclusive_device>
	music_store_hub_create_default_user_control_helpers
	previewassetcache \{func = cancel_all_requests}
	music_store_hub :obj_spawnscriptnow \{music_store_preview_content_source_grab}
	music_store_focus_menu
endscript

script music_store_set_playstation_logo \{desc = songlist}
	if isstandarddef
		<desc> :se_setprops {
			music_store_playstation_logo_texture = playstation_logo_sd
			music_store_playstation_logo_scale = 1.5
			music_store_playstation_logo_dims = (136.0, 32.0)
		}
	else
		<desc> :se_setprops {
			music_store_playstation_logo_texture = playstation_logo_hd720
			music_store_playstation_logo_scale = 1.0
			music_store_playstation_logo_dims = (180.0, 40.0)
		}
	endif
endscript

script music_store_focus_menu 
	<child_index> = 0
	songlist_component :getsingletag \{music_store_mode}
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
	songlist_component :settags \{music_store_mode = hub}
	launchevent type = focus target = music_store_hub_vmenu data = {child_index = <child_index>}
endscript

script music_store_hub_create_default_user_control_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	if ui_event_exists_in_stack \{name = 'band_lobby'}
		add_user_control_helper \{text = qs(0xf03b0975)
			button = red
			z = 100000}
	else
		add_user_control_helper \{text = qs(0x89152f9c)
			button = red
			z = 100000}
	endif
	songlist_component :getsingletag \{tab_enabled}
	if (<tab_enabled> = 1)
		music_store_hub_vmenu :se_setprops \{event_handlers = [
				{
					pad_select
					generic_event_back
					params = {
						data = {
							bypass_return_script = songlist_go_to_song_library_tab
						}
					}
				}
			]
			replace_handlers}
		add_super_user_control_helper \{text = qs(0xae6cf896)
			button = back}
	endif
endscript

script ui_destroy_music_store_hub 
	if screenelementexists \{id = music_store_hub}
		music_store_hub :obj_killspawnedscript \{name = music_store_hub_populate_detail}
	endif
	if screenelementexists \{id = music_store_hub}
		destroyscreenelement \{id = music_store_hub}
	endif
	cleanup_music_store_preview_grab
	songlist_component :membfunc_songlist_uistack_getmode
	if (<mode> = music_store)
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers \{mode = music_store}
	endif
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
		if NOT structurecontains structure = <item_struct> not_visible
			getscreenelementchildren \{id = music_store_hub_vmenu}
			<id> = (<children> [<i>])
			<array> = [
				{focus music_store_hub_item_focus params = {index = <i>}}
				{unfocus music_store_hub_item_unfocus params = {index = <i>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = music_store_hub_choose pad_params = {index = <i>}}}
			]
			<id> :se_setprops {
				event_handlers = <array>
				exclusive_device = <exclusive_device>
			}
			if structurecontains structure = <item_struct> not_focusable
				<id> :se_setprops {
					not_focusable
					menurow_txt_item_rgba = [100 100 100 255]
				}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script music_store_hub_item_focus \{time = 0.1}
	requireparams \{[
			index
		]
		all}
	getscreenelementchildren \{id = music_store_hub_vmenu}
	<id> = (<children> [<index>])
	<id> :se_setprops {
		menurow_txt_item_rgba = ($g_music_store_item_focus_rgba)
		menurow_txt_item_shadow_enabled = false
		menurow_highlight_bar_alpha = 1
		time = <time>
	}
	music_store_hub :obj_spawnscriptnow music_store_hub_cycle_preview params = {hub_options_index = <index>}
endscript

script music_store_hub_item_unfocus \{time = 0.1}
	requireparams \{[
			index
		]
		all}
	getscreenelementchildren \{id = music_store_hub_vmenu}
	<id> = (<children> [<index>])
	<id> :se_setprops {
		menurow_txt_item_rgba = ($g_music_store_item_unfocus_rgba)
		menurow_txt_item_shadow_enabled = true
		menurow_highlight_bar_alpha = 0
		time = <time>
	}
	if scriptisrunning \{music_store_hub_cycle_preview}
		killspawnedscript \{name = music_store_hub_cycle_preview}
	endif
endscript

script music_store_hub_scroll_up 
	ui_sfx \{menustate = generic
		uitype = scrollup}
endscript

script music_store_hub_scroll_down 
	ui_sfx \{menustate = generic
		uitype = scrolldown}
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
		target = music_store_hub_vmenu}
	music_store_hub_vmenu :se_setprops \{block_events}
	ui_sfx \{menustate = generic
		uitype = select}
	spawnscriptnow \{audio_ui_menu_music_off}
	songlist_component :settags \{music_store_seek_override = true}
	<music_store_mode> = ((($g_music_store_hub_options) [<index>]).mode)
	songlist_component :settags {
		music_store_mode = <music_store_mode>
	}
	if structurecontains structure = (($g_music_store_hub_options) [<index>]) invert_filterspec
		songlist_change_filterspec filterspec = ((($g_music_store_hub_options) [<index>]).filterspec) invert_filterspec
	else
		if (<music_store_mode> = recommendations)
			music_store_recommendations_process
			begin
			if ($g_music_store_recommendations_complete = 1)
				getarraysize \{$g_music_store_recommendations}
				if (<array_size> > 0)
					<filterspec> = [
						{
							key = song_checksum
							union_list = ($g_music_store_recommendations)
							comparator = equal
						}
					]
				else
					<passed_in_index> = <index>
					music_store_hub_get_index_by_mode \{mode = new_arrivals}
					<filterspec> = ((($g_music_store_hub_options) [<index>]).filterspec)
					<element> = {
						key = type
						union_list = [pack album song]
						comparator = equal
					}
					addarrayelement array = <filterspec> element = <element>
					<filterspec> = <array>
					<index> = <passed_in_index>
				endif
				songlist_change_filterspec filterspec = <filterspec>
				break
			endif
			wait \{1
				gameframe}
			repeat
		else
			songlist_change_filterspec filterspec = ((($g_music_store_hub_options) [<index>]).filterspec)
		endif
	endif
	change g_music_store_hub_options_index = <index>
	change \{g_songlist_refresh_menus = 1}
	songlist_change_sort_index index = ((($g_music_store_hub_options) [<index>]).sort_index)
	if structurecontains structure = (($g_music_store_hub_options) [<index>]) pad_choose_script
		((($g_music_store_hub_options) [<index>]).pad_choose_script)
	endif
	hide_glitch \{num_frames = 8}
	generic_event_back \{nosound
		data = {
			no_pivot
		}}
endscript

script music_store_hub_cycle_items 
	if NOT screenelementexists \{id = music_store_hub}
		return
	endif
	if NOT screenelementexists \{id = songlist}
		return
	endif
	music_store_hub :obj_killspawnedscript \{name = music_store_hub_populate_detail}
	music_store_hub :obj_spawnscriptnow music_store_hub_populate_detail params = {
		ui_struct = <content_item>
		morph_time = 0.5
	}
endscript

script music_store_hub_populate_detail \{morph_time = 0.0
		ui_struct = 0x69696969}
	music_store_hub :se_setprops {
		store_pack_contents_vmenu_alpha = 0.0
		album_art_alpha = 0.0
		time = <morph_time>
	}
	wait <morph_time> seconds
	destroyscreenelement \{id = store_pack_contents_vmenu
		preserve_parent}
	setscreenelementlock \{id = store_pack_contents_vmenu
		off}
	setscreenelementlock \{id = store_pack_contents_vmenu
		on}
	getscreenelementchildren \{id = store_pack_contents_vmenu}
	if (<ui_struct>.type = song)
		<line0> = (<ui_struct>.song_title)
		<line1> = (<ui_struct>.song_artist)
		formattext textname = album_year_text qs(0x69a0e5e0) a = (<ui_struct>.album) y = (<ui_struct>.song_year)
		<line2> = <album_year_text>
		createscreenelement {
			type = descinterface
			desc = 'music_store_hub_pack_item'
			parent = store_pack_contents_vmenu
			line_0_text = <line0>
			line_1_fit_height = `expand dims`
			line_1_text = <line1>
			line_2_fit_height = `expand dims`
			line_2_text = <line2>
			autosizedims = true
		}
		<id> :desc_refreshcontentdims
	elseif (<ui_struct>.type = pack || <ui_struct>.type = import)
		if (<ui_struct>.type = pack)
			<title_array> = (<ui_struct>.title_strings)
			<artist_array> = (<ui_struct>.artist_strings)
			getarraysize <title_array>
		else
			getarraysize (<ui_struct>.contents)
		endif
		if (<array_size> > 3)
			<iters> = 3
		else
			<iters> = <array_size>
		endif
		<i> = 0
		begin
		if (<ui_struct>.type = pack)
			<line0> = (<title_array> [<i>])
			<line1> = (<artist_array> [<i>])
		else
			<line0> = ((<ui_struct>.contents) [<i>].title)
			<line1> = ((<ui_struct>.contents) [<i>].artist)
		endif
		createscreenelement {
			type = descinterface
			desc = 'music_store_hub_pack_item'
			parent = store_pack_contents_vmenu
			line_0_text = <line0>
			line_1_fit_height = `expand dims`
			line_1_text = <line1>
			autosizedims = true
		}
		<id> :desc_refreshcontentdims
		<i> = (<i> + 1)
		repeat <iters>
		if (<array_size> > 3)
			formattext textname = more_songs qs(0x560b5eda) n = (<array_size> - 3)
			createscreenelement {
				type = descinterface
				desc = 'music_store_hub_pack_item'
				parent = store_pack_contents_vmenu
				line_0_text = <more_songs>
				autosizedims = true
			}
			<id> :desc_refreshcontentdims
		endif
	elseif (<ui_struct>.type = patch)
		createscreenelement {
			type = descinterface
			desc = 'music_store_hub_pack_item'
			parent = store_pack_contents_vmenu
			line_0_text = (<ui_struct>.song_title)
			autosizedims = true
		}
		<id> :desc_refreshcontentdims
	else
		<line0> = (<ui_struct>.song_title)
		<line1> = (<ui_struct>.song_artist)
		<line2> = qs(0x73ab05d2)
		createscreenelement {
			type = descinterface
			desc = 'music_store_hub_pack_item'
			parent = store_pack_contents_vmenu
			line_0_text = <line0>
			line_1_fit_height = `expand dims`
			line_1_text = <line1>
			line_2_fit_height = `expand dims`
			line_2_text = <line2>
			autosizedims = true
		}
		<id> :desc_refreshcontentdims
	endif
	if structurecontains structure = <ui_struct> song_preview_asset_name
		music_store_change_album_cover {
			texture_name = (<ui_struct>.song_preview_asset_name)
			desc = music_store_hub
		}
	endif
	music_store_hub :se_setprops {
		store_pack_contents_vmenu_alpha = 1.0
		album_art_alpha = 1.0
		time = <morph_time>
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
	songlist_component :membfunc_songlist_uistack_getlistname
	getarraysize <preview_array>
	if (<array_size> > 0)
		<i> = 0
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
		<i> = (<i> + 1)
		if (<i> >= <array_size>)
			<i> = 0
		endif
		repeat
	else
		<time> = 0.5
		music_store_hub :obj_killspawnedscript \{name = music_store_hub_populate_detail}
		music_store_hub :se_setprops {
			store_pack_contents_vmenu_alpha = 0.0
			time = <time>
		}
		music_store_hub :se_getprops
		if (<songlist_detail_album_sprite_texture> != mainmenu_logo_lrg)
			music_store_hub :se_setprops {
				album_art_alpha = 0.0
				time = <time>
			}
			wait <time> seconds
			music_store_hub :se_setprops \{songlist_detail_album_sprite_texture = mainmenu_logo_lrg}
		endif
		music_store_hub :se_setprops {
			album_art_alpha = 1.0
			time = <time>
		}
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
	songlist_component :membfunc_songlist_uistack_getlistname
	music_store_hub :getsingletag \{music_store_hub_options_index}
	if (<music_store_hub_options_index> < <array_size>)
		if structurecontains structure = (($g_music_store_hub_options) [<music_store_hub_options_index>]) no_previews
			onexitrun \{music_store_preview_content_source_dont_preview}
			return
		endif
		begin
		if contentmanfunc func = is_ready name = <list_name>
			<cman_params> = {
				func = request_page
				name = <list_name>
				current_page
				callback = music_store_preview_content_source_grab_callback
				filterspec = (($g_music_store_hub_options [<music_store_hub_options_index>]).filterspec)
				sortspec = {key = arrived_date alt_key = song_title}
			}
			if structurecontains structure = ($g_music_store_hub_options [<music_store_hub_options_index>]) invert_filterspec
				contentmanfunc {
					<cman_params>
					invert_filterspec = 1
				}
			else
				contentmanfunc {
					<cman_params>
				}
			endif
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

script music_store_preview_content_source_dont_preview 
	change \{generic_menu_block_input = 0}
	music_store_hub :getsingletag \{music_store_hub_options_index}
	music_store_hub_options_index = (<music_store_hub_options_index> + 1)
	music_store_hub :settags music_store_hub_options_index = <music_store_hub_options_index>
	music_store_hub :obj_spawnscriptnow \{music_store_preview_content_source_grab}
endscript

script music_store_preview_content_source_grab_callback 
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
	songlist_component :membfunc_songlist_uistack_getlistname
	if (<page_size> > ($g_music_store_preview_max_size))
		page_size = ($g_music_store_preview_max_size)
	endif
	if (<page_size> > 0)
		contentmanfunc {
			func = request_data
			name = <list_name>
			start_index = 0
			end_index = (<page_size> - 1)
			callback = music_store_preview_content_source_grab_data_callback
		}
	else
		music_store_hub :getsingletag \{music_store_hub_options_index}
		music_store_hub_options_index = (<music_store_hub_options_index> + 1)
		music_store_hub :settags music_store_hub_options_index = <music_store_hub_options_index>
		music_store_hub :obj_spawnscriptnow \{music_store_preview_content_source_grab}
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
	<preview_array> = []
	<images> = []
	getarraysize <range>
	if (<array_size> > 0)
		<i> = 0
		begin
		addarrayelement array = <preview_array> element = ((<range> [<i>]).song_checksum)
		<preview_array> = <array>
		addarrayelement array = <images> element = ((<range> [<i>]).song_preview_asset_name)
		<images> = <array>
		<i> = (<i> + 1)
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
	music_store_hub :obj_spawnscriptnow \{music_store_preview_content_source_grab}
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

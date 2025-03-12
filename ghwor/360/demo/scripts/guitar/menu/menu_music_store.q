music_store_attempted_purchase = 0

script music_store_preload_album_covers 
	requireparams \{[
			list
		]
		all}
	calculate_preview_image_limit
	getarraysize <list>
	if (<array_size> > 0)
		if (<array_size> > <limit>)
			array_size = <limit>
		endif
		array = []
		i = 0
		begin
		if structurecontains structure = (<list> [<i>]) song_preview_asset_name
			addarrayelement array = <array> element = ((<list> [<i>]).song_preview_asset_name)
		endif
		i = (<i> + 1)
		repeat <array_size>
		previewassetcache func = request_image images = <array>
	endif
endscript

script music_store_change_album_cover \{desc = songlist_detail}
	requireparams \{[
			texture_name
		]
		all}
	if NOT screenelementexists id = <desc>
		return
	endif
	if scriptisrunning \{music_store_replace_album_cover_when_loaded}
		killspawnedscript \{name = music_store_replace_album_cover_when_loaded}
	endif
	formattext checksumname = texture_id '%s_image_dl' s = <texture_name> addtostringlookup = true
	formattext checksumname = texture 'download/preview/%s_image_dl.img' s = <texture_name> addtostringlookup = true
	music_store_get_current_album_texture desc = <desc>
	if (<texture_id> != <current_album_texture>)
		previewassetcache func = release_image name = <current_album_texture>
	endif
	<desc> :se_setprops songlist_detail_album_sprite_texture = mainmenu_logo_lrg
	<desc> :obj_spawnscriptnow music_store_replace_album_cover_when_loaded params = {texture_id = <texture_id> texture = <texture> desc = <desc>}
endscript

script music_store_replace_album_cover_when_loaded \{desc = songlist_detail}
	requireparams \{[
			texture_id
			texture
		]
		all}
	if NOT screenelementexists id = <desc>
		return
	endif
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	music_store_turn_on_loading desc = <desc>
	begin
	if previewassetcache func = is_image_loaded name = <texture_id>
		printf \{qs(0x37f47d5b)}
		music_store_turn_off_loading desc = <desc>
		previewassetcache func = lock_image name = <texture_id>
		music_store_set_current_album_texutre texture_id = <texture_id> desc = <desc>
		if screenelementexists id = <desc>
			<desc> :se_setprops songlist_detail_album_sprite_texture = <texture>
		endif
		return
	endif
	wait \{5
		gameframes}
	repeat 500
	music_store_turn_off_loading desc = <desc>
	printf \{qs(0x8ed15842)}
endscript

script music_store_get_current_album_texture 
	if screenelementexists id = <desc>
		current_album_texture_id = mainmenu_logo_lrg
		<desc> :getsingletag current_album_texture_id
		return current_album_texture = <current_album_texture_id>
	else
		scriptassert \{'music_store_get_current_album_texture was called while ScreenElement did not exist'}
	endif
endscript

script music_store_set_current_album_texutre 
	requireparams \{[
			texture_id
		]}
	if screenelementexists id = <desc>
		<desc> :settags current_album_texture_id = <texture_id>
	else
		scriptassert \{'music_store_set_current_album_texutre was called while ScreenElement did not exist'}
	endif
endscript

script music_store_preload_preview_music 
	requireparams \{[
			list
		]
		all}
	getarraysize <list>
	if (<array_size> > 0)
		array = []
		i = 0
		begin
		if structurecontains structure = (<list> [<i>]) song_preview_asset_name
			addarrayelement array = <array> element = ((<list> [<i>]).song_preview_asset_name)
		endif
		i = (<i> + 1)
		repeat <array_size>
		previewassetcache func = request_sound music = <array>
	endif
endscript

script music_store_request_preview_music 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if scriptisrunning \{music_store_monitor_loop_sound}
		return
	endif
	requireparams \{[
			music_name
		]
		all}
	if screenelementexists \{id = songlist_component}
		songlist_component :getsingletag \{music_id}
		if gotparam \{music_id}
			if issoundplayingbyid <music_id>
				return
			endif
		endif
	endif
	if isps3
		plat = 'ps3'
	else
		plat = 'xen'
	endif
	music_store_turn_on_loading \{desc = songlist_options}
	begin
	formattext checksumname = music_short_name '%s_music_dl' s = <music_name> addtostringlookup = true
	formattext checksumname = music 'download/preview/%p/%s_music_dl.fsb' s = <music_name> p = <plat> addtostringlookup = true
	if previewassetcache func = is_sound_loaded name = <music_short_name>
		printf \{qs(0xc002938d)}
		music_store_turn_off_loading \{desc = songlist_options}
		previewassetcache func = lock_sound name = <music_short_name>
		playsound <music> vol_percent = 100 buss = music_setlist
		spawnscriptnow music_store_monitor_loop_sound params = {unique_id = <unique_id> music_name = <music_short_name> music = <music>}
		if screenelementexists \{id = songlist_component}
			songlist_component :settags {
				music_id = <unique_id>
				music_name = <music_short_name>
			}
		endif
		return
	endif
	wait \{5
		gameframes}
	repeat 500
	music_store_turn_off_loading \{desc = songlist_options}
	printf \{qs(0x3175584a)}
endscript

script music_store_kill_preview_music 
	music_store_turn_off_loading
	if scriptisrunning \{music_store_request_preview_music}
		killspawnedscript \{name = music_store_request_preview_music}
	endif
	if scriptisrunning \{music_store_monitor_loop_sound}
		killspawnedscript \{name = music_store_monitor_loop_sound}
	endif
	if screenelementexists \{id = songlist_component}
		songlist_component :getsingletag \{music_id}
		if gotparam \{music_id}
			if issoundplayingbyid <music_id>
				stopsound unique_id = <music_id>
			endif
		endif
		songlist_component :getsingletag \{music_name}
		if gotparam \{music_name}
			previewassetcache func = release_sound name = <music_name>
		endif
	endif
endscript

script music_store_turn_on_loading \{desc = songlist_detail}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if screenelementexists id = <desc>
		<desc> :se_setprops loading_alpha = 1.0
		if <desc> :desc_resolvealias name = alias_instrument_spinner2 param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 1.0
			<alias_instrument_spinner> :obj_killspawnedscript name = music_store_animate_loading
			<alias_instrument_spinner> :obj_spawnscriptnow music_store_animate_loading
		endif
		if <desc> :desc_resolvealias name = alias_instrument_spinner param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 1.0
			<alias_instrument_spinner> :obj_killspawnedscript name = music_store_animate_loading
			<alias_instrument_spinner> :obj_spawnscriptnow music_store_animate_loading
		endif
	endif
endscript

script music_store_turn_off_loading \{desc = songlist_detail}
	if screenelementexists id = <desc>
		<desc> :se_setprops loading_alpha = 0.0
		if <desc> :desc_resolvealias name = alias_instrument_spinner2 param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 0.0
			<alias_instrument_spinner> :obj_killspawnedscript name = music_store_animate_loading
		endif
		if <desc> :desc_resolvealias name = alias_instrument_spinner param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 0.0
			<alias_instrument_spinner> :obj_killspawnedscript name = music_store_animate_loading
		endif
	endif
endscript

script music_store_animate_loading 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	instrument_spinner_ui_icon_anim
endscript

script music_store_monitor_loop_sound 
	requireparams \{[
			unique_id
			music_name
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if previewassetcache func = is_sound_loaded name = <music_name>
		previewassetcache func = lock_sound name = <music_name>
		if NOT issoundplayingbyid <unique_id>
			wait \{1.0
				seconds}
			playsound <music> vol_percent = 100 buss = music_setlist
			if screenelementexists \{id = songlist_component}
				songlist_component :settags {
					music_id = <unique_id>
				}
			endif
		endif
	endif
	wait \{5
		gameframes}
	repeat
endscript

script marketplace_exit_check 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_getparentid
	if screenelementexists id = <parent_id>
		launchevent type = unfocus target = <parent_id>
	endif
	if ($music_store_attempted_purchase = 1)
		destroy_dialog_box
		songlist_clean_up_spawned_scripts
		body_text = qs(0x03ac90f0)
		if isps3
			body_text = $g_musicstore_ps3_library_instructions
		else
			body_text = qs(0x6edb0af6)
		endif
		create_dialog_box {
			no_background
			heading_text = qs(0xcf5deb58)
			body_text = <body_text>
			player_device = ($primary_controller)
			options = [
				{
					text = qs(0x29fff5f2)
					func = marketplace_exit_check_warning_exit
				}
				{
					text = qs(0xd583470f)
					func = marketplace_exit_check_warning_cancel
				}
			]
		}
		return
	endif
	if ui_event_exists_in_stack \{name = 'band_lobby'}
		<back_state> = uistate_band_lobby
	else
		<back_state> = uistate_mainmenu
	endif
	generic_event_back_block state = <back_state> nosound
endscript

script marketplace_exit_check_warning 
	launchevent \{type = unfocus
		target = music_store_hub_vmenu}
	destroy_dialog_box
	create_dialog_box {
		template = <template>
		heading_text = <title>
		body_text = <body_text>
		options = <options>
		player_device = ($primary_controller)
	}
endscript

script marketplace_exit_check_warning_cancel 
	destroy_dialog_box
	launchevent \{type = unfocus
		target = music_store_hub_vmenu}
	launchevent \{type = focus
		target = music_store_hub_vmenu}
	music_store_hub_create_default_user_control_helpers
endscript

script marketplace_exit_check_warning_exit 
	destroy_dialog_box
	launchevent \{type = focus
		target = music_store_hub_vmenu
		data = {
			child_index = 0
		}}
	if ui_event_exists_in_stack \{name = 'band_lobby'}
		<back_state> = uistate_band_lobby
	else
		<back_state> = uistate_mainmenu
	endif
	generic_event_back state = <back_state> nosound
endscript

script music_store_purchase_content \{purchase_struct = 0x69696969}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{'music_store_purchase_content - Starting checkout'}
	printstruct <purchase_struct>
	change \{music_store_attempted_purchase = 1}
	change \{generic_menu_block_input = 1}
	pushunsafeforshutdown \{context = music_store_purchase_content}
	if isps3
		destroy_band
		destroy_song_and_musicstudio_heaps \{do_unloads}
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
	endif
	marketplacefunc func = checkout id = (<purchase_struct>.code)
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = checkout)
		if NOT (<state> = download)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	if marketplacefunc \{func = completed_checkout}
		change \{g_ps3_dlc_scan_occured = 0}
		if structurecontains structure = <purchase_struct> song_checksum
			broadcastevent type = dlc_purchased data = {player = 1 controller_index = ($primary_controller) store_purchase = (<purchase_struct>.song_checksum)}
		endif
	endif
	popunsafeforshutdown \{context = music_store_purchase_content}
	change \{generic_menu_block_input = 0}
	printf \{'music_store_purchase_content - Done checkout'}
endscript

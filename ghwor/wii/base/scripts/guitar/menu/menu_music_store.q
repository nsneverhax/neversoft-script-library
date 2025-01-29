music_store_attempted_purchase = 0

script music_store_preload_album_covers 
	RequireParams \{[
			list
		]
		all}
	calculate_preview_image_limit
	GetArraySize <list>
	if (<array_Size> > 0)
		if (<array_Size> > <limit>)
			array_Size = <limit>
		endif
		array = []
		i = 0
		begin
		if StructureContains structure = (<list> [<i>]) song_preview_asset_name
			AddArrayElement array = <array> element = ((<list> [<i>]).song_preview_asset_name)
		endif
		i = (<i> + 1)
		repeat <array_Size>
		previewassetcache func = request_image images = <array>
	endif
endscript

script music_store_change_album_cover \{desc = songlist_detail}
	RequireParams \{[
			texture_name
		]
		all}
	if NOT ScreenElementExists id = <desc>
		return
	endif
	if ScriptIsRunning \{music_store_replace_album_cover_when_loaded}
		KillSpawnedScript \{Name = music_store_replace_album_cover_when_loaded}
	endif
	if GotParam \{local_texture}
		formatText checksumName = texture_id '%s' s = <texture_name> AddToStringLookup = true
		<texture> = <texture_id>
	else
		formatText checksumName = texture_id '%s_image_dl' s = <texture_name> AddToStringLookup = true
		formatText checksumName = texture 'download/preview/%s_image_dl.img' s = <texture_name> AddToStringLookup = true
	endif
	music_store_get_current_album_texture desc = <desc>
	if (<texture_id> != <current_album_texture>)
		previewassetcache func = release_image Name = <current_album_texture>
	endif
	<desc> :se_setprops songlist_detail_album_sprite_texture = logo_gh5_256
	<desc> :Obj_SpawnScriptNow music_store_replace_album_cover_when_loaded params = {texture_id = <texture_id> texture = <texture> desc = <desc>}
endscript

script music_store_replace_album_cover_when_loaded \{desc = songlist_detail}
	RequireParams \{[
			texture_id
			texture
		]
		all}
	if NOT ScreenElementExists id = <desc>
		return
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	music_store_turn_on_loading desc = <desc>
	begin
	if previewassetcache func = is_image_loaded Name = <texture_id>
		printf \{qs(0x37f47d5b)}
		music_store_turn_off_loading desc = <desc>
		previewassetcache func = lock_image Name = <texture_id>
		music_store_set_current_album_texutre texture_id = <texture_id> desc = <desc>
		if ScreenElementExists id = <desc>
			<desc> :se_setprops songlist_detail_album_sprite_texture = <texture>
		endif
		return
	endif
	Wait \{5
		gameframes}
	repeat 500
	music_store_turn_off_loading desc = <desc>
	printf \{qs(0x8ed15842)}
endscript

script music_store_get_current_album_texture 
	if ScreenElementExists id = <desc>
		current_album_texture_id = logo_gh5_256
		<desc> :GetSingleTag current_album_texture_id
		return current_album_texture = <current_album_texture_id>
	else
		ScriptAssert \{'music_store_get_current_album_texture was called while ScreenElement did not exist'}
	endif
endscript

script music_store_set_current_album_texutre 
	RequireParams \{[
			texture_id
		]}
	if ScreenElementExists id = <desc>
		<desc> :SetTags current_album_texture_id = <texture_id>
	else
		ScriptAssert \{'music_store_set_current_album_texutre was called while ScreenElement did not exist'}
	endif
endscript

script music_store_preload_preview_music 
	RequireParams \{[
			list
		]
		all}
	GetArraySize <list>
	if (<array_Size> > 0)
		array = []
		i = 0
		begin
		if StructureContains structure = (<list> [<i>]) song_preview_asset_name
			AddArrayElement array = <array> element = ((<list> [<i>]).song_preview_asset_name)
		endif
		i = (<i> + 1)
		repeat <array_Size>
		previewassetcache func = request_sound music = <array>
	endif
endscript

script music_store_request_preview_music 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScriptIsRunning \{music_store_monitor_loop_sound}
		return
	endif
	RequireParams \{[
			music_name
		]
		all}
	if ScreenElementExists \{id = songlist_component}
		songlist_component :GetSingleTag \{music_id}
		if GotParam \{music_id}
			if issoundplayingbyid <music_id>
				return
			endif
		endif
	endif
	if isps3
		plat = 'ps3'
	elseif isngc
		plat = 'wii'
	else
		plat = 'xen'
	endif
	music_store_turn_on_loading \{desc = songlist_options}
	begin
	formatText checksumName = music_short_name '%s_music_dl' s = <music_name> AddToStringLookup = true
	formatText checksumName = music '%s_music_dl' s = <music_name> p = <plat> AddToStringLookup = true
	if previewassetcache func = is_sound_loaded Name = <music_short_name>
		printf \{qs(0xc002938d)}
		music_store_turn_off_loading \{desc = songlist_options}
		previewassetcache func = lock_sound Name = <music_short_name>
		PlaySound <music> vol_percent = 100 buss = Music_Setlist
		SpawnScriptNow music_store_monitor_loop_sound params = {unique_id = <unique_id> music_name = <music_short_name> music = <music>}
		if ScreenElementExists \{id = songlist_component}
			songlist_component :SetTags {
				music_id = <unique_id>
				music_name = <music_short_name>
			}
		endif
		return
	else
		array = []
		AddArrayElement array = <array> element = <music_name>
		previewassetcache func = request_sound_now music = <array>
	endif
	Wait \{5
		gameframes}
	repeat 500
	music_store_turn_off_loading \{desc = songlist_options}
	printf \{qs(0x3175584a)}
endscript

script music_store_kill_preview_music 
	music_store_turn_off_loading
	if ScriptIsRunning \{music_store_request_preview_music}
		KillSpawnedScript \{Name = music_store_request_preview_music}
	endif
	if ScriptIsRunning \{music_store_monitor_loop_sound}
		KillSpawnedScript \{Name = music_store_monitor_loop_sound}
	endif
	if ScreenElementExists \{id = songlist_component}
		songlist_component :GetSingleTag \{music_id}
		songlist_component :GetSingleTag \{music_name}
		if GotParam \{music_name}
			if GotParam \{music_id}
				if issoundplayingbyid <music_id>
					stopsound <music_name>
				endif
			endif
			previewassetcache func = release_sound Name = <music_name>
		endif
		songlist_component :RemoveTags \{[
				music_id
				music_name
			]}
	endif
endscript

script music_store_turn_on_loading \{desc = songlist_detail}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists id = <desc>
		<desc> :se_setprops loading_alpha = 1.0
		if <desc> :desc_resolvealias Name = alias_instrument_spinner2 param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 1.0
			<alias_instrument_spinner> :Obj_KillSpawnedScript Name = music_store_animate_loading
			<alias_instrument_spinner> :Obj_SpawnScriptNow music_store_animate_loading
		endif
		if <desc> :desc_resolvealias Name = alias_instrument_spinner param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 1.0
			<alias_instrument_spinner> :Obj_KillSpawnedScript Name = music_store_animate_loading
			<alias_instrument_spinner> :Obj_SpawnScriptNow music_store_animate_loading
		endif
	endif
endscript

script music_store_turn_off_loading \{desc = songlist_detail}
	if ScreenElementExists id = <desc>
		<desc> :se_setprops loading_alpha = 0.0
		if <desc> :desc_resolvealias Name = alias_instrument_spinner2 param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 0.0
			<alias_instrument_spinner> :Obj_KillSpawnedScript Name = music_store_animate_loading
		endif
		if <desc> :desc_resolvealias Name = alias_instrument_spinner param = alias_instrument_spinner
			<alias_instrument_spinner> :se_setprops alpha = 0.0
			<alias_instrument_spinner> :Obj_KillSpawnedScript Name = music_store_animate_loading
		endif
	endif
endscript

script music_store_animate_loading 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	instrument_spinner_ui_icon_anim
endscript

script music_store_monitor_loop_sound 
	RequireParams \{[
			unique_id
			music_name
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if previewassetcache func = is_sound_loaded Name = <music_name>
		previewassetcache func = lock_sound Name = <music_name>
		if NOT issoundplayingbyid <unique_id>
			Wait \{1.0
				Seconds}
			PlaySound <music> vol_percent = 100 buss = Music_Setlist
			if ScreenElementExists \{id = songlist_component}
				songlist_component :SetTags {
					music_id = <unique_id>
				}
			endif
		endif
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script music_store_entry_dialog_script 
	printf \{'inside music_store_entry_dialog_script'}
	if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_body_vmenu}
		LaunchEvent Type = focus target = <resolved_id>
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back music_store_try_cancel_entry}
			]
			replace_handlers
		}
	endif
	begin
	if marketplacefunc \{func = is_inited}
		if marketplacefunc \{func = get_enum_progress}
			music_store_update_enum_dialog <...>
		endif
		if marketplacefunc \{func = can_cancel_enum}
			if NOT user_control_helper_exists \{button = red}
				add_user_control_helper \{text = qs(0xf7723015)
					button = red
					z = 100000}
			endif
		else
			if user_control_helper_exists \{button = red}
				user_control_destroy_helper \{button = red}
			endif
		endif
	else
		if user_control_helper_exists \{button = red}
			user_control_destroy_helper \{button = red}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script music_store_update_enum_dialog 
	RequireParams \{[
			Stage
		]
		all}
	<body_text> = qs(0x3962f973)
	switch (<Stage>)
		case get_contents
		case get_contents_waiting
		case get_contents_result
		<body_text> = qs(0x765e7010)
		case get_titles
		case get_titles_waiting
		case get_titles_result
		case check_for_updates
		<body_text> = qs(0x64f50b12)
		case download_updates
		case backup_updates
		<body_text> = qs(0x194a8ab4)
		case check_ecard
		case check_ecard_waiting
		case check_ecard_result
		case list_ecard_items
		case list_ecard_items_waiting
		case list_ecard_items_result
		<body_text> = qs(0xdf46632e)
		case canceling
		if GotParam \{ecard_check}
			<body_text> = qs(0x7f332dc4)
		else
			<body_text> = qs(0xc322f83e)
		endif
		case finished
		if GotParam \{ecard_check}
			<body_text> = qs(0xdf46632e)
		else
			<body_text> = qs(0xc14204b5)
		endif
		case failed
		if GotParam \{ecard_check}
			<body_text> = qs(0xdf46632e)
		else
			<body_text> = qs(0x621d903c)
		endif
	endswitch
	formatText TextName = body_text qs(0x17b336eb) s = <body_text>
	dialog_box_desc_id :se_setprops dlog_body_text = <body_text>
endscript

script music_store_try_cancel_entry 
	if marketplacefunc \{func = is_inited}
		if marketplacefunc \{func = can_cancel_enum}
			printf \{'music_store_try_cancel_entry - trying to cancel enumeration process!'}
			marketplacefunc \{func = cancel_enum}
		endif
	endif
endscript

script marketplace_exit_check 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_getparentid
	if ScreenElementExists id = <parent_id>
		LaunchEvent Type = unfocus target = <parent_id>
	endif
	if ($music_store_attempted_purchase = 1)
		destroy_dialog_box
		songlist_clean_up_spawned_scripts
		create_dialog_box {
			no_background
			heading_text = qs(0xcf5deb58)
			body_text = qs(0x6edb0af6)
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
	if ui_event_exists_in_stack \{Name = 'band_lobby'}
		<back_state> = uistate_band_lobby
		generic_event_back_block state = <back_state> nosound
	else
		wii_music_store_back
	endif
endscript

script marketplace_exit_check_warning_cancel 
	destroy_dialog_box
	LaunchEvent \{Type = unfocus
		target = music_store_hub_vmenu}
	LaunchEvent \{Type = focus
		target = music_store_hub_vmenu}
	music_store_hub_create_default_user_control_helpers
endscript

script marketplace_exit_check_warning_exit 
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = music_store_hub_vmenu
		data = {
			child_index = 0
		}}
	wii_music_store_back
endscript

script music_store_purchase_content 
	printf \{'music_store_purchase_content - Starting checkout'}
	Change \{generic_menu_block_input = 1}
	pushunsafeforshutdown \{context = music_store_purchase_content}
	disablereset
	sdcardmanagerfunc \{func = setup_transfer}
	previewassetcache \{func = cancel_all_requests}
	previewassetcache \{func = cancel_active_request}
	marketplacefunc func = checkout dry_run = <dry_run>
	LaunchEvent \{Type = unfocus
		target = current_menu}
	if NOT GotParam \{dry_run}
		sdcardmanagerfunc \{func = force_hold_ejects}
		music_store_show_checkout_progress_dialog
		broadcast_dlc_purchased_friend_feed_msg purchase_struct = ($g_music_store_purchase_struct)
	endif
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = checkout)
		if NOT (<state> = download)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		gameframe}
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
	marketplacefunc \{func = get_cart_error}
	printf 'handling error after checkout, error is %s with error code %c' s = <error_crc> c = <error_code>
	sdcardmanagerfunc \{func = shutdown_transfer}
	popunsafeforshutdown \{context = music_store_purchase_content}
	enablereset
	Change \{generic_menu_block_input = 0}
	transfer_type = backup
	printstruct <...>
	if music_store_handle_error <...> func = dlc_error_music_store_purchase_go_to_scan_marketplace fatal_func = dlc_error_exit_to_main_menu_part1
		songlist_component :GetSingleTag \{music_store_mode}
		if NOT (<music_store_mode> = download_list)
			marketplacefunc \{func = clear_cart}
		endif
		sdcardmanagerfunc \{func = force_hold_ejects
			OFF}
		return \{FALSE}
	endif
	printf \{'music_store_purchase_content - Done checkout'}
	if NOT GotParam \{dry_run}
		marketplacefunc \{func = get_wii_values}
		formatText TextName = wii_points_text qs(0x2f387f3e) d = <wii_points>
		SongList :se_setprops wiipoints_text = <wii_points_text>
		marketplacefunc \{func = clear_cart}
		if NOT ui_event_exists_in_stack \{Name = 'music_store_unavailible'}
			if ($shutdown_game_for_signin_change_flag = 0)
				Change \{g_songlist_sd_card_required = 0}
				ui_event event = menu_replace data = {is_popup state = uistate_music_store_scan_marketplace data = {purchase_struct = <purchase_struct>}}
			endif
		endif
	endif
	printf \{'music_store_purchase_content - Done checkout'}
	return \{true}
endscript

script music_store_update_blocks_info 
	songlist_component :GetSingleTag \{music_store_mode}
	if (<music_store_mode> = download_list)
		songlist_detail :se_setprops \{songlist_block_info_alpha = 1.0}
	else
		songlist_detail :se_setprops \{songlist_block_info_alpha = 0.0}
	endif
endscript

script music_store_hit_back_button 
	songlist_component :GetSingleTag \{music_store_mode}
	if (<music_store_mode> = download_list)
		LaunchEvent \{Type = pad_btn_right
			target = current_menu}
	else
		songlist_back
	endif
endscript

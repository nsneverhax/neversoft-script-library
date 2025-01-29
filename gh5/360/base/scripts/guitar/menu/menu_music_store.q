
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
	formatText checksumName = texture_id '%s_image_dl' s = <texture_name> AddToStringLookup = true
	formatText checksumName = texture 'download/preview/%s_image_dl.img' s = <texture_name> AddToStringLookup = true
	music_store_get_current_album_texture
	if (<texture_id> != <current_album_texture>)
		previewassetcache func = release_image Name = <current_album_texture>
	endif
	<desc> :se_setprops songlist_detail_album_sprite_texture = logo_gh5_256
	SpawnScriptNow music_store_replace_album_cover_when_loaded params = {texture_id = <texture_id> texture = <texture> desc = <desc>}
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
		music_store_set_current_album_texutre texture_id = <texture_id>
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
	if ScreenElementExists \{id = songlist_detail}
		current_album_texture_id = logo_gh5_256
		songlist_detail :GetSingleTag \{current_album_texture_id}
		return current_album_texture = <current_album_texture_id>
	else
		ScriptAssert \{'music_store_get_current_album_texture was called while ScreenElement SongList_detail did not exist'}
	endif
endscript

script music_store_set_current_album_texutre 
	RequireParams \{[
			texture_id
		]}
	if ScreenElementExists \{id = songlist_detail}
		songlist_detail :SetTags current_album_texture_id = <texture_id>
	else
		ScriptAssert \{'music_store_set_current_album_texutre was called while ScreenElement SongList_detail did not exist'}
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
	if ScreenElementExists \{id = SongList}
		SongList :GetSingleTag \{music_id}
		if GotParam \{music_id}
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
	music_store_turn_on_loading
	begin
	formatText checksumName = music_short_name '%s_music_dl' s = <music_name> AddToStringLookup = true
	formatText checksumName = music 'download/preview/%p/%s_music_dl.fsb' s = <music_name> p = <plat> AddToStringLookup = true
	if previewassetcache func = is_sound_loaded Name = <music_short_name>
		printf \{qs(0xc002938d)}
		music_store_turn_off_loading
		previewassetcache func = lock_sound Name = <music_short_name>
		PlaySound <music> vol_percent = 100 buss = Music_Setlist
		SpawnScriptNow music_store_monitor_loop_sound params = {unique_id = <unique_id> music_name = <music_short_name> music = <music>}
		if ScreenElementExists \{id = SongList}
			SongList :SetTags {music_id = <unique_id> music_name = <music_short_name>}
		endif
		return
	endif
	Wait \{5
		gameframes}
	repeat 500
	music_store_turn_off_loading
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
	if ScreenElementExists \{id = SongList}
		SongList :GetSingleTag \{music_id}
		if GotParam \{music_id}
			if issoundplayingbyid <music_id>
				stopsound unique_id = <music_id>
			endif
		endif
		SongList :GetSingleTag \{music_name}
		if GotParam \{music_name}
			previewassetcache func = release_sound Name = <music_name>
		endif
	endif
endscript

script music_store_turn_on_loading \{desc = songlist_detail}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists id = <desc>
		<desc> :se_setprops loading_alpha = 1.0
		SpawnScriptNow music_store_animate_loading params = {desc = <desc>}
	endif
endscript

script music_store_turn_off_loading \{desc = songlist_detail}
	if ScreenElementExists id = <desc>
		<desc> :se_setprops loading_alpha = 0.0
		if ScriptIsRunning \{music_store_animate_loading}
			KillSpawnedScript \{Name = music_store_animate_loading}
		endif
	endif
endscript

script music_store_animate_loading \{desc = songlist_detail}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ScreenElementExists id = <desc>
		<desc> :se_setprops loading_rot_angle = 0
		<desc> :se_setprops loading_rot_angle = 360 time = 1.5
	endif
	Wait \{1.5
		Seconds}
	repeat
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
			if ScreenElementExists \{id = SongList}
				SongList :SetTags {music_id = <unique_id>}
			endif
		endif
	endif
	Wait \{5
		gameframes}
	repeat
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
			heading_text = qs(0x3ed675b6)
			body_text = qs(0xc9c0e6a6)
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
	generic_event_back_block \{state = uistate_mainmenu
		nosound}
endscript

script marketplace_exit_check_warning 
	LaunchEvent \{Type = unfocus
		target = current_menu}
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent \{Type = focus
		target = current_menu}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script marketplace_exit_check_warning_exit 
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	generic_event_back \{state = uistate_mainmenu
		nosound}
endscript

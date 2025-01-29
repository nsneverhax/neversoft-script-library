massive_build = 0
massive_sku = 'atvi_guitar_hero_pop_x360'
massive_log_level = None
massive_zone_texdict_map = {
	z_hotel = `zones/z_hotel/z_hotel.tex`
	z_ballpark = `zones/z_ballpark/z_ballpark.tex`
	z_bayou = `zones/z_bayou/z_bayou.tex`
	z_metalfest = `zones/z_metalfest/z_metalfest.tex`
	z_recordstore = `zones/z_recordstore/z_recordstore.tex`
	z_newyork = `zones/z_newyork/z_newyork.tex`
	z_hob = `zones/z_hob/z_hob.tex`
}
massive_zones = {
	Z_Gorge = {
		name = 'z_gorge'
		texdict = `zones/Z_Gorge/Z_Gorge.tex`
	}
	Z_Mall = {
		name = 'z_mall'
		texdict = `zones/Z_Mall/Z_Mall.tex`
	}
	Z_Tokyo = {
		name = 'z_tokyo'
		texdict = `zones/Z_Tokyo/Z_Tokyo.tex`
	}
}
massive_camera_names_exclude_list = [
	Moment01
	Moment02
	Moment03
	Moment04
	Moment05
	Moment06
	Moment07
	Moment08
	Moment09
	Moment10
	Guitarist_Mocap01
	Guitarist_Mocap02
	Bassist_Mocap01
	Bassist_Mocap02
	Singer_Mocap01
	Singer_Mocap02
	Drummer_Mocap01
	Drummer_Mocap02
]
g_dynamic_ad_started_called = 0
g_dynamic_ad_started = 0
g_dynamic_ad_ok_for_ad_override = 0
dynamicaddebugoverlay_container_pos = (50.0, 30.0)
dynamicaddebugoverlay_backgroundsize = (1180.0, 660.0)
dynamicaddebugoverlay_text_font = fontgrid_text_A1
dynamicaddebugoverlay_text_color1 = [
	255
	255
	255
	255
]
dynamicaddebugoverlay_text_color2 = [
	255
	255
	255
	255
]
dynamicaddebugoverlay_text_scale1 = (0.7, 0.7)
dynamicaddebugoverlay_text_scale2 = (0.5, 0.5)
dynamicaddebugoverlay_just = [
	left
	top
]

script dynamic_ad_get_current_camera_name_checksum 
	current_camera_name_checksum = nullchecksum
	if NOT ($CameraCuts_Init = true)
	else
		if GetArraySize ($CameraCuts_LastArray) noassert = 1
			if ($CameraCuts_LastIndex < 0)
			elseif ($CameraCuts_LastIndex >= <array_size>)
			else
				if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) name
					current_camera_name_checksum = ($CameraCuts_LastArray [$CameraCuts_LastIndex].name)
				else
					if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
						if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) name
							current_camera_name_checksum = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.name)
						endif
					endif
				endif
			endif
		endif
	endif
	if (current_camera_name_checksum = nullchecksum)
		return \{false
			current_camera_name_checksum = nullchecksum}
	endif
	return true current_camera_name_checksum = <current_camera_name_checksum>
endscript

script ok_for_ad_on 
	Change \{g_dynamic_ad_ok_for_ad_override = 1}
endscript

script ok_for_ad_off 
	Change \{g_dynamic_ad_ok_for_ad_override = 0}
endscript

script dynamic_ad_find_out_if_camera_ok_for_ad_flag 
	RequireParams \{[
			camera_name_checksum
		]
		all}
	if ($g_dynamic_ad_ok_for_ad_override != 0)
		return \{true}
	endif
	if (<camera_name_checksum> = nullchecksum)
		return \{true}
	endif
	GetArraySize \{$massive_camera_names_exclude_list}
	num_camera_names = <array_size>
	if (<num_camera_names> <= 0)
		return \{true}
	endif
	index = 0
	begin
	camera_name_checksum2 = ($massive_camera_names_exclude_list [<index>])
	if (<camera_name_checksum> = <camera_name_checksum2>)
		return \{false}
	endif
	index = (<index> + 1)
	repeat <num_camera_names>
	return \{true}
endscript

script dynamic_ad_update_camera_ok_for_ad_flag 
	dynamic_ad_get_current_camera_name_checksum
	if dynamic_ad_find_out_if_camera_ok_for_ad_flag camera_name_checksum = <current_camera_name_checksum>
		SetCurrentViewportCameraOkForAd \{ok_for_ad = 1}
	else
		SetCurrentViewportCameraOkForAd \{ok_for_ad = 0}
	endif
endscript

script should_we_record_dynamic_ads_for_this_song 
	printf \{qs(0x30ee78f4)}
	if NOT CheckForSignIn
		printf \{qs(0x2f554c70)}
		return \{false}
	endif
	GameMode_GetType
	if (<type> = freeplay)
		printf \{qs(0x4f04688e)}
		return \{false}
	endif
	printf \{qs(0x5a72e97d)
		s = $current_level}
	if NOT StructureContains \{structure = $LevelZones
			$current_level}
		printf \{qs(0x2535433a)}
		return \{false}
	endif
	GetNumPlayersInGame \{on_screen
		out = num_players}
	if (<num_players> <= 0)
		printf \{qs(0x8d9a9fcb)}
		return \{false}
	endif
	GetNumPlayersInGame \{remote
		out = num_remote_players}
	if (<num_remote_players> > 0)
		printf \{qs(0x8103ad48)}
		return \{false}
	endif
	numhighways = 0
	numvocalists = 0
	GetFirstPlayer \{on_screen
		out = player}
	begin
	GetPlayerInfo <player> part
	if ((<part> = Drum) || (<part> = guitar) || (<part> = bass))
		numhighways = (<numhighways> + 1)
	elseif (<part> = vocals)
		numvocalists = (<numvocalists> + 1)
	endif
	GetNextPlayer player = <player> on_screen out = player
	repeat <num_players>
	printstruct <...>
	if (<numhighways> > 1)
		printf \{qs(0x6fe667a9)}
		return \{false}
	elseif (<numhighways> = 1)
	else
		if (<numvocalists> > 1)
			printf \{qs(0x69853d0f)}
			return \{false}
		endif
	endif
	printf \{qs(0xc7cddf56)}
	return \{true}
endscript

script dynamic_ad_start 
	if ($g_dynamic_ad_started = 1)
		dynamic_ad_stop
	endif
	if should_we_record_dynamic_ads_for_this_song
		tmpzone = (($LevelZones.$current_level).zone)
		printf \{qs(0xf65920b1)
			s = tmpzone}
		DynamicAdManager_IssueCue \{Cue = Connect}
		wait \{2
			frames}
		DynamicAdManager_CacheGlob glob = (($LevelZones.$current_level).zone)
		Change \{g_dynamic_ad_started = 1}
	else
		DynamicAdManager_CacheGlob \{glob = 0x00000000}
	endif
	Change \{g_dynamic_ad_started_called = 1}
endscript

script dynamic_ad_stop 
	if ($g_dynamic_ad_started = 1)
		DynamicAdManager_IssueCue \{Cue = Disconnect}
		wait \{2
			frames}
		Change \{g_dynamic_ad_started_called = 0}
	endif
	Change \{g_dynamic_ad_started = 0}
endscript

script dynamic_ad_reset 
	if ($g_dynamic_ad_started = 1)
		dynamic_ad_stop
		dynamic_ad_start
	endif
endscript

script dynamicaddebugoverlay 
	dynamicaddebugoverlay_create
endscript

script FlushAllDebugImpressionCounters 
	DynamicAdManager_FlushAllDebugImpressionCounters
endscript

script dynamicaddebugoverlay_create 
	dynamicaddebugoverlay_destroy
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		Pos = $dynamicaddebugoverlay_container_pos
		just = $dynamicaddebugoverlay_just
		id = dynamicaddebugoverlay_root_id}
	CreateScreenElement \{type = SpriteElement
		parent = dynamicaddebugoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			0
		]
		Pos = (590.0, 330.0)
		z_priority = 10000
		id = dynamicaddebugoverlay_background_id}
	CreateScreenElement \{type = TextElement
		parent = dynamicaddebugoverlay_root_id
		font = $dynamicaddebugoverlay_text_font
		text = qs(0x044da3b2)
		scale = $dynamicaddebugoverlay_text_scale1
		just = $dynamicaddebugoverlay_just
		Pos = (0.0, 0.0)
		z_priority = 10001
		rgba = $dynamicaddebugoverlay_text_color1
		id = dynamicaddebugoverlay_title_id}
	CreateScreenElement \{type = TextElement
		parent = dynamicaddebugoverlay_root_id
		font = $dynamicaddebugoverlay_text_font
		text = qs(0x00000000)
		scale = $dynamicaddebugoverlay_text_scale2
		just = $dynamicaddebugoverlay_just
		Pos = (0.0, 50.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = $dynamicaddebugoverlay_text_color2
		id = dynamicaddebugoverlay_text2_id
		single_line = false}
	CreateScreenElement \{type = TextElement
		parent = dynamicaddebugoverlay_root_id
		font = $dynamicaddebugoverlay_text_font
		text = qs(0x00000000)
		scale = $dynamicaddebugoverlay_text_scale2
		just = $dynamicaddebugoverlay_just
		Pos = (0.0, 110.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = $dynamicaddebugoverlay_text_color2
		id = dynamicaddebugoverlay_text1_id
		single_line = false}
	RunScriptOnScreenElement \{id = dynamicaddebugoverlay_root_id
		dynamicaddebugoverlay_task}
endscript

script dynamicaddebugoverlay_destroy 
	if ScreenElementExists \{id = dynamicaddebugoverlay_root_id}
		DestroyScreenElement \{id = dynamicaddebugoverlay_root_id}
	endif
endscript

script dynamicaddebugoverlay_loop 
	begin
	if ScreenElementExists \{id = dynamicaddebugoverlay_root_id}
		dynamicaddebugoverlay_root_id :SE_SetProps \{alpha = 1.0
			time = 0.5}
		if IsXenonOrWinDX
			if ($g_dynamic_ad_ok_for_ad_override != 0)
				<text2> = qs(0x7cca12ec)
			else
				<text2> = qs(0x65d123ad)
			endif
		else
			<text2> = qs(0x00000000)
		endif
		dynamic_ad_get_current_camera_name_checksum
		if DynamicAdManager_GetDebugOverlayInfo camera_name_checksum = <current_camera_name_checksum>
		else
			<text> = qs(0x00000000)
		endif
		if NOT GotParam \{text2}
			<text2> = qs(0x00000000)
		endif
		if ScreenElementExists \{id = dynamicaddebugoverlay_text2_id}
			dynamicaddebugoverlay_text2_id :SE_SetProps text = <text2>
		endif
		if NOT GotParam \{text}
			<text> = qs(0x00000000)
		endif
		if ScreenElementExists \{id = dynamicaddebugoverlay_text1_id}
			dynamicaddebugoverlay_text1_id :SE_SetProps text = <text>
		endif
	endif
	wait \{0.05
		seconds}
	repeat
endscript

script dynamicaddebugoverlay_task 
	dynamicaddebugoverlay_loop
	dynamicaddebugoverlay_destroy
endscript

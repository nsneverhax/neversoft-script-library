vat_adjustment = 0.0
vat_playing = 0
vu_active = 0

script create_volume_adjustment_test_menu 
	Change \{vat_playing = 0}
	menu_music_off
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = vat_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = vat_container
		id = vat_light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
	displaySprite \{parent = vat_container
		id = vat_poster_1
		tex = Options_Whammy_Poster_1
		Pos = (340.0, 40.0)
		dims = (672.0, 672.0)
		z = 5}
	displaySprite \{parent = vat_container
		id = vat_poster_2
		tex = Options_Whammy_Poster_2
		Pos = (340.0, 40.0)
		dims = (672.0, 672.0)
		z = 5
		alpha = 0}
	displaySprite \{parent = vat_container
		tex = Tape_H_01
		Pos = (180.0, 40.0)
		dims = (192.0, 96.0)
		z = 10
		rot_angle = -20}
	displaySprite \{parent = vat_container
		tex = Tape_H_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (180.0, 48.0)
		dims = (192.0, 96.0)
		z = 10
		rot_angle = -20}
	displaySprite \{parent = vat_container
		tex = Tape_V_01
		Pos = (830.0, 550.0)
		dims = (96.0, 192.0)
		z = 10
		rot_angle = 16}
	displaySprite \{parent = vat_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (835.0, 551.0)
		dims = (96.0, 192.0)
		z = 10
		rot_angle = 16}
	displayText \{parent = vat_container
		text = "VOLUME"
		Pos = (366.0, 65.0)
		Scale = 0.5
		just = [
			left
			top
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a11_Large
		z = 10
		rot = -8}
	displayText \{parent = vat_container
		text = "ADJUSTMENT"
		Pos = (372.0, 105.0)
		Scale = 0.5
		just = [
			left
			top
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a11_Large
		z = 10
		rot = -8}
	displayText \{parent = vat_container
		text = "TEST"
		Pos = (379.0, 145.0)
		Scale = 0.5
		just = [
			left
			top
		]
		rgba = [
			250
			250
			250
			255
		]
		font = text_a11_Large
		z = 10
		rot = -8}
	displaySprite \{parent = vat_container
		z = 5
		tex = Options_Controller_Poster2
		Pos = (750.0, 175.0)
		noshadow
		Scale = (0.85, 1.5)}
	displaySprite \{parent = vat_container
		z = 8
		just = [
			left
			bottom
		]
		Pos = (871.0, 479.0)
		dims = (48.0, 208.0)
		rgba = [
			0
			0
			0
			255
		]}
	displaySprite \{parent = vat_container
		id = vu_bar
		z = 9
		just = [
			left
			bottom
		]
		Pos = (875.0, 475.0)
		dims = (40.0, 200.0)
		rgba = [
			255
			0
			0
			255
		]}
	displaySprite \{parent = vat_container
		z = 9
		just = [
			left
			top
		]
		Pos = (922.0, 475.0)
		dims = (8.0, 2.0)
		rgba = [
			0
			0
			0
			255
		]}
	displaySprite \{parent = vat_container
		z = 9
		just = [
			left
			center
		]
		Pos = (922.0, 325.0)
		dims = (8.0, 2.0)
		rgba = [
			0
			0
			0
			255
		]}
	displaySprite \{parent = vat_container
		z = 9
		just = [
			left
			bottom
		]
		Pos = (922.0, 275.0)
		dims = (8.0, 2.0)
		rgba = [
			0
			0
			0
			255
		]}
	displayText \{parent = vat_container
		text = "-75dB"
		Pos = (932.0, 483.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			left
			bottom
		]}
	displayText \{parent = vat_container
		text = "  0dB"
		Pos = (932.0, 332.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			left
			bottom
		]}
	displayText \{parent = vat_container
		text = " 25dB"
		Pos = (932.0, 281.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			left
			bottom
		]}
	displaySprite \{parent = vat_container
		z = 8
		just = [
			center
			center
		]
		Pos = (1065.0, 311.0)
		dims = (120.0, 80.0)
		rgba = [
			255
			255
			255
			255
		]}
	displayText \{parent = vat_container
		text = "LIVE VU"
		Pos = (1065.0, 286.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			center
			center
		]}
	displayText \{parent = vat_container
		id = vu_text
		text = "0.000"
		Pos = (1065.0, 316.0)
		z = 9
		font = text_a4
		Scale = 0.9
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			center
			center
		]}
	displaySprite \{parent = vat_container
		z = 8
		just = [
			center
			top
		]
		Pos = (1065.0, 379.0)
		dims = (120.0, 100.0)
		rgba = [
			255
			255
			255
			255
		]}
	displayText \{parent = vat_container
		text = "VOLUME"
		Pos = (1065.0, 394.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			center
			center
		]}
	displayText \{parent = vat_container
		text = "ADJUST"
		Pos = (1065.0, 414.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			center
			center
		]}
	displayText \{parent = vat_container
		id = va_text
		text = "0.000"
		Pos = (1065.0, 444.0)
		z = 9
		font = text_a4
		Scale = 0.9
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			center
			center
		]}
	displayText \{parent = vat_container
		id = vu_status
		text = "STATUS: OFF"
		Pos = (1000.0, 500.0)
		z = 9
		font = text_a4
		Scale = 0.5
		rgba = [
			0
			0
			0
			255
		]
		noshadow
		just = [
			center
			center
		]}
	Change \{vat_adjustment = 0.0}
	Change \{vat_playing = 0}
	Change \{vu_active = 0}
	SpawnScriptNow \{vat_watch_vu}
	new_menu \{scrollid = scrolling_vat_menu
		vmenuid = vmenu_vat_menu
		menu_pos = (620.0, 120.0)
		internal_just = [
			left
			center
		]
		no_focus = 1
		rot_angle = -8
		z = 10
		exclusive_device = None}
	set_focus_color \{rgba = [
			230
			220
			25
			255
		]}
	set_unfocus_color \{rgba = [
			100
			100
			100
			255
		]}
	text_params = {
		Type = TextElement
		parent = vmenu_vat_menu
		font = text_a11_Large
		Scale = 1.0
		rgba = ($menu_unfocus_color)
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
	}
	CreateScreenElement {
		<text_params>
		id = vat_sample_id
		text = "SAMPLE"
		event_handlers = [
			{focus vat_focus}
			{unfocus vat_unfocus}
			{pad_choose vat_sample}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	CreateScreenElement {
		<text_params>
		id = vat_play_id
		text = "PLAY"
		event_handlers = [
			{focus vat_focus}
			{unfocus vat_unfocus}
			{pad_choose vat_play}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	LaunchEvent \{Type = focus
		target = vmenu_vat_menu}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_volume_adjustment_test_menu 
	SongUnloadFSB
	GetGlobalTags \{arcade_hardware_adjustments}
	printf "Setting game volume to %d + %e" d = <master_game_volume> e = $volume_adjustment
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = (<master_game_volume> + $volume_adjustment)}} time = 0
	SoundBussLock \{Master}
	KillSpawnedScript \{Name = vat_watch_vu}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_vat_menu}
	destroy_menu \{menu_id = vat_container}
	destroy_menu_backdrop
endscript

script vat_focus 
	retail_menu_focus
	GetTags
	printf "vat_focus: id=%a" a = <id>
	switch (<id>)
		case vat_play_id
		vat_poster_1 :SetProps \{alpha = 0}
		vat_poster_2 :SetProps \{alpha = 1}
		case vat_sample_id
		default
		vat_poster_1 :SetProps \{alpha = 1}
		vat_poster_2 :SetProps \{alpha = 0}
	endswitch
endscript

script vat_unfocus 
	retail_menu_unfocus
endscript

script vat_sample 
	if ($vu_active = 0)
		SongUnloadFSB
		Change \{vat_playing = 0}
		Change \{vu_active = 1}
		vu_status :SetProps \{text = "STATUS: SAMPLING"}
	else
		SongUnloadFSB
		Change \{vat_playing = 0}
		Change \{vu_active = 0}
		vu_status :SetProps \{text = "STATUS: OFF"}
	endif
endscript

script vat_play 
	if ($vat_playing = 0)
		GetGlobalTags \{arcade_hardware_adjustments}
		printf "Setting game volume to %d + %e" d = <master_game_volume> e = $vat_adjustment
		SoundBussUnlock \{Master}
		setsoundbussparams {Master = {vol = (<master_game_volume> + $vat_adjustment)}} time = 0
		SoundBussLock \{Master}
		song = slowride
		get_song_prefix song = <song>
		formatText checksumName = song_preview '%s_preview' s = <song_prefix>
		SongLoadFSB song_prefix = <song_prefix>
		PlaySound <song_preview> buss = Front_End
		Change \{vat_playing = 1}
		Change \{vu_active = 0}
		vu_status :SetProps \{text = "STATUS: PLAYING"}
	else
		SongUnloadFSB
		Change \{vat_playing = 0}
		Change \{vu_active = 0}
		vu_status :SetProps \{text = "STATUS: OFF"}
	endif
endscript

script vat_watch_vu 
	begin
	if ($mic_sampler_initialized = 1 && $vu_active = 1)
		rtvugetlive
		if (<success>)
			vu_height = (<live_value> + 75)
			if (<vu_height> < 0)
				<vu_height> = 0.0
			endif
			if (<vu_height> > 100)
				<vu_height> = 100.0
			endif
			vu_bar :SetProps dims = ((40.0, 0.0) + <vu_height> * (0.0, 2.0))
			vu_color = [0 255 0 255]
			if (<vu_height> > 50)
				vu_red_color = 255
				vu_green_color = ((100 - <vu_height>) * (255.0 / 50.0))
			else
				vu_red_color = (<vu_height> * (255.0 / 50.0))
				vu_green_color = 255
			endif
			CastToInteger \{vu_red_color}
			CastToInteger \{vu_green_color}
			SetArrayElement ArrayName = vu_color index = 0 NewValue = <vu_red_color>
			SetArrayElement ArrayName = vu_color index = 1 NewValue = <vu_green_color>
			vu_bar :SetProps rgba = <vu_color>
			formatText TextName = vu_value "%a" a = <live_value>
			vu_text :SetProps text = <vu_value>
			GetGlobalTags \{arcade_hardware_adjustments}
			adj_value = ((<live_value> - <arcade_base_volume>) * 1.0)
			CastToInteger \{adj_value}
			<adj_value> = (<adj_value> * 0.5)
			if (<adj_value> > 9.0)
				<adj_value> = 9.0
			endif
			if (<adj_value> < -9.0)
				<adj_value> = -9.0
			endif
			Change vat_adjustment = <adj_value>
			formatText TextName = va_value "%a" a = <adj_value>
			va_text :SetProps text = <va_value>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

audio_settings_menu_font = fontgrid_title_gh3
audio_settings_editing = game
aom_menu_pos = (480.0, 100.0)
as_pointer_pos = [
	(264.0, 160.0)
	(264.0, 330.0)
	(264.0, 500.0)
	(234.0, 590.0)
]
as_pointer_index = 0
as_pointer_scale = 1
as_is_popup = 0
as_ping_index = 0
audio_settings_locked = 0
audio_menu_focus_color = [
	230
	190
	70
	255
]
audio_menu_unfocus_color = [
	180
	180
	180
	255
]

script create_audio_settings_menu \{popup = 0}
	menu_music_off
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = aom_container
		Pos = (0.0, 0.0)}
	exclusive_mp_controllers = [0 , 0]
	SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_device)
	SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_device)
	if (<popup> = 1)
		kill_start_key_binding
		z = 100
		Change \{as_is_popup = 1}
		new_menu {
			scrollid = as_scroll
			vmenuid = as_vmenu
			menu_pos = (420.0, 280.0)
			exclusive_device = <exclusive_mp_controllers>
			text_right
			spacing = 40
		}
		create_pause_menu_frame z = (<z> - 10)
		Change \{menu_focus_color = [
				254
				204
				55
				255
			]}
		Change \{menu_unfocus_color = [
				182
				182
				182
				255
			]}
		text_params = {
			parent = as_vmenu
			Type = TextElement
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = <z>
			Scale = 0.7
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = aom_container
			texture = menu_pause_frame_banner
			Pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<z> + 100)
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			text = "VOLUME"
			font = text_a6
			Pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			Scale = 0.8
		}
		if NOT isSinglePlayerGame
			formatText TextName = player_paused_text "PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE." d = (($last_start_pressed_device) + 1)
			displaySprite {
				parent = pause_menu_frame_container
				id = pause_helper_text_bg
				tex = Control_pill_body
				Pos = (640.0, 600.0)
				just = [center center]
				rgba = [96 0 0 255]
				z = (<z> + 10)
			}
			displayText {
				parent = pause_menu_frame_container
				Pos = (640.0, 604.0)
				just = [center center]
				text = <player_paused_text>
				rgba = [186 105 0 255]
				Scale = (0.45000002, 0.6)
				z = (<z> + 11)
				font = text_a6
			}
			GetScreenElementDims id = <id>
			bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
			pause_helper_text_bg :SetProps dims = <bg_dims>
			displaySprite {
				parent = pause_menu_frame_container
				tex = Control_pill_end
				Pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [right center]
				flip_v
				z = (<z> + 10)
			}
			displaySprite {
				parent = pause_menu_frame_container
				tex = Control_pill_end
				Pos = ((640.0, 600.0) + <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [left center]
				z = (<z> + 10)
			}
		endif
		displaySprite \{parent = aom_container
			tex = Options_Audio_Knob
			Pos = (725.0, 295.0)
			just = [
				center
				center
			]
			dims = (96.0, 96.0)
			rgba = [
				150
				150
				150
				255
			]
			z = 150}
		displaySprite \{parent = aom_container
			tex = Options_Audio_Knob
			Pos = (825.0, 365.0)
			just = [
				center
				center
			]
			dims = (96.0, 96.0)
			rgba = [
				150
				150
				150
				255
			]
			z = 150}
		displaySprite \{parent = aom_container
			id = aom_knob_line_1
			tex = Options_Audio_Knob_Line
			Pos = (725.0, 295.0)
			dims = (48.0, 12.0)
			z = 151
			rgba = [
				230
				190
				70
				255
			]
			just = [
				1.0
				0.0
			]}
		displaySprite \{parent = aom_container
			id = aom_knob_line_2
			tex = Options_Audio_Knob_Line
			Pos = (825.0, 365.0)
			dims = (48.0, 12.0)
			z = 151
			rgba = [
				230
				190
				70
				255
			]
			just = [
				1.0
				0.0
			]}
	else
		Change \{as_is_popup = 0}
		spacing = 104
		new_menu scrollid = as_scroll vmenuid = as_vmenu spacing = <spacing> menu_pos = $aom_menu_pos exclusive_device = <exclusive_mp_controllers> dims = (600.0, 680.0)
		create_menu_backdrop \{texture = Venue_BG}
		CreateScreenElement \{Type = SpriteElement
			parent = aom_container
			id = as_light_overlay
			texture = Venue_Overlay
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 99}
		set_focus_color \{rgba = [
				230
				190
				70
				255
			]}
		set_unfocus_color \{rgba = [
				150
				150
				150
				255
			]}
		displaySprite \{parent = aom_container
			tex = Options_Audio_Poster
			Pos = (340.0, 40.0)
			dims = (672.0, 672.0)}
		displaySprite \{parent = aom_container
			tex = Tape_H_01
			Pos = (360.0, 40.0)
			dims = (192.0, 96.0)
			z = 10
			rot_angle = -20}
		displaySprite \{parent = aom_container
			tex = Tape_H_01
			rgba = [
				0
				0
				0
				128
			]
			Pos = (360.0, 48.0)
			dims = (192.0, 96.0)
			z = 10
			rot_angle = -20}
		displaySprite \{parent = aom_container
			tex = Tape_V_01
			Pos = (870.0, 550.0)
			dims = (96.0, 192.0)
			z = 10
			rot_angle = 16}
		displaySprite \{parent = aom_container
			tex = Tape_V_01
			rgba = [
				0
				0
				0
				128
			]
			Pos = (875.0, 551.0)
			dims = (96.0, 192.0)
			z = 10
			rot_angle = 16}
		displaySprite parent = aom_container tex = Options_Audio_Knob Pos = ($aom_menu_pos + (15.0, 50.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaySprite parent = aom_container tex = Options_Audio_Knob Pos = ($aom_menu_pos + (15.0, 219.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaySprite \{parent = aom_container
			id = aom_belly_strings
			tex = Options_Audio_BellyStrings
			Pos = (744.0, 146.0)
			dims = (74.0, 318.0)
			z = 10}
		displaySprite parent = aom_container id = aom_pointer tex = Options_Audio_Pointer_V2 Pos = ($as_pointer_pos [0]) dims = (256.0, 128.0) relative_scale z = 10
		displaySprite parent = aom_container id = aom_knob_line_1 tex = Options_Audio_Knob_Line Pos = ($aom_menu_pos + (63.0, 94.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaySprite parent = aom_container id = aom_knob_line_2 tex = Options_Audio_Knob_Line Pos = ($aom_menu_pos + (63.0, 263.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		GetScreenElementProps id = <id>
		text_params = {parent = as_vmenu Type = TextElement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color)}
	endif
	i = 0
	begin
	formatText checksumName = ping_id 'aom_ping_%d' d = <i>
	displaySprite parent = aom_container id = <ping_id> tex = Options_Audio_Ping alpha = 0 Scale = 1 z = 180 just = [center center]
	<i> = (<i> + 1)
	repeat 20
	GetGlobalTags \{arcade_hardware_adjustments}
	menu_audio_settings_get_arcade_buss_volume_reverse Volume = <master_game_volume>
	formatText TextName = game_volume_text "%d" d = <vol>
	CastToInteger <master_game_volume>
	if (<arcade_volume_auto_adjust> = 1)
		temp_volume_adjustment = $volume_adjustment
		formatText TextName = game_volume_db_text "%d + %e db" d = <master_game_volume> e = <temp_volume_adjustment>
	else
		formatText TextName = game_volume_db_text "%d db" d = <master_game_volume>
	endif
	printf "GAME GAME GAME: master %a vol %b" a = <master_game_volume> b = <vol>
	if (<popup>)
		formatText TextName = text "GAME: %d" d = <vol>
		displaySprite \{parent = pause_menu_frame_container
			tex = Newspaper_Circle
			rgba = [
				0
				0
				0
				255
			]
			Pos = (615.0, 295.0)
			dims = (58.0, 58.0)
			just = [
				center
				center
			]
			z = 200}
		displaySprite \{parent = pause_menu_frame_container
			id = game_yeller
			tex = Newspaper_Circle
			rgba = [
				0
				0
				0
				255
			]
			Pos = (615.0, 295.0)
			dims = (44.0, 44.0)
			just = [
				center
				center
			]
			z = 201}
		displayText {
			parent = pause_menu_frame_container
			id = game_volume_text_id
			Pos = (613.0, 298.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			Scale = 0.8
			font = text_a6
			text = <game_volume_text>
			noshadow
		}
	else
		text = "GAME"
		displayText parent = aom_container id = game_volume_id text = <game_volume_text> Pos = ($aom_menu_pos + (130.0, 70.0)) z = 9
		displayText parent = aom_container id = game_volume_db_id text = <game_volume_db_text> Pos = ($aom_menu_pos + (125.0, 115.0)) z = 9 Scale = 0.5
	endif
	SetScreenElementProps id = aom_knob_line_1 rot_angle = ((<vol> / 20.0) * 180.0)
	CreateScreenElement {
		<text_params>
		text = "GAME"
		id = as_game
		Pos = (600.0, 32.0)
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = game}}
			{unfocus menu_audio_settings_unfocus params = {editing = game}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back params = {Sound = 1}}
			{pad_left menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
			{pad_L1 menu_audio_settings_toggle_adjustment_data}
		]
	}
	menu_audio_settings_get_arcade_buss_volume_reverse Volume = <master_attract_volume>
	formatText TextName = attract_volume_text "%d" d = <vol>
	temp_vol = <master_attract_volume>
	CastToInteger \{temp_vol}
	formatText TextName = attract_volume_db_text "%d db" d = <temp_vol>
	if (<popup>)
		formatText TextName = text "ATTRACT: %d" d = <vol>
		displaySprite \{parent = pause_menu_frame_container
			tex = HUD_score_nixie_2a
			rgba = [
				0
				0
				0
				255
			]
			Pos = (615.0, 365.0)
			dims = (58.0, 58.0)
			just = [
				center
				center
			]
			z = 200}
		displaySprite \{parent = pause_menu_frame_container
			id = attract_yeller
			tex = Newspaper_Circle
			rgba = [
				0
				0
				0
				255
			]
			Pos = (615.0, 365.0)
			dims = (44.0, 44.0)
			just = [
				center
				center
			]
			z = 201}
		displayText {
			parent = pause_menu_frame_container
			id = attract_volume_text_id
			Pos = (613.0, 368.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			Scale = 0.8
			font = text_a6
			noshadow
			text = <attract_volume_text>
		}
	else
		displayText parent = aom_container id = attract_volume_id text = <attract_volume_text> Pos = ($aom_menu_pos + (130.0, 238.0)) z = 9
		displayText parent = aom_container id = attract_volume_db_id text = <attract_volume_db_text> Pos = ($aom_menu_pos + (125.0, 283.0)) z = 9 Scale = 0.5
	endif
	SetScreenElementProps id = aom_knob_line_2 rot_angle = ((<vol> / 20.0) * 180.0)
	CreateScreenElement {
		<text_params>
		text = "ATTRACT"
		id = as_attract
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = attract}}
			{unfocus menu_audio_settings_unfocus params = {editing = attract}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back params = {Sound = 1}}
			{pad_left menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
			{pad_L1 menu_audio_settings_toggle_adjustment_data}
		]
	}
	if (<popup>)
		GetScreenElementDims \{id = as_game}
		fit_text_in_rectangle id = as_game only_if_larger_x = 1 dims = ((160.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
		GetScreenElementDims \{id = as_attract}
		fit_text_in_rectangle id = as_attract only_if_larger_x = 1 dims = ((160.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = aom_container
		id = ad_container}
	ad_container :SetProps \{Hide}
	Change \{adjustment_data_visible = 0}
	GetGlobalTags \{arcade_hardware_adjustments}
	displaySprite \{parent = ad_container
		tex = Options_Calibrate_Paper
		Pos = (840.0, 360.0)
		flip_v
		noshadow
		Scale = 1.4}
	formatText \{TextName = integral_text
		"Adjustment Data"}
	displayText parent = ad_container text = <integral_text> Pos = (940.0, 380.0) z = 9 font = text_a4 Scale = 0.7 rgba = [0 0 0 255] noshadow
	formatText \{TextName = integral_text
		"Base:"}
	displayText parent = ad_container text = <integral_text> Pos = (940.0, 430.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [left top]
	formatText TextName = integral_text "%a" a = <arcade_base_volume>
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 430.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText \{TextName = integral_text
		"Recent:"}
	displayText parent = ad_container text = <integral_text> Pos = (940.0, 470.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [left top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [0])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 470.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [1])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 490.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [2])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 510.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [3])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 530.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [4])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 550.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [5])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 570.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [6])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 590.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [7])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 610.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [8])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 630.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_integrals [9])
	displayText parent = ad_container text = <integral_text> Pos = (1085.0, 650.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [0])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 470.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [1])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 490.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [2])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 510.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [3])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 530.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [4])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 550.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [5])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 570.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [6])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 590.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [7])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 610.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [8])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 630.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	formatText TextName = integral_text "%a" a = ($mic_sampler_long_integrals [9])
	displayText parent = ad_container text = <integral_text> Pos = (1160.0, 650.0) z = 9 font = text_a4 Scale = 0.5 rgba = [0 0 0 255] noshadow just = [right top]
	displaySprite \{parent = ad_container
		tex = Options_Controller_Poster2
		Pos = (920.0, 225.0)
		noshadow
		Scale = (0.5, 0.75)}
	displaySprite \{parent = ad_container
		z = 8
		just = [
			left
			bottom
		]
		Pos = (958.0, 352.0)
		dims = (24.0, 104.0)
		rgba = [
			0
			0
			0
			255
		]}
	displaySprite \{parent = ad_container
		id = vu_bar
		z = 9
		just = [
			left
			bottom
		]
		Pos = (960.0, 350.0)
		dims = (20.0, 100.0)
		rgba = [
			255
			0
			0
			255
		]}
	displaySprite \{parent = ad_container
		z = 9
		just = [
			left
			bottom
		]
		Pos = (984.0, 350.0)
		dims = (4.0, 1.0)
		rgba = [
			0
			0
			0
			255
		]}
	displaySprite \{parent = ad_container
		z = 9
		just = [
			left
			center
		]
		Pos = (984.0, 275.0)
		dims = (4.0, 1.0)
		rgba = [
			0
			0
			0
			255
		]}
	displaySprite \{parent = ad_container
		z = 9
		just = [
			left
			top
		]
		Pos = (984.0, 250.0)
		dims = (4.0, 1.0)
		rgba = [
			0
			0
			0
			255
		]}
	displayText \{parent = ad_container
		text = "-75dB"
		Pos = (990.0, 353.0)
		z = 9
		font = text_a4
		Scale = 0.25
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
	displayText \{parent = ad_container
		text = "  0dB"
		Pos = (990.0, 278.0)
		z = 9
		font = text_a4
		Scale = 0.25
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
	displayText \{parent = ad_container
		text = " 25dB"
		Pos = (990.0, 253.0)
		z = 9
		font = text_a4
		Scale = 0.25
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
	displaySprite \{parent = ad_container
		z = 8
		just = [
			center
			center
		]
		Pos = (1080.0, 300.0)
		dims = (120.0, 80.0)
		rgba = [
			255
			255
			255
			255
		]}
	displayText \{parent = ad_container
		text = "LIVE VU"
		Pos = (1080.0, 275.0)
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
	displayText \{parent = ad_container
		id = vu_text
		text = "0.000"
		Pos = (1080.0, 305.0)
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
	SpawnScriptNow \{audio_settings_watch_vu}
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

script destroy_audio_settings_menu 
	KillSpawnedScript \{Name = audio_settings_watch_vu}
	SongUnloadFSB
	GetGlobalTags \{arcade_hardware_adjustments}
	printf "Setting game volume to %d + %e" d = <master_game_volume> e = $volume_adjustment
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = (<master_game_volume> + $volume_adjustment)}} time = 0
	SoundBussLock \{Master}
	clean_up_user_control_helpers
	Change \{audio_settings_locked = 0}
	Change \{as_pointer_index = 0}
	destroy_menu \{menu_id = aom_container}
	destroy_menu \{menu_id = as_scroll}
	destroy_menu \{menu_id = as_highlight_sprite}
	destroy_menu_backdrop
	destroy_pause_menu_frame
endscript

script audio_settings_watch_vu 
	begin
	if ($mic_sampler_initialized = 1 && $adjustment_data_visible = 1)
		rtvugetlive
		if (<success>)
			vu_height = (<live_value> + 75)
			if (<vu_height> < 0)
				<vu_height> = 0.0
			endif
			if (<vu_height> > 100)
				<vu_height> = 100.0
			endif
			vu_bar :SetProps dims = ((20.0, 0.0) + <vu_height> * (0.0, 1.0))
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
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script menu_audio_settings_focus 
	retail_menu_focus
	Change audio_settings_editing = <editing>
	last_index = $as_pointer_index
	switch (<editing>)
		case game
		Change \{as_pointer_index = 0}
		if ($as_is_popup)
			SetScreenElementProps id = game_yeller rgba = ($menu_focus_color)
			SetScreenElementProps \{id = game_volume_text_id
				rgba = [
					0
					0
					0
					255
				]}
		endif
		case attract
		Change \{as_pointer_index = 1}
		if ($as_is_popup)
			SetScreenElementProps id = attract_yeller rgba = ($menu_focus_color)
			SetScreenElementProps \{id = attract_volume_text_id
				rgba = [
					0
					0
					0
					255
				]}
		endif
	endswitch
	aom_hilite_knob
	if NOT ($as_is_popup)
		aom_move_pointer last_index = <last_index>
	endif
endscript

script menu_audio_settings_unfocus 
	retail_menu_unfocus
	if ($as_is_popup)
		switch (<editing>)
			case game
			SetScreenElementProps \{id = game_yeller
				rgba = [
					0
					0
					0
					255
				]}
			SetScreenElementProps id = game_volume_text_id rgba = ($menu_unfocus_color)
			case attract
			SetScreenElementProps \{id = attract_yeller
				rgba = [
					0
					0
					0
					255
				]}
			SetScreenElementProps id = attract_volume_text_id rgba = ($menu_unfocus_color)
		endswitch
	else
		printf \{"menu_audio_settings_unfocus: not popup"}
	endif
endscript

script menu_audio_settings_lock_selection 
	SoundEvent \{event = ui_sfx_select}
	if ($audio_settings_locked)
		Goto \{menu_audio_settings_press_back
			params = {
				Sound = 0
			}}
	endif
	GetTags
	LaunchEvent \{Type = unfocus
		target = as_vmenu}
	Wait \{1
		gameframe}
	LaunchEvent Type = focus target = <id>
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{pad_up menu_audio_settings_increase_volume_guitar_check}
			{pad_down menu_audio_settings_lower_volume_guitar_check}
		]
		replace_handlers
	}
	menu_audio_settings_highlight_item
	Change \{audio_settings_locked = 1}
	GetGlobalTags \{arcade_hardware_adjustments}
	switch ($audio_settings_editing)
		case game
		printf "Setting game volume to %d + %e" d = <master_game_volume> e = $volume_adjustment
		SoundBussUnlock \{Master}
		setsoundbussparams {Master = {vol = (<master_game_volume> + $volume_adjustment)}} time = 0
		SoundBussLock \{Master}
		case attract
		printf "Setting attract volume to %d" d = <master_attract_volume>
		SoundBussUnlock \{Master}
		setsoundbussparams {Master = {vol = (<master_attract_volume>)}} time = 0
		SoundBussLock \{Master}
	endswitch
	song = paranoid
	get_song_prefix song = <song>
	formatText checksumName = song_preview '%s_preview' s = <song_prefix>
	SongLoadFSB song_prefix = <song_prefix>
	PlaySound <song_preview> buss = Front_End
endscript

script menu_audio_settings_press_back \{Sound = 1}
	if (<Sound> = 1)
		SoundEvent \{event = Generic_Menu_Back_SFX}
	endif
	GetTags
	LaunchEvent Type = unfocus target = <id>
	Wait \{1
		gameframe}
	LaunchEvent \{Type = focus
		target = as_vmenu}
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{pad_up null_script}
			{pad_down null_script}
		]
		replace_handlers
	}
	menu_audio_settings_remove_highlight
	Change \{audio_settings_locked = 0}
	SongUnloadFSB
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
endscript

script ChangeSpinalTapVolume \{spinal_tap_volume_max = 20}
	<spinal_tap_volume> = (<spinal_tap_volume> + <Change>)
	if (<spinal_tap_volume> < 1)
		<spinal_tap_volume> = 1
	elseif (<spinal_tap_volume> > <spinal_tap_volume_max>)
		<spinal_tap_volume> = <spinal_tap_volume_max>
	endif
	return Volume = <spinal_tap_volume>
endscript

script menu_audio_settings_lower_selection_volume 
	GetGlobalTags \{arcade_hardware_adjustments}
	switch ($audio_settings_editing)
		case game
		menu_audio_settings_get_arcade_buss_volume_reverse Volume = <master_game_volume>
		oldvolume = <vol>
		ChangeSpinalTapVolume spinal_tap_volume = <vol> Change = -1
		if ($as_is_popup)
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = game_volume_text_id text = <text>
		else
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = game_volume_id text = <text>
		endif
		SetScreenElementProps id = aom_knob_line_1 rot_angle = ((<Volume> / 20.0) * 180.0)
		if NOT (<oldvolume> = <Volume>)
			do_ping = 1
			menu_audio_settings_game_volume_sound
		else
			do_ping = 0
		endif
		menu_audio_settings_update_game_volume vol = <Volume>
		menu_audio_settings_get_arcade_buss_volume Volume = <Volume>
		SetGlobalTags arcade_hardware_adjustments params = {master_game_volume = <vol>}
		Change \{update_base_volume = 1}
		Change \{volume_adjustment = 0.0}
		if NOT ($as_is_popup)
			if (<arcade_volume_auto_adjust> = 1)
				temp_volume_adjustment = $volume_adjustment
				formatText TextName = game_volume_db_text "%d + %e db" d = <vol> e = <temp_volume_adjustment>
			else
				formatText TextName = game_volume_db_text "%d db" d = <vol>
			endif
			printf "menu_audio_settings_lower_selection_volume: game vol now %d" d = <vol>
			SetScreenElementProps id = game_volume_db_id text = <game_volume_db_text>
		endif
		case attract
		menu_audio_settings_get_arcade_buss_volume_reverse Volume = <master_attract_volume>
		oldvolume = <vol>
		ChangeSpinalTapVolume spinal_tap_volume = <vol> Change = -1
		if ($as_is_popup)
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = attract_volume_text_id text = <text>
		else
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = attract_volume_id text = <text>
		endif
		SetScreenElementProps id = aom_knob_line_2 rot_angle = ((<Volume> / 20.0) * 180.0)
		if NOT (<oldvolume> = <Volume>)
			do_ping = 1
			menu_audio_settings_attract_volume_sound
		else
			do_ping = 0
		endif
		menu_audio_settings_update_attract_volume vol = <Volume>
		menu_audio_settings_get_arcade_buss_volume Volume = <Volume>
		SetGlobalTags arcade_hardware_adjustments params = {master_attract_volume = <vol>}
		if NOT ($as_is_popup)
			temp_vol = <vol>
			CastToInteger \{temp_vol}
			formatText TextName = attract_volume_db_text "%d db" d = <temp_vol>
			printf "menu_audio_settings_lower_selection_volume: att vol now %d" d = <temp_vol>
			SetScreenElementProps id = attract_volume_db_id text = <attract_volume_db_text>
		endif
	endswitch
	if (<do_ping>)
		formatText \{checksumName = ping_id
			'aom_ping_%d'
			d = $as_ping_index}
		Change as_ping_index = ($as_ping_index + 1)
		if ($as_ping_index > 10)
			Change \{as_ping_index = 0}
		endif
		RunScriptOnScreenElement id = <ping_id> aom_spawn_ping
	endif
endscript

script menu_audio_settings_increase_selection_volume 
	GetGlobalTags \{arcade_hardware_adjustments}
	switch ($audio_settings_editing)
		case game
		menu_audio_settings_get_arcade_buss_volume_reverse Volume = <master_game_volume>
		oldvolume = <vol>
		ChangeSpinalTapVolume spinal_tap_volume = <vol> Change = 1
		if ($as_is_popup)
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = game_volume_text_id text = <text>
		else
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = game_volume_id text = <text>
		endif
		SetScreenElementProps id = aom_knob_line_1 rot_angle = ((<Volume> / 20.0) * 180.0)
		if NOT (<oldvolume> = <Volume>)
			do_ping = 1
			menu_audio_settings_game_volume_sound
		else
			do_ping = 0
		endif
		menu_audio_settings_update_game_volume vol = <Volume>
		menu_audio_settings_get_arcade_buss_volume Volume = <Volume>
		SetGlobalTags arcade_hardware_adjustments params = {master_game_volume = <vol>}
		Change \{update_base_volume = 1}
		Change \{volume_adjustment = 0.0}
		if NOT ($as_is_popup)
			if (<arcade_volume_auto_adjust> = 1)
				temp_volume_adjustment = $volume_adjustment
				formatText TextName = game_volume_db_text "%d + %e db" d = <vol> e = <temp_volume_adjustment>
			else
				formatText TextName = game_volume_db_text "%d db" d = <vol>
			endif
			printf "menu_audio_settings_increase_selection_volume: game vol now %d" d = <vol>
			SetScreenElementProps id = game_volume_db_id text = <game_volume_db_text>
		endif
		case attract
		menu_audio_settings_get_arcade_buss_volume_reverse Volume = <master_attract_volume>
		oldvolume = <vol>
		ChangeSpinalTapVolume spinal_tap_volume = <vol> Change = 1
		if ($as_is_popup)
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = attract_volume_text_id text = <text>
		else
			formatText TextName = text "%d" d = <Volume>
			SetScreenElementProps id = attract_volume_id text = <text>
		endif
		SetScreenElementProps id = aom_knob_line_2 rot_angle = ((<Volume> / 20.0) * 180.0)
		if NOT (<oldvolume> = <Volume>)
			do_ping = 1
			menu_audio_settings_attract_volume_sound
		else
			do_ping = 0
		endif
		menu_audio_settings_update_attract_volume vol = <Volume>
		menu_audio_settings_get_arcade_buss_volume Volume = <Volume>
		SetGlobalTags arcade_hardware_adjustments params = {master_attract_volume = <vol>}
		if NOT ($as_is_popup)
			temp_vol = <vol>
			CastToInteger \{temp_vol}
			formatText TextName = attract_volume_db_text "%d db" d = <temp_vol>
			printf "menu_audio_settings_increase_selection_volume: att vol now %d" d = <temp_vol>
			SetScreenElementProps id = attract_volume_db_id text = <attract_volume_db_text>
		endif
	endswitch
	if (<do_ping>)
		formatText \{checksumName = ping_id
			'aom_ping_%d'
			d = $as_ping_index}
		Change as_ping_index = ($as_ping_index + 1)
		if ($as_ping_index > 10)
			Change \{as_ping_index = 0}
		endif
		RunScriptOnScreenElement id = <ping_id> aom_spawn_ping
	endif
endscript

script menu_audio_settings_increase_volume_guitar_check 
	menu_audio_settings_increase_selection_volume
endscript

script menu_audio_settings_lower_volume_guitar_check 
	menu_audio_settings_lower_selection_volume
endscript

script menu_audio_settings_highlight_item 
	if NOT ScreenElementExists \{id = as_highlight_sprite}
		GetTags
		GetScreenElementDims id = <id>
		GetScreenElementPosition id = <id> absolute
		if ($as_is_popup = 0)
			<highlight_pos> = (<screenelementpos> + (-0.05, 0.0) * <width> + (0.0, -0.05) * <height>)
			<highlight_dims> = ((1.1, 0.0) * <width> + (0.0, 0.8) * <height>)
		else
			<highlight_pos> = (<screenelementpos> + (-5.0, -3.0))
			<highlight_dims> = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (12.0, 0.0))
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = root_window
			id = as_highlight_sprite
			Pos = <highlight_pos>
			dims = <highlight_dims>
			rgba = [210 130 0 125]
			just = [left top]
			z_priority = 99
		}
	endif
endscript

script menu_audio_settings_remove_highlight 
	if ScreenElementExists \{id = as_highlight_sprite}
		DestroyScreenElement \{id = as_highlight_sprite}
	endif
endscript

script menu_audio_settings_get_buss_volume 
	switch <Volume>
		case 11
		<vol> = 0
		case 10
		<vol> = -1.2
		case 9
		<vol> = -2.4
		case 8
		<vol> = -3.7
		case 7
		<vol> = -4.9
		case 6
		<vol> = -6.2
		case 5
		<vol> = -8
		case 4
		<vol> = -10
		case 3
		<vol> = -13
		case 2
		<vol> = -17
		case 1
		<vol> = -21
		case 0
		<vol> = -100
	endswitch
	return vol = <vol>
endscript

script menu_audio_settings_update_guitar_volume \{vol = 11}
	menu_audio_settings_get_buss_volume Volume = <vol>
	SoundBussUnlock \{User_Guitar}
	setsoundbussparams {User_Guitar = {vol = <vol>}} time = 0
	SoundBussLock \{User_Guitar}
endscript

script menu_audio_settings_update_band_volume \{vol = 11}
	menu_audio_settings_get_buss_volume Volume = <vol>
	SoundBussUnlock \{User_Band}
	setsoundbussparams {User_Band = {vol = <vol>}} time = 0
	SoundBussLock \{User_Band}
endscript

script menu_audio_settings_update_sfx_volume \{vol = 11}
	printf "Got vol = %v" v = <vol>
	menu_audio_settings_get_buss_volume Volume = <vol>
	printf "Got vol-post = %v" v = <vol>
	SoundBussUnlock \{User_SFX}
	printf channel = sfx "setting user_sfx to %s " s = <vol>
	setsoundbussparams {User_SFX = {vol = <vol>}} time = 0
	SoundBussLock \{User_SFX}
endscript

script menu_audio_settings_get_arcade_buss_volume 
	switch <Volume>
		case 20
		<vol> = 24
		case 19
		<vol> = 21
		case 18
		<vol> = 18
		case 17
		<vol> = 15
		case 16
		<vol> = 12
		case 15
		<vol> = 9
		case 14
		<vol> = 6
		case 13
		<vol> = 3
		case 12
		<vol> = 0
		case 11
		<vol> = -3
		case 10
		<vol> = -6
		case 9
		<vol> = -9
		case 8
		<vol> = -12
		case 7
		<vol> = -15
		case 6
		<vol> = -18
		case 5
		<vol> = -21
		case 4
		<vol> = -24
		case 3
		<vol> = -27
		case 2
		<vol> = -30
		case 1
		<vol> = -33
		case 0
		<vol> = -100
	endswitch
	return vol = <vol>
endscript

script menu_audio_settings_get_arcade_buss_volume_reverse 
	printf "masgabvr: volume %a" a = <Volume>
	switch <Volume>
		case 24
		<vol> = 20
		case 21
		<vol> = 19
		case 18
		<vol> = 18
		case 15
		<vol> = 17
		case 12
		<vol> = 16
		case 9
		<vol> = 15
		case 6
		<vol> = 14
		case 3
		<vol> = 13
		case 0
		<vol> = 12
		case -3
		<vol> = 11
		case -6
		<vol> = 10
		case -9
		<vol> = 9
		case -12
		<vol> = 8
		case -15
		<vol> = 7
		case -18
		<vol> = 6
		case -21
		<vol> = 5
		case -24
		<vol> = 4
		case -27
		<vol> = 3
		case -30
		<vol> = 2
		case -33
		<vol> = 1
		case -100
		<vol> = 0
	endswitch
	return vol = <vol>
endscript

script menu_audio_settings_update_game_volume \{vol = 20}
	menu_audio_settings_get_arcade_buss_volume Volume = <vol>
	printf "Setting game volume to %d + %e" d = <vol> e = $volume_adjustment
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = (<vol> + $volume_adjustment)}} time = 0
	SoundBussLock \{Master}
endscript

script menu_audio_settings_update_attract_volume \{vol = 20}
	menu_audio_settings_get_arcade_buss_volume Volume = <vol>
	printf "Setting attract volume to %d" d = <vol>
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = (<vol>)}} time = 0
	SoundBussLock \{Master}
endscript

script aom_move_pointer 
	if NOT ($as_pointer_index = <last_index>)
		if (<last_index> < $as_pointer_index)
			middle_pos = (($as_pointer_pos [$as_pointer_index]) + (-80.0, 85.0))
		else
			middle_pos = (($as_pointer_pos [$as_pointer_index]) + (-80.0, -85.0))
		endif
		DoScreenElementMorph id = aom_pointer Pos = <middle_pos> Scale = ($as_pointer_scale / 2.0) time = 0.1 relative_scale
		Wait \{0.1
			Seconds}
		DoScreenElementMorph id = aom_pointer Pos = ($as_pointer_pos [$as_pointer_index]) Scale = $as_pointer_scale time = 0.1 relative_scale
		Wait \{0.1
			Seconds}
		<last_index> = $as_pointer_index
	endif
endscript

script aom_hilite_knob 
	switch ($as_pointer_index)
		case 0
		SetScreenElementProps \{id = aom_knob_line_1
			rgba = [
				230
				190
				70
				255
			]}
		if NOT ($as_is_popup)
			SetScreenElementProps \{id = game_volume_id
				rgba = [
					230
					190
					70
					255
				]}
			SetScreenElementProps \{id = game_volume_db_id
				rgba = [
					230
					190
					70
					255
				]}
		endif
		SetScreenElementProps \{id = aom_knob_line_2
			rgba = [
				150
				150
				150
				255
			]}
		if NOT ($as_is_popup)
			SetScreenElementProps \{id = attract_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			SetScreenElementProps \{id = attract_volume_db_id
				rgba = [
					150
					150
					150
					255
				]}
		endif
		case 1
		SetScreenElementProps \{id = aom_knob_line_2
			rgba = [
				230
				190
				70
				255
			]}
		if NOT ($as_is_popup)
			SetScreenElementProps \{id = attract_volume_id
				rgba = [
					230
					190
					70
					255
				]}
			SetScreenElementProps \{id = attract_volume_db_id
				rgba = [
					230
					190
					70
					255
				]}
		endif
		SetScreenElementProps \{id = aom_knob_line_1
			rgba = [
				150
				150
				150
				255
			]}
		if NOT ($as_is_popup)
			SetScreenElementProps \{id = game_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			SetScreenElementProps \{id = game_volume_db_id
				rgba = [
					150
					150
					150
					255
				]}
		endif
	endswitch
endscript

script aom_spawn_ping \{time = 0.25}
	GetTags
	if NOT ($as_is_popup)
		switch ($audio_settings_editing)
			case game
			Pos = ($aom_menu_pos + (145.0, 96.0))
			case attract
			Pos = ($aom_menu_pos + (145.0, 266.0))
		endswitch
	else
		switch ($audio_settings_editing)
			case game
			Pos = (725.0, 295.0)
			case attract
			Pos = (825.0, 365.0)
		endswitch
	endif
	<id> :DoMorph Scale = 1 Pos = <Pos> alpha = 1
	<id> :DoMorph Scale = 5 alpha = 0 time = <time>
	if NOT ($as_is_popup)
		<center_belly_pos> = (744.0, 146.0)
		<left_belly_pos> = (724.0, 146.0)
		<right_belly_pos> = (764.0, 146.0)
		<jiggle_time> = 0.05
		begin
		DoScreenElementMorph id = aom_belly_strings Pos = <left_belly_pos> time = <jiggle_time>
		Wait <jiggle_time> Seconds
		DoScreenElementMorph id = aom_belly_strings Pos = <center_belly_pos> time = <jiggle_time>
		Wait <jiggle_time> Seconds
		DoScreenElementMorph id = aom_belly_strings Pos = <right_belly_pos> time = <jiggle_time>
		Wait <jiggle_time> Seconds
		DoScreenElementMorph id = aom_belly_strings Pos = <center_belly_pos> time = <jiggle_time>
		<left_belly_pos> = (<left_belly_pos> + (3.33, 0.0))
		<right_belly_pos> = (<right_belly_pos> + (-3.33, 0.0))
		repeat 6
	endif
endscript
adjustment_data_visible = 0

script menu_audio_settings_toggle_adjustment_data 
	if ($adjustment_data_visible = 0)
		ad_container :SetProps \{unhide}
		Change \{adjustment_data_visible = 1}
		printf \{"menu_audio_settings_toggle_adjustment_data: ON"}
	else
		ad_container :SetProps \{Hide}
		Change \{adjustment_data_visible = 0}
		printf \{"menu_audio_settings_toggle_adjustment_data: OFF"}
	endif
endscript

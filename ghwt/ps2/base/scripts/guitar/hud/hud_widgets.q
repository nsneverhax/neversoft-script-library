
script hud_attach_widget_band_meter \{local_id = rock_meter
		Pos = (0.0, 0.0)}

	if NOT ResolveScreenElementID id = <parent> param = id
		return
	endif
	<id> :desc_resolvealias Name = alias_glow param = glow_id
	attachhudwidget {
		Input = {
			value = band_health
		}
		outputs = [
			{
				Type = descpropertyfloat
				desc_id = <id>
				property = needle_rot_angle
				value_range = [0.0 2.0]
				Range = [-66.0 66.0]
				single
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = red_light_alpha
				value_range = [0.0 0.6666]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = yellow_light_alpha
				value_range = [0.6666 1.3333]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = green_light_alpha
				value_range = [1.3333 2.0]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = hud_meter_red_bg_alpha
				value_range = [0.0 0.6666]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = hud_meter_yellow_bg_alpha
				value_range = [0.6666 1.3333]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = hud_meter_green_bg_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
	if ($current_num_players = 1)
		attachhudwidget {
			Input = {
				object = player1_status
				value = score
			}
			output = {
				Type = seinttostring
				desc_id = <id>
				property = score_text
			}
		}
		if playerinfoequals \{1
				part = vocals}
			<divide_by_10> = true
		else
			<divide_by_10> = FALSE
		endif
		attachhudwidget {
			Input = {
				object = player1_status
				value = note_streak
			}
			output = {
				Type = seinttostring
				desc_id = <id>
				property = streak_number_text
				divide_by_10 = <divide_by_10>
			}
		}
		attachhudwidget {
			Input = {
				object = player1_status
				value = starpower_amount
			}
			output = {
				Type = setubes
				desc_id = <id>
				Player = 1
				default_scale = (0.3, 0.3)
				value_range = [0.0 100.0]
				textures = [glow0_texture glow1_texture glow2_texture glow3_texture glow4_texture glow5_texture]
				scales = [glow0_scale glow1_scale glow2_scale glow3_scale glow4_scale glow5_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			Input = {
				object = player1_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
	else
		attachhudwidget {
			Input = {
				value = band1_score
			}
			output = {
				Type = seinttostring
				desc_id = <id>
				property = score_text
			}
		}
		attachhudwidget {
			Input = {
				value = band1_streak
			}
			output = {
				Type = seinttostring
				desc_id = <id>
				property = streak_number_text
			}
		}
		attachhudwidget {
			Input = {
				value = band1_multiplier
			}
			output = {
				Type = sebandmultiplier
				desc_id = <id>
				property = band_mult_text
			}
		}
		health_value_range = [0.0 2.0]
		health_mask_range = [(128.0, 0.0) (128.0, 64.0)]
		attachhudwidget {
			Input = {
				object = player1_status
				value = health
			}
			outputs = [
				{
					Type = descpropertypair
					desc_id = <id>
					property = band_hud_p1_mask_dims
					value_range = <health_value_range>
					Range = <health_mask_range>
					single
				}
				{
					Type = screenelementrgbalerp
					desc_id = <id>
					property = band_hud_p1_fill_rgba
					value_range = [0.0 2.0]
					colors = [
						[255 0 0 100]
						[255 255 0 100]
						[0 255 0 100]
					]
				}
			]
		}
		if ($current_num_players > 1)
			attachhudwidget {
				Input = {
					object = player2_status
					value = health
				}
				outputs = [
					{
						Type = descpropertypair
						desc_id = <id>
						property = band_hud_p2_mask_dims
						value_range = <health_value_range>
						Range = <health_mask_range>
						single
					}
					{
						Type = screenelementrgbalerp
						desc_id = <id>
						property = band_hud_p2_fill_rgba
						value_range = [0.0 2.0]
						colors = [
							[255 0 0 100]
							[255 255 0 100]
							[0 255 0 100]
						]
					}
				]
			}
		else
			SetScreenElementProps id = <id> band_hud_p2_fill_rgba = [0 0 0 0]
		endif
		if ($current_num_players > 2)
			attachhudwidget {
				Input = {
					object = player3_status
					value = health
				}
				outputs = [
					{
						Type = descpropertypair
						desc_id = <id>
						property = band_hud_p3_mask_dims
						value_range = <health_value_range>
						Range = <health_mask_range>
						single
					}
					{
						Type = screenelementrgbalerp
						desc_id = <id>
						property = band_hud_p3_fill_rgba
						value_range = [0.0 2.0]
						colors = [
							[255 0 0 100]
							[255 255 0 100]
							[0 255 0 100]
						]
					}
				]
			}
		else
			SetScreenElementProps id = <id> band_hud_p3_fill_rgba = [0 0 0 0]
		endif
		if ($current_num_players > 3)
			attachhudwidget {
				Input = {
					object = player4_status
					value = health
				}
				outputs = [
					{
						Type = descpropertypair
						desc_id = <id>
						property = band_hud_p4_mask_dims
						value_range = <health_value_range>
						Range = <health_mask_range>
						single
					}
					{
						Type = screenelementrgbalerp
						desc_id = <id>
						property = band_hud_p4_fill_rgba
						value_range = [0.0 2.0]
						colors = [
							[255 0 0 100]
							[255 255 0 100]
							[0 255 0 100]
						]
					}
				]
			}
		else
			SetScreenElementProps id = <id> band_hud_p4_fill_rgba = [0 0 0 0]
		endif
		hud_set_band_meter_instrument_icons desc_element = <id>
		attachhudwidget {
			Input = {
				value = band1_starpower
			}
			output = {
				Type = setubes
				desc_id = <id>
				Band = true
				band_num = 1
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [glow0_texture glow1_texture glow2_texture glow3_texture glow4_texture glow5_texture]
				scales = [glow0_scale glow1_scale glow2_scale glow3_scale glow4_scale glow5_scale]
			}
		}
	endif
	hud_setup_streak_meter_animation
	if NOT gamemode_isbandscoring
		hud_setup_secondary_starpower_bulb_animation
	endif
	if ($rock_meter_debug = 1)
		if <id> :desc_resolvealias Name = alias_bg param = bg_id
			CreateScreenElement {
				parent = <bg_id>
				id = rock_meter_debug_text
				Type = TextElement
				Pos = (128.0, 24.0)
				text = qs(0x80cd18a8)
				font = debug
				just = [center bottom]
				Scale = (0.7, 0.4)
				z_priority = 100
			}
			if ($current_num_players > 1)
				<Player> = 1
				<Pos> = (128.0, 24.0)
				begin
				formatText checksumName = rmdt 'rock_meter_debug_text%i' i = <Player> AddToStringLookup
				<Pos> = (<Pos> - (0.0, 16.0))
				CreateScreenElement {
					parent = <bg_id>
					id = <rmdt>
					Type = TextElement
					Pos = <Pos>
					text = qs(0x80cd18a8)
					font = debug
					just = [center bottom]
					Scale = (0.7, 0.4)
					z_priority = 100
				}
				<Player> = (<Player> + 1)
				repeat $current_num_players
			endif
			KillSpawnedScript \{Name = update_rock_meter_debug_text}
			SpawnScriptNow \{update_rock_meter_debug_text
				params = {
					id = rock_meter_debug_text
				}}
		endif
	endif
endscript

script hud_set_band_meter_instrument_icons 
	index = 1
	begin
	getplayerinfo <index> part
	switch <part>
		case guitar
		icon = band_hud_guitar
		glow_icon = band_hud_guitar_glow
		case bass
		icon = band_hud_bass
		glow_icon = band_hud_bass_glow
		case drum
		icon = band_hud_drums
		glow_icon = band_hud_drums_glow
		case vocals
		icon = band_hud_microphone
		glow_icon = band_hud_mic_glow
	endswitch
	if (<index> <= $current_num_players)
		alpha = 1.0
	else
		alpha = 0.0
	endif
	glow_rgba = [255 255 255 0]
	switch <index>
		case 1
		SetScreenElementProps id = <desc_element> band_hud_instrument_p1_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p1_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p1_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p1_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p1_rgba = <glow_rgba>
		case 2
		SetScreenElementProps id = <desc_element> band_hud_instrument_p2_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p2_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_rgba = <glow_rgba>
		case 3
		SetScreenElementProps id = <desc_element> band_hud_instrument_p3_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p3_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_rgba = <glow_rgba>
		case 4
		SetScreenElementProps id = <desc_element> band_hud_instrument_p4_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p4_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_rgba = <glow_rgba>
	endswitch
	index = (<index> + 1)
	repeat 4
endscript
0xc8f59d1f = [
	255
	200
	0
	255
]
0xe1c8b60d = [
	255
	255
	255
	255
]
0xeee93283 = [
	255
	255
	255
	255
]
0x185775cd = [
	255
	255
	255
	0
]

script hud_band_streak_notify 
	getplayerinfo \{1
		bot_play}
	if (<bot_play> = 1)
		return
	endif
	if NOT GotParam \{new_player_in_streak}
		if NOT GotParam \{streak}
			return
		endif
		if (<streak> < 1)
			return
		endif
		formatText TextName = notification qs(0x66bd2b10) d = <streak>
	else
		formatText TextName = notification qs(0x83b2be80) d = <new_player_in_streak>
		Priority = -1
	endif
	hud_create_message {text = <notification> Band Priority = <Priority> style_script = hud_message_band_streak_style style_script_params = {players = <players>}}
endscript

script hud_attach_widget_band_faceoff_meter 
	attachhudwidget {
		Input = {
			value = faceoff_ratio
		}
		outputs = [
			{
				Type = descpropertyfloat
				desc_id = <parent_id>
				property = hud_band_battle_meter_needle_rot_angle
				value_range = [1.0 -1.0]
				Range = [-51.5 51.5]
				single
			}
			{
				Type = descpropertyfloat
				desc_id = <parent_id>
				property = hud_band_battle_meter_amber_on_alpha
				value_range = [0.0 0.1]
				Range = [0.0 1.0]
				single
			}
			{
				Type = descpropertyfloat
				desc_id = <parent_id>
				property = hud_band_battle_meter_violet_on_alpha
				value_range = [-0.1 0.0]
				Range = [1.0 0.0]
				single
			}
		]
	}
	if ($current_num_players > 2)
		attachhudwidget {
			Input = {
				value = band1_score
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			Input = {
				value = band2_score
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		attachhudwidget {
			Input = {
				value = band1_multiplier
			}
			output = {
				Type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_1_texture
				Player = 1
				textures = [
					HUD_score_nixie_1a
					HUD_score_nixie_2a
					HUD_score_nixie_3a
					HUD_score_nixie_4a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
				]
			}
		}
		attachhudwidget {
			Input = {
				value = band2_multiplier
			}
			output = {
				Type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_2_texture
				Player = 2
				textures = [
					HUD_score_nixie_1a
					HUD_score_nixie_2a
					HUD_score_nixie_3a
					HUD_score_nixie_4a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
				]
			}
		}
		attachhudwidget {
			Input = {
				value = band1_starpower
			}
			output = {
				Type = setubes
				desc_id = <parent_id>
				Band = true
				band_num = 1
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_1_1_texture fill_1_2_texture fill_1_3_texture fill_1_4_texture fill_1_5_texture fill_1_6_texture]
				scales = [fill_1_1_scale fill_1_2_scale fill_1_3_scale fill_1_4_scale fill_1_5_scale fill_1_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			Input = {
				object = band1_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		attachhudwidget {
			Input = {
				value = band2_starpower
			}
			output = {
				Type = setubes
				desc_id = <parent_id>
				Band = true
				band_num = 2
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_2_1_texture fill_2_2_texture fill_2_3_texture fill_2_4_texture fill_2_5_texture fill_2_6_texture]
				scales = [fill_2_1_scale fill_2_2_scale fill_2_3_scale fill_2_4_scale fill_2_5_scale fill_2_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			Input = {
				object = band2_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		hud_setup_streak_meter_animation \{Player = 1
			faceoff}
		hud_setup_streak_meter_animation \{Player = 2
			faceoff}
		attachhudwidget {
			Input = {
				value = band1_streak
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = p1_streak_number_text
			}
		}
		attachhudwidget {
			Input = {
				value = band2_streak
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = p2_streak_number_text
			}
		}
	else
		attachhudwidget {
			Input = {
				object = player1_status
				value = score
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			Input = {
				object = player2_status
				value = score
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		attachhudwidget {
			Input = {
				object = player1_status
				value = multiplier
			}
			output = {
				Type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_1_texture
				Player = 1
				textures = [
					HUD_score_nixie_1a
					HUD_score_nixie_2a
					HUD_score_nixie_3a
					HUD_score_nixie_4a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
				]
			}
		}
		attachhudwidget {
			Input = {
				object = player2_status
				value = multiplier
			}
			output = {
				Type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_2_texture
				Player = 2
				textures = [
					HUD_score_nixie_1a
					HUD_score_nixie_2a
					HUD_score_nixie_3a
					HUD_score_nixie_4a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
				]
			}
		}
		attachhudwidget {
			Input = {
				object = player1_status
				value = starpower_amount
			}
			output = {
				Type = setubes
				desc_id = <parent_id>
				Player = 1
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_1_1_texture fill_1_2_texture fill_1_3_texture fill_1_4_texture fill_1_5_texture fill_1_6_texture]
				scales = [fill_1_1_scale fill_1_2_scale fill_1_3_scale fill_1_4_scale fill_1_5_scale fill_1_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			Input = {
				object = player1_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		attachhudwidget {
			Input = {
				object = player2_status
				value = starpower_amount
			}
			output = {
				Type = setubes
				desc_id = <parent_id>
				Player = 2
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_2_1_texture fill_2_2_texture fill_2_3_texture fill_2_4_texture fill_2_5_texture fill_2_6_texture]
				scales = [fill_2_1_scale fill_2_2_scale fill_2_3_scale fill_2_4_scale fill_2_5_scale fill_2_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			Input = {
				object = player2_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		if NOT ($boss_battle = 1)
			hud_setup_streak_meter_animation \{Player = 1
				faceoff}
			hud_setup_streak_meter_animation \{Player = 2
				faceoff}
			if playerinfoequals \{1
					part = vocals}
				<divide_by_10> = true
			else
				<divide_by_10> = FALSE
			endif
			attachhudwidget {
				Input = {
					object = player1_status
					value = note_streak
				}
				output = {
					Type = seinttostring
					desc_id = <parent_id>
					property = p1_streak_number_text
					divide_by_10 = <divide_by_10>
				}
			}
			if playerinfoequals \{2
					part = vocals}
				<divide_by_10> = true
			else
				<divide_by_10> = FALSE
			endif
			attachhudwidget {
				Input = {
					object = player2_status
					value = note_streak
				}
				output = {
					Type = seinttostring
					desc_id = <parent_id>
					property = p2_streak_number_text
					divide_by_10 = <divide_by_10>
				}
			}
		endif
	endif
endscript

script hud_attach_widget_player_multiplier 

	getplayerinfo <Player> checksum
	ResolveScreenElementID id = <parent_id> param = id
	attachhudwidget {
		Input = {
			object = <checksum>
			value = note_streak
		}
		output = {
			Type = senotestreaklights
			desc_id = <id>
			Player = <Player>
			bulb_textures = [
				[
					HUD_score_light_0
					HUD_score_light_1
					HUD_score_light_2
				]
				[
					HUD_score_light_0_green
					HUD_score_light_1_green
					HUD_score_light_2_green
				]
				[
					HUD_score_light_0_purple
					HUD_score_light_1_purple
					HUD_score_light_2_purple
				]
				[
					HUD_score_light_0_blue
					HUD_score_light_1_blue
					HUD_score_light_2_blue
				]
			]
			bulb_props = [light0_texture light1_texture light2_texture light3_texture light4_texture]
		}
	}
	<note_streak_widget_id> = <observer_id>
	attachhudwidget {
		Input = {
			object = <checksum>
			value = starpower_active
		}
		output = {id = <note_streak_widget_id>}
	}
	textures = [
		band_hud_score_1a
		band_hud_score_2a
		band_hud_score_3a
		band_hud_score_4a
	]
	if playerinfoequals <Player> part = vocals
		sp_textures = [
			vocal_hud_score_2a
			vocal_hud_score_4a
			vocal_hud_score_6a
			vocal_hud_score_8b
		]
	else
		sp_textures = [
			band_hud_score_2b
			band_hud_score_4b
			band_hud_score_6b
			band_hud_score_8b
		]
	endif
	if gamemode_isbandscoring
		<default_mul_tex> = band_hud_score_1a
		getplayerinfo <Player> part
		switch <part>
			case bass
			<default_mul_tex> = higway_icon_bass
			case drum
			<default_mul_tex> = higway_icon_drum
			case guitar
			<default_mul_tex> = higway_icon_guitar
			case vocals
			<default_mul_tex> = higway_icon_mic
		endswitch
		SetArrayElement ArrayName = textures index = 0 NewValue = <default_mul_tex>
	endif
	attachhudwidget {
		Input = {
			object = <checksum>
			value = multiplier
		}
		output = {
			Type = semultipliernixie
			desc_id = <id>
			property = nixie_texture
			Player = <Player>
			textures = <textures>
			sp_textures = <sp_textures>
		}
	}
endscript

script hud_attach_widget_player_star_power 

	getplayerinfo <Player> checksum
	ResolveScreenElementID id = <parent_id> param = id
	if ($current_num_players > 1)
		attachhudwidget {
			Input = {
				object = <checksum>
				value = starpower_amount
			}
			output = {
				Type = setubes
				desc_id = <id>
				Player = <Player>
				value_range = [0.0 100.0]
				textures = [glow0_texture glow1_texture glow2_texture]
				scales = [glow0_scale glow1_scale glow2_scale]
			}
		}
	endif
endscript

script hud_setup_streak_meter_animation \{Player = 1}
	if NOT GotParam \{faceoff}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			<band_meter> :desc_resolvealias Name = alias_streak param = streak_id
		endif
	else
		if hud_root :desc_resolvealias \{Name = alias_faceoff_meter
				param = faceoff_meter}
			if (<Player> = 1)
				<faceoff_meter> :desc_resolvealias Name = alias_streak_p1 param = streak_id
			else
				<faceoff_meter> :desc_resolvealias Name = alias_streak_p2 param = streak_id
			endif
		endif
	endif
	if NOT GotParam \{streak_id}
		return
	endif
	if ScreenElementExists id = <streak_id>
		GetScreenElementProps id = <streak_id>
		if NOT GotParam \{faceoff}
			hide_pos = (<Pos> - (0.0, 45.0))
		else
			if (<Player> = 1)
				hide_pos = (<Pos> + (200.0, 0.0))
			else
				hide_pos = (<Pos> - (200.0, 0.0))
			endif
		endif
		streak_pos = <Pos>
		if gamemode_isbandscoring
			if (<Player> = 1)
				event_handlers = [
					{band1_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.1 Pos = <streak_pos>}}
					{band1_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			elseif (<Player> = 2)
				event_handlers = [
					{band2_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.1 Pos = <streak_pos>}}
					{band2_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			endif
		else
			if (<Player> = 1)
				event_handlers = [
					{player1_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.1 Pos = <streak_pos>}}
					{player1_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			elseif (<Player> = 2)
				event_handlers = [
					{player2_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.1 Pos = <streak_pos>}}
					{player2_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			endif
		endif
		SetScreenElementProps {
			id = <streak_id>
			event_handlers = <event_handlers>
			replace_handlers
			Pos = <hide_pos>
		}
	endif
endscript

script hud_setup_secondary_starpower_bulb_animation 
	hud_root :desc_resolvealias \{Name = alias_band_meter
		param = band_meter}
	<band_meter> :desc_resolvealias Name = alias_secondary_bulbs param = container_id
	if ScreenElementExists id = <container_id>
		GetScreenElementProps id = <container_id>
		hide_pos = (<Pos> + (-15.0, 60.0))
		show_pos = <Pos>
		event_handlers = [
			{starpower_bulbs_unhide SetScreenElementProps params = {id = <container_id> time = 0.3 Pos = <show_pos>}}
			{starpower_bulbs_hide SetScreenElementProps params = {id = <container_id> time = 0.3 Pos = <hide_pos>}}
		]
		SetScreenElementProps {
			id = <container_id>
			event_handlers = <event_handlers>
			replace_handlers
			Pos = <hide_pos>
		}
	endif
endscript

script hud_start_blink_rock_meter 
	SpawnScriptLater \{hud_start_blink_rock_meter_spawn}
endscript

script hud_start_blink_rock_meter_spawn 
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :desc_resolvealias Name = alias_hud_meter_red_bg param = id
					begin
					if NOT ScreenElementExists id = <id>
						break
					endif
					SetScreenElementProps {
						id = <id>
						rgba = [50 50 50 255]
						time = 0.1
					}
					Wait \{0.1
						Seconds}
					if NOT ScreenElementExists id = <id>
						break
					endif
					SetScreenElementProps {
						id = <id>
						rgba = [255 255 255 255]
						time = 0.1
					}
					Wait \{0.1
						Seconds}
					repeat
				endif
			endif
		endif
	endif
endscript

script hud_stop_blink_rock_meter 
	KillSpawnedScript \{Name = hud_start_blink_rock_meter_spawn}
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :desc_resolvealias Name = alias_hud_meter_red_bg param = id
					if ScreenElementExists id = <id>
						SetScreenElementProps {
							id = <id>
							rgba = [255 255 255 255]
							time = 0.1
						}
					endif
				endif
			endif
		endif
	endif
endscript

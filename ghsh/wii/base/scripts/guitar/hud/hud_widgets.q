hide_rockmeter_ind_health = 1

script hud_attach_widget_band_meter \{local_id = rock_meter
		Pos = (0.0, 0.0)}
	RequireParams \{[
			parent
		]
		all}
	if NOT ResolveScreenElementID id = <parent> param = id
		return
	endif
	<id> :desc_resolvealias Name = alias_glow param = glow_id
	if ($current_num_players = 1)
		health_input = {
			object = player1_status
			value = health
		}
	else
		health_input = {
			value = band_health
		}
	endif
	attachhudwidget {
		Input = <health_input>
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
				default_scale = (1.0, 1.0)
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
		attachhudwidget {
			Input = {
				object = player1_status
				value = projected_song_stars
			}
			output = {
				Type = sestarmeter
				desc_id = <id>
				full_scale = 0.7
			}
		}
		color1 = [238 , 204 , 120 , 255]
		color2 = <color1>
		attachhudwidget {
			Input = {
				object = player1_status
				value = has_missed_note
			}
			outputs = [
				{
					Type = screenelementalphatoggle
					desc_id = <id>
					property = band_hud_gold_star_glow_alpha
				}
				{
					Type = screenelementrgbaswitch
					desc_id = <id>
					property = star_filler_rgba
					color1 = [249 , 193 , 34 , 255]
					color2 = [249 , 193 , 34 , 255]
				}
				{
					Type = screenelementrgbaswitch
					desc_id = <id>
					property = star_meter_num_rgba
					color1 = <color1>
					color2 = <color2>
				}
			]
		}
	else
		if ($hide_rockmeter_ind_health = 1)
			if ScreenElementExists \{id = hud_root}
				if hud_root :desc_resolvealias \{Name = alias_band_meter
						param = band_meter}
					ResolveScreenElementID id = <band_meter> param = meter_element
					if <meter_element> :desc_resolvealias Name = alias_rock_meter_lanes param = health_lanes
						<health_lanes> :se_setprops Hide
					endif
				endif
			endif
		endif
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
				textures = [
					band_hud_multiplier_one
					band_hud_multiplier_two
					band_hud_multiplier_three
					band_hud_multiplier_four
				]
			}
		}
		attachhudwidget {
			Input = {
				value = band_projected_song_stars
			}
			output = {
				Type = sestarmeter
				desc_id = <id>
				full_scale = 1.0
			}
		}
		color1 = [238 , 204 , 120 , 255]
		color2 = <color1>
		attachhudwidget {
			Input = {
				value = band_has_missed_note
			}
			outputs = [
				{
					Type = screenelementalphatoggle
					desc_id = <id>
					property = band_hud_gold_star_glow_alpha
				}
				{
					Type = screenelementrgbaswitch
					desc_id = <id>
					property = star_filler_rgba
					color1 = [249 , 193 , 34 , 255]
					color2 = [249 , 193 , 34 , 255]
				}
				{
					Type = screenelementrgbaswitch
					desc_id = <id>
					property = star_meter_num_rgba
					color1 = <color1>
					color2 = <color2>
				}
			]
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
					value_range = [0.67 1.3299999]
					colors = [
						[255 0 0 100]
						[255 255 0 100]
						[0 255 0 100]
					]
				}
				{
					Type = screenelementrgbalerp
					desc_id = <id>
					property = band_hud_instrument_p1_rgba
					value_range = [0.0 2.0]
					colors = [
						[220 64 64 255]
						[255 255 255 255]
						[255 255 255 255]
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
						value_range = [0.67 1.3299999]
						colors = [
							[255 0 0 100]
							[255 255 0 100]
							[0 255 0 100]
						]
					}
					{
						Type = screenelementrgbalerp
						desc_id = <id>
						property = band_hud_instrument_p2_rgba
						value_range = [0.0 2.0]
						colors = [
							[220 64 64 255]
							[255 255 255 255]
							[255 255 255 255]
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
						value_range = [0.67 1.3299999]
						colors = [
							[255 0 0 100]
							[255 255 0 100]
							[0 255 0 100]
						]
					}
					{
						Type = screenelementrgbalerp
						desc_id = <id>
						property = band_hud_instrument_p3_rgba
						value_range = [0.0 2.0]
						colors = [
							[220 64 64 255]
							[255 255 255 255]
							[255 255 255 255]
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
						value_range = [0.67 1.3299999]
						colors = [
							[255 0 0 100]
							[255 255 0 100]
							[0 255 0 100]
						]
					}
					{
						Type = screenelementrgbalerp
						desc_id = <id>
						property = band_hud_instrument_p4_rgba
						value_range = [0.0 2.0]
						colors = [
							[220 64 64 255]
							[255 255 255 255]
							[255 255 255 255]
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
	hud_setup_band_mult_animation
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
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p1_alpha = 0
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p1_rgba = <glow_rgba>
		case 2
		SetScreenElementProps id = <desc_element> band_hud_instrument_p2_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p2_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_alpha = 0
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_rgba = <glow_rgba>
		case 3
		SetScreenElementProps id = <desc_element> band_hud_instrument_p3_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p3_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_alpha = 0
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_rgba = <glow_rgba>
		case 4
		SetScreenElementProps id = <desc_element> band_hud_instrument_p4_texture = <icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_p4_alpha = <alpha>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_texture = <glow_icon>
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_alpha = 0
		SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_rgba = <glow_rgba>
	endswitch
	index = (<index> + 1)
	repeat 4
endscript

script hud_set_team_colors 
	SetScreenElementProps \{id = hud_root
		highway_icon_mic1_rgba = $player_slot_team1}
	SetScreenElementProps \{id = hud_root
		highway_icon_mic2_rgba = $player_slot_team2}
endscript

script hud_set_band_meter_instrument_streak_color 
	return
	if GotParam \{Player}
		if ScreenElementExists \{id = hud_root}
			if hud_root :desc_resolvealias \{Name = alias_band_meter
					param = band_meter}
				ResolveScreenElementID id = <band_meter> param = desc_element
			endif
			if GotParam \{On}
				rgba = [255 200 0 255]
				glow_rgba = [255 200 0 255]
			else
				rgba = [255 255 255 255]
				glow_rgba = [255 255 255 255]
			endif
			if GotParam \{desc_element}
				switch <Player>
					case 1
					SetScreenElementProps id = <desc_element> band_hud_instrument_p1_rgba = <rgba>
					SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p1_rgba = <glow_rgba>
					case 2
					SetScreenElementProps id = <desc_element> band_hud_instrument_p2_rgba = <rgba>
					SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p2_rgba = <glow_rgba>
					case 3
					SetScreenElementProps id = <desc_element> band_hud_instrument_p3_rgba = <rgba>
					SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p3_rgba = <glow_rgba>
					case 4
					SetScreenElementProps id = <desc_element> band_hud_instrument_p4_rgba = <rgba>
					SetScreenElementProps id = <desc_element> band_hud_instrument_glow_p4_rgba = <glow_rgba>
				endswitch
			endif
		endif
	endif
endscript

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

script hud_band_streak_end 
	getplayerinfo \{1
		bot_play}
	if (<bot_play> = 1)
		return
	endif
	formatText TextName = notification qs(0xf3d445f5) d = <score>
	hud_create_message {text = <notification> Band Priority = <Priority> style_script = hud_message_band_streak_style style_script_params = {players = [0 0 0 0]}}
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
	if NOT ResolveScreenElementID id = <parent_id> param = id
		return
	endif
	hud_set_team_colors desc_element = <id>
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
					HUD_score_nixie_1a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
					HUD_score_nixie_1a
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
					HUD_score_nixie_1a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
					HUD_score_nixie_1a
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
					HUD_score_nixie_1a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
					HUD_score_nixie_1a
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
					HUD_score_nixie_1a
				]
				sp_textures = [
					HUD_score_nixie_2b
					HUD_score_nixie_4b
					HUD_score_nixie_6b
					HUD_score_nixie_8b
					HUD_score_nixie_1a
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
	RequireParams \{[
			parent_id
			Player
		]
		all}
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
	if playerinfoequals <Player> part = vocals
		textures = [
			band_hud_score_1a
			vocal_hud_score_2a
			vocal_hud_score_3a
			vocal_hud_score_4a
			band_hud_score_1a
		]
		sp_textures = [
			vocal_hud_score_2a
			vocal_hud_score_4a
			vocal_hud_score_6a
			vocal_hud_score_8b
			band_hud_score_1a
		]
	else
		textures = [
			band_hud_score_1a
			band_hud_score_2a
			band_hud_score_3a
			band_hud_score_4a
			band_hud_score_1a
		]
		sp_textures = [
			band_hud_score_2b
			band_hud_score_4b
			band_hud_score_6b
			band_hud_score_8b
			band_hud_score_1a
		]
	endif
	colors = [
		[255 255 255 255]
		[247 247 119 255]
		[113 215 113 255]
		[226 125 251 255]
		[0 200 200 255]
	]
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
		SetArrayElement ArrayName = textures index = 4 NewValue = <default_mul_tex>
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
			property2 = mult_bg_alpha
			color_prop = nixie_rgba
			Player = <Player>
			num_players = $current_num_players
			textures = <textures>
			sp_textures = <sp_textures>
			colors = <colors>
		}
	}
endscript

script hud_attach_widget_player_health 
	RequireParams \{[
			parent_id
			Player
		]
		all}
	getplayerinfo <Player> checksum
	ResolveScreenElementID id = <parent_id> param = id
	pos_prop = side_meter_needle_pos
	pos_range = [(-4.0, 2.0) (8.0, -32.0) (21.0, -67.0) (33.0, -100.0)]
	pos_value_range = [0.0 0.6666 1.3333 2.0]
	pos_type = individualhealthneedlepos
	scale_prop = side_meter_needle_scale
	scale_range = [(1.0, 1.0) (1.0, 1.0)]
	red_light = side_meter_red_on_alpha
	yel_light = side_meter_yellow_on_alpha
	grn_light = side_meter_green_on_alpha
	red_light_rgba = side_meter_red_on_rgba
	red_glow_rgba = side_meter_red_glow_rgba
	if GotParam \{vocals}
		pos_type = descpropertypair
		pos_range = [(0.0, -105.0) (0.0, -5.0)]
		pos_value_range = [0.0 2.0]
		scale_range = [(1.0, 1.0) (1.0, 1.0)]
		red_light = top_meter_red_on_alpha
		yel_light = top_meter_yellow_on_alpha
		grn_light = top_meter_green_on_alpha
		red_light_rgba = top_meter_red_on_rgba
		red_glow_rgba = top_red_glow_rgba
	else
		get_num_non_vocals_players_onscreen
		if (<num_non_vocals_players> = 1)
			pos_range = [(0.0, 0.0) (11.0, -24.0) (28.0, -57.0) (41.0, -80.0)]
		elseif (<num_non_vocals_players> = 2)
			pos_range = [(0.0, 0.0) (13.0, -28.0) (26.0, -58.0) (37.0, -84.0)]
		endif
	endif
	attachhudwidget {
		Input = {
			object = <checksum>
			value = health
		}
		outputs = [
			{
				Type = <pos_type>
				desc_id = <id>
				property = <pos_prop>
				value_range = <pos_value_range>
				Range = <pos_range>
				single
			}
			{
				Type = descpropertypair
				desc_id = <id>
				property = <scale_prop>
				value_range = [0.0 2.0]
				Range = <scale_range>
				single
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = <red_light>
				value_range = [0.0 0.6666]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = <yel_light>
				value_range = [0.6666 1.3333]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <id>
				property = <grn_light>
				value_range = [1.3333 2.0]
			}
		]
	}
	blink_rate = 0.3
	attachhudwidget {
		Input = {
			value = time
		}
		outputs = [
			{
				Type = screenelementplayerhealthblink
				desc_id = <id>
				property = <red_light_rgba>
				blink_rate = <blink_rate>
				color1 = [255 , 255 , 255 , 255]
				color2 = [255 , 255 , 255 , 0]
			}
			{
				Type = screenelementplayerhealthblink
				desc_id = <id>
				property = <red_glow_rgba>
				blink_rate = <blink_rate>
				color1 = [255 , 255 , 255 , 255]
				color2 = [255 , 255 , 255 , 0]
			}
		]
	}
endscript

script hud_attach_widget_player_star_power 
	RequireParams \{[
			parent_id
			Player
		]
		all}
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
			hide_pos = (<Pos> - (0.0, 65.0))
			if ($current_num_players = 1)
				getplayerinfo <Player> part
				if (<part> = vocals)
					Pos = (<Pos> - (10.0, 130.0))
					hide_pos = (<Pos> + (0.0, 65.0))
				endif
			endif
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
					{band1_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <streak_pos>}}
					{band1_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			elseif (<Player> = 2)
				event_handlers = [
					{band2_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <streak_pos>}}
					{band2_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			endif
		else
			if (<Player> = 1)
				event_handlers = [
					{player1_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <streak_pos>}}
					{player1_streak_ended SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
				]
			elseif (<Player> = 2)
				event_handlers = [
					{player2_streak_started SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <streak_pos>}}
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

script hud_setup_band_mult_animation 
	if ($current_num_players = 1)
		return
	endif
	if hud_root :desc_resolvealias \{Name = alias_band_meter
			param = band_meter}
		<band_meter> :desc_resolvealias Name = alias_band_multiplier param = mult_id
	endif
	if NOT GotParam \{mult_id}
		return
	endif
	if ScreenElementExists id = <mult_id>
		GetScreenElementProps id = <mult_id>
		hide_pos = (<Pos> + (100.0, 0.0))
		hide_scale = 0.5
		event_handlers = [
			{show_band_mult SetScreenElementProps params = {id = <mult_id> time = 0.3 Pos = <Pos> Scale = <Scale>}}
			{hide_band_mult SetScreenElementProps params = {id = <mult_id> time = 0.3 Pos = <hide_pos> Scale = <hide_scale>}}
		]
		SetScreenElementProps {
			id = <mult_id>
			event_handlers = <event_handlers>
			replace_handlers
			Pos = <hide_pos>
			Scale = <hide_scale>
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
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($boss_battle = 1))
		return
	endif
	band_failing_vingette_on
endscript

script hud_start_blink_rock_meter_spawn 
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :desc_resolvealias Name = alias_hud_meter_red_bg param = bg_id
					begin
					if NOT ScreenElementExists id = <bg_id>
						break
					endif
					SetScreenElementProps {
						id = <bg_id>
						rgba = [50 50 50 255]
						time = 0.1
					}
					hud_meter_set_rgba \{new_rgba = [
							0
							0
							0
							0
						]}
					if <band_meter> :desc_resolvealias Name = alias_pulse_container param = scale_id
						if ScreenElementExists id = <scale_id>
							SetScreenElementProps {
								id = <scale_id>
								Scale = 1.1
								time = 0.1
							}
						endif
					endif
					Wait \{0.1
						Seconds}
					if NOT ScreenElementExists id = <bg_id>
						break
					endif
					SetScreenElementProps {
						id = <bg_id>
						rgba = [255 255 255 255]
						time = 0.1
					}
					hud_meter_set_rgba \{new_rgba = [
							255
							0
							0
							255
						]}
					if <band_meter> :desc_resolvealias Name = alias_pulse_container param = scale_id
						if ScreenElementExists id = <scale_id>
							SetScreenElementProps {
								id = <scale_id>
								Scale = 1.2
								time = 0.1
							}
						endif
					endif
					Wait \{0.1
						Seconds}
					repeat
				endif
			endif
		endif
	endif
endscript

script hud_stop_blink_rock_meter 
	band_failing_vingette_off
	KillSpawnedScript \{Name = hud_start_blink_rock_meter_spawn}
	hud_meter_set_rgba \{new_rgba = [
			0
			0
			0
			0
		]}
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
				if <band_meter> :desc_resolvealias Name = alias_pulse_container param = scale_id
					if ScreenElementExists id = <scale_id>
						SetScreenElementProps {
							id = <scale_id>
							Scale = 1.1
							time = 0.1
						}
					endif
				endif
			endif
		endif
	endif
endscript

script hud_pulse_rock_meter 
	KillSpawnedScript \{Name = hud_pulse_rock_meter_spawn}
	SpawnScriptLater \{hud_pulse_rock_meter_spawn}
endscript

script hud_pulse_rock_meter_spawn 
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :desc_resolvealias Name = alias_pulse_container param = id
					if ScreenElementExists id = <id>
						SetScreenElementProps {
							id = <id>
							Scale = 1.2
							relative_scale
							time = 0.1
						}
						Wait \{0.1
							Seconds}
						if NOT ScreenElementExists id = <id>
							return
						endif
						SetScreenElementProps {
							id = <id>
							Scale = 1.0
							relative_scale
							time = 0.1
						}
					endif
				endif
			endif
		endif
	endif
endscript

script hud_meter_glow_red 
endscript

script hud_meter_glow_blue 
endscript

script hud_meter_glow_hide_blue 
endscript

script hud_meter_glow_hide 
endscript

script hud_meter_set_rgba \{new_rgba = [
			0
			0
			0
			0
		]}
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :desc_resolvealias Name = alias_band_hud_meter_outer_glow param = id
					if ScreenElementExists id = <id>
						if GotParam \{old_rgba}
							GetScreenElementProps id = <id>
							i = 0
							begin
							if NOT (<rgba> [<i>] = <old_rgba> [<i>])
								return
							endif
							i = (<i> + 1)
							repeat 4
						endif
						SetScreenElementProps {
							id = <id>
							rgba = <new_rgba>
							alpha = 1.0
							time = 0.1
						}
					endif
				endif
			endif
		endif
	endif
endscript

script hud_animate_star_meter_flames 
	KillSpawnedScript \{Name = hud_animate_star_meter_flames_spawn}
	SpawnScriptLater \{hud_animate_star_meter_flames_spawn}
endscript

script hud_animate_star_meter_flames_spawn 
	SoundEvent \{event = star_meter_gain}
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :desc_resolvealias Name = alias_star_flame param = parent
					if ScreenElementExists id = <parent>
						star_meter_sparks01 parent = <parent>
						SoundEvent \{event = star_get}
					endif
				endif
			endif
		endif
	endif
endscript

script star_meter_sparks01 
	props = {
		Type = SpriteElement
		parent = <parent>
		dims = (128.0, 128.0)
		Scale = (1.0, 1.0)
		Pos = (70.0, 85.0)
		just = [center bottom]
		material = mat_note_hit_xplosion1
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.08
		num_uv_frames = (4.0, 4.0)
		z_priority = 18
	}
	DestroyScreenElement \{id = star_spark01}
	DestroyScreenElement \{id = star_spark02}
	DestroyScreenElement \{id = star_spark03}
	DestroyScreenElement \{id = star_spark04}
	CreateScreenElement {
		id = star_spark01
		rot_angle = 0
		<props>
	}
	CreateScreenElement {
		id = star_spark02
		rot_angle = 90
		<props>
	}
	CreateScreenElement {
		id = star_spark03
		rot_angle = 180
		<props>
	}
	CreateScreenElement {
		id = star_spark04
		rot_angle = 270
		<props>
	}
	Wait \{16
		frames}
	DestroyScreenElement \{id = star_spark01}
	DestroyScreenElement \{id = star_spark02}
	DestroyScreenElement \{id = star_spark03}
	DestroyScreenElement \{id = star_spark04}
endscript

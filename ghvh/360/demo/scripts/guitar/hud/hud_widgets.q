hide_rockmeter_ind_health = 1

script hud_attach_widget_band_meter \{local_id = rock_meter
		pos = (0.0, 0.0)}
	requireparams \{[
			parent
		]
		all}
	if NOT resolvescreenelementid id = <parent> param = id
		return
	endif
	<id> :desc_resolvealias name = alias_glow param = glow_id
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
		input = <health_input>
		outputs = [
			{
				type = descpropertyfloat
				desc_id = <id>
				property = needle_rot_angle
				value_range = [0.0 2.0]
				range = [-66.0 66.0]
				single
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = red_light_alpha
				value_range = [0.0 0.6666]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = yellow_light_alpha
				value_range = [0.6666 1.3333]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = green_light_alpha
				value_range = [1.3333 2.0]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = hud_meter_red_bg_alpha
				value_range = [0.0 0.6666]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = hud_meter_yellow_bg_alpha
				value_range = [0.6666 1.3333]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = hud_meter_green_bg_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
	if ($current_num_players = 1)
		attachhudwidget {
			input = {
				object = player1_status
				value = score
			}
			output = {
				type = seinttostring
				desc_id = <id>
				property = score_text
			}
		}
		if playerinfoequals \{1
				part = vocals}
			<divide_by_10> = true
		else
			<divide_by_10> = false
		endif
		attachhudwidget {
			input = {
				object = player1_status
				value = note_streak
			}
			output = {
				type = seinttostring
				desc_id = <id>
				property = streak_number_text
				divide_by_10 = <divide_by_10>
			}
		}
		attachhudwidget {
			input = {
				object = player1_status
				value = starpower_amount
			}
			output = {
				type = setubes
				desc_id = <id>
				player = 1
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [glow0_texture glow1_texture glow2_texture glow3_texture glow4_texture glow5_texture]
				scales = [glow0_scale glow1_scale glow2_scale glow3_scale glow4_scale glow5_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			input = {
				object = player1_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		attachhudwidget {
			input = {
				object = player1_status
				value = projected_song_stars
			}
			output = {
				type = sestarmeter
				desc_id = <id>
				full_scale = 0.7
			}
		}
		color1 = [238 , 204 , 120 , 255]
		color2 = <color1>
		attachhudwidget {
			input = {
				object = player1_status
				value = has_missed_note
			}
			outputs = [
				{
					type = screenelementalphatoggle
					desc_id = <id>
					property = band_hud_gold_star_glow_alpha
				}
				{
					type = screenelementrgbaswitch
					desc_id = <id>
					property = star_filler_rgba
					color1 = <color1>
					color2 = <color2>
				}
				{
					type = screenelementrgbaswitch
					desc_id = <id>
					property = star_meter_num_rgba
					color1 = <color1>
					color2 = <color2>
				}
			]
		}
	else
		if ($hide_rockmeter_ind_health = 1)
			if screenelementexists \{id = hud_root}
				if hud_root :desc_resolvealias \{name = alias_band_meter
						param = band_meter}
					resolvescreenelementid id = <band_meter> param = meter_element
					if <meter_element> :desc_resolvealias name = alias_rock_meter_lanes param = health_lanes
						<health_lanes> :se_setprops hide
					endif
				endif
			endif
		endif
		attachhudwidget {
			input = {
				value = band1_score
			}
			output = {
				type = seinttostring
				desc_id = <id>
				property = score_text
			}
		}
		attachhudwidget {
			input = {
				value = band1_streak
			}
			output = {
				type = seinttostring
				desc_id = <id>
				property = streak_number_text
			}
		}
		attachhudwidget {
			input = {
				value = band1_multiplier
			}
			output = {
				type = sebandmultiplier
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
			input = {
				value = band_projected_song_stars
			}
			output = {
				type = sestarmeter
				desc_id = <id>
				full_scale = 1.0
			}
		}
		color1 = [238 , 204 , 120 , 255]
		color2 = <color1>
		attachhudwidget {
			input = {
				value = band_has_missed_note
			}
			outputs = [
				{
					type = screenelementalphatoggle
					desc_id = <id>
					property = band_hud_gold_star_glow_alpha
				}
				{
					type = screenelementrgbaswitch
					desc_id = <id>
					property = star_filler_rgba
					color1 = <color1>
					color2 = <color2>
				}
				{
					type = screenelementrgbaswitch
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
			input = {
				object = player1_status
				value = health
			}
			outputs = [
				{
					type = descpropertypair
					desc_id = <id>
					property = band_hud_p1_mask_dims
					value_range = <health_value_range>
					range = <health_mask_range>
					single
				}
				{
					type = screenelementrgbalerp
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
					type = screenelementrgbalerp
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
				input = {
					object = player2_status
					value = health
				}
				outputs = [
					{
						type = descpropertypair
						desc_id = <id>
						property = band_hud_p2_mask_dims
						value_range = <health_value_range>
						range = <health_mask_range>
						single
					}
					{
						type = screenelementrgbalerp
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
						type = screenelementrgbalerp
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
			setscreenelementprops id = <id> band_hud_p2_fill_rgba = [0 0 0 0]
		endif
		if ($current_num_players > 2)
			attachhudwidget {
				input = {
					object = player3_status
					value = health
				}
				outputs = [
					{
						type = descpropertypair
						desc_id = <id>
						property = band_hud_p3_mask_dims
						value_range = <health_value_range>
						range = <health_mask_range>
						single
					}
					{
						type = screenelementrgbalerp
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
						type = screenelementrgbalerp
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
			setscreenelementprops id = <id> band_hud_p3_fill_rgba = [0 0 0 0]
		endif
		if ($current_num_players > 3)
			attachhudwidget {
				input = {
					object = player4_status
					value = health
				}
				outputs = [
					{
						type = descpropertypair
						desc_id = <id>
						property = band_hud_p4_mask_dims
						value_range = <health_value_range>
						range = <health_mask_range>
						single
					}
					{
						type = screenelementrgbalerp
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
						type = screenelementrgbalerp
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
			setscreenelementprops id = <id> band_hud_p4_fill_rgba = [0 0 0 0]
		endif
		hud_set_band_meter_instrument_icons desc_element = <id>
		attachhudwidget {
			input = {
				value = band1_starpower
			}
			output = {
				type = setubes
				desc_id = <id>
				band = true
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
		if <id> :desc_resolvealias name = alias_bg param = bg_id
			createscreenelement {
				parent = <bg_id>
				id = rock_meter_debug_text
				type = textelement
				pos = (128.0, 24.0)
				text = qs(0x80cd18a8)
				font = debug
				just = [center bottom]
				scale = (0.7, 0.4)
				z_priority = 100
			}
			if ($current_num_players > 1)
				<player> = 1
				<pos> = (128.0, 24.0)
				begin
				formattext checksumname = rmdt 'rock_meter_debug_text%i' i = <player> addtostringlookup
				<pos> = (<pos> - (0.0, 16.0))
				createscreenelement {
					parent = <bg_id>
					id = <rmdt>
					type = textelement
					pos = <pos>
					text = qs(0x80cd18a8)
					font = debug
					just = [center bottom]
					scale = (0.7, 0.4)
					z_priority = 100
				}
				<player> = (<player> + 1)
				repeat $current_num_players
			endif
			killspawnedscript \{name = update_rock_meter_debug_text}
			spawnscriptnow \{update_rock_meter_debug_text
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
		setscreenelementprops id = <desc_element> band_hud_instrument_p1_texture = <icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_p1_alpha = <alpha>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p1_texture = <glow_icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p1_alpha = 0
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p1_rgba = <glow_rgba>
		case 2
		setscreenelementprops id = <desc_element> band_hud_instrument_p2_texture = <icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_p2_alpha = <alpha>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p2_texture = <glow_icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p2_alpha = 0
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p2_rgba = <glow_rgba>
		case 3
		setscreenelementprops id = <desc_element> band_hud_instrument_p3_texture = <icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_p3_alpha = <alpha>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p3_texture = <glow_icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p3_alpha = 0
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p3_rgba = <glow_rgba>
		case 4
		setscreenelementprops id = <desc_element> band_hud_instrument_p4_texture = <icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_p4_alpha = <alpha>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p4_texture = <glow_icon>
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p4_alpha = 0
		setscreenelementprops id = <desc_element> band_hud_instrument_glow_p4_rgba = <glow_rgba>
	endswitch
	index = (<index> + 1)
	repeat 4
endscript

script hud_set_team_colors 
	setscreenelementprops \{id = hud_root
		highway_icon_mic1_rgba = $player_slot_team1}
	setscreenelementprops \{id = hud_root
		highway_icon_mic2_rgba = $player_slot_team2}
endscript

script hud_set_band_meter_instrument_streak_color 
	return
	if gotparam \{player}
		if screenelementexists \{id = hud_root}
			if hud_root :desc_resolvealias \{name = alias_band_meter
					param = band_meter}
				resolvescreenelementid id = <band_meter> param = desc_element
			endif
			if gotparam \{on}
				rgba = [255 200 0 255]
				glow_rgba = [255 200 0 255]
			else
				rgba = [255 255 255 255]
				glow_rgba = [255 255 255 255]
			endif
			if gotparam \{desc_element}
				switch <player>
					case 1
					setscreenelementprops id = <desc_element> band_hud_instrument_p1_rgba = <rgba>
					setscreenelementprops id = <desc_element> band_hud_instrument_glow_p1_rgba = <glow_rgba>
					case 2
					setscreenelementprops id = <desc_element> band_hud_instrument_p2_rgba = <rgba>
					setscreenelementprops id = <desc_element> band_hud_instrument_glow_p2_rgba = <glow_rgba>
					case 3
					setscreenelementprops id = <desc_element> band_hud_instrument_p3_rgba = <rgba>
					setscreenelementprops id = <desc_element> band_hud_instrument_glow_p3_rgba = <glow_rgba>
					case 4
					setscreenelementprops id = <desc_element> band_hud_instrument_p4_rgba = <rgba>
					setscreenelementprops id = <desc_element> band_hud_instrument_glow_p4_rgba = <glow_rgba>
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
	if NOT gotparam \{new_player_in_streak}
		if NOT gotparam \{streak}
			return
		endif
		if (<streak> < 1)
			return
		endif
		formattext textname = notification qs(0x66bd2b10) d = <streak>
	else
		formattext textname = notification qs(0x83b2be80) d = <new_player_in_streak>
		priority = -1
	endif
	hud_create_message {text = <notification> band priority = <priority> style_script = hud_message_band_streak_style style_script_params = {players = <players>}}
endscript

script hud_band_streak_end 
	getplayerinfo \{1
		bot_play}
	if (<bot_play> = 1)
		return
	endif
	formattext textname = notification qs(0xf3d445f5) d = <score>
	hud_create_message {text = <notification> band priority = <priority> style_script = hud_message_band_streak_style style_script_params = {players = [0 0 0 0]}}
endscript

script hud_attach_widget_band_faceoff_meter 
	attachhudwidget {
		input = {
			value = faceoff_ratio
		}
		outputs = [
			{
				type = descpropertyfloat
				desc_id = <parent_id>
				property = hud_band_battle_meter_needle_rot_angle
				value_range = [1.0 -1.0]
				range = [-51.5 51.5]
				single
			}
			{
				type = descpropertyfloat
				desc_id = <parent_id>
				property = hud_band_battle_meter_amber_on_alpha
				value_range = [0.0 0.1]
				range = [0.0 1.0]
				single
			}
			{
				type = descpropertyfloat
				desc_id = <parent_id>
				property = hud_band_battle_meter_violet_on_alpha
				value_range = [-0.1 0.0]
				range = [1.0 0.0]
				single
			}
		]
	}
	if NOT resolvescreenelementid id = <parent_id> param = id
		return
	endif
	hud_set_team_colors desc_element = <id>
	if ($current_num_players > 2)
		attachhudwidget {
			input = {
				value = band1_score
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			input = {
				value = band2_score
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		attachhudwidget {
			input = {
				value = band1_multiplier
			}
			output = {
				type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_1_texture
				player = 1
				textures = [
					hud_score_nixie_1a
					hud_score_nixie_2a
					hud_score_nixie_3a
					hud_score_nixie_4a
					hud_score_nixie_1a
				]
				sp_textures = [
					hud_score_nixie_2b
					hud_score_nixie_4b
					hud_score_nixie_6b
					hud_score_nixie_8b
					hud_score_nixie_1a
				]
			}
		}
		attachhudwidget {
			input = {
				value = band2_multiplier
			}
			output = {
				type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_2_texture
				player = 2
				textures = [
					hud_score_nixie_1a
					hud_score_nixie_2a
					hud_score_nixie_3a
					hud_score_nixie_4a
					hud_score_nixie_1a
				]
				sp_textures = [
					hud_score_nixie_2b
					hud_score_nixie_4b
					hud_score_nixie_6b
					hud_score_nixie_8b
					hud_score_nixie_1a
				]
			}
		}
		attachhudwidget {
			input = {
				value = band1_starpower
			}
			output = {
				type = setubes
				desc_id = <parent_id>
				band = true
				band_num = 1
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_1_1_texture fill_1_2_texture fill_1_3_texture fill_1_4_texture fill_1_5_texture fill_1_6_texture]
				scales = [fill_1_1_scale fill_1_2_scale fill_1_3_scale fill_1_4_scale fill_1_5_scale fill_1_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			input = {
				object = band1_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		attachhudwidget {
			input = {
				value = band2_starpower
			}
			output = {
				type = setubes
				desc_id = <parent_id>
				band = true
				band_num = 2
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_2_1_texture fill_2_2_texture fill_2_3_texture fill_2_4_texture fill_2_5_texture fill_2_6_texture]
				scales = [fill_2_1_scale fill_2_2_scale fill_2_3_scale fill_2_4_scale fill_2_5_scale fill_2_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			input = {
				object = band2_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		hud_setup_streak_meter_animation \{player = 1
			faceoff}
		hud_setup_streak_meter_animation \{player = 2
			faceoff}
		attachhudwidget {
			input = {
				value = band1_streak
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = p1_streak_number_text
			}
		}
		attachhudwidget {
			input = {
				value = band2_streak
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = p2_streak_number_text
			}
		}
	else
		attachhudwidget {
			input = {
				object = player1_status
				value = score
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			input = {
				object = player2_status
				value = score
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		attachhudwidget {
			input = {
				object = player1_status
				value = multiplier
			}
			output = {
				type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_1_texture
				player = 1
				textures = [
					hud_score_nixie_1a
					hud_score_nixie_2a
					hud_score_nixie_3a
					hud_score_nixie_4a
					hud_score_nixie_1a
				]
				sp_textures = [
					hud_score_nixie_2b
					hud_score_nixie_4b
					hud_score_nixie_6b
					hud_score_nixie_8b
					hud_score_nixie_1a
				]
			}
		}
		attachhudwidget {
			input = {
				object = player2_status
				value = multiplier
			}
			output = {
				type = semultipliernixie
				desc_id = <parent_id>
				property = hud_bb_multiplier_nixie_2_texture
				player = 2
				textures = [
					hud_score_nixie_1a
					hud_score_nixie_2a
					hud_score_nixie_3a
					hud_score_nixie_4a
					hud_score_nixie_1a
				]
				sp_textures = [
					hud_score_nixie_2b
					hud_score_nixie_4b
					hud_score_nixie_6b
					hud_score_nixie_8b
					hud_score_nixie_1a
				]
			}
		}
		attachhudwidget {
			input = {
				object = player1_status
				value = starpower_amount
			}
			output = {
				type = setubes
				desc_id = <parent_id>
				player = 1
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_1_1_texture fill_1_2_texture fill_1_3_texture fill_1_4_texture fill_1_5_texture fill_1_6_texture]
				scales = [fill_1_1_scale fill_1_2_scale fill_1_3_scale fill_1_4_scale fill_1_5_scale fill_1_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			input = {
				object = player1_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		attachhudwidget {
			input = {
				object = player2_status
				value = starpower_amount
			}
			output = {
				type = setubes
				desc_id = <parent_id>
				player = 2
				default_scale = (1.0, 1.0)
				value_range = [0.0 100.0]
				textures = [fill_2_1_texture fill_2_2_texture fill_2_3_texture fill_2_4_texture fill_2_5_texture fill_2_6_texture]
				scales = [fill_2_1_scale fill_2_2_scale fill_2_3_scale fill_2_4_scale fill_2_5_scale fill_2_6_scale]
			}
		}
		<tubes_widget_id> = <observer_id>
		attachhudwidget {
			input = {
				object = player2_status
				value = starpower_active
			}
			output = {id = <tubes_widget_id>}
		}
		if NOT ($boss_battle = 1)
			hud_setup_streak_meter_animation \{player = 1
				faceoff}
			hud_setup_streak_meter_animation \{player = 2
				faceoff}
			if playerinfoequals \{1
					part = vocals}
				<divide_by_10> = true
			else
				<divide_by_10> = false
			endif
			attachhudwidget {
				input = {
					object = player1_status
					value = note_streak
				}
				output = {
					type = seinttostring
					desc_id = <parent_id>
					property = p1_streak_number_text
					divide_by_10 = <divide_by_10>
				}
			}
			if playerinfoequals \{2
					part = vocals}
				<divide_by_10> = true
			else
				<divide_by_10> = false
			endif
			attachhudwidget {
				input = {
					object = player2_status
					value = note_streak
				}
				output = {
					type = seinttostring
					desc_id = <parent_id>
					property = p2_streak_number_text
					divide_by_10 = <divide_by_10>
				}
			}
		endif
	endif
endscript

script hud_attach_widget_player_multiplier 
	requireparams \{[
			parent_id
			player
		]
		all}
	getplayerinfo <player> checksum
	resolvescreenelementid id = <parent_id> param = id
	attachhudwidget {
		input = {
			object = <checksum>
			value = note_streak
		}
		output = {
			type = senotestreaklights
			desc_id = <id>
			player = <player>
			bulb_textures = [
				[
					hud_score_light_0
					hud_score_light_1
					hud_score_light_2
				]
				[
					hud_score_light_0_green
					hud_score_light_1_green
					hud_score_light_2_green
				]
				[
					hud_score_light_0_purple
					hud_score_light_1_purple
					hud_score_light_2_purple
				]
				[
					hud_score_light_0_blue
					hud_score_light_1_blue
					hud_score_light_2_blue
				]
			]
			bulb_props = [light0_texture light1_texture light2_texture light3_texture light4_texture]
		}
	}
	<note_streak_widget_id> = <observer_id>
	attachhudwidget {
		input = {
			object = <checksum>
			value = starpower_active
		}
		output = {id = <note_streak_widget_id>}
	}
	if playerinfoequals <player> part = vocals
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
		getplayerinfo <player> part
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
		setarrayelement arrayname = textures index = 4 newvalue = <default_mul_tex>
	endif
	attachhudwidget {
		input = {
			object = <checksum>
			value = multiplier
		}
		output = {
			type = semultipliernixie
			desc_id = <id>
			property = nixie_texture
			property2 = mult_bg_alpha
			color_prop = nixie_rgba
			player = <player>
			num_players = $current_num_players
			textures = <textures>
			sp_textures = <sp_textures>
			colors = <colors>
		}
	}
endscript

script hud_attach_widget_player_health 
	requireparams \{[
			parent_id
			player
		]
		all}
	getplayerinfo <player> checksum
	resolvescreenelementid id = <parent_id> param = id
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
	if gotparam \{vocals}
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
		input = {
			object = <checksum>
			value = health
		}
		outputs = [
			{
				type = <pos_type>
				desc_id = <id>
				property = <pos_prop>
				value_range = <pos_value_range>
				range = <pos_range>
				single
			}
			{
				type = descpropertypair
				desc_id = <id>
				property = <scale_prop>
				value_range = [0.0 2.0]
				range = <scale_range>
				single
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = <red_light>
				value_range = [0.0 0.6666]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = <yel_light>
				value_range = [0.6666 1.3333]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = <grn_light>
				value_range = [1.3333 2.0]
			}
		]
	}
	blink_rate = 0.3
	attachhudwidget {
		input = {
			value = time
		}
		outputs = [
			{
				type = screenelementplayerhealthblink
				desc_id = <id>
				property = <red_light_rgba>
				blink_rate = <blink_rate>
				color1 = [255 , 255 , 255 , 255]
				color2 = [255 , 255 , 255 , 0]
			}
			{
				type = screenelementplayerhealthblink
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
	requireparams \{[
			parent_id
			player
		]
		all}
	getplayerinfo <player> checksum
	resolvescreenelementid id = <parent_id> param = id
	if ($current_num_players > 1)
		attachhudwidget {
			input = {
				object = <checksum>
				value = starpower_amount
			}
			output = {
				type = setubes
				desc_id = <id>
				player = <player>
				value_range = [0.0 100.0]
				textures = [glow0_texture glow1_texture glow2_texture]
				scales = [glow0_scale glow1_scale glow2_scale]
			}
		}
	endif
endscript

script hud_setup_streak_meter_animation \{player = 1}
	if NOT gotparam \{faceoff}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			<band_meter> :desc_resolvealias name = alias_streak param = streak_id
		endif
	else
		if hud_root :desc_resolvealias \{name = alias_faceoff_meter
				param = faceoff_meter}
			if (<player> = 1)
				<faceoff_meter> :desc_resolvealias name = alias_streak_p1 param = streak_id
			else
				<faceoff_meter> :desc_resolvealias name = alias_streak_p2 param = streak_id
			endif
		endif
	endif
	if NOT gotparam \{streak_id}
		return
	endif
	if screenelementexists id = <streak_id>
		getscreenelementprops id = <streak_id>
		if NOT gotparam \{faceoff}
			hide_pos = (<pos> - (0.0, 65.0))
			if ($current_num_players = 1)
				getplayerinfo <player> part
				if (<part> = vocals)
					pos = (913.0, 438.0)
					hide_pos = (<pos> + (0.0, 65.0))
				endif
			endif
		else
			if (<player> = 1)
				hide_pos = (<pos> + (200.0, 0.0))
			else
				hide_pos = (<pos> - (200.0, 0.0))
			endif
		endif
		streak_pos = <pos>
		if gamemode_isbandscoring
			if (<player> = 1)
				event_handlers = [
					{band1_streak_started setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <streak_pos>}}
					{band1_streak_ended setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <hide_pos>}}
				]
			elseif (<player> = 2)
				event_handlers = [
					{band2_streak_started setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <streak_pos>}}
					{band2_streak_ended setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <hide_pos>}}
				]
			endif
		else
			if (<player> = 1)
				event_handlers = [
					{player1_streak_started setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <streak_pos>}}
					{player1_streak_ended setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <hide_pos>}}
				]
			elseif (<player> = 2)
				event_handlers = [
					{player2_streak_started setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <streak_pos>}}
					{player2_streak_ended setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <hide_pos>}}
				]
			endif
		endif
		setscreenelementprops {
			id = <streak_id>
			event_handlers = <event_handlers>
			replace_handlers
			pos = <hide_pos>
		}
	endif
endscript

script hud_setup_band_mult_animation 
	if ($current_num_players = 1)
		return
	endif
	if hud_root :desc_resolvealias \{name = alias_band_meter
			param = band_meter}
		<band_meter> :desc_resolvealias name = alias_band_multiplier param = mult_id
	endif
	if NOT gotparam \{mult_id}
		return
	endif
	if screenelementexists id = <mult_id>
		getscreenelementprops id = <mult_id>
		hide_pos = (<pos> + (100.0, 0.0))
		hide_scale = 0.5
		event_handlers = [
			{show_band_mult setscreenelementprops params = {id = <mult_id> time = 0.3 pos = <pos> scale = <scale>}}
			{hide_band_mult setscreenelementprops params = {id = <mult_id> time = 0.3 pos = <hide_pos> scale = <hide_scale>}}
		]
		setscreenelementprops {
			id = <mult_id>
			event_handlers = <event_handlers>
			replace_handlers
			pos = <hide_pos>
			scale = <hide_scale>
		}
	endif
endscript

script hud_setup_secondary_starpower_bulb_animation 
	hud_root :desc_resolvealias \{name = alias_band_meter
		param = band_meter}
	<band_meter> :desc_resolvealias name = alias_secondary_bulbs param = container_id
	if screenelementexists id = <container_id>
		getscreenelementprops id = <container_id>
		hide_pos = (<pos> + (-15.0, 60.0))
		show_pos = <pos>
		event_handlers = [
			{starpower_bulbs_unhide setscreenelementprops params = {id = <container_id> time = 0.3 pos = <show_pos>}}
			{starpower_bulbs_hide setscreenelementprops params = {id = <container_id> time = 0.3 pos = <hide_pos>}}
		]
		setscreenelementprops {
			id = <container_id>
			event_handlers = <event_handlers>
			replace_handlers
			pos = <hide_pos>
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
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			if screenelementexists id = <band_meter>
				if <band_meter> :desc_resolvealias name = alias_hud_meter_red_bg param = bg_id
					begin
					if NOT screenelementexists id = <bg_id>
						break
					endif
					setscreenelementprops {
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
					if <band_meter> :desc_resolvealias name = alias_pulse_container param = scale_id
						if screenelementexists id = <scale_id>
							setscreenelementprops {
								id = <scale_id>
								scale = 1.1
								time = 0.1
							}
						endif
					endif
					wait \{0.1
						seconds}
					if NOT screenelementexists id = <bg_id>
						break
					endif
					setscreenelementprops {
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
					if <band_meter> :desc_resolvealias name = alias_pulse_container param = scale_id
						if screenelementexists id = <scale_id>
							setscreenelementprops {
								id = <scale_id>
								scale = 1.2
								time = 0.1
							}
						endif
					endif
					wait \{0.1
						seconds}
					repeat
				endif
			endif
		endif
	endif
endscript

script hud_stop_blink_rock_meter 
	band_failing_vingette_off
	killspawnedscript \{name = hud_start_blink_rock_meter_spawn}
	hud_meter_set_rgba \{new_rgba = [
			0
			0
			0
			0
		]}
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			if screenelementexists id = <band_meter>
				if <band_meter> :desc_resolvealias name = alias_hud_meter_red_bg param = id
					if screenelementexists id = <id>
						setscreenelementprops {
							id = <id>
							rgba = [255 255 255 255]
							time = 0.1
						}
					endif
				endif
				if <band_meter> :desc_resolvealias name = alias_pulse_container param = scale_id
					if screenelementexists id = <scale_id>
						setscreenelementprops {
							id = <scale_id>
							scale = 1.1
							time = 0.1
						}
					endif
				endif
			endif
		endif
	endif
endscript

script hud_pulse_rock_meter 
	killspawnedscript \{name = hud_pulse_rock_meter_spawn}
	spawnscriptlater \{hud_pulse_rock_meter_spawn}
endscript

script hud_pulse_rock_meter_spawn 
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			if screenelementexists id = <band_meter>
				if <band_meter> :desc_resolvealias name = alias_pulse_container param = id
					if screenelementexists id = <id>
						setscreenelementprops {
							id = <id>
							scale = 1.2
							relative_scale
							time = 0.1
						}
						wait \{0.1
							seconds}
						if NOT screenelementexists id = <id>
							return
						endif
						setscreenelementprops {
							id = <id>
							scale = 1.0
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
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			if screenelementexists id = <band_meter>
				if <band_meter> :desc_resolvealias name = alias_band_hud_meter_outer_glow param = id
					if screenelementexists id = <id>
						if gotparam \{old_rgba}
							getscreenelementprops id = <id>
							i = 0
							begin
							if NOT (<rgba> [<i>] = <old_rgba> [<i>])
								return
							endif
							i = (<i> + 1)
							repeat 4
						endif
						setscreenelementprops {
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
	killspawnedscript \{name = hud_animate_star_meter_flames_spawn}
	spawnscriptlater \{hud_animate_star_meter_flames_spawn}
endscript

script hud_animate_star_meter_flames_spawn 
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			if screenelementexists id = <band_meter>
				if <band_meter> :desc_resolvealias name = alias_star_flame param = parent
					if screenelementexists id = <parent>
						star_meter_sparks01 parent = <parent>
						soundevent \{event = star_get}
					endif
				endif
			endif
		endif
	endif
endscript

script star_meter_sparks01 
	props = {
		type = spriteelement
		parent = <parent>
		dims = (128.0, 128.0)
		scale = (6.0, 6.0)
		pos = (64.0, 64.0)
		just = [center bottom]
		material = mat_note_hit_xplosion1
		z_priority = 18
	}
	destroyscreenelement \{id = star_spark01}
	destroyscreenelement \{id = star_spark02}
	destroyscreenelement \{id = star_spark03}
	destroyscreenelement \{id = star_spark04}
	createscreenelement {
		id = star_spark01
		rot_angle = 0
		<props>
	}
	createscreenelement {
		id = star_spark02
		rot_angle = 90
		<props>
	}
	createscreenelement {
		id = star_spark03
		rot_angle = 180
		<props>
	}
	createscreenelement {
		id = star_spark04
		rot_angle = 270
		<props>
	}
	wait \{16
		frames}
	destroyscreenelement \{id = star_spark01}
	destroyscreenelement \{id = star_spark02}
	destroyscreenelement \{id = star_spark03}
	destroyscreenelement \{id = star_spark04}
endscript

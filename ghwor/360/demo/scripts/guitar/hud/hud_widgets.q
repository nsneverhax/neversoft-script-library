
script hud_attach_star_meter 
	id = <star_meter_id>
	gamemode_gettype
	if NOT screenelementexists id = <star_meter_id>
		printf \{channel = zdebug
			qs(0x60507be7)}
		return
	endif
	<id> :settags {star_count = 0}
	<id> :obj_spawnscript star_meter_star_count_manager params = {}
	hud_setup_progress_meter meter_id = <id>
	always_show_ns_meter = 0
	if issingleplayergame
		getfirstplayer
		formattext checksumname = object 'player%p_hud' p = <player>
		value_score = score
		value_streak = note_streak
		value_star = projected_song_stars
		value_miss = has_missed_note
		if playerinfoequals <player> part = vocals
			<divide_by_10> = true
			always_show_ns_meter = 1
		else
			<divide_by_10> = false
		endif
	else
		getfirstplayer
		getplayerinfo <player> band
		formattext checksumname = value_score 'band%b_score' b = <band>
		formattext checksumname = value_streak 'band%b_streak' b = <band>
		value_star = band_projected_song_stars
		value_miss = band_has_missed_note
		show_band_mult = 1
	endif
	attachhudwidget {
		input = {
			object = <object>
			value = <value_score>
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = score_text
			usecommas = true
		}
	}
	attachhudwidget {
		input = {
			object = <object>
			value = <value_streak>
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
			object = <object>
			value = <value_star>
		}
		output = {
			type = sestarmeter
			desc_id = <id>
			full_scale = 1.0
			full_x_dim = <x_dim>
		}
	}
	if (($is_ampzilla_battle) = 1)
		attachhudwidget {
			input = {
				object = <object>
				value = <value_star>
			}
			output = {
				type = screenelementrunscript
				desc_id = <id>
				run_script = hud_final_battle_star_up
				full_scale = 1.0
			}
		}
	endif
	if (<type> != career)
		attachhudwidget {
			input = {
				object = <object>
				value = <value_miss>
			}
			outputs =
			[
				{
					type = screenelementrgbaswitch
					desc_id = <id>
					property = star_filler_rgba
					color1 = [238 , 204 , 120 , 255]
					color2 = [210 , 210 , 210 , 255]
				}
				{
					type = screenelementconditional
					desc_id = <id>
					property = band_hud_gold_star_glow_alpha
				}
			]
		}
	else
		<id> :se_setprops band_hud_gold_star_glow_alpha = 0
	endif
	if gotparam \{show_band_mult}
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
					band_hud_multiplier_five
					band_hud_multiplier_six
					band_hud_multiplier_seven
					band_hud_multiplier_eight
					band_hud_multiplier_nine
					band_hud_multiplier_ten
					band_hud_multiplier_eleven
				]
			}
		}
	endif
	hud_setup_band_mult_animation star_meter_id = <id>
	if (<always_show_ns_meter> = 1)
		starmeter_show_hide_notestreak \{show = 1}
	else
		starmeter_show_hide_notestreak \{show = 0}
	endif
endscript

script hud_attach_widget_score_meter 
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_score
			param = id}
		return
	endif
	attachhudwidget {
		input = {
			value = band1_score
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = score_top_text
		}
	}
	attachhudwidget {
		input = {
			value = band1_score
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = score_bottom_text
		}
	}
endscript

script hud_attach_widget_band_rock_meter 
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_band_rock
			param = id}
		return
	endif
	health_value_range = [0.0 2.0]
	needle_range = [(0.0, 0.0) (200.0, 0.0)]
	attachhudwidget {
		input = {
			value = band_health
		}
		outputs = [
			{
				type = descpropertypair
				desc_id = <id>
				property = meter_band_rock_needle_pos
				value_range = [0.0 2.0]
				range = <needle_range>
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = meter_band_rock_red_alpha
				value_range = [0.0 0.6666]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = meter_band_rock_amber_alpha
				value_range = [0.6666 1.3333]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <id>
				property = meter_band_rock_green_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
endscript

script hud_attach_widget_band_multiplier \{band = 1}
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_band_mult
			param = id}
		return
	endif
	formattext checksumname = value 'band%p_multiplier' p = <band>
	attachhudwidget {
		input = {
			value = <value>
		}
		output = {
			type = seinttostring
			desc_id = <id>
			property = mult_text_text
		}
	}
endscript

script hud_attach_widget_sidebar_notestreak_meter 
	requireparams \{[
			player
			desc_id
		]
		all}
	getplayerinfo <player> hud_id
	attachhudwidget {
		input = {
			object = <hud_id>
			value = multiplier
		}
		outputs = [
			{
				type = seinttostring
				desc_id = <desc_id>
				property = hud_meter_combo_multiplier_text
				player = <player>
			}
			{
				type = seinttostring
				desc_id = <desc_id>
				property = hud_meter_combo_multiplier_text2
				player = <player>
			}
			{
				type = screenelementconditionalint
				desc_id = <desc_id>
				property = combo_multiplier_container_alpha
				value_range = [2 100]
			}
		]
	}
	attachhudwidget {
		input = {
			object = <hud_id>
			value = note_streak
		}
		output = {
			type = secombolights
			desc_id = <desc_id>
			player = <player>
			bulb_props = [
				led_01_rgba
				led_02_rgba
				led_03_rgba
				led_04_rgba
				led_05_rgba
				led_06_rgba
				led_07_rgba
				led_08_rgba
				led_09_rgba
				led_10_rgba
			]
			bg_prop = hud_meter_combo_multiplier_bg_rgba
			text_prop = hud_meter_combo_multiplier_rgba
			led_colors = [
				[255 180 180 255]
				[243 169 64 255]
				[128 236 68 255]
				[175 101 238 255]
				[190 10 10 255]
				[190 10 10 255]
				[185 230 160 255]
				[255 180 110 255]
			]
			bg_colors = [
				[50 50 50 255]
				[153 105 30 255]
				[85 128 58 255]
				[100 70 140 255]
				[85 10 10 255]
				[100 10 10 255]
				[65 120 130 255]
				[100 100 100 255]
			]
		}
	}
	<note_streak_widget_id> = <observer_id>
	attachhudwidget {
		input = {
			object = <hud_id>
			value = starpower_active
		}
		output = {
			id = <note_streak_widget_id>
		}
	}
endscript

script hud_attach_widget_sidebar_rockmeter 
	requireparams \{[
			player
			desc_id
		]
		all}
	getplayerinfo <player> hud_id
	pos_range = [(12.0, -6.0) (14.333, -88.32) (16.666, -152.314) (19.0, -202.0)]
	pos_value_range = [0.0 0.6666 1.3333 2.0]
	pos_type = individualhealthneedlepos
	needle_pos_range = [(12.0, -2.0) (19.0, -203.0)]
	needle_scale_range = [(1.1, 1.2) (0.8, 0.9)]
	attachhudwidget {
		input = {
			object = <hud_id>
			value = health
		}
		outputs = [
			{
				desc_id = <desc_id>
				type = rgbaswap
				value_range = [0.0 0.666667 1.3333]
				property = needle_color_rgba
				colors = [
					[255 0 0 128]
					[255 255 0 128]
					[0 255 0 128]
				]
			}
			{
				desc_id = <desc_id>
				type = rgbaswap
				value_range = [0.0 0.666667 1.3333]
				property = needle_white_rgba
				colors = [
					[255 255 255 255]
					[255 255 255 255]
					[255 255 255 255]
				]
			}
			{
				desc_id = <desc_id>
				type = rgbaswap
				value_range = [0.0 0.666667 1.3333]
				property = needle_black_rgba
				colors = [
					[255 0 0 255]
					[255 255 0 255]
					[0 255 0 255]
				]
			}
			{
				type = individualhealthneedlepos
				value_range = <pos_value_range>
				range = <pos_range>
				desc_id = <desc_id>
				property = needle_container_pos
			}
			{
				type = descpropertypair
				value_range = [0.0 2.0]
				range = <needle_scale_range>
				desc_id = <desc_id>
				property = needle_container_scale
			}
			{
				type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = flare_alpha
				value_range = [1.99 2.0]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = led_red_alpha
				value_range = [0.0 0.66]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = led_yellow_alpha
				value_range = [0.66 1.3299999]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = led_green_alpha
				value_range = [1.3299999 2.0]
			}
		]
	}
endscript

script hud_attach_widget_sidebar_starpowermeter 
	requireparams \{[
			player
			desc_id
		]
		all}
	needle_pos_range = [(12.0, -2.0) (19.0, -205.0)]
	needle_scale_range = [(1.1, 0.75) (0.7, 1.0)]
	needle_rot_range = [-5.0 0.0]
	tesla_needle_pos_range = [(12.0, -2.0) (15.5, -107.0)]
	getplayerinfo <player> hud_id
	attachhudwidget {
		input = {
			object = <hud_id>
			value = starpower_amount
		}
		outputs = [
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = <needle_pos_range>
				desc_id = <desc_id>
				property = needle_container_pos
			}
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = <needle_scale_range>
				desc_id = <desc_id>
				property = needle_container_scale
			}
			{
				type = descpropertyfloat
				value_range = [0.0 100.0]
				range = <needle_rot_range>
				desc_id = <desc_id>
				property = needle_container_rot_angle
			}
			{
				type = sestarpowermeterfx
				desc_id = <desc_id>
				property = needle_white_alpha
				value_range = [50.0 100.0]
			}
			{
				type = sestarpowermeterfx
				desc_id = <desc_id>
				property = needle_color_alpha
				value_range = [50.0 100.0]
			}
			{
				type = descpropertypair
				value_range = [0.0 49.0]
				range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = fill_pre_sp_scale
			}
			{
				type = descpropertypair
				value_range = [50.0 100.0]
				range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = fill_post_sp_scale
			}
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = fill_post_spfx_scale
			}
			{
				type = sestarpowermeterfx
				desc_id = <desc_id>
				property = fill_post_spfx_alpha
				value_range = [50.0 100.0]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = fill_fudge_hider_alpha
				value_range = [1.0 100.0]
			}
			{
				type = descpropertypair
				value_range = [0.0 49.0]
				range = <tesla_needle_pos_range>
				desc_id = <desc_id>
				property = tesla_needle_pos
			}
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = <needle_scale_range>
				desc_id = <desc_id>
				property = tesla_needle_scale
			}
			{
				type = descpropertyfloat
				value_range = [0.0 100.0]
				range = <needle_rot_range>
				desc_id = <desc_id>
				property = tesla_needle_rot_angle
			}
			{
				type = sestarpowermeterfx
				desc_id = <desc_id>
				property = tesla_needle_alpha
				value_range = [1.0 100.0]
			}
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = [(0.0, 1.0) (1.0, 1.5)]
				desc_id = <desc_id>
				property = rp_tesla_fx_scale
			}
		]
	}
endscript

script hud_attach_widget_sidebar_sp_meter 
	requireparams \{[
			desc_id
			player
		]
		all}
	sp_value_range = [0.0 100.0]
	scale_range = [(0.0, 1.0) (1.0, 1.0)]
	getplayerinfo <player> hud_id
	attachhudwidget {
		input = {
			object = <hud_id>
			value = starpower_amount
		}
		output = {
			type = descpropertypair
			value_range = <sp_value_range>
			range = <scale_range>
			desc_id = <desc_id>
			property = fill_scale
		}
	}
endscript

script hud_attach_widget_vocal_competitive_meter 
	requireparams \{[
			player
			meter
		]
		all}
	if NOT <meter> :desc_resolvealias name = alias_hud_sidebar_rankmeter param = rank_meter
		scriptassert 'player %p rank meter not found' p = <player>
	endif
	<rank_meter> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 1 element_id = <rank_meter>}
	}
	return
endscript

script hud_attach_widget_vocal_sp_combo_meter 
	requireparams \{[
			player
			meter
		]
		all}
	if NOT <meter> :desc_resolvealias name = alias_vocals_health_meter param = health_meter
		scriptassert 'player %p vocal health meter not found' p = <player>
	endif
	getplayerinfo <player> hud_id
	needle_range = [(-55.0, 5.118) (28.0, 5.118)]
	attachhudwidget {
		input = {
			object = <hud_id>
			value = health
		}
		outputs = [
			{
				type = descpropertypair
				value_range = [0.0 2.0]
				range = <needle_range>
				desc_id = <health_meter>
				property = vocal_health_meter_needle_pos
			}
			{
				type = screenelementconditionalfloat
				desc_id = <health_meter>
				property = vocal_health_meter_red_alpha
				value_range = [0.0 0.6666]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <health_meter>
				property = vocal_health_meter_amber_alpha
				value_range = [0.6666 1.3333]
			}
			{
				type = screenelementconditionalfloat
				desc_id = <health_meter>
				property = vocal_health_meter_green_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
	if NOT <meter> :desc_resolvealias name = alias_vocals_multiplier param = mult_meter
		scriptassert 'player %p vocal multiplier not found' p = <player>
	endif
	attachhudwidget {
		input = {
			object = <hud_id>
			value = multiplier
		}
		outputs = [
			{
				type = seinttostring
				desc_id = <mult_meter>
				property = multiplier_number_text
				player = <player>
			}
			{
				type = seinttostring
				desc_id = <mult_meter>
				property = multiplier_number_text2
				player = <player>
			}
			{
				type = secombolights
				desc_id = <mult_meter>
				player = <player>
				no_bulbs = true
				bg_prop = vocal_multiplier_bg_rgba
				text_prop = multiplier_number_rgba
				text_prop_2 = multiplier_time_rgba
				led_colors = [
					[255 180 180 255]
					[243 169 64 255]
					[128 236 68 255]
					[175 101 238 255]
					[190 10 10 255]
					[190 10 10 255]
					[185 230 160 255]
					[255 180 110 255]
				]
				bg_colors = [
					[50 50 50 255]
					[153 105 30 255]
					[85 128 58 255]
					[100 70 140 255]
					[85 10 10 255]
					[100 10 10 255]
					[65 120 130 255]
					[100 100 100 255]
				]
			}
		]
	}
	attachhudwidget {
		input = {
			object = <hud_id>
			value = starpower_active
		}
		output = {
			type = secombolights
			desc_id = <mult_meter>
			player = <player>
			no_bulbs = true
			bg_prop = vocal_multiplier_bg_rgba
			text_prop = multiplier_number_rgba
			text_prop_2 = multiplier_time_rgba
			led_colors = [
				[255 180 180 255]
				[243 169 64 255]
				[128 236 68 255]
				[175 101 238 255]
				[190 10 10 255]
				[190 10 10 255]
				[185 230 160 255]
				[255 180 110 255]
			]
			bg_colors = [
				[50 50 50 255]
				[153 105 30 255]
				[85 128 58 255]
				[100 70 140 255]
				[85 10 10 255]
				[100 10 10 255]
				[65 120 130 255]
				[100 100 100 255]
			]
		}
	}
	if NOT <meter> :desc_resolvealias name = alias_vocals_star_power_meter param = sp_meter
		scriptassert 'player %p sp multiplier not found' p = <player>
	endif
	needle_pos_range = [(-59.0, 0.0) (58.0, 0.0)]
	sp_range = [(-114.0, 0.0) (0.0, 0.0)]
	attachhudwidget {
		input = {
			object = <hud_id>
			value = starpower_amount
		}
		outputs = [
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = <sp_range>
				desc_id = <sp_meter>
				property = vocal_starpower_fill_pos
			}
			{
				type = sestarpowermeterfx
				desc_id = <sp_meter>
				property = fill_post_spfx_alpha
				value_range = [50.0 100.0]
			}
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <sp_meter>
				property = fill_post_spfx_scale
			}
			{
				type = descpropertypair
				value_range = [1.0 100.0]
				range = [(0.0, 1.0) (1.0, 1.0)]
				desc_id = <sp_meter>
				property = rp_telsa_fx_cont_scale
			}
			{
				type = descpropertypair
				value_range = [0.0 100.0]
				range = <needle_pos_range>
				desc_id = <sp_meter>
				property = vspm_needle_container_pos
			}
		]
	}
	if NOT <meter> :desc_resolvealias name = alias_vocals_phrase_progress_meter param = pp_meter
		scriptassert 'player %p pp meter not found' p = <player>
	endif
	pp_range = [(-104.0, 0.0) (0.0, 0.0)]
	attachhudwidget {
		input = {
			object = <hud_id>
			value = phrase_progress
		}
		outputs = [
			{
				type = descpropertypair
				value_range = [0.0 1.0]
				range = <pp_range>
				desc_id = <pp_meter>
				property = vocal_phrase_progress_fill_pos
			}
			{
				type = rgbaswap
				desc_id = <pp_meter>
				property = vocal_phrase_progress_fill_rgba
				value_range = [0.0 0.6 0.8]
				colors = [
					[200 200 200 255]
					[245 255 0 255]
					[0 255 0 255]
				]
			}
		]
	}
endscript

script hud_set_band_meter_instrument_icons 
	index = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
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
		if (<index> <= <num_players>)
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
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script hud_set_band_meter_instrument_streak_color 
	if gotparam \{player}
		if screenelementexists \{id = hud_root}
			if hud_root :desc_resolvealias \{name = alias_band_meter
					param = band_meter}
				resolvescreenelementid id = <band_meter> param = desc_element
			endif
			if gotparam \{on}
				highway_streak_glow player = <player> enabled = 1
			else
				highway_streak_glow player = <player> enabled = 0
			endif
		endif
	endif
endscript

script hud_band_streak_notify 
	getfirstplayer
	getplayerinfo <player> bot_play
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
	getfirstplayer
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return
	endif
	formattext textname = notification qs(0xf3d445f5) d = <score>
	hud_create_message {text = <notification> band priority = <priority> style_script = hud_message_band_streak_style style_script_params = {players = []}}
endscript

script hud_attach_scores_stack_widget 
	requireparams \{[
			parent_id
		]
		all}
	<parent_id> :desc_resolvealias name = alias_scores_stack param = scores_stack_menu
	getbandsstatus
	if gotparam \{bands}
		getarraysize <bands>
		bands_size = <array_size>
		if (<bands_size> > 0)
			printstruct <...>
			index = 0
			begin
			if (<bands> [<index>].in_game = 1)
				formattext checksumname = value 'band%d_score' d = (<index> + 1)
				formattext checksumname = property 'band%d_score_text' d = (<index> + 1)
				formattext checksumname = color 'band%d_score_rgba' d = (<index> + 1)
				formattext checksumname = color_value 'band_color%d' d = (<index> + 1)
				attachhudwidget {
					input = {
						value = <value>
					}
					output = {
						type = seinttostring
						desc_id = <parent_id>
						property = <property>
					}
				}
				addparam structure_name = prop_struct name = <color> value = ($<color_value>)
				<parent_id> :se_setprops <prop_struct>
			elseif gotparam \{children}
				getarraysize <children>
				if (<array_size> > <index>)
					destroyscreenelement id = (<children> [<index>])
				endif
			elseif gotparam \{scores_stack_menu}
				getscreenelementchildren id = <scores_stack_menu>
				getarraysize <children>
				if (<array_size> > <index>)
					destroyscreenelement id = (<children> [<index>])
				endif
			endif
			<index> = (<index> + 1)
			repeat <bands_size>
		endif
	endif
endscript

script hud_attach_widget_band_versus_meter 
	getfirstplayer
	if playerinfoequals <player> band = 1
		<parent_id> :se_getprops
		<parent_id> :se_setprops {
			right_side_rgba = <left_side_rgba>
			left_side_rgba = <right_side_rgba>
			meter_off_horizontal_flip = true
		}
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
		attachhudwidget {
			input = {
				value = band1_meter_value
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			input = {
				value = band2_meter_value
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
				type = seinttostring
				desc_id = <parent_id>
				property = multiplier_1_number_text
			}
		}
		attachhudwidget {
			input = {
				value = band2_multiplier
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = multiplier_2_number_text
			}
		}
	else
		attachhudwidget {
			input = {
				value = faceoff_ratio
			}
			outputs = [
				{
					type = descpropertyfloat
					desc_id = <parent_id>
					property = hud_band_battle_meter_needle_rot_angle
					value_range = [-1.0 1.0]
					range = [-51.5 51.5]
					single
				}
				{
					type = descpropertyfloat
					desc_id = <parent_id>
					property = hud_band_battle_meter_amber_on_alpha
					value_range = [-0.1 0.0]
					range = [1.0 0.0]
					single
				}
				{
					type = descpropertyfloat
					desc_id = <parent_id>
					property = hud_band_battle_meter_violet_on_alpha
					value_range = [0.0 0.1]
					range = [0.0 1.0]
					single
				}
			]
		}
		attachhudwidget {
			input = {
				value = band1_meter_value
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		attachhudwidget {
			input = {
				value = band2_meter_value
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			input = {
				value = band1_multiplier
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = multiplier_2_number_text
			}
		}
		attachhudwidget {
			input = {
				value = band2_multiplier
			}
			output = {
				type = seinttostring
				desc_id = <parent_id>
				property = multiplier_1_number_text
			}
		}
	endif
endscript

script hud_attach_widget_player_multiplier 
	requireparams \{[
			parent_id
			player
		]
		all}
	getplayerinfo <player> hud_id
	resolvescreenelementid id = <parent_id> param = id
	attachhudwidget {
		input = {
			object = <hud_id>
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
			object = <hud_id>
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
	if playerinfoequals <player> part = vocals
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
	setarrayelement arrayname = textures index = 0 newvalue = <default_mul_tex>
	attachhudwidget {
		input = {
			object = <hud_id>
			value = multiplier
		}
		output = {
			type = semultipliernixie
			desc_id = <id>
			property = nixie_texture
			player = <player>
			textures = <textures>
			sp_textures = <sp_textures>
		}
	}
endscript

script hud_setup_streak_meter_animation 
	band_meter = <star_meter_id>
	if NOT gotparam \{streak_id}
		return
	endif
	if screenelementexists id = <streak_id>
		getscreenelementprops id = <streak_id>
		printf \{channel = zdebug
			qs(0xbcc10b78)}
		printstruct channel = zdebug <...>
		hide_pos = (<pos> - (0.0, 65.0))
		streak_pos = <pos>
		getfirstplayer
		getplayerinfo <player> band
		if gamemode_isbandscoring
			if (<band> = 1)
				streak_started_event = band1_streak_started
				streak_ended_event = band1_streak_ended
			elseif (<band> = 2)
				streak_started_event = band2_streak_started
				streak_ended_event = band2_streak_ended
			endif
		else
			switch <player>
				case 1
				streak_started_event = player1_streak_started
				streak_ended_event = player1_streak_ended
				case 2
				streak_started_event = player2_streak_started
				streak_ended_event = player2_streak_ended
				case 3
				streak_started_event = player3_streak_started
				streak_ended_event = player3_streak_ended
				case 4
				streak_started_event = player4_streak_started
				streak_ended_event = player4_streak_ended
			endswitch
		endif
		requireparams \{[
				streak_started_event
				streak_ended_event
			]
			all}
		event_handlers = [
			{<streak_started_event> setscreenelementprops params = {id = <streak_id> time = 0.1 pos = <streak_pos>}}
			{<streak_ended_event> setscreenelementprops params = {id = <streak_id> time = 0.3 pos = <hide_pos>}}
		]
		setscreenelementprops {
			id = <streak_id>
			event_handlers = <event_handlers>
			replace_handlers
			pos = <hide_pos>
		}
	endif
endscript

script hud_setup_band_mult_animation 
	band_meter = <star_meter_id>
	if NOT <band_meter> :desc_resolvealias name = alias_band_multiplier param = mult_id
		return
	endif
	if screenelementexists id = <mult_id>
		getscreenelementprops id = <mult_id>
		hide_pos = (<pos> + (118.0, 32.0))
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

script hud_start_blink_rock_meter 
	spawnscriptlater \{hud_start_blink_rock_meter_spawn}
endscript

script hud_start_blink_rock_meter_spawn 
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			if screenelementexists id = <band_meter>
				if <band_meter> :desc_resolvealias name = alias_hud_meter_red_bg param = id
					begin
					if NOT screenelementexists id = <id>
						break
					endif
					setscreenelementprops {
						id = <id>
						rgba = [50 50 50 255]
						time = 0.1
					}
					wait \{0.1
						seconds}
					if NOT screenelementexists id = <id>
						break
					endif
					setscreenelementprops {
						id = <id>
						rgba = [255 255 255 255]
						time = 0.1
					}
					wait \{0.1
						seconds}
					repeat
				endif
			endif
		endif
	endif
endscript

script hud_stop_blink_rock_meter 
	killspawnedscript \{name = hud_start_blink_rock_meter_spawn}
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
			endif
		endif
	endif
endscript


script hud_attach_star_meter 
	id = <star_meter_id>
	gamemode_gettype
	if NOT ScreenElementExists id = <star_meter_id>
		printf \{channel = zdebug
			qs(0x60507be7)}
		return
	endif
	<id> :SetTags {star_count = 0}
	<id> :obj_spawnscript star_meter_star_count_manager params = {}
	hud_setup_progress_meter meter_id = <id>
	always_show_ns_meter = 0
	if isSinglePlayerGame
		getfirstplayer
		formatText checksumName = object 'player%p_hud' p = <Player>
		value_score = score
		value_streak = note_streak
		value_star = projected_song_stars
		value_miss = has_missed_note
		if playerinfoequals <Player> part = vocals
			<divide_by_10> = true
			always_show_ns_meter = 1
		else
			<divide_by_10> = FALSE
		endif
	else
		getfirstplayer
		getplayerinfo <Player> Band
		formatText checksumName = value_score 'band%b_score' b = <Band>
		formatText checksumName = value_streak 'band%b_streak' b = <Band>
		value_star = band_projected_song_stars
		value_miss = band_has_missed_note
		show_band_mult = 1
	endif
	attachhudwidget {
		Input = {
			object = <object>
			value = <value_score>
		}
		output = {
			Type = seinttostring
			desc_id = <id>
			property = score_text
			usecommas = true
		}
	}
	attachhudwidget {
		Input = {
			object = <object>
			value = <value_streak>
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
			object = <object>
			value = <value_star>
		}
		output = {
			Type = sestarmeter
			desc_id = <id>
			full_scale = 1.0
			full_x_dim = <x_dim>
		}
	}
	if (($is_ampzilla_battle) = 1)
		attachhudwidget {
			Input = {
				object = <object>
				value = <value_star>
			}
			output = {
				Type = screenelementrunscript
				desc_id = <id>
				run_script = hud_final_battle_star_up
				full_scale = 1.0
			}
		}
	endif
	if (<Type> != career)
		attachhudwidget {
			Input = {
				object = <object>
				value = <value_miss>
			}
			outputs =
			[
				{
					Type = screenelementrgbaswitch
					desc_id = <id>
					property = star_filler_rgba
					color1 = [238 , 204 , 120 , 255]
					color2 = [210 , 210 , 210 , 255]
				}
				{
					Type = screenelementconditional
					desc_id = <id>
					property = band_hud_gold_star_glow_alpha
				}
			]
		}
	else
		<id> :se_setprops band_hud_gold_star_glow_alpha = 0
	endif
	if GotParam \{show_band_mult}
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

script hud_attach_widget_sidebar_notestreak_meter 
	RequireParams \{[
			Player
			desc_id
		]
		all}
	getplayerinfo <Player> hud_id
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = multiplier
		}
		outputs = [
			{
				Type = seinttostring
				desc_id = <desc_id>
				property = hud_meter_combo_multiplier_text
				Player = <Player>
			}
			{
				Type = seinttostring
				desc_id = <desc_id>
				property = hud_meter_combo_multiplier_text2
				Player = <Player>
			}
			{
				Type = screenelementconditionalint
				desc_id = <desc_id>
				property = combo_multiplier_container_alpha
				value_range = [2 100]
			}
		]
	}
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = note_streak
		}
		output = {
			Type = secombolights
			desc_id = <desc_id>
			Player = <Player>
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
		Input = {
			object = <hud_id>
			value = starpower_active
		}
		output = {
			id = <note_streak_widget_id>
		}
	}
endscript

script hud_attach_widget_sidebar_rockmeter 
	RequireParams \{[
			Player
			desc_id
		]
		all}
	getplayerinfo <Player> hud_id
	pos_range = [(12.0, -6.0) (14.333, -88.32) (16.666, -152.314) (19.0, -202.0)]
	pos_value_range = [0.0 0.6666 1.3333 2.0]
	pos_type = individualhealthneedlepos
	needle_pos_range = [(12.0, -2.0) (19.0, -203.0)]
	needle_scale_range = [(1.1, 1.2) (0.8, 0.9)]
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = health
		}
		outputs = [
			{
				desc_id = <desc_id>
				Type = rgbaswap
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
				Type = rgbaswap
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
				Type = rgbaswap
				value_range = [0.0 0.666667 1.3333]
				property = needle_black_rgba
				colors = [
					[255 0 0 255]
					[255 255 0 255]
					[0 255 0 255]
				]
			}
			{
				Type = individualhealthneedlepos
				value_range = <pos_value_range>
				Range = <pos_range>
				desc_id = <desc_id>
				property = needle_container_pos
			}
			{
				Type = descpropertypair
				value_range = [0.0 2.0]
				Range = <needle_scale_range>
				desc_id = <desc_id>
				property = needle_container_scale
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = flare_alpha
				value_range = [1.99 2.0]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = led_red_alpha
				value_range = [0.0 0.66]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = led_yellow_alpha
				value_range = [0.66 1.3299999]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = led_green_alpha
				value_range = [1.3299999 2.0]
			}
		]
	}
endscript

script hud_attach_widget_sidebar_starpowermeter 
	RequireParams \{[
			Player
			desc_id
		]
		all}
	needle_pos_range = [(12.0, -2.0) (19.0, -205.0)]
	needle_scale_range = [(1.1, 0.75) (0.7, 1.0)]
	needle_rot_range = [-5.0 0.0]
	tesla_needle_pos_range = [(12.0, -2.0) (15.5, -107.0)]
	getplayerinfo <Player> hud_id
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = starpower_amount
		}
		outputs = [
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = <needle_pos_range>
				desc_id = <desc_id>
				property = needle_container_pos
			}
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = <needle_scale_range>
				desc_id = <desc_id>
				property = needle_container_scale
			}
			{
				Type = descpropertyfloat
				value_range = [0.0 100.0]
				Range = <needle_rot_range>
				desc_id = <desc_id>
				property = needle_container_rot_angle
			}
			{
				Type = sestarpowermeterfx
				desc_id = <desc_id>
				property = needle_white_alpha
				value_range = [50.0 100.0]
			}
			{
				Type = sestarpowermeterfx
				desc_id = <desc_id>
				property = needle_color_alpha
				value_range = [50.0 100.0]
			}
			{
				Type = descpropertypair
				value_range = [0.0 49.0]
				Range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = fill_pre_sp_scale
			}
			{
				Type = descpropertypair
				value_range = [50.0 100.0]
				Range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = fill_post_sp_scale
			}
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = fill_post_spfx_scale
			}
			{
				Type = sestarpowermeterfx
				desc_id = <desc_id>
				property = fill_post_spfx_alpha
				value_range = [50.0 100.0]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <desc_id>
				property = fill_fudge_hider_alpha
				value_range = [1.0 100.0]
			}
			{
				Type = descpropertypair
				value_range = [0.0 49.0]
				Range = <tesla_needle_pos_range>
				desc_id = <desc_id>
				property = tesla_needle_pos
			}
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = <needle_scale_range>
				desc_id = <desc_id>
				property = tesla_needle_scale
			}
			{
				Type = descpropertyfloat
				value_range = [0.0 100.0]
				Range = <needle_rot_range>
				desc_id = <desc_id>
				property = tesla_needle_rot_angle
			}
			{
				Type = sestarpowermeterfx
				desc_id = <desc_id>
				property = tesla_needle_alpha
				value_range = [1.0 100.0]
			}
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = [(0.0, 1.0) (1.0, 1.5)]
				desc_id = <desc_id>
				property = rp_tesla_fx_scale
			}
		]
	}
endscript

script hud_attach_widget_vocal_competitive_meter 
	RequireParams \{[
			Player
			meter
		]
		all}
	if NOT <meter> :desc_resolvealias Name = alias_hud_sidebar_rankmeter param = rank_meter
		ScriptAssert 'player %p rank meter not found' p = <Player>
	endif
	<rank_meter> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {Player = <Player> attached_to_highway = 1 element_id = <rank_meter>}
	}
	return
endscript

script hud_attach_widget_vocal_sp_combo_meter 
	RequireParams \{[
			Player
			meter
		]
		all}
	if NOT <meter> :desc_resolvealias Name = alias_vocals_health_meter param = health_meter
		ScriptAssert 'player %p vocal health meter not found' p = <Player>
	endif
	getplayerinfo <Player> hud_id
	needle_range = [(-55.0, 5.118) (28.0, 5.118)]
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = health
		}
		outputs = [
			{
				Type = descpropertypair
				value_range = [0.0 2.0]
				Range = <needle_range>
				desc_id = <health_meter>
				property = vocal_health_meter_needle_pos
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <health_meter>
				property = vocal_health_meter_red_alpha
				value_range = [0.0 0.6666]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <health_meter>
				property = vocal_health_meter_amber_alpha
				value_range = [0.6666 1.3333]
			}
			{
				Type = screenelementconditionalfloat
				desc_id = <health_meter>
				property = vocal_health_meter_green_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
	if NOT <meter> :desc_resolvealias Name = alias_vocals_multiplier param = mult_meter
		ScriptAssert 'player %p vocal multiplier not found' p = <Player>
	endif
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = multiplier
		}
		outputs = [
			{
				Type = seinttostring
				desc_id = <mult_meter>
				property = multiplier_number_text
				Player = <Player>
			}
			{
				Type = seinttostring
				desc_id = <mult_meter>
				property = multiplier_number_text2
				Player = <Player>
			}
			{
				Type = secombolights
				desc_id = <mult_meter>
				Player = <Player>
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
	if NOT <meter> :desc_resolvealias Name = alias_vocals_star_power_meter param = sp_meter
		ScriptAssert 'player %p sp multiplier not found' p = <Player>
	endif
	needle_pos_range = [(-59.0, 0.0) (58.0, 0.0)]
	sp_range = [(-114.0, 0.0) (0.0, 0.0)]
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = starpower_amount
		}
		outputs = [
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = <sp_range>
				desc_id = <sp_meter>
				property = vocal_starpower_fill_pos
			}
			{
				Type = sestarpowermeterfx
				desc_id = <sp_meter>
				property = fill_post_spfx_alpha
				value_range = [50.0 100.0]
			}
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <sp_meter>
				property = fill_post_spfx_scale
			}
			{
				Type = descpropertypair
				value_range = [1.0 100.0]
				Range = [(0.0, 1.0) (1.0, 1.0)]
				desc_id = <sp_meter>
				property = rp_telsa_fx_cont_scale
			}
			{
				Type = descpropertypair
				value_range = [0.0 100.0]
				Range = <needle_pos_range>
				desc_id = <sp_meter>
				property = vspm_needle_container_pos
			}
		]
	}
	if NOT <meter> :desc_resolvealias Name = alias_vocals_phrase_progress_meter param = pp_meter
		ScriptAssert 'player %p pp meter not found' p = <Player>
	endif
	pp_range = [(-104.0, 0.0) (0.0, 0.0)]
	attachhudwidget {
		Input = {
			object = <hud_id>
			value = phrase_progress
		}
		outputs = [
			{
				Type = descpropertypair
				value_range = [0.0 1.0]
				Range = <pp_range>
				desc_id = <pp_meter>
				property = vocal_phrase_progress_fill_pos
			}
			{
				Type = rgbaswap
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

script hud_set_band_meter_instrument_streak_color 
	if GotParam \{Player}
		if ScreenElementExists \{id = hud_root}
			if hud_root :desc_resolvealias \{Name = alias_band_meter
					param = band_meter}
				ResolveScreenElementID id = <band_meter> param = desc_element
			endif
			if GotParam \{On}
				highway_streak_glow Player = <Player> Enabled = 1
			else
				highway_streak_glow Player = <Player> Enabled = 0
			endif
		endif
	endif
endscript

script hud_band_streak_end 
	getfirstplayer
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		return
	endif
	formatText TextName = notification qs(0xf3d445f5) d = <score>
	hud_create_message {text = <notification> Band Priority = <Priority> style_script = hud_message_band_streak_style style_script_params = {players = []}}
endscript

script hud_attach_scores_stack_widget 
	RequireParams \{[
			parent_id
		]
		all}
	<parent_id> :desc_resolvealias Name = alias_scores_stack param = scores_stack_menu
	getbandsstatus
	if GotParam \{bands}
		GetArraySize <bands>
		bands_size = <array_Size>
		if (<bands_size> > 0)
			printstruct <...>
			index = 0
			begin
			if (<bands> [<index>].in_game = 1)
				formatText checksumName = value 'band%d_score' d = (<index> + 1)
				formatText checksumName = property 'band%d_score_text' d = (<index> + 1)
				formatText checksumName = Color 'band%d_score_rgba' d = (<index> + 1)
				formatText checksumName = color_value 'band_color%d' d = (<index> + 1)
				attachhudwidget {
					Input = {
						value = <value>
					}
					output = {
						Type = seinttostring
						desc_id = <parent_id>
						property = <property>
					}
				}
				AddParam structure_name = prop_struct Name = <Color> value = ($<color_value>)
				<parent_id> :se_setprops <prop_struct>
			elseif GotParam \{children}
				GetArraySize <children>
				if (<array_Size> > <index>)
					DestroyScreenElement id = (<children> [<index>])
				endif
			elseif GotParam \{scores_stack_menu}
				GetScreenElementChildren id = <scores_stack_menu>
				GetArraySize <children>
				if (<array_Size> > <index>)
					DestroyScreenElement id = (<children> [<index>])
				endif
			endif
			<index> = (<index> + 1)
			repeat <bands_size>
		endif
	endif
endscript

script hud_attach_widget_band_versus_meter 
	getfirstplayer
	if playerinfoequals <Player> Band = 1
		<parent_id> :se_getprops
		<parent_id> :se_setprops {
			right_side_rgba = <left_side_rgba>
			left_side_rgba = <right_side_rgba>
			meter_off_horizontal_flip = true
		}
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
		<team1_value> = band1_meter_value
		<team2_value> = band2_meter_value
		attachhudwidget {
			Input = {
				value = <team1_value>
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			Input = {
				value = <team2_value>
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
				Type = seinttostring
				desc_id = <parent_id>
				property = multiplier_1_number_text
			}
		}
		attachhudwidget {
			Input = {
				value = band2_multiplier
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = multiplier_2_number_text
			}
		}
	else
		attachhudwidget {
			Input = {
				value = faceoff_ratio
			}
			outputs = [
				{
					Type = descpropertyfloat
					desc_id = <parent_id>
					property = hud_band_battle_meter_needle_rot_angle
					value_range = [-1.0 1.0]
					Range = [-51.5 51.5]
					single
				}
				{
					Type = descpropertyfloat
					desc_id = <parent_id>
					property = hud_band_battle_meter_amber_on_alpha
					value_range = [-0.1 0.0]
					Range = [1.0 0.0]
					single
				}
				{
					Type = descpropertyfloat
					desc_id = <parent_id>
					property = hud_band_battle_meter_violet_on_alpha
					value_range = [0.0 0.1]
					Range = [0.0 1.0]
					single
				}
			]
		}
		attachhudwidget {
			Input = {
				value = band1_meter_value
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		attachhudwidget {
			Input = {
				value = band2_meter_value
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		attachhudwidget {
			Input = {
				value = band1_multiplier
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = multiplier_2_number_text
			}
		}
		attachhudwidget {
			Input = {
				value = band2_multiplier
			}
			output = {
				Type = seinttostring
				desc_id = <parent_id>
				property = multiplier_1_number_text
			}
		}
	endif
endscript

script hud_setup_band_mult_animation 
	band_meter = <star_meter_id>
	if NOT <band_meter> :desc_resolvealias Name = alias_band_multiplier param = mult_id
		return
	endif
	if ScreenElementExists id = <mult_id>
		GetScreenElementProps id = <mult_id>
		hide_pos = (<Pos> + (118.0, 32.0))
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

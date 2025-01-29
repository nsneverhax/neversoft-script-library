
script HUD_attach_star_meter 
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
			param = id}
		return
	endif
	if isSinglePlayerGame
		GetFirstPlayer
		FormatText checksumname = Object 'player%p_hud' p = <player>
		value_score = score
		value_streak = note_streak
		value_star = projected_song_stars
		value_miss = has_missed_note
		if PlayerInfoEquals <player> part = vocals
			<divide_by_10> = true
		else
			<divide_by_10> = false
		endif
	else
		GetFirstPlayer
		GetPlayerInfo <player> Band
		FormatText checksumname = value_score 'band%b_score' b = <Band>
		FormatText checksumname = value_streak 'band%b_streak' b = <Band>
		value_star = band_projected_song_stars
		value_miss = band_has_missed_note
		show_band_mult = 1
	endif
	AttachHudWidget {
		Input = {
			Object = <Object>
			value = <value_score>
		}
		output = {
			type = SEIntToString
			desc_id = <id>
			property = score_text
			UseCommas = true
		}
	}
	AttachHudWidget {
		Input = {
			Object = <Object>
			value = <value_streak>
		}
		output = {
			type = SEIntToString
			desc_id = <id>
			property = streak_number_text
			divide_by_10 = <divide_by_10>
		}
	}
	AttachHudWidget {
		Input = {
			Object = <Object>
			value = <value_star>
		}
		output = {
			type = SEStarMeter
			desc_id = <id>
			full_scale = 1.0
		}
	}
	AttachHudWidget {
		Input = {
			Object = <Object>
			value = <value_miss>
		}
		outputs =
		[
			{
				type = ScreenElementRGBASwitch
				desc_id = <id>
				property = star_filler_rgba
				color1 = [238 , 204 , 120 , 255]
				color2 = [210 , 210 , 210 , 255]
			}
			{
				type = ScreenElementConditional
				desc_id = <id>
				property = band_HUD_gold_star_glow_alpha
			}
		]
	}
	if GotParam \{show_band_mult}
		AttachHudWidget {
			Input = {
				value = band1_multiplier
			}
			output = {
				type = SEBandMultiplier
				desc_id = <id>
				textures = [
					band_HUD_multiplier_one
					band_HUD_multiplier_two
					band_HUD_multiplier_three
					band_HUD_multiplier_four
					band_HUD_multiplier_five
					band_HUD_multiplier_six
					band_HUD_multiplier_seven
					band_HUD_multiplier_eight
					band_HUD_multiplier_nine
					band_HUD_multiplier_ten
					band_HUD_multiplier_eleven
				]
			}
		}
	endif
	HUD_setup_streak_meter_animation
	HUD_setup_band_mult_animation
endscript

script HUD_attach_widget_score_meter 
	if NOT hud_root :Desc_ResolveAlias \{name = alias_hud_meter_score
			param = id}
		return
	endif
	AttachHudWidget {
		Input = {
			value = band1_score
		}
		output = {
			type = SEIntToString
			desc_id = <id>
			property = score_top_text
		}
	}
	AttachHudWidget {
		Input = {
			value = band1_score
		}
		output = {
			type = SEIntToString
			desc_id = <id>
			property = score_bottom_text
		}
	}
endscript

script HUD_attach_widget_band_rock_meter 
	if NOT hud_root :Desc_ResolveAlias \{name = alias_hud_meter_band_rock
			param = id}
		return
	endif
	health_value_range = [0.0 2.0]
	needle_range = [(0.0, 0.0) (200.0, 0.0)]
	AttachHudWidget {
		Input = {
			value = band_health
		}
		outputs = [
			{
				type = DescPropertyPair
				desc_id = <id>
				property = meter_band_rock_needle_pos
				value_range = [0.0 2.0]
				Range = <needle_range>
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <id>
				property = meter_band_rock_red_alpha
				value_range = [0.0 0.6666]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <id>
				property = meter_band_rock_amber_alpha
				value_range = [0.6666 1.3333]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <id>
				property = meter_band_rock_green_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
endscript

script HUD_attach_widget_band_multiplier \{Band = 1}
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_band_mult
			param = id}
		return
	endif
	FormatText checksumname = value 'band%p_multiplier' p = <Band>
	AttachHudWidget {
		Input = {
			value = <value>
		}
		output = {
			type = SEIntToString
			desc_id = <id>
			property = mult_text_text
		}
	}
endscript

script HUD_attach_widget_sidebar_notestreak_meter 
	RequireParams \{[
			player
			desc_id
		]
		all}
	GetPlayerInfo <player> hud_id
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = Multiplier
		}
		outputs = [
			{
				type = SEIntToString
				desc_id = <desc_id>
				property = HUD_meter_combo_multiplier_text
				player = <player>
			}
			{
				type = SEIntToString
				desc_id = <desc_id>
				property = HUD_meter_combo_multiplier_text2
				player = <player>
			}
			{
				type = ScreenElementConditionalInt
				desc_id = <desc_id>
				property = combo_multiplier_container_alpha
				value_range = [2 100]
			}
		]
	}
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = note_streak
		}
		output = {
			type = SEComboLights
			desc_id = <desc_id>
			player = <player>
			bulb_props = [
				LED_01_rgba
				LED_02_rgba
				LED_03_rgba
				LED_04_rgba
				LED_05_rgba
				LED_06_rgba
				LED_07_rgba
				LED_08_rgba
				LED_09_rgba
				LED_10_rgba
			]
			bg_prop = HUD_meter_combo_multiplier_BG_rgba
			text_prop = HUD_meter_combo_multiplier_rgba
			led_colors = [
				[255 180 180 255]
				[243 169 64 255]
				[128 236 68 255]
				[175 101 238 255]
				[185 230 160 255]
			]
			bg_colors = [
				[50 50 50 255]
				[153 105 30 255]
				[85 128 58 255]
				[100 70 140 255]
				[65 120 130 255]
			]
		}
	}
	<note_streak_widget_id> = <observer_id>
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = starpower_active
		}
		output = {
			id = <note_streak_widget_id>
		}
	}
endscript

script HUD_attach_widget_sidebar_rockmeter 
	RequireParams \{[
			player
			desc_id
		]
		all}
	GetPlayerInfo <player> hud_id
	pos_range = [(12.0, -6.0) (14.333, -88.32) (16.666, -152.314) (19.0, -202.0)]
	pos_value_range = [0.0 0.6666 1.3333 2.0]
	pos_type = IndividualHealthNeedlePos
	needle_pos_range = [(12.0, -2.0) (19.0, -203.0)]
	needle_scale_range = [(1.1, 1.2) (0.8, 0.9)]
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = health
		}
		outputs = [
			{
				desc_id = <desc_id>
				type = RGBASwap
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
				type = RGBASwap
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
				type = RGBASwap
				value_range = [0.0 0.666667 1.3333]
				property = needle_Black_rgba
				colors = [
					[255 0 0 255]
					[255 255 0 255]
					[0 255 0 255]
				]
			}
			{
				type = IndividualHealthNeedlePos
				value_range = <pos_value_range>
				Range = <pos_range>
				desc_id = <desc_id>
				property = needle_container_pos
			}
			{
				type = DescPropertyPair
				value_range = [0.0 2.0]
				Range = <needle_scale_range>
				desc_id = <desc_id>
				property = needle_container_scale
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = Flare_alpha
				value_range = [1.99 2.0]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = led_red_alpha
				value_range = [0.0 0.66]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = led_yellow_alpha
				value_range = [0.66 1.3299999]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = led_green_alpha
				value_range = [1.3299999 2.0]
			}
		]
	}
endscript

script HUD_attach_widget_sidebar_starpowermeter 
	RequireParams \{[
			player
			desc_id
		]
		all}
	needle_pos_range = [(17.0, -6.0) (19.0, -202.0)]
	GetPlayerInfo <player> hud_id
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = starpower_amount
		}
		outputs = [
			{
				type = DescPropertyPair
				value_range = [0.0 100.0]
				Range = <needle_pos_range>
				desc_id = <desc_id>
				property = needle_container_pos
			}
			{
				type = DescPropertyPair
				value_range = [0.0 49.0]
				Range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = Fill_Pre_SP_scale
			}
			{
				type = DescPropertyPair
				value_range = [50.0 100.0]
				Range = [(1.0, 0.0) (1.0, 1.0)]
				desc_id = <desc_id>
				property = Fill_Post_SP_scale
			}
			{
				type = DescPropertyPair
				value_range = [50.0 100.0]
				Range = [(1.0, 0.5) (1.0, 1.0)]
				desc_id = <desc_id>
				property = Fill_Post_SPFX_scale
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = Fill_Post_SPFX_alpha
				value_range = [50.0 100.0]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = Fill_Fudge_hider_alpha
				value_range = [1.0 100.0]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = needle_white_alpha
				value_range = [50.0 100.0]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <desc_id>
				property = needle_color_alpha
				value_range = [50.0 100.0]
			}
		]
	}
endscript

script HUD_attach_widget_sidebar_sp_meter 
	RequireParams \{[
			desc_id
			player
		]
		all}
	sp_value_range = [0.0 100.0]
	scale_range = [(0.0, 1.0) (1.0, 1.0)]
	GetPlayerInfo <player> hud_id
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = starpower_amount
		}
		output = {
			type = DescPropertyPair
			value_range = <sp_value_range>
			Range = <scale_range>
			desc_id = <desc_id>
			property = fill_scale
		}
	}
endscript

script HUD_attach_widget_vocal_competitive_meter 
	RequireParams \{[
			player
			meter
		]
		all}
	if NOT <meter> :Desc_ResolveAlias name = alias_HUD_Sidebar_RankMeter param = rank_meter
		ScriptAssert 'player %p rank meter not found' p = <player>
	endif
	<rank_meter> :Obj_SpawnScript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	GMan_CompetitiveMeterFunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 1 element_id = <rank_meter>}
	}
	return
endscript

script HUD_attach_widget_vocal_sp_combo_meter 
	RequireParams \{[
			player
			meter
		]
		all}
	if NOT <meter> :Desc_ResolveAlias name = alias_vocals_health_meter param = Health_Meter
		ScriptAssert 'player %p vocal health meter not found' p = <player>
	endif
	GetPlayerInfo <player> hud_id
	needle_range = [(-55.0, 5.118) (28.0, 5.118)]
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = health
		}
		outputs = [
			{
				type = DescPropertyPair
				value_range = [0.0 2.0]
				Range = <needle_range>
				desc_id = <Health_Meter>
				property = vocal_health_meter_needle_pos
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <Health_Meter>
				property = vocal_health_meter_red_alpha
				value_range = [0.0 0.6666]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <Health_Meter>
				property = vocal_health_meter_amber_alpha
				value_range = [0.6666 1.3333]
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <Health_Meter>
				property = vocal_health_meter_green_alpha
				value_range = [1.3333 2.0]
			}
		]
	}
	if NOT <meter> :Desc_ResolveAlias name = alias_vocals_multiplier param = mult_meter
		ScriptAssert 'player %p vocal multiplier not found' p = <player>
	endif
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = Multiplier
		}
		outputs = [
			{
				type = SEIntToString
				desc_id = <mult_meter>
				property = Multiplier_number_text
				player = <player>
			}
			{
				type = SEIntToString
				desc_id = <mult_meter>
				property = multiplier_number_text2
				player = <player>
			}
			{
				type = SEComboLights
				desc_id = <mult_meter>
				player = <player>
				no_bulbs = true
				bg_prop = vocal_multiplier_bg_rgba
				text_prop = multiplier_number_rgba
				text_prop_2 = Multiplier_time_rgba
				led_colors = [
					[255 180 180 255]
					[243 169 64 255]
					[128 236 68 255]
					[175 101 238 255]
					[185 230 160 255]
				]
				bg_colors = [
					[50 50 50 255]
					[153 105 30 255]
					[85 128 58 255]
					[100 70 140 255]
					[65 120 130 255]
				]
			}
		]
	}
	if NOT <meter> :Desc_ResolveAlias name = alias_vocals_star_power_meter param = sp_meter
		ScriptAssert 'player %p sp multiplier not found' p = <player>
	endif
	needle_pos_range = [(-56.0, 3.0) (42.0, 3.0)]
	sp_range = [(-104.0, 0.0) (0.0, 0.0)]
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = starpower_amount
		}
		outputs = [
			{
				type = DescPropertyPair
				value_range = [0.0 100.0]
				Range = <sp_range>
				desc_id = <sp_meter>
				property = vocal_starpower_fill_pos
			}
			{
				type = ScreenElementConditionalFloat
				desc_id = <sp_meter>
				property = Fill_Post_SPFX_alpha
				value_range = [50.0 100.0]
			}
			{
				type = DescPropertyPair
				value_range = [50.0 100.0]
				Range = [(1.0, 0.5) (1.0, 1.0)]
				desc_id = <sp_meter>
				property = Fill_Post_SPFX_scale
			}
			{
				type = DescPropertyPair
				value_range = [0.0 100.0]
				Range = <needle_pos_range>
				desc_id = <sp_meter>
				property = VSPM_Needle_Container_pos
			}
		]
	}
	if NOT <meter> :Desc_ResolveAlias name = alias_vocals_phrase_progress_meter param = pp_meter
		ScriptAssert 'player %p pp meter not found' p = <player>
	endif
	pp_range = [(-104.0, 0.0) (0.0, 0.0)]
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = Phrase_Progress
		}
		outputs = [
			{
				type = DescPropertyPair
				value_range = [0.0 1.0]
				Range = <pp_range>
				desc_id = <pp_meter>
				property = vocal_phrase_progress_fill_pos
			}
			{
				type = RGBASwap
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

script HUD_set_band_meter_instrument_icons 
	index = 1
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part
		switch <part>
			case guitar
			icon = band_HUD_guitar
			glow_icon = band_HUD_guitar_glow
			case bass
			icon = band_HUD_bass
			glow_icon = band_HUD_bass_glow
			case Drum
			icon = band_HUD_drums
			glow_icon = band_HUD_drums_glow
			case vocals
			icon = band_HUD_microphone
			glow_icon = band_HUD_mic_glow
		endswitch
		if (<index> <= <num_players>)
			alpha = 1.0
		else
			alpha = 0.0
		endif
		glow_rgba = [255 255 255 0]
		switch <index>
			case 1
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p1_texture = <icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p1_alpha = <alpha>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p1_texture = <glow_icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p1_alpha = 0
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p1_rgba = <glow_rgba>
			case 2
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p2_texture = <icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p2_alpha = <alpha>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p2_texture = <glow_icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p2_alpha = 0
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p2_rgba = <glow_rgba>
			case 3
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p3_texture = <icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p3_alpha = <alpha>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p3_texture = <glow_icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p3_alpha = 0
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p3_rgba = <glow_rgba>
			case 4
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p4_texture = <icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_p4_alpha = <alpha>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p4_texture = <glow_icon>
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p4_alpha = 0
			SetScreenElementProps id = <desc_element> band_HUD_instrument_glow_p4_rgba = <glow_rgba>
		endswitch
		index = (<index> + 1)
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script HUD_set_band_meter_instrument_streak_color 
	if GotParam \{player}
		if ScreenElementExists \{id = hud_root}
			if hud_root :Desc_ResolveAlias \{name = alias_band_meter
					param = band_meter}
				ResolveScreenElementID id = <band_meter> param = desc_element
			endif
			if GotParam \{on}
				highway_streak_glow player = <player> enabled = 1
			else
				highway_streak_glow player = <player> enabled = 0
			endif
		endif
	endif
endscript

script HUD_band_streak_notify 
	GetFirstPlayer
	GetPlayerInfo <player> bot_play
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
		FormatText TextName = notification qs(0x66bd2b10) d = <streak>
	else
		FormatText TextName = notification qs(0x83b2be80) d = <new_player_in_streak>
		Priority = -1
	endif
	hud_create_message {text = <notification> Band Priority = <Priority> style_script = hud_message_band_streak_style style_script_params = {players = <players>}}
endscript

script HUD_band_streak_end 
	GetFirstPlayer
	GetPlayerInfo <player> bot_play
	if (<bot_play> = 1)
		return
	endif
	FormatText TextName = notification qs(0xf3d445f5) d = <score>
	hud_create_message {text = <notification> Band Priority = <Priority> style_script = hud_message_band_streak_style style_script_params = {players = []}}
endscript

script HUD_attach_scores_stack_widget 
	RequireParams \{[
			parent_id
		]
		all}
	<parent_id> :Desc_ResolveAlias name = alias_scores_stack param = scores_stack_menu
	GetBandsStatus
	if GotParam \{bands}
		GetArraySize <bands>
		bands_size = <array_size>
		if (<bands_size> > 0)
			printstruct <...>
			index = 0
			begin
			if (<bands> [<index>].in_game = 1)
				FormatText checksumname = value 'band%d_score' d = (<index> + 1)
				FormatText checksumname = property 'band%d_score_text' d = (<index> + 1)
				FormatText checksumname = Color 'band%d_score_rgba' d = (<index> + 1)
				FormatText checksumname = color_value 'band_color%d' d = (<index> + 1)
				AttachHudWidget {
					Input = {
						value = <value>
					}
					output = {
						type = SEIntToString
						desc_id = <parent_id>
						property = <property>
					}
				}
				AddParam structure_name = prop_struct name = <Color> value = ($<color_value>)
				<parent_id> :SE_SetProps <prop_struct>
			elseif GotParam \{children}
				GetArraySize <children>
				if (<array_size> > <index>)
					DestroyScreenElement id = (<children> [<index>])
				endif
			elseif GotParam \{scores_stack_menu}
				GetScreenElementChildren id = <scores_stack_menu>
				GetArraySize <children>
				if (<array_size> > <index>)
					DestroyScreenElement id = (<children> [<index>])
				endif
			endif
			<index> = (<index> + 1)
			repeat <bands_size>
		endif
	endif
endscript

script HUD_attach_widget_band_versus_meter 
	GetFirstPlayer
	if PlayerInfoEquals <player> Band = 1
		<parent_id> :SE_GetProps
		<parent_id> :SE_SetProps {
			right_side_rgba = <left_side_rgba>
			left_side_rgba = <right_side_rgba>
			meter_off_horizontal_flip = true
		}
		AttachHudWidget {
			Input = {
				value = faceoff_ratio
			}
			outputs = [
				{
					type = DescPropertyFloat
					desc_id = <parent_id>
					property = HUD_band_battle_meter_needle_rot_angle
					value_range = [1.0 -1.0]
					Range = [-80.0 80.0]
					single
				}
				{
					type = DescPropertyFloat
					desc_id = <parent_id>
					property = HUD_band_battle_meter_amber_ON_alpha
					value_range = [0.0 0.1]
					Range = [0.0 1.0]
					single
				}
				{
					type = DescPropertyFloat
					desc_id = <parent_id>
					property = HUD_band_battle_meter_violet_ON_alpha
					value_range = [-0.1 0.0]
					Range = [1.0 0.0]
					single
				}
			]
		}
		AttachHudWidget {
			Input = {
				value = band1_meter_value
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		AttachHudWidget {
			Input = {
				value = band2_meter_value
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		AttachHudWidget {
			Input = {
				value = band1_multiplier
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = multiplier_1_number_text
			}
		}
		AttachHudWidget {
			Input = {
				value = band2_multiplier
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = multiplier_2_number_text
			}
		}
	else
		AttachHudWidget {
			Input = {
				value = faceoff_ratio
			}
			outputs = [
				{
					type = DescPropertyFloat
					desc_id = <parent_id>
					property = HUD_band_battle_meter_needle_rot_angle
					value_range = [-1.0 1.0]
					Range = [-51.5 51.5]
					single
				}
				{
					type = DescPropertyFloat
					desc_id = <parent_id>
					property = HUD_band_battle_meter_amber_ON_alpha
					value_range = [-0.1 0.0]
					Range = [1.0 0.0]
					single
				}
				{
					type = DescPropertyFloat
					desc_id = <parent_id>
					property = HUD_band_battle_meter_violet_ON_alpha
					value_range = [0.0 0.1]
					Range = [0.0 1.0]
					single
				}
			]
		}
		AttachHudWidget {
			Input = {
				value = band1_meter_value
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = score_2_text
			}
		}
		AttachHudWidget {
			Input = {
				value = band2_meter_value
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = score_1_text
			}
		}
		AttachHudWidget {
			Input = {
				value = band1_multiplier
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = multiplier_2_number_text
			}
		}
		AttachHudWidget {
			Input = {
				value = band2_multiplier
			}
			output = {
				type = SEIntToString
				desc_id = <parent_id>
				property = multiplier_1_number_text
			}
		}
	endif
endscript

script HUD_attach_widget_player_multiplier 
	RequireParams \{[
			parent_id
			player
		]
		all}
	GetPlayerInfo <player> hud_id
	ResolveScreenElementID id = <parent_id> param = id
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = note_streak
		}
		output = {
			type = SENoteStreakLights
			desc_id = <id>
			player = <player>
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
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = starpower_active
		}
		output = {id = <note_streak_widget_id>}
	}
	textures = [
		band_HUD_score_1a
		band_HUD_score_2a
		band_HUD_score_3a
		band_HUD_score_4a
	]
	if PlayerInfoEquals <player> part = vocals
		sp_textures = [
			vocal_HUD_score_2a
			vocal_HUD_score_4a
			vocal_HUD_score_6a
			vocal_HUD_score_8b
		]
	else
		sp_textures = [
			band_HUD_score_2b
			band_HUD_score_4b
			band_HUD_score_6b
			band_HUD_score_8b
		]
	endif
	<default_mul_tex> = band_HUD_score_1a
	GetPlayerInfo <player> part
	switch <part>
		case bass
		<default_mul_tex> = higway_icon_bass
		case Drum
		<default_mul_tex> = higway_icon_drum
		case guitar
		<default_mul_tex> = higway_icon_guitar
		case vocals
		<default_mul_tex> = higway_icon_mic
	endswitch
	SetArrayElement arrayName = textures index = 0 newValue = <default_mul_tex>
	AttachHudWidget {
		Input = {
			Object = <hud_id>
			value = Multiplier
		}
		output = {
			type = SEMultiplierNixie
			desc_id = <id>
			property = nixie_texture
			player = <player>
			textures = <textures>
			sp_textures = <sp_textures>
		}
	}
endscript

script HUD_attach_widget_player_star_power 
	RequireParams \{[
			parent_id
			player
		]
		all}
	GetPlayerInfo <player> hud_id
	ResolveScreenElementID id = <parent_id> param = id
	GetNumPlayersInGame
	if (<num_players> > 1)
		AttachHudWidget {
			Input = {
				Object = <hud_id>
				value = starpower_amount
			}
			output = {
				type = SETubes
				desc_id = <id>
				player = <player>
				value_range = [0.0 100.0]
				textures = [glow0_texture glow1_texture glow2_texture]
				scales = [glow0_scale glow1_scale glow2_scale]
			}
		}
	endif
endscript

script HUD_setup_streak_meter_animation 
	if hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
			param = band_meter}
		<band_meter> :Desc_ResolveAlias name = alias_streak param = streak_id
	endif
	if NOT GotParam \{streak_id}
		return
	endif
	if ScreenElementExists id = <streak_id>
		GetScreenElementProps id = <streak_id>
		hide_pos = (<Pos> - (0.0, 65.0))
		if ($current_num_players = 1)
			GetPlayerInfo <player> part
			if (<part> = vocals)
				Pos = (913.0, 438.0)
				hide_pos = (<Pos> + (0.0, 65.0))
			endif
		endif
		streak_pos = <Pos>
		GetFirstPlayer
		GetPlayerInfo <player> Band
		if GameMode_IsBandScoring
			if (<Band> = 1)
				streak_started_event = band1_streak_started
				streak_ended_event = band1_streak_ended
			elseif (<Band> = 2)
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
		RequireParams \{[
				streak_started_event
				streak_ended_event
			]
			all}
		event_handlers = [
			{<streak_started_event> SetScreenElementProps params = {id = <streak_id> time = 0.1 Pos = <streak_pos>}}
			{<streak_ended_event> SetScreenElementProps params = {id = <streak_id> time = 0.3 Pos = <hide_pos>}}
		]
		SetScreenElementProps {
			id = <streak_id>
			event_handlers = <event_handlers>
			replace_handlers
			Pos = <hide_pos>
		}
	endif
endscript

script HUD_setup_band_mult_animation 
	if hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
			param = band_meter}
		<band_meter> :Desc_ResolveAlias name = alias_band_multiplier param = mult_id
	endif
	if NOT GotParam \{mult_id}
		return
	endif
	if ScreenElementExists id = <mult_id>
		GetScreenElementProps id = <mult_id>
		hide_pos = (<Pos> + (118.0, 32.0))
		hide_scale = 0.5
		event_handlers = [
			{show_band_mult SetScreenElementProps params = {id = <mult_id> time = 0.3 Pos = <Pos> scale = <scale>}}
			{hide_band_mult SetScreenElementProps params = {id = <mult_id> time = 0.3 Pos = <hide_pos> scale = <hide_scale>}}
		]
		SetScreenElementProps {
			id = <mult_id>
			event_handlers = <event_handlers>
			replace_handlers
			Pos = <hide_pos>
			scale = <hide_scale>
		}
	endif
endscript

script HUD_start_blink_rock_meter 
	spawnscriptlater \{HUD_start_blink_rock_meter_spawn}
endscript

script HUD_start_blink_rock_meter_spawn 
	if ScreenElementExists \{id = hud_root}
		if hud_root :Desc_ResolveAlias \{name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :Desc_ResolveAlias name = alias_HUD_meter_red_bg param = id
					begin
					if NOT ScreenElementExists id = <id>
						break
					endif
					SetScreenElementProps {
						id = <id>
						rgba = [50 50 50 255]
						time = 0.1
					}
					wait \{0.1
						seconds}
					if NOT ScreenElementExists id = <id>
						break
					endif
					SetScreenElementProps {
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

script HUD_stop_blink_rock_meter 
	killspawnedscript \{name = HUD_start_blink_rock_meter_spawn}
	if ScreenElementExists \{id = hud_root}
		if hud_root :Desc_ResolveAlias \{name = alias_band_meter
				param = band_meter}
			if ScreenElementExists id = <band_meter>
				if <band_meter> :Desc_ResolveAlias name = alias_HUD_meter_red_bg param = id
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

script create_rock_meter 
	if ScreenElementExists \{id = id_rock_meter}
		DestroyScreenElement \{id = id_rock_meter}
	endif
	rockmeter_tags = {
		icon_min_rotation = -15.0
		icon_max_rotation = 15.0
		needle_min_rotation = -8.0
		needle_max_rotation = 8.0
		health_min_range = 0.0
		health_max_range = 2.0
		very_low_thresh = 0.33
		low_thresh = 0.66
		mid_thresh = 1.3299999
		very_high_thresh = 1.66
		dark_red = [130 40 40 255]
		dark_green = [25 80 40 255]
		dark_yellow = [90 65 0 255]
		star_color = [0 218 255 255]
		ntsc_white = [230 230 230 255]
		ntsc_black = [30 30 30 255]
		red = [255 0 0 255]
		green = [0 255 0 255]
		black = [0 0 0 255]
		cluster_distance_thresh = 0.7
		cluster_points = []
		player_clusters = []
		cluster_focus_index = []
		icon_clusters = []
	}
	CreateScreenElement {
		id = id_rock_meter
		parent = root_window
		type = DescInterface
		desc = 'HUD_rock_08'
		multiplier_text = qs(0x787beab2)
		meter_rock_amber_alpha = 1.0
		z_priority = 400
		tags = <rockmeter_tags>
	}
	position_rock_meter
	rock_meter_pre_anim_script
	spawnscriptnow \{rock_meter_anim_script}
	spawnscriptnow \{update_rock_meter}
endscript

script destroy_rock_meter 
	killspawnedscript \{name = update_rock_meter}
	killspawnedscript \{name = rock_meter_blink_red}
	killspawnedscript \{name = rock_meter_blink_red_led}
	killspawnedscript \{name = rock_meter_blink_green}
	killspawnedscript \{name = rock_meter_manage_blinking_icons}
	DestroyScreenElement \{id = id_rock_meter}
endscript

script position_rock_meter 
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	get_num_non_vocals_players_onscreen
	num_highways = <num_non_vocals_players>
	GetNumPlayersInGame
	if ((<num_players> - <num_highways>) > 1)
		if (<num_players> = 1)
			Pos = (0.0, -100.0)
		else
			Pos = (0.0, -100.0)
		endif
	else
		switch (<num_players>)
			case 1
			Pos = (0.0, -100.0)
			case 2
			Pos = (0.0, -50.0)
			case 3
			Pos = (0.0, -30.0)
			case 4
			Pos = (0.0, -30.0)
		endswitch
	endif
	id_rock_meter :SE_SetProps Pos = <Pos>
endscript

script update_rock_meter 
	begin
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	GetNumPlayersInGame
	if (<num_players> > 1)
		GetBandInfo \{1
			current_health}
		GetBandMultiplier \{Band = 1}
		curr_multiplier = <band_multiplier>
	else
		GetFirstPlayer
		GetPlayerInfo <player> current_health
		get_current_multiplier \{player = 1}
		curr_multiplier = <Multiplier>
	endif
	get_needle_rotation_given_group_health current_health = <current_health>
	set_rock_meter_needle_rotation rot = <rotation>
	set_rock_meter_lights current_health = <current_health>
	set_rock_meter_multiplier Multiplier = <curr_multiplier>
	wait \{1
		gameframe}
	repeat
endscript

script get_dongle_rotation_given_health 
	RequireParams \{[
			current_health
		]
		all}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :GetTags
	rot_range = (<icon_max_rotation> - <icon_min_rotation>)
	health_range = (<health_max_range> - <health_min_range>)
	health_percent = (<current_health> / <health_range>)
	rot = (<icon_max_rotation> - (<health_percent> * <rot_range>))
	rot = (-1 * <rot>)
	return rotation = <rot>
endscript

script get_needle_rotation_given_group_health 
	RequireParams \{[
			current_health
		]
		all}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :GetTags
	rot_range = (<needle_max_rotation> - <needle_min_rotation>)
	health_range = (<health_max_range> - <health_min_range>)
	health_percent = (<current_health> / <health_range>)
	rot = (<needle_max_rotation> - (<health_percent> * <rot_range>))
	return rotation = <rot>
endscript

script set_player_dongle_rotation 
	RequireParams \{[
			player
			rot
		]
		all}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	FormatText checksumname = player_dongle_id 'p%d_rock_meter_dongle' d = <player>
	<player_dongle_id> :SE_SetProps rot_angle = <rot>
endscript

script set_rock_meter_needle_rotation \{rot = 0}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :SE_SetProps needle_rot_angle = <rot>
endscript

script set_rock_meter_multiplier 
	RequireParams \{[
			Multiplier
		]
		all}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	FormatText TextName = mult_text qs(0x48c6d14c) d = <Multiplier>
	id_rock_meter :SE_SetProps multiplier_text = <mult_text>
	switch <Multiplier>
		case 1
		id_rock_meter :SE_SetProps \{multiplier_shadow_rgba = [
				200
				200
				255
				255
			]}
		case 2
		id_rock_meter :SE_SetProps \{multiplier_shadow_rgba = [
				50
				165
				80
				255
			]}
		case 3
		id_rock_meter :SE_SetProps \{multiplier_shadow_rgba = [
				240
				130
				50
				255
			]}
		case 4
		id_rock_meter :SE_SetProps \{multiplier_shadow_rgba = [
				165
				100
				165
				255
			]}
		default
		id_rock_meter :SE_SetProps \{multiplier_shadow_rgba = [
				0
				218
				255
				255
			]}
	endswitch
endscript

script set_rock_meter_lights 
	RequireParams \{[
			current_health
		]
		all}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :GetTags
	if (<current_health> < <very_low_thresh>)
		if NOT ScriptIsRunning \{rock_meter_blink_red_led}
			spawnscriptnow \{rock_meter_blink_red_led}
		endif
		if NOT ScriptIsRunning \{rock_meter_blink_red}
			spawnscriptnow \{rock_meter_blink_red}
		endif
		return
	elseif (<current_health> > <very_high_thresh>)
		rock_meter_set_shadow_color Color = <green>
	else
		rock_meter_set_shadow_color \{Color = [
				0
				0
				0
				200
			]}
	endif
	if (<current_health> > <mid_thresh>)
		id_rock_meter :SE_SetProps \{meter_rock_green_alpha = 0.75}
		id_rock_meter :SE_SetProps \{meter_rock_amber_alpha = 0.0}
		id_rock_meter :SE_SetProps \{meter_rock_red_alpha = 0.0}
	elseif (<current_health> > <low_thresh>)
		id_rock_meter :SE_SetProps \{meter_rock_green_alpha = 0.0}
		id_rock_meter :SE_SetProps \{meter_rock_amber_alpha = 0.75}
		id_rock_meter :SE_SetProps \{meter_rock_red_alpha = 0.0}
	else
		id_rock_meter :SE_SetProps \{meter_rock_green_alpha = 0.0}
		id_rock_meter :SE_SetProps \{meter_rock_amber_alpha = 0.0}
		id_rock_meter :SE_SetProps \{meter_rock_red_alpha = 0.75}
	endif
endscript

script rock_meter_blink_red_led 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :SE_SetProps \{meter_rock_green_alpha = 0.0}
	id_rock_meter :SE_SetProps \{meter_rock_amber_alpha = 0.0}
	id_rock_meter :SE_SetProps \{meter_rock_red_alpha = 1.0}
	id_rock_meter :SE_SetProps \{meter_rock_red_alpha = 0.0
		time = 0.3}
	wait \{0.3
		seconds}
	id_rock_meter :SE_SetProps \{meter_rock_red_alpha = 1.0
		time = 0.3}
	wait \{0.3
		seconds}
endscript

script rock_meter_blink_red 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :GetTags
	id_rock_meter :SE_SetProps meter_rock_shadow_rgba = <red> meter_rock_08_shadow_scale = 1.05 time = 0.3
	wait \{0.3
		seconds}
	id_rock_meter :SE_SetProps meter_rock_shadow_rgba = <black> meter_rock_08_shadow_scale = 1.05 time = 0.3
	wait \{0.3
		seconds}
endscript

script rock_meter_blink_green 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :GetTags
	id_rock_meter :SE_SetProps meter_rock_shadow_rgba = <green> time = 0.3
	wait \{0.3
		seconds}
	id_rock_meter :SE_SetProps meter_rock_shadow_rgba = <black> time = 0.3
	wait \{0.3
		seconds}
endscript

script rock_meter_set_shadow_color \{Color = [
			0
			0
			0
			200
		]}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :SE_SetProps meter_rock_shadow_rgba = <Color>
endscript

script rock_meter_manage_icon_colors 
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	very_low_thresh = 0.4
	array = []
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> current_health
		GetPlayerInfo <player> star_power_used
		if ((<current_health> > <very_low_thresh>) || (<star_power_used> = 1))
			player_icon_set_color player = <player>
		else
			AddArrayElement array = <array> element = <player>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	GetArraySize <array>
	if (<array_size> > 0)
		if NOT ScriptIsRunning \{rock_meter_manage_blinking_icons}
			spawnscriptnow rock_meter_manage_blinking_icons params = {array = <array>}
		endif
	endif
endscript

script player_icon_set_color \{player = 1}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :GetTags
	FormatText checksumname = player_dongle_id 'p%d_rock_meter_dongle' d = <player>
	GetPlayerInfo <player> current_health
	GetPlayerInfo <player> star_power_used
	if (<star_power_used> = 1)
		<player_dongle_id> :SE_SetProps icon_instrument_top_rgba = <star_color>
		<player_dongle_id> :SE_SetProps icon_instrument_bottom_rgba = <ntsc_black>
	else
		<player_dongle_id> :SE_SetProps icon_instrument_bottom_rgba = <ntsc_white>
		if (<current_health> < <very_low_thresh>)
		elseif (<current_health> < <low_thresh>)
			<player_dongle_id> :SE_SetProps icon_instrument_top_rgba = <dark_red>
		elseif (<current_health> < <mid_thresh>)
			<player_dongle_id> :SE_SetProps icon_instrument_top_rgba = <dark_yellow>
		else
			<player_dongle_id> :SE_SetProps icon_instrument_top_rgba = <dark_green>
		endif
	endif
endscript

script rock_meter_manage_blinking_icons 
	RequireParams \{[
			array
		]
		all}
	GetArraySize <array>
	id_rock_meter :GetTags
	i = 0
	begin
	FormatText checksumname = player_dongle_id 'p%d_rock_meter_dongle' d = (<array> [<i>])
	<player_dongle_id> :SE_SetProps icon_instrument_top_rgba = <red> time = 0.25
	i = (<i> + 1)
	repeat <array_size>
	wait \{0.3
		seconds}
	i = 0
	begin
	FormatText checksumname = player_dongle_id 'p%d_rock_meter_dongle' d = (<array> [<i>])
	<player_dongle_id> :SE_SetProps icon_instrument_top_rgba = <dark_red> time = 0.25
	i = (<i> + 1)
	repeat <array_size>
	wait \{0.3
		seconds}
endscript

script player_icon_blink \{player = 1
		Color = [
			255
			0
			0
			255
		]}
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	FormatText checksumname = player_dongle_id 'p%d_rock_meter_dongle' d = <player>
	<player_dongle_id> :SE_GetProps rgba
	<player_dongle_id> :SE_SetProps meter_rock_shadow_rgba = <Color> time = 0.3
	wait \{0.3
		seconds}
	<player_dongle_id> :SE_SetProps meter_rock_shadow_rgba = <rgba> time = 0.3
	wait \{0.3
		seconds}
endscript

script rock_meter_pre_anim_script 
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	printf \{channel = zdebug
		qs(0xc0b20f44)}
	id_rock_meter :SE_SetProps \{meter_rock08_master_alpha = 0.0}
	id_rock_meter :SE_SetProps \{meter_rock08_master_scale = 0.5}
endscript

script rock_meter_anim_script 
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	printf \{channel = zdebug
		qs(0xd1a003e7)}
	begin
	GetSongTime
	if (<songtime> > -1.0)
		break
	endif
	wait \{10
		gameframes}
	repeat
	if NOT ScreenElementExists \{id = id_rock_meter}
		return
	endif
	id_rock_meter :SE_SetProps \{meter_rock08_master_alpha = 1.0
		time = 1.0
		anim = ease_in}
	id_rock_meter :SE_SetProps \{meter_rock08_master_scale = 0.75
		time = 1.0
		anim = ease_in}
	wait \{1.0
		seconds}
endscript

script dump_rock_meter_data 
	GetLogicFrame
	Mod a = <LogicFrame> b = (100)
	if (<Mod> = 0)
		id_rock_meter :GetTags
		printstruct channel = zdebug <...>
	endif
endscript

freestyle_near_recording_limit_pct = 0.95
freestyle_warned_near_recording_limit = FALSE

script freestyle_game_init_recording_meter 
	if ScreenElementExists \{id = freestyle_root}
		if ((($freestyle_game_mode) = standard) || (($freestyle_game_mode) = tutorial))
			CreateScreenElement \{parent = freestyle_hud
				id = freestyle_recording_meter
				Type = descinterface
				desc = 'freestyle_recording_meter'}
			if (($freestyle_game_mode) = standard)
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recording_line}
				<resolved_id> :se_setprops {
					Scale = (0.0, 1.0)
				}
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recorded_line}
				<resolved_id> :se_setprops {
					Scale = (0.0, 1.0)
				}
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recorded_line_back}
				<resolved_id> :se_setprops {
					Scale = (0.0, 1.0)
				}
				freestyle_recording_meter :SetTags \{one_sixth_hit = FALSE}
				freestyle_recording_meter :SetTags \{two_sixth_hit = FALSE}
				freestyle_recording_meter :SetTags \{three_sixth_hit = FALSE}
				freestyle_recording_meter :SetTags \{four_sixth_hit = FALSE}
				freestyle_recording_meter :SetTags \{five_sixth_hit = FALSE}
				freestyle_recording_meter :SetTags \{six_sixth_hit = FALSE}
			elseif (($freestyle_game_mode) = tutorial)
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recording_line}
				<resolved_id> :se_setprops alpha = 0
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recorded_line}
				<resolved_id> :se_setprops alpha = 0
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recorded_line_back}
				<resolved_id> :se_setprops alpha = 0
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recording_dot}
				<resolved_id> :se_setprops alpha = 0
			endif
		endif
	else
		ScriptAssert \{qs(0xca1279fd)}
	endif
	Change \{freestyle_warned_near_recording_limit = FALSE}
endscript

script freestyle_game_deinit_recording_meter 
	DestroyScreenElement \{id = freestyle_recording_meter}
endscript

script freestyle_game_update_recording_meter 
	if (($freestyle_game_mode != watch) && ($freestyle_game_mode != tutorial))
		if ScreenElementExists \{id = freestyle_recording_meter}
			GetSongTimeMs
			percentage_time = (<time> / $freestyle_end_of_song_time)
			freestylegetprogresspercentage
			percentage_data = ((<percent>) / 100.0)
			if (($freestyle_warned_near_recording_limit = FALSE) && (<percentage_data> >= $freestyle_near_recording_limit_pct))
				freestyle_hud_create_warning_notification \{text = qs(0x6c543937)
					color1 = [
						255
						255
						0
						255
					]
					color2 = [
						150
						150
						0
						255
					]}
				Change \{freestyle_warned_near_recording_limit = true}
			endif
			if NOT (($freestyle_recording_mode) = overdub)
				if ($freestyle_endless_song = true)
					percentage = <percentage_data>
				else
					if (<percentage_time> > <percentage_data>)
						percentage = <percentage_time>
					else
						percentage = <percentage_data>
					endif
				endif
			else
				percentage = <percentage_time>
			endif
			if (($freestyle_recording_mode) = overdub)
				scale_vector = (((1.0, 0.0) * <percentage> * <percentage_data>) + (0.0, 1.0))
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recorded_line}
				<resolved_id> :se_setprops {
					Scale = <scale_vector>
				}
				freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recorded_line_back}
				<resolved_id> :se_setprops {
					Scale = <scale_vector>
				}
			endif
			scale_vector = (((1.0, 0.0) * <percentage>) + (0.0, 1.0))
			freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recording_line}
			<resolved_id> :se_setprops {
				Scale = <scale_vector>
			}
			x_position = (1280.0 * <percentage>)
			position_vector = (((1.0, 0.0) * <x_position>) + (0.0, -54.0))
			freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recording_dot}
			<resolved_id> :se_setprops {
				Pos = <position_vector>
			}
			portion_length = (1280.0 / 6)
			freestyle_recording_meter :GetTags \{one_sixth_hit}
			freestyle_recording_meter :GetTags \{two_sixth_hit}
			freestyle_recording_meter :GetTags \{three_sixth_hit}
			freestyle_recording_meter :GetTags \{four_sixth_hit}
			freestyle_recording_meter :GetTags \{five_sixth_hit}
			freestyle_recording_meter :GetTags \{six_sixth_hit}
			if (<one_sixth_hit> = FALSE)
				if (<x_position> >= <portion_length>)
					freestyle_recording_meter :SetTags \{one_sixth_hit = true}
					SpawnScriptNow \{freestyle_game_flare_recording_dot}
				endif
			elseif (<two_sixth_hit> = FALSE)
				if (<x_position> >= (<portion_length> * 2))
					freestyle_recording_meter :SetTags \{two_sixth_hit = true}
					SpawnScriptNow \{freestyle_game_flare_recording_dot}
				endif
			elseif (<three_sixth_hit> = FALSE)
				if (<x_position> >= (<portion_length> * 3))
					freestyle_recording_meter :SetTags \{three_sixth_hit = true}
					SpawnScriptNow \{freestyle_game_flare_recording_dot}
				endif
			elseif (<four_sixth_hit> = FALSE)
				if (<x_position> >= (<portion_length> * 4))
					freestyle_recording_meter :SetTags \{four_sixth_hit = true}
					SpawnScriptNow \{freestyle_game_flare_recording_dot}
				endif
			elseif (<five_sixth_hit> = FALSE)
				if (<x_position> >= (<portion_length> * 5))
					freestyle_recording_meter :SetTags \{five_sixth_hit = true}
					SpawnScriptNow \{freestyle_game_flare_recording_dot}
				endif
			elseif (<six_sixth_hit> = FALSE)
				if (<x_position> >= (<portion_length> * 6))
					freestyle_recording_meter :SetTags \{six_sixth_hit = true}
					SpawnScriptNow \{freestyle_game_flare_recording_dot}
				endif
			endif
		endif
	endif
endscript

script freestyle_game_flare_recording_dot 
	if ScreenElementExists \{id = freestyle_recording_meter}
		freestyle_recording_meter :desc_resolvealias \{Name = alias_hud_recording_dot}
		<resolved_id> :se_setprops {
			Scale = (2.0, 2.0)
			time = 0.5
		}
		Wait \{0.5
			Seconds}
		<resolved_id> :se_setprops {
			Scale = (1.0, 1.0)
			time = 1
		}
	endif
endscript

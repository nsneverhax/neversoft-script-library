freestyle_use_old_drum_assist = FALSE

script freestyle_drum_assist_hud_init 
	if ($freestyle_use_old_drum_assist = true)
		if NOT freestyle_is_instrument_ai \{instrument = drums}
			freestyle_find_player_with_instrument \{instrument = drums}
			highway_player = ($freestyle_player_data [<player_with_instrument>].highway_player)
			formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
			CreateScreenElement {
				dims = (400.0, 400.0)
				parent = <freestyle_highway_name>
				id = drum_assist
				Type = descinterface
				desc = 'freestyle_drum_assist'
				z_priority = -1.5
			}
			position = ($highway_guitarfreestyle.tiltmeter_righty_pos)
			Scale = ((-1.0, 0.0) * ($highway_guitarfreestyle.tiltmeter_xscale) + (0.0, 1.0) * ($highway_guitarfreestyle.tiltmeter_yscale))
			drum_assist :se_setprops {
				Pos = <position>
			}
			drum_assist :desc_resolvealias \{Name = alias_drum_assist_container}
			<resolved_id> :se_setprops {
				Scale = <Scale>
			}
			freestyle_drum_assist_hud_update Player = <player_with_instrument>
		endif
	endif
endscript

script freestyle_drum_assist_hud_update 
	if (($freestyle_use_old_drum_assist) = true)
		if ScreenElementExists \{id = drum_assist}
			freestyle_get_player_param Player = <Player> param = drum_assist
			if (<drum_assist> = true)
				drum_assist :Obj_SpawnScriptNow \{freestyle_animate_drum_assist
					id = drum_assist_script}
			else
				KillSpawnedScript \{id = drum_assist_script}
				drum_assist :desc_resolvealias \{Name = alias_assist_wedge_off}
				<resolved_id> :se_setprops {
					alpha = 1
				}
				drum_assist :desc_resolvealias \{Name = alias_assist_wedge_on}
				<resolved_id> :se_setprops {
					alpha = 0
				}
				drum_assist :desc_resolvealias \{Name = alias_assist_stick_yellow}
				<resolved_id> :se_setprops {
					rot_angle = 40
				}
			endif
		endif
	else
		if ScreenElementExists \{id = freestyle_nunchuk_hud}
			freestyle_get_player_param Player = <Player> param = drum_assist
			if (<drum_assist> = true)
				freestyle_nunchuk_hud :se_setprops \{drum_assist_glow_visibility = 1}
			else
				freestyle_nunchuk_hud :se_setprops \{drum_assist_glow_visibility = 0}
			endif
		endif
	endif
endscript

script freestyle_animate_drum_assist 
	Obj_GetID
	begin
	if ismetronomeenabled
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<objID> :desc_resolvealias Name = alias_assist_wedge_off
	<resolved_id> :se_setprops {
		alpha = 0
	}
	<objID> :desc_resolvealias Name = alias_assist_wedge_on
	<resolved_id> :se_setprops {
		alpha = 1
	}
	<objID> :desc_resolvealias Name = alias_assist_stick_yellow
	stick_id = <resolved_id>
	getmetronomelengthofbeat
	length_ms = <length_of_beat>
	length_s = (<length_ms> / 1000)
	begin
	<stick_id> :se_setprops {
		rot_angle = -5
		time = (<length_s> / 2)
		motion = ease_in
	}
	Wait (<length_s> / 2) Seconds
	<stick_id> :se_setprops {
		rot_angle = 40
		time = (<length_s> / 2)
		motion = ease_out
	}
	Wait (<length_s> / 2) Seconds
	repeat
endscript

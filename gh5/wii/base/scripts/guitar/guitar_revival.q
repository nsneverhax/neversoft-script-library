revival_meter_needle_max_rot = 64
revival_meter_needle_min_rot = -64

script kill_band_player 
	RequireParams \{[
			Player
		]
		all}
	printf qs(0xd00d09bc) p = <Player> channel = zdebug
	getplayerinfo <Player> Band
	getbandinfo <Band> num_dead_members
	if (<num_dead_members> = 1)
		setup_band_revival_meter band_idx = <Band>
		band_failing_vignette_on
	endif
	getplayerinfo <Player> part
	if (<part> = vocals)
		revive_or_kill_player_sfx Player = <Player> vocalist = 1 cheer = 0
		hud_vocal_dead_script Player = <Player>
	else
		LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <Player>
		revive_or_kill_player_sfx Player = <Player> vocalist = 0 cheer = 0
		get_highway_hud_root_id Player = <Player>
		if ScreenElementExists id = <highway_hud_root>
			SetScreenElementProps id = <highway_hud_root> skull_alpha = 1.0
		endif
	endif
endscript

script setup_band_revival_meter \{band_idx = 1}
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert 'hud root not found' p = <Player>
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		ScriptAssert \{'band revival meter not found'}
	endif
	hud_create_message \{Band
		text = qs(0xbe52e274)}
	<revival_meter_id> :se_setprops alpha = 1.0
	getbandinfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($max_num_death_ticks))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :se_setprops hud_revive_meter_needle_rot_angle = <rot_value>
endscript

script clear_band_death_meter \{band_idx = 1}
	setbandinfo <band_idx> current_revival = 0
endscript

script update_band_revival_meter 
	RequireParams \{[
			band_idx
		]}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		ScriptAssert \{'band death meter not found in their highway hud root'}
	endif
	getbandinfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($max_num_death_ticks))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :se_setprops hud_revive_meter_needle_rot_angle = <rot_value>
endscript

script hide_band_death_meter 
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		return
		ScriptAssert 'player %p death meter not found in their highway hud root' p = <Player>
	endif
	<revival_meter_id> :se_setprops alpha = 0.0
endscript

script revive_band_player 
	printf \{channel = sfx
		qs(0xf12da3bc)}
	SoundEvent \{event = endofsong_camera_cheer_softer}
	RequireParams \{[
			Player
		]
		all}
	printf \{qs(0x798ce3e8)
		channel = zdebug}
	getplayerinfo <Player> part
	if (<part> = vocals)
		revive_or_kill_player_sfx Player = <Player> vocalist = 1 cheer = 1
		hud_vocal_revive Player = <Player>
	else
		get_highway_hud_root_id Player = <Player>
		revive_or_kill_player_sfx Player = <Player> vocalist = 0 cheer = 1
		SetScreenElementProps id = <highway_hud_root> skull_alpha = 0.0
	endif
	hide_band_death_meter
	band_failing_vignette_off
endscript

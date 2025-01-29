freestyle_metronome_major_pulse_intensity = 1.0
freestyle_metronome_minor_pulse_intensity = 1.0
freestyle_metronome_pulse_delay = 0.0
freestyle_metronome_major_pulse_width = 400
freestyle_metronome_minor_pulse_width = 400
freestyle_metronome_major_tick_volume = 40
freestyle_metronome_minor_tick_volume = 20
freestyle_metronome_rumble_lead_time = 50
freestyle_metronome_major_rumble_intensity = 15
freestyle_metronome_major_rumble_length = 4
freestyle_metronome_minor_rumble_intensity = 10
freestyle_metronome_minor_rumble_length = 3
freestyle_last_beat_number = 0
freestyle_last_beat_time = 0
freestyle_last_spawn_beat_number = 0
freestyle_last_nowbar_beat_number = 0

script freestyle_start_beat_pulse 
	KillSpawnedScript \{Name = freestyle_beat_pulse_animate}
	SpawnScriptLater \{freestyle_beat_pulse_animate}
endscript

script freestyle_beat_pulse_animate 
	if NOT getmetronomelengthofbeat
		ScriptAssert \{'Metronome is not running!!'}
	endif
	half_beat_length = (<length_of_beat> / 2.0)
	printf 'Initiate nowbar beat pulse cycling. Beat length %a ms' a = <length_of_beat>
	if StructureContains \{structure = $freestyle_current_style_settings
			metronome_visual_pulse}
		major_pulse_width = ($freestyle_current_style_settings.metronome_visual_pulse.major)
		minor_pulse_width = ($freestyle_current_style_settings.metronome_visual_pulse.minor)
	else
		major_pulse_width = $freestyle_metronome_major_pulse_width
		minor_pulse_width = $freestyle_metronome_minor_pulse_width
	endif
	if (<major_pulse_width> > <length_of_beat>)
		ScriptAssert 'Metronome major visual pulse width %a ms is greater than beat length %b ms!' a = <major_pulse_width> b = <length_of_beat>
		major_pulse_width = <length_of_beat>
	endif
	if (<minor_pulse_width> > <length_of_beat>)
		ScriptAssert 'Metronome minor visual pulse width %a ms is greater than beat length %b ms!' a = <minor_pulse_width> b = <length_of_beat>
		minor_pulse_width = <length_of_beat>
	endif
	if ((<minor_pulse_width> = 0) || (<major_pulse_width> = 0))
		ScriptAssert 'Degenerate metronome visual pulse width! Must be > 0! Major = %a Minor = %b' a = <major_pulse_width> b = <minor_pulse_width>
		major_pulse_width = $freestyle_metronome_major_pulse_width
		minor_pulse_width = $freestyle_metronome_minor_pulse_width
	endif
	major_half_width = (<major_pulse_width> * 0.5)
	minor_half_width = (<minor_pulse_width> * 0.5)
	array = []
	i = 0
	begin
	player_num = ($freestyle_player_data [<i>].highway_player)
	formatText checksumName = nowbar_base 'nowbar_beat_containerp%p' p = <player_num>
	AddArrayElement array = <array> element = <nowbar_base>
	<i> = (<i> + 1)
	repeat $freestyle_max_players
	begin
	player_num = ($freestyle_player_data [(<i> - $freestyle_max_players)].highway_player)
	formatText checksumName = nowbar_base 'nowbar_beat_container_weakp%p' p = <player_num>
	AddArrayElement array = <array> element = <nowbar_base>
	<i> = (<i> + 1)
	repeat $freestyle_max_players
	beat_pulse_ids = <array>
	i = 0
	begin
	if ScreenElementExists id = (<beat_pulse_ids> [<i>])
		if ($freestyle_player_data [<i>].metronome_visual = FALSE)
			SetScreenElementProps id = (<beat_pulse_ids> [<i>]) Hide alpha = 0
			SetScreenElementProps id = (<beat_pulse_ids> [(<i> + $freestyle_max_players)]) Hide alpha = 0
		else
			SetScreenElementProps id = (<beat_pulse_ids> [<i>]) unhide alpha = 0
			SetScreenElementProps id = (<beat_pulse_ids> [(<i> + $freestyle_max_players)]) unhide alpha = 0
		endif
	endif
	i = (<i> + 1)
	repeat $freestyle_max_players
	prev_next_beat_time = 0
	prev_up_beat = None
	on_division = true
	begin
	beats_since_start = ($freestyle_last_nowbar_beat_number)
	if (<beats_since_start> >= 0)
		getmetronometimebeforenextbeat
		next_beat_time = (<next_beat_time> + $freestyle_metronome_pulse_delay)
		if (<next_beat_time> < 0)
			next_beat_time = (<next_beat_time> + <length_of_beat>)
		elseif (<next_beat_time> >= <length_of_beat>)
			next_beat_time = (<next_beat_time> - <length_of_beat>)
		endif
		if (<next_beat_time> > <half_beat_length>)
			distance_from_beat = (<length_of_beat> - <next_beat_time>)
			<up_beat> = FALSE
		else
			distance_from_beat = <next_beat_time>
			<up_beat> = true
		endif
		if ((<prev_up_beat> = FALSE) && (<up_beat> = true))
			Mod a = (<beats_since_start> + 1) b = $freestyle_beats_per_measure
			if (<Mod> = 0)
				on_division = true
			else
				on_division = FALSE
			endif
		endif
		if (<on_division> = true)
			if (<distance_from_beat> <= <major_half_width>)
				beat_factor = (1.0 - (<distance_from_beat> / <major_half_width>))
			else
				beat_factor = 0
			endif
		else
			if (<distance_from_beat> <= <minor_half_width>)
				beat_factor = (1.0 - (<distance_from_beat> / <minor_half_width>))
			else
				beat_factor = 0
			endif
		endif
		if (<up_beat> = true)
			<pulse_alpha> = (<beat_factor> * <beat_factor> * <beat_factor>)
		else
			<pulse_alpha> = (<beat_factor> * <beat_factor> * <beat_factor>)
		endif
		if (<on_division> = true)
			<pulse_alpha> = (<pulse_alpha> * $freestyle_metronome_major_pulse_intensity)
		else
			<pulse_alpha> = (<pulse_alpha> * $freestyle_metronome_minor_pulse_intensity)
		endif
		<i> = 0
		begin
		if ScreenElementExists id = (<beat_pulse_ids> [<i>])
			if (<on_division> = true)
				SetScreenElementProps id = (<beat_pulse_ids> [<i>]) alpha = <pulse_alpha>
				SetScreenElementProps id = (<beat_pulse_ids> [(<i> + $freestyle_max_players)]) alpha = 0
			else
				SetScreenElementProps id = (<beat_pulse_ids> [<i>]) alpha = 0
				SetScreenElementProps id = (<beat_pulse_ids> [(<i> + $freestyle_max_players)]) alpha = <pulse_alpha>
			endif
		endif
		<i> = (<i> + 1)
		repeat $freestyle_max_players
	endif
	prev_next_beat_time = <next_beat_time>
	prev_up_beat = <up_beat>
	WaitOneGameFrame
	repeat
endscript

script freestyle_show_beat_glow 
	RequireParams \{[
			highway_player
			tilt
		]
		all}
	<i> = 0
	begin
	color_text = ($freestyle_suggested_colors [<i>])
	formatText checksumName = beat_piece_left 'beaticon_left_%c_p%p' c = <color_text> p = <highway_player>
	formatText checksumName = beat_piece_right 'beaticon_right_%c_p%p' c = <color_text> p = <highway_player>
	formatText checksumName = beat_piece_weak_left 'beaticonweak_left_%c_p%p' c = <color_text> p = <highway_player>
	formatText checksumName = beat_piece_weak_right 'beaticonweak_right_%c_p%p' c = <color_text> p = <highway_player>
	if (<i> = <tilt>)
		SetScreenElementProps id = <beat_piece_left> alpha = 1.0
		SetScreenElementProps id = <beat_piece_right> alpha = 1.0
		SetScreenElementProps id = <beat_piece_weak_left> alpha = 1.0
		SetScreenElementProps id = <beat_piece_weak_right> alpha = 1.0
	else
		SetScreenElementProps id = <beat_piece_left> alpha = 0.0
		SetScreenElementProps id = <beat_piece_right> alpha = 0.0
		SetScreenElementProps id = <beat_piece_weak_left> alpha = 0.0
		SetScreenElementProps id = <beat_piece_weak_right> alpha = 0.0
	endif
	<i> = (<i> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_start_metronome_tick 
	KillSpawnedScript \{Name = freestyle_metronome_tick_spawned}
	SpawnScriptLater \{freestyle_metronome_tick_spawned}
endscript

script freestyle_metronome_tick_spawned 
	num_controllers = 0
	i = 0
	controllers = {}
	begin
	if (($freestyle_player_data [<i>].metronome_audio = true)
			&& ($freestyle_player_data [<i>].player_type = human))
		control_id = ($freestyle_player_data [<i>].controller)
		formatText checksumName = controller_name 'controller%p' p = (<num_controllers> + 1) AddToStringLookup = true
		setstructureparam struct_name = controllers param = <controller_name> value = <control_id>
		num_controllers = (<num_controllers> + 1)
	endif
	i = (<i> + 1)
	repeat $freestyle_max_players
	if (<num_controllers> = 0)
		printf \{'All users have metronome option turned off. Exit tick loop.'}
		return
	endif
	begin
	if ($freestyle_last_nowbar_beat_number >= 0)
		break
	endif
	WaitOneGameFrame
	repeat
	begin
	if metronomebeatthisframe
		beats_since_start = ($freestyle_last_nowbar_beat_number)
		Mod a = <beats_since_start> b = $freestyle_beats_per_measure
		if (<Mod> = 0)
			on_division = true
		else
			on_division = FALSE
		endif
		if (<on_division> = true)
			Volume = $freestyle_metronome_major_tick_volume
			PlaySound metronomeclick vol = <Volume> buss = wrong_notes_guitar controllers = <controllers>
		else
			Volume = $freestyle_metronome_minor_tick_volume
			PlaySound metronomeclicksoft vol = <Volume> buss = wrong_notes_guitar controllers = <controllers>
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script freestyle_start_metronome_rumble 
	KillSpawnedScript \{Name = freestyle_metronome_rumble_spawned}
	SpawnScriptLater \{freestyle_metronome_rumble_spawned}
endscript

script freestyle_metronome_rumble_spawned 
	begin
	if ($freestyle_last_nowbar_beat_number >= 0)
		break
	endif
	WaitOneGameFrame
	repeat
	if StructureContains \{structure = $freestyle_current_style_settings
			rumble_settings}
		printf \{'Found style-specific rumble settings, using.'}
		metronome_rumble_lead_time = ($freestyle_current_style_settings.rumble_settings.lead_time)
		metronome_major_rumble_intensity = ($freestyle_current_style_settings.rumble_settings.major_intensity)
		metronome_major_rumble_length = ($freestyle_current_style_settings.rumble_settings.major_length)
		metronome_minor_rumble_intensity = ($freestyle_current_style_settings.rumble_settings.minor_intensity)
		metronome_minor_rumble_length = ($freestyle_current_style_settings.rumble_settings.minor_length)
	else
		metronome_rumble_lead_time = $freestyle_metronome_rumble_lead_time
		metronome_major_rumble_intensity = $freestyle_metronome_major_rumble_intensity
		metronome_major_rumble_length = $freestyle_metronome_major_rumble_length
		metronome_minor_rumble_intensity = $freestyle_metronome_minor_rumble_intensity
		metronome_minor_rumble_length = $freestyle_metronome_minor_rumble_length
	endif
	if NOT getmetronomelengthofbeat
		ScriptAssert \{'Metronome is not running!!'}
	endif
	half_beat_length = (<length_of_beat> / 2.0)
	on_division = FALSE
	division_checked = FALSE
	rumble_done = FALSE
	last_beat_time = 0
	begin
	getmetronometimebeforenextbeat
	if ((<division_checked> = FALSE) && (<next_beat_time> < <half_beat_length>))
		next_beat_number = ($freestyle_last_nowbar_beat_number + 1)
		Mod a = <next_beat_number> b = $freestyle_beats_per_measure
		if (<Mod> = 0)
			on_division = true
		else
			on_division = FALSE
		endif
		division_checked = true
	elseif (<next_beat_time> > <last_beat_time>)
		division_checked = FALSE
	endif
	if (<rumble_done> = FALSE)
		if ((<next_beat_time> < <metronome_rumble_lead_time>) || (<next_beat_time> > <last_beat_time>))
			i = 0
			begin
			if (($freestyle_player_data [<i>].has_highway = true) && ($freestyle_player_data [<i>].metronome_rumble = true))
				if (<on_division> = true)
					activatestarpowerpulse {
						Player = ($freestyle_player_data [<i>].controller)
						num = 1
						length = <metronome_major_rumble_length>
						Strength = <metronome_major_rumble_intensity>
						Priority = 55
					}
				else
					if (<metronome_minor_rumble_intensity> > 0)
						activatestarpowerpulse {
							Player = ($freestyle_player_data [<i>].controller)
							num = 1
							length = <metronome_minor_rumble_length>
							Strength = <metronome_minor_rumble_intensity>
							Priority = 55
						}
					endif
				endif
			endif
			i = (<i> + 1)
			repeat $freestyle_max_players
			if NOT (<next_beat_time> > <last_beat_time>)
				rumble_done = true
			endif
		endif
	else
		if (<next_beat_time> > <last_beat_time>)
			rumble_done = FALSE
		endif
	endif
	last_beat_time = <next_beat_time>
	WaitOneGameFrame
	repeat
endscript

script freestyle_update_metronome 
	if NOT ismetronomeenabled
		return
	endif
	if metronomebeatthisframe
		getmetronomebeatssincestart
		getmetronomelengthofbeat
		current_beat = <beats_since_start>
		CastToInteger \{current_beat}
		Change freestyle_last_beat_number = <current_beat>
		Change freestyle_last_beat_time = (<current_beat> * <length_of_beat>)
		Change freestyle_last_spawn_beat_number = ($freestyle_last_beat_number - $freestyle_starting_beat)
		Change freestyle_last_nowbar_beat_number = ($freestyle_last_spawn_beat_number - $freestyle_card_spawn_offset_beats)
		if (($freestyle_transition_state = intro_countdown) || ($freestyle_transition_state = gameplay) || ($freestyle_game_mode = tutorial))
			launchpulseevent
		endif
	endif
endscript

script freestyle_reset_metronome 
	Change \{freestyle_last_beat_number = -1}
	Change \{freestyle_last_beat_time = -1}
	Change \{freestyle_last_spawn_beat_number = -1}
	Change \{freestyle_last_nowbar_beat_number = -1}
endscript

script freestyle_kill_metronome_spawns 
	KillSpawnedScript \{Name = freestyle_beat_pulse_animate}
	KillSpawnedScript \{Name = freestyle_metronome_tick_spawned}
	KillSpawnedScript \{Name = freestyle_metronome_rumble_spawned}
endscript

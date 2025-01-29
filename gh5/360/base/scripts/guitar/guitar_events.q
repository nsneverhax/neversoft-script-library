guitar_events = [
	{
		Type = call
		event = missed_note
		Scr = GuitarEvent_MissedNote
	}
	{
		Type = call
		event = unnecessary_note
		Scr = GuitarEvent_UnnecessaryNote
	}
	{
		Type = call
		event = hit_notes
		Scr = GuitarEvent_HitNotes
	}
	{
		Type = call
		event = hit_note
		Scr = GuitarEvent_HitNote
	}
	{
		Type = call
		event = drumfill_hit
		Scr = guitarevent_drumfillhit
	}
	{
		Type = call
		event = star_power_on
		Scr = GuitarEvent_StarPowerOn
	}
	{
		Type = call
		event = star_power_off
		Scr = GuitarEvent_StarPowerOff
	}
	{
		Type = spawn
		event = song_failed
		Scr = GuitarEvent_SongFailed
	}
	{
		Type = spawn
		event = song_won
		Scr = GuitarEvent_SongWon
	}
	{
		Type = spawn
		event = star_sequence_bonus
		Scr = GuitarEvent_StarSequenceBonus
	}
	{
		Type = call
		event = whammy_on
		Scr = GuitarEvent_WhammyOn
	}
	{
		Type = call
		event = whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		Type = call
		event = ext_whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		Type = spawn
		event = note_window_open
		Scr = GuitarEvent_Note_Window_Open
	}
	{
		Type = spawn
		event = note_window_close
		Scr = GuitarEvent_Note_Window_Close
	}
	{
		Type = call
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
]

script create_guitar_events 
	printf qs(0xf3da5047) a = <Player>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	event = ($guitar_events [<array_entry>].event)
	Type = ($guitar_events [<array_entry>].Type)
	extendcrcplayer <event> <Player> out = event
	if (<Type> = spawn)
		SetEventHandler response = call_script event = <event> Scr = event_spawner params = {event_spawned = <array_entry>}
	else
		Scr = ($guitar_events [<array_entry>].Scr)
		SetEventHandler response = call_script event = <event> Scr = <Scr>
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	Block
endscript

script event_spawner 
	SpawnScriptNow ($guitar_events [<event_spawned>].Scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs(0x5fa77966) d = <time_offset> e = <event_string> channel = events
	get_song_prefix song = <song_name>
	formatText checksumName = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup = true
	array_entry = 0
	if NOT GlobalExists Name = <song> Type = array
		if (<event_string> != 'scriptevents')
			ScriptAssert 'Array %s does not exist' s = <song>
		endif
		return
	endif
	if ($medley_mode_on)
		return
	endif
	GetArraySize $<song>
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	array_Size = (<array_Size> - <array_entry>)
	if (<array_Size> = 0)
		return
	endif
	begin
	TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry> ArrayOfStructures
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	scriptname = ($<song> [<array_entry>].Scr)
	if ScriptExists <scriptname>
		SpawnScriptNow <scriptname> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif SymbolIsCFunc <scriptname>
		<scriptname> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript

script GuitarEvent_MissedNote \{extended_miss = 0}
	if ($calibrate_lag_enabled = 1)
		SpawnScriptNow \{calibration_highway_miss_note}
	endif
	if (<bum_note> = 1)
		Guitar_Wrong_Note_Sound_Logic <...>
	endif
	getplayerinfo <Player> is_local_client
	getplayerinfo <Player> part
	processevent_note_miss <...>
	if ($is_network_game && <is_local_client> = 0)
		if (<silent_miss> = 1)
			SpawnScriptNow highway_pulse_black params = {Player = <Player>}
		endif
	elseif ($single_stream_enabled = 1)
		musicstudio_update_volume_for_playback OFF Player = <Player>
	else
		if NOT (<part> = drum)
			playergetvolume Player = <Player>
			if NOT (<Volume> = 0)
				if (<silent_miss> = 1)
					SpawnScriptNow highway_pulse_black params = {Player = <Player>}
				else
					if NOT (<extended_miss> = 1)
						if ($single_stream_enabled = 0)
							playersetvolume Player = <Player> Volume = 0
							UpdateGuitarVolume
						endif
					endif
				endif
			endif
		endif
		gman_songtool_getcurrentsong
		if (<current_song> = jamsession)
			musicstudio_update_volume_for_playback OFF Player = <Player>
		endif
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			getplayerinfo <Player> band_member
			if CompositeObjectExists Name = <band_member>
				if (<part> = guitar || <part> = bass)
					bandmanager_missednote Name = <band_member>
				endif
			endif
		endif
	endif
	inputarraygetelement Name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) Color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	extendcrcplayer out = highway highway_2d <Player>
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> Seconds
	if playerinfoequals <Player> star_power_used = 1
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	if ($calibrate_lag_enabled = 1)
		return
	endif
	Guitar_Wrong_Note_Sound_Logic <...>
	getplayerinfo <Player> is_local_client
	if NOT ($is_network_game && (<is_local_client> = 0))
		playersetvolume Player = <Player> Volume = 0
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback OFF Player = <Player> unnecessarynote = 1
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			getplayerinfo <Player> band_member
			if CompositeObjectExists Name = <band_member>
				getplayerinfo <Player> part
				if (<part> = guitar || <part> = bass)
					LaunchEvent Type = Anim_MissedNote target = (<band_member>)
				endif
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			inputarraygetelement Name = <song> index = <array_entry>
			next_note = (<gem_array> [0])
			inputarraygetelement Name = <song> index = (<array_entry> -1)
			prev_note = (<gem_array> [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text qs(0x9648a941) n = <next_time> t = <next_note> Color = red
			else
				output_log_text qs(0x6ef444b5) n = <prev_time> t = <prev_note> Color = darkred
			endif
		endif
	endif
endscript

script GuitarEvent_HitNotes 
	if ($Debug_Audible_HitNote = 1)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
	getplayerinfo <Player> part
	processevent_note_hit <...>
	if ($show_play_log = 1 || $calibrate_lag_enabled = 1)
		get_lag_values
		<off_note> = (0 - (<off_note> - ($time_input_offset - <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		if ($calibrate_lag_enabled = 1)
			AddArrayElement array = $calibrate_history_times element = <off_note>
			Change calibrate_history_times = <array>
		endif
		if ($show_play_log = 1)
			inputarraygetelement Name = <song> index = <array_entry>
			note_time = (<gem_array> [0])
			if (<off_note> < 0)
				output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> Color = green
			else
				output_log_text qs(0x257db375) n = <off_note> t = <note_time> Color = darkgreen
			endif
		endif
	endif
	if (<updatevolume> = true)
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback On Player = <Player>
	endif
endscript

script GuitarEvent_HitNote 
	SpawnScriptNow GuitarEvent_HitNote_Spawned params = {<...>}
endscript

script GuitarEvent_HitNote_Spawned 
	getnowbarscale Player = <Player>
	if ($calibrate_lag_enabled = 1)
		SpawnScriptNow \{calibration_highway_hit_note}
	endif
	if GotParam \{kick}
		guitarevent_kick_drum_hit_note Player = <Player>
	elseif GotParam \{open_note}
		guitarevent_hit_open_note Player = <Player>
	elseif GotParam \{beginner_note}
		guitarevent_hit_beginner_note Player = <Player>
	else
		Wait \{1
			gameframe}
		Scale = (3.0, 3.0)
		star_power_used = 0
		if playerinfoequals Player = <Player> star_power_used = 1
			<star_power_used> = 1
		endif
		<Pos> = ((<Pos>.(1.0, 0.0) * (1.0, 0.0)) + ((<Pos>.(0.0, 1.0) + 25) * (0.0, 1.0)))
		<particle_pos> = (((<nowbar_x_scale> * (<Pos> [0])) * (1.0, 0.0)) + ((<nowbar_y_scale> * (<Pos> [1]) + 30) * (0.0, 1.0)))
		NoteFX <...> star = <star_power_used> Name = <fx_id>
	endif
endscript

script guitarevent_hitnote_kill_spawned 
	if GotParam \{particle_id2}
		Wait \{0.1
			Seconds}
		Destroy2DParticleSystem id = <particle_id> kill_when_empty
		Destroy2DParticleSystem id = <particle_id2> kill_when_empty
		Destroy2DParticleSystem id = <particle_id3> kill_when_empty
		Wait \{1.15
			Seconds}
		destroygemelement id = <fx_id>
	else
		Wait \{4
			gameframes}
		Destroy2DParticleSystem id = <particle_id> kill_when_empty
		Wait \{10
			gameframes}
		destroygemelement id = <fx_id>
	endif
endscript

script guitarevent_drumfillhit 
	GuitarEvent_HitNote <...>
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		64
		200
	]
	end_color = [
		255
		128
		0
		0
	]
	start_scale = (1.0, 1.5)
	end_scale = (0.015, 0.03)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 30.0
	emit_radius = 12.0
	Emit_Rate = 0.025
	emit_dir = 0.0
	emit_spread = 40.0
	velocity = 12.0
	friction = (0.0, 100.0)
	time = 0.5
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		128
		255
		255
		200
	]
	end_color = [
		128
		255
		255
		0
	]
	start_scale = (1.0, 1.5)
	end_scale = (0.015, 0.03)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 30.0
	emit_radius = 12.0
	Emit_Rate = 0.025
	emit_dir = 0.0
	emit_spread = 40.0
	velocity = 12.0
	friction = (0.0, 100.0)
	time = 0.5
}
drum_accent1_hit_particle_params = {
	z_priority = 4.5
	material = mat_velocity_shatter_fx
	start_color = [
		255
		255
		255
		255
	]
	end_color = [
		255
		255
		255
		255
	]
	start_scale = (0.5, 0.5)
	end_scale = (0.3, 0.3)
	start_angle_spread = 360.0
	min_rotation = 360
	max_rotation = 0
	emit_start_radius = 0.0
	emit_radius = 0.0
	Emit_Rate = 0.05
	emit_dir = 0.0
	emit_spread = 120.0
	velocity = 33.0
	friction = (0.0, 88.0)
	time = 2.1
}
drum_accent2_hit_particle_params = {
	z_priority = 4.5
	material = mat_velocity_shatter_fx1
	start_color = [
		255
		255
		255
		255
	]
	end_color = [
		255
		255
		255
		255
	]
	start_scale = (-0.3, -0.3)
	end_scale = (-0.5, -0.5)
	start_angle_spread = 360.0
	min_rotation = 0
	max_rotation = 360
	emit_start_radius = 1
	emit_radius = 1
	Emit_Rate = 0.06
	emit_dir = 0.0
	emit_spread = 44.0
	velocity = 24
	friction = (0.0, 88.0)
	time = 2.1
}
drum_accent3_hit_particle_params = {
	z_priority = 4.5
	material = mat_velocity_shatter_fx2
	start_color = [
		122
		122
		122
		128
	]
	end_color = [
		123
		123
		123
		0
	]
	start_scale = (0.04, 0.04)
	end_scale = (0.1, 0.1)
	start_angle_spread = 360.0
	min_rotation = 0
	max_rotation = 0
	emit_start_radius = 1
	emit_radius = 25.0
	Emit_Rate = 0.0055
	emit_dir = 0.0
	emit_spread = 44.0
	velocity = 22.0
	friction = (0.0, 0.0)
	time = 0.1
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	Emit_Rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script drum_accent_hit_particle_fx 
	formatText checksumName = container_id 'nowbar_container_p%p' p = <Player>
	getnowbarscale Player = <Player>
	<particle_pos> = (((<nowbar_x_scale> * (<Pos> [0])) * (1.0, 0.0)) + ((<nowbar_y_scale> * (<Pos> [1])) * (0.0, 1.0)))
	getplayerinfo Player = <Player> star_power_used
	formatText checksumName = Name 'hit_accent%p' p = <Player> AddToStringLookup = true
	if (<star_power_used> = 0)
		if ScreenElementExists id = <Name>
			DestroyScreenElement id = <Name>
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = <Name>
			parent = <container_id>
			material = mat_note_hit_xplosion1
			rgba = [255 255 255 255]
			Pos = <Pos>
			rot_angle = (0)
			Scale = (2.0, 2.0)
			just = [center bottom]
			z_priority = 6
		}
	else
		if ScreenElementExists id = <Name>
			DestroyScreenElement id = <Name>
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = <Name>
			parent = <container_id>
			material = mat_note_hit_xplosion1
			rgba = [0 128 255 255]
			Pos = <Pos>
			rot_angle = (0)
			Scale = (2.0, 2.0)
			just = [center bottom]
			z_priority = 6
		}
	endif
	Pos = <particle_pos>
	ExtendCrc <fx_id> '_hit1_particle_accent' out = particle1_id
	Destroy2DParticleSystem id = <particle1_id>
	Create2DParticleSystem {
		id = <particle1_id>
		Pos = <Pos>
		z_priority = 4.5
		material = mat_velocity_shatter_fx
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (0.5, 0.5)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 360
		max_rotation = 0
		emit_start_radius = 0.0
		emit_radius = 0.0
		Emit_Rate = 0.05
		emit_dir = 0.0
		emit_spread = 120.0
		velocity = 33.0
		friction = (0.0, 88.0)
		time = 2.1
	}
	ExtendCrc <fx_id> '_hit2_particle_accent' out = particle2_id
	Destroy2DParticleSystem id = <particle2_id>
	Create2DParticleSystem {
		id = <particle2_id>
		Pos = <Pos>
		z_priority = 4.5
		material = mat_velocity_shatter_fx1
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (-0.3, -0.3)
		end_scale = (-0.5, -0.5)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 1
		emit_radius = 1
		Emit_Rate = 0.06
		emit_dir = 0.0
		emit_spread = 44.0
		velocity = 24
		friction = (0.0, 88.0)
		time = 2.1
	}
	ExtendCrc <fx_id> '_hit3_particle_accent' out = particle3_id
	Destroy2DParticleSystem id = <particle3_id>
	Create2DParticleSystem {
		id = <particle3_id>
		Pos = <Pos>
		z_priority = 4.5
		material = mat_velocity_shatter_fx2
		parent = <container_id>
		start_color = [122 122 122 128]
		end_color = [123 123 123 0]
		start_scale = (0.04, 0.04)
		end_scale = (0.1, 0.1)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 1
		emit_radius = 25.0
		Emit_Rate = 0.0055
		emit_dir = 0.0
		emit_spread = 44.0
		velocity = 22.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	Wait \{0.1
		Seconds}
	Destroy2DParticleSystem id = <particle1_id> kill_when_empty
	Destroy2DParticleSystem id = <particle2_id> kill_when_empty
	Destroy2DParticleSystem id = <particle3_id> kill_when_empty
	Wait \{1.15
		Seconds}
	DestroyScreenElement id = <Name>
endscript

script shake_highway2 
	printf \{channel = zdebug
		qs(0x87e07a9f)}
	formatText checksumName = container_id 'highway_containerp%p' p = <Player> AddToStringLookup = true
	if NOT ScreenElementExists id = <container_id>
		return
	endif
	GetScreenElementPosition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	pulse_on = 0
	begin
	if NOT ScreenElementExists id = <container_id>
		return
	endif
	if (<pulse_on> = 0)
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = (<original_position> + (0.0, 10.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		Wait <shake_frequency> Seconds
		<pulse_on> = 1
	else
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
			time = <shake_frequency>
		}
		Wait <shake_frequency> Seconds
		<pulse_on> = 0
	endif
	Wait \{1
		gameframes}
	repeat 2
endscript

script shake_highway3 
	printf \{channel = zdebug
		qs(0x9efb4bde)}
	formatText checksumName = container_id 'highway_containerp%p' p = <Player> AddToStringLookup = true
	GetScreenElementPosition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	pulse_on = 0
	begin
	if (<pulse_on> = 0)
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = (<original_position> + (0.0, 1.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		Wait <shake_frequency> Seconds
		<pulse_on> = 1
	else
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
			time = <shake_frequency>
		}
		Wait <shake_frequency> Seconds
		<pulse_on> = 0
	endif
	Wait \{1
		gameframes}
	repeat 2
endscript

script GuitarEvent_StarPowerOn 
	KillSpawnedScript \{Name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		GH_Star_Power_Verb_On Player = <Player>
	endif
	formatText checksumName = scriptID 'p%p_StarPower_StageFX' p = <Player>
	StarPowerOn Player = <Player>
	LightShow_SetParams \{mood = starpower}
	Change \{lightshow_allow_mood_changes = FALSE}
	getnumplayersingame
	if (<num_players> = 4)
		if (all_players_using_starpower)
			SpawnScriptNow \{play_group_star_power_animation}
		endif
	endif
endscript

script GuitarEvent_StarPowerOff \{no_sound = FALSE}
	KillSpawnedScript \{Name = highway_pulse_black}
	if (<no_sound> = FALSE)
		if isps3
			if NOT ($current_song = jamsession)
				if isSinglePlayerGame
					SoundEvent \{event = star_power_release_front_gh4}
				else
					SpawnScriptNow star_power_release_sfx_multiplayer params = {Player = <Player>}
				endif
			endif
		else
			if isSinglePlayerGame
				SoundEvent \{event = star_power_release_front_gh4}
			else
				SpawnScriptNow star_power_release_sfx_multiplayer params = {Player = <Player>}
			endif
		endif
	endif
	GH_Star_Power_Verb_Off Player = <Player>
	SpawnScriptNow rock_meter_star_power_off params = {Player = <Player>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	formatText checksumName = cont 'starpower_container_leftp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = cont 'starpower_container_rightp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = highway 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	SpawnScriptNow \{Kill_StarPower_Camera}
	Change \{lightshow_allow_mood_changes = true}
	if ($lightshow_last_mood_requested != None)
		LightShow_SetParams \{mood = $lightshow_last_mood_requested}
	endif
endscript

script GuitarEvent_PreFretbar 
	SpawnScriptNow \{gh_audible_metronome}
	waitTime = 0.25
	Wait <waitTime> Seconds
	getplayerinfo \{1
		star_power_used
		out = star_power_used1}
	getplayerinfo \{2
		star_power_used
		out = star_power_used2}
	getplayerinfo \{3
		star_power_used
		out = star_power_used3}
	getplayerinfo \{4
		star_power_used
		out = star_power_used4}
	if ((<star_power_used1> = 1) || (<star_power_used2> = 1) || (<star_power_used3> = 1) || (<star_power_used4> = 1))
		if ($clap_fade = 1)
			printf \{channel = sfx
				qs(0x784a1ce5)}
			Change \{clap_fade = 0}
			SpawnScriptNow \{clap_fade_kill}
		endif
		if ($game_mode != tutorial)
			if (($star_clap_normal = 1) || ($star_clap_leftcenterright = 1))
				printf \{qs(0xfe00cc6d)}
				SoundEvent \{event = $current_crowd_clap_normal_soundevent}
			elseif ($star_clap_middle = 1)
				printf \{qs(0x3af3642a)}
				SoundEvent \{event = $current_crowd_clap_middle_soundevent}
			elseif ($star_clap_left = 1)
				printf \{qs(0x4ac89455)}
				SoundEvent \{event = $current_crowd_clap_left_soundevent}
			elseif ($star_clap_right = 1)
				printf \{qs(0x8bfb9430)}
				SoundEvent \{event = $current_crowd_clap_right_soundevent}
			elseif ($star_clap_right_middle = 1)
				printf \{qs(0xbc1479cf)}
				SoundEvent \{event = $current_crowd_clap_right_middle_soundevent}
			elseif ($star_clap_left_middle = 1)
				printf \{qs(0x492c71b5)}
				SoundEvent \{event = $current_crowd_clap_left_middle_soundevent}
			endif
		endif
	elseif ($clap_fade = 1)
		printf \{channel = sfx
			qs(0xe4391755)}
		if ($star_clap_normal = 1)
			printf \{qs(0xfe00cc6d)}
			SoundEvent \{event = $current_crowd_clap_normal_soundevent}
		elseif ($star_clap_middle = 1)
			printf \{qs(0x3af3642a)}
			SoundEvent \{event = $current_crowd_clap_middle_soundevent}
		elseif ($star_clap_left = 1)
			printf \{qs(0x4ac89455)}
			SoundEvent \{event = $current_crowd_clap_left_soundevent}
		elseif ($star_clap_right = 1)
			printf \{qs(0xc4a697e0)}
			SoundEvent \{event = $current_crowd_clap_right_soundevent}
		elseif ($star_clap_right_middle = 1)
			printf \{qs(0xbc1479cf)}
			SoundEvent \{event = $current_crowd_clap_right_middle_soundevent}
		elseif ($star_clap_left_middle = 1)
			printf \{qs(0x492c71b5)}
			SoundEvent \{event = $current_crowd_clap_left_middle_soundevent}
		endif
	else
		if ($CrowdListenerStateClapOn1234 = 1)
			if ($star_clap_normal = 1)
				printf \{qs(0xfe00cc6d)}
				SoundEvent \{event = $current_crowd_clap_normal_soundevent}
			elseif ($star_clap_middle = 1)
				printf \{qs(0x3af3642a)}
				SoundEvent \{event = $current_crowd_clap_middle_soundevent}
			elseif ($star_clap_left = 1)
				printf \{qs(0x4ac89455)}
				SoundEvent \{event = $current_crowd_clap_left_soundevent}
			elseif ($star_clap_right = 1)
				printf \{qs(0xc4a697e0)}
				SoundEvent \{event = $current_crowd_clap_right_soundevent}
			elseif ($star_clap_right_middle = 1)
				printf \{qs(0xbc1479cf)}
				SoundEvent \{event = $current_crowd_clap_right_middle_soundevent}
			elseif ($star_clap_left_middle = 1)
				printf \{qs(0x492c71b5)}
				SoundEvent \{event = $current_crowd_clap_left_middle_soundevent}
			endif
		endif
	endif
	SpawnScriptNow \{crowd_anticipation}
endscript

script gh_audible_metronome 
	if ($debug_audible_metronome = 1)
		Wait ((0.25 + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) - 0.008333) Seconds
		SoundEvent \{event = GH_SFX_BeatSoundEvent}
	endif
endscript

script GuitarEvent_Fretbar 
	guitarevent_fretbar_cfunc
endscript

script GuitarEvent_Fretbar_Early 
endscript

script GuitarEvent_Fretbar_Late 
endscript

script check_first_note_formed 
	GetSongTime
	<starttime> = (<songtime> - 0.0167)
	getplayerinfo <Player> check_time_early
	getplayerinfo <Player> check_time_late
	Duration = (<check_time_early> + <check_time_late>)
	begin
	getplayerinfo <Player> controller
	GetHeldPattern controller = <controller> Player = <Player>
	if (<strum> = <hold_pattern>)
		playersetvolume Player = <Player> Volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback On Player = <Player>
	endif
	Wait \{1
		gameframe}
	GetSongTime
	if ((<songtime> - <starttime>) >= <Duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	getplayerinfo <Player> controller
	if IsGuitarController controller = <controller>
		GetStrumPattern entry = 0 song = <song>
		SpawnScriptNow check_first_note_formed params = {strum = <strum> Player = <Player>}
	else
		playersetvolume Player = <Player> Volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback On Player = <Player>
	endif
endscript

script GuitarEvent_Note_Window_Open 
	if ($Debug_Audible_Open = 1)
		value = (($check_time_early + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) + 0.008333)
		printf channel = sfx qs(0x73307931) s = <value>
		Wait (($check_time_early + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) + 0.008333) Seconds
		SoundEvent \{event = GH_SFX_BeatSoundEvent}
	endif
endscript

script GuitarEvent_Note_Window_Close 
	if ($Debug_Audible_Close = 1)
		SoundEvent \{event = GH_SFX_BeatWindowCloseSoundEvent}
	endif
endscript
blueWhammyFXID01p1 = JOW_NIL
blueWhammyFXID02p1 = JOW_NIL
greenWhammyFXID01p1 = JOW_NIL
greenWhammyFXID02p1 = JOW_NIL
orangeWhammyFXID01p1 = JOW_NIL
orangeWhammyFXID02p1 = JOW_NIL
redWhammyFXID01p1 = JOW_NIL
redWhammyFXID02p1 = JOW_NIL
yellowWhammyFXID01p1 = JOW_NIL
yellowWhammyFXID02p1 = JOW_NIL
blueWhammyFXID01p2 = JOW_NIL
blueWhammyFXID02p2 = JOW_NIL
greenWhammyFXID01p2 = JOW_NIL
greenWhammyFXID02p2 = JOW_NIL
orangeWhammyFXID01p2 = JOW_NIL
orangeWhammyFXID02p2 = JOW_NIL
redWhammyFXID01p2 = JOW_NIL
redWhammyFXID02p2 = JOW_NIL
yellowWhammyFXID01p2 = JOW_NIL
yellowWhammyFXID02p2 = JOW_NIL

script Destroy_AllWhammyFX 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		WhammyFXOffAll Player = <Player>
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script GuitarEvent_WhammyOn 
	WhammyFXOn <...>
endscript

script GuitarEvent_WhammyOff 
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	gamemode_gettype
	if (<Type> = freeplay || <Type> = practice || <Type> = tutorial)
		return
	endif
	if ($calibrate_lag_enabled = 1)
		return
	endif
	if ($failed_song = 1)
		return
	endif
	if (($cheat_invincible = 1) && ($is_network_game != 1))
		return
	endif
	Change \{failed_song = 1}
	gameevent_songfailed
	restore_player_part_settings
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_failed
		}}
	dynamicadmanager_issuecue \{cue = commitimpressions}
	if ($is_network_game)
		online_fail_song
	else
		stop_custom_song
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
		SpawnScriptNow GuitarEvent_SongFailed_Spawned params = {Player = <Player>}
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	disable_highway_prepass
	disable_bg_viewport
	lightshow_songfailed
	gman_songtool_getcurrentsong
	Change last_song_played = <current_song>
	Change \{dont_play_win_amim_sfx = 0}
	if ($is_network_game)
		KillSpawnedScript \{Name = dispatch_player_state}
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
			fadeintime = 5
			fadeintype = linear
			fadeouttime = 5
			fadeouttype = linear}
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		mark_unsafe_for_shutdown
	endif
	GetSongTimeMs
	Change failed_song_time = <time>
	gman_songtool_getcurrentsong
	if (<current_song> = doyoufeellikewedo)
		completion = 0
		songfilemanager func = get_song_end_time song_name = <current_song>
		if (<total_end_time> > 0)
			completion = (100 * $failed_song_time / <total_end_time>)
			if (<completion> > 95)
				getnumplayersingame \{local}
				getfirstplayer \{local}
				begin
				getplayerinfo <Player> controller
				fire_achievement Name = achievement_didyoufaillikewedid controller = <controller>
				getnextplayer Player = <Player> local
				repeat <num_players>
			endif
		endif
	endif
	PauseGame
	Progression_SongFailed
	end_singleplayer_game
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	endif
	UnPauseGame
	ui_event_wait_for_safe
	disable_pause
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	PlaySound \{$current_crowd_transition_neutral_to_negative
		buss = Crowd_Transitions}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	Transition_Play \{Type = songlost}
	Transition_Wait
	Change \{current_transition = None}
	PauseGame
	show_calibration = 0
	GetGlobalTags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
		<show_calibration> = 1
	endif
	getnumplayersingame
	if (<num_players> = 1)
		getfirstplayer
		getplayerinfo <Player> part
		if (<part> = vocals)
			show_calibration = 0
		endif
	endif
	if song_is_jamsession song = <current_song>
		show_calibration = 0
	endif
	gamemode_gettype
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		Wait \{1
			gameframe}
		if ui_event_exists_in_stack \{Name = 'pausemenu'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		elseif ui_event_exists_in_stack \{Name = 'song_unpause'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		endif
		gman_songtool_getcurrentsong
		if (<show_calibration> = 1)
			SetGlobalTags \{user_options
				params = {
					has_calibrated = 1
				}}
			Body = qs(0x24b45119)
			SpawnScriptNow {
				ui_event {
					params = {
						event = menu_change
						data = {
							state = uistate_options_calibrate_lag_warning
							Body = <Body>
							cancel_script = menu_replace_to_fail_song
							yes_func_params = {go_back_script = menu_replace_to_fail_song}
						}
					}
				}
			}
		else
			SpawnScriptNow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	elseif (<Type> = career)
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				SpawnScriptNow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_fail_song
						}
					}}
			else
				SpawnScriptNow \{ui_event
					params = {
						event = menu_change
						data = {
							state = uistate_fail_song
						}
					}}
			endif
		endif
	else
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				progression_updatedetailedstatsforgig \{failed_or_practice}
				if (<Type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						Change \{gameplay_loading_transition = 1}
						Change \{gameplay_restart_song = 1}
						Change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = Uistate_gameplay}
					else
						Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
							fadeintime = 5
							fadeintype = linear
							fadeouttime = 5
							fadeouttype = linear}
						SpawnScriptNow \{ui_event
							params = {
								event = menu_replace
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					SpawnScriptNow \{ui_event
						params = {
							event = menu_replace
							data = {
								state = uistate_song_breakdown_competitive
								net_transition
							}
						}}
				endif
			else
				progression_updatedetailedstatsforgig \{failed_or_practice}
				if (<Type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						Change \{gameplay_loading_transition = 1}
						Change \{gameplay_restart_song = 1}
						Change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = Uistate_gameplay}
					else
						SpawnScriptNow \{ui_event
							params = {
								event = menu_change
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					SpawnScriptNow \{ui_event
						params = {
							event = menu_change
							data = {
								state = uistate_song_breakdown_competitive
								net_transition
							}
						}}
				endif
			endif
		endif
	endif
	getnumplayersingame
	if (<num_players> = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
		SpawnScriptNow \{fail_song_crowd_logic}
		One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot}
	else
	endif
	if ($is_network_game)
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
			fadeintime = 5
			fadeintype = linear
			fadeouttime = 5
			fadeouttype = linear}
		mark_safe_for_shutdown
	endif
	kill_all_achievement_scripts
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript
gpulog_outputfilename = 'none'

script GuitarEvent_SongWon 
	Change \{finished_gig_band_rebuild = 0}
	if NotCD
		if ($output_gpu_log = 1)
			if isps3
				formatText \{TextName = FileName
					'%s_gpu_ps3'
					s = $current_level
					DontAssertForChecksums}
			else
				formatText \{TextName = FileName
					'%s_gpu'
					s = $current_level
					DontAssertForChecksums}
			endif
			if NOT stringequals \{a = $gpulog_outputfilename
					b = 'none'}
				<FileName> = $gpulog_outputfilename
			endif
			TextOutputEnd output_text FileName = <FileName>
		endif
		if ($output_song_stats = 1)
			gman_songtool_getcurrentsong
			formatText TextName = FileName '%s_stats' s = <current_song> DontAssertForChecksums
			TextOutputStart
			TextOutput \{text = qs(0x3f02a90c)}
			getplayerinfo \{1
				score}
			formatText TextName = text qs(0xfccb1331) s = <score> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				notes_hit}
			getplayerinfo \{1
				total_notes}
			formatText TextName = text qs(0x26c27108) n = <notes_hit> t = <total_notes> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				best_run}
			formatText TextName = text qs(0xd67d4308) r = <best_run> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				max_notes}
			formatText TextName = text qs(0x6bb1c560) m = <max_notes> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				base_score}
			formatText TextName = text qs(0x26a9ba16) b = <base_score> DontAssertForChecksums
			TextOutput text = <text>
			if (<base_score> = 0)
				formatText \{TextName = text
					qs(0x30357c57)}
			else
				formatText TextName = text qs(0xbcc2e990) s = (<score> / <base_score>) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (<total_notes> = 0)
				formatText \{TextName = text
					qs(0xc8e34ec5)}
			else
				formatText TextName = text qs(0x2b87036c) s = ((<notes_hit> / <total_notes>) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text FileName = <FileName>
		endif
	endif
	stopsongstarcalculation
	gameevent_songwon
	getnumplayersingame
	if (<num_players> = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 1)
			addtoplayerinfo 1 time_in_lead = (<time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 2)
			addtoplayerinfo 2 time_in_lead = (<time> - $last_time_in_lead)
		endif
		Change \{last_time_in_lead_player = -1}
	endif
	stop_custom_song
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_won
		}}
	restore_player_part_settings
	freeplay_end_of_song
	dynamicadmanager_issuecue \{cue = commitimpressions}
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	SpawnScriptNow \{GuitarEvent_SongWon_Spawned}
endscript

script GuitarEvent_SongWon_Spawned 
	gamemode_gettype
	Change \{dont_play_win_amim_sfx = 1}
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	gman_songtool_getcurrentsong
	Change last_song_played = <current_song>
	Change \{calibrate_lag_failed_num = 0}
	Change \{last_song_failed = None}
	Change \{current_song_failed_num = 0}
	songlist_remove_first_song_in_playlist
	<end_session> = 0
	if (<Type> = career)
		if progression_check_for_gig_end
			<end_session> = 1
		endif
	elseif (<Type> = quickplay)
		if quickplay_end_of_gig_list
			<end_session> = 1
		endif
	endif
	gman_songtool_getcurrentsong
	if (<current_song> = jamsession)
		getsonginfo
		if NOT (<file_id>.file_id [0] = 0 && <file_id>.file_id [1] = 0)
			jam_info = {
				file_id = (<file_id>.file_id)
			}
		endif
	endif
	if ($game_mode = practice)
		generic_event_choose \{state = uistate_song_breakdown
			data = {
				for_practice = 1
			}}
		return
	elseif ($game_mode = tutorial)
		generic_event_back \{state = uistate_tutorial_gameplay
			data = {
				return_from_gameplay = 1
				gameplay_complete = 1
			}}
		return
	endif
	if GotParam \{jam_info}
		OnExitRun songwon_writeleaderboardstats params = {song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session> jam_info = <jam_info>}
	else
		OnExitRun songwon_writeleaderboardstats params = {song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session>}
	endif
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($net_pause = 1)
			net_unpausegh
		endif
	endif
	Progression_EndCredits_Done
	PauseGame
	disable_pause
	should_cheer = FALSE
	if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $game_mode = gh4_p3_career || $game_mode = gh4_p4_career
			|| $game_mode = p2_coop
			|| $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay
		)
		should_cheer = true
	endif
	if ($game_mode = freeplay)
		SpawnScriptNow \{crowd_surge_and_sustain_at_end_of_song}
		SpawnScriptNow \{play_a_short_crowd_swell_for_this_venue}
		if freeplay_has_players
			should_cheer = true
		endif
	endif
	if (<should_cheer> = true)
		SpawnScriptNow \{cheer_before_explosion}
	endif
	printf \{channel = sfx
		qs(0x86224445)
		s = $current_crowd_looping_bg_area_good}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good}
	crowd_surge_and_sustain_at_end_of_song
	SpawnScriptNow \{You_Rock_Waiting_Crowd_SFX}
	Progression_SongWon
	if should_update_achievements
		song_won_update_achievements
	endif
	if (<Type> = competitive)
		song_breakdown_shreddfest_determine_order
		GetArraySize <order>
		if (<array_Size> > 0)
			<index> = 0
			<max_score> = -1
			<num_winners> = 0
			<winner_index> = 0
			begin
			if (<max_score> = -1)
				<max_score> = (<order> [<index>].band_result)
			endif
			if ((<order> [<index>].band_result) != <max_score>)
				break
			endif
			<winner_index> = (<order> [<index>].band_num)
			<index> = (<index> + 1)
			repeat <array_Size>
			<num_winners> = <index>
			if (<num_winners> > 1)
				winner_text = qs(0x82663fd9)
			else
				if gamemode_isteamgame
					getbandinfo <winner_index> Name
					<winner_text> = ($<Name>)
					<winner2_text> = qs(0xac712b20)
				else
					<winner_text> = qs(0xebdedfc6)
					getnumplayersingame
					if (<num_players> > 0)
						getfirstplayer
						begin
						if playerinfoequals <Player> Band = <winner_index>
							break
						endif
						getnextplayer Player = <Player>
						repeat
						getmaxplayers
						if (<Player> > 0 && <Player> <= <max_players>)
							if ($is_network_game = 1)
								getplayerinfo <Player> gamertag
								<winner_text> = ($<gamertag>)
							else
								formatText TextName = winner_text qs(0x06b38324) d = <Player>
							endif
							<winner2_text> = qs(0xac712b20)
						endif
					endif
				endif
			endif
		else
			winner_text = qs(0xebdedfc6)
		endif
	else
		winner_text = qs(0xebdedfc6)
	endif
	if (<Type> != freeplay)
		SpawnScriptNow \{waitandkillhighway}
		KillSpawnedScript \{Name = jiggle_text_array_elements}
		SpawnScriptNow \{wait_and_play_you_rock_movie}
		create_mushroomcloudhand text = <winner_text>
		SpawnScriptNow \{you_rock_script}
	else
		set_all_highway_prepass_props \{alpha = 0}
		set_all_highway_props \{alpha = 0
			time = 0.66}
	endif
	if GotParam \{winner2_text}
		SpawnScriptNow create_exploding_text params = {parent = 'you_rock_2_physics' text = <winner2_text> placement = bottom}
	endif
	Change \{old_song = None}
	if ($current_transition = preencore)
		end_song
		UnPauseGame
		Transition_Play \{Type = preencore}
		Transition_Wait
		Change \{current_transition = None}
		PauseGame
		ui_event_get_top
		if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_breakdown
					ENCORE_TRANSITION = 1
					no_sound
				}}
		else
			generic_event_choose \{no_sound
				state = uistate_song_breakdown
				data = {
					ENCORE_TRANSITION = 1
				}}
		endif
		ENCORE_TRANSITION = 1
	else
		played_song_outro = FALSE
		UnPauseGame
		if ($end_credits = 1)
			Transition_Play \{Type = finalbandoutro}
		else
			gamemode_gettype
			transition = songwon
			if (<Type> = freeplay)
				if NOT freeplay_has_players
					transition = songdoneattract
				else
					transition = songwonfreeplay
				endif
			endif
			Transition_Play Type = <transition>
			get_band_configuration song = <current_song>
			if (<Band> = default_band)
				celeb_band = FALSE
			else
				celeb_band = true
			endif
			if (((<Type> = career) && (<celeb_band> = FALSE)) || (<Type> = quickplay))
				if NOT ui_event_exists_in_stack \{Name = 'jam'}
					Transition_Wait
					Transition_Play \{Type = songoutro}
					played_song_outro = true
				endif
			endif
		endif
		Transition_Wait
		Change \{current_transition = None}
		if (<played_song_outro> = FALSE)
			CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_band'
				changenow
				transition_time = 5
				extra_params = {
					force_time = 5
				}}
		endif
		PauseGame
	endif
	KillSpawnedScript \{Name = create_exploding_text}
	if ($end_credits = 1)
		Change \{end_credits = 2}
	endif
	destroy_all_exploding_text
	if ($autotest_on = 1)
		ui_event \{event = menu_change
			data = {
				state = uistate_autotest_next_test
			}}
	endif
	if ($autolaunch_startnow = 1)
		prepare_for_pending_animpaks
		gman_songfunc \{func = switch_to_next_song_in_play_list
			params = {
				populate_list = true
			}}
		Change \{gameplay_loading_transition = 1}
		Change \{gameplay_restart_song = 1}
		Change \{net_ready_to_start = 0}
		generic_event_back \{nosound
			state = Uistate_gameplay}
	else
		if NOT GotParam \{ENCORE_TRANSITION}
			loading_transition = 0
			gamemode_gettype
			if (<Type> = career)
				if NOT gman_songfunc \{func = is_play_list_finished}
					gman_songfunc \{func = switch_to_next_song_in_play_list}
					loading_transition = 1
				endif
			elseif (<Type> = quickplay)
				stats_song_checksum = <current_song>
				if quickplay_set_new_song_in_gig_list
					loading_transition = 1
				endif
			elseif ((<Type> = pro_faceoff) || (<Type> = competitive))
				if quickplay_set_new_song_in_gig_list
					loading_transition = 1
				endif
			elseif (<Type> = freeplay)
				freeplay_next_song
				loading_transition = 1
			endif
			if (<loading_transition> = 1)
				Change \{gameplay_loading_transition = 1}
				Change \{gameplay_restart_song = 1}
				Change \{net_ready_to_start = 0}
				generic_event_back \{nosound
					state = Uistate_gameplay}
			else
				if ($is_network_game = 1 && <Type> != career)
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
						if (<Type> = quickplay)
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}}
						else
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown_competitive
									net_transition
								}}
						endif
					else
						if (<Type> = quickplay)
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown_competitive
									net_transition
								}}
						endif
					endif
				else
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
						if ((<Type> = pro_faceoff) || (<Type> = competitive))
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown_competitive
									end_of_setlist_transition
								}}
						else
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown
									end_of_setlist_transition
								}}
						endif
					else
						if ui_event_exists_in_stack \{Name = 'debug'}
							generic_event_back \{state = uistate_mainmenu}
						elseif ($game_mode = career)
							if gman_songfunc \{func = is_play_list_finished}
								if ($end_credits = 2)
									progression_getcreditsvenue
									ui_memcard_autosave_all_players {
										event = menu_back
										state = uistate_career_venue_select
										data = {
											load_venue_checksum = <credits_venue>
										}
									}
								else
									ui_event \{event = menu_change
										data = {
											state = uistate_song_breakdown
											end_of_setlist_transition
										}}
								endif
							else
								ui_event \{event = menu_change
									data = {
										state = uistate_song_breakdown
										add_setlist_continue_handlers
									}}
							endif
						elseif ((<Type> = pro_faceoff) || (<Type> = competitive))
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown_competitive
									end_of_setlist_transition
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									end_of_setlist_transition
								}}
						endif
					endif
				endif
			endif
		endif
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	if ($medley_mode_on)
		medley_reset
	endif
	kill_all_achievement_scripts
endscript

script songwon_writeleaderboardstats 
	RequireParams \{[
			song_checksum
			end_session
		]
		all}
	if ($invite_controller = -1)
		printf \{qs(0x68e97bc9)}
		printstruct <...>
		check_for_leaderboard_write song_checksum = <song_checksum> end_session = <end_session> end_credits = <end_credits>
		getnumplayersingame \{local
			out = temp_num_players_in_game}
		if (<temp_num_players_in_game> > 0)
			if (<end_credits> = 0)
				gamemode_gettype
				if (<Type> = career)
					if ($is_network_game = 1)
						if IsHost
							agora_update
						endif
					else
						agora_update
					endif
				endif
				if ($is_network_game = 1)
					if IsHost
						if GotParam \{jam_info}
							agora_write_stats song_checksum = <song_checksum> jam_info = <jam_info>
						else
							agora_write_stats song_checksum = <song_checksum>
						endif
					endif
				else
					if GotParam \{jam_info}
						agora_write_stats song_checksum = <song_checksum> jam_info = <jam_info>
					else
						agora_write_stats song_checksum = <song_checksum>
					endif
				endif
			endif
		endif
	endif
endscript

script kill_you_rock_movie 
	KillMovie \{textureSlot = 1}
endscript

script wait_and_play_you_rock_movie 
	begin
	if (isMoviePreLoaded textureSlot = 1)
		StartPreLoadedMovie \{textureSlot = 1}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script waitandkillhighway 
	Wait \{0.5
		Seconds}
	disable_bg_viewport \{no_cameras}
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf qs(0x267f53bc) d = <time_offset> channel = events
	songfilemanager func = get_num_timesig_notes song_name = <song_name>
	timesig_entry = 0
	timesig_size = <num_timesig_notes>
	timesig_num_val = 0
	timesig_den_val = 0
	measure_count = 0
	even = 1
	songfilemanager func = get_num_fretbar_notes song_name = <song_name>
	array_Size = <num_fretbar_notes>
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	Change \{next_beat_time = -1}
	Change \{time_to_next_beat = -1}
	Change \{next_beat_time2 = -1}
	Change \{time_to_next_beat2 = -1}
	Change tempo_iterator_offset = <time_offset>
	songfilemanager func = get_song_end_time song_name = <song_name>
	begin
	if (<array_Size> < 2)
		break
	endif
	<entry> = (<array_Size> -2)
	songfilemanager func = get_fretbar_note song_name = <song_name> index = <entry>
	if (<total_end_time> > <fretbar_time>)
		break
	endif
	<array_Size> = (<array_Size> - 1)
	repeat
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			songfilemanager func = get_timesig_note song_name = <song_name> index = <timesig_entry>
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			if (<timesig_time> <= <fretbar_time>)
				timesig_num_val = <timesig_num>
				timesig_den_val = <timesig_den>
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
		if ((<time> - <skipleadin>) < <fretbar_time>)
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num_val>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_Size>
		final_array_entry = (<array_Size> - 1)
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> > 0)
			begin
			begin
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			GetSongTimeMs
			if (<time> >= <fretbar_time>)
				GetSongTimeMs time_offset = <time_offset>
				if (<timesig_entry> < <timesig_size>)
					songfilemanager func = get_timesig_note song_name = <song_name> index = <timesig_entry>
					songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
					if (<timesig_time> <= <fretbar_time>)
						timesig_num_val = <timesig_num>
						timesig_den_val = <timesig_den>
						fretbar_count = 0
						timesig_entry = (<timesig_entry> + 1)
					endif
				endif
				if (<array_entry> < <final_array_entry>)
					songfilemanager func = get_beat_time song_name = <song_name> index = <array_entry>
					current_song_beat_time = <beat_time>
					setplayerinfo <Player> current_song_beat_time = <current_song_beat_time>
					setplayerinfo <Player> current_song_measure_time = (<timesig_num_val> * <current_song_beat_time>)
				endif
				break
			endif
			Wait \{1
				gameframe}
			repeat
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			marker = <fretbar_time>
			<array_entry> = (<array_entry> + 1)
			fretbar_count = (<fretbar_count> + 1)
			if (<fretbar_count> = <timesig_num_val>)
				measure_count = (<measure_count> + 1)
				fretbar_count = 0
				spawn_measure_callbacks
			endif
			if (<array_entry> < <final_array_entry>)
				songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
				Change next_beat_time = <fretbar_time>
				Change time_to_next_beat = ($next_beat_time - <marker>)
				spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
			else
				Change \{next_beat_time = -1}
				Change \{time_to_next_beat = -1}
			endif
			if (<even> = 1)
				<next_array_entry> = (<array_entry> + 1)
				if (<next_array_entry> < <final_array_entry>)
					songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
					Change next_beat_time2 = <fretbar_time>
					Change time_to_next_beat2 = ($next_beat_time2 - <marker>)
				else
					Change \{next_beat_time2 = -1}
					Change \{time_to_next_beat2 = -1}
				endif
				even = 0
			else
				even = 1
			endif
			repeat <array_Size>
		endif
	endif
endscript
measure_callback = nullscript
beat_callback = nullscript

script setmeasurecallback 
	if GotParam \{callback}
		Change measure_callback = <callback>
	else
	endif
endscript

script clearmeasurecallbacks 
	Change \{measure_callback = nullscript}
endscript

script setbeatcallback 
	if GotParam \{callback}
		Change beat_callback = <callback>
	else
	endif
endscript

script gettimetonextbeat 
	GetSongTimeMs \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script clearbeatcallbacks 
	Change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	SpawnScriptNow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	SpawnScriptNow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 
	printf \{channel = tempo
		qs(0x579a2ed4)}
endscript

script beat_test_script 
	printf channel = tempo qs(0x96bdbc92) a = <time_to_next_beat>
endscript

script GuitarEvent_StarSequenceBonus 
	addtoplayerinfo <Player> sp_phrases_hit = 1
	if isps3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Awarded_SFX}
			else
				SpawnScriptNow star_power_awarded_sfx_multiplayer params = {Player = <Player>}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = Star_Power_Awarded_SFX}
		else
			SpawnScriptNow star_power_awarded_sfx_multiplayer params = {Player = <Player>}
		endif
	endif
	formatText checksumName = container_id 'nowbar_container_p%p' p = <Player>
	getnowbarscale Player = <Player>
	player_index = (<Player> - 1)
	GetArraySize \{$gem_colors}
	inputarraygetelement Name = <song> index = <array_entry>
	destroy_big_bolt {Player = <Player> gem_array = <gem_array>}
	gem_count = 0
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		if (<gem_count> = (<array_Size> -1))
			if GotParam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		Color = ($gem_colors [<gem_count>])
		if playerinfoequals <Player> lefthanded_button_ups = 1
			<pos2d> = (($button_up_models [<player_index>]).<Color>.left_pos_2d)
			<angle> = (($button_models [<player_index>]).<Color>.angle)
		else
			<pos2d> = (($button_up_models [<player_index>]).<Color>.pos_2d)
			<angle> = (($button_models [<player_index>]).<Color>.left_angle)
		endif
		formatText checksumName = Name 'big_boltp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <Name>
			CreateScreenElement {
				Type = SpriteElement
				id = <Name>
				parent = <container_id>
				material = sys_Big_Bolt01_sys_Big_Bolt01
				rgba = [255 255 255 255]
				Pos = <pos2d>
				rot_angle = <angle>
				Scale = (1.0, 3.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
		formatText checksumName = nameh 'big_bolt_hitp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <nameh>
			CreateScreenElement {
				Type = SpriteElement
				id = <nameh>
				parent = <container_id>
				material = mat_sp_xplosion1
				rgba = [255 255 255 255]
				Pos = <pos2d>
				rot_angle = 0
				Scale = (2.0, 2.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
		formatText checksumName = fx_id 'big_bolt_particlep%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id>
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		formatText checksumName = hwy 'highway_containerp%p' p = <Player>
		if NOT ObjectExists id = <fx_id>
			Create2DParticleSystem {
				id = <fx_id>
				Pos = <particle_pos>
				z_priority = 8.0
				material = sys_Particle_Star01_sys_Particle_Star01
				parent = <container_id>
				start_color = [0 128 255 255]
				end_color = [0 128 128 0]
				start_scale = (0.25, 0.25)
				end_scale = (0.25, 0.25)
				start_angle_spread = 360.0
				min_rotation = -120.0
				max_rotation = 240.0
				emit_start_radius = 0.0
				emit_radius = 2.0
				Emit_Rate = 0.04
				emit_dir = 0.0
				emit_spread = 44.0
				velocity = 24.0
				friction = (0.0, 66.0)
				time = 2.0
			}
		endif
		formatText checksumName = fx2_id 'big_bolt_particle2p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT ObjectExists id = <fx2_id>
			Create2DParticleSystem {
				id = <fx2_id>
				Pos = <particle_pos>
				z_priority = 8.0
				material = mat_star03
				parent = <container_id>
				start_color = [255 255 255 128]
				end_color = [128 128 128 0]
				start_scale = (0.125, 0.125)
				end_scale = (0.15, 0.15)
				start_angle_spread = 360.0
				min_rotation = -120.0
				max_rotation = 508.0
				emit_start_radius = 0.0
				emit_radius = 2.0
				Emit_Rate = 0.07
				emit_dir = 0.0
				emit_spread = 28.0
				velocity = 12.0
				friction = (0.0, 33.0)
				time = 1.0
			}
		endif
		formatText checksumName = fx3_id 'big_bolt_particle3p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = (<particle_pos> - (0.0, 15.0))
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT ObjectExists id = <fx3_id>
			Create2DParticleSystem {
				id = <fx3_id>
				Pos = <particle_pos>
				z_priority = 8.0
				material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
				parent = <container_id>
				start_color = [255 255 255 255]
				end_color = [0 255 255 0]
				start_scale = (0.5, 0.5)
				end_scale = (0.05, 0.05)
				start_angle_spread = 360.0
				min_rotation = -500.0
				max_rotation = 500.0
				emit_start_radius = 0.0
				emit_radius = 2.0
				Emit_Rate = 0.05
				emit_dir = 0.0
				emit_spread = 180.0
				velocity = 12.0
				friction = (0.0, 12.0)
				time = 0.5
			}
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
	Wait \{$star_power_bolt_time
		Seconds}
	destroy_big_bolt {Player = <Player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	GetArraySize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		formatText checksumName = Name 'big_boltp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <Name>
		formatText checksumName = fx_id 'big_bolt_particlep%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		formatText checksumName = fx2_id 'big_bolt_particle2p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		formatText checksumName = fx3_id 'big_bolt_particle3p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx3_id> <kill_when_empty>
		formatText checksumName = nameh 'big_bolt_hitp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <nameh>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
endscript

script destroy_all_big_bolts 
	GetArraySize \{$gem_colors}
	Player = 0
	begin
	gem_count = 0
	begin
	formatText checksumName = Name 'big_boltp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	DestroyScreenElement id = <Name>
	formatText checksumName = fx_id 'big_bolt_particlep%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	formatText checksumName = fx2_id 'big_bolt_particle2p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	formatText checksumName = fx3_id 'big_bolt_particle3p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	Destroy2DParticleSystem id = <fx_id>
	Destroy2DParticleSystem id = <fx2_id>
	Destroy2DParticleSystem id = <fx3_id>
	formatText checksumName = nameh 'big_bolt_hitp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	DestroyScreenElement id = <nameh>
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
	Player = (<Player> + 1)
	repeat 4
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = <Player> multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = <Player> multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = <Player> multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	GH3_SFX_Stop_Sounds_For_KillSong <...> loading_transition = <loading_transition>
endscript

script guitarevent_venueenter 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	formatText checksumName = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT GlobalExists Name = <echo_params>
		echo_params = echo_crowd_buss_default_semiwet
	endif
	if NOT GlobalExists Name = <reverb_params>
		reverb_params = reverb_crowd_buss_default_semiwet
	endif
	setsoundbusseffects effects = [{$<echo_params> Name = crowd_w_reverb_buss_echo}]
	setsoundbusseffects effects = [{$<reverb_params> Name = crowd_w_reverb_buss_reverb}]
endscript

script guitarevent_venueexit 
	setsoundbusseffects \{effects = [
			{
				$echo_dry
				Name = crowd_w_reverb_buss_echo
			}
		]}
	setsoundbusseffects \{effects = [
			{
				$reverb_dry
				Name = crowd_w_reverb_buss_reverb
			}
		]}
endscript

script GuitarEvent_CreateFirstGem 
	SpawnScriptNow first_gem_fx params = {<...>}
endscript

script first_gem_fx 
	if GotParam \{is_white_gem}
		return
	endif
	ExtendCrc <gem_id> '_particle' out = fx_id
	if GotParam \{is_star}
		<Pos> = (255.0, 170.0)
	else
		<Pos> = (66.0, 20.0)
	endif
	DestroyScreenElement id = <fx_id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <gem_id>
		id = <fx_id>
		Scale = (1.0, 1.0)
		Pos = <Pos>
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		z_priority = 18
		rgba = [255 255 255 255]
	}
	SpawnScriptNow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	Wait \{0.8
		Seconds}
	DestroyScreenElement id = <fx_id>
endscript

script destroy_first_gem_fx 
	begin
	if NOT ScreenElementExists id = <gem_id>
		DestroyScreenElement id = <fx_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script GuitarEvent_TransitionEncore 
endscript
kick_index = 0

script guitarevent_kick_drum_hit_note \{Player = 1}
	Change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		Change \{kick_index = 0}
	endif
	extendedchecksum = NULL
	<highway_info> = ($highway_pos_table [<Player> -1])
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthOffsetFactor)) / 32.0)
	extendcrcwithinteger checksum = highway_containerp integer = <Player>
	container_id = <extendedchecksum>
	getnowbarscale Player = <Player>
	<x_scale> = (<x_scale> * <nowbar_x_scale>)
	Wait \{1
		Frame}
	<particle_pos> = (0.0, 630.0)
	extendcrcwithinteger checksum = kick_particlep integer = <Player>
	extendcrcwithinteger checksum = <extendedchecksum> integer = $kick_index
	fx_id = <extendedchecksum>
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 0.25))
	<end_scale> = (<x_scale> * (1.875, 0.0) + (0.0, 0.5))
	Create2DParticleSystem {
		id = <fx_id>
		Pos = <particle_pos>
		z_priority = 7.9
		material = mat_particle_kickhit_ring01
		parent = <container_id>
		start_color = [255 128 0 255]
		end_color = [0 0 0 0]
		start_scale = <start_scale>
		end_scale = <end_scale>
		start_angle_spread = 0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.1
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.25
		friction = (0.0, 10.0)
		time = 0.2
	}
	getplayerinfo <Player> part
	if (<part> = drum)
		getplayerinfo <Player> four_lane_highway
	else
		four_lane_highway = 0
	endif
	if (<four_lane_highway> = 1)
		extendcrcwithinteger checksum = kick_particle2p integer = <Player>
		extendcrcwithinteger checksum = <extendedchecksum> integer = $kick_index
		fx2_id = <extendedchecksum>
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = mat_particle_kickhit_4l
			parent = <container_id>
			start_color = [255 200 128 255]
			end_color = [255 100 0 0]
			start_scale = <start_scale>
			end_scale = <end_scale>
			start_angle_spread = 0
			min_rotation = 0
			max_rotation = 0
			emit_start_radius = 0.0
			emit_radius = 1.0
			Emit_Rate = 0.1
			emit_dir = 0.0
			emit_spread = 0
			velocity = 0.25
			friction = (0.0, 0.0)
			time = 0.2
		}
		Wait \{11
			frames}
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
	else
		extendcrcwithinteger checksum = kick_particle2p integer = <Player>
		extendcrcwithinteger checksum = <extendedchecksum> integer = $kick_index
		fx2_id = <extendedchecksum>
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = mat_particle_kickhit_5l
			parent = <container_id>
			start_color = [255 200 128 255]
			end_color = [255 100 0 0]
			start_scale = <start_scale>
			end_scale = <end_scale>
			start_angle_spread = 0
			min_rotation = 0
			max_rotation = 0
			emit_start_radius = 0.0
			emit_radius = 1.0
			Emit_Rate = 0.1
			emit_dir = 0.0
			emit_spread = 0
			velocity = 0.25
			friction = (0.0, 0.0)
			time = 0.2
		}
		Wait \{11
			frames}
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
	endif
endscript

script guitarevent_hit_open_note 
	guitarevent_kick_drum_hit_note Player = <Player>
endscript

script guitarevent_hit_beginner_note 
	guitarevent_kick_drum_hit_note Player = <Player>
endscript

script guitarevent_gigstarted 
endscript

script guitarevent_gigfailed 
endscript

script guitarevent_gigwon 
endscript

script guitarevent_gigquit 
endscript

script playersetvolume 
	if playerinfoequals <Player> part = drum
		if GotParam \{include_drums}
			setalldrumstates Player = <Player> Volume = <Volume>
		endif
	else
		setplayerinfo <Player> guitar_volume = <Volume>
		UpdateGuitarVolume
	endif
endscript

script playergetvolume 
	if playerinfoequals <Player> part = drum
		if GotParam \{drum}
			switch <drum>
				case 1
				getplayerinfo <Player> drum_volume1
				return Volume = <drum_volume1>
				case 2
				getplayerinfo <Player> drum_volume2
				return Volume = <drum_volume2>
				case 3
				getplayerinfo <Player> drum_volume3
				return Volume = <drum_volume3>
				case 4
				getplayerinfo <Player> drum_volume4
				return Volume = <drum_volume4>
			endswitch
		endif
	endif
	getplayerinfo <Player> guitar_volume
	return Volume = <guitar_volume>
endscript

script create_mushroomcloudhand \{text = qs(0x6f6d143d)}
	destroy_all_exploding_text
	SpawnScriptNow create_exploding_text params = {text = <text>}
	if ScreenElementExists \{id = mushroomcloudhand}
		DestroyScreenElement \{id = mushroomcloudhand}
	endif
	CreateScreenElement \{parent = root_window
		id = mushroomcloudhand
		Type = descinterface
		desc = 'you_rock_gh5'
		z_priority = 0}
	SpawnScriptNow \{handofgod_fx_01}
	SpawnScriptNow \{handofgod_fx_02}
	if mushroomcloudhand :desc_resolvealias \{Name = alias_horns}
		mushroomcloudhand :Obj_SpawnScriptNow {
			generic_alpha_fade_animation
			params = {
				container_id = <resolved_id>
				loop_start_index = 5
				loop_end_index = 8
				num_loops = 3
				alpha_time = 0.15
				reverse_loop
			}
		}
	endif
	DestroyScreenElement \{id = mushroomcloudhand}
endscript

script hot_start_achieved \{Band = 0}
	return
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	if (<Player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if isSinglePlayerGame
			Pos = (640.0, 211.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_SinglePlayer params = {combo = <combo>}
		elseif ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (415.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (865.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		endif
	endif
	if NOT gamemode_isbandscoring
		getplayerinfo <Player> part
		if (<part> = vocals)
			vocals_message_delayed {Player = <Player> text = qs(0x09a07a71) rgba = [255 172 64 255]}
		else
			hud_create_message Player = <Player> text = qs(0x09a07a71)
		endif
	elseif (<Band> = 1)
		array = []
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			AddArrayElement array = <array> element = <Player>
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		GetArraySize array = <array>
		if (<array_Size> > 0)
			hud_create_message Band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <array>}
		endif
	endif
endscript

script hud_animate_star_meter_flames 
	SpawnScriptNow \{son_of_hud_animate_star_meter_flames}
endscript

script son_of_hud_animate_star_meter_flames 
	hud_root :desc_resolvealias \{Name = alias_hud_meter_star
		param = id}
	<id> :desc_resolvealias Name = alias_band_hud_star_frame param = band_hud_star_frame_cont
	DestroyScreenElement \{id = star_meter_counter_glow01}
	CreateScreenElement {
		Type = SpriteElement
		id = star_meter_counter_glow01
		parent = <band_hud_star_frame_cont>
		material = mat_meter_wibble_glow
		rgba = [255 200 64 0]
		dims = (128.0, 128.0)
		Pos = (64.0, 64.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = 12
	}
	formatText \{checksumName = smcfx1
		'Star_Meter_Counter_FX'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <smcfx1>
	Create2DParticleSystem {
		id = <smcfx1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <band_hud_star_frame_cont>
		start_color = [255 255 128 255]
		end_color = [255 128 0 0]
		start_scale = (0.25, 0.25)
		end_scale = (0.0, 0.0)
		start_angle_spread = 0.0
		min_rotation = -180
		max_rotation = 360
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0150999995
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.25
	}
	if ScreenElementExists \{id = star_meter_counter_glow01}
		star_meter_counter_glow01 :se_setprops \{rgba = [
				255
				200
				64
				255
			]
			time = 0.15}
	endif
	Wait \{0.15
		Second}
	Destroy2DParticleSystem kill_when_empty id = <smcfx1>
	if ScreenElementExists \{id = star_meter_counter_glow01}
		star_meter_counter_glow01 :se_setprops \{rgba = [
				255
				200
				64
				0
			]
			time = 0.5}
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement \{id = star_meter_counter_glow01}
endscript

script reset_song_loading_hack_global 
	Change \{transition_song_loading_hack = 1}
endscript

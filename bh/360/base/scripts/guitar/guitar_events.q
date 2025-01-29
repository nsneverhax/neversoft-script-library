guitar_events = [
	{
		type = call
		event = missed_note
		Scr = GuitarEvent_MissedNote
	}
	{
		type = call
		event = unnecessary_note
		Scr = GuitarEvent_UnnecessaryNote
	}
	{
		type = call
		event = hit_notes
		Scr = GuitarEvent_HitNotes
	}
	{
		type = call
		event = hit_note
		Scr = GuitarEvent_HitNote
	}
	{
		type = call
		event = drumfill_hit
		Scr = GuitarEvent_DrumFillHit
	}
	{
		type = call
		event = star_power_on
		Scr = GuitarEvent_StarPowerOn
	}
	{
		type = call
		event = star_power_off
		Scr = GuitarEvent_StarPowerOff
	}
	{
		type = spawn
		event = song_failed
		Scr = GuitarEvent_SongFailed
	}
	{
		type = spawn
		event = song_won
		Scr = GuitarEvent_SongWon
	}
	{
		type = spawn
		event = star_sequence_bonus
		Scr = GuitarEvent_StarSequenceBonus
	}
	{
		type = call
		event = whammy_on
		Scr = GuitarEvent_WhammyOn
	}
	{
		type = call
		event = whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		type = call
		event = ext_whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		type = spawn
		event = note_window_open
		Scr = GuitarEvent_Note_Window_Open
	}
	{
		type = spawn
		event = note_window_close
		Scr = GuitarEvent_Note_Window_Close
	}
	{
		type = call
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
]

script create_guitar_events 
	printf qs(0xf3da5047) a = <player>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	event = ($guitar_events [<array_entry>].event)
	type = ($guitar_events [<array_entry>].type)
	ExtendCrcPlayer <event> <player> out = event
	if (<type> = spawn)
		SetEventHandler response = call_script event = <event> Scr = event_spawner params = {event_spawned = <array_entry>}
	else
		Scr = ($guitar_events [<array_entry>].Scr)
		SetEventHandler response = call_script event = <event> Scr = <Scr>
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	Block
endscript

script event_spawner 
	spawnscriptnow ($guitar_events [<event_spawned>].Scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs(0x5fa77966) d = <time_offset> e = <event_string> channel = events
	get_song_prefix song = <song_name>
	FormatText checksumname = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup = true
	array_entry = 0
	if NOT GlobalExists name = <song> type = array
		if (<event_string> != 'scriptevents')
			ScriptAssert 'Array %s does not exist' s = <song>
		endif
		return
	endif
	if ($medley_mode_on)
		return
	endif
	GetArraySize $<song>
	if (<array_size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry> ArrayOfStructures
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	scriptname = ($<song> [<array_entry>].Scr)
	if ScriptExists <scriptname>
		spawnscriptnow <scriptname> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif SymbolIsCFunc <scriptname>
		<scriptname> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script GuitarEvent_MissedNote \{extended_miss = 0}
	if ($calibrate_lag_enabled = 1)
		spawnscriptnow \{calibration_highway_miss_note}
	endif
	if (<bum_note> = 1)
		Guitar_Wrong_Note_Sound_Logic <...>
	endif
	GetPlayerInfo <player> is_local_client
	GetPlayerInfo <player> part
	ProcessEvent_Note_Miss <...>
	if ($is_network_game && <is_local_client> = 0)
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player = <player>}
		endif
	elseif ($single_stream_enabled = 1)
		musicstudio_update_volume_for_playback off player = <player>
	else
		if NOT (<part> = Drum)
			PlayerGetVolume player = <player>
			if NOT (<volume> = 0)
				if (<silent_miss> = 1)
					spawnscriptnow highway_pulse_black params = {player = <player>}
				else
					if NOT (<extended_miss> = 1)
						if ($single_stream_enabled = 0)
							PlayerSetVolume player = <player> volume = 0
							UpdateGuitarVolume
						endif
					endif
				endif
			endif
		endif
		GMan_SongTool_GetCurrentSong
		if (<current_song> = jamsession)
			musicstudio_update_volume_for_playback off player = <player>
		endif
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			GetPlayerInfo <player> band_member
			if CompositeObjectExists name = <band_member>
				if (<part> = guitar || <part> = bass)
					BandManager_MissedNote name = <band_member>
				endif
			endif
		endif
	endif
	InputArrayGetElement name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) Color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	ExtendCrcPlayer out = highway Highway_2D <player>
	LegacyDoScreenElementMorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	if PlayerInfoEquals <player> star_power_used = 1
		LegacyDoScreenElementMorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		LegacyDoScreenElementMorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	if ($calibrate_lag_enabled = 1)
		return
	endif
	Guitar_Wrong_Note_Sound_Logic <...>
	GetPlayerInfo <player> is_local_client
	if NOT ($is_network_game && (<is_local_client> = 0))
		PlayerSetVolume player = <player> volume = 0
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback off player = <player> unnecessarynote = 1
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			GetPlayerInfo <player> band_member
			if CompositeObjectExists name = <band_member>
				GetPlayerInfo <player> part
				if (<part> = guitar || <part> = bass)
					LaunchEvent type = Anim_MissedNote target = (<band_member>)
				endif
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			InputArrayGetElement name = <song> index = <array_entry>
			next_note = (<gem_array> [0])
			InputArrayGetElement name = <song> index = (<array_entry> -1)
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
	GetPlayerInfo <player> part
	ProcessEvent_Note_Hit <...>
	if ($show_play_log = 1 || $calibrate_lag_enabled = 1)
		get_lag_values
		<off_note> = (0 - (<off_note> - ($time_input_offset - <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		if ($calibrate_lag_enabled = 1)
			AddArrayElement array = $calibrate_history_times element = <off_note>
			Change calibrate_history_times = <array>
		endif
		if ($show_play_log = 1)
			InputArrayGetElement name = <song> index = <array_entry>
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
		musicstudio_update_volume_for_playback on player = <player>
	endif
endscript

script GuitarEvent_HitNote 
	if (($highwayvisible) = on)
		spawnscriptnow GuitarEvent_HitNote_Spawned params = {<...>}
	endif
endscript

script GuitarEvent_HitNote_Spawned 
	GetNowBarScale player = <player>
	if ($calibrate_lag_enabled = 1)
		spawnscriptnow \{calibration_highway_hit_note}
	endif
	if GotParam \{kick}
		GuitarEvent_Kick_Drum_Hit_Note player = <player>
	elseif GotParam \{open_note}
		GuitarEvent_Hit_Open_Note player = <player>
	elseif GotParam \{beginner_note}
		GuitarEvent_Hit_Beginner_Note player = <player>
	else
		wait \{1
			gameframe}
		scale = (3.0, 3.0)
		star_power_used = 0
		if PlayerInfoEquals player = <player> star_power_used = 1
			<star_power_used> = 1
		endif
		<Pos> = ((<Pos>.(1.0, 0.0) * (1.0, 0.0)) + ((<Pos>.(0.0, 1.0) + 25) * (0.0, 1.0)))
		<particle_pos> = (((<nowbar_x_scale> * (<Pos> [0])) * (1.0, 0.0)) + ((<nowbar_y_scale> * (<Pos> [1]) + 30) * (0.0, 1.0)))
		NoteFX <...> star = <star_power_used> name = <fx_id>
	endif
endscript

script GuitarEvent_HitNote_Kill_Spawned 
	if GotParam \{particle_id2}
		wait \{0.1
			seconds}
		Destroy2DParticleSystem id = <particle_id> kill_when_empty
		Destroy2DParticleSystem id = <particle_id2> kill_when_empty
		Destroy2DParticleSystem id = <particle_id3> kill_when_empty
		wait \{1.15
			seconds}
		DestroyGemElement id = <fx_id>
	else
		wait \{4
			gameframes}
		Destroy2DParticleSystem id = <particle_id> kill_when_empty
		wait \{10
			gameframes}
		DestroyGemElement id = <fx_id>
	endif
endscript

script GuitarEvent_DrumFillHit 
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
	material = Mat_Velocity_shatter_fx
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
	material = Mat_Velocity_shatter_fx1
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
	material = Mat_Velocity_shatter_fx2
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

script Drum_Accent_Hit_particle_FX 
	FormatText checksumname = container_id 'nowbar_container_p%p' p = <player>
	GetNowBarScale player = <player>
	<particle_pos> = (((<nowbar_x_scale> * (<Pos> [0])) * (1.0, 0.0)) + ((<nowbar_y_scale> * (<Pos> [1])) * (0.0, 1.0)))
	GetPlayerInfo player = <player> star_power_used
	FormatText checksumname = name 'hit_accent%p' p = <player> AddToStringLookup = true
	if (<star_power_used> = 0)
		if ScreenElementExists id = <name>
			DestroyScreenElement id = <name>
		endif
		CreateScreenElement {
			type = SpriteElement
			id = <name>
			parent = <container_id>
			material = Mat_Note_hit_Xplosion1
			rgba = [255 255 255 255]
			Pos = <Pos>
			rot_angle = (0)
			scale = (2.0, 2.0)
			just = [center bottom]
			z_priority = 6
		}
	else
		if ScreenElementExists id = <name>
			DestroyScreenElement id = <name>
		endif
		CreateScreenElement {
			type = SpriteElement
			id = <name>
			parent = <container_id>
			material = Mat_Note_hit_Xplosion1
			rgba = [0 128 255 255]
			Pos = <Pos>
			rot_angle = (0)
			scale = (2.0, 2.0)
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
		material = Mat_Velocity_shatter_fx
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
		material = Mat_Velocity_shatter_fx1
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
		material = Mat_Velocity_shatter_fx2
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
	wait \{0.1
		seconds}
	Destroy2DParticleSystem id = <particle1_id> kill_when_empty
	Destroy2DParticleSystem id = <particle2_id> kill_when_empty
	Destroy2DParticleSystem id = <particle3_id> kill_when_empty
	wait \{1.15
		seconds}
	DestroyScreenElement id = <name>
endscript

script shake_highway2 
	printf \{channel = zdebug
		qs(0x87e07a9f)}
	FormatText checksumname = container_id 'highway_containerp%p' p = <player> AddToStringLookup = true
	if NOT ScreenElementExists id = <container_id>
		return
	endif
	GetScreenElementPosition id = <container_id>
	original_position = <ScreenElementPos>
	shake_frequency = 0.05
	pulse_on = 0
	begin
	if NOT ScreenElementExists id = <container_id>
		return
	endif
	if (<pulse_on> = 0)
		LegacyDoScreenElementMorph {
			id = <container_id>
			Pos = (<original_position> + (0.0, 10.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 1
	else
		LegacyDoScreenElementMorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 0
	endif
	wait \{1
		gameframes}
	repeat 2
endscript

script shake_highway3 
	printf \{channel = zdebug
		qs(0x9efb4bde)}
	FormatText checksumname = container_id 'highway_containerp%p' p = <player> AddToStringLookup = true
	GetScreenElementPosition id = <container_id>
	original_position = <ScreenElementPos>
	shake_frequency = 0.05
	pulse_on = 0
	begin
	if (<pulse_on> = 0)
		LegacyDoScreenElementMorph {
			id = <container_id>
			Pos = (<original_position> + (0.0, 1.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 1
	else
		LegacyDoScreenElementMorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 0
	endif
	wait \{1
		gameframes}
	repeat 2
endscript

script GuitarEvent_StarPowerOn 
	killspawnedscript \{name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		GH_Star_Power_Verb_On player = <player>
	endif
	FormatText checksumname = scriptID 'p%p_StarPower_StageFX' p = <player>
	StarPowerOn player = <player>
	LightShow_SetParams \{mood = StarPower}
	Change \{lightshow_allow_mood_changes = false}
	GetNumPlayersInGame
	if (<num_players> = 4)
		if (all_players_using_starpower)
			spawnscriptnow \{play_group_star_power_animation}
		endif
	endif
endscript

script GuitarEvent_StarPowerOff \{no_sound = false}
	killspawnedscript \{name = highway_pulse_black}
	if (<no_sound> = false)
		if IsPS3
			if NOT ($current_song = jamsession)
				if isSinglePlayerGame
					SoundEvent \{event = Star_Power_Release_Front_GH4}
				else
					spawnscriptnow Star_Power_Release_SFX_Multiplayer params = {player = <player>}
				endif
			endif
		else
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Release_Front_GH4}
			else
				spawnscriptnow Star_Power_Release_SFX_Multiplayer params = {player = <player>}
			endif
		endif
	endif
	GH_Star_Power_Verb_Off player = <player>
	spawnscriptnow rock_meter_star_power_off params = {player = <player>}
	spawnscriptlater Kill_StarPower_StageFX params = {<...>}
	FormatText checksumname = cont 'starpower_container_leftp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		LegacyDoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = cont 'starpower_container_rightp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		LegacyDoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = highway 'Highway_2Dp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	spawnscriptnow \{Kill_StarPower_Camera}
	Change \{lightshow_allow_mood_changes = true}
	if ($lightshow_last_mood_requested != None)
		LightShow_SetParams \{mood = $lightshow_last_mood_requested}
	endif
endscript

script GuitarEvent_PreFretbar 
	spawnscriptnow \{GH_Audible_Metronome}
	waittime = 0.25
	get_song_tempo_cfunc
	wait <waittime> seconds
	GetPlayerInfo \{1
		star_power_used
		out = star_power_used1}
	GetPlayerInfo \{2
		star_power_used
		out = star_power_used2}
	GetPlayerInfo \{3
		star_power_used
		out = star_power_used3}
	GetPlayerInfo \{4
		star_power_used
		out = star_power_used4}
	if ((<star_power_used1> = 1) || (<star_power_used2> = 1) || (<star_power_used3> = 1) || (<star_power_used4> = 1))
		if ($Clap_Fade = 1)
			printf \{channel = sfx
				qs(0x784a1ce5)}
			Change \{Clap_Fade = 0}
			spawnscriptnow \{Clap_Fade_Kill}
		endif
		if ($game_mode != tutorial)
			if (($Star_Clap_Normal = 1) || ($Star_Clap_LeftCenterRight = 1))
				printf \{qs(0xfe00cc6d)}
				SoundEvent \{event = $Current_Crowd_Clap_Normal_SoundEvent}
				if (($Star_Power_Delay = 1) && ((<beat> = 1) || (<beat> = 3)))
					SoundEvent \{event = Star_Power_Delay_Normal}
				endif
			elseif ($Star_Clap_Middle = 1)
				printf \{qs(0x3af3642a)}
				SoundEvent \{event = $Current_Crowd_Clap_Middle_SoundEvent}
				if (($Star_Power_Delay = 1) && ((<beat> = 1) || (<beat> = 3)))
					SoundEvent \{event = Star_Power_Delay_Middle}
				endif
			elseif ($Star_Clap_Left = 1)
				printf \{qs(0x4ac89455)}
				SoundEvent \{event = $Current_Crowd_Clap_Left_SoundEvent}
				if (($Star_Power_Delay = 1) && ((<beat> = 1) || (<beat> = 3)))
					SoundEvent \{event = Star_Power_Delay_Left}
				endif
			elseif ($Star_Clap_Right = 1)
				printf \{qs(0x8bfb9430)}
				SoundEvent \{event = $Current_Crowd_Clap_Right_SoundEvent}
				if (($Star_Power_Delay = 1) && ((<beat> = 1) || (<beat> = 3)))
					SoundEvent \{event = Star_Power_Delay_Right}
				endif
			elseif ($Star_Clap_Right_Middle = 1)
				printf \{qs(0xbc1479cf)}
				SoundEvent \{event = $Current_Crowd_Clap_Right_Middle_SoundEvent}
				if (($Star_Power_Delay = 1) && ((<beat> = 1) || (<beat> = 3)))
					SoundEvent \{event = Star_Power_Delay_Right_Middle}
				endif
			elseif ($Star_Clap_Left_Middle = 1)
				printf \{qs(0x492c71b5)}
				SoundEvent \{event = $Current_Crowd_Clap_Left_Middle_SoundEvent}
				if (($Star_Power_Delay = 1) && ((<beat> = 1) || (<beat> = 3)))
					SoundEvent \{event = Star_Power_Delay_Left_Middle}
				endif
			endif
		endif
	elseif ($Clap_Fade = 1)
		printf \{channel = sfx
			qs(0xe4391755)}
		if ($Star_Clap_Normal = 1)
			printf \{qs(0xfe00cc6d)}
			SoundEvent \{event = $Current_Crowd_Clap_Normal_SoundEvent}
		elseif ($Star_Clap_Middle = 1)
			printf \{qs(0x3af3642a)}
			SoundEvent \{event = $Current_Crowd_Clap_Middle_SoundEvent}
		elseif ($Star_Clap_Left = 1)
			printf \{qs(0x4ac89455)}
			SoundEvent \{event = $Current_Crowd_Clap_Left_SoundEvent}
		elseif ($Star_Clap_Right = 1)
			printf \{qs(0xc4a697e0)}
			SoundEvent \{event = $Current_Crowd_Clap_Right_SoundEvent}
		elseif ($Star_Clap_Right_Middle = 1)
			printf \{qs(0xbc1479cf)}
			SoundEvent \{event = $Current_Crowd_Clap_Right_Middle_SoundEvent}
		elseif ($Star_Clap_Left_Middle = 1)
			printf \{qs(0x492c71b5)}
			SoundEvent \{event = $Current_Crowd_Clap_Left_Middle_SoundEvent}
		endif
	else
		if ($CrowdListenerStateClapOn1234 = 1)
			if ($Star_Clap_Normal = 1)
				printf \{qs(0xfe00cc6d)}
				SoundEvent \{event = $Current_Crowd_Clap_Normal_SoundEvent}
			elseif ($Star_Clap_Middle = 1)
				printf \{qs(0x3af3642a)}
				SoundEvent \{event = $Current_Crowd_Clap_Middle_SoundEvent}
			elseif ($Star_Clap_Left = 1)
				printf \{qs(0x4ac89455)}
				SoundEvent \{event = $Current_Crowd_Clap_Left_SoundEvent}
			elseif ($Star_Clap_Right = 1)
				printf \{qs(0xc4a697e0)}
				SoundEvent \{event = $Current_Crowd_Clap_Right_SoundEvent}
			elseif ($Star_Clap_Right_Middle = 1)
				printf \{qs(0xbc1479cf)}
				SoundEvent \{event = $Current_Crowd_Clap_Right_Middle_SoundEvent}
			elseif ($Star_Clap_Left_Middle = 1)
				printf \{qs(0x492c71b5)}
				SoundEvent \{event = $Current_Crowd_Clap_Left_Middle_SoundEvent}
			endif
		endif
	endif
	spawnscriptnow \{Crowd_Anticipation}
endscript

script GH_Audible_Metronome 
	if ($Debug_Audible_Metronome = 1)
		wait ((0.25 + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) - 0.008333) seconds
		SoundEvent \{event = GH_SFX_BeatSoundEvent}
	endif
endscript

script GuitarEvent_Fretbar 
	GuitarEvent_Fretbar_CFunc
endscript

script GuitarEvent_Fretbar_Early 
endscript

script GuitarEvent_Fretbar_Late 
endscript

script check_first_note_formed 
	GetSongTime
	<starttime> = (<songtime> - 0.0167)
	GetPlayerInfo <player> check_time_early
	GetPlayerInfo <player> check_time_late
	Duration = (<check_time_early> + <check_time_late>)
	begin
	GetPlayerInfo <player> controller
	GetHeldPattern controller = <controller> player = <player>
	if (<Strum> = <hold_pattern>)
		PlayerSetVolume player = <player> volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback on player = <player>
	endif
	wait \{1
		gameframe}
	GetSongTime
	if ((<songtime> - <starttime>) >= <Duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	GetPlayerInfo <player> controller
	if isguitarcontroller controller = <controller>
		GetStrumPattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {Strum = <Strum> player = <player>}
	else
		PlayerSetVolume player = <player> volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback on player = <player>
	endif
endscript

script GuitarEvent_Note_Window_Open 
	if ($Debug_Audible_Open = 1)
		value = (($check_time_early + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) + 0.008333)
		printf channel = sfx qs(0x73307931) s = <value>
		wait (($check_time_early + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) + 0.008333) seconds
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
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		WhammyFXOffAll player = <player>
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script GuitarEvent_WhammyOn 
	if (($highwayvisible) = on)
		WhammyFXOn <...>
	endif
endscript

script GuitarEvent_WhammyOff 
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	GameMode_GetType
	if (<type> = freeplay || <type> = practice || <type> = tutorial)
		return
	endif
	if ($calibrate_lag_enabled = 1)
		return
	endif
	if ($failed_song = 1)
		return
	endif
	if (($Cheat_Invincible = 1) && ($is_network_game != 1))
		return
	endif
	Change \{failed_song = 1}
	GameEvent_SongFailed
	restore_player_part_settings
	DynamicAdManager_IssueCue \{Cue = CommitImpressions}
	if ($is_network_game)
		online_fail_song
	else
		stop_custom_song
		killspawnedscript \{name = guitar_jam_drum_playback}
		killspawnedscript \{name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		killspawnedscript \{name = GuitarEvent_SongWon_Spawned}
		spawnscriptnow GuitarEvent_SongFailed_Spawned params = {player = <player>}
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	disable_highway_prepass
	disable_bg_viewport
	GMan_SendCallbackToAllGoals \{suffix = 'song_complete'
		callback_data = {
			event = song_failed
		}}
	LightShow_SongFailed
	GMan_SongTool_GetCurrentSong
	Change last_song_played = <current_song>
	Change \{dont_play_win_amim_sfx = 0}
	if ($is_network_game)
		ui_event_get_top
		if (<base_name> = 'controller_disconnect')
			generic_event_back
		endif
		killspawnedscript \{name = dispatch_player_state}
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
	GMan_SongTool_GetCurrentSong
	PauseGame
	Progression_SongFailed
	end_singleplayer_game
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	endif
	UnpauseGame
	ui_event_wait_for_safe
	disable_pause
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	PlaySound \{$Current_Crowd_Transition_Neutral_To_Negative
		buss = Crowd_Transitions}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	Transition_Play \{type = songlost}
	Transition_Wait
	Change \{current_transition = None}
	PauseGame
	show_calibration = 0
	GetGlobalTags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
		<show_calibration> = 1
	endif
	GetNumPlayersInGame
	if (<num_players> = 1)
		GetFirstPlayer
		GetPlayerInfo <player> part
		if (<part> = vocals)
			show_calibration = 0
		endif
	endif
	if song_is_jamsession song = <current_song>
		show_calibration = 0
	endif
	GameMode_GetType
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		wait \{1
			gameframe}
		if ui_event_exists_in_stack \{name = 'pausemenu'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		elseif ui_event_exists_in_stack \{name = 'song_unpause'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		endif
		GMan_SongTool_GetCurrentSong
		if (<show_calibration> = 1)
			SetGlobalTags \{user_options
				params = {
					has_calibrated = 1
				}}
			Body = qs(0x24b45119)
			spawnscriptnow {
				ui_event {
					params = {
						event = menu_change
						data = {
							state = UIstate_options_calibrate_lag_warning
							Body = <Body>
							cancel_script = menu_replace_to_fail_song
							yes_func_params = {go_back_script = menu_replace_to_fail_song}
						}
					}
				}
			}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = UIstate_fail_song
					}
				}}
		endif
	elseif (<type> = career)
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				spawnscriptnow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = UIstate_fail_song
						}
					}}
			else
				spawnscriptnow \{ui_event
					params = {
						event = menu_change
						data = {
							state = UIstate_fail_song
						}
					}}
			endif
		endif
	else
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				Progression_UpdateDetailedStatsForGig \{failed_or_practice}
				if (<type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						Change \{gameplay_loading_transition = 1}
						Change \{gameplay_restart_song = 1}
						Change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = uistate_gameplay}
					else
						Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
							fadeintime = 5
							fadeintype = linear
							fadeouttime = 5
							fadeouttype = linear}
						spawnscriptnow \{ui_event
							params = {
								event = menu_replace
								data = {
									state = UIstate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					spawnscriptnow \{ui_event
						params = {
							event = menu_replace
							data = {
								state = UIstate_song_breakdown_competitive
								net_transition
							}
						}}
				endif
			else
				Progression_UpdateDetailedStatsForGig \{failed_or_practice}
				if (<type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						Change \{gameplay_loading_transition = 1}
						Change \{gameplay_restart_song = 1}
						Change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = uistate_gameplay}
					else
						spawnscriptnow \{ui_event
							params = {
								event = menu_change
								data = {
									state = UIstate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					spawnscriptnow \{ui_event
						params = {
							event = menu_change
							data = {
								state = UIstate_song_breakdown_competitive
								net_transition
							}
						}}
				endif
			endif
		endif
	endif
	GetNumPlayersInGame
	if (<num_players> = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
		spawnscriptnow \{Fail_Song_Crowd_Logic}
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
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript
GPULog_OutputFilename = 'none'

script GuitarEvent_SongWon 
	Change \{finished_gig_band_rebuild = 0}
	if NotCD
		if ($output_gpu_log = 1)
			if IsPS3
				FormatText \{TextName = FileName
					'%s_gpu_ps3'
					s = $current_level
					DontAssertForChecksums}
			else
				FormatText \{TextName = FileName
					'%s_gpu'
					s = $current_level
					DontAssertForChecksums}
			endif
			if NOT StringEquals \{a = $GPULog_OutputFilename
					b = 'none'}
				<FileName> = $GPULog_OutputFilename
			endif
			TextOutputEnd output_text FileName = <FileName>
		endif
		if ($output_song_stats = 1)
			GMan_SongTool_GetCurrentSong
			FormatText TextName = FileName '%s_stats' s = <current_song> DontAssertForChecksums
			TextOutputStart
			TextOutput \{text = qs(0x3f02a90c)}
			GetPlayerInfo \{1
				score}
			FormatText TextName = text qs(0xfccb1331) s = <score> DontAssertForChecksums
			TextOutput text = <text>
			GetPlayerInfo \{1
				notes_hit}
			GetPlayerInfo \{1
				total_notes}
			FormatText TextName = text qs(0x26c27108) n = <notes_hit> t = <total_notes> DontAssertForChecksums
			TextOutput text = <text>
			GetPlayerInfo \{1
				best_run}
			FormatText TextName = text qs(0xd67d4308) r = <best_run> DontAssertForChecksums
			TextOutput text = <text>
			GetPlayerInfo \{1
				max_notes}
			FormatText TextName = text qs(0x6bb1c560) m = <max_notes> DontAssertForChecksums
			TextOutput text = <text>
			GetPlayerInfo \{1
				base_score}
			FormatText TextName = text qs(0x26a9ba16) b = <base_score> DontAssertForChecksums
			TextOutput text = <text>
			if (<base_score> = 0)
				FormatText \{TextName = text
					qs(0x30357c57)}
			else
				FormatText TextName = text qs(0xbcc2e990) s = (<score> / <base_score>) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (<total_notes> = 0)
				FormatText \{TextName = text
					qs(0xc8e34ec5)}
			else
				FormatText TextName = text qs(0x2b87036c) s = ((<notes_hit> / <total_notes>) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text FileName = <FileName>
		endif
	endif
	StopSongStarCalculation
	GameEvent_SongWon
	GetNumPlayersInGame
	if (<num_players> = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 1)
			AddToPlayerInfo 1 time_in_lead = (<time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 2)
			AddToPlayerInfo 2 time_in_lead = (<time> - $last_time_in_lead)
		endif
		Change \{last_time_in_lead_player = -1}
	endif
	stop_custom_song
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	GMan_SendCallbackToAllGoals \{suffix = 'song_complete'
		callback_data = {
			event = song_won
		}}
	restore_player_part_settings
	freeplay_end_of_song
	DynamicAdManager_IssueCue \{Cue = CommitImpressions}
	if ($in_sing_a_long = true)
		if ScreenElementExists \{id = sing_a_long_container}
			sing_a_long_container :Obj_SpawnScript \{ui_sing_a_long_back}
			printscriptinfo \{'GuitarEvent_SongWon'
				channel = what}
			return
		else
			ScriptAssert \{qs(0x61af0381)}
		endif
	endif
	killspawnedscript \{name = GuitarEvent_SongFailed_Spawned}
	spawnscriptnow \{GuitarEvent_SongWon_Spawned}
endscript

script GuitarEvent_SongWon_Spawned 
	GameMode_GetType
	Change \{dont_play_win_amim_sfx = 1}
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	GMan_SongTool_GetCurrentSong
	Change last_song_played = <current_song>
	Change \{calibrate_lag_failed_num = 0}
	Change \{last_song_failed = None}
	Change \{current_song_failed_num = 0}
	songlist_remove_first_song_in_playlist
	<end_session> = 0
	if (<type> = career)
		if progression_check_for_gig_end
			<end_session> = 1
		endif
	elseif (<type> = quickplay)
		if quickplay_end_of_gig_list
			<end_session> = 1
		endif
	endif
	GMan_SongTool_GetCurrentSong
	if (<current_song> = jamsession)
		GetSongInfo
		if NOT (<file_id>.file_id [0] = 0 && <file_id>.file_id [1] = 0)
			jam_info = {
				file_id = (<file_id>.file_id)
			}
		endif
	endif
	if ($game_mode = practice)
		generic_event_choose \{state = UIstate_song_breakdown
			data = {
				for_practice = 1
			}}
		return
	elseif ($game_mode = tutorial)
		fadetoblack \{on
			z_priority = 1
			alpha = 1.0
			time = 0.0
			no_wait}
		generic_event_back \{state = UIstate_tutorial_gameplay
			data = {
				return_from_gameplay = 1
				gameplay_complete = 1
			}}
		return
	endif
	if GotParam \{jam_info}
		OnExitRun SongWon_WriteLeaderboardStats params = {song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session> jam_info = <jam_info>}
	else
		OnExitRun SongWon_WriteLeaderboardStats params = {song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session>}
	endif
	if ($is_network_game)
		ui_event_get_top
		if (<base_name> = 'controller_disconnect')
			generic_event_back
		endif
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
	should_cheer = false
	if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $game_mode = gh4_p3_career || $game_mode = gh4_p4_career
			|| $game_mode = p2_coop
			|| $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay
		)
		should_cheer = true
	endif
	if ($game_mode = freeplay)
		spawnscriptnow \{Crowd_Surge_And_Sustain_At_End_Of_Song}
		spawnscriptnow \{Play_A_Short_Crowd_Swell_For_This_Venue}
		if freeplay_has_players
			should_cheer = true
		endif
	endif
	if (<should_cheer> = true)
		spawnscriptnow \{Cheer_Before_Explosion}
	endif
	printf \{channel = sfx
		qs(0x86224445)
		s = $Current_Crowd_Looping_BG_Area_Good}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good}
	Crowd_Surge_And_Sustain_At_End_Of_Song
	spawnscriptnow \{You_Rock_Waiting_Crowd_SFX}
	Progression_SongWon
	if should_update_achievements
		song_won_update_achievements
	endif
	if (<type> = competitive)
		song_breakdown_shreddfest_determine_order
		GetArraySize <order>
		if (<array_size> > 0)
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
			repeat <array_size>
			<num_winners> = <index>
			if (<num_winners> > 1)
				winner_text = qs(0x82663fd9)
			else
				if GameMode_IsTeamGame
					GetBandInfo <winner_index> name
					<winner_text> = ($<name>)
					<winner2_text> = qs(0xac712b20)
				else
					<winner_text> = qs(0xebdedfc6)
					GetNumPlayersInGame
					if (<num_players> > 0)
						GetFirstPlayer
						begin
						if PlayerInfoEquals <player> Band = <winner_index>
							break
						endif
						GetNextPlayer player = <player>
						repeat
						GetMaxPlayers
						if (<player> > 0 && <player> <= <max_players>)
							if ($is_network_game = 1)
								GetPlayerInfo <player> GamerTag
								<winner_text> = ($<GamerTag>)
							else
								FormatText TextName = winner_text qs(0x06b38324) d = <player>
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
	if (<type> != freeplay)
		spawnscriptnow \{waitandkillhighway}
		killspawnedscript \{name = jiggle_text_array_elements}
		spawnscriptnow \{wait_and_play_you_rock_movie}
		if NOT GotParam \{winner2_text}
			params = {old_scale = 1}
		endif
		Create_MushroomCloudHand text = <winner_text> <params>
		spawnscriptnow \{You_Rock_Script}
	else
		set_all_highway_prepass_props \{alpha = 0}
		set_all_highway_props \{alpha = 0
			time = 0.66}
	endif
	if GotParam \{winner2_text}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <winner2_text> placement = bottom}
	endif
	Change \{old_song = None}
	if ($current_transition = preencore)
		end_song
		UnpauseGame
		Transition_Play \{type = preencore}
		Transition_Wait
		Change \{current_transition = None}
		PauseGame
		ui_event_get_top
		if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
			ui_event \{event = menu_replace
				data = {
					state = UIstate_song_breakdown
					encore_transition = 1
					no_sound
				}}
		else
			generic_event_choose \{no_sound
				state = UIstate_song_breakdown
				data = {
					encore_transition = 1
				}}
		endif
		encore_transition = 1
	else
		played_song_outro = false
		UnpauseGame
		if ($end_credits = 1)
			Transition_Play \{type = finalbandoutro}
		else
			GameMode_GetType
			transition = songwon
			if (<type> = freeplay)
				if NOT freeplay_has_players
					transition = songdoneattract
				else
					transition = songwonfreeplay
				endif
			endif
			Transition_Play type = <transition>
			get_band_configuration song = <current_song>
			if (<Band> = default_band)
				celeb_band = false
			else
				celeb_band = true
			endif
			if (((<type> = career) && (<celeb_band> = false)) || (<type> = quickplay))
				if NOT ui_event_exists_in_stack \{name = 'jam'}
					Transition_Wait
					Transition_Play \{type = songoutro}
					played_song_outro = true
				endif
			endif
		endif
		Transition_Wait
		Change \{current_transition = None}
		if (<played_song_outro> = false)
			CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_band'
				changenow
				transition_time = 5
				extra_params = {
					force_time = 5
				}}
		endif
		PauseGame
	endif
	killspawnedscript \{name = create_exploding_text}
	if ($end_credits = 1)
		Change \{end_credits = 2}
	endif
	destroy_all_exploding_text
	if ($autotest_on = 1)
		ui_event \{event = menu_change
			data = {
				state = UIstate_autotest_next_test
			}}
	endif
	if ($autolaunch_startnow = 1)
		prepare_for_pending_animpaks
		GMan_SongFunc \{func = switch_to_next_song_in_play_list
			params = {
				populate_list = true
			}}
		Change \{gameplay_loading_transition = 1}
		Change \{gameplay_restart_song = 1}
		Change \{net_ready_to_start = 0}
		generic_event_back \{nosound
			state = uistate_gameplay}
	else
		if NOT GotParam \{encore_transition}
			loading_transition = 0
			GameMode_GetType
			if (<type> = career)
				if NOT GMan_SongFunc \{func = is_play_list_finished}
					GMan_SongFunc \{func = switch_to_next_song_in_play_list}
					loading_transition = 1
				endif
			elseif (<type> = quickplay)
				stats_song_checksum = <current_song>
				if quickplay_set_new_song_in_gig_list
					loading_transition = 1
				endif
			elseif ((<type> = pro_faceoff) || (<type> = competitive))
				if quickplay_set_new_song_in_gig_list
					loading_transition = 1
				endif
			elseif (<type> = freeplay)
				freeplay_next_song
				loading_transition = 1
			endif
			if (<loading_transition> = 1)
				Change \{gameplay_loading_transition = 1}
				Change \{gameplay_restart_song = 1}
				Change \{net_ready_to_start = 0}
				generic_event_back \{nosound
					state = uistate_gameplay}
			else
				if ($is_network_game = 1 && <type> != career)
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
						if (<type> = quickplay)
							ui_event \{event = menu_replace
								data = {
									state = UIstate_song_breakdown
									net_transition_not_career
								}}
						else
							ui_event \{event = menu_replace
								data = {
									state = UIstate_song_breakdown_competitive
									net_transition
								}}
						endif
					else
						if (<type> = quickplay)
							ui_event \{event = menu_change
								data = {
									state = UIstate_song_breakdown
									net_transition_not_career
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = UIstate_song_breakdown_competitive
									net_transition
								}}
						endif
					endif
				else
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
						if ((<type> = pro_faceoff) || (<type> = competitive))
							ui_event \{event = menu_replace
								data = {
									state = UIstate_song_breakdown_competitive
									end_of_setlist_transition
								}}
						else
							ui_event \{event = menu_replace
								data = {
									state = UIstate_song_breakdown
									end_of_setlist_transition
								}}
						endif
					else
						if ui_event_exists_in_stack \{name = 'debug'}
							generic_event_back \{state = uistate_mainmenu}
						elseif ($game_mode = career)
							if GMan_SongFunc \{func = is_play_list_finished}
								if ($end_credits = 2)
									Progression_GetCreditsVenue
									ui_memcard_autosave_all_players {
										event = menu_back
										state = UIstate_career_venue_select
										data = {
											load_venue_checksum = <credits_venue>
										}
									}
								else
									ui_event \{event = menu_change
										data = {
											state = UIstate_song_breakdown
											end_of_setlist_transition
										}}
								endif
							else
								ui_event \{event = menu_change
									data = {
										state = UIstate_song_breakdown
										add_setlist_continue_handlers
									}}
							endif
						elseif ((<type> = pro_faceoff) || (<type> = competitive))
							ui_event \{event = menu_change
								data = {
									state = UIstate_song_breakdown_competitive
									end_of_setlist_transition
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = UIstate_song_breakdown
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

script SongWon_WriteLeaderboardStats 
	RequireParams \{[
			song_checksum
			end_session
		]
		all}
	if ($invite_controller = -1)
		printf \{qs(0x68e97bc9)}
		printstruct <...>
		check_for_leaderboard_write song_checksum = <song_checksum> end_session = <end_session> end_credits = <end_credits>
		GetNumPlayersInGame \{local
			out = temp_num_players_in_game}
		if (<temp_num_players_in_game> > 0)
			if (<end_credits> = 0)
				GameMode_GetType
				if (<type> = career)
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
	KillMovie \{TextureSlot = 1}
endscript

script wait_and_play_you_rock_movie 
	begin
	if (isMoviePreLoaded TextureSlot = 1)
		StartPreLoadedMovie \{TextureSlot = 1}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script waitandkillhighway 
	wait \{0.5
		seconds}
	disable_bg_viewport \{no_cameras}
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0

script Tempo_matching_iterator 
	printf qs(0x267f53bc) d = <time_offset> channel = events
	SongFileManager func = get_num_timesig_notes song_name = <song_name>
	timesig_entry = 0
	timesig_size = <num_timesig_notes>
	timesig_num_val = 0
	timesig_den_val = 0
	measure_count = 0
	even = 1
	SongFileManager func = get_num_fretbar_notes song_name = <song_name>
	array_size = <num_fretbar_notes>
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	Change \{next_beat_time = -1}
	Change \{time_to_next_beat = -1}
	Change \{next_beat_time2 = -1}
	Change \{time_to_next_beat2 = -1}
	Change tempo_iterator_offset = <time_offset>
	SongFileManager func = get_song_end_time song_name = <song_name>
	begin
	if (<array_size> < 2)
		break
	endif
	<entry> = (<array_size> -2)
	SongFileManager func = get_fretbar_note song_name = <song_name> index = <entry>
	if (<total_end_time> > <fretbar_time>)
		break
	endif
	<array_size> = (<array_size> - 1)
	repeat
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			SongFileManager func = get_timesig_note song_name = <song_name> index = <timesig_entry>
			SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			if (<timesig_time> <= <fretbar_time>)
				timesig_num_val = <timesig_num>
				timesig_den_val = <timesig_den>
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
		if ((<time> - <skipleadin>) < <fretbar_time>)
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num_val>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_size>
		final_array_entry = (<array_size> - 1)
		array_size = (<array_size> - <array_entry>)
		if (<array_size> > 0)
			begin
			begin
			SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			GetSongTimeMs
			if (<time> >= <fretbar_time>)
				GetSongTimeMs time_offset = <time_offset>
				if (<timesig_entry> < <timesig_size>)
					SongFileManager func = get_timesig_note song_name = <song_name> index = <timesig_entry>
					SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
					if (<timesig_time> <= <fretbar_time>)
						timesig_num_val = <timesig_num>
						timesig_den_val = <timesig_den>
						fretbar_count = 0
						timesig_entry = (<timesig_entry> + 1)
					endif
				endif
				if (<array_entry> < <final_array_entry>)
					SongFileManager func = get_beat_time song_name = <song_name> index = <array_entry>
					current_song_beat_time = <beat_time>
					SetPlayerInfo <player> current_song_beat_time = <current_song_beat_time>
					SetPlayerInfo <player> current_song_measure_time = (<timesig_num_val> * <current_song_beat_time>)
				endif
				break
			endif
			wait \{1
				gameframe}
			repeat
			SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			marker = <fretbar_time>
			<array_entry> = (<array_entry> + 1)
			fretbar_count = (<fretbar_count> + 1)
			if (<fretbar_count> = <timesig_num_val>)
				measure_count = (<measure_count> + 1)
				fretbar_count = 0
				spawn_measure_callbacks
			endif
			if (<array_entry> < <final_array_entry>)
				SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
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
					SongFileManager func = get_fretbar_note song_name = <song_name> index = <array_entry>
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
			repeat <array_size>
		endif
	endif
endscript
measure_callback = nullscript
beat_callback = nullscript

script SetMeasureCallback 
	if GotParam \{callback}
		Change measure_callback = <callback>
	else
	endif
endscript

script ClearMeasureCallbacks 
	Change \{measure_callback = nullscript}
endscript

script SetBeatCallback 
	if GotParam \{callback}
		Change beat_callback = <callback>
	else
	endif
endscript

script GetTimeToNextBeat 
	GetSongTimeMs \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script ClearBeatCallbacks 
	Change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 
	printf \{channel = tempo
		qs(0x579a2ed4)}
endscript

script beat_test_script 
	printf channel = tempo qs(0x96bdbc92) a = <time_to_next_beat>
endscript

script GuitarEvent_StarSequenceBonus 
	if (($highwayvisible) = off)
		return
	endif
	AddToPlayerInfo <player> sp_phrases_hit = 1
	if IsPS3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Awarded_SFX}
			else
				spawnscriptnow Star_Power_Awarded_SFX_Multiplayer params = {player = <player>}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = Star_Power_Awarded_SFX}
		else
			spawnscriptnow Star_Power_Awarded_SFX_Multiplayer params = {player = <player>}
		endif
	endif
	FormatText checksumname = container_id 'nowbar_container_p%p' p = <player>
	GetNowBarScale player = <player>
	player_index = (<player> - 1)
	GetArraySize \{$gem_colors}
	InputArrayGetElement name = <song> index = <array_entry>
	destroy_big_bolt {player = <player> gem_array = <gem_array>}
	gem_count = 0
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		if (<gem_count> = (<array_size> -1))
			if GotParam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		Color = ($gem_colors [<gem_count>])
		if PlayerInfoEquals <player> lefthanded_button_ups = 1
			<pos2d> = (($button_up_models [<player_index>]).<Color>.left_pos_2d)
			<angle> = (($button_models [<player_index>]).<Color>.angle)
		else
			<pos2d> = (($button_up_models [<player_index>]).<Color>.pos_2d)
			<angle> = (($button_models [<player_index>]).<Color>.left_angle)
		endif
		FormatText checksumname = name 'big_boltp%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <name>
			CreateScreenElement {
				type = SpriteElement
				id = <name>
				parent = <container_id>
				material = sys_Big_Bolt01_sys_Big_Bolt01
				rgba = [255 255 255 255]
				Pos = <pos2d>
				rot_angle = <angle>
				scale = (1.0, 3.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
		FormatText checksumname = nameH 'big_bolt_hitp%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <nameH>
			CreateScreenElement {
				type = SpriteElement
				id = <nameH>
				parent = <container_id>
				material = Mat_SP_Xplosion1
				rgba = [255 255 255 255]
				Pos = <pos2d>
				rot_angle = 0
				scale = (2.0, 2.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
		FormatText checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id>
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		FormatText checksumname = hwy 'highway_containerp%p' p = <player>
		if NOT ObjectExists id = <fx_id>
			if (($highwayvisible) = on)
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
		endif
		FormatText checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT ObjectExists id = <fx2_id>
			if (($highwayvisible) = on)
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
		endif
		FormatText checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = (<particle_pos> - (0.0, 15.0))
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT ObjectExists id = <fx3_id>
			if (($highwayvisible) = on)
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
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player = <player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	GetArraySize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		FormatText checksumname = name 'big_boltp%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <name>
		FormatText checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		FormatText checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		FormatText checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx3_id> <kill_when_empty>
		FormatText checksumname = nameH 'big_bolt_hitp%p%e' p = <player> e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <nameH>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script destroy_all_big_bolts 
	GetArraySize \{$gem_colors}
	player = 0
	begin
	gem_count = 0
	begin
	FormatText checksumname = name 'big_boltp%p%e' p = <player> e = <gem_count> AddToStringLookup = true
	DestroyScreenElement id = <name>
	FormatText checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> AddToStringLookup = true
	FormatText checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> AddToStringLookup = true
	FormatText checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> AddToStringLookup = true
	Destroy2DParticleSystem id = <fx_id>
	Destroy2DParticleSystem id = <fx2_id>
	Destroy2DParticleSystem id = <fx3_id>
	FormatText checksumname = nameH 'big_bolt_hitp%p%e' p = <player> e = <gem_count> AddToStringLookup = true
	DestroyScreenElement id = <nameH>
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	player = (<player> + 1)
	repeat 4
endscript

script GuitarEvent_Multiplier4xOff 
	GetPlayerInfo <player> is_local_client
	if isSinglePlayerGame
		SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
		SoundEvent \{event = Lose_Multiplier_Crowd}
	else
		if (<is_local_client> = 1)
			SoundEvent \{event = UI_SFX_Lose_Multiplier_4X_Band}
		endif
	endif
	spawnscriptnow highway_pulse_multiplier_loss params = {player = <player> Multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	GetPlayerInfo <player> is_local_client
	if isSinglePlayerGame
		SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	else
		if (<is_local_client> = 1)
			SoundEvent \{event = UI_SFX_Lose_Multiplier_3X_Band}
		endif
	endif
	spawnscriptnow highway_pulse_multiplier_loss params = {player = <player> Multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	GetPlayerInfo <player> is_local_client
	if isSinglePlayerGame
		SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	else
		if (<is_local_client> = 1)
			SoundEvent \{event = UI_SFX_Lose_Multiplier_2X_Band}
		endif
	endif
	spawnscriptnow highway_pulse_multiplier_loss params = {player = <player> Multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	GH3_SFX_Stop_Sounds_For_KillSong <...> loading_transition = <loading_transition>
endscript

script GuitarEvent_VenueEnter 
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	FormatText checksumname = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT GlobalExists name = <echo_params>
		echo_params = Echo_Crowd_Buss_Default_SemiWet
	endif
	if NOT GlobalExists name = <reverb_params>
		reverb_params = Reverb_Crowd_Buss_Default_SemiWet
	endif
	setsoundbusseffects effects = [{$<echo_params> name = Crowd_W_Reverb_Buss_Echo}]
	setsoundbusseffects effects = [{$<reverb_params> name = Crowd_W_Reverb_Buss_Reverb}]
endscript

script GuitarEvent_VenueExit 
	setsoundbusseffects \{effects = [
			{
				$Echo_Dry
				name = Crowd_W_Reverb_Buss_Echo
			}
		]}
	setsoundbusseffects \{effects = [
			{
				$Reverb_Dry
				name = Crowd_W_Reverb_Buss_Reverb
			}
		]}
endscript

script GuitarEvent_CreateFirstGem 
	spawnscriptnow first_gem_fx params = {<...>}
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
		type = SpriteElement
		parent = <gem_id>
		id = <fx_id>
		scale = (1.0, 1.0)
		Pos = <Pos>
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		z_priority = 18
		rgba = [255 255 255 255]
	}
	spawnscriptnow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	wait \{0.8
		seconds}
	DestroyScreenElement id = <fx_id>
endscript

script destroy_first_gem_fx 
	begin
	if NOT ScreenElementExists id = <gem_id>
		DestroyScreenElement id = <fx_id>
		break
	endif
	wait \{1
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

script GuitarEvent_Kick_Drum_Hit_Note \{player = 1}
	Change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		Change \{kick_index = 0}
	endif
	ExtendedChecksum = null
	<highway_info> = ($highway_pos_table [<player> -1])
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthOffsetFactor)) / 32.0)
	ExtendCRCWithInteger checksum = highway_containerp integer = <player>
	container_id = <ExtendedChecksum>
	GetNowBarScale player = <player>
	<x_scale> = (<x_scale> * <nowbar_x_scale>)
	wait \{1
		frame}
	<particle_pos> = (0.0, 630.0)
	ExtendCRCWithInteger checksum = Kick_Particlep integer = <player>
	ExtendCRCWithInteger checksum = <ExtendedChecksum> integer = $kick_index
	fx_id = <ExtendedChecksum>
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 0.25))
	<end_scale> = (<x_scale> * (1.875, 0.0) + (0.0, 0.5))
	Create2DParticleSystem {
		id = <fx_id>
		Pos = <particle_pos>
		z_priority = 7.9
		material = Mat_Particle_Kickhit_Ring01
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
	GetPlayerInfo <player> part
	if (<part> = Drum)
		GetPlayerInfo <player> four_lane_highway
	else
		four_lane_highway = 0
	endif
	if (<four_lane_highway> = 1)
		ExtendCRCWithInteger checksum = Kick_Particle2p integer = <player>
		ExtendCRCWithInteger checksum = <ExtendedChecksum> integer = $kick_index
		fx2_id = <ExtendedChecksum>
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = Mat_Particle_Kickhit_4L
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
		wait \{11
			frames}
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
	else
		ExtendCRCWithInteger checksum = Kick_Particle2p integer = <player>
		ExtendCRCWithInteger checksum = <ExtendedChecksum> integer = $kick_index
		fx2_id = <ExtendedChecksum>
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = Mat_Particle_Kickhit_5L
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
		wait \{11
			frames}
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
	endif
endscript

script GuitarEvent_Hit_Open_Note 
	GuitarEvent_Kick_Drum_Hit_Note player = <player>
endscript

script GuitarEvent_Hit_Beginner_Note 
	GuitarEvent_Kick_Drum_Hit_Note player = <player>
endscript

script GuitarEvent_GigStarted 
endscript

script GuitarEvent_GigFailed 
endscript

script GuitarEvent_GigWon 
endscript

script GuitarEvent_GigQuit 
endscript

script PlayerSetVolume 
	if PlayerInfoEquals <player> part = Drum
		if GotParam \{include_drums}
			SetAllDrumStates player = <player> volume = <volume>
		endif
	else
		SetPlayerInfo <player> guitar_volume = <volume>
		UpdateGuitarVolume
	endif
endscript

script PlayerGetVolume 
	if PlayerInfoEquals <player> part = Drum
		if GotParam \{Drum}
			switch <Drum>
				case 1
				GetPlayerInfo <player> drum_volume1
				return volume = <drum_volume1>
				case 2
				GetPlayerInfo <player> drum_volume2
				return volume = <drum_volume2>
				case 3
				GetPlayerInfo <player> drum_volume3
				return volume = <drum_volume3>
				case 4
				GetPlayerInfo <player> drum_volume4
				return volume = <drum_volume4>
			endswitch
		endif
	endif
	GetPlayerInfo <player> guitar_volume
	return volume = <guitar_volume>
endscript

script Create_MushroomCloudHand \{text = qs(0x6f6d143d)}
	destroy_all_exploding_text
	spawnscriptnow create_exploding_text params = {text = <text> old_scale = <old_scale>}
	if ScreenElementExists \{id = MushroomCloudHand}
		DestroyScreenElement \{id = MushroomCloudHand}
	endif
	CreateScreenElement \{parent = root_window
		id = MushroomCloudHand
		type = DescInterface
		desc = 'you_rock_gh5'
		z_priority = 0}
	spawnscriptlater \{YouRock_Explosions_ComboCombo}
	if MushroomCloudHand :Desc_ResolveAlias \{name = alias_Horns}
		MushroomCloudHand :Obj_SpawnScriptNow {
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
	DestroyScreenElement \{id = MushroomCloudHand}
endscript

script hot_start_achieved \{Band = 0}
	return
	GameMode_GetType
	if (<type> = practice)
		return
	endif
	if (<player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if isSinglePlayerGame
			Pos = (640.0, 211.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_SinglePlayer params = {combo = <combo>}
		elseif ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (415.0, 170.0)
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (865.0, 170.0)
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		endif
	endif
	if NOT GameMode_IsBandScoring
		GetPlayerInfo <player> part
		if (<part> = vocals)
			vocals_message_delayed {player = <player> text = qs(0x09a07a71) rgba = [255 172 64 255]}
		else
			hud_create_message player = <player> text = qs(0x09a07a71)
		endif
	elseif (<Band> = 1)
		array = []
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			AddArrayElement array = <array> element = <player>
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
		GetArraySize array = <array>
		if (<array_size> > 0)
			hud_create_message Band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <array>}
		endif
	endif
endscript

script HUD_animate_star_meter_flames 
	spawnscriptnow \{son_of_HUD_animate_star_meter_flames}
endscript

script son_of_HUD_animate_star_meter_flames 
	hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
		param = id}
	<id> :Desc_ResolveAlias name = alias_band_hud_star_frame param = band_hud_star_frame_cont
	DestroyScreenElement \{id = Star_Meter_Counter_glow01}
	CreateScreenElement {
		type = SpriteElement
		id = Star_Meter_Counter_glow01
		parent = <band_hud_star_frame_cont>
		material = Mat_Meter_Wibble_Glow
		rgba = [255 200 64 0]
		dims = (128.0, 128.0)
		Pos = (64.0, 64.0)
		scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = 12
	}
	FormatText \{checksumname = SMCfx1
		'Star_Meter_Counter_FX'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <SMCfx1>
	Create2DParticleSystem {
		id = <SMCfx1>
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
	if ScreenElementExists \{id = Star_Meter_Counter_glow01}
		Star_Meter_Counter_glow01 :SE_SetProps \{rgba = [
				255
				200
				64
				255
			]
			time = 0.15}
	endif
	wait \{0.15
		second}
	Destroy2DParticleSystem kill_when_empty id = <SMCfx1>
	if ScreenElementExists \{id = Star_Meter_Counter_glow01}
		Star_Meter_Counter_glow01 :SE_SetProps \{rgba = [
				255
				200
				64
				0
			]
			time = 0.5}
	endif
	wait \{0.5
		seconds}
	DestroyScreenElement \{id = Star_Meter_Counter_glow01}
endscript

script reset_song_loading_hack_global 
	Change \{transition_song_loading_hack = 1}
endscript

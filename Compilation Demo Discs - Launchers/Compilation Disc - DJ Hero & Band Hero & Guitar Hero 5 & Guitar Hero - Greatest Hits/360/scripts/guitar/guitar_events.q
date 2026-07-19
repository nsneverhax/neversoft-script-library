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
		event = hit_mine
		Scr = GuitarEvent_HitMine
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
		event = first_gem
		Scr = GuitarEvent_CreateFirstGem
	}
	{
		type = call
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
	{
		type = spawn
		event = explode_gem
		Scr = GuitarEvent_ExplodeGem
	}
]
total_open_notes_hit = 0

script create_guitar_events 
	printf qs("\Lcreate_guitar_events %a ..........") a = <player_text>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	printf \{qs("\Ladding...")}
	event = ($guitar_events [<array_entry>].event)
	type = ($guitar_events [<array_entry>].type)
	ExtendCRC <event> <player_text> out = event
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
	printf qs("\LEvent %e Iterator started with time %d") d = <time_offset> e = <event_string>
	get_song_prefix song = <song_name>
	FormatText checksumname = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup
	array_entry = 0
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
	Wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	ScriptName = ($<song> [<array_entry>].Scr)
	if ScriptExists <ScriptName>
		spawnscriptnow <ScriptName> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif SymbolIsCFunc <ScriptName>
		<ScriptName> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script GuitarEvent_ExplodeGem \{mine = 0}
	FormatText checksumname = container_id 'gem_container%p' p = ($<player_status>.text) AddToStringLookup = true
	FormatText checksumname = fx2_id '%x%y' x = <x> y = <y>
	pos = ((<x> * (1.0, 0.0)) + (<y> * (0.0, 1.0)))
	Destroy2DParticleSystem id = <fx2_id>
	if NOT ObjectExists id = <fx2_id>
		Create2DParticleSystem {
			id = <fx2_id>
			pos = <pos>
			z_priority = 8.0
			material = Mat_Particle_Smoke01
			parent = <container_id>
			start_color = [66 66 66 255]
			end_color = [123 123 128 0]
			start_scale = (0.1, 0.1)
			end_scale = (1.0, 1.0)
			start_angle_spread = 0.0
			min_rotation = 90.0
			max_rotation = 90.0
			emit_start_radius = 0.0
			emit_radius = 0.0
			emit_rate = 0.05
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 1.0
			friction = (0.0, 30.0)
			time = 0.25
		}
	endif
	FormatText checksumname = fx3_id '%x%y' x = <x> y = <y>
	Destroy2DParticleSystem id = <fx3_id>
	if NOT ObjectExists id = <fx3_id>
		Create2DParticleSystem {
			id = <fx3_id>
			pos = <pos>
			z_priority = 10.0
			material = sys_Particle_Spark01_sys_Particle_Spark01
			parent = <container_id>
			start_color = [255 128 0 255]
			end_color = [255 255 255 0]
			start_scale = (5.0, 5.0)
			end_scale = (2.0, 2.0)
			start_angle_spread = 12.0
			min_rotation = 90.0
			max_rotation = 90.0
			emit_start_radius = 0.0
			emit_radius = 0.0
			emit_rate = 0.002
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 4.0
			friction = (0.0, 0.0)
			time = 0.25
		}
	endif
	Wait \{3
		frames}
	Destroy2DParticleSystem id = <fx2_id> kill_when_empty
	Destroy2DParticleSystem id = <fx3_id> kill_when_empty
endscript

script GuitarEvent_MissedNote \{extended_miss = 0}
	if (<bum_note> = 1)
		Guitar_Wrong_Note_Sound_Logic <...>
	endif
	if ($is_network_game && ($<player_status>.is_local_client = 0))
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
		endif
	else
		if NOT (($<player_status>.part) = drum)
			PlayerGetVolume player_status = <player_status>
			if NOT (<volume> = 0)
				if (<silent_miss> = 1)
					spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
				else
					if NOT (<extended_miss> = 1)
						PlayerSetVolume player_status = <player_status> volume = 0
						UpdateGuitarVolume
						jam_update_volume volume = 0 player = ($<player_status>.player)
					endif
				endif
			endif
		endif
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if CompositeObjectExists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = Bass)
					BandManager_MissedNote name = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	InputArrayGetElement name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs("\LMissed Note (%t)") t = (<gem_array> [0]) color = Orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	FormatText checksumname = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	LegacyDoScreenElementMorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> seconds
	if ($<player_status>.star_power_used = 1)
		LegacyDoScreenElementMorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		LegacyDoScreenElementMorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	Guitar_Wrong_Note_Sound_Logic <...>
	if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
		PlayerSetVolume player_status = <player_status> volume = 0
		UpdateGuitarVolume
		jam_update_volume volume = 0 player = ($<player_status>.player)
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if CompositeObjectExists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = Bass)
					LaunchEvent type = Anim_MissedNote target = ($<player_status>.band_member)
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
				output_log_text qs("\LME: %n (%t)") n = <next_time> t = <next_note> color = red
			else
				output_log_text qs("\LML: %n (%t)") n = <prev_time> t = <prev_note> color = darkred
			endif
		endif
	endif
endscript

script GuitarEvent_HitNotes 
	if ($Debug_Audible_HitNote = 1)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
	if ($show_play_log = 1)
		GetGlobalTags \{user_options}
		CastToInteger \{lag_calibration}
		Mod a = <lag_calibration> b = 1000
		<video_offset> = <Mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		InputArrayGetElement name = <song> index = <array_entry>
		note_time = (<gem_array> [0])
		if (<off_note> < 0)
			output_log_text qs("\LHE: %n (%t)") n = <off_note> t = <note_time> color = green
		else
			output_log_text qs("\LHL: %n (%t)") n = <off_note> t = <note_time> color = darkgreen
		endif
	endif
	if (<updatevolume> = true)
		UpdateGuitarVolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript

script GuitarEvent_HitNote 
	spawnscriptnow GuitarEvent_HitNote_Spawned params = {<...>}
endscript

script GuitarEvent_HitNote_Spawned 
	if GotParam \{kick}
		GuitarEvent_Kick_Drum_Hit_Note player = <player> player_text = <player_text>
	elseif GotParam \{open_note}
		GuitarEvent_Hit_Open_Note player = <player> player_text = <player_text>
		Wait \{1
			gameframe}
		change total_open_notes_hit = ($total_open_notes_hit + 1)
		printf \{qs("\LHIT NOTE!! total_open_notes_hit = %s")
			s = $total_open_notes_hit
			channel = achievements}
	elseif GotParam \{easy_rhythm_note}
		GuitarEvent_Hit_Easy_Rhythm_Note player_text = <player_text>
	else
		if ($game_mode = p2_battle || $boss_battle = 1)
			change structurename = <player_status> last_hit_note = <color>
		endif
		Wait \{1
			gameframe}
		if GotParam \{drum_accent}
			Drum_Accent_Hit_particle_FX {fx_id = <fx_id> pos = <pos> player = <player> drum_index = <drum_index>}
		endif
		scale = (2.0, 2.0)
		NoteFX <...> star = ($<player_status>.star_power_used) name = <fx_id>
		Wait \{6
			gameframes}
		Destroy2DParticleSystem id = <particle_id> kill_when_empty
		Wait \{10
			gameframes}
		if ScreenElementExists id = <fx_id>
			DestroyScreenElement id = <fx_id>
		endif
	endif
	Achievements_CheckForBandStreak
endscript

script GuitarEvent_DrumFillHit 
	if GotParam \{kick}
		GuitarEvent_HitNote <...>
	endif
endscript
hit_particle_params = {
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
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		0
		255
		255
		255
	]
	end_color = [
		0
		255
		255
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
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
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script GuitarEvent_HitMine 
	spawnscriptnow GuitarEvent_HitMine_Spawned params = {<...>}
endscript

script GuitarEvent_HitMine_Spawned 
	if ($<player_status>.highway_position = left)
		SoundEvent \{event = GH_SFX_BattleMode_Mine_Explode_P1}
	else
		SoundEvent \{event = GH_SFX_BattleMode_Mine_Explode_P2}
	endif
	spawnscriptnow hammer_highway params = {other_player_text = <player_text>}
	FormatText checksumname = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	<particle_pos> = (<pos> - (0.0, 20.0))
	ExtendCRC <mine_fx_id> '_hit_particle' out = particle_id
	Destroy2DParticleSystem id = <particle_id>
	Create2DParticleSystem {
		id = <particle_id>
		pos = <particle_pos>
		z_priority = 11.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <container_id>
		start_color = [255 128 0 255]
		end_color = [255 255 255 0]
		start_scale = (1.0, 1.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 12.0
		min_rotation = 90.0
		max_rotation = -90.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.002
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 22.0
		friction = (0.0, 44.0)
		time = 0.5
	}
	Wait \{1
		frame}
	ExtendCRC <mine_fx_id> '_hit_particle1' out = particle1_id
	Destroy2DParticleSystem id = <particle1_id>
	Create2DParticleSystem {
		id = <particle1_id>
		pos = <particle_pos>
		z_priority = 10.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <container_id>
		start_color = [255 128 0 255]
		end_color = [255 255 255 0]
		start_scale = (5.0, 5.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 12.0
		min_rotation = 90.0
		max_rotation = 90.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.002
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 4.0
		friction = (0.0, 0.0)
		time = 0.5
	}
	Wait \{1
		frame}
	ExtendCRC <mine_fx_id> '_hit_particle2' out = particle2_id
	Destroy2DParticleSystem id = <particle2_id>
	Create2DParticleSystem {
		id = <particle2_id>
		pos = <particle_pos>
		z_priority = 8.0
		material = Mat_Particle_Smoke01
		parent = <container_id>
		start_color = [66 66 66 255]
		end_color = [123 123 128 0]
		start_scale = (0.1, 0.1)
		end_scale = (2.0, 2.0)
		start_angle_spread = 0.0
		min_rotation = 90.0
		max_rotation = 90.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.05
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 1.0
		friction = (0.0, 30.0)
		time = 0.5
	}
	<crowd_decrease_count> = $battle_mine_health_decrease_count
	<wait_time> = 0.15
	<wait_time_slice> = (<wait_time> / <crowd_decrease_count>)
	if ($<player_status>.current_num_powerups > 0)
		remove_battle_card player_status = <player_status>
		update_battlecards_remove player_status = <player_status>
	endif
	CastToInteger \{crowd_decrease_count}
	begin
	CrowdDecrease player_status = <player_status>
	Wait <wait_time_slice> seconds
	repeat <crowd_decrease_count>
	Destroy2DParticleSystem id = <particle_id> kill_when_empty
	Destroy2DParticleSystem id = <particle1_id> kill_when_empty
	Destroy2DParticleSystem id = <particle2_id> kill_when_empty
endscript

script KillMineFX 
	Destroy2DParticleSystem \{id = all}
	KillSpawnedScript \{name = GuitarEvent_HitMine_Spawned}
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 1
		player = 1}
	<container_pos> = (<pos> + (0.0, 720.0))
	LegacyDoScreenElementMorph id = gem_containerp1 pos = <container_pos>
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 2
		player = 2}
	<container_pos> = (<pos> + (0.0, 720.0))
	LegacyDoScreenElementMorph id = gem_containerp2 pos = <container_pos>
endscript

script Drum_Accent_Hit_particle_FX 
	FormatText checksumname = container_id 'gem_containerp%p' p = <player> AddToStringLookup = true
	<container_id> :Obj_SpawnScriptNow Drum_Accent_Hit_particle_FX_spawn params = {fx_id = <fx_id> pos = <pos> player = <player> drum_index = <drum_index> container_id = <container_id>}
endscript

script Drum_Accent_Hit_particle_FX_spawn 
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		clonematerial = Mat_Note_hit_Xplosion1
		rgba = [255 255 255 255]
		pos = <pos>
		rot_angle = (0)
		scale = (2.0, 2.0)
		just = [center bottom]
		z_priority = 6
	}
	Wait \{16
		frames}
	DestroyScreenElement id = <id>
endscript

script GuitarEvent_StarPowerOn 
	KillSpawnedScript \{name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		GH_Star_Power_Verb_On player = <player>
	endif
	FormatText checksumname = scriptID '%p_StarPower_StageFX' p = <player_text>
	SpawnScriptLater Do_StarPower_StageFX id = <scriptID> params = {<...>}
	StarPowerOn player = <player>
	if ($current_num_players = 4)
		if (all_players_using_starpower)
			spawnscriptnow \{play_group_star_power_animation}
			change \{Achievements_RIDE_THE_LIGHTNING_flag = 1}
		endif
	endif
	HUD_meter_glow_blue
endscript

script GuitarEvent_StarPowerOff 
	KillSpawnedScript \{name = highway_pulse_black}
	if IsPs3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Release_Center_Gh4}
				SoundEvent \{event = Star_Power_Release_Front_GH4}
			else
				spawnscriptnow Star_Power_Release_SFX_Multiplayer params = {player = ($<player_status>.player)}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = Star_Power_Release_Center_Gh4}
			SoundEvent \{event = Star_Power_Release_Front_GH4}
		else
			spawnscriptnow Star_Power_Release_SFX_Multiplayer params = {player = ($<player_status>.player)}
		endif
	endif
	GH_Star_Power_Verb_Off player = ($<player_status>.player)
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	FormatText checksumname = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		LegacyDoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		LegacyDoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	spawnscriptnow \{Kill_StarPower_Camera}
	HUD_meter_glow_hide_blue
endscript

script GuitarEvent_PreFretbar 
	spawnscriptnow \{GH_Audible_Metronome}
	spawnscriptnow Clapping_Logic params = {<...>}
	spawnscriptnow \{Crowd_Anticipation}
endscript

script GH_Audible_Metronome 
	if ($Debug_Audible_Metronome = 1)
		Wait ((0.25 + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) - 0.008333) seconds
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
	<StartTime> = (<songtime> - 0.0167)
	duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	GetHeldPattern controller = ($<player_status>.controller) player = ($<player_status>.player) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		PlayerSetVolume player_status = <player_status> volume = 100
		UpdateGuitarVolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
	Wait \{1
		gameframe}
	GetSongTime
	if ((<songtime> - <StartTime>) >= <duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	if IsGuitarController controller = ($<player_status>.controller)
		GetStrumPattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		PlayerSetVolume player_status = <player_status> volume = 100
		UpdateGuitarVolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript

script GuitarEvent_Note_Window_Open 
	if ($Debug_Audible_Open = 1)
		value = (($check_time_early + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) + 0.008333)
		printf channel = sfx qs("\L%s") s = <value>
		Wait (($check_time_early + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) + 0.008333) seconds
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
	WhammyFXOffAll \{player_status = player1_status}
	WhammyFXOffAll \{player_status = player2_status}
endscript

script GuitarEvent_WhammyOn 
	WhammyFXOn <...>
endscript

script GuitarEvent_WhammyOff 
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	if ($failed_song = 1)
		return
	endif
	change \{failed_song = 1}
	change \{Achievements_SongWonFlag = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		if ScriptIsRunning \{Spirit_FadeOut}
			KillSpawnedScript \{name = Spirit_FadeOut}
		endif
		spawnscriptnow \{Spirit_FadeOut}
	endif
	DynamicAdManager_IssueCue \{cue = commitimpressions}
	if ($is_network_game)
		online_fail_song
	elseif ($game_mode = p2_battle)
		GuitarEvent_SongWon \{battle_win = 1}
	else
		KillSpawnedScript \{name = guitar_jam_playback_recording}
		KillSpawnedScript \{name = guitar_jam_drum_playback}
		KillSpawnedScript \{name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
		spawnscriptnow \{GuitarEvent_SongFailed_Spawned}
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	hide_glitch \{num_frames = 3}
	if ($is_attract_mode = 1)
		ScriptAssert \{'Song failure in attract mode, this is bad'}
		return
	endif
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	LightShow_SongFailed
	if ($is_network_game)
		KillSpawnedScript \{name = dispatch_player_state}
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		mark_unsafe_for_shutdown
	endif
	GetSongTimeMs
	change failed_song_time = <time>
	PauseGame
	Progression_SongFailed
	if ($boss_battle = 1)
		disable_pause
		preload_movie = 'Player2_wins'
		KillMovie \{TextureSlot = 1}
		PreLoadMovie {
			movie = <preload_movie>
			TextureSlot = 1
			TexturePri = 70
			no_looping
			no_hold
			nowait
		}
		FormatText TextName = winner_text qs("%s Rocks!") s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		spawnscriptnow \{wait_and_play_you_rock_movie}
		Wait \{0.2
			seconds}
		spawnscriptnow \{waitAndKillHighway}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	if ($is_network_game = 0)
		end_singleplayer_game
		printstruct <...>
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	else
		if NetSessionFunc \{obj = session
				func = has_active_session}
			NetSessionFunc \{obj = session
				func = end_active_session}
		endif
	endif
	UnPauseGame
	if ($is_network_game)
		ui_event_wait_for_safe
		disable_pause
	endif
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	SoundEvent \{event = $Current_Crowd_Transition_Neutral_To_Bad_L}
	SoundEvent \{event = $Current_Crowd_Transition_Neutral_To_Bad_R}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	disable_pause
	song_failed_show_highways
	Transition_Play \{type = songlost}
	Transition_Wait
	change \{current_transition = none}
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
	PauseGame
	show_calibration = 0
	GetGlobalTags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
	endif
	if ($special_event_stage != 0)
		<show_calibration> = 0
	endif
	GameMode_GetType
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		Wait \{1
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
		if (<show_calibration> = 1)
			SetGlobalTags \{user_options
				params = {
					has_calibrated = 1
				}}
			Body = qs("You seem to be having a hard time hitting the notes. Maybe you'd like to blame it on the lag and calibrate for your TV?")
			spawnscriptnow {
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
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	elseif (<type> = career)
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				spawnscriptnow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_fail_song
						}
					}}
			else
				spawnscriptnow \{ui_event
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
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				spawnscriptnow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_online_post_game_lobby
						}
					}}
			else
				spawnscriptnow \{ui_event
					params = {
						event = menu_change
						data = {
							state = uistate_online_post_game_lobby
						}
					}}
			endif
		endif
	endif
	if ($current_num_players = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
		SoundEvent \{event = $Current_Crowd_Transition_Neutral_To_Bad_L}
		SoundEvent \{event = $Current_Crowd_Transition_Neutral_To_Bad_R}
		BG_Crowd_Front_End_Silence \{immediate = 1}
	else
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript
song_failed_x = 1

script song_failed_show_highways 
	if ($song_failed_x = 0)
		return
	endif
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		return
	endif
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	stoprendering
	SongUnLoad
	PauseGame
	startrendering
	Wait \{0.5
		second}
	player = 1
	begin
	GetPlayerInfo <player> current_health
	if (<current_health> < $health_poor_medium)
		song_failed_highway_x {player = <player>}
	endif
	player = (<player> + 1)
	repeat $current_num_players
	SoundEvent \{event = Band_Failed_X_SFX}
	if NOT ($band1_status.star_power_active)
		if ($band1_status.star_power_amount > (100.0 / 6.0))
			Wait \{0.3
				seconds}
			hud_create_message \{Band
				text = qs("Next time, try using star power \nto save the band.")
				priority = 100
				rgba = [
					0
					200
					200
					255
				]}
		endif
	endif
	Wait \{2.2
		seconds}
	UnPauseGame
endscript

script song_failed_highway_x 
	GetPlayerInfo <player> hud_parent
	GetPlayerInfo <player> part
	pos = (80.0, 40.0)
	scale = 2.0
	switch <part>
		case Vocals
		icon = band_HUD_microphone2
		scale = 1.75
		if ($current_num_players = 2)
			pos = (530.0, 20.0)
		else
			pos = (500.0, 80.0)
		endif
		case guitar
		icon = band_HUD_guitar2
		case Bass
		icon = band_HUD_bass2
		case drum
		icon = band_HUD_drums2
	endswitch
	if hud_root :Desc_ResolveAlias name = <hud_parent> param = parent_id
		if ScreenElementExists id = <parent_id>
			CreateScreenElement {
				type = SpriteElement
				parent = <parent_id>
				texture = <icon>
				just = [center center]
				z_priority = 400
				scale = <scale>
				pos = <pos>
				rgba = [255 0 0 255]
			}
		endif
	endif
endscript
GPULog_OutputFilename = 'none'

script GuitarEvent_SongWon \{battle_win = 0}
	if NotCD
		if ($output_gpu_log = 1)
			if IsPs3
				FormatText \{TextName = filename
					'%s_gpu_ps3'
					s = $current_level
					DontAssertForChecksums}
			else
				FormatText \{TextName = filename
					'%s_gpu'
					s = $current_level
					DontAssertForChecksums}
			endif
			if NOT StringEquals \{a = $GPULog_OutputFilename
					b = 'none'}
				<filename> = $GPULog_OutputFilename
			endif
			TextOutputEnd output_text filename = <filename>
		endif
		if ($output_song_stats = 1)
			FormatText \{TextName = filename
				'%s_stats'
				s = $current_song
				DontAssertForChecksums}
			TextOutputStart
			TextOutput \{text = qs("\LPlayer 1")}
			FormatText TextName = text qs("\LScore: %s") s = ($player1_status.score) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LNotes Hit: %n of %t") n = ($player1_status.notes_hit) t = ($player1_status.total_notes) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LBest Run: %r") r = ($player1_status.best_run) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LMax Notes: %m") m = ($player1_status.max_notes) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LBase score: %b") b = ($player1_status.base_score) DontAssertForChecksums
			TextOutput text = <text>
			if (($player1_status.base_score) = 0)
				FormatText \{TextName = text
					qs("\LScore Scale: n/a")}
			else
				FormatText TextName = text qs("\LScore Scale: %s") s = (($player1_status.score) / ($player1_status.base_score)) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (($player1_status.total_notes) = 0)
				FormatText \{TextName = text
					qs("\LNotes Hit Percentage: n/a")}
			else
				FormatText TextName = text qs("\LNotes Hit Percentage: %s") s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text filename = <filename>
		endif
	endif
	if ScreenElementExists \{id = metallifacts_container}
		ui_event_wait \{event = menu_back}
		return
	endif
	if ($current_num_players = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 0)
			change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			change \{save_current_powerups_p1 = $current_powerups_p1}
			change \{save_current_powerups_p2 = $current_powerups_p2}
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if ScreenElementExists \{id = battlemode_container}
				DestroyScreenElement \{id = battlemode_container}
			endif
			change \{battle_do_or_die = 1}
			change battle_do_or_die_speed_scale = ($battle_do_or_die_speed_scale + $battle_do_or_die_speed_scale_increase)
			if ($battle_do_or_die_speed_scale < $Hyperspeed_Fastest)
				change \{battle_do_or_die_speed_scale = $Hyperspeed_Fastest}
			endif
			change battle_do_or_die_attack_scale = ($battle_do_or_die_attack_scale + $battle_do_or_die_attack_scale_increase)
			if ($battle_do_or_die_attack_scale > $battle_do_or_die_attack_scale_max)
				change \{battle_do_or_die_attack_scale = $battle_do_or_die_attack_scale_max}
			endif
		else
			battlemode_killspawnedscripts
			change \{battle_do_or_die = 0}
			change \{battle_do_or_die_speed_scale = 1.0}
			change \{battle_do_or_die_attack_scale = 1.0}
		endif
	endif
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	DynamicAdManager_IssueCue \{cue = commitimpressions}
	KillSpawnedScript \{name = GuitarEvent_SongFailed_Spawned}
	spawnscriptnow \{GuitarEvent_SongWon_Spawned}
	update_song_star_rating
	if NOT ($is_attract_mode = 1)
		if ($is_network_game)
			Achievements_OnlineMatchPlayed
		endif
		if GotParam \{song_complete}
			change Achievements_SongCompleteFlag = <song_complete>
		else
			change \{Achievements_SongCompleteFlag = 1}
		endif
		change \{Achievements_SongWonFlag = 1}
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
			Achievements_TotalCareerSongsPlayed
			if ScriptIsRunning \{Spirit_FadeOut}
				KillSpawnedScript \{name = Spirit_FadeOut}
			endif
			spawnscriptnow \{Spirit_FadeOut}
		endif
		determine_game_scores_and_winner
		printf qs("\Lteam_score = %n") n = <team_score>
		printf qs("\Lopponent_team_score = %n") n = <opponent_team_score>
		printf qs("\Ltie = %b") b = <tie>
		if ($is_network_game)
			if ($game_mode = p2_faceoff ||
					$game_mode = p2_pro_faceoff ||
					$game_mode = p4_pro_faceoff ||
					$game_mode = p8_pro_faceoff ||
					$game_mode = p6_pro_faceoff_no_mics)
				if (<team_score> > <opponent_team_score>)
					printf \{channel = achievements
						qs("\LAchievements_OnlineMatchWon")}
					printf channel = achievements qs("\Lteam_score = %n") n = <team_score>
					printf channel = achievements qs("\Lopponent_team_score = %n") n = <opponent_team_score>
					Achievements_OnlineMatchWon
				endif
			endif
		endif
		Achievements_Update
		change \{Achievements_SongWonFlag = 0}
	endif
endscript

script GuitarEvent_SongWon_Spawned 
	if ($is_attract_mode = 1)
		ui_event \{event = menu_back}
		return
	endif
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	if NOT ($game_mode = p2_battle)
	endif
	change track_last_song = ($current_song)
	change \{calibrate_lag_failed_num = 0}
	change \{last_song_failed = none}
	change \{current_song_failed_num = 0}
	GameMode_GetType
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
	if ($current_song = jamsession)
		GetSongInfo
		if NOT (<file_id>.file_id [0] = 0 && <file_id>.file_id [1] = 0)
			jam_info = {
				file_id = (<file_id>.file_id)
			}
		endif
	endif
	if GotParam \{jam_info}
		OnExitRun SongWon_WriteLeaderboardStats params = {song_checksum = ($current_song) end_credits = ($end_credits) end_session = <end_session> jam_info = <jam_info>}
	else
		OnExitRun SongWon_WriteLeaderboardStats params = {song_checksum = ($current_song) end_credits = ($end_credits) end_session = <end_session>}
	endif
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($net_pause = 1)
			net_unpausegh
		endif
		if ($player2_present)
			SendNetMessage {
				type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
	endif
	if ($game_mode = training)
		if ($special_event_stage = 0)
			generic_event_choose \{state = uistate_song_breakdown
				data = {
					for_practice = 1
				}}
		endif
		return
	elseif ($game_mode = tutorial)
		return
	endif
	Progression_EndCredits_Done
	disable_pause
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
	PauseGame
	if ($battle_do_or_die = 0)
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
			spawnscriptnow \{Cheer_Before_Explosion}
		endif
	endif
	printf \{channel = sfx
		qs("\LSONG WON SPAWNED: Current_Crowd_Looping_BG_Area_Good = %s")
		s = $Current_Crowd_Looping_BG_Area_Good}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good}
	Crowd_Surge_And_Sustain_At_End_Of_Song
	spawnscriptnow \{You_Rock_Waiting_Crowd_SFX}
	tie = false
	if ($battle_do_or_die = 1)
		SoundEvent \{event = Do_Or_Die_SFX}
		winner_text = qs("Do or Die!")
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = qs("Two")
			else
				winner = qs("One")
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($gamertag_1)
				else
					printf \{channel = achievements
						qs("\Lp1_health > p2_health")}
					Achievements_OnlineMatchWon
					name = ($gamertag_0)
				endif
				SetPlayerInfo 1 save_health = <p1_health>
				SetPlayerInfo 2 save_health = <p2_health>
				FormatText TextName = winner_text qs("%s\nRocks!") s = <name>
				<text_pos> = (640.0, 240.0)
			else
				FormatText TextName = winner_text qs("Player %s\nRocks!") s = <winner>
				if (<p2_health> = <p1_health>)
					winner_text = qs("TIE!")
				endif
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = qs("Two")
			elseif (<p1_score> > <p2_score>)
				winner = qs("One")
			else
				<tie> = true
			endif
			if (<tie> = true)
				winner_text = qs("TIE!")
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($gamertag_1)
					else
						name = ($gamertag_0)
					endif
					FormatText TextName = winner_text qs("%s\nRocks!") s = <name>
					<text_pos> = (640.0, 240.0)
				else
					FormatText TextName = winner_text qs("Player %s\nRocks!") s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			if ($is_network_game = 1)
				opponent_score = ($band2_status.score)
				our_score = ($band1_status.score)
				if (<opponent_score> > <our_score>)
					winner_text = qs("You Got Rocked!")
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				else
					winner_text = qs("You Rock!")
					winner_space_between = (45.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				endif
			else
				winner_text = qs("You Rock!")
				winner_space_between = (45.0, 0.0)
				fit_dims = (350.0, 0.0)
				winner_scale = 1.0
			endif
		endif
	endif
	spawnscriptnow \{waitAndKillHighway}
	KillSpawnedScript \{name = jiggle_text_array_elements}
	spawnscriptnow \{wait_and_play_you_rock_movie}
	Create_YouRock text = <winner_text>
	spawnscriptnow \{You_Rock_SFX_End}
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	change \{old_song = none}
	printf \{qs("\LBXBX - AFL :: Current_Transition = %a")
		a = $current_transition
		channel = BXCareer}
	if ($battle_do_or_die = 0)
		Progression_SongWon
		if ($current_transition = preencore)
			end_song
			UnPauseGame
			Transition_Play \{type = preencore}
			Transition_Wait
			change \{current_transition = none}
			PauseGame
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				ui_event \{event = menu_replace
					data = {
						state = uistate_song_breakdown
						for_encore = 1
						no_sound
					}}
			else
				generic_event_choose \{no_sound
					state = uistate_song_breakdown
					data = {
						for_encore = 1
					}}
			endif
			encore_transition = 1
		elseif ($current_transition = preboss)
			end_song
			UnPauseGame
			Transition_Play \{type = preboss}
			Transition_Wait
			change \{current_transition = none}
			PauseGame
			change \{use_last_player_scores = 1}
			change old_song = ($current_song)
			change \{show_boss_helper_screen = 1}
			change \{net_ready_to_start = 0}
			spawnscriptnow \{start_boss}
			generic_event_back \{nosound
				state = uistate_gameplay}
			return
		else
			UnPauseGame
			if ($end_credits = 1 && $current_level = load_z_quebec)
				Transition_Play \{type = FinalBandOutro}
			else
				if ($is_network_game = 0)
					Transition_Play \{type = songwon}
				else
					if ($game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff)
						opponent_score = ($band2_status.score)
						our_score = ($band1_status.score)
						if (<opponent_score> > <our_score>)
							Transition_Play \{type = songlost}
						else
							Transition_Play \{type = songwon}
						endif
					else
						Transition_Play \{type = songwon}
					endif
				endif
			endif
			Transition_Wait
			change \{current_transition = none}
			PauseGame
		endif
	else
		UnPauseGame
		Transition_Play \{type = songwon}
		KillSpawnedScript \{name = Do_Or_Die_Helper_Text}
		if ScreenElementExists \{id = do_or_die_helper_container}
			DestroyScreenElement \{id = do_or_die_helper_container}
		endif
		spawnscriptnow \{Do_Or_Die_Helper_Text
			params = {
				parent_id = yourock_text
			}}
		Wait \{0.1
			seconds}
		spawnscriptnow \{waitAndKillHighway}
		Wait \{6
			seconds}
		change \{current_transition = none}
		PauseGame
	endif
	if ($battle_do_or_die = 1)
		printf \{qs("\LBATTLE MODE, Song Won, Begin Do or Die")}
		KillSpawnedScript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		if ScreenElementExists \{id = you_rock}
			DestroyScreenElement \{id = you_rock}
		endif
		if ($is_network_game)
			if NOT (ScriptIsRunning sysnotify_handle_connection_loss)
				generic_event_choose \{state = uistate_play_song}
			endif
		else
			spawnscriptnow \{fail_song_menu_select_retry_song
				params = {
					do_or_die = 1
				}}
		endif
	else
		KillSpawnedScript \{name = create_exploding_text}
		destroy_all_exploding_text
		if ($autotest_on = 1)
			ui_event \{event = menu_change
				data = {
					state = UIstate_autotest_next_test
				}}
		endif
		if NOT GotParam \{encore_transition}
			if ($progression_beat_game_last_song = 1)
				ui_event \{event = menu_change
					data = {
						state = uistate_beat_game
					}}
			else
				loading_transition = 0
				GameMode_GetType
				if (<type> = career)
					stats_song_checksum = ($current_song)
					if progression_set_new_song_in_gig_list
						loading_transition = 1
					endif
				elseif (<type> = quickplay)
					stats_song_checksum = ($current_song)
					if quickplay_set_new_song_in_gig_list
						loading_transition = 1
						if ($current_song = jamsession && $track_last_song = jamsession)
							loading_transition = 0
						endif
					endif
				endif
				if (<loading_transition> = 1)
					change \{gameplay_loading_transition = 1}
					change \{gameplay_restart_song = 1}
					change \{net_ready_to_start = 0}
					if (<type> = quickplay)
						hide_glitch \{num_frames = 10}
					endif
					generic_event_back \{nosound
						state = uistate_gameplay}
				else
					if ($is_network_game = 1 && <type> != career)
						UnPauseGame
						Wait \{2
							seconds}
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_online_post_game_lobby
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_online_post_game_lobby
								}}
						endif
					else
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						endif
					endif
				endif
			endif
		endif
	endif
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent_L}
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent_R}
	if ScreenElementExists \{id = Wings_YouRock}
		DestroyScreenElement \{id = Wings_YouRock}
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
endscript

script SongWon_WriteLeaderboardStats 
	return
	RequireParams \{[
			song_checksum
			end_session
		]
		all}
	if ($invite_controller = -1)
		printf \{qs("\LSongWon_WriteLeaderboardStats")}
		printstruct <...>
		if ($is_network_game = 1)
			if Achievements_IsCheatingAutoKick
				autokick_cheating = 1
			else
				autokick_cheating = 0
			endif
			if NOT ($Cheat_AlwaysSlide = 1 || (<autokick_cheating> = 1))
				if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
					if (<end_credits> = 1)
						NetSessionFunc \{obj = session
							func = end_active_session}
					else
						net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
					endif
				else
					online_song_end_write_stats song_checksum = <song_checksum>
				endif
			else
				NetSessionFunc \{obj = session
					func = end_active_session}
			endif
		else
			if ($game_mode = p2_battle || $is_attract_mode = 1 || $boss_battle = 1 || <end_credits> = 1)
				end_singleplayer_game
				if ($game_mode = p2_battle)
					spawnscriptnow \{xenon_singleplayer_session_complete_uninit
						params = {
							song_failed
						}}
				else
					spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
				endif
			else
				if (<song_checksum> != jamsession)
					GameMode_GetType
					if (<type> = career || <type> = quickplay)
						net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
					elseif (<end_session> = 1)
						end_singleplayer_game
					endif
				elseif (<song_checksum> = jamsession && <end_session> = 1)
					end_singleplayer_game
				endif
			endif
		endif
		if NOT (<end_credits> = 1)
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
			elseif NOT ($boss_battle = 1)
				if NOT ($devil_finish)
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

script Do_Or_Die_Helper_Text 
	CreateScreenElement \{type = ContainerElement
		id = do_or_die_helper_container
		parent = root_window
		pos = (0.0, 0.0)}
	FormatText \{checksumname = text_checksum
		'do_or_die_helper'}
	percent = ((((1.0 - $battle_do_or_die_speed_scale) * 100.0) * ($battle_do_or_die_speed_scale_percent / ((0.0 - $battle_do_or_die_speed_scale_increase) * 100.0))) + 100.0)
	percent = (<percent> + 0.5)
	CastToInteger \{percent}
	FormatText TextName = text qs("Highway scroll speed increased to %d\%") d = <percent>
	CreateScreenElement {
		type = TextElement
		id = <text_checksum>
		parent = do_or_die_helper_container
		pos = (640.0, 650.0)
		text = <text>
		font = fontgrid_bordello
		scale = 0.5
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 0
		shadow
		shadow_rgba = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	}
	FormatText \{checksumname = text_checksum2
		'do_or_die_helper2'}
	percent = ($battle_do_or_die_attack_scale * 100.0)
	CastToInteger \{percent}
	FormatText TextName = text qs("Attack strength increased to %d\%") d = <percent>
	CreateScreenElement {
		type = TextElement
		id = <text_checksum2>
		parent = do_or_die_helper_container
		pos = (640.0, 695.0)
		text = <text>
		font = fontgrid_bordello
		scale = 0.5
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 0
		shadow
		shadow_rgba = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	}
	Wait \{5
		seconds}
	LegacyDoScreenElementMorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	LegacyDoScreenElementMorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script Boss_Unlocked_Text 
	CreateScreenElement \{type = ContainerElement
		id = boss_unlocked_text_container
		parent = root_window
		pos = (0.0, 0.0)}
	if ($current_song = bosstom)
		FormatText \{TextName = boss
			qs("\LTom Morello")}
		pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		pos = (634.0, 580.0)
		FormatText \{TextName = boss
			qs("\LSlash")}
	elseif ($current_song = bossdevil)
		pos = (800.0, 580.0)
		FormatText \{TextName = boss
			qs("\LLou")}
	endif
	FormatText \{TextName = unlocked
		qs("unlocked")}
	FormatText \{TextName = visit_store
		qs("VISIT STORE")}
	FormatText TextName = text qs("\L%s %b, %v") s = <boss> b = <unlocked> v = <visit_store>
	FormatText \{checksumname = boss_unlocked
		'boss_unlocked'}
	if ScreenElementExists id = <boss_unlocked>
		DestroyScreenElement id = <boss_unlocked>
	endif
	CreateScreenElement {
		type = TextElement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		pos = <pos>
		text = <text>
		font = fontgrid_denim_title
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	Wait \{3
		seconds}
	if ScreenElementExists id = <boss_unlocked>
		LegacyDoScreenElementMorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
endscript

script wait_and_play_you_rock_movie 
	begin
	if (isMoviePreLoaded TextureSlot = 1)
		StartPreLoadedMovie \{TextureSlot = 1}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script waitAndKillHighway 
	Wait \{0.5
		seconds}
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf qs("\Ltempo_matching_iterator started with time %d") d = <time_offset>
	get_song_prefix song = <song_name>
	FormatText checksumname = timesig '%s_timesig' s = <song_prefix> AddToStringLookup
	GetArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	even = 1
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	change \{next_beat_time = -1}
	change \{time_to_next_beat = -1}
	change \{next_beat_time2 = -1}
	change \{time_to_next_beat2 = -1}
	change tempo_iterator_offset = <time_offset>
	GetArraySize $<song>
	get_song_end_time song = ($current_song)
	begin
	<entry> = (<array_size> -2)
	<fret_time> = ($<song> [<entry>])
	if (<total_end_time> > <fret_time>)
		break
	endif
	<array_size> = (<array_size> - 1)
	repeat
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
				<timesig_num> = ($<timesig> [<timesig_entry>] [1])
				<timesig_den> = ($<timesig> [<timesig_entry>] [2])
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		if ((<time> - <skipleadin>) < $<song> [<array_entry>])
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_size>
		final_array_entry = (<array_size> - 1)
		array_size = (<array_size> - <array_entry>)
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			if (<timesig_entry> < <timesig_size>)
				if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
					<timesig_num> = ($<timesig> [<timesig_entry>] [1])
					<timesig_den> = ($<timesig> [<timesig_entry>] [2])
					fretbar_count = 0
					timesig_entry = (<timesig_entry> + 1)
				endif
			endif
			if (<array_entry> < <final_array_entry>)
				change structurename = <player_status> current_song_beat_time = ($<song> [(<array_entry> + 1)] - $<song> [<array_entry>])
				change structurename = <player_status> current_song_measure_time = (<timesig_num> * $<player_status>.current_song_beat_time)
			endif
			break
		endif
		Wait \{1
			gameframe}
		repeat
		TimeMarkerReached_ClearParams
		marker = ($<song> [<array_entry>])
		<array_entry> = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
			spawn_measure_callbacks
		endif
		if (<array_entry> < <final_array_entry>)
			change next_beat_time = ($<song> [<array_entry>])
			change time_to_next_beat = ($next_beat_time - <marker>)
			spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
		else
			change \{next_beat_time = -1}
			change \{time_to_next_beat = -1}
		endif
		if (<even> = 1)
			<next_array_entry> = (<array_entry> + 1)
			if (<next_array_entry> < <final_array_entry>)
				change next_beat_time2 = ($<song> [<next_array_entry>])
				change time_to_next_beat2 = ($next_beat_time2 - <marker>)
			else
				change \{next_beat_time2 = -1}
				change \{time_to_next_beat2 = -1}
			endif
			even = 0
		else
			even = 1
		endif
		repeat <array_size>
	endif
endscript
measure_callback = nullscript
beat_callback = nullscript

script SetMeasureCallback 
	if GotParam \{callback}
		change measure_callback = <callback>
	else
	endif
endscript

script ClearMeasureCallbacks 
	change \{measure_callback = nullscript}
endscript

script SetBeatCallback 
	if GotParam \{callback}
		change beat_callback = <callback>
	else
	endif
endscript

script GetTimeToNextBeat 
	GetSongTimeMs \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script ClearBeatCallbacks 
	change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 
	printf \{channel = tempo
		qs("\L......measure......")}
endscript

script beat_test_script 
	printf channel = tempo qs("\L    ...beat (time to next %a)...") a = <time_to_next_beat>
endscript

script GuitarEvent_StarSequenceBonus 
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if IsPs3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Awarded_SFX}
			else
				spawnscriptnow Star_Power_Awarded_SFX_Multiplayer params = {player = ($<player_status>.player)}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = Star_Power_Awarded_SFX}
		else
			spawnscriptnow Star_Power_Awarded_SFX_Multiplayer params = {player = ($<player_status>.player)}
		endif
	endif
	FormatText checksumname = container_id 'gem_container%p' p = ($<player_status>.text) AddToStringLookup = true
	player = ($<player_status>.player)
	player = (<player> - 1)
	GetArraySize \{$gem_colors}
	InputArrayGetElement name = <song> index = <array_entry>
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array>}
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
		color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = (($button_up_models [<player>]).<color>.left_pos_2d)
			<Angle> = (($button_models [<player>]).<color>.Angle)
		else
			<pos2d> = (($button_up_models [<player>]).<color>.pos_2d)
			<Angle> = (($button_models [<player>]).<color>.left_angle)
		endif
		FormatText checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <name>
			CreateScreenElement {
				type = SpriteElement
				id = <name>
				parent = <container_id>
				material = sys_Big_Bolt01_sys_Big_Bolt01
				rgba = [255 255 255 255]
				pos = <pos2d>
				rot_angle = <Angle>
				scale = $star_power_bolt_scale
				just = [center bottom]
				z_priority = 6
			}
		endif
		FormatText checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id>
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		if NOT ObjectExists id = <fx_id>
			Create2DParticleSystem {
				id = <fx_id>
				pos = <particle_pos>
				z_priority = 8.0
				material = sys_Particle_Star01_sys_Particle_Star01
				parent = <container_id>
				start_color = [0 128 255 255]
				end_color = [0 128 128 0]
				start_scale = (0.55, 0.55)
				end_scale = (0.25, 0.25)
				start_angle_spread = 360.0
				min_rotation = -120.0
				max_rotation = 240.0
				emit_start_radius = 0.0
				emit_radius = 2.0
				emit_rate = 0.04
				emit_dir = 0.0
				emit_spread = 44.0
				velocity = 24.0
				friction = (0.0, 66.0)
				time = 2.0
			}
		endif
		FormatText checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		if NOT ObjectExists id = <fx2_id>
			Create2DParticleSystem {
				id = <fx2_id>
				pos = <particle_pos>
				z_priority = 8.0
				material = sys_Particle_Star02_sys_Particle_Star02
				parent = <container_id>
				start_color = [255 255 255 255]
				end_color = [128 128 128 0]
				start_scale = (0.5, 0.5)
				end_scale = (0.25, 0.25)
				start_angle_spread = 360.0
				min_rotation = -120.0
				max_rotation = 508.0
				emit_start_radius = 0.0
				emit_radius = 2.0
				emit_rate = 0.04
				emit_dir = 0.0
				emit_spread = 28.0
				velocity = 22.0
				friction = (0.0, 55.0)
				time = 2.0
			}
		endif
		FormatText checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		<particle_pos> = (<pos2d> - (0.0, 15.0))
		if NOT ObjectExists id = <fx3_id>
			Create2DParticleSystem {
				id = <fx3_id>
				pos = <particle_pos>
				z_priority = 8.0
				material = sys_Particle_Spark01_sys_Particle_Spark01
				parent = <container_id>
				start_color = [0 255 255 255]
				end_color = [0 255 255 0]
				start_scale = (1.5, 1.5)
				end_scale = (0.25, 0.25)
				start_angle_spread = 360.0
				min_rotation = -500.0
				max_rotation = 500.0
				emit_start_radius = 0.0
				emit_radius = 2.0
				emit_rate = 0.04
				emit_dir = 0.0
				emit_spread = 180.0
				velocity = 12.0
				friction = (0.0, 0.0)
				time = 1.0
			}
		endif
		Wait \{1
			gameframes}
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	Wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	GetArraySize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		FormatText checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <name>
		FormatText checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		FormatText checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		FormatText checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx3_id> <kill_when_empty>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = ($<player_status>.player) player_text = ($<player_status>.text) multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = ($<player_status>.player) player_text = ($<player_status>.text) multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = ($<player_status>.player) player_text = ($<player_status>.text) multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	GH3_SFX_Stop_Sounds_For_KillSong <...> loading_transition = <loading_transition>
endscript

script GuitarEvent_EnterVenue 
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

script GuitarEvent_ExitVenue 
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
	ExtendCRC <gem_id> '_particle' out = fx_id
	if GotParam \{is_star}
		if ($game_mode = p2_battle || $boss_battle = 1)
			<pos> = (125.0, 170.0)
		else
			<pos> = (255.0, 170.0)
		endif
	else
		<pos> = (66.0, 20.0)
	endif
	Destroy2DParticleSystem id = <fx_id>
	Create2DParticleSystem {
		id = <fx_id>
		pos = <pos>
		z_priority = 8.0
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <gem_id>
		start_color = [255 255 255 0]
		end_color = [255 255 255 0]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.3
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 0.01
		friction = (0.0, 0.0)
		time = 0.25
	}
	spawnscriptnow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	Wait \{0.8
		seconds}
	Destroy2DParticleSystem id = <fx_id> kill_when_empty
endscript

script destroy_first_gem_fx 
	begin
	if NOT ScreenElementExists id = <gem_id>
		Destroy2DParticleSystem id = <fx_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_BattleAttackFinished 
	GH3_Battle_Attack_Finished_SFX <...>
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script GuitarEvent_TransitionEncore 
endscript

script GuitarEvent_TransitionPreBoss 
endscript

script GuitarEvent_TransitionBoss 
endscript
kick_index = 0

script GuitarEvent_Kick_Drum_Hit_Note \{player = 1}
	change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		change \{kick_index = 0}
	endif
	<highway_info> = ($highway_pos_table [<player> -1])
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthOffsetFactor)) / 32.0)
	FormatText checksumname = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	Wait \{1
		frame}
	<particle_pos> = (640.0, 630.0)
	FormatText checksumname = fx_id 'Kick_Particle%p%i' p = <player_text> i = $kick_index AddToStringLookup = true
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 0.25))
	<end_scale> = (<x_scale> * (1.875, 0.0) + (0.0, 0.5))
	Create2DParticleSystem {
		id = <fx_id>
		pos = <particle_pos>
		z_priority = 7.9
		material = sys_Particle_Elipse01_sys_Particle_Elipse01
		parent = <container_id>
		start_color = [200 0 255 255]
		end_color = [0 0 0 0]
		start_scale = <start_scale>
		end_scale = <end_scale>
		start_angle_spread = 0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.1
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.25
		friction = (0.0, 10.0)
		time = 0.2
	}
	GetPlayerInfo <player> part
	if (<part> = drum)
		GetPlayerInfo <player> four_lane_highway
	else
		four_lane_highway = 0
	endif
	if (<four_lane_highway> = 0)
		FormatText checksumname = fx2_id 'Kick_Particle2%p%i' p = <player_text> i = $kick_index AddToStringLookup = true
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = sys_Particle_Kickhit01_sys_Particle_Kickhit01
			parent = <container_id>
			start_color = [255 255 255 255]
			end_color = [0 0 0 0]
			start_scale = <start_scale>
			end_scale = <end_scale>
			start_angle_spread = 0
			min_rotation = 0
			max_rotation = 0
			emit_start_radius = 0.0
			emit_radius = 1.0
			emit_rate = 0.1
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
		FormatText checksumname = fx2_id 'Kick_Particle2%p%i' p = <player_text> i = $kick_index AddToStringLookup = true
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = Mat_Particle_Kickhit01_NORoland
			parent = <container_id>
			start_color = [255 255 255 255]
			end_color = [0 0 0 0]
			start_scale = <start_scale>
			end_scale = <end_scale>
			start_angle_spread = 0
			min_rotation = 0
			max_rotation = 0
			emit_start_radius = 0.0
			emit_radius = 1.0
			emit_rate = 0.1
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

script GuitarEvent_Hit_Open_Note 
	GuitarEvent_Kick_Drum_Hit_Note player = <player> player_text = <player_text>
endscript

script GuitarEvent_Hit_Easy_Rhythm_Note 
	GuitarEvent_Kick_Drum_Hit_Note player_text = <player_text>
endscript

script PlayerSetVolume 
	if GotParam \{volume}
		if (($<player_status>.part) = drum)
			if GotParam \{drum}
				switch <drum>
					case 1
					change structurename = <player_status> drum_volume1 = <volume>
					case 2
					change structurename = <player_status> drum_volume2 = <volume>
					case 3
					change structurename = <player_status> drum_volume3 = <volume>
					case 4
					change structurename = <player_status> drum_volume4 = <volume>
				endswitch
				return
			endif
		endif
		change structurename = <player_status> guitar_volume = <volume>
	endif
endscript

script PlayerGetVolume 
	if (($<player_status>.part) = drum)
		if GotParam \{drum}
			switch <drum>
				case 1
				return volume = ($<player_status>.drum_volume1)
				case 2
				return volume = ($<player_status>.drum_volume2)
				case 3
				return volume = ($<player_status>.drum_volume3)
				case 4
				return volume = ($<player_status>.drum_volume4)
			endswitch
		endif
	endif
	return volume = ($<player_status>.guitar_volume)
endscript

script Create_YouRock \{text = qs("You Rock!")}
	if ScreenElementExists \{id = Wings_YouRock}
		DestroyScreenElement \{id = Wings_YouRock}
	endif
	if ScreenElementExists \{id = YouRock}
		DestroyScreenElement \{id = YouRock}
	endif
	CreateScreenElement \{parent = root_window
		id = YouRock
		type = DescInterface
		desc = 'you_rock'
		z_priority = 475
		just = [
			center
			center
		]}
	YouRock :Obj_SpawnScriptNow Anim_YouRock params = {text = <text>}
endscript

script Destroy_YouRock 
	if ScriptIsRunning \{Anim_YouRock}
		KillSpawnedScript \{name = Anim_YouRock}
	endif
	if ScreenElementExists \{id = Wings_YouRock}
		DestroyScreenElement \{id = Wings_YouRock}
	endif
	if ScreenElementExists \{id = YouRock}
		DestroyScreenElement \{id = YouRock}
	endif
	if ScriptIsRunning \{Anim_YouRock}
		KillSpawnedScript \{name = Anim_YouRock}
	endif
endscript

script BX_YouRock_Lightning 
	if ($game_mode = tutorial || $game_mode = training)
		return
	endif
	Obj_SpawnScriptNow \{BX_YouRock_Shake}
	HandofGod_FX_01
endscript

script BX_YouRock_Shake 
	Wait \{0.35000002
		second}
	begin
	newpos = (((1.0, 0.0) * RandomInteger (-12.0, 12.0)) + ((0.0, 1.0) * RandomInteger (-12.0, 12.0)))
	SE_SetProps {
		rot_angle = RandomInteger (-2.0, 2.0)
		pos = {((640.0, 380.0) + <newpos>) absolute}
	}
	Wait \{2
		gameframe}
	repeat
endscript

script BX_YouRock_Flash 
	spawnscriptnow \{HandofGod_ElectricCenter_Flare_02}
	if ScriptIsRunning \{BX_YouRock_Shake}
		KillSpawnedScript \{name = BX_YouRock_Shake}
	endif
	Wait \{0.3
		second}
	BX_YouRock_BatScript {angle_start = 0 angle_end = (Random (@ 270 @ -270 )) motion = ease_in time = 0.5}
endscript

script BX_YouRock_BatScript 
	SE_SetProps rot_angle = <angle_start>
	Wait \{1
		gameframe}
	SE_SetProps rot_angle = <angle_end> motion = <motion> time = <time>
endscript

script BX_LerpColor 
	newColor = [0 0 0 0]
	i = 0
	begin
	val = (((((<p2> [<i>]) - (<p1> [<i>])) * <factor>) / 100) + (<p1> [<i>]))
	SetArrayElement ArrayName = newColor index = <i> newvalue = <val>
	<i> = (<i> + 1)
	repeat 4
	return newColor = <newColor>
endscript

script Anim_YouRock 
	YOUROCK_TEXT_MAX_WIDTH = 940
	YOUROCK_TEXT_MAX_HEIGHT = 250
	YouRock :SE_SetProps {
		Wings_YouRock_scale = 0
		Wings_YouRock_alpha = 0
		yourock_text = <text>
	}
	YouRock :SE_GetProps
	currentTextWidth = ((<YouRock_dims> [0]) * (<YouRock_scale> [0]))
	if (<currentTextWidth> > <YOUROCK_TEXT_MAX_WIDTH>)
		textWidthScale = (<YOUROCK_TEXT_MAX_WIDTH> / (<YouRock_dims> [0]))
		YouRock :SE_SetProps {
			YouRock_scale = (<textWidthScale> * (1.0, 1.0))
			YouRock_line_scale = 0.8
		}
	elseif ((<YouRock_dims> [1]) > <YOUROCK_TEXT_MAX_HEIGHT>)
		YouRock :SE_SetProps \{YouRock_scale = (0.8, 0.8)
			YouRock_line_scale = 0.8}
	endif
	fps = 12.0
	original_size = 300
	anim_params = [
		{scale = 69.3 alpha = 0.0 motion = ease_in blast_factor = 0 time = 0 spawn = BX_YouRock_BatScript spawn_params = {angle_start = (Random (@ 1440 @ -1440 )) angle_end = 0 motion = ease_out time = 0.6666}}
		{scale = 413.0 alpha = 0.8 motion = ease_out blast_factor = 0 time = 8}
		{scale = 420.0 alpha = 1.0 motion = ease_out blast_factor = 0 time = 1}
		{scale = 374.1 alpha = 1.0 motion = ease_in blast_factor = 0 time = 3 spawn = BX_YouRock_Lightning}
		{scale = 384.1 alpha = 1.0 motion = ease_in blast_factor = 0 time = 3}
		{scale = 364.1 alpha = 1.0 motion = ease_out blast_factor = 0 time = 4}
		{scale = 375.1 alpha = 1.0 motion = ease_in blast_factor = 0 time = 4}
		{scale = 358.1 alpha = 1.0 motion = ease_out blast_factor = 12 time = 5}
		{scale = 388.1 alpha = 1.0 motion = ease_in blast_factor = 24 time = 5}
		{scale = 345.1 alpha = 1.0 motion = ease_in blast_factor = 64 time = 5}
		{scale = 700.0 alpha = 0.8 motion = ease_in blast_factor = 100 time = 2 spawn = BX_YouRock_Flash}
		{scale = 74.6 alpha = 0.0 motion = ease_out blast_factor = 100 time = 7}
	]
	GetArraySize <anim_params>
	iter = 0
	begin
	if StructureContains Structure = (<anim_params> [<iter>]) spawn
		if StructureContains Structure = (<anim_params> [<iter>]) spawn_params
			YouRock :Obj_SpawnScriptNow ((<anim_params> [<iter>]).spawn) params = ((<anim_params> [<iter>]).spawn_params)
		else
			YouRock :Obj_SpawnScriptNow ((<anim_params> [<iter>]).spawn)
		endif
	endif
	BX_LerpColor p1 = [255 255 255 255] p2 = [210 235 255 255] factor = ((<anim_params> [<iter>]).blast_factor)
	Wings_YouRock_rgba = <newColor>
	BX_LerpColor p1 = [203 151 51 255] p2 = [210 235 255 255] factor = ((<anim_params> [<iter>]).blast_factor)
	YouRock_rgba = <newColor>
	YouRock :SE_SetProps {
		Wings_YouRock_scale = (((<anim_params> [<iter>]).scale) / <original_size>)
		Wings_YouRock_alpha = ((<anim_params> [<iter>]).alpha)
		BlastedWings_alpha = (((<anim_params> [<iter>]).blast_factor) / 100.0)
		YouRock_rgba = <YouRock_rgba>
		Wings_YouRock_rgba = <Wings_YouRock_rgba>
		motion = ((<anim_params> [<iter>]).motion)
		time = (((<anim_params> [<iter>]).time) / <fps>)
	}
	Wait (((<anim_params> [<iter>]).time) / <fps>) second
	<iter> = (<iter> + 1)
	repeat <array_size>
	Wait \{0.5
		second}
	YouRock :Die
endscript

script hot_start_achieved \{Band = 0
		combo = 0}
	GameMode_GetType
	if (<type> = training)
		return
	endif
	if (<player> = 1)
		printf \{channel = sfx
			qs("\LThis is player 1")}
		if isSinglePlayerGame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_HotStart_SinglePlayer params = {combo = <combo>}
		elseif ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_HotStart_P1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_HotStart_P1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (415.0, 170.0)
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs("\LThis is player multiple")}
		if ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (865.0, 170.0)
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		endif
	endif
	if NOT GameMode_IsBandScoring
		GetPlayerInfo <player> part
		if (<part> = Vocals)
			vocals_message_delayed {player = <player> text = qs("Hot Start!") rgba = [255 172 64 255]}
		else
			hud_create_message player = <player> text = qs("Hot Start!")
		endif
	elseif (<Band> = 1)
		hud_create_message Band text = qs("Hot Start!") style_script = hud_message_band_streak_style style_script_params = {players = <players>}
	endif
endscript

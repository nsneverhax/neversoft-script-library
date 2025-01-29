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
		event = hit_mine
		Scr = guitarevent_hitmine
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
		event = first_gem
		Scr = GuitarEvent_CreateFirstGem
	}
	{
		Type = call
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
	{
		Type = spawn
		event = explode_gem
		Scr = guitarevent_explodegem
	}
]

script create_guitar_events 
	printf qs(0x0f26afab) a = <player_text>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	printf \{qs(0x916cce78)}
	event = ($guitar_events [<array_entry>].event)
	Type = ($guitar_events [<array_entry>].Type)
	ExtendCrc <event> <player_text> out = event
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
	printf qs(0x5fa77966) d = <time_offset> e = <event_string>
	get_song_prefix song = <song_name>
	formatText checksumName = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup
	array_entry = 0
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

script guitarevent_explodegem \{mine = 0}
	formatText checksumName = container_id 'gem_container%p' p = ($<player_status>.text) AddToStringLookup = true
	formatText checksumName = fx2_id '%x%y' X = <X> y = <y>
	Pos = ((<X> * (1.0, 0.0)) + (<y> * (0.0, 1.0)))
	Destroy2DParticleSystem id = <fx2_id>
	if NOT ObjectExists id = <fx2_id>
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <Pos>
			z_priority = 8.0
			material = mat_particle_smoke01
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
			Emit_Rate = 0.05
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 1.0
			friction = (0.0, 30.0)
			time = 0.25
		}
	endif
	formatText checksumName = fx3_id '%x%y' X = <X> y = <y>
	Destroy2DParticleSystem id = <fx3_id>
	if NOT ObjectExists id = <fx3_id>
		Create2DParticleSystem {
			id = <fx3_id>
			Pos = <Pos>
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
			Emit_Rate = 0.002
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
			SpawnScriptNow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
		endif
	else
		if NOT (($<player_status>.part) = drum)
			playergetvolume player_status = <player_status>
			if NOT (<Volume> = 0)
				if (<silent_miss> = 1)
					SpawnScriptNow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
				else
					if NOT (<extended_miss> = 1)
						playersetvolume player_status = <player_status> Volume = 0
						UpdateGuitarVolume
						jam_update_volume Volume = 0 Player = ($<player_status>.Player)
					endif
				endif
			endif
		endif
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			if CompositeObjectExists Name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					bandmanager_missednote Name = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	inputarraygetelement Name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) Color = orange
	endif
	if GotParam \{drum_index}
		if (<drum_index> = 0)
			get_savegame_from_controller controller = ($<player_status>.controller)
			SetGlobalTags savegame = <savegame> achievement_info params = {green_notes_exist = 1}
			SetGlobalTags savegame = <savegame> achievement_info params = {green_note_missed = 1}
		endif
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formatText checksumName = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> Seconds
	if ($<player_status>.star_power_used = 1)
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	Guitar_Wrong_Note_Sound_Logic <...>
	if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
		playersetvolume player_status = <player_status> Volume = 0
		UpdateGuitarVolume
		jam_update_volume Volume = 0 Player = ($<player_status>.Player)
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			if CompositeObjectExists Name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					LaunchEvent Type = Anim_MissedNote target = ($<player_status>.band_member)
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
	if ($show_play_log = 1)
		GetGlobalTags \{user_options}
		CastToInteger \{lag_calibration}
		Mod a = <lag_calibration> b = 1000
		<video_offset> = <Mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		inputarraygetelement Name = <song> index = <array_entry>
		note_time = (<gem_array> [0])
		if (<off_note> < 0)
			output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> Color = green
		else
			output_log_text qs(0x257db375) n = <off_note> t = <note_time> Color = darkgreen
		endif
	endif
	if (<updatevolume> = true)
		UpdateGuitarVolume
		jam_update_volume Volume = 100 Player = ($<player_status>.Player)
	endif
endscript

script GuitarEvent_HitNote 
	SpawnScriptNow GuitarEvent_HitNote_Spawned params = {<...>}
endscript

script GuitarEvent_HitNote_Spawned 
	if GotParam \{kick}
		guitarevent_kick_drum_hit_note Player = <Player> player_text = <player_text>
	elseif GotParam \{open_note}
		guitarevent_hit_open_note Player = <Player> player_text = <player_text>
	elseif GotParam \{easy_rhythm_note}
		guitarevent_hit_easy_rhythm_note player_text = <player_text>
	else
		if ($game_mode = p2_battle || $boss_battle = 1)
			Change structurename = <player_status> last_hit_note = <Color>
		endif
		if (<Color> = green)
			getplayerinfo <Player> controller
			get_savegame_from_controller controller = <controller>
			SetGlobalTags savegame = <savegame> achievement_info params = {green_notes_exist = 1}
		endif
		Wait \{1
			gameframe}
		if GotParam \{drum_accent}
			drum_accent_hit_particle_fx {fx_id = <fx_id> Pos = <Pos> Player = <Player> drum_index = <drum_index>}
		endif
		Scale = (2.0, 2.0)
		NoteFX <...> star = ($<player_status>.star_power_used) Name = <fx_id>
		Wait \{6
			gameframes}
		Destroy2DParticleSystem id = <particle_id> kill_when_empty
		Wait \{10
			gameframes}
		if ScreenElementExists id = <fx_id>
			DestroyScreenElement id = <fx_id>
		endif
	endif
	achievements_checkforbandstreak
endscript

script guitarevent_drumfillhit 
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
	Emit_Rate = 0.02
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
	Emit_Rate = 0.02
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
	Emit_Rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script guitarevent_hitmine 
	SpawnScriptNow guitarevent_hitmine_spawned params = {<...>}
endscript

script guitarevent_hitmine_spawned 
	if ($<player_status>.highway_position = left)
		SoundEvent \{event = gh_sfx_battlemode_mine_explode_p1}
	else
		SoundEvent \{event = gh_sfx_battlemode_mine_explode_p2}
	endif
	SpawnScriptNow hammer_highway params = {other_player_text = <player_text>}
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	<particle_pos> = (<Pos> - (0.0, 20.0))
	ExtendCrc <mine_fx_id> '_hit_particle' out = particle_id
	Destroy2DParticleSystem id = <particle_id>
	Create2DParticleSystem {
		id = <particle_id>
		Pos = <particle_pos>
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
		Emit_Rate = 0.002
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 22.0
		friction = (0.0, 44.0)
		time = 0.5
	}
	Wait \{1
		Frame}
	ExtendCrc <mine_fx_id> '_hit_particle1' out = particle1_id
	Destroy2DParticleSystem id = <particle1_id>
	Create2DParticleSystem {
		id = <particle1_id>
		Pos = <particle_pos>
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
		Emit_Rate = 0.002
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 4.0
		friction = (0.0, 0.0)
		time = 0.5
	}
	Wait \{1
		Frame}
	ExtendCrc <mine_fx_id> '_hit_particle2' out = particle2_id
	Destroy2DParticleSystem id = <particle2_id>
	Create2DParticleSystem {
		id = <particle2_id>
		Pos = <particle_pos>
		z_priority = 8.0
		material = mat_particle_smoke01
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
		Emit_Rate = 0.05
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
	Wait <wait_time_slice> Seconds
	repeat <crowd_decrease_count>
	Destroy2DParticleSystem id = <particle_id> kill_when_empty
	Destroy2DParticleSystem id = <particle1_id> kill_when_empty
	Destroy2DParticleSystem id = <particle2_id> kill_when_empty
endscript

script killminefx 
	Destroy2DParticleSystem \{id = all}
	KillSpawnedScript \{Name = guitarevent_hitmine_spawned}
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 1
		Player = 1}
	<container_pos> = (<Pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp1 Pos = <container_pos>
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 2
		Player = 2}
	<container_pos> = (<Pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp2 Pos = <container_pos>
endscript

script drum_accent_hit_particle_fx 
	formatText checksumName = container_id 'gem_containerp%p' p = <Player> AddToStringLookup = true
	<container_id> :Obj_SpawnScriptNow drum_accent_hit_particle_fx_spawn params = {fx_id = <fx_id> Pos = <Pos> Player = <Player> drum_index = <drum_index> container_id = <container_id>}
endscript

script drum_accent_hit_particle_fx_spawn 
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		clonematerial = mat_note_hit_xplosion1
		rgba = [255 255 255 255]
		Pos = <Pos>
		rot_angle = (0)
		Scale = (2.0, 2.0)
		just = [center bottom]
		z_priority = 6
	}
	Wait \{16
		frames}
	DestroyScreenElement id = <id>
endscript

script GuitarEvent_StarPowerOn 
	KillSpawnedScript \{Name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		GH_Star_Power_Verb_On Player = <Player>
	endif
	formatText checksumName = scriptID '%p_StarPower_StageFX' p = <player_text>
	SpawnScriptLater Do_StarPower_StageFX id = <scriptID> params = {<...>}
	StarPowerOn Player = <Player>
	if ($current_num_players = 4)
		if (all_players_using_starpower)
			SpawnScriptNow \{play_group_star_power_animation}
			Change \{achievements_ride_the_lightning_flag = 1}
		endif
	endif
	hud_meter_glow_blue
endscript

script GuitarEvent_StarPowerOff 
	KillSpawnedScript \{Name = highway_pulse_black}
	if isps3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = star_power_release_center_gh4}
				SoundEvent \{event = star_power_release_front_gh4}
			else
				SpawnScriptNow star_power_release_sfx_multiplayer params = {Player = ($<player_status>.Player)}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = star_power_release_center_gh4}
			SoundEvent \{event = star_power_release_front_gh4}
		else
			SpawnScriptNow star_power_release_sfx_multiplayer params = {Player = ($<player_status>.Player)}
		endif
	endif
	GH_Star_Power_Verb_Off Player = ($<player_status>.Player)
	SpawnScriptNow rock_meter_star_power_off params = {player_text = <player_text>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	formatText checksumName = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	SpawnScriptNow \{Kill_StarPower_Camera}
	hud_meter_glow_hide_blue
endscript

script GuitarEvent_PreFretbar 
	SpawnScriptNow \{gh_audible_metronome}
	waitTime = 0.18
	Wait <waitTime> Seconds
	SpawnScriptNow clapping_logic params = {<...>}
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
	Duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	GetHeldPattern controller = ($<player_status>.controller) Player = ($<player_status>.Player) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		playersetvolume player_status = <player_status> Volume = 100
		UpdateGuitarVolume
		jam_update_volume Volume = 100 Player = ($<player_status>.Player)
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
	if IsGuitarController controller = ($<player_status>.controller)
		GetStrumPattern entry = 0 song = <song>
		SpawnScriptNow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		playersetvolume player_status = <player_status> Volume = 100
		UpdateGuitarVolume
		jam_update_volume Volume = 100 Player = ($<player_status>.Player)
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
	Change \{failed_song = 1}
	Change \{Achievements_SongWonFlag = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	dynamicadmanager_issuecue \{cue = commitimpressions}
	if ($is_network_game)
		online_fail_song
	elseif ($game_mode = p2_battle)
		GuitarEvent_SongWon \{battle_win = 1}
	else
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
		SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
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
	lightshow_songfailed
	if ($is_network_game)
		KillSpawnedScript \{Name = dispatch_player_state}
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		mark_unsafe_for_shutdown
	endif
	GetSongTimeMs
	Change failed_song_time = <time>
	PauseGame
	Progression_SongFailed
	if ($boss_battle = 1)
		disable_pause
		preload_movie = 'Player2_wins'
		KillMovie \{textureSlot = 1}
		PreLoadMovie {
			movie = <preload_movie>
			textureSlot = 1
			TexturePri = 70
			no_looping
			no_hold
			noWait
		}
		formatText TextName = winner_text qs(0x237c4f68) s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = Morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = Satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		SpawnScriptNow \{wait_and_play_you_rock_movie}
		Wait \{0.2
			Seconds}
		SpawnScriptNow \{waitandkillhighway}
		SpawnScriptNow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	if ($is_network_game = 0)
		end_singleplayer_game
		printstruct <...>
		xenon_singleplayer_session_begin_uninit
		SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	else
		if NetSessionFunc \{Obj = session
				func = has_active_session}
			NetSessionFunc \{Obj = session
				func = end_active_session}
		endif
	endif
	UnPauseGame
	if ($is_network_game)
		ui_event_wait_for_safe
		disable_pause
	endif
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	SoundEvent \{event = $current_crowd_transition_neutral_to_bad_l}
	SoundEvent \{event = $current_crowd_transition_neutral_to_bad_r}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	disable_pause
	song_failed_show_highways
	Transition_Play \{Type = songlost}
	Transition_Wait
	Change \{current_transition = None}
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
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
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
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
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				SpawnScriptNow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_online_post_game_lobby
						}
					}}
			else
				SpawnScriptNow \{ui_event
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
		SoundEvent \{event = $current_crowd_transition_neutral_to_bad_l}
		SoundEvent \{event = $current_crowd_transition_neutral_to_bad_r}
		BG_Crowd_Front_End_Silence \{immediate = 1}
	else
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	KillSpawnedScript \{Name = create_exploding_text}
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
	StopRendering
	songunload
	PauseGame
	StartRendering
	Wait \{0.5
		Second}
	Player = 1
	begin
	getplayerinfo <Player> current_health
	if (<current_health> < $health_poor_medium)
		song_failed_highway_x {Player = <Player>}
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
	SoundEvent \{event = band_failed_x_sfx}
	if NOT ($band1_status.star_power_active)
		if ($band1_status.star_power_amount > (100.0 / 6.0))
			Wait \{0.3
				Seconds}
			hud_create_message \{Band
				text = qs(0xdb96ac31)
				Priority = 100
				rgba = [
					0
					200
					200
					255
				]}
		endif
	endif
	Wait \{2.2
		Seconds}
	UnPauseGame
endscript

script song_failed_highway_x 
	getplayerinfo <Player> hud_parent
	getplayerinfo <Player> part
	Pos = (80.0, 40.0)
	Scale = 2.0
	switch <part>
		case vocals
		icon = band_hud_microphone2
		Scale = 1.75
		if ($current_num_players = 2)
			Pos = (530.0, 20.0)
		else
			Pos = (500.0, 80.0)
		endif
		case guitar
		icon = band_hud_guitar2
		case bass
		icon = band_hud_bass2
		case drum
		icon = band_hud_drums2
	endswitch
	if hud_root :desc_resolvealias Name = <hud_parent> param = parent_id
		if ScreenElementExists id = <parent_id>
			CreateScreenElement {
				Type = SpriteElement
				parent = <parent_id>
				texture = <icon>
				just = [center center]
				z_priority = 400
				Scale = <Scale>
				Pos = <Pos>
				rgba = [255 0 0 255]
			}
		endif
	endif
endscript
gpulog_outputfilename = 'none'

script GuitarEvent_SongWon \{battle_win = 0}
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
			formatText \{TextName = FileName
				'%s_stats'
				s = $current_song
				DontAssertForChecksums}
			TextOutputStart
			TextOutput \{text = qs(0x3f02a90c)}
			formatText TextName = text qs(0xfccb1331) s = ($player1_status.score) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text qs(0x26c27108) n = ($player1_status.notes_hit) t = ($player1_status.total_notes) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text qs(0xd67d4308) r = ($player1_status.best_run) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text qs(0x6bb1c560) m = ($player1_status.max_notes) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text qs(0x26a9ba16) b = ($player1_status.base_score) DontAssertForChecksums
			TextOutput text = <text>
			if (($player1_status.base_score) = 0)
				formatText \{TextName = text
					qs(0x30357c57)}
			else
				formatText TextName = text qs(0xbcc2e990) s = (($player1_status.score) / ($player1_status.base_score)) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (($player1_status.total_notes) = 0)
				formatText \{TextName = text
					qs(0xc8e34ec5)}
			else
				formatText TextName = text qs(0x2b87036c) s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text FileName = <FileName>
		endif
	endif
	if ScreenElementExists \{id = metallifacts_container}
		achievements_the_memory_remains
		ui_event_wait \{event = menu_back}
		return
	endif
	if ($current_num_players = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 0)
			Change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			Change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		Change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			Change \{save_current_powerups_p1 = $current_powerups_p1}
			Change \{save_current_powerups_p2 = $current_powerups_p2}
			Change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			Change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			Change structurename = player1_status save_health = <p1_health>
			Change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if ScreenElementExists \{id = battlemode_container}
				DestroyScreenElement \{id = battlemode_container}
			endif
			Change \{battle_do_or_die = 1}
			Change battle_do_or_die_speed_scale = ($battle_do_or_die_speed_scale + $battle_do_or_die_speed_scale_increase)
			if ($battle_do_or_die_speed_scale < $hyperspeed_fastest)
				Change \{battle_do_or_die_speed_scale = $hyperspeed_fastest}
			endif
			Change battle_do_or_die_attack_scale = ($battle_do_or_die_attack_scale + $battle_do_or_die_attack_scale_increase)
			if ($battle_do_or_die_attack_scale > $battle_do_or_die_attack_scale_max)
				Change \{battle_do_or_die_attack_scale = $battle_do_or_die_attack_scale_max}
			endif
		else
			battlemode_killspawnedscripts
			Change \{battle_do_or_die = 0}
			Change \{battle_do_or_die_speed_scale = 1.0}
			Change \{battle_do_or_die_attack_scale = 1.0}
		endif
	endif
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	dynamicadmanager_issuecue \{cue = commitimpressions}
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	SpawnScriptNow \{GuitarEvent_SongWon_Spawned}
	if NOT ($is_attract_mode = 1)
		if ($is_network_game)
			achievements_onlinematchplayed
		endif
		if GotParam \{song_complete}
			Change achievements_songcompleteflag = <song_complete>
		else
			Change \{achievements_songcompleteflag = 1}
		endif
		Change \{Achievements_SongWonFlag = 1}
		achievements_update
		Change \{Achievements_SongWonFlag = 0}
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
	Change track_last_song = ($current_song)
	Change \{calibrate_lag_failed_num = 0}
	Change \{last_song_failed = None}
	Change \{current_song_failed_num = 0}
	gamemode_gettype
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
	if ($current_song = jamsession)
		getsonginfo
		if NOT (<file_id>.file_id [0] = 0 && <file_id>.file_id [1] = 0)
			jam_info = {
				file_id = (<file_id>.file_id)
			}
		endif
	endif
	if GotParam \{jam_info}
		OnExitRun songwon_writeleaderboardstats params = {song_checksum = ($current_song) end_credits = ($end_credits) end_session = <end_session> jam_info = <jam_info>}
	else
		OnExitRun songwon_writeleaderboardstats params = {song_checksum = ($current_song) end_credits = ($end_credits) end_session = <end_session>}
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
				Type = net_win_song
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
				state = Uistate_gameplay
			}}
	endif
	PauseGame
	if ($battle_do_or_die = 0)
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
			SpawnScriptNow \{cheer_before_explosion}
		endif
	endif
	printf \{channel = sfx
		qs(0x86224445)
		s = $current_crowd_looping_bg_area_good}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good}
	crowd_surge_and_sustain_at_end_of_song
	SpawnScriptNow \{You_Rock_Waiting_Crowd_SFX}
	tie = FALSE
	if ($battle_do_or_die = 1)
		SoundEvent \{event = do_or_die_sfx}
		winner_text = qs(0xd29a9f4b)
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = qs(0xcdaffbf0)
			else
				winner = qs(0x7340f937)
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					Name = ($gamertag_1)
				else
					Name = ($gamertag_0)
				endif
				setplayerinfo 1 save_health = <p1_health>
				setplayerinfo 2 save_health = <p2_health>
				formatText TextName = winner_text qs(0xf361b577) s = <Name>
				<text_pos> = (640.0, 240.0)
			else
				formatText TextName = winner_text qs(0xe3029fec) s = <winner>
				if (<p2_health> = <p1_health>)
					winner_text = qs(0x43b33be2)
				endif
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = qs(0xcdaffbf0)
			elseif (<p1_score> > <p2_score>)
				winner = qs(0x7340f937)
			else
				<tie> = true
			endif
			if (<tie> = true)
				winner_text = qs(0x43b33be2)
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						Name = ($gamertag_1)
					else
						Name = ($gamertag_0)
					endif
					formatText TextName = winner_text qs(0xf361b577) s = <Name>
					<text_pos> = (640.0, 240.0)
				else
					formatText TextName = winner_text qs(0xe3029fec) s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			if ($is_network_game = 1)
				opponent_score = ($band2_status.score)
				our_score = ($band1_status.score)
				if (<opponent_score> > <our_score>)
					winner_text = qs(0x7147fa8b)
					winner_space_between = (45.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				else
					winner_text = qs(0x6f6d143d)
					winner_space_between = (45.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				endif
			else
				winner_text = Random (@ qs(0xebdedfc6) @ qs(0xebdedfc6) )
				winner_space_between = (45.0, 0.0)
				fit_dims = (350.0, 0.0)
				winner_scale = 1.0
			endif
		endif
	endif
	SpawnScriptNow \{waitandkillhighway}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	SpawnScriptNow \{wait_and_play_you_rock_movie}
	create_you_rock text = <winner_text>
	SpawnScriptNow \{you_rock_sfx_end}
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	Change \{old_song = None}
	if ($battle_do_or_die = 0)
		Progression_SongWon
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
			ENCORE_TRANSITION = 1
		elseif ($current_transition = preboss)
			end_song
			UnPauseGame
			Transition_Play \{Type = preboss}
			Transition_Wait
			Change \{current_transition = None}
			PauseGame
			Change \{use_last_player_scores = 1}
			Change old_song = ($current_song)
			Change \{show_boss_helper_screen = 1}
			Change \{net_ready_to_start = 0}
			SpawnScriptNow \{start_boss}
			generic_event_back \{nosound
				state = Uistate_gameplay}
			return
		else
			UnPauseGame
			if ($end_credits = 1 && $current_level = load_z_newyork)
				Transition_Play \{Type = finalbandoutro}
			else
				if ($is_network_game = 0)
					Transition_Play \{Type = songwon}
				else
					if ($game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff)
						opponent_score = ($band2_status.score)
						our_score = ($band1_status.score)
						if (<opponent_score> > <our_score>)
							Transition_Play \{Type = songlost}
						else
							Transition_Play \{Type = songwon}
						endif
					else
						Transition_Play \{Type = songwon}
					endif
				endif
			endif
			Transition_Wait
			Change \{current_transition = None}
			PauseGame
		endif
	else
		UnPauseGame
		Transition_Play \{Type = songwon}
		KillSpawnedScript \{Name = do_or_die_helper_text}
		if ScreenElementExists \{id = do_or_die_helper_container}
			DestroyScreenElement \{id = do_or_die_helper_container}
		endif
		SpawnScriptNow \{do_or_die_helper_text
			params = {
				parent_id = yourock_text
			}}
		Wait \{0.1
			Seconds}
		SpawnScriptNow \{waitandkillhighway}
		Wait \{6
			Seconds}
		Change \{current_transition = None}
		PauseGame
	endif
	if ($battle_do_or_die = 1)
		printf \{qs(0x338c6d2b)}
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		if ScreenElementExists \{id = You_Rock}
			DestroyScreenElement \{id = You_Rock}
		endif
		if ($is_network_game)
			if NOT (ScriptIsRunning sysnotify_handle_connection_loss)
				generic_event_choose \{state = uistate_play_song}
			endif
		else
			SpawnScriptNow \{fail_song_menu_select_retry_song
				params = {
					do_or_die = 1
				}}
		endif
	elseif ($end_credits = 1 && $current_song = $final_credits_song)
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		Change \{end_credits = 0}
		career_song_ended_select_quit \{for_credits_venue = 1}
		get_progression_globals ($current_progression_flag)
		ui_memcard_autosave \{event = menu_back
			state = uistate_gig_posters
			data = {
				all_active_players = true
			}}
	else
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_all_exploding_text
		if ($autotest_on = 1)
			ui_event \{event = menu_change
				data = {
					state = uistate_autotest_next_test
				}}
		endif
		if NOT GotParam \{ENCORE_TRANSITION}
			if ($progression_beat_game_last_song = 1)
				ui_event \{event = menu_change
					data = {
						state = uistate_beat_game
					}}
			else
				loading_transition = 0
				gamemode_gettype
				if (<Type> = career)
					stats_song_checksum = ($current_song)
					if progression_set_new_song_in_gig_list
						loading_transition = 1
					endif
				elseif (<Type> = quickplay)
					stats_song_checksum = ($current_song)
					if quickplay_set_new_song_in_gig_list
						loading_transition = 1
						if ($current_song = jamsession && $track_last_song = jamsession)
							loading_transition = 0
						endif
					endif
				endif
				if (<loading_transition> = 1)
					Change \{gameplay_loading_transition = 1}
					Change \{gameplay_restart_song = 1}
					Change \{net_ready_to_start = 0}
					if (<Type> = quickplay)
						hide_glitch \{num_frames = 10}
					endif
					generic_event_back \{nosound
						state = Uistate_gameplay}
				else
					if ($is_network_game = 1 && <Type> != career)
						UnPauseGame
						Wait \{2
							Seconds}
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
	SoundEvent \{event = $current_crowd_swell_short_soundevent_l}
	SoundEvent \{event = $current_crowd_swell_short_soundevent_r}
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
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
		if ($is_network_game = 1)
			if achievements_ischeatingautokick
				autokick_cheating = 1
			else
				autokick_cheating = 0
			endif
			if NOT ($cheat_alwaysslide = 1 || (<autokick_cheating> = 1))
				if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
					if (<end_credits> = 1)
						NetSessionFunc \{Obj = session
							func = end_active_session}
					else
						net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
					endif
				else
					online_song_end_write_stats song_checksum = <song_checksum>
				endif
			else
				NetSessionFunc \{Obj = session
					func = end_active_session}
			endif
		else
			if ($game_mode = p2_battle || $is_attract_mode = 1 || $boss_battle = 1 || <end_credits> = 1)
				end_singleplayer_game
				if ($game_mode = p2_battle)
					SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
						params = {
							song_failed
						}}
				else
					SpawnScriptNow \{xenon_singleplayer_session_complete_uninit}
				endif
			else
				if (<song_checksum> != jamsession)
					gamemode_gettype
					if (<Type> = career || <Type> = quickplay)
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
	KillMovie \{textureSlot = 1}
endscript

script do_or_die_helper_text 
	CreateScreenElement \{Type = ContainerElement
		id = do_or_die_helper_container
		parent = root_window
		Pos = (0.0, 0.0)}
	formatText \{checksumName = text_checksum
		'do_or_die_helper'}
	percent = ((((1.0 - $battle_do_or_die_speed_scale) * 100.0) * ($battle_do_or_die_speed_scale_percent / ((0.0 - $battle_do_or_die_speed_scale_increase) * 100.0))) + 100.0)
	percent = (<percent> + 0.5)
	CastToInteger \{percent}
	formatText TextName = text qs(0xeb050f05) d = <percent>
	CreateScreenElement {
		Type = TextElement
		id = <text_checksum>
		parent = do_or_die_helper_container
		Pos = (640.0, 500.0)
		text = <text>
		font = fontgrid_text_a8
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	formatText \{checksumName = text_checksum2
		'do_or_die_helper2'}
	percent = ($battle_do_or_die_attack_scale * 100.0)
	CastToInteger \{percent}
	formatText TextName = text qs(0x4dbb2c86) d = <percent>
	CreateScreenElement {
		Type = TextElement
		id = <text_checksum2>
		parent = do_or_die_helper_container
		Pos = (640.0, 540.0)
		text = <text>
		font = fontgrid_text_a8
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	Wait \{5
		Seconds}
	legacydoscreenelementmorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	legacydoscreenelementmorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script Boss_Unlocked_Text 
	CreateScreenElement \{Type = ContainerElement
		id = boss_unlocked_text_container
		parent = root_window
		Pos = (0.0, 0.0)}
	if ($current_song = bosstom)
		formatText \{TextName = boss
			qs(0x99bce787)}
		Pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		Pos = (634.0, 580.0)
		formatText \{TextName = boss
			qs(0xd4b29c64)}
	elseif ($current_song = bossdevil)
		Pos = (800.0, 580.0)
		formatText \{TextName = boss
			qs(0x88f8861c)}
	endif
	formatText \{TextName = unlocked
		qs(0xcdb78f2b)}
	formatText \{TextName = visit_store
		qs(0xb1aaa21c)}
	formatText TextName = text qs(0xa7492276) s = <boss> b = <unlocked> v = <visit_store>
	formatText \{checksumName = boss_unlocked
		'boss_unlocked'}
	if ScreenElementExists id = <boss_unlocked>
		DestroyScreenElement id = <boss_unlocked>
	endif
	CreateScreenElement {
		Type = TextElement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		Pos = <Pos>
		text = <text>
		font = fontgrid_text_a11
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	Wait \{3
		Seconds}
	if ScreenElementExists id = <boss_unlocked>
		legacydoscreenelementmorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
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
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf qs(0x267f53bc) d = <time_offset>
	get_song_prefix song = <song_name>
	formatText checksumName = timesig '%s_timesig' s = <song_prefix> AddToStringLookup
	GetArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_Size>
	timesig_num = 0
	measure_count = 0
	even = 1
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	Change \{next_beat_time = -1}
	Change \{time_to_next_beat = -1}
	Change \{next_beat_time2 = -1}
	Change \{time_to_next_beat2 = -1}
	Change tempo_iterator_offset = <time_offset>
	GetArraySize $<song>
	get_song_end_time song = ($current_song)
	begin
	<entry> = (<array_Size> -2)
	<fret_time> = ($<song> [<entry>])
	if (<total_end_time> > <fret_time>)
		break
	endif
	<array_Size> = (<array_Size> - 1)
	repeat
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
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
		repeat <array_Size>
		final_array_entry = (<array_Size> - 1)
		array_Size = (<array_Size> - <array_entry>)
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
				Change structurename = <player_status> current_song_beat_time = ($<song> [(<array_entry> + 1)] - $<song> [<array_entry>])
				Change structurename = <player_status> current_song_measure_time = (<timesig_num> * $<player_status>.current_song_beat_time)
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
			Change next_beat_time = ($<song> [<array_entry>])
			Change time_to_next_beat = ($next_beat_time - <marker>)
			spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
		else
			Change \{next_beat_time = -1}
			Change \{time_to_next_beat = -1}
		endif
		if (<even> = 1)
			<next_array_entry> = (<array_entry> + 1)
			if (<next_array_entry> < <final_array_entry>)
				Change next_beat_time2 = ($<song> [<next_array_entry>])
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
	if ($is_attract_mode = 1)
		return
	endif
	Change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if isps3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = Star_Power_Awarded_SFX}
			else
				SpawnScriptNow star_power_awarded_sfx_multiplayer params = {Player = ($<player_status>.Player)}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = Star_Power_Awarded_SFX}
		else
			SpawnScriptNow star_power_awarded_sfx_multiplayer params = {Player = ($<player_status>.Player)}
		endif
	endif
	formatText checksumName = container_id 'gem_container%p' p = ($<player_status>.text) AddToStringLookup = true
	Player = ($<player_status>.Player)
	Player = (<Player> - 1)
	GetArraySize \{$gem_colors}
	inputarraygetelement Name = <song> index = <array_entry>
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array>}
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
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = (($button_up_models [<Player>]).<Color>.left_pos_2d)
			<angle> = (($button_models [<Player>]).<Color>.angle)
		else
			<pos2d> = (($button_up_models [<Player>]).<Color>.pos_2d)
			<angle> = (($button_models [<Player>]).<Color>.left_angle)
		endif
		formatText checksumName = Name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <Name>
			CreateScreenElement {
				Type = SpriteElement
				id = <Name>
				parent = <container_id>
				material = sys_Big_Bolt01_sys_Big_Bolt01
				rgba = [255 255 255 255]
				Pos = <pos2d>
				rot_angle = <angle>
				Scale = $star_power_bolt_scale
				just = [center bottom]
				z_priority = 6
			}
		endif
		formatText checksumName = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id>
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		if NOT ObjectExists id = <fx_id>
			Create2DParticleSystem {
				id = <fx_id>
				Pos = <particle_pos>
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
				Emit_Rate = 0.04
				emit_dir = 0.0
				emit_spread = 44.0
				velocity = 24.0
				friction = (0.0, 66.0)
				time = 2.0
			}
		endif
		formatText checksumName = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		if NOT ObjectExists id = <fx2_id>
			Create2DParticleSystem {
				id = <fx2_id>
				Pos = <particle_pos>
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
				Emit_Rate = 0.04
				emit_dir = 0.0
				emit_spread = 28.0
				velocity = 22.0
				friction = (0.0, 55.0)
				time = 2.0
			}
		endif
		formatText checksumName = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		<particle_pos> = (<pos2d> - (0.0, 15.0))
		if NOT ObjectExists id = <fx3_id>
			Create2DParticleSystem {
				id = <fx3_id>
				Pos = <particle_pos>
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
				Emit_Rate = 0.04
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
	repeat <array_Size>
	Wait \{$star_power_bolt_time
		Seconds}
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	GetArraySize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		formatText checksumName = Name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <Name>
		formatText checksumName = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		formatText checksumName = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		formatText checksumName = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		Destroy2DParticleSystem id = <fx_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx2_id> <kill_when_empty>
		Destroy2DParticleSystem id = <fx3_id> <kill_when_empty>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = ($<player_status>.Player) player_text = ($<player_status>.text) multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = ($<player_status>.Player) player_text = ($<player_status>.text) multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = ($<player_status>.Player) player_text = ($<player_status>.text) multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	GH3_SFX_Stop_Sounds_For_KillSong <...> loading_transition = <loading_transition>
endscript

script GuitarEvent_EnterVenue 
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

script GuitarEvent_ExitVenue 
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
		if ($game_mode = p2_battle || $boss_battle = 1)
			<Pos> = (125.0, 170.0)
		else
			<Pos> = (255.0, 170.0)
		endif
	else
		<Pos> = (66.0, 20.0)
	endif
	Destroy2DParticleSystem id = <fx_id>
	Create2DParticleSystem {
		id = <fx_id>
		Pos = <Pos>
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
		Emit_Rate = 0.3
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 0.01
		friction = (0.0, 0.0)
		time = 0.25
	}
	SpawnScriptNow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	Wait \{0.8
		Seconds}
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

script guitarevent_kick_drum_hit_note \{Player = 1}
	Change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		Change \{kick_index = 0}
	endif
	<highway_info> = ($highway_pos_table [<Player> -1])
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthOffsetFactor)) / 32.0)
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	Wait \{1
		Frame}
	<particle_pos> = (640.0, 630.0)
	formatText checksumName = fx_id 'Kick_Particle%p%i' p = <player_text> i = $kick_index AddToStringLookup = true
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 0.25))
	<end_scale> = (<x_scale> * (1.875, 0.0) + (0.0, 0.5))
	Create2DParticleSystem {
		id = <fx_id>
		Pos = <particle_pos>
		z_priority = 7.9
		material = sys_particle_elipse01_sys_particle_elipse01
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
	if (<four_lane_highway> = 0)
		formatText checksumName = fx2_id 'Kick_Particle2%p%i' p = <player_text> i = $kick_index AddToStringLookup = true
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = sys_particle_kickhit01_sys_particle_kickhit01
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
		formatText checksumName = fx2_id 'Kick_Particle2%p%i' p = <player_text> i = $kick_index AddToStringLookup = true
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		Create2DParticleSystem {
			id = <fx2_id>
			Pos = <particle_pos>
			z_priority = 8.0
			material = mat_particle_kickhit01_noroland
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
	guitarevent_kick_drum_hit_note Player = <Player> player_text = <player_text>
endscript

script guitarevent_hit_easy_rhythm_note 
	guitarevent_kick_drum_hit_note player_text = <player_text>
endscript

script playersetvolume 
	if GotParam \{Volume}
		if (($<player_status>.part) = drum)
			if GotParam \{drum}
				switch <drum>
					case 1
					Change structurename = <player_status> drum_volume1 = <Volume>
					case 2
					Change structurename = <player_status> drum_volume2 = <Volume>
					case 3
					Change structurename = <player_status> drum_volume3 = <Volume>
					case 4
					Change structurename = <player_status> drum_volume4 = <Volume>
				endswitch
				return
			endif
		endif
		Change structurename = <player_status> guitar_volume = <Volume>
	endif
endscript

script playergetvolume 
	if (($<player_status>.part) = drum)
		if GotParam \{drum}
			switch <drum>
				case 1
				return Volume = ($<player_status>.drum_volume1)
				case 2
				return Volume = ($<player_status>.drum_volume2)
				case 3
				return Volume = ($<player_status>.drum_volume3)
				case 4
				return Volume = ($<player_status>.drum_volume4)
			endswitch
		endif
	endif
	return Volume = ($<player_status>.guitar_volume)
endscript

script create_you_rock \{text = qs(0x6f6d143d)}
	if ScreenElementExists \{id = You_Rock}
		DestroyScreenElement \{id = You_Rock}
	endif
	CreateScreenElement \{parent = root_window
		id = You_Rock
		Type = descinterface
		desc = 'you_rock'
		z_priority = 0}
	You_Rock :Obj_SpawnScriptNow anim_you_rock params = {text = <text>}
	tod_proxim_reapply_metallicafx
endscript

script anim_you_rock 
	setscriptcannotpause
	You_Rock :se_getprops \{arm_pos}
	<org_arm_pos> = <arm_pos>
	You_Rock :se_getprops \{text_pos}
	<org_text_pos> = <text_pos>
	You_Rock :se_getprops \{text_scale}
	<org_text_scale> = <text_scale>
	You_Rock :se_setprops \{orange_borders_scale = (4.3, 4.4)}
	You_Rock :se_setprops \{arm_pos = {
			(0.0, 500.0)
			relative
		}}
	Wait \{0.083
		Seconds}
	You_Rock :se_setprops \{orange_borders_scale = (1.3, 1.4)
		time = 0.1
		motion = ease_in}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (0.0, 120.0)) time = 0.1 arm_rot_angle = 85 motion = ease_in
	You_Rock :se_setprops \{arm_scale = (2.0, 2.0)
		time = 0.1
		motion = smooth}
	You_Rock :se_waitprops
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (0.0, 100.0)) time = 0.3 motion = ease_in
	You_Rock :se_setprops \{arm_scale = (1.6, 1.6)
		time = 0.1
		motion = smooth}
	You_Rock :se_waitprops
	You_Rock :se_setprops \{orange_borders_scale = (1.4, 1.5)
		time = 0.1
		motion = ease_in}
	You_Rock :se_setprops \{orange_borders_scale = (1.4, 1.5)
		time = 0.1
		motion = ease_in}
	You_Rock :se_setprops arm_pos = <org_arm_pos> time = 0.2 motion = smooth
	You_Rock :se_waitprops
	You_Rock :se_setprops \{black_solid_alpha = 0.5}
	Obj_SpawnScriptNow \{orange_border_blur}
	begin
	<random_x> = Random (@ 10 @ -5 @ 10 @ -45 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.02 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 5
	You_Rock :se_setprops \{arm_rot_angle = 85
		time = 0.03}
	begin
	<random_x> = Random (@ 5 @ -15 @ 20 @ -32 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 5
	You_Rock :se_setprops \{arm_rot_angle = 90
		time = 0.03}
	begin
	<random_x> = Random (@ 5 @ -30 @ 2 @ -20 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.02 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 5
	begin
	<random_x> = Random (@ 10 @ -5 @ 2 @ -10 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 5
	begin
	<random_x> = Random (@ 10 @ -30 @ 20 @ -20 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.02 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 2
	You_Rock :se_setprops arm_pos = (<org_arm_pos> + ((1.0, 0.0) * 50)) arm_rot_angle = 110
	You_Rock :se_setprops \{left_rope_pos = (180.0, 250.0)}
	You_Rock :se_setprops \{broken_left_rope_alpha = 1}
	You_Rock :se_setprops \{left_rope_pos = (500.0, 500.0)}
	You_Rock :se_waitprops
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (-250.0, 50.0)) time = 0.02 motion = smooth
	You_Rock :se_waitprops
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (-200.0, 50.0)) arm_rot_angle = 90 time = 0.1 motion = ease_in
	Wait \{0.3
		Seconds}
	begin
	<random_x> = Random (@ 10 @ -30 @ 32 @ -20 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 1
	begin
	<random_x> = Random (@ 5 @ -5 @ 5 @ -5 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	You_Rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat 2
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (10.0, 50.0)) arm_rot_angle = 80
	You_Rock :se_setprops \{right_rope_pos = (500.0, 500.0)}
	You_Rock :se_setprops \{broken_right_rope_alpha = 1}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (310.0, 50.0)) time = 0.02 motion = smooth
	You_Rock :se_waitprops
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, 50.0)) time = 0.1 motion = ease_in
	You_Rock :se_waitprops
	Wait \{0.1
		Seconds}
	You_Rock :se_setprops \{arm_scale = (1.2, 1.2)
		time = 0.1
		motion = smooth}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, -175.0)) time = 0.1 motion = ease_in
	You_Rock :se_waitprops
	You_Rock :se_setprops \{arm_rot_angle = 110
		time = 0.03
		motion = ease_in}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, -450.0)) time = 0.05 motion = smooth
	You_Rock :se_waitprops
	Wait \{0.1
		Seconds}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, -390.0)) time = 0.1 motion = smooth
	You_Rock :se_waitprops
	You_Rock :se_setprops \{arm_scale = (1.9499999, 1.9499999)
		time = 0.1
		motion = linear}
	You_Rock :se_setprops \{you_rock_texture_alpha = 0.5
		time = 0.1}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> + (80.0, -60.0)) time = 0.01 motion = ease_in
	You_Rock :se_waitprops
	You_Rock :se_setprops \{text_alpha = 1}
	You_Rock :se_setprops text_text = <text>
	You_Rock :se_setprops \{orange_borders_scale = (4.3, 4.4)
		time = 0.1
		motion = linear}
	You_Rock :se_setprops arm_pos = (<org_arm_pos> + (200.0, 900.0)) time = 0.35000002 motion = ease_in
	You_Rock :se_waitprops
	You_Rock :se_waitprops \{black_solid_alpha = 0}
	You_Rock :se_waitprops
	begin
	<time> = Random (@ 0.02 @ 0.01 @ 0.03 @ 0.04 )
	<y> = Random (@ -2 @ 3 @ 1.5 @ -1 @ 0 )
	You_Rock :se_setprops \{text_pos = (0.0, -21.0)}
	You_Rock :se_waitprops
	You_Rock :se_setprops text_pos = (<org_text_pos> + ((1.0, 0.0) * <y>)) time = <time> motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	You_Rock :se_waitprops
	You_Rock :se_setprops text_pos = (<org_text_pos> + ((1.0, 1.0) * <y>)) time = <time> motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	You_Rock :se_setprops text_pos = (<org_text_pos> + ((-2.0, -1.0) * <y>)) time = <time> motion = Random (@ ease_in @ ease_out )
	You_Rock :se_waitprops
	repeat
	KillSpawnedScript \{Name = orange_border_blur}
	Wait \{7.5
		Seconds}
	Die
endscript

script orange_border_blur 
	begin
	<blur_type> = Random (@ None @ half @ full )
	You_Rock :se_waitprops
	switch <blur_type>
		case None
		You_Rock :se_setprops \{orange_border_alpha = 1}
		You_Rock :se_setprops \{orange_border_blur_alpha = 0}
		case half
		You_Rock :se_setprops \{orange_border_alpha = 0.5}
		You_Rock :se_setprops \{orange_border_blur_alpha = 1}
		case full
		You_Rock :se_setprops \{orange_border_alpha = 0}
		You_Rock :se_setprops \{orange_border_blur_alpha = 1}
	endswitch
	<time> = Random (@ 0.02 @ 0.01 @ 0.03 )
	Wait <time> Seconds
	repeat
endscript

script hot_start_achieved \{Band = 0
		combo = 0}
	gamemode_gettype
	if (<Type> = training)
		return
	endif
	if (<Player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if isSinglePlayerGame
			Pos = (640.0, 211.0)
			<base_scale> = 1.0
			SpawnScriptNow gh_sfx_hotstart_singleplayer params = {combo = <combo>}
		elseif ($game_mode = p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow gh_sfx_hotstart_p1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow gh_sfx_hotstart_p1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (415.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = p2_career || $game_mode = p2_quickplay)
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
		hud_create_message Band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <players>}
	endif
endscript

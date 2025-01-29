freestyle_ring_ramp_on_time = 250
freestyle_ring_ramp_off_time = 250
freestyle_ring_hold_ratio = 0.5
freestyle_note_playing = [
	0
	0
	0
]
freestyle_ring_names = [
]
freestyle_ring_states = [
]
freestyle_whammy_wavelength = 2500
freestyle_note_can_whammy = [
	FALSE
	FALSE
	FALSE
]

script freestyle_init_guitar 
	i = 0
	begin
	SetArrayElement ArrayName = freestyle_note_playing index = <i> NewValue = 0 globalarray
	i = (<i> + 1)
	repeat $freestyle_max_players
	freestyle_rings_init
	whammy_wavelength = (($highway_guitarfreestyle.gHighwayTiling / $freestyle_highway_speed) * 1000)
	if (<whammy_wavelength> < 0)
		whammy_wavelength = (0 - <whammy_wavelength>)
	endif
	Change freestyle_whammy_wavelength = (<whammy_wavelength>)
endscript

script freestyle_shutdown_guitar 
	KillSpawnedScript \{Name = freestyle_ring_open_strum_spawned}
	KillSpawnedScript \{Name = freestyle_ring_alpha_animate}
	freestyle_rings_shutdown
endscript

script freestyle_update_guitars 
	Player = 0
	begin
	if (($freestyle_player_data [<Player>].instrument_handler) = guitar)
		freestyle_update_player_guitar Player = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_update_player_guitar 
	RequireParams \{[
			Player
		]
		all}
	has_highway = ($freestyle_player_data [<Player>].has_highway)
	if (($freestyle_player_data [<Player>].input_source = recording) && ($freestyle_player_data [<Player>].author_type = human))
		playback_rings = true
	else
		playback_rings = FALSE
	endif
	if ((<has_highway> = true) || (<playback_rings> = true))
		highway_player = ($freestyle_player_data [<Player>].highway_player)
		nowbar_offset = ($freestyle_player_data [<Player>].nowbar_offset)
		getguitarinputproperties Player = <Player>
		if (<has_highway> = true)
			if ($freestyle_note_can_whammy [<Player>] = true)
				whammy_to_send = (1.0 + <whammy_value>)
			else
				whammy_to_send = 1.0
			endif
			SetNewWhammyValue Player = <highway_player> value = <whammy_to_send> time_remaining = $freestyle_whammy_wavelength
			freestyle_update_notes pattern_held = <pattern_held> Player = <highway_player>
		endif
		GetSongTimeMs
		marker = (<time> - <nowbar_offset>)
		if getguitareventtriggered Player = <Player>
			freestyle_get_guitar_highway_event {
				event_mask = <event_triggered>
				button_mask = <buttons_triggered>
				note_class = <noteclass_triggered>
			}
			SetArrayElement ArrayName = freestyle_note_playing index = <Player> NewValue = <highway_event> globalarray
			if ((<noteclass_triggered> = single) || (<noteclass_triggered> = chord))
				SetArrayElement ArrayName = freestyle_note_can_whammy index = <Player> NewValue = true globalarray
			else
				SetArrayElement ArrayName = freestyle_note_can_whammy index = <Player> NewValue = FALSE globalarray
			endif
			if (<has_highway> = true)
				freestyle_reset_whammy event_mask = 69905 Player = <highway_player>
				freestyle_spawn_gems_on_highway {
					highway_player = <highway_player>
					event_mask = <highway_event>
					accent = <accent_held>
					marker = <marker>
					length = 100
					gem_type = played
					play_spawn_anim = 1
					is_drum = FALSE
				}
				freestyle_notify_guitar_note_played <...>
			endif
			freestyle_light_rings pattern_held = <highway_event> player_index = <Player> strum = true
		endif
		kill_note = FALSE
		if ($freestyle_note_playing [<Player>] != 0)
			if NOT getguitareventplaying Player = <Player>
				kill_note = true
			endif
			if NOT ((<pattern_held> && $freestyle_note_playing [<Player>]) = $freestyle_note_playing [<Player>])
				kill_note = true
			endif
		endif
		if (<kill_note> = true)
			if (<has_highway> = true)
				freestyle_reset_whammy event_mask = ($freestyle_note_playing [<Player>]) Player = <highway_player>
				freestyle_stats_guitar_note_ended <...>
			endif
			SetArrayElement ArrayName = freestyle_note_playing index = <Player> NewValue = 0 globalarray
			freestyle_light_rings player_index = <Player> pattern_held = 0 strum = FALSE
		endif
	endif
	freestyle_update_guitarist_hands Player = <Player>
endscript

script freestyle_is_hopo_note 
	RequireParams \{[
			note_flags
		]
		all}
	if StructureContains structure = <note_flags> hammer_on
		return \{true}
	endif
	if StructureContains structure = <note_flags> pull_off
		return \{true}
	endif
	return \{FALSE}
endscript

script freestyle_is_accent_note 
	RequireParams \{[
			note_flags
		]
		all}
	if StructureContains structure = <note_flags> accent
		return \{true}
	endif
	return \{FALSE}
endscript

script freestyle_get_guitar_highway_event 
	RequireParams \{[
			event_mask
			button_mask
			note_class
		]
		all}
	if ((<note_class> = single) || (<note_class> = lick))
		highway_event = <event_mask>
	else
		highway_event = <button_mask>
	endif
	return highway_event = <highway_event>
endscript

script freestyle_notify_guitar_note_played 
	freestyle_stats_guitar_note_played <...>
	freestyle_hint_notify_guitar_note_played <...>
	freestyle_mii_notify_guitar_note_played <...>
endscript
g_fs_instrument_to_text = {
	guitar = 'Guitar'
	bass = 'Bass'
	drums = 'Drums'
}
g_fs_ring_remap = [
	0
	6
	5
	4
	3
	2
	1
]

script freestyle_rings_init 
	full_array = []
	full_states = {}
	Player = 0
	begin
	instrument_crc = ($freestyle_player_data [<Player>].instrument)
	instrument_text = ($g_fs_instrument_to_text.<instrument_crc>)
	fret = 1
	array = []
	begin
	ring_id = ($g_fs_ring_remap [<fret>])
	formatText checksumName = ring_name 'Z_Freestyle_Ring_%a_0%b' a = <instrument_text> b = <ring_id> AddToStringLookup = true
	SafeCreate nodeName = <ring_name>
	UpdateMaterialProperty {
		object = <ring_name>
		material = jg_toolmain_redtadpole_inside
		parameter = m_psPass0MaterialColor
		value = [255 255 255 0]
	}
	AddArrayElement array = <array> element = <ring_name>
	setstructureparam struct_name = full_states param = <ring_name> value = OFF
	fret = (<fret> + 1)
	repeat 6
	AddArrayElement array = <full_array> element = <array> globalarray
	full_array = <array>
	Player = (<Player> + 1)
	repeat $freestyle_max_players
	Change freestyle_ring_names = <full_array>
	Change freestyle_ring_states = <full_states>
endscript

script freestyle_rings_shutdown 
	Player = 0
	begin
	i = 0
	begin
	ring_name = ($freestyle_ring_names [<Player>] [<i>])
	SafeKill nodeName = <ring_name>
	i = (<i> + 1)
	repeat 6
	Player = (<Player> + 1)
	repeat $freestyle_max_players
	freestyle_ring_names = []
	freestyle_ring_states = {}
endscript

script get_ring_names 
	RequireParams \{[
			pattern_held
			player_index
			strum
		]
		all}
	fret_num = 5
	if (<strum> = true)
		fret_num = 6
	endif
	got_open = FALSE
	i = 0
	mask = 1
	array_on = []
	array_off = []
	begin
	ring_name = ($freestyle_ring_names [<player_index>] [<i>])
	if (<mask> && <pattern_held>)
		AddArrayElement array = <array_on> element = <ring_name>
		array_on = <array>
		if (<i> = 5)
			got_open = true
		endif
	else
		AddArrayElement array = <array_off> element = <ring_name>
		array_off = <array>
	endif
	i = (<i> + 1)
	mask = (<mask> * 16)
	repeat <fret_num>
	return array_on = <array_on> array_off = <array_off> open_strum = <got_open>
endscript

script freestyle_light_rings \{strum = true}
	get_ring_names <...>
	GetArraySize <array_off>
	if (<array_Size> > 0)
		i = 0
		begin
		Name = (<array_off> [<i>])
		freestyle_single_ring_off ring_name = <Name>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	GetArraySize <array_on>
	if (<array_Size> > 0)
		i = 0
		begin
		Name = (<array_on> [<i>])
		freestyle_single_ring_on ring_name = <Name>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<open_strum> = true)
		KillSpawnedScript \{Name = freestyle_ring_open_strum_spawned}
		SpawnScriptLater freestyle_ring_open_strum_spawned params = {player_index = <player_index> ring_name = (<array_on> [0])}
	endif
endscript

script freestyle_ring_open_strum_spawned 
	begin
	getguitarinputproperties Player = <player_index>
	if (<strum_held> = strum_none)
		freestyle_single_ring_off ring_name = <ring_name>
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script freestyle_ring_drum_light 
	RequireParams \{[
			gem_mask
			player_index
		]
		all}
	get_ring_names pattern_held = <gem_mask> player_index = <player_index> strum = true
	GetArraySize <array_on>
	if (<array_Size> > 0)
		i = 0
		begin
		note_name = (<array_on> [<i>])
		KillSpawnedScript id = <note_name>
		freestyle_single_ring_drum ring_name = <note_name>
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script freestyle_single_ring_on 
	RequireParams \{[
			ring_name
		]
		all}
	KillSpawnedScript id = <ring_name>
	setstructureparam struct_name = freestyle_ring_states param = <ring_name> value = On
	hold_alpha = ($freestyle_ring_hold_ratio * 255)
	hold_time = ($freestyle_ring_hold_ratio * $freestyle_ring_ramp_off_time)
	if ($freestyle_ring_states.<ring_name> = OFF)
		SpawnScriptNow {
			freestyle_ring_alpha_animate
			id = <ring_name>
			params = {ring_name = <ring_name> alpha0 = 0 alpha1 = 255 time1 = $freestyle_ring_ramp_on_time alpha2 = <hold_alpha> time2 = <hold_time>}
		}
	else
		SpawnScriptNow {
			freestyle_ring_alpha_animate
			id = <ring_name>
			params = {ring_name = <ring_name> alpha0 = 255 alpha1 = <hold_alpha> time1 = <hold_time>}
		}
	endif
endscript

script freestyle_single_ring_off 
	RequireParams \{[
			ring_name
		]
		all}
	if ($freestyle_ring_states.<ring_name> = On)
		KillSpawnedScript id = <ring_name>
		setstructureparam struct_name = freestyle_ring_states param = <ring_name> value = OFF
		SpawnScriptNow {
			freestyle_ring_alpha_animate
			id = <ring_name>
			params = {ring_name = <ring_name> alpha0 = 255 alpha1 = 0 time1 = $freestyle_ring_ramp_off_time}
		}
	endif
endscript

script freestyle_single_ring_drum 
	RequireParams \{[
			ring_name
		]
		all}
	KillSpawnedScript id = <ring_name>
	SpawnScriptNow {
		freestyle_ring_alpha_animate
		id = <ring_name>
		params = {ring_name = <ring_name> alpha0 = 255 alpha1 = 0 time1 = $freestyle_ring_ramp_off_time}
	}
endscript

script freestyle_ring_alpha_animate 
	RequireParams \{[
			ring_name
			alpha0
			alpha1
			time1
		]
		all}
	if GotParam \{alpha2}
		RequireParams \{[
				time2
			]
			all}
	endif
	GetStartTime
	delta = (<alpha1> - <alpha0>)
	Color = [255 255 255 255]
	begin
	getelapsedtime starttime = <starttime>
	new_alpha = (<alpha0> + ((<delta> * <ElapsedTime>) / <time1>))
	if (<ElapsedTime> >= <time1>)
		new_alpha = <alpha1>
	endif
	CastToInteger \{new_alpha}
	SetArrayElement ArrayName = Color index = 3 NewValue = <new_alpha>
	UpdateMaterialProperty {
		object = <ring_name>
		material = freestyle_master_01
		parameter = m_psPass0MaterialColor
		value = <Color>
	}
	if (<ElapsedTime> >= <time1>)
		break
	endif
	WaitOneGameFrame
	repeat
	if GotParam \{alpha2}
		GetStartTime
		delta = (<alpha2> - <alpha1>)
		begin
		getelapsedtime starttime = <starttime>
		new_alpha = (<alpha1> + ((<delta> * <ElapsedTime>) / <time2>))
		if (<ElapsedTime> >= <time2>)
			new_alpha = <alpha2>
		endif
		CastToInteger \{new_alpha}
		SetArrayElement ArrayName = Color index = 3 NewValue = <new_alpha>
		UpdateMaterialProperty {
			object = <ring_name>
			material = freestyle_master_01
			parameter = m_psPass0MaterialColor
			value = <Color>
		}
		if (<ElapsedTime> >= <time2>)
			break
		endif
		WaitOneGameFrame
		repeat
	endif
endscript

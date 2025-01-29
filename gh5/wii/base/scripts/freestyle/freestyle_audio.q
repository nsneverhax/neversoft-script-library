freestyle_sample_bank_types = [
	guitar_notes
	guitar_chords2
	guitar_chords3
	guitar_riffs
	bass_notes
	bass_riffs
	drums
]
freestyle_sample_banks = {
}
freestyle_sample_bank_paths = {
}
freestyle_tuning_templates = {
}
freestyle_countdown_sfx_pak_path = ''
freestyle_style_instrument_mix_levels = {
}

script freestyle_set_mix_levels 
	freestylesetmastervolume {
		synthesizer_volume = ($freestyle_master_synthesizer_volume)
		stream_volume = ($freestyle_master_stream_volume)
	}
	freestyle_set_default_instrument_volumes
endscript

script freestyle_set_default_instrument_volumes 
	Player = 0
	begin
	instrument = ($freestyle_player_data [<Player>].instrument)
	if (<instrument> != None)
		freestyle_get_default_instrument_volume instrument = <instrument>
		instrumentsetvolume Player = <Player> Volume = <Volume>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_setup_instruments_by_style 
	Change freestyle_sample_bank_paths = ($freestyle_current_style_settings.sample_bank_paths)
	Change freestyle_tuning_templates = ($freestyle_current_style_settings.tuning_templates)
	freestyle_extract_sample_bank_names_from_path
	freestyle_generate_guitar_tunings
endscript

script freestyle_generate_guitar_tunings 
	Player = 0
	begin
	switch ($freestyle_player_data [<Player>].instrument)
		case guitar
		freestyle_generate_tuning template = ($freestyle_tuning_templates.guitar) instrument = guitar
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = tuning value = <tuning>
		case bass
		freestyle_generate_tuning template = ($freestyle_tuning_templates.bass) instrument = bass
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = tuning value = <tuning>
	endswitch
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_extract_sample_bank_names_from_path 
	GetArraySize \{$freestyle_sample_bank_types}
	i = 0
	begin
	Type = ($freestyle_sample_bank_types [<i>])
	GetFileNameFromPath path = ($freestyle_sample_bank_paths.<Type>)
	setstructureparam {
		struct_name = freestyle_sample_banks
		param = <Type>
		value = <FileName>
	}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script freestyle_stop_preview_stream 
	KillSpawnedScript \{Name = freestyle_play_preview_stream_spawned}
	unloadstreamset \{id = preview}
endscript

script freestyle_play_preview_stream 
	RequireParams \{[
			style_index
		]
		all}
	freestyle_stop_preview_stream
	SpawnScriptNow {
		freestyle_play_preview_stream_spawned
		params = {
			stream_data = ($freestyle_styleset [<style_index>].preview_streams)
		}
	}
endscript

script freestyle_play_preview_stream_spawned 
	loadstreamset id = preview stream_data = <stream_data>
	freestyle_wait_for_streams_to_load
	Wait \{0.25
		Seconds}
	freestylesetmastervolume stream_volume = ($freestyle_preview_stream_volume)
	playstreamset \{id = preview
		Loop = true}
endscript

script freestyle_wait_for_streams_to_load 
	begin
	if areallstreamsloaded
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript

script freestyle_start_velocity_test 
	freestyle_stop_velocity_test
	SpawnScriptNow freestyle_velocity_test_script params = <...>
endscript

script freestyle_stop_velocity_test 
	KillSpawnedScript \{Name = freestyle_velocity_test_script}
endscript

script freestyle_velocity_test_script 
	velocity = 0.0
	begin
	synthstartnote {
		Player = <Player>
		note = <note>
		velocity = <velocity>
		note_flags = <note_flags>
		sample_bank = <sample_bank>
	}
	Wait \{0.5
		Seconds}
	<velocity> = (<velocity> + 0.05)
	if (<velocity> > 1)
		break
	endif
	repeat
endscript

script freestyle_start_attack_test 
	freestyle_stop_attack_test
	SpawnScriptNow freestyle_attack_test_script params = <...>
endscript

script freestyle_stop_attack_test 
	KillSpawnedScript \{Name = freestyle_attack_test_script}
endscript

script freestyle_attack_test_script 
	begin
	synthstartnote {
		Player = <Player>
		note = <note>
		velocity = <velocity>
		note_flags = <note_flags>
		sample_bank = <sample_bank>
	}
	Wait \{0.15
		Seconds}
	repeat
endscript

script freestyle_load_sample_bank_paks 
	GetArraySize \{$freestyle_sample_bank_types}
	i = 0
	begin
	Type = ($freestyle_sample_bank_types [<i>])
	freestyle_load_sample_bank_pak sample_bank_path = ($freestyle_sample_bank_paths.<Type>)
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script freestyle_unload_sample_bank_paks 
	GetArraySize \{$freestyle_sample_bank_types}
	i = 0
	begin
	Type = ($freestyle_sample_bank_types [<i>])
	freestyle_unload_sample_bank_pak sample_bank_path = ($freestyle_sample_bank_paths.<Type>)
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script freestyle_get_full_sample_bank_pak_path 
	formatText TextName = pak_path 'freestyle/samplebanks/%a.pak' a = <sample_bank_path>
	return pak_path = <pak_path>
endscript

script freestyle_load_sample_bank_pak 
	freestyle_get_full_sample_bank_pak_path sample_bank_path = <sample_bank_path>
	if NOT ispakloaded <pak_path> Heap = TopDownHeap
		LoadPak <pak_path> Heap = TopDownHeap
	endif
endscript

script freestyle_unload_sample_bank_pak 
	freestyle_get_full_sample_bank_pak_path sample_bank_path = <sample_bank_path>
	UnLoadPak <pak_path>
	WaitUnloadPak <pak_path> Block
endscript

script freestyle_load_countdown_sfx_pak 
	if NOT ispakloaded ($freestyle_countdown_sfx_pak_path) Heap = quota_sfx
		LoadPak ($freestyle_countdown_sfx_pak_path) Heap = quota_sfx
	endif
endscript

script freestyle_unload_countdown_sfx_pak 
	UnLoadPak ($freestyle_countdown_sfx_pak_path)
	WaitUnloadPak ($freestyle_countdown_sfx_pak_path) Block
endscript

script freestyle_set_solo_instrument_volumes 
	Player = 0
	solo_count = 0
	begin
	if ($freestyle_player_data [<Player>].soloing = true)
		<solo_count> = (<solo_count> + 1)
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	if (<solo_count> = 0)
		freestyle_set_default_instrument_volumes
	else
		<Player> = 0
		begin
		if NOT freestyleisplayback track = ($freestyle_player_data [<Player>].recording_track)
			instrument = ($freestyle_player_data [<Player>].instrument)
			freestyle_get_default_instrument_volume instrument = <instrument>
			if ($freestyle_player_data [<Player>].soloing = FALSE)
				<Volume> = (<Volume> * $freestyle_non_solo_volume_pct)
			endif
			instrumentsetvolume Player = <Player> Volume = <Volume>
		endif
		<Player> = (<Player> + 1)
		repeat $freestyle_max_players
	endif
endscript

script freestyle_get_default_instrument_volume 
	RequireParams \{[
			instrument
		]
		all}
	base_volume = ($freestyle_instrument_mix_levels_base.<instrument>)
	style_volume = ($freestyle_style_instrument_mix_levels.<instrument>)
	return Volume = (<base_volume> * <style_volume>)
endscript

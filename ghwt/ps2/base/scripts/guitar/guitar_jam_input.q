jam_quantize = [
	{
		value = 1
		name_text = qs(0x897495f1)
		marker = 1
	}
	{
		value = 0.25
		name_text = qs(0xf65f8830)
	}
	{
		value = 0.5
		name_text = qs(0x7222255e)
	}
	{
		value = 1
		name_text = qs(0x4fa20572)
	}
	{
		value = 2
		name_text = qs(0x4aa848f3)
	}
	{
		value = 3
		name_text = qs(0xf6f30ad3)
	}
	{
		value = 4
		name_text = qs(0xdf02ece5)
	}
	{
		value = 6
		name_text = qs(0x7fd55179)
	}
	{
		value = 8
		name_text = qs(0x3d6a1337)
	}
	{
		value = 16
		name_text = qs(0xe66ff4a0)
	}
	{
		value = 32
		name_text = qs(0x64bcab52)
	}
]

script jam_input_add_player_server \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	createplayerserver id = <player_status> Player = <Player>
	addplayerserverjaminput id = <player_status> Player = <Player> controller = ($<player_status>.controller) spawn_id = <spawn_id>
endscript

script jam_input_whammy \{Player = 1}
	getplayerinfo <Player> resting_whammy_position
	if GuitarGetAnalogueInfo controller = <controller>
		if IsGuitarController controller = <controller>
			rightx_unscaled = (<rightx_unscaled> / 128.0)
			<len> = (<rightx_unscaled> - <resting_whammy_position> / (1.0 - <resting_whammy_position>))
			if (<len> < 0.0)
				<len> = 0.0
			endif
		else
			if (<leftlength> > 0)
				<len> = <leftlength>
			else
				if (<rightlength> > 0)
					<len> = <rightlength>
				else
					<len> = 0
				endif
			endif
		endif
		new_pitch = ((-1 * (<len> * 2)) * 1.0539999)
		getplayerinfo <Player> jam_instrument
		switch (<jam_instrument>)
			case 0
			0x3915a0b3 slot = 4 pitch = (<rightx_unscaled> * -0.1)
			case 1
			0x3915a0b3 slot = 5 pitch = (<rightx_unscaled> * -0.1)
			case 2
			0x3915a0b3 slot = 6 pitch = (<rightx_unscaled> * -0.1)
			case 4
			0x3915a0b3 slot = 8 pitch = (<rightx_unscaled> * -0.1)
		endswitch
	endif
endscript

script jam_input_whammy_spawned \{Player = 1}
	getplayerinfo <Player> controller
	begin
	jam_input_whammy Player = <Player> controller = <controller>
	Wait \{1
		gameframe}
	repeat
endscript

script jam_stop_all_sound 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	jam_stop_sound jam_instrument = <index>
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script jam_stop_sound \{jam_instrument = 0}
	switch (<jam_instrument>)
		case 0
		stopsound \{$jam_input_current_chord}
		case 1
		stopsound \{$jam_input_current_lead}
		case 2
		stopsound \{$jam_input_current_bass}
		case 4
		stopsound \{$jam_input_current_melody}
	endswitch
endscript
0xddda1cd6 = {
	show_warning_message
	id = jam_recording_spawns
	params = {
		warning_text = qs(0xdd331019)
	}
}

script jam_record_note \{sustain = 0
		curr_track = $jam_current_track
		select_player = 1
		chord_type = 0
		melody = 0
		velocity = 127}
	0xf5c9fbaa
endscript

script jam_kill_update_note_length \{Player = 1}
	formatText checksumName = update_note_length_spawn 'update_note_length_spawn_%s' s = <Player>
	KillSpawnedScript id = <update_note_length_spawn>
endscript

script jam_input_update_note_length 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	sustain_min = 4
	<sustain_min> = (<ms_per_beat> / <sustain_min>)
	CastToInteger \{sustain_min}
	sustain_trim = 8
	<sustain_trim> = (<ms_per_beat> / <sustain_trim>)
	CastToInteger \{sustain_trim}
	begin
	note_length = ($jam_highway_play_time - <start_time>)
	CastToInteger \{note_length}
	visual_note_length = (<note_length> - <sustain_trim>)
	if (<visual_note_length> > <sustain_min>)
		addnotetrackitem Name = <gem_array> time = <start_time> length = <visual_note_length> pattern = <gem>
	endif
	if (<note_length> > <sustain_min>)
		suffix = '_size'
		AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
		<gem_array_size> = <appended_id>
		if (<new_note_index> <= (($<gem_array_size>) - 4))
			next_note_index = (<new_note_index> + 2)
			getnotetrackitem Name = <gem_array> index = <next_note_index>
			next_time = <gem_time>
			next_gem_length = <gem_length>
			next_gem_pattern = <gem_pattern>
			if ((<start_time> + <note_length>) >= <next_time>)
				break
			endif
		endif
	endif
	if (<melody> = 1)
		<playing_one> = 0
		if issoundplaying ($jam_input_current_melody_atk)
			<playing_one> = 1
		endif
		if issoundplaying ($jam_input_current_melody)
			<playing_one> = 1
		endif
		if (<playing_one> = 0)
			break
		endif
	else
		if NOT issoundplaying <sample>
			break
		endif
	endif
	Wait \{1
		gameframes}
	repeat
endscript

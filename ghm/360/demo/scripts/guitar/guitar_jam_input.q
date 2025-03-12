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
		name_text = qs(0xbee028a9)
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

script jam_input_add_player_server \{player = 1}
	formattext checksumname = player_status 'player%p_status' p = <player>
	createplayerserver id = <player_status> player = <player>
	addplayerserverjaminput id = <player_status> player = <player> controller = ($<player_status>.controller) spawn_id = <spawn_id>
endscript

script jam_input_whammy \{player = 1}
	getplayerinfo <player> resting_whammy_position
	if guitargetanalogueinfo controller = <controller>
		if isguitarcontroller controller = <controller>
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
		getplayerinfo <player> jam_instrument
		switch (<jam_instrument>)
			case 0
			setsoundbussparams {jammode_rhythmguitar = {pitch = <new_pitch>}}
			case 1
			setsoundbussparams {jammode_leadguitar = {pitch = <new_pitch>}}
			case 2
			setsoundbussparams {jammode_bass = {pitch = <new_pitch>}}
			case 4
			setsoundbussparams {jammode_vox = {pitch = <new_pitch>}}
		endswitch
	endif
endscript

script jam_input_whammy_spawned \{player = 1}
	getplayerinfo <player> controller
	begin
	jam_input_whammy player = <player> controller = <controller>
	wait \{1
		gameframe}
	repeat
endscript

script jam_stop_all_sound 
	getarraysize \{$jam_tracks}
	index = 0
	begin
	jam_stop_sound jam_instrument = <index>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_stop_sound \{jam_instrument = 0}
	switch (<jam_instrument>)
		case 0
		stopsound unique_id = ($jam_input_current_chord)
		case 1
		stopsound unique_id = ($jam_input_current_lead)
		case 2
		stopsound unique_id = ($jam_input_current_bass)
		case 4
		stopsound unique_id = ($jam_input_current_melody)
	endswitch
endscript

script jam_record_note \{sustain = 0
		curr_track = $jam_current_track
		select_player = 1
		chord_type = 0
		melody = 0
		velocity = 127}
	if ($jam_highway_recording = 0)
		return
	endif
	if ($jam_band_recording = 1)
		if ($jam_player_recording_armed [(<select_player> - 1)] = 0)
			return
		endif
	endif
	formattext checksumname = update_note_length_spawn 'update_note_length_spawn_%s' s = <select_player>
	killspawnedscript id = <update_note_length_spawn>
	new_note_string = <note_string>
	new_note_fret = <note_fret>
	new_note_type = <note_type>
	new_note_chord_type = <chord_type>
	new_velocity = <velocity>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> > -1)
		curr_track = <jam_instrument>
	endif
	if ($jam_highway_step_recording = 0)
		if NOT gotparam \{record_time}
			<curr_time> = $jam_highway_play_time
		else
			<curr_time> = <record_time>
		endif
		casttointeger \{curr_time}
	else
		<curr_time> = $jam_highway_play_time
		casttointeger \{curr_time}
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize>)
	casttointeger \{intervals}
	if ($jam_highway_step_recording = 0)
		new_time = (<intervals> * <quantize>)
		time_before = (<curr_time> - <new_time>)
		time_after = ((<new_time> + <quantize>) - <curr_time>)
		if (<time_after> <= <time_before>)
			<new_time> = (<new_time> + <quantize>)
		endif
		casttointeger \{new_time}
	else
		new_time = <curr_time>
		casttointeger \{new_time}
	endif
	getsongtimems
	casttointeger \{time}
	if NOT gotparam \{note_length}
		new_length = 60
		if ($jam_highway_step_recording = 1)
			<new_length> = <quantize>
			printf channel = jam_mode qs(0x7ee72ed9) s = <quantize>
			if (<new_length> < 60)
				<new_length> = 60
			endif
			casttointeger \{new_length}
		endif
	else
		new_length = <note_length>
		casttointeger \{new_length}
	endif
	effect_on = ($jam_current_active_effects [<jam_instrument>])
	getplayerinfo <select_player> jam_instrument
	getjamsessionsize track = ($jam_tracks [<jam_instrument>].id)
	if ((<track_size> + 1) >= ($gemarraysize))
		if ($jam_advanced_record = 1)
			if NOT scriptisrunning \{show_warning_message}
				spawnscriptnow \{show_warning_message
					id = jam_recording_spawns
					params = {
						warning_text = qs(0xdd331019)
					}}
			endif
		else
			spawnscriptnow jam_note_limit_hit id = <limit_msg> params = {player = <select_player>}
		endif
		return
	endif
	gem_array = ($jam_tracks [<curr_track>].gem_array)
	suffix = '_size'
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	<gem_array_size> = <appended_id>
	index = -1
	findjamsessionsound track = ($jam_tracks [<curr_track>].id) time = (<new_time> - 2)
	if (<index> >= 0)
		getjamsessionsound track = ($jam_tracks [<curr_track>].id) index = <index>
		if (<time> >= (<new_time> - 2) && <time> <= (<new_time> + 2))
			printf channel = jam_mode qs(0xbe7ce4c6) s = <time>
			deletejamsessionsound track = ($jam_tracks [<curr_track>].id) index = <index>
			deletenotetrackitem name = <gem_array> index = (<index> * 2)
			change \{guitar_jam_playback_recordng_increment_track_index = 1}
		endif
	endif
	addjamsessionsound track = ($jam_tracks [<curr_track>].id) time = <new_time> string = <new_note_string> fret = <new_note_fret> type = <new_note_type> effect = <effect_on> chord_type = <new_note_chord_type> velocity = <new_velocity>
	gem = 0
	if (<hold_pattern> && 65536)
		<gem> = (<gem> + 1)
	endif
	if (<hold_pattern> && 4096)
		<gem> = (<gem> + 2)
	endif
	if (<hold_pattern> && 256)
		<gem> = (<gem> + 4)
	endif
	if (<hold_pattern> && 16)
		<gem> = (<gem> + 8)
	endif
	if (<hold_pattern> && 1)
		<gem> = (<gem> + 16)
	endif
	if (<hold_pattern> = 1048576)
		<gem> = 32
	endif
	if (<sustain> = 1)
		addnotetrackitem name = <gem_array> time = <new_time> length = <new_length> pattern = <gem>
		if ($jam_highway_step_recording = 1)
			if (<index> < (($<gem_array_size>) -2))
				getnotetrackitem name = <gem_array> index = (<index> + 2)
				<next_note_time> = <gem_time>
				getnotetrackitem name = <gem_array> index = <index>
				if ((<gem_time> + <gem_length>) > <next_note_time>)
					<new_length> = (<next_note_time> - <gem_time>)
					casttointeger \{new_length}
					addnotetrackitem name = <gem_array> time = <gem_time> length = <new_length> pattern = <gem_pattern>
					<sustain> = 0
				endif
			endif
		endif
	else
		addnotetrackitem name = <gem_array> time = <new_time> length = 60 pattern = <gem>
	endif
	new_note_index = <index>
	if (<new_note_index> > 0)
		previous_note_index = (<new_note_index> - 2)
		getnotetrackitem name = <gem_array> index = <previous_note_index>
		previous_time = <gem_time>
		previous_gem_length = <gem_length>
		previous_gem_pattern = <gem_pattern>
		sustain_min = 8
		<sustain_min> = (<ms_per_beat> / <sustain_min>)
		casttointeger \{sustain_min}
		sustain_trim = 8
		<sustain_trim> = (<ms_per_beat> / <sustain_trim>)
		casttointeger \{sustain_trim}
		if ((<previous_time> + <previous_gem_length>) > (<new_time> - <sustain_trim>))
			new_visual_note_length = ((<new_time> - <sustain_trim>) - <previous_time>)
			new_note_length = (<new_time> - <previous_time>)
			if (<new_note_length> <= <sustain_min>)
				<new_note_length> = <sustain_min>
			endif
			addnotetrackitem name = <gem_array> time = <previous_time> length = <new_note_length> pattern = <previous_gem_pattern>
		endif
	endif
	if (<sustain> = 1)
		spawnscriptnow jam_input_update_note_length id = <update_note_length_spawn> params = {curr_track = <curr_track> new_note_index = <new_note_index> effect_on = <effect_on> gem_array = <gem_array> sample = <final_note_sample> start_time = <new_time> gem = <gem> melody = <melody>}
	endif
	getjamsessionsize track = ($jam_tracks [<jam_instrument>].id)
	if NOT ((($<gem_array_size>) / 2) = <track_size>)
		softassert qs(0x85fb0482) a = (($<gem_array_size>) / 2) b = <track_size>
	endif
endscript

script jam_kill_update_note_length \{player = 1}
	formattext checksumname = update_note_length_spawn 'update_note_length_spawn_%s' s = <player>
	killspawnedscript id = <update_note_length_spawn>
endscript

script jam_input_update_note_length 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	sustain_min = 4
	<sustain_min> = (<ms_per_beat> / <sustain_min>)
	casttointeger \{sustain_min}
	sustain_trim = 8
	<sustain_trim> = (<ms_per_beat> / <sustain_trim>)
	casttointeger \{sustain_trim}
	begin
	note_length = ($jam_highway_play_time - <start_time>)
	casttointeger \{note_length}
	visual_note_length = (<note_length> - <sustain_trim>)
	if (<visual_note_length> > <sustain_min>)
		addnotetrackitem name = <gem_array> time = <start_time> length = <visual_note_length> pattern = <gem>
	endif
	if (<note_length> > <sustain_min>)
		suffix = '_size'
		appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
		<gem_array_size> = <appended_id>
		if (<new_note_index> <= (($<gem_array_size>) - 4))
			next_note_index = (<new_note_index> + 2)
			getnotetrackitem name = <gem_array> index = <next_note_index>
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
		if issoundplayingbyid ($jam_input_current_melody_atk)
			<playing_one> = 1
		endif
		if issoundplayingbyid ($jam_input_current_melody)
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
	wait \{1
		gameframes}
	repeat
endscript

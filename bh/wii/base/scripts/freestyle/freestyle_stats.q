freestyle_saved_stats = {
}
freestyle_stats = [
	{
	}
	{
	}
	{
	}
]
freestyle_drum_stats = [
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
]
freestyle_mode_stats = {
}
freestyle_stats_permanent = [
	{
	}
	{
	}
	{
	}
]
freestyle_mode_stats_permanent = {
}
freestyle_song_running = FALSE
freestyle_drum_piece_index = {
	kick = 0
	snare = 1
	tom_mid = 2
	tom_hi = 3
	crash = 4
	hi_hat_closed = 5
	hi_hat_open = 6
	ride = 7
	cowbell = 8
}
freestyle_drum_piece_names = [
	qs(0x5d9cd494)
	qs(0x7050aefd)
	qs(0xd6245774)
	qs(0x2f27b67d)
	qs(0x0090d842)
	qs(0x8ab6ff47)
	qs(0x0b7ab945)
	qs(0xa639a04b)
	qs(0x2f806cb5)
]
g_instrument_text = {
	guitar = qs(0xaecdfaea)
	bass = qs(0x1fe7d0f9)
	drums = qs(0x40351ace)
}

script freestyle_reset_stats 
	Player = 0
	begin
	setstructureparam array_name = freestyle_stats array_index = <Player> param = play_style value = qs(0x3ea4a8b6)
	setstructureparam array_name = freestyle_stats array_index = <Player> param = total_notes_played value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_per_sec value = 0.0
	instrument = None
	instrument_text = qs(0x656d3042)
	if ($freestyle_player_data [<Player>].controller > -1)
		instrument = ($freestyle_player_data [<Player>].instrument)
		instrument_text = ($g_instrument_text.<instrument>)
	endif
	setstructureparam array_name = freestyle_stats array_index = <Player> param = instrument value = <instrument>
	setstructureparam array_name = freestyle_stats array_index = <Player> param = instrument_text value = <instrument_text>
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_tilt0 value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_tilt1 value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_tilt2 value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = favorite_tilt value = tilt1
	setstructureparam array_name = freestyle_stats array_index = <Player> param = favorite_tilt_notes value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_single value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_chord value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_lick value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_riff value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_epic value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_whammy value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_star value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = notes_solo value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = avg_notes_solo value = 0.0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = num_solos value = 0
	setstructureparam array_name = freestyle_stats array_index = <Player> param = whammy_waiting value = FALSE
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	piece_num = 0
	begin
	setstructureparam array_name = freestyle_drum_stats array_index = <piece_num> param = id value = ($freestyle_drummer_hit_anim_params [<piece_num>].piece)
	setstructureparam array_name = freestyle_drum_stats array_index = <piece_num> param = Name value = ($freestyle_drum_piece_names [<piece_num>])
	setstructureparam array_name = freestyle_drum_stats array_index = <piece_num> param = num_hits value = 0
	setstructureparam array_name = freestyle_drum_stats array_index = <piece_num> param = total_intensity value = 0.0
	setstructureparam array_name = freestyle_drum_stats array_index = <piece_num> param = avg_intensity value = 0.0
	piece_num = (<piece_num> + 1)
	repeat 9
	setstructureparam \{struct_name = freestyle_mode_stats
		param = song_length
		value = 0}
	setstructureparam \{struct_name = freestyle_mode_stats
		param = song_start
		value = 0}
	setstructureparam \{struct_name = freestyle_mode_stats
		param = style_string
		value = qs(0x656d3042)}
	setstructureparam \{struct_name = freestyle_mode_stats
		param = style_id
		value = None}
	setstructureparam \{struct_name = freestyle_mode_stats
		param = favorite_drum_text
		value = qs(0x656d3042)}
	setstructureparam \{struct_name = freestyle_mode_stats
		param = favorite_drum_index
		value = 0}
endscript

script freestyle_stats_song_start 
	Change \{freestyle_song_running = true}
	GetStartTime
	setstructureparam struct_name = freestyle_mode_stats param = song_start value = <starttime>
endscript

script freestyle_stats_song_end 
	if ($freestyle_song_running = true)
		getelapsedtime starttime = ($freestyle_mode_stats.song_start)
		setstructureparam struct_name = freestyle_mode_stats param = song_length value = <ElapsedTime>
	endif
	Change \{freestyle_song_running = FALSE}
endscript

script freestyle_stats_guitar_note_played 
	if NOT ($freestyle_song_running = true)
		return
	endif
	freestyle_increment_stat Player = <Player> stat_name = total_notes_played
	add_note_by_tilt Player = <Player>
	add_note_by_class Player = <Player> noteclass_triggered = <noteclass_triggered> mask = <highway_event>
	if ($freestyle_player_data [<Player>].soloing = true)
		freestyle_increment_stat Player = <Player> stat_name = notes_solo
	endif
	if (<accent_held> = true)
		freestyle_increment_stat Player = <Player> stat_name = notes_star
	endif
endscript

script add_note_by_tilt 
	getguitaractivetilt Player = <Player>
	note_tilt = None
	switch (<active_tilt>)
		case 0
		note_tilt = notes_tilt0
		case 1
		note_tilt = notes_tilt1
		case 2
		note_tilt = notes_tilt2
	endswitch
	freestyle_increment_stat Player = <Player> stat_name = <note_tilt>
endscript

script add_note_by_class 
	if (($freestyle_player_data [<Player>].instrument = guitar) && (<mask> = 69905))
		freestyle_increment_stat Player = <Player> stat_name = notes_epic
	else
		switch (<noteclass_triggered>)
			case single
			freestyle_increment_stat Player = <Player> stat_name = notes_single
			setstructureparam array_name = freestyle_stats array_index = <Player> param = whammy_waiting value = true
			case chord
			freestyle_increment_stat Player = <Player> stat_name = notes_chord
			setstructureparam array_name = freestyle_stats array_index = <Player> param = whammy_waiting value = true
			case lick
			freestyle_increment_stat Player = <Player> stat_name = notes_lick
			case riff
			freestyle_increment_stat Player = <Player> stat_name = notes_riff
		endswitch
	endif
endscript

script freestyle_stats_guitar_note_ended 
	setstructureparam array_name = freestyle_stats array_index = <Player> param = whammy_waiting value = FALSE
endscript

script freestyle_stats_drum_note_played 
	if NOT ($freestyle_song_running = true)
		return
	endif
	freestyle_increment_stat Player = <Player> stat_name = total_notes_played
	drum_index = ($freestyle_drum_piece_index.<piece>)
	drum_hits = ($freestyle_drum_stats [<drum_index>].num_hits)
	drum_intensity = ($freestyle_drum_stats [<drum_index>].total_intensity)
	drum_hits = (<drum_hits> + 1)
	drum_intensity = (<drum_intensity> + <velocity>)
	setstructureparam array_name = freestyle_drum_stats array_index = <drum_index> param = num_hits value = <drum_hits>
	setstructureparam array_name = freestyle_drum_stats array_index = <drum_index> param = total_intensity value = <drum_intensity>
	add_note_by_tilt Player = <Player>
	freestyle_increment_stat Player = <Player> stat_name = notes_single
	if ($freestyle_player_data [<Player>].soloing = true)
		freestyle_increment_stat Player = <Player> stat_name = notes_solo
	endif
endscript

script freestyle_increment_stat 
	stat_value = ($freestyle_stats [<Player>].<stat_name>)
	setstructureparam array_name = freestyle_stats array_index = <Player> param = <stat_name> value = (<stat_value> + 1)
endscript

script freestyle_stats_solo_start 
	freestyle_increment_stat Player = <Player> stat_name = num_solos
endscript

script freestyle_stats_do_calculations 
	temp_array = ($freestyle_drum_piece_names)
	SetArrayElement ArrayName = temp_array index = 8 NewValue = ($freestyle_current_style_settings.cowbell_name)
	Change freestyle_drum_piece_names = <temp_array>
	time_since_start = ($freestyle_mode_stats.song_length)
	setstructureparam struct_name = freestyle_mode_stats param = style_string value = ($freestyle_current_style_settings.visible_name)
	setstructureparam struct_name = freestyle_mode_stats param = style_id value = ($freestyle_current_style_settings.id)
	if (<time_since_start> > 0)
		if (<time_since_start> < 1000)
			time_since_start = 1000
		endif
		index = 0
		begin
		total_num = ($freestyle_stats [<index>].total_notes_played)
		average_num = ((<total_num> * 1000) / <time_since_start>)
		setstructureparam array_name = freestyle_stats array_index = <index> param = notes_per_sec value = <average_num>
		max_tilt = tilt0
		max_tilt_notes = ($freestyle_stats [<index>].notes_tilt0)
		if (($freestyle_stats [<index>].notes_tilt0) < ($freestyle_stats [<index>].notes_tilt1))
			max_tilt = tilt1
			max_tilt_notes = ($freestyle_stats [<index>].notes_tilt1)
		endif
		if (<max_tilt_notes> < ($freestyle_stats [<index>].notes_tilt2))
			max_tilt = tilt2
			max_tilt_notes = ($freestyle_stats [<index>].notes_tilt2)
		endif
		setstructureparam array_name = freestyle_stats array_index = <index> param = favorite_tilt value = <max_tilt>
		setstructureparam array_name = freestyle_stats array_index = <index> param = favorite_tilt_notes value = <max_tilt_notes>
		if ($freestyle_stats [<index>].num_solos > 0)
			total_num = ($freestyle_stats [<index>].notes_solo)
			num_solos = ($freestyle_stats [<index>].num_solos)
			average_num = (<total_num> / <num_solos>)
			setstructureparam array_name = freestyle_stats array_index = <index> param = avg_notes_solo value = <average_num>
		endif
		index = (<index> + 1)
		repeat $freestyle_max_players
	endif
	most_hits = 0
	most_hits_index = -1
	index = 0
	begin
	num_hits = ($freestyle_drum_stats [<index>].num_hits)
	if (<num_hits> > 0)
		total_inten = ($freestyle_drum_stats [<index>].total_intensity)
		average_inten = (<total_inten> / <num_hits>)
		setstructureparam array_name = freestyle_drum_stats array_index = <index> param = avg_intensity value = <average_inten>
		if (<num_hits> > <most_hits>)
			most_hits = <num_hits>
			most_hits_index = <index>
		endif
	endif
	index = (<index> + 1)
	repeat 9
	if (<most_hits_index> > -1)
		setstructureparam struct_name = freestyle_mode_stats param = favorite_drum_index value = <most_hits_index>
		setstructureparam struct_name = freestyle_mode_stats param = favorite_drum_text value = ($freestyle_drum_piece_names [<most_hits_index>])
	else
		setstructureparam struct_name = freestyle_mode_stats param = favorite_drum_index value = <most_hits_index>
		setstructureparam \{struct_name = freestyle_mode_stats
			param = favorite_drum_text
			value = qs(0x9c1b5214)}
	endif
endscript

script freestyle_stats_print 
	freestyle_stats_do_calculations
	printstruct \{$freestyle_stats}
	printstruct \{$freestyle_drum_stats}
	printstruct \{$freestyle_mode_stats}
endscript

script freestyle_stats_loop 
	begin
	index = 0
	begin
	if ($freestyle_player_data [<index>].controller > -1)
		if ($freestyle_stats [<index>].whammy_waiting = true)
			getguitarinputproperties Player = <index>
			if (<whammy_value> > 0.0)
				freestyle_increment_stat Player = <index> stat_name = notes_whammy
				setstructureparam array_name = freestyle_stats array_index = <index> param = whammy_waiting value = FALSE
			endif
		endif
	endif
	repeat $freestyle_max_players
	WaitOneGameFrame
	repeat
endscript

script get_max_field 
	RequireParams \{[
			struct
			fields
		]
		all}
	GetArraySize \{fields}
	num_fields = <array_Size>
	if (<num_fields> < 1)
		ScriptAssert \{'get_max_field called with no fields specified!'}
	endif
	max_value = 0
	max_field = (<fields> [0])
	index = 0
	begin
	this_field = (<fields> [<index>])
	this_value = (<struct>.<this_field>)
	if (<this_value> > <max_value>)
		max_value = (<struct>.<this_field>)
		max_field = <this_field>
	endif
	index = (<index> + 1)
	repeat <num_fields>
	return Field = <max_field> value = <max_value>
endscript

script freestyle_stats_setup_for_menu 
	freestyle_stats_do_calculations
	string_piece_1 = qs(0x00000000)
	string_piece_2 = qs(0x00000000)
	Player = 0
	begin
	if ($freestyle_player_data [<Player>].controller > -1)
		this_player_stats = ($freestyle_stats [<Player>])
		if ($freestyle_stats [<Player>].total_notes_played <= 0)
			if (<this_player_stats>.instrument = guitar)
				play_style_string = Random (@ qs(0x063d11fa) @ qs(0x8c468456) @ qs(0x63841b3c) @ qs(0xf240fa98) @ qs(0x8cc9478b) @ qs(0x4d05d3ee) @ qs(0xf6db7da0) @ qs(0x8ae49f43) @ qs(0x6a9cf0c5) @ qs(0xa58a58da) )
			elseif (<this_player_stats>.instrument = bass)
				play_style_string = Random (@ qs(0x6987ef20) @ qs(0x61afc54b) @ qs(0x63841b3c) @ qs(0xf7606675) @ qs(0x8cc9478b) @ qs(0x4d05d3ee) @ qs(0xf6db7da0) @ qs(0xc39568f0) @ qs(0x6a9cf0c5) @ qs(0xa58a58da) )
			elseif (<this_player_stats>.instrument = drums)
				play_style_string = Random (@ qs(0x36552517) @ qs(0x3e7d0f7c) @ qs(0x63841b3c) @ qs(0x49de7ad2) @ qs(0x8cc9478b) @ qs(0x4d05d3ee) @ qs(0xf6db7da0) @ qs(0x9c47a2c7) @ qs(0x6a9cf0c5) @ qs(0xa58a58da) )
			endif
		else
			num_01 = Random (@ 1 @ 2 @ 2 @ 2 @ 2 @ 3 @ 3 @ 3 @ 3 @ 4 @ 4 @ 4 @ 4 @ 5 @ 5 @ 5 @ 5 @ 6 @ 6 @ 6 @ 6 @ 7 @ 7 @ 7 @ 7 )
			if (<num_01> = 1)
				choice = Random (@ 1 @ 2 )
				if (<choice> = 1)
					play_style_string = Random (@ qs(0xc920e1a8) @ qs(0x6001fc78) @ qs(0x47e890f8) @ qs(0x2df5a692) @ qs(0x15f1ac84) @ qs(0xd5257c97) @ qs(0x7a049abf) @ qs(0x0bf56bf5) @ qs(0xd00cf0d0) @ qs(0x81f30272) @ qs(0xc95d3ae9) @ qs(0xeda54b20) @ qs(0x39074383) @ qs(0xc5a99e96) @ qs(0x3098436c) @ qs(0x6883cb60) @ qs(0x8f44b84d) @ qs(0x679a933d) @ qs(0x00c0d98f) @ qs(0x8f8cf8a5) @ qs(0x89fcc4ba) @ qs(0x0335c374) @ qs(0xec066769) @ qs(0xb95de77f) @ qs(0x3e4416ea) )
				else
					play_style_string = Random (@ qs(0x31a850e0) @ qs(0x64daa4f1) @ qs(0x5fe4df71) @ qs(0x1abf835b) @ qs(0x35647374) @ qs(0x8f95d6b9) @ qs(0x60d3b426) @ qs(0xefbcebc4) @ qs(0xa64c6266) @ qs(0xf4d1c234) @ qs(0xe97d2f7d) @ qs(0x4171a0e5) )
				endif
			elseif ((<num_01> = 2) || (<num_01> = 7))
				if (<this_player_stats>.instrument = guitar)
					play_style_string = Random (@ qs(0x9ef76377) @ qs(0x7e72f8f6) @ qs(0x87f52da4) @ qs(0xd6494ce9) @ qs(0xc9475bd3) @ qs(0x75a1375a) @ qs(0xb94ae3a0) @ qs(0x87f0942a) @ qs(0xd55a4355) @ qs(0x2c262de2) @ qs(0xc0921245) @ qs(0x30c97c52) @ qs(0x054b009f) )
				elseif (<this_player_stats>.instrument = bass)
					play_style_string = Random (@ qs(0xb8ebfdb5) @ qs(0xe3c6a59c) @ qs(0x8707e17e) @ qs(0x5f73e14d) @ qs(0xf9477572) @ qs(0x40855448) @ qs(0x0f2ebcca) @ qs(0x34d0df8e) @ qs(0x09d45526) @ qs(0xc4aa63b1) @ qs(0xac1cb42d) )
				elseif (<this_player_stats>.instrument = drums)
					play_style_string = Random (@ qs(0x2a73c61e) @ qs(0xd8274181) @ qs(0xa16776e1) @ qs(0x28025352) @ qs(0x8787b7e3) @ qs(0x8147c9d9) @ qs(0x3e96d9de) @ qs(0xe7e36ff0) @ qs(0x4251bacc) @ qs(0x8f82e1a4) @ qs(0xbff60e9f) @ qs(0xf4577c80) @ qs(0xce41b41b) @ qs(0x3575071d) @ qs(0x40855448) @ qs(0xa88b34b6) )
				endif
			elseif ((<num_01> = 3) || (<num_01> = 6))
				if ($freestyle_mode_stats.style_id = rockandroll)
					play_style_string = Random (@ qs(0x5920e67a) @ qs(0x79c03279) @ qs(0xb0cf8968) @ qs(0xdcc071bb) @ qs(0x49f7099b) @ qs(0xe369a260) @ qs(0xc0f22a99) @ qs(0xa6fa10bc) @ qs(0x623ca840) @ qs(0x820e211c) @ qs(0x583e96c0) @ qs(0xd136ec67) @ qs(0x8932cd51) @ qs(0xae303c5d) @ qs(0x50ed77c3) )
				elseif ($freestyle_mode_stats.style_id = metal)
					play_style_string = Random (@ qs(0xc0093c4d) @ qs(0x624dabb2) @ qs(0x1c66667f) @ qs(0x3f46a3f4) @ qs(0x6ecff874) @ qs(0xcdb36b33) @ qs(0x1e589d19) @ qs(0xcc3cdcc3) @ qs(0xd5f24906) @ qs(0xfa697e57) @ qs(0x0d5f65bb) @ qs(0xf63a98ae) )
				elseif ($freestyle_mode_stats.style_id = funk)
					play_style_string = Random (@ qs(0x684da4f5) @ qs(0xc14d0876) @ qs(0x1142ea32) @ qs(0xdbd5ac09) @ qs(0xba65fcca) @ qs(0xb2cdd8d1) @ qs(0x044f8b8a) @ qs(0xf5c84e02) @ qs(0x87c43f71) @ qs(0xabcf6a52) @ qs(0x859cdf78) @ qs(0x03bbc6c0) @ qs(0xce3bdbc8) @ qs(0xa432f5ec) )
				elseif ($freestyle_mode_stats.style_id = rock)
					play_style_string = Random (@ qs(0x5920e67a) @ qs(0x79c03279) @ qs(0xb0cf8968) @ qs(0xdcc071bb) @ qs(0x49f7099b) @ qs(0xe369a260) @ qs(0xc0f22a99) @ qs(0x5f1a197a) @ qs(0xf2dd01a9) @ qs(0x864c7b8c) @ qs(0xe7f1cf80) @ qs(0x90ae1b3c) @ qs(0xbf18e918) @ qs(0xfedd7c47) )
				elseif ($freestyle_mode_stats.style_id = blues)
					play_style_string = Random (@ qs(0xefaf2154) @ qs(0x5cc3616e) @ qs(0x0e640459) @ qs(0x7cc2f994) @ qs(0x3651a769) @ qs(0xa288e922) @ qs(0xb1162715) @ qs(0x7528732a) @ qs(0x377bbe03) @ qs(0xfca6dbe0) @ qs(0x293217e6) @ qs(0x7528732a) )
				endif
			elseif ((<num_01> = 4) || (<num_01> = 5))
				if ((<this_player_stats>.instrument = guitar) || (<this_player_stats>.instrument = bass))
					array = []
					temp_array = [sml]
					this_player_stats = ($freestyle_stats [<Player>])
					get_max_field struct = <this_player_stats> fields = [notes_tilt0 notes_tilt1 notes_tilt2]
					switch <Field>
						case notes_tilt0
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = tilt_0}
						array = (<array> + <temp_array>)
						case notes_tilt1
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = tilt_1}
						array = (<array> + <temp_array>)
						case notes_tilt2
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = tilt_2}
						array = (<array> + <temp_array>)
					endswitch
					if ($freestyle_stats [<Player>].notes_single >= $freestyle_stats [<Player>].total_notes_played / 2)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_single}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_chord >= $freestyle_stats [<Player>].total_notes_played / 2)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_chord}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_lick >= $freestyle_stats [<Player>].total_notes_played / 20)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_lick}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_riff >= $freestyle_stats [<Player>].total_notes_played / 20)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_riff}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_epic > 0)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_epic}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_star >= $freestyle_stats [<Player>].total_notes_played / 20)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_star}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_whammy >= $freestyle_stats [<Player>].total_notes_played / 20)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_whammy}
					endif
					if ($freestyle_stats [<Player>].notes_solo >= $freestyle_stats [<Player>].total_notes_played / 3)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_solo}
					endif
					if ($freestyle_stats [<Player>].total_notes_played <= 100)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = few_notes_played}
						array = (<array> + <temp_array>)
					endif
					GetArraySize <array>
					GetRandomValue Name = rand_index a = 0 b = (<array_Size> -1) integer
					flag = (<array> [<rand_index>])
					switch <flag>
						case tilt_0
						play_style_string = Random (@ qs(0x6f904888) @ qs(0x82eec2e8) @ qs(0x15b6653b) @ qs(0xd46788c3) @ qs(0x312ecae9) @ qs(0x14530008) @ qs(0xe9c383c7) @ qs(0x5be4129d) @ qs(0xbd4cc80b) @ qs(0x9b1e5634) @ qs(0xca6723d9) @ qs(0xa26aa7df) @ qs(0xf20c4880) @ qs(0x526492d2) )
						case tilt_1
						play_style_string = Random (@ qs(0xe80a9420) @ qs(0x2f1ac824) @ qs(0x922cb993) @ qs(0x5f127f4e) @ qs(0xba5b3d64) @ qs(0xe06d89a5) @ qs(0x62b6744a) @ qs(0x305bba02) @ qs(0x497241a6) @ qs(0x6f20df99) @ qs(0xe4b3f569) @ qs(0x25f07b77) )
						case tilt_2
						play_style_string = Random (@ qs(0xe45b3b6c) @ qs(0x2343042a) @ qs(0x9e7d16df) @ qs(0x5d349e0d) @ qs(0xb87ddc27) @ qs(0x499d5443) @ qs(0x60909509) @ qs(0xf1949aa9) @ qs(0xe0829c40) @ qs(0xc6d0027f) @ qs(0x922e714c) @ qs(0x29a1d43b) @ qs(0xfc220eac) @ qs(0x9932398f) @ qs(0x44bfd247) @ qs(0xb6aeaa5c) )
						case notes_single
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x20532f68) @ qs(0x7b3d03b9) @ qs(0x5a7502db) @ qs(0x7a79e6d2) @ qs(0x9f30a4f8) @ qs(0x89004419) @ qs(0x47ddedd6) @ qs(0x80f9de25) @ qs(0x201f8c1a) @ qs(0x064d1225) @ qs(0x74a952ef) @ qs(0xeda9c03f) )
						else
							play_style_string = Random (@ qs(0x3f9dcda4) @ qs(0x74628b07) @ qs(0xe682092c) @ qs(0x09fa43d2) @ qs(0x69c1f90e) @ qs(0x81ffed38) @ qs(0x77230e85) )
						endif
						case notes_chord
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0xc7f3aa12) @ qs(0x64077a6e) @ qs(0xbdd587a1) @ qs(0x55292bd8) @ qs(0xb06069f2) @ qs(0xfa1516b8) @ qs(0x688d20dc) @ qs(0x423b6455) @ qs(0x530adebb) @ qs(0x75584084) @ qs(0x7022b349) @ qs(0x0a094545) )
						else
							string_piece_1 = Random (@ qs(0x1495be34) @ qs(0x5eda94ae) @ qs(0x6dd693e6) @ qs(0x956f35a8) )
						endif
						case notes_lick
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x3102ecf4) @ qs(0xeb69836c) @ qs(0x735fdf02) )
						else
							play_style_string = Random (@ qs(0x82f8f020) @ qs(0xed054fa9) @ qs(0x1d4a9f36) )
						endif
						case notes_riff
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x6d8f5329) @ qs(0x0d22842e) @ qs(0x17a97e9a) @ qs(0xb0f0072f) @ qs(0x55b94505) @ qs(0xd2a35d4b) @ qs(0x8d540c2b) @ qs(0x1170b8e2) @ qs(0x7bbc9548) @ qs(0x5dee0b77) @ qs(0x54c34682) @ qs(0xa075bc7e) )
						else
							play_style_string = Random (@ qs(0x97131b43) @ qs(0x4d266500) @ qs(0x7a66f85e) @ qs(0xa9977eba) @ qs(0xabe9e447) @ qs(0x42165386) @ qs(0xc399a6ba) )
						endif
						case notes_epic
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x180e452a) @ qs(0xb68b79eb) @ qs(0x62286899) @ qs(0x6d47c00c) @ qs(0x880e8226) @ qs(0xda4a01de) @ qs(0x50e3cb08) @ qs(0x972cd39c) @ qs(0x7355c9dd) @ qs(0x550757e2) @ qs(0x3f1f2c76) @ qs(0xd5f4aa7d) )
						else
							play_style_string = Random (@ qs(0x95752866) @ qs(0x2ab90412) @ qs(0x9493e02e) @ qs(0x03164d2e) @ qs(0x9493e02e) @ qs(0x03164d2e) @ qs(0xe4814bf1) @ qs(0xd8344a3c) @ qs(0xbea1f9ad) @ qs(0x059cbaa2) @ qs(0x41015fa2) )
						endif
						case notes_star
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x5502313e) @ qs(0xa8d70999) @ qs(0x2f241c8d) @ qs(0x874650f6) @ qs(0x620f12dc) @ qs(0xf21173bb) @ qs(0xbae25bf2) @ qs(0x6b66d0cb) @ qs(0x5b0ebbb8) @ qs(0x7d5c2587) @ qs(0x53ec4a15) @ qs(0x98f8de69) )
						else
							play_style_string = Random (@ qs(0xe458d206) @ qs(0xe4f72eaa) @ qs(0xc69ccc41) @ qs(0xb03a1d64) @ qs(0x1fdbb849) @ qs(0xbab54b12) @ qs(0xdbde16c5) @ qs(0x8573a059) @ qs(0x59ae91d8) )
						endif
						case notes_whammy
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0xebb374ff) @ qs(0x2d307e6d) @ qs(0x9195594c) @ qs(0xc89ec3a0) @ qs(0x2dd7818a) @ qs(0x9bb6b481) @ qs(0xf53ac8a4) @ qs(0x161b8b8b) @ qs(0x32a97c82) @ qs(0x14fbe2bd) @ qs(0x5f2cf011) @ qs(0x26499ba8) )
						else
							play_style_string = Random (@ qs(0x33bacc6a) @ qs(0x9940d309) @ qs(0xe3d70295) @ qs(0x0e139791) @ qs(0x2a7dc8c2) @ qs(0x63683797) @ qs(0x43a82be5) @ qs(0x31bd5589) @ qs(0xa0200af6) @ qs(0xfc7ba916) @ qs(0x68c6246e) @ qs(0xd5cf32c9) @ qs(0x855aa965) @ qs(0xa29014bc) )
						endif
						case notes_solo
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x5500a59a) @ qs(0x51e0035a) @ qs(0x2f268829) @ qs(0xec05356b) @ qs(0x094c7741) @ qs(0xf8348f47) @ qs(0xd1a13e6f) @ qs(0xe22d87ed) @ qs(0x512b4744) @ qs(0x7779d97b) @ qs(0x653d842d) @ qs(0x98fa4acd) )
						else
							play_style_string = Random (@ qs(0xf38903ae) @ qs(0x00a92a25) @ qs(0x1e60803d) @ qs(0x3ba8e932) @ qs(0x7074124e) @ qs(0xc7ae00e9) @ qs(0x7a9ae75b) @ qs(0x2345dfd5) @ qs(0xeeceaa00) @ qs(0xd5c7d2ce) @ qs(0x37eff5f8) @ qs(0x3a805242) )
						endif
						case few_notes_played
						play_style_string = Random (@ qs(0x63841b3c) @ qs(0x8cc9478b) @ qs(0x4d05d3ee) @ qs(0xf6db7da0) @ qs(0x6a9cf0c5) @ qs(0xa58a58da) )
					endswitch
				elseif (<this_player_stats>.instrument = drums)
					array = []
					temp_array = [sml]
					SetArrayElement \{ArrayName = temp_array
						index = 0
						NewValue = Intensity}
					array = (<array> + <temp_array>)
					if ($freestyle_mode_stats.favorite_drum_index = 0)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = bass}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 1)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = snare}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 2)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = low_tom}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 3)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = high_tom}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 4)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = crash}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 5)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = hi_hat_closed}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 6)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = hi_hat_open}
						array = (<array> + <temp_array>)
					elseif ($freestyle_mode_stats.favorite_drum_index = 7)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = ride}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].total_notes_played >= 500)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = lots_notes_played}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].total_notes_played <= 499)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = few_notes_played}
						array = (<array> + <temp_array>)
					endif
					if ($freestyle_stats [<Player>].notes_solo >= $freestyle_stats [<Player>].total_notes_played / 4)
						SetArrayElement \{ArrayName = temp_array
							index = 0
							NewValue = notes_solo}
						array = (<array> + <temp_array>)
					endif
					GetArraySize <array>
					GetRandomValue Name = rand_index a = 0 b = (<array_Size> -1) integer
					flag = (<array> [<rand_index>])
					switch <flag>
						case bass
						play_style_string = Random (@ qs(0x31e75567) @ qs(0xdaa1e904) @ qs(0x4bc178d4) @ qs(0xb1db1fb2) @ qs(0x54925d98) @ qs(0x621cf287) @ qs(0x8c7f14b6) @ qs(0xf4a250ea) @ qs(0xcb033a84) @ qs(0xed51a4bb) @ qs(0x32cb4312) @ qs(0xfc1dba30) @ qs(0x556de905) @ qs(0xfe20d312) @ qs(0xd4cefdd4) @ qs(0x36157ef3) )
						case snare
						choice = Random (@ 1 @ 2 @ 3 )
						if ((<choice> = 1) || (<choice> = 2))
							play_style_string = Random (@ qs(0xd9dd10a4) @ qs(0x43a56f52) @ qs(0xa3fb3d17) @ qs(0x0b5d2238) @ qs(0xee146012) @ qs(0xfbcd4877) @ qs(0x36f9293c) @ qs(0x3fbe3c3f) @ qs(0x52d28074) @ qs(0x74801e4b) @ qs(0x8a809427) @ qs(0x1427fff3) )
						else
							play_style_string = Random (@ qs(0x8ec40010) @ qs(0x06005d62) @ qs(0xe42fef77) @ qs(0xb663aead) @ qs(0xbe2f39fc) )
						endif
						case low_tom
						choice = Random (@ 1 @ 2 @ 3 )
						if ((<choice> = 1) || (<choice> = 2))
							play_style_string = Random (@ qs(0xdfd48ac7) @ qs(0xbcb83c61) @ qs(0xa5f2a774) @ qs(0x85f7ab61) @ qs(0x60bee94b) @ qs(0x1a7b33c0) @ qs(0xb853a065) @ qs(0x139a120b) @ qs(0xb364fbc3) @ qs(0x953665fc) @ qs(0xed7c463b) @ qs(0x122e6590) )
						else
							play_style_string = Random (@ qs(0x08d139cf) @ qs(0xa4c5ce50) @ qs(0xf85a27ae) )
						endif
						case high_tom
						choice = Random (@ 1 @ 2 @ 3 )
						if ((<choice> = 1) || (<choice> = 2))
							play_style_string = Random (@ qs(0x7e794c05) @ qs(0x35eb2aaf) @ qs(0x045f61b6) @ qs(0xddbef9f4) @ qs(0x38f7bbde) @ qs(0xe965ae65) @ qs(0xe01af2f0) @ qs(0xbdabd480) @ qs(0x407a6666) @ qs(0x6628f859) @ qs(0x470cce0f) @ qs(0xb383a352) )
						else
							play_style_string = Random (@ qs(0x08d139cf) @ qs(0xa4c5ce50) @ qs(0x522aaf9a) )
						endif
						case crash
						choice = Random (@ 1 @ 2 @ 3 )
						if ((<choice> = 1) || (<choice> = 2))
							play_style_string = Random (@ qs(0x45730ebc) @ qs(0x3c32cab6) @ qs(0x3f55230f) @ qs(0xc1fb1422) @ qs(0x24b25608) @ qs(0xb1e5f775) @ qs(0xfc5f1f26) @ qs(0x5534c1c8) @ qs(0x18fa3f76) @ qs(0x3ea8a149) @ qs(0x12710776) @ qs(0x8889e1eb) )
						else
							play_style_string = Random (@ qs(0x4998df0f) @ qs(0x0854175a) @ qs(0x7789d04f) @ qs(0x051ed42a) @ qs(0xb0d619d5) @ qs(0x19bccc0c) )
						endif
						case hi_hat_closed
						choice = Random (@ 1 @ 2 @ 3 @ 4 )
						if ((<choice> = 1) || (<choice> = 2) || (<choice> = 3))
							play_style_string = Random (@ qs(0xc29ebede) @ qs(0xfa3c567b) @ qs(0xb8b8936d) @ qs(0xe91724e1) @ qs(0x0c5e66cb) @ qs(0x7d98adcf) @ qs(0xd4b32fe5) @ qs(0x46f23b8b) @ qs(0xd48765cc) @ qs(0xf2d5fbf3) @ qs(0x944d1374) @ qs(0x0f645189) )
						else
							play_style_string = Random (@ qs(0x970811a2) @ qs(0xc3a01ff2) @ qs(0x9cbbda95) @ qs(0xdf72210d) )
						endif
						case hi_hat_open
						choice = Random (@ 1 @ 2 @ 3 @ 4 )
						if ((<choice> = 1) || (<choice> = 2) || (<choice> = 3))
							play_style_string = Random (@ qs(0x1fe5e434) @ qs(0x005ea93b) @ qs(0x65c3c987) @ qs(0xf6d0d1f4) @ qs(0x139993de) @ qs(0x91d8a9a1) @ qs(0xcb74daf0) @ qs(0xece72205) @ qs(0x38c761a2) @ qs(0x1e95ff9d) @ qs(0x5526a464) @ qs(0xd21f0b63) )
						else
							play_style_string = Random (@ qs(0x970811a2) @ qs(0xc3a01ff2) @ qs(0x9cbbda95) @ qs(0xdf72210d) )
						endif
						case ride
						choice = Random (@ 1 @ 2 @ 3 @ 4 )
						if ((<choice> = 1) || (<choice> = 2) || (<choice> = 3))
							play_style_string = Random (@ qs(0x4dd5153c) @ qs(0x7b2c0b06) @ qs(0x37f3388f) @ qs(0x73cdba09) @ qs(0x9684f823) @ qs(0xba499e82) @ qs(0x4e69b10d) @ qs(0x7323913c) @ qs(0x13565681) @ qs(0x3504c8be) @ qs(0x09ca542c) @ qs(0x802ffa6b) )
						else
							play_style_string = Random (@ qs(0xbac3249c) @ qs(0xb476cffd) @ qs(0xfa22d298) @ qs(0x386a2006) )
						endif
						case lots_notes_played
						play_style_string = Random (@ qs(0x671292a6) @ qs(0xc662c076) @ qs(0x4dbe3e81) @ qs(0x36c7d3d5) @ qs(0xea167118) @ qs(0x850d507c) @ qs(0xd877e54c) @ qs(0x89ecdb55) @ qs(0xc7de722f) @ qs(0x0695f2be) @ qs(0xf8deea55) )
						case few_notes_played
						play_style_string = Random (@ qs(0x63841b3c) @ qs(0x8cc9478b) @ qs(0x4d05d3ee) @ qs(0xf6db7da0) @ qs(0x6a9cf0c5) @ qs(0xa58a58da) )
						case notes_solo
						choice = Random (@ 1 @ 2 )
						if (<choice> = 1)
							play_style_string = Random (@ qs(0x5500a59a) @ qs(0x51e0035a) @ qs(0x2f268829) @ qs(0xec05356b) @ qs(0x094c7741) @ qs(0xf8348f47) @ qs(0xd1a13e6f) @ qs(0xe22d87ed) @ qs(0x512b4744) @ qs(0x7779d97b) @ qs(0x653d842d) @ qs(0x98fa4acd) )
						else
							play_style_string = Random (@ qs(0xf38903ae) @ qs(0x00a92a25) @ qs(0x1e60803d) @ qs(0x3ba8e932) @ qs(0x7074124e) @ qs(0xc7ae00e9) @ qs(0x59ff87e3) @ qs(0x7a9ae75b) @ qs(0x2345dfd5) @ qs(0xeeceaa00) @ qs(0xd5c7d2ce) @ qs(0x37eff5f8) @ qs(0x3a805242) )
						endif
						case Intensity
						most_hits = 0
						most_hits_index = -1
						index = 0
						average_inten = 0
						num_of_hit_pieces = 0
						total_average_intensity = 0
						begin
						num_hits = ($freestyle_drum_stats [<index>].num_hits)
						if (<num_hits> > 0)
							num_of_hit_pieces = (<num_of_hit_pieces> + 1)
							total_inten = ($freestyle_drum_stats [<index>].total_intensity)
							average_inten = (<total_inten> / <num_hits>)
							setstructureparam array_name = freestyle_drum_stats array_index = <index> param = avg_intensity value = <average_inten>
							total_average_intensity = (<total_average_intensity> + <average_inten>)
							if (<num_hits> > <most_hits>)
								most_hits = <num_hits>
								most_hits_index = <index>
							endif
						endif
						index = (<index> + 1)
						repeat 9
						avg_percent = ((<total_average_intensity> / <num_of_hit_pieces>) * 100)
						CastToInteger \{avg_percent}
						if (<avg_percent> <= 89)
							play_style_string = Random (@ qs(0xc6d3775f) @ qs(0xa48b60f6) @ qs(0x1b8f5a70) @ qs(0x56103492) @ qs(0x20674131) @ qs(0xad43c076) @ qs(0xac2e10e4) @ qs(0xc73088e4) @ qs(0xb38c42b5) @ qs(0x0d4187f3) @ qs(0x771b4241) @ qs(0x6ec65269) @ qs(0x02f8bf04) )
						else
							play_style_string = Random (@ qs(0x4e334842) @ qs(0x517cb1d5) @ qs(0xe39c49b8) @ qs(0x3db330ce) @ qs(0x8ecadd5e) @ qs(0x5a31699d) @ qs(0x96388d2e) @ qs(0x336dd154) @ qs(0x413c4d40) @ qs(0x6eb58bfd) @ qs(0x9a947f1b) @ qs(0x016e34eb) @ qs(0x316c2fa4) )
						endif
					endswitch
				endif
			endif
		endif
		printf '%s' s = <play_style_string>
		setstructureparam array_name = freestyle_stats array_index = <Player> param = play_style value = <play_style_string>
	endif
	Player = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_debug_stats_loop 
	begin
	freestyle_stats_setup_for_menu
	Wait \{0.25
		Seconds}
	repeat
endscript

script freestyle_carve_stats_into_stone 
	Change freestyle_stats_permanent = ($freestyle_stats)
	Change freestyle_mode_stats_permanent = ($freestyle_mode_stats)
	Change freestyle_player_data_permanent = ($freestyle_player_data)
endscript

script freestyle_retrieve_stats_from_stone 
	Change freestyle_stats = ($freestyle_stats_permanent)
	Change freestyle_mode_stats = ($freestyle_mode_stats_permanent)
	Change freestyle_player_data = ($freestyle_player_data_permanent)
endscript

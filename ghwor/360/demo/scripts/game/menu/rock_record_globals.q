debug_rock_record = 0
g_rock_record_genre_default = qs(0xae01dcbe)
rock_record_main_stats = [
	{
		text = qs(0x131f6f33)
		columns = [
			num_times_played_guitar
			num_times_played_bass
			num_times_played_drums
			num_times_played_vocals
		]
		more_data = [
			[
				num_times_played_beginner_guitar
				num_times_played_easy_guitar
				num_times_played_medium_guitar
				num_times_played_hard_guitar
				num_times_played_expert_guitar
			]
			[
				num_times_played_beginner_bass
				num_times_played_easy_bass
				num_times_played_medium_bass
				num_times_played_hard_bass
				num_times_played_expert_bass
			]
			[
				num_times_played_beginner_drum
				num_times_played_easy_drum
				num_times_played_medium_drum
				num_times_played_hard_drum
				num_times_played_expert_drum
				num_times_played_expert_plus_drum
			]
			[
				num_times_played_beginner_vocal
				num_times_played_easy_vocal
				num_times_played_medium_vocal
				num_times_played_hard_vocal
				num_times_played_expert_vocal
			]
		]
		format_script = rr_get_preferred_instrument
	}
	{
		text = qs(0xf832129c)
		columns = [
			lifetime_total_song_multiplier
			lifetime_num_additions_to_total_song_multiplier
		]
		format_script = rr_average_two_columns
	}
	{
		text = qs(0x17edc7fc)
		columns = [
			total_song_multiplier
			num_additions_to_total_song_multiplier
		]
		format_script = rr_average_two_columns
	}
	{
		text = qs(0x8839a0ec)
		columns = [
			lifetime_num_songs_completed
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xca9c1910)
		columns = [
			num_songs_completed
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x44a38388)
		columns = [
			lifetime_notes_hit
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xc649c34d)
		columns = [
			notes_hit
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x46921616)
		columns = [
			lifetime_total_time_playing_in_seconds
		]
		format_script = rr_get_time_string
		format_data = {
			new_format = 1
		}
	}
	{
		text = qs(0x4c26f12a)
		columns = [
			total_time_playing_in_seconds
		]
		format_script = rr_get_time_string
		format_data = {
			new_format = 1
		}
	}
	{
		text = qs(0x57c4b17c)
		columns = [
			lifetime_longest_notestreak
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xd6199c04)
		columns = [
			longest_notestreak
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x85a7d2a8)
		columns = [
			total_score
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x3cba2309)
		columns = [
			favorite_genre
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x9f60cdef)
		columns = [
			num_star_power_activations
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xfd3f32d7)
		columns = [
			num_songs_in_library
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xb828b8ca)
		columns = [
			lifetime_num_coop_games_played
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xe6ecedb5)
		columns = [
			num_coop_games_played
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xa5a3146a)
		columns = [
			lifetime_num_versus_games_played
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xfb674115)
		columns = [
			num_versus_games_played
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xb278db37)
		columns = [
			lifetime_num_versus_games_played
		]
		format_script = rr_use_blank_column
	}
]

script rr_use_single_column 
	requireparams \{[
			data
		]
		all}
	return stat_value = (<data> [0])
endscript

script rr_use_blank_column 
	requireparams \{[
			data
		]
		all}
	return \{stat_value = qs(0x00000000)}
endscript

script rr_slash_divider 
	requireparams \{[
			data
		]
		all}
	getarraysize <data>
	if (<array_size> >= 2)
		formattext textname = data_text qs(0xc68134fb) f = (<data> [0]) s = (<data> [1])
		return data_text = <data_text>
	endif
	return stat_value = (<data> [0])
endscript

script get_max_value_index 
	requireparams \{[
			array
		]
		all}
	getarraysize <array>
	if (<array_size> > 0)
		<max_index> = 0
		<index> = 1
		begin
		if (<array> [<index>] >= <array> [<max_index>] && <array> [<index>] > 0)
			<max_index> = <index>
		endif
		<index> = (<index> + 1)
		repeat (<array_size> - 1)
		return index = <max_index>
	endif
endscript

script rr_get_preferred_instrument 
	requireparams \{[
			data
		]
		all}
	get_max_value_index array = <data>
	if gotparam \{index}
		switch (<index>)
			case 0
			<instrument> = qs(0x9504b94a)
			case 1
			<instrument> = qs(0x7d4f9214)
			case 2
			<instrument> = qs(0xcf488ba5)
			case 3
			<instrument> = qs(0x1b9f6f84)
			default
			<instrument> = qs(0x4c1271a9)
		endswitch
		rr_get_preferred_difficulty data = (<more_data> [<index>])
		<difficulty> = <data_text>
	else
		<instrument> = qs(0x4c1271a9)
		<difficulty> = qs(0x4c1271a9)
	endif
	formattext textname = data_text qs(0x1a22a2c1) i = <instrument> d = <difficulty>
	return data_text = <data_text>
endscript

script rr_average_two_columns 
	requireparams \{[
			data
		]
		all}
	getarraysize <data>
	if (<array_size> >= 2)
		<value> = 0.0
		if (<data> [1] > 0.0)
			<value> = (<data> [0] / (<data> [1] * 1.0))
		endif
		formattext textname = data_text qs(0x35b12509) a = <value>
		return data_text = <data_text>
	endif
	return stat_value = (<data> [0])
endscript

script rr_get_preferred_difficulty 
	requireparams \{[
			data
		]
		all}
	get_max_value_index array = <data>
	if gotparam \{index}
		switch (<index>)
			case 0
			data_text = qs(0x74d6a0a0)
			case 1
			data_text = qs(0x8d657387)
			case 2
			data_text = qs(0x6ef11a01)
			case 3
			data_text = qs(0x51b06d2f)
			case 4
			data_text = qs(0x334908ac)
			case 5
			data_text = qs(0x41873008)
			default
			data_text = qs(0x4c1271a9)
		endswitch
	else
		data_text = qs(0x4c1271a9)
	endif
	return data_text = <data_text>
endscript

script rr_get_time_string \{new_format = 0}
	requireparams \{[
			data
		]
		all}
	<total_time> = (<data> [0])
	mod a = <total_time> b = 60
	<seconds> = <mod>
	if (<seconds> < 10)
		formattext textname = data_text qs(0xa14d5c1b) a = <seconds>
	else
		formattext textname = data_text qs(0x35b12509) a = <seconds>
	endif
	<total_time> = (<total_time> - <seconds>)
	if (<total_time> > 0)
		mod a = <total_time> b = (60 * 60)
		<minutes> = <mod>
		formattext textname = data_text qs(0xd01e380d) a = (<minutes> / 60) t = <data_text>
		<total_time> = (<total_time> - <minutes>)
		if (<total_time> > 0)
			mod a = <total_time> b = (60 * 60 * 60)
			<hours> = <mod>
			if (<minutes> < (10 * 60))
				formattext textname = data_text qs(0x96f8ba0f) t = <data_text>
				formattext textname = data_text qs(0xd01e380d) a = (<hours> / (60 * 60)) t = <data_text>
			else
				formattext textname = data_text qs(0xd01e380d) a = (<hours> / (60 * 60)) t = <data_text>
			endif
			<total_time> = (<total_time> - <hours>)
			if (<total_time> > 0)
				mod a = <total_time> b = (60 * 60 * 60 * 24)
				<days> = <mod>
				if (<hours> < (10 * 60 * 60))
					formattext textname = data_text qs(0x96f8ba0f) t = <data_text>
					formattext textname = data_text qs(0xd01e380d) t = <data_text> a = (<days> / (60 * 60 * 60))
				else
					formattext textname = data_text qs(0xd01e380d) t = <data_text> a = (<days> / (60 * 60 * 60))
				endif
			elseif (<new_format> = 1)
				if (<hours> < (10 * 60 * 60))
					formattext textname = data_text qs(0x96f8ba0f) t = <data_text>
				endif
			endif
		elseif (<new_format> = 1)
			if (<minutes> < (10 * 60))
				formattext textname = data_text qs(0x96f8ba0f) t = <data_text>
				formattext textname = data_text qs(0x881581f9) t = <data_text>
			else
				formattext textname = data_text qs(0x881581f9) t = <data_text>
			endif
		endif
	elseif (<new_format> = 1)
		formattext textname = data_text qs(0x23f47de8) t = <data_text>
	endif
	return data_text = <data_text>
endscript

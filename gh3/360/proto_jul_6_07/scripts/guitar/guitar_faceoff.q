
script faceoff_init 
	if ($boss_battle = 1)
		return
	endif
	change structurename = <player_status> 0xd1b731dd = 0
	printf "Faceoff Iterator started with time %d" d = <time_offset>
	change faceoff_enabled = 1
	if ($is_network_game)
		if NOT ishost
			if (<player_text> = 'p1')
				<player_text> = 'p2'
			else
				<player_text> = 'p1'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = note_array '%s_faceoff%p' s = <song_prefix> p = <player_text> addtostringlookup
	getarraysize $<note_array>
	if (<array_size> = 0)
		time = 1000000
	else
		time = ($<note_array> [0] [0])
	endif
	if (<player> = 1)
		change faceoff_note_array_p1 = <note_array>
		change faceoff_note_array_count_p1 = 0
		change faceoff_note_array_size_p1 = <array_size>
		change faceoff_note_time_p1 = <time>
		change faceoff_time_offset_p1 = <time_offset>
	else
		change faceoff_note_array_p2 = <note_array>
		change faceoff_note_array_count_p2 = 0
		change faceoff_note_array_size_p2 = <array_size>
		change faceoff_note_time_p2 = <time>
		change faceoff_time_offset_p2 = <time_offset>
	endif
endscript

script faceoff_deinit 
endscript

script 0x121ac694 
	getsongtimems time_offset = ($faceoff_time_offset_p1)
	if (<time> > $faceoff_note_time_p1)
		note_array = $faceoff_note_array_p1
		0x6f9db932 = (<note_array> [$faceoff_note_array_count_p1] [0])
		0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoff_note_array_count_p1] [1])
		if (<time> >= <0x6f9db932>)
			change structurename = player1_status 0xd1b731dd = 1
			change faceoff_note_time_p1 = <0xa4b0825c>
		endif
		if (<time> >= <0xa4b0825c>)
			change structurename = player1_status 0xd1b731dd = 0
			change faceoff_note_array_count_p1 = ($faceoff_note_array_count_p1 + 1)
			if ($faceoff_note_array_count_p1 = $faceoff_note_array_size_p1)
				change faceoff_note_time_p1 = 1000000
			else
				0x6f9db932 = (<note_array> [$faceoff_note_array_count_p1] [0])
				change faceoff_note_time_p1 = <0x6f9db932>
			endif
		endif
	endif
	if ($player1_status.highway_layout = solo_highway)
		return
	endif
	getsongtimems time_offset = ($faceoff_time_offset_p2)
	if (<time> > $faceoff_note_time_p2)
		note_array = $faceoff_note_array_p2
		0x6f9db932 = (<note_array> [$faceoff_note_array_count_p2] [0])
		0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoff_note_array_count_p2] [1])
		if (<time> >= <0x6f9db932>)
			change structurename = player2_status 0xd1b731dd = 1
			change faceoff_note_time_p2 = <0xa4b0825c>
		endif
		if (<time> >= <0xa4b0825c>)
			change structurename = player2_status 0xd1b731dd = 0
			change faceoff_note_array_count_p2 = ($faceoff_note_array_count_p2 + 1)
			if ($faceoff_note_array_count_p2 = $faceoff_note_array_size_p2)
				change faceoff_note_time_p2 = 1000000
			else
				0x6f9db932 = (<note_array> [$faceoff_note_array_count_p2] [0])
				change faceoff_note_time_p2 = <0x6f9db932>
			endif
		endif
	endif
endscript

script faceoff_volumes_init 
	if ($boss_battle = 1)
		return
	endif
	printf "Faceoff Volume Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formattext checksumname = note_array '%s_faceoff%p' s = <song_prefix> p = <player_text> addtostringlookup
	getarraysize $<note_array>
	if (<array_size> = 0)
		time = 1000000
	else
		time = ($<note_array> [0] [0])
	endif
	if (<player> = 1)
		change faceoffv_note_array_p1 = <note_array>
		change faceoffv_note_array_count_p1 = 0
		change faceoffv_note_array_size_p1 = <array_size>
		change faceoffv_note_time_p1 = <time>
		change faceoffv_note_on_p1 = 0
		change faceoffv_time_offset_p1 = <time_offset>
	else
		change faceoffv_note_array_p2 = <note_array>
		change faceoffv_note_array_count_p2 = 0
		change faceoffv_note_array_size_p2 = <array_size>
		change faceoffv_note_time_p2 = <time>
		change faceoffv_note_on_p2 = 0
		change faceoffv_time_offset_p2 = <time_offset>
	endif
	if ($is_attract_mode = 1)
		change structurename = player1_status guitar_volume = 100
		change structurename = player2_status guitar_volume = 100
	else
		change structurename = player1_status guitar_volume = 0
		change structurename = player2_status guitar_volume = 0
	endif
	0x1c07e771
endscript

script faceoff_volumes_deinit 
	change structurename = <player_status> 0xd1b731dd = 1
	change \{faceoff_enabled = 0}
endscript

script 0x4e4153f2 
	if ($is_attract_mode = 1)
		return
	endif
	getsongtimems time_offset = ($faceoffv_time_offset_p1)
	0x527ebe59 = 0
	0x7eedd98b = 0
	if (<time> > $faceoffv_note_time_p1)
		note_array = $faceoffv_note_array_p1
		0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p1] [0])
		0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoffv_note_array_count_p1] [1])
		if (<time> >= <0xa4b0825c>)
			change faceoffv_note_on_p1 = 0
			change faceoffv_note_array_count_p1 = ($faceoffv_note_array_count_p1 + 1)
			if ($faceoffv_note_array_count_p1 = $faceoffv_note_array_size_p1)
				change faceoffv_note_time_p1 = 1000000
			else
				0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p1] [0])
				change faceoffv_note_time_p1 = <0x6f9db932>
			endif
			0x7eedd98b = 1
		elseif (<time> >= <0x6f9db932>)
			change faceoffv_note_on_p1 = 1
			change faceoffv_note_time_p1 = <0xa4b0825c>
			0x527ebe59 = 1
		endif
	endif
	getsongtimems time_offset = ($faceoffv_time_offset_p2)
	0x6bf3829c = 0
	0x95da6288 = 0
	if NOT ($player1_status.highway_layout = solo_highway)
		if (<time> > $faceoffv_note_time_p2)
			note_array = $faceoffv_note_array_p2
			0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p2] [0])
			0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoffv_note_array_count_p2] [1])
			if (<time> >= <0xa4b0825c>)
				change faceoffv_note_on_p2 = 0
				change faceoffv_note_array_count_p2 = ($faceoffv_note_array_count_p2 + 1)
				if ($faceoffv_note_array_count_p2 = $faceoffv_note_array_size_p2)
					change faceoffv_note_time_p2 = 1000000
				else
					0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p2] [0])
					change faceoffv_note_time_p2 = <0x6f9db932>
				endif
				0x95da6288 = 1
			elseif (<time> >= <0x6f9db932>)
				change faceoffv_note_on_p2 = 1
				change faceoffv_note_time_p2 = <0xa4b0825c>
				0x6bf3829c = 1
			endif
		endif
	endif
	if (<0x527ebe59> = 1)
		change structurename = player1_status guitar_volume = 100
		if ($faceoffv_note_on_p2 = 0)
			change structurename = player2_status guitar_volume = 0
		endif
		0x1c07e771
	endif
	if (<0x95da6288> = 1)
		if ($faceoffv_note_on_p1 = 1)
			change structurename = player2_status guitar_volume = 0
		endif
		0x1c07e771
	endif
	if (<0x6bf3829c> = 1)
		change structurename = player2_status guitar_volume = 100
		if ($faceoffv_note_on_p1 = 0)
			change structurename = player1_status guitar_volume = 0
		endif
		0x1c07e771
	endif
	if (<0x7eedd98b> = 1)
		if ($faceoffv_note_on_p2 = 1)
			change structurename = player1_status guitar_volume = 0
		endif
		0x1c07e771
	endif
endscript

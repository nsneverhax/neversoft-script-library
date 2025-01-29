
script faceoff_init 
	if ($boss_battle = 1)
		return
	endif
	Change structurename = <player_status> gem_filler_enabled_time_on = 0
	Change structurename = <player_status> gem_filler_enabled_time_off = 0
	printf "Faceoff Iterator started with time %d" d = <time_offset>
	Change \{faceoff_enabled = 1}
	if ($is_network_game)
		if NOT IsHost
			if (<player_text> = 'p1')
				<player_text> = 'p2'
			else
				<player_text> = 'p1'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	formatText checksumName = note_array '%s_faceoff%p' s = <song_prefix> p = <player_text> AddToStringLookup
	GetArraySize $<note_array>
	if (<array_Size> = 0)
		time = 1000000
	else
		time = ($<note_array> [0] [0])
	endif
	if (<Player> = 1)
		Change faceoff_note_array_p1 = <note_array>
		Change \{faceoff_note_array_count_p1 = 0}
		Change faceoff_note_array_size_p1 = <array_Size>
		Change faceoff_note_time_p1 = <time>
		Change faceoff_time_offset_p1 = <time_offset>
	else
		Change faceoff_note_array_p2 = <note_array>
		Change \{faceoff_note_array_count_p2 = 0}
		Change faceoff_note_array_size_p2 = <array_Size>
		Change faceoff_note_time_p2 = <time>
		Change faceoff_time_offset_p2 = <time_offset>
	endif
endscript

script faceoff_deinit 
endscript

script 0x121ac694 
	GetSongTimeMs time_offset = ($faceoff_time_offset_p1)
	begin
	if (<time> < $faceoff_note_time_p1)
		break
	endif
	note_array = $faceoff_note_array_p1
	0x6f9db932 = (<note_array> [$faceoff_note_array_count_p1] [0])
	0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoff_note_array_count_p1] [1])
	if (<time> >= <0x6f9db932>)
		Change structurename = player1_status gem_filler_enabled_time_on = <0x6f9db932>
		Change structurename = player1_status gem_filler_enabled_time_off = <0xa4b0825c>
		Change faceoff_note_time_p1 = <0xa4b0825c>
	endif
	if (<time> >= <0xa4b0825c>)
		Change faceoff_note_array_count_p1 = ($faceoff_note_array_count_p1 + 1)
		if ($faceoff_note_array_count_p1 = $faceoff_note_array_size_p1)
			Change \{faceoff_note_time_p1 = 1000000}
		else
			0x6f9db932 = (<note_array> [$faceoff_note_array_count_p1] [0])
			Change faceoff_note_time_p1 = <0x6f9db932>
		endif
	endif
	repeat
	if ($player1_status.highway_layout = solo_highway)
		return
	endif
	GetSongTimeMs time_offset = ($faceoff_time_offset_p2)
	begin
	if (<time> < $faceoff_note_time_p2)
		break
	endif
	note_array = $faceoff_note_array_p2
	0x6f9db932 = (<note_array> [$faceoff_note_array_count_p2] [0])
	0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoff_note_array_count_p2] [1])
	if (<time> >= <0x6f9db932>)
		Change structurename = player2_status gem_filler_enabled_time_on = <0x6f9db932>
		Change structurename = player2_status gem_filler_enabled_time_off = <0xa4b0825c>
		Change faceoff_note_time_p2 = <0xa4b0825c>
	endif
	if (<time> >= <0xa4b0825c>)
		Change faceoff_note_array_count_p2 = ($faceoff_note_array_count_p2 + 1)
		if ($faceoff_note_array_count_p2 = $faceoff_note_array_size_p2)
			Change \{faceoff_note_time_p2 = 1000000}
		else
			0x6f9db932 = (<note_array> [$faceoff_note_array_count_p2] [0])
			Change faceoff_note_time_p2 = <0x6f9db932>
		endif
	endif
	repeat
endscript

script faceoff_volumes_init 
	if ($boss_battle = 1)
		return
	endif
	printf "Faceoff Volume Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formatText checksumName = note_array '%s_faceoff%p' s = <song_prefix> p = <player_text> AddToStringLookup
	GetArraySize $<note_array>
	if (<array_Size> = 0)
		time = 1000000
	else
		time = ($<note_array> [0] [0])
	endif
	if (<Player> = 1)
		Change faceoffv_note_array_p1 = <note_array>
		Change \{faceoffv_note_array_count_p1 = 0}
		Change faceoffv_note_array_size_p1 = <array_Size>
		Change faceoffv_note_time_p1 = <time>
		Change \{faceoffv_note_on_p1 = 0}
		Change faceoffv_time_offset_p1 = <time_offset>
	else
		Change faceoffv_note_array_p2 = <note_array>
		Change \{faceoffv_note_array_count_p2 = 0}
		Change faceoffv_note_array_size_p2 = <array_Size>
		Change faceoffv_note_time_p2 = <time>
		Change \{faceoffv_note_on_p2 = 0}
		Change faceoffv_time_offset_p2 = <time_offset>
	endif
	if ($is_attract_mode = 1)
		Change \{structurename = player1_status
			guitar_volume = 100}
		Change \{structurename = player2_status
			guitar_volume = 100}
	else
		Change \{structurename = player1_status
			guitar_volume = 100}
		Change \{structurename = player2_status
			guitar_volume = 100}
		Change \{structurename = player1_status
			last_guitar_volume = 100}
		Change \{structurename = player2_status
			last_guitar_volume = 100}
		Change \{structurename = player1_status
			last_faceoff_note = 100}
		Change \{structurename = player2_status
			last_faceoff_note = 100}
	endif
	0x1c07e771
endscript

script faceoff_volumes_deinit 
	Change structurename = <player_status> gem_filler_enabled_time_on = -1
	Change structurename = <player_status> gem_filler_enabled_time_off = -1
	Change \{faceoff_enabled = 0}
endscript

script 0x4e4153f2 
	if ($is_attract_mode = 1)
		return
	endif
	GetSongTimeMs time_offset = ($faceoffv_time_offset_p1)
	0x527ebe59 = 0
	0x7eedd98b = 0
	if (<time> > $faceoffv_note_time_p1)
		note_array = $faceoffv_note_array_p1
		0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p1] [0])
		0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoffv_note_array_count_p1] [1])
		if (<time> >= <0xa4b0825c>)
			Change \{faceoffv_note_on_p1 = 0}
			Change faceoffv_note_array_count_p1 = ($faceoffv_note_array_count_p1 + 1)
			if ($faceoffv_note_array_count_p1 = $faceoffv_note_array_size_p1)
				Change \{faceoffv_note_time_p1 = 1000000}
			else
				0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p1] [0])
				Change faceoffv_note_time_p1 = <0x6f9db932>
			endif
			0x7eedd98b = 1
		elseif (<time> >= <0x6f9db932>)
			Change \{faceoffv_note_on_p1 = 1}
			Change faceoffv_note_time_p1 = <0xa4b0825c>
			0x527ebe59 = 1
		endif
	endif
	GetSongTimeMs time_offset = ($faceoffv_time_offset_p2)
	0x6bf3829c = 0
	0x95da6288 = 0
	if NOT ($player1_status.highway_layout = solo_highway)
		if (<time> > $faceoffv_note_time_p2)
			note_array = $faceoffv_note_array_p2
			0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p2] [0])
			0xa4b0825c = (<0x6f9db932> + <note_array> [$faceoffv_note_array_count_p2] [1])
			if (<time> >= <0xa4b0825c>)
				Change \{faceoffv_note_on_p2 = 0}
				Change faceoffv_note_array_count_p2 = ($faceoffv_note_array_count_p2 + 1)
				if ($faceoffv_note_array_count_p2 = $faceoffv_note_array_size_p2)
					Change \{faceoffv_note_time_p2 = 1000000}
				else
					0x6f9db932 = (<note_array> [$faceoffv_note_array_count_p2] [0])
					Change faceoffv_note_time_p2 = <0x6f9db932>
				endif
				0x95da6288 = 1
			elseif (<time> >= <0x6f9db932>)
				Change \{faceoffv_note_on_p2 = 1}
				Change faceoffv_note_time_p2 = <0xa4b0825c>
				0x6bf3829c = 1
			endif
		endif
	endif
	if (<0x527ebe59> = 1)
		if ($player1_status.last_faceoff_note = 100)
			Change \{structurename = player1_status
				last_faceoff_note = 0}
			Change \{structurename = player1_status
				guitar_volume = 100}
		endif
		if ($faceoffv_note_on_p2 = 0)
			Change structurename = player2_status last_faceoff_note = ($player2_status.guitar_volume)
			Change \{structurename = player2_status
				guitar_volume = 0}
		endif
		0x1c07e771
	endif
	if (<0x95da6288> = 1)
		if ($faceoffv_note_on_p1 = 1)
			Change structurename = player2_status last_faceoff_note = ($player2_status.guitar_volume)
			Change \{structurename = player2_status
				guitar_volume = 0}
		endif
		0x1c07e771
	endif
	if (<0x6bf3829c> = 1)
		if ($player2_status.last_faceoff_note = 100)
			Change \{structurename = player2_status
				last_faceoff_note = 0}
			Change \{structurename = player2_status
				guitar_volume = 100}
		endif
		if ($faceoffv_note_on_p1 = 0)
			Change structurename = player1_status last_faceoff_note = ($player1_status.guitar_volume)
			Change \{structurename = player1_status
				guitar_volume = 0}
		endif
		0x1c07e771
	endif
	if (<0x7eedd98b> = 1)
		if ($faceoffv_note_on_p2 = 1)
			Change structurename = player1_status last_faceoff_note = ($player1_status.guitar_volume)
			Change \{structurename = player1_status
				guitar_volume = 0}
		endif
		0x1c07e771
	endif
endscript

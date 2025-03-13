
script faceoff_init 
	if ($boss_battle = 1)
		return
	endif
	change structurename = <player_status> gem_filler_enabled_time_on = 0
	change structurename = <player_status> gem_filler_enabled_time_off = 0
	change structurename = <player_status> gem_filler_first_note = 0
	printf qs(0x28f9f4f4) d = <time_offset>
	change \{faceoff_enabled = 1}
	if ($is_network_game)
		if NOT ishost
			if (<player_text> = 'p1')
				<player_text> = 'p2'
			else
				<player_text> = 'p1'
			endif
		endif
	endif
	get_notetrack_part_text player_status = <player_status> song_name = <song_name>
	get_song_prefix song = <song_name>
	formattext checksumname = note_array '%s_%jfaceoff%p' s = <song_prefix> j = <part> p = <player_text> addtostringlookup
	getarraysize $<note_array>
	if (<array_size> = 0)
		time = 1000000
	else
		time = ($<note_array> [0] [0])
	endif
	if (<player> = 1)
		change faceoff_note_array_p1 = <note_array>
		change \{faceoff_note_array_count_p1 = 0}
		change faceoff_note_array_size_p1 = <array_size>
		change faceoff_note_time_p1 = <time>
		change faceoff_time_offset_p1 = <time_offset>
	else
		change faceoff_note_array_p2 = <note_array>
		change \{faceoff_note_array_count_p2 = 0}
		change faceoff_note_array_size_p2 = <array_size>
		change faceoff_note_time_p2 = <time>
		change faceoff_time_offset_p2 = <time_offset>
	endif
endscript

script faceoff_deinit 
endscript

script faceoff_volumes_init 
	if ($boss_battle = 1)
		return
	endif
	printf qs(0x2f6515d8) d = <time_offset>
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
	get_notetrack_part_text player_status = <player_status> song_name = <song_name>
	formattext checksumname = note_array '%s_%ifaceoff%p' s = <song_prefix> i = <part> p = <player_text> addtostringlookup
	getarraysize $<note_array>
	if (<array_size> = 0)
		time = 1000000
	else
		time = ($<note_array> [0] [0])
	endif
	if (<player> = 1)
		change faceoffv_note_array_p1 = <note_array>
		change \{faceoffv_note_array_count_p1 = 0}
		change faceoffv_note_array_size_p1 = <array_size>
		change faceoffv_note_time_p1 = <time>
		change \{faceoffv_note_on_p1 = 0}
		change faceoffv_time_offset_p1 = <time_offset>
	else
		change faceoffv_note_array_p2 = <note_array>
		change \{faceoffv_note_array_count_p2 = 0}
		change faceoffv_note_array_size_p2 = <array_size>
		change faceoffv_note_time_p2 = <time>
		change \{faceoffv_note_on_p2 = 0}
		change faceoffv_time_offset_p2 = <time_offset>
	endif
	if ($is_attract_mode = 1)
		change \{structurename = player1_status
			guitar_volume = 100}
		change \{structurename = player2_status
			guitar_volume = 100}
	else
		change \{structurename = player1_status
			guitar_volume = 100}
		change \{structurename = player2_status
			guitar_volume = 100}
		change \{structurename = player1_status
			last_guitar_volume = 100}
		change \{structurename = player2_status
			last_guitar_volume = 100}
		change \{structurename = player1_status
			last_faceoff_note = 100}
		change \{structurename = player2_status
			last_faceoff_note = 100}
	endif
	updateguitarvolume
endscript

script faceoff_volumes_deinit 
	change structurename = <player_status> gem_filler_enabled_time_on = -1
	change structurename = <player_status> gem_filler_enabled_time_off = -1
	change \{faceoff_enabled = 0}
endscript

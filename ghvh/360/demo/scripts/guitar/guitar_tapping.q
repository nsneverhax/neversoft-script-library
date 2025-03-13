
script reset_tapping_array 
	get_song_struct song = <song_name>
	get_notetrack_part_text player_status = <player_status> song_name = <song_name>
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	formattext checksumname = song '%s_%p%d_Tapping' s = <song_prefix> p = <part> d = <difficulty_text_nl> addtostringlookup
	change structurename = <player_status> current_song_tapping_array = <song>
	change structurename = <player_status> current_tapping_creation_entry = 0
	change structurename = <player_status> current_tapping_input_entry = 0
endscript

script show_tapping_text 
	if screenelementexists \{id = tapping_text}
		destroyscreenelement \{id = tapping_text}
	endif
	createscreenelement \{type = textelement
		id = tapping_text
		parent = root_window
		font = fontgrid_text_a11
		just = [
			center
			center
		]
		scale = 1.0
		rgba = [
			255
			255
			255
			255
		]
		pos = (640.0, 265.0)
		z_priority = 10
		text = qs(0xc9373a79)}
	fit_text_in_rectangle id = <id> dims = (150.0, 50.0)
endscript

script remove_tapping_text 
	if screenelementexists \{id = tapping_text}
		destroyscreenelement \{id = tapping_text}
	endif
endscript

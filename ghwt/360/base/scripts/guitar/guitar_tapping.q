
script reset_tapping_array 
	get_song_struct song = <song_name>
	get_notetrack_part_text player_status = <player_status> song_name = <song_name>
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	formatText checksumName = song '%s_%p%d_Tapping' s = <song_prefix> p = <part> d = <difficulty_text_nl> AddToStringLookup
	Change structurename = <player_status> current_song_tapping_array = <song>
	Change structurename = <player_status> current_tapping_creation_entry = 0
	Change structurename = <player_status> current_tapping_input_entry = 0
endscript

script show_tapping_text 
	if ScreenElementExists \{id = tapping_text}
		DestroyScreenElement \{id = tapping_text}
	endif
	CreateScreenElement \{Type = TextElement
		id = tapping_text
		parent = root_window
		font = fontgrid_text_a11
		just = [
			center
			center
		]
		Scale = 1.0
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 265.0)
		z_priority = 10
		text = qs(0xc9373a79)}
	fit_text_in_rectangle id = <id> dims = (150.0, 50.0)
endscript

script remove_tapping_text 
	if ScreenElementExists \{id = tapping_text}
		DestroyScreenElement \{id = tapping_text}
	endif
endscript

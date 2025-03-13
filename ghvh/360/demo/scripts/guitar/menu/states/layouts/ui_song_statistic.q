
script ui_create_song_statistic 
	switch ($current_num_players)
		case 1
		pos = [(640.0, 360.0)]
		case 2
		pos = [(440.0, 360.0) , (840.0, 360.0)]
		case 3
		pos = [(640.0, 260.0) , (440.0, 460.0) , (840.0, 460.0)]
		case 4
		pos = [(640.0, 200.0) , (380.0, 500.0) , (640.0, 500.0) , (900.0, 500.0)]
	endswitch
	array = []
	addarrayelement array = <array> element = ($player1_status.difficulty)
	addarrayelement array = <array> element = ($player2_status.difficulty)
	addarrayelement array = <array> element = ($player3_status.difficulty)
	addarrayelement array = <array> element = ($player4_status.difficulty)
	createscreenelement \{type = containerelement
		parent = root_window
		id = song_statistic_container}
	i = 1
	begin
	getplayerinfo <i> part
	getplayerinfo <i> best_run
	getplayerinfo <i> score
	getplayerinfo <i> max_notes
	getplayerinfo <i> notes_hit
	getplayerinfo <i> stars
	get_difficulty_text_nl difficulty = (<array> [(<i> - 1)])
	if (<max_notes> = 0)
		max_notes = 1
	endif
	if (<stars> < 3)
		stars = 3
	endif
	formattext textname = player_text qs(0x5c5cedaa) p = <i>
	formattext textname = score_text qs(0x4d4555da) s = <score> decimalplaces = 0 usecommas
	formattext textname = difficulty_text qs(0x48c6d14c) d = <difficulty_text_nl>
	formattext textname = percent_text qs(0xc91ec3f1) p = (<notes_hit> / (<max_notes> * 1.0)) decimalplaces = 0
	formattext textname = streak_text qs(0x883fc856) n = <best_run> decimalplaces = 0 usecommas
	switch (<part>)
		case guitar
		icon_texture = guitar_stat
		case bass
		icon_texture = bass_stat
		case drum
		icon_texture = drum_stat
		case vocals
		icon_texture = vocal_stat
	endswitch
	createscreenelement {
		parent = song_statistic_container
		type = descinterface
		desc = 'song_statistic'
		pos = (<pos> [(<i> - 1)])
		autosizedims = true
		just = [center center]
		player_text = <player_text>
		score_text = <score_text>
		difficulty_text = <difficulty_text>
		percent_text = <percent_text>
		streak_text = <streak_text>
		icon_textur = <icon_texture>
	}
	stars = 3
	if <id> :desc_resolvealias name = alias_stars
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			j = 0
			begin
			<current> = (<children> [<j>])
			alpha = 0.5
			if (<j> < <stars>)
				alpha = 1.0
			endif
			<current> :se_setprops {
				alpha = <alpha>
			}
			j = (<j> + 1)
			repeat <array_size>
		endif
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
endscript

script ui_destroy_song_statistic 
	song_statistic_container :die
endscript

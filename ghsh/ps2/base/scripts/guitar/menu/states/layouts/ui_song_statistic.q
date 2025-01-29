
script ui_create_song_statistic 
	switch ($current_num_players)
		case 1
		Pos = [(640.0, 360.0)]
		case 2
		Pos = [(440.0, 360.0) , (840.0, 360.0)]
		case 3
		Pos = [(640.0, 260.0) , (440.0, 460.0) , (840.0, 460.0)]
		case 4
		Pos = [(640.0, 200.0) , (380.0, 500.0) , (640.0, 500.0) , (900.0, 500.0)]
	endswitch
	array = []
	AddArrayElement array = <array> element = ($player1_status.difficulty)
	AddArrayElement array = <array> element = ($player2_status.difficulty)
	AddArrayElement array = <array> element = ($player3_status.difficulty)
	AddArrayElement array = <array> element = ($player4_status.difficulty)
	CreateScreenElement \{Type = ContainerElement
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
	formatText TextName = player_text qs(0x5c5cedaa) p = <i>
	formatText TextName = score_text qs(0x73307931) s = <score> DecimalPlaces = 0 usecommas
	formatText TextName = difficulty_text qs(0x76b3fda7) d = <difficulty_text_nl>
	formatText TextName = percent_text qs(0xc91ec3f1) p = (<notes_hit> / (<max_notes> * 1.0)) DecimalPlaces = 0
	formatText TextName = streak_text qs(0x883fc856) n = <best_run> DecimalPlaces = 0 usecommas
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
	CreateScreenElement {
		parent = song_statistic_container
		Type = descinterface
		desc = 'song_statistic'
		Pos = (<Pos> [(<i> - 1)])
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
	if <id> :desc_resolvealias Name = alias_stars
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
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
			repeat <array_Size>
		endif
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
endscript

script ui_destroy_song_statistic 
	song_statistic_container :Die
endscript

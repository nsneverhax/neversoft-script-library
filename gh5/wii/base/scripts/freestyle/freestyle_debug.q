freestyle_debug_force_ai_tracks = 0
freestyle_debug_force_song_progression = -1

script freestyle_debug_reload_samples 
	if freestylegameisstarted
		freestyle_unload_sample_bank_paks
		freestyle_load_sample_bank_paks
		freestylereloadsamples
		printf \{'Done reloading samples!'}
	endif
endscript

script freestyle_debug_auto_play_highways 
	Player = 0
	begin
	freestyle_get_player_param Player = <Player> param = player_type
	if (<player_type> = human)
		if (<enable> = true)
			freestyle_set_player_param Player = <Player> param = input_source value = auto_play
			freestyle_set_player_param Player = <Player> param = auto_play_enabled value = true
		else
			freestyle_set_player_param Player = <Player> param = input_source value = controller
			freestyle_set_player_param Player = <Player> param = auto_play_enabled value = FALSE
		endif
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	reloadinstrumentconfigurations
endscript

script freestyle_debug_show_song_info 
	if ScreenElementExists \{id = debug_song_info}
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = debug_song_info
		parent = root_window
		Pos = (100.0, 200.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		z_priority = 666}
	CreateScreenElement \{Type = TextBlockElement
		parent = debug_song_info
		id = debug_song_info_progression_num
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		dims = (640.0, 100.0)
		font = fontgrid_title_gh3
		rgba = [
			255
			0
			0
			255
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextBlockElement
		parent = debug_song_info
		id = debug_song_info_section_num
		just = [
			left
			top
		]
		Pos = (0.0, 40.0)
		dims = (640.0, 100.0)
		font = fontgrid_title_gh3
		rgba = [
			255
			0
			0
			255
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextBlockElement
		parent = debug_song_info
		id = debug_song_info_card
		just = [
			left
			top
		]
		Pos = (0.0, 80.0)
		dims = (640.0, 100.0)
		font = fontgrid_title_gh3
		rgba = [
			255
			0
			0
			255
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	spawnscript \{freestyle_debug_show_song_info_update}
endscript

script freestyle_debug_hide_song_info 
	if ScreenElementExists \{id = debug_song_info}
		KillSpawnedScript \{Name = freestyle_debug_show_song_info_update}
		DestroyScreenElement \{id = debug_song_info}
	endif
endscript

script freestyle_debug_show_song_info_update 
	setscriptcannotpause
	begin
	if freestylegameisstarted
		debug_song_info :se_setprops \{unhide}
		formatText TextName = progression_num_text qs(0xd155db8c) a = ($freestyle_chosen_progression)
		debug_song_info_progression_num :se_setprops text = <progression_num_text>
		formatText TextName = section_num_text qs(0xc5818c26) a = ($freestyle_current_song_section)
		debug_song_info_section_num :se_setprops text = <section_num_text>
		card_name = qs(0x03ac90f0)
		if ($freestyle_current_song_section >= 0)
			if freestyle_find_card_for_song_section section = ($freestyle_current_song_section)
				if StructureContains structure = ($freestyle_card_set.<card>) debug_text
					<card_name> = ($freestyle_card_set.<card>.debug_text)
				endif
			endif
		endif
		formatText TextName = card_text qs(0xaee4839f) a = <card_name>
		debug_song_info_card :se_setprops text = <card_text>
	else
		debug_song_info :se_setprops \{Hide}
	endif
	Wait \{0.25
		Seconds}
	repeat
endscript

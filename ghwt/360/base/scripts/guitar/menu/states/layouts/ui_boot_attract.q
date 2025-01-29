
script ui_create_boot_attract 
	SpawnScriptNow \{ui_boot_attract_spawned}
endscript

script ui_destroy_boot_attract 
	PauseGame
	KillSpawnedScript \{Name = ui_boot_attract_spawned}
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	SpawnScriptNow \{kill_gem_scroller}
	destroy_magazine_viewport
	setup_bg_viewport
	band_builder_clear_random_appearances
	reset_character_ids
	UnPauseGame
	SpawnScriptNow \{attract_mode_ends_sound_script}
	SpawnScriptLater \{undo_attract_bots}
	Change \{is_attract_mode = 0}
	SpawnScriptNow \{menu_music_on}
endscript

script undo_attract_bots 
	Wait \{2
		gameframes}
	printf \{'undo_attract_bots'}
	Change \{structurename = player1_status
		bot_play = 0}
	Change \{structurename = player2_status
		bot_play = 0}
	Change \{structurename = player3_status
		bot_play = 0}
	Change \{structurename = player4_status
		bot_play = 0}
endscript

script ui_boot_attract_spawned 
	Change \{is_attract_mode = 1}
	create_loading_screen
	SpawnScriptNow \{attract_mode_start_sound_script}
	GetArraySize \{$Attract_Mode_Info}
	if (<array_Size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			GetRandomValue Name = attract_mode_index integer a = 0 b = (<array_Size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			GetRandomValue Name = attract_mode_index integer a = 0 b = (<array_Size> - 1)
		endif
		Change last_attract_mode = <attract_mode_index>
	endif
	AddParams ($Attract_Mode_Info [<attract_mode_index>])
	Change \{structurename = player1_status
		bot_play = 1}
	Change \{structurename = player2_status
		bot_play = 1}
	Change \{structurename = player3_status
		bot_play = 1}
	Change \{structurename = player4_status
		bot_play = 1}
	Change current_level = <level>
	Change game_mode = <mode>
	Change \{current_num_players = 4}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = bass}
	Change \{structurename = player3_status
		part = drum}
	Change \{structurename = player4_status
		part = vocals}
	Change structurename = player1_status character_id = <guitar_character_id>
	Change structurename = player2_status character_id = <bass_character_id>
	Change structurename = player3_status character_id = <drum_character_id>
	Change structurename = player4_status character_id = <vocals_character_id>
	p1_difficulty = expert
	p2_difficulty = expert
	destroy_band
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	StopRendering
	destroy_loading_screen
	get_handlers_for_all_buttons \{event_script = ui_boot_attract_wait_for_input}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = current_menu
		Pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		event_handlers = <event_handlers>
	}
	CreateScreenElement \{Type = TextElement
		text = qs(0x71da7fc7)
		Pos = (640.0, 637.0)
		parent = current_menu
		rgba = [
			220
			220
			220
			255
		]
		font = fontgrid_title_a1
		just = [
			center
			bottom
		]
		Scale = 0.9
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			110
			20
			80
			250
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		texture = logo_gh4_lor_256
		dims = (225.0, 225.0)
		Pos = (640.0, 490.0)
		just = [
			center
			center
		]}
	LaunchEvent \{Type = focus
		target = current_menu}
	fadetoblack \{OFF
		alpha = 1.0
		time = 0.0
		z_priority = -100
		no_wait}
endscript

script ui_boot_attract_wait_for_input 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	wait_for_safe_shutdown
	ui_event \{event = menu_back}
endscript
Attract_Mode_Info = [
	{
		level = load_z_harbor
		song = livingonaprayer
		mode = p4_quickplay
		guitar_character_id = GUITARIST
		bass_character_id = BASSIST
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_hob
		song = eyeofthetiger
		mode = p4_quickplay
		guitar_character_id = Judy
		bass_character_id = Midori
		drum_character_id = Casey
		vocals_character_id = GUITARIST
	}
	{
		level = load_z_hob
		song = spiderwebs
		mode = p4_quickplay
		guitar_character_id = GUITARIST
		bass_character_id = clive
		drum_character_id = Johnny
		vocals_character_id = Casey
	}
	{
		level = load_z_castle
		song = overkill
		mode = p4_quickplay
		guitar_character_id = Lars
		bass_character_id = GUITARIST
		drum_character_id = drummer
		vocals_character_id = Axel
	}
	{
		level = load_z_bayou
		song = americanwoman
		mode = p4_quickplay
		guitar_character_id = eddie
		bass_character_id = Casey
		drum_character_id = BASSIST
		vocals_character_id = clive
	}
	{
		level = load_z_goth
		song = mountainsong
		mode = p4_quickplay
		guitar_character_id = pandora
		bass_character_id = Izzy
		drum_character_id = Midori
		vocals_character_id = Johnny
	}
	{
		level = load_z_castle
		song = hotforteacher
		mode = p4_quickplay
		guitar_character_id = GUITARIST
		bass_character_id = BASSIST
		drum_character_id = drummer
		vocals_character_id = singer
	}
	{
		level = load_z_bayou
		song = loveremovalmachine
		mode = p4_quickplay
		guitar_character_id = randomcharacter
		bass_character_id = randomcharacter
		drum_character_id = randomcharacter
		vocals_character_id = randomcharacter
	}
	{
		level = load_z_harbor
		song = everlong
		mode = p4_quickplay
		guitar_character_id = randomcharacter
		bass_character_id = randomcharacter
		drum_character_id = randomcharacter
		vocals_character_id = randomcharacter
	}
	{
		level = load_z_bayou
		song = kickoutthejams
		mode = p4_quickplay
		guitar_character_id = randomcharacter
		bass_character_id = randomcharacter
		drum_character_id = randomcharacter
		vocals_character_id = randomcharacter
	}
]
last_attract_mode = -1
is_attract_mode = 0

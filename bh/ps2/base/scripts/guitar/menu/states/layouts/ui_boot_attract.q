
script ui_create_boot_attract 
	0x622f875f
	SpawnScriptNow \{0x29e421d6}
endscript

script ui_destroy_boot_attract 
	PauseGh3Sounds
	PauseGame
	KillSpawnedScript \{Name = 0x29e421d6}
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	SpawnScriptNow \{kill_gem_scroller}
	destroy_magazine_viewport
	setup_bg_viewport
	band_builder_clear_random_appearances
	reset_character_ids
	UnPauseGame
	UnPauseGh3Sounds
	SpawnScriptNow \{attract_mode_ends_sound_script}
	SpawnScriptLater \{undo_attract_bots}
	Change \{is_attract_mode = 0}
	popvideovenues
	SpawnScriptNow \{menu_music_on}
endscript

script undo_attract_bots 
	Wait \{2
		gameframes}

	Change \{structurename = player1_status
		bot_play = 0}
	Change \{structurename = player2_status
		bot_play = 0}
	Change \{structurename = player3_status
		bot_play = 0}
	Change \{structurename = player4_status
		bot_play = 0}
endscript

script 0x29e421d6 
	Change \{is_attract_mode = 1}
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
	Change \{current_transition = fastintro}
	Change current_song = <song>
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
	destroy_loading_screen
	get_handlers_for_all_buttons \{event_script = ui_boot_attract_wait_for_input}
	CreateScreenElement {
		Type = ContainerElement
		dims = (1280.0, 720.0)
		just = [0.0 0.0]
		pos_anchor = [-1.0 -1.0]
		Pos = (640.0, 360.0)
		z_priority = 0.0
		parent = root_window
		id = current_menu
		event_handlers = <event_handlers>
	}
	CreateScreenElement \{Type = TextElement
		text = qs(0xea5afc2b)
		Pos = (640.0, 637.0)
		parent = current_menu
		rgba = [
			220
			220
			220
			255
		]
		font = fontgrid_text_a1
		just = [
			center
			bottom
		]
		Scale = 0.6
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement \{texture = logo_gh5_256
		Type = SpriteElement
		alpha = 0.75
		dims = (256.0, 256.0)
		just = [
			0.0
			0.0
		]
		pos_anchor = [
			-1.0
			-1.0
		]
		Pos = (1023.4459, 183.96547)
		parent = current_menu}
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
	PauseGh3Sounds
	0xe9384b7a \{full}
	ui_event \{event = menu_back}
endscript
Attract_Mode_Info = [
	{
		level = 0x39914645
		song = 0x3ede7cc8
		mode = p4_quickplay
		guitar_character_id = randomcharacter
		bass_character_id = randomcharacter
		drum_character_id = randomcharacter
		vocals_character_id = randomcharacter
	}
	{
		level = load_z_montreux
		song = 0xcadbbe3d
		mode = p4_quickplay
		guitar_character_id = randomcharacter
		bass_character_id = randomcharacter
		drum_character_id = randomcharacter
		vocals_character_id = randomcharacter
	}
	{
		level = load_z_cabo
		song = 0x5749b512
		mode = p4_quickplay
		guitar_character_id = randomcharacter
		bass_character_id = randomcharacter
		drum_character_id = randomcharacter
		vocals_character_id = randomcharacter
	}
	{
		level = load_z_centralpark
		song = 0xb3b66b06
		mode = p4_quickplay
		guitar_character_id = metalhead
		bass_character_id = 0x6eb102a0
		drum_character_id = randomcharacter
		vocals_character_id = 0xa2de9ea8
	}
]
last_attract_mode = -1
is_attract_mode = 0

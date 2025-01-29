
script ui_create_boot_attract 
	0x622f875f
	SpawnScriptNow \{ui_boot_attract_spawned}
endscript

script ui_destroy_boot_attract 
	SpawnScriptNow \{create_loading_screen}
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
	songstop
	StopAllSounds
	UnPauseGame
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
	assign_rockers
	p1_difficulty = easy
	p2_difficulty = easy
	destroy_band
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
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
	CreateScreenElement {
		Type = TextElement
		text = qs(0xea5afc2b)
		Pos = (640.0, 647.0)
		parent = current_menu
		rgba = (($g_menu_colors).menu_white)
		font = fontgrid_bordello
		just = [center bottom]
		Scale = 0.6
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)}
	CreateScreenElement \{Type = SpriteElement
		parent = current_menu
		texture = gh_spirit_logo
		dims = (512.0, 256.0)
		Pos = (640.0, 470.0)
		Scale = 1.0
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
	0xf7e0f992 \{Wait}
	ui_event \{event = menu_back}
endscript

script assign_rockers 
	current_rocker = [matty shirley marcus riki]
	GetArraySize <current_rocker>
	i = 0
	begin
	begin
	valid_name = true
	rand_name = Random (@ Axel @ Casey @ Izzy @ Judy @ Johnny @ Lars @ Midori @ clive @ pandora @ eddie @ drummer @ BASSIST @ GUITARIST @ singer )
	rand_name_singer = Random (@ Axel @ Izzy @ Johnny @ Lars @ clive @ eddie @ drummer @ GUITARIST @ singer )
	j = 0
	begin
	if (<i> = 3)
		if ((<current_rocker> [<j>]) = <rand_name_singer>)
			<valid_name> = FALSE
		endif
	else
		if ((<current_rocker> [<j>]) = <rand_name>)
			<valid_name> = FALSE
		endif
	endif
	if (<i> = 0)
		break
	endif
	<j> = (<j> + 1)
	repeat <i>
	if (<valid_name> = true)
		if (<i> = 3)
			SetArrayElement ArrayName = current_rocker index = <i> NewValue = <rand_name_singer>
		else
			SetArrayElement ArrayName = current_rocker index = <i> NewValue = <rand_name>
		endif
		break
	endif
	repeat
	<i> = (<i> + 1)
	repeat <array_Size>
	Change structurename = player1_status character_id = (<current_rocker> [0])
	Change structurename = player2_status character_id = (<current_rocker> [1])
	Change structurename = player3_status character_id = (<current_rocker> [2])
	Change structurename = player4_status character_id = (<current_rocker> [3])
endscript
Attract_Mode_Info = [
	{
		level = load_z_amazon
		song = rockandrollallnite
		mode = p4_quickplay
	}
	{
		level = load_z_canyon
		song = smokeonthewater
		mode = p4_quickplay
	}
	{
		level = load_z_icecap
		song = thembones
		mode = p4_quickplay
	}
	{
		level = load_z_london
		song = trippinonahole
		mode = p4_quickplay
	}
	{
		level = load_z_sphinx
		song = monkeywrench
		mode = p4_quickplay
	}
	{
		level = load_z_greatwall
		song = barkatthemoon
		mode = p4_quickplay
	}
]
last_attract_mode = -1
is_attract_mode = 0

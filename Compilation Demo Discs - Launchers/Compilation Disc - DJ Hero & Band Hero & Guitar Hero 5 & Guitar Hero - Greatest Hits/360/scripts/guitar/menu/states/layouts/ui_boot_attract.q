
script ui_create_boot_attract 
	spawnscriptnow \{ui_boot_attract_spawned}
endscript

script ui_destroy_boot_attract 
	PauseGame
	KillSpawnedScript \{name = ui_boot_attract_spawned}
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	spawnscriptnow \{kill_gem_scroller}
	destroy_magazine_viewport
	setup_bg_viewport
	band_builder_clear_random_appearances
	reset_character_ids
	UnPauseGame
	spawnscriptnow \{Attract_Mode_Ends_Sound_Script}
	SpawnScriptLater \{Undo_attract_bots}
	change \{is_attract_mode = 0}
	spawnscriptnow \{menu_music_on}
endscript

script Undo_attract_bots 
	Wait \{2
		gameframes}
	printf \{'undo_attract_bots'}
	change \{structurename = player1_status
		bot_play = 0}
	change \{structurename = player2_status
		bot_play = 0}
	change \{structurename = player3_status
		bot_play = 0}
	change \{structurename = player4_status
		bot_play = 0}
endscript

script ui_boot_attract_spawned 
	change \{is_attract_mode = 1}
	create_loading_screen
	spawnscriptnow \{Attract_Mode_Start_Sound_Script}
	GetArraySize \{$Attract_Mode_Info}
	if (<array_size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			GetRandomValue name = attract_mode_index Integer a = 0 b = (<array_size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			GetRandomValue name = attract_mode_index Integer a = 0 b = (<array_size> - 1)
		endif
		change last_attract_mode = <attract_mode_index>
	endif
	AddParams ($Attract_Mode_Info [<attract_mode_index>])
	change \{structurename = player1_status
		bot_play = 1}
	change \{structurename = player2_status
		bot_play = 1}
	change \{structurename = player3_status
		bot_play = 1}
	change \{structurename = player4_status
		bot_play = 1}
	change current_level = <level>
	change current_song = <song>
	change game_mode = <mode>
	change \{current_num_players = 4}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = Bass}
	change \{structurename = player3_status
		part = drum}
	change \{structurename = player4_status
		part = Vocals}
	assign_rockers
	p1_difficulty = easy
	p2_difficulty = easy
	destroy_band
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> StartTime = 0 device_num = ($player1_status.controller)
	stoprendering
	destroy_loading_screen
	get_handlers_for_all_buttons \{event_script = ui_boot_attract_wait_for_input}
	GetTerritory
	if (<territory> = territory_europe)
		tex = GH_Spirit_Logo_EU
	else
		tex = gh_Spirit_logo
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		event_handlers = <event_handlers>
	}
	CreateScreenElement {
		type = TextElement
		text = qs("PRESS ANY BUTTON TO ROCK!")
		pos = (640.0, 647.0)
		parent = current_menu
		rgba = (($g_menu_colors).menu_white)
		font = fontgrid_bordello
		just = [center bottom]
		scale = 0.45000002
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)}
	CreateScreenElement {
		type = SpriteElement
		parent = current_menu
		texture = <tex>
		dims = (512.0, 256.0)
		pos = (640.0, 470.0)
		scale = 1.0
		just = [center center]
	}
	LaunchEvent \{type = focus
		target = current_menu}
	fadetoblack \{off
		alpha = 1.0
		time = 0.0
		z_priority = -100
		no_wait}
endscript

script ui_boot_attract_wait_for_input 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	wait_for_safe_shutdown
	ui_event \{event = menu_back}
endscript

script assign_rockers 
	current_rocker = [Matty Shirley Marcus Riki]
	GetArraySize <current_rocker>
	i = 0
	begin
	begin
	valid_name = true
	rand_name = Random (@ axel @ Casey @ Izzy @ judy @ Johnny @ Lars @ Midori @ Clive @ Pandora @ Eddie @ Drummer @ bassist @ Guitarist @ singer )
	rand_name_singer = Random (@ axel @ Izzy @ Johnny @ Lars @ Clive @ Eddie @ Drummer @ Guitarist @ singer )
	j = 0
	begin
	if (<i> = 3)
		if ((<current_rocker> [<j>]) = <rand_name_singer>)
			<valid_name> = false
		endif
	else
		if ((<current_rocker> [<j>]) = <rand_name>)
			<valid_name> = false
		endif
	endif
	if (<i> = 0)
		break
	endif
	<j> = (<j> + 1)
	repeat <i>
	if (<valid_name> = true)
		if (<i> = 3)
			SetArrayElement ArrayName = current_rocker index = <i> newvalue = <rand_name_singer>
		else
			SetArrayElement ArrayName = current_rocker index = <i> newvalue = <rand_name>
		endif
		break
	endif
	repeat
	<i> = (<i> + 1)
	repeat <array_size>
	change structurename = player1_status character_id = (<current_rocker> [0])
	change structurename = player2_status character_id = (<current_rocker> [1])
	change structurename = player3_status character_id = (<current_rocker> [2])
	change structurename = player4_status character_id = (<current_rocker> [3])
endscript
Attract_Mode_Info = [
	{
		level = load_z_amazon
		song = RockAndRollAllNite
		mode = p4_quickplay
	}
	{
		level = load_z_Canyon
		song = SmokeOnTheWater
		mode = p4_quickplay
	}
	{
		level = load_z_Icecap
		song = ThemBones
		mode = p4_quickplay
	}
	{
		level = load_z_London
		song = TrippinOnAHole
		mode = p4_quickplay
	}
	{
		level = load_z_Sphinx
		song = MonkeyWrench
		mode = p4_quickplay
	}
	{
		level = load_z_Greatwall
		song = BarkAtTheMoon
		mode = p4_quickplay
	}
]
last_attract_mode = -1
is_attract_mode = 0

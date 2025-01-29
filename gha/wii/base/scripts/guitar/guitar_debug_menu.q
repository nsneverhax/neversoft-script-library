menu_pos = (675.0, 100.0)

script create_debug_backdrop 
	destroy_debug_backdrop
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = debug_backdrop
		Pos = (640.0, 0.0)
		dims = (640.0, 720.0)
		just = [
			left
			top
		]
		rgba = [
			0
			0
			0
			255
		]
		z_priority = 1}
endscript

script destroy_debug_backdrop 
	destroy_menu \{menu_id = debug_backdrop}
endscript

script create_debugging_menu 
	safe_create_gh3_pause_menu
	create_generic_backdrop
	CreateScreenElement \{Type = VScrollingMenu
		parent = pause_menu
		id = debug_scrolling_menu
		just = [
			left
			top
		]
		dims = (400.0, 480.0)
		Pos = $menu_pos}
	CreateScreenElement \{Type = VMenu
		parent = debug_scrolling_menu
		id = debug_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				back_to_retail_ui_flow
			}
		]}
	disable_pause
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = toggle_botp1_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P1'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp1
			}
		]}
	toggle_botp1_setprop
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = toggle_botp2_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P2'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp2
			}
		]}
	toggle_botp2_setprop
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Advanced Bot Options'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x2e8a0c2b
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = toggle_fsfx_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Full Screen FX'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_fsfx
			}
		]}
	toggle_fsfx_setprop
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = toggle_lightshow_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Light Show'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_lightshow
			}
		]}
	toggle_lightshow_setprop
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = 0x338624a9
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle 30fps Animations'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x556bfd95
			}
		]}
	0x7bceb762
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Unlock All'
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				playday_unlockall
			}
		]}
	if NOT isngc
		CreateScreenElement \{Type = TextElement
			parent = debug_vmenu
			id = 0x4b78eec8
			font = text_a1
			Scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			just = [
				left
				top
			]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100.0
			event_handlers = [
				{
					focus
					menu_focus
				}
				{
					unfocus
					menu_unfocus
				}
				{
					pad_choose
					toggle_aspect_ratio
				}
			]}
		GetGlobalTags \{user_options}
		if (<ps2_widescreen> = 0)
			SetScreenElementProps \{id = 0x4b78eec8
				text = 'Widescreen: Off'}
		else
			SetScreenElementProps \{id = 0x4b78eec8
				text = 'Widescreen: On'}
		endif
		CreateScreenElement \{Type = TextElement
			parent = debug_vmenu
			id = 0x2c140bc5
			font = text_a1
			Scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			just = [
				left
				top
			]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			z_priority = 100.0
			event_handlers = [
				{
					focus
					menu_focus
				}
				{
					unfocus
					menu_unfocus
				}
				{
					pad_choose
					toggle_progressive_scan
				}
			]}
		if ($ps2_progressivescan = 0)
			SetScreenElementProps \{id = 0x2c140bc5
				text = 'Progressive Scan: Off'}
		else
			SetScreenElementProps \{id = 0x2c140bc5
				text = 'Progressive Scan: On'}
		endif
	endif
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Repeat Last Song'
		z_priority = 100.0
		just = [
			left
			top
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				select_start_song
				params = {
					uselaststarttime
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = toggle_playermode_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play Song: 1p_quickplay'
		z_priority = 100.0
		just = [
			left
			top
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_left
				toggle_playermode_left
			}
			{
				pad_right
				toggle_playermode_right
			}
			{
				pad_choose
				select_playermode
			}
		]}
	toggle_playermode_setprop
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Settings'
		z_priority = 100.0
		just = [
			left
			top
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_settings_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		id = 0x7471cfe8
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		just = [
			left
			top
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_on_audible_hitnote
			}
		]}
	if ($Debug_Audible_HitNote = 1)
		SetScreenElementProps \{id = 0x7471cfe8
			text = 'Debug_Audible_HitNote: ON'}
	else
		SetScreenElementProps \{id = 0x7471cfe8
			text = 'Debug_Audible_HitNote: OFF'}
	endif
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Character Select'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_character_viewer_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip Into Song'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipintosong_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Save Replay Buffer'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				save_replay
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Load Replay'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_replay_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play Credits'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_playcredits
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Difficulty Analyzer'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_difficulty_analyzer
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Changelist Number'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				debug_toggle_changelist
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'UI Physics Test'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_ui_physics_test
				params = {
					debug
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Battle mode menu'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xe54ae97c
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Photobot Test'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_photobot_debug_menu
			}
		]}
	LaunchEvent \{Type = focus
		target = debug_vmenu}
endscript

script destroy_debugging_menu 
	if ScreenElementExists \{id = debug_scrolling_menu}
		DestroyScreenElement \{id = debug_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script back_to_debug_menu 
	destroy_replay_menu
	destroy_songversion_menu
	destroy_settings_menu
	destroy_character_viewer_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_difficulty_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	destroy_song_menu
	0xc1f95008
	0x7a1b28ba
	destroy_photobot_debug_menu
	create_debugging_menu
endscript

script destroy_all_debug_menus 
	destroy_replay_menu
	destroy_songversion_menu
	destroy_settings_menu
	destroy_character_viewer_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_difficulty_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	0xc1f95008
	destroy_photobot_debug_menu
	destroy_debugging_menu
endscript
debug_playcredits_active = 0

script debug_playcredits 
	menu_music_off \{setflag = 1}
	kill_gem_scroller
	destroy_debugging_menu
	reset_score \{player_status = player1_status}
	Change \{end_credits = 1}
	Change \{current_difficulty = expert}
	Change \{debug_playcredits_active = 1}
	Progression_EndCredits
endscript

script debug_difficulty_analyzer 
	ui_menu_select_sfx
	destroy_difficulty_menu
	destroy_debugging_menu
	create_debug_backdrop
	create_generic_backdrop
	x_pos = 500
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = song_scrolling_menu
		just = [left top]
		dims = (400.0, 500.0)
		Pos = ($menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	CreateScreenElement \{Type = VMenu
		parent = song_scrolling_menu
		id = song_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				difficulty_analyzer_back
			}
		]}
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum index = <array_entry>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	CreateScreenElement {
		Type = TextElement
		parent = song_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <song_title>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{focus wait_for_diff_analyzer params = {<...>}}
			{pad_choose KillSpawnedScript params = {Name = wait_for_diff_analyzer_spawned}}
			{pad_choose create_difficulty_analyzer_difficulty_menu params = {difficulty = all song_name = <song_checksum>}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	CreateScreenElement {
		Type = TextElement
		parent = song_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = 'OUTPUT ALL SCORE DATA'
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{focus wait_for_diff_analyzer params = {<...>}}
			{focus KillSpawnedScript params = {Name = wait_for_diff_analyzer_spawned}}
			{pad_choose create_difficulty_analyzer_difficulty_menu params = {difficulty = all song_name = debug_output}}
		]
	}
	LaunchEvent \{Type = focus
		target = song_vmenu}
endscript

script difficulty_analyzer_back 
	KillSpawnedScript \{Name = wait_for_diff_analyzer_spawned}
	destroy_debug_backdrop
	destroy_difficulty_analyzer
	generic_menu_pad_back \{callback = back_to_debug_menu}
endscript

script destroy_difficulty_analyzer_menu 
	if ScreenElementExists \{id = song_scrolling_menu}
		DestroyScreenElement \{id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
	destroy_debug_backdrop
endscript

script wait_for_diff_analyzer 
	KillSpawnedScript \{Name = wait_for_diff_analyzer_spawned}
	SpawnScriptNow wait_for_diff_analyzer_spawned params = {<...>}
endscript

script wait_for_diff_analyzer_spawned 
	Wait \{0.5
		Seconds}
	difficulty_analyzer_show difficulty = all song_name = <song_checksum>
endscript

script create_difficulty_analyzer_difficulty_menu 
	destroy_difficulty_analyzer_menu
	destroy_difficulty_menu
	create_debug_backdrop
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = difficulty_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = difficulty_menu
		id = difficulty_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = debug_difficulty_analyzer
				}
			}
		]}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	<events> = [
		{focus menu_focus}
		{unfocus menu_unfocus}
		{focus difficulty_analyzer_show params = {difficulty = ($difficulty_list [<array_entry>]) song_name = <song_name>}}
	]
	if (<song_name> = debug_output)
		<events> = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose output_diff_scores params = {($difficulty_list [<array_entry>])}}
		]
	endif
	CreateScreenElement {
		Type = TextElement
		parent = difficulty_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <difficulty_text>
		just = [left top]
		z_priority = 100.0
		event_handlers = <events>
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	if (<song_name> = debug_output)
		<events> = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose output_diff_scores params = {all}}
		]
		CreateScreenElement {
			Type = TextElement
			parent = difficulty_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'ALL'
			just = [left top]
			z_priority = 100.0
			event_handlers = <events>
		}
	endif
	LaunchEvent \{Type = focus
		target = difficulty_vmenu}
endscript

script 0x2e8a0c2b 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = 0xf595fe55
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = 0xf595fe55
		id = 0xa5b4d07f
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = 0xa5b4d07f
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Options for Player 1'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xcd8e01d3
				params = {
					player_status = player1_status
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = 0xa5b4d07f
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Options for Player 2'
		just = [
			left
			top
		]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xcd8e01d3
				params = {
					player_status = player2_status
				}
			}
		]}
	LaunchEvent \{Type = focus
		target = 0xa5b4d07f}
endscript
0x5489f91b = 0

script 0xcd8e01d3 \{player_status = player1_status
		lock = 0
		0x7c92da22 = 0}
	ui_menu_select_sfx
	<0x132b2bce> = 5
	<0xf127c7e4> = -5
	<0x5c67de9d> = 1
	<0x873e1ba7> = -1
	0x7a1b28ba
	menu_type = VScrollingMenu
	if (($0x5489f91b) = 1)
		<menu_type> = VMenu
	endif
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = 0x2af17d23
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (300.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = 0x2af17d23
		id = 0x6c69a329
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = 0xef2cca29
				}
			}
		]}
	mode = 'Basic'
	if ($<player_status>.0x0e6b667f = 1)
		mode = 'Accuracy'
	elseif ($<player_status>.0x0e6b667f = 2)
		mode = 'Ping-Pong'
	endif
	formatText TextName = mode_text 'Player %p Mode: %m' p = ($<player_status>.Player) m = <mode>
	CreateScreenElement {
		Type = TextElement
		parent = 0x6c69a329
		font = text_a1
		id = 0x8dee5420
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <mode_text>
		just = [left top]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xf5b05b03 params = {player_status = <player_status>}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		parent = 0x6c69a329
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = 'Toggle Bot: '
		id = 0x06abc944
		just = [left top]
		z_priority = 100.0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0x0a047643 params = {player_status = <player_status>}}
		]
	}
	0x3d6daad9 player_status = <player_status>
	if (($<player_status>.0x0e6b667f) > 0)
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'Prevent Bot Death:'
			id = 0xc1d77714
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0xed2a6b65 params = {player_status = <player_status>}}
			]
		}
		0x63658ada player_status = <player_status>
		if ($<player_status>.0x0e6b667f = 1)
			<label> = 'Accuracy Percentage: '
			<id> = 0x883fd03d
			<var> = 0x1c7778ce
			<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id>}
			CreateScreenElement {
				Type = TextElement
				parent = 0x6c69a329
				font = text_a1
				Scale = 0.75
				id = <id>
				rgba = [210 210 210 250]
				text = <label>
				just = [left top]
				z_priority = 100.0
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
					{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
					{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x132b2bce> 0x433f2dbe = 1})}
					{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xf127c7e4> 0x433f2dbe = 1})}
					{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x5c67de9d>})}
					{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x873e1ba7>})}
				]
			}
			0x3138cc32 player_status = <player_status> text = <label> variable = <var> id = <id> amt = 0
		endif
		if ($<player_status>.0x0e6b667f = 2)
			<label> = 'Min Health Percentage: '
			<id> = 0xc77e89e2
			<var> = 0xd8940ad0
			<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id>}
			CreateScreenElement {
				Type = TextElement
				parent = 0x6c69a329
				font = text_a1
				Scale = 0.75
				id = <id>
				rgba = [210 210 210 250]
				text = <label>
				just = [left top]
				z_priority = 100.0
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
					{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
					{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x132b2bce> 0x433f2dbe = 1})}
					{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xf127c7e4> 0x433f2dbe = 1})}
					{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x5c67de9d>})}
					{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x873e1ba7>})}
				]
			}
			0x3138cc32 player_status = <player_status> text = <label> variable = <var> id = <id> amt = 0
			<label> = 'Max Health Percentage: '
			<id> = 0x211e2603
			<var> = 0xe4993589
			<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id>}
			CreateScreenElement {
				Type = TextElement
				parent = 0x6c69a329
				font = text_a1
				Scale = 0.75
				id = <id>
				rgba = [210 210 210 250]
				text = <label>
				just = [left top]
				z_priority = 100.0
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
					{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
					{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x132b2bce> 0x433f2dbe = 1})}
					{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xf127c7e4> 0x433f2dbe = 1})}
					{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x5c67de9d>})}
					{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x873e1ba7>})}
				]
			}
			0x3138cc32 player_status = <player_status> text = <label> variable = <var> id = <id> amt = 0
		endif
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'meep'
			id = 0x3b2e9851
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0x58568850 params = {player_status = <player_status>}}
			]
		}
		0x19f2d0c5 player_status = <player_status>
		<label> = 'Star Power Threshhold: '
		<id> = 0xfe44521b
		<var> = 0x09cdbcf9
		<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id> min = 50}
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
				{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
				{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x132b2bce> 0x433f2dbe = 1})}
				{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xf127c7e4> 0x433f2dbe = 1})}
				{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x5c67de9d>})}
				{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x873e1ba7>})}
			]
		}
		0x3138cc32 <0x9af0bd48>
		<label> = 'Fire Attacks Threshhold: '
		<id> = 0x0bb6fa2e
		<var> = 0xf275d768
		<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id> min = 1 Max = 3}
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
				{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
				{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = 1 0x433f2dbe = 1})}
				{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = -1 0x433f2dbe = 1})}
				{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = 1})}
				{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = -1})}
			]
		}
		0x3138cc32 <0x9af0bd48>
		<label> = 'Whammy speed: '
		<id> = 0x333abef0
		<var> = 0xd4325102
		<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id> Max = 180}
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
				{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
				{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x132b2bce> 0x433f2dbe = 1})}
				{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xf127c7e4> 0x433f2dbe = 1})}
				{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x5c67de9d>})}
				{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x873e1ba7>})}
			]
		}
		0x3138cc32 <0x9af0bd48>
		0x28f18ec3 = (10 * (<0x132b2bce>))
		0x16224403 = (10 * (<0xf127c7e4>))
		0x22ed7885 = (10 * (<0x5c67de9d>))
		0xb9b769ff = (10 * (<0x873e1ba7>))
		<label> = 'Whammy Attack Recovery Delay (ms): '
		<id> = 0x6dfe2886
		<var> = 0xedf468ca
		<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id> Max = 2000}
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
				{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
				{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x28f18ec3> 0x433f2dbe = 1})}
				{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x16224403> 0x433f2dbe = 1})}
				{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x22ed7885>})}
				{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xb9b769ff>})}
			]
		}
		0x3138cc32 <0x9af0bd48>
		<label> = 'Broken String Recovery Delay (ms): '
		<id> = 0xa9e49a2e
		<var> = 0x2819522d
		<0x9af0bd48> = {player_status = <player_status> text = <label> variable = <var> id = <id> Max = 2000}
		CreateScreenElement {
			Type = TextElement
			parent = 0x6c69a329
			font = text_a1
			Scale = 0.75
			id = <id>
			rgba = [210 210 210 250]
			text = <label>
			just = [left top]
			z_priority = 100.0
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose 0x53cbc6c0 params = {player_status = <player_status> id = <id>}}
				{pad_back 0x4e8ce2c4 params = {player_status = <player_status> id = <id>}}
				{pad_up 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x28f18ec3> 0x433f2dbe = 1})}
				{pad_down 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x16224403> 0x433f2dbe = 1})}
				{pad_right 0x3138cc32 params = (<0x9af0bd48> + {amt = <0x22ed7885>})}
				{pad_left 0x3138cc32 params = (<0x9af0bd48> + {amt = <0xb9b769ff>})}
			]
		}
		0x3138cc32 <0x9af0bd48>
	endif
	if ((GotParam focus_id) && (($0x5489f91b) = 1))
		LaunchEvent Type = focus target = <focus_id>
	else
		LaunchEvent \{Type = focus
			target = 0x6c69a329}
	endif
endscript

script 0xdad0cf83 
	if (($0x5489f91b) = 0)
		generic_menu_up_or_down_sound <...>
	endif
endscript

script 0x9f67ae84 
	if (($0x5489f91b) = 0)
		generic_menu_pad_back <...>
	endif
endscript

script 0x53cbc6c0 
	0xf36a4798
	Change 0x5489f91b = (1 - ($0x5489f91b))
	if (($0x5489f91b) = 1)
		0xcd8e01d3 player_status = <player_status> focus_id = <id>
	else
		0xcd8e01d3 player_status = <player_status> focus_id = <id>
	endif
endscript

script 0x4e8ce2c4 
	if (($0x5489f91b) = 1)
		Change \{0x5489f91b = 0}
		0xf36a4798
		0xcd8e01d3 player_status = <player_status> focus_id = <id>
	endif
endscript

script 0x3138cc32 \{text = ''
		amt = 0
		0x433f2dbe = 0
		min = 0
		Max = 100}
	if ((GotParam player_status) && (GotParam variable) && (GotParam id))

		if ((<0x433f2dbe> = 0) || (($0x5489f91b) = 1))
			new_value = (($<player_status>.<variable>) + (<amt>))
			if (<new_value> > <Max>)
				<new_value> = <Max>
			elseif (<new_value> < <min>)
				<new_value> = <min>
			endif
			switch <variable>
				case 0x1c7778ce
				Change structurename = <player_status> 0x1c7778ce = <new_value>
				case 0xd8940ad0
				Change structurename = <player_status> 0xd8940ad0 = <new_value>
				if (<new_value> > $<player_status>.0xe4993589)
					Change structurename = <player_status> 0xe4993589 = <new_value>
					0x3138cc32 player_status = <player_status> text = 'Max Health Percentage: ' variable = 0xe4993589 id = 0x211e2603 amt = 0
				endif
				case 0xe4993589
				Change structurename = <player_status> 0xe4993589 = <new_value>
				if (<new_value> < $<player_status>.0xd8940ad0)
					Change structurename = <player_status> 0xd8940ad0 = <new_value>
					0x3138cc32 player_status = <player_status> text = 'Min Health Percentage: ' variable = 0xd8940ad0 id = 0xc77e89e2 amt = 0
				endif
				case 0xc67b5857
				Change structurename = <player_status> 0xc67b5857 = <new_value>
				case 0x09cdbcf9
				Change structurename = <player_status> 0x09cdbcf9 = <new_value>
				case 0xd4325102
				Change structurename = <player_status> 0xd4325102 = <new_value>
				Change structurename = <player_status> 0xd00c25fd = 90
				case 0xedf468ca
				Change structurename = <player_status> 0xedf468ca = <new_value>
				case 0x2819522d
				Change structurename = <player_status> 0x2819522d = <new_value>
				case 0xf275d768
				Change structurename = <player_status> 0xf275d768 = <new_value>
			endswitch
			formatText TextName = new_text '%t%v' t = <text> v = <new_value>
			<id> :SetProps text = <new_text>
		endif
	endif
endscript

script 0x7a1b28ba 
	if ScreenElementExists \{id = 0xf595fe55}
		DestroyScreenElement \{id = 0xf595fe55}
	endif
	destroy_generic_backdrop
endscript

script 0xf36a4798 
	if ScreenElementExists \{id = 0x2af17d23}
		DestroyScreenElement \{id = 0x2af17d23}
	endif
	destroy_generic_backdrop
endscript

script 0xef2cca29 
	0xf36a4798
	0x2e8a0c2b
endscript

script 0xf5b05b03 \{player_status = player1_status}
	ui_menu_select_sfx
	kill_debug_elements
	0x9cd80c89 = (($<player_status>.0x0e6b667f) + 1)
	if (<0x9cd80c89> > 2)
		<0x9cd80c89> = 0
	endif
	Change structurename = <player_status> 0x0e6b667f = <0x9cd80c89>
	0xf36a4798
	0xcd8e01d3 player_status = <player_status>
endscript

script 0x58568850 \{player_status = player1_status}
	Change structurename = <player_status> 0x76c25429 = (1 - ($<player_status>.0x76c25429))
	0x19f2d0c5 player_status = <player_status>
endscript

script 0x19f2d0c5 \{player_status = player1_status}
	toggle_text = 'ON'
	if (($<player_status>.0x76c25429) = 0)
		<toggle_text> = 'OFF'
	endif
	formatText TextName = text 'Use Star Power/Attacks: %t' t = <toggle_text>
	0x3b2e9851 :SetProps text = <text>
endscript

script 0x0a047643 \{player_status = player1_status}
	Change structurename = <player_status> bot_play = (1 - ($<player_status>.bot_play))
	0x3d6daad9 player_status = <player_status>
endscript

script 0x3d6daad9 \{player_status = player1_status}
	toggle_text = 'ON'
	if (($<player_status>.bot_play) = 0)
		<toggle_text> = 'OFF'
	endif
	formatText TextName = text 'Toggle Bot: %t' t = <toggle_text>
	0x06abc944 :SetProps text = <text>
endscript

script 0xed2a6b65 \{player_status = player1_status}
	Change structurename = <player_status> 0xf1a10981 = (1 - ($<player_status>.0xf1a10981))
	0x63658ada player_status = <player_status>
endscript

script 0x63658ada \{player_status = player1_status}
	toggle_text = 'ON'
	if (($<player_status>.0xf1a10981) = 0)
		<toggle_text> = 'OFF'
	endif
	formatText TextName = text 'Prevent Bot Death: %t' t = <toggle_text>
	0xc1d77714 :SetProps text = <text>
endscript

script 0xe54ae97c 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = 0x0df650c1
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = 0x0df650c1
		id = 0xbbe62bc2
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	array_entry = 0
	GetArraySize \{$battlemode_powerups}
	CreateScreenElement \{Type = TextElement
		parent = 0xbbe62bc2
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		text = 'Skip to sudden death'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x80041129
			}
		]}
	begin
	formatText TextName = 0x4f412dbc 'Give Player 1 %t' t = ($battlemode_powerups [<array_entry>].name_text)
	CreateScreenElement {
		Type = TextElement
		parent = 0xbbe62bc2
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <0x4f412dbc>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose battlemode_ready params = {battle_gem = <array_entry> player_status = player1_status battle_text = 0}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	<array_entry> = 0
	begin
	formatText TextName = 0x4f412dbc 'Give Player 2 %t' t = ($battlemode_powerups [<array_entry>].name_text)
	CreateScreenElement {
		Type = TextElement
		parent = 0xbbe62bc2
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <0x4f412dbc>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose battlemode_ready params = {battle_gem = <array_entry> player_status = player2_status battle_text = 0}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = 0xbbe62bc2}
endscript

script 0x80041129 
	Change \{force_sudden_death = 1}
endscript

script 0xc1f95008 
	if ScreenElementExists \{id = 0x0df650c1}
		DestroyScreenElement \{id = 0x0df650c1}
	endif
	destroy_generic_backdrop
endscript

script back_to_online_menu 

	quit_network_game
	destroy_create_session_menu
	create_online_menu
endscript

script create_songversion_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = songversion_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (40.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = songversion_scrolling_menu
		id = songversion_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = songversion_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play GH3_XP1 Song'
		z_priority = 100.0
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_song_menu
				params = {
					version = gh3
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = songversion_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play GH2 Song'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_song_menu
				params = {
					version = gh2
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = songversion_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Play GH1 Song'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_song_menu
				params = {
					version = gh1
				}
			}
		]}
	LaunchEvent \{Type = focus
		target = songversion_vmenu}
endscript

script back_to_songversion_menu 
	destroy_song_menu
	create_songversion_menu
endscript

script destroy_songversion_menu 
	if ScreenElementExists \{id = songversion_scrolling_menu}
		DestroyScreenElement \{id = songversion_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_song_menu \{version = gh3}
	ui_menu_select_sfx
	destroy_songversion_menu
	create_generic_backdrop
	x_pos = 450
	if (<version> = gh1)
		<x_pos> = 455
	endif
	if (<version> = gh2)
		<x_pos> = 520
	endif
	if (<version> = gh3)
		<x_pos> = 500
	endif
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = song_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		Pos = ($menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	CreateScreenElement \{Type = VMenu
		parent = song_scrolling_menu
		id = song_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_songversion_menu
				}
			}
		]}
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum index = <array_entry>
	get_song_struct song = <song_checksum>
	if ((<song_struct>.version) = <version>)
		get_song_title song = <song_checksum>
		CreateScreenElement {
			Type = TextElement
			parent = song_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = <song_title>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_difficulty_menu params = {song_name = <song_checksum> version = <version> Player = 1}}
			]
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = song_vmenu}
endscript

script back_to_song_menu 
	destroy_difficulty_menu
	create_song_menu version = <version>
endscript

script destroy_song_menu 
	if ScreenElementExists \{id = song_scrolling_menu}
		DestroyScreenElement \{id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_difficulty_menu 
	destroy_song_menu
	destroy_difficulty_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = difficulty_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement {
		Type = VMenu
		parent = difficulty_menu
		id = difficulty_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = back_to_song_menu version = <version>}}
		]
	}
	array_entry = 0
	GetArraySize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	if (<Player> = 2)
		CreateScreenElement {
			Type = TextElement
			parent = difficulty_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = <difficulty_text>
			z_priority = 100.0
			just = [left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_start_song params = {song_name = <song_name> difficulty2 = ($difficulty_list [<array_entry>]) difficulty = <difficulty>}}
			]
		}
	else
		if ($current_num_players = 2)
			CreateScreenElement {
				Type = TextElement
				parent = difficulty_vmenu
				font = text_a1
				Scale = 0.75
				rgba = [210 210 210 250]
				text = <difficulty_text>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose create_difficulty_menu params = {song_name = <song_name> version = <version> difficulty = ($difficulty_list [<array_entry>]) Player = 2}}
				]
			}
		else
			CreateScreenElement {
				Type = TextElement
				parent = difficulty_vmenu
				font = text_a1
				Scale = 0.75
				rgba = [210 210 210 250]
				text = <difficulty_text>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose select_start_song params = {difficulty = ($difficulty_list [<array_entry>]) song_name = <song_name>}}
				]
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = difficulty_vmenu}
endscript

script destroy_difficulty_menu 
	if ScreenElementExists \{id = difficulty_menu}
		DestroyScreenElement \{id = difficulty_menu}
	endif
	destroy_generic_backdrop
endscript

script create_settings_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = settings_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = settings_scrolling_menu
		id = settings_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Venue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changevenue_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Guitar'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changeguitar_menu
				params = {
					Type = guitar
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Bass'
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changeguitar_menu
				params = {
					Type = bass
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_visibility_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle visibility'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_togglevisibility_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = select_slomo_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Select Slomo : 1.0'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				select_slomo
			}
		]}
	select_slomo_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = 0x9c3673da
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		just = [
			left
			top
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xdb79f598
			}
		]}
	0x22729eb0
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_showmeasures_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Measures'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_showmeasures
			}
		]}
	toggle_showmeasures_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_showcameraname_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Camera Name'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_showcameraname
			}
		]}
	toggle_showcameraname_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_inputlog_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Input Log'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_inputlog
			}
		]}
	toggle_inputlog_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_botp1_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P1'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp1
			}
		]}
	toggle_botp1_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_botp2_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle Bot P2'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_botp2
			}
		]}
	toggle_botp2_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = edit_inputlog_lines_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Input Log Lines'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_left
				edit_inputlog_lines_left
			}
			{
				pad_right
				edit_inputlog_lines_right
			}
		]}
	edit_inputlog_lines_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_tilt_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Show Input Log'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_tilt
			}
		]}
	toggle_tilt_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_leftyflip_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Leftyflip'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_leftyflip
			}
		]}
	toggle_leftyflip_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = create_cameracut_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Select CameraCut'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_cameracut_group_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_ingame_cameracut_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Ingame CameraCut Menu: OFF'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_ingame_cameracut_menu
			}
		]}
	toggle_ingame_cameracut_menu_setprops
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle GPU Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_global
				params = {
					global_toggle = show_gpu_time
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle CPU Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_global
				params = {
					global_toggle = show_cpu_time
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_forcescore_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Force Score'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_forcescore
			}
		]}
	toggle_forcescore_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		id = toggle_animdebug_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Anim Debug'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_animdebug
			}
		]}
	toggle_animdebug_setprop
	CreateScreenElement \{Type = TextElement
		parent = settings_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Effects'
		z_priority = 100.0
		just = [
			left
			top
		]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x4620ac9a
			}
		]}
	LaunchEvent \{Type = focus
		target = settings_vmenu}
endscript

script toggle_aspect_ratio 
	GetGlobalTags \{user_options}
	if (<ps2_widescreen> = 1)
		SetScreenElementProps \{id = 0x4b78eec8
			text = 'Widescreen: Off'}
		SetGlobalTags \{user_options
			params = {
				ps2_widescreen = 0
			}}
		SetScreen \{widescreen = 0}
	else
		SetScreenElementProps \{id = 0x4b78eec8
			text = 'Widescreen: On'}
		SetGlobalTags \{user_options
			params = {
				ps2_widescreen = 1
			}}
		SetScreen \{widescreen = 1}
	endif
endscript

script toggle_progressive_scan 
	if ($ps2_progressivescan = 1)
		SetScreenElementProps \{id = 0x2c140bc5
			text = 'Progressive Scan: Off'}
		Change \{ps2_progressivescan = 0}
		setprogressive \{On = 0}
	else
		SetScreenElementProps \{id = 0x2c140bc5
			text = 'Progressive Scan: On'}
		Change \{ps2_progressivescan = 1}
		setprogressive \{On = 1}
	endif
endscript

script toggle_on_audible_hitnote 
	if ($Debug_Audible_HitNote = 1)
		Change \{Debug_Audible_HitNote = 0}
		SetScreenElementProps \{id = 0x7471cfe8
			text = 'Debug_Audible_HitNote Bot: OFF'}
	else
		Change \{Debug_Audible_HitNote = 1}
		SetScreenElementProps \{id = 0x7471cfe8
			text = 'Debug_Audible_HitNote: ON'}
	endif
endscript

script 0xdb79f598 
	GetGlobalTags \{user_options}
	if (<ps2_stereo_sound> = 1)
		SetGlobalTags \{user_options
			params = {
				ps2_stereo_sound = 0
			}}
		0xf2b96a22 \{0}
	else
		SetGlobalTags \{user_options
			params = {
				ps2_stereo_sound = 1
			}}
		0xf2b96a22 \{1}
	endif
	0x22729eb0
endscript

script playday_unlockall 
	difficulties = [easy medium hard expert]
	stored_difficulty1 = ($current_difficulty)
	stored_difficulty2 = ($current_difficulty2)
	stored_band = ($current_band)
	stored_gamemode = ($game_mode)
	menu_music_off \{setflag = 1}
	if ($progression_pop_count = 1)
		popped = 1
		progression_push_current
	else
		popped = 0
	endif
	diff_index = 0
	begin
	Change current_difficulty = (<difficulties> [<diff_index>])
	Change current_difficulty2 = (<difficulties> [<diff_index>])
	band_index = 1
	begin
	Change current_band = <band_index>
	Change \{game_mode = p1_career}
	progression_pop_current
	get_progression_globals \{game_mode = p1_career}
	GlobalTags_UnlockAll SongList = <tier_global>
	progression_push_current
	band_index = (<band_index> + 1)
	repeat 5
	GlobalTags_UnlockAll \{SongList = GH3_General_Songs}
	GlobalTags_UnlockAll \{SongList = GH3_Bonus_Songs}
	<diff_index> = (<diff_index> + 1)
	repeat 4
	GetArraySize ($GH3_Bonus_Songs.tier1.songs)
	i = 0
	begin
	SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<i>]) params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat <array_Size>
	i = 5
	GetArraySize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<i>].id)
	SetGlobalTags <video_checksum> params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat (<array_Size> - 5)
	Change \{structurename = player1_status
		new_cash = 0}
	Change \{progression_play_completion_movie = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change current_difficulty = <stored_difficulty1>
	Change current_difficulty2 = <stored_difficulty2>
	Change current_band = <stored_band>
	Change game_mode = <stored_gamemode>
	SetGlobalTags \{training
		params = {
			star_power_lesson = unlocked
			advanced_techniques_lesson = unlocked
			guitar_battle_lesson = unlocked
		}}
	if (<popped> = 1)
		progression_pop_current
	endif
	SpawnScriptNow \{menu_music_on
		params = {
			setflag = 1
		}}
endscript

script back_to_settings_menu 
	destroy_changevenue_menu
	destroy_changehighway_menu
	destroy_changeguitar_menu
	destroy_togglevisibility_menu
	destroy_cameracut_group_menu
	0xb07d4fb1
	create_settings_menu
endscript

script back_to_cameracut_group_menu 
	destroy_cameracut_menu
	create_cameracut_group_menu
endscript

script destroy_settings_menu 
	if ScreenElementExists \{id = settings_scrolling_menu}
		DestroyScreenElement \{id = settings_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script 0xb07d4fb1 
	if ScreenElementExists \{id = 0x68544da0}
		DestroyScreenElement \{id = 0x68544da0}
	endif
	destroy_generic_backdrop
endscript

script 0x4620ac9a 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = 0x68544da0
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = 0x68544da0
		id = 0xe0601e91
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x3be9a467
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Primary Bloom'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xd5a8cf10
			}
		]}
	0x7973542f
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0xd0de1f64
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Secondary Bloom'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x4ca19eaa
			}
		]}
	0x40fe68ea
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x556f935c
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Strength Red'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xf5ff9bee
			}
		]}
	0x944288b8
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x94e8d9f0
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Strength Green'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x98227f05
			}
		]}
	0x72158f86
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x72c112b4
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Strength Blue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0xe8488b8a
			}
		]}
	0x3882cac9
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x606293b9
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Color Red'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x61d4bf3f
			}
		]}
	0x2cea9790
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0xa1e5d915
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Color Green'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x0c095bd4
			}
		]}
	0xcabd90ae
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x47cc1251
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Bloom Color Blue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x7c63af5b
			}
		]}
	0x802ad5e1
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0xbf055db9
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Film Grain Alpha'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x36a3219c
			}
		]}
	0x2bcb543c
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x6aaeab99
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Grain Color Red'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x1331b83e
			}
		]}
	0xe07c901e
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0xab29e135
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Grain Color Green'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x7eec5cd5
			}
		]}
	0x062b9720
	CreateScreenElement \{Type = TextElement
		parent = 0xe0601e91
		id = 0x4d002a71
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Grain Color Blue'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				0x0e86a85a
			}
		]}
	0x4cbcd26f
	LaunchEvent \{Type = focus
		target = 0xe0601e91}
endscript
0x56d57c33 = 0.0
0xcfdc2d89 = 0.0
0xeebe8593 = 0
0x83636178 = 0
0xf30995f7 = 0
0x6b9656d9 = -5
0x064bb232 = -5
0x762146bd = -5
0x39545ba0 = 0.0
0x1ce38348 = 0
0x713e67a3 = 0
0x0154932c = 0

script 0x36a3219c 
	ui_menu_select_sfx
	Change 0x39545ba0 = ($0x39545ba0 + 0.05)
	if ($0x39545ba0 > 0.5)
		Change \{0x39545ba0 = -0.5}
	endif
	0x2bcb543c
endscript

script 0xf5ff9bee 
	ui_menu_select_sfx
	Change 0xeebe8593 = ($0xeebe8593 + 8)
	if ($0xeebe8593 >= 8)
		Change \{0xeebe8593 = -248}
	endif
	0x944288b8
endscript

script 0x98227f05 
	ui_menu_select_sfx
	Change 0x83636178 = ($0x83636178 + 8)
	if ($0x83636178 >= 8)
		Change \{0x83636178 = -248}
	endif
	0x72158f86
endscript

script 0xe8488b8a 
	ui_menu_select_sfx
	Change 0xf30995f7 = ($0xf30995f7 + 8)
	if ($0xf30995f7 >= 8)
		Change \{0xf30995f7 = -248}
	endif
	0x3882cac9
endscript

script 0x61d4bf3f 
	ui_menu_select_sfx
	Change 0x6b9656d9 = ($0x6b9656d9 + 8)
	if ($0x6b9656d9 >= 195)
		Change \{0x6b9656d9 = -61}
	endif
	0x2cea9790
endscript

script 0x0c095bd4 
	ui_menu_select_sfx
	Change 0x064bb232 = ($0x064bb232 + 8)
	if ($0x064bb232 >= 195)
		Change \{0x064bb232 = -61}
	endif
	0xcabd90ae
endscript

script 0x7c63af5b 
	ui_menu_select_sfx
	Change 0x762146bd = ($0x762146bd + 8)
	if ($0x762146bd >= 195)
		Change \{0x762146bd = -61}
	endif
	0x802ad5e1
endscript

script 0x1331b83e 
	ui_menu_select_sfx
	Change 0x1ce38348 = ($0x1ce38348 + 8)
	if ($0x1ce38348 >= 127)
		Change \{0x1ce38348 = -121}
	endif
	0xe07c901e
endscript

script 0x7eec5cd5 
	ui_menu_select_sfx
	Change 0x713e67a3 = ($0x713e67a3 + 8)
	if ($0x713e67a3 >= 127)
		Change \{0x713e67a3 = -121}
	endif
	0x062b9720
endscript

script 0x0e86a85a 
	ui_menu_select_sfx
	Change 0x0154932c = ($0x0154932c + 8)
	if ($0x0154932c >= 127)
		Change \{0x0154932c = -121}
	endif
	0x4cbcd26f
endscript

script 0x2bcb543c 
	formatText TextName = 0xf4e3e6c7 'Film Grain Alpha: %a' a = ($0x39545ba0 + 0.5)
	0xbf055db9 :SetProps text = <0xf4e3e6c7>
endscript

script 0x944288b8 
	formatText TextName = 0xf4e3e6c7 'Bloom Strength Red: %a' a = ($0xeebe8593 + 255)
	0x556f935c :SetProps text = <0xf4e3e6c7>
endscript

script 0x72158f86 
	formatText TextName = 0xf4e3e6c7 'Bloom Strength Green: %a' a = ($0x83636178 + 255)
	0x94e8d9f0 :SetProps text = <0xf4e3e6c7>
endscript

script 0x3882cac9 
	formatText TextName = 0xf4e3e6c7 'Bloom Strength Blue: %a' a = ($0xf30995f7 + 255)
	0x72c112b4 :SetProps text = <0xf4e3e6c7>
endscript

script 0x2cea9790 
	formatText TextName = 0xf4e3e6c7 'Bloom Color Red: %a' a = ($0x6b9656d9 + 68)
	0x606293b9 :SetProps text = <0xf4e3e6c7>
endscript

script 0xcabd90ae 
	formatText TextName = 0xf4e3e6c7 'Bloom Color Green: %a' a = ($0x064bb232 + 68)
	0xa1e5d915 :SetProps text = <0xf4e3e6c7>
endscript

script 0x802ad5e1 
	formatText TextName = 0xf4e3e6c7 'Bloom Color Blue: %a' a = ($0x762146bd + 68)
	0x47cc1251 :SetProps text = <0xf4e3e6c7>
endscript

script 0xe07c901e 
	formatText TextName = 0xf4e3e6c7 'Grain Color Red: %a' a = ($0x1ce38348 + 128)
	0x6aaeab99 :SetProps text = <0xf4e3e6c7>
endscript

script 0x062b9720 
	formatText TextName = 0xf4e3e6c7 'Grain Color Green: %a' a = ($0x713e67a3 + 128)
	0xab29e135 :SetProps text = <0xf4e3e6c7>
endscript

script 0x4cbcd26f 
	formatText TextName = 0xf4e3e6c7 'Grain Color Blue: %a' a = ($0x0154932c + 128)
	0x4d002a71 :SetProps text = <0xf4e3e6c7>
endscript

script 0xd5a8cf10 
	ui_menu_select_sfx
	Change 0x56d57c33 = ($0x56d57c33 + 0.05)
	if ($0x56d57c33 >= 0.7)
		Change \{0x56d57c33 = -0.35000002}
	endif
	0x7973542f
endscript

script 0x7973542f 
	formatText TextName = 0xf4e3e6c7 'Primary Bloom: %a' a = ($0x56d57c33 + 0.35000002)
	0x3be9a467 :SetProps text = <0xf4e3e6c7>
endscript

script 0x4ca19eaa 
	ui_menu_select_sfx
	Change 0xcfdc2d89 = ($0xcfdc2d89 + 0.05)
	if ($0xcfdc2d89 >= 0.05)
		Change \{0xcfdc2d89 = -1.0}
	endif
	0x40fe68ea
endscript

script 0x40fe68ea 
	formatText TextName = 0xf4e3e6c7 'Secondary Bloom: %a' a = ($0xcfdc2d89 + 1.0)
	0xd0de1f64 :SetProps text = <0xf4e3e6c7>
endscript
CameraCutPrefixArray = [
	'cameras'
	'cameras_longshot'
	'cameras_mid'
	'cameras_stage'
	'cameras_guitarist'
	'cameras_guitar'
	'cameras_singer'
	'cameras_drummer'
	'cameras_bassist'
	'cameras_rhythm'
	'cameras_zoom'
	'cameras_pan'
	'cameras_dolly'
	'cameras_special'
	'cameras_mocap'
	'cameras_audience'
	'cameras_boss_battle'
	'cameras_stagediver'
	'cameras_2p'
	'cameras_longshot_2p'
	'cameras_mid_2p'
	'cameras_stage_2p'
	'cameras_guitarist_2p'
	'cameras_guitar_2p'
	'cameras_singer_2p'
	'cameras_drummer_2p'
	'cameras_bassist_2p'
	'cameras_rhythm_2p'
	'cameras_zoom_2p'
	'cameras_pan_2p'
	'cameras_dolly_2p'
	'cameras_special_2p'
	'cameras_mocap_2p'
	'cameras_audience_2p'
	'cameras_boss_battle_2p'
	'cameras_stagediver_2p'
]

script create_cameracut_group_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = selectcameracut_scrolling_group_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = selectcameracut_scrolling_group_menu
		id = selectcameracut_group_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = selectcameracut_group_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'off'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				select_cameracut
				params = {
					Camera_Array_pakname = None
					Camera_Array = None
					array_count = None
				}
			}
		]}
	GetPakManCurrentName \{map = zones}
	camera_count = 0
	GetArraySize \{$CameraCutPrefixArray}
	camera_array_size = <array_Size>
	begin
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		if (<array_Size>)
			formatText TextName = camera_group '%p' p = ($CameraCutPrefixArray [<camera_count>])
			CreateScreenElement {
				Type = TextElement
				parent = selectcameracut_group_vmenu
				font = text_a1
				Scale = 0.75
				rgba = [210 210 210 250]
				text = <camera_group>
				z_priority = 100.0
				just = [left top]
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose create_cameracut_menu params = {camera_count = <camera_count>}}
					{pad_square create_cameracut_menu params = {camera_count = <camera_count>}}
				]
			}
		endif
	endif
	camera_count = (<camera_count> + 1)
	repeat <camera_array_size>
	LaunchEvent \{Type = focus
		target = selectcameracut_group_vmenu}
endscript

script create_cameracut_menu 
	if NOT GotParam \{camera_count}
		create_cameracut_group_menu
		return
	endif
	ui_menu_select_sfx
	destroy_cameracut_group_menu
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = selectcameracut_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = selectcameracut_scrolling_menu
		id = selectcameracut_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_cameracut_group_menu
				}
			}
		]}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		array_count = 0
		begin
		cameracut_getname pakname = <pakname> prefixnumber = <camera_count> cameranumber = <array_count>
		CreateScreenElement {
			Type = TextElement
			parent = selectcameracut_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = <Camera_Name>
			z_priority = 100.0
			just = [left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_cameracut params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count>}}
				{pad_square select_cameracut params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count> jumptoviewer}}
			]
		}
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
	LaunchEvent \{Type = focus
		target = selectcameracut_vmenu}
endscript

script back_to_cameracut_menu 
	create_cameracut_menu
endscript

script destroy_cameracut_menu 
	if ScreenElementExists \{id = selectcameracut_scrolling_menu}
		DestroyScreenElement \{id = selectcameracut_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script destroy_cameracut_group_menu 
	if ScreenElementExists \{id = selectcameracut_scrolling_group_menu}
		DestroyScreenElement \{id = selectcameracut_scrolling_group_menu}
	endif
	destroy_generic_backdrop
endscript
debug_camera_array = None
debug_camera_array_pakname = None
debug_camera_array_count = 0

script select_cameracut 
	ui_menu_select_sfx
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	destroy_cameracuts
	Wait \{3
		gameframes}
	create_cameracuts
	if GotParam \{jumptoviewer}
		destroy_all_debug_menus
		unpausegh3
		enable_pause
		Change \{viewer_buttons_enabled = 1}
		ToggleViewMode
	endif
endscript
cameracut_ingame_menu_on = 0
cameracut_ingame_menu_depth = 0
cameracut_ingame_menu_group = 0
cameracut_ingame_menu_index = 0

script toggle_ingame_cameracut_menu 
	Change cameracut_ingame_menu_on = (1 - ($cameracut_ingame_menu_on))
	toggle_ingame_cameracut_menu_setprops
endscript

script toggle_ingame_cameracut_menu_setprops 
	if ($cameracut_ingame_menu_on = 1)
		toggle_ingame_cameracut_menuitem :SetProps \{text = 'Ingame CameraCut Menu: ON'}
	else
		toggle_ingame_cameracut_menuitem :SetProps \{text = 'Ingame CameraCut Menu: OFF'}
	endif
endscript

script create_cameracut_ingame_menu 
	destroy_cameracut_ingame_menu
	CreateScreenElement {
		Type = VMenu
		parent = root_window
		id = cameracut_ingame_vmenu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
		event_handlers = [
			{pad_back cameracut_ingame_menu_press_button params = {Type = back Dir = -1}}
			{pad_choose cameracut_ingame_menu_press_button params = {Type = choose Dir = 1}}
			{pad_left cameracut_ingame_menu_press_button params = {Type = hori Dir = -1}}
			{pad_right cameracut_ingame_menu_press_button params = {Type = hori Dir = 1}}
			{pad_up cameracut_ingame_menu_press_button params = {Type = vert Dir = -1}}
			{pad_down cameracut_ingame_menu_press_button params = {Type = vert Dir = 1}}
		]
	}
	CreateScreenElement \{Type = TextElement
		id = 0xa528df9c
		parent = cameracut_ingame_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'V'
		just = [
			center
			top
		]
		z_priority = 100.0}
	CreateScreenElement \{Type = TextElement
		parent = cameracut_ingame_vmenu
		id = 0x183aad9e
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = ''
		z_priority = 100.0
		just = [
			center
			top
		]}
	CreateScreenElement \{Type = TextElement
		parent = cameracut_ingame_vmenu
		id = 0x3c218e26
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = ''
		just = [
			center
			top
		]
		z_priority = 100.0}
	CreateScreenElement \{Type = TextElement
		parent = cameracut_ingame_vmenu
		id = 0xfa613f10
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = ''
		z_priority = 100.0
		just = [
			left
			top
		]}
	cameracut_ingame_menu_setprops
	LaunchEvent \{Type = focus
		target = cameracut_ingame_vmenu}
endscript
cameracut_ingame_menu_camera_array_pakname = 0
cameracut_ingame_menu_camera_array = 0
cameracut_ingame_menu_array_count = 0

script cameracut_getname 
	if NOT GotParam \{pakname}
		GetPakManCurrentName \{map = zones}
	endif
	formatText checksumName = cameraarray '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [<prefixnumber>])
	formatText TextName = Camera_Name '%s_%p_%i' s = <pakname> p = ($CameraCutPrefixArray [<prefixnumber>]) i = <cameranumber>
	if StructureContains structure = ($<cameraarray> [<cameranumber>]) Name
		if StructureContains structure = ($cameracutnamestructure) ($<cameraarray> [<cameranumber>].Name)
			formatText TextName = Camera_Name '%s' s = ($cameracutnamestructure.($<cameraarray> [<cameranumber>].Name)) DontAssertForChecksums
		else
			formatText TextName = Camera_Name '%s' s = ($<cameraarray> [<cameranumber>].Name) DontAssertForChecksums
		endif
	elseif StructureContains structure = ($<cameraarray> [<cameranumber>]) params
		if StructureContains structure = ($<cameraarray> [<cameranumber>].params) Name
			if StructureContains structure = ($cameracutnamestructure) (($<cameraarray> [<cameranumber>].params).Name)
				formatText TextName = Camera_Name '%s' s = ($cameracutnamestructure.(($<cameraarray> [<cameranumber>].params).Name)) DontAssertForChecksums
			else
				formatText TextName = Camera_Name '%s' s = ($<cameraarray> [<cameranumber>].params.Name) DontAssertForChecksums
			endif
		endif
	endif
	return Camera_Name = <Camera_Name>
endscript

script cameracut_ingame_menu_setprops 
	DEPTH = ($cameracut_ingame_menu_depth)
	index = ($cameracut_ingame_menu_index)
	0x183aad9e :SetProps \{text = ''}
	0x3c218e26 :SetProps \{text = ''}
	0xfa613f10 :SetProps \{text = ''}
	if ((<DEPTH>) > 0)
		formatText TextName = camera_group '%p' p = ($CameraCutPrefixArray [$cameracut_ingame_menu_group])
		0x183aad9e :SetProps text = <camera_group>
		0x3c218e26 :SetProps \{text = 'V'}
	endif
	if ((<DEPTH>) > 1)
		GetPakManCurrentName \{map = zones}
		cameracut_getname pakname = <pakname> prefixnumber = ($cameracut_ingame_menu_group) cameranumber = ($cameracut_ingame_menu_index)
		formatText checksumName = cameraarray '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
		GetArraySize ($<cameraarray>)
		formatText TextName = camname '%s (%i/%m)' s = <Camera_Name> i = (($cameracut_ingame_menu_index) + 1) m = <array_Size> DontAssertForChecksums
		0xfa613f10 :SetProps text = <camname>
	endif
endscript

script cameracut_ingame_menu_press_button \{Type = vert
		Dir = 1}
	if ((<Type> = choose) && (($cameracut_ingame_menu_depth) = 2))
		select_cameracut_ingame
	elseif ((<Type> = vert) || (<Type> = choose) || (<Type> = back))
		cameracut_ingame_menu_change_depth Dir = <Dir>
	elseif ((<Type> = hori))
		if (($cameracut_ingame_menu_depth) = 1)
			cameracut_ingame_menu_change_group Dir = <Dir>
		elseif (($cameracut_ingame_menu_depth) = 2)
			cameracut_ingame_menu_change_camera Dir = <Dir>
		endif
	endif
endscript

script cameracut_ingame_menu_change_depth \{Dir = 1}
	Change cameracut_ingame_menu_depth = (($cameracut_ingame_menu_depth) + <Dir>)
	if (($cameracut_ingame_menu_depth) < 0)
		Change \{cameracut_ingame_menu_depth = 0}
		return
	endif
	if (($cameracut_ingame_menu_depth) > 2)
		Change \{cameracut_ingame_menu_depth = 2}
		return
	endif
	cameracut_ingame_menu_setprops
endscript

script cameracut_ingame_menu_change_group \{Dir = 1}
	Change cameracut_ingame_menu_group = (($cameracut_ingame_menu_group) + <Dir>)
	GetArraySize \{$CameraCutPrefixArray}
	max_value = (<array_Size> -1)
	if (($cameracut_ingame_menu_group) < 0)
		Change cameracut_ingame_menu_group = <max_value>
	endif
	if (($cameracut_ingame_menu_group) > (<max_value>))
		Change \{cameracut_ingame_menu_group = 0}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		if (<array_Size>)
			Change \{cameracut_ingame_menu_index = 0}
			cameracut_ingame_menu_setprops
			return
		endif
	endif
	cameracut_ingame_menu_change_group Dir = <Dir>
endscript

script cameracut_ingame_menu_change_camera \{Dir = 1}
	Change cameracut_ingame_menu_index = (($cameracut_ingame_menu_index) + <Dir>)
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	GetArraySize $<Camera_Array>
	max_value = (<array_Size> -1)
	if (($cameracut_ingame_menu_index) < 0)
		Change cameracut_ingame_menu_index = <max_value>
	endif
	if (($cameracut_ingame_menu_index) > (<max_value>))
		Change \{cameracut_ingame_menu_index = 0}
	endif
	cameracut_ingame_menu_setprops
endscript

script select_cameracut_ingame 
	ui_menu_select_sfx
	GetPakManCurrentName \{map = zones}
	Change debug_camera_array = ($CameraCutPrefixArray [($cameracut_ingame_menu_group)])
	Change debug_camera_array_pakname = <pakname>
	Change debug_camera_array_count = ($cameracut_ingame_menu_index)
	destroy_cameracuts
	Wait \{3
		gameframes}
	create_cameracuts
endscript

script destroy_cameracut_ingame_menu 
	if ScreenElementExists \{id = cameracut_ingame_vmenu}
		DestroyScreenElement \{id = cameracut_ingame_vmenu}
	endif
endscript

script create_character_viewer_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = character_viewer_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = character_viewer_scrolling_menu
		id = character_viewer_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = character_viewer_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Guitarist'
		z_priority = 100.0
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changeguitarist_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = character_viewer_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Bassist'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changebassist_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = character_viewer_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Vocalist'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changevocalist_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = character_viewer_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Change Drummer'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_changedrummer_menu
			}
		]}
	LaunchEvent \{Type = focus
		target = character_viewer_vmenu}
endscript

script back_to_character_viewer_menu 
	destroy_changeguitarist_menu
	destroy_changebassist_menu
	destroy_changevocalist_menu
	destroy_changedrummer_menu
	create_character_viewer_menu
endscript

script destroy_character_viewer_menu 
	if ScreenElementExists \{id = character_viewer_scrolling_menu}
		DestroyScreenElement \{id = character_viewer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitarist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = changeguitarist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = changeguitarist_scrolling_menu
		id = changeguitarist_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	Type = (<profile_struct>.Type)
	if ((<Type> = GUITARIST) || (<Type> = any))
		CreateScreenElement {
			Type = TextElement
			parent = changeguitarist_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.fullname)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose debug_menu_choose_guitarist params = {index = <index>}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changeguitarist_vmenu}
endscript

script destroy_changeguitarist_menu 
	if ScreenElementExists \{id = changeguitarist_scrolling_menu}
		DestroyScreenElement \{id = changeguitarist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script debug_menu_choose_guitarist 
	kill_gem_scroller
	get_musician_profile_struct index = <index>
	formatText checksumName = guitarist_id '%s' s = (<profile_struct>.Name)
	Change structurename = player1_status character_id = <guitarist_id>
	if NOT create_guitarist \{UseOldPos}
		DownloadContentLost
	endif
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = <device_num>
endscript

script create_changebassist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = changebassist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = changebassist_scrolling_menu
		id = changebassist_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	Type = (<profile_struct>.Type)
	if ((<Type> = BASSIST) || (<Type> = any))
		CreateScreenElement {
			Type = TextElement
			parent = changebassist_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.fullname)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_bassist params = {profile_name = (<profile_struct>.Name) UseOldPos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changebassist_vmenu}
endscript

script destroy_changebassist_menu 
	if ScreenElementExists \{id = changebassist_scrolling_menu}
		DestroyScreenElement \{id = changebassist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changevocalist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = changevocalist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = changevocalist_scrolling_menu
		id = changevocalist_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	Type = (<profile_struct>.Type)
	if ((<Type> = vocalist) || (<Type> = any))
		CreateScreenElement {
			Type = TextElement
			parent = changevocalist_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.Name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_vocalist params = {profile_name = (<info_struct>.Name) UseOldPos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changevocalist_vmenu}
endscript

script destroy_changevocalist_menu 
	if ScreenElementExists \{id = changevocalist_scrolling_menu}
		DestroyScreenElement \{id = changevocalist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changedrummer_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = changedrummer_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = changedrummer_scrolling_menu
		id = changedrummer_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_character_viewer_menu
				}
			}
		]}
	get_musician_profile_size
	index = 0
	begin
	get_musician_profile_struct index = <index>
	Type = (<profile_struct>.Type)
	if ((<Type> = drummer) || (<Type> = any))
		CreateScreenElement {
			Type = TextElement
			parent = changedrummer_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.Name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_drummer params = {profile_name = (<info_struct>.Name) UseOldPos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changedrummer_vmenu}
endscript

script destroy_changedrummer_menu 
	if ScreenElementExists \{id = changedrummer_scrolling_menu}
		DestroyScreenElement \{id = changedrummer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_playermode 
	Change player1_device = <device_num>
	translate_gamemode
	create_songversion_menu
endscript
debug_with_rhythm = 0
force_coop = 0

script translate_gamemode 
	switch $game_mode
		case p1_quickplay
		if ($debug_with_rhythm)
			Change \{structurename = player1_status
				part = rhythm}
		else
			Change \{structurename = player1_status
				part = guitar}
		endif
		Change \{current_num_players = 1}
		case p1_career
		Change \{structurename = player1_status
			part = guitar}
		Change \{current_num_players = 1}
		case p1_improv
		Change \{structurename = player1_status
			part = guitar}
		Change \{current_num_players = 1}
		case p1_boss
		Change \{structurename = player1_status
			part = guitar}
		Change \{current_num_players = 1}
		case p2_quickplay
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = rhythm}
		Change \{current_num_players = 2}
		case p2_faceoff
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = guitar}
		Change \{current_num_players = 2}
		case p2_coop
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = rhythm}
		Change \{current_num_players = 2}
		case p2_battle
		Change \{structurename = player1_status
			part = guitar}
		Change \{structurename = player2_status
			part = guitar}
		Change \{current_num_players = 2}
		case training
		Change \{structurename = player1_status
			part = guitar}
		Change \{current_num_players = 1}
	endswitch
endscript

script toggle_playermode_left 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				Change \{debug_with_rhythm = 0}
			else
				Change \{force_coop = 0}
				Change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				Change \{debug_with_rhythm = 0}
			else
				Change \{game_mode = training}
			endif
		endif
		case p2_quickplay
		Change \{force_coop = 1}
		Change \{debug_with_rhythm = 1}
		Change \{game_mode = p1_quickplay}
		case p1_career
		Change \{game_mode = p2_quickplay}
		case p1_improv
		Change \{game_mode = p1_career}
		case p1_boss
		Change \{game_mode = p1_improv}
		case p2_faceoff
		Change \{game_mode = p1_boss}
		case p2_coop
		Change \{game_mode = p2_faceoff}
		case p2_battle
		Change \{game_mode = p2_coop}
		case training
		Change \{game_mode = p2_battle}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				Change \{game_mode = p2_quickplay}
				Change \{force_coop = 0}
			else
				Change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				Change \{force_coop = 1}
				Change \{debug_with_rhythm = 0}
			else
				Change \{debug_with_rhythm = 1}
			endif
		endif
		case p2_quickplay
		Change \{game_mode = p1_career}
		case p1_career
		Change \{game_mode = p1_improv}
		case p1_improv
		Change \{game_mode = p1_boss}
		case p1_boss
		Change \{game_mode = p2_faceoff}
		case p2_faceoff
		Change \{game_mode = p2_coop}
		case p2_coop
		Change \{game_mode = p2_battle}
		case p2_battle
		Change \{game_mode = training}
		case training
		Change \{game_mode = p1_quickplay}
		Change \{debug_with_rhythm = 0}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_quickplay with rhythm coop'}
			else
				toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_quickplay coop'}
			endif
		else
			if ($debug_with_rhythm)
				toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_quickplay with rhythm'}
			else
				toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_quickplay'}
			endif
		endif
		case p2_quickplay
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p2_quickplay'}
		case p1_career
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_career'}
		case p1_improv
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_improv'}
		case p1_boss
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p1_boss'}
		case p2_faceoff
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p2_faceoff'}
		case p2_coop
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p2_coop'}
		case p2_battle
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: p2_battle'}
		case training
		toggle_playermode_menuitem :SetProps \{text = 'Play Song: training'}
	endswitch
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	CastToInteger \{speedfactor}
	speedfactor = (<speedfactor> + 1)
	if (<speedfactor> > 10)
		speedfactor = 1
	endif
	if (<speedfactor> < 1)
		speedfactor = 1
	endif
	Change current_speedfactor = (<speedfactor> / 10.0)
	update_slomo
	select_slomo_setprop
endscript

script update_slomo 
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	Change structurename = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	Change structurename = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script select_slomo_setprop 
	formatText \{TextName = slomo_text
		'Select Slomo : %s'
		s = $current_speedfactor}
	select_slomo_menuitem :SetProps text = <slomo_text>
endscript
debug_showmeasures = OFF

script toggle_showmeasures 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_measures_text}
		DestroyScreenElement \{id = debug_measures_text}
	endif
	if ($debug_showmeasures = OFF)
		Change \{debug_showmeasures = On}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_measures_text
			font = text_a1
			text = 'M: 0 : B: 00'
			Scale = 1
			Pos = (850.0, 400.0)
			rgba = [
				255
				187
				0
				255
			]
			just = [
				left
				top
			]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			Hide}
		if ($playing_song = 1)
			debug_measures_text :SetProps \{unhide}
		endif
	else
		Change \{debug_showmeasures = OFF}
	endif
	toggle_showmeasures_setprop
endscript

script 0x22729eb0 
	GetGlobalTags \{user_options}
	if (<ps2_stereo_sound> = 1)
		SetScreenElementProps \{id = 0x9c3673da
			text = 'Stereo Sound: ON'}
	else
		SetScreenElementProps \{id = 0x9c3673da
			text = 'Stereo Sound: OFF'}
	endif
endscript

script toggle_showmeasures_setprop 
	if ($debug_showmeasures = OFF)
		toggle_showmeasures_menuitem :SetProps \{text = 'Show Measures : off'}
	else
		toggle_showmeasures_menuitem :SetProps \{text = 'Show Measures : on'}
	endif
endscript
debug_showcameraname = OFF

script toggle_showcameraname 
	ui_menu_select_sfx
	if ScreenElementExists \{id = debug_camera_name_text}
		DestroyScreenElement \{id = debug_camera_name_text}
	endif
	if ($debug_showcameraname = OFF)
		Change \{debug_showcameraname = On}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = debug_camera_name_text
			font = text_a1
			Pos = (640.0, 32.0)
			just = [
				center
				top
			]
			Scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			text = 'Camera Name'
			z_priority = 100.0
			z_priority = 1.0
			alpha = 1}
	else
		Change \{debug_showcameraname = OFF}
	endif
	toggle_showcameraname_setprop
	CameraCuts_UpdateDebugCameraName
endscript

script toggle_inputlog 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_play_log = 0)
		Change \{show_play_log = 1}
	else
		Change \{show_play_log = 0}
	endif
	toggle_inputlog_setprop
	init_play_log
endscript

script toggle_botp1 
	ui_menu_select_sfx
	kill_debug_elements
	Change structurename = player1_status bot_play = (1 - ($player1_status.bot_play))
	toggle_botp1_setprop
endscript

script toggle_botp2 
	ui_menu_select_sfx
	kill_debug_elements
	Change structurename = player2_status bot_play = (1 - ($player2_status.bot_play))
	toggle_botp2_setprop
endscript

script edit_inputlog_lines_left 
	ui_menu_select_sfx
	kill_debug_elements
	Change play_log_lines = ($play_log_lines -1)
	if ($play_log_lines < 1)
		Change \{play_log_lines = 1}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script edit_inputlog_lines_right 
	ui_menu_select_sfx
	kill_debug_elements
	Change play_log_lines = ($play_log_lines + 1)
	if ($play_log_lines > 10)
		Change \{play_log_lines = 10}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script toggle_tilt 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_guitar_tilt = 0)
		Change \{show_guitar_tilt = 1}
	else
		Change \{show_guitar_tilt = 0}
	endif
	toggle_tilt_setprop
	init_play_log
endscript

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = OFF)
		toggle_showcameraname_menuitem :SetProps \{text = 'Show Camera Name : off'}
	else
		toggle_showcameraname_menuitem :SetProps \{text = 'Show Camera Name : on'}
	endif
endscript

script toggle_inputlog_setprop 
	if ($show_play_log = 0)
		toggle_inputlog_menuitem :SetProps \{text = 'Show Input Log : off'}
	else
		toggle_inputlog_menuitem :SetProps \{text = 'Show Input Log : on'}
	endif
endscript

script toggle_botp1_setprop 
	if (($player1_status.bot_play) = 0)
		toggle_botp1_menuitem :SetProps \{text = 'Toggle Bot P1: Off'}
	else
		toggle_botp1_menuitem :SetProps \{text = 'Toggle Bot P1: On'}
	endif
endscript

script toggle_botp2_setprop 
	if (($player2_status.bot_play) = 0)
		toggle_botp2_menuitem :SetProps \{text = 'Toggle Bot P2: Off'}
	else
		toggle_botp2_menuitem :SetProps \{text = 'Toggle Bot P2: On'}
	endif
endscript

script edit_inputlog_lines_setprop 
	formatText TextName = text 'Input Log Lines: %l' l = ($play_log_lines) DontAssertForChecksums
	edit_inputlog_lines_menuitem :SetProps text = <text>
endscript

script toggle_tilt_setprop 
	if ($show_guitar_tilt = 0)
		toggle_tilt_menuitem :SetProps \{text = 'Show Tilt : off'}
		KillSpawnedScript \{Name = show_tilt_loop}
	else
		toggle_tilt_menuitem :SetProps \{text = 'Show Tilt : on'}
		SpawnScriptLater \{show_tilt_loop}
	endif
endscript

script show_tilt_loop 
	if NOT ScreenElementExists \{id = show_tilt_test}
		CreateScreenElement \{Type = TextElement
			parent = root_window
			id = show_tilt_test
			Pos = (320.0, 240.0)
			font = text_a1
			text = ''}
	endif
	begin
	GuitarGetAnalogueInfo
	rgba = [255 255 255 255]
	GetGlobalTags \{user_options}
	star_power_position = <star_power_position_device_0>
	if (<righty> <= <star_power_position>)
		rgba = [255 64 64 255]
	endif
	formatText TextName = text '%d' d = <righty>
	SetScreenElementProps {
		id = show_tilt_test
		text = <text>
		rgba = <rgba>
	}
	Wait \{5
		frames}
	repeat
endscript

script toggle_leftyflip 
	ui_menu_select_sfx
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 0)
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p1 = 1
			}}
	else
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p1 = 0
			}}
	endif
	GetGlobalTags \{user_options}
	Change structurename = <player_status> lefthanded_gems = <lefty_flip_p1>
	Change structurename = <player_status> lefthanded_button_ups = <lefty_flip_p1>
	toggle_leftyflip_setprop
endscript

script toggle_leftyflip_setprop 
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 0)
		toggle_leftyflip_menuitem :SetProps \{text = 'Lefty Flip : off'}
	else
		toggle_leftyflip_menuitem :SetProps \{text = 'Lefty Flip : on'}
	endif
endscript
debug_forcescore = OFF

script toggle_forcescore 
	ui_menu_select_sfx
	switch $debug_forcescore
		case OFF
		Change \{debug_forcescore = poor}
		case poor
		Change \{debug_forcescore = medium}
		case medium
		Change \{debug_forcescore = good}
		case good
		Change \{debug_forcescore = OFF}
		default
		Change \{debug_forcescore = OFF}
	endswitch
	CrowdIncrease \{player_status = player1_status}
	toggle_forcescore_setprop
endscript

script toggle_forcescore_setprop 
	switch $debug_forcescore
		case OFF
		toggle_forcescore_menuitem :SetProps \{text = 'Force Score : off'}
		case poor
		toggle_forcescore_menuitem :SetProps \{text = 'Force Score : poor'}
		case medium
		toggle_forcescore_menuitem :SetProps \{text = 'Force Score : medium'}
		case good
		toggle_forcescore_menuitem :SetProps \{text = 'Force Score : good'}
		default
		toggle_forcescore_menuitem :SetProps \{text = 'Force Score : off'}
	endswitch
endscript
debug_animdebug = 'none'

script toggle_animdebug 
	ui_menu_select_sfx
	switch $debug_animdebug
		case 'none'
		Change \{debug_animdebug = 'drummer'}
		case 'drummer'
		Change \{debug_animdebug = 'guitarist'}
		case 'guitarist'
		Change \{debug_animdebug = 'bassist'}
		case 'bassist'
		Change \{debug_animdebug = 'rhythm'}
		case 'rhythm'
		Change \{debug_animdebug = 'vocalist'}
		case 'vocalist'
		Change \{debug_animdebug = 'crowd'}
		case 'crowd'
		Change \{debug_animdebug = 'none'}
		default
		Change \{debug_animdebug = 'none'}
	endswitch
	y = 0
	begin
	printdebugtext X = 0 y = <y> str = '                                                                                '
	<y> = (<y> + 1)
	repeat 6
	toggle_animdebug_setprop
endscript

script toggle_animdebug_setprop 
	switch $debug_animdebug
		case 'none'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Off'}
		case 'drummer'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Drummer'}
		case 'guitarist'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Guitarist'}
		case 'bassist'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Bassist'}
		case 'rhythm'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Rhythm Bassist'}
		case 'vocalist'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Vocalist'}
		case 'crowd'
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Crowd'}
		default
		toggle_animdebug_menuitem :SetProps \{text = 'Anim Debug : Off'}
	endswitch
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = changevenue_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = changevenue_scrolling_menu
		id = changevenue_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	CreateScreenElement {
		Type = TextElement
		parent = changevenue_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = ($LevelZones.<level_checksum>.title)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose select_venue params = {level = <level_checksum> norestart}}
		]
	}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	create_changevenue_menu
endscript

script destroy_changevenue_menu 
	if ScreenElementExists \{id = changevenue_scrolling_menu}
		DestroyScreenElement \{id = changevenue_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_venue 
	ui_menu_select_sfx
	kill_gem_scroller
	ResetWaypoints
	if GotParam \{level}
		Change current_level = <level>
	endif
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	ChangeNodeFlag \{LS_3_5_PRE
		1}
	ChangeNodeFlag \{LS_3_5_POST
		0}
	ChangeNodeFlag \{LS_ENCORE_PRE
		1}
	ChangeNodeFlag \{LS_ENCORE_POST
		0}
	DestroyPakManMap \{map = zones}
	MemPushContext \{heap_zones}
	CreatePakManMap \{map = zones
		links = GH3Zones
		folder = 'zones/'
		uselinkslots}
	MemPopContext
	Load_Venue \{block_scripts = 1}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		SpawnScriptNow \{testlevel_debug}
	else
		if NOT create_band
			DownloadContentLost
		endif
		create_crowd_models
		crowd_reset \{player_status = player1_status
			Player = 1}
	endif
	enable_pause
	restore_start_key_binding
	if NOT GotParam \{norestart}
		gh3_start_pressed
		restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = <device_num>
	else
		ToggleViewMode \{viewerreload}
		ToggleViewMode \{viewerreload}
	endif
endscript

script testlevel_debug 
	begin
	if ControllerMake \{circle
			0}
		next_peds
	endif
	if ControllerMake \{circle
			1}
		next_peds
	endif
	WaitOneGameFrame
	repeat
endscript
debug_ped_row = 0

script next_peds 
	kill \{prefix = Z_TestLevel_Peds_Row0}
	kill \{prefix = Z_TestLevel_Peds_Row1}
	kill \{prefix = Z_TestLevel_Peds_Row2}
	kill \{prefix = Z_TestLevel_Peds_Row3}
	kill \{prefix = Z_TestLevel_Peds_Row4}
	kill \{prefix = Z_TestLevel_Peds_Row5}
	kill \{prefix = Z_TestLevel_Peds_Row6}
	kill \{prefix = Z_TestLevel_Peds_Row7}
	WaitOneGameFrame
	begin
	Change debug_ped_row = ($debug_ped_row + 1)
	formatText checksumName = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if IsAlive prefix = <row>
		break
	else
		Change \{debug_ped_row = -1}
	endif
	repeat
endscript

script back_to_changehighway_menu 
	create_changehighway_menu
endscript

script destroy_changehighway_menu 
	if ScreenElementExists \{id = changehighway_scrolling_menu}
		DestroyScreenElement \{id = changehighway_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitar_menu \{Type = guitar}
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = changeguitar_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = changeguitar_scrolling_menu
		id = changeguitar_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	get_musician_instrument_size
	array_count = 0
	begin
	get_musician_instrument_struct index = <array_count>
	if (<Type> = (<info_struct>.Type))

		CreateScreenElement {
			Type = TextElement
			parent = changeguitar_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = (<info_struct>.Name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_guitar params = {guitar = <array_count> Type = <Type>}}
			]
		}
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = changeguitar_vmenu}
endscript

script back_to_changeguitar_menu 
	create_changeguitar_menu
endscript

script destroy_changeguitar_menu 
	if ScreenElementExists \{id = changeguitar_scrolling_menu}
		DestroyScreenElement \{id = changeguitar_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_guitar \{Type = guitar}
	ui_menu_select_sfx
	kill_gem_scroller
	if (<Type> = guitar)
		get_musician_instrument_struct index = <guitar>
		Change structurename = player1_status instrument_id = (<info_struct>.desc_id)
	else
		get_musician_instrument_struct index = <guitar>
		Change current_bass_model = (<info_struct>.desc_id)
	endif
	select_start_song
endscript
HideByType_List = [
	'real_crowd'
	'stage'
	'scene_ped'
]
HideByType_Visible = [
	On
	On
	On
]

script create_togglevisibility_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = togglevisibility_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = togglevisibility_scrolling_menu
		id = togglevisibility_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_settings_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = togglevisibility_vmenu
		id = toggle_bandvisible_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle band'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_bandvisible
			}
		]}
	toggle_bandvisible_setprop
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	formatText checksumName = type_checksum '%s' s = ($HideByType_List [<array_count>])
	formatText checksumName = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($HideByType_List [<array_count>])
	CreateScreenElement {
		Type = TextElement
		parent = togglevisibility_vmenu
		id = <menuitem_checksum>
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = ''
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_hidebytype params = {Type = type_checksum array_count = <array_count>}}
		]
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	toggle_hidebytype_setprop
	CreateScreenElement \{Type = TextElement
		parent = togglevisibility_vmenu
		id = toggle_highway_menuitem
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Toggle highway'
		z_priority = 100.0
		just = [
			left
			top
		]
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				toggle_highway
			}
		]}
	toggle_highway_setprop
	LaunchEvent \{Type = focus
		target = togglevisibility_vmenu}
endscript

script back_to_togglevisibility_menu 
	create_togglevisibility_menu
endscript

script destroy_togglevisibility_menu 
	if ScreenElementExists \{id = togglevisibility_scrolling_menu}
		DestroyScreenElement \{id = togglevisibility_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
highwayvisible = On

script toggle_highway 
	ui_menu_select_sfx
	if ($highwayvisible = OFF)
		if ScreenElementExists \{id = gem_containerp1}
			DoScreenElementMorph \{id = gem_containerp1
				alpha = 1}
		endif
		if ScreenElementExists \{id = gem_containerp2}
			DoScreenElementMorph \{id = gem_containerp2
				alpha = 1}
		endif
		enable_highway_prepass
		Change \{highwayvisible = On}
	else
		if ScreenElementExists \{id = gem_containerp1}
			DoScreenElementMorph \{id = gem_containerp1
				alpha = 0}
		endif
		if ScreenElementExists \{id = gem_containerp2}
			DoScreenElementMorph \{id = gem_containerp2
				alpha = 0}
		endif
		disable_highway_prepass
		Change \{highwayvisible = OFF}
	endif
	toggle_highway_setprop
endscript

script toggle_highway_setprop 
	if ($highwayvisible = OFF)
		toggle_highway_menuitem :SetProps \{text = 'Toggle highway : off'}
	else
		toggle_highway_menuitem :SetProps \{text = 'Toggle highway : on'}
	endif
endscript
bandvisible = On

script toggle_bandvisible 
	ui_menu_select_sfx
	if ($bandvisible = OFF)
		Change \{bandvisible = On}
	else
		Change \{bandvisible = OFF}
	endif
	set_bandvisible
	toggle_bandvisible_setprop
endscript

script set_bandvisible 
	if ($bandvisible = OFF)
		if CompositeObjectExists \{GUITARIST}
			GUITARIST :Hide
		endif
		if CompositeObjectExists \{vocalist}
			vocalist :Hide
		endif
		if CompositeObjectExists \{BASSIST}
			BASSIST :Hide
		endif
		if CompositeObjectExists \{rhythm}
			rhythm :Hide
		endif
		if CompositeObjectExists \{drummer}
			drummer :Hide
		endif
	else
		if CompositeObjectExists \{GUITARIST}
			GUITARIST :unhide
		endif
		if CompositeObjectExists \{vocalist}
			vocalist :unhide
		endif
		if CompositeObjectExists \{BASSIST}
			BASSIST :unhide
		endif
		if CompositeObjectExists \{rhythm}
			rhythm :unhide
		endif
		if CompositeObjectExists \{drummer}
			drummer :unhide
		endif
	endif
endscript

script toggle_bandvisible_setprop 
	if ($bandvisible = OFF)
		toggle_bandvisible_menuitem :SetProps \{text = 'Toggle band : off'}
	else
		toggle_bandvisible_menuitem :SetProps \{text = 'Toggle band : on'}
	endif
endscript

script toggle_hidebytype 
	ui_menu_select_sfx
	if (($HideByType_Visible [<array_count>]) = OFF)
		SetArrayElement ArrayName = HideByType_Visible globalarray index = <array_count> NewValue = On
	else
		SetArrayElement ArrayName = HideByType_Visible globalarray index = <array_count> NewValue = OFF
	endif
	set_hidebytype
	toggle_hidebytype_setprop
endscript

script set_hidebytype 
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	formatText checksumName = type_checksum '%s' s = ($HideByType_List [<array_count>])
	if (($HideByType_Visible [<array_count>]) = OFF)
		HideObjectByType Type = <type_checksum>
	else
		HideObjectByType Type = <type_checksum> unhide
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script toggle_hidebytype_setprop 
	GetArraySize \{$HideByType_List}
	array_count = 0
	begin
	if (($HideByType_Visible [<array_count>]) = OFF)
		formatText TextName = menutext 'Toggle %s : off' s = ($HideByType_List [<array_count>])
	else
		formatText TextName = menutext 'Toggle %s : on' s = ($HideByType_List [<array_count>])
	endif
	formatText checksumName = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($HideByType_List [<array_count>])
	<menuitem_checksum> :SetProps text = <menutext>
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = skipintosong_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (20.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = skipintosong_scrolling_menu
		id = skipintosong_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = skipintosong_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip By Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbytime_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = skipintosong_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip By Marker'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymarker_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = skipintosong_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Skip By Measure'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymeasure_menu
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = skipintosong_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Set Loop Point'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_looppoint_menu
			}
		]}
	LaunchEvent \{Type = focus
		target = skipintosong_vmenu}
endscript

script back_to_skipintosong_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	create_skipintosong_menu
endscript

script destroy_skipintosong_menu 
	if ScreenElementExists \{id = skipintosong_scrolling_menu}
		DestroyScreenElement \{id = skipintosong_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbytime_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = skipbytime_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		Pos = ($menu_pos + (70.0, 0.0))
	}
	CreateScreenElement {
		Type = VMenu
		parent = skipbytime_scrolling_menu
		id = skipbytime_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		CreateScreenElement {
			Type = TextElement
			parent = skipbytime_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'No Loop Point'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {starttime = -1000000}}
			]
		}
	endif
	get_song_prefix song = ($current_song)
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup
	GetArraySize $<fretbar_array>
	max_time = (($<fretbar_array> [(<array_Size> - 1)]) / 1000)
	current_time = 0
	begin
	formatText TextName = menu_itemname 'Time %ss' s = <current_time>
	if (<current_time> < <max_time>)
		CreateScreenElement {
			Type = TextElement
			parent = skipbytime_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = <menu_itemname>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = (<current_time> * 1000)}}
			]
		}
	else
		break
	endif
	current_time = (<current_time> + 5)
	repeat
	LaunchEvent \{Type = focus
		target = skipbytime_vmenu}
endscript

script back_to_skipbytime_menu 
	create_skipbytime_menu
endscript

script destroy_skipbytime_menu 
	if ScreenElementExists \{id = skipbytime_scrolling_menu}
		DestroyScreenElement \{id = skipbytime_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymarker_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = skipbymarker_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		Pos = ($menu_pos + (30.0, 0.0))
	}
	CreateScreenElement {
		Type = VMenu
		parent = skipbymarker_scrolling_menu
		id = skipbymarker_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		CreateScreenElement {
			Type = TextElement
			parent = skipbymarker_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'No Loop Point'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {starttime = -1000000}}
			]
		}
	endif
	get_song_prefix song = ($current_song)
	formatText checksumName = marker_array '%s_markers' s = <song_prefix>
	getmarkerarraysize array = (<marker_array>)
	if (<array_Size> = 0)
		CreateScreenElement {
			Type = TextElement
			parent = skipbymarker_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'start'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = -1000000}}
			]
		}
	else
		marker_count = 0
		begin
		formatText TextName = menu_itemname '%m (%ss)' m = ($<marker_array> [<marker_count>].marker) s = (($<marker_array> [<marker_count>].time) / 1000)
		CreateScreenElement {
			Type = TextElement
			parent = skipbymarker_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = <menu_itemname>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose restart_gem_scroller params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($<marker_array> [<marker_count>].time) startmarker = <marker_count>}}
			]
		}
		marker_count = (<marker_count> + 1)
		repeat <array_Size>
	endif
	LaunchEvent \{Type = focus
		target = skipbymarker_vmenu}
endscript

script back_to_skipbymarker_menu 
	create_skipbymarker_menu
endscript

script destroy_skipbymarker_menu 
	if ScreenElementExists \{id = skipbymarker_scrolling_menu}
		DestroyScreenElement \{id = skipbymarker_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymeasure_menu 
	ui_menu_select_sfx
	if GotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = skipbymeasure_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		Pos = ($menu_pos + (-30.0, 0.0))
	}
	CreateScreenElement {
		Type = VMenu
		parent = skipbymeasure_scrolling_menu
		id = skipbymeasure_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if GotParam \{looppoint}
		menu_func = set_looppoint
		CreateScreenElement {
			Type = TextElement
			parent = skipbymeasure_vmenu
			font = text_a1
			Scale = 0.75
			rgba = [210 210 210 250]
			text = 'No Loop Point'
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> params = {starttime = -1000000}}
			]
		}
	endif
	get_song_prefix song = ($current_song)
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup
	formatText checksumName = timesig '%s_timesig' s = <song_prefix> AddToStringLookup
	GetArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_Size>
	timesig_num = 0
	measure_count = 0
	GetArraySize $<fretbar_array>
	array_entry = 0
	fretbar_count = 0
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<fretbar_array> [<array_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if (<measure_count> > 150)
		measures_per_menuitem = 2
	else
		measures_per_menuitem = 1
	endif
	timesig_entry = 0
	measure_count = 0
	array_entry = 0
	fretbar_count = 0
	measures_per_menuitem_count = 0
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<fretbar_array> [<array_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	if (<fretbar_count> = 0)
		measures_per_menuitem_count = (<measures_per_menuitem_count> + 1)
		if (<measures_per_menuitem_count> = <measures_per_menuitem>)
			time = ($<fretbar_array> [(<array_entry>)])
			formatText TextName = menu_itemname 'Measure %m (%ss)' s = (<time> / 1000.0) m = <measure_count>

			CreateScreenElement {
				Type = TextElement
				parent = skipbymeasure_vmenu
				font = text_a1
				Scale = 0.75
				rgba = [210 210 210 250]
				text = <menu_itemname>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose <menu_func> params = {song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = <time>}}
				]
			}
			measures_per_menuitem_count = 0
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = skipbymeasure_vmenu}
endscript

script back_to_skipbymeasure_menu 
	create_skipbymeasure_menu
endscript

script destroy_skipbymeasure_menu 
	if ScreenElementExists \{id = skipbymeasure_scrolling_menu}
		DestroyScreenElement \{id = skipbymeasure_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_looppoint_menu 
	ui_menu_select_sfx
	destroy_skipintosong_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = looppoint_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos + (20.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = looppoint_scrolling_menu
		id = looppoint_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_skipintosong_menu
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = looppoint_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Loop By Time'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbytime_menu
				params = {
					looppoint
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = looppoint_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Loop By Marker'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymarker_menu
				params = {
					looppoint
				}
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = looppoint_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = 'Loop By Measure'
		just = [
			left
			top
		]
		z_priority = 100.0
		event_handlers = [
			{
				focus
				menu_focus
			}
			{
				unfocus
				menu_unfocus
			}
			{
				pad_choose
				create_skipbymeasure_menu
				params = {
					looppoint
				}
			}
		]}
	LaunchEvent \{Type = focus
		target = looppoint_vmenu}
endscript

script back_to_looppoint_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	create_looppoint_menu
endscript

script destroy_looppoint_menu 
	if ScreenElementExists \{id = looppoint_scrolling_menu}
		DestroyScreenElement \{id = looppoint_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script set_looppoint 
	ui_menu_select_sfx
	Change current_looppoint = <starttime>
	gh3_start_pressed
endscript

script create_replay_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	x_pos = 450
	CreateScreenElement \{Type = VScrollingMenu
		parent = pause_menu
		id = replay_scrolling_menu
		just = [
			left
			top
		]
		dims = (400.0, 250.0)
		Pos = (450.0, 120.0)}
	CreateScreenElement \{Type = VMenu
		parent = replay_scrolling_menu
		id = replay_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	StartWildcardSearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT GetWildcardFile
		break
	endif
	CreateScreenElement {
		Type = TextElement
		parent = replay_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		text = <basename>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose restart_gem_scroller params = {replay = <FileName> song_name = 'blah' difficulty = 'blah' difficulty2 = 'blah'}}
		]
	}
	<index> = (<index> + 1)
	repeat
	EndWildcardSearch
	LaunchEvent \{Type = focus
		target = replay_vmenu}
endscript

script destroy_replay_menu 
	if ScreenElementExists \{id = replay_scrolling_menu}
		DestroyScreenElement \{id = replay_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_start_song 
	Change \{current_transition = debugintro}
	SpawnScriptLater start_song params = <...>
	switch ($game_mode)
		case p1_career
		ui_flow_manager_respond_to_action \{action = set_p1_career}
		case p1_quickplay
		ui_flow_manager_respond_to_action \{action = set_p1_quickplay}
		case p2_quickplay
		ui_flow_manager_respond_to_action \{action = set_p2_quickplay}
		case p2_faceoff
		case p2_battle
		case p2_pro_faceoff
		ui_flow_manager_respond_to_action \{action = set_p2_general}
		case training
		ui_flow_manager_respond_to_action \{action = set_p1_training}
	endswitch
	destroy_all_debug_menus
endscript

script ui_menu_scroll_sfx 
	SoundEvent \{event = ui_sfx_scroll}
	SoundEvent \{event = ui_sfx_scroll_add}
endscript

script ui_menu_select_sfx 
	SoundEvent \{event = ui_sfx_select}
endscript

script menu_focus 
	GetTags
	SetScreenElementProps id = <id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	GetTags
	SetScreenElementProps id = <id> rgba = [210 210 210 250]
endscript
debug_menu_mode = 1

script switch_to_retail_menu 
	destroy_all_debug_menus
	Change debug_menu_mode = (0)
	start_flow_manager
endscript

script switch_to_debug_menu 
	shut_down_flow_manager
	Change debug_menu_mode = (1)
	destroy_all_debug_menus
	create_debugging_menu
endscript

script back_to_retail_ui_flow 
	destroy_debugging_menu
	ui_flow_manager_respond_to_action \{action = go_back}
	enable_pause
endscript

script toggle_global 
	if GotParam \{global_toggle}
		if ($<global_toggle> = 1)
			Change GlobalName = <global_toggle> NewValue = 0
		else
			Change GlobalName = <global_toggle> NewValue = 1
		endif
	endif
endscript
lightshow_enabled = 1

script toggle_lightshow 
	if ($lightshow_enabled = 0)
		Change \{lightshow_enabled = 1}
		LightShow_SetActive \{Active = true}
	else
		Change \{lightshow_enabled = 0}
		LightShow_SetActive \{Active = FALSE}
	endif
	toggle_lightshow_setprop
endscript

script get_lightshow_state 
	return \{Enabled = $lightshow_enabled}
endscript

script toggle_lightshow_setprop 
	if (($lightshow_enabled) = 0)
		toggle_lightshow_menuitem :SetProps \{text = 'Toggle Lightshow: Off'}
	else
		toggle_lightshow_menuitem :SetProps \{text = 'Toggle Lightshow: On'}
	endif
endscript
fsfx_enabled = 1

script toggle_fsfx 
	if ($fsfx_enabled = 0)
		Change \{fsfx_enabled = 1}
	else
		Change \{fsfx_enabled = 0}
	endif
	toggle_fsfx_setprop
endscript

script get_fsfx_state 
	return \{Enabled = $fsfx_enabled}
endscript

script toggle_fsfx_setprop 
	if (($fsfx_enabled) = 0)
		toggle_fsfx_menuitem :SetProps \{text = 'Toggle Full Screen FX: Off'}
	else
		toggle_fsfx_menuitem :SetProps \{text = 'Toggle Full Screen FX: On'}
	endif
endscript

script 0x556bfd95 
	if ($0xf0013d4c = 0)
		Change \{0xf0013d4c = 1}
		0x3f7d7f1b \{Enabled = 1}
	else
		Change \{0xf0013d4c = 0}
		0x3f7d7f1b \{Enabled = 0}
	endif
	0x7bceb762
endscript

script 0x7bceb762 
	if (($0xf0013d4c) = 0)
		0x338624a9 :SetProps \{text = 'Toggle 30fps Animations: Off'}
	else
		0x338624a9 :SetProps \{text = 'Toggle 30fps Animations: On'}
	endif
endscript

script 0xd29091c0 
	Change \{0xf0013d4c = 1}
	0x3f7d7f1b \{Enabled = 1}
endscript

script 0x09bd99e0 
	Change \{0xf0013d4c = 0}
	0x3f7d7f1b \{Enabled = 0}
endscript

script check_front_end_animations 
	switch <flow_state>
		case career_select_character_fs
		case career_character_hub_fs
		case career_select_outfit_fs
		case career_select_guitar_fs
		case career_select_guitar_finish_fs
		case career_select_style_fs
		case coop_career_character_select_fs
		case coop_career_character_hub_fs
		case coop_career_split_off_flow_for_character_hub_fs
		case coop_career_split_off_flow_for_character_select_fs
		case coop_career_select_guitar
		case coop_career_select_guitar_finish_fs
		case coop_career_select_outfit_fs
		case 0x578ee2b6
		case mp_faceoff_character_hub_fs
		case mp_faceoff_character_select_fs
		case mp_faceoff_select_guitar
		case mp_faceoff_select_bass_fs
		case mp_faceoff_select_guitar_finish_fs
		case mp_faceoff_select_guitar_fs
		case mp_faceoff_select_outfit_fs
		case mp_faceoff_select_style_fs
		case mp_faceoff_split_off_flow_for_character_hub_fs
		case mp_faceoff_split_off_flow_for_character_select_fs
		case online_character_hub_fs
		case online_character_select_fs
		case online_select_guitar_fs
		case online_select_bass_fs
		case online_select_guitar_finish_fs
		case online_select_outfit_fs
		case online_select_style_fs
		case store_characters_fs
		case store_outfits_fs
		case store_styles_fs
		case store_fs
		0x09bd99e0
		default
		0xd29091c0
	endswitch
endscript

script create_photobot_debug_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	CreateScreenElement {
		Type = VScrollingMenu
		parent = pause_menu
		id = photobot_debug_menu
		just = [left top]
		dims = (400.0, 480.0)
		Pos = ($menu_pos - (30.0, 0.0))
	}
	CreateScreenElement \{Type = VMenu
		parent = photobot_debug_menu
		id = photobot_debug_vmenu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_menu_pad_back
				params = {
					callback = back_to_debug_menu
				}
			}
		]}
	array_entry = 0
	array_Size = 6
	begin
	get_LevelZoneArray_checksum index = <array_entry>
	formatText TextName = opt_text1 '1st Half at %v' v = ($LevelZones.<level_checksum>.title)
	formatText TextName = opt_text2 '2nd Half at %v' v = ($LevelZones.<level_checksum>.title)
	CreateScreenElement {
		Type = TextElement
		parent = photobot_debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <opt_text1>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose photobot_startup params = {venue = <array_entry> section = 0}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		parent = photobot_debug_vmenu
		font = text_a1
		Scale = 0.75
		rgba = [210 210 210 250]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		text = <opt_text2>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose photobot_startup params = {venue = <array_entry> section = 1}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	LaunchEvent \{Type = focus
		target = photobot_debug_vmenu}
endscript

script destroy_photobot_debug_menu 
	if ScreenElementExists \{id = photobot_debug_menu}
		DestroyScreenElement \{id = photobot_debug_menu}
	endif
	destroy_generic_backdrop
endscript

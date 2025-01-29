interleave_animations = 0
show_2d_particles = 1
disable_screen_fx = 0
menu_pos = (675.0, 100.0)

script create_debug_backdrop 
	destroy_debug_backdrop
	createscreenelement \{type = spriteelement
		parent = root_window
		id = debug_backdrop
		pos = (640.0, 0.0)
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
	createscreenelement \{type = vscrollingmenu
		parent = pause_menu
		id = debug_scrolling_menu
		just = [
			left
			top
		]
		dims = (400.0, 480.0)
		pos = $menu_pos}
	createscreenelement \{type = vmenu
		parent = debug_scrolling_menu
		id = debug_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Unlock All"
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
				playday_unlockall
			}
		]}
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Repeat Last Song"
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		id = toggle_playermode_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Play Song: 1p_quickplay"
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Settings"
		z_priority = 100.0
		just = [
			left
			top
		]
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Character Select"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Skip Into Song"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Save Replay Buffer"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Load Replay"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Play Credits"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Difficulty Analyzer"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle Changelist Number"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "UI Physics Test"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
	createscreenelement \{type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle FPS Display"
		just = [
			left
			top
		]
		z_priority = 100.0
		shadow
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
				togglefps
			}
		]}
	if ($interleave_animations = 1)
		<interleave_text> = "Interleaved Animations (on)"
	else
		<interleave_text> = "Interleaved Animations (off)"
	endif
	createscreenelement {
		type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <interleave_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_interleaved_animations}
		]
	}
	if ($show_2d_particles = 1)
		<show_2d_text> = "Show 2D Particles (on)"
	else
		<show_2d_text> = "Show 2D Particles (off)"
	endif
	createscreenelement {
		type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <show_2d_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_show_2d_particles}
		]
	}
	if ($disable_screen_fx = 1)
		<fx_text> = "Disable Screen FX (on)"
	else
		<fx_text> = "Disable Screen FX (off)"
	endif
	createscreenelement {
		type = textelement
		parent = debug_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <fx_text>
		just = [left top]
		z_priority = 100.0
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_disable_screen_fx}
		]
	}
	launchevent \{type = focus
		target = debug_vmenu}
endscript

script destroy_debugging_menu 
	if screenelementexists \{id = debug_scrolling_menu}
		destroyscreenelement \{id = debug_scrolling_menu}
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
	destroy_debugging_menu
endscript
debug_playcredits_active = 0

script debug_playcredits 
	kill_gem_scroller
	destroy_debugging_menu
	reset_score \{player_status = player1_status}
	change \{end_credits = 1}
	change \{debug_playcredits_active = 1}
	progression_endcredits
endscript

script debug_difficulty_analyzer 
	ui_menu_select_sfx
	destroy_difficulty_menu
	destroy_debugging_menu
	create_debug_backdrop
	create_generic_backdrop
	x_pos = 500
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = song_scrolling_menu
		just = [left top]
		dims = (400.0, 500.0)
		pos = ($menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	createscreenelement \{type = vmenu
		parent = song_scrolling_menu
		id = song_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement {
		type = textelement
		parent = song_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <song_title>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{focus wait_for_diff_analyzer params = {<...>}}
			{pad_choose killspawnedscript params = {name = wait_for_diff_analyzer_spawned}}
			{pad_choose create_difficulty_analyzer_difficulty_menu params = {difficulty = all song_name = <song_checksum>}}
		]
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	createscreenelement {
		type = textelement
		parent = song_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = "OUTPUT ALL SCORE DATA"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{focus wait_for_diff_analyzer params = {<...>}}
			{focus killspawnedscript params = {name = wait_for_diff_analyzer_spawned}}
			{pad_choose create_difficulty_analyzer_difficulty_menu params = {difficulty = all song_name = debug_output}}
		]
	}
	launchevent \{type = focus
		target = song_vmenu}
endscript

script difficulty_analyzer_back 
	killspawnedscript \{name = wait_for_diff_analyzer_spawned}
	destroy_debug_backdrop
	destroy_difficulty_analyzer
	generic_menu_pad_back \{callback = back_to_debug_menu}
endscript

script destroy_difficulty_analyzer_menu 
	if screenelementexists \{id = song_scrolling_menu}
		destroyscreenelement \{id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
	destroy_debug_backdrop
endscript

script wait_for_diff_analyzer 
	killspawnedscript \{name = wait_for_diff_analyzer_spawned}
	spawnscriptnow wait_for_diff_analyzer_spawned params = {<...>}
endscript

script wait_for_diff_analyzer_spawned 
	wait \{0.5
		seconds}
	difficulty_analyzer_show difficulty = all song_name = <song_checksum>
endscript

script create_difficulty_analyzer_difficulty_menu 
	destroy_difficulty_analyzer_menu
	destroy_difficulty_menu
	create_debug_backdrop
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = difficulty_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = difficulty_menu
		id = difficulty_vmenu
		pos = (0.0, 0.0)
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
	getarraysize \{$difficulty_list}
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
	createscreenelement {
		type = textelement
		parent = difficulty_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <difficulty_text>
		just = [left top]
		z_priority = 100.0
		event_handlers = <events>
	}
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	if (<song_name> = debug_output)
		<events> = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose output_diff_scores params = {all}}
		]
		createscreenelement {
			type = textelement
			parent = difficulty_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = "ALL"
			just = [left top]
			z_priority = 100.0
			event_handlers = <events>
		}
	endif
	launchevent \{type = focus
		target = difficulty_vmenu}
endscript

script back_to_online_menu 
	printf \{"---back_to_online_menu"}
	quit_network_game
	destroy_create_session_menu
	create_online_menu
endscript

script create_songversion_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = songversion_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (40.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = songversion_scrolling_menu
		id = songversion_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = songversion_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Play GH3_XP1 Song"
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
	createscreenelement \{type = textelement
		parent = songversion_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Play GH2 Song"
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
	createscreenelement \{type = textelement
		parent = songversion_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Play GH1 Song"
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
	launchevent \{type = focus
		target = songversion_vmenu}
endscript

script back_to_songversion_menu 
	destroy_song_menu
	create_songversion_menu
endscript

script destroy_songversion_menu 
	if screenelementexists \{id = songversion_scrolling_menu}
		destroyscreenelement \{id = songversion_scrolling_menu}
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
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = song_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	createscreenelement \{type = vmenu
		parent = song_scrolling_menu
		id = song_vmenu
		pos = (0.0, 0.0)
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
		createscreenelement {
			type = textelement
			parent = song_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <song_title>
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_difficulty_menu params = {song_name = <song_checksum> version = <version> player = 1}}
			]
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = song_vmenu}
endscript

script back_to_song_menu 
	destroy_difficulty_menu
	create_song_menu version = <version>
endscript

script destroy_song_menu 
	if screenelementexists \{id = song_scrolling_menu}
		destroyscreenelement \{id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_difficulty_menu 
	destroy_song_menu
	destroy_difficulty_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = difficulty_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement {
		type = vmenu
		parent = difficulty_menu
		id = difficulty_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = back_to_song_menu version = <version>}}
		]
	}
	array_entry = 0
	getarraysize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text difficulty = <difficulty_count>
	if (<player> = 2)
		createscreenelement {
			type = textelement
			parent = difficulty_vmenu
			font = text_a1
			scale = 0.75
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
			createscreenelement {
				type = textelement
				parent = difficulty_vmenu
				font = text_a1
				scale = 0.75
				rgba = [210 210 210 250]
				text = <difficulty_text>
				just = [left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose create_difficulty_menu params = {song_name = <song_name> version = <version> difficulty = ($difficulty_list [<array_entry>]) player = 2}}
				]
			}
		else
			createscreenelement {
				type = textelement
				parent = difficulty_vmenu
				font = text_a1
				scale = 0.75
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
	repeat <array_size>
	launchevent \{type = focus
		target = difficulty_vmenu}
endscript

script destroy_difficulty_menu 
	if screenelementexists \{id = difficulty_menu}
		destroyscreenelement \{id = difficulty_menu}
	endif
	destroy_generic_backdrop
endscript

script create_settings_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = settings_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = settings_scrolling_menu
		id = settings_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Venue"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Guitar"
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
					type = guitar
				}
			}
		]}
	createscreenelement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Bass"
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
					type = bass
				}
			}
		]}
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_visibility_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle visibility"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = select_slomo_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Select Slomo : 1.0"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_showmeasures_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Show Measures"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_showcameraname_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Show Camera Name"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_inputlog_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Show Input Log"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_botp1_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle Bot P1"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_botp2_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle Bot P2"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = edit_inputlog_lines_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Input Log Lines"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_tilt_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Show Input Log"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_leftyflip_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Leftyflip"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = create_cameracut_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Select CameraCut"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle GPU Time"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle CPU Time"
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
	createscreenelement \{type = textelement
		parent = settings_vmenu
		id = toggle_forcescore_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Force Score"
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
	launchevent \{type = focus
		target = settings_vmenu}
endscript

script playday_unlockall 
	difficulties = [easy medium hard expert]
	stored_difficulty1 = ($current_difficulty)
	stored_difficulty2 = ($current_difficulty2)
	stored_band = ($current_band)
	stored_gamemode = ($game_mode)
	if ($progression_pop_count = 1)
		popped = 1
		progression_push_current
	else
		popped = 0
	endif
	diff_index = 0
	begin
	change current_difficulty = (<difficulties> [<diff_index>])
	change current_difficulty2 = (<difficulties> [<diff_index>])
	band_index = 1
	begin
	change current_band = <band_index>
	change \{game_mode = p1_career}
	progression_pop_current
	get_progression_globals \{game_mode = p1_career}
	globaltags_unlockall songlist = <tier_global>
	progression_push_current
	band_index = (<band_index> + 1)
	repeat 5
	globaltags_unlockall \{songlist = gh3_general_songs}
	globaltags_unlockall \{songlist = gh3_bonus_songs}
	<diff_index> = (<diff_index> + 1)
	repeat 4
	getarraysize ($gh3_bonus_songs.tier1.songs)
	i = 0
	begin
	setglobaltags ($gh3_bonus_songs.tier1.songs [<i>]) params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat <array_size>
	i = 5
	getarraysize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<i>].id)
	setglobaltags <video_checksum> params = {unlocked = 1}
	<i> = (<i> + 1)
	repeat (<array_size> - 5)
	change \{structurename = player1_status
		new_cash = 0}
	change \{progression_play_completion_movie = 0}
	change \{progression_unlock_tier_last_song = 0}
	change current_difficulty = <stored_difficulty1>
	change current_difficulty2 = <stored_difficulty2>
	change current_band = <stored_band>
	change game_mode = <stored_gamemode>
	if (<popped> = 1)
		progression_pop_current
	endif
endscript

script back_to_settings_menu 
	destroy_changevenue_menu
	destroy_changehighway_menu
	destroy_changeguitar_menu
	destroy_togglevisibility_menu
	destroy_cameracut_group_menu
	create_settings_menu
endscript

script back_to_cameracut_group_menu 
	destroy_cameracut_menu
	create_cameracut_group_menu
endscript

script destroy_settings_menu 
	if screenelementexists \{id = settings_scrolling_menu}
		destroyscreenelement \{id = settings_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
cameracutprefixarray = [
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
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = selectcameracut_scrolling_group_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = selectcameracut_scrolling_group_menu
		id = selectcameracut_group_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = selectcameracut_group_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "off"
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
					camera_array_pakname = none
					camera_array = none
					array_count = none
				}
			}
		]}
	getpakmancurrentname \{map = zones}
	camera_count = 0
	getarraysize \{$cameracutprefixarray}
	camera_array_size = <array_size>
	begin
	formattext checksumname = camera_array '%s_%p' s = <pakname> p = ($cameracutprefixarray [<camera_count>])
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		if (<array_size>)
			formattext textname = camera_group "%p" p = ($cameracutprefixarray [<camera_count>])
			createscreenelement {
				type = textelement
				parent = selectcameracut_group_vmenu
				font = text_a1
				scale = 0.75
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
	launchevent \{type = focus
		target = selectcameracut_group_vmenu}
endscript

script create_cameracut_menu 
	if NOT gotparam \{camera_count}
		create_cameracut_group_menu
		return
	endif
	ui_menu_select_sfx
	destroy_cameracut_group_menu
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = selectcameracut_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = selectcameracut_scrolling_menu
		id = selectcameracut_vmenu
		pos = (0.0, 0.0)
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
	getpakmancurrentname \{map = zones}
	formattext checksumname = camera_array '%s_%p' s = <pakname> p = ($cameracutprefixarray [<camera_count>])
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		array_count = 0
		begin
		formattext textname = camera_name "%s_%p_%i" s = <pakname> p = ($cameracutprefixarray [<camera_count>]) i = <array_count>
		if structurecontains structure = ($<camera_array> [<array_count>]) name
			formattext textname = camera_name "%s" s = ($<camera_array> [<array_count>].name) dontassertforchecksums
		elseif structurecontains structure = ($<camera_array> [<array_count>]) params
			if structurecontains structure = ($<camera_array> [<array_count>].params) name
				formattext textname = camera_name "%s" s = ($<camera_array> [<array_count>].params.name) dontassertforchecksums
			endif
		endif
		createscreenelement {
			type = textelement
			parent = selectcameracut_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <camera_name>
			z_priority = 100.0
			just = [left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_cameracut params = {camera_array_pakname = <pakname> camera_array = ($cameracutprefixarray [<camera_count>]) array_count = <array_count>}}
				{pad_square select_cameracut params = {camera_array_pakname = <pakname> camera_array = ($cameracutprefixarray [<camera_count>]) array_count = <array_count> jumptoviewer}}
			]
		}
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	launchevent \{type = focus
		target = selectcameracut_vmenu}
endscript

script back_to_cameracut_menu 
	create_cameracut_menu
endscript

script destroy_cameracut_menu 
	if screenelementexists \{id = selectcameracut_scrolling_menu}
		destroyscreenelement \{id = selectcameracut_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script destroy_cameracut_group_menu 
	if screenelementexists \{id = selectcameracut_scrolling_group_menu}
		destroyscreenelement \{id = selectcameracut_scrolling_group_menu}
	endif
	destroy_generic_backdrop
endscript
debug_camera_array = none
debug_camera_array_pakname = none
debug_camera_array_count = 0

script select_cameracut 
	ui_menu_select_sfx
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <camera_array_pakname>
	change debug_camera_array_count = <array_count>
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
	if gotparam \{jumptoviewer}
		destroy_all_debug_menus
		unpausegh3
		enable_pause
		change \{viewer_buttons_enabled = 1}
		toggleviewmode
	endif
endscript

script create_character_viewer_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = character_viewer_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos - (30.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = character_viewer_scrolling_menu
		id = character_viewer_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Guitarist"
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
	createscreenelement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Bassist"
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
	createscreenelement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Vocalist"
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
	createscreenelement \{type = textelement
		parent = character_viewer_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Change Drummer"
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
	launchevent \{type = focus
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
	if screenelementexists \{id = character_viewer_scrolling_menu}
		destroyscreenelement \{id = character_viewer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitarist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = changeguitarist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = changeguitarist_scrolling_menu
		id = changeguitarist_vmenu
		pos = (0.0, 0.0)
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
	type = (<profile_struct>.type)
	if ((<type> = guitarist) || (<type> = any))
		createscreenelement {
			type = textelement
			parent = changeguitarist_vmenu
			font = text_a1
			scale = 0.75
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
	repeat <array_size>
	launchevent \{type = focus
		target = changeguitarist_vmenu}
endscript

script destroy_changeguitarist_menu 
	if screenelementexists \{id = changeguitarist_scrolling_menu}
		destroyscreenelement \{id = changeguitarist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script debug_menu_choose_guitarist 
	kill_gem_scroller
	get_musician_profile_struct index = <index>
	formattext checksumname = guitarist_id '%s' s = (<profile_struct>.name)
	change structurename = player1_status character_id = <guitarist_id>
	if NOT create_guitarist \{useoldpos}
		downloadcontentlost
	endif
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = <device_num>
endscript

script create_changebassist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = changebassist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = changebassist_scrolling_menu
		id = changebassist_vmenu
		pos = (0.0, 0.0)
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
	type = (<profile_struct>.type)
	if ((<type> = bassist) || (<type> = any))
		createscreenelement {
			type = textelement
			parent = changebassist_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.fullname)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_bassist params = {profile_name = (<profile_struct>.name) useoldpos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changebassist_vmenu}
endscript

script destroy_changebassist_menu 
	if screenelementexists \{id = changebassist_scrolling_menu}
		destroyscreenelement \{id = changebassist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changevocalist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = changevocalist_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = changevocalist_scrolling_menu
		id = changevocalist_vmenu
		pos = (0.0, 0.0)
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
	type = (<profile_struct>.type)
	if ((<type> = vocalist) || (<type> = any))
		createscreenelement {
			type = textelement
			parent = changevocalist_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_vocalist params = {profile_name = (<info_struct>.name) useoldpos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changevocalist_vmenu}
endscript

script destroy_changevocalist_menu 
	if screenelementexists \{id = changevocalist_scrolling_menu}
		destroyscreenelement \{id = changevocalist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changedrummer_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = changedrummer_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = changedrummer_scrolling_menu
		id = changedrummer_vmenu
		pos = (0.0, 0.0)
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
	type = (<profile_struct>.type)
	if ((<type> = drummer) || (<type> = any))
		createscreenelement {
			type = textelement
			parent = changedrummer_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<profile_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_drummer params = {profile_name = (<info_struct>.name) useoldpos}}
			]
		}
	endif
	index = (<index> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changedrummer_vmenu}
endscript

script destroy_changedrummer_menu 
	if screenelementexists \{id = changedrummer_scrolling_menu}
		destroyscreenelement \{id = changedrummer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_playermode 
	change player1_device = <device_num>
	translate_gamemode
	create_songversion_menu
endscript
debug_with_rhythm = 0
force_coop = 0

script translate_gamemode 
	switch $game_mode
		case p1_quickplay
		if ($debug_with_rhythm)
			change \{structurename = player1_status
				part = rhythm}
		else
			change \{structurename = player1_status
				part = guitar}
		endif
		change \{current_num_players = 1}
		case p1_career
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
		case p1_improv
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
		case p1_boss
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
		case p2_quickplay
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = rhythm}
		change \{current_num_players = 2}
		case p2_faceoff
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = guitar}
		change \{current_num_players = 2}
		case p2_coop
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = rhythm}
		change \{current_num_players = 2}
		case p2_battle
		change \{structurename = player1_status
			part = guitar}
		change \{structurename = player2_status
			part = guitar}
		change \{current_num_players = 2}
		case training
		change \{structurename = player1_status
			part = guitar}
		change \{current_num_players = 1}
	endswitch
endscript

script toggle_playermode_left 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				change \{debug_with_rhythm = 0}
			else
				change \{force_coop = 0}
				change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				change \{debug_with_rhythm = 0}
			else
				change \{game_mode = training}
			endif
		endif
		case p2_quickplay
		change \{force_coop = 1}
		change \{debug_with_rhythm = 1}
		change \{game_mode = p1_quickplay}
		case p1_career
		change \{game_mode = p2_quickplay}
		case p1_improv
		change \{game_mode = p1_career}
		case p1_boss
		change \{game_mode = p1_improv}
		case p2_faceoff
		change \{game_mode = p1_boss}
		case p2_coop
		change \{game_mode = p2_faceoff}
		case p2_battle
		change \{game_mode = p2_coop}
		case training
		change \{game_mode = p2_battle}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				change \{game_mode = p2_quickplay}
				change \{force_coop = 0}
			else
				change \{debug_with_rhythm = 1}
			endif
		else
			if ($debug_with_rhythm)
				change \{force_coop = 1}
				change \{debug_with_rhythm = 0}
			else
				change \{debug_with_rhythm = 1}
			endif
		endif
		case p2_quickplay
		change \{game_mode = p1_career}
		case p1_career
		change \{game_mode = p1_improv}
		case p1_improv
		change \{game_mode = p1_boss}
		case p1_boss
		change \{game_mode = p2_faceoff}
		case p2_faceoff
		change \{game_mode = p2_coop}
		case p2_coop
		change \{game_mode = p2_battle}
		case p2_battle
		change \{game_mode = training}
		case training
		change \{game_mode = p1_quickplay}
		change \{debug_with_rhythm = 0}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	switch $game_mode
		case p1_quickplay
		if ($force_coop)
			if ($debug_with_rhythm)
				toggle_playermode_menuitem :setprops \{text = "Play Song: p1_quickplay with rhythm coop"}
			else
				toggle_playermode_menuitem :setprops \{text = "Play Song: p1_quickplay coop"}
			endif
		else
			if ($debug_with_rhythm)
				toggle_playermode_menuitem :setprops \{text = "Play Song: p1_quickplay with rhythm"}
			else
				toggle_playermode_menuitem :setprops \{text = "Play Song: p1_quickplay"}
			endif
		endif
		case p2_quickplay
		toggle_playermode_menuitem :setprops \{text = "Play Song: p2_quickplay"}
		case p1_career
		toggle_playermode_menuitem :setprops \{text = "Play Song: p1_career"}
		case p1_improv
		toggle_playermode_menuitem :setprops \{text = "Play Song: p1_improv"}
		case p1_boss
		toggle_playermode_menuitem :setprops \{text = "Play Song: p1_boss"}
		case p2_faceoff
		toggle_playermode_menuitem :setprops \{text = "Play Song: p2_faceoff"}
		case p2_coop
		toggle_playermode_menuitem :setprops \{text = "Play Song: p2_coop"}
		case p2_battle
		toggle_playermode_menuitem :setprops \{text = "Play Song: p2_battle"}
		case training
		toggle_playermode_menuitem :setprops \{text = "Play Song: training"}
	endswitch
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	casttointeger \{speedfactor}
	speedfactor = (<speedfactor> + 1)
	if (<speedfactor> > 10)
		speedfactor = 1
	endif
	if (<speedfactor> < 1)
		speedfactor = 1
	endif
	change current_speedfactor = (<speedfactor> / 10.0)
	update_slomo
	select_slomo_setprop
endscript

script update_slomo 
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	change structurename = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	change structurename = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	player = (<player> + 1)
	repeat $current_num_players
endscript

script select_slomo_setprop 
	formattext \{textname = slomo_text
		"Select Slomo : %s"
		s = $current_speedfactor}
	select_slomo_menuitem :setprops text = <slomo_text>
endscript
debug_showmeasures = off

script toggle_showmeasures 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_measures_text}
		destroyscreenelement \{id = debug_measures_text}
	endif
	if ($debug_showmeasures = off)
		change \{debug_showmeasures = on}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_measures_text
			font = text_a1
			text = "M: 0 : B: 00"
			scale = 1
			pos = (850.0, 400.0)
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
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]
			hide}
		if ($playing_song = 1)
			debug_measures_text :setprops \{unhide}
		endif
	else
		change \{debug_showmeasures = off}
	endif
	toggle_showmeasures_setprop
endscript

script toggle_showmeasures_setprop 
	if ($debug_showmeasures = off)
		toggle_showmeasures_menuitem :setprops \{text = "Show Measures : off"}
	else
		toggle_showmeasures_menuitem :setprops \{text = "Show Measures : on"}
	endif
endscript
debug_showcameraname = off

script toggle_showcameraname 
	ui_menu_select_sfx
	if screenelementexists \{id = debug_camera_name_text}
		destroyscreenelement \{id = debug_camera_name_text}
	endif
	if ($debug_showcameraname = off)
		change \{debug_showcameraname = on}
		createscreenelement \{type = textelement
			parent = root_window
			id = debug_camera_name_text
			font = text_a1
			pos = (640.0, 32.0)
			just = [
				center
				top
			]
			scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			text = "Camera Name"
			z_priority = 100.0
			z_priority = 1.0
			alpha = 1}
	else
		change \{debug_showcameraname = off}
	endif
	toggle_showcameraname_setprop
	cameracuts_updatedebugcameraname
endscript

script toggle_inputlog 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_play_log = 0)
		change \{show_play_log = 1}
	else
		change \{show_play_log = 0}
	endif
	toggle_inputlog_setprop
	init_play_log
endscript

script toggle_botp1 
	ui_menu_select_sfx
	kill_debug_elements
	change structurename = player1_status bot_play = (1 - ($player1_status.bot_play))
	toggle_botp1_setprop
endscript

script toggle_botp2 
	ui_menu_select_sfx
	kill_debug_elements
	change structurename = player2_status bot_play = (1 - ($player2_status.bot_play))
	toggle_botp2_setprop
endscript

script edit_inputlog_lines_left 
	ui_menu_select_sfx
	kill_debug_elements
	change play_log_lines = ($play_log_lines -1)
	if ($play_log_lines < 1)
		change \{play_log_lines = 1}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script edit_inputlog_lines_right 
	ui_menu_select_sfx
	kill_debug_elements
	change play_log_lines = ($play_log_lines + 1)
	if ($play_log_lines > 10)
		change \{play_log_lines = 10}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script toggle_tilt 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_guitar_tilt = 0)
		change \{show_guitar_tilt = 1}
	else
		change \{show_guitar_tilt = 0}
	endif
	toggle_tilt_setprop
	init_play_log
endscript

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = off)
		toggle_showcameraname_menuitem :setprops \{text = "Show Camera Name : off"}
	else
		toggle_showcameraname_menuitem :setprops \{text = "Show Camera Name : on"}
	endif
endscript

script toggle_inputlog_setprop 
	if ($show_play_log = 0)
		toggle_inputlog_menuitem :setprops \{text = "Show Input Log : off"}
	else
		toggle_inputlog_menuitem :setprops \{text = "Show Input Log : on"}
	endif
endscript

script toggle_botp1_setprop 
	if (($player1_status.bot_play) = 0)
		toggle_botp1_menuitem :setprops \{text = "Toggle Bot P1: Off"}
	else
		toggle_botp1_menuitem :setprops \{text = "Toggle Bot P1: On"}
	endif
endscript

script toggle_botp2_setprop 
	if (($player2_status.bot_play) = 0)
		toggle_botp2_menuitem :setprops \{text = "Toggle Bot P2: Off"}
	else
		toggle_botp2_menuitem :setprops \{text = "Toggle Bot P2: On"}
	endif
endscript

script edit_inputlog_lines_setprop 
	formattext textname = text "Input Log Lines: %l" l = ($play_log_lines) dontassertforchecksums
	edit_inputlog_lines_menuitem :setprops text = <text>
endscript

script toggle_tilt_setprop 
	if ($show_guitar_tilt = 0)
		toggle_tilt_menuitem :setprops \{text = "Show Tilt : off"}
		killspawnedscript \{name = show_tilt_loop}
	else
		toggle_tilt_menuitem :setprops \{text = "Show Tilt : on"}
		spawnscriptlater \{show_tilt_loop}
	endif
endscript

script show_tilt_loop 
	if NOT screenelementexists \{id = show_tilt_test}
		createscreenelement \{type = textelement
			parent = root_window
			id = show_tilt_test
			pos = (320.0, 240.0)
			font = text_a1
			text = ""}
	endif
	begin
	guitargetanalogueinfo
	rgba = [255 255 255 255]
	getglobaltags \{user_options}
	star_power_position = <star_power_position_device_0>
	if (<righty> <= <star_power_position>)
		rgba = [255 64 64 255]
	endif
	formattext textname = text "%d" d = <righty>
	setscreenelementprops {
		id = show_tilt_test
		text = <text>
		rgba = <rgba>
	}
	wait \{5
		frames}
	repeat
endscript

script toggle_leftyflip 
	ui_menu_select_sfx
	getglobaltags \{user_options}
	if (<lefty_flip_p1> = 0)
		setglobaltags \{user_options
			params = {
				lefty_flip_p1 = 1
			}}
	else
		setglobaltags \{user_options
			params = {
				lefty_flip_p1 = 0
			}}
	endif
	getglobaltags \{user_options}
	change structurename = <player_status> lefthanded_gems = <lefty_flip_p1>
	change structurename = <player_status> lefthanded_button_ups = <lefty_flip_p1>
	toggle_leftyflip_setprop
endscript

script toggle_leftyflip_setprop 
	getglobaltags \{user_options}
	if (<lefty_flip_p1> = 0)
		toggle_leftyflip_menuitem :setprops \{text = "Lefty Flip : off"}
	else
		toggle_leftyflip_menuitem :setprops \{text = "Lefty Flip : on"}
	endif
endscript
debug_forcescore = off

script toggle_forcescore 
	ui_menu_select_sfx
	switch $debug_forcescore
		case off
		change \{debug_forcescore = poor}
		case poor
		change \{debug_forcescore = medium}
		case medium
		change \{debug_forcescore = good}
		case good
		change \{debug_forcescore = off}
		default
		change \{debug_forcescore = off}
	endswitch
	crowdincrease \{player_status = player1_status}
	toggle_forcescore_setprop
endscript

script toggle_forcescore_setprop 
	switch $debug_forcescore
		case off
		toggle_forcescore_menuitem :setprops \{text = "Force Score : off"}
		case poor
		toggle_forcescore_menuitem :setprops \{text = "Force Score : poor"}
		case medium
		toggle_forcescore_menuitem :setprops \{text = "Force Score : medium"}
		case good
		toggle_forcescore_menuitem :setprops \{text = "Force Score : good"}
		default
		toggle_forcescore_menuitem :setprops \{text = "Force Score : off"}
	endswitch
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = changevenue_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = changevenue_scrolling_menu
		id = changevenue_vmenu
		pos = (0.0, 0.0)
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
	get_levelzonearray_size
	array_count = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	createscreenelement {
		type = textelement
		parent = changevenue_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = ($levelzones.<level_checksum>.title)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose select_venue params = {level = <level_checksum> norestart}}
		]
	}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	create_changevenue_menu
endscript

script destroy_changevenue_menu 
	if screenelementexists \{id = changevenue_scrolling_menu}
		destroyscreenelement \{id = changevenue_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_venue 
	ui_menu_select_sfx
	kill_gem_scroller
	resetwaypoints
	if gotparam \{level}
		change current_level = <level>
	endif
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	changenodeflag \{ls_3_5_pre
		1}
	changenodeflag \{ls_3_5_post
		0}
	changenodeflag \{ls_encore_pre
		1}
	changenodeflag \{ls_encore_post
		0}
	destroypakmanmap \{map = zones}
	mempushcontext \{heap_zones}
	createpakmanmap \{map = zones
		links = gh3zones
		folder = 'zones/'
		uselinkslots}
	mempopcontext
	load_venue \{block_scripts = 1}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		spawnscriptnow \{testlevel_debug}
	else
		if NOT create_band
			downloadcontentlost
		endif
		create_crowd_models
		crowd_reset \{player_status = player1_status
			player = 1}
	endif
	enable_pause
	restore_start_key_binding
	if NOT gotparam \{norestart}
		gh3_start_pressed
		restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = ($current_starttime) device_num = <device_num>
	else
		toggleviewmode \{viewerreload}
		toggleviewmode \{viewerreload}
	endif
endscript

script testlevel_debug 
	begin
	if controllermake \{circle
			0}
		next_peds
	endif
	if controllermake \{circle
			1}
		next_peds
	endif
	wait \{1
		gameframe}
	repeat
endscript
debug_ped_row = 0

script next_peds 
	kill \{prefix = z_testlevel_peds_row0}
	kill \{prefix = z_testlevel_peds_row1}
	kill \{prefix = z_testlevel_peds_row2}
	kill \{prefix = z_testlevel_peds_row3}
	kill \{prefix = z_testlevel_peds_row4}
	kill \{prefix = z_testlevel_peds_row5}
	kill \{prefix = z_testlevel_peds_row6}
	kill \{prefix = z_testlevel_peds_row7}
	wait \{1
		gameframe}
	begin
	change debug_ped_row = ($debug_ped_row + 1)
	formattext checksumname = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if isalive prefix = <row>
		break
	else
		change \{debug_ped_row = -1}
	endif
	repeat
endscript

script back_to_changehighway_menu 
	create_changehighway_menu
endscript

script destroy_changehighway_menu 
	if screenelementexists \{id = changehighway_scrolling_menu}
		destroyscreenelement \{id = changehighway_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitar_menu \{type = guitar}
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = changeguitar_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = changeguitar_scrolling_menu
		id = changeguitar_vmenu
		pos = (0.0, 0.0)
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
	if (<type> = (<info_struct>.type))
		printf "Creating %i" i = (<info_struct>.name)
		createscreenelement {
			type = textelement
			parent = changeguitar_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = (<info_struct>.name)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_guitar params = {guitar = <array_count> type = <type>}}
			]
		}
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	launchevent \{type = focus
		target = changeguitar_vmenu}
endscript

script back_to_changeguitar_menu 
	create_changeguitar_menu
endscript

script destroy_changeguitar_menu 
	if screenelementexists \{id = changeguitar_scrolling_menu}
		destroyscreenelement \{id = changeguitar_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_guitar \{type = guitar}
	ui_menu_select_sfx
	kill_gem_scroller
	if (<type> = guitar)
		get_musician_instrument_struct index = <guitar>
		change structurename = player1_status instrument_id = (<info_struct>.desc_id)
	else
		get_musician_instrument_struct index = <guitar>
		change current_bass_model = (<info_struct>.desc_id)
	endif
	select_start_song
endscript
hidebytype_list = [
	'real_crowd'
	'stage'
	'scene_ped'
]
hidebytype_visible = [
	on
	on
	on
]

script create_togglevisibility_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = togglevisibility_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = togglevisibility_scrolling_menu
		id = togglevisibility_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = togglevisibility_vmenu
		id = toggle_bandvisible_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle band"
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
	getarraysize \{$hidebytype_list}
	array_count = 0
	begin
	formattext checksumname = type_checksum '%s' s = ($hidebytype_list [<array_count>])
	formattext checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($hidebytype_list [<array_count>])
	createscreenelement {
		type = textelement
		parent = togglevisibility_vmenu
		id = <menuitem_checksum>
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = ""
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_hidebytype params = {type = type_checksum array_count = <array_count>}}
		]
	}
	array_count = (<array_count> + 1)
	repeat <array_size>
	toggle_hidebytype_setprop
	createscreenelement \{type = textelement
		parent = togglevisibility_vmenu
		id = toggle_highway_menuitem
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Toggle highway"
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
	launchevent \{type = focus
		target = togglevisibility_vmenu}
endscript

script back_to_togglevisibility_menu 
	create_togglevisibility_menu
endscript

script destroy_togglevisibility_menu 
	if screenelementexists \{id = togglevisibility_scrolling_menu}
		destroyscreenelement \{id = togglevisibility_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
highwayvisible = on

script toggle_highway 
	ui_menu_select_sfx
	if ($highwayvisible = off)
		if screenelementexists \{id = gem_containerp1}
			doscreenelementmorph \{id = gem_containerp1
				alpha = 1}
		endif
		if screenelementexists \{id = gem_containerp2}
			doscreenelementmorph \{id = gem_containerp2
				alpha = 1}
		endif
		enable_highway_prepass
		change \{highwayvisible = on}
	else
		if screenelementexists \{id = gem_containerp1}
			doscreenelementmorph \{id = gem_containerp1
				alpha = 0}
		endif
		if screenelementexists \{id = gem_containerp2}
			doscreenelementmorph \{id = gem_containerp2
				alpha = 0}
		endif
		disable_highway_prepass
		change \{highwayvisible = off}
	endif
	toggle_highway_setprop
endscript

script toggle_highway_setprop 
	if ($highwayvisible = off)
		toggle_highway_menuitem :setprops \{text = "Toggle highway : off"}
	else
		toggle_highway_menuitem :setprops \{text = "Toggle highway : on"}
	endif
endscript
bandvisible = on

script toggle_bandvisible 
	ui_menu_select_sfx
	if ($bandvisible = off)
		change \{bandvisible = on}
	else
		change \{bandvisible = off}
	endif
	set_bandvisible
	toggle_bandvisible_setprop
endscript

script set_bandvisible 
	if ($bandvisible = off)
		if compositeobjectexists \{guitarist}
			guitarist :hide
		endif
		if compositeobjectexists \{vocalist}
			vocalist :hide
		endif
		if compositeobjectexists \{bassist}
			bassist :hide
		endif
		if compositeobjectexists \{rhythm}
			rhythm :hide
		endif
		if compositeobjectexists \{drummer}
			drummer :hide
		endif
	else
		if compositeobjectexists \{guitarist}
			guitarist :unhide
		endif
		if compositeobjectexists \{vocalist}
			vocalist :unhide
		endif
		if compositeobjectexists \{bassist}
			bassist :unhide
		endif
		if compositeobjectexists \{rhythm}
			rhythm :unhide
		endif
		if compositeobjectexists \{drummer}
			drummer :unhide
		endif
	endif
endscript

script toggle_bandvisible_setprop 
	if ($bandvisible = off)
		toggle_bandvisible_menuitem :setprops \{text = "Toggle band : off"}
	else
		toggle_bandvisible_menuitem :setprops \{text = "Toggle band : on"}
	endif
endscript

script toggle_hidebytype 
	ui_menu_select_sfx
	if (($hidebytype_visible [<array_count>]) = off)
		setarrayelement arrayname = hidebytype_visible globalarray index = <array_count> newvalue = on
	else
		setarrayelement arrayname = hidebytype_visible globalarray index = <array_count> newvalue = off
	endif
	set_hidebytype
	toggle_hidebytype_setprop
endscript

script set_hidebytype 
	getarraysize \{$hidebytype_list}
	array_count = 0
	begin
	formattext checksumname = type_checksum '%s' s = ($hidebytype_list [<array_count>])
	if (($hidebytype_visible [<array_count>]) = off)
		hideobjectbytype type = <type_checksum>
	else
		hideobjectbytype type = <type_checksum> unhide
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script toggle_hidebytype_setprop 
	getarraysize \{$hidebytype_list}
	array_count = 0
	begin
	if (($hidebytype_visible [<array_count>]) = off)
		formattext textname = menutext "Toggle %s : off" s = ($hidebytype_list [<array_count>])
	else
		formattext textname = menutext "Toggle %s : on" s = ($hidebytype_list [<array_count>])
	endif
	formattext checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' s = ($hidebytype_list [<array_count>])
	<menuitem_checksum> :setprops text = <menutext>
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = skipintosong_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (20.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = skipintosong_scrolling_menu
		id = skipintosong_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Skip By Time"
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
	createscreenelement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Skip By Marker"
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
	createscreenelement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Skip By Measure"
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
	createscreenelement \{type = textelement
		parent = skipintosong_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Set Loop Point"
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
	launchevent \{type = focus
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
	if screenelementexists \{id = skipintosong_scrolling_menu}
		destroyscreenelement \{id = skipintosong_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbytime_menu 
	ui_menu_select_sfx
	if gotparam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = skipbytime_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos + (70.0, 0.0))
	}
	createscreenelement {
		type = vmenu
		parent = skipbytime_scrolling_menu
		id = skipbytime_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if gotparam \{looppoint}
		menu_func = set_looppoint
		createscreenelement {
			type = textelement
			parent = skipbytime_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = "No Loop Point"
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
	formattext checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	getarraysize $<fretbar_array>
	max_time = (($<fretbar_array> [(<array_size> - 1)]) / 1000)
	current_time = 0
	begin
	formattext textname = menu_itemname "Time %ss" s = <current_time>
	if (<current_time> < <max_time>)
		createscreenelement {
			type = textelement
			parent = skipbytime_vmenu
			font = text_a1
			scale = 0.75
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
	launchevent \{type = focus
		target = skipbytime_vmenu}
endscript

script back_to_skipbytime_menu 
	create_skipbytime_menu
endscript

script destroy_skipbytime_menu 
	if screenelementexists \{id = skipbytime_scrolling_menu}
		destroyscreenelement \{id = skipbytime_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymarker_menu 
	ui_menu_select_sfx
	if gotparam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = skipbymarker_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos + (30.0, 0.0))
	}
	createscreenelement {
		type = vmenu
		parent = skipbymarker_scrolling_menu
		id = skipbymarker_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if gotparam \{looppoint}
		menu_func = set_looppoint
		createscreenelement {
			type = textelement
			parent = skipbymarker_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = "No Loop Point"
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
	formattext checksumname = marker_array '%s_markers' s = <song_prefix>
	getmarkerarraysize array = (<marker_array>)
	if (<array_size> = 0)
		createscreenelement {
			type = textelement
			parent = skipbymarker_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = "start"
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
		formattext textname = menu_itemname "%m (%ss)" m = ($<marker_array> [<marker_count>].marker) s = (($<marker_array> [<marker_count>].time) / 1000)
		createscreenelement {
			type = textelement
			parent = skipbymarker_vmenu
			font = text_a1
			scale = 0.75
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
		repeat <array_size>
	endif
	launchevent \{type = focus
		target = skipbymarker_vmenu}
endscript

script back_to_skipbymarker_menu 
	create_skipbymarker_menu
endscript

script destroy_skipbymarker_menu 
	if screenelementexists \{id = skipbymarker_scrolling_menu}
		destroyscreenelement \{id = skipbymarker_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymeasure_menu 
	ui_menu_select_sfx
	if gotparam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = skipbymeasure_scrolling_menu
		just = [left top]
		dims = (400.0, 250.0)
		pos = ($menu_pos + (-30.0, 0.0))
	}
	createscreenelement {
		type = vmenu
		parent = skipbymeasure_scrolling_menu
		id = skipbymeasure_vmenu
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if gotparam \{looppoint}
		menu_func = set_looppoint
		createscreenelement {
			type = textelement
			parent = skipbymeasure_vmenu
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = "No Loop Point"
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
	formattext checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup
	formattext checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	getarraysize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	getarraysize $<fretbar_array>
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
	repeat <array_size>
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
			formattext textname = menu_itemname "Measure %m (%ss)" s = (<time> / 1000.0) m = <measure_count>
			printf "%m" m = <menu_itemname>
			createscreenelement {
				type = textelement
				parent = skipbymeasure_vmenu
				font = text_a1
				scale = 0.75
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
	repeat <array_size>
	launchevent \{type = focus
		target = skipbymeasure_vmenu}
endscript

script back_to_skipbymeasure_menu 
	create_skipbymeasure_menu
endscript

script destroy_skipbymeasure_menu 
	if screenelementexists \{id = skipbymeasure_scrolling_menu}
		destroyscreenelement \{id = skipbymeasure_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_looppoint_menu 
	ui_menu_select_sfx
	destroy_skipintosong_menu
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = looppoint_scrolling_menu
		just = [left top]
		dims = (400.0, 480.0)
		pos = ($menu_pos + (20.0, 0.0))
	}
	createscreenelement \{type = vmenu
		parent = looppoint_scrolling_menu
		id = looppoint_vmenu
		pos = (0.0, 0.0)
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
	createscreenelement \{type = textelement
		parent = looppoint_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Loop By Time"
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
	createscreenelement \{type = textelement
		parent = looppoint_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Loop By Marker"
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
	createscreenelement \{type = textelement
		parent = looppoint_vmenu
		font = text_a1
		scale = 0.75
		rgba = [
			210
			210
			210
			250
		]
		text = "Loop By Measure"
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
	launchevent \{type = focus
		target = looppoint_vmenu}
endscript

script back_to_looppoint_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	create_looppoint_menu
endscript

script destroy_looppoint_menu 
	if screenelementexists \{id = looppoint_scrolling_menu}
		destroyscreenelement \{id = looppoint_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script set_looppoint 
	ui_menu_select_sfx
	change current_looppoint = <starttime>
	gh3_start_pressed
endscript

script create_replay_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	x_pos = 450
	createscreenelement \{type = vscrollingmenu
		parent = pause_menu
		id = replay_scrolling_menu
		just = [
			left
			top
		]
		dims = (400.0, 250.0)
		pos = (450.0, 120.0)}
	createscreenelement \{type = vmenu
		parent = replay_scrolling_menu
		id = replay_vmenu
		pos = (0.0, 0.0)
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
	startwildcardsearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT getwildcardfile
		break
	endif
	createscreenelement {
		type = textelement
		parent = replay_vmenu
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <basename>
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose restart_gem_scroller params = {replay = <filename> song_name = "blah" difficulty = "blah" difficulty2 = "blah"}}
		]
	}
	<index> = (<index> + 1)
	repeat
	endwildcardsearch
	launchevent \{type = focus
		target = replay_vmenu}
endscript

script destroy_replay_menu 
	if screenelementexists \{id = replay_scrolling_menu}
		destroyscreenelement \{id = replay_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_start_song 
	change \{current_transition = debugintro}
	spawnscriptlater start_song params = <...>
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
	soundevent \{event = ui_sfx_scroll}
	soundevent \{event = ui_sfx_scroll_add}
endscript

script ui_menu_select_sfx 
	soundevent \{event = ui_sfx_select}
endscript

script menu_focus 
	gettags
	printstruct <...>
	setscreenelementprops id = <id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	gettags
	setscreenelementprops id = <id> rgba = [210 210 210 250]
endscript
debug_menu_mode = 1

script switch_to_retail_menu 
	destroy_all_debug_menus
	change debug_menu_mode = (0)
	start_flow_manager
endscript

script switch_to_debug_menu 
	shut_down_flow_manager
	change debug_menu_mode = (1)
	destroy_all_debug_menus
	create_debugging_menu
endscript

script back_to_retail_ui_flow 
	destroy_debugging_menu
	ui_flow_manager_respond_to_action \{action = go_back}
	enable_pause
endscript

script toggle_global 
	printstruct <...>
	if gotparam \{global_toggle}
		if ($<global_toggle> = 1)
			change globalname = <global_toggle> newvalue = 0
		else
			change globalname = <global_toggle> newvalue = 1
		endif
	endif
endscript
toggled_fps_on = 0
framerate_warning = 57.5

script togglefps 
	if ($toggled_fps_on = 1)
		change \{toggled_fps_on = 0}
		killspawnedscript \{name = refreshfpsdisplay}
		wait \{0.2
			seconds}
		if objectexists \{id = fps_anchor}
			destroyscreenelement \{id = fps_anchor}
		endif
	else
		change \{toggled_fps_on = 1}
		setscreenelementlock \{id = root_window
			off}
		if objectexists \{id = fps_anchor}
			destroyscreenelement \{id = fps_anchor}
		endif
		createscreenelement \{type = containerelement
			parent = root_window
			id = fps_anchor
			pos = (30.0, 140.0)
			just = [
				center
				center
			]
			internal_just = [
				left
				center
			]}
		createscreenelement \{type = textelement
			parent = fps_anchor
			id = fps_text
			pos = (20.0, -15.0)
			text = "FPS: "
			font = text_a1
			rgba = [
				120
				120
				200
				200
			]
			just = [
				left
				center
			]
			scale = 0.75
			z_priority = 100}
		createscreenelement \{type = spriteelement
			parent = fps_anchor
			pos = (16.0, -34.0)
			texture = white2
			rgba = [
				10
				10
				10
				180
			]
			just = [
				left
				top
			]
			scale = (2.55, 0.6)
			z_priority = 99}
		setscreenelementlock \{id = root_window
			on}
		spawnscriptlater \{refreshfpsdisplay}
	endif
endscript
fps_display_hold_red = 0

script refreshfpsdisplay \{interval = 0.1}
	begin
	if objectexists \{id = fps_anchor}
		formattext textname = fps "FPS: %d" d = ($framerate_value)
		setscreenelementprops id = fps_text text = <fps>
		if (($framerate_value) < $framerate_warning)
			change \{fps_display_hold_red = 60}
			setscreenelementprops \{id = fps_text
				rgba = [
					160
					20
					20
					255
				]}
		elseif ($fps_display_hold_red > 0)
			setscreenelementprops \{id = fps_text
				rgba = [
					160
					20
					20
					255
				]}
			change fps_display_hold_red = ($fps_display_hold_red - 1)
		else
			setscreenelementprops \{id = fps_text
				rgba = [
					100
					100
					100
					255
				]}
		endif
	else
		killspawnedscript \{id = refreshfpsdisplay}
		change \{toggled_fps_on = 0}
	endif
	wait \{1
		frame}
	repeat
endscript

script toggle_interleaved_animations 
	change interleave_animations = (1 - $interleave_animations)
	destroy_debugging_menu
	create_debugging_menu
endscript

script toggle_show_2d_particles 
	change show_2d_particles = (1 - $show_2d_particles)
	destroy_debugging_menu
	create_debugging_menu
endscript

script toggle_disable_screen_fx 
	change disable_screen_fx = (1 - $disable_screen_fx)
	destroy_debugging_menu
	create_debugging_menu
endscript

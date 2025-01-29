
script ui_create_unlock_venue 
	SpawnScriptNow ui_create_unlock_venue_spawned params = <...>
endscript

script ui_create_unlock_venue_spawned 
	RequireParams \{[
			load_venue_checksum
		]
		all}
	formatText TextName = venue_text qs(0x5875e1ce) v = ($LevelZones.<load_venue_checksum>.title)
	CreateScreenElement {
		parent = root_window
		id = unlock_venue_screen_id
		Type = descinterface
		desc = 'unlock_venue'
		Pos = (0.0, 0.0)
		unlock_venue_title_2_text = <venue_text>
	}
	persistent_band_stop_and_unload_anims
	kill_gem_scroller
	destroy_song_and_musicstudio_heaps \{do_unloads}
	setbinkheap \{heap_cas_cache}
	CreateScreenElement {
		Type = movieelement
		parent = unlock_venue_screen_id
		textureSlot = 2
		movie = ($LevelZones.<load_venue_checksum>.unlock_movie)
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		pos_anchor = [center center]
		just = [center center]
		z_priority = -10000
		alpha = 1.0
		rgba = [255 255 255 255]
		loop_start = ($LevelZones.<load_venue_checksum>.unlock_movie_loop_start)
		loop_end = ($LevelZones.<load_venue_checksum>.unlock_movie_loop_end)
	}
	SpawnScriptNow \{ui_venue_unlock_sfx}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	unlock_venue_setup_handler_scripts load_venue_checksum = <load_venue_checksum>
	LaunchEvent \{Type = focus
		target = unlock_venue_screen_id}
endscript

script ui_deinit_unlock_venue 
	finalprintf \{'ui_deinit_unlock_venue'}
	endmovie \{slot = 2
		noWait}
	finalprintf \{'ui_deinit_unlock_venue - EndMovie'}
	blockforallmovieunloads
	setbinkheap \{heap_bink}
	create_song_and_musicstudio_heaps
endscript

script ui_destroy_unlock_venue 
	finalprintf \{'ui_destroy_unlock_venue'}
	endmovie \{slot = 2
		noWait}
	finalprintf \{'ui_destroy_unlock_venue - EndMovie'}
	blockforallmovieunloads
	if ScreenElementExists \{id = unlock_venue_screen_id}
		DestroyScreenElement \{id = unlock_venue_screen_id}
	endif
	if ($end_credits != 1)
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
	endif
endscript

script ui_return_unlock_venue 
	if ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{Type = focus
			target = unlock_venue_screen_id}
		if ininternetmode
			if IsHost
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0x67d9c56d)
				button = red
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
		endif
	endif
endscript

script unlock_venue_setup_handler_scripts 
	RequireParams \{[
			load_venue_checksum
		]
		all}
	if ScreenElementExists \{id = unlock_venue_screen_id}
		if ($end_credits = 1)
			unlock_venue_screen_id :se_setprops \{event_handlers = [
					{
						pad_choose
						unlock_and_goto_credits
					}
				]}
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
		else
			if ininternetmode
				unlock_venue_screen_id :se_setprops \{event_handlers = [
						{
							pad_choose
							net_unlock_venue_continue_to_next_screen
						}
						{
							pad_back
							postgame_lobby_quit
							params = {
								id = unlock_venue_screen_id
							}
						}
					]}
				if IsHost
					add_user_control_helper \{text = qs(0x182f0173)
						button = green
						z = 100000}
				endif
				add_user_control_helper \{text = qs(0x67d9c56d)
					button = red
					z = 100000}
			else
				unlock_venue_screen_id :se_setprops {
					event_handlers = [
						{pad_choose unlock_venue_continue_to_next_screen params = {load_venue_checksum = <load_venue_checksum>}}
					]
				}
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
		endif
	endif
endscript

script unlock_venue_continue_to_next_screen 
	generic_menu_pad_choose_sound
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{Type = unfocus
			target = unlock_venue_screen_id}
	endif
	finalprintf \{'unlock_venue_continue_to_next_screen'}
	endmovie \{slot = 2}
	finalprintf \{'unlock_venue_continue_to_next_screen - Endmovie finished'}
	gman_venuefunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	ui_memcard_autosave_all_players {
		event = menu_back
		state = uistate_career_venue_select
		data = {
			load_venue_checksum = <load_venue_checksum>
		}
	}
endscript

script net_unlock_venue_continue_to_next_screen 
	RequireParams \{[
			device_num
		]
		all}
	finalprintf \{'net_unlock_venue_continue_to_next_screen'}
	generic_menu_pad_choose_sound
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
	endif
	if (<controller> = <device_num>)
		finalprintf 'net_unlock_venue_continue_to_next_screen (<%a> = <%b>)' a = <controller> b = <device_num>
		endmovie \{slot = 2}
		finalprintf \{'net_unlock_venue_continue_to_next_screen - Endmovie finished'}
		if ScreenElementExists \{id = unlock_venue_screen_id}
			LaunchEvent \{Type = unfocus
				target = unlock_venue_screen_id}
		endif
		if IsHost
			SendStructure \{callback = net_unlock_venue_continue_to_next_screen_for_clients
				data_to_send = {
					autosave = 1
				}}
			gig_complete_noncompetitive_continue_to_venue_select \{autosave = 1}
		else
			SendStructure \{callback = net_unlock_venue_continue_to_next_screen
				data_to_send = {
				}}
		endif
	else
		finalprintf 'net_unlock_venue_continue_to_next_screen (<%a> != <%b>)' a = <controller> b = <device_num>
	endif
endscript

script net_unlock_venue_continue_to_next_screen_for_clients 
	RequireParams \{[
			autosave
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{Type = unfocus
			target = unlock_venue_screen_id}
	endif
	finalprintf \{'net_unlock_venue_continue_to_next_screen_for_clients'}
	endmovie \{slot = 2}
	finalprintf \{'net_unlock_venue_continue_to_next_screen_for_clients - Endmovie finished'}
	gig_complete_noncompetitive_continue_to_venue_select autosave = <autosave>
endscript

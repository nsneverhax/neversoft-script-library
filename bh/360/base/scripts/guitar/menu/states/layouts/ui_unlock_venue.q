
script ui_create_unlock_venue 
	spawnscriptnow ui_create_unlock_venue_spawned params = <...>
endscript

script ui_create_unlock_venue_spawned 
	RequireParams \{[
			load_venue_checksum
		]
		all}
	FormatText TextName = venue_text qs(0x5875e1ce) v = ($LevelZones.<load_venue_checksum>.Title)
	CreateScreenElement {
		parent = root_window
		id = unlock_venue_screen_id
		type = DescInterface
		desc = 'unlock_venue'
		Pos = (0.0, 0.0)
		unlock_venue_title_2_text = <venue_text>
	}
	if unlock_venue_screen_id :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal params = {minwidth = 100 maxwidth = 150 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal params = {minwidth = 100 maxwidth = 150 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :Desc_ResolveAlias \{name = alias_glow
			param = glow_id}
		<glow_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	persistent_band_stop_and_unload_anims
	kill_gem_scroller
	destroy_song_and_musicstudio_heaps \{do_unloads}
	SetBinkHeap \{heap_cas_cache}
	CreateScreenElement {
		type = MovieElement
		parent = unlock_venue_screen_id
		TextureSlot = 2
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
	spawnscriptnow \{UI_Venue_Unlock_SFX}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	unlock_venue_setup_handler_scripts load_venue_checksum = <load_venue_checksum>
	LaunchEvent \{type = focus
		target = unlock_venue_screen_id}
endscript

script ui_deinit_unlock_venue 
	FinalPrintf \{'ui_deinit_unlock_venue'}
	EndMovie \{Slot = 2
		nowait}
	FinalPrintf \{'ui_deinit_unlock_venue - EndMovie'}
	BlockForAllMovieUnloads
	SetBinkHeap \{heap_bink}
	create_song_and_musicstudio_heaps
endscript

script ui_destroy_unlock_venue 
	FinalPrintf \{'ui_destroy_unlock_venue'}
	EndMovie \{Slot = 2
		nowait}
	FinalPrintf \{'ui_destroy_unlock_venue - EndMovie'}
	BlockForAllMovieUnloads
	if ScreenElementExists \{id = unlock_venue_screen_id}
		DestroyScreenElement \{id = unlock_venue_screen_id}
	endif
	if ($end_credits != 1)
		SetBinkHeap \{heap_bink}
		create_song_and_musicstudio_heaps
	endif
endscript

script ui_return_unlock_venue 
	if ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{type = focus
			target = unlock_venue_screen_id}
		if InInternetMode
			if IsHost
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0x67d9c56d)
				button = red
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x784c64ff)
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
			unlock_venue_screen_id :SE_SetProps \{event_handlers = [
					{
						pad_choose
						unlock_and_goto_credits
					}
				]}
			add_user_control_helper \{text = qs(0x784c64ff)
				button = green
				z = 100000}
			unlock_venue_screen_id :Obj_SpawnScript \{unlock_continue_timer
				params = {
					callback = unlock_and_goto_credits
				}}
		else
			if InInternetMode
				unlock_venue_screen_id :SE_SetProps \{event_handlers = [
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
				unlock_venue_screen_id :SE_SetProps {
					event_handlers = [
						{pad_choose unlock_venue_continue_to_next_screen params = {load_venue_checksum = <load_venue_checksum>}}
					]
				}
				add_user_control_helper \{text = qs(0x784c64ff)
					button = green
					z = 100000}
				unlock_venue_screen_id :Obj_SpawnScript unlock_continue_timer params = {callback = unlock_venue_continue_to_next_screen callback_params = {load_venue_checksum = <load_venue_checksum>}}
			endif
		endif
	endif
endscript

script unlock_venue_continue_to_next_screen 
	generic_menu_pad_choose_sound
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{type = unfocus
			target = unlock_venue_screen_id}
	endif
	FinalPrintf \{'unlock_venue_continue_to_next_screen'}
	EndMovie \{Slot = 2}
	FinalPrintf \{'unlock_venue_continue_to_next_screen - Endmovie finished'}
	GMan_VenueFunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	ui_memcard_autosave_all_players {
		event = menu_back
		state = UIstate_career_venue_select
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
	FinalPrintf \{'net_unlock_venue_continue_to_next_screen'}
	generic_menu_pad_choose_sound
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetPlayerInfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		GetPlayerInfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		GetPlayerInfo ($g_net_leader_player_num) controller
	endif
	if (<controller> = <device_num>)
		FinalPrintf 'net_unlock_venue_continue_to_next_screen (<%a> = <%b>)' a = <controller> b = <device_num>
		EndMovie \{Slot = 2}
		FinalPrintf \{'net_unlock_venue_continue_to_next_screen - Endmovie finished'}
		if ScreenElementExists \{id = unlock_venue_screen_id}
			LaunchEvent \{type = unfocus
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
		FinalPrintf 'net_unlock_venue_continue_to_next_screen (<%a> != <%b>)' a = <controller> b = <device_num>
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
		LaunchEvent \{type = unfocus
			target = unlock_venue_screen_id}
	endif
	FinalPrintf \{'net_unlock_venue_continue_to_next_screen_for_clients'}
	EndMovie \{Slot = 2}
	FinalPrintf \{'net_unlock_venue_continue_to_next_screen_for_clients - Endmovie finished'}
	gig_complete_noncompetitive_continue_to_venue_select autosave = <autosave>
endscript

script unlock_continue_timer 
	RequireParams \{[
			callback
		]}
	begin
	wait \{1
		second
		ignoreslomo}
	repeat 12
	SE_SetProps \{block_events}
	Obj_SpawnScript <callback> params = {<...> <callback_params>}
endscript

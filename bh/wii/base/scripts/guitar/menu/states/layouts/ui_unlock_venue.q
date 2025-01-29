
script ui_create_unlock_venue 
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
		venue_poster_gh5_texture = ($LevelZones.<load_venue_checksum>.poster)
		0x64c33323 = (818.0, 11.0)
		0x0b57cd59 = (730.0, 11.0)
	}
	SpawnScriptNow \{ui_venue_unlock_sfx}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	SpawnScriptNow ui_create_unlock_venue_spawned params = {load_venue_checksum = <load_venue_checksum>}
	if unlock_venue_screen_id :desc_resolvealias \{Name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0x317f8786 params = {minwidth = 100 maxwidth = 150 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript 0x317f8786 params = {minwidth = 100 maxwidth = 150 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = 0xaa79772d
			param = 0x069c935d}
		<0x069c935d> :obj_spawnscript 0x69816eb6
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = alias_glow
			param = glow_id}
		<glow_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = alias_poster_anim
			param = poster_anim_id}
		<poster_anim_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = alias_poster_anim
			param = poster_anim_id}
		<poster_anim_id> :obj_spawnscript ui_frazzmatazz_02
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = 0xce80d9bd
			param = 0x9820a871}
		<0x9820a871> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'UI_art'}
	endif
	if unlock_venue_screen_id :desc_resolvealias \{Name = 0xce80d9bd
			param = 0x9820a871}
		<0x9820a871> :obj_spawnscript ui_frazzmatazz_02
	else
		ScriptAssert \{'UI_art'}
	endif
	unlock_venue_screen_id :se_setprops \{0x64c33323 = (308.0, 11.0)
		time = 0.2
		motion = ease_in}
endscript

script ui_create_unlock_venue_spawned 
	Wait \{10
		frames}
	unlock_venue_setup_handler_scripts load_venue_checksum = <load_venue_checksum>
	LaunchEvent \{Type = focus
		target = unlock_venue_screen_id}
endscript

script ui_destroy_unlock_venue 
	if ScreenElementExists \{id = unlock_venue_screen_id}
		DestroyScreenElement \{id = unlock_venue_screen_id}
	endif
endscript

script 0x4072464f 
	RequireParams \{[
			load_venue_checksum
		]
		all}
	PlayMovieAndWait movie = ($LevelZones.<load_venue_checksum>.unlock_movie) loop_start = ($LevelZones.<load_venue_checksum>.unlock_movie_loop_start) loop_end = ($LevelZones.<load_venue_checksum>.unlock_movie_loop_end) highpriority = FALSE Loop noblack
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
			unlock_venue_screen_id :se_setprops \{event_handlers = [
					{
						pad_choose
						unlock_and_goto_credits
					}
				]}
			add_user_control_helper \{text = qs(0x784c64ff)
				button = green
				z = 100000}
			unlock_venue_screen_id :obj_spawnscript \{unlock_continue_timer
				params = {
					callback = unlock_and_goto_credits
				}}
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
				add_user_control_helper \{text = qs(0x784c64ff)
					button = green
					z = 100000}
				unlock_venue_screen_id :obj_spawnscript unlock_continue_timer params = {callback = unlock_venue_continue_to_next_screen callback_params = {load_venue_checksum = <load_venue_checksum>}}
			endif
		endif
	endif
endscript

script unlock_venue_continue_to_next_screen 
	generic_menu_pad_choose_sound
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if IsMoviePlaying \{textureSlot = 0}
		SpawnScriptNow endmovie params = {disable_render = <redisable_rendering>}
	endif
	if ScreenElementExists \{id = unlock_venue_screen_id}
		LaunchEvent \{Type = unfocus
			target = unlock_venue_screen_id}
	endif
	gman_venuefunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	if is_roadie_battle_mode
		ui_memcard_autosave {
			event = menu_back
			state = uistate_band_lobby_setup
			data = {
				load_venue_checksum = <load_venue_checksum>
			}
		}
	else
		ui_memcard_autosave {
			event = menu_back
			state = uistate_career_venue_select
			data = {
				load_venue_checksum = <load_venue_checksum>
			}
		}
	endif
endscript

script net_unlock_venue_continue_to_next_screen 
	RequireParams \{[
			device_num
		]
		all}
	generic_menu_pad_choose_sound
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if IsMoviePlaying \{textureSlot = 0}
		SpawnScriptNow endmovie params = {disable_render = <redisable_rendering>}
	endif
	getplayerinfo ($g_net_leader_player_num) bot_play
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		controller = <bot_original_controller>
	else
		getplayerinfo ($g_net_leader_player_num) controller
	endif
	if (<controller> = <device_num>)
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
	gig_complete_noncompetitive_continue_to_venue_select autosave = <autosave>
endscript

script unlock_continue_timer 
	RequireParams \{[
			callback
		]}
	begin
	Wait \{1
		Second
		ignoreslomo}
	repeat 12
	se_setprops \{block_events}
	obj_spawnscript <callback> params = {<...> <callback_params>}
endscript


script ui_create_encore_confirmation 
	0xb1ba908a
	SpawnScriptNow ui_create_encore_confirmation_spawned params = {<...>}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_destroy_encore_confirmation 
	stopsound ($current_crowd_encore)
	if ScreenElementExists \{id = encoreinterface}
		encoreinterface :Obj_KillSpawnedScript \{Name = encore_shake_crossbones}
		encoreinterface :Obj_KillSpawnedScript \{Name = ui_encore_confirmation_anim_in}
	endif
	destroy_ui_encore_confirmation
endscript

script ui_create_encore_confirmation_spawned 
	SoundEvent \{event = $current_crowd_encore}
	destroy_ui_encore_confirmation
	if isSinglePlayerGame
		getnewcashfromdetailedstats
		stars = ($player1_status.stars)
		score = ($player1_status.score)
		cash = <new_cash>
	else
		gamemode_getnumplayersshown
		total_cash = 0
		p = 1
		begin
		getplayerinfo <p> is_local_client
		if (<is_local_client> = 1)
			getnewcashfromdetailedstats Player = <p>
			total_cash = (<total_cash> + <new_cash>)
		endif
		p = (<p> + 1)
		repeat <num_players_shown>
		score = ($band1_status.score)
		stars = ($band1_status.stars)
		cash = <total_cash>
	endif
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = encoreinterface
		desc = 'encore'
		encore_master_container_scale = 1.0
		exclusive_device = $primary_controller
		event_handlers = [
			{
				pad_choose
				encore_play
			}
		]}
	if encoreinterface :desc_resolvealias \{Name = alias_stars_stack}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			child_index = 0
			begin
			GetRandomValue \{Name = rand_rot
				a = -10
				b = 10}
			SetScreenElementProps id = (<children> [<child_index>]) rot_angle = <rand_rot>
			child_index = (<child_index> + 1)
			repeat <array_Size>
			if (<array_Size> > 0)
				if (<stars> < 5)
					destroy_menu menu_id = (<children> [0])
				endif
				if (<stars> < 4)
					destroy_menu menu_id = (<children> [1])
				endif
			endif
		endif
	endif
	CastToInteger \{score}
	formatText TextName = score_text qs(0x76b3fda7) d = <score> usecommas
	encoreinterface :se_setprops encore_score_text = <score_text>
	formatText TextName = cash_text qs(0xcb2f9062) d = <cash> usecommas
	encoreinterface :se_setprops encore_money_text = <cash_text>
	SpawnScriptNow \{ui_encore_animate_neon}
	mark_encore_started
endscript

script 0x4fe76d9d 
	array = [
		{pad_choose 0x59983fb5}
	]
	SetScreenElementProps {
		id = encoreinterface
		event_handlers = <array>
	}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	AssignAlias \{id = encoreinterface
		alias = current_menu}
endscript

script mark_encore_started 
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	SetGlobalTags <gig_name> params = {started = 1 encore_unlocked = 1} all_active_players = 1
	if IsHost
		SendStructure \{callback = mark_encore_started
			data_to_send = {
				None
			}}
	endif
endscript

script destroy_ui_encore_confirmation 
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = ui_encore_animate_neon}
	ui_destroy_encore_animate_neon
	if ScreenElementExists \{id = encoreinterface}
		encoreinterface :Die
	endif
endscript

script ui_encore_animate_neon 
	SpawnScriptNow \{pulsate_neon
		params = {
			id = encoreinterface
		}}
endscript

script ui_destroy_encore_animate_neon 
	KillSpawnedScript \{Name = pulsate_neon}
	if issoundplaying \{encore_pulsate_neon_loop}
		stopsound \{encore_pulsate_neon_loop
			fade_time = 0.5
			fade_type = log_slow}
	endif
endscript

script pulsate_neon 

	SoundEvent \{event = encore_pulsate_neon_loop}
	begin
	neon_alpha = Random (@*2 1 @*2 0.75 @ 0.5 @ 0.25 )
	neon_time = Random (@*3 0.04 @*2 0.08 @ 0.120000005 )
	<id> :se_setprops encore_bg_alpha = <neon_alpha>
	Wait <neon_time> Seconds
	repeat
endscript


script ui_create_encore_confirmation 
	spawnscriptnow ui_create_encore_confirmation_spawned params = {<...>}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_destroy_encore_confirmation 
	destroy_ui_encore_confirmation
endscript

script ui_create_encore_confirmation_spawned 
	soundevent \{event = $current_crowd_encore}
	destroy_ui_encore_confirmation
	if issingleplayergame
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
			getnewcashfromdetailedstats player = <p>
			total_cash = (<total_cash> + <new_cash>)
		endif
		p = (<p> + 1)
		repeat <num_players_shown>
		score = ($band1_status.score)
		stars = ($band1_status.stars)
		cash = <total_cash>
	endif
	createscreenelement \{type = descinterface
		parent = root_window
		id = encoreinterface
		desc = 'encore'
		encore_master_container_scale = 1.0
		event_handlers = [
			{
				pad_choose
				encore_play
			}
		]}
	if encoreinterface :desc_resolvealias \{name = alias_stars_stack}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			child_index = 0
			begin
			getrandomvalue \{name = rand_rot
				a = -10
				b = 10}
			setscreenelementprops id = (<children> [<child_index>]) rot_angle = <rand_rot>
			child_index = (<child_index> + 1)
			repeat <array_size>
			if (<array_size> > 0)
				if (<stars> < 5)
					destroy_menu menu_id = (<children> [0])
				endif
				if (<stars> < 4)
					destroy_menu menu_id = (<children> [1])
				endif
			endif
		endif
	endif
	casttointeger \{score}
	formattext textname = score_text qs(0x48c6d14c) d = <score> usecommas
	encoreinterface :se_setprops encore_score_text = <score_text>
	formattext textname = cash_text qs(0x447de8d3) d = <cash> usecommas
	encoreinterface :se_setprops encore_money_text = <cash_text>
	spawnscriptnow \{ui_encore_animate_neon}
	mark_encore_started
endscript

script mark_encore_started 
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	setglobaltags <gig_name> params = {started = 1 encore_unlocked = 1} all_active_players = 1
	if ishost
		sendstructure \{callback = mark_encore_started
			data_to_send = {
				none
			}}
	endif
endscript

script destroy_ui_encore_confirmation 
	killspawnedscript \{name = ui_encore_animate_neon}
	ui_destroy_encore_animate_neon
	if screenelementexists \{id = encoreinterface}
		encoreinterface :die
	endif
endscript

script ui_encore_animate_neon 
	spawnscriptnow \{pulsate_neon
		params = {
			id = encoreinterface
		}}
endscript

script ui_destroy_encore_animate_neon 
	killspawnedscript \{name = pulsate_neon}
	if issoundplaying \{encore_pulsate_neon_loop}
		stopsound \{encore_pulsate_neon_loop
			fade_time = 0.5
			fade_type = log_slow}
	endif
endscript

script pulsate_neon 
	soundevent \{event = encore_pulsate_neon_loop}
	begin
	neon_alpha = Random (@*2 1 @*2 0.75 @ 0.5 @ 0.25 )
	neon_time = Random (@*3 0.04 @*2 0.08 @ 0.120000005 )
	<id> :se_setprops encore_bg_alpha = <neon_alpha>
	if (<neon_alpha> = 0.25)
		setsoundparams \{encore_pulsate_neon_loop
			vol = -15}
	endif
	if (<neon_alpha> = 0.5)
		setsoundparams \{encore_pulsate_neon_loop
			vol = -10}
	endif
	if (<neon_alpha> = 0.75)
		setsoundparams \{encore_pulsate_neon_loop
			vol = -8}
	endif
	if (<neon_alpha> >= 1)
		setsoundparams \{encore_pulsate_neon_loop
			vol = -3}
	endif
	wait <neon_time> seconds
	repeat
endscript

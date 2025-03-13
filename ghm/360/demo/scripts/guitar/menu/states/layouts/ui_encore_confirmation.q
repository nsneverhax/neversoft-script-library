
script ui_create_encore_confirmation 
	spawnscriptnow ui_create_encore_confirmation_spawned params = {<...>}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_destroy_encore_confirmation 
	if screenelementexists \{id = encoreinterface}
		encoreinterface :obj_killspawnedscript \{name = encore_shake_crossbones}
		encoreinterface :obj_killspawnedscript \{name = ui_encore_confirmation_anim_in}
	endif
	destroy_ui_encore_confirmation
endscript

script ui_create_encore_confirmation_spawned 
	spawnscriptnow \{metallica_encore_crowd}
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
	encoreinterface :obj_spawnscriptnow \{ui_encore_confirmation_anim_in}
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
	killspawnedscript \{name = ui_encore_animate_flashbulbs}
	ui_destroy_encore_flashbulbs
	if screenelementexists \{id = encoreinterface}
		encoreinterface :die
	endif
endscript

script ui_encore_animate_flashbulbs 
	spawnscriptlater \{pulsate_helper_pill
		params = {
			id = encoreinterface
		}}
endscript

script ui_destroy_encore_flashbulbs 
	killspawnedscript \{name = pulsate_helper_pill}
endscript

script ui_encore_confirmation_anim_in 
	se_setprops \{rotation_anchor_rot_angle = -1.5
		time = 0.03
		anim = slow_out}
	se_setprops \{encore_clip_rect_pos = {
			relative
			(0.0, -600.0)
		}}
	se_setprops \{encore_roll_pos = {
			relative
			(5.0, -600.0)
		}
		motion = ease_out}
	se_waitprops
	se_setprops \{encore_clip_rect_pos = {
			relative
			(0.0, 300.0)
		}
		anim = slow_out}
	se_setprops \{encore_roll_pos = {
			relative
			(5.0, 305.0)
		}
		motion = ease_out}
	se_setprops \{encore_roll_scale = (1.2, 2.0)}
	wait \{0.06
		seconds}
	se_setprops \{encore_clip_rect_pos = {
			relative
			(0.0, 50.0)
		}
		anim = slow_out}
	se_setprops \{encore_roll_pos = {
			relative
			(2.0, 58.0)
		}
		motion = ease_out}
	se_setprops \{encore_roll_scale = (1.2, 1.5)}
	se_waitprops
	wait \{0.04
		seconds}
	se_setprops \{encore_clip_rect_pos = {
			relative
			(0.0, 200.0)
		}
		anim = slow_out}
	se_setprops \{encore_roll_pos = {
			relative
			(0.0, 168.0)
		}
		motion = ease_out}
	se_setprops \{encore_roll_scale = (1.2, 0.8)}
	se_waitprops
	wait \{0.04
		seconds}
	se_setprops \{encore_clip_rect_pos = {
			relative
			(0.0, 50.0)
		}
		anim = slow_out}
	se_setprops \{encore_roll_pos = {
			relative
			(0.0, 45.0)
		}
		motion = ease_out}
	se_setprops \{encore_roll_scale = (1.2, 0.0)}
	se_setprops \{rotation_anchor_rot_angle = 1.3
		time = 0.1
		anim = slow_out}
	wait \{0.1
		seconds}
	encoreinterface :obj_spawnscriptnow \{encore_shake_crossbones}
	se_setprops \{rotation_anchor_rot_angle = -1.1
		time = 1.2
		anim = slow_out}
	se_waitprops
	se_setprops \{rotation_anchor_rot_angle = 0.5
		time = 0.5
		anim = fast_out}
	se_waitprops
	se_setprops \{rotation_anchor_rot_angle = -0.5
		time = 1.8
		anim = slow_out}
	se_waitprops
	se_setprops \{rotation_anchor_rot_angle = 0.0
		time = 1.8
		anim = slow_out}
	se_waitprops
endscript

script encore_shake_crossbones 
	begin
	se_setprops \{encore_scaryl_arm_r_pos = (-210.9359, -86.79193)
		time = 0.05}
	se_setprops \{encore_scaryl_arm_l_pos = (-223.5812, -88.16052)
		time = 0.05}
	se_setprops \{encore_scaryr_arm_r_pos = (207.2603, -97.39429)
		time = 0.05}
	se_setprops \{encore_scaryr_arm_l_pos = (198.9029, -90.0565)
		time = 0.05}
	se_waitprops
	se_setprops \{encore_scaryl_arm_r_pos = (-185.2709, -106.62399)
		time = 0.3}
	se_setprops \{encore_scaryl_arm_l_pos = (-248.0796, -104.4928)
		time = 0.3}
	se_setprops \{encore_scaryr_arm_r_pos = (227.2603, -116.3811)
		time = 0.3}
	se_setprops \{encore_scaryr_arm_l_pos = (163.96799, -113.5112)
		time = 0.3}
	se_waitprops
	repeat
endscript

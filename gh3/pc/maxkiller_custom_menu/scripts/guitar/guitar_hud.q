
script setup_sprites 
	screenelementsysteminit
	setup_main_button_event_mappings
	createscreenelement \{type = containerelement
		parent = root_window
		id = hud_window
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = textelement
		parent = root_window
		id = song_failed_text
		font = text_a10
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
		text = "Song Failed"
		z_priority = 5.0
		alpha = 0}
	createscreenelement \{type = textelement
		parent = root_window
		id = song_won_text
		font = text_a10
		pos = (640.0, 360.0)
		just = [
			center
			center
		]
		scale = 4.0
		rgba = [
			210
			210
			210
			250
		]
		text = "You Rock!"
		z_priority = 71.0
		alpha = 0}
	createscreenelement \{type = textelement
		parent = root_window
		id = player1wins_text
		font = text_a10
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
		text = "Player 1 Wins!"
		z_priority = 5.0
		alpha = 0}
	createscreenelement \{type = textelement
		parent = root_window
		id = player2wins_text
		font = text_a10
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
		text = "Player 2 Wins!"
		z_priority = 5.0
		alpha = 0}
	createscreenelement \{type = textelement
		parent = root_window
		id = intro_song_info_text
		font = text_a10
		pos = (480.0, 32.0)
		just = [
			left
			top
		]
		scale = 1.23
		rgba = [
			210
			210
			210
			250
		]
		text = "Song Info"
		z_priority = 5.0
		alpha = 0
		shadow
		shadow_offs = (1.0, 1.0)}
	createscreenelement \{type = textelement
		parent = root_window
		id = intro_performed_by_text
		font = text_a10
		pos = (480.0, 45.0)
		just = [
			left
			top
		]
		scale = (1.0, 0.5)
		rgba = [
			230
			205
			160
			255
		]
		text = "AS PERFORMED BY"
		z_priority = 5.0
		alpha = 0
		shadow
		shadow_offs = (1.0, 1.0)}
	createscreenelement \{type = textelement
		parent = root_window
		id = intro_artist_info_text
		font = text_a10
		pos = (640.0, 32.0)
		just = [
			left
			top
		]
		scale = 1.0
		rgba = [
			255
			190
			70
			255
		]
		text = "Song Artist"
		z_priority = 5.0
		alpha = 0
		shadow
		shadow_offs = (1.0, 1.0)}
	setup_pause
endscript
hud_screen_elements = [
	{
		id = star_power_ready_text
		text = "Star Power Ready"
		pos = (640.0, 230.0)
		alpha = 0
		just = [
			center
			top
		]
		yoff = 0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	{
		id = double_notes_text
		text = "Double Notes!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = difficulty_up_text
		text = "Difficulty Up!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lefty_notes_text
		text = "Lefty Notes!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = broken_string_text
		text = "Broken String!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = whammy_attack_text
		text = "Whammy!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lightning_text
		text = "Amp Overload!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal_text
		text = "JACKED!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal1_text
		text = "THIEF!"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal2_text
		text = "Nothing to steal..."
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = coop_raise_axe
		text = "Tilt guitar to trigger"
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	{
		id = coop_raise_axe_cont
		text = "Star Power"
		pos = (640.0, 300.0)
		scale = 1.1
		just = [
			center
			top
		]
		yoff = 0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
]

script setup_hud 
	extendcrc hud_destroygroup_window <player_text> out = hud_destroygroup
	createscreenelement {
		type = containerelement
		parent = hud_window
		id = <hud_destroygroup>
		pos = (0.0, 0.0)
		just = [left top]
	}
	getarraysize \{$hud_screen_elements}
	array_entry = 0
	get_num_players_by_gamemode
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	extendcrc <id> <player_text> out = id
	pos = ($hud_screen_elements [<array_entry>].pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players> = 2)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	createscreenelement {
		type = textelement
		parent = <hud_destroygroup>
		font = text_a6
		just = [left top]
		scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		pos = <pos>
		id = <id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if ((<player_status>.is_local_client) && (<player_status>.highway_layout = solo_highway))
		net_setup_solo_hud player_status = <player_status> hud_destroygroup = <hud_destroygroup> player = <player>
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			change \{g_hud_2d_struct_used = coop_career_hud_2d_elements}
		elseif ($game_mode = p2_faceoff || game_mode = p2_pro_faceoff)
			change \{g_hud_2d_struct_used = faceoff_hud_2d_elements}
		elseif ($game_mode = p2_battle || ($boss_battle = 1))
			change \{g_hud_2d_struct_used = battle_hud_2d_elements}
		else
			change \{g_hud_2d_struct_used = career_hud_2d_elements}
		endif
		extendcrc hud_2d_container <player_text> out = new_2d_container
		if NOT screenelementexists id = <new_2d_container>
			createscreenelement {
				type = containerelement
				parent = root_window
				pos = (0.0, 0.0)
				just = [left top]
				id = <new_2d_container>
				scale = (($g_hud_2d_struct_used).scale)
			}
		endif
		create_2d_hud_elements parent = <new_2d_container> player_text = <player_text> elements_structure = $g_hud_2d_struct_used
	endif
	if ($display_debug_input = 1)
		extendcrc input_text <player_text> out = input_id
		createscreenelement {
			type = textelement
			parent = <hud_destroygroup>
			font = text_a1
			just = [left top]
			scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			text = "I111111111111111"
			pos = (64.0, 64.0)
			id = <input_id>
		}
	endif
	reset_hud_text <...>
endscript

script destroy_hud 
	extendcrc hud_destroygroup_window <player_text> out = hud_destroygroup
	if screenelementexists id = <hud_destroygroup>
		destroyscreenelement id = <hud_destroygroup>
	endif
	extendcrc \{hud_2d_container
		'p1'
		out = new_2d_container}
	if screenelementexists id = <new_2d_container>
		destroyscreenelement id = <new_2d_container>
	endif
	extendcrc \{hud_2d_container
		'p2'
		out = new_2d_container}
	if screenelementexists id = <new_2d_container>
		destroyscreenelement id = <new_2d_container>
	endif
	formattext checksumname = player_container 'HUD_Note_Streak_Combo%d' d = <player>
	destroy_menu menu_id = <player_container>
endscript

script reset_hud_text 
	name = star_power_ready_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = double_notes_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = difficulty_up_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = lefty_notes_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = broken_string_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = whammy_attack_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = lightning_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = steal_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = steal1_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = steal2_text
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = coop_raise_axe
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	name = coop_raise_axe_cont
	extendcrc <name> <player_text> out = name
	doscreenelementmorph id = <name> alpha = 0
	doscreenelementmorph \{id = song_failed_text
		alpha = 0}
	doscreenelementmorph \{id = song_won_text
		alpha = 0}
	doscreenelementmorph \{id = player1wins_text
		alpha = 0}
	doscreenelementmorph \{id = player2wins_text
		alpha = 0}
endscript

script reset_hud 
	reset_hud_text <...>
	if ($game_mode = p2_battle || $boss_battle = 1)
		destroy_battle_alert_frames
		create_battle_alert_frames
	endif
endscript

script move_hud_to_default \{time = 0.01}
	spawnscriptnow move_2d_elements_to_default params = {morph_time = <time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	getsongtimems
	initial_time = (<time> * 1.0)
	if ($boss_battle = 1)
		if NOT ($devil_finish = 1)
			spawnscriptnow \{create_battle_death_meter}
		endif
	endif
	begin
	getsongtimems
	delta = ((<time> - <initial_time>) / (<move_time>))
	if (<delta> > 1.0)
		delta = 1.0
	endif
	morph_2d_hud_elements <...>
	if (<delta> = 1.0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	off_set_drop = (0.0, 0.0)
	off_set = (50.0, 0.0)
	if ($game_mode = p2_faceoff)
		off_set_drop = (0.0, 50.0)
	endif
	rot = -5
	time_to_move = 0.1
	morph_2d_hud_elements <...>
	wait \{0.1
		seconds}
	<off_set> = (-25.0, 0.0)
	if ($game_mode = p2_faceoff)
		<off_set_drop> = (0.0, -25.0)
	endif
	<rot> = 5
	<time_to_move> = 0.125
	morph_2d_hud_elements <...>
	wait \{0.125
		seconds}
	<rot> = 0
	<off_set_drop> = (0.0, 0.0)
	<off_set> = (0.0, 0.0)
	<time_to_move> = 0.1
	morph_2d_hud_elements <...>
endscript

script morph_2d_hud_elements \{off_set = (0.0, 0.0)
		off_set_drop = (0.0, 0.0)
		time_to_move = 0
		rot = 0}
	if ($current_num_players = 2)
		if ($game_mode = p2_career || $game_mode = p2_coop)
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
			new_rock_pos = rock_pos
			new_score_pos = score_pos
		else
			new_rock_pos = rock_pos_p1
			new_score_pos = score_pos_p1
			intro_rock_pos = offscreen_rock_pos_p1
			intro_score_pos = offscreen_score_pos_p1
		endif
	elseif ($player1_status.highway_layout = solo_highway)
		if ($game_mode = p2_battle)
			new_rock_pos = rock_pos_p1
			intro_rock_pos = offscreen_rock_pos_p1
		else
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		endif
	else
		new_rock_pos = rock_pos
		new_score_pos = score_pos
		intro_rock_pos = offscreen_rock_pos
		intro_score_pos = offscreen_score_pos
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_career || $game_mode = p2_coop)
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos) + (<delta> * ((($g_hud_2d_struct_used).rock_pos) - <off_set> - <off_set_drop>)))
	else
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_rock_pos>) + (<delta> * ((($g_hud_2d_struct_used).<new_rock_pos>) - <off_set> - <off_set_drop>)))
	endif
	if NOT ($cheat_performancemode = 1)
		if NOT ($end_credits = 1)
			if NOT ($game_mode = training)
				extendcrc \{hud2d_rock_container
					'p1'
					out = new_container}
				if screenelementexists id = <new_container>
					doscreenelementmorph id = <new_container> pos = <move_rock_pos> time = <time_to_move> rot_angle = <rot>
				endif
			endif
			extendcrc \{hud2d_score_container
				'p1'
				out = new_container}
			if screenelementexists id = <new_container>
				move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * ((($g_hud_2d_struct_used).<new_score_pos>) + <off_set>)))
				doscreenelementmorph id = <new_container> pos = <move_score_pos> time = <time_to_move>
			endif
		endif
		if NOT ($devil_finish = 1)
			extendcrc \{hud2d_rock_container
				'p2'
				out = new_container}
			if screenelementexists id = <new_container>
				move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
				doscreenelementmorph id = <new_container> pos = <move_rock_pos_p2> time = <time_to_move> rot_angle = <rot>
			endif
			extendcrc \{hud2d_score_container
				'p2'
				out = new_container}
			if screenelementexists id = <new_container>
				move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
				doscreenelementmorph id = <new_container> pos = <move_score_pos_p2> time = <time_to_move>
			endif
		endif
	endif
	morph_gamertags <...>
endscript

script split_text_into_array_elements \{text = "OOPS"
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	stringtochararray string = <text>
	getarraysize <char_array>
	if NOT gotparam \{parent}
		parent = root_window
	endif
	if gotparam \{id}
		createscreenelement {
			type = containerelement
			parent = <parent>
			pos = (0.0, 0.0)
			id = <id>
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			pos = (0.0, 0.0)
		}
	endif
	parent_container = <id>
	fit_scale = 1.0
	if gotparam \{fit_dims}
		createscreenelement {
			type = textelement
			parent = <parent_container>
			text = <text>
			font = text_a1
			scale = (<flags>.scale)
		}
		getscreenelementdims id = <id>
		stringlength string = <text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <id>
	endif
	if gotparam \{centered}
		half_width = ((<array_size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	i = 0
	begin
	createscreenelement {
		type = textelement
		parent = <parent_container>
		pos = <text_pos>
		text = (<char_array> [<i>])
		<flags>
		scale = (<flags>.scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	createscreenelement {
		type = textelement
		parent = <parent_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [center center]
		pos = <text_pos>
		alpha = (<flags>.alpha)
		scale = (<flags>.scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	if NOT screenelementexists id = <id>
		return
	endif
	getscreenelementchildren id = <id>
	getarraysize \{children}
	i = 0
	begin
	if screenelementexists id = (<children> [<i>])
		getscreenelementprops id = (<children> [<i>])
		(<children> [<i>]) :settags pos = <pos> scale = <scale>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getstarttime
	last_time = <starttime>
	begin
	getstarttime
	if ((<starttime> - <last_time>) >= <wait_time>)
		break
	else
		i = 0
		begin
		if screenelementexists id = (<children> [<i>])
			(<children> [<i>]) :gettags
			getrandomvalue \{a = -10
				b = 10
				name = rand_x}
			getrandomvalue \{a = -10
				b = -10
				name = rand_y}
			getrandomvalue \{a = 0
				b = 3
				name = rand_rot}
			getrandomvalue \{a = 0.7
				b = 1.3
				name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			setscreenelementprops id = (<children> [<i>]) pos = (<pos> + <rand_pos>) rot_angle = <rand_rot>
			doscreenelementmorph id = (<children> [<i>]) scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		wait \{0.075
			seconds}
		<i> = 0
		begin
		if screenelementexists id = (<children> [<i>])
			(<children> [<i>]) :gettags
			setscreenelementprops id = (<children> [<i>]) pos = <pos> rot_angle = <rand_rot>
			doscreenelementmorph id = (<children> [<i>]) scale = <scale>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT screenelementexists id = <id>
		return
	endif
	getscreenelementchildren id = <id>
	getarraysize \{children}
	i = 0
	explode_dir = 1
	begin
	if screenelementexists id = (<children> [<i>])
		switch (<explode_dir>)
			case 1
			getrandomvalue \{a = -2000
				b = 0
				name = rand_x}
			getrandomvalue \{a = -2000
				b = -200
				name = rand_y}
			case 2
			getrandomvalue \{a = 1280
				b = 3280
				name = rand_x}
			getrandomvalue \{a = -2000
				b = -200
				name = rand_y}
			case 3
			getrandomvalue \{a = 1280
				b = 3280
				name = rand_x}
			getrandomvalue \{a = 920
				b = 2720
				name = rand_y}
			case 4
			getrandomvalue \{a = -2000
				b = 0
				name = rand_x}
			getrandomvalue \{a = 920
				b = 2720
				name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		getrandomvalue \{a = 0
			b = 180
			name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		doscreenelementmorph id = (<children> [<i>]) pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if screenelementexists id = (<children> [<i>])
		doscreenelementmorph id = (<children> [<i>]) pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_size> / 2)
endscript

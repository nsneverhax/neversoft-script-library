
script setup_sprites 
	setup_main_button_event_mappings
	createscreenelement \{type = containerelement
		parent = root_window
		id = hud_window
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	setup_pause
endscript
hide_hud_elements = 0
hud_screen_elements = [
	{
		id = star_power_ready_text
		text = qs(0x8ba36464)
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
]

script setup_hud 
	extendcrcplayer hud_destroygroup_window <player> out = hud_destroygroup
	createscreenelement {
		type = containerelement
		parent = hud_window
		id = <hud_destroygroup>
		pos = (0.0, 0.0)
		just = [left top]
	}
	getarraysize \{$hud_screen_elements}
	array_entry = 0
	getnumplayersingame \{on_screen}
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	extendcrcplayer <id> <player> out = id
	pos = ($hud_screen_elements [<array_entry>].pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players_shown> = 2)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 3)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 4)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	createscreenelement {
		type = textelement
		parent = <hud_destroygroup>
		font = fontgrid_text_a1
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
	getplayerinfo <player> is_local_client
	getplayerinfo <player> highway_layout
	if ((<is_local_client> = 1) && (<highway_layout> = solo_highway))
		net_setup_solo_hud hud_destroygroup = <hud_destroygroup> player = <player>
	else
		update_hud_layout
		extendcrcplayer hud_2d_container <player> out = new_2d_container
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
		create_2d_hud_elements parent = <new_2d_container> player = <player> elements_structure = $g_hud_2d_struct_used
		if ($hide_hud_elements = 1)
			setscreenelementprops id = <new_2d_container> hide
		endif
	endif
	if ($display_debug_input = 1)
		extendcrcplayer input_text <player> out = input_id
		createscreenelement {
			type = textelement
			parent = <hud_destroygroup>
			font = debug
			just = [left top]
			scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			text = qs(0x8c30363c)
			pos = (64.0, 64.0)
			id = <input_id>
		}
	endif
	reset_hud_text player = <player>
endscript

script setup_band_hud \{force_layout = 0}
	printf \{channel = zdebug
		qs(0x49729532)}
	if (<force_layout> = 0)
		update_hud_layout
	endif
	if structurecontains \{structure = $g_hud_2d_struct_used
			desc_interface}
		createscreenelement \{parent = root_window
			id = hud_misc_root
			type = containerelement
			pos = (0.0, 0.0)
			z_priority = 0
			alpha = 1}
		createscreenelement {
			parent = root_window
			id = hud_root
			type = descinterface
			desc = ($g_hud_2d_struct_used.desc_interface)
			pos = (0.0, 0.0)
			z_priority = 0
			alpha = 0
		}
		if NOT resolvescreenelementid \{id = {
					hud_root
					child = 0
				}
				param = hud_container}
			requireparams \{[
					hud_container
				]
				all}
			return
		endif
		gamemode_gettype
		hide_band_death_meter
		if (<type> = career || <type> = quickplay)
			init_upper_container
			hud_attach_star_meter
		else
			if hud_root :desc_resolvealias \{name = alias_upper_container
					param = upper_group}
				<upper_group> :die
			endif
		endif
		if ($calibrate_lag_enabled = 1 || $cheat_hudfreemode = 1)
			if hud_root :desc_resolvealias \{name = alias_upper_container
					param = upper_group}
				<upper_group> :se_setprops hide
			endif
		endif
		if (<type> = competitive && (gamemode_isteamgame))
			if hud_root :desc_resolvealias \{name = alias_versus_meter
					param = versus_meter}
				hud_attach_widget_band_versus_meter parent_id = <versus_meter>
			endif
			count_players_by_part \{part = guitar}
			<num_guitar> = <players_by_part>
			count_players_by_part \{part = drum}
			<num_drum> = <players_by_part>
			count_players_by_part \{part = vocals}
			<num_vocals> = <players_by_part>
			count_players_by_part \{part = bass}
			<num_bass> = <players_by_part>
			<num_guitar> = (<num_guitar> + <num_bass>)
			getnumplayersingame \{on_screen}
			num_highways = (<num_guitar> + <num_drum>)
			if (<num_vocals> > 2 && <num_highways> = 0)
				hud_root :se_setprops \{hud_standard_band_meter_pos = (165.0, 40.0)}
			endif
		elseif hud_root :desc_resolvealias \{name = alias_versus_meter
				param = versus_meter}
			<versus_meter> :die
		endif
		if (<type> = faceoff || <type> = pro_faceoff)
			if hud_root :desc_resolvealias \{name = alias_hud_scores_stack
					param = scores_stack}
				<scores_stack> :se_setprops unhide
				hud_attach_scores_stack_widget parent_id = <scores_stack>
			endif
		endif
		hud_hide_optional_vocals \{desc_id = hud_root}
		if ($hide_hud_elements = 1 || $cheat_performancemode = 1)
			if NOT (<type> = freeplay)
				hud_root :se_setprops \{hide}
			endif
		endif
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> <= 0)
		change \{sysnotify_ingame_position = topright}
	elseif (<num_vocalists_shown> = 1)
		getnumplayersingame \{on_screen}
		if (<num_players_shown> = 1)
			change \{sysnotify_ingame_position = topright}
		else
			change \{sysnotify_ingame_position = centerright}
		endif
	else
		change \{sysnotify_ingame_position = centerright}
	endif
	setsystemnotificationposition pos = ($sysnotify_ingame_position)
	if ($cheat_focusmode = 1 || $calibrate_lag_enabled = 1)
		createscreenelement \{type = spriteelement
			parent = hud_misc_root
			texture = white
			rgba = [
				0
				0
				0
				255
			]
			dims = (1280.0, 720.0)
			pos = (640.0, 360.0)
			z_priority = -9999}
		playigccam \{id = cs_view_cam_id
			name = ch_view_cam
			viewport = bg_viewport
			lockto = world
			pos = (100000000.0, 100000000.0, 100000000.0)
			quat = (0.0, 0.0, 0.0)
			fov = 72.0
			play_hold = 1
			interrupt_current}
	endif
endscript

script debug_refresh_hud 
	destroy_band_hud
	setup_band_hud \{force_layout = 1}
	hud_root :se_setprops \{alpha = 1}
endscript

script count_players_by_part 
	requireparams \{[
			part
		]
		all}
	<player> = 1
	<players_by_part> = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = <part>
			<players_by_part> = (<players_by_part> + 1)
		endif
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
	return players_by_part = <players_by_part>
endscript

script get_player_by_part 
	requireparams \{[
			part
		]
		all}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if playerinfoequals <player> part = <part>
			return player_part = <player>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return \{player_part = -1}
endscript

script update_hud_layout 
	<desired_layout> = null
	count_players_by_part \{part = guitar}
	<num_guitar> = <players_by_part>
	count_players_by_part \{part = drum}
	<num_drum> = <players_by_part>
	count_players_by_part \{part = vocals}
	<num_vocals> = <players_by_part>
	count_players_by_part \{part = bass}
	<num_bass> = <players_by_part>
	<num_guitar> = (<num_guitar> + <num_bass>)
	getnumplayersingame \{on_screen}
	num_highways = (<num_guitar> + <num_drum>)
	<desired_layout> = hud_standard
	if (<num_players_shown> = 1 && <num_highways> = 1)
		<desired_layout> = hud_standard_1p
	elseif (<num_vocals> > 0 && <num_highways> = 1)
		<desired_layout> = hud_standard_1g1v
	elseif (<num_vocals> = 1 && <num_highways> = 0)
		<desired_layout> = hud_standard_1v
	else
		<desired_layout> = hud_standard
	endif
	printf 'HUD layout: %s' s = <desired_layout> donotresolve
	if globalexists name = <desired_layout>
		change g_hud_2d_struct_used = $<desired_layout>
	else
		printstruct <...>
		softassert 'Unknown hud layout %s' s = <desired_layout>
		change \{g_hud_2d_struct_used = $hud_3g1v}
	endif
	printstruct channel = zdebug <...>
endscript

script destroy_hud 
	requireparams \{[
			player
		]
		all}
	extendcrcplayer hud_destroygroup_window <player> out = hud_destroygroup
	if screenelementexists id = <hud_destroygroup>
		destroyscreenelement id = <hud_destroygroup>
	endif
	formattext checksumname = new_2d_container 'HUD_2D_Containerp%p' p = <player>
	if screenelementexists id = <new_2d_container>
		destroyscreenelement id = <new_2d_container>
	endif
	formattext checksumname = player_container 'HUD_Note_Streak_Combo%d' d = <player>
	destroy_menu menu_id = <player_container>
endscript

script destroy_band_hud 
	detachhudwidget \{all}
	if screenelementexists \{id = hud_root}
		destroyscreenelement \{id = hud_root}
	endif
	if screenelementexists \{id = hud_misc_root}
		destroyscreenelement \{id = hud_misc_root}
	endif
	change sysnotify_ingame_position = ($sysnotify_menus_position)
	setsystemnotificationposition pos = ($sysnotify_ingame_position)
endscript

script show_hud 
	if screenelementexists \{id = hud_destroygroup_windowp1}
		legacydoscreenelementmorph \{id = hud_destroygroup_windowp1
			alpha = 1}
	endif
	if screenelementexists \{id = hud_root}
		setscreenelementprops \{id = hud_root
			alpha = 1}
	endif
endscript

script hide_hud 
	if NOT retailbuild
		if ($alternate_viewer_hud_behavior = 1)
			return
		endif
	endif
	if screenelementexists \{id = hud_destroygroup_windowp1}
		legacydoscreenelementmorph \{id = hud_destroygroup_windowp1
			alpha = 0}
	endif
	if screenelementexists \{id = hud_root}
		setscreenelementprops \{id = hud_root
			alpha = 0}
	endif
endscript

script reset_hud_text 
	requireparams \{[
			player
		]
		all}
	getarraysize \{$hud_screen_elements}
	<i> = 0
	begin
	name = ($hud_screen_elements [<i>].id)
	extendcrcplayer <name> <player> out = name
	setscreenelementprops id = <name> alpha = 0
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script reset_hud 
	reset_hud_text player = <player>
endscript

script move_hud_to_default \{time = 0.01}
	spawnscriptnow move_2d_elements_to_default params = {morph_time = <time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	getsongtimems
	initial_time = (<time> * 1.0)
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
	if screenelementexists \{id = hud_root}
		hud_root :se_setprops \{alpha = 1
			time = 0.25}
	endif
	off_set_drop = (0.0, 0.0)
	off_set = (50.0, 0.0)
	rot = -5
	time_to_move = 0.1
	morph_2d_hud_elements <...>
	wait \{0.1
		seconds}
	<off_set> = (-25.0, 0.0)
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
	if ($is_network_game = 1)
		if structurecontains \{structure = $g_hud_2d_struct_used
				desc_interface}
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				getplayerinfo <player> hud_parent
				if screenelementexists \{id = hud_root}
					if hud_root :desc_resolvealias name = <hud_parent> param = parent_id
						if screenelementexists id = {<parent_id> child = gamertag}
							resolvescreenelementid param = obj_id id = [
								{id = <parent_id>}
								{local_id = gamertag}
							]
							resolvescreenelementid param = container_id id = [
								{id = <parent_id>}
								{local_id = gamertag}
								{local_id = gamertag}
							]
							getplayerinfo <player> is_local_client
							if (<is_local_client> = 1)
								<obj_id> :obj_spawnscript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0}
							else
								<obj_id> :obj_spawnscript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0.5}
							endif
						endif
					endif
				endif
				getnextplayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
	endif
endscript

script fadeout_local_gamertags 
	<gamertag_id> :se_setprops alpha = <alpha> time = 1.5
	wait \{1.0
		seconds}
	if (<alpha> = 0)
		if screenelementexists id = <obj_id>
			<obj_id> :die
		endif
	endif
endscript

script morph_2d_hud_elements \{off_set = (0.0, 0.0)
		off_set_drop = (0.0, 0.0)
		time_to_move = 0
		rot = 0
		hud_version = gh3}
	<hud_version> = ($g_hud_2d_struct_used.hud_version)
	if (<hud_version> = gh3)
		getnumplayersingame
		if (<num_players> > 1)
			if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
				intro_rock_pos = offscreen_rock_pos
				intro_score_pos = offscreen_score_pos
				new_rock_pos = rock_pos
				new_score_pos = score_pos
			else
				if ($game_mode = p2_pro_faceoff)
					new_rock_pos = rock_pos
					intro_rock_pos = offscreen_rock_pos
				else
					new_rock_pos = rock_pos_p1
					intro_rock_pos = offscreen_rock_pos_p1
				endif
				new_score_pos = score_pos_p1
				intro_score_pos = offscreen_score_pos_p1
			endif
		elseif playerinfoequals \{1
				highway_layout = solo_highway}
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		else
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		endif
		final_rock_pos = (($g_hud_2d_struct_used).<new_rock_pos>)
		final_score_pos = (($g_hud_2d_struct_used).<new_score_pos>)
		getdisplaysettings
		if (<widescreen> = false)
			<final_score_pos> = (<final_score_pos> + (($g_hud_2d_struct_used).offset4by3_score))
			<final_rock_pos> = (<final_rock_pos> + (($g_hud_2d_struct_used).offset4by3_rock))
		endif
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_rock_pos>) + (<delta> * (<final_rock_pos> - <off_set> - <off_set_drop>)))
		if NOT ($cheat_performancemode = 1)
			if ($end_credits = 0)
				if NOT ($game_mode = practice)
					extendcrc \{hud2d_rock_container
						'p1'
						out = new_container}
					if screenelementexists id = <new_container>
						setscreenelementprops id = <new_container> pos = <move_rock_pos> time = <time_to_move> rot_angle = <rot>
					endif
				endif
				extendcrc \{hud2d_score_container
					'p1'
					out = new_container}
				if screenelementexists id = <new_container>
					move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * (<final_score_pos> + <off_set>)))
					setscreenelementprops id = <new_container> pos = <move_score_pos> time = <time_to_move>
				endif
			endif
			extendcrc \{hud2d_rock_container
				'p2'
				out = new_container}
			if screenelementexists id = <new_container>
				move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
				setscreenelementprops id = <new_container> pos = <move_rock_pos_p2> time = <time_to_move> rot_angle = <rot>
			endif
			extendcrc \{hud2d_score_container
				'p2'
				out = new_container}
			if screenelementexists id = <new_container>
				move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
				setscreenelementprops id = <new_container> pos = <move_score_pos_p2> time = <time_to_move>
			endif
		endif
	endif
endscript

script split_text_into_array_elements \{text = qs(0x6df5a0fe)
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
			font = fontgrid_text_a3
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
	saved_id = <id>
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
			setscreenelementprops id = (<children> [<i>]) pos = (<pos> + <rand_pos>) rot_angle = <rand_rot> scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		wait \{0.075
			seconds}
		<i> = 0
		begin
		if screenelementexists id = (<children> [<i>])
			(<children> [<i>]) :gettags
			setscreenelementprops id = (<children> [<i>]) pos = <pos> rot_angle = <rand_rot> scale = <scale>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		<id> = <saved_id>
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT screenelementexists id = <id>
		return
	endif
	if NOT getscreenelementchildren id = <id>
		return
	endif
	getarraysize \{children}
	i = 0
	explode_dir = 1
	if (<array_size> < 2)
		return
	endif
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
		setscreenelementprops id = (<children> [<i>]) pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if screenelementexists id = (<children> [<i>])
		setscreenelementprops id = (<children> [<i>]) pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_size> / 2)
endscript

script start_friends_lb_box 
	printf \{qs(0xf9aa4c50)}
	getfirstplayer
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if (<part> = vocals)
		instrument = 'mic'
	elseif (<part> = bass)
		instrument = 'backup'
	elseif (<part> = drum)
		instrument = 'drums'
	else
		<instrument> = ($part_list_props.<part>.text_nl)
	endif
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	formattext checksumname = leaderboard_id '%s_%i' s = <song_prefix> i = <instrument> addtostringlookup = true
	netsessionfunc {
		obj = stats
		func = get_stats
		params = {
			leaderboard_id = <leaderboard_id>
			callback = start_friends_lb_box_callback
			offset = 1
			columns = <columns>
			num_rows = 100
			listtype = friends
			controller_index = <controller>
		}
	}
endscript

script start_friends_lb_box_callback 
	printf \{qs(0x3ad112fa)}
	printstruct <...>
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_friend_score
				param = friend_score_box}
			friends_scores = []
			test_score = 115000
			i = 0
			begin
			formattext textname = text_name qs(0xfe650eb4) d = <i>
			new_friend_score = {
				name = <test_name>
				score = <test_score>
			}
			addarrayelement array = <friends_scores> element = <new_friend_score>
			<friends_scores> = <array>
			<test_score> = (<test_score> - 1000)
			<i> = (<i> + 1)
			repeat 100
			<friend_score_box> :settags scores = <friends_scores>
			<friend_score_box> :gettags
			getarraysize <scores>
			if (<array_size> > 0)
				setplayerinfo 1 friends_best_score = (<scores> [(<array_size> -1)].score)
				formattext textname = score_text qs(0x76b3fda7) d = (<scores> [(<array_size> -1)].score)
				<friend_score_box> :se_setprops score_text = <score_text>
				<friend_score_box> :se_setprops name_text = (<scores> [(<array_size> -1)].name)
			endif
		endif
	endif
endscript

script hud_update_friends_score 
	getfirstplayer
	getplayerinfo <player> score
	if screenelementexists \{id = hud_root}
		if hud_root :desc_resolvealias \{name = alias_friend_score
				param = friend_score_box}
			<friend_score_box> :gettags
			if gotparam \{scores}
				getarraysize <scores>
				if (<array_size> > 0)
					i = 0
					begin
					if (<scores> [<i>].score < <score>)
						if (<i> > 0)
							setplayerinfo 1 friends_best_score = (<scores> [(<i> -1)].score)
							formattext textname = score_text qs(0x76b3fda7) d = (<scores> [(<i> -1)].score)
							<friend_score_box> :se_setprops score_text_pos = (0.0, -90.0) time = 0.15
							<friend_score_box> :se_setprops name_text_pos = (0.0, -90.0) time = 0.15
							<friend_score_box> :se_waitprops
							<friend_score_box> :se_setprops score_text = <score_text>
							<friend_score_box> :se_setprops name_text = (<scores> [(<i> -1)].name)
							<friend_score_box> :se_setprops score_text_pos = (0.0, 90.0)
							<friend_score_box> :se_setprops name_text_pos = (0.0, 90.0)
							<friend_score_box> :se_setprops score_text_pos = (0.0, 0.0) time = 0.15
							<friend_score_box> :se_setprops name_text_pos = (0.0, 0.0) time = 0.15
							<friend_score_box> :se_waitprops
						endif
						break
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
			endif
		endif
	endif
endscript

script init_upper_container 
	<cnt> = 0
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		if (<part> = vocals)
			cnt = (<cnt> + 1)
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<cnt> >= 1)
		shift_upper_hud
	else
		shift_upper_hud \{dx = 40}
	endif
endscript

script shift_upper_hud \{dx = 120}
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_upper_container
			param = upper_group}
		printf \{qs(0x20f5a935)
			channel = zdebug}
		return
	endif
	rel_pos = ((0.0, 1.0) * <dx>)
	<upper_group> :se_setprops pos = {relative <rel_pos>}
endscript

script update_score_meter_spawned 
	begin
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0x3030713c)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_score
			param = score_meter}
		printf \{qs(0xcd78f553)
			channel = zdebug}
		return
	endif
	update_score_meter
	wait \{15
		gameframes}
	repeat
endscript

script update_score_meter 
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0x3030713c)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_score
			param = score_meter}
		printf \{qs(0xcd78f553)
			channel = zdebug}
		return
	endif
	score = 0
	if gamemode_isbandscoring
		getbandinfo \{1
			score}
	else
		getfirstplayer
		getplayerinfo <player> score
	endif
	formattext textname = score_text qs(0x48c6d14c) d = <score> decimalplaces = 0
	<score_meter> :se_setprops score_text = <score_text>
endscript

script update_star_meter_spawned 
	begin
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_star
			param = star_meter}
		printf \{qs(0xaaaab05d)
			channel = zdebug}
		return
	endif
	update_star_meter
	wait \{1
		gameframes}
	repeat
endscript

script update_star_meter 
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_star
			param = star_meter}
		printf \{qs(0xaaaab05d)
			channel = zdebug}
		return
	endif
	stars = 0
	if gamemode_isbandscoring
		getbandinfo \{1
			projected_song_stars}
	else
		getfirstplayer
		getplayerinfo <player> projected_song_stars
	endif
	mathfloor <projected_song_stars>
	diff = (<projected_song_stars> - <floor>)
	led_index = 1
	led_struct = {}
	dx = 0.2
	thresh = <dx>
	begin
	formattext checksumname = led_checksum 'star_segment_0%p_alpha' p = <led_index>
	if (<diff> > <thresh>)
		alpha = 1.0
	else
		alpha = 0.0
	endif
	addparam structure_name = led_struct name = <led_checksum> value = <alpha>
	thresh = (<thresh> + <dx>)
	led_index = (<led_index> + 1)
	repeat 5
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen
			out = player_idx}
		begin
		getplayerinfo <player_idx> current_run
		getplayerinfo <player_idx> total_notes
		if (<current_run> != <total_notes>)
			<star_meter> :se_setprops meter_star_bg_alpha = 0.0
		endif
		getnextplayer on_screen player = <player_idx> out = player_idx
		repeat <num_players_shown>
	endif
	formattext textname = star_text qs(0x48c6d14c) d = <floor> decimalplaces = 0
	addparam structure_name = led_struct name = stars_text value = <star_text>
	<star_meter> :se_setprops <led_struct>
endscript

script update_combo_meter_spawned 
	begin
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_streak
			param = streak_meter}
		printf \{qs(0x47832683)
			channel = zdebug}
		return
	endif
	update_combo_meter
	wait \{1
		gameframes}
	repeat
endscript

script update_combo_meter 
	if NOT screenelementexists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_streak
			param = streak_meter}
		printf \{qs(0x47832683)
			channel = zdebug}
		return
	endif
	if gamemode_isbandscoring
		getbandcurrentrun \{player = 1}
	else
		getfirstplayer
		getplayerinfo <player> current_run
	endif
	num = <current_run>
	ones_place = 0
	tens_place = 0
	hundreds_place = 0
	thousands_place = 0
	if (<num> > 10)
		mod a = <num> b = 10
		ones_place = <mod>
	else
		ones_place = <num>
	endif
	if (<num> > 100)
		mod a = <num> b = 100
		tens_place = (<mod> / 10)
	else
		tens_place = (<num> / 10)
	endif
	if (<num> > 1000)
		mod a = <num> b = 1000
		hundreds_place = (<mod> / 100)
	else
		hundreds_place = (<num> / 100)
	endif
	thousands_place = (<num> / 1000)
	digits_struct = {}
	if (<current_run> < 20)
		addparam \{structure_name = digits_struct
			name = meter_streak_master_alpha
			value = 0.0}
	else
		addparam \{structure_name = digits_struct
			name = meter_streak_master_alpha
			value = 1.0}
	endif
	if (<current_run> > 999)
		addparam \{structure_name = digits_struct
			name = streak_text_01_alpha
			value = 1}
	else
		addparam \{structure_name = digits_struct
			name = streak_text_01_alpha
			value = 0.2}
	endif
	if (<current_run> > 99)
		addparam \{structure_name = digits_struct
			name = streak_text_02_alpha
			value = 1}
	else
		addparam \{structure_name = digits_struct
			name = streak_text_02_alpha
			value = 0.2}
	endif
	if (<current_run> > 9)
		addparam \{structure_name = digits_struct
			name = streak_text_03_alpha
			value = 1}
	else
		addparam \{structure_name = digits_struct
			name = streak_text_03_alpha
			value = 0.2}
	endif
	formattext textname = ones_text qs(0x48c6d14c) d = <ones_place>
	formattext textname = tens_text qs(0x48c6d14c) d = <tens_place>
	formattext textname = hundreds_text qs(0x48c6d14c) d = <hundreds_place>
	formattext textname = thousands_text qs(0x48c6d14c) d = <thousands_place>
	addparam structure_name = digits_struct name = streak_text_04_text value = <ones_text>
	addparam structure_name = digits_struct name = streak_text_03_text value = <tens_text>
	addparam structure_name = digits_struct name = streak_text_02_text value = <hundreds_text>
	addparam structure_name = digits_struct name = streak_text_01_text value = <thousands_text>
	<streak_meter> :se_setprops <digits_struct>
endscript
force_fail_vignette_on = 0

script create_band_failing_vignette 
	if NOT screenelementexists \{id = vignette_of_failure}
		createscreenelement \{id = vignette_of_failure
			parent = root_window
			type = descinterface
			desc = 'band_fail_vignette'
			z_priority = 25
			pos = (0.0, 0.0)
			root_alpha = 0}
		vignette_of_failure :obj_spawnscriptnow \{band_failing_vignette_pulse}
	endif
endscript

script band_failing_vignette_on 
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff)
		return
	endif
	if ($game_mode = freeplay)
		return
	endif
	gamemode_gettype
	if (<type> = competitive)
		return
	endif
	create_band_failing_vignette
	vignette_of_failure :se_setprops \{root_alpha = 1.0
		time = 0.5}
endscript

script band_failing_vignette_pulse 
	begin
	se_setprops \{outline_rgba = [
			128
			0
			0
			255
		]
		time = 0.5}
	se_waitprops
	se_setprops \{outline_rgba = [
			0
			0
			0
			255
		]
		time = 0.5}
	se_waitprops
	repeat
endscript

script band_failing_vignette_off 
	if ($force_fail_vignette_on = 1)
		return
	endif
	create_band_failing_vignette
	vignette_of_failure :se_setprops \{root_alpha = 0.0
		time = 0.5}
endscript

script destroy_band_failing_vignette 
	destroyscreenelement \{id = vignette_of_failure}
endscript

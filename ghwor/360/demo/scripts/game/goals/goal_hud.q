g_debug_comp_scoreboard = 0

script setup_competitive_meter 
	if ($cheat_hudfreemode = 1)
		return
	endif
	getnumplayersingame \{on_screen}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		attach_competitive_meters_to_highway player = <player>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	if ($g_debug_comp_scoreboard = 1)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			add_player_to_competitive_scoreboard player = <player>
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	else
		getnumplayersingame \{remote}
		if (<num_players> > 0)
			getfirstplayer \{remote}
			begin
			getplayerinfo <player> is_onscreen
			if (<is_onscreen> = 0)
				add_player_to_competitive_scoreboard player = <player>
			else
				attach_competitive_meters_to_highway player = <player>
			endif
			getnextplayer player = <player> remote
			repeat <num_players>
		endif
	endif
endscript

script attach_competitive_meters_to_highway 
	requireparams \{[
			player
		]}
	getplayerinfo <player> part
	get_highway_hud_root_id player = <player>
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if (<part> != vocals)
		formattext checksumname = hud_cont 'sidebar_container_left_hudp%p' p = <player> addtostringlookup = true
		if NOT screenelementexists id = <hud_cont>
			return
		endif
		get_num_non_vocals_players_onscreen
		pos = (0.0, 0.0)
		switch <num_non_vocals_players>
			case 1
			<pos> = (-115.0, 105.0)
			case 2
			<pos> = (-105.0, 105.0)
			case 3
			<pos> = (-102.0, 95.0)
			case 4
			<pos> = (-95.0, 80.0)
		endswitch
		formattext checksumname = rank_id 'p%p_competitive_rank' p = <player>
		if screenelementexists id = <rank_id>
			destroyscreenelement id = <rank_id>
		endif
		createscreenelement {
			parent = <hud_cont>
			id = <rank_id>
			type = descinterface
			desc = 'HUD_SideBar_RankMeter'
			pos = <pos>
			autosizedims = true
			preserve_local_orientation = true
			rot_angle = 0
		}
		<rank_id> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_id>}
		if NOT screenelementexists id = <highway_hud_root>
			scriptassert 'player %p hud root not found in attach_competitive_meters_to_highway!' p = <player>
		endif
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			safe_show id = <hud_player_meter>
			if <hud_player_meter> :desc_resolvealias name = alias_hud_sidebar_rankmeter param = side_rank_meter
				safe_hide id = <side_rank_meter>
			endif
			if <hud_player_meter> :desc_resolvealias name = alias_vocals_strikes_meter param = strikes_meter
				safe_hide id = <strikes_meter>
			endif
		endif
	else
		if NOT screenelementexists id = <highway_hud_root>
			scriptassert 'player %p hud root not found to attach vocals competitive meter' p = <player>
		endif
		vocal_highway_hud_init_competitive_meter highway_hud_root = <highway_hud_root> player = <player>
		return
	endif
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		scriptassert 'Player %p hud root not found for update_comptitive_highway_meter' p = <player>
	endif
	if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias name = alias_competitive_score param = score_id
	endif
	get_num_non_vocals_players_onscreen
	getnumplayersingame \{on_screen}
	if (<num_players_shown> = 1 && <num_non_vocals_players> = 1)
		net_one_highway_meter_pos = (10.0, -153.0)
		<highway_hud_root> :se_setprops player_meter_pos = <net_one_highway_meter_pos>
	endif
	ruleset = ($competitive_rules)
	if (<ruleset> = faceoff)
		if (<part> = vocals)
			<divide_by_10> = true
		else
			<divide_by_10> = false
		endif
		getplayerinfo <player> hud_id
		attachhudwidget {
			input = {
				object = <hud_id>
				value = note_streak
			}
			outputs = [
				{
					type = seinttostring
					desc_id = <hud_player_meter>
					property = meter_text
					divide_by_10 = <divide_by_10>
				}
				{
					type = screenelementconditionalint
					desc_id = <hud_player_meter>
					property = meter_text_alpha
					value_range = [30 10000000]
				}
			]
		}
	endif
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 1 element_id = <rank_id>}
	}
endscript

script update_competitive_highway_meter 
	requireparams \{[
			player
			rank_id
			rank
			score
		]
		all}
	getplayerinfo <player> part
	if (<part> != vocals)
		formattext checksumname = rank_id 'p%p_competitive_rank' p = <player>
		if NOT screenelementexists id = <rank_id>
			printf qs(0xabb60701) a = <rank_id> p = <player>
			return
		endif
	endif
	competitive_meter_get_rank_text rank = <rank>
	<rank_id> :se_setprops rank_text = <rank_text>
	if (<rank> = 1)
		<rank_id> :se_setprops burstcontainer_alpha = 1
	else
		<rank_id> :se_setprops burstcontainer_alpha = 0
	endif
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		printf qs(0x2b813925) p = <player>
		return
	endif
	if (<part> = vocals)
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if NOT screenelementexists id = <competitive_meters_id>
			printf qs(0xa2194316) a = <player>
			return
		endif
		<competitive_meters_id> :desc_resolvealias name = alias_competitive_score param = score_id
	else
		get_highway_hud_root_id player = <player>
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :desc_resolvealias name = alias_competitive_score param = score_id
		endif
		highway_hud_id = <highway_hud_root>
	endif
	if NOT screenelementexists id = <score_id>
		printf qs(0xc9653fcc) p = <player>
		return
	endif
	formattext textname = score_text qs(0x8c5c152d) n = <score> usecommas
	<score_id> :se_setprops text_text = <score_text>
endscript

script competitive_meter_get_rank_text 
	rank_text = qs(0xbd449b95)
	switch <rank>
		case 0
		rank_text = qs(0xc4992bba)
		case 1
		formattext textname = rank_text qs(0x886c78ab) n = <rank>
		case 2
		formattext textname = rank_text qs(0x60dde5b8) n = <rank>
		case 3
		formattext textname = rank_text qs(0x7a120d9f) n = <rank>
		case 4
		case 5
		case 6
		case 7
		case 8
		formattext textname = rank_text qs(0xf3cc1d4f) n = <rank>
	endswitch
	return rank_text = <rank_text>
endscript

script add_player_to_competitive_scoreboard 
	requireparams \{[
			player
		]
		all}
	vocals_get_num_vocalists_onscreen
	get_num_non_vocals_players_onscreen
	gamemode_gettype
	if checksumequals a = <type> b = competitive
		if (<num_vocalists_shown> > 0 && <num_non_vocals_players> > 0)
			return
		endif
	endif
	if (<num_vocalists_shown> > 1 && <num_non_vocals_players> = 0)
		if hud_root :desc_resolvealias \{name = alias_versus_meter
				param = versus_meter}
			return
		endif
	endif
	getscreenelementchildren \{id = hud_root}
	if NOT screenelementexists \{id = hud_root}
		scriptassert \{'hud root not found for add player to scoreboard'}
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_scoreboard_menu
			param = scoreboard_menu}
		scriptassert \{'alias_scoreboard_menu not found for add player to scoreboard'}
	endif
	getplayerinfo <player> band
	formattext checksumname = color_medium 'p%a_md' a = <band>
	formattext checksumname = color_light 'p%a_lt' a = <band>
	createscreenelement {
		parent = <scoreboard_menu>
		type = descinterface
		desc = 'comp_scoreboard_player'
		autosizedims = true
		competitive_stripe_rgba = ($uicolorref_palette.<color_medium>.rgba)
		tags = {
			player = <player>
		}
	}
	if <id> :desc_resolvealias name = alias_rankmeter param = rank_meter
		<rank_meter> :se_setprops {
		}
	endif
	countscreenelementchildren id = <scoreboard_menu>
	if (<num_vocalists_shown> = 0 && <num_non_vocals_players> > 1)
		<scoreboard_menu> :se_setprops pos = (-45.0, -45.0)
	endif
	if (<num_children> > 4)
		if (<num_vocalists_shown> > 1)
			<scoreboard_menu> :se_setprops scale = (0.63, 0.63)
		else
			<scoreboard_menu> :se_setprops scale = (0.7, 0.7)
		endif
	endif
	getplayerinfo <player> gamertag
	<id> :se_setprops gamertag_text = ($<gamertag>)
	if <id> :desc_resolvealias name = alias_rankmeter param = rank_meter
		<rank_meter> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	endif
	if gman_goalisactive \{goal = competitive}
		gman_competitivemeterfunc {
			goal = competitive
			tool = comp_meter
			func = set_element_props
			params = {player = <player> attached_to_highway = 0 element_id = <id>}
		}
	else
		getplayerinfo <player> part
		icon_texture = band_hud_guitar2
		switch (<part>)
			case guitar
			icon_texture = band_hud_guitar2
			case bass
			icon_texture = band_hud_bass2
			case drum
			icon_texture = band_hud_drums2
			case vocals
			icon_texture = band_hud_microphone2
		endswitch
		<id> :se_setprops {
			elimination_icon_texture = <icon_texture>
			right_side_alpha = 0
		}
		attachplayerinfoobserver {
			input = {
				player = <player>
				value = is_dead
			}
			output = {
				type = screenelementconditionalint
				desc_id = <id>
				property = elimination_icon_alpha
				value_range = [1 1]
			}
		}
	endif
	safe_show id = <scoreboard_menu>
endscript

script update_competitive_scoreboard_meter 
	requireparams \{[
			player
			scoreboard_id
			rank
			score
		]
		all}
	if NOT screenelementexists id = <scoreboard_id>
		scriptassert 'scoreboard %a not found in update_comptitive_scoreboard_meter' a = <scoreboard_id> p = <player>
	endif
	if <scoreboard_id> :desc_resolvealias name = alias_rankmeter param = rank_meter
		competitive_meter_get_rank_text rank = <rank>
		<rank_meter> :se_setprops rank_text = <rank_text>
		if (<rank> = 1)
			<rank_meter> :se_setprops burstcontainer_alpha = 1
		else
			<rank_meter> :se_setprops burstcontainer_alpha = 0
		endif
	endif
	formattext textname = score_text qs(0x8c5c152d) n = <score> usecommas
	<scoreboard_id> :se_setprops score_text = <score_text>
	if gman_goalisactive \{goal = competitive}
		gman_getdata goal = competitive player = <player> name = eliminated
		if (<eliminated> = 1)
			getplayerinfo <player> part
			icon_texture = band_hud_guitar2
			switch (<part>)
				case guitar
				icon_texture = band_hud_guitar2
				case bass
				icon_texture = band_hud_bass2
				case drum
				icon_texture = band_hud_drums2
				case vocals
				icon_texture = band_hud_microphone2
			endswitch
			<scoreboard_id> :se_setprops {
				elimination_icon_alpha = 1.0
				elimination_icon_texture = <icon_texture>
			}
		else
			<scoreboard_id> :se_setprops elimination_icon_alpha = 0.0
		endif
	endif
endscript

script destroy_competitive_scoreboard 
	if screenelementexists \{id = comp_scoreboard}
		destroyscreenelement \{id = comp_scoreboard}
	endif
endscript

script competitive_meter_update_strikes 
	printf channel = goal 'Goal Utility: Competitive Meter: Update Strikes (%s for player %p)' p = <player> s = <strikes>
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id player = <player>
	getplayerinfo <player> part
	if (<part> = vocals)
		formattext checksumname = container_id 'comp_strike_box_p%p' p = <player>
		if NOT screenelementexists id = <container_id>
			getplayerinfo <player> part
			if NOT (<part> = vocals)
				formattext checksumname = parent_id 'gem_containerp%p' p = <player>
				createscreenelement {
					id = <container_id>
					type = containerelement
					parent = <parent_id>
				}
			else
				formattext checksumname = parent_id 'comp_meters_p%p' p = <player>
				createscreenelement {
					id = <container_id>
					type = containerelement
					parent = <parent_id>
				}
			endif
		endif
		destroyscreenelement id = <container_id> preserve_parent
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if screenelementexists id = <competitive_meters_id>
			<competitive_meters_id> :desc_resolvealias name = alias_vocals_strikes_meter param = strikes_meter
		endif
	else
		<highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias name = alias_vocals_strikes_meter param = strikes_meter
	endif
	if gotparam \{strikes_meter}
		switch (<strikes>)
			case 0
			safe_hide id = <strikes_meter>
			<strikes_meter> :se_setprops strike1_alpha = 0.0
			<strikes_meter> :se_setprops strike2_alpha = 0.0
			case 1
			safe_show id = <strikes_meter>
			<strikes_meter> :se_setprops strike1_alpha = 1.0
			<strikes_meter> :se_setprops strike2_alpha = 0.0
			case 2
			safe_show id = <strikes_meter>
			<strikes_meter> :se_setprops strike1_alpha = 1.0
			<strikes_meter> :se_setprops strike2_alpha = 1.0
			default
			scriptassert \{'Players can only have between 0-2 strikes'}
		endswitch
	endif
endscript

script add_quickplay_challenge_alert \{challenge_instance_id = !q1768515945
		grade = !i1768515945}
	if NOT gman_goalisactive goal = <challenge_instance_id>
		debug_player = 1
	endif
	if gotparam \{debug_player}
		assigned_player = <debug_player>
	else
		gman_getassignedplayer goal_name = <challenge_instance_id>
		gman_getdata \{goal = quickplay
			name = targeted_challenge}
		gman_getgoalname goal = <challenge_instance_id>
		if (<targeted_challenge> = <goal_name>)
			return
		endif
	endif
	if gotparam \{debug_player}
		goal_name = qp_score_points
	else
		gman_getgoalname goal = <challenge_instance_id>
	endif
	if (<assigned_player> != 0)
		display_challenge_alert_icon assigned_player = <assigned_player> grade = <grade> goal_name = <goal_name>
	else
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			display_challenge_alert_icon assigned_player = <player> grade = <grade> goal_name = <goal_name>
			getnextplayer on_screen player = <player>
			repeat <num_players_shown>
		endif
	endif
	if innetgame
		if (<assigned_player> != 0)
			sendstructure callback = net_display_challenge_alert_icon data_to_send = {player_num = <assigned_player> grade = <grade> goal_name = <goal_name>}
		endif
	endif
endscript

script net_display_challenge_alert_icon 
	if ishost
		sendstructure callback = net_display_challenge_alert_icon data_to_send = {player_num = <player_num> grade = <grade> goal_name = <goal_name>}
	endif
	if gotparam \{player_num}
		if playerinfoequals <player_num> is_onscreen = 1
			if NOT playerinfoequals <player_num> is_local_client = 1
				display_challenge_alert_icon assigned_player = <player_num> grade = <grade> goal_name = <goal_name>
			endif
		endif
	endif
endscript

script display_challenge_alert_icon \{assigned_player = !i1768515945
		grade = !i1768515945
		goal_name = !q1768515945}
	if (<assigned_player> = 0)
		if NOT screenelementexists \{id = hud_root}
			return
		endif
		if NOT hud_root :desc_resolvealias \{name = alias_challenge_alert_menu
				param = alert_menu}
			return
		endif
	else
		getplayerinfo <assigned_player> part
		if (<part> = vocals)
			vocals_get_num_vocalists_on_same_highway player = <assigned_player>
			if (<num_vocalists_on_highway> > 1)
				return
			endif
			formattext checksumname = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <assigned_player>
			if NOT screenelementexists id = <vocal_combo_meter_id>
				return
			endif
			if NOT <vocal_combo_meter_id> :desc_resolvealias name = alias_challenge_alert_menu param = alert_menu
				return
			endif
		else
			get_highway_hud_root_id player = <assigned_player>
			if NOT screenelementexists id = <highway_hud_root>
				return
			endif
			if NOT <highway_hud_root> :desc_resolvealias name = alias_challenge_alert_menu param = alert_menu
				return
			endif
		endif
	endif
	formattext checksumname = alert_id 'challenge_alert_p%a' a = <assigned_player>
	platinum_alpha = 0.0
	diamond_alpha = 0.0
	gold_alpha = 0.0
	vinyl_alpha = 0.0
	icon_rgb = [255 255 255 255]
	frame_effects = 0.0
	switch <grade>
		case 0
		vinyl_alpha = 1.0
		frame_effects = 0.0
		case 1
		gold_alpha = 1.0
		frame_effects = 1.0
		case 2
		platinum_alpha = 1.0
		frame_effects = 1.0
		case 3
		diamond_alpha = 1.0
		frame_effects = 1.0
	endswitch
	if screenelementexists id = <alert_id>
		<alert_id> :gettags
		if (<alert_goal_name> != <goal_name>)
			return
		elseif (<grade> > <alert_grade>)
			destroyscreenelement id = <alert_id>
		else
			return
		endif
	endif
	quickplay_get_challenge_icon base_name = <goal_name>
	createscreenelement {
		type = descinterface
		parent = <alert_menu>
		id = <alert_id>
		desc = 'quickplay_challenge_alert'
		autosizedims = true
		just = [center , center]
		pos = (0.0, 0.0)
		icon_difficulty_platinum_alpha = <platinum_alpha>
		icon_difficulty_diamond_alpha = <diamond_alpha>
		icon_difficulty_gold_alpha = <gold_alpha>
		icon_difficulty_vinyl_alpha = <vinyl_alpha>
		frame_effects_alpha = <frame_effects>
		challenge_icon_texture = <icon_name>
		challenge_icon_rgba = <icon_rgb>
		alpha = 0.0
	}
	if <alert_id> :desc_resolvealias name = alias_diamondbling1 param = diamondbling1_id
		<diamondbling1_id> :obj_spawnscript anim_bling_small_002
	else
		scriptassert \{'pdetrich'}
	endif
	if <alert_id> :desc_resolvealias name = alias_diamondbling2 param = diamondbling2_id
		<diamondbling2_id> :obj_spawnscript anim_bling_small_002
	else
		scriptassert \{'pdetrich'}
	endif
	<alert_id> :settags {alert_grade = <grade> alert_goal_name = <goal_name>}
	runscriptonscreenelement id = <alert_id> challenge_alert_anim_spawned
endscript

script challenge_alert_anim_spawned 
	fade_in_time = 0.05
	pulse_scale = 1.05
	display_time = 2.0
	fade_out_time = 0.5
	alpha_on = 1.0
	if (($cheat_hudfreemode >= 1))
		alpha_on = 0.0
	endif
	se_setprops alpha = <alpha_on> scale = <pulse_scale> time = <fade_in_time>
	se_waitprops
	se_setprops scale = 1.0 time = <fade_in_time>
	se_waitprops
	wait <display_time> seconds
	se_setprops alpha = 0.0 time = <fade_out_time>
	se_waitprops
	die
endscript

script clear_challenge_alert_menu \{player = !i1768515945}
	get_highway_hud_root_id player = <player>
	if NOT <highway_hud_root> :desc_resolvealias name = alias_challenge_alert_menu param = alert_menu
		return
	endif
	destroyscreenelement id = <alert_menu> preserve_parent
endscript

script momentum_plus_fx_showcase_script \{attacker = 1
		victim = 3}
	if NOT gman_goalisactive \{goal = competitive}
		return
	endif
	spawnscript goal_hud_competitive_shield_create params = {player = <victim>}
	wait \{2
		seconds}
	spawnscript competitive_p2p_bolt_spawned params = {attacker = <attacker> victim = <victim>}
	wait \{4
		seconds}
	spawnscript goal_hud_competitive_shield_destroy params = {player = <victim>}
endscript

script goal_hud_competitive_get_fx_container \{player = 1}
	getplayerinfo <player> part
	get_highway_hud_root_id player = <player>
	if (<part> = vocals)
		formattext checksumname = hud_player_meter 'comp_meters_p%a' a = <player>
	else
		<highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
	endif
	<hud_player_meter> :desc_resolvealias name = alias_fx_cont param = fx_container
	return fx_container = <fx_container>
endscript

script goal_hud_competitive_get_fx_pos \{player = 1}
	goal_hud_competitive_get_fx_container player = <player>
	if NOT screenelementexists id = <fx_container>
		return
	endif
	getscreenelementposition id = <fx_container> absolute
	return fx_pos = <screenelementpos>
endscript

script goal_hud_competitive_shield_create \{player = 1}
	goal_hud_competitive_get_fx_container player = <player>
	<fxparent_id> = (<fx_container>)
	formattext checksumname = m_ce01_id 'MP_Shield_Master_container01p%p' p = <player>
	formattext checksumname = ce01_id 'MP_Shield_CE01p%p' p = <player>
	formattext checksumname = se01_id 'MP_Shield_SE01p%p' p = <player>
	formattext checksumname = se02_id 'MP_Shield_SE02p%p' p = <player>
	se_pos01 = (-111.0, 12.0)
	rgba = ($vocals_hud_glow_rgba [(<player> -1)])
	destroyscreenelement id = <m_ce01_id>
	wait \{1
		frame}
	createscreenelement {
		type = containerelement
		parent = <fxparent_id>
		id = <m_ce01_id>
		dims = (50.0, 50.0)
		alpha = 1
		scale = (0.625, 0.625)
		just = [center center]
		pos_anchor = [center center]
		pos = <se_pos01>
		z_priority = 12
		rot_angle = 0
	}
	createscreenelement {
		type = containerelement
		parent = <m_ce01_id>
		id = <ce01_id>
		dims = (50.0, 50.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		z_priority = 12
		rot_angle = 0
	}
	createscreenelement {
		type = spriteelement
		parent = <ce01_id>
		id = <se01_id>
		dims = (100.0, 100.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
		z_priority = 12
		rgba = <rgba>
		texture = pr_casey_shield_hollow
		blend = add
	}
	createscreenelement {
		type = spriteelement
		parent = <ce01_id>
		id = <se02_id>
		dims = (100.0, 100.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
		z_priority = 12
		rgba = <rgba>
		texture = pr_casey_shield_hollow
		blend = add
	}
	<se01_id> :se_setprops scale = (0.0, 0.0) alpha = 0
	<se02_id> :se_setprops scale = (0.0, 0.0) alpha = 0
	wait \{1
		frame}
	if screenelementexists id = <m_ce01_id>
		<se01_id> :se_setprops scale = (1.25, 1.25) alpha = 1 time = 0.1
		<se02_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
		wait \{0.1
			second}
		<se01_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops scale = (1.25, 1.25) alpha = 1 time = 0.1
		wait \{0.1
			second}
		<se01_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
		wait \{0.1
			second}
	else
		return
	endif
endscript

script goal_hud_competitive_shield_spark \{spark_corner = [
			left
			top
		]
		player = 1}
	goal_hud_competitive_get_fx_container player = <player>
	<fxparent_id> = (<fx_container>)
	formattext checksumname = m_ce01_id 'MP_Shield_Master_container01p%p' p = <player>
	formattext checksumname = se01_id 'MP_Shield_SE01p%p' p = <player>
	formattext checksumname = se02_id 'MP_Shield_SE02p%p' p = <player>
	formattext checksumname = ce01_id 'MP_Shield_Hit_Sparks_CE01p%p' p = <player>
	formattext checksumname = pfx01_id 'MP_Shield_Hit_spark01_Particlep%p' p = <player>
	formattext checksumname = pfx02_id 'MP_Shield_Hit_Flash01_Particlep%p' p = <player>
	se_pos01 = (0.0, 0.0)
	rgba = ($vocals_hud_glow_rgba [(<player> -1)])
	if NOT screenelementexists id = <m_ce01_id>
		return
	endif
	destroyscreenelement id = <ce01_id>
	wait \{1
		frame}
	createscreenelement {
		type = containerelement
		parent = <m_ce01_id>
		id = <ce01_id>
		dims = (100.0, 100.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = <spark_corner>
		pos = (0.0, 0.0)
		z_priority = 12
	}
	create2dparticlesystem {
		id = <pfx02_id>
		pos = (12.0, 0.0)
		z_priority = 12
		material = sys_particle_spark01_sys_particle_spark01
		parent = <ce01_id>
		start_color = <rgba>
		end_color = [0 0 0 255]
		start_scale = (3.0, 3.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 30
		emit_start_radius = 0
		emit_radius = 1
		emit_rate = 0.005
		emit_dir = 0.0
		emit_spread = 2
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	create2dparticlesystem {
		id = <pfx01_id>
		pos = (5.0, 0.0)
		z_priority = 11.0
		material = sys_particle_spark01_sys_particle_spark01
		parent = <ce01_id>
		start_color = <rgba>
		end_color = [0 0 0 255]
		start_scale = (0.5, 0.5)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 10
		emit_rate = 0.0075000003
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 10
		friction = (0.01, 32.0)
		time = 0.35000002
	}
	if screenelementexists id = <ce01_id>
		<se01_id> :se_setprops scale = (1.25, 1.25) alpha = 1 time = 0.1
		<se02_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
	else
		return
	endif
	wait \{0.1
		second}
	if screenelementexists id = <ce01_id>
		<se01_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops scale = (1.25, 1.25) alpha = 1 time = 0.1
	else
		return
	endif
	wait \{0.1
		second}
	if screenelementexists id = <ce01_id>
		<se01_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops scale = (1.0, 1.0) alpha = 1 time = 0.1
	else
		return
	endif
	wait \{0.1
		second}
	if screenelementexists id = <ce01_id>
		destroy2dparticlesystem id = <pfx01_id> kill_when_empty
		destroy2dparticlesystem id = <pfx02_id>
	else
		return
	endif
	wait \{60
		frames}
	destroyscreenelement id = <ce01_id>
endscript

script goal_hud_competitive_shield_destroy 
	goal_hud_competitive_get_fx_container player = <player>
	<fxparent_id> = (<fx_container>)
	formattext checksumname = m_ce01_id 'MP_Shield_Master_container01p%p' p = <player>
	formattext checksumname = ce01_id 'MP_Shield_CE01p%p' p = <player>
	formattext checksumname = se01_id 'MP_Shield_SE01p%p' p = <player>
	formattext checksumname = se02_id 'MP_Shield_SE02p%p' p = <player>
	wait \{1
		frame}
	if screenelementexists id = <m_ce01_id>
		<se01_id> :se_setprops scale = (2.25, 2.25) alpha = 0 time = 0.1
		<se02_id> :se_setprops scale = (2.0, 2.0) alpha = 0 time = 0.1
		wait \{0.1
			second}
	else
		return
	endif
	destroyscreenelement id = <m_ce01_id>
endscript

script p2p_sample_script \{source_pos = (340.0, 360.0)
		target_pos = (940.0, 360.0)}
	<sample_id_num> = (((<source_pos> [0] * 1.2) + <source_pos> [1]) + ((<target_pos> [1] * 1.3) + <target_pos> [0]))
	absolutevalue value = <sample_id_num>
	casttointeger \{value}
	formattext checksumname = p2p_source_id 'p2p_source_%n' n = <value>
	formattext checksumname = p2p_target_id 'p2p_target_%n' n = <value>
	formattext checksumname = p2p_connector_id 'p2p_connector_%n' n = <value>
	p2p_indicator_create id = <p2p_source_id> color = green pos = <source_pos>
	p2p_indicator_create id = <p2p_target_id> color = red pos = <target_pos>
	p2p_get_connector_angle source_pos = <source_pos> target_pos = <target_pos>
	p2p_get_connector_length source_pos = <source_pos> target_pos = <target_pos>
	p2p_connector_create length = <connector_length> rotation = <connector_angle> id = <p2p_connector_id> color = cyan source_pos = <source_pos>
	wait \{5
		seconds}
	destroyscreenelement id = <p2p_source_id>
	destroyscreenelement id = <p2p_target_id>
	destroyscreenelement id = <p2p_connector_id>
endscript

script competitive_p2p_bolt_spawned \{attacker = 1
		victim = 2}
	if NOT gman_goalisactive \{goal = competitive}
		return
	endif
	competitive_p2p_bolt_get_attack_direction attacker = <attacker> victim = <victim>
	competitive_p2p_bolt_get_attacker_corner_pos attack_direction = <attack_direction> attacker = <attacker>
	competitive_p2p_bolt_get_victim_corner_pos attack_direction = <attack_direction> victim = <victim>
	<rgba> = ($vocals_hud_glow_rgba [(<attacker> -1)])
	p2p_lightning_create source_pos = <attacker_corner_pos> target_pos = <victim_corner_pos> rgba = <rgba>
	if competitive_player_is_shielded player = <victim>
		audio_gameplay_play_momentum_plus_blocked_sfx player = <victim>
		goal_hud_competitive_shield_spark spark_corner = <victim_corner> player = <victim>
	else
		audio_gameplay_play_momentum_plus_attack_sfx player = <victim>
	endif
endscript

script competitive_player_is_shielded \{player = 1}
	formattext checksumname = m_ce01_id 'MP_Shield_Master_container01p%p' p = <player>
	if screenelementexists id = <m_ce01_id>
		return \{true}
	else
		return \{false}
	endif
endscript

script competitive_p2p_bolt_get_attack_direction attacker = <attacker> victim = <victim>
	goal_hud_competitive_get_fx_pos player = <attacker>
	<source_pos> = (<fx_pos>)
	goal_hud_competitive_get_fx_pos player = <victim>
	<target_pos> = (<fx_pos>)
	<vertical> = 0
	if (<source_pos> [0] < <target_pos> [0])
		<x_direction> = 'right'
	elseif (<source_pos> [0] > <target_pos> [0])
		<x_direction> = 'left'
	else
		<x_direction> = 'vertical'
		<vertical> = 1
	endif
	<horizontal> = 0
	if (<source_pos> [1] < <target_pos> [1])
		<y_direction> = 'down'
	elseif (<source_pos> [1] < <target_pos> [1])
		<y_direction> = 'up'
	else
		<y_direction> = 'horizontal'
		<horizontal> = 1
	endif
	if (<vertical> = 1)
		formattext checksumname = attack_direction '%y' y = <y_direction>
	elseif (<horizontal> = 1)
		formattext checksumname = attack_direction '%x' x = <x_direction>
	else
		formattext checksumname = attack_direction '%y%x' y = <y_direction> x = <x_direction>
	endif
	return attack_direction = <attack_direction>
endscript

script competitive_p2p_bolt_get_attacker_corner_pos \{attacker = 1
		attack_direction = right}
	switch <attack_direction>
		case left
		case upleft
		case up
		<corner> = [left top]
		case right
		case upright
		<corner> = [right top]
		case downleft
		case down
		<corner> = [left bottom]
		case downright
		<corner> = [right bottom]
	endswitch
	goal_hud_competitive_get_fx_container player = <attacker>
	goal_hud_se_get_corner_pos screen_element = <fx_container> corner = <corner>
	return attacker_corner_pos = <corner_pos> attacker_corner = <corner>
endscript

script competitive_p2p_bolt_get_victim_corner_pos \{victim = 1
		attack_direction = right}
	switch <attack_direction>
		case right
		case downright
		case down
		<corner> = [left top]
		case left
		case downleft
		<corner> = [right top]
		case up
		case upright
		<corner> = [left bottom]
		case upleft
		<corner> = [right bottom]
		default
		<corner> = [left top]
	endswitch
	if NOT competitive_player_is_shielded player = <victim>
		goal_hud_competitive_get_fx_container player = <victim>
		<target_element> = <fx_container>
	else
		formattext checksumname = player_shield 'MP_Shield_Master_container01p%p' p = <victim>
		<target_element> = <player_shield>
		if (<corner> [1] = bottom)
			setarrayelement \{arrayname = corner
				index = 0
				newvalue = center}
		endif
	endif
	goal_hud_se_get_corner_pos screen_element = <target_element> corner = <corner>
	return victim_corner_pos = <corner_pos> victim_corner = <corner>
endscript

script goal_hud_se_get_corner_pos \{screen_element = root_window
		corner = [
			right
			top
		]}
	createscreenelement {
		type = containerelement
		parent = <screen_element>
		dims = (0.0, 0.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = <corner>
		pos = (0.0, 0.0)
		z_priority = 12
	}
	wait \{1
		frame}
	getscreenelementposition id = <id> absolute
	destroyscreenelement id = <id>
	return corner_pos = <screenelementpos>
endscript

script p2p_lightning_create \{source_pos = (340.0, 360.0)
		target_pos = (940.0, 360.0)}
	p2p_get_connector_angle source_pos = <source_pos> target_pos = <target_pos>
	p2p_get_connector_length source_pos = <source_pos> target_pos = <target_pos>
	if ((<source_pos> [0] - <target_pos> [0]) < 0)
		<height> = ((<connector_length> * 0.2) + 20)
	else
		<height> = ((<connector_length> * -0.2) - 20)
	endif
	spawnscriptnow p2p_lightning_create_fx params = {rot = <connector_angle> length = <connector_length> height = <height> source_pos = <source_pos> rgba = <rgba>}
endscript

script p2p_indicator_create \{id = p2p_indicator
		color = green
		pos = (640.0, 360.0)}
	destroyscreenelement id = <id>
	switch <color>
		case red
		rgba = [255 0 0 255]
		case blue
		rgba = [0 0 255 255]
		case green
		rgba = [0 255 0 255]
		case yellow
		rgba = [255 255 0 255]
		case cyan
		rgba = [0 255 255 255]
	endswitch
	createscreenelement {
		parent = root_window
		id = <id>
		type = spriteelement
		texture = white
		rgba = <rgba>
		dims = (25.0, 25.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [left top]
		pos = <pos>
		z_priority = 12000
		rot_angle = 0
	}
endscript

script p2p_connector_create \{length = 500
		height = 10
		rotation = 0
		id = p2p_connector
		color = cyan
		source_pos = (340.0, 360.0)}
	destroyscreenelement id = <id>
	switch <color>
		case red
		<rgba> = [255 0 0 255]
		case blue
		<rgba> = [0 0 255 255]
		case green
		<rgba> = [0 255 0 255]
		case yellow
		<rgba> = [255 255 0 255]
		case cyan
		<rgba> = [0 255 255 255]
	endswitch
	<dims> = (((1.0, 0.0) * <length>) + ((0.0, 1.0) * <height>))
	createscreenelement {
		parent = root_window
		id = <id>
		type = spriteelement
		texture = white
		rgba = <rgba>
		dims = <dims>
		alpha = 1
		scale = (1.0, 1.0)
		just = [left center]
		pos_anchor = [left top]
		pos = <source_pos>
		z_priority = 13000
		rot_angle = <rotation>
	}
endscript

script p2p_get_connector_angle \{source_pos = (340.0, 360.0)
		target_pos = (940.0, 360.0)}
	if (<source_pos> [1] < <target_pos> [1])
		atan2 x = (<target_pos> [0] - <source_pos> [0]) y = (<target_pos> [1] - <source_pos> [1])
		<angle> = <atan>
	elseif (<source_pos> [1] > <target_pos> [1])
		atan2 x = (<target_pos> [0] - <source_pos> [0]) y = (<target_pos> [1] - <source_pos> [1])
		<angle> = <atan>
	else
		if ((<source_pos> [0] - <target_pos> [0]) < 0)
			<angle> = 0
		else
			<angle> = 180
		endif
	endif
	return connector_angle = <angle>
endscript

script p2p_get_connector_length \{source_pos = (340.0, 360.0)
		target_pos = (940.0, 360.0)}
	<a> = (<source_pos> [0] - <target_pos> [0])
	<b> = (<source_pos> [1] - <target_pos> [1])
	if (<source_pos> [1] = <target_pos> [1])
		absolutevalue value = <a>
		<length> = (<value>)
	elseif (<source_pos> [0] = <target_pos> [0])
		absolutevalue value = <b>
		<length> = (<value>)
	else
		<c_squared> = ((<a> * <a>) + (<b> * <b>))
		sqrt x = (<c_squared>)
		<length> = (<sqrt>)
	endif
	return connector_length = <length>
endscript

script p2p_lightning_create_fx \{rot = 0
		length = 500
		height = 100
		source_pos = (340.0, 360.0)
		rgba = [
			255
			255
			255
			255
		]}
	<se_dims> = (((1.0, 0.0) * <length>) + ((0.0, 1.0) * <height>))
	z_priority = 60
	wait \{1
		frame}
	createscreenelement {
		type = containerelement
		parent = root_window
		dims = (50.0, 50.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [left top]
		pos = <source_pos>
		z_priority = <z_priority>
		rot_angle = <rot>
	}
	<m_ce01_id> = <id>
	onexitrun p2p_lightning_create_fx_cleanup params = {id = <m_ce01_id>}
	createscreenelement {
		type = containerelement
		parent = <m_ce01_id>
		dims = <se_dims>
		alpha = 1
		scale = (1.0, 1.0)
		just = [left bottom]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 0
	}
	<ce01_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <ce01_id>
		dims = <se_dims>
		alpha = 1
		scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		material = mat_lightning_arc_anim01
	}
	<se01_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <ce01_id>
		dims = <se_dims>
		alpha = 1
		scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		material = mat_lightning_arc_anim02
	}
	<se02_id> = <id>
	createscreenelement {
		type = containerelement
		parent = <ce01_id>
		dims = (50.0, 50.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [right bottom]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
	}
	<ce02_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <m_ce01_id>
		dims = (128.0, 128.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		material = mat_lightning_ball_anim01
	}
	<se03_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <ce02_id>
		dims = (128.0, 128.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		material = mat_lightning_ball_anim02
	}
	<se04_id> = <id>
	create2dparticlesystem {
		pos = (5.0, 0.0)
		z_priority = <z_priority>
		material = sys_particle_spark01_sys_particle_spark01
		parent = <ce02_id>
		start_color = <rgba>
		end_color = [0 0 0 255]
		start_scale = (0.25, 0.25)
		end_scale = (0.5, 0.5)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 0
		emit_radius = 100
		emit_rate = 0.005
		emit_dir = 0.0
		emit_spread = 230.0
		velocity = 8
		friction = (0.01, 62.0)
		time = 0.5
	}
	<pfx03_id> = <id>
	wait \{22
		frames}
	destroy2dparticlesystem id = <pfx03_id> kill_when_empty
	destroyscreenelement id = <se01_id>
	destroyscreenelement id = <se02_id>
	destroyscreenelement id = <se03_id>
	destroyscreenelement id = <se04_id>
	wait \{60
		frames}
endscript

script p2p_lightning_create_fx_cleanup 
	destroyscreenelement id = <id>
endscript

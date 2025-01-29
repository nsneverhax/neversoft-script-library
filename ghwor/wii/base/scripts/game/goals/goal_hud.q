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
		attach_competitive_meters_to_highway Player = <Player>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	if ($g_debug_comp_scoreboard = 1)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			add_player_to_competitive_scoreboard Player = <Player>
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
	else
		getnumplayersingame \{remote}
		if (<num_players> > 0)
			getfirstplayer \{remote}
			begin
			getplayerinfo <Player> is_onscreen
			if (<is_onscreen> = 0)
				add_player_to_competitive_scoreboard Player = <Player>
			else
				attach_competitive_meters_to_highway Player = <Player>
			endif
			getnextplayer Player = <Player> remote
			repeat <num_players>
		endif
	endif
endscript

script attach_competitive_meters_to_highway 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	get_highway_hud_root_id Player = <Player>
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if (<part> != vocals)
		formatText checksumName = hud_cont 'sidebar_container_left_hudp%p' p = <Player> AddToStringLookup = true
		if NOT ScreenElementExists id = <hud_cont>
			return
		endif
		get_num_non_vocals_players_onscreen
		Pos = (0.0, 0.0)
		switch <num_non_vocals_players>
			case 1
			<Pos> = (-115.0, 105.0)
			<Scale> = 1.0
			case 2
			<Pos> = (-145.0, 160.0)
			<Scale> = 1.0
			case 3
			<Pos> = (-120.0, 160.0)
			<Scale> = 0.85
			case 4
			<Pos> = (-95.0, 160.0)
			<Scale> = 0.75
		endswitch
		formatText checksumName = rank_id 'p%p_competitive_rank' p = <Player>
		if ScreenElementExists id = <rank_id>
			DestroyScreenElement id = <rank_id>
		endif
		CreateScreenElement {
			parent = <hud_cont>
			id = <rank_id>
			Type = descinterface
			desc = 'HUD_SideBar_RankMeter'
			Pos = <Pos>
			Scale = <Scale>
			autosizedims = true
			preserve_local_orientation = true
			rot_angle = 0
		}
		<rank_id> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_id>}
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found in attach_competitive_meters_to_highway!' p = <Player>
		endif
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			safe_show id = <hud_player_meter>
			if <hud_player_meter> :desc_resolvealias Name = alias_hud_sidebar_rankmeter param = side_rank_meter
				safe_hide id = <side_rank_meter>
			endif
			if <hud_player_meter> :desc_resolvealias Name = alias_vocals_strikes_meter param = strikes_meter
				safe_hide id = <strikes_meter>
			endif
		endif
	else
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found to attach vocals competitive meter' p = <Player>
		endif
		vocal_highway_hud_init_competitive_meter highway_hud_root = <highway_hud_root> Player = <Player>
		return
	endif
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		ScriptAssert 'Player %p hud root not found for update_comptitive_highway_meter' p = <Player>
	endif
	if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias Name = alias_competitive_score param = score_id
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
			<divide_by_10> = FALSE
		endif
		getplayerinfo <Player> hud_id
		attachhudwidget {
			Input = {
				object = <hud_id>
				value = note_streak
			}
			outputs = [
				{
					Type = seinttostring
					desc_id = <hud_player_meter>
					property = meter_text
					divide_by_10 = <divide_by_10>
				}
				{
					Type = screenelementconditionalint
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
		params = {Player = <Player> attached_to_highway = 1 element_id = <rank_id>}
	}
endscript

script update_competitive_highway_meter 
	RequireParams \{[
			Player
			rank_id
			rank
			score
		]
		all}
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = rank_id 'p%p_competitive_rank' p = <Player>
		if NOT ScreenElementExists id = <rank_id>
			printf qs(0xabb60701) a = <rank_id> p = <Player>
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
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		printf qs(0x2b813925) p = <Player>
		return
	endif
	if (<part> = vocals)
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		if NOT ScreenElementExists id = <competitive_meters_id>
			printf qs(0xa2194316) a = <Player>
			return
		endif
		<competitive_meters_id> :desc_resolvealias Name = alias_competitive_score param = score_id
	else
		get_highway_hud_root_id Player = <Player>
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :desc_resolvealias Name = alias_competitive_score param = score_id
		endif
		highway_hud_id = <highway_hud_root>
	endif
	if NOT ScreenElementExists id = <score_id>
		printf qs(0xc9653fcc) p = <Player>
		return
	endif
	formatText TextName = score_text qs(0x8c5c152d) n = <score> usecommas
	<score_id> :se_setprops text_text = <score_text>
endscript

script competitive_meter_get_rank_text 
	rank_text = qs(0xbd449b95)
	switch <rank>
		case 0
		rank_text = qs(0xc4992bba)
		case 1
		formatText TextName = rank_text qs(0x886c78ab) n = <rank>
		case 2
		formatText TextName = rank_text qs(0x60dde5b8) n = <rank>
		case 3
		formatText TextName = rank_text qs(0x7a120d9f) n = <rank>
		case 4
		case 5
		case 6
		case 7
		case 8
		formatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
	endswitch
	return rank_text = <rank_text>
endscript

script add_player_to_competitive_scoreboard 
	RequireParams \{[
			Player
		]
		all}
	vocals_get_num_vocalists_onscreen
	get_num_non_vocals_players_onscreen
	gamemode_gettype
	if checksumequals a = <Type> b = competitive
		if (<num_vocalists_shown> > 0 && <num_non_vocals_players> > 0)
			return
		endif
	endif
	if (<num_vocalists_shown> > 1 && <num_non_vocals_players> = 0)
		return
	endif
	GetScreenElementChildren \{id = hud_root}
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert \{'hud root not found for add player to scoreboard'}
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_scoreboard_menu
			param = scoreboard_menu}
		ScriptAssert \{'alias_scoreboard_menu not found for add player to scoreboard'}
	endif
	getplayerinfo <Player> Band
	formatText checksumName = color_medium 'p%a_md' a = <Band>
	formatText checksumName = color_light 'p%a_lt' a = <Band>
	CreateScreenElement {
		parent = <scoreboard_menu>
		Type = descinterface
		desc = 'comp_scoreboard_player'
		autosizedims = true
		competitive_stripe_rgba = ($uicolorref_palette.<color_medium>.rgba)
		tags = {
			Player = <Player>
		}
	}
	if <id> :desc_resolvealias Name = alias_rankmeter param = rank_meter
		<rank_meter> :se_setprops {
		}
	endif
	countscreenelementchildren id = <scoreboard_menu>
	if (<num_vocalists_shown> = 0 && <num_non_vocals_players> > 1)
		<scoreboard_menu> :se_setprops Pos = (-45.0, -45.0)
	endif
	if (<num_children> > 4)
		if (<num_vocalists_shown> > 1)
			<scoreboard_menu> :se_setprops Scale = (0.63, 0.63)
		else
			<scoreboard_menu> :se_setprops Scale = (0.7, 0.7)
		endif
	endif
	getplayerinfo <Player> gamertag
	<id> :se_setprops gamertag_text = ($<gamertag>)
	if <id> :desc_resolvealias Name = alias_rankmeter param = rank_meter
		<rank_meter> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	endif
	if GMan_GoalIsActive \{goal = competitive}
		gman_competitivemeterfunc {
			goal = competitive
			tool = comp_meter
			func = set_element_props
			params = {Player = <Player> attached_to_highway = 0 element_id = <id>}
		}
	else
		getplayerinfo <Player> part
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
			Input = {
				Player = <Player>
				value = is_dead
			}
			output = {
				Type = screenelementconditionalint
				desc_id = <id>
				property = elimination_icon_alpha
				value_range = [1 1]
			}
		}
	endif
	safe_show id = <scoreboard_menu>
endscript

script update_competitive_scoreboard_meter 
	RequireParams \{[
			Player
			scoreboard_id
			rank
			score
		]
		all}
	if NOT ScreenElementExists id = <scoreboard_id>
		ScriptAssert 'scoreboard %a not found in update_comptitive_scoreboard_meter' a = <scoreboard_id> p = <Player>
	endif
	if <scoreboard_id> :desc_resolvealias Name = alias_rankmeter param = rank_meter
		competitive_meter_get_rank_text rank = <rank>
		<rank_meter> :se_setprops rank_text = <rank_text>
		if (<rank> = 1)
			<rank_meter> :se_setprops burstcontainer_alpha = 1
		else
			<rank_meter> :se_setprops burstcontainer_alpha = 0
		endif
	endif
	formatText TextName = score_text qs(0x8c5c152d) n = <score> usecommas
	<scoreboard_id> :se_setprops score_text = <score_text>
	if GMan_GoalIsActive \{goal = competitive}
		gman_getdata goal = competitive Player = <Player> Name = eliminated
		if (<eliminated> = 1)
			getplayerinfo <Player> part
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

script competitive_meter_update_strikes 
	printf channel = goal 'Goal Utility: Competitive Meter: Update Strikes (%s for player %p)' p = <Player> s = <strikes>
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id Player = <Player>
	getplayerinfo <Player> part
	if (<part> = vocals)
		formatText checksumName = container_id 'comp_strike_box_p%p' p = <Player>
		if NOT ScreenElementExists id = <container_id>
			getplayerinfo <Player> part
			if NOT (<part> = vocals)
				formatText checksumName = parent_id 'gem_containerp%p' p = <Player>
				CreateScreenElement {
					id = <container_id>
					Type = ContainerElement
					parent = <parent_id>
				}
			else
				formatText checksumName = parent_id 'comp_meters_p%p' p = <Player>
				CreateScreenElement {
					id = <container_id>
					Type = ContainerElement
					parent = <parent_id>
				}
			endif
		endif
		DestroyScreenElement id = <container_id> preserve_parent
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		if ScreenElementExists id = <competitive_meters_id>
			<competitive_meters_id> :desc_resolvealias Name = alias_vocals_strikes_meter param = strikes_meter
		endif
	else
		<highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias Name = alias_vocals_strikes_meter param = strikes_meter
	endif
	if GotParam \{strikes_meter}
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
			ScriptAssert \{'Players can only have between 0-2 strikes'}
		endswitch
	endif
endscript

script add_quickplay_challenge_alert \{challenge_instance_id = !q1768515945
		grade = !i1768515945}
	if NOT GMan_GoalIsActive goal = <challenge_instance_id>
		debug_player = 1
	endif
	if GotParam \{debug_player}
		assigned_player = <debug_player>
	else
		gman_getassignedplayer goal_name = <challenge_instance_id>
		gman_getdata \{goal = quickplay
			Name = targeted_challenge}
		gman_getgoalname goal = <challenge_instance_id>
		if (<targeted_challenge> = <goal_name>)
			return
		endif
	endif
	if GotParam \{debug_player}
		goal_name = qp_score_points
	else
		gman_getgoalname goal = <challenge_instance_id>
	endif
	display_challenge_alert_icon assigned_player = <assigned_player> grade = <grade> goal_name = <goal_name>
	if InNetGame
		if (<assigned_player> != 0)
			SendStructure callback = net_display_challenge_alert_icon data_to_send = {player_num = <assigned_player> grade = <grade> goal_name = <goal_name>}
		endif
	endif
endscript

script net_display_challenge_alert_icon 
	if IsHost
		SendStructure callback = net_display_challenge_alert_icon data_to_send = {player_num = <player_num> grade = <grade> goal_name = <goal_name>}
	endif
	if GotParam \{player_num}
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
	<wii_icon_offset> = (0.0, -20.0)
	if (<assigned_player> = 0)
		if NOT ScreenElementExists \{id = hud_root}
			return
		endif
		if NOT hud_root :desc_resolvealias \{Name = alias_challenge_alert_menu
				param = alert_menu}
			return
		endif
	else
		getplayerinfo <assigned_player> part
		if (<part> = vocals)
			<wii_icon_offset> = (150.0, -20.0)
			vocals_get_num_vocalists_on_same_highway Player = <assigned_player>
			if (<num_vocalists_on_highway> > 1)
				return
			endif
			formatText checksumName = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <assigned_player>
			if NOT ScreenElementExists id = <vocal_combo_meter_id>
				return
			endif
			if NOT <vocal_combo_meter_id> :desc_resolvealias Name = alias_challenge_alert_menu param = alert_menu
				return
			endif
		else
			get_highway_hud_root_id Player = <assigned_player>
			if NOT ScreenElementExists id = <highway_hud_root>
				return
			endif
			if NOT <highway_hud_root> :desc_resolvealias Name = alias_challenge_alert_menu param = alert_menu
				return
			endif
		endif
	endif
	formatText checksumName = alert_id 'challenge_alert_p%a' a = <assigned_player>
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
	if ScreenElementExists id = <alert_id>
		<alert_id> :GetTags
		if (<alert_goal_name> != <goal_name>)
			return
		elseif (<grade> > <alert_grade>)
			DestroyScreenElement id = <alert_id>
		else
			return
		endif
	endif
	quickplay_get_challenge_icon base_name = <goal_name>
	CreateScreenElement {
		Type = descinterface
		parent = <alert_menu>
		id = <alert_id>
		desc = 'quickplay_challenge_alert'
		autosizedims = true
		just = [center , center]
		Pos = (0.0, 0.0)
		icon_difficulty_platinum_alpha = <platinum_alpha>
		icon_difficulty_diamond_alpha = <diamond_alpha>
		icon_difficulty_gold_alpha = <gold_alpha>
		icon_difficulty_vinyl_alpha = <vinyl_alpha>
		frame_effects_alpha = <frame_effects>
		challenge_icon_texture = <icon_name>
		challenge_icon_rgba = <icon_rgb>
		alpha = 1.0
	}
	<alert_menu> :se_setprops Pos = <wii_icon_offset>
	if <alert_id> :desc_resolvealias Name = alias_diamondbling1 param = diamondbling1_id
		<diamondbling1_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if <alert_id> :desc_resolvealias Name = alias_diamondbling2 param = diamondbling2_id
		<diamondbling2_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	<alert_id> :SetTags {alert_grade = <grade> alert_goal_name = <goal_name>}
	RunScriptOnScreenElement id = <alert_id> challenge_alert_anim_spawned
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
	se_setprops alpha = <alpha_on> Scale = <pulse_scale> time = <fade_in_time>
	se_waitprops
	se_setprops Scale = 1.0 time = <fade_in_time>
	se_waitprops
	Wait <display_time> Seconds
	se_setprops alpha = 0.0 time = <fade_out_time>
	se_waitprops
	Die
endscript

script goal_hud_competitive_get_fx_container \{Player = 1}
	getplayerinfo <Player> part
	get_highway_hud_root_id Player = <Player>
	if (<part> = vocals)
		formatText checksumName = hud_player_meter 'comp_meters_p%a' a = <Player>
	else
		<highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
	endif
	<hud_player_meter> :desc_resolvealias Name = alias_fx_cont param = fx_container
	return fx_container = <fx_container>
endscript

script goal_hud_competitive_get_fx_pos \{Player = 1}
	goal_hud_competitive_get_fx_container Player = <Player>
	if NOT ScreenElementExists id = <fx_container>
		return
	endif
	GetScreenElementPosition id = <fx_container> absolute
	return fx_pos = <screenelementpos>
endscript

script goal_hud_competitive_shield_create \{Player = 1}
	goal_hud_competitive_get_fx_container Player = <Player>
	<fxparent_id> = (<fx_container>)
	formatText checksumName = m_ce01_id 'MP_Shield_Master_container01p%p' p = <Player>
	formatText checksumName = ce01_id 'MP_Shield_CE01p%p' p = <Player>
	formatText checksumName = se01_id 'MP_Shield_SE01p%p' p = <Player>
	formatText checksumName = se02_id 'MP_Shield_SE02p%p' p = <Player>
	se_pos01 = (-120.0, 5.0)
	rgba = ($vocals_hud_glow_rgba [(<Player> -1)])
	DestroyScreenElement id = <m_ce01_id>
	Wait \{1
		Frame}
	CreateScreenElement {
		Type = ContainerElement
		parent = <fxparent_id>
		id = <m_ce01_id>
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = <se_pos01>
		z_priority = 12
		rot_angle = 0
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <m_ce01_id>
		id = <ce01_id>
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = 12
		rot_angle = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01_id>
		id = <se01_id>
		dims = (100.0, 100.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = 12
		rgba = <rgba>
		texture = pr_casey_shield_hollow
		blend = add
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01_id>
		id = <se02_id>
		dims = (100.0, 100.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = 12
		rgba = <rgba>
		texture = pr_casey_shield_hollow
		blend = add
	}
	<se01_id> :se_setprops Scale = (0.0, 0.0) alpha = 0
	<se02_id> :se_setprops Scale = (0.0, 0.0) alpha = 0
	Wait \{1
		Frame}
	if ScreenElementExists id = <m_ce01_id>
		<se01_id> :se_setprops Scale = (1.25, 1.25) alpha = 1 time = 0.1
		<se02_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
		Wait \{0.1
			Second}
		<se01_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops Scale = (1.25, 1.25) alpha = 1 time = 0.1
		Wait \{0.1
			Second}
		<se01_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
		Wait \{0.1
			Second}
	else
		return
	endif
endscript

script goal_hud_competitive_shield_spark \{spark_corner = [
			left
			top
		]
		Player = 1}
	goal_hud_competitive_get_fx_container Player = <Player>
	<fxparent_id> = (<fx_container>)
	formatText checksumName = m_ce01_id 'MP_Shield_Master_container01p%p' p = <Player>
	formatText checksumName = se01_id 'MP_Shield_SE01p%p' p = <Player>
	formatText checksumName = se02_id 'MP_Shield_SE02p%p' p = <Player>
	formatText checksumName = ce01_id 'MP_Shield_Hit_Sparks_CE01p%p' p = <Player>
	formatText checksumName = pfx01_id 'MP_Shield_Hit_spark01_Particlep%p' p = <Player>
	formatText checksumName = pfx02_id 'MP_Shield_Hit_Flash01_Particlep%p' p = <Player>
	se_pos01 = (0.0, 0.0)
	rgba = ($vocals_hud_glow_rgba [(<Player> -1)])
	if NOT ScreenElementExists id = <m_ce01_id>
		return
	endif
	DestroyScreenElement id = <ce01_id>
	Wait \{1
		Frame}
	CreateScreenElement {
		Type = ContainerElement
		parent = <m_ce01_id>
		id = <ce01_id>
		dims = (100.0, 100.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = <spark_corner>
		Pos = (0.0, 0.0)
		z_priority = 12
	}
	Create2DParticleSystem {
		id = <pfx02_id>
		Pos = (12.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
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
		Emit_Rate = 0.005
		emit_dir = 0.0
		emit_spread = 2
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	Create2DParticleSystem {
		id = <pfx01_id>
		Pos = (5.0, 0.0)
		z_priority = 11.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
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
		Emit_Rate = 0.0075000003
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 10
		friction = (0.01, 32.0)
		time = 0.35000002
	}
	if ScreenElementExists id = <ce01_id>
		<se01_id> :se_setprops Scale = (1.25, 1.25) alpha = 1 time = 0.1
		<se02_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
	else
		return
	endif
	Wait \{0.1
		Second}
	if ScreenElementExists id = <ce01_id>
		<se01_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops Scale = (1.25, 1.25) alpha = 1 time = 0.1
	else
		return
	endif
	Wait \{0.1
		Second}
	if ScreenElementExists id = <ce01_id>
		<se01_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
		<se02_id> :se_setprops Scale = (1.0, 1.0) alpha = 1 time = 0.1
	else
		return
	endif
	Wait \{0.1
		Second}
	if ScreenElementExists id = <ce01_id>
		Destroy2DParticleSystem id = <pfx01_id> kill_when_empty
		Destroy2DParticleSystem id = <pfx02_id>
	else
		return
	endif
	Wait \{60
		frames}
	DestroyScreenElement id = <ce01_id>
endscript

script goal_hud_competitive_shield_destroy 
	goal_hud_competitive_get_fx_container Player = <Player>
	<fxparent_id> = (<fx_container>)
	formatText checksumName = m_ce01_id 'MP_Shield_Master_container01p%p' p = <Player>
	formatText checksumName = ce01_id 'MP_Shield_CE01p%p' p = <Player>
	formatText checksumName = se01_id 'MP_Shield_SE01p%p' p = <Player>
	formatText checksumName = se02_id 'MP_Shield_SE02p%p' p = <Player>
	Wait \{1
		Frame}
	if ScreenElementExists id = <m_ce01_id>
		<se01_id> :se_setprops Scale = (2.25, 2.25) alpha = 0 time = 0.1
		<se02_id> :se_setprops Scale = (2.0, 2.0) alpha = 0 time = 0.1
		Wait \{0.1
			Second}
	else
		return
	endif
	DestroyScreenElement id = <m_ce01_id>
endscript

script competitive_p2p_bolt_spawned \{attacker = 1
		victim = 2}
	if NOT GMan_GoalIsActive \{goal = competitive}
		return
	endif
	competitive_p2p_bolt_get_attack_direction attacker = <attacker> victim = <victim>
	competitive_p2p_bolt_get_attacker_corner_pos attack_direction = <attack_direction> attacker = <attacker>
	competitive_p2p_bolt_get_victim_corner_pos attack_direction = <attack_direction> victim = <victim>
	<rgba> = ($vocals_hud_glow_rgba [(<attacker> -1)])
	p2p_lightning_create source_pos = <attacker_corner_pos> target_pos = <victim_corner_pos> rgba = <rgba>
	if competitive_player_is_shielded Player = <victim>
		goal_hud_competitive_shield_spark spark_corner = <victim_corner> Player = <victim>
	endif
endscript

script competitive_player_is_shielded \{Player = 1}
	formatText checksumName = m_ce01_id 'MP_Shield_Master_container01p%p' p = <Player>
	if ScreenElementExists id = <m_ce01_id>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script competitive_p2p_bolt_get_attack_direction attacker = <attacker> victim = <victim>
	goal_hud_competitive_get_fx_pos Player = <attacker>
	<source_pos> = (<fx_pos>)
	goal_hud_competitive_get_fx_pos Player = <victim>
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
		formatText checksumName = attack_direction '%y' y = <y_direction>
	elseif (<horizontal> = 1)
		formatText checksumName = attack_direction '%x' X = <x_direction>
	else
		formatText checksumName = attack_direction '%y%x' y = <y_direction> X = <x_direction>
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
	goal_hud_competitive_get_fx_container Player = <attacker>
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
	endswitch
	if NOT competitive_player_is_shielded Player = <victim>
		goal_hud_competitive_get_fx_container Player = <victim>
		<target_element> = <fx_container>
	else
		formatText checksumName = player_shield 'MP_Shield_Master_container01p%p' p = <victim>
		<target_element> = <player_shield>
		if (<corner> [1] = bottom)
			SetArrayElement \{ArrayName = corner
				index = 0
				NewValue = center}
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
	CreateScreenElement {
		Type = ContainerElement
		parent = <screen_element>
		dims = (0.0, 0.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = <corner>
		Pos = (0.0, 0.0)
		z_priority = 12
	}
	Wait \{1
		Frame}
	GetScreenElementPosition id = <id> absolute
	DestroyScreenElement id = <id>
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
	SpawnScriptNow p2p_lightning_create_fx params = {rot = <connector_angle> length = <connector_length> height = <height> source_pos = <source_pos> rgba = <rgba>}
endscript

script p2p_get_connector_angle \{source_pos = (340.0, 360.0)
		target_pos = (940.0, 360.0)}
	if (<source_pos> [1] < <target_pos> [1])
		Atan2 X = (<target_pos> [0] - <source_pos> [0]) y = (<target_pos> [1] - <source_pos> [1])
		<angle> = <atan>
	elseif (<source_pos> [1] > <target_pos> [1])
		Atan2 X = (<target_pos> [0] - <source_pos> [0]) y = (<target_pos> [1] - <source_pos> [1])
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
		sqrt X = (<c_squared>)
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
	Wait \{1
		Frame}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [left top]
		Pos = <source_pos>
		z_priority = <z_priority>
		rot_angle = <rot>
	}
	<m_ce01_id> = <id>
	OnExitRun p2p_lightning_create_fx_cleanup params = {id = <m_ce01_id>}
	CreateScreenElement {
		Type = ContainerElement
		parent = <m_ce01_id>
		dims = <se_dims>
		alpha = 1
		Scale = (1.0, 1.0)
		just = [left bottom]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 0
	}
	<ce01_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01_id>
		dims = <se_dims>
		alpha = 1
		Scale = (0.0625, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		material = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = (1.0 / 20.0)
		num_uv_frames = (1.0, 16.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
		no_squishy
	}
	<se01_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce01_id>
		dims = <se_dims>
		alpha = 1
		Scale = (0.0625, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		texture = mat_lightning_arc_anim01
		use_animated_uvs = true
		frame_length = (1.0 / 20.0)
		num_uv_frames = (1.0, 16.0)
		current_frames = (0.0, 1.0)
		blend = add
		top_down_v
		loop_animated_uvs = true
	}
	<se02_id> = <id>
	CreateScreenElement {
		Type = ContainerElement
		parent = <ce01_id>
		dims = (50.0, 50.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center center]
		pos_anchor = [right bottom]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
	}
	<ce02_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <m_ce01_id>
		dims = (128.0, 128.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		texture = ball_lightning01
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.05
		num_uv_frames = (4.0, 4.0)
	}
	<se03_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <ce02_id>
		dims = (128.0, 128.0)
		alpha = 1
		Scale = (1.0, 1.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <rgba>
		texture = ball_lightning01
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.05
		num_uv_frames = (4.0, 4.0)
	}
	<se04_id> = <id>
	Create2DParticleSystem {
		Pos = (5.0, 0.0)
		z_priority = <z_priority>
		material = sys_Particle_Spark01_sys_Particle_Spark01
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
		Emit_Rate = 0.005
		emit_dir = 0.0
		emit_spread = 230.0
		velocity = 8
		friction = (0.01, 62.0)
		time = 0.5
	}
	<pfx03_id> = <id>
	Wait \{22
		frames}
	Destroy2DParticleSystem id = <pfx03_id> kill_when_empty
	DestroyScreenElement id = <se01_id>
	DestroyScreenElement id = <se02_id>
	DestroyScreenElement id = <se03_id>
	DestroyScreenElement id = <se04_id>
	Wait \{60
		frames}
endscript

script p2p_lightning_create_fx_cleanup 
	DestroyScreenElement id = <id>
endscript

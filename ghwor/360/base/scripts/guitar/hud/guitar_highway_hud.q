
script check_hud_exists 
	hud_exists = 0
	if ScreenElementExists \{id = hud_root}
		hud_exists = 1
	endif
	return hud_exists = <hud_exists>
endscript

script setup_individual_highway_hud Player = <Player>
	printf channel = zdebug qs(0xdc8363d4) p = <Player>
	setup_highway_hud Player = <Player>
endscript

script setup_highway_hud 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	if (<part> = vocals)
		init_vocal_highway_hud Player = <Player>
	else
		init_standard_highway_hud Player = <Player>
	endif
	get_highway_hud_root_id Player = <Player>
	setplayerinfo <Player> hud_parent = <highway_hud_root>
endscript

script show_now_playing_text 
	Obj_GetID
	formatText TextName = now_playing_text qs(0x53516813) s = ($instrument_list.<part>.text)
	<objID> :se_setprops alpha = 0.5 text = <now_playing_text>
	<objID> :obj_spawnscript wait_then_hide params = {wait_time = 1.5 fade_time = 0.25 block_till_song_starts = true}
endscript

script destroy_highway_hud \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	if ScreenElementExists id = <highway_hud_root>
		DestroyScreenElement id = <highway_hud_root>
	endif
endscript

script get_highway_hud_root_id \{Player = 1
		no_assert = 0}
	getplayerinteger Player = <Player> checksum = is_onscreen
	<is_onscreen> = <integer_value>
	if (<no_assert> = 0)
		if (<is_onscreen> = 0)
			ScriptAssert qs(0xe9d69a29) p = <Player>
		endif
	endif
	part = None
	getplayerchecksum Player = <Player> checksum = part
	<part> = <checksum_value>
	if (<part> = vocals)
		highway_position = None
		getplayerchecksum Player = <Player> checksum = highway_position
		<highway_position> = <checksum_value>
		if (<highway_position> = vocal1)
			highway_hud_root = v1_highway_hud
		else
			highway_hud_root = v2_highway_hud
		endif
	else
		formatchecksum format_string = 'p%d_highway_hud' format_params = {d = <Player>} add_to_string_lookup = 1
		<highway_hud_root> = <checksum>
	endif
	return highway_hud_root = <highway_hud_root>
endscript

script init_standard_highway_hud 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	get_num_non_vocals_players_onscreen
	get_non_vocalist_player_number Player = <Player>
	get_highway_pos_and_scale num_non_vocals_players = <num_non_vocals_players> non_vocalist_player = <non_vocalist_player> Player = <Player>
	getplayerinfo <Player> part
	skull_texture = icon_dead_256
	switch <part>
		case guitar
		skull_texture = band_hud_guitar2
		case bass
		skull_texture = band_hud_bass2
		case drum
		skull_texture = band_hud_drums2
	endswitch
	CreateScreenElement {
		parent = hud_root
		id = <highway_hud_root>
		Type = descinterface
		desc = 'hud_highway'
		pos_anchor = [center bottom]
		just = [center bottom]
		Pos = <Pos>
		z_priority = 5
		autosizedims = true
		skull_alpha = 0.0
		skull_texture = <skull_texture>
		death_meter_alpha = 0.0
	}
	gamemode_gettype
	if (<Type> = competitive || <Type> = pro_faceoff)
		getplayerinfo <Player> Band
		formatText formatText checksumName = color_value 'band_color%d' d = <Band>
		get_highway_hud_root_id Player = <Player>
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :se_setprops competitive_stripe_rgba = ($<color_value>)
		endif
	endif
	if ($calibrate_lag_enabled = 0)
		setup_player_instrument_icon Player = <Player>
	endif
	create_highway_color_manager Player = <Player>
	if ($calibrate_lag_enabled = 0)
		setup_sidebar_hud_containers Player = <Player>
		setup_sidebar_rockmeter Player = <Player>
		setup_sidebar_ns_meter Player = <Player>
		setup_gamertag_hud id = <id> Player = <Player>
		setup_challenge_alert_menu Player = <Player>
		setup_sidebar_protection_shield Player = <Player>
		setup_sidebar_timer Player = <Player>
	endif
	if (<Type> = practice)
		hide_sp_meter Player = <Player>
	endif
	getplayerinfo <Player> bot_play
	if (1 = <bot_play>)
		createbotdebugwidget Player = <Player>
	endif
endscript

script setup_player_instrument_icon 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> is_local_client
	if (<is_local_client> != 1)
		return
	endif
	setup_new_part_based_on_difficulty Player = <Player> part = <part> stored_part = <stored_part>
	gamemode_gettype
	if NOT (<Type> = quickplay || <Type> = competitive || <Type> = practice)
		return
	endif
	switch (<new_part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case vocals
		icon_texture = mixer_icon_vox
		default
		icon_texture = mixer_icon_guitar
	endswitch
	get_highway_hud_root_id Player = <Player>
	if <highway_hud_root> :desc_resolvealias Name = alias_hud_icon_container param = icon_container
		rgba = ($vocals_hud_glow_rgba [(<Player> -1)])
		if (<Type> = competitive)
			getplayerinfo <Player> Band
			formatText checksumName = team_color 'band_color%b' b = <Band>
			rgba = ($<team_color>)
		endif
		get_num_non_vocals_players_onscreen
		icon_offset = 0
		switch <num_non_vocals_players>
			case 2
			<icon_container> :se_setprops Pos = {relative (0.0, 60.0)}
			case 3
			<icon_container> :se_setprops Pos = {relative (0.0, 60.0)}
			case 4
			<icon_container> :se_setprops Pos = {relative (0.0, 60.0)}
		endswitch
		<icon_container> :se_setprops alpha = 1.0 inst_icon_texture = <icon_texture> inst_icon_rgba = <rgba>
		<icon_container> :obj_spawnscript wait_then_hide params = {wait_time = 2.0 fade_time = 0.5 block_till_song_starts = true}
	endif
endscript

script show_any_changed_part_messages 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		setup_new_part_based_on_difficulty Player = <Player>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script setup_new_part_based_on_difficulty 
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getplayerinfo <Player> part
	getplayerinfo <Player> stored_part
	new_part = <part>
	if (<stored_part> = guitar)
		if (<guitar_difficulty_rating> = 0)
			new_part = bass
			if playerinfoequals <Player> is_onscreen = 1
				get_highway_hud_now_playing_text Player = <Player>
				<hud_now_playing_text> :Obj_SpawnScriptNow show_now_playing_text params = {Player = <Player> part = <new_part>}
			endif
		elseif (<guitar_difficulty_rating> != 0 && <stored_part> = bass)
			new_part = guitar
			if playerinfoequals <Player> is_onscreen = 1
				get_highway_hud_now_playing_text Player = <Player>
				<hud_now_playing_text> :Obj_SpawnScriptNow show_now_playing_text params = {Player = <Player> part = <new_part>}
			endif
		endif
	elseif (<stored_part> = bass)
		if (<bass_difficulty_rating> = 0)
			new_part = guitar
			if playerinfoequals <Player> is_onscreen = 1
				get_highway_hud_now_playing_text Player = <Player>
				<hud_now_playing_text> :Obj_SpawnScriptNow show_now_playing_text params = {Player = <Player> part = <new_part>}
			endif
		elseif (<bass_difficulty_rating> != 0 && <stored_part> = guitar)
			new_part = bass
			if playerinfoequals <Player> is_onscreen = 1
				get_highway_hud_now_playing_text Player = <Player>
				<hud_now_playing_text> :Obj_SpawnScriptNow show_now_playing_text params = {Player = <Player> part = <new_part>}
			endif
		endif
	endif
	return new_part = <new_part>
endscript

script get_highway_container_id 
	RequireParams \{[
			Player
		]}
	formatText checksumName = highway_container_id 'highway_containerp%p' p = <Player>
	if NOT ScreenElementExists id = <highway_container_id>
		printf qs(0x4ec0c56f) p = <Player>
	endif
	return highway_container_id = <highway_container_id>
endscript

script setup_sidebar_hud_containers 
	RequireParams \{[
			Player
		]}
	lpos = (($sidebar_x [(<Player> -1)] * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)))
	langle = ($sidebar_angle [(<Player> -1)])
	lpos = (0.0, 0.0)
	formatText checksumName = l_parent 'sidebar_container_leftp%p' p = <Player>
	formatText checksumName = l_hud_cont 'sidebar_container_left_hudp%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = descinterface
		desc = 'highway_sidebar'
		id = <l_hud_cont>
		parent = <l_parent>
		Pos = (0.0, 0.0)
		just = [center bottom]
		z_priority = 3
		autosizedims = true
	}
endscript

script setup_challenge_alert_menu \{Player = !i1768515945}
	getplayerinfo <Player> part
	get_num_non_vocals_players_onscreen
	switch <num_non_vocals_players>
		case 1
		<Scale> = 1.0
		<offset> = (0.0, 0.0)
		case 2
		<Scale> = 0.7
		<offset> = (0.0, 25.0)
		case 3
		<Scale> = 0.7
		<offset> = (0.0, 25.0)
		case 4
		<Scale> = 0.6
		<offset> = (0.0, 32.0)
	endswitch
	if (<part> = vocals)
		vocals_get_num_vocalists_on_same_highway Player = <Player>
		if (<num_vocalists_on_highway> > 1)
			return
		endif
		formatText checksumName = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <Player>
		if NOT <vocal_combo_meter_id> :desc_resolvealias Name = alias_challenge_alert_menu param = alert_menu
			return
		endif
	else
		get_highway_hud_root_id Player = <Player>
		if NOT ScreenElementExists id = <highway_hud_root>
			return
		endif
		if NOT <highway_hud_root> :desc_resolvealias Name = alias_challenge_alert_menu param = alert_menu
			return
		endif
		<alert_menu> :se_setprops Scale = <Scale> Pos = {relative <offset>}
	endif
endscript

script setup_sidebar_rockmeter \{Player = 1}
	RequireParams \{[
			Player
		]}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	gamemode_gettype
	get_num_non_vocals_players_onscreen
	switch <num_non_vocals_players>
		case 1
		<Scale> = 0.8
		<loffset> = (-25.0, -65.0)
		<roffset> = (25.0, -65.0)
		<lrot> = 2
		<rrot> = -2
		case 2
		<Scale> = 0.6
		<loffset> = (-25.0, -40.0)
		<roffset> = (25.0, -30.0)
		<lrot> = 2
		<rrot> = -2
		case 3
		<Scale> = 0.6
		<loffset> = (-22.0, -40.0)
		<roffset> = (22.0, -40.0)
		<lrot> = 1.5
		<rrot> = -1.5
		case 4
		<Scale> = 0.5
		<loffset> = (-22.0, -40.0)
		<roffset> = (22.0, -40.0)
		<lrot> = 1
		<rrot> = -1
	endswitch
	lrot = 0
	loffset = (0.0, 0.0)
	<pos_index> = (<Player> -1)
	pos_table = ($highway_pos_table [<pos_index>])
	Pos = (<pos_table>.rockmeter_pos)
	Scale = (<pos_table>.rockmeter_scale)
	if ((<Type> = career) || (<Type> = quickplay) || (<Type> = freeplay))
		formatText checksumName = hud_cont 'sidebar_container_leftp%p' p = <Player>
		formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <left_rock_id>
			DestroyScreenElement id = <left_rock_id>
		endif
		CreateScreenElement {
			Type = descinterface
			desc = 'hud_sidebar_rockmeter'
			id = <left_rock_id>
			parent = <hud_cont>
			Pos = <Pos>
			rot_angle = <lrot>
			just = [0.5 1.0]
			pos_anchor = [center bottom]
			z_priority = 3
			Scale = <Scale>
			autosizedims = true
			alpha = <alpha>
		}
		hud_attach_widget_sidebar_rockmeter desc_id = <id> Player = <Player>
		getplayerinfo <Player> miss_note_bonus_allowed
		if (0 < <miss_note_bonus_allowed>)
			<id> :se_setprops meter_alpha = 1
		endif
	endif
	<scale_pair> = (((1.0, 0.0) * (-1 * <Scale>)) + ((0.0, 1.0) * <Scale>))
	<sp_pos> = (((1.0, 0.0) * (-1 * (<Pos> [0]))) + ((0.0, 1.0) * (<Pos> [1])))
	formatText checksumName = hud_cont_r 'sidebar_container_rightp%p' p = <Player>
	formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player> AddToStringLookup = true
	if ($disable_all_starpower = 0)
		CreateScreenElement {
			Type = descinterface
			desc = 'hud_sidebar_starpowermeter'
			id = <right_sp_id>
			parent = <hud_cont_r>
			Pos = <sp_pos>
			just = [0.6 1.0]
			pos_anchor = [center bottom]
			z_priority = 3
			Scale = <scale_pair>
			autosizedims = true
			alpha = <alpha>
		}
		hud_attach_widget_sidebar_starpowermeter Player = <Player> desc_id = <id>
	endif
endscript

script setup_sidebar_timer 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	alpha_1 = 0.0
	getplayerinfo <Player> min_multiplier
	if (<min_multiplier> > 1)
		alpha_1 = 1.0
	endif
	alpha_2 = 0.0
	getplayerinfo <Player> multiplier_speed
	if (<multiplier_speed> > 1)
		alpha_2 = 1.0
	endif
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
			ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
		endif
		vocals_getactivehighway Player = <Player>
		vocals_get_highway_view Player = <active_highway>
		if (<highway_view> = static)
			getplayerinfo <Player> highway_position
			if (<highway_position> = vocal1)
				<johnny_timers> :se_setprops Pos = {relative (0.0, 32.0)}
			else
				<johnny_timers> :se_setprops Pos = {relative (0.0, -215.0)}
			endif
		endif
	else
		formatText checksumName = combo_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
	endif
	if NOT ScreenElementExists id = <combo_meter_id>
		ScriptAssert \{'could not find ns_meter to set up johnny timer'}
	endif
	if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
		ScriptAssert \{'Could not find johnny timer within ns_meter for Johnny Special power setup'}
	endif
	<johnny_timers> :se_setprops alpha = <alpha_1> lvl1_alpha = <alpha_1> lvl2_alpha = <alpha_2>
endscript

script setup_sidebar_protection_shield 
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	<Pos> = (-20.0, -333.0)
	get_num_non_vocals_players_onscreen
	switch <num_non_vocals_players>
		case 1
		<Scale> = 0.5
		<Pos> = (-20.0, -200.0)
		case 2
		<Scale> = 0.5
		<Pos> = (-20.0, -250.0)
		case 3
		<Scale> = 0.4
		<Pos> = (-20.0, -265.0)
		case 4
		<Scale> = 0.35000002
		<Pos> = (-20.0, -270.0)
	endswitch
	formatText checksumName = hud_cont 'sidebar_container_leftp%p' p = <Player>
	formatText checksumName = left_streak_keeper_id 'sidebar_left_streak_keeperp%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = descinterface
		desc = 'rp_casey_widget'
		id = <left_streak_keeper_id>
		parent = <hud_cont>
		Pos = <Pos>
		Scale = <Scale>
		pos_anchor = [center bottom]
		z_priority = 3
		alpha = 0
	}
	getplayerinfo <Player> miss_note_bonus_allowed
	if (2 > <miss_note_bonus_allowed>)
		<id> :desc_resolvealias Name = alias_lvl2 param = shield_id
		<shield_id> :se_setprops alpha = 0.0
	endif
	if (1 > <miss_note_bonus_allowed>)
		<id> :desc_resolvealias Name = alias_lvl1 param = shield_id
		<shield_id> :se_setprops alpha = 0.0
		<id> :se_setprops alpha = 0.0
	endif
	gamemode_gettype
	if (<Type> = quickplay && 0 < <miss_note_bonus_allowed>)
		<id> :se_setprops alpha = <alpha>
	endif
endscript

script setup_protection_shield_vocals 
	getplayerinfo <Player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		ScriptAssert \{'could not find ns_meter to set up protection shield'}
	endif
	if NOT <combo_meter_id> :desc_resolvealias Name = alias_rp_casey_widget param = casey_widget
		ScriptAssert \{'Could not find casey widget within ns_meter for Casey Special power setup'}
	endif
	gamemode_gettype
	formatText checksumName = streak_keeper_id 'sidebar_left_streak_keeperp%p' p = <Player>
	AssignAlias id = <casey_widget> alias = <streak_keeper_id>
	if ((<Type> = career))
		getplayerinfo <Player> miss_note_bonus_allowed
		if (2 > <miss_note_bonus_allowed>)
			<streak_keeper_id> :desc_resolvealias Name = alias_lvl2 param = shield_id
			<shield_id> :se_setprops alpha = 0.0
		endif
		if (1 > <miss_note_bonus_allowed>)
			<streak_keeper_id> :desc_resolvealias Name = alias_lvl1 param = shield_id
			<shield_id> :se_setprops alpha = 0.0
			<streak_keeper_id> :se_setprops alpha = 0.0
		endif
		printf \{'fffffffffffffffffffffffffffffffffffff'}
		getplayerinfo <Player> vocals_highway_view
		if (<vocals_highway_view> = static)
			getplayerinfo <Player> highway_position
			if (<highway_position> = vocal1)
				<streak_keeper_id> :se_setprops Pos = {relative (0.0, 30.0)}
			else
				<streak_keeper_id> :se_setprops Pos = {relative (0.0, -220.0)}
			endif
		endif
	endif
	<streak_keeper_id> :se_setprops alpha = 0.0
endscript

script setup_sidebar_ns_meter 
	RequireParams \{[
			Player
		]}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	getplayerinfo <Player> part
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case vocals
		icon_texture = mixer_icon_vox
		default
		icon_texture = mixer_icon_guitar
	endswitch
	<pos_index> = (<Player> -1)
	pos_table = ($highway_pos_table [<pos_index>])
	Pos = (<pos_table>.ns_meter_pos)
	Scale = (<pos_table>.ns_meter_scale)
	formatText checksumName = hud_cont 'sidebar_container_rightp%p' p = <Player>
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = descinterface
		desc = 'hud_meter_combo'
		id = <right_ns_id>
		parent = <hud_cont>
		Pos = <Pos>
		rot_angle = 0
		just = [center center]
		pos_anchor = [center center]
		z_priority = 2
		Scale = <Scale>
		autosizedims = true
		inst_icon_texture = <icon_texture>
		icon_container_alpha = 0.0
		combo_multiplier_container_alpha = 0.0
		inst_icon_alpha = 0.8
		alpha = <alpha>
	}
	setplayerinfo <Player> combo_meter_id = <id>
	hud_attach_widget_sidebar_notestreak_meter Player = <Player> desc_id = <id>
	hud_launch_johnny_rocker_fx Player = <Player> desc_id = <id>
	hud_launch_lars_rocker_fx Player = <Player> desc_id = <id>
endscript

script create_all_highway_res_fx 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		resurrection_fx Player = <Player> ignore_health_change = 1
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script create_all_highway_star_power_effect 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			SpawnScriptNow create_vocals_star_power_effect params = {Player = <Player>}
		else
			SpawnScriptNow create_highway_star_power_effect params = {Player = <Player>}
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script kill_all_highway_star_power_effect 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			SpawnScriptNow kill_vocals_star_power_effect params = {Player = <Player>}
		else
			SpawnScriptNow kill_highway_star_power_effect params = {Player = <Player>}
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script lightning_strike_all_player_shields \{rgba = [
			255
			255
			255
			255
		]
		source_pos = (0.0, 0.0)}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		lightning_strike = 1
		if (<part> = vocals && <vocals_difficulty_rating> = 0)
			lightning_strike = 0
		endif
		if (<lightning_strike> = 1)
			lightning_strike_player_shield Player = <Player> source_pos = <source_pos> rgba = <rgba>
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script lightning_strike_player_shield \{Player = 1
		source_pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]}
	get_shield_position Player = <Player>
	target_pos = <position>
	p2p_lightning_create source_pos = <source_pos> target_pos = <target_pos> rgba = <rgba>
endscript

script lightning_strike_all_sp_meters \{rgba = [
			255
			255
			255
			255
		]
		source_pos = (0.0, 0.0)}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		lightning_strike = 1
		if (<part> = vocals && <vocals_difficulty_rating> = 0)
			lightning_strike = 0
		endif
		if (<lightning_strike> = 1)
			lightning_strike_player_sp_meter Player = <Player> source_pos = <source_pos> rgba = <rgba>
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script lightning_strike_player_sp_meter \{Player = 1
		source_pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]}
	get_sp_meter_position Player = <Player>
	target_pos = <position>
	p2p_lightning_create source_pos = <source_pos> target_pos = <target_pos> rgba = <rgba>
	get_sp_meter_position_top_bottom Player = <Player>
	p2p_lightning_create source_pos = <position_top> target_pos = <position_bottom> rgba = <rgba>
endscript

script lightning_strike_all_johnny_meters \{rgba = [
			255
			255
			255
			255
		]
		source_pos = (0.0, 0.0)}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		lightning_strike = 1
		if (<part> = vocals && <vocals_difficulty_rating> = 0)
			lightning_strike = 0
		endif
		if (<lightning_strike> = 1)
			lightning_strike_player_johnny_meter Player = <Player> rgba = <rgba> source_pos = <source_pos>
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script lightning_strike_player_johnny_meter \{Player = 1
		source_pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]}
	getplayerinfo <Player> part
	if (<part> != vocals)
		get_mult_position Player = <Player>
		target_pos = <position>
	else
		get_vocals_johnny_meter_pos Player = <Player>
		target_pos = <position>
	endif
	p2p_lightning_create source_pos = <source_pos> target_pos = <target_pos> rgba = <rgba>
endscript

script lightning_strike_all_multipliers \{rgba = [
			255
			255
			255
			255
		]
		source_pos = (0.0, 0.0)}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		lightning_strike = 1
		if (<part> = vocals && <vocals_difficulty_rating> = 0)
			lightning_strike = 0
		endif
		if (<lightning_strike> = 1)
			lightning_strike_player_multiplier Player = <Player> rgba = <rgba> source_pos = <source_pos>
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script lightning_strike_player_multiplier \{Player = 1
		source_pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]}
	get_mult_position Player = <Player>
	target_pos = <position>
	p2p_lightning_create source_pos = <source_pos> target_pos = <target_pos> rgba = <rgba>
endscript

script lightning_strike_all_rock_meters \{rgba = [
			255
			255
			255
			255
		]
		source_pos = (0.0, 0.0)}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		lightning_strike = 1
		if (<part> = vocals && <vocals_difficulty_rating> = 0)
			lightning_strike = 0
		endif
		if (<lightning_strike> = 1)
			lightning_strike_player_rock_meter Player = <Player> rgba = <rgba> source_pos = <source_pos>
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script lightning_strike_player_rock_meter \{Player = 1
		source_pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]}
	get_rock_meter_position Player = <Player>
	target_pos = <position>
	p2p_lightning_create source_pos = <source_pos> target_pos = <target_pos> rgba = <rgba>
endscript

script get_mult_position \{Player = 1}
	position = (0.0, 0.0)
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if ScreenElementExists id = <combo_meter_id>
			if <combo_meter_id> :desc_resolvealias Name = alias_vocals_multiplier param = id
				GetScreenElementPosition id = <id> summed
				position = <screenelementpos>
			endif
		endif
	else
		formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player>
		if ScreenElementExists id = <right_ns_id>
			<right_ns_id> :desc_resolvealias Name = alias_rp_multiplier_star_cont param = id
			GetScreenElementPosition id = <id> summed
			position = <screenelementpos>
		endif
	endif
	printstruct channel = zdebug <...>
	return position = <position>
endscript

script get_vocals_johnny_meter_pos \{Player = 1}
	position = (0.0, 0.0)
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if ScreenElementExists id = <combo_meter_id>
			if <combo_meter_id> :desc_resolvealias Name = alias_rp_johnny_timers param = johnny_timers
				if <johnny_timers> :desc_resolvealias Name = alias_bulb_cont param = id
					GetScreenElementPosition id = <id> summed
					position = <screenelementpos>
				endif
			endif
		endif
	endif
	printf \{channel = zdebug
		qs(0xcda9c5ea)}
	printstruct channel = zdebug <...>
	return position = <position>
endscript

script get_sp_meter_position \{Player = 1}
	position = (0.0, 0.0)
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if ScreenElementExists id = <combo_meter_id>
			if <combo_meter_id> :desc_resolvealias Name = alias_vocals_star_power_meter param = sp_meter
				<sp_meter> :desc_resolvealias Name = alias_vocal_starpower_capright param = id
				GetScreenElementPosition id = <id> summed
				position = <screenelementpos>
			endif
		endif
	else
		formatText checksumName = sp_meter 'sidebar_right_sp_meterp%p' p = <Player>
		if ScreenElementExists id = <sp_meter>
			<sp_meter> :desc_resolvealias Name = alias_top_cont param = id
			GetScreenElementPosition id = <id> summed
			position = <screenelementpos>
		endif
	endif
	printstruct channel = zdebug <...>
	return position = <position>
endscript

script get_sp_meter_position_top_bottom \{Player = 1}
	position = (0.0, 0.0)
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if ScreenElementExists id = <combo_meter_id>
			if <combo_meter_id> :desc_resolvealias Name = alias_vocals_star_power_meter param = sp_meter
				<sp_meter> :desc_resolvealias Name = alias_vocal_starpower_capright param = id
				GetScreenElementPosition id = <id> summed
				position_top = <screenelementpos>
				<sp_meter> :desc_resolvealias Name = alias_vocal_starpower_capleft param = id
				GetScreenElementPosition id = <id> summed
				position_bottom = <screenelementpos>
				GetScreenElementPosition id = <id> summed
				position = <screenelementpos>
			endif
		endif
	else
		formatText checksumName = sp_meter 'sidebar_right_sp_meterp%p' p = <Player>
		if ScreenElementExists id = <sp_meter>
			<sp_meter> :desc_resolvealias Name = alias_top_cont param = id
			GetScreenElementPosition id = <id> summed
			position_top = <screenelementpos>
			<sp_meter> :desc_resolvealias Name = alias_bottom_cont param = id
			GetScreenElementPosition id = <id> summed
			position_bottom = <screenelementpos>
		endif
	endif
	printstruct channel = zdebug <...>
	return position_top = <position_top> position_bottom = <position_bottom>
endscript

script get_rock_meter_position \{Player = 1}
	position = (0.0, 0.0)
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if ScreenElementExists id = <combo_meter_id>
			if <combo_meter_id> :desc_resolvealias Name = alias_vocals_health_meter param = id
				GetScreenElementPosition id = <id> summed
				position = <screenelementpos>
			endif
		endif
	else
		formatText checksumName = rock_meter 'sidebar_left_rock_meterp%p' p = <Player>
		if ScreenElementExists id = <rock_meter>
			<rock_meter> :desc_resolvealias Name = alias_needle_container param = id
			GetScreenElementPosition id = <id> summed
			position = <screenelementpos>
		endif
	endif
	printstruct channel = zdebug <...>
	return position = <position>
endscript

script get_shield_position \{Player = 1}
	position = (0.0, 0.0)
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> combo_meter_id
		if ScreenElementExists id = <combo_meter_id>
			if <combo_meter_id> :desc_resolvealias Name = alias_rp_casey_widget param = widg
				<widg> :se_setprops alpha = 1.0 time = 0.2
				if <widg> :desc_resolvealias Name = alias_meter param = id
					GetScreenElementPosition id = <id> summed
					position = <screenelementpos>
				endif
			endif
		endif
	else
		formatText checksumName = shield_id 'sidebar_left_streak_keeperp%p' p = <Player>
		if ScreenElementExists id = <shield_id>
			<shield_id> :se_setprops alpha = 1.0 time = 0.2
			GetScreenElementPosition id = <shield_id> summed
			position = <screenelementpos>
		endif
	endif
	printstruct channel = zdebug <...>
	return position = <position>
endscript

script setup_gamertag_hud 
	RequireParams \{[
			Player
			id
		]
		all}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	gamer_tag_offset = (0.0, 0.0)
	Scale = 1.0
	get_num_non_vocals_players_onscreen
	if (<num_non_vocals_players> = 4)
		getplayerinfo <Player> highway_position
		switch <highway_position>
			case left
			gamer_tag_offset = (30.0, 0.0)
			case leftcenter
			gamer_tag_offset = (15.0, 0.0)
			case rightcenter
			gamer_tag_offset = (-15.0, 0.0)
			case right
			gamer_tag_offset = (-30.0, 0.0)
			default
			gamer_tag_offset = (0.0, 0.0)
		endswitch
		Scale = 1.1
	endif
	if ininternetmode
		if <id> :desc_resolvealias Name = alias_hud_gamertag param = hud_gamertag
			getplayerinfo <Player> gamertag
			getplayerinfo <Player> Band
			formatText formatText checksumName = color_value 'band_color%d' d = <Band>
			<hud_gamertag> :se_setprops {
				gamertag_bg_rgba = ($<color_value>)
				gamertag_name_text = ($<gamertag>)
				gamertag_alpha = 1.0
				alpha = <alpha>
				Pos = {relative <gamer_tag_offset>}
				Scale = <Scale>
			}
			if playerinfoequals <Player> part = vocals
				<id> :se_setprops meters_menu_alpha = 0.0
			endif
			<hud_gamertag> :Obj_SpawnScriptNow fade_gamertags params = {Player = <Player> parent_id = <id>}
		endif
	endif
endscript

script fade_gamertags 
	RequireParams \{[
			Player
		]
		all}
	Obj_GetID
	begin
	GetSongTime
	if (<songtime> > 0)
		break
	else
		Wait \{1
			gameframe}
	endif
	repeat
	if ScreenElementExists id = <objID>
		if playerinfoequals <Player> part = vocals
			Wait \{3.0
				Seconds}
			<objID> :se_setprops gamertag_alpha = 0.0 time = 1.5
			<objID> :se_waitprops
			<parent_id> :se_setprops meters_menu_alpha = 1.0 time = 0.5
		else
			if playerinfoequals <Player> is_local_client = 1
				<objID> :se_setprops gamertag_alpha = 0.0 time = 1.5
			else
				<objID> :se_setprops gamertag_alpha = 0.9 time = 1.5
			endif
		endif
	endif
endscript

script hide_ns_meter \{time = 0}
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <right_ns_id>
		<right_ns_id> :se_setprops alpha = 0.0 time = <time>
	endif
endscript

script show_ns_meter \{time = 0}
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <right_ns_id>
		<right_ns_id> :se_setprops alpha = 1.0 time = <time>
	endif
endscript

script init_vocal_highway_hud \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :se_getprops Pos
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		CreateScreenElement {
			parent = hud_root
			id = <highway_hud_root>
			Type = descinterface
			desc = 'hud_vocals_highway'
			Pos = <Pos>
			pos_anchor = [left top]
			just = [left top]
			z_priority = 1
			autosizedims = true
		}
	endif
	vocal_highway_hud_init_combo_meter highway_hud_root = <highway_hud_root> Player = <Player>
	getplayerinfo <Player> bot_play
	if (1 = <bot_play>)
		createbotdebugwidget Player = <Player>
	endif
endscript

script hide_vocal_rock_meter 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	if (<part> != vocals)
		return
	endif
	getplayerinfo <Player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		return
	endif
	<combo_meter_id> :se_setprops {
		health_meter_alpha = 0
	}
endscript

script show_vocal_rock_meter 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	if (<part> != vocals)
		return
	endif
	getplayerinfo <Player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		return
	endif
	<combo_meter_id> :se_setprops {
		health_meter_alpha = 1
	}
endscript

script hide_vocal_combo_meter \{Player = !i1768515945}
	formatText checksumName = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <Player>
	if NOT ScreenElementExists id = <vocal_combo_meter_id>
		return
	endif
	<vocal_combo_meter_id> :se_setprops alpha = 0
endscript

script show_vocal_combo_meter \{Player = !i1768515945}
	formatText checksumName = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <Player>
	if NOT ScreenElementExists id = <vocal_combo_meter_id>
		return
	endif
	<vocal_combo_meter_id> :se_setprops alpha = 1
endscript

script pos_highway_hud \{Pos = (0.0, 0.0)
		time = 0
		Player = 1}
	highway_hud_root = None
	get_highway_hud_root_id Player = <Player>
	if NOT screenelementexistssimpleid id = <highway_hud_root>
		return
		ScriptAssert 'player %p highway hud not found to hide' p = <Player>
	endif
	<highway_hud_root> :se_setprops Pos = <Pos> time = <time>
endscript

script freeplay_hide_highway_hud 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		return
		ScriptAssert 'player %p highway hud not found to hide' p = <Player>
	endif
	<highway_hud_root> :se_setprops alpha = 0.0
endscript

script hide_highway_hud 
	formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <left_rock_id>
		<left_rock_id> :se_setprops alpha = 0.0
	endif
	hide_sp_meter Player = <Player>
	hide_ns_meter Player = <Player>
	get_highway_hud_root_id Player = <Player>
	if ScreenElementExists id = <highway_hud_root>
		<highway_hud_root> :se_setprops alpha = 0.0
	endif
endscript

script show_highway_hud 
	formatText checksumName = left_rock_id 'sidebar_left_rock_meterp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <left_rock_id>
		<left_rock_id> :se_setprops alpha = 1.0
	endif
	show_sp_meter Player = <Player>
	show_ns_meter Player = <Player>
	get_highway_hud_root_id Player = <Player>
	if ScreenElementExists id = <highway_hud_root>
		<highway_hud_root> :se_setprops alpha = 1.0
	endif
endscript

script freeplay_show_highway_hud 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		ScriptAssert 'player %p highway hud not found to show' p = <Player>
	endif
	<highway_hud_root> :se_setprops alpha = 1.0
endscript

script hide_entire_hud 
	if ScreenElementExists \{id = hud_root}
		hud_root :se_setprops \{alpha = 0.0}
	endif
endscript

script show_entire_hud 
	if ScreenElementExists \{id = hud_root}
		hud_root :se_setprops \{alpha = 0.0}
	endif
endscript

script hide_sp_meter 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	if (<part> = vocals)
		return
	else
		formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player>
		if ScreenElementExists id = <right_sp_id>
			<right_sp_id> :se_setprops alpha = 0.0
		endif
	endif
endscript

script show_sp_meter 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	if (<part> = vocals)
		return
	else
		formatText checksumName = right_sp_id 'sidebar_right_sp_meterp%p' p = <Player>
		if ScreenElementExists id = <right_sp_id>
			<right_sp_id> :se_setprops alpha = 1.0
		endif
	endif
endscript

script get_highway_hud_menu_parent 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player> no_assert = 1
	if NOT ScreenElementExists id = <highway_hud_root>
		return \{menu_parent = NULL}
	endif
	if <highway_hud_root> :desc_resolvealias Name = alias_menu_container param = menu_parent
		return menu_parent = <menu_parent>
	endif
	if NOT playerinfoequals <Player> part = vocals
		ScriptAssert \{qs(0xe8a8c19f)}
	endif
	getplayerinfo <Player> combo_meter_id
	if <combo_meter_id> :desc_resolvealias Name = alias_menu_container param = menu_parent
		return menu_parent = <menu_parent>
	endif
endscript

script get_highway_hud_now_playing_text 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		ScriptAssert 'player %p hud root not found to resolve menu parent' p = <Player>
	endif
	<highway_hud_root> :desc_resolvealias Name = alias_now_playing_text_freeplay param = hud_now_playing_text
	return hud_now_playing_text = <hud_now_playing_text>
endscript

script get_player_challenge_meter_parent 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = hud_cont 'sidebar_container_left_hudp%p' p = <Player> AddToStringLookup = true
	else
		get_highway_hud_root_id Player = <Player>
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found to resolve challenge meter parent' p = <Player>
		endif
		if NOT <highway_hud_root> :desc_resolvealias Name = alias_challenge_meter_container param = hud_cont
			ScriptAssert 'player %p hud root not found to resolve challenge meter parent for vocals' p = <Player>
		endif
	endif
	return challenge_meter_parent = <hud_cont>
endscript

script get_band_challenge_meter_parent 
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert 'band hud root not found to resolve challenge meter parent' p = <Player>
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_challenge_meter_container
			param = meter_parent}
		ScriptAssert 'player %p hud root not found to resolve menu parent' p = <Player>
	endif
	return challenge_meter_parent = <meter_parent>
endscript

script get_highway_hud_message_parent 
	RequireParams \{[
			Player
		]}
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		ScriptAssert 'player %p hud root not found to resolve menu parent' p = <Player>
	endif
	<highway_hud_root> :desc_resolvealias Name = alias_message param = message_parent
	return message_parent = <message_parent>
endscript

script vocal_highway_hud_init_competitive_meter 
	RequireParams \{[
			highway_hud_root
			Player
		]
		all}
	if NOT <highway_hud_root> :desc_resolvealias Name = alias_player_huds param = huds_container_id
		ScriptAssert \{'vocals huds container id not found'}
	endif
	formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
	<competitive_meters_id> :se_setprops alpha = 1
	hud_attach_widget_vocal_competitive_meter meter = <competitive_meters_id> Player = <Player>
endscript
vocal_player_vocals_slot_competitive_params = [
	{
		x_pos = 0
	}
	{
		x_pos = 330
	}
	{
		x_pos = 660
	}
	{
		x_pos = 1280
	}
]
vocal_player_vocals_slot_params = [
	{
		x_pos = 0
	}
	{
		x_pos = 258
	}
	{
		x_pos = 516
	}
	{
		x_pos = 774
	}
]
vocal_player_vocals_slot_quickplay_params = [
	{
		x_pos = 0
	}
	{
		x_pos = 315
	}
	{
		x_pos = 630
	}
	{
		x_pos = 774
	}
]
vocal_player_vocals_slot_freeplay_params = [
	{
		x_pos = 0
	}
	{
		x_pos = 258
	}
	{
		x_pos = 516
	}
	{
		x_pos = 774
	}
]
vocal_player_vocals_slot_career_params = [
	{
		x_pos = 0
	}
	{
		x_pos = 360
	}
	{
		x_pos = 725
	}
	{
		x_pos = 1014
	}
]

script vocal_highway_get_vocals_slot 
	RequireParams \{[
			Player
		]
		all}
	this_player = <Player>
	vocals_getactivehighway Player = <Player>
	this_highway = <active_highway>
	combo_meter_slot = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if (<Player> = <this_player>)
			return combo_meter_slot = <combo_meter_slot>
		endif
		if playerinfoequals <Player> part = vocals
			vocals_getactivehighway Player = <Player>
			if (<active_highway> = <this_highway>)
				combo_meter_slot = (<combo_meter_slot> + 1)
			endif
		endif
		getnextplayer Player = <Player> on_screen
		repeat
	endif
	return combo_meter_slot = <combo_meter_slot>
endscript

script vocal_highway_hud_init_combo_meter 
	RequireParams \{[
			highway_hud_root
			Player
		]
		all}
	if NOT <highway_hud_root> :desc_resolvealias Name = alias_player_huds param = huds_container_id
		ScriptAssert \{'vocals huds container id not found'}
	endif
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
	if ScreenElementExists id = <competitive_meters_id>
		return
	endif
	vocal_highway_get_vocals_slot Player = <Player>
	x_pos = (($vocal_player_vocals_slot_params [<combo_meter_slot>]).x_pos)
	gamemode_gettype
	if (<Type> = career)
		if (($debug_play_celeb_intro = 0) || ($debug_from_gameplay = 1))
		else
			<x_pos> = 0
			Change \{debug_play_celeb_intro = 0}
		endif
	elseif (<Type> = competitive)
		x_pos = (($vocal_player_vocals_slot_competitive_params [<combo_meter_slot>]).x_pos)
	elseif (<Type> = freeplay)
		x_pos = (($vocal_player_vocals_slot_freeplay_params [<combo_meter_slot>]).x_pos)
	elseif (<Type> = quickplay)
		x_pos = (($vocal_player_vocals_slot_quickplay_params [<combo_meter_slot>]).x_pos)
	endif
	Pos = ((1.0, 0.0) * <x_pos>)
	formatText checksumName = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <Player>
	CreateScreenElement {
		parent = <huds_container_id>
		id = <vocal_combo_meter_id>
		local_id = vocals_all_meters
		Type = descinterface
		desc = 'vocals_all_meters'
		tags = {Player = <Player>}
		dims = (256.0, 32.0)
		Pos = <Pos>
		alpha = <alpha>
		z_priority = 16
		tags = {
			start_x_pos = <x_pos>
			dest_x_pos = <x_pos>
			lerping_factor = 1
		}
	}
	meters_id = <id>
	setplayerinfo <Player> combo_meter_id = <id>
	hud_attach_widget_vocal_sp_combo_meter meter = <id> Player = <Player>
	setup_sidebar_timer Player = <Player>
	hud_launch_johnny_rocker_fx Player = <Player> desc_id = <id>
	hud_launch_lars_rocker_fx Player = <Player> desc_id = <id>
	setup_protection_shield_vocals Player = <Player>
	setup_gamertag_hud id = <id> Player = <Player>
	<meters_id> :Obj_SpawnScriptNow vocals_hud_amplitude_glow params = {Player = <Player>}
	if ($game_mode = freeplay)
		<meters_id> :obj_spawnscript vocalist_scale_manager params = {Player = <Player>}
		<meters_id> :desc_resolvealias Name = alias_freeplay_root_fader
		<resolved_id> :se_setprops alpha = 0
		<resolved_id> :se_setprops alpha = 1 motion = ease_out time = 0.5
	endif
	vocals_getactivehighway Player = <Player>
	vocals_get_highway_view Player = <active_highway>
	if (<highway_view> = scrolling)
		Pos = (0.0, 160.0)
	else
		Pos = (0.0, 193.0)
	endif
	CreateScreenElement {
		id = <competitive_meters_id>
		parent = <id>
		local_id = vocals_competitive_meters
		Type = descinterface
		desc = 'vocals_competitive_meters'
		tags = {Player = <Player>}
		dims = (256.0, 32.0)
		Pos = <Pos>
		z_priority = -1
		alpha = <alpha>
	}
	<competitive_meters_id> :se_setprops alpha = 0
	gamemode_gettype
	if (<Type> = competitive || <Type> = pro_faceoff || <Type> = practice)
		hide_vocal_rock_meter Player = <Player>
	endif
endscript

script vocal_highway_hud_destroy_combo_meter 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> combo_meter_id
	DestroyScreenElement id = <combo_meter_id>
endscript

script attachhudwidgetplayermeter 
	RequireParams \{[
			meter_parent
			Player
		]
		all}
	if ScreenElementExists id = {<meter_parent> child = player_meter}
		hud_attach_widget_player_multiplier parent_id = {<meter_parent> child = player_meter} Player = <Player>
		ResolveScreenElementID id = [
			{id = <meter_parent>}
			{local_id = player_meter}
		]
		gamemode_gettype
		if <resolved_id> :desc_resolvealias Name = alias_player_multiplier param = player_multiplier
			if NOT (gamemode_isbandbattle)
				<player_multiplier> :Die
			endif
		endif
	else
		printf \{channel = zdebug
			qs(0xb4a146ce)}
	endif
endscript

script test_vocal_hud_flip \{Player = 1}
	getplayerinfo <Player> combo_meter_id
	spawn_vocal_highway_hud_animate_feedback_text text = qs(0x6e609be9) vocal_meter_container_id = <combo_meter_id>
endscript

script hud_vocal_starpower_success 
	printf \{channel = vocals
		qs(0x615528bf)}
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	if (<part> = vocals)
		SpawnScriptNow lil_sp_squirt_vocals params = {Player = <Player>}
	endif
	gamemode_gettype
	if (<Type> = career)
		getplayerinfo <Player> star_power_gain_multiplier
		if (<star_power_gain_multiplier> >= 4.0)
			SpawnScriptNow newmale_rp_vocals_fx params = {{Player = <Player>} {lvl_dims = (200.0, 50.0)}}
		elseif (<star_power_gain_multiplier> >= 2.0)
			SpawnScriptNow newmale_rp_vocals_fx params = {{Player = <Player>} {lvl_dims = (200.0, 25.0)}}
		endif
	else
	endif
endscript

script hud_vocal_starpower_failure 
	RequireParams \{[
			Player
		]
		all}
	printf \{channel = vocals
		qs(0x5b9c2161)}
endscript

script hud_vocal_feedback_script 
	RequireParams \{[
			Player
			quality_index
		]
		all}
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		return
	endif
	getplayerinfo <Player> is_dead
	if (<is_dead> = 0)
		text = ($vocal_phrase_qualities [<quality_index>].text)
		rgba = ($vocal_phrase_qualities [<quality_index>].rgba)
		getplayerinfo <Player> combo_meter_id
		spawn_vocal_highway_hud_animate_feedback_text text = <text> vocal_meter_container_id = <combo_meter_id> rgba = <rgba>
	endif
endscript

script spawn_vocal_highway_hud_animate_feedback_text \{text = qs(0x99b9ca8b)}
	RequireParams \{[
			vocal_meter_container_id
			text
			rgba
		]}
	if CompositeObjectExists <vocal_meter_container_id>
		<vocal_meter_container_id> :obj_spawnscript vocal_highway_hud_animate_feedback_spawned params = {obj_id = <vocal_meter_container_id> text = <text> rgba = <rgba>}
	endif
endscript

script vocal_highway_hud_animate_feedback_spawned 
	RequireParams \{[
			obj_id
			text
			rgba
		]
		all}
	flip_time_incriment = 0.1
	vocal_highway_hud_get_compliment_meter parent_id = <obj_id>
	c_meter = <meter_id>
	vocal_highway_hud_get_mult_meter parent_id = <obj_id>
	m_meter = <meter_id>
	vocal_highway_hud_get_pp_meter parent_id = <obj_id>
	pp_meter = <meter_id>
	<c_meter> :se_setprops text_text = <text>
	<c_meter> :se_setprops text_rgba = <rgba>
	<c_meter> :se_setprops Scale = (1.0, 0.0) alpha = 1.0
	<m_meter> :se_setprops Scale = (1.4, 0.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops Scale = (1.3, 0.0) time = <flip_time_incriment>
	Wait <flip_time_incriment> Seconds
	<c_meter> :se_setprops alpha = 1.0
	<c_meter> :se_setprops Scale = (1.0, 1.0) time = <flip_time_incriment>
	Wait \{0.4
		Seconds}
	<c_meter> :se_setprops Scale = (1.0, 0.0) time = <flip_time_incriment>
	Wait <flip_time_incriment> Seconds
	<c_meter> :se_setprops alpha = 0.0
	<m_meter> :se_setprops Scale = (1.4, 1.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops Scale = (1.3, 1.0) time = <flip_time_incriment>
	Wait <flip_time_incriment> Seconds
endscript

script hud_vocal_dead_script 
	RequireParams \{[
			Player
		]
		all}
	vocals_get_num_vocalists_on_same_highway Player = <Player>
	vocals_get_highway_view Player = <Player>
	if (<num_vocalists_on_highway> > 1 || <highway_view> = karaoke)
		getplayerinfo <Player> combo_meter_id
		<combo_meter_id> :se_setprops dead_icon_alpha = 1.0
	else
		vocalshighway_getid Player = <Player>
		<vocals_highway_id> :se_setprops dead_icon_alpha = 1.0
	endif
	setplayerinfo <Player> scoring = 0
endscript

script hud_vocal_revive 
	RequireParams \{[
			Player
		]
		all}
	vocals_get_num_vocalists_on_same_highway Player = <Player>
	vocals_get_highway_view Player = <Player>
	if (<num_vocalists_on_highway> > 1 || <highway_view> = karaoke)
		getplayerinfo <Player> combo_meter_id
		<combo_meter_id> :se_setprops dead_icon_alpha = 0.0
	else
		vocalshighway_getid Player = <Player>
		<vocals_highway_id> :se_setprops dead_icon_alpha = 0.0
	endif
	setplayerinfo <Player> scoring = 1
endscript

script spawn_vocal_highway_hud_animate_dead_text \{text = qs(0x6e609be9)}
	RequireParams \{[
			vocal_meter_container_id
			text
			rgba
		]}
	<vocal_meter_container_id> :obj_spawnscript vocal_highway_hud_animate_dead_spawned params = {obj_id = <vocal_meter_container_id> text = <text> rgba = <rgba> Player = <Player>}
endscript

script vocal_highway_hud_animate_dead_spawned 
	RequireParams \{[
			obj_id
			text
			rgba
		]
		all}
	flip_time_incriment = 0.1
	vocal_highway_hud_get_compliment_meter parent_id = <obj_id>
	c_meter = <meter_id>
	vocal_highway_hud_get_mult_meter parent_id = <obj_id>
	m_meter = <meter_id>
	vocal_highway_hud_get_pp_meter parent_id = <obj_id>
	pp_meter = <meter_id>
	<c_meter> :se_setprops text_text = <text>
	<c_meter> :se_setprops text_rgba = <rgba>
	<c_meter> :se_setprops Scale = (1.0, 0.0) alpha = 1.0
	<m_meter> :se_setprops Scale = (1.0, 0.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops Scale = (1.3, 0.0) time = <flip_time_incriment>
	Wait <flip_time_incriment> Seconds
	<c_meter> :se_setprops alpha = 1.0
	<c_meter> :se_setprops Scale = (1.0, 1.0) time = <flip_time_incriment>
	Wait \{0.4
		Seconds}
	begin
	getplayerinfo <Player> is_dead
	if (<is_dead> = 0)
		break
	endif
	Wait \{10
		gameframes}
	repeat
	<c_meter> :se_setprops Scale = (1.0, 0.0) time = <flip_time_incriment>
	Wait <flip_time_incriment> Seconds
	<c_meter> :se_setprops alpha = 0.0
	<m_meter> :se_setprops Scale = (1.0, 1.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops Scale = (1.3, 1.0) time = <flip_time_incriment>
	Wait <flip_time_incriment> Seconds
endscript

script vocal_highway_hud_get_sp_meter 
	RequireParams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias Name = alias_vocals_star_power_meter param = sp_meter
		ScriptAssert 'player %p sp multiplier not found' p = <Player>
	endif
	return meter_id = <sp_meter>
endscript

script vocal_highway_hud_get_pp_meter 
	RequireParams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias Name = alias_vocals_phrase_progress_meter param = pp_meter
		ScriptAssert 'player %p pp meter not found' p = <Player>
	endif
	return meter_id = <pp_meter>
endscript

script vocal_highway_hud_get_mult_meter 
	RequireParams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias Name = alias_vocals_multiplier param = mult_meter
		ScriptAssert 'player %p vocal multiplier not found' p = <Player>
	endif
	return meter_id = <mult_meter>
endscript

script vocal_highway_hud_get_rock_meter 
	RequireParams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias Name = alias_vocals_health_meter param = health_meter
		ScriptAssert 'player %p vocal health meter not found' p = <Player>
	endif
	return meter_id = <health_meter>
endscript

script vocal_highway_hud_get_compliment_meter 
	RequireParams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias Name = alias_vocals_word_compliment param = compliment_meter
		ScriptAssert 'player %p vocal meter not found' p = <Player>
	endif
	return meter_id = <compliment_meter>
endscript

script kill_highway_hud \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	if ScreenElementExists id = <highway_hud_root>
		DestroyScreenElement id = <highway_hud_root>
	endif
endscript

script gethudmessageparentid \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_root_id Player = <Player>
	if ScreenElementExists id = <highway_hud_root>
		if NOT <highway_hud_root> :desc_resolvealias Name = alias_message param = message_parent
			ScriptAssert 'player meter %c not found' c = <highway_hud_root>
		endif
	endif
	return message_parent = <message_parent>
endscript

script get_combo_meter_id 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> hud_id
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		return
		ScriptAssert 'player %p highway hud not found for setting up combo meter hud widget' p = <Player>
	endif
	if NOT <highway_hud_root> :desc_resolvealias Name = alias_combo_sp_meter param = id
		return
		ScriptAssert 'player %p combo sp meter not found for setting up combo meter hud widget' p = <Player>
	endif
	return combo_meter_id = <id>
endscript

script set_combo_meter_sp_meter_blue_alpha \{alpha = 1.0}
	RequireParams \{[
			Player
		]
		all}
	get_combo_meter_id Player = <Player>
	if GotParam \{combo_meter_id}
		<combo_meter_id> :se_setprops hud_meter_combo_starblue2_alpha = 1.0
	endif
endscript

script start_combo_meter_sp_glow 
	RequireParams \{[
			Player
		]
		all}
	get_combo_meter_id Player = <Player>
	if GotParam \{combo_meter_id}
		<combo_meter_id> :obj_spawnscript update_combo_meter_sp_glow params = {Player = <Player> obj_id = <combo_meter_id>}
	endif
endscript

script update_combo_meter_sp_glow 
	printf \{channel = zdebug
		qs(0xa1dde80a)}
	<obj_id> :se_setprops {
		sp_burst1_scale = 1.0
		sp_burst2_scale = 1.2
		sp_burst1_alpha = 0
		sp_burst2_alpha = 0
		sp_burst1_rot_angle = 225
		sp_burst2_rot_angle = 225
	}
	<obj_id> :se_waitprops
	<obj_id> :se_setprops {
		sp_burst1_scale = 1.7
		sp_burst2_scale = 1.9
		sp_burst1_rot_angle = 270
		sp_burst2_rot_angle = 270
		sp_burst1_alpha = 1
		sp_burst2_alpha = 1
		time = 0.75
		motion = smooth
	}
	<obj_id> :se_waitprops
	<obj_id> :se_setprops {
		sp_burst1_scale = 1.5
		sp_burst2_scale = 1.4
		sp_burst1_rot_angle = 360
		sp_burst2_rot_angle = 360
		time = 1.5
		motion = smooth
	}
	<obj_id> :se_waitprops
	dx1 = 0.25
	dx2 = 0.5
	rot1 = 0
	rot2 = 0
	alpha2 = 1
	faderate2 = 0.005
	begin
	rot1 = (<rot1> + <dx1>)
	rot2 = (<rot2> + <dx2>)
	alpha2 = (<alpha2> + <faderate2>)
	if (<rot1> > 360)
		rot1 = (<rot1> - 360)
	elseif (<rot1> < 0)
		rot1 = (<rot1> + 360)
	endif
	if (<rot2> > 360)
		rot2 = (<rot2> - 360)
	elseif (<rot2> < 0)
		rot2 = (<rot2> + 360)
	endif
	if ((<alpha2> >= 1))
		alpha2 = 1
		faderate2 = (<faderate2> * -1)
	elseif ((<alpha2> <= 0))
		alpha2 = 0
		faderate2 = (<faderate2> * -1)
	endif
	<obj_id> :se_setprops {
		sp_burst1_rot_angle = <rot1>
		sp_burst2_rot_angle = <rot2>
		sp_burst2_alpha = <alpha2>
	}
	Wait \{1
		gameframe}
	repeat
	<obj_id> :se_setprops {
		sp_burst1_alpha = 0.0
		sp_burst2_alpha = 0.0
		motion = ease_in
		time = 1
	}
	<obj_id> :se_waitprops
endscript

script check_hud_parent \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> hud_parent
	printstruct channel = zdebug <...>
endscript

script test_hud_message \{Player = 1}
	hud_create_message Player = <Player> text = qs(0x09a07a71)
endscript
highway_morph_time = 0.25
highway_morph_step_time = 0.05
highway_morph_name = m_pulsecolor

script create_highway_color_manager \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	formatText checksumName = highway_name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = container_name 'Highway_2Dp%p_color_manager' p = <Player> AddToStringLookup = true
	get_highway_hud_root_id Player = <Player>
	getplayerinfo <Player> star_power_amount
	getplayerinfo <Player> current_health
	getplayerinfo <Player> current_run
	data = {
		highway_name = <highway_name>
		Player = <Player>
		state = 0
		reason = None
		current_rgba = [0.0 0.0 0.0 0.0]
		next_rgba = [0.0 0.0 0.0 0.0]
		last_star_power_amount = <star_power_amount>
		last_current_health = <current_health>
		last_current_run = <current_run>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = <container_name>
		parent = <highway_hud_root>
		tags = <data>
	}
	<id> :obj_spawnscript highway_color_manager_loop
endscript

script destroy_highway_color_manager \{Player = 1}
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = container_name 'Highway_2Dp%p_color_manager' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <container_name>
		DestroyScreenElement id = <container_name>
	endif
endscript

script highway_color_manager_loop 
	Obj_GetID
	<objID> :GetTags
	wait_time = ((<Player> -1) * 3)
	Wait <wait_time> gameframes
	begin
	GetSongTime
	if (<songtime> > 0)
		break
	endif
	Wait \{10
		gameframes}
	repeat
	state = 0
	<old_color> = hw_color_default
	gamemode_gettype
	begin
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		destroy_highway_color_manager Player = <Player>
		return
	endif
	leading_player = 1
	if (<Type> = competitive)
		if GMan_GoalIsActive \{goal = competitive}
			<ruleset> = ($competitive_rules)
			if StructureContains structure = $<ruleset> elimination_rules
				<elimination_ruleset> = ($<ruleset>.elimination_rules)
				if StructureContains structure = <elimination_ruleset> effect
					if (<elimination_ruleset>.effect = difficulty)
						gman_getdata goal = competitive Player = <Player> Name = invincible
						gman_getdata \{goal = competitive
							Name = difficulty_changes}
						<difficulty_change> = (<difficulty_changes> [(<Player> -1)])
						if (<state> = 0 && <invincible> = 1 && <difficulty_change> = 1)
							<state> = 13
						elseif ((<state> = 13 || <state> = 14) && (<difficulty_change> != 1))
							<state> = 15
						elseif (<state> = 13)
							<state> = 14
						elseif (<state> = 15)
							<state> = 0
						elseif (<state> = 14)
							<state> = 14
						endif
						if (<state> = 0 && <invincible> = 1 && (<difficulty_change> = -1))
							<state> = 16
						elseif ((<state> = 16 || <state> = 17) && (<difficulty_change> != -1))
							<state> = 18
						elseif (<state> = 16)
							<state> = 17
						elseif (<state> = 18)
							<state> = 0
						elseif (<state> = 17)
							<state> = 17
						endif
					endif
				endif
			endif
		endif
	endif
	if (<state> > 0)
		switch <state>
			case 13
			start_color = hw_color_default
			trans_color = hw_color_du_overbright
			end_color = hw_color_du_pulse_1
			case 14
			start_color = hw_color_du_pulse_1
			trans_color = hw_color_du_pulse_2
			end_color = hw_color_du_pulse_1
			case 15
			start_color = hw_color_du_pulse_1
			trans_color = hw_color_default
			end_color = hw_color_default
			case 16
			start_color = hw_color_default
			trans_color = hw_color_dd_overbright
			end_color = hw_color_dd_pulse_1
			case 17
			start_color = hw_color_dd_pulse_1
			trans_color = hw_color_dd_pulse_2
			end_color = hw_color_dd_pulse_1
			case 18
			start_color = hw_color_dd_pulse_1
			trans_color = hw_color_default
			end_color = hw_color_default
			default
			ScriptAssert \{'unknown highway effect state'}
		endswitch
		if NOT (<trans_color> = <old_color>)
			changescreenelementcolorbygfs {
				id = <highway_name>
				Name = m_pulsecolor
				startcolor = ($<old_color>)
				endcolor = ($<trans_color>)
				frames = 5
				stepframes = 1
			}
			<old_color> = (<trans_color>)
		else
			Wait \{5
				gameframes}
		endif
	else
		Wait \{10
			gameframes}
	endif
	repeat
endscript

script hud_setup_progress_meter 
	<meter_id> :Obj_SpawnScriptNow hud_update_progress_meter
endscript

script hud_update_progress_meter 
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	progress_final_dims = (227.0, 7.0)
	<song_end_time> = <total_end_time>
	begin
	GetSongTimeMs
	<song_time_ms> = <time>
	<x_scale> = (<song_time_ms> / <total_end_time>)
	if (<x_scale> > 1.0)
		<x_scale> = 1.0
	endif
	if (<x_scale> < 0.0)
		<x_scale> = 0.0
	endif
	dims = (((227.0, 0.0) * <x_scale>) + (0.0, 7.0))
	se_setprops progress_bar_dims = <dims>
	Wait \{5
		gameframes}
	repeat
endscript
challange_meter_num_ticks = 36

script setup_challenge_meter \{Player = 1
		show_challenge_name = 0
		do_intro_anim = 0}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	meter_cont_alpha = 1.0
	if (<do_intro_anim> = 1)
		meter_cont_alpha = 0.0
	endif
	is_band_challenge = 0
	if GotParam \{isband}
		get_band_challenge_meter_parent
		formatText \{checksumName = the_id
			'band_challometer'}
		Pos = (-25.0, 14.0)
		Scale = 1.6
		gamer_tag_pos = (0.0, 118.0)
		is_band_challenge = 1
	else
		get_player_challenge_meter_parent Player = <Player>
		formatText checksumName = the_id 'p%p_challometer' p = <Player>
		getplayerinfo <Player> part
		get_num_non_vocals_players_onscreen
		gamer_tag_scale = 1.0
		challenge_name_scale = 1.0
		if (<part> = vocals)
			determine_vocals_challenge_meter_position Player = <Player> parent = <challenge_meter_parent>
			gamer_tag_scale = 1.5
			challenge_name_scale = 1.5
		else
			switch <num_non_vocals_players>
				case 1
				<offset> = (-120.0, 360.0)
				<Scale> = 1.5
				case 2
				<offset> = (-30.0, 115.0)
				<Scale> = 1.0
				case 3
				<offset> = (-29.0, 115.0)
				<Scale> = 1.0
				case 4
				<offset> = (-29.0, 105.0)
				<Scale> = 0.9
			endswitch
		endif
		Pos = <offset>
	endif
	if ScreenElementExists id = <the_id>
		DestroyScreenElement id = <the_id>
	endif
	if ScreenElementExists id = <challenge_meter_parent>
		CreateScreenElement {
			id = <the_id>
			Type = descinterface
			Scale = <Scale>
			desc = 'hud_meter_challenge'
			parent = <challenge_meter_parent>
			Pos = <Pos>
			tags = {current_ticks = 0 current_level = 0 current_friend_level = 0}
			z_priority = 20
			alpha = <alpha>
			frame_effects_alpha = 0
			meter_cont_alpha = <meter_cont_alpha>
			gamer_tag_scale = <gamer_tag_scale>
			challenge_name_scale = <challenge_name_scale>
		}
		if (<is_band_challenge> = 1)
			<the_id> :se_setprops gamer_tag_pos = <gamer_tag_pos>
		endif
		if NOT <the_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
			ScriptAssert \{'Assert'}
		endif
		<dx> = (360.0 / ($challange_meter_num_ticks))
		<degree> = 0
		<cnt> = 0
		begin
		CreateScreenElement {
			Type = SpriteElement
			parent = <led_container>
			alpha = 0.0
			pos_anchor = [center center]
			rot_angle = <degree>
			Pos = (0.0, 0.0)
			texture = meter_challenge_led
		}
		<degree> = (<degree> + <dx>)
		<cnt> = (<cnt> + 1)
		repeat ($challange_meter_num_ticks)
	endif
	if GotParam \{use_friend_target}
		<the_id> :se_setprops gamer_tag_text = <gamer_tag>
	else
		<the_id> :se_setprops gamer_tag_text = qs(0x03ac90f0)
		<the_id> :se_setprops gamer_tag_alpha = 0
	endif
	if GotParam \{challenge_base_name}
		quickplay_get_challenge_icon base_name = <challenge_base_name>
		<the_id> :se_setprops {
			challenge_icon_texture = <icon_name>
			challenge_icon_alpha = 1.0
			frame_effects_alpha = <frame_effects>
		}
	endif
	if (<is_band_challenge> = 0 && <show_challenge_name> = 1)
		if GotParam \{Player}
			getplayerinfo <Player> part
			if (<part> = vocals)
				vocals_get_num_vocalists_on_same_highway Player = <Player>
				if (<num_vocalists_on_highway> > 1)
					show_challenge_name = 0
				endif
			endif
		endif
	endif
	if (<show_challenge_name> = 1)
		get_targeted_challenge_name Player = <Player>
		<the_id> :se_setprops {
			challenge_name_text = <challenge_name>
			challenge_name_alpha = 1.0
		}
		if (<is_band_challenge> = 1)
			<the_id> :se_setprops {
				challenge_name_pos = {relative (0.0, 140.0)}
			}
		endif
		if (<is_band_challenge> = 0)
			getplayerinfo <Player> part
			if (<part> = vocals)
				<the_id> :se_setprops {
					challenge_name_pos = {relative (375.0, 70.0)}
					challenge_name_internal_just = [left center]
				}
				if GotParam \{use_friend_target}
					<the_id> :se_setprops {
						gamer_tag_pos = {relative (375.0, 90.0)}
						gamer_tag_internal_just = [left center]
					}
				endif
			endif
		endif
		gman_getdata \{goal = quickplay
			Name = targeted_challenge_friend_index}
		if (<targeted_challenge_friend_index> >= 0)
			if (<is_band_challenge> = 1)
				<the_id> :se_setprops {
					gamer_tag_pos = {relative (0.0, 30.0)}
				}
			else
				if (<part> = vocals)
					<the_id> :se_setprops {
						challenge_name_pos = {relative (0.0, -48.0)}
					}
				else
					<the_id> :se_setprops {
						challenge_name_pos = {relative (0.0, -48.0)}
					}
				endif
			endif
		endif
		<the_id> :obj_spawnscript wait_and_hide_challenge_name params = {wait_time = 5.0 fade_time = 1.0 is_band_challenge = <is_band_challenge>}
	endif
	if (<do_intro_anim> = 1)
		if NOT <the_id> :desc_resolvealias Name = alias_meter_cont param = meter_cont_id
			ScriptAssert \{'could not find meter cont in hud_meter_challenge desc'}
		endif
		<meter_cont_id> :obj_spawnscript do_challometer_anim_intro params = {end_scale = 1.0}
	endif
endscript

script wait_and_hide_challenge_name \{is_band_challenge = 0}
	Wait <wait_time> Seconds
	se_setprops challenge_name_alpha = 0.0 time = <fade_time>
	if (<is_band_challenge> = 1)
		Wait <fade_time> Seconds
		se_setprops \{gamer_tag_pos = {
				relative
				(0.0, -30.0)
			}
			time = 0.3}
	endif
endscript

script do_challometer_anim_intro 
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	SoundEvent \{event = gig_challenge_complete_appear}
	under_scale = (<end_scale> - 0.1)
	over_scale = (<end_scale> + 0.15)
	se_setprops Scale = <under_scale> alpha = <alpha>
	Wait \{1
		gameframe}
	se_setprops Scale = <over_scale> time = 0.2
	Wait \{0.25
		Seconds}
	se_setprops Scale = <end_scale> time = 0.1
endscript

script get_targeted_challenge_name 
	gman_getdata \{goal = quickplay
		Name = targeted_challenge}
	quickplay_get_challenge_name_string_from_checksum goal_name = <targeted_challenge> Player = <Player>
	gman_getdata \{goal = quickplay
		Name = targeted_challenge_friend_index}
	if (<targeted_challenge_friend_index> > 0)
		formatText TextName = challenge_name_string qs(0x2daa11ae) d = <challenge_name_string>
	endif
	return challenge_name = <challenge_name_string>
endscript

script determine_vocals_challenge_meter_position 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> vocals_highway_view
	getplayerinfo <Player> highway_position
	get_num_non_vocals_players_onscreen
	right_of_progress_meter = (117.0, -254.0)
	default_scale = 1.0
	<parent> :GetTags
	if NOT GotParam \{num_players_on_highway}
		num_players_on_highway = 0
	endif
	GetArraySize \{$vocal_player_vocals_slot_career_params}
	if (<num_players_on_highway> > <array_Size>)
		ScriptAssert 'Num players on vocals highway suspiciously high (&a)' a = <num_players_on_highway>
		return
	endif
	vocal_highway_get_vocals_slot Player = <Player>
	x_offset_struct = (($vocal_player_vocals_slot_quickplay_params) [<combo_meter_slot>])
	x_offset = (<x_offset_struct>.x_pos)
	x_offset = (<x_offset> + (<right_of_progress_meter> [0]))
	x_pair = (<x_offset> * (1.0, 0.0))
	<offset> = (<x_pair> + <right_of_progress_meter>)
	<Scale> = <default_scale>
	num_players_on_highway = (<num_players_on_highway> + 1)
	<parent> :SetTags num_players_on_highway = <num_players_on_highway>
	return offset = <offset> Scale = <Scale>
endscript

script destroy_challange_meter \{Player = 1}
	if GotParam \{isband}
		formatText \{checksumName = the_id
			'band_challometer'}
	else
		formatText checksumName = the_id 'p%p_challometer' p = <Player>
	endif
	if ScreenElementExists id = <the_id>
		DestroyScreenElement id = <the_id>
	endif
endscript

script hide_all_challenge_meters 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		hide_challenge_meter Player = <Player>
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
	hide_challenge_meter \{isband = 1}
endscript

script show_all_challenge_meters 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		show_challenge_meter Player = <Player>
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
	show_challenge_meter \{isband = 1}
endscript

script hide_challenge_meter \{Player = 1}
	if GotParam \{isband}
		formatText \{checksumName = the_id
			'band_challometer'}
	else
		formatText checksumName = the_id 'p%p_challometer' p = <Player>
	endif
	if ScreenElementExists id = <the_id>
		SetScreenElementProps id = <the_id> alpha = 0.0
	endif
endscript

script show_challenge_meter \{Player = 1}
	formatText checksumName = the_id 'p%p_challometer' p = <Player>
	if ScreenElementExists id = <the_id>
		SetScreenElementProps id = <the_id> alpha = 1.0
	endif
endscript

script fill_challenge_meter_to \{Player = 1
		level = 0
		percent = !f1768515945
		animate_meter = 0
		challenge_meter_id = !q1768515945
		use_friend_target = 0
		friend_level = -1
		friend_name = '\\L'}
	if NOT GotParam \{highest_completed}
		<color_level> = <level>
	elseif (<level> = <highest_completed>)
		<color_level> = <level>
	else
		<color_level> = <highest_completed>
	endif
	formatText checksumName = primary_color 'challenge_meter_color%l' l = <color_level>
	if (<color_level> > 0)
		formatText checksumName = secondary_color 'challenge_meter_color%l' l = (<color_level> - 1)
	endif
	if (<percent> >= 1.0)
		<percent> = 1.0
	elseif (<percent> < 0.0)
		<percent> = 0.0
	endif
	<numvisible> = (<percent> * ($challange_meter_num_ticks))
	MathFloor <numvisible>
	CastToInteger \{floor}
	<target_ticks> = <floor>
	if (<percent> = 1.0)
		<target_ticks> = ($challange_meter_num_ticks)
	endif
	fast_fill_challenge_meter_to {
		Player = <Player>
		level = <level>
		highest_completed = <highest_completed>
		target_ticks = <target_ticks>
		animate_meter = <animate_meter>
		challenge_meter_id = <challenge_meter_id>
		use_friend_target = <use_friend_target>
		friend_level = <friend_level>
		friend_name = <friend_name>
		primary_color = <primary_color>
		secondary_color = <secondary_color>
	}
endscript

script fast_fill_challenge_meter_to \{Player = 1
		level = 0
		target_ticks = !i1768515945
		animate_meter = 0
		challenge_meter_id = !q1768515945
		use_friend_target = 0
		friend_level = -1
		friend_name = '\\L'
		primary_color = challenge_meter_color0
		secondary_color = challenge_meter_color0
		allow_glow = 0}
	if ($ui_song_breakdown_already_animated_stats = 1)
		<animate_meter> = 0
	endif
	<time_per_tick> = 0.0
	if (<animate_meter> = 1)
		<time_per_tick> = 0.001
	endif
	if NOT ScreenElementExists id = <challenge_meter_id>
		return
	endif
	current_ticks = 0
	current_level = 0
	current_friend_level = 0
	challenge_diff_icons = [
		icon_difficulty_1_alpha ,
		icon_difficulty_2_alpha ,
		icon_difficulty_3_alpha ,
		icon_difficulty_4_alpha
	]
	<challenge_meter_id> :GetTags current_ticks
	<challenge_meter_id> :GetTags current_level
	<challenge_meter_id> :GetTags current_friend_level
	<fill_color> = ($<primary_color>)
	<bg_color> = ($challenge_meter_clear_color)
	if GotParam \{highest_completed}
		if (<highest_completed> > 0)
			<bg_color> = ($<secondary_color>)
		endif
	elseif (<level> > 0)
		<bg_color> = ($<secondary_color>)
	endif
	if (<use_friend_target> = 1)
		<fill_color> = ($challenge_meter_friend_color)
		<bg_color> = ($challenge_meter_clear_color)
	endif
	if (<level> > <current_level> && <use_friend_target> = 0)
		flush_challange_meter_fill {
			the_id = <challenge_meter_id>
			Color = <bg_color>
			show_flush = 1
		}
		<lvl> = 0
		begin
		if (<lvl> = <level>)
			AddParam structure_name = new_alphas Name = (<challenge_diff_icons> [<lvl>]) value = 1.0
		else
			AddParam structure_name = new_alphas Name = (<challenge_diff_icons> [<lvl>]) value = 0.0
		endif
		<challenge_meter_id> :se_setprops <new_alphas>
		RemoveParameter \{s}
		<lvl> = (<lvl> + 1)
		repeat 4
		if (<level> = 0)
			<challenge_meter_id> :se_setprops challenge_icon_rgba = [255 255 255 255] frame_effects_alpha = 0
		else
			<challenge_meter_id> :se_setprops challenge_icon_rgba = [255 255 255 255] frame_effects_alpha = 1
		endif
		if <challenge_meter_id> :desc_resolvealias Name = alias_diamondbling1 param = diamondbling1_id
			<diamondbling1_id> :obj_spawnscript anim_bling_small_002
		else
			ScriptAssert \{'pdetrich'}
		endif
		if <challenge_meter_id> :desc_resolvealias Name = alias_diamondbling2 param = diamondbling2_id
			<diamondbling2_id> :obj_spawnscript anim_bling_small_002
		else
			ScriptAssert \{'pdetrich'}
		endif
		if (<allow_glow> = 1)
			SpawnScriptNow create_challenge_meter_glow params = {Player = <Player> idchall = <challenge_meter_id>}
		endif
		<challenge_meter_id> :SetTags current_level = <level>
	endif
	<dimond_level> = 3
	if (<current_level> >= <dimond_level> && <use_friend_target> = 0)
		return
	endif
	if (<use_friend_target> = 1)
		if (<friend_level> > <current_friend_level>)
			friend_challenge_complete_fx id = <challenge_meter_id> Player = <Player>
			<challenge_meter_id> :se_setprops gamer_tag_text = <friend_name>
			<challenge_meter_id> :SetTags current_friend_level = <friend_level>
		endif
	endif
	if NOT <challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
		ScriptAssert \{'Challenge meter led Assert'}
	endif
	GetScreenElementChildren id = <led_container>
	GetArraySize <children>
	idx = 0
	num_loops = <array_Size>
	begin
	if (<idx> <= <target_ticks>)
		fastsetscreenelementprops id = (<children> [<idx>]) new_props = {rgba = <fill_color> alpha = 1.0}
		if ((<time_per_tick> > 0.0) && (<level> < 3))
			Wait <time_per_tick> Seconds
		endif
	else
		fastsetscreenelementprops id = (<children> [<idx>]) new_props = {rgba = <bg_color> alpha = 1.0}
	endif
	<idx> = (<idx> + 1)
	repeat <num_loops>
	<challenge_meter_id> :SetTags current_ticks = <target_ticks>
endscript

script friend_challenge_complete_fx 
	if GotParam \{Player}
		SpawnScriptNow create_challenge_meter_glow params = {Player = <Player> idchall = <id>}
	endif
endscript

script reset_challange_meter \{Player = 1}
	if GotParam \{isband}
		formatText \{checksumName = the_id
			'band_challometer'}
	else
		formatText checksumName = the_id 'p%p_challometer' p = <Player>
	endif
	if NOT ScreenElementExists id = <the_id>
		return
	endif
	if NOT <the_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
		ScriptAssert \{'challenge meter assert resolving to led container'}
	endif
	flush_challange_meter_fill the_id = <the_id>
	challenge_diff_icons = [
		icon_difficulty_1_alpha ,
		icon_difficulty_2_alpha ,
		icon_difficulty_3_alpha ,
		icon_difficulty_4_alpha
	]
	lvl = 0
	begin
	if (<lvl> = 0)
		AddParam structure_name = s Name = (<challenge_diff_icons> [<lvl>]) value = 1.0
	else
		AddParam structure_name = s Name = (<challenge_diff_icons> [<lvl>]) value = 0.0
	endif
	<the_id> :se_setprops <s>
	RemoveParameter \{s}
	lvl = (<lvl> + 1)
	repeat 4
	<the_id> :SetTags current_ticks = 0
	<the_id> :SetTags current_level = 0
endscript

script flush_challange_meter_fill {
		0x5A Color = ($challenge_meter_clear_color)
		0x54 the_id
		0x52 show_flush = 0
	}
	if NOT ScreenElementExists id = <the_id>
		return
	endif
	if NOT <the_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
		ScriptAssert \{'Assert'}
	endif
	GetScreenElementChildren id = <led_container>
	GetArraySize <children>
	if (<array_Size> <= 0)
		return
	endif
	<alpha> = 0.0
	if (<show_flush> = 1)
		<alpha> = 1.0
	endif
	<i> = 0
	begin
	SetScreenElementProps id = (<children> [<i>]) rgba = <Color> alpha = <alpha>
	i = (<i> + 1)
	repeat <array_Size>
endscript

script wait_then_hide \{wait_time = 5.0
		fade_time = 1.0
		block_till_song_starts = FALSE}
	if (<block_till_song_starts> = true)
		begin
		GetSongTime
		if (<songtime> > 0)
			break
		else
			Wait \{1
				gameframe}
		endif
		repeat
	endif
	Obj_GetID
	Wait <wait_time> Seconds
	<objID> :se_setprops alpha = 0 time = <fade_time>
endscript

script create_challenge_meter_glow 
	RequireParams \{[
			Player
		]}
	Wait \{1
		Frame}
	formatText checksumName = cmfx1 'Challenge_Meter_FX' p = <Player> AddToStringLookup = true
	Destroy2DParticleSystem id = <cmfx1>
	Create2DParticleSystem {
		id = <cmfx1>
		Pos = (26.0, 36.0)
		z_priority = -1
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <idchall>
		start_color = [255 255 128 255]
		end_color = [255 128 0 0]
		start_scale = (0.5, 0.5)
		end_scale = (0.25, 0.25)
		start_angle_spread = 0.0
		min_rotation = -180
		max_rotation = 360
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0050999997
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.25
	}
	formatText checksumName = namecmg1 'Challenge_Meter_Glowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namecmg1>
	CreateScreenElement {
		Type = SpriteElement
		id = <namecmg1>
		parent = <idchall>
		material = mat_meter_wibble_glow
		rgba = [255 128 0 0]
		dims = (128.0, 128.0)
		Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = -2
	}
	if ScreenElementExists id = <namecmg1>
		<namecmg1> :se_setprops rgba = [255 128 0 255] time = 0.05
	endif
	if ScriptIsRunning \{fretbar_update_tempo}
		SoundEvent \{event = gig_challenge_complete}
	endif
	Wait \{0.11
		Second}
	Destroy2DParticleSystem kill_when_empty id = <cmfx1>
	Wait \{1
		Second}
	if ScreenElementExists id = <namecmg1>
		<namecmg1> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	Wait \{1.1
		Seconds}
	DestroyScreenElement id = <namecmg1>
endscript

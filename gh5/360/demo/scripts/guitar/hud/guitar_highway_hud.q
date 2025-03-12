
script check_hud_exists 
	hud_exists = 0
	if screenelementexists \{id = hud_root}
		hud_exists = 1
	endif
	return hud_exists = <hud_exists>
endscript

script setup_individual_highway_hud player = <player>
	printf channel = zdebug qs(0xdc8363d4) p = <player>
	setup_highway_hud player = <player>
endscript

script setup_highway_hud 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	if (<part> = vocals)
		init_vocal_highway_hud player = <player>
	else
		init_standard_highway_hud player = <player>
	endif
	get_highway_hud_root_id player = <player>
	setplayerinfo <player> hud_parent = <highway_hud_root>
endscript

script show_now_playing_text 
	obj_getid
	formattext textname = now_playing_text qs(0x53516813) s = ($instrument_list.<part>.text)
	<objid> :se_setprops alpha = 0.5 text = <now_playing_text>
	<objid> :obj_spawnscript wait_then_hide params = {wait_time = 1.5 fade_time = 0.25 block_till_song_starts = true}
endscript

script destroy_highway_hud \{player = 1}
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	if screenelementexists id = <highway_hud_root>
		destroyscreenelement id = <highway_hud_root>
	endif
endscript

script get_highway_hud_root_id \{player = 1}
	getplayerinfo <player> is_onscreen
	if NOT gotparam \{no_assert}
		if (<is_onscreen> = 0)
			scriptassert qs(0xe9d69a29) p = <player>
		endif
	endif
	part = none
	getplayerinfo <player> part
	if (<part> = vocals)
		highway_position = none
		getplayerinfo <player> highway_position
		if (<highway_position> = vocal1)
			highway_hud_root = v1_highway_hud
		else
			highway_hud_root = v2_highway_hud
		endif
	else
		formattext checksumname = highway_hud_root 'p%d_highway_hud' d = <player> addtostringlookup = true
	endif
	return highway_hud_root = <highway_hud_root>
endscript

script init_standard_highway_hud 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	get_num_non_vocals_players_onscreen
	get_non_vocalist_player_number player = <player>
	get_highway_pos_and_scale num_non_vocals_players = <num_non_vocals_players> non_vocalist_player = <non_vocalist_player> player = <player>
	getplayerinfo <player> part
	skull_texture = icon_dead_256
	switch <part>
		case guitar
		skull_texture = band_hud_guitar2
		case bass
		skull_texture = band_hud_bass2
		case drum
		skull_texture = band_hud_drums2
	endswitch
	createscreenelement {
		parent = hud_root
		id = <highway_hud_root>
		type = descinterface
		desc = 'hud_highway'
		pos_anchor = [center bottom]
		just = [center bottom]
		pos = <pos>
		z_priority = 5
		autosizedims = true
		skull_alpha = 0.0
		skull_texture = <skull_texture>
		death_meter_alpha = 0.0
	}
	gamemode_gettype
	if (<type> = competitive || <type> = pro_faceoff)
		getplayerinfo <player> band
		formattext formattext checksumname = color_value 'band_color%d' d = <band>
		get_highway_hud_root_id player = <player>
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :se_setprops competitive_stripe_rgba = ($<color_value>)
		endif
	endif
	if ($calibrate_lag_enabled = 0)
		setup_player_instrument_icon player = <player>
	endif
	create_highway_color_manager player = <player>
	if ($calibrate_lag_enabled = 0)
		setup_sidebar_hud_containers player = <player>
		setup_sidebar_rockmeter player = <player>
		setup_sidebar_ns_meter player = <player>
		setup_gamertag_hud id = <id> player = <player>
	endif
	if (<type> = practice)
		hide_sp_meter player = <player>
	endif
endscript

script setup_player_instrument_icon 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> is_local_client
	if (<is_local_client> != 1)
		return
	endif
	gamemode_gettype
	if NOT (<type> = career || <type> = quickplay || <type> = competitive)
		return
	endif
	setup_new_part_based_on_difficulty player = <player> part = <part> stored_part = <stored_part>
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
	get_highway_hud_root_id player = <player>
	if <highway_hud_root> :desc_resolvealias name = alias_hud_icon_container param = icon_container
		rgba = ($vocals_hud_glow_rgba [(<player> -1)])
		if (<type> = competitive)
			getplayerinfo <player> band
			formattext checksumname = team_color 'band_color%b' b = <band>
			rgba = ($<team_color>)
		endif
		get_num_non_vocals_players_onscreen
		icon_offset = 0
		switch <num_non_vocals_players>
			case 2
			<icon_container> :se_setprops pos = {relative (0.0, 75.0)}
			case 3
			<icon_container> :se_setprops pos = {relative (0.0, 75.0)}
			case 4
			<icon_container> :se_setprops pos = {relative (0.0, 75.0)}
		endswitch
		<icon_container> :se_setprops alpha = 1.0 inst_icon_texture = <icon_texture> inst_icon_rgba = <rgba>
		<icon_container> :obj_spawnscript wait_then_hide params = {wait_time = 2.0 fade_time = 0.5 block_till_song_starts = true}
	endif
endscript

script setup_new_part_based_on_difficulty 
	gman_songtool_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	getplayerinfo <player> part
	getplayerinfo <player> stored_part
	new_part = <part>
	if (<part> = guitar)
		if (<guitar_difficulty_rating> = 0)
			new_part = bass
			if (<stored_part> = guitar)
				get_highway_hud_now_playing_text player = <player>
				<hud_now_playing_text> :obj_spawnscriptnow show_now_playing_text params = {player = <player> part = <new_part>}
			endif
		elseif (<guitar_difficulty_rating> != 0 && <stored_part> = bass)
			get_highway_hud_now_playing_text player = <player>
			new_part = guitar
			<hud_now_playing_text> :obj_spawnscriptnow show_now_playing_text params = {player = <player> part = <new_part>}
		endif
	elseif (<part> = bass)
		if (<bass_difficulty_rating> = 0)
			new_part = guitar
			if (<stored_part> = bass)
				get_highway_hud_now_playing_text player = <player>
				<hud_now_playing_text> :obj_spawnscriptnow show_now_playing_text params = {player = <player> part = <new_part>}
			endif
		elseif (<bass_difficulty_rating> != 0 && <stored_part> = guitar)
			get_highway_hud_now_playing_text player = <player>
			new_part = bass
			<hud_now_playing_text> :obj_spawnscriptnow show_now_playing_text params = {player = <player> part = <new_part>}
		endif
	endif
	setplayerinfo <player> stored_part = <new_part>
	return new_part = <new_part>
endscript

script get_highway_container_id 
	requireparams \{[
			player
		]}
	formattext checksumname = highway_container_id 'highway_containerp%p' p = <player>
	if NOT screenelementexists id = <highway_container_id>
		printf qs(0x4ec0c56f) p = <player>
	endif
	return highway_container_id = <highway_container_id>
endscript

script setup_sidebar_hud_containers 
	requireparams \{[
			player
		]}
	lpos = (($sidebar_x [(<player> -1)] * (1.0, 0.0)) + ($sidebar_y [(<player> -1)] * (0.0, 1.0)))
	langle = ($sidebar_angle [(<player> -1)])
	lpos = (0.0, 0.0)
	formattext checksumname = l_parent 'sidebar_container_leftp%p' p = <player>
	formattext checksumname = l_hud_cont 'sidebar_container_left_hudp%p' p = <player> addtostringlookup = true
	createscreenelement {
		type = descinterface
		desc = 'highway_sidebar'
		id = <l_hud_cont>
		parent = <l_parent>
		pos = (0.0, 0.0)
		just = [center bottom]
		z_priority = 3
		autosizedims = true
	}
endscript

script setup_sidebar_rockmeter \{player = 1}
	requireparams \{[
			player
		]}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	gamemode_gettype
	get_num_non_vocals_players_onscreen
	switch <num_non_vocals_players>
		case 1
		<scale> = 0.8
		<loffset> = (-25.0, -65.0)
		<roffset> = (25.0, -65.0)
		<lrot> = 2
		<rrot> = -2
		case 2
		<scale> = 0.6
		<loffset> = (-25.0, -40.0)
		<roffset> = (25.0, -30.0)
		<lrot> = 2
		<rrot> = -2
		case 3
		<scale> = 0.6
		<loffset> = (-22.0, -40.0)
		<roffset> = (22.0, -40.0)
		<lrot> = 1.5
		<rrot> = -1.5
		case 4
		<scale> = 0.5
		<loffset> = (-22.0, -40.0)
		<roffset> = (22.0, -40.0)
		<lrot> = 1
		<rrot> = -1
	endswitch
	lrot = 0
	loffset = (0.0, 0.0)
	<pos_index> = (<player> -1)
	pos_table = ($highway_pos_table [<pos_index>])
	pos = (<pos_table>.rockmeter_pos)
	scale = (<pos_table>.rockmeter_scale)
	if ((<type> = career) || (<type> = quickplay) || (<type> = freeplay))
		formattext checksumname = hud_cont 'sidebar_container_leftp%p' p = <player>
		formattext checksumname = left_rock_id 'sidebar_left_rock_meterp%p' p = <player> addtostringlookup = true
		createscreenelement {
			type = descinterface
			desc = 'hud_sidebar_rockmeter'
			id = <left_rock_id>
			parent = <hud_cont>
			pos = <pos>
			rot_angle = <lrot>
			just = [0.5 1.0]
			pos_anchor = [center bottom]
			z_priority = 3
			scale = <scale>
			autosizedims = true
			alpha = <alpha>
		}
		hud_attach_widget_sidebar_rockmeter desc_id = <id> player = <player>
	endif
	<scale_pair> = (((1.0, 0.0) * (-1 * <scale>)) + ((0.0, 1.0) * <scale>))
	<sp_pos> = (((1.0, 0.0) * (-1 * (<pos> [0]))) + ((0.0, 1.0) * (<pos> [1])))
	formattext checksumname = hud_cont_r 'sidebar_container_rightp%p' p = <player>
	formattext checksumname = right_sp_id 'sidebar_right_sp_meterp%p' p = <player> addtostringlookup = true
	if ($disable_all_starpower = 0)
		createscreenelement {
			type = descinterface
			desc = 'hud_sidebar_starpowermeter'
			id = <right_sp_id>
			parent = <hud_cont_r>
			pos = <sp_pos>
			just = [0.5 1.0]
			pos_anchor = [center bottom]
			z_priority = 3
			scale = <scale_pair>
			autosizedims = true
			alpha = <alpha>
		}
		hud_attach_widget_sidebar_starpowermeter player = <player> desc_id = <id>
	endif
endscript

script setup_sidebar_ns_meter 
	requireparams \{[
			player
		]}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	getplayerinfo <player> part
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
	<pos_index> = (<player> -1)
	pos_table = ($highway_pos_table [<pos_index>])
	pos = (<pos_table>.ns_meter_pos)
	scale = (<pos_table>.ns_meter_scale)
	formattext checksumname = hud_cont 'sidebar_container_rightp%p' p = <player>
	formattext checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player> addtostringlookup = true
	createscreenelement {
		type = descinterface
		desc = 'hud_meter_combo'
		id = <right_ns_id>
		parent = <hud_cont>
		pos = <pos>
		rot_angle = 0
		just = [center center]
		pos_anchor = [center center]
		z_priority = 2
		scale = <scale>
		autosizedims = true
		inst_icon_texture = <icon_texture>
		icon_container_alpha = 0.0
		combo_multiplier_container_alpha = 0.0
		inst_icon_alpha = 0.8
		alpha = <alpha>
	}
	hud_attach_widget_sidebar_notestreak_meter player = <player> desc_id = <id>
endscript

script setup_gamertag_hud 
	requireparams \{[
			player
			id
		]
		all}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if ininternetmode
		if <id> :desc_resolvealias name = alias_hud_gamertag param = hud_gamertag
			getplayerinfo <player> gamertag
			getplayerinfo <player> band
			formattext formattext checksumname = color_value 'band_color%d' d = <band>
			<hud_gamertag> :se_setprops {
				gamertag_bg_rgba = ($<color_value>)
				gamertag_name_text = ($<gamertag>)
				gamertag_alpha = 1.0
				alpha = <alpha>
			}
			if playerinfoequals <player> part = vocals
				<id> :se_setprops meters_menu_alpha = 0.0
			endif
			<hud_gamertag> :obj_spawnscriptnow fade_gamertags params = {player = <player> parent_id = <id>}
		endif
	endif
endscript

script fade_gamertags 
	requireparams \{[
			player
		]
		all}
	obj_getid
	begin
	getsongtime
	if (<songtime> > 0)
		break
	else
		wait \{1
			gameframe}
	endif
	repeat
	if screenelementexists id = <objid>
		if playerinfoequals <player> part = vocals
			wait \{3.0
				seconds}
			<objid> :se_setprops gamertag_alpha = 0.0 time = 1.5
			<objid> :se_waitprops
			<parent_id> :se_setprops meters_menu_alpha = 1.0 time = 0.5
		else
			if playerinfoequals <player> is_local_client = 1
				<objid> :se_setprops gamertag_alpha = 0.0 time = 1.5
			else
				<objid> :se_setprops gamertag_alpha = 0.9 time = 1.5
			endif
		endif
	endif
endscript

script hide_ns_meter \{time = 0}
	requireparams \{[
			player
		]
		all}
	formattext checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <right_ns_id>
		<right_ns_id> :se_setprops alpha = 0.0 time = <time>
	endif
endscript

script show_ns_meter \{time = 0}
	requireparams \{[
			player
		]
		all}
	formattext checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <right_ns_id>
		<right_ns_id> :se_setprops alpha = 1.0 time = <time>
	endif
endscript

script init_vocal_highway_hud \{player = 1}
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	<vocals_highway_id> :se_getprops pos
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		createscreenelement {
			parent = hud_root
			id = <highway_hud_root>
			type = descinterface
			desc = 'hud_vocals_highway'
			pos = <pos>
			pos_anchor = [left top]
			just = [left top]
			z_priority = 1
			autosizedims = true
		}
	endif
	vocal_highway_hud_init_combo_meter highway_hud_root = <highway_hud_root> player = <player>
endscript

script hide_vocal_rock_meter 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	if (<part> != vocals)
		return
	endif
	getplayerinfo <player> combo_meter_id
	if NOT screenelementexists id = <combo_meter_id>
		return
	endif
	<combo_meter_id> :se_setprops {
		health_meter_alpha = 0
	}
endscript

script show_vocal_rock_meter 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	if (<part> != vocals)
		return
	endif
	getplayerinfo <player> combo_meter_id
	if NOT screenelementexists id = <combo_meter_id>
		return
	endif
	<combo_meter_id> :se_setprops {
		health_meter_alpha = 1
	}
endscript

script pos_highway_hud \{pos = (0.0, 0.0)
		time = 0
		player = 1}
	highway_hud_root = none
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		return
		scriptassert 'player %p highway hud not found to hide' p = <player>
	endif
	<highway_hud_root> :se_setprops pos = <pos> time = <time>
endscript

script hide_highway_hud 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		return
		scriptassert 'player %p highway hud not found to hide' p = <player>
	endif
	<highway_hud_root> :se_setprops alpha = 0.0
endscript

script show_highway_hud 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		scriptassert 'player %p highway hud not found to show' p = <player>
	endif
	<highway_hud_root> :se_setprops alpha = 1.0
endscript

script hide_entire_hud 
	if screenelementexists \{id = hud_root}
		hud_root :se_setprops \{alpha = 0.0}
	endif
endscript

script show_entire_hud 
	if screenelementexists \{id = hud_root}
		hud_root :se_setprops \{alpha = 0.0}
	endif
endscript

script hide_sp_meter 
	requireparams \{[
			player
		]}
	getplayerinfo <player> part
	if (<part> = vocals)
		return
	else
		formattext checksumname = right_sp_id 'sidebar_right_sp_meterp%p' p = <player>
		if screenelementexists id = <right_sp_id>
			<right_sp_id> :se_setprops alpha = 0.0
		endif
	endif
endscript

script show_sp_meter 
	requireparams \{[
			player
		]}
	getplayerinfo <player> part
	if (<part> = vocals)
		return
	else
		formattext checksumname = right_sp_id 'sidebar_right_sp_meterp%p' p = <player>
		if screenelementexists id = <right_sp_id>
			<right_sp_id> :se_setprops alpha = 1.0
		endif
	endif
endscript

script get_highway_hud_menu_parent 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player> no_assert
	if NOT screenelementexists id = <highway_hud_root>
		return \{menu_parent = null}
	endif
	if <highway_hud_root> :desc_resolvealias name = alias_menu_container param = menu_parent
		return menu_parent = <menu_parent>
	endif
	if NOT playerinfoequals <player> part = vocals
		scriptassert \{qs(0xe8a8c19f)}
	endif
	getplayerinfo <player> combo_meter_id
	if <combo_meter_id> :desc_resolvealias name = alias_menu_container param = menu_parent
		return menu_parent = <menu_parent>
	endif
endscript

script get_highway_hud_now_playing_text 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		scriptassert 'player %p hud root not found to resolve menu parent' p = <player>
	endif
	<highway_hud_root> :desc_resolvealias name = alias_now_playing_text param = hud_now_playing_text
	return hud_now_playing_text = <hud_now_playing_text>
endscript

script get_player_challenge_meter_parent 
	requireparams \{[
			player
		]}
	getplayerinfo <player> part
	if (<part> != vocals)
		formattext checksumname = hud_cont 'sidebar_container_left_hudp%p' p = <player> addtostringlookup = true
	else
		get_highway_hud_root_id player = <player>
		if NOT screenelementexists id = <highway_hud_root>
			scriptassert 'player %p hud root not found to resolve challenge meter parent' p = <player>
		endif
		if NOT <highway_hud_root> :desc_resolvealias name = alias_challenge_meter_container param = hud_cont
			scriptassert 'player %p hud root not found to resolve challenge meter parent for vocals' p = <player>
		endif
	endif
	return challenge_meter_parent = <hud_cont>
endscript

script get_band_challenge_meter_parent 
	if NOT screenelementexists \{id = hud_root}
		scriptassert 'band hud root not found to resolve challenge meter parent' p = <player>
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_challenge_meter_container
			param = meter_parent}
		scriptassert 'player %p hud root not found to resolve menu parent' p = <player>
	endif
	return challenge_meter_parent = <meter_parent>
endscript

script get_highway_hud_message_parent 
	requireparams \{[
			player
		]}
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		scriptassert 'player %p hud root not found to resolve menu parent' p = <player>
	endif
	<highway_hud_root> :desc_resolvealias name = alias_message param = message_parent
	return message_parent = <message_parent>
endscript

script vocal_highway_hud_init_competitive_meter 
	requireparams \{[
			highway_hud_root
			player
		]
		all}
	if NOT <highway_hud_root> :desc_resolvealias name = alias_player_huds param = huds_container_id
		scriptassert \{'vocals huds container id not found'}
	endif
	formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
	<competitive_meters_id> :se_setprops alpha = 1
	hud_attach_widget_vocal_competitive_meter meter = <competitive_meters_id> player = <player>
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
	requireparams \{[
			player
		]
		all}
	this_player = <player>
	vocals_getactivehighway player = <player>
	this_highway = <active_highway>
	combo_meter_slot = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		if (<player> = <this_player>)
			return combo_meter_slot = <combo_meter_slot>
		endif
		if playerinfoequals <player> part = vocals
			vocals_getactivehighway player = <player>
			if (<active_highway> = <this_highway>)
				combo_meter_slot = (<combo_meter_slot> + 1)
			endif
		endif
		getnextplayer player = <player> on_screen
		repeat
	endif
	return combo_meter_slot = <combo_meter_slot>
endscript

script vocal_highway_hud_init_combo_meter 
	requireparams \{[
			highway_hud_root
			player
		]
		all}
	if NOT <highway_hud_root> :desc_resolvealias name = alias_player_huds param = huds_container_id
		scriptassert \{'vocals huds container id not found'}
	endif
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
	if screenelementexists id = <competitive_meters_id>
		return
	endif
	vocal_highway_get_vocals_slot player = <player>
	x_pos = (($vocal_player_vocals_slot_params [<combo_meter_slot>]).x_pos)
	gamemode_gettype
	if (<type> = career)
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		if globalexists name = <current_challenge>
			required = ((($<current_challenge>).required_band) [0])
			if (<required> = vocal)
				x_pos = (($vocal_player_vocals_slot_career_params [<combo_meter_slot>]).x_pos)
			endif
		endif
	elseif (<type> = competitive)
		x_pos = (($vocal_player_vocals_slot_competitive_params [<combo_meter_slot>]).x_pos)
	endif
	pos = ((1.0, 0.0) * <x_pos>)
	formattext checksumname = vocal_combo_meter_id 'vocal_combo_meter_p%p' p = <player>
	createscreenelement {
		parent = <huds_container_id>
		id = <vocal_combo_meter_id>
		local_id = vocals_all_meters
		type = descinterface
		desc = 'vocals_all_meters'
		tags = {player = <player>}
		dims = (256.0, 32.0)
		pos = <pos>
		alpha = <alpha>
		tags = {
			start_x_pos = <x_pos>
			dest_x_pos = <x_pos>
			lerping_factor = 1
		}
	}
	meters_id = <id>
	setplayerinfo <player> combo_meter_id = <id>
	hud_attach_widget_vocal_sp_combo_meter meter = <id> player = <player>
	setup_gamertag_hud id = <id> player = <player>
	<meters_id> :obj_spawnscriptnow vocals_hud_amplitude_glow params = {player = <player>}
	if ($game_mode = freeplay)
		<meters_id> :obj_spawnscript vocalist_scale_manager params = {player = <player>}
		<meters_id> :desc_resolvealias name = alias_freeplay_root_fader
		<resolved_id> :se_setprops alpha = 0
		<resolved_id> :se_setprops alpha = 1 motion = ease_out time = 0.5
	endif
	if ($game_mode = practice)
		<meters_id> :desc_resolvealias name = alias_freeplay_root_fader
		<resolved_id> :se_setprops alpha = 0
	endif
	vocals_getactivehighway player = <player>
	vocals_get_highway_view player = <active_highway>
	if (<highway_view> = scrolling)
		pos = (0.0, 160.0)
	else
		pos = (0.0, 188.0)
	endif
	createscreenelement {
		id = <competitive_meters_id>
		parent = <id>
		local_id = vocals_competitive_meters
		type = descinterface
		desc = 'vocals_competitive_meters'
		tags = {player = <player>}
		dims = (256.0, 32.0)
		pos = <pos>
		alpha = <alpha>
	}
	<competitive_meters_id> :se_setprops alpha = 0
	gamemode_gettype
	if (<type> = competitive || <type> = pro_faceoff || <type> = practice)
		hide_vocal_rock_meter player = <player>
	endif
endscript

script vocal_highway_hud_destroy_combo_meter 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> combo_meter_id
	destroyscreenelement id = <combo_meter_id>
endscript

script attachhudwidgetplayermeter 
	requireparams \{[
			meter_parent
			player
		]
		all}
	if screenelementexists id = {<meter_parent> child = player_meter}
		hud_attach_widget_player_multiplier parent_id = {<meter_parent> child = player_meter} player = <player>
		resolvescreenelementid id = [
			{id = <meter_parent>}
			{local_id = player_meter}
		]
		gamemode_gettype
		if <resolved_id> :desc_resolvealias name = alias_player_multiplier param = player_multiplier
			if NOT (gamemode_isbandbattle)
				<player_multiplier> :die
			endif
		endif
	else
		printf \{channel = zdebug
			qs(0xb4a146ce)}
	endif
endscript

script test_vocal_hud_flip \{player = 1}
	getplayerinfo <player> combo_meter_id
	spawn_vocal_highway_hud_animate_feedback_text text = qs(0x6e609be9) vocal_meter_container_id = <combo_meter_id>
endscript

script hud_vocal_starpower_success 
	printf \{channel = vocals
		qs(0x615528bf)}
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	if (<part> = vocals)
		spawnscriptnow lil_sp_squirt_vocals params = {player = <player>}
	else
	endif
endscript

script hud_vocal_starpower_failure 
	requireparams \{[
			player
		]
		all}
	printf \{channel = vocals
		qs(0x5b9c2161)}
endscript

script hud_vocal_feedback_script 
	requireparams \{[
			player
			quality_index
		]
		all}
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		return
	endif
	getplayerinfo <player> is_dead
	if (<is_dead> = 0)
		text = ($vocal_phrase_qualities [<quality_index>].text)
		rgba = ($vocal_phrase_qualities [<quality_index>].rgba)
		getplayerinfo <player> combo_meter_id
		spawn_vocal_highway_hud_animate_feedback_text text = <text> vocal_meter_container_id = <combo_meter_id> rgba = <rgba>
	endif
endscript

script spawn_vocal_highway_hud_animate_feedback_text \{text = qs(0x99b9ca8b)}
	requireparams \{[
			vocal_meter_container_id
			text
			rgba
		]}
	<vocal_meter_container_id> :obj_spawnscript vocal_highway_hud_animate_feedback_spawned params = {obj_id = <vocal_meter_container_id> text = <text> rgba = <rgba>}
endscript

script vocal_highway_hud_animate_feedback_spawned 
	requireparams \{[
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
	<c_meter> :se_setprops scale = (1.0, 0.0) alpha = 1.0
	<m_meter> :se_setprops scale = (1.4, 0.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops scale = (1.3, 0.0) time = <flip_time_incriment>
	wait <flip_time_incriment> seconds
	<c_meter> :se_setprops alpha = 1.0
	<c_meter> :se_setprops scale = (1.0, 1.0) time = <flip_time_incriment>
	wait \{0.4
		seconds}
	<c_meter> :se_setprops scale = (1.0, 0.0) time = <flip_time_incriment>
	wait <flip_time_incriment> seconds
	<c_meter> :se_setprops alpha = 0.0
	<m_meter> :se_setprops scale = (1.4, 1.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops scale = (1.3, 1.0) time = <flip_time_incriment>
	wait <flip_time_incriment> seconds
endscript

script hud_vocal_dead_script 
	requireparams \{[
			player
		]
		all}
	vocals_get_num_vocalists_on_same_highway player = <player>
	if (<num_vocalists_on_highway> > 1)
		getplayerinfo <player> combo_meter_id
		<combo_meter_id> :se_setprops dead_icon_alpha = 1.0
	else
		vocalshighway_getid player = <player>
		<vocals_highway_id> :se_setprops dead_icon_alpha = 1.0
	endif
	setplayerinfo <player> scoring = 0
endscript

script hud_vocal_revive 
	requireparams \{[
			player
		]
		all}
	vocals_get_num_vocalists_on_same_highway player = <player>
	if (<num_vocalists_on_highway> > 1)
		getplayerinfo <player> combo_meter_id
		<combo_meter_id> :se_setprops dead_icon_alpha = 0.0
	else
		vocalshighway_getid player = <player>
		<vocals_highway_id> :se_setprops dead_icon_alpha = 0.0
	endif
	setplayerinfo <player> scoring = 1
endscript

script spawn_vocal_highway_hud_animate_dead_text \{text = qs(0x6e609be9)}
	requireparams \{[
			vocal_meter_container_id
			text
			rgba
		]}
	<vocal_meter_container_id> :obj_spawnscript vocal_highway_hud_animate_dead_spawned params = {obj_id = <vocal_meter_container_id> text = <text> rgba = <rgba> player = <player>}
endscript

script vocal_highway_hud_animate_dead_spawned 
	requireparams \{[
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
	<c_meter> :se_setprops scale = (1.0, 0.0) alpha = 1.0
	<m_meter> :se_setprops scale = (1.0, 0.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops scale = (1.3, 0.0) time = <flip_time_incriment>
	wait <flip_time_incriment> seconds
	<c_meter> :se_setprops alpha = 1.0
	<c_meter> :se_setprops scale = (1.0, 1.0) time = <flip_time_incriment>
	wait \{0.4
		seconds}
	begin
	getplayerinfo <player> is_dead
	if (<is_dead> = 0)
		break
	endif
	wait \{10
		gameframes}
	repeat
	<c_meter> :se_setprops scale = (1.0, 0.0) time = <flip_time_incriment>
	wait <flip_time_incriment> seconds
	<c_meter> :se_setprops alpha = 0.0
	<m_meter> :se_setprops scale = (1.0, 1.0) time = <flip_time_incriment>
	<pp_meter> :se_setprops scale = (1.3, 1.0) time = <flip_time_incriment>
	wait <flip_time_incriment> seconds
endscript

script vocal_highway_hud_get_sp_meter 
	requireparams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias name = alias_vocals_star_power_meter param = sp_meter
		scriptassert 'player %p sp multiplier not found' p = <player>
	endif
	return meter_id = <sp_meter>
endscript

script vocal_highway_hud_get_pp_meter 
	requireparams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias name = alias_vocals_phrase_progress_meter param = pp_meter
		scriptassert 'player %p pp meter not found' p = <player>
	endif
	return meter_id = <pp_meter>
endscript

script vocal_highway_hud_get_mult_meter 
	requireparams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias name = alias_vocals_multiplier param = mult_meter
		scriptassert 'player %p vocal multiplier not found' p = <player>
	endif
	return meter_id = <mult_meter>
endscript

script vocal_highway_hud_get_rock_meter 
	requireparams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias name = alias_vocals_health_meter param = health_meter
		scriptassert 'player %p vocal health meter not found' p = <player>
	endif
	return meter_id = <health_meter>
endscript

script vocal_highway_hud_get_compliment_meter 
	requireparams \{[
			parent_id
		]
		all}
	if NOT <parent_id> :desc_resolvealias name = alias_vocals_word_compliment param = compliment_meter
		scriptassert 'player %p vocal meter not found' p = <player>
	endif
	return meter_id = <compliment_meter>
endscript

script kill_highway_hud \{player = 1}
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	if screenelementexists id = <highway_hud_root>
		destroyscreenelement id = <highway_hud_root>
	endif
endscript

script gethudmessageparentid \{player = 1}
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	if screenelementexists id = <highway_hud_root>
		if NOT <highway_hud_root> :desc_resolvealias name = alias_message param = message_parent
			scriptassert 'player meter %c not found' c = <highway_hud_root>
		endif
	endif
	return message_parent = <message_parent>
endscript

script get_combo_meter_id 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> hud_id
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		return
		scriptassert 'player %p highway hud not found for setting up combo meter hud widget' p = <player>
	endif
	if NOT <highway_hud_root> :desc_resolvealias name = alias_combo_sp_meter param = id
		return
		scriptassert 'player %p combo sp meter not found for setting up combo meter hud widget' p = <player>
	endif
	return combo_meter_id = <id>
endscript

script set_combo_meter_sp_meter_blue_alpha \{alpha = 1.0}
	requireparams \{[
			player
		]
		all}
	get_combo_meter_id player = <player>
	if gotparam \{combo_meter_id}
		<combo_meter_id> :se_setprops hud_meter_combo_starblue2_alpha = 1.0
	endif
endscript

script start_combo_meter_sp_glow 
	requireparams \{[
			player
		]
		all}
	get_combo_meter_id player = <player>
	if gotparam \{combo_meter_id}
		<combo_meter_id> :obj_spawnscript update_combo_meter_sp_glow params = {player = <player> obj_id = <combo_meter_id>}
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
	wait \{1
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

script check_hud_parent \{player = 1}
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> hud_parent
	printstruct channel = zdebug <...>
endscript

script test_hud_message \{player = 1}
	hud_create_message player = <player> text = qs(0x09a07a71)
endscript
highway_morph_time = 0.25
highway_morph_step_time = 0.05
highway_morph_name = m_pulsecolor

script create_highway_color_manager \{player = 1}
	requireparams \{[
			player
		]
		all}
	if NOT screenelementexists \{id = hud_root}
		return
	endif
	formattext checksumname = highway_name 'Highway_2Dp%p' p = <player> addtostringlookup = true
	formattext checksumname = container_name 'Highway_2Dp%p_color_manager' p = <player> addtostringlookup = true
	get_highway_hud_root_id player = <player>
	getplayerinfo <player> star_power_amount
	getplayerinfo <player> current_health
	getplayerinfo <player> current_run
	data = {
		highway_name = <highway_name>
		player = <player>
		state = 0
		reason = none
		current_rgba = [0.0 0.0 0.0 0.0]
		next_rgba = [0.0 0.0 0.0 0.0]
		debug_me
		last_star_power_amount = <star_power_amount>
		last_current_health = <current_health>
		last_current_run = <current_run>
	}
	createscreenelement {
		type = containerelement
		id = <container_name>
		parent = <highway_hud_root>
		tags = <data>
	}
	<id> :obj_spawnscript highway_color_manager_loop
endscript

script destroy_highway_color_manager \{player = 1}
	requireparams \{[
			player
		]
		all}
	formattext checksumname = container_name 'Highway_2Dp%p_color_manager' p = <player> addtostringlookup = true
	if screenelementexists id = <container_name>
		destroyscreenelement id = <container_name>
	endif
endscript

script highway_color_manager_loop 
	obj_getid
	<objid> :gettags
	wait_time = ((<player> -1) * 3)
	wait <wait_time> gameframes
	begin
	getsongtime
	if (<songtime> > 0)
		break
	endif
	wait \{10
		gameframes}
	repeat
	state = 0
	<old_color> = hw_color_default
	gamemode_gettype
	begin
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		destroy_highway_color_manager player = <player>
		return
	endif
	leading_player = 1
	if (<type> = competitive)
		if gman_goalisactive \{goal = competitive}
			<ruleset> = ($competitive_rules)
			if structurecontains structure = $<ruleset> elimination_rules
				<elimination_ruleset> = ($<ruleset>.elimination_rules)
				if structurecontains structure = <elimination_ruleset> effect
					if (<elimination_ruleset>.effect = difficulty)
						gman_getdata goal = competitive player = <player> name = invincible
						gman_getdata \{goal = competitive
							name = difficulty_changes}
						<difficulty_change> = (<difficulty_changes> [(<player> -1)])
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
			scriptassert \{'unknown highway effect state'}
		endswitch
		if NOT (<trans_color> = <old_color>)
			changescreenelementcolorbygfs {
				id = <highway_name>
				name = m_pulsecolor
				startcolor = ($<old_color>)
				endcolor = ($<trans_color>)
				frames = 5
				stepframes = 1
			}
			<old_color> = (<trans_color>)
		else
			wait \{5
				gameframes}
		endif
	else
		wait \{10
			gameframes}
	endif
	repeat
endscript
challange_meter_num_ticks = 36

script setup_challange_meter \{player = 1}
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if gotparam \{isband}
		get_band_challenge_meter_parent
		formattext \{checksumname = the_id
			'band_challometer'}
		pos = (-1025.0, -55.0)
		scale = 1.75
	else
		get_player_challenge_meter_parent player = <player>
		formattext checksumname = the_id 'p%p_challometer' p = <player>
		getplayerinfo <player> part
		get_num_non_vocals_players_onscreen
		if (<part> = vocals)
			determine_vocals_challenge_meter_position player = <player> parent = <challenge_meter_parent>
		else
			switch <num_non_vocals_players>
				case 1
				<offset> = (-120.0, 360.0)
				<scale> = 2.0
				case 2
				<offset> = (-30.0, 115.0)
				<scale> = 1.0
				case 3
				<offset> = (-29.0, 115.0)
				<scale> = 1.0
				case 4
				<offset> = (-29.0, 105.0)
				<scale> = 0.9
			endswitch
		endif
		pos = <offset>
	endif
	if screenelementexists id = <the_id>
		destroyscreenelement id = <the_id>
	endif
	if screenelementexists id = <challenge_meter_parent>
		createscreenelement {
			id = <the_id>
			type = descinterface
			scale = <scale>
			desc = 'hud_meter_challenge'
			parent = <challenge_meter_parent>
			pos = <pos>
			tags = {current_ticks = 0 current_level = 0}
			z_priority = 20
			alpha = <alpha>
		}
		if NOT <the_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
			scriptassert \{'Assert'}
		endif
		<dx> = (360.0 / ($challange_meter_num_ticks))
		<degree> = 0
		<cnt> = 0
		begin
		createscreenelement {
			type = spriteelement
			parent = <led_container>
			alpha = 0.0
			pos_anchor = [center center]
			rot_angle = <degree>
			pos = (0.0, 0.0)
			texture = meter_challenge_led
		}
		<degree> = (<degree> + <dx>)
		<cnt> = (<cnt> + 1)
		repeat ($challange_meter_num_ticks)
	endif
endscript

script determine_vocals_challenge_meter_position 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> vocals_highway_view
	getplayerinfo <player> highway_position
	get_num_non_vocals_players_onscreen
	right_of_progress_meter = (115.0, -243.0)
	default_scale = 1.0
	<parent> :gettags
	if NOT gotparam \{num_players_on_highway}
		num_players_on_highway = 0
	endif
	getarraysize \{$vocal_player_vocals_slot_career_params}
	if (<num_players_on_highway> > <array_size>)
		scriptassert 'Num players on vocals highway suspiciously high (&a)' a = <num_players_on_highway>
		return
	endif
	x_offset_struct = (($vocal_player_vocals_slot_career_params) [<num_players_on_highway>])
	x_offset = (<x_offset_struct>.x_pos)
	x_offset = (<x_offset> + (<right_of_progress_meter> [0]))
	x_pair = (<x_offset> * (1.0, 0.0))
	<offset> = (<x_pair> + <right_of_progress_meter>)
	<scale> = <default_scale>
	num_players_on_highway = (<num_players_on_highway> + 1)
	<parent> :settags num_players_on_highway = <num_players_on_highway>
	return offset = <offset> scale = <scale>
endscript

script destroy_challange_meter \{player = 1}
	if gotparam \{isband}
		formattext \{checksumname = the_id
			'band_challometer'}
	else
		formattext checksumname = the_id 'p%p_challometer' p = <player>
	endif
	if screenelementexists id = <the_id>
		destroyscreenelement id = <the_id>
	endif
endscript

script hide_challenge_meter \{player = 1}
	if gotparam \{isband}
		formattext \{checksumname = the_id
			'band_challometer'}
	else
		formattext checksumname = the_id 'p%p_challometer' p = <player>
	endif
	if screenelementexists id = <the_id>
		setscreenelementprops id = <the_id> alpha = 0.0
	endif
endscript

script show_challenge_meter \{player = 1}
	formattext checksumname = the_id 'p%p_challometer' p = <player>
	if screenelementexists id = <the_id>
		setscreenelementprops id = <the_id> alpha = 1.0
	endif
endscript
challenge_meter_color0 = [
	215
	176
	83
	255
]
challenge_meter_color1 = [
	224
	227
	228
	255
]
challenge_meter_color2 = [
	140
	185
	216
	255
]
challenge_meter_color3 = [
	140
	185
	216
	255
]
challenge_meter_clear_color = [
	0
	0
	0
	0
]

script fill_challenge_meter_to \{player = 1
		level = 0}
	requireparams \{[
			percent
		]
		all}
	if gotparam \{challenge_meter_id}
		<the_id> = <challenge_meter_id>
		<current_ticks> = 0
		<current_level> = 0
	else
		if gotparam \{isband}
			formattext \{checksumname = the_id
				'band_challometer'}
		else
			formattext checksumname = the_id 'p%p_challometer' p = <player>
		endif
		if NOT screenelementexists id = <the_id>
			return
		endif
		<the_id> :gettags current_ticks
		<the_id> :gettags current_level
	endif
	formattext checksumname = primary_color 'challenge_meter_color%l' l = <level>
	fill_color = ($<primary_color>)
	bg_color = ($challenge_meter_clear_color)
	if (<level> > 0)
		formattext checksumname = secondary_color 'challenge_meter_color%l' l = (<level> -1)
		bg_color = ($<secondary_color>)
	endif
	if (<level> > <current_level>)
		flush_challange_meter_fill the_id = <the_id> color = <bg_color>
		lvl = 0
		begin
		formattext checksumname = prop_name 'icon_difficulty_%l_alpha' l = (<lvl> + 1)
		if (<lvl> = <level>)
			addparam structure_name = s name = <prop_name> value = 1.0
		else
			addparam structure_name = s name = <prop_name> value = 0.0
		endif
		<the_id> :se_setprops <s>
		removeparameter \{s}
		lvl = (<lvl> + 1)
		repeat 4
		if scriptisrunning \{fretbar_update_tempo}
			soundevent \{event = gig_challenge_complete}
		else
			printf \{channel = sfx
				qs(0x660394d9)}
		endif
		if NOT (gotparam challenge_meter_id)
			spawnscriptnow create_challenge_meter_glow params = {player = <player> idchall = <the_id>}
		endif
		<the_id> :settags current_level = <level>
	endif
	if NOT <the_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
		scriptassert \{'Challenge meter led Assert'}
	endif
	if (<percent> >= 1.0)
		percent = 1.0
	elseif (<percent> < 0.0)
		percent = 0.0
	endif
	<numvisible> = (<percent> * ($challange_meter_num_ticks))
	mathfloor <numvisible>
	casttointeger \{floor}
	<target_ticks> = <floor>
	if (<percent> = 1.0)
		<target_ticks> = ($challange_meter_num_ticks)
	endif
	getscreenelementchildren id = <led_container>
	getarraysize <children>
	idx = 0
	begin
	if (<idx> <= <target_ticks>)
		setscreenelementprops id = (<children> [<idx>]) rgba = <fill_color> alpha = 1.0
	else
		setscreenelementprops id = (<children> [<idx>]) rgba = <bg_color> alpha = 1.0
	endif
	idx = (<idx> + 1)
	repeat <array_size>
	<the_id> :settags current_ticks = <target_ticks>
endscript

script reset_challange_meter \{player = 1}
	if gotparam \{isband}
		formattext \{checksumname = the_id
			'band_challometer'}
	else
		formattext checksumname = the_id 'p%p_challometer' p = <player>
	endif
	if NOT screenelementexists id = <the_id>
		return
	endif
	if NOT <the_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
		scriptassert \{'challenge meter assert resolving to led container'}
	endif
	flush_challange_meter_fill the_id = <the_id>
	lvl = 0
	begin
	formattext checksumname = prop_name 'icon_difficulty_%l_alpha' l = (<lvl> + 1)
	if (<lvl> = 0)
		addparam structure_name = s name = <prop_name> value = 1.0
	else
		addparam structure_name = s name = <prop_name> value = 0.0
	endif
	<the_id> :se_setprops <s>
	removeparameter \{s}
	lvl = (<lvl> + 1)
	repeat 4
	<the_id> :settags current_ticks = 0
	<the_id> :settags current_level = 0
endscript

script flush_challange_meter_fill color = ($challenge_meter_clear_color)
	requireparams \{[
			the_id
		]}
	if NOT screenelementexists id = <the_id>
		return
	endif
	if NOT <the_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
		scriptassert \{'Assert'}
	endif
	getscreenelementchildren id = <led_container>
	getarraysize <children>
	if (<array_size> <= 0)
		return
	endif
	<i> = 0
	begin
	setscreenelementprops id = (<children> [<i>]) rgba = <color>
	i = (<i> + 1)
	repeat <array_size>
endscript

script wait_then_hide \{wait_time = 5.0
		fade_time = 1.0
		block_till_song_starts = false}
	if (<block_till_song_starts> = true)
		begin
		getsongtime
		if (<songtime> > 0)
			break
		else
			wait \{1
				gameframe}
		endif
		repeat
	endif
	obj_getid
	wait <wait_time> seconds
	<objid> :se_setprops alpha = 0 time = <fade_time>
endscript

script create_challenge_meter_glow 
	requireparams \{[
			player
		]}
	wait \{1
		frame}
	formattext checksumname = cmfx1 'Challenge_Meter_FX' p = <player> addtostringlookup = true
	destroy2dparticlesystem id = <cmfx1>
	create2dparticlesystem {
		id = <cmfx1>
		pos = (26.0, 36.0)
		z_priority = -1
		material = sys_particle_lnzflare02_sys_particle_lnzflare02
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
		emit_rate = 0.0050999997
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.25
	}
	formattext checksumname = namecmg1 'Challenge_Meter_Glowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namecmg1>
	createscreenelement {
		type = spriteelement
		id = <namecmg1>
		parent = <idchall>
		material = mat_meter_wibble_glow
		rgba = [255 128 0 0]
		dims = (128.0, 128.0)
		pos = (0.0, 0.0)
		scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = -2
	}
	if screenelementexists id = <namecmg1>
		<namecmg1> :se_setprops rgba = [255 128 0 255] time = 0.05
	endif
	wait \{0.11
		second}
	destroy2dparticlesystem kill_when_empty id = <cmfx1>
	wait \{1
		second}
	if screenelementexists id = <namecmg1>
		<namecmg1> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	wait \{1.1
		seconds}
	destroyscreenelement id = <namecmg1>
endscript

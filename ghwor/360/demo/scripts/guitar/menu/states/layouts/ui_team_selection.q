
script ui_create_team_selection 
	createscreenelement \{parent = root_window
		id = team_selection_id
		type = descinterface
		desc = 'team_selection'
		z_priority = 0
		event_handlers = [
			{
				pad_back
				ui_sfx
				params = {
					menustate = generic
					uitype = back
				}
			}
			{
				pad_back
				generic_event_back
				params = {
					state = uistate_band_lobby
				}
			}
			{
				pad_choose
				team_selection_continue_to_next_screen
			}
		]}
	team_selection_add_players
	launchevent \{type = focus
		target = team_selection_id}
endscript

script ui_destroy_team_selection 
	if screenelementexists \{id = team_selection_id}
		destroyscreenelement \{id = team_selection_id}
	endif
endscript

script team_selection_add_players 
	if screenelementexists \{id = team_selection_id}
		if team_selection_id :desc_resolvealias \{name = alias_team_selection_menu
				param = team_selection_menu_id}
			launchevent type = focus target = <team_selection_menu_id>
			player_idx = 1
			begin
			getplayerinfo <player_idx> in_game
			if (<in_game> = 1)
				getplayerinfo <player_idx> gamertag
				name = $<gamertag>
				stringlength string = <name>
				if (<str_len> = 0)
					formattext textname = name qs(0x7bc47761) a = <player_idx>
				endif
				getplayerinfo <player_idx> controller
				createscreenelement {
					parent = <team_selection_menu_id>
					type = descinterface
					desc = 'team_selection_player_strip'
					event_handlers = [
						{pad_option team_selection_set_team params = {player = <player_idx>}}
					]
					player_name_text = <name>
					exclusive_device = <controller>
					autosizedims = true
				}
				setplayerinfo <player_idx> band = 1
				<id> :obj_spawnscript team_selection_set_team_color params = {player = <player_idx>}
				launchevent type = focus target = <id>
			endif
			<player_idx> = (<player_idx> + 1)
			repeat 8
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			add_user_control_helper \{text = qs(0x7c8f861e)
				button = blue
				z = 100000}
		endif
	endif
endscript

script team_selection_set_team 
	getplayerinfo <player> band
	if (<band> = 8)
		<band> = 1
	else
		<band> = (<band> + 1)
	endif
	setplayerinfo <player> band = <band>
endscript

script team_selection_set_team_color 
	obj_getid
	begin
	getplayerinfo <player> band
	team_selection_get_band_color band = <band>
	if <objid> :desc_resolvealias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :se_setprops competitive_stripe_rgba = ($<color_value>)
	endif
	wait \{0.5
		seconds}
	repeat
endscript

script team_selection_get_band_color \{band = 1}
	formattext checksumname = color_value 'band_color%d' d = <band>
	return band_color = ($<color_value>)
endscript

script team_selection_continue_to_next_screen 
	<player_idx> = 1
	<in_game> = 0
	<band_size> = [0 0 0 0 0 0 0 0]
	<size> = 0
	begin
	<size> = 0
	getplayerinfo <player_idx> in_game
	if (<in_game> = 1)
		getplayerinfo <player_idx> band
		setbandinfo <band> in_game = 1
		<size> = (<band_size> [(<band> - 1)])
		setarrayelement arrayname = band_size index = (<band> - 1) newvalue = (<size> + 1)
	endif
	<player_idx> = (<player_idx> + 1)
	repeat 8
	team_selection_check_for_uniform_band_size band_size = <band_size>
	if (<is_uniform_size> = 1)
		ui_sfx \{menustate = generic
			uitype = select}
		pushdisablerendering \{context = going_into_songlist
			type = unchecked}
		generic_event_choose \{state = uistate_songlist}
	endif
endscript

script team_selection_check_for_uniform_band_size 
	getarraysize <band_size>
	i = 0
	size = 0
	is_uniform_size = 0
	begin
	if ((<band_size> [<i>]) != 0)
		if (<size> = 0)
			<size> = (<band_size> [<i>])
		else
			if ((<band_size> [<i>]) = <size>)
				<is_uniform_size> = 1
			else
				<is_uniform_size> = 0
				break
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return is_uniform_size = <is_uniform_size>
endscript

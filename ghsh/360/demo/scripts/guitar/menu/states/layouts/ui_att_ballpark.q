
script ui_create_att_ballpark 
	createscreenelement \{parent = root_window
		id = my_att_ballpark
		type = descinterface
		desc = 'song_summary_att_ad'
		event_handlers = [
			{
				pad_choose
				ui_att_ballpark_continue
			}
		]}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	assignalias \{id = my_att_ballpark
		alias = current_menu}
endscript

script ui_destroy_att_ballpark 
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_att_ballpark}
endscript

script ui_att_ballpark_continue 
	generic_menu_pad_choose_sound
	ui_win_song_continue_next_menu
endscript

script ui_att_ballpark_should_i_show_ad 
	return \{show_att_ad = 0}
	lvl = ($current_level)
	if NOT (<lvl> = load_z_ballpark)
		return \{show_att_ad = 0}
	endif
	gamemode_gettype
	if NOT (<type> = career)
		return \{show_att_ad = 0}
	endif
	pc = ($primary_controller)
	gamemode_getnumplayersshown
	if (($current_num_players) > 1)
		my_checksum = att_ballpark_band
		get_savegame_from_controller controller = ($primary_controller)
	else
		getplayerinfo \{1
			controller}
		get_savegame_from_controller controller = <controller>
		getplayerinfo \{1
			part}
		switch <part>
			case guitar
			my_checksum = att_ballpark_guitar
			case bass
			my_checksum = att_ballpark_bass
			case drum
			my_checksum = att_ballpark_drum
			case vocals
			my_checksum = att_ballpark_vocals
		endswitch
	endif
	get_current_band_info
	getglobaltags <band_info> savegame = <savegame> param = <my_checksum>
	flag = (<...>.<my_checksum>)
	if (<flag> = 1)
		return \{show_att_ad = 0}
	endif
	player_idx = 1
	begin
	getplayerinfo <player_idx> controller
	get_savegame_from_controller controller = <controller>
	addparam name = <my_checksum> structure_name = my_flag value = 1
	setglobaltags <band_info> savegame = <savegame> params = <my_flag>
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
	printstruct channel = mychannel <...>
	return \{show_att_ad = 1}
endscript

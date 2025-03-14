
script launch_display_options_menu 
	if gotparam \{from_options}
		create_display_options_menu \{from_options}
	else
		create_display_options_menu
	endif
endscript

script create_display_options_menu 
	make_cas_menu {
		title = "DISPLAY"
		back_state = UIstate_pauseoptions
		not_centered
	}
	add_cas_menu_flag_item {
		text = "SCORE/SPECIAL"
		flag = $no_display_hud
		reverse
	}
	if gamemodeequals is_career
		add_cas_menu_flag_item {
			text = "COMPASS"
			flag = $NO_DISPLAY_COMPASS
			reverse
		}
	endif
	add_cas_menu_flag_item {
		text = "TRICK STRING"
		flag = $no_display_trickstring
		reverse
	}
	add_cas_menu_flag_item {
		text = "BASE SCORE"
		flag = $NO_DISPLAY_BASESCORE
		reverse
	}
	if NOT innetgame
		add_cas_menu_flag_item {
			text = "CONSOLE"
			flag = $no_display_chatwindow
			reverse
		}
	endif
	if innetgame
		if getglobalflag flag = $no_g_display_balance
		else
			add_cas_menu_flag_item {
				text = "BALANCE METER"
				flag = $NO_DISPLAY_BALANCE
				reverse
			}
		endif
	else
		add_cas_menu_flag_item {
			text = "BALANCE METER"
			flag = $NO_DISPLAY_BALANCE
			reverse
		}
	endif
	if NOT innetgame
		add_cas_menu_flag_item {
			text = "SUBTITLES"
			flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
			reverse
		}
	endif
	if innetgame
		add_cas_menu_flag_item {
			text = "NAMES/SCORES"
			flag = $NO_DISPLAY_NET_SCORE
			reverse
		}
	endif
	add_cas_menu_item text = "DONE" choose_state = UIstate_pauseoptions
	cas_menu_finish
endscript

script toggle_display_hud 
	if NOT getglobalflag \{flag = $no_display_hud}
		setscreenelementprops \{id = {
				menu_display_hud
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $no_display_hud}
	else
		setscreenelementprops \{id = {
				menu_display_hud
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $no_display_hud}
	endif
endscript

script toggle_display_compass 
	if NOT getglobalflag \{flag = $NO_DISPLAY_COMPASS}
		setscreenelementprops \{id = {
				menu_display_compass
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $NO_DISPLAY_COMPASS}
		hide_compass_anchor
	else
		setscreenelementprops \{id = {
				menu_display_compass
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $NO_DISPLAY_COMPASS}
		CompassManager_Refresh
		hide_compass_anchor
	endif
endscript

script toggle_display_trickstring 
	if NOT getglobalflag \{flag = $no_display_trickstring}
		setscreenelementprops \{id = {
				menu_display_trickstring
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $no_display_trickstring}
	else
		setscreenelementprops \{id = {
				menu_display_trickstring
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $no_display_trickstring}
	endif
endscript

script toggle_display_basescore 
	if NOT getglobalflag \{flag = $NO_DISPLAY_BASESCORE}
		setscreenelementprops \{id = {
				menu_display_basescore
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $NO_DISPLAY_BASESCORE}
	else
		setscreenelementprops \{id = {
				menu_display_basescore
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $NO_DISPLAY_BASESCORE}
	endif
endscript

script toggle_display_chatwindow 
	if NOT getglobalflag \{flag = $no_display_chatwindow}
		setscreenelementprops \{id = {
				menu_display_chatwindow
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $no_display_chatwindow}
	else
		setscreenelementprops \{id = {
				menu_display_chatwindow
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $no_display_chatwindow}
	endif
endscript

script toggle_display_balance 
	if NOT getglobalflag \{flag = $NO_DISPLAY_BALANCE}
		setscreenelementprops \{id = {
				menu_display_balance
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $NO_DISPLAY_BALANCE}
	else
		setscreenelementprops \{id = {
				menu_display_balance
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $NO_DISPLAY_BALANCE}
	endif
endscript

script toggle_cutscene_subtitles 
	if NOT getglobalflag \{flag = $NO_DISPLAY_CUTSCENE_SUBTITLES}
		setscreenelementprops \{id = {
				menu_display_cutscene_subtitles
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $NO_DISPLAY_CUTSCENE_SUBTITLES}
	else
		setscreenelementprops \{id = {
				menu_display_cutscene_subtitles
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $NO_DISPLAY_CUTSCENE_SUBTITLES}
	endif
endscript

script toggle_display_net_scores 
	if NOT getglobalflag \{flag = $no_display_net_scores}
		setscreenelementprops \{id = {
				menu_display_net_scores
				child = 3
			}
			text = "Off"}
		setglobalflag \{flag = $no_display_net_scores}
	else
		setscreenelementprops \{id = {
				menu_display_net_scores
				child = 3
			}
			text = "On"}
		unsetglobalflag \{flag = $no_display_net_scores}
	endif
endscript

script display_options_exit 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	if NOT infrontend
		create_options_menu
	else
		create_setup_options_menu
	endif
endscript

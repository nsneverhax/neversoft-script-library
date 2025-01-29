
script freestyle_refresh_menu_helpers 
	RequireParams \{[
			state
		]
		all}
	if NOT GotParam \{controller}
		controller = ($primary_controller)
	endif
	clean_up_user_control_helpers
	switch <state>
		case tutorial_setup
		case mainmenu
		case styleselect
		case song_library_popup
		case song_library_main
		if NOT GotParam \{no_songs}
			add_user_control_helper text = qs(0xc18d5e76) button = green z = 1000 controller = <controller>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = 1000 controller = <controller>
		else
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = 1000 controller = <controller>
		endif
		case postgame
		if GotParam \{stats}
			add_user_control_helper text = qs(0xb73cb78f) button = green z = 1000 controller = <controller>
			add_user_control_helper text = qs(0xde41a641) button = strumbar z = 1000 controller = <controller>
		elseif GotParam \{main}
			add_user_control_helper text = qs(0xc18d5e76) button = green z = 1000 controller = <controller>
		endif
		case Pause
		add_user_control_helper text = qs(0xc18d5e76) button = green z = 1000 controller = <controller>
		default
		add_user_control_helper text = qs(0xc18d5e76) button = green z = 1000 controller = <controller>
		add_user_control_helper text = qs(0xaf4d5dd2) button = red z = 1000 controller = <controller>
	endswitch
endscript

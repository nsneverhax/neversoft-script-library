smoketestmusicstudio = 0
smoketestdone = 0
mainmenupass = 1
gameplaypass = 1
bandlobbypass = 1
0x631c220c = 1
carpass = 1
incareerflow = 0
musicstudioexit = 0
smoketestquotanotempty = 0
smoketestquotaexceeded = 0
smoketestisrunning = FALSE

script smoketest_begin 
	setscriptcannotpause
	Change \{smoketestisrunning = true}
	ui_event_wait_for_safe
	begin
	smoketest_tick
	Wait \{1
		Second}
	if ($smoketestdone = 1)
		return
	endif
	repeat
endscript

script smoketest_tick 
	ui_event_get_top
	osprintf qs(0xf842f08c) s = <base_name>
	if IsMoviePlaying \{textureSlot = 0}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		return
	endif
	switch <base_name>
		case 'gameplay'
		if ($gameplaypass = 1)
			Wait \{10
				Seconds}
			smoketestbuttonpress \{button = a}
			Wait \{0.5
				Seconds}
		elseif ($gameplaypass = 2)
			smoketestbuttonpress \{button = a}
			Wait \{0.5
				Seconds}
		else
			Wait \{3
				Seconds}
			smoketestbuttonpress \{button = start}
			Wait \{0.5
				Seconds}
		endif
		case 'edit_name'
		Wait \{2
			Seconds}
		smoketestbuttonpress \{button = start}
		Wait \{2
			Seconds}
		smoketestbuttonpress \{button = a}
		case 'boot_guitar'
		case 'boot_iis'
		case 'create_character_gender'
		case 'create_character_genre'
		case 'tutorial_prompt'
		case 'boot_movie_ATVI'
		case 'band_name_logo'
		case 'freestyle_stats'
		case 'career_gig_select'
		case 'career_gig_info'
		case 'save_changes_dialogue'
		case 'career_movie'
		case 'options_calibrate_lag_warning'
		case 'musicstudio_jamroom_wizard'
		case 'freestyle_splash_screen'
		smoketestbuttonpress \{button = a}
		Wait \{0.5
			Seconds}
		case 'career_venue_select'
		if ($0x631c220c = 1)
			Wait \{1
				Second}
			smoketestbuttonpress \{button = right}
			Wait \{0.5
				Seconds}
		else
			Wait \{1
				Second}
			smoketestbuttonpress \{button = a}
			Wait \{0.5
				Seconds}
		endif
		case 'fan_request_splash_screen'
		if ($0x631c220c = 1)
			smoketestbuttonpress \{button = a}
		else
			smoketestbuttonpress \{button = b}
		endif
		Wait \{0.5
			Seconds}
		case 'fan_requests'
		Change \{0x631c220c = 2}
		smoketestbuttonpress \{button = b}
		Wait \{0.5
			Seconds}
		case 'customize_character'
		smoketestbuttonpress \{button = b}
		Wait \{0.5
			Seconds}
		case 'character_selection'
		if ($incareerflow = 1)
			Change \{incareerflow = 0}
			Wait \{5
				Seconds}
			smoketestbuttonpress \{button = down}
			Wait \{5
				Seconds}
			smoketestbuttonpress \{button = a}
		elseif ($carpass = 1)
			Wait \{5
				Seconds}
			smoketestbuttonpress \{button = a}
			Wait \{5
				Seconds}
			Change \{carpass = 2}
		else
			smoketestbuttonpress \{button = b}
			Wait \{5
				Seconds}
		endif
		case 'band_lobby'
		if NOT freestyle_is_active
			if ($bandlobbypass = 1)
				smoketest_do_band_lobby_pass1
			else
				smoketest_do_band_lobby_pass2
			endif
		else
			if (($freestyle_band_lobby_first_pass) = true)
				Wait \{3
					Seconds}
				smoketestbuttonpress \{button = a}
				Wait \{1
					Seconds}
				smoketestbuttonpress \{button = a}
				Wait \{1
					Seconds}
				smoketestbuttonpress \{button = a}
				Wait \{1
					Seconds}
				smoketestbuttonpress \{button = a}
				Wait \{1
					Seconds}
				smoketestbuttonpress \{button = a}
				Wait \{1
					Seconds}
			else
				smoketestbuttonpress \{button = b}
				Wait \{1
					Seconds}
				smoketestbuttonpress \{button = b}
				Wait \{1
					Seconds}
			endif
		endif
		case 'memcard'
		case 'boot_download_scan'
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{3
			Seconds}
		case 'mainmenu'
		if ($mainmenupass = 1)
			smoketest_do_main_menu_debug
		elseif ($mainmenupass = 2)
			smoketest_do_main_menu_select_career
		elseif ($mainmenupass = 3)
			smoketest_do_main_menu_select_car
		elseif ($mainmenupass = 4)
			smoketest_do_main_menu_select_freestyle
		elseif ($mainmenupass = 5)
			if ($smoketestmusicstudio = 1)
				smoketest_do_main_menu_select_musicstudio
			else
				smoketest_shutdown
			endif
		elseif ($mainmenupass = 6)
			smoketest_shutdown
		endif
		case 'debug'
		begin
		smoketestbuttonpress \{button = down}
		Wait \{0.25
			Seconds}
		repeat 1
		smoketestbuttonpress \{button = a}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = b}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = b}
		case 'fail_song'
		Wait \{1
			Second}
		smoketestbuttonpress \{button = up}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{2
			Seconds}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Second}
		Change \{gameplaypass = 3}
		case 'pausemenu_quit_warning'
		Wait \{1
			Second}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Second}
		case 'freeplay'
		smoketest_print_songname
		case 'freestyle_game_setup'
		begin
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		repeat 6
		case 'freestyle_game'
		smoketest_do_freestyle
		case 'freestyle_styleselect'
		Wait \{1
			Second}
		if ($freestyle_styleselect_after_song = 1)
			smoketestbuttonpress \{button = b}
		else
			smoketestbuttonpress \{button = a}
		endif
		case 'freestyle_mainmenu'
		Wait \{5
			Seconds}
		if ($freestyle_styleselect_after_song = 1)
			smoketestbuttonpress \{button = b}
		else
			smoketestbuttonpress \{button = a}
		endif
		case 'freestyle_postgame'
		Wait \{5
			Seconds}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Seconds}
		case 'connection_loss'
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = a}
		case 'jam'
		if ($musicstudioexit = 0)
			Wait \{1
				Seconds}
			smoketestbuttonpress \{button = down}
			Wait \{1
				Seconds}
			smoketestbuttonpress \{button = a}
		else
			smoketestbuttonpress \{button = b}
			Wait \{0.5
				Seconds}
		endif
		case 'jam_select_song'
		if ($musicstudioexit = 0)
			smoketestbuttonpress \{button = a}
			Wait \{0.5
				Seconds}
		else
			smoketestbuttonpress \{button = b}
			Wait \{0.5
				Seconds}
		endif
		case 'recording_disconnect'
		smoketestbuttonpress \{button = a}
		Wait \{0.5
			Seconds}
		Change \{musicstudioexit = 1}
		Change \{mainmenupass = 6}
		case 'wii_handle_trc'
		Wait \{1
			Second}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Second}
	endswitch
endscript

script smoketest_do_main_menu_debug 
	Wait \{5
		Seconds}
	begin
	smoketestbuttonpress \{button = up}
	Wait \{2
		Seconds}
	repeat 3
	Wait \{2
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{2
		Seconds}
	Change \{mainmenupass = 2}
endscript

script smoketest_do_main_menu_select_career 
	Change \{incareerflow = 1}
	Wait \{2
		Seconds}
	begin
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	repeat 4
	smoketestbuttonpress \{button = a}
	Wait \{1
		Second}
	Change \{mainmenupass = 3}
	Change \{gameplaypass = 2}
endscript

script smoketest_do_main_menu_select_freestyle 
	Wait \{5
		Seconds}
	begin
	smoketestbuttonpress \{button = up}
	Wait \{0.5
		Seconds}
	repeat 7
	smoketestbuttonpress \{button = a}
	Wait \{2
		Seconds}
endscript

script smoketest_do_main_menu_select_musicstudio 
	Wait \{5
		Seconds}
	begin
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	repeat 4
	smoketestbuttonpress \{button = a}
	Wait \{2
		Seconds}
endscript

script smoketest_shutdown 
	Change \{smoketestdone = 1}
	if ($smoketestquotanotempty = 1)
		return
	endif
	if ($smoketestquotaexceeded = 1)
		return
	endif
	smoketestend
endscript

script smoketest_print_songname 
	gman_songfunc \{func = get_current_song}
	osprintf qs(0x6b1e84f8) s = <current_song>
endscript

script smoketest_do_freestyle 
	begin
	Wait \{1
		Second}
	if freestylegameisstarted
		break
	endif
	repeat
	begin
	Wait \{1
		Second}
	if ($freestyle_is_song_saveable = true)
		break
	endif
	repeat
	smoketestbuttonpress \{button = start}
	Wait \{1
		Second}
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{0.5
		Seconds}
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	smoketestbuttonpress \{button = a}
	Change \{gameplaypass = 3}
	Change \{mainmenupass = 5}
endscript

script smoketest_do_band_lobby_pass1 
	Wait \{15
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{1
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{1
		Seconds}
	begin
	smoketestbuttonpress \{button = down}
	Wait \{2
		Seconds}
	repeat 2
	smoketestbuttonpress \{button = a}
	Wait \{2
		Seconds}
	begin
	smoketestbuttonpress \{button = up}
	Wait \{2
		Seconds}
	repeat 3
	smoketestbuttonpress \{button = a}
	Wait \{2
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{1
		Seconds}
	smoketestbuttonpress \{button = down}
	Wait \{1
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{1
		Seconds}
	Change \{bandlobbypass = 2}
endscript

script smoketest_do_band_lobby_pass2 
	smoketestbuttonpress \{button = start}
	Wait \{1
		Seconds}
endscript

script smoketest_do_main_menu_select_car 
	Wait \{20
		Seconds}
	begin
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	repeat 5
	smoketestbuttonpress \{button = a}
	Change \{mainmenupass = 4}
endscript

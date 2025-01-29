smoketestmusicstudio = 1
smoketestdone = 0
mainmenupass = 1
gameplaypass = 1
bandlobbypass = 1
exitingtomainmenu = 0
songlistpass = 1
carpass = 1
musicstudioexit = 1
musicstudiovisited = 0
smoketestquotanotempty = 0
smoketestquotaexceeded = 0
smoketestisrunning = FALSE
smoketest_quickplay_debug_song = debugtensecond
saveicondone = 0

script smoketest_begin 
	setscriptcannotpause
	Change \{smoketestisrunning = true}
	Change \{g_skip_social_networks = 1}
	AddArrayElement {
		array = []
		element = ($smoketest_quickplay_debug_song)
	}
	newglobal Name = smoketest_songlist value = (<array>)
	struct = {}
	get_song_struct song = ($smoketest_quickplay_debug_song)
	<song_struct> = ((<song_struct>) + ({allowed_in_quickplay = 1}))
	setstructureparam struct_name = struct param = ($smoketest_quickplay_debug_song) value = <song_struct>
	newglobal Name = smoketest_songlist_props value = (<struct>)
	AddArrayElement {
		array = ($gh_songlist)
		element = {
			list = smoketest_songlist
			props = smoketest_songlist_props
			frontend_desc = qs(0x8f5dbf4e)
			crc = smoketest
			icon = icon_gh6
			encryption_type = 6
		}
	}
	Change gh_songlist = (<array>)
	Change gh_songlist_props = (($gh_songlist_props) + {$smoketest_songlist_props})
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
		Wait \{5
			Seconds}
		smoketestbuttonpress \{button = a}
		return
	endif
	switch <base_name>
		case 'gameplay'
		if ($gameplaypass = 1)
			Wait \{10
				Seconds}
			smoketestbuttonpress \{button = start}
			Wait \{0.5
				Seconds}
		elseif ($gameplaypass = 2)
			begin
			smoketestbuttonpress \{button = left}
			Wait \{0.1
				Seconds}
			repeat 8
		elseif ($gameplaypass = 3)
			Wait \{3
				Seconds}
			smoketestbuttonpress \{button = start}
			Change \{gameplaypass = 4}
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
		case 'band_choose'
		case 'game_mode'
		case 'select_instrument'
		case 'select_difficulty'
		case 'create_character_gender'
		case 'create_character_genre'
		case 'singleplayer_character_hub'
		case 'tutorial_prompt'
		case 'boot_movie_ATVI'
		case 'band_name_logo'
		case 'career_gig_select'
		case 'career_venue_select'
		case 'career_gig_info'
		case 'save_changes_dialogue'
		case 'career_movie'
		case 'options_calibrate_lag_warning'
		case 'musicstudio_jamroom_wizard'
		case 'song_breakdown'
		case 'pausemenu'
		case 'qp_earned_stars'
		case 'save_icon_warning'
		Wait \{1.0
			Seconds}
		smoketestbuttonpress \{button = a}
		Wait \{2.0
			Seconds}
		Change \{saveicondone = 1}
		case 'career_venue_select'
		Wait \{3.0
			Seconds}
		smoketestbuttonpress \{button = a}
		Wait \{0.5
			Seconds}
		case 'customize_character'
		smoketestbuttonpress \{button = b}
		Wait \{0.5
			Seconds}
		case 'character_selection'
		if ($carpass = 1)
			Wait \{8
				Seconds}
			smoketestbuttonpress \{button = down}
			Wait \{0.5
				Seconds}
			smoketestbuttonpress \{button = down}
			Wait \{0.5
				Seconds}
			smoketestbuttonpress \{button = a}
			Wait \{5
				Seconds}
			Change \{carpass = 2}
		elseif ($carpass = 2)
			Wait \{5
				Seconds}
			smoketestbuttonpress \{button = a}
			Wait \{5
				Seconds}
			Change \{carpass = 3}
		else
			smoketestbuttonpress \{button = b}
			Wait \{5
				Seconds}
		endif
		case 'band_lobby'
		if ($exitingtomainmenu = 1)
			Change \{exitingtomainmenu = 0}
			cas_queue_block
			Wait \{5
				Seconds}
			smoketestbuttonpress \{button = b}
			Wait \{1
				Second}
		else
			if ($bandlobbypass = 1)
				smoketest_do_band_lobby_pass1
			elseif ($bandlobbypass = 2)
				smoketest_do_band_lobby_pass2
			else
				smoketest_do_band_lobby_pass3
			endif
		endif
		case 'memcard'
		case 'boot_download_scan'
		if ($saveicondone = 0)
			Wait \{1
				Second}
			smoketestbuttonpress \{button = a}
			Wait \{3
				Seconds}
		endif
		case 'mainmenu'
		if ($mainmenupass = 1)
			smoketest_do_main_menu_debug
		elseif ($mainmenupass = 2)
			smoketest_do_main_menu_select_career
		elseif ($mainmenupass = 3)
			smoketest_do_main_menu_select_quickplay
		elseif ($mainmenupass = 4)
			smoketest_do_main_menu_select_create
		elseif ($mainmenupass = 5)
			if ($smoketestmusicstudio = 1)
				smoketestbuttonpress \{button = a}
				Change mainmenupass = ($mainmenupass + 1)
				Wait \{1
					Second}
			else
				smoketest_shutdown
			endif
		elseif ($mainmenupass = 6)
			smoketest_shutdown
		endif
		case 'mainmenu_play'
		Wait \{2
			Seconds}
		if ($mainmenupass = 3)
			osprintf \{'Choosing Career'}
		elseif ($mainmenupass = 4)
			osprintf \{'Choosing Quickplay+'}
			smoketestbuttonpress \{button = down}
			Wait \{1
				Seconds}
		endif
		smoketestbuttonpress \{button = a}
		case 'mainmenu_create'
		Wait \{2
			Seconds}
		if ($musicstudiovisited = 1)
			smoketestbuttonpress \{button = b}
		else
			if ($mainmenupass = 6)
				smoketestbuttonpress \{button = down}
				Wait \{1
					Seconds}
			endif
			smoketestbuttonpress \{button = a}
		endif
		case 'debug_submenu'
		Wait \{2
			Seconds}
		begin
		Wait \{1
			Seconds}
		repeat 1
		smoketestbuttonpress \{button = a}
		Wait \{2
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
		smoketestbuttonpress \{button = down}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{2
			Seconds}
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
		Change \{exitingtomainmenu = 1}
		case 'quest_map'
		case 'quest_map_giglist'
		if ($exitingtomainmenu = 1)
			smoketestbuttonpress \{button = b}
			Wait \{1
				Second}
		else
			smoketestbuttonpress \{button = a}
			Wait \{0.5
				Seconds}
		endif
		case 'freeplay'
		smoketest_print_songname
		case 'connection_loss'
		Wait \{1
			Seconds}
		smoketestbuttonpress \{button = a}
		case 'jam'
		Change \{musicstudiovisited = 1}
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
		case 'universal_help'
		Wait \{0.5
			Seconds}
		smoketestbuttonpress \{button = a}
		case 'wii_handle_trc'
		Wait \{1
			Second}
		smoketestbuttonpress \{button = down}
		Wait \{1
			Second}
		smoketestbuttonpress \{button = a}
		Wait \{1
			Second}
		case 'songlist'
		Wait \{1
			Second}
		if ($songlistpass = 1)
			Wait \{3
				Seconds}
			get_savegame_from_controller controller = ($primary_controller)
			get_ui_song_struct_items song = ($smoketest_quickplay_debug_song) savegame = <savegame>
			songlist_item_add_to_playlist ui_struct = <ui_struct>
			Wait \{3
				Seconds}
			Change \{songlistpass = 2}
		else
			Change \{bandlobbypass = 3}
			smoketestbuttonpress \{button = b}
		endif
	endswitch
endscript

script smoketest_do_main_menu_debug 
	Wait \{15
		Seconds}
	smoketestbuttonpress \{button = up}
	Wait \{4
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{2
		Second}
	Change \{mainmenupass = 2}
endscript

script smoketest_do_main_menu_select_career 
	Wait \{2
		Seconds}
	smoketestbuttonpress \{button = down}
	Wait \{1
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{1
		Second}
	Change \{mainmenupass = 3}
	Change \{gameplaypass = 2}
endscript

script smoketest_do_main_menu_select_quickplay 
	Wait \{2
		Seconds}
	smoketestbuttonpress \{button = a}
	Wait \{0.25
		Seconds}
	ui_event_wait_for_safe
	Change \{mainmenupass = 4}
endscript

script smoketest_do_main_menu_select_create 
	Wait \{1
		Seconds}
	cas_queue_block
	begin
	smoketestbuttonpress \{button = down}
	Wait \{0.5
		Seconds}
	repeat 1
	smoketestbuttonpress \{button = a}
	Change mainmenupass = ($mainmenupass + 1)
endscript

script smoketest_shutdown 
	Change \{smoketestdone = 1}
	smoketestend
endscript

script smoketest_print_songname 
	playlist_getcurrentsong
	get_song_title_no_assert song = <current_song>
	osprintf qs(0xe4cb3449) s = <song_name>
endscript

script smoketest_do_band_lobby_pass1 
	cas_queue_block
	Wait \{3
		Second}
	smoketestbuttonpress \{button = a}
	cas_queue_block
	Wait \{3
		Second}
	smoketestbuttonpress \{button = a}
	Wait \{3
		Seconds}
	begin
	smoketestbuttonpress \{button = down}
	Wait \{0.25
		Seconds}
	repeat 4
	Wait \{0.5
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

script smoketest_do_band_lobby_pass3 
	smoketestbuttonpress \{button = b}
	Wait \{1
		Seconds}
endscript

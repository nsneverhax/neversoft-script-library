
script career_pause_quit \{quit_type = none}
	audio_gameplay_crowd_stop_all_paused_sounds
	killspawnedscript \{name = scrolling_list_begin_credits}
	destroy_credits_menu
	quest_progression_reset_career_progression_tags
	hide_glitch \{num_frames = 40}
	if innetgame
		select_quit_network_game quit_type = <quit_type>
	else
		if (<quit_type> = newgig)
			generic_event_back \{nosound
				state = uistate_quest_map}
		elseif (<quit_type> = newsong)
			generic_event_back nosound state = uistate_quest_map_giglist data = {chapter_name = ($current_chapter)}
		elseif (<quit_type> = bandlobby)
			generic_event_back \{nosound
				state = uistate_band_lobby}
		else
			generic_event_back \{nosound
				state = uistate_mainmenu}
		endif
	endif
endscript

script career_wait_for_intro 
	begin
	if ($current_playing_transition = none)
		break
	endif
	wait \{1
		gameframe}
	repeat
	enable_pause
endscript

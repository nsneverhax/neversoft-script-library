
script ui_create_special_event_popup 
	destroy_dialog_box
	create_dialog_box \{heading_text = qs(0x2e5b84db)
		body_text = qs(0x47f9731f)
		options = [
			{
				func = special_event_popup_continue
				text = qs(0x182f0173)
			}
			{
				func = generic_event_back
				text = qs(0x320a8d1c)
			}
		]}
endscript

script ui_destroy_special_event_popup 
	destroy_dialog_box
endscript

script special_event_popup_continue 
	ui_event event = menu_change data = {state = uistate_select_song_section <...>}
endscript

script special_event_2_ingame_setup 
	getfirstplayer
	getplayerinfo <Player> part
	formatText \{checksumName = event_num
		'special_event%d'
		d = $current_special_event_num}
	formatText \{checksumName = challenge_num
		'challenge%d'
		d = $current_special_event_challenge_num}
	formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	if (($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0]) > 0)
		start_index = (($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0]))
	else
		start_index = 0
	endif
	end_index = (<start_index> + 1)
	get_song_section_array
	getmarkerarraysize array = (<song_section_array>)
	gman_songtool_getcurrentsong
	if (<array_Size> > 0 && <start_index> >= 0)
		Change practice_start_time = (($<song_section_array> [<start_index>]).time)
		Change practice_start_index = <start_index>
		if (<end_index> = <array_Size> + 1)
			getfirstplayer
			getplayerinfo <Player> difficulty
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> Player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			Change practice_end_time = <total_end_time>
		else
			Change practice_end_time = (($<song_section_array> [<end_index>]).time)
			Change practice_end_index = <end_index>
		endif
	else
		Change \{practice_start_time = 0}
		songfilemanager func = get_song_end_time song_name = <current_song>
		Change practice_end_time = <total_end_time>
	endif
	setup_special_event \{num = $current_special_event_num}
	Change \{gameplay_restart_song = 1}
	generic_event_back \{state = Uistate_gameplay}
endscript

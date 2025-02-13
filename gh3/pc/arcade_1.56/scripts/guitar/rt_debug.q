rt_file_debug_enabled = 1
rt_debug_dot_mode = 0
rt_debug_watchdog_info_mode = 0
rt_file_output_boots = 1
rt_file_watchdog_logging_enabled = 1
rt_file_output_guitar_info = 1
rt_file_output_IO_drops = 1
rt_file_output_game_types = 0
rt_file_output_incomplete_games = 0
rt_debug_last_num_played = 0
rt_debug_last_num_finished = 0
rt_debug_last_num_unfinished = 0

script rt_debug_create_state_warning 
	if ($rt_debug_dot_mode)
		CreateScreenElement \{Type = ContainerElement
			id = debug_state_warning_container
			parent = root_window
			Pos = (0.0, 0.0)}
		CreateScreenElement {
			Type = TextElement
			parent = debug_state_warning_container
			font = fontgrid_title_gh3
			Scale = (0.6)
			rgba = [255 200 200 255]
			text = "."
			id = debug_warning_text_1
			Pos = (1263.0, 3.0)
			just = [center center]
			rot_angle = 0
			z_priority = 10020
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
		CreateScreenElement {
			Type = TextElement
			parent = debug_state_warning_container
			font = fontgrid_title_gh3
			Scale = (0.6)
			rgba = [200 200 255 255]
			text = "."
			id = debug_warning_text_2
			Pos = (1270.0, 3.0)
			just = [center center]
			rot_angle = 0
			z_priority = 10020
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
		CreateScreenElement {
			Type = TextElement
			parent = debug_state_warning_container
			font = fontgrid_title_gh3
			Scale = (0.6)
			rgba = [200 255 200 255]
			text = "."
			id = debug_warning_text_3
			Pos = (1277.0, 3.0)
			just = [center center]
			rot_angle = 0
			z_priority = 10020
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
		debug_warning_text_1 :SetProps \{Hide}
		debug_warning_text_2 :SetProps \{Hide}
		debug_warning_text_3 :SetProps \{Hide}
	endif
	if ($rt_file_debug_enabled)
		GetGlobalTags \{arcade_audits}
		Change rt_debug_last_num_unfinished = (<arcade_total_plays> - <arcade_total_finished> - <arcade_total_test_in_game>)
	endif
endscript

script enable_debug_state_warning_1 
	if ($is_attract_mode && $rt_debug_dot_mode)
		debug_warning_text_1 :SetProps \{unhide}
	endif
endscript

script disable_debug_state_warning_1 
	if ($rt_debug_dot_mode)
		debug_warning_text_1 :SetProps \{Hide}
	endif
endscript

script enable_debug_state_warning_2 
	if ($is_attract_mode && $rt_debug_dot_mode)
		debug_warning_text_2 :SetProps \{unhide}
	endif
endscript

script disable_debug_state_warning_2 
	if ($rt_debug_dot_mode)
		debug_warning_text_2 :SetProps \{Hide}
	endif
endscript

script enable_debug_state_warning_3 
	if ($is_attract_mode && $rt_debug_dot_mode)
		debug_warning_text_3 :SetProps \{unhide}
	endif
endscript

script disable_debug_state_warning_3 
	if ($rt_debug_dot_mode)
		debug_warning_text_3 :SetProps \{Hide}
	endif
endscript

script write_rt_debug_info 
	if ($rt_file_debug_enabled)
		outputrtdebug debugStr = <output_text>
	endif
endscript

script rt_write_play_info 
	if ($rt_file_debug_enabled)
		if ($rt_file_output_game_types)
			if (<info_type> = "begin")
				get_song_title song = <local_song>
				get_difficulty_text difficulty = ($current_difficulty)
				if (<players> = 1)
					formatText TextName = game_status '%np %s %v dev=%d' n = <players> s = <song_title> v = <difficulty_text> d = <device_num>
				else
					if ($game_mode = p2_faceoff || $game_mode = p2_coop)
						if ($game_mode = p2_faceoff)
							game_type = "fo"
						else
							game_type = "co"
						endif
						diff_textp1 = <difficulty_text>
						get_difficulty_text difficulty = ($current_difficulty2)
						formatText TextName = game_status 'S* %np %s %v/%w %d' n = <players> s = <song_title> v = <diff_textp1> w = <difficulty_text> d = <game_type>
					else ($game_mode = p2_pro_faceoff)
						game_type = "pf"
						formatText TextName = game_status 'S* %np %s %v %d' n = <players> s = <song_title> v = <difficulty_text> d = <game_type>
					endif
				endif
				printf "rt_write_play_info: %s" s = <game_status>
				write_rt_debug_info output_text = <game_status>
			else
				p1_score = ($player1_status.score)
				p2_score = ($player2_status.score)
				CastToInteger \{p1_score}
				CastToInteger \{p2_score}
				p1_health = ($player1_status.current_health)
				p2_health = ($player2_status.current_health)
				p1_note_streak = ($player1_status.best_run)
				p2_note_streak = ($player2_status.best_run)
				p1_notes = ($player1_status.notes_hit)
				p2_notes = ($player2_status.notes_hit)
				if (<players> = 1)
					formatText TextName = game_status 'E* p1 s:%s st:%t h:%h tn:%g' s = <p1_score> t = <p1_note_streak> h = <p1_health> g = <p1_notes>
				else
					formatText TextName = game_status 'E* p1 s:%s st:%t h:%h tn:%g' s = <p1_score> t = <p1_note_streak> h = <p1_health> g = <p1_notes>
					printf "rt_write_play_info: %s" s = <game_status>
					write_rt_debug_info output_text = <game_status>
					formatText TextName = game_status 'E* p2 s:%s st:%t h:%h tn:%g' s = <p2_score> t = <p2_note_streak> h = <p2_health> g = <p2_notes>
				endif
				printf "rt_write_play_info: %s" s = <game_status>
				write_rt_debug_info output_text = <game_status>
			endif
		endif
	endif
endscript

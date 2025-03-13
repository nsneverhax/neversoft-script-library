
script ui_leaderboard_group_select 
	change current_leaderboard_group = <group>
	if (<group> = song)
		if isxenonorwindx
			change \{current_leaderboard_array = $master_leaderboard_song_list}
		else
			change \{current_leaderboard_array = $master_leaderboard_song_list_ps3}
		endif
		generic_event_choose \{state = uistate_leaderboard_instrument}
	else
		if isxenonorwindx
			change \{current_leaderboard_array = $master_leaderboard_career_list}
		else
			change \{current_leaderboard_array = $master_leaderboard_career_list_ps3}
		endif
		generic_event_choose \{state = uistate_leaderboard_list}
	endif
endscript

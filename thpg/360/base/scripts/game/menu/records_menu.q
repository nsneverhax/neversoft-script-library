records_message_table = {
	time = {
		label = "Total Time Played"
		value = "%h Hrs. %m Min."
	}
	cleanlandingpercent = {
		label = "Clean Landing Percent"
		value = "%a"
	}
	trick = {
		label = "Number of Total Tricks"
		value = "%a"
	}
	specials = {
		label = "Number of Special Tricks"
		value = "%a"
	}
	fliptrick = {
		label = "Number of Flip Tricks"
		value = "%a"
	}
	Wallplant = {
		label = "Number of Wall Plants"
		value = "%a"
	}
	spin = {
		label = "Number of Spins"
		value = "%a"
	}
	cleanlanding = {
		label = "Number of Clean Landings"
		value = "%a"
	}
	Grind = {
		best = {
			label = "Best Grind"
			value = "%a Feet"
		}
		total = {
			label = "Total Grind"
			value = "%a Feet"
		}
	}
	Manual = {
		best = {
			label = "Best Manual"
			value = "%a Feet"
		}
		total = {
			label = "Total Manual"
			value = "%a Feet"
		}
	}
	wallride = {
		best = {
			label = "Best Wallride"
			value = "%a Feet"
		}
		total = {
			label = "Total Wallride"
			value = "%a Feet"
		}
	}
	air = {
		best = {
			label = "Best Air Time"
			value = "%a Seconds"
		}
		total = {
			label = "Total Air Time"
			value = "%a Seconds"
		}
	}
	lip = {
		best = {
			label = "Best Lip Time"
			value = "%a Seconds"
		}
		total = {
			label = "Total Lip Time"
			value = "%a Seconds"
		}
	}
	natas = {
		best = {
			label = "Best Natas Spin Time"
			value = "%a Seconds"
		}
		total = {
			label = "Total Natas Spin Time"
			value = "%a Seconds"
		}
	}
}

script RecordsAddMenuElement type = number display_value_as = float hours = 0
	if gotparam ability
		skater :getcumulativerecord ability = <ability> type = <type>
	endif
	if checksumequals a = <display_value_as> b = integer
		casttointeger score
	endif
	if istrue <hours>
		hours = (<score> / 3600)
		casttointeger hours
		seconds_remaining = (<score> - (<hours> * 3600))
		mins = (<seconds_remaining> / 60)
		casttointeger mins
		seconds = (<seconds_remaining> - (<mins> * 60))
		casttointeger seconds
		formattext textname = score_text (<descrip_struct>.value) h = <hours> m = <mins>
	else
		formattext textname = score_text (<descrip_struct>.value) a = <score> decimalplaces = 1
	endif
	add_cas_menu_item {
		text = (<descrip_struct>.label)
		extra_text = <score_text>
		extras_offset = (250.0, 0.0)
		extra_just = [right center]
	}
endscript

script RecordsAddMenuElement_Completion 
	add_cas_menu_item {
		text = <text>
		extra_text = <score_text>
		extras_offset = (250.0, 0.0)
		extra_just = [right center]
	}
endscript

script RecordsAddMenuElement_TotalAndBest \{display_value_as = float}
	menu_text = ((($records_message_table).<ability>).best)
	RecordsAddMenuElement ability = <ability> type = best descrip_struct = <menu_text> display_value_as = <display_value_as>
	<menu_text> = ((($records_message_table).<ability>).total)
	RecordsAddMenuElement ability = <ability> type = total descrip_struct = <menu_text> display_value_as = <display_value_as>
endscript

script RecordsAddMenuElement_Number 
	menu_text = (($records_message_table).<ability>)
	RecordsAddMenuElement ability = <ability> type = number descrip_struct = <menu_text> display_value_as = integer
endscript

script RecordsMenu pad_back_script = RecordsMenuDestroy
	if objectexists id = cumulative_records_screen
		destroyscreenelement id = cumulative_records_screen
	endif
	make_cas_menu {
		id = cumulative_records_screen
		title = "Personal Records"
		scrolling
		pausemenu
		width = 750
		pad_back_script = <pad_back_script>
		highlight_add = (200.0, 0.0)
	}
	RecordsAddMenuElement ability = time type = total hours = 1 descrip_struct = (($records_message_table).time)
	careerfunc func = getboardcomborecord
	RecordsAddMenuElement score = <board_combo_record> descrip_struct = {label = "Highest Combo" value = "%a"} display_value_as = integer
	RecordsAddMenuElement_Number ability = trick
	RecordsAddMenuElement_Number ability = specials
	RecordsAddMenuElement_Number ability = fliptrick
	RecordsAddMenuElement_Number ability = Wallplant
	RecordsAddMenuElement_Number ability = spin
	RecordsAddMenuElement_Number ability = cleanlanding
	RecordsAddMenuElement_Number ability = cleanlandingpercent
	RecordsAddMenuElement_TotalAndBest ability = air
	RecordsAddMenuElement_TotalAndBest ability = Grind
	RecordsAddMenuElement_TotalAndBest ability = Manual
	RecordsAddMenuElement_TotalAndBest ability = wallride
	RecordsAddMenuElement_TotalAndBest ability = lip
	RecordsAddMenuElement_TotalAndBest ability = natas
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [{text = "\\m1 BACK"}
			]
		}
	}
endscript

script RecordsMenuDestroy 
	gman_removeallgoals
	generic_ui_destroy
endscript

script send_leader_board_message 
	if (<score> > 0)
		netsessionfunc {
			func = write_stats
			obj = stats
			params = {
				leaderboard_id = <leaderboard_id>
				score = <score>
				dontendsessionafterwrite
			}
		}
		if NOT isxenon
			wait \{1
				second}
		endif
	endif
endscript

script update_single_leader_board_record 
	skater :getcumulativerecord ability = <ability> type = best
	if gotparam \{milliseconds}
		<score> = (<score> * 1000.0)
	endif
	casttointeger \{score}
	send_leader_board_message leaderboard_id = <leaderboard_id> score = <score>
endscript
leader_board_update_time = 300.0

script should_update_stats_leader_board 
	if IsInGoal
		return \{false}
	endif
	if screenelementexists \{id = leaderboard_page_anchor}
		return \{false}
	endif
	if infrontend
		return \{false}
	endif
	if NOT gamemodeequals \{is_career}
		return \{false}
	endif
	if innetgame
		return \{false}
	endif
	return \{true}
endscript

script update_leader_board_records 
	if NOT should_update_stats_leader_board
		return
	endif
	spawnscriptnow \{update_leader_board_records_guts}
endscript

script update_leader_board_records_guts 
	if NOT innetgame
		begin_singleplayer_game
		wait 0.3 seconds ignoreslomo
		if NOT should_update_stats_leader_board
			return
		endif
	endif
	update_single_leader_board_record ability = Grind leaderboard_id = Best_Grind_Record
	update_single_leader_board_record ability = Manual leaderboard_id = Best_Manual_Record
	update_single_leader_board_record ability = bail_points leaderboard_id = Best_Bail_Record
	careerfunc func = getboardcomborecord
	if (<board_combo_record> > 10000)
		send_leader_board_message leaderboard_id = Best_Combo_Record score = <board_combo_record>
	endif
	careerfunc func = GetCash
	send_leader_board_message leaderboard_id = cash_earned score = <cash_earned>
	if NOT innetgame
		if gamemodeequals is_career
			if gman_goalexists goal = m_story_dadhouses
				careerfunc func = writehiddenleaderboard
			endif
		endif
		netsessionfunc obj = stats func = end_write_stats
	endif
endscript

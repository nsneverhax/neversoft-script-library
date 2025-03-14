stat_levels_air = [
	200.0
	500.0
	1000.0
	1500.0
	2000.0
	2500.0
	3000.0
]
stat_levels_lip = [
	10.0
	20.0
	40.0
	60.0
	80.0
	100.0
	120.0
]
stat_levels_grind = [
	2000.0
	5000.0
	10000.0
	15000.0
	20000.0
	25000.0
	30000.0
]
stat_levels_manual = [
	2000.0
	5000.0
	10000.0
	15000.0
	20000.0
	25000.0
	30000.0
]
stat_levels_wallride = [
	500.0
	1000.0
	1500.0
	2000.0
	2500.0
	3000.0
	3500.0
]
stat_levels_specials = [
	10
	40
	100
	200
	256
	300
	512
]
stat_levels_spin = [
	50
	100
	200
	300
	400
	600
	1000
]
stat_message_names = {
	wallride = "Wall Ride"
	lip = "Invert"
	spin = "Spin"
	air = "Air"
	Manual = "Manual"
	Grind = "Grind"
	specials = "Specials"
}
show_game_time = 0
records_time_before_total_game_time_stops = 120.0

script record_message_stat_up 
	setprops \{rgba = [
			255
			255
			255
			255
		]}
	domorph \{time = 0
		pos = (320.0, 195.0)
		scale = 5
		alpha = 0}
	domorph \{time = 0.2
		scale = 1.0
		alpha = 1}
	domorph \{time = 0.1
		scale = 1.0}
	domorph \{time = 0.3
		scale = 1.6
		alpha = 1}
	domorph \{time = 0.25
		scale = 0
		alpha = 0}
endscript

script stats_play_message 
	if NOT getglobalflag \{flag = $no_display_trickstring}
		name_string = ""
		if structurecontains structure = $stat_message_names <name>
			<name_string> = ($stat_message_names.<name>)
		endif
		formattext textname = message "Stat Increased! %a +1" a = <name_string>
		ui_display_message type = uberalert text = <message> color = amber
		soundevent \{event = Stat_PopUp_SFX}
	endif
endscript

script stats_first_dialog_show screen_is_clear = 0
	if (<screen_is_clear> = 0)
		WaitUntilScreenClear callback = stats_first_dialog_show stat_name = <stat_name> screen_is_clear = 1
		return
	endif
	do_actual_pause
	goal_trigger_dialog_kill
	formattext textname = descrip_text "Your %a stat increased! Check out your STATS in SKATER OPTIONS!" a = <stat_name>
	create_dialog_box {
		title = "STAT INCREASED!"
		text = <descrip_text>
		buttons = [
			{text = "\\m0 VIEW YOUR STATS" pad_choose_script = stats_first_dialog_to_menu}
		]
		no_helper_text
	}
endscript

script stats_first_dialog_to_menu 
	dialog_box_exit
	ui_change_state \{state = UIstate_stats_from_gameplay}
endscript

script records_show_game_time_update 
	if NOT istrue \{$show_game_time}
		return
	endif
	skater :getcumulativerecord \{ability = time
		type = total}
	formattext textname = score_text " Total game time %a seconds" a = <score>
	ntt_clear_message \{id = records_show_time}
	create_panel_message text = <score_text> id = records_show_time
endscript

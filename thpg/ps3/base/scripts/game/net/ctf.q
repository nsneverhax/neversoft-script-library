goal_ctf_genericParams = {
	goal_text = "Capture the other team's flag and return it to your base!"
	time = 30
	score = 1
	net
	goal_type_checksum = net
	init = goal_ctf_init
	activate = goal_ctf_activate
	deactivate = goal_ctf_deactivate
	active = goal_ctf_active
	goal_description = "Capture the Flag!"
}

script goal_ctf_init 
endscript

script goal_ctf_activate 
	GetNumTeams
	create_team_flags <...>
	printstruct <...>
	if (<unlimited_time> = 1)
		if (<score> = 1)
			formattext textname = msg_text "\\c3Capture the Flag:\\n\\c0First to %s capture wins" s = <score>
		else
			formattext textname = msg_text "\\c3Capture the Flag:\\n\\c0First to %s captures wins" s = <score>
		endif
	else
		formattext textname = msg_text "\\c3Capture the Flag:\\n\\c0Most captures wins"
	endif
	DisplayGameDescription description = <msg_text>
	ResetScore
	if (<unlimited_time> = 0)
		runscriptonscreenelement id = the_time clock_morph
	endif
	StartCTFGame
endscript

script goal_ctf_active 
	if (<unlimited_time> = 1)
		if AnySkaterTotalScoreAtLeast <score>
			if OnServer
				if CalculateFinalScores
					GoalManager_DeactivateGoal name = <goal_id>
				endif
			else
				GoalManager_DeactivateGoal name = <goal_id>
			endif
		endif
	endif
endscript

script goal_ctf_deactivate 
	printf \{"*************** goal_ctf_deactivate"}
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	destroy_ctf_panel_message
	hide_ctf_arrow
	kill_team_flags
	EndCTFGame
	report_stats \{final}
	if NOT ($is_changing_levels = 1)
		create_rankings \{score_title_text = "CAPTURES"}
	endif
endscript

script ctf_done 
	dialog_box_exit
	do_backend_retry
endscript

script Addgoal_ctf 
	GoalManager_AddGoal name = CTF {
		params = {$goal_ctf_genericParams
			<...>
		}
	}
endscript

script show_ctf_arrow 
	if isobserving
		return
	endif
	if gman_goalisactive goal = CTF
		printf "***** SHOWING CTF ARROW"
		if objectexists id = ctf_arrow
			printf "***** HIDING IT FIRST"
			hide_ctf_arrow
		endif
		if NOT getpakmancurrentname map = zones
			script_assert "Create_Team_Flags called before zone map created"
		endif
		zone_name = <pakname>
		switch <team>
			case 0
			printf "***** target is red"
			formattext checksumname = target '%z_TRG_CTF_Red' z = <zone_name>
			case 1
			printf "***** target is blue"
			formattext checksumname = target '%z_TRG_CTF_Blue' z = <zone_name>
			case 2
			printf "***** target is green"
			formattext checksumname = target '%z_TRG_CTF_Green' z = <zone_name>
			case 3
			printf "***** target is yellow"
			formattext checksumname = target '%z_TRG_CTF_Yellow' z = <zone_name>
		endswitch
		printf "***** creating...."
		Create3dArrowPointer id = ctf_arrow name = <target>
	endif
endscript

script hide_ctf_arrow 
	if objectexists \{id = ctf_arrow}
		destroyscreenelement \{id = ctf_arrow}
	endif
endscript

script Startgoal_ctf 
	GoalManager_EditGoal name = CTF params = <...>
	GoalManager_ActivateGoal \{name = CTF}
endscript

script took_flag_other 
	printf \{"******* took flag other"}
	formattext textname = msg_text "%s has taken the %w flag." s = <string0> w = <string1>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script took_flag_you 
	printf "******* took flag you"
	create_ctf_panel_message msg_text = "Return the flag to your base!"
	formattext textname = msg_text "You have taken the %s flag. Return it to your base!" s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script took_flag_yours 
	printf \{"******* took flag yours"}
	formattext textname = msg_text "%s has taken your flag! Hunt him down!" s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_other 
	printf \{"******* stole flag other"}
	formattext textname = msg_text "%s has stolen the %w flag." s = <string0> w = <string1>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_you 
	printf \{"******* stole flag you"}
	formattext textname = msg_text "You have stolen the %s flag. Return it to your base!" s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script stole_flag_from_you 
	printf \{"******* stole flag from you"}
	destroy_ctf_panel_message
	formattext textname = msg_text "%s has stolen the %w flag from you!" s = <string0> w = <string1>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script relocate_flag 
	if NOT getpakmancurrentname map = zones
		script_assert "Create_Team_Flags called before zone map created"
	endif
	zone_name = <pakname>
	switch <team>
		case 0
		formattext checksumname = flag_name '%z_TRG_CTF_Red' z = <zone_name>
		case 1
		formattext checksumname = flag_name '%z_TRG_CTF_Blue' z = <zone_name>
		case 2
		formattext checksumname = flag_name '%z_TRG_CTF_Green' z = <zone_name>
		case 3
		formattext checksumname = flag_name '%z_TRG_CTF_Yellow' z = <zone_name>
	endswitch
	if isinnodearray <flag_name>
		if iscreated <flag_name>
			<flag_name> :die
		endif
	endif
	create name = <flag_name>
	if OnServer
		seteventhandler event = anyobjectinradius scr = CTF_Team_Flag_Trigger response = switch_script params = {<...>}
	endif
endscript

script captured_your_flag 
	printf \{"******* captured your flag"}
	formattext textname = msg_text "%s has captured your flag!" s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
	relocate_flag <...>
endscript

script captured_flag_other 
	printf \{"******* captured flag other"}
	formattext textname = msg_text "%s has captured the %w flag!" s = <string0> w = <string1>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
	relocate_flag <...>
endscript

script captured_flag_you 
	printf \{"******* captured flag you"}
	destroy_ctf_panel_message
	formattext textname = msg_text "You have captured the %s flag!" s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
	relocate_flag <...>
endscript

script retrieved_flag_you 
	printf \{"******* retrieved flag you"}
	formattext textname = msg_text "You retrieved the %s flag!" s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
	relocate_flag <...>
endscript

script retrieved_flag_other 
	printf \{"******* retrieved flag other"}
	formattext textname = msg_text "%s retrieved the %w flag!" s = <string0> w = <string1>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
	relocate_flag <...>
endscript

script flag_returned 
	printf \{"******* flag returned"}
	formattext textname = msg_text "The %s has returned to its base." s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
	relocate_flag <...>
endscript

script create_ctf_panel_message 
	create_panel_block id = current_ctf_message parent = root_window text = <msg_text> style = panel_message_goal final_pos = (620.0, 80.0) dont_animate
endscript

script destroy_ctf_panel_message 
	if objectexists \{id = current_ctf_message}
		destroyscreenelement \{id = current_ctf_message}
	endif
endscript

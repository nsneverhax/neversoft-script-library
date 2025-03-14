goal_firefight_genericParams = {
	goal_text = "You must eliminate all other players!"
	unlimited_time = 1
	net
	goal_type_checksum = net
	init = goal_firefight_init
	activate = goal_firefight_activate
	active = goal_firefight_active
	deactivate = goal_firefight_deactivate
	expire = goal_firefight_expire
	goal_description = "FireFight!"
}

script goal_firefight_init 
endscript

script goal_firefight_activate 
	if InTeamGame
		formattext textname = msg_text "FireFight! \\nThe last team standing wins.\\n\\b1\\b7 or \\b1\\b4\\nto shoot"
	else
		formattext textname = msg_text "FireFight! \\nThe last player standing wins.\\n\\b1\\b7 or \\b1\\b4\\nto shoot"
	endif
	if NOT isobserving
		skater :pickeduppowerup fireball
		bind_fireball_tricks
	endif
	if insplitscreengame
		skater2 :pickeduppowerup fireball
		bind_fireball_tricks_player_2
		MakeSkaterGosub add_skater_to_world skater = 0
		MakeSkaterGosub add_skater_to_world skater = 1
	endif
	DisplayGameDescription description = <msg_text>
	ResetScore
endscript

script goal_firefight_active 
	if OnlyOneSkaterLeft
		if OnServer
			if CalculateFinalScores
				GoalManager_DeactivateGoal name = <goal_id>
				goal_firefight_finished
			endif
		else
			GoalManager_DeactivateGoal name = <goal_id>
			goal_firefight_finished
		endif
	endif
endscript

script goal_firefight_finished 
	ClearPowerups
	if NOT isobserving
		unbind_fireball_tricks
	endif
	if insplitscreengame
		unbind_fireball_tricks_player_2
	endif
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	printf \{"goal_firefight_deactivate"}
	report_stats \{final}
	create_rankings \{score_title_text = "HEALTH"}
endscript

script goal_firefight_deactivate 
	ClearPowerups
	if NOT isobserving
		unbind_fireball_tricks
	endif
	if insplitscreengame
		unbind_fireball_tricks_player_2
	endif
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
endscript

script firefight_done 
	dialog_box_exit
	do_backend_retry
endscript

script goal_firefight_expire 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	printf \{"goal_firefight_expire"}
	if OnServer
		spawnscriptlater \{wait_then_create_rankings
			params = {
				score_title_text = "Health"
			}}
	else
		create_rankings \{score_title_text = "Health"}
	endif
endscript

script AddGoal_firefight 
	GoalManager_AddGoal name = firefight {
		params = {$goal_firefight_genericParams
			<...>
		}
	}
endscript

script StartGoal_firefight 
	if insplitscreengame
		SetScreenModeFromGameMode
	endif
	GoalManager_EditGoal name = firefight params = <...>
	GoalManager_ActivateGoal \{name = firefight}
endscript

script announce_elimination 
	printf \{"announcing elimination!!!!"}
	formattext textname = msg_text "%s has been eliminated!" s = <name>
	create_net_panel_message msg_time = 2000 text = <msg_text>
endscript

script bind_fireball_tricks 
	GetTrickFromKeyCombo \{key_combo = Air_SquareU}
	skater :settags old_fireballf_checksum = <trick_checksum>
	BindTrickToKeyCombo \{key_combo = Air_SquareU
		trick = FireballF
		update_mappings = 1}
	UpdateTrickMappings \{skater = 0}
	GetTrickFromKeyCombo \{key_combo = Air_SquareD}
	skater :settags old_fireballb_checksum = <trick_checksum>
	BindTrickToKeyCombo \{key_combo = Air_SquareD
		trick = FireballB
		update_mappings = 1}
	UpdateTrickMappings \{skater = 0}
endscript

script bind_fireball_tricks_player_2 
	setcurrentskaterprofile 1
	GetTrickFromKeyCombo key_combo = Air_SquareU
	skater2 :settags old_fireballf_checksum = <trick_checksum>
	BindTrickToKeyCombo {
		key_combo = Air_SquareU
		trick = FireballF
		update_mappings = 1
	}
	UpdateTrickMappings skater = 1
	GetTrickFromKeyCombo key_combo = Air_SquareD
	skater2 :settags old_fireballb_checksum = <trick_checksum>
	BindTrickToKeyCombo {
		key_combo = Air_SquareD
		trick = FireballB
		update_mappings = 1
	}
	UpdateTrickMappings skater = 1
	setcurrentskaterprofile 0
endscript

script unbind_fireball_tricks 
	skater :gettags
	if gotparam \{old_fireballf_checksum}
		BindTrickToKeyCombo {
			key_combo = Air_SquareU
			trick = <old_fireballf_checksum>
			update_mappings = 1
		}
	endif
	UpdateTrickMappings \{skater = 0}
	if gotparam \{old_fireballb_checksum}
		BindTrickToKeyCombo {
			key_combo = Air_SquareD
			trick = <old_fireballb_checksum>
			update_mappings = 1
		}
	endif
	UpdateTrickMappings \{skater = 0}
endscript

script unbind_fireball_tricks_player_2 
	setcurrentskaterprofile \{1}
	skater2 :gettags
	if gotparam \{old_fireballf_checksum}
		BindTrickToKeyCombo {
			key_combo = Air_SquareU
			trick = <old_fireballf_checksum>
			update_mappings = 2
		}
	endif
	UpdateTrickMappings \{skater = 1}
	if gotparam \{old_fireballb_checksum}
		BindTrickToKeyCombo {
			key_combo = Air_SquareD
			trick = <old_fireballb_checksum>
			update_mappings = 2
		}
	endif
	UpdateTrickMappings \{skater = 1}
	setcurrentskaterprofile \{0}
endscript

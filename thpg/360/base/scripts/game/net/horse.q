
script PlayYouTieScoreSound 
endscript

script PlayYouBeatScoreSound 
endscript

script PlayYouGetLetterSound 
endscript

script PlayYouLoseSound 
endscript

script PlayNoScoreSetSound 
endscript

script play_appropriate_horse_sound 
	if HorseEnded
		PlayYouLoseSound
	endif
	if HorseStatusEquals \{GotLetter}
		PlayYouGetLetterSound
	endif
	if HorseStatusEquals \{TieScore}
		PlayYouTieScoreSound
	endif
	if HorseStatusEquals \{BeatScore}
		PlayYouBeatScoreSound
	endif
	if HorseStatusEquals \{NoScoreSet}
		PlayNoScoreSetSound
	endif
endscript

script WaitForPanelDone 
	begin
	if controllerpressed x
		kill_horse_panel_messages
		break
	endif
	if objectexists id = top
		wait 1 gameframe
	else
		if objectexists id = bottom
			wait 1 gameframe
		else
			if objectexists id = TopFinal
				wait 1 gameframe
			else
				if objectexists id = BottomFinal
					wait 1 gameframe
				else
					break
				endif
			endif
		endif
	endif
	repeat
endscript
player1_horsecolor = [
	{
		(128.0, 32.0, 32.0)
		alpha = 128
	}
]
player2_horsecolor = [
	{
		(32.0, 32.0, 128.0)
		alpha = 128
	}
]
horse_top_key_points = [
	{
		pos = (320.0, 204.0)
		alpha = 0
		scale = 1.0
		time = 0
	}
	{
		alpha = 128
		time = 2.0
	}
]
horse_middle_key_points = [
	{
		pos = (320.0, 224.0)
		alpha = 0
		scale = 1.0
		time = 0
	}
	{
		alpha = 128
		time = 2.0
	}
]
horse_bottom_key_points = [
	{
		pos = (320.0, 244.0)
		alpha = 0
		scale = 1.0
		time = 0
	}
	{
		alpha = 128
		time = 2.0
	}
]
horse_bottomfinal_key_points = [
	{
		pos = (340.0, 300.0)
		alpha = 0
		scale = 2.0
		time = 0
	}
	{
		alpha = 128
		time = 5.0
	}
]
horse_topfinal_key_points = [
	{
		pos = (320.0, 204.0)
		alpha = 0
		scale = 1.0
		time = 0
	}
	{
		alpha = 128
		time = 5.0
	}
]
player1_default_horseprop = {
	font = 'title.fnt'
	just = (0.0, 0.0)
	dims = (320.0, 112.0)
	colors = player1_horsecolor
	key_points = horse_middle_key_points
}
player2_default_horseprop = {
	font = 'title.fnt'
	just = (0.0, 0.0)
	dims = (320.0, 112.0)
	colors = player2_horsecolor
	key_points = horse_middle_key_points
}
player1_top_horseprop = {
	player1_default_horseprop
	key_points = horse_top_key_points
}
player2_top_horseprop = {
	player2_default_horseprop
	key_points = horse_top_key_points
}
player1_bottom_horseprop = {
	player1_default_horseprop
	key_points = horse_bottom_key_points
}
player2_bottom_horseprop = {
	player2_default_horseprop
	key_points = horse_bottom_key_points
}
player1_topfinal_horseprop = {
	player1_default_horseprop
	key_points = horse_topfinal_key_points
}
player2_topfinal_horseprop = {
	player2_default_horseprop
	key_points = horse_topfinal_key_points
}
player1_bottomfinal_horseprop = {
	player1_default_horseprop
	key_points = horse_bottomfinal_key_points
}
player2_bottomfinal_horseprop = {
	player2_default_horseprop
	key_points = horse_bottomfinal_key_points
}
horse_final_prop_default = {
	font = 'title.fnt'
	just = (0.0, 0.0)
	dims = (320.0, 112.0)
	colors = [
		{
			(128.0, 128.0, 128.0)
			alpha = 128
		}
		{
			(255.0, 245.0, 0.0)
			alpha = 128
		}
		{
			(195.0, 20.0, 20.0)
			alpha = 128
		}
	]
	key_points = [
		{
			pos = (320.0, 224.0)
			alpha = 0
			scale = 1.0
			time = 0
		}
		{
			alpha = 128
			time = 5.0
		}
	]
}

script remove_skater_from_world 
	printf \{"removing skater to the world"}
	RemoveSkaterFromWorld
endscript

script add_skater_to_world 
	printf \{"adding skater to the world"}
	AddSkaterToWorld
	ResetLookAround
endscript

script print_horse_string 
	if IsCurrentHorseSkater 0
		if gotparam top
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player1_top_horseprop
				id = top
			}
		elseif gotparam bottom
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player1_bottom_horseprop
				id = bottom
			}
		elseif gotparam TopFinal
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player1_topfinal_horseprop
				id = TopFinal
			}
		elseif gotparam BottomFinal
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player1_bottomfinal_horseprop
				id = BottomFinal
			}
		else
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player1_default_horseprop
				id = top
			}
		endif
	else
		if gotparam top
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player2_top_horseprop
				id = top
			}
		elseif gotparam bottom
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player2_bottom_horseprop
				id = bottom
			}
		elseif gotparam TopFinal
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player2_topfinal_horseprop
				id = TopFinal
			}
		elseif gotparam BottomFinal
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player2_bottomfinal_horseprop
				id = BottomFinal
			}
		else
			ApplyToHorsePanelString {
				whichstring = <whichstring>
				callback = LaunchPanelMessage
				properties = player2_default_horseprop
				id = top
			}
		endif
	endif
endscript

script horse_start_run 
	printf "--- hourse_start_run"
	kill_start_key_binding
	StartHorseRun
	ShowClock
	disable_inactive_horse_player
	wait 1 gameframe
	WaitForPanelDone
	printf "***** PAUSING GAME *****"
	unpause_game_and_destroy_pause_menu
	kill_start_key_binding
	pausegame
	print_horse_string {whichstring = playername top}
	print_horse_string {whichstring = horseprerun bottom}
	WaitForPanelDone
	getpreferencechecksum pref_type = splitscreen horse_time_limit
	switch <checksum>
		case horse_time_10
		horse_time = 10
		case horse_time_20
		horse_time = 20
		case horse_time_30
		horse_time = 30
	endswitch
	if screenelementexists id = horse_score_vmenu
		doscreenelementmorph id = horse_score_vmenu alpha = 0.5 time = 2
	endif
	horse_wait_for_hardware_pause
	StartGoal_Horse_Mp time = <horse_time>
	printf "***** UNPAUSING GAME *****"
	if IsCurrentHorseSkater 0
		skater :ResetLookAround
		skater :runstarted
	else
		skater2 :ResetLookAround
		skater2 :runstarted
	endif
	horse_check_for_controller_unplugged_dialog
	unpausegame
	restore_start_key_binding
	GetHorseString whichstring = panelString1
	update_horse_score id = horse_score_1 <...>
	GetHorseString whichstring = panelString2
	update_horse_score id = horse_score_2 <...>
	GetHorseString whichstring = horseprerun
	update_horse_score id = horse_score_3 <...>
	wait 1 gameframe
	if IsCurrentHorseSkater 0
		skater :StoppedStateExit
	else
		skater2 :StoppedStateExit
	endif
endscript

script horse_hide_player 
	if gotparam \{unhide}
		unhide
	else
		hide
	endif
endscript

script disable_inactive_horse_player 
	if IsCurrentHorseSkater 0
		printf "unhiding skater 0"
		setscreenmode horse1
		MakeSkaterGosub add_skater_to_world skater = 0
		printf "hiding skater 1"
		MakeSkaterGosub remove_skater_from_world skater = 1
		printf "*** done"
		printf "************** ABOUT TO DO CONTROLLER ENABLING 1"
		skater2 :disableplayerinput
		skater2 :pausephysics
		skater2 :horse_hide_player
		skater :horse_hide_player unhide
		skater :enableplayerinput
		skater :unpausephysics
	elseif IsCurrentHorseSkater 1
		printf "unhiding skater 1"
		setscreenmode horse2
		MakeSkaterGosub add_skater_to_world skater = 1
		printf "hiding skater 0"
		MakeSkaterGosub remove_skater_from_world skater = 0
		printf "*** done"
		printf "************** ABOUT TO DO CONTROLLER ENABLING 2"
		skater :disableplayerinput
		skater :pausephysics
		skater :horse_hide_player
		skater2 :horse_hide_player unhide
		skater2 :enableplayerinput
		skater2 :unpausephysics
	endif
	setactivecamera id = skatercam0 viewport = 0
	setactivecamera id = skatercam1 viewport = 1
	tod_proxim_reapply_lightfx
endscript

script horse_wait_for_unpause 
	if screenelementexists \{id = pause_vmenu}
		begin
		printf \{'horse - waiting for unpause'}
		wait \{1
			gameframe}
		if NOT screenelementexists \{id = pause_vmenu}
			break
		endif
		repeat
	endif
endscript

script horse_end_run 
	horse_wait_for_unpause
	kill_start_key_binding
	if screenelementexists id = horse_score_vmenu
		doscreenelementmorph id = horse_score_vmenu alpha = 1.0 time = 0.5
		wait 0.5 seconds
	endif
	printf "entering horse_end_run"
	EndHorseRun
	EndGoal_Horse_Mp
	WaitForPanelDone
	printf "***** PAUSING GAME *****"
	kill_start_key_binding
	pausegame
	play_appropriate_horse_sound
	if HorseEnded
		printf "HORSE GAME DONE"
		print_horse_string {whichstring = youarea TopFinal}
		print_horse_string {whichstring = finalword BottomFinal}
		wait 120 gameframes
		if objectexists id = horse_score_menu
			destroyscreenelement id = horse_score_menu
		endif
	else
		print_horse_string {whichstring = playername top}
		print_horse_string {whichstring = horsepostrun bottom}
	endif
	WaitForPanelDone
	SwitchHorsePlayers
	printf "***** UNPAUSING GAME *****"
	wait 1 gameframe
	printf "exiting horse_end_run"
	if HorseEnded
		restore_start_key_binding
		ui_change_state state = UIstate_2player_create_game
	else
		horse_check_for_controller_unplugged_dialog
		horse_wait_for_hardware_pause
		unpausegame
	endif
	change HorseTimerExpired = 0
endscript

script horse_wait_for_hardware_pause 
	if ($paused_for_hardware = 1)
		begin
		if NOT ($paused_for_hardware = 1)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script horse_uninit 
endscript

script kill_horse_panel_messages 
	if objectexists \{id = top}
		destroyscreenelement \{id = top}
	endif
	if objectexists \{id = bottom}
		destroyscreenelement \{id = bottom}
	endif
	if objectexists \{id = TopFinal}
		destroyscreenelement \{id = TopFinal}
	endif
	if objectexists \{id = BottomFinal}
		destroyscreenelement \{id = BottomFinal}
	endif
endscript

script horse_check_for_controller_unplugged_dialog 
	begin
	if NOT screenelementexists \{id = controller_unplugged_dialog_anchor}
		root_window :gettags
		if gotparam \{menu_state}
			if (<menu_state> = off)
				break
			endif
		else
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script create_horse_panel_message 
	<text_rgba> = [200 180 160 255]
	chaos1 = Random (@ 1 @ 2 )
	chaos2 = Random (@ 3 @ 4 )
	switch <id>
		case top
		message_pos = (640.0, 180.0)
		message_color = <text_rgba>
		<style> = play_horse_animation
		case bottom
		message_pos = (640.0, 230.0)
		message_color = [216 224 240 255]
		<style> = play_horse_animation2
		case TopFinal
		message_pos = (640.0, 180.0)
		message_color = <text_rgba>
		<style> = play_horse_animation_final_1
		case BottomFinal
		message_pos = (640.0, 230.0)
		message_color = <text_rgba>
		<style> = play_horse_animation_final_2
		default
	endswitch
	create_panel_block <...> style = <style> parent = root_window pos = <message_pos> rgba = <message_color> font = text_a1 dims = (450.0, 0.0) z_priority = 10
endscript

script play_horse_animation 
	switch <chaos1>
		case 1
		domorph time = 0 scale = 0 alpha = 0 pos = (640.0, 0.0)
		domorph time = 0.3 scale = 1.0 alpha = 1 pos = (640.0, 165.0)
		domorph time = 0.1 pos = (640.0, 160.0)
		wait 1.5 seconds
		domorph time = 0.2 scale = (12.0, 0.0) alpha = 0
		die
		case 2
		domorph time = 0 scale = 0 alpha = 0 pos = (640.0, 500.0)
		domorph time = 0.2
		domorph time = 0.3 scale = 1.0 alpha = 1 pos = (640.0, 165.0)
		domorph time = 0.1 pos = (640.0, 160.0)
		wait 1.5 seconds
		domorph time = 0.2 scale = (12.0, 0.0) alpha = 0
		die
	endswitch
endscript

script play_horse_animation2 
	switch <chaos2>
		case 3
		domorph time = 0 scale = 0 alpha = 0 pos = (0.0, 210.0)
		domorph time = 0.3
		domorph time = 0.1 scale = 1.0 alpha = 1 pos = (640.0, 210.0)
		wait 1.5 seconds
		domorph time = 0.2 scale = (12.0, 0.0) alpha = 0
		die
		case 4
		domorph time = 0 scale = 0 alpha = 0 pos = (700.0, 210.0)
		domorph time = 0.3
		domorph time = 0.1 scale = 1.0 alpha = 1 pos = (640.0, 210.0)
		wait 1.5 seconds
		domorph time = 0.2 scale = (12.0, 0.0) alpha = 0
		die
	endswitch
endscript

script play_horse_animation_final_1 
	domorph \{time = 0
		scale = 0
		alpha = 0
		pos = (640.0, 160.0)}
	domorph \{time = 0.3
		scale = 1.0
		alpha = 1
		pos = (640.0, 165.0)}
	domorph \{time = 0.1
		pos = (640.0, 160.0)}
	wait \{1.5
		seconds}
	domorph \{time = 0.2
		scale = (12.0, 0.0)
		alpha = 0
		pos = (640.0, 500.0)}
	die
endscript

script play_horse_animation_final_2 
	domorph time = 0 scale = 0 alpha = 0 pos = (640.0, 220.0)
	domorph time = 0.2 scale = 1.0 alpha = 1 pos = (640.0, 215.0)
	domorph time = 0.1 pos = (640.0, 210.0)
	domorph time = 0.22 scale = 1.0
	domorph time = 0.23 scale = 1.0
	domorph time = 0.32000002 scale = 1.0
	wait 1 second
	setprops blur_effect
	do_blur_effect
	setprops no_blur_effect
	domorph time = 0.2 scale = (12.0, 0.0) alpha = 0
	die
endscript


script scavengerhuntoneobjectleftother 
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script scavengerhuntoneobjectleftyou 
endscript

script scavengerhuntfiveobjectsleftother 
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script scavengerhuntfiveobjectsleftyou 
endscript

script scavengerhuntoneobjectleftotherteam 
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script scavengerhuntfiveobjectsleftotherteam 
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script newscoreleaderyou 
	if innetgame
		soundevent \{event = Online_Generic_You_Took_The_Lead_SFX}
		create_net_panel_message \{text = "You have taken the lead!"
			style = net_team_panel_message}
	endif
endscript

script newscoreleaderother 
	if innetgame
		soundevent \{event = Online_Generic_Other_Took_Lead_From_You_SFX}
		formattext textname = msg_text "%s has taken the lead!" s = <string0>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endif
endscript

script eliminatednone 
	create_net_panel_message \{text = "No one was eliminated this round!"
		style = net_team_panel_message}
endscript

script eliminatedyou 
	if innetgame
		pause_trick_text
		create_net_panel_message \{text = "You have been eliminated!"
			style = net_team_panel_message
			pos = (300.0, 50.0)
			final_pos = (300.0, 50.0)}
		EnterSurveyorMode
		soundevent \{event = Online_Walls_Someone_Took_You_Out_SFX}
		if NOT OnServer
			if gamemodeequals \{is_elimiskate}
				CheckForElimiskateGameOver
			endif
		endif
	endif
endscript

script eliminatedother 
	if innetgame
		soundevent \{event = Online_Walls_You_Took_Someone_Out_SFX}
		formattext textname = msg_text "%s has been eliminated!" s = <string0>
		create_net_panel_message text = <msg_text> style = net_team_panel_message pos = (300.0, 50.0) final_pos = (300.0, 50.0)
		if NOT OnServer
			if gamemodeequals \{is_elimiskate}
				CheckForElimiskateGameOver
			endif
		endif
	endif
endscript

script newkingother 
	if innetgame
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	else
		soundevent \{event = net_new_king_other_sfx}
	endif
endscript

script newgoldownerother 
	if innetgame
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	else
		soundevent \{event = net_new_gold_owner_other_sfx}
	endif
endscript

script newkingyou 
	if innetgame
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	else
		soundevent \{event = net_new_king_you_sfx}
	endif
endscript

script newgoldowneryou 
	if innetgame
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	else
		soundevent \{event = net_new_gold_owner_you_sfx}
	endif
endscript

script newscoreleaderyourteam 
	if innetgame
		soundevent \{event = Online_Generic_You_Took_The_Lead_SFX}
		create_net_panel_message \{text = "Your team has taken the lead!"
			style = net_team_panel_message}
	endif
endscript

script newscoreleaderotherteam 
	if innetgame
		soundevent \{event = Online_Generic_Other_Took_Lead_From_You_SFX}
		formattext textname = msg_text "Team %s has taken the lead!" s = <string0>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endif
endscript

script timer_runout_beep 
	if gotparam \{beep_sound}
		soundevent event = <beep_sound>
	else
		soundevent \{event = netmessage_timer_runout_beep_sfx}
	endif
endscript

script graffitistealyou 
	if innetgame
		soundevent \{event = Online_Walls_Someone_Took_You_Out_SFX}
		formattext textname = msg_text "You stole from %s!" s = <string0>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endif
endscript

script graffitistealother 
	if innetgame
		soundevent \{event = Online_Walls_You_Took_Someone_Out_SFX}
		formattext textname = msg_text "%s stole from you!" s = <string0>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endif
endscript

script skatercollidebail 
	TurnSparksOff
	stopbalancetrick
	inbail
	soundevent event = netmessage_skater_Collide_bail_sfx
	printf "SkaterCollideBail 1"
	if innetgame
		if NOT gamemodeequals is_ctf
			formattext textname = msg_text s = <string0> Random (
				@ "You got smacked by %s"
				@ "%s just laid the smack down on you"
				@ "Brought to you by %s"
				@ "%s gets his revenge"
				@ "%s shows you to the kiddie park"
				@ "%s kicked you in the junk"
				@ "Might want to clean %s's shoe prints off your face"
				@ "Are you gonna let %s get away with that?"
				@ "%s grinds your face"
				@ "%s escorts you to the floor"
				@ "You got worked by %s"
				@ "Today's beat-down,\\ncourtesy of %s"
				@ "%s offers you lovely parting gifts"
				@ "%s makes an example of you"
				@ "%s didn't really mean to do that"
				@ "%s let you have it"
				@ "%s adds insult to injury"
				@ "%s brought the pain"
				@ "%s levels you"
				@ "%s knocks some sense into you"
				@ "You have been shown the door\\nby %s"
				@ "%s schooled you"
				@ "Chalk another one up for %s"
				@ "%s brutalized you"
				@ "%s is never soft"
				@ "%s just kicked your nads"
				@ "This smack brought to you by %s and the friendly people at Neversoft"
				@ "You were OWN3D by %s"
				)
			create_net_panel_message text = <msg_text> generic_net_panel_message
		endif
	endif
	printf "SkaterCollideBail 2"
	if InSlapGame
		BailSkaterTricks
		MoveToRandomRestart
	endif
	obj_getvelocity
	getspeed
	new_speed = (<speed> * 0.5)
	if (<new_speed> > 10.0)
		new_speed = 10.0
	endif
	if ragdoll_isactive
		return
	endif
	setspeed <new_speed>
	normalizevector <vel>
	ragdoll_setvelocity vel = (<norm> * <new_speed>)
	ForcedBail allow_quick_exit
endscript

script madeotherskaterbail 
	if innetgame
		if NOT gamemodeequals is_ctf
			formattext textname = msg_text s = <string0> Random (
				@*4 "You smacked %s"
				@ "You punked %s"
				@ "You shanked %s"
				@ "You just K.O.'d %s"
				@ "You read %s his last rights"
				@ "You dropped %s like a bad habit"
				@ "You made %s lick the floor"
				@ "You are %s's daddy"
				@ "%s got a taste of j00r 1337 $xi11z"
				@ "%s is a n00b"
				@ "%s just ran cryin' to mommy"
				@ "%s doesn't like to play that rough"
				@ "You just opened %s's eyes to a whole new world"
				)
			create_net_panel_message text = <msg_text> style = net_team_panel_message_long
		endif
	endif
	OnGroundExceptions NoEndRun
	setqueuetricks Jumptricks GroundTricks
	settrickname "Head Smack"
	settrickscore 2000
	display blockspin
	soundevent event = netmessage_head_smack_sfx
	WaitAnimWhilstChecking AndManuals
	landskatertricks
	goto ongroundai
endscript

script MadeOtherSkaterBailAir 
	settrickname "Head Smack"
	settrickscore 2000
	display blockspin
	if innetgame
		if NOT gamemodeequals is_ctf
			formattext textname = msg_text "Airborne face smack to %s!" s = <string0>
			create_net_panel_message text = <msg_text> style = net_team_panel_message
		endif
	endif
	if doingtrick
	else
		InAirExceptions
		soundevent event = netmessage_head_smack_sfx
		WaitAnimWhilstChecking
		goto Airborne
	endif
endscript

script MadeOtherSkaterBail_Called 
	settrickname \{"Head Smack"}
	settrickscore \{2000}
	display \{blockspin}
	if innetgame
		if NOT gamemodeequals \{is_ctf}
			formattext textname = msg_text "Face smack to %s!" s = <string0>
			create_net_panel_message text = <msg_text> style = net_team_panel_message
		endif
	endif
endscript

script MadeOtherSkaterBailWalk 
	if skater :currentscorepotlessthan 1
		LandStraightAway = 1
	endif
	settrickname "Sucker Punch"
	settrickscore 2000
	display blockspin
	if gotparam LandStraightAway
		landskatertricks
	endif
	if innetgame
		if NOT gamemodeequals is_ctf
			formattext textname = msg_text "You sucker punched %s!" s = <string0>
			create_net_panel_message text = <msg_text> style = net_team_panel_message
		endif
	endif
	if walk_ground
		goto GroundPunchState
	else
		if walk_air
			goto AirPunchState
		endif
	endif
endscript

script netidle 
endscript

script chooseteammessage 
	create_net_panel_message \{text = "Teams have been created.\\nChoose a team by grabbing its flag."
		style = generic_net_panel_message}
endscript

script createteammessage 
	create_net_panel_message \{text = "Teams have been created."
		style = generic_net_panel_message}
endscript

script server_enter_free_skate 
	if OnServer
		printf \{"--- server_enter_free_skate LoadPendingPlayers"}
		loadpendingplayers
	endif
	if OnServer
		if NetRoundFunc \{func = in_round_mode}
			net_round_do_round_end_logic
		else
			if ($just_finished_net_game = 1)
				change \{just_finished_net_game = 0}
			endif
		endif
	endif
endscript

script client_enter_free_skate 
	if NOT isobserving
		create_net_panel_message \{text = "Entering Free Skate."
			style = generic_net_panel_message}
	endif
	if NetRoundFunc \{func = in_round_mode}
		if NetRoundFunc \{func = has_active_game}
			NetRoundFunc \{func = dump_round_scores}
		endif
	endif
endscript
netmessageprops = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(50.0, 80.0, 128.0)
			alpha = 128
		}
		{
			(128.0, 128.0, 128.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 250.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
netstatusprops = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(128.0, 128.0, 128.0)
			alpha = 128
		}
		{
			(50.0, 80.0, 128.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 285.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
netexceptionprops = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(128.0, 128.0, 128.0)
			alpha = 128
		}
		{
			(50.0, 80.0, 128.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 305.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
chat1props = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(50.0, 80.0, 128.0)
			alpha = 128
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(128.0, 128.0, 128.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 150.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
chat2props = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(50.0, 80.0, 128.0)
			alpha = 128
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(128.0, 128.0, 128.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 170.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
chat3props = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(50.0, 80.0, 128.0)
			alpha = 128
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(128.0, 128.0, 128.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 190.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
chat4props = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(50.0, 80.0, 128.0)
			alpha = 128
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(128.0, 128.0, 128.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 210.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
chat5props = {
	font = 'small.fnt'
	just = (0.0, 0.0)
	dims = (600.0, 112.0)
	colors = [
		{
			(50.0, 80.0, 128.0)
			alpha = 128
		}
		{
			(180.0, 160.0, 0.0)
			alpha = 75
		}
		{
			(110.0, 50.0, 50.0)
			alpha = 75
		}
		{
			(128.0, 128.0, 128.0)
			alpha = 75
		}
	]
	key_points = [
		{
			pos = (320.0, 230.0)
			alpha = 0
			scale = 0.2
			time = 0
		}
		{
			alpha = 128
			scale = 1.01
			time = 0.09
		}
		{
			alpha = 128
			scale = 1.01
			time = 5
		}
		{
			alpha = 0
			scale = 0.2
			time = 5.09
		}
	]
}
net_error_msg = "ERROR!"
net_notice_msg = "NOTICE"
net_status_msg = "STATUS"
net_refused_msg = "REFUSED"
net_warning_msg = "WARNING!"
net_question_are_you_sure = "ARE YOU SURE?"
net_answer_yes = "YES"
net_answer_no = "NO"
net_answer_ok = "OK"
net_friends_block_requests = "Block Requests"
net_friends_block = "Permanently Block"
net_friend_status_friend = "Friend"
net_friend_status_offline = "Offline"
net_friend_status_online = "Online in"
net_friend_status_available = "Available in "
net_friend_status_playing = "Playing in "
net_friend_status_wants_to_play = "Wants to play "
net_friend_status_invited_to_play = "Invited to play"
net_friend_status_wants_friendship = "Wants to be your friend"
net_friend_status_you_want_friend = "You asked to be your friend"
net_friend_status_voice_muted = "Voice: Muted"
net_friend_status_voice_on = "Voice: On"
net_friend_status_voice_tv = "Voice through TV"
net_title_up = "(UP)"
net_title_down = "(DOWN)"
net_title_remove = "Remove "
net_error_device_not_hot = "The network cable is not connected. Please check your network cables and try again."
net_error_not_connected = "Could not access the external network device. Please check all connections and reconnect."
net_error_not_detected = "Supported network hardware is not correctly connected to the PLAYSTATION®3 system."
net_error_dhcp_error = "Could not access the external network device. Please check all connections and reconnect."
net_error_changed_device = "You have changed network device settings and must restart your system for this change to take effect."
net_error_general_error = "Your network device is not configured properly or may not be properly connected. See the THP8 manual for troubleshooting."
net_error_cant_change_device = "You must restart your system before changing this option."
net_error_cant_load_settings = "To change the hardware used by Your Network Configuration, you must restart the game."
net_error_unplugged = "Your network connection has been disconnected. To continue playing online, please reconnect it."
net_error_unplugged_front_end = "Your network connection has been disconnected. Select Ok to return to the main menu."
net_error_unplugged_ps2 = "Could not access the external network device. Please check all connections and reconnect."
net_error_unplugged_front_end_ps2 = "Could not access the external network device. Please check all connections and reconnect."
net_reason_full_observers = "The host will not allow any more observers at this time."
net_reason_banned = "You have been banned from this session."
net_reason_full = "This session is full."
net_reason_version = "Incompatible version."
net_reason_rank_limit_high = "Your player ranking is too high to enter this game."
net_reason_rank_limit_low = "Your player ranking is too low to enter this game."
net_reason_general = "Connection refused."
net_reason_default = "Connection failed. Please try again"
net_message_goals_next_level = "These new goals will not be playable until you change level to a new level, or reload this level."
net_message_game_in_progress = "Sorry, this game has already started"
net_message_game_in_progress_refused = "This game is in progress.  You must wait until it finishes to join."
net_message_waiting_for_players = "Waiting for some players to fully load... Would you like to wait for them?"
net_message_server_removed_you = "The host has chosen to remove you from this game. Press \\m0 to return to the main menu."
net_message_server_moved_on = "The host has started the game without you. Press \\m0 to return to the main menu."
net_message_waiting = "Waiting for communication from the host..."
net_message_no_servers_found = "No Servers Found"
net_message_new_player = "%s0 is joining the game"
net_message_changing_levels = "Get Ready! Changing levels to %s0...."
net_message_game_will_start = "The game will start when all players are fully-loaded."
net_message_join_pending = "%s0 is waiting to join."
net_message_observing = "%s0 is now observing the game."
net_message_joining = "%s0 is joining the game."
net_message_starting_game = "Get Ready!\\nStarting a new game..."
net_message_auto_starting_game = "Get Ready!\\nAuto-Server starting a new game..."
net_message_server_cheating = "Warning! The host has enabled cheat codes!"
net_message_flag_base_warning = "To score, your team must first retrieve your flag!"
net_message_player_quit = "%s0 has left the game."
net_message_player_timed_out = "%s0 has timed out."
net_message_player_now_observing = "%s0 has chosen to observe."
net_message_player_kicked = "The host has removed %s0 from the game."
net_message_player_banned = "The host has banned %s0 from the game."
net_message_player_left_out = "The host has dropped %s0 from the game."
net_message_player_dropped = "%s0 had a bad connection and was dropped."
net_status_please_wait = "Please Wait..."
net_status_locating = "Connecting to host. Please wait..."
net_status_connecting = "Connecting to game"
net_status_joining = "Joining game...."
net_status_lost_connection = "You have lost connection to the host. Press X to return to main menu."
net_status_server_quit = "The host has quit. Press X to return to main menu."
net_status_join_timeout = "This game session is no longer available."
net_status_join_failed = "Failed to join game.  Refresh your game list and try again."
net_status_getting_lobbies = "Getting lobby list...."
net_status_live_lost_connection = "You have lost connection to Xbox LIVE."
net_status_live_lost_connection_non_xbox = "You have lost your online connection."
net_status_live_lost_connection_dupe = "You were signed out of Xbox LIVE because another person signed in using your account."
net_status_not_available = "THP8 online play is temporarily unavailable. Please try again later."
net_status_never_available = "THP8 online play is no longer available."
net_status_buddy_login_failed = "Failed to connect to server."
net_status_stats_login_failed = "Failed to connect to stats server."
net_status_stats_retrieval_failed = "Failed to retrieve stats."
net_status_testing_settings = "Connecting to network..."
net_status_nat_neg_failed = "Failed to connect to host. Refresh your game list and try again."
lobby_status_joined = "joined the room"
lobby_status_left = "left the room"
score_title_trick_attack = "Score"
score_title_graffiti = "Tags"
score_title_king = "Time"
score_title_slap = "Slaps"
net_lobby_full = "FULL"
sort_title_list = "Server List"
sort_title_name = "Name"
sort_title_ping = "Ping"
sort_title_players = "Players"
sort_title_observers = "Observers"
sort_title_mode = "Mode"
sort_title_level = "Level"
sort_title_skill = "Skill"
sort_title_ranked = "Ranked"
lobby_full_title = "Full"
net_lobby_chat_msg = "%s0"
team_1_name = "Red"
team_2_name = "Blue"
team_3_name = "Green"
team_4_name = "Yellow"
total_str = "Total"
category_all_levels = "All Levels"
manual_settings_str = "Manual Settings"
net_auth_footer_network = "Please double check your network connection and/or Your Network Configuration."
net_auth_footer_empty = ""
net_auth_header_network = "NETWORK ERROR"

script joined_team_you 
	printf \{"join team you"}
	formattext textname = msg_text "You have joined the %s team." s = <string0>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

script net_team_panel_message 
	soundevent event = netmessage_team_join_sfx
	domorph pos = (320.0, 204.0) scale = 0 time = 0 alpha = 0
	domorph pos = (320.0, 204.0) scale = 1.5 time = 0.1 alpha = 0.9
	domorph pos = (320.0, 204.0) scale = 0.7 time = 0.1
	domorph pos = (320.0, 204.0) scale = 1.1 time = 0.1
	domorph pos = (320.0, 204.0) scale = 0.9 time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph alpha = 0 time = 0.3
	die
endscript

script net_team_panel_message_long 
	soundevent event = netmessage_team_join_sfx
	domorph pos = (320.0, 204.0) scale = 0 time = 0 alpha = 0
	domorph pos = (320.0, 204.0) scale = 1.5 time = 0.1 alpha = 0.9
	domorph pos = (320.0, 204.0) scale = 0.7 time = 0.1
	domorph pos = (320.0, 204.0) scale = 1.1 time = 0.1
	domorph pos = (320.0, 204.0) scale = 0.9 time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph alpha = 0 time = 0.3
	die
endscript

script generic_net_panel_message 
	domorph pos = (320.0, 204.0) scale = 0 time = 0 alpha = 0
	domorph pos = (320.0, 204.0) scale = 1.5 time = 0.1 alpha = 0.9
	domorph pos = (320.0, 204.0) scale = 0.7 time = 0.1
	domorph pos = (320.0, 204.0) scale = 1.1 time = 0.1
	domorph pos = (320.0, 204.0) scale = 0.9 time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 201.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (324.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 207.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (317.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph pos = (319.0, 203.0) time = 0.1
	domorph pos = (321.0, 205.0) time = 0.1
	domorph alpha = 0 time = 0.6
	die
endscript

script joined_team_other 
	formattext textname = msg_text "%s has joined the %w team." s = <string0> w = <string1>
	create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript

SentObjectPlacements = 0
SentStartMessage = 0
goal_scavenger_genericParams = {
	goal_text = "Collect All Objects to Win!"
	time = 10
	net
	goal_type_checksum = net
	dont_deactivate_upon_expiration
	game_continues_after_expiration
	init = goal_scavenger_init
	active = goal_scavenger_active
	activate = goal_scavenger_activate
	deactivate = goal_scavenger_deactivate
	expire = goal_scavenger_expire
	goal_description = "Scavenger Hunt!"
}

script goal_scavenger_init 
endscript

script goal_scavenger_active 
endscript

script goal_scavenger_activate 
	change SentObjectPlacements = 0
	change SentStartMessage = 0
	formattext textname = msg_text "\\c2Scavenger Hunt:\\c0\\n\\b7 + \\b1 to place objects!"
	msg_pos = (620.0, 27.0)
	if insplitscreengame
		ScriptGetScreenMode
		if (<screen_mode> = split_vertical)
			msg_pos = (420.0, 44.0)
		else
			msg_pos = (640.0, 204.0)
		endif
	endif
	if objectexists id = mp_goal_text
		destroyscreenelement id = mp_goal_text
	endif
	create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle dims = (300.0, 0.0)
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			unhide
		}
	endif
	runscriptonscreenelement id = the_time clock_morph
	if NOT isobserving
		bind_scavenger_tricks
	endif
	if insplitscreengame
		bind_scavenger_tricks_player_2
	endif
endscript

script goal_scavenger_deactivate 
	if NOT gman_goalisactive \{goal = scavenger_collect_period}
		if NOT gman_goalisactive \{goal = scavenger_interval}
			if objectexists \{id = mp_goal_text}
				destroyscreenelement \{id = mp_goal_text}
			endif
		endif
	endif
	if NOT isobserving
		unbind_scavenger_tricks
	endif
	if insplitscreengame
		unbind_scavenger_tricks_player_2
	endif
endscript

script goal_scavenger_add_time 
	create_net_panel_message \{text = "You must place at least one object!"
		style = net_team_panel_message
		msg_time = 3000}
	GoalManager_AddTime \{name = scavenger
		15}
endscript

script goal_scavenger_expire 
	if AtLeastOneObjectPlaced
		GoalManager_DeactivateGoal \{name = scavenger}
		if OnServer
			startgoal_scavenger_interval \{time = 6}
		else
			startgoal_scavenger_interval \{unlimited_time}
		endif
	else
		if OnServer
			AnnounceNeedToPlaceObjects
		endif
	endif
endscript

script AddGoal_Scavenger 
	GoalManager_AddGoal \{name = scavenger
		params = {
			goal_scavenger_genericParams
		}}
endscript

script StartGoal_Scavenger 
	GoalManager_EditGoal name = scavenger params = <...>
	GoalManager_ActivateGoal \{name = scavenger}
	GoalManager_SetGoalTimer \{name = scavenger}
endscript
goal_scavenger_collect_genericParams = {
	goal_text = ""
	time = 60
	net
	goal_type_checksum = net
	init = goal_scavenger_collect_init
	activate = goal_scavenger_collect_activate
	deactivate = goal_scavenger_collect_deactivate
	expire = goal_scavenger_collect_expire
	goal_description = ""
}

script goal_scavenger_collect_init 
endscript

script goal_scavenger_collect_active 
endscript

script goal_scavenger_collect_activate 
	if gman_goalisactive goal = scavenger_interval
		GoalManager_DeactivateGoal name = scavenger_interval
	endif
	resetskaters
	show_all_objects
	formattext textname = msg_text "\\c2Scavenger Hunt:\\c0\\nCollect objects!"
	msg_pos = (620.0, 27.0)
	if insplitscreengame
		ScriptGetScreenMode
		if (<screen_mode> = split_vertical)
			msg_pos = (400.0, 44.0)
		else
			msg_pos = (640.0, 204.0)
		endif
	endif
	if objectexists id = mp_goal_text
		destroyscreenelement id = mp_goal_text
	endif
	create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			unhide
		}
	endif
	runscriptonscreenelement id = the_time clock_morph
endscript

script goal_scavenger_collect_deactivate 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
endscript

script goal_scavenger_finished 
	if objectexists \{id = mp_goal_text}
		destroyscreenelement \{id = mp_goal_text}
	endif
	spawnscriptlater \{wait_then_create_rankings}
endscript

script goal_scavenger_collect_expire 
	goal_scavenger_finished
endscript
goal_scavenger_interval_genericParams = {
	goal_text = ""
	time = 6
	net
	goal_type_checksum = net
	init = goal_scavenger_interval_init
	activate = goal_scavenger_interval_activate
	deactivate = goal_scavenger_interval_deactivate
	expire = goal_scavenger_interval_expire
	active = goal_scavenger_interval_active
	goal_description = ""
	game_continues_after_expiration
}

script goal_scavenger_interval_init 
endscript

script goal_scavenger_interval_active 
	if NOT insplitscreengame
		if OnServer
			GoalManager_GetTimeLeftInNetGame
			if NOT istrue \{$SentObjectPlacements}
				if gotparam \{time_left}
					if (<time_left> < 3000)
						BroadcastObjectPlacements
						change \{SentObjectPlacements = 1}
					endif
				endif
			endif
			if NOT istrue \{$SentStartMessage}
				if gotparam \{time_left}
					if (<time_left> < 500)
						AnnounceHuntStarted
						change \{SentStartMessage = 1}
					endif
				endif
			endif
		endif
	endif
endscript

script goal_scavenger_interval_activate 
	if screenelementexists id = the_time
		setscreenelementprops {
			id = the_time
			hide
		}
	endif
	if objectexists id = mp_goal_text
		destroyscreenelement id = mp_goal_text
	endif
	formattext textname = msg_text "\\c2Scavenger Hunt:\\c0\\nGet Ready...!"
	if insplitscreengame
		ScriptGetScreenMode
		if (<screen_mode> = split_vertical)
			msg_pos = (400.0, 44.0)
		else
			msg_pos = (640.0, 204.0)
		endif
	endif
	create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle
endscript

script goal_scavenger_interval_deactivate 
	if screenelementexists \{id = the_time}
		setscreenelementprops \{id = the_time
			unhide}
	endif
	if NOT gman_goalisactive \{goal = scavenger}
		if NOT gman_goalisactive \{goal = scavenger_collect_period}
			if objectexists \{id = mp_goal_text}
				destroyscreenelement \{id = mp_goal_text}
			endif
		endif
	endif
endscript

script goal_scavenger_interval_expire 
	startgoal_scavenger_collect
endscript

script AddGoal_Scavenger_Interval 
	GoalManager_AddGoal \{name = scavenger_interval
		params = {
			goal_scavenger_interval_genericParams
		}}
endscript

script startgoal_scavenger_interval 
	GoalManager_EditGoal name = scavenger_interval params = <...>
	GoalManager_ActivateGoal \{name = scavenger_interval}
endscript

script AddGoal_Scavenger_Collect 
	GoalManager_AddGoal \{name = scavenger_collect_period
		params = {
			goal_scavenger_collect_genericParams
		}}
endscript

script ForceStartScavengerCollect 
	if gman_goalisactive \{goal = scavenger}
		gman_deactivategoal \{name = scavenger}
	endif
	if gman_goalisactive \{goal = scavenger_interval}
		gman_deactivategoal \{name = scavenger_interval}
	endif
	startgoal_scavenger_collect
endscript

script startgoal_scavenger_collect 
	GetTimeLimit
	GoalManager_EditGoal name = scavenger_collect_period params = {time = <time_limit>}
	GoalManager_ActivateGoal \{name = scavenger_collect_period}
endscript

script ScavengerHunt_GotObject 
	ReportObjectPickup <...>
	soundevent \{event = scavenger_hunt_done_sfx}
	<id> :die
endscript

script scavengerhunt_killobject 
	if objectexists id = <id>
		<id> :die
	endif
endscript

script ScavengerHunt_GotObject2P 
	<id> :gettags
	if gotparam \{player_retrieved}
		if (<player_retrieved> = <colobjid>)
		else
			ReportObjectPickup <...>
			soundevent \{event = scavenger_hunt_got_object_sfx}
			<id> :die
		endif
	else
		ReportObjectPickup <...>
		soundevent \{event = scavenger_hunt_got_object_sfx}
		<id> :settags player_retrieved = <colobjid>
		if (<intid> = 0)
			obj_clearvisibility \{viewport = 0}
		else
			obj_clearvisibility \{viewport = 1}
		endif
	endif
endscript

script ScavengerHunt_InitObjectExceptions 
	cleareventhandlergroup \{`default`}
	obj_setinnerradius \{8}
	if insplitscreengame
		seteventhandler {
			event = anyobjectinradius
			scr = ScavengerHunt_GotObject2P
			response = switch_script
			params = {id = <id>}
		}
	else
		seteventhandler {
			event = objectinradius
			scr = ScavengerHunt_GotObject
			response = switch_script
			params = {id = <id>}
		}
	endif
endscript

script ScavengerHunt_InitObject 
	if insplitscreengame
		obj_clearvisibility \{viewport = 0}
		obj_clearvisibility \{viewport = 1}
	endif
	obj_invisible
	obj_roty \{speed = 200}
	obj_hover \{amp = 6
		freq = 2}
endscript

script ScavengerHunt_ShowObject 
	obj_visible
	if insplitscreengame
		obj_setvisibility \{viewport = 0}
		obj_setvisibility \{viewport = 1}
	endif
endscript

script dropshobject 
	formattext checksumname = id 'sh_object_%i_%j' i = <objid> j = <index>
	createcompositeobject {
		components = sh_object_composite_structure
		params = {name = <id>
			pos = <pos>
			neversuspend
			model = 'GameObjects\\scavenger_coin\\scavenger_coin.mdl'
		}
	}
	if InTeamGame
		GetPlayersTeam objid = <objid>
		switch <team>
			case 0
			<id> :obj_setcolorrgb r = 102 g = 26 b = 8
			case 1
			<id> :obj_setcolorrgb r = 17 g = 64 b = 116
			case 2
			<id> :obj_setcolorrgb r = 9 g = 107 b = 36
			case 3
			<id> :obj_setcolorrgb r = 123 g = 99 b = 3
		endswitch
	else
		switch <objid>
			case 0
			<id> :obj_setcolorrgb r = 102 g = 26 b = 8
			case 1
			<id> :obj_setcolorrgb r = 17 g = 64 b = 116
			case 2
			<id> :obj_setcolorrgb r = 9 g = 107 b = 36
			case 3
			<id> :obj_setcolorrgb r = 123 g = 99 b = 3
			case 4
			<id> :obj_setcolorrgb r = 0 g = 128 b = 128
			case 5
			<id> :obj_setcolorrgb r = 128 g = 0 b = 128
			case 6
			<id> :obj_setcolorrgb r = 80 g = 80 b = 116
			case 7
			<id> :obj_setcolorrgb r = 80 g = 105 b = 112
		endswitch
	endif
	runscriptonobject {
		id = <id>
		ScavengerHunt_InitObject
		params = {id = <id>}
	}
	if gotparam show_now
		runscriptonobject {
			id = <id>
			ScavengerHunt_ShowObject
			params = {id = <id>}
		}
	endif
endscript

script clientdropshobject 
	if NOT gamemodeequals is_scavenger_hunt
		return
	endif
	GetCurrentSkaterId
	GetSkaterPosition skater = <intid>
	new_y = (<y> + 24)
	<y> = <new_y>
	new_pos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	PlaceObject pos = <new_pos>
	ReportObjectPlacement objid = <objid> pos = <new_pos>
	if innetgame
		dropshobject pos = <new_pos> objid = <intid> index = <index> show_now
	else
		dropshobject pos = <new_pos> objid = <intid> index = <index>
	endif
	if NOT PlacedLessThan 5
		if objectexists id = mp_goal_text
			destroyscreenelement id = mp_goal_text
		endif
		formattext textname = msg_text "\\c2Scavenger Hunt:\\c0\\nWaiting for other players!"
		if insplitscreengame
			ScriptGetScreenMode
			if (<screen_mode> = split_vertical)
				msg_pos = (400.0, 44.0)
			else
				msg_pos = (640.0, 204.0)
			endif
		endif
		create_panel_block parent = root_window id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos> font_face = testtitle
		if insplitscreengame
			GetCurrentSkaterId
			if (<intid> = 0)
				unbind_scavenger_tricks
			else
				unbind_scavenger_tricks_player_2
			endif
		else
			unbind_scavenger_tricks
		endif
	endif
endscript
sh_object_composite_structure = [
	{
		component = motion
	}
	{
		component = model
	}
	{
		component = objectproximity
	}
]

script bind_scavenger_tricks 
	skater :removetags \{[
			old_scavengerf_checksum
		]}
	GetTrickFromKeyCombo \{key_combo = Air_SquareU}
	skater :settags old_scavengerf_checksum = <trick_checksum>
	BindTrickToKeyCombo \{key_combo = Air_SquareU
		trick = ScavengerF
		update_mappings = 1}
	UpdateTrickMappings \{skater = 0}
endscript

script bind_scavenger_tricks_player_2 
	setcurrentskaterprofile \{1}
	skater2 :removetags \{[
			old_scavengerf_checksum
		]}
	GetTrickFromKeyCombo \{key_combo = Air_SquareU}
	skater2 :settags old_scavengerf_checksum = <trick_checksum>
	BindTrickToKeyCombo \{key_combo = Air_SquareU
		trick = ScavengerF
		update_mappings = 1}
	UpdateTrickMappings \{skater = 1}
	setcurrentskaterprofile \{0}
endscript

script unbind_scavenger_tricks 
	skater :gettags
	if gotparam \{old_scavengerf_checksum}
		BindTrickToKeyCombo {
			key_combo = Air_SquareU
			trick = <old_scavengerf_checksum>
			update_mappings = 1
		}
	endif
	UpdateTrickMappings \{skater = 0}
	skater :removetags \{[
			old_scavengerf_checksum
		]}
endscript

script unbind_scavenger_tricks_player_2 
	setcurrentskaterprofile \{1}
	skater2 :gettags
	if gotparam \{old_scavengerf_checksum}
		BindTrickToKeyCombo {
			key_combo = Air_SquareU
			trick = <old_scavengerf_checksum>
			update_mappings = 1
		}
	endif
	UpdateTrickMappings \{skater = 1}
	skater2 :removetags \{[
			old_scavengerf_checksum
		]}
	setcurrentskaterprofile \{0}
endscript

script show_all_objects 
	objid = 0
	begin
	index = 0
	begin
	formattext checksumname = name 'sh_object_%i_%j' i = <objid> j = <index>
	if objectexists id = <name>
		runscriptonobject {
			id = <name>
			ScavengerHunt_ShowObject
			params = {id = <name>}
		}
		runscriptonobject {
			id = <name>
			ScavengerHunt_InitObjectExceptions
			params = {id = <name>}
		}
	endif
	index = (<index> + 1)
	if (<index> = 5)
		break
	endif
	repeat
	objid = (<objid> + 1)
	if (<objid> = 8)
		break
	endif
	repeat
endscript

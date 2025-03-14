
script skater_stuck_script 
	printf \{"skater_stuck_script"}
	respotskater
endscript

script Sk_KillSkater_with_rollout \{rollouttime = 3.0}
	goal_rollout_skater time = <rollouttime>
	Sk_Killskater <...>
endscript

script Sk_Killskater 
	if insplitscreengame
		GetSkaterNumber
		switch <skaternumber>
			case 0
			parent = player1_panel_container
			case 1
			parent = player2_panel_container
		endswitch
	endif
	if obj_flagnotset $FLAG_SKATER_KILLING
		obj_setflag $FLAG_SKATER_KILLING
		inbail
		if gotparam water
			soundevent event = sk8_watersplash_sfx
		else
			soundevent event = sk3_sfx_death_sound
		endif
		if NOT gotparam NoMessage
			if NOT getglobalflag flag = $no_display_hud
				if gotparam message1
					if gotparam message4
						text = Random (
							@ <message1>
							@ <message2>
							@ <message3>
							@ <message4>
							)
					elseif gotparam message3
						text = Random (
							@ <message1>
							@ <message2>
							@ <message3>
							)
					elseif gotparam message2
						text = Random (
							@ <message1>
							@ <message2>
							)
					else
						text = <message1>
					endif
					create_panel_message {
						style = panel_message_death
						id = death_message
						parent = <parent>
						text = <text>
					}
				else
					if gotparam water
						create_panel_message {
							style = panel_message_death
							id = death_message
							parent = <parent>
							type = spriteelement
							texture = watch
						}
					else
						create_panel_message {
							style = panel_message_death
							id = death_message
							parent = <parent>
							type = spriteelement
							texture = watch
						}
					endif
				endif
			endif
		endif
		if gotparam water
			Sk_Killskater_Finish water r = 100 g = 100 b = 200 <...>
		else
			Sk_Killskater_Finish <...>
		endif
	endif
endscript

script Sk_Killskater_Finish r = 110 g = 110 b = 110
	obj_getid
	launchevent type = KillingSkater target = <objid>
	disableplayerinput
	if gotparam bail
		is_skating_or_biking = 0
		if skating
			MakeSkaterGoto Killskater_Bail
		endif
	endif
	pulse_blur start = 0 end = 255 speed = 4
	clearpanel_bailed
	if gotparam nodename
		settags node_name = <nodename>
	endif
	if gotparam prefix
		settags node_prefix = <prefix>
	endif
	onexitrun Sk_Killskater_Finish2
	if gotparam water
		SkaterSplashOn
		pausephysics
		hide
		if NOT export_isrecording
			wait 0.5 seconds
		endif
	else
		if NOT export_isrecording
			wait 0.25 seconds
		endif
	endif
	onexitrun
	removetags [node_prefix node_name]
	Sk_Killskater_Finish3 <...>
endscript

script Sk_Killskater_Finish2 
	getsingletag \{node_prefix}
	getsingletag \{node_name}
	removetags \{[
			node_prefix
			node_name
		]}
	MakeSkaterGoto Sk_Killskater_Finish3 params = {nodename = (node_name) prefix = <node_prefix>}
endscript

script Sk_Killskater_Finish3 
	if ($is_changing_levels = 1)
		return
	endif
	ragdoll_rebuildragdoll
	baillerptoground 0
	ragdollbaildeactivate
	physicsbaildone
	ClearTrickQueues
	cancelrotatedisplay
	wait 1 gameframe
	BlendperiodOut 0
	cleareventbuffer
	BailSkaterTricks
	if export_isrecording
		printf "Sk_KillSkater: Export_IsRecording is true, ending record"
		change ve_recording_camera_hosed = Killed
		skater :RecordSkaterAnimStop forced
	endif
	killskater node = <nodename> prefix = <prefix>
	if innetgame
		if gamemodeequals is_goal_attack
			if NOT gameisover
				speech_box_exit
			endif
		endif
	else
		speech_box_exit
	endif
	obj_killspawnedscript name = ForceToWalk
	if isforcewalkon
		KillForceToWalk
	endif
	notinbail
	ResetSkaterParticleSystems
	pulse_blur start = 255 end = 0 speed = 4
	wait 0.75 seconds
	obj_clearflag $FLAG_SKATER_KILLING
	if ($cap_in_menu = 1)
		pauseskaters
	endif
endscript

script panel_message_death 
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case split_vertical
			off_set = (160.0, 20.0)
			case split_horizontal
			Panel_Message_Death_HSplit
			return
			default
			off_set = (0.0, 20.0)
		endswitch
	else
		off_set = (640.0, 20.0)
	endif
	domorph time = 0 scale = 1.1 pos = ((0.0, 0.0) + <off_set>) alpha = 1
	domorph time = 0.09 pos = ((0.0, 150.0) + <off_set>)
	domorph time = 0.08 pos = ((0.0, 380.0) + <off_set>)
	<red> = [180 50 50 255]
	<white> = [200 200 200 255]
	<magnitude> = 10
	<scale> = 0.5
	<wiggle> = (<magnitude> * 1.5)
	begin
	domorph pos = ((0.0, 360.0) + <off_set> + (<wiggle> * (0.0, 1.0))) time = 0.1 scale = <scale> rgba = <red>
	domorph pos = ((0.0, 360.0) + <off_set> - (<wiggle> * (0.0, 1.0))) time = 0.02 rgba = <white>
	<scale> = (<scale> + 0.05)
	<wiggle> = (<wiggle> * 0.8)
	repeat <magnitude>
	domorph alpha = 0 time = 0.2 pos = ((0.0, 360.0) + <off_set>) scale = (2.5, 0.0)
	die
endscript

script Panel_Message_Death_HSplit 
	domorph pos = (330.0, 150.0)
	<red> = [180 50 50 255]
	<white> = [200 200 200 255]
	<magnitude> = 10
	<scale> = 0.5
	<wiggle> = (<magnitude> * 1.5)
	begin
	domorph pos = {(<wiggle> * (0.0, 1.0)) relative} time = 0.1 scale = <scale> rgba = <red>
	domorph pos = {(<wiggle> * (0.0, -1.0)) relative} time = 0.02 rgba = <white>
	<scale> = (<scale> + 0.05)
	<wiggle> = (<wiggle> * 0.8)
	repeat <magnitude>
	die
endscript

script Killskater_Bail 
	skater_playanim \{anim = SK8_Bail_Spin_Fwd_F
		blendperiod = 0.3}
endscript

script TeleportSkaterToNode r = 255 g = 255 b = 255 do_effect = 1
	if gotparam message1
		LaunchPanelMessage properties = panel_message_death <message1>
	else
		if NOT gotparam no_message
			LaunchPanelMessage properties = panel_message_death "On the Move!"
		endif
	endif
	if compositeobjectexists cap_camera
		cap_finish
	endif
	getskaterheight
	printf "skater_height ===================== %f" f = <skater_height>
	if (<skater_height> > 1)
		<skater_height> = (<skater_height> + 0.25)
	endif
	if gotparam nodename
		node_or_pos = 1
	endif
	if gotparam pos
		node_or_pos = 1
	endif
	if gotparam node_or_pos
		printf "Got the nodename ...................."
		if skating
			if onrail
				cleareventbuffer
				cleartrickqueue
				killextratricks
				clearextragrindtrick
				stopbalancetrick
				if NOT isinbail
					MakeSkaterGoto groundgone
				endif
			endif
		endif
		if (<do_effect> = 1)
			pulse_blur start = 255 speed = 5
		endif
		if gotparam no_offset
			<skater_height> = 0
		endif
		if NOT gotparam reset
			NoReset = {NoReset}
		endif
		if gotparam nodename
			obj_movetonode name = <nodename> y_offset = <skater_height> <NoReset> orient
		else
			if gotparam quat
				obj_setorientation quat = <quat>
			endif
			obj_movetopos <pos>
		endif
		if ragdoll_isactive
			stars
			printf 'RAGDOLL TELEPORT'
			stars
			obj_getposition
			pos = (<pos> + (0.0, 1.0, 0.0))
			obj_setposition position = <pos>
			ragdoll_teleport
			if gotparam KillRagdoll
				PostBailDone SkaterInit
			endif
		endif
	else
		LaunchPanelMessage properties = panel_message_death "ERROR! Please pass in nodename="
	endif
	getcameraid
	if walking
		<cameraid> :walkcamera_reset
		if walk_hang
			walk_forcetoairfromhang
		endif
	else
		<cameraid> :sc_markinstantupdate
	endif
	input_debounce x time = 0.4
endscript

script PrepareSkaterForMove 
	if skating
		setstate \{air}
		stopbalancetrick
		MakeSkaterGoto \{groundgone}
		landskatertricks
		cleareventbuffer
	endif
endscript

script Team_Flag 
	obj_setinnerradius 0.5
	if gamemodeequals is_lobby
		printf "Creating team flag"
		seteventhandler event = objectinradius scr = Team_Flag_Trigger response = switch_script params = {<...>}
	else
		if gamemodeequals is_ctf
			printf "Creating CTF flag"
			if OnServer
				printf "Setting CTF flag exception : AnyObjectInRadius"
				seteventhandler event = anyobjectinradius scr = CTF_Team_Flag_Trigger response = switch_script params = {<...>}
			endif
		endif
	endif
endscript

script Team_Flag_Trigger 
	if NOT getpakmancurrentname map = zones
		script_assert "Team_Flag_Trigger called before zone map created"
	endif
	zone_name = <pakname>
	formattext checksumname = red_flag '%z_TRG_Flag_Red' z = <zone_name>
	formattext checksumname = blue_flag '%z_TRG_Flag_Blue' z = <zone_name>
	formattext checksumname = green_flag '%z_TRG_Flag_Green' z = <zone_name>
	formattext checksumname = yellow_flag '%z_TRG_Flag_Yellow' z = <zone_name>
	GetNumTeams
	if gotparam blue
		JoinTeam blue
		kill name = <red_flag>
		kill name = <green_flag>
		kill name = <yellow_flag>
		wait 2 frames
		create name = <red_flag>
		switch <num_teams>
			case 3
			create name = <green_flag>
			case 4
			create name = <green_flag>
			create name = <yellow_flag>
		endswitch
		die
	endif
	if gotparam red
		JoinTeam red
		kill name = <blue_flag>
		kill name = <green_flag>
		kill name = <yellow_flag>
		wait 2 frames
		create name = <blue_flag>
		switch <num_teams>
			case 3
			create name = <green_flag>
			case 4
			create name = <green_flag>
			create name = <yellow_flag>
		endswitch
		die
	endif
	if gotparam green
		JoinTeam green
		kill name = <blue_flag>
		kill name = <red_flag>
		kill name = <yellow_flag>
		wait 2 frames
		create name = <blue_flag>
		create name = <red_flag>
		switch <num_teams>
			case 4
			create name = <yellow_flag>
		endswitch
		die
	endif
	if gotparam yellow
		printf "hello"
		JoinTeam yellow
		kill name = <blue_flag>
		kill name = <red_flag>
		kill name = <green_flag>
		wait 2 frames
		create name = <blue_flag>
		create name = <red_flag>
		create name = <green_flag>
		die
	endif
endscript

script CTF_Team_Base_Trigger 
	if gotparam red
		GetCollidingPlayerAndTeam exclude_team = 0 radius = 10
		if (<player> = -1)
		else
			if (<team> = 0)
				if PlayerHasFlag <...>
					if TeamFlagTaken <...>
						DisplayFlagBaseWarning
					endif
				endif
			endif
		endif
	endif
	if gotparam blue
		GetCollidingPlayerAndTeam exclude_team = 1 radius = 10
		if (<player> = -1)
		else
			if (<team> = 1)
				if PlayerHasFlag <...>
					if TeamFlagTaken <...>
						DisplayFlagBaseWarning
					endif
				endif
			endif
		endif
	endif
	if gotparam green
		GetCollidingPlayerAndTeam exclude_team = 2 radius = 10
		if (<player> = -1)
		else
			if (<team> = 2)
				if PlayerHasFlag <...>
					if TeamFlagTaken <...>
						DisplayFlagBaseWarning
					endif
				endif
			endif
		endif
	endif
	if gotparam yellow
		GetCollidingPlayerAndTeam exclude_team = 3 radius = 10
		if (<player> = -1)
		else
			if (<team> = 3)
				if PlayerHasFlag <...>
					if TeamFlagTaken <...>
						DisplayFlagBaseWarning
					endif
				endif
			endif
		endif
	endif
endscript

script display_flag_base_warning 
	create_net_panel_message \{msg_time = 2000
		text = net_message_flag_base_warning}
endscript

script CTF_Team_Flag_Trigger 
	printf "*** In Exception Handler CTF_Team_Flag_Trigger"
	wait 1 gameframe
	if JustStartedNetGame
		printf "*** Leaving Exception Handler CTF_Team_Flag_Trigger because the game just started"
		return
	endif
	printf "*** Processing Exception Handler CTF_Team_Flag_Trigger"
	if gotparam red
		GetCollidingPlayerAndTeam exclude_team = 0 radius = 10
		if (<player> = -1)
		else
			if (<team> = 0)
				PlayerCapturedFlag flag_team = 0 <...>
			else
				PlayerTookFlag flag_team = 0 <...>
				cleareventhandlergroup `default`
			endif
		endif
	endif
	if gotparam blue
		GetCollidingPlayerAndTeam exclude_team = 1 radius = 10
		if (<player> = -1)
		else
			if (<team> = 1)
				PlayerCapturedFlag flag_team = 1 <...>
			else
				PlayerTookFlag flag_team = 1 <...>
				cleareventhandlergroup `default`
			endif
		endif
	endif
	if gotparam green
		GetCollidingPlayerAndTeam exclude_team = 2 radius = 10
		if (<player> = -1)
		else
			if (<team> = 2)
				PlayerCapturedFlag flag_team = 2 <...>
			else
				PlayerTookFlag flag_team = 2 <...>
				cleareventhandlergroup `default`
			endif
		endif
	endif
	if gotparam yellow
		GetCollidingPlayerAndTeam exclude_team = 3 radius = 10
		if (<player> = -1)
		else
			if (<team> = 3)
				PlayerCapturedFlag flag_team = 3 <...>
			else
				PlayerTookFlag flag_team = 3 <...>
				cleareventhandlergroup `default`
			endif
		endif
	endif
endscript

script kill_team_flags 
	if NOT getpakmancurrentname map = zones
		printf "Kill_Team_Flags failed to get current zone map"
		printstruct <...>
		return
	endif
	zone_name = <pakname>
	formattext checksumname = red_flag '%z_TRG_Flag_Red' z = <zone_name>
	if isinnodearray <red_flag>
		kill name = <red_flag>
	endif
	formattext checksumname = red_base '%z_TRG_Flag_Red_Base' z = <zone_name>
	if isinnodearray <red_base>
		kill name = <red_base>
	endif
	formattext checksumname = blue_flag '%z_TRG_Flag_Blue' z = <zone_name>
	if isinnodearray <blue_flag>
		kill name = <blue_flag>
	endif
	formattext checksumname = blue_base '%z_TRG_Flag_Blue_Base' z = <zone_name>
	if isinnodearray <blue_base>
		kill name = <blue_base>
	endif
	formattext checksumname = green_flag '%z_TRG_Flag_Green' z = <zone_name>
	if isinnodearray <green_flag>
		kill name = <green_flag>
	endif
	formattext checksumname = green_base '%z_TRG_Flag_Green_Base' z = <zone_name>
	if isinnodearray <green_base>
		kill name = <green_base>
	endif
	formattext checksumname = yellow_flag '%z_TRG_Flag_Yellow' z = <zone_name>
	if isinnodearray <yellow_flag>
		kill name = <yellow_flag>
	endif
	formattext checksumname = yellow_base '%z_TRG_Flag_Yellow_Base' z = <zone_name>
	if isinnodearray <yellow_base>
		kill name = <yellow_base>
	endif
	formattext checksumname = red_flag '%z_TRG_CTF_Red' z = <zone_name>
	if isinnodearray <red_flag>
		kill name = <red_flag>
	endif
	formattext checksumname = red_base '%z_TRG_CTF_Red_Base' z = <zone_name>
	if isinnodearray <red_base>
		kill name = <red_base>
	endif
	formattext checksumname = blue_flag '%z_TRG_CTF_Blue' z = <zone_name>
	if isinnodearray <blue_flag>
		kill name = <blue_flag>
	endif
	formattext checksumname = blue_base '%z_TRG_CTF_Blue_Base' z = <zone_name>
	if isinnodearray <blue_base>
		kill name = <blue_base>
	endif
	formattext checksumname = green_flag '%z_TRG_CTF_Green' z = <zone_name>
	if isinnodearray <green_flag>
		kill name = <green_flag>
	endif
	formattext checksumname = green_base '%z_TRG_CTF_Green_Base' z = <zone_name>
	if isinnodearray <green_base>
		kill name = <green_base>
	endif
	formattext checksumname = yellow_flag '%z_TRG_CTF_Yellow' z = <zone_name>
	if isinnodearray <yellow_flag>
		kill name = <yellow_flag>
	endif
	formattext checksumname = yellow_base '%z_TRG_CTF_Yellow_Base' z = <zone_name>
	if isinnodearray <yellow_base>
		kill name = <yellow_base>
	endif
endscript

script create_team_flags 
	if NOT getpakmancurrentname map = zones
		script_assert "Create_Team_Flags called before zone map created"
	endif
	zone_name = <pakname>
	if gamemodeequals is_lobby
		formattext checksumname = red_flag '%z_TRG_Flag_Red' z = <zone_name>
		if isinnodearray <red_flag>
			create name = <red_flag>
		endif
		formattext checksumname = red_base '%z_TRG_Flag_Red_Base' z = <zone_name>
		if isinnodearray <red_base>
			create name = <red_base>
		endif
		if (<num_teams> > 1)
			formattext checksumname = blue_flag '%z_TRG_Flag_Blue' z = <zone_name>
			if isinnodearray <blue_flag>
				create name = <blue_flag>
			endif
			formattext checksumname = blue_base '%z_TRG_Flag_Blue_Base' z = <zone_name>
			if isinnodearray <blue_base>
				create name = <blue_base>
			endif
		endif
		if (<num_teams> > 2)
			formattext checksumname = green_flag '%z_TRG_Flag_Green' z = <zone_name>
			if isinnodearray <green_flag>
				create name = <green_flag>
			endif
			formattext checksumname = green_base '%z_TRG_Flag_Green_Base' z = <zone_name>
			if isinnodearray <green_base>
				create name = <green_base>
			endif
		endif
		if (<num_teams> > 3)
			formattext checksumname = yellow_flag '%z_TRG_Flag_Yellow' z = <zone_name>
			if isinnodearray <yellow_flag>
				create name = <yellow_flag>
			endif
			formattext checksumname = yellow_base '%z_TRG_Flag_Yellow_Base' z = <zone_name>
			if isinnodearray <yellow_base>
				create name = <yellow_base>
			endif
		endif
	else
		GetNumPlayersOnTeam team = 0
		if (<num_members> > 0)
			formattext checksumname = red_flag '%z_TRG_CTF_Red' z = <zone_name>
			if isinnodearray <red_flag>
				create name = <red_flag>
			endif
			formattext checksumname = red_base '%z_TRG_CTF_Red_Base' z = <zone_name>
			if isinnodearray <red_base>
				create name = <red_base>
			endif
		endif
		GetNumPlayersOnTeam team = 1
		if (<num_members> > 0)
			formattext checksumname = blue_flag '%z_TRG_CTF_Blue' z = <zone_name>
			if isinnodearray <blue_flag>
				create name = <blue_flag>
			endif
			formattext checksumname = blue_base '%z_TRG_CTF_Blue_Base' z = <zone_name>
			if isinnodearray <blue_base>
				create name = <blue_base>
			endif
		endif
		GetNumPlayersOnTeam team = 2
		if (<num_members> > 0)
			formattext checksumname = green_flag '%z_TRG_CTF_Green' z = <zone_name>
			if isinnodearray <green_flag>
				create name = <green_flag>
			endif
			formattext checksumname = green_base '%z_TRG_CTF_Green_Base' z = <zone_name>
			if isinnodearray <green_base>
				create name = <green_base>
			endif
		endif
		GetNumPlayersOnTeam team = 3
		if (<num_members> > 0)
			formattext checksumname = yellow_flag '%z_TRG_CTF_Yellow' z = <zone_name>
			if isinnodearray <yellow_flag>
				create name = <yellow_flag>
			endif
			formattext checksumname = yellow_base '%z_TRG_CTF_Yellow_Base' z = <zone_name>
			if isinnodearray <yellow_base>
				create name = <yellow_base>
			endif
		endif
	endif
endscript

script Team_Flag_Base 
	obj_setinnerradius \{10}
	seteventhandler event = objectinradius scr = CTF_Team_Base_Trigger response = switch_script params = {<...>}
endscript

script ShatterAndDie {area = 1.5
		variance = 4.6
		vel_x = Random (@ 0.0 @ 0.76199996 @ -0.76199996 )
		vel_y = Random (@ 0.254 @ 0.76199996 @ 1.2700001 )
		vel_z = Random (@ 0.0 @ 0.76199996 @ -0.76199996 )
		spread = 1.0
		material = sys_bloodsplat01_sys_bloodsplat01
	}
	animsave_timestamp event = {type = ShatterAndDie <...>}
	kill name = <name>
	if gotparam OldStyle
		shatter {
			name = <name>
			area = <area>
			variance = <variance>
			vel_x = <vel_x>
			vel_y = <vel_y>
			vel_z = <vel_z>
			spread = <spread>
			<...>
		}
	else
		shatter {
			name = <name>
			material = <material>
			area = <area>
			variance = <variance>
			vel_x = <vel_x>
			vel_y = <vel_y>
			vel_z = <vel_z>
			spread = <spread>
			<...>
		}
	endif
	if gotparam vibrate
		getsingletag state
		if gotparam state
			if NOT ((<state> = Skater_OnRail) || (<state> = Skater_InManual))
				vibrate actuator = 0 percent = 100
				wait 5 gameframes
				vibrate off
			endif
		endif
	endif
endscript

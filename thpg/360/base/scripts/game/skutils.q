block_proxim_node_updates = 0
TimeOfDayDebug = 0
main_menu_ok_to_go = 0
animlodinterleave2 = 12
animlodinterleave4 = 9
ps3_animlodinterleave2 = 20
ps3_animlodinterleave4 = 12
xenon_animlodinterleave2 = 20
xenon_animlodinterleave4 = 12

script PrintState 
	if inair
		printf \{"In air"}
	endif
	if onground
		printf \{"On ground"}
	endif
	if OnWall
		printf \{"On wall"}
	endif
	if onlip
		printf \{"On lip"}
	endif
	if onrail
		printf \{"OnRail"}
	endif
endscript

script SetAllStats \{value = 3}
	if (<value> = 0)
		printf \{"* Clearing Stats Override"}
	else
		printf "* Overriding Stats to %d" d = <value>
	endif
	SetStatOverride <value>
endscript

script waitonegameframe 
	wait \{1
		gameframes}
endscript

script WaitAnimWhilstChecking 
	begin
	DoNextTrick
	if gotparam \{AndManuals}
		donextmanualtrick
	endif
	if Skater_AnimComplete timer = <timer>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script WaitWhilstChecking 
	getstarttime
	begin
	DoNextTrick
	if gotparam \{AndManuals}
		donextmanualtrick
	endif
	wait \{1
		gameframe}
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > <duration>)
		break
	endif
	repeat
endscript

script reverse 
	playanim \{anim = current
		from = current
		to = 0}
endscript

script CheckForInvalidLevels 
	return level = <level>
endscript
autolaunch_into_career = 0

script autolaunch 
	if istrue $AutoLaunchHostNetLevel
		level = load_z_mainmenu
	endif
	if NOT gotparam game
		game = career
	endif
	if NOT cd
		change entered_from_autolaunch = 1
		if NOT (<level> = load_z_mainmenu)
			choose_random_skater
		endif
		if (<game> = career)
			if NOT (<level> = load_z_mainmenu)
				change autolaunch_into_career = 1
			endif
		endif
	endif
	setgametype <game>
	setcurrentgametype
	CheckForInvalidLevels level = <level>
	if gamemodeequals is_mocap
		change next_level_script = mocap_start_game
	endif
	if NOT (<level> = load_z_mainmenu)
		xenon_singleplayer_session_init
	endif
	request_level level = <level>
	cleanup_before_loading_level
	load_requested_level
endscript

script net_autolaunch_setup 
	setgametype \{net}
	setcurrentgametype
	setnetworkmode \{$internet_mode}
	setup_sessionfuncs
	net_level = ($online_level_select_menu_level_info [0].level)
	SetPreferencesFromUI prefs = network field = 'level' checksum = <net_level> string = ($online_level_select_menu_level_info [0].text)
endscript

script change_level 
	printf "change_level to %d" d = <level>
	change is_changing_levels = 1
	DisablePakManStreaming
	if NOT innetgame
		if NOT gotparam load_screen_already_up
			load_level_handle_movie_loading_screen level = <level>
		endif
	endif
	if insplitscreengame
		if NOT (<level> = load_z_mainmenu)
			addparams preserve_skaters
		endif
	endif
	setenablemovies 1
	CheckForInvalidLevels level = <level>
	if gotparam next_level_script
		change next_level_script = <next_level_script>
	endif
	ResetScore
	ResetScorePot allskaters
	hide_console_window
	blockpendingpakmanloads map = zones
	deinit_goal_manager
	grid_control_deinit_grid_control_manager
	ui_destroy_background
	cleanup_before_changing_level <...>
	ChangeLevel <...>
	if insplitscreengame
		launch_two_player
	endif
	if NOT innetgame
		if infrontend
			printf "ChangeLevel - we should be going FROM the frontend to the single player mission"
			if NOT (<level> = load_z_mainmenu)
				xenon_singleplayer_session_init
			endif
		else
			if (<level> = load_z_mainmenu)
				printf "ChangeLevel - to mainmenu"
				xenon_singleplayer_session_begin_uninit
			endif
		endif
	endif
endscript

script quickscript 
	script_assert \{"Trying to deprecate QuickScript...  please see Gary!"}
	printf \{"Running quickscript...."}
	reloadnodearray
	retry
endscript
gCurrentSky = none

script change_sky 
	if ($gCurrentSky = none)
		spawnscriptlater change_sky_async params = {sky = <sky>}
		change gCurrentSky = <sky>
	else
		printf \{"The sky has already been set to %a.  Not changing!"
			a = $gCurrentSky}
	endif
endscript

script change_sky_async 
	printf \{'change_sky_async'}
	setpakmancurrentblock map = sky pak = <sky>
	spawnscriptnow \{TOD_Manager_Create_Weather_Cycle}
endscript
mFD_SKATABLE = 1
mFD_NOT_SKATABLE = 2
mFD_WALL_RIDABLE = 4
mFD_VERT = 8
mFD_NON_COLLIDABLE = 16
mFD_TRIGGER = 64
mFD_CAMERA_NON_COLLIDABLE = 128
mFD_BANK = 256
mFD_UNDER_OK = 2048
mFD_INVISIBLE = 4096

script show_all 
	debugrenderignore
endscript

script show_vert 
	debugrenderignore \{ignore_0 = mFD_VERT}
endscript

script show_wallride 
	debugrenderignore \{ignore_0 = mFD_WALL_RIDABLE}
endscript

script show_wall_ridable 
	debugrenderignore \{ignore_0 = mFD_WALL_RIDABLE}
endscript

script show_trigger 
	debugrenderignore \{ignore_0 = mFD_TRIGGER}
endscript

script show_invisible 
	debugrenderignore \{ignore_0 = mFD_INVISIBLE}
endscript

script show_triggers 
	show_trigger
endscript

script show_camera 
	debugrenderignore \{ignore_0 = mFD_NON_CAMERA_COLLIDABLE}
endscript

script show_camera_collide 
	debugrenderignore \{ignore_0 = mFD_CAMERA_NON_COLLIDABLE}
endscript

script show_skatable 
	debugrenderignore \{ignore_0 = mFD_SKATABLE}
endscript

script show_not_skatable 
	debugrenderignore \{ignore_0 = mFD_NOT_SKATABLE}
endscript

script show_non_collidable 
	debugrenderignore \{ignore_0 = mFD_NON_COLLIDABLE}
endscript

script show_collidable 
	debugrenderignore \{ignore_1 = mFD_NON_COLLIDABLE}
endscript

script JumpSkaterToNode 
	MakeSkaterGoto JumpToNode params = {nodename = <nodename> <...>}
endscript

script JumpToNode 
	if isinnodearray <nodename>
		stopbalancetrick
		setspeed \{0}
		if gotparam \{MoveUpABit}
			move \{y = 0.3}
		endif
		obj_movetonode name = <nodename> orient NoReset
		goto \{groundgone}
	endif
endscript

script ScreenElementSystemCleanup 
	printf "************ ScreenElementSystemCleanup ***************"
	if objectexists id = root_window
		destroyscreenelement id = root_window
		screenelementsysteminit
		setscreenelementprops {
			id = root_window
			event_handlers = [
				{pad_start handle_start_pressed}
				{pad_r3 goal_in_game_episode_menu}
			]
			replace_handlers
			tags = {menu_state = off}
		}
		launchevent type = focus target = root_window
		if NOT gotparam no_panel_stuff
			create_panel_stuff
		endif
	endif
endscript

script killelement3d 
	wait \{1
		gameframe}
	die
endscript

script setup_ped_speech {
		inner_radius = 0.3
		speed = 0.5
		pad_choose_script = ped_speech_exit
	}
	if NOT iscreated <ped_id>
		scriptassert "tried to set up ped speech on an object that doesn't exist"
	endif
	<ped_id> :obj_setinnerradius <inner_radius>
	<ped_id> :obj_setouterradius 0
	cleareventhandler anyobjectinradius
	cleareventhandler objectoutofradius
	seteventhandler event = anyobjectinradius scr = ped_speech_got_trigger reponse = call_script params = <...>
endscript

script ped_speech_got_trigger {set_script = seteventhandler set_script_scr = ped_speech_got_trigger}
	if NOT <colobjid> :islocalskater
		return
	endif
	if (($dont_create_speech_boxes = 1) || ($game_progress_block_triggers = 1) || ($sysnotify_wait_in_progress = 1))
		return
	endif
	cleareventhandler anyobjectinradius
	if objectexists id = ped_speech_dialog
		<should_destroy> = 0
		if istrue $igc_playing
			<should_destroy> = 1
		endif
		if skater :isinbail
			<should_destroy> = 1
		endif
		if skater :export_isrecording
			<should_destroy> = 1
		endif
		if ve_is_playing
			<should_destroy> = 1
		endif
		if skatercurrentscorepotgreaterthan 0
			<should_destroy> = 1
		endif
		if ($cap_in_menu = 1)
			<should_destroy> = 1
		endif
		if ($is_changing_levels = 1)
			<should_destroy> = 1
		endif
		if ($ingame_save_active = 1)
			<should_destroy> = 1
		endif
		if <colobjid> :doingtrick
			<should_destroy> = 1
		endif
		if NOT gman_canstartgoal
			<should_destroy> = 1
		endif
		if gotparam hide_in_goals
			if gman_getactivatedgoalid
				<should_destroy> = 1
			endif
		endif
		if screenelementexists id = in_game_episode_menu_anchor
			<should_destroy> = 1
		endif
		if screenelementexists id = goal_start_dialog
			<should_destroy> = 1
		endif
		if ((screenelementexists id = goal_photo_viewport_container) || (screenelementexists id = goal_photo_picture_handle))
			<should_destroy> = 1
		endif
		if insplitscreengame
			<should_destroy> = 1
		endif
		if ($goal_comp_intermission_active = 1)
			<should_destroy> = 1
		endif
		if (<should_destroy> = 1)
			destroyscreenelement id = ped_speech_dialog
		endif
		<set_script> event = anyobjectinradius scr = <set_script_scr> object = <ped_id> params = <...>
	else
		show_speech_box = 1
		if istrue $igc_playing
			show_speech_box = 0
		endif
		if objectexists id = root_window
			if root_window :getsingletag menu_state
				if (<menu_state> = on)
					show_speech_box = 0
				endif
			endif
		endif
		if NOT gman_canstartgoal
			if NOT innetgame
				show_speech_box = 0
			endif
		endif
		if skater :export_isrecording
			show_speech_box = 0
		endif
		if ve_is_playing
			show_speech_box = 0
		endif
		if NOT <colobjid> :onground
			show_speech_box = 0
		endif
		if <colobjid> :isinbail
			show_speech_box = 0
		endif
		if <colobjid> :doingtrick
			show_speech_box = 0
		endif
		if skatercurrentscorepotgreaterthan 0
			show_speech_box = 0
		endif
		if ($cap_in_menu = 1)
			show_speech_box = 0
		endif
		if ($is_changing_levels = 1)
			show_speech_box = 0
		endif
		if ($ingame_save_active = 1)
			show_speech_box = 0
		endif
		if screenelementexists id = goal_start_dialog
			show_speech_box = 0
		endif
		if screenelementexists id = in_game_episode_menu_anchor
			show_speech_box = 0
		endif
		if gotparam hide_in_goals
			if gman_getactivatedgoalid
				<show_speech_box> = 0
			endif
		endif
		if ((screenelementexists id = goal_photo_viewport_container) || (screenelementexists id = goal_photo_picture_handle))
			<show_speech_box> = 0
		endif
		if insplitscreengame
			<show_speech_box> = 0
		endif
		if ($goal_comp_intermission_active = 1)
			<show_speech_box> = 0
		endif
		if (<show_speech_box> = 1)
			if gotparam dont_allow_pause
				kill_start_key_binding
			endif
			<ped_id> :obj_setouterradius <inner_radius>
			<set_script> event = objectoutofradius scr = ped_speech_refuse object = <ped_id> params = <...>
			if NOT gotparam accept_text
				if NOT gotparam display_name
					<display_name> = "Ped"
				endif
				formattext textname = accept_text "%s: \\me to talk." s = <display_name>
			endif
			if objectexists id = ped_speech_dialog
				destroyscreenelement id = ped_speech_dialog
			endif
			create_speech_box {
				anchor_id = ped_speech_dialog
				text = <accept_text>
				no_pad_choose
				no_pad_start
				pad_option_script = ped_speech_accept
				pad_option_params = <...>
				z_priority = 5
			}
			ped_speech_dialog :settags <...>
			ped_speech_dialog :obj_spawnscriptlater ped_speech_die_with_trigger params = {ped_id = <ped_id>}
		else
			<set_script> event = anyobjectinradius scr = <set_script_scr> object = <ped_id> params = <...>
		endif
	endif
endscript

script ped_speech_accept 
	if <colobjid> :isinbail
		return
	endif
	if <colobjid> :doingtrick
		return
	endif
	speech_box_exit
	if NOT objectexists id = <ped_id>
		return
	endif
	if ($cap_in_menu = 1)
		return
	endif
	if ($is_changing_levels = 1)
		return
	endif
	if ($ingame_save_active = 1)
		return
	endif
	if gotparam hide_in_goals
		if gman_hasactivegoals
			return
		endif
	endif
	debounce x time = 0.5
	if <colobjid> :onground
		if NOT skatercurrentscorepotgreaterthan 0
			if <colobjid> :onground
				ped_speech_accept2 <...>
			else
				if NOT <colobjid> :rightpressed
					if NOT <colobjid> :leftpressed
						if NOT <colobjid> :uppressed
							if NOT <colobjid> :downpressed
								ped_speech_accept2 <...>
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if NOT <colobjid> :rightpressed
			if NOT <colobjid> :leftpressed
				if NOT <colobjid> :uppressed
					if NOT <colobjid> :downpressed
						ped_speech_accept2 <...>
					endif
				endif
			endif
		endif
	endif
endscript

script ped_speech_accept2 
	if NOT gotparam \{dont_deactivate_goals}
		if NOT gamemodeequals \{is_singlesession}
			if NOT gamemodeequals \{is_classic}
				gman_deactivateallgoals
			endif
		endif
	endif
	cleareventhandler \{anyobjectinradius}
	if screenelementexists \{id = ped_speech_dialog}
		destroyscreenelement \{id = ped_speech_dialog}
	endif
	if gotparam \{activation_script}
		<colobjid> :obj_spawnscriptlater <activation_script> params = {ped_id = <ped_id> <activation_script_params>}
	endif
	if gotparam \{text}
		create_speech_box <...> no_pad_start
	endif
endscript

script ped_speech_refuse 
	if gotparam \{intid}
		if gotparam \{outintid}
			if NOT (<outintid> = <intid>)
				return
			endif
		endif
	endif
	if gotparam \{hint_text}
		ped_utils_hint_dialog_refuse <...>
	endif
	cleareventhandler \{objectoutofradius}
	<ped_id> :obj_setouterradius 0
	speech_box_exit \{anchor_id = ped_speech_dialog}
	ped_speech_reset <...>
	if gotparam \{dont_allow_pause}
		restore_start_key_binding
	endif
endscript

script ped_speech_reset 
	if gotparam \{outer_radius_script}
		<outer_radius_script> <outer_radius_params>
	endif
	if NOT gotparam \{no_repeat}
		setup_ped_speech <...>
	endif
endscript

script ped_speech_exit 
	unpauseskaters
	speech_box_exit
endscript

script ped_speech_die_with_trigger 
	if NOT gotparam \{ped_id}
		return
	endif
	begin
	if NOT iscreated <ped_id>
		launchevent \{type = speech_box_destroyed}
		die
		return
	endif
	wait \{1
		gameframes}
	repeat
endscript

script script_assert 
	printf \{"ASSERT MESSAGE:"}
	scriptassert <...>
endscript

script GetStackedScreenElementPos 
	if gotparam xy
		GetStackedScreenElementPosOnXY <...>
	else
		if gotparam x
			if gotparam y
				GetStackedScreenElementPosOnXY <...>
			else
				GetStackedScreenElementPosOnX <...>
			endif
		else
			if gotparam y
				GetStackedScreenElementPosOnY <...>
			else
				script_assert "GetStackedScreenElementPos called without an axis"
			endif
		endif
	endif
	return pos = <pos>
endscript

script GetStackedScreenElementPosOnX 
	getscreenelementposition id = <id>
	getscreenelementdims id = <id>
	<unit_pair> = (1.0, 0.0)
	if gotparam \{negative}
		<unit_pair> = (-1.0, 0.0)
	endif
	if gotparam \{offset}
		return pos = (<screenelementpos> + (<unit_pair> * <width> + <offset>))
	else
		return pos = (<screenelementpos> + (<unit_pair> * <width>))
	endif
endscript

script GetStackedScreenElementPosOnY 
	getscreenelementposition id = <id>
	getscreenelementdims id = <id>
	<unit_pair> = (0.0, 1.0)
	if gotparam \{negative}
		<unit_pair> = (0.0, -1.0)
	endif
	if gotparam \{offset}
		return pos = (<screenelementpos> + (<unit_pair> * <height> + <offset>))
	else
		return pos = (<screenelementpos> + (<unit_pair> * <height>))
	endif
endscript

script GetStackedScreenElementPosOnXY 
	getscreenelementposition id = <id>
	getscreenelementdims id = <id>
	<x_unit_pair> = (1.0, 0.0)
	<y_unit_pair> = (0.0, 1.0)
	if gotparam negative
		<x_unit_pair> = (-1.0, 0.0)
		<y_unit_pair> = (0.0, -1.0)
	endif
	if gotparam offset
		return pos = (<screenelementpos> + (<y_unit_pair> * <height> + <x_unit_pair> * <width> + <offset>))
	else
		return pos = (<screenelementpos> + (<y_unit_pair> * <height> + <x_unit_pair> * <width>))
	endif
endscript
is_blurring = 0
pulse_blur_values = {
	angles = [
		10
		-20
	]
	scales = [
		1.0
		0.9
	]
	inner_color = [
		255
		200
		200
	]
	outer_color = [
		200
		200
		255
	]
	inner_alpha = 0.0
	outer_alpha = 160.0
}
pulse_bloom_values = {
	autoluminancemod = 0
	distancemod = 0
	bloom1 = 0.2
	bloom2 = 0.5
	strength = [
		255
		255
		255
	]
	color = [
		125
		125
		125
	]
}

script update_blur_fx viewport = 0
	float_amount = (<amount> / 255.0)
	if (<float_amount> < 0.0)
		float_amount = 0.0
	endif
	if (<float_amount> > 1.0)
		float_amount = 1.0
	endif
	if (<float_amount> = 0.0)
		end_blur_fx name = <name> viewport = <viewport>
	else
		if (($is_blurring) = 0)
			screenfx_addfxinstance type = bloom name = <name> viewport = <viewport> amount = <float_amount>
			change is_blurring = 1
			printf "Started Blurring"
		endif
		screenfx_updatefxinstanceparams type = bloom name = <name> viewport = <viewport> amount = <float_amount> $pulse_bloom_values
	endif
endscript

script end_blur_fx \{viewport = 0}
	if (($is_blurring) = 1)
		if screenfx_fxinstanceexists name = <name> viewport = <viewport>
			screenfx_removefxinstance name = <name> viewport = <viewport>
		endif
		change \{is_blurring = 0}
		printf \{"Finished Blurring"}
	endif
endscript

script kill_blur \{start = 0
		name = pulse_blur}
	if NOT insplitscreengame
		killspawnedscript \{name = pulse_blur_script_down}
		killspawnedscript \{name = pulse_blur_script_up}
		end_blur_fx name = <name>
	endif
endscript

script pulse_blur \{start = 200
		end = 0
		speed = 4
		name = pulse_blur}
	killspawnedscript \{name = pulse_blur_script_down}
	killspawnedscript \{name = pulse_blur_script_up}
	if (<start> > <end>)
		spawnscriptlater pulse_blur_script_down params = <...>
	else
		spawnscriptlater pulse_blur_script_up params = <...>
	endif
endscript

script pulse_blur_script_down 
	if gotparam force_pulse
		begin
		if (<start> < <end>)
			update_blur_fx amount = <end> name = <name>
			break
		endif
		update_blur_fx amount = <start> name = <name>
		<start> = (<start> - <speed>)
		wait 1 gameframe
		repeat
		return
	endif
	if NOT insplitscreengame
		begin
		if (<start> < <end>)
			update_blur_fx amount = <end> name = <name>
			break
		endif
		update_blur_fx amount = <start> name = <name>
		<start> = (<start> - <speed>)
		wait 1 gameframe
		repeat
	endif
endscript

script pulse_blur_script_up 
	if gotparam force_pulse
		begin
		if (<start> > <end>)
			update_blur_fx amount = <end> name = <name>
			break
		endif
		update_blur_fx amount = <start> name = <name>
		<start> = (<start> + <speed>)
		wait 1 gameframe
		repeat
		return
	endif
	if NOT insplitscreengame
		begin
		if (<start> > <end>)
			update_blur_fx amount = <end> name = <name>
			break
		endif
		update_blur_fx amount = <start> name = <name>
		<start> = (<start> + <speed>)
		wait 1 gameframe
		repeat
	endif
endscript

script nullscript 
endscript

script mark_first_input_received 
	GetCurrentSkaterProfileIndex
	getskaterid
	if gotparam device_num
		<controller_index> = <device_num>
	else
		if gotparam controller
			<controller_index> = <controller>
		else
			printf "=== ERROR === mark_first_input_received was passed neither controller nor device_num"
			<controller_index> = 0
		endif
	endif
	BindControllerToSkater skater_heap_index = <currentskaterprofileindex> controller = <controller_index>
	spawnscriptlater mark_first_input_received_spawned params = <...>
	if NOT insplitscreengame
		SetShouldIgnoreUnboundControllers true
	endif
	FirstInputReceived
endscript

script mark_first_input_received_spawned 
	BindFrontEndToController front_end_pad = <currentskaterprofileindex> controller = <controller_index>
endscript

script lighting \{target = 8421504
		percent = 0}
	if gotparam \{lights}
		if gotparam \{id}
			FakeLights percent = <lights> id = <id> prefix = <prefix>
		else
			if gotparam \{prefix}
				FakeLights percent = <lights> prefix = <prefix>
			else
				FakeLights percent = <lights> prefix = TRG_LevelLight
			endif
		endif
	endif
endscript

script dumpmetrics 
	getmetrics
	printf
	printf \{"Dumping Metrics Structure"}
	printstruct <...>
endscript
dummy_metrics_struct = {
	mainscene = 0
	skyscene = 0
	metrics = 0
	sectors = 0
	colsectors = 0
	verts = 0
	basepolys = 0
	texturememory = 0
}

script restore_skater_camera 
	if objectexists id = ReplayActor
		if objectexists id = ReplayCamera
			if ($ve_igc_camera_active = 0)
				setactivecamera id = ReplayCamera
			endif
			return
		endif
	endif
	if infrontend
		if compositeobjectexists name = main_menu_camera
			setactivecamera id = main_menu_camera
			return
		endif
	endif
	if NOT ($view_mode = 0)
		setactivecamera id = viewer_cam
		return
	endif
	if compositeobjectexists cap_camera
		setactivecamera id = cap_camera
		return
	endif
	if isobserving
		setactivecamera id = skatercam0
	else
		if NOT localskaterexists
			setactivecamera id = skatercam0
		else
			setactivecamera id = skatercam0
		endif
	endif
endscript

script getskatercam 
	camera_object = skatercam0
	if insplitscreengame
		if isobjectscript
			GetSkaterNumber
			if NOT (<skaternumber> = 0)
				camera_object = skatercam1
			endif
		endif
	endif
	return skatercam = <camera_object>
endscript

script setskatercamoverride 
	getskatercam
	<skatercam> :sc_setskatercamoverride <...>
endscript

script clearskatercamoverride 
	getskatercam
	<skatercam> :sc_clearskatercamoverride <...>
endscript

script ShakeCamera 
	getskatercam
	<skatercam> :sc_shakecamera <...>
endscript

script empty_script 
endscript

script HideSkaterAndMiscSkaterEffects 
	killtexturesplats \{all}
	preallocsplats
	skater :TurnSparksOff
	skater :SwitchOnBoard
	skater :RemoveSkaterFromWorld
endscript

script ResetLookAround 
	printf \{"ResetLookAround is not currently working....."}
endscript

script set_render_framerate \{framerate = 0}
	printf 'set_render_framerate: from %a to %b' a = ($render_lock_framerate) b = <framerate>
	change render_lock_framerate = <framerate>
endscript

script set_game_framerate \{framerate = 0}
	printf 'set_game_framerate: from %a to %b' a = ($game_lock_framerate) b = <framerate>
	change game_lock_framerate = <framerate>
endscript

script CalcPosRelative ob = skater dx = 0 dy = 0 dz = 0
	<ob> :obj_getposition
	<ob> :obj_getorientation
	unit_z = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
	unit_x = ((0.0, 1.0, 0.0) * <unit_z>)
	unit_y = (<unit_z> * <unit_x>)
	pos = (<pos> + <dx> * <unit_x> + <dy> * <unit_y> + <dz> * <unit_z>)
	return x = (<pos>.(1.0, 0.0, 0.0)) y = (<pos>.(0.0, 1.0, 0.0)) z = (<pos>.(0.0, 0.0, 1.0)) pos = <pos>
endscript

script forced_create 
	if gotparam prefix
		kill prefix = <prefix>
		create prefix = <prefix>
	else
		if gotparam name
			if isinnodearray <name>
				kill name = <name>
				create name = <name>
			else
				printf "### Forced_Create: %n does not exist" n = <name>
			endif
		else
			printf "### Forced_Create: Must specifiy a name or prefix"
		endif
	endif
endscript
skater_special_index = 0
have_loaded_permanent = 0
have_loaded_unloadable = 0

script do_load_permanent 
	if ($have_loaded_permanent)
	else
		do_unload_unloadable
		loadpak \{'pak/perm_anims/perm_anims.pak'
			heap = unloadableanim
			no_vram}
		change \{have_loaded_permanent = 1}
	endif
endscript

script do_unload_permanent 
	if ($have_loaded_permanent)
		unloadpak \{'pak/perm_anims/perm_anims.pak'}
		waitunloadpak \{'pak/perm_anims/perm_anims.pak'}
		change \{have_loaded_permanent = 0}
	endif
endscript

script do_load_unloadable 
	printf "**************************** do_load_unloadable"
	if ($have_loaded_unloadable)
		printf "already loaded"
	else
		do_load_permanent
		pushmemprofile 'Unloadable Anims'
		popmemprofile
		change have_loaded_unloadable = 1
		printf "do_load_unloadable finished"
	endif
endscript

script do_unload_unloadable 
	printf "**************************** do_unload_unloadable"
	if ($have_loaded_unloadable)
		change have_loaded_unloadable = 0
		printf "do_unload_unloadable finished"
	else
		printf "do_unload_unloadable not needed"
	endif
endscript

script what_is_loaded 
	if ($have_loaded_permanent)
		printf \{"PERMANENT"}
	endif
	if ($have_loaded_unloadable)
		printf \{"UNLOADABLE"}
	endif
endscript

script SetObjectColor_CurrentTOD 
endscript

script GetNetworkNumPlayers 
	getpreferencechecksum pref_type = network num_players
	switch <checksum>
		case num_2
		return num_players = 2
		case num_3
		return num_players = 3
		case num_4
		return num_players = 4
		case num_5
		return num_players = 5
		case num_6
		return num_players = 6
		case num_7
		return num_players = 7
		case num_8
		return num_players = 8
		default
		return num_players = 1
	endswitch
endscript

script trigger_speed_boost multi = 7.5
	if NOT gotparam no_sound
		soundevent event = SK8_Wind_Boost_SFX
	endif
	if gotparam max_speed
		getspeed
		if ((<speed> * <multi>) > <max_speed>)
			if (<speed> < <max_speed>)
				<new_speed> = <max_speed>
			else
				return
			endif
		else
			<new_speed> = (<speed> * <multi>)
		endif
		SetSkaterVelocity <new_speed>
	else
		if gotparam speed
			SetSkaterVelocity <speed>
		else
			GetSkaterVelocity
			SetSkaterVelocity vel_x = (<vel_x> * <multi>) vel_y = (<vel_y> * <multi>) vel_z = (<vel_z> * <multi>)
		endif
	endif
endscript

script trigger_jump_boost \{multi = 7.5}
	if NOT gotparam \{no_sound}
		soundevent \{event = SK8_Wind_Boost_SFX}
	endif
	GetSkaterVelocity
	if gotparam \{speed}
		SetSkaterVelocity vel_x = <vel_x> vel_y = <speed> vel_z = <vel_z>
	else
		SetSkaterVelocity vel_x = <vel_x> vel_y = (<vel_y> * <multi>) vel_z = <vel_z>
	endif
endscript

script trigger_bounce \{vel = 12}
	GetSkaterVelocity
	if NOT walking
		jump \{bonelessheight}
	else
		launchevent \{type = jumprequested}
	endif
	SetSkaterVelocity vel_x = <vel_x> vel_y = <vel> vel_z = <vel_z>
endscript

script ForceToWalk 
	printf \{"ForceToWalk"}
	setforcewalk
	wait \{1
		gameframe}
	if isinbail
		waitforevent \{type = finished_bailing}
	endif
	if NOT walking
		MakeSkaterGoto \{switch_ongroundai
			params = {
				newscript = Walking_onGroundAi
			}}
	else
		ClearTrickQueues
		SetWalkingAirTricks
		SetWalkingGroundTricks
	endif
	SwitchOnBoard
endscript

script KillForceToWalk 
	printf \{"KillForceToWalk"}
	unsetforcewalk
	SwitchOnBoard
	ClearTrickQueues
	SetWalkingAirTricks
	SetWalkingGroundTricks
endscript
triggertypes = {
	skate = 1
	jump = 2
	Onto = 3
	on = 3
	off = 4
	offedge = 5
	Wallplant = 6
	lip = 7
	land = 8
	bonk = 9
	climb = 10
	hang = 10
	graffiti = 11
	tag = 11
	spin = 12
	natas = 12
	Grind = 13
	projectile = 14
	walk = 15
	smack = 16
	stall = 17
	AcidDrop = 18
}

script StopParticleObject 
	if gotparam \{debug}
		printf "### stopping particle object name = %n" n = <name>
	endif
	<name> :setemitrate 0
	if NOT gotparam \{StayAlive}
		begin
		if NOT <name> :isemitting
			kill name = <name>
			break
		endif
		wait \{30
			gameframes}
		repeat
	endif
endscript

script restore_start_key_binding 
	printf \{"+++ RESTORE START KEY"}
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				handle_start_pressed
			}
		]
		replace_handlers}
	restore_r3_binding
endscript

script kill_start_key_binding 
	printf \{"--- KILL START KEY"}
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	kill_r3_binding
endscript

script ShowUIMem 
	<profile_names> = [
		'Fonts and Bitmaps'
		'Sprites - Fonts and Bitmaps'
	]
	GetMemProfileSize profile_names = <profile_names>
	<usage_2d> = <profile_size>
	GetMemProfileSize profile_name = 'Menu 3D'
	<usage_3d> = <profile_size>
	if ((<usage_2d> > -1) && (<usage_3d> > -1))
		printf ""
		printf "**********************************"
		printf "	UI Memory Usage:"
		printf "	2D - %iK" i = (<usage_2d> / 1024)
		printf "	3D - %jK" j = (<usage_3d> / 1024)
		printf "**********************************"
		printf ""
	else
		printf "Mem Profiler not active, probably overflowed, try restarting..."
	endif
endscript

script ShowAnimMem 
	<profile_names> = [
		'Permanent Anims'
		'Permanent & semi-permanent anims'
	]
	GetMemProfileSize profile_names = <profile_names>
	<usage_permanent> = <profile_size>
	GetMemProfileSize profile_name = 'Level Specific Anims'
	<usage_levelspecific> = <profile_size>
	if (<profile_size> > -1)
		printf ""
		printf "**********************************"
		printf "	Anim Memory Usage:"
		printf "	Permanent - %iK" i = (<usage_permanent> / 1024)
		printf "	Level-Specific - %jK" j = (<usage_levelspecific> / 1024)
		printf "**********************************"
		printf ""
	else
		printf "Mem Profiler not active, probably overflowed, try restarting..."
	endif
endscript

script SafeCallback 
	if NOT gotparam \{callback}
		return
	endif
	old_callback = <callback>
	removeparameter \{callback}
	<old_callback> <...>
endscript

script get_current_skater_name 
	GetCurrentSkaterProfileIndex
	GetSkaterProfileInfo player = <currentskaterprofileindex>
	return name = <name>
endscript

script AwardNewSpecialTrickToProfile 
	if gotparam all_profiles
		if gotparam name
			profile = <name>
		else
			ForEachSkaterName do = AwardNewSpecialTrickToProfile params = {<...> dont_replace_trick_text}
			return
		endif
	else
		if NOT gotparam profile
			script_assert "AwardNewSpecialTrickToProfile needs a profile param"
		endif
	endif
	if NOT gotparam trick
		script_assert "AwardNewSpecialTrickToProfile needs a trick param"
	endif
	if NOT gotparam key_combo
		script_assert "AwardNewSpecialTrickToProfile needs a key_combo param"
	endif
	AwardSpecialTrickslot profile = <profile>
	if GetTrickFromKeyCombo profile = <profile> special key_combo = <key_combo>
		printf "AwardNewSpecialTrickToProfile - key combo bound already for profile %p" p = <profile>
		BindTrickToKeyCombo {
			profile = <profile>
			special
			index = <current_index>
			key_combo = unassigned
			trick = unassigned
			update_mappings = 1
		}
		<index> = <current_index>
	endif
	if GetKeyComboBoundToTrick profile = <profile> special trick = <trick>
		printf "AwardNewSpecialTrickToProfile - trick bound already for profile %p" p = <profile>
		BindTrickToKeyCombo {
			profile = <profile>
			special
			index = <current_index>
			key_combo = unassigned
			trick = unassigned
			update_mappings = 1
		}
		<index> = <current_index>
	endif
	GetSkaterProfileInfoByName name = <profile>
	if NOT gotparam index
		<index> = (<max_specials> - 1)
	endif
	BindTrickToKeyCombo {
		profile = <profile>
		special
		index = <index>
		key_combo = <key_combo>
		trick = <trick>
		update_mappings = 1
	}
	GetCurrentSkaterProfileIndex
	UpdateTrickMappings skater = <currentskaterprofileindex>
endscript

script flip_skating_backwards 
	Skater_PlayOnGroundAnim \{was_backward = 1
		blendduration = 0.0
		no_idles
		no_events}
endscript

script flip_landing_backwards 
endscript

script flip_manualing_backwards 
	if innollie
		if islatesttrick tricktext = 'One Foot Nose Manual'
			MakeSkaterGoto Manual params = {($Trick_OneFootManual.params) no_transition}
		else
			if islatesttrick tricktext = 'Anti Casper'
				MakeSkaterGoto flatland params = {($Trick_Casper.params) no_transition}
			else
				if islatesttrick tricktext = 'Nose Manual'
					MakeSkaterGoto Manual params = {($Trick_Manual.params) no_transition}
				endif
			endif
		endif
	else
		if islatesttrick tricktext = 'One Foot Manual'
			MakeSkaterGoto nosemanual params = {($Trick_OneFootNosemanual.params) no_transition}
		else
			if islatesttrick tricktext = 'Casper'
				MakeSkaterGoto flatland params = {($Trick_AntiCasper.params) no_transition}
			else
				if islatesttrick tricktext = 'Manual'
					MakeSkaterGoto nosemanual params = {($Trick_NoseManual.params) no_transition}
				endif
			endif
		endif
	endif
endscript

script SetDepthOfFieldParams \{front_start = 0.0
		back_start = 200.0
		front_strength = [
			50
			50
			50
		]
		back_strength = [
			50
			50
			50
		]}
	if gotparam \{off}
		on = 0
	else
		on = 1
	endif
	SetScreenEffectsDOFParams {
		on = <on>
		FrontBlurStart = <front_start>
		BackBlurStart = <back_start>
		FrontStrenth = <front_strength>
		BackStrength = <back_strength>
	}
endscript

script fam_play_stream vol = 190
	begin
	if preloadstreamdone <unique_id>
		break
	endif
	wait 1 frame
	repeat
	if gotparam play_anim
		anim_command target = pedfamanimparentnode command = degenerateblend_addbranch params = {
			blendduration = 0.0
			tree = $Agent_AnimBranch_FAMAnim params = {
				param_timer_type = play
				param_anim = <anim_id>
				param_speed = 1.0
				param_start = 0.0
			}
		}
	endif
	fam_preloadfinished
	if gotparam use_pos_info
		obj_startpreloadedstream <...>
	else
		startpreloadedstream <...>
	endif
endscript

script stop_fam 
	anim_command \{target = pedfamanimparentnode
		command = degenerateblend_addbranch
		params = {
			blendduration = 0.0
			tree = $ped_animbranch_famempty
		}}
endscript

script reset_balance_indicator 
	if NOT screenelementexists id = balance_indicator
		setscreenelementlock off id = root_window
		createscreenelement {
			type = textelement
			id = balance_indicator
			text = "Balance Reset"
			font = text_a1
			parent = root_window
			pos = (570.0, 240.0)
			scale = 0.5
			rgba = [100 100 100 100]
		}
	endif
	wait 0.5 seconds
	if screenelementexists id = balance_indicator
		destroyscreenelement id = balance_indicator
	endif
endscript

script Vibrate_Controller_Safe actuator = 1 percent = 95
	GetSkaterNumber
	if controllerboundtoskater controller = 0 skater = <skaternumber>
		VibrateController port = 0 actuator = <actuator> percent = <percent>
	else
		if controllerboundtoskater controller = 1 skater = <skaternumber>
			VibrateController port = 1 actuator = <actuator> percent = <percent>
		else
			if controllerboundtoskater controller = 2 skater = <skaternumber>
				VibrateController port = 2 actuator = <actuator> percent = <percent>
			else
				if controllerboundtoskater controller = 3 skater = <skaternumber>
					VibrateController port = 3 actuator = <actuator> percent = <percent>
				endif
			endif
		endif
	endif
endscript

script Vibrate_Controller_Safe_Explicit actuator = 1 percent = 95 skaternumber = 0
	if controllerboundtoskater controller = 0 skater = <skaternumber>
		VibrateController port = 0 actuator = <actuator> percent = <percent>
	else
		if controllerboundtoskater controller = 1 skater = <skaternumber>
			VibrateController port = 1 actuator = <actuator> percent = <percent>
		else
			if controllerboundtoskater controller = 2 skater = <skaternumber>
				VibrateController port = 2 actuator = <actuator> percent = <percent>
			else
				if controllerboundtoskater controller = 3 skater = <skaternumber>
					VibrateController port = 3 actuator = <actuator> percent = <percent>
				endif
			endif
		endif
	endif
endscript

script RailAccelerateUphill 
	if triggertype \{land
			Onto}
		killspawnedscript \{name = RailAccelerateUphill2}
		obj_spawnscriptlater RailAccelerateUphill2 params = <...>
	endif
endscript

script RailAccelerateUphill2 \{rate = 0.05}
	obj_getposition
	<prev_height> = (<pos>.(0.0, 1.0, 0.0))
	wait \{1
		gameframe}
	begin
	if onrail
		obj_getposition
		<current_height> = (<pos>.(0.0, 1.0, 0.0))
		if (<current_height> > <prev_height>)
			getspeed
			setspeed (<speed> * (1.0 + <rate>))
		endif
		<prev_height> = <current_height>
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
endscript

script railaccelerate 
	if triggertype \{land
			Onto}
		killspawnedscript \{name = RailAccelerate2}
		obj_spawnscriptlater RailAccelerate2 params = <...>
	endif
endscript

script RailAccelerate2 \{rate = 0.05}
	begin
	if onrail
		getspeed
		setspeed (<speed> * (1.0 + <rate>))
		wait \{1
			gameframe}
	else
		break
	endif
	repeat
endscript

script secret_tape 
	bounce_skate_letter
endscript

script Rig_Mod_Hammer_On_Create 
	obj_roty \{speed = 200}
	obj_setoutlinecolorindex \{index = 3}
	obj_setoutlineflag \{on}
endscript

script GO_Spraycan 
	obj_roty \{speed = 200}
	obj_hover \{amp = 0.125
		freq = 2}
	getuniquecompositeobjectid
	begin
	createflexibleparticlesystem name = <uniqueid> objid = <name> params_script = $GP_SkateBoard_Fire01
	wait \{1
		second}
	repeat 5
endscript

script skate_letter 
	bounce_skate_letter
endscript

script blockpendingpakmanloads \{map = all
		block_scripts = 0
		noparse = 0}
	if (<block_scripts> = 1)
		pendingpakmanloads map = <map> block_scripts = 1 noparse = <noparse>
		return
	endif
	begin
	if NOT (pendingpakmanloads map = <map> noparse = <noparse>)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script setpakmancurrentblock \{block_scripts = 0
		noparse = 0}
	setpakmancurrent map = <map> pak = <pak> pakname = <pakname>
	blockpendingpakmanloads map = <map> block_scripts = <block_scripts> noparse = <noparse>
endscript

script refreshpakmancurrent 
	setpakmancurrentblock map = <map> pak = <pak> pakname = <pakname>
endscript

script zones_pakman_init 
	printf "Zones_PakMan_Init"
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formattext checksumname = sfx_zone_name '%z_sfx' z = <zone_string_name>
	formattext checksumname = gfx_zone_name '%z_gfx' z = <zone_string_name>
	formattext checksumname = lfx_zone_name '%z_lfx' z = <zone_string_name>
	formattext checksumname = mfx_zone_name '%z_mfx' z = <zone_string_name>
	formattext checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	formattext checksumname = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	formattext checksumname = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	formattext checksumname = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	formattext checksumname = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_init <...>
	formattext checksumname = script_zone_init '%z_init' z = <zone_string_name>
	formattext checksumname = script_zone_sfx_init '%z_sfx_init' z = <zone_string_name>
	formattext checksumname = script_zone_gfx_init '%z_gfx_init' z = <zone_string_name>
	formattext checksumname = script_zone_lfx_init '%z_lfx_init' z = <zone_string_name>
	formattext checksumname = script_zone_mfx_init '%z_mfx_init' z = <zone_string_name>
	if scriptexists <script_zone_init>
		<script_zone_init>
	endif
	if scriptexists <script_zone_sfx_init>
		<script_zone_sfx_init>
	endif
	if scriptexists <script_zone_gfx_init>
		<script_zone_gfx_init>
	endif
	if scriptexists <script_zone_lfx_init>
		<script_zone_lfx_init>
	endif
	if scriptexists <script_zone_mfx_init>
		<script_zone_mfx_init>
	endif
	updatepakmanvisibility map = zones
	printf "Zones_PakMan_Init end"
endscript

script zones_pakman_deinit 
	printf "Zones_PakMan_DeInit"
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formattext checksumname = sfx_zone_name '%z_sfx' z = <zone_string_name>
	formattext checksumname = gfx_zone_name '%z_gfx' z = <zone_string_name>
	formattext checksumname = lfx_zone_name '%z_lfx' z = <zone_string_name>
	formattext checksumname = mfx_zone_name '%z_mfx' z = <zone_string_name>
	formattext checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	formattext checksumname = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	formattext checksumname = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	formattext checksumname = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	formattext checksumname = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_deinit <...>
	formattext checksumname = script_zone_deinit '%z_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_sfx_deinit '%z_sfx_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_gfx_deinit '%z_gfx_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_lfx_deinit '%z_lfx_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_mfx_deinit '%z_mfx_deinit' z = <zone_string_name>
	if scriptexists <script_zone_deinit>
		<script_zone_deinit>
	endif
	if scriptexists <script_zone_sfx_deinit>
		<script_zone_sfx_deinit>
	endif
	if scriptexists <script_zone_gfx_deinit>
		<script_zone_gfx_deinit>
	endif
	if scriptexists <script_zone_lfx_deinit>
		<script_zone_lfx_deinit>
	endif
	if scriptexists <script_zone_mfx_deinit>
		<script_zone_mfx_deinit>
	endif
	destroyzoneentities zone_name = <zone_name> zone_string_name = <zone_string_name>
	updatepakmanvisibility map = zones
	printf "Zones_PakMan_DeInit end"
endscript

script sky_pakman_init 
	printf \{"sky_pakman_init"}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formattext checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	mempushcontext \{bottomupheap}
	parsenodearray {
		queue
		zone_name = <zone_name>
		array_name = <array_name>
	}
	mempopcontext
	printf \{"sky_pakman_init end"}
endscript

script show_skater_speed font = text_a1 scale1 = 0.7 scale2 = 0.4 scale3 = 0.3
	setscreenelementlock off id = root_window
	if screenelementexists id = skater_speed_anchor
		destroyscreenelement id = skater_speed_anchor
	endif
	createscreenelement {
		type = containerelement
		id = skater_speed_anchor
		parent = root_window
		pos = (1100.0, 40.0)
		scale = 1.5
	}
	createscreenelement {
		type = textelement
		id = skater_speed_text
		parent = skater_speed_anchor
		text = "speed"
		font = <font>
		rgba = [200 200 200 150]
		pos = (0.0, 0.0)
		scale = <scale2>
		just = [right top]
		z_priority = 10
	}
	createscreenelement {
		type = textelement
		id = skater_speed
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [40 60 160 255]
		pos = (70.0, 5.0)
		scale = <scale1>
		just = [right top]
	}
	createscreenelement {
		type = textelement
		id = skater_speed_max
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [40 60 160 255]
		pos = (0.0, 17.0)
		scale = <scale3>
		just = [right top]
		z_priority = 12
	}
	createscreenelement {
		type = textelement
		id = skater_h_speed_text
		parent = skater_speed_anchor
		text = "h"
		font = <font>
		rgba = [200 200 200 150]
		pos = (0.0, 30.0)
		scale = <scale2>
		just = [right top]
		z_priority = 10
	}
	createscreenelement {
		type = textelement
		id = skater_h_speed
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [40 60 160 255]
		pos = (70.0, 35.0)
		scale = <scale1>
		just = [right top]
	}
	createscreenelement {
		type = textelement
		id = skater_v_speed_text
		parent = skater_speed_anchor
		text = "v"
		font = <font>
		rgba = [200 200 200 150]
		pos = (0.0, 60.0)
		scale = <scale2>
		just = [right top]
		z_priority = 10
	}
	createscreenelement {
		type = textelement
		id = skater_v_speed
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [40 60 160 255]
		pos = (70.0, 65.0)
		scale = <scale1>
		just = [right top]
	}
	createscreenelement {
		type = textelement
		id = skater_friction_text
		parent = skater_speed_anchor
		text = "friction"
		font = <font>
		rgba = [200 200 200 150]
		pos = (0.0, 90.0)
		scale = <scale2>
		just = [right top]
		z_priority = 10
	}
	createscreenelement {
		type = textelement
		id = skater_friction
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [40 160 40 255]
		pos = (70.0, 95.0)
		scale = <scale1>
		just = [right top]
	}
	createscreenelement {
		type = textelement
		id = skater_height_text
		parent = skater_speed_anchor
		text = "height"
		font = <font>
		rgba = [200 200 200 150]
		pos = (0.0, 120.0)
		scale = <scale2>
		just = [right top]
		z_priority = 10
	}
	createscreenelement {
		type = textelement
		id = skater_height
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [160 40 40 255]
		pos = (70.0, 125.0)
		scale = <scale1>
		just = [right top]
	}
	createscreenelement {
		type = textelement
		id = skater_oldheight
		parent = skater_speed_anchor
		text = "0"
		font = <font>
		rgba = [160 40 40 255]
		pos = (0.0, 140.0)
		scale = <scale3>
		just = [right top]
	}
	createscreenelement {
		type = spriteelement
		id = skater_speed_bg
		parent = skater_speed_anchor
		texture = white2
		rgba = [0 0 0 120]
		pos = (75.0, 0.0)
		scale = (17.0, 20.0)
		just = [right top]
		z_priority = 0
	}
	killspawnedscript name = update_skater_speed
	spawnscriptlater update_skater_speed
endscript

script update_skater_speed oldheight = 0 skater_speed_max = 0
	begin
	if screenelementexists id = skater_speed
		skater :getspeed
		formattext textname = text "%s" s = <speed>
		setscreenelementprops id = skater_speed text = <text>
		skater :obj_getvelocity
		formattext textname = text "%s" s = (<vel> [1])
		setscreenelementprops id = skater_v_speed text = <text>
		sqrt (<vel> [0] * <vel> [0] + <vel> [2] * <vel> [2])
		formattext textname = text "%s" s = <sqrt>
		setscreenelementprops id = skater_h_speed text = <text>
		if (<speed> > <skater_speed_max>)
			<skater_speed_max> = <speed>
		endif
		if (<speed> < 1.0)
			<skater_speed_max> = 0
		endif
		formattext textname = text "%m" m = <skater_speed_max>
		setscreenelementprops id = skater_speed_max text = <text>
	else
		return
	endif
	if screenelementexists id = skater_friction
		skater :getrollingfriction
		formattext textname = text "%s" s = <friction>
		setscreenelementprops id = skater_friction text = <text>
	endif
	if screenelementexists id = skater_height
		skater :getlastgroundpos
		ground_y = (<pos>.(0.0, 1.0, 0.0))
		skater :obj_getposition
		skater_y = (<pos>.(0.0, 1.0, 0.0))
		height = (<skater_y> - <ground_y>)
		if (<height> > <oldheight>)
			<oldheight> = <height>
		endif
		if (<height> < 1.0)
			<oldheight> = 0
		endif
		formattext textname = text "%s" s = <height>
		setscreenelementprops id = skater_height text = <text>
		formattext textname = text "%o" o = <oldheight>
		setscreenelementprops id = skater_oldheight text = <text>
	endif
	wait 5 gameframes
	repeat
endscript

script Arrow_Bounce 
	if gamemodeequals \{is_career}
		obj_hover \{amp = 0.125
			freq = 2}
	else
		obj_invisible
		if obj_hascomponent \{compassblip}
			blip_off
		endif
	endif
endscript

script magic_moment_cam mmc_pos = (0.0, 0.0, 0.0) mmc_quat = (0.0, 0.0, 0.0) mmc_fov = 81.0 mmc_time = 0.33 mmc_hold_time = 0.33 exit_quick = false
	if gotparam pos
		mmc_pos = <pos>
	endif
	if gotparam quat
		mmc_quat = <quat>
	endif
	if gotparam fov
		mmc_fov = <fov>
	endif
	if gotparam time
		mmc_time = <time>
	endif
	if gotparam hold_time
		mmc_hold_time = <hold_time>
	endif
	playigccam controlscript = magic_moment_cam_control params = {<...>}
endscript

script magic_moment_cam_control exit_quick = false
	if gotparam fx
		spawnscriptnow magic_moment_cam_add_screen_fx params = {<...>}
	endif
	if gotparam do_pause
		pauseskaters
	endif
	setslomo 0.25
	ccam_domorph {
		lockto = world
		pos = <mmc_pos>
		quat = <mmc_quat>
		fov = <mmc_fov>
		time = <mmc_time>
	}
	ccam_waitmorph
	wait <mmc_hold_time> second
	if (<exit_quick> = true)
		setslomo 1.0
	endif
	igc_camera_movetoplayer time = 0.33
	if gotparam do_pause
		unpauseskaters
	endif
	if gotparam fx
		spawnscriptnow magic_moment_cam_remove_screen_fx params = {<...>}
	endif
	setslomo 1.0
	broadcastevent type = magic_moment_camera_over
endscript

script magic_moment_cam_add_screen_fx viewport = 0
	switch <fx>
		case dark
		kill name = S_Default_PH_SkyDome
		screenfx_addfxinstance {name = mmc_dof_near viewport = <viewport> type = dof on = 1 backdist = 0.1 frontdist = 0.08 strength = 1 blurradius = 6 blurresolution = half}
		screenfx_addfxinstance {name = mmc_dof_far viewport = <viewport> type = dof on = 1 backdist = 0.27 frontdist = 0.184 strength = 1 blurradius = 6 blurresolution = quarter}
		screenfx_addfxinstance {name = mmc_fog_near viewport = <viewport> type = fog on = 1 foregroundonly = 0 backdist = 0.13 frontdist = 0 strength = 0.584 color = [0 0 0 15]}
		screenfx_addfxinstance {name = mmc_fog_far viewport = <viewport> type = fog on = 1 foregroundonly = 0 backdist = 0.238 frontdist = 0.186 strength = 0.941 color = [0 0 0 15]}
	endswitch
endscript

script magic_moment_cam_remove_screen_fx viewport = 0
	if screenfx_fxinstanceexists viewport = <viewport> name = mmc_fog_near
		screenfx_removefxinstance viewport = <viewport> name = mmc_fog_near
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = mmc_fog_far
		screenfx_removefxinstance viewport = <viewport> name = mmc_fog_far
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = mmc_dof_near
		screenfx_removefxinstance viewport = <viewport> name = mmc_dof_near
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = mmc_dof_far
		screenfx_removefxinstance viewport = <viewport> name = mmc_dof_far
	endif
	forced_create name = S_Default_PH_SkyDome
endscript

script IsInCrib 
	if getpakmancurrentname \{map = zones}
		formattext checksumname = zone_name '%s' s = <pakname>
		if (<zone_name> = z_crib)
			return \{true}
		endif
	endif
	return \{false}
endscript

script goal_classic_viewport_create \{fov = 72.0}
	printstruct <...>
	goal_viewport_create {
		goal_string = 'goal_viewport'
		vport_scale = (0.8 * (16.0, 9.0))
		vport_pos = (250.0, 570.0)
		pos = <pos>
		quat = <quat>
		fov = <fov>
		appearance_priority = 3
	}
endscript

script goal_classic_viewport_kill 
	goal_viewport_kill \{all}
endscript

script BlockUntilObjectExists 
	begin
	if compositeobjectexists <name>
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script wait_for_script_to_finish 
	if scriptisrunning <name>
		begin
		wait \{1
			gameframe}
		if NOT scriptisrunning <name>
			break
		endif
		repeat
	endif
endscript

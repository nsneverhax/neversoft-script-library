story_splash_movie_common_params = {
	loop = 1
	start_frame = 1
	loop_start = 68
	loop_end = 107
}

script game_intro_control_start 
	goal_presentation_hold_skater
endscript

script game_intro_control_end 
	goal_presentation_unhold_skater
endscript

script game_intro_initial_cam 
	if ($game_progress_debug_active = 1)
		return
	endif
	begin
	hack_force_skater_to_be_stopped_for_sure
	wait 1 gameframe
	repeat 30
	if NOT (($intro_cutscene_soundbuss_active) = 1)
		pushsoundbussparams
		printpushpopdebuginfo push name = "game intro cutscene"
		setsoundbussparams $Cutscenes_No_Music_BussSet time = 0.2
		change intro_cutscene_soundbuss_active = 1
	endif
	game_intro_control_start
	enableusermusic disable
	igc_temporarily_disable_rendering 3 gameframes
	hideloadingscreen
	killallmovies blocking
	fadetoblack on z_priority = -1 alpha = 1 time = 0
	CutscenePauseMusicAndPlaylistTimer
	playmovie movie = 'intro' textureslot = 0 no_hold no_looping
	setglobalflag flag = $CAREER_INTRO_MOVIE_WATCHED
	wait 3 gameframes
	do_actual_pause
	unpausespawnedscript movie_subtitles_parse
	controllerdebounce x
	createscreenelement {
		id = career_intro_movie_handler
		type = containerelement
		parent = root_window
		event_handlers = [
			{pad_choose killallmovies params = {blocking}}
		]
	}
	launchevent type = focus target = career_intro_movie_handler
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat 2480
	if screenelementexists id = career_intro_movie_handler
		destroyscreenelement id = career_intro_movie_handler
	endif
	do_actual_unpause
	playigccam {
		name = game_intro_initial_igc_cam
		controlscript = game_intro_initial_cam_control
	}
endscript

script hack_force_skater_to_be_stopped_for_sure 
	pauseskaters
	skater :disableplayerinput
endscript

script game_intro_initial_cam_control 
	goal_presentation_move_skater pos = (382.7719, 4.0369, -297.7921)
	fadetoblack off alpha = 0 time = 0.2 no_wait
	ccam_domorph {
		lockto = world
		pos = (384.7172, 4.9950795, -293.279)
		quat = (0.00252, -0.9355729, 0.0066469996)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (385.77008, 4.649746, -297.59708)
		quat = (-0.050505, -0.72394794, -0.05332)
		fov = 72.0
		time = 2.0
	}
	ccam_waitmorph
	ccam_domorph {
		lockto = world
		pos = (383.42703, 5.467082, -300.48843)
		quat = (0.09675, -0.11247499, 0.010993)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat
	CutsceneUnPauseMusicAndPlaylistTimer
	enableusermusic
	if NOT (($intro_cutscene_soundbuss_active) = 0)
		printpushpopdebuginfo pop name = "popping out of intro cutscene"
		change intro_cutscene_soundbuss_active = 0
		wait 2 gameframes
		popsoundbussparams
		wait 0.2 seconds
	endif
	if NOT (($goal_presentation_sound_buss_set_active) = 1)
		change goal_presentation_sound_buss_set_active = 1
		printpushpopdebuginfo push name = "post intro first tony talk"
		pushsoundbussparams
		setsoundbussparams $Goal_Presentation_BussSet time = 0.1
	endif
	soundevent event = ms_phone_1
	goal_presentation_move_skater pos = (381.59888, 4.046, -292.0707)
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Talk to Rube to Rig up some stuff to skate."
	ccam_domorph {
		lockto = world
		pos = (386.32275, 9.8273535, -257.99887)
		quat = (0.019321999, -0.97469294, 0.093086)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (379.6947, 5.764621, -274.85828)
		quat = (0.017974999, -0.95381004, 0.058287002)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	ccam_domorph {
		lockto = world
		pos = (380.5048, 4.672046, -283.90668)
		quat = (-0.056150004, -0.45562002, -0.028813)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	goal_presentation_move_skater pos = (265.49747, 0.24830002, -239.9491)
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Talk to Bosco to do some Hardcore skating."
	ccam_domorph {
		lockto = world
		pos = (273.04706, 5.7226686, -238.08061)
		quat = (0.140184, -0.49959102, 0.08230899)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (266.07956, 2.555141, -234.34987)
		quat = (0.106414996, -0.51200694, 0.064104)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	ccam_domorph {
		lockto = world
		pos = (262.75867, 2.555141, -238.387)
		quat = (0.053976998, -0.060594, 0.0032819998)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	goal_presentation_move_skater pos = (394.14172, 0.21370001, -186.36911)
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Talk to Spencer about skating for a Career."
	ccam_domorph {
		lockto = world
		pos = (384.61652, 4.3225775, -192.33061)
		quat = (0.100763, 0.13406399, -0.0053749997)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (387.213, 2.348753, -183.02184)
		quat = (0.100763, 0.13406399, -0.0053749997)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	ccam_domorph {
		lockto = world
		pos = (394.1295, 1.6968472, -181.96396)
		quat = (0.031487998, -0.375976, 0.021655)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	goal_presentation_description_kill_text
	goal_presentation_move_skater pos = (382.7719, 4.0369, -297.7921) quat = (0.0, 0.0, -0.0)
	if (($goal_presentation_sound_buss_set_active) = 1)
		change goal_presentation_sound_buss_set_active = 0
		printpushpopdebuginfo pop name = "done with intro sequence"
		popsoundbussparams
		soundevent event = Music_Pitch_Fixer_Logic
	endif
	igc_temporarily_disable_rendering 3 gameframes
	igc_camera_movetoplayer time = 0.0
	ccam_waitmorph
	ui_progression_unlock_create title = "Intro to Style!" title_s = "Complete the 3 Skater Style Goals" descr_s = "Career (green)\\nRigger (purple)\\nHardcore (orange)"
	game_intro_control_end
	spawnscriptnow game_intro_instruction_tips
endscript

script game_intro_pre_training_cam 
	if ($game_progress_debug_active = 1)
		return
	endif
	begin
	if IsScreenClear
		break
	endif
	wait \{2
		gameframes}
	repeat
	playigccam \{name = game_intro_pre_training_igc_cam
		controlscript = game_intro_pre_training_cam_control}
endscript

script game_intro_pre_training_cam_control 
	game_intro_control_start
	if NOT (($goal_presentation_sound_buss_set_active) = 1)
		pushsoundbussparams
		setsoundbussparams $Generic_IGC_BussSet time = 0.1
		change goal_presentation_sound_buss_set_active = 1
	endif
	goal_presentation_move_skater pos = (382.68622, 4.0303, -275.6694)
	soundevent event = hawk_find_me
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Check it out, it's Tony Hawk!  Go talk with him."
	ccam_domorph {
		lockto = world
		pos = (360.76138, 11.676289, -273.43625)
		quat = (0.16064599, 0.41354498, -0.074387)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (373.47018, 6.1360574, -262.61978)
		quat = (0.14086, 0.440552, -0.070214)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	ccam_domorph {
		lockto = world
		pos = (375.68808, 5.853302, -263.3234)
		quat = (0.13926701, 0.012185, -0.001714)
		fov = 72.0
		time = 2.0
	}
	ccam_waitmorph
	ccam_domorph {
		lockto = world
		pos = (375.6355, 4.625462, -265.40152)
		quat = (-0.079651006, -0.01674, -0.001338)
		fov = 72.0
		time = 2.0
	}
	ccam_waitmorph
	goal_presentation_description_kill_text
	fadetoblack on alpha = 1 time = 0 z_priority = -100
	playmovie movie = 'TonyHawk' textureslot = 0 no_hold no_looping
	createscreenelement {
		type = containerelement
		parent = root_window
		id = tony_movie_handler
		event_handlers = [
			{pad_choose game_intro_kill_tony_movie}
		]
	}
	wait 5 gameframes
	launchevent target = tony_movie_handler type = focus
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframes
	repeat
	if screenelementexists id = tony_movie_handler
		destroyscreenelement id = tony_movie_handler
	endif
	goal_presentation_move_skater pos = (264.2261, 0.2485, -244.52101) quat = (0.0, 0.054300003, -0.0)
	if (($goal_presentation_sound_buss_set_active) = 1)
		change goal_presentation_sound_buss_set_active = 0
		popsoundbussparams
		soundevent event = Music_Pitch_Fixer_Logic
	endif
	ui_progression_unlock_create title = "TONY's Challenges" title_s = "Complete TONY's Introduction Challenges" descr_s = "Learn the BASIC's of the game!"
	fadetoblack off time = 0.25 no_wait
	game_intro_control_end
	spawnscriptlater ui_user_add_goal_waypoint params = {goal = m_training_grind_desc do_object_script_test = false}
endscript

script game_intro_kill_tony_movie 
	killallmovies
endscript

script post_training_cam 
	changenodeflag nodeflag_slums_training_grind 1
	changenodeflag nodeflag_slums_training_manual 1
	changenodeflag nodeflag_slums_chalk3 1
	changenodeflag nodeflag_slums_chalk4 1
	if NOT iscreated Z_Slums_dt_crib_glow
		if isinnodearray Z_Slums_dt_crib_glow
			create name = Z_Slums_dt_crib_glow
		endif
	endif
	if ($game_progress_debug_active = 0)
		playigccam {
			name = post_training_cam_igc_cam
			controlscript = post_training_cam_control
		}
		waitmovie name = post_training_cam_igc_cam
		post_training_teach_in_game_goal_menu
		game_intro_control_end
	endif
	goal_restore_all_peds
	setglobalflag flag = $CAREER_TRAINING_DONE
	goal_historical_trigger_create goal_id = m_r1_buildkick2
	goal_historical_trigger_create goal_id = m_h1_bigpush2
	goal_historical_trigger_create goal_id = m_c1_ntt
	goal_historical_trigger_create goal_id = m_training_grind do_init = false
	goal_historical_trigger_create goal_id = m_training_manual do_init = false
	goal_historical_trigger_create goal_id = m_training_qp2rail
	goal_historical_trigger_create goal_id = m_training_revman
	goal_historical_trigger_create goal_id = m_line_slums do_init = false
	if NOT iscreated Z_Slums_TRG_ghost_enter_crib
		if isinnodearray Z_Slums_TRG_ghost_enter_crib
			create name = Z_Slums_TRG_ghost_enter_crib
		endif
	endif
	do_autosave immediate
endscript

script post_training_cam_control 
	game_intro_control_start
	hide_all_hud_sprites
	if NOT (($goal_presentation_sound_buss_set_active) = 1)
		pushsoundbussparams
		setsoundbussparams $Generic_IGC_BussSet time = 0.1
		change goal_presentation_sound_buss_set_active = 1
	endif
	soundevent event = c_tutorial_igc_3_hawk_06_a
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Hey, it's a big world out there with a lot of possibilities."
	ccam_domorph {
		lockto = world
		pos = (390.3379, 25.099741, -257.8074)
		quat = (0.068559, -0.13887501, 0.0093829995)
		fov = 72.0
		time = 1.5
	}
	ccam_domorph {
		lockto = world
		pos = (390.3379, 25.099741, -257.8074)
		quat = (0.031969, -0.76162696, 0.037295)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	soundevent event = c_tutorial_igc_3_hawk_06_b
	goal_presentation_move_skater pos = (394.5529, 0.23820001, -193.0341)
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "You can work on your career by skating with Arto."
	ccam_domorph {
		lockto = world
		pos = (383.2125, 4.802724, -201.3478)
		quat = (0.06039, 0.150351, -0.00919)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (388.07812, 2.392314, -185.74794)
		quat = (0.11202199, 0.156963, -0.017912)
		fov = 72.0
		time = 2.5
	}
	ccam_waitmorph
	soundevent event = c_tutorial_igc_3_hawk_06_c
	goal_presentation_move_skater pos = (309.1444, -4.1822996, -86.0448)
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Continue going Hardcore with Mike V."
	ccam_domorph {
		lockto = world
		pos = (332.76642, 15.778511, -80.81163)
		quat = (0.185537, -0.70460695, 0.199771)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (301.68307, -2.529119, -78.770424)
		quat = (0.045746997, -0.82168096, 0.066606)
		fov = 72.0
		time = 2.5
	}
	ccam_waitmorph
	soundevent event = c_tutorial_igc_3_hawk_06_d
	goal_presentation_move_skater pos = (391.7477, 4.2235, -278.6995)
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Check in with your bud Rube to do some more Rigging stuff."
	ccam_domorph {
		lockto = world
		pos = (379.52316, 7.534005, -276.63364)
		quat = (0.036832996, 0.948218, -0.119565)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (385.80408, 5.6039076, -289.12448)
		quat = (0.023498999, 0.9316969, -0.061226998)
		fov = 72.0
		time = 3.0
	}
	ccam_waitmorph
	soundevent event = c_tutorial_igc_3_hawk_06_e
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "Go through here anytime to hang out in your Skate Lounge."
	ccam_domorph {
		lockto = world
		pos = (377.52228, 8.685271, -263.03232)
		quat = (0.001328, 0.99751604, -0.023783002)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (381.77966, 7.1515923, -294.91696)
		quat = (-0.00072099996, 0.99908596, 0.011387)
		fov = 72.0
		time = 3.5
	}
	ccam_waitmorph
	soundevent event = c_tutorial_igc_3_hawk_06_f
	goal_presentation_description_kill_text
	goal_presentation_description_text text = "And you can always focus on more street challenges like I showed you.  Good luck kid."
	ccam_domorph {
		lockto = world
		pos = (270.7414, 4.6841364, -179.72058)
		quat = (0.052749, 0.87846106, -0.100370996)
		fov = 72.0
	}
	ccam_domorph {
		lockto = world
		pos = (293.4843, 4.2736626, -195.8858)
		quat = (0.064657, 0.863393, -0.11515801)
		fov = 72.0
		time = 4.0
	}
	ccam_waitmorph
	goal_presentation_description_kill_text
	if (($goal_presentation_sound_buss_set_active) = 1)
		change goal_presentation_sound_buss_set_active = 0
		popsoundbussparams
		soundevent event = Music_Pitch_Fixer_Logic
	endif
	soundevent event = medal_am_sfx
	ui_progression_unlock_create title = "DEFINE YOURSELF!" title_s = "Time to get SPONSORED" descr_s = "Choose your path as a Skater!"
	game_intro_control_start
	soundevent event = Crowd_Ped_AI_CheerLand_MEDIUM
	ui_game_area_unlocked game_area = philly_downtown pause = false
	soundevent event = medal_am_sfx
	goal_presentation_subtitled_movie movie = $Story_Menu_Video do_pause = false
	goal_presentation_move_skater pos = (375.9417, 0.24920002, -217.3608) quat = (0.0, 0.2073, -0.0)
	game_intro_control_end
	spawnscriptnow game_story_menu_instruction_tips
endscript

script post_training_teach_in_game_goal_menu 
	printf 'post_training_teach_in_game_goal_menu'
	return
	kill_r3_binding
	skater :killskater no_node
	skater :disableplayerinput
	kill_start_key_binding
	if screenelementexists id = r3_event_listener_anchor
		destroyscreenelement id = r3_event_listener_anchor
	endif
	createscreenelement {
		id = r3_event_listener_anchor
		type = containerelement
		parent = root_window
		event_handlers = [
			{pad_r3 r3_event_listener_script}
		]
	}
	launchevent type = focus target = r3_event_listener_anchor
	ui_display_message type = uberalert text = "Press \\bm to enter the\\nStory Menu\\nto find the next goal!" time = 10000
	block type = pad_r3_handled
	printf 'pad_r3_handled'
	fadetoblack off time = 0
	skater :enableplayerinput
	restore_start_key_binding
	ui_kill_message_hack id = ui_alert_uber
	change ui_cannot_restore_r3 = false
	restore_r3_binding
	goal_in_game_episode_menu
	ui_display_message type = uberalert text = "\\b7/\\b4 to select options\\n\\n\\m0 to choose" time = 0.5
endscript

script r3_event_listener_script 
	launchevent \{broadcast
		type = pad_r3_handled}
	die
endscript

script game_intro_instruction_tips 
	wait \{1.0
		seconds
		ignoreslomo}
	ui_display_message \{type = instruction
		text = "Hold (\\b3) to skate and release it to do an Ollie\\nUse (\\bk) to steer"
		time = 10}
endscript

script game_story_menu_instruction_tips 
	wait \{1.0
		seconds
		ignoreslomo}
	ui_display_message \{type = instruction
		text = "Press \\bm to bring up your in-game STORY MENU"
		time = 10}
endscript

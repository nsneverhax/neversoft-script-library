
script game_progress_register_atomic_structure 
	careerfunc func = registeratomicstructure params = {
		[
			{
				name = set_initial_states
				type = scr
				atom_script = chapter_1_startup
			}
			{
				name = game_intro_initial_cam_atom
				type = scr
				atom_script = game_intro_initial_cam
				depends_on = [
					{
						type = globalflag
						flags = [CAREER_STARTED_FROM_MAINMENU]
					}
					{
						type = zone
						zone = z_slums
					}
				]
			}
			{
				name = pre_training_goals_atom
				type = goal
				atom_goals = [
					m_c1_ntt
					m_h1_bigpush2
					m_r1_buildkick2
				]
				ui_params = {
					debug_menu_text = "pre-training goals (ntt, bigpush, buildkick)"
				}
			}
			{
				name = game_intro_pre_training_cam_atom
				type = scr
				atom_script = game_intro_pre_training_cam
				depends_on = [
					{
						type = atom
						atom = pre_training_goals_atom
					}
				]
			}
			{
				name = m_training_grind_desc_atom
				type = goal
				atom_goal = m_training_grind_desc
				depends_on = [
					{
						type = atom
						atom = pre_training_goals_atom
					}
				]
			}
			{
				name = m_training_grind_atom
				type = goal
				atom_goal = m_training_grind
				depends_on = [
					{
						type = atom
						atom = m_training_grind_desc_atom
					}
				]
			}
			{
				name = m_training_manual_desc_atom
				type = goal
				atom_goal = m_training_manual_desc
				depends_on = [
					{
						type = atom
						atom = m_training_grind_atom
					}
				]
			}
			{
				name = m_training_manual_atom
				type = goal
				atom_goal = m_training_manual
				depends_on = [
					{
						type = atom
						atom = m_training_manual_desc_atom
					}
				]
			}
			{
				name = m_training_qp2rail_desc_atom
				type = goal
				atom_goal = m_training_qp2rail_desc
				depends_on = [
					{
						type = atom
						atom = m_training_manual_atom
					}
				]
			}
			{
				name = m_training_qp2rail_atom
				type = goal
				atom_goal = m_training_qp2rail
				depends_on = [
					{
						type = atom
						atom = m_training_qp2rail_desc_atom
					}
				]
			}
			{
				name = m_training_revman_desc_atom
				type = goal
				atom_goal = m_training_revman_desc
				depends_on = [
					{
						type = atom
						atom = m_training_qp2rail_atom
					}
				]
			}
			{
				name = m_training_revman_atom
				type = goal
				atom_goal = m_training_revman
				depends_on = [
					{
						type = atom
						atom = m_training_revman_desc_atom
					}
				]
			}
			{
				name = m_training_line_desc_atom
				type = goal
				atom_goal = m_training_line_desc
				depends_on = [
					{
						type = atom
						atom = m_training_revman_atom
					}
				]
			}
			{
				name = m_training_line_atom
				type = goal
				atom_goal = m_line_slums
				depends_on = [
					{
						type = atom
						atom = m_training_line_desc_atom
					}
				]
			}
			{
				name = post_training_cam_atom
				type = scr
				atom_script = post_training_cam
				depends_on = [
					{
						type = globalflag
						flags = [
							CAREER_CAREER_TRACK_INITIALIZED
							CAREER_RIGGER_TRACK_INITIALIZED
							CAREER_HARDCORE_TRACK_INITIALIZED
						]
						state = active
					}
				]
			}
			{
				name = enable_video_editor_submit_atom
				type = scr
				atom_script = set_global_flags
				atom_params = {flags = [VIDEO_EDIT_SUBMIT_ENABLED]}
				depends_on = [
					{
						type = goal
						goal = m_line_slums
					}
				]
			}
			{
				name = arcade_slums_atom
				type = goal
				atom_goals = [
					m_arcade_slums
					m_chalk3_slums
					m_chalk4_slums
					m_photo_natas_slums
					m_photo_spine_pb_bridge
					m_photo_cannon_museums
					m_race_slums
					m_race_love
					m_race_harbor
					m_race_museums
				]
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
				]
			}
			{
				name = m_c1
				type = goaltrack
				atom_goal_track = m_c1
				atom_goal_order = [
					m_c1_invite
					m_c1_impress
					m_c1_demo
					m_c1_practice1
					m_c1_film1
					m_c1_film3
					m_c1_film2
					m_c1_finaloutro
				]
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_c1 track"
				}
			}
			{
				name = m_c1_ntt_atoms
				type = goal
				atom_goals = [
					m_film_ntt_harbor
					m_film_ntt_love
					m_photo_ntt_museums
					m_photo_ntt_slums
				]
				depends_on = [
					{
						type = goal
						goal = m_c1_ntt
					}
					{
						type = atom
						atom = m_training_line_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_c1_ntt_atoms"
				}
			}
			{
				name = m_c1_demo_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Demo Nailed!"
						audio = ms_phone_c_demo_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_c1_demo
					}
				]
				ui_params = {
					debug_menu_text = "milestone: m_c1_demo Msg"
				}
			}
			{
				name = m_c1_finaloutro_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Sweet video!"
						audio = ms_phone_c_video_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_c1_finaloutro
					}
				]
				ui_params = {
					debug_menu_text = "milestone: m_c1_finaloutro Msg"
				}
			}
			{
				name = m_c2_revman_atom
				type = goal
				atom_goal = m_c2_revman
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_c1_demo
					}
				]
			}
			{
				name = m_c2_unlocked_atom
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "New Career Story: Competitions!"
					title_s = "Pros: Bob Burnquist & Ryan Sheckler"
					descr_s = "Meet Bob Burnquist in Baltimore Inner Harbor."
					show_current_episode = 1
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_c1_demo
					}
				]
			}
			{
				name = newstory_C2
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'newstory_c2'
				}
				depends_on = [
					{
						type = atom
						atom = m_c2_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "newstory: C2"
				}
			}
			{
				name = bob_intro_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Bob"
						message = "Competitions!"
						audio = ms_phone_bob_intro
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = atom
						atom = m_c2_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Half-Team Built"
				}
			}
			{
				name = m_c2
				type = goaltrack
				atom_goal_track = m_c2
				atom_goal_order = [
					m_c2_ntg
					m_c2_localcomp
					m_c2_compstreet
					m_c2_compvert
					m_c2_comppark
				]
				depends_on = [
					{
						type = atom
						atom = m_c2_revman_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_c2 track"
				}
			}
			{
				name = m_c2_ntg_atoms
				type = goal
				atom_goals = [
					m_film_ntg_bcity
					m_film_ntg_museums
					m_photo_ntg_bw_bridge
					m_photo_ntg_lansdowne
				]
				depends_on = [
					{
						type = goal
						goal = m_c2_ntg
					}
				]
				ui_params = {
					debug_menu_text = "m_c2_ntg_atoms"
				}
			}
			{
				name = m_c2_ntg_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_transworld
					title = "Transworld Magazine's NTG photo/film opt!"
					title_s = "New Street Goals"
					descr_s = "High Altitude Grab\\nNail the Art\\nBridging the Grab\\nGrab Lansdowne"
				}
				depends_on = [
					{
						type = goal
						goal = m_c2_ntg
					}
				]
			}
			{
				name = m_c2_localcomp_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Don't Stress"
						audio = ms_phone_c_lansd_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_c2_localcomp
					}
				]
				ui_params = {
					debug_menu_text = "milestone: m_c1_localcomp Msg"
				}
			}
			{
				name = m_c2_comppark_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "King of comps!"
						audio = ms_phone_c_tricity_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_c2_comppark
					}
				]
				ui_params = {
					debug_menu_text = "milestone: m_c2_comppark Msg"
				}
			}
			{
				name = m_c3_mel_atom
				type = goal
				atom_goal = m_c3_photo2
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_c1_demo
					}
				]
				ui_params = {
					debug_menu_text = "m_c3 track"
				}
			}
			{
				name = m_c3_unlocked_atom
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "New Career Story: Photo Shoots!"
					title_s = "Pro: Stevie Williams"
					descr_s = "Meet your friend Mel in Downtown Philly"
					show_current_episode = 1
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_c1_demo
					}
				]
			}
			{
				name = newstory_C3
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'newstory_c3'
				}
				depends_on = [
					{
						type = atom
						atom = m_c3_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "newstory: C3"
				}
			}
			{
				name = m_c3
				type = goaltrack
				atom_goal_track = m_c3
				atom_goal_order = [
					m_c3_photosession
					m_c3_photothemed
					m_c3_epicphoto1
					m_c3_epicphoto2
					m_c3_epicphoto3
					m_c3_epicphoto4
					m_c3_finaloutro
				]
				depends_on = [
					{
						type = atom
						atom = m_c3_mel_atom
					}
				]
			}
			{
				name = m_c3_epicphoto4_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Mag cover!"
						audio = ms_phone_c_cover_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_c3_epicphoto4
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Epicphoto4 Msg"
				}
			}
			{
				name = m_c3_photothemed_atoms
				type = goal
				atom_goals = [
					m_film_ntm_slums
					m_photo_ntm_harbor
					m_photo_ntm_wp_bridge
					m_film_ntm_monuments
				]
				depends_on = [
					{
						type = goal
						goal = m_c3_photothemed
					}
				]
				ui_params = {
					debug_menu_text = "m_c3_photothemed_atoms"
				}
			}
			{
				name = m_c3_photothemed_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Nice Shots."
						audio = ms_phone_c_mag_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_c3_photothemed
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Photothemed Msg"
				}
			}
			{
				name = m_c3_photothemed_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_transworld
					title = "Transworld Magazine's NTM photo/film opt!"
					title_s = "New Street Goals"
					descr_s = "Nail the Tracks\\nStairway Ollie Photo\\nMetro Manual\\nMonuments\\_Ledge\\_Manual"
				}
				depends_on = [
					{
						type = goal
						goal = m_c3_photothemed
					}
				]
			}
			{
				name = career_uber_message_atom
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Career UBER goal!"
						audio = ms_phone_cu_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = atom
						atoms = [m_c1 m_c2 m_c3]
					}
				]
			}
			{
				name = career_uber_atom
				type = goal
				atom_goal = m_cu
				depends_on = [
					{
						type = atom
						atoms = [career_uber_message_atom]
					}
				]
			}
			{
				name = uber_complete_career
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'Montage'
					unlock_flag = $MOVIE_UNLOCK_Montage
				}
				depends_on = [
					{
						type = goal
						goal = m_cu
					}
				]
				ui_params = {
					debug_menu_text = "Montage movie play and unlock"
				}
			}
			{
				name = m_h1
				type = goaltrack
				atom_goal_track = m_h1
				atom_goal_order = [
					m_h1_bigspines
					m_h1_epicdrop
					m_h1_cribcut
					m_h1_boostpull
					m_h1_skitchboost
					m_h1_finalepic
					m_h1_finalepic_outro
				]
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_h1 track"
				}
			}
			{
				name = m_h1_bigpush2_atoms
				type = goal
				atom_goals = [
					m_film_push_harbor
					m_film_push_love
					m_photo_push_bwb
					m_photo_push_fdr
				]
				depends_on = [
					{
						type = goal
						goal = m_h1_bigpush2
					}
					{
						type = atom
						atom = m_training_line_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_h1_bigpush2_atoms"
				}
			}
			{
				name = m_h1_finalepic_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Internet vid."
						audio = ms_phone_h_vidzine_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_h1_finalepic
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Finalepic Msg"
				}
			}
			{
				name = m_h2
				type = goaltrack
				atom_goal_track = m_h2
				atom_goal_order = [
					m_h2_boneless
					m_h2_learncheck
					m_h2_takefdr
					m_h2_clearbcity
					m_h2_clearmuseums
					m_h2_bossbattle
				]
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_h1_epicdrop
					}
				]
				ui_params = {
					debug_menu_text = "m_h2 track"
				}
			}
			{
				name = m_h2_unlocked_atom
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "New Hardcore Story: Take Back FDR!"
					title_s = "Pro: Dustin Dollin"
					descr_s = "Meet Dustin in Inner-City Philly by FDR."
					show_current_episode = 1
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_h1_cribcut
					}
				]
			}
			{
				name = newstory_H2
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'newstory_h2'
				}
				depends_on = [
					{
						type = atom
						atom = m_h2_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "newstory: h2"
				}
			}
			{
				name = m_h2_learncheck_atoms
				type = goal
				atom_goals = [
					m_photo_check_fdr
					m_photo_check_monuments
					m_photo_check_pb_bridge
					m_photo_check_bell
				]
				depends_on = [
					{
						type = goal
						goal = m_h2_learncheck
					}
				]
				ui_params = {
					debug_menu_text = "m_h2_learncheck_atoms"
				}
			}
			{
				name = m_h2_learncheck_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_slap_magazine
					title = "Slap Magazine's Skate Check photo opt!"
					title_s = "New Street Goals"
					descr_s = "Can He Fly?\\nCheck the Guards\\nMan Overboard\\nGet 'em Wet!"
				}
				depends_on = [
					{
						type = goal
						goal = m_h2_learncheck
					}
				]
			}
			{
				name = m_h2_takefdr_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Nice work."
						audio = ms_phone_h_fdr_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_h2_takefdr
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Takefdr Msg"
				}
			}
			{
				name = change_fdr_tags_atom
				type = scr
				atom_script = change_fdr_tags
				depends_on = [
					{
						type = goal
						goal = m_h2_bossbattle
					}
				]
			}
			{
				name = m_h2_bossbattle_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "FDR is free"
						audio = ms_phone_h_thugs_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_h2_bossbattle
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Bossbattle Msg"
				}
			}
			{
				name = m_h3_maddog_atom
				type = goal
				atom_goal = m_h3_ntb
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_h1_cribcut
					}
				]
				ui_params = {
					debug_menu_text = "m_h3 track"
				}
			}
			{
				name = m_h3_unlocked_atom
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "New Hardcore Story: Skating Bowls!"
					title_s = "Pro: Lance Mountain"
					descr_s = "Meet Lance in Downtown Baltimore."
					show_current_episode = 1
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_h1_cribcut
					}
				]
			}
			{
				name = newstory_H3
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'newstory_h3'
				}
				depends_on = [
					{
						type = atom
						atom = m_h3_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "newstory: h3"
				}
			}
			{
				name = m_h1_epicdrop_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "7-Ply"
						audio = ms_phone_h_zine_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = atom
						atom = newstory_H3
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Epicdrop Msg"
				}
			}
			{
				name = m_h3
				type = goaltrack
				atom_goal_track = m_h3
				atom_goal_order = [
					m_h3_bowlcomp
					m_h3_wallrides
					m_h3_secret1
					m_h3_secret2
				]
				depends_on = [
					{
						type = atom
						atom = m_h3_maddog_atom
					}
				]
			}
			{
				name = m_h3_ntb_atoms
				type = goal
				atom_goals = [
					m_film_bowl_bcity
					m_film_bowl_museums
					m_photo_bowl_harbor
					m_photo_bowl_monuments
				]
				depends_on = [
					{
						type = goal
						goal = m_h3_ntb
					}
				]
				ui_params = {
					debug_menu_text = "m_h3_ntb_atoms"
				}
			}
			{
				name = m_h3_ntb_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_slap_magazine
					title = "Slap Magazine's Bowl Skating photo/film opt!"
					title_s = "New Street Goals"
					descr_s = "Slash Grinding Away\\nLet's go Bowling\\nSlash Grind Pictorial\\nHigh Carve"
				}
				depends_on = [
					{
						type = goal
						goal = m_h3_ntb
					}
				]
			}
			{
				name = m_h3_bowlcomp_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Bowlrider!"
						audio = ms_phone_h_quik_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_h3_bowlcomp
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Bossbattle Msg"
				}
			}
			{
				name = m_h3_secret2_pager_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Eddie owned!"
						audio = ms_phone_h_bowl_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_h3_secret2
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Eddie X Msg"
				}
			}
			{
				name = hardcore_uber_message_atom
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Hardcore UBER goal!"
						audio = ms_phone_hu_01
					}
				}
				depends_on = [
					{
						type = atom
						atoms = [m_h1 m_h2 m_h3]
					}
				]
			}
			{
				name = hardcore_uber_atom
				type = goal
				atom_goal = m_hu
				depends_on = [
					{
						type = atom
						atoms = [hardcore_uber_message_atom]
					}
				]
			}
			{
				name = hardcore_uber_outro_atom
				type = goal
				atom_goal = m_hu_outro
				depends_on = [
					{
						type = goal
						goal = m_hu
					}
				]
			}
			{
				name = uber_complete_hardcore
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'bails2'
					unlock_flag = $MOVIE_UNLOCK_Bails2
				}
				depends_on = [
					{
						type = goal
						goal = m_hu_outro
					}
				]
				ui_params = {
					debug_menu_text = "bails2 movie play and unlock"
				}
			}
			{
				name = m_r1_postvid_atom
				type = goal
				atom_goal = m_r1_postvid
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
				]
			}
			{
				name = m_r1
				type = goaltrack
				atom_goal_track = m_r1
				atom_goal_order = [
					m_r1_buildqp
					m_r1_demo
					m_r1_buildspine
					m_r1_showdown
				]
				depends_on = [
					{
						type = atom
						atom = m_r1_postvid_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_r1 track"
				}
			}
			{
				name = m_r1_demo_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "innovation."
						audio = ms_phone_r_demo_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_r1_demo
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Rigger Demo Msg"
				}
			}
			{
				name = m_r1_showdown_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Showdown."
						audio = ms_phone_r_showdn_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_r1_showdown
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Showdown Msg"
				}
			}
			{
				name = m_r1_buildspine_atoms
				type = goal
				atom_goals = [
					m_film_rig_mall
					m_film_rig_slums
					m_photo_rig_harbor
					m_photo_rig_love
				]
				depends_on = [
					{
						type = goal
						goal = m_r1_buildspine
					}
					{
						type = atom
						atom = m_training_line_atom
					}
				]
				ui_params = {
					debug_menu_text = "m_r1_buildspine_atoms"
				}
			}
			{
				name = m_r1_buildspine_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_focus_magazine
					title = "Focus Magazine's Rigging photo/film opt!"
					title_s = "New Street Goals"
					descr_s = "Capitol Rig\\nRig the Rooftop\\nRig the Anchor\\nTHPS Rig Photo"
				}
				depends_on = [
					{
						type = goal
						goal = m_r1_buildspine
					}
				]
			}
			{
				name = m_r2
				type = goaltrack
				atom_goal_track = m_r2
				atom_goal_order = [
					m_r2_climb
					m_r2_breakin
					m_r2_skateoff
					m_r2_show1
					m_r2_show2
				]
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_r1_demo
					}
				]
				ui_params = {
					debug_menu_text = "m_r2 track"
				}
			}
			{
				name = m_r2_unlocked_atom
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "New Rigger Story: Messin' with Bam!"
					title_s = "Pro: Bam Margera"
					descr_s = "Meet your friend Shane in Downtown Baltimore."
					show_current_episode = 1
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_r1_demo
					}
				]
			}
			{
				name = newstory_R2
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'newstory_r2'
				}
				depends_on = [
					{
						type = atom
						atom = m_r2_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "newstory: r2"
				}
			}
			{
				name = m_r2_climb_atoms
				type = goal
				atom_goals = [
					m_photo_climb_pb_bridge
					m_photo_climb_monuments
					m_film_climb_bcity
					m_film_climb_slums
				]
				depends_on = [
					{
						type = goal
						goal = m_r2_climb
					}
				]
				ui_params = {
					debug_menu_text = "m_r2_climb_atoms"
				}
			}
			{
				name = m_r2_climb_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_focus_magazine
					title = "Focus Magazine's Climbing photo/film opt!"
					title_s = "New Street Goals"
					descr_s = "The Helipad\\nThe Drop\\nWindow Washing Trick\\nSlum Diving"
				}
				depends_on = [
					{
						type = goal
						goal = m_r2_climb
					}
				]
			}
			{
				name = m_r2_skateoff_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Breakin in"
						audio = ms_phone_r_cash_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_r2_skateoff
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Skateoff Msg"
				}
			}
			{
				name = m_r2_show2_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "TV star."
						audio = ms_phone_r_show_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_r2_show2
					}
				]
				ui_params = {
					debug_menu_text = "milestone: TV show Msg"
				}
			}
			{
				name = m_r3
				type = goaltrack
				atom_goal_track = m_r3
				atom_goal_order = [
					m_r3_museums
					m_r3_monuments
					m_r3_harbor
					m_r3_slums
					m_r3_love
					m_r3_bell
				]
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_r1_demo
					}
				]
				ui_params = {
					debug_menu_text = "m_r3 track"
				}
			}
			{
				name = m_r3_unlocked_atom
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "New Rigger Story: Mod the World!"
					title_s = "Pros: Daewon Song, Rodney Mullen, Vanessa Torres"
					descr_s = "Meet Daewon at the DC National Mall."
					show_current_episode = 1
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
					{
						type = goal
						goal = m_r1_demo
					}
				]
			}
			{
				name = newstory_R3
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'newstory_r3'
				}
				depends_on = [
					{
						type = atom
						atom = m_r3_unlocked_atom
					}
				]
				ui_params = {
					debug_menu_text = "newstory: r3"
				}
			}
			{
				name = m_r3_museums_atoms
				type = goal
				atom_goals = [
					m_photo_mod_museums
					m_photo_mod_wp_bridge
					m_film_mod_harbor
					m_film_mod_monuments
				]
				depends_on = [
					{
						type = goal
						goal = m_r3_museums
					}
				]
				ui_params = {
					debug_menu_text = "m_r3_museums_atoms"
				}
			}
			{
				name = m_r3_museums_message
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					sponsor = HUD_focus_magazine
					title = "Focus Magazine's Mod Spot photo/film opt!"
					title_s = "New Street Goals"
					descr_s = "Banner Rig\\nSubway Wallride Photo\\nThe Awning Grind\\nRig the Sign"
				}
				depends_on = [
					{
						type = goal
						goal = m_r3_museums
					}
				]
			}
			{
				name = m_r3_harbor_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Rigging."
						audio = ms_phone_r_righalf_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_r3_harbor
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Half Rig Msg"
				}
			}
			{
				name = m_r3_bell_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Focus mag."
						audio = ms_phone_r_rigall_01
						priority_message = 5
					}
				}
				depends_on = [
					{
						type = goal
						goal = m_r3_bell
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Rigall Msg"
				}
			}
			{
				name = rigger_uber_message_atom
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Rigger UBER goal!"
						audio = ms_phone_ru_01
					}
				}
				depends_on = [
					{
						type = atom
						atoms = [m_r1 m_r2 m_r3]
					}
				]
			}
			{
				name = rigger_uber_atom
				type = goal
				atom_goal = m_ru
				depends_on = [
					{
						type = atom
						atoms = [rigger_uber_message_atom]
					}
				]
			}
			{
				name = uber_complete_rigger
				type = scr
				atom_script = game_atoms_movie_call
				atom_params = {
					moviename = 'bails1'
					unlock_flag = $MOVIE_UNLOCK_Bails1
					bg_music = 0
				}
				depends_on = [
					{
						type = goal
						goal = m_ru
					}
				]
				ui_params = {
					debug_menu_text = "bails1 movie play and unlock"
				}
			}
			{
				name = half_am_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Getting Noticed!"
						career_audio = ms_phone_am1_c_01
						hardcore_audio = ms_phone_am1_h_01
						rigger_audio = ms_phone_am1_r_01
						audio = ms_phone_am1_m_01
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_half_am_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Half-Am Msg"
				}
			}
			{
				name = made_am_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Sponsor Congrats!"
						career_audio = ms_phone_am2_c_01
						hardcore_audio = ms_phone_am2_h_01
						rigger_audio = ms_phone_am2_r_01
						audio = ms_phone_am2_m_01
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_am_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Made Am Msg"
				}
			}
			{
				name = milestone_am
				type = milestone
				atom_effects = $milestone_am_effects
				depends_on = [
					{
						type = atom
						atom = made_am_message
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Am"
				}
			}
			{
				name = ach_sk9_milestone_am
				type = scr
				atom_script = nullscript
				atom_params = {
					achievement
				}
				depends_on = [
					{
						type = atom
						atom = milestone_am
					}
				]
			}
			{
				name = sponsor_check1_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 1000
					type = Clothing_Accessories
					written_cash_text = "One thousand dollars and zero cents"
					show_explanation = 1
				}
				depends_on = [
					{
						type = globalflag
						flag = MILESTONE_GOT_UI_AM
					}
					{
						type = atom
						atom = ach_sk9_milestone_am
					}
				]
			}
			{
				name = join_team_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Join a Team!"
					title_s = "Time to get on a real Team!"
					descr_s = "The biggest choice you'll have to make as a skater - who do you ride for? You'll have to earn it first, though."
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check1_atom
					}
				]
			}
			{
				name = half_pro_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Teams are looking!"
						career_audio = ms_phone_pro1_c_01
						hardcore_audio = ms_phone_pro1_h_01
						rigger_audio = ms_phone_pro1_r_01
						audio = ms_phone_pro1_m_01
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_half_pro_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Half-Pro Msg"
				}
			}
			{
				name = made_pro_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Joined a Team!"
						career_audio = ms_phone_pro2_c_01
						hardcore_audio = ms_phone_pro2_h_01
						rigger_audio = ms_phone_pro2_r_01
						audio = ms_phone_pro2_m_01
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_pro_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Made Pro Msg"
				}
			}
			{
				name = milestone_pro
				type = milestone
				atom_effects = $milestone_pro_effects
				depends_on = [
					{
						type = atom
						atom = made_pro_message
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Pro"
				}
			}
			{
				name = ach_sk9_milestone_pro
				type = scr
				atom_script = nullscript
				atom_params = {
					achievement
				}
				depends_on = [
					{
						type = atom
						atom = milestone_pro
					}
				]
			}
			{
				name = sponsor_check2_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 2000
					type = deck
					written_cash_text = "Two thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = globalflag
						flag = MILESTONE_GOT_UI_PRO
					}
					{
						type = atom
						atom = milestone_pro
					}
				]
			}
			{
				name = shoe_sponsor_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Shoe Sponsor"
					title_s = "Get noticed by the Shoe companies!"
					descr_s = "Every good pro deserves a shoe sponsor. Go earn yours."
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check2_atom
					}
				]
			}
			{
				name = milestone_shoes
				type = milestone
				atom_effects = $milestone_shoes_effects
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_shoes_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Shoes"
				}
			}
			{
				name = sponsor_check3_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 5000
					type = Shoe
					written_cash_text = "Five thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = globalflag
						flag = MILESTONE_GOT_UI_SHOE
					}
					{
						type = atom
						atom = milestone_shoes
					}
				]
			}
			{
				name = sig_deck_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Signature Deck"
					title_s = "Get a Signature Deck!"
					descr_s = "Get your Team to believe you deserve your own personalized deck!"
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check3_atom
					}
				]
			}
			{
				name = got_deck_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Your own deck!"
						audio = ms_phone_deck_01
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_deck_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Got Deck Msg"
				}
			}
			{
				name = milestone_deck
				type = milestone
				atom_effects = $milestone_deck_effects
				depends_on = [
					{
						type = atom
						atom = got_deck_message
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Got Personal Deck"
				}
			}
			{
				name = ach_sk9_milestone_deck
				type = scr
				atom_script = nullscript
				atom_params = {
					achievement
				}
				depends_on = [
					{
						type = atom
						atom = milestone_deck
					}
				]
			}
			{
				name = sponsor_check4_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 10000
					type = deck
					written_cash_text = "Ten thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = globalflag
						flag = MILESTONE_GOT_UI_DECK
					}
					{
						type = atom
						atom = milestone_deck
					}
				]
			}
			{
				name = sig_shoes_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Signature Shoes"
					title_s = "Get a Signature Shoe!"
					descr_s = "Time to show your shoe sponsor that you've got enough style for them to give you your own shoe."
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check4_atom
					}
				]
			}
			{
				name = got_shoe_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Tony"
						message = "Your own shoe!"
						audio = ms_phone_shoe_01
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_shoes_sig_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Got Shoes Msg"
				}
			}
			{
				name = milestone_shoes_sig
				type = milestone
				atom_effects = $milestone_shoes_sig_effects
				depends_on = [
					{
						type = atom
						atom = got_shoe_message
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Got Personal Shoes"
				}
			}
			{
				name = ach_sk9_milestone_shoe
				type = scr
				atom_script = nullscript
				atom_params = {
					achievement
				}
				depends_on = [
					{
						type = atom
						atom = milestone_shoes_sig
					}
				]
			}
			{
				name = sponsor_check5_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 25000
					type = Shoe
					written_cash_text = "twenty five thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = globalflag
						flag = MILESTONE_GOT_UI_SIG
					}
					{
						type = atom
						atom = milestone_shoes_sig
					}
				]
			}
			{
				name = start_team_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Start a TEAM"
					title_s = "Start your own TEAM!"
					descr_s = "Your deck sponsor will have faith in you if you keep rippin it up. Go show them you have enough style to head your own team!"
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check5_atom
					}
				]
			}
			{
				name = start_team_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Andrew"
						message = "Start a Team!"
						audio = ms_phone_start_team
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = $milestone_start_team_percent
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Start a Team Msg"
				}
			}
			{
				name = milestone_start_team
				type = milestone
				atom_effects = $milestone_start_team_effects
				depends_on = [
					{
						type = atom
						atom = start_team_message
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Start Team"
				}
			}
			{
				name = ach_sk9_milestone_team_start
				type = scr
				atom_script = nullscript
				atom_params = {
					achievement
				}
				depends_on = [
					{
						type = atom
						atom = milestone_start_team
					}
				]
			}
			{
				name = sponsor_check6_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 50000
					type = deck
					written_cash_text = "fifty thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = globalflag
						flag = MILESTONE_GOT_UI_TEAM
					}
					{
						type = atom
						atom = milestone_start_team
					}
				]
			}
			{
				name = build_team_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Build Your Team!"
					title_s = "Go find Pros for your TEAM!"
					descr_s = "Go impress any of the pros whose story you've completed."
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check6_atom
					}
				]
			}
			{
				name = half_team_built_message
				type = pagermessage
				atom_params = {
					text = {
						from = "Andrew"
						message = "Half TEAM BUILT!"
						audio = ms_phone_team_half
						priority_message = 10
					}
				}
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = 52
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Half-Team Built"
				}
			}
			{
				name = m_impress_c1_atom
				type = goal
				atom_goal = m_impress_c1
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_c1]
					}
				]
			}
			{
				name = m_impress_c1_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Arto Saari on your team!"
					title_s = "Impress Arto Saari"
					descr_s = "Look for Arto Saari in Baltimore Inner Harbor."
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_c1_atom
						state = active
					}
				]
			}
			{
				name = m_impress_c2_atom
				type = goal
				atom_goal = m_impress_c2
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_c2]
					}
				]
			}
			{
				name = m_impress_c2_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Bob Burnquist on your team!"
					title_s = "Impress Bob Burnquist"
					descr_s = "Look for Bob Burnquist in Baltimore Lansdowne."
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_c2_atom
						state = active
					}
				]
			}
			{
				name = m_impress_c3_atom
				type = goal
				atom_goal = m_impress_c3
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_c3]
					}
				]
			}
			{
				name = m_impress_c3_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Stevie Williams on your team!"
					title_s = "Impress Stevie Williams"
					descr_s = "Look for Stevie Williams in Downtown Baltimore."
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_c3_atom
						state = active
					}
				]
			}
			{
				name = m_impress_h1_atom
				type = goal
				atom_goal = m_impress_h1
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_h1]
					}
					{
						type = scr
						scr = are_impress_h1_game_areas_unlocked
					}
				]
			}
			{
				name = m_impress_h1_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Mike V. on your team!"
					title_s = "Impress Mike V."
					descr_s = "Look for Mike V. in Inner-city Philly."
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_h1_atom
						state = active
					}
				]
			}
			{
				name = m_impress_h2_atom
				type = goal
				atom_goal = m_impress_h2
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_h2]
					}
				]
			}
			{
				name = m_impress_h2_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Dustin Dollin on your team!"
					title_s = "Impress Dustin Dollin"
					descr_s = "Look for Dustin Dollin in FDR Skate Park."
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_h2_atom
						state = active
					}
				]
			}
			{
				name = m_impress_h3_atom
				type = goal
				atom_goal = m_impress_h3
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_h3]
					}
				]
			}
			{
				name = m_impress_h3_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Lance Mountain on your team!"
					title_s = "Impress Lance Mountain"
					descr_s = "Look for Lance Mountain in D.C. National Mall."
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_h3_atom
						state = active
					}
				]
			}
			{
				name = m_impress_r1_atom
				type = goal
				atom_goal = m_impress_r1
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_r1]
					}
				]
			}
			{
				name = m_impress_r1_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Jeff King on your team!"
					title_s = "Impress Jeff King"
					descr_s = "Look for Jeff King in D.C. National Mall"
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_r1_atom
						state = active
					}
				]
			}
			{
				name = m_impress_r2_atom
				type = goal
				atom_goal = m_impress_r2
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_r2]
					}
				]
			}
			{
				name = m_impress_r2_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Bam Margera on your team!"
					title_s = "Impress Bam Margera"
					descr_s = "Look for Bam Margera in D.C. Space and Aeronautics Museum"
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_r2_atom
						state = active
					}
				]
			}
			{
				name = m_impress_r3_atom
				type = goal
				atom_goal = m_impress_r3
				depends_on = [
					{
						type = atom
						atoms = [milestone_start_team m_r3]
					}
				]
			}
			{
				name = m_impress_r3_msg
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Get Rodney Mullen on your team!"
					title_s = "Impress Rodney Mullen"
					descr_s = "Look for Rodney Mullen in Downtown Philly"
				}
				depends_on = [
					{
						type = atom
						atom = m_impress_r3_atom
						state = active
					}
				]
			}
			{
				name = milestone_built_team
				type = milestone
				atom_effects = $milestone_built_team_effects
				depends_on = [
					{
						type = atom
						atom = milestone_start_team
					}
					{
						type = goal
						goals = [
							m_impress_c1 m_impress_c2 m_impress_c3
							m_impress_h1 m_impress_h2 m_impress_h3
							m_impress_r1 m_impress_r2 m_impress_r3
						]
						depend_func = count
						count = 3
					}
					{
						type = cash
						target_cash = 10000
						total = true
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Built Team"
				}
			}
			{
				name = ach_sk9_milestone_team_end
				type = scr
				atom_script = nullscript
				atom_params = {
					achievement
				}
				depends_on = [
					{
						type = atom
						atom = milestone_built_team
					}
				]
			}
			{
				name = sponsor_check7_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 100000
					type = deck
					written_cash_text = "One hundred thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = atom
						atom = milestone_built_team
					}
				]
			}
			{
				name = film_video_ui
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Film Team Video!"
					title_s = "Film the ultimate Skate Team Video!"
					descr_s = "Go to your skate lounge to film your TEAM VIDEO!"
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check7_atom
					}
				]
			}
			{
				name = team_film_goal
				type = goal
				atom_goals = [m_team_film]
				depends_on = [
					{
						type = atom
						atom = milestone_built_team
					}
				]
				ui_params = {
					debug_menu_text = "milestone: Team Film Goal"
				}
			}
			{
				name = story_complete_atom
				type = scr
				atom_script = sk9_ui_end_game
				depends_on = [
					{
						type = globalflag
						flag = VIDEO_EDIT_CRIB_DONE
					}
				]
				ui_params = {
					debug_menu_text = "Story Complete"
				}
			}
			{
				name = sponsor_check8_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 250000
					type = deck
					written_cash_text = "Two hundred fifty thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = atom
						atom = story_complete_atom
					}
				]
			}
			{
				name = story_complete_credits
				type = scr
				atom_script = ui_start_credits
				atom_params = {
					movie = 'credits'
					return_to_game = 1
				}
				depends_on = [
					{
						type = atom
						atom = sponsor_check8_atom
					}
				]
				ui_params = {
					debug_menu_text = "credits movie play and unlock"
				}
			}
			{
				name = post_team_film_video_editor
				type = scr
				atom_script = goal_video_start_editing_new_edit_from_goal_clips
				atom_params = {
					goal_id = m_team_film
				}
				depends_on = [
					{
						type = goal
						goal = m_team_film
					}
				]
			}
			{
				name = milestone_beat_all
				type = milestone
				atom_effects = $milestone_beat_all_effects
				depends_on = [
					{
						type = goalpoints
						point_type = total
						depend_func = percent
						percent = 100
						precision = 0.5
					}
				]
				ui_params = {
					debug_menu_text = "milestone: 100 percent game"
				}
			}
			{
				name = sponsor_checkfinal_atom
				type = scr
				atom_script = sk9_sponsor_check_atom
				atom_params = {
					cash = 900000
					type = deck
					written_cash_text = "Nine hundred thousand dollars and zero cents"
				}
				depends_on = [
					{
						type = atom
						atom = milestone_beat_all
					}
				]
			}
			{
				name = class_story_complete_c1
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Arto's Video Storyline Complete"
					descr_s = "Congratulations on your first Career Video!"
				}
				depends_on = [
					{
						type = goal
						goal = m_c1_finaloutro
					}
				]
			}
			{
				name = class_story_complete_c2
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Bob's Competition Storyline Complete"
					descr_s = "Congratulations on whoopin Eric! He needed it!"
				}
				depends_on = [
					{
						type = goal
						goal = m_c2_comppark
					}
				]
			}
			{
				name = class_story_complete_c3
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Stevie's Magazine Storyline Complete"
					descr_s = "Congratulations on snagging the issue!"
				}
				depends_on = [
					{
						type = goal
						goal = m_c3_finaloutro
					}
				]
			}
			{
				name = class_story_complete_h1
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Mike V's Epic Gap Storyline Complete"
					descr_s = "Congratulations on your underground video release!"
				}
				depends_on = [
					{
						type = goal
						goal = m_h1_finalepic
					}
				]
			}
			{
				name = class_story_complete_h2
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Dustin's Crackin Heads Storyline Complete"
					descr_s = "Congratulations on taking down the Crazy Two-Ones!"
				}
				depends_on = [
					{
						type = goal
						goal = m_h2_bossbattle
					}
				]
			}
			{
				name = class_story_complete_h3
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Lance's Bowl Skatin Storyline Complete"
					descr_s = "Congratulations on joining Lance's secret bowl squad!"
				}
				depends_on = [
					{
						type = goal
						goal = m_h3_secret2
					}
				]
			}
			{
				name = class_story_complete_r1
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Jeff King's Riggin Storyline Complete"
					descr_s = "Congratulations on become a true builder!"
				}
				depends_on = [
					{
						type = goal
						goal = m_r1_showdown
					}
				]
			}
			{
				name = class_story_complete_r2
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Bam's Crazy Climbing Storyline Complete"
					descr_s = "Congratulations on getting your own show superstar!"
				}
				depends_on = [
					{
						type = goal
						goal = m_r2_show2
					}
				]
			}
			{
				name = class_story_complete_r3
				type = scr
				atom_script = ui_progression_unlock_create
				atom_params = {
					title = "Story Complete!"
					title_s = "Daewon's Rig the World Storyline Complete"
					descr_s = "Congratulations on Rigging the World for Skaters everywhere!"
				}
				depends_on = [
					{
						type = goal
						goal = m_r3_bell
					}
				]
			}
			{
				name = unlock_ambient_gangs
				type = scr
				atom_script = unlock_ambient_gangs
				depends_on = [
					{
						type = goal
						goals = [
							m_h2_takefdr
						]
						depend_func = count
						count = 1
					}
				]
			}
			{
				name = unlock_philly_downtown_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = philly_downtown
				}
				depends_on = [
					{
						type = atom
						atom = m_training_line_atom
					}
				]
			}
			{
				name = unlock_philly_fdr_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = philly_fdr
				}
				depends_on = [
					{
						type = goal
						goals = [
							m_h2_takefdr
						]
						depend_func = count
						count = 1
					}
				]
			}
			{
				name = unlock_philly_fdr_ui
				type = scr
				atom_script = ui_game_area_unlocked
				atom_params = {
					game_area = philly_fdr
				}
				depends_on = [
					{
						type = atom
						atom = unlock_philly_fdr_atom
					}
				]
			}
			{
				name = unlock_balt_lansdowne_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = balt_lansdowne
				}
				depends_on = [
					{
						type = goal
						goal = m_c2_ntg
					}
				]
			}
			{
				name = unlock_balt_lansdowne_ui
				type = scr
				atom_script = ui_game_area_unlocked
				atom_params = {
					game_area = balt_lansdowne
				}
				depends_on = [
					{
						type = atom
						atom = unlock_balt_lansdowne_atom
					}
				]
			}
			{
				name = unlock_dc_nasm_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = dc_nasm
				}
				depends_on = [
					{
						type = goal
						goal = m_r2_breakin
					}
				]
			}
			{
				name = unlock_dc_nasm_ui
				type = scr
				atom_script = ui_game_area_unlocked
				atom_params = {
					game_area = dc_nasm
				}
				depends_on = [
					{
						type = atom
						atom = unlock_dc_nasm_atom
					}
				]
			}
			{
				name = unlock_philly_balt_bridge_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = philly_balt_bridge
				}
				depends_on = [
					{
						type = goal
						goals = [
							m_c1_invite
							m_r1_buildqp
							m_h1_epicdrop
							m_h2_takefdr
						]
						depend_func = count
						count = 1
					}
				]
			}
			{
				name = unlock_philly_balt_bridge_ui
				type = scr
				atom_script = ui_game_area_unlocked
				atom_params = {
					game_area = philly_balt_bridge
				}
				depends_on = [
					{
						type = atom
						atom = unlock_philly_balt_bridge_atom
					}
				]
			}
			{
				name = unlock_secret_bridge_link_test_01
				type = scr
				atom_script = sk9_secret_area_unlock_check
				depends_on = [
					{
						type = atom
						atom = unlock_philly_balt_bridge_atom
					}
				]
			}
			{
				name = unlock_pb_bridge_arcade
				type = goal
				atom_goals = [
					m_arcade_pb_bridge
					m_chalk1_pb_bridge
					m_line_PB_Bridge
				]
				depends_on = [
					{
						type = atom
						atom = unlock_philly_balt_bridge_atom
					}
				]
			}
			{
				name = unlock_philly_dc_subway_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = philly_dc_subway
				}
				depends_on = [
					{
						type = goal
						goals = [
							m_h1_cribcut
							m_c2_compstreet
							m_c3_epicphoto2
							m_r2_skateoff
						]
						depend_func = count
						count = 1
					}
				]
			}
			{
				name = unlock_philly_dc_subway_ui
				type = scr
				atom_script = ui_game_area_unlocked
				atom_params = {
					game_area = philly_dc_subway
				}
				depends_on = [
					{
						type = atom
						atom = unlock_philly_dc_subway_atom
					}
				]
			}
			{
				name = unlock_secret_bridge_link_test_02
				type = scr
				atom_script = sk9_secret_area_unlock_check
				depends_on = [
					{
						type = atom
						atom = unlock_philly_dc_subway_atom
					}
				]
			}
			{
				name = unlock_balt_dc_bridge_atom
				type = scr
				atom_script = unlock_game_area
				atom_params = {
					game_area = balt_dc_bridge
				}
				depends_on = [
					{
						type = goal
						goals = [
							m_c1_practice1
							m_r1_demo
							m_h2_clearbcity
						]
						depend_func = count
						count = 1
					}
				]
			}
			{
				name = m_line_BW_Bridge_atom
				type = goal
				atom_goal = m_line_BW_Bridge
				depends_on = [
					{
						type = atom
						atom = unlock_balt_dc_bridge_atom
					}
				]
			}
			{
				name = unlock_balt_dc_bridge_ui
				type = scr
				atom_script = ui_game_area_unlocked
				atom_params = {
					game_area = balt_dc_bridge
				}
				depends_on = [
					{
						type = atom
						atom = unlock_balt_dc_bridge_atom
					}
				]
			}
			{
				name = unlock_secret_bridge_link_test_03
				type = scr
				atom_script = sk9_secret_area_unlock_check
				depends_on = [
					{
						type = atom
						atom = unlock_balt_dc_bridge_atom
					}
				]
			}
		]
	}
endscript
chapter_info_debug_checkpoints = [
	{
		debug_menu_text = "Pre-Training Goals Done"
		required_atoms = [
			pre_training_goals_atom
		]
		min_goal_points = {
			career = 0
		}
	}
	{
		debug_menu_text = "Training Done"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
		]
		min_goal_points = {
			career = 0
		}
	}
	{
		debug_menu_text = "Unlocked Career 2 and 3"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_c1
		]
		min_goal_points = {
			career = 300
		}
	}
	{
		debug_menu_text = "Unlocked Hardcore 2 and 3"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_h1
		]
		min_goal_points = {
			hardcore = 300
		}
	}
	{
		debug_menu_text = "Unlocked Rigger 2 and 3"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_r1_postvid_atom
			m_r1
		]
		min_goal_points = {
			rigger = 300
		}
	}
	{
		debug_menu_text = "Unlocked All Episodes (Worst Case Goal Ped Count)"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
		]
		additional_scripts = [
			debug_unlock_advanced_goal_episodes
		]
	}
	{
		debug_menu_text = "Career 1/Hardcore 1/Rigger 1 Done"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_r1_postvid_atom
			m_c1
			m_h1
			m_r1
		]
	}
	{
		debug_menu_text = "Career 2/Hardcore 2/Rigger 2 Done"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_r1_postvid_atom
			m_c1
			m_h1
			m_r1
			m_c2_revman_atom
			m_c2
			m_h2
			m_r2
		]
	}
	{
		debug_menu_text = "Career 3/Hardcore 3/Rigger 3 Done"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_r1_postvid_atom
			m_c1
			m_h1
			m_r1
			m_c2_revman_atom
			m_c2
			m_h2
			m_r2
			m_c3
			m_c3_mel_atom
			m_h3_maddog_atom
			m_h3
			m_r3
		]
	}
	{
		debug_menu_text = "Career 3/Hardcore 3/Rigger 3 and Impress Goals Done"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_r1_postvid_atom
			m_c1
			m_h1
			m_r1
			m_c2_revman_atom
			m_c2
			m_h2
			m_r2
			m_c3
			m_c3_mel_atom
			m_h3_maddog_atom
			m_h3
			m_r3
			m_impress_c1_atom
			m_impress_c2_atom
			m_impress_c3_atom
			m_impress_h1_atom
			m_impress_h2_atom
			m_impress_h3_atom
			m_impress_r1_atom
			m_impress_r2_atom
			m_impress_r3_atom
		]
		additional_scripts = [
			game_progress_debug_give_cash_for_team_film
		]
	}
	{
		debug_menu_text = "Beat All Story Goals (Tracks, Impress, Ubers)"
		required_atoms = [
			pre_training_goals_atom
			m_training_grind_desc_atom
			m_training_grind_atom
			m_training_manual_desc_atom
			m_training_manual_atom
			m_training_qp2rail_desc_atom
			m_training_qp2rail_atom
			m_training_revman_desc_atom
			m_training_revman_atom
			m_training_line_desc_atom
			m_training_line_atom
			post_training_cam_atom
			m_r1_postvid_atom
			m_c1
			m_h1
			m_r1
			m_c2_revman_atom
			m_c2
			m_h2
			m_r2
			m_c3
			m_c3_mel_atom
			m_h3_maddog_atom
			m_h3
			m_r3
			m_impress_c1_atom
			m_impress_c2_atom
			m_impress_c3_atom
			m_impress_h1_atom
			m_impress_h2_atom
			m_impress_h3_atom
			m_impress_r1_atom
			m_impress_r2_atom
			m_impress_r3_atom
			career_uber_atom
			hardcore_uber_atom
			rigger_uber_atom
		]
		additional_scripts = [
			game_progress_debug_give_cash_for_team_film
		]
	}
	{
		debug_menu_text = "Beat All Goals at Am"
		required_atoms = [
		]
		additional_scripts = [
			game_progress_debug_beat_all_goals_am
		]
	}
	{
		debug_menu_text = "Beat All Goals at Pro"
		required_atoms = [
		]
		additional_scripts = [
			game_progress_debug_beat_all_goals_pro
		]
	}
	{
		debug_menu_text = "Beat All Goals at Sick"
		required_atoms = [
		]
		additional_scripts = [
			game_progress_debug_beat_all_goals_sick
		]
	}
	{
		debug_menu_text = "Done All Editor's Challenges"
		required_atoms = [
		]
		additional_scripts = [
			game_progress_debug_done_all_editor_challenges
		]
	}
]

script NotCD_Script 
	if NOT cd
		return \{true}
	else
		return \{false}
	endif
endscript

script game_progress_debug_beat_all_goals_am 
	debug_beat_all_goals \{grade = 1}
endscript

script game_progress_debug_beat_all_goals_pro 
	debug_beat_all_goals \{grade = 2}
endscript

script game_progress_debug_beat_all_goals_sick 
	debug_beat_all_goals \{grade = 3}
endscript

script game_progress_debug_done_all_editor_challenges 
	set_global_flags \{flags = [
			VIDEO_EDIT_PHILLY_DONE
			VIDEO_EDIT_BALT_DONE
			VIDEO_EDIT_DC_DONE
			VIDEO_EDIT_CRIB_DONE
		]}
endscript

script debug_unlock_advanced_goal_episodes 
	careerfunc \{func = fakebeatprogressiongoal
		params = {
			goal_id = m_c1_demo
			goal_grade = 1
		}}
	careerfunc \{func = fakebeatprogressiongoal
		params = {
			goal_id = m_h1_epicdrop
			goal_grade = 1
		}}
	careerfunc \{func = fakebeatprogressiongoal
		params = {
			goal_id = m_r1_demo
			goal_grade = 1
		}}
endscript

script unlock_ambient_gangs 
	changenodeflag \{nodeflag_attack_philly
		1}
	changenodeflag \{nodeflag_attack_dc
		1}
	changenodeflag \{nodeflag_attack_balt
		1}
endscript

script set_global_flags 
	getarraysize \{flags}
	<i> = 0
	begin
	<flag> = (<flags> [<i>])
	setglobalflag flag = ($<flag>)
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script game_progress_debug_give_cash_for_team_film 
	careerfunc \{func = AddCash
		params = {
			cash = 5000
		}}
endscript

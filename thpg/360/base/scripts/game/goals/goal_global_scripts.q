goal_global_allow_train_creation = true

script m_c1_invite_post_init 
	setglobalflag \{flag = $CAREER_CAREER_TRACK_INITIALIZED}
endscript

script m_c1_ntt_pre_activate 
	goal_kill_all_vehicles
	kill \{name = Z_Slums_GetCash_05_icon}
endscript

script m_c1_ntt_post_deactivate 
	goal_restore_all_vehicles
	forced_create \{name = Z_Slums_GetCash_05_icon}
endscript

script m_c1_impress_pre_activate 
	goal_kill_all_vehicles
endscript

script m_c1_impress_post_deactivate 
	goal_restore_all_vehicles
endscript

script m_c1_demo_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	kill \{name = z_bcity_c_building_planter}
	kill \{name = z_bcity_c_building_planter_02}
	kill \{name = z_bcity_c_building_planter_03}
	kill \{name = z_bcity_I_g_TK_city_bush_24}
	kill \{name = z_bcity_I_g_TK_city_bush_25}
	kill \{name = z_bcity_I_g_TK_city_bush_26}
endscript

script m_c1_demo_post_deactivate 
	goal_restore_all_peds
	forced_create \{name = z_bcity_c_building_planter}
	forced_create \{name = z_bcity_c_building_planter_02}
	forced_create \{name = z_bcity_c_building_planter_03}
	forced_create \{name = z_bcity_I_g_TK_city_bush_24}
	forced_create \{name = z_bcity_I_g_TK_city_bush_25}
	forced_create \{name = z_bcity_I_g_TK_city_bush_26}
endscript

script m_c1_practice1_pre_activate 
	goal_kill_all_vehicles
endscript

script m_c1_practice1_post_deactivate 
	goal_restore_all_vehicles
	if gman_haswongoal goal = <goal_id>
	else
		goal_move_skater \{pos = (-146.0372, 4.5673, -12.5338)
			zone = z_harbor}
	endif
endscript

script m_c1_film1_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	goal_kill_all_vehicles
endscript

script m_c1_film1_post_deactivate 
	goal_restore_all_vehicles
	goal_restore_all_peds
endscript

script m_c1_film2_pre_activate 
	goal_kill_all_peds
endscript

script m_c1_film2_post_deactivate 
	goal_restore_all_peds
endscript

script m_c1_film3_pre_activate 
	goal_kill_all_peds
endscript

script m_c1_film3_post_deactivate 
	goal_restore_all_peds
endscript

script m_c2_revman_pre_activate 
endscript

script m_c2_revman_post_deactivate 
endscript

script m_crowd_test_pre_activate 
	goal_kill_all_peds
endscript

script m_crowd_test_post_deactivate 
	goal_restore_all_peds
endscript

script m_c2_localcomp_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_c2_localcomp_post_deactivate 
	goal_restore_all_peds
endscript

script m_c2_compstreet_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	kill \{name = Z_Love_GetCash_05_icon}
	kill \{name = Z_Love_GetCash_05}
	kill \{name = Z_Love_GetCash_09_icon}
	kill \{name = Z_Love_GetCash_09}
endscript

script m_c2_compstreet_post_deactivate 
	goal_restore_all_peds
	forced_create \{name = Z_Love_GetCash_05_icon}
	forced_create \{name = Z_Love_GetCash_05}
	forced_create \{name = Z_Love_GetCash_09_icon}
	forced_create \{name = Z_Love_GetCash_09}
endscript

script m_c2_compvert_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_c2_compvert_post_deactivate 
	goal_restore_all_peds
endscript

script m_c2_comppark_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	kill \{name = z_harbor_g_tk_orange_rail_01}
	kill \{prefix = z_harbor_ABS_HarborGrinds170}
	changenodeflag \{nodeflag_harbor_chalk1
		0}
endscript

script m_c2_comppark_post_deactivate 
	goal_restore_all_peds
	forced_create \{name = z_harbor_g_tk_orange_rail_01}
	forced_create \{prefix = z_harbor_ABS_HarborGrinds170}
	changenodeflag \{nodeflag_harbor_chalk1
		1}
endscript

script m_c3_photosession_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_c3_photosession_post_deactivate 
	goal_restore_all_peds
endscript

script m_c3_photothemed_pre_activate 
	goal_kill_all_vehicles
endscript

script m_c3_photothemed_post_deactivate 
	goal_restore_all_vehicles
endscript

script m_r1_postvid_post_init 
	setglobalflag \{flag = $CAREER_RIGGER_TRACK_INITIALIZED}
endscript

script m_r1_postvid_post_deactivate 
	spawnscriptnow \{m_r1_postvid_skatepad_prompt}
endscript

script m_r1_postvid_skatepad_prompt 
	if istrue \{$game_progress_debug_active}
		return
	endif
	MakeSkaterGoto \{SkaterInit}
	do_actual_pause
	do_autosave \{immediate
		suspend_ui}
	do_actual_unpause
	goal_track_update_ped_after_goal \{goal_id = m_r1_postvid}
endscript

script m_h3_secret1_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h3_secret1_post_deactivate 
	goal_restore_all_peds
endscript

script m_h3_secret2_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	changenodeflag \{nodeflag_bcity_rooffencepoolstate_closed
		0}
endscript

script m_h3_secret2_post_deactivate 
	goal_restore_all_peds
	if gman_haswongoal \{goal = m_h3_secret2}
		changenodeflag \{nodeflag_bcity_rooffencegrind_active
			1}
	else
		goal_move_skater \{pos = (-93.9704, 2.8706, -204.59679)
			quat = (0.0, -0.6649, -0.0)}
		changenodeflag \{nodeflag_bcity_rooffencepoolstate_closed
			1}
	endif
endscript

script m_hu_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_hu_post_deactivate 
	goal_restore_all_peds
endscript

script m_cu_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	if getnodeflag \{nodeflag_z_monuments_floor_1}
		changenodeflag \{nodeflag_z_monuments_floor_1
			0}
	endif
	if getnodeflag \{nodeflag_z_monuments_uber_clearage}
		changenodeflag \{nodeflag_z_monuments_uber_clearage
			0}
	endif
	goal_utility_manage_objects \{action = remove
		objects = [
			Z_Monuments_G_RE_FreedomWire_01
			z_monuments_G_RE_PedCrossLight_01
			z_monuments_G_RE_PedCrossLight_05
		]}
endscript

script m_cu_post_deactivate 
	goal_restore_all_peds
	changenodeflag \{nodeflag_z_monuments_uber_clearage
		1}
	goal_utility_manage_objects \{action = reset
		objects = [
			Z_Monuments_G_RE_FreedomWire_01
			z_monuments_G_RE_PedCrossLight_01
			z_monuments_G_RE_PedCrossLight_05
		]}
endscript

script m_impress_h3_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_impress_h3_post_deactivate 
	goal_restore_all_peds
endscript

script m_h1_bigpush2_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h1_bigpush2_post_deactivate 
	goal_restore_all_peds
endscript

script m_h1_bigspines_post_init 
	setglobalflag \{flag = $CAREER_HARDCORE_TRACK_INITIALIZED}
endscript

script m_h1_bigspines_pre_activate 
endscript

script m_h1_bigspines_post_deactivate 
	if objectexists \{id = m_h1_gped_01}
		m_h1_gped_01 :unhide
	endif
endscript

script m_h1_boostpull_pre_activate 
	if iscreated Z_WP_Bridge_Train_01
		kill name = Z_WP_Bridge_Train_01
	endif
	if iscreated Z_WP_Bridge_train_vibrate_01
		kill name = Z_WP_Bridge_train_vibrate_01
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_01
		kill name = Z_WP_Bridge_train_ghost_bail_01
	endif
	if iscreated Z_WP_Bridge_Train_02
		kill name = Z_WP_Bridge_Train_02
	endif
	if iscreated Z_WP_Bridge_train_vibrate_02
		kill name = Z_WP_Bridge_train_vibrate_02
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_02
		kill name = Z_WP_Bridge_train_ghost_bail_02
	endif
	if iscreated Z_WP_Bridge_Train_03
		kill name = Z_WP_Bridge_Train_03
	endif
	if iscreated Z_WP_Bridge_train_vibrate_03
		kill name = Z_WP_Bridge_train_vibrate_03
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_03
		kill name = Z_WP_Bridge_train_ghost_bail_03
	endif
	if iscreated Z_WP_Bridge_Train_04
		kill name = Z_WP_Bridge_Train_04
	endif
	if iscreated Z_WP_Bridge_train_vibrate_04
		kill name = Z_WP_Bridge_train_vibrate_04
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_04
		kill name = Z_WP_Bridge_train_ghost_bail_04
	endif
	goal_kill_all_peds ignore_goal = <goal_id>
	change goal_global_allow_train_creation = false
	killspawnedscript name = Z_WP_Bridge_Train_2
	killspawnedscript name = Z_WP_Bridge_Train_3
	killspawnedscript name = Z_WP_Bridge_Train_4
endscript

script m_h1_boostpull_post_deactivate 
	goal_restore_all_peds
	change \{goal_global_allow_train_creation = true}
	create \{name = Z_WP_Bridge_Train_01}
	if objectexists \{id = m_h1_gped_01}
		m_h1_gped_01 :unhide
	endif
endscript

script m_h1_epicdrop_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	changenodeflag \{nodeflag_z_love_chalk1
		0}
	changenodeflag \{nodeflag_z_love_chalk2
		0}
	changenodeflag \{nodeflag_z_love_chalk3
		0}
	changenodeflag \{nodeflag_z_love_chalk4
		0}
	changenodeflag \{nodeflag_z_love_chalk5
		0}
	changenodeflag \{nodeflag_z_love_chalk6
		0}
endscript

script m_h1_epicdrop_post_deactivate 
	goal_restore_all_peds
	changenodeflag \{nodeflag_z_love_chalk1
		1}
	changenodeflag \{nodeflag_z_love_chalk2
		1}
	changenodeflag \{nodeflag_z_love_chalk3
		1}
	changenodeflag \{nodeflag_z_love_chalk4
		1}
	changenodeflag \{nodeflag_z_love_chalk5
		1}
	changenodeflag \{nodeflag_z_love_chalk6
		1}
endscript

script m_h1_finalepic_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h1_finalepic_pre_deactivate 
	cap_delete_all_pieces
endscript

script m_h1_finalepic_post_deactivate 
	goal_restore_all_peds
	if objectexists \{id = m_h1_gped_01}
		m_h1_gped_01 :unhide
	endif
endscript

script m_h1_skitchboost_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h1_skitchboost_post_deactivate 
	goal_restore_all_peds
	if objectexists \{id = m_h1_gped_01}
		m_h1_gped_01 :unhide
	endif
endscript

script m_h2_boneless_pre_activate 
	kill \{prefix = 'z_fdr_skate_check_crate'}
	kill \{name = z_fdr_prx_mb_rolling_door_3}
	kill \{name = z_fdr_prx_mb_rolling_door_4}
endscript

script m_h2_boneless_post_deactivate 
	if gman_haswongoal \{goal = m_h2_takefdr}
		changenodeflag \{nodeflag_lock_slums_fdr
			0}
		changenodeflag \{nodeflag_z_fdr_attackers
			1}
	endif
	create \{prefix = 'z_fdr_skate_check_crate'}
	forced_create \{name = z_fdr_prx_mb_rolling_door_3}
	forced_create \{name = z_fdr_prx_mb_rolling_door_4}
	goal_restore_all_peds
endscript

script m_h2_learncheck_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h2_learncheck_post_deactivate 
	goal_restore_all_peds
endscript

script m_h2_takefdr_pre_activate 
	kill \{prefix = 'z_fdr_skate_check_crate'}
	kill \{name = z_fdr_prx_mb_rolling_door_1}
	kill \{name = z_fdr_prx_mb_rolling_door_2}
	kill \{name = z_fdr_prx_mb_rolling_door_3}
	kill \{name = z_fdr_prx_mb_rolling_door_4}
endscript

script m_h2_takefdr_pre_deactivate 
	if NOT gman_haswongoal \{goal = m_h2_takefdr}
		gman_getcurrentcheckpoint \{goal = m_h2_takefdr}
		if ((<current_checkpoint> = chk2) || (<current_checkpoint> = chk3))
			spawnscriptlater \{m_h2_takefdr_teleport_skater_end}
		endif
	endif
endscript

script m_h2_takefdr_post_deactivate 
	create \{prefix = 'z_fdr_skate_check_crate'}
	if gman_haswongoal \{goal = m_h2_takefdr}
		changenodeflag \{nodeflag_lock_slums_fdr
			0}
		changenodeflag \{nodeflag_z_fdr_attackers
			1}
	else
		changenodeflag \{nodeflag_lock_slums_fdr
			1}
		changenodeflag \{nodeflag_z_fdr_attackers
			0}
	endif
	goal_restore_all_peds
	forced_create \{name = z_fdr_prx_mb_rolling_door_1}
	forced_create \{name = z_fdr_prx_mb_rolling_door_2}
	forced_create \{name = z_fdr_prx_mb_rolling_door_3}
	forced_create \{name = z_fdr_prx_mb_rolling_door_4}
endscript

script m_h2_takefdr_teleport_skater_end 
	goal_rollout_skater
	skater :Sk_Killskater \{prefix = z_fdr_trg_restart_lockdown
		message1 = $str_z_fdr_scripts_1
		message2 = $str_z_fdr_scripts_2
		message3 = $str_z_fdr_scripts_3
		message4 = $str_z_fdr_scripts_4}
endscript

script m_h2_clearbcity_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h2_clearbcity_post_deactivate 
	goal_restore_all_peds
endscript

script m_h2_clearmuseums_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_h2_clearmuseums_post_deactivate 
	goal_restore_all_peds
endscript

script m_h2_bossbattle_pre_activate 
	kill \{prefix = 'z_fdr_skate_check_crate'}
	goal_kill_all_peds ignore_goal = <goal_id>
	kill \{name = z_fdr_prx_mb_rolling_door_1}
	kill \{name = z_fdr_prx_mb_rolling_door_2}
	kill \{name = z_fdr_prx_mb_rolling_door_3}
	kill \{name = z_fdr_prx_mb_rolling_door_4}
endscript

script m_h2_bossbattle_post_deactivate 
	create \{prefix = 'z_fdr_skate_check_crate'}
	goal_restore_all_peds
	forced_create \{name = z_fdr_prx_mb_rolling_door_1}
	forced_create \{name = z_fdr_prx_mb_rolling_door_2}
	forced_create \{name = z_fdr_prx_mb_rolling_door_3}
	forced_create \{name = z_fdr_prx_mb_rolling_door_4}
endscript

script m_impress_c2_pre_activate 
	skater :nailthetrickscore_limitscoring \{ntg}
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_impress_c2_post_deactivate 
	skater :nailthetrickscore_limitscoring \{off}
	goal_restore_all_peds
endscript

script m_impress_c3_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_impress_c3_post_deactivate 
	goal_restore_all_peds
endscript

script m_impress_R3_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	kill \{name = z_love_g_lovepark_benches03}
	kill \{name = z_love_g_love_signs}
	kill \{name = z_love_g_love_sign_posts}
endscript

script m_impress_R3_post_deactivate 
	goal_restore_all_peds
	forced_create \{name = z_love_g_lovepark_benches03}
	forced_create \{name = z_love_g_love_signs}
	forced_create \{name = z_love_g_love_sign_posts}
endscript

script m_h3_bowlcomp_post_init 
	if objectexists \{id = m_h3_gped_01}
		m_h3_gped_01 :ai_giveorder \{name = Bv_LookAt
			params = {
				name = skater
			}}
	endif
endscript

script m_h3_bowlcomp_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	kill \{prefix = Z_FDR_TRG_Bouncy}
endscript

script m_h3_bowlcomp_post_deactivate 
	goal_restore_all_peds
	create \{prefix = Z_FDR_TRG_Bouncy}
endscript

script m_r1_buildkick2_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r1_buildkick2_post_deactivate 
	goal_restore_all_peds
endscript

script m_r1_buildqp_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r1_buildqp_post_activate 
	changenodeflag \{nodeflag_z_crib_chalk1
		0}
	changenodeflag \{nodeflag_z_crib_chalk2
		0}
	changenodeflag \{nodeflag_z_crib_chalk3
		0}
	changenodeflag \{nodeflag_z_crib_chalk4
		0}
	changenodeflag \{nodeflag_z_crib_chalk5
		0}
endscript

script m_r1_buildqp_pre_deactivate 
	cap_delete_all_pieces
endscript

script m_r1_buildqp_post_deactivate 
	goal_restore_all_peds
	if objectexists \{id = m_r1_gped_01}
		m_r1_gped_01 :unhide
	endif
	changenodeflag \{nodeflag_z_crib_chalk1
		1}
	changenodeflag \{nodeflag_z_crib_chalk2
		1}
	changenodeflag \{nodeflag_z_crib_chalk3
		1}
	changenodeflag \{nodeflag_z_crib_chalk4
		1}
	changenodeflag \{nodeflag_z_crib_chalk5
		1}
endscript

script m_r1_buildspine_pre_activate 
	changenodeflag \{nodeflag_bw_bridge_rak_collision
		0}
endscript

script m_r1_buildspine_post_deactivate 
	if objectexists \{id = m_r1_gped_01}
		m_r1_gped_01 :unhide
	endif
	changenodeflag \{nodeflag_bw_bridge_rak_collision
		1}
endscript

script m_r1_demo_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	changenodeflag \{nodeflag_bw_bridge_rak_collision
		0}
endscript

script m_r1_demo_post_activate 
	create_crowd_models \{crowd_models = m_r1_demo_crowd_models}
	create \{prefix = m_r1_demo_crowd
		crowd_models = m_r1_demo_peds}
endscript

script m_r1_demo_pre_deactivate 
	destroy_crowd_models \{crowd_models = m_r1_demo_crowd_models
		trigger_script = goal_spectator_peds_init}
endscript

script m_r1_demo_post_deactivate 
	changenodeflag \{nodeflag_bw_bridge_rak_collision
		1}
	goal_restore_all_peds
	if objectexists \{id = m_r1_gped_01}
		m_r1_gped_01 :unhide
	endif
	cap_set_piece_limit \{limit = 30}
endscript

script m_h3_ntb_post_deactivate 
	if NOT GMan_HasWonGoalThisTry \{goal = m_h3_ntb}
		m_h3_ntb_ped :Teleport \{position = (-137.698, 8.9646, -188.5981)}
	endif
endscript

script m_r1_showdown_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	gman_getdata \{goal = m_r1_showdown}
	goal_utility_manage_objects action = remove objects = <lamp_stuff>
	kill \{prefix = Z_Monuments_NxSpline_69}
	changenodeflag \{nodeflag_z_monuments_chalk3
		0}
	changenodeflag \{nodeflag_z_monuments_toggle_unlock
		0}
	if getnodeflag \{nodeflag_z_monuments_floor_1}
		gman_setdata \{goal = m_r1_showdown
			params = {
				restore_ramp = 1
			}}
		changenodeflag \{nodeflag_z_monuments_floor_1
			0}
		changenodeflag \{NODEFLAG_Z_MONUMENTS_FLOOR_2
			1}
	else
		gman_setdata \{goal = m_r1_showdown
			params = {
				restore_ramp = 0
			}}
	endif
endscript

script m_r1_showdown_post_activate 
	create_crowd_models \{crowd_models = m_r1_showdown_crowd_models}
	kill \{name = m_r1_showdown_trg_boundary}
endscript

script m_r1_showdown_pre_deactivate 
	destroy_crowd_models \{crowd_models = m_r1_showdown_crowd_models
		trigger_script = goal_spectator_peds_init}
	changenodeflag \{nodeflag_z_monuments_chalk3
		1}
	changenodeflag \{nodeflag_z_monuments_toggle_unlock
		1}
	kill \{name = m_r1_showdown_trg_boundary}
	cap_delete_all_pieces
endscript

script m_r1_showdown_post_deactivate 
	goal_restore_all_peds
	gman_getdata \{goal = m_r1_showdown}
	goal_utility_manage_objects action = add objects = <lamp_stuff>
	forced_create \{prefix = Z_Monuments_NxSpline_69}
	gman_getdata \{goal = m_r1_showdown}
	if (<restore_ramp> = 1)
		changenodeflag \{nodeflag_z_monuments_floor_1
			1}
		changenodeflag \{NODEFLAG_Z_MONUMENTS_FLOOR_2
			0}
	endif
endscript

script m_r2_skateoff_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r2_skateoff_post_deactivate 
	goal_restore_all_peds
endscript

script m_r2_show1_pre_activate 
	if iscreated Z_WP_Bridge_Train_01
		kill name = Z_WP_Bridge_Train_01
	endif
	if iscreated Z_WP_Bridge_train_vibrate_01
		kill name = Z_WP_Bridge_train_vibrate_01
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_01
		kill name = Z_WP_Bridge_train_ghost_bail_01
	endif
	if iscreated Z_WP_Bridge_Train_02
		kill name = Z_WP_Bridge_Train_02
	endif
	if iscreated Z_WP_Bridge_train_vibrate_02
		kill name = Z_WP_Bridge_train_vibrate_02
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_02
		kill name = Z_WP_Bridge_train_ghost_bail_02
	endif
	if iscreated Z_WP_Bridge_Train_03
		kill name = Z_WP_Bridge_Train_03
	endif
	if iscreated Z_WP_Bridge_train_vibrate_03
		kill name = Z_WP_Bridge_train_vibrate_03
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_03
		kill name = Z_WP_Bridge_train_ghost_bail_03
	endif
	if iscreated Z_WP_Bridge_Train_04
		kill name = Z_WP_Bridge_Train_04
	endif
	if iscreated Z_WP_Bridge_train_vibrate_04
		kill name = Z_WP_Bridge_train_vibrate_04
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_04
		kill name = Z_WP_Bridge_train_ghost_bail_04
	endif
	killspawnedscript name = Z_WP_Bridge_Train_2
	killspawnedscript name = Z_WP_Bridge_Train_3
	killspawnedscript name = Z_WP_Bridge_Train_4
	goal_kill_all_peds ignore_goal = <goal_id>
	change goal_global_allow_train_creation = false
endscript

script m_r2_show1_post_deactivate 
	forced_create \{name = Z_WP_Bridge_Train_01}
	goal_restore_all_peds
	change \{goal_global_allow_train_creation = true}
	create \{name = Z_WP_Bridge_Train_01}
endscript

script m_r2_show2_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r2_show2_post_deactivate 
	goal_restore_all_peds
endscript

script m_r3_museums_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r3_museums_post_deactivate 
	goal_restore_all_peds
endscript

script m_r3_monuments_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r3_monuments_post_deactivate 
	goal_restore_all_peds
endscript

script m_r3_harbor_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r3_harbor_post_deactivate 
	goal_restore_all_peds
endscript

script m_r3_slums_pre_activate 
	kill \{name = Z_Slums_train}
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r3_slums_post_deactivate 
	forced_create \{name = Z_Slums_train}
	goal_restore_all_peds
endscript

script m_r3_love_pre_activate 
	kill \{prefix = 'z_love_trg_bouncy'}
	kill \{prefix = 'z_bell_trg_bell_bouncy'}
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r3_love_post_deactivate 
	forced_create \{prefix = 'z_love_trg_bouncy'}
	forced_create \{prefix = 'z_bell_trg_bell_bouncy'}
	goal_restore_all_peds
endscript

script m_r3_bell_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_r3_bell_post_deactivate 
	goal_restore_all_peds
endscript

script m_impress_h2_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_impress_h2_post_deactivate 
	goal_restore_all_peds
endscript

script m_impress_c1_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_impress_c1_post_deactivate 
	goal_restore_all_peds
endscript

script m_impress_r1_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_impress_r1_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_rig_love_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_photo_rig_love_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_rig_harbor_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_photo_rig_harbor_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntm_slums_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_ntm_slums_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntm_monuments_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_ntm_monuments_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_push_harbor_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_push_harbor_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_push_bwb_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_photo_push_bwb_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_check_fdr_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_photo_check_fdr_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_push_love_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_push_love_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_rig_mall_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_rig_mall_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_rig_slums_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_rig_slums_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_mod_harbor_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
endscript

script m_film_mod_harbor_post_deactivate 
	changenodeflag \{nodeflag_m_film_mod_harbor_bank01
		0}
	changenodeflag \{nodeflag_m_film_mod_harbor_bank02
		0}
	changenodeflag \{nodeflag_m_film_mod_harbor_bank01a
		1}
	changenodeflag \{nodeflag_m_film_mod_harbor_bank02a
		1}
	goal_restore_all_peds
endscript

script m_photo_mod_wp_bridge_post_deactivate 
	changenodeflag \{nodeflag_m_film_mod_harbor_bank01
		0}
	changenodeflag \{nodeflag_m_film_mod_harbor_bank02
		0}
	changenodeflag \{nodeflag_m_film_mod_harbor_bank01a
		1}
	changenodeflag \{nodeflag_m_film_mod_harbor_bank02a
		1}
	forced_create \{name = Z_WP_Bridge_Train_01}
	goal_restore_all_peds
	change \{goal_global_allow_train_creation = true}
endscript

script m_photo_mod_wp_bridge_pre_activate 
	if iscreated Z_WP_Bridge_Train_01
		kill name = Z_WP_Bridge_Train_01
	endif
	if iscreated Z_WP_Bridge_train_vibrate_01
		kill name = Z_WP_Bridge_train_vibrate_01
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_01
		kill name = Z_WP_Bridge_train_ghost_bail_01
	endif
	if iscreated Z_WP_Bridge_Train_02
		kill name = Z_WP_Bridge_Train_02
	endif
	if iscreated Z_WP_Bridge_train_vibrate_02
		kill name = Z_WP_Bridge_train_vibrate_02
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_02
		kill name = Z_WP_Bridge_train_ghost_bail_02
	endif
	if iscreated Z_WP_Bridge_Train_03
		kill name = Z_WP_Bridge_Train_03
	endif
	if iscreated Z_WP_Bridge_train_vibrate_03
		kill name = Z_WP_Bridge_train_vibrate_03
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_03
		kill name = Z_WP_Bridge_train_ghost_bail_03
	endif
	if iscreated Z_WP_Bridge_Train_04
		kill name = Z_WP_Bridge_Train_04
	endif
	if iscreated Z_WP_Bridge_train_vibrate_04
		kill name = Z_WP_Bridge_train_vibrate_04
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_04
		kill name = Z_WP_Bridge_train_ghost_bail_04
	endif
	killspawnedscript name = Z_WP_Bridge_Train_2
	killspawnedscript name = Z_WP_Bridge_Train_3
	killspawnedscript name = Z_WP_Bridge_Train_4
	goal_kill_all_peds ignore_goal = <goal_id>
	change goal_global_allow_train_creation = false
endscript

script m_chalk3_bw_bridge_pre_activate 
	goal_kill_all_peds
endscript

script m_chalk3_bw_bridge_post_deactivate 
	goal_restore_all_peds
endscript

script m_team_film_pre_activate 
endscript

script m_team_film_post_activate 
	kill \{name = m_team_film_trg_climbing_gap_start}
	kill \{name = m_team_film_trg_climbing_gap_end}
endscript

script m_team_film_post_deactivate 
	SkaterRestoreAfterTemporaryAppearance
endscript

script story_splash_show title = "NEW STORY!" title_s = "Story Title" descr_s = ""
	if NOT gotparam goal_id
		softassert "story_splash_show called without passing goal_id"
		return
	endif
	if gman_haswongoal goal = <goal_id>
		gman_passcheckpoint goal = <goal_id>
	else
		spawnscriptnow story_splash_show_spawned params = <...>
	endif
endscript

script story_splash_show_spawned end_fade_in = 0
	goal_get_track_name goal = <goal_id>
	<track_info> = ($global_goal_track_info.<track_name>)
	<lifestyle> = (<track_info>.lifestyle)
	switch <lifestyle>
		case career
		<lifestyle_heading> = "NEW CAREER STORY!\\n"
		case hardcore
		<lifestyle_heading> = "NEW HARDCORE STORY!\\n"
		case rigger
		<lifestyle_heading> = "NEW RIGGER STORY!\\n"
		default
		<lifestyle_heading> = "NEW STORY!\\n"
	endswitch
	<movie> = (<track_info>.intro_movie)
	<title> = (<lifestyle_heading> + (<track_info>.title))
	Loading_bink_audioparams_start
	goal_ui_get_scheme lifestyle = <lifestyle>
	<rgba> = (<ui_scheme>.main)
	killallmovies blocking
	do_actual_pause
	if (<end_fade_in> = 1)
		fadetoblack on alpha = 1 time = 0 z_priority = -100
	endif
	playsubtitledmovie subbedmovie = {
		no_skip
		container_params = {
			pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			just = [left top]
			child_anchor = [center center]
		}
		helper_params = {
			pos = (0.0, 300.0)
			rgba = [200 200 200 255]
		}
		movie_params = {
			movie = <movie>
			$story_splash_movie_common_params
			pos = (-640.0, -360.0)
			just = [left top]
		}
		events = [
			{
				frame = 10
				create_element = {
					type = textblockelement
					font = text_a1
					text = <title>
					pos = (500.0, 150.0)
					dims = (1000.0, 0.0)
					allow_expansion
					just = [right top]
					internal_just = [right top]
					rgba = <rgba>
					scale = (0.9, 0.75)
					rot_angle = -10
					shadow
					shadow_offs = (2.0, 2.0)
					shadow_rgba = [0 0 0 255]
				}
			}
			{
				frame = 101
				wait_time = 2
			}
		]
	}
	block type = subtitled_movie_killed
	do_actual_unpause
	Loading_bink_audioparams_end
	wait 2 gameframes
endscript

script m_line_museum_int_pre_activate 
	forced_create \{name = Z_Museum_Int_TRG_Rocket_01}
	kill \{name = Z_Museum_Int_TRG_Natas_Rocket_tip_01}
endscript

script m_line_museum_int_post_deactivate 
	kill \{name = Z_Museum_Int_TRG_Rocket_01}
	forced_create \{name = Z_Museum_Int_TRG_Natas_Rocket_tip_01}
endscript

script m_photo_check_monuments_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_check_monuments_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_check_pb_bridge_pre_activate 
	goal_kill_all_peds
	kill \{name = z_pb_bridge_g_water_bcity_side_col}
endscript

script m_photo_check_pb_bridge_post_deactivate 
	goal_restore_all_peds
	forced_create \{name = z_pb_bridge_g_water_bcity_side_col}
endscript

script m_arcade_fdr_exit_restart 
	goal_move_skater \{pos = (450.6333, 1.0345999, -191.29759)
		quat = (0.0, 0.99039996, 0.0)
		zone = z_fdr}
endscript

script m_high_score_run_fdr_post_deactivate 
	m_arcade_fdr_exit_restart
endscript

script m_classic_fdr_post_deactivate 
	m_arcade_fdr_exit_restart
endscript

script m_hawk_man_fdr_post_deactivate 
	m_arcade_fdr_exit_restart
endscript

script m_ru_pre_activate 
	printf \{channel = uber_goals
		"m_ru_pre_activate"}
	goal_kill_all_peds
endscript

script m_ru_post_deactivate 
	printf \{channel = uber_goals
		"m_ru_post_deactivate"}
	goal_restore_all_peds
	forced_create \{name = Z_Slums_junkgate1}
	forced_create \{name = z_slums_junkgate2}
	spawnscript \{Z_Slums_Junk_Crane_defaultstate}
	Destroy_Board_Fire_FX \{objid = skater}
endscript

script m_h3_wallrides_pre_activate 
	if iscreated Z_WP_Bridge_Train_01
		kill name = Z_WP_Bridge_Train_01
	endif
	if iscreated Z_WP_Bridge_train_vibrate_01
		kill name = Z_WP_Bridge_train_vibrate_01
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_01
		kill name = Z_WP_Bridge_train_ghost_bail_01
	endif
	if iscreated Z_WP_Bridge_Train_02
		kill name = Z_WP_Bridge_Train_02
	endif
	if iscreated Z_WP_Bridge_train_vibrate_02
		kill name = Z_WP_Bridge_train_vibrate_02
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_02
		kill name = Z_WP_Bridge_train_ghost_bail_02
	endif
	if iscreated Z_WP_Bridge_Train_03
		kill name = Z_WP_Bridge_Train_03
	endif
	if iscreated Z_WP_Bridge_train_vibrate_03
		kill name = Z_WP_Bridge_train_vibrate_03
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_03
		kill name = Z_WP_Bridge_train_ghost_bail_03
	endif
	if iscreated Z_WP_Bridge_Train_04
		kill name = Z_WP_Bridge_Train_04
	endif
	if iscreated Z_WP_Bridge_train_vibrate_04
		kill name = Z_WP_Bridge_train_vibrate_04
	endif
	if iscreated Z_WP_Bridge_train_ghost_bail_04
		kill name = Z_WP_Bridge_train_ghost_bail_04
	endif
	change goal_global_allow_train_creation = false
	killspawnedscript name = Z_WP_Bridge_Train_2
	killspawnedscript name = Z_WP_Bridge_Train_3
	killspawnedscript name = Z_WP_Bridge_Train_4
endscript

script m_h3_wallrides_post_deactivate 
	change \{goal_global_allow_train_creation = true}
	create \{name = Z_WP_Bridge_Train_01}
endscript

script m_film_mod_monuments_pre_activate 
	goal_kill_all_peds
endscript

script m_film_mod_monuments_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_mod_museums_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_mod_museums_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_bowl_bcity_pre_activate 
	goal_kill_all_peds
endscript

script m_film_bowl_bcity_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_bowl_museums_pre_activate 
	goal_kill_all_peds
endscript

script m_film_bowl_museums_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_bowl_harbor_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_bowl_harbor_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_bowl_monuments_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_bowl_monuments_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_climb_pb_bridge_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_climb_pb_bridge_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_climb_monuments_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_climb_monuments_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_climb_slums_pre_activate 
	goal_kill_all_peds
endscript

script m_film_climb_slums_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_climb_bcity_pre_activate 
	goal_kill_all_peds
endscript

script m_film_climb_bcity_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntg_bcity_pre_activate 
	goal_kill_all_peds
endscript

script m_film_ntg_bcity_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntg_museums_pre_activate 
	goal_kill_all_peds
endscript

script m_film_ntg_museums_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntg_bw_bridge_pre_activate 
	goal_kill_all_peds
endscript

script m_film_ntg_bw_bridge_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_ntg_lansdowne_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_ntg_lansdowne_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_ntt_museums_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_ntt_museums_post_deactivate 
	goal_restore_all_peds
endscript

script m_photo_ntt_slums_pre_activate 
	goal_kill_all_peds
endscript

script m_photo_ntt_slums_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntt_harbor_pre_activate 
	goal_kill_all_peds
endscript

script m_film_ntt_harbor_post_deactivate 
	goal_restore_all_peds
endscript

script m_film_ntt_love_pre_activate 
	goal_kill_all_peds
endscript

script m_film_ntt_love_post_deactivate 
	goal_restore_all_peds
endscript

script m_c3_photo2_pre_activate 
	goal_kill_all_vehicles
endscript

script m_c3_photo2_post_deactivate 
	goal_restore_all_vehicles
	if NOT gman_haswongoal \{goal = m_c3_photo2}
		GMan_PedFunc \{func = kill_peds
			goal = m_c3_photo2
			checkpoint = introIGC
			tool = m_c3_photo2_ped}
		GMan_PedFunc \{func = create_peds
			goal = m_c3_photo2
			checkpoint = introIGC
			tool = m_c3_photo2_ped}
	endif
endscript

script m_c3_epicphoto1_pre_activate 
	goal_kill_all_vehicles
endscript

script m_c3_epicphoto1_post_deactivate 
	goal_restore_all_vehicles
endscript

script m_c3_epicphoto3_pre_activate 
	goal_kill_all_peds ignore_goal = <goal_id>
	goal_photo_remove_default_camera
endscript

script m_c3_epicphoto3_post_deactivate 
	goal_photo_remove_default_camera
	goal_restore_all_peds
endscript

script goal_pro_video_enter 
	if NOT gman_haswongoal goal = <goal_id>
		gman_presentationfunc goal = <goal_id> tool = pro_video func = start
	else
		gman_passcheckpoint goal = <goal_id>
	endif
endscript

script goal_photo_after_preview_wait_land_bail 
	spawnscriptnow goal_photo_after_preview_wait_land_bail_spawned params = {post_wait_script = <post_wait_script>}
endscript

script goal_photo_after_preview_wait_land_bail_spawned 
	block \{anytypes = [
			skaterlanded
			skaterbailed
		]}
	if scriptexists <post_wait_script>
		<post_wait_script>
	endif
endscript

script m_arcade_boundary_prx 
	printf 'm_arcade_boundary_prx'
	if NOT gotparam created
		if NOT gotparam destroyed
			if NOT gotparam goal
				scriptassert 'The arcade boundary script was called without passing goal=goalname'
			endif
			if NOT gotparam prefix
				scriptassert 'The arcade boundary script was called without passing a prefix for the restart nodes'
			endif
			if gotparam inside
				goal_exit_area_end
			else
				goal_exit_area_begin {
					goal = <goal>
					timer = boundary_tmr
					restart_prefix = <prefix>
				}
			endif
		endif
	endif
endscript
g_Z_Love_Fountain_Cam_active = false

script Z_Love_Fountain_Cam_OnExit 
	goal_viewport_kill \{goal_string = 'z_love'}
	change \{g_Z_Love_Fountain_Cam_active = false}
endscript

script m_cribtrain_post_deactivate 
	igc_temporarily_disable_rendering \{3
		gameframes}
	fadetoblack \{on
		alpha = 1
		time = 0}
	fadetoblack \{off
		time = 0.5
		no_wait}
endscript

script m_ru_goal_dialog_box 
	printf channel = uber_goals 'm_ru_goal_dialog_box'
	change goal_dialog_box_active = 1
	if gman_getactivatedgoalid
		gman_pausegoal goal = <activated_goal_id>
	endif
	pauseskaters
	skater :pausephysics
	create_dialog_box {
		title = <title>
		text = <text>
		buttons = [
			{
				text = $str_m_ru_scripts_46
				pad_choose_script = m_ru_goal_dialog_box_ok
			}
			{
				text = $str_m_c1_film1_scripts_43
				pad_choose_script = m_ru_goal_dialog_box_ok
				pad_choose_params = {quit = 1 goal = <activated_goal_id>}
			}
		]
		no_helper_text
	}
	startrendering
	block type = event_ru_dialog_ok
	if gotparam activated_goal_id
		gman_unpausegoal goal = <activated_goal_id>
	endif
	change goal_dialog_box_active = 0
endscript

script m_ru_goal_dialog_box_ok 
	printf \{channel = uber_goals
		'm_ru_goal_dialog_box_ok'}
	dialog_box_exit
	unpauseskaters
	skater :unpausephysics
	broadcastevent \{type = event_ru_dialog_ok}
	if gotparam \{quit}
		wait \{2
			gameframe}
		gman_deactivategoal goal = <goal>
	endif
endscript

script m_c1_invite_introIGC_exit 
	printf \{'m_c1_invite_introIGC_exit'}
	restore_start_key_binding
endscript

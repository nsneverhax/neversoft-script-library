
script goal_training_init_desc_ped 
	<ped_id> :settags is_historical_trigger = false
	spawnscriptnow goal_track_ped_init_trigger params = {ped_id = <ped_id> goal = <goal_id>}
endscript

script m_training_grind_desc_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_grind_desc_chk1_enter 
	m_training_grind_desc_ped :ai_giveorder name = Bv_LookAt params = {name = skater}
	m_training_grind_desc_ped :obj_spawnscript goal_spectator_peds_idle
	changenodeflag nodeflag_slums_training_grind 1
	if iscreated m_training_grind_desc_grind_icon
		m_training_grind_desc_grind_icon :die
	endif
	setsearchallassetcontexts
	createcompositeobject {
		components = [
			{component = suspend}
			{component = motion}
			{component = hover}
			{component = model}
		]
		params = {
			name = m_training_grind_desc_grind_icon
			model = 'Props\\chalk_marker\\chalk_marker.mdl'
			pos = (376.9958, 5.2254, -261.4664)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			scale = 1.2
		}
	}
	setsearchallassetcontexts off
	m_training_grind_desc_grind_icon :obj_roty speed = 200
	m_training_grind_desc_grind_icon :obj_hover amp = 0.25 freq = 2
endscript

script m_training_grind_desc_chk1_exit 
	if iscreated \{m_training_grind_desc_ped}
		GMan_PedFunc \{goal = m_training_grind_desc
			tool = ped
			checkpoint = intro_cuts
			func = kill_peds}
	endif
	if iscreated \{m_training_grind_desc_grind_icon}
		m_training_grind_desc_grind_icon :die
	endif
endscript

script m_training_grind_post_init 
	changenodeflag \{nodeflag_slums_training_grind
		1}
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_grind_checkpoint1_enter 
	killspawnedscript \{name = m_training_grind_outro_enter_spawned}
	goal_ui_display_message \{type = instruction
		text = "Use (\\b6/\\b5) to balance.  Don't lean too far or you will bail."}
endscript

script m_training_grind_checkpoint1_exit 
	Chalk_Quit
	goal_ui_kill_message \{type = instruction}
	if iscreated \{m_training_grind_desc_ped}
		GMan_PedFunc \{goal = m_training_grind_desc
			tool = ped
			checkpoint = intro_cuts
			func = kill_peds}
	endif
endscript

script m_training_grind_outro_enter 
	if gman_haswongoal \{goal = m_training_grind}
		gman_passcheckpoint \{goal = m_training_grind}
	else
		spawnscriptnow \{m_training_grind_outro_enter_spawned}
	endif
endscript

script m_training_grind_outro_enter_spawned 
	goal_rollout_skater
	GMan_PedFunc \{goal = m_training_grind
		tool = ped
		func = create_peds}
	m_training_grind_outro_ped :agent_playcustomanim \{anim = PedM_Clap04_P
		motion_extract = false
		blend_period = 0.2
		pause_movement = true
		play_mode = loop}
	gman_presentationfunc \{goal = m_training_grind
		tool = presentation
		func = start}
endscript

script m_training_grind_outro_exit 
	killspawnedscript \{name = m_training_grind_outro_enter_spawned}
endscript

script m_training_grind_post_deactivate 
	if gman_haswongoal \{goal = m_training_grind}
		if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
			changenodeflag \{nodeflag_slums_training_grind
				0}
			ui_user_add_goal_waypoint \{goal = m_training_manual_desc
				do_object_script_test = false}
		endif
	else
		if NOT GMan_HasWonGoalThisTry \{goal = m_training_grind}
			goal_retry_last_goal
		endif
	endif
endscript

script m_training_manual_desc_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_manual_desc_chk1_enter 
	changenodeflag nodeflag_slums_training_grind 0
	manglechecksums a = m_training_grind b = _goalTrigger
	if iscreated <mangled_id>
		<mangled_id> :die
	endif
	changenodeflag nodeflag_slums_training_manual 1
	if iscreated m_training_manual_desc_grind_icon
		m_training_manual_desc_grind_icon :die
	endif
	setsearchallassetcontexts
	createcompositeobject {
		components = [
			{component = suspend}
			{component = motion}
			{component = hover}
			{component = model}
		]
		params = {
			name = m_training_manual_desc_grind_icon
			model = 'Props\\chalk_marker\\chalk_marker.mdl'
			pos = (359.593, 3.5486, -268.9661)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			scale = 1.2
		}
	}
	setsearchallassetcontexts off
	m_training_manual_desc_grind_icon :obj_roty speed = 200
	m_training_manual_desc_grind_icon :obj_hover amp = 0.25 freq = 2
endscript

script m_training_manual_desc_chk1_exit 
	if iscreated \{m_training_manual_desc_ped}
		GMan_PedFunc \{goal = m_training_manual_desc
			tool = ped
			checkpoint = chk1
			func = kill_peds}
	endif
	if iscreated \{m_training_manual_desc_grind_icon}
		m_training_manual_desc_grind_icon :die
	endif
endscript

script m_training_manual_post_init 
	changenodeflag \{nodeflag_slums_training_manual
		1}
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_manual_checkpoint1_enter 
	goal_ui_display_message \{type = instruction
		text = "Use (\\b7/\\b4) to balance.  Don't lean too far or you will bail."}
	killspawnedscript \{name = m_training_manual_outro_enter_spawned}
endscript

script m_training_manual_checkpoint1_exit 
	Chalk_Quit
	goal_ui_kill_message \{type = instruction}
	if iscreated \{m_training_manual_desc_ped}
		GMan_PedFunc \{goal = m_training_manual_desc
			tool = ped
			checkpoint = chk1
			func = kill_peds}
	endif
endscript

script m_training_manual_outro_enter 
	if gman_haswongoal \{goal = m_training_manual}
		gman_passcheckpoint \{goal = m_training_manual}
	else
		spawnscriptnow \{m_training_manual_outro_enter_spawned}
	endif
endscript

script m_training_manual_outro_enter_spawned 
	goal_rollout_skater
	GMan_PedFunc \{goal = m_training_manual
		tool = ped
		func = create_peds}
	m_training_manual_outro_ped :agent_playcustomanim \{anim = PedM_Clap03_P
		motion_extract = false
		blend_period = 0.2
		pause_movement = true
		play_mode = loop}
	gman_presentationfunc \{goal = m_training_manual
		tool = presentation
		func = start}
endscript

script m_training_manual_outro_exit 
	killspawnedscript \{name = m_training_manual_outro_enter_spawned}
endscript

script m_training_manual_post_deactivate 
	if gman_haswongoal \{goal = m_training_manual}
		if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
			changenodeflag \{nodeflag_slums_training_manual
				0}
			ui_user_add_goal_waypoint \{goal = m_training_qp2rail_desc
				do_object_script_test = false}
		endif
	else
		if NOT GMan_HasWonGoalThisTry \{goal = m_training_manual}
			goal_retry_last_goal
		endif
	endif
endscript

script m_training_qp2rail_desc_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_qp2rail_desc_chk1_enter 
	m_training_qp2rail_desc_ped :ai_giveorder name = Bv_LookAt params = {name = skater}
	m_training_qp2rail_desc_ped :obj_spawnscript goal_spectator_peds_idle
	if NOT getglobalflag flag = $CAREER_TRAINING_DONE
		changenodeflag nodeflag_slums_training_manual 0
		manglechecksums a = m_training_manual b = _goalTrigger
		if iscreated <mangled_id>
			<mangled_id> :die
		endif
	endif
	if iscreated m_training_qp2rail_desc_photo_icon
		m_training_qp2rail_desc_photo_icon :die
	endif
	setsearchallassetcontexts
	createcompositeobject {
		components = [
			{component = suspend}
			{component = motion}
			{component = hover}
			{component = model}
		]
		params = {
			name = m_training_qp2rail_desc_photo_icon
			model = 'props\\digital_camera_icon\\digital_camera_icon.mdl'
			pos = (388.5897, 5.2167, -283.09088)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			scale = 1.2
		}
	}
	setsearchallassetcontexts off
	m_training_qp2rail_desc_photo_icon :obj_roty speed = 200
	m_training_qp2rail_desc_photo_icon :obj_hover amp = 0.25 freq = 2
endscript

script m_training_qp2rail_desc_chk1_exit 
	if iscreated \{m_training_qp2rail_desc_photo_icon}
		m_training_qp2rail_desc_photo_icon :die
	endif
	if iscreated \{m_training_qp2rail_desc_ped}
		GMan_PedFunc \{goal = m_training_qp2rail_desc
			tool = ped
			checkpoint = intro_cuts
			func = kill_peds}
	endif
endscript

script m_training_qp2rail_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_qp2rail_post_deactivate 
	if getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_restore_all_peds
	elseif gman_haswongoal \{goal = m_training_qp2rail}
		ui_user_add_goal_waypoint \{goal = m_training_revman_desc
			do_object_script_test = false}
	endif
endscript

script m_training_revman_desc_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_revman_desc_chk1_enter 
	m_training_revman_desc_ped :Teleport position = (374.73788, 4.2085996, -296.80548)
	m_training_revman_desc_ped :ai_giveorder name = Bv_LookAt params = {name = skater}
	m_training_revman_desc_ped :obj_spawnscript goal_spectator_peds_idle
	if iscreated m_training_revman_desc_film_icon
		m_training_revman_desc_film_icon :die
	endif
	setsearchallassetcontexts
	createcompositeobject {
		components = [
			{component = suspend}
			{component = motion}
			{component = hover}
			{component = model}
		]
		params = {
			name = m_training_revman_desc_film_icon
			model = 'photo_camera\\photo_camera.mdl'
			pos = (375.9185, 5.2236996, -294.7069)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			scale = 1.0
		}
	}
	setsearchallassetcontexts off
	m_training_revman_desc_film_icon :obj_roty speed = 200
	m_training_revman_desc_film_icon :obj_hover amp = 0.25 freq = 2
endscript

script m_training_revman_desc_chk1_exit 
	if iscreated \{m_training_revman_desc_film_icon}
		m_training_revman_desc_film_icon :die
	endif
	if iscreated \{m_training_revman_desc_ped}
		GMan_PedFunc \{goal = m_training_revman_desc
			tool = ped
			checkpoint = chk1
			func = kill_peds}
	endif
endscript

script m_training_revman_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_revman_post_deactivate 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		if gman_haswongoal \{goal = m_training_revman}
			ui_user_add_goal_waypoint \{goal = m_training_line_desc
				do_object_script_test = false}
		endif
	endif
endscript

script m_training_line_desc_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_training_line_desc_chk1_enter 
	if iscreated m_training_qp2rail_desc_photo_icon
		m_training_qp2rail_desc_photo_icon :die
	endif
	setsearchallassetcontexts
	createcompositeobject {
		components = [
			{component = suspend}
			{component = motion}
			{component = hover}
			{component = model}
		]
		params = {
			name = m_training_line_desc_line_icon
			model = 'GameObjects\\line_challenge_goal_icon\\line_challenge_goal_icon.mdl'
			pos = (391.2918, 6.6168003, -275.86887)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			scale = 1.0
		}
	}
	setsearchallassetcontexts off
	m_training_line_desc_line_icon :obj_roty speed = 200
	m_training_line_desc_line_icon :obj_hover amp = 0.25 freq = 2
endscript

script m_training_line_desc_flash_qp 
	begin
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = z_slums_g_cretehouses_qp03 color_index = 15}
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = Z_Slums_g_tb_sl_rail_ware_72 color_index = 15}
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = z_slums_g_tb_sl_roadsidewalk_01_jersey color_index = 15}
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = z_slums_g_tb_sl_slvlobj_46 color_index = 15}
	wait 0.5 seconds
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = z_slums_g_cretehouses_qp03 color_index = 0}
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = Z_Slums_g_tb_sl_rail_ware_72 color_index = 0}
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = z_slums_g_tb_sl_roadsidewalk_01_jersey color_index = 0}
	GMan_TrickObjFunc goal = m_training_line_desc tool = trickobj func = color_object params = {id = z_slums_g_tb_sl_slvlobj_46 color_index = 0}
	wait 0.5 seconds
	repeat
endscript

script m_training_line_desc_chk1_exit 
	if iscreated \{m_training_line_desc_line_icon}
		m_training_line_desc_line_icon :die
	endif
	if iscreated \{m_training_line_desc_ped}
		GMan_PedFunc \{goal = m_training_line_desc
			tool = ped
			checkpoint = chk1
			func = kill_peds}
	endif
	killspawnedscript \{name = m_training_line_desc_flash_qp}
endscript

script m_line_slums_post_init 
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_kill_all_peds
	endif
endscript

script m_line_slums_checkpoint1_enter 
	killspawnedscript \{name = m_line_slums_outro_enter_spawned}
	goal_line_challenge_enter
endscript

script m_line_slums_outro_cuts_enter 
	if gman_haswongoal \{goal = m_line_slums}
		gman_passcheckpoint \{goal = m_line_slums}
	else
		spawnscriptnow \{m_line_slums_outro_enter_spawned}
	endif
endscript

script m_line_slums_outro_enter_spawned 
	GMan_PedFunc \{goal = m_line_slums
		tool = ped
		func = create_peds}
	gman_presentationfunc \{goal = m_line_slums
		tool = presentation
		func = start}
endscript

script m_line_slums_outro_cuts_exit 
	killspawnedscript \{name = m_line_slums_outro_enter_spawned}
	if NOT getglobalflag \{flag = $CAREER_TRAINING_DONE}
		goal_move_skater \{pos = (375.9774, 0.24920002, -214.5627)
			quat = (0.0, 0.2316, -0.0)}
	endif
endscript

script m_line_slums_post_deactivate 
	if gman_haswongoal \{goal = m_line_slums}
		goal_restore_all_peds
	else
		if NOT GMan_HasWonGoalThisTry \{goal = m_line_slums}
			goal_retry_last_goal
		endif
	endif
endscript

script intraining 
	return \{false}
endscript

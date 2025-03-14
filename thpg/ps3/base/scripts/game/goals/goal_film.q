goal_video_saved_a_video = 0
m_team_film_save_string = "Team Film"

script goal_film_start_recording \{cyclic = false}
	if NOT skater :export_isrecording
		spawnscriptnow goal_film_start_recording_spawned params = {cyclic = <cyclic>}
	endif
endscript

script goal_film_start_recording_spawned \{cyclic = false}
	change \{goal_video_saved_a_video = 0}
	if ve_in_recordable_area
		printf \{"goal_film_start_recording_spawned"}
		killskatercamanim \{all}
		ve_prep_for_recording
		ve_start_recording_clip area = <area> end_state = NOSTATE_RETURN_TO_GAMEPLAY cyclic = <cyclic>
	else
		softassert \{"Cannot record in this area."}
	endif
endscript
goal_film_showing_options = false

script goal_film_clip_options 
	wait_for_script_to_finish name = ui_video_editor_save_clip_to_mc
	wait_for_script_to_finish name = do_autosave
	if NOT ($video_clip_saving_checksum = none)
		scriptassert 'Problem with saving film goal clip... Save is still happening'
	endif
	ve_free_bink_buffers
	printf "goal_film_clip_options"
	if ($goal_video_saved_a_video = 1)
		change goal_save_extra_data = 1
		goal_film_done_dialog
	else
		if ve_check_good_clip clip = ($ve_rec_clip_name)
			if NOT gman_getactivatedgoalid
				scriptassert "goal_film_clip_options called while film goal not active"
			else
				change goal_film_showing_options = true
				gman_presentationfunc {
					goal = <activated_goal_id>
					tool = clip_options
					func = start
				}
			endif
		else
			goal_film_done_dialog
		endif
	endif
endscript

script goal_film_get_clip_name 
	gman_getactivatedgoalid
	if NOT gman_getconstant goal = <activated_goal_id> name = view_goals_title
		view_goals_title = "GoalVideo"
	endif
	if (<activated_goal_id> = m_team_film)
		view_goals_title = $m_team_film_save_string
	endif
	return clip_name = <view_goals_title>
endscript

script goal_film_get_camera 
	clip_camera = `default`
	gman_getactivatedgoalid
	if gman_getconstant goal = <activated_goal_id> name = custom_cam
		<clip_camera> = goal
		<goal_camera> = <custom_cam>
	endif
	if gman_getconstant goal = <activated_goal_id> name = custom_cam_array
		<clip_camera> = goal
		<goal_camera> = (<custom_cam_array> [<cam_index>])
	endif
	return goal_camera = <goal_camera> clip_camera = <clip_camera>
endscript

script goal_film_get_clip_speed 
	<clip_speed> = 0.5
	if gman_getconstant goal = <activated_goal_id> name = film_sponsor
		if (<film_sponsor> = Transworld)
			<clip_speed> = 1.0
		else
		endif
	endif
	return clip_speed = <clip_speed>
endscript

script goal_film_space_for_new_clip 
	if gotparam goal_id
		if (<goal_id> = m_team_film)
			if MC_IsPaddingSlotAvailable filetype = videoclip
				printf 'Space for team filmer goal clip in padding!'
				return true
			endif
			printf 'No space for team filmer goal in padding... Going to use extra space for it...'
		endif
	endif
	if MC_SpaceForNewFile filetype = videoclip
		return true
	else
		printf 'No extra space for saving film goal clip'
		return false
	endif
endscript

script goal_film_clip_action cam_index = 0
	printf "goal_film_clip_action"
	goal_ui_kill_message type = uberalert
	goal_exit_area_end
	skater :unhide
	gman_getactivatedgoalid
	goal_film_get_camera cam_index = <cam_index>
	change ve_rec_clip_data = {
		($ve_rec_clip_data)
		goal_camera = <goal_camera>
		goal_id = <activated_goal_id>
	}
	goal_film_remove_screen_fx
	switch <action>
		case play
		goal_film_get_clip_speed
		spawnscriptnow ve_play_clips params = {
			clips = [
				{
					name = ($ve_rec_clip_name)
					clip_camera = <clip_camera>
					clip_speed = <clip_speed>
				}
			]
			end_state = UIstate_goal_film_clip_options
			no_slot_loading
			no_loading
			disable_and_reenable_streaming
		}
		wait 2 gameframes
		skater :hide
		hide_all_hud_items
		case save
		if game_progress_check_valid_save freeze_skater force_wait_frames = 2
			if ve_can_create_new_clip
				if goal_film_space_for_new_clip goal_id = <activated_goal_id>
					skater :pausephysics
					pauseskaters
					skater :disableplayerinput
					kill_start_key_binding
					change goal_video_saved_a_video = 1
					goal_film_get_clip_name activated_goal_id = <activated_goal_id>
					change video_clip_saving_team_goal_clip = 0
					if (<activated_goal_id> = m_team_film)
						change video_clip_saving_team_goal_clip = 1
						change ve_rec_clip_data = {
							($ve_rec_clip_data)
							team_film_name = <clip_name>
						}
					endif
					ui_video_editor_save_clip_to_mc textname = <clip_name>
				else
					spawnscriptnow goal_film_dialog_no_space params = {text = "No space to save new clips. Please delete some existing data."}
				endif
			else
				spawnscriptnow goal_film_dialog_no_space params = {text = "Have maximum clips, delete some to make room."}
			endif
		else
			spawnscriptlater goal_film_clip_options
		endif
		case done
		goal_film_done_dialog
	endswitch
endscript

script goal_film_dialog_no_space 
	printf \{'goal_film_dialog_no_space'}
	wait \{2
		gameframes}
	create_dialog_box {
		title = "Video Recorder"
		text = <text>
		buttons = [{text = "ok" pad_choose_script = goal_film_done_dialog}
		]
	}
endscript

script goal_film_done_dialog 
	skater :unpausephysics
	unpauseskaters
	spawnscriptnow \{ve_restore_temp_changes}
	ve_free_recorded_clip
	gman_getactivatedgoalid
	if NOT gman_getconstant goal = <activated_aoal_id> name = dont_pass_checkpoint_on_clip_save
		gman_passcheckpoint goal = <activated_goal_id>
	endif
	change \{goal_film_showing_options = false}
	broadcastevent \{type = goal_film_done_dialog_done}
endscript

script goal_film_stop_recording_from_pause 
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c1_film2)
			gman_getcurrentcheckpoint \{goal = m_c1_film2}
			if (<current_checkpoint> = trees_gap)
				return
			endif
		endif
	endif
	goal_dialog_box \{title = "Stopped Recording"
		text = "Recording has stopped because the game was paused."}
endscript
goal_film_stopping = false

script goal_film_stop \{display_options = false}
	if (<display_options> = true)
		change \{goal_film_stopping = true}
		kill_start_key_binding
	endif
	spawnscriptnow goal_film_stop_spawned params = {display_options = <display_options>}
endscript

script goal_film_stop_spawned 
	printf \{"goal_film_stop_spawned"}
	ve_stop_recording \{object = skater}
	if (<display_options> = true)
		goal_rollout_skater
		wait \{2
			gameframes}
		unpausespawnedscript \{record_stop_immediate_export}
		change \{goal_film_stopping = false}
		goal_film_clip_options
	else
		ve_free_recorded_clip
	endif
endscript

script goal_film_reset 
	if gman_getactivatedgoalid
		<do_reset> = true
		if gotparam \{goal_id}
			if NOT checksumequals a = <goal_id> b = <activated_goal_id>
				<do_reset> = false
			endif
		endif
	else
		<do_reset> = false
	endif
	if (<do_reset> = true)
		spawnscriptlater \{goal_film_reset_spawned}
	endif
endscript

script goal_film_reset_spawned 
	goal_rollout_skater
	goal_retry_current_goal
endscript

script goal_film_cleanup 
	killspawnedscript \{name = goal_film_reset_spawned}
	if skater :export_isrecording
		spawnscriptnow \{goal_film_cleanup_spawned}
	else
		spawnscriptnow \{ve_restore_temp_changes}
	endif
endscript

script goal_film_cleanup_spawned 
	printf \{"goal_film_cleanup_spawned"}
	ve_stop_recording \{object = skater}
	ve_free_recorded_clip
	ve_free_bink_buffers
	spawnscriptnow \{ve_restore_temp_changes}
endscript

script goal_film_add_screen_fx 
	printf "goal_film_add_screen_fx"
	screenfx_addfxinstance {name = film_goal_DOF viewport = 0 type = dof on = 1 backdist = 0.022499999 strength = 0.6 crossfade = 1.0}
	screenfx_addfxinstance {name = film_goal_Fisheye viewport = 0 type = fisheye on = 1 warp_strength = 0.2}
	screenfx_addfxinstance {name = film_goal_Bloom viewport = 0 type = bloom on = 1 autoluminancemod = 1 distancemod = 1.0 bloom1 = 0.5 bloom2 = 0.5 strength = [200 160 90] color = [120 120 255]}
endscript

script goal_film_remove_screen_fx 
	printf \{"goal_film_remove_screen_fx"}
	if screenfx_fxinstanceexists \{viewport = 0
			name = film_goal_DOF}
		screenfx_removefxinstance \{viewport = 0
			name = film_goal_DOF}
	endif
	if screenfx_fxinstanceexists \{viewport = 0
			name = film_goal_Fisheye}
		screenfx_removefxinstance \{viewport = 0
			name = film_goal_Fisheye}
	endif
	if screenfx_fxinstanceexists \{viewport = 0
			name = film_goal_Bloom}
		screenfx_removefxinstance \{viewport = 0
			name = film_goal_Bloom}
	endif
endscript

script goal_film_clip_from_goal 
	if VideoEditorFunc get_clip name = <clip>
		if structurecontains structure = <clip> goal_id
			if ((<clip>.goal_id) = <goal_id>)
				return \{true}
			endif
		endif
	endif
endscript

script goal_film_clips_from_goal 
	i = 0
	getarraysize <clips>
	if (<array_size> > 0)
		begin
		if goal_film_clip_from_goal clip = ((<clips> [<i>]).name) goal_id = <goal_id>
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script goal_check_add_clip 
	getarraysize <clips>
	if (<array_size> > 0)
		if NOT goal_film_clips_from_goal goal_id = m_team_film clips = <clips>
			if goal_film_clip_from_goal goal_id = m_team_film clip = <add_clip>
				return \{false}
			endif
		endif
	endif
	if goal_film_clips_from_goal goal_id = m_team_film clips = <clips>
		if NOT goal_film_clip_from_goal goal_id = m_team_film clip = <add_clip>
			return \{false}
		endif
	endif
	return \{true}
endscript

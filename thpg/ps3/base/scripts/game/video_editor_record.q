ve_rec_clip_name = 'recorded_clip'
ve_save_clip_slot = -1
ve_saving_add_user_cam = 0
ve_max_record_time = 15.0
ve_rec_clip_data = {
}
ve_recording_camera_hosed = none

script ve_start_recording_clip end_state = UIstate_video_editor_clip_recorded_menu cyclic = false temporarily_allow_streaming = 0
	if objectexists id = ped_speech_dialog
		destroyscreenelement id = ped_speech_dialog
	endif
	ve_set_recording_area
	WriteRigAKitPiecesToArray array_name = rak_pieces
	GetCurrentSkaterProfileIndex
	GetPlayerAppearance player = <currentskaterprofileindex>
	WriteNodeFlagsToStruct
	if IsInCrib
		crib_theme = ($crib_current_settings.zone)
	endif
	ve_clear_rec_clip_data
	change ve_rec_clip_data = {
		area = <area>
		rak_pieces = <rak_pieces>
		nodeflags = <nodeflags>
		cas = <profile>
		crib_theme = <crib_theme>
		weather = {
			rain_start = ($CurRainIntensity)
			rain_light_start = ($CurRainLightingIntensity)
			rain_puddles_start = ($currainpuddlesintensity)
			tod_settings = ($currenttodsettings)
		}
	}
	ve_record_new_clip {
		max_time = ($ve_max_record_time)
		end_state = <end_state>
		invalid_data_state = <end_state>
		clip_name = ($ve_rec_clip_name)
		cyclic = <cyclic>
		temporarily_allow_streaming = <temporarily_allow_streaming>
	}
	spawnscriptlater ve_area_check_script
endscript

script ve_record_new_clip cyclic = false temporarily_allow_streaming = 0
	if skater :export_isrecording
		scriptassert 've_new_clip - Currently recording'
	endif
	restore_start_key_binding
	change CycleWeather = 0
	if (<temporarily_allow_streaming> = 1)
		if NOT IsInCrib
			EnablePakManStreaming
		endif
	endif
	ve_set_memory_state state = record
	skater :initsoundrecordingsystem heap = topdownheap multiplier = ($ve_current_mem_multiplier)
	ve_fix_missing_skater_board
	if NOT gman_hasactivegoals
		goal_ui_kill_all_messages
	endif
	change ve_recording_camera_hosed = none
	skater :record_start {
		name = <clip_name>
		time = <max_time>
		cyclic = <cyclic>
		StopCallback = ve_recorded_clip
		StopCallbackParams = {
			time = <max_time>
			end_state = <end_state>
			invalid_data_state = <invalid_data_state>
			object_id = skater
			temporarily_allow_streaming = <temporarily_allow_streaming>
			cyclic = <cyclic>
		}
	}
	skater :startsoundrecording
	change allow_auto_kick = false
endscript

script ve_clear_rec_clip_data 
	change \{ve_rec_clip_data = {
		}}
endscript

script ve_recorded_clip 
	printf 've_recorded_clip - start'
	change allow_auto_kick = true
	if NOT gotparam rerecord_camera
		change CycleWeather = 1
	endif
	kill_start_key_binding
	if gotparam temporarily_allow_streaming
		if (<temporarily_allow_streaming> = 1)
			DisablePakManStreaming
		endif
	endif
	if gotparam NoData
		printf 'INVALID DATA'
		ve_clear_rec_clip_data
	else
		formattext textname = text "%s" s = <name>
		skater :export_geteventlist
		ve_get_zones_for_recorded_clip name = <name> elapsed_duration = <elapsed_duration>
		change ve_rec_clip_data = {
			($ve_rec_clip_data)
			weather = {
				(($ve_rec_clip_data).weather)
				rain_end = ($CurRainIntensity)
				rain_light_end = ($CurRainLightingIntensity)
				rain_puddles_end = ($currainpuddlesintensity)
			}
			zones = <recorded_zones>
			extra_zones = <recorded_extra_zones>
			event_list = <event_list>
		}
	endif
	skater :export_cleareventlist
	if ($ve_panic_unload = 1)
		ve_free_recorded_clip
		return
	endif
	if gotparam end_state
		if checksumequals a = <end_state> b = NOSTATE_RETURN_TO_GAMEPLAY
			if ($goal_film_stopping = false)
				restore_start_key_binding
			endif
		else
			do_actual_pause <...>
			unpausespawnedscript sysnotify_invite_go
			hide_panel_stuff
			if ($is_changing_levels = 1)
				return
			endif
			if ve_should_cancel_recording
				create_dialog_box {title = "Video Recorder"
					text = "You left the recording area."
					buttons = [{text = "ok" pad_choose_script = ui_create_video_editor_clip_recorded_menu}
					]
				}
			elseif (($ve_recording_camera_hosed) = paused)
				create_dialog_box {title = "Video Recorder"
					text = "The camera shut-off\\n... But we got some footage."
					buttons = [{text = "ok" pad_choose_script = ui_create_video_editor_clip_recorded_menu}
					]
				}
			elseif NOT (($ve_recording_camera_hosed) = none)
				create_dialog_box {title = "Video Recorder"
					text = "Your camera got hosed!\\n... But we got some footage."
					buttons = [{text = "ok" pad_choose_script = ui_create_video_editor_clip_recorded_menu}
					]
				}
			else
				if gotparam NoData
					ui_change_state state = <invalid_data_state>
				else
					ui_change_state state = <end_state>
				endif
			endif
		endif
	endif
	printf 've_recorded_clip - end'
endscript

script ve_stop_recording 
	printf \{'ve_stop_recording - Export_stop'}
	<object> :export_stop
	printf \{'ve_stop_recording - Export_stop'}
	begin
	if NOT scriptisrunning \{ve_recorded_clip}
		break
	endif
	wait \{1
		gameframe}
	printf \{'ve_stop_recording - waiting...'}
	repeat
endscript

script ve_wait_for_record_to_finish 
	printf \{'ve_wait_for_record_to_finish'}
	if export_isrecording
		printf \{'ve_wait_for_record_to_finish - Waiting'}
		begin
		if NOT export_isrecording
			break
		endif
		printf \{'ve_wait_for_record_to_finish - Waiting...'}
		wait \{1
			gameframe}
		repeat
	endif
endscript

script ve_add_clip_to_career_profile 
	printf 've_add_clip_to_career_profile'
	replay_get_length name = ($ve_rec_clip_name)
	VideoEditorFunc get_clip_count
	i = 0
	if (<count> > 0)
		begin
		VideoEditorFunc get_clip index = <i>
		if ((<clip>.name) = <name>)
			printf 'Removed clip from profile, overwritten clip'
			VideoClipSlotFunc remove_clip name = (<clip>.name)
			VideoEditorFunc remove_clip index = <i>
			ve_delete_clip_from_edits clip = <name>
			break
		endif
		i = (<i> + 1)
		repeat <count>
	endif
	if NOT ve_can_create_new_clip
		softassert 'Cannot save this clip, profile if out of room'
	else
		printf 'Putting %s clip into profile...' s = <name>
		VideoEditorFunc add_clip clip = {
			name = <name>
			time = <length>
			text = <text>
			area = (($ve_rec_clip_data).area)
			zones = (($ve_rec_clip_data).zones)
			extra_zones = (($ve_rec_clip_data).extra_zones)
			goal_id = (($ve_rec_clip_data).goal_id)
			team_film_name = (($ve_rec_clip_data).team_film_name)
		}
		printf 'Done!'
		ve_clear_rec_clip_data
	endif
	printf 'Removing the recording asset...'
	ve_free_recorded_clip
	printf 'Done!'
endscript

script ve_free_recorded_clip 
	replay_remove_asset name = ($ve_rec_clip_name)
	if compositeobjectexists \{skater}
		skater :releasesoundrecordingmemory
	endif
endscript

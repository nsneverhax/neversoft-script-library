ve_rendering_cancelled = 0
ve_uploading_cancelled = 0
ve_uploading_done = 0
ve_render_submission = none
ve_saving_downloaded_render = 0
ve_achievement_score = 20000

script ui_create_video_editor_rendering 
	printf \{'ui_create_video_editor_rendering'}
	ve_create_hide_lod_ui
	VideoEditorFunc get_edit index = ($ve_current_edit_index)
	spawnscriptnow ve_render_edit params = {
		clips = ($ve_current_edit_clips)
		effects = ($ve_current_edit_effects)
		overlays = ($ve_current_edit_overlays)
		audio = ($ve_current_edit_audio)
		text = (<edit>.text)
		end_state = UIstate_video_editor_Main
		no_loading
	}
endscript

script ui_destroy_video_editor_rendering 
	ve_destroy_hide_lod_ui
	if NOT istrue \{$signin_change_happening}
		printf \{'ui_destroy_video_editor_rendering'}
		pausegame
		skater :pause
		skatercam0 :pause
	else
		printf \{'ui_destroy_video_editor_rendering - sign in change'}
	endif
endscript

script ve_render_edit 
	render_clip_count = 0
	original_clip_count = 0
	render_clips = []
	change ve_rendering_cancelled = 0
	printf 've_render_edit'
	ve_trim_edit_to_time {
		clips = <clips>
		time = ($video_render_length)
	}
	ve_calculate_edit_score {
		clips = <clips>
		effects = <effects>
		overlays = <overlays>
		audio = <audio>
	}
	generic_ui_destroy
	if ($ve_render_submission = none)
		ve_render_edit_step_two <...>
	else
		if (<score> >= $ve_achievement_score)
			writeachievements achievement = ach_sk0_video
		endif
		<is_final_edit> = false
		<unique_pros> = 0
		if ve_get_clips_area clips = <clips>
			printf 've_render_edit - area: %a' a = <area>
			switch <area>
				case Area_Philly
				setglobalflag flag = $VIDEO_EDIT_PHILLY_DONE
				case Area_Baltimore
				setglobalflag flag = $VIDEO_EDIT_BALT_DONE
				case Area_DC
				setglobalflag flag = $VIDEO_EDIT_DC_DONE
				case Area_Crib
				goal_video_edit_count_unique_pros clips = <clips>
				if gman_haswongoal goal = m_team_film
					if goal_film_clips_from_goal goal_id = m_team_film clips = <clips>
						if (<unique_pros> > 0)
							setglobalflag flag = $VIDEO_EDIT_CRIB_DONE
							<is_final_edit> = true
						endif
					endif
				endif
			endswitch
			careerfunc func = updateatoms
			if isps3
				netsessionfunc func = stats_init
				send_leader_board_message leaderboard_id = ($ve_render_submission) score = <score>
			endif
		endif
		if (<is_final_edit> = true)
			<legal_box_title> = "Submission of Team Video Edit"
			<submit_box_title> = "Submission of Team Video Edit"
			formattext textname = msgbox_text "Well done, your Team Video Edit has been sent to the publishers!\\nThey scored it at %d points." d = <score>
		else
			<legal_box_title> = "Submission To Volcom"
			<submit_box_title> = "Submission To Volcom"
			formattext textname = msgbox_text "Well done, Volcom accepted your video edit!\\nThey scored it at %d points." d = <score>
		endif
		if isps3
			<legal_box_text> = "Submits your video score only. No actual video data, footage, music, or other materials will be transferred or uploaded from your PLAYSTATION®3 system."
		else
			<legal_box_text> = "Submits your video editing data only. No actual footage, music, or other materials will be transferred or uploaded from your Xbox 360 console."
		endif
		0x5edfbd20 = 0
		if isps3
			if NOT checkforsignin
				0x5edfbd20 = 1
			endif
		endif
		if (<0x5edfbd20> = 0)
			create_dialog_box {
				title = <legal_box_title>
				text = <legal_box_text>
				buttons = [
					{text = "OK" pad_choose_script = ve_render_edit_legal_ok}
				]
				preserve_case
				text_dims = (800.0, 0.0)
				vmenu_width = 700
				additional_highlight_scale = (0.25, 0.0)
			}
			block type = ve_render_edit_legal_done
		endif
		if isps3
			msgbox_buttons = [{text = "OK" pad_choose_script = ve_render_edit_cancel_submission}]
		elseif isxenon
			if NOT checkforsignin local
				formattext {
					textname = msgbox_text
					"%s\\nUnfortunately you are not signed into an Xbox LIVE account, so cannot submit this video to the leaderboards."
					s = <msgbox_text>
				}
				msgbox_buttons = [{text = "OK" pad_choose_script = ve_render_edit_cancel_submission}]
			else
				if NOT checkforsignin
					formattext {
						textname = msgbox_text
						"%s\\nThe current Gamer Profile is not enabled for Xbox LIVE multiplayer game play or the network connection has been lost, so cannot submit this video to the leaderboards."
						s = <msgbox_text>
					}
					msgbox_buttons = [{text = "OK" pad_choose_script = ve_render_edit_cancel_submission}]
				else
					formattext {
						textname = msgbox_text
						"%s\\nDo you wish to submit your edit to the leaderboards?"
						s = <msgbox_text>
					}
					msgbox_buttons = [{text = "Submit To Leaderboard" pad_choose_script = ve_render_edit_step_two pad_choose_params = {<...>}}
						{text = "No Thanks" pad_choose_script = ve_render_edit_cancel_submission}]
				endif
			endif
		endif
		if (<is_final_edit> = false)
			if (<unique_pros> > 0)
				msgbox_text = "You cannot submit a Team Video Edit until the goal has been completed.\\nGo back and record some more footage, at least three clips must be recorded in one run."
				msgbox_buttons = [{text = "OK" pad_choose_script = ve_render_edit_cancel_submission}]
			endif
		endif
		create_dialog_box {title = <submit_box_title>
			text = <msgbox_text>
			buttons = <msgbox_buttons>
			preserve_case
			text_dims = (800.0, 0.0)
			vmenu_width = 700
			additional_highlight_scale = (0.25, 0.0)
		}
	endif
endscript

script ve_render_edit_legal_ok 
	destroy_dialog_box
	broadcastevent \{type = ve_render_edit_legal_done}
endscript

script ve_render_edit_cancel_submission 
	ui_change_state \{state = UIstate_video_editor_Edit_View}
endscript

script ve_render_edit_step_two 
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	ve_set_memory_state state = render
	ve_kill_preview_scripts
	unique_name_map = {}
	unique_names = []
	getarraysize <clips>
	i = 0
	begin
	formattext checksumname = indexed_unique_name 'render_%d' d = <i>
	clip_name = ((<clips> [<i>]).name)
	if ve_should_render_clip clips = <clips> render_clip = <clip_name>
		render_clip_count = (<render_clip_count> + 1)
		addarrayelement array = <unique_names> element = <indexed_unique_name>
		unique_names = <array>
	else
		if ve_should_save_clip clips = <clips> index = <i>
			original_clip_count = (<original_clip_count> + 1)
			if structurecontains structure = <unique_names> <clip_name>
				scriptassert 'Error'
			endif
			appendstruct struct = unique_name_map field = <clip_name> params = {name = <indexed_unique_name>}
		endif
		addarrayelement array = <unique_names> element = ((<unique_name_map>.<clip_name>).name)
		unique_names = <array>
	endif
	i = (<i> + 1)
	repeat <array_size>
	getarraysize <unique_names>
	if NOT (<i> = <array_size>)
		scriptassert 'Unique name building failed'
	endif
	printstruct {<unique_names>}
	ve_create_actor_and_camera
	ve_create_rendering_ui ReplayActorName = <ReplayActorName>
	if (<render_clip_count> = 0)
		begin
		if ($ve_rendering_cancelled = 1)
			break
		endif
		wait 1 gameframe
		repeat 60
	endif
	if ($ve_rendering_cancelled = 0)
		EditBufferFunc func = start_writing num_clips = (<render_clip_count> + <original_clip_count>)
		getarraysize <clips>
		i = 0
		begin
		edit_clip = (<clips> [<i>])
		unique_name = (<unique_names> [<i>])
		if ve_should_render_clip clips = <clips> render_clip = (<edit_clip>.name)
			printf 'Rendering %s to %t' s = (<edit_clip>.name) t = <unique_name>
			if NOT ve_ensure_clips_loaded clips = [{<edit_clip>}]
				ve_render_handle_error text = "Error loading clip"
				return false
			endif
			wait 4 gameframes
			ve_get_original_clip_length clip = (<edit_clip>.name)
			original_anim_length = <length>
			ve_get_edit_clip_length edit_clip = <edit_clip>
			edit_clip_length = <length>
			unpausegame
			if (<edit_clip>.clip_speed < 1.0)
				override_speed = 1.0
				edit_clip_length = (<length> * (<edit_clip>.clip_speed))
			else
				removeparameter override_speed
			endif
			render_camera = `default`
			if ((<edit_clip>.clip_camera) = user)
				render_camera = user
				user_camera_used = user
			else
				removeparameter user_camera_used
			endif
			ve_play_clips {
				clips = [{<edit_clip> clip_speed = <override_speed> clip_camera = <render_camera>}]
				no_loading
				no_stopping
				no_slot_loading
				play_animation_only = 1
				ReplayActorName = <ReplayActorName>
				pre_play_callback = ve_render_pre_play
				pre_play_callback_params = {record_length = (<edit_clip_length> + 0.5)}
				post_play_callback = ve_render_post_play
			}
			<ReplayActorName> :anim_command target = bodytimer command = timer_wait
			wait 2 gameframes
			if NOT replay_asset_exists name = ($ve_rec_clip_name)
				ve_render_handle_error text = "Error recording trimmed clip"
				return false
			endif
			if NOT replay_camera_asset_exists name = ($ve_rec_clip_name)
				ve_render_handle_error text = "Error recording camera"
				return false
			endif
			ve_recreate_actor name = <ReplayActorName>
			replay_get_length name = ($ve_rec_clip_name)
			render_speed = (<length> / <edit_clip_length>)
			if gotparam override_speed
				render_speed = (<render_speed> * (<edit_clip>.clip_speed))
			endif
			new_clip_entry_in_render = {
				<edit_clip>
				name = <unique_name>
				clip_start = 0.0
				clip_end = <length>
				clip_speed = <render_speed>
				clip_camera = <user_camera_used>
				original_clip_start = (<edit_clip>.clip_start)
				original_clip_end = (<edit_clip>.clip_end)
				original_clip_speed = (<edit_clip>.clip_speed)
				original_clip_length = <original_anim_length>
			}
			new_array_entry = [{<new_clip_entry_in_render>}]
			render_clips = (<render_clips> + <new_array_entry>)
			if NOT EditBufferFunc func = write_clip clip_slot = 0 name = <unique_name> recorded_render
				ve_render_handle_error text = "Out of memory adding trimmed clip to render"
				return false
			endif
			replay_remove_asset name = ($ve_rec_clip_name)
			wait 4 gameframes
		else
			if ve_should_save_clip clips = <clips> index = <i>
				if NOT ve_ensure_clips_loaded clips = [{<edit_clip>}]
					ve_render_handle_error text = "Error loading clip"
					return false
				endif
				if NOT EditBufferFunc func = write_clip clip_slot = 0 name = <unique_name>
					ve_render_handle_error text = "Out of memory adding clip to render"
					return false
				endif
			endif
			new_array_entry = [{<edit_clip> name = <unique_name>}]
			render_clips = (<render_clips> + <new_array_entry>)
		endif
		if ($ve_rendering_cancelled = 1)
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if NOT ($ve_render_submission = none)
			ve_render_get_gamertag
		endif
		if ($ve_rendering_cancelled = 0)
			if NOT EditBufferFunc func = finish_writing edit = {
					text = <text>
					clips = <render_clips>
					effects = <effects>
					overlays = <overlays>
					audio = <audio>
					rendered_edit
					gamertag = <gamertag>
					edit_score = <score>
				}
				ve_render_handle_error text = "Out of memory adding edit to render"
				return false
			endif
		endif
	endif
	replay_remove_asset name = ($ve_rec_clip_name)
	ve_cleanup_render_ui <...>
	ve_kill_preview_scripts
	if ($ve_rendering_cancelled = 1)
		pausegame
		EditBufferFunc func = clear
		ve_set_memory_state state = playback
		ui_change_state state = UIstate_video_editor_Main
	else
		printstruct <...>
		if ($ve_render_submission = none)
			ui_video_editor_save_render_to_mc filename = <text>
		else
			spawnscriptnow ve_submit_edit_to_leaderboard params = {
				leaderboard = ($ve_render_submission)
				score = <score>
			}
			change ve_render_submission = none
		endif
	endif
	return true
endscript

script ve_render_get_gamertag 
	netsessionfunc \{obj = match
		func = get_gamertag}
	return gamertag = <name>
endscript

script ve_render_pre_play 
	printf 've_render_pre_play %s' s = <ReplayActorName>
	if (<record_length> > 35.0)
		record_length = 35.0
	endif
	<ReplayActorName> :record_start {
		name = ($ve_rec_clip_name)
		time = <record_length>
		StopCallback = ve_recorded_clip
		StopCallbackParams = {
			time = <record_length>
			object_id = <ReplayActorName>
			no_sound
		}
		record_camera = <record_camera>
		no_record_ui
	}
endscript

script ve_render_post_play 
	printf \{'ve_render_post_play'}
	<ReplayActorName> :export_setrecordcamera ReplayCamera
	if <ReplayActorName> :export_isrecording
		ve_stop_recording object = <ReplayActorName>
	endif
	<ReplayActorName> :ve_wait_for_record_to_finish
endscript

script ve_rendering_stop 
	printf \{'ve_rendering_stop'}
	change \{ve_rendering_cancelled = 1}
	ve_play_stop ReplayActorName = <ReplayActorName> from_ui_button
endscript

script ve_render_handle_error 
	ve_cleanup_render_ui <...>
	ve_kill_preview_scripts
	EditBufferFunc func = clear
	ve_free_recorded_clip
	if objectexists id = ReplayCamera
		ReplayCamera :die
	endif
	if objectexists id = ReplaySkater
		ReplaySkater :die
	endif
	skater :pause
	skatercam0 :pause
	if ($ve_rendering_cancelled = 1)
		ui_change_state state = UIstate_video_editor_Main
	else
		create_dialog_box {
			title = "VIDEO FINALIZING ERROR"
			text = <text>
			pos = (320.0, 240.0)
			just = [center center]
			buttons = [
				{font = text_a1 text = "OK" pad_choose_script = ui_change_state pad_choose_params = {state = UIstate_video_editor_Main}}
			]
		}
	endif
endscript

script ve_cleanup_render_ui 
	if gotparam \{owns_actor}
		<ReplayActorName> :die
	endif
	if gotparam \{owns_camera}
		setactivecamera \{id = skatercam0
			viewport = 0}
		ReplayCamera :die
	endif
	if screenelementexists \{id = ve_rendering_ui}
		destroyscreenelement \{id = ve_rendering_ui}
	endif
endscript

script ve_should_render_clip clips = [] render_clip = 'name'
	getarraysize <clips>
	if (<array_size> > 0)
		cumulative_length = 0.0
		original_length = -1.0
		i = 0
		begin
		if (<render_clip> = ((<clips> [<i>]).name))
			ve_play_clip_get_details clip = (<clips> [<i>])
			original_length = <length>
			time_mul = (1.0 / <clip_speed>)
			if (<time_mul> > 1.0)
				time_mul = 1.0
			endif
			this_clip_real_time = (((<clip_end> - <clip_start>) * <length>) * <time_mul>)
			cumulative_length = (<cumulative_length> + <this_clip_real_time>)
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<original_length> = -1.0)
			scriptassert '%s not found' s = <render_clip>
		endif
		if (<cumulative_length> >= $ve_max_record_time)
			return false
		endif
		if (<cumulative_length> >= <original_length>)
			return false
		endif
		return true
	endif
	return false
endscript

script ve_should_save_clip \{clips = [
		]}
	i = 0
	getarraysize <clips>
	begin
	if (<i> >= <index>)
		break
	endif
	if (((<clips> [<i>]).name) = ((<clips> [<index>]).name))
		return \{false}
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{true}
endscript

script ve_create_hide_lod_ui 
	ve_destroy_hide_lod_ui
	kill_helper_text
	createscreenelement \{id = ve_pre_rendering_ui
		type = spriteelement
		texture = white2
		rgba = [
			0
			0
			0
			255
		]
		alpha = 1
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		pos = (640.0, 360.0)
		parent = root_window
		z_priority = 999}
endscript

script ve_adjust_hide_lod_ui 
	if screenelementexists \{id = ve_pre_rendering_ui}
		setscreenelementprops id = ve_pre_rendering_ui {<...>}
	endif
endscript

script ve_destroy_hide_lod_ui 
	if gotparam \{delayed}
		spawnscriptnow \{ve_destroy_hide_lod_ui_delayed}
	else
		if screenelementexists \{id = ve_pre_rendering_ui}
			destroyscreenelement \{id = ve_pre_rendering_ui}
		endif
	endif
endscript

script ve_destroy_hide_lod_ui_delayed 
	wait \{6
		gameframes}
	if screenelementexists \{id = ve_pre_rendering_ui}
		destroyscreenelement \{id = ve_pre_rendering_ui}
	endif
endscript

script ve_create_rendering_ui 
	if screenelementexists id = ve_rendering_ui
		destroyscreenelement id = ve_rendering_ui
	endif
	event_handlers = [
		{pad_back ve_rendering_stop params = {from_ui_button ReplayActorName = <ReplayActorName>}}
		{pad_start ve_rendering_stop params = {from_ui_button ReplayActorName = <ReplayActorName>}}
	]
	createscreenelement {
		parent = root_window
		id = ve_rendering_ui
		type = containerelement
		event_handlers = <event_handlers>
		z_priority = 1000
	}
	createscreenelement {
		type = spriteelement
		texture = white2
		rgba = [0 0 0 255]
		alpha = 1
		just = [center center]
		dims = (1280.0, 720.0)
		pos = (640.0, 360.0)
		parent = ve_rendering_ui
		z_priority = 999
	}
	createscreenelement {
		parent = ve_rendering_ui
		type = textelement
		font = text_a1
		pos = (165.0, 94.0)
		scale = 1.0
		text = "FINALIZING"
		just = [left center]
		z_priority = 1001
	}
	createscreenelement {
		parent = ve_rendering_ui
		id = ve_rendering_ui_dot
		type = spriteelement
		texture = circle
		just = [left center]
		pos = (135.0, 90.0)
		scale = 1.5
		z_priority = 1001
	}
	createscreenelement {
		parent = ve_rendering_ui
		type = textelement
		font = text_a1
		pos = (140.0, 630.0)
		scale = (0.9, 0.7)
		text = "\\m1 Stop finalizing"
		rgba = [240 240 240 180]
		not_focusable
		just = [left center]
	}
	runscriptonscreenelement ve_rendering_ui_blink id = ve_rendering_ui_dot
	launchevent type = focus target = ve_rendering_ui
endscript

script ve_rendering_ui_blink 
	setprops \{rgba = [
			255
			0
			0
			255
		]}
	begin
	domorph \{alpha = 1}
	wait \{0.4
		seconds
		ignoreslomo}
	domorph \{alpha = 0}
	wait \{0.4
		seconds
		ignoreslomo}
	repeat
endscript

script ui_video_editor_save_render_to_mc 
	destroy_pause_menu
	hide_panel_stuff
	pausegame
	skater :pause
	skatercam0 :pause
	if screenelementexists id = clip_load_animation_icon
		destroyscreenelement id = clip_load_animation_icon
	endif
	change RetryScript = ui_video_editor_save_render_to_mc_retry
	change abortscript = ui_video_editor_save_render_to_mc_abort
	change DoneScript = ui_video_editor_save_render_to_mc_done
	change savingorloading = saving
	change FilesOrFolders = files
	check_card filetype = videorender save
	ve_adjust_hide_lod_ui z_priority = -3
	launch_files_menu save filetype = videorender new_filename = <filename> bg_rgba = [20 20 20 255]
endscript

script ui_video_editor_save_render_to_mc_done 
	printf \{'ui_video_editor_save_render_to_mc_done'}
	printstruct <...>
	EditBufferFunc \{func = clear}
	ve_set_render_playback \{toggle = 0}
	ve_set_memory_state \{state = playback}
	ve_destroy_hide_lod_ui
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_video_editor_save_render_to_mc_abort 
	printf \{'ui_video_editor_save_render_to_mc_abort'}
	wait \{2
		gameframes}
	memcard_menus_cleanup
	wait \{2
		gameframes}
	EditBufferFunc \{func = clear}
	ve_set_render_playback \{toggle = 0}
	ve_set_memory_state \{state = playback}
	ve_destroy_hide_lod_ui
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_video_editor_save_render_to_mc_retry 
	memcard_menus_cleanup
	if NOT mc_hasactivefolder
		check_card \{no_message
			filetype = videorender
			save
			ValidateForAutoSave = 1
			force = 1}
	endif
	goto \{ui_video_editor_save_render_to_mc}
endscript

script ui_video_editor_load_render_from_mc 
	ve_set_render_playback \{toggle = 1}
	ve_free_up_scratch_heap
	destroy_pause_menu
	change \{RetryScript = ui_video_editor_load_render_from_mc_retry}
	change \{abortscript = ui_video_editor_load_render_from_mc_abort}
	change \{DoneScript = ui_video_editor_load_render_from_mc_done}
	change \{savingorloading = loading}
	change \{FilesOrFolders = files}
	check_card \{filetype = videorender}
	launch_files_menu \{filetype = videorender}
endscript

script ui_video_editor_load_render_from_mc_done 
	printf \{'ui_video_editor_load_render_from_mc_done'}
	printstruct <...>
	ve_restore_scratch_heap
	ui_destroy_video_editor_background
	ve_play_video_render
endscript

script ui_video_editor_load_render_from_mc_abort 
	printf \{'ui_video_editor_load_render_from_mc_abort'}
	wait \{2
		gameframes}
	memcard_menus_cleanup
	wait \{2
		gameframes}
	ve_restore_scratch_heap
	ve_set_render_playback \{toggle = 0}
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_video_editor_load_render_from_mc_retry 
	memcard_menus_cleanup
	if NOT mc_hasactivefolder
		check_card \{no_message
			filetype = videorender
			load
			ValidateForAutoSave = 1
			force = 1}
	endif
	goto \{ui_video_editor_load_render_from_mc}
endscript

script ve_play_video_render end_state = UIstate_video_editor_Main
	printf 've_play_video_render'
	if infrontend
		scriptassert 'Cannot play back video in the frontend'
	endif
	if ($video_editor_in_video_editor = 0)
		ve_enter_video_editor
	endif
	EditBufferFunc func = get_edit
	printf 've_play_video_render - Playing...'
	ve_play_clips {
		clips = (<edit>.clips)
		effects = (<edit>.effects)
		overlays = (<edit>.overlays)
		audio = (<edit>.audio)
		gamertag = (<edit>.gamertag)
		end_state = <end_state>
		no_slot_loading
		render_playback
		expanded_ui
		allow_saving = <allow_saving>
	}
	printf 've_play_video_render - Done Playing...'
endscript

script ve_submit_edit_to_leaderboard 
	printf 've_submit_edit_to_leaderboard'
	if innetgame
		scriptassert 'Um, should never be in a netgame here!'
	endif
	change ve_uploading_cancelled = 0
	change ve_uploading_done = 0
	generic_ui_destroy
	ve_create_uploading_ui
	begin_singleplayer_game
	wait 0.3 seconds ignoreslomo
	submit_callback = ve_submit_edit_callback
	if NOT ve_video_meets_rank leaderboard = <leaderboard> score = <score>
		no_binary_upload = 1
		submit_callback = ve_submit_edit_callback_no_upload
	endif
	if NOT gotparam failed_to_get_rank
		if EditBufferFunc func = write_to_leaderboard leaderboard = <leaderboard> score = <score> callback = <submit_callback> no_binary_upload = <no_binary_upload>
			begin
			wait 1 gameframe
			netsessionfunc obj = stats func = get_stats_state
			if (<state> = none)
				printf 've_submit_edit_to_leaderboard - Done'
				break
			endif
			formattext textname = text "%d\\%" d = <progress>
			if screenelementexists id = ui_ve_uploading_progress
				setscreenelementprops id = ui_ve_uploading_progress text = <text>
			endif
			repeat
		else
			printf 'Singleplayer stats wasn\'t inited. Saying the upload failed'
		endif
	endif
	begin
	if ($ve_uploading_done = 1)
		break
	endif
	wait 1 gameframe
	repeat 10
	if ($ve_uploading_done = 0)
		ve_submit_edit_callback {status = 8}
	endif
endscript

script ve_submit_edit_callback_no_upload 
	if ((<status> = 0) || (<status> = 2))
		status = 99
	endif
	ve_submit_edit_callback <...>
endscript

script ve_submit_edit_callback 
	printf 've_submit_edit_callback'
	printstruct <...>
	change ve_uploading_done = 1
	if screenelementexists id = ui_ve_uploading_progress
		setscreenelementprops id = ui_ve_uploading_progress text = ""
		setscreenelementprops id = ve_stop_uploading_ui text = ""
	endif
	text = "Your submission has been interrupted. Check your network connection and try submitting this video again."
	if ($ve_uploading_cancelled = 1)
		text = "Submission cancelled"
	else
		printstruct <...>
		switch (<status>)
			case 0
			text = "Submission completed successfully"
			case 3
			text = "Submission cancelled"
			case 1
			case 2
			case 4
			scriptassert 'This shouldnt happen!'
			case 5
			text = "You don't have permission to submit this content"
			case 6
			text = "Error submitting. File Not Found."
			case 7
			case 8
			text = "Your submission has been interrupted. Check your network connection and try submitting this video again."
			case 99
			text = "Your score was submitted, but it was too low for your video data to be uploaded as well."
		endswitch
	endif
	create_dialog_box {
		title = "Submission To Volcom"
		text = <text>
		pad_back_script = ve_submit_edit_done
		preserve_case
		buttons = [
			{text = "OK" pad_choose_script = ve_submit_edit_done}
		]
	}
endscript

script ve_submit_edit_done 
	if screenelementexists \{id = ve_uploading_ui}
		destroyscreenelement \{id = ve_uploading_ui}
	endif
	EditBufferFunc \{func = clear}
	ve_set_memory_state \{state = playback}
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ve_create_uploading_ui 
	event_handlers = [
		{pad_back ve_uploading_stop params = {}}
		{pad_start ve_uploading_stop params = {}}
	]
	createscreenelement {
		parent = root_window
		id = ve_uploading_ui
		type = containerelement
		event_handlers = <event_handlers>
		z_priority = 1000
	}
	createscreenelement {
		type = spriteelement
		texture = white2
		rgba = [0 0 0 255]
		alpha = 1
		just = [center center]
		dims = (1280.0, 720.0)
		pos = (640.0, 360.0)
		parent = ve_uploading_ui
		z_priority = 999
	}
	createscreenelement {
		parent = ve_uploading_ui
		type = textelement
		font = text_a1
		pos = (165.0, 94.0)
		scale = 1.0
		text = "SUBMITTING EDIT"
		just = [left center]
		z_priority = 1001
	}
	createscreenelement {
		parent = ve_uploading_ui
		type = textelement
		id = ui_ve_uploading_progress
		font = text_a1
		pos = (640.0, 360.0)
		scale = 2.0
		text = ""
		just = [center center]
		z_priority = 1001
	}
	createscreenelement {
		parent = ve_uploading_ui
		id = ve_rendering_ui_dot
		type = spriteelement
		texture = circle
		just = [left center]
		pos = (135.0, 90.0)
		scale = 1.5
		z_priority = 1001
	}
	createscreenelement {
		parent = ve_uploading_ui
		type = textelement
		id = ve_stop_uploading_ui
		font = text_a1
		pos = (140.0, 630.0)
		just = [left center]
		scale = (0.9, 0.7)
		text = "\\m1 Stop submitting edit"
		rgba = [240 240 240 180]
		not_focusable
	}
	runscriptonscreenelement ve_uploading_ui_blink id = ve_rendering_ui_dot
	runscriptonscreenelement ve_uploading_text_buzz id = ui_ve_uploading_progress
	launchevent type = focus target = ve_uploading_ui
endscript

script ve_uploading_ui_blink 
	begin
	domorph \{scale = 1.75
		time = 0.4}
	wait \{0.4
		seconds
		ignoreslomo}
	domorph \{scale = 1.25
		time = 0.4}
	wait \{0.4
		seconds
		ignoreslomo}
	repeat
endscript

script ve_uploading_text_buzz 
	begin
	domorph rot_angle = RandomRange (0.0, 20.0) time = 0.8
	domorph scale = RandomRange (1.8, 2.2) time = 0.4
	wait \{0.4
		seconds
		ignoreslomo}
	domorph rot_angle = RandomRange (0.0, -20.0) time = 0.8
	domorph scale = RandomRange (1.8, 2.2) time = 0.4
	wait \{0.4
		seconds
		ignoreslomo}
	repeat
endscript

script ve_uploading_stop 
	change \{ve_uploading_cancelled = 1}
	netsessionfunc \{obj = stats
		func = cancel_upload_download}
endscript

script ve_play_save_render 
	spawnscriptnow ve_play_save_render_spawned params = {<...>}
endscript

script ve_play_save_render_spawned 
	printf \{'ve_play_save_render_spawned'}
	change \{ve_saving_downloaded_render = 1}
	ve_play_stop <...>
	wait_for_script_to_finish \{name = ve_play_clips}
	EditBufferFunc \{func = fixup_for_resaving}
	ui_video_editor_save_render_to_mc filename = <gamertag>
endscript

script ve_video_meets_rank 
	met_rank = 0
	if EditBufferFunc func = get_projected_upload_rank leaderboard_id = <leaderboard> score = <score>
		printstruct <...>
		switch <leaderboard>
			case M_edit_baltimore
			case M_edit_dc
			case M_edit_philly
			if (<projected_rank> <= 300)
				return true
			endif
			case M_edit_skatelounge
			if (<projected_rank> <= 1500)
				return true
			endif
			default
			scriptassert 'Wrong Leaderboard %s' s = <leaderboard>
		endswitch
		return false
	endif
	printf 've_video_meets_rank - Failed!'
	return false failed_to_get_rank
endscript

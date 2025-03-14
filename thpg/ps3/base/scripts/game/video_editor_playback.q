ve_hide_playback_ui = 0
ve_play_clips_stopped = 1
ve_playback_allow_ui_stop = 0
ve_record_usercam_cancelled = 0
ve_invoked_rewind = 0
ve_playback_paused = 0
ve_pause_ui_disabled = 0
ve_preview_camera = none
ve_preview_actor = none
ve_last_preview_clip_name = null
ve_igc_camera_active = 0
ve_bounding_sphere_size = 500.0

script ve_play_clips clips = [] viewport = 0 start_time = 0.0 audio = {music = playlist music_start = 0.0}
	printf 've_play_clips'
	if objectexists id = ped_speech_dialog
		destroyscreenelement id = ped_speech_dialog
	endif
	stoprendering
	change ve_playback_allow_ui_stop = 0
	change ve_invoked_rewind = 0
	change ve_playback_paused = 0
	getarraysize <clips>
	if (<array_size> = 0)
		scriptassert 'Clips array needs to be set!'
	endif
	ve_pop_editing_buss
	if gotparam change_level
		ve_set_memory_state state = playback
		if gotparam pre_play_callback
			if (<pre_play_callback> = ve_rerecord_camera_pre_play)
				change nasty_usercam_hack = 1
			endif
		endif
	endif
	if gotparam render_playback
		if ($ve_playback_render = 0)
			scriptassert 'Eh? Playing back a render, but we\'re not in the right state'
		endif
		if NOT EditBufferFunc func = load_clip_assets
			ve_handle_overlong_clips end_state = <end_state>
			return
		endif
	endif
	ve_wait_for_viewport id = <viewport>
	ve_kill_preview_scripts
	ve_clear_non_env_effects viewport = <viewport>
	ve_suspend_main_skater
	if gotparam disable_and_reenable_streaming
		DisablePakManStreaming
	else
		if IsPakManStreamingEnabled
			scriptassert 'Eh? Streaming needs to be off for video playback!'
		endif
	endif
	ve_get_clips_area clips = <clips>
	ve_get_zone_list_for_clips clips = <clips>
	if NOT gotparam play_animation_only
		if NOT gotparam no_loading
			if ve_pick_correct_pakman_map record_last area = <area> action = ve_play_clips action_params = {<...> change_level_done}
				ve_check_playback_area area = <area> zones = <zones> extra_zones = <extra_zones>
			endif
		endif
	endif
	if gotparam end_state
		printf 've_play_clips - ui'
		generic_ui_destroy
		pause_menu_fmv_kill
		killskatercamanim all
		unpause_game_and_destroy_pause_menu
		hide_all_hud_items
	endif
	if gotparam no_slot_loading
		clips_loaded = 1
	else
		if ve_ensure_clips_loaded clips = <clips>
			clips_loaded = 1
		endif
	endif
	ve_remove_blackout
	if gotparam clips_loaded
		printf 've_play_clips - setting up...'
		if NOT gotparam no_loading
			if VideoClipSlotFunc get_clip_data_struct name = ((<clips> [0]).name)
				if IsInCrib
					if structurecontains structure = <clip_data> crib_theme
						crib_change_theme_ve theme = (<clip_data>.crib_theme)
					endif
				endif
				removeparameter clip_data
			endif
		endif
		ve_ensure_binks_loaded overlays = <overlays>
		change ve_play_clips_stopped = 0
		if NOT gotparam ReplayActorName
			ve_create_actor_and_camera
		endif
		if NOT gotparam play_animation_only
			if ve_get_first_cas clips = <clips>
				ve_use_cas_appearance cas = <cas> actor = <ReplayActorName>
			endif
		endif
		if screenelementexists id = Video_Playback_Controls
			destroyscreenelement id = Video_Playback_Controls
		endif
		if gotparam rerecord_camera
			event_handlers = [
				{pad_back ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
				{pad_start ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
			]
		elseif gotparam expanded_ui
			event_handlers = [
				{pad_choose ve_set_show_playback_ui params = {fadeout}}
				{pad_square ve_play_rewind params = {ReplayActorName = <ReplayActorName> from_ui_button}}
				{pad_space ve_play_pause params = {ReplayActorName = <ReplayActorName> from_ui_button}}
				{pad_back ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
				{pad_start ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
			]
			if gotparam allow_saving
				extra_handler = [
					{pad_r1 ve_play_save_render params = {ReplayActorName = <ReplayActorName> from_ui_button gamertag = <gamertag>}}
				]
				event_handlers = (<event_handlers> + <extra_handler>)
			endif
		else
			event_handlers = [
				{pad_choose ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
				{pad_back ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
				{pad_start ve_play_stop params = {ReplayActorName = <ReplayActorName> from_ui_button}}
			]
		endif
		if gotparam allow_marker_placing
			marker_place_handler = [
				{pad_square ui_video_editor_place_marker_from_playback}
			]
			event_handlers = (<event_handlers> + <marker_place_handler>)
		endif
		createscreenelement {
			id = Video_Playback_Controls
			parent = root_window
			type = containerelement
			event_handlers = <event_handlers>
		}
		if (<viewport> = 0)
			if ($ve_hide_playback_ui = 0)
				if ($ui_gameplay_show_hud = 1)
					if gotparam rerecord_camera
					elseif gotparam expanded_ui
						createscreenelement {
							parent = Video_Playback_Controls
							type = textelement
							just = [left center]
							font = text_a1
							pos = (115.0, 640.0)
							scale = (0.9, 0.7)
							text = "\\m1 back"
							rgba = [200 200 200 255]
							not_focusable
							shadow
							shadow_rgba = [0 0 0 255]
							shadow_offs = (2.0, 2.0)
						}
						createscreenelement {
							parent = Video_Playback_Controls
							type = textelement
							just = [left center]
							font = text_a1
							pos = (115.0, 610.0)
							scale = (0.9, 0.7)
							text = "\\m8 pause/unpause"
							rgba = [200 200 200 255]
							not_focusable
							shadow
							shadow_rgba = [0 0 0 255]
							shadow_offs = (2.0, 2.0)
						}
						createscreenelement {
							parent = Video_Playback_Controls
							type = textelement
							just = [left center]
							font = text_a1
							pos = (115.0, 580.0)
							scale = (0.9, 0.7)
							text = "\\m7 rewind"
							rgba = [200 200 200 255]
							not_focusable
							shadow
							shadow_rgba = [0 0 0 255]
							shadow_offs = (2.0, 2.0)
						}
						if gotparam allow_saving
							createscreenelement {
								parent = Video_Playback_Controls
								type = textelement
								just = [left center]
								font = text_a1
								pos = (115.0, 550.0)
								scale = (0.9, 0.7)
								text = "\\mb save"
								rgba = [200 200 200 255]
								not_focusable
								shadow
								shadow_rgba = [0 0 0 255]
								shadow_offs = (2.0, 2.0)
							}
						endif
						createscreenelement {
							type = containerelement
							parent = Video_Playback_Controls
							id = ui_video_playback_pause_icon
							just = [left top]
							dims = (32.0, 32.0)
							pos = (128.0, 70.0)
							child_anchor = [center center]
						}
						createscreenelement {
							type = spriteelement
							parent = ui_video_playback_pause_icon
							texture = triangle
							pos = (0.0, 0.0)
							just = [center center]
							scale = 1.5
							rgba = ($goal_career_ui_scheme.main)
						}
						createscreenelement {
							parent = Video_Playback_Controls
							type = textelement
							id = ui_video_playback_pause
							just = [left top]
							font = text_a1
							pos = (164.0, 72.0)
							scale = (0.9, 0.7)
							text = "Play"
							rgba = ($goal_career_ui_scheme.main)
							not_focusable
							shadow
							shadow_rgba = [0 0 0 255]
							shadow_offs = (2.0, 2.0)
						}
					endif
					if gotparam gamertag
						createscreenelement {
							parent = Video_Playback_Controls
							type = textelement
							just = [right center]
							font = text_a1
							pos = (1180.0, 50.0)
							scale = (0.9, 0.7)
							text = "Video Authored By:"
							rgba = [200 200 200 255]
							not_focusable
							shadow
							shadow_rgba = [0 0 0 255]
							shadow_offs = (2.0, 2.0)
						}
						createscreenelement {
							parent = Video_Playback_Controls
							type = textelement
							just = [right center]
							font = text_a1
							pos = (1180.0, 80.0)
							scale = (0.9, 0.7)
							text = <gamertag>
							rgba = [200 200 200 255]
							not_focusable
							shadow
							shadow_rgba = [0 0 0 255]
							shadow_offs = (2.0, 2.0)
						}
					endif
				endif
			endif
		endif
		if NOT gotparam rerecord_camera
			ve_set_hide_playback_ui
		endif
		launchevent type = focus target = Video_Playback_Controls
		ve_concatenate_cuts clips = <clips> effects = <effects> overlays = <overlays> start_time = <start_time>
		cut_index = 0
		<ReplayActorName> :unsuspend
		<ReplayActorName> :unhide
		ReplayCamera :unsuspend
		ReplayCamera :unhide
		ve_suspend_main_skater
		ve_weather_effects_remember
		change CycleWeather = 0
		GetSlomo
		prev_slomo = <slomo>
		setslomo 1.0 nail_the_trick
		killspawnedscript name = ntt_lerp_slomo
		ve_backup_node_flags
		printf 've_play_clips - done setup...'
		begin
		change ve_igc_camera_active = 0
		ve_suspend_main_skater
		<ReplayActorName> :switchonatomic all
		if NOT gotparam play_animation_only
			pausesoundsbybuss ingame
			pausesoundsbybuss ambience
			unpausesoundsbybuss playlist
			ve_play_music_track asset = (<audio>.music) start = ((<audio>.music_start) + <start_time>)
		endif
		change ve_pause_ui_disabled = 0
		if NOT gotparam rerecord_camera
			ve_set_hide_playback_ui
		endif
		i = 0
		base_time = 0.0
		begin
		edit_clip = (<clips> [<i>])
		if ($ve_play_clips_stopped = 1)
			break
		endif
		if (<start_time> > ($video_max_length))
			break
		endif
		if (<base_time> > ($video_max_length))
			break
		endif
		ve_get_edit_clip_length edit_clip = <edit_clip>
		if (<start_time> < (<base_time> + <length>))
			seek_clip_time = 0.0
			if (<start_time> > <base_time>)
				seek_clip_time = (<start_time> - <base_time>)
				start_time = 0.0
			endif
			ve_play_edit_clip {
				edit_clip = <edit_clip>
				clip_index = <i>
				base_time = <base_time>
				seek_clip_time = <seek_clip_time>
				ReplayActorName = <ReplayActorName>
				viewport = <viewport>
				rerecord_camera = <rerecord_camera>
				force_user_camera = <force_user_camera>
				cuts = <cuts>
				cut_index = <cut_index>
				play_animation_only = <play_animation_only>
				timeline_callback = <timeline_callback>
				pre_play_callback = <pre_play_callback>
				pre_play_callback_params = <pre_play_callback_params>
			}
			if gotparam post_play_callback
				<post_play_callback> {<post_play_callback_params> name = (<edit_clip>.name) ReplayActorName = <ReplayActorName> length = <length>}
			endif
		endif
		base_time = (<base_time> + <length>)
		if (<base_time> >= ($video_max_length))
			printf 'Hit playback limit'
			base_time = ($video_max_length)
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if ($ve_play_clips_stopped = 0)
			if gotparam timeline_callback
				<timeline_callback> time = <base_time> timeline_callback
			endif
		endif
		if gotparam expanded_ui
			if ($ve_invoked_rewind = 0)
				if ($ve_play_clips_stopped = 0)
					if ($ve_playback_paused = 0)
						ve_toggle_playback_pause <...> no_ui
					endif
					ve_set_show_playback_ui fadein
					if screenelementexists id = ui_video_playback_pause
						setscreenelementprops id = ui_video_playback_pause text = "Stop" rgba = ($goal_generic_ui_scheme.main)
					endif
					if screenelementexists id = ui_video_playback_pause_icon
						destroyscreenelement id = ui_video_playback_pause_icon preserve_parent
					endif
					if ($ui_gameplay_show_hud = 1)
						createscreenelement {
							type = spriteelement
							parent = ui_video_playback_pause_icon
							texture = white
							pos = (0.0, 0.0)
							dims = (24.0, 24.0)
							just = [center center]
							rgba = ($goal_generic_ui_scheme.main)
						}
					endif
					if ($ve_playback_paused = 0)
						ve_toggle_playback_pause <...>
					endif
					change ve_pause_ui_disabled = 1
					begin
					if ($ve_play_clips_stopped = 1)
						ve_stop_music_track asset = (<audio>.music)
						if ($ve_invoked_rewind = 0)
							if (<end_state> = UIstate_video_editor_Edit_View)
								ve_push_editing_buss
							elseif (<end_state> = UIstate_video_editor_Main)
								ui_pausemenu_push_buss
							elseif (<end_state> = UIstate_video_editor_Clip_Menu)
								ui_pausemenu_push_buss
							elseif (<end_state> = UIstate_video_editor_camera_recorded_menu)
								ui_pausemenu_push_buss
							endif
						endif
						break
					endif
					if ($ve_invoked_rewind = 1)
						break
					endif
					wait 1 gameframe
					repeat
				endif
			endif
		endif
		if ($ve_invoked_rewind = 1)
			printf 'Handling rewind'
			if renderingenabled
				stoprendering
			endif
			if ($ve_playback_paused = 1)
				ve_toggle_playback_pause <...>
			endif
			cut_index = 0
			start_time = 0.0
			change ve_invoked_rewind = 0
			change ve_play_clips_stopped = 0
			animsave_wait_for_playback
			wait_for_script_to_finish name = ve_play_stop
			if <ReplayActorName> :anim_animnodeexists id = bodytimer
				<ReplayActorName> :anim_command target = bodytimer command = timer_reset
			endif
			ve_weather_effects_clear viewport = <viewport>
			change ve_active_effects_name_list = []
			ve_use_cas_appearance_cleanup_temp_geoms
			ve_recreate_actor name = <ReplayActorName>
		else
			break
		endif
		repeat
		change ve_playback_allow_ui_stop = 0
		if NOT gotparam play_animation_only
			if renderingenabled
				stoprendering
			endif
			ve_process_cuts cuts = <cuts> cut_index = <cut_index> viewport = <viewport> terminated_cuts = 1
		endif
		animsave_wait_for_playback
	endif
	if renderingenabled
		stoprendering
	endif
	ve_play_clip_cleanup <...>
	broadcastevent type = video_done_playing
	startrendering
	if NOT gotparam ReplayActorName
		printf 'Error loading clips'
	endif
	if gotparam end_state
		if NOT checksumequals a = <end_state> b = UIstate_goal_film_clip_options
			ui_pausemenu_push_buss time = 0.0
		endif
		if ($ve_panic_unload = 1)
			return
		endif
		show_all_hud_items
		do_actual_pause <...>
		unpausespawnedscript sysnotify_handle_signin_change
		if ($ve_saving_downloaded_render = 1)
			change ve_saving_downloaded_render = 0
			unpausespawnedscript ve_play_save_render_spawned
		else
			ui_change_state state = <end_state>
		endif
	endif
endscript

script ve_play_edit_clip seek_clip_time = 0.0 viewport = 0
	clip_name = (<edit_clip>.name)
	printf 've_play_edit_clip %n' n = <clip_name>
	setactivecamera id = ReplayCamera viewport = <viewport>
	if NOT objectexists id = <ReplayActorName>
		scriptassert 'Eh, no actor?'
		return
	endif
	ve_cleanup_zone_objects
	ve_play_clip_get_details clip = <edit_clip>
	if NOT VideoClipSlotFunc get_clip_data_struct name = <clip_name>
		if (<clip_name> = ($ve_rec_clip_name))
			clip_data = ($ve_rec_clip_data)
		else
			scriptassert 'No clip data!'
		endif
	endif
	time_mul = (1.0 / <clip_speed>)
	this_clip_real_time = (((<clip_end> - <clip_start>) * <length>) * <time_mul>)
	user_camera = 0
	if (<clip_camera> = user)
		user_camera = 1
		printf 'User Camera'
	endif
	start_percent = <clip_start>
	if (<seek_clip_time> > 0.0)
		start_percent = (<start_percent> + ((<seek_clip_time> * <clip_speed>) / <length>))
	endif
	if gotparam rerecord_camera
		play_camera = no_camera
	else
		play_camera = ReplayCamera
	endif
	if ((<clip_camera> = `default`) || (<clip_camera> = user))
		killspawnedscript name = ve_cam_control
		record_camera = ReplayCamera
		change ve_igc_camera_active = 0
	else
		ve_get_goal_camera clip = <clip> clip_data = <clip_data>
		cam_name = (ReplayIGCCam + <clip_index>)
		playigccam {
			controlscript = ve_cam_control
			name = <cam_name>
			viewport = <viewport>
			params = {my_object = <ReplayActorName> camera_type = <clip_camera> goal_camera_morph = <goal_camera> camera_pos = <clip_camera_pos> camera_fov = <clip_camera_fov> camera_quat = <clip_camera_quat>}
		}
		getskatercamanimparams name = <cam_name>
		record_camera = <cam_object_id>
		play_camera = no_camera
		change ve_igc_camera_active = 1
	endif
	if gotparam pre_play_callback
		<pre_play_callback> {<pre_play_callback_params> name = <clip_name> ReplayActorName = <ReplayActorName> length = <length> record_camera = <record_camera>}
		if gotparam cancelled
			return
		endif
	endif
	if NOT gotparam play_animation_only
		if IsInCrib
			ve_use_cas_appearance cas = (<clip_data>.cas) pro_switch_only actor = <ReplayActorName>
		endif
		<ReplayActorName> :switchonatomic all
		<ReplayActorName> :initsoundrecordingsystem heap = topdownheap multiplier = ($ve_current_mem_multiplier)
		<ReplayActorName> :proximtrigger_setactive active = 1
		skater :proximtrigger_setactive active = 0
		orig_clip_start = <start_percent>
		orig_clip_end = <clip_end>
		orig_clip_length = <length>
		if structurecontains structure = <edit_clip> original_clip_length
			orig_clip_start = ((<edit_clip>.original_clip_start) / (<edit_clip>.original_clip_length))
			orig_clip_end = ((<edit_clip>.original_clip_end) / (<edit_clip>.original_clip_length))
			orig_clip_length = (<edit_clip>.original_clip_length)
		endif
		ve_play_audio_clip_start {
			name = (<clip>.name)
			object = <ReplayActorName>
			time = (<orig_clip_start> * <orig_clip_length>)
			speed = <clip_speed>
		}
	endif
	PlayAnimSave {
		name = <clip_name>
		ReplayActorName = <ReplayActorName>
		exitscript = ve_play_exit_script
		start_percent = <start_percent>
		end_percent = <clip_end>
		speed = <clip_speed>
		play_camera = <play_camera>
		viewport = <viewport>
		user_camera = <user_camera>
		force_user_camera = <force_user_camera>
	}
	ForceUpdateModelAndCamera model = <ReplayActorName> camera = <record_camera>
	if NOT gotparam play_animation_only
		ve_apply_weather_effect {
			time = <this_clip_real_time>
			weather = (<clip_data>.weather)
			start_percent = <orig_clip_start>
			end_percent = <orig_clip_end>
			viewport = <viewport>
		}
		if gman_getactivatedgoalid
			goal_film_add_screen_fx
		endif
		ve_use_node_flags nodeflags = (<clip_data>.nodeflags)
		UpdateRigAKitPieces pieces = (<clip_data>.rak_pieces)
		ve_process_entire_event_list events = (<clip_data>.event_list) scr = ve_do_pre_play_events actor = <ReplayActorName> start_time = (<orig_clip_start> * <orig_clip_length>) end_time = (<orig_clip_end> * <orig_clip_length>)
	endif
	if NOT gotparam play_animation_only
		cutoff_cuts_time = (<base_time> + <this_clip_real_time> - 0.04)
		ve_play_cuts_events_and_audio {
			edit_clip = <edit_clip>
			ReplayActorName = <ReplayActorName>
			base_time = <base_time>
			timeline_callback = <timeline_callback>
			cuts = <cuts>
			cut_index = <cut_index>
			event_list = (<clip_data>.event_list)
			viewport = <viewport>
			cutoff_cuts_time = <cutoff_cuts_time>
		}
	else
		change ve_playback_allow_ui_stop = 1
		if NOT renderingenabled
			startrendering
		endif
	endif
	if ($ve_play_clips_stopped = 0)
		<ReplayActorName> :anim_command target = bodytimer command = timer_wait
	endif
	return cut_index = <cut_index>
endscript

script ve_play_cuts_events_and_audio 
	anim_start_time = 0.0
	if structurecontains structure = <edit_clip> clip_start
		anim_start_time = (<edit_clip>.clip_start)
	endif
	time_mul = 1.0
	if structurecontains structure = <edit_clip> clip_speed
		time_mul = (1.0 / (<edit_clip>.clip_speed))
	endif
	event_index = 0
	first_event_process = 1
	begin
	if ($ve_play_clips_stopped = 1)
		break
	endif
	if <ReplayActorName> :anim_animnodeexists id = bodytimer
		if <ReplayActorName> :anim_command target = bodytimer command = timer_isanimcomplete
			break
		endif
		<ReplayActorName> :anim_command target = bodytimer command = timer_getcurrentanimtime
		timeline_time = (<base_time> + ((<currenttime> - <anim_start_time>) * <time_mul>))
		if (<timeline_time> > ($video_max_length))
			ve_play_stop ReplayActorName = <ReplayActorName>
		endif
		if gotparam timeline_callback
			<timeline_callback> time = <timeline_time> timeline_callback
		endif
		currenttime_adjusted = <currenttime>
		if structurecontains structure = <edit_clip> original_clip_start
			speed_factor = ((<edit_clip>.original_clip_speed) / (<edit_clip>.clip_speed))
			currenttime_adjusted = (<currenttime_adjusted> * <speed_factor>)
			currenttime_adjusted = (<currenttime_adjusted> + (<edit_clip>.original_clip_start))
		endif
		if (<timeline_time> < <cutoff_cuts_time>)
			ve_process_cuts cuts = <cuts> cut_index = <cut_index> time = <timeline_time> viewport = <viewport>
		endif
		ve_process_event_list events = <event_list> event_index = <event_index> time = <currenttime_adjusted> actor = <ReplayActorName> first_event_process = <first_event_process>
		if (<first_event_process> = 1)
			first_event_process = 0
		endif
		if (<timeline_time> >= ($video_max_length))
			printf 'Hit playback limit'
			break
		endif
		ve_play_audio_clip_update object = <ReplayActorName> time = <currenttime_adjusted>
		<ReplayActorName> :obj_setboundingsphere ($ve_bounding_sphere_size)
	endif
	wait 1 gameframe
	change ve_playback_allow_ui_stop = 1
	if NOT renderingenabled
		startrendering
	endif
	repeat
	ve_play_audio_clip_end object = <ReplayActorName>
	ve_process_entire_event_list events = <event_list> scr = ve_do_post_play_events actor = <ReplayActorName>
	return cut_index = <cut_index>
endscript

script ve_play_clip_cleanup 
	printf 've_play_clip_cleanup'
	change ve_igc_camera_active = 0
	if gotparam ReplayActorName
		<ReplayActorName> :proximtrigger_setactive active = 0
	endif
	skater :proximtrigger_setactive active = 1
	if gotparam ReplayActorName
		<ReplayActorName> :releasesoundrecordingmemory
	endif
	if NOT gotparam keep_skater_hidden
		ve_unsuspend_main_skater
	endif
	ve_fix_missing_skater_board
	ve_kill_bink
	if screenelementexists id = Video_Playback_Controls
		destroyscreenelement id = Video_Playback_Controls
	endif
	killspawnedscript name = ve_cam_control
	if gotparam ReplayActorName
		if <ReplayActorName> :export_isrecording
			ve_stop_recording object = <ReplayActorName>
		endif
	endif
	change ve_play_clips_stopped = 1
	if gotparam owns_actor
		<ReplayActorName> :die
	endif
	ve_clear_non_env_effects viewport = <viewport>
	debounce x 2.5
	change ve_active_effects_name_list = []
	ve_restore_rak_pieces fast
	change CycleWeather = 1
	ve_weather_effects_clear viewport = <viewport>
	setslomo <prev_slomo> nail_the_trick
	ve_use_cas_appearance_cleanup_temp_geoms
	if gotparam disable_and_reenable_streaming
		if NOT IsInCrib
			EnablePakManStreaming
		endif
	endif
	if gotparam cas
		if NOT gotparam cas_pros_only
			ve_restore_old_cas_skater
		endif
	endif
	if gotparam owns_camera
		setactivecamera id = skatercam0 viewport = <viewport>
		ReplayCamera :die
	endif
	if gotparam render_playback
		if ($ve_saving_downloaded_render = 0)
			ve_set_render_playback toggle = 0
		endif
	endif
	ve_stop_music_track asset = (<audio>.music)
	unpausesoundsbybuss ingame
	unpausesoundsbybuss ambience
endscript

script ve_play_stop 
	printf 've_play_stop'
	if iscreated <ReplayActorName>
		if <ReplayActorName> :export_isrecording
			change ve_record_usercam_cancelled = 1
			ve_stop_recording object = <ReplayActorName>
		endif
	endif
	if gotparam from_ui_button
		ve_camera_rec_cancelled
		if ($ve_playback_allow_ui_stop = 0)
			printf 've_play_stop - Ignoring, playback is prepping...'
			return
		endif
	endif
	if ($ve_play_clips_stopped = 0)
		change ve_play_clips_stopped = 1
		if NOT <ReplayActorName> :anim_animnodeexists id = bodytimer
			printf 'Erm, no bodytimer.... Hopefully this will be okay'
		else
			if ($ve_playback_paused = 1)
				ve_toggle_playback_pause <...> not_music
			endif
			<ReplayActorName> :anim_command target = bodytimer command = timer_force_waits_to_complete
			if ($replay_currently_playing = 1)
				begin
				printf 've_play_stop - Waiting to end replay'
				wait 1 gameframe
				if ($replay_currently_playing = 0)
					break
				endif
				if <ReplayActorName> :anim_animnodeexists id = bodytimer
					<ReplayActorName> :anim_command target = bodytimer command = timer_force_waits_to_complete
				endif
				if ($ve_playback_paused = 1)
					<ReplayActorName> :unpause
					change ve_playback_paused = 0
				endif
				repeat
			endif
		endif
	endif
endscript

script ve_play_pause 
	printf \{'ve_play_pause'}
	debounce \{square
		time = 0.3}
	if ($ve_playback_allow_ui_stop = 0)
		printf \{'ve_play_pause - Ignoring, playback is prepping...'}
		return
	endif
	if ($ve_pause_ui_disabled = 1)
		printf \{'ve_play_pause - Pause disabled'}
		return
	endif
	ve_toggle_playback_pause <...>
endscript

script ve_toggle_playback_pause 
	printf 've_toggle_playback_pause'
	if ($ve_playback_paused = 0)
		if NOT gotparam no_ui
			ve_set_show_playback_ui
		endif
		<ReplayActorName> :pause
		<ReplayActorName> :obj_pausesounds
		change ve_playback_paused = 1
		if screenelementexists id = ui_video_playback_pause
			setscreenelementprops id = ui_video_playback_pause text = "Paused" rgba = ($goal_hardcore_ui_scheme.main)
		endif
		if screenelementexists id = ui_video_playback_pause_icon
			destroyscreenelement id = ui_video_playback_pause_icon preserve_parent
		endif
		if ($ui_gameplay_show_hud = 1)
			createscreenelement {
				type = spriteelement
				parent = ui_video_playback_pause_icon
				texture = white
				pos = (-4.0, 0.0)
				dims = (10.0, 24.0)
				just = [right center]
				rgba = ($goal_hardcore_ui_scheme.main)
			}
			createscreenelement {
				type = spriteelement
				parent = ui_video_playback_pause_icon
				texture = white
				pos = (4.0, 0.0)
				dims = (10.0, 24.0)
				just = [left center]
				rgba = ($goal_hardcore_ui_scheme.main)
			}
		endif
		if ismovieplaying textureslot = ($ve_bink_texture_slot)
			pausemovie textureslot = ($ve_bink_texture_slot)
		endif
		if NOT gotparam not_music
			ve_pause_music pause = 1
		endif
		Adjust_Rain_SFX_Intensity intensity = 0.0
		pausegame
		ve_wake_paused_scripts
	else
		ve_set_show_playback_ui fadeout
		<ReplayActorName> :unpause
		<ReplayActorName> :obj_pausesounds off
		change ve_playback_paused = 0
		if screenelementexists id = ui_video_playback_pause
			setscreenelementprops id = ui_video_playback_pause text = "Play" rgba = ($goal_career_ui_scheme.main)
		endif
		if screenelementexists id = ui_video_playback_pause_icon
			destroyscreenelement id = ui_video_playback_pause_icon preserve_parent
		endif
		if ($ui_gameplay_show_hud = 1)
			createscreenelement {
				type = spriteelement
				parent = ui_video_playback_pause_icon
				texture = triangle
				pos = (0.0, 0.0)
				scale = 1.5
				just = [center center]
				rgba = ($goal_career_ui_scheme.main)
			}
		endif
		if ismovieplaying textureslot = ($ve_bink_texture_slot)
			resumemovie textureslot = ($ve_bink_texture_slot)
		endif
		if NOT gotparam not_music
			ve_pause_music pause = 0
		endif
		Adjust_Rain_SFX_Intensity intensity = $CurRainIntensity
		unpausegame
		ve_suspend_main_skater
	endif
endscript

script ve_play_rewind 
	printf \{'ve_play_rewind'}
	if ($ve_playback_paused = 1)
		ve_toggle_playback_pause <...> not_music
	endif
	if ($ve_playback_allow_ui_stop = 0)
		printf \{'ve_play_rewind - Ignoring, playback is prepping...'}
		return
	endif
	stoprendering
	change \{ve_invoked_rewind = 1}
	ve_play_stop <...>
endscript

script ve_play_exit_script 
	printf \{'ve_play_exit_script'}
endscript

script ve_preview_seek 
	if NOT ve_ensure_clips_loaded clips = <clips>
		return
	endif
	ve_wait_for_viewport id = <viewport>
	if NOT gotparam camera
		if ($ve_preview_camera = none)
			printf 'Recovering from QBRO'
			change ve_preview_camera = ReplayCamera
		endif
		camera = ReplayCamera
	endif
	if NOT gotparam actor
		if ($ve_preview_actor = none)
			printf 'Recovering from QBRO'
			change ve_preview_actor = ReplaySkater
		endif
		actor = ($ve_preview_actor)
	endif
	<actor> :switchonatomic all
	<actor> :obj_setboundingsphere ($ve_bounding_sphere_size)
	<actor> :unsuspend
	<actor> :unhide
	<camera> :unsuspend
	<camera> :unhide
	skater :vibrate off
	skater :obj_pausesounds
	<actor> :obj_pausesounds
	getarraysize <clips>
	if NOT (<array_size> = 0)
		i = 0
		base_time = 0.0
		begin
		ve_play_clip_get_details clip = (<clips> [<i>])
		removeparameter clip_data
		if NOT VideoClipSlotFunc get_clip_data_struct name = ((<clips> [<i>]).name)
			scriptassert 'No clip data!'
		endif
		time_mul = (1.0 / <clip_speed>)
		this_clip_real_time = (((<clip_end> - <clip_start>) * <length>) * <time_mul>)
		if (<preview_time> < (<base_time> + <this_clip_real_time>))
			if NOT ((<clip>.name) = ($ve_last_preview_clip_name))
				ve_use_node_flags nodeflags = (<clip_data>.nodeflags)
				UpdateRigAKitPieces pieces = (<clip_data>.rak_pieces)
				change ve_last_preview_clip_name = (<clip>.name)
				if IsInCrib
					ve_use_cas_appearance cas = (<clip_data>.cas) pro_switch_only actor = <actor>
				endif
			endif
			user_camera = 0
			if (<clip_camera> = user)
				user_camera = 1
			endif
			if gotparam clip_start
				if (<clip_start> < 0.0)
					clip_start = 0.0
				endif
				if (<clip_start> > 1.0)
					clip_start = 1.0
				endif
			endif
			if gotparam clip_end
				if (<clip_end> < 0.0)
					clip_end = 0.0
				endif
				if (<clip_end> > 1.0)
					clip_end = 1.0
				endif
			endif
			<actor> :replay_init_tree
			if NOT <actor> :replay_setup_anim {
					name = (<clip>.name)
					start_percent = <clip_start>
					end_percent = <clip_end>
					speed = <clip_speed>
					play_camera = <camera>
					viewport = <viewport>
					user_camera = <user_camera>
				}
				break
			endif
			if ((<clip_camera> = `default`) || (<clip_camera> = user))
				use_camera = <camera>
			else
				ve_get_goal_camera clip = <clip> clip_data = <clip_data>
				killspawnedscript name = ve_cam_control
				killskatercamanim name = ReplayIGCCam
				playigccam {
					controlscript = ve_cam_control
					name = ReplayIGCCam
					viewport = <viewport>
					params = {seek my_object = <actor> camera_type = <clip_camera> goal_camera_morph = <goal_camera> camera_pos = <clip_camera_pos> camera_fov = <clip_camera_fov> camera_quat = <clip_camera_quat>}
				}
				getskatercamanimparams name = ReplayIGCCam
				use_camera = <cam_object_id>
			endif
			setactivecamera id = <use_camera> viewport = <viewport>
			seek_loc = (<preview_time> - <base_time>)
			seek_loc = (<seek_loc> / <time_mul>)
			if structurecontains structure = (<clips> [<i>]) clip_start
				seek_loc = (<seek_loc> + ((<clips> [<i>]).clip_start))
			endif
			if gotparam seek_loc
				if (<seek_loc> < 0.0)
					seek_loc = 0.0
				endif
				if (<seek_loc> > <length>)
					seek_loc = <length>
				endif
			endif
			<actor> :anim_command target = bodytimer command = timer_seek params = {time = <seek_loc>}
			break
		endif
		base_time = (<base_time> + <this_clip_real_time>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	<actor> :obj_setvisibility viewport = <viewport>
	if <actor> :anim_animnodeexists id = bodytimer
		<actor> :anim_command target = bodytimer command = timer_setspeed params = {speed = 0.0}
	endif
	killspawnedscript name = ve_update_preview_viewport
	spawnscriptnow ve_update_preview_viewport params = {actor = <actor> camera = <use_camera> viewport = <viewport>}
endscript
nasty_usercam_hack = 0

script ve_update_preview_viewport 
	GetSlomo
	setslomo 0.0
	unpausegame
	skater :obj_pausesounds
	skater :pause
	if gotparam actor
		if objectexists id = <actor>
			<actor> :unpause
			<actor> :obj_pausesounds
			<actor> :anim_updatepose
			<actor> :anim_update
			<actor> :obj_forceupdate
			<actor> :obj_setboundingsphere ($ve_bounding_sphere_size)
		endif
	endif
	if gotparam camera
		if objectexists id = <camera>
			<camera> :unpause
			<camera> :obj_forceupdate
		endif
	endif
	wait 2 gameframes
	if gotparam camera
		if objectexists id = <camera>
			setactivecamera id = <camera> viewport = <viewport>
		endif
	endif
	pausegame
	if gotparam actor
		if objectexists id = <actor>
			<actor> :obj_setboundingsphere ($ve_bounding_sphere_size)
			<actor> :pause
		endif
	endif
	if gotparam camera
		if objectexists id = <camera>
			<camera> :pause
		endif
	endif
	setslomo 1.0
	killskatercamanim name = ve_temp_viewport_cam
	ve_wake_paused_scripts
	if ($nasty_usercam_hack = 1)
		unpausegame
		change nasty_usercam_hack = 0
	endif
endscript

script ve_play_clip_get_details 
	ve_get_original_clip_length clip = (<clip>.name)
	if structurecontains structure = <clip> clip_start
		clip_start = ((<clip>.clip_start) / <length>)
	else
		clip_start = 0.0
	endif
	if structurecontains structure = <clip> clip_end
		clip_end = ((<clip>.clip_end) / <length>)
	else
		clip_end = 1.0
	endif
	if structurecontains structure = <clip> clip_speed
		clip_speed = (<clip>.clip_speed)
	else
		clip_speed = 1.0
	endif
	if structurecontains structure = <clip> clip_camera
		clip_camera = (<clip>.clip_camera)
	else
		clip_camera = `default`
	endif
	if structurecontains structure = <clip> clip_camera_pos
		clip_camera_pos = (<clip>.clip_camera_pos)
	else
		clip_camera_pos = (0.0, 0.0, 0.0)
	endif
	if structurecontains structure = <clip> clip_camera_fov
		clip_camera_fov = (<clip>.clip_camera_fov)
	endif
	if structurecontains structure = <clip> clip_camera_quat
		clip_camera_quat = (<clip>.clip_camera_quat)
	endif
	if structurecontains structure = <clip> goal_camera
		goal_camera = (<clip>.goal_camera)
	endif
	ve_get_clip_data name = (<clip>.name)
	return <...>
endscript

script ve_get_goal_camera 
	if structurecontains structure = <clip> goal_camera
		return goal_camera = (<clip>.goal_camera)
	endif
	if structurecontains structure = <clip_data> goal_camera
		return goal_camera = (<clip_data>.goal_camera)
	endif
	return \{goal_camera = {
		}}
endscript

script ve_rerecord_camera \{slomo = 1.0
		capture_update_interval = 1}
	printf \{'ve_clip_rerecord_camera'}
	change \{ve_record_usercam_cancelled = 0}
	spawnscriptlater ve_play_clips params = {
		clips = [{name = <name> clip_speed = <slomo>}]
		end_state = <end_state>
		rerecord_camera = <camera_rec_name>
		capture_update_interval = <capture_update_interval>
		pre_play_callback = ve_rerecord_camera_pre_play
		pre_play_callback_params = {rerecord_camera = <camera_rec_name> capture_update_interval = <capture_update_interval>}
		post_play_callback = ve_rerecord_camera_post_play
		timeline_callback = ve_user_cam_fov_control
	}
endscript

script ve_rerecord_camera_pre_play viewport = 0
	printf 've_rerecord_camera_pre_play'
	stoprendering
	ve_preview_seek {
		actor = <ReplayActorName>
		camera = ReplayCamera
		viewport = <viewport>
		clips = [{name = <name>}]
		preview_time = 0.0
	}
	wait 4 gameframes
	startrendering
	ReplayCamera :vecam_func func = ylockoff
	if ui_video_editor_choose_custom_camera_pos ReplayActorName = <ReplayActorName> cameraname = ReplayCamera recorded_cam
		if NOT VideoClipSlotFunc find_clip name = <name>
			scriptassert 'Cannot record!'
		endif
		replay_remove_user_camera_asset name = <rerecord_camera>
		if screenelementexists id = Video_Playback_Controls
			if ($ui_gameplay_show_hud = 1)
				createscreenelement {
					parent = Video_Playback_Controls
					type = textelement
					just = [left center]
					font = text_a1
					pos = (80.0, 650.0)
					scale = (0.9, 0.7)
					text = "\\m1 Stop recording"
					rgba = [200 200 200 255]
					not_focusable
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
				ve_camera_add_button_prompts ypos = 620 parent = Video_Playback_Controls
			endif
		endif
		<ReplayActorName> :replay_init_tree
		<ReplayActorName> :record_start {
			name = <rerecord_camera>
			time = <length>
			StopCallback = ve_recorded_clip
			StopCallbackParams = {
				time = <length>
				object_id = <ReplayActorName>
				rerecord_camera
				no_sound
			}
			record_camera = ReplayCamera
			no_record_ui
			rec_user_camera
			capture_update_interval = <capture_update_interval>
		}
		ReplayCamera :sethfov hfov = <camera_fov>
		ReplayCamera :vecam_func func = ylockon
	else
		return cancelled = 1
	endif
endscript

script ve_rerecord_camera_post_play \{viewport = 0}
	printf \{'ve_rerecord_camera_post_play'}
	<ReplayActorName> :ve_wait_for_record_to_finish
	ve_end_user_free_cam \{camera = ReplayCamera}
endscript

script ve_create_actor_and_camera 
	if ($ve_preview_camera = none)
		ve_create_replay_camera
		owns_camera = 1
	endif
	if ($ve_preview_actor = none)
		skater :skeleton_getskeletonname
		skater :switchonatomic all
		skater :switchonatomic cas_board
		replay_create_actor clonefrom = skater preferredid = ReplaySkater skeleton = <skeletonname>
		<ReplayActorName> :switchonatomic cas_board
		owns_actor = 1
	else
		ReplayActorName = ($ve_preview_actor)
	endif
	if NOT objectexists id = <ReplayActorName>
		scriptassert 'No replay actor!'
	endif
	return ReplayActorName = <ReplayActorName> owns_camera = <owns_camera> owns_actor = <owns_actor>
endscript

script ve_do_pre_play_events 
	switch <type>
		case ShatterAndDie
		case Z_Bell_Shatter_replay
		case Z_Slums_Shatter_wood_replay
		case Z_Slums_Shatter_wood_air_replay
		printf \{'ve_do_pre_play_events - ShatterAndDie'}
		if ((<time> > <start_time>) && (<time> < <end_time>))
			if isinnodearray <name>
				if NOT iscreated class = levelgeometry <name>
					create name = <name>
				endif
			endif
		endif
	endswitch
endscript

script ve_do_post_play_events 
	switch <type>
		case ShatterAndDie
		case Z_Bell_Shatter_replay
		case Z_Slums_Shatter_wood_replay
		case Z_Slums_Shatter_wood_air_replay
		printf \{'ve_do_post_play_events - ShatterAndDie'}
	endswitch
endscript

script ve_do_playback_event 
	switch <type>
		case ShatterAndDie
		case Z_Bell_Shatter_replay
		case Z_Slums_Shatter_wood_replay
		case Z_Slums_Shatter_wood_air_replay
		printf \{'ve_do_playback_event - ShatterAndDie'}
		if isinnodearray <name>
			if iscreated class = levelgeometry <name>
				<actor> :<type> <...>
			endif
		endif
	endswitch
endscript

script ve_process_event_list 
	if NOT gotparam event_index
		scriptassert 'event_index missing'
	endif
	process_count = 0
	getarraysize <events>
	if (<array_size> > 0)
		begin
		if ((<event_index> + <process_count>) >= <array_size>)
			break
		endif
		if gotparam time
			if (((<events> [(<event_index> + <process_count>)]).time) <= <time>)
				process_count = (<process_count> + 1)
			else
				break
			endif
		else
			process_count = (<process_count> + 1)
		endif
		repeat
		if (<process_count> > 0)
			begin
			if (<first_event_process> = 0)
				ve_do_playback_event {(<events> [<event_index>]) actor = <actor>}
			endif
			event_index = (<event_index> + 1)
			repeat <process_count>
		endif
	endif
	return event_index = <event_index>
endscript

script ve_process_entire_event_list 
	getarraysize <events>
	if (<array_size> > 0)
		foreachin <events> do = <scr> params = {actor = <actor> start_time = <start_time> end_time = <end_time>}
	endif
endscript

script ve_is_playing 
	if NOT gotparam \{ignore_preview}
		if scriptisrunning \{ve_update_preview_viewport}
			return \{true}
		endif
		if scriptisrunning \{ve_preview_seek}
			return \{true}
		endif
	endif
	if scriptisrunning \{ve_play_clips}
		return \{true}
	endif
	if ($replay_currently_playing = 1)
		return \{true}
	endif
	return \{false}
endscript

script ve_get_first_cas 
	i = 0
	getarraysize <clips>
	if (<array_size> > 0)
		begin
		if VideoClipSlotFunc get_clip_data_struct name = ((<clips> [0]).name)
			cas = (<clip_data>.cas)
			removeparameter clip_data
			if IsInCrib
				if NOT structurecontains structure = <cas> cas_pro_body
					return true cas = <cas>
				endif
			else
				return true cas = <cas>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return false
endscript

script ve_handle_overlong_clips 
	startrendering
	EditBufferFunc func = clear
	ve_set_render_playback toggle = 0
	if NOT cd
		create_dialog_box {
			title = "Cannot Play"
			text = "This finalized edit needs 30s buffers to playback."
			buttons = [
				{text = "OK" pad_choose_script = ui_change_state pad_choose_params = {state = <end_state>}}
			]
		}
	else
		ui_change_state state = <end_state>
	endif
endscript

script ve_set_hide_playback_ui 
	if screenelementexists \{id = Video_Playback_Controls}
		setscreenelementprops \{id = Video_Playback_Controls
			alpha = 0.0}
	endif
endscript

script ve_set_show_playback_ui 
	alpha = 1.0
	if screenelementexists \{id = Video_Playback_Controls}
		if gotparam \{fadein}
			if scriptisrunning \{ve_playback_ui_fade_out}
				removeparameter \{fadein}
			else
				alpha = 0.0
			endif
		endif
		setscreenelementprops {
			id = Video_Playback_Controls
			alpha = <alpha>
		}
		if gotparam \{fadeout}
			runscriptonscreenelement \{ve_playback_ui_fade_out
				id = Video_Playback_Controls}
		endif
		if gotparam \{fadein}
			runscriptonscreenelement \{ve_playback_ui_fade_in
				id = Video_Playback_Controls}
		endif
	endif
endscript

script ve_playback_ui_fade_out 
	wait \{1.0
		seconds
		ignoreslomo}
	domorph \{alpha = 0
		time = 1.0}
endscript

script ve_playback_ui_fade_in 
	wait \{0.5
		seconds
		ignoreslomo}
	domorph \{alpha = 1.0
		time = 0.5}
endscript

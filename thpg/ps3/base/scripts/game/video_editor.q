ve_clip_data_info = [
	{
		buffer_size = 501760
		anim_postfix = '_skeleton'
		name = skeleton_data
	}
	{
		buffer_size = 13824
		anim_postfix = '_object'
		name = object_data
	}
	{
		buffer_size = 14336
		anim_postfix = '_camera'
		name = camera_data
	}
	{
		buffer_size = 14336
		anim_postfix = '_user_camera'
		name = user_camera_data
	}
	{
		buffer_size = 18688
		name = audio_data
	}
	{
		buffer_size = 10240
		name = struct_data
	}
]
ve_max_clip_slots = 16
ve_max_profile_edits = 25
ve_max_profile_clips = 100
ve_saved_node_flags = {
	empty
}

script ve_new_edit 
	VideoEditorFunc get_edit_count
	VideoEditorFunc get_new_edit_id
	formattext textname = text "Video Edit %d" d = <new_edit_id>
	manglechecksums a = <new_edit_id> b = 0
	VideoEditorFunc add_edit edit = {
		name = <mangled_id>
		text = <text>
		clips = []
		effects = []
		overlays = []
		audio = {music = bloc_party_version_2 music_start = 14.0}
	}
	return index = <count> name = <edit_name> text = <text>
endscript

script ve_get_clip_data 
	if VideoEditorFunc get_clip name = <name>
		return true clip = <clip>
	else
		if (<name> = ($ve_rec_clip_name))
			return true clip = {
				name = <name>
				time = (($ve_rec_clip_data).time)
				area = (($ve_rec_clip_data).area)
				zones = (($ve_rec_clip_data).zones)
				extra_zones = (($ve_rec_clip_data).extra_zones)
				goal_camera = (($ve_rec_clip_data).goal_camera)
			}
		elseif VideoClipSlotFunc get_clip_data_struct name = <name>
			ve_get_original_clip_length clip = <name>
			return true clip = {
				name = <name>
				time = <length>
				area = (<clip_data>.area)
				zones = (<clip_data>.zones)
				extra_zones = (<clip_data>.extra_zones)
				goal_camera = (<clip_data>.goal_camera)
				user_camera = (<clip_data>.user_camera)
			}
		endif
	endif
	return false
endscript

script ve_wait_for_viewport 
	if NOT (<id> = 0)
		i = 0
		begin
		if viewportexists id = <id>
			break
		endif
		wait \{1
			gameframe}
		i = (<i> + 1)
		if (<i> = 100)
			scriptassert \{'Hang waiting for viewport to be created'}
		endif
		repeat
	endif
endscript

script ve_create_replay_camera 
	if objectexists \{id = ReplayCamera}
		scriptassert \{'Replaycamera already exists!'}
	endif
	createcompositeobject \{components = [
			{
				component = videoeditorcamera
			}
			{
				component = camera
			}
			{
				component = animexportcamera
			}
		]
		params = {
			name = ReplayCamera
		}}
endscript

script ve_delete_clip 
	VideoClipSlotFunc remove_clip name = <name>
	VideoEditorFunc remove_clip name = <name>
	ve_delete_clip_from_edits clip = <name>
endscript

script ve_get_edit_clip_length 
	ve_get_original_clip_length clip = (<edit_clip>.name)
	if structurecontains structure = <edit_clip> clip_start
		edit_len = (<length> - (<edit_clip>.clip_start))
		edit_len = (<edit_len> - (<length> - (<edit_clip>.clip_end)))
		edit_len = (<edit_len> * (1.0 / (<edit_clip>.clip_speed)))
	else
		edit_len = <length>
	endif
	return length = <edit_len>
endscript

script ve_get_default_edit_clip_struct 
	VideoEditorFunc get_clip name = <name>
	return clip_struct = {
		name = <name>
		clip_start = 0.0
		clip_end = (<clip>.time)
		clip_speed = 1.0
		clip_camera = `default`
	}
endscript

script ve_get_clips_entire_length 
	entire_length = 0.0
	i = 0
	getarraysize <clips>
	if (<array_size> > 0)
		begin
		if gotparam \{stop_at}
			if (<stop_at> = <i>)
				break
			endif
		endif
		clip = (<clips> [<i>])
		ve_get_edit_clip_length edit_clip = <clip>
		entire_length = (<entire_length> + <length>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return entire_length = <entire_length>
endscript

script ve_array_swap_elements 
	temp = (<array> [<index2>])
	other = (<array> [<index1>])
	setarrayelement array = <array> arrayname = array index = <index2> newvalue = <other>
	setarrayelement array = <array> arrayname = array index = <index1> newvalue = <temp>
	return swapped_array = <array>
endscript

script ve_array_insert_element array = [] element = arse index = 0
	getarraysize <array>
	if (<array_size> > 0)
		new_array = []
		i = 0
		begin
		if (<index> = <i>)
			ins_elem_array = [{<element>}]
			new_array = (<new_array> + <ins_elem_array>)
		endif
		new_elem = (<array> [<i>])
		new_elem_array = [{<new_elem>}]
		new_array = (<new_array> + <new_elem_array>)
		i = (<i> + 1)
		repeat <array_size>
		if (<index> = <array_size>)
			ins_elem_array = [{<element>}]
			new_array = (<new_array> + <ins_elem_array>)
		endif
	else
		return array = [{<element>}]
	endif
	return array = <new_array>
endscript

script ve_add_clip_to_edit 
	ve_get_default_edit_clip_struct name = <add_clip>
	new_entry = [{<clip_struct>}]
	clips = (<clips> + <new_entry>)
	return clips = <clips>
endscript

script ve_add_effect_to_edit 
	ve_convert_checksum_to_array checksum = <add_effect>
	default_strength = 0.75
	if structurecontains structure = ($ve_effects) <add_effect>
		default_strength = ((($ve_effects).<add_effect>).default_strength)
	endif
	default_blend = 1
	if structurecontains structure = ($ve_effects) <add_effect>
		default_blend = ((($ve_effects).<add_effect>).default_blend)
	endif
	new_entry = [{
			length = <len>
			blend_in = <default_blend>
			blend_out = <default_blend>
			strength = <default_strength>
			effects = <checksum_array>
			params = <params>
		}]
	effects = (<effects> + <new_entry>)
	return effects = <effects>
endscript

script ve_add_overlay_to_edit 
	new_entry = [{
			name = <add_overlay>
			length = <len>
		}]
	overlays = (<overlays> + <new_entry>)
	return overlays = <overlays>
endscript

script ve_modify_selected_clip 
	clip = {
		(<clips> [<index>])
		clip_start = <clip_start>
		clip_end = <clip_end>
		clip_speed = <clip_speed>
		clip_camera = <clip_camera>
		clip_camera_pos = <clip_camera_pos>
		clip_camera_fov = <clip_camera_fov>
		clip_camera_quat = <clip_camera_quat>
	}
	setarrayelement clips = <clips> arrayname = clips index = <index> newvalue = <clip>
	return clips = <clips>
endscript

script ve_modify_selected_effect 
	if gotparam append_new_effect
		effect_list = ((<effects> [<index>]).effects)
		ve_convert_checksum_to_array checksum = <append_new_effect>
		if (((<effect_list> [0]) = none) || (<append_new_effect> = none))
			effect_list = (<checksum_array>)
		else
			effect_list = ((<effect_list>) + (<checksum_array>))
		endif
	endif
	effect = {
		(<effects> [<index>])
		effects = <effect_list>
		length = <length>
		strength = <strength>
		blend_in = <blend_in>
		blend_out = <blend_out>
	}
	setarrayelement effects = <effects> arrayname = effects index = <index> newvalue = <effect>
	return effects = <effects>
endscript

script ve_modify_selected_overlay 
	overlay = {
		(<overlays> [<index>])
		length = <length>
	}
	setarrayelement overlays = <overlays> arrayname = overlays index = <index> newvalue = <overlay>
	return overlays = <overlays>
endscript

script ve_validate_clips 
	getarraysize <clips>
	i = 0
	if (<array_size> > 0)
		begin
		edit_clip = (<clips> [<i>])
		removed = 0
		if VideoEditorFunc get_clip name = (<edit_clip>.name)
			if gotparam edit_area
				if NOT ((<clip>.area) = <edit_area>)
					printf 'Removed clip which violates area rules'
					removearrayelement array = <clips> index = <i>
					clips = <array>
					removed = 1
				endif
			else
				edit_area = (<clip>.area)
			endif
		else
			printf 'Removed clip which doesnt exist'
			removearrayelement array = <clips> index = <i>
			clips = <array>
			removed = 1
		endif
		if (<removed> = 0)
			i = (<i> + 1)
		endif
		repeat <array_size>
	endif
	return clips = <clips>
endscript

script ve_restore_rak_pieces 
	printf 'restoring rigger career pieces...'
	if NOT gman_hasactivegoals
		if IsInCrib
			if CAP_LoadRiggerSetup rigger_crib
				if gotparam fast
					UpdateRigAKitPieces pieces = (<setup>.pieces)
				else
					cap_restore_pieces_from_array array = (<setup>.pieces)
				endif
			endif
		else
			if CAP_LoadRiggerSetup rigger_career
				if gotparam fast
					UpdateRigAKitPieces pieces = (<setup>.pieces)
				else
					cap_restore_pieces_from_array array = (<setup>.pieces)
				endif
			endif
		endif
	endif
endscript

script ve_concatenate_cuts clips = [] cuts = []
	time = 0.0
	getarraysize <clips>
	i = 0
	master_cuts = <cuts>
	if gotparam effects
		ve_convert_effects_to_cuts effects = <effects> start_time = <start_time>
		master_cuts = (<master_cuts> + <cuts>)
	endif
	if gotparam overlays
		ve_convert_overlays_to_cuts overlays = <overlays> start_time = <start_time>
		master_cuts = (<master_cuts> + <cuts>)
	endif
	getarraysize <master_cuts>
	if (<array_size> > 0)
		i = 0
		begin
		j = (<i> + 1)
		this_time = (<master_cuts> [<i>].time)
		begin
		if (<j> >= <array_size>)
			break
		endif
		other_time = (<master_cuts> [<j>].time)
		if (<other_time> < <this_time>)
			printf 'Swapping...'
			this_time = <other_time>
			ve_array_swap_elements {
				array = <master_cuts>
				index1 = <i>
				index2 = <j>
			}
			master_cuts = <swapped_array>
		endif
		j = (<j> + 1)
		repeat
		i = (<i> + 1)
		repeat <array_size>
	endif
	return cuts = <master_cuts>
endscript

script ve_process_cuts terminated_cuts = 0
	process_count = 0
	getarraysize <cuts>
	begin
	if ((<cut_index> + <process_count>) >= <array_size>)
		break
	endif
	if gotparam time
		if (((<cuts> [(<cut_index> + <process_count>)]).time) <= <time>)
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
		ve_process_cut cut = (<cuts> [<cut_index>]) viewport = <viewport> terminated_cuts = <terminated_cuts>
		cut_index = (<cut_index> + 1)
		repeat <process_count>
	endif
	return cut_index = <cut_index>
endscript

script ve_convert_overlays_to_cuts 
	getarraysize <overlays>
	num_overlays = <array_size>
	cuts = []
	i = 0
	if (<num_overlays> > 0)
		curr_time = 0.0
		begin
		end_movie_time = (<curr_time> + ((<overlays> [<i>]).length))
		if (<end_movie_time> > <start_time>)
			new_cut = [{
					time = <curr_time>
					type = bink
					params = {
						name = ((<overlays> [<i>]).name)
					}
				}]
			cuts = (<cuts> + <new_cut>)
		endif
		curr_time = <end_movie_time>
		i = (<i> + 1)
		repeat <num_overlays>
		new_cut = [{
				time = <curr_time>
				type = bink
				params = {
					name = none
				}
			}]
		cuts = (<cuts> + <new_cut>)
	endif
	return cuts = <cuts>
endscript

script ve_get_array_end_time 
	getarraysize <array>
	total_time = 0.0
	if (<array_size> > 0)
		i = 0
		begin
		if gotparam \{stop_at}
			if (<stop_at> = <i>)
				break
			endif
		endif
		total_time = (<total_time> + ((<array> [<i>]).length))
		i = (<i> + 1)
		repeat <array_size>
	endif
	return end_time = <total_time>
endscript

script ve_viewport_create 
	if screenelementexists id = video_editor_viewport
		destroyscreenelement id = video_editor_viewport
	endif
	wait 3 gameframes
	mempushcontext topdownheap
	createscreenelement {
		parent = <parent>
		type = viewportelement
		id = video_editor_viewport
		texture = viewport1
		just = [bottom right]
		pos = {(1.0, 1.0) proportional}
		dims = (450.0, 250.0)
		z_priority = 2
		local_id = viewport
		viewport_priority = 1
	}
	mempopcontext
	playigccam {
		name = ve_temp_viewport_cam
		viewport = video_editor_viewport
		lockto = world
		pos = (471.87625, 69.174965, -224.09903)
		quat = (-0.21708801, 0.7229759, 0.260974)
		fov = 72.0
	}
	killspawnedscript name = ve_update_preview_viewport
	spawnscriptnow ve_update_preview_viewport params = {camera = ReplayCamera viewport = video_editor_viewport firstupdate}
endscript

script ve_viewport_destroy 
	killskatercamanim \{name = ve_viewport_cam}
	if screenelementexists \{id = video_editor_viewport}
		destroyscreenelement \{id = video_editor_viewport}
	endif
endscript

script ve_create_preview_objects 
	if ($ve_preview_camera = none)
		ve_create_replay_camera
		change ve_preview_camera = ReplayCamera
	endif
	skater :switchonatomic all
	skater :switchonatomic cas_board
	skater :skeleton_getskeletonname
	if ($ve_preview_actor = none)
		replay_create_actor clonefrom = skater preferredid = ReplaySkater skeleton = <skeletonname>
		<ReplayActorName> :switchonatomic cas_board
		<ReplayActorName> :proximtrigger_setactive active = 0
		change ve_preview_actor = <ReplayActorName>
	endif
	ve_suspend_main_skater
	ve_push_editing_buss
	change ve_last_preview_clip_name = null
endscript

script ve_destroy_preview_objects fs_playback = 0
	ve_kill_preview_scripts
	if (<fs_playback> = 0)
		setactivecamera id = skatercam0 viewport = <viewport>
		if NOT ($ve_preview_camera = none)
			($ve_preview_camera) :die
		endif
		if NOT ($ve_preview_actor = none)
			($ve_preview_actor) :die
		endif
		change ve_preview_camera = none
		change ve_preview_actor = none
	endif
	ve_unsuspend_main_skater
	if (<fs_playback> = 0)
		ve_restore_old_cas_skater
		ve_restore_rak_pieces
		ve_clear_extra_zone
	endif
	change ve_last_preview_clip_name = null
	ve_pop_editing_buss
endscript

script ve_recreate_actor 
	printf \{'ve_recreate_actor'}
	<name> :releasesoundrecordingmemory
	<name> :die
	skater :skeleton_getskeletonname
	skater :switchonatomic \{all}
	skater :switchonatomic \{cas_board}
	replay_create_actor clonefrom = skater preferredid = <name> skeleton = <skeletonname>
	<ReplayActorName> :switchonatomic cas_board
endscript

script ve_kill_preview_scripts 
	killskatercamanim \{name = ReplayIGCCam}
	killskatercamanim \{name = ve_temp_viewport_cam}
	killspawnedscript \{name = ve_cam_control}
	killspawnedscript \{name = ve_update_preview_viewport}
	killspawnedscript \{name = ve_preview_seek}
	setslomo \{1.0}
endscript

script ve_wake_paused_scripts 
	unpausespawnedscript ve_update_preview_viewport
	unpausespawnedscript ve_preview_seek
	unpausespawnedscript ve_wait_for_viewport
	unpausespawnedscript ve_play_clips
	unpausespawnedscript ve_stop_recording
	unpausespawnedscript ve_area_check_script
	unpausespawnedscript ve_viewport_create
	unpausespawnedscript ui_video_editor_analog_stick_watcher
	unpausespawnedscript ui_ve_highlight_loop
	unpausespawnedscript ui_play_preview
	unpausespawnedscript ui_video_editor_create_dialog
	unpausespawnedscript do_ok_dialog_box
	unpausespawnedscript ui_video_editor_choose_custom_camera_pos
	unpausespawnedscript sysnotify_handle_unpause
	unpausespawnedscript sysnotify_handle_pause
	unpausespawnedscript sysnotify_handle_signin_change
	unpausespawnedscript sysnotify_invite_go
	unpausespawnedscript net_view_goals_searching_fade_out_and_die
	unpausespawnedscript dialog_box_delay_input
	unpausespawnedscript ve_force_update_proxims
	unpausespawnedscript ve_destroy_hide_lod_ui_delayed
	unpausespawnedscript video_editor_x
	unpausespawnedscript ui_create_video_editor_edit_view_spawned
	unpausespawnedscript ui_create_video_editor_edit_view_spawned_part_two
	if screenelementexists id = clip_load_animation_icon
		destroyscreenelement id = clip_load_animation_icon
	endif
	unpausespawnedscript ve_panic_unload_ve
	kill_start_key_binding
endscript

script ve_use_cas_appearance 
	printf 've_use_cas_appearance'
	GetCurrentSkaterProfileIndex
	GetPlayerAppearance player = <currentskaterprofileindex>
	if NOT comparestructs struct1 = <profile> struct2 = <cas>
		if gotparam pro_switch_only
			if structurecontains structure = <cas> cas_pro_body
				do_pro_swap = switch_to_pro
			elseif structurecontains structure = <profile> cas_pro_body
				do_pro_swap = switch_from_pro
			endif
			if gotparam do_pro_swap
				printf 've_use_cas_appearance - SkaterSwapInTemporaryAppearance (pro version)'
				ve_use_cas_appearance_cleanup_temp_geoms
				if (<do_pro_swap> = switch_to_pro)
					RememberTemporaryAppearance {
						player = <currentskaterprofileindex>
						name = video_editor_temp_profile
					}
					SkaterSwapInTemporaryAppearance appearance = <cas> no_refresh
					cas_push_temp_geoms heap = bottomupheap
				endif
				if gotparam actor
					ve_recreate_actor name = <actor>
				endif
			endif
		else
			printf 've_use_cas_appearance - SkaterSwapInTemporaryAppearance'
			ve_use_cas_appearance_cleanup_temp_geoms
			ve_show_loading_screen
			SkaterSwapInTemporaryAppearance appearance = <cas>
			if gotparam actor
				ve_recreate_actor name = <actor>
			endif
			if gotparam shown_loading_screen
				ve_hide_loading_screen
			endif
		endif
	endif
endscript

script ve_use_cas_appearance_cleanup_temp_geoms 
	if ($cas_using_temp_geoms = 1)
		GetCurrentSkaterProfileIndex
		RestoreTemporaryAppearance {
			player = <currentskaterprofileindex>
			name = video_editor_temp_profile
		}
		cas_pop_temp_geoms
	endif
endscript

script ve_get_extents 
	if gotparam clips
		getarraysize <clips>
		if (<index> < <array_size>)
			ve_get_clips_entire_length clips = <clips> stop_at = <index>
			start_extent = <entire_length>
			ve_get_edit_clip_length edit_clip = (<clips> [<index>])
			end_extent = (<start_extent> + <length>)
		endif
	elseif gotparam effects
		getarraysize <effects>
		if (<index> < <array_size>)
			ve_get_array_end_time array = <effects> stop_at = <index>
			start_extent = <end_time>
			end_extent = (<end_time> + ((<effects> [<index>]).length))
		endif
	elseif gotparam overlays
		getarraysize <overlays>
		if (<index> < <array_size>)
			ve_get_array_end_time array = <overlays> stop_at = <index>
			start_extent = <end_time>
			end_extent = (<end_time> + ((<overlays> [<index>]).length))
		endif
	endif
	if gotparam end_extent
		return true start_extent = <start_extent> end_extent = <end_extent>
	endif
	return false
endscript

script ve_trim_clip 
	edit_clip = (<clips> [<index>])
	ve_get_extents clips = <clips> index = <index>
	if (<leading> < <start_extent>)
		leading = <start_extent>
	endif
	if (<trailing> > <end_extent>)
		trailing = <end_extent>
	endif
	start_offset = (<leading> - <start_extent>)
	start_offset = (<start_offset> * <edit_clip>.clip_speed)
	start_offset = (<start_offset> + (<edit_clip>.clip_start))
	end_offset = (<trailing> - <start_extent>)
	end_offset = (<end_offset> * <edit_clip>.clip_speed)
	end_offset = (<end_offset> + (<edit_clip>.clip_start))
	ve_modify_selected_clip clips = <clips> index = <index> clip_start = <start_offset> clip_end = <end_offset>
	return clips = <clips>
endscript

script ve_split_clip min_length = 0.0
	edit_clip = (<clips> [<index>])
	ve_get_extents clips = <clips> index = <index>
	if (<time> <= (<start_extent> + <min_length>))
		return false clips = <clips> new_index = <index>
	endif
	if (<time> >= (<end_extent> - <min_length>))
		return false clips = <clips> new_index = <index>
	endif
	split_offset = (<time> - <start_extent>)
	split_offset = (<split_offset> * <edit_clip>.clip_speed)
	split_offset = (<split_offset> + (<edit_clip>.clip_start))
	new_first_clip = {<edit_clip> clip_end = <split_offset>}
	new_second_clip = {<edit_clip> clip_start = <split_offset>}
	setarrayelement clips = <clips> arrayname = clips index = <index> newvalue = <new_second_clip>
	ve_array_insert_element array = <clips> index = <index> element = <new_first_clip>
	return true clips = <array> new_index = (<index> + 1)
endscript

script ve_get_clip_at_time 
	clip_time = 0
	i = 0
	getarraysize <clips>
	if (<array_size> > 0)
		begin
		ve_get_edit_clip_length edit_clip = (<clips> [<i>])
		if (<time> < <clip_time>)
			return false
		endif
		clip_time = (<clip_time> + <length>)
		if (<time> < <clip_time>)
			return true index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (<time> = <clip_time>)
		return true index = (<i> - 1)
	endif
	return false
endscript

script ve_get_original_clip_length 
	if VideoEditorFunc get_clip name = <clip>
		return length = (<clip>.time)
	else
		replay_get_length name = <clip>
		return length = <length>
	endif
endscript

script ve_delete_clip_from_edits 
	VideoEditorFunc get_edit_count
	i = 0
	if (<count> > 0)
		begin
		VideoEditorFunc get_edit index = <i>
		ve_remove_clip_from_given_edit edit_clips = (<edit>.clips) clip = <clip>
		if ve_get_clips_area clips = <edit_clips>
			if (<modified> = 1)
				VideoEditorFunc set_edit index = <i> edit = {<edit> clips = <edit_clips>}
			endif
			i = (<i> + 1)
		else
			printf 'Removed %d, as its empty now' d = (<edit>.name)
			VideoEditorFunc remove_edit index = <i>
		endif
		repeat <count>
	endif
	ve_remove_clip_from_given_edit edit_clips = ($ve_current_edit_clips) clip = <clip>
	if (<modified> = 1)
		change ve_current_edit_clips = <edit_clips>
	endif
endscript

script ve_remove_clip_from_given_edit 
	modified = 0
	iClip = 0
	getarraysize <edit_clips>
	if (<array_size> > 0)
		begin
		edit_clip = (<edit_clips> [<iClip>])
		if ((<edit_clip>.name) = <clip>)
			printf 'Removed %s from edit' s = <clip>
			modified = 1
			removearrayelement array = <edit_clips> index = <iClip>
			edit_clips = <array>
		else
			iClip = (<iClip> + 1)
		endif
		repeat <array_size>
	endif
	return edit_clips = <edit_clips> modified = <modified>
endscript

script ve_trim_array_to_length 
	begin
	ve_get_array_end_time array = <array>
	if (<end_time> <= <length>)
		break
	endif
	getarraysize <array>
	if (<array_size> = 0)
		scriptassert 'Empty arrays should be within the length %d!' d = <length>
	endif
	index = (<array_size> -1)
	last_entry = (<array> [<index>])
	last_entry_length = (<last_entry>.length)
	last_entry_start = (<end_time> - <last_entry_length>)
	new_length = (<length> - <last_entry_start>)
	if (<new_length> >= <min_length>)
		last_entry = {<last_entry> length = <new_length>}
		setarrayelement arrayname = array index = <index> newvalue = <last_entry>
	else
		removearrayelement array = <array> index = <index>
	endif
	repeat
	return trimmed_array = <array>
endscript

script ve_can_create_new_edit 
	VideoEditorFunc \{get_edit_count}
	if (<count> < ($ve_max_profile_edits))
		return \{true}
	endif
	return \{false}
endscript

script ve_can_create_new_clip 
	VideoEditorFunc \{get_clip_count}
	if (<count> < ($ve_max_profile_clips))
		return \{true}
	endif
	return \{false}
endscript

script ve_enter_video_editor 
	printf \{'ve_enter_video_editor'}
	ve_fix_skater_for_ve_entry
	ve_stall_for_zone_loads
	goal_kill_all_peds \{ignore_goal = null}
	gman_toggleallgoaltriggers \{hide = 1}
	ve_toggle_chalk_challenge_markers \{zone = all
		state = 0}
	ve_toggle_chalk_challenge_markers \{zone = z_crib
		state = 0}
	goal_destroy_prompt_for_next_goal
	DisablePakManStreaming
	ve_prep_for_recording
	HideBailBoards
	ve_backup_node_flags
	crib_kill_bink
	hide_all_hud_sprites
	change \{video_editor_in_video_editor = 1}
endscript

script ve_exit_video_editor 
	printf 've_exit_video_editor'
	change video_editor_in_video_editor = 0
	if NOT ($ve_hard_load_zone = none)
		ve_show_loading_screen
	elseif NOT isassetloaded name = `zones/z_peds/z_peds.qb`
		ve_show_loading_screen
	endif
	ve_free_extra_zones
	ve_free_bink_buffers
	ve_set_memory_state state = unused
	ve_stall_for_zone_loads
	goal_restore_all_peds ignore_goal = null
	ve_restore_zone_objects
	if gotparam no_hard_load_zone
		change ve_hard_load_zone = none
	else
		ve_back_to_hard_load_last_zone
	endif
	if NOT IsInCrib
		EnablePakManStreaming
	else
		crib_change_to_career_theme_ve
	endif
	FixBadBailBoards
	ve_restore_temp_changes
	gman_toggleallgoaltriggers hide = 0
	UI_Show_Goal_Waypoint_If_Set
	ve_fix_skater_slomo
	if screenelementexists id = clip_load_animation_icon
		destroyscreenelement id = clip_load_animation_icon
	endif
	hide_all_hud_sprites
	wait 2 gameframes
	ve_hide_loading_screen
endscript
ve_panic_unload = 0

script ve_panic_unload_ve 
	change ve_panic_unload = 1
	if ($video_editor_in_video_editor = 1)
		ve_handle_sysnotify
		killskatercamanim all
		wait 4 gameframes
		ve_exit_video_editor <...>
		generic_ui_destroy
		ui_destroy_video_editor_background
		if screenelementexists id = video_editor_main_anchor
			destroyscreenelement id = video_editor_main_anchor
		endif
		restore_skater_camera
		killskatercamanim all
		wait 2 gameframes
		unpausegame
		ui_change_state state = uistate_gameplay
		killskatercamanim all
		ve_wake_paused_scripts
		restore_start_key_binding
		blockpendingpakmanloads map = zones block_scripts = 1
	endif
	change ve_panic_unload = 0
endscript

script ve_prep_for_recording 
	HideRigidBodies \{hide = 1}
	EnableRigidbodyCallbacks \{0}
	ve_cleanup_zone_objects
endscript

script ve_restore_temp_changes 
	HideRigidBodies \{hide = 0}
	EnableRigidbodyCallbacks \{1}
	if NOT gotparam \{not_zone_objects}
		ve_restore_zone_objects
	endif
	ve_restore_old_cas_skater
	ve_restore_rak_pieces
	ve_restore_node_flags
	ve_pop_editing_buss
	ve_toggle_chalk_challenge_markers \{zone = all
		state = 1}
	ve_toggle_chalk_challenge_markers \{zone = z_crib
		state = 1}
endscript

script ve_get_max_unqiue_clips 
	VideoClipSlotFunc \{get_num_slots}
	if (<num_slots> = 0)
		scriptassert \{'Need to call this with slots allocated'}
	endif
	return max_unqiue_clips = <num_slots>
endscript

script ve_ensure_clips_loaded 
	printf \{'ve_ensure_clips_loaded'}
	wait_for_script_to_finish \{name = ve_ensure_clips_loaded_spawned}
	if ve_ensure_clips_loaded_spawned clips = <clips>
		return \{true}
	else
		return false no_save = <no_save> bad_clips = <bad_clips>
	endif
endscript

script ve_ensure_clips_loaded_spawned 
	if NOT ($ve_memory_state = render)
		ve_set_memory_state state = playback
	endif
	got_slots = 0
	first_load = 1
	bad_clips = []
	getarraysize <clips>
	if (<array_size> > 0)
		i = 0
		begin
		clip_checksum = ((<clips> [<i>]).name)
		if VideoEditorFunc get_clip name = <clip_checksum>
			if (<got_slots> = 0)
				ve_ensure_slots_allocated
				got_slots = 1
			endif
			clip_file_name = (<clip>.name)
			wait_for_script_to_finish name = ve_load_from_memcard
			if NOT VideoClipSlotFunc is_clip_loaded name = <clip_checksum>
				VideoClipSlotFunc get_num_free_slots
				if (<num_free_slots> = 0)
					if NOT VideoClipSlotFunc get_unused_slot needed = <clips>
						ve_set_memory_state state = playback_freed_peds
						if NOT VideoClipSlotFunc get_unused_slot needed = <clips>
							scriptassert 'Erm, I think the edit doesnt obey the unique clip limit'
						endif
					endif
					VideoClipSlotFunc remove_clip index = <unused_slot>
					VideoClipSlotFunc get_num_free_slots
					if (<num_free_slots> = 0)
						scriptassert 'Erm, we should have at least one free slot here'
					endif
				endif
				if NOT gotparam freed_rigger
					freed_rigger = 1
					ve_free_up_scratch_heap
				endif
				if VideoClipSlotFunc is_clip_loaded name = <clip_checksum>
					scriptassert 'Argh, already loaded!'
				endif
				if (<first_load> = 1)
					if NOT renderingenabled
						started_rendering = 1
						startrendering
					endif
					if NOT game_progress_check_valid_save
						failed = 1
						no_save = 1
						break
					endif
					if NOT cardisinslot
						failed = 1
						no_save = 1
						break
					endif
					resettimer
					mcmess_loadingdata filetype = videoclip
					net_view_goals_create_searching_text {
						text = "Please Wait..."
						scale = 0.75
						parent = root_window
						id = clip_load_animation_icon
					}
					first_load = 0
				endif
				if NOT ve_load_from_memcard name = <clip_file_name>
					failed = 1
					ve_convert_checksum_to_array checksum = <clip_file_name>
					bad_clips = (<bad_clips> + <checksum_array>)
					break
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (<first_load> = 0)
		runscriptonscreenelement id = clip_load_animation_icon net_view_goals_searching_fade_out_and_die
		destroy_dialog_box
	endif
	if gotparam freed_rigger
		ve_restore_scratch_heap
	endif
	if gotparam failed
		return false no_save = <no_save> bad_clips = <bad_clips>
	else
		if gotparam started_rendering
			stoprendering
		endif
		return true
	endif
endscript
simulate_damaged_clips = 0

script ve_load_from_memcard 
	if ($simulate_damaged_clips = 1)
		return \{false}
	endif
	printf \{'ve_load_from_memcard'}
	casttointeger \{name}
	formattext textname = textfilename "%d" d = <name> integer_width = 6
	change \{savingorloading = loading}
	mc_waitasyncopsfinished
	loadfrommemorycard filename = <textfilename> filetype = videoclip
	if (<result> = true)
		return \{true}
	endif
	return \{false}
endscript

script ve_clip_breaks_slot_limit 
	new_entry = [none]
	unique_clips = []
	i = 0
	getarraysize <clips>
	if (<array_size> > 0)
		begin
		array_clip = ((<clips> [<i>]).name)
		if (<array_clip> = <clip>)
			return false
		endif
		if NOT arraycontains array = <unique_clips> contains = <array_clip>
			setarrayelement arrayname = new_entry index = 0 newvalue = <array_clip>
			unique_clips = (<unique_clips> + <new_entry>)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize <unique_clips>
	ve_ensure_slots_allocated
	ve_get_max_unqiue_clips
	if (<array_size> < <max_unqiue_clips>)
		return false
	endif
	return true
endscript

script ve_convert_checksum_to_array 
	checksum_array = [none]
	setarrayelement arrayname = checksum_array index = 0 newvalue = <checksum> resolveglobals = 0
	return checksum_array = <checksum_array>
endscript

script ve_handle_sysnotify 
	if iscreated skater
		if skater :export_isrecording
			printf "ve_handle_sysnotify: Export_IsRecording is true, ending record"
			skater :RecordSkaterAnimStop forced
		endif
	endif
	if ve_is_playing
		if compositeobjectexists ReplaySkater
			printf "ve_handle_sysnotify: ve_is_playing is true, ending playback"
			ve_play_stop ReplayActorName = ReplaySkater
		elseif compositeobjectexists ($ve_preview_actor)
			printf "ve_handle_sysnotify: ve_is_playing is true, ending playback"
			ve_play_stop ReplayActorName = ($ve_preview_actor)
		endif
	endif
	ve_camera_rec_cancelled
endscript

script ve_is_recording 
	if iscreated \{skater}
		if skater :export_isrecording
			return \{true}
		endif
	endif
endscript

script ve_trim_edit_to_time 
	new_clips = []
	getarraysize <clips>
	if (<array_size> > 0)
		i = 0
		curr_time = 0.0
		begin
		edit_clip = (<clips> [<i>])
		ve_get_edit_clip_length edit_clip = <edit_clip>
		if ((<curr_time> + <length>) > <time>)
			trim_by = ((<curr_time> + <length>) - <time>)
			trim_by = (<trim_by> * (<edit_clip>.clip_speed))
			clip_end = ((<edit_clip>.clip_end) - <trim_by>)
			edit_clip = {<edit_clip> clip_end = <clip_end>}
		endif
		curr_time = (<curr_time> + <length>)
		new_clip_entry = [{<edit_clip>}]
		new_clips = (<new_clips> + <new_clip_entry>)
		if (<curr_time> >= <time>)
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam effects
		ve_trim_array_to_length array = <effects> length = <time> min_length = 0
		new_effects = <trimmed_array>
	endif
	if gotparam overlays
		ve_trim_array_to_length array = <overlays> length = <time> min_length = 0
		new_overlays = <trimmed_array>
	endif
	return clips = <new_clips> effects = <new_effects> overlays = <new_overlays>
endscript

script ve_fix_missing_skater_board 
	skater :obj_getid
	manglechecksums a = bailboard b = <objid>
	if NOT objectexists id = <mangled_id>
		skater :SwitchOnBoard
	endif
endscript

script ve_restore_old_cas_skater 
	if ($cas_using_temp_geoms = 1)
		SkaterRestoreAfterTemporaryAppearance \{no_refresh}
		cas_pop_temp_geoms
	else
		if ($skater_using_temporary_appearance = 1)
			ve_show_loading_screen
			SkaterRestoreAfterTemporaryAppearance
			if gotparam \{shown_loading_screen}
				ve_hide_loading_screen
			endif
		endif
	endif
endscript

script ve_suspend_main_skater 
	skater :pause
	skater :hide
	skater :vibrate \{off}
	skater :pausephysics
	HideBailBoards
	skater :destroyskaterparticles
	freeze_skater_for_cinematic
	skater :obj_pausesounds
endscript

script ve_unsuspend_main_skater 
	unfreeze_skater_after_cinematic
	skater :unhide
	skater :pause
	skater :obj_pausesounds
endscript

script ve_fix_skater_for_ve_entry 
	skater :ve_fix_skater_for_ve_entry_guts
endscript

script ve_fix_skater_for_ve_entry_guts 
	fix = 1
	if inair
		fix = 0
	elseif onground
		fix = 0
	endif
	if walking
		if walk_hang
			fix = 1
			walk_forcetoairfromhang
			CleanUp_WalkingtoSkating
		elseif walk_ground
		else
			fix = 1
			CleanUp_WalkingtoSkating
		endif
	endif
	if (<fix> = 1)
		if gameispaused
			pauseit = 1
		endif
		cleareventhandlergroup `default`
		onexceptionrun
		setstate air
		setspeed 2.0
		obj_forceupdate
		printf 'Fixed Skater for VE'
		MakeSkaterGoto SkaterInit
		if gotparam pauseit
			pause
		endif
	endif
endscript

script ve_fix_skater_for_ve_entry_guts_respot 
	fix = 1
	if inair
		fix = 0
	elseif onground
		fix = 0
	endif
	if walking
		if walk_ground
		else
			fix = 1
		endif
	endif
	if (<fix> = 1)
		if gameispaused
			pauseit = 1
		endif
		skater :respotskater
		skater :obj_forceupdate
		printf 'Fixed Skater for VE'
		if gotparam pauseit
			pause
		endif
	endif
endscript

script ve_check_good_clip 
	if NOT replay_asset_exists name = <clip>
		printf 'No Clip!'
		return false
	else
		if NOT VideoClipBufferOverrunCheck
			printf 'Clip overruns buffers'
			return false
		else
			replay_get_length name = <clip>
			if ((<length> < ($video_editor_minimum_clip_length)) || (<length> > ($ve_max_record_time + 3.0)))
				printf 'Clip too long, or too short %d' d = <length>
				return false
			endif
		endif
	endif
	return true
endscript

script ve_backup_node_flags 
	if structurecontains structure = ($ve_saved_node_flags) empty
		WriteNodeFlagsToStruct
		change ve_saved_node_flags = <nodeflags>
		ve_set_ve_used_nodeflags
	endif
endscript

script ve_restore_node_flags 
	if NOT structurecontains structure = ($ve_saved_node_flags) empty
		ReadNodeFlagsFromStruct nodeflags = ($ve_saved_node_flags)
		change \{ve_saved_node_flags = {
				empty
			}}
	endif
endscript

script ve_use_node_flags 
	if structurecontains structure = ($ve_saved_node_flags) empty
		scriptassert \{'ve_backup_node_flags not called!'}
	endif
	ReadNodeFlagsFromStruct nodeflags = <nodeflags>
	ve_set_ve_used_nodeflags
endscript

script ve_pauseskaters_whilst_recording 
	printf \{'ve_pauseskaters_whilst_recording'}
	change \{ve_recording_camera_hosed = paused}
	skater :RecordSkaterAnimStop \{forced}
endscript

script ve_toggle_chalk_challenge_markers 
	goal_toggle_chalk_challenge_markers start_zone = <zone> state = <state>
endscript

script ve_fix_skater_slomo 
	skater :killspecial \{forcekill}
	if NOT skater :nailthetrick_isinnailthex
		setslomo \{1.0}
	endif
endscript

script ve_can_do_teleport_zone 
	if ($video_editor_in_video_editor = 1)
		return \{false}
	endif
	if NOT ($ve_hard_load_zone = none)
		return \{false}
	endif
	if NOT ($ve_zone_change_level_action = none)
		return \{false}
	endif
	return \{true}
endscript

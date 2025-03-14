ve_current_edit_index = -1
ve_current_edit_struct = {
}
ve_current_edit_clips = [
]
ve_current_edit_effects = [
]
ve_current_edit_overlays = [
]
ve_current_edit_audio = {
}
ve_current_edit_markers = [
]
video_max_length = 60.0
video_render_length = 60.0
timeline_max_length = 75.0
video_delete_edit = 0
video_editor_marker_threshold = 0.2
video_editor_marker_limit = 20
video_editor_current_selection = 0
video_editor_pane_selection = -1
video_editor_current_top = 0
video_editor_current_bottom = 5
video_editor_focus = menu
video_editor_zoom = 0
video_editor_default_overlay_loops = 1
video_editor_default_overlay_length = 15.0
video_editor_default_effect_length = 15.0
video_editor_minimum_effect_length = 0.25
video_editor_minimum_clip_length = 0.25
video_editor_max_row_items = 20
video_editor_focus_reset = 1
video_second_width = 60
video_timestart = 0.0
video_previous_time = -1.0
video_time_label_inc = 5
video_num_rows = 3
video_row_height = 50
video_timeline_width = 900
video_editor_jog_speed = 0.25
video_editor_jog_snap = 0.195
video_editor_jog_snap_unlock_frames = 5
video_editor_jog_time_lock_start = 0
video_editor_jog_time_lock_end = 0
video_timeline_cursor = 0.0
video_editor_update_bars = -1
video_cursor_row = 0
video_cursor_column = 0
video_editor_sel_mode = select
video_editor_fs_playback = 0
video_editor_snap_lock = 0
video_editor_trim_step = none
video_editor_trim_leading = 0.0
video_editor_trim_trailing = 0.0
video_editor_current = {
	pos = (0.0, 0.0)
	width = 0
	height = 0
	text = ""
}
video_editor_preview_end_frame = 0
video_editor_clip_user_camera = 0
video_editor_event_handlers = [
	{
		pad_left
		video_editor_left
	}
	{
		pad_right
		video_editor_right
	}
	{
		pad_up
		video_editor_up
	}
	{
		pad_down
		video_editor_down
	}
	{
		pad_choose
		video_editor_x
	}
	{
		pad_square
		ui_video_editor_toggle_marker
	}
	{
		pad_space
		ui_video_editor_preview_edit
	}
	{
		pad_back
		video_editor_back
	}
	{
		pad_l1
		video_editor_l1
	}
	{
		pad_r1
		video_editor_r1
	}
	{
		pad_r2
		ui_video_editor_play_edit_fs
	}
	{
		pad_r3
		video_editor_r3
	}
]

script video_editor_commit_to_profile 
	if video_editor_needs_to_commit
		change \{video_editor_dirty_flag = 1}
		video_editor_get_edit_to_commit
		VideoEditorFunc set_edit index = ($ve_current_edit_index) edit = <new_edit>
	else
		video_editor_get_edit_to_commit
	endif
	getarraysize (<new_edit>.clips)
	if (<array_size> = 0)
		VideoEditorFunc remove_edit name = (<new_edit>.name)
		change \{ve_current_edit_index = -1}
	endif
endscript

script video_editor_save_as_copy_to_profile 
	if NOT gotparam index
		index = ($ve_current_edit_index)
	endif
	if ve_can_create_new_edit
		VideoEditorFunc get_edit index = <index>
		getarraysize (<edit>.clips)
		if (<array_size> = 0)
			VideoEditorFunc remove_edit name = (<edit>.name)
		endif
		VideoEditorFunc get_edit_count
		VideoEditorFunc get_new_edit_id
		formattext textname = text "Video Edit %d" d = <new_edit_id>
		manglechecksums a = <new_edit_id> b = 0
		VideoEditorFunc add_edit edit = {
			name = <mangled_id>
			text = <text>
			clips = ($ve_current_edit_clips)
			effects = ($ve_current_edit_effects)
			overlays = ($ve_current_edit_overlays)
			audio = ($ve_current_edit_audio)
		}
		change ve_current_edit_index = <count>
		formattext textname = warning "The edit has been saved as: %e." e = <text>
		ui_video_editor_warning text = <warning> title = "Save Edit as Copy"
	else
		ui_video_editor_warning text = "Maximum edits reached, delete some to make room."
	endif
endscript

script video_editor_get_edit_to_commit 
	VideoEditorFunc get_edit index = ($ve_current_edit_index)
	return new_edit = {
		<edit>
		clips = ($ve_current_edit_clips)
		effects = ($ve_current_edit_effects)
		overlays = ($ve_current_edit_overlays)
		audio = ($ve_current_edit_audio)
		markers = ($ve_current_edit_markers)
	}
endscript

script video_editor_needs_to_commit 
	if ($ve_current_edit_index = -1)
		return \{false}
	endif
	VideoEditorFunc get_edit index = ($ve_current_edit_index)
	video_editor_get_edit_to_commit
	if NOT comparestructs struct1 = <edit> struct2 = <new_edit>
		return \{true}
	endif
	return \{false}
endscript

script video_editor_grab_from_profile 
	if NOT gotparam index
		index = ($ve_current_edit_index)
	endif
	VideoEditorFunc get_edit index = <index>
	change ve_current_edit_struct = <edit>
	ve_validate_clips clips = (<edit>.clips)
	change ve_current_edit_clips = <clips>
	change ve_current_edit_effects = (<edit>.effects)
	change ve_current_edit_overlays = (<edit>.overlays)
	change ve_current_edit_audio = (<edit>.audio)
	if structurecontains structure = <edit> markers
		change ve_current_edit_markers = (<edit>.markers)
	endif
	ui_video_editor_check_shortened_clips
endscript

script ui_video_editor_has_required_pakman_map \{action = ui_change_state
		action_params = {
			state = UIstate_video_editor_Edit_View
		}}
	if ve_get_clips_area clips = ($ve_current_edit_clips)
		ve_get_zone_list_for_clips clips = ($ve_current_edit_clips)
		if NOT ve_pick_correct_pakman_map record_last save_edit = <save_edit> area = <area> action = <action> action_params = <action_params> no_waits
			return \{false}
		endif
	endif
	return \{true}
endscript

script ui_video_editor_load_required_zones 
	if ve_get_clips_area clips = ($ve_current_edit_clips)
		ve_get_zone_list_for_clips clips = ($ve_current_edit_clips)
		ve_check_playback_area area = <area> zones = <zones> extra_zones = <extra_zones>
	endif
	return \{true}
endscript

script ui_create_video_editor_edit_view 
	printf "UI: ui_create_video_editor_edit_view"
	stoprendering
	Destroy_MenuFx
	ve_set_memory_state state = playback
	if IsPakManStreamingEnabled
		scriptassert 'Eh? Streaming needs to be off for video editing!'
	endif
	generic_ui_destroy
	killskatercamanim all
	video_editor_grab_from_profile
	if ($video_editor_clip_user_camera = 1)
		video_editor_modify_selected_clip clip_camera = ($ve_camera_types [$video_editor_pane_selection])
		change video_editor_clip_user_camera = 0
	endif
	spawnscriptnow ve_push_editing_buss
	ui_destroy_video_editor_background
	ve_backup_node_flags
	spawnscriptnow ui_create_video_editor_edit_view_spawned
endscript

script ui_create_video_editor_edit_view_spawned 
	onexitrun \{ui_create_video_editor_edit_view_exit}
	if ui_video_editor_has_required_pakman_map
		ve_create_hide_lod_ui
		if ui_check_clips_loaded clips = ($ve_current_edit_clips)
			if gotparam \{clips_deleted}
				video_editor_grab_from_profile
			endif
			ve_destroy_hide_lod_ui \{delayed}
			ui_create_video_editor_edit_view_spawned_part_two
		else
			ve_destroy_hide_lod_ui \{delayed}
			ui_change_state \{state = UIstate_video_editor_Main}
		endif
	endif
endscript

script ui_create_video_editor_edit_view_spawned_part_two 
	onexitrun ui_create_video_editor_edit_view_exit
	if ui_video_editor_load_required_zones
		do_actual_pause <...>
		if istrue $signin_change_happening
			printf 'ending edit_view due to signin change'
			ve_wake_paused_scripts
			return
		endif
		if ($video_editor_focus_reset = 1)
			change video_cursor_row = 0
			change video_cursor_column = 0
			change video_editor_sel_mode = select
			change video_editor_trim_step = none
			change video_editor_current_selection = 0
			change video_timeline_cursor = 0
		endif
		change video_editor_update_bars = -1
		change video_previous_time = -1.0
		video_editor_set_jog_time_lock
		ui_create_video_editor_gfx
		video_editor_ensure_selected_on_screen
		runscriptonscreenelement id = Video_Editor_Workspace_Container ve_viewport_create params = {parent = Video_Editor_Workspace_Container}
		ve_create_preview_objects viewport = video_editor_viewport
		ui_video_editor_new_first_clip
		spawnscriptlater ui_video_editor_analog_stick_watcher
		spawnscriptnow ve_preview_seek params = {
			clips = ($ve_current_edit_clips)
			preview_time = $video_timeline_cursor
			viewport = video_editor_viewport
		}
		change video_editor_fs_playback = 0
		ve_wake_paused_scripts
		wait_for_script_to_finish name = ve_update_preview_viewport
		wait_for_script_to_finish name = ve_preview_seek
	endif
	ui_create_video_editor_edit_view_exit
endscript

script ui_create_video_editor_edit_view_exit 
	printf \{'ui_create_video_editor_edit_view_exit'}
	startrendering
	ve_destroy_hide_lod_ui
	ve_remove_blackout
endscript

script ui_destroy_video_editor_edit_view 
	printf "UI: ui_destroy_video_editor_edit_view"
	ve_destroy_preview_objects fs_playback = ($video_editor_fs_playback)
	killspawnedscript name = ui_video_editor_analog_stick_watcher
	ve_viewport_destroy
	if screenelementexists id = Video_Editor_Container
		destroyscreenelement id = Video_Editor_Container
	endif
	if ($ve_current_edit_index >= 0)
		if ($video_delete_edit = 1)
			change video_delete_edit = 0
		else
			if ($is_changing_levels = 0)
				video_editor_commit_to_profile
			endif
		endif
	endif
	ve_kill_preview_scripts
	if ($video_editor_fs_playback = 0)
		pausegame
		ve_wake_paused_scripts
	endif
	generic_ui_destroy
	spawnscriptnow ve_stop_music_track
	if screenelementexists id = ve_warning_msg
		destroyscreenelement id = ve_warning_msg
	endif
endscript

script ui_play_preview start_time = 0.0
	if ve_is_playing
		return
	endif
	ve_get_clips_entire_length clips = $ve_current_edit_clips
	if ((<start_time> + 0.005) >= <entire_length>)
		ui_video_editor_warning text = "Your cursor is at the end of your edit, there is nothing to preview."
		printstruct <...>
		return
	endif
	if screenelementexists id = Video_Editor_Helper_Text
		setscreenelementprops {
			id = Video_Editor_Helper_Text
			text = "\\m5\\_marker    \\m0\\_pause\\_preview"
		}
	endif
	unpausegame
	killspawnedscript name = ui_video_editor_analog_stick_watcher
	setscreenelementprops id = Video_Editor_Container block_events
	spawncmd = spawnscriptnow
	if gotparam spawnlater
		spawncmd = spawnscriptlater
	endif
	ve_pop_editing_buss
	<spawncmd> ve_play_clips params = {
		keep_skater_hidden
		clips = ($ve_current_edit_clips)
		effects = ($ve_current_edit_effects)
		overlays = ($ve_current_edit_overlays)
		audio = ($ve_current_edit_audio)
		start_time = <start_time>
		viewport = video_editor_viewport
		timeline_callback = video_editor_update_time_bar
		no_loading
		cas_pros_only
		allow_marker_placing
	}
	block type = video_done_playing
	ve_push_editing_buss
	setscreenelementprops id = Video_Editor_Container unblock_events
	pausegame
	ve_wake_paused_scripts
	killspawnedscript name = ui_video_editor_analog_stick_watcher
	spawnscriptlater ui_video_editor_analog_stick_watcher
	if ($video_editor_focus = menu)
		if screenelementexists id = Video_Editor_Helper_Text
			setscreenelementprops {
				id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_zoom    \\m0\\_select    \\m5\\_marker    \\bh\\_play    \\m8\\_preview    \\m1\\_exit"
			}
		endif
	else
		if screenelementexists id = Video_Editor_Helper_Text
			setscreenelementprops {
				id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_zoom    \\m0\\_select    \\m5\\_marker    \\bh\\_play    \\m8\\_preview    \\m1\\_back"
			}
		endif
	endif
endscript

script ui_add_black_background 
	createscreenelement {
		type = spriteelement
		texture = black
		just = [center center]
		pos = (0.0, 0.0)
		dims = (5000.0, 5000.0)
		parent = <parent>
		z_priority = -1
	}
endscript

script ui_ve_highlight_loop 
	gettags
	setspawninstancelimits max = 1 management = kill_oldest
	if video_editor_clip_selected
		if screenelementexists id = Video_Editor_Timeline_Container_Vid
			getscreenelementposition id = Video_Editor_Timeline_Container_Vid absolute
			if NOT ($video_editor_trim_step = none)
				rgba = [180 140 60 255]
			elseif ($video_editor_sel_mode = drag)
				rgba = [180 140 60 255]
			else
				rgba = [180 100 10 255]
			endif
		endif
	elseif video_editor_effect_selected
		if screenelementexists id = Video_Editor_Timeline_Container_Eff
			getscreenelementposition id = Video_Editor_Timeline_Container_Eff absolute
			if ($video_editor_sel_mode = drag)
				rgba = [40 220 100 255]
			else
				rgba = [90 150 30 255]
			endif
		endif
	elseif video_editor_overlay_selected
		if screenelementexists id = Video_Editor_Timeline_Container_Over
			getscreenelementposition id = Video_Editor_Timeline_Container_Over absolute
			if ($video_editor_sel_mode = drag)
				rgba = [100 40 220 255]
			else
				rgba = [30 90 100 255]
			endif
		endif
	endif
	if screenelementexists id = video_editor_highlight_background
		destroyscreenelement id = video_editor_highlight_background
	endif
	createscreenelement {
		type = spriteelement
		parent = <id>
		id = video_editor_highlight_background
		blend = add
		texture = white
		just = [left top]
		dims = <bar_dims>
		rgba = <rgba>
		pos = (0.0, 0.0)
		alpha = 0.5
		z_priority = 4.5
	}
	<highlight_background> = <id>
	alpha = 0.75
	begin
	doscreenelementmorph {
		id = <highlight_background>
		alpha = <alpha>
		time = 0.5
	}
	if (<alpha> > 0.7)
		<alpha> = 0.1
	else
		<alpha> = 1.0
	endif
	wait 10 gameframes
	repeat
endscript

script video_editor_update_current 
	change video_editor_current = {pos = <local_pos> width = <width> height = <height>}
endscript

script ui_create_video_editor_gfx 
	if NOT ve_is_playing
		ve_push_editing_buss
	endif
	if NOT screenelementexists id = Video_Editor_Container
		if ($video_editor_focus_reset = 1)
			change video_editor_focus = menu
			change video_editor_current_selection = 0
			change video_editor_pane_selection = -1
			change video_editor_update_bars = -1
			ui_video_editor_zoom reset
			ui_video_editor_pick_good_zoom
		endif
		createscreenelement {
			id = Video_Editor_Container
			parent = root_window
			type = containerelement
			pos = (0.0, 0.0)
			event_handlers = $video_editor_event_handlers
		}
		assignalias id = Video_Editor_Container alias = current_menu_anchor
		launchevent type = focus target = Video_Editor_Container
		ui_add_black_background parent = Video_Editor_Container
		createscreenelement {
			type = textblockelement
			text = "\\bl\\_jog    \\bm\\_zoom    \\m0\\_select    \\m5\\_marker    \\bh\\_play    \\m8\\_preview    \\m1\\_exit"
			id = Video_Editor_Helper_Text
			font = text_a1
			parent = Video_Editor_Container
			just = [center top]
			pos = (640.0, 625.0)
			scale = (0.65000004, 0.55)
			dims = (1700.0, 0.0)
			allow_expansion
			rgba = [200 200 200 255]
			z_priority = 10
		}
		createscreenelement {
			type = textblockelement
			text = ""
			font = text_a1
			id = ve_warning_text
			parent = Video_Editor_Container
			just = [center top]
			pos = (640.0, 100.0)
			dims = (1200.0, 0.0)
			allow_expansion
			internal_anchor = [center center]
			scale = (0.75, 0.65000004)
			rgba = [200 0 0 255]
			z_priority = 10
		}
		createscreenelement {
			type = textelement
			text = ""
			font = text_a1
			id = ve_debug_score_text
			parent = Video_Editor_Container
			just = [left center]
			pos = (100.0, 80.0)
			scale = (0.65000004, 0.55)
			rgba = [64 64 192 255]
			z_priority = 100
		}
	endif
	ve_wake_paused_scripts
	ui_create_video_editor_gfx_workspace
	ui_create_video_editor_gfx_menu
	if NOT gotparam timeline_update_only
		video_editor_create_panes
		video_editor_update_panes dont_stop_music = <dont_stop_music>
		video_editor_update_properties
	endif
	if NOT ($video_timestart = $video_previous_time)
		change video_previous_time = $video_timestart
		getscreenelementdims id = Video_Editor_Timeline_Container_Time
		<pixelstart> = ($video_timestart * $video_second_width)
		casttointeger pixelstart
		if (<pixelstart> = 0)
			<i> = 0
		else
			mod a = <pixelstart> b = $video_second_width
			<i> = (<pixelstart> - <mod>)
		endif
		<start> = <i>
		begin
		mod a = <i> b = ($video_second_width)
		<testSecond> = <mod>
		mod a = <i> b = ($video_second_width * $video_time_label_inc)
		<testLabel> = <mod>
		mod a = <i> b = ($video_second_width / 4)
		<testQuarter> = <mod>
		if (<testLabel> = 0)
			createscreenelement {
				type = spriteelement
				parent = Video_Editor_Timeline_Container_Time
				texture = white
				dims = (2.0, 120.0)
				just = [center top]
				z_priority = 10
				pos = ((1.0, 0.0) * <i>)
				rgba = [140 140 140 255]
			}
			<currtime> = (<i> / $video_second_width)
			if (<currtime> < ($video_timestart + ($video_timeline_width / $video_second_width) + 0.1))
				if (<currtime> > ($video_timestart - 0.1))
					formattext textname = times "%a:00" a = (<i> / $video_second_width)
					createscreenelement {
						type = textelement
						parent = Video_Editor_Timeline_Container_Time
						font = text_a1
						text = <times>
						just = [center bottom]
						scale = (0.65000004, 0.45000002)
						font_spacing = 2
						rgba = [140 140 140 255]
						pos = (((1.0, 0.0) * <i>) + (0.0, 5.0))
					}
				endif
			endif
		elseif (<testSecond> = 0)
			createscreenelement {
				type = spriteelement
				parent = Video_Editor_Timeline_Container_Time
				texture = white
				dims = ((4.2, 0.0) + ((0.0, 1.0) * <height>))
				just = [center top]
				z_priority = 2
				pos = ((1.0, 0.0) * <i>)
				rgba = [150 150 150 255]
			}
		elseif (<testQuarter> = 0)
			createscreenelement {
				type = spriteelement
				parent = Video_Editor_Timeline_Container_Time
				texture = white
				dims = ((5.0, 0.0) + ((0.0, 1.0) * <height>))
				just = [center top]
				z_priority = 1
				pos = ((1.0, 0.0) * <i>)
				rgba = [60 60 60 255]
			}
			createscreenelement {
				type = spriteelement
				parent = Video_Editor_Timeline_Container_Time
				texture = white
				dims = (900.0, 16.0)
				just = [center top]
				z_priority = 0
				pos = ((1.0, 0.0) * <i>)
				rgba = [0 0 0 255]
			}
		endif
		if ($video_editor_zoom = 0)
			<i> = (<i> + ($video_second_width / 4))
		elseif ($video_editor_zoom = 1)
			<i> = (<i> + $video_second_width)
		else
			<i> = (<i> + ($video_second_width * 5))
		endif
		if ((<i>) > ($video_timeline_width + <start> + $video_second_width))
			break
		endif
		repeat
	endif
	if ($video_editor_update_bars = -1)
		change video_editor_update_bars = 0
		getarraysize $ve_current_edit_clips
		last_time = 0.0
		i = 0
		if (<array_size> > 0)
			begin
			edit_clip = ($ve_current_edit_clips [<i>])
			if VideoEditorFunc get_clip name = (<edit_clip>.name)
				ve_get_edit_clip_length edit_clip = <edit_clip>
				hilite = (($video_cursor_row = 0) && ($video_cursor_column = <i>))
				color = [70 0 0 255]
				formattext textname = bartext "%s" s = (<clip>.text)
				formattext textname = bartext2 "cam=%c speed=%s" c = ($ve_camera_names.(<edit_clip>.clip_camera)) s = (<edit_clip>.clip_speed)
				video_editor_new_bar {
					<...>
					time = <last_time>
					len = <length>
					row = 0
					row_container = Video_Editor_Timeline_Container_Vid
					text = <bartext>
					text2 = <bartext2>
					color = <color>
				}
				last_time = (<last_time> + <length>)
			else
				scriptassert 'Edit has a clip that doesnt exist anymore'
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		removeparameter edit_clip
		getarraysize $ve_current_edit_effects
		num_effects = <array_size>
		last_time = 0.0
		i = 0
		if (<num_effects> > 0)
			begin
			effect = (($ve_current_edit_effects) [<i>])
			hilite = (($video_cursor_row = 1) && ($video_cursor_column = <i>))
			ve_get_effect_text effect = <effect> noProps
			video_editor_new_bar {
				<...>
				time = <last_time>
				len = (<effect>.length)
				row = 1
				row_container = Video_Editor_Timeline_Container_Eff
				text = <effect_text>
				color = [0 50 40 255]
			}
			last_time = (<last_time> + (<effect>.length))
			i = (<i> + 1)
			repeat <num_effects>
		endif
		getarraysize $ve_current_edit_overlays
		num_overlays = <array_size>
		last_time = 0.0
		i = 0
		if (<num_overlays> > 0)
			begin
			overlay = (($ve_current_edit_overlays) [<i>])
			bink_details = (($video_editor_bink_details).(<overlay>.name))
			hilite = (($video_cursor_row = 2) && ($video_cursor_column = <i>))
			video_editor_new_bar {
				<...>
				time = <last_time>
				len = (<overlay>.length)
				row = 2
				row_container = Video_Editor_Timeline_Container_Over
				text = (<bink_details>.text)
				color = [0 0 60 255]
			}
			last_time = (<last_time> + (<overlay>.length))
			i = (<i> + 1)
			repeat <num_overlays>
		endif
	endif
	ui_video_editor_draw_debug_beat_lines
	if screenelementexists id = Video_Editor_Marker_Container
		destroyscreenelement id = Video_Editor_Marker_Container
	endif
	createscreenelement {
		type = containerelement
		id = Video_Editor_Marker_Container
		parent = Video_Editor_Timeline_Container_Vid
	}
	ui_video_editor_draw_markers {
		markers = ($ve_current_edit_markers)
		parent = Video_Editor_Marker_Container
	}
	if screenelementexists id = ve_time_marker
		destroyscreenelement id = ve_time_marker
	endif
	video_editor_get_time_xpos time = ($video_timeline_cursor)
	t_pos = ((1.0, 0.0) * <xpos>)
	createscreenelement {
		type = containerelement
		id = ve_time_marker
		parent = Video_Editor_Timeline_Container
		pos = <t_pos>
		just = [center top]
	}
	createscreenelement {
		type = spriteelement
		texture = white2
		rgba = [180 140 60 255]
		alpha = 1
		just = [center top]
		dims = (4.0, 120.0)
		pos = (0.0, 0.0)
		parent = ve_time_marker
		z_priority = 14.9
	}
	createscreenelement {
		type = spriteelement
		texture = vided_time_slider
		rgba = [200 160 80 255]
		alpha = 1
		just = [center bottom]
		dims = (24.0, 24.0)
		pos = (0.0, 20.0)
		parent = ve_time_marker
		z_priority = 16
	}
	if screenelementexists id = Video_Editor_Trim1
		destroyscreenelement id = Video_Editor_Trim1
		destroyscreenelement id = Video_Editor_Trim2
	endif
	if NOT ($video_editor_trim_trailing = 0.0)
		if ($video_cursor_row = 0)
			<row_container> = Video_Editor_Timeline_Container_Vid
		elseif ($video_cursor_row = 1)
			<row_container> = Video_Editor_Timeline_Container_Eff
		else
			<row_container> = Video_Editor_Timeline_Container_Over
		endif
		getscreenelementdims id = <row_container>
		row_height = <height>
		video_editor_get_time_xpos time = ($video_editor_trim_leading)
		t_pos = ((1.0, 0.0) * <xpos>)
		createscreenelement {
			type = spriteelement
			parent = <row_container>
			id = Video_Editor_Trim1
			pos = <t_pos>
			dims = ((5.0, 0.0) + ((0.0, 1.0) * <height>))
			rgba = [200 200 200 255]
			z_priority = 14.95
			just = [center top]
		}
		video_editor_get_time_xpos time = ($video_editor_trim_trailing)
		t_pos = ((1.0, 0.0) * <xpos>)
		createscreenelement {
			type = spriteelement
			parent = <row_container>
			id = Video_Editor_Trim2
			pos = <t_pos>
			dims = ((5.0, 0.0) + ((0.0, 1.0) * <height>))
			rgba = [200 200 200 255]
			z_priority = 14.95
			just = [center top]
		}
	endif
	ve_wake_paused_scripts
	change video_editor_focus_reset = 0
	if ($video_editor_edit_from_camera = 1)
		change video_editor_edit_from_camera = 0
		video_editor_ensure_selected_on_screen
		video_editor_ensure_time_cursor_on_screen
		ui_create_video_editor_gfx
	endif
endscript

script video_editor_get_time_xpos 
	xpos = (<time> * $video_second_width)
	return xpos = <xpos>
endscript

script video_editor_update_time_bar 
	create_gfx_args = {}
	if ((gotparam timeline_callback) || (gotparam analog_stick_move))
		create_gfx_args = {timeline_update_only}
	endif
	if screenelementexists id = ve_time_marker
		if screenelementexists id = Video_Editor_Haze
			destroyscreenelement id = Video_Editor_Haze
		endif
		<haze> = {}
		if (Random (@ 0 @ 1 )= 0)
			<haze> = {<haze> flip_h}
		endif
		if (Random (@ 0 @ 1 )= 1)
			<haze> = {<haze> flip_v}
		endif
		<alpha> = RandomRange (0.4, 0.5)
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			id = Video_Editor_Haze
			texture = HUD_viewport_haze
			just = [right bottom]
			rgba = [40 30 5 255]
			pos = {(1.0, 1.0) proportional}
			dims = (450.0, 250.0)
			z_priority = 5
			<haze>
			alpha = <alpha>
		}
		video_editor_get_time_xpos time = <time>
		t_pos = ((1.0, 0.0) * <xpos>)
		setscreenelementprops id = ve_time_marker pos = <t_pos>
		change video_timeline_cursor = <time>
		if video_editor_ensure_time_cursor_on_screen
			killspawnedscript name = ui_create_video_editor_gfx
			spawnscriptnow ui_create_video_editor_gfx params = {<create_gfx_args>}
		endif
		if ($video_editor_trim_step = none)
			if ($video_cursor_row = 0)
				getarraysize $ve_current_edit_clips
				if (<array_size> = 0)
					return
				endif
				<i> = 0
				begin
				ve_get_extents clips = $ve_current_edit_clips index = <i>
				if ((<time> > (<start_extent> - 0.001)) && (<time> < <end_extent>))
					if NOT ($video_cursor_column = <i>)
						change video_cursor_column = <i>
						change video_editor_update_bars = -1
						ui_create_video_editor_gfx <create_gfx_args>
					endif
					return
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			elseif ($video_cursor_row = 1)
				if NOT ($video_editor_trim_step = none)
					return
				endif
				getarraysize $ve_current_edit_effects
				if (<array_size> = 0)
					return
				endif
				<i> = 0
				begin
				ve_get_extents effects = ($ve_current_edit_effects) index = <i>
				if ((<time> > (<start_extent> - 0.001)) && (<time> < <end_extent>))
					if NOT ($video_cursor_column = <i>)
						change video_cursor_column = <i>
						change video_editor_update_bars = -1
						ui_create_video_editor_gfx <create_gfx_args>
					endif
					return
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			else
				getarraysize $ve_current_edit_overlays
				if (<array_size> = 0)
					return
				endif
				<i> = 0
				begin
				ve_get_extents overlays = ($ve_current_edit_overlays) index = <i>
				if ((<time> > (<start_extent> - 0.001)) && (<time> < <end_extent>))
					if NOT ($video_cursor_column = <i>)
						change video_cursor_column = <i>
						change video_editor_update_bars = -1
						ui_create_video_editor_gfx <create_gfx_args>
					endif
					return
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	else
		change video_timeline_cursor = <time>
	endif
endscript

script video_editor_new_bar 
	getscreenelementdims id = <row_container>
	row_height = <height>
	video_editor_get_time_xpos time = <time>
	bar_width = ($video_second_width * <len>)
	bar_pos = ((1.0, 0.0) * <xpos>)
	createscreenelement {
		type = windowelement
		parent = <row_container>
		pos = <bar_pos>
		just = [left top]
		dims = (((1.0, 0.0) * <bar_width>) + ((0.0, 1.0) * <row_height>))
	}
	<container_id> = <id>
	createscreenelement {
		type = spriteelement
		texture = white
		rgba = <color>
		just = [left top]
		dims = (((1.0, 0.0) * <bar_width>) + ((0.0, 1.0) * <row_height>))
		pos = (0.0, 0.0)
		parent = <container_id>
		z_priority = 4
	}
	if (<hilite> = 1)
		if NOT ($video_editor_trim_trailing = 0.0)
			<startx> = <xpos>
			video_editor_get_time_xpos time = ($video_editor_trim_leading)
			<leadx> = <xpos>
			<leadwidth> = (<leadx> - <startx>)
			createscreenelement {
				type = spriteelement
				texture = black
				just = [left top]
				dims = (((1.0, 0.0) * <leadwidth>) + ((0.0, 1.0) * <row_height>))
				pos = (0.0, 0.0)
				parent = <container_id>
				z_priority = 4.1
			}
			video_editor_get_time_xpos time = ($video_editor_trim_trailing)
			<trailx> = (<xpos> - <startx>)
			<trailwidth> = (<bar_width> - <trailx>)
			createscreenelement {
				type = spriteelement
				texture = black
				just = [left top]
				dims = (((1.0, 0.0) * <trailwidth>) + ((0.0, 1.0) * <row_height>))
				pos = ((1.0, 0.0) * <trailx>)
				parent = <container_id>
				z_priority = 4.1
			}
		endif
	endif
	createscreenelement {
		type = spriteelement
		texture = white
		just = [right top]
		dims = ((1.0, 0.0) + ((0.0, 1.0) * <row_height>))
		pos = (<bar_pos> + ((1.0, 0.0) * <bar_width>))
		parent = <row_container>
		z_priority = 5
	}
	grunge_width = 0
	count = 0
	<flip> = {}
	begin
	<bar_grunge> = ((1.0, 0.0) * <grunge_width>)
	if (<count> = 1)
		<flip> = {flip_v}
		<count> = 0
	else
		<flip> = {}
		<count> = 1
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = vided_clip_grunge
		pos = <bar_grunge>
		just = [left top]
		blend = add
		rgba = [130 130 130 185]
		dims = ((256.0, 0.0) + ((0.0, 1.0) * <row_height>))
		z_priority = 4.2
		<flip>
	}
	getscreenelementdims id = <id>
	grunge_width = (<grunge_width> + <width>)
	if (<grunge_width> > <bar_width>)
		break
	endif
	repeat
	getlowercasestring <text>
	createscreenelement {
		type = textelement
		parent = <container_id>
		just = [left center]
		text = <lowercasestring>
		rgba = [150 150 150 255]
		font = text_a1
		scale = (0.6, 0.5)
		font_spacing = 2
		pos = ((6.0, 0.0) + ((0.0, 0.55) * <row_height>))
		z_priority = 4.5
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	if gotparam hilite
		if (<hilite>)
			runscriptonscreenelement ui_ve_highlight_loop id = <container_id> params = {bar_dims = (((1.0, 0.0) * <bar_width>) + ((0.0, 1.0) * <row_height>))}
			setscreenelementprops id = <id> rgba = [200 200 200 255] scale = (0.65000004, 0.55) font_spacing = 2
			if gotparam edit_clip
				if ((<edit_clip>.clip_start) > 0.0)
					clip_pos = (((1.0, 0.0) * ((-1.0 * ((1.0 / <edit_clip>.clip_speed)) * (<edit_clip>.clip_start) * $video_second_width) + <xpos>)))
					createscreenelement {
						type = spriteelement
						texture = white2
						rgba = [255 0 255 255]
						alpha = 1
						just = [left top]
						dims = (((2.0, 0.0)) + ((0.0, 1.0) * ((<row_height>))))
						pos = <clip_pos>
						parent = <row_container>
						z_priority = 10
					}
				endif
				ve_get_original_clip_length clip = (<edit_clip>.name)
				orig_length = <length>
				if ((<edit_clip>.clip_end) < <orig_length>)
					ve_get_edit_clip_length edit_clip = <edit_clip>
					clip_pos = ((<orig_length> - (<edit_clip>.clip_end)) * (1.0 / (<edit_clip>.clip_speed)))
					clip_pos = (<clip_pos> + <length>)
					clip_pos = (((1.0, 0.0) * ((<clip_pos> * $video_second_width) + <xpos>)))
					createscreenelement {
						type = spriteelement
						texture = white2
						rgba = [255 0 255 255]
						alpha = 1
						just = [left top]
						dims = (((2.0, 0.0)) + ((0.0, 1.0) * ((<row_height>))))
						pos = <clip_pos>
						parent = <row_container>
						z_priority = 10
					}
				endif
			endif
		endif
	endif
endscript

script video_editor_ensure_selected_on_screen 
	if video_editor_clip_selected
		ve_get_extents \{clips = $ve_current_edit_clips
			index = $video_cursor_column}
	elseif video_editor_effect_selected
		ve_get_extents \{effects = $ve_current_edit_effects
			index = $video_cursor_column}
	elseif video_editor_overlay_selected
		ve_get_extents \{overlays = $ve_current_edit_overlays
			index = $video_cursor_column}
	endif
	if gotparam \{start_extent}
		video_editor_ensure_time_range_on_screen start_time = <start_extent> end_time = <end_extent>
	endif
endscript

script video_editor_ensure_time_range_on_screen 
	<length> = (<end_time> - <start_time>)
	<time_start> = $video_timestart
	time_shown = ($video_timeline_width / $video_second_width)
	shunt_amount = (<time_shown> * 0.1)
	if (<length> > (<time_shown> * 0.8))
		change video_timestart = <start_time>
		return
	endif
	if (<start_time> < $video_timestart)
		change video_timestart = (<start_time> - <shunt_amount>)
	endif
	<video_timeend> = ($video_timestart + <time_shown>)
	if (<end_time> > <video_timeend>)
		amount_over = (<end_time> - <video_timeend>)
		change video_timestart = ($video_timestart + <amount_over> + <shunt_amount>)
	endif
	if ($video_timestart < 0.0)
		change video_timestart = 0.0
	endif
endscript

script video_editor_ensure_time_cursor_on_screen 
	time_shown = ($video_timeline_width / $video_second_width)
	if ($video_editor_zoom = 0)
		time_offset = 2.5
	elseif ($video_editor_zoom = 1)
		time_offset = 5.0
	else
		time_offset = 15.0
		change video_timestart = 0.0
		return true
	endif
	time = ($video_timeline_cursor)
	if (<time> < $video_timestart + <time_offset>)
		if ((<time> - <time_offset>) < 0.0)
			<new_start> = 0.0
		else
			<new_start> = (<time> - <time_offset>)
		endif
	elseif (<time> > ($video_timestart + <time_shown> - <time_offset>))
		<new_start> = (<time> - <time_shown> + <time_offset>)
	endif
	if gotparam new_start
		change video_timestart = <new_start>
		return true
	else
		return false
	endif
endscript

script video_editor_clip_selected 
	getarraysize \{$ve_current_edit_clips}
	if ($video_cursor_row = 0)
		if ($video_cursor_column < <array_size>)
			return true clip = ($ve_current_edit_clips [($video_cursor_column)])
		endif
	endif
	return \{false}
endscript

script video_editor_effect_selected 
	getarraysize \{$ve_current_edit_effects}
	if ($video_cursor_row = 1)
		if ($video_cursor_column < <array_size>)
			return true effect = ($ve_current_edit_effects [($video_cursor_column)])
		endif
	endif
	return \{false}
endscript

script video_editor_overlay_selected 
	getarraysize \{$ve_current_edit_overlays}
	if ($video_cursor_row = 2)
		if ($video_cursor_column < <array_size>)
			return true overlay = ($ve_current_edit_overlays [($video_cursor_column)])
		endif
	endif
	return \{false}
endscript

script video_editor_modify_selected_clip 
	if video_editor_clip_selected
		ve_modify_selected_clip {
			clips = ($ve_current_edit_clips)
			index = ($video_cursor_column)
			<...>
		}
		change ve_current_edit_clips = <clips>
		printstruct \{$ve_current_edit_clips}
	endif
endscript

script video_editor_modify_selected_effect 
	if video_editor_effect_selected
		ve_modify_selected_effect {
			effects = ($ve_current_edit_effects)
			index = ($video_cursor_column)
			<...>
		}
		change ve_current_edit_effects = <effects>
	endif
endscript

script video_editor_modify_selected_overlay 
	if video_editor_overlay_selected
		ve_modify_selected_overlay {
			overlays = ($ve_current_edit_overlays)
			index = ($video_cursor_column)
			<...>
		}
		change ve_current_edit_overlays = <overlays>
	endif
endscript

script video_editor_left 
	printf 'video_editor_left'
	getanalogueinfo
	if (($video_editor_focus = timeline) || ($video_editor_focus = pane))
		if (video_cursor_row = -1)
			getarraysize $ve_current_edit_clips
			if (<array_size> = 0)
				ui_video_editor_warning text = "Changing the music start time is not available until a clip is inserted."
			else
				<leftx> = (<leftx> * 10)
				casttointeger leftx
				if (<leftx> >= -5)
					<leftx> = -1
				elseif (<leftx> > -10)
					<leftx> = -5
				endif
				ui_video_editor_set_audio_start inc = (<leftx>)
				video_editor_update_properties
			endif
		endif
		if ($video_cursor_row < 0)
			return
		endif
		if NOT ($video_editor_trim_step = none)
			return
		endif
		if ($video_cursor_column > 0)
			if ($video_editor_sel_mode = drag)
				if ($video_cursor_row = 0)
					new_clips = ($ve_current_edit_clips)
					ve_array_swap_elements {
						array = <new_clips>
						index1 = ($video_cursor_column)
						index2 = (($video_cursor_column) -1)
					}
					change ve_current_edit_clips = <swapped_array>
					ui_video_editor_pick_good_zoom clip = (<new_clips> [($video_cursor_column)])
					ui_video_editor_pick_good_zoom clip = (<new_clips> [(($video_cursor_column) -1)])
					if (($video_cursor_column) = 1)
						ui_video_editor_new_first_clip no_zoom_change
					endif
				elseif ($video_cursor_row = 1)
					new_effects = ($ve_current_edit_effects)
					ve_array_swap_elements {
						array = <new_effects>
						index1 = ($video_cursor_column)
						index2 = (($video_cursor_column) -1)
					}
					change ve_current_edit_effects = <swapped_array>
				elseif ($video_cursor_row = 2)
					new_overlays = ($ve_current_edit_overlays)
					ve_array_swap_elements {
						array = <new_overlays>
						index1 = ($video_cursor_column)
						index2 = (($video_cursor_column) -1)
					}
					change ve_current_edit_overlays = <swapped_array>
				else
				endif
			endif
			change video_cursor_column = ($video_cursor_column - 1)
			video_editor_ensure_selected_on_screen
			video_editor_update_timeline_to_selected
			change video_editor_update_bars = -1
			soundevent event = VE_category_toggle
		endif
	elseif ($video_editor_focus = menu)
		if ($video_editor_sel_mode = select)
			<index> = ($video_editor_current_selection - 1)
		else
			return
		endif
		if (<index> < 0)
			getarraysize $video_editor_menu_array
			<index> = (<array_size> - 1)
		endif
		change video_editor_update_bars = -1
		video_editor_set_icon_selection index = <index>
		soundevent event = VE_category_toggle
	else
	endif
	video_editor_update_properties
	ui_create_video_editor_gfx
endscript

script video_editor_get_row_array_size 
	if ($video_cursor_row = 0)
		getarraysize \{$ve_current_edit_clips}
	elseif ($video_cursor_row = 1)
		getarraysize \{$ve_current_edit_effects}
	elseif ($video_cursor_row = 2)
		getarraysize \{$ve_current_edit_overlays}
	endif
	return array_size = <array_size>
endscript

script video_editor_right 
	printf 'video_editor_right'
	getanalogueinfo
	if (($video_editor_focus = timeline) || ($video_editor_focus = pane))
		if (video_cursor_row = -1)
			getarraysize $ve_current_edit_clips
			if (<array_size> = 0)
				ui_video_editor_warning text = "Changing the music start time is not available until a clip is inserted."
			else
				<leftx> = (<leftx> * 10)
				casttointeger leftx
				if (<leftx> <= 5)
					<leftx> = 1
				elseif (<leftx> < 10)
					<leftx> = 5
				endif
				ui_video_editor_set_audio_start inc = (<leftx>)
				video_editor_update_properties
			endif
		endif
		if ($video_cursor_row < 0)
			return
		endif
		if NOT ($video_editor_trim_step = none)
			return
		endif
		video_editor_get_row_array_size
		if ($video_cursor_column < (<array_size> - 1))
			if ($video_editor_sel_mode = drag)
				if ($video_cursor_row = 0)
					new_clips = ($ve_current_edit_clips)
					ve_array_swap_elements {
						array = <new_clips>
						index1 = ($video_cursor_column)
						index2 = (($video_cursor_column) + 1)
					}
					change ve_current_edit_clips = <swapped_array>
					ui_video_editor_pick_good_zoom clip = (<new_clips> [($video_cursor_column)])
					ui_video_editor_pick_good_zoom clip = (<new_clips> [(($video_cursor_column) + 1)])
					if (($video_cursor_column) = 0)
						ui_video_editor_new_first_clip no_zoom_change
					endif
				elseif ($video_cursor_row = 1)
					new_effects = ($ve_current_edit_effects)
					ve_array_swap_elements {
						array = <new_effects>
						index1 = ($video_cursor_column)
						index2 = (($video_cursor_column) + 1)
					}
					change ve_current_edit_effects = <swapped_array>
				elseif ($video_cursor_row = 2)
					new_overlays = ($ve_current_edit_overlays)
					ve_array_swap_elements {
						array = <new_overlays>
						index1 = ($video_cursor_column)
						index2 = (($video_cursor_column) + 1)
					}
					change ve_current_edit_overlays = <swapped_array>
				endif
			endif
			change video_cursor_column = ($video_cursor_column + 1)
			if ($video_cursor_column = <array_size>)
				change video_cursor_column = ($video_cursor_column - 1)
			endif
			video_editor_ensure_selected_on_screen
			video_editor_update_timeline_to_selected
			change video_editor_update_bars = -1
			soundevent event = VE_category_toggle
		endif
	elseif ($video_editor_focus = menu)
		if ($video_editor_sel_mode = select)
			<index> = ($video_editor_current_selection + 1)
		else
			return
		endif
		getarraysize $video_editor_menu_array
		if (<index> = <array_size>)
			<index> = 0
		endif
		change video_editor_update_bars = -1
		video_editor_set_icon_selection index = <index>
		soundevent event = VE_category_toggle
	else
	endif
	video_editor_update_properties
	ui_create_video_editor_gfx
endscript

script video_editor_set_icon_selection 
	change video_editor_current_selection = <index>
	switch <index>
		case 0
		change video_cursor_row = 0
		case 1
		change video_cursor_row = 1
		case 2
		change video_cursor_row = 2
		case 3
		change video_cursor_row = -1
		case 4
		change video_cursor_row = -2
		case 5
		change video_cursor_row = -3
	endswitch
	change video_cursor_column = 0
	video_editor_update_panes
	video_editor_update_timeline_to_selected
	video_editor_ensure_selected_on_screen
	ui_create_video_editor_gfx
	soundevent event = VE_category_toggle
endscript

script video_editor_up 
	if ($video_editor_focus = pane)
		addparams ($video_editor_menu_array [$video_editor_current_selection])
		if gotparam \{menu}
			video_editor_update_panes \{up}
		endif
	endif
endscript

script video_editor_down 
	if ($video_editor_focus = pane)
		addparams ($video_editor_menu_array [$video_editor_current_selection])
		if gotparam \{menu}
			video_editor_update_panes \{down}
		endif
	endif
endscript

script video_editor_l1 
	printf 'video_editor_l1'
	if NOT ($video_editor_trim_step = none)
		if NOT ($video_timeline_cursor > ($video_editor_trim_trailing - ($video_editor_minimum_clip_length)))
			change video_editor_trim_leading = $video_timeline_cursor
			change video_editor_update_bars = -1
			ui_create_video_editor_gfx
			soundevent event = VE_edit_cut
		else
			ui_video_editor_warning text = "The new start point cannot be greater than 0.25 seconds before the end point."
		endif
	endif
endscript

script video_editor_r1 
	printf 'video_editor_r1'
	if NOT ($video_editor_trim_step = none)
		if NOT ($video_timeline_cursor < ($video_editor_trim_leading + ($video_editor_minimum_clip_length)))
			change video_editor_trim_trailing = $video_timeline_cursor
			change video_editor_update_bars = -1
			ui_create_video_editor_gfx
			soundevent event = VE_edit_grow
		else
			ui_video_editor_warning text = "The new end point cannot be less than 0.25 seconds after the start point."
		endif
	endif
endscript

script video_editor_r3 
	printf \{'video_editor_r3'}
	ui_video_editor_zoom
endscript

script video_editor_x 
	printf 'video_editor_x'
	setscreenelementprops id = ve_warning_text text = ""
	soundevent event = VE_select
	printf "$video_editor_focus=%a" a = $video_editor_focus
	if ($video_editor_focus = pane)
		if (video_editor_select_pane)
			ui_create_video_editor_gfx dont_stop_music = 1
			return
		endif
	elseif ($video_editor_focus = timeline)
		if NOT ($video_editor_trim_step = none)
			video_editor_trim_clip_button_press
			ui_create_video_editor_gfx
		endif
	else
		getarraysize $video_editor_menu_array
		doscreenelementmorph {
			id = Video_Editor_Top_Container
			pos = (640.0, -45.0)
			scale = 0.95
			time = 0.25
		}
		change video_editor_focus = pane
		change video_editor_pane_selection = 0
		video_editor_update_panes
		if screenelementexists id = Video_Editor_Helper_Text
			setscreenelementprops {
				id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_zoom    \\m0\\_select    \\m5\\_marker    \\bh\\_play    \\m8 preview    \\m1\\_back"
			}
		endif
		ui_create_video_editor_gfx_menu
	endif
endscript

script video_editor_back 
	printf 'video_editor_back'
	setscreenelementprops id = ve_warning_text text = ""
	soundevent event = VE_deselect
	if ($video_editor_focus = menu)
		if video_editor_needs_to_commit
			create_dialog_box {
				title = "Exit Video Editor?"
				text = "The current edit will be automatically saved."
				buttons = [
					{text = "no" pad_choose_script = kill_helper_text pad_choose_params = {}}
					{text = "yes" pad_choose_script = ui_video_editor_confirm_quit pad_choose_params = {}}
				]
				vmenu_width = 500
				text_dims = (600.0, 0.0)
			}
		else
			ui_video_editor_confirm_quit
		endif
	elseif ($video_editor_focus = pane)
		change video_editor_current_top = 0
		change video_editor_current_bottom = 5
		if NOT ($video_editor_other_selected = -1)
			change video_editor_other_selected = -1
			change video_editor_pane_selection = 0
			if ($video_editor_combine_fx_flag = 1)
				change video_editor_combine_fx_flag = 0
			endif
			video_editor_update_panes
			return
		endif
		if screenelementexists id = Video_Editor_Helper_Text
			setscreenelementprops {
				id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_zoom    \\m0\\_select    \\m5\\_marker    \\bh\\_play    \\m8\\_preview    \\m1\\_exit"
			}
		endif
		doscreenelementmorph {
			id = Video_Editor_Top_Container
			pos = (640.0, 0.0)
			scale = 1.0
			time = 0.25
		}
		change video_editor_focus = menu
		change video_editor_pane_selection = -1
		video_editor_update_panes
		ui_create_video_editor_gfx_menu
	else
		if NOT ($video_editor_trim_step = none)
			video_editor_cancel_trim
			change video_editor_update_bars = -1
		endif
		if ($video_editor_sel_mode = drag)
			change video_editor_update_bars = -1
		endif
		if screenelementexists id = Video_Editor_Helper_Text
			setscreenelementprops {
				id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_toggle zoom    \\m0\\_select    \\bh\\_play\\_fullscreen    \\m8\\_preview    \\m1\\_back"
			}
		endif
		change video_editor_sel_mode = select
		video_editor_set_jog_time_lock
		change video_editor_focus = pane
		ui_create_video_editor_gfx
	endif
endscript

script video_editor_decrease_clip_speed 
	printf 'video_editor_decrease_clip_speed'
	if video_editor_clip_selected
		clip_speed = (<clip>.clip_speed)
		if (<clip_speed> > 0.2)
			clip_speed = (<clip_speed> - 0.2)
			if (<clip_speed> < 0.2)
				clip_speed = 0.2
			endif
			if ui_video_editor_can_extend_clip clip = <clip> new_clip_speed = <clip_speed>
				video_editor_modify_selected_clip clip_speed = <clip_speed>
				change video_editor_update_bars = -1
				ui_video_editor_pick_good_zoom clip = (($ve_current_edit_clips) [($video_cursor_column)])
				ui_create_video_editor_gfx
			else
				ui_video_editor_warning text = "Cannot slomo anymore, there is no more room on timeline."
			endif
		endif
	endif
endscript

script video_editor_increase_clip_speed 
	printf 'video_editor_increase_clip_speed'
	if video_editor_clip_selected
		clip_speed = (<clip>.clip_speed)
		if (<clip_speed> < 2.0)
			clip_speed = (<clip_speed> + 0.2)
			if (<clip_speed> >= 2.0)
				clip_speed = 2.0
			endif
			if ui_video_editor_can_shorten_clip clip = <clip> new_clip_speed = <clip_speed>
				video_editor_modify_selected_clip clip_speed = <clip_speed>
				ui_video_editor_check_shortened_clips
				change video_editor_update_bars = -1
				ui_create_video_editor_gfx
			else
				ui_video_editor_warning text = "The clip would be too short if the speed were to increase."
			endif
		endif
	endif
endscript

script ui_video_editor_analog_stick_watcher 
	ve_wait_for_viewport id = video_editor_viewport
	begin
	getanalogueinfo
	skip = 0
	if ve_is_playing
		skip = 1
	endif
	getarraysize ($ve_current_edit_clips)
	if (<array_size> = 0)
		skip = 1
	endif
	if scriptisrunning do_ok_dialog_box
		skip = 1
	endif
	if (<skip> = 0)
		time = ($video_timeline_cursor)
		jog_speed = ($video_editor_jog_speed)
		if ($video_editor_zoom > 0)
			jog_speed = (<jog_speed> * 5.0 * ($video_editor_zoom))
		endif
		if gotparam rightx
			if (<rightx> < 0.2)
				time = (<time> + (<rightx> * <jog_speed>))
				if (<time> < 0.0)
					time = 0.0
				endif
				if ($video_editor_jog_time_lock_start >= 0.0)
					if (<time> < $video_editor_jog_time_lock_start)
						time = $video_editor_jog_time_lock_start
					endif
				endif
			elseif (<rightx> > 0.2)
				ve_get_clips_entire_length clips = ($ve_current_edit_clips)
				time = (<time> + (<rightx> * <jog_speed>))
				if (<time> > <entire_length>)
					time = <entire_length>
				endif
				if ($video_editor_jog_time_lock_end >= 0.0)
					if (<time> > $video_editor_jog_time_lock_end)
						time = $video_editor_jog_time_lock_end
					endif
				endif
			endif
		endif
		if NOT (($video_timeline_cursor) = <time>)
			if video_editor_find_snap_point old_time = ($video_timeline_cursor) new_time = <time>
				time = <snap_time>
			endif
			video_editor_update_time_bar time = <time> analog_stick_move
			spawnscriptnow ve_preview_seek params = {
				clips = ($ve_current_edit_clips)
				preview_time = <time>
				viewport = video_editor_viewport
			}
		endif
	endif
	wait 2 gameframes
	repeat
endscript

script video_editor_update_timeline_to_selected 
	if ($video_cursor_row = 0)
		ve_get_extents clips = $ve_current_edit_clips index = ($video_cursor_column)
	elseif ($video_cursor_row = 1)
		ve_get_extents effects = $ve_current_edit_effects index = ($video_cursor_column)
	else
		ve_get_extents overlays = $ve_current_edit_overlays index = ($video_cursor_column)
	endif
	if gotparam \{start_extent}
		ve_get_clips_entire_length \{clips = $ve_current_edit_clips}
		if (<start_extent> < <entire_length>)
			video_editor_update_time_bar time = <start_extent>
		endif
	endif
endscript

script ui_video_editor_preview_edit 
	if ($video_editor_sel_mode = drag)
		return
	endif
	if NOT ($video_editor_trim_step = none)
		return
	endif
	getarraysize ($ve_current_edit_clips)
	if (<array_size> > 0)
		if ve_is_playing
			return
		endif
		spawnscriptnow ui_play_preview params = {
			start_time = ($video_timeline_cursor)
			spawnlater
		}
	endif
endscript

script ui_video_editor_new_first_clip 
	printf 'ui_video_editor_new_first_clip'
	getarraysize ($ve_current_edit_clips)
	if (<array_size> > 0)
		if VideoClipSlotFunc get_clip_data_struct name = ((($ve_current_edit_clips) [0]).name)
			if NOT (($ve_preview_actor) = none)
				ve_use_cas_appearance cas = (<clip_data>.cas) actor = ($ve_preview_actor)
			endif
			if IsInCrib
				if structurecontains structure = <clip_data> crib_theme
					crib_change_theme_ve theme = (<clip_data>.crib_theme)
				endif
			endif
		endif
	endif
endscript

script ui_video_editor_pick_good_zoom 
	if gotparam \{clip}
		ve_get_edit_clip_length edit_clip = <clip>
		if ($video_editor_zoom = 0)
			if (<length> > 15.0)
				ui_set_video_editor_zoom \{zoom = 1}
			endif
		endif
	else
		ve_get_clips_entire_length clips = ($ve_current_edit_clips)
		if ((<entire_length> > 61.0) && ($video_editor_zoom < 2))
			ui_set_video_editor_zoom \{zoom = 2}
		elseif ((<entire_length> > 16.0) && ($video_editor_zoom < 1))
			ui_set_video_editor_zoom \{zoom = 1}
		endif
	endif
endscript

script ui_video_editor_can_leave_edit 
	if ve_is_playing
		return \{false}
	endif
	if ($video_editor_sel_mode = drag)
		return \{false}
	endif
	if NOT ($video_editor_trim_step = none)
		return \{false}
	endif
	return \{true}
endscript

script ui_video_editor_play_edit_fs_from_menu 
	ui_video_editor_play_edit_fs {<...> spawnlater}
endscript

script ui_video_editor_play_edit_fs_from_menu_from_cursor 
	ui_video_editor_play_edit_fs {<...> spawnlater start_time = ($video_timeline_cursor) timeline_callback = video_editor_update_time_bar}
endscript

script ui_video_editor_play_edit_fs start_time = 0.0
	if NOT ui_video_editor_can_leave_edit
		return
	endif
	ve_get_clips_entire_length clips = $ve_current_edit_clips
	if ((<start_time> + 0.005) >= <entire_length>)
		ui_video_editor_warning text = "Your cursor is at the end of your edit, there is nothing to preview"
		printstruct <...>
		return
	endif
	getarraysize ($ve_current_edit_clips)
	if (<array_size> > 0)
		change video_editor_fs_playback = 1
		if screenelementexists id = Video_Editor_Container
			destroyscreenelement id = Video_Editor_Container
		endif
		spawncmd = spawnscriptnow
		if gotparam spawnlater
			spawncmd = spawnscriptlater
		endif
		ve_pop_editing_buss
		<spawncmd> ve_play_clips params = {
			clips = ($ve_current_edit_clips)
			effects = ($ve_current_edit_effects)
			overlays = ($ve_current_edit_overlays)
			audio = ($ve_current_edit_audio)
			end_state = UIstate_video_editor_Edit_View
			start_time = <start_time>
			no_loading
			cas_pros_only
			expanded_ui
			timeline_callback = <timeline_callback>
		}
	endif
endscript

script ui_video_editor_render_edit 
	if isps3
		ui_video_editor_warning text = "Saving a finalized edit is not available on the PLAYSTATION®3 console."
		return
	endif
	if NOT ui_video_editor_can_leave_edit
		return
	endif
	getarraysize ($ve_current_edit_clips)
	if (<array_size> > 0)
		change ve_render_submission = none
		ui_change_state state = UIstate_video_editor_rendering
	endif
endscript

script ui_video_editor_leaderboard_submit 
	if NOT ui_video_editor_can_leave_edit
		return
	endif
	if NOT getglobalflag flag = $VIDEO_EDIT_SUBMIT_ENABLED
		return
	endif
	getarraysize ($ve_current_edit_clips)
	if (<array_size> > 0)
		ve_calculate_edit_score {
			clips = ($ve_current_edit_clips)
			effects = ($ve_current_edit_effects)
			overlays = ($ve_current_edit_overlays)
			audio = ($ve_current_edit_audio)
		}
		if (<score> > ($ve_min_score_for_submission))
			if ve_get_clips_area clips = ($ve_current_edit_clips)
				printf 'ui_video_editor_leaderboard_submit - area: %a' a = <area>
				switch <area>
					case Area_Philly
					<leaderboard_id> = M_edit_philly
					case Area_Baltimore
					<leaderboard_id> = M_edit_baltimore
					case Area_DC
					<leaderboard_id> = M_edit_dc
					case Area_Crib
					<leaderboard_id> = M_edit_skatelounge
					default
					return
				endswitch
			endif
			change ve_render_submission = <leaderboard_id>
			ui_change_state state = UIstate_video_editor_rendering
		else
			ui_video_editor_warning text = "Your edit score is too low for submission."
		endif
	else
		ui_video_editor_warning text = "You need at least one clip added before you can submit your edit."
	endif
endscript

script ui_video_editor_play_sel_clip 
	if ve_is_playing
		return
	endif
	getarraysize ($ve_current_edit_clips)
	if (<array_size> > 0)
		if video_editor_clip_selected
			change \{video_editor_fs_playback = 1}
			change \{video_editor_update_bars = -1}
			change \{video_previous_time = -1.0}
			ve_pop_editing_buss
			spawnscriptlater ve_play_clips params = {
				clips = [{(<clip>)}]
				end_state = UIstate_video_editor_Edit_View
				no_loading
				cas_pros_only
				expanded_ui
			}
		endif
	endif
endscript

script ui_ensure_column_cursor_in_bounds 
	video_editor_get_row_array_size
	if (($video_cursor_column) >= <array_size>)
		if (<array_size> > 0)
			change video_cursor_column = (<array_size> - 1)
		else
			change \{video_cursor_column = 0}
		endif
	endif
endscript

script ui_video_editor_delete_sel_clip 
	if video_editor_clip_selected
		printf 'ui_video_editor_delete_sel_clip'
		removearrayelement array = ($ve_current_edit_clips) index = ($video_cursor_column)
		change ve_current_edit_clips = <array>
		ui_ensure_column_cursor_in_bounds
		ui_video_editor_check_shortened_clips
		getarraysize ($ve_current_edit_clips)
		if (<array_size> = 0)
			removeparameter array
			getscreenelementdims id = Video_Editor_Properties_Container
			video_editor_create_pane ($video_editor_other_panes [0]) <...> texture = cap_iconedit z_priority = 5
			removeparameter width
			removeparameter height
			change video_editor_pane_selection = 0
		endif
		if (($video_cursor_column) = 0)
			ui_video_editor_new_first_clip
		endif
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_delete_sel_effect 
	if video_editor_effect_selected
		printf \{'ui_video_editor_delete_sel_effect'}
		removearrayelement array = ($ve_current_edit_effects) index = ($video_cursor_column)
		change ve_current_edit_effects = <array>
		ui_ensure_column_cursor_in_bounds
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_delete_sel_overlay 
	if video_editor_overlay_selected
		printf \{'ui_video_editor_delete_sel_overlay'}
		removearrayelement array = ($ve_current_edit_overlays) index = ($video_cursor_column)
		change ve_current_edit_overlays = <array>
		ui_ensure_column_cursor_in_bounds
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_restore_sel_clip 
	if video_editor_clip_selected
		printf 'ui_video_editor_restore_sel_clip'
		ve_get_original_clip_length clip = (<clip>.name)
		if ui_video_editor_can_extend_clip clip = <clip> new_clip_start = 0.0 new_clip_end = <length> new_clip_speed = 1.0
			ve_get_default_edit_clip_struct name = (<clip>.name)
			setarrayelement globalarray arrayname = ve_current_edit_clips index = ($video_cursor_column) newvalue = <clip_struct>
			if (<clip>.clip_speed < 1.0)
				ui_video_editor_check_shortened_clips
			endif
			ui_video_editor_pick_good_zoom clip = <clip>
			ui_create_video_editor_gfx
		else
			ui_video_editor_warning text = "Cannot restore this clip, it would make the edit longer than the timeline allows."
		endif
	endif
endscript

script ui_video_editor_restore_sel_effect 
	if video_editor_effect_selected
		printf 'ui_video_editor_restore_sel_effect'
		getarraysize (<effect>.effects)
		if (<array_size> > 1)
			removearrayelement array = (<effect>.effects) index = (<array_size> - 1)
			new_effects_array = <array>
		else
			ui_video_editor_warning text = "This effect does not have a combination, there is nothing to undo."
		endif
		if gotparam new_effects_array
			effect = {<effect> effects = <new_effects_array>}
			setarrayelement globalarray arrayname = ve_current_edit_effects index = ($video_cursor_column) newvalue = <effect>
			ui_create_video_editor_gfx
		endif
	endif
endscript

script ui_create_video_editor_gfx_menu 
	getarraysize $video_editor_menu_array
	if NOT screenelementexists id = Video_Editor_Top_Container
		if ($video_editor_focus = menu)
			pos = (640.0, 0.0)
		else
			pos = (640.0, -45.0)
		endif
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Container
			id = Video_Editor_Top_Container
			just = [center top]
			pos = <pos>
			dims = (1280.0, 144.0)
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = white
			rgba = [40 40 40 255]
			just = [left top]
			pos = (0.0, 0.0)
			dims = (1280.0, 120.0)
		}
		createscreenelement {
			type = textelement
			parent = Video_Editor_Top_Container
			id = Video_Editor_Top_Text
			text = ""
			font = text_a1
			just = [right center]
			pos = (375.0, 105.0)
			scale = (0.95, 0.85)
			font_spacing = 3
			rgba = [200 200 200 255]
			z_priority = 100
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
			alpha = 1.0
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = cap_whitenoise
			rgba = [200 200 200 185]
			just = [left top]
			pos = (-250.0, -20.0)
			dims = (500.0, -120.0)
			rot_angle = 5
			z_priority = 4
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = cap_whitenoise
			rgba = [140 140 140 155]
			just = [left top]
			pos = (980.0, 15.0)
			dims = (-300.0, 130.0)
			rot_angle = -6
			z_priority = 4
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = cap_whitenoise
			rgba = [0 0 0 255]
			just = [left top]
			pos = (20.0, 10.0)
			dims = (400.0, 128.0)
			z_priority = 4
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = cap_whitenoise
			rgba = [0 0 0 255]
			just = [left top]
			pos = (720.0, 30.0)
			dims = (-700.0, 108.0)
			z_priority = 4
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = vided_toolbar_top
			rgba = [40 40 40 255]
			just = [left top]
			pos = (-160.0, 110.0)
			dims = (800.0, 64.0)
			z_priority = 2
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Top_Container
			texture = vided_toolbar_top
			rgba = [40 40 40 255]
			just = [left top]
			pos = (640.0, 110.0)
			dims = (-800.0, 64.0)
			z_priority = 2
		}
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Top_Container
			id = Video_Editor_Menu_Container
			just = [center center]
			pos = {(0.5, 0.7) proportional}
			dims = ((1.0, 0.0) * ((<array_size> - 1) * 125))
		}
		<i> = 0
		begin
		<scale> = 0.6
		<rgba> = [20 20 20 85]
		<rgba_icon> = [200 200 200 120]
		if (<i> = $video_editor_current_selection)
			<scale> = 0.8
			<rgba> = [90 90 90 225]
			<rgba_icon> = [200 200 200 255]
			setscreenelementprops {
				id = Video_Editor_Top_Text
				text = (($video_editor_menu_array [$video_editor_current_selection]).name)
			}
			doscreenelementmorph {
				id = Video_Editor_Top_Text
				rgba = [140 140 140 255]
				scale = (0.95, 0.85)
			}
			getscreenelementdims id = Video_Editor_Top_Text
			if (<width> > 250)
				<new_scale> = ((250.0 / <width>) * (0.95, 0.85))
				doscreenelementmorph id = Video_Editor_Top_Text time = 0 scale = <new_scale>
			endif
			if ($video_editor_focus = menu)
				<scale> = 0.9
				<rgba> = [200 70 70 255]
				<rgba_icon> = [200 200 200 255]
				doscreenelementmorph {
					id = Video_Editor_Top_Text
					rgba = [200 200 200 255]
				}
			endif
		endif
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Menu_Container
			child_anchor = [center center]
			just = [center center]
			pos = (((1.0, 0.0) * (<i> * 125)) + (100.0, 0.0))
			scale = <scale>
		}
		<parent> = <id>
		createscreenelement {
			type = spriteelement
			parent = <parent>
			texture = cap_piececircle
			rgba = <rgba>
			just = [center center]
			rot_angle = RandomRange (0.0, 360.0)
			scale = 0.8
			pos = (0.0, 0.0)
		}
		createscreenelement {
			type = spriteelement
			parent = <parent>
			texture = (($video_editor_menu_array [<i>]).texture)
			rgba = <rgba_icon>
			just = [center center]
			pos = (0.0, 0.0)
			rot_angle = RandomRange (-7.0, 7.0)
			scale = 1.7
			z_priority = 7
		}
		<i> = (<i> + 1)
		repeat <array_size>
	else
		<i> = 0
		begin
		<scale> = 0.6
		<rgba> = [20 20 20 85]
		<rgba_icon> = [200 200 200 120]
		if (<i> = $video_editor_current_selection)
			<scale> = 0.8
			<rgba> = [90 90 90 225]
			<rgba_icon> = [200 200 200 255]
			setscreenelementprops {
				id = Video_Editor_Top_Text
				text = (($video_editor_menu_array [$video_editor_current_selection]).name)
			}
			doscreenelementmorph {
				id = Video_Editor_Top_Text
				rgba = [140 140 140 255]
				scale = (0.95, 0.85)
			}
			getscreenelementdims id = Video_Editor_Top_Text
			if (<width> > 250)
				<new_scale> = ((250.0 / <width>) * (0.95, 0.85))
				doscreenelementmorph id = Video_Editor_Top_Text time = 0 scale = <new_scale>
			endif
			if ($video_editor_focus = menu)
				<scale> = 0.9
				<rgba> = [200 70 70 255]
				<rgba_icon> = [200 200 200 255]
				doscreenelementmorph {
					id = Video_Editor_Top_Text
					rgba = [200 200 200 255]
				}
			endif
		endif
		resolvescreenelementid id = {Video_Editor_Menu_Container child = <i>}
		doscreenelementmorph {
			id = <resolved_id>
			scale = <scale>
		}
		setscreenelementprops {
			id = {<resolved_id> child = 0}
			rgba = <rgba>
		}
		setscreenelementprops {
			id = {<resolved_id> child = 1}
			rgba = <rgba_icon>
		}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_create_video_editor_gfx_workspace 
	if NOT screenelementexists id = Video_Editor_Bottom_Container
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Container
			id = Video_Editor_Bottom_Container
			just = [left top]
			pos = (0.0, 175.0)
			dims = (1280.0, 576.0)
			z_priority = 10
		}
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Bottom_Container
			id = Video_Editor_Workspace_Container
			just = [center center]
			pos = {(0.5, 0.4) proportional}
			dims = ((0.0, 430.0) + ((1.0, 0.0) * $video_timeline_width))
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			texture = white
			just = [left top]
			pos = {(0.0, 0.0) proportional}
			dims = ((0.0, 2.0) + ((1.0, 0.0) * $video_timeline_width))
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			texture = black
			just = [right top]
			pos = {(0.0, 0.0) proportional}
			dims = (500.0, 430.0)
			z_priority = 15
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			texture = white
			just = [left top]
			pos = {(0.0, 0.0) proportional}
			dims = (2.0, 430.0)
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			texture = white
			just = [left bottom]
			pos = {(0.0, 1.0) proportional}
			dims = ((0.0, 2.0) + ((1.0, 0.0) * $video_timeline_width))
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			texture = white
			just = [right top]
			pos = {(1.0, 0.0) proportional}
			dims = (2.0, 430.0)
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			texture = black
			just = [left top]
			pos = {(1.0, 0.0) proportional}
			dims = (500.0, 430.0)
			z_priority = 30
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Workspace_Container
			id = Video_Editor_Haze
			texture = HUD_viewport_haze
			just = [right bottom]
			rgba = [40 30 5 255]
			pos = {(1.0, 1.0) proportional}
			dims = (450.0, 250.0)
			z_priority = 2
			alpha = 0.5
		}
	endif
	if NOT screenelementexists id = Video_Editor_Timeline_Container
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Workspace_Container
			id = Video_Editor_Timeline_Container
			just = [left top]
			pos = ((-1.0, 0.0) * ($video_timestart * 60))
			dims = ((0.0, 120.0) + ((1.0, 0.0) * $video_timeline_width))
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Timeline_Container
			texture = white
			just = [left bottom]
			pos = (0.0, 120.0)
			dims = ((0.0, 2.0) + ((1.0, 0.0) * ((100000 + 5) * $video_second_width)))
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Timeline_Container
			texture = white
			just = [left bottom]
			pos = (0.0, 20.0)
			dims = ((0.0, 2.0) + ((1.0, 0.0) * ((10000 + 5) * $video_second_width)))
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Timeline_Container
			texture = white
			just = [left bottom]
			pos = (0.0, 60.0)
			dims = ((0.0, 2.0) + ((1.0, 0.0) * ((10000 + 5) * $video_second_width)))
			rgba = [200 200 200 255]
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Timeline_Container
			texture = white
			just = [left bottom]
			pos = (0.0, 90.0)
			dims = ((0.0, 2.0) + ((1.0, 0.0) * ((10000 + 5) * $video_second_width)))
			rgba = [200 200 200 255]
			z_priority = 14
		}
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Timeline_Container
			id = Video_Editor_Timeline_Container_Time
			just = [left top]
			pos = (0.0, 0.0)
			dims = (0.0, 20.0)
		}
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Timeline_Container
			id = Video_Editor_Timeline_Container_Vid
			just = [left top]
			pos = (0.0, 20.0)
			dims = (0.0, 40.0)
		}
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Timeline_Container
			id = Video_Editor_Timeline_Container_Eff
			just = [left top]
			pos = (0.0, 60.0)
			dims = (0.0, 30.0)
		}
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Timeline_Container
			id = Video_Editor_Timeline_Container_Over
			just = [left top]
			pos = (0.0, 90.0)
			dims = (0.0, 30.0)
		}
	else
		doscreenelementmorph {
			id = Video_Editor_Timeline_Container
			pos = ((-1.0, 0.0) * ($video_timestart * $video_second_width))
		}
		if NOT ($video_timestart = $video_previous_time)
			if screenelementexists id = Video_Editor_Timeline_Container_Time
				destroyscreenelement id = Video_Editor_Timeline_Container_Time preserve_parent
			endif
		endif
		if ($video_editor_update_bars = -1)
			if screenelementexists id = Video_Editor_Timeline_Container_Over
				destroyscreenelement id = Video_Editor_Timeline_Container_Over preserve_parent
			endif
			if screenelementexists id = Video_Editor_Timeline_Container_Vid
				destroyscreenelement id = Video_Editor_Timeline_Container_Vid preserve_parent
			endif
			if screenelementexists id = Video_Editor_Timeline_Container_Eff
				destroyscreenelement id = Video_Editor_Timeline_Container_Eff preserve_parent
			endif
		endif
	endif
	if NOT screenelementexists id = Video_Editor_Properties_Container
		createscreenelement {
			type = containerelement
			parent = Video_Editor_Workspace_Container
			id = Video_Editor_Properties_Container
			just = [left top]
			pos = (0.0, 120.0)
			dims = ((0.0, 310.0) + ((1.0, 0.0) * $video_timeline_width))
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Properties_Container
			texture = white
			rgba = [40 40 40 255]
			just = [left top]
			pos = (0.0, 0.0)
			dims = ((0.0, 310.0) + ((1.0, 0.0) * $video_timeline_width))
			z_priority = 1
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Properties_Container
			id = Clip_Desc_BG_left
			texture = vided_tiny_rip_mask
			just = [left top]
			pos = (418.0, 0.0)
			dims = (38.0, -61.0)
			z_priority = 16
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Properties_Container
			texture = cap_whitenoise
			rgba = [0 0 0 255]
			just = [left top]
			pos = (400.0, -18.0)
			dims = (370.0, 80.0)
			z_priority = 13
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Properties_Container
			id = Clip_Desc_BG_bottom
			texture = vided_toolbar_top
			just = [left top]
			pos = (390.0, 50.0)
			dims = (520.0, 35.0)
			z_priority = 5
		}
		createscreenelement {
			type = spriteelement
			parent = Video_Editor_Properties_Container
			id = Clip_Desc_BG
			texture = white
			just = [right top]
			pos = {(1.0, 0.0) proportional}
			dims = ((0.0, 50.0) + ((1.0, 0.0) * ($video_timeline_width / 2)))
			z_priority = 13
		}
		createscreenelement {
			type = textelement
			parent = Video_Editor_Properties_Container
			id = Clip_Name_Text
			font = text_a1
			scale = (0.6, 0.5)
			just = [left center]
			pos = (475.0, 22.0)
			text = ""
			rgba = [200 200 200 255]
			font_spacing = 2
			z_priority = 15
			shadow
			shadow_rgba = [0 0 0 200]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			type = textelement
			parent = Video_Editor_Properties_Container
			id = Clip_Prop_Text
			font = text_a1
			scale = (0.6, 0.5)
			just = [left center]
			pos = (475.0, 47.0)
			text = ""
			rgba = [200 200 200 255]
			font_spacing = 2
			z_priority = 15
			shadow
			shadow_rgba = [0 0 0 200]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			type = textelement
			parent = Video_Editor_Properties_Container
			id = Clip_Time_Text
			font = text_a1
			scale = (0.8, 0.7)
			just = [right center]
			pos = (875.0, 35.0)
			text = ""
			rgba = [240 240 240 255]
			font_spacing = 2
			z_priority = 15
			shadow
			shadow_rgba = [0 0 0 200]
			shadow_offs = (2.0, 2.0)
		}
	endif
endscript

script ui_video_editor_set_audio_start inc = 0
	if structurecontains structure = ($ve_current_edit_audio) music
		start = (($ve_current_edit_audio).music_start)
		start = (<start> + <inc>)
		if ve_get_playlist_track_from_asset asset = (($ve_current_edit_audio).music)
			length_limit = ((<track>.length) - 2.0)
			if (<start> >= <length_limit>)
				<start> = <length_limit>
			endif
			if (<start> < 0.0)
				<start> = 0.0
			endif
		endif
		change ve_current_edit_audio = {($ve_current_edit_audio) music_start = <start>}
		video_editor_update_panes
		ui_video_editor_draw_debug_beat_lines
	endif
endscript

script ui_video_editor_audio_preview 
	if structurecontains structure = ($ve_current_edit_audio) music
		getarraysize ($ve_current_edit_clips)
		if (<array_size> > 0)
			spawnscriptnow \{ui_play_preview
				params = {
					spawnlater
					start_time = 0.0
				}}
		else
			ui_video_editor_warning \{text = "Clips are required in this edit in order to preview audio."}
		endif
	endif
endscript

script ui_video_editor_increase_effect_length \{mod = 0.25}
	if video_editor_effect_selected
		ve_get_clips_entire_length \{clips = $ve_current_edit_clips}
		ve_get_array_end_time \{array = $ve_current_edit_effects}
		if ((<entire_length> - <end_time>) < <mod>)
			<mod> = (<entire_length> - <end_time>)
			if (<mod> < 0.0)
				return
			endif
		endif
		length = ((<effect>.length) + <mod>)
		video_editor_modify_selected_effect length = <length>
		soundevent \{event = VE_edit_grow}
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_decrease_effect_length \{mod = 0.25}
	if video_editor_effect_selected
		new_length = ((<effect>.length) - <mod>)
		if (<new_length> < ($video_editor_minimum_effect_length))
			new_length = ($video_editor_minimum_effect_length)
		endif
		video_editor_modify_selected_effect length = <new_length>
		soundevent \{event = VE_edit_cut}
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_increase_overlay_length \{mod = 0.25}
	if video_editor_overlay_selected
		ve_get_clips_entire_length \{clips = $ve_current_edit_clips}
		ve_get_array_end_time \{array = $ve_current_edit_overlays}
		if ((<entire_length> - <end_time>) < <mod>)
			<mod> = (<entire_length> - <end_time>)
			if (<mod> < 0.0)
				return
			endif
		endif
		length = ((<overlay>.length) + <mod>)
		video_editor_modify_selected_overlay length = <length>
		soundevent \{event = VE_edit_grow}
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_decrease_overlay_length \{mod = 0.25}
	if video_editor_overlay_selected
		new_length = ((<overlay>.length) - <mod>)
		if (<new_length> < ($video_editor_minimum_effect_length))
			new_length = ($video_editor_minimum_effect_length)
		endif
		video_editor_modify_selected_overlay length = <new_length>
		soundevent \{event = VE_edit_cut}
		ui_create_video_editor_gfx
	endif
endscript

script video_editor_find_snap_point old_time = ($video_timeline_cursor) new_time = <time>
	if (<old_time> > <new_time>)
		temp = <old_time>
		old_time = <new_time>
		new_time = <temp>
	endif
	diff = (<new_time> - <old_time>)
	if (<diff> < ($video_editor_jog_snap))
		if video_editor_find_snap_point_in_array {
				array = ($ve_current_edit_clips)
				params = {clips = ($ve_current_edit_clips)}
				old_time = <old_time>
				new_time = <new_time>
			}
			return true snap_time = <snap_time>
		endif
		if video_editor_find_snap_point_in_array {
				array = ($ve_current_edit_effects)
				params = {effects = ($ve_current_edit_effects)}
				old_time = <old_time>
				new_time = <new_time>
			}
			return true snap_time = <snap_time>
		endif
		if video_editor_find_snap_point_in_array {
				array = ($ve_current_edit_overlays)
				params = {overlays = ($ve_current_edit_overlays)}
				old_time = <old_time>
				new_time = <new_time>
			}
			return true snap_time = <snap_time>
		endif
		i = 0
		getarraysize $ve_current_edit_markers
		if (<array_size> > 0)
			begin
			marker_time = ($ve_current_edit_markers [<i>])
			if video_editor_consider_snap time = <marker_time> old_time = <old_time> new_time = <new_time>
				return true snap_time = <marker_time>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	change video_editor_snap_lock = 0
	return false
endscript

script video_editor_find_snap_point_in_array 
	i = 0
	getarraysize <array>
	if (<array_size> > 0)
		begin
		if ve_get_extents <params> index = <i>
			if video_editor_consider_snap time = <end_extent> old_time = <old_time> new_time = <new_time>
				return true snap_time = <end_extent>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script video_editor_consider_snap 
	if (<old_time> <= <time>)
		if (<new_time> >= <time>)
			change video_editor_snap_lock = ($video_editor_snap_lock + 1)
			if ($video_editor_snap_lock > ($video_editor_jog_snap_unlock_frames))
				return \{false}
			endif
			return true snap_time = <time>
		endif
	endif
	return \{false}
endscript

script video_editor_split_clips 
	printf 'video_editor_split_clips'
	getarraysize ($ve_current_edit_clips)
	if (<array_size> = 0)
		ui_video_editor_warning text = "There are clips in the edit to split."
	else
		if ui_video_editor_can_add_to_array array = ($ve_current_edit_clips)
			if ve_get_clip_at_time clips = ($ve_current_edit_clips) time = ($video_timeline_cursor)
				if ve_split_clip clips = ($ve_current_edit_clips) index = <index> time = ($video_timeline_cursor) min_length = ($video_editor_minimum_clip_length)
					change ve_current_edit_clips = <clips>
					return true new_index = <new_index>
				else
					ui_video_editor_warning text = "Couldn't trim the clip that close to the edge."
				endif
			endif
		else
			ui_video_editor_warning text = "You have reached the maximum number of allowed clips in this edit."
		endif
	endif
	return false
endscript

script video_editor_begin_trim_clip 
	printf 'video_editor_begin_trim_clip'
	if video_editor_clip_selected
		if NOT ui_video_editor_can_add_to_array array = ($ve_current_edit_clips)
			ui_video_editor_warning text = "You have reached the maximum number of allowed clips in this edit."
			return
		endif
	elseif video_editor_effect_selected
		if NOT ui_video_editor_can_add_to_array array = ($ve_current_edit_effects)
			ui_video_editor_warning text = "You have reached the maximum number of allowed effects in this edit."
			return
		endif
	else
		if NOT ui_video_editor_can_add_to_array array = ($ve_current_edit_overlays)
			ui_video_editor_warning text = "You have reached the maximum number of allowed overlays in this edit."
			return
		endif
	endif
	change video_editor_focus = timeline
	if screenelementexists id = Video_Editor_Helper_Text
		setscreenelementprops {
			id = Video_Editor_Helper_Text
			text = "\\be\\_set\\_begin    \\bf\\_set\\_end    \\bl\\_jog    \\bm\\_toggle\\_zoom    \\m0\\_apply    \\m1\\_cancel"
		}
	endif
	if NOT ($video_editor_trim_step = none)
		scriptassert 'Trim step must be unset'
	endif
	change video_editor_trim_step = trim
	if video_editor_clip_selected
		ve_get_extents clips = ($ve_current_edit_clips) index = ($video_cursor_column)
		video_editor_set_jog_time_lock start = <start_extent> end = <end_extent>
		change video_editor_trim_leading = <start_extent>
		change video_editor_trim_trailing = <end_extent>
	elseif video_editor_effect_selected
		ve_get_extents effects = ($ve_current_edit_effects) index = ($video_cursor_column)
		change video_editor_trim_leading = <start_extent>
		change video_editor_trim_trailing = <end_extent>
		<effect_start> = <start_extent>
		ve_get_clips_entire_length clips = $ve_current_edit_clips
		<effect_end> = <entire_length>
		getarraysize $ve_current_edit_effects
		if NOT ((<array_size> - 1) = $video_cursor_column)
			<i> = 0
			begin
			if (<i> > $video_cursor_column)
				ve_get_extents effects = ($ve_current_edit_effects) index = <i>
				<effect_end> = (<entire_length> - (<end_extent> - <start_extent>))
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		video_editor_set_jog_time_lock start = <effect_start> end = <effect_end>
	else
		ve_get_extents effects = ($ve_current_edit_overlays) index = ($video_cursor_column)
		change video_editor_trim_leading = <start_extent>
		change video_editor_trim_trailing = <end_extent>
		<effect_start> = <start_extent>
		ve_get_clips_entire_length clips = $ve_current_edit_clips
		<effect_end> = <entire_length>
		getarraysize $ve_current_edit_overlays
		if NOT ((<array_size> - 1) = $video_cursor_column)
			<i> = 0
			begin
			if (<i> > $video_cursor_column)
				ve_get_extents effects = ($ve_current_edit_overlays) index = <i>
				<effect_end> = (<entire_length> - (<end_extent> - <start_extent>))
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		video_editor_set_jog_time_lock start = <effect_start> end = <effect_end>
	endif
endscript

script video_editor_trim_clip_button_press 
	printf 'video_editor_trim_clip_button_press'
	if ($video_editor_trim_step = none)
		scriptassert 'Trim step must be set'
	endif
	if ($video_editor_trim_step = trim)
		if screenelementexists id = Video_Editor_Helper_Text
			setscreenelementprops {
				id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_zoom    \\m0\\_select    \\m5\\_marker    \\bh\\_play    \\m8\\_preview    \\m1\\_back"
			}
		endif
		if video_editor_clip_selected
			ve_trim_clip clips = ($ve_current_edit_clips) index = ($video_cursor_column) leading = ($video_editor_trim_leading) trailing = ($video_editor_trim_trailing)
			change ve_current_edit_clips = <clips>
		elseif video_editor_effect_selected
			ve_get_extents effects = ($ve_current_edit_effects) index = ($video_cursor_column)
			if NOT ($video_editor_trim_leading <= <start_extent>)
				<length> = ($video_editor_trim_leading - <start_extent>)
				lead_effect = {
					effects = [
						none
					]
					length = <length>
					blend_in = 1
					blend_out = 1
					strength = 1.0
				}
				removeparameter length
			endif
			if NOT ($video_editor_trim_trailing >= <end_extent>)
				<length> = (<end_extent> - $video_editor_trim_trailing)
				trail_effect = {
					effects = [
						none
					]
					length = <length>
					blend_in = 1
					blend_out = 1
					strength = 1.0
				}
				removeparameter length
			endif
			video_editor_modify_selected_effect {
				length = (($video_editor_trim_trailing) - ($video_editor_trim_leading))
			}
			if gotparam trail_effect
				ve_array_insert_element array = $ve_current_edit_effects index = ($video_cursor_column + 1) element = <trail_effect>
				change ve_current_edit_effects = <array>
			endif
			if gotparam lead_effect
				ve_array_insert_element array = $ve_current_edit_effects index = ($video_cursor_column) element = <lead_effect>
				change ve_current_edit_effects = <array>
			endif
		else
			ve_get_extents overlays = ($ve_current_edit_overlays) index = ($video_cursor_column)
			if NOT ($video_editor_trim_leading <= <start_extent>)
				<length> = ($video_editor_trim_leading - <start_extent>)
				lead_overlay = {
					name = none
					length = <length>
				}
				removeparameter length
			endif
			if NOT ($video_editor_trim_trailing >= <end_extent>)
				<length> = (<end_extent> - $video_editor_trim_trailing)
				trail_overlay = {
					name = none
					length = <length>
				}
				removeparameter length
			endif
			video_editor_modify_selected_overlay {
				length = (($video_editor_trim_trailing) - ($video_editor_trim_leading))
			}
			if gotparam trail_overlay
				ve_array_insert_element array = $ve_current_edit_overlays index = ($video_cursor_column + 1) element = <trail_overlay>
				change ve_current_edit_overlays = <array>
			endif
			if gotparam lead_overlay
				ve_array_insert_element array = $ve_current_edit_overlays index = ($video_cursor_column) element = <lead_overlay>
				change ve_current_edit_overlays = <array>
			endif
		endif
		video_editor_set_jog_time_lock
		change video_editor_trim_step = none
		change video_editor_sel_mode = select
		change video_editor_trim_leading = 0.0
		change video_editor_trim_trailing = 0.0
		video_editor_update_timeline_to_selected
		video_editor_back
		change video_editor_update_bars = -1
		ui_create_video_editor_gfx
	endif
endscript

script video_editor_cancel_trim 
	printf \{'video_editor_cancel_trim'}
	video_editor_set_jog_time_lock
	change \{video_editor_trim_step = none}
	change \{video_editor_sel_mode = select}
	change \{video_editor_trim_leading = 0.0}
	change \{video_editor_trim_trailing = 0.0}
	change \{video_editor_update_bars = -1}
endscript

script video_editor_set_jog_time_lock 
	printf 'video_editor_set_jog_time_lock'
	if NOT gotparam start
		change video_editor_jog_time_lock_start = -1.0
	else
		change video_editor_jog_time_lock_start = <start>
		if ($video_timeline_cursor <= <start>)
			updatetime = <start>
		endif
	endif
	if NOT gotparam end
		change video_editor_jog_time_lock_end = -1.0
	else
		change video_editor_jog_time_lock_end = <end>
		if ($video_timeline_cursor >= <end>)
			updatetime = <end>
		endif
	endif
	if gotparam updatetime
		video_editor_update_time_bar time = <updatetime>
		spawnscriptnow ve_preview_seek params = {
			clips = ($ve_current_edit_clips)
			preview_time = <updatetime>
			viewport = video_editor_viewport
		}
	endif
endscript

script video_editor_grab_selected 
	if ($video_editor_sel_mode = select)
		if screenelementexists \{id = Video_Editor_Helper_Text}
			setscreenelementprops \{id = Video_Editor_Helper_Text
				text = "\\bl\\_jog    \\bm\\_toggle\\_zoom    \\m1\\_finish\\_move"}
		endif
		change \{video_editor_sel_mode = drag}
	else
		change \{video_editor_sel_mode = select}
	endif
	change \{video_editor_focus = timeline}
endscript

script ui_set_video_editor_zoom 
	if (<zoom> = 0)
		change video_editor_zoom = 0
		change video_second_width = 60
		change video_time_label_inc = 5
	elseif (<zoom> = 1)
		change video_editor_zoom = 1
		change video_second_width = ($video_timeline_width / 60)
		change video_time_label_inc = 15
	else
		change video_editor_zoom = 2
		change video_second_width = ($video_timeline_width / 130)
		change video_time_label_inc = 30
	endif
	change video_previous_time = -1.0
	change video_editor_update_bars = -1
endscript

script ui_video_editor_zoom 
	if gotparam \{reset}
		change \{video_timestart = 0.0}
	endif
	if (($video_editor_zoom = 2) || (gotparam reset))
		ui_set_video_editor_zoom \{zoom = 0}
	elseif ($video_editor_zoom = 0)
		ui_set_video_editor_zoom \{zoom = 1}
	else
		ui_set_video_editor_zoom \{zoom = 2}
	endif
	if NOT gotparam \{reset}
		video_editor_ensure_selected_on_screen
		video_editor_ensure_time_cursor_on_screen
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_can_add_to_array 
	getarraysize <array>
	if (<array_size> < $video_editor_max_row_items)
		return \{true}
	endif
	return \{false}
endscript

script ui_video_editor_can_add_clip 
	ve_get_original_clip_length clip = <clip>
	ve_get_clips_entire_length \{clips = $ve_current_edit_clips}
	if ((<entire_length> + <length>) > $timeline_max_length)
		return \{false}
	endif
	if (<entire_length> >= $video_max_length)
		return \{false}
	endif
	return \{true}
endscript

script ui_video_editor_can_extend_clip 
	printf 'ui_video_editor_can_extend_clip'
	ve_get_edit_clip_length edit_clip = <clip>
	old_length = <length>
	clip = {
		<clip>
		clip_speed = <new_clip_speed>
		clip_end = <new_clip_end>
		clip_start = <new_clip_start>
	}
	ve_get_edit_clip_length edit_clip = <clip>
	add = (<length> - <old_length>)
	if (<add> > 0.0)
		ve_get_clips_entire_length clips = $ve_current_edit_clips
		if ((<entire_length> + <add>) > $timeline_max_length)
			return false
		endif
	endif
	return true
endscript

script ui_video_editor_can_shorten_clip 
	printf \{'ui_video_editor_can_shorten_clip'}
	clip = {
		<clip>
		clip_speed = <new_clip_speed>
		clip_end = <new_clip_end>
		clip_start = <new_clip_start>
	}
	ve_get_edit_clip_length edit_clip = <clip>
	if (<length> < ($video_editor_minimum_clip_length))
		return \{false}
	endif
	return \{true}
endscript

script ui_video_editor_get_effect_overlay_cap_time 
	ve_get_clips_entire_length \{clips = $ve_current_edit_clips}
	return cap_time = <entire_length>
endscript

script ui_video_editor_can_add_effect 
	printf \{'ui_video_editor_can_add_effect'}
	ve_get_array_end_time array = ($ve_current_edit_effects)
	ui_video_editor_get_effect_overlay_cap_time
	if ((<end_time> + <length>) > <cap_time>)
		return \{false}
	endif
	if (<end_time> >= $video_max_length)
		return \{false}
	endif
	return \{true}
endscript

script ui_video_editor_can_add_overlay 
	printf \{'ui_video_editor_can_add_overlay'}
	ve_get_array_end_time array = ($ve_current_edit_overlays)
	ui_video_editor_get_effect_overlay_cap_time
	if ((<end_time> + <length>) > <cap_time>)
		return \{false}
	endif
	if (<end_time> >= $video_max_length)
		return \{false}
	endif
	return \{true}
endscript

script ui_video_editor_can_add_unique_overlay add_overlay = none
	printf 'ui_video_editor_can_add_unique_overlay'
	getarraysize $ve_current_edit_overlays
	<overlay_array_size> = <array_size>
	<unique> = [none]
	<i> = 0
	begin
	if NOT (<i> = <overlay_array_size>)
		<overlay> = (($ve_current_edit_overlays [<i>]).name)
	else
		<overlay> = <add_overlay>
	endif
	removeparameter array_size
	getarraysize unique
	<j> = 0
	begin
	if (<overlay> = (<unique> [<j>]))
		break
	endif
	<j> = (<j> + 1)
	repeat <array_size>
	if (<j> = <array_size>)
		addarrayelement array = <unique> element = <overlay>
		<unique> = <array>
	endif
	<i> = (<i> + 1)
	repeat (<overlay_array_size> + 1)
	removeparameter array_size
	getarraysize <unique>
	printstruct <unique>
	if (<array_size> > 4)
		return false
	else
		return true
	endif
endscript

script ui_video_editor_check_shortened_clips 
	printf 'ui_video_editor_check_shortened_clips'
	ve_get_clips_entire_length clips = $ve_current_edit_clips
	ve_get_array_end_time array = ($ve_current_edit_effects)
	if (<end_time> > <entire_length>)
		printf 'Trimming effects'
		ve_trim_array_to_length array = ($ve_current_edit_effects) length = <entire_length> min_length = ($video_editor_minimum_effect_length)
		change ve_current_edit_effects = <trimmed_array>
	endif
	ve_get_array_end_time array = ($ve_current_edit_overlays)
	if (<end_time> > <entire_length>)
		printf 'Trimming overlays'
		ve_trim_array_to_length array = ($ve_current_edit_overlays) length = <entire_length> min_length = ($video_editor_minimum_effect_length)
		change ve_current_edit_overlays = <trimmed_array>
	endif
endscript

script ui_video_editor_warning \{text = ""
		title = "Video Editor Error"}
	printf \{'ui_video_editor_warning'}
	if scriptisrunning \{ui_play_preview}
		printf \{'Prevented warning message!'}
		return
	endif
	do_ok_dialog_box {title = <title>
		text = <text>
		text_dims = (800.0, 0.0)
		vmenu_width = 700
		preserve_case
	}
	kill_helper_text
endscript

script ui_video_editor_effect_toggle_hard_in 
	printf \{'ui_video_editor_effect_toggle_hard_in'}
	if video_editor_effect_selected
		blend_in = (1 - (<effect>.blend_in))
		video_editor_modify_selected_effect blend_in = <blend_in>
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_effect_toggle_hard_out 
	printf \{'ui_video_editor_effect_toggle_hard_out'}
	if video_editor_effect_selected
		blend_out = (1 - (<effect>.blend_out))
		video_editor_modify_selected_effect blend_out = <blend_out>
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_effect_change_strength 
	printf \{'ui_video_editor_effect_change_strength'}
	if video_editor_effect_selected
		strength = (<effect>.strength)
		strength = (<strength> + 0.25)
		if (<strength> > 1.0)
			strength = 0.25
		endif
		video_editor_modify_selected_effect strength = <strength>
		ui_create_video_editor_gfx
	endif
endscript

script ui_video_editor_confirm_quit 
	change \{video_editor_focus_reset = 1}
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_video_editor_toggle_marker 
	printf 'ui_video_editor_toggle_marker'
	if ui_video_editor_find_marker time = ($video_timeline_cursor)
		if NOT gotparam add_only
			removearrayelement array = ($ve_current_edit_markers) index = <index>
			change ve_current_edit_markers = <array>
			ui_create_video_editor_gfx
		endif
	else
		getarraysize ($ve_current_edit_markers)
		if (<array_size> < ($video_editor_marker_limit))
			if (($video_timeline_cursor) > ($video_editor_marker_threshold))
				new_marker = [0.0]
				setarrayelement arrayname = new_marker index = 0 newvalue = ($video_timeline_cursor)
				markers = (($ve_current_edit_markers) + <new_marker>)
				change ve_current_edit_markers = <markers>
				ui_video_editor_draw_single_marker marker_time = ($video_timeline_cursor)
			else
				ui_video_editor_warning text = "You need to move the timeline using \\bl to place markers."
			endif
		else
			ui_video_editor_warning text = "You have placed all available markers."
		endif
	endif
endscript

script ui_video_editor_find_marker 
	getarraysize ($ve_current_edit_markers)
	if (<array_size> > 0)
		i = 0
		begin
		marker_time = (($ve_current_edit_markers) [<i>])
		diff = (<time> - <marker_time>)
		if (<diff> < 0.0)
			diff = (<diff> * -1.0)
		endif
		if (<diff> <= ($video_editor_marker_threshold))
			return true index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script ui_video_editor_draw_markers 
	getarraysize <markers>
	time_shown = (($video_timeline_width) / ($video_second_width))
	time_start = ($video_timestart)
	if (<array_size> > 0)
		i = 0
		begin
		marker_time = (<markers> [<i>])
		if (<marker_time> >= <time_start>)
			if (<marker_time> <= (<time_start> + <time_shown>))
				ui_video_editor_draw_single_marker marker_time = <marker_time> parent = <parent>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_video_editor_draw_single_marker \{parent = Video_Editor_Marker_Container}
	x_pos = (<marker_time> * $video_second_width)
	createscreenelement {
		type = spriteelement
		parent = <parent>
		dims = (5.0, 20.0)
		pos = (((1.0, 0.0) * <x_pos>) + (0.0, 10.0))
		rgba = [0 0 255 255]
		z_priority = 14.95
		just = [center top]
	}
endscript

script ui_video_editor_place_marker_from_playback 
	printf \{'ui_video_editor_place_marker_from_playback'}
	ui_video_editor_toggle_marker \{add_only}
endscript

script ui_video_editor_draw_debug_beat_lines 
	if ($ve_debug_score = 1)
		if ($video_editor_other_selected = -1)
			if (($video_editor_menu_array [$video_editor_current_selection]).pane = Video_Editor_Audio_Pane)
				if screenelementexists id = Video_Editor_Debug_Audio_Container
					destroyscreenelement id = Video_Editor_Debug_Audio_Container
					destroyscreenelement id = Video_Editor_Debug_Clips_Container
				endif
				createscreenelement {
					type = containerelement
					id = Video_Editor_Debug_Audio_Container
					parent = Video_Editor_Timeline_Container_Over
				}
				createscreenelement {
					type = containerelement
					id = Video_Editor_Debug_Clips_Container
					parent = Video_Editor_Timeline_Container_Vid
				}
				ve_score_draw_audio_beats {
					parent = Video_Editor_Debug_Audio_Container
					audio = ($ve_current_edit_audio)
					time_start = ($video_timestart)
				}
				ve_score_draw_clip_beats {
					parent = Video_Editor_Debug_Clips_Container
					clips = ($ve_current_edit_clips)
					time_start = ($video_timestart)
				}
			endif
		endif
	endif
endscript

script ui_ve_add_clip_to_timeline 
	clips_before = ($ve_current_edit_clips)
	ve_add_clip_to_edit clips = ($ve_current_edit_clips) add_clip = <clip_name>
	change ve_current_edit_clips = <clips>
	getarraysize $ve_current_edit_clips
	change video_cursor_column = (<array_size> - 1)
	video_editor_update_timeline_to_selected
	if NOT ui_video_editor_has_required_pakman_map save_edit = 1
		return
	endif
	if NOT ui_check_clip_loaded name = <clip_name>
		change ve_current_edit_clips = <clips_before>
		change video_cursor_column = 0
		getarraysize <clips_before>
		if (<array_size> > 0)
			video_editor_update_timeline_to_selected
		endif
		getarraysize ($ve_current_edit_clips)
		if (<array_size> = 0)
			change ve_current_edit_index = -1
			ui_change_state state = UIstate_video_editor_Main
		else
			ui_change_state state = UIstate_video_editor_Edit_View
		endif
		return
	endif
	if NOT ui_video_editor_load_required_zones
		return
	endif
	ui_video_editor_new_first_clip
	getarraysize ($ve_current_edit_clips)
	if (<array_size> = 1)
		getscreenelementdims id = Video_Editor_Properties_Container
		video_editor_create_pane ($video_editor_other_panes [0]) <...> texture = cap_iconedit z_priority = 5
		removeparameter width
		removeparameter height
		change video_editor_pane_selection = 0
	endif
	ui_video_editor_pick_good_zoom clip = (($ve_current_edit_clips) [($video_cursor_column)])
	video_editor_ensure_selected_on_screen
	ui_create_video_editor_gfx
endscript

script kill_helper_text 
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
endscript

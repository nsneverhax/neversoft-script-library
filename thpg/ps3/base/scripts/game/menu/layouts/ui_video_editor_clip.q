video_editor_chosen_clip = {
}
video_editor_in_video_editor = 0
video_editor_camera_from_edit = 0
video_editor_edit_from_camera = 0
video_editor_dirty_flag = 0

script ui_create_video_editor_main 
	kill_start_key_binding
	printf \{"UI: ui_create_video_editor_main"}
	spawnscriptnow \{ui_create_video_editor_main_spawned}
endscript

script ui_create_video_editor_main_spawned 
	ve_fix_skater_for_ve_entry
	Destroy_MenuFx
	Do_MenuFx_Video_Editor fxparam = ($video_menu_tod_manager)
	if screenelementexists id = pausemenu_icon_movie
		destroyscreenelement id = pausemenu_icon_movie
	endif
	if screenelementexists id = pause_map_container
		doscreenelementmorph id = pause_map_container alpha = 0.0
	endif
	change video_editor_focus_reset = 1
	if ($video_editor_in_video_editor = 0)
		if screenelementexists id = net_view_goals_searching_cont
			destroyscreenelement id = net_view_goals_searching_cont
		endif
		net_view_goals_create_searching_text {
			text = "Please Wait..."
			scale = 0.75
			parent = root_window
			id = ve_enter_animation_icon
		}
		change ve_current_edit_index = -1
		change video_editor_dirty_flag = 0
		ve_enter_video_editor
		if screenelementexists id = ve_enter_animation_icon
			runscriptonscreenelement id = ve_enter_animation_icon net_view_goals_searching_fade_out_and_die
		endif
	endif
	if screenelementexists id = video_editor_main_anchor
		destroyscreenelement id = video_editor_main_anchor
	endif
	if ($ve_current_edit_index >= 0)
		edit_idx = ($ve_current_edit_index)
		change ve_current_edit_index = -1
		generic_ui_destroy
		ui_create_video_editor_view_edits focus_index = <edit_idx>
		return
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = video_editor_main_anchor
		pos = (0.0, 0.0)
		just = [left top]
		dims = (1280.0, 700.0)
		child_anchor = [center center]
		z_priority = 10
	}
	ui_create_messy_background {
		parent = video_editor_main_anchor
		dims = (800.0, 710.0)
		pos = (-375.0, -400.0)
		z_priority = -2
		rot_angle = 1
	}
	createscreenelement {
		type = spriteelement
		parent = video_editor_main_anchor
		texture = menu_headerbar
		rgba = [200 70 70 255]
		pos = (20.0, -182.0)
		dims = (690.0, 110.0)
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = video_editor_main_anchor
		texture = white
		rgba = [0 0 0 0]
		pos = (0.0, -25.0)
		dims = (700.0, 400.0)
		z_priority = 9
	}
	createscreenelement {
		type = textelement
		parent = video_editor_main_anchor
		font = text_a1
		text = "video editor"
		scale = (1.2, 1.1)
		pos = (320.0, -235.0)
		just = [right top]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	get_filming_in_area
	Get_Area_Data area = <area>
	getlowercasestring (<area_data>.text)
	formattext textname = area_text "filming in: %z" z = <lowercasestring>
	createscreenelement {
		type = textelement
		parent = video_editor_main_anchor
		font = text_a1
		text = <area_text>
		scale = (0.9, 0.8)
		rgba = [180 180 180 255]
		pos = (-270.0, -175.0)
		just = [left top]
	}
	createscreenelement {
		type = spriteelement
		parent = video_editor_main_anchor
		texture = cap_whitenoise
		pos = (100.0, -230.0)
		just = [center center]
		dims = (500.0, 105.0)
		rgba = [240 240 240 255]
		rot_angle = RandomNoRepeat (@ 6 @ 3 @ 178 @ 185 @ -4 @ -3 @ -179 @ -184 )
		z_priority = 9.1
	}
	createscreenelement {
		type = spriteelement
		parent = video_editor_main_anchor
		texture = cap_whitenoise
		pos = (280.0, 45.0)
		just = [center center]
		dims = (220.0, 200.0)
		rgba = [220 220 220 150]
		rot_angle = RandomNoRepeat (@ -60 @ -55 @ -90 @ -80 )
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = video_editor_main_anchor
		texture = menu_goal_underline
		rgba = [100 100 100 255]
		pos = (20.0, -30.0)
		dims = (650.0, 8.0)
		z_priority = 10
	}
	if isxenon
		createscreenelement {
			type = spriteelement
			parent = video_editor_main_anchor
			texture = menu_goal_underline
			rgba = [100 100 100 255]
			pos = (20.0, 110.0)
			dims = (-650.0, -8.0)
			z_priority = 10
		}
	else
		createscreenelement {
			type = spriteelement
			parent = video_editor_main_anchor
			texture = menu_goal_underline
			rgba = [100 100 100 255]
			pos = (20.0, 70.0)
			dims = (-650.0, -8.0)
			z_priority = 10
		}
	endif
	ui_create_video_editor_background parent = video_editor_main_anchor pos = (-640.0, -360.0)
	createscreenelement {
		type = vmenu
		parent = video_editor_main_anchor
		id = video_editor_main_vmenu
		pos = (-240.0, -100.0)
		just = [center top]
		internal_just = [center top]
		event_handlers = [
			{pad_back ui_video_editor_exit}
			{pad_back generic_pause_exit_sound}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
		]
	}
	add_video_menu_item {
		text = "Record New Clip"
		pad_choose_script = ui_video_editor_main_new_clip
	}
	VideoEditorFunc get_clip_count
	if (<count> = 0)
		no_clips_flags = {not_focusable}
	endif
	VideoEditorFunc get_edit_count
	if (<count> = 0)
		no_edits_flags = {not_focusable}
	endif
	add_video_menu_item {
		text = "Create New Edit"
		pad_choose_script = ui_video_editor_main_new_edit
		dims = (100.0, 60.0)
		<no_clips_flags>
	}
	add_video_menu_item {
		text = "Recorded Clips"
		pad_choose_script = ui_create_video_editor_view_clips
		<no_clips_flags>
	}
	if isxenon
		add_video_menu_item {
			text = "Saved Edits"
			pad_choose_script = ui_create_video_editor_view_edits
			<no_edits_flags>
		}
		add_video_menu_item {
			text = "View Finalized Edits"
			pad_choose_script = ui_video_editor_load_render
			dims = (100.0, 60.0)
		}
	else
		add_video_menu_item {
			text = "Saved Edits"
			pad_choose_script = ui_create_video_editor_view_edits
			<no_edits_flags>
			dims = (100.0, 60.0)
		}
	endif
	add_video_menu_item {
		text = "Purchase Video Upgrades"
		pad_choose_script = ui_video_editor_purchase_menu
	}
	add_video_menu_item {
		text = "video editor tutorials"
		pad_choose_script = ui_video_editor_tuitorials
	}
	if ($video_editor_dirty_flag = 1)
		add_video_menu_item {
			text = "Exit Video Editor and save changes"
			pad_choose_script = ui_video_editor_exit
			highlight_add = (60.0, 0.0)
		}
	else
		add_video_menu_item {
			text = "Exit Video Editor"
			pad_choose_script = ui_video_editor_exit
		}
	endif
	launchevent type = focus target = video_editor_main_vmenu
	create_helper_text {
		id = video_editor_main_anchor
		helper_text_elements = [
			{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
		]
	}
endscript

script ui_video_editor_tuitorials 
	make_cas_menu {
		menu_id = video_editor_main_anchor
		vmenu_id = video_editor_main_vmenu
		title = "video editor tutorials"
		pad_back_script = ui_create_video_editor_main
		CasMenu
		MenuOffset = (125.0, -10.0)
		cas_pos = (210.0, 140.0)
		highlight_add = (-20.0, 0.0)
		width = 750
	}
	<tutorials> = [
		{name = "VE Basic Clips" descrip = "How to insert a clip." video = $VE_Insert_Remove_Video}
		{name = "VE Basic Trim" descrip = "How to trim a clip." video = $VE_Trim02_Video}
		{name = "VE Adv ScreenFX" descrip = "Adding FX to an edit." video = $VE_FX_Video}
		{name = "VE Adv Overlays" descrip = "Adding overlays to an edit." video = $VE_Overlay_Insert_Move_Video}
		{name = "VE Adv Submit" descrip = "Assemble footage for Volcom." video = $VE_Scoring_Video}
	]
	getarraysize <tutorials>
	<index> = 0
	begin
	<tutorial> = (<tutorials> [<index>])
	<text_color> = ($cas_color_scheme.text_color_2)
	add_cas_menu_item {
		text = (<tutorial>.name)
		cas_heading = <cas_heading>
		pad_choose_script = tutorial_video_play
		pad_choose_params = {movie = (<tutorial>.video)}
		additional_focus_script = edit_tricks_sub_menu_item_focus
		additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
		additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
		additional_unfocus_params = {color = ($cas_color_scheme.text_color_2)}
	}
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		font = text_a1
		text = (<tutorial>.descrip)
		scale = (0.4, 0.45000002)
		pos = (75.0, 0.0)
		rgba = <text_color>
		local_id = column_2
		z_priority = 30
		just = [left center]
	}
	<index> = (<index> + 1)
	repeat <array_size>
	assignalias id = video_editor_main_anchor alias = current_menu_anchor
	assignalias id = video_editor_main_vmenu alias = current_menu
	cas_menu_finish helper_text = $generic_helper_text
endscript

script ui_create_video_editor_background 
	if screenelementexists id = video_editor_menu_background
		return
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = video_editor_menu_background
		pos = (0.0, 0.0)
		just = [left top]
		dims = (1280.0, 700.0)
		child_anchor = [center center]
	}
	getscreenelementposition id = <id> absolute
	printstruct <...>
	<container_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = white
		rgba = [0 0 0 210]
		just = [center center]
		pos = (0.0, -350.0)
		dims = (1280.0, 300.0)
		z_priority = -50
	}
	tilesprite {
		texture = map_bg_news
		parent = <container_id>
		tile_dims = (1800.0, 300.0)
		dims = (600.0, 600.0)
		pos = (-800.0, -830.0)
		sprite_props = {rgba = [150 70 70 100]}
		container_props = {z_priority = -30.0}
	}
	runscriptonscreenelement tilespriteloop id = <id> params = {move_x = -2 move_y = 0}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = white
		rgba = [0 0 0 210]
		just = [center center]
		pos = (0.0, 400.0)
		dims = (1280.0, 300.0)
		z_priority = -50
	}
	tilesprite {
		texture = map_bg_film
		parent = <container_id>
		tile_dims = (1700.0, 400.0)
		dims = (480.0, 480.0)
		pos = (-1100.0, -230.0)
		sprite_props = {rgba = [0 0 0 255]}
		container_props = {z_priority = -28.0}
	}
	runscriptonscreenelement tilespriteloop id = <id> params = {move_x = 3 move_y = 0}
	tilesprite {
		texture = map_bg_news
		parent = <container_id>
		tile_dims = (1800.0, 300.0)
		dims = (600.0, 600.0)
		pos = (-800.0, 250.0)
		sprite_props = {rgba = [150 70 70 100]}
		container_props = {z_priority = -30.0}
	}
	runscriptonscreenelement tilespriteloop id = <id> params = {move_x = -2 move_y = 0}
endscript

script ui_destroy_video_editor_background 
	if screenelementexists \{id = video_editor_menu_background}
		destroyscreenelement \{id = video_editor_menu_background}
	endif
endscript

script add_video_menu_item text = "" pad_choose_script = nullscript dims = (100.0, 40.0) params = {} highlight_add = (0.0, 0.0)
	if gotparam id
		<params> = {<params> id = <id>}
	endif
	if gotparam not_focusable
		<params> = {<params> not_focusable alpha = 0.5}
	endif
	createscreenelement {
		type = containerelement
		parent = video_editor_main_vmenu
		<params>
		dims = <dims>
		just = [center center]
		child_anchor = [center top]
		event_handlers = [
			{focus video_menu_focus}
			{unfocus video_menu_unfocus}
			{pad_choose video_menu_choose params = {pad_choose_script = <pad_choose_script>}}
		]
	}
	<parent> = <id>
	if gotparam extra_text
		formattext textname = text "%a - %b" a = <text> b = <extra_text>
	endif
	getlowercasestring <text>
	<text> = <lowercasestring>
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = text
		font = text_a1
		text = <text>
		scale = (0.8, 0.7)
		rgba = [100 100 100 255]
		just = [left center]
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = highlight
		texture = menu_highlight
		pos = ((220.0, -3.0) + (<highlight_add> / 2))
		dims = ((500.0, 50.0) + <highlight_add>)
		rgba = [240 240 240 255]
		z_priority = 12
		alpha = 0.0
		flip_h
	}
endscript

script video_menu_focus 
	gettags
	setscreenelementprops {
		id = {<id> child = text}
		rgba = [200 70 70 255]
	}
	doscreenelementmorph {
		id = {<id> child = highlight}
		alpha = 1.0
	}
endscript

script video_menu_unfocus 
	gettags
	setscreenelementprops {
		id = {<id> child = text}
		rgba = [100 100 100 255]
	}
	doscreenelementmorph {
		id = {<id> child = highlight}
		alpha = 0.0
	}
endscript

script video_menu_choose 
	theme_menu_pad_choose_sound
	if screenelementexists \{id = video_editor_main_anchor}
		destroyscreenelement \{id = video_editor_main_anchor}
	endif
	<pad_choose_script>
endscript

script ui_create_video_editor_view_clips 
	VideoEditorFunc get_clip_count
	params = {}
	if (<count> > 1)
		params = {scrolling}
	endif
	Destroy_MenuFx
	Do_MenuFx_Video_Editor fxparam = ($video_menu_tod_manager)
	kill_start_key_binding
	make_cas_menu {
		menu_id = video_editor_main_anchor
		vmenu_id = video_editor_main_vmenu
		title = "VIEW CLIPS"
		pad_back_script = ui_create_video_editor_main
		CasMenu
		MenuOffset = (300.0, -10.0)
		cas_pos = (310.0, 140.0)
		scroll_bar_offset = (155.0, 10.0)
		<params>
	}
	ui_create_video_editor_background parent = video_editor_main_anchor pos = (0.0, 0.0)
	if (<count> > 0)
		add_cas_menu_item {
			text = "PHILLY CLIPS:"
			cas_heading
		}
		ui_ve_add_clips_to_menu area = Area_Philly
		add_cas_menu_item {
			text = "BALTIMORE CLIPS:"
			cas_heading
		}
		ui_ve_add_clips_to_menu area = Area_Baltimore
		add_cas_menu_item {
			text = "DC CLIPS:"
			cas_heading
		}
		ui_ve_add_clips_to_menu area = Area_DC
		add_cas_menu_item {
			text = "SKATE LOUNGE CLIPS:"
			cas_heading
		}
		ui_ve_add_clips_to_menu area = Area_Crib
	else
		add_cas_menu_item {
			text = "NO SAVED CLIPS"
			cas_heading
		}
	endif
	if gotparam focus_name
		i = 0
		if (<count> > 0)
			begin
			if VideoEditorFunc get_clip index = <i>
				if (<focus_name> = (<clip>.name))
					focus_index = <i>
				endif
			endif
			i = (<i> + 1)
			repeat <count>
		endif
	endif
	add_cas_menu_item {
		text = "back"
		pad_choose_script = ui_create_video_editor_main
	}
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m7 DELETE CLIP"}
				{text = "\\m8 RENAME CLIP"}
			]
		}
		index = <focus_index>
	}
endscript

script ui_ve_add_clips_to_menu 
	VideoEditorFunc get_clip_count
	i = 0
	begin
	VideoEditorFunc get_clip index = <i>
	if (<area> = (<clip>.area))
		Get_Area_Data area = (<clip>.area)
		add_cas_menu_item {
			text = (<clip>.text)
			pad_choose_script = ui_video_editor_main_choose_clip
			pad_choose_params = {clip = {name = (<clip>.name) text = (<clip>.text) index = <i>}}
			additional_focus_script = ui_video_editor_view_clip_focus
			additional_focus_params = {index = <i>}
			tag_grid_x = <i>
		}
		added = 1
	endif
	i = (<i> + 1)
	repeat <count>
	if NOT gotparam added
		add_cas_menu_item {
			text = "none"
			not_focusable
		}
	endif
	return focus_index = <focus_index>
endscript

script ui_video_editor_view_clip_focus 
	setprops {
		event_handlers = [
			{pad_square ui_video_editor_clip_delete_clip params = {index = <index>}}
			{pad_space ui_video_editor_clip_rename_clip params = {index = <index>}}
		]
		replace_handlers
	}
endscript

script ui_create_video_editor_view_edits 
	VideoEditorFunc get_edit_count
	params = {}
	if (<count> > 1)
		params = {scrolling}
	endif
	change ve_current_edit_index = -1
	kill_start_key_binding
	make_cas_menu {
		menu_id = video_editor_main_anchor
		vmenu_id = video_editor_main_vmenu
		title = "VIEW EDITS"
		pad_back_script = ui_create_video_editor_main
		CasMenu
		MenuOffset = (300.0, -10.0)
		cas_pos = (310.0, 140.0)
		scroll_bar_offset = (155.0, 10.0)
		<params>
	}
	ui_create_video_editor_background
	if (<count> > 0)
		add_cas_menu_item {
			text = "PHILLY EDITS:"
			cas_heading
		}
		ui_ve_add_edits_to_menu area = Area_Philly
		add_cas_menu_item {
			text = "BALTIMORE EDITS:"
			cas_heading
		}
		ui_ve_add_edits_to_menu area = Area_Baltimore
		add_cas_menu_item {
			text = "DC EDITS:"
			cas_heading
		}
		ui_ve_add_edits_to_menu area = Area_DC
		add_cas_menu_item {
			text = "SKATE LOUNGE EDITS:"
			cas_heading
		}
		ui_ve_add_edits_to_menu area = Area_Crib
	else
		add_cas_menu_item {
			text = "NO SAVED EDITS"
			cas_heading
		}
	endif
	add_cas_menu_item {
		text = "BACK"
		pad_choose_script = ui_create_video_editor_main
	}
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
				{text = "\\m7 DELETE EDIT"}
				{text = "\\m8 RENAME EDIT"}
			]
		}
		index = <focus_index>
	}
endscript

script ui_ve_add_edits_to_menu 
	edit_area = <area>
	VideoEditorFunc get_edit_count
	i = 0
	begin
	VideoEditorFunc get_edit index = <i>
	if ve_get_clips_area clips = (<edit>.clips)
		if (<area> = <edit_area>)
			Get_Area_Data area = <area>
			add_cas_menu_item {
				text = (<edit>.text)
				pad_choose_script = ui_video_editor_main_choose_edit
				pad_choose_params = {index = <i>}
				additional_focus_script = ui_video_editor_view_edit_focus
				additional_focus_params = {index = <i>}
				tag_grid_x = <i>
			}
			added = 1
		endif
	endif
	i = (<i> + 1)
	repeat <count>
	if NOT gotparam added
		add_cas_menu_item {
			text = "none"
			not_focusable
		}
	endif
endscript

script ui_destroy_video_editor_main 
	printf \{"UI: ui_destroy_video_editor_main"}
	generic_ui_destroy
endscript

script ui_video_editor_view_edit_focus 
	setprops {
		event_handlers = [
			{pad_square ui_video_editor_delete_edit params = {index = <index>}}
			{pad_space ui_video_editor_edit_rename_edit params = {index = <index>}}
		]
		replace_handlers
	}
endscript

script ve_maybe_autosave_changed_stuff 
	if ($video_editor_dirty_flag = 1)
		change \{video_editor_dirty_flag = 0}
		do_autosave \{immediate
			suspend_ui}
	endif
endscript

script ui_video_editor_exit 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	if screenelementexists id = video_editor_main_anchor
		launchevent type = unfocus target = video_editor_main_anchor
	endif
	ve_maybe_autosave_changed_stuff
	ve_exit_video_editor
	if screenelementexists id = video_editor_main_anchor
		destroyscreenelement id = video_editor_main_anchor
	endif
	ve_fix_missing_skater_board
	restore_start_key_binding
	if NOT isassetloaded name = `zones/z_peds/z_peds.qb`
		scriptassert 'PEDS DIDNT LOAD BACK IN!'
	endif
	setbuttoneventmappings unblock_menu_input
	ui_destroy_video_editor_background
	ui_change_state state = uistate_pausemenu
endscript

script ui_video_editor_main_choose_clip 
	change video_editor_chosen_clip = <clip>
	ui_change_state \{state = UIstate_video_editor_Clip_Menu}
endscript

script ui_video_editor_main_new_clip 
	begin
	if ($sysnotify_wait_in_progress = 0)
		break
	endif
	wait 1 gameframe
	repeat
	ve_remove_blackout
	if game_progress_check_valid_save
		kill_helper_text
		begin
		if ($sysnotify_wait_in_progress = 0)
			break
		endif
		wait 1 gameframe
		repeat
		if ve_can_create_new_clip
			if MC_SpaceForNewFile filetype = videoclip
				get_filming_in_area
				if ve_in_recordable_area area = <area>
					if NOT ($ve_hard_load_zone = none)
						ve_show_loading_screen
						ve_back_to_hard_load_last_zone action = ui_video_editor_main_new_clip
						if IsInCrib
							crib_change_to_career_theme_ve
						endif
						ve_hide_loading_screen
					endif
					if ve_in_recordable_area
						ui_destroy_video_editor_background
						generic_ui_destroy
						pause_menu_fmv_kill
						killskatercamanim all
						goal_trigger_dialog_kill
						unpause_game_and_destroy_pause_menu
						ve_fix_skater_slomo
						ve_backup_node_flags
						ve_start_recording_clip area = <area> cyclic = true temporarily_allow_streaming = 1
					else
						ui_video_editor_record_area_bad {
							state = UIstate_video_editor_Main
						}
					endif
				else
					ui_video_editor_record_area_bad {
						state = UIstate_video_editor_Main
					}
				endif
			else
				create_dialog_box {title = "Video Recorder"
					text = "No space to save new clips. Please delete some existing data."
					buttons = [{text = "ok" pad_choose_script = ui_video_editor_main_new_clip_abort}
					]
					text_dims = (280.0, 0.0)
				}
			endif
		else
			create_dialog_box {title = "Video Recorder"
				text = "Have maximum clips, delete some to make room."
				buttons = [{text = "ok" pad_choose_script = ui_video_editor_main_new_clip_abort}
				]
				text_dims = (280.0, 0.0)
			}
		endif
	else
		ui_change_state state = UIstate_video_editor_Main
	endif
endscript

script ui_video_editor_main_new_clip_abort 
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_video_editor_main_choose_edit 
	change ve_current_edit_index = <index>
	change \{ve_current_edit_markers = [
		]}
	generic_ui_destroy
	killallmovies \{blocking}
	VideoEditorFunc get_edit index = <index>
	ve_validate_clips clips = (<edit>.clips)
	ui_change_state \{state = UIstate_video_editor_Edit_View}
endscript

script ui_video_editor_main_new_edit 
	if ve_can_create_new_edit
		ui_destroy_video_editor_background
		ve_new_edit
		change ve_current_edit_index = <index>
		change ve_current_edit_markers = []
		ui_change_state state = UIstate_video_editor_Edit_View
	else
		create_dialog_box {title = "Video Recorder"
			text = "Have maximum edits, delete some to make room."
			buttons = [{text = "ok" pad_choose_script = ui_video_editor_main_new_edit_abort}
			]
			text_dims = (280.0, 0.0)
		}
	endif
endscript

script ui_video_editor_main_new_edit_abort 
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_create_video_editor_clip_menu 
	printf 'ui_create_video_editor_clip_menu'
	VideoEditorFunc get_clip name = (($video_editor_chosen_clip).name)
	<back> = {pad_back_script = ui_create_video_editor_view_clips pad_back_params = {focus_name = (($video_editor_chosen_clip).name)}}
	if ($video_editor_camera_from_edit = 1)
		ve_push_editing_buss
		<back> = {pad_back_script = ui_video_edit_return_to_edit}
	endif
	Destroy_MenuFx
	Do_MenuFx_Video_Editor fxparam = ($video_menu_tod_manager)
	kill_start_key_binding
	make_cas_menu {
		menu_id = video_editor_clip_anchor
		vmenu_id = video_editor_clip_vmenu
		title = (<clip>.text)
		<back>
		CasMenu
		MenuOffset = (300.0, -10.0)
		cas_pos = (310.0, 140.0)
		scroll_bar_offset = (155.0, 10.0)
	}
	ui_create_video_editor_background
	add_cas_menu_item {
		text = "PLAYBACK"
		cas_heading
	}
	add_cas_menu_item {
		text = "Play Clip"
		pad_choose_script = ui_video_editor_clip_play_clip
	}
	if structurecontains structure = <clip> user_camera
		if ((<clip>.user_camera) = 1)
			add_cas_menu_item {
				text = "Play Clip - User Camera"
				pad_choose_script = ui_video_editor_clip_play_clip
				pad_choose_params = {clip_camera = user}
			}
		endif
	endif
	add_cas_menu_item {
		text = "USER CAMERA"
		cas_heading
	}
	add_cas_menu_item {
		text = "Record User Camera"
		pad_choose_script = ui_video_editor_clip_rerecord_camera
		pad_choose_params = {slomo = 1.0 capture_update_interval = 1}
	}
	add_cas_menu_item {
		text = "Record User Camera - Slomo"
		pad_choose_script = ui_video_editor_clip_rerecord_camera
		pad_choose_params = {slomo = 0.5 capture_update_interval = 2}
	}
	if ($video_editor_camera_from_edit = 1)
		add_cas_menu_item {
			text = "back"
			pad_choose_script = ui_video_edit_return_to_edit
		}
	else
		add_cas_menu_item {
			text = "back"
			pad_choose_script = ui_create_video_editor_view_clips
			pad_choose_params = {focus_name = (($video_editor_chosen_clip).name)}
		}
	endif
	cas_menu_finish
endscript

script ui_video_edit_return_to_edit 
	change \{video_editor_camera_from_edit = 0}
	change \{video_editor_edit_from_camera = 1}
	ui_change_state \{state = UIstate_video_editor_Edit_View}
endscript

script ui_destroy_video_editor_clip_menu 
	printf \{'ui_destroy_video_editor_clip_menu'}
	generic_ui_destroy
endscript

script ui_video_editor_clip_play_clip \{clip_camera = `default`}
	ui_destroy_video_editor_background
	if ui_check_clip_loaded name = (($video_editor_chosen_clip).name) hide_lods
		spawnscriptlater ve_play_clips params = {
			clips = [{name = (($video_editor_chosen_clip).name) clip_camera = <clip_camera>}]
			end_state = UIstate_video_editor_Clip_Menu
			expanded_ui
		}
	else
		ui_change_state \{state = UIstate_video_editor_Main}
	endif
endscript

script ui_video_editor_clip_delete_clip 
	generic_ui_destroy
	if gotparam index
		if VideoEditorFunc get_clip index = <index>
			clip_name = (<clip>.name)
		endif
	else
		clip_name = (($video_editor_chosen_clip).name)
	endif
	create_dialog_box {
		title = "Delete Clip?"
		text = "Are you sure? Deleted clips can not be recovered.\\nAlso, any references to this clip in existing edits will be removed."
		pad_back_script = ui_video_editor_clip_delete_clip_deny
		buttons = [
			{text = "no" pad_choose_script = ui_video_editor_clip_delete_clip_deny pad_choose_params = {clip_name = <clip_name>}}
			{text = "yes" pad_choose_script = ui_video_editor_clip_delete_clip_confirm pad_choose_params = {clip_name = <clip_name>}}
		]
		no_helper_text
		preserve_case
	}
	block type = ve_delete_dialog_done
	if VideoEditorFunc get_clip name = <clip_name>
		ui_create_video_editor_view_clips focus_index = <index>
	else
		ui_create_video_editor_view_clips
	endif
endscript

script ui_video_editor_clip_delete_clip_confirm 
	change \{video_editor_dirty_flag = 1}
	if gotparam \{clip_name}
		if delete_extra_saved_data filetype = videoclip name = <clip_name>
			ve_delete_clip name = <clip_name>
		endif
	endif
	dialog_box_exit
	unpausespawnedscript \{ui_video_editor_clip_delete_clip}
	broadcastevent \{type = ve_delete_dialog_done}
endscript

script ui_video_editor_clip_delete_clip_deny 
	dialog_box_exit
	unpausespawnedscript \{ui_video_editor_clip_delete_clip}
	broadcastevent \{type = ve_delete_dialog_done}
endscript

script ui_video_editor_clip_rename_clip 
	generic_ui_destroy
	if gotparam index
		if VideoEditorFunc get_clip index = <index>
			clip_name = (<clip>.name)
		endif
	else
		clip_name = (($video_editor_chosen_clip).name)
	endif
	VideoEditorFunc get_clip name = <clip_name>
	create_onscreen_keyboard {
		text = (<clip>.text)
		keyboard_title = "Rename Video Clip"
		min_length = 1
		max_length = 20
		keyboard_done_script = ui_video_editor_clip_rename_clip_confirm
		keyboard_cancel_script = ui_video_editor_clip_rename_clip_deny
		keyboard_done_params = {index = <index> clip_name = <clip_name>}
		keyboard_cancel_params = {index = <index> clip_name = <clip_name>}
		allow_cancel
	}
endscript

script ui_video_editor_clip_rename_clip_confirm 
	change \{video_editor_dirty_flag = 1}
	keyboard_current_string :text_getstring
	VideoEditorFunc get_clip name = <clip_name>
	new_clip = {
		<clip>
		text = <string>
	}
	VideoEditorFunc set_clip name = <clip_name> clip = <new_clip>
	VideoEditorFunc get_clip name = <clip_name>
	change video_editor_chosen_clip = <clip>
	ui_create_video_editor_view_clips focus_index = <index>
endscript

script ui_video_editor_clip_rename_clip_deny 
	ui_create_video_editor_view_clips focus_index = <index>
endscript

script ui_video_editor_edit_rename_edit 
	generic_ui_destroy
	VideoEditorFunc get_edit index = <index>
	create_onscreen_keyboard {
		text = (<edit>.text)
		keyboard_title = "Rename Video Edit"
		min_length = 1
		max_length = 20
		keyboard_done_script = ui_video_editor_edit_rename_edit_confirm
		keyboard_cancel_script = ui_video_editor_edit_rename_edit_deny
		keyboard_cancel_params = {index = <index>}
		keyboard_done_params = {index = <index>}
		allow_cancel
	}
endscript

script ui_video_editor_edit_rename_edit_confirm 
	change \{video_editor_dirty_flag = 1}
	keyboard_current_string :text_getstring
	VideoEditorFunc get_edit index = <index>
	new_edit = {
		<edit>
		text = <string>
	}
	VideoEditorFunc set_edit index = <index> edit = <new_edit>
	ui_create_video_editor_view_edits focus_index = <index>
endscript

script ui_video_editor_edit_rename_edit_deny 
	ui_create_video_editor_view_edits focus_index = <index>
endscript

script ui_video_editor_delete_edit 
	printf "For some reason create_dialog_box won't work when deleting an edit." channel = ui
	if NOT gotparam index
		return
	endif
	generic_ui_destroy
	create_dialog_box {
		title = "Delete Entire Edit?"
		text = "are you sure? deleted edits can not be recovered."
		buttons = [
			{text = "no" pad_choose_script = ui_video_editor_delete_edit_deny pad_choose_params = {index = <index>}}
			{text = "yes" pad_choose_script = ui_video_editor_delete_edit_confirm pad_choose_params = {index = <index>}}
		]
		no_helper_text
		vmenu_width = 500
		text_dims = (600.0, 0.0)
	}
endscript

script ui_video_editor_delete_edit_confirm 
	change \{video_editor_dirty_flag = 1}
	VideoEditorFunc get_edit index = <index>
	VideoEditorFunc remove_edit name = (<edit>.name)
	change \{video_delete_edit = 1}
	change \{video_editor_other_selected = -1}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 5}
	ui_create_video_editor_view_edits
endscript

script ui_video_editor_delete_edit_deny 
	destroy_dialog_box
	ui_create_video_editor_view_edits force_index = <index>
endscript

script ui_video_editor_clip_rerecord_camera \{slomo = 1.0
		capture_update_interval = 1}
	printf \{'ui_video_editor_clip_rerecord_camera'}
	ui_destroy_video_editor_background
	if ui_check_clip_loaded name = (($video_editor_chosen_clip).name) hide_lods
		ve_rerecord_camera {
			name = (($video_editor_chosen_clip).name)
			camera_rec_name = ($ve_rec_clip_name)
			capture_update_interval = <capture_update_interval>
			slomo = <slomo>
			end_state = UIstate_video_editor_camera_recorded_menu
		}
	else
		ui_change_state \{state = UIstate_video_editor_Clip_Menu}
	endif
endscript
video_clip_saving_textname = ""
video_clip_saving_checksum = none
video_clip_saving_team_goal_clip = 0

script ui_video_editor_save_clip_to_mc 
	change video_editor_dirty_flag = 1
	ve_free_up_scratch_heap
	if gotparam slot
		change ve_save_clip_slot = <slot>
	endif
	destroy_pause_menu
	if NOT gotparam checksum
		VideoEditorFunc get_new_clip_id
		manglechecksums a = <new_clip_id> b = 0
		checksum = <mangled_id>
		if NOT gotparam textname
			formattext textname = textname "Video Clip %d" d = <new_clip_id>
		endif
	endif
	change video_clip_saving_checksum = <checksum>
	if NOT gotparam textname
		scriptassert 'Need a textname!'
	endif
	printstruct <...>
	change video_clip_saving_textname = <textname>
	casttointeger checksum
	formattext textname = textfilename '%d' d = <checksum> integer_width = 6
	setsavefilename filetype = videoclip name = <textfilename>
	change RetryScript = ui_video_editor_save_clip_to_mc_retry
	change abortscript = ui_video_editor_save_clip_to_mc_abort
	change DoneScript = ui_video_editor_save_clip_to_mc_done
	change savingorloading = saving
	killallmovies blocking
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	if ($video_clip_saving_team_goal_clip = 1)
		if ($ve_saving_add_user_cam = 1)
			usepaddingslot = always
		else
			usepaddingslot = ifpossible
		endif
		printstruct <...>
	endif
	if ($memcard_using_new_save_system = 1)
		check_card no_message filetype = videoclip save ValidateForAutoSave = 1 force = <force> saving_extra_data
		ingame_quicksave filetype = videoclip delete_fail_is_okay no_pools filename = <textfilename> suspend_ui usepaddingslot = <usepaddingslot>
	else
		check_card filetype = videoclip save
		ingame_quicksave filetype = videoclip delete_fail_is_okay no_pools
	endif
endscript

script ui_video_editor_save_clip_to_mc_done 
	printf 'ui_video_editor_save_clip_to_mc_done'
	printstruct <...>
	<in_goal> = false
	if gman_getactivatedgoalid
		<in_goal> = true
	endif
	if ($ve_saving_add_user_cam = 0)
		ve_add_clip_to_career_profile name = ($video_clip_saving_checksum) text = ($video_clip_saving_textname)
	endif
	ve_restore_scratch_heap
	setsavefilename filetype = videoclip clear
	change video_clip_saving_textname = ""
	change video_clip_saving_checksum = none
	change ve_save_clip_slot = -1
	change ve_saving_add_user_cam = 0
	change video_clip_saving_team_goal_clip = 0
	if (<in_goal> = true)
		if ($video_editor_camera_from_edit = 0)
			ui_change_state state = UIstate_goal_film_clip_options
		else
			ui_video_edit_return_to_edit
		endif
	else
		if ($video_editor_camera_from_edit = 0)
			ui_change_state state = UIstate_video_editor_Main
		else
			ui_video_edit_return_to_edit
		endif
	endif
endscript

script ui_video_editor_save_clip_to_mc_abort 
	printf 'ui_video_editor_save_clip_to_mc_abort'
	wait 2 gameframes
	memcard_menus_cleanup
	wait 2 gameframes
	ve_restore_scratch_heap
	setsavefilename filetype = videoclip clear
	change video_clip_saving_textname = ""
	change video_clip_saving_checksum = none
	change ve_save_clip_slot = -1
	change ve_saving_add_user_cam = 0
	change video_clip_saving_team_goal_clip = 0
	if gman_getactivatedgoalid
		ui_change_state state = UIstate_goal_film_clip_options
	else
		ui_change_state state = UIstate_video_editor_clip_recorded_menu
	endif
endscript

script ui_video_editor_save_clip_to_mc_retry 
	memcard_menus_cleanup
	goto ui_video_editor_save_clip_to_mc params = <...>
endscript

script ui_create_video_editor_clip_recorded_menu 
	printf 'ui_create_video_editor_clip_recorded_menu'
	kill_start_key_binding
	make_cas_menu {
		menu_id = video_editor_clip_rec_anchor
		vmenu_id = video_editor_clip_rec_vmenu
		title = "Recorded Clip"
		pad_back_script = ui_video_editor_clip_rec_discard_clip
		CasMenu
		MenuOffset = (300.0, -10.0)
		cas_pos = (310.0, 140.0)
		scroll_bar_offset = (155.0, 10.0)
	}
	ui_create_video_editor_background
	ui_pausemenu_push_buss
	Destroy_MenuFx
	Do_MenuFx_Video_Editor fxparam = ($video_menu_tod_manager)
	if ve_check_good_clip clip = ($ve_rec_clip_name)
		add_cas_menu_item {
			text = "Playback Clip"
			pad_choose_script = ui_video_editor_clip_rec_playback_clip
		}
		add_cas_menu_item {
			text = "Save Clip"
			pad_choose_script = ui_video_editor_clip_rec_save_clip
		}
	else
		add_cas_menu_item {
			text = "Clip damaged"
			not_focusable
		}
	endif
	add_cas_menu_item {
		text = "Discard Clip"
		pad_choose_script = ui_video_editor_rec_ask_discard_clip
	}
	cas_menu_finish
endscript

script ui_video_editor_rec_ask_discard_clip 
	create_dialog_box \{title = "Discard Clip"
		text = "ARE YOU SURE?"
		buttons = [
			{
				text = "no"
				pad_choose_script = dialog_box_exit
				pad_choose_params = {
					no_pad_start
				}
			}
			{
				text = "yes"
				pad_choose_script = ui_video_editor_rec_confirm_discard_clip
			}
		]
		no_helper_text
		vmenu_width = 500
		text_dims = (600.0, 0.0)}
endscript

script ui_video_editor_rec_confirm_discard_clip 
	dialog_box_exit \{no_pad_start}
	ui_video_editor_clip_rec_discard_clip
endscript

script ui_destroy_video_editor_clip_recorded_menu 
	printf \{'ui_destroy_video_editor_clip_recorded_menu'}
	generic_ui_destroy
endscript

script ui_video_editor_clip_rec_playback_clip 
	ve_fix_skater_for_ve_entry
	ui_destroy_video_editor_background
	spawnscriptlater ve_play_clips params = {
		clips = [{name = ($ve_rec_clip_name)}]
		end_state = UIstate_video_editor_clip_recorded_menu
		no_slot_loading
		expanded_ui
	}
endscript

script ui_video_editor_clip_rec_save_clip 
	change \{video_clip_saving_team_goal_clip = 0}
	ui_video_editor_save_clip_to_mc
endscript

script ui_video_editor_clip_rec_discard_clip 
	ve_free_recorded_clip
	if screenelementexists \{id = video_editor_clip_rec_anchor}
		destroyscreenelement \{id = video_editor_clip_rec_anchor}
	endif
	ui_change_state \{state = UIstate_video_editor_Main}
endscript

script ui_create_video_editor_camera_recorded_menu 
	printf 'ui_create_video_editor_camera_recorded_menu'
	Destroy_MenuFx
	Do_MenuFx_Video_Editor fxparam = ($video_menu_tod_manager)
	pausegame
	skater :pause
	skatercam0 :pause
	skater :obj_pausesounds
	kill_start_key_binding
	change ve_camera_is_recording = 0
	if NOT VideoClipSlotFunc find_clip name = (($video_editor_chosen_clip).name)
		scriptassert 'Um, we need this clip!'
		ui_video_editor_camera_rec_discard_camera
		return
	endif
	good_camera = 1
	if ($ve_record_usercam_cancelled = 1)
		good_camera = 0
	endif
	if NOT VideoClipBufferOverrunCheck
		good_camera = 0
		printf 'Buffer overrun for usercam data'
	endif
	make_cas_menu {
		menu_id = video_editor_cam_rec_anchor
		vmenu_id = video_editor_cam_rec_vmenu
		title = "Recorded Camera"
		pad_back_script = ui_video_editor_camera_rec_discard_camera
		CasMenu
		MenuOffset = (300.0, -10.0)
		cas_pos = (310.0, 140.0)
		scroll_bar_offset = (155.0, 10.0)
	}
	ui_create_video_editor_background
	add_cas_menu_item {
		text = "PLAYBACK"
		cas_heading
	}
	if (<good_camera> = 1)
		add_cas_menu_item {
			text = "Playback New Camera"
			pad_choose_script = ui_video_editor_camera_rec_playback_clip
		}
	else
		add_cas_menu_item {
			text = "Camera recording cancelled"
			not_focusable
		}
	endif
	VideoEditorFunc get_clip name = (($video_editor_chosen_clip).name)
	if structurecontains structure = <clip> user_camera
		if ((<clip>.user_camera) = 1)
			add_cas_menu_item {
				text = "Playback Old Camera"
				pad_choose_script = ui_video_editor_camera_rec_playback_clip
				pad_choose_params = {OldCam}
			}
		endif
	endif
	add_cas_menu_item {
		text = "RE-RECORDING"
		cas_heading
	}
	add_cas_menu_item {
		text = "Record Again"
		pad_choose_script = ui_video_editor_rerecord_camera_from_rec_menu
		pad_choose_params = {slomo = 1.0 capture_update_interval = 1}
	}
	add_cas_menu_item {
		text = "Record Again - Slomo"
		pad_choose_script = ui_video_editor_rerecord_camera_from_rec_menu
		pad_choose_params = {slomo = 0.5 capture_update_interval = 2}
	}
	add_cas_menu_item {
		text = "MAINTENANCE"
		cas_heading
	}
	if (<good_camera> = 1)
		add_cas_menu_item {
			text = "Save Camera"
			pad_choose_script = ui_video_editor_camera_rec_save_camera
		}
	endif
	if (<good_camera> = 1)
		back_text = "Discard Camera"
	else
		back_text = "Back"
	endif
	add_cas_menu_item {
		text = <back_text>
		pad_choose_script = ui_video_editor_camera_rec_discard_camera
	}
	cas_menu_finish
endscript

script ui_destroy_video_editor_camera_recorded_menu 
	printf \{'ui_destroy_video_editor_camera_recorded_menu'}
	generic_ui_destroy
endscript

script ui_video_editor_camera_rec_playback_clip 
	ui_destroy_video_editor_background
	if NOT gotparam OldCam
		replay_generate_filenames name = ($ve_rec_clip_name)
		force_user_camera = <user_cma_checksum>
	endif
	ui_destroy_video_editor_background
	if ui_check_clip_loaded name = (($video_editor_chosen_clip).name) hide_lods
		spawnscriptlater ve_play_clips params = {
			clips = [{
					name = (($video_editor_chosen_clip).name)
					clip_camera = user
				}]
			end_state = UIstate_video_editor_camera_recorded_menu
			force_user_camera = <force_user_camera>
			no_slot_loading
			expanded_ui
		}
	else
		ui_change_state state = UIstate_video_editor_camera_recorded_menu
	endif
endscript

script ui_video_editor_rerecord_camera_from_rec_menu 
	ui_destroy_video_editor_background
	ui_video_editor_delete_rec_cam
	ui_video_editor_clip_rerecord_camera slomo = <slomo> capture_update_interval = <capture_update_interval>
endscript

script ui_video_editor_camera_rec_save_camera 
	if NOT VideoClipSlotFunc find_clip name = (($video_editor_chosen_clip).name)
		scriptassert 'Cannot save!'
	endif
	replay_generate_filenames name = ($ve_rec_clip_name)
	VideoClipSlotFunc copy_asset_into_slot index = <slot> asset = <user_cma_checksum> data_type = user_camera_data
	ui_video_editor_delete_rec_cam
	VideoEditorFunc get_clip name = (($video_editor_chosen_clip).name)
	VideoEditorFunc set_clip name = (($video_editor_chosen_clip).name) clip = {
		<clip>
		user_camera = 1
	}
	if ($video_editor_camera_from_edit = 1)
		change video_editor_clip_user_camera = 1
	endif
	change video_clip_saving_team_goal_clip = 0
	if structurecontains structure = <clip> goal_id
		if (<goal_id> = m_team_film)
			change video_clip_saving_team_goal_clip = 1
		endif
	endif
	change ve_saving_add_user_cam = 1
	ui_video_editor_save_clip_to_mc slot = <slot> checksum = (($video_editor_chosen_clip).name) textname = (($video_editor_chosen_clip).text)
endscript

script ui_video_editor_camera_rec_discard_camera 
	skatercam0 :pause
	ui_video_editor_delete_rec_cam
	if ($video_editor_camera_from_edit = 0)
		ui_change_state \{state = UIstate_video_editor_Main}
	else
		ui_video_edit_return_to_edit
	endif
endscript

script ui_video_editor_delete_rec_cam 
	replay_remove_user_camera_asset name = ($ve_rec_clip_name)
endscript

script ui_video_editor_record_area_bad 
	printf 'ui_video_editor_record_area_bad'
	create_dialog_box {title = "Video Recorder"
		text = "Cannot record video here, go into one of the cities."
		buttons = [{text = "ok" pad_choose_script = ui_video_editor_record_area_bad_set_state pad_choose_params = {state = <state>}}
		]
		text_dims = (280.0, 0.0)
	}
endscript

script ui_video_editor_record_area_bad_set_state 
	ui_change_state state = <state>
endscript

script ui_video_editor_load_render 
	printf \{'ui_video_editor_load_render'}
	EditBufferFunc \{func = clear}
	ve_set_memory_state \{state = render}
	ui_video_editor_load_render_from_mc
endscript

script ui_video_editor_purchase_menu 
	getarraysize $ve_effects_list
	i = 0
	effect_count = 0
	begin
	effect_name = ($ve_effects_list [<i>])
	careerfunc func = getvideoeffectstate params = {name = <effect_name>}
	if (<state> = purchasable)
		effect_count = (<effect_count> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	getarraysize $video_editor_bink_list
	i = 0
	overlay_count = 0
	begin
	overlay_name = ($video_editor_bink_list [<i>])
	careerfunc func = getvideooverlaystate params = {name = <overlay_name>}
	if (<state> = purchasable)
		overlay_count = (<overlay_count> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	params = {scrolling}
	<add> = 3
	if (<effect_count> = 0)
		<add> = (<add> + 1)
	endif
	if (<overlay_count> = 0)
		<add> = (<add> + 1)
	endif
	if ((<effect_count> + <overlay_count> + <add>) < 10)
		params = {}
	endif
	make_cas_menu {
		menu_id = video_editor_main_anchor
		vmenu_id = video_editor_main_vmenu
		title = "video upgrades"
		pad_back_script = ui_create_video_editor_main
		<params>
		CasMenu
		MenuOffset = (300.0, -10.0)
		cas_pos = (310.0, 140.0)
		scroll_bar_offset = (155.0, 10.0)
	}
	ui_create_video_editor_background
	careerfunc func = GetCash
	cash_to_text cash = <cash>
	formattext textname = current_cash "$%c available" c = <cash>
	createscreenelement {
		type = textelement
		parent = video_editor_main_anchor
		font = text_a1
		text = <current_cash>
		pos = (850.0, 90.0)
		just = [right center]
	}
	add_cas_menu_item {
		text = "screen effects"
		cas_heading
	}
	if NOT (<effect_count> = 0)
		getarraysize $ve_effects_list
		i = 0
		begin
		effect_name = ($ve_effects_list [<i>])
		careerfunc func = getvideoeffectstate params = {name = <effect_name>}
		if (<state> = purchasable)
			effect_details = (($ve_effects).<effect_name>)
			cash_to_text cash = (<effect_details>.purchase_cost)
			add_cas_menu_item {
				text = (<effect_details>.text)
				extra_text = <cash_text>
				pad_choose_script = ui_video_editor_purchase_effect
				pad_choose_params = {name = <effect_name> cost = (<effect_details>.purchase_cost)}
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		add_cas_menu_item {
			text = "all purchased"
		}
	endif
	add_cas_menu_item {
		text = "overlays"
		cas_heading
	}
	if NOT (<overlay_count> = 0)
		getarraysize $video_editor_bink_list
		i = 0
		begin
		overlay_name = ($video_editor_bink_list [<i>])
		careerfunc func = getvideooverlaystate params = {name = <overlay_name>}
		if (<state> = purchasable)
			overlay_details = (($video_editor_bink_details).<overlay_name>)
			cash_to_text cash = (<overlay_details>.purchase_cost)
			add_cas_menu_item {
				text = (<overlay_details>.text)
				extra_text = <cash_text>
				pad_choose_script = ui_video_editor_purchase_overlay
				pad_choose_params = {name = <overlay_name> cost = (<overlay_details>.purchase_cost)}
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		add_cas_menu_item {
			text = "all purchased"
		}
	endif
	add_cas_menu_item {
		text = "done"
		pad_choose_script = ui_create_video_editor_main
	}
	cas_menu_finish
endscript

script ui_video_editor_purchase_effect 
	generic_ui_destroy
	if ui_video_editor_purchase_check cost = <cost> fail_script = ui_video_editor_purchase_menu
		careerfunc func = setvideoeffectstate params = {name = <name> state = unlocked}
		ui_video_editor_purchase_menu
	endif
endscript

script ui_video_editor_purchase_overlay 
	generic_ui_destroy
	if ui_video_editor_purchase_check cost = <cost> fail_script = ui_video_editor_purchase_menu
		careerfunc func = setvideooverlaystate params = {name = <name> state = unlocked}
		ui_video_editor_purchase_menu
	endif
endscript

script ui_video_editor_purchase_check 
	careerfunc func = GetCash
	if (<cash> < <cost>)
		soundevent event = Goal_UI_Negative_Text_Loud
		create_dialog_box {title = "Not enough cash"
			text = "You don't have enough cash to purchase this item."
			buttons = [{text = "ok" pad_choose_script = <fail_script>}
			]
			text_dims = (280.0, 0.0)
		}
		return false
	endif
	careerfunc func = AddCash params = {cash = (<cost> * -1)}
	return true
endscript

script cash_to_text 
	formattext textname = cash_text "$%d" d = <cash>
	return cash_text = <cash_text>
endscript

script get_filming_in_area 
	if NOT ($ve_hard_load_zone = none)
		Get_Area_From_Zone zone = ($ve_hard_load_zone)
	else
		Get_Current_Area
	endif
	return area = <area>
endscript

script ui_check_clip_loaded 
	if gotparam \{hide_lods}
		ve_create_hide_lod_ui
	endif
	if ui_check_clips_loaded clips = [{name = <name>}]
		if gotparam \{hide_lods}
			ve_destroy_hide_lod_ui \{delayed}
		endif
		if NOT gotparam \{clips_deleted}
			return \{true}
		endif
	endif
	return \{false}
endscript
ui_check_clip_loaded_delete_clips = 0

script ui_check_clips_loaded 
	if ve_ensure_clips_loaded clips = <clips>
		return true
	endif
	if gotparam no_save
		return false
	endif
	if gotparam bad_clips
		getarraysize <bad_clips>
		if (<array_size> > 0)
			change ui_check_clip_loaded_delete_clips = 0
			if (<array_size> > 1)
				title = "Delete Damaged Clips"
				text = "Multiple corrupt or otherwise damaged video clips were found.\\nHowever, this situation is recoverable. Is it okay if these damaged clips are deleted?"
				button_text = "Delete Clips"
			else
				title = "Delete Damaged Clip"
				text = "This clip is corrupt or otherwise damaged.\\nHowever, this situation is recoverable. Is it okay if the damaged clip is deleted?"
				button_text = "Delete Clip"
			endif
			buttons = [{font = text_a1 text = <button_text> pad_choose_script = ui_check_clips_loaded_do_delete}
				{font = text_a1 text = "Cancel" pad_choose_script = ui_check_clips_loaded_cancel_delete}
			]
			if NOT cardisinslot
				title = "Device Removed"
				text = "The storage device was removed whilst loading the video clip data. The data could not be loaded."
				buttons = [
					{font = text_a1 text = "OK" pad_choose_script = ui_check_clips_loaded_cancel_delete}
				]
			endif
			create_dialog_box {
				preserve_case
				text_dims = (700.0, 0.0)
				vmenu_width = 600
				title = <title>
				text = <text>
				buttons = <buttons>
			}
			block type = bad_clip_confirm
			if ($ui_check_clip_loaded_delete_clips = 1)
				i = 0
				begin
				clip_name = (<bad_clips> [<i>])
				if delete_extra_saved_data filetype = videoclip name = <clip_name>
					ve_delete_clip name = <clip_name>
				endif
				i = (<i> + 1)
				repeat <array_size>
				return true clips_deleted = 1
			endif
		endif
	endif
	return false
endscript

script ui_check_clips_loaded_do_delete 
	change \{ui_check_clip_loaded_delete_clips = 1}
	dialog_box_exit
	unpausespawnedscript \{ui_check_clips_loaded}
	broadcastevent \{type = bad_clip_confirm}
endscript

script ui_check_clips_loaded_cancel_delete 
	change \{ui_check_clip_loaded_delete_clips = 0}
	dialog_box_exit
	unpausespawnedscript \{ui_check_clips_loaded}
	broadcastevent \{type = bad_clip_confirm}
endscript

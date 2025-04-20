video_editor_menu_array = [
	{
		name = "edit clip"
		texture = cap_iconedit
		pane = Video_Editor_Clip_Pane
		menu = Video_Editor_Clip_Menu
		array = $video_editor_clip_options
		loop_script = pane_options_loop
	}
	{
		name = "screen fx"
		texture = cap_iconfx
		pane = Video_Editor_Effects_Pane
		menu = Video_Editor_Effects_Menu
		array = $video_editor_fx_options
		loop_script = pane_options_loop
	}
	{
		name = "overlays"
		texture = cap_iconoverlays
		pane = Video_Editor_Overlays_Pane
		menu = Video_Editor_Overlays_Menu
		array = $video_editor_overlay_options
		loop_script = pane_options_loop
	}
	{
		name = "audio"
		texture = cap_iconaudio
		pane = Video_Editor_Audio_Pane
		menu = Video_Editor_Audio_Menu
		array = $video_editor_audio_menu_array
		loop_script = pane_audio_loop
	}
	{
		name = "options"
		texture = cap_iconoptions
		pane = Video_Editor_Options_Pane
		menu = Video_Editor_Options_Menu
		array = $video_editor_properties_menu_array
		loop_script = pane_options_loop
	}
	{
		name = "submit"
		texture = prog_icon_editor
		pane = Video_Editor_Submit_Pane
		menu = Video_Editor_Submit_Menu
		array = $video_editor_sumbit_menu_array
		loop_script = pane_options_loop
	}
]
video_editor_other_panes = [
	{
		name = "edit clip"
		sub_name = "- insert clip"
		pane = Video_Editor_NewClip_Pane
		menu = Video_Editor_NewClip_Menu
		loop_script = pane_newclip_loop
	}
	{
		name = "screen fx"
		sub_name = "- insert fx"
		pane = Video_Editor_NewEffects_Pane
		menu = Video_Editor_NewEffects_Menu
		array = $ve_effects_list
		loop_script = pane_effects_loop
	}
	{
		name = "overlays"
		sub_name = "- insert overlay"
		pane = Video_Editor_NewOverlays_Pane
		menu = Video_Editor_NewOverlays_Menu
		array = $video_editor_bink_list
		loop_script = pane_overlay_loop
	}
	{
		name = "edit clip"
		sub_name = "- camera"
		pane = Video_Editor_Camera_Pane
		menu = Video_Editor_Camera_Menu
		array = $ve_camera_types
		loop_script = pane_camera_loop
	}
	{
		name = "edit clip"
		sub_name = "- clip speed"
		pane = Video_Editor_Speed_Pane
		menu = Video_Editor_Speed_Menu
		array = $video_editor_clip_speed_array
		loop_script = pane_speed_loop
	}
	{
		name = "overlays"
		sub_name = "- overlay length"
		pane = Video_Editor_FX_Length_Pane
		menu = Video_Editor_FX_Length_Menu
		array = $video_editor_overlay_length_array
		loop_script = pane_options_loop
	}
	{
		name = "audio"
		sub_name = "- music track"
		pane = Video_Editor_Audio_Track_Pane
		menu = Video_Editor_Audio_Track_Menu
		array = $ve_playlist_tracks
		loop_script = pane_track_loop
	}
]
video_editor_other_selected = -1
video_editor_clip_options = [
	{
		text = "insert clip"
		pad_choose_script = pane_other_add_clip
	}
	{
		text = "remove clip"
		pad_choose_script = ui_video_editor_delete_sel_clip
	}
	{
		text = "trim clip"
		pad_choose_script = video_editor_begin_trim_clip
	}
	{
		text = "move clip"
		pad_choose_script = video_editor_grab_selected
	}
	{
		text = "camera"
		pad_choose_script = pane_other_camera
	}
	{
		text = "restore clip"
		pad_choose_script = ui_video_editor_restore_sel_clip
	}
	{
		text = "clip speed"
		pad_choose_script = pane_other_clip_speed
	}
	{
		text = "split clip"
		pad_choose_script = video_editor_split_clips
	}
	{
		text = "play clip fullscreen"
		pad_choose_script = ui_video_editor_play_sel_clip
	}
]
video_editor_fx_options = [
	{
		text = "insert fx"
		pad_choose_script = pane_other_add_fx
	}
	{
		text = "remove fx"
		pad_choose_script = ui_video_editor_delete_sel_effect
	}
	{
		text = "trim fx"
		pad_choose_script = video_editor_begin_trim_clip
	}
	{
		text = "move fx"
		pad_choose_script = video_editor_grab_selected
	}
	{
		text = "combine fx"
		pad_choose_script = pane_other_combine_fx
	}
	{
		text = "undo combine"
		pad_choose_script = ui_video_editor_restore_sel_effect
	}
	{
		text = "toggle hard-in"
		pad_choose_script = ui_video_editor_effect_toggle_hard_in
	}
	{
		text = "toggle hard-out"
		pad_choose_script = ui_video_editor_effect_toggle_hard_out
	}
	{
		text = "fx strength"
		pad_choose_script = ui_video_editor_effect_change_strength
	}
]
video_editor_overlay_options = [
	{
		text = "insert overlay"
		pad_choose_script = pane_other_add_overlay
	}
	{
		text = "remove overlay"
		pad_choose_script = ui_video_editor_delete_sel_overlay
	}
	{
		text = "trim overlay"
		pad_choose_script = video_editor_begin_trim_clip
	}
	{
		text = "move overlay"
		pad_choose_script = video_editor_grab_selected
	}
]
video_editor_properties_menu_array = [
	{
		text = "preview from cursor"
		pad_choose_script = ui_video_editor_preview_edit
	}
	{
		text = "preview from cursor fs"
		pad_choose_script = ui_video_editor_play_edit_fs_from_menu_from_cursor
	}
	{
		text = "play edit fullscreen"
		pad_choose_script = ui_video_editor_play_edit_fs_from_menu
	}
	{
		text = "toggle zoom"
		pad_choose_script = ui_video_editor_zoom
	}
	{
		text = "save edit as copy"
		pad_choose_script = video_editor_save_as_copy_to_profile
	}
]
video_editor_sumbit_menu_array = [
	{
		text = "submit your edit to Volcom"
		pad_choose_script = ui_video_editor_leaderboard_submit
	}
	{
		text = "finalize edit"
		pad_choose_script = ui_video_editor_render_edit
	}
]
video_editor_sumbit_menu_array_ps3 = [
	{
		text = "submit your edit to Volcom"
		pad_choose_script = ui_video_editor_leaderboard_submit
	}
]
video_editor_audio_menu_array = [
	{
		text = "choose music track"
		pad_choose_script = pane_other_audio_track
	}
	{
		text = "preview music track"
		pad_choose_script = ui_video_editor_audio_preview
	}
]
video_editor_clip_speed_array = [
	{
		text = "decrease speed"
		pad_choose_script = video_editor_decrease_clip_speed
	}
	{
		text = "increase speed"
		pad_choose_script = video_editor_increase_clip_speed
	}
]
video_editor_overlay_length_array = [
	{
		text = "decrease length"
		pad_choose_script = ui_video_editor_decrease_overlay_length
	}
	{
		text = "increase length"
		pad_choose_script = ui_video_editor_increase_overlay_length
	}
]
ve_playlist_tracks = [
]
video_editor_combine_fx_flag = 0

script pane_other_add_clip 
	change \{video_editor_other_selected = 0}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script pane_other_add_fx 
	change \{video_editor_other_selected = 1}
	change \{video_editor_pane_selection = 0}
	if screenelementexists \{id = {
				Video_Editor_NewEffects_Pane
				child = name
			}}
		setscreenelementprops \{id = {
				Video_Editor_NewEffects_Pane
				child = sub_name
			}
			text = "- insert fx"}
	endif
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script pane_other_combine_fx 
	change \{video_editor_other_selected = 1}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_combine_fx_flag = 1}
	if screenelementexists \{id = {
				Video_Editor_NewEffects_Pane
				child = name
			}}
		setscreenelementprops \{id = {
				Video_Editor_NewEffects_Pane
				child = sub_name
			}
			text = "- combine fx"}
	endif
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes \{combine_fx}
endscript

script pane_other_add_overlay 
	change \{video_editor_other_selected = 2}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script pane_other_camera 
	change \{video_editor_other_selected = 3}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script pane_other_clip_speed 
	change \{video_editor_other_selected = 4}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script pane_other_overlay_length 
	change \{video_editor_other_selected = 5}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script pane_other_audio_track 
	change \{video_editor_other_selected = 6}
	change \{video_editor_pane_selection = 0}
	change \{video_editor_current_top = 0}
	change \{video_editor_current_bottom = 4}
	video_editor_update_panes
endscript

script video_editor_create_pane 
	if NOT screenelementexists id = Video_Editor_Pane_Container
		return
	endif
	if NOT gotparam pane
		return
	endif
	if screenelementexists id = <pane>
		destroyscreenelement id = <pane>
	endif
	createscreenelement {
		type = containerelement
		parent = Video_Editor_Pane_Container
		id = <pane>
		dims = (((1.0, 0.0) * (<width> / 2)) + ((0.0, 1.0) * <height>))
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		child_anchor = [left top]
		alpha = 1.0
	}
	if gotparam name
		createscreenelement {
			type = spriteelement
			parent = <pane>
			texture = black
			rgba = ($goal_generic_ui_scheme.main)
			just = [right top]
			pos = {(1.0, 0.0) proportional}
			dims = ((0.0, 58.0) + ((1.0, 0.0) * (<width> / 2)))
			z_priority = (<z_priority> + 0.5)
		}
		<name_bg> = <id>
		createscreenelement {
			type = textelement
			parent = <pane>
			local_id = name
			font = text_a1
			rgba = [200 200 200 255]
			text = <name>
			just = [left center]
			pos = (80.0, 35.0)
			scale = (0.8, 0.7)
			font_spacing = 2
			z_priority = (<z_priority> + 1.0)
		}
		createscreenelement {
			type = spriteelement
			parent = <pane>
			texture = vided_toolbar_top
			rgba = [40 40 40 255]
			just = [left top]
			pos = (0.0, 28.0)
			dims = (450.0, -42.0)
			z_priority = (<z_priority> + 0.6)
		}
		if gotparam sub_name
			setscreenelementprops {
				id = <id>
				pos = (0.0, 68.0)
			}
			setscreenelementprops {
				id = <name_bg>
				dims = ((0.0, 106.0) + ((1.0, 0.0) * (<width> / 2)))
			}
			createscreenelement {
				type = spriteelement
				parent = <pane>
				texture = black
				rgba = ($goal_generic_ui_scheme.main)
				just = [right top]
				pos = {(1.0, 0.0) proportional}
				dims = ((0.0, 58.0) + ((1.0, 0.0) * (<width> / 2)))
				z_priority = (<z_priority> + 0.49)
			}
			createscreenelement {
				type = textelement
				parent = <pane>
				local_id = sub_name
				font = text_a1
				rgba = [200 200 200 255]
				text = <sub_name>
				just = [left center]
				pos = (80.0, 80.0)
				scale = (0.8, 0.7)
				font_spacing = 2
				z_priority = (<z_priority> + 1.0)
			}
		endif
		if gotparam texture
			createscreenelement {
				type = spriteelement
				parent = <pane>
				texture = <texture>
				just = [center center]
				scale = 0.7
				rgba = [240 240 240 255]
				pos = (40.0, 28.0)
				z_priority = 6
			}
			createscreenelement {
				type = spriteelement
				parent = <pane>
				texture = cap_piececircle
				just = [center center]
				scale = 0.35000002
				rgba = [60 60 60 255]
				pos = (40.0, 28.0)
				z_priority = 6
			}
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <pane>
		texture = vided_viewer_fade
		rgba = [0 0 0 100]
		just = [left top]
		pos = (410.0, 0.0)
		dims = (40.0, 308.0)
		z_priority = (<z_priority> + 1.3)
	}
	createscreenelement {
		type = spriteelement
		parent = <pane>
		texture = white
		rgba = [200 200 200 0]
		dims = ((2.0, 0.0) + ((0.0, 1.0) * <height>))
		just = [center top]
		pos = {(1.0, 0.0) proportional}
		z_priority = (<z_priority> + 4)
	}
	createscreenelement {
		type = spriteelement
		parent = <pane>
		texture = white
		dims = (((1.0, 0.0) * (<width> / 2)) + ((0.0, 1.0) * <height>))
		rgba = [40 40 40 255]
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = (<z_priority> + 0.25)
	}
	if gotparam menu
		createscreenelement {
			type = spriteelement
			parent = <pane>
			local_id = highlight_bar
			texture = menu_highlight
			rgba = [240 240 240 255]
			just = [left center]
			pos = {(0.0, 0.1) proportional}
			dims = ((0.0, 44.0) + ((1.0, 0.0) * (<width> / 2.4)))
			z_priority = (<z_priority> + 0.75)
			alpha = 0.0
		}
		createscreenelement {
			type = containerelement
			parent = <pane>
			id = <menu>
			just = [left top]
			pos = (20.0, 65.0)
			internal_just = [left top]
			z_priority = (<z_priority> + 1)
		}
		if gotparam array
			getarraysize <array>
			<bar_height> = (<height> - 90)
			<offset> = (0.0, 0.0)
			if gotparam sub_name
				<bar_height> = (<bar_height> - 40)
				<offset> = (0.0, 40.0)
			endif
			createscreenelement {
				type = spriteelement
				parent = <pane>
				texture = menu_generic_scrolltip
				just = [center top]
				pos = ((410.0, 68.0) + <offset>)
				dims = (32.0, 32.0)
				rgba = [255 255 255 255]
				z_priority = (<z_priority> + 1.7)
			}
			createscreenelement {
				type = spriteelement
				parent = <pane>
				texture = menu_generic_scrollstrip
				just = [center top]
				pos = ((410.0, 100.0) + <offset>)
				dims = ((32.0, 0.0) + ((0.0, 0.8) * <bar_height>))
				rgba = [255 255 255 255]
				z_priority = (<z_priority> + 1.5)
			}
			createscreenelement {
				type = spriteelement
				parent = <pane>
				texture = menu_generic_scrolltip
				just = [center top]
				pos = (410.0, 265.0)
				dims = (32.0, -32.0)
				rgba = [255 255 255 255]
				z_priority = (<z_priority> + 1.7)
			}
			<slider_height> = (<bar_height> / <array_size>)
			createscreenelement {
				type = spriteelement
				parent = <pane>
				local_id = slider_bar
				texture = menu_generic_scrolltab
				just = [center top]
				pos = ((410.0, 75.0) + <offset>)
				dims = ((16.0, 0.0) + ((0.0, 1.0) * <slider_height>))
				rgba = [255 255 255 255]
				z_priority = (<z_priority> + 2.0)
				tags = {
					slider_height = <slider_height>
					start_pos = ((410.0, 75.0) + <offset>)
				}
			}
		endif
	endif
	if gotparam loop_script
		<loop_script> <...>
	endif
endscript

script pane_edit_loop 
	createscreenelement {
		type = textelement
		parent = <pane>
		font = text_a1
		scale = (0.65000004, 0.55)
		just = [left center]
		pos = (25.0, 40.0)
		text = "clip properties"
		rgba = [200 200 200 255]
	}
	createscreenelement {
		type = textelement
		parent = <pane>
		font = text_a1
		scale = (0.65000004, 0.55)
		just = [left center]
		pos = (50.0, 100.0)
		text = "speed:"
		rgba = [200 200 200 255]
	}
	createscreenelement {
		type = textelement
		parent = <pane>
		id = Clip_Speed_Text
		font = text_a1
		scale = (0.65000004, 0.55)
		just = [left center]
		pos = (75.0, 140.0)
		text = ""
		rgba = [200 200 200 255]
	}
	createscreenelement {
		type = textelement
		parent = <pane>
		font = text_a1
		scale = (0.65000004, 0.55)
		just = [left center]
		pos = (50.0, 180.0)
		text = "camera:"
		rgba = [200 200 200 255]
	}
	createscreenelement {
		type = textelement
		parent = <pane>
		id = Clip_Camera_Text
		font = text_a1
		scale = (0.65000004, 0.55)
		just = [left center]
		pos = (75.0, 220.0)
		text = ""
		rgba = [200 200 200 255]
	}
endscript

script selected_has_user_cam 
	if video_editor_clip_selected
		VideoEditorFunc get_clip name = (<clip>.name)
		if structurecontains structure = <clip> user_camera
			if (<clip>.user_camera = 1)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script selected_has_goal_cam 
	if video_editor_clip_selected
		if VideoClipSlotFunc get_clip_data_struct name = (<clip>.name)
			if structurecontains structure = <clip_data> goal_camera
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script pane_camera_loop 
	getarraysize $ve_camera_types
	<i> = 0
	begin
	cam_checksum = ($ve_camera_types [<i>])
	getlowercasestring (($ve_camera_names.(<cam_checksum>)))
	createscreenelement {
		type = textelement
		parent = <menu>
		font = text_a1
		text = <lowercasestring>
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script pane_effects_loop 
	getarraysize <array>
	<i> = 0
	begin
	name = ((<array>) [<i>])
	getlowercasestring ((($ve_effects).<name>).text)
	careerfunc func = getvideoeffectstate params = {name = <name>}
	if NOT (<state> = unlocked)
		tags = {locked}
	else
		tags = {}
	endif
	createscreenelement {
		type = textelement
		parent = Video_Editor_NewEffects_Menu
		font = text_a1
		text = <lowercasestring>
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
		tags = <tags>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script pane_overlay_loop 
	getarraysize <array>
	<i> = 0
	begin
	name = ((<array>) [<i>])
	getlowercasestring ((($video_editor_bink_details).<name>).text)
	careerfunc func = getvideooverlaystate params = {name = <name>}
	if NOT (<state> = unlocked)
		tags = {locked}
	else
		tags = {}
	endif
	createscreenelement {
		type = textelement
		parent = Video_Editor_NewOverlays_Menu
		font = text_a1
		text = <lowercasestring>
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
		tags = <tags>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script pane_audio_loop 
	getarraysize $video_editor_audio_menu_array
	<i> = 0
	begin
	createscreenelement {
		type = textelement
		parent = <menu>
		font = text_a1
		text = (($video_editor_audio_menu_array [<i>]).text)
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
	}
	<i> = (<i> + 1)
	repeat <array_size>
	createscreenelement {
		type = textelement
		parent = <menu>
		font = text_a1
		scale = (0.7, 0.6)
		just = [left top]
		pos = (0.0, 80.0)
		text = "start time (\\bk):"
		rgba = [200 200 200 255]
	}
	createscreenelement {
		id = audio_start_time_bar
		type = containerelement
		parent = <menu>
		pos = (40.0, 150.0)
		dims = (300.0, 40.0)
		just = [left center]
		child_anchor = [left center]
	}
	createscreenelement {
		type = spriteelement
		parent = audio_start_time_bar
		texture = menu_generic_scrolltip
		just = [left top]
		pos = (0.0, -8.0)
		dims = (16.0, 32.0)
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 1.7)
		rot_angle = -90
	}
	createscreenelement {
		type = spriteelement
		parent = audio_start_time_bar
		texture = menu_generic_scrollstrip
		pos = (32.0, -8.0)
		dims = (16.0, 228.0)
		just = [left top]
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 1.5)
		rot_angle = -90
	}
	createscreenelement {
		type = spriteelement
		parent = audio_start_time_bar
		texture = menu_generic_scrolltip
		just = [left top]
		pos = (250.0, -8.0)
		dims = (16.0, -32.0)
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 1.7)
		rot_angle = -90
	}
	createscreenelement {
		type = spriteelement
		parent = audio_start_time_bar
		local_id = slider_bar
		texture = menu_generic_scrolltab
		just = [left top]
		pos = (8.0, -32.0)
		dims = (16.0, 32.0)
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 2.0)
		tags = {
			slider_width = 252
			start_pos = (8.0, -32.0)
		}
	}
endscript

script pane_options_loop 
	getarraysize <array>
	<i> = 0
	begin
	createscreenelement {
		type = textelement
		parent = <menu>
		font = text_a1
		text = ((<array> [<i>]).text)
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script pane_newclip_loop 
	VideoEditorFunc get_clip_count
	<array_size> = 0
	<i> = 0
	if (<count> > 0)
		begin
		VideoEditorFunc get_clip index = <i>
		skip = 0
		if ve_get_clips_area clips = ($ve_current_edit_clips)
			if NOT ((<clip>.area) = <area>)
				skip = 1
			endif
		endif
		if structurecontains structure = clip rendered_clip
			skip = 1
		endif
		if structurecontains structure = clip netsent
			skip = 1
		endif
		if (<skip> = 0)
			Get_Area_Data area = (<clip>.area)
			formattext textname = cliptext "%a - %b" a = (<clip>.text) b = (<area_data>.abbrev)
			getlowercasestring <cliptext>
			createscreenelement {
				type = textelement
				parent = <menu>
				font = text_a1
				text = <lowercasestring>
				rgba = [200 200 200 255]
				scale = (0.7, 0.6)
				just = [left top]
				pos = ((0.0, 1.0) * (<array_size> * 40))
				tags = {
					{clip = (<clip>.name)}
				}
			}
			<array_size> = (<array_size> + 1)
		endif
		i = (<i> + 1)
		repeat <count>
	else
		createscreenelement {
			type = textelement
			parent = <menu>
			font = text_a1
			text = "no usable clips found"
			rgba = [200 200 200 255]
			scale = (0.7, 0.6)
			just = [left top]
			pos = (0.0, 0.0)
		}
		<array_size> = 1
	endif
	<bar_height> = (<height> - 90)
	<bar_height> = (<bar_height> - 40)
	<offset> = (0.0, 40.0)
	createscreenelement {
		type = spriteelement
		parent = <pane>
		texture = menu_generic_scrolltip
		just = [center top]
		pos = ((410.0, 68.0) + <offset>)
		dims = (32.0, 32.0)
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 1.7)
	}
	createscreenelement {
		type = spriteelement
		parent = <pane>
		texture = menu_generic_scrollstrip
		just = [center top]
		pos = ((410.0, 100.0) + <offset>)
		dims = ((32.0, 0.0) + ((0.0, 0.8) * <bar_height>))
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 1.5)
	}
	createscreenelement {
		type = spriteelement
		parent = <pane>
		texture = menu_generic_scrolltip
		just = [center top]
		pos = (410.0, 265.0)
		dims = (32.0, -32.0)
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 1.7)
	}
	<slider_height> = (<bar_height> / <array_size>)
	createscreenelement {
		type = spriteelement
		parent = <pane>
		local_id = slider_bar
		texture = menu_generic_scrolltab
		just = [center top]
		pos = ((410.0, 75.0) + <offset>)
		dims = ((16.0, 0.0) + ((0.0, 1.0) * <slider_height>))
		rgba = [255 255 255 255]
		z_priority = (<z_priority> + 2.0)
		tags = {
			slider_height = <slider_height>
			start_pos = ((410.0, 75.0) + <offset>)
			array_size = <array_size>
		}
	}
endscript

script pane_speed_loop 
	getarraysize <array>
	<i> = 0
	begin
	createscreenelement {
		type = textelement
		parent = <menu>
		font = text_a1
		text = ((<array> [<i>]).text)
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
	}
	<i> = (<i> + 1)
	repeat <array_size>
	createscreenelement {
		id = clip_speed
		type = textelement
		parent = <menu>
		font = text_a1
		scale = (0.7, 0.6)
		just = [left top]
		pos = (0.0, 120.0)
		text = "current speed: x1.0"
		rgba = [200 200 200 255]
	}
endscript

script pane_track_loop 
	getarraysize $ve_playlist_tracks
	<i> = 0
	begin
	getlowercasestring (($ve_playlist_tracks [<i>]).title)
	createscreenelement {
		type = textelement
		parent = <menu>
		font = text_a1
		text = <lowercasestring>
		rgba = [200 200 200 255]
		scale = (0.7, 0.6)
		just = [left top]
		pos = ((0.0, 1.0) * (<i> * 40))
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script video_editor_create_panes 
	if NOT screenelementexists id = Video_Editor_Properties_Container
		return
	endif
	if screenelementexists id = Video_Editor_Pane_Container
		return
	endif
	getscreenelementdims id = Video_Editor_Properties_Container
	<z_priority> = 5
	if ($video_editor_focus_reset = 1)
		change video_editor_other_selected = -1
		change video_editor_combine_fx_flag = 0
	endif
	createscreenelement {
		type = containerelement
		parent = Video_Editor_Properties_Container
		id = Video_Editor_Pane_Container
	}
	createscreenelement {
		type = spriteelement
		parent = Video_Editor_Properties_Container
		id = Video_Editor_Pane_Fade
		texture = black
		alpha = 0.4
		just = [left top]
		dims = (((1.0, 0.0) * (<width> / 2)) + ((0.0, 0.98999995) * <height>))
		pos = (0.0, 0.0)
		z_priority = (<z_priority> + 10)
	}
	if isps3
		ps3_struct = ($video_editor_menu_array [5])
		ps3_struct = {<ps3_struct> array = $video_editor_sumbit_menu_array_ps3}
		setarrayelement globalarray arrayname = video_editor_menu_array index = 5 newvalue = <ps3_struct>
	endif
	getarraysize ($playlist_tracks)
	ve_playlist_entry_array = []
	i = 0
	begin
	playlist_entry = (($playlist_tracks) [<i>])
	if NOT structurecontains structure = <playlist_entry> not_in_ve
		new_array_entry = [{<playlist_entry>}]
		ve_playlist_entry_array = (<ve_playlist_entry_array> + <new_array_entry>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	change ve_playlist_tracks = (<ve_playlist_entry_array>)
	video_editor_create_pane ($video_editor_menu_array [0]) <...>
	video_editor_create_pane ($video_editor_menu_array [1]) <...>
	video_editor_create_pane ($video_editor_menu_array [2]) <...>
	video_editor_create_pane ($video_editor_menu_array [3]) <...>
	video_editor_create_pane ($video_editor_menu_array [4]) <...>
	video_editor_create_pane ($video_editor_menu_array [5]) <...>
	video_editor_create_pane ($video_editor_other_panes [0]) <...> texture = cap_iconedit
	video_editor_create_pane ($video_editor_other_panes [1]) <...> texture = cap_iconfx
	video_editor_create_pane ($video_editor_other_panes [2]) <...> texture = cap_iconoverlays
	video_editor_create_pane ($video_editor_other_panes [3]) <...> texture = cap_iconedit
	video_editor_create_pane ($video_editor_other_panes [4]) <...> texture = cap_iconedit
	video_editor_create_pane ($video_editor_other_panes [5]) <...> texture = cap_iconfx
	video_editor_create_pane ($video_editor_other_panes [6]) <...> texture = cap_iconaudio
endscript

script video_editor_update_panes 
	if NOT screenelementexists id = Video_Editor_Pane_Container
		return
	endif
	if screenelementexists id = Video_Editor_Pane_Fade
		if ($video_editor_focus = pane)
			doscreenelementmorph {
				id = Video_Editor_Pane_Fade
				alpha = 0.0
			}
		else
			doscreenelementmorph {
				id = Video_Editor_Pane_Fade
				alpha = 0.4
				time = 0.075
			}
		endif
	endif
	<i> = 0
	begin
	if NOT screenelementexists id = {Video_Editor_Pane_Container child = <i>}
		break
	endif
	doscreenelementmorph {
		id = {Video_Editor_Pane_Container child = <i>}
		alpha = 0.0
	}
	<i> = (<i> + 1)
	repeat
	if ($video_editor_other_selected = -1)
		addparams ($video_editor_menu_array [$video_editor_current_selection])
	else
		addparams ($video_editor_other_panes [$video_editor_other_selected])
	endif
	if gotparam pane
		if NOT screenelementexists id = <pane>
			return
		endif
		doscreenelementmorph {
			id = <pane>
			alpha = 1.0
		}
	endif
	if gotparam menu
		<offset> = (0.0, 0.0)
		if NOT ($video_editor_other_selected = -1)
			<offset> = (0.0, 40.0)
		endif
		if ($video_editor_pane_selection = -1)
			doscreenelementmorph {
				id = {<pane> child = highlight_bar}
				alpha = 0.0
			}
			doscreenelementmorph {
				id = <menu>
				pos = ((20.0, 65.0) + <offset>)
			}
		else
			if gotparam array
				getarraysize <array>
			else
				if resolvescreenelementid id = {<pane> child = slider_bar}
					<resolved_id> :getsingletag array_size
				endif
			endif
			if gotparam array_size
				<index> = $video_editor_pane_selection
				if gotparam down
					<index> = (<index> + 1)
					if NOT (<index> = <array_size>)
						soundevent event = VE_scroll_down
					endif
				elseif gotparam up
					<index> = (<index> - 1)
					if (<index> > -1)
						soundevent event = VE_scroll_up
					endif
				endif
				if (<index> > (<array_size> - 1))
					<index> = (<array_size> - 1)
				elseif (<index> < 0)
					<index> = 0
				endif
				change video_editor_pane_selection = <index>
			endif
		endif
		doscreenelementmorph {
			id = <menu>
			pos = ((20.0, 65.0) + <offset>)
		}
		if resolvescreenelementid id = {<pane> child = slider_bar}
			<resolved_id> :gettags
			<select> = 0
			if NOT ($video_editor_pane_selection = -1)
				<select> = $video_editor_pane_selection
			endif
			<new_pos> = (<start_pos> + ((0.0, 1.0) * (<slider_height> * <select>)))
			doscreenelementmorph {
				id = <resolved_id>
				pos = <new_pos>
			}
		endif
		<i> = 0
		begin
		if NOT screenelementexists id = {<menu> child = <i>}
			break
		endif
		if NOT (<i> = $video_editor_pane_selection)
			setscreenelementprops {
				id = {<menu> child = <i>}
				rgba = [120 120 120 255]
			}
		else
			if (<i> > $video_editor_current_bottom)
				if ($video_editor_other_selected = -1)
					change video_editor_current_top = (<i> - 5)
					change video_editor_current_bottom = <i>
				else
					change video_editor_current_top = (<i> - 4)
					change video_editor_current_bottom = <i>
					<offset> = (0.0, 40.0)
				endif
			elseif (<i> < $video_editor_current_top)
				if ($video_editor_other_selected = -1)
					change video_editor_current_top = <i>
					change video_editor_current_bottom = (<i> + 5)
				else
					change video_editor_current_top = <i>
					change video_editor_current_bottom = (<i> + 4)
					<offset> = (0.0, 40.0)
				endif
			endif
			doscreenelementmorph {
				id = <menu>
				pos = ((20.0, 65.0) + <offset>)
			}
			doscreenelementmorph {
				id = <menu>
				pos = {((0.0, -40.0) * ($video_editor_current_top)) relative}
			}
			setscreenelementprops {
				id = {<menu> child = <i>}
				rgba = ($goal_generic_ui_scheme.main)
			}
			doscreenelementmorph {
				id = {<pane> child = highlight_bar}
				pos = (((0.0, 1.0) * (((<i> - $video_editor_current_top) * 40) + 80)) + (10.0, 0.0) + <offset>)
				alpha = 1.0
			}
		endif
		<i> = (<i> + 1)
		repeat
		<i> = 0
		begin
		if NOT screenelementexists id = {<menu> child = <i>}
			break
		endif
		if ((<i> > $video_editor_current_bottom) || (<i> < $video_editor_current_top))
			doscreenelementmorph {
				id = {<menu> child = <i>}
				alpha = 0.0
			}
		else
			doscreenelementmorph {
				id = {<menu> child = <i>}
				alpha = 1.0
			}
		endif
		<i> = (<i> + 1)
		repeat
	endif
	if structurecontains structure = ($ve_current_edit_audio) music
		music = (($ve_current_edit_audio).music)
		ve_get_playlist_track_from_asset asset = <music>
		if screenelementexists id = audio_start_time_bar
			resolvescreenelementid id = {audio_start_time_bar child = slider_bar}
			<resolved_id> :gettags
			if gotparam track
				<unit> = ((<slider_width> * 1.0) / ((<track>.length) * 1.0))
				<x> = ((($ve_current_edit_audio).music_start) * <unit>)
				<new_pos> = (<start_pos> + ((1.0, 0.0) * <x>))
				doscreenelementmorph id = <resolved_id> pos = <new_pos>
			else
				doscreenelementmorph id = <resolved_id> pos = <start_pos>
			endif
		endif
	endif
	if NOT gotparam dont_stop_music
		spawnscriptnow ve_stop_music_track params = {preview}
	endif
	if screenelementexists id = clip_speed
		if video_editor_clip_selected
			formattext textname = caption "current speed: x%a" a = (<clip>.clip_speed) decimalplaces = 1
		else
			formattext textname = caption "current speed: unknown"
		endif
		setscreenelementprops {
			id = clip_speed
			text = <caption>
		}
	endif
	if ($ve_debug_score = 1)
		ve_calculate_edit_score {
			clips = ($ve_current_edit_clips)
			effects = ($ve_current_edit_effects)
			overlays = ($ve_current_edit_overlays)
			audio = ($ve_current_edit_audio)
		}
		orig_score = (<score> / ($ve_overall_multiplier))
		casttointeger orig_score
		formattext textname = scoretext "Score = %d (%o)" d = <score> o = <orig_score>
		if screenelementexists id = ve_debug_score_text
			setscreenelementprops id = ve_debug_score_text text = <scoretext>
		endif
	endif
endscript

script video_editor_update_properties 
	<nametext> = ""
	<proptext> = ""
	<lentext> = ""
	switch $video_cursor_row
		case 0
		<rgba> = [100 35 35 255]
		case 1
		<rgba> = [45 80 35 255]
		case 2
		<rgba> = [15 55 100 255]
		case -1
		<rgba> = [100 100 45 255]
		default
		<rgba> = [0 0 0 255]
	endswitch
	getarraysize $ve_current_edit_clips
	if NOT (<array_size> = 0)
		if video_editor_clip_selected
			formattext textname = proptext "%n - speed: %s\\%" n = ($ve_camera_names.((<clip>).clip_camera)) s = ((<clip>.clip_speed) * 100) decimalplaces = 0
			VideoEditorFunc get_clip name = (<clip>.name)
			formattext textname = nametext "%n" n = (<clip>.text)
			ve_get_extents clips = $ve_current_edit_clips index = $video_cursor_column
			<length> = (<end_extent> - <start_extent>)
			formattext textname = lentext "%n" n = <length> decimalplaces = 2
		elseif video_editor_effect_selected
			ve_get_effect_text effect = <effect> noProps
			formattext textname = nametext "%n" n = <effect_text>
			ve_get_effect_text effect = <effect> NoName
			formattext textname = proptext "%n" n = <effect_text>
			<length> = (<effect>.length)
			formattext textname = lentext "%n" n = <length> decimalplaces = 2
		elseif video_editor_overlay_selected
			bink_details = (($video_editor_bink_details).(<overlay>.name))
			formattext textname = nametext "%n" n = (<bink_details>.text)
			<length> = (<overlay>.length)
			formattext textname = lentext "%n" n = <length> decimalplaces = 2
		elseif ($video_cursor_row = -1)
			music = (($ve_current_edit_audio).music)
			if ve_get_playlist_track_from_asset asset = <music>
				formattext textname = nametext "%n" n = (<track>.title)
				formattext textname = proptext "%n" n = (<track>.artist)
				formattext textname = lentext "%n" n = (($ve_current_edit_audio).music_start) decimalplaces = 2
			endif
		endif
	endif
	getlowercasestring <nametext>
	setscreenelementprops {
		id = Clip_Name_Text
		text = <lowercasestring>
	}
	getlowercasestring <proptext>
	setscreenelementprops {
		id = Clip_Prop_Text
		text = <lowercasestring>
	}
	getlowercasestring <lentext>
	setscreenelementprops {
		id = Clip_Time_Text
		text = <lowercasestring>
	}
	if screenelementexists id = Clip_Desc_BG
		doscreenelementmorph {
			id = Clip_Desc_BG
			rgba = <rgba>
		}
		doscreenelementmorph {
			id = Clip_Desc_BG_left
			rgba = <rgba>
		}
		doscreenelementmorph {
			id = Clip_Desc_BG_bottom
			rgba = <rgba>
		}
	endif
	spawnscriptnow ve_preview_seek params = {
		clips = ($ve_current_edit_clips)
		preview_time = $video_timeline_cursor
		viewport = video_editor_viewport
	}
endscript

script video_editor_select_pane 
	if ($video_editor_other_selected = -1)
		addparams ($video_editor_menu_array [$video_editor_current_selection])
	else
		addparams ($video_editor_other_panes [$video_editor_other_selected])
	endif
	if gotparam menu
		switch <pane>
			case Video_Editor_NewClip_Pane
			resolvescreenelementid id = {<menu> child = $video_editor_pane_selection}
			if NOT gotparam resolved_id
				return true
			endif
			<resolved_id> :gettags
			if NOT gotparam clip
				return true
			endif
			clip_name = <clip>
			if ve_get_clips_area clips = ($ve_current_edit_clips)
				VideoEditorFunc get_clip name = <clip_name>
				if NOT (<clip>.area = <area>)
					ui_video_editor_warning text = "This clip is from a different area, please choose another."
					return true
				endif
			endif
			if ui_video_editor_can_add_to_array array = ($ve_current_edit_clips)
				if ui_video_editor_can_add_clip clip = <clip_name>
					if NOT ve_clip_breaks_slot_limit clips = ($ve_current_edit_clips) clip = <clip_name>
						if goal_check_add_clip clips = ($ve_current_edit_clips) add_clip = <clip_name>
							ui_ve_add_clip_to_timeline <...>
						else
							ui_video_editor_warning text = "You cannot mix clips from the 'Team Filming Challenge' with ones you have recorded manually"
						endif
					else
						ui_video_editor_warning text = "Adding this clip would break the unique-clips-in-an-edit limit."
					endif
				else
					ui_video_editor_warning text = "Adding this clip would go past the end of the timeline."
				endif
			else
				ui_video_editor_warning text = "You have reached the maximum number of allowed clips in this edit."
			endif
			case Video_Editor_Camera_Pane
			if video_editor_clip_selected
				if NOT structurecontains structure = <clip> clip_camera
					<use_camera> = `default`
				else
					cam_checksum = ($ve_camera_types [$video_editor_pane_selection])
					if NOT selected_has_user_cam
						if (<cam_checksum> = user)
							no_user_cam = 1
						endif
					endif
					if NOT selected_has_goal_cam
						if (<cam_checksum> = goal)
							no_goal_cam = 1
						endif
					endif
					if gotparam no_user_cam
						if VideoEditorFunc get_clip name = (<clip>.name)
							change video_editor_chosen_clip = {name = (<clip>.name) text = (<clip>.text)}
							change video_editor_camera_from_edit = 1
							ui_change_state state = UIstate_video_editor_Clip_Menu
						endif
					elseif gotparam no_goal_cam
						ui_video_editor_warning text = "There is no goal cam available for this clip."
					else
						<use_camera> = ($ve_camera_types [$video_editor_pane_selection])
					endif
				endif
				if NOT gotparam no_user_cam
					if NOT gotparam no_goal_cam
						if ve_is_custom_pos_camera camera = <use_camera>
							if ((<use_camera> = user_look_at) || (<use_camera> = user_follow))
								disable_static_rot = 1
							endif
							if ui_video_editor_choose_custom_camera_pos use_camera = <use_camera> disable_static_rot = <disable_static_rot>
							else
								custom_camera_pos_cancelled = 1
							endif
						endif
						if NOT gotparam custom_camera_pos_cancelled
							video_editor_modify_selected_clip clip_camera = <use_camera> clip_camera_pos = <camera_pos> clip_camera_fov = <camera_fov> clip_camera_quat = <camera_quat>
						endif
					endif
				endif
			endif
			case Video_Editor_NewEffects_Pane
			resolvescreenelementid id = {<menu> child = $video_editor_pane_selection}
			if NOT gotparam resolved_id
				return true
			endif
			<resolved_id> :gettags
			if gotparam locked
				ui_video_editor_warning text = "This effect cannot be inserted until you have purchased it."
				return true
			endif
			if ($video_editor_combine_fx_flag = 0)
				if ui_video_editor_can_add_to_array array = ($ve_current_edit_effects)
					length = ($video_editor_default_effect_length)
					if NOT ui_video_editor_can_add_effect length = <length>
						ve_get_clips_entire_length clips = $ve_current_edit_clips
						ve_get_array_end_time array = $ve_current_edit_effects
						add_length = (<entire_length> - <end_time>)
						if (<add_length> >= ($video_editor_minimum_effect_length))
							length = <add_length>
						endif
					endif
					if ui_video_editor_can_add_effect length = <length>
						ve_add_effect_to_edit {
							effects = ($ve_current_edit_effects)
							add_effect = (($ve_effects_list) [$video_editor_pane_selection])
							len = <length>
						}
						change ve_current_edit_effects = <effects>
						getarraysize $ve_current_edit_effects
						change video_cursor_column = (<array_size> - 1)
						video_editor_update_timeline_to_selected
					else
						ui_video_editor_warning text = "There is no room in the timeline for a new effect."
					endif
				else
					ui_video_editor_warning text = "You have reached the maximum number of allowed effects in this edit."
				endif
			else
				if video_editor_effect_selected
					append_new_effect = (($ve_effects_list) [$video_editor_pane_selection])
					getarraysize (<effect>.effects)
					if ((<array_size> < $ve_max_combined_effects) || (<append_new_effect> = none))
						<i> = 0
						begin
						if ((<effect>.effects) [<i>] = <append_new_effect>)
							removeparameter append_new_effect
							break
						endif
						<i> = (<i> + 1)
						repeat <array_size>
						if gotparam append_new_effect
							video_editor_modify_selected_effect append_new_effect = <append_new_effect>
						else
							ui_video_editor_warning text = "Only one of each type of effect is allowed when combining."
						endif
					else
						ui_video_editor_warning text = "You have reached the maximum number of combined effects on this effect."
					endif
				endif
			endif
			ui_create_video_editor_gfx
			case Video_Editor_NewOverlays_Pane
			resolvescreenelementid id = {<menu> child = $video_editor_pane_selection}
			if NOT gotparam resolved_id
				return true
			endif
			<resolved_id> :gettags
			if gotparam locked
				ui_video_editor_warning text = "This overlay cannot be inserted until you have purchased it."
				return true
			endif
			if ui_video_editor_can_add_to_array array = ($ve_current_edit_overlays)
				bink_name = (($video_editor_bink_list) [$video_editor_pane_selection])
				if ve_overlays_break_bink_limit overlays = ($ve_current_edit_overlays) bink = <bink_name>
					ui_video_editor_warning text = "Adding this overlay would break the unique-overlays-in-an-edit limit."
				else
					length = ($video_editor_default_overlay_length)
					if NOT ui_video_editor_can_add_overlay length = <length>
						ve_get_clips_entire_length clips = ($ve_current_edit_clips)
						ve_get_array_end_time array = ($ve_current_edit_overlays)
						add_length = (<entire_length> - <end_time>)
						if (<add_length> >= ($video_editor_minimum_effect_length))
							length = <add_length>
						endif
					endif
					if ui_video_editor_can_add_overlay length = <length>
						if ui_video_editor_can_add_unique_overlay add_overlay = <bink_name>
							ve_add_overlay_to_edit {
								overlays = ($ve_current_edit_overlays)
								add_overlay = <bink_name>
								len = <length>
							}
							change ve_current_edit_overlays = <overlays>
							getarraysize $ve_current_edit_overlays
							change video_cursor_column = (<array_size> - 1)
							video_editor_update_timeline_to_selected
							ui_create_video_editor_gfx
						else
							ui_video_editor_warning text = "Only three unique overlays allowed per edit."
						endif
					else
						ui_video_editor_warning text = "There is no room in the timeline for a new overlay."
					endif
				endif
			else
				ui_video_editor_warning text = "You have reached the maximum number of allowed overlays in this edit."
			endif
			case Video_Editor_Audio_Track_Pane
			new_track = ($ve_playlist_tracks [($video_editor_pane_selection)])
			change ve_current_edit_audio = {music = (<new_track>.asset) music_start = 0.0}
			default
			if gotparam array
				video_editor_choose_valid pad_choose_script = (((<array>) [$video_editor_pane_selection]).pad_choose_script)
			endif
		endswitch
		spawnscriptnow ve_preview_seek params = {
			clips = ($ve_current_edit_clips)
			preview_time = $video_timeline_cursor
			viewport = video_editor_viewport
		}
		change video_editor_update_bars = -1
		return true
	endif
	return false
endscript

script video_editor_choose_valid pad_choose_script = nullscript
	if ($video_cursor_row = 0)
		if NOT video_editor_clip_selected
			if NOT (<pad_choose_script> = pane_other_add_clip)
				ui_video_editor_warning text = "This selection is not available until a clip is inserted."
			else
				<pad_choose_script>
			endif
		else
			<pad_choose_script>
		endif
	elseif ($video_cursor_row = 1)
		if NOT video_editor_effect_selected
			if NOT (<pad_choose_script> = pane_other_add_fx)
				ui_video_editor_warning text = "This selection is not available until an effect is inserted."
			else
				getarraysize $ve_current_edit_clips
				if (<array_size> = 0)
					ui_video_editor_warning text = "This selection is not available until a clip is inserted."
				else
					<pad_choose_script>
				endif
			endif
		else
			<pad_choose_script>
		endif
	elseif ($video_cursor_row = 2)
		if NOT video_editor_overlay_selected
			if NOT (<pad_choose_script> = pane_other_add_overlay)
				ui_video_editor_warning text = "This selection is not available until an overlay is inserted."
			else
				getarraysize $ve_current_edit_clips
				if (<array_size> = 0)
					ui_video_editor_warning text = "This selection is not available until a clip is inserted."
				else
					<pad_choose_script>
				endif
			endif
		else
			<pad_choose_script>
		endif
	elseif ($video_cursor_row = -1)
		getarraysize $ve_current_edit_clips
		if (<array_size> = 0)
			ui_video_editor_warning text = "This selection is not available until a clip is inserted."
		else
			<pad_choose_script>
		endif
	elseif ($video_cursor_row = -3)
		if NOT getglobalflag flag = $VIDEO_EDIT_SUBMIT_ENABLED
			ui_video_editor_warning text = "This selection is not available until Tony Hawk's training missions have been completed."
		else
			getarraysize $ve_current_edit_clips
			if (<array_size> = 0)
				ui_video_editor_warning text = "This selection is not available until a clip is inserted."
			else
				<pad_choose_script>
			endif
		endif
	else
		getarraysize $ve_current_edit_clips
		if (<array_size> = 0)
			if NOT ((<pad_choose_script> = ui_video_editor_zoom) || (<pad_choose_script> = ui_video_editor_delete_edit))
				ui_video_editor_warning text = "This selection is not available until a clip is inserted."
			else
				<pad_choose_script>
			endif
		else
			<pad_choose_script>
		endif
	endif
endscript

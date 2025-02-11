setting_menu_font = text_a5
g_setting_start_pos = (460.0, 100.0)
setting_menu_index = 1
setting_version_string_scale = 0.45000002
setting_version_loc_root = (25.0, 50.0)
setting_version_loc_text_off = (15.0, 10.0)
setting_poster_loc_root = (640.0, 340.0)
setting_menu_num_selections = 4
menu_setting_current_index = 0

script create_setting_menu 
	Change \{setting_version_loc_root = (25.0, 50.0)}
	disable_props = {rgba = [255 128 128 255] tag_disabled}
	font_size = 0.95
	bluish = [130 160 175 255]
	set_focus_color \{rgba = [
			223
			223
			223
			255
		]}
	set_unfocus_color rgba = <red>
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = set_container
		Scale = 1.1
		Pos = (-20.0, -20.0)}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	if ($enable_saving = 0)
		saveload_props = {rgba = [128 128 128 255] tag_disabled}
	else
		saveload_props = {}
	endif
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] tag_disabled}
	else
		demo_mode_disable = {}
	endif
	Change \{setting_menu_index = 1}
	rot = 3
	displaySprite parent = set_container tex = options_main_poster Pos = $setting_poster_loc_root dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaySprite parent = set_container id = om_black_bg tex = setting_main_highlight Pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	titleScale = 1.2
	if ((German) || (Spanish))
		titleScale = 1.5
	endif
	text_setting_desc_root_loc = (746.0, 110.0)
	displayText parent = set_container text = "SETTINGS" Pos = <text_setting_desc_root_loc> Scale = <titleScale> just = [center center] rgba = [50 0 0 255] font = text_a11_Large z = 10 rot = (<rot> -3) noshadow
	displayText parent = set_container text = "SETTINGS" Pos = (<text_setting_desc_root_loc> + (-5.0, 5.0)) Scale = <titleScale> just = [center center] rgba = [160 130 105 255] font = text_a11_Large z = 9 rot = (<rot> -2) noshadow
	displaySprite parent = set_container id = setting_monster tex = options_main_monster Pos = (735.0, 320.0) dims = (256.0, 512.0) z = 15 just = [center center] rot_angle = <rot> flip_v
	RunScriptOnScreenElement \{id = setting_monster
		set_anim_float}
	text_params = {parent = set_container Type = TextElement font = ($setting_menu_font) rgba = ($menu_unfocus_color) Scale = <font_size> rot_angle = <rot> z_priority = 10}
	CreateScreenElement {
		<text_params>
		id = set_text_1
		text = "ADJUSTMENTS"
		Pos = (508.0, 100.0)
		Scale = 0.7
		Enabled = 0
		event_handlers = [
			{focus setting_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_adjustments}}
			{pad_up setting_change_index params = {move = up}}
			{pad_down setting_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (512.0, 93.0) bg_dims = (190.0, 53.0)
	CreateScreenElement {
		<text_params>
		id = set_text_2
		text = "SONG DISABLING"
		Pos = (506.0, 140.0)
		Scale = 0.6
		event_handlers = [
			{focus setting_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_restricted}}
			{pad_up setting_change_index params = {move = up}}
			{pad_down setting_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (510.0, 135.0) bg_dims = (190.0, 39.0)
	CreateScreenElement {
		<text_params>
		id = set_text_3
		text = "SONG FADING"
		Pos = (506.0, 184.0)
		Scale = 0.65000004
		Enabled = 1
		event_handlers = [
			{focus setting_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_fade}}
			{pad_up setting_change_index params = {move = up}}
			{pad_down setting_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (506.0, 178.0) bg_dims = (190.0, 50.0)
	CreateScreenElement {
		<text_params>
		id = set_text_4
		text = "VOLUME"
		Pos = (503.0, 225.0)
		Scale = 0.48000002
		event_handlers = [
			{focus setting_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_settings}}
			{pad_up setting_change_index params = {move = up}}
			{pad_down setting_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (505.0, 221.0) bg_dims = (192.0, 38.0)
	displaySprite \{parent = set_container
		tex = tape_H_03
		Pos = (420.0, 590.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_H_03
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = set_container
		tex = tape_H_04
		Pos = (309.0, 55.0)
		Scale = 0.5
		z = 20
		rot_angle = -20}
	displaySprite {
		parent = <id>
		tex = tape_H_04
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = set_container
		tex = tape_V_02
		Pos = (840.0, 380.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_V_02
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = set_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	Change \{menu_setting_current_index = 1}
	LaunchEvent \{Type = focus
		target = set_text_1}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	begin
	index = ($menu_setting_current_index)
	formatText checksumName = text_id 'set_text_%d' d = <index>
	<text_id> :GetTags
	if is_disabled id = <text_id>
		LaunchEvent Type = unfocus target = <text_id>
		LaunchEvent Type = pad_down target = <text_id>
		<text_id> :SetProps rgba = [255 128 128 255]
	else
		break
	endif
	repeat
endscript

script set_anim_float 
	if NOT ScreenElementExists \{id = setting_monster}
		return
	endif
	GetScreenElementProps \{id = setting_monster}
	base_pos = <Pos>
	setting_monster :DoMorph \{Pos = {
			(0.0, 20.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	begin
	setting_monster :DoMorph \{Pos = {
			(0.0, -40.0)
			relative
		}
		time = 0.5
		motion = ease_out}
	setting_monster :DoMorph \{Pos = {
			(0.0, 40.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	repeat
endscript

script destroy_setting_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = set_container}
	destroy_menu \{menu_id = om_scroll}
endscript

script setting_change_index \{move = up}
	formatText checksumName = last_text_id 'set_text_%d' d = ($menu_setting_current_index)
	if (<move> = up)
		if ($menu_setting_current_index = 1)
			Change \{menu_setting_current_index = $setting_menu_num_selections}
		else
			Change menu_setting_current_index = ($menu_setting_current_index - 1)
		endif
	else
		if ($menu_setting_current_index = $setting_menu_num_selections)
			Change \{menu_setting_current_index = 1}
		else
			Change menu_setting_current_index = ($menu_setting_current_index + 1)
		endif
	endif
	index = ($menu_setting_current_index)
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'set_text_%d' d = <index>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script setting_menu_hilight 
	index = ($menu_setting_current_index)
	GetTags
	printf "setting_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	SetScreenElementProps id = om_black_bg Pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript

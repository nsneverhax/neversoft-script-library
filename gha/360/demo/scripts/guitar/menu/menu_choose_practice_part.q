menu_choose_practice_part_font = fontgrid_title_gh3

script create_choose_practice_part_menu 
	printf \{"create_choose_practice_part_menu"}
	spawnscriptnow \{menu_music_on}
	kill_start_key_binding
	menu_pos = (845.0, 258.0)
	createscreenelement \{type = containerelement
		id = cpp_container
		parent = root_window
		just = [
			left
			top
		]
		pos = (0.0, 0.0)}
	new_menu scrollid = cpp_scroll vmenuid = cpp_vmenu menu_pos = <menu_pos> spacing = -45
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = spriteelement
		parent = cpp_container
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
	displaysprite \{parent = cpp_container
		tex = practice_poster_3
		pos = (186.0, 15.0)
		dims = (672.0, 672.0)
		rot_angle = -2
		z = 1}
	displaysprite \{parent = cpp_container
		tex = toprockers_tape_2
		pos = (500.0, 650.0)
		z = 3
		rot_angle = -12
		flip_v}
	displaysprite \{parent = cpp_container
		tex = toprockers_tape_1
		pos = (565.0, -95.0)
		z = 3
		rot_angle = 80}
	displaysprite \{parent = cpp_container
		tex = toprockers_tape_2
		pos = (500.0, -85.0)
		z = 3
		rot_angle = 80}
	displaysprite \{parent = cpp_container
		tex = toprockers_tape_2
		pos = (435.0, -75.0)
		z = 3
		rot_angle = 78}
	createscreenelement {
		type = textblockelement
		parent = cpp_container
		id = header
		text = "PRACTICE PART"
		pos = (360.0, 70.0)
		dims = (100.0, 300.0)
		scale = 1.5
		just = [left top]
		internal_just = [left top]
		line_spacing = 0.62
		rgba = [35 100 130 255]
		font = ($menu_choose_practice_part_font)
		z = 2
		rot_angle = -2
	}
	getscreenelementchildren id = <id>
	getarraysize (<children>)
	i = 0
	begin
	getscreenelementdims id = (<children> [<i>])
	width_to_check_for = 225
	if (<i> = 1)
		<width_to_check_for> = 120
	endif
	if (<width> > <width_to_check_for>)
		fit_text_in_rectangle id = (<children> [<i>]) dims = (<width_to_check_for> * (1.0, 0.0) + <height> * (0.0, 1.0))
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	displaysprite \{parent = cpp_container
		tex = dialog_bg
		pos = (680.0, 256.0)
		dims = (332.0, 70.0)
		z = 2}
	displaysprite \{parent = cpp_container
		tex = dialog_bg
		flip_h
		pos = (680.0, 326.0)
		dims = (332.0, 70.0)
		z = 2}
	displaysprite {
		id = cpp_hi_left
		parent = cpp_container
		tex = dialog_highlight
		flip_v
		pos = (720.0, 325.0)
		z = 5
		just = [right center]
		rgba = (($g_menu_colors).pink)
	}
	displaysprite {
		id = cpp_hi_right
		parent = cpp_container
		tex = dialog_highlight
		pos = (910.0, 325.0)
		z = 5
		just = [left center]
		rgba = (($g_menu_colors).pink)
	}
	guitar_or_lead_text = "GUITAR"
	bass_or_rhythm_text = "BASS"
	get_song_rhythm_track song = ($current_song)
	if (<rhythm_track> = 1)
		<guitar_or_lead_text> = "LEAD"
		<bass_or_rhythm_text> = "RHYTHM"
	endif
	set_focus_color \{color = pink}
	set_unfocus_color \{color = dk_violet_grey}
	createscreenelement \{type = containerelement
		id = cpp_guitar
		parent = cpp_vmenu
		event_handlers = [
			{
				focus
				retail_menu_focus
				params = {
					id = guitar_text
				}
			}
			{
				focus
				menu_choose_practice_part_highlighter
				params = {
					text_id = guitar_text
					guitar
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = guitar_text
				}
			}
			{
				pad_choose
				practicemenu_select_part
				params = {
					part = guitar
				}
			}
			{
				pad_back
				practicemenu_go_back
			}
		]
		dims = (100.0, 100.0)}
	createscreenelement {
		type = textelement
		font = ($menu_choose_practice_part_font)
		parent = cpp_guitar
		id = guitar_text
		text = <guitar_or_lead_text>
		scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		z_priority = 5
		just = [center center]
	}
	getscreenelementdims id = <id>
	if (<width> > 250)
		fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0))
	endif
	createscreenelement \{type = containerelement
		id = cpp_bass
		parent = cpp_vmenu
		event_handlers = [
			{
				focus
				retail_menu_focus
				params = {
					id = bass_text
				}
			}
			{
				focus
				menu_choose_practice_part_highlighter
				params = {
					text_id = bass_text
					bass
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = bass_text
				}
			}
			{
				pad_choose
				practicemenu_select_part
				params = {
					part = rhythm
				}
			}
			{
				pad_back
				practicemenu_go_back
			}
		]
		dims = (100.0, 100.0)}
	createscreenelement {
		type = textelement
		font = ($menu_choose_practice_part_font)
		parent = cpp_bass
		id = bass_text
		text = <bass_or_rhythm_text>
		scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		z_priority = 5
		just = [center center]
	}
	getscreenelementdims id = <id>
	if (<width> > 250)
		fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0))
	endif
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
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
endscript

script menu_choose_practice_part_highlighter 
	getscreenelementdims id = <text_id>
	y_off = (0.0, 0.0)
	if gotparam \{bass}
		<y_off> = (0.0, 60.0)
	endif
	new_pos_l = ((840.0, 295.0) + <y_off> - <width> * (0.5, 0.0))
	new_pos_r = ((850.0, 295.0) + <y_off> + <width> * (0.5, 0.0))
	if gotparam \{guitar}
		setscreenelementprops id = cpp_hi_left pos = <new_pos_l> preserve_flip
		setscreenelementprops id = cpp_hi_right pos = <new_pos_r>
	elseif gotparam \{bass}
		setscreenelementprops id = cpp_hi_left pos = <new_pos_l> preserve_flip
		setscreenelementprops id = cpp_hi_right pos = <new_pos_r>
	endif
endscript

script destroy_choose_practice_part_menu 
	destroy_pause_menu_frame
	restore_start_key_binding
	destroy_menu_backdrop
	destroy_menu \{menu_id = cpp_scroll}
	destroy_menu \{menu_id = cpp_container}
	clean_up_user_control_helpers
	reset_focus_colors
endscript

script practicemenu_select_part 
	change structurename = player1_status part = <part>
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script practicemenu_go_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

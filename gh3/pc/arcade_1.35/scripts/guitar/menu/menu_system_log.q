log_screen_root_pos = (640.0, 360.0)
log_screen_frame_offset = (0.0, -18.0)
log_screen_title_offset = (0.0, -300.0)
log_screen_index_offset = (250.0, -285.0)
log_screen_text_offset = (-350.0, -165.0)
log_max_display_lines = 24
log_screen_up_arrow_pos = (640.0, 185.0)
log_screen_down_arrow_pos = (640.0, 620.0)
log_text_scale = 0.45000002
log_text_line_offset = (0.0, 17.0)
log_screen_line_index = 1

script create_system_log_menu 
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = system_log_container}
	CreateScreenElement \{Type = SpriteElement
		id = system_log_light_overlay
		parent = system_log_container
		texture = Venue_Overlay
		Pos = $log_screen_root_pos
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite {
		parent = system_log_container
		tex = Online_Frame_Large
		Pos = ($log_screen_root_pos + $log_screen_frame_offset)
		Scale = (1.25, 1.25)
		rgba = [255 0 0 255]
		just = [center center]
		z = 1
		rot_angle = -2
	}
	displayText {
		parent = system_log_container
		text = "EVENT LOG"
		Pos = ($log_screen_root_pos + $log_screen_title_offset)
		just = [center top]
		z = 101
		rgba = [255 255 255 255]
		Scale = 1.5
		font = text_a5
		rot_angle = -10
	}
	CreateScreenElement \{Type = ContainerElement
		parent = system_log_container
		id = system_log_window
		event_handlers = [
			{
				pad_up
				system_log_scroll
				params = {
					move = up
				}
			}
			{
				pad_down
				system_log_scroll
				params = {
					move = down
				}
			}
			{
				pad_back
				menu_flow_go_back
			}
		]}
	displaySprite \{parent = system_log_window
		id = system_log_down_arrow
		tex = Char_Select_Menu_Arrow
		Pos = $log_screen_down_arrow_pos
		just = [
			top
			left
		]
		rot_angle = 0
		Scale = 0.4
		z_priority = 51}
	displaySprite \{parent = system_log_window
		id = system_log_up_arrow
		tex = Char_Select_Menu_Arrow
		Pos = $log_screen_up_arrow_pos
		just = [
			top
			left
		]
		rot_angle = 180
		Scale = 0.4
		z_priority = 51}
	CreateScreenElement \{Type = ContainerElement
		parent = system_log_container
		id = system_log_text}
	system_log_up_arrow :SetProps \{Hide}
	GetNumLogFileLines
	printf "rt_debug: %d lines in debug file" d = <num_log_lines>
	if (<num_log_lines> < $log_max_display_lines)
		log_display_lines = <num_log_lines>
		system_log_down_arrow :SetProps \{Hide}
	else
		log_display_lines = $log_max_display_lines
	endif
	if (<num_log_lines>)
		formatText TextName = index_str "1/%e" e = <num_log_lines>
	endif
	displayText {
		parent = system_log_container
		text = <index_str>
		id = system_log_index
		Pos = ($log_screen_root_pos + $log_screen_index_offset)
		just = [center top]
		z = 101
		rgba = [255 255 255 255]
		Scale = 0.5
		font = text_a3
		rot_angle = -10
	}
	print_linenum = $log_screen_line_index
	system_log_draw_lines start_line = 1 log_display_lines = <log_display_lines>
	LaunchEvent \{Type = focus
		target = system_log_window}
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
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_system_log_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = system_log_container}
endscript

script get_system_log_entry 
	printf "get_system_log_entry: called with message_num=%d" d = <message_num>
	GetNumLogFileLines
	printf "get_system_log_entry: num_log_lines=%d" d = <num_log_lines>
	if (<num_log_lines>)
		if (<message_num> > <num_log_lines>)
			cur_log_line = ''
		else
			GetLogFileLines firstStr = <message_num> lastStr = <message_num>
			cur_log_line = <strnum1>
		endif
	else
		cur_log_line = ''
	endif
	return log_line = <cur_log_line>
endscript

script system_log_draw_lines 
	printf "system_log_draw_lines: called with start_line = %d, log_display_lines=%e" d = <start_line> e = <log_display_lines>
	print_linenum = <start_line>
	log_text_pos = ($log_screen_root_pos + $log_screen_text_offset)
	if (<log_display_lines>)
		begin
		GetLogFileLine whichLine = <print_linenum>
		formatText TextName = temp_str "%s" s = <log_line>
		displayText parent = system_log_text text = <temp_str> Pos = <log_text_pos> just = [top left] rgba = [250 250 250 255] font = text_a3 Scale = $log_text_scale z = 10 noshadow
		<log_text_pos> = (<log_text_pos> + $log_text_line_offset)
		<print_linenum> = (<print_linenum> + 1)
		repeat <log_display_lines>
	endif
endscript

script system_log_scroll 
	printf "system_log_scroll: move = %d" d = <move>
	GetNumLogFileLines
	if (<num_log_lines> < $log_max_display_lines)
		log_display_lines = <num_log_lines>
		system_log_down_arrow :SetProps \{Hide}
	else
		log_display_lines = $log_max_display_lines
	endif
	switch <move>
		case up
		if ($log_screen_line_index > 1)
			DestroyScreenElement \{id = system_log_text}
			CreateScreenElement \{Type = ContainerElement
				parent = system_log_container
				id = system_log_text}
			Change log_screen_line_index = ($log_screen_line_index - 1)
			printf \{"system_log_scroll: scroll up detected, log_screen_line_index = %d"
				d = $log_screen_line_index}
			formatText TextName = index_str "%d/%e" d = $log_screen_line_index e = <num_log_lines>
			system_log_index :SetProps text = <index_str>
			if ($log_screen_line_index = 1)
				printf \{"system_log_scroll: log_screen_line_index is one, hiding"}
				system_log_up_arrow :SetProps \{Hide}
			else
				printf \{"system_log_scroll: log_screen_line_index is greater than one, unhiding"}
				system_log_up_arrow :SetProps \{unhide}
			endif
			if ((<num_log_lines> + $log_screen_line_index) < $log_max_display_lines)
				log_display_lines = <num_log_lines>
				system_log_down_arrow :SetProps \{Hide}
			else
				log_display_lines = $log_max_display_lines
				system_log_down_arrow :SetProps \{unhide}
			endif
			system_log_draw_lines start_line = $log_screen_line_index log_display_lines = <log_display_lines>
		endif
		case down
		if ((<num_log_lines> + $log_screen_line_index) > $log_max_display_lines)
			if (($log_max_display_lines + ($log_screen_line_index + 1)) <= <num_log_lines>)
				DestroyScreenElement \{id = system_log_text}
				CreateScreenElement \{Type = ContainerElement
					parent = system_log_container
					id = system_log_text}
				Change log_screen_line_index = ($log_screen_line_index + 1)
				printf \{"system_log_scroll: scroll down detected, log_screen_line_index = %d"
					d = $log_screen_line_index}
				formatText TextName = index_str "%d/%e" d = $log_screen_line_index e = <num_log_lines>
				system_log_index :SetProps text = <index_str>
				if ((<num_log_lines> + $log_screen_line_index) < $log_max_display_lines)
					log_display_lines = <num_log_lines>
					system_log_down_arrow :SetProps \{Hide}
				else
					log_display_lines = $log_max_display_lines
					system_log_down_arrow :SetProps \{unhide}
				endif
				system_log_draw_lines start_line = $log_screen_line_index log_display_lines = <log_display_lines>
				system_log_up_arrow :SetProps \{unhide}
			endif
		endif
	endswitch
endscript

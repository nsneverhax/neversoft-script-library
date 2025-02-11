menu_lamp_test_current_index = 0
menu_lamp_test_total_menu_items = 0
menu_lamp_test_element_info = [
	{
		text = "TOGGLE ALL LAMPS"
		handler = lamp_test_all
		Pos = (650.0, 275.0)
	}
	{
		text = "TOGGLE MARQUEE LAMPS"
		handler = lamp_test_marquee
		Pos = (650.0, 320.0)
	}
	{
		text = "TOGGLE START LAMPS"
		handler = lamp_test_start
		Pos = (650.0, 365.0)
	}
	{
		text = "TOGGLE SPEAKER LAMPS: ALL"
		handler = lamp_test_speaker
		Pos = (650.0, 410.0)
	}
	{
		text = "TOGGLE SPEAKER LAMPS: RED"
		handler = lamp_test_speaker_red
		Pos = (650.0, 455.0)
	}
	{
		text = "TOGGLE SPEAKER LAMPS: ORANGE"
		handler = lamp_test_speaker_orange
		Pos = (650.0, 500.0)
	}
	{
		text = "TOGGLE SPEAKER LAMPS: BLUE"
		handler = lamp_test_speaker_blue
		Pos = (650.0, 545.0)
	}
]
menu_lamp_test_root_pos = (506.0, 100.0)
menu_lamp_test_offset = (0.0, 60.0)

script create_lamp_test_menu 
	lamps_all_off
	Change \{lamp_test_all_on = 0}
	Change \{lamp_test_marquee_on = 0}
	Change \{lamp_test_start_on = 0}
	Change \{lamp_test_speaker_on = 0}
	Change \{lamp_test_speaker_red_on = 0}
	Change \{lamp_test_speaker_orange_on = 0}
	Change \{lamp_test_speaker_blue_on = 0}
	Change \{menu_lamp_test_current_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = lamp_test_container}
	displaySprite \{parent = lamp_test_container
		tex = controller_config_poster
		Pos = (640.0, 360.0)
		dims = (700.0, 700.0)
		just = [
			center
			center
		]
		rot_angle = -3}
	displaySprite \{parent = lamp_test_container
		tex = Tape_V_01
		Pos = (1000.0, 310.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = lamp_test_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (997.0, 313.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = lamp_test_container
		tex = tape_H_02
		Pos = (270.0, 485.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = lamp_test_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (267.0, 488.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	text_lamp_test_desc_root_loc = (650.0, 165.0)
	displayText parent = lamp_test_container text = "LAMP TEST" Pos = <text_lamp_test_desc_root_loc> Scale = 1 just = [center center] rgba = [250 250 250 255] font = text_a11_Large z = 10 rot_angle = -1
	GetArraySize \{$menu_lamp_test_element_info}
	Change menu_lamp_test_total_menu_items = <array_Size>
	set_focus_color \{rgba = [
			230
			171
			60
			255
		]}
	set_unfocus_color \{rgba = [
			255
			255
			255
			255
		]}
	text_params = {parent = lamp_test_container
		Type = TextElement
		font = text_a5
		rgba = ($menu_unfocus_color)
		Scale = 1.0
		rot_angle = -1
		z_priority = 10
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (-1.5, 1.5)
	}
	index = 0
	cur_menu_pos = <menu_lamp_test_root_pos>
	begin
	formatText checksumName = lamp_test_text_name 'lamp_test_text_%i' i = <index>
	CreateScreenElement {
		<text_params>
		id = <lamp_test_text_name>
		text = ($menu_lamp_test_element_info [<index>].text)
		Pos = ($menu_lamp_test_element_info [<index>].Pos)
		Scale = 1
		Enabled = 1
		event_handlers = [
			{focus lamp_test_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ($menu_lamp_test_element_info [<index>].handler)}
			{pad_up lamp_test_change_index params = {move = up}}
			{pad_down lamp_test_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<cur_menu_pos> = (<cur_menu_pos> + <menu_lamp_test_offset>)
	<index> = (<index> + 1)
	repeat $menu_lamp_test_total_menu_items
	LaunchEvent \{Type = focus
		target = lamp_test_text_0}
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
endscript

script destroy_lamp_test_menu 
	lamps_all_off
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = lamp_test_container}
	destroy_menu \{menu_id = lamp_test_scroll}
endscript

script lamp_test_change_index \{move = up}
	formatText checksumName = last_text_id 'lamp_test_text_%d' d = ($menu_lamp_test_current_index)
	if (<move> = up)
		if ($menu_lamp_test_current_index = 0)
			Change menu_lamp_test_current_index = ($menu_lamp_test_total_menu_items - 1)
		else
			Change menu_lamp_test_current_index = ($menu_lamp_test_current_index - 1)
		endif
	else
		if ($menu_lamp_test_current_index = ($menu_lamp_test_total_menu_items - 1))
			Change \{menu_lamp_test_current_index = 0}
		else
			Change menu_lamp_test_current_index = ($menu_lamp_test_current_index + 1)
		endif
	endif
	index = ($menu_lamp_test_current_index)
	printf "lamp_test_change_index: index now %d" d = <index>
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'lamp_test_text_%d' d = <index>
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

script lamp_test_menu_hilight 
	index = ($menu_lamp_test_current_index)
	GetTags
	printf "lamp_test_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	retail_menu_focus
endscript
LAMP_RED = 0
LAMP_GREEN = 1
LAMP_BLUE = 2
LAMP_START1 = 3
LAMP_START2 = 4
LAMP_UPPER_RIGHT = 5
LAMP_LOWER_RIGHT = 6
LAMP_LOWER_LEFT = 7
LAMP_UPPER_LEFT = 8
NUM_LAMPS = 9
JAMMA_HI_PWM_UNASSIGNED1 = 0
JAMMA_HI_PWM_UNASSIGNED2 = 1
JAMMA_HI_PWM_GREEN = 2
JAMMA_HI_PWM_RED = 3
JAMMA_HI_PWM_UNASSIGNED3 = 4
JAMMA_HI_PWM_START1 = 5
JAMMA_HI_PWM_UNASSIGNED4 = 6
JAMMA_HI_PWM_START2 = 7
JAMMA_HI_PWM_UNASSIGNED5 = 8
JAMMA_HI_PWM_UNASSIGNED6 = 9
JAMMA_HI_PWM_UNASSIGNED7 = 10
JAMMA_HI_PWM_BLUE = 11
JAMMA_HI_PWM_UPPER_RIGHT = 12
JAMMA_HI_PWM_LOWER_RIGHT = 13
JAMMA_HI_PWM_LOWER_LEFT = 14
JAMMA_HI_PWM_UPPER_LEFT = 15
JAMMA_HI_FULL_BRIGHT = 4095
JAMMA_HI_OFF = 0
lamp_test_all_on = 0
lamp_test_marquee_on = 0
lamp_test_start_on = 0
lamp_test_speaker_on = 0
lamp_test_speaker_red_on = 0
lamp_test_speaker_orange_on = 0
lamp_test_speaker_blue_on = 0

script lamp_test_all 
	if (lamp_test_all_on = 0)
		SetLampValue \{lampnum = $LAMP_GREEN
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_BLUE
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_RED
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_START1
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_START2
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_UPPER_RIGHT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_LOWER_RIGHT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_LOWER_LEFT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_UPPER_LEFT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_all_on = 1}
		Change \{lamp_test_marquee_on = 1}
		Change \{lamp_test_start_on = 1}
		Change \{lamp_test_speaker_on = 1}
		Change \{lamp_test_speaker_red_on = 1}
		Change \{lamp_test_speaker_orange_on = 1}
		Change \{lamp_test_speaker_blue_on = 1}
	else
		SetLampValue \{lampnum = $LAMP_GREEN
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_BLUE
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_RED
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_START1
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_START2
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_UPPER_RIGHT
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_LOWER_RIGHT
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_LOWER_LEFT
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_UPPER_LEFT
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_all_on = 0}
		Change \{lamp_test_marquee_on = 0}
		Change \{lamp_test_start_on = 0}
		Change \{lamp_test_speaker_on = 0}
		Change \{lamp_test_speaker_red_on = 0}
		Change \{lamp_test_speaker_orange_on = 0}
		Change \{lamp_test_speaker_blue_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamp_test_marquee 
	if (lamp_test_marquee_on = 0)
		SetLampValue \{lampnum = $LAMP_UPPER_RIGHT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_LOWER_RIGHT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_LOWER_LEFT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_UPPER_LEFT
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_marquee_on = 1}
		if ($lamp_test_start_on && $lamp_test_speaker_on)
			Change \{lamp_test_all_on = 1}
		endif
	else
		SetLampValue \{lampnum = $LAMP_UPPER_RIGHT
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_LOWER_RIGHT
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_LOWER_LEFT
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_UPPER_LEFT
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_marquee_on = 0}
		Change \{lamp_test_all_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamp_test_start 
	if (lamp_test_start_on = 0)
		SetLampValue \{lampnum = $LAMP_START1
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_START2
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_start_on = 1}
		if ($lamp_test_marquee_on && $lamp_test_speaker_on)
			Change \{lamp_test_all_on = 1}
		endif
	else
		SetLampValue \{lampnum = $LAMP_START1
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_START2
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_start_on = 0}
		Change \{lamp_test_all_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamp_test_speaker 
	if (lamp_test_speaker_on = 0)
		SetLampValue \{lampnum = $LAMP_GREEN
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_BLUE
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		SetLampValue \{lampnum = $LAMP_RED
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_speaker_on = 1}
		Change \{lamp_test_speaker_red_on = 1}
		Change \{lamp_test_speaker_orange_on = 1}
		Change \{lamp_test_speaker_blue_on = 1}
		if ($lamp_test_marquee_on && $lamp_test_start_on)
			Change \{lamp_test_all_on = 1}
		endif
	else
		SetLampValue \{lampnum = $LAMP_GREEN
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_BLUE
			pwmval = $JAMMA_HI_OFF}
		SetLampValue \{lampnum = $LAMP_RED
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_speaker_on = 0}
		Change \{lamp_test_speaker_red_on = 0}
		Change \{lamp_test_speaker_orange_on = 0}
		Change \{lamp_test_speaker_blue_on = 0}
		Change \{lamp_test_all_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamp_test_speaker_red 
	if (lamp_test_speaker_red_on = 0)
		SetLampValue \{lampnum = $LAMP_RED
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_speaker_red_on = 1}
		if ($lamp_test_speaker_orange_on = 1 && $lamp_test_speaker_blue_on = 1)
			Change \{lamp_test_speaker_on = 1}
			if ($lamp_test_marquee_on && $lamp_test_start_on)
				Change \{lamp_test_all_on = 1}
			endif
		endif
	else
		SetLampValue \{lampnum = $LAMP_RED
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_speaker_on = 0}
		Change \{lamp_test_speaker_red_on = 0}
		Change \{lamp_test_all_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamp_test_speaker_orange 
	if (lamp_test_speaker_orange_on = 0)
		SetLampValue \{lampnum = $LAMP_GREEN
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_speaker_orange_on = 1}
		if ($lamp_test_speaker_red_on = 1 && $lamp_test_speaker_blue_on = 1)
			Change \{lamp_test_speaker_on = 1}
			if ($lamp_test_marquee_on && $lamp_test_start_on)
				Change \{lamp_test_all_on = 1}
			endif
		endif
	else
		SetLampValue \{lampnum = $LAMP_GREEN
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_speaker_on = 0}
		Change \{lamp_test_speaker_orange_on = 0}
		Change \{lamp_test_all_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamp_test_speaker_blue 
	if (lamp_test_speaker_blue_on = 0)
		SetLampValue \{lampnum = $LAMP_BLUE
			pwmval = $JAMMA_HI_FULL_BRIGHT}
		Change \{lamp_test_speaker_blue_on = 1}
		if ($lamp_test_speaker_orange_on = 1 && $lamp_test_speaker_red_on = 1)
			Change \{lamp_test_speaker_on = 1}
			if ($lamp_test_marquee_on && $lamp_test_start_on)
				Change \{lamp_test_all_on = 1}
			endif
		endif
	else
		SetLampValue \{lampnum = $LAMP_BLUE
			pwmval = $JAMMA_HI_OFF}
		Change \{lamp_test_speaker_on = 0}
		Change \{lamp_test_speaker_blue_on = 0}
		Change \{lamp_test_all_on = 0}
	endif
	printf \{"lamp_test: all=%a marqee=%b start=%c speaker=%d red=%e orange=%f blue=%g"
		a = $lamp_test_all_on
		b = $lamp_test_marquee_on
		c = $lamp_test_start_on
		d = $lamp_test_speaker_on
		e = $lamp_test_speaker_red_on
		f = $lamp_test_speaker_orange_on
		g = $lamp_test_speaker_blue_on}
endscript

script lamps_all_off 
	SetLampValue \{lampnum = $LAMP_GREEN
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_BLUE
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_RED
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_START1
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_START2
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_UPPER_RIGHT
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_LOWER_RIGHT
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_LOWER_LEFT
		pwmval = $JAMMA_HI_OFF}
	SetLampValue \{lampnum = $LAMP_UPPER_LEFT
		pwmval = $JAMMA_HI_OFF}
endscript

serial_value = -1
serial_index = 0

script create_serial_menu 
	Change \{serial_value = 0}
	create_menu_backdrop \{texture = Unlock_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = serial_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		id = unlock_velvet_backdrop
		parent = serial_container
		texture = Unlock_Velvet
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 320.0)
		dims = (865.0, 420.0)
		just = [
			center
			center
		]
		z_priority = 10}
	displayText \{parent = serial_container
		text = "SERIAL NUMBER"
		Pos = (218.0, 45.0)
		z = 11
		Scale = 1.25
		just = [
			center
			center
		]
		rgba = [
			160
			130
			105
			255
		]
		font = text_a11_Large
		rot = -8
		noshadow}
	displayText \{parent = serial_container
		text = "SERIAL NUMBER"
		Pos = (213.0, 50.0)
		z = 11
		Scale = 1.25
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a11_Large
		rot = -7
		noshadow}
	displayText \{parent = serial_container
		text = "Enter cabinet serial to save value to dongle."
		Pos = (640.0, 615.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			160
			130
			105
			255
		]
		font = text_a4
		z = 11
		noshadow}
	displayText \{parent = serial_container
		text = "Serial number may be viewed in Test Mode."
		Pos = (640.0, 635.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			160
			130
			105
			255
		]
		font = text_a4
		z = 11
		noshadow}
	formatText \{TextName = serial_text_text
		"%a"
		a = $serial_value}
	CreateScreenElement {
		Type = TextElement
		id = serial_text
		parent = serial_container
		text = <serial_text_text>
		font = text_a11_Large
		Pos = (870.0, 280.0)
		z_priority = 20
		rgba = [223 223 223 255]
		just = [right center]
		Scale = 2.5
		font_spacing = 10
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_up serial_increase_digit}
			{pad_down serial_decrease_digit}
			{pad_choose serial_advance}
			{pad_back serial_retreat}
			{pad_square serial_confirm}
		]
	}
	LaunchEvent \{Type = focus
		target = serial_text}
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
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
endscript

script destroy_serial_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = serial_container}
	destroy_menu_backdrop
endscript

script serial_increase_digit 
	Change serial_value = ($serial_value + 1)
	MathMod \{a = $serial_value
		b = 10}
	if (<Mod> = 0)
		Change serial_value = ($serial_value -10)
	endif
	formatText \{TextName = serial_text_text
		"%a"
		a = $serial_value}
	serial_text :SetProps text = <serial_text_text>
endscript

script serial_decrease_digit 
	Change serial_value = ($serial_value -1)
	MathMod \{a = $serial_value
		b = 10}
	if (<Mod> = 9 || $serial_value < 0)
		Change serial_value = ($serial_value + 10)
	endif
	formatText \{TextName = serial_text_text
		"%a"
		a = $serial_value}
	serial_text :SetProps text = <serial_text_text>
endscript

script serial_advance 
	if ($serial_index > 3)
		return
	endif
	Change serial_index = ($serial_index + 1)
	Change serial_value = ($serial_value * 10)
	formatText \{TextName = serial_text_text
		"%a"
		a = $serial_value}
	serial_text :SetProps text = <serial_text_text>
endscript

script serial_retreat 
	if ($serial_index < 1)
		return
	endif
	Change serial_index = ($serial_index -1)
	MathMod \{a = $serial_value
		b = 10}
	Change serial_value = ($serial_value - <Mod>)
	Change serial_value = ($serial_value / 10)
	formatText \{TextName = serial_text_text
		"%a"
		a = $serial_value}
	serial_text :SetProps text = <serial_text_text>
endscript

script serial_confirm 
	if ($serial_value >= 0 && $serial_value <= 99999)
		dongleserialwrite \{serial = $serial_value}
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

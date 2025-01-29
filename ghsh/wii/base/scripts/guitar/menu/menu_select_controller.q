menu_select_controller_icon_positions = [
	{
		c = (500.0, 320.0)
		g = (500.0, 320.0)
		n = (616.0, 320.0)
	}
	{
		c = (900.0, 405.0)
		g = (900.0, 405.0)
		n = (926.0, 425.0)
	}
	{
		c = (565.0, 415.0)
		g = (565.0, 405.0)
	}
	{
		c = (670.0, 440.0)
		g = (670.0, 430.0)
	}
	{
		c = (655.0, 335.0)
		g = (655.0, 325.0)
	}
	{
		c = (630.0, 395.0)
		g = (630.0, 385.0)
	}
	{
		c = (610.0, 450.0)
		g = (610.0, 440.0)
	}
	{
		c = (700.0, 370.0)
		g = (700.0, 360.0)
	}
	{
		c = (595.0, 345.0)
		g = (595.0, 335.0)
	}
]
menu_select_controller_icon_rotations = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
menu_select_num_controllers = 0
menu_select_controller_p1_controller_id = -1
menu_select_controller_p2_controller_id = -1
menu_select_controller_light = [
	180
	180
	180
	255
]
menu_select_controller_dark = [
	100
	100
	100
	255
]
menu_select_controller_sticks_big = (192.0, 192.0)
menu_select_controller_sticks_small = (160.0, 160.0)
menu_select_controller_guitar_big = (384.0, 192.0)
menu_select_controller_guitar_small = (320.0, 160.0)
in_controller_select_menu = 0

script select_controller_drop_in_ready_sign 
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	if NOT ScreenElementExists id = <ready_container>
		create_ready_icons
	endif
	SetScreenElementProps id = <ready_container> alpha = 1
	formatText checksumName = sound_event 'CheckBox_Check_SFX_P%d' d = <Player>
	spawnscript SoundEvent params = {event = <sound_event>}
endscript

script select_controller_drop_out_ready_sign 
	formatText checksumName = ready_container 'ready_container_p%d' d = <Player>
	formatText checksumName = sound_event 'Checkbox_SFX_P%d' d = <Player>
	spawnscript SoundEvent params = {event = <sound_event>}
	SetScreenElementProps id = <ready_container> alpha = 0
endscript


script 0xad76ddf8 
	if 0x286d4d79
		0xacab4500
	else
		0x885e81a2
	endif
endscript

script 0x286d4d79 
	if IsGuitarController controller = ($primary_controller)
		return \{true}
	elseif isdrumcontroller controller = ($primary_controller)
		return \{true}
	endif
	return \{FALSE}
endscript

script 0xacab4500 
	generic_event_choose \{state = uistate_soundboard}
endscript

script 0x885e81a2 
	generic_event_choose \{state = 0xb47b35f3}
endscript

script 0x99f58d62 controller = ($primary_controller)
	create_popup_warning_menu \{textblock = {
			text = qs(0xca976f1e)
			dims = (800.0, 400.0)
			Scale = 0.55
		}
		no_background
		menu_pos = (640.0, 520.0)
		options = [
			{
				func = generic_event_back
				text = qs(0x320a8d1c)
			}
			{
				func = generic_event_back
				func_params = {
					state = uistate_mainmenu
				}
				text = qs(0xd95645dd)
			}
		]}
endscript

script 0x49ff0013 
	destroy_popup_warning_menu
endscript

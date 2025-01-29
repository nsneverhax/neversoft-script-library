
script ui_create_pausemenu_highwaytype 
	options = []
	new_option = {
		text = qs(0x737839f5)
		func = pausemenu_highwaytype_choose
		func_params = {highway_type = scrolling}
	}
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	new_option = {
		text = qs(0x305014bd)
		func = pausemenu_highwaytype_choose
		func_params = {highway_type = static}
	}
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	new_option = {
		text = qs(0xecc0f978)
		func = pausemenu_highwaytype_choose
		func_params = {highway_type = karaoke}
	}
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	if GotParam \{enable_pause}
		ui_create_pausemenu {
			title_text = qs(0xb416d1dc)
			options = <options>
			pad_back_script = generic_event_back
			enable_pause = <enable_pause>
			no_loop
		}
	else
		ui_create_pausemenu {
			title_text = qs(0xb416d1dc)
			options = <options>
			pad_back_script = generic_event_back
			no_loop
		}
	endif
endscript

script ui_destroy_pausemenu_highwaytype 
	ui_destroy_pausemenu
endscript

script pausemenu_highwaytype_choose 
	RemoveParameter \{base_name}
	generic_event_choose state = UIstate_pausemenu_highwaytype_warning data = {<...>}
endscript

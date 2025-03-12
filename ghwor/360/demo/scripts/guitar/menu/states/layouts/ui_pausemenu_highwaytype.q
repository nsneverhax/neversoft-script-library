
script ui_create_pausemenu_highwaytype 
	options = []
	new_option = {
		text = qs(0x737839f5)
		func = pausemenu_highwaytype_choose
		func_params = {highway_type = scrolling}
	}
	addarrayelement array = <options> element = <new_option>
	<options> = <array>
	new_option = {
		text = qs(0x305014bd)
		func = pausemenu_highwaytype_choose
		func_params = {highway_type = static}
	}
	addarrayelement array = <options> element = <new_option>
	<options> = <array>
	new_option = {
		text = qs(0xecc0f978)
		func = pausemenu_highwaytype_choose
		func_params = {highway_type = karaoke}
	}
	addarrayelement array = <options> element = <new_option>
	<options> = <array>
	<highway_index> = ($g_pausemenu_selected_index)
	if gotparam \{enable_pause}
		ui_create_pausemenu {
			title_text = qs(0x589b1fee)
			options = <options>
			pad_back_script = generic_event_back
			enable_pause = <enable_pause>
			focus_index = 0
		}
	else
		ui_create_pausemenu {
			title_text = qs(0x589b1fee)
			options = <options>
			pad_back_script = generic_event_back
			focus_index = 0
		}
	endif
	pause_menu_desc_id :settags highway_index = <highway_index>
endscript

script ui_destroy_pausemenu_highwaytype 
	pause_menu_desc_id :getsingletag \{highway_index}
	ui_destroy_pausemenu
	change g_pausemenu_selected_index = <highway_index>
endscript

script pausemenu_highwaytype_choose 
	ui_sfx \{menustate = generic
		uitype = select}
	removeparameter \{base_name}
	generic_event_choose state = uistate_pausemenu_highwaytype_warning data = {<...>}
endscript

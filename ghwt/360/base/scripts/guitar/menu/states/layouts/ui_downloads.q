
script ui_init_downloads 
	jam_init_reverb
endscript

script ui_create_downloads 
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	menu_music_on
	make_menu_frontend \{screen = BASSIST
		title = qs(0x271e2cfc)}
	if isXenon
		add_menu_frontend_item text = qs(0x99680c13) pad_choose_script = set_primary_controller pad_choose_params = {device_num = <device_num> state = uistate_jam_ghtunes require_live = 1 jam = 3}
	elseif isps3
		add_menu_frontend_item text = qs(0x99680c13) pad_choose_script = set_primary_controller pad_choose_params = {device_num = <device_num> state = uistate_jam_ghtunes require_live = 1}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <item_container_id>
		id = ghtunes_sm
		text = qs(0x7ca19d0c)
		font = fontgrid_text_a6
		just = [left top]
		Scale = 0.25
		Pos = (215.0, 5.0)
		rgba = ($menu_unfocus_color)
	}
	<item_id> :se_setprops {
		event_handlers = [
			{focus retail_menu_focus params = {id = <id>}}
			{unfocus retail_menu_unfocus params = {id = <id>}}
		]
	}
	menu_finish
endscript

script ui_destroy_downloads 
	generic_ui_destroy
endscript

script ui_deinit_downloads 
	jam_deinit_reverb
endscript

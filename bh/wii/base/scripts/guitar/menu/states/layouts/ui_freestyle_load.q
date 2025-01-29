
script ui_create_freestyle_load 
	menu_music_off
	SpawnScriptNow \{freestyle_load}
endscript

script freestyle_load 
	ui_event_wait_for_safe
	destroy_loading_screen
	if miilibisopen
		freestyle_enter_menus
		Wait \{30
			frames}
		ui_memcard_load_freestyle event = menu_replace state = uistate_freestyle_mainmenu data = {device_num = <device_num> from_mainmenu}
	else
		create_dialog_box \{use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x2d2c1532)
			options = [
				{
					func = freestyle_load_fail
					text = qs(0x0e41fe46)
				}
			]
			dlog_event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
			]
			on_destroy_script = nullscript
			on_destroy_script_params = {
			}}
	endif
endscript

script freestyle_load_fail 
	destroy_dialog_box
	freestyle_back_to_gh_main_menu
endscript

script ui_destroy_freestyle_load 
	generic_ui_destroy
endscript


script ui_create_ecard_edit_name 
	ui_create_edit_name <...> desc = 'edit_name'
	StringLength string = <default_name>
	if (<str_len> > 0)
		ui_edit_name_enter_character char_limit = <char_limit>
	endif
	edit_name_screen_id :se_setprops \{event_handlers = [
			{
				pad_start
				ui_ecard_edit_name_finish
			}
		]
		replace_handlers
		edit_name_chars_left_rgba = gh6_gold
		name_letter_text = qs(0x6160dbf3)}
endscript

script ui_destroy_ecard_edit_name 
	ui_destroy_edit_name <...>
	destroy_dialog_box
endscript

script ui_return_ecard_edit_name 
	LaunchEvent \{Type = focus
		target = edit_name_screen_id}
	edit_name_setup_helper_pills show_gamertag = ($primary_controller)
endscript

script ui_ecard_edit_name_finish 
	if ScreenElementExists \{id = edit_name_screen_id}
		name_text = qs(0x03ac90f0)
		edit_name_screen_id :se_getprops
		StringLength string = <name_text>
		if (<str_len> != 16)
			create_dialog_box {
				player_device = ($primary_controller)
				heading_text = qs(0x79597197)
				body_text = qs(0x43540cac)
				options = [
					{
						func = destroy_dialog_box
						func_params = {dont_remove_helpers}
						text = qs(0x0e41fe46)
					}
				]
				on_destroy_script = ui_return_ecard_edit_name
				on_destroy_script_params = {}
			}
			LaunchEvent \{Type = unfocus
				target = edit_name_screen_id}
			return
		endif
		LaunchEvent \{Type = unfocus
			target = edit_name_screen_id}
		name_text = qs(0x03ac90f0)
		edit_name_screen_id :se_getprops
		edit_name_screen_id :GetSingleTag \{accept_script}
		edit_name_screen_id :GetSingleTag \{accept_params}
		edit_name_screen_id :GetSingleTag \{exclusive_device}
		ui_destroy_edit_name <...>
		destroy_dialog_box
		if GotParam \{accept_script}
			<accept_script> text = <name_text> exclusive_device = <exclusive_device> <accept_params>
		else
			ui_sfx \{menustate = Generic
				uitype = select}
			generic_event_back data = {text = <name_text>}
		endif
	endif
endscript

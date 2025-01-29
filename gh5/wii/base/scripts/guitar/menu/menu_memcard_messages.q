load_warning_menu_font = fontgrid_title_a1

script create_confirm_overwrite_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = qs(0xc0da9b99)
		case Xenon
		text = qs(0xd13a6074)
		case ngc
		text = qs(0xc0da9b99)
	endswitch
	if ($memcardjamordefault = jam)
		<save_func> = memcard_save_jam
	else
		<save_func> = display_and_continue_access
	endif
	create_dialog_box {
		body_text = <text>
		player_device = ($memcardcontroller)
		options = [
			{
				func = memcard_sequence_quit
				text = qs(0xf7723015)
			}
			{
				func = <save_func>
				func_params = {OverwriteConfirmed = 1 , call = <call> , event_params = <event_params> , save_or_load = <save_or_load>}
				text = qs(0xf77909ae)
			}
		]
	}
endscript

script create_confirm_load_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = qs(0x03ff95e6)
		case Xenon
		text = qs(0xde509f6c)
		case ngc
		text = qs(0x03ff95e6)
	endswitch
	create_dialog_box {
		body_text = <text>
		player_device = ($memcardcontroller)
		options = [
			{
				func = memcard_sequence_quit
				text = qs(0xf7723015)
			}
			{
				func = display_and_continue_access
				func_params = {OverwriteConfirmed = 1 , call = <call> , event_params = <event_params> , save_or_load = <save_or_load>}
				text = qs(0xad5cfad4)
			}
		]
	}
endscript

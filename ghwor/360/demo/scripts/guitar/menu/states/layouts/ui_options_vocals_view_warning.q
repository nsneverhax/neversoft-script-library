
script ui_create_options_vocals_view_warning 
	vocals_get_highway_view player = <player>
	<vocals_highway_view> = <highway_view>
	if (<vocals_highway_view> = static)
		<other_view> = qs(0x737839f5)
	else
		<other_view> = qs(0x305014bd)
	endif
	formattext {
		textname = message
		qs(0xb9e2cc58)
		s = <other_view>
	}
	create_dialog_box {
		no_background
		heading_text = qs(0xaa163738)
		body_text = <message>
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = options_change_vocals_highway_view
				func_params = {controller = <controller> player = <player>}
				text = qs(0x182f0173)
			}
		]
		player_device = <controller>
	}
endscript

script ui_destroy_options_vocals_view_warning 
	destroy_dialog_box
endscript

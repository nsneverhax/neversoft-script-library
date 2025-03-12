g_ui_sfx_test_vmenu_allow_wrap = 0

script ui_create_ui_sfx_test 
	createscreenelement \{type = descinterface
		parent = root_window
		desc = 'ui_sfx_test'
		id = ui_sfx_test}
	if ui_sfx_test :desc_resolvealias \{name = alias_ui_sfx_test_vmenu}
		assignalias id = <resolved_id> alias = ui_sfx_test_vmenu
		ui_sfx_test_vmenu :se_setprops {
			event_handlers = [
				{pad_back ui_event params = {event = menu_back}}
				{pad_back ui_sfx params = {menustate = generic uitype = back}}
				{menu_selection_changed ui_sfx params = {menustate = generic uitype = scrollup}}
			]
			exclusive_device = ($primary_controller)
		}
		if ($g_ui_sfx_test_vmenu_allow_wrap = 0)
			ui_sfx_test :se_setprops \{ui_sfx_test_vmenu_allow_wrap = false}
			ui_sfx_test_vmenu :se_setprops \{event_handlers = [
					{
						pad_up
						ui_sfx_test_up
					}
					{
						pad_down
						ui_sfx_test_down
					}
				]}
		endif
		getscreenelementchildren \{id = ui_sfx_test_vmenu}
		getarraysize <children>
		ui_sfx_test_vmenu :settags {
			num_children = <array_size>
		}
		if (<array_size> > 0)
			<i> = 0
			begin
			<id> = (<children> [<i>])
			<id> :se_setprops {
				event_handlers = [
					{focus ui_sfx_test_focus params = {id = <id>}}
					{unfocus ui_sfx_test_unfocus params = {id = <id>}}
					{pad_choose ui_sfx_test_choose params = {id = <id>}}
					{pad_choose ui_sfx params = {menustate = generic uitype = select}}
				]
				exclusive_device = ($primary_controller)
				menurow_txt_item_rgba = ($menu_unfocus_color)
			}
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	else
		scriptassert \{qs(0x48835a43)}
	endif
	set_focus_color \{rgba = [
			0
			255
			0
			255
		]}
	launchevent \{type = focus
		target = ui_sfx_test_vmenu}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_ui_sfx_test 
	destroyscreenelement \{id = ui_sfx_test}
	set_focus_color
	clean_up_user_control_helpers
endscript

script ui_sfx_test_focus \{time = 0.15}
	requireparams \{[
			id
		]
		all}
	<id> :se_setprops {
		menurow_txt_item_rgba = ($menu_focus_color)
		motion = ease_in
		time = <time>
	}
endscript

script ui_sfx_test_unfocus \{time = 0.15}
	requireparams \{[
			id
		]
		all}
	<id> :se_setprops {
		menurow_txt_item_rgba = ($menu_unfocus_color)
		motion = ease_in
		time = <time>
	}
endscript

script ui_sfx_test_choose 
	requireparams \{[
			id
		]
		all}
	printf qs(0x504f1106) i = <id>
endscript

script ui_sfx_test_up 
	ui_sfx_test_vmenu :getsingletag \{tag_selected_index}
	if (<tag_selected_index> = 0)
		ui_sfx \{menustate = generic
			uitype = negativeselect}
	endif
endscript

script ui_sfx_test_down 
	ui_sfx_test_vmenu :getsingletag \{tag_selected_index}
	ui_sfx_test_vmenu :getsingletag \{num_children}
	if (<tag_selected_index> = (<num_children> - 1))
		ui_sfx \{menustate = generic
			uitype = negativeselect}
	endif
endscript

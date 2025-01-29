
script ui_create_sync_spot_warning 
	uistack_createboundscreenelement \{parent = root_window
		id = sync_waiting_msg_id
		Type = descinterface
		desc = 'drop_message_box'
		Pos = (640.0, 360.0)
		pos_anchor = [
			left
			top
		]
		just = [
			center
			center
		]
		z_priority = 100}
	<id> :se_setprops text_text = ($band_lobby_strings.players_not_ready_io)
	if <id> :desc_resolvealias Name = alias_msg_menu param = msg_menu
		<event_handlers> = [
			{pad_back sync_waiting_msg_quit_prompt params = {}}
			{focus update_sync_waiting_button_helpers params = {Type = add}}
			{unfocus update_sync_waiting_button_helpers params = {Type = remove}}
		]
		<msg_menu> :se_setprops event_handlers = <event_handlers> exclusive_device = ($primary_controller)
		AssignAlias id = <msg_menu> alias = sync_spot_warning_id
		LaunchEvent \{Type = focus
			target = sync_spot_warning_id}
	endif
endscript

script ui_destroy_sync_spot_warning 
	if screenelementexistssimpleid \{id = sync_waiting_msg_id}
		destroyscreenelementsimpleid \{id = sync_waiting_msg_id}
	endif
endscript

script ui_return_sync_spot_warning 
	sync_spot_warning_id :se_setprops \{unblock_events}
	LaunchEvent \{Type = focus
		target = sync_spot_warning_id}
endscript

script sync_waiting_msg_quit_prompt 
	printf \{channel = sync_spot
		qs(0x0143a47a)}
	songlist_back_sfx
	Obj_GetID
	LaunchEvent Type = unfocus target = <objID>
	<objID> :se_setprops block_events
	generic_event_choose \{state = uistate_online_quit_warning
		data = {
			is_popup
		}}
endscript

script update_sync_waiting_button_helpers \{Type = !q1768515945}
	clean_up_user_control_helpers
	if (add = <Type>)
		add_gamertag_helper exclusive_device = ($primary_controller)
		add_user_control_helper controller = ($primary_controller) text = ($band_lobby_strings.button_back) button = red z = 100000
	endif
endscript

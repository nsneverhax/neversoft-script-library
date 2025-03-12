
script ui_create_motd 
	destroy_friend_feed
	createscreenelement {
		parent = root_window
		type = descinterface
		desc = 'motd_message'
		title_text = ($motd_header_1)
		msg_text = ($motd_subject_1)
		title_rgba = (($g_menu_colors).alert_red)
		event_handlers = [
			{pad_btn_right ui_sfx params = {menustate = generic uitype = back}}
			{pad_btn_right generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	assignalias id = <id> alias = current_menu
	motd_setup_news_items
	if screenelementexists \{id = current_menu}
		if current_menu :desc_resolvealias \{name = alias_news_menu
				param = news_menu_id}
			<news_menu_id> :se_setprops {
				event_handlers = [
					{pad_btn_right ui_sfx params = {menustate = generic uitype = back}}
					{pad_btn_right generic_event_back}
					{pad_up ui_sfx params = {menustate = generic uitype = scrollup}}
					{pad_down ui_sfx params = {menustate = generic uitype = scrolldown}}
					{pad_select motd_go_to_music_store}
				]
			}
			launchevent type = focus target = <news_menu_id> data = {child_index = 0}
		endif
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0x23b6e962)
		button = red
		z = 100000
		controller = $primary_controller}
	add_user_control_helper \{text = qs(0x8d3e932e)
		button = back
		z = 100000
		controller = $primary_controller}
endscript

script ui_destroy_motd 
	destroyscreenelement \{id = current_menu}
	generic_ui_destroy
endscript

script motd_setup_news_items 
	num_news_items = 3
	if screenelementexists \{id = current_menu}
		i = 1
		begin
		formattext checksumname = news_item 'alias_motd_message_item_%i' i = <i>
		formattext checksumname = item_text 'motd_header_%i' i = <i>
		if current_menu :desc_resolvealias name = <news_item> param = news_id
			<news_id> :se_setprops {
				highlight_btn_alpha = 0
				item_text_text = ($<item_text>)
				item_text_rgba = (gh6_gold)
				event_handlers = [
					{focus motd_news_item_focus params = {item_num = <i>}}
					{unfocus motd_news_item_unfocus}
				]
			}
		endif
		<i> = (<i> + 1)
		repeat <num_news_items>
	endif
endscript

script motd_news_item_focus 
	requireparams \{[
			item_num
		]}
	obj_getid
	<objid> :se_setprops {
		highlight_btn_alpha = 0.5
		item_text_rgba = (ntscwhite)
	}
	if screenelementexists \{id = current_menu}
		formattext checksumname = msg_text 'motd_subject_%i' i = <item_num>
		formattext checksumname = msg_image 'motd_image_%i' i = <item_num>
		current_menu :se_setprops {
			msg_text = ($<msg_text>)
			motd_image_texture = <msg_image>
		}
	endif
endscript

script motd_news_item_unfocus 
	obj_getid
	<objid> :se_setprops {
		highlight_btn_alpha = 0
		item_text_rgba = (gh6_gold)
	}
endscript

script motd_go_to_music_store 
	ui_sfx \{menustate = generic
		uitype = select}
	main_menu_select_music_store device_num = ($primary_controller)
endscript

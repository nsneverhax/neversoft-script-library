
script ui_create_motd 
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		desc = 'motd_message'
		title_text = ($motd_header_1)
		msg_text = ($motd_subject_1)
		title_rgba = (($g_menu_colors).alert_red)
		msg_rgba = ($menu_unfocus_color)
		event_handlers = [
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
			{pad_back generic_event_back}
		]
	}
	AssignAlias id = <id> alias = current_menu
	motd_setup_news_items
	if ScreenElementExists \{id = current_menu}
		if current_menu :desc_resolvealias \{Name = alias_news_menu
				param = news_menu_id}
			<news_menu_id> :se_setprops {
				event_handlers = [
					{pad_back ui_sfx params = {menustate = Generic uitype = back}}
					{pad_back generic_event_back}
					{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
					{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
				]
			}
			LaunchEvent Type = focus target = <news_menu_id> data = {child_index = 0}
		endif
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script ui_destroy_motd 
	DestroyScreenElement \{id = current_menu}
	generic_ui_destroy
endscript

script motd_setup_news_items 
	num_news_items = 3
	if ScreenElementExists \{id = current_menu}
		i = 1
		begin
		formatText checksumName = news_item 'alias_motd_message_item_%i' i = <i>
		formatText checksumName = item_text 'motd_header_%i' i = <i>
		if current_menu :desc_resolvealias Name = <news_item> param = news_id
			<news_id> :se_setprops {
				highlight_btn_alpha = 0
				item_text_text = ($<item_text>)
				item_text_rgba = ($menu_unfocus_color)
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
	RequireParams \{[
			item_num
		]}
	Obj_GetID
	<objID> :se_setprops {
		highlight_btn_alpha = 0.3
		item_text_rgba = [30 30 30 255]
	}
	if ScreenElementExists \{id = current_menu}
		formatText checksumName = msg_text 'motd_subject_%i' i = <item_num>
		formatText checksumName = msg_image 'motd_image_%i' i = <item_num>
		current_menu :se_setprops {
			msg_text = ($<msg_text>)
			motd_image_texture = <msg_image>
		}
	endif
endscript

script motd_news_item_unfocus 
	Obj_GetID
	<objID> :se_setprops {
		highlight_btn_alpha = 0
		item_text_rgba = ($menu_unfocus_color)
	}
endscript

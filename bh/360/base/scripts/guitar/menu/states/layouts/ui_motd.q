
script ui_create_motd 
	CreateScreenElement {
		parent = root_window
		type = DescInterface
		desc = 'motd_message'
		title_text = ($motd_header)
		msg_text = ($motd_subject)
		title_rgba = (($g_menu_colors).alert_red)
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	AssignAlias id = <id> alias = current_menu
	motd_setup_news_items
	if ScreenElementExists \{id = current_menu}
		if current_menu :Desc_ResolveAlias \{name = alias_news_menu
				param = news_menu_id}
			<news_menu_id> :SE_SetProps {
				event_handlers = [
					{pad_back generic_event_back}
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
			}
			LaunchEvent type = focus target = <news_menu_id> data = {child_index = 0}
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
		FormatText checksumname = news_item 'alias_motd_message_item_%i' i = <i>
		FormatText checksumname = item_text 'motd_header_%i' i = <i>
		if current_menu :Desc_ResolveAlias name = <news_item> param = news_id
			create_2D_spring_system desc_id = <news_id> num_springs = 2 stiffness = 50 rest_length = 1
			<news_id> :SE_SetProps {
				highlight_btn_alpha = 0
				item_text_text = ($<item_text>)
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
	<objID> :SE_SetProps {
		highlight_btn_alpha = 0.3
		item_text_rgba = [30 30 30 255]
	}
	if ScreenElementExists \{id = current_menu}
		FormatText checksumname = msg_text 'motd_subject_%i' i = <item_num>
		FormatText checksumname = msg_image 'motd_image_%i' i = <item_num>
		current_menu :SE_SetProps {
			msg_text = ($<msg_text>)
			motd_image_texture = <msg_image>
		}
	endif
endscript

script motd_news_item_unfocus 
	Obj_GetID
	<objID> :SE_SetProps {
		highlight_btn_alpha = 0
		item_text_rgba = NTSCWhite
	}
endscript

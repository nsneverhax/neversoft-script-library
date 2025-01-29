menu_connection_test_current_index = 0
menu_connection_test_total_menu_items = 0
short_month_names = [
	"Jan"
	"Feb"
	"Mar"
	"Apr"
	"May"
	"Jun"
	"Jul"
	"Aug"
	"Sep"
	"Oct"
	"Nov"
	"Dec"
]
short_day_names = [
	"Sun"
	"Mon"
	"Tue"
	"Wed"
	"Thu"
	"Fri"
	"Sat"
]
menu_connection_test_element_info = [
	{
		text = "TEST CONNECTION"
		handler = test_connection
		Pos = (640.0, 620.0)
	}
]
menu_connection_test_root_pos = (640.0, 620.0)
menu_connection_test_offset = (0.0, 60.0)

script create_connection_test_menu 
	Change \{menu_connection_test_current_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = connection_test_container}
	displaySprite \{parent = connection_test_container
		tex = controller_config_poster
		Pos = (640.0, 360.0)
		Scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 1
		rot_angle = 2}
	displaySprite \{parent = connection_test_container
		tex = graphics_options_poster_part3
		Pos = (640.0, 360.0)
		Scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 3
		rot_angle = 2}
	CreateScreenElement \{Type = SpriteElement
		id = light_overlay
		parent = connection_test_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite \{parent = connection_test_container
		tex = Tape_V_01
		Pos = (1115.0, 160.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = connection_test_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (1118.0, 163.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = connection_test_container
		tex = tape_H_02
		Pos = (210.0, 605.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = connection_test_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (213.0, 608.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_container
		text = "CONNECTION TEST"
		Pos = (785.0, 115.0)
		Scale = (1.5, 1.4)
		just = [
			center
			center
		]
		rgba = [
			210
			210
			210
			255
		]
		font = text_a5
		z_priority = 10
		rot_angle = 4
		Shadow
		shadow_rgba = [
			50
			0
			0
			255
		]
		shadow_offs = (-3.0, 3.0)}
	CreateScreenElement \{Type = ContainerElement
		parent = connection_test_container
		id = connection_test_data_container
		Pos = (20.0, 0.0)
		rot_angle = 2}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ip_label_text
		text = "IP ADDRESS:"
		Pos = (300.0, 150.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ip_value_text
		text = "..."
		Pos = (640.0, 150.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ip_success_text
		text = "..."
		Pos = (840.0, 150.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_db_label_text
		text = "DATABASE PING:"
		Pos = (300.0, 180.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_db_value_text
		text = "..."
		Pos = (640.0, 180.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_db_success_text
		text = "..."
		Pos = (840.0, 180.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_fs_label_text
		text = "FILE SERVER PING:"
		Pos = (300.0, 210.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_fs_value_text
		text = "..."
		Pos = (640.0, 210.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_fs_success_text
		text = "..."
		Pos = (840.0, 210.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_db_cxn_label_text
		text = "LAST DB CONNECTION:"
		Pos = (300.0, 270.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_db_cxn_time_text
		text = "N/A"
		Pos = (640.0, 270.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_db_q_label_text
		text = "LAST DB QUERY:"
		Pos = (300.0, 300.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_db_q_time_text
		text = "N/A"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_db_fail_label_text
		text = "LAST DB FAILURE:"
		Pos = (300.0, 330.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_db_fail_time_text
		text = "N/A"
		Pos = (640.0, 330.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_fs_cxn_label_text
		text = "LAST FS CONNECTION:"
		Pos = (300.0, 360.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_fs_cxn_time_text
		text = "N/A"
		Pos = (640.0, 360.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_fs_fail_label_text
		text = "LAST FS FAILURE:"
		Pos = (300.0, 390.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_fs_fail_time_text
		text = "N/A"
		Pos = (640.0, 390.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_time_label_text
		text = "CURRENT TIME:"
		Pos = (300.0, 450.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = connection_test_data_container
		id = ct_ok_time_time_text
		text = "N/A"
		Pos = (640.0, 450.0)
		Scale = 0.7
		just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z_priority = 10
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)}
	getconnectionhistory
	formatText TextName = cxntext "%a" a = <last_db_connection>
	ct_ok_db_cxn_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_db_query>
	ct_ok_db_q_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_db_failure>
	ct_ok_db_fail_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_fs_connection>
	ct_ok_fs_cxn_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_fs_failure>
	ct_ok_fs_fail_time_text :SetProps text = <cxntext>
	GetLocalSystemTime
	formatText TextName = curtext "%a %b %c %d:%e:%f %g" a = (($short_day_names) [(<localsystemtime>.dayofweek)]) b = (($short_month_names) [(<localsystemtime>.month)]) c = (<localsystemtime>.dayofmonth) d = (<localsystemtime>.hour) e = (<localsystemtime>.minute) f = (<localsystemtime>.Second) g = (<localsystemtime>.year)
	ct_ok_time_time_text :SetProps text = <curtext>
	GetArraySize \{$menu_connection_test_element_info}
	Change menu_connection_test_total_menu_items = <array_Size>
	set_focus_color \{rgba = [
			230
			171
			60
			255
		]}
	set_unfocus_color \{rgba = [
			255
			255
			255
			255
		]}
	text_params = {
		parent = connection_test_container
		Type = TextElement
		font = text_a5
		rgba = ($menu_unfocus_color)
		Scale = 1.0
		rot_angle = 2
		z_priority = 10
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (-1.5, 1.5)
	}
	index = 0
	cur_menu_pos = <menu_connection_test_root_pos>
	begin
	formatText checksumName = connection_test_text_name 'connection_test_text_%i' i = <index>
	CreateScreenElement {
		<text_params>
		id = <connection_test_text_name>
		text = ($menu_connection_test_element_info [<index>].text)
		Pos = ($menu_connection_test_element_info [<index>].Pos)
		Scale = 1
		Enabled = 1
		event_handlers = [
			{focus connection_test_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ($menu_connection_test_element_info [<index>].handler)}
			{pad_up connection_test_change_index params = {move = up}}
			{pad_down connection_test_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<cur_menu_pos> = (<cur_menu_pos> + <menu_connection_test_offset>)
	<index> = (<index> + 1)
	repeat $menu_connection_test_total_menu_items
	LaunchEvent \{Type = focus
		target = connection_test_text_0}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_connection_test_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = connection_test_container}
	destroy_menu \{menu_id = connection_test_scroll}
endscript

script connection_test_change_index \{move = up}
	formatText checksumName = last_text_id 'connection_test_text_%d' d = ($menu_connection_test_current_index)
	if (<move> = up)
		if ($menu_connection_test_current_index = 0)
			Change menu_connection_test_current_index = ($menu_connection_test_total_menu_items - 1)
		else
			Change menu_connection_test_current_index = ($menu_connection_test_current_index - 1)
		endif
	else
		if ($menu_connection_test_current_index = ($menu_connection_test_total_menu_items - 1))
			Change \{menu_connection_test_current_index = 0}
		else
			Change menu_connection_test_current_index = ($menu_connection_test_current_index + 1)
		endif
	endif
	index = ($menu_connection_test_current_index)
	printf "connection_test_change_index: index now %d" d = <index>
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'connection_test_text_%d' d = <index>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script connection_test_menu_hilight 
	index = ($menu_connection_test_current_index)
	GetTags
	printf "connection_test_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	retail_menu_focus
endscript

script test_connection 
	KillSpawnedScript \{Name = test_connection_proc}
	SpawnScriptNow \{test_connection_proc}
endscript

script test_connection_proc 
	ct_ip_value_text :SetProps \{text = "..."
		rgba = [
			255
			255
			255
			255
		]}
	ct_ip_success_text :SetProps \{text = "..."
		rgba = [
			255
			255
			255
			255
		]}
	ct_db_value_text :SetProps \{text = "..."
		rgba = [
			255
			255
			255
			255
		]}
	ct_db_success_text :SetProps \{text = "..."
		rgba = [
			255
			255
			255
			255
		]}
	ct_fs_value_text :SetProps \{text = "..."
		rgba = [
			255
			255
			255
			255
		]}
	ct_fs_success_text :SetProps \{text = "..."
		rgba = [
			255
			255
			255
			255
		]}
	ct_ip_value_text :SetProps \{text = "WORKING..."}
	ct_ip_success_text :SetProps \{text = "WORKING..."}
	Wait \{1
		Second}
	getipaddress
	if (<success> = 1)
		formatText TextName = new_ip_text "%a" a = <ip_address>
		ct_ip_value_text :SetProps text = <new_ip_text>
		ct_ip_success_text :SetProps \{text = "SUCCESS"
			rgba = [
				0
				255
				0
				255
			]}
		printf \{"test_connection: getipaddress: success"}
	else
		formatText \{TextName = new_ip_text
			"N/A"}
		ct_ip_value_text :SetProps text = <new_ip_text>
		ct_ip_success_text :SetProps \{text = "FAILURE"
			rgba = [
				255
				0
				0
				255
			]}
		printf \{"test_connection: getipaddress: failure"}
	endif
	ct_db_value_text :SetProps \{text = "WORKING..."}
	ct_db_success_text :SetProps \{text = "WORKING..."}
	Wait \{1
		Second}
	getdatabaseping
	if (<success> = 1)
		formatText TextName = new_db_text "%a ms" a = <database_ping>
		ct_db_value_text :SetProps text = <new_db_text>
		ct_db_success_text :SetProps \{text = "SUCCESS"
			rgba = [
				0
				255
				0
				255
			]}
		printf \{"test_connection: getdatabaseping: success"}
	else
		formatText \{TextName = new_db_text
			"N/A"}
		ct_db_value_text :SetProps text = <new_db_text>
		ct_db_success_text :SetProps \{text = "FAILURE"
			rgba = [
				255
				0
				0
				255
			]}
		printf \{"test_connection: getdatabaseping: failure"}
	endif
	ct_fs_value_text :SetProps \{text = "WORKING..."}
	ct_fs_success_text :SetProps \{text = "WORKING..."}
	Wait \{1
		Second}
	getfileserverping
	if (<success> = 1)
		formatText TextName = new_fs_text "%a ms" a = <fileserver_ping>
		ct_fs_value_text :SetProps text = <new_fs_text>
		ct_fs_success_text :SetProps \{text = "SUCCESS"
			rgba = [
				0
				255
				0
				255
			]}
		printf \{"test_connection: getfileserverping: success"}
	else
		formatText \{TextName = new_fs_text
			"N/A"}
		ct_fs_value_text :SetProps text = <new_fs_text>
		ct_fs_success_text :SetProps \{text = "FAILURE"
			rgba = [
				255
				0
				0
				255
			]}
		printf \{"test_connection: getfileserverping: failure"}
	endif
	getconnectionhistory
	formatText TextName = cxntext "%a" a = <last_db_connection>
	ct_ok_db_cxn_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_db_query>
	ct_ok_db_q_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_db_failure>
	ct_ok_db_fail_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_fs_connection>
	ct_ok_fs_cxn_time_text :SetProps text = <cxntext>
	formatText TextName = cxntext "%a" a = <last_fs_failure>
	ct_ok_fs_fail_time_text :SetProps text = <cxntext>
	GetLocalSystemTime
	formatText TextName = curtext "%a %b %c %d:%e:%f %g" a = (($short_day_names) [(<localsystemtime>.dayofweek)]) b = (($short_month_names) [(<localsystemtime>.month)]) c = (<localsystemtime>.dayofmonth) d = (<localsystemtime>.hour) e = (<localsystemtime>.minute) f = (<localsystemtime>.Second) g = (<localsystemtime>.year)
	ct_ok_time_time_text :SetProps text = <curtext>
endscript

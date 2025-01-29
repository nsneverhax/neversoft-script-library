0xae98b7cd = {
	create = 0xcee995e2
	Destroy = 0x0d9890ef
	remove_focus = 0x1d0df0bb
	refocus = 0x78846ea5
	actions = [
		{
			action = go_back
			flow_state = 0xb27d2ca9
		}
	]
}
0x3bece5dc = [
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
	'0'
]
0xf28e4344 = '0'
0x8ad64a34 = 0
0x9c39d188 = 12
0xc1f55439 = [
	'0'
	'1'
	'2'
	'3'
	'4'
	'5'
	'6'
	'7'
	'8'
	'9'
]
0xbe7c1f8a = (725.0, 345.0)
0x07e88045 = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
0x0f1c616c = {
	text_scale = 1.8
	text_pos = (725.0, 240.0)
	background_pos = (640.0, 360.0)
	background_dims = (1280.0, 720.0)
	header_pos = (710.0, 100.0)
	header_scale = 1.5
	tour_pos = (735.0, 160.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (625.0, 500.0)
	date_scale = 0.85
	sponsor_pos = (925.0, 402.0)
	sponsor_scale = 0.7
	sponsor_dims = (128.0, 128.0)
	sponsor_offset = (0.0, 20.0)
	right_side_img_pos = (1151.0, 346.0)
	right_side_img_dims = (196.0, 408.0)
	right_side_img_scale = 2.07
}

script 0xcee995e2 
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	Change \{0x3bece5dc = [
			'0'
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
		]}
	Change \{0x8ad64a34 = 0}
	Change \{0x07e88045 = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	rotation_angle = -1.8
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = 0x4f2e8196
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = 0x4f2e8196
		id = menu_backdrop
		texture = Venue_BG
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		blend = diffuse
		just = [
			center
			center
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = 0x4f2e8196
		id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		parent = 0x4f2e8196
		id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 255]
		Pos = (($0x0f1c616c).right_side_img_pos)
		dims = (($0x0f1c616c).right_side_img_dims)
		z_priority = 2
	}
	rand = 0
	GetRandomValue \{Name = rand
		integer
		a = 0
		b = 2}
	if (<rand> = 0)
		SetScreenElementProps id = random_image texture = band_name_graphic01 (($0x0f1c616c).right_side_img_pos) Scale = (($0x0f1c616c).right_side_img_scale)
	elseif (<rand> = 1)
		SetScreenElementProps id = random_image texture = band_name_graphic02 (($0x0f1c616c).right_side_img_pos) Scale = (($0x0f1c616c).right_side_img_scale)
	elseif (<rand> = 2)
		SetScreenElementProps id = random_image texture = band_name_graphic03 (($0x0f1c616c).right_side_img_pos) Scale = (($0x0f1c616c).right_side_img_scale)
	endif
	black = [70 10 10 255]
	blue = [30 110 150 255]
	nameColor = [95 112 147 255]
	activeColor = (($g_menu_colors).pink)
	CreateScreenElement {
		Type = TextElement
		parent = 0x4f2e8196
		font = 0xacc940f1
		text = $wii_add_friend
		id = 0x6af8bcda
		Pos = (($0x0f1c616c).header_pos)
		rot_angle = <rotation_angle>
		rgba = [212 228 236 255]
		just = [center top]
		Scale = (($0x0f1c616c).header_scale)
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [142 134 160 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = 0x4f2e8196
		font = 0xacc940f1
		text = ($wii_enter_12 + ' ' + $wii_friend_code)
		id = 0x92372a6a
		Pos = (($0x0f1c616c).tour_pos)
		rot_angle = <rotation_angle>
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [center top]
		Scale = (($0x0f1c616c).tour_scale)
	}
	CreateScreenElement {
		Type = TextElement
		parent = 0x4f2e8196
		font = 0xacc940f1
		Scale = (($0x0f1c616c).text_scale)
		rgba = <nameColor>
		rot_angle = <rotation_angle>
		text = ($0xf28e4344)
		id = 0x62ec379c
		Pos = (($0x0f1c616c).text_pos)
		just = [center center]
	}
	CreateScreenElement {
		Type = TextElement
		parent = 0x4f2e8196
		font = 0xacc940f1
		Scale = (($0x0f1c616c).text_scale)
		rgba = <activeColor>
		text = ($0xf28e4344)
		id = 0xebcd8b8e
		Pos = ($0xbe7c1f8a - (0.0, 100.0))
		rot_angle = <rotation_angle>
		just = [center center]
		z_priority = -5
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = 0x4f2e8196
		id = 0x27330a19
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up 0x71822251 params = {up}}
			{pad_down 0x71822251 params = {down}}
			{pad_choose 0x9eb1e91f}
			{pad_back 0xd1147653}
			{pad_start 0x06f7c75d}
		]
		rgba = <activeColor>
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{id = 0x27330a19
		blinker
		params = {
			id = 0x27330a19
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = 0x27330a19}
	0xa60a43bf
	add_user_control_helper \{button = green
		text = $wii_next}
	add_user_control_helper \{button = red
		text = $wii_back}
	add_user_control_helper \{button = strumbar
		text = $wii_updown}
	add_user_control_helper \{button = start
		text = $wii_add_friend}
	formatText checksumName = textid 'uc_text_%d' d = ($num_user_control_helpers -1)
	Change 0xcfa6c6bf = <textid>
	SetScreenElementProps \{id = $0xcfa6c6bf
		rgba = [
			192
			0
			0
			255
		]}
endscript
0xcfa6c6bf = 0

script 0x0d9890ef 
	destroy_menu \{menu_id = 0x4f2e8196}
	destroy_menu_backdrop
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	clean_up_user_control_helpers
endscript

script 0x06f7c75d 
	if (($0x8ad64a34 + 1) < $0x9c39d188)
		return
	endif
	num_spaces = 0
	array_entry = 0
	begin
	if ($0x3bece5dc [<array_entry>] = ' ')
		<num_spaces> = (<num_spaces> + 1)
	endif
	repeat ($0x9c39d188)
	if (<num_spaces> > 0)

	else
		0x25561eea
		formatText TextName = confirm_message $wii_add_friend_confirm a = <0xb7fdb45f>
		create_generic_popup {
			yes_no_menu
			yes_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose add_friend_post_confirm}
			]
			no_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose destroy_generic_popup}
			]
			message = <confirm_message>
			previous_menu = 0x27330a19
		}
	endif
endscript

script add_friend_post_confirm 
	destroy_generic_popup
	0x25561eea
	addfriend friend_key = <0xb7fdb45f>
	if (<error> = 0)

		enable_network_wait_variable
		create_generic_popup \{loading_window
			message = $wii_adding_friend
			wait_variable = network_wait_var
			previous_menu = 0x27330a19}
		enable_network_wait_variable
		updatefriendslist
		create_generic_popup \{loading_window
			message = $wii_loading_friends_list
			wait_variable = network_wait_var
			previous_menu = 0x27330a19}
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		formatText checksumName = error_code 'wii_add_error%a' a = <error>

		create_generic_popup {
			ok_menu
			message = ($<error_code>)
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose destroy_generic_popup}
			]
			previous_menu = 0x27330a19
		}
	endif
endscript

script 0x71822251 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				0x29575d1a
			else
				0xf4bcc00f
			endif
		else
			if GotParam \{up}
				0xf4bcc00f
			else
				0x29575d1a
			endif
		endif
	endif
endscript

script 0x1d0df0bb 
	LaunchEvent \{Type = unfocus
		target = 0xf67138bb}
endscript

script 0x78846ea5 
	LaunchEvent \{Type = focus
		target = 0xf67138bb}
endscript

script 0xf4bcc00f 
	generic_menu_up_or_down_sound \{up}
	SetArrayElement ArrayName = 0x07e88045 globalarray index = $0x8ad64a34 NewValue = ($0x07e88045 [$0x8ad64a34] + 1)
	GetArraySize \{$0xc1f55439}
	if ($0x07e88045 [$0x8ad64a34] > (<array_Size> -1))
		SetArrayElement \{ArrayName = 0x07e88045
			globalarray
			index = $0x8ad64a34
			NewValue = 0}
	endif
	SetArrayElement ArrayName = 0x3bece5dc globalarray index = $0x8ad64a34 NewValue = ($0xc1f55439 [($0x07e88045 [$0x8ad64a34])])
	0xc949b6c5
endscript

script 0x29575d1a 
	generic_menu_up_or_down_sound \{down}
	SetArrayElement ArrayName = 0x07e88045 globalarray index = $0x8ad64a34 NewValue = ($0x07e88045 [$0x8ad64a34] -1)
	GetArraySize \{$0xc1f55439}
	if ($0x07e88045 [$0x8ad64a34] < 0)
		SetArrayElement ArrayName = 0x07e88045 globalarray index = $0x8ad64a34 NewValue = (<array_Size> -1)
	endif
	SetArrayElement ArrayName = 0x3bece5dc globalarray index = $0x8ad64a34 NewValue = ($0xc1f55439 [($0x07e88045 [$0x8ad64a34])])
	0xc949b6c5
endscript

script 0x9eb1e91f 
	if (($0x8ad64a34 + 1) < $0x9c39d188)
		generic_menu_pad_choose_sound
		Change 0x8ad64a34 = ($0x8ad64a34 + 1)
		SetArrayElement ArrayName = 0x3bece5dc globalarray index = $0x8ad64a34 NewValue = ($0xc1f55439 [($0x07e88045 [$0x8ad64a34])])
		0xc949b6c5
	endif
endscript

script 0xd1147653 
	if ($0x8ad64a34 = 0)
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
	if (($0x8ad64a34 -1) > -1)
		generic_menu_pad_back_sound
		Change 0x8ad64a34 = ($0x8ad64a34 -1)
		SetArrayElement ArrayName = 0x3bece5dc globalarray index = ($0x8ad64a34 + 1) NewValue = ''
		0xc949b6c5
	endif
endscript

script 0x25561eea 
	formatText TextName = 0xb7fdb45f '%a%b%c%d%e%f%g%h%i%j%k%l' a = ($0x3bece5dc [0]) b = ($0x3bece5dc [1]) c = ($0x3bece5dc [2]) d = ($0x3bece5dc [3]) e = ($0x3bece5dc [4]) f = ($0x3bece5dc [5]) g = ($0x3bece5dc [6]) h = ($0x3bece5dc [7]) i = ($0x3bece5dc [8]) j = ($0x3bece5dc [9]) k = ($0x3bece5dc [10]) l = ($0x3bece5dc [11])
	return 0xb7fdb45f = <0xb7fdb45f>
endscript
0x965ebbc6 = 609
0x1b54caba = (100.0, 0.0)

script 0xc949b6c5 
	if (($0x8ad64a34 + 1) = $0x9c39d188)
		SetScreenElementProps \{id = $0xcfa6c6bf
			rgba = [
				0
				192
				0
				255
			]}
	else
		SetScreenElementProps \{id = $0xcfa6c6bf
			rgba = [
				192
				0
				0
				255
			]}
	endif
	0x25561eea
	vals_struct = ($0x0f1c616c)
	SetScreenElementProps id = 0x62ec379c text = (<0xb7fdb45f>) Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos)
	SetScreenElementProps id = 0xebcd8b8e Scale = (<vals_struct>.text_scale)
	GetScreenElementDims \{id = 0x62ec379c}
	SetScreenElementProps id = menu_backdrop Pos = (<vals_struct>.background_pos) dims = (<vals_struct>.background_dims)
	SetScreenElementProps id = ticket_image Pos = (<vals_struct>.background_pos) dims = (<vals_struct>.background_dims)
	SetScreenElementProps id = 0x6af8bcda Pos = (<vals_struct>.header_pos) Scale = (<vals_struct>.header_scale)
	SetScreenElementProps id = 0x92372a6a Pos = (<vals_struct>.tour_pos) Scale = (<vals_struct>.tour_scale)
	SetScreenElementProps id = random_image Pos = ((<vals_struct>.right_side_img_pos)) Scale = ((<vals_struct>.right_side_img_scale))
	0xa60a43bf
endscript

script 0xa60a43bf 
	0xbcb2c106 = ($0xc1f55439 [($0x07e88045 [($0x8ad64a34)])])
	SetScreenElementProps id = 0xebcd8b8e text = <0xbcb2c106>
	GetScreenElementDims \{id = 0xebcd8b8e}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = 0x62ec379c}
	GetScreenElementDims \{id = 0x62ec379c}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> - (1.0, 0.0) * <new_width> * 0.5)
	GetScreenElementDims \{id = 0x27330a19}
	SetScreenElementProps id = 0x27330a19 dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) Pos = (<new_pos> + (<new_height> * 0.6 * (0.0, 1.0)))
endscript

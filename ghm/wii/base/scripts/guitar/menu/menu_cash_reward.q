cash_deduction_types = [
	{
		desc = qs(0x9bc68157)
		val = 2500
	}
	{
		desc = qs(0xa02f6e9b)
		val = 80
	}
	{
		desc = qs(0x4108d3de)
		val = 210
	}
	{
		desc = qs(0x2dc1968f)
		val = 550
	}
	{
		desc = qs(0xa5050591)
		val = 330
	}
	{
		desc = qs(0x5209229d)
		val = 300
	}
]
review_string_3star = qs(0x14dfd00e)
review_string_4star = qs(0x9dcab56e)
review_string_5star = qs(0x5e06061b)
base_deduction_index_array = [
	0
	1
	2
	3
	4
	5
]

script create_cash_reward_menu 
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
			RemoveParameter \{exclusive_device}
			get_all_exclusive_devices
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	GetGlobalTags <gig_name> param = cash_earned
	Change structurename = player1_status new_cash = (($player1_status.new_cash) + <cash_earned>)
	SetGlobalTags <gig_name> params = {cash_earned = 0}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = cash_reward_container
		Pos = (-90.0, 0.0)
		rot_angle = 6
		exclusive_device = <exclusive_device>
	}
	stars = ($player1_status.stars)
	song_cash = ($player1_status.new_cash)
	Change \{structurename = player1_status
		new_cash = 0}
	venue_name = (($LevelZones.($current_level)).title)
	GetUpperCaseString <venue_name>
	CreateScreenElement \{Type = SpriteElement
		parent = cash_reward_container
		texture = 2p_song_summary_bg
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = -100}
	create_menu_backdrop \{texture = screen_reward_bg}
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		Scale = (1.1, 0.9)
		Pos = (660.0, 0.0)
		text = <UppercaseString>
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [center top]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		Scale = (1.8, 1.3)
		Pos = (660.0, 40.0)
		text = qs(0x651f4d04)
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [center top]
		z_priority = 3
	}
	GetScreenElementDims id = <id>
	if (<width> > 600)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = ((600.0, 0.0) + <height> * (0.0, 1.0))
	endif
	formatText checksumName = review_text 'review_string_%vstar' v = <stars>
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		Scale = 0.7
		Pos = (355.0, 110.0)
		text = (<review_text>)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((530.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = 0.7 start_y_scale = 0.7
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		Scale = 0.7
		Pos = (355.0, 140.0)
		text = qs(0x326eba5e)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((530.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = 0.7 start_y_scale = 0.7
	create_deductions_list Pos = (340.0, 195.0) dims = (550.0, 500.0) Scale = (0.9, 0.7) received = <song_cash>
	create_you_get_text Pos = (890.0, 400.0) Scale = 1.75 value = <song_cash>
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		Scale = 0.8
		Pos = (880.0, 495.0)
		text = qs(0xa4e51434)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [right top]
		z_priority = 3
	}
	GetScreenElementDims id = <id>
	if (<width> > 510)
		fit_text_in_rectangle id = <id> dims = ((510.0, 0.0) + ((0.0, 1.0) * <height>)) start_x_scale = 0.8 start_y_scale = 0.8
	endif
	if (<width> < 200)
		SetScreenElementProps id = <id> Pos = (880.0, 470.0)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		Scale = 0.8
		Pos = (880.0, 515.0)
		text = qs(0xbf41d8d6)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [right top]
		z_priority = 3
	}
	CreateScreenElement \{Type = TextElement
		parent = cash_reward_container
		Scale = 1
		Pos = (405.0, 555.0)
		text = qs(0x9026221e)
		font = $gh3_button_font
		rgba = [
			255
			255
			255
			255
		]
		just = [
			left
			top
		]
		z_priority = 3}
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		id = continue_button
		Scale = 1.0
		Pos = (447.0, 575.0)
		text = qs(0x182f0173)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		z_priority = 3
		just = [left center]
		event_handlers = [
			{pad_choose ui_cash_reward_continue}
		]
	}
	displaySprite \{parent = cash_reward_container
		tex = pill_128
		Pos = (379.0, 578.0)
		Scale = 2.1
		rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			center
		]}
	GetScreenElementDims \{id = continue_button}
	LaunchEvent \{Type = focus
		target = continue_button}
endscript

script destroy_cash_reward_menu 
	destroy_menu \{menu_id = cash_reward_container}
	destroy_menu_backdrop
endscript
cash_reward_font = fontgrid_text_a8

script create_deductions_list \{Pos = (200.0, 200.0)
		Scale = 1
		dims = (400.0, 400.0)
		received = 1200}
	dl_width = ((1.0, 0.0).<dims>)
	dl_height = ((0.0, 1.0).<dims>)
	CreateScreenElement {
		Type = ContainerElement
		parent = cash_reward_container
		id = deductions_container
		Pos = <Pos>
	}
	pay = <received>
	deduction_count = 4
	PermuteArray array = ($base_deduction_index_array) NewArrayName = perm_deduction_array
	index = 0
	begin
	perm_index = (<perm_deduction_array> [<index>])
	<pay> = (<pay> + $cash_deduction_types [<perm_index>].val)
	<index> = (<index> + 1)
	repeat <deduction_count>
	formatText TextName = gross_pay_text qs(0xcb2f9062) d = <pay>
	CreateScreenElement {
		Type = TextElement
		parent = deductions_container
		Pos = ((1.0, 0.0) * <dl_width>)
		Scale = <Scale>
		text = <gross_pay_text>
		font = ($cash_reward_font)
		rgba = [15 70 0 255]
		just = [right top]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		parent = deductions_container
		id = cd_pay_text
		Pos = (15.0, 0.0)
		Scale = <Scale>
		text = qs(0x0a628fee)
		font = ($cash_reward_font)
		rgba = [15 70 0 255]
		just = [left top]
		z_priority = 3
	}
	GetScreenElementDims \{id = cd_pay_text}
	separation_height = (<height> * 0.9)
	CreateScreenElement {
		Type = TextElement
		parent = deductions_container
		Pos = (((0.0, 1.0) * <separation_height>) + (15.0, 0.0))
		Scale = (<Scale> * 0.95)
		text = qs(0x0a5e6464)
		font_spacing = 4
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [left top]
		z_priority = 3
	}
	index = 0
	begin
	perm_index = (<perm_deduction_array> [<index>])
	deduction_string = ($cash_deduction_types [<perm_index>].desc)
	formatText TextName = deduction_value qs(0x291a78e8) v = ($cash_deduction_types [<perm_index>].val)
	CreateScreenElement {
		Type = TextElement
		parent = deductions_container
		Pos = (((0.0, 1.0) * (<separation_height> * (<index> + 2))) + (15.0, 0.0))
		Scale = (<Scale> * 0.95)
		text = <deduction_string>
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
	}
	GetScreenElementDims id = <id>
	if (<width> > 400)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = deductions_container
		Pos = ((1.0, 0.0) * <dl_width> + (0.0, 1.0) * (<separation_height> * (<index> + 2)))
		Scale = (<Scale> * 0.95)
		text = <deduction_value>
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [right top]
		z_priority = 3
	}
	<index> = (<index> + 1)
	repeat <deduction_count>
endscript

script create_you_get_text \{value = 1200
		Scale = 1
		Pos = (630.0, 320.0)}
	formatText TextName = payment_text qs(0xb3dbe0b1) v = <value>
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		id = payment_text_id
		Scale = <Scale>
		text = <payment_text>
		font = ($cash_reward_font)
		Pos = (<Pos> - (0.0, 0.0))
		rgba = [15 70 0 255]
		just = [right top]
		z_priority = 3
	}
	CreateScreenElement {
		Type = TextElement
		parent = cash_reward_container
		id = you_get_id
		Scale = (<Scale> * 0.75)
		text = qs(0x950e0054)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [right top]
		z_priority = 3
	}
	SoundEvent \{event = Cash_Sound}
	GetScreenElementDims \{id = payment_text_id}
	you_get_pos = (<Pos> - (1.0, 0.0) * (<width> * 1.1) + (0.0, 10.0))
	SetScreenElementProps id = you_get_id Pos = <you_get_pos>
endscript

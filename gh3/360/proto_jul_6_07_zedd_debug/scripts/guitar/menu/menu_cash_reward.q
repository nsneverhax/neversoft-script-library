cash_deduction_types = [
	{
		desc = "CARS, SET FIRE TO"
		val = 2500
	}
	{
		desc = "WALL ART, STOLEN"
		val = 80
	}
	{
		desc = "GREEN ROOM, TRASHED"
		val = 210
	}
	{
		desc = "NOISE VIOLATIONS, PAID"
		val = 550
	}
	{
		desc = "HOTEL ROOM, TRASHED"
		val = 330
	}
	{
		desc = "ALCOHOL, CONSUMED"
		val = 300
	}
]
review_string_3star = "Mediocre 3-star review. Here's your cut."
review_string_4star = "Good 4-star review. Here's your cut."
review_string_5star = "Killer 5-star review. Here's your cut."
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
			exclusive_mp_controllers = [0 , 0]
			setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
			setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = cash_reward_container
		pos = (-100.0, 0.0)
		rot_angle = 6
		exclusive_device = <exclusive_device>
	}
	stars = ($player1_status.stars)
	song_cash = ($player1_status.new_cash)
	change structurename = player1_status new_cash = 0
	venue_name = (($levelzones.($current_level)).title)
	getuppercasestring <venue_name>
	create_menu_backdrop texture = cash_reward_bg
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = (1.1, 0.9)
		pos = (660.0, 0.0)
		text = <uppercasestring>
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [center top]
		z_priority = 3
	}
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = (2.0, 1.5)
		pos = (660.0, 40.0)
		text = "GIG MONEY"
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [center top]
		z_priority = 3
	}
	formattext checksumname = review_text 'review_string_%vstar' v = <stars>
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = 0.7
		pos = (340.0, 110.0)
		text = (<review_text>)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
	}
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = 0.7
		pos = (340.0, 140.0)
		text = "Go buy yourself somethin' pretty."
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
	}
	create_deductions_list pos = (340.0, 205.0) dims = (550.0, 500.0) scale = (0.9, 0.7) received = <song_cash>
	create_you_get_text pos = (940.0, 430.0) scale = (2.0, 1.5) value = <song_cash>
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = 0.8
		pos = (920.0, 495.0)
		text = "Spend your hard-earned"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [right top]
		z_priority = 3
	}
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = 0.8
		pos = (920.0, 530.0)
		text = "cash at the store."
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [right top]
		z_priority = 3
	}
	button_font = buttonsxenon
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		scale = 1.3
		pos = (380.0, 535.0)
		text = "\\b4"
		font = <button_font>
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 3
	}
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		id = continue_button
		scale = 0.8
		pos = (430.0, 560.0)
		text = "CONTINUE"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	launchevent type = focus target = continue_button
endscript

script destroy_cash_reward_menu 
	destroy_menu \{menu_id = cash_reward_container}
	destroy_menu_backdrop
endscript
cash_reward_font = text_a4

script create_deductions_list pos = (200.0, 200.0) scale = 1 dims = (400.0, 400.0) received = 1200
	dl_width = ((1.0, 0.0).<dims>)
	dl_height = ((0.0, 1.0).<dims>)
	createscreenelement {
		type = containerelement
		parent = cash_reward_container
		id = deductions_container
		pos = <pos>
	}
	pay = <received>
	deduction_count = 4
	permutearray array = ($base_deduction_index_array) newarrayname = perm_deduction_array
	index = 0
	begin
	perm_index = (<perm_deduction_array> [<index>])
	<pay> = (<pay> + $cash_deduction_types [<perm_index>].val)
	<index> = (<index> + 1)
	repeat <deduction_count>
	formattext textname = gross_pay_text "$%d" d = <pay>
	createscreenelement {
		type = textelement
		parent = deductions_container
		pos = ((1.0, 0.0) * <dl_width>)
		scale = <scale>
		text = <gross_pay_text>
		font = ($cash_reward_font)
		rgba = [15 70 0 255]
		just = [right top]
		z_priority = 3
	}
	createscreenelement {
		type = textelement
		parent = deductions_container
		id = cd_pay_text
		pos = (0.0, 0.0)
		scale = <scale>
		text = "PAY"
		font = ($cash_reward_font)
		rgba = [15 70 0 255]
		just = [left top]
		z_priority = 3
	}
	getscreenelementdims id = cd_pay_text
	separation_height = (<height> * 1.07)
	createscreenelement {
		type = textelement
		parent = deductions_container
		pos = ((0.0, 1.0) * <separation_height>)
		scale = (<scale> * 0.95)
		text = "MINUS DEDUCTIONS"
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
	formattext textname = deduction_value "-$%v" v = ($cash_deduction_types [<perm_index>].val)
	createscreenelement {
		type = textelement
		parent = deductions_container
		pos = ((0.0, 1.0) * (<separation_height> * (<index> + 2)))
		scale = (<scale> * 0.95)
		text = <deduction_string>
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = 3
	}
	createscreenelement {
		type = textelement
		parent = deductions_container
		pos = ((1.0, 0.0) * <dl_width> + (0.0, 1.0) * (<separation_height> * (<index> + 2)))
		scale = (<scale> * 0.95)
		text = <deduction_value>
		font = ($cash_reward_font)
		rgba = [150 60 35 255]
		just = [right top]
		z_priority = 3
	}
	<index> = (<index> + 1)
	repeat <deduction_count>
endscript

script create_you_get_text value = 1200 scale = 1 pos = (640.0, 320.0)
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		id = you_get_id
		scale = (<scale> * 0.9)
		text = "You Get:"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [right top]
		z_priority = 3
	}
	formattext textname = payment_text "$%v" v = <value>
	createscreenelement {
		type = textelement
		parent = cash_reward_container
		id = payment_text_id
		scale = <scale>
		text = <payment_text>
		font = ($cash_reward_font)
		pos = <pos>
		rgba = [15 70 0 255]
		just = [right top]
		z_priority = 3
	}
	getscreenelementdims id = payment_text_id
	you_get_pos = (<pos> - (1.0, 0.0) * (<width> * 1.1))
	setscreenelementprops id = you_get_id pos = <you_get_pos>
endscript

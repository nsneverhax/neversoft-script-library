adjustments_text_color = [
	255
	255
	255
	255
]
adjustments_text_dropshadow_color = [
	0
	0
	0
	255
]
adjustments_text_highlight_color = [
	230
	171
	60
	255
]
adjustments_menuItems = [
	{
		text = "Credits To Play"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
			2
			3
			4
			5
			6
			7
			8
			9
			10
			11
			12
			13
			14
			15
			16
		]
	}
	{
		text = "Credits To Continue"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
			2
			3
			4
			5
			6
			7
			8
			9
			10
			11
			12
			13
			14
			15
			16
		]
	}
	{
		text = "Additional Credits For Premium"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
			2
			3
			4
			5
			6
			7
			8
			9
			10
			11
			12
			13
			14
			15
			16
		]
	}
	{
		text = "Credits Per Coin"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			1
			2
			3
			4
			5
			6
			7
			8
			9
			10
			11
			12
			13
			14
			15
			16
		]
	}
	{
		text = "Credits For Bonus"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
			2
			3
			4
			5
			6
			7
			8
			9
			10
			11
			12
			13
			14
			15
			16
			17
			18
			19
			20
			21
			22
			23
			24
			25
			26
			27
			28
			29
			30
			31
			32
			33
			34
			35
			36
			37
			38
			39
			40
		]
	}
	{
		text = "Bonus Credits"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			1
			2
			3
			4
			5
			6
			7
			8
			9
			10
			11
			12
			13
			14
			15
			16
		]
	}
	{
		text = "No Fail Mode"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
		]
	}
	{
		text = "Lamp Brightness"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
		]
	}
	{
		text = "Attract Audio"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
		]
	}
	{
		text = "Volume Auto Adjust"
		handler = adjustments_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
		]
	}
	{
	}
	{
		text = "Reset to Defaults"
		handler = adjustments_reset_handler
	}
]
adjustments_defaults = [
	4
	4
	4
	0
	0
	3
	0
	1
	0
	0
]
adjustments_values_old = [
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
adjustments_values_new = [
]
adjustments_need_restart = 0

script get_coins_for_credit_idx 
	return coins_for_credit_idx = <val>
endscript

script get_coins_for_continue_idx 
	return coins_for_continue_idx = <val>
endscript

script get_coins_for_premium_idx 
	return coins_for_premium_idx = <val>
endscript

script get_coins_for_axeclub_idx 
	return coins_for_axeclub_idx = <val>
endscript

script get_credits_per_coin_idx 
	return credits_per_coin_idx = (<val> -1)
endscript

script get_credits_for_bonus_idx 
	return credits_for_bonus_idx = <val>
endscript

script get_bonus_credits_idx 
	return bonus_credits_idx = (<val> -1)
endscript

script get_no_fail_idx 
	return no_fail_idx = <val>
endscript

script get_lamp_brightness_level_idx 
	return lamp_brightness_level_idx = <val>
endscript

script get_attract_audio_idx 
	return attract_audio_idx = <val>
endscript

script get_volume_auto_adjust_idx 
	return volume_auto_adjust_idx = <val>
endscript

script adjustments_get_choices 
	if StructureContains structure = ($adjustments_menuItems [<i>]) Name = choices
		return choices = (($adjustments_menuItems [<i>]).choices)
	endif
endscript

script adjustments_set_value 
	SetArrayElement ArrayName = adjustments_values_new globalarray index = <i> NewValue = <v>
endscript

script adjustments_load_values 
	GetArraySize \{$adjustments_values_old}
	valueCount = <array_Size>
	GetGlobalTags \{arcade_adjustments}
	GetGlobalTags \{arcade_hardware_adjustments}
	get_coins_for_credit_idx val = <arcade_credits_for_standard>
	get_coins_for_continue_idx val = <arcade_credits_for_continue>
	get_coins_for_premium_idx val = <arcade_credits_for_premium>
	get_credits_per_coin_idx val = <arcade_credits_per_coin>
	get_credits_for_bonus_idx val = <arcade_credits_for_bonus>
	get_bonus_credits_idx val = <arcade_num_bonus_credits>
	get_no_fail_idx val = <arcade_no_fail>
	get_lamp_brightness_level_idx val = <arcade_lamp_brightness_level>
	get_attract_audio_idx val = <arcade_attract_audio_on>
	get_volume_auto_adjust_idx val = <arcade_volume_auto_adjust>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 0 NewValue = <coins_for_credit_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 1 NewValue = <coins_for_continue_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 2 NewValue = <coins_for_premium_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 3 NewValue = <credits_per_coin_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 4 NewValue = <credits_for_bonus_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 5 NewValue = <bonus_credits_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 6 NewValue = <no_fail_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 7 NewValue = <lamp_brightness_level_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 8 NewValue = <attract_audio_idx>
	SetArrayElement ArrayName = adjustments_values_old globalarray index = 9 NewValue = <volume_auto_adjust_idx>
	Change \{adjustments_values_new = $adjustments_values_old}
	Change \{adjustments_need_restart = 0}
endscript

script adjustments_save_values 
	GetArraySize \{$adjustments_values_new}
	valueCount = <array_Size>
	GetGlobalTags \{arcade_adjustments}
	GetGlobalTags \{arcade_hardware_adjustments}
	adjustments_get_choices \{i = 0}
	<arcade_credits_for_standard> = (<choices> [($adjustments_values_new [0])])
	SetGlobalTags arcade_adjustments params = {arcade_credits_for_standard = <arcade_credits_for_standard>}
	if (<arcade_credits_for_standard> = 0)
		formatText \{TextName = coins_per_credit
			"FREEPLAY"}
	else
		if (<arcade_credits_per_coin> > 1)
			if (<arcade_credits_for_standard> = 1)
				formatText TextName = coins_per_credit "%d CREDIT TO START - %e CREDITS PER COIN" d = <arcade_credits_for_standard> e = <arcade_credits_per_coin>
			else
				formatText TextName = coins_per_credit "%d CREDITS TO START - %e CREDITS PER COIN" d = <arcade_credits_for_standard> e = <arcade_credits_per_coin>
			endif
		else
			if (<arcade_credits_for_standard> = 1)
				formatText TextName = coins_per_credit "%d CREDIT TO START" d = <arcade_credits_for_standard>
			else
				formatText TextName = coins_per_credit "%d CREDITS TO START" d = <arcade_credits_for_standard>
			endif
		endif
	endif
	coin_status_credits_to_start_text :SetProps text = <coins_per_credit>
	adjustments_get_choices \{i = 1}
	<arcade_credits_for_continue> = (<choices> [($adjustments_values_new [1])])
	SetGlobalTags arcade_adjustments params = {arcade_credits_for_continue = <arcade_credits_for_continue>}
	if (<arcade_credits_for_continue> = 0)
		formatText \{TextName = coins_per_continue
			"FREEPLAY"}
	else
		if (<arcade_credits_per_coin> > 1)
			if (<arcade_credits_for_continue> = 1)
				formatText TextName = coins_per_continue "%d CREDIT TO CONTINUE - %e CREDITS PER COIN" d = <arcade_credits_for_continue> e = <arcade_credits_per_coin>
			else
				formatText TextName = coins_per_continue "%d CREDITS TO CONTINUE - %e CREDITS PER COIN" d = <arcade_credits_for_continue> e = <arcade_credits_per_coin>
			endif
		else
			if (<arcade_credits_for_continue> = 1)
				formatText TextName = coins_per_continue "%d CREDIT TO CONTINUE" d = <arcade_credits_for_continue>
			else
				formatText TextName = coins_per_continue "%d CREDITS TO CONTINUE" d = <arcade_credits_for_continue>
			endif
		endif
	endif
	coin_status_credits_to_continue_text :SetProps text = <coins_per_continue>
	adjustments_get_choices \{i = 2}
	<arcade_credits_for_premium> = (<choices> [($adjustments_values_new [2])])
	SetGlobalTags arcade_adjustments params = {arcade_credits_for_premium = <arcade_credits_for_premium>}
	adjustments_get_choices \{i = 3}
	<arcade_credits_per_coin> = (<choices> [($adjustments_values_new [3])])
	SetGlobalTags arcade_adjustments params = {arcade_credits_per_coin = <arcade_credits_per_coin>}
	adjustments_get_choices \{i = 4}
	if (<arcade_credits_for_bonus> != (<choices> [($adjustments_values_new [4])]))
		Change \{bonus_credit_counter = 0}
	endif
	<arcade_credits_for_bonus> = (<choices> [($adjustments_values_new [4])])
	SetGlobalTags arcade_adjustments params = {arcade_credits_for_bonus = <arcade_credits_for_bonus>}
	adjustments_get_choices \{i = 5}
	<arcade_num_bonus_credits> = (<choices> [($adjustments_values_new [5])])
	SetGlobalTags arcade_adjustments params = {arcade_num_bonus_credits = <arcade_num_bonus_credits>}
	if (<arcade_credits_for_bonus> > 0)
		if (<arcade_credits_for_bonus> > 1)
			if (<arcade_num_bonus_credits> > 1)
				formatText TextName = bonus_credit_text "INSERT %a CREDITS FOR %b BONUS CREDITS" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			else
				formatText TextName = bonus_credit_text "INSERT %a CREDITS FOR %b BONUS CREDIT" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			endif
		else
			if (<arcade_num_bonus_credits> > 1)
				formatText TextName = bonus_credit_text "INSERT %a CREDIT FOR %b BONUS CREDITS" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			else
				formatText TextName = bonus_credit_text "INSERT %a CREDIT FOR %b BONUS CREDIT" a = <arcade_credits_for_bonus> b = <arcade_num_bonus_credits>
			endif
		endif
	else
		formatText \{TextName = bonus_credit_text
			"BONUS CREDITS DISABLED"}
	endif
	coin_status_bonus_credits_text :SetProps text = <bonus_credit_text>
	adjustments_get_choices \{i = 6}
	<arcade_no_fail> = (<choices> [($adjustments_values_new [6])])
	SetGlobalTags arcade_hardware_adjustments params = {arcade_no_fail = <arcade_no_fail>}
	adjustments_get_choices \{i = 7}
	<arcade_lamp_brightness_level> = (<choices> [($adjustments_values_new [7])])
	SetGlobalTags arcade_hardware_adjustments params = {arcade_lamp_brightness_level = <arcade_lamp_brightness_level>}
	adjustments_get_choices \{i = 8}
	<arcade_attract_audio_on> = (<choices> [($adjustments_values_new [8])])
	SetGlobalTags arcade_hardware_adjustments params = {arcade_attract_audio_on = <arcade_attract_audio_on>}
	adjustments_get_choices \{i = 9}
	<arcade_volume_auto_adjust> = (<choices> [($adjustments_values_new [9])])
	SetGlobalTags arcade_hardware_adjustments params = {arcade_volume_auto_adjust = <arcade_volume_auto_adjust>}
	Change lamp_brightness_level = <arcade_lamp_brightness_level>
	Change no_fail_mode = <arcade_no_fail>
	Change \{adjustments_values_old = $adjustments_values_new}
	destroy_bg_viewport
endscript

script adjustments_reset_values 
	GetArraySize \{$adjustments_values_new}
	valueCount = <array_Size>
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 0 NewValue = ($adjustments_defaults [0])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 1 NewValue = ($adjustments_defaults [1])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 2 NewValue = ($adjustments_defaults [2])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 3 NewValue = ($adjustments_defaults [3])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 4 NewValue = ($adjustments_defaults [4])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 5 NewValue = ($adjustments_defaults [5])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 6 NewValue = ($adjustments_defaults [6])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 7 NewValue = ($adjustments_defaults [7])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 8 NewValue = ($adjustments_defaults [8])
	SetArrayElement ArrayName = adjustments_values_new globalarray index = 9 NewValue = ($adjustments_defaults [9])
endscript

script create_adjustments_menu 
	menuDim = (600.0, 500.0)
	menuPos = (640.0, 355.0)
	menuItemDim = (600.0, 32.0)
	menuItemOptionDim = (250.0, 32.0)
	menuItemOptionPos = (0.0, 16.0)
	menuItemOptionJust = [left center]
	menuItemValueDim = (250.0, 32.0)
	menuItemValuePos = (600.0, 16.0)
	menuItemValueJust = [right center]
	menuItemHiliteDim = (650.0, 48.0)
	menuItemHilitePos = (-25.0, 34.0)
	menuItemHiliteJust = [left center]
	menuItemHiliteRot = -0.5
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = screen_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = SpriteElement
		id = light_overlay
		parent = screen_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite \{parent = screen_container
		tex = graphics_options_poster_part1
		Pos = (640.0, 360.0)
		Scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 1
		rot_angle = 2}
	displaySprite \{parent = screen_container
		tex = graphics_options_poster_part3
		Pos = (640.0, 360.0)
		Scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 3
		rot_angle = 2}
	CreateScreenElement \{Type = TextElement
		parent = screen_container
		text = "ADJUSTMENTS"
		Pos = (817.0, 120.0)
		Scale = (1.57, 1.47)
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a5
		z_priority = 10
		rot_angle = 6
		Shadow
		shadow_rgba = [
			160
			130
			105
			255
		]
		shadow_offs = (-3.0, 3.0)}
	displaySprite \{parent = screen_container
		tex = Tape_V_01
		Pos = (1070.0, 330.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaySprite \{parent = screen_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (1067.0, 333.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaySprite \{parent = screen_container
		tex = tape_H_02
		Pos = (190.0, 475.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = screen_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (187.0, 478.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	CreateScreenElement {
		Type = VMenu
		id = menu
		parent = screen_container
		Pos = <menuPos>
		dims = <menuDim>
		just = [center center]
		rot_angle = 2
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back adjustments_back_handler}
		]
	}
	menuTextProps = {
		Type = TextElement
		font = text_a4
		Scale = 0.7
		rgba = $adjustments_text_color
		z_priority = 20
		Shadow
		shadow_rgba = $adjustments_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	GetArraySize \{$adjustments_menuItems}
	menuItemCount = <array_Size>
	i = 0
	begin
	formatText checksumName = itemId 'item%i' i = <i>
	formatText checksumName = optionId 'option%i' i = <i>
	formatText checksumName = valueId 'value%i' i = <i>
	formatText checksumName = hiliteId 'hilite%i' i = <i>
	CreateScreenElement {
		Type = ContainerElement
		id = <itemId>
		parent = menu
		dims = <menuItemDim>
	}
	if StructureContains structure = ($adjustments_menuItems [<i>]) Name = text
		SetScreenElementProps {
			id = <itemId>
			event_handlers = [
				{pad_choose (($adjustments_menuItems [<i>]).handler) params = {i = <i>}}
				{focus adjustments_focus_handler params = {i = <i>}}
				{unfocus adjustments_unfocus_handler params = {i = <i>}}
			]
		}
		CreateScreenElement {
			Type = SpriteElement
			id = <hiliteId>
			parent = <itemId>
			texture = graphics_options_highlight
			Pos = <menuItemHilitePos>
			dims = <menuItemHiliteDim>
			rot_angle = <menuItemHiliteRot>
			just = <menuItemHiliteJust>
			alpha = 0
			z_priority = 1.5
			<mode_disable>
		}
		CreateScreenElement {
			<menuTextProps>
			id = <optionId>
			text = (($adjustments_menuItems [<i>]).text)
			parent = <itemId>
			dims = <menuItemOptionDim>
			Pos = <menuItemOptionPos>
			just = <menuItemOptionJust>
			<mode_disable>
		}
		if StructureContains structure = ($adjustments_menuItems [<i>]) Name = option
			CreateScreenElement {
				<menuTextProps>
				id = <valueId>
				text = "Value"
				parent = <itemId>
				dims = <menuItemValueDim>
				Pos = <menuItemValuePos>
				just = <menuItemValueJust>
				<mode_disable>
			}
			formatText checksumName = choiceMenuId 'choiceMenu%i' i = <i>
			CreateScreenElement {
				Type = VMenu
				id = <choiceMenuId>
				parent = <itemId>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
					{pad_back adjustments_choice_end_handler params = {i = <i>}}
					{pad_choose adjustments_choice_end_handler params = {i = <i>}}
				]
			}
			adjustments_get_choices i = <i>
			GetArraySize <choices>
			choiceCount = <array_Size>
			c = (<choiceCount> -1)
			begin
			formatText checksumName = choiceItemId 'choiceItem%i_%c' i = <i> c = <c>
			CreateScreenElement {
				<menuTextProps>
				id = <choiceItemId>
				parent = <choiceMenuId>
				event_handlers = [
					{focus adjustments_choice_focus_handler params = {i = <i> c = <c>}}
				]
				<mode_disable>
			}
			c = (<c> - 1)
			repeat <choiceCount>
		endif
	else
		SetScreenElementProps id = <itemId> not_focusable
	endif
	i = (<i> + 1)
	repeat <menuItemCount>
	adjustments_load_values
	adjustments_update_value_items
	LaunchEvent \{Type = focus
		target = menu}
	printf \{"create_adjustments_menu: family_mode_enabled = %d"
		d = $family_mode_enabled}
	switch ($family_mode_enabled)
		case 1
		displayText \{parent = screen_container
			text = "Family Mode 1 currently ACTIVE (via DIP Switch)."
			Pos = (333.0, 570.0)
			Scale = 0.5
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
			z = 11
			noshadow
			rot = 2}
		case 2
		displayText \{parent = screen_container
			text = "Family Mode 2 currently ACTIVE (via DIP Switch)."
			Pos = (333.0, 570.0)
			Scale = 0.5
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
			z = 11
			noshadow
			rot = 2}
		case 3
		displayText \{parent = screen_container
			text = "Family Modes 1 and 2 currently ACTIVE (via DIP Switch)."
			Pos = (333.0, 570.0)
			Scale = 0.5
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
			z = 11
			noshadow
			rot = 2}
		default
		displayText \{parent = screen_container
			text = "Family Mode DISABLED. They can be activated via DIP Switch."
			Pos = (333.0, 570.0)
			Scale = 0.5
			just = [
				left
				top
			]
			rgba = [
				160
				130
				105
				255
			]
			font = text_a4
			z = 11
			noshadow
			rot = 2}
	endswitch
	displayText \{parent = screen_container
		text = "See DIP Switch Test and Disable Songs menus for details."
		Pos = (331.0, 590.0)
		Scale = 0.5
		just = [
			left
			top
		]
		rgba = [
			160
			130
			105
			255
		]
		font = text_a4
		z = 11
		noshadow
		rot = 2}
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

script destroy_adjustments_menu 
	DestroyScreenElement \{id = screen_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script adjustments_back_handler 
	adjustments_save_values
	if ($adjustments_need_restart = 1)
		ui_flow_manager_respond_to_action \{action = need_restart}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script adjustments_update_value_items 
	GetArraySize \{$adjustments_menuItems}
	menuItemCount = <array_Size>
	i = 0
	begin
	if StructureContains structure = ($adjustments_menuItems [<i>]) Name = option
		adjustments_get_choices i = <i>
		formatText checksumName = valueId 'value%i' i = <i>
		printf "auvi1 %a / %c" a = <i> c = <menuItemCount>
		printf "auvi2 %b" b = (<choices> [($adjustments_values_new [<i>])])
		if ((<i> = 0 || <i> = 1 || <i> = 2) && (<choices> [($adjustments_values_new [<i>])]) = 0)
			formatText \{TextName = valtext
				"None"}
		elseif (<i> = 4 && (<choices> [($adjustments_values_new [<i>])]) = 0)
			formatText \{TextName = valtext
				"Disabled"}
		elseif (<i> = 6)
			if ((<choices> [($adjustments_values_new [<i>])]) = 0)
				formatText \{TextName = valtext
					"Off"}
			elseif ((<choices> [($adjustments_values_new [<i>])]) = 1)
				formatText \{TextName = valtext
					"On"}
			endif
		elseif (<i> = 7)
			if ((<choices> [($adjustments_values_new [<i>])]) = 0)
				formatText \{TextName = valtext
					"Low"}
			elseif ((<choices> [($adjustments_values_new [<i>])]) = 1)
				formatText \{TextName = valtext
					"High"}
			endif
		elseif (<i> = 8)
			if ((<choices> [($adjustments_values_new [<i>])]) = 0)
				formatText \{TextName = valtext
					"Off"}
			elseif ((<choices> [($adjustments_values_new [<i>])]) = 1)
				formatText \{TextName = valtext
					"On"}
			endif
		elseif (<i> = 9)
			if ((<choices> [($adjustments_values_new [<i>])]) = 0)
				formatText \{TextName = valtext
					"Off"}
			elseif ((<choices> [($adjustments_values_new [<i>])]) = 1)
				formatText \{TextName = valtext
					"On"}
			endif
		else
			formatText TextName = valtext "%t" t = (<choices> [($adjustments_values_new [<i>])])
		endif
		SetScreenElementProps id = <valueId> text = <valtext>
	endif
	i = (<i> + 1)
	repeat <menuItemCount>
endscript

script adjustments_reset_handler 
	SoundEvent \{event = ui_sfx_select}
	adjustments_reset_values
	adjustments_update_value_items
	adjustments_save_values
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
endscript

script adjustments_choice_focus_handler 
	adjustments_set_value i = <i> v = <c>
	adjustments_update_value_items
endscript

script adjustments_focus_handler 
	formatText checksumName = hiliteId 'hilite%i' i = <i>
	SetScreenElementProps id = <hiliteId> alpha = 1
endscript

script adjustments_unfocus_handler 
	formatText checksumName = hiliteId 'hilite%i' i = <i>
	SetScreenElementProps id = <hiliteId> alpha = 0
endscript

script adjustments_option_handler 
	formatText checksumName = valueId 'value%i' i = <i>
	SetScreenElementProps id = <valueId> rgba = $adjustments_text_highlight_color
	formatText checksumName = choiceMenuId 'choiceMenu%i' i = <i>
	formatText checksumName = choiceItemId 'choiceItem%i_%c' i = <i> c = ($adjustments_values_new [<i>])
	LaunchEvent \{Type = unfocus
		target = menu}
	LaunchEvent Type = focus target = <choiceMenuId> data = {child_id = <choiceItemId>}
	adjustments_focus_handler i = <i>
endscript

script adjustments_choice_end_handler 
	SoundEvent \{event = ui_sfx_select}
	formatText checksumName = valueId 'value%i' i = <i>
	SetScreenElementProps id = <valueId> rgba = $adjustments_text_color
	formatText checksumName = choiceMenuId 'choiceMenu%i' i = <i>
	LaunchEvent Type = unfocus target = <choiceMenuId>
	LaunchEvent \{Type = focus
		target = menu}
	adjustments_save_values
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
endscript

script create_adjustments_restart_popup_menu 
	create_popup_warning_menu \{textblock = {
			text = "Graphics option changes will not take effect until the game is restarted."
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		options = [
			{
				func = {
					ui_flow_manager_respond_to_action
					params = {
						action = continue
					}
				}
				text = "CONTINUE"
				Scale = (1.0, 1.0)
			}
		]}
endscript

script destroy_adjustments_restart_popup_menu 
	destroy_popup_warning_menu
endscript

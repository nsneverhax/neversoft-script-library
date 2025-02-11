sponsored_menu_font = text_a4
sponsor_info = {
	tier1 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = "Audio Technica was impressed with the show! Time to take it to the next level! They're handing you a sponsorship deal, and setting you up with their legendary microphones."
		sponsorship_value = 1440
	}
	tier2 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = "Line 6 thought you slayed at that last show, so now it's time to turn it up! They're handing you a sponsorship deal, and sweet Line 6 gear so you can nail your tone."
		sponsorship_value = 1440
	}
	tier3 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = "Ernie Ball thinks you're going places. They want to help you get there! They're handing you a sponsorship deal, and all the strings you can break, so play hard!"
		sponsorship_value = 1440
	}
	tier4 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = "Mackie thinks you're the next big thing. Don't let your head outgrow your body! They're sponsoring you with some shred-tastic monitors so you can hear yourself over the drums."
		sponsorship_value = 1440
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Zildjian
		product_texture = sponsor_photo_zildjian
		sponsorship_desc = "The brass at Zildjian thinks you're heading to the top--so you better know how to ''crash!'' They're handing you their line of cymbals with a sponsorship deal, so make some noise!"
		sponsorship_value = 1440
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Crate
		product_texture = sponsor_photo_crate
		sponsorship_desc = "Crate Amps is convinced you're hot. It's time to turn up the heat! Your eardrums may hurt, but your wallet won't--they're sponsoring you with all the amps you can eat!"
		sponsorship_value = 1440
	}
	tier7 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = "Krank Amplification thought your solos were on fire! They say if you play with Krank you'll be hooked. Good thing you have a free supply! Can you say ''sponsorship rules?''"
		be
		sponsorship_value = 1440
	}
}

script create_sponsored_menu 
	menu_get_sponsor_sound
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
			exclusive_mp_controllers = [0 , 0]
			SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_status.controller)
			SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_status.controller)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		Pos = (0.0, 0.0)
		id = sponsored_container
		exclusive_device = <exclusive_device>
	}
	get_tier_from_song \{song = $current_song}
	formatText checksumName = Tier 'tier%d' d = <tier_number>
	sponsor = ($sponsor_info.<Tier>)
	sponsorship_value = (<sponsor>.sponsorship_value)
	get_current_band_info
	GetGlobalTags <band_info>
	<cash> = (<cash> + <sponsorship_value>)
	SetGlobalTags <band_info> params = {cash = <cash>}
	GetGlobalTags \{achievement_info}
	total_cash_in_career_mode = (<total_cash_in_career_mode> + <sponsorship_value>)
	SetGlobalTags achievement_info params = {total_cash_in_career_mode = <total_cash_in_career_mode>}
	sponsorship_value = (<sponsorship_value> + $player1_status.new_cash)
	Change \{structurename = player1_status
		new_cash = 0}
	displaySprite {
		parent = sponsored_container
		Pos = (640.0, 360.0)
		just = [left center]
		tex = (<sponsor>.product_texture)
		dims = (640.0, 640.0)
		z = -1
	}
	displaySprite \{parent = sponsored_container
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		tex = sponsor_papermag
		dims = (1280.0, 720.0)
		z = 1}
	create_menu_backdrop \{texture = sponsor_bg}
	rot = -6
	bluish = [64 32 128 255]
	displaySprite parent = sponsored_container tex = (<sponsor>.logo_texture) Pos = (460.0, 160.0) just = [center center] Scale = 1 rot_angle = <rot>
	CreateScreenElement {
		Type = TextElement
		parent = sponsored_container
		text = "You Got Sponsored!"
		Scale = 1.0
		Pos = (465.0, 240.0)
		rot_angle = <rot>
		just = [center top]
		rgba = [120 0 0 255]
		font = ($sponsored_menu_font)
	}
	fit_text_in_rectangle id = <id> dims = (400.0, 0.0) only_if_larger_x = 1 keep_ar = 1
	CreateScreenElement {
		Type = TextBlockElement
		parent = sponsored_container
		text = (<sponsor>.sponsorship_desc)
		Scale = 0.55
		Pos = (490.0, 305.0)
		rot_angle = <rot>
		dims = (800.0, 400.0)
		just = [center top]
		internal_just = [left top]
		font = ($sponsored_menu_font)
		rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		parent = sponsored_container
		text = "YOU MILK YOUR SPONSOR FOR:"
		Scale = 0.6
		Pos = (500.0, 470.0)
		rot_angle = (<rot> - 1)
		just = [center top]
		font = ($sponsored_menu_font)
		rgba = <bluish>
	}
	fit_text_in_rectangle id = <id> dims = (250.0, 0.0) only_if_larger_x = 1 keep_ar = 1
	SoundEvent \{event = Cash_Sound}
	formatText TextName = value_text "$%v" v = <sponsorship_value>
	CreateScreenElement {
		Type = TextElement
		parent = sponsored_container
		text = <value_text>
		Scale = (1.5, 1.3499999)
		Pos = (500.0, 505.0)
		rot_angle = (<rot> - 1)
		just = [center top]
		font = ($sponsored_menu_font)
		rgba = <bluish>
	}
	button_font = buttonsxenon
	CreateScreenElement {
		Type = TextElement
		parent = sponsored_container
		id = continue_button
		Scale = 0.65000004
		Pos = (440.0, 610.0)
		text = "\\m0"
		rot_angle = <rot>
		font = <button_font>
		rgba = [255 255 255 255]
		just = [left top]
	}
	CreateScreenElement {
		Type = TextElement
		parent = continue_button
		id = continue_text
		Scale = 0.9
		Pos = (40.0, 22.0)
		text = "CONTINUE"
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	displaySprite \{parent = continue_button
		tex = Sponsored_Pill
		Pos = (-25.0, -37.0)
		Scale = 2.1
		rgba = [
			0
			0
			0
			255
		]}
	LaunchEvent \{Type = focus
		target = continue_text}
endscript

script destroy_sponsored_menu 
	destroy_menu \{menu_id = sponsored_container}
	destroy_menu_backdrop
endscript

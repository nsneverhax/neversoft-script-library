
script ui_create_sponsored 
	get_tier_from_song \{song = $current_song}
	formattext checksumname = tier 'tier%d' d = <tier_number>
	sponsor = ($sponsor_info.<tier>)
	sponsorship_value = (<sponsor>.sponsorship_value)
	get_current_band_info
	getglobaltags <band_info>
	<cash> = (<cash> + <sponsorship_value>)
	getglobaltags \{achievement_info}
	total_cash_in_career_mode = (<total_cash_in_career_mode> + <sponsorship_value>)
	sponsorship_value = (<sponsorship_value> + $player1_status.new_cash)
	change \{structurename = player1_status
		new_cash = 0}
	formattext textname = cash qs(0xb6586427) a = <sponsorship_value>
	createscreenelement \{parent = root_window
		id = myinterfaceelement
		type = descinterface
		desc = 'sponsor'}
	myinterfaceelement :setprops {
		logo_texture = (<sponsor>.logo_texture)
		description_text = (<sponsor>.sponsorship_desc)
		cash_text = <cash>
		photo_texture = (<sponsor>.product_texture)
		event_handlers = [{pad_choose generic_event_back params = {state = uistate_gig_posters}}]
	}
	ui_gig
	assignalias \{id = myinterfaceelement
		alias = current_menu}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_destroy_sponsored 
	if screenelementexists \{id = myinterfaceelement}
		myinterfaceelement :die
	endif
	clean_up_user_control_helpers
endscript
sponsor_info = {
	tier1 = {
		logo_texture = sponsor_logo_at
		product_texture = sponsor_photo_at
		sponsorship_desc = qs(0x93d60998)
		sponsorship_value = 1440
	}
	tier2 = {
		logo_texture = sponsor_logo_line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs(0x11d7fb06)
		sponsorship_value = 1440
	}
	tier3 = {
		logo_texture = sponsor_logo_ernieball
		product_texture = sponsor_photo_ernieball
		sponsorship_desc = qs(0x7953bd89)
		sponsorship_value = 1440
	}
	tier4 = {
		logo_texture = sponsor_logo_mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs(0xbdf11237)
		sponsorship_value = 1440
	}
	tier5 = {
		logo_texture = sponsor_logo_zildjian
		product_texture = sponsor_photo_zildjian
		sponsorship_desc = qs(0xfd3b2c85)
		sponsorship_value = 1440
	}
	tier6 = {
		logo_texture = sponsor_logo_crate
		product_texture = sponsor_photo_crate
		sponsorship_desc = qs(0x9bdced7d)
		sponsorship_value = 1440
	}
	tier7 = {
		logo_texture = sponsor_logo_krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs(0x9d974ead)
		be
		sponsorship_value = 1440
	}
}


script ui_create_sponsored 
	get_tier_from_song \{song = $current_song}
	formatText checksumName = Tier 'tier%d' d = <tier_number>
	sponsor = ($sponsor_info.<Tier>)
	sponsorship_value = (<sponsor>.sponsorship_value)
	get_current_band_info
	GetGlobalTags <band_info>
	<cash> = (<cash> + <sponsorship_value>)
	sponsorship_value = (<sponsorship_value> + $player1_status.new_cash)
	Change \{structurename = player1_status
		new_cash = 0}
	formatText TextName = cash qs(0xb6586427) a = <sponsorship_value>
	CreateScreenElement \{parent = root_window
		id = myinterfaceelement
		Type = descinterface
		desc = 'sponsor'}
	myinterfaceelement :SetProps {
		logo_texture = (<sponsor>.logo_texture)
		description_text = (<sponsor>.sponsorship_desc)
		cash_text = <cash>
		photo_texture = (<sponsor>.product_texture)
		event_handlers = [{pad_choose generic_event_back params = {state = uistate_gig_posters}}]
	}
	ui_gig
	AssignAlias \{id = myinterfaceelement
		alias = current_menu}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_destroy_sponsored 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :Die
	endif
	clean_up_user_control_helpers
endscript
sponsor_info = {
	tier1 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = qs(0x93d60998)
		sponsorship_value = 1440
	}
	tier2 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs(0x11d7fb06)
		sponsorship_value = 1440
	}
	tier3 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs(0x7953bd89)
		sponsorship_value = 1440
	}
	tier4 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs(0xbdf11237)
		sponsorship_value = 1440
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Zildjian
		product_texture = sponsor_photo_zildjian
		sponsorship_desc = qs(0xfd3b2c85)
		sponsorship_value = 1440
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Crate
		product_texture = sponsor_photo_crate
		sponsorship_desc = qs(0x9bdced7d)
		sponsorship_value = 1440
	}
	tier7 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs(0x9d974ead)
		be
		sponsorship_value = 1440
	}
}

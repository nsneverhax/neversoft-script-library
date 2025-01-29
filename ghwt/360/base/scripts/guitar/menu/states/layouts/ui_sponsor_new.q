
script ui_create_sponsor_new 
	RequireParams \{[
			tier_number
			tier_catagory
		]
		all}
	grab_sponsor_given_tier_and_type Tier = <tier_number> Type = <tier_catagory>
	sponsorship_value = (<sponsor>.sponsorship_value)
	formatText TextName = cash qs(0xb6586427) a = <sponsorship_value> usecommas
	menu_get_sponsor_sound
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_sponsor_id
		Type = descinterface
		desc = 'sponsor_new'
		exclusive_device = <exclusive_device>
	}
	my_sponsor_id :SetProps {
		logo_texture = (<sponsor>.logo_texture)
		description_text = (<sponsor>.sponsorship_desc)
		cash_text = <cash>
		photo_texture = (<sponsor>.product_texture)
		event_handlers = [
			{pad_choose continue_from_sponsors_screen}
		]
	}
	AssignAlias \{id = my_sponsor_id
		alias = current_menu}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_sponsors_award_sponsor_cash 
	RequireParams \{[
			amount
		]
		all}
	if isps3
		progression_getnumlocalplayers
		if (<num_local_players> > 1)
			amount = (<amount> / <num_local_players>)
			CastToInteger \{amount}
			printf 'ui_sponsors_award_sponsor_cash - amount after division is %f' f = <amount>
		endif
	endif
	gamemode_getnumplayersshown
	i = 1
	begin
	getplayerinfo <i> is_local_client
	if (<is_local_client> = 1)
		cash_ranks_get_rank Player = <i>
		old_rank = <rank>
		getplayerinfo <i> controller
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info> param = cash
		SetGlobalTags savegame = <savegame> <band_info> params = {cash = (<cash> + <amount>)}
		GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
		SetGlobalTags savegame = <savegame> <band_info> params = {career_earnings = (<career_earnings> + <amount>)}
		setplayerinfo <i> career_earnings = (<career_earnings> + <amount>)
		cash_ranks_get_rank Player = <i>
		new_rank = <rank>
		if NOT (<new_rank> = <old_rank>)
			setplayerinfo <i> cash_rank_up = 1
			printf 'Rank up %d from sponsor money' d = <i>
			someone_ranked_up = 1
		endif
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	if isps3
		if GotParam \{someone_ranked_up}
			i = 1
			begin
			getplayerinfo <i> is_local_client
			if (<is_local_client> = 1)
				setplayerinfo <i> cash_rank_up = 1
				printf 'someone_ranked_up - Rank up %d from sponsor money' d = <i>
			endif
			i = (<i> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script ui_destroy_sponsor_new 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_sponsor_id}
endscript

script continue_from_sponsors_screen 
	printf \{channel = test
		qs(0x873bc5f8)}
	progression_get_new_unlocks
	GetArraySize <new_unlocks>
	if (<array_Size> > 0)
		generic_event_replace \{state = uistate_rewards}
	else
		ui_att_ballpark_should_i_show_ad
		if (<show_att_ad> = 1)
			generic_event_choose \{state = uistate_att_ballpark}
		else
			ui_win_song_continue_next_menu
		endif
	endif
endscript

script grab_sponsor_given_tier_and_type 
	RequireParams \{[
			Tier
			Type
		]
		all}
	formatText checksumName = Tier 'tier%d' d = <Tier>
	formatText checksumName = spons_info 'sponsor_info_%d' d = <Type>
	sponsor = ($<spons_info>.<Tier>)
	return sponsor = <sponsor>
endscript

script get_num_gigs_complete_for_sponsor 
	RequireParams \{[
			Player
		]
		all}
	gamemode_gettype
	if NOT (<Type> = career)
		printstruct channel = mychannel <...>
		ScriptAssert \{qs(0x2538ec8a)}
	endif
	getplayerinfo <Player> controller
	get_savegame_from_controller controller = <controller>
	getplayerinfo <Player> part
	if (($current_num_players) > 1)
		my_mode = career_band
	else
		switch (<part>)
			case guitar
			my_mode = career_guitar
			case bass
			my_mode = career_bass
			case drum
			my_mode = career_drum
			case vocals
			my_mode = career_vocals
		endswitch
	endif
	get_progression_globals <my_mode>
	SongList = <tier_global>
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	complete_count = 0
	begin
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <Tier>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<completed> = 1)
		complete_count = (<complete_count> + 1)
	endif
	Tier = (<Tier> + 1)
	repeat ($<SongList>.num_tiers)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = ($current_gig_number)
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<completed> = 0)
		complete_count = (<complete_count> + 1)
	endif
	printf channel = mychannel qs(0xc3394e21) d = <Player> g = <complete_count>
	return num_gigs_beaten = <complete_count>
endscript

script did_player_get_sponsored_last_gig 
	RequireParams \{[
			Player
		]
		all}
	get_num_gigs_complete_for_sponsor Player = <Player>
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1)
		str = 'band'
	else
		getplayerinfo <Player> part
		switch (<part>)
			case guitar
			str = 'guitar'
			case bass
			str = 'bass'
			case drum
			str = 'drum'
			case vocals
			str = 'vocals'
		endswitch
	endif
	if (<num_gigs_beaten> > 12 || <num_gigs_beaten> < 1)
		return \{got_sponsored = 0}
	elseif (<num_gigs_beaten> > 6)
		if (<str> = 'vocals')
			return \{got_sponsored = 0}
		endif
	endif
	getplayerinfo <Player> controller
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	formatText checksumName = sponsor_flags_chk 'got_sponsored_%s_t%d' s = <str> d = <num_gigs_beaten>
	GetGlobalTags <band_info> savegame = <savegame> param = <sponsor_flags_chk>
	flag = (<...>.<sponsor_flags_chk>)
	been_sponsored = <flag>
	if NOT (<been_sponsored> = 0)
		return \{got_sponsored = 0}
	endif
	if isXenon
		AddParam Name = <sponsor_flags_chk> structure_name = my_flag value = 1
		SetGlobalTags <band_info> savegame = <savegame> params = <my_flag>
		printf channel = mychannel qs(0x1c898246) s = <Player>
	endif
	return got_sponsored = 1 tier_number = <num_gigs_beaten> tier_catagory = <str>
endscript
sponsor_info_band = {
	tier1 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs(0x7814cfb3)
		sponsorship_value = 200
	}
	tier2 = {
		logo_texture = sponsor_logo_evans
		product_texture = sponsor_photo_evans
		sponsorship_desc = qs(0xf564e56e)
		sponsorship_value = 250
	}
	tier3 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs(0x11d7fb06)
		sponsorship_value = 300
	}
	tier4 = {
		logo_texture = sponsor_logo_sabian
		product_texture = sponsor_photo_sabian
		sponsorship_desc = qs(0xd09a67f4)
		sponsorship_value = 350
	}
	tier5 = {
		logo_texture = sponsor_logo_vox
		product_texture = sponsor_photo_vox
		sponsorship_desc = qs(0xc00ec7c4)
		sponsorship_value = 400
	}
	tier6 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = qs(0x93d60998)
		sponsorship_value = 450
	}
	tier7 = {
		logo_texture = sponsor_logo_oc_drums
		product_texture = sponsor_photo_oc
		sponsorship_desc = qs(0x65c3f37b)
		sponsorship_value = 500
	}
	tier8 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs(0x9d974ead)
		sponsorship_value = 550
	}
	tier9 = {
		logo_texture = sponsor_logo_marshall
		product_texture = sponsor_photo_marshall
		sponsorship_desc = qs(0xd84457fd)
		sponsorship_value = 600
	}
	tier10 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs(0xbdf11237)
		sponsorship_value = 650
	}
	tier11 = {
		logo_texture = sponsor_logo_pork_pie
		product_texture = sponsor_photo_porkpie
		sponsorship_desc = qs(0xd3204eb1)
		sponsorship_value = 750
	}
	tier12 = {
		logo_texture = sponsor_logo_ampeg_bass
		product_texture = sponsor_photo_ampeg
		sponsorship_desc = qs(0x396da783)
		sponsorship_value = 1000
	}
}
sponsor_info_guitar = {
	tier1 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs(0x7814cfb3)
		sponsorship_value = 500
	}
	tier3 = {
		logo_texture = sponsor_logo_emg
		product_texture = sponsor_photo_emg
		sponsorship_desc = qs(0x5eb9b16a)
		sponsorship_value = 750
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs(0x11d7fb06)
		sponsorship_value = 900
	}
	tier6 = {
		logo_texture = sponsor_logo_vox
		product_texture = sponsor_photo_vox
		sponsorship_desc = qs(0xc00ec7c4)
		sponsorship_value = 1000
	}
	tier8 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs(0x9d974ead)
		sponsorship_value = 1350
	}
	tier10 = {
		logo_texture = sponsor_logo_marshall
		product_texture = sponsor_photo_marshall
		sponsorship_desc = qs(0xd84457fd)
		sponsorship_value = 1500
	}
}
sponsor_info_bass = {
	tier1 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs(0x7814cfb3)
		sponsorship_value = 500
	}
	tier3 = {
		logo_texture = sponsor_logo_emg
		product_texture = sponsor_photo_emg
		sponsorship_desc = qs(0xccf8e127)
		sponsorship_value = 750
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs(0x11d7fb06)
		sponsorship_value = 900
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs(0x9d974ead)
		sponsorship_value = 1000
	}
	tier8 = {
		logo_texture = sponsor_logo_ampeg_bass
		product_texture = sponsor_photo_ampeg
		sponsorship_desc = qs(0x479d07f6)
		sponsorship_value = 1350
	}
	tier10 = {
		logo_texture = sponsor_logo_marshall
		product_texture = sponsor_photo_marshall
		sponsorship_desc = qs(0xd84457fd)
		sponsorship_value = 1500
	}
}
sponsor_info_drum = {
	tier1 = {
		logo_texture = Sponsor_Logo_Zildjian
		product_texture = sponsor_photo_zildjian
		sponsorship_desc = qs(0x75a026dd)
		sponsorship_value = 500
	}
	tier2 = {
		logo_texture = sponsor_logo_regal
		product_texture = sponsor_photo_regal
		sponsorship_desc = qs(0xe8661786)
		sponsorship_value = 750
	}
	tier3 = {
		logo_texture = sponsor_logo_pork_pie
		product_texture = sponsor_photo_porkpie
		sponsorship_desc = qs(0xd3204eb1)
		sponsorship_value = 900
	}
	tier6 = {
		logo_texture = sponsor_logo_sabian
		product_texture = sponsor_photo_sabian
		sponsorship_desc = qs(0xd09a67f4)
		sponsorship_value = 1000
	}
	tier8 = {
		logo_texture = sponsor_logo_oc_drums
		product_texture = sponsor_photo_oc
		sponsorship_desc = qs(0x65c3f37b)
		sponsorship_value = 1350
	}
	tier10 = {
		logo_texture = sponsor_logo_evans
		product_texture = sponsor_photo_evans
		sponsorship_desc = qs(0x5c6db280)
		sponsorship_value = 1500
	}
}
sponsor_info_vocals = {
	tier1 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = qs(0x93d60998)
		sponsorship_value = 2000
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs(0xbdf11237)
		sponsorship_value = 4000
	}
}

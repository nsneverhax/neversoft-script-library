row_count_for_sb = 0

script ui_create_cash_rewards_3 
	if screenelementexists \{id = my_cash_rewards_id}
		destroyscreenelement \{id = my_cash_rewards_id}
	endif
	change \{row_count_for_sb = 0}
	formattext textname = gig_earn qs(0xcb2f9062) d = ($ui_gig_summary_gig_totals [0]) usecommas
	get_current_band_info
	getglobaltags <band_info>
	formattext textname = car_earn qs(0xcb2f9062) d = <career_earnings> usecommas
	soundevent \{event = menu_purchase_item}
	getpakmancurrent \{map = zones}
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_training)
		spawnscriptnow \{skate8_sfx_backgrounds_new_area
			params = {
				bg_sfx_area = frontend_menu_music
			}}
	endif
	get_all_exclusive_devices
	createscreenelement {
		parent = root_window
		id = my_cash_rewards_id
		type = descinterface
		desc = 'cash_reward_3'
		cash_money_text = qs(0x06643b70)
		this_gig_entry_text = <gig_earn>
		career_entry_text = <car_earn>
		exclusive_device = <exclusive_device>
		text_rock_rank_alpha = 0
		cash_to_next_alpha = 0
	}
	createscreenelement \{type = windowelement
		parent = my_cash_rewards_id
		id = my_current_menu
		dims = (612.0, 310.0)
		pos = (80.0, 195.0)
		just = [
			left
			top
		]
		pos_anchor = [
			left
			top
		]
		child_anchor = [
			left
			top
		]
		tags = {
			current = 0
			fit = 7
			total = 9
		}}
	my_event_handlers = [
		{pad_up ui_cash_rewards_shift params = {up}}
		{pad_down ui_cash_rewards_shift params = {down}}
		{pad_choose ui_win_song_continue_next_menu}
	]
	if (($current_num_players) > 1)
		setscreenelementprops \{id = my_cash_rewards_id
			patch_alpha = 0
			gigcash_art_alpha = 1
			this_gig_entry_alpha = 0
			career_entry_alpha = 0
			career_alpha = 0
			this_gig_alpha = 0}
	else
		cash_ranks_get_rank
		cash_ranks_get_patch_id
		formattext textname = next_rock_rank_txt qs(0xcb2f9062) d = <cash_to_next_rank> usecommas
		formattext textname = rock_rank_txt qs(0x76b3fda7) d = <rank>
		setscreenelementprops {
			id = my_cash_rewards_id
			cash_milestones_patch_texture = <cash_patch_id>
			text_rock_rank_entry_text = <rock_rank_txt>
			cash_to_next_entry_text = <next_rock_rank_txt>
		}
	endif
	<id> :se_setprops event_handlers = <my_event_handlers>
	createscreenelement \{type = vmenu
		parent = my_current_menu
		id = stat_vmenu
		dims = (512.0, 0.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			top
		]
		spacing_between = -50}
	i = 0
	begin
	getplayerinfo (<i> + 1) part
	switch <part>
		case guitar
		<part_text> = qs(0x11355666)
		case bass
		<part_text> = qs(0x4f551cbe)
		case drum
		<part_text> = qs(0xf3e03f27)
		case vocals
		<part_text> = qs(0x9fae80a8)
	endswitch
	createscreenelement {
		parent = stat_vmenu
		type = descinterface
		desc = 'cash_reward_row_3'
		autosizedims = true
		cash_reward_item_text_text = <part_text>
		cash_reward_check_alpha = 0
		cash_reward_item_text_rgba = (($g_menu_colors).brick)
	}
	change row_count_for_sb = (($row_count_for_sb) + 1)
	<collection> = ($cash_milestones_collection [<i>])
	foreachin <collection> do = cash_rewards_3_add_individual_rewards params = {menu = stat_vmenu}
	i = (<i> + 1)
	repeat ($current_num_players)
	if ($row_count_for_sb <= 6)
		my_cash_rewards_id :se_setprops \{scroll_bar_alpha = 0.0}
	endif
	assignalias \{id = my_current_menu
		alias = current_menu}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0x182f0173) button = green <all_button_params> z = 1000
	setscreenelementprops {
		id = my_current_menu
		tags = {current = 0 fit = 6 total = ($row_count_for_sb)}
	}
	my_cash_rewards_id :obj_spawnscript \{ui_cash_rewards_3_anim}
	printf channel = mychannel qs(0x0d205946) d = ($row_count_for_sb)
endscript

script ui_destroy_cash_rewards_3 
	if (($current_num_players) = 1)
		ui_gig_cash_clear_gig_earnings
		progression_cashmilestonesclear
	endif
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_cash_rewards_id}
endscript

script ui_cash_rewards_shift 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	if gotparam \{down}
		if (<current> >= (<total> - <fit>))
			return
		endif
		stat_vmenu :setprops \{pos = {
				(0.0, -51.0)
				relative
			}
			time = 0.1}
		settags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		stat_vmenu :setprops \{pos = {
				(0.0, 51.0)
				relative
			}
			time = 0.1}
		settags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	gettags
	<max> = (<total> - <fit>)
	<dx> = (240.0 / <max>)
	printstruct channel = mychannel <...>
	pos = ((397.0, -45.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_cash_rewards_id :se_setprops thumb_piece_pos = <pos> time = 0.1
endscript

script cash_rewards_3_add_band_rewards 
	if (<band> = true)
		<label> = ($cash_milestones.<milestone>.text)
		if (<cash> = 0)
			formattext textname = reward qs(0x73307931) s = <label>
		else
			formattext textname = reward qs(0x48b729a0) d = <cash> s = <label>
		endif
		createscreenelement {
			parent = stat_vmenu
			type = descinterface
			desc = 'cash_reward_row_3'
			autosizedims = true
			cash_reward_item_text_text = <reward>
		}
		change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_3_add_individual_rewards 
	if (<band> = false)
		<label> = ($cash_milestones.<milestone>.text)
		if (<cash> = 0)
			formattext textname = reward qs(0x73307931) s = <label>
		else
			formattext textname = reward qs(0x48b729a0) d = <cash> s = <label>
		endif
		createscreenelement {
			parent = stat_vmenu
			type = descinterface
			desc = 'cash_reward_row_3'
			autosizedims = true
			cash_reward_item_text_text = <reward>
		}
		change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_continue_from_cash_rewards_sp 
	ui_win_song_continue_next_menu
endscript

script ui_cash_rewards_3_anim 
	se_setprops \{text_rock_rank_alpha = 1
		time = 0.4
		anim = gentle}
	se_setprops \{cash_to_next_alpha = 1
		time = 0.4
		anim = gentle}
	getplayerinfo \{1
		cash_rank_up}
	if (<cash_rank_up> = 1)
		se_setprops \{cash_milestones_patch_scale = 1.4499999
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.2
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 0.9
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.15
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1
			time = 0.01}
		setplayerinfo \{1
			cash_rank_up = 0}
	endif
endscript

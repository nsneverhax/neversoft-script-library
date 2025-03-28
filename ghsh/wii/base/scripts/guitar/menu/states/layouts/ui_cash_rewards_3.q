row_count_for_sb = 0

script ui_create_cash_rewards_3 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	0xc1c4e84c \{mode = 0x07071941
		0xd607e2e6 = 1}
	if ScreenElementExists \{id = my_cash_rewards_id}
		DestroyScreenElement \{id = my_cash_rewards_id}
	endif
	Change \{row_count_for_sb = 0}
	formatText TextName = gig_earn qs(0xcb2f9062) d = ($ui_gig_summary_gig_totals [0]) usecommas
	get_current_band_info
	GetGlobalTags <band_info>
	formatText TextName = car_earn qs(0xcb2f9062) d = <career_earnings> usecommas
	SoundEvent \{event = menu_purchase_item}
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_cash_rewards_id
		Type = descinterface
		desc = 'BX_cash_reward_3'
		cash_money_text = qs(0x06643b70)
		this_gig_entry_text = <gig_earn>
		career_entry_text = <car_earn>
		exclusive_device = <exclusive_device>
		text_rock_rank_alpha = 0
		cash_to_next_alpha = 0
		title_text = <title_text>
	}
	my_cash_rewards_id :Obj_SpawnScriptNow \{bg_swap}
	my_cash_rewards_id :0x8e6af868 \{child = title
		z_priority = 20}
	my_cash_rewards_id :0x8e6af868 \{child = this_gig
		z_priority = 20}
	my_cash_rewards_id :0x8e6af868 \{child = career
		z_priority = 20}
	my_cash_rewards_id :0x8e6af868 \{child = cash_money
		z_priority = 20}
	CreateScreenElement \{Type = WindowElement
		parent = my_cash_rewards_id
		id = my_current_menu
		dims = (462.0, 300.0)
		Pos = (200.0, 250.0)
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
		}
		rot_angle = -2000}
	my_event_handlers = [
		{pad_up ui_cash_rewards_shift params = {up}}
		{pad_down ui_cash_rewards_shift params = {down}}
		{pad_choose ui_win_song_continue_next_menu}
	]
	if (($current_num_players) > 1)
		SetScreenElementProps \{id = my_cash_rewards_id
			patch_alpha = 0
			cash_reward_image_placeholder_alpha = 1
			this_gig_entry_alpha = 0
			career_entry_alpha = 0
			career_alpha = 0
			this_gig_alpha = 0
			rockrank_alpha = 0
			cash_reward_pieces_pos = (520.3257, 144.486)
			rich_object_2_pos = (1001.0, 524.0)
			rich_object_2_dims = (732.0, 732.0)
			rich_object_2_z_priority = 7}
		SetScreenElementProps \{id = my_current_menu
			Pos = (369.0, 272.0)}
	else
		cash_ranks_get_rank
		cash_ranks_get_patch_id
		formatText TextName = next_rock_rank_txt qs(0xcb2f9062) d = <cash_to_next_rank> usecommas
		formatText TextName = rock_rank_txt qs(0x76b3fda7) d = <rank>
		printf qs(0x3d5ab2cd) t = <cash_patch_id>
		SetScreenElementProps {
			id = my_cash_rewards_id
			cash_milestones_patch_texture = <cash_patch_id>
			text_rock_rank_entry_text = <rock_rank_txt>
			cash_to_next_entry_text = <next_rock_rank_txt>
		}
	endif
	<id> :se_setprops event_handlers = <my_event_handlers>
	CreateScreenElement \{Type = VMenu
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
	CreateScreenElement {
		parent = stat_vmenu
		Type = descinterface
		desc = 'BX_cash_reward_row_3'
		autosizedims = true
		cash_reward_item_text_text = <part_text>
		cash_reward_check_alpha = 0
		cash_reward_item_text_rgba = (($g_menu_colors).menu_title)
		cash_reward_item_text_internal_just = [center center]
		cash_reward_item_text_font = fontgrid_denim_title
		cash_reward_item_text_shadow_enabled = true
		cash_reward_item_text_dims = (402.0, 55.0)
	}
	Change row_count_for_sb = (($row_count_for_sb) + 1)
	<collection> = ($cash_milestones_collection [<i>])
	ForEachIn <collection> do = cash_rewards_3_add_individual_rewards params = {menu = stat_vmenu}
	i = (<i> + 1)
	repeat ($current_num_players)
	if ($row_count_for_sb <= 6)
		my_cash_rewards_id :se_setprops \{scroll_bar_alpha = 0.0}
	endif
	AssignAlias \{id = my_current_menu
		alias = current_menu}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0x182f0173) button = green <all_button_params> z = 1000
	SetScreenElementProps {
		id = my_current_menu
		tags = {current = 0 fit = 6 total = ($row_count_for_sb)}
	}
	my_cash_rewards_id :obj_spawnscript \{ui_cash_rewards_3_anim}
	printf channel = mychannel qs(0x0d205946) d = ($row_count_for_sb)
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_cash_rewards_3 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if (($current_num_players) = 1)
		ui_gig_cash_clear_gig_earnings
		progression_cashmilestonesclear
	endif
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_cash_rewards_id}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_cash_rewards_shift 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if GotParam \{down}
		if (<current> >= (<total> - <fit>))
			return
		endif
		stat_vmenu :SetProps \{Pos = {
				(0.0, -51.0)
				relative
			}
			time = 0.1}
		SetTags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		stat_vmenu :SetProps \{Pos = {
				(0.0, 51.0)
				relative
			}
			time = 0.1}
		SetTags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	GetTags
	<Max> = (<total> - <fit>)
	<dx> = (202.99997 / <Max>)
	printstruct channel = mychannel <...>
	Pos = ((305.4366, 67.88013) + ((0.0, 1.0) * (<current> * <dx>)))
	my_cash_rewards_id :se_setprops thumb_piece_pos = <Pos> time = 0.1
endscript

script cash_rewards_3_add_band_rewards 
	if (<Band> = true)
		<label> = ($cash_milestones.<milestone>.text)
		ScriptAssert \{qs(0x454947a3)}
		if (<cash> = 0)
			formatText TextName = reward qs(0x73307931) s = <label>
		else
			formatText TextName = reward qs(0x48b729a0) d = <cash> s = <label>
		endif
		CreateScreenElement {
			parent = stat_vmenu
			Type = descinterface
			desc = 'BX_cash_reward_row_3'
			autosizedims = true
			cash_reward_item_text_text = <reward>
		}
		Change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_3_add_individual_rewards 
	if (<Band> = FALSE)
		<label> = ($cash_milestones.<milestone>.text)
		if (((<milestone> = percent_hit) || (<milestone> = stars_bonus)) && GotParam data)
			formatText TextName = reward qs(0x7f543023) d = <data> s = <label>
		elseif (((<milestone> = note_streak) || (<milestone> = band_note_streak)) && GotParam data)
			<data> = (<data> * 25)
			formatText TextName = reward qs(0xf8f7294b) s = <label> d = <data>
		else
			formatText TextName = reward qs(0x73307931) s = <label>
		endif
		if (<cash> = 0)
			formatText TextName = reward qs(0x73307931) s = <label>
		else
			formatText TextName = reward qs(0x48b729a0) d = <cash> s = <label>
		endif
		CreateScreenElement {
			parent = stat_vmenu
			Type = descinterface
			desc = 'BX_cash_reward_row_3'
			autosizedims = true
			cash_reward_item_text_text = <reward>
		}
		Change row_count_for_sb = (($row_count_for_sb) + 1)
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
		se_setprops \{cash_milestones_patch_scale = 1.75
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.5
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.2
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.3
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.4499999
			time = 0.01}
		se_waitprops
		se_setprops \{cash_milestones_patch_scale = 1.3
			time = 0.01}
		setplayerinfo \{1
			cash_rank_up = 0}
	endif
endscript

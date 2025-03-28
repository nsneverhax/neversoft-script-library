row_count_for_sb = 0

script ui_create_cash_rewards_3 
	if ScreenElementExists \{id = my_cash_rewards_id}
		DestroyScreenElement \{id = my_cash_rewards_id}
	endif
	Change \{row_count_for_sb = 0}
	formatText TextName = gig_earn qs(0xcb2f9062) d = ($ui_gig_summary_gig_totals [0]) usecommas
	get_current_band_info
	GetGlobalTags <band_info>
	formatText TextName = car_earn qs(0xcb2f9062) d = <career_earnings> usecommas
	SoundEvent \{event = menu_purchase_item}
	GetPakManCurrent \{map = zones}
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_credits && <pak> != z_training)
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
	endif
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_cash_rewards_id
		Type = descinterface
		desc = 'cash_reward_3'
		cash_money_text = qs(0x06643b70)
		this_gig_entry_text = <gig_earn>
		career_entry_text = <car_earn>
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement \{Type = WindowElement
		parent = my_cash_rewards_id
		id = my_current_menu
		dims = (612.0, 310.0)
		Pos = (80.0, 195.0)
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
	if (($current_num_players) > 1)
		my_event_handlers = [
			{pad_up ui_cash_rewards_shift params = {up}}
			{pad_down ui_cash_rewards_shift params = {down}}
			{pad_back generic_event_back}
		]
		SetScreenElementProps \{id = my_cash_rewards_id
			patch_alpha = 0
			cash_reward_image_placeholder_alpha = 1
			this_gig_entry_alpha = 0
			career_entry_alpha = 0
			career_alpha = 0
			this_gig_alpha = 0}
	else
		my_event_handlers = [
			{pad_up ui_cash_rewards_shift params = {up}}
			{pad_down ui_cash_rewards_shift params = {down}}
			{pad_choose cash_rewards_continue_from_cash_rewards_sp}
		]
		cash_ranks_get_rank
		cash_ranks_get_patch_id
		formatText TextName = next_rock_rank_txt qs(0xcb2f9062) d = <cash_to_next_rank> usecommas
		formatText TextName = rock_rank_txt qs(0x76b3fda7) d = <rank>
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
		desc = 'cash_reward_row_3'
		autosizedims = true
		cash_reward_item_text_text = <part_text>
		cash_reward_check_alpha = 0
		cash_reward_item_text_rgba = (($g_menu_colors).brick)
	}
	Change row_count_for_sb = (($row_count_for_sb) + 1)
	<collection> = ($cash_milestones_collection [<i>])
	ForEachIn <collection> do = cash_rewards_3_add_individual_rewards params = {menu = stat_vmenu}
	i = (<i> + 1)
	repeat ($current_num_players)
	AssignAlias \{id = my_current_menu
		alias = current_menu}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	if (($current_num_players) > 1)
		add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 1000
	else
		add_user_control_helper text = qs(0x182f0173) button = green <all_button_params> z = 1000
	endif
	SetScreenElementProps {
		id = my_current_menu
		tags = {current = 0 fit = 6 total = ($row_count_for_sb)}
	}
	printf channel = mychannel qs(0x0d205946) d = ($row_count_for_sb)
endscript

script ui_destroy_cash_rewards_3 
	if (($current_num_players) = 1)
		ui_gig_cash_clear_gig_earnings
		progression_cashmilestonesclear
	endif
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_cash_rewards_id}
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
	<dx> = (193.0 / <Max>)
	printstruct channel = mychannel <...>
	Pos = ((397.0, -45.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_cash_rewards_id :se_setprops thumb_piece_pos = <Pos> time = 0.1
endscript

script cash_rewards_3_add_band_rewards 
	if (<Band> = true)
		<label> = ($cash_milestones.<milestone>.text)
		if (<cash> = 0)
			formatText TextName = reward qs(0x73307931) s = <label>
		else
			formatText TextName = reward qs(0x48b729a0) d = <cash> s = <label>
		endif
		CreateScreenElement {
			parent = stat_vmenu
			Type = descinterface
			desc = 'cash_reward_row_3'
			autosizedims = true
			cash_reward_item_text_text = <reward>
		}
		Change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_3_add_individual_rewards 
	if (<Band> = FALSE)
		<label> = ($cash_milestones.<milestone>.text)
		if (<cash> = 0)
			formatText TextName = reward qs(0x73307931) s = <label>
		else
			formatText TextName = reward qs(0x48b729a0) d = <cash> s = <label>
		endif
		CreateScreenElement {
			parent = stat_vmenu
			Type = descinterface
			desc = 'cash_reward_row_3'
			autosizedims = true
			cash_reward_item_text_text = <reward>
		}
		Change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_continue_from_cash_rewards_sp 
	gamemode_gettype
	if (<Type> = career)
		generic_event_replace \{state = uistate_magazine_cover}
	else
		ui_win_song_continue_next_menu
	endif
endscript


script ui_create_gig_cash_summary 
	change \{ui_song_breakdown_helper_params = {
		}}
	if should_use_all_buttons
		change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	set_focus_color
	set_unfocus_color
	if screenelementexists \{id = my_gig_summary_id}
		destroyscreenelement \{id = my_gig_summary_id}
	endif
	get_current_band_info
	getglobaltags <band_info>
	bandname = <name>
	get_all_exclusive_devices
	createscreenelement {
		parent = root_window
		id = my_gig_summary_id
		type = descinterface
		desc = 'song_complete_gig_cash'
		title_text = <bandname>
		exclusive_device = <exclusive_device>
	}
	gamemode_gettype
	if (<type> = quickplay)
		my_gig_summary_id :se_setprops \{gig_cash_text = qs(0xb44c144a)}
	endif
	gamemode_getnumplayersshown
	num_players = <num_players_shown>
	<pos_scalar> = (4 - <num_players>)
	<new_pos> = ((<pos_scalar> * 62) * (0.0, -1.0))
	my_gig_summary_id :se_setprops paper_bottom_pos = {<new_pos> relative}
	ui_gig_cash_summary_hide_player_data
	ui_gig_cash_summary_assign_strips_data
	ui_gig_cash_summary_add_navigation
endscript

script ui_destroy_gig_cash_summary 
	progression_clearnewcash
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_gig_summary_id}
endscript

script ui_deinit_gig_cash_summary 
	ui_gig_cash_clear_gig_earnings
	progression_cashmilestonesclear
endscript

script ui_gig_cash_summary_anim_in_script 
	setscriptcannotpause
	soundevent \{event = menu_song_complete_in}
endscript

script ui_gig_cash_summary_anim_out_script 
	clean_up_user_control_helpers
	generic_menu_pad_choose_sound
	soundevent \{event = menu_song_complete_out}
	gamemode_gettype
	if (<type> = career)
		generic_event_replace \{no_sound
			state = uistate_magazine_cover}
	else
		ui_win_song_continue_next_menu \{no_sound}
	endif
endscript

script ui_gig_cash_summary_hide_player_data 
	gamemode_getnumplayersshown
	num_players = <num_players_shown>
	if (<num_players> < 4)
		setscreenelementprops \{id = my_gig_summary_id
			form_gigcash_p4_alpha = 0
			player_cash_stats_p4_alpha = 0}
	endif
	if (<num_players> < 3)
		setscreenelementprops \{id = my_gig_summary_id
			form_gigcash_p3_alpha = 0
			player_cash_stats_p3_alpha = 0}
	endif
	if (<num_players> < 2)
		setscreenelementprops \{id = my_gig_summary_id
			form_gigcash_p2_alpha = 0
			player_cash_stats_p2_alpha = 0}
	endif
endscript

script ui_gig_cash_summary_assign_strips_data 
	if my_gig_summary_id :desc_resolvealias \{name = alias_player_stats_element}
	else
		scriptassert \{qs(0xcced482f)}
	endif
	getscreenelementchildren id = <resolved_id>
	gamemode_getnumplayersshown
	num_players = <num_players_shown>
	player = 1
	begin
	ui_song_breakdown_get_basic_player_data player_index = <player>
	getplayerinfo <player> cash_rank_up
	if (<cash_rank_up> = 1)
		setplayerinfo <player> cash_rank_up = 0
	endif
	arrow_alpha = <cash_rank_up>
	formattext textname = gig_cash_txt qs(0x447de8d3) d = ($ui_gig_summary_gig_totals [(<player> -1)])
	formattext textname = car_earnings_txt qs(0x447de8d3) d = <career_earnings>
	setscreenelementprops {
		id = (<children> [(<player> - 1)])
		player_name_text = <player_text>
		gig_cash_text = <gig_cash_txt>
		career_earnings_text = <car_earnings_txt>
		mixer_icon_guitar_texture = <icon_texture>
		cash_milestones_icon_pho_texture = <cash_icon_id>
		number_text_text = <rank_text>
		level_up_alpha = <arrow_alpha>
		check_mark_alpha = 0
		icon_difficulty_texture = <diff_texture>
	}
	player = (<player> + 1)
	repeat <num_players>
endscript

script ui_gig_cash_summary_add_navigation 
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x26568e5a) button = red z = 100000
	setscreenelementprops \{id = my_gig_summary_id
		event_handlers = [
			{
				pad_choose
				ui_gig_cash_summary_continue_to_next_screen
			}
			{
				pad_back
				ui_gig_cash_summary_pull_up_detailed_cash_stats
			}
		]}
	assignalias \{id = my_gig_summary_id
		alias = current_menu}
endscript

script ui_gig_cash_summary_continue_to_next_screen 
	if NOT scriptisrunning \{ui_gig_cash_summary_anim_out_script}
		spawnscriptnow \{ui_gig_cash_summary_anim_out_script}
	endif
endscript

script ui_gig_cash_summary_pull_up_detailed_cash_stats 
	if scriptisrunning \{ui_gig_cash_summary_anim_out_script}
		return
	endif
	generic_event_choose \{state = uistate_cash_rewards_3
		data = {
			from_gig_summary = 1
		}}
endscript
ui_gig_summary_gig_totals = [
	0
	0
	0
	0
]

script ui_gig_cash_print_gig_earnings 
	earnings = ($ui_gig_summary_gig_totals)
	printstruct channel = mychannel <...>
endscript

script ui_gig_cash_clear_gig_earnings 
	change \{ui_gig_summary_gig_totals = [
			0
			0
			0
			0
		]}
endscript

script ui_gig_cash_increase_gig_earnings 
	requireparams \{[
			player
			amount
		]
		all}
	hello = ($ui_gig_summary_gig_totals)
	old_amount = (<hello> [(<player> - 1)])
	setarrayelement arrayname = hello index = (<player> - 1) newvalue = (<amount> + <old_amount>)
	change ui_gig_summary_gig_totals = <hello>
endscript

script ui_gig_cash_grab_gig_earnings 
	requireparams \{[
			player
		]
		all}
	amount = ($ui_gig_summary_gig_totals [(<player> -1)])
	return amount = <amount>
endscript

script ui_gig_cash_increase_earnings_for_all 
	gamemode_getnumplayersshown
	i = 1
	begin
	getplayerinfo <i> new_cash
	ui_gig_cash_increase_gig_earnings amount = <new_cash> player = <i>
	i = (<i> + 1)
	repeat <num_players_shown>
endscript

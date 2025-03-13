
script ui_create_cash_rewards 
	<collection> = $cash_milestones_collection
	if screenelementexists \{id = my_cash_rewards_id}
		destroyscreenelement \{id = my_cash_rewards_id}
	endif
	createscreenelement \{parent = root_window
		id = my_cash_rewards_id
		type = descinterface
		desc = 'cash_reward'}
	setscreenelementprops \{id = my_cash_rewards_id
		cash_money_text = qs(0xa564d2d5)
		this_gig_entry_text = qs(0xb1094eda)
		career_entry_text = qs(0xa1bdbc3c)}
	if my_cash_rewards_id :desc_resolvealias \{name = alias_cash_reward_items_list
			param = menu}
	else
		scriptassert \{'Problem resolving alias in cash rewards'}
	endif
	cnt = 0
	getarraysize <collection>
	if (<array_size> > 0)
		total_cash = 0
		gamemode_getnumplayers
		i = 1
		begin
		getplayerinfo <i> part
		ui_get_instrument_text part = <part>
		createscreenelement {
			parent = <menu>
			type = descinterface
			desc = 'cash_reward_row'
			autosizedims = true
			cash_reward_item_text_text = <instrument_text>
			cash_reward_item_text_rgba = [192 0 0 255]
			cash_reward_check_alpha = 0
		}
		getarraysize (<collection> [(<i> -1)])
		sum = 0
		j = 0
		begin
		sum = (<sum> + (((<collection> [(<i> -1)]) [<j>]).cash))
		repeat <array_size>
		total_cash = (<total_cash> + <sum>)
		foreachin (<collection> [(<i> -1)]) do = cash_rewards_add_reward params = {menu = <menu>}
		i = (<i> + 1)
		repeat <num_players>
		formattext textname = tot_cash qs(0x447de8d3) d = <total_cash>
		setscreenelementprops {id = my_cash_rewards_id this_gig_entry_text = <tot_cash>}
	endif
	assignalias id = <menu> alias = current_menu
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 1000}
	setscreenelementprops {
		id = <menu>
		event_handlers = [
			{pad_choose ui_cash_rewards_continue}
		]
	}
endscript

script ui_destroy_cash_rewards 
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_cash_rewards_id}
endscript

script cash_rewards_add_reward 
	Random (@ element = cash_reward_bubble01 @ element = cash_reward_bubble02 @ element = cash_reward_bubble03 )
	<label> = ($cash_milestones.<milestone>.text)
	formattext textname = reward qs(0x0ba5c6ca) d = <cash> s = <label>
	createscreenelement {
		parent = <menu>
		type = descinterface
		desc = 'cash_reward_row'
		autosizedims = true
		cash_reward_item_text_text = <reward>
		cash_reward_bubble_texture = <element>
	}
	if (<band> = true)
		setscreenelementprops {
			id = <id>
			cash_reward_check_rgba = [40 40 210 255]
		}
	endif
endscript

script ui_cash_rewards_continue 
	printf \{channel = mychannel
		qs(0x6f27a383)}
	gamemode_gettype
	printf channel = mychannel qs(0xc9c7ed06) t = <type>
	if (<type> = career)
		ui_win_song_career_continue
	else
		ui_win_song_continue
	endif
endscript

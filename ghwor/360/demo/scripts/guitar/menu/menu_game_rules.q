g_game_rules_count = 0

script band_lobby_create_popup_menu_game_rules \{parent = !q1768515945
		is_popup = !i1768515945
		filter = !q1768515945}
	printf \{channel = band_lobby
		qs(0x1572f2ea)}
	if NOT gotparam \{pos}
		<pos> = (-320.0, -65.0)
	endif
	switch <filter>
		case no_team
		<team_param> = 0
		case team_only
		<team_param> = 1
		case all
		default
		<team_param> = -1
	endswitch
	createscreenelement {
		parent = <parent>
		type = descinterface
		id = band_lobby_pu_gr
		desc = 'band_lobby_pu_gr'
		z_priority = 25.0
		pos_anchor = [left , top]
		just = [left , top]
	}
	if NOT <id> :desc_resolvealias name = alias_generic_scrollbar_wgt
		scriptassert \{'could not find scrollbar for game rules screen!'}
	else
		assignalias id = <resolved_id> alias = game_rules_scrollbar
		generic_scrollbar_wgt_initialize \{id = game_rules_scrollbar}
	endif
	if ininternetmode
		<id> :se_setprops {
			right_container_pos = (257.0, 30.0)
		}
	endif
	if NOT gotparam \{alias}
		<alias> = current_band_lobby_popup
	endif
	assignalias id = <id> alias = <alias>
	change \{g_game_rules_count = 0}
	<index_to_focus> = -1
	if screenelementexists id = <alias>
		if <alias> :desc_resolvealias name = alias_game_rules_vmenu
			<resolved_id> :se_setprops {
				event_handlers = [
					{menu_selection_changed ui_sfx params = {menustate = generic uitype = scrollup}}
					{pad_back ui_sfx params = {menustate = generic uitype = back}}
				]
			}
			getarraysize ($competitive_rules_array)
			<i> = 0
			<competitive_game_rules_index> = 0
			begin
			<game_rule_struct> = ($competitive_rules_array [<i>])
			if structurecontains structure = ($<game_rule_struct>) condition
				if ($<game_rule_struct>.condition)
					is_game_rule_playable game_rule = <game_rule_struct>
					<current_rules> = ($competitive_rules)
					if (($game_mode) = fest_mode)
						<current_rules> = solo_fest_mode
					elseif (($game_mode) = fest_mode_team)
						<current_rules> = team_fest_mode
					endif
					if (<game_rule_struct> = <current_rules>)
						if (<game_rule_playable> = 1)
							<index_to_focus> = <competitive_game_rules_index>
						endif
					elseif (<index_to_focus> = -1)
						if (<game_rule_playable> = 1)
							<index_to_focus> = <competitive_game_rules_index>
						endif
					endif
					if ((<team_param> = -1) || ((<team_param> = 0) && (($<game_rule_struct>.team) = 0)) || ((<team_param> = 1) && (($<game_rule_struct>.team) = 1)))
						createscreenelement {
							parent = <resolved_id>
							type = descinterface
							desc = 'band_lobby_pu_gr_item'
							pos_anchor = [left , top]
							just = [left , top]
							item_text_text = ($<game_rule_struct>.text)
							highlight_btn_alpha = 0
							dims = (470.0, 65.0)
							alpha = 1
						}
						array = [
							{focus game_rules_set_highlight params = {screen_id = <alias> item_id = <id> highlight = 1 playable = <game_rule_playable>}}
							{focus game_rules_set_scroll_bar_pos params = {rule_index = <competitive_game_rules_index>}}
							{unfocus game_rules_set_highlight params = {screen_id = <alias> item_id = <id> highlight = 0 playable = <game_rule_playable>}}
							{pad_option game_rules_show_full_rules params = {alias = <alias>}}
							{pad_choose ui_sfx params = {menustate = generic uitype = select}}
						]
						if (<game_rule_playable> = 1)
							addarrayelement array = <array> element = {pad_choose game_rules_choose_rule_set params = {rules = <game_rule_struct> game_rule_index = <i> is_popup = <is_popup>}}
							addarrayelement array = <array> element = {focus update_game_rule_box params = {screen_id = <alias> game_rule_index = <i> playable = 1}}
							<text_rgba> = gh6_gold
						else
							if NOT gotparam \{not_playable_reason}
								scriptassert \{'Game rules not playable, but no reason why was returned. Defaulting to basic not playable reason'}
								not_playable_reason = default_reason
							endif
							addarrayelement array = <array> element = {pad_choose ui_sfx params = {menustate = generic uitype = negativeselect}}
							addarrayelement array = <array> element = {focus update_game_rule_box params = {screen_id = <alias> game_rule_index = <i> playable = 0 not_playable_reason = <not_playable_reason>}}
							<text_rgba> = [100 88 71 255]
						endif
						if NOT gotparam \{exclusive_devices}
							<exclusive_devices> = ($primary_controller)
						endif
						<id> :se_setprops {
							event_handlers = <array>
							item_text_rgba = <text_rgba>
							exclusive_device = <exclusive_devices>
						}
						change g_game_rules_count = (($g_game_rules_count) + 1)
						<competitive_game_rules_index> = (<competitive_game_rules_index> + 1)
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			generic_scrollbar_wgt_set_resolution id = game_rules_scrollbar num_elements = ($g_game_rules_count)
			if (<is_popup> = 0)
				<resolved_id> :se_setprops {
					event_handlers = [
						{pad_back generic_event_back}
						{pad_back ui_sfx params = {menustate = generic uitype = back}}
					]
				}
			endif
			if (<index_to_focus> = -1)
				<index_to_focus> = 0
			endif
			return {
				vmenu = <resolved_id>
				index_to_focus = <index_to_focus>
			}
		endif
	endif
endscript

script game_rules_choose_rule_set 
	requireparams \{[
			rules
			is_popup
		]
		all}
	is_game_rule_playable game_rule = <rules>
	game_rules_get_new_game_mode rule = <rules>
	if innetgame
		gman_shutdowngamemodegoal
	endif
	change game_mode = <game_mode>
	change competitive_rules = <rules>
	band_lobby_update_lobby_title
	if ininternetmode
		if innetgame
			gman_startgamemodegoal
			sendstructure callback = net_private_set_game_mode_and_rules data_to_send = {game_mode = <game_mode> rules = <rules>}
		else
			partygameruleselect game_rules = <rules>
		endif
	endif
	if (<is_popup> = 0)
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_back
	elseif (<game_rule_playable> = 1)
		band_lobby_continue_vs player = ($g_leader_player_num)
	else
		obj_getid
		se_setprops {
			event_handlers = [
				{focus update_game_rule_box params = {screen_id = current_band_lobby_popup game_rule_index = <game_rule_index> playable = 0 not_playable_reason = <not_playable_reason>}}
				{focus game_rules_set_highlight params = {screen_id = current_band_lobby_popup item_id = <objid> highlight = 1 playable = 0}}
				{focus game_rules_set_scroll_bar_pos params = {screen_id = current_band_lobby_popup rule_index = <game_rule_index>}}
				{unfocus game_rules_set_highlight params = {screen_id = current_band_lobby_popup item_id = <objid> highlight = 0 playable = 0}}
			]
			replace_handlers
			item_text_rgba = [100 88 71 255]
		}
	endif
endscript

script game_rules_get_new_game_mode 
	requireparams \{[
			rule
		]
		all}
	if (($competitive_rules = solo_fest_mode) || ($competitive_rules = team_fest_mode))
		if NOT ((<rule> = solo_fest_mode) || (<rule> = team_fest_mode))
			if ((($<rule>).team) = 1)
				return \{game_mode = compmega_team}
			else
				return \{game_mode = compmega}
			endif
		endif
	endif
	if (<rule> = solo_fest_mode)
		return \{game_mode = fest_mode}
	elseif (<rule> = team_fest_mode)
		return \{game_mode = fest_mode_team}
	else
		if ((($<rule>).team) = 1)
			return \{game_mode = compmega_team}
		else
			return \{game_mode = compmega}
		endif
	endif
endscript

script update_game_rule_box 
	requireparams \{[
			screen_id
			game_rule_index
			playable
		]
		all}
	menu_options = ($competitive_rules_array)
	if screenelementexists id = <screen_id>
		<ruleset> = ($competitive_rules_array [<game_rule_index>])
		if structurecontains structure = ($<ruleset>) description
			if (<playable> = 1)
				<screen_id> :se_setprops {
					helper_text_text = ($<ruleset>.description)
					full_rules_text_text = ($<ruleset>.full_rules)
					game_rule_img_texture = ($<ruleset>.image)
				}
			else
				text = 'Error in update_game_rule_box. No <not_playable_reason> found'
				rules_name = ($<ruleset>.text)
				switch (<not_playable_reason>)
					case not_enough_players
					if isxenonorwindx
						formattext textname = text qs(0x6098b11a) g = <rules_name>
					else
						formattext textname = text qs(0x5567cb79) g = <rules_name>
					endif
					case need_matching_instruments
					formattext textname = text qs(0xd9f912d3) g = <rules_name>
					case need_even_number_of_instruments
					formattext textname = text qs(0xb7998f8d) g = <rules_name>
					case default_reason
					if isxenonorwindx
						text = qs(0x79e058ec)
					else
						text = qs(0x5e58cc98)
					endif
				endswitch
				<screen_id> :se_setprops {
					helper_text_text = <text>
					full_rules_text_text = ($<ruleset>.full_rules)
					game_rule_img_texture = ($<ruleset>.image)
				}
			endif
		else
			<screen_id> :se_setprops {
				helper_text_text = qs(0xda8b1d8e)
			}
		endif
	endif
endscript

script game_rules_set_highlight 
	requireparams \{[
			screen_id
			item_id
			highlight
		]
		all}
	if screenelementexists id = <screen_id>
		if (<highlight> = 1)
			<item_id> :se_setprops {
				highlight_btn_alpha = 0.8
				time = 0.1
			}
			if (<playable>)
				se_setprops \{item_text_rgba = ntscwhite}
			endif
		else
			<item_id> :se_setprops {
				highlight_btn_alpha = 0
				time = 0.1
			}
			if (<playable>)
				se_setprops \{item_text_rgba = gh6_gold}
			endif
		endif
	endif
endscript

script game_rules_set_scroll_bar_pos 
	requireparams \{[
			rule_index
		]
		all}
	generic_scrollbar_wgt_update_thumb_pos {
		id = game_rules_scrollbar
		index = <rule_index>
	}
endscript

script game_rules_show_full_rules 
	requireparams \{[
			alias
		]
		all}
	if screenelementexists id = <alias>
		<alias> :se_getprops
		if (<info_container_alpha> = 0)
			ui_sfx \{menustate = gamerules
				uitype = toggleon}
			<alias> :se_setprops {
				info_container_alpha = 1
				game_rule_img_alpha = 0
				helper_text_alpha = 0
			}
		else
			ui_sfx \{menustate = gamerules
				uitype = toggleoff}
			<alias> :se_setprops {
				info_container_alpha = 0
				game_rule_img_alpha = 1
				helper_text_alpha = 1
			}
		endif
	endif
endscript

script is_game_rule_playable 
	requireparams \{[
			game_rule
		]
		all}
	reason = default_reason
	is_valid = 0
	switch <game_rule>
		case elimination
		case do_or_die
		case momentum
		case momentum_plus
		case solo_fest_mode
		case perfectionist
		case streakers
		case faceoff
		if band_lobby_is_matching_instruments
			if ($g_lobby_net_state = net_public)
				is_valid = 1
			else
				if band_lobby_satisfy_min_players team = 0 game_rule = <game_rule>
					is_valid = 1
				else
					reason = not_enough_players
				endif
			endif
		else
			reason = need_matching_instruments
		endif
		case team_do_or_die
		case team_momentum
		case team_perfectionist
		case team_elimination
		case team_streakers
		case team_fest_mode
		if ($g_lobby_net_state = net_public)
			if band_lobby_is_matching_instruments
				is_valid = 1
			else
				reason = need_matching_instruments
			endif
		else
			if band_lobby_is_matching_instruments
				if band_lobby_is_even_number_of_instruments
					if band_lobby_satisfy_min_players \{team = 1}
						is_valid = 1
					else
						reason = not_enough_players
					endif
				else
					reason = need_even_number_of_instruments
				endif
			else
				reason = need_matching_instruments
			endif
		endif
		case team_faceoff
		if ($g_lobby_net_state = net_public)
			is_valid = 1
		else
			if band_lobby_is_even_number_of_instruments
				if band_lobby_satisfy_min_players \{team = 1}
					is_valid = 1
				else
					reason = not_enough_players
				endif
			else
				reason = need_even_number_of_instruments
			endif
		endif
		case band_vs_band
		if band_lobby_is_traditional_band
			if ($g_lobby_net_state = net_public)
				is_valid = 1
			else
				if band_lobby_is_even_number_of_instruments
					if band_lobby_satisfy_min_players \{team = 1}
						is_valid = 1
					else
						reason = not_enough_players
					endif
				else
					reason = need_even_number_of_instruments
				endif
			endif
		endif
		default
		<is_valid> = 0
	endswitch
	if (<is_valid> = 1)
		return game_rule_playable = <is_valid>
	else
		return game_rule_playable = <is_valid> not_playable_reason = <reason>
	endif
endscript

script net_private_set_game_mode_and_rules 
	printf \{qs(0x52b42ee6)}
	gman_shutdowngamemodegoal
	change game_mode = <game_mode>
	change competitive_rules = <rules>
	gman_startgamemodegoal
endscript

g_game_rules_count = 0

script band_lobby_create_popup_menu_game_rules 
	printf \{channel = band_lobby
		qs(0x1572f2ea)}
	RequireParams \{[
			parent
			is_popup
			filter
		]
		all}
	if NOT GotParam \{Pos}
		Pos = (-320.0, -65.0)
	endif
	switch <filter>
		case no_team
		team_param = 0
		case team_only
		team_param = 1
		case all
		default
		team_param = -1
	endswitch
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		id = band_lobby_pu_gr
		desc = 'band_lobby_pu_gr'
		z_priority = 25.0
		pos_anchor = [left , top]
		just = [left , top]
	}
	if band_lobby_pu_gr :desc_resolvealias \{Name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0x01315b7f params = {minwidth = 50 maxwidth = 200 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_pu_gr :desc_resolvealias \{Name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript 0x01315b7f params = {minwidth = 2 maxwidth = 300 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if band_lobby_pu_gr :desc_resolvealias \{Name = alias_bkg_anim
			param = 0xda1265c9}
		<0xda1265c9> :obj_spawnscript ui_alphablast
	else
		ScriptAssert \{'UI_art'}
	endif
	if NOT GotParam \{alias}
		alias = current_band_lobby_popup
	endif
	AssignAlias id = <id> alias = <alias>
	Change \{g_game_rules_count = 0}
	index_to_focus = -1
	if ScreenElementExists id = <alias>
		if <alias> :desc_resolvealias Name = alias_game_rules_vmenu
			<resolved_id> :se_setprops {
				event_handlers = [
					{menu_selection_changed game_rules_sfx params = {scroll = up}}
					{pad_back generic_menu_pad_back_sound}
				]
			}
			GetArraySize ($competitive_rules_array)
			i = 0
			competitive_game_rules_index = 0
			begin
			game_rule_struct = ($competitive_rules_array [<i>])
			if StructureContains structure = ($<game_rule_struct>) condition
				if ($<game_rule_struct>.condition)
					is_game_rule_playable game_rule = <game_rule_struct>
					if (<game_rule_struct> = ($competitive_rules))
						if (<game_rule_playable> = 1)
							index_to_focus = <competitive_game_rules_index>
						endif
					elseif (<index_to_focus> = -1)
						if (<game_rule_playable> = 1)
							index_to_focus = <competitive_game_rules_index>
						endif
					endif
					if ((<team_param> = -1) || ((<team_param> = 0) && (($<game_rule_struct>.team) = 0)) || ((<team_param> = 1) && (($<game_rule_struct>.team) = 1)))
						CreateScreenElement {
							parent = <resolved_id>
							Type = descinterface
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
							{unfocus game_rules_set_highlight params = {screen_id = <alias> item_id = <id> highlight = 0 playable = <game_rule_playable>}}
							{pad_option game_rules_show_full_rules params = {alias = <alias>}}
							{pad_option game_rules_sfx params = {choose = 1}}
							{pad_choose game_rules_sfx params = {choose = 1}}
						]
						if (<game_rule_playable> = 1)
							AddArrayElement array = <array> element = {pad_choose game_rules_choose_rule_set params = {rules = <game_rule_struct> game_rule_index = <i> is_popup = <is_popup>}}
							AddArrayElement array = <array> element = {focus update_game_rule_box params = {screen_id = <alias> game_rule_index = <i> playable = 1}}
							text_rgba = ($uicolorref_palette.ntscwhite.rgba)
						else
							if NOT GotParam \{not_playable_reason}
								ScriptAssert \{'Game rules not playable, but no reason why was returned. Defaulting to basic not playable reason'}
								not_playable_reason = default_reason
							endif
							AddArrayElement array = <array> element = {pad_choose game_rules_sfx params = {negative = 1}}
							AddArrayElement array = <array> element = {focus update_game_rule_box params = {screen_id = <alias> game_rule_index = <i> playable = 0 not_playable_reason = <not_playable_reason>}}
							text_rgba = ($uicolorref_palette.grey_md.rgba)
						endif
						if NOT GotParam \{exclusive_devices}
							<exclusive_devices> = ($primary_controller)
						endif
						<id> :se_setprops {
							event_handlers = <array>
							item_text_rgba = <text_rgba>
							exclusive_device = <exclusive_devices>
						}
						Change g_game_rules_count = (($g_game_rules_count) + 1)
						competitive_game_rules_index = (<competitive_game_rules_index> + 1)
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			if (<is_popup> = 0)
				<resolved_id> :se_setprops {
					event_handlers = [
						{pad_back generic_event_back}
					]
				}
			endif
			if (<index_to_focus> = -1)
				<index_to_focus> = 0
			endif
			return {
				VMenu = <resolved_id>
				index_to_focus = <index_to_focus>
			}
		endif
	endif
endscript

script game_rules_choose_rule_set 
	RequireParams \{[
			rules
			is_popup
		]
		all}
	is_game_rule_playable game_rule = <rules>
	game_rules_get_new_game_mode rule = <rules>
	Change game_mode = <game_mode>
	Change competitive_rules = <rules>
	band_lobby_update_lobby_title
	if ininternetmode
		if InNetGame
			GetNumPlayers
			gamemode_updatenumplayers num_players = <num_players>
			SendStructure callback = net_private_set_game_mode_and_rules data_to_send = {num_players = <num_players> game_mode = <game_mode> rules = <rules>}
		else
			partygameruleselect game_rules = <rules>
		endif
	endif
	if (<is_popup> = 0)
		generic_event_back
	elseif (<game_rule_playable> = 1)
		band_lobby_continue_vs Player = ($g_leader_player_num)
	else
		Obj_GetID
		se_setprops {
			event_handlers = [
				{focus update_game_rule_box params = {screen_id = current_band_lobby_popup game_rule_index = <game_rule_index> playable = 0 not_playable_reason = <not_playable_reason>}}
				{focus game_rules_set_highlight params = {screen_id = current_band_lobby_popup item_id = <objID> highlight = 1 playable = 0}}
				{unfocus game_rules_set_highlight params = {screen_id = current_band_lobby_popup item_id = <objID> highlight = 0 playable = 0}}
			]
			replace_handlers
			item_text_rgba = ($uicolorref_palette.grey_md.rgba)
		}
	endif
endscript

script game_rules_get_new_game_mode 
	RequireParams \{[
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
	RequireParams \{[
			screen_id
			game_rule_index
			playable
		]
		all}
	menu_options = ($competitive_rules_array)
	if ScreenElementExists id = <screen_id>
		<ruleset> = ($competitive_rules_array [<game_rule_index>])
		if StructureContains structure = ($<ruleset>) description
			if (<playable> = 1)
				<screen_id> :se_setprops {
					helper_text_text = ($<ruleset>.description)
					full_rules_text_text = ($<ruleset>.full_rules)
					gr_image_texture = ($<ruleset>.image)
				}
			else
				text = 'Error in update_game_rule_box. No <not_playable_reason> found'
				rules_name = ($<ruleset>.text)
				switch (<not_playable_reason>)
					case not_enough_players
					if isxenonorwindx
						formatText TextName = text qs(0x6098b11a) g = <rules_name>
					else
						formatText TextName = text qs(0x5567cb79) g = <rules_name>
					endif
					case need_matching_instruments
					formatText TextName = text qs(0xd9f912d3) g = <rules_name>
					case need_even_number_of_instruments
					formatText TextName = text qs(0xb7998f8d) g = <rules_name>
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
					gr_image_texture = ($<ruleset>.image)
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
	RequireParams \{[
			screen_id
			item_id
			highlight
		]
		all}
	if ScreenElementExists id = <screen_id>
		if (<highlight> = 1)
			<item_id> :se_setprops {
				highlight_btn_alpha = 1
				time = 0.1
			}
			if (<playable>)
				se_setprops {
					item_text_rgba = ($uicolorref_palette.black.rgba)
				}
			endif
		else
			<item_id> :se_setprops {
				highlight_btn_alpha = 0
				time = 0.1
			}
			if (<playable>)
				se_setprops {
					item_text_rgba = ($uicolorref_palette.ntscwhite.rgba)
				}
			endif
		endif
		<item_id> :se_getparentid
		set_generic_menu_scrollbar_worker menu_id = <parent_id> desc_id = <screen_id> 0xf6e0b026 = 185 0x586dbcf2 = -185
	endif
endscript

script game_rules_set_scroll_bar_pos 
	RequireParams \{[
			screen_id
			rule_index
		]
		all}
	if ((($g_game_rules_count) - 1) > 0)
		if ScreenElementExists id = <screen_id>
			PosX = 0
			PosY = (-185 + ((370.0 * <rule_index>) / (($g_game_rules_count) - 1)))
			<screen_id> :se_setprops {
				scrollbar_thumb_pos = (((1.0, 0.0) * <PosX>) + ((0.0, 1.0) * <PosY>))
				time = 0.1
			}
		endif
	endif
endscript

script game_rules_show_full_rules 
	RequireParams \{[
			alias
		]
		all}
	if ScreenElementExists id = <alias>
		<alias> :se_getprops
		if (<info_container_alpha> = 0)
			<alias> :se_setprops {
				info_container_alpha = 1
				helper_text_alpha = 0
			}
		else
			<alias> :se_setprops {
				info_container_alpha = 0
				helper_text_alpha = 1
			}
		endif
	endif
endscript

script is_game_rule_playable 
	RequireParams \{[
			game_rule
		]
		all}
	reason = default_reason
	is_valid = 0
	switch <game_rule>
		case elimination
		case do_or_die
		case momentum
		case solo_fest_mode
		case PERFECTIONIST
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
		case p8_pro_faceoff
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
	Change game_mode = <game_mode>
	Change competitive_rules = <rules>
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
	printf qs(0x3fbd1f3e) g = ($game_mode) n = <num_players>
	gamemode_updatenumplayers num_players = <num_players>
endscript

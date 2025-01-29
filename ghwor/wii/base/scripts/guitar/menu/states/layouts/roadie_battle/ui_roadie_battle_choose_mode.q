roadie_battle_modes_array = [
	roadie_battle_mode_competitive
	roadie_battle_mode_coop
	roadie_battle_mode_setlist
]
roadie_battle_mode_coop = {
	text = qs(0x99717bf8)
	description = qs(0xf188798d)
	full_rules = qs(0x281d24f2)
	image = gr_challenge_roadie_battle
	choose_script = ui_roadie_battle_choose_mode_continue
	choose_params = {
		mode = coop
	}
}
roadie_battle_mode_competitive = {
	text = qs(0x24395e9d)
	description = qs(0xc29b6078)
	full_rules = qs(0xc1d94927)
	image = gr_competitive_roadie_battle
	choose_script = ui_roadie_battle_choose_mode_continue
	choose_params = {
		mode = competitive
	}
}
roadie_battle_mode_setlist = {
	text = qs(0x18b96c3b)
	description = qs(0xa31b6c01)
	full_rules = qs(0xaab154c7)
	image = gr_setlist_roadie_battle
	choose_script = ui_roadie_battle_choose_setlist_manager
}

script ui_create_roadie_battle_choose_mode \{in_freeplay = 0x00000018}
	if NOT GotParam \{device_num}
		<device_num> = ($primary_controller)
	endif
	destroy_friend_feed
	if English
		<mode_title_texture> = rb_mode_title_en
	elseif French
		<mode_title_texture> = rb_mode_title_fr
	elseif Italian
		<mode_title_texture> = rb_mode_title_it
	elseif German
		<mode_title_texture> = rb_mode_title_de
	elseif Spanish
		<mode_title_texture> = rb_mode_title_es
	endif
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = band_lobby_pu_gr
		desc = 'roadie_choose_mode_menu'
		z_priority = 505.0
		pos_anchor = [left , top]
		just = [left , top]
		tags = {
			in_freeplay = <in_freeplay>
		}
		mode_title_texture = <mode_title_texture>
	}
	<main_id> = <id>
	if NOT <main_id> :desc_resolvealias Name = alias_roadies_lineart_glow
		ScriptAssert \{'alias_roadies_lineart_GLOW'}
	endif
	<resolved_id> :Obj_SpawnScriptNow ui_roadie_battle_choose_mode_animate_glow
	<alias> = roadie_battle_mode_menu
	AssignAlias id = <id> alias = <alias>
	if NOT <alias> :desc_resolvealias Name = alias_game_rules_vmenu
		ScriptAssert \{'Could not resolve band_lobby_pu_gr -> alias_game_rules_vmenu'}
	endif
	<resolved_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx params = {menustate = Generic uitype = scrollup}}
			{pad_back ui_roadie_battle_choose_mode_back}
			{focus ui_roadie_battle_choose_mode_create_helpers}
		]
	}
	<index_to_focus> = 0
	GetArraySize ($roadie_battle_modes_array)
	<i> = 0
	begin
	<game_rule_struct> = ($roadie_battle_modes_array [<i>])
	<choose_script> = ($<game_rule_struct>.choose_script)
	if StructureContains structure = $<game_rule_struct> choose_params
		<choose_params> = ($<game_rule_struct>.choose_params)
	else
		<choose_params> = {}
	endif
	if StructureContains structure = ($<game_rule_struct>) condition
		if ($<game_rule_struct>.condition)
			<playable> = 1
		else
			<playable> = 0
		endif
	else
		<playable> = 1
	endif
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
		{focus game_rules_set_highlight params = {screen_id = <alias> item_id = <id> highlight = 1 playable = <playable>}}
		{unfocus game_rules_set_highlight params = {screen_id = <alias> item_id = <id> highlight = 0 playable = <playable>}}
		{pad_option game_rules_show_full_rules params = {alias = <alias>}}
		{pad_option ui_sfx params = {menustate = Generic uitype = toggleon}}
	]
	if GotParam \{default_selection}
		if (<default_selection> = ($roadie_battle_modes_array [<i>]))
			<index_to_focus> = <i>
		endif
	endif
	if (<playable> = 1)
		AddArrayElement array = <array> element = {pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		AddArrayElement array = <array> element = {pad_choose <choose_script> params = {<choose_params>}}
		AddArrayElement array = <array> element = {focus update_roadie_battle_item params = {screen_id = <alias> game_rule_index = <i> playable = 1}}
		<text_rgba> = gh6_gold
	else
		AddArrayElement array = <array> element = {pad_choose ui_sfx params = {menustate = Generic uitype = negativeselect}}
		AddArrayElement array = <array> element = {focus update_roadie_battle_item params = {screen_id = <alias> game_rule_index = <i> playable = 0 not_playable_reason = <not_playable_reason>}}
		<text_rgba> = [100 88 71 255]
	endif
	<id> :se_setprops {
		event_handlers = <array>
		item_text_rgba = <text_rgba>
		exclusive_device = <device_num>
	}
	<i> = (<i> + 1)
	repeat <array_Size>
	VMenu = <resolved_id>
	<VMenu> :se_setprops {
		exclusive_device = <device_num>
	}
	roadie_battle_mode_menu :SetTags menu_id = <VMenu>
	AssignAlias id = <VMenu> alias = current_menu
	LaunchEvent Type = focus target = <VMenu> data = {child_index = <index_to_focus>}
endscript

script ui_destroy_roadie_battle_choose_mode 
	Change \{block_clean_up_user_control_helpers = FALSE}
	clean_up_user_control_helpers
	DestroyScreenElement \{id = band_lobby_pu_gr}
endscript

script ui_roadie_battle_choose_mode_create_helpers 
	Change \{block_clean_up_user_control_helpers = FALSE}
	current_menu :se_getprops
	clean_up_user_control_helpers
	if GotParam \{exclusive_device}
		add_gamertag_helper exclusive_device = (<exclusive_device> [0]) z = 100000 ignore_player_part = true
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x9c8312f4)
		button = blue
		z = 100000}
	Change \{block_clean_up_user_control_helpers = true}
endscript

script ui_roadie_battle_choose_mode_create_dialog_helpers 
	Change \{block_clean_up_user_control_helpers = FALSE}
	current_menu :se_getprops
	clean_up_user_control_helpers
	if GotParam \{exclusive_device}
		add_gamertag_helper exclusive_device = (<exclusive_device> [0]) z = 100000 ignore_player_part = true
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	Change \{block_clean_up_user_control_helpers = true}
endscript

script update_roadie_battle_item \{screen_id = !q1768515945
		game_rule_index = !i1768515945
		playable = !i1768515945}
	menu_options = ($roadie_battle_modes_array)
	if ScreenElementExists id = <screen_id>
		<ruleset> = ($roadie_battle_modes_array [<game_rule_index>])
		if (<playable> = 1)
			<screen_id> :se_setprops {
				helper_text_text = ($<ruleset>.description)
				full_rules_text_text = ($<ruleset>.full_rules)
				game_rule_img_texture = ($<ruleset>.image)
			}
		else
			if NOT GotParam \{not_playable_reason}
				ScriptAssert \{'Game rule not playable, but no reason why was given'}
			endif
			<screen_id> :se_setprops {
				helper_text_text = <not_playable_reason>
				full_rules_text_text = ($<ruleset>.full_rules)
				game_rule_img_texture = ($<ruleset>.image)
			}
		endif
	endif
endscript

script ui_roadie_battle_choose_mode_continue \{mode = !q1768515945
		device_num = !i1768515945}
	roadie_battle_mode_menu :GetTags
	Change roadie_battle_mode = <mode>
	if (<in_freeplay> = true)
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0x48e3fe69)
			back_button_script = ui_roadie_battle_choose_mode_confirmed_stay
			dont_remove_helpers
			no_helpers
			player_device = <device_num>
			options = [
				{
					func = ui_roadie_battle_choose_mode_confirmed_stay
					text = qs(0x0b0e2e47)
				}
				{
					func = ui_roadie_battle_choose_mode_confirmed_roadie_battle_in_party_play
					text = qs(0x182f0173)
				}
			]
		}
		ui_roadie_battle_choose_mode_create_dialog_helpers
	else
		wiidscommunication :getstatus
		if (<current_ds_count> > 0)
			if ((<mode> = competitive) && (<current_ds_count> < $ds_min_players_for_roadie_battle))
				create_dialog_box {
					heading_text = qs(0xaa163738)
					body_text = qs(0xc021ca6e)
					back_button_script = ui_roadie_battle_choose_mode_confirmed_stay
					dont_remove_helpers
					no_helpers
					player_device = <device_num>
					options = [
						{
							func = ui_roadie_battle_choose_mode_confirmed_stay
							text = qs(0xec14cca3)
						}
						{
							func = ui_roadie_battle_choose_mode_reconnect_ds
							func_params = {mode = roadie_battle}
							text = qs(0x182f0173)
						}
					]
				}
				ui_roadie_battle_choose_mode_create_dialog_helpers
			else
				roadie_battle_send_mode
				roadie_battle_goto_lobby device_num = <device_num>
			endif
		else
			generic_event_choose {
				event = menu_change
				state = uistate_ds_connection_handler
				data = {
					mode = roadie_battle
					from = mode_select
					device_num = <device_num>
				}
			}
		endif
	endif
endscript

script ui_roadie_battle_choose_mode_confirmed_roadie_battle_in_party_play \{device_num = !i1768515945}
	SpawnScriptNow {
		ui_roadie_battle_choose_mode_build_ui_stack_from_party_play
		params = {
			device_num = <device_num>
		}
	}
endscript

script ui_roadie_battle_choose_mode_build_ui_stack_from_party_play \{device_num = !i1768515945}
	pushdisablerendering \{context = build_roadie_battle_stack
		Type = stack}
	pushblockbuttoneventmappings
	ui_event_wait_for_safe
	ui_event \{event = menu_replace
		data = {
			state = uistate_mainmenu
			clear_previous_stack
		}}
	ui_event_wait_for_safe
	ui_event \{event = menu_change
		data = {
			state = uistate_roadie_battle_choose_mode
		}}
	ui_event_wait_for_safe
	generic_event_choose {
		event = menu_change
		state = uistate_ds_connection_handler
		data = {
			mode = roadie_battle
			from = mode_select
			device_num = <device_num>
		}
	}
	popdisablerendering \{context = build_roadie_battle_stack
		Type = stack}
	popblockbuttoneventmappings
endscript

script ui_roadie_battle_choose_setlist_manager \{device_num = !i1768515945}
	if is_ds_connected
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0x1f43a717)
			back_button_script = ui_roadie_battle_choose_mode_confirmed_stay
			dont_remove_helpers
			no_helpers
			player_device = <device_num>
			options = [
				{
					func = ui_roadie_battle_choose_mode_confirmed_stay
					text = qs(0xec14cca3)
				}
				{
					func = ui_roadie_battle_choose_mode_reconnect_ds
					func_params = {mode = audience_party}
					text = qs(0x182f0173)
				}
			]
		}
		ui_roadie_battle_choose_mode_create_dialog_helpers
	else
		ui_roadie_battle_choose_mode_goto_ds_connection mode = audience_party device_num = <device_num>
	endif
endscript

script ui_roadie_battle_choose_mode_back \{device_num = !i1768515945}
	if is_ds_connected
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0xe0f2cadb)
			back_button_script = ui_roadie_battle_choose_mode_confirmed_stay
			dont_remove_helpers
			no_helpers
			player_device = <device_num>
			options = [
				{
					func = ui_roadie_battle_choose_mode_confirmed_stay
					text = qs(0xec14cca3)
				}
				{
					func = ui_roadie_battle_choose_mode_confirmed_exit
					text = qs(0xffb8a3dc)
				}
			]
		}
		ui_roadie_battle_choose_mode_create_dialog_helpers
	else
		ui_roadie_battle_choose_mode_confirmed_exit
	endif
endscript

script ui_roadie_battle_choose_mode_confirmed_stay 
	ui_sfx \{menustate = Generic
		uitype = back}
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_roadie_battle_choose_mode_confirmed_exit 
	roadie_battle_mode_menu :GetTags
	ui_sfx \{menustate = Generic
		uitype = back}
	destroy_dialog_box
	if (<in_freeplay> = true)
		generic_event_back
	else
		generic_event_back \{state = uistate_mainmenu}
	endif
endscript

script ui_roadie_battle_choose_mode_reconnect_ds \{mode = !q1768515945
		device_num = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	current_menu :se_setprops \{block_events}
	roadie_battle_exit
	cancel_ds_operation \{enable_network = FALSE}
	begin
	if wiidscommunication :isactive
		WaitOneGameFrame
	else
		break
	endif
	repeat
	ui_roadie_battle_choose_mode_goto_ds_connection mode = <mode> device_num = <device_num>
endscript

script ui_roadie_battle_choose_mode_goto_ds_connection \{mode = !q1768515945
		device_num = !i1768515945}
	roadie_battle_mode_menu :GetTags
	if (<in_freeplay> = true)
		<from> = freeplay
	else
		<from> = mode_select
	endif
	generic_event_choose {
		event = menu_change
		state = uistate_ds_connection_handler
		data = {
			mode = <mode>
			from = <from>
			device_num = <device_num>
		}
	}
endscript

script ui_roadie_battle_choose_mode_animate_glow 
	begin
	se_setprops alpha = RandomFloat (0.25, 0.35000002) time = RandomFloat (0.5, 1.0)
	se_waitprops
	se_setprops alpha = RandomFloat (0.0, 0.1) time = RandomFloat (0.5, 1.0)
	se_waitprops
	repeat
endscript


script ui_create_band_lobby_popup 
	RequireParams \{[
			reason
		]
		all}
	band_lobby_kick_leader_out_of_band_manage
	Change \{g_suppress_anim_in = 1}
	if inroadiebattlemode
		switch (<reason>)
			case more_players
			<reason> = roadie_battle_competitive_need_more_players
			case more_players_or_match_teams
			<reason> = roadie_battle_competitive_invalid_instruments
		endswitch
	endif
	switch <reason>
		case popup_kick_player
		case popup_no_games_available
		dialog_box_params = {}
		if GotParam \{back_script}
			AddParam structure_name = dialog_box_params Name = back_button_script value = <back_script>
		endif
		if GotParam \{back_params}
			AddParam structure_name = dialog_box_params Name = pad_back_params value = <back_params>
		endif
		if GotParam \{options}
			AddParam structure_name = dialog_box_params Name = options value = <options>
		endif
		if NOT GotParam \{z_priority}
			z_priority = 500
		endif
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = ($band_lobby_strings.<reason>)
			no_background
			player_device = <controller>
			dlg_z_priority = <z_priority>
			<dialog_box_params>
			no_focus
		}
		case mic_distribution_invalid
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = <message>
			no_background
			player_device = <controller>
			back_button_script = generic_event_back
			no_focus
			options = [
				{
					func = ui_event
					func_params = {event = menu_replace data = {is_popup state = uistate_mic_binding controller = <controller>}}
					text = ($band_lobby_strings.popup_option_mic_binding)
				}
				{
					func = generic_event_back
					func_params = {nosound}
					text = ($band_lobby_strings.popup_option_return)
				}
			]
		}
		case nonlocal_mic_distribution_invalid
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = ($band_lobby_strings.popup_nonlocal_mic_distribution_invalid)
			no_background
			player_device = <controller>
			back_button_script = generic_event_back
			no_focus
			options = [
				{
					func = generic_event_back
					func_params = {nosound}
					text = ($band_lobby_strings.popup_option_return)
				}
			]
		}
		case plat_party_headset_invalid
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = ($band_lobby_strings.popup_plat_party_headset_invalid)
			no_background
			player_device = <controller>
			back_button_script = generic_event_back
			no_focus
			options = [
				{
					func = generic_event_back
					func_params = {nosound}
					text = ($band_lobby_strings.popup_option_return)
				}
			]
		}
		case unsigned_players
		case guest_leader
		case game_servers_unavailable
		case age_restricted
		case too_many_players_host
		case players_not_ready_io_host
		case player_in_forced_flow
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = ($band_lobby_strings.<reason>)
			no_background
			player_device = <controller>
			back_button_script = generic_event_back
			no_focus
			options = [
				{
					func = generic_event_back
					func_params = {nosound}
					text = ($band_lobby_strings.popup_option_ok)
				}
			]
		}
		case roadie_battle_competitive_need_more_players
		case roadie_battle_competitive_invalid_roadies
		case roadie_battle_competitive_invalid_instruments
		case roadie_battle_roadies_not_ready
		case roadie_battle_need_more_players
		case roadie_battle_vocals_not_supported
		create_dialog_box {
			heading_text = ($band_lobby_strings.popup_title_warning)
			body_text = ($band_lobby_strings.<reason>)
			no_background
			player_device = <controller>
			back_button_script = generic_event_back
			no_focus
			options = [
				{
					func = generic_event_back
					func_params = {nosound}
					text = ($band_lobby_strings.popup_option_return)
				}
			]
		}
		default
		SoftAssert qs(0x48f796a5) a = <reason>
	endswitch
	spawn_player_drop_listeners \{drop_player_script = band_lobby_drop_player
		end_game_script = band_lobby_end_game}
	AssignAlias id = <menu_id> alias = current_menu
	if (<reason> = popup_kick_player)
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	endif
endscript

script ui_destroy_band_lobby_popup 
	destroy_dialog_box
	Change \{roadie_battle_band_lobby_popup_pending_via_ticker = FALSE}
endscript

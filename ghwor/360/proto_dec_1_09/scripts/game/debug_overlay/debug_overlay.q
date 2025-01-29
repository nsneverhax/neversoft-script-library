g_debug_overlay_on = 0

script toggle_debug_overlay 
	if ($g_debug_overlay_on = 0)
		Change \{g_debug_overlay_on = 1}
		if ScreenElementExists \{id = debug_overlay}
			debug_overlay :se_setprops \{alpha = 1.0}
		endif
	else
		Change \{g_debug_overlay_on = 0}
		if ScreenElementExists \{id = debug_overlay}
			debug_overlay :se_setprops \{alpha = 0.0}
		endif
	endif
endscript

script create_debug_overlay 
	begin
	if ($boot_movie_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<alpha> = 0.0
	if GlobalExists \{Name = g_debug_overlay_on}
		if ($g_debug_overlay_on = 1)
			<alpha> = 1.0
		endif
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = 'debug_overlay'
		id = debug_overlay
		alpha = <alpha>
	}
endscript

script destroy_debug_overlay 
	DestroyScreenElement \{id = debug_overlay}
endscript

script update_debug_overlay 
	RequireParams \{[
			game_mode_text
			competitive_rules_text
			leader
			net_leader
			primary_controller
			players_in_game
			party_text
			game_session_text
		]
		all}
	formatText TextName = game_mode_text qs(0x5d9eae64) g = <game_mode_text>
	formatText TextName = competitive_rules_text qs(0x5d9eae64) g = <competitive_rules_text>
	formatText TextName = leader_text qs(0x5d9eae64) g = <leader>
	formatText TextName = net_leader_text qs(0x5d9eae64) g = <net_leader>
	formatText TextName = primary_controller_text qs(0x5d9eae64) g = <primary_controller>
	formatText TextName = players_in_game_text qs(0x5d9eae64) g = <players_in_game>
	formatText TextName = party_text qs(0x5d9eae64) g = <party_text>
	formatText TextName = game_session_text qs(0x5d9eae64) g = <game_session_text>
	if ScreenElementExists \{id = debug_overlay}
		debug_overlay :se_setprops {
			game_mode_text = <game_mode_text>
			competitive_rules_text = <competitive_rules_text>
			leader_text = <leader_text>
			net_leader_text = <net_leader_text>
			primary_controller_text = <primary_controller_text>
			players_in_game_text = <players_in_game_text>
			party_text = <party_text>
			game_session_text = <game_session_text>
		}
	endif
endscript

net_attack_pending = 0

script net_battle_attempt_powerup 
	player_status = player1_status
	if (($<player_status>.current_num_powerups <= 0) || ($net_attack_pending = 1) || ($disable_attacks = 1))
		return
	endif
	Change \{net_attack_pending = 1}
	formatText checksumName = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.Player)
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	update_battlecards_remove player_status = <player_status>
	SendNetMessage {
		Type = battle_attempt_powerup
		select = <select>
	}
endscript

script net_battle_steal_trigger 
	if ($disable_attacks)
		printf \{"---ignoring attack, I've already lost"}
		return
	endif
	<player_status> = player2_status
	<player_current_num_powerups> = ($<player_status>.current_num_powerups)
	<other_player_status> = player1_status
	<other_player_text> = ($<other_player_status>.text)
	<other_player_current_num_powerups> = ($<other_player_status>.current_num_powerups)
	do_steal = 0
	if ($<other_player_status>.current_num_powerups = 0)
		SendNetMessage \{Type = battle_steal_ack
			select = 255}
	else
		select = ($current_powerups_p1 [($<other_player_status>.current_num_powerups - 1)])
		Change structurename = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		SendNetMessage {Type = battle_steal_ack select = <select>}
		<do_steal> = 1
	endif
	formatText checksumName = card_checksum 'battlecard_%i_%s' i = (($<player_status>.current_num_powerups) - 1) s = ($<player_status>.Player)
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	update_battlecards_remove player_status = <player_status>
	Change structurename = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_member) Type = 3
	Band_PlayResponseAnim Name = ($<other_player_status>.band_member) Type = 3
	Change structurename = <player_status> final_blow_powerup = 3
	if ($<player_status>.highway_layout = solo_highway)
		SpawnScriptNow hammer_rock_meter params = {other_player_text = <other_player_text>}
	else
		SpawnScriptNow hammer_highway params = {other_player_text = <other_player_text>}
	endif
	if (<do_steal> = 1)
		net_battle_steal {other_player_status = <other_player_status>
			other_player_current_num_powerups = <other_player_current_num_powerups>
			player_status = <player_status>
			select = <select>}
	endif
endscript

script net_battle_execute_steal 
	if ($disable_attacks)
		printf \{"---ignoring attack, I've already lost"}
		return
	endif
	other_player_current_num_powerups = ($<other_player_status>.current_num_powerups)
	if (<select> = 255)
	else
		Change structurename = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
	endif
	if ($<other_player_status>.current_num_powerups < 0)
		Change structurename = <other_player_status> current_num_powerups = 0
	endif
	net_battle_steal {other_player_status = <other_player_status>
		other_player_current_num_powerups = <other_player_current_num_powerups>
		player_status = <player_status>
		select = <select>}
	Change \{net_attack_pending = 0}
endscript

script net_battle_steal 
	if ($disable_attacks)
		printf \{"---ignoring attack, I've already lost"}
		return
	endif
	if ($<other_player_status>.Player = 1)
		spawnscript \{GH_BattleMode_Player1_SFX_Steal
			params = {
				holdtime = 1.0
			}
			id = battlemode}
		morph_to_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		start_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		spawnscript \{GH_BattleMode_Player2_SFX_Steal
			params = {
				holdtime = 1.0
			}
			id = battlemode}
		morph_to_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		start_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	if ($<other_player_status>.Player = 1)
		hand_scale = (-1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (-40.0, 0.0)
	else
		hand_scale = (1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (40.0, 0.0)
	endif
	Change structurename = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup + 1)
	SpawnScriptNow animate_open_hand params = {start_pos = <start_pos>
		morph_to_pos = <morph_to_pos>
		player_status = <player_status>
		other_player_status = <other_player_status>
		hand_x_offset = <hand_x_offset>
		hand_y_offset = <hand_y_offset>
		hand_scale = <hand_scale>}
	if NOT (<select> = 255)
		formatText checksumName = card_checksum 'battlecard_%i_%s' i = (<other_player_current_num_powerups> - 1) s = ($<other_player_status>.Player)
		if ScreenElementExists id = <card_checksum>
			DestroyScreenElement id = <card_checksum>
		endif
		update_battlecards_remove player_status = <other_player_status>
		SpawnScriptNow animate_stealing_hand params = {start_pos = <start_pos>
			morph_to_pos = <morph_to_pos>
			player_status = <player_status>
			other_player_status = <other_player_status>
			hand_x_offset = <hand_x_offset>
			hand_y_offset = <hand_y_offset>
			hand_scale = <hand_scale>
			select = <select>}
		battlemode_ready player_status = <player_status> battle_gem = <select> steal = 1
	endif
	Change structurename = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup - 1)
endscript

script animate_open_hand 
	formatText checksumName = steal_hand_open_checksum 'steal_hand_open_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.Player)
	if ScreenElementExists id = <steal_hand_open_checksum>
		DestroyScreenElement id = <steal_hand_open_checksum>
	endif
	formatText checksumName = steal_hand_checksum 'steal_hand_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.Player)
	Wait \{1
		gameframe}
	if NOT (ScreenElementExists id = battlemode_container)
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <steal_hand_open_checksum>
		parent = battlemode_container
		texture = battle_hud_steal_hand_open
		rgba = [255 255 255 255]
		Pos = (<morph_to_pos> + <hand_y_offset>)
		Scale = <hand_scale>
		alpha = 0
		just = [center center]
		z_priority = 25
	}
	DoScreenElementMorph {
		id = <steal_hand_open_checksum>
		Pos = (<start_pos> + <hand_y_offset> - <hand_x_offset>)
		alpha = 1
		time = 0.5
	}
	Wait \{0.5
		Seconds}
	if ScreenElementExists id = <steal_hand_open_checksum>
		DestroyScreenElement id = <steal_hand_open_checksum>
	endif
endscript

script animate_stealing_hand 
	Wait \{0.5
		Seconds}
	GetSongTimeMs
	formatText checksumName = held_card_checksum 'held_battlecard_%i_%s_%t' i = ($<other_player_status>.current_num_powerups - 1) s = ($<other_player_status>.Player) t = <time>
	formatText checksumName = steal_hand_checksum 'steal_hand_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.Player)
	if NOT (ScreenElementExists id = battlemode_container)
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <held_card_checksum>
		parent = battlemode_container
		texture = ($battlemode_powerups [<select>].card_texture)
		rgba = [255 255 255 255]
		Pos = <start_pos>
		dims = (64.0, 64.0)
		just = [center center]
		z_priority = (($battle_hud_2d_elements.z) + 19)
	}
	DoScreenElementMorph {
		id = <held_card_checksum>
		Pos = <morph_to_pos>
		time = 0.5
	}
	if ScreenElementExists id = <steal_hand_checksum>
		DestroyScreenElement id = <steal_hand_checksum>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <steal_hand_checksum>
		parent = battlemode_container
		texture = battle_hud_steal_hand
		rgba = [255 255 255 255]
		Pos = (<start_pos> + <hand_y_offset> - <hand_x_offset>)
		Scale = <hand_scale>
		alpha = 1
		just = [center center]
		z_priority = 25
	}
	DoScreenElementMorph {
		id = <steal_hand_checksum>
		texture = battle_hud_steal_hand
		Pos = (<morph_to_pos> + <hand_y_offset> - <hand_x_offset>)
		time = 0.5
	}
	Wait \{0.4
		Seconds}
	if ScreenElementExists
		DoScreenElementMorph {
			id = <steal_hand_checksum>
			alpha = 0
			time = 0.1
		}
	endif
	Wait \{0.1
		Seconds}
	if ScreenElementExists id = <held_card_checksum>
		DestroyScreenElement id = <held_card_checksum>
	endif
	if ScreenElementExists id = <steal_hand_checksum>
		DestroyScreenElement id = <steal_hand_checksum>
	endif
endscript

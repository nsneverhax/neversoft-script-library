net_attack_pending = 0
BATTLE_STEAL_INDEX = 3
BATTLE_BREAK_STRING_INDEX = 5

script net_battle_attempt_powerup 
	<player_status> = player1_status
	<other_player_status> = player2_status
	<other_player_difficulty> = ($<other_player_status>.difficulty)
	if (($<player_status>.current_num_powerups <= 0) || ($net_attack_pending = 1) || ($disable_attacks = 1))
		return
	endif
	Change \{net_attack_pending = 1}
	Change structurename = <player_status> final_blow_powerup = <select>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	switch <other_player_difficulty>
		case easy
		<drain_time> = (<drain_time> + $battle_easy_drain_offset)
		case medium
		<drain_time> = (<drain_time> + $battle_medium_drain_offset)
		case hard
		<drain_time> = (<drain_time> + $battle_hard_drain_offset)
		case expert
		<drain_time> = (<drain_time> + $battle_expert_drain_offset)
	endswitch
	<drain_time> = (<drain_time> * $battle_do_or_die_attack_scale)
	CastToInteger \{drain_time}
	if ($<player_status>.Player = 1)
		card_checksum = ($current_battlecard_p1 [($<player_status>.current_num_powerups - 1)])
	else
		card_checksum = ($current_battlecard_p2 [($<player_status>.current_num_powerups - 1)])
	endif
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	printf qs(0x5b2fa6da) n = ($<player_status>.Player) a = ($<player_status>.current_num_powerups)
	update_battlecards_remove player_status = <player_status>
	if (<select> = $BATTLE_BREAK_STRING_INDEX)
		SpawnScriptNow attack_bolt id = battlemode params = {player_status = <player_status> other_player_status = <other_player_status>}
		net_choose_and_break_p2_string {
			player_status = <player_status>
			other_player_status = <other_player_status>
			difficulty = <other_player_difficulty>
			drain_time = <drain_time>
		}
		select2 = <string_to_break>
		Change \{net_attack_pending = 0}
	endif
	SendNetMessage {
		Type = battle_attempt_powerup
		select = <select>
		select2 = <select2>
	}
endscript

script net_battle_steal_trigger 
	<player_status> = player2_status
	<player_current_num_powerups> = ($<player_status>.current_num_powerups)
	<other_player_status> = player1_status
	<other_player_text> = ($<other_player_status>.text)
	<other_player_current_num_powerups> = ($<other_player_status>.current_num_powerups)
	if (($disable_attacks) || (($<player_status>.current_num_powerups) <= 0))
		printf \{qs(0x857b2d24)}
		return
	endif
	do_steal = 0
	if ($<other_player_status>.current_num_powerups = 0)
		SendNetMessage \{Type = battle_steal_ack
			select = 255}
	else
		select = ($current_powerups_p1 [($<other_player_status>.current_num_powerups - 1)])
		Change structurename = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		printf qs(0xd5a3a5d8) n = ($<other_player_status>.Player) a = ($<other_player_status>.current_num_powerups)
		SendNetMessage {Type = battle_steal_ack select = <select>}
		<do_steal> = 1
	endif
	if ($<player_status>.Player = 1)
		card_checksum = ($current_battlecard_p1 [($<player_status>.current_num_powerups - 1)])
	else
		card_checksum = ($current_battlecard_p2 [($<player_status>.current_num_powerups - 1)])
	endif
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	printf qs(0xf1c5d592) n = ($<player_status>.Player) a = ($<player_status>.current_num_powerups)
	update_battlecards_remove player_status = <player_status>
	Change structurename = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_member) Type = 3
	Band_PlayResponseAnim Name = ($<other_player_status>.band_member) Type = 3
	Change structurename = <player_status> final_blow_powerup = 3
	if ($<player_status>.highway_layout = solo_highway)
		SpawnScriptNow hammer_rock_meter id = battlemode params = {other_player_text = <other_player_text>}
	else
		SpawnScriptNow hammer_highway id = battlemode params = {other_player_text = <other_player_text>}
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
		printf \{qs(0x81b62feb)}
		return
	endif
	other_player_current_num_powerups = ($<other_player_status>.current_num_powerups)
	if (<select> = 255)
	else
		Change structurename = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		printf qs(0xde6f08a8) n = ($<other_player_status>.Player) a = ($<other_player_status>.current_num_powerups)
	endif
	if ($<other_player_status>.current_num_powerups < 0)
		printf qs(0xdd5339fc) d = ($<other_player_status>.Player)
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
		printf \{qs(0x81b62feb)}
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
	SpawnScriptNow animate_open_hand id = battlemode params = {start_pos = <start_pos>
		morph_to_pos = <morph_to_pos>
		player_status = <player_status>
		other_player_status = <other_player_status>
		hand_x_offset = <hand_x_offset>
		hand_y_offset = <hand_y_offset>
		hand_scale = <hand_scale>}
	if NOT (<select> = 255)
		if ($<other_player_status>.Player = 1)
			card_checksum = ($current_battlecard_p1 [(<other_player_current_num_powerups> - 1)])
		else
			card_checksum = ($current_battlecard_p2 [(<other_player_current_num_powerups> - 1)])
		endif
		if ScreenElementExists id = <card_checksum>
			DestroyScreenElement id = <card_checksum>
		endif
		update_battlecards_remove player_status = <other_player_status>
		SpawnScriptNow animate_stealing_hand id = battlemode params = {start_pos = <start_pos>
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
	legacydoscreenelementmorph {
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
	legacydoscreenelementmorph {
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
	legacydoscreenelementmorph {
		id = <steal_hand_checksum>
		texture = battle_hud_steal_hand
		Pos = (<morph_to_pos> + <hand_y_offset> - <hand_x_offset>)
		time = 0.5
	}
	Wait \{0.4
		Seconds}
	if ScreenElementExists
		legacydoscreenelementmorph {
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

script net_choose_and_break_p2_string 
	repair_ammount = 5
	switch <difficulty>
		case easy
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].easy_repair)
		case medium
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].medium_repair)
		case hard
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].hard_repair)
		case expert
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].expert_repair)
	endswitch
	<repair_ammount> = (<repair_ammount> * $battle_do_or_die_attack_scale)
	CastToInteger \{repair_ammount}
	spawnscript GH_BattleMode_Player2_SFX_BrokenString_Start params = {holdtime = <drain_time>} id = battlemode
	if (<difficulty> = easy)
		highest_value = 3
	elseif (<difficulty> = medium)
		highest_value = 4
	else
		highest_value = 5
	endif
	GetArraySize \{$gem_colors}
	gem_color = 0
	non_broken_index = 0
	non_broken_strings = [-1 -1 -1 -1 -1]
	begin
	switch <gem_color>
		case 0
		if ($<other_player_status>.broken_string_green = 0)
			SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 1
		if ($<other_player_status>.broken_string_red = 0)
			SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 2
		if ($<other_player_status>.broken_string_yellow = 0)
			SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 3
		if ($<other_player_status>.broken_string_blue = 0)
			SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 4
		if ($<other_player_status>.broken_string_orange = 0)
			SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
	endswitch
	<gem_color> = (<gem_color> + 1)
	repeat <highest_value>
	if (<non_broken_index> = 0)
		GetRandomValue Name = X a = 1 b = <highest_value> integer
	else
		GetRandomValue Name = random_index a = 0 b = (<non_broken_index> - 1) integer
		X = ((<non_broken_strings> [<random_index>]) + 1)
	endif
	num_hammers = <repair_ammount>
	switch <X>
		case 1
		Change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green + <num_hammers>)
		mask = 65536
		case 2
		Change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red + <num_hammers>)
		mask = 4096
		case 3
		Change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow + <num_hammers>)
		mask = 256
		case 4
		Change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue + <num_hammers>)
		mask = 16
		case 5
		Change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange + <num_hammers>)
		mask = 1
	endswitch
	SpawnScriptNow break_string params = {id = (<X> - 1) other_player_status = <other_player_status>} id = battlemode
	SpawnScriptNow update_broken_button params = {id = (<X> - 1) other_player_status = <other_player_status>} id = battlemode
	update_broken_string_arrows id = (<X> - 1) other_player_status = <other_player_status>
	Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
	return string_to_break = <X>
endscript

script net_break_p1_string 
	select = $BATTLE_BREAK_STRING_INDEX
	player_status = player2_status
	string_to_break = <string_to_break>
	SpawnScriptNow net_battle_trigger params = {<...>} id = battlemode
endscript

script net_battle_trigger 
	if (($disable_attacks) || ($<player_status>.current_num_powerups <= 0))
		printf \{qs(0xde82eaf3)}
		return
	endif
	<player_status> = player2_status
	<other_player> = 1
	<other_player_text> = 'p1'
	<other_difficulty> = ($player1_status.difficulty)
	<other_player_status> = player1_status
	if ($<player_status>.Player = 1)
		card_checksum = ($current_battlecard_p1 [($<player_status>.current_num_powerups - 1)])
	else
		card_checksum = ($current_battlecard_p2 [($<player_status>.current_num_powerups - 1)])
	endif
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	printf qs(0xc12f0697) n = ($<player_status>.Player) a = ($<player_status>.current_num_powerups)
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	switch <other_player_difficulty>
		case easy
		<drain_time> = (<drain_time> + $battle_easy_drain_offset)
		case medium
		<drain_time> = (<drain_time> + $battle_medium_drain_offset)
		case hard
		<drain_time> = (<drain_time> + $battle_hard_drain_offset)
		case expert
		<drain_time> = (<drain_time> + $battle_expert_drain_offset)
	endswitch
	<drain_time> = (<drain_time> * $battle_do_or_die_attack_scale)
	CastToInteger \{drain_time}
	Change structurename = <player_status> final_blow_powerup = <select>
	if (<select> = $BATTLE_BREAK_STRING_INDEX)
		SpawnScriptNow battle_broken_string id = battlemode params = {drain_time = <drain_time>
			Player = <other_player>
			player_text = <other_player_text>
			other_player_status = <other_player_status>
			player_status = <player_status>
			difficulty = <other_difficulty>
			string_to_break = <string_to_break>
			($battlemode_powerups [<select>].params)}
	else
		SpawnScriptNow ($battlemode_powerups [<select>].Scr) id = battlemode params = {drain_time = <drain_time>
			Player = <other_player>
			player_text = <other_player_text>
			other_player_status = <other_player_status>
			player_status = <player_status>
			difficulty = <other_difficulty>
			($battlemode_powerups [<select>].params)}
	endif
	Change structurename = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_member) Type = <select>
	Band_PlayResponseAnim Name = ($<other_player_status>.band_member) Type = <select>
	if ($battlemode_powerups [<select>].fire_bolt = 1)
		SpawnScriptNow attack_bolt id = battlemode params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript

script broadcast_whammy_attack_update 
	Change structurename = <other_player_status> whammy_attack = <whammy_attack>
	broadcastevent \{Type = whammy_attack_update}
endscript

script net_repair_client_string 
	check_button = 65536
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	broken_string_id = ($broken_strings [<array_count>])
	if (<check_button> && <flags>)
		if NOT ($<other_player_status>.<broken_string_id> = 0)
			switch (<array_count>)
				case 0
				Change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green - 1)
				mask = 4369
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_green) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
				if ($<other_player_status>.broken_string_green = 0)
					repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
				endif
				case 1
				Change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red - 1)
				mask = 65809
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_red) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
				if ($<other_player_status>.broken_string_red = 0)
					repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
				endif
				case 2
				Change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow - 1)
				mask = 69649
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_yellow) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
				if ($<other_player_status>.broken_string_yellow = 0)
					repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
				endif
				case 3
				Change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue - 1)
				mask = 69889
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_blue) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
				if ($<other_player_status>.broken_string_blue = 0)
					repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
				endif
				case 4
				Change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange - 1)
				mask = 69904
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_orange) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
				if ($<other_player_status>.broken_string_orange = 0)
					repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
				endif
			endswitch
			if ($<other_player_status>.<broken_string_id> = 0)
				if ($<other_player_status>.whammy_attack < 1)
					Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				endif
			endif
		endif
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	total_broken_strings = ($<other_player_status>.broken_string_green +
		$<other_player_status>.broken_string_red +
		$<other_player_status>.broken_string_yellow +
		$<other_player_status>.broken_string_blue +
		$<other_player_status>.broken_string_orange)
	if (<total_broken_strings> = 0)
		Change structurename = <other_player_status> broken_string_mask = 0
		GuitarEvent_BattleAttackFinished \{Player = 2}
	endif
endscript

script net_whammy_attack 
	shake_frequency = 1
	begin
	if (($<other_player_status>.whammy_attack) <= 5)
		<shake_frequency> = (6 - ($<other_player_status>.whammy_attack))
	endif
	GH3_Battle_Play_Whammy_Pitch_Up_Sound <...>
	Block \{Type = whammy_attack_update}
	if (($<other_player_status>.whammy_attack) = 0)
		break
	endif
	repeat
endscript

script net_whammy_shake 
	shake_on = 0
	frame_count = 0
	begin
	if (<frame_count> = <shake_frequency>)
		if (<shake_on> = 0)
			<markers_name> :Obj_GetPosition
			<markers_name> :Obj_SetPosition position = (<Pos> + (0.0, 0.05, 0.0))
			<shake_on> = 1
		else
			<markers_name> :Obj_GetPosition
			<markers_name> :Obj_SetPosition position = (<Pos> + (0.0, -0.05, 0.0))
			<shake_on> = 0
		endif
		<frame_count> = 0
	else
		<frame_count> = (<frame_count> + 1)
	endif
	Wait \{1
		gameframe}
	repeat
endscript

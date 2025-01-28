net_attack_pending = 0
BATTLE_STEAL_INDEX = 3
BATTLE_BREAK_STRING_INDEX = 5

script net_battle_attempt_powerup 
	<player_status> = player1_status
	<other_player_status> = player2_status
	<other_player_difficulty> = $current_difficulty2
	if (($<player_status>.current_num_powerups <= 0) || ($net_attack_pending = 1) || ($disable_attacks = 1))
		return
	endif
	Change \{net_attack_pending = 1}
	Change StructureName = <player_status> final_blow_powerup = <SELECT>
	drain_time = ($battlemode_powerups [<SELECT>].drain_time)
	switch <other_player_difficulty>
		case EASY
		<drain_time> = (<drain_time> + $battle_easy_drain_offset)
		case MEDIUM
		<drain_time> = (<drain_time> + $battle_medium_drain_offset)
		case HARD
		<drain_time> = (<drain_time> + $battle_hard_drain_offset)
		case EXPERT
		<drain_time> = (<drain_time> + $battle_expert_drain_offset)
	endswitch
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<player_status>.current_num_powerups - 1) S = ($<player_status>.Player)
	if ScreenElementExists Id = <card_checksum>
		DestroyScreenElement Id = <card_checksum>
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	Printf "net_battle_attempt_powerup - decremented p%n's current_num_powerups to %a" N = ($<player_status>.Player) A = ($<player_status>.current_num_powerups)
	update_battlecards_remove player_status = <player_status>
	if (<SELECT> = $BATTLE_BREAK_STRING_INDEX)
		SpawnScriptNow attack_bolt Id = battlemode Params = {player_status = <player_status> other_player_status = <other_player_status>}
		net_choose_and_break_p2_string {
			player_status = <player_status>
			other_player_status = <other_player_status>
			DIFFICULTY = <other_player_difficulty>
			drain_time = <drain_time>
		}
		select2 = <string_to_break>
		Change \{net_attack_pending = 0}
	endif
	SendNetMessage {
		Type = battle_attempt_powerup
		SELECT = <SELECT>
		select2 = <select2>
	}
endscript

script net_battle_steal_trigger 
	<player_status> = player2_status
	<player_current_num_powerups> = ($<player_status>.current_num_powerups)
	<other_player_status> = player1_status
	<other_player_text> = ($<other_player_status>.Text)
	<other_player_current_num_powerups> = ($<other_player_status>.current_num_powerups)
	if (($disable_attacks) || (($<player_status>.current_num_powerups) <= 0))
		Printf \{"---ignoring steal attack... either match over or p2 has no powerups to use"}
		return
	endif
	do_steal = 0
	if ($<other_player_status>.current_num_powerups = 0)
		SendNetMessage \{Type = battle_steal_ack
			SELECT = 255}
	else
		SELECT = ($current_powerups_p1 [($<other_player_status>.current_num_powerups - 1)])
		Change StructureName = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		Printf "net_battle_steal_trigger(steal from me) - decremented p%n's current_num_powerups to %a" N = ($<other_player_status>.Player) A = ($<other_player_status>.current_num_powerups)
		SendNetMessage {Type = battle_steal_ack SELECT = <SELECT>}
		<do_steal> = 1
	endif
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = (($<player_status>.current_num_powerups) - 1) S = ($<player_status>.Player)
	if ScreenElementExists Id = <card_checksum>
		DestroyScreenElement Id = <card_checksum>
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	Printf "net_battle_steal_trigger(destroy his steal card) - decremented p%n's current_num_powerups to %a" N = ($<player_status>.Player) A = ($<player_status>.current_num_powerups)
	update_battlecards_remove player_status = <player_status>
	Change StructureName = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_Member) Type = 3
	Band_PlayResponseAnim Name = ($<other_player_status>.band_Member) Type = 3
	Change StructureName = <player_status> final_blow_powerup = 3
	if ($<player_status>.highway_layout = solo_highway)
		SpawnScriptNow hammer_rock_meter Id = battlemode Params = {other_player_text = <other_player_text>}
	else
		SpawnScriptNow hammer_highway Id = battlemode Params = {other_player_text = <other_player_text>}
	endif
	if (<do_steal> = 1)
		net_battle_steal {other_player_status = <other_player_status>
			other_player_current_num_powerups = <other_player_current_num_powerups>
			player_status = <player_status>
			SELECT = <SELECT>}
	endif
endscript

script net_battle_execute_steal 
	if ($disable_attacks)
		Printf \{"---ignoring attack, I've already lost"}
		return
	endif
	other_player_current_num_powerups = ($<other_player_status>.current_num_powerups)
	if (<SELECT> = 255)
	else
		Change StructureName = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		Printf "net_battle_execute_steal - decremented p%n's current_num_powerups to %a" N = ($<other_player_status>.Player) A = ($<other_player_status>.current_num_powerups)
	endif
	if ($<other_player_status>.current_num_powerups < 0)
		Printf "Trying to set num powerups below zero in steal, resetting to 0 for p%d" D = ($<other_player_status>.Player)
		Change StructureName = <other_player_status> current_num_powerups = 0
	endif
	net_battle_steal {other_player_status = <other_player_status>
		other_player_current_num_powerups = <other_player_current_num_powerups>
		player_status = <player_status>
		SELECT = <SELECT>}
	Change \{net_attack_pending = 0}
endscript

script net_battle_steal 
	if ($disable_attacks)
		Printf \{"---ignoring attack, I've already lost"}
		return
	endif
	if ($<other_player_status>.Player = 1)
		SpawnScript \{GH_BattleMode_Player1_SFX_Steal
			Params = {
				holdtime = 1.0
			}
			Id = battlemode}
		morph_to_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		start_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		SpawnScript \{GH_BattleMode_Player2_SFX_Steal
			Params = {
				holdtime = 1.0
			}
			Id = battlemode}
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
	Change StructureName = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup + 1)
	SpawnScriptNow animate_open_hand Id = battlemode Params = {start_pos = <start_pos>
		morph_to_pos = <morph_to_pos>
		player_status = <player_status>
		other_player_status = <other_player_status>
		hand_x_offset = <hand_x_offset>
		hand_y_offset = <hand_y_offset>
		hand_scale = <hand_scale>}
	if NOT (<SELECT> = 255)
		FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = (<other_player_current_num_powerups> - 1) S = ($<other_player_status>.Player)
		if ScreenElementExists Id = <card_checksum>
			DestroyScreenElement Id = <card_checksum>
		endif
		update_battlecards_remove player_status = <other_player_status>
		SpawnScriptNow animate_stealing_hand Id = battlemode Params = {start_pos = <start_pos>
			morph_to_pos = <morph_to_pos>
			player_status = <player_status>
			other_player_status = <other_player_status>
			hand_x_offset = <hand_x_offset>
			hand_y_offset = <hand_y_offset>
			hand_scale = <hand_scale>
			SELECT = <SELECT>}
		battlemode_ready player_status = <player_status> battle_gem = <SELECT> steal = 1
	endif
	Change StructureName = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup - 1)
endscript

script animate_open_hand 
	FormatText ChecksumName = steal_hand_open_checksum 'steal_hand_open_%i_%p' I = ($<other_player_status>.stealing_powerup) P = ($<other_player_status>.Player)
	if ScreenElementExists Id = <steal_hand_open_checksum>
		DestroyScreenElement Id = <steal_hand_open_checksum>
	endif
	FormatText ChecksumName = steal_hand_checksum 'steal_hand_%i_%p' I = ($<other_player_status>.stealing_powerup) P = ($<other_player_status>.Player)
	Wait \{1
		GameFrame}
	if NOT (ScreenElementExists Id = battlemode_container)
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <steal_hand_open_checksum>
		PARENT = battlemode_container
		texture = battle_hud_steal_hand_open
		rgba = [255 255 255 255]
		Pos = (<morph_to_pos> + <hand_y_offset>)
		Scale = <hand_scale>
		Alpha = 0
		just = [Center Center]
		z_priority = 25
	}
	DoScreenElementMorph {
		Id = <steal_hand_open_checksum>
		Pos = (<start_pos> + <hand_y_offset> - <hand_x_offset>)
		Alpha = 1
		Time = 0.5
	}
	Wait \{0.5
		Seconds}
	if ScreenElementExists Id = <steal_hand_open_checksum>
		DestroyScreenElement Id = <steal_hand_open_checksum>
	endif
endscript

script animate_stealing_hand 
	Wait \{0.5
		Seconds}
	GetSongTimeMS
	FormatText ChecksumName = held_card_checksum 'held_battlecard_%i_%s_%t' I = ($<other_player_status>.current_num_powerups - 1) S = ($<other_player_status>.Player) T = <Time>
	FormatText ChecksumName = steal_hand_checksum 'steal_hand_%i_%p' I = ($<other_player_status>.stealing_powerup) P = ($<other_player_status>.Player)
	if NOT (ScreenElementExists Id = battlemode_container)
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <held_card_checksum>
		PARENT = battlemode_container
		texture = ($battlemode_powerups [<SELECT>].card_texture)
		rgba = [255 255 255 255]
		Pos = <start_pos>
		Dims = (64.0, 64.0)
		just = [Center Center]
		z_priority = (($battle_hud_2d_elements.Z) + 19)
	}
	DoScreenElementMorph {
		Id = <held_card_checksum>
		Pos = <morph_to_pos>
		Time = 0.5
	}
	if ScreenElementExists Id = <steal_hand_checksum>
		DestroyScreenElement Id = <steal_hand_checksum>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <steal_hand_checksum>
		PARENT = battlemode_container
		texture = battle_hud_steal_hand
		rgba = [255 255 255 255]
		Pos = (<start_pos> + <hand_y_offset> - <hand_x_offset>)
		Scale = <hand_scale>
		Alpha = 1
		just = [Center Center]
		z_priority = 25
	}
	DoScreenElementMorph {
		Id = <steal_hand_checksum>
		texture = battle_hud_steal_hand
		Pos = (<morph_to_pos> + <hand_y_offset> - <hand_x_offset>)
		Time = 0.5
	}
	Wait \{0.4
		Seconds}
	if ScreenElementExists
		DoScreenElementMorph {
			Id = <steal_hand_checksum>
			Alpha = 0
			Time = 0.1
		}
	endif
	Wait \{0.1
		Seconds}
	if ScreenElementExists Id = <held_card_checksum>
		DestroyScreenElement Id = <held_card_checksum>
	endif
	if ScreenElementExists Id = <steal_hand_checksum>
		DestroyScreenElement Id = <steal_hand_checksum>
	endif
endscript

script net_choose_and_break_p2_string 
	repair_ammount = 5
	switch <DIFFICULTY>
		case EASY
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].easy_repair)
		case MEDIUM
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].medium_repair)
		case HARD
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].hard_repair)
		case EXPERT
		<repair_ammount> = ($battlemode_powerups [$BATTLE_BREAK_STRING_INDEX].expert_repair)
	endswitch
	SpawnScript GH_BattleMode_Player2_SFX_BrokenString_Start Params = {holdtime = <drain_time>} Id = battlemode
	if (<DIFFICULTY> = EASY)
		highest_value = 3
	elseif (<DIFFICULTY> = MEDIUM)
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
			SetArrayElement ArrayName = non_broken_strings Index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 1
		if ($<other_player_status>.broken_string_red = 0)
			SetArrayElement ArrayName = non_broken_strings Index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 2
		if ($<other_player_status>.broken_string_yellow = 0)
			SetArrayElement ArrayName = non_broken_strings Index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 3
		if ($<other_player_status>.broken_string_blue = 0)
			SetArrayElement ArrayName = non_broken_strings Index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
		case 4
		if ($<other_player_status>.broken_string_orange = 0)
			SetArrayElement ArrayName = non_broken_strings Index = <non_broken_index> NewValue = <gem_color>
			<non_broken_index> = (<non_broken_index> + 1)
		endif
	endswitch
	<gem_color> = (<gem_color> + 1)
	repeat <highest_value>
	if (<non_broken_index> = 0)
		GetRandomValue Name = X A = 1 B = <highest_value> Integer
	else
		GetRandomValue Name = random_index A = 0 B = (<non_broken_index> - 1) Integer
		X = ((<non_broken_strings> [<random_index>]) + 1)
	endif
	num_hammers = <repair_ammount>
	switch <X>
		case 1
		Change StructureName = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green + <num_hammers>)
		mask = 65536
		case 2
		Change StructureName = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red + <num_hammers>)
		mask = 4096
		case 3
		Change StructureName = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow + <num_hammers>)
		mask = 256
		case 4
		Change StructureName = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue + <num_hammers>)
		mask = 16
		case 5
		Change StructureName = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange + <num_hammers>)
		mask = 1
	endswitch
	SpawnScriptNow break_string Params = {Id = (<X> - 1) other_player_status = <other_player_status>} Id = battlemode
	SpawnScriptNow update_broken_button Params = {Id = (<X> - 1) other_player_status = <other_player_status>} Id = battlemode
	update_broken_string_arrows Id = (<X> - 1) other_player_status = <other_player_status>
	Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
	return string_to_break = <X>
endscript

script net_break_p1_string 
	SELECT = $BATTLE_BREAK_STRING_INDEX
	player_status = player2_status
	string_to_break = <string_to_break>
	SpawnScriptNow net_battle_trigger Params = {<...>} Id = battlemode
endscript

script net_battle_trigger 
	if (($disable_attacks) || ($<player_status>.current_num_powerups <= 0))
		Printf \{"---ignoring their attack, they have no powerups to use"}
		return
	endif
	<player_status> = player2_status
	<other_player> = 1
	<other_player_text> = 'p1'
	<other_difficulty> = $current_difficulty
	<other_player_status> = player1_status
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<player_status>.current_num_powerups - 1) S = ($<player_status>.Player)
	if ScreenElementExists Id = <card_checksum>
		DestroyScreenElement Id = <card_checksum>
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	Printf "net_battle_trigger - decremented p%n's current_num_powerups to %a" N = ($<player_status>.Player) A = ($<player_status>.current_num_powerups)
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<SELECT>].drain_time)
	switch <other_player_difficulty>
		case EASY
		<drain_time> = (<drain_time> + $battle_easy_drain_offset)
		case MEDIUM
		<drain_time> = (<drain_time> + $battle_medium_drain_offset)
		case HARD
		<drain_time> = (<drain_time> + $battle_hard_drain_offset)
		case EXPERT
		<drain_time> = (<drain_time> + $battle_expert_drain_offset)
	endswitch
	Change StructureName = <player_status> final_blow_powerup = <SELECT>
	if (<SELECT> = $BATTLE_BREAK_STRING_INDEX)
		SpawnScriptNow battle_broken_string Id = battlemode Params = {drain_time = <drain_time>
			Player = <other_player>
			player_Text = <other_player_text>
			other_player_status = <other_player_status>
			player_status = <player_status>
			DIFFICULTY = <other_difficulty>
			string_to_break = <string_to_break>
			($battlemode_powerups [<SELECT>].Params)}
	else
		SpawnScriptNow ($battlemode_powerups [<SELECT>].Scr) Id = battlemode Params = {drain_time = <drain_time>
			Player = <other_player>
			player_Text = <other_player_text>
			other_player_status = <other_player_status>
			player_status = <player_status>
			DIFFICULTY = <other_difficulty>
			($battlemode_powerups [<SELECT>].Params)}
	endif
	Change StructureName = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_Member) Type = <SELECT>
	Band_PlayResponseAnim Name = ($<other_player_status>.band_Member) Type = <SELECT>
	if ($battlemode_powerups [<SELECT>].fire_bolt = 1)
		SpawnScriptNow attack_bolt Id = battlemode Params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript

script broadcast_whammy_attack_update 
	Change StructureName = <other_player_status> whammy_attack = <whammy_attack>
	BroadCastEvent \{Type = whammy_attack_update}
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
				Change StructureName = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green - 1)
				mask = 4369
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_green) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
				if ($<other_player_status>.broken_string_green = 0)
					repair_string other_player_status = <other_player_status> Id = <array_count>
				endif
				case 1
				Change StructureName = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red - 1)
				mask = 65809
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_red) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
				if ($<other_player_status>.broken_string_red = 0)
					repair_string other_player_status = <other_player_status> Id = <array_count>
				endif
				case 2
				Change StructureName = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow - 1)
				mask = 69649
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_yellow) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
				if ($<other_player_status>.broken_string_yellow = 0)
					repair_string other_player_status = <other_player_status> Id = <array_count>
				endif
				case 3
				Change StructureName = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue - 1)
				mask = 69889
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_blue) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
				if ($<other_player_status>.broken_string_blue = 0)
					repair_string other_player_status = <other_player_status> Id = <array_count>
				endif
				case 4
				Change StructureName = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange - 1)
				mask = 69904
				Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_orange) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
				if ($<other_player_status>.broken_string_orange = 0)
					repair_string other_player_status = <other_player_status> Id = <array_count>
				endif
			endswitch
			if ($<other_player_status>.<broken_string_id> = 0)
				if ($<other_player_status>.whammy_attack < 1)
					Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
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
		Change StructureName = <other_player_status> broken_string_mask = 0
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
			<markers_name> :Obj_SetPosition Position = (<Pos> + (0.0, 0.05, 0.0))
			<shake_on> = 1
		else
			<markers_name> :Obj_GetPosition
			<markers_name> :Obj_SetPosition Position = (<Pos> + (0.0, -0.05, 0.0))
			<shake_on> = 0
		endif
		<frame_count> = 0
	else
		<frame_count> = (<frame_count> + 1)
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

battle_easy_drain_offset = 0
battle_medium_drain_offset = 1500
battle_hard_drain_offset = 3000
battle_expert_drain_offset = 4500
disable_attacks = 0
battlemode_powerups = [
	{
		Name = Lightning
		name_text = "Amp Overload"
		Weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_lightning
		Params = {
		}
		card_texture = icon_attack_blast
		easy_flicker = 2
		medium_flicker = 2
		hard_flicker = 3
		expert_flicker = 3
		drain_time = 7500
		IMMEDIATE = 1
		fire_bolt = 1
	}
	{
		Name = DifficultyUp
		name_text = "Difficulty Up"
		Weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_up_difficulty
		Params = {
		}
		card_texture = icon_attack_difficulty
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = DoubleNotes
		name_text = "Double Notes"
		Weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_double_notes
		Params = {
		}
		card_texture = icon_attack_addnote
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = PowerUpSteal
		name_text = "Powerup Steal"
		Weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_steal
		Params = {
		}
		card_texture = icon_attack_drain
		drain_time = 5000
		fire_bolt = 0
	}
	{
		Name = LeftyNotes
		name_text = "Lefty Flip"
		alt_name_text = "Righty Flip"
		Weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_lefty_notes
		Params = {
		}
		card_texture = icon_attack_leftyrighty
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = BrokenString
		name_text = "Broken String"
		Weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_broken_string
		Params = {
		}
		card_texture = icon_attack_string
		easy_repair = 6
		medium_repair = 8
		hard_repair = 10
		expert_repair = 12
		drain_time = 5000
		IMMEDIATE = 1
		fire_bolt = 1
	}
	{
		Name = WhammyAttack
		name_text = "Whammy"
		Weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_whammy_attack
		Params = {
		}
		card_texture = icon_attack_whammy
		easy_repair = 3
		medium_repair = 4
		hard_repair = 5
		expert_repair = 6
		drain_time = 5000
		IMMEDIATE = 1
		no_ai_damage = 1
		fire_bolt = 1
	}
	{
		Name = DeathLick
		name_text = "Death Drain"
		Weight = 0
		weight_low = 0
		weight_losing = 0
		Scr = battle_death_lick
		Params = {
		}
		card_texture = icon_attack_deth
		easy_kill_rate = 0.4
		medium_kill_rate = 0.3
		hard_kill_rate = 0.25
		expert_kill_rate = 0.2
		drain_time = 10000
		fire_bolt = 0
	}
]

script battlemode_init 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = battlemode_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player> AddToStringLookup
	Change StructureName = <player_status> battlemode_creation_selection = -1
	Change StructureName = <player_status> current_num_powerups = 0
	Change StructureName = <player_status> final_blow_powerup = -1
	Change StructureName = <player_status> battle_text_count = 0
	Change StructureName = <player_status> shake_notes = -1
	Change StructureName = <player_status> double_notes = -1
	Change StructureName = <player_status> diffup_notes = -1
	Change StructureName = <player_status> lefty_notes = -1
	Change StructureName = <player_status> whammy_attack = -1
	Change StructureName = <player_status> stealing_powerup = -1
	Change StructureName = <player_status> death_lick_attack = -1
	Change StructureName = <player_status> last_selected_attack = -1
	Change StructureName = <player_status> last_hit_note = NONE
	Change StructureName = <player_status> broken_string_mask = 0
	Change StructureName = <player_status> broken_string_green = 0
	Change StructureName = <player_status> broken_string_red = 0
	Change StructureName = <player_status> broken_string_yellow = 0
	Change StructureName = <player_status> broken_string_blue = 0
	Change StructureName = <player_status> broken_string_orange = 0
	Change StructureName = <player_status> battle_num_attacks = 0
	Change StructureName = <player_status> hold_difficulty_up = 0.0
	Player = (<Player> + 1)
	repeat 2
	Change \{current_battle_text_p1 = [
			Id
			Id
			Id
		]}
	Change \{current_battle_text_p2 = [
			Id
			Id
			Id
		]}
	Change \{battle_p1_highway_hammer = 0}
	Change \{battle_p2_highway_hammer = 0}
	Change \{disable_attacks = 0}
	Change \{net_attack_pending = 0}
endscript

script battlemode_deinit 
	Change \{disable_attacks = 1}
	GH_BattleMode_Stop_Heartbeat_P1
	GH_BattleMode_Stop_Heartbeat_P2
	KillSpawnedScript \{Id = battlemode}
	Change StructureName = <player_status> battlemode_creation_selection = -1
	Change StructureName = <player_status> current_num_powerups = 0
	Change StructureName = <player_status> battle_text_count = 0
	Change StructureName = <player_status> shake_notes = -1
	Change StructureName = <player_status> double_notes = -1
	Change StructureName = <player_status> diffup_notes = -1
	Change StructureName = <player_status> lefty_notes = -1
	Change StructureName = <player_status> whammy_attack = -1
	Change StructureName = <player_status> stealing_powerup = -1
	Change StructureName = <player_status> death_lick_attack = -1
	Change StructureName = <player_status> last_selected_attack = -1
	Change StructureName = <player_status> last_hit_note = NONE
	Change StructureName = <player_status> broken_string_mask = 0
	Change StructureName = <player_status> broken_string_green = 0
	Change StructureName = <player_status> broken_string_red = 0
	Change StructureName = <player_status> broken_string_yellow = 0
	Change StructureName = <player_status> broken_string_blue = 0
	Change StructureName = <player_status> broken_string_orange = 0
	Change StructureName = <player_status> hold_difficulty_up = 0.0
	if NOT (($<player_status>.lefthanded_gems_flip_save) = ($<player_status>.lefthanded_gems))
		Change StructureName = <player_status> lefthanded_gems = ($<player_status>.lefthanded_gems_flip_save)
	endif
	if NOT (($<player_status>.lefthanded_button_ups_flip_save) = ($<player_status>.lefthanded_button_ups))
		Change StructureName = <player_status> lefthanded_button_ups = ($<player_status>.lefthanded_button_ups_flip_save)
	endif
	if ScreenElementExists \{Id = battlemode_container}
		DestroyScreenElement \{Id = battlemode_container}
	endif
	Change \{current_battle_text_p1 = [
			Id
			Id
			Id
		]}
	Change \{current_battle_text_p2 = [
			Id
			Id
			Id
		]}
	Change \{battle_p1_highway_hammer = 0}
	Change \{battle_p2_highway_hammer = 0}
	battlemode_killspawnedscripts
endscript

script battlemode_killspawnedscripts 
	KillSpawnedScript \{Name = animate_open_hand}
	KillSpawnedScript \{Name = animate_stealing_hand}
	KillSpawnedScript \{Name = net_battle_trigger}
	KillSpawnedScript \{Name = animate_arrow}
	KillSpawnedScript \{Name = update_broken_button}
	KillSpawnedScript \{Name = animate_whammy_bar}
	KillSpawnedScript \{Name = remove_hud_difficulty_up}
	KillSpawnedScript \{Name = remove_hud_double_notes}
	KillSpawnedScript \{Name = remove_hud_lefty_notes}
	KillSpawnedScript \{Name = animate_steal}
	KillSpawnedScript \{Name = flicker_gems}
	KillSpawnedScript \{Name = shake_highway}
	KillSpawnedScript \{Name = hammer_highway}
	KillSpawnedScript \{Name = attack_ready_text}
	KillSpawnedScript \{Name = animate_death_icon}
	KillSpawnedScript \{Name = shake_rock_meter}
	KillSpawnedScript \{Name = shake_highway_death}
	KillSpawnedScript \{Name = death_text}
	KillSpawnedScript \{Name = attack_bolt}
	KillSpawnedScript \{Name = death_text_wing_flap}
	KillSpawnedScript \{Name = bite_particle}
endscript

script restore_saved_powerups 
	if ($battle_sudden_death = 1)
		<array_count> = 0
		if (($player1_status.save_num_powerups) > 0)
			begin
			p1_powerup = ($save_current_powerups_p1 [<array_count>])
			battlemode_ready battle_gem = <p1_powerup> player_status = player1_status battle_text = 0
			<array_count> = (<array_count> + 1)
			repeat ($player1_status.save_num_powerups)
		endif
		<array_count> = 0
		if (($player2_status.save_num_powerups) > 0)
			begin
			p2_powerup = ($save_current_powerups_p2 [<array_count>])
			battlemode_ready battle_gem = <p2_powerup> player_status = player2_status battle_text = 0
			<array_count> = (<array_count> + 1)
			repeat ($player2_status.save_num_powerups)
		endif
	endif
endscript

script battlemode_select \{player_status = player1_status}
	Change StructureName = <player_status> battlemode_creation_selection = -1
	total_weight = 0
	num_attacks = 0
	if ($<player_status>.Player = 1)
		other_player_difficulty = $current_difficulty2
	else
		other_player_difficulty = $current_difficulty
	endif
	next_attack = -1
	if ($<player_status>.current_num_powerups > 0)
		if ($<player_status>.Player = 1)
			<next_attack> = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		else
			<next_attack> = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		endif
	endif
	GetArraySize \{$battlemode_powerups}
	array_count = 0
	begin
	if NOT ((<other_player_difficulty> = EXPERT) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
		if ($<player_status>.current_health > 0.5)
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_low)
			else
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].Weight)
			endif
		else
			total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_losing)
		endif
	endif
	if ($battlemode_powerups [<array_count>].Weight > 0)
		num_attacks = (<num_attacks> + 1)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetRandomValue Name = select_weight A = 0 B = (<total_weight> -1) Integer
	if (<num_attacks> = 0)
		Change StructureName = <player_status> battlemode_creation_selection = 0
		return
	endif
	array_count = 0
	begin
	if NOT ($battle_sudden_death = 1)
		if NOT ((<other_player_difficulty> = EXPERT) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
			if (($<player_status>.current_health) > 0.5)
				if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
					select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_low)
				else
					select_weight = (<select_weight> - $battlemode_powerups [<array_count>].Weight)
				endif
			else
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_losing)
			endif
		endif
	else
		Change StructureName = <player_status> battlemode_creation_selection = 7
		break
	endif
	if (<select_weight> < 0)
		Change StructureName = <player_status> battlemode_creation_selection = <array_count>
		Change StructureName = <player_status> last_selected_attack = <array_count>
		break
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($<player_status>.battlemode_creation_selection = -1)
		PrintStruct <...>
		ScriptAssert \{"Battlemode selection not found"}
	endif
endscript
medium_scale = 0.55
small_scale = 0.4

script print_powerup_arrays 
	Printf "Current powerups p1(%a):" A = ($player1_status.current_num_powerups)
	GetArraySize \{$current_powerups_p1}
	array_count = 0
	begin
	Printf "    %c: %p" C = <array_count> P = ($current_powerups_p1 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	Printf "Current powerups p2(%a):" A = ($player2_status.current_num_powerups)
	GetArraySize \{$current_powerups_p2}
	<array_count> = 0
	begin
	Printf "    %c: %p" C = <array_count> P = ($current_powerups_p2 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script battlemode_ready \{battle_gem = 0
		player_status = player1_status
		steal = 0
		battle_text = 1}
	PrintStruct <...>
	if ($<player_status>.Player = 1)
		SoundEvent \{Event = Battle_Power_Awarded_SFX_P1}
	else
		SoundEvent \{Event = Battle_Power_Awarded_SFX_P2}
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	if (<current_num_powerups> >= $max_num_powerups)
		FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<player_status>.current_num_powerups - 1) S = ($<player_status>.Player)
		if ScreenElementExists Id = <card_checksum>
			DestroyScreenElement Id = <card_checksum>
		endif
		Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
		Printf "battlemode_ready - decremented p%n's current_num_powerups to %a" N = ($<player_status>.Player) A = ($<player_status>.current_num_powerups)
		update_battlecards_remove player_status = <player_status>
	endif
	if NOT (ScreenElementExists Id = battlemode_container)
		return
	endif
	if (<current_num_powerups> < 0)
		Printf \{"Trying to decrement current_num_powerups below 0"}
		Printf "player%p battle_gem=%b" P = ($<player_status>.Player) B = <battle_gem>
		print_powerup_arrays
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	SELECT = <battle_gem>
	if ($<player_status>.Player = 1)
		SetArrayElement ArrayName = current_powerups_p1 GlobalArray Index = <current_num_powerups> NewValue = <SELECT>
		card_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		SetArrayElement ArrayName = current_powerups_p2 GlobalArray Index = <current_num_powerups> NewValue = <SELECT>
		card_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups + 1)
	Printf "battlemode_ready - incremented p%n's current_num_powerups to %a" N = ($<player_status>.Player) A = ($<player_status>.current_num_powerups)
	Color = ($<player_status>.last_hit_note)
	if (<Color> = NONE)
		<Color> = Green
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		begin_pos = (($button_up_models.<Color>.left_pos_2d) - (0.0, 90.0))
	else
		begin_pos = (($button_up_models.<Color>.pos_2d) - (0.0, 90.0))
	endif
	if ($<player_status>.Player = 1)
		<begin_pos> = (<begin_pos> - (225.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (225.0, 0.0))
	endif
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = <current_num_powerups> S = ($<player_status>.Player)
	CreateScreenElement {
		Type = SpriteElement
		Id = <card_checksum>
		PARENT = battlemode_container
		texture = ($battlemode_powerups [<SELECT>].card_texture)
		rgba = [255 255 255 255]
		Pos = <begin_pos>
		Dims = (64.0, 64.0)
		just = [Center Center]
		Alpha = 0.5
		z_priority = (($battle_hud_2d_elements.Z) + 19)
	}
	if (<steal> > 0)
		DoScreenElementMorph {
			Id = <card_checksum>
			Pos = <card_pos>
			Alpha = 1
			Time = 0
		}
	else
		DoScreenElementMorph {
			Id = <card_checksum>
			Pos = <card_pos>
			Alpha = 1
			Time = 0.3
		}
	endif
	update_battlecards_add current_num_powerups = <current_num_powerups> player_status = <player_status>
	if ($show_battle_text = 1)
		if (<battle_text> = 1)
			SpawnScriptNow attack_ready_text Params = {current_num_powerups = <current_num_powerups> SELECT = <SELECT> player_status = <player_status>}
		endif
	endif
endscript

script attack_ready_text 
	if ($<player_status>.Player = 1)
		<other_player_status> = player2_status
	else
		<other_player_status> = player1_status
	endif
	Wait \{0.3
		Seconds}
	FormatText ChecksumName = text_checksum 'attack_ready_text_%s' S = ($<player_status>.Player)
	if ScreenElementExists Id = <text_checksum>
		DestroyScreenElement Id = <text_checksum>
	endif
	attack_name = ($battlemode_powerups [<SELECT>].name_text)
	if ($battlemode_powerups [<SELECT>].Name = LeftyNotes)
		if NOT ($<other_player_status>.lefty_notes < 1)
			if ($<other_player_status>.lefthanded_button_ups = 0)
				<attack_name> = ($battlemode_powerups [<SELECT>].alt_name_text)
			endif
		else
			if ($<other_player_status>.lefthanded_button_ups = 1)
				<attack_name> = ($battlemode_powerups [<SELECT>].alt_name_text)
			endif
		endif
	endif
	if ($<player_status>.Player = 1)
		text_pos = ($battle_hud_2d_elements.attack_ready_text_pos_p1)
		CreateScreenElement {
			Type = TextElement
			Id = <text_checksum>
			PARENT = battlemode_container
			Pos = <text_pos>
			Text = <attack_name>
			font = text_a4
			Scale = 0.6
			rgba = [255 255 255 255]
			just = [LEFT Bottom]
			z_priority = 25
		}
	else
		text_pos = ($battle_hud_2d_elements.attack_ready_text_pos_p2)
		CreateScreenElement {
			Type = TextElement
			Id = <text_checksum>
			PARENT = battlemode_container
			Pos = <text_pos>
			Text = <attack_name>
			font = text_a4
			Scale = 0.6
			rgba = [255 255 255 255]
			just = [RIGHT Bottom]
			z_priority = 25
		}
	endif
	Wait \{3
		Seconds}
	DoScreenElementMorph {
		Id = <text_checksum>
		Alpha = 0
		Time = 0.3
	}
endscript

script update_battlecards_add 
	if ($<player_status>.Player = 1)
		player_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p1)
		small_pos = ($battle_hud_2d_elements.card_3_off_p1)
	else
		player_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p2)
		small_pos = ($battle_hud_2d_elements.card_3_off_p2)
	endif
	if (<current_num_powerups> > 0)
		FormatText ChecksumName = card_checksum 'battlecard_0_%s' S = ($<player_status>.Player)
		DoScreenElementMorph {
			Id = <card_checksum>
			Pos = (<player_pos> + <medium_pos>)
			Scale = $medium_scale
			Time = 0.3
		}
		if (<current_num_powerups> > 1)
			FormatText ChecksumName = card_checksum 'battlecard_1_%s' S = ($<player_status>.Player)
			DoScreenElementMorph {
				Id = <card_checksum>
				Pos = (<player_pos> + <medium_pos>)
				Scale = $medium_scale
				Time = 0.3
			}
			FormatText ChecksumName = card_checksum 'battlecard_0_%s' S = ($<player_status>.Player)
			DoScreenElementMorph {
				Id = <card_checksum>
				Pos = (<player_pos> + <small_pos>)
				Scale = $small_scale
				Time = 0.3
			}
		endif
	endif
endscript

script update_battlecards_remove 
	if ($<player_status>.Player = 1)
		player_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p1)
		small_pos = ($battle_hud_2d_elements.card_3_off_p1)
	else
		player_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p2)
		small_pos = ($battle_hud_2d_elements.card_3_off_p2)
	endif
	if ($<player_status>.current_num_powerups > 0)
		FormatText ChecksumName = card_checksum 'battlecard_0_%s' S = ($<player_status>.Player)
		DoScreenElementMorph {
			Id = <card_checksum>
			Pos = <player_pos>
			Scale = 1
			Time = 0.3
		}
		if ($<player_status>.current_num_powerups > 1)
			FormatText ChecksumName = card_checksum 'battlecard_1_%s' S = ($<player_status>.Player)
			DoScreenElementMorph {
				Id = <card_checksum>
				Pos = <player_pos>
				Scale = 1
				Time = 0.3
			}
			FormatText ChecksumName = card_checksum 'battlecard_0_%s' S = ($<player_status>.Player)
			DoScreenElementMorph {
				Id = <card_checksum>
				Pos = (<player_pos> + <medium_pos>)
				Scale = $medium_scale
				Time = 0.3
			}
		endif
	endif
endscript

script add_battle_text 
	if (($<send_to_player>.battle_text_count) < 3)
		ExtendCRC <battle_text> ($<send_to_player>.Text) out = Id
		count = 0
		begin
		if ($<send_to_player>.Player = 1)
			current_id = ($current_battle_text_p1 [<count>])
		else
			current_id = ($current_battle_text_p2 [<count>])
		endif
		if (<current_id> = <Id>)
			Printf \{"Text allready on screen, don't add a new screen element"}
			return
		endif
		<count> = (<count> + 1)
		repeat 3
		if ($<send_to_player>.Player = 1)
			<Id> :SetProps z_priority = -1
			DoScreenElementMorph Id = <Id> Alpha = 1 Pos = (380.0, 35.0)
		else
			<Id> :SetProps z_priority = -1
			DoScreenElementMorph Id = <Id> Alpha = 1 Pos = (890.0, 35.0)
		endif
		battle_count = ($<send_to_player>.battle_text_count)
		if ($<send_to_player>.Player = 1)
			SetArrayElement ArrayName = current_battle_text_p1 GlobalArray Index = <battle_count> NewValue = <Id>
		else
			SetArrayElement ArrayName = current_battle_text_p2 GlobalArray Index = <battle_count> NewValue = <Id>
		endif
		Change StructureName = <send_to_player> battle_text_count = (($<send_to_player>.battle_text_count) + 1)
		if (($<send_to_player>.battle_text_count) > 1)
			count = 0
			begin
			if ((($<send_to_player>.battle_text_count) - <count>) > 1)
				if ($<send_to_player>.Player = 1)
					battle_text_to_move = ($current_battle_text_p1 [<count>])
				else
					battle_text_to_move = ($current_battle_text_p2 [<count>])
				endif
				GetScreenElementDims Id = <battle_text_to_move>
				GetScreenElementPosition Id = <battle_text_to_move>
				x_offset = (<width> / 2)
				DoScreenElementMorph {
					Id = <battle_text_to_move>
					Pos = (<ScreenELementPos> + (0.0, 30.0) + (<x_offset> * (1.0, 0.0)))
					just = [Center Top]
					Time = 0.3
				}
				<count> = (<count> + 1)
			endif
			repeat (($<send_to_player>.battle_text_count) - 1)
		endif
	endif
	return Id = <Id>
endscript

script remove_battle_text 
	remove_text = -1
	if NOT GotParam \{Id}
		return
	endif
	count = 0
	begin
	if ($<send_to_player>.Player = 1)
		current_id = ($current_battle_text_p1 [<count>])
	else
		current_id = ($current_battle_text_p2 [<count>])
	endif
	if (<current_id> = <Id>)
		<remove_text> = <count>
	endif
	<count> = (<count> + 1)
	repeat 3
	if (<remove_text> = -1)
		return
	endif
	if ($<send_to_player>.Player = 1)
		DoScreenElementMorph Id = ($current_battle_text_p1 [<remove_text>]) Alpha = 0 Time = 0.3
		SetArrayElement ArrayName = current_battle_text_p1 GlobalArray Index = <remove_text> NewValue = Id
	else
		DoScreenElementMorph Id = ($current_battle_text_p2 [<remove_text>]) Alpha = 0 Time = 0.3
		SetArrayElement ArrayName = current_battle_text_p2 GlobalArray Index = <remove_text> NewValue = Id
	endif
	Change StructureName = <send_to_player> battle_text_count = ($<send_to_player>.battle_text_count - 1)
	if (<remove_text> < 2)
		count = <remove_text>
		begin
		if NOT (<count> >= ($<send_to_player>.battle_text_count))
			if ($<send_to_player>.Player = 1)
				battle_text_to_move = ($current_battle_text_p1 [(<count> + 1)])
				SetArrayElement ArrayName = current_battle_text_p1 GlobalArray Index = (<count> + 1) NewValue = Id
				SetArrayElement ArrayName = current_battle_text_p1 GlobalArray Index = <count> NewValue = <battle_text_to_move>
			else
				battle_text_to_move = ($current_battle_text_p2 [(<count> + 1)])
				SetArrayElement ArrayName = current_battle_text_p2 GlobalArray Index = (<count> + 1) NewValue = Id
				SetArrayElement ArrayName = current_battle_text_p2 GlobalArray Index = <count> NewValue = <battle_text_to_move>
			endif
		endif
		<count> = (<count> + 1)
		repeat 2
	endif
	if (($<send_to_player>.battle_text_count) > 0)
		count = 0
		begin
		if (<count> < <remove_text>)
			if ($<send_to_player>.Player = 1)
				battle_text_to_move = ($current_battle_text_p1 [<count>])
			else
				battle_text_to_move = ($current_battle_text_p2 [<count>])
			endif
			GetScreenElementDims Id = <battle_text_to_move>
			GetScreenElementPosition Id = <battle_text_to_move>
			x_offset = (<width> / 2)
			DoScreenElementMorph {
				Id = <battle_text_to_move>
				Pos = (<ScreenELementPos> - (0.0, 30.0) + (<x_offset> * (1.0, 0.0)))
				just = [Center Top]
				Time = 0.3
			}
			<count> = (<count> + 1)
		endif
		repeat 2
	endif
endscript

script test_battle_trigger 
	battlemode_fill
	Wait \{5
		Seconds}
	battle_trigger_on \{player_status = player2_status}
	Wait \{1
		GameFrame}
	battle_trigger_on \{player_status = player2_status}
	Wait \{1
		GameFrame}
	battle_trigger_on \{player_status = player1_status}
	Wait \{1
		GameFrame}
	battle_trigger_on \{player_status = player1_status}
endscript

script battle_trigger_on 
	if ($<player_status>.current_num_powerups = 0)
		return
	endif
	if ($<player_status>.Player = 1)
		<other_player> = 2
		<other_player_text> = 'p2'
		<other_difficulty> = $current_difficulty2
		<other_player_status> = player2_status
		SELECT = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 2 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
		if ($is_network_game)
			if NOT (<SELECT> = 3)
				SendNetMessage {
					Type = battle_trigger_on
					SELECT = <SELECT>
				}
			endif
		endif
	else
		<other_player> = 1
		<other_player_text> = 'p1'
		<other_difficulty> = $current_difficulty
		<other_player_status> = player1_status
		SELECT = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 1 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
	endif
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<player_status>.current_num_powerups - 1) S = ($<player_status>.Player)
	if ScreenElementExists Id = <card_checksum>
		DestroyScreenElement Id = <card_checksum>
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	Printf "battle_trigger_on - decremented p%n's current_num_powerups to %a" N = ($<player_status>.Player) A = ($<player_status>.current_num_powerups)
	if ($<player_status>.current_num_powerups < 0)
		Printf "BAD!  Trying to decrement num_powerups on %s that is already zero." S = ($<player_status>.Text)
		Printf "num powerups: %i" I = ($<player_status>.current_num_powerups)
		Printf "Trying to use powerup: %i" I = <SELECT>
	endif
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<SELECT>].drain_time)
	other_player_difficulty = EASY
	if ($<player_status>.Player = 1)
		<other_player_difficulty> = $current_difficulty2
	else
		<other_player_difficulty> = $current_difficulty
	endif
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
	if NOT ($<player_status>.highway_layout = solo_highway)
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
	if ($<player_status>.highway_layout = solo_highway)
		SpawnScriptNow hammer_rock_meter Params = {other_player_text = <other_player_text>}
	else
		SpawnScriptNow hammer_highway Params = {other_player_text = <other_player_text>}
	endif
	if ($battlemode_powerups [<SELECT>].fire_bolt = 1)
		SpawnScriptNow attack_bolt Params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript

script attack_bolt \{bolt_angle = 60}
	bolt_pos_middle = (640.0, 230.0)
	bolt_pos_offset = (330.0, 0.0)
	FormatText ChecksumName = attack_bolt 'attack_bolt%p' P = ($<player_status>.Text) AddToStringLookup = TRUE
	if ScreenElementExists Id = <attack_bolt>
		DestroyScreenElement Id = <attack_bolt>
	endif
	if ($<player_status>.Player = 1)
		bolt_angle = (-1 * <bolt_angle>)
		bolt_scale = (-1.0, 1.0)
		bolt_just = [middle Top]
		bolt_pos = (<bolt_pos_middle> - <bolt_pos_offset>)
	else
		bolt_angle = <bolt_angle>
		bolt_scale = (1.0, 1.0)
		bolt_just = [middle Top]
		bolt_pos = (<bolt_pos_middle> + <bolt_pos_offset>)
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <attack_bolt>
		PARENT = battlemode_container
		Material = sys_Big_Bolt01_Red_sys_Big_Bolt01_Red
		rgba = [255 255 255 255]
		Pos = <bolt_pos>
		Rot_Angle = <bolt_angle>
		Scale = <bolt_scale>
		just = <bolt_just>
		z_priority = 10
	}
	GetSongTimeMS
	FormatText ChecksumName = attack_bolt_particle 'attack_bolt_particle_%s_%t' S = ($<player_status>.Text) T = <Time> AddToStringLook = TRUE
	if ($<player_status>.Player = 1)
		emit_direction = 300
		bolt_hit_pos = (<bolt_pos> + (455.0, 0.0) + (0.0, 250.0))
	else
		emit_direction = -300
		bolt_hit_pos = (<bolt_pos> - (455.0, 0.0) + (0.0, 250.0))
	endif
	Create2DParticleSystem {
		Id = <attack_bolt_particle>
		Pos = (<bolt_hit_pos>)
		PARENT = battlemode_container
		z_priority = 8.0
		Material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = [255 66 0 255]
		end_color = [128 0 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (0.5, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.01
		emit_dir = <emit_direction>
		emit_spread = 90.0
		Velocity = 16.0
		Friction = (0.0, 24.0)
		Time = 1
	}
	Wait \{8
		GameFrames}
	if ScreenElementExists Id = <attack_bolt>
		DestroyScreenElement Id = <attack_bolt>
	endif
	Wait \{2
		GameFrames}
	Destroy2DParticleSystem Id = <attack_bolt_particle> Kill_when_empty
endscript

script battle_death_lick \{death_speed = 0.2}
	if NOT ($boss_battle = 1)
		switch <DIFFICULTY>
			case EASY
			<death_speed> = ($battlemode_powerups [7].easy_kill_rate)
			case MEDIUM
			<death_speed> = ($battlemode_powerups [7].medium_kill_rate)
			case HARD
			<death_speed> = ($battlemode_powerups [7].hard_kill_rate)
			case EXPERT
			<death_speed> = ($battlemode_powerups [7].expert_kill_rate)
		endswitch
	endif
	SpawnScriptNow attack_bolt Params = {bolt_angle = 80 player_status = <player_status> other_player_status = <other_player_status>}
	if ($<other_player_status>.Player = 1)
		SpawnScriptNow \{GH_BattleMode_Start_Heartbeat_P1}
		SpawnScriptNow GH_BattleMode_Player1_SFX_Death_Drain Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	else
		SpawnScriptNow \{GH_BattleMode_Start_Heartbeat_P2}
		SpawnScript GH_BattleMode_Player2_SFX_Death_Drain Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	endif
	player1_pos = (310.0, 170.0)
	player2_pos = (981.0, 170.0)
	if ($<other_player_status>.Player = 1)
		start_pos = <player2_pos>
		end_pos = <player1_pos>
	else
		start_pos = <player1_pos>
		end_pos = <player2_pos>
	endif
	GetSongTimeMS
	FormatText ChecksumName = death_icon_checksum 'death_icon_%s_%t' S = ($<other_player_status>.Player) T = <Time>
	if ScreenElementExists Id = <death_icon_checksum>
		DestroyScreenElement Id = <death_icon_checksum>
	endif
	deth_icon_texture = icon_attack_deth_128
	if CheckSumEquals A = ($current_song) B = bossslash
		<deth_icon_texture> = icon_attack_deth_boss_slash
	elseif CheckSumEquals A = ($current_song) B = bosstom
		<deth_icon_texture> = icon_attack_deth_boss_morello
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <death_icon_checksum>
		PARENT = battlemode_container
		texture = <deth_icon_texture>
		rgba = [255 255 255 255]
		Pos = <start_pos>
		Alpha = 1
		Dims = (128.0, 128.0)
		just = [Center Center]
		z_priority = 25
	}
	KillSpawnedScript \{Name = update_battle_death_meter}
	KillSpawnedScript \{Name = update_battle_death_meter_wings}
	FormatText \{ChecksumName = death_meter
		'battle_death_meter'
		AddToStringLookup = TRUE}
	if ScreenElementExists Id = <death_meter>
		DestroyScreenElement Id = <death_meter>
	endif
	if ($<other_player_status>.death_lick_attack < 0)
		SpawnScriptNow death_text Params = {other_player_status = <other_player_status>}
	endif
	DoScreenElementMorph Id = <Id> Pos = <end_pos> Scale = 1.2 Alpha = 0.95 relative_scale
	if ($boss_battle = 1)
		Change \{StructureName = player2_status
			final_blow_powerup = 7}
	endif
	if NOT ($<other_player_status>.death_lick_attack > -1)
		SpawnScriptNow animate_death_icon Params = {other_player_status = <other_player_status> Id = <Id>}
		Change StructureName = <other_player_status> death_lick_attack = <death_speed>
		begin
		CrowdDecrease player_status = <other_player_status>
		if ($<other_player_status>.current_health <= 0.0)
			break
		endif
		Wait ($<other_player_status>.death_lick_attack) Seconds
		repeat
	else
		if ScreenElementExists Id = <death_icon_checksum>
			DestroyScreenElement Id = <death_icon_checksum>
		endif
		Change StructureName = <other_player_status> death_lick_attack = ($<other_player_status>.death_lick_attack * 0.5)
	endif
endscript

script test_fight_death 
	begin
	CrowdIncrease \{player_status = player2_status}
	if ($player2_status.current_health <= 0.0)
		break
	endif
	Wait \{0.2
		Seconds}
	repeat
endscript

script animate_death_icon 
	pulse_on = 0
	begin
	if ($<other_player_status>.current_health <= 0.0)
		break
	endif
	if (<pulse_on> = 0)
		DoScreenElementMorph Id = <Id> Time = 0.1 Alpha = 0.1 Scale = 1.1 relative_scale
		<pulse_on> = 1
	else
		DoScreenElementMorph Id = <Id> Time = 0.1 Alpha = 0.95 Scale = 1.2 relative_scale
		<pulse_on> = 0
	endif
	Wait \{0.15
		Seconds}
	repeat
endscript

script death_text 
	text_start_pos = (640.0, 430.0)
	text_offset = (225.0, 0.0)
	if (($<other_player_status>.Player) = 1)
		<text_start_pos> = (<text_start_pos> - <text_offset>)
	else
		<text_start_pos> = (<text_start_pos> + <text_offset>)
	endif
	FormatText ChecksumName = text_bg_checksum 'sudden_death_text_bg_%s' S = ($<other_player_status>.Text)
	FormatText ChecksumName = text_wing_r_checksum 'sudden_death_wing_r_%s' S = ($<other_player_status>.Text)
	FormatText ChecksumName = text_wing_l_checksum 'sudden_death_wing_l_%s' S = ($<other_player_status>.Text)
	FormatText ChecksumName = text_checksum 'sudden_death_text_%s' S = ($<other_player_status>.Text)
	FormatText ChecksumName = text_checksum2 'sudden_death_text2_%s' S = ($<other_player_status>.Text)
	if ScreenElementExists Id = <text_bg_checksum>
		DestroyScreenElement Id = <text_bg_checksum>
	endif
	if ScreenElementExists Id = <text_checksum>
		DestroyScreenElement Id = <text_checksum>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <text_bg_checksum>
		PARENT = battlemode_container
		texture = battle_alert_death
		rgba = [255 255 255 255]
		Pos = <text_start_pos>
		Scale = 0.7
		Alpha = 0
		just = [Center Bottom]
		z_priority = 52
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = <text_wing_r_checksum>
		PARENT = <text_bg_checksum>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		Pos = (205.0, 0.0)
		Scale = 0.8
		Rot_Angle = -20
		just = [LEFT Top]
		z_priority = 52
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = <text_wing_l_checksum>
		PARENT = <text_bg_checksum>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		Pos = (55.0, 0.0)
		Scale = (-0.8, 0.8)
		Rot_Angle = 20
		just = [RIGHT Top]
		z_priority = 52
	}
	CreateScreenElement {
		Type = TextElement
		Id = <text_checksum>
		PARENT = <text_bg_checksum>
		Pos = (130.0, -53.0)
		Text = "DEATH"
		font = text_a10
		Scale = 1
		rgba = [255 255 255 255]
		just = [Center Bottom]
		z_priority = 53
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <text_checksum2>
		PARENT = <text_bg_checksum>
		Pos = (130.0, 5.0)
		Text = "DRAIN"
		font = text_a10
		Scale = 1.6
		rgba = [255 255 255 255]
		just = [Center Bottom]
		z_priority = 53
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	DoScreenElementMorph {
		Id = <text_bg_checksum>
		Time = 0.02
		Scale = 0.9
		Alpha = 1
	}
	Wait \{0.02
		Seconds}
	SpawnScriptNow death_text_wing_flap Params = {text_start_pos = <text_start_pos> text_bg_checksum = <text_bg_checksum> text_wing_l_checksum = <text_wing_l_checksum> text_wing_r_checksum = <text_wing_r_checksum> other_player_status = <other_player_status>}
endscript

script death_text_wing_flap 
	hover_sim_rot = 7
	wing_count = 0
	wing_up = 0
	begin
	player_health = ($<other_player_status>.current_health)
	if (<player_health> < 1.0)
		<player_health> = (1.0 - <player_health>)
		new_scale = (0.9 + (0.3 * <player_health>))
		new_pos = (<text_start_pos> + ((0.0, 220.0) * <player_health>))
		DoScreenElementMorph {Id = <text_bg_checksum> Pos = <new_pos> Scale = <new_scale>}
	endif
	if (<wing_count> = 4)
		GetRandomValue Name = random_rot A = (<hover_sim_rot> * -1) B = <hover_sim_rot> Integer
		DoScreenElementMorph {
			Id = <text_bg_checksum>
			Rot_Angle = <random_rot>
			Time = 0.02
		}
		SpawnScriptNow bite_particle Params = {other_player_status = <other_player_status> random_rot = <random_rot> text_bg_checksum = <text_bg_checksum>}
		if (<wing_up> = 0)
			DoScreenElementMorph {
				Id = <text_wing_r_checksum>
				Rot_Angle = -40
				Time = 0.02
			}
			DoScreenElementMorph {
				Id = <text_wing_l_checksum>
				Rot_Angle = 40
				Time = 0.02
			}
			<wing_up> = 1
		else
			DoScreenElementMorph {
				Id = <text_wing_r_checksum>
				Rot_Angle = -10
				Time = 0.02
			}
			DoScreenElementMorph {
				Id = <text_wing_l_checksum>
				Rot_Angle = 10
				Time = 0.02
			}
			<wing_up> = 0
		endif
		<wing_count> = 0
	endif
	<wing_count> = (<wing_count> + 1)
	Wait \{1
		GameFrame}
	repeat
endscript

script bite_particle 
	if (<random_rot> > 0)
		FormatText ChecksumName = death_bite 'death_bite_r_%s' S = ($<other_player_status>.Text) AddToStringLook = TRUE
		SpawnScriptNow hammer_highway Params = {push_p1 = (0.0, 30.0) push_p2 = (0.0, 30.0) other_player_text = ($<other_player_status>.Text) Time = 0.01}
		Pos = (190.0, 120.0)
	else
		if NOT (<random_rot> = 0)
			FormatText ChecksumName = death_bite 'death_bite_l_%s' S = ($<other_player_status>.Text) AddToStringLook = TRUE
			SpawnScriptNow hammer_highway Params = {push_p1 = (0.0, 30.0) push_p2 = (0.0, 30.0) other_player_text = ($<other_player_status>.Text) Time = 0.01}
			Pos = (65.0, 120.0)
		endif
	endif
	if NOT (<random_rot> = 0)
		Create2DParticleSystem {
			Id = <death_bite>
			Pos = <Pos>
			PARENT = <text_bg_checksum>
			z_priority = 12.0
			Material = sys_Particle_Spark01_sys_Particle_Spark01
			start_color = [255 0 0 255]
			end_color = [128 0 0 0]
			start_scale = (2.0, 2.0)
			end_scale = (0.5, 0.5)
			start_angle_spread = 360.0
			min_rotation = -500.0
			max_rotation = 500.0
			emit_start_radius = 0.0
			emit_radius = 1.0
			Emit_Rate = 0.01
			emit_dir = 0.0
			emit_spread = 160.0
			Velocity = 10.0
			Friction = (0.0, 50.0)
			Time = 0.25
		}
		Wait \{7
			frames}
		Destroy2DParticleSystem Id = <death_bite>
	endif
endscript

script lightning_particle 
endscript

script battle_lightning 
	flicker_ammount = 2
	switch <DIFFICULTY>
		case EASY
		<flicker_ammount> = ($battlemode_powerups [0].easy_flicker)
		case MEDIUM
		<flicker_ammount> = ($battlemode_powerups [0].medium_flicker)
		case HARD
		<flicker_ammount> = ($battlemode_powerups [0].hard_flicker)
		case EXPERT
		<flicker_ammount> = ($battlemode_powerups [0].expert_flicker)
	endswitch
	if ($<other_player_status>.Player = 1)
		Change battle_flicker_difficulty_p1 = <flicker_ammount>
		SpawnScript GH_BattleMode_Player1_SFX_Shake_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	else
		Change battle_flicker_difficulty_p2 = <flicker_ammount>
		SpawnScript GH_BattleMode_Player2_SFX_Shake_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	endif
	GetSongTimeMS
	CastToInteger \{Time}
	if ($<other_player_status>.shake_notes > -1)
		Change StructureName = <other_player_status> shake_notes = (($<other_player_status>.shake_notes) + <drain_time>)
	else
		Change StructureName = <other_player_status> shake_notes = (<Time> + <drain_time>)
		SpawnScriptNow flicker_gems Params = {Player = <Player> other_player_status = <other_player_status>}
		SpawnScriptNow shake_highway Params = {player_Text = <player_Text> other_player_status = <other_player_status>}
		begin
		GetSongTimeMS
		if (<Time> > $<other_player_status>.shake_notes)
			Change StructureName = <other_player_status> shake_notes = -1
			break
		endif
		Wait \{1
			GameFrame}
		repeat
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script flicker_gems 
	begin
	if ($<other_player_status>.shake_notes > -1)
		LaunchGemEvent Event = flicker_on Player = <Player>
	else
		LaunchGemEvent Event = flicker_off Player = <Player>
		break
	endif
	Wait \{3
		GameFrames}
	repeat
endscript

script shake_highway 
	FormatText ChecksumName = container_id 'gem_container%p' P = <player_Text> AddToStringLookup = TRUE
	GetScreenElementPosition Id = <container_id>
	original_position = <ScreenELementPos>
	shake_frequency = 0.05
	begin
	if (<player_Text> = 'p1')
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		GetScreenElementPosition Id = <container_id>
		original_position = <ScreenELementPos>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	pulse_on = 0
	begin
	if ($<other_player_status>.shake_notes > -1)
		if (<pulse_on> = 0)
			DoScreenElementMorph {
				Id = <container_id>
				Pos = (<original_position> + (0.0, 8.0))
				just = [Center Bottom]
				Time = <shake_frequency>
			}
			Wait <shake_frequency> Seconds
			<pulse_on> = 1
		else
			DoScreenElementMorph {
				Id = <container_id>
				Pos = (<original_position> - (0.0, 8.0))
				just = [Center Bottom]
				Time = <shake_frequency>
			}
			Wait <shake_frequency> Seconds
			<pulse_on> = 0
		endif
	else
		DoScreenElementMorph {
			Id = <container_id>
			Pos = <original_position>
			just = [Center Bottom]
		}
		break
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script shake_highway_death 
	FormatText ChecksumName = container_id 'gem_container%p' P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	GetScreenElementPosition Id = <container_id>
	original_position = <ScreenELementPos>
	shake_frequency = 0.05
	begin
	if (<player_Text> = 'p1')
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		GetScreenElementPosition Id = <container_id>
		original_position = <ScreenELementPos>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	pulse_on = 0
	begin
	if (<pulse_on> = 0)
		DoScreenElementMorph {
			Id = <container_id>
			Pos = (<original_position> + (7.0, 0.0))
			just = [Center Bottom]
			Time = <shake_frequency>
		}
		Wait <shake_frequency> Seconds
		<pulse_on> = 1
	else
		DoScreenElementMorph {
			Id = <container_id>
			Pos = (<original_position> - (7.0, 0.0))
			just = [Center Bottom]
			Time = <shake_frequency>
		}
		Wait <shake_frequency> Seconds
		<pulse_on> = 0
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script hammer_highway \{push_p1 = (-70.0, 50.0)
		push_p2 = (70.0, 50.0)
		Time = 0.1}
	if (<other_player_text> = 'p1')
		push_pos = <push_p1>
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		push_pos = <push_p2>
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		if (<other_player_text> = 'p1')
			Change \{battle_p1_highway_hammer = 1}
		else
			Change \{battle_p2_highway_hammer = 1}
		endif
		FormatText ChecksumName = container_id 'gem_container%p' P = <other_player_text> AddToStringLookup = TRUE
		GetScreenElementPosition Id = <container_id>
		original_position = <ScreenELementPos>
		DoScreenElementMorph {
			Id = <container_id>
			Pos = (<original_position> + <push_pos>)
			just = [Center Bottom]
			Time = <Time>
		}
		Wait <Time> Seconds
		DoScreenElementMorph {
			Id = <container_id>
			Pos = <original_position>
			just = [Center Bottom]
			Time = <Time>
		}
		Wait <Time> Seconds
		if (<other_player_text> = 'p1')
			Change \{battle_p1_highway_hammer = 0}
		else
			Change \{battle_p2_highway_hammer = 0}
		endif
	endif
endscript

script hammer_rock_meter 
	if (<other_player_text> = 'p1')
		push_pos = (-75.0, 50.0)
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		push_pos = (70.0, 50.0)
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		if (<other_player_text> = 'p1')
			Change \{battle_p1_highway_hammer = 1}
		else
			Change \{battle_p2_highway_hammer = 1}
		endif
		FormatText ChecksumName = container_id 'HUD2D_rock_container%p' P = <other_player_text> AddToStringLookup = TRUE
		GetScreenElementPosition Id = <container_id>
		original_position = <ScreenELementPos>
		DoScreenElementMorph {
			Id = <container_id>
			Pos = (<original_position> + <push_pos>)
			just = [Center Bottom]
			Time = 0.1
		}
		Wait \{0.1
			Seconds}
		DoScreenElementMorph {
			Id = <container_id>
			Pos = <original_position>
			just = [Center Bottom]
			Time = 0.1
		}
		if (<other_player_text> = 'p1')
			Change \{battle_p1_highway_hammer = 0}
		else
			Change \{battle_p2_highway_hammer = 0}
		endif
	endif
endscript

script shake_rock_meter 
	shake_ammount = (3.0, 0.0)
	FormatText ChecksumName = container_id 'HUD2D_rock_container%p' P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	GetScreenElementPosition Id = <container_id>
	original_position = <ScreenELementPos>
	begin
	DoScreenElementMorph {
		Id = <container_id>
		Pos = (<original_position> + <shake_ammount>)
		just = [Center Bottom]
		Time = 0.1
	}
	Wait \{0.1
		Seconds}
	DoScreenElementMorph {
		Id = <container_id>
		Pos = (<original_position> - <shake_ammount>)
		just = [Center Bottom]
		Time = 0.1
	}
	Wait \{0.1
		Seconds}
	repeat
endscript

script battle_up_difficulty 
	if ($<other_player_status>.Player = 1)
		SpawnScript GH_BattleMode_Player1_SFX_DiffUp_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	else
		SpawnScript GH_BattleMode_Player2_SFX_DiffUp_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	endif
	if (<DIFFICULTY> = EXPERT)
		battle_double_notes <...>
		return
	endif
	if NOT ($<other_player_status>.diffup_notes = -1)
		Change StructureName = <other_player_status> diffup_notes = ($<other_player_status>.diffup_notes + <drain_time>)
		return
	endif
	GetSongTimeMS
	CastToInteger \{Time}
	Change StructureName = <other_player_status> diffup_notes = (<Time> + <drain_time>)
	update_hud_difficulty_up other_player_status = <other_player_status> DIFFICULTY = <DIFFICULTY>
	hold_difficulty_up = ($<other_player_status>.hold_difficulty_up)
	begin
	GetSongTimeMS
	CastToInteger \{Time}
	if (<Time> > <hold_difficulty_up>)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	ExtendCRC change_difficulty <player_Text> out = Type
	original_difficulty = <DIFFICULTY>
	switch <DIFFICULTY>
		case EASY
		BroadCastEvent Type = <Type> Data = {DIFFICULTY = MEDIUM difficulty_text_nl = 'medium'}
		case MEDIUM
		BroadCastEvent Type = <Type> Data = {DIFFICULTY = HARD difficulty_text_nl = 'hard'}
		case HARD
		BroadCastEvent Type = <Type> Data = {DIFFICULTY = EXPERT difficulty_text_nl = 'expert'}
	endswitch
	GetSongTimeMS
	CastToInteger \{Time}
	Change StructureName = <other_player_status> diffup_notes = (<Time> + <drain_time>)
	begin
	GetSongTimeMS
	if (<Time> > $<other_player_status>.diffup_notes)
		Printf \{"end battle"}
		ExtendCRC change_difficulty <player_Text> out = Type
		original_difficulty = <DIFFICULTY>
		switch <original_difficulty>
			case EASY
			BroadCastEvent Type = <Type> Data = {DIFFICULTY = EASY difficulty_text_nl = 'easy'}
			case MEDIUM
			BroadCastEvent Type = <Type> Data = {DIFFICULTY = MEDIUM difficulty_text_nl = 'medium'}
			case HARD
			BroadCastEvent Type = <Type> Data = {DIFFICULTY = HARD difficulty_text_nl = 'hard'}
		endswitch
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	Change StructureName = <other_player_status> diffup_notes = -1
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_double_notes 
	if ($<other_player_status>.Player = 1)
		SpawnScript GH_BattleMode_Player1_SFX_DoubleNotes_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	else
		SpawnScript GH_BattleMode_Player2_SFX_DoubleNotes_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	endif
	if NOT ($<other_player_status>.double_notes = -1)
		Change StructureName = <other_player_status> double_notes = ($<other_player_status>.double_notes + <drain_time>)
		return
	endif
	GetSongTimeMS
	CastToInteger \{Time}
	Change StructureName = <other_player_status> double_notes = (<Time> + <drain_time>)
	update_hud_double_notes other_player_status = <other_player_status>
	begin
	GetSongTimeMS
	if (<Time> > $<other_player_status>.double_notes)
		Printf \{"end battle"}
		Change StructureName = <other_player_status> double_notes = -1
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_steal 
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
	Change StructureName = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup + 1)
	animate_steal start_pos = <start_pos> morph_to_pos = <morph_to_pos> player_status = <player_status> other_player_status = <other_player_status>
	Change StructureName = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup - 1)
endscript

script animate_steal 
	if ($<other_player_status>.Player = 1)
		hand_scale = (-1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (-40.0, 0.0)
	else
		hand_scale = (1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (40.0, 0.0)
	endif
	FormatText ChecksumName = steal_hand_open_checksum 'steal_hand_open_%i_%p' I = ($<other_player_status>.stealing_powerup) P = ($<other_player_status>.Player)
	if ScreenElementExists Id = <steal_hand_open_checksum>
		DestroyScreenElement Id = <steal_hand_open_checksum>
	endif
	FormatText ChecksumName = steal_hand_checksum 'steal_hand_%i_%p' I = ($<other_player_status>.stealing_powerup) P = ($<other_player_status>.Player)
	Wait \{1
		GameFrame}
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
	if NOT ($<other_player_status>.current_num_powerups = 0)
		if ($<other_player_status>.Player = 1)
			SELECT = ($current_powerups_p1 [($<other_player_status>.current_num_powerups - 1)])
		else
			SELECT = ($current_powerups_p2 [($<other_player_status>.current_num_powerups - 1)])
		endif
		FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<other_player_status>.current_num_powerups - 1) S = ($<other_player_status>.Player)
		if ScreenElementExists Id = <card_checksum>
			DestroyScreenElement Id = <card_checksum>
		endif
		Change StructureName = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		Printf "animate_steal - decremented p%n's current_num_powerups to %a" N = ($<other_player_status>.Player) A = ($<other_player_status>.current_num_powerups)
		update_battlecards_remove player_status = <other_player_status>
		GetSongTimeMS
		FormatText ChecksumName = held_card_checksum 'held_battlecard_%i_%s_%t' I = ($<other_player_status>.current_num_powerups - 1) S = ($<other_player_status>.Player) T = <Time>
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
		DoScreenElementMorph {
			Id = <steal_hand_checksum>
			Alpha = 0
			Time = 0.1
		}
		Wait \{0.1
			Seconds}
		if ScreenElementExists Id = <held_card_checksum>
			DestroyScreenElement Id = <held_card_checksum>
		endif
		if ScreenElementExists Id = <steal_hand_checksum>
			DestroyScreenElement Id = <steal_hand_checksum>
		endif
		battlemode_ready player_status = <player_status> battle_gem = <SELECT> steal = 1
	endif
endscript

script battle_lefty_notes 
	if ($<other_player_status>.Player = 1)
		SpawnScript GH_BattleMode_Player1_SFX_LeftyNotes_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	else
		SpawnScript GH_BattleMode_Player2_SFX_LeftyNotes_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	endif
	if NOT ($<other_player_status>.lefty_notes = -1)
		Change StructureName = <other_player_status> lefty_notes = ($<other_player_status>.lefty_notes + <drain_time>)
		return
	endif
	Change StructureName = <other_player_status> lefthanded_gems_flip_save = ($<other_player_status>.lefthanded_gems)
	Change StructureName = <other_player_status> lefthanded_button_ups_flip_save = ($<other_player_status>.lefthanded_button_ups)
	Change StructureName = <other_player_status> lefthanded_gems = (1 + $<other_player_status>.lefthanded_gems * -1)
	GetSongTimeMS
	CastToInteger \{Time}
	Change StructureName = <other_player_status> lefty_notes = (<Time> + <drain_time>)
	start_time = (<Time> + (($<other_player_status>.scroll_time - $destroy_time) * 1000.0))
	end_time = -1
	update_hud_lefty_notes other_player_status = <other_player_status>
	begin
	GetSongTimeMS
	if NOT (<start_time> = -1)
		if (<Time> > (<start_time> - 500))
			animate_lefty_flip other_player_status = <other_player_status> player_Text = <player_Text>
			Change StructureName = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
			start_time = -1
		endif
	endif
	if (<Time> > $<other_player_status>.lefty_notes)
		Printf \{"end battle"}
		end_time = (<Time> + (($<other_player_status>.scroll_time - $destroy_time) * 1000.0))
		Change StructureName = <other_player_status> lefthanded_gems = (1 + $<other_player_status>.lefthanded_gems * -1)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	begin
	GetSongTimeMS
	if NOT (<start_time> = -1)
		if (<Time> > <start_time>)
			animate_lefty_flip other_player_status = <other_player_status> player_Text = <player_Text>
			Change StructureName = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
			start_time = -1
		endif
	endif
	if (<Time> > (<end_time> - 500))
		animate_lefty_flip other_player_status = <other_player_status> player_Text = <player_Text>
		Change StructureName = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
		Change StructureName = <other_player_status> lefty_notes = -1
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_whammy_attack 
	repair_ammount = 5
	switch <DIFFICULTY>
		case EASY
		<repair_ammount> = ($battlemode_powerups [6].easy_repair)
		case MEDIUM
		<repair_ammount> = ($battlemode_powerups [6].medium_repair)
		case HARD
		<repair_ammount> = ($battlemode_powerups [6].hard_repair)
		case EXPERT
		<repair_ammount> = ($battlemode_powerups [6].expert_repair)
	endswitch
	if ($<other_player_status>.Player = 1)
		SpawnScript GH_BattleMode_Player1_SFX_Whammy_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	else
		SpawnScript GH_BattleMode_Player2_SFX_Whammy_Start Params = {holdtime = (<drain_time> / 1000.0)} Id = battlemode
	endif
	if ($<other_player_status>.whammy_attack < 1)
		Change StructureName = <other_player_status> whammy_attack = <repair_ammount>
		whammy_on = 0
		shake_on = 0
		frame_count = 0
		shake_frequency = 1
		mask = 65536
		Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 4096
		Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 256
		Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 16
		Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 1
		Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		update_training_whammy_bar other_player_status = <other_player_status>
		if ($<other_player_status>.is_local_client)
			begin
			if ($<other_player_status>.whammy_attack = 0)
				break
			endif
			if GuitarGetAnalogueInfo controller = ($<other_player_status>.controller)
				if IsGuitarController controller = ($<other_player_status>.controller)
					<len> = ((<RightX> + 1.0) / 2.0)
				else
					if (<leftlength> > 0)
						<len> = <leftlength>
					else
						if (<rightlength> > 0)
							<len> = <rightlength>
						else
							<len> = 0
						endif
					endif
				endif
			else
				<len> = 0
			endif
			if ($boss_battle = 1 &&
					<other_player_status>.Player = 2)
				GetSongTimeMS
				if (<Time> - $boss_lastwhammytime > $current_boss.WhammySpeed.($current_difficulty))
					len = 0.5
					Change boss_lastwhammytime = <Time>
				else
					len = 0
				endif
			endif
			if (<len> >= 0.5)
				if (<whammy_on> = 0)
					Change StructureName = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack - 1)
					GH3_Battle_Play_Whammy_Pitch_Up_Sound <...>
					if ($<other_player_status>.whammy_attack <= 5)
						<shake_frequency> = (<shake_frequency> + 1)
					endif
					if (($is_network_game) && ($<other_player_status>.whammy_attack <= 5))
						SendNetMessage {Type = whammy_attack_update whammy_count = ($<other_player_status>.whammy_attack)}
					endif
					<whammy_on> = 1
				endif
			else
				if (<whammy_on> = 1)
					<whammy_on> = 0
				endif
			endif
			Wait \{1
				GameFrame}
			repeat
		else
			net_whammy_attack player_Text = <player_Text> other_player_status = <other_player_status> DIFFICULTY = <DIFFICULTY>
		endif
		GetArraySize \{$gem_colors}
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if ($<other_player_status>.<broken_string_id> = 0)
			switch <array_count>
				case 0
				mask = 4369
				Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 1
				mask = 65809
				Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 2
				mask = 69649
				Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 3
				mask = 69889
				Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 4
				mask = 69904
				Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
			endswitch
		endif
		array_count = (<array_count> + 1)
		repeat <array_Size>
		Change StructureName = <other_player_status> whammy_attack = -1
		GuitarEvent_BattleAttackFinished <...>
	else
		if ($<other_player_status>.whammy_attack < 15)
			Change StructureName = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack + <repair_ammount>)
		endif
	endif
endscript

script break_string 
	Color = ($gem_colors [<Id>])
	if ($<other_player_status>.lefthanded_button_ups = 1)
		begin_pos = (($button_up_models.<Color>.left_pos_2d) + (0.0, 40.0))
	else
		begin_pos = (($button_up_models.<Color>.pos_2d) + (0.0, 40.0))
	endif
	string_rotation = 0
	switch <Id>
		case 0
		<string_rotation> = 14
		case 1
		<string_rotation> = 7
		case 2
		<string_rotation> = -2
		case 3
		<string_rotation> = -10
		case 4
		<string_rotation> = -19
	endswitch
	if ($<other_player_status>.Player = 1)
		<begin_pos> = (<begin_pos> - (230.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (230.0, 0.0))
	endif
	FormatText ChecksumName = Name 'String_break_%p' P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	if ScreenElementExists Id = <Name>
		DestroyScreenElement Id = <Name>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <Name>
		PARENT = battlemode_container
		Material = sys_BM_Snap01_sys_BM_Snap01
		rgba = [200 200 200 200]
		Pos = (<begin_pos>)
		Scale = (1.3, 1.6)
		Rot_Angle = <string_rotation>
		just = [Center Bottom]
		z_priority = 2
	}
	if ($<other_player_status>.lefthanded_button_ups = 1)
		switch <Color>
			case Green
			<Color> = Orange
			case RED
			<Color> = BLUE
			case Yellow
			<Color> = Yellow
			case BLUE
			<Color> = RED
			case Orange
			<Color> = Green
		endswitch
	endif
	FormatText ChecksumName = name_string '%s_string%p' S = ($button_up_models.<Color>.name_string) P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	if ScreenElementExists Id = <name_string>
		DoScreenElementMorph {
			Id = <name_string>
			Alpha = 0
		}
	endif
	Wait \{15
		GameFrame}
	if ScreenElementExists Id = <Id>
		DestroyScreenElement Id = <Id>
	endif
endscript

script repair_string 
	Color = ($gem_colors [<Id>])
	if ($<other_player_status>.lefthanded_button_ups = 1)
		switch <Color>
			case Green
			<Color> = Orange
			case RED
			<Color> = BLUE
			case Yellow
			<Color> = Yellow
			case BLUE
			<Color> = RED
			case Orange
			<Color> = Green
		endswitch
	endif
	FormatText ChecksumName = name_string '%s_string%p' S = ($button_up_models.<Color>.name_string) P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	if ScreenElementExists Id = <name_string>
		DoScreenElementMorph {
			Id = <name_string>
			Alpha = 1
		}
	endif
endscript

script battle_broken_string 
	if (($is_network_game = 1) && ($<other_player_status>.Player = 1))
		if NOT GotParam \{string_to_break}
			return
		endif
	endif
	repair_ammount = 5
	switch <DIFFICULTY>
		case EASY
		<repair_ammount> = ($battlemode_powerups [5].easy_repair)
		case MEDIUM
		<repair_ammount> = ($battlemode_powerups [5].medium_repair)
		case HARD
		<repair_ammount> = ($battlemode_powerups [5].hard_repair)
		case EXPERT
		<repair_ammount> = ($battlemode_powerups [5].expert_repair)
	endswitch
	victim_is_local = 1
	if ($<other_player_status>.Player = 1)
		SpawnScript GH_BattleMode_Player1_SFX_BrokenString_Start Params = {holdtime = <drain_time>} Id = battlemode
	else
		if ($is_network_game)
			<victim_is_local> = 0
		endif
		SpawnScript GH_BattleMode_Player2_SFX_BrokenString_Start Params = {holdtime = <drain_time>} Id = battlemode
	endif
	if (<DIFFICULTY> = EASY)
		highest_value = 3
	else
		if (<DIFFICULTY> = MEDIUM)
			highest_value = 4
		else
			highest_value = 5
		endif
	endif
	if (($is_network_game) && ($<other_player_status>.Player = 1))
		X = <string_to_break>
	else
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
	Printf "breaking string %s" S = <X>
	SpawnScriptNow break_string Params = {Id = (<X> - 1) other_player_status = <other_player_status>}
	SpawnScriptNow update_broken_button Params = {Id = (<X> - 1) other_player_status = <other_player_status>}
	update_broken_string_arrows Id = (<X> - 1) other_player_status = <other_player_status>
	bail = 0
	if NOT ($<other_player_status>.broken_string_mask = 0)
		if ($<other_player_status>.whammy_attack < 1)
			<bail> = 1
		endif
	endif
	Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
	if (<bail>)
		return
	endif
	GetHeldPattern controller = ($<other_player_status>.controller) nobrokenstring
	total_broken_strings = 1
	GetArraySize \{$gem_colors}
	begin
	last_hold_pattern = <hold_pattern>
	GetHeldPattern controller = ($<other_player_status>.controller) nobrokenstring
	net_update_flags = 0
	if NOT (<last_hold_pattern> = <hold_pattern>)
		check_button = 65536
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if NOT (<last_hold_pattern> && <check_button>)
			if (<hold_pattern> && <check_button>)
				if NOT ($<other_player_status>.<broken_string_id> = 0)
					switch <array_count>
						case 0
						Change StructureName = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green - 1)
						mask = 4369
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_green) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
						if ($<other_player_status>.broken_string_green = 0)
							repair_string other_player_status = <other_player_status> Id = <array_count>
						endif
						case 1
						Change StructureName = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red - 1)
						mask = 65809
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_red) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
						if ($<other_player_status>.broken_string_red = 0)
							repair_string other_player_status = <other_player_status> Id = <array_count>
						endif
						case 2
						Change StructureName = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow - 1)
						mask = 69649
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_yellow) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
						if ($<other_player_status>.broken_string_yellow = 0)
							repair_string other_player_status = <other_player_status> Id = <array_count>
						endif
						case 3
						Change StructureName = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue - 1)
						mask = 69889
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_blue) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
						if ($<other_player_status>.broken_string_blue = 0)
							repair_string other_player_status = <other_player_status> Id = <array_count>
						endif
						case 4
						Change StructureName = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange - 1)
						mask = 69904
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_orange) player_pan = ($<other_player_status>.Player) DIFFICULTY = <DIFFICULTY>
						if ($<other_player_status>.broken_string_orange = 0)
							repair_string other_player_status = <other_player_status> Id = <array_count>
						endif
					endswitch
					if ($<other_player_status>.<broken_string_id> = 0)
						if ($<other_player_status>.whammy_attack < 1)
							Wait \{1
								GameFrame}
							Change StructureName = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
						endif
					endif
				endif
				total_broken_strings = ($<other_player_status>.broken_string_green +
					$<other_player_status>.broken_string_red +
					$<other_player_status>.broken_string_yellow +
					$<other_player_status>.broken_string_blue +
					$<other_player_status>.broken_string_orange)
			endif
		endif
		<check_button> = (<check_button> / 16)
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	if ($is_network_game)
		if NOT (<net_update_flags> = 0)
			if NOT ($<other_player_status>.highway_layout = solo_highway)
				SendNetMessage {
					Type = repair_string
					flags = <net_update_flags>
				}
			endif
		endif
	endif
	if (<total_broken_strings> = 0)
		break
	endif
	if ($boss_battle = 1 &&
			<other_player_status>.Player = 2)
		if ($<other_player_status>.whammy_attack < 1)
			GetSongTimeMS
			if (<Time> - $boss_lastbrokenstringtime > $current_boss.BrokenStringSpeed.($current_difficulty))
				Change boss_pattern = ($<other_player_status>.broken_string_mask)
				Change boss_lastbrokenstringtime = <Time>
			else
				Change \{boss_pattern = 0}
			endif
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
	if ($<other_player_status>.whammy_attack < 1)
		Change StructureName = <other_player_status> broken_string_mask = 0
	endif
	GuitarEvent_BattleAttackFinished <...>
endscript

script animate_lefty_flip 
	GetArraySize \{$gem_colors}
	array_count = 0
	ExtendCRC button_up_pixel_array ($<other_player_status>.Text) out = pixel_array
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	FormatText ChecksumName = name_base '%s_base%p' S = ($button_up_models.<Color>.name_string) P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	if ($<other_player_status>.lefthanded_button_ups = 1)
		start_bottom_bar_pos = ($button_up_models.<Color>.left_pos_2d)
		end_bottom_bar_pos = ($button_up_models.<Color>.pos_2d)
	else
		start_bottom_bar_pos = ($button_up_models.<Color>.pos_2d)
		end_bottom_bar_pos = ($button_up_models.<Color>.left_pos_2d)
	endif
	GetScreenElementPosition Id = <name_base>
	bottom_bar_offset = (<end_bottom_bar_pos> - <start_bottom_bar_pos>)
	<bottom_bar_pos> = (<ScreenELementPos> + <bottom_bar_offset> - (<pixels> * (0.0, 1.0)))
	DoScreenElementMorph {
		Id = <name_base>
		Pos = (<bottom_bar_pos>)
		just = [Center Center]
		Time = 0.15
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Wait \{0.15
		Seconds}
	<array_count> = 0
	begin
	Color = ($gem_colors [<array_count>])
	FormatText ChecksumName = name_base '%s_base%p' S = ($button_up_models.<Color>.name_string) P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	DoScreenElementMorph {
		Id = <name_base>
		Pos = (0.0, 0.0)
		just = [Center Center]
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script update_training_whammy_bar 
	FormatText ChecksumName = training_whammy_checksum 'training_whammy_bar_%s' S = ($<other_player_status>.Player)
	FormatText ChecksumName = training_whammy_text_checksum 'training_whammy_bar_text_%s' S = ($<other_player_status>.Player)
	if ScreenElementExists Id = <training_whammy_checksum>
		DestroyScreenElement Id = <training_whammy_checksum>
	endif
	if ScreenElementExists Id = <training_whammy_text_checksum>
		DestroyScreenElement Id = <training_whammy_text_checksum>
	endif
	if ($<other_player_status>.Player = 1)
		player_offset = (0.0, 0.0)
	else
		player_offset = (450.0, 0.0)
	endif
	training_whammy_pos = ((610.0, 700.0) + <player_offset>)
	training_whammy_angle = -25
	CreateScreenElement {
		Type = SpriteElement
		Id = <training_whammy_checksum>
		PARENT = battlemode_container
		texture = battle_hud_whammy_bar
		rgba = [255 255 255 255]
		Pos = <training_whammy_pos>
		Rot_Angle = <training_whammy_angle>
		Scale = 0.8
		Alpha = 1
		just = [Center Bottom]
		z_priority = 6
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <training_whammy_checksum>
		Id = <training_whammy_text_checksum>
		Pos = (120.0, 145.0)
		Text = "WHAMMY"
		Rot_Angle = 53
		font = text_a4
		rgba = [255 255 255 255]
		just = [Center Bottom]
		Scale = 1.2
		z_priority = 7
	}
	SpawnScriptNow animate_whammy_bar Params = {Id = <training_whammy_checksum> other_player_status = <other_player_status> training_whammy_pos = <training_whammy_pos> training_whammy_angle = <training_whammy_angle>}
endscript

script animate_whammy_bar 
	pulse_on = 0
	begin
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	FormatText ChecksumName = name_base '%s_base%p' S = ($button_up_models.<Color>.name_string) P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	original_bottom_bar_pos = (0.0, 0.0)
	bottom_bar_pos = (<original_bottom_bar_pos> - ((0.0, 15.0) * ($<other_player_status>.whammy_attack)))
	if NOT ($<other_player_status>.whammy_attack < 1)
		if (<pulse_on> = 0)
			DoScreenElementMorph {
				Id = <name_base>
				Alpha = 0.5
				Pos = (<bottom_bar_pos> + (0.0, 5.0))
				just = [Center Center]
				Time = 0.15
			}
		else
			DoScreenElementMorph {
				Id = <name_base>
				Alpha = 0.5
				Pos = (<bottom_bar_pos> - (0.0, 5.0))
				just = [Center Center]
				Time = 0.15
			}
		endif
	else
		DoScreenElementMorph {
			Id = <name_base>
			Alpha = 1
			Pos = (<original_bottom_bar_pos> + (0.0, 30.0))
			just = [Center Center]
			Time = 0.15
		}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	training_whammy_pos_new = (<training_whammy_pos> - ((0.0, 15.0) * ($<other_player_status>.whammy_attack)))
	DoScreenElementMorph {
		Id = <Id>
		Pos = <training_whammy_pos_new>
		Time = 0.15
	}
	if NOT ($<other_player_status>.whammy_attack < 1)
		if (<pulse_on> = 0)
			DoScreenElementMorph {
				Id = <Id>
				Rot_Angle = (<training_whammy_angle> - 20)
				just = [Center Bottom]
				Time = 0.15
			}
			<pulse_on> = 1
		else
			DoScreenElementMorph {
				Id = <Id>
				Rot_Angle = <training_whammy_angle>
				just = [Center Bottom]
				Time = 0.15
			}
			<pulse_on> = 0
		endif
	else
		DoScreenElementMorph {
			Id = <Id>
			Rot_Angle = <training_whammy_angle>
			just = [Center Bottom]
			Alpha = 0
			Time = 0.3
		}
		Wait \{0.15
			Seconds}
		GetArraySize \{$gem_colors}
		array_count = 0
		begin
		Color = ($gem_colors [<array_count>])
		FormatText ChecksumName = name_base '%s_base%p' S = ($button_up_models.<Color>.name_string) P = ($<other_player_status>.Text) AddToStringLookup = TRUE
		DoScreenElementMorph {
			Id = <name_base>
			Alpha = 1
			Pos = <original_bottom_bar_pos>
			just = [Center Center]
			Time = 0.1
		}
		array_count = (<array_count> + 1)
		repeat <array_Size>
		break
	endif
	Wait \{0.15
		Seconds}
	repeat
endscript

script update_broken_button 
	broken_string_id = ($broken_strings [<Id>])
	Color = ($gem_colors [<Id>])
	button_up_name = ($button_up_models.<Color>.Name)
	ExtendCRC button_up_pixel_array ($<other_player_status>.Text) out = pixel_array
	<player_Text> = ($<other_player_status>.Text)
	begin
	<num_hammers> = 0
	if NOT ($<other_player_status>.<broken_string_id> = 0)
		switch <Id>
			case 0
			<num_hammers> = ($<other_player_status>.broken_string_green)
			case 1
			<num_hammers> = ($<other_player_status>.broken_string_red)
			case 2
			<num_hammers> = ($<other_player_status>.broken_string_yellow)
			case 3
			<num_hammers> = ($<other_player_status>.broken_string_blue)
			case 4
			<num_hammers> = ($<other_player_status>.broken_string_orange)
		endswitch
	endif
	if (<num_hammers> = 0)
		break
	endif
	<up_pixels> = (<num_hammers> * 5)
	SetArrayElement ArrayName = <pixel_array> GlobalArray Index = <Id> NewValue = <up_pixels>
	Wait \{1
		GameFrame}
	repeat
endscript

script update_broken_string_arrows 
	broken_string_id = ($broken_strings [<Id>])
	string_id = <Id>
	FormatText ChecksumName = arrow_checksum 'broken_string_arrow_%i_%s' I = <Id> S = ($<other_player_status>.Player)
	FormatText ChecksumName = text_checksum 'broken_string_text_%i_%s' I = <Id> S = ($<other_player_status>.Player)
	if ScreenElementExists Id = <arrow_checksum>
		DestroyScreenElement Id = <arrow_checksum>
	endif
	if ScreenElementExists Id = <text_checksum>
		DestroyScreenElement Id = <text_checksum>
	endif
	FormatText ChecksumName = container_id 'gem_container%p' P = ($<other_player_status>.Text) AddToStringLookup = TRUE
	Color = ($gem_colors [<Id>])
	arrow_pos = (($button_up_models.<Color>.pos_2d) - (0.0, 30.0))
	lefty_arrow_pos = (($button_up_models.<Color>.left_pos_2d) - (0.0, 30.0))
	if ($<other_player_status>.Player = 1)
		<arrow_pos> = (<arrow_pos> - (225.0, 0.0))
		<lefty_arrow_pos> = (<lefty_arrow_pos> - (225.0, 0.0))
	else
		<arrow_pos> = (<arrow_pos> + (225.0, 0.0))
		<lefty_arrow_pos> = (<lefty_arrow_pos> + (225.0, 0.0))
	endif
	if ($<other_player_status>.lefthanded_button_ups = 1)
		start_pos = <lefty_arrow_pos>
	else
		start_pos = <arrow_pos>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <arrow_checksum>
		PARENT = battlemode_container
		texture = battle_hud_arrow
		rgba = [255 255 255 255]
		Pos = <start_pos>
		Alpha = 1
		Scale = 0.3
		just = [Center Bottom]
		z_priority = 7
	}
	GetScreenElementDims Id = <arrow_checksum>
	x_offset = (<width> / 2)
	CreateScreenElement {
		Type = TextElement
		PARENT = <arrow_checksum>
		Id = <text_checksum>
		Pos = ((53.0, 150.0) + (<x_offset> * (1.0, 0.0)))
		Text = "PUSH"
		font = text_a4
		rgba = [255 255 255 255]
		just = [Center Bottom]
		Scale = 2
		z_priority = 8
	}
	SpawnScriptNow animate_arrow Params = {broken_string_id = <broken_string_id> string_id = <string_id> arrow_id = <arrow_checksum> other_player_status = <other_player_status> broken_string_id = <broken_string_id> arrow_pos = <arrow_pos> lefty_arrow_pos = <lefty_arrow_pos>}
endscript

script animate_arrow 
	pulse_on = 0
	begin
	<num_hammers> = 0
	if NOT ($<other_player_status>.<broken_string_id> = 0)
		switch <string_id>
			case 0
			<num_hammers> = ($<other_player_status>.broken_string_green)
			case 1
			<num_hammers> = ($<other_player_status>.broken_string_red)
			case 2
			<num_hammers> = ($<other_player_status>.broken_string_yellow)
			case 3
			<num_hammers> = ($<other_player_status>.broken_string_blue)
			case 4
			<num_hammers> = ($<other_player_status>.broken_string_orange)
		endswitch
	endif
	<up_pixels> = (<num_hammers> * 5)
	if NOT ($<other_player_status>.lefthanded_button_ups = 1)
		animate_pos = <arrow_pos>
	else
		animate_pos = <lefty_arrow_pos>
	endif
	<animate_pos> = (<animate_pos> - ((0.0, 1.0) * <up_pixels>))
	if NOT ($<other_player_status>.whammy_attack < 1)
		<animate_pos> = (<animate_pos> - ((0.0, 15.0) * ($<other_player_status>.whammy_attack)))
	endif
	if NOT ($<other_player_status>.<broken_string_id> = 0)
		if (<pulse_on> = 0)
			if ScreenElementExists Id = <arrow_id>
				DoScreenElementMorph {
					Id = <arrow_id>
					Pos = (<animate_pos> - (0.0, 10.0))
					just = [Center Bottom]
					Time = 0.1
				}
			endif
			Wait \{0.1
				Seconds}
			<pulse_on> = 1
		else
			if ScreenElementExists Id = <arrow_id>
				DoScreenElementMorph {
					Id = <arrow_id>
					Pos = <animate_pos>
					just = [Center Bottom]
					Time = 0.1
				}
			endif
			Wait \{0.1
				Seconds}
			<pulse_on> = 0
		endif
		<frame_count> = 0
	else
		if ScreenElementExists Id = <arrow_id>
			DoScreenElementMorph {
				Id = <arrow_id>
				Pos = <animate_pos>
				just = [Center Bottom]
				Alpha = 0
				Time = 0.3
			}
		endif
		Wait \{0.3
			Seconds}
		if ScreenElementExists Id = <arrow_id>
			DestroyScreenElement Id = <arrow_id>
		endif
		break
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script create_battlemode_highway_effects 
	Player = 1
	begin
	if (<Player> = 1)
		player_Text = 'p1'
	else
		player_Text = 'p2'
	endif
	lpos = (($sidebar_x * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	langle = ($sidebar_angle)
	rpos = ((((640.0 - $sidebar_x) + 640.0) * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle))
	Scale = (($sidebar_x_scale * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	rscale = (((0 - $sidebar_x_scale) * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	FormatText ChecksumName = container_id 'gem_container%p' P = <player_Text> AddToStringLookup = TRUE
	FormatText ChecksumName = cont 'battle_sidebar_container_left%p' P = <player_Text> AddToStringLookup = TRUE
	if ScreenElementExists Id = <cont>
		DestroyScreenElement Id = <cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		Id = <cont>
		PARENT = <container_id>
		Pos = <lpos>
		Rot_Angle = <langle>
		just = [Center Bottom]
		z_priority = 0
	}
	starpower_pos = (((-55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	FormatText ChecksumName = Name 'battle_sidebar_left_glow%p' P = <player_Text> AddToStringLookup = TRUE
	CreateScreenElement {
		Type = SpriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		Pos = <starpower_pos>
		Scale = <starpower_scale>
		just = [Center Bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	FormatText ChecksumName = Name 'battle_sidebar_left_Lightning01%p' P = <player_Text> AddToStringLookup = TRUE
	CreateScreenElement {
		Type = SpriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [0 0 128 128]
		Pos = <starpower_pos>
		Rot_Angle = (180)
		Scale = <starpower_scale>
		just = [Center Top]
		z_priority = 0
	}
	FormatText ChecksumName = cont 'battle_sidebar_container_right%p' P = <player_Text> AddToStringLookup = TRUE
	if ScreenElementExists Id = <cont>
		DestroyScreenElement Id = <cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		Id = <cont>
		PARENT = <container_id>
		Pos = <rpos>
		Rot_Angle = <rangle>
		just = [Center Bottom]
		z_priority = 0
	}
	starpower_pos = (((55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	FormatText ChecksumName = Name 'battle_sidebar_Right_glow%p' P = <player_Text> AddToStringLookup = TRUE
	CreateScreenElement {
		Type = SpriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		Pos = <starpower_pos>
		Scale = <starpower_scale>
		just = [Center Bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	FormatText ChecksumName = Name 'battle_sidebar_Right_Lightning01%p' P = <player_Text> AddToStringLookup = TRUE
	CreateScreenElement {
		Type = SpriteElement
		Id = <Name>
		PARENT = <cont>
		Material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [0 0 128 128]
		Pos = <starpower_pos>
		Rot_Angle = (180)
		Scale = <starpower_scale>
		just = [Center Top]
		z_priority = 0
	}
	Player = (<Player> + 1)
	repeat 2
endscript

script battlemode_fill 
	battlemode_ready \{battle_gem = 1
		player_status = player1_status}
	battlemode_ready \{battle_gem = 1
		player_status = player1_status}
	battlemode_ready \{battle_gem = 1
		player_status = player1_status}
	battlemode_ready \{battle_gem = 1
		player_status = player2_status}
	battlemode_ready \{battle_gem = 1
		player_status = player2_status}
	battlemode_ready \{battle_gem = 1
		player_status = player2_status}
endscript

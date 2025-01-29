battle_easy_drain_offset = 0
battle_medium_drain_offset = 1500
battle_hard_drain_offset = 3000
battle_expert_drain_offset = 4500
battlecard_unique_index = 0
disable_attacks = 0
battlemode_powerups = [
	{
		Name = Lightning
		name_text = qs(0xd5c138b1)
		weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_lightning
		params = {
		}
		card_texture = icon_attack_blast
		easy_flicker = 2
		medium_flicker = 2
		hard_flicker = 3
		expert_flicker = 3
		drain_time = 7500
		immediate = 1
		fire_bolt = 1
	}
	{
		Name = DifficultyUp
		name_text = qs(0x7a50524a)
		weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_up_difficulty
		params = {
		}
		card_texture = icon_attack_difficulty
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = DoubleNotes
		name_text = qs(0x143553a1)
		weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_double_notes
		params = {
		}
		card_texture = icon_attack_addnote
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = PowerUpSteal
		name_text = qs(0x7cfae6eb)
		weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_steal
		params = {
		}
		card_texture = icon_attack_drain
		drain_time = 5000
		fire_bolt = 0
	}
	{
		Name = LeftyNotes
		name_text = qs(0x83adf584)
		alt_name_text = qs(0x7d9862d3)
		weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_lefty_notes
		params = {
		}
		card_texture = icon_attack_leftyrighty
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = BrokenString
		name_text = qs(0x2ffeaa2f)
		weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_broken_string
		params = {
		}
		card_texture = icon_attack_string
		easy_repair = 6
		medium_repair = 8
		hard_repair = 10
		expert_repair = 12
		drain_time = 5000
		immediate = 1
		fire_bolt = 1
	}
	{
		Name = WhammyAttack
		name_text = qs(0xeba6a878)
		weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_whammy_attack
		params = {
		}
		card_texture = icon_attack_whammy
		easy_repair = 3
		medium_repair = 4
		hard_repair = 5
		expert_repair = 6
		drain_time = 5000
		immediate = 1
		no_ai_damage = 1
		fire_bolt = 1
	}
	{
		Name = mines
		name_text = qs(0x8281e327)
		weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_mine_attack
		params = {
		}
		card_texture = icon_attack_explode
		drain_time = 5000
		fire_bolt = 1
	}
	{
		Name = blackout
		name_text = qs(0xf6040b1d)
		weight = 10
		weight_low = 0
		weight_losing = 10
		Scr = battle_blackout_attack
		params = {
			easy_drain = 1000
		}
		card_texture = icon_attack_blackout
		drain_time = 850
		fire_bolt = 1
	}
]

script battlemode_init 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = battlemode_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	Change structurename = <player_status> battlemode_creation_selection = -1
	Change structurename = <player_status> current_num_powerups = 0
	Change structurename = <player_status> final_blow_powerup = -1
	Change structurename = <player_status> battle_text_count = 0
	Change structurename = <player_status> shake_notes = -1
	Change structurename = <player_status> double_notes = -1
	Change structurename = <player_status> mine_attack = -1
	Change structurename = <player_status> blackout_attack = -1
	Change structurename = <player_status> diffup_notes = -1
	Change structurename = <player_status> lefty_notes = -1
	Change structurename = <player_status> whammy_attack = -1
	Change structurename = <player_status> stealing_powerup = -1
	Change structurename = <player_status> last_selected_attack = -1
	Change structurename = <player_status> last_hit_note = None
	Change structurename = <player_status> broken_string_mask = 0
	Change structurename = <player_status> broken_string_green = 0
	Change structurename = <player_status> broken_string_red = 0
	Change structurename = <player_status> broken_string_yellow = 0
	Change structurename = <player_status> broken_string_blue = 0
	Change structurename = <player_status> broken_string_orange = 0
	Change structurename = <player_status> battle_num_attacks = 0
	Change structurename = <player_status> hold_difficulty_up = 0.0
	Player = (<Player> + 1)
	repeat 2
	Change \{current_battle_text_p1 = [
			id
			id
			id
		]}
	Change \{current_battle_text_p2 = [
			id
			id
			id
		]}
	Change \{battle_p1_highway_hammer = 0}
	Change \{battle_p2_highway_hammer = 0}
	Change \{disable_attacks = 0}
	Change \{net_attack_pending = 0}
endscript

script battlemode_deinit 
	Change \{disable_attacks = 1}
	KillSpawnedScript \{id = battlemode}
	Change structurename = <player_status> battlemode_creation_selection = -1
	Change structurename = <player_status> current_num_powerups = 0
	Change structurename = <player_status> battle_text_count = 0
	Change structurename = <player_status> shake_notes = -1
	Change structurename = <player_status> double_notes = -1
	Change structurename = <player_status> mine_attack = -1
	Change structurename = <player_status> blackout_attack = -1
	Change structurename = <player_status> diffup_notes = -1
	Change structurename = <player_status> lefty_notes = -1
	Change structurename = <player_status> whammy_attack = -1
	Change structurename = <player_status> stealing_powerup = -1
	Change structurename = <player_status> last_selected_attack = -1
	Change structurename = <player_status> last_hit_note = None
	Change structurename = <player_status> broken_string_mask = 0
	Change structurename = <player_status> broken_string_green = 0
	Change structurename = <player_status> broken_string_red = 0
	Change structurename = <player_status> broken_string_yellow = 0
	Change structurename = <player_status> broken_string_blue = 0
	Change structurename = <player_status> broken_string_orange = 0
	Change structurename = <player_status> hold_difficulty_up = 0.0
	if NOT (($<player_status>.lefthanded_gems_flip_save) = ($<player_status>.lefthanded_gems))
		Change structurename = <player_status> lefthanded_gems = ($<player_status>.lefthanded_gems_flip_save)
	endif
	if NOT (($<player_status>.lefthanded_button_ups_flip_save) = ($<player_status>.lefthanded_button_ups))
		Change structurename = <player_status> lefthanded_button_ups = ($<player_status>.lefthanded_button_ups_flip_save)
	endif
	if ScreenElementExists \{id = battlemode_container}
		DestroyScreenElement \{id = battlemode_container}
	endif
	Change \{current_battle_text_p1 = [
			id
			id
			id
		]}
	Change \{current_battle_text_p2 = [
			id
			id
			id
		]}
	Change \{battle_p1_highway_hammer = 0}
	Change \{battle_p2_highway_hammer = 0}
	battlemode_killspawnedscripts
endscript

script battlemode_killspawnedscripts 
	KillSpawnedScript \{id = battlemode}
endscript

script restore_saved_powerups 
	if ($battle_do_or_die = 1)
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
	Change structurename = <player_status> battlemode_creation_selection = -1
	total_weight = 0
	num_attacks = 0
	if ($<player_status>.Player = 1)
		other_player_difficulty = ($player2_status.difficulty)
	else
		other_player_difficulty = ($player1_status.difficulty)
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
	if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
		if ($<player_status>.current_health > 0.5)
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_low)
			else
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight)
			endif
		else
			total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_losing)
		endif
	endif
	if ($battlemode_powerups [<array_count>].weight > 0)
		num_attacks = (<num_attacks> + 1)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetRandomValue Name = select_weight a = 0 b = (<total_weight> -1) integer
	if (<num_attacks> = 0)
		Change structurename = <player_status> battlemode_creation_selection = 0
		return
	endif
	array_count = 0
	begin
	if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
		if (($<player_status>.current_health) > 0.5)
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_low)
			else
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight)
			endif
		else
			select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_losing)
		endif
	endif
	if (<select_weight> < 0)
		Change structurename = <player_status> battlemode_creation_selection = <array_count>
		Change structurename = <player_status> last_selected_attack = <array_count>
		break
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($<player_status>.battlemode_creation_selection = -1)
		printstruct <...>
		ScriptAssert \{qs(0xf8237d93)}
	endif
endscript
medium_scale = 0.55
small_scale = 0.4

script print_powerup_arrays 
	printf qs(0x4b25d7cb) a = ($player1_status.current_num_powerups)
	GetArraySize \{$current_powerups_p1}
	array_count = 0
	begin
	printf qs(0x1dff100d) c = <array_count> p = ($current_powerups_p1 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	printf qs(0x3cbb053b) a = ($player2_status.current_num_powerups)
	GetArraySize \{$current_powerups_p2}
	<array_count> = 0
	begin
	printf qs(0x1dff100d) c = <array_count> p = ($current_powerups_p2 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script battlemode_ready \{battle_gem = 0
		player_status = player1_status
		steal = 0
		battle_text = 1}
	if ($<player_status>.Player = 1)
		SoundEvent \{event = star_power_awarded_sfx_p1}
	else
		SoundEvent \{event = star_power_awarded_sfx_p2}
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	if (<current_num_powerups> >= $max_num_powerups)
		<current_num_powerups> = (<current_num_powerups> - 1)
		if ($<player_status>.Player = 1)
			card_checksum = ($current_battlecard_p1 [0])
			card_checksum1 = ($current_battlecard_p1 [1])
			card_checksum2 = ($current_battlecard_p1 [2])
			SetArrayElement ArrayName = current_battlecard_p1 globalarray index = 0 NewValue = <card_checksum1>
			SetArrayElement ArrayName = current_battlecard_p1 globalarray index = 1 NewValue = <card_checksum2>
			select1 = ($current_powerups_p1 [1])
			select2 = ($current_powerups_p1 [2])
			SetArrayElement ArrayName = current_powerups_p1 globalarray index = 0 NewValue = <select1>
			SetArrayElement ArrayName = current_powerups_p1 globalarray index = 1 NewValue = <select2>
		else
			card_checksum = ($current_battlecard_p2 [0])
			card_checksum1 = ($current_battlecard_p2 [1])
			card_checksum2 = ($current_battlecard_p2 [2])
			SetArrayElement ArrayName = current_battlecard_p2 globalarray index = 0 NewValue = <card_checksum1>
			SetArrayElement ArrayName = current_battlecard_p2 globalarray index = 1 NewValue = <card_checksum2>
			select1 = ($current_powerups_p2 [1])
			select2 = ($current_powerups_p2 [2])
			SetArrayElement ArrayName = current_powerups_p2 globalarray index = 0 NewValue = <select1>
			SetArrayElement ArrayName = current_powerups_p2 globalarray index = 1 NewValue = <select2>
		endif
		if ScreenElementExists id = <card_checksum>
			DestroyScreenElement id = <card_checksum>
		endif
		Change structurename = <player_status> current_num_powerups = <current_num_powerups>
		printf qs(0x8501ab2e) n = ($<player_status>.Player) a = ($<player_status>.current_num_powerups)
	endif
	if NOT (ScreenElementExists id = battlemode_container)
		return
	endif
	if (<current_num_powerups> < 0)
		printf \{qs(0x2203e72c)}
		printf qs(0xedc12aa0) p = ($<player_status>.Player) b = <battle_gem>
		print_powerup_arrays
	endif
	select = <battle_gem>
	if ($<player_status>.Player = 1)
		SetArrayElement ArrayName = current_powerups_p1 globalarray index = <current_num_powerups> NewValue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		SetArrayElement ArrayName = current_powerups_p2 globalarray index = <current_num_powerups> NewValue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups + 1)
	printf qs(0xff335930) n = ($<player_status>.Player) a = ($<player_status>.current_num_powerups)
	Color = ($<player_status>.last_hit_note)
	if (<Color> = None)
		<Color> = green
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		begin_pos = ((($button_up_models [(($<player_status>.Player) -1)]).<Color>.left_pos_2d) - (0.0, 90.0))
	else
		begin_pos = ((($button_up_models [(($<player_status>.Player) -1)]).<Color>.pos_2d) - (0.0, 90.0))
	endif
	if ($<player_status>.Player = 1)
		<begin_pos> = (<begin_pos> - (225.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (225.0, 0.0))
	endif
	formatText checksumName = card_checksum 'battlecard_%i_%s' i = $battlecard_unique_index s = ($<player_status>.Player) AddToStringLookup
	Change battlecard_unique_index = ($battlecard_unique_index + 1)
	if ($battlecard_unique_index > 256)
		Change \{battlecard_unique_index = 0}
	endif
	if ($<player_status>.Player = 1)
		SetArrayElement ArrayName = current_battlecard_p1 globalarray index = <current_num_powerups> NewValue = <card_checksum>
	else
		SetArrayElement ArrayName = current_battlecard_p2 globalarray index = <current_num_powerups> NewValue = <card_checksum>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <card_checksum>
		parent = battlemode_container
		texture = ($battlemode_powerups [<select>].card_texture)
		rgba = [255 255 255 255]
		Pos = <begin_pos>
		dims = (64.0, 64.0)
		just = [center center]
		alpha = 0.5
		z_priority = (($battle_hud_2d_elements.z) + 19)
	}
	if (<steal> > 0)
		legacydoscreenelementmorph {
			id = <card_checksum>
			Pos = <card_pos>
			alpha = 1
			time = 0
		}
	else
		legacydoscreenelementmorph {
			id = <card_checksum>
			Pos = <card_pos>
			alpha = 1
			time = 0.3
		}
	endif
	update_battlecards_add current_num_powerups = <current_num_powerups> player_status = <player_status>
	if ($show_battle_text = 1)
		if (<battle_text> = 1)
			SpawnScriptNow attack_ready_text params = {current_num_powerups = <current_num_powerups> select = <select> player_status = <player_status>} id = battlemode
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
	formatText checksumName = text_checksum 'attack_ready_text_%s' s = ($<player_status>.Player)
	if ScreenElementExists id = <text_checksum>
		DestroyScreenElement id = <text_checksum>
	endif
	attack_name = ($battlemode_powerups [<select>].name_text)
	if ($battlemode_powerups [<select>].Name = LeftyNotes)
		if NOT ($<other_player_status>.lefty_notes < 1)
			if ($<other_player_status>.lefthanded_button_ups = 0)
				<attack_name> = ($battlemode_powerups [<select>].alt_name_text)
			endif
		else
			if ($<other_player_status>.lefthanded_button_ups = 1)
				<attack_name> = ($battlemode_powerups [<select>].alt_name_text)
			endif
		endif
	endif
	if ($<player_status>.Player = 1)
		text_pos = ($battle_hud_2d_elements.attack_ready_text_pos_p1)
		CreateScreenElement {
			Type = TextElement
			id = <text_checksum>
			parent = battlemode_container
			Pos = <text_pos>
			text = <attack_name>
			font = fontgrid_text_3
			Scale = 0.6
			rgba = [255 255 255 255]
			just = [left bottom]
			z_priority = 25
		}
	else
		text_pos = ($battle_hud_2d_elements.attack_ready_text_pos_p2)
		CreateScreenElement {
			Type = TextElement
			id = <text_checksum>
			parent = battlemode_container
			Pos = <text_pos>
			text = <attack_name>
			font = fontgrid_text_3
			Scale = 0.6
			rgba = [255 255 255 255]
			just = [right bottom]
			z_priority = 25
		}
	endif
	Wait \{3
		Seconds}
	legacydoscreenelementmorph {
		id = <text_checksum>
		alpha = 0
		time = 0.3
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
		if ($<player_status>.Player = 1)
			card_checksum = ($current_battlecard_p1 [0])
		else
			card_checksum = ($current_battlecard_p2 [0])
		endif
		legacydoscreenelementmorph {
			id = <card_checksum>
			Pos = (<player_pos> + <medium_pos>)
			Scale = $medium_scale
			time = 0.3
		}
		if (<current_num_powerups> > 1)
			if ($<player_status>.Player = 1)
				card_checksum = ($current_battlecard_p1 [1])
			else
				card_checksum = ($current_battlecard_p2 [1])
			endif
			legacydoscreenelementmorph {
				id = <card_checksum>
				Pos = (<player_pos> + <medium_pos>)
				Scale = $medium_scale
				time = 0.3
			}
			if ($<player_status>.Player = 1)
				card_checksum = ($current_battlecard_p1 [0])
			else
				card_checksum = ($current_battlecard_p2 [0])
			endif
			legacydoscreenelementmorph {
				id = <card_checksum>
				Pos = (<player_pos> + <small_pos>)
				Scale = $small_scale
				time = 0.3
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
		if ($<player_status>.Player = 1)
			card_checksum = ($current_battlecard_p1 [0])
		else
			card_checksum = ($current_battlecard_p2 [0])
		endif
		if ScreenElementExists id = <card_checksum>
			legacydoscreenelementmorph {
				id = <card_checksum>
				Pos = <player_pos>
				Scale = 1
				time = 0.3
			}
		endif
		if ($<player_status>.current_num_powerups > 1)
			if ($<player_status>.Player = 1)
				card_checksum = ($current_battlecard_p1 [1])
			else
				card_checksum = ($current_battlecard_p2 [1])
			endif
			if ScreenElementExists id = <card_checksum>
				legacydoscreenelementmorph {
					id = <card_checksum>
					Pos = <player_pos>
					Scale = 1
					time = 0.3
				}
			endif
			if ($<player_status>.Player = 1)
				card_checksum = ($current_battlecard_p1 [0])
			else
				card_checksum = ($current_battlecard_p2 [0])
			endif
			if ScreenElementExists id = <card_checksum>
				legacydoscreenelementmorph {
					id = <card_checksum>
					Pos = (<player_pos> + <medium_pos>)
					Scale = $medium_scale
					time = 0.3
				}
			endif
		endif
	endif
endscript

script add_battle_text 
	if (($<send_to_player>.battle_text_count) < 3)
		ExtendCrc <battle_text> ($<send_to_player>.text) out = id
		count = 0
		begin
		if ($<send_to_player>.Player = 1)
			current_id = ($current_battle_text_p1 [<count>])
		else
			current_id = ($current_battle_text_p2 [<count>])
		endif
		if (<current_id> = <id>)
			printf \{qs(0x7417f1ae)}
			return
		endif
		<count> = (<count> + 1)
		repeat 3
		if ($<send_to_player>.Player = 1)
			<id> :se_setprops z_priority = -1
			legacydoscreenelementmorph id = <id> alpha = 1 Pos = (380.0, 35.0)
		else
			<id> :se_setprops z_priority = -1
			legacydoscreenelementmorph id = <id> alpha = 1 Pos = (890.0, 35.0)
		endif
		battle_count = ($<send_to_player>.battle_text_count)
		if ($<send_to_player>.Player = 1)
			SetArrayElement ArrayName = current_battle_text_p1 globalarray index = <battle_count> NewValue = <id>
		else
			SetArrayElement ArrayName = current_battle_text_p2 globalarray index = <battle_count> NewValue = <id>
		endif
		Change structurename = <send_to_player> battle_text_count = (($<send_to_player>.battle_text_count) + 1)
		if (($<send_to_player>.battle_text_count) > 1)
			count = 0
			begin
			if ((($<send_to_player>.battle_text_count) - <count>) > 1)
				if ($<send_to_player>.Player = 1)
					battle_text_to_move = ($current_battle_text_p1 [<count>])
				else
					battle_text_to_move = ($current_battle_text_p2 [<count>])
				endif
				GetScreenElementDims id = <battle_text_to_move>
				GetScreenElementPosition id = <battle_text_to_move>
				x_offset = (<width> / 2)
				legacydoscreenelementmorph {
					id = <battle_text_to_move>
					Pos = (<screenelementpos> + (0.0, 30.0) + (<x_offset> * (1.0, 0.0)))
					just = [center top]
					time = 0.3
				}
				<count> = (<count> + 1)
			endif
			repeat (($<send_to_player>.battle_text_count) - 1)
		endif
	endif
	return id = <id>
endscript

script remove_battle_text 
	remove_text = -1
	if NOT GotParam \{id}
		return
	endif
	count = 0
	begin
	if ($<send_to_player>.Player = 1)
		current_id = ($current_battle_text_p1 [<count>])
	else
		current_id = ($current_battle_text_p2 [<count>])
	endif
	if (<current_id> = <id>)
		<remove_text> = <count>
	endif
	<count> = (<count> + 1)
	repeat 3
	if (<remove_text> = -1)
		return
	endif
	if ($<send_to_player>.Player = 1)
		legacydoscreenelementmorph id = ($current_battle_text_p1 [<remove_text>]) alpha = 0 time = 0.3
		SetArrayElement ArrayName = current_battle_text_p1 globalarray index = <remove_text> NewValue = id
	else
		legacydoscreenelementmorph id = ($current_battle_text_p2 [<remove_text>]) alpha = 0 time = 0.3
		SetArrayElement ArrayName = current_battle_text_p2 globalarray index = <remove_text> NewValue = id
	endif
	Change structurename = <send_to_player> battle_text_count = ($<send_to_player>.battle_text_count - 1)
	if (<remove_text> < 2)
		count = <remove_text>
		begin
		if NOT (<count> >= ($<send_to_player>.battle_text_count))
			if ($<send_to_player>.Player = 1)
				battle_text_to_move = ($current_battle_text_p1 [(<count> + 1)])
				SetArrayElement ArrayName = current_battle_text_p1 globalarray index = (<count> + 1) NewValue = id
				SetArrayElement ArrayName = current_battle_text_p1 globalarray index = <count> NewValue = <battle_text_to_move>
			else
				battle_text_to_move = ($current_battle_text_p2 [(<count> + 1)])
				SetArrayElement ArrayName = current_battle_text_p2 globalarray index = (<count> + 1) NewValue = id
				SetArrayElement ArrayName = current_battle_text_p2 globalarray index = <count> NewValue = <battle_text_to_move>
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
			GetScreenElementDims id = <battle_text_to_move>
			GetScreenElementPosition id = <battle_text_to_move>
			x_offset = (<width> / 2)
			legacydoscreenelementmorph {
				id = <battle_text_to_move>
				Pos = (<screenelementpos> - (0.0, 30.0) + (<x_offset> * (1.0, 0.0)))
				just = [center top]
				time = 0.3
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
		gameframe}
	battle_trigger_on \{player_status = player2_status}
	Wait \{1
		gameframe}
	battle_trigger_on \{player_status = player1_status}
	Wait \{1
		gameframe}
	battle_trigger_on \{player_status = player1_status}
endscript

script debug_attack 
	battlemode_ready battle_gem = <gem> player_status = player2_status
	Wait \{0.1
		Second}
	battle_trigger_on \{player_status = player2_status}
endscript

script lightning_me 
	debug_attack \{gem = 0}
endscript

script diff_me 
	debug_attack \{gem = 1}
endscript

script double_me 
	debug_attack \{gem = 2}
endscript

script lefty_me 
	debug_attack \{gem = 4}
endscript

script string_me 
	debug_attack \{gem = 5}
endscript

script whammy_me 
	debug_attack \{gem = 6}
endscript

script mine_me 
	debug_attack \{gem = 7}
endscript

script remove_battle_card 
	if ($<player_status>.Player = 1)
		card_checksum = ($current_battlecard_p1 [($<player_status>.current_num_powerups - 1)])
	else
		card_checksum = ($current_battlecard_p2 [($<player_status>.current_num_powerups - 1)])
	endif
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	printf qs(0xe0c84f86) n = ($<player_status>.Player) a = ($<player_status>.current_num_powerups)
endscript

script battle_trigger_on 
	if ($<player_status>.current_num_powerups = 0)
		return
	endif
	if ($<player_status>.Player = 1)
		<other_player> = 2
		<other_player_text> = 'p2'
		<other_difficulty> = ($player2_status.difficulty)
		<other_player_status> = player2_status
		select = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 2 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
		if ($is_network_game)
			if NOT (<select> = 3)
				SendNetMessage {
					Type = battle_trigger_on
					select = <select>
				}
			endif
		endif
	else
		<other_player> = 1
		<other_player_text> = 'p1'
		<other_difficulty> = ($player1_status.difficulty)
		<other_player_status> = player1_status
		select = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 1 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
	endif
	remove_battle_card player_status = <player_status>
	if ($<player_status>.current_num_powerups < 0)
		printf qs(0x1c48ca78) s = ($<player_status>.text)
		printf qs(0xa03e74c4) i = ($<player_status>.current_num_powerups)
		printf qs(0x0b429510) i = <select>
	endif
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	other_player_difficulty = easy
	if ($<player_status>.Player = 1)
		<other_player_difficulty> = ($player2_status.difficulty)
	else
		<other_player_difficulty> = ($player1_status.difficulty)
	endif
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
	if NOT ($<player_status>.highway_layout = solo_highway)
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
	if ($<player_status>.highway_layout = solo_highway)
		SpawnScriptNow hammer_rock_meter params = {other_player_text = <other_player_text>} id = battlemode
	else
		SpawnScriptNow hammer_highway params = {other_player_text = <other_player_text>} id = battlemode
	endif
	if ($battlemode_powerups [<select>].fire_bolt = 1)
		SpawnScriptNow attack_bolt params = {player_status = <player_status> other_player_status = <other_player_status>} id = battlemode
	endif
endscript

script attack_bolt \{bolt_angle = 60}
	bolt_pos_middle = (640.0, 230.0)
	bolt_pos_offset = (330.0, 0.0)
	formatText checksumName = attack_bolt 'attack_bolt%p' p = ($<player_status>.text) AddToStringLookup = true
	if ScreenElementExists id = <attack_bolt>
		DestroyScreenElement id = <attack_bolt>
	endif
	if ($<player_status>.Player = 1)
		bolt_angle = (-1 * <bolt_angle>)
		bolt_scale = (-1.0, 1.0)
		bolt_just = [middle top]
		bolt_pos = (<bolt_pos_middle> - <bolt_pos_offset>)
	else
		bolt_angle = <bolt_angle>
		bolt_scale = (1.0, 1.0)
		bolt_just = [middle top]
		bolt_pos = (<bolt_pos_middle> + <bolt_pos_offset>)
	endif
	if NOT ScreenElementExists \{id = battlemode_container}
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <attack_bolt>
		parent = battlemode_container
		material = sys_Big_Bolt01_Red_sys_Big_Bolt01_Red
		rgba = [255 255 255 255]
		Pos = <bolt_pos>
		rot_angle = <bolt_angle>
		Scale = <bolt_scale>
		just = <bolt_just>
		z_priority = 10
	}
	GetSongTimeMs
	formatText checksumName = attack_bolt_particle 'attack_bolt_particle_%s_%t' s = ($<player_status>.text) t = <time> AddToStringLook = true
	if ($<player_status>.Player = 1)
		emit_direction = 300
		bolt_hit_pos = (<bolt_pos> + (455.0, 0.0) + (0.0, 250.0))
	else
		emit_direction = -300
		bolt_hit_pos = (<bolt_pos> - (455.0, 0.0) + (0.0, 250.0))
	endif
	Destroy2DParticleSystem id = <attack_bolt_particle>
	Create2DParticleSystem {
		id = <attack_bolt_particle>
		Pos = (<bolt_hit_pos>)
		parent = battlemode_container
		z_priority = 8.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
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
		velocity = 16.0
		friction = (0.0, 24.0)
		time = 1
	}
	Wait \{8
		gameframes}
	if ScreenElementExists id = <attack_bolt>
		DestroyScreenElement id = <attack_bolt>
	endif
	Wait \{2
		gameframes}
	Destroy2DParticleSystem id = <attack_bolt_particle> kill_when_empty
endscript

script lightning_particle 
endscript

script battle_lightning 
	flicker_ammount = 2
	switch <difficulty>
		case easy
		<flicker_ammount> = ($battlemode_powerups [0].easy_flicker)
		case medium
		<flicker_ammount> = ($battlemode_powerups [0].medium_flicker)
		case hard
		<flicker_ammount> = ($battlemode_powerups [0].hard_flicker)
		case expert
		<flicker_ammount> = ($battlemode_powerups [0].expert_flicker)
	endswitch
	if ($<other_player_status>.Player = 1)
		Change battle_flicker_difficulty_p1 = <flicker_ammount>
		spawnscript GH_BattleMode_Player1_SFX_Shake_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		Change battle_flicker_difficulty_p2 = <flicker_ammount>
		spawnscript GH_BattleMode_Player2_SFX_Shake_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	GetSongTimeMs
	CastToInteger \{time}
	if ($<other_player_status>.shake_notes > -1)
		Change structurename = <other_player_status> shake_notes = (($<other_player_status>.shake_notes) + <drain_time>)
	else
		Change structurename = <other_player_status> shake_notes = (<time> + <drain_time>)
		SpawnScriptNow flicker_gems params = {Player = ($<other_player_status>.Player) other_player_status = <other_player_status>} id = battlemode
		SpawnScriptNow shake_highway params = {player_text = <player_text> other_player_status = <other_player_status>} id = battlemode
		begin
		GetSongTimeMs
		if (<time> > $<other_player_status>.shake_notes)
			Change structurename = <other_player_status> shake_notes = -1
			break
		endif
		Wait \{1
			gameframe}
		repeat
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script gh_battlemode_player1_rtl 
	DestroyScreenElement \{id = rtl_p1_lighning}
	Wait \{1
		fame}
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = Name 'RTL%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		id = rtl_p1_lighning
		dims = (512.0, 512.0)
		Scale = (5.0, -1.0)
		Pos = (640.0, 630.0)
		material = mat_battlemode_rtl
		z_priority = 0.5
	}
endscript

script gh_battlemode_player2_rtl 
	DestroyScreenElement \{id = rtl_p2_lighning}
	Wait \{1
		fame}
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = Name 'RTL%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		id = rtl_p2_lighning
		dims = (512.0, 512.0)
		Scale = (5.0, -1.0)
		Pos = (640.0, 630.0)
		material = sys_Big_Bolt01_sys_Big_Bolt01
		z_priority = 0.5
	}
endscript

script flicker_gems 
	begin
	if ($<other_player_status>.blackout_attack = -1)
		if ($<other_player_status>.shake_notes > -1)
			LaunchGemEvent event = flicker_on Player = <Player>
		else
			LaunchGemEvent event = flicker_off Player = <Player>
			break
		endif
	endif
	Wait \{3
		gameframes}
	repeat
endscript

script shake_highway 
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	GetScreenElementPosition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	begin
	if (<player_text> = 'p1')
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		GetScreenElementPosition id = <container_id>
		original_position = <screenelementpos>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	pulse_on = 0
	begin
	if ($<other_player_status>.shake_notes > -1)
		if (<pulse_on> = 0)
			legacydoscreenelementmorph {
				id = <container_id>
				Pos = (<original_position> + (0.0, 8.0))
				just = [center bottom]
				time = <shake_frequency>
			}
			Wait <shake_frequency> Seconds
			<pulse_on> = 1
		else
			legacydoscreenelementmorph {
				id = <container_id>
				Pos = <original_position>
				just = [center bottom]
				time = <shake_frequency>
			}
			Wait <shake_frequency> Seconds
			<pulse_on> = 0
		endif
	else
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
		}
		break
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script blackout_highway 
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = highway_name 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	black_on = 0
	tap_trail_id = (guitar_tap_trail_sprite + Player + <Player>)
	if ScreenElementExists id = <tap_trail_id>
		getscreenelementzpriority id = <tap_trail_id>
		SetScreenElementProps {id = <tap_trail_id> z_priority = -10}
	endif
	begin
	if ($<other_player_status>.blackout_attack > -1)
		if (<black_on> = 0)
			legacydoscreenelementmorph {
				id = <highway_name>
				rgba = ($highway_pulse)
				time = 0.1
			}
			<black_on> = 1
		else
			legacydoscreenelementmorph {
				id = <highway_name>
				rgba = ($highway_pulse)
			}
		endif
		LaunchGemEvent event = flicker_off Player = <Player>
		LaunchGemEvent event = hide_on Player = <Player>
	else
		legacydoscreenelementmorph {
			id = <highway_name>
			rgba = ($highway_normal)
			time = 0.1
		}
		LaunchGemEvent event = hide_off Player = <Player>
		if ScreenElementExists id = <tap_trail_id>
			SetScreenElementProps {id = <tap_trail_id> z_priority = <z_priority>}
		endif
		break
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script hammer_highway \{push_p1 = (-70.0, 50.0)
		push_p2 = (70.0, 50.0)
		time = 0.1}
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
		formatText checksumName = container_id 'gem_container%p' p = <other_player_text> AddToStringLookup = true
		GetScreenElementPosition id = <container_id>
		original_position = <screenelementpos>
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = (<original_position> + <push_pos>)
			just = [center bottom]
			time = <time>
		}
		Wait <time> Seconds
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
			time = <time>
		}
		Wait <time> Seconds
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
		formatText checksumName = container_id 'HUD2D_rock_container%p' p = <other_player_text> AddToStringLookup = true
		GetScreenElementPosition id = <container_id>
		original_position = <screenelementpos>
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = (<original_position> + <push_pos>)
			just = [center bottom]
			time = 0.1
		}
		Wait \{0.1
			Seconds}
		legacydoscreenelementmorph {
			id = <container_id>
			Pos = <original_position>
			just = [center bottom]
			time = 0.1
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
	formatText checksumName = container_id 'HUD2D_rock_container%p' p = ($<other_player_status>.text) AddToStringLookup = true
	GetScreenElementPosition id = <container_id>
	original_position = <screenelementpos>
	begin
	legacydoscreenelementmorph {
		id = <container_id>
		Pos = (<original_position> + <shake_ammount>)
		just = [center bottom]
		time = 0.1
	}
	Wait \{0.1
		Seconds}
	legacydoscreenelementmorph {
		id = <container_id>
		Pos = (<original_position> - <shake_ammount>)
		just = [center bottom]
		time = 0.1
	}
	Wait \{0.1
		Seconds}
	repeat
endscript

script battle_up_difficulty 
	if ($<other_player_status>.Player = 1)
		spawnscript GH_BattleMode_Player1_SFX_DiffUp_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_DiffUp_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if (<difficulty> = expert)
		battle_double_notes <...>
		return
	endif
	if NOT ($<other_player_status>.diffup_notes = -1)
		Change structurename = <other_player_status> diffup_notes = ($<other_player_status>.diffup_notes + <drain_time>)
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	Change structurename = <other_player_status> diffup_notes = (<time> + <drain_time>)
	fillinputarrayforbattle Player = ($<other_player_status>.Player) Attack = difficulty_up
	update_hud_difficulty_up other_player_status = <other_player_status> difficulty = <difficulty>
	ExtendCrc change_difficulty <player_text> out = Type
	original_difficulty = <difficulty>
	switch <difficulty>
		case easy
		broadcastevent Type = <Type> data = {difficulty = medium difficulty_text_nl = 'medium'}
		case medium
		broadcastevent Type = <Type> data = {difficulty = hard difficulty_text_nl = 'hard'}
		case hard
		broadcastevent Type = <Type> data = {difficulty = expert difficulty_text_nl = 'expert'}
	endswitch
	GetSongTimeMs
	CastToInteger \{time}
	Change structurename = <other_player_status> diffup_notes = (<time> + <drain_time>)
	begin
	GetSongTimeMs
	if (<time> > $<other_player_status>.diffup_notes)
		printf \{qs(0x60cd5d4f)}
		ExtendCrc change_difficulty <player_text> out = Type
		original_difficulty = <difficulty>
		switch <original_difficulty>
			case easy
			broadcastevent Type = <Type> data = {difficulty = easy difficulty_text_nl = 'easy'}
			case medium
			broadcastevent Type = <Type> data = {difficulty = medium difficulty_text_nl = 'medium'}
			case hard
			broadcastevent Type = <Type> data = {difficulty = hard difficulty_text_nl = 'hard'}
		endswitch
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change structurename = <other_player_status> diffup_notes = -1
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_double_notes 
	if ($<other_player_status>.Player = 1)
		spawnscript GH_BattleMode_Player1_SFX_DoubleNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_DoubleNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if NOT ($<other_player_status>.double_notes = -1)
		Change structurename = <other_player_status> double_notes = ($<other_player_status>.double_notes + <drain_time>)
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	Change structurename = <other_player_status> double_notes = (<time> + <drain_time>)
	fillinputarrayforbattle Player = ($<other_player_status>.Player) Attack = double_notes
	update_hud_double_notes other_player_status = <other_player_status>
	begin
	GetSongTimeMs
	if (<time> > $<other_player_status>.double_notes)
		printf \{qs(0x60cd5d4f)}
		Change structurename = <other_player_status> double_notes = -1
		break
	endif
	Wait \{1
		gameframe}
	repeat
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_mine_attack 
	if ($<other_player_status>.Player = 1)
		SoundEvent \{event = gh_sfx_battlemode_mine_release_p1}
	else
		SoundEvent \{event = gh_sfx_battlemode_mine_release_p2}
	endif
	if NOT ($<other_player_status>.mine_attack = -1)
		Change structurename = <other_player_status> mine_attack = ($<other_player_status>.mine_attack + <drain_time>)
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	Change structurename = <other_player_status> mine_attack = (<time> + <drain_time>)
	fillinputarrayforbattle Player = ($<other_player_status>.Player) Attack = mine_attack
	begin
	GetSongTimeMs
	if (<time> > $<other_player_status>.mine_attack)
		printf \{qs(0x60cd5d4f)}
		Change structurename = <other_player_status> mine_attack = -1
		break
	endif
	Wait \{1
		gameframe}
	repeat
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_blackout_attack 
	if ($<other_player_status>.Player = 1)
		spawnscript \{ghm_battlemode_hitthelights_attack_p1}
	else
		spawnscript \{ghm_battlemode_hitthelights_attack_p2}
	endif
	if NOT ($<other_player_status>.blackout_attack = -1)
		Change structurename = <other_player_status> blackout_attack = ($<other_player_status>.blackout_attack + <drain_time>)
		return
	endif
	if (<difficulty> = easy)
		<drain_time> = (<drain_time> + <easy_drain>)
	endif
	GetSongTimeMs
	CastToInteger \{time}
	Change structurename = <other_player_status> blackout_attack = (<time> + <drain_time>)
	SpawnScriptNow blackout_highway params = {player_text = <player_text> Player = ($<other_player_status>.Player) other_player_status = <other_player_status>} id = battlemode
	begin
	GetSongTimeMs
	if (<time> > $<other_player_status>.blackout_attack)
		printf \{qs(0x60cd5d4f)}
		Change structurename = <other_player_status> blackout_attack = -1
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($<other_player_status>.Player = 1)
		spawnscript \{ghm_battlemode_hitthelights_release_p1}
	else
		spawnscript \{ghm_battlemode_hitthelights_release_p2}
	endif
endscript

script battle_steal 
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
	Change structurename = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup + 1)
	animate_steal start_pos = <start_pos> morph_to_pos = <morph_to_pos> player_status = <player_status> other_player_status = <other_player_status>
	Change structurename = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup - 1)
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
	formatText checksumName = steal_hand_open_checksum 'steal_hand_open_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.Player)
	if ScreenElementExists id = <steal_hand_open_checksum>
		DestroyScreenElement id = <steal_hand_open_checksum>
	endif
	formatText checksumName = steal_hand_checksum 'steal_hand_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.Player)
	Wait \{1
		gameframe}
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
	if NOT ($<other_player_status>.current_num_powerups = 0)
		if ($<other_player_status>.Player = 1)
			select = ($current_powerups_p1 [($<other_player_status>.current_num_powerups - 1)])
		else
			select = ($current_powerups_p2 [($<other_player_status>.current_num_powerups - 1)])
		endif
		if ($<other_player_status>.Player = 1)
			card_checksum = ($current_battlecard_p1 [($<other_player_status>.current_num_powerups - 1)])
		else
			card_checksum = ($current_battlecard_p2 [($<other_player_status>.current_num_powerups - 1)])
		endif
		if ScreenElementExists id = <card_checksum>
			DestroyScreenElement id = <card_checksum>
		endif
		Change structurename = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		printf qs(0x1038d3da) n = ($<other_player_status>.Player) a = ($<other_player_status>.current_num_powerups)
		update_battlecards_remove player_status = <other_player_status>
		GetSongTimeMs
		formatText checksumName = held_card_checksum 'held_battlecard_%i_%s_%t' i = ($<other_player_status>.current_num_powerups - 1) s = ($<other_player_status>.Player) t = <time>
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
		legacydoscreenelementmorph {
			id = <steal_hand_checksum>
			alpha = 0
			time = 0.1
		}
		Wait \{0.1
			Seconds}
		if ScreenElementExists id = <held_card_checksum>
			DestroyScreenElement id = <held_card_checksum>
		endif
		if ScreenElementExists id = <steal_hand_checksum>
			DestroyScreenElement id = <steal_hand_checksum>
		endif
		battlemode_ready player_status = <player_status> battle_gem = <select> steal = 1
	endif
endscript

script battle_lefty_notes 
	if ($<other_player_status>.Player = 1)
		spawnscript GH_BattleMode_Player1_SFX_LeftyNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_LeftyNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if NOT ($<other_player_status>.lefty_notes = -1)
		Change structurename = <other_player_status> lefty_notes = ($<other_player_status>.lefty_notes + <drain_time>)
		return
	endif
	Change structurename = <other_player_status> lefthanded_gems_flip_save = ($<other_player_status>.lefthanded_gems)
	Change structurename = <other_player_status> lefthanded_button_ups_flip_save = ($<other_player_status>.lefthanded_button_ups)
	Change structurename = <other_player_status> lefthanded_gems = (1 + $<other_player_status>.lefthanded_gems * -1)
	GetSongTimeMs
	CastToInteger \{time}
	Change structurename = <other_player_status> lefty_notes = (<time> + <drain_time>)
	fillinputarrayforbattle Player = ($<other_player_status>.Player) Attack = lefty_flip_notes
	start_time = (<time> + 200)
	end_time = -1
	update_hud_lefty_notes other_player_status = <other_player_status>
	block_until_whammy_done <...>
	GetSongTimeMs
	if NOT (<time> > $<other_player_status>.lefty_notes)
		begin
		GetSongTimeMs
		if NOT (<start_time> = -1)
			if (<time> > (<start_time> - 500))
				Change structurename = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
				animate_lefty_flip other_player_status = <other_player_status> player_text = <player_text>
				start_time = -1
			endif
		endif
		if (<time> > $<other_player_status>.lefty_notes)
			printf \{qs(0x60cd5d4f)}
			end_time = (<time> + (($<other_player_status>.scroll_time - $destroy_time) * 1000.0))
			Change structurename = <other_player_status> lefthanded_gems = (1 + $<other_player_status>.lefthanded_gems * -1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		block_until_whammy_done <...> no_drain
		begin
		GetSongTimeMs
		if NOT (<start_time> = -1)
			if (<time> > <start_time>)
				animate_lefty_flip other_player_status = <other_player_status> player_text = <player_text>
				Change structurename = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
				start_time = -1
			endif
		endif
		if (<time> > (<end_time> - 500))
			animate_lefty_flip other_player_status = <other_player_status> player_text = <player_text>
			Change structurename = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
			Change structurename = <other_player_status> lefty_notes = -1
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	Change structurename = <other_player_status> lefthanded_gems = ($<other_player_status>.lefthanded_gems_flip_save)
	Change structurename = <other_player_status> lefthanded_button_ups = ($<other_player_status>.lefthanded_button_ups_flip_save)
	GuitarEvent_BattleAttackFinished <...>
endscript

script block_until_whammy_done 
	<index> = ($<other_player_status>.Player - 1)
	if ($currently_holding [<index>] = 1)
		if (<index> = 0)
			if NOT GotParam \{no_drain}
				SpawnScriptNow \{lefty_drain_waitp1
					id = battlemode}
			endif
			Block \{anytypes = [
					whammy_offp1
					fake_whammy_offp1
				]}
			if NOT GotParam \{no_drain}
				KillSpawnedScript \{Name = lefty_drain_waitp1}
			endif
		else
			if NOT GotParam \{no_drain}
				SpawnScriptNow \{lefty_drain_waitp2
					id = battlemode}
			endif
			Block \{anytypes = [
					whammy_offp2
					fake_whammy_offp2
				]}
			if NOT GotParam \{no_drain}
				KillSpawnedScript \{Name = lefty_drain_waitp2}
			endif
		endif
	endif
endscript

script lefty_drain_waitp1 
	begin
	GetSongTimeMs
	if (<time> > $player1_status.lefty_notes)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{structurename = player1_status
		lefty_notes = -1}
	broadcastevent \{Type = fake_whammy_offp1}
endscript

script lefty_drain_waitp2 
	begin
	GetSongTimeMs
	if (<time> > $player2_status.lefty_notes)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{structurename = player2_status
		lefty_notes = -1}
	broadcastevent \{Type = fake_whammy_offp2}
endscript

script battle_whammy_attack 
	repair_ammount = 5
	switch <difficulty>
		case easy
		<repair_ammount> = ($battlemode_powerups [6].easy_repair)
		case medium
		<repair_ammount> = ($battlemode_powerups [6].medium_repair)
		case hard
		<repair_ammount> = ($battlemode_powerups [6].hard_repair)
		case expert
		<repair_ammount> = ($battlemode_powerups [6].expert_repair)
	endswitch
	base_repair_ammount = <repair_ammount>
	<repair_ammount> = (<repair_ammount> * $battle_do_or_die_attack_scale)
	CastToInteger \{repair_ammount}
	if ($<other_player_status>.Player = 1)
		spawnscript GH_BattleMode_Player1_SFX_Whammy_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_Whammy_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if ($<other_player_status>.whammy_attack < 1)
		Change structurename = <other_player_status> whammy_attack = <repair_ammount>
		whammy_on = 0
		shake_on = 0
		frame_count = 0
		shake_frequency = 1
		mask = 1048576
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 65536
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 4096
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 256
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 16
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 1
		Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		update_training_whammy_bar other_player_status = <other_player_status>
		if ($<other_player_status>.is_local_client)
			begin
			if ($<other_player_status>.whammy_attack = 0)
				break
			endif
			if GuitarGetAnalogueInfo controller = ($<other_player_status>.controller)
				if IsGuitarController controller = ($<other_player_status>.controller)
					<len> = ((<rightx> + 1.0) / 2.0)
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
					$<other_player_status>.Player = 2)
				GetSongTimeMs
				if (<time> - $boss_lastwhammytime > $current_boss.WhammySpeed.($player1_status.difficulty))
					len = 0.5
					Change boss_lastwhammytime = <time>
				else
					len = 0
				endif
			endif
			if (<len> >= 0.5)
				if (<whammy_on> = 0)
					Change structurename = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack - 1)
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
				gameframe}
			repeat
		else
			net_whammy_attack player_text = <player_text> other_player_status = <other_player_status> difficulty = <difficulty>
		endif
		GetArraySize \{$gem_colors}
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if ($<other_player_status>.<broken_string_id> = 0)
			switch <array_count>
				case 0
				mask = 1052945
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 1
				mask = 1114385
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 2
				mask = 1118225
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 3
				mask = 1118465
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 4
				mask = 1118480
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 5
				mask = 69905
				Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
			endswitch
		endif
		array_count = (<array_count> + 1)
		repeat <array_Size>
		Change structurename = <other_player_status> whammy_attack = -1
		GuitarEvent_BattleAttackFinished <...>
	else
		<base_repair_ammount> = (<base_repair_ammount> * $battle_do_or_die_attack_scale * 3.0)
		CastToInteger \{base_repair_ammount}
		if ($<other_player_status>.whammy_attack < <base_repair_ammount>)
			Change structurename = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack + <repair_ammount>)
		endif
	endif
endscript

script testtui 
	SpawnScriptNow gh_battlemode_player1_tui_whammy_end params = {player_text = ($player1_status.text) Player = 1} id = battlemode
endscript

script break_string 
	Color = ($gem_colors [<id>])
	if ($<other_player_status>.lefthanded_button_ups = 1)
		begin_pos = ((($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.left_pos_2d) + (0.0, 40.0))
	else
		begin_pos = ((($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.pos_2d) + (0.0, 40.0))
	endif
	string_rotation = 0
	switch <id>
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
	formatText checksumName = Name 'String_break_%p' p = ($<other_player_status>.text) AddToStringLookup = true
	if ScreenElementExists id = <Name>
		DestroyScreenElement id = <Name>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = battlemode_container
		material = sys_BM_Snap01_sys_BM_Snap01
		rgba = [200 200 200 200]
		Pos = (<begin_pos>)
		Scale = (1.3, 1.6)
		rot_angle = <string_rotation>
		just = [center bottom]
		z_priority = 2
	}
	if ($<other_player_status>.lefthanded_button_ups = 1)
		switch <Color>
			case green
			<Color> = orange
			case red
			<Color> = blue
			case yellow
			<Color> = yellow
			case blue
			<Color> = red
			case orange
			<Color> = green
		endswitch
	endif
	formatText checksumName = name_string '%s_string%p' s = (($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.name_string) p = ($<other_player_status>.text) AddToStringLookup = true
	if ScreenElementExists id = <name_string>
		legacydoscreenelementmorph {
			id = <name_string>
			alpha = 0
		}
	endif
	Wait \{15
		gameframe}
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script repair_string 
	Color = ($gem_colors [<id>])
	if ($<other_player_status>.lefthanded_button_ups = 1)
		switch <Color>
			case green
			<Color> = orange
			case red
			<Color> = blue
			case yellow
			<Color> = yellow
			case blue
			<Color> = red
			case orange
			<Color> = green
		endswitch
	endif
	formatText checksumName = name_string '%s_string%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = ($<other_player_status>.text) AddToStringLookup = true
	if ScreenElementExists id = <name_string>
		legacydoscreenelementmorph {
			id = <name_string>
			alpha = 1
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
	switch <difficulty>
		case easy
		<repair_ammount> = ($battlemode_powerups [5].easy_repair)
		case medium
		<repair_ammount> = ($battlemode_powerups [5].medium_repair)
		case hard
		<repair_ammount> = ($battlemode_powerups [5].hard_repair)
		case expert
		<repair_ammount> = ($battlemode_powerups [5].expert_repair)
	endswitch
	<repair_ammount> = (<repair_ammount> * $battle_do_or_die_attack_scale)
	CastToInteger \{repair_ammount}
	victim_is_local = 1
	if ($<other_player_status>.Player = 1)
		spawnscript \{ghm_battlemode_damageinc_attack_p1}
	else
		if ($is_network_game)
			<victim_is_local> = 0
		endif
		spawnscript \{ghm_battlemode_damageinc_attack_p2}
	endif
	if (<difficulty> = easy)
		highest_value = 3
	else
		if (<difficulty> = medium)
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
	printf qs(0x27d84ac5) s = <X>
	SpawnScriptNow break_string params = {id = (<X> - 1) other_player_status = <other_player_status>} id = battlemode
	SpawnScriptNow update_broken_button params = {id = (<X> - 1) other_player_status = <other_player_status>} id = battlemode
	update_broken_string_arrows id = (<X> - 1) other_player_status = <other_player_status>
	bail = 0
	if NOT ($<other_player_status>.broken_string_mask = 0)
		if ($<other_player_status>.whammy_attack < 1)
			<bail> = 1
		endif
	endif
	Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
	if (<bail>)
		return
	endif
	GetHeldPattern controller = ($<other_player_status>.controller) Player = ($<other_player_status>.Player) nobrokenstring
	total_broken_strings = 1
	GetArraySize \{$gem_colors}
	begin
	last_hold_pattern = <hold_pattern>
	GetHeldPattern controller = ($<other_player_status>.controller) Player = ($<other_player_status>.Player) nobrokenstring
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
						Change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green - 1)
						mask = 4369
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_green) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_green = 0)
							repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
						endif
						case 1
						Change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red - 1)
						mask = 65809
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_red) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_red = 0)
							repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
						endif
						case 2
						Change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow - 1)
						mask = 69649
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_yellow) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_yellow = 0)
							repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
						endif
						case 3
						Change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue - 1)
						mask = 69889
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_blue) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_blue = 0)
							repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
						endif
						case 4
						Change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange - 1)
						mask = 69904
						<net_update_flags> = (<net_update_flags> || <check_button>)
						Battle_SFX_Repair_Broken_String num_strums = ($<other_player_status>.broken_string_orange) player_pan = ($<other_player_status>.Player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_orange = 0)
							repair_string other_player_status = <other_player_status> id = <array_count> Player = ($<other_player_status>.Player)
						endif
					endswitch
					if ($<other_player_status>.<broken_string_id> = 0)
						if ($<other_player_status>.whammy_attack < 1)
							Wait \{1
								gameframe}
							Change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
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
			$<other_player_status>.Player = 2)
		if ($<other_player_status>.whammy_attack < 1)
			GetSongTimeMs
			if (<time> - $boss_lastbrokenstringtime > $current_boss.BrokenStringSpeed.($player1_status.difficulty))
				Change boss_pattern = ($<other_player_status>.broken_string_mask)
				Change boss_lastbrokenstringtime = <time>
			else
				Change \{boss_pattern = 0}
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if ($<other_player_status>.whammy_attack < 1)
		Change structurename = <other_player_status> broken_string_mask = 0
	endif
endscript

script animate_lefty_flip 
	GetArraySize \{$gem_colors}
	array_count = 0
	ExtendCrc button_up_pixel_array ($<other_player_status>.text) out = pixel_array
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	Player = ($<other_player_status>.Player)
	formatText checksumName = name_base '%s_base%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = ($<other_player_status>.text) AddToStringLookup = true
	if ($<other_player_status>.lefthanded_button_ups = 1)
		start_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.left_pos_2d)
		end_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.pos_2d)
	else
		start_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.pos_2d)
		end_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.left_pos_2d)
	endif
	GetScreenElementPosition id = <name_base>
	bottom_bar_offset = (<end_bottom_bar_pos> - <start_bottom_bar_pos>)
	<bottom_bar_pos> = (<screenelementpos> + <bottom_bar_offset> - (<pixels> * (0.0, 1.0)))
	legacydoscreenelementmorph {
		id = <name_base>
		Pos = (<bottom_bar_pos>)
		just = [center center]
		time = 0.15
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Wait \{0.15
		Seconds}
	<array_count> = 0
	begin
	Color = ($gem_colors [<array_count>])
	formatText checksumName = name_base '%s_base%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = ($<other_player_status>.text) AddToStringLookup = true
	legacydoscreenelementmorph {
		id = <name_base>
		Pos = (0.0, 0.0)
		just = [center center]
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script update_training_whammy_bar 
	formatText checksumName = training_whammy_checksum 'training_whammy_bar_%s' s = ($<other_player_status>.Player)
	formatText checksumName = training_whammy_text_checksum 'training_whammy_bar_text_%s' s = ($<other_player_status>.Player)
	if ScreenElementExists id = <training_whammy_checksum>
		DestroyScreenElement id = <training_whammy_checksum>
	endif
	if ScreenElementExists id = <training_whammy_text_checksum>
		DestroyScreenElement id = <training_whammy_text_checksum>
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
		id = <training_whammy_checksum>
		parent = battlemode_container
		texture = battle_hud_whammy_bar
		rgba = [255 255 255 255]
		Pos = <training_whammy_pos>
		rot_angle = <training_whammy_angle>
		Scale = 0.8
		alpha = 1
		just = [center bottom]
		z_priority = 6
	}
	CreateScreenElement {
		Type = TextElement
		parent = <training_whammy_checksum>
		id = <training_whammy_text_checksum>
		Pos = (120.0, 145.0)
		text = qs(0x1552707b)
		rot_angle = 53
		font = fontgrid_text_3
		rgba = [255 255 255 255]
		just = [center bottom]
		Scale = 1.2
		z_priority = 7
	}
	SpawnScriptNow animate_whammy_bar params = {id = <training_whammy_checksum> other_player_status = <other_player_status> training_whammy_pos = <training_whammy_pos> training_whammy_angle = <training_whammy_angle>} id = battlemode
endscript

script animate_whammy_bar 
	pulse_on = 0
	begin
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	formatText checksumName = name_base '%s_base%p' s = (($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.name_string) p = ($<other_player_status>.text) AddToStringLookup = true
	original_bottom_bar_pos = (0.0, 0.0)
	whammy_attack = (($<other_player_status>.whammy_attack) / ($battle_do_or_die_attack_scale / 1.0))
	bottom_bar_pos = (<original_bottom_bar_pos> - ((0.0, 0.0) * <whammy_attack>))
	if NOT ($<other_player_status>.whammy_attack < 1)
		if (<pulse_on> = 0)
			legacydoscreenelementmorph {
				id = <name_base>
				alpha = 1.0
				Pos = (<bottom_bar_pos> + (0.0, 5.0))
				just = [center center]
				time = 0.15
			}
		else
			legacydoscreenelementmorph {
				id = <name_base>
				alpha = 1.0
				Pos = (<bottom_bar_pos> - (0.0, 5.0))
				just = [center center]
				time = 0.15
			}
		endif
	else
		legacydoscreenelementmorph {
			id = <name_base>
			alpha = 1
			Pos = (<original_bottom_bar_pos> + (0.0, 30.0))
			just = [center center]
			time = 0.15
		}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	whammy_attack = (($<other_player_status>.whammy_attack) / ($battle_do_or_die_attack_scale / 2.0))
	training_whammy_pos_new = (<training_whammy_pos> - ((0.0, 15.0) * <whammy_attack>))
	legacydoscreenelementmorph {
		id = <id>
		Pos = <training_whammy_pos_new>
		time = 0.15
	}
	if NOT ($<other_player_status>.whammy_attack < 1)
		if (<pulse_on> = 0)
			legacydoscreenelementmorph {
				id = <id>
				rot_angle = (<training_whammy_angle> - 20)
				just = [center bottom]
				time = 0.15
			}
			<pulse_on> = 1
		else
			legacydoscreenelementmorph {
				id = <id>
				rot_angle = <training_whammy_angle>
				just = [center bottom]
				time = 0.15
			}
			<pulse_on> = 0
		endif
	else
		legacydoscreenelementmorph {
			id = <id>
			rot_angle = <training_whammy_angle>
			just = [center bottom]
			alpha = 0
			time = 0.3
		}
		Wait \{0.15
			Seconds}
		GetArraySize \{$gem_colors}
		array_count = 0
		begin
		Color = ($gem_colors [<array_count>])
		formatText checksumName = name_base '%s_base%p' s = (($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.name_string) p = ($<other_player_status>.text) AddToStringLookup = true
		legacydoscreenelementmorph {
			id = <name_base>
			alpha = 1
			Pos = <original_bottom_bar_pos>
			just = [center center]
			time = 0.1
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
	broken_string_id = ($broken_strings [<id>])
	Color = ($gem_colors [<id>])
	button_up_name = (($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.Name)
	ExtendCrc button_up_pixel_array ($<other_player_status>.text) out = pixel_array
	<player_text> = ($<other_player_status>.text)
	begin
	<num_hammers> = 0
	if NOT ($<other_player_status>.<broken_string_id> = 0)
		switch <id>
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
	SetArrayElement ArrayName = <pixel_array> globalarray index = <id> NewValue = <up_pixels>
	Wait \{1
		gameframe}
	repeat
endscript

script update_broken_string_arrows 
	broken_string_id = ($broken_strings [<id>])
	string_id = <id>
	formatText checksumName = arrow_checksum 'broken_string_arrow_%i_%s' i = <id> s = ($<other_player_status>.Player)
	formatText checksumName = text_checksum 'broken_string_text_%i_%s' i = <id> s = ($<other_player_status>.Player)
	if ScreenElementExists id = <arrow_checksum>
		DestroyScreenElement id = <arrow_checksum>
	endif
	if ScreenElementExists id = <text_checksum>
		DestroyScreenElement id = <text_checksum>
	endif
	formatText checksumName = container_id 'gem_container%p' p = ($<other_player_status>.text) AddToStringLookup = true
	Color = ($gem_colors [<id>])
	arrow_pos = ((($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.pos_2d) - (0.0, 30.0))
	lefty_arrow_pos = ((($button_up_models [(($<other_player_status>.Player) -1)]).<Color>.left_pos_2d) - (0.0, 30.0))
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
		id = <arrow_checksum>
		parent = battlemode_container
		texture = battle_hud_arrow
		rgba = [255 255 255 255]
		Pos = <start_pos>
		alpha = 1
		Scale = 0.3
		just = [center bottom]
		z_priority = 7
	}
	GetScreenElementDims id = <arrow_checksum>
	x_offset = (<width> / 2)
	CreateScreenElement {
		Type = TextElement
		parent = <arrow_checksum>
		id = <text_checksum>
		Pos = ((53.0, 150.0) + (<x_offset> * (1.0, 0.0)))
		text = qs(0x72a02f55)
		font = fontgrid_text_3
		rgba = [255 255 255 255]
		just = [center bottom]
		Scale = 2
		z_priority = 8
	}
	SpawnScriptNow animate_arrow params = {broken_string_id = <broken_string_id> string_id = <string_id> arrow_id = <arrow_checksum> other_player_status = <other_player_status> broken_string_id = <broken_string_id> arrow_pos = <arrow_pos> lefty_arrow_pos = <lefty_arrow_pos>} id = battlemode
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
		whammy_attack = (($<other_player_status>.whammy_attack) / ($battle_do_or_die_attack_scale / 2.0))
		<animate_pos> = (<animate_pos> - ((0.0, 15.0) * <whammy_attack>))
	endif
	if NOT ($<other_player_status>.<broken_string_id> = 0)
		if (<pulse_on> = 0)
			if ScreenElementExists id = <arrow_id>
				legacydoscreenelementmorph {
					id = <arrow_id>
					Pos = (<animate_pos> - (0.0, 10.0))
					just = [center bottom]
					time = 0.1
				}
			endif
			Wait \{0.1
				Seconds}
			<pulse_on> = 1
		else
			if ScreenElementExists id = <arrow_id>
				legacydoscreenelementmorph {
					id = <arrow_id>
					Pos = <animate_pos>
					just = [center bottom]
					time = 0.1
				}
			endif
			Wait \{0.1
				Seconds}
			<pulse_on> = 0
		endif
		<frame_count> = 0
	else
		if ScreenElementExists id = <arrow_id>
			legacydoscreenelementmorph {
				id = <arrow_id>
				Pos = <animate_pos>
				just = [center bottom]
				alpha = 0
				time = 0.3
			}
		endif
		Wait \{0.3
			Seconds}
		if ScreenElementExists id = <arrow_id>
			DestroyScreenElement id = <arrow_id>
		endif
		break
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script create_battlemode_highway_effects 
	Player = 1
	begin
	if (<Player> = 1)
		player_text = 'p1'
	else
		player_text = 'p2'
	endif
	pos_table = ($highway_pos_table [(<Player> -1)])
	lpos = (($sidebar_x [(<Player> -1)] * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)))
	langle = ($sidebar_angle [(<Player> -1)])
	rpos = ((((640.0 - $sidebar_x [(<Player> -1)]) + 640.0) * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle [(<Player> -1)]))
	Scale = (((<pos_table>.sidebar_x_scale) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
	rscale = (((0 - (<pos_table>.sidebar_x_scale)) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = cont 'battle_sidebar_container_left%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		DestroyScreenElement id = <cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <cont>
		parent = <container_id>
		Pos = <lpos>
		rot_angle = <langle>
		just = [center bottom]
		z_priority = 0
	}
	<starpower_fx_scale> = (<pos_table>.starpower_fx_scale)
	starpower_pos = (((-55.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((55.0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((2.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((1.1 * <starpower_fx_scale>) * (0.0, 1.0)))
	formatText checksumName = Name 'battle_sidebar_left_glow%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = <cont>
		material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		Pos = <starpower_pos>
		Scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((-2.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0.9 * <starpower_fx_scale>) * (0.0, 1.0)))
	formatText checksumName = Name 'battle_sidebar_left_Lightning01%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = <cont>
		material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [0 0 128 128]
		Pos = <starpower_pos>
		rot_angle = (180)
		Scale = <starpower_scale>
		just = [center top]
		z_priority = 0
	}
	formatText checksumName = cont 'battle_sidebar_container_right%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		DestroyScreenElement id = <cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <cont>
		parent = <container_id>
		Pos = <rpos>
		rot_angle = <rangle>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((55.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((55.0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((-2.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((1.1 * <starpower_fx_scale>) * (0.0, 1.0)))
	formatText checksumName = Name 'battle_sidebar_Right_glow%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = <cont>
		material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		Pos = <starpower_pos>
		Scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((2.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0.9 * <starpower_fx_scale>) * (0.0, 1.0)))
	formatText checksumName = Name 'battle_sidebar_Right_Lightning01%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = <cont>
		material = sys_Big_Bolt01_sys_Big_Bolt01
		rgba = [0 0 128 128]
		Pos = <starpower_pos>
		rot_angle = (180)
		Scale = <starpower_scale>
		just = [center top]
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

script gh_battlemode_player1_tui_whammy_start 
	DestroyScreenElement \{id = tui_player1}
	Wait \{1
		Frame}
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = Name 'BattleMode_TUI%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		id = tui_player1
		dims = (512.0, 128.0)
		Scale = (0.845, 0.65000004)
		Pos = (640.0, 630.0)
		material = mat_bm_ice01
		z_priority = 18
	}
endscript

script gh_battlemode_player2_tui_whammy_start 
	DestroyScreenElement \{id = tui_player2}
	Wait \{1
		Frame}
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = Name 'BattleMode_TUI%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		id = tui_player2
		dims = (512.0, 128.0)
		Scale = (0.845, 0.65000004)
		Pos = (640.0, 630.0)
		material = mat_bm_ice01
		z_priority = 18
	}
endscript

script gh_battlemode_player1_tui_whammy_end 
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = fx_id 'BattleModeP1_fx%p' p = <player_text> AddToStringLookup = true
	ExtendCrc <fx_id> '_TUI_particle1' out = particle1_id
	Create2DParticleSystem {
		id = <particle1_id>
		Pos = (600.0, 640.0)
		z_priority = 18.0
		material = mat_ice_chunk01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (0.1, 0.1)
		end_scale = (0.25, 0.25)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.05
		emit_dir = 0.0
		emit_spread = 66.0
		velocity = 14.0
		friction = (0.0, 65.0)
		time = 1.0
	}
	ExtendCrc <fx_id> '_TUI_particle2' out = particle2_id
	Create2DParticleSystem {
		id = <particle2_id>
		Pos = (640.0, 640.0)
		z_priority = 13.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (2.1, 2.105)
		end_scale = (0.02, 0.02)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 1.0
		emit_radius = 1.0
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 22.0
		friction = (0.0, 64.0)
		time = 1.0
	}
	ExtendCrc <fx_id> '_TUI_particle3' out = particle3_id
	Create2DParticleSystem {
		id = <particle3_id>
		Pos = (680.0, 640.0)
		z_priority = 18.0
		material = mat_ice_chunk01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (0.15, 0.15)
		end_scale = (0.120000005, 0.120000005)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 45.0
		velocity = 22.0
		friction = (0.0, 66.0)
		time = 1.0
	}
	ExtendCrc <fx_id> '_TUI_particle4' out = particle4_id
	Create2DParticleSystem {
		id = <particle4_id>
		Pos = (640.0, 640.0)
		z_priority = 18.0
		material = mat_ice_chunk01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (0.2105, 0.2105)
		end_scale = (0.51, 0.61)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 11.0
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 270.0
		velocity = 22.0
		friction = (0.0, 55.0)
		time = 1.25
	}
	Wait \{3
		frames}
	DestroyScreenElement \{id = tui_player1}
	Wait \{7
		frames}
	Destroy2DParticleSystem id = <particle1_id> kill_when_empty
	Destroy2DParticleSystem id = <particle2_id> kill_when_empty
	Destroy2DParticleSystem id = <particle3_id> kill_when_empty
	Destroy2DParticleSystem id = <particle4_id> kill_when_empty
endscript

script gh_battlemode_player2_tui_whammy_end 
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	formatText checksumName = fx_id 'BattleModeP2_fx%p' p = <player_text> AddToStringLookup = true
	ExtendCrc <fx_id> '_TUI_particle1' out = particle1_id
	Create2DParticleSystem {
		id = <particle1_id>
		Pos = (600.0, 640.0)
		z_priority = 18.0
		material = mat_ice_chunk01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (0.1, 0.1)
		end_scale = (0.25, 0.25)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.05
		emit_dir = 0.0
		emit_spread = 66.0
		velocity = 14.0
		friction = (0.0, 65.0)
		time = 1.0
	}
	ExtendCrc <fx_id> '_TUI_particle2' out = particle2_id
	Create2DParticleSystem {
		id = <particle2_id>
		Pos = (640.0, 640.0)
		z_priority = 13.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (2.1, 2.105)
		end_scale = (0.02, 0.02)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 1.0
		emit_radius = 1.0
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 22.0
		friction = (0.0, 64.0)
		time = 1.0
	}
	ExtendCrc <fx_id> '_TUI_particle3' out = particle3_id
	Create2DParticleSystem {
		id = <particle3_id>
		Pos = (680.0, 640.0)
		z_priority = 18.0
		material = mat_ice_chunk01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (0.15, 0.15)
		end_scale = (0.120000005, 0.120000005)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.02
		emit_dir = 0.0
		emit_spread = 45.0
		velocity = 22.0
		friction = (0.0, 66.0)
		time = 1.0
	}
	ExtendCrc <fx_id> '_TUI_particle4' out = particle4_id
	Create2DParticleSystem {
		id = <particle4_id>
		Pos = (640.0, 640.0)
		z_priority = 18.0
		material = mat_ice_chunk01
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (0.2105, 0.2105)
		end_scale = (0.51, 0.61)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 11.0
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 270.0
		velocity = 22.0
		friction = (0.0, 55.0)
		time = 1.25
	}
	Wait \{3
		frames}
	DestroyScreenElement \{id = tui_player2}
	Wait \{7
		frames}
	Destroy2DParticleSystem id = <particle1_id> kill_when_empty
	Destroy2DParticleSystem id = <particle2_id> kill_when_empty
	Destroy2DParticleSystem id = <particle3_id> kill_when_empty
	Destroy2DParticleSystem id = <particle4_id> kill_when_empty
endscript

battle_easy_drain_offset = 0
battle_medium_drain_offset = 1500
battle_hard_drain_offset = 3000
battle_expert_drain_offset = 4500
speaker_attack_num = 0
soundboard_attack_num = 0
guitar_attack_num = 0
guitar_attack_num2 = 0
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
		name_text = qs(0x91639f57)
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
		Name = Hyperspeed
		name_text = qs(0x92754b35)
		weight = 10
		weight_low = 0
		weight_losing = 0
		Scr = battle_hyperspeed
		params = {
		}
		card_texture = icon_attack_blast
		easy_ratio = 0.9
		medium_ratio = 0.9
		hard_ratio = 0.8
		expert_ratio = 0.8
		drain_time = 5000
		immediate = 1
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
	setplayerinfo <Player> battlemode_creation_selection = -1
	setplayerinfo <Player> current_num_powerups = 0
	setplayerinfo <Player> final_blow_powerup = -1
	setplayerinfo <Player> battle_text_count = 0
	setplayerinfo <Player> shake_notes = -1
	setplayerinfo <Player> double_notes = -1
	setplayerinfo <Player> mine_attack = -1
	setplayerinfo <Player> hyperspeed_attack = -1
	setplayerinfo <Player> diffup_notes = -1
	setplayerinfo <Player> lefty_notes = -1
	setplayerinfo <Player> whammy_attack = -1
	setplayerinfo <Player> stealing_powerup = -1
	setplayerinfo <Player> last_selected_attack = -1
	setplayerinfo <Player> last_hit_note = None
	setplayerinfo <Player> broken_string_mask = 0
	setplayerinfo <Player> broken_string_green = 0
	setplayerinfo <Player> broken_string_red = 0
	setplayerinfo <Player> broken_string_yellow = 0
	setplayerinfo <Player> broken_string_blue = 0
	setplayerinfo <Player> broken_string_orange = 0
	setplayerinfo <Player> battle_num_attacks = 0
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
endscript

script battlemode_deinit 
	Change \{disable_attacks = 1}
	KillSpawnedScript \{id = battlemode}
	setplayerinfo <Player> battlemode_creation_selection = -1
	setplayerinfo <Player> current_num_powerups = 0
	setplayerinfo <Player> battle_text_count = 0
	setplayerinfo <Player> shake_notes = -1
	setplayerinfo <Player> double_notes = -1
	setplayerinfo <Player> mine_attack = -1
	setplayerinfo <Player> hyperspeed_attack = -1
	setplayerinfo <Player> diffup_notes = -1
	setplayerinfo <Player> lefty_notes = -1
	setplayerinfo <Player> whammy_attack = -1
	setplayerinfo <Player> stealing_powerup = -1
	setplayerinfo <Player> last_selected_attack = -1
	setplayerinfo <Player> last_hit_note = None
	setplayerinfo <Player> broken_string_mask = 0
	setplayerinfo <Player> broken_string_green = 0
	setplayerinfo <Player> broken_string_red = 0
	setplayerinfo <Player> broken_string_yellow = 0
	setplayerinfo <Player> broken_string_blue = 0
	setplayerinfo <Player> broken_string_orange = 0
	getplayerinfo <Player> lefthanded_gems_flip_save
	getplayerinfo <Player> lefthanded_gems
	if NOT (<lefthanded_gems_flip_save> = <lefthanded_gems>)
		setplayerinfo <Player> lefthanded_gems = <lefthanded_gems_flip_save>
	endif
	getplayerinfo <Player> lefthanded_button_ups_flip_save
	getplayerinfo <Player> lefthanded_button_ups
	if NOT (<lefthanded_button_ups_flip_save> = <lefthanded_button_ups>)
		setplayerinfo <Player> lefthanded_button_ups = <lefthanded_button_ups_flip_save>
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
	KillSpawnedScript \{Name = attack_bolt}
endscript

script restore_saved_powerups 
	if ($battle_do_or_die = 1)
		<array_count> = 0
		getplayerinfo \{1
			save_num_powerups}
		if (<save_num_powerups> > 0)
			begin
			p1_powerup = ($save_current_powerups_p1 [<array_count>])
			battlemode_ready battle_gem = <p1_powerup> Player = 1 battle_text = 0
			<array_count> = (<array_count> + 1)
			repeat <save_num_powerups>
		endif
		<array_count> = 0
		getplayerinfo \{2
			save_num_powerups}
		if (<save_num_powerups> > 0)
			begin
			p2_powerup = ($save_current_powerups_p2 [<array_count>])
			battlemode_ready battle_gem = <p2_powerup> Player = 2 battle_text = 0
			<array_count> = (<array_count> + 1)
			repeat <save_num_powerups>
		endif
	endif
endscript

script battlemode_select \{Player = 1}
	setplayerinfo <Player> battlemode_creation_selection = -1
	total_weight = 0
	num_attacks = 0
	getplayerinfo <Player> difficulty out = other_player_difficulty
	next_attack = -1
	getplayerinfo <Player> current_num_powerups
	if (<current_num_powerups> > 0)
		if (<Player> = 1)
			<next_attack> = ($current_powerups_p1 [(<current_num_powerups> - 1)])
		else
			<next_attack> = ($current_powerups_p2 [(<current_num_powerups> - 1)])
		endif
	endif
	GetArraySize \{$battlemode_powerups}
	array_count = 0
	begin
	if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
		getplayerinfo <Player> current_health
		if (<current_health> > 0.5)
			getplayerinfo <Player> last_selected_attack
			if (<last_selected_attack> = <array_count> || <next_attack> = <array_count>)
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_low)
			else
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight)
			endif
		else
			total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_losing)
		endif
	endif
	if ($battlemode_powerups [<array_count>].weight > 0)
		setplayerinfo <Player> battlemode_creation_selection = 0
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetRandomValue Name = select_weight a = 0 b = (<total_weight> -1) integer
	if (<num_attacks> = 0)
		setplayerinfo <Player> battlemode_creation_selection = 0
		return
	endif
	array_count = 0
	begin
	if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
		getplayerinfo <Player> current_health
		if (<current_health> > 0.5)
			getplayerinfo <Player> last_selected_attack
			if (<last_selected_attack> = <array_count> || <next_attack> = <array_count>)
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_low)
			else
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight)
			endif
		else
			select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_losing)
		endif
	endif
	if (<select_weight> < 0)
		setplayerinfo <Player> battlemode_creation_selection = <array_count>
		setplayerinfo <Player> last_selected_attack = <array_count>
		break
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if playerinfoequals <Player> battlemode_creation_selection = -1
		printstruct <...>
		ScriptAssert \{qs(0xf8237d93)}
	endif
endscript
medium_scale = 0.55
small_scale = 0.4

script print_powerup_arrays 
	getplayerinfo \{1
		current_num_powerups}
	printf qs(0x4b25d7cb) a = <current_num_powerups>
	GetArraySize \{$current_powerups_p1}
	array_count = 0
	begin
	printf qs(0x1dff100d) c = <array_count> p = ($current_powerups_p1 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	getplayerinfo \{2
		current_num_powerups}
	printf qs(0x3cbb053b) a = <current_num_powerups>
	GetArraySize \{$current_powerups_p2}
	<array_count> = 0
	begin
	printf qs(0x1dff100d) c = <array_count> p = ($current_powerups_p2 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script battlemode_ready \{battle_gem = 0
		Player = 1
		steal = 0
		battle_text = 1}
	if (<Player> = 1)
		SoundEvent \{event = star_power_awarded_sfx_p1}
	else
		SoundEvent \{event = star_power_awarded_sfx_p2}
	endif
	getplayerinfo <Player> current_num_powerups
	if (<current_num_powerups> >= $max_num_powerups)
		<current_num_powerups> = (<current_num_powerups> - 1)
		if (<Player> = 1)
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
		setplayerinfo <Player> current_num_powerups = <current_num_powerups>
		printf qs(0x8501ab2e) n = <Player> a = <current_num_powerups>
	endif
	if NOT (ScreenElementExists id = battlemode_container)
		return
	endif
	if (<current_num_powerups> < 0)
		printf \{qs(0x2203e72c)}
		printf qs(0xedc12aa0) p = <Player> b = <battle_gem>
		print_powerup_arrays
	endif
	select = <battle_gem>
	if (<Player> = 1)
		SetArrayElement ArrayName = current_powerups_p1 globalarray index = <current_num_powerups> NewValue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		SetArrayElement ArrayName = current_powerups_p2 globalarray index = <current_num_powerups> NewValue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	addtoplayerinfo <Player> current_num_powerups = 1
	printf qs(0xff335930) n = <Player> a = (<current_num_powerups> + 1)
	getplayerinfo <Player> last_hit_note
	if (<last_hit_note> = None)
		<last_hit_note> = green
	endif
	if playerinfoequals <Player> lefthanded_button_ups = 1
		begin_pos = ((($button_up_models [(<Player> -1)]).<last_hit_note>.left_pos_2d) - (0.0, 90.0))
	else
		begin_pos = ((($button_up_models [(<Player> -1)]).<last_hit_note>.pos_2d) - (0.0, 90.0))
	endif
	if (<Player> = 1)
		<begin_pos> = (<begin_pos> - (225.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (225.0, 0.0))
	endif
	formatText checksumName = card_checksum 'battlecard_%i_%s' i = $battlecard_unique_index s = <Player> AddToStringLookup
	Change battlecard_unique_index = ($battlecard_unique_index + 1)
	if ($battlecard_unique_index > 256)
		Change \{battlecard_unique_index = 0}
	endif
	if (<Player> = 1)
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
	update_battlecards_add current_num_powerups = <current_num_powerups> Player = <Player>
	if ($show_battle_text = 1)
		if (<battle_text> = 1)
			SpawnScriptNow attack_ready_text params = {current_num_powerups = <current_num_powerups> select = <select> Player = <Player>}
		endif
	endif
endscript

script attack_ready_text 
	if (<Player> = 1)
		<other_player> = 2
	else
		<other_player> = 1
	endif
	Wait \{0.3
		Seconds}
	formatText checksumName = text_checksum 'attack_ready_text_%s' s = <Player>
	if ScreenElementExists id = <text_checksum>
		DestroyScreenElement id = <text_checksum>
	endif
	attack_name = ($battlemode_powerups [<select>].name_text)
	if ($battlemode_powerups [<select>].Name = LeftyNotes)
		getplayerinfo <other_player> lefty_notes
		if NOT (<lefty_notes> < 1)
			if playerinfoequals <other_player> lefthanded_button_ups = 0
				<attack_name> = ($battlemode_powerups [<select>].alt_name_text)
			endif
		else
			if playerinfoequals <other_player> lefthanded_button_ups = 1
				<attack_name> = ($battlemode_powerups [<select>].alt_name_text)
			endif
		endif
	endif
	temp_pos_p1 = ($battle_hud_2d_elements.attack_ready_text_pos_p1)
	temp_pos_p2 = ($battle_hud_2d_elements.attack_ready_text_pos_p2)
	if German
		<temp_pos_p1> = (377.0, 204.0)
		<temp_pos_p2> = (911.0, 244.0)
	endif
	if (<Player> = 1)
		text_pos = <temp_pos_p1>
		CreateScreenElement {
			Type = TextElement
			id = <text_checksum>
			parent = battlemode_container
			Pos = <text_pos>
			text = <attack_name>
			font = fontgrid_text_a1
			Scale = 0.9
			rgba = [255 255 255 255]
			just = [left bottom]
			z_priority = 25
		}
	else
		text_pos = <temp_pos_p2>
		CreateScreenElement {
			Type = TextElement
			id = <text_checksum>
			parent = battlemode_container
			Pos = <text_pos>
			text = <attack_name>
			font = fontgrid_text_a1
			Scale = 0.9
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
	if (<Player> = 1)
		player_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p1)
		small_pos = ($battle_hud_2d_elements.card_3_off_p1)
	else
		player_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p2)
		small_pos = ($battle_hud_2d_elements.card_3_off_p2)
	endif
	if (<current_num_powerups> > 0)
		if (<Player> = 1)
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
			if (<Player> = 1)
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
			if (<Player> = 1)
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
	if (<Player> = 1)
		player_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p1)
		small_pos = ($battle_hud_2d_elements.card_3_off_p1)
	else
		player_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p2)
		small_pos = ($battle_hud_2d_elements.card_3_off_p2)
	endif
	getplayerinfo <Player> current_num_powerups
	if (<current_num_powerups> > 0)
		if (<Player> = 1)
			card_checksum = ($current_battlecard_p1 [0])
		else
			card_checksum = ($current_battlecard_p2 [0])
		endif
		legacydoscreenelementmorph {
			id = <card_checksum>
			Pos = <player_pos>
			Scale = 1
			time = 0.3
		}
		if (<current_num_powerups> > 1)
			if (<Player> = 1)
				card_checksum = ($current_battlecard_p1 [1])
			else
				card_checksum = ($current_battlecard_p2 [1])
			endif
			legacydoscreenelementmorph {
				id = <card_checksum>
				Pos = <player_pos>
				Scale = 1
				time = 0.3
			}
			if (<Player> = 1)
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
		endif
	endif
endscript

script add_battle_text 
endscript

script remove_battle_text 
endscript

script test_battle_trigger 
	battlemode_fill
	Wait \{5
		Seconds}
	battle_trigger_on \{Player = 2}
	Wait \{1
		gameframe}
	battle_trigger_on \{Player = 2}
	Wait \{1
		gameframe}
	battle_trigger_on \{Player = 1}
	Wait \{1
		gameframe}
	battle_trigger_on \{Player = 1}
endscript

script roadie_debug_attack \{gem = 0
		Player = 1}
	battlemode_ready battle_gem = <gem> Player = 2
	Wait \{0.1
		Second}
	battle_trigger_on \{Player = 2}
endscript

script debug_attack 
	battlemode_ready battle_gem = <gem> Player = 2
	Wait \{0.1
		Second}
	battle_trigger_on \{Player = 2}
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
	getplayerinfo <Player> current_num_powerups
	if (<Player> = 1)
		card_checksum = ($current_battlecard_p1 [(<current_num_powerups> - 1)])
	else
		card_checksum = ($current_battlecard_p2 [(<current_num_powerups> - 1)])
	endif
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	addtoplayerinfo <Player> current_num_powerups = -1
	printf qs(0xe0c84f86) n = <Player> a = (<current_num_powerups> -1)
endscript

script battle_trigger_on 
	getplayerinfo <Player> current_num_powerups
	if (<current_num_powerups> = 0)
		return
	endif
	if (<Player> = 1)
		<other_player> = 2
		getplayerinfo \{2
			difficulty
			out = other_difficulty}
		<other_player> = 2
		select = ($current_powerups_p1 [(<current_num_powerups> - 1)])
		getplayerinfo <other_player> current_health
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 2 receiving_player_current_crowd_level = <current_health>
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
		getplayerinfo \{1
			difficulty
			out = other_difficulty}
		<other_player> = 1
		select = ($current_powerups_p2 [(<current_num_powerups> - 1)])
		getplayerinfo <other_player> current_health
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 1 receiving_player_current_crowd_level = <current_health>
	endif
	remove_battle_card Player = <Player>
	if (<current_num_powerups> < 0)
		printf qs(0xab61db71) s = <Player>
		printf qs(0xa03e74c4) i = (<current_num_powerups>)
		printf qs(0x0b429510) i = <select>
	endif
	update_battlecards_remove Player = <Player>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	other_player_difficulty = easy
	if (<Player> = 1)
		getplayerinfo \{2
			difficulty
			out = other_player_difficulty}
	else
		getplayerinfo \{1
			difficulty
			out = other_player_difficulty}
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
	setplayerinfo <Player> final_blow_powerup = <select>
	if NOT playerinfoequals <Player> highway_layout = solo_highway
		SpawnScriptNow ($battlemode_powerups [<select>].Scr) id = battlemode params = {drain_time = <drain_time>
			Player = <other_player>
			other_player = <other_player>
			Player = <Player>
			difficulty = <other_difficulty>
			($battlemode_powerups [<select>].params)}
	endif
	addtoplayerinfo <Player> battle_num_attacks = 1
	getplayerinfo <Player> band_member
	getplayerinfo <other_player> band_member out = other_band_member
	Band_PlayAttackAnim Name = <band_member> Type = <select>
	Band_PlayResponseAnim Name = <other_band_member> Type = <select>
	if playerinfoequals <Player> highway_layout = solo_highway
		SpawnScriptNow hammer_rock_meter params = {other_player = <other_player>}
	else
		SpawnScriptNow hammer_highway params = {other_player = <other_player>}
	endif
	getplayerinfo <other_player> part out = other_part
	if ((<other_part> = bass) || (<other_part> = guitar))
		activatestarpowerpulse Player = <other_player> num = 1 length = 35 Strength = 20 Priority = 100
	endif
	if ($battlemode_powerups [<select>].fire_bolt = 1)
		SpawnScriptNow attack_bolt params = {Player = <Player> other_player = <other_player>}
	endif
endscript

script attack_bolt \{bolt_angle = 60}
	bolt_pos_middle = (640.0, 230.0)
	bolt_pos_offset = (330.0, 0.0)
	formatText checksumName = attack_bolt 'attack_boltp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <attack_bolt>
		DestroyScreenElement id = <attack_bolt>
	endif
	if (<Player> = 1)
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
	<bolt_scale> = (0.5 * <bolt_scale>)
	CreateScreenElement {
		Type = SpriteElement
		id = <attack_bolt>
		parent = battlemode_container
		material = sys_Big_Bolt01_sys_Big_Bolt01
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.005
		num_uv_frames = (8.0, 1.0)
		rgba = [255 0 0 255]
		Pos = <bolt_pos>
		rot_angle = <bolt_angle>
		Scale = <bolt_scale>
		just = <bolt_just>
		z_priority = 10
	}
	Wait \{8
		gameframes}
	if ScreenElementExists id = <attack_bolt>
		DestroyScreenElement id = <attack_bolt>
	endif
	Wait \{2
		gameframes}
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
	if (<other_player> = 1)
		Change battle_flicker_difficulty_p1 = <flicker_ammount>
		spawnscript GH_BattleMode_Player1_SFX_Shake_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		Change battle_flicker_difficulty_p2 = <flicker_ammount>
		spawnscript GH_BattleMode_Player2_SFX_Shake_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	GetSongTimeMs
	CastToInteger \{time}
	getplayerinfo <other_player> shake_notes
	if (<shake_notes> = 1)
		return
	else
		setplayerinfo <other_player> shake_notes = 1
		SpawnScriptNow flicker_gems params = {Player = <Player> other_player = <other_player>}
		SpawnScriptNow shake_highway params = {other_player = <other_player>}
		hud_create_message Player = <Player> text = qs(0x48173411) Priority = 2
		begin
		getplayerinfo <other_player> shake_notes
		if (<shake_notes> = 1)
			WaitOneGameFrame
		else
			break
		endif
		repeat
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script flicker_gems 
	begin
	getplayerinfo <other_player> shake_notes
	if (<shake_notes> > -1)
		LaunchGemEvent event = flicker_on Player = <Player>
	else
		LaunchGemEvent event = flicker_off Player = <Player>
		break
	endif
	Wait \{3
		gameframes}
	repeat
endscript

script shake_highway 
	formatText checksumName = container_id 'gem_containerp%p' p = <other_player> AddToStringLookup = true
	GetScreenElementPosition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	begin
	if (<other_player> = 'p1')
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
	getplayerinfo <other_player> shake_notes
	if (<shake_notes> > -1)
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
	WaitOneGameFrame
	repeat
endscript

script hammer_highway \{push_p1 = (-70.0, 50.0)
		push_p2 = (70.0, 50.0)
		time = 0.1}
	if (<other_player> = 1)
		push_pos = <push_p1>
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		push_pos = <push_p2>
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		if (<other_player> = 1)
			Change \{battle_p1_highway_hammer = 1}
		else
			Change \{battle_p2_highway_hammer = 1}
		endif
		get_num_non_vocals_players_onscreen
		get_non_vocalist_player_number Player = <other_player>
		get_highway_pos_and_scale num_non_vocals_players = <num_non_vocals_players> non_vocalist_player = <non_vocalist_player> Player = <other_player>
		formatText checksumName = container_id 'highway_containerp%p' p = <other_player>
		original_position = <Pos>
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
		if (<other_player> = 1)
			Change \{battle_p1_highway_hammer = 0}
		else
			Change \{battle_p2_highway_hammer = 0}
		endif
	endif
endscript

script hammer_rock_meter 
	if (<other_player> = 1)
		push_pos = (-75.0, 50.0)
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		push_pos = (70.0, 50.0)
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		if (<other_player> = 1)
			Change \{battle_p1_highway_hammer = 1}
		else
			Change \{battle_p2_highway_hammer = 1}
		endif
		formatText checksumName = container_id 'HUD2D_rock_containerp%p' p = <other_player> AddToStringLookup = true
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
		if (<other_player> = 1)
			Change \{battle_p1_highway_hammer = 0}
		else
			Change \{battle_p2_highway_hammer = 0}
		endif
	endif
endscript

script shake_rock_meter 
endscript

script battle_up_difficulty 
	if (<other_player> = 1)
		spawnscript GH_BattleMode_Player1_SFX_DiffUp_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_DiffUp_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if (<difficulty> = expert)
		battle_double_notes <...>
		return
	endif
	getplayerinfo <other_player> diffup_notes
	if NOT (<diffup_notes> = -1)
		addtoplayerinfo <other_player> diffup_notes = <drain_time>
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	setplayerinfo <other_player> diffup_notes = (<time> + <drain_time>)
	fillinputarrayforbattle Player = <other_player> Attack = difficulty_up
	update_hud_difficulty_up other_player = <other_player> difficulty = <difficulty>
	extendcrcplayer change_difficulty <other_player> out = Type
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
	setplayerinfo <other_player> diffup_notes = (<time> + <drain_time>)
	begin
	GetSongTimeMs
	getplayerinfo <other_player> diffup_notes
	if (<time> > <diffup_notes>)
		printf \{qs(0x60cd5d4f)}
		extendcrcplayer change_difficulty <other_player> out = Type
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
	WaitOneGameFrame
	repeat
	setplayerinfo <other_player> diffup_notes = -1
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_double_notes 
	if (<other_player> = 1)
		spawnscript GH_BattleMode_Player1_SFX_DoubleNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_DoubleNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	getplayerinfo <other_player> double_notes
	if NOT (<double_notes> = -1)
		addtoplayerinfo <other_player> double_notes = <drain_time>
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	setplayerinfo <other_player> double_notes = (<time> + <drain_time>)
	fillinputarrayforbattle Player = <other_player> Attack = double_notes
	update_hud_double_notes other_player = <other_player>
	getplayerinfo <other_player> double_notes
	if (<double_notes> = 1)
		return
	else
		setplayerinfo <other_player> double_notes = 1
		hud_create_message Player = <other_player> text = qs(0xcdc6d554) Priority = 2
		begin
		getplayerinfo <other_player> double_notes
		if (<double_notes> = 1)
			WaitOneGameFrame
			continue
		endif
		break
		repeat
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script battle_mine_attack 
	if (<other_player> = 1)
		SoundEvent \{event = gh_sfx_battlemode_mine_release_p1}
	else
		SoundEvent \{event = gh_sfx_battlemode_mine_release_p2}
	endif
	getplayerinfo <other_player> mine_attack
	if NOT (<mine_attack> = -1)
		addtoplayerinfo <other_player> mine_attack = <drain_time>
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	setplayerinfo <other_player> mine_attack = (<time> + <drain_time>)
	fillinputarrayforbattle Player = <other_player> Attack = mine_attack
	begin
	GetSongTimeMs
	getplayerinfo <other_player> mine_attack
	if (<time> > <mine_attack>)
		printf \{qs(0x60cd5d4f)}
		setplayerinfo <other_player> mine_attack = -1
		break
	endif
	Wait \{1
		gameframe}
	repeat
	GuitarEvent_BattleAttackFinished <...>
endscript

script battle_steal 
	if (<Player> = 1)
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
	addtoplayerinfo <other_player> stealing_powerup = 1
	animate_steal start_pos = <start_pos> morph_to_pos = <morph_to_pos> Player = <Player> other_player = <other_player>
	addtoplayerinfo <other_player> stealing_powerup = -1
endscript

script animate_steal 
	if (<other_player> = 1)
		hand_scale = (-1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (-40.0, 0.0)
	else
		hand_scale = (1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (40.0, 0.0)
	endif
	getplayerinfo <other_player> stealing_powerup
	formatText checksumName = steal_hand_open_checksum 'steal_hand_open_%i_%p' i = <stealing_powerup> p = <other_player>
	if ScreenElementExists id = <steal_hand_open_checksum>
		DestroyScreenElement id = <steal_hand_open_checksum>
	endif
	formatText checksumName = steal_hand_checksum 'steal_hand_%i_%p' i = <stealing_powerup> p = <other_player>
	WaitOneGameFrame
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
	getplayerinfo <other_player> current_num_powerups
	if NOT (<current_num_powerups> = 0)
		if (<other_player> = 1)
			select = ($current_powerups_p1 [(<current_num_powerups> - 1)])
		else
			select = ($current_powerups_p2 [(<current_num_powerups> - 1)])
		endif
		if (<other_player> = 1)
			card_checksum = ($current_battlecard_p1 [(<current_num_powerups> - 1)])
		else
			card_checksum = ($current_battlecard_p2 [(<current_num_powerups> - 1)])
		endif
		if ScreenElementExists id = <card_checksum>
			DestroyScreenElement id = <card_checksum>
		endif
		addtoplayerinfo <other_player> current_num_powerups = -1
		printf qs(0x1038d3da) n = <other_player> a = (<current_num_powerups> -1)
		update_battlecards_remove Player = <other_player>
		GetSongTimeMs
		formatText checksumName = held_card_checksum 'held_battlecard_%i_%s_%t' i = (<current_num_powerups> -2) s = <other_player> t = <time>
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
		battlemode_ready Player = <Player> battle_gem = <select> steal = 1
	endif
endscript

script battle_lefty_notes 
	if (<other_player> = 1)
		spawnscript GH_BattleMode_Player1_SFX_LeftyNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_LeftyNotes_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	getplayerinfo <other_player> lefty_notes
	if NOT (<lefty_notes> = -1)
		addtoplayerinfo <other_player> lefty_notes = <drain_time>
		return
	endif
	getplayerinfo <other_player> lefthanded_gems
	getplayerinfo <other_player> lefthanded_button_ups
	setplayerinfo <other_player> lefthanded_gems_flip_save = <lefthanded_gems>
	setplayerinfo <other_player> lefthanded_button_ups_flip_save = <lefthanded_button_ups>
	setplayerinfo <other_player> lefthanded_gems = (1 - <lefthanded_gems>)
	GetSongTimeMs
	CastToInteger \{time}
	setplayerinfo <other_player> lefty_notes = (<time> + <drain_time>)
	fillinputarrayforbattle Player = <other_player> Attack = lefty_flip_notes
	start_time = (<time> + 200)
	end_time = -1
	update_hud_lefty_notes other_player = <other_player>
	block_until_whammy_done <...>
	GetSongTimeMs
	getplayerinfo <other_player> lefty_notes
	if NOT (<time> > <lefty_notes>)
		begin
		GetSongTimeMs
		if NOT (<start_time> = -1)
			if (<time> > (<start_time> - 500))
				getplayerinfo <other_player> lefthanded_button_ups
				setplayerinfo <other_player> lefthanded_button_ups = (1 - <lefthanded_button_ups>)
				animate_lefty_flip other_player = <other_player>
				start_time = -1
			endif
		endif
		if (<time> > <lefty_notes>)
			printf \{qs(0x60cd5d4f)}
			getplayerinfo <other_player> scroll_time
			end_time = (<time> + ((<scroll_time> - $destroy_time) * 1000.0))
			getplayerinfo <other_player> lefthanded_gems
			setplayerinfo <other_player> lefthanded_gems = (1 - <lefthanded_gems>)
			break
		endif
		WaitOneGameFrame
		repeat
		block_until_whammy_done <...> no_drain
		begin
		GetSongTimeMs
		if NOT (<start_time> = -1)
			if (<time> > <start_time>)
				animate_lefty_flip other_player = <other_player>
				getplayerinfo <other_player> lefthanded_button_ups
				setplayerinfo <other_player> lefthanded_button_ups = (1 - <lefthanded_button_ups>)
				start_time = -1
			endif
		endif
		if (<time> > (<end_time> - 500))
			animate_lefty_flip other_player = <other_player>
			getplayerinfo <other_player> lefthanded_button_ups
			setplayerinfo <other_player> lefthanded_button_ups = (1 - <lefthanded_button_ups>)
			setplayerinfo <other_player> lefty_notes = -1
			break
		endif
		WaitOneGameFrame
		repeat
	endif
	getplayerinfo <other_player> lefthanded_gems_flip_save
	setplayerinfo <other_player> lefthanded_gems = <lefthanded_gems_flip_save>
	getplayerinfo <other_player> lefthanded_button_ups_flip_save
	setplayerinfo <other_player> lefthanded_button_ups = <lefthanded_button_ups_flip_save>
	GuitarEvent_BattleAttackFinished <...>
endscript

script block_until_whammy_done 
	<index> = (<other_player> - 1)
	if ($currently_holding [<index>] = 1)
		if (<index> = 0)
			if NOT GotParam \{no_drain}
				SpawnScriptNow \{lefty_drain_waitp1}
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
				SpawnScriptNow \{lefty_drain_waitp2}
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
	getplayerinfo \{1
		lefty_notes}
	if (<time> > <lefty_notes>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	setplayerinfo \{1
		lefty_notes = -1}
	broadcastevent \{Type = fake_whammy_offp1}
endscript

script lefty_drain_waitp2 
	begin
	GetSongTimeMs
	getplayerinfo \{2
		lefty_notes}
	if (<time> > <lefty_notes>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	setplayerinfo \{2
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
	if (<other_player> = 1)
		spawnscript GH_BattleMode_Player1_SFX_Whammy_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript GH_BattleMode_Player2_SFX_Whammy_Start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	getplayerinfo <other_player> whammy_attack
	if (<whammy_attack> < 1)
		setplayerinfo <other_player> whammy_attack = <repair_ammount>
		whammy_on = 0
		shake_on = 0
		frame_count = 0
		shake_frequency = 1
		setplayerinfo <other_player> broken_string_mask = 1118481
		update_training_whammy_bar other_player = <other_player>
		if playerinfoequals <other_player> is_local_client = 1
			begin
			if playerinfoequals <other_player> whammy_attack = 0
				break
			endif
			getplayerinfo <other_player> controller
			if GuitarGetAnalogueInfo controller = <controller>
				if IsGuitarController controller = <controller>
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
			if (<len> >= 0.5)
				if (<whammy_on> = 0)
					addtoplayerinfo <other_player> whammy_attack = -1
					GH3_Battle_Play_Whammy_Pitch_Up_Sound <...>
					getplayerinfo <other_player> whammy_attack
					if (<whammy_attack> <= 5)
						<shake_frequency> = (<shake_frequency> + 1)
						if ($is_network_game)
							SendNetMessage {Type = whammy_attack_update whammy_count = <whammy_attack>}
						endif
					endif
					<whammy_on> = 1
				endif
			else
				if (<whammy_on> = 1)
					<whammy_on> = 0
				endif
			endif
			WaitOneGameFrame
			repeat
		else
			net_whammy_attack other_player = <other_player> difficulty = <difficulty>
		endif
		GetArraySize \{$gem_colors}
		array_count = 0
		getplayerinfo <other_player> broken_string_mask
		begin
		broken_string_id = ($broken_strings [<array_count>])
		getplayerinfo <other_player> (<broken_string_id>) out = broken_string
		if (<broken_string> = 0)
			switch <array_count>
				case 0
				mask = 1052945
				<broken_string_mask> = (<broken_string_mask> && <mask>)
				case 1
				mask = 1114385
				<broken_string_mask> = (<broken_string_mask> && <mask>)
				case 2
				mask = 1118225
				<broken_string_mask> = (<broken_string_mask> && <mask>)
				case 3
				mask = 1118465
				<broken_string_mask> = (<broken_string_mask> && <mask>)
				case 4
				mask = 1118480
				<broken_string_mask> = (<broken_string_mask> && <mask>)
				case 5
				mask = 69905
				<broken_string_mask> = (<broken_string_mask> && <mask>)
			endswitch
		endif
		array_count = (<array_count> + 1)
		repeat <array_Size>
		setplayerinfo <other_player> broken_string_mask = <broken_string_mask>
		setplayerinfo <other_player> whammy_attack = -1
		GuitarEvent_BattleAttackFinished <...>
	else
		<base_repair_ammount> = (<base_repair_ammount> * $battle_do_or_die_attack_scale * 3.0)
		CastToInteger \{base_repair_ammount}
		getplayerinfo <other_player> whammy_attack
		if (<whammy_attack> < <base_repair_ammount>)
			addtoplayerinfo <other_player> whammy_attack = <repair_ammount>
		endif
	endif
endscript

script break_string 
	Color = ($gem_colors [<id>])
	getplayerinfo <other_player> lefthanded_button_ups
	if (<lefthanded_button_ups> = 1)
		begin_pos = ((($button_up_models [(<other_player> -1)]).<Color>.left_pos_2d) + (0.0, 40.0))
	else
		begin_pos = ((($button_up_models [(<other_player> -1)]).<Color>.pos_2d) + (0.0, 40.0))
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
	if (<other_player> = 1)
		<begin_pos> = (<begin_pos> - (230.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (230.0, 0.0))
	endif
	formatText checksumName = Name 'String_break_p%p' p = <other_player> AddToStringLookup = true
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
	if playerinfoequals <other_player> lefthanded_button_ups = 1
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
	formatText checksumName = name_string '%s_stringp%p' s = (($button_up_models [(<other_player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
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
	if playerinfoequals <other_player> lefthanded_button_ups = 1
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
	formatText checksumName = name_string '%s_stringp%p' s = (($button_up_models [(<other_player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
	if ScreenElementExists id = <name_string>
		legacydoscreenelementmorph {
			id = <name_string>
			alpha = 1
		}
	endif
endscript

script battle_broken_string 
	if (($is_network_game = 1) && (<other_player> = 1))
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
	if (<other_player> = 1)
		spawnscript GH_BattleMode_Player1_SFX_BrokenString_Start params = {holdtime = <drain_time>} id = battlemode
	else
		if ($is_network_game)
			<victim_is_local> = 0
		endif
		spawnscript GH_BattleMode_Player2_SFX_BrokenString_Start params = {holdtime = <drain_time>} id = battlemode
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
	if (($is_network_game) && (<other_player> = 1))
		X = <string_to_break>
	else
		GetArraySize \{$gem_colors}
		gem_color = 0
		non_broken_index = 0
		non_broken_strings = [-1 -1 -1 -1 -1]
		begin
		switch <gem_color>
			case 0
			if playerinfoequals <other_player> broken_string_green = 0
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 1
			if playerinfoequals <other_player> broken_string_red = 0
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 2
			if playerinfoequals <other_player> broken_string_yellow = 0
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 3
			if playerinfoequals <other_player> broken_string_blue = 0
				SetArrayElement ArrayName = non_broken_strings index = <non_broken_index> NewValue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 4
			if playerinfoequals <other_player> broken_string_orange = 0
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
		addtoplayerinfo <other_player> broken_string_green = <num_hammers>
		mask = 65536
		case 2
		addtoplayerinfo <other_player> broken_string_red = <num_hammers>
		mask = 4096
		case 3
		addtoplayerinfo <other_player> broken_string_yellow = <num_hammers>
		mask = 256
		case 4
		addtoplayerinfo <other_player> broken_string_blue = <num_hammers>
		mask = 16
		case 5
		addtoplayerinfo <other_player> broken_string_orange = <num_hammers>
		mask = 1
	endswitch
	printf qs(0x27d84ac5) s = <X>
	SpawnScriptNow break_string params = {id = (<X> - 1) other_player = <other_player>}
	SpawnScriptNow update_broken_button params = {id = (<X> - 1) other_player = <other_player>}
	update_broken_string_arrows id = (<X> - 1) other_player = <other_player>
	bail = 0
	if NOT playerinfoequals <other_player> broken_string_mask = 0
		getplayerinfo <other_player> whammy_attack
		if (<whammy_attack> < 1)
			<bail> = 1
		endif
	endif
	getplayerinfo <other_player> broken_string_mask
	setplayerinfo <other_player> broken_string_mask = (<broken_string_mask> || <mask>)
	if (<bail>)
		return
	endif
	getplayerinfo <other_player> controller
	GetHeldPattern controller = <controller> Player = <other_player> nobrokenstring
	total_broken_strings = 1
	GetArraySize \{$gem_colors}
	begin
	last_hold_pattern = <hold_pattern>
	GetHeldPattern controller = <controller> Player = <other_player> nobrokenstring
	net_update_flags = 0
	if NOT (<last_hold_pattern> = <hold_pattern>)
		check_button = 65536
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if NOT (<last_hold_pattern> && <check_button>)
			if (<hold_pattern> && <check_button>)
				getplayerinfo <other_player> (<broken_string_id>) out = broken_string
				if NOT (<broken_string> = 0)
					switch <array_count>
						case 0
						addtoplayerinfo <other_player> broken_string_green = -1
						mask = 4369
						<net_update_flags> = (<net_update_flags> || <check_button>)
						getplayerinfo <other_player> broken_string_green
						Battle_SFX_Repair_Broken_String num_strums = <broken_string_green> player_pan = <other_player> difficulty = <difficulty>
						if (<broken_string_green> = 0)
							repair_string other_player = <other_player> id = <array_count>
						endif
						case 1
						addtoplayerinfo <other_player> broken_string_red = -1
						mask = 65809
						<net_update_flags> = (<net_update_flags> || <check_button>)
						getplayerinfo <other_player> broken_string_red
						Battle_SFX_Repair_Broken_String num_strums = <broken_string_red> player_pan = <other_player> difficulty = <difficulty>
						if (<broken_string_red> = 0)
							repair_string other_player = <other_player> id = <array_count>
						endif
						case 2
						addtoplayerinfo <other_player> broken_string_yellow = -1
						mask = 69649
						<net_update_flags> = (<net_update_flags> || <check_button>)
						getplayerinfo <other_player> broken_string_yellow
						Battle_SFX_Repair_Broken_String num_strums = <broken_string_yellow> player_pan = <other_player> difficulty = <difficulty>
						if (<broken_string_yellow> = 0)
							repair_string other_player = <other_player> id = <array_count>
						endif
						case 3
						addtoplayerinfo <other_player> broken_string_blue = -1
						mask = 69889
						<net_update_flags> = (<net_update_flags> || <check_button>)
						getplayerinfo <other_player> broken_string_blue
						Battle_SFX_Repair_Broken_String num_strums = <broken_string_blue> player_pan = <other_player> difficulty = <difficulty>
						if (<broken_string_blue> = 0)
							repair_string other_player = <other_player> id = <array_count>
						endif
						case 4
						addtoplayerinfo <other_player> broken_string_orange = -1
						mask = 69904
						<net_update_flags> = (<net_update_flags> || <check_button>)
						getplayerinfo <other_player> broken_string_orange
						Battle_SFX_Repair_Broken_String num_strums = <broken_string_orange> player_pan = <other_player> difficulty = <difficulty>
						if (<broken_string_orange> = 0)
							repair_string other_player = <other_player> id = <array_count>
						endif
					endswitch
					getplayerinfo <other_player> (<broken_string_id>) out = broken_string
					if (<broken_string> = 0)
						getplayerinfo <other_player> whammy_attack
						if (<whammy_attack> < 1)
							WaitOneGameFrame
							getplayerinfo <other_player> broken_string_mask
							setplayerinfo <other_player> broken_string_mask = (<broken_string_mask> && <mask>)
						endif
					endif
				endif
				getplayerinfo <other_player> broken_string_green
				getplayerinfo <other_player> broken_string_red
				getplayerinfo <other_player> broken_string_yellow
				getplayerinfo <other_player> broken_string_blue
				getplayerinfo <other_player> broken_string_orange
				total_broken_strings = (<broken_string_green> + <broken_string_red> + <broken_string_yellow> + <broken_string_blue> + <broken_string_orange>)
			endif
		endif
		<check_button> = (<check_button> / 16)
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	if ($is_network_game)
		if NOT (<net_update_flags> = 0)
			if NOT (playerinfoequals <other_player> highway_layout = solo_highway)
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
	WaitOneGameFrame
	repeat
	getplayerinfo <other_player> whammy_attack
	if (<whammy_attack> < 1)
		setplayerinfo <other_player> broken_string_mask = 0
	endif
	GuitarEvent_BattleAttackFinished <...>
endscript

script animate_lefty_flip 
	GetArraySize \{$gem_colors}
	array_count = 0
	extendcrcplayer out = pixel_array button_up_pixel_array <other_player>
	if playerinfoequals <other_player> lefthanded_button_ups = 1
		if GotParam \{unflip}
			flip_scale = (1.3199999, 1.6)
		else
			flip_scale = (-1.3199999, 1.6)
		endif
	else
		if GotParam \{unflip}
			flip_scale = (-1.3199999, 1.6)
		else
			flip_scale = (1.3199999, 1.6)
		endif
	endif
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	Player = <other_player>
	formatText checksumName = name_base '%s_basep%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
	if playerinfoequals <other_player> lefthanded_button_ups = 1
		start_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.left_pos_2d)
		end_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.pos_2d)
	else
		start_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.pos_2d)
		end_bottom_bar_pos = (($button_up_models [(<Player> -1)]).<Color>.left_pos_2d)
	endif
	formatText checksumName = name_lip '%s_lipp%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = (<other_player>) AddToStringLookup = true
	formatText checksumName = name_mid '%s_midp%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = (<other_player>) AddToStringLookup = true
	formatText checksumName = name_neck '%s_neckp%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = (<other_player>) AddToStringLookup = true
	formatText checksumName = name_head '%s_headp%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = (<other_player>) AddToStringLookup = true
	if ScreenElementExists id = <name_lip>
		SetScreenElementProps id = <name_lip> Scale = <flip_scale>
		SetScreenElementProps id = <name_mid> Scale = <flip_scale>
		SetScreenElementProps id = <name_neck> Scale = <flip_scale>
		SetScreenElementProps id = <name_head> Scale = <flip_scale>
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
	formatText checksumName = name_base '%s_basep%p' s = (($button_up_models [(<Player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
	legacydoscreenelementmorph {
		id = <name_base>
		Pos = (0.0, 0.0)
		just = [center center]
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script update_training_whammy_bar 
	formatText checksumName = training_whammy_checksum 'training_whammy_bar_%s' s = <other_player>
	formatText checksumName = training_whammy_text_checksum 'training_whammy_bar_text_%s' s = <other_player>
	if ScreenElementExists id = <training_whammy_checksum>
		DestroyScreenElement id = <training_whammy_checksum>
	endif
	if ScreenElementExists id = <training_whammy_text_checksum>
		DestroyScreenElement id = <training_whammy_text_checksum>
	endif
	if (<other_player> = 1)
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
		font = fontgrid_text_a1
		rgba = [255 255 255 255]
		just = [center bottom]
		Scale = 1.2
		z_priority = 7
	}
	SpawnScriptNow animate_whammy_bar params = {id = <training_whammy_checksum> other_player = <other_player> training_whammy_pos = <training_whammy_pos> training_whammy_angle = <training_whammy_angle>}
endscript

script animate_whammy_bar 
	pulse_on = 0
	begin
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	formatText checksumName = name_base '%s_basep%p' s = (($button_up_models [(<other_player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
	original_bottom_bar_pos = (0.0, 0.0)
	getplayerinfo <other_player> whammy_attack
	whammy_attack = (<whammy_attack> / ($battle_do_or_die_attack_scale / 2.0))
	bottom_bar_pos = (<original_bottom_bar_pos> - ((0.0, 15.0) * <whammy_attack>))
	getplayerinfo <other_player> whammy_attack out = whammy_attack_check
	if NOT (<whammy_attack_check> < 1)
		if (<pulse_on> = 0)
			legacydoscreenelementmorph {
				id = <name_base>
				alpha = 0.5
				Pos = (<bottom_bar_pos> + (0.0, 5.0))
				just = [center center]
				time = 0.15
			}
		else
			legacydoscreenelementmorph {
				id = <name_base>
				alpha = 0.5
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
	getplayerinfo <other_player> whammy_attack
	whammy_attack = (<whammy_attack> / ($battle_do_or_die_attack_scale / 2.0))
	training_whammy_pos_new = (<training_whammy_pos> - ((0.0, 15.0) * <whammy_attack>))
	legacydoscreenelementmorph {
		id = <id>
		Pos = <training_whammy_pos_new>
		time = 0.15
	}
	getplayerinfo <other_player> whammy_attack out = whammy_attack_check
	if NOT (<whammy_attack_check> < 1)
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
		formatText checksumName = name_base '%s_basep%p' s = (($button_up_models [(<other_player> -1)]).<Color>.name_string) p = <other_player> AddToStringLookup = true
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

script battle_hyperspeed 
	ratio_amount = 0.9
	switch <difficulty>
		case easy
		<ratio_amount> = ($battlemode_powerups [8].easy_ratio)
		case medium
		<ratio_amount> = ($battlemode_powerups [8].medium_ratio)
		case hard
		<ratio_amount> = ($battlemode_powerups [8].hard_ratio)
		case expert
		<ratio_amount> = ($battlemode_powerups [8].expert_ratio)
	endswitch
	getplayerinfo <other_player> hyperspeed_attack
	if (<hyperspeed_attack> = 1)
		return
	else
		hud_create_message Player = <other_player> text = qs(0x190efc1d) Priority = 2
		setplayerinfo <other_player> hyperspeed_attack = 1
		begin
		getplayerinfo <other_player> hyperspeed_attack
		if (<hyperspeed_attack> = -1)
			break
		endif
		getplayerinfo <other_player> Hyperspeed out = hyperspeed_scale
		if (<hyperspeed_scale> < <ratio_amount>)
			<hyperspeed_scale> = (1.0 * (<hyperspeed_scale> + (-0.0166667 * (1 - <ratio_amount>))))
			if (<hyperspeed_scale> < <ratio_amount>)
				<hyperspeed_scale> = (1.0 * <ratio_amount>)
			endif
			setplayerinfo <other_player> Hyperspeed = <hyperspeed_scale>
			getplayerinfo <other_player> difficulty
			difficulty_setup Player = <other_player> difficulty = <difficulty>
		endif
		WaitOneGameFrame
		repeat
		GuitarEvent_BattleAttackFinished <...>
	endif
endscript

script update_broken_button 
	broken_string_id = ($broken_strings [<id>])
	Color = ($gem_colors [<id>])
	button_up_name = (($button_up_models [(<other_player> -1)]).<Color>.Name)
	extendcrcplayer button_up_pixel_array <other_player> out = pixel_array
	begin
	<num_hammers> = 0
	getplayerinfo <other_player> (<broken_string_id>) out = broken_string
	if NOT (<broken_string> = 0)
		switch <id>
			case 0
			getplayerinfo <other_player> broken_string_green out = num_hammers
			case 1
			getplayerinfo <other_player> broken_string_red out = num_hammers
			case 2
			getplayerinfo <other_player> broken_string_yellow out = num_hammers
			case 3
			getplayerinfo <other_player> broken_string_blue out = num_hammers
			case 4
			getplayerinfo <other_player> broken_string_orange out = num_hammers
		endswitch
	endif
	if (<num_hammers> = 0)
		break
	endif
	<up_pixels> = (<num_hammers> * 5)
	SetArrayElement ArrayName = <pixel_array> globalarray index = <id> NewValue = <up_pixels>
	WaitOneGameFrame
	repeat
endscript

script update_broken_string_arrows 
	broken_string_id = ($broken_strings [<id>])
	string_id = <id>
	formatText checksumName = arrow_checksum 'broken_string_arrow_%i_%s' i = <id> s = <other_player>
	formatText checksumName = text_checksum 'broken_string_text_%i_%s' i = <id> s = <other_player>
	if ScreenElementExists id = <arrow_checksum>
		DestroyScreenElement id = <arrow_checksum>
	endif
	if ScreenElementExists id = <text_checksum>
		DestroyScreenElement id = <text_checksum>
	endif
	formatText checksumName = container_id 'gem_containerp%p' p = <other_player> AddToStringLookup = true
	Color = ($gem_colors [<id>])
	arrow_pos = ((($button_up_models [(<other_player> -1)]).<Color>.pos_2d) - (0.0, 30.0))
	lefty_arrow_pos = ((($button_up_models [(<other_player> -1)]).<Color>.left_pos_2d) - (0.0, 30.0))
	if (<other_player> = 1)
		<arrow_pos> = (<arrow_pos> - (225.0, 0.0))
		<lefty_arrow_pos> = (<lefty_arrow_pos> - (225.0, 0.0))
	else
		<arrow_pos> = (<arrow_pos> + (225.0, 0.0))
		<lefty_arrow_pos> = (<lefty_arrow_pos> + (225.0, 0.0))
	endif
	if playerinfoequals <other_player> lefthanded_button_ups = 1
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
		Scale = 1.2
		just = [center bottom]
		z_priority = 7
	}
	GetScreenElementDims id = <arrow_checksum>
	x_offset = (<width> / 2)
	CreateScreenElement {
		Type = TextElement
		parent = <arrow_checksum>
		id = <text_checksum>
		Pos = ((0.0, 0.0) + (<x_offset> * (1.0, 0.0)))
		text = qs(0x72a02f55)
		font = fontgrid_text_a1
		rgba = [255 255 255 255]
		just = [center bottom]
		Scale = 0.5
		z_priority = 8
	}
	SpawnScriptNow animate_arrow params = {broken_string_id = <broken_string_id> string_id = <string_id> arrow_id = <arrow_checksum> other_player = <other_player> arrow_pos = <arrow_pos> lefty_arrow_pos = <lefty_arrow_pos>}
endscript

script animate_arrow 
	pulse_on = 0
	begin
	<num_hammers> = 0
	getplayerinfo <other_player> (<broken_string_id>) out = broken_string
	if NOT (<broken_string> = 0)
		switch <string_id>
			case 0
			getplayerinfo <other_player> broken_string_green out = num_hammers
			case 1
			getplayerinfo <other_player> broken_string_red out = num_hammers
			case 2
			getplayerinfo <other_player> broken_string_yellow out = num_hammers
			case 3
			getplayerinfo <other_player> broken_string_blue out = num_hammers
			case 4
			getplayerinfo <other_player> broken_string_orange out = num_hammers
		endswitch
	endif
	<up_pixels> = (<num_hammers> * 5)
	if NOT playerinfoequals <other_player> lefthanded_button_ups = 1
		animate_pos = <arrow_pos>
	else
		animate_pos = <lefty_arrow_pos>
	endif
	<animate_pos> = (<animate_pos> - ((0.0, 1.0) * <up_pixels>))
	getplayerinfo <other_player> whammy_attack
	if NOT (<whammy_attack> < 1)
		whammy_attack = (<whammy_attack> / ($battle_do_or_die_attack_scale / 2.0))
		<animate_pos> = (<animate_pos> - ((0.0, 15.0) * <whammy_attack>))
	endif
	if NOT (<broken_string> = 0)
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
	WaitOneGameFrame
	repeat
endscript

script create_battlemode_highway_effects 
	Player = 1
	begin
	pos_table = ($highway_pos_table [(<Player> -1)])
	lpos = (($sidebar_x [(<Player> -1)] * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)))
	langle = ($sidebar_angle [(<Player> -1)])
	rpos = ((((640.0 - $sidebar_x [(<Player> -1)]) + 640.0) * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle [(<Player> -1)]))
	Scale = (((<pos_table>.sidebar_x_scale) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
	rscale = (((0 - (<pos_table>.sidebar_x_scale)) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
	formatText checksumName = container_id 'gem_containerp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = cont 'battle_sidebar_container_leftp%p' p = <Player> AddToStringLookup = true
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
	formatText checksumName = Name 'battle_sidebar_left_glowp%p' p = <Player> AddToStringLookup = true
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
	formatText checksumName = Name 'battle_sidebar_left_Lightning01p%p' p = <Player> AddToStringLookup = true
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
	formatText checksumName = cont 'battle_sidebar_container_rightp%p' p = <Player> AddToStringLookup = true
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
	formatText checksumName = Name 'battle_sidebar_Right_glowp%p' p = <Player> AddToStringLookup = true
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
	formatText checksumName = Name 'battle_sidebar_Right_Lightning01p%p' p = <Player> AddToStringLookup = true
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
		Player = 1}
	battlemode_ready \{battle_gem = 1
		Player = 1}
	battlemode_ready \{battle_gem = 1
		Player = 1}
	battlemode_ready \{battle_gem = 1
		Player = 2}
	battlemode_ready \{battle_gem = 1
		Player = 2}
	battlemode_ready \{battle_gem = 1
		Player = 2}
endscript

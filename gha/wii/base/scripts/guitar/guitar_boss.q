boss_hammer_try_strum = 4
Boss_TomMorello_Props = {
	GainPerNote = {
		easy = 0.8
		medium = 0.7
		hard = 0.55
		expert = 0.4
	}
	LossPerNote = {
		easy = 5.25
		medium = 3.0
		hard = 2.75
		expert = 2.25
	}
	PowerUpMissedNote = {
		easy = 60.0
		medium = 55.0
		hard = 45.0
		expert = 40.0
	}
	WhammySpeed = {
		easy = 1100
		medium = 800
		hard = 500
		expert = 350
	}
	BrokenStringSpeed = {
		easy = 1200
		medium = 950
		hard = 700
		expert = 450
	}
	BrokenStringMissedNote = {
		easy = 25.0
		medium = 20.0
		hard = 20.0
		expert = 15.0
	}
	PowerUps = [
		Lightning
		DifficultyUp
		DoubleNotes
		WhammyAttack
	]
	character_profile = Morello
	character_name = 'Tom Morello'
}
boss_joe_props = {
	GainPerNote = {
		easy = 0.75
		medium = 0.6
		hard = 0.5
		expert = 0.35000002
	}
	LossPerNote = {
		easy = 5.1
		medium = 3.0
		hard = 2.75
		expert = 2.25
	}
	PowerUpMissedNote = {
		easy = 52.0
		medium = 48.0
		hard = 42.0
		expert = 37.0
	}
	WhammySpeed = {
		easy = 1125
		medium = 875
		hard = 550
		expert = 375
	}
	BrokenStringSpeed = {
		easy = 1175
		medium = 900
		hard = 670
		expert = 425
	}
	BrokenStringMissedNote = {
		easy = 24.5
		medium = 18.5
		hard = 16.5
		expert = 13.5
	}
	PowerUps = [
		Lightning
		DifficultyUp
		DoubleNotes
		BrokenString
		WhammyAttack
	]
	character_profile = joep
	character_name = 'Joe Perry'
}
Boss_Devil_Props = {
	GainPerNote = {
		easy = 0.75
		medium = 0.65000004
		hard = 0.35000002
		expert = 0.35000002
	}
	LossPerNote = {
		easy = 5.0
		medium = 3.0
		hard = 2.25
		expert = 2.0
	}
	PowerUpMissedNote = {
		easy = 45.0
		medium = 42.5
		hard = 30.0
		expert = 30.0
	}
	WhammySpeed = {
		easy = 1050
		medium = 800
		hard = 500
		expert = 350
	}
	BrokenStringSpeed = {
		easy = 1100
		medium = 950
		hard = 600
		expert = 350
	}
	BrokenStringMissedNote = {
		easy = 22.5
		medium = 20.0
		hard = 12.5
		expert = 10.0
	}
	PowerUps = [
		Lightning
		DifficultyUp
		LeftyNotes
		BrokenString
		WhammyAttack
	]
	character_profile = Satan
	character_name = 'Lou'
}
save_lefty_flip_p2 = 0

script bossbattle_init 
	if ($game_mode = p2_battle)
		ScriptAssert \{'Cannot choose p2_battle and bossbattle'}
	endif
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
	Change structurename = <player_status> shake_notes = -1
	Change structurename = <player_status> double_notes = -1
	Change structurename = <player_status> diffup_notes = -1
	Change structurename = <player_status> lefty_notes = -1
	Change structurename = <player_status> stealing_powerup = -1
	Change structurename = <player_status> death_lick_attack = -1
	Change structurename = <player_status> last_hit_note = None
	Change structurename = <player_status> last_selected_attack = -1
	Change structurename = <player_status> broken_string_mask = 0
	Change structurename = <player_status> broken_string_green = 0
	Change structurename = <player_status> broken_string_red = 0
	Change structurename = <player_status> broken_string_yellow = 0
	Change structurename = <player_status> broken_string_blue = 0
	Change structurename = <player_status> broken_string_orange = 0
	Change structurename = <player_status> final_blow_powerup = -1
	Change structurename = <player_status> battle_num_attacks = 0
	Change structurename = <player_status> hold_difficulty_up = 0.0
	Player = (<Player> + 1)
	repeat 2
	Change \{structurename = player2_status
		part = rhythm}
	Change boss_controller = ($player2_status.controller)
	Change \{boss_pattern = 0}
	Change \{boss_strum = 0}
	Change \{boss_lastwhammytime = 0}
	Change \{boss_lastbrokenstringtime = 0}
	Change \{boss_hammer_count = 0}
	GetGlobalTags \{user_options}
	if (<lefty_flip_p2> = 1)
		Change \{save_lefty_flip_p2 = 1}
		SetGlobalTags \{user_options
			params = {
				lefty_flip_p2 = 0
			}}
	else
		Change \{save_lefty_flip_p2 = 0}
	endif
endscript

script bossbattle_deinit 
	if ($boss_battle = 1)
		Change \{boss_battle = 0}
		Change \{current_num_players = 1}
		Change structurename = player2_status controller = ($boss_oldcontroller)
		KillSpawnedScript \{id = battlemode}
		Change structurename = <player_status> battlemode_creation_selection = -1
		Change structurename = <player_status> current_num_powerups = 0
		Change structurename = <player_status> shake_notes = -1
		Change structurename = <player_status> double_notes = -1
		Change structurename = <player_status> diffup_notes = -1
		Change structurename = <player_status> lefty_notes = -1
		Change structurename = <player_status> stealing_powerup = -1
		Change structurename = <player_status> death_lick_attack = -1
		Change structurename = <player_status> last_hit_note = None
		Change structurename = <player_status> last_selected_attack = -1
		Change structurename = <player_status> broken_string_mask = 0
		Change structurename = <player_status> broken_string_green = 0
		Change structurename = <player_status> broken_string_red = 0
		Change structurename = <player_status> broken_string_yellow = 0
		Change structurename = <player_status> broken_string_blue = 0
		Change structurename = <player_status> broken_string_orange = 0
		Change structurename = <player_status> hold_difficulty_up = 0.0
		if ScreenElementExists \{id = battlemode_container}
			DestroyScreenElement \{id = battlemode_container}
		endif
		KillSpawnedScript \{Name = boss_battle_begin_deathlick}
		KillSpawnedScript \{Name = animate_death_icon}
		KillSpawnedScript \{Name = update_battle_death_meter}
		KillSpawnedScript \{Name = update_battle_death_meter_wings}
		KillSpawnedScript \{Name = stop_pattern_hold_boss}
		battlemode_killspawnedscripts
		GH_BattleMode_Stop_Heartbeat_P1
		GH_BattleMode_Stop_Heartbeat_P2
		Change \{boss_hammer_count = 0}
		if ($save_lefty_flip_p2 = 1)
			SetGlobalTags \{user_options
				params = {
					lefty_flip_p2 = $save_lefty_flip_p2
				}}
		endif
	endif
endscript

script bossbattle_select \{player_status = player1_status}

	if ($game_mode = tutorial)
		Change structurename = <player_status> battlemode_creation_selection = 0
		return
	endif
	Change structurename = <player_status> battlemode_creation_selection = -1
	total_weight = 0
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
	GetArraySize ($current_boss.PowerUps)
	powerups_size = <array_Size>
	GetArraySize \{$battlemode_powerups}
	array_count = 0
	begin
	powerup_enabled = 0
	powerup_count = 0
	begin
	if ($current_boss.PowerUps [<powerup_count>] = $battlemode_powerups [<array_count>].Name)
		powerup_enabled = 1
		break
	endif
	powerup_count = (<powerup_count> + 1)
	repeat <powerups_size>
	if (<powerup_enabled> = 1)
		if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_low)
			else
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight)
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetRandomValue Name = select_weight a = 0 b = (<total_weight> - 1) integer
	array_count = 0
	begin
	powerup_enabled = 0
	powerup_count = 0
	begin
	if ($current_boss.PowerUps [<powerup_count>] = $battlemode_powerups [<array_count>].Name)
		powerup_enabled = 1
		break
	endif
	powerup_count = (<powerup_count> + 1)
	repeat <powerups_size>
	if (<powerup_enabled> = 1)
		if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_low)
			else
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight)
			endif
		endif
		if (<select_weight> < 0)
			Change structurename = <player_status> battlemode_creation_selection = <array_count>
			Change structurename = <player_status> last_selected_attack = <array_count>
			break
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($<player_status>.battlemode_creation_selection = -1)

		ScriptAssert \{'Battlemode selection not found'}
	endif
endscript

script bossbattle_ready \{battle_gem = 0
		player_status = player1_status}

	if ($<player_status>.Player = 1)
		SoundEvent \{event = Battle_Power_Awarded_SFX_P1}
	else
		SoundEvent \{event = Battle_Power_Awarded_SFX_P2}
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	if (<current_num_powerups> >= $max_num_powerups)
		formatText checksumName = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.Player)
		if ScreenElementExists id = <card_checksum>
			DestroyScreenElement id = <card_checksum>
		endif
		Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
		update_battlecards_remove player_status = <player_status>
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	select = <battle_gem>
	if ($<player_status>.Player = 1)
		SetArrayElement ArrayName = current_powerups_p1 globalarray index = <current_num_powerups> NewValue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		SetArrayElement ArrayName = current_powerups_p2 globalarray index = <current_num_powerups> NewValue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups + 1)
	Color = ($<player_status>.last_hit_note)
	if (<Color> = None)
		<Color> = green
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
	card_alpha = 1
	if NOT ($show_battle_text = 1)
		<card_alpha> = 0
	endif
	formatText checksumName = card_checksum 'battlecard_%i_%s' i = <current_num_powerups> s = ($<player_status>.Player)
	CreateScreenElement {
		Type = SpriteElement
		id = <card_checksum>
		parent = battlemode_container
		texture = ($battlemode_powerups [<select>].card_texture)
		rgba = [255 255 255 255]
		Pos = <begin_pos>
		dims = (64.0, 64.0)
		alpha = <card_alpha>
		just = [center center]
		z_priority = (($battle_hud_2d_elements.z) + 19)
	}
	if ($game_mode = tutorial)
		card_pos = (<card_pos> + (0.0, 50.0))
	endif
	DoScreenElementMorph {
		id = <card_checksum>
		Pos = <card_pos>
		time = 0.3
	}
	update_battlecards_add current_num_powerups = <current_num_powerups> player_status = <player_status>
	if ($show_battle_text = 1)
		SpawnScriptNow attack_ready_text params = {current_num_powerups = <current_num_powerups> select = <select> player_status = <player_status>}
	endif
endscript

script bossbattle_trigger_on \{Player = 1
		player_text = 'p1'
		player_status = player1_status}

	if ($<player_status>.current_num_powerups = 0)
		return
	endif
	if ($<player_status>.Player = 1)
		<other_player> = 2
		<other_player_text> = 'p2'
		<other_difficulty> = $current_difficulty2
		<other_player_status> = player2_status
		select = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 2 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
		if ($is_network_game)
			SendNetMessage {
				Type = bossbattle_trigger_on
				select = <select>
			}
		endif
	else
		<other_player> = 1
		<other_player_text> = 'p1'
		<other_difficulty> = $current_difficulty
		<other_player_status> = player1_status
		select = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 1 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
	endif
	formatText checksumName = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.Player)
	if ScreenElementExists id = <card_checksum>
		DestroyScreenElement id = <card_checksum>
	endif
	Change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	if ($<player_status>.Player = 1)
		spawnscript bossbattle_ai_damage params = {drain_time = <drain_time> player_status = <other_player_status> player_text = <other_player_text> select = <select>}
	endif
	Change structurename = <player_status> final_blow_powerup = <select>
	SpawnScriptNow ($battlemode_powerups [<select>].Scr) id = battlemode params = {drain_time = <drain_time>
		Player = <other_player>
		player_text = <other_player_text>
		other_player_status = <other_player_status>
		player_status = <player_status>
		difficulty = <other_difficulty>
		($battlemode_powerups [<select>].params)}
	Change structurename = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_member) Type = <select>
	Band_PlayResponseAnim Name = ($<other_player_status>.band_member) Type = <select>
	if ($<other_player_status>.Player = 1)
		activatestarpowerpulse Player = ($<other_player_status>.controller) num = 1 length = 35 Strength = 20 Priority = 100
	endif
	SpawnScriptNow hammer_highway params = {other_player_text = <other_player_text>}
	if ($battlemode_powerups [<select>].fire_bolt = 1)
		SpawnScriptNow attack_bolt params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript
boss_powerup_delay = 0
bossbattle_missingnotefraction = 0.0

script bossbattle_ai_damage \{player_status = player2_status
		drain_time = 15000
		player_text = 'p2'}
	if StructureContains structure = ($battlemode_powerups [<select>]) no_ai_damage
		return
	endif
	gem_fraction = 0.0
	formatText checksumName = input_array 'bossresponse_array%p' p = <player_text>
	formatText checksumName = input_array_entry 'bossresponse_array%p_entry' p = <player_text>
	GetSongTimeMs
	if StructureContains structure = ($battlemode_powerups [<select>]) immediate
		start_creation_time = <time>
		end_creation_time = (<start_creation_time> + <drain_time>)
		start_creation_index = ($last_bossresponse_array_entry)
	else
		start_creation_time = (<time> + ($<player_status>.scroll_time - $destroy_time) * 1000.0 + 1000)
		end_creation_time = (<start_creation_time> + <drain_time>)
		start_creation_index = ($<input_array_entry>)
	endif
	missed_note_percentage = ($current_boss.PowerUpMissedNote.($current_difficulty))
	if ($battlemode_powerups [<select>].Name = BrokenString)
		<end_creation_time> = (<start_creation_time> + 60000)
		<missed_note_percentage> = ($current_boss.BrokenStringMissedNote.($current_difficulty))
	endif
	begin
	begin
	GetSongTimeMs
	if (<time> > <start_creation_time> - 200)
		break
	endif
	WaitOneGameFrame
	repeat
	if ($battlemode_powerups [<select>].Name = BrokenString)
		if ($<player_status>.broken_string_green < 3 &&
				$<player_status>.broken_string_red < 3 &&
				$<player_status>.broken_string_yellow < 3 &&
				$<player_status>.broken_string_blue < 3 &&
				$<player_status>.broken_string_orange < 3)
			break
		endif
	endif
	ApplyBossBattleGemMisses {miss_percent = <missed_note_percentage>
		start_creation_index = <start_creation_index>
		start_creation_time = <start_creation_time>
		end_creation_time = <end_creation_time>
		gem_fraction = <gem_fraction>}
	GetSongTimeMs
	start_creation_time = (<time> + ($<player_status>.scroll_time - $destroy_time) * 1000.0 + 1000)
	if NOT ($battlemode_powerups [<select>].Name = BrokenString)
		if (<start_creation_time> >= <end_creation_time>)
			break
		endif
	endif
	repeat
endscript
boss_hammer_count = 0

script check_buttons_boss 
	CheckButtonsBoss Player = <Player> array_entry = <array_entry>
endscript

script bossbattle_fill 
	bossbattle_ready \{battle_gem = 4
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 4
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 4
		player_status = player1_status}
endscript

script boss_battle_begin_deathlick 
	battle_death_lick \{death_speed = 0.1
		player_status = player2_status
		other_player_status = player1_status
		drain_time = 5000}
endscript

script boss_battle_death_icon 
	boss_pos = (900.0, 150.0)
	player_pos = (300.0, 183.0)
	displaySprite parent = root_window tex = icon_attack_deth Pos = <boss_pos> just = [center center] z = 500
	DoScreenElementMorph id = <id> Pos = <player_pos> Scale = 3.1 relative_scale time = 1.0
	Wait \{2.0
		Seconds}
	DoScreenElementMorph id = <id> alpha = 0 time = 2.0
	Wait \{2.0
		Seconds}
	destroy_menu menu_id = <id>
endscript

script create_battle_death_meter 
	KillSpawnedScript \{Name = update_battle_death_meter}
	KillSpawnedScript \{Name = update_battle_death_meter_wings}
	formatText \{checksumName = death_meter
		'battle_death_meter'
		AddToStringLookup = true}
	formatText \{checksumName = death_meter_marker
		'battle_death_meter_marker'
		AddToStringLookup = true}
	formatText \{checksumName = death_meter_text
		'battle_death_meter_text'
		AddToStringLookup = true}
	formatText \{checksumName = battle_death_meter_wing_r
		'battle_death_meter_wing_r'
		AddToStringLookup = true}
	formatText \{checksumName = battle_death_meter_wing_l
		'battle_death_meter_wing_l'
		AddToStringLookup = true}
	if ScreenElementExists id = <death_meter>
		DestroyScreenElement id = <death_meter>
	endif
	if ScreenElementExists id = <death_meter_marker>
		DestroyScreenElement id = <death_meter_marker>
	endif
	if ScreenElementExists id = <death_meter_text>
		DestroyScreenElement id = <death_meter_text>
	endif
	if ScreenElementExists id = <battle_death_meter_wing_r>
		DestroyScreenElement id = <battle_death_meter_wing_r>
	endif
	if ScreenElementExists id = <battle_death_meter_wing_l>
		DestroyScreenElement id = <battle_death_meter_wing_l>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <death_meter>
		parent = battlemode_container
		texture = battle_death_meter
		rgba = [255 255 255 255]
		Pos = (648.0, 900.0)
		Scale = 2
		alpha = 1
		just = [center center]
		z_priority = 1
	}
	CreateScreenElement {
		Type = SpriteElement
		id = <death_meter_marker>
		parent = <death_meter>
		texture = battle_death_meter_marker
		rgba = [255 255 255 255]
		Pos = (14.5, 100.0)
		Scale = 0.9
		alpha = 1
		just = [center center]
		z_priority = 2
	}
	CreateScreenElement {
		Type = SpriteElement
		id = <battle_death_meter_wing_r>
		parent = <death_meter>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		Pos = (13.0, 7.0)
		Scale = 0.5
		rot_angle = 15
		just = [left top]
		z_priority = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = <battle_death_meter_wing_l>
		parent = <death_meter>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		Pos = (13.0, 7.0)
		Scale = (-0.5, 0.5)
		rot_angle = -15
		just = [right top]
		z_priority = 0
	}
	DoScreenElementMorph \{id = battle_death_meter
		Pos = (648.0, 500.0)
		time = 0.3}
	Wait \{0.3
		Seconds}
	SpawnScriptNow update_battle_death_meter params = {death_meter_marker = <death_meter_marker>}
	SpawnScriptNow update_battle_death_meter_wings params = {wing_r = <battle_death_meter_wing_r> wing_l = <battle_death_meter_wing_l>}
endscript

script update_battle_death_meter 
	GetSongTimeMs
	starttime = <time>
	if ($current_song = bossdevil)
		endtime = 321466
	elseif ($current_song = bossslash)
		endtime = 226504
	elseif ($current_song = bosstom)
		endtime = 197733
	elseif ($current_song = bossjoe)
		endtime = 236950
	else
		return
	endif
	if (<starttime> > <endtime>)
		<starttime> = 0
	endif
	meterTime = ((<endtime> - <starttime>) / 1000)
	meterDistance = 75
	meterStep = (<meterTime> / <meterDistance>)
	pos_update = 0
	color_update = 0
	begin
	<pos_update> = (<pos_update> + 1)
	if ScreenElementExists id = <death_meter_marker>
		if (<color_update> = 0)
			DoScreenElementMorph id = <death_meter_marker> rgba = [0 255 100 255] time = 1
			<color_update> = 1
		else
			DoScreenElementMorph id = <death_meter_marker> rgba = [255 255 255 255] time = 1
			<color_update> = 0
		endif
		if (<meterStep> > 0)
			DoScreenElementMorph id = <death_meter_marker> Pos = ((14.5, 100.0) - ((0.0, 1.0) * <pos_update>)) time = <meterStep>
		endif
	else
		break
	endif
	Wait <meterStep> Second
	repeat
endscript

script update_battle_death_meter_wings 
	GetSongTimeMs
	starttime = <time>
	if ($current_song = bossdevil)
		endtime = 321466
	elseif ($current_song = bossslash)
		endtime = 226504
	elseif ($current_song = bosstom)
		endtime = 197733
	elseif ($current_song = bossjoe)
		endtime = 236950
	else
		return
	endif
	if (<starttime> > <endtime>)
		<starttime> = 0
	endif
	meterTime = ((<endtime> - <starttime>) / 1000)
	meterDistance = 20
	meterStep = (<meterTime> / <meterDistance>)
	rot_update = 0
	begin
	<rot_update> = (<rot_update> + 1)
	if ScreenElementExists id = <wing_r>
		if (<meterTime> > 0)
			DoScreenElementMorph id = <wing_r> rot_angle = (15 - <rot_update>) time = <meterStep>
		endif
	else
		break
	endif
	if ScreenElementExists id = <wing_l>
		if (<meterTime> > 0)
			DoScreenElementMorph id = <wing_l> rot_angle = (-15 + <rot_update>) time = <meterStep>
		endif
	else
		break
	endif
	Wait <meterStep> Seconds
	repeat
endscript

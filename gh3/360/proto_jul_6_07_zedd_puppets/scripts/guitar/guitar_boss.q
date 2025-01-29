boss_tommorello_props = {
	gainpernote = {
		easy = 0.85
		medium = 0.65000004
		hard = 0.5
		expert = 0.35000002
	}
	losspernote = {
		easy = 5.5
		medium = 3.2
		hard = 2.95
		expert = 2.5
	}
	powerupmissednote = {
		easy = 65.0
		medium = 60.0
		hard = 55.0
		expert = 50.0
	}
	whammyspeed = {
		easy = 1200
		medium = 950
		hard = 700
		expert = 450
	}
	brokenstringspeed = {
		easy = 1200
		medium = 950
		hard = 700
		expert = 450
	}
	brokenstringmissednote = {
		easy = 30.0
		medium = 25.0
		hard = 25.0
		expert = 20.0
	}
	powerups = [
		lightning
		difficultyup
		doublenotes
		whammyattack
	]
	character_profile = morello
	character_name = "Tom Morello"
}
boss_slash_props = {
	gainpernote = {
		easy = 0.85
		medium = 0.65000004
		hard = 0.5
		expert = 0.35000002
	}
	losspernote = {
		easy = 5.0
		medium = 2.7
		hard = 2.5
		expert = 2.0
	}
	powerupmissednote = {
		easy = 55.0
		medium = 50.0
		hard = 45.0
		expert = 40.0
	}
	whammyspeed = {
		easy = 1200
		medium = 950
		hard = 700
		expert = 450
	}
	brokenstringspeed = {
		easy = 1200
		medium = 950
		hard = 700
		expert = 450
	}
	brokenstringmissednote = {
		easy = 30.0
		medium = 25.0
		hard = 25.0
		expert = 20.0
	}
	powerups = [
		lightning
		difficultyup
		doublenotes
		brokenstring
		whammyattack
	]
	character_profile = slash
	character_name = "Slash"
}
boss_devil_props = {
	gainpernote = {
		easy = 0.7
		medium = 0.6
		hard = 0.3
		expert = 0.3
	}
	losspernote = {
		easy = 5.0
		medium = 2.7
		hard = 2.5
		expert = 2.0
	}
	powerupmissednote = {
		easy = 60.0
		medium = 45.0
		hard = 40.0
		expert = 35.0
	}
	whammyspeed = {
		easy = 1100
		medium = 850
		hard = 600
		expert = 350
	}
	brokenstringspeed = {
		easy = 1100
		medium = 850
		hard = 600
		expert = 350
	}
	brokenstringmissednote = {
		easy = 30.0
		medium = 25.0
		hard = 25.0
		expert = 20.0
	}
	powerups = [
		lightning
		difficultyup
		doublenotes
		leftynotes
		brokenstring
		whammyattack
	]
	character_profile = satan
	character_name = "Lou"
}

script bossbattle_init 
	if ($game_mode = p2_battle)
		scriptassert "Cannot choose p2_battle and bossbattle"
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = battlemode_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	change structurename = <player_status> battlemode_creation_selection = -1
	change structurename = <player_status> current_num_powerups = 0
	change structurename = <player_status> shake_notes = -1
	change structurename = <player_status> double_notes = -1
	change structurename = <player_status> diffup_notes = -1
	change structurename = <player_status> lefty_notes = -1
	change structurename = <player_status> stealing_powerup = -1
	change structurename = <player_status> death_lick_attack = -1
	change structurename = <player_status> last_hit_note = none
	change structurename = <player_status> last_selected_attack = -1
	change structurename = <player_status> broken_string_mask = 0
	change structurename = <player_status> broken_string_green = 0
	change structurename = <player_status> broken_string_red = 0
	change structurename = <player_status> broken_string_yellow = 0
	change structurename = <player_status> broken_string_blue = 0
	change structurename = <player_status> broken_string_orange = 0
	player = (<player> + 1)
	repeat 2
	change structurename = player2_status part = rhythm
	change boss_controller = ($player2_status.controller)
	change boss_pattern = 0
	change boss_strum = 0
	change boss_lastwhammytime = 0
	change boss_lastbrokenstringtime = 0
endscript

script bossbattle_deinit 
	if ($boss_battle = 1)
		change boss_battle = 0
		change current_num_players = 1
		change structurename = player2_status controller = ($boss_oldcontroller)
		killspawnedscript id = battlemode
		change structurename = <player_status> battlemode_creation_selection = -1
		change structurename = <player_status> current_num_powerups = 0
		change structurename = <player_status> shake_notes = -1
		change structurename = <player_status> double_notes = -1
		change structurename = <player_status> diffup_notes = -1
		change structurename = <player_status> lefty_notes = -1
		change structurename = <player_status> stealing_powerup = -1
		change structurename = <player_status> death_lick_attack = -1
		change structurename = <player_status> last_hit_note = none
		change structurename = <player_status> last_selected_attack = -1
		change structurename = <player_status> broken_string_mask = 0
		change structurename = <player_status> broken_string_green = 0
		change structurename = <player_status> broken_string_red = 0
		change structurename = <player_status> broken_string_yellow = 0
		change structurename = <player_status> broken_string_blue = 0
		change structurename = <player_status> broken_string_orange = 0
		if screenelementexists id = battlemode_container
			destroyscreenelement id = battlemode_container
		endif
		killspawnedscript name = boss_battle_begin_deathlick
		killspawnedscript name = animate_death_icon
		battlemode_killspawnedscripts
	endif
endscript

script bossbattle_select player_status = player1_status
	printf "bossbattle_select"
	if ($game_mode = tutorial)
		change structurename = <player_status> battlemode_creation_selection = 0
		return
	endif
	change structurename = <player_status> battlemode_creation_selection = -1
	total_weight = 0
	if ($<player_status>.player = 1)
		other_player_difficulty = $current_difficulty2
	else
		other_player_difficulty = $current_difficulty
	endif
	next_attack = -1
	if ($<player_status>.current_num_powerups > 0)
		if ($<player_status>.player = 1)
			<next_attack> = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		else
			<next_attack> = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		endif
	endif
	getarraysize ($current_boss.powerups)
	powerups_size = <array_size>
	getarraysize $battlemode_powerups
	array_count = 0
	begin
	powerup_enabled = 0
	powerup_count = 0
	begin
	if ($current_boss.powerups [<powerup_count>] = $battlemode_powerups [<array_count>].name)
		powerup_enabled = 1
		break
	endif
	powerup_count = (<powerup_count> + 1)
	repeat <powerups_size>
	if (<powerup_enabled> = 1)
		if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].name = difficultyup))
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_low)
			else
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight)
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	getrandomvalue name = select_weight a = 0 b = (<total_weight> - 1) integer
	array_count = 0
	begin
	powerup_enabled = 0
	powerup_count = 0
	begin
	if ($current_boss.powerups [<powerup_count>] = $battlemode_powerups [<array_count>].name)
		powerup_enabled = 1
		break
	endif
	powerup_count = (<powerup_count> + 1)
	repeat <powerups_size>
	if (<powerup_enabled> = 1)
		if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].name = difficultyup))
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_low)
			else
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight)
			endif
		endif
		if (<select_weight> < 0)
			change structurename = <player_status> battlemode_creation_selection = <array_count>
			change structurename = <player_status> last_selected_attack = <array_count>
			break
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	if ($<player_status>.battlemode_creation_selection = -1)
		printstruct <...>
		scriptassert "Battlemode selection not found"
	endif
endscript

script bossbattle_ready battle_gem = 0 player_status = player1_status
	printf "bossbattle_ready"
	current_num_powerups = ($<player_status>.current_num_powerups)
	if (<current_num_powerups> >= $max_num_powerups)
		formattext checksumname = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.player)
		if screenelementexists id = <card_checksum>
			destroyscreenelement id = <card_checksum>
		endif
		change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
		update_battlecards_remove player_status = <player_status>
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	select = <battle_gem>
	if ($<player_status>.player = 1)
		setarrayelement arrayname = current_powerups_p1 globalarray index = <current_num_powerups> newvalue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		setarrayelement arrayname = current_powerups_p2 globalarray index = <current_num_powerups> newvalue = <select>
		card_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups + 1)
	color = ($<player_status>.last_hit_note)
	switch <color>
		case green
		string_offset = (($battle_hud_2d_elements.string_offset) * 0)
		case red
		string_offset = (($battle_hud_2d_elements.string_offset) * 1)
		case yellow
		string_offset = (($battle_hud_2d_elements.string_offset) * 2)
		case blue
		string_offset = (($battle_hud_2d_elements.string_offset) * 3)
		case orange
		string_offset = (($battle_hud_2d_elements.string_offset) * 4)
		default
		string_offset = (($battle_hud_2d_elements.string_offset) * 0)
	endswitch
	if ($<player_status>.player = 1)
		player_offset = (0.0, 0.0)
	else
		player_offset = ($battle_hud_2d_elements.buttons_p2_offset)
	endif
	if NOT ($<player_status>.lefthanded_button_ups = 1)
		begin_pos = (($battle_hud_2d_elements.green_button_pos) + <player_offset> + <string_offset>)
	else
		begin_pos = (($battle_hud_2d_elements.lefty_green_button_pos) + <player_offset> - <string_offset>)
	endif
	card_alpha = 1
	if NOT ($show_battle_text = 1)
		<card_alpha> = 0
	endif
	formattext checksumname = card_checksum 'battlecard_%i_%s' i = <current_num_powerups> s = ($<player_status>.player)
	createscreenelement {
		type = spriteelement
		id = <card_checksum>
		parent = battlemode_container
		texture = ($battlemode_powerups [<select>].card_texture)
		rgba = [255 255 255 255]
		pos = <begin_pos>
		dims = (64.0, 64.0)
		alpha = <card_alpha>
		just = [center center]
		z_priority = (($battle_hud_2d_elements.z) + 19)
	}
	doscreenelementmorph {
		id = <card_checksum>
		pos = <card_pos>
		time = 0.3
	}
	update_battlecards_add current_num_powerups = <current_num_powerups> player_status = <player_status>
	if ($show_battle_text = 1)
		spawnscriptnow attack_ready_text params = {current_num_powerups = <current_num_powerups> select = <select> player_status = <player_status>}
	endif
endscript

script bossbattle_trigger_on player = 1 player_text = 'p1' player_status = player1_status
	printf "bossbattle_trigger_on"
	if ($<player_status>.current_num_powerups = 0)
		return
	endif
	if ($<player_status>.player = 1)
		<other_player> = 2
		<other_player_text> = 'p2'
		<other_difficulty> = $current_difficulty2
		<other_player_status> = player2_status
		select = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		if ($is_network_game)
			sendnetmessage {
				type = bossbattle_trigger_on
				select = <select>
			}
		endif
	else
		<other_player> = 1
		<other_player_text> = 'p1'
		<other_difficulty> = $current_difficulty
		<other_player_status> = player1_status
		select = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
	endif
	formattext checksumname = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.player)
	if screenelementexists id = <card_checksum>
		destroyscreenelement id = <card_checksum>
	endif
	change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	if ($<player_status>.player = 1)
		spawnscript bossbattle_ai_damage params = {drain_time = <drain_time> player_status = <other_player_status> player_text = <other_player_text> select = <select>}
	endif
	spawnscriptnow ($battlemode_powerups [<select>].scr) id = battlemode params = {drain_time = <drain_time>
		player = <other_player>
		player_text = <other_player_text>
		other_player_status = <other_player_status>
		player_status = <player_status>
		difficulty = <other_difficulty>
		($battlemode_powerups [<select>].params)}
	band_playattackanim name = ($<player_status>.band_member) type = <select>
	band_playresponseanim name = ($<other_player_status>.band_member) type = <select>
	spawnscriptnow hammer_highway params = {other_player_text = <other_player_text>}
	if ($battlemode_powerups [<select>].fire_bolt = 1)
		spawnscriptnow attack_bolt params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript
boss_powerup_delay = 0

script 0x2042fe56 
	if ($game_mode = tutorial)
		return do_star = 0
	endif
	if ($<player_status>.current_num_powerups = 0)
		change boss_powerup_delay = 100
		return do_star = 0
	elseif ($<player_status>.current_num_powerups = 1)
		if ($boss_powerup_delay = 0)
			return do_star = 1
		else
			change boss_powerup_delay = ($boss_powerup_delay - 1)
			return do_star = 0
		endif
	elseif ($<player_status>.current_num_powerups = 2)
		return do_star = 1
	endif
endscript
bossbattle_missingnotefraction = 0.0

script bossbattle_ai_damage player_status = player2_status drain_time = 15000 player_text = 'p2'
	if structurecontains structure = ($battlemode_powerups [<select>]) no_ai_damage
		return
	endif
	gem_fraction = 0.0
	formattext checksumname = input_array 'bossresponse_array%p' p = <player_text>
	formattext checksumname = input_array_entry 'bossresponse_array%p_entry' p = <player_text>
	getsongtimems
	if structurecontains structure = ($battlemode_powerups [<select>]) immediate
		start_creation_time = <time>
		end_creation_time = (<start_creation_time> + <drain_time>)
		start_creation_index = ($last_bossresponse_array_entry)
	else
		start_creation_time = (<time> + ($<player_status>.scroll_time - $destroy_time) * 1000.0 + 1000)
		end_creation_time = (<start_creation_time> + <drain_time>)
		start_creation_index = ($<input_array_entry>)
	endif
	missed_note_percentage = ($current_boss.powerupmissednote.($current_difficulty))
	if ($battlemode_powerups [<select>].name = brokenstring)
		<end_creation_time> = (<start_creation_time> + 60000)
		<missed_note_percentage> = ($current_boss.brokenstringmissednote.($current_difficulty))
	endif
	begin
	begin
	getsongtimems
	if (<time> > <start_creation_time> - 200)
		break
	endif
	wait 1 gameframe
	repeat
	if ($battlemode_powerups [<select>].name = brokenstring)
		if ($<player_status>.broken_string_green < 3 &&
				$<player_status>.broken_string_red < 3 &&
				$<player_status>.broken_string_yellow < 3 &&
				$<player_status>.broken_string_blue < 3 &&
				$<player_status>.broken_string_orange < 3)
			break
		endif
	endif
	applybossbattlegemmisses {miss_percent = <missed_note_percentage>
		start_creation_index = <start_creation_index>
		start_creation_time = <start_creation_time>
		end_creation_time = <end_creation_time>
		gem_fraction = <gem_fraction>}
	getsongtimems
	start_creation_time = (<time> + ($<player_status>.scroll_time - $destroy_time) * 1000.0 + 1000)
	if NOT ($battlemode_powerups [<select>].name = brokenstring)
		if (<start_creation_time> >= <end_creation_time>)
			break
		endif
	endif
	repeat
endscript

script check_buttons_boss 
	formattext checksumname = input_array 'bossresponse_array%p' p = <player_text>
	song = <input_array>
	change last_bossresponse_array_entry = <array_entry>
	getstrumpattern song = <song> entry = <array_entry>
	do_hammer = ($<song> [<array_entry>] [6])
	0x80b865ab = 1
	if (<0x80b865ab> = 1)
		change boss_pattern = <strum>
		change boss_controller = ($<player_status>.controller)
		if (<do_hammer> = 1)
			change boss_strum = 0
		else
			change boss_strum = 1
		endif
	else
		change boss_pattern = 0
		change boss_strum = 0
	endif
endscript

script bossbattle_fill 
	bossbattle_ready \{battle_gem = 5
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 5
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 5
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
	displaysprite parent = root_window tex = icon_attack_deth pos = <boss_pos> just = [center center] z = 500
	doscreenelementmorph id = <id> pos = <player_pos> scale = 3.1 relative_scale time = 1.0
	wait \{2.0
		seconds}
	doscreenelementmorph id = <id> alpha = 0 time = 2.0
	wait \{2.0
		seconds}
	destroy_menu menu_id = <id>
endscript

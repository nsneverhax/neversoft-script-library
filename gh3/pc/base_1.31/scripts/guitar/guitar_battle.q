battle_easy_drain_offset = 0
battle_medium_drain_offset = 1500
battle_hard_drain_offset = 3000
battle_expert_drain_offset = 4500
disable_attacks = 0
battlemode_powerups = [
	{
		name = lightning
		name_text = "Amp Overload"
		weight = 10
		weight_low = 0
		weight_losing = 0
		scr = battle_lightning
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
		name = difficultyup
		name_text = "Difficulty Up"
		weight = 10
		weight_low = 0
		weight_losing = 0
		scr = battle_up_difficulty
		params = {
		}
		card_texture = icon_attack_difficulty
		drain_time = 5000
		fire_bolt = 1
	}
	{
		name = doublenotes
		name_text = "Double Notes"
		weight = 10
		weight_low = 0
		weight_losing = 0
		scr = battle_double_notes
		params = {
		}
		card_texture = icon_attack_addnote
		drain_time = 5000
		fire_bolt = 1
	}
	{
		name = powerupsteal
		name_text = "Powerup Steal"
		weight = 10
		weight_low = 0
		weight_losing = 10
		scr = battle_steal
		params = {
		}
		card_texture = icon_attack_drain
		drain_time = 5000
		fire_bolt = 0
	}
	{
		name = leftynotes
		name_text = "Lefty Flip"
		alt_name_text = "Righty Flip"
		weight = 10
		weight_low = 0
		weight_losing = 10
		scr = battle_lefty_notes
		params = {
		}
		card_texture = icon_attack_leftyrighty
		drain_time = 5000
		fire_bolt = 1
	}
	{
		name = brokenstring
		name_text = "Broken String"
		weight = 10
		weight_low = 0
		weight_losing = 0
		scr = battle_broken_string
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
		name = whammyattack
		name_text = "Whammy"
		weight = 10
		weight_low = 0
		weight_losing = 10
		scr = battle_whammy_attack
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
		name = deathlick
		name_text = "Death Drain"
		weight = 0
		weight_low = 0
		weight_losing = 0
		scr = battle_death_lick
		params = {
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
	createscreenelement \{type = containerelement
		parent = root_window
		id = battlemode_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	change structurename = <player_status> battlemode_creation_selection = -1
	change structurename = <player_status> current_num_powerups = 0
	change structurename = <player_status> final_blow_powerup = -1
	change structurename = <player_status> battle_text_count = 0
	change structurename = <player_status> shake_notes = -1
	change structurename = <player_status> double_notes = -1
	change structurename = <player_status> diffup_notes = -1
	change structurename = <player_status> lefty_notes = -1
	change structurename = <player_status> whammy_attack = -1
	change structurename = <player_status> stealing_powerup = -1
	change structurename = <player_status> death_lick_attack = -1
	change structurename = <player_status> last_selected_attack = -1
	change structurename = <player_status> last_hit_note = none
	change structurename = <player_status> broken_string_mask = 0
	change structurename = <player_status> broken_string_green = 0
	change structurename = <player_status> broken_string_red = 0
	change structurename = <player_status> broken_string_yellow = 0
	change structurename = <player_status> broken_string_blue = 0
	change structurename = <player_status> broken_string_orange = 0
	change structurename = <player_status> battle_num_attacks = 0
	change structurename = <player_status> hold_difficulty_up = 0.0
	player = (<player> + 1)
	repeat 2
	change \{current_battle_text_p1 = [
			id
			id
			id
		]}
	change \{current_battle_text_p2 = [
			id
			id
			id
		]}
	change \{battle_p1_highway_hammer = 0}
	change \{battle_p2_highway_hammer = 0}
	change \{disable_attacks = 0}
	change \{net_attack_pending = 0}
endscript

script battlemode_deinit 
	change \{disable_attacks = 1}
	gh_battlemode_stop_heartbeat_p1
	gh_battlemode_stop_heartbeat_p2
	killspawnedscript \{id = battlemode}
	change structurename = <player_status> battlemode_creation_selection = -1
	change structurename = <player_status> current_num_powerups = 0
	change structurename = <player_status> battle_text_count = 0
	change structurename = <player_status> shake_notes = -1
	change structurename = <player_status> double_notes = -1
	change structurename = <player_status> diffup_notes = -1
	change structurename = <player_status> lefty_notes = -1
	change structurename = <player_status> whammy_attack = -1
	change structurename = <player_status> stealing_powerup = -1
	change structurename = <player_status> death_lick_attack = -1
	change structurename = <player_status> last_selected_attack = -1
	change structurename = <player_status> last_hit_note = none
	change structurename = <player_status> broken_string_mask = 0
	change structurename = <player_status> broken_string_green = 0
	change structurename = <player_status> broken_string_red = 0
	change structurename = <player_status> broken_string_yellow = 0
	change structurename = <player_status> broken_string_blue = 0
	change structurename = <player_status> broken_string_orange = 0
	change structurename = <player_status> hold_difficulty_up = 0.0
	if NOT (($<player_status>.lefthanded_gems_flip_save) = ($<player_status>.lefthanded_gems))
		change structurename = <player_status> lefthanded_gems = ($<player_status>.lefthanded_gems_flip_save)
	endif
	if NOT (($<player_status>.lefthanded_button_ups_flip_save) = ($<player_status>.lefthanded_button_ups))
		change structurename = <player_status> lefthanded_button_ups = ($<player_status>.lefthanded_button_ups_flip_save)
	endif
	if screenelementexists \{id = battlemode_container}
		destroyscreenelement \{id = battlemode_container}
	endif
	change \{current_battle_text_p1 = [
			id
			id
			id
		]}
	change \{current_battle_text_p2 = [
			id
			id
			id
		]}
	change \{battle_p1_highway_hammer = 0}
	change \{battle_p2_highway_hammer = 0}
	battlemode_killspawnedscripts
endscript

script battlemode_killspawnedscripts 
	killspawnedscript \{name = animate_open_hand}
	killspawnedscript \{name = animate_stealing_hand}
	killspawnedscript \{name = net_battle_trigger}
	killspawnedscript \{name = animate_arrow}
	killspawnedscript \{name = update_broken_button}
	killspawnedscript \{name = animate_whammy_bar}
	killspawnedscript \{name = remove_hud_difficulty_up}
	killspawnedscript \{name = remove_hud_double_notes}
	killspawnedscript \{name = remove_hud_lefty_notes}
	killspawnedscript \{name = animate_steal}
	killspawnedscript \{name = flicker_gems}
	killspawnedscript \{name = shake_highway}
	killspawnedscript \{name = hammer_highway}
	killspawnedscript \{name = attack_ready_text}
	killspawnedscript \{name = animate_death_icon}
	killspawnedscript \{name = shake_rock_meter}
	killspawnedscript \{name = shake_highway_death}
	killspawnedscript \{name = death_text}
	killspawnedscript \{name = attack_bolt}
	killspawnedscript \{name = death_text_wing_flap}
	killspawnedscript \{name = bite_particle}
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
	change structurename = <player_status> battlemode_creation_selection = -1
	total_weight = 0
	num_attacks = 0
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
	getarraysize \{$battlemode_powerups}
	array_count = 0
	begin
	if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].name = difficultyup))
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
	repeat <array_size>
	getrandomvalue name = select_weight a = 0 b = (<total_weight> -1) integer
	if (<num_attacks> = 0)
		change structurename = <player_status> battlemode_creation_selection = 0
		return
	endif
	array_count = 0
	begin
	if NOT ($battle_sudden_death = 1)
		if NOT ((<other_player_difficulty> = expert) && ($battlemode_powerups [<array_count>].name = difficultyup))
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
	else
		change structurename = <player_status> battlemode_creation_selection = 7
		break
	endif
	if (<select_weight> < 0)
		change structurename = <player_status> battlemode_creation_selection = <array_count>
		change structurename = <player_status> last_selected_attack = <array_count>
		break
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	if ($<player_status>.battlemode_creation_selection = -1)
		printstruct <...>
		scriptassert \{"Battlemode selection not found"}
	endif
endscript
medium_scale = 0.55
small_scale = 0.4

script print_powerup_arrays 
	printf "Current powerups p1(%a):" a = ($player1_status.current_num_powerups)
	getarraysize \{$current_powerups_p1}
	array_count = 0
	begin
	printf "    %c: %p" c = <array_count> p = ($current_powerups_p1 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	printf "Current powerups p2(%a):" a = ($player2_status.current_num_powerups)
	getarraysize \{$current_powerups_p2}
	<array_count> = 0
	begin
	printf "    %c: %p" c = <array_count> p = ($current_powerups_p2 [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script battlemode_ready \{battle_gem = 0
		player_status = player1_status
		steal = 0
		battle_text = 1}
	printstruct <...>
	if ($<player_status>.player = 1)
		soundevent \{event = battle_power_awarded_sfx_p1}
	else
		soundevent \{event = battle_power_awarded_sfx_p2}
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	if (<current_num_powerups> >= $max_num_powerups)
		formattext checksumname = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.player)
		if screenelementexists id = <card_checksum>
			destroyscreenelement id = <card_checksum>
		endif
		change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
		printf "battlemode_ready - decremented p%n's current_num_powerups to %a" n = ($<player_status>.player) a = ($<player_status>.current_num_powerups)
		update_battlecards_remove player_status = <player_status>
	endif
	if NOT (screenelementexists id = battlemode_container)
		return
	endif
	if (<current_num_powerups> < 0)
		printf \{"Trying to decrement current_num_powerups below 0"}
		printf "player%p battle_gem=%b" p = ($<player_status>.player) b = <battle_gem>
		print_powerup_arrays
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
	printf "battlemode_ready - incremented p%n's current_num_powerups to %a" n = ($<player_status>.player) a = ($<player_status>.current_num_powerups)
	color = ($<player_status>.last_hit_note)
	if (<color> = none)
		<color> = green
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		begin_pos = (($button_up_models.<color>.left_pos_2d) - (0.0, 90.0))
	else
		begin_pos = (($button_up_models.<color>.pos_2d) - (0.0, 90.0))
	endif
	if ($<player_status>.player = 1)
		<begin_pos> = (<begin_pos> - (225.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (225.0, 0.0))
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
		just = [center center]
		alpha = 0.5
		z_priority = (($battle_hud_2d_elements.z) + 19)
	}
	if (<steal> > 0)
		doscreenelementmorph {
			id = <card_checksum>
			pos = <card_pos>
			alpha = 1
			time = 0
		}
	else
		doscreenelementmorph {
			id = <card_checksum>
			pos = <card_pos>
			alpha = 1
			time = 0.3
		}
	endif
	update_battlecards_add current_num_powerups = <current_num_powerups> player_status = <player_status>
	if ($show_battle_text = 1)
		if (<battle_text> = 1)
			spawnscriptnow attack_ready_text params = {current_num_powerups = <current_num_powerups> select = <select> player_status = <player_status>}
		endif
	endif
endscript

script attack_ready_text 
	if ($<player_status>.player = 1)
		<other_player_status> = player2_status
	else
		<other_player_status> = player1_status
	endif
	wait \{0.3
		seconds}
	formattext checksumname = text_checksum 'attack_ready_text_%s' s = ($<player_status>.player)
	if screenelementexists id = <text_checksum>
		destroyscreenelement id = <text_checksum>
	endif
	attack_name = ($battlemode_powerups [<select>].name_text)
	if ($battlemode_powerups [<select>].name = leftynotes)
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
	if ($<player_status>.player = 1)
		text_pos = ($battle_hud_2d_elements.attack_ready_text_pos_p1)
		createscreenelement {
			type = textelement
			id = <text_checksum>
			parent = battlemode_container
			pos = <text_pos>
			text = <attack_name>
			font = text_a4
			scale = 0.6
			rgba = [255 255 255 255]
			just = [left bottom]
			z_priority = 25
		}
	else
		text_pos = ($battle_hud_2d_elements.attack_ready_text_pos_p2)
		createscreenelement {
			type = textelement
			id = <text_checksum>
			parent = battlemode_container
			pos = <text_pos>
			text = <attack_name>
			font = text_a4
			scale = 0.6
			rgba = [255 255 255 255]
			just = [right bottom]
			z_priority = 25
		}
	endif
	wait \{3
		seconds}
	doscreenelementmorph {
		id = <text_checksum>
		alpha = 0
		time = 0.3
	}
endscript

script update_battlecards_add 
	if ($<player_status>.player = 1)
		player_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p1)
		small_pos = ($battle_hud_2d_elements.card_3_off_p1)
	else
		player_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p2)
		small_pos = ($battle_hud_2d_elements.card_3_off_p2)
	endif
	if (<current_num_powerups> > 0)
		formattext checksumname = card_checksum 'battlecard_0_%s' s = ($<player_status>.player)
		doscreenelementmorph {
			id = <card_checksum>
			pos = (<player_pos> + <medium_pos>)
			scale = $medium_scale
			time = 0.3
		}
		if (<current_num_powerups> > 1)
			formattext checksumname = card_checksum 'battlecard_1_%s' s = ($<player_status>.player)
			doscreenelementmorph {
				id = <card_checksum>
				pos = (<player_pos> + <medium_pos>)
				scale = $medium_scale
				time = 0.3
			}
			formattext checksumname = card_checksum 'battlecard_0_%s' s = ($<player_status>.player)
			doscreenelementmorph {
				id = <card_checksum>
				pos = (<player_pos> + <small_pos>)
				scale = $small_scale
				time = 0.3
			}
		endif
	endif
endscript

script update_battlecards_remove 
	if ($<player_status>.player = 1)
		player_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p1)
		small_pos = ($battle_hud_2d_elements.card_3_off_p1)
	else
		player_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		medium_pos = ($battle_hud_2d_elements.card_2_off_p2)
		small_pos = ($battle_hud_2d_elements.card_3_off_p2)
	endif
	if ($<player_status>.current_num_powerups > 0)
		formattext checksumname = card_checksum 'battlecard_0_%s' s = ($<player_status>.player)
		doscreenelementmorph {
			id = <card_checksum>
			pos = <player_pos>
			scale = 1
			time = 0.3
		}
		if ($<player_status>.current_num_powerups > 1)
			formattext checksumname = card_checksum 'battlecard_1_%s' s = ($<player_status>.player)
			doscreenelementmorph {
				id = <card_checksum>
				pos = <player_pos>
				scale = 1
				time = 0.3
			}
			formattext checksumname = card_checksum 'battlecard_0_%s' s = ($<player_status>.player)
			doscreenelementmorph {
				id = <card_checksum>
				pos = (<player_pos> + <medium_pos>)
				scale = $medium_scale
				time = 0.3
			}
		endif
	endif
endscript

script add_battle_text 
	if (($<send_to_player>.battle_text_count) < 3)
		extendcrc <battle_text> ($<send_to_player>.text) out = id
		count = 0
		begin
		if ($<send_to_player>.player = 1)
			current_id = ($current_battle_text_p1 [<count>])
		else
			current_id = ($current_battle_text_p2 [<count>])
		endif
		if (<current_id> = <id>)
			printf \{"Text allready on screen, don't add a new screen element"}
			return
		endif
		<count> = (<count> + 1)
		repeat 3
		if ($<send_to_player>.player = 1)
			<id> :setprops z_priority = -1
			doscreenelementmorph id = <id> alpha = 1 pos = (380.0, 35.0)
		else
			<id> :setprops z_priority = -1
			doscreenelementmorph id = <id> alpha = 1 pos = (890.0, 35.0)
		endif
		battle_count = ($<send_to_player>.battle_text_count)
		if ($<send_to_player>.player = 1)
			setarrayelement arrayname = current_battle_text_p1 globalarray index = <battle_count> newvalue = <id>
		else
			setarrayelement arrayname = current_battle_text_p2 globalarray index = <battle_count> newvalue = <id>
		endif
		change structurename = <send_to_player> battle_text_count = (($<send_to_player>.battle_text_count) + 1)
		if (($<send_to_player>.battle_text_count) > 1)
			count = 0
			begin
			if ((($<send_to_player>.battle_text_count) - <count>) > 1)
				if ($<send_to_player>.player = 1)
					battle_text_to_move = ($current_battle_text_p1 [<count>])
				else
					battle_text_to_move = ($current_battle_text_p2 [<count>])
				endif
				getscreenelementdims id = <battle_text_to_move>
				getscreenelementposition id = <battle_text_to_move>
				x_offset = (<width> / 2)
				doscreenelementmorph {
					id = <battle_text_to_move>
					pos = (<screenelementpos> + (0.0, 30.0) + (<x_offset> * (1.0, 0.0)))
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
	if NOT gotparam \{id}
		return
	endif
	count = 0
	begin
	if ($<send_to_player>.player = 1)
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
	if ($<send_to_player>.player = 1)
		doscreenelementmorph id = ($current_battle_text_p1 [<remove_text>]) alpha = 0 time = 0.3
		setarrayelement arrayname = current_battle_text_p1 globalarray index = <remove_text> newvalue = id
	else
		doscreenelementmorph id = ($current_battle_text_p2 [<remove_text>]) alpha = 0 time = 0.3
		setarrayelement arrayname = current_battle_text_p2 globalarray index = <remove_text> newvalue = id
	endif
	change structurename = <send_to_player> battle_text_count = ($<send_to_player>.battle_text_count - 1)
	if (<remove_text> < 2)
		count = <remove_text>
		begin
		if NOT (<count> >= ($<send_to_player>.battle_text_count))
			if ($<send_to_player>.player = 1)
				battle_text_to_move = ($current_battle_text_p1 [(<count> + 1)])
				setarrayelement arrayname = current_battle_text_p1 globalarray index = (<count> + 1) newvalue = id
				setarrayelement arrayname = current_battle_text_p1 globalarray index = <count> newvalue = <battle_text_to_move>
			else
				battle_text_to_move = ($current_battle_text_p2 [(<count> + 1)])
				setarrayelement arrayname = current_battle_text_p2 globalarray index = (<count> + 1) newvalue = id
				setarrayelement arrayname = current_battle_text_p2 globalarray index = <count> newvalue = <battle_text_to_move>
			endif
		endif
		<count> = (<count> + 1)
		repeat 2
	endif
	if (($<send_to_player>.battle_text_count) > 0)
		count = 0
		begin
		if (<count> < <remove_text>)
			if ($<send_to_player>.player = 1)
				battle_text_to_move = ($current_battle_text_p1 [<count>])
			else
				battle_text_to_move = ($current_battle_text_p2 [<count>])
			endif
			getscreenelementdims id = <battle_text_to_move>
			getscreenelementposition id = <battle_text_to_move>
			x_offset = (<width> / 2)
			doscreenelementmorph {
				id = <battle_text_to_move>
				pos = (<screenelementpos> - (0.0, 30.0) + (<x_offset> * (1.0, 0.0)))
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
	wait \{5
		seconds}
	battle_trigger_on \{player_status = player2_status}
	wait \{1
		gameframe}
	battle_trigger_on \{player_status = player2_status}
	wait \{1
		gameframe}
	battle_trigger_on \{player_status = player1_status}
	wait \{1
		gameframe}
	battle_trigger_on \{player_status = player1_status}
endscript

script battle_trigger_on 
	if ($<player_status>.current_num_powerups = 0)
		return
	endif
	if ($<player_status>.player = 1)
		<other_player> = 2
		<other_player_text> = 'p2'
		<other_difficulty> = $current_difficulty2
		<other_player_status> = player2_status
		select = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		gh3_battle_play_crowd_reaction_sfx receiving_player = 2 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
		if ($is_network_game)
			if NOT (<select> = 3)
				sendnetmessage {
					type = battle_trigger_on
					select = <select>
				}
			endif
		endif
	else
		<other_player> = 1
		<other_player_text> = 'p1'
		<other_difficulty> = $current_difficulty
		<other_player_status> = player1_status
		select = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		gh3_battle_play_crowd_reaction_sfx receiving_player = 1 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
	endif
	formattext checksumname = card_checksum 'battlecard_%i_%s' i = ($<player_status>.current_num_powerups - 1) s = ($<player_status>.player)
	if screenelementexists id = <card_checksum>
		destroyscreenelement id = <card_checksum>
	endif
	change structurename = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	printf "battle_trigger_on - decremented p%n's current_num_powerups to %a" n = ($<player_status>.player) a = ($<player_status>.current_num_powerups)
	if ($<player_status>.current_num_powerups < 0)
		printf "BAD!  Trying to decrement num_powerups on %s that is already zero." s = ($<player_status>.text)
		printf "num powerups: %i" i = ($<player_status>.current_num_powerups)
		printf "Trying to use powerup: %i" i = <select>
	endif
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<select>].drain_time)
	other_player_difficulty = easy
	if ($<player_status>.player = 1)
		<other_player_difficulty> = $current_difficulty2
	else
		<other_player_difficulty> = $current_difficulty
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
	change structurename = <player_status> final_blow_powerup = <select>
	if NOT ($<player_status>.highway_layout = solo_highway)
		spawnscriptnow ($battlemode_powerups [<select>].scr) id = battlemode params = {drain_time = <drain_time>
			player = <other_player>
			player_text = <other_player_text>
			other_player_status = <other_player_status>
			player_status = <player_status>
			difficulty = <other_difficulty>
			($battlemode_powerups [<select>].params)}
	endif
	change structurename = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	band_playattackanim name = ($<player_status>.band_member) type = <select>
	band_playresponseanim name = ($<other_player_status>.band_member) type = <select>
	if ($<player_status>.highway_layout = solo_highway)
		spawnscriptnow hammer_rock_meter params = {other_player_text = <other_player_text>}
	else
		spawnscriptnow hammer_highway params = {other_player_text = <other_player_text>}
	endif
	if ($battlemode_powerups [<select>].fire_bolt = 1)
		spawnscriptnow attack_bolt params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript

script attack_bolt \{bolt_angle = 60}
	bolt_pos_middle = (640.0, 230.0)
	bolt_pos_offset = (330.0, 0.0)
	formattext checksumname = attack_bolt 'attack_bolt%p' p = ($<player_status>.text) addtostringlookup = true
	if screenelementexists id = <attack_bolt>
		destroyscreenelement id = <attack_bolt>
	endif
	if ($<player_status>.player = 1)
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
	createscreenelement {
		type = spriteelement
		id = <attack_bolt>
		parent = battlemode_container
		material = sys_big_bolt01_red_sys_big_bolt01_red
		rgba = [255 255 255 255]
		pos = <bolt_pos>
		rot_angle = <bolt_angle>
		scale = <bolt_scale>
		just = <bolt_just>
		z_priority = 10
	}
	getsongtimems
	formattext checksumname = attack_bolt_particle 'attack_bolt_particle_%s_%t' s = ($<player_status>.text) t = <time> addtostringlook = true
	if ($<player_status>.player = 1)
		emit_direction = 300
		bolt_hit_pos = (<bolt_pos> + (455.0, 0.0) + (0.0, 250.0))
	else
		emit_direction = -300
		bolt_hit_pos = (<bolt_pos> - (455.0, 0.0) + (0.0, 250.0))
	endif
	create2dparticlesystem {
		id = <attack_bolt_particle>
		pos = (<bolt_hit_pos>)
		parent = battlemode_container
		z_priority = 8.0
		material = sys_particle_spark01_sys_particle_spark01
		start_color = [255 66 0 255]
		end_color = [128 0 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (0.5, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.01
		emit_dir = <emit_direction>
		emit_spread = 90.0
		velocity = 16.0
		friction = (0.0, 24.0)
		time = 1
	}
	wait \{8
		gameframes}
	if screenelementexists id = <attack_bolt>
		destroyscreenelement id = <attack_bolt>
	endif
	wait \{2
		gameframes}
	destroy2dparticlesystem id = <attack_bolt_particle> kill_when_empty
endscript

script battle_death_lick \{death_speed = 0.2}
	if NOT ($boss_battle = 1)
		switch <difficulty>
			case easy
			<death_speed> = ($battlemode_powerups [7].easy_kill_rate)
			case medium
			<death_speed> = ($battlemode_powerups [7].medium_kill_rate)
			case hard
			<death_speed> = ($battlemode_powerups [7].hard_kill_rate)
			case expert
			<death_speed> = ($battlemode_powerups [7].expert_kill_rate)
		endswitch
	endif
	spawnscriptnow attack_bolt params = {bolt_angle = 80 player_status = <player_status> other_player_status = <other_player_status>}
	if ($<other_player_status>.player = 1)
		spawnscriptnow \{gh_battlemode_start_heartbeat_p1}
		spawnscriptnow gh_battlemode_player1_sfx_death_drain params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscriptnow \{gh_battlemode_start_heartbeat_p2}
		spawnscript gh_battlemode_player2_sfx_death_drain params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	player1_pos = (310.0, 170.0)
	player2_pos = (981.0, 170.0)
	if ($<other_player_status>.player = 1)
		start_pos = <player2_pos>
		end_pos = <player1_pos>
	else
		start_pos = <player1_pos>
		end_pos = <player2_pos>
	endif
	getsongtimems
	formattext checksumname = death_icon_checksum 'death_icon_%s_%t' s = ($<other_player_status>.player) t = <time>
	if screenelementexists id = <death_icon_checksum>
		destroyscreenelement id = <death_icon_checksum>
	endif
	deth_icon_texture = icon_attack_deth_128
	if checksumequals a = ($current_song) b = bossslash
		<deth_icon_texture> = icon_attack_deth_boss_slash
	elseif checksumequals a = ($current_song) b = bosstom
		<deth_icon_texture> = icon_attack_deth_boss_morello
	endif
	createscreenelement {
		type = spriteelement
		id = <death_icon_checksum>
		parent = battlemode_container
		texture = <deth_icon_texture>
		rgba = [255 255 255 255]
		pos = <start_pos>
		alpha = 1
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 25
	}
	killspawnedscript \{name = update_battle_death_meter}
	killspawnedscript \{name = update_battle_death_meter_wings}
	formattext \{checksumname = death_meter
		'battle_death_meter'
		addtostringlookup = true}
	if screenelementexists id = <death_meter>
		destroyscreenelement id = <death_meter>
	endif
	if ($<other_player_status>.death_lick_attack < 0)
		spawnscriptnow death_text params = {other_player_status = <other_player_status>}
	endif
	if screenelementexists id = <id>
		doscreenelementmorph id = <id> pos = <end_pos> scale = 1.2 alpha = 0.95 relative_scale
	endif
	if ($boss_battle = 1)
		change \{structurename = player2_status
			final_blow_powerup = 7}
	endif
	if NOT ($<other_player_status>.death_lick_attack > -1)
		spawnscriptnow animate_death_icon params = {other_player_status = <other_player_status> id = <id>}
		change structurename = <other_player_status> death_lick_attack = <death_speed>
		begin
		crowddecrease player_status = <other_player_status>
		if ($<other_player_status>.current_health <= 0.0)
			break
		endif
		wait ($<other_player_status>.death_lick_attack) seconds
		repeat
	else
		if screenelementexists id = <death_icon_checksum>
			destroyscreenelement id = <death_icon_checksum>
		endif
		change structurename = <other_player_status> death_lick_attack = ($<other_player_status>.death_lick_attack * 0.5)
	endif
endscript

script test_fight_death 
	begin
	crowdincrease \{player_status = player2_status}
	if ($player2_status.current_health <= 0.0)
		break
	endif
	wait \{0.2
		seconds}
	repeat
endscript

script animate_death_icon 
	pulse_on = 0
	begin
	if ($<other_player_status>.current_health <= 0.0)
		break
	endif
	if (<pulse_on> = 0)
		if screenelementexists id = <id>
			doscreenelementmorph id = <id> time = 0.1 alpha = 0.1 scale = 1.1 relative_scale
		endif
		<pulse_on> = 1
	else
		if screenelementexists id = <id>
			doscreenelementmorph id = <id> time = 0.1 alpha = 0.95 scale = 1.2 relative_scale
		endif
		<pulse_on> = 0
	endif
	wait \{0.15
		seconds}
	repeat
endscript

script death_text 
	text_start_pos = (640.0, 430.0)
	text_offset = (225.0, 0.0)
	if (($<other_player_status>.player) = 1)
		<text_start_pos> = (<text_start_pos> - <text_offset>)
	else
		<text_start_pos> = (<text_start_pos> + <text_offset>)
	endif
	formattext checksumname = text_bg_checksum 'sudden_death_text_bg_%s' s = ($<other_player_status>.text)
	formattext checksumname = text_wing_r_checksum 'sudden_death_wing_r_%s' s = ($<other_player_status>.text)
	formattext checksumname = text_wing_l_checksum 'sudden_death_wing_l_%s' s = ($<other_player_status>.text)
	formattext checksumname = text_checksum 'sudden_death_text_%s' s = ($<other_player_status>.text)
	formattext checksumname = text_checksum2 'sudden_death_text2_%s' s = ($<other_player_status>.text)
	if screenelementexists id = <text_bg_checksum>
		destroyscreenelement id = <text_bg_checksum>
	endif
	if screenelementexists id = <text_checksum>
		destroyscreenelement id = <text_checksum>
	endif
	createscreenelement {
		type = spriteelement
		id = <text_bg_checksum>
		parent = battlemode_container
		texture = battle_alert_death
		rgba = [255 255 255 255]
		pos = <text_start_pos>
		scale = 0.7
		alpha = 0
		just = [center bottom]
		z_priority = 52
	}
	createscreenelement {
		type = spriteelement
		id = <text_wing_r_checksum>
		parent = <text_bg_checksum>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		pos = (205.0, 0.0)
		scale = 0.8
		rot_angle = -20
		just = [left top]
		z_priority = 52
	}
	createscreenelement {
		type = spriteelement
		id = <text_wing_l_checksum>
		parent = <text_bg_checksum>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		pos = (55.0, 0.0)
		scale = (-0.8, 0.8)
		rot_angle = 20
		just = [right top]
		z_priority = 52
	}
	createscreenelement {
		type = textelement
		id = <text_checksum>
		parent = <text_bg_checksum>
		pos = (130.0, -53.0)
		text = "DEATH"
		font = text_a10
		scale = 1
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 53
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createscreenelement {
		type = textelement
		id = <text_checksum2>
		parent = <text_bg_checksum>
		pos = (130.0, 5.0)
		text = "DRAIN"
		font = text_a10
		scale = 1.6
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 53
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	doscreenelementmorph {
		id = <text_bg_checksum>
		time = 0.02
		scale = 0.9
		alpha = 1
	}
	wait \{0.02
		seconds}
	spawnscriptnow death_text_wing_flap params = {text_start_pos = <text_start_pos> text_bg_checksum = <text_bg_checksum> text_wing_l_checksum = <text_wing_l_checksum> text_wing_r_checksum = <text_wing_r_checksum> other_player_status = <other_player_status>}
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
		doscreenelementmorph {id = <text_bg_checksum> pos = <new_pos> scale = <new_scale>}
	endif
	if (<wing_count> = 4)
		getrandomvalue name = random_rot a = (<hover_sim_rot> * -1) b = <hover_sim_rot> integer
		doscreenelementmorph {
			id = <text_bg_checksum>
			rot_angle = <random_rot>
			time = 0.02
		}
		spawnscriptnow bite_particle params = {other_player_status = <other_player_status> random_rot = <random_rot> text_bg_checksum = <text_bg_checksum>}
		if (<wing_up> = 0)
			doscreenelementmorph {
				id = <text_wing_r_checksum>
				rot_angle = -40
				time = 0.02
			}
			doscreenelementmorph {
				id = <text_wing_l_checksum>
				rot_angle = 40
				time = 0.02
			}
			<wing_up> = 1
		else
			doscreenelementmorph {
				id = <text_wing_r_checksum>
				rot_angle = -10
				time = 0.02
			}
			doscreenelementmorph {
				id = <text_wing_l_checksum>
				rot_angle = 10
				time = 0.02
			}
			<wing_up> = 0
		endif
		<wing_count> = 0
	endif
	<wing_count> = (<wing_count> + 1)
	wait \{1
		gameframe}
	repeat
endscript

script bite_particle 
	if (<random_rot> > 0)
		formattext checksumname = death_bite 'death_bite_r_%s' s = ($<other_player_status>.text) addtostringlook = true
		spawnscriptnow hammer_highway params = {push_p1 = (0.0, 30.0) push_p2 = (0.0, 30.0) other_player_text = ($<other_player_status>.text) time = 0.01}
		pos = (190.0, 120.0)
	else
		if NOT (<random_rot> = 0)
			formattext checksumname = death_bite 'death_bite_l_%s' s = ($<other_player_status>.text) addtostringlook = true
			spawnscriptnow hammer_highway params = {push_p1 = (0.0, 30.0) push_p2 = (0.0, 30.0) other_player_text = ($<other_player_status>.text) time = 0.01}
			pos = (65.0, 120.0)
		endif
	endif
	if NOT (<random_rot> = 0)
		create2dparticlesystem {
			id = <death_bite>
			pos = <pos>
			parent = <text_bg_checksum>
			z_priority = 12.0
			material = sys_particle_spark01_sys_particle_spark01
			start_color = [255 0 0 255]
			end_color = [128 0 0 0]
			start_scale = (2.0, 2.0)
			end_scale = (0.5, 0.5)
			start_angle_spread = 360.0
			min_rotation = -500.0
			max_rotation = 500.0
			emit_start_radius = 0.0
			emit_radius = 1.0
			emit_rate = 0.01
			emit_dir = 0.0
			emit_spread = 160.0
			velocity = 10.0
			friction = (0.0, 50.0)
			time = 0.25
		}
		wait \{7
			frames}
		destroy2dparticlesystem id = <death_bite>
	endif
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
	if ($<other_player_status>.player = 1)
		change battle_flicker_difficulty_p1 = <flicker_ammount>
		spawnscript gh_battlemode_player1_sfx_shake_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		change battle_flicker_difficulty_p2 = <flicker_ammount>
		spawnscript gh_battlemode_player2_sfx_shake_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	getsongtimems
	casttointeger \{time}
	if ($<other_player_status>.shake_notes > -1)
		change structurename = <other_player_status> shake_notes = (($<other_player_status>.shake_notes) + <drain_time>)
	else
		change structurename = <other_player_status> shake_notes = (<time> + <drain_time>)
		spawnscriptnow flicker_gems params = {player = <player> other_player_status = <other_player_status>}
		spawnscriptnow shake_highway params = {player_text = <player_text> other_player_status = <other_player_status>}
		begin
		getsongtimems
		if (<time> > $<other_player_status>.shake_notes)
			change structurename = <other_player_status> shake_notes = -1
			break
		endif
		wait \{1
			gameframe}
		repeat
		guitarevent_battleattackfinished <...>
	endif
endscript

script flicker_gems 
	begin
	if ($<other_player_status>.shake_notes > -1)
		launchgemevent event = flicker_on player = <player>
	else
		launchgemevent event = flicker_off player = <player>
		break
	endif
	wait \{3
		gameframes}
	repeat
endscript

script shake_highway 
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	getscreenelementposition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	begin
	if (<player_text> = 'p1')
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		getscreenelementposition id = <container_id>
		original_position = <screenelementpos>
		break
	endif
	wait \{1
		gameframe}
	repeat
	pulse_on = 0
	begin
	if ($<other_player_status>.shake_notes > -1)
		if (<pulse_on> = 0)
			doscreenelementmorph {
				id = <container_id>
				pos = (<original_position> + (0.0, 8.0))
				just = [center bottom]
				time = <shake_frequency>
			}
			wait <shake_frequency> seconds
			<pulse_on> = 1
		else
			doscreenelementmorph {
				id = <container_id>
				pos = (<original_position> - (0.0, 8.0))
				just = [center bottom]
				time = <shake_frequency>
			}
			wait <shake_frequency> seconds
			<pulse_on> = 0
		endif
	else
		doscreenelementmorph {
			id = <container_id>
			pos = <original_position>
			just = [center bottom]
		}
		break
	endif
	wait \{1
		gameframes}
	repeat
endscript

script shake_highway_death 
	formattext checksumname = container_id 'gem_container%p' p = ($<other_player_status>.text) addtostringlookup = true
	getscreenelementposition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	begin
	if (<player_text> = 'p1')
		mid_hammer_highway = $battle_p1_highway_hammer
	else
		mid_hammer_highway = $battle_p2_highway_hammer
	endif
	if NOT (<mid_hammer_highway> = 1)
		getscreenelementposition id = <container_id>
		original_position = <screenelementpos>
		break
	endif
	wait \{1
		gameframe}
	repeat
	pulse_on = 0
	begin
	if (<pulse_on> = 0)
		doscreenelementmorph {
			id = <container_id>
			pos = (<original_position> + (7.0, 0.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 1
	else
		doscreenelementmorph {
			id = <container_id>
			pos = (<original_position> - (7.0, 0.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 0
	endif
	wait \{1
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
			change \{battle_p1_highway_hammer = 1}
		else
			change \{battle_p2_highway_hammer = 1}
		endif
		formattext checksumname = container_id 'gem_container%p' p = <other_player_text> addtostringlookup = true
		getscreenelementposition id = <container_id>
		original_position = <screenelementpos>
		doscreenelementmorph {
			id = <container_id>
			pos = (<original_position> + <push_pos>)
			just = [center bottom]
			time = <time>
		}
		wait <time> seconds
		doscreenelementmorph {
			id = <container_id>
			pos = <original_position>
			just = [center bottom]
			time = <time>
		}
		wait <time> seconds
		if (<other_player_text> = 'p1')
			change \{battle_p1_highway_hammer = 0}
		else
			change \{battle_p2_highway_hammer = 0}
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
			change \{battle_p1_highway_hammer = 1}
		else
			change \{battle_p2_highway_hammer = 1}
		endif
		formattext checksumname = container_id 'HUD2D_rock_container%p' p = <other_player_text> addtostringlookup = true
		getscreenelementposition id = <container_id>
		original_position = <screenelementpos>
		doscreenelementmorph {
			id = <container_id>
			pos = (<original_position> + <push_pos>)
			just = [center bottom]
			time = 0.1
		}
		wait \{0.1
			seconds}
		doscreenelementmorph {
			id = <container_id>
			pos = <original_position>
			just = [center bottom]
			time = 0.1
		}
		if (<other_player_text> = 'p1')
			change \{battle_p1_highway_hammer = 0}
		else
			change \{battle_p2_highway_hammer = 0}
		endif
	endif
endscript

script shake_rock_meter 
	shake_ammount = (3.0, 0.0)
	formattext checksumname = container_id 'HUD2D_rock_container%p' p = ($<other_player_status>.text) addtostringlookup = true
	getscreenelementposition id = <container_id>
	original_position = <screenelementpos>
	begin
	doscreenelementmorph {
		id = <container_id>
		pos = (<original_position> + <shake_ammount>)
		just = [center bottom]
		time = 0.1
	}
	wait \{0.1
		seconds}
	doscreenelementmorph {
		id = <container_id>
		pos = (<original_position> - <shake_ammount>)
		just = [center bottom]
		time = 0.1
	}
	wait \{0.1
		seconds}
	repeat
endscript

script battle_up_difficulty 
	if ($<other_player_status>.player = 1)
		spawnscript gh_battlemode_player1_sfx_diffup_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript gh_battlemode_player2_sfx_diffup_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if (<difficulty> = expert)
		battle_double_notes <...>
		return
	endif
	if NOT ($<other_player_status>.diffup_notes = -1)
		change structurename = <other_player_status> diffup_notes = ($<other_player_status>.diffup_notes + <drain_time>)
		return
	endif
	getsongtimems
	casttointeger \{time}
	change structurename = <other_player_status> diffup_notes = (<time> + <drain_time>)
	update_hud_difficulty_up other_player_status = <other_player_status> difficulty = <difficulty>
	hold_difficulty_up = ($<other_player_status>.hold_difficulty_up)
	begin
	getsongtimems
	casttointeger \{time}
	if (<time> > <hold_difficulty_up>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	extendcrc change_difficulty <player_text> out = type
	original_difficulty = <difficulty>
	switch <difficulty>
		case easy
		broadcastevent type = <type> data = {difficulty = medium difficulty_text_nl = 'medium'}
		case medium
		broadcastevent type = <type> data = {difficulty = hard difficulty_text_nl = 'hard'}
		case hard
		broadcastevent type = <type> data = {difficulty = expert difficulty_text_nl = 'expert'}
	endswitch
	getsongtimems
	casttointeger \{time}
	change structurename = <other_player_status> diffup_notes = (<time> + <drain_time>)
	begin
	getsongtimems
	if (<time> > $<other_player_status>.diffup_notes)
		printf \{"end battle"}
		extendcrc change_difficulty <player_text> out = type
		original_difficulty = <difficulty>
		switch <original_difficulty>
			case easy
			broadcastevent type = <type> data = {difficulty = easy difficulty_text_nl = 'easy'}
			case medium
			broadcastevent type = <type> data = {difficulty = medium difficulty_text_nl = 'medium'}
			case hard
			broadcastevent type = <type> data = {difficulty = hard difficulty_text_nl = 'hard'}
		endswitch
		break
	endif
	wait \{1
		gameframe}
	repeat
	change structurename = <other_player_status> diffup_notes = -1
	guitarevent_battleattackfinished <...>
endscript

script battle_double_notes 
	if ($<other_player_status>.player = 1)
		spawnscript gh_battlemode_player1_sfx_doublenotes_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript gh_battlemode_player2_sfx_doublenotes_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if NOT ($<other_player_status>.double_notes = -1)
		change structurename = <other_player_status> double_notes = ($<other_player_status>.double_notes + <drain_time>)
		return
	endif
	getsongtimems
	casttointeger \{time}
	change structurename = <other_player_status> double_notes = (<time> + <drain_time>)
	update_hud_double_notes other_player_status = <other_player_status>
	begin
	getsongtimems
	if (<time> > $<other_player_status>.double_notes)
		printf \{"end battle"}
		change structurename = <other_player_status> double_notes = -1
		break
	endif
	wait \{1
		gameframe}
	repeat
	guitarevent_battleattackfinished <...>
endscript

script battle_steal 
	if ($<other_player_status>.player = 1)
		spawnscript \{gh_battlemode_player1_sfx_steal
			params = {
				holdtime = 1.0
			}
			id = battlemode}
		morph_to_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
		start_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		spawnscript \{gh_battlemode_player2_sfx_steal
			params = {
				holdtime = 1.0
			}
			id = battlemode}
		morph_to_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
		start_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	change structurename = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup + 1)
	animate_steal start_pos = <start_pos> morph_to_pos = <morph_to_pos> player_status = <player_status> other_player_status = <other_player_status>
	change structurename = <other_player_status> stealing_powerup = ($<other_player_status>.stealing_powerup - 1)
endscript

script animate_steal 
	if ($<other_player_status>.player = 1)
		hand_scale = (-1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (-40.0, 0.0)
	else
		hand_scale = (1.0, 1.0)
		hand_y_offset = (0.0, -10.0)
		hand_x_offset = (40.0, 0.0)
	endif
	formattext checksumname = steal_hand_open_checksum 'steal_hand_open_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.player)
	if screenelementexists id = <steal_hand_open_checksum>
		destroyscreenelement id = <steal_hand_open_checksum>
	endif
	formattext checksumname = steal_hand_checksum 'steal_hand_%i_%p' i = ($<other_player_status>.stealing_powerup) p = ($<other_player_status>.player)
	wait \{1
		gameframe}
	createscreenelement {
		type = spriteelement
		id = <steal_hand_open_checksum>
		parent = battlemode_container
		texture = battle_hud_steal_hand_open
		rgba = [255 255 255 255]
		pos = (<morph_to_pos> + <hand_y_offset>)
		scale = <hand_scale>
		alpha = 0
		just = [center center]
		z_priority = 25
	}
	doscreenelementmorph {
		id = <steal_hand_open_checksum>
		pos = (<start_pos> + <hand_y_offset> - <hand_x_offset>)
		alpha = 1
		time = 0.5
	}
	wait \{0.5
		seconds}
	if screenelementexists id = <steal_hand_open_checksum>
		destroyscreenelement id = <steal_hand_open_checksum>
	endif
	if NOT ($<other_player_status>.current_num_powerups = 0)
		if ($<other_player_status>.player = 1)
			select = ($current_powerups_p1 [($<other_player_status>.current_num_powerups - 1)])
		else
			select = ($current_powerups_p2 [($<other_player_status>.current_num_powerups - 1)])
		endif
		formattext checksumname = card_checksum 'battlecard_%i_%s' i = ($<other_player_status>.current_num_powerups - 1) s = ($<other_player_status>.player)
		if screenelementexists id = <card_checksum>
			destroyscreenelement id = <card_checksum>
		endif
		change structurename = <other_player_status> current_num_powerups = ($<other_player_status>.current_num_powerups - 1)
		printf "animate_steal - decremented p%n's current_num_powerups to %a" n = ($<other_player_status>.player) a = ($<other_player_status>.current_num_powerups)
		update_battlecards_remove player_status = <other_player_status>
		getsongtimems
		formattext checksumname = held_card_checksum 'held_battlecard_%i_%s_%t' i = ($<other_player_status>.current_num_powerups - 1) s = ($<other_player_status>.player) t = <time>
		createscreenelement {
			type = spriteelement
			id = <held_card_checksum>
			parent = battlemode_container
			texture = ($battlemode_powerups [<select>].card_texture)
			rgba = [255 255 255 255]
			pos = <start_pos>
			dims = (64.0, 64.0)
			just = [center center]
			z_priority = (($battle_hud_2d_elements.z) + 19)
		}
		doscreenelementmorph {
			id = <held_card_checksum>
			pos = <morph_to_pos>
			time = 0.5
		}
		if screenelementexists id = <steal_hand_checksum>
			destroyscreenelement id = <steal_hand_checksum>
		endif
		createscreenelement {
			type = spriteelement
			id = <steal_hand_checksum>
			parent = battlemode_container
			texture = battle_hud_steal_hand
			rgba = [255 255 255 255]
			pos = (<start_pos> + <hand_y_offset> - <hand_x_offset>)
			scale = <hand_scale>
			alpha = 1
			just = [center center]
			z_priority = 25
		}
		doscreenelementmorph {
			id = <steal_hand_checksum>
			texture = battle_hud_steal_hand
			pos = (<morph_to_pos> + <hand_y_offset> - <hand_x_offset>)
			time = 0.5
		}
		wait \{0.4
			seconds}
		doscreenelementmorph {
			id = <steal_hand_checksum>
			alpha = 0
			time = 0.1
		}
		wait \{0.1
			seconds}
		if screenelementexists id = <held_card_checksum>
			destroyscreenelement id = <held_card_checksum>
		endif
		if screenelementexists id = <steal_hand_checksum>
			destroyscreenelement id = <steal_hand_checksum>
		endif
		battlemode_ready player_status = <player_status> battle_gem = <select> steal = 1
	endif
endscript

script battle_lefty_notes 
	if ($<other_player_status>.player = 1)
		spawnscript gh_battlemode_player1_sfx_leftynotes_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript gh_battlemode_player2_sfx_leftynotes_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if NOT ($<other_player_status>.lefty_notes = -1)
		change structurename = <other_player_status> lefty_notes = ($<other_player_status>.lefty_notes + <drain_time>)
		return
	endif
	change structurename = <other_player_status> lefthanded_gems_flip_save = ($<other_player_status>.lefthanded_gems)
	change structurename = <other_player_status> lefthanded_button_ups_flip_save = ($<other_player_status>.lefthanded_button_ups)
	change structurename = <other_player_status> lefthanded_gems = (1 + $<other_player_status>.lefthanded_gems * -1)
	getsongtimems
	casttointeger \{time}
	change structurename = <other_player_status> lefty_notes = (<time> + <drain_time>)
	start_time = (<time> + (($<other_player_status>.scroll_time - $destroy_time) * 1000.0))
	end_time = -1
	update_hud_lefty_notes other_player_status = <other_player_status>
	begin
	getsongtimems
	if NOT (<start_time> = -1)
		if (<time> > (<start_time> - 500))
			animate_lefty_flip other_player_status = <other_player_status> player_text = <player_text>
			change structurename = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
			start_time = -1
		endif
	endif
	if (<time> > $<other_player_status>.lefty_notes)
		printf \{"end battle"}
		end_time = (<time> + (($<other_player_status>.scroll_time - $destroy_time) * 1000.0))
		change structurename = <other_player_status> lefthanded_gems = (1 + $<other_player_status>.lefthanded_gems * -1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	getsongtimems
	if NOT (<start_time> = -1)
		if (<time> > <start_time>)
			animate_lefty_flip other_player_status = <other_player_status> player_text = <player_text>
			change structurename = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
			start_time = -1
		endif
	endif
	if (<time> > (<end_time> - 500))
		animate_lefty_flip other_player_status = <other_player_status> player_text = <player_text>
		change structurename = <other_player_status> lefthanded_button_ups = (1 + $<other_player_status>.lefthanded_button_ups * -1)
		change structurename = <other_player_status> lefty_notes = -1
		break
	endif
	wait \{1
		gameframe}
	repeat
	guitarevent_battleattackfinished <...>
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
	if ($<other_player_status>.player = 1)
		spawnscript gh_battlemode_player1_sfx_whammy_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	else
		spawnscript gh_battlemode_player2_sfx_whammy_start params = {holdtime = (<drain_time> / 1000.0)} id = battlemode
	endif
	if ($<other_player_status>.whammy_attack < 1)
		change structurename = <other_player_status> whammy_attack = <repair_ammount>
		whammy_on = 0
		shake_on = 0
		frame_count = 0
		shake_frequency = 1
		mask = 65536
		change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 4096
		change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 256
		change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 16
		change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		mask = 1
		change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
		update_training_whammy_bar other_player_status = <other_player_status>
		if ($<other_player_status>.is_local_client)
			begin
			if ($<other_player_status>.whammy_attack = 0)
				break
			endif
			if guitargetanalogueinfo controller = ($<other_player_status>.controller)
				if isguitarcontroller controller = ($<other_player_status>.controller)
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
					<other_player_status>.player = 2)
				getsongtimems
				if (<time> - $boss_lastwhammytime > $current_boss.whammyspeed.($current_difficulty))
					len = 0.5
					change boss_lastwhammytime = <time>
				else
					len = 0
				endif
			endif
			if (<len> >= 0.5)
				if (<whammy_on> = 0)
					change structurename = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack - 1)
					gh3_battle_play_whammy_pitch_up_sound <...>
					if ($<other_player_status>.whammy_attack <= 5)
						<shake_frequency> = (<shake_frequency> + 1)
					endif
					if (($is_network_game) && ($<other_player_status>.whammy_attack <= 5))
						sendnetmessage {type = whammy_attack_update whammy_count = ($<other_player_status>.whammy_attack)}
					endif
					<whammy_on> = 1
				endif
			else
				if (<whammy_on> = 1)
					<whammy_on> = 0
				endif
			endif
			wait \{1
				gameframe}
			repeat
		else
			net_whammy_attack player_text = <player_text> other_player_status = <other_player_status> difficulty = <difficulty>
		endif
		getarraysize \{$gem_colors}
		array_count = 0
		begin
		broken_string_id = ($broken_strings [<array_count>])
		if ($<other_player_status>.<broken_string_id> = 0)
			switch <array_count>
				case 0
				mask = 4369
				change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 1
				mask = 65809
				change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 2
				mask = 69649
				change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 3
				mask = 69889
				change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
				case 4
				mask = 69904
				change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
			endswitch
		endif
		array_count = (<array_count> + 1)
		repeat <array_size>
		change structurename = <other_player_status> whammy_attack = -1
		guitarevent_battleattackfinished <...>
	else
		if ($<other_player_status>.whammy_attack < 15)
			change structurename = <other_player_status> whammy_attack = ($<other_player_status>.whammy_attack + <repair_ammount>)
		endif
	endif
endscript

script break_string 
	color = ($gem_colors [<id>])
	if ($<other_player_status>.lefthanded_button_ups = 1)
		begin_pos = (($button_up_models.<color>.left_pos_2d) + (0.0, 40.0))
	else
		begin_pos = (($button_up_models.<color>.pos_2d) + (0.0, 40.0))
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
	if ($<other_player_status>.player = 1)
		<begin_pos> = (<begin_pos> - (230.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (230.0, 0.0))
	endif
	formattext checksumname = name 'String_break_%p' p = ($<other_player_status>.text) addtostringlookup = true
	if screenelementexists id = <name>
		destroyscreenelement id = <name>
	endif
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = battlemode_container
		material = sys_bm_snap01_sys_bm_snap01
		rgba = [200 200 200 200]
		pos = (<begin_pos>)
		scale = (1.3, 1.6)
		rot_angle = <string_rotation>
		just = [center bottom]
		z_priority = 2
	}
	if ($<other_player_status>.lefthanded_button_ups = 1)
		switch <color>
			case green
			<color> = orange
			case red
			<color> = blue
			case yellow
			<color> = yellow
			case blue
			<color> = red
			case orange
			<color> = green
		endswitch
	endif
	formattext checksumname = name_string '%s_string%p' s = ($button_up_models.<color>.name_string) p = ($<other_player_status>.text) addtostringlookup = true
	if screenelementexists id = <name_string>
		doscreenelementmorph {
			id = <name_string>
			alpha = 0
		}
	endif
	wait \{15
		gameframe}
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script repair_string 
	color = ($gem_colors [<id>])
	if ($<other_player_status>.lefthanded_button_ups = 1)
		switch <color>
			case green
			<color> = orange
			case red
			<color> = blue
			case yellow
			<color> = yellow
			case blue
			<color> = red
			case orange
			<color> = green
		endswitch
	endif
	formattext checksumname = name_string '%s_string%p' s = ($button_up_models.<color>.name_string) p = ($<other_player_status>.text) addtostringlookup = true
	if screenelementexists id = <name_string>
		doscreenelementmorph {
			id = <name_string>
			alpha = 1
		}
	endif
endscript

script battle_broken_string 
	if (($is_network_game = 1) && ($<other_player_status>.player = 1))
		if NOT gotparam \{string_to_break}
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
	victim_is_local = 1
	if ($<other_player_status>.player = 1)
		spawnscript gh_battlemode_player1_sfx_brokenstring_start params = {holdtime = <drain_time>} id = battlemode
	else
		if ($is_network_game)
			<victim_is_local> = 0
		endif
		spawnscript gh_battlemode_player2_sfx_brokenstring_start params = {holdtime = <drain_time>} id = battlemode
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
	if (($is_network_game) && ($<other_player_status>.player = 1))
		x = <string_to_break>
	else
		getarraysize \{$gem_colors}
		gem_color = 0
		non_broken_index = 0
		non_broken_strings = [-1 -1 -1 -1 -1]
		begin
		switch <gem_color>
			case 0
			if ($<other_player_status>.broken_string_green = 0)
				setarrayelement arrayname = non_broken_strings index = <non_broken_index> newvalue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 1
			if ($<other_player_status>.broken_string_red = 0)
				setarrayelement arrayname = non_broken_strings index = <non_broken_index> newvalue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 2
			if ($<other_player_status>.broken_string_yellow = 0)
				setarrayelement arrayname = non_broken_strings index = <non_broken_index> newvalue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 3
			if ($<other_player_status>.broken_string_blue = 0)
				setarrayelement arrayname = non_broken_strings index = <non_broken_index> newvalue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
			case 4
			if ($<other_player_status>.broken_string_orange = 0)
				setarrayelement arrayname = non_broken_strings index = <non_broken_index> newvalue = <gem_color>
				<non_broken_index> = (<non_broken_index> + 1)
			endif
		endswitch
		<gem_color> = (<gem_color> + 1)
		repeat <highest_value>
		if (<non_broken_index> = 0)
			getrandomvalue name = x a = 1 b = <highest_value> integer
		else
			getrandomvalue name = random_index a = 0 b = (<non_broken_index> - 1) integer
			x = ((<non_broken_strings> [<random_index>]) + 1)
		endif
	endif
	num_hammers = <repair_ammount>
	switch <x>
		case 1
		change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green + <num_hammers>)
		mask = 65536
		case 2
		change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red + <num_hammers>)
		mask = 4096
		case 3
		change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow + <num_hammers>)
		mask = 256
		case 4
		change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue + <num_hammers>)
		mask = 16
		case 5
		change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange + <num_hammers>)
		mask = 1
	endswitch
	printf "breaking string %s" s = <x>
	spawnscriptnow break_string params = {id = (<x> - 1) other_player_status = <other_player_status>}
	spawnscriptnow update_broken_button params = {id = (<x> - 1) other_player_status = <other_player_status>}
	update_broken_string_arrows id = (<x> - 1) other_player_status = <other_player_status>
	bail = 0
	if NOT ($<other_player_status>.broken_string_mask = 0)
		if ($<other_player_status>.whammy_attack < 1)
			<bail> = 1
		endif
	endif
	change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask || <mask>)
	if (<bail>)
		return
	endif
	getheldpattern controller = ($<other_player_status>.controller) nobrokenstring
	total_broken_strings = 1
	getarraysize \{$gem_colors}
	begin
	last_hold_pattern = <hold_pattern>
	getheldpattern controller = ($<other_player_status>.controller) nobrokenstring
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
						change structurename = <other_player_status> broken_string_green = ($<other_player_status>.broken_string_green - 1)
						mask = 4369
						<net_update_flags> = (<net_update_flags> || <check_button>)
						battle_sfx_repair_broken_string num_strums = ($<other_player_status>.broken_string_green) player_pan = ($<other_player_status>.player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_green = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 1
						change structurename = <other_player_status> broken_string_red = ($<other_player_status>.broken_string_red - 1)
						mask = 65809
						<net_update_flags> = (<net_update_flags> || <check_button>)
						battle_sfx_repair_broken_string num_strums = ($<other_player_status>.broken_string_red) player_pan = ($<other_player_status>.player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_red = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 2
						change structurename = <other_player_status> broken_string_yellow = ($<other_player_status>.broken_string_yellow - 1)
						mask = 69649
						<net_update_flags> = (<net_update_flags> || <check_button>)
						battle_sfx_repair_broken_string num_strums = ($<other_player_status>.broken_string_yellow) player_pan = ($<other_player_status>.player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_yellow = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 3
						change structurename = <other_player_status> broken_string_blue = ($<other_player_status>.broken_string_blue - 1)
						mask = 69889
						<net_update_flags> = (<net_update_flags> || <check_button>)
						battle_sfx_repair_broken_string num_strums = ($<other_player_status>.broken_string_blue) player_pan = ($<other_player_status>.player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_blue = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
						case 4
						change structurename = <other_player_status> broken_string_orange = ($<other_player_status>.broken_string_orange - 1)
						mask = 69904
						<net_update_flags> = (<net_update_flags> || <check_button>)
						battle_sfx_repair_broken_string num_strums = ($<other_player_status>.broken_string_orange) player_pan = ($<other_player_status>.player) difficulty = <difficulty>
						if ($<other_player_status>.broken_string_orange = 0)
							repair_string other_player_status = <other_player_status> id = <array_count>
						endif
					endswitch
					if ($<other_player_status>.<broken_string_id> = 0)
						if ($<other_player_status>.whammy_attack < 1)
							wait \{1
								gameframe}
							change structurename = <other_player_status> broken_string_mask = ($<other_player_status>.broken_string_mask && <mask>)
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
		repeat <array_size>
	endif
	if ($is_network_game)
		if NOT (<net_update_flags> = 0)
			if NOT ($<other_player_status>.highway_layout = solo_highway)
				sendnetmessage {
					type = repair_string
					flags = <net_update_flags>
				}
			endif
		endif
	endif
	if (<total_broken_strings> = 0)
		break
	endif
	if ($boss_battle = 1 &&
			<other_player_status>.player = 2)
		if ($<other_player_status>.whammy_attack < 1)
			getsongtimems
			if (<time> - $boss_lastbrokenstringtime > $current_boss.brokenstringspeed.($current_difficulty))
				change boss_pattern = ($<other_player_status>.broken_string_mask)
				change boss_lastbrokenstringtime = <time>
			else
				change \{boss_pattern = 0}
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
	if ($<other_player_status>.whammy_attack < 1)
		change structurename = <other_player_status> broken_string_mask = 0
	endif
	guitarevent_battleattackfinished <...>
endscript

script animate_lefty_flip 
	getarraysize \{$gem_colors}
	array_count = 0
	extendcrc button_up_pixel_array ($<other_player_status>.text) out = pixel_array
	begin
	color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	formattext checksumname = name_base '%s_base%p' s = ($button_up_models.<color>.name_string) p = ($<other_player_status>.text) addtostringlookup = true
	if ($<other_player_status>.lefthanded_button_ups = 1)
		start_bottom_bar_pos = ($button_up_models.<color>.left_pos_2d)
		end_bottom_bar_pos = ($button_up_models.<color>.pos_2d)
	else
		start_bottom_bar_pos = ($button_up_models.<color>.pos_2d)
		end_bottom_bar_pos = ($button_up_models.<color>.left_pos_2d)
	endif
	getscreenelementposition id = <name_base>
	bottom_bar_offset = (<end_bottom_bar_pos> - <start_bottom_bar_pos>)
	<bottom_bar_pos> = (<screenelementpos> + <bottom_bar_offset> - (<pixels> * (0.0, 1.0)))
	doscreenelementmorph {
		id = <name_base>
		pos = (<bottom_bar_pos>)
		just = [center center]
		time = 0.15
	}
	array_count = (<array_count> + 1)
	repeat <array_size>
	wait \{0.15
		seconds}
	<array_count> = 0
	begin
	color = ($gem_colors [<array_count>])
	formattext checksumname = name_base '%s_base%p' s = ($button_up_models.<color>.name_string) p = ($<other_player_status>.text) addtostringlookup = true
	doscreenelementmorph {
		id = <name_base>
		pos = (0.0, 0.0)
		just = [center center]
	}
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script update_training_whammy_bar 
	formattext checksumname = training_whammy_checksum 'training_whammy_bar_%s' s = ($<other_player_status>.player)
	formattext checksumname = training_whammy_text_checksum 'training_whammy_bar_text_%s' s = ($<other_player_status>.player)
	if screenelementexists id = <training_whammy_checksum>
		destroyscreenelement id = <training_whammy_checksum>
	endif
	if screenelementexists id = <training_whammy_text_checksum>
		destroyscreenelement id = <training_whammy_text_checksum>
	endif
	if ($<other_player_status>.player = 1)
		player_offset = (0.0, 0.0)
	else
		player_offset = (450.0, 0.0)
	endif
	training_whammy_pos = ((610.0, 700.0) + <player_offset>)
	training_whammy_angle = -25
	createscreenelement {
		type = spriteelement
		id = <training_whammy_checksum>
		parent = battlemode_container
		texture = battle_hud_whammy_bar
		rgba = [255 255 255 255]
		pos = <training_whammy_pos>
		rot_angle = <training_whammy_angle>
		scale = 0.8
		alpha = 1
		just = [center bottom]
		z_priority = 6
	}
	createscreenelement {
		type = textelement
		parent = <training_whammy_checksum>
		id = <training_whammy_text_checksum>
		pos = (120.0, 145.0)
		text = "WHAMMY"
		rot_angle = 53
		font = text_a4
		rgba = [255 255 255 255]
		just = [center bottom]
		scale = 1.2
		z_priority = 7
	}
	spawnscriptnow animate_whammy_bar params = {id = <training_whammy_checksum> other_player_status = <other_player_status> training_whammy_pos = <training_whammy_pos> training_whammy_angle = <training_whammy_angle>}
endscript

script animate_whammy_bar 
	pulse_on = 0
	begin
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	formattext checksumname = name_base '%s_base%p' s = ($button_up_models.<color>.name_string) p = ($<other_player_status>.text) addtostringlookup = true
	original_bottom_bar_pos = (0.0, 0.0)
	bottom_bar_pos = (<original_bottom_bar_pos> - ((0.0, 15.0) * ($<other_player_status>.whammy_attack)))
	if NOT ($<other_player_status>.whammy_attack < 1)
		if (<pulse_on> = 0)
			doscreenelementmorph {
				id = <name_base>
				alpha = 0.5
				pos = (<bottom_bar_pos> + (0.0, 5.0))
				just = [center center]
				time = 0.15
			}
		else
			doscreenelementmorph {
				id = <name_base>
				alpha = 0.5
				pos = (<bottom_bar_pos> - (0.0, 5.0))
				just = [center center]
				time = 0.15
			}
		endif
	else
		doscreenelementmorph {
			id = <name_base>
			alpha = 1
			pos = (<original_bottom_bar_pos> + (0.0, 30.0))
			just = [center center]
			time = 0.15
		}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	training_whammy_pos_new = (<training_whammy_pos> - ((0.0, 15.0) * ($<other_player_status>.whammy_attack)))
	doscreenelementmorph {
		id = <id>
		pos = <training_whammy_pos_new>
		time = 0.15
	}
	if NOT ($<other_player_status>.whammy_attack < 1)
		if (<pulse_on> = 0)
			doscreenelementmorph {
				id = <id>
				rot_angle = (<training_whammy_angle> - 20)
				just = [center bottom]
				time = 0.15
			}
			<pulse_on> = 1
		else
			doscreenelementmorph {
				id = <id>
				rot_angle = <training_whammy_angle>
				just = [center bottom]
				time = 0.15
			}
			<pulse_on> = 0
		endif
	else
		doscreenelementmorph {
			id = <id>
			rot_angle = <training_whammy_angle>
			just = [center bottom]
			alpha = 0
			time = 0.3
		}
		wait \{0.15
			seconds}
		getarraysize \{$gem_colors}
		array_count = 0
		begin
		color = ($gem_colors [<array_count>])
		formattext checksumname = name_base '%s_base%p' s = ($button_up_models.<color>.name_string) p = ($<other_player_status>.text) addtostringlookup = true
		doscreenelementmorph {
			id = <name_base>
			alpha = 1
			pos = <original_bottom_bar_pos>
			just = [center center]
			time = 0.1
		}
		array_count = (<array_count> + 1)
		repeat <array_size>
		break
	endif
	wait \{0.15
		seconds}
	repeat
endscript

script update_broken_button 
	broken_string_id = ($broken_strings [<id>])
	color = ($gem_colors [<id>])
	button_up_name = ($button_up_models.<color>.name)
	extendcrc button_up_pixel_array ($<other_player_status>.text) out = pixel_array
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
	setarrayelement arrayname = <pixel_array> globalarray index = <id> newvalue = <up_pixels>
	wait \{1
		gameframe}
	repeat
endscript

script update_broken_string_arrows 
	broken_string_id = ($broken_strings [<id>])
	string_id = <id>
	formattext checksumname = arrow_checksum 'broken_string_arrow_%i_%s' i = <id> s = ($<other_player_status>.player)
	formattext checksumname = text_checksum 'broken_string_text_%i_%s' i = <id> s = ($<other_player_status>.player)
	if screenelementexists id = <arrow_checksum>
		destroyscreenelement id = <arrow_checksum>
	endif
	if screenelementexists id = <text_checksum>
		destroyscreenelement id = <text_checksum>
	endif
	formattext checksumname = container_id 'gem_container%p' p = ($<other_player_status>.text) addtostringlookup = true
	color = ($gem_colors [<id>])
	arrow_pos = (($button_up_models.<color>.pos_2d) - (0.0, 30.0))
	lefty_arrow_pos = (($button_up_models.<color>.left_pos_2d) - (0.0, 30.0))
	if ($<other_player_status>.player = 1)
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
	createscreenelement {
		type = spriteelement
		id = <arrow_checksum>
		parent = battlemode_container
		texture = battle_hud_arrow
		rgba = [255 255 255 255]
		pos = <start_pos>
		alpha = 1
		scale = 0.3
		just = [center bottom]
		z_priority = 7
	}
	getscreenelementdims id = <arrow_checksum>
	x_offset = (<width> / 2)
	createscreenelement {
		type = textelement
		parent = <arrow_checksum>
		id = <text_checksum>
		pos = ((53.0, 150.0) + (<x_offset> * (1.0, 0.0)))
		text = "PUSH"
		font = text_a4
		rgba = [255 255 255 255]
		just = [center bottom]
		scale = 2
		z_priority = 8
	}
	spawnscriptnow animate_arrow params = {broken_string_id = <broken_string_id> string_id = <string_id> arrow_id = <arrow_checksum> other_player_status = <other_player_status> broken_string_id = <broken_string_id> arrow_pos = <arrow_pos> lefty_arrow_pos = <lefty_arrow_pos>}
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
			if screenelementexists id = <arrow_id>
				doscreenelementmorph {
					id = <arrow_id>
					pos = (<animate_pos> - (0.0, 10.0))
					just = [center bottom]
					time = 0.1
				}
			endif
			wait \{0.1
				seconds}
			<pulse_on> = 1
		else
			if screenelementexists id = <arrow_id>
				doscreenelementmorph {
					id = <arrow_id>
					pos = <animate_pos>
					just = [center bottom]
					time = 0.1
				}
			endif
			wait \{0.1
				seconds}
			<pulse_on> = 0
		endif
		<frame_count> = 0
	else
		if screenelementexists id = <arrow_id>
			doscreenelementmorph {
				id = <arrow_id>
				pos = <animate_pos>
				just = [center bottom]
				alpha = 0
				time = 0.3
			}
		endif
		wait \{0.3
			seconds}
		if screenelementexists id = <arrow_id>
			destroyscreenelement id = <arrow_id>
		endif
		break
	endif
	wait \{1
		gameframes}
	repeat
endscript

script create_battlemode_highway_effects 
	player = 1
	begin
	if (<player> = 1)
		player_text = 'p1'
	else
		player_text = 'p2'
	endif
	lpos = (($sidebar_x * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	langle = ($sidebar_angle)
	rpos = ((((640.0 - $sidebar_x) + 640.0) * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle))
	scale = (($sidebar_x_scale * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	rscale = (((0 - $sidebar_x_scale) * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	formattext checksumname = cont 'battle_sidebar_container_left%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		destroyscreenelement id = <cont>
	endif
	createscreenelement {
		type = containerelement
		id = <cont>
		parent = <container_id>
		pos = <lpos>
		rot_angle = <langle>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((-55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'battle_sidebar_left_glow%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_starpower_sdglow_sys_starpower_sdglow
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'battle_sidebar_left_Lightning01%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_big_bolt01_sys_big_bolt01
		rgba = [0 0 128 128]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 0
	}
	formattext checksumname = cont 'battle_sidebar_container_right%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		destroyscreenelement id = <cont>
	endif
	createscreenelement {
		type = containerelement
		id = <cont>
		parent = <container_id>
		pos = <rpos>
		rot_angle = <rangle>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'battle_sidebar_Right_glow%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_starpower_sdglow_sys_starpower_sdglow
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'battle_sidebar_Right_Lightning01%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_big_bolt01_sys_big_bolt01
		rgba = [0 0 128 128]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 0
	}
	player = (<player> + 1)
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

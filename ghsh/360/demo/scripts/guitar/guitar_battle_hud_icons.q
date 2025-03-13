battle_alert_icons_created = 0
battle_alert_icon_pos_off_1 = (-48.0, -40.0)
battle_alert_icon_pos_off_2 = (0.0, -40.0)
battle_alert_icon_pos_off_3 = (48.0, -40.0)
battle_alert_icon_pos_off_4 = (-24.0, -40.0)
battle_alert_icon_pos_off_5 = (24.0, -40.0)

script create_battle_alert_frames 
	if ($battle_alert_icons_created = 1)
		return
	endif
	change \{battle_alert_icons_created = 1}
	i = 1
	begin
	formattext textname = player_text 'p%d' d = <i>
	extendcrc battle_alert_container <player_text> out = battle_alert_container_id
	if screenelementexists id = <battle_alert_container_id>
		return
	endif
	generate_pos_table player = <i>
	if (<i> = 1)
		player_x = (640.0 - $x_offset_p2)
	else
		player_x = (640.0 + $x_offset_p2)
	endif
	pos_table = ($highway_pos_table [(<i> -1)])
	y = (((<pos_table>.highway_playline) - (<pos_table>.highway_height)) - 48)
	alert_pos = (<player_x> * (1.0, 0.0) + <y> * (0.0, 1.0))
	createscreenelement {
		type = containerelement
		parent = battlemode_container
		id = <battle_alert_container_id>
		pos = <alert_pos>
		z_priority = 49
	}
	parent_container = <id>
	extendcrc ba_icon_frame_container <player_text> out = new_container_id
	createscreenelement {
		type = containerelement
		parent = <parent_container>
		id = <new_container_id>
		alpha = 0
	}
	<parent_container> = <id>
	extendcrc ba_icon_frame_left <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <parent_container>
		id = <new_container_id>
		texture = battle_alert_frame_end
		pos = (-48.0, 0.0)
		dims = (32.0, 72.0)
		just = [right center]
		flip_v
	}
	extendcrc ba_icon_frame_middle <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <parent_container>
		id = <new_container_id>
		texture = battle_alert_frame_middle
		pos = (0.0, 0.0)
		dims = (32.0, 72.0)
		just = [center center]
	}
	extendcrc ba_icon_frame_right <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <parent_container>
		id = <new_container_id>
		texture = battle_alert_frame_end
		dims = (32.0, 72.0)
		pos = (48.0, 0.0)
		just = [left center]
	}
	extendcrc ba_icon_fill_single <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = battle_alert_fill_single
		pos = (0.0, 0.0)
		dims = (128.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_icon_fill_hard_double <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = `battle_alert_fill_hard-double`
		pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_icon_fill_hard_lefty <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = `battle_alert_fill_hard-lefty`
		pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_icon_fill_double_lefty <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = `battle_alert_fill_double-lefty`
		pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_icon_fill_triple <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = battle_alert_fill_triple
		pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_alert_star_1 <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = battle_alert_star_1
		pos = (0.0, -52.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_alert_star_2 <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = battle_alert_star_2
		pos = (0.0, -52.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_alert_star_3 <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = battle_alert_star_3
		pos = (0.0, -52.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_alert_icon_1 <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = icon_attack_difficulty
		dims = (40.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_alert_icon_2 <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = icon_attack_addnote
		dims = (40.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc ba_alert_icon_3 <player_text> out = new_container_id
	createscreenelement {
		type = spriteelement
		parent = <battle_alert_container_id>
		id = <new_container_id>
		texture = icon_attack_leftyrighty
		dims = (40.0, 40.0)
		just = [center center]
		alpha = 0
	}
	extendcrc battle_alert_text <player_text> out = battle_alert_text_id
	displaytext {
		id = <battle_alert_text_id>
		parent = <battle_alert_container_id>
		text = <battle_text>
		font = fontgrid_denim_title
		z = 52
		scale = 0.5
		pos = (1.5, 2.5)
		just = [center center]
		rgba = [100 0 0 255]
		noshadow
	}
	<i> = (<i> + 1)
	repeat 2
endscript

script destroy_battle_alert_frames 
	change \{battle_alert_icons_created = 0}
	if screenelementexists \{id = battle_alert_containerp1}
		destroyscreenelement \{id = battle_alert_containerp1}
	endif
	if screenelementexists \{id = battle_alert_containerp2}
		destroyscreenelement \{id = battle_alert_containerp2}
	endif
endscript

script scale_battle_alert_frame \{player = 1
		new_scale = 3
		time = 0.3}
	formattext textname = player_text 'p%d' d = <player>
	new_pos = (<new_scale> * (16.0, 0.0))
	extendcrc ba_icon_frame_left <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> pos = (-1 * <new_pos>) time = <time>
	endif
	extendcrc ba_icon_frame_middle <player_text> out = new_id
	if screenelementexists id = <new_id>
		getscreenelementprops id = <new_id>
		legacydoscreenelementmorph id = <new_id> scale = ((<new_scale> * (1.0, 0.0)) + (0.0, 1.0)) time = <time> relative_scale
	endif
	extendcrc ba_icon_frame_right <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> pos = <new_pos> time = <time>
	endif
endscript

script update_battle_alert_icon \{player_status = player1_status}
	formattext textname = player_text 'p%d' d = ($<player_status>.player)
	extendcrc battle_alert_container <player_text> out = battle_alert_container_id
	formattext textname = underscore_player '_p%d' d = ($<player_status>.player)
	extendcrc battle_icons <underscore_player> out = player_icons
	battle_text = qs(0x03ac90f0)
	num_icons = 0
	lefty = 0
	harder = 0
	double = 0
	if NOT ($<player_status>.diffup_notes < 1)
		<battle_text> = qs(0x99ed6c3c)
		if ($<player_status>.player = 1)
			current_diff = ($player1_status.difficulty)
		else
			current_diff = ($player2_status.difficulty)
		endif
		switch (<current_diff>)
			case easy
			<battle_text> = qs(0x71fd8268)
			case medium
			<battle_text> = qs(0xb49b509a)
		endswitch
		<num_icons> = (<num_icons> + 1)
		<harder> = 1
	endif
	if NOT ($<player_status>.double_notes < 1)
		<battle_text> = (<battle_text> + qs(0x41f71875))
		<num_icons> = (<num_icons> + 1)
		<double> = 1
	endif
	if NOT ($<player_status>.lefty_notes < 1)
		if ($<player_status>.lefty_attack_name = 0)
			<battle_text> = (<battle_text> + qs(0x0f992bb7))
		else
			<battle_text> = (<battle_text> + qs(0xd980ec74))
		endif
		<num_icons> = (<num_icons> + 1)
		<lefty> = 1
	endif
	if (<num_icons> = 1)
		text_scale = (0.4, 0.75)
		fit_dims = (43.0, 25.0)
		width_max = 100
	elseif (<num_icons> = 2)
		text_scale = (0.35000002, 0.75)
		fit_dims = (60.0, 25.0)
		width_max = 150
	elseif (<num_icons> = 3)
		text_scale = (0.32500002, 0.75)
		fit_dims = (75.0, 25.0)
		width_max = 250
	endif
	extendcrc battle_alert_text <player_text> out = battle_alert_text_id
	if screenelementexists id = <battle_alert_text_id>
		setscreenelementprops id = <battle_alert_text_id> text = <battle_text> scale = <text_scale>
		if NOT (<num_icons> = 0)
			getscreenelementdims id = <battle_alert_text_id>
			if (<width> > <width_max>)
				fit_text_in_rectangle id = <battle_alert_text_id> dims = <fit_dims>
			endif
		endif
	endif
	frame_scale = 0
	if (<num_icons> = 0)
		reset_all_battle_bgs player_text = <player_text>
		alpha_in_or_out_battle_hud player_text = <player_text> alpha = 0
		extendcrc ba_icon_fill_single <player_text> out = new_id
		if screenelementexists id = <new_id>
			legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
		endif
	elseif (<num_icons> = 1)
		reset_all_battle_bgs player_text = <player_text>
		alpha_in_or_out_battle_hud player_text = <player_text> alpha = 1
		frame_scale = 3
		extendcrc ba_icon_fill_single <player_text> out = new_id
		if screenelementexists id = <new_id>
			legacydoscreenelementmorph id = <new_id> alpha = 1 time = 0.3 scale = (1.2, 1.0) relative_scale
			if (<lefty>)
				change_battle_alert_icon player_text = <player_text> num = 2 tex = icon_attack_leftyrighty pos = battle_alert_icon_pos_off_2
				setscreenelementprops id = <new_id> rgba = [55 170 130 255]
			elseif (<double>)
				change_battle_alert_icon num = 2 player_text = <player_text> tex = icon_attack_addnote pos = battle_alert_icon_pos_off_2
				setscreenelementprops id = <new_id> rgba = [133 76 55 255]
			elseif (<harder>)
				change_battle_alert_icon num = 2 player_text = <player_text> tex = icon_attack_difficulty pos = battle_alert_icon_pos_off_2
				setscreenelementprops id = <new_id> rgba = [210 210 210 255]
			endif
		endif
	elseif (<num_icons> >= 2)
		if (<num_icons> = 3)
			frame_scale = 7
		else
			frame_scale = 5
		endif
		reset_all_battle_bgs player_text = <player_text>
		extendcrc ba_icon_fill_single <player_text> out = new_id
		if screenelementexists id = <new_id>
			legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
		endif
		if (<lefty>)
			if (<harder>)
				if (<double>)
					change_battle_alert_back player_text = <player_text> bg = ba_icon_fill_triple scale = (1.0, 1.0)
					change_battle_alert_icon num = 1 player_text = <player_text> tex = icon_attack_difficulty pos = battle_alert_icon_pos_off_1
					change_battle_alert_icon num = 2 player_text = <player_text> tex = icon_attack_addnote pos = battle_alert_icon_pos_off_2
					change_battle_alert_icon num = 3 player_text = <player_text> tex = icon_attack_leftyrighty pos = battle_alert_icon_pos_off_3
				else
					change_battle_alert_back player_text = <player_text> bg = ba_icon_fill_hard_lefty scale = (1.1, 1.0)
					change_battle_alert_icon num = 1 player_text = <player_text> tex = icon_attack_difficulty pos = battle_alert_icon_pos_off_4
					change_battle_alert_icon num = 3 player_text = <player_text> tex = icon_attack_leftyrighty pos = battle_alert_icon_pos_off_5
				endif
			else
				change_battle_alert_back player_text = <player_text> bg = ba_icon_fill_double_lefty scale = (1.1, 1.0)
				change_battle_alert_icon num = 2 player_text = <player_text> tex = icon_attack_addnote pos = battle_alert_icon_pos_off_4
				change_battle_alert_icon num = 3 player_text = <player_text> tex = icon_attack_leftyrighty pos = battle_alert_icon_pos_off_5
			endif
		else
			change_battle_alert_back player_text = <player_text> bg = ba_icon_fill_hard_double scale = (1.1, 1.0)
			change_battle_alert_icon num = 1 player_text = <player_text> tex = icon_attack_difficulty pos = battle_alert_icon_pos_off_4
			change_battle_alert_icon num = 2 player_text = <player_text> tex = icon_attack_addnote pos = battle_alert_icon_pos_off_5
		endif
	endif
	if (<num_icons>)
		formattext checksumname = ba_alert_holder 'ba_alert_star_%d' d = <num_icons>
		extendcrc <ba_alert_holder> <player_text> out = new_id
		if screenelementexists id = <new_id>
			legacydoscreenelementmorph id = <new_id> alpha = 1 time = 0.3
		endif
	endif
	if (<frame_scale>)
		scale_battle_alert_frame player = ($<player_status>.player) new_scale = <frame_scale>
	endif
endscript

script change_battle_alert_icon 
	formattext checksumname = icon_pos 'ba_alert_icon_%d' d = <num>
	extendcrc <icon_pos> <player_text> out = icon_id
	if screenelementexists id = <icon_id>
		setscreenelementprops id = <icon_id> texture = <tex> pos = ($<pos>)
		legacydoscreenelementmorph id = <icon_id> alpha = 1 time = 0.3
	endif
endscript

script change_battle_alert_back 
	extendcrc <bg> <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 1 time = 0.3 scale = <scale> relative_scale
	endif
endscript

script reset_all_battle_bgs 
	extendcrc ba_icon_fill_hard_double <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	extendcrc ba_icon_fill_hard_double <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	extendcrc ba_icon_fill_double_lefty <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	extendcrc ba_icon_fill_hard_lefty <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	extendcrc ba_icon_fill_triple <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	i = 1
	begin
	formattext checksumname = num 'ba_alert_star_%d' d = <i>
	extendcrc <num> <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	formattext checksumname = num 'ba_alert_icon_%d' d = <i>
	extendcrc <num> <player_text> out = new_id
	if screenelementexists id = <new_id>
		legacydoscreenelementmorph id = <new_id> alpha = 0 time = 0.3
	endif
	<i> = (<i> + 1)
	repeat 3
endscript

script alpha_in_or_out_battle_hud \{alpha = 1}
	extendcrc ba_icon_frame_container <player_text> out = new_container_id
	if screenelementexists id = <new_container_id>
		legacydoscreenelementmorph id = <new_container_id> alpha = <alpha> time = 0.3
	endif
endscript

script update_hud_lefty_notes 
	update_battle_alert_icon player_status = <other_player_status>
	spawnscriptnow remove_hud_lefty_notes params = {other_player_status = <other_player_status>}
endscript

script addallattacks1 
	change \{structurename = player2_status
		lefty_notes = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script addallattacks2 
	change \{structurename = player2_status
		double_notes = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script addallattacks3 
	change \{structurename = player2_status
		diffup_notes = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script addallattacks4 
	change \{structurename = player2_status
		mine_attack = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks1 
	change \{structurename = player2_status
		lefty_notes = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks2 
	change \{structurename = player2_status
		double_notes = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks3 
	change \{structurename = player2_status
		diffup_notes = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks4 
	change \{structurename = player2_status
		mine_attack = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script remove_hud_lefty_notes 
	begin
	if ($<other_player_status>.lefty_notes < 1)
		break
	endif
	wait \{30
		frames}
	repeat
	update_battle_alert_icon player_status = <other_player_status>
endscript

script update_hud_difficulty_up 
	update_battle_alert_icon player_status = <other_player_status>
	spawnscriptnow remove_hud_difficulty_up params = {other_player_status = <other_player_status>}
endscript

script remove_hud_difficulty_up 
	begin
	if ($<other_player_status>.diffup_notes < 1)
		break
	endif
	wait \{30
		frames}
	repeat
	update_battle_alert_icon player_status = <other_player_status>
endscript

script update_hud_double_notes 
	update_battle_alert_icon player_status = <other_player_status>
	spawnscriptnow remove_hud_double_notes params = {other_player_status = <other_player_status>}
endscript

script remove_hud_double_notes 
	begin
	if ($<other_player_status>.double_notes < 1)
		break
	endif
	wait \{30
		frames}
	repeat
	update_battle_alert_icon player_status = <other_player_status>
endscript

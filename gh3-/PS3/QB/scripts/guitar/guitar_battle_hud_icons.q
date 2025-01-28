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
	Change \{battle_alert_icons_created = 1}
	I = 1
	begin
	FormatText TextName = player_Text 'p%d' D = <I>
	ExtendCRC battle_alert_container <player_Text> out = battle_alert_container_id
	if ScreenElementExists Id = <battle_alert_container_id>
		return
	endif
	if (<I> = 1)
		player_x = (640.0 - $x_offset_p2)
	else
		player_x = (640.0 + $x_offset_p2)
	endif
	Y = (($highway_playline - $highway_height) - 48)
	alert_pos = (<player_x> * (1.0, 0.0) + <Y> * (0.0, 1.0))
	CreateScreenElement {
		Type = ContainerElement
		PARENT = battlemode_container
		Id = <battle_alert_container_id>
		Pos = <alert_pos>
		z_priority = 49
	}
	parent_container = <Id>
	ExtendCRC ba_icon_frame_container <player_Text> out = new_container_id
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <parent_container>
		Id = <new_container_id>
		Alpha = 0
	}
	<parent_container> = <Id>
	ExtendCRC ba_icon_frame_left <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_container>
		Id = <new_container_id>
		texture = battle_alert_frame_end
		Pos = (-48.0, 0.0)
		Dims = (32.0, 72.0)
		just = [RIGHT Center]
		flip_v
	}
	ExtendCRC ba_icon_frame_middle <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_container>
		Id = <new_container_id>
		texture = battle_alert_frame_middle
		Pos = (0.0, 0.0)
		Dims = (32.0, 72.0)
		just = [Center Center]
	}
	ExtendCRC ba_icon_frame_right <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_container>
		Id = <new_container_id>
		texture = battle_alert_frame_end
		Dims = (32.0, 72.0)
		Pos = (48.0, 0.0)
		just = [LEFT Center]
	}
	ExtendCRC ba_icon_fill_single <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_fill_single
		Pos = (0.0, 0.0)
		Dims = (128.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_icon_fill_hard_double <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_fill_hard_double
		Pos = (0.0, 0.0)
		Dims = (256.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_icon_fill_hard_lefty <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_fill_hard_lefty
		Pos = (0.0, 0.0)
		Dims = (256.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_icon_fill_double_lefty <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_fill_double_lefty
		Pos = (0.0, 0.0)
		Dims = (256.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_icon_fill_triple <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_fill_triple
		Pos = (0.0, 0.0)
		Dims = (256.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_alert_star_1 <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_star_1
		Pos = (0.0, -52.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_alert_star_2 <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_star_2
		Pos = (0.0, -52.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_alert_star_3 <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = battle_alert_star_3
		Pos = (0.0, -52.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_alert_icon_1 <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = icon_attack_difficulty
		Dims = (40.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_alert_icon_2 <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = icon_attack_addnote
		Dims = (40.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC ba_alert_icon_3 <player_Text> out = new_container_id
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <battle_alert_container_id>
		Id = <new_container_id>
		texture = icon_attack_leftyrighty
		Dims = (40.0, 40.0)
		just = [Center Center]
		Alpha = 0
	}
	ExtendCRC battle_alert_text <player_Text> out = battle_alert_text_id
	displayText {
		Id = <battle_alert_text_id>
		PARENT = <battle_alert_container_id>
		Text = <battle_text>
		font = text_a6
		Z = 52
		Scale = 0.5
		Pos = (1.5, 2.5)
		just = [Center Center]
		rgba = [100 0 0 255]
		noshadow
	}
	<I> = (<I> + 1)
	repeat 2
endscript

script destroy_battle_alert_frames 
	Change \{battle_alert_icons_created = 0}
	if ScreenElementExists \{Id = battle_alert_containerp1}
		DestroyScreenElement \{Id = battle_alert_containerp1}
	endif
	if ScreenElementExists \{Id = battle_alert_containerp2}
		DestroyScreenElement \{Id = battle_alert_containerp2}
	endif
endscript

script scale_battle_alert_frame \{Player = 1
		new_scale = 3
		Time = 0.3}
	FormatText TextName = player_Text 'p%d' D = <Player>
	new_pos = (<new_scale> * (16.0, 0.0))
	ExtendCRC ba_icon_frame_left <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Pos = (-1 * <new_pos>) Time = <Time>
	endif
	ExtendCRC ba_icon_frame_middle <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		GetScreenElementProps Id = <new_id>
		DoScreenElementMorph Id = <new_id> Scale = ((<new_scale> * (1.0, 0.0)) + (0.0, 1.0)) Time = <Time> relative_scale
	endif
	ExtendCRC ba_icon_frame_right <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Pos = <new_pos> Time = <Time>
	endif
endscript

script update_battle_alert_icon \{player_status = player1_status}
	FormatText TextName = player_Text 'p%d' D = ($<player_status>.Player)
	ExtendCRC battle_alert_container <player_Text> out = battle_alert_container_id
	FormatText TextName = underscore_player '_p%d' D = ($<player_status>.Player)
	ExtendCRC battle_icons <underscore_player> out = player_icons
	battle_text = ""
	num_icons = 0
	Lefty = 0
	harder = 0
	double = 0
	if NOT ($<player_status>.diffup_notes < 1)
		<battle_text> = "EXPERT "
		if ($<player_status>.Player = 1)
			current_diff = $current_difficulty
		else
			current_diff = $current_difficulty2
		endif
		switch (<current_diff>)
			case EASY
			<battle_text> = "MEDIUM "
			case MEDIUM
			<battle_text> = "HARD "
		endswitch
		<num_icons> = (<num_icons> + 1)
		<harder> = 1
	endif
	if NOT ($<player_status>.double_notes < 1)
		<battle_text> = (<battle_text> + "DOUBLE ")
		<num_icons> = (<num_icons> + 1)
		<double> = 1
	endif
	GetGlobalTags \{user_options}
	<is_lefty_flip> = 0
	if ($<player_status>.Player = 1)
		<is_lefty_flip> = <lefty_flip_p1>
	else
		<is_lefty_flip> = <lefty_flip_p2>
	endif
	if NOT ($<player_status>.lefty_notes < 1)
		if (<is_lefty_flip>)
			<battle_text> = (<battle_text> + "RIGHTY")
		else
			<battle_text> = (<battle_text> + "LEFTY")
		endif
		<num_icons> = (<num_icons> + 1)
		<Lefty> = 1
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
	ExtendCRC battle_alert_text <player_Text> out = battle_alert_text_id
	if ScreenElementExists Id = <battle_alert_text_id>
		SetScreenElementProps Id = <battle_alert_text_id> Text = <battle_text> Scale = <text_scale>
		if NOT (<num_icons> = 0)
			GetScreenElementDims Id = <battle_alert_text_id>
			if (<width> > <width_max>)
				fit_text_in_rectangle Id = <battle_alert_text_id> Dims = <fit_dims>
			endif
		endif
	endif
	frame_scale = 0
	if (<num_icons> = 0)
		reset_all_battle_bgs player_Text = <player_Text>
		alpha_in_or_out_battle_hud player_Text = <player_Text> Alpha = 0
		ExtendCRC ba_icon_fill_single <player_Text> out = new_id
		if ScreenElementExists Id = <new_id>
			DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
		endif
	elseif (<num_icons> = 1)
		reset_all_battle_bgs player_Text = <player_Text>
		alpha_in_or_out_battle_hud player_Text = <player_Text> Alpha = 1
		frame_scale = 3
		ExtendCRC ba_icon_fill_single <player_Text> out = new_id
		if ScreenElementExists Id = <new_id>
			DoScreenElementMorph Id = <new_id> Alpha = 1 Time = 0.3 Scale = (1.2, 1.0) relative_scale
			if (<Lefty>)
				change_battle_alert_icon player_Text = <player_Text> num = 2 tex = icon_attack_leftyrighty Pos = battle_alert_icon_pos_off_2
				SetScreenElementProps Id = <new_id> rgba = [55 170 130 255]
			elseif (<double>)
				change_battle_alert_icon num = 2 player_Text = <player_Text> tex = icon_attack_addnote Pos = battle_alert_icon_pos_off_2
				SetScreenElementProps Id = <new_id> rgba = [200 115 200 255]
			elseif (<harder>)
				change_battle_alert_icon num = 2 player_Text = <player_Text> tex = icon_attack_difficulty Pos = battle_alert_icon_pos_off_2
				SetScreenElementProps Id = <new_id> rgba = [210 210 210 255]
			endif
		endif
	elseif (<num_icons> >= 2)
		if (<num_icons> = 3)
			frame_scale = 7
		else
			frame_scale = 5
		endif
		reset_all_battle_bgs player_Text = <player_Text>
		ExtendCRC ba_icon_fill_single <player_Text> out = new_id
		if ScreenElementExists Id = <new_id>
			DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
		endif
		if (<Lefty>)
			if (<harder>)
				if (<double>)
					change_battle_alert_back player_Text = <player_Text> BG = ba_icon_fill_triple Scale = (1.0, 1.0)
					change_battle_alert_icon num = 1 player_Text = <player_Text> tex = icon_attack_difficulty Pos = battle_alert_icon_pos_off_1
					change_battle_alert_icon num = 2 player_Text = <player_Text> tex = icon_attack_addnote Pos = battle_alert_icon_pos_off_2
					change_battle_alert_icon num = 3 player_Text = <player_Text> tex = icon_attack_leftyrighty Pos = battle_alert_icon_pos_off_3
				else
					change_battle_alert_back player_Text = <player_Text> BG = ba_icon_fill_hard_lefty Scale = (1.1, 1.0)
					change_battle_alert_icon num = 1 player_Text = <player_Text> tex = icon_attack_difficulty Pos = battle_alert_icon_pos_off_4
					change_battle_alert_icon num = 3 player_Text = <player_Text> tex = icon_attack_leftyrighty Pos = battle_alert_icon_pos_off_5
				endif
			else
				change_battle_alert_back player_Text = <player_Text> BG = ba_icon_fill_double_lefty Scale = (1.1, 1.0)
				change_battle_alert_icon num = 2 player_Text = <player_Text> tex = icon_attack_addnote Pos = battle_alert_icon_pos_off_4
				change_battle_alert_icon num = 3 player_Text = <player_Text> tex = icon_attack_leftyrighty Pos = battle_alert_icon_pos_off_5
			endif
		else
			change_battle_alert_back player_Text = <player_Text> BG = ba_icon_fill_hard_double Scale = (1.1, 1.0)
			change_battle_alert_icon num = 1 player_Text = <player_Text> tex = icon_attack_difficulty Pos = battle_alert_icon_pos_off_4
			change_battle_alert_icon num = 2 player_Text = <player_Text> tex = icon_attack_addnote Pos = battle_alert_icon_pos_off_5
		endif
	endif
	if (<num_icons>)
		FormatText ChecksumName = ba_alert_holder 'ba_alert_star_%d' D = <num_icons>
		ExtendCRC <ba_alert_holder> <player_Text> out = new_id
		if ScreenElementExists Id = <new_id>
			DoScreenElementMorph Id = <new_id> Alpha = 1 Time = 0.3
		endif
	endif
	if (<frame_scale>)
		scale_battle_alert_frame Player = ($<player_status>.Player) new_scale = <frame_scale>
	endif
endscript

script change_battle_alert_icon 
	FormatText ChecksumName = icon_pos 'ba_alert_icon_%d' D = <num>
	ExtendCRC <icon_pos> <player_Text> out = icon_id
	if ScreenElementExists Id = <icon_id>
		SetScreenElementProps Id = <icon_id> texture = <tex> Pos = ($<Pos>)
		DoScreenElementMorph Id = <icon_id> Alpha = 1 Time = 0.3
	endif
endscript

script change_battle_alert_back 
	ExtendCRC <BG> <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 1 Time = 0.3 Scale = <Scale> relative_scale
	endif
endscript

script reset_all_battle_bgs 
	ExtendCRC ba_icon_fill_hard_double <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	ExtendCRC ba_icon_fill_hard_double <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	ExtendCRC ba_icon_fill_double_lefty <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	ExtendCRC ba_icon_fill_hard_lefty <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	ExtendCRC ba_icon_fill_triple <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	I = 1
	begin
	FormatText ChecksumName = num 'ba_alert_star_%d' D = <I>
	ExtendCRC <num> <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	FormatText ChecksumName = num 'ba_alert_icon_%d' D = <I>
	ExtendCRC <num> <player_Text> out = new_id
	if ScreenElementExists Id = <new_id>
		DoScreenElementMorph Id = <new_id> Alpha = 0 Time = 0.3
	endif
	<I> = (<I> + 1)
	repeat 3
endscript

script alpha_in_or_out_battle_hud \{Alpha = 1}
	ExtendCRC ba_icon_frame_container <player_Text> out = new_container_id
	if ScreenElementExists Id = <new_container_id>
		DoScreenElementMorph Id = <new_container_id> Alpha = <Alpha> Time = 0.3
	endif
endscript

script update_hud_lefty_notes 
	update_battle_alert_icon player_status = <other_player_status>
	SpawnScriptNow remove_hud_lefty_notes Params = {other_player_status = <other_player_status>}
endscript

script addallattacks1 
	Change \{StructureName = player2_status
		lefty_notes = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script addallattacks2 
	Change \{StructureName = player2_status
		double_notes = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script addallattacks3 
	Change \{StructureName = player2_status
		diffup_notes = 50}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks1 
	Change \{StructureName = player2_status
		lefty_notes = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks2 
	Change \{StructureName = player2_status
		double_notes = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script suballattacks3 
	Change \{StructureName = player2_status
		diffup_notes = 0}
	update_battle_alert_icon \{player_status = player2_status}
endscript

script remove_hud_lefty_notes 
	begin
	if ($<other_player_status>.lefty_notes < 1)
		break
	endif
	Wait \{30
		frames}
	repeat
	update_battle_alert_icon player_status = <other_player_status>
endscript

script update_hud_difficulty_up 
	update_battle_alert_icon player_status = <other_player_status>
	SpawnScriptNow remove_hud_difficulty_up Params = {other_player_status = <other_player_status>}
endscript

script remove_hud_difficulty_up 
	begin
	if ($<other_player_status>.diffup_notes < 1)
		break
	endif
	Wait \{30
		frames}
	repeat
	update_battle_alert_icon player_status = <other_player_status>
endscript

script update_hud_double_notes 
	update_battle_alert_icon player_status = <other_player_status>
	SpawnScriptNow remove_hud_double_notes Params = {other_player_status = <other_player_status>}
endscript

script remove_hud_double_notes 
	begin
	if ($<other_player_status>.double_notes < 1)
		break
	endif
	Wait \{30
		frames}
	repeat
	update_battle_alert_icon player_status = <other_player_status>
endscript

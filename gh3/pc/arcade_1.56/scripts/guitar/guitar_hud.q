
script setup_sprites 
	ScreenElementSystemInit
	setup_main_button_event_mappings
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = hud_window
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = song_failed_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			center
			top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = "Incomplete"
		z_priority = 5.0
		alpha = 0}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = song_won_text
		font = text_a10
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		Scale = 4.0
		rgba = [
			210
			210
			210
			250
		]
		text = "You Rock!"
		z_priority = 71.0
		alpha = 0}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = player1wins_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			center
			top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = "Player 1 Wins!"
		z_priority = 5.0
		alpha = 0}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = player2wins_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			center
			top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = "Player 2 Wins!"
		z_priority = 5.0
		alpha = 0}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = intro_song_info_text
		font = text_a10
		Pos = (480.0, 32.0)
		just = [
			left
			top
		]
		Scale = 1.23
		rgba = [
			210
			210
			210
			250
		]
		text = "Song Info"
		z_priority = 5.0
		alpha = 0
		Shadow
		shadow_offs = (1.0, 1.0)}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = intro_performed_by_text
		font = text_a10
		Pos = (480.0, 45.0)
		just = [
			left
			top
		]
		Scale = (1.0, 0.5)
		rgba = [
			230
			205
			160
			255
		]
		text = "AS PERFORMED BY"
		z_priority = 5.0
		alpha = 0
		Shadow
		shadow_offs = (1.0, 1.0)}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = intro_artist_info_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			left
			top
		]
		Scale = 1.0
		rgba = [
			255
			190
			70
			255
		]
		text = "Song Artist"
		z_priority = 5.0
		alpha = 0
		Shadow
		shadow_offs = (1.0, 1.0)}
	setup_pause
endscript
hud_screen_elements = [
	{
		id = star_power_ready_text
		text = "Star Power Ready"
		Pos = (640.0, 230.0)
		alpha = 0
		just = [
			center
			top
		]
		yoff = 0
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	{
		id = double_notes_text
		text = "Double Notes!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = difficulty_up_text
		text = "Difficulty Up!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lefty_notes_text
		text = "Lefty Notes!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = broken_string_text
		text = "Broken String!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = whammy_attack_text
		text = "Whammy!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lightning_text
		text = "Amp Overload!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal_text
		text = "JACKED!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal1_text
		text = "THIEF!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal2_text
		text = "Nothing to steal..."
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = coop_raise_axe
		text = "Tilt guitar to trigger"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	{
		id = coop_raise_axe_cont
		text = "Star Power"
		Pos = (640.0, 300.0)
		Scale = 1.1
		just = [
			center
			top
		]
		yoff = 0
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
]

script setup_hud 
	ExtendCrc hud_destroygroup_window <player_text> out = hud_destroygroup
	CreateScreenElement {
		Type = ContainerElement
		parent = hud_window
		id = <hud_destroygroup>
		Pos = (0.0, 0.0)
		just = [left top]
	}
	GetArraySize \{$hud_screen_elements}
	array_entry = 0
	get_num_players_by_gamemode
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	ExtendCrc <id> <player_text> out = id
	Pos = ($hud_screen_elements [<array_entry>].Pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players> = 2)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<Player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <hud_destroygroup>
		font = text_a6
		just = [left top]
		Scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		Pos = <Pos>
		id = <id>
	}
	printf "setup_hud: id %a" a = ($hud_screen_elements [<array_entry>].id)
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if ((<player_status>.is_local_client) && (<player_status>.highway_layout = solo_highway))
		net_setup_solo_hud player_status = <player_status> hud_destroygroup = <hud_destroygroup> Player = <Player>
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			Change \{g_hud_2d_struct_used = coop_career_hud_2d_elements}
		elseif ($game_mode = p2_faceoff || game_mode = p2_pro_faceoff)
			Change \{g_hud_2d_struct_used = faceoff_hud_2d_elements}
		elseif ($game_mode = p2_battle || ($boss_battle = 1))
			Change \{g_hud_2d_struct_used = battle_hud_2d_elements}
		else
			Change \{g_hud_2d_struct_used = career_hud_2d_elements}
		endif
		ExtendCrc HUD_2D_Container <player_text> out = new_2d_container
		if NOT ScreenElementExists id = <new_2d_container>
			CreateScreenElement {
				Type = ContainerElement
				parent = root_window
				Pos = (0.0, 0.0)
				just = [left top]
				id = <new_2d_container>
				Scale = (($g_hud_2d_struct_used).Scale)
			}
		endif
		create_2d_hud_elements parent = <new_2d_container> player_text = <player_text> elements_structure = $g_hud_2d_struct_used
	endif
	if ($display_debug_input = 1)
		ExtendCrc input_text <player_text> out = input_id
		CreateScreenElement {
			Type = TextElement
			parent = <hud_destroygroup>
			font = text_a1
			just = [left top]
			Scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			text = "I111111111111111"
			Pos = (64.0, 64.0)
			id = <input_id>
		}
	endif
	ExtendCrc beginner_bg <player_text> out = beginner_bg_id
	CreateScreenElement {
		Type = SpriteElement
		texture = menu_pause_frame_banner
		parent = <hud_destroygroup>
		just = [center center]
		z_priority = 99.0
		Pos = (148.0, 45.0)
		id = <beginner_bg_id>
		Scale = (1.05, 0.9)
		alpha = 0
	}
	ExtendCrc beginner_note <player_text> out = beginner_note_id
	CreateScreenElement {
		Type = TextElement
		parent = <hud_destroygroup>
		font = text_a4
		just = [center center]
		Scale = (0.45000002, 0.5)
		rgba = [210 210 210 250]
		z_priority = 100.0
		text = "BEGINNER MODE"
		Pos = (148.0, 16.0)
		id = <beginner_note_id>
		alpha = 0
	}
	ExtendCrc beginner_desc <player_text> out = beginner_desc_id
	CreateScreenElement {
		Type = TextElement
		parent = <hud_destroygroup>
		font = text_a4
		just = [center center]
		Scale = (0.45000002, 0.5)
		rgba = [210 210 210 250]
		z_priority = 100.0
		text = "DON'T FRET, STRUM"
		Pos = (148.0, 36.0)
		id = <beginner_desc_id>
		alpha = 0
	}
	ExtendCrc nofail_note <player_text> out = nofail_note_id
	CreateScreenElement {
		Type = TextElement
		parent = <hud_destroygroup>
		font = text_a4
		just = [center center]
		Scale = (0.45000002, 0.5)
		rgba = [210 210 210 250]
		z_priority = 100.0
		text = "NO FAIL MODE"
		Pos = (148.0, 26.0)
		id = <nofail_note_id>
		alpha = 0
	}
	if ($is_attract_mode = 0)
		if (<player_text> = 'p1')
			if ($current_difficulty = beginner)
				<beginner_bg_id> :SetProps alpha = 1
				<beginner_note_id> :SetProps alpha = 1
				<beginner_desc_id> :SetProps alpha = 1
			endif
		elseif (<player_text> = 'p2')
			if ($current_difficulty2 = beginner)
				<beginner_bg_id> :SetProps Pos = (1132.0, 45.0) alpha = 1
				<beginner_note_id> :SetProps Pos = (1132.0, 16.0) alpha = 1
				<beginner_desc_id> :SetProps Pos = (1132.0, 36.0) alpha = 1
			endif
		endif
	endif
	reset_hud_text <...>
endscript

script destroy_hud 
	ExtendCrc hud_destroygroup_window <player_text> out = hud_destroygroup
	if ScreenElementExists id = <hud_destroygroup>
		DestroyScreenElement id = <hud_destroygroup>
	endif
	ExtendCrc \{HUD_2D_Container
		'p1'
		out = new_2d_container}
	if ScreenElementExists id = <new_2d_container>
		DestroyScreenElement id = <new_2d_container>
	endif
	ExtendCrc \{HUD_2D_Container
		'p2'
		out = new_2d_container}
	if ScreenElementExists id = <new_2d_container>
		DestroyScreenElement id = <new_2d_container>
	endif
	formatText checksumName = player_container 'HUD_Note_Streak_Combo%d' d = <Player>
	destroy_menu menu_id = <player_container>
endscript

script reset_hud_text 
	Name = star_power_ready_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = double_notes_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = difficulty_up_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = lefty_notes_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = broken_string_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = whammy_attack_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = lightning_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = steal_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = steal1_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = steal2_text
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = coop_raise_axe
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	Name = coop_raise_axe_cont
	ExtendCrc <Name> <player_text> out = Name
	DoScreenElementMorph id = <Name> alpha = 0
	DoScreenElementMorph \{id = song_failed_text
		alpha = 0}
	DoScreenElementMorph \{id = song_won_text
		alpha = 0}
	DoScreenElementMorph \{id = player1wins_text
		alpha = 0}
	DoScreenElementMorph \{id = player2wins_text
		alpha = 0}
endscript

script reset_hud 
	reset_hud_text <...>
	if ($game_mode = p2_battle || $boss_battle = 1)
		destroy_battle_alert_frames
		create_battle_alert_frames
	endif
endscript

script move_hud_to_default \{time = 0.01}
	SpawnScriptNow move_2d_elements_to_default params = {morph_time = <time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	GetSongTimeMs
	initial_time = (<time> * 1.0)
	if ($boss_battle = 1)
		if NOT ($devil_finish = 1)
			SpawnScriptNow \{create_battle_death_meter}
		endif
	endif
	begin
	GetSongTimeMs
	delta = ((<time> - <initial_time>) / (<move_time>))
	if (<delta> > 1.0)
		delta = 1.0
	endif
	morph_2d_hud_elements <...>
	if (<delta> = 1.0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	off_set_drop = (0.0, 0.0)
	off_set = (50.0, 0.0)
	if ($game_mode = p2_faceoff)
		off_set_drop = (0.0, 50.0)
	endif
	rot = -5
	time_to_move = 0.1
	morph_2d_hud_elements <...>
	Wait \{0.1
		Seconds}
	<off_set> = (-25.0, 0.0)
	if ($game_mode = p2_faceoff)
		<off_set_drop> = (0.0, -25.0)
	endif
	<rot> = 5
	<time_to_move> = 0.125
	morph_2d_hud_elements <...>
	Wait \{0.125
		Seconds}
	<rot> = 0
	<off_set_drop> = (0.0, 0.0)
	<off_set> = (0.0, 0.0)
	<time_to_move> = 0.1
	morph_2d_hud_elements <...>
endscript

script morph_2d_hud_elements \{off_set = (0.0, 0.0)
		off_set_drop = (0.0, 0.0)
		time_to_move = 0
		rot = 0}
	if ($current_num_players = 2)
		if ($game_mode = p2_career || $game_mode = p2_coop)
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
			new_rock_pos = rock_pos
			new_score_pos = score_pos
		else
			new_rock_pos = rock_pos_p1
			new_score_pos = score_pos_p1
			intro_rock_pos = offscreen_rock_pos_p1
			intro_score_pos = offscreen_score_pos_p1
		endif
	elseif ($player1_status.highway_layout = solo_highway)
		if ($game_mode = p2_battle)
			new_rock_pos = rock_pos_p1
			intro_rock_pos = offscreen_rock_pos_p1
		else
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		endif
	else
		new_rock_pos = rock_pos
		new_score_pos = score_pos
		intro_rock_pos = offscreen_rock_pos
		intro_score_pos = offscreen_score_pos
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_career || $game_mode = p2_coop)
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos) + (<delta> * ((($g_hud_2d_struct_used).rock_pos) - <off_set> - <off_set_drop>)))
	else
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_rock_pos>) + (<delta> * ((($g_hud_2d_struct_used).<new_rock_pos>) - <off_set> - <off_set_drop>)))
	endif
	if NOT ($Cheat_PerformanceMode = 1)
		if NOT ($end_credits = 1)
			if NOT ($game_mode = training)
				ExtendCrc \{HUD2D_rock_container
					'p1'
					out = new_container}
				if ScreenElementExists id = <new_container>
					DoScreenElementMorph id = <new_container> Pos = <move_rock_pos> time = <time_to_move> rot_angle = <rot>
				endif
			endif
			ExtendCrc \{HUD2D_score_container
				'p1'
				out = new_container}
			if ScreenElementExists id = <new_container>
				move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * ((($g_hud_2d_struct_used).<new_score_pos>) + <off_set>)))
				DoScreenElementMorph id = <new_container> Pos = <move_score_pos> time = <time_to_move>
			endif
		endif
		if NOT ($devil_finish = 1)
			ExtendCrc \{HUD2D_rock_container
				'p2'
				out = new_container}
			if ScreenElementExists id = <new_container>
				move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
				DoScreenElementMorph id = <new_container> Pos = <move_rock_pos_p2> time = <time_to_move> rot_angle = <rot>
			endif
			ExtendCrc \{HUD2D_score_container
				'p2'
				out = new_container}
			if ScreenElementExists id = <new_container>
				move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
				DoScreenElementMorph id = <new_container> Pos = <move_score_pos_p2> time = <time_to_move>
			endif
		endif
	endif
	morph_gamertags <...>
endscript

script split_text_into_array_elements \{text = "OOPS"
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if NOT GotParam \{parent}
		parent = root_window
	endif
	if GotParam \{id}
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
			id = <id>
		}
	else
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
		}
	endif
	parent_container = <id>
	fit_scale = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			Type = TextElement
			parent = <parent_container>
			text = <text>
			font = text_a1
			Scale = (<flags>.Scale)
		}
		GetScreenElementDims id = <id>
		StringLength string = <text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <id>
	endif
	if GotParam \{centered}
		half_width = ((<array_Size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	i = 0
	begin
	CreateScreenElement {
		Type = TextElement
		parent = <parent_container>
		Pos = <text_pos>
		text = (<char_array> [<i>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	CreateScreenElement {
		Type = TextElement
		parent = <parent_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [center center]
		Pos = <text_pos>
		alpha = (<flags>.alpha)
		Scale = (<flags>.Scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_Size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	if NOT ScreenElementExists id = <id>
		return
	endif
	GetScreenElementChildren id = <id>
	GetArraySize \{children}
	i = 0
	begin
	if ScreenElementExists id = (<children> [<i>])
		GetScreenElementProps id = (<children> [<i>])
		(<children> [<i>]) :SetTags Pos = <Pos> Scale = <Scale>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	GetStartTime
	last_time = <starttime>
	printf "Pre-jiggle: start %a last %b wait %c" a = <starttime> b = <last_time> c = <wait_time>
	begin
	GetStartTime
	if ((<last_time> + <wait_time>) >= <starttime>)
		printf "Waiting to jiggle: start %a last %b wait %c" a = <starttime> b = <last_time> c = <wait_time>
	else
		i = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			GetRandomValue \{a = -10
				b = 10
				Name = rand_x}
			GetRandomValue \{a = -10
				b = -10
				Name = rand_y}
			GetRandomValue \{a = 0
				b = 3
				Name = rand_rot}
			GetRandomValue \{a = 0.7
				b = 1.3
				Name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			SetScreenElementProps id = (<children> [<i>]) Pos = (<Pos> + <rand_pos>) rot_angle = (<rot_angle> + <rand_rot>)
			DoScreenElementMorph id = (<children> [<i>]) Scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		Wait \{0.075
			Seconds}
		<i> = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			SetScreenElementProps id = (<children> [<i>]) Pos = <Pos> rot_angle = <rand_rot>
			DoScreenElementMorph id = (<children> [<i>]) Scale = <Scale>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	Wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT ScreenElementExists id = <id>
		return
	endif
	GetScreenElementChildren id = <id>
	GetArraySize \{children}
	i = 0
	explode_dir = 1
	begin
	if ScreenElementExists id = (<children> [<i>])
		switch (<explode_dir>)
			case 1
			GetRandomValue \{a = -2000
				b = 0
				Name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				Name = rand_y}
			case 2
			GetRandomValue \{a = 1280
				b = 3280
				Name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				Name = rand_y}
			case 3
			GetRandomValue \{a = 1280
				b = 3280
				Name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				Name = rand_y}
			case 4
			GetRandomValue \{a = -2000
				b = 0
				Name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				Name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		GetRandomValue \{a = 0
			b = 180
			Name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		DoScreenElementMorph id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if ScreenElementExists id = (<children> [<i>])
		DoScreenElementMorph id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> / 2)
endscript

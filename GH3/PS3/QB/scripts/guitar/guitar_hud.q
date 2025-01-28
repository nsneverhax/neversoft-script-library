
script setup_sprites 
	ScreenElementSystemInit
	setup_main_button_event_mappings
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = hud_window
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = song_failed_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			Center
			Top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		Text = "Song Failed"
		z_priority = 5.0
		Alpha = 0}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = song_won_text
		font = text_a10
		Pos = (640.0, 360.0)
		just = [
			Center
			Center
		]
		Scale = 4.0
		rgba = [
			210
			210
			210
			250
		]
		Text = "You Rock!"
		z_priority = 71.0
		Alpha = 0}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = player1wins_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			Center
			Top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		Text = "Player 1 Wins!"
		z_priority = 5.0
		Alpha = 0}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = player2wins_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			Center
			Top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		Text = "Player 2 Wins!"
		z_priority = 5.0
		Alpha = 0}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = intro_song_info_text
		font = text_a10
		Pos = (480.0, 32.0)
		just = [
			LEFT
			Top
		]
		Scale = 1.23
		rgba = [
			210
			210
			210
			250
		]
		Text = "Song Info"
		z_priority = 5.0
		Alpha = 0
		Shadow
		shadow_offs = (1.0, 1.0)}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = intro_performed_by_text
		font = text_a10
		Pos = (480.0, 45.0)
		just = [
			LEFT
			Top
		]
		Scale = (1.0, 0.5)
		rgba = [
			230
			205
			160
			255
		]
		Text = "AS PERFORMED BY"
		z_priority = 5.0
		Alpha = 0
		Shadow
		shadow_offs = (1.0, 1.0)}
	CreateScreenElement \{Type = TextElement
		PARENT = root_window
		Id = intro_artist_info_text
		font = text_a10
		Pos = (640.0, 32.0)
		just = [
			LEFT
			Top
		]
		Scale = 1.0
		rgba = [
			255
			190
			70
			255
		]
		Text = "Song Artist"
		z_priority = 5.0
		Alpha = 0
		Shadow
		shadow_offs = (1.0, 1.0)}
	setup_pause
endscript
hud_screen_elements = [
	{
		Id = star_power_ready_text
		Text = "Star Power Ready"
		Pos = (640.0, 230.0)
		Alpha = 0
		just = [
			Center
			Top
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
		Id = double_notes_text
		Text = "Double Notes!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = difficulty_up_text
		Text = "Difficulty Up!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = lefty_notes_text
		Text = "Lefty Notes!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = broken_string_text
		Text = "Broken String!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = whammy_attack_text
		Text = "Whammy!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = lightning_text
		Text = "Amp Overload!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = steal_text
		Text = "JACKED!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = steal1_text
		Text = "THIEF!"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = steal2_text
		Text = "Nothing to steal..."
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
		]
		yoff = 0
	}
	{
		Id = coop_raise_axe
		Text = "Tilt guitar to trigger"
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			Center
			Top
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
		Id = coop_raise_axe_cont
		Text = "Star Power"
		Pos = (640.0, 300.0)
		Scale = 1.1
		just = [
			Center
			Top
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
	ExtendCRC hud_destroygroup_window <player_Text> out = hud_destroygroup
	CreateScreenElement {
		Type = ContainerElement
		PARENT = hud_window
		Id = <hud_destroygroup>
		Pos = (0.0, 0.0)
		just = [LEFT Top]
	}
	GetArraySize \{$hud_screen_elements}
	array_entry = 0
	get_num_players_by_gamemode
	begin
	Id = ($hud_screen_elements [<array_entry>].Id)
	ExtendCRC <Id> <player_Text> out = Id
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
		PARENT = <hud_destroygroup>
		font = text_a6
		just = [LEFT Top]
		Scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		Pos = <Pos>
		Id = <Id>
	}
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
		ExtendCRC HUD_2D_Container <player_Text> out = new_2d_container
		if NOT ScreenElementExists Id = <new_2d_container>
			CreateScreenElement {
				Type = ContainerElement
				PARENT = root_window
				Pos = (0.0, 0.0)
				just = [LEFT Top]
				Id = <new_2d_container>
				Scale = (($g_hud_2d_struct_used).Scale)
			}
		endif
		create_2d_hud_elements PARENT = <new_2d_container> player_Text = <player_Text> elements_structure = $g_hud_2d_struct_used
	endif
	if ($display_debug_input = 1)
		ExtendCRC input_text <player_Text> out = input_id
		CreateScreenElement {
			Type = TextElement
			PARENT = <hud_destroygroup>
			font = text_A1
			just = [LEFT Top]
			Scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			Text = "I111111111111111"
			Pos = (64.0, 64.0)
			Id = <input_id>
		}
	endif
	reset_hud_text <...>
endscript

script destroy_hud 
	ExtendCRC hud_destroygroup_window <player_Text> out = hud_destroygroup
	if ScreenElementExists Id = <hud_destroygroup>
		DestroyScreenElement Id = <hud_destroygroup>
	endif
	ExtendCRC \{HUD_2D_Container
		'p1'
		out = new_2d_container}
	if ScreenElementExists Id = <new_2d_container>
		DestroyScreenElement Id = <new_2d_container>
	endif
	ExtendCRC \{HUD_2D_Container
		'p2'
		out = new_2d_container}
	if ScreenElementExists Id = <new_2d_container>
		DestroyScreenElement Id = <new_2d_container>
	endif
	FormatText ChecksumName = player_container 'HUD_Note_Streak_Combo%d' D = <Player>
	destroy_menu menu_id = <player_container>
endscript

script reset_hud_text 
	Name = star_power_ready_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = double_notes_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = difficulty_up_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = lefty_notes_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = broken_string_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = whammy_attack_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = lightning_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = steal_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = steal1_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = steal2_text
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = coop_raise_axe
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	Name = coop_raise_axe_cont
	ExtendCRC <Name> <player_Text> out = Name
	DoScreenElementMorph Id = <Name> Alpha = 0
	DoScreenElementMorph \{Id = song_failed_text
		Alpha = 0}
	DoScreenElementMorph \{Id = song_won_text
		Alpha = 0}
	DoScreenElementMorph \{Id = player1wins_text
		Alpha = 0}
	DoScreenElementMorph \{Id = player2wins_text
		Alpha = 0}
endscript

script reset_hud 
	reset_hud_text <...>
	if ($game_mode = p2_battle || $boss_battle = 1)
		destroy_battle_alert_frames
		create_battle_alert_frames
	endif
endscript

script move_hud_to_default \{Time = 0.01}
	SpawnScriptNow move_2d_elements_to_default Params = {morph_time = <Time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	GetSongTimeMS
	initial_time = (<Time> * 1.0)
	if ($boss_battle = 1)
		if NOT ($devil_finish = 1)
			SpawnScriptNow \{create_battle_death_meter}
		endif
	endif
	begin
	GetSongTimeMS
	delta = ((<Time> - <initial_time>) / (<move_time>))
	if (<delta> > 1.0)
		delta = 1.0
	endif
	morph_2d_hud_elements <...>
	if (<delta> = 1.0)
		break
	endif
	Wait \{1
		GameFrame}
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
				ExtendCRC \{HUD2D_rock_container
					'p1'
					out = new_container}
				if ScreenElementExists Id = <new_container>
					DoScreenElementMorph Id = <new_container> Pos = <move_rock_pos> Time = <time_to_move> Rot_Angle = <rot>
				endif
			endif
			ExtendCRC \{HUD2D_score_container
				'p1'
				out = new_container}
			if ScreenElementExists Id = <new_container>
				move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * ((($g_hud_2d_struct_used).<new_score_pos>) + <off_set>)))
				DoScreenElementMorph Id = <new_container> Pos = <move_score_pos> Time = <time_to_move>
			endif
		endif
		if NOT ($devil_finish = 1)
			ExtendCRC \{HUD2D_rock_container
				'p2'
				out = new_container}
			if ScreenElementExists Id = <new_container>
				move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
				DoScreenElementMorph Id = <new_container> Pos = <move_rock_pos_p2> Time = <time_to_move> Rot_Angle = <rot>
			endif
			ExtendCRC \{HUD2D_score_container
				'p2'
				out = new_container}
			if ScreenElementExists Id = <new_container>
				move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
				DoScreenElementMorph Id = <new_container> Pos = <move_score_pos_p2> Time = <time_to_move>
			endif
		endif
	endif
	morph_gamertags <...>
endscript

script split_text_into_array_elements \{Text = "OOPS"
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	StringToCharArray String = <Text>
	GetArraySize <char_array>
	if NOT GotParam \{PARENT}
		PARENT = root_window
	endif
	if GotParam \{Id}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <PARENT>
			Pos = (0.0, 0.0)
			Id = <Id>
		}
	else
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <PARENT>
			Pos = (0.0, 0.0)
		}
	endif
	parent_container = <Id>
	fit_scale = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			Type = TextElement
			PARENT = <parent_container>
			Text = <Text>
			font = text_A1
			Scale = (<flags>.Scale)
		}
		GetScreenElementDims Id = <Id>
		StringLength String = <Text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <Id>
	endif
	if GotParam \{centered}
		half_width = ((<array_Size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	I = 0
	begin
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_container>
		Pos = <text_pos>
		Text = (<char_array> [<I>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
		Alpha = (<flags>.Alpha)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_container>
		Text = (<char_array> [<I>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [Center Center]
		Pos = <text_pos>
		Alpha = (<flags>.Alpha)
		Scale = (<flags>.Scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<I> = (<I> + 1)
	repeat <array_Size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	GetScreenElementChildren Id = <Id>
	GetArraySize \{children}
	I = 0
	begin
	if ScreenElementExists Id = (<children> [<I>])
		GetScreenElementProps Id = (<children> [<I>])
		(<children> [<I>]) :SetTags Pos = <Pos> Scale = <Scale>
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	GetStartTime
	last_time = <StartTime>
	begin
	GetStartTime
	if ((<StartTime> - <last_time>) >= <wait_time>)
		break
	else
		I = 0
		begin
		if ScreenElementExists Id = (<children> [<I>])
			(<children> [<I>]) :GetTags
			GetRandomValue \{A = -10
				B = 10
				Name = rand_x}
			GetRandomValue \{A = -10
				B = -10
				Name = rand_y}
			GetRandomValue \{A = 0
				B = 3
				Name = rand_rot}
			GetRandomValue \{A = 0.7
				B = 1.3
				Name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			SetScreenElementProps Id = (<children> [<I>]) Pos = (<Pos> + <rand_pos>) Rot_Angle = <rand_rot>
			DoScreenElementMorph Id = (<children> [<I>]) Scale = <rand_scale> relative_scale
		endif
		<I> = (<I> + 1)
		repeat <array_Size>
		Wait \{0.075
			Seconds}
		<I> = 0
		begin
		if ScreenElementExists Id = (<children> [<I>])
			(<children> [<I>]) :GetTags
			SetScreenElementProps Id = (<children> [<I>]) Pos = <Pos> Rot_Angle = <rand_rot>
			DoScreenElementMorph Id = (<children> [<I>]) Scale = <Scale>
		endif
		<I> = (<I> + 1)
		repeat <array_Size>
	endif
	Wait \{1
		GameFrame}
	repeat
	if (<explode> = 1)
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	GetScreenElementChildren Id = <Id>
	GetArraySize \{children}
	I = 0
	explode_dir = 1
	begin
	if ScreenElementExists Id = (<children> [<I>])
		switch (<explode_dir>)
			case 1
			GetRandomValue \{A = -2000
				B = 0
				Name = rand_x}
			GetRandomValue \{A = -2000
				B = -200
				Name = rand_y}
			case 2
			GetRandomValue \{A = 1280
				B = 3280
				Name = rand_x}
			GetRandomValue \{A = -2000
				B = -200
				Name = rand_y}
			case 3
			GetRandomValue \{A = 1280
				B = 3280
				Name = rand_x}
			GetRandomValue \{A = 920
				B = 2720
				Name = rand_y}
			case 4
			GetRandomValue \{A = -2000
				B = 0
				Name = rand_x}
			GetRandomValue \{A = 920
				B = 2720
				Name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		GetRandomValue \{A = 0
			B = 180
			Name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		DoScreenElementMorph Id = (<children> [<I>]) Pos = <rand_pos> Rot_Angle = <rand_rot> Time = <Time> Motion = ease_out
	endif
	<I> = (<I> + 1)
	if ScreenElementExists Id = (<children> [<I>])
		DoScreenElementMorph Id = (<children> [<I>]) Pos = <rand_pos> Rot_Angle = <rand_rot> Time = <Time>
	endif
	<I> = (<I> + 1)
	repeat (<array_Size> / 2)
endscript

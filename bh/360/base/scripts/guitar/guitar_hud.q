
script setup_sprites 
	setup_main_button_event_mappings
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = hud_window
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	setup_pause
endscript
hide_hud_elements = 0
hud_screen_elements = [
	{
		id = star_power_ready_text
		text = qs(0x8ba36464)
		Pos = (640.0, 230.0)
		alpha = 0
		just = [
			center
			top
		]
		yoff = 0
		shadow
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
	ExtendCrcPlayer hud_destroygroup_window <player> out = hud_destroygroup
	CreateScreenElement {
		type = ContainerElement
		parent = hud_window
		id = <hud_destroygroup>
		Pos = (0.0, 0.0)
		just = [left top]
	}
	GetArraySize \{$hud_screen_elements}
	array_entry = 0
	GetNumPlayersInGame \{on_screen}
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	ExtendCrcPlayer <id> <player> out = id
	Pos = ($hud_screen_elements [<array_entry>].Pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players_shown> = 2)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 3)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 4)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	CreateScreenElement {
		type = TextElement
		parent = <hud_destroygroup>
		font = fontgrid_text_A1
		just = [left top]
		scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		Pos = <Pos>
		id = <id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	GetPlayerInfo <player> is_local_client
	GetPlayerInfo <player> highway_layout
	if ((<is_local_client> = 1) && (<highway_layout> = solo_highway))
		net_setup_solo_hud hud_destroygroup = <hud_destroygroup> player = <player>
	else
		update_hud_layout
		ExtendCrcPlayer HUD_2D_Container <player> out = new_2d_container
		if NOT ScreenElementExists id = <new_2d_container>
			CreateScreenElement {
				type = ContainerElement
				parent = root_window
				Pos = (0.0, 0.0)
				just = [left top]
				id = <new_2d_container>
				scale = (($g_hud_2d_struct_used).scale)
			}
		endif
		create_2d_hud_elements parent = <new_2d_container> player = <player> elements_structure = $g_hud_2d_struct_used
		if ($hide_hud_elements = 1)
			SetScreenElementProps id = <new_2d_container> hide
		endif
	endif
	if ($display_debug_input = 1)
		ExtendCrcPlayer input_text <player> out = input_id
		CreateScreenElement {
			type = TextElement
			parent = <hud_destroygroup>
			font = debug
			just = [left top]
			scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			text = qs(0x8c30363c)
			Pos = (64.0, 64.0)
			id = <input_id>
		}
	endif
	reset_hud_text player = <player>
endscript

script setup_band_hud \{force_layout = 0}
	printf \{channel = zdebug
		qs(0x49729532)}
	if (<force_layout> = 0)
		update_hud_layout
	endif
	if StructureContains \{structure = $g_hud_2d_struct_used
			desc_interface}
		CreateScreenElement \{parent = root_window
			id = hud_misc_root
			type = ContainerElement
			Pos = (0.0, 0.0)
			z_priority = 0
			alpha = 1}
		CreateScreenElement {
			parent = root_window
			id = hud_root
			type = DescInterface
			desc = ($g_hud_2d_struct_used.desc_interface)
			Pos = (0.0, 0.0)
			z_priority = 0
			alpha = 0
		}
		if NOT ResolveScreenElementID \{id = {
					hud_root
					child = 0
				}
				param = hud_Container}
			RequireParams \{[
					hud_Container
				]
				all}
			return
		endif
		GameMode_GetType
		hide_band_death_meter
		if (<type> = career || <type> = quickplay)
			init_upper_container
			HUD_attach_star_meter
		else
			if hud_root :Desc_ResolveAlias \{name = alias_upper_container
					param = upper_group}
				<upper_group> :Die
			endif
		endif
		if ($calibrate_lag_enabled = 1 || $Cheat_HUDFreeMode = 1)
			if hud_root :Desc_ResolveAlias \{name = alias_upper_container
					param = upper_group}
				<upper_group> :SE_SetProps hide
			endif
		endif
		if (<type> = competitive && (GameMode_IsTeamGame))
			if hud_root :Desc_ResolveAlias \{name = alias_versus_meter
					param = versus_meter}
				HUD_attach_widget_band_versus_meter parent_id = <versus_meter>
			endif
			count_players_by_part \{part = guitar}
			<num_guitar> = <players_by_part>
			count_players_by_part \{part = Drum}
			<num_drum> = <players_by_part>
			count_players_by_part \{part = vocals}
			<num_vocals> = <players_by_part>
			count_players_by_part \{part = bass}
			<num_bass> = <players_by_part>
			<num_guitar> = (<num_guitar> + <num_bass>)
			GetNumPlayersInGame \{on_screen}
			num_highways = (<num_guitar> + <num_drum>)
			if (<num_vocals> > 2 && <num_highways> = 0)
				hud_root :SE_SetProps \{hud_standard_band_meter_pos = (165.0, 40.0)}
			endif
		elseif hud_root :Desc_ResolveAlias \{name = alias_versus_meter
				param = versus_meter}
			<versus_meter> :Die
		endif
		if (<type> = faceoff || <type> = pro_faceoff)
			if hud_root :Desc_ResolveAlias \{name = alias_HUD_scores_stack
					param = scores_stack}
				<scores_stack> :SE_SetProps unhide
				HUD_attach_scores_stack_widget parent_id = <scores_stack>
			endif
		endif
		hud_hide_optional_vocals \{desc_id = hud_root}
		if ($hide_hud_elements = 1 || $Cheat_PerformanceMode = 1)
			if NOT (<type> = freeplay)
				hud_root :SE_SetProps \{hide}
			endif
		endif
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> <= 0)
		Change \{sysnotify_ingame_position = topright}
	elseif (<num_vocalists_shown> = 1)
		GetNumPlayersInGame \{on_screen}
		if (<num_players_shown> = 1)
			Change \{sysnotify_ingame_position = topright}
		else
			Change \{sysnotify_ingame_position = centerright}
		endif
	else
		Change \{sysnotify_ingame_position = centerright}
	endif
	SetSystemNotificationPosition Pos = ($sysnotify_ingame_position)
	if ($Cheat_FocusMode = 1 || $calibrate_lag_enabled = 1)
		CreateScreenElement \{type = SpriteElement
			parent = hud_misc_root
			texture = white
			rgba = [
				0
				0
				0
				255
			]
			dims = (1280.0, 720.0)
			Pos = (640.0, 360.0)
			z_priority = -9999}
		PlayIGCCam \{id = cs_view_cam_id
			name = ch_view_cam
			viewport = bg_viewport
			LockTo = World
			Pos = (100000000.0, 100000000.0, 100000000.0)
			Quat = (0.0, 0.0, 0.0)
			FOV = 72.0
			Play_hold = 1
			interrupt_current}
	endif
endscript

script debug_refresh_hud 
	destroy_band_hud
	setup_band_hud \{force_layout = 1}
	hud_root :SE_SetProps \{alpha = 1}
endscript

script count_players_by_part 
	RequireParams \{[
			part
		]
		all}
	<player> = 1
	<players_by_part> = 0
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		if PlayerInfoEquals <player> part = <part>
			<players_by_part> = (<players_by_part> + 1)
		endif
		GetNextPlayer player = <player> on_screen
		repeat <num_players_shown>
	endif
	return players_by_part = <players_by_part>
endscript

script get_player_by_part 
	RequireParams \{[
			part
		]
		all}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		if PlayerInfoEquals <player> part = <part>
			return player_part = <player>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	return \{player_part = -1}
endscript

script update_hud_layout 
	<desired_layout> = null
	count_players_by_part \{part = guitar}
	<num_guitar> = <players_by_part>
	count_players_by_part \{part = Drum}
	<num_drum> = <players_by_part>
	count_players_by_part \{part = vocals}
	<num_vocals> = <players_by_part>
	count_players_by_part \{part = bass}
	<num_bass> = <players_by_part>
	<num_guitar> = (<num_guitar> + <num_bass>)
	GetNumPlayersInGame \{on_screen}
	num_highways = (<num_guitar> + <num_drum>)
	<desired_layout> = hud_standard
	if (<num_players_shown> = 1 && <num_highways> = 1)
		<desired_layout> = hud_standard_1p
	elseif (<num_vocals> > 0 && <num_highways> = 1)
		<desired_layout> = hud_standard_1g1v
	elseif (<num_vocals> = 1 && <num_highways> = 0)
		<desired_layout> = hud_standard_1v
	else
		<desired_layout> = hud_standard
	endif
	printf 'HUD layout: %s' s = <desired_layout> DoNotResolve
	if GlobalExists name = <desired_layout>
		Change g_hud_2d_struct_used = $<desired_layout>
	else
		printstruct <...>
		softassert 'Unknown hud layout %s' s = <desired_layout>
		Change \{g_hud_2d_struct_used = $hud_3g1v}
	endif
	printstruct channel = zdebug <...>
endscript

script destroy_hud 
	RequireParams \{[
			player
		]
		all}
	ExtendCrcPlayer hud_destroygroup_window <player> out = hud_destroygroup
	if ScreenElementExists id = <hud_destroygroup>
		DestroyScreenElement id = <hud_destroygroup>
	endif
	FormatText checksumname = new_2d_container 'HUD_2D_Containerp%p' p = <player>
	if ScreenElementExists id = <new_2d_container>
		DestroyScreenElement id = <new_2d_container>
	endif
	FormatText checksumname = player_container 'HUD_Note_Streak_Combo%d' d = <player>
	destroy_menu menu_id = <player_container>
endscript

script destroy_band_hud 
	DetachHUDWidget \{all}
	if ScreenElementExists \{id = hud_root}
		DestroyScreenElement \{id = hud_root}
	endif
	if ScreenElementExists \{id = hud_misc_root}
		DestroyScreenElement \{id = hud_misc_root}
	endif
	Change sysnotify_ingame_position = ($sysnotify_menus_position)
	SetSystemNotificationPosition Pos = ($sysnotify_ingame_position)
endscript

script show_hud 
	if ScreenElementExists \{id = hud_destroygroup_windowp1}
		LegacyDoScreenElementMorph \{id = hud_destroygroup_windowp1
			alpha = 1}
	endif
	if ScreenElementExists \{id = hud_root}
		SetScreenElementProps \{id = hud_root
			alpha = 1}
	endif
endscript

script hide_hud 
	if NOT RetailBuild
		if ($alternate_viewer_hud_behavior = 1)
			return
		endif
	endif
	if ScreenElementExists \{id = hud_destroygroup_windowp1}
		LegacyDoScreenElementMorph \{id = hud_destroygroup_windowp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = hud_root}
		SetScreenElementProps \{id = hud_root
			alpha = 0}
	endif
endscript

script reset_hud_text 
	RequireParams \{[
			player
		]
		all}
	GetArraySize \{$hud_screen_elements}
	<i> = 0
	begin
	name = ($hud_screen_elements [<i>].id)
	ExtendCrcPlayer <name> <player> out = name
	SetScreenElementProps id = <name> alpha = 0
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script reset_hud 
	reset_hud_text player = <player>
endscript

script move_hud_to_default \{time = 0.01}
	spawnscriptnow move_2d_elements_to_default params = {morph_time = <time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	GetSongTimeMs
	initial_time = (<time> * 1.0)
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
	wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = hud_root}
		hud_root :SE_SetProps \{alpha = 1
			time = 0.25}
	endif
	off_set_drop = (0.0, 0.0)
	off_set = (50.0, 0.0)
	rot = -5
	time_to_move = 0.1
	morph_2d_hud_elements <...>
	wait \{0.1
		seconds}
	<off_set> = (-25.0, 0.0)
	<rot> = 5
	<time_to_move> = 0.125
	morph_2d_hud_elements <...>
	wait \{0.125
		seconds}
	<rot> = 0
	<off_set_drop> = (0.0, 0.0)
	<off_set> = (0.0, 0.0)
	<time_to_move> = 0.1
	morph_2d_hud_elements <...>
	if ($is_network_game = 1)
		if StructureContains \{structure = $g_hud_2d_struct_used
				desc_interface}
			GetNumPlayersInGame \{on_screen}
			if (<num_players_shown> > 0)
				GetFirstPlayer \{on_screen}
				begin
				GetPlayerInfo <player> hud_parent
				if ScreenElementExists \{id = hud_root}
					if hud_root :Desc_ResolveAlias name = <hud_parent> param = parent_id
						if ScreenElementExists id = {<parent_id> child = GamerTag}
							ResolveScreenElementID param = obj_id id = [
								{id = <parent_id>}
								{local_id = GamerTag}
							]
							ResolveScreenElementID param = container_id id = [
								{id = <parent_id>}
								{local_id = GamerTag}
								{local_id = GamerTag}
							]
							GetPlayerInfo <player> is_local_client
							if (<is_local_client> = 1)
								<obj_id> :Obj_SpawnScript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0}
							else
								<obj_id> :Obj_SpawnScript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0.5}
							endif
						endif
					endif
				endif
				GetNextPlayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
	endif
endscript

script fadeout_local_gamertags 
	<gamertag_id> :SE_SetProps alpha = <alpha> time = 1.5
	wait \{1.0
		seconds}
	if (<alpha> = 0)
		if ScreenElementExists id = <obj_id>
			<obj_id> :Die
		endif
	endif
endscript

script morph_2d_hud_elements \{off_set = (0.0, 0.0)
		off_set_drop = (0.0, 0.0)
		time_to_move = 0
		rot = 0
		hud_version = gh3}
	<hud_version> = ($g_hud_2d_struct_used.hud_version)
	if (<hud_version> = gh3)
		GetNumPlayersInGame
		if (<num_players> > 1)
			if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
				intro_rock_pos = offscreen_rock_pos
				intro_score_pos = offscreen_score_pos
				new_rock_pos = rock_pos
				new_score_pos = score_pos
			else
				if ($game_mode = p2_pro_faceoff)
					new_rock_pos = rock_pos
					intro_rock_pos = offscreen_rock_pos
				else
					new_rock_pos = rock_pos_p1
					intro_rock_pos = offscreen_rock_pos_p1
				endif
				new_score_pos = score_pos_p1
				intro_score_pos = offscreen_score_pos_p1
			endif
		elseif PlayerInfoEquals \{1
				highway_layout = solo_highway}
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		else
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		endif
		final_rock_pos = (($g_hud_2d_struct_used).<new_rock_pos>)
		final_score_pos = (($g_hud_2d_struct_used).<new_score_pos>)
		GetDisplaySettings
		if (<widescreen> = false)
			<final_score_pos> = (<final_score_pos> + (($g_hud_2d_struct_used).offset4by3_score))
			<final_rock_pos> = (<final_rock_pos> + (($g_hud_2d_struct_used).offset4by3_rock))
		endif
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_rock_pos>) + (<delta> * (<final_rock_pos> - <off_set> - <off_set_drop>)))
		if NOT ($Cheat_PerformanceMode = 1)
			if ($end_credits = 0)
				if NOT ($game_mode = practice)
					ExtendCrc \{HUD2D_rock_container
						'p1'
						out = new_container}
					if ScreenElementExists id = <new_container>
						SetScreenElementProps id = <new_container> Pos = <move_rock_pos> time = <time_to_move> rot_angle = <rot>
					endif
				endif
				ExtendCrc \{HUD2D_score_container
					'p1'
					out = new_container}
				if ScreenElementExists id = <new_container>
					move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * (<final_score_pos> + <off_set>)))
					SetScreenElementProps id = <new_container> Pos = <move_score_pos> time = <time_to_move>
				endif
			endif
			ExtendCrc \{HUD2D_rock_container
				'p2'
				out = new_container}
			if ScreenElementExists id = <new_container>
				move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
				SetScreenElementProps id = <new_container> Pos = <move_rock_pos_p2> time = <time_to_move> rot_angle = <rot>
			endif
			ExtendCrc \{HUD2D_score_container
				'p2'
				out = new_container}
			if ScreenElementExists id = <new_container>
				move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
				SetScreenElementProps id = <new_container> Pos = <move_score_pos_p2> time = <time_to_move>
			endif
		endif
	endif
endscript

script split_text_into_array_elements \{text = qs(0x6df5a0fe)
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
			type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
			id = <id>
		}
	else
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
		}
	endif
	parent_container = <id>
	fit_scale = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			type = TextElement
			parent = <parent_container>
			text = <text>
			font = fontgrid_text_A3
			scale = (<flags>.scale)
		}
		GetScreenElementDims id = <id>
		StringLength string = <text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <id>
	endif
	if GotParam \{centered}
		half_width = ((<array_size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	i = 0
	begin
	CreateScreenElement {
		type = TextElement
		parent = <parent_container>
		Pos = <text_pos>
		text = (<char_array> [<i>])
		<flags>
		scale = (<flags>.scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	CreateScreenElement {
		type = TextElement
		parent = <parent_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [center center]
		Pos = <text_pos>
		alpha = (<flags>.alpha)
		scale = (<flags>.scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	saved_id = <id>
	if NOT ScreenElementExists id = <id>
		return
	endif
	GetScreenElementChildren id = <id>
	GetArraySize \{children}
	i = 0
	begin
	if ScreenElementExists id = (<children> [<i>])
		GetScreenElementProps id = (<children> [<i>])
		(<children> [<i>]) :SetTags Pos = <Pos> scale = <scale>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	GetStartTime
	last_time = <starttime>
	begin
	GetStartTime
	if ((<starttime> - <last_time>) >= <wait_time>)
		break
	else
		i = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			GetRandomValue \{a = -10
				b = 10
				name = rand_x}
			GetRandomValue \{a = -10
				b = -10
				name = rand_y}
			GetRandomValue \{a = 0
				b = 3
				name = rand_rot}
			GetRandomValue \{a = 0.7
				b = 1.3
				name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			SetScreenElementProps id = (<children> [<i>]) Pos = (<Pos> + <rand_pos>) rot_angle = <rand_rot> scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		wait \{0.075
			seconds}
		<i> = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			SetScreenElementProps id = (<children> [<i>]) Pos = <Pos> rot_angle = <rand_rot> scale = <scale>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		<id> = <saved_id>
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT ScreenElementExists id = <id>
		return
	endif
	if NOT GetScreenElementChildren id = <id>
		return
	endif
	GetArraySize \{children}
	i = 0
	explode_dir = 1
	if (<array_size> < 2)
		return
	endif
	begin
	if ScreenElementExists id = (<children> [<i>])
		switch (<explode_dir>)
			case 1
			GetRandomValue \{a = -2000
				b = 0
				name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				name = rand_y}
			case 2
			GetRandomValue \{a = 1280
				b = 3280
				name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				name = rand_y}
			case 3
			GetRandomValue \{a = 1280
				b = 3280
				name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				name = rand_y}
			case 4
			GetRandomValue \{a = -2000
				b = 0
				name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		GetRandomValue \{a = 0
			b = 180
			name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		SetScreenElementProps id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if ScreenElementExists id = (<children> [<i>])
		SetScreenElementProps id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_size> / 2)
endscript

script start_friends_lb_box 
	printf \{qs(0xf9aa4c50)}
	GetFirstPlayer
	GetPlayerInfo <player> part
	GetPlayerInfo <player> controller
	if (<part> = vocals)
		instrument = 'mic'
	elseif (<part> = bass)
		instrument = 'backup'
	elseif (<part> = Drum)
		instrument = 'drums'
	else
		<instrument> = ($part_list_props.<part>.text_nl)
	endif
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	FormatText checksumname = leaderboard_id '%s_%i' s = <song_prefix> i = <instrument> AddToStringLookup = true
	NetSessionFunc {
		Obj = stats
		func = get_stats
		params = {
			leaderboard_id = <leaderboard_id>
			callback = start_friends_lb_box_callback
			offset = 1
			columns = <columns>
			num_rows = 100
			listtype = friends
			controller_index = <controller>
		}
	}
endscript

script start_friends_lb_box_callback 
	printf \{qs(0x3ad112fa)}
	printstruct <...>
	if ScreenElementExists \{id = hud_root}
		if hud_root :Desc_ResolveAlias \{name = alias_friend_score
				param = friend_score_box}
			friends_scores = []
			test_score = 115000
			i = 0
			begin
			FormatText TextName = text_name qs(0xfe650eb4) d = <i>
			new_friend_score = {
				name = <test_name>
				score = <test_score>
			}
			AddArrayElement array = <friends_scores> element = <new_friend_score>
			<friends_scores> = <array>
			<test_score> = (<test_score> - 1000)
			<i> = (<i> + 1)
			repeat 100
			<friend_score_box> :SetTags scores = <friends_scores>
			<friend_score_box> :GetTags
			GetArraySize <scores>
			if (<array_size> > 0)
				SetPlayerInfo 1 friends_best_score = (<scores> [(<array_size> -1)].score)
				FormatText TextName = score_text qs(0x76b3fda7) d = (<scores> [(<array_size> -1)].score)
				<friend_score_box> :SE_SetProps score_text = <score_text>
				<friend_score_box> :SE_SetProps name_text = (<scores> [(<array_size> -1)].name)
			endif
		endif
	endif
endscript

script hud_update_friends_score 
	GetFirstPlayer
	GetPlayerInfo <player> score
	if ScreenElementExists \{id = hud_root}
		if hud_root :Desc_ResolveAlias \{name = alias_friend_score
				param = friend_score_box}
			<friend_score_box> :GetTags
			if GotParam \{scores}
				GetArraySize <scores>
				if (<array_size> > 0)
					i = 0
					begin
					if (<scores> [<i>].score < <score>)
						if (<i> > 0)
							SetPlayerInfo 1 friends_best_score = (<scores> [(<i> -1)].score)
							FormatText TextName = score_text qs(0x76b3fda7) d = (<scores> [(<i> -1)].score)
							<friend_score_box> :SE_SetProps score_text_pos = (0.0, -90.0) time = 0.15
							<friend_score_box> :SE_SetProps name_text_pos = (0.0, -90.0) time = 0.15
							<friend_score_box> :SE_WaitProps
							<friend_score_box> :SE_SetProps score_text = <score_text>
							<friend_score_box> :SE_SetProps name_text = (<scores> [(<i> -1)].name)
							<friend_score_box> :SE_SetProps score_text_pos = (0.0, 90.0)
							<friend_score_box> :SE_SetProps name_text_pos = (0.0, 90.0)
							<friend_score_box> :SE_SetProps score_text_pos = (0.0, 0.0) time = 0.15
							<friend_score_box> :SE_SetProps name_text_pos = (0.0, 0.0) time = 0.15
							<friend_score_box> :SE_WaitProps
						endif
						break
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
			endif
		endif
	endif
endscript

script init_upper_container 
	<cnt> = 0
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part
		if (<part> = vocals)
			cnt = (<cnt> + 1)
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	if (<cnt> >= 1)
		shift_upper_hud
	else
		shift_upper_hud \{dx = 40}
	endif
endscript

script shift_upper_hud \{dx = 120}
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_upper_container
			param = upper_group}
		printf \{qs(0x20f5a935)
			channel = zdebug}
		return
	endif
	rel_pos = ((0.0, 1.0) * <dx>)
	<upper_group> :SE_SetProps Pos = {relative <rel_pos>}
endscript

script update_score_meter_spawned 
	begin
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0x3030713c)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_hud_meter_score
			param = score_meter}
		printf \{qs(0xcd78f553)
			channel = zdebug}
		return
	endif
	update_score_meter
	wait \{15
		gameframes}
	repeat
endscript

script update_score_meter 
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0x3030713c)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_hud_meter_score
			param = score_meter}
		printf \{qs(0xcd78f553)
			channel = zdebug}
		return
	endif
	score = 0
	if GameMode_IsBandScoring
		GetBandInfo \{1
			score}
	else
		GetFirstPlayer
		GetPlayerInfo <player> score
	endif
	FormatText TextName = score_text qs(0x48c6d14c) d = <score> DecimalPlaces = 0
	<score_meter> :SE_SetProps score_text = <score_text>
endscript

script update_star_meter_spawned 
	begin
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
			param = star_meter}
		printf \{qs(0xaaaab05d)
			channel = zdebug}
		return
	endif
	update_star_meter
	wait \{1
		gameframes}
	repeat
endscript

script update_star_meter 
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
			param = star_meter}
		printf \{qs(0xaaaab05d)
			channel = zdebug}
		return
	endif
	STARS = 0
	if GameMode_IsBandScoring
		GetBandInfo \{1
			projected_song_stars}
	else
		GetFirstPlayer
		GetPlayerInfo <player> projected_song_stars
	endif
	mathFloor <projected_song_stars>
	diff = (<projected_song_stars> - <floor>)
	led_index = 1
	led_struct = {}
	dx = 0.2
	thresh = <dx>
	begin
	FormatText checksumname = led_checksum 'star_segment_0%p_alpha' p = <led_index>
	if (<diff> > <thresh>)
		alpha = 1.0
	else
		alpha = 0.0
	endif
	AddParam structure_name = led_struct name = <led_checksum> value = <alpha>
	thresh = (<thresh> + <dx>)
	led_index = (<led_index> + 1)
	repeat 5
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen
			out = player_idx}
		begin
		GetPlayerInfo <player_idx> current_run
		GetPlayerInfo <player_idx> total_notes
		if (<current_run> != <total_notes>)
			<star_meter> :SE_SetProps meter_star_bg_alpha = 0.0
		endif
		GetNextPlayer on_screen player = <player_idx> out = player_idx
		repeat <num_players_shown>
	endif
	FormatText TextName = star_text qs(0x48c6d14c) d = <floor> DecimalPlaces = 0
	AddParam structure_name = led_struct name = stars_text value = <star_text>
	<star_meter> :SE_SetProps <led_struct>
endscript

script update_combo_meter_spawned 
	begin
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_hud_meter_streak
			param = streak_meter}
		printf \{qs(0x47832683)
			channel = zdebug}
		return
	endif
	update_combo_meter
	wait \{1
		gameframes}
	repeat
endscript

script update_combo_meter 
	if NOT ScreenElementExists \{id = hud_root}
		printf \{qs(0xc0fc7d99)
			channel = zdebug}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_hud_meter_streak
			param = streak_meter}
		printf \{qs(0x47832683)
			channel = zdebug}
		return
	endif
	if GameMode_IsBandScoring
		GetBandCurrentRun \{player = 1}
	else
		GetFirstPlayer
		GetPlayerInfo <player> current_run
	endif
	num = <current_run>
	ones_place = 0
	tens_place = 0
	hundreds_place = 0
	thousands_place = 0
	if (<num> > 10)
		Mod a = <num> b = 10
		ones_place = <Mod>
	else
		ones_place = <num>
	endif
	if (<num> > 100)
		Mod a = <num> b = 100
		tens_place = (<Mod> / 10)
	else
		tens_place = (<num> / 10)
	endif
	if (<num> > 1000)
		Mod a = <num> b = 1000
		hundreds_place = (<Mod> / 100)
	else
		hundreds_place = (<num> / 100)
	endif
	thousands_place = (<num> / 1000)
	digits_struct = {}
	if (<current_run> < 20)
		AddParam \{structure_name = digits_struct
			name = meter_streak_master_alpha
			value = 0.0}
	else
		AddParam \{structure_name = digits_struct
			name = meter_streak_master_alpha
			value = 1.0}
	endif
	if (<current_run> > 999)
		AddParam \{structure_name = digits_struct
			name = streak_text_01_alpha
			value = 1}
	else
		AddParam \{structure_name = digits_struct
			name = streak_text_01_alpha
			value = 0.2}
	endif
	if (<current_run> > 99)
		AddParam \{structure_name = digits_struct
			name = streak_text_02_alpha
			value = 1}
	else
		AddParam \{structure_name = digits_struct
			name = streak_text_02_alpha
			value = 0.2}
	endif
	if (<current_run> > 9)
		AddParam \{structure_name = digits_struct
			name = streak_text_03_alpha
			value = 1}
	else
		AddParam \{structure_name = digits_struct
			name = streak_text_03_alpha
			value = 0.2}
	endif
	FormatText TextName = ones_text qs(0x48c6d14c) d = <ones_place>
	FormatText TextName = tens_text qs(0x48c6d14c) d = <tens_place>
	FormatText TextName = hundreds_text qs(0x48c6d14c) d = <hundreds_place>
	FormatText TextName = thousands_text qs(0x48c6d14c) d = <thousands_place>
	AddParam structure_name = digits_struct name = streak_text_04_text value = <ones_text>
	AddParam structure_name = digits_struct name = streak_text_03_text value = <tens_text>
	AddParam structure_name = digits_struct name = streak_text_02_text value = <hundreds_text>
	AddParam structure_name = digits_struct name = streak_text_01_text value = <thousands_text>
	<streak_meter> :SE_SetProps <digits_struct>
endscript
force_fail_vignette_on = 0

script Create_Band_Failing_Vignette 
	if NOT ScreenElementExists \{id = Vignette_of_failure}
		CreateScreenElement \{id = Vignette_of_failure
			parent = root_window
			type = DescInterface
			desc = 'band_fail_vignette'
			z_priority = 25
			Pos = (0.0, 0.0)
			root_alpha = 0}
		Vignette_of_failure :Obj_SpawnScriptNow \{Band_Failing_Vignette_pulse}
	endif
endscript

script Band_Failing_Vignette_on 
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff)
		return
	endif
	if ($game_mode = freeplay)
		return
	endif
	GameMode_GetType
	if (<type> = competitive)
		return
	endif
	Create_Band_Failing_Vignette
	Vignette_of_failure :SE_SetProps \{root_alpha = 1.0
		time = 0.5}
endscript

script Band_Failing_Vignette_pulse 
	begin
	SE_SetProps \{outline_rgba = [
			128
			0
			0
			255
		]
		time = 0.5}
	SE_WaitProps
	SE_SetProps \{outline_rgba = [
			0
			0
			0
			255
		]
		time = 0.5}
	SE_WaitProps
	repeat
endscript

script Band_Failing_Vignette_off 
	if ($force_fail_vignette_on = 1)
		return
	endif
	Create_Band_Failing_Vignette
	Vignette_of_failure :SE_SetProps \{root_alpha = 0.0
		time = 0.5}
endscript

script Destroy_Band_Failing_Vignette 
	DestroyScreenElement \{id = Vignette_of_failure}
endscript

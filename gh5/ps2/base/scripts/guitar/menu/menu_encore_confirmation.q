g_ec_balloons_pos_left = [
	(315.0, 325.0)
	(465.0, 405.0)
	(590.0, 340.0)
	(360.0, 440.0)
]
g_ec_balloons_pos_right = [
	(960.0, 340.0)
	(790.0, 400.0)
	(690.0, 360.0)
	(915.0, 440.0)
]
g_encore_ready = 0

script create_encore_confirmation_menu 
	disable_pause
	menu_font = fontgrid_title_a1
	menu_pos = (640.0, 480.0)
	ec_eh = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
	]
	new_menu scrollid = ec_scroll vmenuid = ec_vmenu menu_pos = <menu_pos> event_handlers = <ec_eh> spacing = -45
	LaunchEvent \{Type = unfocus
		target = ec_vmenu}
	CreateScreenElement \{Type = ContainerElement
		id = ec_container
		parent = root_window
		Pos = (0.0, 0.0)}
	offwhite = [223 223 223 255]
	menu_z = 100
	CreateScreenElement \{Type = SpriteElement
		id = encore_gradient
		parent = ec_container
		texture = gradient_128
		rgba = [
			0
			0
			0
			180
		]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = -1}
	encore_text = qs(0xd62f03b8)
	StringLength string = <encore_text>
	StringToCharArray string = <encore_text>
	space_between = (50.0, 0.0)
	i = 0
	begin
	formatText checksumName = encore_id 'ec_encore_text_%d' d = (<i> + 1)
	displayText {
		id = <encore_id>
		parent = ec_container
		Pos = <Pos>
		Scale = 2.25
		text = (<char_array> [<i>])
		just = [center center]
		rgba = [130 170 200 255]
		font = fontgrid_title_a1
		noshadow
		z = <menu_z>
	}
	GetScreenElementDims id = <id>
	if (<i> = 0)
		<Pos> = ((660.0, 165.0) - (((<str_len> - 1) * <width>) * (0.5, 0.0)))
		SetScreenElementProps id = <id> Pos = <Pos>
	endif
	<Pos> = (<Pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <str_len>
	SpawnScriptNow ec_raise_headline params = {str_len = <str_len>}
	displaySprite \{id = ec_flash
		parent = ec_container
		tex = Encore_Flash
		alpha = 0
		dims = (128.0, 128.0)
		just = [
			center
			center
		]}
	arm_pos = (270.0, 300.0)
	arm_add = (80.0, 0.0)
	arm_z = [1 3 5 7 8 6 4 2]
	arm_index = 0
	begin
	formatText checksumName = arm_id 'ec_arm_0%d' d = <arm_index>
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_tex 'Encore_Arm_0%d' d = <rand_arm>
	displaySprite id = <arm_id> parent = ec_container tex = <arm_tex> Pos = <arm_pos> dims = (180.0, 340.0) z = (<menu_z> + 10 + (<arm_z> [<arm_index>]))
	if (<rand_arm> = 4 || <rand_arm> = 8)
		<arm_id> :SetTags higher = 1
	else
		<arm_id> :SetTags higher = 0
	endif
	<arm_pos> = (<arm_pos> + <arm_add>)
	<arm_index> = (<arm_index> + 1)
	repeat 8
	SpawnScriptNow \{ec_raise_fists}
	SpawnScriptNow \{ec_flashes}
	stars = ($player1_status.stars)
	cash = ($player1_status.new_cash)
	Change \{structurename = player1_status
		new_cash = 0}
	if ($game_mode = gh4_p2_career)
		score = ($player1_status.score + $player2_status.score)
	else
		score = ($player1_status.score)
	endif
	if (<stars> < 3)
		<stars> = 3
	endif
	CastToInteger \{score}
	formatText TextName = scoretext qs(0x76b3fda7) d = <score> usecommas
	formatText TextName = moneytext qs(0xcb2f9062) d = <cash> usecommas
	textscale = 0.8
	starscale = 0.125
	displayText {
		id = ec_scoretext
		font = fontgrid_text_a6
		parent = ec_container
		rgba = [223 223 223 255]
		Pos = (20000.0, 20000.0)
		Scale = 10
		text = <scoretext>
		just = [right center]
		z = (<menu_z> + 20)
	}
	i = 0
	begin
	formatText checksumName = starchecksum 'star_id0%d' d = <i>
	GetRandomValue \{a = 0
		b = 360
		Name = rot}
	displaySprite {
		parent = ec_container
		id = <starchecksum>
		Pos = (20000.0, 20000.0)
		tex = Encore_Star_Outline
		just = [center center]
		Scale = 10
		rgba = [223 223 223 255]
		rot_angle = <rot>
		z = (<menu_z> + 20)
		relative_scale
	}
	formatText checksumName = starchecksum 'star_id0%d_2' d = <i>
	displaySprite {
		parent = ec_container
		id = <starchecksum>
		Pos = (20000.0, 20000.0)
		tex = Encore_Star_Outline
		just = [center center]
		Scale = 10
		rgba = [110 30 20 255]
		rot_angle = <rot>
		z = (<menu_z> + 21)
		relative_scale
	}
	<i> = (<i> + 1)
	repeat <stars>
	displayText {
		id = ec_moneytext
		font = fontgrid_text_a6
		parent = ec_container
		rgba = [223 223 223 255]
		Pos = (20000.0, 20000.0)
		Scale = 10
		text = <moneytext>
		just = [left center]
		z = (<menu_z> + 20)
	}
	SetScreenElementProps \{id = ec_scoretext
		Pos = (520.0, 220.0)
		alpha = 0}
	legacydoscreenelementmorph id = ec_scoretext Scale = <textscale> time = 0.5 alpha = 1
	SoundEvent \{event = GH3_Score_FlyIn}
	SetScreenElementProps \{id = ec_moneytext
		Pos = (760.0, 220.0)
		alpha = 0}
	legacydoscreenelementmorph id = ec_moneytext Scale = <textscale> time = 0.5 alpha = 1
	SoundEvent \{event = GH3_Cash_FlyIn}
	SoundEvent \{event = GH3_Cash_FlyIn_Hit}
	star_add = (40.0, 0.0)
	star_pos = (600.0, 220.0)
	switch <stars>
		case 4
		<star_pos> = (580.0, 220.0)
		case 5
		<star_pos> = (560.0, 220.0)
	endswitch
	<i> = 0
	begin
	SoundEvent \{event = GH3_Star_FlyIn}
	formatText checksumName = starchecksum 'star_id0%d' d = <i>
	SetScreenElementProps id = <starchecksum> Pos = <star_pos>
	legacydoscreenelementmorph id = <starchecksum> Scale = <starscale> time = 0.25 relative_scale
	formatText checksumName = starchecksum 'star_id0%d_2' d = <i>
	SetScreenElementProps id = <starchecksum> Pos = <star_pos>
	legacydoscreenelementmorph id = <starchecksum> Scale = (<starscale> - 0.025) time = 0.25 relative_scale
	<star_pos> = (<star_pos> + <star_add>)
	<i> = (<i> + 1)
	repeat <stars>
	displaySprite parent = ec_container id = ec_crowd_1 Pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [center center] Scale = 2 z = (<menu_z> + 50)
	displaySprite parent = ec_container id = ec_crowd_2 Pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [center center] Scale = 2 z = (<menu_z> + 50)
	displaySprite parent = ec_container id = ec_crowd_3 Pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [center center] Scale = 2 z = (<menu_z> + 50)
	displaySprite parent = ec_container id = ec_crowd_4 Pos = (-2000.0, -2000.0) tex = Encore_Balloon just = [center center] Scale = 2 z = (<menu_z> + 50)
	displayText id = ec_crowd_text_1 parent = ec_crowd_1 text = qs(0x70c28c27) Pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] Scale = 0.8 noshadow
	displayText id = ec_crowd_text_2 parent = ec_crowd_2 text = qs(0x70c28c27) Pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] Scale = 0.8 noshadow
	displayText id = ec_crowd_text_3 parent = ec_crowd_3 text = qs(0x70c28c27) Pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] Scale = 0.8 noshadow
	displayText id = ec_crowd_text_4 parent = ec_crowd_4 text = qs(0x70c28c27) Pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] Scale = 0.8 noshadow
	SpawnScriptNow \{encore_crowd_shout}
	Change \{g_encore_ready = 1}
	displaySprite parent = ec_container id = options_bg_1 tex = Encore_Menu_BG Pos = (640.0, 550.0) dims = (384.0, 192.0) just = [center center] z = (<menu_z> + 50)
	set_focus_color \{rgba = [
			110
			30
			20
			255
		]}
	set_unfocus_color \{rgba = [
			135
			170
			200
			255
		]}
	if NOT GotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	largest_width = 0
	CreateScreenElement \{Type = ContainerElement
		parent = ec_vmenu
		dims = (0.0, 100.0)
		event_handlers = [
			{
				focus
				ec_yes_highlight_focus
				params = {
					id = ec_play_encore
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = ec_play_encore
				}
			}
			{
				pad_choose
				encore_play
			}
		]}
	CreateScreenElement {
		Type = TextElement
		id = ec_play_encore
		parent = <id>
		font = fontgrid_title_a1
		text = qs(0xc29d34aa)
		Scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [center center]
		z_priority = (<menu_z> + 51)
	}
	SetScreenElementProps {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	GetScreenElementDims id = <id>
	if (<width> > <largest_width>)
		<largest_width> = <width>
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = ec_vmenu
		dims = (0.0, 100.0)
		event_handlers = [
			{
				focus
				ec_no_highlight_focus
				params = {
					id = ec_leave_encore
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = ec_leave_encore
				}
			}
			{
				pad_choose
				encore_leave
			}
		]}
	CreateScreenElement {
		Type = TextElement
		id = ec_leave_encore
		parent = <id>
		font = fontgrid_title_a1
		text = qs(0x5ee28ed9)
		Scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [center center]
		z_priority = (<menu_z> + 51)
	}
	SetScreenElementProps {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	GetScreenElementDims id = <id>
	if (<width> > <largest_width>)
		<largest_width> = <width>
	endif
	GetScreenElementDims \{id = options_bg_1}
	SetScreenElementProps id = options_bg_1 dims = (<largest_width> * (1.0, 0.0) + (150.0, 0.0) + (0.0, 192.0))
	displaySprite id = ec_hi_left parent = ec_container tex = Encore_Menu_Bookend rgba = [110 30 20 255] z = (<menu_z> + 51)
	displaySprite id = ec_hi_right parent = ec_container tex = Encore_Menu_Bookend rgba = [110 30 20 255] z = (<menu_z> + 51)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	ec_yes_highlight_focus \{id = ec_play_encore}
	if ((($is_network_game = 1) && (IsHost)) || ($is_network_game = 0))
		LaunchEvent \{Type = focus
			target = ec_vmenu}
	endif
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	SetGlobalTags <gig_name> params = {started = 1 encore_unlocked = 1}
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<menu_z> + 100) all_buttons
endscript

script destroy_encore_confirmation_menu 
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = ec_flashes}
	KillSpawnedScript \{Name = ec_raise_fists}
	Change \{g_encore_ready = 0}
	destroy_menu \{menu_id = ec_scroll}
	destroy_menu \{menu_id = ec_container}
	destroy_pause_menu_frame
	KillSpawnedScript \{Name = encore_crowd_shout}
endscript

script ec_yes_highlight_focus 
	retail_menu_focus <...>
	GetScreenElementDims id = <id>
	SetScreenElementProps id = ec_hi_left Pos = ((630.0, 500.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
	SetScreenElementProps id = ec_hi_right Pos = ((650.0, 500.0) + (<width> * (0.5, 0.0))) just = [left top]
endscript

script ec_no_highlight_focus 
	retail_menu_focus <...>
	GetScreenElementDims id = <id>
	SetScreenElementProps id = ec_hi_left Pos = ((630.0, 560.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
	SetScreenElementProps id = ec_hi_right Pos = ((650.0, 560.0) + (<width> * (0.5, 0.0))) just = [left top]
endscript

script encore_play 

	start_encore
	Change \{gameplay_loading_transition = 1}
	Change \{gameplay_restart_song = 1}
	generic_menu_pad_choose_sound
	generic_event_back \{nosound
		state = Uistate_gameplay}
endscript

script encore_leave 
	if ($g_encore_ready)
		kill_gem_scroller
		if ($is_network_game = 0)
			SpawnScriptNow \{xenon_singleplayer_session_complete_uninit}
		elseif (($is_network_game = 1) && (IsHost))
			SendStructure \{callback = net_career_goto_band_lobby
				data_to_send = {
					from_encore = 1
				}}
			net_career_goto_band_lobby
			return
		endif

		ui_event \{event = menu_change
			data = {
				state = uistate_song_breakdown
				end_of_setlist_transition
				leave_encore = 1
			}}
	endif
endscript

script encore_crowd_shout 
	shout_text = [
		qs(0x3f8781f4)
		qs(0x09da682e)
		qs(0x603a6d9a)
		qs(0x1d96fd5f)
		qs(0x70c28c27)
		qs(0xf72a1446)
	]
	GetArraySize <shout_text>
	begin
	i = 0
	begin
	formatText checksumName = balloon_id 'ec_crowd_%d' d = <i>
	formatText checksumName = balloon_text 'ec_crowd_text_%d' d = <i>
	side = Random (@ 1 @ 2 )
	rand = Random (@ 0 @ 1 @ 2 @ 3 )
	if (<side> = 1)
		balloon_array = g_ec_balloons_pos_left
	else
		balloon_array = g_ec_balloons_pos_right
	endif
	GetRandomValue a = 0 b = (<array_Size> - 1) Name = rand_text integer
	if ScreenElementExists id = <balloon_id>
		SetScreenElementProps id = <balloon_id> Pos = ($<balloon_array> [<rand>])
		if ScreenElementExists id = <balloon_text>
			SetScreenElementProps id = <balloon_text> text = (<shout_text> [<rand_text>]) Scale = 1
			fit_text_in_rectangle id = <balloon_text> only_if_larger_x = 1 dims = (90.0, 50.0) keep_ar = 1
		endif
		legacydoscreenelementmorph id = <balloon_id> alpha = 1 time = 0.125
		Wait \{0.5
			Seconds}
		legacydoscreenelementmorph id = <balloon_id> alpha = 0 time = 0.5
		Wait \{0.5
			Seconds}
	endif
	Mod a = <i> b = 2
	if (<Mod> = 0)
		Wait \{1
			Second}
	endif
	<i> = (<i> + 1)
	repeat 4
	repeat
endscript

script ec_raise_fists 
	begin
	i = 0
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_id 'ec_arm_0%d' d = <i>
	GetScreenElementProps id = <arm_id>
	if ScreenElementExists id = <arm_id>
		<arm_id> :GetTags
		<arm_id> :SetTags Pos = <Pos> chance = <rand_arm>
		if (<higher> = 1)
			up_pos = (<Pos> - (0.0, 80.0))
		else
			up_pos = (<Pos> - (0.0, 50.0))
		endif
		legacydoscreenelementmorph id = <arm_id> Pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	<i> = (<i> + 1)
	repeat 8
	Wait \{0.3
		Seconds}
	<i> = 0
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	formatText checksumName = arm_id 'ec_arm_0%d' d = <i>
	if ScreenElementExists id = <arm_id>
		<arm_id> :GetTags
		legacydoscreenelementmorph id = <arm_id> Pos = (<Pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	<i> = (<i> + 1)
	repeat 8
	Wait \{0.3
		Seconds}
	repeat
endscript

script ec_raise_headline 
	begin
	i = 0
	begin
	GetRandomValue \{a = 0.05
		b = 0.15
		Name = wait_time}
	formatText checksumName = text_id 'ec_encore_text_%d' d = (<i> + 1)
	if ScreenElementExists id = <text_id>
		GetScreenElementProps id = <text_id>
		<text_id> :GetTags
		<text_id> :SetTags Pos = <Pos>
		legacydoscreenelementmorph id = <text_id> Pos = (<Pos> - (0.0, 22.0)) time = <wait_time>
	endif
	<i> = (<i> + 1)
	repeat <str_len>
	Wait \{0.15
		Seconds}
	<i> = 0
	begin
	GetRandomValue \{a = 0.05
		b = 0.15
		Name = wait_time}
	formatText checksumName = text_id 'ec_encore_text_%d' d = (<i> + 1)
	if ScreenElementExists id = <text_id>
		<text_id> :GetTags
		legacydoscreenelementmorph id = <text_id> Pos = <Pos> time = (<wait_time> * 2.0)
	endif
	<i> = (<i> + 1)
	repeat <str_len>
	Wait \{0.15
		Seconds}
	repeat
endscript

script ec_flashes 
	begin
	GetRandomValue \{a = 400
		b = 900
		Name = x_pos}
	GetRandomValue \{a = 400
		b = 500
		Name = y_pos}
	GetRandomValue \{a = 96
		b = 256
		Name = rand_dim}
	GetRandomValue \{a = 0
		b = 360
		Name = rand_rot}
	Pos = (<x_pos> * (1.0, 0.0) + <y_pos> * (0.0, 1.0))
	dims = (<rand_dim> * (1.0, 0.0) + <rand_dim> * (0.0, 1.0))
	if ScreenElementExists \{id = ec_flash}
		SetScreenElementProps id = ec_flash Pos = <Pos> dims = <dims> rot_angle = <rand_rot> alpha = 1
		ec_flash :legacydomorph alpha = 0 dims = (<dims> * 0.5) time = 0.2
		ec_flash :legacydomorph dims = <dims>
	endif
	repeat
endscript

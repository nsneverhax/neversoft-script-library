g_rockout_show_in_debug_menu = 1
g_initial_ball_pos_l = (235.0, 300.0)
g_initial_ball_pos_r = (977.0, 300.0)
g_brick_width = 32
g_brick_height = 64
g_brick_collision_offset = (16.0, 32.0)
g_brick_spacing = 14
g_initial_brick_pos = (517.0, 160.0)
g_num_columns = 5
g_num_rows = 6
g_initial_paddle_pos_left = (200.0, 118.0)
g_initial_paddle_pos_right = (1012.0, 118.0)
g_paddle_width = 24
g_paddle_height = 91
g_paddle_collision_offset = (19.0, 53.0)
g_player_lives = 3
g_total_bricks = 40
g_bricks_hit = 0
g_launched = 0
g_launch_collision = 1
g_current_ball_owner = 1
g_points_per_brick = 100
g_points_per_goal = 1000
g_points_multiplier = 0
g_player1_score = 0
g_player2_score = 0
g_player1_goals = 0
g_player2_goals = 0
g_player1_already_strummed = 0
g_player2_already_strummed = 0
g_total_score_popups = 5
g_p1_ai_active = 0
g_p2_ai_active = 0
g_rockout_controller_1 = guitar
g_rockout_controller_2 = guitar
g_turn_on_opponent_cheat = 0
g_brick_colors = [
	{
		Color = [
			60
			180
			90
			255
		]
	}
	{
		Color = [
			255
			75
			85
			255
		]
	}
	{
		Color = [
			210
			200
			0
			255
		]
	}
	{
		Color = [
			60
			155
			220
			255
		]
	}
	{
		Color = [
			245
			145
			40
			255
		]
	}
]
g_drum_colors = [
	{
		Color = [
			255
			75
			85
			255
		]
	}
	{
		Color = [
			210
			200
			0
			255
		]
	}
	{
		Color = [
			60
			155
			220
			255
		]
	}
	{
		Color = [
			245
			145
			40
			255
		]
	}
	{
		Color = [
			60
			180
			90
			255
		]
	}
]
g_battle_paddle_toggle_p1 = [
	0
	0
	0
	0
	0
]
g_battle_paddle_toggle_p2 = [
	0
	0
	0
	0
	0
]
g_battle_paddle_used_p1 = [
	0
	0
	0
	0
	0
]
g_battle_paddle_used_p2 = [
	0
	0
	0
	0
	0
]
g_current_strum_sound = Single_Player_Bad_Note_Guitar

script create_rockout_initial_popup 
	create_menu_backdrop \{texture = rockout_bg}
	create_popup_warning_menu \{no_background
		title = qs(0xa83061c6)
		textblock = {
			text = qs(0x9f80ee4c)
		}
		options = [
			{
				func = {
					create_rockout_game
				}
				func_params = {
					num_players = 1
				}
				text = qs(0x22ee76e7)
			}
			{
				func = {
					create_rockout_game
				}
				func_params = {
					num_players = 2
				}
				text = qs(0x09c32524)
			}
			{
				func = {
					create_rockout_game
				}
				func_params = {
					num_players = 0
				}
				text = qs(0x5fb58b89)
			}
		]}
endscript

script create_rockout_game \{num_players = 1}
	destroy_popup_warning_menu
	menu_music_off
	create_menu_backdrop \{texture = rockout_bg}
	creatematerial \{Name = ball_particle_01
		template = immediatemode_ui
		technique = ui_col_tex_2d
		BlendMode = add
		MaterialProps = [
			{
				Name = m_psPass0MaterialColor
				vectorproperty = [
					1.0
					1.0
					1.0
					1.0
				]
			}
			{
				Name = m_samppass0diffuse
				textureproperty = ph_firepuffs
			}
		]}
	creatematerial \{Name = material_brickexplode
		template = immediatemode_ui
		technique = ui_col_tex_2d
		BlendMode = add
		MaterialProps = [
			{
				Name = m_psPass0MaterialColor
				vectorproperty = [
					1.0
					1.0
					1.0
					1.0
				]
			}
			{
				Name = m_samppass0diffuse
				textureproperty = jow_buttonstar01
			}
		]}
	CreateScreenElement \{Type = ContainerElement
		id = rockout_container
		parent = root_window
		Pos = (0.0, 0.0)
		event_handlers = [
			{
				pad_start
				rockout_pause_game
			}
		]}
	LaunchEvent \{Type = focus
		target = rockout_container}
	rockout_container :SetTags \{current_particle = 0
		current_brick = 0
		max_bricks = 20}
	CreateScreenElement \{Type = SpriteElement
		id = foreground
		parent = rockout_container
		texture = rockout_fg
		dims = (1280.0, 720.0)
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 30}
	CreateScreenElement {
		Type = physicselement
		id = ball_container
		parent = rockout_container
		Pos = ($g_initial_ball_pos)
		mass = 10.0
		center = (31.0, 31.0)
		radius = 22.630001
		elasticity = 1.0
	}
	ball_container :SetTags \{fireball_active = 0}
	CreateScreenElement \{Type = SpriteElement
		id = ball
		parent = ball_container
		texture = rockout_ball
		dims = (64.0, 64.0)
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 30}
	formatText TextName = score_text qs(0x21379b76) n = ($g_player1_score)
	CreateScreenElement {
		Type = TextElement
		id = p1_score
		parent = rockout_container
		rgba = (($g_menu_colors).p1_orangey)
		font = debug
		Pos = (250.0, 50.0)
		text = <score_text>
		just = [left top]
		z_priority = 31
	}
	formatText TextName = score_text qs(0x21379b76) n = ($g_player2_score)
	CreateScreenElement {
		Type = TextElement
		id = p2_score
		parent = rockout_container
		rgba = (($g_menu_colors).p2_purpley)
		font = debug
		Pos = (850.0, 50.0)
		text = <score_text>
		just = [left top]
		z_priority = 31
	}
	CreateScreenElement {
		Type = TextElement
		id = p1_lives
		parent = rockout_container
		rgba = (($g_menu_colors).p1_orangey)
		font = debug
		Pos = (250.0, 100.0)
		text = qs(0xdf1ee302)
		just = [left top]
		z_priority = 31
	}
	CreateScreenElement {
		Type = TextElement
		id = p2_lives
		parent = rockout_container
		rgba = (($g_menu_colors).p2_purpley)
		font = debug
		Pos = (850.0, 100.0)
		text = qs(0xdf1ee302)
		just = [left top]
		z_priority = 31
	}
	rockout_create_battle_paddles
	rockout_initialize_rockout
	SpawnScriptNow \{rockout_check_paddle_collisions_left
		params = {
			id = ball_container
		}}
	SpawnScriptNow \{rockout_check_paddle_collisions_right
		params = {
			id = ball_container
		}}
	SpawnScriptNow \{rockout_check_screen_collisions
		params = {
			id = ball_container
		}}
	switch <num_players>
		case 0
		SpawnScriptNow \{rockout_ai
			params = {
				Player = 1
			}}
		SpawnScriptNow \{rockout_ai
			params = {
				Player = 2
			}}
		case 1
		SpawnScriptNow \{rockout_ai
			params = {
				Player = 2
			}}
	endswitch
	rockout_start_paddle_controls
	setplayerinfo \{1
		jam_instrument = 0}
	setsoundbussparams \{guitar_jammode = {
			vol = 0
		}}
	setsoundbussparams \{jammode_rhythmguitar = {
			vol = 0
		}}
	setsoundbussparams \{jammode_leadguitar = {
			vol = 0
		}}
	setsoundbussparams \{jammode_bass = {
			vol = 0
		}}
	jam_init_scales
	destroyplayerserverjaminput \{Player = 1}
	add_user_control_helper \{text = qs(0x67d9c56d)
		button = start
		z = 100}
endscript

script destroy_rockout_game 
	KillSpawnedScript \{Name = rockout_initialize_ball}
	KillSpawnedScript \{Name = rockout_check_brick_collisions}
	KillSpawnedScript \{Name = rockout_check_screen_collisions}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_rockout_p1}
	destroy_menu \{menu_id = scrolling_rockout_p2}
	destroy_menu_backdrop
	if ScreenElementExists \{id = rockout_container}
		DestroyScreenElement \{id = rockout_container}
	endif
	KillSpawnedScript \{Name = rockout_watch_buttons}
	KillSpawnedScript \{Name = rockout_button_watcher}
	KillSpawnedScript \{Name = rockout_brick_spawner}
	KillSpawnedScript \{Name = rockout_fall_brick}
	KillSpawnedScript \{Name = rockout_check_paddle_collisions_right}
	KillSpawnedScript \{Name = rockout_check_paddle_collisions_left}
	KillSpawnedScript \{Name = rockout_do_speaker_punch}
	KillSpawnedScript \{Name = rockout_ai}
	KillSpawnedScript \{Name = rockout_ball_debug}
	KillSpawnedScript \{Name = rockout_debug_collision}
	KillSpawnedScript \{Name = rockout_guitar_strum}
	KillSpawnedScript \{Name = rockout_kill_strum}
	KillSpawnedScript \{Name = rockout_drum_hit}
	KillSpawnedScript \{Name = rockout_kill_drum_hit}
	KillSpawnedScript \{Name = rockout_show_goal_popup}
	KillSpawnedScript \{Name = rockout_show_score_popup}
	Change \{g_p1_ai_active = 0}
	Change \{g_p2_ai_active = 0}
	Change \{g_player1_already_strummed = 0}
	Change \{g_player2_already_strummed = 0}
	Change \{g_battle_paddle_toggle_p1 = [
			0
			0
			0
			0
			0
		]}
	Change \{g_battle_paddle_toggle_p2 = [
			0
			0
			0
			0
			0
		]}
	Change \{g_battle_paddle_used_p1 = [
			0
			0
			0
			0
			0
		]}
	Change \{g_battle_paddle_used_p2 = [
			0
			0
			0
			0
			0
		]}
	destroymaterial \{Name = ball_particle_01}
	destroymaterial \{Name = material_brickexplode}
	Destroy2DParticleSystem \{id = ball_particles}
	Destroy2DParticleSystem \{id = fireball_particles}
	Destroy2DParticleSystem \{id = fireball_explosion}
	KillSpawnedScript \{Name = rockout_fireball_explosion}
	KillSpawnedScript \{Name = rockout_create_brick_particles}
	KillSpawnedScript \{Name = rockout_start_controls}
	rockout_cleanup_brick_particles
	end_song
	unload_songqpak
	SpawnScriptNow \{menu_music_on}
endscript

script rockout_start_paddle_controls 
	if ($g_p1_ai_active = 0)
		if IsGuitarController \{controller = 0}
			spawnscript \{rockout_start_controls
				params = {
					Type = guitar
				}}
			Change \{g_rockout_controller_1 = guitar}
		elseif isdrumcontroller \{controller = 0}
			spawnscript \{rockout_start_controls
				params = {
					Type = drums
				}}
			Change \{g_rockout_controller_1 = drums}
		else
			spawnscript \{rockout_start_controls}
			Change \{g_rockout_controller_1 = notguitar}
		endif
	endif
	if ($g_p2_ai_active = 0)
		if IsGuitarController \{controller = 1}
			spawnscript \{rockout_start_controls
				params = {
					Type = guitar
					Player = 2
					controller = 1
				}}
			Change \{g_rockout_controller_2 = guitar}
		elseif isdrumcontroller \{controller = 1}
			spawnscript \{rockout_start_controls
				params = {
					Type = drums
					Player = 2
					controller = 1
				}}
			Change \{g_rockout_controller_2 = drums}
		else
			spawnscript \{rockout_start_controls
				params = {
					Player = 2
					controller = 1
				}}
			Change \{g_rockout_controller_2 = notguitar}
		endif
	endif
endscript

script rockout_create_battle_paddles 
	CreateScreenElement \{Type = ContainerElement
		id = paddle_container_p1
		parent = rockout_container
		Pos = (0.0, 0.0)
		exclusive_device = 0}
	paddle_container_p1 :SetTags \{score = 0
		lives = 0
		goals = 0}
	CreateScreenElement \{Type = ContainerElement
		id = paddle_container_p2
		parent = rockout_container
		Pos = (0.0, 0.0)
		exclusive_device = 1}
	paddle_container_p2 :SetTags \{score = 0
		lives = 0
		goals = 0}
	<y> = 0
	begin
	formatText checksumName = paddle_id 'paddle_p1_%y' y = <y>
	<new_pos> = (($g_initial_paddle_pos_left) + ((<y> * (95)) * (0.0, 1.0)))
	CreateScreenElement {
		Type = SpriteElement
		id = <paddle_id>
		parent = paddle_container_p1
		texture = rockout_paddle
		dims = (64.0, 198.0)
		Pos = <new_pos>
		just = [left top]
		z_priority = 30
		alpha = 0.25
	}
	<y> = (<y> + 1)
	repeat 5
	<y> = 0
	begin
	formatText checksumName = paddle_id 'paddle_p2_%y' y = <y>
	<new_pos> = (($g_initial_paddle_pos_right) + ((<y> * (95)) * (0.0, 1.0)))
	CreateScreenElement {
		Type = SpriteElement
		id = <paddle_id>
		parent = paddle_container_p2
		texture = rockout_paddle
		dims = (64.0, 198.0)
		Pos = <new_pos>
		just = [left top]
		z_priority = 30
		alpha = 0.25
	}
	<y> = (<y> + 1)
	repeat 5
endscript

script rockout_initialize_values 
	Change \{g_bricks_hit = 0}
	Change \{g_launched = 0}
	Change \{g_launch_collision = 1}
	Change \{g_current_ball_owner = 1}
	Change \{g_points_multiplier = 0}
	Change \{g_player1_score = 0}
	Change \{g_player2_score = 0}
	Change \{g_player1_goals = 0}
	Change \{g_player2_goals = 0}
	Change \{g_player1_already_strummed = 0}
	Change \{g_player2_already_strummed = 0}
	Change \{g_rockout_controller_1 = guitar}
	Change \{g_rockout_controller_2 = guitar}
	Change \{g_battle_paddle_toggle_p1 = [
			0
			0
			0
			0
			0
		]}
	Change \{g_battle_paddle_toggle_p2 = [
			0
			0
			0
			0
			0
		]}
	Change \{g_battle_paddle_used_p1 = [
			0
			0
			0
			0
			0
		]}
	Change \{g_battle_paddle_used_p2 = [
			0
			0
			0
			0
			0
		]}
	ball_container :SetTags \{fireball_active = 0}
	rockout_container :SetTags \{current_particle = 0
		current_brick = 0
		max_bricks = 20}
endscript

script rockout_restart_game 
	UnPauseGame
	destroy_popup_warning_menu
	create_menu_backdrop \{texture = rockout_bg}
	KillSpawnedScript \{Name = rockout_brick_spawner}
	Destroy2DParticleSystem \{id = ball_particles}
	Destroy2DParticleSystem \{id = fireball_particles}
	Destroy2DParticleSystem \{id = fireball_explosion}
	KillSpawnedScript \{Name = rockout_fireball_explosion}
	KillSpawnedScript \{Name = rockout_create_brick_particles}
	KillSpawnedScript \{Name = rockout_check_screen_collisions}
	rockout_cleanup_brick_particles
	rockout_kill_bricks
	unload_songqpak
	spawnscript \{rockout_check_screen_collisions
		params = {
			id = ball_container
		}}
	rockout_initialize_rockout
endscript

script rockout_paddle_highlight \{unhighlight = 0
		with_strum = 0
		Player = 1
		no_pos_morph = 0}
	formatText checksumName = paddle_id 'paddle_p%p_%y' p = <Player> y = <paddle>
	GetScreenElementProps id = <paddle_id>
	if (<unhighlight> = 0)
		if (<with_strum> = 0)
			SetScreenElementProps id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).Color)
		else
			SetScreenElementProps id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).Color) alpha = 1.0
			SpawnScriptNow rockout_do_speaker_punch params = {paddle = <paddle> Player = <Player>}
		endif
	else
		if (<no_pos_morph> = 1)
			SetScreenElementProps id = <paddle_id> rgba = [255 255 255 255] alpha = 0.25
		else
			if (<Player> = 1)
				<new_pos> = (($g_initial_paddle_pos_left) + ((<paddle> * (95)) * (0.0, 1.0)))
			else
				<new_pos> = (($g_initial_paddle_pos_right) + ((<paddle> * (95)) * (0.0, 1.0)))
			endif
			formatText checksumName = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <Player>
			if ($<paddle_toggle> [<paddle>] = 1)
				SetScreenElementProps id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).Color) alpha = 0.25 Pos = <new_pos>
			else
				SetScreenElementProps id = <paddle_id> rgba = [255 255 255 255] alpha = 0.25 Pos = <new_pos>
			endif
		endif
	endif
endscript

script rockout_do_speaker_punch \{Player = 1
		time = 0.1}
	formatText checksumName = paddle_id 'paddle_p%p_%y' p = <Player> y = <paddle>
	GetScreenElementProps id = <paddle_id>
	<initial_pos> = <Pos>
	if (<Player> = 1)
		<dist> = 30
	else
		<dist> = -30
	endif
	SetScreenElementProps id = <paddle_id> Pos = (<Pos> + (<dist> * (1.0, 0.0))) time = <time> motion = ease_in
	Wait <time> Seconds
	SetScreenElementProps id = <paddle_id> Pos = (<initial_pos>) time = (<time> * 2.0) motion = ease_out
	formatText checksumName = already_strummed 'g_player%p_already_strummed' p = <Player>
	Change GlobalName = <already_strummed> NewValue = 0
endscript

script rockout_drum_hit \{button = 0
		Player = 1}
	if (<button> < 0 || <button> > 4)
		return
	endif
	formatText checksumName = button_script_id 'paddle_%p_%b_script' p = <Player> b = <button>
	formatText checksumName = already_strummed 'g_player%p_already_strummed' p = <Player>
	if ($<already_strummed>)
		return
	else
		Change GlobalName = <already_strummed> NewValue = 1
		KillSpawnedScript id = <button_script_id>
	endif
	rockout_launch_ball Player = <Player>
	formatText checksumName = paddle_used 'g_battle_paddle_used_p%p' p = <Player>
	<i> = 0
	begin
	SetArrayElement ArrayName = <paddle_used> globalarray index = <i> NewValue = 0
	<i> = (<i> + 1)
	repeat 5
	formatText checksumName = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <Player>
	if (($<paddle_used> [<button>]) = 0)
		rockout_paddle_highlight paddle = <button> with_strum = 1 Player = <Player>
		SetArrayElement ArrayName = <paddle_toggle> globalarray index = <button> NewValue = 1
		SetArrayElement ArrayName = <paddle_used> globalarray index = <button> NewValue = 1
	endif
	Change GlobalName = <already_strummed> NewValue = 0
	spawnscript rockout_kill_drum_hit params = {<...>} id = <button_script_id>
endscript

script rockout_kill_drum_hit \{time = 0.5
		Player = 1}
	Wait <time> Seconds
	SetArrayElement ArrayName = <paddle_toggle> globalarray index = <button> NewValue = 0
	rockout_clear_paddle_highlights <...>
endscript

script rockout_guitar_strum \{Player = 1}
	formatText checksumName = already_strummed 'g_player%p_already_strummed' p = <Player>
	if ($<already_strummed>)
		return
	else
		Change GlobalName = <already_strummed> NewValue = 1
		rockout_clear_paddle_highlights <...>
	endif
	rockout_launch_ball Player = <Player>
	formatText checksumName = paddle_used 'g_battle_paddle_used_p%p' p = <Player>
	<i> = 0
	begin
	SetArrayElement ArrayName = <paddle_used> globalarray index = <i> NewValue = 0
	<i> = (<i> + 1)
	repeat 5
	<ho_time> = 0.5
	<elapsed_time> = 0
	rockout_strum_sound Player = <Player>
	if (<bad_note> = 0)
		if (<open_note> = 1)
			Change GlobalName = <already_strummed> NewValue = 0
		endif
		formatText checksumName = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <Player>
		begin
		<i> = 0
		begin
		if (($<paddle_toggle> [<i>]) = 1)
			if (($<paddle_used> [<i>]) = 0)
				rockout_paddle_highlight paddle = <i> with_strum = 1 Player = <Player>
				SetArrayElement ArrayName = <paddle_used> globalarray index = <i> NewValue = 1
				formatText checksumName = button_script_id 'paddle_%p_%b' p = <Player> b = <i>
				KillSpawnedScript id = <button_script_id>
				spawnscript rockout_kill_strum params = {Player = <Player>} id = <button_script_id>
			endif
		endif
		<i> = (<i> + 1)
		repeat 5
		GetDeltaTime
		<elapsed_time> = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > <ho_time>)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	else
		Change GlobalName = <already_strummed> NewValue = 0
	endif
endscript

script rockout_kill_strum \{time = 0.8
		Player = 1}
	Wait <time> Seconds
	rockout_clear_paddle_highlights <...>
endscript

script rockout_clear_paddle_highlights \{button = -1}
	if NOT (<button> < 0 || <button> > 4)
		rockout_paddle_highlight paddle = <button> unhighlight = 1 Player = <Player>
	else
		<i> = 0
		begin
		rockout_paddle_highlight paddle = <i> unhighlight = 1 Player = <Player>
		<i> = (<i> + 1)
		repeat 5
	endif
endscript

script rockout_strum_sound \{Player = 1}
	if issoundplaying ($g_current_strum_sound)
		stopsound ($g_current_strum_sound) fade_type = linear fade_time = $jam_fade_time
	endif
	<rhythm> = 0
	<lead> = 1
	<player_status> = ($0x2994109a [<Player>])
	GetHeldPattern controller = (<Player> - 1) nobrokenstring
	formatText checksumName = player_ai 'g_p%p_ai_active' p = <Player>
	formatText checksumName = player_pad 'g_battle_paddle_toggle_p%p' p = <Player>
	if ($<player_ai>)
		<hold_pattern> = 0
		<check_pattern> = 65536
		<i> = 0
		begin
		if ($<player_pad> [<i>])
			<hold_pattern> = (<hold_pattern> + <check_pattern>)
		endif
		<check_pattern> = (<check_pattern> / 16)
		<i> = (<i> + 1)
		repeat 5
	endif
	switch <hold_pattern>
		case 65536
		<bad_note> = 0
		case 4096
		<bad_note> = 0
		case 256
		<bad_note> = 0
		case 16
		<bad_note> = 0
		case 1
		<bad_note> = 0
		case 69632
		<bad_note> = 0
		case 65792
		<bad_note> = 0
		case 65552
		<bad_note> = 0
		case 4352
		<bad_note> = 0
		case 4112
		<bad_note> = 0
		case 4097
		<bad_note> = 0
		case 272
		<bad_note> = 0
		case 257
		<bad_note> = 0
		case 17
		<bad_note> = 0
		case 69888
		<bad_note> = 0
		case 4368
		<bad_note> = 0
		case 273
		<bad_note> = 0
		case 1048576
		return \{bad_note = 0
			open_note = 1}
		default
		return \{bad_note = 1
			open_note = 0}
	endswitch
	return \{bad_note = 0
		open_note = 0}
endscript

script rockout_check_paddle_collisions_left 
	begin
	GetScreenElementProps id = <id>
	<i> = 0
	begin
	<n> = (<i>)
	if (($g_battle_paddle_toggle_p1) [<i>] = 1)
		formatText checksumName = paddle_id 'paddle_p1_%y' y = <i>
		GetScreenElementProps id = <paddle_id>
		if (<alpha> = 1)
			<tl> = (<Pos> + $g_paddle_collision_offset)
			<br> = (<tl> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
			begin
			<n> = (<n> + 1)
			if (<n> < 5)
				if (($g_battle_paddle_toggle_p1) [<n>] = 1)
					formatText checksumName = paddle_id 'paddle_p1_%y' y = <n>
					GetScreenElementProps id = <paddle_id>
					if (<alpha> = 1)
						<br> = ((<Pos> + $g_paddle_collision_offset) + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
					endif
				else
					break
				endif
			else
				break
			endif
			repeat
			rockout_check_ball_collision tl = <tl> br = <br>
			if (<collision>)
				if ($g_current_ball_owner = 2)
					rockout_set_ball_owner \{Player = 1}
					Change \{g_points_multiplier = 0}
				endif
				Change g_points_multiplier = (($g_points_multiplier) + 1)
				if ($g_points_multiplier > 4)
					rockout_activate_fireball
				else
					rockout_deactivate_fireball
				endif
				rockout_show_multiplier
				if ($g_launch_collision = 1)
					ball_container :applyforce \{Force = (250000.0, 0.0)}
					Change \{g_launch_collision = 0}
					Wait \{0.5
						Seconds}
				else
					GetScreenElementProps \{id = ball_container}
					if ((<linear_velocity> [1] < 10) && (<linear_velocity> [1] > -10))
						<Force> = ((0.0, 10000.0) * <linear_velocity> [1])
						ball_container :applyforce Force = <Force>
					endif
					ball_container :applyforce \{Force = (50000.0, 0.0)}
					Wait \{0.5
						Seconds}
				endif
			endif
		endif
	endif
	<i> = (<n> + 1)
	if (<i> > 4)
		break
	endif
	repeat 5
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_check_paddle_collisions_right 
	begin
	GetScreenElementProps id = <id>
	<i> = 0
	begin
	<n> = (<i>)
	if (($g_battle_paddle_toggle_p2) [<i>] = 1)
		formatText checksumName = paddle_id 'paddle_p2_%y' y = <i>
		GetScreenElementProps id = <paddle_id>
		<tl> = (<Pos> + $g_paddle_collision_offset)
		<br> = (<tl> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
		begin
		<n> = (<n> + 1)
		if (<n> < 5)
			if (($g_battle_paddle_toggle_p2) [<n>] = 1)
				formatText checksumName = paddle_id 'paddle_p2_%y' y = <n>
				GetScreenElementProps id = <paddle_id>
				<br> = ((<Pos> + $g_paddle_collision_offset) + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
			else
				break
			endif
		else
			break
		endif
		repeat
		rockout_check_ball_collision tl = <tl> br = <br>
		if (<collision>)
			if ($g_current_ball_owner = 1)
				rockout_set_ball_owner \{Player = 2}
				Change \{g_points_multiplier = 0}
			endif
			Change g_points_multiplier = (($g_points_multiplier) + 1)
			if ($g_points_multiplier > 4)
				rockout_activate_fireball
			else
				rockout_deactivate_fireball
			endif
			rockout_show_multiplier
			if ($g_launch_collision = 1)
				ball_container :applyforce \{Force = (-250000.0, 0.0)}
				Change \{g_launch_collision = 0}
				Wait \{0.5
					Seconds}
			else
				GetScreenElementProps \{id = ball_container}
				if ((<linear_velocity> [1] < 10) && (<linear_velocity> [1] > -10))
					<Force> = ((0.0, 10000.0) * <linear_velocity> [1])
					ball_container :applyforce Force = <Force>
				endif
				ball_container :applyforce \{Force = (-50000.0, 0.0)}
				Wait \{0.5
					Seconds}
			endif
		endif
	endif
	<i> = (<n> + 1)
	if (<i> > 4)
		break
	endif
	repeat 5
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_initialize_rockout \{lives = 3}
	if ScreenElementExists \{id = brick_container}
		DestroyScreenElement \{id = brick_container}
	endif
	Change \{g_player1_score = 0}
	Change \{g_player2_score = 0}
	Change \{g_player1_goals = 0}
	Change \{g_player2_goals = 0}
	rockout_set_ball_owner \{Player = 1}
	formatText TextName = score_text qs(0x21379b76) n = ($g_player1_score)
	SetScreenElementProps id = p1_score text = <score_text>
	formatText TextName = score_text qs(0x21379b76) n = ($g_player2_score)
	SetScreenElementProps id = p2_score text = <score_text>
	formatText TextName = score_text qs(0x978cefda) n = (<lives>)
	SetScreenElementProps id = p1_lives text = <score_text>
	paddle_container_p1 :SetTags lives = <lives>
	formatText TextName = score_text qs(0x978cefda) n = (<lives>)
	SetScreenElementProps id = p2_lives text = <score_text>
	paddle_container_p2 :SetTags lives = <lives>
	Change \{g_bricks_hit = 0}
	SpawnScriptNow \{rockout_initialize_ball}
	SpawnScriptNow \{rockout_brick_spawner}
endscript

script rockout_initialize_ball \{Player = 1}
	ball_container :clearphysicsdata
	Change \{g_launched = 0}
	Change \{g_points_multiplier = 0}
	rockout_deactivate_fireball
	if (<Player> = 1)
		SetScreenElementProps id = ball_container Pos = ($g_initial_ball_pos_l)
	else
		SetScreenElementProps id = ball_container Pos = ($g_initial_ball_pos_r)
	endif
	ball_container :applyforce \{Force = (0.0, -300000.0)}
	Change \{g_launch_collision = 1}
	rockout_create_ball_particles
endscript

script rockout_launch_ball \{Player = 1}
	if (($g_launched) = 0)
		if ($g_current_ball_owner = <Player>)
			clean_up_user_control_helpers
			KillSpawnedScript \{Name = rockout_initialize_ball}
			Change \{g_launched = 1}
		endif
	endif
endscript

script rockout_create_bricks 
	CreateScreenElement \{Type = ContainerElement
		id = brick_container
		parent = rockout_container
		Pos = (0.0, 0.0)}
	<y> = 0
	begin
	<X> = 0
	begin
	formatText checksumName = brick_id 'brick_%x_%y' X = <X> y = <y>
	<new_pos> = (($g_initial_brick_pos) + ((<X> * ($g_brick_width + $g_brick_spacing)) * (1.0, 0.0)) + ((<y> * ($g_brick_height + $g_brick_spacing)) * (0.0, 1.0)))
	CreateScreenElement {
		Type = SpriteElement
		id = <brick_id>
		parent = brick_container
		texture = rockout_brick
		rgba = (($g_brick_colors [<X>]).Color)
		Pos = <new_pos>
		just = [left top]
		z_priority = 30
		alpha = 0
	}
	<X> = (<X> + 1)
	repeat ($g_num_columns)
	<y> = (<y> + 1)
	repeat ($g_num_rows)
endscript
g_used_0 = 0
g_used_1 = 0
g_used_2 = 0
g_used_3 = 0
g_used_4 = 0

script rockout_brick_spawner \{move_time = 1.0
		song = hotelcalifornia}
	<time> = 0
	begin
	<old_column> = 0
	load_songqpak song_name = <song>
	get_song_prefix song = <song>
	formatText checksumName = gem_array '%s_song_expert' s = <song_prefix>
	preload_song song_name = <song> starttime = 0 fadeintime = 1.0
	begin_song
	GetArraySize $<gem_array>
	<i> = 0
	<current_song_time> = 0
	<move_time> = ($<gem_array> [0] / 1000)
	reset_song_time
	begin
	GetSongTimeMs
	if (<time> >= $<gem_array> [<i>])
		<c> = 0
		begin
		formatText checksumName = column_used 'g_used_%c' c = <c>
		Change GlobalName = <column_used> NewValue = 0
		<c> = (<c> + 1)
		repeat 5
		decompressnotevalue note_value = ($<gem_array> [<i> + 1])
		<current_song_time> = ($<gem_array> [<i>])
		<c> = 0
		<note_check> = 1
		begin
		if (<note> && <note_check>)
			brick_move_time = (15 / (<velocity>))
			SpawnScriptNow rockout_create_brick params = {column = <c> time = <brick_move_time>}
		endif
		<c> = (<c> + 1)
		<note_check> = (<note_check> * 2)
		repeat 5
		<i> = (<i> + 2)
	endif
	Wait \{1
		gameframe}
	if (<i> > <array_Size> - 1)
		break
	endif
	repeat
	Wait \{2
		Seconds}
	unload_songqpak
	repeat
endscript

script rockout_fall_brick \{move_time = 0.15
		appear_time = 0.25}
	<y> = 0
	begin
	if (<y> > 0)
		formatText checksumName = brick_id 'brick_%x_%y' X = <column> y = (<y> - 1)
		SetScreenElementProps id = <brick_id> alpha = 0.0
		<brick_id> :GetTags hit
		if (<hit> = 1)
			return
		endif
	endif
	if (<y> < 6)
		formatText checksumName = brick_id 'brick_%x_%y' X = <column> y = <y>
		SetScreenElementProps id = <brick_id> alpha = 1.0 time = <appear_time>
		<brick_id> :SetTags hit = 0
	endif
	Wait <move_time> Seconds
	<y> = (<y> + 1)
	repeat 7
endscript

script rockout_create_ball_particles z_priority = 3 Pos = ($g_initial_ball_pos_l) parent = ball_container
	Destroy2DParticleSystem \{id = ball_particles}
	Create2DParticleSystem \{id = ball_particles
		Pos = (32.0, 32.0)
		z_priority = 32
		material = ball_particle_01
		parent = ball_container
		start_color = [
			255
			128
			0
			255
		]
		end_color = [
			255
			222
			222
			0
		]
		start_scale = (0.75, 0.75)
		end_scale = (0.1, 0.1)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.03
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.3}
endscript

script rockout_check_brick_collisions 
	begin
	<y> = 0
	begin
	<X> = 0
	begin
	formatText checksumName = brick_id 'brick_%x_%y' X = <X> y = <y>
	GetScreenElementProps id = <brick_id>
	if NOT (<alpha> = 0)
		<tl> = (<Pos> + $g_brick_collision_offset)
		<br> = (<tl> + ((($g_brick_width) - 1) * (1.0, 0.0)) + ((($g_brick_height) - 1) * (0.0, 1.0)))
		ball_container :GetTags
		if (<fireball_active>)
			rockout_check_ball_collision tl = <tl> br = <br> preserve_momentum = 1
		else
			rockout_check_ball_collision tl = <tl> br = <br>
		endif
		if (<collision>)
			SetScreenElementProps id = <brick_id> alpha = 0
			<brick_id> :SetTags hit = 1
			Change g_bricks_hit = (($g_bricks_hit) + 1)
			rockout_calculate_score \{Type = 'brick'}
			if ($g_current_ball_owner = 1)
				rockout_add_to_score Player = 1 amount = (<score>)
			else
				rockout_add_to_score Player = 2 amount = (<score>)
			endif
			spawnscript rockout_show_score_popup params = {brick_pos = <Pos> brick_color = <rgba> score = <score>}
			<bass> = 2
		endif
	endif
	<X> = (<X> + 1)
	repeat ($g_num_columns)
	<y> = (<y> + 1)
	repeat ($g_num_rows)
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_check_screen_collisions 
	begin
	<tl> = (0.0, 150.0)
	<br> = (1280.0, 656.0)
	<id> :circleaabbcollisioncheck tl = <tl> br = <br>
	GetScreenElementProps \{id = ball_container}
	<ball_center> = (<Pos> + (31.0, 31.0))
	if ((<ball_center> [1] < (<tl> [1] - 10)) || (<ball_center> [1] > (<br> [1] + 10)))
		Change \{g_points_multiplier = 0}
		KillSpawnedScript \{Name = rockout_initialize_ball}
		if ($g_current_ball_owner = 1)
			rockout_set_ball_owner \{Player = 2}
			SpawnScriptNow \{rockout_initialize_ball
				params = {
					Player = 2
				}}
		else
			rockout_set_ball_owner \{Player = 1}
			SpawnScriptNow \{rockout_initialize_ball
				params = {
					Player = 1
				}}
		endif
	endif
	if (<ball_center> [0] > (<br> [0] - 175))
		if ($g_current_ball_owner = 2)
			Change \{g_points_multiplier = 1}
		endif
		rockout_calculate_score \{Type = 'goal'}
		rockout_set_ball_owner \{Player = 1}
		rockout_add_to_score Player = 1 amount = (<score>)
		rockout_add_goal \{Player = 1}
		spawnscript \{rockout_update_lives
			params = {
				Player = 2
				adjustment = -1
			}}
		spawnscript rockout_show_goal_popup params = {score = <score>}
		Change \{g_points_multiplier = 0}
		Wait \{1.5
			Seconds}
		KillSpawnedScript \{Name = rockout_initialize_ball}
		SpawnScriptNow \{rockout_initialize_ball
			params = {
				Player = 1
			}}
	elseif (<ball_center> [0] < (<tl> [0] + 175))
		if ($g_current_ball_owner = 1)
			Change \{g_points_multiplier = 1}
		endif
		rockout_calculate_score \{Type = 'goal'}
		rockout_set_ball_owner \{Player = 2}
		rockout_add_to_score Player = 2 amount = (<score>)
		rockout_add_goal \{Player = 2}
		spawnscript \{rockout_update_lives
			params = {
				Player = 1
				adjustment = -1
			}}
		spawnscript rockout_show_goal_popup params = {score = <score>}
		Change \{g_points_multiplier = 0}
		Wait \{1.5
			Seconds}
		KillSpawnedScript \{Name = rockout_initialize_ball}
		SpawnScriptNow \{rockout_initialize_ball
			params = {
				Player = 2
			}}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_add_to_score \{Player = 1
		amount = 0}
	if (<Player> = 1)
		Change g_player1_score = ($g_player1_score + <amount>)
		formatText TextName = score_text qs(0x21379b76) n = ($g_player1_score)
		SetScreenElementProps id = p1_score text = <score_text>
	else
		Change g_player2_score = ($g_player2_score + <amount>)
		formatText TextName = score_text qs(0x21379b76) n = ($g_player2_score)
		SetScreenElementProps id = p2_score text = <score_text>
	endif
endscript

script rockout_set_ball_owner \{Player = 1}
	if (<Player> = 1)
		SetScreenElementProps id = ball rgba = (($g_menu_colors).p1_orangey)
		Change \{g_current_ball_owner = 1}
	elseif (<Player> = 2)
		SetScreenElementProps id = ball rgba = (($g_menu_colors).p2_purpley)
		Change \{g_current_ball_owner = 2}
	endif
endscript

script rockout_create_debug_collision_rect \{tl = (0.0, 0.0)
		br = (0.0, 0.0)}
	w = (<br>.(1.0, 0.0) - <tl>.(1.0, 0.0))
	h = (<br>.(0.0, 1.0) - <tl>.(0.0, 1.0))
	dims = (<w> * (1.0, 0.0) + <h> * (0.0, 1.0))
	CreateScreenElement {
		Type = SpriteElement
		parent = rockout_container
		rgba = [0 255 0 25]
		texture = white
		Pos = (<tl>)
		dims = <dims>
		just = [left top]
		z_priority = 31000
	}
endscript

script rockout_display_ball_velocity 
	<time> = 1.0
	<elapsed_time> = 0
	begin
	GetDeltaTime
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	if (<elapsed_time> > <time>)
		GetScreenElementProps \{id = ball_container}
		SetScreenElementProps \{id = ball_container
			linear_velocity = (0.0, 0.0)}
		<elapsed_time> = 0
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_show_score_popup brick_pos = (900.0, 900.0) brick_color = (($g_menu_colors).p2_purpley) score = ($g_points_per_brick)
	<i> = 1
	begin
	formatText checksumName = element_id 'brick_hit_score_%n' n = <i>
	if ScreenElementExists id = <element_id>
		<i> = (<i> + 1)
	else
		break
	endif
	if (<i> = (($g_total_score_popups) + 1))
		return
	endif
	repeat
	<brick_center> = (<brick_pos> + ($g_brick_width / 2) * (1.0, 0.0) + ($g_brick_height / 2) * (0.0, 1.0))
	spawnscript rockout_create_brick_particles params = {Pos = <brick_center> Color = <brick_color>}
	formatText TextName = brick_hit_score_text qs(0xc096ca3d) n = <score>
	CreateScreenElement {
		Type = TextElement
		id = <element_id>
		parent = rockout_container
		rgba = (<brick_color>)
		font = debug
		Pos = <brick_center>
		text = <brick_hit_score_text>
		just = [center center]
		z_priority = 31
	}
	RunScriptOnScreenElement id = <element_id> rockout_popup_move_to_score params = {element_id = <element_id>}
endscript

script rockout_show_multiplier \{ball_pos = (400.0, 400.0)}
	if ($g_points_multiplier = 1)
		return
	endif
	if ScreenElementExists \{id = multiplier_popup}
		DestroyScreenElement \{id = multiplier_popup}
	endif
	GetScreenElementProps \{id = ball_container}
	<ball_pos> = <Pos>
	GetScreenElementProps \{id = rockout_container}
	<rockout_pos> = <Pos>
	<ball_center> = (<ball_pos> + <rockout_pos> + (31.0, 31.0))
	formatText TextName = current_multiplier qs(0x2543b917) n = ($g_points_multiplier)
	CreateScreenElement {
		Type = TextElement
		id = multiplier_popup
		parent = rockout_container
		rgba = [255 255 255 255]
		font = debug
		Pos = <ball_center>
		text = <current_multiplier>
		just = [center center]
		z_priority = 31
	}
	RunScriptOnScreenElement \{id = multiplier_popup
		rockout_popup_rise_and_fade
		params = {
			element_id = multiplier_popup
		}}
endscript

script rockout_show_goal_popup score = ($g_points_per_goal)
	if ScreenElementExists \{id = goal_popup}
		DestroyScreenElement \{id = goal_popup}
	endif
	formatText TextName = score qs(0x4a24c71a) n = (<score>)
	GetScreenElementProps \{id = ball_container}
	<ball_pos> = <Pos>
	<ball_center> = (<ball_pos> + (31.0, 31.0))
	CreateScreenElement {
		Type = TextElement
		id = goal_popup
		parent = rockout_container
		rgba = [255 255 255 255]
		font = debug
		Pos = <ball_center>
		text = <score>
		just = [center center]
		z_priority = 31
	}
	RunScriptOnScreenElement \{id = goal_popup
		rockout_popup_move_to_score
		params = {
			element_id = goal_popup
			rise = 0
			time = 1
		}}
endscript

script rockout_popup_rise_and_fade \{element_id = rockout_score_popup_1
		rise = 50
		time = 0.5}
	if ScreenElementExists id = <element_id>
		GetScreenElementProps id = <element_id>
		<end_pos> = ((<Pos>) + (0.0, -1.0) * <rise>)
		legacydoscreenelementmorph id = <element_id> Pos = <end_pos> alpha = 0 Scale = 1.3 time = <time>
		Wait <time> Seconds
		DestroyScreenElement id = <element_id>
	endif
endscript

script rockout_popup_move_to_score \{element_id = rockout_score_popup_1
		time = 1}
	if ScreenElementExists id = <element_id>
		if ($g_current_ball_owner = 1)
			<end_pos> = (350.0, 50.0)
		else
			<end_pos> = (950.0, 50.0)
		endif
		legacydoscreenelementmorph id = <element_id> Pos = <end_pos> alpha = 0 Scale = 0.8 time = <time>
		Wait <time> Seconds
		DestroyScreenElement id = <element_id>
	endif
endscript

script rockout_calculate_score \{Type = 'brick'}
	switch <Type>
		case 'brick'
		return score = (($g_points_multiplier) * ($g_points_per_brick))
		case 'goal'
		return score = (($g_points_multiplier) * ($g_points_per_goal))
		default
		return \{score = 0}
	endswitch
endscript

script rockout_add_goal \{Player = 1}
	if (<Player> = 1)
		Change g_player1_goals = ($g_player1_goals + 1)
	else
		Change g_player2_goals = ($g_player2_goals + 1)
	endif
endscript

script rockout_update_lives \{Player = 1
		adjustment = -1}
	if (<Player> = 1)
		paddle_container_p1 :GetTags
		<lives> = (<lives> + <adjustment>)
		formatText TextName = score_text qs(0x978cefda) n = (<lives>)
		SetScreenElementProps id = p1_lives text = <score_text>
		paddle_container_p1 :SetTags lives = <lives>
	else
		paddle_container_p2 :GetTags
		<lives> = (<lives> + <adjustment>)
		formatText TextName = score_text qs(0x978cefda) n = (<lives>)
		SetScreenElementProps id = p2_lives text = <score_text>
		paddle_container_p2 :SetTags lives = <lives>
	endif
	if (<lives> < 1)
		if (<Player> = 1)
			<victory_text> = qs(0x1fb2fb39)
		else
			<victory_text> = qs(0x63d3dee2)
		endif
		create_popup_warning_menu {
			no_background
			title = qs(0x0cd55360)
			textblock = {
				text = <victory_text>
			}
			options = [
				{
					func = {rockout_restart_game}
					text = qs(0xdc30b4a9)
				}
				{
					func = {rockout_quit_game}
					text = qs(0x67d9c56d)
				}
			]
		}
		SetScreenElementProps \{id = ball_container
			linear_momentum = (0.0, 0.0)}
		SetScreenElementProps \{id = ball_container
			linear_velocity = (0.0, 0.0)}
		begin_song \{Pause = 1}
		PauseGame
	endif
endscript

script rockout_pause_game 
	if NOT GameIsPaused
		GetScreenElementProps \{id = ball_container}
		create_popup_warning_menu {
			no_background
			title = qs(0x48a351fa)
			textblock = {
				text = qs(0x4e0fcb7a)
			}
			options = [
				{
					func = {rockout_unpause_game}
					func_params = {momentum = <linear_momentum> velocity = <linear_velocity>}
					text = qs(0x4f636726)
				}
				{
					func = {rockout_restart_game}
					text = qs(0xb8790f2f)
				}
				{
					func = {rockout_quit_game}
					text = qs(0x67d9c56d)
				}
			]
		}
		SetScreenElementProps \{id = ball_container
			linear_momentum = (0.0, 0.0)}
		SetScreenElementProps \{id = ball_container
			linear_velocity = (0.0, 0.0)}
		begin_song \{Pause = 1}
		PauseGame
	endif
endscript

script rockout_unpause_game 
	UnPauseGame
	begin_song
	destroy_popup_warning_menu
	create_menu_backdrop \{texture = rockout_bg}
	SetScreenElementProps id = ball_container linear_momentum = <momentum>
	SetScreenElementProps id = ball_container linear_velocity = <velocity>
endscript

script rockout_quit_game 
	UnPauseGame
	destroy_popup_warning_menu
	generic_event_back
endscript

script rockout_ai \{Player = 2}
	formatText checksumName = ai_id 'g_p%s_ai_active' s = <Player>
	Change GlobalName = <ai_id> NewValue = 1
	begin
	<strum> = 0
	GetScreenElementProps \{id = ball_container}
	if (($g_current_ball_owner = <Player>) && (<linear_velocity> [0] = 0))
		<delay> = RandomFloat (2.0, 5.0)
		Wait <delay> Seconds
	endif
	GetScreenElementProps \{id = ball_container}
	<ball_pos> = <Pos>
	<ball_center> = (<ball_pos> + (32.0, 32.0))
	<i> = 0
	begin
	formatText checksumName = paddle_id 'paddle_p%s_%y' s = <Player> y = <i>
	formatText checksumName = paddle_container_id 'paddle_container_p%s' s = <Player>
	formatText checksumName = paddle_array_id 'g_battle_paddle_toggle_p%s' s = <Player>
	GetScreenElementProps id = <paddle_container_id>
	<paddle_container_pos> = <Pos>
	GetScreenElementPosition id = <paddle_id>
	<paddle_tl> = (<screenelementpos> + $g_paddle_collision_offset)
	<paddle_br> = (<paddle_tl> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
	<tl> = (<paddle_tl> - (48.0, 32.0) - (<linear_velocity> / ($framerate_value)))
	<br> = (<paddle_br> + (48.0, 32.0) - (<linear_velocity> / ($framerate_value)))
	if (((<tl> [0] < <ball_center> [0]) && (<br> [0] > <ball_center> [0])) || (($g_current_ball_owner = <Player>) && (<linear_velocity> [0] = 0)))
		if ((<tl> [1] < <ball_center> [1]) && (<br> [1] > <ball_center> [1]))
			SetArrayElement ArrayName = <paddle_array_id> globalarray index = <i> NewValue = 1
			SpawnScriptNow rockout_drum_hit params = {Player = <Player> button = <i>}
			<strum> = 1
		else
			SetArrayElement ArrayName = <paddle_array_id> globalarray index = <i> NewValue = 0
		endif
	else
		break
	endif
	<i> = (<i> + 1)
	repeat 5
	if (<strum>)
		Wait \{0.5
			Seconds}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_ball_debug 
	<total_nodes> = 100
	<i> = 0
	<collision_pos> = [
		{
			last = 1
		}
		{
			Pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			Pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			Pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			Pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			Pos = (0.0, 0.0)
			side = 0
			time = 0
		}
	]
	ball :SetTags collision_pos = <collision_pos>
	begin
	formatText checksumName = element_id 'debug_ball_path_node_%n' n = <i>
	if ScreenElementExists id = <element_id>
		DestroyScreenElement id = <element_id>
	endif
	GetScreenElementProps \{id = ball_container}
	<ball_center> = (<Pos> + (31.0, 31.0))
	CreateScreenElement {
		Type = SpriteElement
		id = <element_id>
		parent = rockout_container
		texture = rockout_ball
		dims = (8.0, 8.0)
		Pos = <ball_center>
		just = [center center]
		z_priority = 30
	}
	<i> = (<i> + 1)
	if (<i> = <total_nodes>)
		<i> = 0
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script rockout_check_ball_collision \{br = (0.0, 0.0)
		tl = (0.0, 0.0)
		preserve_momentum = 0}
	GetScreenElementProps \{id = ball_container}
	<ball_tl> = (<Pos> + (16.0, 16.0))
	<ball_br> = (<ball_tl> + (32.0, 32.0))
	<top_penetration> = 0
	<right_penetration> = 0
	<bottom_penetration> = 0
	<left_penetration> = 0
	<lowest_ratio> = 1000
	<collision> = 0
	if ((<tl> [1] < <ball_br> [1]) && (<br> [1] > <ball_tl> [1]))
		if ((<tl> [0] < <ball_br> [0]) && (<br> [0] > <ball_tl> [0]))
			<velocity_in_frames> = (<linear_velocity> / ($framerate_value))
			<top_penetration> = (<ball_br> [1] - <tl> [1])
			<right_penetration> = (<br> [0] - <ball_tl> [0])
			<bottom_penetration> = (<br> [1] - <ball_tl> [1])
			<left_penetration> = (<ball_br> [0] - <tl> [0])
			if (<linear_velocity> [0] = 0)
				if (<left_penetration> > <right_penetration>)
					<collision> = 4
				else
					<collision> = 2
				endif
			elseif (<linear_velocity> [1] = 0)
				if (<top_penetration> > <bottom_penetration>)
					<collision> = 1
				else
					<collision> = 3
				endif
			else
				<top_ratio> = (<top_penetration> / <velocity_in_frames> [1])
				<right_ratio> = (-1 * (<right_penetration> / <velocity_in_frames> [0]))
				<bottom_ratio> = (-1 * (<bottom_penetration> / <velocity_in_frames> [1]))
				<left_ratio> = (<left_penetration> / <velocity_in_frames> [0])
				if ((<top_ratio> < <lowest_ratio>) && (<top_ratio> > 0))
					<lowest_ratio> = <top_ratio>
					<collision> = 1
				endif
				if ((<right_ratio> < <lowest_ratio>) && (<right_ratio> > 0))
					<lowest_ratio> = <right_ratio>
					<collision> = 2
				endif
				if ((<bottom_ratio> < <lowest_ratio>) && (<bottom_ratio> > 0))
					<lowest_ratio> = <bottom_ratio>
					<collision> = 3
				endif
				if ((<left_ratio> < <lowest_ratio>) && (<left_ratio> > 0))
					<lowest_ratio> = <left_ratio>
					<collision> = 4
				endif
			endif
		endif
	else
		return collision = <collision>
	endif
	<new_velocity> = (<linear_velocity>)
	<new_pos> = (<Pos>)
	switch <collision>
		case 1
		<new_velocity> = (<linear_velocity> [1] * (0.0, -1.0) + <linear_velocity> [0] * (1.0, 0.0))
		case 2
		<new_velocity> = (<linear_velocity> [0] * (-1.0, 0.0) + <linear_velocity> [1] * (0.0, 1.0))
		case 3
		<new_velocity> = (<linear_velocity> [1] * (0.0, -1.0) + <linear_velocity> [0] * (1.0, 0.0))
		case 4
		<new_velocity> = (<linear_velocity> [0] * (-1.0, 0.0) + <linear_velocity> [1] * (0.0, 1.0))
		default
	endswitch
	if (<lowest_ratio> < 1000)
		<new_pos> = (<Pos> - (<lowest_ratio> * <velocity_in_frames>))
	endif
	if (<collision>)
		if NOT (<preserve_momentum>)
			<new_momentum> = (<new_velocity> [1] * (0.0, 10.0) + <new_velocity> [0] * (10.0, 0.0))
			SetScreenElementProps id = ball_container linear_velocity = <new_velocity>
			SetScreenElementProps id = ball_container linear_momentum = <new_momentum>
			SetScreenElementProps id = ball_container Pos = <new_pos>
		endif
	endif
	return collision = <collision>
endscript

script rockout_activate_fireball 
	ball_container :GetTags
	if NOT (<fireball_active>)
		ball_container :SetTags \{fireball_active = 1}
		Destroy2DParticleSystem \{id = fireball_particles}
		Create2DParticleSystem \{id = fireball_particles
			Pos = (32.0, 32.0)
			z_priority = 32
			material = ball_particle_01
			parent = ball_container
			start_color = [
				255
				128
				0
				255
			]
			end_color = [
				255
				222
				222
				0
			]
			start_scale = (1.0, 1.0)
			end_scale = (0.1, 0.1)
			start_angle_spread = 360.0
			min_rotation = -500.0
			max_rotation = 500.0
			emit_start_radius = 0.0
			emit_radius = 1.0
			Emit_Rate = 0.03
			emit_dir = 0.0
			emit_spread = 360.0
			velocity = 0.0
			friction = (0.0, 0.0)
			time = 0.5}
		spawnscript \{rockout_fireball_explosion}
	endif
endscript

script rockout_fireball_explosion 
	Destroy2DParticleSystem \{id = fireball_explosion}
	Create2DParticleSystem \{id = fireball_explosion
		Pos = (32.0, 32.0)
		z_priority = 32
		material = ball_particle_01
		parent = ball_container
		start_color = [
			255
			128
			0
			255
		]
		end_color = [
			255
			222
			222
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (0.5, 0.5)
		start_angle_spread = 360
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 360
		velocity = 4.0
		friction = (0.0, 0.1)
		time = 0.5}
	Wait \{10
		gameframes}
	Destroy2DParticleSystem \{id = fireball_explosion
		kill_when_empty}
endscript

script rockout_deactivate_fireball 
	ball_container :SetTags \{fireball_active = 0}
	Destroy2DParticleSystem \{id = fireball_particles
		kill_when_empty}
endscript

script rockout_create_brick_particles \{Color = [
			222
			222
			255
			255
		]}
	rockout_container :GetTags
	<max_num_brick_particle_systems> = 5
	<end_color> = (<Color>)
	SetArrayElement \{ArrayName = end_color
		index = 3
		NewValue = 100}
	formatText checksumName = explosion_id 'brick_explosion_%y' y = <current_particle>
	<current_particle> = (<current_particle> + 1)
	if (<current_particle> = <max_num_brick_particle_systems>)
		<current_particle> = 0
	endif
	rockout_container :SetTags current_particle = <current_particle>
	Destroy2DParticleSystem id = <explosion_id>
	Create2DParticleSystem {
		id = <explosion_id>
		Pos = (<Pos>)
		z_priority = 32
		material = material_brickexplode
		parent = rockout_container
		start_color = <Color>
		end_color = <end_color>
		start_scale = (0.5, 0.5)
		end_scale = (0.2, 0.2)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 10
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 5.0
		friction = (0.0, 0.0)
		time = 0.2
	}
	Wait \{5
		gameframes}
	Destroy2DParticleSystem id = <explosion_id> kill_when_empty
endscript

script rockout_cleanup_brick_particles 
	<i> = 0
	begin
	formatText checksumName = explosion_id 'brick_explosion_%y' y = <i>
	Destroy2DParticleSystem id = <explosion_id>
	<i> = (<i> + 1)
	repeat 20
endscript

script rockout_load_songdata \{song = rebelyell}
	load_songqpak song_name = <song>
	get_song_prefix song = <song>
	formatText checksumName = gem_array '%s_song_expert' s = <song_prefix>
	GetArraySize $<gem_array>
	<i> = 0
	begin
	<i> = (<i> + 2)
	decompressnotevalue note_value = ($<gem_array> [<i> + 1])
	repeat (<array_Size> / 2)
	unload_songqpak
endscript

script rockout_start_controls \{Type = 0
		controller = 0
		Player = 1}
	switch <Type>
		case guitar
		spawnscript rockout_button_watcher params = {controller = <controller> Player = <Player>}
		<up_active> = 0
		<down_active> = 0
		begin
		if ControllerPressed up <controller>
			if (<up_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<up_active> = 1
			endif
		elseif (<up_active> = 1)
			<up_active> = 0
		endif
		if ControllerPressed down <controller>
			if (<down_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<down_active> = 1
			endif
		elseif (<down_active> = 1)
			<down_active> = 0
		endif
		Wait \{1
			gameframe}
		repeat
		case drums
		<x_active> = 0
		<circle_active> = 0
		<square_active> = 0
		<triangle_active> = 0
		<r1_active> = 0
		<l1_active> = 0
		begin
		if ControllerPressed X <controller>
			if (<x_active> = 0)
				spawnscript rockout_drum_hit params = {Player = <Player> button = 4}
				<x_active> = 1
			endif
		elseif (<x_active> = 1)
			<x_active> = 0
		endif
		if ControllerPressed circle <controller>
			if (<circle_active> = 0)
				spawnscript rockout_drum_hit params = {Player = <Player> button = 0}
				<circle_active> = 1
			endif
		elseif (<circle_active> = 1)
			<circle_active> = 0
		endif
		if ControllerPressed Square <controller>
			if (<square_active> = 0)
				spawnscript rockout_drum_hit params = {Player = <Player> button = 2}
				<square_active> = 1
			endif
		elseif (<square_active> = 1)
			<square_active> = 0
		endif
		if ControllerPressed Triangle <controller>
			if (<triangle_active> = 0)
				spawnscript rockout_drum_hit params = {Player = <Player> button = 1}
				<triangle_active> = 1
			endif
		elseif (<triangle_active> = 1)
			<triangle_active> = 0
		endif
		if ControllerPressed R1 <controller>
			if (<r1_active> = 0)
				spawnscript rockout_drum_hit params = {Player = <Player> button = 3}
				<r1_active> = 1
			endif
		elseif (<r1_active> = 1)
			<r1_active> = 0
		endif
		if ControllerPressed L1 <controller>
			if (<l1_active> = 0)
				spawnscript rockout_drum_hit params = {Player = <Player> button = 3}
				<l1_active> = 1
			endif
		elseif (<l1_active> = 1)
			<l1_active> = 0
		endif
		Wait \{1
			gameframe}
		repeat
		default
		<x_active> = 0
		<l1_active> = 0
		<l2_active> = 0
		<r1_active> = 0
		<r2_active> = 0
		spawnscript rockout_button_watcher params = {controller = <controller> Player = <Player>}
		begin
		if ControllerPressed X <controller>
			if (<x_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<x_active> = 1
			endif
		elseif (<x_active> = 1)
			<x_active> = 0
		endif
		if ControllerPressed R1 <controller>
			if (<r1_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<r1_active> = 1
			endif
		elseif (<r1_active> = 1)
			<r1_active> = 0
		endif
		if ControllerPressed R2 <controller>
			if (<r2_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<r2_active> = 1
			endif
		elseif (<r2_active> = 1)
			<r2_active> = 0
		endif
		if ControllerPressed L1 <controller>
			if (<l1_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<l1_active> = 1
			endif
		elseif (<l1_active> = 1)
			<l1_active> = 0
		endif
		if ControllerPressed L2 <controller>
			if (<l2_active> = 0)
				spawnscript rockout_guitar_strum params = {Player = <Player>}
				<l2_active> = 1
			endif
		elseif (<l2_active> = 1)
			<l2_active> = 0
		endif
		Wait \{1
			gameframe}
		repeat
	endswitch
endscript

script rockout_button_watcher \{controller = 0
		Player = 1}
	begin
	formatText checksumName = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <Player>
	GetHeldPattern controller = (<controller>) nobrokenstring
	check_button = 65536
	array_count = 0
	begin
	if (<hold_pattern> && <check_button>)
		if ($<paddle_toggle> [<array_count>] = 0)
			SetArrayElement ArrayName = <paddle_toggle> globalarray index = <array_count> NewValue = 1
			formatText checksumName = paddle_id 'paddle_p%p_%y' p = <Player> y = <array_count>
			GetScreenElementProps id = <paddle_id>
			rockout_paddle_highlight paddle = <array_count> no_pos_morph = 1 Player = <Player>
		endif
	else
		if ($<paddle_toggle> [<array_count>] = 1)
			formatText checksumName = paddle_id 'paddle_p%p_%y' p = <Player> y = <array_count>
			GetScreenElementProps id = <paddle_id>
			SetArrayElement ArrayName = <paddle_toggle> globalarray index = <array_count> NewValue = 0
			rockout_paddle_highlight paddle = <array_count> unhighlight = 1 no_pos_morph = 1 Player = <Player>
		endif
	endif
	<check_button> = (<check_button> / 16)
	<array_count> = (<array_count> + 1)
	repeat 5
	Wait \{1
		gameframe}
	repeat
endscript

script rockout_create_brick \{current_brick = 1
		column = 1
		time = 5}
	rockout_container :GetTags
	formatText checksumName = brick_id 'brick_%n' n = <current_brick>
	<current_brick> = (<current_brick> + 1)
	if (<current_brick> > <max_bricks>)
		<current_brick> = 0
	endif
	rockout_container :SetTags current_brick = <current_brick>
	DestroyScreenElement id = <brick_id>
	<start_pos> = (($g_initial_brick_pos) + ((<column> * ($g_brick_width + $g_brick_spacing)) * (1.0, 0.0)) - (0.0, 150.0))
	CreateScreenElement {
		Type = SpriteElement
		id = <brick_id>
		parent = rockout_container
		texture = rockout_brick
		rgba = (($g_brick_colors [<column>]).Color)
		Pos = <start_pos>
		just = [left top]
		z_priority = 29
		alpha = 1
	}
	RunScriptOnScreenElement id = <brick_id> rockout_check_single_brick_collision params = {column = <column> brick_id = <brick_id>}
	SetScreenElementProps id = <brick_id> Pos = (<start_pos> + (0.0, 640.0)) time = <time>
	Wait <time> Seconds
	DestroyScreenElement id = <brick_id>
endscript

script rockout_kill_bricks 
	rockout_container :GetTags
	<i> = 0
	begin
	formatText checksumName = brick_id 'brick_%n' n = <i>
	DestroyScreenElement id = <brick_id>
	<i> = (<i> + 1)
	repeat <max_bricks>
	rockout_container :SetTags \{current_brick = 0}
endscript

script rockout_check_single_brick_collision 
	begin
	Obj_GetID
	GetScreenElementProps id = <objID>
	<tl> = (<Pos> + $g_brick_collision_offset)
	<br> = (<tl> + ((($g_brick_width) - 1) * (1.0, 0.0)) + ((($g_brick_height) - 1) * (0.0, 1.0)))
	ball_container :GetTags
	if (<fireball_active>)
		rockout_check_ball_collision tl = <tl> br = <br> preserve_momentum = 1
	else
		rockout_check_ball_collision tl = <tl> br = <br>
	endif
	if (<collision>)
		Change g_bricks_hit = (($g_bricks_hit) + 1)
		rockout_calculate_score \{Type = 'brick'}
		if ($g_current_ball_owner = 1)
			rockout_add_to_score Player = 1 amount = (<score>)
		else
			rockout_add_to_score Player = 2 amount = (<score>)
		endif
		spawnscript rockout_show_score_popup params = {brick_pos = <Pos> brick_color = <rgba> score = <score>}
		<bass> = 2
		DestroyScreenElement id = <objID>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

g_rockout_show_in_debug_menu = 1
g_initial_ball_pos_L = (235.0, 300.0)
g_initial_ball_pos_R = (977.0, 300.0)
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
rockout_goal_info = {
	name = 'rockout_goal'
	goal_type = Testing
	data = {
		num_players = 0
	}
	constants = {
		start_zone = null
	}
	checkpoints = [
		{
			name = 'initial_dialog_CP'
			next_checkpoint = next_dialog_CP
			tools = [
				{
					name = 'num_players_dialog'
					type = Menu
					template = dialog_box
					template_settings = {
						heading_text = qs(0xa83061c6)
						body_text = qs(0x9f80ee4c)
						options = [
							{
								text = qs(0x787beab2)
								func = rockout_set_num_players
								func_params = {
									num_players = 1
								}
							}
							{
								text = qs(0x5356b971)
								func = rockout_set_num_players
								func_params = {
									num_players = 2
								}
							}
							{
								text = qs(0x5fb58b89)
								func = rockout_set_num_players
								func_params = {
									num_players = 0
								}
							}
						]
					}
				}
			]
		}
		{
			name = 'next_dialog_CP'
			tools = [
				{
					name = 'next_dialog'
					type = Menu
					template = dialog_box
					template_settings = {
						heading_text = qs(0xe6f8c73c)
						body_text = qs(0x0515612b)
						options = [
							{
								text = qs(0x6d562a67)
								func = rockout_say_yes
							}
							{
								text = qs(0x47157885)
								func = rockout_say_no
							}
						]
					}
				}
			]
		}
		{
			name = 'rockout_CP'
			tools = [
				{
					name = 'rockout_pause'
					type = Pause
					settings = {
						default_options = {
						}
						custom_options = [
							{
								text = qs(0x4f636726)
								func = rockout_unpause_game
							}
							{
								text = qs(0xb8790f2f)
								func = rockout_restart_game
							}
							{
								text = qs(0x67d9c56d)
								func = rockout_quit_game
							}
						]
					}
				}
			]
		}
	]
}

script rockout_say_no 
	GMan_SetNextCheckpoint \{goal = rockout_goal
		next_checkpoint = initial_dialog_CP}
	GMan_PassCheckpoint \{goal = rockout_goal}
endscript

script rockout_say_yes 
	spawnscriptnow \{create_rockout_game}
endscript

script rockout_start_menu_tool 
	GMan_MenuFunc \{goal = rockout_goal
		checkpoint = initial_dialog_CP
		tool = num_players_dialog
		func = start}
endscript

script rockout_stop_menu_tool 
	GMan_MenuFunc \{goal = rockout_goal
		checkpoint = initial_dialog_CP
		tool = num_players_dialog
		func = Stop}
endscript

script rockout_add_goal 
	GMan_AddGoal \{goal_info = $rockout_goal_info}
	GMan_InitializeGoal \{goal = rockout_goal}
	begin
	if GMan_GoalIsInitialized \{goal = rockout_goal}
		break
	endif
	wait \{1
		gameframe}
	repeat
	GMan_ActivateGoal \{goal = rockout_goal}
endscript

script rockout_remove_goal 
	if GMan_GoalExists \{goal = rockout_goal}
		if GMan_GoalIsInitialized \{goal = rockout_goal}
			if GMan_GoalIsActive \{goal = rockout_goal}
				GMan_DeactivateGoal \{goal = rockout_goal}
				begin
				if NOT GMan_GoalIsActive \{goal = rockout_goal}
					break
				endif
				wait \{1
					gameframe}
				repeat
			endif
			GMan_UninitializeGoal \{goal = rockout_goal}
			begin
			if NOT GMan_GoalIsInitialized \{goal = rockout_goal}
				break
			endif
			wait \{1
				gameframe}
			repeat
		endif
		GMan_RemoveGoal \{goal = rockout_goal}
	endif
endscript

script rockout_set_num_players 
	GMan_SetData goal = rockout_goal params = {num_players = <num_players>}
	GMan_PassCheckpoint \{goal = rockout_goal}
endscript

script create_rockout_game 
	GMan_SetNextCheckpoint \{goal = rockout_goal
		next_checkpoint = rockout_CP}
	GMan_PassCheckpoint \{goal = rockout_goal}
	GMan_GetData \{goal = rockout_goal
		name = num_players}
	Menu_Music_Off
	CreateMaterial \{name = Ball_Particle_01
		template = ImmediateMode_UI
		technique = UI_Col_Tex_2D
		BlendMode = add
		MaterialProps = [
			{
				name = m_psPass0MaterialColor
				VectorProperty = [
					1.0
					1.0
					1.0
					1.0
				]
			}
			{
				name = m_sampPass0Diffuse
				TextureProperty = ph_firepuffs
			}
		]}
	CreateMaterial \{name = Material_BrickExplode
		template = ImmediateMode_UI
		technique = UI_Col_Tex_2D
		BlendMode = add
		MaterialProps = [
			{
				name = m_psPass0MaterialColor
				VectorProperty = [
					1.0
					1.0
					1.0
					1.0
				]
			}
			{
				name = m_sampPass0Diffuse
				TextureProperty = jow_buttonstar01
			}
		]}
	CreateScreenElement \{type = ContainerElement
		id = rockout_container
		parent = root_window
		Pos = (0.0, 0.0)}
	rockout_container :SetTags \{current_particle = 0
		current_brick = 0
		max_bricks = 20}
	CreateScreenElement \{type = SpriteElement
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
		type = PhysicsElement
		id = ball_container
		parent = rockout_container
		Pos = ($g_initial_ball_pos)
		mass = 10.0
		center = (31.0, 31.0)
		radius = 22.630001
		elasticity = 1.0
	}
	ball_container :SetTags \{fireball_active = 0}
	CreateScreenElement \{type = SpriteElement
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
	FormatText TextName = score_text qs(0x21379b76) n = ($g_player1_score)
	CreateScreenElement {
		type = TextElement
		id = p1_score
		parent = rockout_container
		rgba = (($g_menu_colors).p1_orangey)
		font = debug
		Pos = (250.0, 50.0)
		text = <score_text>
		just = [left top]
		z_priority = 31
	}
	FormatText TextName = score_text qs(0x21379b76) n = ($g_player2_score)
	CreateScreenElement {
		type = TextElement
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
		type = TextElement
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
		type = TextElement
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
	spawnscriptnow \{rockout_check_paddle_collisions_left
		params = {
			id = ball_container
		}}
	spawnscriptnow \{rockout_check_paddle_collisions_right
		params = {
			id = ball_container
		}}
	spawnscriptnow \{rockout_check_screen_collisions
		params = {
			id = ball_container
		}}
	switch <num_players>
		case 0
		spawnscriptnow \{rockout_ai
			params = {
				player = 1
			}}
		spawnscriptnow \{rockout_ai
			params = {
				player = 2
			}}
		case 1
		spawnscriptnow \{rockout_ai
			params = {
				player = 2
			}}
	endswitch
	rockout_start_paddle_controls
	SetPlayerInfo \{1
		jam_instrument = 0}
	SetSoundBussParams \{Guitar_JamMode = {
			vol = 0
		}}
	SetSoundBussParams \{JamMode_RhythmGuitar = {
			vol = 0
		}}
	SetSoundBussParams \{JamMode_LeadGuitar = {
			vol = 0
		}}
	SetSoundBussParams \{JamMode_Bass = {
			vol = 0
		}}
	jam_init_scales
	jam_input_destroy_player_server \{player = 1}
	add_user_control_helper \{text = qs(0x67d9c56d)
		button = start
		z = 100}
endscript

script destroy_rockout_game 
	killspawnedscript \{name = rockout_initialize_ball}
	killspawnedscript \{name = rockout_check_brick_collisions}
	killspawnedscript \{name = rockout_check_screen_collisions}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_Rockout_p1}
	destroy_menu \{menu_id = scrolling_Rockout_p2}
	destroy_menu_backdrop
	if ScreenElementExists \{id = rockout_container}
		DestroyScreenElement \{id = rockout_container}
	endif
	killspawnedscript \{name = rockout_watch_buttons}
	killspawnedscript \{name = rockout_button_watcher}
	killspawnedscript \{name = rockout_brick_spawner}
	killspawnedscript \{name = rockout_fall_brick}
	killspawnedscript \{name = rockout_check_paddle_collisions_right}
	killspawnedscript \{name = rockout_check_paddle_collisions_left}
	killspawnedscript \{name = rockout_do_speaker_punch}
	killspawnedscript \{name = rockout_ai}
	killspawnedscript \{name = rockout_ball_debug}
	killspawnedscript \{name = rockout_debug_collision}
	killspawnedscript \{name = rockout_guitar_strum}
	killspawnedscript \{name = rockout_kill_strum}
	killspawnedscript \{name = rockout_drum_hit}
	killspawnedscript \{name = rockout_kill_drum_hit}
	killspawnedscript \{name = rockout_show_goal_popup}
	killspawnedscript \{name = rockout_show_score_popup}
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
	DestroyMaterial \{name = Ball_Particle_01}
	DestroyMaterial \{name = Material_BrickExplode}
	Destroy2DParticleSystem \{id = ball_particles}
	Destroy2DParticleSystem \{id = fireball_particles}
	Destroy2DParticleSystem \{id = fireball_explosion}
	killspawnedscript \{name = rockout_fireball_explosion}
	killspawnedscript \{name = rockout_create_brick_particles}
	killspawnedscript \{name = rockout_start_controls}
	rockout_cleanup_brick_particles
	end_song
	unload_songqpak
	spawnscriptnow \{menu_music_on}
endscript

script rockout_start_paddle_controls 
	if ($g_p1_ai_active = 0)
		if isguitarcontroller \{controller = 0}
			SpawnScript \{rockout_start_controls
				params = {
					type = guitar
				}}
			Change \{g_rockout_controller_1 = guitar}
		elseif isdrumcontroller \{controller = 0}
			SpawnScript \{rockout_start_controls
				params = {
					type = drums
				}}
			Change \{g_rockout_controller_1 = drums}
		else
			SpawnScript \{rockout_start_controls}
			Change \{g_rockout_controller_1 = notguitar}
		endif
	endif
	if ($g_p2_ai_active = 0)
		if isguitarcontroller \{controller = 1}
			SpawnScript \{rockout_start_controls
				params = {
					type = guitar
					player = 2
					controller = 1
				}}
			Change \{g_rockout_controller_2 = guitar}
		elseif isdrumcontroller \{controller = 1}
			SpawnScript \{rockout_start_controls
				params = {
					type = drums
					player = 2
					controller = 1
				}}
			Change \{g_rockout_controller_2 = drums}
		else
			SpawnScript \{rockout_start_controls
				params = {
					player = 2
					controller = 1
				}}
			Change \{g_rockout_controller_2 = notguitar}
		endif
	endif
endscript

script rockout_create_battle_paddles 
	CreateScreenElement \{type = ContainerElement
		id = paddle_container_p1
		parent = rockout_container
		Pos = (0.0, 0.0)
		exclusive_device = 0}
	paddle_container_p1 :SetTags \{score = 0
		lives = 0
		goals = 0}
	CreateScreenElement \{type = ContainerElement
		id = paddle_container_p2
		parent = rockout_container
		Pos = (0.0, 0.0)
		exclusive_device = 1}
	paddle_container_p2 :SetTags \{score = 0
		lives = 0
		goals = 0}
	<y> = 0
	begin
	FormatText checksumname = paddle_id 'paddle_p1_%y' y = <y>
	<new_pos> = (($g_initial_paddle_pos_left) + ((<y> * (95)) * (0.0, 1.0)))
	CreateScreenElement {
		type = SpriteElement
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
	FormatText checksumname = paddle_id 'paddle_p2_%y' y = <y>
	<new_pos> = (($g_initial_paddle_pos_right) + ((<y> * (95)) * (0.0, 1.0)))
	CreateScreenElement {
		type = SpriteElement
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
	create_menu_backdrop \{texture = rockout_bg}
	killspawnedscript \{name = rockout_brick_spawner}
	Destroy2DParticleSystem \{id = ball_particles}
	Destroy2DParticleSystem \{id = fireball_particles}
	Destroy2DParticleSystem \{id = fireball_explosion}
	killspawnedscript \{name = rockout_fireball_explosion}
	killspawnedscript \{name = rockout_create_brick_particles}
	killspawnedscript \{name = rockout_check_screen_collisions}
	rockout_cleanup_brick_particles
	rockout_kill_bricks
	unload_songqpak
	SpawnScript \{rockout_check_screen_collisions
		params = {
			id = ball_container
		}}
	rockout_initialize_rockout
endscript

script rockout_paddle_highlight \{unhighlight = 0
		with_strum = 0
		player = 1
		no_pos_morph = 0}
	FormatText checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <paddle>
	GetScreenElementProps id = <paddle_id>
	if (<unhighlight> = 0)
		if (<with_strum> = 0)
			SetScreenElementProps id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).Color)
		else
			SetScreenElementProps id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).Color) alpha = 1.0
			spawnscriptnow rockout_do_speaker_punch params = {paddle = <paddle> player = <player>}
		endif
	else
		if (<no_pos_morph> = 1)
			SetScreenElementProps id = <paddle_id> rgba = [255 255 255 255] alpha = 0.25
		else
			if (<player> = 1)
				<new_pos> = (($g_initial_paddle_pos_left) + ((<paddle> * (95)) * (0.0, 1.0)))
			else
				<new_pos> = (($g_initial_paddle_pos_right) + ((<paddle> * (95)) * (0.0, 1.0)))
			endif
			FormatText checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
			if ($<paddle_toggle> [<paddle>] = 1)
				SetScreenElementProps id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).Color) alpha = 0.25 Pos = <new_pos>
			else
				SetScreenElementProps id = <paddle_id> rgba = [255 255 255 255] alpha = 0.25 Pos = <new_pos>
			endif
		endif
	endif
endscript

script rockout_do_speaker_punch \{player = 1
		time = 0.1}
	FormatText checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <paddle>
	GetScreenElementProps id = <paddle_id>
	<initial_pos> = <Pos>
	if (<player> = 1)
		<dist> = 30
	else
		<dist> = -30
	endif
	SetScreenElementProps id = <paddle_id> Pos = (<Pos> + (<dist> * (1.0, 0.0))) time = <time> motion = ease_in
	wait <time> seconds
	SetScreenElementProps id = <paddle_id> Pos = (<initial_pos>) time = (<time> * 2.0) motion = ease_out
	FormatText checksumname = already_strummed 'g_player%p_already_strummed' p = <player>
	Change globalname = <already_strummed> newValue = 0
endscript

script rockout_drum_hit \{button = 0
		player = 1}
	if (<button> < 0 || <button> > 4)
		return
	endif
	FormatText checksumname = button_script_id 'paddle_%p_%b_script' p = <player> b = <button>
	FormatText checksumname = already_strummed 'g_player%p_already_strummed' p = <player>
	if ($<already_strummed>)
		return
	else
		Change globalname = <already_strummed> newValue = 1
		killspawnedscript id = <button_script_id>
	endif
	rockout_launch_ball player = <player>
	FormatText checksumname = paddle_used 'g_battle_paddle_used_p%p' p = <player>
	<i> = 0
	begin
	SetArrayElement arrayName = <paddle_used> GlobalArray index = <i> newValue = 0
	<i> = (<i> + 1)
	repeat 5
	FormatText checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
	if (($<paddle_used> [<button>]) = 0)
		rockout_paddle_highlight paddle = <button> with_strum = 1 player = <player>
		SetArrayElement arrayName = <paddle_toggle> GlobalArray index = <button> newValue = 1
		SetArrayElement arrayName = <paddle_used> GlobalArray index = <button> newValue = 1
	endif
	Change globalname = <already_strummed> newValue = 0
	SpawnScript rockout_kill_drum_hit params = {<...>} id = <button_script_id>
endscript

script rockout_kill_drum_hit \{time = 0.5
		player = 1}
	wait <time> seconds
	SetArrayElement arrayName = <paddle_toggle> GlobalArray index = <button> newValue = 0
	rockout_clear_paddle_highlights <...>
endscript

script rockout_guitar_strum \{player = 1}
	FormatText checksumname = already_strummed 'g_player%p_already_strummed' p = <player>
	if ($<already_strummed>)
		return
	else
		Change globalname = <already_strummed> newValue = 1
		rockout_clear_paddle_highlights <...>
	endif
	rockout_launch_ball player = <player>
	FormatText checksumname = paddle_used 'g_battle_paddle_used_p%p' p = <player>
	<i> = 0
	begin
	SetArrayElement arrayName = <paddle_used> GlobalArray index = <i> newValue = 0
	<i> = (<i> + 1)
	repeat 5
	<ho_time> = 0.5
	<elapsed_time> = 0
	rockout_strum_sound player = <player>
	if (<bad_note> = 0)
		if (<open_note> = 1)
			Change globalname = <already_strummed> newValue = 0
		endif
		FormatText checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
		begin
		<i> = 0
		begin
		if (($<paddle_toggle> [<i>]) = 1)
			if (($<paddle_used> [<i>]) = 0)
				rockout_paddle_highlight paddle = <i> with_strum = 1 player = <player>
				SetArrayElement arrayName = <paddle_used> GlobalArray index = <i> newValue = 1
				FormatText checksumname = button_script_id 'paddle_%p_%b' p = <player> b = <i>
				killspawnedscript id = <button_script_id>
				SpawnScript rockout_kill_strum params = {player = <player>} id = <button_script_id>
			endif
		endif
		<i> = (<i> + 1)
		repeat 5
		GetDeltaTime
		<elapsed_time> = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > <ho_time>)
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		Change globalname = <already_strummed> newValue = 0
	endif
endscript

script rockout_kill_strum \{time = 0.8
		player = 1}
	wait <time> seconds
	rockout_clear_paddle_highlights <...>
endscript

script rockout_clear_paddle_highlights \{button = -1}
	if NOT (<button> < 0 || <button> > 4)
		rockout_paddle_highlight paddle = <button> unhighlight = 1 player = <player>
	else
		<i> = 0
		begin
		rockout_paddle_highlight paddle = <i> unhighlight = 1 player = <player>
		<i> = (<i> + 1)
		repeat 5
	endif
endscript

script rockout_strum_sound \{player = 1}
	if issoundplaying ($g_current_strum_sound)
		StopSound ($g_current_strum_sound) fade_type = linear fade_time = $jam_fade_time
	endif
	<rhythm> = 0
	<lead> = 1
	GetHeldPattern controller = (<player> - 1)
	FormatText checksumname = player_ai 'g_p%p_ai_active' p = <player>
	FormatText checksumname = player_pad 'g_battle_paddle_toggle_p%p' p = <player>
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
		FormatText checksumname = paddle_id 'paddle_p1_%y' y = <i>
		GetScreenElementProps id = <paddle_id>
		if (<alpha> = 1)
			<TL> = (<Pos> + $g_paddle_collision_offset)
			<BR> = (<TL> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
			begin
			<n> = (<n> + 1)
			if (<n> < 5)
				if (($g_battle_paddle_toggle_p1) [<n>] = 1)
					FormatText checksumname = paddle_id 'paddle_p1_%y' y = <n>
					GetScreenElementProps id = <paddle_id>
					if (<alpha> = 1)
						<BR> = ((<Pos> + $g_paddle_collision_offset) + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
					endif
				else
					break
				endif
			else
				break
			endif
			repeat
			rockout_check_ball_collision TL = <TL> BR = <BR>
			if (<collision>)
				if ($g_current_ball_owner = 2)
					rockout_set_ball_owner \{player = 1}
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
					ball_container :ApplyForce \{Force = (250000.0, 0.0)}
					Change \{g_launch_collision = 0}
					wait \{0.5
						seconds}
				else
					GetScreenElementProps \{id = ball_container}
					if ((<linear_velocity> [1] < 10) && (<linear_velocity> [1] > -10))
						<Force> = ((0.0, 10000.0) * <linear_velocity> [1])
						ball_container :ApplyForce Force = <Force>
					endif
					ball_container :ApplyForce \{Force = (50000.0, 0.0)}
					wait \{0.5
						seconds}
				endif
			endif
		endif
	endif
	<i> = (<n> + 1)
	if (<i> > 4)
		break
	endif
	repeat 5
	wait \{1
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
		FormatText checksumname = paddle_id 'paddle_p2_%y' y = <i>
		GetScreenElementProps id = <paddle_id>
		<TL> = (<Pos> + $g_paddle_collision_offset)
		<BR> = (<TL> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
		begin
		<n> = (<n> + 1)
		if (<n> < 5)
			if (($g_battle_paddle_toggle_p2) [<n>] = 1)
				FormatText checksumname = paddle_id 'paddle_p2_%y' y = <n>
				GetScreenElementProps id = <paddle_id>
				<BR> = ((<Pos> + $g_paddle_collision_offset) + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
			else
				break
			endif
		else
			break
		endif
		repeat
		rockout_check_ball_collision TL = <TL> BR = <BR>
		if (<collision>)
			if ($g_current_ball_owner = 1)
				rockout_set_ball_owner \{player = 2}
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
				ball_container :ApplyForce \{Force = (-250000.0, 0.0)}
				Change \{g_launch_collision = 0}
				wait \{0.5
					seconds}
			else
				GetScreenElementProps \{id = ball_container}
				if ((<linear_velocity> [1] < 10) && (<linear_velocity> [1] > -10))
					<Force> = ((0.0, 10000.0) * <linear_velocity> [1])
					ball_container :ApplyForce Force = <Force>
				endif
				ball_container :ApplyForce \{Force = (-50000.0, 0.0)}
				wait \{0.5
					seconds}
			endif
		endif
	endif
	<i> = (<n> + 1)
	if (<i> > 4)
		break
	endif
	repeat 5
	wait \{1
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
	rockout_set_ball_owner \{player = 1}
	FormatText TextName = score_text qs(0x21379b76) n = ($g_player1_score)
	SetScreenElementProps id = p1_score text = <score_text>
	FormatText TextName = score_text qs(0x21379b76) n = ($g_player2_score)
	SetScreenElementProps id = p2_score text = <score_text>
	FormatText TextName = score_text qs(0x978cefda) n = (<lives>)
	SetScreenElementProps id = p1_lives text = <score_text>
	paddle_container_p1 :SetTags lives = <lives>
	FormatText TextName = score_text qs(0x978cefda) n = (<lives>)
	SetScreenElementProps id = p2_lives text = <score_text>
	paddle_container_p2 :SetTags lives = <lives>
	Change \{g_bricks_hit = 0}
	spawnscriptnow \{rockout_initialize_ball}
	spawnscriptnow \{rockout_brick_spawner}
endscript

script rockout_initialize_ball \{player = 1}
	ball_container :ClearPhysicsData
	Change \{g_launched = 0}
	Change \{g_points_multiplier = 0}
	rockout_deactivate_fireball
	if (<player> = 1)
		SetScreenElementProps id = ball_container Pos = ($g_initial_ball_pos_L)
	else
		SetScreenElementProps id = ball_container Pos = ($g_initial_ball_pos_R)
	endif
	ball_container :ApplyForce \{Force = (0.0, -300000.0)}
	Change \{g_launch_collision = 1}
	rockout_create_ball_particles
endscript

script rockout_launch_ball \{player = 1}
	if (($g_launched) = 0)
		if ($g_current_ball_owner = <player>)
			clean_up_user_control_helpers
			killspawnedscript \{name = rockout_initialize_ball}
			Change \{g_launched = 1}
		endif
	endif
endscript

script rockout_create_bricks 
	CreateScreenElement \{type = ContainerElement
		id = brick_container
		parent = rockout_container
		Pos = (0.0, 0.0)}
	<y> = 0
	begin
	<x> = 0
	begin
	FormatText checksumname = brick_id 'brick_%x_%y' x = <x> y = <y>
	<new_pos> = (($g_initial_brick_pos) + ((<x> * ($g_brick_width + $g_brick_spacing)) * (1.0, 0.0)) + ((<y> * ($g_brick_height + $g_brick_spacing)) * (0.0, 1.0)))
	CreateScreenElement {
		type = SpriteElement
		id = <brick_id>
		parent = brick_container
		texture = rockout_brick
		rgba = (($g_brick_colors [<x>]).Color)
		Pos = <new_pos>
		just = [left top]
		z_priority = 30
		alpha = 0
	}
	<x> = (<x> + 1)
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
		song = HungryLikeTheWolf}
	<time> = 0
	begin
	<old_column> = 0
	load_songqpak song_name = <song>
	get_song_prefix song = <song>
	FormatText checksumname = gem_array '%s_song_expert' s = <song_prefix>
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
		FormatText checksumname = column_used 'g_used_%c' c = <c>
		Change globalname = <column_used> newValue = 0
		<c> = (<c> + 1)
		repeat 5
		DecompressNoteValue note_value = ($<gem_array> [<i> + 1])
		<current_song_time> = ($<gem_array> [<i>])
		<c> = 0
		<note_check> = 1
		begin
		if (<note> && <note_check>)
			brick_move_time = (15 / (<velocity>))
			spawnscriptnow rockout_create_brick params = {column = <c> time = <brick_move_time>}
		endif
		<c> = (<c> + 1)
		<note_check> = (<note_check> * 2)
		repeat 5
		<i> = (<i> + 2)
	endif
	wait \{1
		gameframe}
	if (<i> > <array_size> - 1)
		break
	endif
	repeat
	wait \{2
		seconds}
	unload_songqpak
	repeat
endscript

script rockout_fall_brick \{move_time = 0.15
		appear_time = 0.25}
	<y> = 0
	begin
	if (<y> > 0)
		FormatText checksumname = brick_id 'brick_%x_%y' x = <column> y = (<y> - 1)
		SetScreenElementProps id = <brick_id> alpha = 0.0
		<brick_id> :GetTags hit
		if (<hit> = 1)
			return
		endif
	endif
	if (<y> < 6)
		FormatText checksumname = brick_id 'brick_%x_%y' x = <column> y = <y>
		SetScreenElementProps id = <brick_id> alpha = 1.0 time = <appear_time>
		<brick_id> :SetTags hit = 0
	endif
	wait <move_time> seconds
	<y> = (<y> + 1)
	repeat 7
endscript

script rockout_create_ball_particles z_priority = 3 Pos = ($g_initial_ball_pos_L) parent = ball_container
	Destroy2DParticleSystem \{id = ball_particles}
	Create2DParticleSystem \{id = ball_particles
		Pos = (32.0, 32.0)
		z_priority = 32
		material = Ball_Particle_01
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
	<x> = 0
	begin
	FormatText checksumname = brick_id 'brick_%x_%y' x = <x> y = <y>
	GetScreenElementProps id = <brick_id>
	if NOT (<alpha> = 0)
		<TL> = (<Pos> + $g_brick_collision_offset)
		<BR> = (<TL> + ((($g_brick_width) - 1) * (1.0, 0.0)) + ((($g_brick_height) - 1) * (0.0, 1.0)))
		ball_container :GetTags
		if (<fireball_active>)
			rockout_check_ball_collision TL = <TL> BR = <BR> preserve_momentum = 1
		else
			rockout_check_ball_collision TL = <TL> BR = <BR>
		endif
		if (<collision>)
			SetScreenElementProps id = <brick_id> alpha = 0
			<brick_id> :SetTags hit = 1
			Change g_bricks_hit = (($g_bricks_hit) + 1)
			rockout_calculate_score \{type = 'brick'}
			if ($g_current_ball_owner = 1)
				rockout_add_to_score player = 1 amount = (<score>)
			else
				rockout_add_to_score player = 2 amount = (<score>)
			endif
			SpawnScript rockout_show_score_popup params = {brick_pos = <Pos> brick_color = <rgba> score = <score>}
			<bass> = 2
		endif
	endif
	<x> = (<x> + 1)
	repeat ($g_num_columns)
	<y> = (<y> + 1)
	repeat ($g_num_rows)
	wait \{1
		gameframe}
	repeat
endscript

script rockout_check_screen_collisions 
	begin
	<TL> = (0.0, 150.0)
	<BR> = (1280.0, 656.0)
	<id> :CircleAABBCollisionCheck TL = <TL> BR = <BR>
	GetScreenElementProps \{id = ball_container}
	<ball_center> = (<Pos> + (31.0, 31.0))
	if ((<ball_center> [1] < (<TL> [1] - 10)) || (<ball_center> [1] > (<BR> [1] + 10)))
		Change \{g_points_multiplier = 0}
		killspawnedscript \{name = rockout_initialize_ball}
		if ($g_current_ball_owner = 1)
			rockout_set_ball_owner \{player = 2}
			spawnscriptnow \{rockout_initialize_ball
				params = {
					player = 2
				}}
		else
			rockout_set_ball_owner \{player = 1}
			spawnscriptnow \{rockout_initialize_ball
				params = {
					player = 1
				}}
		endif
	endif
	if (<ball_center> [0] > (<BR> [0] - 175))
		if ($g_current_ball_owner = 2)
			Change \{g_points_multiplier = 1}
		endif
		rockout_calculate_score \{type = 'goal'}
		rockout_set_ball_owner \{player = 1}
		rockout_add_to_score player = 1 amount = (<score>)
		rockout_increment_num_goals \{player = 1}
		SpawnScript \{rockout_update_lives
			params = {
				player = 2
				adjustment = -1
			}}
		SpawnScript rockout_show_goal_popup params = {score = <score>}
		Change \{g_points_multiplier = 0}
		wait \{1.5
			seconds}
		killspawnedscript \{name = rockout_initialize_ball}
		spawnscriptnow \{rockout_initialize_ball
			params = {
				player = 1
			}}
	elseif (<ball_center> [0] < (<TL> [0] + 175))
		if ($g_current_ball_owner = 1)
			Change \{g_points_multiplier = 1}
		endif
		rockout_calculate_score \{type = 'goal'}
		rockout_set_ball_owner \{player = 2}
		rockout_add_to_score player = 2 amount = (<score>)
		rockout_increment_num_goals \{player = 2}
		SpawnScript \{rockout_update_lives
			params = {
				player = 1
				adjustment = -1
			}}
		SpawnScript rockout_show_goal_popup params = {score = <score>}
		Change \{g_points_multiplier = 0}
		wait \{1.5
			seconds}
		killspawnedscript \{name = rockout_initialize_ball}
		spawnscriptnow \{rockout_initialize_ball
			params = {
				player = 2
			}}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script rockout_add_to_score \{player = 1
		amount = 0}
	if (<player> = 1)
		Change g_player1_score = ($g_player1_score + <amount>)
		FormatText TextName = score_text qs(0x21379b76) n = ($g_player1_score)
		SetScreenElementProps id = p1_score text = <score_text>
	else
		Change g_player2_score = ($g_player2_score + <amount>)
		FormatText TextName = score_text qs(0x21379b76) n = ($g_player2_score)
		SetScreenElementProps id = p2_score text = <score_text>
	endif
endscript

script rockout_set_ball_owner \{player = 1}
	if (<player> = 1)
		SetScreenElementProps id = ball rgba = (($g_menu_colors).p1_orangey)
		Change \{g_current_ball_owner = 1}
	elseif (<player> = 2)
		SetScreenElementProps id = ball rgba = (($g_menu_colors).p2_purpley)
		Change \{g_current_ball_owner = 2}
	endif
endscript

script rockout_create_debug_collision_rect \{TL = (0.0, 0.0)
		BR = (0.0, 0.0)}
	w = (<BR>.(1.0, 0.0) - <TL>.(1.0, 0.0))
	H = (<BR>.(0.0, 1.0) - <TL>.(0.0, 1.0))
	dims = (<w> * (1.0, 0.0) + <H> * (0.0, 1.0))
	CreateScreenElement {
		type = SpriteElement
		parent = rockout_container
		rgba = [0 255 0 25]
		texture = white
		Pos = (<TL>)
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
	wait \{1
		gameframe}
	repeat
endscript

script rockout_show_score_popup brick_pos = (900.0, 900.0) brick_color = (($g_menu_colors).p2_purpley) score = ($g_points_per_brick)
	<i> = 1
	begin
	FormatText checksumname = element_id 'brick_hit_score_%n' n = <i>
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
	SpawnScript rockout_create_brick_particles params = {Pos = <brick_center> Color = <brick_color>}
	FormatText TextName = brick_hit_score_text qs(0x4fc4b28c) n = <score>
	CreateScreenElement {
		type = TextElement
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
	FormatText TextName = current_multiplier qs(0x2543b917) n = ($g_points_multiplier)
	CreateScreenElement {
		type = TextElement
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
	FormatText TextName = score qs(0xd97d3750) n = (<score>)
	GetScreenElementProps \{id = ball_container}
	<ball_pos> = <Pos>
	<ball_center> = (<ball_pos> + (31.0, 31.0))
	CreateScreenElement {
		type = TextElement
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
		LegacyDoScreenElementMorph id = <element_id> Pos = <end_pos> alpha = 0 scale = 1.3 time = <time>
		wait <time> seconds
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
		LegacyDoScreenElementMorph id = <element_id> Pos = <end_pos> alpha = 0 scale = 0.8 time = <time>
		wait <time> seconds
		DestroyScreenElement id = <element_id>
	endif
endscript

script rockout_calculate_score \{type = 'brick'}
	switch <type>
		case 'brick'
		return score = (($g_points_multiplier) * ($g_points_per_brick))
		case 'goal'
		return score = (($g_points_multiplier) * ($g_points_per_goal))
		default
		return \{score = 0}
	endswitch
endscript

script rockout_increment_num_goals \{player = 1}
	if (<player> = 1)
		Change g_player1_goals = ($g_player1_goals + 1)
	else
		Change g_player2_goals = ($g_player2_goals + 1)
	endif
endscript

script rockout_update_lives \{player = 1
		adjustment = -1}
	if (<player> = 1)
		paddle_container_p1 :GetTags
		<lives> = (<lives> + <adjustment>)
		FormatText TextName = score_text qs(0x978cefda) n = (<lives>)
		SetScreenElementProps id = p1_lives text = <score_text>
		paddle_container_p1 :SetTags lives = <lives>
	else
		paddle_container_p2 :GetTags
		<lives> = (<lives> + <adjustment>)
		FormatText TextName = score_text qs(0x978cefda) n = (<lives>)
		SetScreenElementProps id = p2_lives text = <score_text>
		paddle_container_p2 :SetTags lives = <lives>
	endif
	if (<lives> < 1)
		if (<player> = 1)
			<victory_text> = qs(0x1fb2fb39)
		else
			<victory_text> = qs(0x63d3dee2)
		endif
		create_dialog_box {
			no_background
			heading_text = qs(0x0cd55360)
			body_text = <victory_text>
			options = [
				{
					func = rockout_restart_game
					text = qs(0xdc30b4a9)
				}
				{
					func = rockout_quit_game
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
	ball_container :SE_GetProps
	ball_container :SetTags momentum = <linear_momentum> velocity = <linear_velocity>
	ball_container :SE_SetProps \{linear_momentum = (0.0, 0.0)
		linear_velocity = (0.0, 0.0)}
	begin_song \{Pause = 1}
endscript

script rockout_unpause_game 
	begin_song
	ball_container :GetTags
	ball_container :SE_SetProps linear_momentum = <momentum>
	ball_container :SE_SetProps linear_velocity = <velocity>
endscript

script rockout_quit_game 
	generic_event_back
endscript

script rockout_ai \{player = 2}
	FormatText checksumname = ai_id 'g_p%s_ai_active' s = <player>
	Change globalname = <ai_id> newValue = 1
	begin
	<Strum> = 0
	GetScreenElementProps \{id = ball_container}
	if (($g_current_ball_owner = <player>) && (<linear_velocity> [0] = 0))
		<delay> = RandomFloat (2.0, 5.0)
		wait <delay> seconds
	endif
	GetScreenElementProps \{id = ball_container}
	<ball_pos> = <Pos>
	<ball_center> = (<ball_pos> + (32.0, 32.0))
	<i> = 0
	begin
	FormatText checksumname = paddle_id 'paddle_p%s_%y' s = <player> y = <i>
	FormatText checksumname = paddle_container_id 'paddle_container_p%s' s = <player>
	FormatText checksumname = paddle_array_id 'g_battle_paddle_toggle_p%s' s = <player>
	GetScreenElementProps id = <paddle_container_id>
	<paddle_container_pos> = <Pos>
	GetScreenElementPosition id = <paddle_id>
	<paddle_TL> = (<ScreenElementPos> + $g_paddle_collision_offset)
	<paddle_BR> = (<paddle_TL> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
	<TL> = (<paddle_TL> - (48.0, 32.0) - (<linear_velocity> / ($framerate_value)))
	<BR> = (<paddle_BR> + (48.0, 32.0) - (<linear_velocity> / ($framerate_value)))
	if (((<TL> [0] < <ball_center> [0]) && (<BR> [0] > <ball_center> [0])) || (($g_current_ball_owner = <player>) && (<linear_velocity> [0] = 0)))
		if ((<TL> [1] < <ball_center> [1]) && (<BR> [1] > <ball_center> [1]))
			SetArrayElement arrayName = <paddle_array_id> GlobalArray index = <i> newValue = 1
			spawnscriptnow rockout_drum_hit params = {player = <player> button = <i>}
			<Strum> = 1
		else
			SetArrayElement arrayName = <paddle_array_id> GlobalArray index = <i> newValue = 0
		endif
	else
		break
	endif
	<i> = (<i> + 1)
	repeat 5
	if (<Strum>)
		wait \{0.5
			seconds}
	endif
	wait \{1
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
	FormatText checksumname = element_id 'debug_ball_path_node_%n' n = <i>
	if ScreenElementExists id = <element_id>
		DestroyScreenElement id = <element_id>
	endif
	GetScreenElementProps \{id = ball_container}
	<ball_center> = (<Pos> + (31.0, 31.0))
	CreateScreenElement {
		type = SpriteElement
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
	wait \{1
		gameframes}
	repeat
endscript

script rockout_check_ball_collision \{BR = (0.0, 0.0)
		TL = (0.0, 0.0)
		preserve_momentum = 0}
	GetScreenElementProps \{id = ball_container}
	<ball_TL> = (<Pos> + (16.0, 16.0))
	<ball_BR> = (<ball_TL> + (32.0, 32.0))
	<top_penetration> = 0
	<right_penetration> = 0
	<bottom_penetration> = 0
	<left_penetration> = 0
	<lowest_ratio> = 1000
	<collision> = 0
	if ((<TL> [1] < <ball_BR> [1]) && (<BR> [1] > <ball_TL> [1]))
		if ((<TL> [0] < <ball_BR> [0]) && (<BR> [0] > <ball_TL> [0]))
			<velocity_in_frames> = (<linear_velocity> / ($framerate_value))
			<top_penetration> = (<ball_BR> [1] - <TL> [1])
			<right_penetration> = (<BR> [0] - <ball_TL> [0])
			<bottom_penetration> = (<BR> [1] - <ball_TL> [1])
			<left_penetration> = (<ball_BR> [0] - <TL> [0])
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
			material = Ball_Particle_01
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
		SpawnScript \{rockout_fireball_explosion}
	endif
endscript

script rockout_fireball_explosion 
	Destroy2DParticleSystem \{id = fireball_explosion}
	Create2DParticleSystem \{id = fireball_explosion
		Pos = (32.0, 32.0)
		z_priority = 32
		material = Ball_Particle_01
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
	wait \{10
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
	SetArrayElement \{arrayName = end_color
		index = 3
		newValue = 100}
	FormatText checksumname = explosion_id 'brick_explosion_%y' y = <current_particle>
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
		material = Material_BrickExplode
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
	wait \{5
		gameframes}
	Destroy2DParticleSystem id = <explosion_id> kill_when_empty
endscript

script rockout_cleanup_brick_particles 
	<i> = 0
	begin
	FormatText checksumname = explosion_id 'brick_explosion_%y' y = <i>
	Destroy2DParticleSystem id = <explosion_id>
	<i> = (<i> + 1)
	repeat 20
endscript

script rockout_load_songdata \{song = RebelYell}
	load_songqpak song_name = <song>
	get_song_prefix song = <song>
	FormatText checksumname = gem_array '%s_song_expert' s = <song_prefix>
	GetArraySize $<gem_array>
	<i> = 0
	begin
	<i> = (<i> + 2)
	DecompressNoteValue note_value = ($<gem_array> [<i> + 1])
	repeat (<array_size> / 2)
	unload_songqpak
endscript

script rockout_start_controls \{type = 0
		controller = 0
		player = 1}
	switch <type>
		case guitar
		SpawnScript rockout_button_watcher params = {controller = <controller> player = <player>}
		<UP_active> = 0
		<DOWN_active> = 0
		begin
		if ControllerPressed up <controller>
			if (<UP_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<UP_active> = 1
			endif
		elseif (<UP_active> = 1)
			<UP_active> = 0
		endif
		if ControllerPressed down <controller>
			if (<DOWN_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<DOWN_active> = 1
			endif
		elseif (<DOWN_active> = 1)
			<DOWN_active> = 0
		endif
		wait \{1
			gameframe}
		repeat
		case drums
		<X_active> = 0
		<CIRCLE_active> = 0
		<SQUARE_active> = 0
		<TRIANGLE_active> = 0
		<R1_active> = 0
		<L1_active> = 0
		begin
		if ControllerPressed x <controller>
			if (<X_active> = 0)
				SpawnScript rockout_drum_hit params = {player = <player> button = 4}
				<X_active> = 1
			endif
		elseif (<X_active> = 1)
			<X_active> = 0
		endif
		if ControllerPressed circle <controller>
			if (<CIRCLE_active> = 0)
				SpawnScript rockout_drum_hit params = {player = <player> button = 0}
				<CIRCLE_active> = 1
			endif
		elseif (<CIRCLE_active> = 1)
			<CIRCLE_active> = 0
		endif
		if ControllerPressed square <controller>
			if (<SQUARE_active> = 0)
				SpawnScript rockout_drum_hit params = {player = <player> button = 2}
				<SQUARE_active> = 1
			endif
		elseif (<SQUARE_active> = 1)
			<SQUARE_active> = 0
		endif
		if ControllerPressed triangle <controller>
			if (<TRIANGLE_active> = 0)
				SpawnScript rockout_drum_hit params = {player = <player> button = 1}
				<TRIANGLE_active> = 1
			endif
		elseif (<TRIANGLE_active> = 1)
			<TRIANGLE_active> = 0
		endif
		if ControllerPressed R1 <controller>
			if (<R1_active> = 0)
				SpawnScript rockout_drum_hit params = {player = <player> button = 3}
				<R1_active> = 1
			endif
		elseif (<R1_active> = 1)
			<R1_active> = 0
		endif
		if ControllerPressed l1 <controller>
			if (<L1_active> = 0)
				SpawnScript rockout_drum_hit params = {player = <player> button = 3}
				<L1_active> = 1
			endif
		elseif (<L1_active> = 1)
			<L1_active> = 0
		endif
		wait \{1
			gameframe}
		repeat
		default
		<X_active> = 0
		<L1_active> = 0
		<L2_active> = 0
		<R1_active> = 0
		<R2_active> = 0
		SpawnScript rockout_button_watcher params = {controller = <controller> player = <player>}
		begin
		if ControllerPressed x <controller>
			if (<X_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<X_active> = 1
			endif
		elseif (<X_active> = 1)
			<X_active> = 0
		endif
		if ControllerPressed R1 <controller>
			if (<R1_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<R1_active> = 1
			endif
		elseif (<R1_active> = 1)
			<R1_active> = 0
		endif
		if ControllerPressed R2 <controller>
			if (<R2_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<R2_active> = 1
			endif
		elseif (<R2_active> = 1)
			<R2_active> = 0
		endif
		if ControllerPressed l1 <controller>
			if (<L1_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<L1_active> = 1
			endif
		elseif (<L1_active> = 1)
			<L1_active> = 0
		endif
		if ControllerPressed L2 <controller>
			if (<L2_active> = 0)
				SpawnScript rockout_guitar_strum params = {player = <player>}
				<L2_active> = 1
			endif
		elseif (<L2_active> = 1)
			<L2_active> = 0
		endif
		wait \{1
			gameframe}
		repeat
	endswitch
endscript

script rockout_button_watcher \{controller = 0
		player = 1}
	begin
	FormatText checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
	GetHeldPattern controller = (<controller>)
	check_button = 65536
	array_count = 0
	begin
	if (<hold_pattern> && <check_button>)
		if ($<paddle_toggle> [<array_count>] = 0)
			SetArrayElement arrayName = <paddle_toggle> GlobalArray index = <array_count> newValue = 1
			FormatText checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <array_count>
			GetScreenElementProps id = <paddle_id>
			rockout_paddle_highlight paddle = <array_count> no_pos_morph = 1 player = <player>
		endif
	else
		if ($<paddle_toggle> [<array_count>] = 1)
			FormatText checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <array_count>
			GetScreenElementProps id = <paddle_id>
			SetArrayElement arrayName = <paddle_toggle> GlobalArray index = <array_count> newValue = 0
			rockout_paddle_highlight paddle = <array_count> unhighlight = 1 no_pos_morph = 1 player = <player>
		endif
	endif
	<check_button> = (<check_button> / 16)
	<array_count> = (<array_count> + 1)
	repeat 5
	wait \{1
		gameframe}
	repeat
endscript

script rockout_create_brick \{current_brick = 1
		column = 1
		time = 5}
	rockout_container :GetTags
	FormatText checksumname = brick_id 'brick_%n' n = <current_brick>
	<current_brick> = (<current_brick> + 1)
	if (<current_brick> > <max_bricks>)
		<current_brick> = 0
	endif
	rockout_container :SetTags current_brick = <current_brick>
	DestroyScreenElement id = <brick_id>
	<start_pos> = (($g_initial_brick_pos) + ((<column> * ($g_brick_width + $g_brick_spacing)) * (1.0, 0.0)) - (0.0, 150.0))
	CreateScreenElement {
		type = SpriteElement
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
	wait <time> seconds
	DestroyScreenElement id = <brick_id>
endscript

script rockout_kill_bricks 
	rockout_container :GetTags
	<i> = 0
	begin
	FormatText checksumname = brick_id 'brick_%n' n = <i>
	DestroyScreenElement id = <brick_id>
	<i> = (<i> + 1)
	repeat <max_bricks>
	rockout_container :SetTags \{current_brick = 0}
endscript

script rockout_check_single_brick_collision 
	begin
	Obj_GetID
	GetScreenElementProps id = <objID>
	<TL> = (<Pos> + $g_brick_collision_offset)
	<BR> = (<TL> + ((($g_brick_width) - 1) * (1.0, 0.0)) + ((($g_brick_height) - 1) * (0.0, 1.0)))
	ball_container :GetTags
	if (<fireball_active>)
		rockout_check_ball_collision TL = <TL> BR = <BR> preserve_momentum = 1
	else
		rockout_check_ball_collision TL = <TL> BR = <BR>
	endif
	if (<collision>)
		Change g_bricks_hit = (($g_bricks_hit) + 1)
		rockout_calculate_score \{type = 'brick'}
		if ($g_current_ball_owner = 1)
			rockout_add_to_score player = 1 amount = (<score>)
		else
			rockout_add_to_score player = 2 amount = (<score>)
		endif
		SpawnScript rockout_show_score_popup params = {brick_pos = <Pos> brick_color = <rgba> score = <score>}
		<bass> = 2
		DestroyScreenElement id = <objID>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

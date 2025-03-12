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
		color = [
			60
			180
			90
			255
		]
	}
	{
		color = [
			255
			75
			85
			255
		]
	}
	{
		color = [
			210
			200
			0
			255
		]
	}
	{
		color = [
			60
			155
			220
			255
		]
	}
	{
		color = [
			245
			145
			40
			255
		]
	}
]
g_drum_colors = [
	{
		color = [
			255
			75
			85
			255
		]
	}
	{
		color = [
			210
			200
			0
			255
		]
	}
	{
		color = [
			60
			155
			220
			255
		]
	}
	{
		color = [
			245
			145
			40
			255
		]
	}
	{
		color = [
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
g_current_strum_sound = single_player_bad_note_guitar
rockout_goal_info = {
	name = 'rockout_goal'
	goal_type = testing
	data = {
		num_players = 0
	}
	constants = {
		start_zone = null
	}
	checkpoints = [
		{
			name = 'initial_dialog_CP'
			next_checkpoint = next_dialog_cp
			tools = [
				{
					name = 'num_players_dialog'
					type = menu
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
					type = menu
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
					type = pause
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
	gman_setnextcheckpoint \{goal = rockout_goal
		next_checkpoint = initial_dialog_cp}
	gman_passcheckpoint \{goal = rockout_goal}
endscript

script rockout_say_yes 
	spawnscriptnow \{create_rockout_game}
endscript

script rockout_start_menu_tool 
	gman_menufunc \{goal = rockout_goal
		checkpoint = initial_dialog_cp
		tool = num_players_dialog
		func = start}
endscript

script rockout_stop_menu_tool 
	gman_menufunc \{goal = rockout_goal
		checkpoint = initial_dialog_cp
		tool = num_players_dialog
		func = stop}
endscript

script rockout_add_goal 
	gman_addgoal \{goal_info = $rockout_goal_info}
	gman_initializegoal \{goal = rockout_goal}
	begin
	if gman_goalisinitialized \{goal = rockout_goal}
		break
	endif
	wait \{1
		gameframe}
	repeat
	gman_activategoal \{goal = rockout_goal}
endscript

script rockout_remove_goal 
	if gman_goalexists \{goal = rockout_goal}
		if gman_goalisinitialized \{goal = rockout_goal}
			if gman_goalisactive \{goal = rockout_goal}
				gman_deactivategoal \{goal = rockout_goal}
				begin
				if NOT gman_goalisactive \{goal = rockout_goal}
					break
				endif
				wait \{1
					gameframe}
				repeat
			endif
			gman_uninitializegoal \{goal = rockout_goal}
			begin
			if NOT gman_goalisinitialized \{goal = rockout_goal}
				break
			endif
			wait \{1
				gameframe}
			repeat
		endif
		gman_removegoal \{goal = rockout_goal}
	endif
endscript

script rockout_set_num_players 
	gman_setdata goal = rockout_goal params = {num_players = <num_players>}
	gman_passcheckpoint \{goal = rockout_goal}
endscript

script create_rockout_game 
	gman_setnextcheckpoint \{goal = rockout_goal
		next_checkpoint = rockout_cp}
	gman_passcheckpoint \{goal = rockout_goal}
	gman_getdata \{goal = rockout_goal
		name = num_players}
	audio_ui_menu_music_off
	creatematerial \{name = ball_particle_01
		template = immediatemode_ui
		technique = ui_col_tex_2d
		blendmode = add
		materialprops = [
			{
				name = m_pspass0materialcolor
				vectorproperty = [
					1.0
					1.0
					1.0
					1.0
				]
			}
			{
				name = m_samppass0diffuse
				textureproperty = ph_firepuffs
			}
		]}
	creatematerial \{name = material_brickexplode
		template = immediatemode_ui
		technique = ui_col_tex_2d
		blendmode = add
		materialprops = [
			{
				name = m_pspass0materialcolor
				vectorproperty = [
					1.0
					1.0
					1.0
					1.0
				]
			}
			{
				name = m_samppass0diffuse
				textureproperty = jow_buttonstar01
			}
		]}
	createscreenelement \{type = containerelement
		id = rockout_container
		parent = root_window
		pos = (0.0, 0.0)}
	rockout_container :settags \{current_particle = 0
		current_brick = 0
		max_bricks = 20}
	createscreenelement \{type = spriteelement
		id = foreground
		parent = rockout_container
		texture = rockout_fg
		dims = (1280.0, 720.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 30}
	createscreenelement {
		type = physicselement
		id = ball_container
		parent = rockout_container
		pos = ($g_initial_ball_pos)
		mass = 10.0
		center = (31.0, 31.0)
		radius = 22.630001
		elasticity = 1.0
	}
	ball_container :settags \{fireball_active = 0}
	createscreenelement \{type = spriteelement
		id = ball
		parent = ball_container
		texture = rockout_ball
		dims = (64.0, 64.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 30}
	formattext textname = score_text qs(0x21379b76) n = ($g_player1_score)
	createscreenelement {
		type = textelement
		id = p1_score
		parent = rockout_container
		rgba = (($g_menu_colors).p1_orangey)
		font = debug
		pos = (250.0, 50.0)
		text = <score_text>
		just = [left top]
		z_priority = 31
	}
	formattext textname = score_text qs(0x21379b76) n = ($g_player2_score)
	createscreenelement {
		type = textelement
		id = p2_score
		parent = rockout_container
		rgba = (($g_menu_colors).p2_purpley)
		font = debug
		pos = (850.0, 50.0)
		text = <score_text>
		just = [left top]
		z_priority = 31
	}
	createscreenelement {
		type = textelement
		id = p1_lives
		parent = rockout_container
		rgba = (($g_menu_colors).p1_orangey)
		font = debug
		pos = (250.0, 100.0)
		text = qs(0xdf1ee302)
		just = [left top]
		z_priority = 31
	}
	createscreenelement {
		type = textelement
		id = p2_lives
		parent = rockout_container
		rgba = (($g_menu_colors).p2_purpley)
		font = debug
		pos = (850.0, 100.0)
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
	destroy_menu \{menu_id = scrolling_rockout_p1}
	destroy_menu \{menu_id = scrolling_rockout_p2}
	destroy_menu_backdrop
	if screenelementexists \{id = rockout_container}
		destroyscreenelement \{id = rockout_container}
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
	change \{g_p1_ai_active = 0}
	change \{g_p2_ai_active = 0}
	change \{g_player1_already_strummed = 0}
	change \{g_player2_already_strummed = 0}
	change \{g_battle_paddle_toggle_p1 = [
			0
			0
			0
			0
			0
		]}
	change \{g_battle_paddle_toggle_p2 = [
			0
			0
			0
			0
			0
		]}
	change \{g_battle_paddle_used_p1 = [
			0
			0
			0
			0
			0
		]}
	change \{g_battle_paddle_used_p2 = [
			0
			0
			0
			0
			0
		]}
	destroymaterial \{name = ball_particle_01}
	destroymaterial \{name = material_brickexplode}
	destroy2dparticlesystem \{id = ball_particles}
	destroy2dparticlesystem \{id = fireball_particles}
	destroy2dparticlesystem \{id = fireball_explosion}
	killspawnedscript \{name = rockout_fireball_explosion}
	killspawnedscript \{name = rockout_create_brick_particles}
	killspawnedscript \{name = rockout_start_controls}
	rockout_cleanup_brick_particles
	songaudiostop
	unload_songqpak
	spawnscriptnow \{audio_ui_menu_music_on}
endscript

script rockout_start_paddle_controls 
	if ($g_p1_ai_active = 0)
		if isguitarcontroller \{controller = 0}
			spawnscript \{rockout_start_controls
				params = {
					type = guitar
				}}
			change \{g_rockout_controller_1 = guitar}
		elseif isdrumcontroller \{controller = 0}
			spawnscript \{rockout_start_controls
				params = {
					type = drums
				}}
			change \{g_rockout_controller_1 = drums}
		else
			spawnscript \{rockout_start_controls}
			change \{g_rockout_controller_1 = notguitar}
		endif
	endif
	if ($g_p2_ai_active = 0)
		if isguitarcontroller \{controller = 1}
			spawnscript \{rockout_start_controls
				params = {
					type = guitar
					player = 2
					controller = 1
				}}
			change \{g_rockout_controller_2 = guitar}
		elseif isdrumcontroller \{controller = 1}
			spawnscript \{rockout_start_controls
				params = {
					type = drums
					player = 2
					controller = 1
				}}
			change \{g_rockout_controller_2 = drums}
		else
			spawnscript \{rockout_start_controls
				params = {
					player = 2
					controller = 1
				}}
			change \{g_rockout_controller_2 = notguitar}
		endif
	endif
endscript

script rockout_create_battle_paddles 
	createscreenelement \{type = containerelement
		id = paddle_container_p1
		parent = rockout_container
		pos = (0.0, 0.0)
		exclusive_device = 0}
	paddle_container_p1 :settags \{score = 0
		lives = 0
		goals = 0}
	createscreenelement \{type = containerelement
		id = paddle_container_p2
		parent = rockout_container
		pos = (0.0, 0.0)
		exclusive_device = 1}
	paddle_container_p2 :settags \{score = 0
		lives = 0
		goals = 0}
	<y> = 0
	begin
	formattext checksumname = paddle_id 'paddle_p1_%y' y = <y>
	<new_pos> = (($g_initial_paddle_pos_left) + ((<y> * (95)) * (0.0, 1.0)))
	createscreenelement {
		type = spriteelement
		id = <paddle_id>
		parent = paddle_container_p1
		texture = rockout_paddle
		dims = (64.0, 198.0)
		pos = <new_pos>
		just = [left top]
		z_priority = 30
		alpha = 0.25
	}
	<y> = (<y> + 1)
	repeat 5
	<y> = 0
	begin
	formattext checksumname = paddle_id 'paddle_p2_%y' y = <y>
	<new_pos> = (($g_initial_paddle_pos_right) + ((<y> * (95)) * (0.0, 1.0)))
	createscreenelement {
		type = spriteelement
		id = <paddle_id>
		parent = paddle_container_p2
		texture = rockout_paddle
		dims = (64.0, 198.0)
		pos = <new_pos>
		just = [left top]
		z_priority = 30
		alpha = 0.25
	}
	<y> = (<y> + 1)
	repeat 5
endscript

script rockout_initialize_values 
	change \{g_bricks_hit = 0}
	change \{g_launched = 0}
	change \{g_launch_collision = 1}
	change \{g_current_ball_owner = 1}
	change \{g_points_multiplier = 0}
	change \{g_player1_score = 0}
	change \{g_player2_score = 0}
	change \{g_player1_goals = 0}
	change \{g_player2_goals = 0}
	change \{g_player1_already_strummed = 0}
	change \{g_player2_already_strummed = 0}
	change \{g_rockout_controller_1 = guitar}
	change \{g_rockout_controller_2 = guitar}
	change \{g_battle_paddle_toggle_p1 = [
			0
			0
			0
			0
			0
		]}
	change \{g_battle_paddle_toggle_p2 = [
			0
			0
			0
			0
			0
		]}
	change \{g_battle_paddle_used_p1 = [
			0
			0
			0
			0
			0
		]}
	change \{g_battle_paddle_used_p2 = [
			0
			0
			0
			0
			0
		]}
	ball_container :settags \{fireball_active = 0}
	rockout_container :settags \{current_particle = 0
		current_brick = 0
		max_bricks = 20}
endscript

script rockout_restart_game 
	create_menu_backdrop \{texture = rockout_bg}
	killspawnedscript \{name = rockout_brick_spawner}
	destroy2dparticlesystem \{id = ball_particles}
	destroy2dparticlesystem \{id = fireball_particles}
	destroy2dparticlesystem \{id = fireball_explosion}
	killspawnedscript \{name = rockout_fireball_explosion}
	killspawnedscript \{name = rockout_create_brick_particles}
	killspawnedscript \{name = rockout_check_screen_collisions}
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
		player = 1
		no_pos_morph = 0}
	formattext checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <paddle>
	getscreenelementprops id = <paddle_id>
	if (<unhighlight> = 0)
		if (<with_strum> = 0)
			setscreenelementprops id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).color)
		else
			setscreenelementprops id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).color) alpha = 1.0
			spawnscriptnow rockout_do_speaker_punch params = {paddle = <paddle> player = <player>}
		endif
	else
		if (<no_pos_morph> = 1)
			setscreenelementprops id = <paddle_id> rgba = [255 255 255 255] alpha = 0.25
		else
			if (<player> = 1)
				<new_pos> = (($g_initial_paddle_pos_left) + ((<paddle> * (95)) * (0.0, 1.0)))
			else
				<new_pos> = (($g_initial_paddle_pos_right) + ((<paddle> * (95)) * (0.0, 1.0)))
			endif
			formattext checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
			if ($<paddle_toggle> [<paddle>] = 1)
				setscreenelementprops id = <paddle_id> rgba = (($g_brick_colors [<paddle>]).color) alpha = 0.25 pos = <new_pos>
			else
				setscreenelementprops id = <paddle_id> rgba = [255 255 255 255] alpha = 0.25 pos = <new_pos>
			endif
		endif
	endif
endscript

script rockout_do_speaker_punch \{player = 1
		time = 0.1}
	formattext checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <paddle>
	getscreenelementprops id = <paddle_id>
	<initial_pos> = <pos>
	if (<player> = 1)
		<dist> = 30
	else
		<dist> = -30
	endif
	setscreenelementprops id = <paddle_id> pos = (<pos> + (<dist> * (1.0, 0.0))) time = <time> motion = ease_in
	wait <time> seconds
	setscreenelementprops id = <paddle_id> pos = (<initial_pos>) time = (<time> * 2.0) motion = ease_out
	formattext checksumname = already_strummed 'g_player%p_already_strummed' p = <player>
	change globalname = <already_strummed> newvalue = 0
endscript

script rockout_drum_hit \{button = 0
		player = 1}
	if (<button> < 0 || <button> > 4)
		return
	endif
	formattext checksumname = button_script_id 'paddle_%p_%b_script' p = <player> b = <button>
	formattext checksumname = already_strummed 'g_player%p_already_strummed' p = <player>
	if ($<already_strummed>)
		return
	else
		change globalname = <already_strummed> newvalue = 1
		killspawnedscript id = <button_script_id>
	endif
	rockout_launch_ball player = <player>
	formattext checksumname = paddle_used 'g_battle_paddle_used_p%p' p = <player>
	<i> = 0
	begin
	setarrayelement arrayname = <paddle_used> globalarray index = <i> newvalue = 0
	<i> = (<i> + 1)
	repeat 5
	formattext checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
	if (($<paddle_used> [<button>]) = 0)
		rockout_paddle_highlight paddle = <button> with_strum = 1 player = <player>
		setarrayelement arrayname = <paddle_toggle> globalarray index = <button> newvalue = 1
		setarrayelement arrayname = <paddle_used> globalarray index = <button> newvalue = 1
	endif
	change globalname = <already_strummed> newvalue = 0
	spawnscript rockout_kill_drum_hit params = {<...>} id = <button_script_id>
endscript

script rockout_kill_drum_hit \{time = 0.5
		player = 1}
	wait <time> seconds
	setarrayelement arrayname = <paddle_toggle> globalarray index = <button> newvalue = 0
	rockout_clear_paddle_highlights <...>
endscript

script rockout_guitar_strum \{player = 1}
	formattext checksumname = already_strummed 'g_player%p_already_strummed' p = <player>
	if ($<already_strummed>)
		return
	else
		change globalname = <already_strummed> newvalue = 1
		rockout_clear_paddle_highlights <...>
	endif
	rockout_launch_ball player = <player>
	formattext checksumname = paddle_used 'g_battle_paddle_used_p%p' p = <player>
	<i> = 0
	begin
	setarrayelement arrayname = <paddle_used> globalarray index = <i> newvalue = 0
	<i> = (<i> + 1)
	repeat 5
	<ho_time> = 0.5
	<elapsed_time> = 0
	rockout_strum_sound player = <player>
	if (<bad_note> = 0)
		if (<open_note> = 1)
			change globalname = <already_strummed> newvalue = 0
		endif
		formattext checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
		begin
		<i> = 0
		begin
		if (($<paddle_toggle> [<i>]) = 1)
			if (($<paddle_used> [<i>]) = 0)
				rockout_paddle_highlight paddle = <i> with_strum = 1 player = <player>
				setarrayelement arrayname = <paddle_used> globalarray index = <i> newvalue = 1
				formattext checksumname = button_script_id 'paddle_%p_%b' p = <player> b = <i>
				killspawnedscript id = <button_script_id>
				spawnscript rockout_kill_strum params = {player = <player>} id = <button_script_id>
			endif
		endif
		<i> = (<i> + 1)
		repeat 5
		getdeltatime
		<elapsed_time> = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > <ho_time>)
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		change globalname = <already_strummed> newvalue = 0
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
		stopsound ($g_current_strum_sound) fade_type = linear fade_time = $jam_fade_time
	endif
	<rhythm> = 0
	<lead> = 1
	getheldpattern controller = (<player> - 1)
	formattext checksumname = player_ai 'g_p%p_ai_active' p = <player>
	formattext checksumname = player_pad 'g_battle_paddle_toggle_p%p' p = <player>
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
	getscreenelementprops id = <id>
	<i> = 0
	begin
	<n> = (<i>)
	if (($g_battle_paddle_toggle_p1) [<i>] = 1)
		formattext checksumname = paddle_id 'paddle_p1_%y' y = <i>
		getscreenelementprops id = <paddle_id>
		if (<alpha> = 1)
			<top_left> = (<pos> + $g_paddle_collision_offset)
			<bottom_right> = (<top_left> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
			begin
			<n> = (<n> + 1)
			if (<n> < 5)
				if (($g_battle_paddle_toggle_p1) [<n>] = 1)
					formattext checksumname = paddle_id 'paddle_p1_%y' y = <n>
					getscreenelementprops id = <paddle_id>
					if (<alpha> = 1)
						<bottom_right> = ((<pos> + $g_paddle_collision_offset) + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
					endif
				else
					break
				endif
			else
				break
			endif
			repeat
			rockout_check_ball_collision top_left = <top_left> bottom_right = <bottom_right>
			if (<collision>)
				if ($g_current_ball_owner = 2)
					rockout_set_ball_owner \{player = 1}
					change \{g_points_multiplier = 0}
				endif
				change g_points_multiplier = (($g_points_multiplier) + 1)
				if ($g_points_multiplier > 4)
					rockout_activate_fireball
				else
					rockout_deactivate_fireball
				endif
				rockout_show_multiplier
				if ($g_launch_collision = 1)
					ball_container :applyforce \{force = (250000.0, 0.0)}
					change \{g_launch_collision = 0}
					wait \{0.5
						seconds}
				else
					getscreenelementprops \{id = ball_container}
					if ((<linear_velocity> [1] < 10) && (<linear_velocity> [1] > -10))
						<force> = ((0.0, 10000.0) * <linear_velocity> [1])
						ball_container :applyforce force = <force>
					endif
					ball_container :applyforce \{force = (50000.0, 0.0)}
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
	getscreenelementprops id = <id>
	<i> = 0
	begin
	<n> = (<i>)
	if (($g_battle_paddle_toggle_p2) [<i>] = 1)
		formattext checksumname = paddle_id 'paddle_p2_%y' y = <i>
		getscreenelementprops id = <paddle_id>
		<top_left> = (<pos> + $g_paddle_collision_offset)
		<bottom_right> = (<top_left> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
		begin
		<n> = (<n> + 1)
		if (<n> < 5)
			if (($g_battle_paddle_toggle_p2) [<n>] = 1)
				formattext checksumname = paddle_id 'paddle_p2_%y' y = <n>
				getscreenelementprops id = <paddle_id>
				<bottom_right> = ((<pos> + $g_paddle_collision_offset) + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
			else
				break
			endif
		else
			break
		endif
		repeat
		rockout_check_ball_collision top_left = <top_left> bottom_right = <bottom_right>
		if (<collision>)
			if ($g_current_ball_owner = 1)
				rockout_set_ball_owner \{player = 2}
				change \{g_points_multiplier = 0}
			endif
			change g_points_multiplier = (($g_points_multiplier) + 1)
			if ($g_points_multiplier > 4)
				rockout_activate_fireball
			else
				rockout_deactivate_fireball
			endif
			rockout_show_multiplier
			if ($g_launch_collision = 1)
				ball_container :applyforce \{force = (-250000.0, 0.0)}
				change \{g_launch_collision = 0}
				wait \{0.5
					seconds}
			else
				getscreenelementprops \{id = ball_container}
				if ((<linear_velocity> [1] < 10) && (<linear_velocity> [1] > -10))
					<force> = ((0.0, 10000.0) * <linear_velocity> [1])
					ball_container :applyforce force = <force>
				endif
				ball_container :applyforce \{force = (-50000.0, 0.0)}
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
	if screenelementexists \{id = brick_container}
		destroyscreenelement \{id = brick_container}
	endif
	change \{g_player1_score = 0}
	change \{g_player2_score = 0}
	change \{g_player1_goals = 0}
	change \{g_player2_goals = 0}
	rockout_set_ball_owner \{player = 1}
	formattext textname = score_text qs(0x21379b76) n = ($g_player1_score)
	setscreenelementprops id = p1_score text = <score_text>
	formattext textname = score_text qs(0x21379b76) n = ($g_player2_score)
	setscreenelementprops id = p2_score text = <score_text>
	formattext textname = score_text qs(0x978cefda) n = (<lives>)
	setscreenelementprops id = p1_lives text = <score_text>
	paddle_container_p1 :settags lives = <lives>
	formattext textname = score_text qs(0x978cefda) n = (<lives>)
	setscreenelementprops id = p2_lives text = <score_text>
	paddle_container_p2 :settags lives = <lives>
	change \{g_bricks_hit = 0}
	spawnscriptnow \{rockout_initialize_ball}
	spawnscriptnow \{rockout_brick_spawner}
endscript

script rockout_initialize_ball \{player = 1}
	ball_container :clearphysicsdata
	change \{g_launched = 0}
	change \{g_points_multiplier = 0}
	rockout_deactivate_fireball
	if (<player> = 1)
		setscreenelementprops id = ball_container pos = ($g_initial_ball_pos_l)
	else
		setscreenelementprops id = ball_container pos = ($g_initial_ball_pos_r)
	endif
	ball_container :applyforce \{force = (0.0, -300000.0)}
	change \{g_launch_collision = 1}
	rockout_create_ball_particles
endscript

script rockout_launch_ball \{player = 1}
	if (($g_launched) = 0)
		if ($g_current_ball_owner = <player>)
			clean_up_user_control_helpers
			killspawnedscript \{name = rockout_initialize_ball}
			change \{g_launched = 1}
		endif
	endif
endscript

script rockout_create_bricks 
	createscreenelement \{type = containerelement
		id = brick_container
		parent = rockout_container
		pos = (0.0, 0.0)}
	<y> = 0
	begin
	<x> = 0
	begin
	formattext checksumname = brick_id 'brick_%x_%y' x = <x> y = <y>
	<new_pos> = (($g_initial_brick_pos) + ((<x> * ($g_brick_width + $g_brick_spacing)) * (1.0, 0.0)) + ((<y> * ($g_brick_height + $g_brick_spacing)) * (0.0, 1.0)))
	createscreenelement {
		type = spriteelement
		id = <brick_id>
		parent = brick_container
		texture = rockout_brick
		rgba = (($g_brick_colors [<x>]).color)
		pos = <new_pos>
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
		song = hungrylikethewolf}
	<time> = 0
	begin
	<old_column> = 0
	load_songqpak song_name = <song>
	get_song_prefix song = <song>
	formattext checksumname = gem_array '%s_song_expert' s = <song_prefix>
	songaudioload song_name = <song> starttime = 0 fadeintime = 1.0
	songaudioplay
	getarraysize $<gem_array>
	<i> = 0
	<current_song_time> = 0
	<move_time> = ($<gem_array> [0] / 1000)
	reset_song_time
	begin
	getsongtimems
	if (<time> >= $<gem_array> [<i>])
		<c> = 0
		begin
		formattext checksumname = column_used 'g_used_%c' c = <c>
		change globalname = <column_used> newvalue = 0
		<c> = (<c> + 1)
		repeat 5
		decompressnotevalue note_value = ($<gem_array> [<i> + 1])
		<current_song_time> = ($<gem_array> [<i>])
		<c> = 0
		<note_check> = 1
		begin
		if (<note_value> && <note_check>)
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
		formattext checksumname = brick_id 'brick_%x_%y' x = <column> y = (<y> - 1)
		setscreenelementprops id = <brick_id> alpha = 0.0
		<brick_id> :gettags hit
		if (<hit> = 1)
			return
		endif
	endif
	if (<y> < 6)
		formattext checksumname = brick_id 'brick_%x_%y' x = <column> y = <y>
		setscreenelementprops id = <brick_id> alpha = 1.0 time = <appear_time>
		<brick_id> :settags hit = 0
	endif
	wait <move_time> seconds
	<y> = (<y> + 1)
	repeat 7
endscript

script rockout_create_ball_particles z_priority = 3 pos = ($g_initial_ball_pos_l) parent = ball_container
	destroy2dparticlesystem \{id = ball_particles}
	create2dparticlesystem \{id = ball_particles
		pos = (32.0, 32.0)
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
		emit_rate = 0.03
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
	formattext checksumname = brick_id 'brick_%x_%y' x = <x> y = <y>
	getscreenelementprops id = <brick_id>
	if NOT (<alpha> = 0)
		<top_left> = (<pos> + $g_brick_collision_offset)
		<bottom_right> = (<top_left> + ((($g_brick_width) - 1) * (1.0, 0.0)) + ((($g_brick_height) - 1) * (0.0, 1.0)))
		ball_container :gettags
		if (<fireball_active>)
			rockout_check_ball_collision top_left = <top_left> bottom_right = <bottom_right> preserve_momentum = 1
		else
			rockout_check_ball_collision top_left = <top_left> bottom_right = <bottom_right>
		endif
		if (<collision>)
			setscreenelementprops id = <brick_id> alpha = 0
			<brick_id> :settags hit = 1
			change g_bricks_hit = (($g_bricks_hit) + 1)
			rockout_calculate_score \{type = 'brick'}
			if ($g_current_ball_owner = 1)
				rockout_add_to_score player = 1 amount = (<score>)
			else
				rockout_add_to_score player = 2 amount = (<score>)
			endif
			spawnscript rockout_show_score_popup params = {brick_pos = <pos> brick_color = <rgba> score = <score>}
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
	<top_left> = (0.0, 150.0)
	<bottom_right> = (1280.0, 656.0)
	<id> :circleaabbcollisioncheck top_left = <top_left> bottom_right = <bottom_right>
	getscreenelementprops \{id = ball_container}
	<ball_center> = (<pos> + (31.0, 31.0))
	if ((<ball_center> [1] < (<top_left> [1] - 10)) || (<ball_center> [1] > (<bottom_right> [1] + 10)))
		change \{g_points_multiplier = 0}
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
	if (<ball_center> [0] > (<bottom_right> [0] - 175))
		if ($g_current_ball_owner = 2)
			change \{g_points_multiplier = 1}
		endif
		rockout_calculate_score \{type = 'goal'}
		rockout_set_ball_owner \{player = 1}
		rockout_add_to_score player = 1 amount = (<score>)
		rockout_increment_num_goals \{player = 1}
		spawnscript \{rockout_update_lives
			params = {
				player = 2
				adjustment = -1
			}}
		spawnscript rockout_show_goal_popup params = {score = <score>}
		change \{g_points_multiplier = 0}
		wait \{1.5
			seconds}
		killspawnedscript \{name = rockout_initialize_ball}
		spawnscriptnow \{rockout_initialize_ball
			params = {
				player = 1
			}}
	elseif (<ball_center> [0] < (<top_left> [0] + 175))
		if ($g_current_ball_owner = 1)
			change \{g_points_multiplier = 1}
		endif
		rockout_calculate_score \{type = 'goal'}
		rockout_set_ball_owner \{player = 2}
		rockout_add_to_score player = 2 amount = (<score>)
		rockout_increment_num_goals \{player = 2}
		spawnscript \{rockout_update_lives
			params = {
				player = 1
				adjustment = -1
			}}
		spawnscript rockout_show_goal_popup params = {score = <score>}
		change \{g_points_multiplier = 0}
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
		change g_player1_score = ($g_player1_score + <amount>)
		formattext textname = score_text qs(0x21379b76) n = ($g_player1_score)
		setscreenelementprops id = p1_score text = <score_text>
	else
		change g_player2_score = ($g_player2_score + <amount>)
		formattext textname = score_text qs(0x21379b76) n = ($g_player2_score)
		setscreenelementprops id = p2_score text = <score_text>
	endif
endscript

script rockout_set_ball_owner \{player = 1}
	if (<player> = 1)
		setscreenelementprops id = ball rgba = (($g_menu_colors).p1_orangey)
		change \{g_current_ball_owner = 1}
	elseif (<player> = 2)
		setscreenelementprops id = ball rgba = (($g_menu_colors).p2_purpley)
		change \{g_current_ball_owner = 2}
	endif
endscript

script rockout_create_debug_collision_rect \{top_left = (0.0, 0.0)
		bottom_right = (0.0, 0.0)}
	w = (<bottom_right>.(1.0, 0.0) - <top_left>.(1.0, 0.0))
	h = (<bottom_right>.(0.0, 1.0) - <top_left>.(0.0, 1.0))
	dims = (<w> * (1.0, 0.0) + <h> * (0.0, 1.0))
	createscreenelement {
		type = spriteelement
		parent = rockout_container
		rgba = [0 255 0 25]
		texture = white
		pos = (<top_left>)
		dims = <dims>
		just = [left top]
		z_priority = 31000
	}
endscript

script rockout_display_ball_velocity 
	<time> = 1.0
	<elapsed_time> = 0
	begin
	getdeltatime
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	if (<elapsed_time> > <time>)
		getscreenelementprops \{id = ball_container}
		setscreenelementprops \{id = ball_container
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
	formattext checksumname = element_id 'brick_hit_score_%n' n = <i>
	if screenelementexists id = <element_id>
		<i> = (<i> + 1)
	else
		break
	endif
	if (<i> = (($g_total_score_popups) + 1))
		return
	endif
	repeat
	<brick_center> = (<brick_pos> + ($g_brick_width / 2) * (1.0, 0.0) + ($g_brick_height / 2) * (0.0, 1.0))
	spawnscript rockout_create_brick_particles params = {pos = <brick_center> color = <brick_color>}
	formattext textname = brick_hit_score_text qs(0x4fc4b28c) n = <score>
	createscreenelement {
		type = textelement
		id = <element_id>
		parent = rockout_container
		rgba = (<brick_color>)
		font = debug
		pos = <brick_center>
		text = <brick_hit_score_text>
		just = [center center]
		z_priority = 31
	}
	runscriptonscreenelement id = <element_id> rockout_popup_move_to_score params = {element_id = <element_id>}
endscript

script rockout_show_multiplier \{ball_pos = (400.0, 400.0)}
	if ($g_points_multiplier = 1)
		return
	endif
	if screenelementexists \{id = multiplier_popup}
		destroyscreenelement \{id = multiplier_popup}
	endif
	getscreenelementprops \{id = ball_container}
	<ball_pos> = <pos>
	getscreenelementprops \{id = rockout_container}
	<rockout_pos> = <pos>
	<ball_center> = (<ball_pos> + <rockout_pos> + (31.0, 31.0))
	formattext textname = current_multiplier qs(0x2543b917) n = ($g_points_multiplier)
	createscreenelement {
		type = textelement
		id = multiplier_popup
		parent = rockout_container
		rgba = [255 255 255 255]
		font = debug
		pos = <ball_center>
		text = <current_multiplier>
		just = [center center]
		z_priority = 31
	}
	runscriptonscreenelement \{id = multiplier_popup
		rockout_popup_rise_and_fade
		params = {
			element_id = multiplier_popup
		}}
endscript

script rockout_show_goal_popup score = ($g_points_per_goal)
	if screenelementexists \{id = goal_popup}
		destroyscreenelement \{id = goal_popup}
	endif
	formattext textname = score qs(0xd97d3750) n = (<score>)
	getscreenelementprops \{id = ball_container}
	<ball_pos> = <pos>
	<ball_center> = (<ball_pos> + (31.0, 31.0))
	createscreenelement {
		type = textelement
		id = goal_popup
		parent = rockout_container
		rgba = [255 255 255 255]
		font = debug
		pos = <ball_center>
		text = <score>
		just = [center center]
		z_priority = 31
	}
	runscriptonscreenelement \{id = goal_popup
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
	if screenelementexists id = <element_id>
		getscreenelementprops id = <element_id>
		<end_pos> = ((<pos>) + (0.0, -1.0) * <rise>)
		legacydoscreenelementmorph id = <element_id> pos = <end_pos> alpha = 0 scale = 1.3 time = <time>
		wait <time> seconds
		destroyscreenelement id = <element_id>
	endif
endscript

script rockout_popup_move_to_score \{element_id = rockout_score_popup_1
		time = 1}
	if screenelementexists id = <element_id>
		if ($g_current_ball_owner = 1)
			<end_pos> = (350.0, 50.0)
		else
			<end_pos> = (950.0, 50.0)
		endif
		legacydoscreenelementmorph id = <element_id> pos = <end_pos> alpha = 0 scale = 0.8 time = <time>
		wait <time> seconds
		destroyscreenelement id = <element_id>
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
		change g_player1_goals = ($g_player1_goals + 1)
	else
		change g_player2_goals = ($g_player2_goals + 1)
	endif
endscript

script rockout_update_lives \{player = 1
		adjustment = -1}
	if (<player> = 1)
		paddle_container_p1 :gettags
		<lives> = (<lives> + <adjustment>)
		formattext textname = score_text qs(0x978cefda) n = (<lives>)
		setscreenelementprops id = p1_lives text = <score_text>
		paddle_container_p1 :settags lives = <lives>
	else
		paddle_container_p2 :gettags
		<lives> = (<lives> + <adjustment>)
		formattext textname = score_text qs(0x978cefda) n = (<lives>)
		setscreenelementprops id = p2_lives text = <score_text>
		paddle_container_p2 :settags lives = <lives>
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
		setscreenelementprops \{id = ball_container
			linear_momentum = (0.0, 0.0)}
		setscreenelementprops \{id = ball_container
			linear_velocity = (0.0, 0.0)}
		songaudioplay \{pause = 1}
		pausegame
	endif
endscript

script rockout_pause_game 
	ball_container :se_getprops
	ball_container :settags momentum = <linear_momentum> velocity = <linear_velocity>
	ball_container :se_setprops \{linear_momentum = (0.0, 0.0)
		linear_velocity = (0.0, 0.0)}
	songaudioplay \{pause = 1}
endscript

script rockout_unpause_game 
	songaudioplay
	ball_container :gettags
	ball_container :se_setprops linear_momentum = <momentum>
	ball_container :se_setprops linear_velocity = <velocity>
endscript

script rockout_quit_game 
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script rockout_ai \{player = 2}
	formattext checksumname = ai_id 'g_p%s_ai_active' s = <player>
	change globalname = <ai_id> newvalue = 1
	begin
	<strum> = 0
	getscreenelementprops \{id = ball_container}
	if (($g_current_ball_owner = <player>) && (<linear_velocity> [0] = 0))
		<delay> = RandomFloat (2.0, 5.0)
		wait <delay> seconds
	endif
	getscreenelementprops \{id = ball_container}
	<ball_pos> = <pos>
	<ball_center> = (<ball_pos> + (32.0, 32.0))
	<i> = 0
	begin
	formattext checksumname = paddle_id 'paddle_p%s_%y' s = <player> y = <i>
	formattext checksumname = paddle_container_id 'paddle_container_p%s' s = <player>
	formattext checksumname = paddle_array_id 'g_battle_paddle_toggle_p%s' s = <player>
	getscreenelementprops id = <paddle_container_id>
	<paddle_container_pos> = <pos>
	getscreenelementposition id = <paddle_id>
	<paddle_top_left> = (<screenelementpos> + $g_paddle_collision_offset)
	<paddle_bottom_right> = (<paddle_top_left> + ((($g_paddle_width) - 1) * (1.0, 0.0)) + ((($g_paddle_height) - 1) * (0.0, 1.0)))
	<top_left> = (<paddle_top_left> - (48.0, 32.0) - (<linear_velocity> / ($framerate_value)))
	<bottom_right> = (<paddle_bottom_right> + (48.0, 32.0) - (<linear_velocity> / ($framerate_value)))
	if (((<top_left> [0] < <ball_center> [0]) && (<bottom_right> [0] > <ball_center> [0])) || (($g_current_ball_owner = <player>) && (<linear_velocity> [0] = 0)))
		if ((<top_left> [1] < <ball_center> [1]) && (<bottom_right> [1] > <ball_center> [1]))
			setarrayelement arrayname = <paddle_array_id> globalarray index = <i> newvalue = 1
			spawnscriptnow rockout_drum_hit params = {player = <player> button = <i>}
			<strum> = 1
		else
			setarrayelement arrayname = <paddle_array_id> globalarray index = <i> newvalue = 0
		endif
	else
		break
	endif
	<i> = (<i> + 1)
	repeat 5
	if (<strum>)
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
			pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			pos = (0.0, 0.0)
			side = 0
			time = 0
		}
		{
			pos = (0.0, 0.0)
			side = 0
			time = 0
		}
	]
	ball :settags collision_pos = <collision_pos>
	begin
	formattext checksumname = element_id 'debug_ball_path_node_%n' n = <i>
	if screenelementexists id = <element_id>
		destroyscreenelement id = <element_id>
	endif
	getscreenelementprops \{id = ball_container}
	<ball_center> = (<pos> + (31.0, 31.0))
	createscreenelement {
		type = spriteelement
		id = <element_id>
		parent = rockout_container
		texture = rockout_ball
		dims = (8.0, 8.0)
		pos = <ball_center>
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

script rockout_check_ball_collision \{bottom_right = (0.0, 0.0)
		top_left = (0.0, 0.0)
		preserve_momentum = 0}
	getscreenelementprops \{id = ball_container}
	<ball_top_left> = (<pos> + (16.0, 16.0))
	<ball_bottom_right> = (<ball_top_left> + (32.0, 32.0))
	<top_penetration> = 0
	<right_penetration> = 0
	<bottom_penetration> = 0
	<left_penetration> = 0
	<lowest_ratio> = 1000
	<collision> = 0
	if ((<top_left> [1] < <ball_bottom_right> [1]) && (<bottom_right> [1] > <ball_top_left> [1]))
		if ((<top_left> [0] < <ball_bottom_right> [0]) && (<bottom_right> [0] > <ball_top_left> [0]))
			<velocity_in_frames> = (<linear_velocity> / ($framerate_value))
			<top_penetration> = (<ball_bottom_right> [1] - <top_left> [1])
			<right_penetration> = (<bottom_right> [0] - <ball_top_left> [0])
			<bottom_penetration> = (<bottom_right> [1] - <ball_top_left> [1])
			<left_penetration> = (<ball_bottom_right> [0] - <top_left> [0])
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
	<new_pos> = (<pos>)
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
		<new_pos> = (<pos> - (<lowest_ratio> * <velocity_in_frames>))
	endif
	if (<collision>)
		if NOT (<preserve_momentum>)
			<new_momentum> = (<new_velocity> [1] * (0.0, 10.0) + <new_velocity> [0] * (10.0, 0.0))
			setscreenelementprops id = ball_container linear_velocity = <new_velocity>
			setscreenelementprops id = ball_container linear_momentum = <new_momentum>
			setscreenelementprops id = ball_container pos = <new_pos>
		endif
	endif
	return collision = <collision>
endscript

script rockout_activate_fireball 
	ball_container :gettags
	if NOT (<fireball_active>)
		ball_container :settags \{fireball_active = 1}
		destroy2dparticlesystem \{id = fireball_particles}
		create2dparticlesystem \{id = fireball_particles
			pos = (32.0, 32.0)
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
			emit_rate = 0.03
			emit_dir = 0.0
			emit_spread = 360.0
			velocity = 0.0
			friction = (0.0, 0.0)
			time = 0.5}
		spawnscript \{rockout_fireball_explosion}
	endif
endscript

script rockout_fireball_explosion 
	destroy2dparticlesystem \{id = fireball_explosion}
	create2dparticlesystem \{id = fireball_explosion
		pos = (32.0, 32.0)
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
		emit_rate = 0.01
		emit_dir = 0.0
		emit_spread = 360
		velocity = 4.0
		friction = (0.0, 0.1)
		time = 0.5}
	wait \{10
		gameframes}
	destroy2dparticlesystem \{id = fireball_explosion
		kill_when_empty}
endscript

script rockout_deactivate_fireball 
	ball_container :settags \{fireball_active = 0}
	destroy2dparticlesystem \{id = fireball_particles
		kill_when_empty}
endscript

script rockout_create_brick_particles \{color = [
			222
			222
			255
			255
		]}
	rockout_container :gettags
	<max_num_brick_particle_systems> = 5
	<end_color> = (<color>)
	setarrayelement \{arrayname = end_color
		index = 3
		newvalue = 100}
	formattext checksumname = explosion_id 'brick_explosion_%y' y = <current_particle>
	<current_particle> = (<current_particle> + 1)
	if (<current_particle> = <max_num_brick_particle_systems>)
		<current_particle> = 0
	endif
	rockout_container :settags current_particle = <current_particle>
	destroy2dparticlesystem id = <explosion_id>
	create2dparticlesystem {
		id = <explosion_id>
		pos = (<pos>)
		z_priority = 32
		material = material_brickexplode
		parent = rockout_container
		start_color = <color>
		end_color = <end_color>
		start_scale = (0.5, 0.5)
		end_scale = (0.2, 0.2)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 10
		emit_rate = 0.01
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 5.0
		friction = (0.0, 0.0)
		time = 0.2
	}
	wait \{5
		gameframes}
	destroy2dparticlesystem id = <explosion_id> kill_when_empty
endscript

script rockout_cleanup_brick_particles 
	<i> = 0
	begin
	formattext checksumname = explosion_id 'brick_explosion_%y' y = <i>
	destroy2dparticlesystem id = <explosion_id>
	<i> = (<i> + 1)
	repeat 20
endscript

script rockout_load_songdata \{song = rebelyell}
	load_songqpak song_name = <song>
	get_song_prefix song = <song>
	formattext checksumname = gem_array '%s_song_expert' s = <song_prefix>
	getarraysize $<gem_array>
	<i> = 0
	begin
	<i> = (<i> + 2)
	decompressnotevalue note_value = ($<gem_array> [<i> + 1])
	repeat (<array_size> / 2)
	unload_songqpak
endscript

script rockout_start_controls \{type = 0
		controller = 0
		player = 1}
	switch <type>
		case guitar
		spawnscript rockout_button_watcher params = {controller = <controller> player = <player>}
		<up_active> = 0
		<down_active> = 0
		begin
		if controllerpressed up <controller>
			if (<up_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<up_active> = 1
			endif
		elseif (<up_active> = 1)
			<up_active> = 0
		endif
		if controllerpressed down <controller>
			if (<down_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<down_active> = 1
			endif
		elseif (<down_active> = 1)
			<down_active> = 0
		endif
		wait \{1
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
		if controllerpressed x <controller>
			if (<x_active> = 0)
				spawnscript rockout_drum_hit params = {player = <player> button = 4}
				<x_active> = 1
			endif
		elseif (<x_active> = 1)
			<x_active> = 0
		endif
		if controllerpressed circle <controller>
			if (<circle_active> = 0)
				spawnscript rockout_drum_hit params = {player = <player> button = 0}
				<circle_active> = 1
			endif
		elseif (<circle_active> = 1)
			<circle_active> = 0
		endif
		if controllerpressed square <controller>
			if (<square_active> = 0)
				spawnscript rockout_drum_hit params = {player = <player> button = 2}
				<square_active> = 1
			endif
		elseif (<square_active> = 1)
			<square_active> = 0
		endif
		if controllerpressed triangle <controller>
			if (<triangle_active> = 0)
				spawnscript rockout_drum_hit params = {player = <player> button = 1}
				<triangle_active> = 1
			endif
		elseif (<triangle_active> = 1)
			<triangle_active> = 0
		endif
		if controllerpressed r1 <controller>
			if (<r1_active> = 0)
				spawnscript rockout_drum_hit params = {player = <player> button = 3}
				<r1_active> = 1
			endif
		elseif (<r1_active> = 1)
			<r1_active> = 0
		endif
		if controllerpressed l1 <controller>
			if (<l1_active> = 0)
				spawnscript rockout_drum_hit params = {player = <player> button = 3}
				<l1_active> = 1
			endif
		elseif (<l1_active> = 1)
			<l1_active> = 0
		endif
		wait \{1
			gameframe}
		repeat
		default
		<x_active> = 0
		<l1_active> = 0
		<l2_active> = 0
		<r1_active> = 0
		<r2_active> = 0
		spawnscript rockout_button_watcher params = {controller = <controller> player = <player>}
		begin
		if controllerpressed x <controller>
			if (<x_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<x_active> = 1
			endif
		elseif (<x_active> = 1)
			<x_active> = 0
		endif
		if controllerpressed r1 <controller>
			if (<r1_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<r1_active> = 1
			endif
		elseif (<r1_active> = 1)
			<r1_active> = 0
		endif
		if controllerpressed r2 <controller>
			if (<r2_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<r2_active> = 1
			endif
		elseif (<r2_active> = 1)
			<r2_active> = 0
		endif
		if controllerpressed l1 <controller>
			if (<l1_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<l1_active> = 1
			endif
		elseif (<l1_active> = 1)
			<l1_active> = 0
		endif
		if controllerpressed l2 <controller>
			if (<l2_active> = 0)
				spawnscript rockout_guitar_strum params = {player = <player>}
				<l2_active> = 1
			endif
		elseif (<l2_active> = 1)
			<l2_active> = 0
		endif
		wait \{1
			gameframe}
		repeat
	endswitch
endscript

script rockout_button_watcher \{controller = 0
		player = 1}
	begin
	formattext checksumname = paddle_toggle 'g_battle_paddle_toggle_p%p' p = <player>
	getheldpattern controller = (<controller>)
	check_button = 65536
	array_count = 0
	begin
	if (<hold_pattern> && <check_button>)
		if ($<paddle_toggle> [<array_count>] = 0)
			setarrayelement arrayname = <paddle_toggle> globalarray index = <array_count> newvalue = 1
			formattext checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <array_count>
			getscreenelementprops id = <paddle_id>
			rockout_paddle_highlight paddle = <array_count> no_pos_morph = 1 player = <player>
		endif
	else
		if ($<paddle_toggle> [<array_count>] = 1)
			formattext checksumname = paddle_id 'paddle_p%p_%y' p = <player> y = <array_count>
			getscreenelementprops id = <paddle_id>
			setarrayelement arrayname = <paddle_toggle> globalarray index = <array_count> newvalue = 0
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
	rockout_container :gettags
	formattext checksumname = brick_id 'brick_%n' n = <current_brick>
	<current_brick> = (<current_brick> + 1)
	if (<current_brick> > <max_bricks>)
		<current_brick> = 0
	endif
	rockout_container :settags current_brick = <current_brick>
	destroyscreenelement id = <brick_id>
	<start_pos> = (($g_initial_brick_pos) + ((<column> * ($g_brick_width + $g_brick_spacing)) * (1.0, 0.0)) - (0.0, 150.0))
	createscreenelement {
		type = spriteelement
		id = <brick_id>
		parent = rockout_container
		texture = rockout_brick
		rgba = (($g_brick_colors [<column>]).color)
		pos = <start_pos>
		just = [left top]
		z_priority = 29
		alpha = 1
	}
	runscriptonscreenelement id = <brick_id> rockout_check_single_brick_collision params = {column = <column> brick_id = <brick_id>}
	setscreenelementprops id = <brick_id> pos = (<start_pos> + (0.0, 640.0)) time = <time>
	wait <time> seconds
	destroyscreenelement id = <brick_id>
endscript

script rockout_kill_bricks 
	rockout_container :gettags
	<i> = 0
	begin
	formattext checksumname = brick_id 'brick_%n' n = <i>
	destroyscreenelement id = <brick_id>
	<i> = (<i> + 1)
	repeat <max_bricks>
	rockout_container :settags \{current_brick = 0}
endscript

script rockout_check_single_brick_collision 
	begin
	obj_getid
	getscreenelementprops id = <objid>
	<top_left> = (<pos> + $g_brick_collision_offset)
	<bottom_right> = (<top_left> + ((($g_brick_width) - 1) * (1.0, 0.0)) + ((($g_brick_height) - 1) * (0.0, 1.0)))
	ball_container :gettags
	if (<fireball_active>)
		rockout_check_ball_collision top_left = <top_left> bottom_right = <bottom_right> preserve_momentum = 1
	else
		rockout_check_ball_collision top_left = <top_left> bottom_right = <bottom_right>
	endif
	if (<collision>)
		change g_bricks_hit = (($g_bricks_hit) + 1)
		rockout_calculate_score \{type = 'brick'}
		if ($g_current_ball_owner = 1)
			rockout_add_to_score player = 1 amount = (<score>)
		else
			rockout_add_to_score player = 2 amount = (<score>)
		endif
		spawnscript rockout_show_score_popup params = {brick_pos = <pos> brick_color = <rgba> score = <score>}
		<bass> = 2
		destroyscreenelement id = <objid>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

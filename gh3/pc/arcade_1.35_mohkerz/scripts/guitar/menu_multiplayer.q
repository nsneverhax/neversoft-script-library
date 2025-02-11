mutiplayer_wait_more_coins_needed = 0
multiplayer_last_num_credits = 0
mp_tease_strings_1 = [
	"You have friends,"
	"You don't want to play"
	"Single player games are"
	"Ask someone random to"
	"We like you, but we're"
	"Hey, I bet that guy"
	"Single players have a higher"
	"Four hands are"
	"Your teachers were wrong,"
	"Your mom says you're a catch,"
	"If you want to start that"
]
mp_tease_strings_2 = [
	"I know you do"
	"with yourself, do you?"
	"lonely, lonely experiences"
	"join in, I dare you"
	"greedy. Put more money in"
	"over there is a natural"
	"chance of spontaneous combustion"
	"better than two"
	"you do play well with others"
	"clearly you're popular"
	"band, you need friends"
]
which_player_gfx_locs = {
	left_side_pos = (360.0, 500.0)
	right_side_pos = (890.0, 570.0)
}
mp_shake = 0
mp_left_text_color = [
	130
	116
	197
	255
]
mp_left_text_shadow_color = [
	55
	55
	55
	255
]
mp_right_text_color = [
	215
	97
	69
	255
]
mp_right_text_shadow_color = $mp_left_text_shadow_color
mp_tease_text_speed = 0.6
mp_tease_scale = 0.65000004
mp_tease_text_white_pause = 0.5
mp_status_text_y_root = (0.0, 350.0)
mp_status_text_y_offset = (0.0, 60.0)

script create_multiplayer_wait_menu 
	SpawnScriptNow \{menu_music_on}
	create_menu_backdrop \{texture = Controller_2p_BG}
	menu_font = text_a5
	Change \{coop_dlc_active = 0}
	exclusive_dev = $player1_device
	if ($active_player = 2)
		<exclusive_dev> = $player2_device
	endif
	printf "create_multiplayer_wait_menu: start with exclusive_dev = %d [swaptest]" d = <exclusive_dev>
	multiplayer_event_handlers = [
		{pad_back advance_timer}
	]
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = multiplayer_wait_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	figure_out_status_text
	GetGlobalTags \{arcade_audits}
	Change multiplayer_last_num_credits = <arcade_num_credits_in>
	displayText \{parent = multiplayer_wait_container
		text = "WAITING FOR"
		Pos = (690.0, 75.0)
		just = [
			center
			center
		]
		Scale = 0.85
		rgba = [
			255
			255
			255
			255
		]
		font = text_a10_Large
		noshadow
		rot = 1}
	displayText \{parent = multiplayer_wait_container
		text = "WAITING FOR"
		Pos = (694.0, 79.0)
		just = [
			center
			center
		]
		Scale = 0.85
		rgba = [
			0
			0
			0
			255
		]
		font = text_a10_Large
		noshadow
		rot = 0}
	displayText \{parent = multiplayer_wait_container
		text = "SECOND PLAYER"
		Pos = (690.0, 160.0)
		just = [
			center
			center
		]
		Scale = 0.85
		rgba = [
			255
			255
			255
			255
		]
		font = text_a10_Large
		noshadow
		rot = 1}
	displayText \{parent = multiplayer_wait_container
		text = "SECOND PLAYER"
		Pos = (694.0, 164.0)
		just = [
			center
			center
		]
		Scale = 0.85
		rgba = [
			0
			0
			0
			255
		]
		font = text_a10_Large
		noshadow
		rot = 0}
	displayText \{parent = multiplayer_wait_container
		text = "PLAYER 1"
		Pos = (300.0, 360.0)
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a5
		rot = -8}
	displayText \{parent = multiplayer_wait_container
		text = "PLAYER 2"
		Pos = (970.0, 445.0)
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a5
		rot = 6}
	GetArraySize ($mp_tease_strings_1)
	GetRandomValue Name = rand_num a = 0 b = (<array_Size> - 1) integer
	rand_num1 = <rand_num>
	displayText parent = multiplayer_wait_container id = mp_left_tease1 text = ($mp_tease_strings_1 [<rand_num>]) Pos = (235.0, 155.0) just = [center center] Scale = $mp_tease_scale rgba = $mp_left_text_color font = text_a6 noshadow rot = -10
	displayText parent = multiplayer_wait_container id = mp_left_tease1_2 text = ($mp_tease_strings_1 [<rand_num>]) Pos = (235.0, 158.0) just = [center center] Scale = $mp_tease_scale rgba = $mp_left_text_shadow_color font = text_a6 noshadow rot = -10
	displayText parent = multiplayer_wait_container id = mp_left_tease2 text = ($mp_tease_strings_2 [<rand_num>]) Pos = (235.0, 190.0) just = [center center] Scale = $mp_tease_scale rgba = $mp_left_text_color font = text_a6 noshadow rot = -10
	displayText parent = multiplayer_wait_container id = mp_left_tease2_2 text = ($mp_tease_strings_2 [<rand_num>]) Pos = (235.0, 193.0) just = [center center] Scale = $mp_tease_scale rgba = $mp_left_text_shadow_color font = text_a6 noshadow rot = -10
	displayText \{parent = multiplayer_wait_container
		id = mp_right_tease1
		text = "Press red fret"
		Pos = (1095.0, 155.0)
		just = [
			center
			center
		]
		Scale = $mp_tease_scale
		rgba = [
			255
			255
			255
			255
		]
		font = text_a6
		noshadow
		rot = 10}
	displayText \{parent = multiplayer_wait_container
		id = mp_right_tease1_2
		text = "Press red fret"
		Pos = (1095.0, 158.0)
		just = [
			center
			center
		]
		Scale = $mp_tease_scale
		rgba = $mp_right_text_shadow_color
		font = text_a6
		noshadow
		rot = 10}
	displayText \{parent = multiplayer_wait_container
		id = mp_right_tease2
		text = "to skip waiting"
		Pos = (1095.0, 190.0)
		just = [
			center
			center
		]
		Scale = $mp_tease_scale
		rgba = [
			255
			255
			255
			255
		]
		font = text_a6
		noshadow
		rot = 10}
	displayText \{parent = multiplayer_wait_container
		id = mp_right_tease2_2
		text = "to skip waiting"
		Pos = (1095.0, 193.0)
		just = [
			center
			center
		]
		Scale = $mp_tease_scale
		rgba = $mp_right_text_shadow_color
		font = text_a6
		noshadow
		rot = 10}
	CreateScreenElement {
		Type = TextElement
		parent = multiplayer_wait_container
		id = multiplayer_waiting_text_1
		just = [center center]
		font = text_a10
		text = <multiplayer_status_text_1>
		event_handlers = <multiplayer_event_handlers>
		Scale = 1.25
		rgba = [255 255 255 255]
		Pos = (635.0, 390.0)
		exclusive_device = <exclusive_dev>
		Shadow
		shadow_offs = (3.0, 3.0)
		z_priority = 2
	}
	CreateScreenElement {
		Type = TextElement
		parent = multiplayer_wait_container
		id = multiplayer_waiting_text_2
		just = [center center]
		font = text_a10
		text = <multiplayer_status_text_2>
		Scale = 1.25
		rgba = [255 255 255 255]
		Pos = (635.0, 450.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		z_priority = 2
	}
	CreateScreenElement {
		Type = TextElement
		parent = multiplayer_wait_container
		id = multiplayer_waiting_text_3
		just = [center center]
		font = text_a10_Large
		text = <multiplayer_status_text_3>
		Scale = 1.0
		rgba = [255 0 0 255]
		Pos = (710.0, 385.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		z_priority = 10
	}
	LaunchEvent \{Type = focus
		target = multiplayer_waiting_text_1}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_tex 'Encore_Arm_%d' d = <rand_arm>
	CreateScreenElement {
		Type = SpriteElement
		parent = multiplayer_wait_container
		id = which_player_graphic
		rgba = [255 255 255 255]
		texture = <arm_tex>
		dims = (83.0, 204.0)
		z_priority = 2
	}
	if ($active_player = 1)
		printf \{"Active player = 1"}
		SetScreenElementProps id = which_player_graphic Pos = (($which_player_gfx_locs).left_side_pos)
	else
		printf \{"Active player = 2"}
		SetScreenElementProps id = which_player_graphic Pos = (($which_player_gfx_locs).right_side_pos)
	endif
	create_randomly_colored_peasants
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SKIP"
		button = red
		z = 100}
	SpawnScriptNow \{multiplayer_watch_timer}
	SpawnScriptNow \{mp_raise_fists}
	SpawnScriptNow \{mp_hover}
	SpawnScriptNow \{mp_text_color_shift_left_1}
	SpawnScriptNow \{mp_text_color_shift_left_2}
	SpawnScriptNow \{mp_text_color_shift_right_1}
	SpawnScriptNow \{mp_text_color_shift_right_2}
	SpawnScriptNow \{jump_up_and_down_peasants}
	Change \{in_multiplayer_wait_screen = 1}
	Change \{mp_shake = 0}
endscript

script destroy_multiplayer_wait_menu 
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = multiplayer_wait_container}
	destroy_menu_backdrop
	KillSpawnedScript \{Name = mp_shake_ready}
	KillSpawnedScript \{Name = mp_hover}
	KillSpawnedScript \{Name = mp_text_color_shift_left_1}
	KillSpawnedScript \{Name = mp_text_color_shift_left_2}
	KillSpawnedScript \{Name = mp_text_color_shift_right_1}
	KillSpawnedScript \{Name = mp_text_color_shift_right_2}
	KillSpawnedScript \{Name = mp_raise_fists}
	KillSpawnedScript \{Name = jump_up_and_down_peasants}
	KillSpawnedScript \{Name = multiplayer_watch_timer}
	Change \{in_multiplayer_wait_screen = 0}
endscript

script advance_timer 
	increment_countdown_timer \{inc_val = 3}
	SoundEvent \{event = Single_Player_Bad_Note_Guitar}
endscript

script figure_out_status_text 
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if (<arcade_num_credits_in> >= <arcade_credits_for_standard>)
		Change \{mutiplayer_wait_more_coins_needed = 0}
		if ($active_player = 1)
			formatText \{TextName = multiplayer_status_text_1
				"PRESS RIGHT START"}
			formatText \{TextName = multiplayer_status_text_2
				"BUTTON TO ROCK ! ! !"}
			formatText \{TextName = multiplayer_status_text_3
				""}
		else
			formatText \{TextName = multiplayer_status_text_1
				"PRESS LEFT START"}
			formatText \{TextName = multiplayer_status_text_2
				"BUTTON TO ROCK ! ! !"}
			formatText \{TextName = multiplayer_status_text_3
				""}
		endif
		if ($mp_shake = 0)
			SpawnScriptNow \{mp_shake_ready}
			Change \{mp_shake = 1}
		endif
	else
		Change \{mutiplayer_wait_more_coins_needed = 1}
		if ((<arcade_credits_for_standard> - <arcade_num_credits_in>) = 1)
			formatText \{TextName = multiplayer_status_text_1
				"INSERT   "}
			formatText \{TextName = multiplayer_status_text_2
				"CREDIT NOW!"}
			formatText TextName = multiplayer_status_text_3 "%d" d = (<arcade_credits_for_standard> - <arcade_num_credits_in>)
		else
			formatText \{TextName = multiplayer_status_text_1
				"INSERT   "}
			formatText \{TextName = multiplayer_status_text_2
				"CREDITS NOW!"}
			formatText TextName = multiplayer_status_text_3 "%d" d = (<arcade_credits_for_standard> - <arcade_num_credits_in>)
		endif
	endif
	return multiplayer_status_text_1 = <multiplayer_status_text_1> multiplayer_status_text_2 = <multiplayer_status_text_2> multiplayer_status_text_3 = <multiplayer_status_text_3>
endscript

script create_random_color \{random_alpha = 0}
	rgba_temp = [255 255 255 255]
	GetRandomValue \{Name = rand_num
		a = 0
		b = 128
		integer}
	SetArrayElement ArrayName = rgba_temp index = 0 NewValue = <rand_num>
	GetRandomValue \{Name = rand_num
		a = 0
		b = 128
		integer}
	SetArrayElement ArrayName = rgba_temp index = 1 NewValue = <rand_num>
	GetRandomValue \{Name = rand_num
		a = 0
		b = 128
		integer}
	SetArrayElement ArrayName = rgba_temp index = 2 NewValue = <rand_num>
	if (<random_alpha> = 1)
		SetArrayElement ArrayName = rgba_temp index = 3 NewValue = <rand_num>
	endif
	return rgba_temp = <rgba_temp>
endscript

script create_randomly_colored_peasants 
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_01 tex = controller_2p_LittleMan_01 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (60.0, 570.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_02 tex = controller_2p_LittleMan_02 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (160.0, 570.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_03 tex = controller_2p_LittleMan_04 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (240.0, 620.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_04 tex = controller_2p_LittleMan_03 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (320.0, 570.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_05 tex = controller_2p_LittleMan_01 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (760.0, 570.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_06 tex = controller_2p_LittleMan_02 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (860.0, 570.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_07 tex = controller_2p_LittleMan_03 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (940.0, 570.0) z = 10
	create_random_color
	displaySprite parent = multiplayer_wait_container id = peasant_08 tex = controller_2p_LittleMan_04 rgba = <rgba_temp> dims = (192.0, 192.0) Pos = (1020.0, 570.0) z = 10
endscript

script multiplayer_watch_timer 
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"multiplayer_watch_timer: timer has expired"}
		break
	endif
	GetGlobalTags \{arcade_audits}
	figure_out_status_text
	if ($multiplayer_last_num_credits != <arcade_num_credits_in>)
		Change multiplayer_last_num_credits = <arcade_num_credits_in>
		SpawnScriptNow \{set_countdown_timer}
	endif
	multiplayer_waiting_text_1 :SetProps text = <multiplayer_status_text_1>
	multiplayer_waiting_text_2 :SetProps text = <multiplayer_status_text_2>
	multiplayer_waiting_text_3 :SetProps text = <multiplayer_status_text_3>
	Wait \{1
		Second}
	repeat
	printf \{"multiplayer_watch_timer: starting single player game"}
	if ($coinup_enabled = 1)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = start_singleplayer_game_coinup
			}}
	else
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = start_singleplayer_game
			}}
	endif
endscript

script mp_raise_fists 
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	GetScreenElementProps \{id = which_player_graphic}
	if ScreenElementExists \{id = which_player_graphic}
		which_player_graphic :GetTags
		which_player_graphic :SetTags Pos = <Pos> chance = <rand_arm>
		up_pos = (<Pos> - (0.0, 50.0))
		DoScreenElementMorph id = which_player_graphic Pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	Wait \{0.3
		Seconds}
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	if ScreenElementExists \{id = which_player_graphic}
		which_player_graphic :GetTags
		DoScreenElementMorph id = which_player_graphic Pos = (<Pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	Wait \{0.3
		Seconds}
	repeat
endscript

script mp_hover 
	if NOT ScreenElementExists \{id = multiplayer_waiting_text_3}
		return
	endif
	begin
	multiplayer_waiting_text_3 :DoMorph \{rgba = [
			255
			255
			255
			255
		]
		Pos = (705.0, 375.0)
		time = 0.5
		rot_angle = 9
		Scale = 1.025
		motion = ease_out}
	multiplayer_waiting_text_3 :DoMorph \{rgba = [
			255
			0
			0
			255
		]
		Pos = (710.0, 380.0)
		time = 0.5
		rot_angle = 6
		Scale = 0.97499996
		motion = ease_in}
	multiplayer_waiting_text_3 :DoMorph \{rgba = [
			255
			255
			255
			255
		]
		Pos = (705.0, 375.0)
		time = 0.5
		rot_angle = 3
		Scale = 1.025
		motion = ease_out}
	multiplayer_waiting_text_3 :DoMorph \{rgba = [
			255
			0
			0
			255
		]
		Pos = (710.0, 380.0)
		time = 0.5
		rot_angle = 6
		Scale = 0.97499996
		motion = ease_in}
	repeat
endscript

script mp_text_color_shift_left_1 
	if NOT ScreenElementExists \{id = mp_left_tease1}
		return
	endif
	begin
	mp_left_tease1 :DoMorph \{rgba = [
			255
			255
			255
			255
		]
		time = $mp_tease_text_speed
		motion = ease_in}
	Wait \{$mp_tease_text_white_pause
		Seconds}
	mp_left_tease1 :DoMorph \{rgba = $mp_left_text_color
		time = $mp_tease_text_speed
		motion = ease_out}
	repeat
endscript

script mp_text_color_shift_left_2 
	if NOT ScreenElementExists \{id = mp_left_tease2}
		return
	endif
	begin
	mp_left_tease2 :DoMorph \{rgba = [
			255
			255
			255
			255
		]
		time = $mp_tease_text_speed
		motion = ease_in}
	Wait \{$mp_tease_text_white_pause
		Seconds}
	mp_left_tease2 :DoMorph \{rgba = $mp_left_text_color
		time = $mp_tease_text_speed
		motion = ease_out}
	repeat
endscript

script mp_text_color_shift_right_1 
	if NOT ScreenElementExists \{id = mp_right_tease1}
		return
	endif
	begin
	mp_right_tease1 :DoMorph \{rgba = $mp_right_text_color
		time = $mp_tease_text_speed
		motion = ease_out}
	mp_right_tease1 :DoMorph \{rgba = [
			255
			255
			255
			255
		]
		time = $mp_tease_text_speed
		motion = ease_in}
	Wait \{$mp_tease_text_white_pause
		Seconds}
	repeat
endscript

script mp_text_color_shift_right_2 
	if NOT ScreenElementExists \{id = mp_right_tease2}
		return
	endif
	begin
	mp_right_tease2 :DoMorph \{rgba = $mp_right_text_color
		time = $mp_tease_text_speed
		motion = ease_out}
	mp_right_tease2 :DoMorph \{rgba = [
			255
			255
			255
			255
		]
		time = $mp_tease_text_speed
		motion = ease_in}
	Wait \{$mp_tease_text_white_pause
		Seconds}
	repeat
endscript

script mp_shake_ready 
	rotation = 20
	begin
	<rotation> = (<rotation> * -0.7)
	if ScreenElementExists \{id = multiplayer_waiting_text_1}
		multiplayer_waiting_text_1 :DoMorph rot_angle = <rotation> time = 0.04 motion = ease_out
	endif
	if ScreenElementExists \{id = multiplayer_waiting_text_2}
		multiplayer_waiting_text_2 :DoMorph rot_angle = <rotation> time = 0.04 motion = ease_out
	endif
	repeat 12
	if ScreenElementExists \{id = multiplayer_waiting_text_1}
		multiplayer_waiting_text_1 :DoMorph \{rot_angle = 0
			motion = ease_out}
	endif
	if ScreenElementExists \{id = multiplayer_waiting_text_2}
		multiplayer_waiting_text_2 :DoMorph \{rot_angle = 0
			motion = ease_out}
	endif
endscript

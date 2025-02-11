continue_last_num_credits = 0

script create_continue_menu 
	UnPauseGame
	GetGlobalTags \{arcade_hardware_adjustments}
	if (<arcade_winner_stays> = 1)
		if ($coop_dlc_active != 1 && ($game_mode = p2_pro_faceoff || $game_mode = p2_faceoff))
			printf "create_continue_menu: p1 score = %a p2 score = %b" a = ($player1_status.score) b = ($player2_status.score)
			if (($player1_status.score) > ($player2_status.score))
				if ($active_continue_player = 0)
					Change \{multiplayer_continue_flag = 1}
				endif
				Change \{active_player = 1}
				Change \{active_continue_player = 1}
				Change \{left_player_continue = 1}
				Change \{primary_controller = $player1_device}
				Change \{primary_controller_assigned = 1}
				GetGlobalTags \{arcade_audits}
				Increment \{arcade_left_freegames}
				Increment \{arcade_total_plays}
				SetGlobalTags arcade_audits params = {arcade_left_freegames = <arcade_left_freegames> arcade_total_plays = <arcade_total_plays>}
				printf \{"create_continue_menu: PLAYER1 - ready to rokk (pc = %d, p1d = %e)"
					d = $primary_controller
					e = $player1_device}
				Change \{current_num_players = 1}
				wait_for_safe_shutdown
				SpawnScriptNow \{ui_flow_manager_respond_to_action
					params = {
						action = continue
					}}
				return
			elseif (($player2_status.score) > ($player1_status.score))
				if ($active_continue_player = 0)
					Change \{multiplayer_continue_flag = 1}
				endif
				Change \{active_player = 2}
				Change \{active_continue_player = 2}
				Change \{right_player_continue = 1}
				Change \{primary_controller = $player2_device}
				Change \{primary_controller_assigned = 1}
				GetGlobalTags \{arcade_audits}
				Increment \{arcade_right_freegames}
				Increment \{arcade_total_plays}
				SetGlobalTags arcade_audits params = {arcade_right_freegames = <arcade_right_freegames> arcade_total_plays = <arcade_total_plays>}
				printf \{"create_continue_menu: PLAYER2 - ready to rokk (pc = %d, p2d = %e)"
					d = $primary_controller
					e = $player2_device}
				Change \{current_num_players = 1}
				wait_for_safe_shutdown
				SpawnScriptNow \{ui_flow_manager_respond_to_action
					params = {
						action = continue
					}}
				return
			endif
		endif
	endif
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = continue_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	continue_event_handlers = [
		{pad_back advance_timer}
	]
	CreateScreenElement {
		Type = SpriteElement
		parent = continue_container
		id = continue_poster
		texture = Autosave_Poster
		Pos = (0.0, 30.0)
		just = [left top]
		dims = (1240.0, 620.0)
		rot_angle = -2
		z_priority = 1004
		event_handlers = <continue_event_handlers>
	}
	LaunchEvent \{Type = focus
		target = continue_poster}
	CreateScreenElement \{Type = SpriteElement
		parent = continue_container
		id = autosave_light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1099}
	displaySprite \{parent = continue_container
		tex = tape_H_03
		Pos = (210.0, 49.0)
		dims = (180.0, 80.0)
		rot_angle = -2
		z = 1005}
	displaySprite \{parent = continue_container
		tex = tape_H_03
		rgba = [
			0
			0
			0
			128
		]
		Pos = (208.0, 52.0)
		dims = (180.0, 80.0)
		rot_angle = -2
		z = 1005}
	displaySprite \{parent = continue_container
		tex = tape_H_04
		Pos = (760.0, 19.0)
		dims = (180.0, 80.0)
		rot_angle = -2
		z = 1005}
	displaySprite \{parent = continue_container
		tex = tape_H_04
		rgba = [
			0
			0
			0
			128
		]
		Pos = (762.0, 22.0)
		dims = (180.0, 80.0)
		rot_angle = -2
		z = 1005}
	CreateScreenElement \{Type = SpriteElement
		parent = continue_container
		id = left_fist_bg
		texture = Song_Summary_Percent_Fill_BACKYARD
		just = [
			center
			center
		]
		Pos = (210.0, 540.0)
		z_priority = 1009
		Hide}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_tex 'Encore_Arm_%d' d = <rand_arm>
	CreateScreenElement {
		Type = SpriteElement
		parent = continue_container
		id = left_fist
		rgba = [255 255 255 255]
		texture = <arm_tex>
		just = [center center]
		Pos = (180.0, 540.0)
		dims = (83.0, 204.0)
		z_priority = 1010
		Hide
	}
	CreateScreenElement \{Type = SpriteElement
		parent = continue_container
		id = right_fist_bg
		texture = Song_Summary_Percent_Fill_BACKYARD
		just = [
			center
			center
		]
		Pos = (1120.0, 510.0)
		z_priority = 1009
		Hide}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_tex 'Encore_Arm_%d' d = <rand_arm>
	CreateScreenElement {
		Type = SpriteElement
		parent = continue_container
		id = right_fist
		rgba = [255 255 255 255]
		texture = <arm_tex>
		just = [center center]
		Pos = (1090.0, 510.0)
		dims = (83.0, 204.0)
		z_priority = 1010
		Hide
	}
	if ($active_continue_player = 1 || $active_continue_player = 0)
		left_fist :SetProps \{unhide}
		left_fist_bg :SetProps \{unhide}
	endif
	if ($active_continue_player = 2 || $active_continue_player = 0)
		right_fist :SetProps \{unhide}
		right_fist_bg :SetProps \{unhide}
	endif
	split_text_into_array_elements \{text = "CONTINUE?"
		text_pos = (640.0, 515.0)
		space_between = (40.0, -2.0)
		centered
		flags = {
			rgba = [
				255
				255
				255
				255
			]
			Scale = 2.0
			z_priority = 6000
			font = text_a10
			just = [
				center
				center
			]
			alpha = 1
			rot_angle = -2
		}}
	Change g_loading_screen_split_container_id = <container_id>
	SpawnScriptNow \{jiggle_text_array_elements
		params = {
			id = $g_loading_screen_split_container_id
			time = 1.0
			wait_time = 0
			explode = 0
		}}
	GetGlobalTags \{arcade_audits}
	Change continue_last_num_credits = <arcade_num_credits_in>
	countdown_timer :SetProps \{Pos = (900.0, 494.0)
		rot_angle = -2
		Scale = 1.0
		font = text_a10_Large}
	countdown_timer_shadow :SetProps \{Pos = (905.0, 499.0)
		rot_angle = -2
		Scale = 1.0
		font = text_a10_Large
		unhide}
	SpawnScriptNow \{continue_watch_timer}
	SpawnScriptNow \{update_countdown_timer}
	SpawnScriptNow \{continue_raise_left_fist}
	SpawnScriptNow \{continue_raise_right_fist}
	enable_coin_display
	Change \{multiplayer_continue_flag = 0}
	Change \{left_player_continue = 0}
	Change \{right_player_continue = 0}
	Change \{in_continue_screen = 1}
endscript

script destroy_continue_menu 
	Change \{in_continue_screen = 0}
	disable_coin_display
	KillSpawnedScript \{Name = continue_raise_right_fist}
	KillSpawnedScript \{Name = continue_raise_left_fist}
	KillSpawnedScript \{Name = update_countdown_timer}
	KillSpawnedScript \{Name = continue_watch_timer}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	if ScreenElementExists \{id = $g_loading_screen_split_container_id}
		DestroyScreenElement \{id = $g_loading_screen_split_container_id}
	endif
	arcadeplay_cleanup_timer
	countdown_timer :SetProps \{Pos = $countdown_timer_position
		rot_angle = 0
		Scale = 1.5
		font = text_a6}
	countdown_timer_shadow :SetProps Pos = ($countdown_timer_position + (5.0, 5.0)) rot_angle = 0 Scale = 1.5 font = text_a6 Hide
	destroy_menu \{menu_id = continue_container}
	destroy_menu_backdrop
endscript

script continue_watch_timer 
	SpawnScriptNow \{set_countdown_timer}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"continue_watch_timer: timer has expired"}
		break
	endif
	GetGlobalTags \{arcade_audits}
	if ($continue_last_num_credits != <arcade_num_credits_in>)
		Change continue_last_num_credits = <arcade_num_credits_in>
		SpawnScriptNow \{set_countdown_timer}
	endif
	Wait \{1
		Second}
	repeat
	printf \{"continue_watch_timer: not continuing"}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = quit
		}}
endscript

script continue_raise_left_fist 
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	GetScreenElementProps \{id = left_fist}
	if ScreenElementExists \{id = left_fist}
		left_fist :GetTags
		left_fist :SetTags Pos = <Pos> chance = <rand_arm>
		up_pos = (<Pos> - (0.0, 50.0))
		DoScreenElementMorph id = left_fist Pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	Wait \{0.3
		Seconds}
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	if ScreenElementExists \{id = left_fist}
		left_fist :GetTags
		DoScreenElementMorph id = left_fist Pos = (<Pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	Wait \{0.3
		Seconds}
	repeat
endscript

script continue_raise_right_fist 
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	GetScreenElementProps \{id = right_fist}
	if ScreenElementExists \{id = right_fist}
		right_fist :GetTags
		right_fist :SetTags Pos = <Pos> chance = <rand_arm>
		up_pos = (<Pos> - (0.0, 50.0))
		DoScreenElementMorph id = right_fist Pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	Wait \{0.3
		Seconds}
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	if ScreenElementExists \{id = right_fist}
		right_fist :GetTags
		DoScreenElementMorph id = right_fist Pos = (<Pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	Wait \{0.3
		Seconds}
	repeat
endscript

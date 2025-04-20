balance_meter_info = {
	bar_positions = [
		(320.0, 480.0)
		(320.0, 170.0)
	]
	bar_positions_mp_h = [
		(320.0, 240.0)
		(320.0, 85.0)
	]
	bar_positions_mp_v = [
		(160.0, 320.0)
		(160.0, 230.0)
	]
	arrow_positions = [
		(0.0, 0.0)
		(10.0, 0.0)
		(20.0, 0.0)
		(35.0, 0.0)
		(50.0, 0.0)
		(65.0, 0.0)
		(80.0, 0.0)
	]
	arrow_positions_mp_h = [
		(0.0, 0.0)
		(5.0, 0.0)
		(10.0, 0.0)
		(13.0, 0.0)
		(25.0, 0.0)
		(33.0, 0.0)
		(40.0, 0.0)
	]
	arrow_positions_mp_v = [
		(0.0, 0.0)
		(10.0, 0.0)
		(20.0, 0.0)
		(35.0, 0.0)
		(50.0, 0.0)
		(65.0, 0.0)
		(80.0, 0.0)
	]
}
balance_meter_test = 1
trick_text_shadow_offset = (1.5, 1.5)
trick_text_shadow_color = [
	10
	5
	0
	150
]
trick_text_reset_position = (320.0, 409.0)
trick_text_color_1 = [
	210
	180
	70
	255
]
trick_text_color_2 = [
	40
	200
	200
	255
]
score_color_1 = [
	220
	220
	220
	255
]
balance_meter_color_safe = [
	20
	160
	80
	255
]
balance_meter_color_danger = [
	220
	100
	80
	255
]
marker_hide_distance = 3000
marker_switch_distance = 800

script hide_panel_stuff 
	printf "*************** HIDING PANEL STUFF *********************"
	if objectexists id = player1_panel_container
		printf "*************** HIDING PANEL STUFF 2 *********************"
		doscreenelementmorph {
			id = player1_panel_container
			alpha = 0
		}
		player1_panel_container :setprops hide
	endif
	if objectexists id = player2_panel_container
		printf "*************** HIDING PANEL STUFF 2 *********************"
		doscreenelementmorph {
			id = player2_panel_container
			alpha = 0
		}
		player2_panel_container :setprops hide
	endif
	net_rounds_hide_panel_stuff
endscript

script show_panel_stuff 
	if insplitscreengame
		GetGameMode
		if checksumequals a = <gamemode> b = horse
			if IsCurrentHorseSkater 0
				hide_player_2 = 1
			else
				hide_player_1 = 1
			endif
		endif
	endif
	printf "*************** SHOWING PANEL STUFF *********************"
	if objectexists id = player1_panel_container
		printf "*************** SHOWING PANEL STUFF 2 *********************"
		if NOT gotparam hide_player_1
			doscreenelementmorph {
				id = player1_panel_container
				alpha = 1
			}
			player1_panel_container :setprops unhide
		endif
	endif
	if objectexists id = player2_panel_container
		printf "*************** SHOWING PANEL STUFF 2 *********************"
		if NOT gotparam hide_player_2
			doscreenelementmorph {
				id = player2_panel_container
				alpha = 1
			}
			player2_panel_container :setprops unhide
		endif
	endif
	net_rounds_show_panel_stuff
endscript

script destroy_panel_stuff 
	if screenelementexists id = player1_panel_container
		destroyscreenelement id = player1_panel_container
	endif
	if screenelementexists id = player2_panel_container
		destroyscreenelement id = player2_panel_container
	endif
	if screenelementexists id = the_time
		destroyscreenelement id = the_time
	endif
	if screenelementexists id = goal_viewport_parent
		destroyscreenelement id = goal_viewport_parent
	endif
	goal_hud_destroy
	if screenelementexists id = current_goal_key_combo_text
		destroyscreenelement id = current_goal_key_combo_text
	endif
	if screenelementexists id = net_score_menu
		destroyscreenelement id = net_score_menu
	endif
endscript

script create_panel_stuff 
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case horse1
			case horse2
			case split_vertical
			case one_camera
			timer_pos = (285.0, 20.0)
			timer_scale = 1.0
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				printf "SETTING UP HUD: ONE CAMERA, HORSE"
				trick_text_dims = (350.0, 50.0)
				trick_text_pos = (287.0, 2.0)
				the_time_pos = (0.0, 0.0)
				player1_panel_dims = (640.0, 448.0)
				player1_panel_pos = (0.0, 0.0)
				player2_panel_dims = (640.0, 448.0)
				player2_panel_pos = (0.0, 0.0)
				player1_score_multiplier_container_pos = (318.0, 14.0)
				player1_splitscreen_total_score_just = [left top]
				player1_splitscreen_total_score_pos = (100.0, 40.0)
				player1_the_score_pos = (585.0, 428.0)
				player1_the_score_pot_text = (52.0, 0.0)
				player1_the_trick_text_dims = (350.0, 50.0)
				player1_trick_text_container_pos = (0.0, 0.0)
				player1_the_trick_text_pos = (0.0, 50.0)
				player1_the_trick_text_dims = (350.0, 50.0)
				player2_the_score_pos = <player1_the_score_pos>
				player2_splitscreen_total_score_just = <player1_splitscreen_total_score_just>
				player2_score_multiplier_container_pos = <player1_score_multiplier_container_pos>
				player2_splitscreen_total_score_pos = <player1_splitscreen_total_score_pos>
				player2_the_score_pot_text = <player1_the_score_pot_text>
				player2_the_trick_text_dims = <player1_the_trick_text_dims>
				player2_trick_text_container_pos = <player1_trick_text_container_pos>
				player2_the_trick_text_pos = <player1_the_trick_text_pos>
				player2_the_trick_text_dims = <player1_the_trick_text_dims>
			else
				printf "SETTING UP HUD: VERTICAL "
				trick_text_dims = (100.0, 100.0)
				trick_text_pos = (220.0, 2.0)
				the_time_pos = (0.0, 0.0)
				player1_panel_dims = (320.0, 480.0)
				player1_panel_pos = (0.0, 0.0)
				player2_panel_dims = (320.0, 480.0)
				player2_panel_pos = (580.0, 0.0)
				player1_the_trick_text_dims = (200.0, 100.0)
				player1_splitscreen_total_score_just = [left top]
				player1_trick_text_container_pos = (0.0, 0.0)
				player1_splitscreen_total_score_pos = (120.0, 40.0)
				player1_the_score_pot_text = (0.0, 0.0)
				player1_the_score_pos = (52.0, 418.0)
				player1_score_multiplier_container_pos = (318.0, 12.0)
				player1_the_trick_text_pos = (0.0, 50.0)
				player1_the_trick_text_dims = (250.0, 50.0)
				player2_the_trick_text_dims = <player1_the_trick_text_dims>
				player2_splitscreen_total_score_just = [right top]
				player2_the_score_pos = (<player1_the_score_pos>)
				player2_trick_text_container_pos = (<player1_trick_text_container_pos>)
				player2_score_multiplier_container_pos = (<player1_score_multiplier_container_pos>)
				player2_splitscreen_total_score_pos = (230.0, 40.0)
				player2_the_score_pot_text = (<player1_the_score_pot_text>)
				player2_the_trick_text_pos = ((<player1_the_trick_text_pos>) + (50.0, 0.0))
				player2_the_trick_text_dims = (<player1_the_trick_text_dims>)
			endif
			createscreenelement {
				id = player1_panel_container
				type = containerelement
				parent = root_window
				dims = <player1_panel_dims>
				pos = <player1_panel_pos>
				just = [left top]
				scale = (2.0, 1.5)
			}
			createscreenelement {
				id = player2_panel_container
				type = containerelement
				parent = root_window
				dims = <player2_panel_dims>
				pos = <player2_panel_pos>
				just = [left top]
				scale = (2.0, 1.5)
			}
			case split_horizontal
			printf "SETTING UP HUD: SPLIT HORIZONTAL"
			trick_text_dims = (340.0, 50.0)
			trick_text_pos = (287.0, 2.0)
			the_time_pos = (420.0, 10.0)
			timer_scale = 1.0
			player1_panel_dims = (640.0, 240.0)
			player1_panel_pos = (90.0, 0.0)
			player2_panel_dims = (640.0, 240.0)
			player2_panel_pos = (90.0, 360.0)
			player1_the_trick_text_dims = (150.0, 50.0)
			player1_trick_text_container_pos = (-100.0, 0.0)
			player1_score_multiplier_container_pos = (318.0, 12.0)
			player1_splitscreen_total_score_pos = (75.0, 40.0)
			player1_splitscreen_total_score_just = [left top]
			player1_the_score_pos = (535.0, 418.0)
			player1_the_score_pot_text = (0.0, 0.0)
			player1_the_trick_text_pos = (-100.0, 50.0)
			player1_the_trick_text_dims = (200.0, 50.0)
			player2_the_trick_text_dims = <player1_the_trick_text_dims>
			player2_trick_text_container_pos = (<player1_trick_text_container_pos>)
			player2_score_multiplier_container_pos = (<player1_score_multiplier_container_pos>)
			player2_splitscreen_total_score_just = [left top]
			player2_splitscreen_total_score_pos = <player1_splitscreen_total_score_pos>
			player2_the_score_pos = (<player1_the_score_pos>)
			player2_the_score_pot_text = (<player1_the_score_pot_text>)
			player2_the_trick_text_pos = (<player1_the_trick_text_pos>)
			player2_the_trick_text_dims = (<player1_the_trick_text_dims>)
			createscreenelement {
				id = player1_panel_container
				type = containerelement
				parent = root_window
				dims = <player1_panel_dims>
				pos = <player1_panel_pos>
				just = [left top]
				scale = (2.0, 1.5)
			}
			createscreenelement {
				id = player2_panel_container
				type = containerelement
				parent = root_window
				dims = <player2_panel_dims>
				pos = <player2_panel_pos>
				just = [left top]
				scale = (2.0, 1.5)
			}
		endswitch
	else
		printf "SETTING UP HUD: NOT SPLIT SCREEN GAME"
		trick_text_dims = (340.0, 50.0)
		trick_text_pos = (287.0, 2.0)
		the_time_pos = (0.0, 0.0)
		timer_scale = 1.0
		player1_panel_dims = (640.0, 480.0)
		player1_panel_pos = (0.0, 0.0)
		player1_the_score_pos = (535.0, 418.0)
		player1_the_score_pot_text = (0.0, 0.0)
		player1_the_trick_text_pos = (0.0, 50.0)
		player1_the_trick_text_dims = (350.0, 50.0)
		player1_trick_text_container_pos = (0.0, 0.0)
		player1_score_multiplier_container_pos = (318.0, 12.0)
		player1_splitscreen_total_score_pos = (50.0, 30.0)
		createscreenelement {
			id = player1_panel_container
			type = containerelement
			parent = root_window
			scale = (2.0, 1.5)
			dims = <player1_panel_dims>
			pos = <player1_panel_pos>
			just = [left top]
		}
	endif
	createscreenelement {
		id = the_time
		type = containerelement
		parent = root_window
		pos = <the_time_pos>
		just = [left top]
		z_priority = -1
	}
	createscreenelement {
		id = goal_viewport_parent
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
		just = [left top]
		z_priority = -1
	}
	createscreenelement {
		id = the_score
		type = textelement
		parent = player1_panel_container
		font = text_a1
		text = " "
		scale = 0.55
		pos = <player1_the_score_pos>
		just = [right bottom]
		rgba = [40 200 200 255]
		alpha = 0
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	player1_panel_container :settags current_trick_state = 0 current_text_block = ''
	if insplitscreengame
		createscreenelement {
			id = splitscreen_total_score_container
			type = containerelement
			parent = player1_panel_container
			scale = 0.75
			pos = <player1_splitscreen_total_score_pos>
			just = <player1_splitscreen_total_score_just>
			alpha = 1.0
		}
		<main_container> = <id>
		createscreenelement {
			parent = <main_container>
			type = containerelement
			local_id = score_bg
			pos = (0.0, 15.0)
			just = [center center]
			z_priority = 4
			alpha = 1.0
		}
		<bg_container> = <id>
		createscreenelement {
			parent = <bg_container>
			type = spriteelement
			texture = cap_whitenoise
			scale = (((0.55, 0.0) * Random (@ 0.85 @ 0.95 @ 0.9 @ -0.85 @ -0.95 @ 0.9 )) + ((0.0, 2.2) * Random (@ 0.5 @ -0.5 @ -0.6 @ 0.6 )))
			just = [center center]
			rgba = [220 220 220 220]
			z_priority = 3
			alpha = 0.5
		}
		createscreenelement {
			parent = <bg_container>
			type = spriteelement
			texture = menu_highlight
			scale = (((0.55, 0.0) * Random (@ 1 @ 1.05 @ 0.95 )) + ((0.0, 2.2) * Random (@ -1.05 @ -1 @ 1 )))
			just = [center center]
			rgba = [0 0 0 255]
			alpha = 1
			rot_angle = RandomRange (-1.5, 1.0)
			z_priority = 2
			alpha = 0.5
		}
		createscreenelement {
			parent = <bg_container>
			type = spriteelement
			texture = menu_highlight
			scale = (-0.5, 1.1)
			just = [center center]
			rgba = ($goal_ui_scheme.main)
			rot_angle = RandomRange (1.0, -1.0)
			alpha = 0.5
			z_priority = 1
			pos = (0.0, -15.0)
		}
		createscreenelement {
			parent = <main_container>
			type = textelement
			local_id = score_in_goal_title
			pos = (0.0, 0.0)
			just = [center center]
			scale = (0.6, 0.7)
			font = text_a1
			z_priority = 5
			rgba = [200 200 200 255]
			text = "player 1"
			font_spacing = 3
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			id = splitscreen_total_score
			type = textelement
			parent = <main_container>
			font = text_a1
			z_priority = 5
			text = "0"
			scale = 0.6
			pos = (0.0, 32.0)
			just = [center center]
			rgba = [200 200 200 255]
			alpha = 1
			font_spacing = 3
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
	endif
	score_color = [240 240 240 255]
	createscreenelement {
		id = the_score_sprite
		type = spriteelement
		parent = the_score
		texture = score_solo
		scale = 0
		pos = (-17.0, 23.0)
		rgba = <score_color>
	}
	createscreenelement {
		id = trick_text_container
		type = containerelement
		parent = player1_panel_container
		scale = 1.0
		dims = <trick_text_dims>
		just = [center center]
		alpha = 0.0
	}
	createscreenelement {
		id = the_trick_text
		type = textblockelement
		parent = trick_text_container
		scale = 0.4
		pos = <player1_the_trick_text_pos>
		dims = <player1_the_trick_text_dims>
		just = [center top]
		internal_just = [center top]
		font = text_a1
		text = " "
		internal_scale = 0.4
		alpha = 1.0
		tags = {tag_state = inactive}
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		rgba = [250 180 0 255]
		z_priority = 0
	}
	createscreenelement {
		local_id = trick_text_1
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [center center]
		internal_just = [center center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [180 160 140 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		font_spacing = 3
		override_encoded_rgba
		override_encoded_alpha
	}
	createscreenelement {
		local_id = trick_text_block
		parent = trick_text_container
		type = textblockelement
		pos = (0.0, 0.0)
		dims = (900.0, 0.0)
		allow_expansion
		just = [center top]
		internal_just = [center top]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.4
		rgba = [210 180 70 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		override_encoded_alpha
	}
	createscreenelement {
		local_id = trick_text_2
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [210 180 70 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_3
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [180 160 140 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_4
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_5
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_6
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_7
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_8
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_9
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = trick_text_10
		parent = trick_text_container
		type = textelement
		pos = (100.0, 0.0)
		just = [right center]
		internal_just = [right center]
		font = text_a1
		text = ""
		alpha = 1
		scale = 0.5
		rgba = [200 200 200 255]
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		id = the_score_pot_text
		type = textelement
		parent = trick_text_container
		scale = 0.65000004
		font = text_a1
		text = " "
		alpha = 1.0
		z_priority = 0
		font_spacing = 3
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		id = score_multiplier_container
		type = containerelement
		parent = trick_text_container
		scale = 1.0
		pos = <player1_score_multiplier_container_pos>
		just = [center center]
	}
	createscreenelement {
		id = score_multiplier_text
		type = textelement
		parent = score_multiplier_container
		scale = (0.55, 0.65000004)
		just = [right center]
		pos = (-8.0, 1.0)
		font = text_a1
		text = " "
		alpha = 1.0
		z_priority = 1
		font_spacing = 3
		rgba = $score_color_1
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		local_id = score_multiplier_x
		type = textelement
		parent = score_multiplier_container
		scale = 0.6
		just = [right center]
		pos = (-8.0, 0.0)
		font = text_a1
		text = "x"
		alpha = 0
		z_priority = 0
		font_spacing = 0
		rgba = $trick_text_color_1
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	construct_score_in_goal
	construct_stoken_icon
	construct_secret_spot_message
	reset_trick_text_appearance {
		score_multiplier_container_id = score_multiplier_container
		the_trick_text_id = the_trick_text
		the_score_pot_text_id = the_score_pot_text
		the_trick_text_id = the_trick_text
		trick_text_container_id = trick_text_container
		score_multiplier_text = score_multiplier_text
	}
	build_balance_meter index = 0
	if insplitscreengame
		ScriptGetScreenMode
		ScriptGetScreenMode
		switch <screen_mode>
			case split_vertical
			createscreenelement {
				id = the_run_timer
				type = spriteelement
				parent = player1_panel_container
				texture = HUD_runtimer_bg
				scale = 1.0
				just = [center center]
				pos = (240.0, 240.0)
				alpha = 0
				rgba = [226 180 130 220]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
			case split_horizontal
			createscreenelement {
				id = the_run_timer
				type = spriteelement
				parent = player1_panel_container
				texture = HUD_runtimer_bg
				scale = 1.0
				just = [center center]
				pos = (375.0, 120.0)
				alpha = 0
				rgba = [226 180 130 220]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
			default
			createscreenelement {
				id = the_run_timer
				type = spriteelement
				parent = player1_panel_container
				texture = HUD_runtimer_bg
				scale = 1.0
				just = [center center]
				pos = (400.0, 240.0)
				alpha = 0
				rgba = [226 180 130 220]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
		endswitch
	else
		createscreenelement {
			id = the_run_timer
			type = spriteelement
			parent = player1_panel_container
			texture = HUD_runtimer_bg
			rgba = [226 180 130 220]
			scale = 1.0
			just = [center center]
			pos = (400.0, 240.0)
			alpha = 0
			tags = {tag_turned_on = 0 tag_mode = balance}
		}
	endif
	createscreenelement {
		id = the_run_timer_hand
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_hand
		scale = 0.8
		pos = (16.0, 16.0)
		just = [center center]
		rgba = [220 200 150 235]
		z_priority = 5
	}
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [left bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 0
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 45
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 90
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 135
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 180
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 225
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 270
	}
	GetStackedScreenElementPos y id = <id>
	createscreenelement {
		type = spriteelement
		parent = the_run_timer
		texture = HUD_runtimer_slice
		scale = 1
		pos = (16.0, 16.0)
		just = [right bottom]
		rgba = [226 180 130 170]
		z_priority = 3
		rot_angle = 315
	}
	if insplitscreengame
		score_color = [240 240 240 255]
		player2_panel_container :settags current_trick_state = 0 current_text_block = ''
		createscreenelement {
			id = (the_score + 1)
			type = textelement
			parent = player2_panel_container
			font = text_a1
			text = " "
			scale = 0.55
			pos = <player2_the_score_pos>
			just = [right bottom]
			rgba = [40 200 200 255]
			alpha = 0
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			id = (the_score_sprite + 1)
			type = spriteelement
			parent = (the_score + 1)
			texture = score_solo
			scale = 0
			pos = (-17.0, 23.0)
			rgba = <score_color>
		}
		createscreenelement {
			id = (trick_text_container + 1)
			type = containerelement
			parent = player2_panel_container
			scale = 1.0
			dims = <trick_text_dims>
			just = [center center]
			alpha = 0.0
		}
		createscreenelement {
			id = (the_trick_text + 1)
			type = textblockelement
			parent = (trick_text_container + 1)
			scale = 0.4
			pos = <player2_the_trick_text_pos>
			dims = <player2_the_trick_text_dims>
			just = [center top]
			internal_just = [center top]
			font = text_a1
			text = " "
			internal_scale = 0.4
			alpha = 1.0
			tags = {tag_state = inactive}
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
			rgba = [245 180 0 255]
			z_priority = 0
		}
		createscreenelement {
			local_id = trick_text_1
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [center center]
			internal_just = [center center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [180 160 140 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
			font_spacing = 3
			override_encoded_alpha
			override_encoded_rgba
		}
		createscreenelement {
			local_id = trick_text_block
			parent = (trick_text_container + 1)
			type = textblockelement
			pos = (0.0, 0.0)
			dims = (900.0, 0.0)
			allow_expansion
			just = [center top]
			internal_just = [center top]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.4
			rgba = [240 200 0 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
			override_encoded_alpha
		}
		createscreenelement {
			local_id = trick_text_2
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [180 160 140 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_3
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [180 160 140 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_4
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_5
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_6
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_7
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_8
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_9
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = trick_text_10
			parent = (trick_text_container + 1)
			type = textelement
			pos = (100.0, 0.0)
			just = [right center]
			internal_just = [right center]
			font = text_a1
			text = ""
			alpha = 1
			scale = 0.5
			rgba = [200 200 200 255]
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			id = (the_score_pot_text + 1)
			type = textelement
			parent = (trick_text_container + 1)
			scale = 0.65000004
			font = text_a1
			text = " "
			alpha = 1.0
			z_priority = 0
			font_spacing = 3
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			id = (score_multiplier_container + 1)
			type = containerelement
			parent = (trick_text_container + 1)
			scale = 1.0
			pos = <player2_score_multiplier_container_pos>
			just = [center center]
		}
		createscreenelement {
			id = (score_multiplier_text + 1)
			type = textelement
			parent = (score_multiplier_container + 1)
			scale = (0.55, 0.65000004)
			just = [right center]
			pos = (-8.0, 1.0)
			font = text_a1
			text = " "
			alpha = 1.0
			z_priority = 1
			font_spacing = 3
			rgba = $score_color_1
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			local_id = score_multiplier_x
			type = textelement
			parent = (score_multiplier_container + 1)
			scale = 0.6
			just = [right center]
			pos = (-8.0, 0.0)
			font = text_a1
			text = "x"
			alpha = 0
			z_priority = 0
			font_spacing = 0
			rgba = $trick_text_color_1
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		createscreenelement {
			id = (splitscreen_total_score_container + 1)
			type = containerelement
			parent = player2_panel_container
			scale = 0.75
			pos = <player2_splitscreen_total_score_pos>
			just = <player2_splitscreen_total_score_just>
			alpha = 1.0
		}
		<main_container> = <id>
		createscreenelement {
			parent = <main_container>
			type = containerelement
			local_id = score_bg
			pos = (0.0, 15.0)
			just = [center center]
			z_priority = 4
			alpha = 1.0
		}
		<bg_container> = <id>
		createscreenelement {
			parent = <bg_container>
			type = spriteelement
			texture = cap_whitenoise
			scale = (((0.55, 0.0) * Random (@ 0.85 @ 0.95 @ 0.9 @ -0.85 @ -0.95 @ 0.9 )) + ((0.0, 2.2) * Random (@ 0.5 @ -0.5 @ -0.6 @ 0.6 )))
			just = [center center]
			rgba = [220 220 220 220]
			z_priority = 3
			alpha = 0.5
		}
		createscreenelement {
			parent = <bg_container>
			type = spriteelement
			texture = menu_highlight
			scale = (((0.55, 0.0) * Random (@ 1 @ 1.05 @ 0.95 )) + ((0.0, 2.2) * Random (@ -1.05 @ -1 @ 1 )))
			just = [center center]
			rgba = [0 0 0 255]
			alpha = 1
			rot_angle = RandomRange (-1.5, 1.0)
			z_priority = 2
			alpha = 0.5
		}
		createscreenelement {
			parent = <bg_container>
			type = spriteelement
			texture = menu_highlight
			scale = (-0.5, 1.1)
			just = [center center]
			rgba = ($goal_ui_scheme.main)
			rot_angle = RandomRange (1.0, -1.0)
			alpha = 0.5
			z_priority = 1
			pos = (0.0, -15.0)
		}
		createscreenelement {
			parent = <main_container>
			type = textelement
			local_id = score_in_goal_title
			pos = (0.0, 0.0)
			just = [center center]
			scale = (0.6, 0.7)
			font = text_a1
			z_priority = 5
			rgba = [200 200 200 255]
			text = "player 2"
			font_spacing = 3
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			id = (splitscreen_total_score + 1)
			type = textelement
			parent = <main_container>
			font = text_a1
			z_priority = 5
			text = "0"
			scale = 0.6
			pos = (0.0, 32.0)
			just = [center center]
			rgba = [200 200 200 255]
			alpha = 1
			font_spacing = 3
			shadow
			shadow_offs = $trick_text_shadow_offset
			shadow_rgba = $trick_text_shadow_color
		}
		reset_trick_text_appearance {
			score_multiplier_container_id = (score_multiplier_container + 1)
			the_trick_text_id = (the_trick_text + 1)
			the_score_pot_text_id = (the_score_pot_text + 1)
			the_trick_text_id = (the_trick_text + 1)
			trick_text_container_id = (trick_text_container + 1)
			score_multiplier_text = (score_multiplier_text + 1)
		}
		build_balance_meter index = 1
		ScriptGetScreenMode
		switch <screen_mode>
			case split_vertical
			createscreenelement {
				id = (the_run_timer + 1)
				type = spriteelement
				parent = player2_panel_container
				texture = HUD_runtimer_bg
				scale = 1.0
				just = [center center]
				pos = (240.0, 240.0)
				alpha = 0
				rgba = [226 180 130 220]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
			case split_horizontal
			createscreenelement {
				id = (the_run_timer + 1)
				type = spriteelement
				parent = player2_panel_container
				texture = HUD_runtimer_bg
				scale = 1.0
				just = [center center]
				pos = (375.0, 120.0)
				alpha = 0
				rgba = [226 180 130 220]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
			default
			createscreenelement {
				id = (the_run_timer + 1)
				type = spriteelement
				parent = player2_panel_container
				texture = HUD_runtimer_bg
				scale = 1.0
				just = [center center]
				pos = (400.0, 240.0)
				alpha = 0
				rgba = [226 180 130 220]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
		endswitch
		createscreenelement {
			id = (the_run_timer_hand + 1)
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_hand
			scale = 0.8
			pos = (16.0, 16.0)
			just = [center center]
			rgba = [220 200 150 235]
			z_priority = 5
		}
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [left bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 0
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 45
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 90
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 135
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 180
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 225
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 270
		}
		GetStackedScreenElementPos y id = <id>
		createscreenelement {
			type = spriteelement
			parent = (the_run_timer + 1)
			texture = HUD_runtimer_slice
			scale = 1
			pos = (16.0, 16.0)
			just = [right bottom]
			rgba = [226 180 130 170]
			z_priority = 3
			rot_angle = 315
		}
	endif
	create_panel_stuff_2p_render
	if getglobalflag flag = $no_display_hud
		goalmanager_hidepoints
	endif
	if innetgame
		if isobserving
			hide_panel_stuff
		endif
		create_score_menu
	endif
	if ($debug_show_skater_coord_anchor = 1)
		debug_display_skater_coords_internal
	endif
	if ($show_build_version = 1)
		debug_toggle_changelist show
	endif
endscript

script build_balance_meter index = 0
	if (<index> = 0)
		parent = player1_panel_container
		pos_mod = (0.0, 0.0)
	else
		parent = player2_panel_container
		pos_mod = (30.0, 0.0)
	endif
	window_dims = (1280.0, 720.0)
	if insplitscreengame
		ScriptGetScreenMode
		if (<screen_mode> = split_vertical)
			window_dims = (640.0, 720.0)
		elseif (<screen_mode> = split_horizontal)
			window_dims = (1280.0, 360.0)
			pos_mod = (-45.0, 0.0)
		endif
	endif
	createscreenelement {
		type = windowelement
		parent = <parent>
		id = (balancewindow + <index>)
		dims = <window_dims>
		pos = ((0.0, 0.0) + <pos_mod>)
		just = [left top]
	}
	createscreenelement {
		id = (the_balance_meter + <index>)
		type = containerelement
		parent = (balancewindow + <index>)
		dims = (0.0, 0.0)
		pos = (0.0, 0.0)
		just = [center center]
		rgba = [240 240 240 0]
		tags = {tag_turned_on = 0 tag_mode = balance}
	}
	createscreenelement {
		type = spriteelement
		parent = (the_balance_meter + <index>)
		texture = balancearrow_glow
		local_id = balance_arrow
		pos = (320.0, 240.0)
		just = [center center]
		rgba = [240 240 240 0]
		z_priority = 3
		scale = 2.0
	}
	build_balance_container index = <index>
	createscreenelement {
		type = spriteelement
		parent = (the_balance_meter + <index>)
		texture = balancemeter
		scale = 0.6
		just = [right center]
		pos = (0.0, 0.0)
		rgba = [240 240 240 0]
		alpha = 0
		z_priority = 2
	}
	createscreenelement {
		type = spriteelement
		parent = (the_balance_meter + <index>)
		texture = balancemeter_2
		scale = 0.6
		just = [left center]
		pos = (0.0, 0.0)
		rgba = [240 240 240 0]
		alpha = 0
		z_priority = 2
	}
	createscreenelement {
		type = spriteelement
		parent = (the_balance_meter + <index>)
		texture = balancemeter_bg
		scale = 0.6
		just = [center center]
		pos = (0.0, 0.0)
		rgba = [240 240 240 0]
		alpha = 1
		z_priority = 1
	}
endscript

script build_balance_container index = 0
	createscreenelement {
		type = containerelement
		parent = {(the_balance_meter + <index>) child = 0}
		id = (balancecontainer + <index>)
		pos = (0.0, 0.0)
		just = [center center]
		z_priority = 3
		alpha = 0
		dims = (0.0, 0.0)
	}
	createscreenelement {
		type = spriteelement
		parent = (balancecontainer + <index>)
		texture = full_screen_balance_01
		scale = (1.0, 1.0)
		pos = (0.0, 50.0)
		just = [left center]
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = (balancecontainer + <index>)
		texture = full_screen_balance_01
		scale = (-1.0, 1.0)
		pos = (0.0, 50.0)
		just = [right center]
		z_priority = 3
	}
endscript

script create_panel_stuff_2p_render 
	if insplitscreengame
		if NOT screenelementexists id = player2_render
			ScriptGetScreenMode
			switch <screen_mode>
				case split_vertical
				createscreenelement {
					parent = root_window
					type = viewportelement
					id = player2_render
					texture = viewport0
					blend = diffuse
					pos = (640.0, 0.0)
					just = [left top]
					dims = (640.0, 720.0)
					z_priority = -10000
					existing_viewport_id = 1
				}
				case split_horizontal
				createscreenelement {
					parent = root_window
					type = viewportelement
					id = player2_render
					texture = viewport0
					blend = diffuse
					pos = (0.0, 360.0)
					just = [left top]
					dims = (1280.0, 360.0)
					z_priority = -10000
					existing_viewport_id = 1
				}
			endswitch
		endif
	endif
endscript
newtrickfont_colors = [
	[
		0
		128
		230
		240
	]
	[
		200
		90
		11
		240
	]
	[
		0
		240
		0
		240
	]
	[
		240
		0
		0
		240
	]
	[
		176
		205
		224
		255
	]
]

script updatescorepot 
	if getglobalflag \{flag = $no_display_hud}
		doscreenelementmorph \{id = the_score_pot_text
			alpha = 0.0
			remember_alpha}
		if insplitscreengame
			if screenelementexists id = (the_score_pot_text + 1)
				doscreenelementmorph id = (the_score_pot_text + 1) alpha = 0.0 remember_alpha
			endif
		endif
	endif
endscript

script updatetricktext 
	if getglobalflag \{flag = $no_display_trickstring}
		doscreenelementmorph \{id = the_trick_text
			alpha = 0.0
			remember_alpha}
		if insplitscreengame
			if screenelementexists id = (the_trick_text + 1)
				doscreenelementmorph id = (the_trick_text + 1) alpha = 0.0 remember_alpha
			endif
		endif
	endif
endscript

script pause_trick_text 
	setscreenelementprops \{id = the_trick_text
		hide}
	if insplitscreengame
		if screenelementexists id = (the_trick_text + 1)
			setscreenelementprops id = (the_trick_text + 1) hide
		endif
	endif
	setscreenelementprops \{id = the_score_pot_text
		hide}
	if insplitscreengame
		if screenelementexists id = (the_score_pot_text + 1)
			setscreenelementprops id = (the_score_pot_text + 1) hide
		endif
	endif
endscript

script unpause_trick_text 
	if NOT getglobalflag flag = $no_display_trickstring
		setscreenelementprops id = the_trick_text unhide
		if insplitscreengame
			if screenelementexists id = (the_trick_text + 1)
				setscreenelementprops id = (the_trick_text + 1) unhide
			endif
		endif
	endif
	if NOT getglobalflag flag = $NO_DISPLAY_BASESCORE
		setscreenelementprops id = the_score_pot_text unhide
		if insplitscreengame
			if screenelementexists id = (the_score_pot_text + 1)
				setscreenelementprops id = (the_score_pot_text + 1) unhide
			endif
		endif
	endif
endscript

script trick_text_pulse 
	reset_trick_text_appearance <...>
	if NOT getglobalflag \{flag = $no_display_trickstring}
		terminateobjectsscripts id = <trick_text_container_id>
		terminateobjectsscripts id = <the_trick_text_id>
		runscriptonscreenelement id = <the_trick_text_id> do_trick_text_pulse params = <...>
	endif
	if NOT getglobalflag \{flag = $NO_DISPLAY_BASESCORE}
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = do_score_pot_text_landed
	endif
endscript

script do_trick_text_pulse 
	if gotparam \{new_text_style_script}
		<new_text_style_script> <...>
	else
	endif
endscript

script do_trick_text_spazz 
	begin
	rot_angle = 0
	domorph \{scale = 1.3
		time = 0.05
		alpha = 0.7}
	domorph \{scale = 0.8
		time = 0.05
		alpha = 1}
	domorph \{scale = 1.1
		time = 0.05
		alpha = 0.6}
	domorph \{scale = 1.0
		time = 0.05
		alpha = 0.9}
	repeat
endscript

script trick_text_landed 
	if NOT getglobalflag flag = $no_display_trickstring
		terminateobjectsscripts id = <trick_text_container_id>
		terminateobjectsscripts id = <the_trick_text_id>
	endif
	if NOT getglobalflag flag = $NO_DISPLAY_BASESCORE
		terminateobjectsscripts id = <the_score_pot_text_id>
	endif
	if NOT gotparam skater_num
		player1_panel_container :settags current_trick_state = 0
	else
		player2_panel_container :settags current_trick_state = 0
	endif
	runscriptonscreenelement id = <the_score_pot_text_id> do_score_pot_text_landed params = {<...>}
	runscriptonscreenelement id = <trick_text_container_id> do_trick_text_landed params = {<...>}
	spawnscriptlater reset_trick_string params = {<...>}
endscript

script do_trick_text_landed 
	if NOT getglobalflag flag = $no_display_trickstring
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_1} alpha = 1 scale = 0.5
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_2} alpha = 1 scale = 0.5
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_3} alpha = 1 scale = 0.5
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_4} alpha = 1 scale = 0.5
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_1} time = 1 rgba = $trick_text_color_2
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_2} time = 1 rgba = $trick_text_color_2
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_3} time = 1 rgba = $trick_text_color_2
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_4} time = 1 rgba = $trick_text_color_2
		doscreenelementmorph id = <score_multiplier_container_id> alpha = 0
		if insplitscreengame
			ScriptGetScreenMode
			if (<screen_mode> = split_vertical)
				domorph scale = (4.5, 1.2) time = 0
				domorph scale = (0.8, 0.8) time = 0.1
				domorph scale = 1.05 time = 0.1
				domorph scale = 1.0 time = 0.3 anim = gentle
			else
				domorph scale = (4.5, 1.2) time = 0
				domorph scale = (0.8, 0.8) time = 0.1
				domorph scale = 1.05 time = 0.1
				domorph scale = 1.0 time = 0.3 anim = gentle
			endif
		else
			domorph scale = (4.5, 1.2) time = 0
			domorph scale = (0.8, 0.8) time = 0.1
			domorph scale = 1.05 time = 0.1
			domorph scale = 1.0 time = 0.3 anim = gentle
		endif
	endif
endscript

script do_score_pot_text_landed 
	if NOT getglobalflag flag = $NO_DISPLAY_BASESCORE
		wait 1 gameframe
		doscreenelementmorph id = {<score_multiplier_container_id> child = score_multiplier_x} alpha = 0.0
		if NOT getglobalflag flag = $no_display_hud
			setscreenelementprops id = <the_score_pot_text_id> rgba = [40 200 200 255]
			if insplitscreengame
				ScriptGetScreenMode
				if (<screen_mode> = split_vertical)
					domorph scale = 1.0 time = 0
					domorph scale = 1.5 time = 0.05
					domorph scale = 0.8 time = 0.05
					domorph scale = 1.0 time = 0.2
				else
					domorph scale = 1.0 time = 0
					domorph scale = 1.5 time = 0.05
					domorph scale = 0.8 time = 0.05
					domorph scale = 1.0 time = 0.2
				endif
			else
				domorph scale = 1.0 time = 0
				domorph scale = 1.5 time = 0.05
				domorph scale = 0.8 time = 0.05
				domorph scale = 1.0 time = 0.2
			endif
		endif
		doscreenelementmorph id = <the_score_pot_text_id> alpha = 0.0
	endif
endscript

script trick_text_countdown 
	if NOT getglobalflag \{flag = $no_display_trickstring}
		terminateobjectsscripts id = <the_trick_text_id>
	endif
	runscriptonscreenelement id = <the_trick_text_id> do_trick_text_countdown params = {<...>}
endscript

script do_trick_text_countdown 
	if NOT getglobalflag \{flag = $no_display_trickstring}
		domorph \{scale = 0.0
			time = 2}
		domorph \{alpha = 0.0}
	endif
endscript

script trick_text_bail 
	if NOT getglobalflag \{flag = $no_display_trickstring}
		terminateobjectsscripts id = <trick_text_container_id>
		terminateobjectsscripts id = <the_trick_text_id>
	endif
	runscriptonscreenelement id = <trick_text_container_id> do_trick_text_bail params = {<...>}
endscript

script do_trick_text_bail 
	doscreenelementmorph id = {<score_multiplier_container_id> child = score_multiplier_x} alpha = 0.0
	if NOT getglobalflag flag = $no_display_hud
		if insplitscreengame
			setscreenelementprops id = <the_score_pot_text_id> rgba = [240 64 64 200]
		else
			doscreenelementmorph id = <the_score_pot_text_id> alpha = 0
			<show_score_after_bailed> = 1
			if screenelementexists id = trick_text_container
				if trick_text_container :getprops
					if (<alpha> < 0.01)
						<show_score_after_bailed> = 0
					endif
				endif
			endif
			if (<show_score_after_bailed> = 1)
				<the_score_pot_text_id> :text_getstring
				getscreenelementprops id = <the_score_pot_text_id>
				getscreenelementposition id = <the_score_pot_text_id> absolute
				if screenelementexists id = bail_score_text
					destroyscreenelement id = bail_score_text
				endif
				createscreenelement {
					id = bail_score_text
					parent = player1_panel_container
					type = textelement
					text = <string>
					font = text_a1
					pos = (<screenelementpos> * 0.5)
					scale = <scale>
					rgba = [240 64 64 200]
					shadow
					shadow_rgba = $trick_text_shadow_color
					shadow_offs = $trick_text_shadow_offset
				}
				runscriptonscreenelement id = bail_score_text score_text_bail
			endif
		endif
	endif
	wait 0.05 seconds
	if insplitscreengame
		ScriptGetScreenMode
		if (<screen_mode> = split_vertical)
			domorph alpha = 0 scale = 0 time = 0
			domorph pos = {(0.0, 25.0) relative} scale = (0.4, 0.7) alpha = 1 time = 0.05
			domorph pos = {(0.0, -25.0) relative} scale = 0.4 time = 0.1
			domorph pos = {(0.0, 20.0) relative} scale = 0.8 time = 0.06
			domorph pos = {(0.0, -20.0) relative} scale = 0.6 time = 0.06
			domorph pos = {(0.0, 10.0) relative} scale = 0.8 time = 0.05
		else
			domorph alpha = 0 scale = 0 time = 0
			domorph pos = {(0.0, 25.0) relative} scale = (0.7, 1.8) alpha = 1 time = 0.05
			domorph pos = {(0.0, -25.0) relative} scale = 0.9 time = 0.1
			domorph pos = {(0.0, 20.0) relative} scale = 1.15 time = 0.06
			domorph pos = {(0.0, -20.0) relative} scale = 1.12 time = 0.06
			domorph pos = {(0.0, 10.0) relative} scale = 1.1 time = 0.05
		endif
	else
		domorph alpha = 0 scale = 0 time = 0
		domorph pos = {(0.0, 15.0) relative} scale = (0.7, 1.8) alpha = 1 time = 0.05
		domorph pos = {(0.0, -15.0) relative} scale = 0.9 time = 0.1
		domorph pos = {(0.0, 10.0) relative} scale = 1.15 time = 0.06
		domorph pos = {(0.0, -10.0) relative} scale = 1.12 time = 0.06
		domorph pos = {(0.0, 5.0) relative} scale = 1.1 time = 0.05
		domorph alpha = 0 scale = 0 time = 0
	endif
	spawnscriptlater reset_trick_string params = {bailed <...>}
endscript

script score_text_bail 
	onexitrun \{score_text_bail_die}
	wait \{0.5
		second
		ignoreslomo}
	doscreenelementmorph \{id = bail_score_text
		pos = {
			(0.0, 40.0)
			relative
		}
		time = 2.5
		alpha = 0}
	wait \{2.5
		seconds
		ignoreslomo}
endscript

script score_text_bail_die 
	if screenelementexists \{id = bail_score_text}
		destroyscreenelement \{id = bail_score_text}
	endif
endscript

script runtwoscripts 
	if NOT getglobalflag \{flag = $no_display_trickstring}
		runscriptonscreenelement id = <the_trick_text_id> <script_text>
	endif
	if NOT getglobalflag \{flag = $NO_DISPLAY_BASESCORE}
		runscriptonscreenelement id = <the_score_pot_text_id> <script_score>
	endif
endscript

script bail1 
	domorph \{pos = {
			(0.0, 0.0)
			relative
		}
		time = 0.1
		scale = 1.9
		fast_in}
	domorph \{pos = {
			(0.0, 0.0)
			relative
		}
		time = 0.3
		scale = 3.0
		alpha = 0
		fast_in}
	domorph \{pos = {
			(0.0, 0.0)
			relative
		}
		scale = 1.0
		alpha = 0
		fast_in}
endscript

script bail2 
	domorph \{pos = {
			(0.0, -5.0)
			relative
		}
		time = 0.4}
	domorph \{pos = {
			(0.0, 448.0)
			relative
		}
		time = 0.7
		fast_in}
	domorph \{alpha = 0.0}
	domorph \{pos = {
			(0.0, -443.0)
			relative
		}
		scale = 1.0
		alpha = 0
		fast_in}
endscript

script bail3 
	wait 0.1 second
	domorph pos = {(0.0, -5.0) relative} time = 0.2
	domorph pos = {(3.0, 0.0) relative} time = 0.05
	domorph pos = {(-3.0, 0.0) relative} time = 0.05
	domorph pos = {(4.0, 0.0) relative} time = 0.05
	domorph pos = {(-4.0, 0.0) relative} time = 0.05
	domorph pos = {(0.0, 448.0) relative} time = 0.5 fast_in
	domorph alpha = 0.0
	domorph pos = {(0.0, -443.0) relative} scale = 1.0 alpha = 0 fast_in
endscript

script bail4 
	domorph pos = {(-15.0, 0.0) relative} time = 0.1
	domorph pos = {(0.0, 4.0) relative} time = 0.02
	domorph pos = {(0.0, -4.0) relative} time = 0.02
	domorph pos = {(0.0, 2.0) relative} time = 0.02
	domorph pos = {(0.0, -2.0) relative} time = 0.02
	domorph pos = {(150.0, 0.0) relative} time = 0.06 alpha = 0.7
	domorph pos = {(200.0, 0.0) relative} scale = (2.0, 0.1) time = 0.06 alpha = 0 fast_in
	domorph pos = {(200.0, 0.0) relative} time = 0
	domorph pos = {(-535.0, 0.0) relative} scale = 1.0 alpha = 0 fast_in
endscript

script bail5 
	domorph pos = {(15.0, 0.0) relative} time = 0.1
	domorph pos = {(0.0, 4.0) relative} time = 0.02
	domorph pos = {(0.0, -4.0) relative} time = 0.02
	domorph pos = {(0.0, 2.0) relative} time = 0.02
	domorph pos = {(0.0, -2.0) relative} time = 0.02
	domorph pos = {(-150.0, 0.0) relative} time = 0.06 alpha = 0.7
	domorph pos = {(-200.0, 0.0) relative} scale = (2.0, 0.1) time = 0.06 alpha = 0 fast_in
	domorph pos = {(-200.0, 0.0) relative} time = 0
	domorph pos = {(535.0, 0.0) relative} scale = 1.0 alpha = 0 fast_in
endscript

script bail6 
	domorph \{pos = {
			(0.0, 0.0)
			relative
		}
		time = 0.2
		scale = 1.3
		alpha = 0.6
		fast_in}
	wait \{0.2
		second}
	domorph \{pos = {
			(0.0, 0.0)
			relative
		}
		time = 0.15
		scale = 0
		alpha = 0
		fast_in}
endscript

script reset_just_trick_text_appearance 
	if NOT getglobalflag flag = $no_display_trickstring
		if insplitscreengame
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				trick_text_pos = (320.0, 410.0)
				text_scale = 1.0
			else
				ScriptGetScreenMode
				switch <screen_mode>
					case split_vertical
					case one_camera
					trick_text_pos = (120.0, 450.0)
					text_scale = 0.9
					case split_horizontal
					trick_text_pos = (210.0, 193.0)
					text_scale = 1.0
				endswitch
			endif
			doscreenelementmorph {
				id = <trick_text_container_id>
				alpha = 1.0
				pos = <trick_text_pos>
				just = [center top]
				scale = <text_scale>
			}
			doscreenelementmorph {
				id = <the_trick_text_id>
				scale = <text_scale>
				pos = {(0.5, 0.0) proportional}
				just = [center top]
				internal_just = [center top]
				internal_scale = 0.7
				alpha = 1.0
			}
		else
			doscreenelementmorph {
				id = <trick_text_container_id>
				alpha = 1.0
				pos = $trick_text_reset_position
				scale = 1.0
			}
			doscreenelementmorph {
				id = <the_trick_text_id>
				scale = 1.0
				pos = {(0.75, 0.0) proportional}
				just = [right top]
				internal_just = [right top]
				internal_scale = 0.7
				alpha = 1.0
			}
		endif
	else
		if insplitscreengame
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				trick_text_pos = (320.0, 410.0)
				text_scale = 1.0
			else
				ScriptGetScreenMode
				switch <screen_mode>
					case split_vertical
					case one_camera
					trick_text_pos = (142.0, 405.0)
					text_scale = 0.95
					case split_horizontal
					trick_text_pos = (320.0, 200.0)
					text_scale = 1.0
				endswitch
			endif
			doscreenelementmorph {
				id = <trick_text_container_id>
				alpha = 1.0
				pos = <trick_text_pos>
				just = [center top]
				scale = <text_scale>
			}
		else
			doscreenelementmorph {
				id = <trick_text_container_id>
				alpha = 1.0
				pos = (320.0, 420.0)
				scale = 1.0
			}
		endif
	endif
endscript

script reset_trick_text_appearance 
	terminateobjectsscripts id = <the_trick_text_id> script_name = bail1
	terminateobjectsscripts id = <the_trick_text_id> script_name = bail2
	terminateobjectsscripts id = <the_trick_text_id> script_name = bail3
	terminateobjectsscripts id = <the_trick_text_id> script_name = bail4
	terminateobjectsscripts id = <the_trick_text_id> script_name = bail5
	terminateobjectsscripts id = <the_trick_text_id> script_name = bail6
	reset_just_trick_text_appearance <...>
	if NOT getglobalflag flag = $no_display_hud
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = bail1
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = bail2
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = bail3
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = bail4
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = bail5
		terminateobjectsscripts id = <the_score_pot_text_id> script_name = bail6
		setscreenelementprops id = <the_score_pot_text_id> rgba = $score_color_1
		if insplitscreengame
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				doscreenelementmorph {
					id = <the_score_pot_text_id>
					scale = 0.55
					pos = (380.0, 12.0)
					just = [center bottom]
					alpha = 1.0
				}
				doscreenelementmorph {
					id = <score_multiplier_container_id>
					pos = (318.0, 12.0)
					just = [center center]
					alpha = 1
				}
				doscreenelementmorph {
					id = <the_trick_text_id>
					pos = (100.0, 10.0)
				}
			else
				ScriptGetScreenMode
				switch <screen_mode>
					case split_vertical
					case one_camera
					doscreenelementmorph {
						id = <the_score_pot_text_id>
						scale = 0.55
						pos = (200.0, -35.0)
						just = [right bottom]
						alpha = 1.0
					}
					doscreenelementmorph {
						id = <score_multiplier_container_id>
						pos = (220.0, -60.0)
						just = [center center]
						alpha = 1
					}
					doscreenelementmorph {
						id = <the_trick_text_id>
						pos = (100.0, 8.0)
					}
					case split_horizontal
					doscreenelementmorph {
						id = <the_score_pot_text_id>
						scale = 0.55
						pos = (410.0, 30.0)
						just = [center bottom]
						alpha = 1.0
					}
					doscreenelementmorph {
						id = <score_multiplier_container_id>
						pos = (350.0, 30.0)
						just = [center center]
						alpha = 1
					}
					doscreenelementmorph {
						id = <the_trick_text_id>
						pos = (100.0, 10.0)
					}
				endswitch
			endif
		else
			if NOT getglobalflag flag = $no_display_hud
				doscreenelementmorph {
					id = <the_score_pot_text_id>
					alpha = 1.0
				}
				doscreenelementmorph {
					id = <score_multiplier_container_id>
					alpha = 1.0
				}
			endif
			doscreenelementmorph {
				id = <the_score_pot_text_id>
				scale = 0.55
				pos = (380.0, 13.0)
				just = [center bottom]
			}
			doscreenelementmorph {
				id = <score_multiplier_container_id>
				pos = (318.0, 12.0)
				just = [center center]
			}
			doscreenelementmorph {
				id = <the_trick_text_id>
				pos = (100.0, 10.0)
			}
		endif
	endif
endscript

script HideClock 
	killspawnedscript \{name = clock_morph}
	doscreenelementmorph \{id = the_time
		alpha = 0}
endscript

script ShowClock 
	doscreenelementmorph \{id = the_time
		alpha = 1}
endscript

script hide_balance_meter 
	if screenelementexists id = (the_balance_meter + <id>)
		setscreenelementprops id = (the_balance_meter + <id>) tags = {tag_turned_on = 0}
		runscriptonscreenelement id = (the_balance_meter + <id>) do_hide_balance_meter params = {id = <id>}
	endif
endscript

script pause_balance_meter 
	if screenelementexists \{id = the_balance_meter}
		runscriptonscreenelement \{id = the_balance_meter
			do_hide_balance_meter
			params = {
				id = 0
			}}
	endif
	if insplitscreengame
		if screenelementexists id = (the_balance_meter + 1)
			runscriptonscreenelement id = (the_balance_meter + 1) do_hide_balance_meter params = {id = 1}
		endif
	endif
endscript

script do_hide_balance_meter 
	containerid = (balancecontainer + <id>)
	meterid = (the_balance_meter + <id>)
	setscreenelementprops id = <meterid> rgba = [240 240 240 0]
	setscreenelementprops id = {<meterid> child = 0} rgba = [240 240 240 0]
	setscreenelementprops id = {<meterid> child = 1} rgba = [240 240 240 0]
	setscreenelementprops id = {<meterid> child = 2} rgba = [240 240 240 0]
	setscreenelementprops id = {<meterid> child = 3} rgba = [240 240 240 0]
	doscreenelementmorph id = <containerid> alpha = 0
endscript

script show_balance_meter 
	if NOT getglobalflag \{flag = $NO_DISPLAY_BALANCE}
		if NOT ((innetgame) && (getglobalflag flag = $no_g_display_balance))
			setscreenelementprops id = (the_balance_meter + <id>) tags = {tag_turned_on = 1}
			runscriptonscreenelement id = (the_balance_meter + <id>) do_show_balance_meter params = {id = <id>}
		endif
	endif
endscript

script unpause_balance_meter 
	runscriptonscreenelement \{id = the_balance_meter
		do_show_balance_meter
		params = {
			id = 0
		}}
	if insplitscreengame
		runscriptonscreenelement id = (the_balance_meter + 1) do_show_balance_meter params = {id = 1}
	endif
endscript

script do_show_balance_meter 
	passed_id = <id>
	if NOT getglobalflag flag = $NO_DISPLAY_BALANCE
		if NOT ((innetgame) && (getglobalflag flag = $no_g_display_balance))
			gettags
			id = <passed_id>
			balance_meter_color = [220 220 220 255]
			balance_arrow_color = [120 120 120 255]
			if IntegerEquals a = <tag_turned_on> b = 1
				containerid = (balancecontainer + <id>)
				meterid = (the_balance_meter + <id>)
				if ($balance_meter_test = 1)
					balance_meter_color = [220 220 220 0]
					if (<Manual> = false)
						setscreenelementprops id = {<containerid> child = 0} texture = full_screen_balance_01
						setscreenelementprops id = {<containerid> child = 1} texture = full_screen_balance_01
					else
						setscreenelementprops id = {<containerid> child = 0} texture = full_screen_balance_02
						setscreenelementprops id = {<containerid> child = 1} texture = full_screen_balance_02
					endif
					doscreenelementmorph id = <containerid> scale = 1.0
					doscreenelementmorph id = {<meterid> child = 0} rgba = [255 255 255 0]
					if insplitscreengame
						ScriptGetScreenMode
						if (<screen_mode> = split_vertical)
							if (<Manual> = false)
								doscreenelementmorph id = <containerid> scale = (0.7, 0.7)
							else
								doscreenelementmorph id = <containerid> scale = (0.4, 0.6)
							endif
						elseif (<screen_mode> = split_horizontal)
							if (<Manual> = false)
								doscreenelementmorph id = <containerid> scale = (1.0, 0.75)
							else
								doscreenelementmorph id = <containerid> scale = (1.0, 0.75)
							endif
						endif
					endif
				else
					setscreenelementprops id = {<meterid> child = 0} rgba = <balance_arrow_color> texture = balancearrow_glow
					doscreenelementmorph id = {<meterid> child = 0} scale = 0.8
					doscreenelementmorph id = <containerid> alpha = 0
				endif
				setscreenelementprops id = <meterid> rgba = <balance_meter_color>
				setscreenelementprops id = {<meterid> child = 3} rgba = <balance_meter_color>
			endif
		endif
	endif
endscript

script update_balance_meter_colors 
	if NOT getglobalflag flag = $NO_DISPLAY_BALANCE
		if innetgame
			if (getglobalflag flag = $no_g_display_balance)
				return
			endif
		endif
		if ((getglobalflag flag = $NO_DISPLAY_BALANCE))
			return
		endif
		ok_color = $balance_meter_color_safe
		bad_color = $balance_meter_color_danger
		if (<left> = 1)
			color1 = <ok_color>
		else
			color1 = <bad_color>
		endif
		if (<right> = 1)
			color2 = <ok_color>
		else
			color2 = <bad_color>
		endif
		if ($balance_meter_test = 1)
			getmanuallean
			if (<lean> < 0)
				lean = (-1 * <lean>)
			endif
			if (<lean> > 4096)
				lean = 4096
			endif
			if (<alpha1> > 0.0)
				rgba = <color1>
			else
				rgba = <color2>
			endif
			factor = (1.0 - (<lean> / 4096))
			i = 0
			begin
			value = ((<rgba> [<i>]) + (<factor> * (255 - (<rgba> [<i>]))))
			casttointeger value
			setarrayelement arrayname = rgba index = <i> newvalue = <value>
			i = (<i> + 1)
			repeat 3
			containerid = (balancecontainer + <id>)
			setscreenelementprops id = {<containerid> child = 0} rgba = <rgba>
			setscreenelementprops id = {<containerid> child = 1} rgba = <rgba>
			doscreenelementmorph id = <containerid> alpha = 1.0
		else
			meterid = (the_balance_meter + <id>)
			if (<alpha1> > 0.0)
				doscreenelementmorph id = {<meterid> child = balance_arrow} time = 0 rgba = <color1>
			else
				doscreenelementmorph id = {<meterid> child = balance_arrow} time = 0 rgba = <color2>
			endif
			doscreenelementmorph id = {<meterid> child = 1} time = 0 alpha = <alpha1> rgba = <color1>
			doscreenelementmorph id = {<meterid> child = 2} time = 0 alpha = <alpha2> rgba = <color2>
		endif
	endif
endscript

script hide_run_timer 
	if screenelementexists id = <id>
		setscreenelementprops id = <id> tags = {tag_turned_on = 0}
		runscriptonscreenelement id = <id> do_hide_run_timer params = {id = <id>}
	endif
endscript

script pause_run_timer 
	if screenelementexists \{id = the_run_timer}
		runscriptonscreenelement \{id = the_run_timer
			do_hide_run_timer
			params = {
				id = the_run_timer
			}}
	endif
	if screenelementexists id = (the_run_timer + 1)
		runscriptonscreenelement id = (the_run_timer + 1) do_hide_run_timer params = {id = (the_run_timer + 1)}
	endif
endscript

script do_hide_run_timer 
	doscreenelementmorph id = <id> alpha = 0
endscript

script show_run_timer 
	if getglobalflag flag = $NO_DISPLAY_BALANCE
		return
	endif
	getscreenelementposition id = <id>
	setscreenelementprops id = <id> tags = {tag_turned_on = 1}
	runscriptonscreenelement id = <id> do_show_run_timer params = {id = <id>}
	doscreenelementmorph id = {<id> child = 1} alpha = 0
	doscreenelementmorph id = {<id> child = 2} alpha = 0
	doscreenelementmorph id = {<id> child = 3} alpha = 0
	doscreenelementmorph id = {<id> child = 4} alpha = 0
	doscreenelementmorph id = {<id> child = 5} alpha = 0
	doscreenelementmorph id = {<id> child = 6} alpha = 0
	doscreenelementmorph id = {<id> child = 7} alpha = 0
	doscreenelementmorph id = {<id> child = 8} alpha = 0
	if (<rot_angle> > 320)
		doscreenelementmorph id = {<id> child = 1} alpha = 1
	endif
	if (<rot_angle> > 280)
		doscreenelementmorph id = {<id> child = 2} alpha = 1
	endif
	if (<rot_angle> > 240)
		doscreenelementmorph id = {<id> child = 3} alpha = 1
	endif
	if (<rot_angle> > 200)
		doscreenelementmorph id = {<id> child = 4} alpha = 1
	endif
	if (<rot_angle> > 160)
		doscreenelementmorph id = {<id> child = 5} alpha = 1
	endif
	if (<rot_angle> > 120)
		doscreenelementmorph id = {<id> child = 6} alpha = 1
	endif
	if (<rot_angle> > 80)
		doscreenelementmorph id = {<id> child = 7} alpha = 1
	endif
	if (<rot_angle> > 40)
		doscreenelementmorph id = {<id> child = 8} alpha = 1
	endif
endscript

script soft_hide_run_timer 
	setscreenelementprops id = <id> tags = {tag_turned_on = 0}
	runscriptonscreenelement id = <id> do_soft_hide_run_timer params = {id = <id>}
endscript

script do_soft_hide_run_timer 
	doscreenelementmorph id = <id> alpha = 0 time = 0.3
endscript

script unpause_run_timer 
	runscriptonscreenelement \{id = the_run_timer
		do_show_run_timer
		params = {
			id = the_run_timer
		}}
	if insplitscreengame
		runscriptonscreenelement id = (the_run_timer + 1) do_show_run_timer params = {id = (the_run_timer + 1)}
	endif
endscript

script do_show_run_timer 
	gettags
	if IntegerEquals a = <tag_turned_on> b = 1
		doscreenelementmorph id = <id> alpha = 1
	endif
endscript

script hide_run_timer_piece 
	if (320 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 1} alpha = 0
	endif
	if (280 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 2} alpha = 0
	endif
	if (240 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 3} alpha = 0
	endif
	if (200 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 4} alpha = 0
	endif
	if (160 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 5} alpha = 0
	endif
	if (120 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 6} alpha = 0
	endif
	if (80 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 7} alpha = 0
	endif
	if (40 > <rot_angle>)
		doscreenelementmorph id = {<id> child = 8} alpha = 0
	endif
endscript

script blink_run_timer 
	if getglobalflag \{flag = $NO_DISPLAY_BALANCE}
		return
	endif
	if ($inside_pause = 1)
		return
	endif
	begin
	doscreenelementmorph id = <id> alpha = 0.3 time = 0.05
	wait \{5
		gameframes}
	doscreenelementmorph id = <id> alpha = 1 time = 0.05
	wait \{5
		gameframes}
	repeat
endscript

script Create3dArrowPointer model = 'GameObjects/HUD_arrow_alpha/HUD_arrow_alpha.mdl' anglex = 42.5 pos = (320.0, 50.0) scale = 0.2 active_viewport = 0
	if objectexists id = <id>
		destroyscreenelement id = <id>
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		parent = root_window
		type = element3d
		id = <id>
		model = <model>
		pos = <pos>
		cameraz = -1
		scale = <scale>
		tilt = <tilt>
		active_viewport = <active_viewport>
		anglex = <anglex>
		nodetopointto = <node>
		objecttopointto = <name>
	}
endscript

script do_blur_effect 
	domorph \{time = 0
		blur_alpha_pair = (4.0, 0.0)
		blur_bottom_scales = (1.0, 1.0)
		blur_max_displacement = (0.0, 0.0)
		scale = (0.9, 0.9)
		scale = (1.0, 1.0)
		relative_scale}
	domorph \{time = 0.09
		blur_alpha_pair = (0.0, 0.0)
		blur_bottom_scales = (2.0, 0.0)
		scale = (1.0, 1.0)
		relative_scale}
	domorph \{time = 0.09
		blur_alpha_pair = (4.0, 0.0)
		blur_bottom_scales = (1.0, 1.0)
		scale = (1.0, 1.0)
		relative_scale}
endscript

script do_blur_effect_accept 
	domorph \{time = 0
		blur_alpha_pair = (4.0, 0.0)
		blur_bottom_scales = (1.0, 1.0)
		blur_max_displacement = (0.0, 0.0)
		scale = (0.9, 0.9)
		scale = (1.0, 1.0)
		relative_scale}
	domorph \{time = 0.07
		blur_alpha_pair = (0.0, 0.0)
		blur_bottom_scales = (3.5, 0.0)
		scale = (1.0, 1.0)
		relative_scale}
	domorph \{time = 0.07
		blur_alpha_pair = (4.0, 0.0)
		blur_bottom_scales = (1.0, 1.0)
		scale = (1.0, 1.0)
		relative_scale}
endscript

script do_blur_effect_highlight 
	domorph \{time = 0
		blur_alpha_pair = (4.0, 0.0)
		blur_bottom_scales = (1.0, 1.0)
		blur_max_displacement = (0.0, 0.0)
		scale = (0.9, 0.9)
		blur_top_alpha_mult = 8.0
		scale = (1.0, 1.0)
		relative_scale}
	domorph \{time = 0.07
		blur_alpha_pair = (0.2, 0.2)
		blur_bottom_scales = (2.6, 0.0)
		scale = (1.0, 1.0)
		relative_scale}
	domorph \{time = 0.07
		blur_alpha_pair = (4.0, 0.0)
		blur_bottom_scales = (1.0, 1.0)
		scale = (1.0, 1.0)
		relative_scale}
endscript
current_multiplier = 0

script updatemultiplier 
	if getglobalflag flag = $no_display_hud
		return
	endif
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case horse1
			case horse2
			case split_vertical
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				pos1 = (5.0, -2.0)
			else
				pos1 = (5.0, -2.0)
			endif
			case split_horizontal
			pos1 = (5.0, -2.0)
		endswitch
	else
		pos1 = (5.0, -2.0)
	endif
	<multiplier> = (<multiplier> + 0.05)
	mathfloor <multiplier>
	if NOT gotparam skater_num
		score_multiplier_container_id = score_multiplier_container
	else
		score_multiplier_container_id = (score_multiplier_container + <skater_num>)
	endif
	if (<floor> > 0)
		doscreenelementmorph id = {<score_multiplier_container_id> child = score_multiplier_x} alpha = 1.0 time = 0 pos = <pos1>
		spawnscriptnow hide_old_score params = {skater_num = <skater_num>}
	endif
endscript

script hide_old_score 
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case horse1
			case horse2
			case split_vertical
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				pos1 = (535.0, 388.0)
			else
				pos1 = (275.0, 338.0)
			endif
			case split_horizontal
			pos1 = (450.0, 188.0)
		endswitch
	else
		pos1 = (535.0, 382.0)
	endif
	if NOT gotparam skater_num
		setscreenelementprops id = the_score pos = <pos1>
	else
		setscreenelementprops id = (the_score + 1) pos = <pos1>
	endif
	doscreenelementmorph id = the_score alpha = 0 time = 1.75
endscript
current_trick_state = 0
current_trick_string_id = trick_text_1
current_trick_text = ""
current_text_block = ""
player2_current_trick_state = 0
player2_current_trick_string_id = trick_text_1
player2_current_trick_text = ""
player2_current_text_block = ""
current_trick_added = ""

script add_trick_string text = " "
	killspawnedscript name = reset_trick_string
	if screenelementexists id = ragdoll_bail_points_message
		destroyscreenelement id = ragdoll_bail_points_message
	endif
	change current_trick_added = <text>
	if getglobalflag flag = $no_display_trickstring
		return
	endif
	if NOT gotparam skater_num
		player1_panel_container :gettags
	else
		player2_panel_container :gettags
	endif
	getlowercasestring <text>
	<text> = <lowercasestring>
	setscreenelementprops id = {<trick_text_container_id> child = trick_text_1} text = <text>
	runscriptonscreenelement id = {<trick_text_container_id> child = trick_text_1} current_trick_boing
	if (<current_trick_state> = 1)
		setscreenelementprops id = <the_trick_text_id> rgba = $trick_text_color_1 shadow dont_override_encoded_rgba
	else
		setscreenelementprops id = <the_trick_text_id> rgba = [0 0 0 0] no_shadow override_encoded_rgba
	endif
	if NOT gotparam skater_num
		player1_panel_container :settags current_trick_state = 1
	else
		player2_panel_container :settags current_trick_state = 1
	endif
endscript

script update_current_trick_string 
	getlowercasestring <text>
	<text> = <lowercasestring>
	killspawnedscript name = reset_trick_string
	if getglobalflag flag = $no_display_trickstring
		return
	endif
	if NOT gotparam skater_num
		trick_text_container_id = trick_text_container
	else
		trick_text_container_id = (trick_text_container + <skater_num>)
	endif
	<text> = <lowercasestring>
	getlowercasestring <text>
	doscreenelementmorph id = {<trick_text_container_id> child = trick_text_1} alpha = 1 rgba = [240 240 240 255]
	setscreenelementprops id = {<trick_text_container_id> child = trick_text_1} text = <text>
	if NOT gotparam skater_num
		player1_panel_container :settags current_trick_state = 1
	else
		player2_panel_container :settags current_trick_state = 1
	endif
endscript

script current_trick_boing 
	domorph \{rgba = [
			240
			240
			240
			255
		]}
	domorph \{scale = 0.5
		relative_scale
		time = 0
		alpha = 0}
	domorph \{scale = 1.1
		relative_scale
		time = 0.05
		alpha = 1}
	domorph \{scale = 0.8
		relative_scale
		time = 0.05}
	domorph \{scale = 1.0
		relative_scale
		time = 0.125}
endscript

script reset_trick_string 
	if gotparam bailed
		instant = 1
	endif
	if NOT gotparam skater_num
		player1_panel_container :gettags
	else
		player2_panel_container :gettags
	endif
	if insplitscreengame
		ScriptGetScreenMode
		switch <screen_mode>
			case horse1
			case horse2
			case split_vertical
			GetGameMode
			if checksumequals a = <gamemode> b = horse
				pos1 = (535.0, 418.0)
				pos2 = (535.0, 388.0)
				pos3 = (535.0, 388.0)
				pos4 = (370.0, 25.0)
				pos5 = (370.0, 75.0)
				pos6 = (535.0, 388.0)
			else
				pos1 = (272.0, 387.0)
				pos2 = (272.0, 367.0)
				pos3 = (272.0, 367.0)
				pos4 = (243.0, -50.0)
				pos5 = (243.0, 75.0)
				pos6 = (272.0, 367.0)
			endif
			case split_horizontal
			pos1 = (448.0, 212.0)
			pos2 = (448.0, 182.0)
			pos3 = (448.0, 182.0)
			pos4 = (370.0, 25.0)
			pos5 = (370.0, 75.0)
			pos6 = (535.0, 388.0)
		endswitch
	else
		pos1 = (535.0, 418.0)
		pos2 = (535.0, 388.0)
		pos3 = (535.0, 388.0)
		pos4 = (370.0, 25.0)
		pos5 = (370.0, 75.0)
		pos6 = (535.0, 388.0)
	endif
	if NOT gotparam instant
		if NOT gotparam skater_num
			doscreenelementmorph id = {score_multiplier_container child = score_multiplier_x} alpha = 0
		else
			doscreenelementmorph id = {(score_multiplier_container + 1) child = score_multiplier_x} alpha = 0
		endif
		if NOT gotparam bailed
			if NOT getglobalflag flag = $no_display_hud
				doscreenelementmorph id = <the_score_id> alpha = 1 pos = <pos1>
			endif
			wait 1.5 second ignoreslomo
			current_trick_state = 0
		else
			current_trick_state = 0
		endif
		if (<current_trick_state> = 0)
			doscreenelementmorph id = <the_score_id> alpha = 0 pos = <pos2> time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_1} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_2} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_3} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_4} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_5} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_6} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_7} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_8} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_9} alpha = 0 time = 3
			doscreenelementmorph id = {<trick_text_container_id> child = trick_text_10} alpha = 0 time = 3
			doscreenelementmorph id = <the_score_id> alpha = 0 pos = <pos3> time = 3
			doscreenelementmorph id = <the_trick_text_id> alpha = 0
			setscreenelementprops id = <the_trick_text_id> rgba = [0 0 0 0] no_shadow
			wait 5 frame
			if NOT screenelementexists id = {<trick_text_container_id> child = trick_text_block}
				return
			else
				setscreenelementprops id = {<trick_text_container_id> child = trick_text_block} alpha = 0
			endif
		endif
	else
		current_trick_state = 0
		doscreenelementmorph id = <the_score_pot_text_id> pos = <pos4> rgba = [100 0 0 255] alpha = 1 time = 0
		doscreenelementmorph id = <the_score_pot_text_id> pos = <pos5> rgba = [100 30 0 0] alpha = 0 time = 3
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_1} alpha = 0 time = 0.3
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_2} alpha = 0 time = 0.3
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_3} alpha = 0 time = 0.2
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_4} alpha = 0 time = 0.2
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_5} alpha = 0 time = 0.1
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_6} alpha = 0 time = 0.1
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_7} alpha = 0 time = 0.05
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_8} alpha = 0 time = 0.05
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_9} alpha = 0 time = 0
		doscreenelementmorph id = {<trick_text_container_id> child = trick_text_10} alpha = 0 time = 0
		if insplitscreengame
			doscreenelementmorph id = <the_trick_text_id> scale = 0
		endif
		doscreenelementmorph id = <the_trick_text_id> alpha = 0
		setscreenelementprops id = <the_trick_text_id> rgba = [0 0 0 0] no_shadow
		wait 5 frame
		if NOT screenelementexists id = {<trick_text_container_id> child = trick_text_block}
			return
		else
			setscreenelementprops id = {<trick_text_container_id> child = trick_text_block} alpha = 0
		endif
		if screenelementexists id = <the_score_id>
			doscreenelementmorph id = <the_score_id> alpha = 0 pos = <pos6> time = 0
		endif
		if NOT gotparam skater_num
			doscreenelementmorph id = {score_multiplier_container child = score_multiplier_x} alpha = 0
		else
			if screenelementexists id = {(score_multiplier_container + 1) child = score_multiplier_x}
				doscreenelementmorph id = {(score_multiplier_container + 1) child = score_multiplier_x} alpha = 0
			endif
		endif
	endif
	if NOT gotparam skater_num
		player1_panel_container :settags current_trick_state = <current_trick_state> current_text_block = <current_text_block>
	else
		if screenelementexists id = player2_panel_container
			player2_panel_container :settags current_trick_state = <current_trick_state> current_text_block = <current_text_block>
		endif
	endif
endscript

script panel_show_score_in_goal 
	if insplitscreengame
		panel_hide_score_in_goal
	endif
	doscreenelementmorph id = score_in_goal_container alpha = 1
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			doscreenelementmorph id = {score_in_goal_container child = arcade} alpha = 1
		else
			doscreenelementmorph id = {score_in_goal_container child = normal} alpha = 1
		endif
	endif
	setscreenelementprops id = score_in_goal_container text = "0"
endscript

script panel_hide_score_in_goal 
	change_grade_status \{grade = am
		status = possible}
	change_grade_status \{grade = pro
		status = possible}
	change_grade_status \{grade = sick
		status = possible}
	doscreenelementmorph \{id = score_in_goal_container
		alpha = 0}
	doscreenelementmorph \{id = {
			score_in_goal_container
			child = normal
		}
		alpha = 0}
	doscreenelementmorph \{id = {
			score_in_goal_container
			child = arcade
		}
		alpha = 0}
endscript

script construct_score_in_goal alpha = 0.0
	if screenelementexists id = score_in_goal_container
		getscreenelementprops id = score_in_goal_container
		destroyscreenelement id = score_in_goal_container
	endif
	createscreenelement {
		id = score_in_goal_container
		type = containerelement
		parent = player1_panel_container
		scale = 0.75
		pos = (515.0, 36.0)
		just = [center top]
		alpha = <alpha>
	}
	createscreenelement {
		local_id = normal
		type = containerelement
		parent = score_in_goal_container
		just = [center top]
		alpha = <alpha>
		pos = (0.0, 15.0)
	}
	createscreenelement {
		parent = {score_in_goal_container child = normal}
		type = containerelement
		local_id = score_bg
		just = [center center]
		z_priority = 4
		alpha = 1.0
	}
	<bg_container> = <id>
	createscreenelement {
		parent = {score_in_goal_container child = normal}
		type = spriteelement
		texture = cap_whitenoise
		scale = (((0.55, 0.0) * Random (@ 0.85 @ 0.95 @ 0.9 @ -0.85 @ -0.95 @ 0.9 )) + ((0.0, 2.2) * Random (@ 0.5 @ -0.5 @ -0.6 @ 0.6 )))
		just = [center center]
		rgba = [220 220 220 220]
		z_priority = 3
		alpha = 0.5
	}
	createscreenelement {
		parent = {score_in_goal_container child = normal}
		type = spriteelement
		texture = menu_highlight
		scale = (((0.55, 0.0) * Random (@ 1 @ 1.05 @ 0.95 )) + ((0.0, 2.2) * Random (@ -1.05 @ -1 @ 1 )))
		just = [center center]
		rgba = [0 0 0 255]
		alpha = 1
		rot_angle = RandomRange (-1.5, 1.0)
		z_priority = 2
		alpha = 0.5
	}
	createscreenelement {
		parent = {score_in_goal_container child = normal}
		type = spriteelement
		texture = menu_highlight
		scale = (-0.5, 1.1)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = RandomRange (1.0, -1.0)
		alpha = 0.5
		z_priority = 1
		pos = (0.0, -15.0)
	}
	createscreenelement {
		local_id = arcade
		type = containerelement
		parent = score_in_goal_container
		pos = (0.0, 15.0)
		just = [center top]
		alpha = <alpha>
	}
	width = 140
	height = 80
	goal_arcade_menu_bg {
		parent = {score_in_goal_container child = arcade}
		local_id = bg
		width = <width>
		height = <height>
		z_priority = 1
		bg_rgba = [60 170 255 100]
	}
	goal_arcade_menu_bg {
		parent = {score_in_goal_container child = arcade}
		local_id = shadow
		width = <width>
		height = <height>
		z_priority = 0
		pos = (2.0, 2.0)
		fg_rgba = [0 0 0 255]
		nobg
	}
	createscreenelement {
		parent = score_in_goal_container
		type = textelement
		local_id = score_in_goal_title
		pos = (0.0, 0.0)
		just = [center center]
		scale = (0.6, 0.7)
		font = text_a1
		z_priority = 5
		rgba = [200 200 200 255]
		text = "score"
		font_spacing = 3
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	<score_text_element> = {
		parent = score_in_goal_container
		type = textelement
		pos = (0.0, 32.0)
		just = [center center]
		scale = 0.6
		font = text_a1
		z_priority = 5
		rgba = [200 200 200 255]
		text = "0"
		font_spacing = 3
	}
	createscreenelement {
		<score_text_element>
		id = score_in_goal_score
	}
	createscreenelement {
		<score_text_element>
		id = score_in_accumulator_tool
		alpha = 0
	}
	if insplitscreengame
		panel_hide_score_in_goal
	endif
endscript

script panel_show_arcadescore_in_goal 
	doscreenelementmorph \{id = score_in_goal_container
		alpha = 1}
	setscreenelementprops \{id = score_in_goal_container
		text = "0"}
endscript

script panel_hide_arcadescore_in_goal 
	change_grade_status \{grade = am
		status = possible}
	change_grade_status \{grade = pro
		status = possible}
	change_grade_status \{grade = sick
		status = possible}
	doscreenelementmorph \{id = score_in_goal_container
		alpha = 0}
endscript

script change_grade_status 
	return
	<possible_alpha> = 0.4
	if NOT ((gotparam grade) && (gotparam status))
		softassert "Missing param 'grade' or 'status'"
		return
	endif
	switch <grade>
		case am
		<icon> = icon_am
		<base_scale> = 0.9
		<no_icon> = icon_no_am
		killspawnedscript name = am_grade_status_pending
		case pro
		<icon> = icon_pro
		<base_scale> = 0.6
		<no_icon> = icon_no_pro
		killspawnedscript name = pro_grade_status_pending
		case sick
		<icon> = icon_sick
		<base_scale> = 0.4
		<no_icon> = icon_no_sick
		killspawnedscript name = sick_grade_status_pending
		default
		softassert "Did not recognize grade '%g'" g = <grade>
		return
	endswitch
	switch <status>
		case possible
		<icon> :domorph alpha = <possible_alpha> scale = <base_scale>
		<no_icon> :domorph alpha = 0
		case impossible
		<icon> :domorph alpha = 0
		<no_icon> :domorph alpha = 1
		case pending
		switch <grade>
			case am
			spawnscriptnow am_grade_status_pending
			case pro
			spawnscriptnow pro_grade_status_pending
			case sick
			spawnscriptnow sick_grade_status_pending
		endswitch
		case earned
		<icon> :domorph alpha = 1 scale = <base_scale>
		default
		softassert "Did not recognize status '%s'" g = <status>
		return
	endswitch
endscript

script am_grade_status_pending 
	<icon> = icon_am
	<time> = 0.05
	getscreenelementprops id = <icon>
	<icon> :domorph alpha = 1
	begin
	<icon> :domorph scale = (<scale> + 0.1) time = <time>
	<icon> :domorph scale = (<scale> + 0.2) time = <time>
	<icon> :domorph scale = (<scale> + 0.3) time = <time>
	<icon> :domorph scale = (<scale> + 0.4) time = <time>
	<icon> :domorph scale = (<scale> + 0.3) time = <time>
	<icon> :domorph scale = (<scale> + 0.2) time = <time>
	<icon> :domorph scale = (<scale> + 0.1) time = <time>
	<icon> :domorph scale = <scale> time = <time>
	repeat
endscript

script pro_grade_status_pending 
	<icon> = icon_pro
	<time> = 0.05
	getscreenelementprops id = <icon>
	<icon> :domorph alpha = 1
	begin
	<icon> :domorph scale = (<scale> + 0.1) time = <time>
	<icon> :domorph scale = (<scale> + 0.2) time = <time>
	<icon> :domorph scale = (<scale> + 0.3) time = <time>
	<icon> :domorph scale = (<scale> + 0.4) time = <time>
	<icon> :domorph scale = (<scale> + 0.3) time = <time>
	<icon> :domorph scale = (<scale> + 0.2) time = <time>
	<icon> :domorph scale = (<scale> + 0.1) time = <time>
	<icon> :domorph scale = <scale> time = <time>
	repeat
endscript

script sick_grade_status_pending 
	<icon> = icon_sick
	<time> = 0.05
	getscreenelementprops id = <icon>
	<icon> :domorph alpha = 1
	begin
	<icon> :domorph scale = (<scale> + 0.1) time = <time>
	<icon> :domorph scale = (<scale> + 0.2) time = <time>
	<icon> :domorph scale = (<scale> + 0.3) time = <time>
	<icon> :domorph scale = (<scale> + 0.4) time = <time>
	<icon> :domorph scale = (<scale> + 0.3) time = <time>
	<icon> :domorph scale = (<scale> + 0.2) time = <time>
	<icon> :domorph scale = (<scale> + 0.1) time = <time>
	<icon> :domorph scale = <scale> time = <time>
	repeat
endscript

script construct_stoken_icon 
	if screenelementexists id = stoken_container
		destroyscreenelement id = stoken_container
	endif
	createscreenelement {
		id = stoken_container
		type = containerelement
		parent = player1_panel_container
		scale = 1
		pos = (70.0, 130.0)
		just = [left top]
		alpha = 0
	}
	createscreenelement {
		parent = stoken_container
		type = spriteelement
		pos = (-40.0, 0.0)
		just = [left center]
		scale = (0.6, 1.0)
		texture = icon_cash
		z_priority = 4
	}
	createscreenelement {
		parent = stoken_container
		type = textelement
		id = stoken_num
		pos = (0.0, 0.0)
		just = [left center]
		scale = 0.5
		font = text_a1
		z_priority = 5
		rgba = [240 240 240 255]
		text = "5"
		font_spacing = 3
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
	createscreenelement {
		parent = stoken_container
		type = textelement
		id = stoken_text
		pos = (0.0, 20.0)
		just = [left center]
		scale = 0.5
		font = text_a1
		z_priority = 5
		rgba = [240 240 240 255]
		text = "stoken!"
		font_spacing = 3
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
	}
endscript

script panel_got_stoken cash = 2
	careerfunc func = AddCash params = {cash = <cash>}
	if getglobalflag flag = $no_display_hud
		<show_message> = 0
	else
		<show_message> = 1
	endif
	if gman_getactivatedgoalid
		if gman_getdata goal = <activated_goal_id> name = supress_stoken_messages
			<show_message> = 0
		endif
	endif
	if (<show_message> = 1)
		formattext textname = stoken_text "$%a" a = <cash>
		setscreenelementprops id = stoken_num text = <stoken_text>
		setscreenelementprops id = stoken_text text = "Got Cash!"
		runscriptonscreenelement id = stoken_container panel_show_stoken
	endif
endscript

script panel_lost_stoken \{num_stokens = 0}
	<show_message> = 1
	if gman_getactivatedgoalid
		gman_getdata goal = <activated_goal_id>
		if gotparam \{supress_stoken_messages}
			<show_message> = 0
		endif
	endif
	if (<show_message> = 1)
		formattext textname = stoken_text "%a" a = <num_stokens>
		setscreenelementprops id = stoken_num text = <stoken_text>
		runscriptonscreenelement \{id = stoken_container
			panel_show_lost_stoken}
	endif
endscript

script panel_show_stoken 
	domorph \{alpha = 1
		time = 0.1}
	wait \{1.5
		seconds
		ignoreslomo}
	domorph \{alpha = 0
		time = 0.1}
endscript

script panel_show_lost_stoken 
	doscreenelementmorph id = stoken_num rgba = [240 0 0 255]
	doscreenelementmorph id = stoken_text rgba = [240 0 0 255]
	domorph alpha = 1 time = 0.1
	wait 1.5 seconds ignoreslomo
	domorph alpha = 0 time = 0.1
	wait 0.1 seconds ignoreslomo
	doscreenelementmorph id = stoken_num rgba = [240 240 240 255]
	doscreenelementmorph id = stoken_text rgba = [240 240 240 255]
endscript

script construct_secret_spot_message 
endscript

script panel_found_secret_spot \{spot_name = ""}
	soundevent \{event = UI_Found_Secret_Spot_SFX}
	careerfunc \{func = getsecretspotsfound}
	formattext textname = secret_spot_text "FOUND SECRET SPOT #%f of %n: %s" s = <spot_name> f = <spots_found> n = <num_secret_spots>
	ui_display_message type = instruction_general text = <secret_spot_text> time = 5
	getlowercasestring <spot_name>
	ui_display_message type = uberalert text = <lowercasestring> color = amber
endscript

script mini_hud_anim 
	domorph \{time = 0.08
		scale = 0
		alpha = 0}
	domorph \{time = 0.120000005
		scale = 0.6
		alpha = 1}
	domorph \{time = 0.14
		scale = 0.4}
	domorph \{time = 0.16
		scale = 0.5}
endscript

script goal_grade_pending_notice 
	setscreenelementlock id = root_window off
	goal_destroy_grade_pending_notice
	switch <grade_pending>
		case am
		<land_grade> = "AM"
		case pro
		<land_grade> = "PRO"
		case sick
		<land_grade> = "SICK"
		default
		<land_grade> = "WTF?"
	endswitch
	if NOT gotparam pending_message
		<pending_message> = "Land it for:"
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_grade_notice
		just = [left top]
		pos = (100.0, 0.0)
	}
	createscreenelement {
		type = textelement
		parent = goal_grade_notice
		id = goal_grade_label
		just = [center top]
		pos = (0.0, 80.0)
		scale = 2
		text = <land_grade>
		font = text_a1
		rgba = [240 240 120 100]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		z_priority = 150
		alpha = 1
	}
	createscreenelement {
		type = textelement
		parent = goal_grade_notice
		id = goal_grade_landit
		just = [center top]
		pos = (0.0, 70.0)
		scale = 0.65000004
		text = <pending_message>
		font = text_a1
		rgba = [240 240 120 200]
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		z_priority = 155
		alpha = 1
	}
endscript

script goal_destroy_grade_pending_notice 
	if screenelementexists \{id = goal_grade_notice}
		destroyscreenelement \{id = goal_grade_notice}
	endif
endscript

script ui_get_grade_icon 
	gman_getgoaltype goal = <goal>
	if ((checksumequals a = <goal_type> b = story) || (checksumequals a = <goal_type> b = unlock) || (checksumequals a = <goal_type> b = pro_challenge))
		return \{grade_icon = Pause_Classic_Checkmark}
	endif
	switch <grade>
		case 1
		return \{grade_icon = icon_small_am}
		case 2
		return \{grade_icon = icon_small_pro}
		case 3
		return \{grade_icon = icon_small_sick}
		default
		return
	endswitch
endscript

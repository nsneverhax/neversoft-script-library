ui_text_gray = [
	120
	120
	120
	255
]

script ui_show_accolade 
	printf '-- ui_show_accolade $game_progress_debug_active=%s' s = ($game_progress_debug_active)
	if (($game_progress_debug_active = 1) || ($goal_autotest_running = 1))
		return
	endif
	root_window :settags menu_state = on
	fadetoblack on alpha = 1 time = 0.2
	wait 0.25 seconds ignoreslomo
	fadetoblack off time = 0.2 no_wait
	spawnscriptnow ui_accolade_sound
	if gotparam next_title
		<show_next> = 1
	else
		<show_next> = 0
	endif
	if (<show_next> = 1)
		formattext textname = next_acc "accomplishments:  %n" n = <next_acc>
		formattext textname = next_earn "total earnings:  %n" n = <next_earn>
	endif
	GetSkillPoints
	careerfunc func = GetCash
	careerfunc func = gettotalgoalpointsfactor
	<total_goal_points_factor> = (<total_goal_points_factor> * 100.0)
	<total_goal_points_factor> = (<total_goal_points_factor> + 0.5)
	casttointeger total_goal_points_factor
	get_strongest_lifestyle
	goal_ui_update_scheme lifestyle = <strongest_lifestyle>
	if screenelementexists id = ui_accolade_anchor
		destroyscreenelement id = ui_accolade_anchor
	endif
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	playigccam {
		name = ui_accolade_cam
		lockto = skater
		pos = (0.52590793, 1.1707361, 0.493494)
		quat = (-0.025378, -0.95625496, -0.27805302)
		fov = 72.0
		play_hold
	}
	createscreenelement {
		id = ui_accolade_anchor
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = spriteelement
		pos = (470.0, 45.0)
		dims = (700.0, 125.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		z_priority = -3
		rot_angle = 7
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = <title>
		pos = (1120.0, 160.0)
		scale = (1.57, 1.2)
		just = [right center]
		rot_angle = 7
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	if (<width> > 575)
		<scale> = ((575.0 / <width>) * (1.57, 1.2))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	runscriptonscreenelement id = ui_accolade_anchor ui_pausemenu_play_icon params = {pos = (400.0, 0.0) scale_mod = 0.5 left2}
	ui_create_messy_background {
		parent = ui_accolade_anchor
		dims = (800.0, 700.0)
		pos = (450.0, 150.0)
		z_priority = -5
		rot_angle = 0
	}
	ui_create_messy_background {
		messy_id = ui_messy_background2
		parent = ui_accolade_anchor
		dims = (400.0, 700.0)
		pos = (420.0, 150.0)
		z_priority = -5
		rot_angle = -4
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise_2
		dims = (360.0, 220.0)
		pos = (990.0, 725.0)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = -40
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise
		dims = (-300.0, 164.0)
		pos = (560.0, 700.0)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = 75
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise
		dims = (350.0, 84.0)
		pos = (670.0, 110.0)
		just = [center center]
		rgba = [240 240 240 255]
		rot_angle = 10
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise_2
		dims = (220.0, 170.0)
		pos = (1100.0, 180.0)
		just = [center center]
		rgba = [240 240 240 255]
		rot_angle = -160
		z_priority = 3
		alpha = 0.25
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "accomplishments"
		pos = (530.0, 170.0)
		scale = (1.1, 0.85)
		just = [left top]
		rgba = $ui_text_gray
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = menu_goal_underline
		dims = (-500.0, 6.0)
		pos = (530.0, 215.0)
		just = [left top]
		rgba = $ui_text_gray
		z_priority = 0
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "progress"
		pos = (530.0, 405.0)
		scale = (1.1, 0.85)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "0%"
		pos = (1080.0, 405.0)
		scale = (1.1, 0.85)
		just = [right top]
		rgba = [160 160 160 255]
	}
	<progress_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = menu_goal_underline
		dims = (500.0, 6.0)
		pos = (530.0, 460.0)
		just = [left top]
		rgba = $ui_text_gray
		z_priority = 0
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "skill points"
		pos = (600.0, 490.0)
		scale = (0.8, 0.6)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "0"
		pos = (1080.0, 490.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = [160 160 160 255]
	}
	<skill_id> = <id>
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "current cash"
		pos = (600.0, 530.0)
		scale = (0.8, 0.6)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "$0"
		pos = (1080.0, 530.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = [160 160 160 255]
	}
	<cash_id> = <id>
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "total earnings"
		pos = (600.0, 570.0)
		scale = (0.8, 0.6)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "$0"
		pos = (1080.0, 570.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = [160 160 160 255]
	}
	<career_cash_id> = <id>
	if (<show_next> = 1)
		createscreenelement {
			type = containerelement
			parent = ui_accolade_anchor
			id = ui_next_accolade_container
			pos = (0.0, 530.0)
			rot_angle = 180
		}
		createscreenelement {
			type = spriteelement
			parent = ui_next_accolade_container
			texture = white
			dims = (590.0, 400.0)
			pos = (-15.0, 0.0)
			just = [left top]
			rgba = ($goal_ui_scheme.main)
			rot_angle = -7
			z_priority = -2
		}
		createscreenelement {
			type = spriteelement
			parent = ui_next_accolade_container
			texture = menu_sideA
			dims = (-64.0, -276.0)
			pos = (550.0, -18.0)
			just = [left top]
			rgba = ($goal_ui_scheme.main)
			rot_angle = -12
			z_priority = 2
		}
		createscreenelement {
			type = spriteelement
			parent = ui_next_accolade_container
			texture = cap_blackswipe_h
			dims = (-600.0, -70.0)
			pos = (0.0, -20.0)
			just = [left top]
			rgba = ($goal_ui_scheme.main)
			rot_angle = -7
			z_priority = 2
		}
		createscreenelement {
			type = spriteelement
			parent = ui_next_accolade_container
			texture = cap_whitenoise_2
			dims = (-200.0, 200.0)
			pos = (0.0, 0.0)
			just = [left top]
			rgba = [0 0 0 255]
			rot_angle = 20
			z_priority = 2
		}
		createscreenelement {
			type = spriteelement
			parent = ui_next_accolade_container
			texture = cap_whitenoise
			dims = (300.0, 100.0)
			pos = (-5.0, -35.0)
			just = [left top]
			rgba = [240 240 240 255]
			rot_angle = -5
			z_priority = 3
		}
		createscreenelement {
			type = spriteelement
			parent = ui_next_accolade_container
			texture = cap_whitenoise
			dims = (160.0, -100.0)
			pos = (600.0, -30.0)
			just = [left top]
			rgba = [0 0 0 255]
			rot_angle = 110
			z_priority = 3
		}
		createscreenelement {
			parent = ui_next_accolade_container
			type = textelement
			font = text_a1
			text = "next up:"
			pos = (540.0, -75.0)
			scale = (1.2, 1.0)
			just = [right top]
			rgba = [200 200 200 255]
			rot_angle = -7
			z_priority = 3
			shadow
			shadow_rgba = ($goal_ui_scheme.main)
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			parent = ui_next_accolade_container
			type = textelement
			font = text_a1
			text = <next_title>
			pos = (560.0, -10.0)
			scale = (1.2, 1.0)
			just = [right top]
			rot_angle = -7
			z_priority = 3
			shadow
			shadow_rgba = ($goal_ui_scheme.main)
			shadow_offs = (2.0, 2.0)
		}
		getscreenelementdims id = <id>
		if (<width> > 440)
			<scale> = ((440.0 / <width>) * (1.2, 1.0))
			doscreenelementmorph id = <id> time = 0 scale = <scale>
		endif
		createscreenelement {
			parent = ui_next_accolade_container
			type = textelement
			font = text_a1
			text = <next_acc>
			pos = (550.0, -10.0)
			scale = (0.8, 0.6)
			just = [right top]
			rot_angle = -7
			z_priority = 3
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			parent = ui_next_accolade_container
			type = textelement
			font = text_a1
			text = <next_earn>
			pos = (550.0, 30.0)
			scale = (0.8, 0.6)
			just = [right top]
			rot_angle = -7
			z_priority = 3
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
	endif
	create_helper_text {
		parent = ui_accolade_anchor
		helper_text_elements = [
			{text = "\\m0 continue"}
		]
	}
	soundevent event = progress_sfx_start
	runscriptonscreenelement id = ui_accolade_anchor ui_show_accolade_lifestyle_progress params = {pos = (530.0, 230.0) lifestyle = career}
	runscriptonscreenelement id = ui_accolade_anchor ui_show_accolade_lifestyle_progress params = {pos = (530.0, 270.0) lifestyle = hardcore}
	runscriptonscreenelement id = ui_accolade_anchor ui_show_accolade_lifestyle_progress params = {pos = (530.0, 310.0) lifestyle = rigger}
	ui_show_accolade_lifestyle_progress {pos = (530.0, 350.0) lifestyle = generic}
	soundevent event = midgoal_rank_sfx
	ui_accolade_count_up {
		id = <progress_id>
		finish = <total_goal_points_factor>
		count_inc_lo = 2 count_inc_hi = 3
		string = "%c\\%"
	}
	ui_accolade_count_up {
		id = <skill_id>
		finish = (<skill_points>.generic)
		count_inc_lo = 10 count_inc_hi = 40
	}
	ui_accolade_count_up {
		id = <cash_id>
		finish = <cash>
		count_inc_lo = (<cash> / 25) count_inc_hi = (<cash> / 50)
		string = "$%c" usecommas
	}
	soundevent event = progress_cash_SFX
	ui_accolade_count_up {
		id = <career_cash_id>
		finish = <cash_earned>
		count_inc_lo = (<cash_earned> / 25) count_inc_hi = (<cash_earned> / 50)
		string = "$%c" usecommas
	}
	soundevent event = progress_cash_SFX
	if (<show_next> = 1)
		if screenelementexists id = ui_next_accolade_container
			doscreenelementmorph {
				id = ui_next_accolade_container
				rot_angle = -10
				time = 0.5
			}
			soundevent event = progress_sfx_end
			wait 0.6 seconds
			doscreenelementmorph {
				id = ui_next_accolade_container
				rot_angle = 0
				time = 0.05
			}
			createscreenelement {
				parent = ui_next_accolade_container
				type = textelement
				font = text_a1
				text = <next_title>
				pos = (560.0, -10.0)
				scale = (1.2, 1.0)
				just = [right top]
				rot_angle = -7
				z_priority = 4
				alpha = 1.0
			}
			getscreenelementdims id = <id>
			<scale> = (1.2, 1.0)
			if (<width> > 440)
				<scale> = ((440.0 / <width>) * (1.2, 1.0))
				doscreenelementmorph id = <id> time = 0 scale = <scale>
			endif
			doscreenelementmorph {
				id = <id>
				alpha = 0.0
				scale = (<scale> * 2.0)
				pos = {(155.0, -25.0) relative}
				time = 0.5
			}
			runscriptonscreenelement id = <id> ui_accolade_text_pulse params = {scale = <scale> pos = (560.0, -10.0)}
			wait 0.25 seconds
			createscreenelement {
				parent = ui_next_accolade_container
				type = textelement
				font = text_a1
				text = <next_acc>
				pos = (550.0, -10.0)
				scale = (0.8, 0.7)
				just = [right top]
				rot_angle = -7
				z_priority = 4
				alpha = 1.0
			}
			doscreenelementmorph {
				id = <id>
				alpha = 0.0
				scale = 2.0
				pos = {(150.0, -82.0) relative}
				time = 0.5
			}
			wait 0.25 seconds
			createscreenelement {
				parent = ui_next_accolade_container
				type = textelement
				font = text_a1
				text = <next_earn>
				pos = (550.0, 30.0)
				scale = (0.8, 0.7)
				just = [right top]
				rot_angle = -7
				z_priority = 4
				alpha = 1.0
			}
			doscreenelementmorph {
				id = <id>
				alpha = 0.0
				scale = 2.0
				pos = {(150.0, -25.0) relative}
				time = 0.5
			}
			wait 0.5 seconds
		endif
	endif
	if screenelementexists id = ui_accolade_anchor
		setscreenelementprops id = ui_accolade_anchor event_handlers = [
			{pad_choose ui_destroy_accolade}
		]
		launchevent type = focus target = ui_accolade_anchor
		block untilevent = ui_accolade_done
	endif
	if gotparam milestone_flag
		setglobalflag flag = <milestone_flag>
		careerfunc func = updateatoms
		unsetglobalflag flag = <milestone_flag>
	endif
endscript

script ui_accolade_text_pulse \{scale = (1.2, 1.0)}
	wait \{1.0
		seconds}
	domorph {
		alpha = 0.0
		pos = <pos>
		scale = <scale>
	}
	begin
	domorph \{alpha = 1.0
		rgba = [
			220
			180
			80
			255
		]
		time = 0.25}
	domorph \{alpha = 0.0
		rgba = [
			100
			100
			100
			255
		]
		time = 0.25}
	repeat
endscript

script ui_show_accolade_lifestyle_progress 
	printf '-- ui_show_accolade_lifestyle_progress'
	requireparams [lifestyle] all
	careerfunc func = getgoalpoints params = {type = <lifestyle>}
	<bar_max_w> = 290
	<bar_dims> = (0.0, 24.0)
	<lifestyle_name> = (($lifestyle_params.<lifestyle>).display_name)
	<ui_scheme> = (($lifestyle_params.<lifestyle>).ui)
	createscreenelement {
		parent = ui_accolade_anchor
		type = containerelement
		pos = <pos>
	}
	<parent> = <id>
	createscreenelement {
		parent = <parent>
		type = textelement
		font = text_a1
		text = <lifestyle_name>
		scale = (0.8, 0.6)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		parent = <parent>
		type = textelement
		font = text_a1
		text = "0"
		pos = (575.0, 2.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = (<ui_scheme>.main)
		z_priority = 100
	}
	<text_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = white
		dims = (300.0, 32.0)
		pos = (195.0, -1.0)
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = white
		dims = (300.0, 32.0)
		pos = (195.0, -1.0)
		just = [left top]
		rgba = [80 80 80 255]
		z_priority = 8
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = white
		dims = (290.0, 28.0)
		pos = (200.0, 1.0)
		just = [left top]
		rgba = [0 0 0 205]
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = vided_clip_grunge
		blend = add
		dims = (288.0, 25.0)
		pos = (202.0, 2.0)
		just = [left top]
		rgba = [90 90 90 255]
		z_priority = 10
		Random (@ flip_h @ flip_v @ )
	}
	createscreenelement {
		type = windowelement
		parent = <parent>
		dims = <bar_dims>
		pos = (200.0, 3.0)
		just = [left top]
	}
	<bar_container> = <id>
	createscreenelement {
		type = spriteelement
		parent = <bar_container>
		texture = white
		dims = (<bar_dims> + ((1.0, 0.0) * <bar_max_w>))
		pos = (0.0, 0.0)
		just = [left top]
		rgba = (<ui_scheme>.main)
		z_priority = 10
	}
	if NOT (<goal_points> = 0)
		<i> = 0.0
		begin
		if (<i> > <goal_points>)
			<i> = (<goal_points> * 1.0)
		endif
		formattext textname = goal_points_text "%g" g = <i> decimalplaces = 0
		setscreenelementprops {
			id = <text_id>
			text = <goal_points_text>
		}
		setscreenelementprops {
			id = <bar_container>
			dims = (<bar_dims> + ((1.0, 0.0) * (<bar_max_w> * (<i> / <max_goal_points>))))
		}
		if (<i> = <goal_points>)
			break
		endif
		<i> = (<i> + RandomRange (18.0, 22.0))
		wait 1 gameframes
		repeat
	endif
endscript

script ui_accolade_count_up start = 0 finish = 0 count_inc_lo = 1 count_inc_hi = 1 string = "%c" decimal_places = 0
	if NOT gotparam id
		return
	endif
	if (<finish> = 0)
		return
	endif
	<i> = <start>
	begin
	if (<i> > <finish>)
		<i> = <finish>
	endif
	if gotparam usecommas
		formattext textname = count_text <string> c = <i> decimalplaces = <decimal_places> usecommas
	else
		formattext textname = count_text <string> c = <i> decimalplaces = <decimal_places>
	endif
	if NOT screenelementexists id = <id>
		break
	endif
	setscreenelementprops {
		id = <id>
		text = <count_text>
	}
	if (<i> = <finish>)
		break
	endif
	if NOT (<count_inc_hi> = <count_inc_lo>)
		mod a = RandomRange (0.0, 32766.0) b = (<count_inc_hi> - <count_inc_lo>)
		<mod> = (<mod> + <count_inc_lo>)
		soundevent event = sk9_progress_tick
	else
		<mod> = <count_inc_lo>
	endif
	<i> = (<i> + <mod>)
	wait 1 gameframe
	repeat
endscript

script ui_accolade_sound 
	setspawninstancelimits \{max = 2
		management = ignore_spawn_request}
	soundevent \{event = medal_am_sfx}
	soundevent \{event = Crowd_Ped_AI_CheerLand_MEDIUM}
endscript

script ui_destroy_accolade 
	printf \{'-- ui_destroy_accolade'}
	skater :input_debounce \{x
		clear = 1}
	launchevent \{broadcast
		type = ui_accolade_done}
	if screenelementexists \{id = ui_accolade_anchor}
		destroyscreenelement \{id = ui_accolade_anchor}
	endif
	Destroy_MenuFx
	killskatercamanim \{name = ui_accolade_cam}
	root_window :settags \{menu_state = off}
endscript

script ui_progression_unlock_create ignore_active_goals = false show_current_episode = 0
	if (($game_progress_debug_active = 1) || ($goal_autotest_running = 1))
		return
	endif
	printf '-- ui_progression_unlock_create'
	if (<ignore_active_goals> = false)
		wait 1 gameframe
		begin
		if IsScreenClear
			break
		endif
		wait 2 gameframes
		repeat
	endif
	root_window :settags menu_state = on
	fadetoblack on alpha = 1 time = 0
	killallmovies blocking
	if gman_getactivatedgoalid
		soundevent event = SK9_New_Show_Goal_in_Classic
	endif
	if (<show_current_episode> = 1)
		if GMan_GetMostRecentlyPlayedEpisode
			formattext textname = descr_s "%a\\nOr continue with %b." a = <descr_s> b = (($global_goal_track_info.<most_recently_played_episode>).title)
		endif
	endif
	if screenelementexists id = ui_accolade_anchor
		destroyscreenelement id = ui_accolade_anchor
	endif
	hide_all_hud_sprites
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	goal_presentation_hold_skater
	playigccam {
		name = ui_accolade_cam
		lockto = skater
		pos = (0.52590793, 1.1707361, 0.493494)
		quat = (-0.025378, -0.95625496, -0.27805302)
		fov = 72.0
		play_hold
	}
	createscreenelement {
		id = ui_accolade_anchor
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = spriteelement
		pos = (20.0, 45.0)
		dims = (780.0, 155.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		z_priority = -5
		rot_angle = -7
		flip_h
	}
	ui_create_messy_background {
		messy_id = ui_accolade_messy2
		parent = ui_accolade_anchor
		dims = (820.0, 200.0)
		pos = (50.0, -20.0)
		z_priority = 0
		rot_angle = -7
	}
	if gotparam sponsor
		createscreenelement {
			type = spriteelement
			parent = ui_accolade_anchor
			pos = (900.0, 220.0)
			dims = (450.0, 250.0)
			texture = <sponsor>
		}
	endif
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		pos = (0.0, 0.0)
		dims = (300.0, 100.0)
		rgba = [0 0 0 255]
		texture = white
	}
	createscreenelement {
		type = textelement
		parent = ui_accolade_anchor
		font = text_a1
		pos = (125.0, 150.0)
		just = [left center]
		text = <title>
		scale = (1.2, 1.0)
		z_priority = 4
		rot_angle = -7
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = ($goal_ui_scheme.main)
	}
	getscreenelementdims id = <id>
	if (<width> > 700)
		<scale> = ((700.0 / <width>) * (1.2, 1.0))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	ui_create_messy_background {
		parent = ui_accolade_anchor
		dims = (800.0, 400.0)
		pos = (455.0, 460.0)
		z_priority = -5
		rot_angle = -2
	}
	runscriptonscreenelement id = ui_accolade_anchor ui_pausemenu_play_icon params = {pos = (350.0, 310.0) scale_mod = 0.75 left}
	createscreenelement {
		parent = ui_accolade_anchor
		type = spriteelement
		pos = (490.0, 385.0)
		dims = (700.0, 125.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		texture = menu_headerbar
		z_priority = -3
		rot_angle = 5
	}
	createscreenelement {
		type = textelement
		parent = ui_accolade_anchor
		font = text_a1
		pos = (1130.0, 475.0)
		just = [right center]
		text = <title_s>
		scale = (1.2, 1.0)
		z_priority = 4
		rot_angle = 5
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	getscreenelementdims id = <id>
	if (<width> > 550)
		<scale> = ((550.0 / <width>) * (1.2, 1.0))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise
		pos = (80.0, 100.0)
		just = [left center]
		dims = (720.0, 155.0)
		rgba = [240 240 240 235]
		rot_angle = -7
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise
		pos = (810.0, 580.0)
		just = [center center]
		dims = (600.0, 200.0)
		rgba = [200 200 200 180]
		rot_angle = 0
		z_priority = -1
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise
		pos = (550.0, 400.0)
		just = [left top]
		dims = (400.0, 80.0)
		rgba = [240 240 240 235]
		rot_angle = 5
		z_priority = -1
	}
	createscreenelement {
		type = textblockelement
		parent = ui_accolade_anchor
		dims = (670.0, 0.0)
		allow_expansion
		font = text_a1
		pos = (610.0, 500.0)
		just = [left top]
		internal_just = [left top]
		text = <descr_s>
		scale = (0.8, 0.6)
		rgba = $ui_text_gray
		z_priority = 4
	}
	create_helper_text {
		parent = ui_accolade_anchor
		helper_text_elements = [
			{text = "\\m0 continue"}
		]
	}
	fadetoblack off alpha = 0 time = 0.25
	setscreenelementprops id = ui_accolade_anchor event_handlers = [
		{pad_choose ui_progression_unlock_destroy}
		{pad_choose generic_menu_pad_choose_sound}
	]
	launchevent type = focus target = ui_accolade_anchor
	block untilevent = ui_accolade_done
	launchevent broadcast type = ui_accolade_fully_done
endscript

script ui_progression_unlock_destroy 
	printf \{'-- ui_progression_unlock_destroy'}
	skater :input_debounce \{x
		clear = 1}
	launchevent \{broadcast
		type = ui_accolade_done}
	if screenelementexists \{id = ui_accolade_anchor}
		destroyscreenelement \{id = ui_accolade_anchor}
	endif
	Destroy_MenuFx
	show_all_hud_sprites
	goal_presentation_unhold_skater
	killskatercamanim \{name = ui_accolade_cam}
	if gman_getactivatedgoalid
		igc_temporarily_disable_rendering \{2
			gameframe}
	endif
	root_window :settags \{menu_state = off}
endscript
choose_sponsor_helper_pos = (640.0, 714.0)

script ui_progression_choose_sponsor 
	printf '-- ui_progression_choose_sponsor'
	if (($game_progress_debug_active = 1) || ($goal_autotest_running = 1))
		return
	endif
	ui_progression_choose_sponsor_destroy
	hide_all_hud_sprites
	root_window :settags menu_state = on
	load_sponsor_logos_pak
	goal_presentation_pause
	fadetoblack off time = 0.2 no_wait
	make_cas_menu {
		menu_id = ui_accolade_anchor
		title = "choose sponsor"
		pausemenu
	}
	createscreenelement {
		id = ui_sponsor_background
		parent = ui_accolade_anchor
		type = spriteelement
		just = [top left]
		pos = (764.0, 240.0)
		dims = (308.0, 200.0)
		alpha = 0.5
		z_priority = -10
	}
	<best_lifestyle> = career
	<best_lifestyle_factor> = 0.0
	<sponsor_lifestyles> = [career hardcore rigger]
	<i> = 0
	begin
	careerfunc func = getgoalpoints params = {type = (<sponsor_lifestyles> [<i>])}
	if (<goal_points_factor> > <best_lifestyle_factor>)
		<best_lifestyle> = (<sponsor_lifestyles> [<i>])
		<best_lifestyle_factor> = <goal_points_factor>
	endif
	<i> = (<i> + 1)
	repeat 3
	<valid_sponsors> = {<best_lifestyle>}
	<min_spread_factor> = 0.03
	<min_lifestyle_factor> = (<best_lifestyle_factor> - <min_spread_factor>)
	<i> = 0
	begin
	careerfunc func = getgoalpoints params = {type = (<sponsor_lifestyles> [<i>])}
	if (<goal_points_factor> >= <min_lifestyle_factor>)
		<valid_sponsors> = {<valid_sponsors> (<sponsor_lifestyles> [<i>])}
	endif
	<i> = (<i> + 1)
	repeat 3
	if structurecontains structure = <valid_sponsors> career
		add_cas_menu_item {
			text = "career"
			pad_choose_script = ui_progression_choose_sponsor_destroy
			pad_choose_params = {product = <select>}
			additional_focus_script = ui_progression_choose_sponsor_focus_lifestyle
			additional_focus_params = {lifestyle = career product = <select>}
		}
	endif
	if structurecontains structure = <valid_sponsors> hardcore
		add_cas_menu_item {
			text = "hardcore"
			pad_choose_script = ui_progression_choose_sponsor_destroy
			pad_choose_params = {product = <select>}
			additional_focus_script = ui_progression_choose_sponsor_focus_lifestyle
			additional_focus_params = {lifestyle = hardcore product = <select>}
		}
	endif
	if structurecontains structure = <valid_sponsors> rigger
		add_cas_menu_item {
			text = "rigger"
			pad_choose_script = ui_progression_choose_sponsor_destroy
			pad_choose_params = {product = <select>}
			additional_focus_script = ui_progression_choose_sponsor_focus_lifestyle
			additional_focus_params = {lifestyle = rigger product = <select>}
		}
	endif
	cas_menu_finish
	ui_accolade_anchor :settags select_sponsor_type = <select>
	createscreenelement {
		parent = ui_accolade_anchor
		type = spriteelement
		pos = (0.0, 0.0)
		texture = white
		just = [left top]
		dims = (1280.0, 720.0)
		z_priority = -15
		rgba = ($goal_ui_scheme.main)
	}
	create_helper_text {
		parent = ui_accolade_anchor
		helper_pos = $choose_sponsor_helper_pos
		helper_text_elements = [
			{text = "\\b4\\b7 select"}
			{text = "\\b6\\b5 scroll"}
			{text = "\\m8 play movie"}
			{text = "\\m0 accept"}
		]
	}
	block untilevent = ui_accolade_done
endscript

script ui_progression_choose_sponsor_focus_lifestyle 
	if screenelementexists id = sponsor_hmenu
		destroyscreenelement id = sponsor_hmenu
	endif
	createscreenelement {
		id = sponsor_hmenu
		parent = ui_accolade_anchor
		type = hmenu
		pos = (280.0, 340.0)
		spacing_between = 100
		just = [left center]
		internal_just = [center center]
		z_priority = -8
		alpha = 0.0
	}
	foreachin {$skate9_sponsors
		do = ui_progression_choose_sponsor_add_item
		pass_index
		params = {
			desired_lifestyle = <lifestyle>
			desired_product = <product>
			focus = {not_focusable}
		}
	}
	foreachin {$skate9_sponsors
		do = ui_progression_choose_sponsor_add_item
		pass_index
		params = {
			desired_lifestyle = <lifestyle>
			desired_product = <product>
		}
	}
	foreachin {$skate9_sponsors
		do = ui_progression_choose_sponsor_add_item
		pass_index
		params = {
			desired_lifestyle = <lifestyle>
			desired_product = <product>
			focus = {not_focusable}
		}
	}
	setscreenelementlock id = sponsor_hmenu on
	setscreenelementlock id = sponsor_hmenu off
	wait 2 gameframes
	launchevent type = focus target = sponsor_hmenu
	setscreenelementprops id = sponsor_hmenu alpha = 1.0
endscript

script ui_progression_choose_sponsor_add_item aspect = 1.0 focus = {}
	if NOT (<desired_lifestyle> = <lifestyle>)
		return
	endif
	if NOT checksumequals a = <desired_product> b = ($sponsor_product_types.<product>)
		return
	endif
	createscreenelement {
		type = spriteelement
		parent = sponsor_hmenu
		pos = (0.0, 0.0)
		texture = <texture>
		dims = (150.0, 75.0)
		just = [center center]
		internal_just = [center center]
		z_priority = -8
		<focus>
		event_handlers = [
			{focus ui_progression_choose_sponsor_focus_sponsor params = {movie = <movie> new_sponsor = <foreachin_name>}}
			{unfocus ui_progression_choose_sponsor_unfocus_sponsor}
			{pad_space ui_progression_choose_sponsor_movie params = {movie = <movie>}}
		]
	}
endscript

script ui_progression_choose_sponsor_focus_sponsor 
	ui_accolade_anchor :getsingletag select_sponsor_type
	printf '-- ui_progression_choose_sponsor_focus_sponsor: %t - %s' t = <select_sponsor_type> s = <new_sponsor>
	if gotparam movie
		create_helper_text {
			parent = ui_accolade_anchor
			helper_pos = $choose_sponsor_helper_pos
			helper_text_elements = [
				{text = "\\b4\\b7 select"}
				{text = "\\b6\\b5 scroll"}
				{text = "\\m8 play movie"}
				{text = "\\m0 accept"}
			]
		}
	else
		create_helper_text {
			parent = ui_accolade_anchor
			helper_pos = $choose_sponsor_helper_pos
			helper_text_elements = [
				{text = "\\b4\\b7 select"}
				{text = "\\b6\\b5 scroll"}
				{text = "\\m0 accept"}
			]
		}
	endif
	careerfunc func = setsponsor params = {sponsor = <new_sponsor> type = <select_sponsor_type>}
	generic_scroll_sound
	obj_getid
	getscreenelementposition id = <objid> absolute
	<item_pos> = <screenelementpos>
	getscreenelementposition id = sponsor_hmenu absolute
	<menu_pos> = <screenelementpos>
	<new_x> = ((<menu_pos> [0]) - (<item_pos> [0]))
	<move> = ((<new_x> * (1.0, 0.0)) + (843.0, 340.0))
	doscreenelementmorph id = sponsor_hmenu pos = <move>
	setprops z_priority = 10
	domorph scale = 2.0 alpha = 1.0 time = 0.1 relative_scale
endscript

script ui_progression_choose_sponsor_unfocus_sponsor 
	setprops \{z_priority = -4}
	domorph \{scale = 1.0
		alpha = 1.0
		time = 0.0
		relative_scale}
endscript

script ui_progression_choose_sponsor_movie 
	if NOT gotparam movie
		return
	endif
	ui_accolade_anchor :setprops hide
	launchevent type = unfocus target = ui_accolade_anchor
	launchevent type = unfocus target = sponsor_hmenu
	if screenelementexists id = goal_generic_video_wait_anchor
		destroyscreenelement id = goal_generic_video_wait_anchor
	endif
	goal_presentation_disable_music
	playmovie {
		movie = <movie>
		textureslot = 0
		texturepri = -100
		no_looping
		nowait
		no_hold
	}
	spawnscriptnow goal_generic_video_pad_handler
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat
	if screenelementexists id = goal_generic_video_wait_anchor
		destroyscreenelement id = goal_generic_video_wait_anchor
	endif
	goal_presentation_restore_music
	ui_accolade_anchor :setprops unhide
	if NOT gotparam no_restore_focus
		launchevent type = focus target = ui_accolade_anchor
		launchevent type = focus target = sponsor_hmenu
	endif
endscript

script ui_progression_choose_sponsor_destroy 
	printf '-- ui_progression_choose_sponsor_destroy'
	skater :input_debounce x clear = 1
	fadetoblack on alpha = 1 time = 0 z_priority = -200
	if gotparam product
		careerfunc func = getsponsor params = {type = <product>}
		if structurecontains structure = <sponsor_info> movie
			ui_progression_choose_sponsor_movie movie = (<sponsor_info>.movie) no_restore_focus
		endif
	endif
	killskatercamanim name = ui_pausemenu_cam
	if screenelementexists id = ui_accolade_anchor
		destroyscreenelement id = ui_accolade_anchor
	endif
	unload_sponsor_logos_pak
	launchevent broadcast type = ui_accolade_done
	fadetoblack off time = 0.25 no_wait
	root_window :settags menu_state = off
	show_all_hud_sprites
	goal_presentation_unpause
endscript

script load_sponsor_logos_pak 
	loadpak \{'pak/sponsor_logos/sponsor_logos.pak'
		heap = scratch}
endscript

script unload_sponsor_logos_pak 
	printf \{'Unloading Pak pak/sponsor_logos/sponsor_logos.pak'}
	unloadpak \{'pak/sponsor_logos/sponsor_logos.pak'}
	waitunloadpak
endscript

script ui_progression_AwardSponsorItems cas_type = Clothing_Accessories
	careerfunc func = getsponsor params = {type = <cas_type>}
	careerfunc func = BuyCasItem params = {item = (<sponsor_info>.cas_desc)}
	ui_career_rewards {
		rewards = {
			cas_parts = [
				{
					part = (<sponsor_info>.cas_type)
					desc_id = (<sponsor_info>.cas_desc)
					name = (<sponsor_info>.cas_name)
					flag = (<sponsor_info>.cas_flag)
					apply_it = 1
				}
			]
			title = "goal rewards"
		}
	}
endscript

script ui_progression_AwardSponsorItems_destroy 
endscript

script ui_progression_AwardSignatureSponsorItems cas_type = deck
	careerfunc func = getsponsor params = {type = <cas_type>}
	careerfunc func = BuyCasItem params = {item = (<sponsor_info>.cas_desc_sig)}
	ui_career_rewards {
		rewards = {
			cas_parts = [
				{
					part = (<sponsor_info>.cas_type_sig)
					desc_id = (<sponsor_info>.cas_desc_sig)
					name = (<sponsor_info>.cas_name_sig)
					flag = (<sponsor_info>.cas_flag_sig)
					apply_it = 1
				}
			]
			title = "goal rewards"
		}
	}
endscript

script ui_progression_AwardSignatureSponsorItems_destroy 
endscript

script test_progression_badges 
	printf '----------------------------------------------------'
	printf '-- test_progression_badges'
	printf '-- Story'
	careerfunc func = getmilestoneinfo
	printf 'Current Milestone: %s' s = <current_milestone>
	getarraysize $skate9_milestones
	if (<array_size> > 0)
		<i> = 0
		begin
		<milestone_name> = ($skate9_milestones [<i>])
		<milestone_struct> = (<milestone_info>.(<milestone_name>))
		extendcrc <milestone_name> '_effects' out = milestone_effects
		printf 'Milestone: %s' s = <milestone_name>
		printstruct <milestone_struct>
		printstruct ($<milestone_effects>)
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	printf '-- Career'
	GMan_GetCompletionInfo lifestyle = career
	printf 'Career Am: %s\\%' s = <am_percentage>
	printf 'Career Pro: %s\\%' s = <pro_percentage>
	printf 'Career Sick: %s\\%' s = <sick_percentage>
	if gman_haswongoal goal = m_cu
		printf 'Career Uber: Won'
		gman_getgrade goal = m_cu
		printf 'Career Uber Grade: %s' s = <grade>
	else
		printf 'Career Uber: Not won'
	endif
	printf '-- Hardcore'
	GMan_GetCompletionInfo lifestyle = hardcore
	printf 'Hardcore Am: %s\\%' s = <am_percentage>
	printf 'Hardcore Pro: %s\\%' s = <pro_percentage>
	printf 'Hardcore Sick: %s\\%' s = <sick_percentage>
	if gman_haswongoal goal = m_hu
		printf 'Hardcore Uber: Won'
		gman_getgrade goal = m_hu
		printf 'Hardcore Uber Grade: %s' s = <grade>
	else
		printf 'Hardcore Uber: Not won'
	endif
	printf '-- Rigger'
	GMan_GetCompletionInfo lifestyle = rigger
	printf 'Rigger Am: %s\\%' s = <am_percentage>
	printf 'Rigger Pro: %s\\%' s = <pro_percentage>
	printf 'Rigger Sick: %s\\%' s = <sick_percentage>
	if gman_haswongoal goal = m_ru
		printf 'Rigger Uber: Won'
		gman_getgrade goal = m_ru
		printf 'Rigger Uber Grade: %s' s = <grade>
	else
		printf 'Rigger Uber: Not won'
	endif
	printf '-- Photo'
	GMan_GetCompletionInfo type = photo
	printf 'Photo Am: %s\\%' s = <am_percentage>
	printf 'Photo Pro: %s\\%' s = <pro_percentage>
	printf 'Photo Sick: %s\\%' s = <sick_percentage>
	printf '-- Film'
	GMan_GetCompletionInfo type = film
	printf 'Film Am: %s\\%' s = <am_percentage>
	printf 'Film Pro: %s\\%' s = <pro_percentage>
	printf 'Film Sick: %s\\%' s = <sick_percentage>
	printf '-- Your Room'
	if SkillTree_LearnedAllWithTrait trait = crib
		printf 'Bling: Has All Crib Items'
	else
		printf 'Bling: Does not have all crib items'
	endif
	printf '-- All Upgrades'
	if SkillTree_LearnedAllWithTrait trait = career_upgrade
		printf 'Career: All Upgrades'
	else
		printf 'Career: Does not have all upgrades'
	endif
	if SkillTree_LearnedAllWithTrait trait = hardcore_upgrade
		printf 'Hardcore: All Upgrades'
	else
		printf 'Hardcore: Does not have all upgrades'
	endif
	if SkillTree_LearnedAllWithTrait trait = rigger_upgrade
		printf 'Rigger: All Upgrades'
	else
		printf 'Rigger: Does not have all upgrades'
	endif
	printf '-- Editor Challenge'
	printf '-- Cash Spots'
	careerfunc func = getsecretspotsfound
	printf 'Num spots: %s' s = <num_secret_spots>
	printf 'Spots found: %s' s = <secret_spots_found>
	printf '----------------------------------------------------'
endscript

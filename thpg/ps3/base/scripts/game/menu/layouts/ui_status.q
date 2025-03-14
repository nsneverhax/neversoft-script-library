
script ui_create_view_status 
	printf "UI: ui_create_view_status"
	ui_status_view
	make_cas_menu {
		title = "my skater"
		pausemenu
		ProgressBar
		icon
		back_state = uistate_pausemenu
	}
	add_cas_menu_item {
		text = "Game Progress"
		choose_state = UIstate_progress
	}
	add_cas_menu_item {
		text = "Skills - Stats"
		choose_state = UIstate_stats
	}
	param = {}
	if NOT Pager_GetMessageCount
		param = {not_focusable}
	endif
	add_cas_menu_item {
		text = "phone messages"
		id = videophone_menu_item
		choose_state = UIstate_videophone
		<param>
	}
	if gamemodeequals is_career
		if NOT gman_hasactivegoals
			ui_pausemenu_add_cas_menu_item
		endif
	endif
	if gamemodeequals is_career
		if NOT IsInCrib
			ui_pausemenu_add_skatepad_menu_item
		endif
	endif
	PhotoFunc get_count
	<focus> = {}
	if (<count> = 0)
		focus = {not_focusable}
	endif
	add_cas_menu_item {
		text = "photo album"
		pad_choose_script = ui_attempt_opening_photo_album
		<focus>
	}
	add_cas_menu_item {
		text = "LEADERBOARDS"
		choose_state = uistate_leaderboard
	}
	add_cas_menu_item {
		text = "TRICK CONTROLS"
		choose_state = UIstate_view_tricks
	}
	cas_menu_finish
endscript

script ui_destroy_view_status 
	printf \{"UI: ui_destroy_view_status"}
	if screenelementexists \{id = ui_accolade_anchor}
		destroyscreenelement \{id = ui_accolade_anchor}
	endif
	generic_ui_destroy
endscript

script ui_attempt_opening_photo_album 
	generic_ui_destroy
	if screenelementexists \{id = ui_accolade_anchor}
		destroyscreenelement \{id = ui_accolade_anchor}
	endif
	if game_progress_check_valid_save \{fix_start_key}
		ui_change_state \{state = UIstate_Photo_Viewer}
	else
		ui_create_view_status
	endif
endscript

script ui_status_view parent = root_window update_scheme = true
	printf "-- ui_status_view"
	GetSkillPoints
	careerfunc func = GetCash
	careerfunc func = gettotalgoalpointsfactor
	<total_goal_points_factor> = (<total_goal_points_factor> * 100.0)
	<total_goal_points_factor> = (<total_goal_points_factor> + 0.5)
	careerfunc func = getgoalpoints params = {type = generic}
	<gg> = <goal_points>
	careerfunc func = getgoalpoints params = {type = career}
	<cg> = <goal_points>
	careerfunc func = getgoalpoints params = {type = hardcore}
	<hg> = <goal_points>
	careerfunc func = getgoalpoints params = {type = rigger}
	<rg> = <goal_points>
	<tg> = (<gg> + <cg> + <hg> + <rg>)
	if ((<tg> > 1584) && (<tg> < 1600))
		<total_goal_points_factor> = 99
	endif
	casttointeger total_goal_points_factor
	formattext textname = total_progress "%c\\%" c = <total_goal_points_factor> decimalplaces = 0
	formattext textname = skill_points_text "%c" c = (<skill_points>.generic) decimalplaces = 0
	formattext textname = current_cash "$%c" c = <cash> decimalplaces = 0 usecommas
	formattext textname = career_cash "$%c" c = <cash_earned> decimalplaces = 0 usecommas
	get_strongest_lifestyle
	if checksumequals a = <update_scheme> b = true
		goal_ui_update_scheme lifestyle = <strongest_lifestyle>
	endif
	createscreenelement {
		id = ui_accolade_anchor
		type = containerelement
		parent = <parent>
		scale = (0.91999996, 0.91999996)
		pos = (140.0, -10.0)
	}
	<dark_gray> = [80 80 80 255]
	ui_create_messy_background {
		parent = ui_accolade_anchor
		dims = (1500.0, 920.0)
		pos = (250.0, 0.0)
		rgba = [200 200 200 255]
		z_priority = -5
		rot_angle = -4
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise_2
		dims = (300.0, 180.0)
		pos = (990.0, 750.0)
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
		pos = (500.0, 700.0)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = 75
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise_2
		dims = (300.0, 184.0)
		pos = (970.0, 50.0)
		just = [center center]
		rgba = [0 0 0 255]
		rot_angle = 10
		z_priority = 0
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise_2
		dims = (120.0, 70.0)
		pos = (1150.0, 180.0)
		just = [center center]
		rgba = [0 0 0 255]
		rot_angle = -160
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = cap_whitenoise
		dims = (380.0, 154.0)
		pos = (1170.0, 400.0)
		just = [center center]
		rgba = [0 0 0 255]
		rot_angle = 100
		z_priority = 0
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "accomplishments"
		pos = (530.0, 170.0)
		scale = (1.1, 0.85)
		just = [left top]
		rgba = <dark_gray>
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = menu_goal_underline
		dims = (-600.0, 8.0)
		pos = (510.0, 215.0)
		just = [left top]
		rgba = <dark_gray>
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
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = <total_progress>
		pos = (1080.0, 405.0)
		scale = (1.1, 0.85)
		just = [right top]
		rgba = <dark_gray>
	}
	createscreenelement {
		type = spriteelement
		parent = ui_accolade_anchor
		texture = menu_goal_underline
		dims = (630.0, 8.0)
		pos = (510.0, 460.0)
		just = [left top]
		rgba = <dark_gray>
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
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = <skill_points_text>
		pos = (1080.0, 490.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "current cash"
		pos = (600.0, 530.0)
		scale = (0.8, 0.6)
		just = [left top]
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = <current_cash>
		pos = (1080.0, 530.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = "total earnings"
		pos = (600.0, 570.0)
		scale = (0.8, 0.6)
		just = [left top]
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = ui_accolade_anchor
		type = textelement
		font = text_a1
		text = <career_cash>
		pos = (1080.0, 570.0)
		scale = (0.8, 0.6)
		just = [right top]
		rgba = <dark_gray>
	}
	ui_status_lifestyle_progress {pos = (530.0, 230.0) lifestyle = career}
	ui_status_lifestyle_progress {pos = (530.0, 270.0) lifestyle = hardcore}
	ui_status_lifestyle_progress {pos = (530.0, 310.0) lifestyle = rigger}
	ui_status_lifestyle_progress {pos = (530.0, 350.0) lifestyle = generic}
	if ((<skill_points>.generic) >= $skill_default_1st_upgrade_cost)
		createscreenelement {
			parent = ui_accolade_anchor
			type = textblockelement
			font = text_a1
			text = "You have enough\\nskill points to upgrade!"
			pos = (1060.0, 625.0)
			scale = (0.8, 0.6)
			dims = (500.0, 0.0)
			just = [right top]
			rgba = <dark_gray>
			allow_expansion
		}
	endif
endscript

script ui_status_lifestyle_progress 
	printf "-- ui_show_accolade_lifestyle_progress"
	requireparams [lifestyle] all
	careerfunc func = getgoalpoints params = {type = <lifestyle>}
	<bar_max_w> = 265
	<goal_points> = (<goal_points> * 1.0)
	<bar_dims> = (0.0, 24.0)
	<bar_dims> = (<bar_dims> + ((1.0, 0.0) * (<bar_max_w> * (<goal_points> / <max_goal_points>))))
	<lifestyle_name> = (($lifestyle_params.<lifestyle>).display_name)
	<ui_scheme> = (($lifestyle_params.<lifestyle>).ui)
	formattext textname = goal_points_text "%g" g = <goal_points> decimalplaces = 0
	createscreenelement {
		parent = ui_accolade_anchor
		type = containerelement
		pos = <pos>
	}
	<parent> = <id>
	<dark_gray> = [80 80 80 255]
	createscreenelement {
		parent = <parent>
		type = textelement
		font = text_a1
		text = <lifestyle_name>
		scale = (0.8, 0.6)
		just = [left top]
		rgba = <dark_gray>
	}
	createscreenelement {
		parent = <parent>
		type = textelement
		font = text_a1
		text = <goal_points_text>
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
		rgba = [50 50 50 205]
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
endscript

script ui_pausemenu_add_cas_menu_item 
	params = {pad_choose_script = ui_goto_cas_dialog}
	add_cas_menu_item {
		text = "create-a-skater"
		<params>
	}
endscript

script ui_goto_cas_dialog 
	create_dialog_box {
		title = "Create-A-Skater"
		text = "Are you sure you want to edit your skater?"
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_pausemenu_quit_dialog_cancel
		buttons = [
			{font = text_a1 text = "Yes" pad_choose_script = ui_goto_cas_from_gameplay}
			{font = text_a1 text = "No" pad_choose_script = dialog_box_exit}
		]
		no_helper_text
	}
endscript

script ui_goto_cas_from_gameplay 
	spawnscriptnow \{ui_goto_cas_from_gameplay_spawned}
endscript

script ui_goto_cas_from_gameplay_spawned 
	ui_destroy_pausemenu
	ui_destroy_view_status
	do_autosave \{immediate
		suspend_ui}
	get_current_zone_as_checksum
	if checksumequals a = <current_zone> b = z_crib
		change \{bedroom_select_skater = came_from_crib}
	else
		change \{bedroom_select_skater = came_from_career_game}
	endif
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
	spawnscriptnow \{noqbid
		change_level
		params = {
			level = load_z_bedroom
		}}
endscript

script ui_pausemenu_add_skatepad_menu_item 
	params = {pad_choose_script = ui_goto_crib_dialog}
	if NOT (getglobalflag flag = $CAREER_TRAINING_DONE)
		params = {<params> not_focusable}
	endif
	add_cas_menu_item {
		text = "skate lounge"
		<params>
	}
endscript

script ui_goto_crib_dialog 
	create_dialog_box {
		title = "Skate Lounge"
		text = "Are you sure you want to go to the Skate Lounge?"
		pos = (320.0, 240.0)
		just = [center center]
		pad_back_script = ui_pausemenu_quit_dialog_cancel
		buttons = [
			{font = text_a1 text = "Yes" pad_choose_script = ui_goto_crib_from_gameplay}
			{font = text_a1 text = "No" pad_choose_script = dialog_box_exit}
		]
		no_helper_text
	}
endscript

script ui_goto_crib_from_gameplay 
	ui_destroy_pausemenu
	ui_destroy_view_status
	spawnscriptnow \{Z_Slum_Crib_Enter}
endscript

script Z_Slum_Crib_Enter 
	pausegame
	do_autosave \{immediate
		suspend_ui}
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
	spawnscriptnow \{noqbid
		change_level
		params = {
			level = load_z_crib
		}}
endscript

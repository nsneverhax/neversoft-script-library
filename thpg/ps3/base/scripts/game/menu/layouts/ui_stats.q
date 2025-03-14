ui_stats_array = [
	{
		name = "GRIND"
		type = Grind
		desc = "This controls how well you balance when grinding."
		unit = "ft."
	}
	{
		name = "AIR"
		type = air
		desc = "This controls how high you can get when you do aerial tricks with vert ramps and ollies."
		unit = "s"
	}
	{
		name = "MANUAL"
		type = Manual
		desc = "This controls how well you balance on two wheels when doing wheelies/manuals."
		unit = "ft."
	}
	{
		name = "INVERT"
		type = lip
		desc = "This controls how well you balance while doing handplant tricks."
		unit = "s"
	}
	{
		name = "SPIN"
		type = spin
		desc = "This improves how well you spin, both in the air and during Natas spins on poles, fire hydrants, etc.."
		unit = "rot."
	}
	{
		name = "WALLRIDE"
		type = wallride
		desc = "This increases the distance you can ride across the surface of walls."
		unit = "ft."
	}
]
stat_index = -1
stat_column = 0
stat_id = nullscript

script ui_create_stats 
	printf \{"UI: ui_create_stats"}
	if gotparam \{from_gameplay}
		<back_state> = uistate_gameplay
	elseif infrontend
		<back_state> = UIstate_mainprogress
	else
		<back_state> = UIstate_view_status
	endif
	ui_create_stats2 back_state = <back_state>
endscript

script ui_create_stats1 
	soundevent event = UI_statscreenchange_sfx
	make_cas_menu {
		pos = (200.0, 125.0)
		back_state = <back_state>
		rot_angle = 0.0
		title_pos = (70.0, 70.0)
		title_bg_pos = (60.0, 34.0)
		no_mask
		no_highlight_bar
		color_scheme = $stat_color_scheme
	}
	add_cas_menu_item {
		id = core_stats
		text = "core stats"
		scale = (0.5, 0.5)
		text_offset = (-80.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.4, 0.35000002)
		not_focusable
	}
	ui_create_stats_misc back = <back_state>
	getarraysize $ui_stats_array
	<i> = 0
	begin
	ui_add_stats_element ($ui_stats_array [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	cas_menu_finish helper_text = {
		helper_text_elements = [{text = "\\m1 return"}
			{text = "\\bk select"}
		]
	}
endscript

script ui_create_stats2 
	soundevent event = UI_statscreenchange_sfx
	SkillTree_GetSkillList trait = menu
	make_cas_menu {
		pos = (200.0, 70.0)
		back_state = <back_state>
		rot_angle = 0.0
		title_pos = (70.0, 70.0)
		title_bg_pos = (60.0, 34.0)
		no_mask
		no_highlight_bar
		padding_scale = 0.6
		selection_height = 20
	}
	change stat_index = -1
	change stat_column = 0
	ui_create_stats_misc back = <back_state> skills
	add_cas_menu_item {
		text = "career"
		scale = (0.5, 0.48000002)
		text_offset = (-120.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.5, 0.48000002)
		not_focusable
	}
	<i> = 0
	begin
	ui_add_stats_element2 index = <i> class = career
	<i> = (<i> + 3)
	repeat 3
	add_cas_menu_item {
		text = "hardcore"
		scale = (0.5, 0.48000002)
		text_offset = (-120.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.5, 0.48000002)
		not_focusable
	}
	begin
	ui_add_stats_element2 index = <i> class = hardcore
	<i> = (<i> + 3)
	repeat 3
	add_cas_menu_item {
		text = "rigger"
		scale = (0.5, 0.48000002)
		text_offset = (-120.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.5, 0.48000002)
		not_focusable
	}
	begin
	ui_add_stats_element2 index = <i> class = rigger
	<i> = (<i> + 3)
	repeat 3
	cas_menu_finish helper_text = {
		helper_text_elements = [{text = "\\m1 return"}
			{text = "\\m0 upgrade skill"}
			{text = "\\bk select"}
		]
	}
endscript

script ui_create_stats_from_reward_screen 
	if screenelementexists id = stats_reward_anchor
		destroyscreenelement id = stats_reward_anchor
	endif
	SkillTree_GetSkillList trait = menu
	make_cas_menu {
		parent = goal_container
		menu_id = stats_reward_anchor
		pos = (485.0, 40.0)
		rot_angle = 0.0
		title_pos = (70.0, 70.0)
		title_bg_pos = (60.0, 34.0)
		no_mask
		no_highlight_bar
		padding_scale = 0.6
		keep_current
		selection_height = 20
	}
	add_cas_menu_item {
		text = "career"
		scale = (0.5, 0.48000002)
		text_offset = (-120.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.5, 0.48000002)
		not_focusable
		no_bg_bar
	}
	<i> = 0
	begin
	ui_add_stats_element2 index = <i> class = career
	<i> = (<i> + 3)
	repeat 3
	add_cas_menu_item {
		text = "hardcore"
		scale = (0.5, 0.48000002)
		text_offset = (-120.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.5, 0.48000002)
		not_focusable
		no_bg_bar
	}
	begin
	ui_add_stats_element2 index = <i> class = hardcore
	<i> = (<i> + 3)
	repeat 3
	add_cas_menu_item {
		text = "rigger"
		scale = (0.5, 0.48000002)
		text_offset = (-120.0, -1.0)
		not_focusable
		just = [left top]
		cas_heading
	}
	add_cas_menu_item {
		text = ""
		text_offset = (0.0, -1.0)
		scale = (0.5, 0.48000002)
		not_focusable
		no_bg_bar
	}
	begin
	ui_add_stats_element2 index = <i> class = rigger
	<i> = (<i> + 3)
	repeat 3
endscript

script ui_create_stats_misc 
	if screenelementexists id = stat_container
		destroyscreenelement id = stat_container
	endif
	createscreenelement {
		type = containerelement
		id = stat_container
		pos = (600.0, 0.0)
		parent = main_menu_anchor
	}
	ui_create_messy_background {messy_id = ui_messy_background
		parent = stat_container
		pos = (-65.0, -25.0)
		dims = (900.0, 750.0)
		rot_angle = -7
		z_priority = 2
		rgba = [200 200 200 255]
	}
	createscreenelement {
		type = spriteelement
		parent = stat_container
		texture = cap_whitenoise
		just = [center center]
		pos = (-450.0, 5.0)
		dims = (400.0, -145.0)
		rgba = [240 240 240 255]
		rot_angle = Random (@ 160 @ -20 )
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = stat_container
		texture = cap_whitenoise_2
		just = [center center]
		pos = (630.0, 615.0)
		dims = (-170.0, -185.0)
		rgba = [0 0 0 255]
		Random (@ flip_h @ flip_v @ )
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = stat_container
		texture = cap_whitenoise_2
		just = [center center]
		pos = (460.0, 0.0)
		dims = (300.0, 105.0)
		rgba = [0 0 0 255]
		Random (@ flip_h @ flip_v @ )
		rot_angle = 5
		z_priority = 13
	}
	createscreenelement {
		type = spriteelement
		parent = stat_container
		texture = menu_sideB
		just = [center center]
		pos = (-550.0, 670.0)
		dims = (160.0, 505.0)
		rgba = [200 200 200 255]
		Random (@ flip_h @ )
		rot_angle = -70
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = stat_container
		id = black_bg
		texture = black
		dims = (1280.0, 740.0)
		z_priority = -10
		pos = (-500.0, 350.0)
	}
	createscreenelement {
		type = containerelement
		parent = stat_container
		id = stat_control_container
		pos = (50.0, 600.0)
		z_priority = 19
	}
	createscreenelement {
		type = spriteelement
		parent = stat_control_container
		id = stat_control
		texture = menu_headerbar
		just = [right center]
		pos = (750.0, 15.0)
		dims = (-870.0, -85.0)
		rgba = [0 0 0 100]
		z_priority = 9
	}
	createscreenelement {
		type = textelement
		parent = stat_control_container
		id = stat_control_text
		text = "view class skills"
		just = [center center]
		font = text_a1
		scale = (0.85, 0.6)
		pos = (250.0, 10.0)
		rgba = [60 60 60 255]
		z_priority = 10
	}
	getscreenelementdims id = stat_control_text
	createscreenelement {
		type = textelement
		parent = stat_control_container
		id = stat_control_button
		text = "\\ma"
		font = text_a1
		scale = (0.9, 0.75)
		pos = (((1.0, 0.0) * (250 + (<width> / 2) + 40)) + (0.0, 10.0))
		just = [center center]
	}
	if gotparam skills
		setscreenelementprops {
			id = stat_control_text
			text = "view core stats"
		}
		getscreenelementdims id = stat_control_text
		setscreenelementprops {
			id = stat_control_button
			text = "\\mb"
			pos = (((1.0, 0.0) * (250 + (<width> / 2) + 40)) + (0.0, 10.0))
		}
		setscreenelementprops {
			id = main_menu
			event_handlers = [
				{pad_r1 ui_create_stats1 params = {back_state = <back>}}
				{pad_left stat_change_column params = {add = -1}}
				{pad_right stat_change_column params = {add = 1}}
			]
		}
		GetSkillPoints
		formattext textname = points "points available: %a" a = (<skill_points>.generic)
		createscreenelement {
			type = textelement
			id = point_text
			parent = stat_control_container
			font = text_a1
			text = <points>
			scale = (0.95, 0.7)
			rgba = ($goal_ui_scheme.main)
			pos = (-263.0, 10.0)
		}
	else
		setscreenelementprops {
			id = stat_container
			event_handlers = [
				{pad_l1 ui_create_stats2 params = {back_state = <back>}}
			]
		}
	endif
	launchevent type = focus target = stat_container
endscript

script ui_destroy_stats 
	printf \{"UI: ui_destroy_stats"}
	generic_ui_destroy
endscript

script ui_destroy_stats_from_gameplay 
	ui_destroy_stats
	do_actual_unpause
endscript

script ui_add_stats_element 
	skater :getstatinfo ability = <type>
	<progress> = (<curr_stat_level> / 10.0)
	formattext textname = stats_text "%a" a = <name>
	add_cas_menu_item {
		id = <type>
		text = <stats_text>
		additional_focus_script = ui_stats_focus
		additional_focus_params = {
			<...>
			id = <type>
		}
		additional_unfocus_script = ui_stats_unfocus
		additional_unfocus_params = {id = <type>}
		just = [right center]
		text_case = upper
		scale = (0.4, 0.35000002)
		text_offset = (-60.0, -1.0)
	}
	doscreenelementmorph {
		id = <type>
		pos = {(100.0, 0.0) relative}
	}
	bar_dims = (150.0, 16.0)
	pos = (-55.0, -12.0)
	createscreenelement {
		type = spriteelement
		parent = <type>
		texture = white
		dims = <bar_dims>
		pos = <pos>
		just = [left top]
		rgba = [160 160 160 255]
	}
	createscreenelement {
		type = spriteelement
		parent = <type>
		texture = white
		dims = <bar_dims>
		pos = <pos>
		just = [left top]
		rgba = [80 80 80 255]
		z_priority = 8
	}
	createscreenelement {
		type = spriteelement
		parent = <type>
		texture = white
		dims = (<bar_dims> - (10.0, 4.0))
		pos = (<pos> + (5.0, 2.0))
		just = [left top]
		rgba = [0 0 0 205]
		z_priority = 9
	}
	createscreenelement {
		type = spriteelement
		parent = <type>
		texture = vided_clip_grunge
		blend = add
		dims = (<bar_dims> - (12.0, 7.0))
		pos = (<pos> + (7.0, 3.0))
		just = [left top]
		rgba = [90 90 90 255]
		z_priority = 10
		Random (@ flip_h @ flip_v @ )
	}
	createscreenelement {
		type = windowelement
		parent = <type>
		dims = (((0.0, 1.0) * (<bar_dims> [1])) + ((1.9, 0.0) * ((<bar_dims> [0]) * <progress>)))
		pos = (<pos> + (5.0, 4.0))
		just = [left top]
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = white
		dims = <bar_dims>
		pos = (0.0, 0.0)
		just = [left top]
		rgba = ($goal_ui_scheme.main)
		z_priority = 10
	}
endscript

script ui_add_stats_element2 
	if (<class> = hardcore)
		<rgba> = ($goal_hardcore_ui_scheme.main)
	elseif (<class> = rigger)
		<rgba> = ($goal_rigger_ui_scheme.main)
	else
		<rgba> = ($goal_career_ui_scheme.main)
	endif
	SkillTree_GetSkillList trait = menu
	SkillTree_GetSkillInfo skill = (<skill_list> [<index>])
	<parent> = (<skill_info>.id)
	<name> = (<skill_info>.name)
	if NOT SkillTree_IsSkillLearned skill = (<skill_list> [<index>])
		add_cas_menu_item {
			id = <parent>
			text = <name>
			text_offset = (0.0, -1.0)
			rgba = [90 90 90 255]
			just = [right center]
			text_case = upper
			scale = 0.4
			additional_focus_script = ui_stats_focus2
			additional_focus_params = {
				index = <index>
			}
			additional_unfocus_script = ui_stats_unfocus2
			additional_unfocus_params = {
				index = <index>
			}
			no_bg_bar
		}
	else
		add_cas_menu_item {
			id = <parent>
			text = <name>
			text_offset = (0.0, -1.0)
			rgba = [90 90 90 255]
			additional_focus_script = ui_stats_focus2
			additional_focus_params = {
				index = <index>
			}
			additional_unfocus_script = ui_stats_unfocus2
			additional_unfocus_params = {
				index = <index>
			}
			pad_choose_script = ui_stats_add_level
			pad_choose_params = {
				index = <index>
				rgba = <rgba>
			}
			just = [right center]
			text_case = upper
			scale = 0.4
			no_bg_bar
		}
	endif
	<i> = 0
	begin
	SkillTree_GetSkillInfo skill = (<skill_list> [(<index> + <i>)])
	<local_id> = (<skill_info>.id)
	createscreenelement {
		type = containerelement
		parent = <parent>
		local_id = <local_id>
		pos = ((16.0, -4.0) + (20.0, 0.0) * <i>)
		scale = (0.9, 1.2)
	}
	removeparameter learned
	if SkillTree_IsSkillLearned skill = (<skill_list> [(<index> + <i>)])
		addparams learned
	endif
	if NOT gotparam learned
		if NOT SkillTree_IsSkillPurchasable skill = (<skill_list> [(<index> + <i>)]) ignore_cost
			<rgba> = [64 64 64 255]
		endif
		if (<i> = 0)
			<rgba> = [64 64 64 255]
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = {<parent> child = <local_id>}
		texture = stat_circle
		pos = (0.0, 0.0)
		just = [center center]
		z_priority = 16
		rgba = <rgba>
	}
	if gotparam learned
		createscreenelement {
			type = spriteelement
			parent = {<parent> child = <local_id>}
			texture = stat_check
			pos = (2.0, -1.0)
			just = [center center]
			z_priority = 17
			rgba = [0 0 0 255]
		}
	endif
	<i> = (<i> + 1)
	repeat 3
endscript

script ui_stats_focus 
	setspawninstancelimits max = 1 management = kill_oldest
	if screenelementexists id = stat_select
		getscreenelementposition id = stat_select absolute
		<stat_pos> = <screenelementpos>
	endif
	if screenelementexists id = stat_focus_container
		destroyscreenelement id = stat_focus_container
	endif
	setscreenelementprops {
		id = {<id> child = text}
		rgba = [0 0 0 255]
	}
	<passed_id> = <id>
	createscreenelement {
		type = containerelement
		id = stat_focus_container
		parent = stat_container
		pos = (280.0, 100.0)
	}
	if NOT screenelementexists id = stat_select
		createscreenelement {
			type = spriteelement
			parent = stat_focus_container
			id = stat_select
			texture = white
			rgba = ($goal_ui_scheme.main)
			dims = (1400.0, 35.0)
			just = [left center]
			pos = (-100.0, -100.0)
			z_priority = 3
		}
		if NOT gotparam stat_pos
			wait 3 gameframes
		endif
	endif
	getscreenelementposition id = {<passed_id> child = text} absolute
	<select_pos> = ((-1150.0, -100.0) + ((0.0, 1.0) * (<screenelementpos> [1])))
	if screenelementexists id = stat_select
		doscreenelementmorph {
			id = stat_select
			pos = <select_pos>
		}
	endif
	createscreenelement {
		type = textelement
		parent = stat_focus_container
		font = text_a1
		text = <name>
		rgba = [0 0 0 255]
		scale = (0.85, 0.65000004)
		pos = (0.0, 0.0)
		just = [center center]
	}
	formattext textname = level "level %a" a = <curr_stat_level> decimalplaces = 0
	createscreenelement {
		type = textelement
		parent = stat_focus_container
		font = text_a1
		text = <level>
		rgba = ($goal_ui_scheme.main)
		scale = (1.0, 0.83)
		pos = (0.0, 40.0)
		just = [center center]
	}
	createscreenelement {
		type = spriteelement
		parent = stat_focus_container
		texture = white
		rgba = [140 140 140 255]
		dims = (200.0, 8.0)
		pos = (-100.0, 70.0)
		just = [left center]
		z_priority = 10
	}
	if (<prev_stat_target_value> > <curr_stat_value>)
		<prev_stat_target_value> = 0.0
	endif
	<have> = (<curr_stat_value> - <prev_stat_target_value>)
	<need> = (<next_stat_target_value> - <prev_stat_target_value>)
	if (<value_needed_for_next_level> = -1.0)
		<progress> = 1.0
	else
		<progress> = (<have> / <need>)
		if (<progress> > 1.0)
			<progress> = 1.0
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = stat_focus_container
		texture = black
		dims = (((200.0, 0.0) * <progress>) + (0.0, 8.0))
		pos = (-100.0, 70.0)
		just = [left center]
		z_priority = 11
	}
	if NOT (<next_stat_target_value> < 0.0)
		<next_level> = "NEXT LEVEL:"
		formattext textname = level "%a %b" a = <next_stat_target_value> b = <unit> decimalplaces = 0
	else
		next_level = "STAT MAXED"
		level = ""
	endif
	createscreenelement {
		type = textelement
		parent = stat_focus_container
		font = text_a1
		text = <next_level>
		rgba = [0 0 0 255]
		scale = (0.7, 0.5)
		pos = (0.0, 100.0)
		just = [center center]
	}
	createscreenelement {
		type = textelement
		parent = stat_focus_container
		font = text_a1
		text = <level>
		rgba = ($goal_ui_scheme.main)
		scale = (1.1, 0.9)
		pos = (0.0, 140.0)
		just = [center center]
	}
	createscreenelement {
		type = textblockelement
		parent = stat_focus_container
		font = text_a1
		text = <desc>
		rgba = [0 0 0 255]
		scale = (0.8, 0.6)
		pos = (0.0, 170.0)
		just = [center top]
		dims = (500.0, 450.0)
	}
endscript

script ui_stats_focus2 
	setspawninstancelimits max = 1 management = kill_oldest
	if NOT screenelementexists id = stat_container
		return
	endif
	if gotparam index
		change stat_index = <index>
		change stat_id = <id>
	else
		<id> = $stat_id
	endif
	<i> = 0
	begin
	SkillTree_GetSkillList trait = menu
	SkillTree_GetSkillInfo skill = (<skill_list> [($stat_index + <i>)])
	<local_id> = (<skill_info>.id)
	doscreenelementmorph {
		id = {<id> child = <local_id>}
		scale = (0.9, 1.2)
		time = 0.2
	}
	<i> = (<i> + 1)
	repeat 3
	SkillTree_GetSkillList trait = menu
	SkillTree_GetSkillInfo skill = (<skill_list> [($stat_index + $stat_column)])
	setscreenelementprops {
		id = {<id> child = text}
		rgba = [0 0 0 255]
	}
	<local_id> = (<skill_info>.id)
	doscreenelementmorph {
		id = {<id> child = <local_id>}
		scale = ((0.9, 1.2) * 1.5)
		time = 0.2
	}
	setscreenelementprops {
		id = {<id> child = <local_id>}
		z_priority = 18
	}
	<passed_id> = <id>
	if NOT screenelementexists id = stat_select
		createscreenelement {
			type = spriteelement
			parent = stat_container
			id = stat_select
			texture = white
			rgba = ($goal_ui_scheme.main)
			dims = (1400.0, 35.0)
			just = [left center]
			pos = (-100.0, -100.0)
		}
		wait 3 gameframes
	endif
	getscreenelementposition id = {<passed_id> child = text} absolute
	<select_pos> = (((1.0, 0.0) * -700) + ((0.0, 1.0) * (<screenelementpos> [1])))
	if screenelementexists id = stat_select
		doscreenelementmorph {
			id = stat_select
			pos = <select_pos>
		}
	endif
	if screenelementexists id = stat_focus_container
		destroyscreenelement id = stat_focus_container
	endif
	SkillTree_GetSkillList trait = menu
	SkillTree_GetSkillInfo skill = (<skill_list> [($stat_index)])
	<name> = (<skill_info>.name)
	createscreenelement {
		type = containerelement
		id = stat_focus_container
		parent = stat_container
		pos = (280.0, 100.0)
	}
	createscreenelement {
		type = textelement
		parent = stat_focus_container
		font = text_a1
		text = <name>
		rgba = [0 0 0 255]
		scale = (0.9, 0.7)
		pos = (0.0, 0.0)
		just = [center center]
	}
	SkillTree_GetSkillInfo skill = (<skill_list> [($stat_index + $stat_column)])
	createscreenelement {
		type = textelement
		parent = stat_focus_container
		font = text_a1
		text = (<skill_info>.name)
		rgba = ($goal_ui_scheme.main)
		scale = (1.1, 0.9)
		pos = (0.0, 40.0)
		just = [center center]
	}
	createscreenelement {
		type = textblockelement
		parent = stat_focus_container
		font = text_a1
		text = (<skill_info>.description)
		rgba = [0 0 0 255]
		scale = (0.8, 0.6)
		pos = (0.0, 170.0)
		just = [center top]
		dims = (500.0, 450.0)
	}
	if NOT SkillTree_IsSkillLearned skill = (<skill_list> [($stat_index + $stat_column)])
		createscreenelement {
			type = textelement
			parent = stat_focus_container
			font = text_a1
			text = "COST:"
			rgba = [0 0 0 255]
			scale = (0.7, 0.5)
			pos = (0.0, 100.0)
			just = [center center]
		}
		SkillTree_GetSkillList trait = menu
		if SkillTree_IsSkillPurchasable skill = (<skill_list> [($stat_index + $stat_column)]) ignore_cost
			if ($stat_column = 1)
				<cost> = $skill_default_1st_upgrade_cost
			elseif ($stat_column = 2)
				<cost> = $skill_default_2nd_upgrade_cost
			endif
			if gotparam cost
				formattext textname = level "%a points" a = <cost>
			else
				<level> = "locked"
			endif
		else
			<level> = "locked"
		endif
		createscreenelement {
			type = textelement
			parent = stat_focus_container
			font = text_a1
			text = <level>
			rgba = ($goal_ui_scheme.main)
			scale = (1.1, 0.9)
			pos = (0.0, 140.0)
			just = [center center]
		}
	else
		createscreenelement {
			type = textelement
			parent = stat_focus_container
			font = text_a1
			text = "UNLOCKED"
			rgba = [0 0 0 255]
			scale = (0.7, 0.5)
			pos = (0.0, 100.0)
			just = [center center]
		}
	endif
endscript

script ui_stats_unfocus 
endscript

script ui_stats_unfocus2 
	<i> = 0
	begin
	SkillTree_GetSkillList trait = menu
	SkillTree_GetSkillInfo skill = (<skill_list> [(<index> + <i>)])
	<local_id> = (<skill_info>.id)
	doscreenelementmorph {
		id = {<id> child = <local_id>}
		scale = (0.9, 1.2)
		time = 0.2
	}
	setscreenelementprops {
		id = {<id> child = <local_id>}
		z_priority = 17
	}
	<i> = (<i> + 1)
	repeat 3
endscript

script ui_stats_add_level 
	SkillTree_GetSkillList trait = menu
	if SkillTree_IsSkillPurchasable skill = (<skill_list> [($stat_index + $stat_column)])
		create_dialog_box {
			title = "Are You Sure?"
			text = "Buying a skill can not be undone."
			pos = (320.0, 240.0)
			just = [center center]
			pad_back_script = ui_stats_close_dialog
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = ui_stats_purchase_skill pad_choose_params = {<...>}}
				{font = text_a1 text = "CANCEL" pad_choose_script = ui_stats_close_dialog}
			]
			no_helper_text
		}
	elseif SkillTree_IsSkillPurchasable skill = (<skill_list> [($stat_index + $stat_column)]) ignore_cost
		soundevent event = NotEnough_sfx
		create_dialog_box {
			title = "Not Enough!?"
			text = "You don't have enough points to buy this skill."
			pos = (320.0, 240.0)
			just = [center center]
			pad_back_script = ui_stats_close_dialog
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = ui_stats_close_dialog}
			]
			no_helper_text
		}
	endif
endscript

script ui_stats_close_dialog 
	dialog_box_exit
	launchevent \{type = focus
		target = stat_container}
endscript

script ui_stats_purchase_skill 
	ui_stats_close_dialog
	soundevent event = special_sound_in_otherm_modes
	SkillTree_PurchaseSkill skill = (<skill_list> [($stat_index + $stat_column)])
	game_progression_check_for_all_upgrades_achievement
	SkillTree_GetSkillInfo skill = (<skill_list> [$stat_index])
	<main_skill> = (<skill_info>.id)
	SkillTree_GetSkillInfo skill = (<skill_list> [($stat_index + $stat_column)])
	<local_id> = (<skill_info>.id)
	GetSkillPoints
	formattext textname = points "points available: %a" a = (<skill_points>.generic)
	setscreenelementprops {
		id = point_text
		text = <points>
	}
	<id> = $stat_id
	createscreenelement {
		type = spriteelement
		parent = {<id> child = <local_id>}
		texture = stat_check
		pos = (0.0, 0.0)
		just = [center center]
		z_priority = 17
		rgba = [0 0 0 255]
	}
	ui_stats_focus2
	ui_stats_close_dialog
	launchevent type = focus target = stat_container
endscript

script stat_change_column \{add = 0}
	change stat_column = ($stat_column + <add>)
	soundevent \{event = VE_category_toggle}
	if ($stat_column < 0)
		change \{stat_column = 2}
	endif
	if ($stat_column > 2)
		change \{stat_column = 0}
	endif
	ui_stats_focus2
endscript

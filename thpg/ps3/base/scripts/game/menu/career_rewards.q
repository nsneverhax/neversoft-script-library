goal_cas_award_applied_pieces = 0
goal_cas_award_tex_swap_parts = [
]
goal_rewards_show_rigger_piece = 1
goal_rigger_reward_hack = {
	rig_pieces_kicker = {
		model = 'Props\\RK_Small_Kicker\\RK_Small_Kicker.mdl'
		scale = 0.5
		offset = (0.0, 0.8, 0.0)
	}
	rig_pieces_curved_rails = {
		model = 'Props\\RK_UTurn_Rail\\RK_UTurn_Rail.mdl'
		scale = 0.3
		offset = (0.0, 0.9, 0.0)
	}
	rig_pieces_qps_and_rails = {
		model = 'Props\\RK_Small_QP\\RK_Small_QP.mdl'
		scale = 0.4
		offset = (0.0, 0.6, 0.0)
		cam_pos = (1.0, 1.0, 1.0)
	}
	rig_pieces_spine_and_platform = {
		model = 'Props\\RK_Spine\\RK_Spine.mdl'
		scale = 0.4
		offset = (0.0, 0.7, 0.0)
	}
	rig_pieces_large = {
		model = 'Props\\RK_Large_Kicker\\RK_Large_Kicker.mdl'
		scale = 0.4
		offset = (0.0, 0.8, 0.0)
	}
	rig_pieces_boost = {
		model = 'Props\\RK_Boost_Kicker\\RK_Boost_Kicker.mdl'
		scale = 0.5
		offset = (0.0, 0.8, 0.0)
	}
}
mini_cas_camera_positions = {
	hi = {
		lookatpos = (0.0, 1.5, 0.0)
		pos = (0.0, 1.3, 1.3)
		CAS_Brand_Neck
		CAS_Bowl_Neck
		cas_eyes
		CAS_Hat_Logo
		CAS_Glasses
		cas_hat
		cas_facial_hair
		CAS_Hat_Sec
		CAS_Head
		cas_hair
		cas_hat_hair
		CAS_Scalp
	}
	mid = {
		lookatpos = (0.0, 1.1, 0.0)
		pos = (0.0, 1.0, 1.5)
		cas_board
		CAS_GRIPTAPE
		CAS_DECK_GRAPHIC
		CAS_WHEEL
		CAS_Trucks
		CAS_Tattoo_Arm_R
		CAS_Tattoo_Arm_L
		cas_belt
		CAS_Bowl_Arm_R
		CAS_Bowl_Arm_L
		CAS_Brand_Arm_R
		CAS_Brand_Arm_L
		cas_pro_body
		cas_body
		cas_torso
		CAS_Hands
		CAS_Bare_Torso
		CAS_Accessory01
		CAS_Accessory02
		CAS_Accessory03
		CAS_Buckle
		CAS_Torso_Sec
		CAS_Front_Logo
		CAS_Back_Logo
	}
	low = {
		lookatpos = (0.0, 0.5, 0.0)
		pos = (0.0, 1.0, 1.5)
		cas_shoes
		CAS_Shoes_Sec
		cas_legs
		CAS_Lower_Legs
		cas_socks
	}
}

script ui_career_rewards title = "rewards" give_rewards = false
	requireparams [rewards] all
	printf 'career_display_rewards'
	<retry_goal> = 0
	if gotparam goal
		if gman_canretrylastgoal
			gman_getlastretryablegoalid
			if checksumequals a = <goal> b = <last_retryable_goal_id>
				if gman_getconstant goal = <last_retryable_goal_id> name = disable_goal_rewards_retry_option
					<retry_goal> = 0
				else
					<retry_goal> = 1
				endif
			endif
		endif
	endif
	if (<retry_goal> = 1)
		<rewards> = {<rewards> show_retry_goal}
	endif
	fadetoblack on alpha = 1 time = 0
	<standard_text_params> = {
		scale = (1.1, 0.85)
	}
	<light_gray_color> = [128 128 128 255]
	<temp_parent> = 0
	if NOT screenelementexists id = goal_container
		<temp_parent> = 1
		ui_career_rewards_standalone_setup rewards = <rewards> give_rewards = true
	endif
	MakeSkaterGoto switch_ongroundai params = {newscript = Walking_onGroundAi}
	soundevent event = reward_screen_sfx
	setscreenelementprops id = goal_container event_handlers = [
		{focus goal_success_refocus_pad_handler}
	]
	createscreenelement {
		id = goal_rewards_menu
		parent = goal_container
		type = vmenu
		pos = (140.0, 220.0)
		just = [left top]
		scale = (0.8, 0.75)
		internal_just = [left top]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement {
		parent = goal_container
		type = spriteelement
		texture = white
		pos = (500.0, 0.0)
		dims = (800.0, 720.0)
		rgba = [32 32 32 255]
		just = [left top]
		z_priority = -10
	}
	<reward_screen_items> = [
		{ids = [cas_parts]
			focus = goal_display_focus_cas
			label = "new gear"
		}
		{ids = [crib_piece]
			focus = goal_display_focus_bling
			label = "new skate lounge item"
		}
		{ids = [special]
			focus = goal_display_focus_special
			label = "new special trick"
		}
		{ids = [rigger_piece skill]
			focus = goal_display_focus_skill
			label = "new skills"
		}
		{ids = [skill_points]
			focus = goal_display_focus_skill_points
			label = "skill points"
		}
		{ids = [show_ve_tutorial]
			focus = goal_display_focus_ve_tutorial
			label = "video editor tutorial"
		}
		{ids = [show_retry_goal]
			focus = goal_display_focus_retry_goal
			choose = goal_display_success_messages_retry
			label = "retry goal"
		}
		{ids = []
			focus = goal_display_focus_continue
			choose = goal_display_success_messages_continue
			label = "continue"
		}
	]
	foreachin <reward_screen_items> do = goal_display_add_menu_item params = {goal_rewards = <rewards> goal = <goal>}
	createscreenelement {
		type = spriteelement
		parent = goal_container
		texture = white
		dims = (10000.0, 10000.0)
		rgba = [200 200 200 255]
		z_priority = -9.5
	}
	goal_display_success_bg {
		title = <title>
		goal = <goal>
		parent = goal_container
		continue = 0
		retry = 0
		helper = 0
		width = 690
		pos_offset = (0.0, 50.0)
		noicon
	}
	fadetoblack off time = 0.5
	launchevent type = focus target = goal_success_pad_handler
	launchevent type = focus target = goal_rewards_menu
	block untilevent = goal_display_success_messages_done
	if (<temp_parent> = 1)
		fadetoblack on alpha = 1 time = 0
		ui_career_rewards_standalone_shutdown
	endif
endscript

script ui_career_rewards_standalone_setup \{give_rewards = false}
	goal_presentation_hold_skater
	createscreenelement \{type = containerelement
		parent = root_window
		id = goal_container
		tags = {
			standalone_career_rewards
		}}
	root_window :settags \{menu_state = on}
	assignalias \{id = goal_container
		alias = current_menu_anchor}
	hide_all_hud_items
	if checksumequals a = <give_rewards> b = true
		requireparams \{[
				rewards
			]
			all}
		careerfunc func = giverewards params = {rewards = <rewards>}
	endif
endscript

script ui_career_rewards_standalone_shutdown 
	destroyscreenelement \{id = goal_container}
	show_all_hud_items
	goal_presentation_unhold_skater
	if ($milestone_screens_active = 0)
		fadetoblack \{off
			time = 0.25}
	endif
	root_window :settags \{menu_state = off}
endscript

script goal_reward_focus 
	gettags
	if gotparam focus
		doscreenelementmorph id = {<id> child = text} rgba = ($goal_ui_scheme.main)
		doscreenelementmorph id = {<id> child = bg} alpha = 1.0
		goal_viewport_kill all
	else
		goal_reward_kill_rigger_object
		doscreenelementmorph id = {<id> child = text} rgba = [128 128 128 255]
		doscreenelementmorph id = {<id> child = bg} alpha = 0.0
		if screenelementexists id = goal_reward_descrip
			destroyscreenelement id = goal_reward_descrip
		endif
		if screenelementexists id = goal_view_goal_anchor
			destroyscreenelement id = goal_view_goal_anchor
		endif
		if screenelementexists id = ui_accolade_anchor
			destroyscreenelement id = ui_accolade_anchor
		endif
		if screenelementexists id = career_reward_movie
			destroyscreenelement id = career_reward_movie
		endif
		if screenelementexists id = stats_reward_anchor
			destroyscreenelement id = stats_reward_anchor
		endif
	endif
endscript

script goal_display_add_menu_item choose = nullscript
	<has_reward> = false
	getarraysize <ids>
	if (<array_size> > 0)
		<i> = 0
		begin
		if structurecontains structure = <goal_rewards> (<ids> [<i>])
			<has_reward> = true
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	else
		<has_reward> = true
	endif
	if checksumequals a = <has_reward> b = false
		return
	endif
	if (<array_size> > 0)
		if checksumequals a = (<ids> [0]) b = show_retry_goal
			if NOT getglobalflag flag = $CAREER_TRAINING_DONE
				return
			endif
		endif
	endif
	<light_gray_color> = [128 128 128 255]
	createscreenelement {
		type = containerelement
		parent = goal_rewards_menu
		dims = (0.0, 50.0)
		child_anchor = [left center]
		event_handlers = [
			{focus goal_reward_focus params = {focus}}
			{focus <focus> params = {goal = <goal> goal_rewards = <goal_rewards>}}
			{unfocus goal_reward_focus params = {unfocus}}
			{pad_choose <choose> params = {goal = <goal> goal_rewards = <goal_rewards>}}
		]
	}
	<container_id> = <id>
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = text
		text = <label>
		just = [left center]
		font = text_a1
		rgba = [128 128 128 255]
		z_priority = 100
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		local_id = bg
		just = [left center]
		texture = menu_highlight
		rgba = [200 200 200 255]
		alpha = 0.0
		pos = (-20.0, 0.0)
		scale = (2.0, 1.8)
		z_priority = 99
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
endscript

script goal_display_reward_generic_focus descrip_pos = (0.0, 0.0) descrip_dims = (660.0, 0.0)
	requireparams [descrip] all
	if screenelementexists id = goal_reward_options_text
		destroyscreenelement id = goal_reward_options_text
	endif
	if screenelementexists id = goal_reward_descrip
		destroyscreenelement id = goal_reward_descrip
	endif
	createscreenelement {
		id = goal_reward_descrip
		parent = goal_container
		type = containerelement
		pos = (650.0, 100.0)
		just = [left top]
		internal_just = [left top]
	}
	createscreenelement {
		parent = goal_reward_descrip
		type = textblockelement
		font = text_a1
		text = <descrip>
		just = [left top]
		dims = <descrip_dims>
		allow_expansion
		scale = (0.75, 0.75)
		pos = <descrip_pos>
		internal_just = [left top]
		rgba = [0 0 0 255]
	}
	if gotparam options
		createscreenelement {
			id = goal_reward_options_text
			type = containerelement
			parent = goal_container
			event_handlers = <options_handlers>
		}
		create_helper_text {
			anchor_id = goal_reward_options_helper
			parent = goal_container
			helper_text_elements = <options>
		}
		launchevent type = focus target = goal_reward_options_text
	else
		create_helper_text {
			anchor_id = goal_reward_options_helper
			parent = goal_container
			helper_text_elements = []
		}
	endif
endscript
goal_needs_atom_update_in_gameplay = 0

script goal_display_reward_exit warn = false
	requireparams [callback] all
	if (<warn> = true)
		launchevent type = unfocus target = goal_success_pad_handler
		launchevent type = unfocus target = goal_reward_options_text
		launchevent type = unfocus target = goal_container
		requireparams [zone] all
		formattext textname = text "You are about to go to %z, do you wish to continue?" z = <zone>
		create_snazzy_dialog_box {
			title = "warning"
			text = <text>
			no_helper_text
			buttons = [
				{text = "continue" pad_choose_script = goal_display_reward_exit pad_choose_params = {warn = false callback = <callback> callback_params = <callback_params>}}
				{text = "cancel" pad_choose_script = goal_display_reward_exit_dimiss}
			]
		}
		launchevent type = focus target = dialog_box_vmenu
	else
		change view_goal_info_exiting = 1
		if gamemodeequals is_career
			careerfunc func = enableatomupdate params = {enable = false}
			change goal_needs_atom_update_in_gameplay = 1
		endif
		goal_presentation_unhold_skater
		goal_display_success_messages_continue
		wait 1 gameframe
		spawnscriptlater <callback> params = <callback_params>
		wait 2 gameframes
		change view_goal_info_exiting = 0
	endif
endscript

script goal_display_reward_exit_dimiss 
	destroy_dialog_box
	launchevent \{type = focus
		target = goal_success_pad_handler}
	launchevent \{type = focus
		target = goal_rewards_menu}
	launchevent \{type = focus
		target = goal_reward_options_text}
	launchevent \{type = focus
		target = goal_container}
	if screenelementexists \{id = stats_reward_anchor}
		launchevent \{type = unfocus
			target = stats_reward_anchor}
	endif
endscript

script goal_display_focus_ve_tutorial 
	if game_progress_has_valid_save
		<tip_text> = "Tip: Volcom is always looking for new local skater footage... Submit yours today!"
	else
		<tip_text> = ""
	endif
	formattext {
		textname = descript
		"\\c9\\nLearn how to use the %cVIDEO\\_EDITOR\\c9 through a series of instructional videos.\\nUse the Video Editor at anytime to get sick footage!\\n\\n%t"
		c = ($goal_ui_scheme.text_color)
		t = <tip_text>
	}
	if getglobalflag flag = $CAREER_TRAINING_DONE
		<options_text> = [{text = "\\m5 VIDEO EDITOR TUTORIALS"}]
		<options_handlers> = [
			{pad_option
				goal_display_reward_exit
				params = {
					callback = goal_display_success_messages_goto_movies
					callback_params = {movie_type = ve_tutorial}
					zone = "Video Editor Tutorials"
					warn = true
				}
			}
		]
	endif
	goal_display_reward_generic_focus {
		descrip = <descript>
		options = <options_text>
		options_handlers = <options_handlers>
	}
endscript

script goal_display_reward_goto_stats 
	do_actual_pause
	hide_all_hud_sprites
	root_window :settags \{menu_state = on}
	spawnscriptnow \{ui_change_state
		params = {
			state = UIstate_stats_from_gameplay
		}}
endscript

script goal_display_focus_skill 
	if structurecontains structure = <goal_rewards> skill
		<skill_id> = (<goal_rewards>.skill)
		<show_rigger> = false
	elseif structurecontains structure = <goal_rewards> rigger_piece
		<skill_id> = (<goal_rewards>.rigger_piece)
		<show_rigger> = true
	else
		<show_rigger> = false
	endif
	<skill_text> = ""
	if gotparam skill_id
		SkillTree_GetSkillInfo skill = <skill_id>
		printstruct <...>
		formattext {
			textname = skill_text
			"\\c9New skill unlocked:\\n%c%s\\c9\\n\\n%d"
			s = (<skill_info>.name)
			c = ($goal_ui_scheme.text_color)
			d = (<skill_info>.description)
		}
	endif
	if (<show_rigger> = true)
		goal_reward_show_rigger_object rigger_id = <skill_id>
	endif
	goal_display_reward_generic_focus {
		descrip = <skill_text>
	}
endscript
ui_skills_in_reward_screen = 1

script goal_display_focus_skill_points 
	if ($ui_skills_in_reward_screen = 1)
		GetSkillPoints
		<total_points> = (<skill_points>.generic)
		formattext textname = skill_text "%c%p SKILL PTS\\c9 AVAILABLE\\n" p = <total_points> c = ($goal_ui_scheme.text_color)
		ui_create_stats_from_reward_screen
		<descrip_pos> = (50.0, 445.0)
	else
		formattext textname = skill_text "You gained %p Skill Points!" p = (<goal_rewards>.skill_points)
		GetSkillPoints
		<total_points> = (<skill_points>.generic)
		formattext textname = skill_text "%s\\n\\n%c%p SKILL PTS\\c9 AVAILABLE" s = <skill_text> p = <total_points> c = ($goal_ui_scheme.text_color)
		if ((<total_points> > $skill_default_1st_upgrade_cost) || (<total_points> > $skill_default_2nd_upgrade_cost))
			<skill_text> = (<skill_text> + "\\n\\nGo to SKILLS-STATS in the MY SKATER menu to upgrade your Mechanics!")
		else
			<skill_text> = (<skill_text> + "\\n\\nBeat more Goals to earn more Skill Points.")
		endif
	endif
	if getglobalflag flag = $CAREER_TRAINING_DONE
		<options_text> = [{text = "\\m5 SKILLS-STATS"}]
		<options> = [
			{pad_option
				goal_display_reward_exit params = {callback = goal_display_reward_goto_stats warn = true zone = "Skill-Stats"}}
		]
	else
		<options_text> = <options_pre>
	endif
	goal_display_reward_generic_focus {
		descrip = <skill_text>
		descrip_dims = (602.0, 0.0)
		descrip_pos = <descrip_pos>
		options = <options_text>
		options_handlers = <options>
	}
endscript

script goal_reward_show_rigger_object 
	goal_reward_kill_rigger_object
	if ($goal_rewards_show_rigger_piece = 0)
		return
	endif
	<rig_info> = ($goal_rigger_reward_hack.<rigger_id>)
	<cam_pos> = (1.0, 1.0, 1.5)
	<cam_pos> = (<rig_info>.cam_pos)
	goal_create_viewport_type {
		type = rig_rewards
		goal_string = 'goal_reward_viewport'
		rot_angle = 0
		lookatpos = (0.0, 1.1, 0.0)
		lookat = skater
		lockto = skater
		pos = <cam_pos>
		appearance_priority = 1
	}
	setscreenelementprops id = goal_viewport_parent unhide
	skater :obj_getposition
	skater :hide
	createcompositeobject {
		components = [{component = model} {component = motion}]
		params = {
			name = goal_success_rak
			pos = (<pos> + (<rig_info>.offset))
			model = (<rig_info>.model)
			scale = (<rig_info>.scale)
		}
	}
	goal_success_rak :obj_spawnscript goal_display_obj_spin
endscript

script goal_reward_kill_rigger_object 
	if iscreated \{goal_success_rak}
		goal_success_rak :die
	endif
	skater :unhide
endscript

script goal_display_obj_spin 
	<rot_angle> = (0.0, 120.0, 0.0)
	<rot_time> = 2.0
	begin
	obj_rotate relative = <rot_angle> time = <rot_time>
	wait <rot_time> seconds ignoreslomo
	repeat
endscript

script goal_reward_display_goto_cas 
	if gamemodeequals \{is_career}
		careerfunc \{func = enableatomupdate
			params = {
				enable = false
			}}
	endif
	goal_display_success_cleanup_cas
	ui_goto_cas_from_gameplay
endscript

script goal_display_focus_cas 
	printf 'goal_display_focus_cas'
	getarraysize (<goal_rewards>.cas_parts)
	<i> = 0
	begin
	if structurecontains structure = (<goal_rewards>.cas_parts [<i>]) desc_id
		<applyable_piece> = (<goal_rewards>.cas_parts [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<descrip> = "new clothes"
	if gotparam applyable_piece
		<descrip> = (<applyable_piece>.name)
		<part> = (<applyable_piece>.part)
		if structurecontains structure = ($mini_cas_camera_positions.hi) <part>
			<camera_pos> = ($mini_cas_camera_positions.hi.pos)
			<camera_lookatpos> = ($mini_cas_camera_positions.hi.lookatpos)
		elseif structurecontains structure = ($mini_cas_camera_positions.low) <part>
			<camera_pos> = ($mini_cas_camera_positions.low.pos)
			<camera_lookatpos> = ($mini_cas_camera_positions.low.lookatpos)
		else
			<camera_pos> = ($mini_cas_camera_positions.mid.pos)
			<camera_lookatpos> = ($mini_cas_camera_positions.mid.lookatpos)
		endif
		skater :obj_getposition
		goal_create_viewport_type {
			type = rewards
			goal_string = 'goal_reward_viewport'
			rot_angle = 2.5
			lookatpos = <camera_lookatpos>
			lookat = skater
			lockto = world
			pos = (<pos> + <camera_pos>)
			appearance_priority = 1
		}
		setscreenelementprops id = goal_viewport_parent unhide
		<event_handlers> = [
			{pad_l1 goal_reward_cas_rotate_skater params = {direction = left}}
			{pad_r1 goal_reward_cas_rotate_skater params = {direction = right}}
		]
		award_handler = [
			{pad_btn_top goal_reward_cas_apply_piece params = {cas_parts = (<goal_rewards>.cas_parts)}}
		]
		if ($goal_cas_award_applied_pieces = 1)
			event_handlers = (<event_handlers> + <award_handler>)
		else
			if NOT goal_cas_award_already_applied cas_parts = (<goal_rewards>.cas_parts)
				event_handlers = (<event_handlers> + <award_handler>)
			endif
		endif
		ui_ingame_cas_get_options_text cas_parts = (<goal_rewards>.cas_parts)
	else
		<descrip> = "\\c9new clothes"
		<options_text> = [{text = "\\m5 create-a-skater"}]
		<event_handlers> = []
	endif
	formattext textname = descrip "\\c9You earned %c%s\\c9\\n\\nGo to create-a-skater to change your attire." s = <descrip> c = ($goal_ui_scheme.text_color)
	if ui_ingame_cas_show_goto_cas
		addarrayelement {
			array = <event_handlers>
			element = {
				pad_option goal_display_reward_exit params = {callback = goal_reward_display_goto_cas warn = true zone = "create-a-skater"}
			}
		}
		<event_handlers> = <array>
	endif
	goal_display_reward_generic_focus {
		descrip = <descrip>
		options = <options_text>
		options_handlers = <event_handlers>
	}
endscript

script ui_ingame_cas_show_goto_cas 
	<show_cas> = 0
	if getglobalflag \{flag = $CAREER_TRAINING_DONE}
		<show_cas> = 1
		if screenelementexists \{id = goal_container}
			if goal_container :getsingletag \{standalone_career_rewards}
				<show_cas> = 0
			endif
		endif
	endif
	if istrue <show_cas>
		return \{true}
	else
		return \{false}
	endif
endscript

script ui_ingame_cas_get_options_text 
	<helper_array> = []
	if ui_ingame_cas_show_goto_cas
		addarrayelement array = <helper_array> element = {text = "\\m5 CREATE-A-SKATER"}
		<helper_array> = <array>
	endif
	addarrayelement array = <helper_array> element = {text = "\\bi Rotate Skater"}
	<helper_array> = <array>
	if ($goal_cas_award_applied_pieces = 0)
		if goal_cas_award_already_applied cas_parts = <cas_parts>
		else
			addarrayelement array = <helper_array> element = {text = "\\m8 Apply Piece"}
			<helper_array> = <array>
		endif
	else
		addarrayelement array = <helper_array> element = {text = "\\m8 Remove Piece"}
		<helper_array> = <array>
	endif
	return options_text = <helper_array>
endscript

script goal_reward_display_goto_crib 
	if gamemodeequals \{is_career}
		careerfunc \{func = enableatomupdate
			params = {
				enable = false
			}}
	endif
	spawnscriptnow \{noqbid
		change_level
		params = {
			level = load_z_crib
		}}
endscript

script goal_display_focus_bling 
	<skill_id> = (<goal_rewards>.crib_piece)
	SkillTree_GetSkillInfo skill = <skill_id>
	formattext textname = descrip "\\c9You earned new stuff for your Skate Lounge:\\n%c%s\\c9" s = (<skill_info>.name) c = ($goal_ui_scheme.text_color)
	if getglobalflag flag = $CAREER_TRAINING_DONE
		get_current_zone_as_checksum
		if NOT checksumequals a = <current_zone> b = z_crib
			<options> = {
				options = [{text = "\\m5 SKATE LOUNGE"}]
				options_handlers = [
					{pad_option goal_display_reward_exit params = {callback = goal_reward_display_goto_crib warn = true zone = "Your Skate Lounge"}}
				]
			}
		endif
	endif
	if structurecontains structure = <goal_rewards> crib_piece_movie
		killallmovies blocking
		createscreenelement {
			scale = (409.0, 230.0)
			movie = (<goal_rewards>.crib_piece_movie)
			pos = (720.0, 360.0)
			just = [left top]
			rot_angle = 32.5
			type = movieelement
			parent = goal_container
			id = career_reward_movie
			textureslot = 0
			z_priority = 1000
		}
	endif
	goal_display_reward_generic_focus {
		descrip = <descrip>
		<options>
	}
endscript

script goal_display_reward_goto_view_tricks 
	do_actual_pause
	root_window :settags \{menu_state = on}
	spawnscriptnow \{ui_change_state
		params = {
			state = UIstate_view_tricks
		}}
endscript

script goal_display_focus_special 
	<special_id> = ((<goal_rewards>.special).trick)
	GetKeyComboBoundToTrick trick = <special_id> special
	if gotparam current_key_combo
		GetTrickTextFromKeyCombo key_combo = <current_key_combo> trick_array = $specialcombos
	endif
	GetTrickDisplayText trick = <special_id>
	if gotparam key_text
		formattext {
			textname = special_text
			"\\c9Unlocked special trick\\n%c%n\\c9\\nassigned to\\n\\c1%b\\c0"
			c = ($goal_ui_scheme.text_color)
			n = <trick_display_text>
			b = <key_text>
		}
	else
		formattext {
			textname = special_text
			"\\c9Unlocked special trick\\n%c%n\\c9"
			n = <trick_display_text>
			c = ($goal_ui_scheme.text_color)
		}
	endif
	<special_text> = (<special_text> + "\\n\\nGo to TRICK CONTROLS to see and edit your special tricks.")
	if getglobalflag flag = $CAREER_TRAINING_DONE
		<options_text> = [{text = "\\m5 TRICK CONTROLS"}]
		<options_handlers> = [
			{pad_option goal_display_reward_exit params = {callback = goal_display_reward_goto_view_tricks warn = true zone = "Trick Controls"}}
		]
	endif
	goal_display_reward_generic_focus {
		descrip = <special_text>
		options = <options_text>
		options_handlers = <options_handlers>
	}
endscript

script goal_display_focus_retry_goal 
	printf \{'goal_display_focus_retry_goal'}
	if gotparam \{goal}
		goal_generic_view_goal_pausemenu parent = goal_container goal = <goal>
		create_helper_text \{anchor_id = goal_reward_options_helper
			parent = goal_container
			helper_text_elements = [
				{
					text = "\\m0 retry goal"
				}
			]}
	endif
endscript

script goal_display_focus_continue 
	printf \{'goal_display_focus_continue'}
	ui_status_view \{parent = goal_container
		update_scheme = false}
	create_helper_text \{anchor_id = goal_reward_options_helper
		parent = goal_container
		helper_text_elements = [
			{
				text = "\\m0 continue"
			}
		]}
endscript

script goal_reward_cas_rotate_skater 
	requireparams [direction] all
	killspawnedscript name = goal_reward_cas_rotate_skater_spawned
	switch <direction>
		case left
		spawnscriptnow goal_reward_cas_rotate_skater_spawned params = {angle = -3 button = l1}
		case right
		spawnscriptnow goal_reward_cas_rotate_skater_spawned params = {angle = 3 button = r1}
		default
		softassert "direction should be left or right, is %d" d = <direction>
		return
	endswitch
endscript

script goal_reward_cas_rotate_skater_spawned 
	begin
	if NOT screenelementexists \{id = goal_container}
		break
	elseif controllerpressed <button>
		skater :rotate y = <angle>
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script goal_reward_cas_apply_piece 
	printf 'goal_reward_cas_apply_piece'
	generic_menu_pad_choose_sound
	setbuttoneventmappings block_menu_input
	career_rewards_loading_create parent = goal_reward_descrip pos = (-520.0, 540.0)
	wait 0.5 second ignoreslomo
	GetCurrentSkaterProfileIndex
	if ($goal_cas_award_applied_pieces = 0)
		requireparams [cas_parts] all
		GetPlayerAppearance player = <currentskaterprofileindex>
		cas_find_tex_swap_parts appearance = <profile> part_list = <cas_parts>
		change goal_cas_award_tex_swap_parts = <tex_swap_parts>
		printstruct <tex_swap_parts>
		SkaterSwapInTemporaryAppearance no_refresh
		getarraysize <cas_parts>
		if (<array_size> = 0)
			scriptassert 'cas_parts array is empty'
		endif
		i = 0
		begin
		cas_bit = (<cas_parts> [<i>])
		if structurecontains structure = <cas_bit> part
			if NOT structurecontains structure = <cas_bit> desc_id
				scriptassert 'Missing desc_id on part'
			endif
			cas_handle_disqualifications part = (<cas_bit>.part) desc_id = (<cas_bit>.desc_id)
			if gotparam new_desc_id
				desc_id = <new_desc_id>
				removeparameter new_desc_id
			else
				desc_id = (<cas_bit>.desc_id)
			endif
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = (<cas_bit>.part) desc_id = <desc_id>}
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
		if goal_cas_award_parts_need_tex_swap
			RefreshSkaterModelAsync {
				skater = 0
				profile = <currentskaterprofileindex>
			}
		else
			cas_push_temp_geoms heap = scratch
		endif
		change goal_cas_award_applied_pieces = 1
	else
		SkaterRestoreAfterTemporaryAppearance no_refresh
		if goal_cas_award_parts_need_tex_swap
			RefreshSkaterModelAsync {
				skater = 0
				profile = <currentskaterprofileindex>
			}
		else
			cas_pop_temp_geoms
		endif
		change goal_cas_award_applied_pieces = 0
	endif
	career_rewards_loading_destroy
	ui_ingame_cas_get_options_text cas_parts = <cas_parts>
	create_helper_text {
		anchor_id = goal_reward_options_helper
		parent = goal_container
		helper_text_elements = <options_text>
	}
	setbuttoneventmappings unblock_menu_input
endscript

script goal_display_success_cleanup_cas 
	<temp_appearance_is_pro> = 0
	if screenelementexists id = goal_container
		if goal_container :getsingletag rewards_goal_id
			gman_getgoaltype goal = <rewards_goal_id>
			switch <goal_type>
				case hawkman
				case classic
				case high_score_run
				<temp_appearance_is_pro> = 1
			endswitch
		endif
	endif
	if (<temp_appearance_is_pro> = 0)
		SkaterDiscardTemporaryAppearance
	endif
	if ($goal_cas_award_applied_pieces = 1)
		if NOT goal_cas_award_parts_need_tex_swap
			career_rewards_loading_create pos = (120.0, 110.0)
			cas_commit_temp_geoms
			career_rewards_loading_destroy
		endif
	endif
	if ($cas_using_temp_geoms = 1)
		scriptassert 'Oh dear, still using temp geoms for CAS'
	endif
	change goal_cas_award_applied_pieces = 0
endscript

script career_rewards_loading_create parent = goal_container pos = (330.0, 110.0)
	if screenelementexists id = <parent>
		net_view_goals_create_searching_text {
			text = "Loading..."
			just = [left bottom]
			pos = <pos>
			scale = 0.75
			parent = <parent>
		}
	endif
	if viewportexists id = goal_viewport_viewport_element
		if NOT screenfx_fxinstanceexists viewport = goal_viewport_viewport_element name = goal_reward_bloom
			screenfx_addfxinstance {
				viewport = goal_viewport_viewport_element
				name = goal_reward_bloom
				scefname = noise
				type = noise
				on = 1
				intensity = 0.8
				color = [192 192 192]
			}
		endif
	endif
endscript

script career_rewards_loading_destroy 
	if screenelementexists \{id = net_view_goals_searching_cont}
		runscriptonscreenelement \{id = net_view_goals_searching_cont
			net_view_goals_searching_fade_out_and_die}
	endif
	if viewportexists \{id = goal_viewport_viewport_element}
		if screenfx_fxinstanceexists \{viewport = goal_viewport_viewport_element
				name = goal_reward_bloom}
			screenfx_removefxinstance \{viewport = goal_viewport_viewport_element
				name = goal_reward_bloom}
		endif
	endif
endscript

script goal_cas_award_parts_need_tex_swap 
	return \{true}
endscript

script goal_cas_award_already_applied 
	GetCurrentSkaterProfileIndex
	getarraysize (<cas_parts>)
	<i> = 0
	begin
	if structurecontains structure = (<cas_parts> [<i>]) desc_id
		<applyable_piece> = (<cas_parts> [<i>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = (<applyable_piece>.part)
			if NOT (<desc_id> = (<applyable_piece>.desc_id))
				return false
			endif
		else
			return false
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return true
endscript
RefreshSkaterModelAsync_Lock = 0

script RefreshSkaterModelAsync 
	if ($RefreshSkaterModelAsync_Lock = 1)
		scriptassert 'RefreshSkaterModelAsync badness1'
	endif
	change RefreshSkaterModelAsync_Lock = 1
	printf ' ++ RefreshSkaterModelAsync starting ++ '
	RefreshSkaterModel {
		<...>
		async
	}
	begin
	if ($RefreshSkaterModelAsync_Lock = 0)
		scriptassert 'RefreshSkaterModelAsync badness2'
	endif
	wait 2 gameframes
	if NOT IsAsyncAppearanceLoading
		break
	endif
	repeat
	printf ' ++ RefreshSkaterModelAsync finished ++ '
	change RefreshSkaterModelAsync_Lock = 0
endscript

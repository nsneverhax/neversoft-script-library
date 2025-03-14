min_career_combo_record = 10000
chapter_info_show_all_story_goals = 0
chapter_info_hide_unknown_goals = 0
chapter_info_goal_lock_checker_exclusions = [
]
max_goal_points = {
	generic = 400
	career = 400
	hardcore = 400
	rigger = 400
	total = 1600
}
mod_environment_num_spots_achievement = 53

script SetupSkaterCareer 
	careerfunc \{func = initleveltables
		params = $SkaterCareerParams}
	game_progress_register_atomic_structure
	careerfunc \{func = reset}
endscript
game_progress_block_triggers = 0

script game_progress_unblock_triggers 
	printf \{"Career unblocking triggers"}
	change \{game_progress_block_triggers = 0}
endscript

script game_progress_clear_pager_message 
	if gotparam atom
		careerfunc func = clearpagermessagebyatomname params = {name = <atom>}
	else
		if gotparam atoms
			getarraysize atoms
			<i> = 0
			begin
			careerfunc func = clearpagermessagebyatomname params = {name = (<atoms> [<i>])}
			<i> = (<i> + 1)
			repeat <array_size>
		else
			scriptassert "Missing 'atom' or 'atoms' params"
		endif
	endif
endscript

script game_progress_process_cutscene \{skippable = 1}
	unpausegame
	pausemusic \{0}
	if gotparam \{intro_restart_node}
		resetskaters node_name = <intro_restart_node>
	endif
	playcutscene {
		<...>
		skippable = <skippable>
		exitscript = game_progress_process_status
	}
endscript

script timer_atom_completed 
	game_progress_process_status
endscript

script game_progress_process_goal_lock {
		lock = 0
		assert = {}
	}
	if (<lock> = 1)
		<func> = lockprogressiongoal
	else
		<func> = unlockprogressiongoal
	endif
	if gotparam goal
		careerfunc func = <func> params = {goal_id = <goal> <assert>}
		if gman_goalexists goal = <goal>
			if (<lock> = 1)
				goal_historical_trigger_destroy goal_id = <goal>
				if gman_goalisinitialized goal = <goal>
					gman_setdata goal = <goal> params = {dont_create_historical_trigger = 1}
					gman_uninitializegoal goal = <goal>
				endif
			else
				printf "unlocking %s" s = <goal> DontAssertOnChecksums
				if NOT gman_goalisinitialized goal = <goal>
					if NOT GoalPakManager_IsIntroInited goal_id = <goal>
						gman_initializegoal goal = <goal>
					endif
				endif
			endif
		endif
	elseif gotparam goals
		<i> = 0
		getarraysize goals
		if (<array_size> > 0)
			begin
			careerfunc func = <func> params = {goal_id = (<goals> [<i>]) <assert>}
			if gman_goalexists goal = (<goals> [<i>])
				if (<lock> = 1)
					goal_historical_trigger_destroy goal_id = (<goals> [<i>])
					if gman_goalisinitialized goal = (<goals> [<i>])
						gman_setdata goal = (<goals> [<i>]) params = {dont_create_historical_trigger = 1}
						gman_uninitializegoal goal = (<goals> [<i>])
					endif
				else
					if NOT gman_goalisinitialized goal = (<goals> [<i>])
						gman_initializegoal goal = (<goals> [<i>])
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	else
		scriptassert "Expected 'goal' or 'goals' param"
	endif
	gman_syncgoalswithcareer
endscript

script gane_progress_process_cheat 
	if gotparam lock_goals
		game_progress_process_goal_lock {
			lock = 1
			goals = <lock_goals>
			assert = {dont_assert}
		}
	endif
	if gotparam unlock_goals
		game_progress_process_goal_lock {
			lock = 0
			goals = <unlock_goals>
			assert = {dont_assert}
		}
	endif
	if gotparam nodeflags
		getarraysize nodeflags
		if (<array_size> > 0)
			i = 0
			begin
			changenodeflag (<nodeflags> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if gotparam atoms
		getarraysize atoms
		if (<array_size> > 0)
			i = 0
			begin
			careerfunc func = debugforceatomunlocked params = {name = (<atoms> [<i>])}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script game_progression_give_skill 
	requireparams \{[
			skill
		]
		all}
	if SkillTree_IsSkillLearned skill = <skill>
		printf "Already have skill %s" s = <skill>
		return
	endif
	if NOT SkillTree_IsSkillPurchasable skill = <skill>
		softassert 'skill %s must be purchasable (no prerequisites)' s = <skill>
	else
		SkillTree_PurchaseSkill skill = <skill>
	endif
endscript

script game_progression_check_for_all_upgrades_achievement 
	if SkillTree_LearnedAllWithTrait \{trait = menu}
		writeachievements \{achievement = ach_sk9_upgrades_all}
	endif
endscript

script game_progression_check_for_all_bling_achievement 
endscript

script Ped_Utils_SetupGameProgressTrigger \{inner_radius = 8
		outer_radius = 40
		activation_script = game_progress_got_trigger}
	if gotparam \{flag}
		if getglobalflag flag = <flag>
			return
		endif
	endif
	cleareventhandler \{anyobjectinradius}
	cleareventhandler \{objectoutofradius}
	obj_setinnerradius <inner_radius>
	seteventhandler event = anyobjectinradius scr = ped_speech_got_trigger response = call_script params = {<...> activation_script_params = <...>}
endscript

script game_progress_got_trigger 
	if gotparam \{flag}
		setglobalflag flag = <flag>
	else
		printstruct <...>
		printf \{"i don't know what to do!"}
	endif
	skater :unpause
	game_progress_process_status
endscript

script game_progress_process_status level_startup = 0
	if ($goal_goalmanager_uninitializing = 1)
		return
	endif
	if NOT gamemodeequals is_career
		return
	endif
	if infrontend
		return
	endif
	if levelis viewer
		return
	endif
	if (<level_startup> = 1)
		if NOT getglobalflag flag = $NO_DISPLAY_COMPASS
			CompassManager_Refresh
			show_compass_anchor
		endif
	endif
	if gotparam wait_time
		if istrue $game_progress_block_triggers
			return
		endif
		printf "Career blocking triggers temporarily..."
		change game_progress_block_triggers = 1
		onexitrun game_progress_unblock_triggers
		wait <wait_time> seconds
		if istrue $igc_playing
			block type = igc_scene_finished
		endif
	endif
	fadetoblack off no_wait
	careerfunc func = updateatoms
	if (<level_startup> = 1)
		printf 'Waiting for goal paks... started load stall'
		GoalPakManager_WaitForPaks
		printf 'Waiting for goal paks... finished load stall'
	endif
endscript

script game_progress_unlock_level 
	setflag level = <level> flag = $LEVEL_UNLOCKED_STORY
	game_progress_change_nodeflags <...>
endscript

script game_progress_change_nodeflags 
	if gotparam \{nodeflags}
		getarraysize \{nodeflags}
		i = 0
		begin
		changenodeflag (<nodeflags> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script game_progress_move_skater_to_node 
	resetskaters node_name = <name>
endscript

script game_progress_start_goal 
	if gman_goalexists goal = <name>
		gman_activategoal goal = <name>
	endif
endscript

script game_progress_process_post_goal_wait 
	requireparams \{[
			goal_id
		]
		all}
	if istrue \{$game_progress_debug_active}
		return
	endif
	begin
	if NOT gman_goalexists goal = <goal_id>
		return
	endif
	if gman_getgoalstate goal = <goal_id> states = [goal_inactive goal_uniniting goal_uninited]
		break
	endif
	wait \{1
		gameframe}
	repeat
	game_progress_process_status
endscript
current_progress_audio_clip = null

script fade_play_audio_clip 
	stopmusic
	printstruct <...>
	change current_progress_audio_clip = <wav>
	begin
	if NOT (isstreamplaying <wav>)
		break
	endif
	wait \{1
		second}
	repeat
	change \{current_progress_audio_clip = null}
endscript

script game_progress_play_audio_clip 
	spawnscriptlater fade_play_audio_clip params = <...>
endscript

script game_progress_add_cash 
	careerfunc func = AddCash params = {cash = <cash>}
endscript

script WaitUntilScreenClear \{pass = 0}
	begin
	wait \{1
		gameframes}
	if IsScreenClear
		if (<pass> >= 2)
			wait \{1
				gameframes}
			removeparameter \{pass}
			SafeCallback <...>
			return
		else
			break
		endif
	endif
	pass = 0
	repeat
	pass = (<pass> + 1)
	GotoPreserveParams \{WaitUntilScreenClear}
endscript

script IsScreenClear 
	if skater :onground
		root_window :getsingletag menu_state
		if (<menu_state> = off)
			if NOT screenelementexists id = speech_box_anchor
				if ($goal_photo_in_target = false)
					if ($goal_photo_showing_picture = false)
						if ($goal_photo_taking_picture = false)
							if ($view_goal_info_exiting = 0)
								if ($milestone_screens_active = 0)
									if ($goal_is_between_retries = 0)
										if NOT screenelementexists id = current_menu_anchor
											if NOT istrue $igc_playing
												if ($goal_zone_loading = 0)
													if NOT screenelementexists id = videophone_root
														if NOT isloadingscreenactive
															if NOT gman_hasactivegoals
																return true
															endif
														endif
													endif
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	return false
endscript

script SetUpChapterMenu 
	change \{dont_restore_start_key_binding = 1}
	skater :pausephysics
	skater :RemoveSkaterFromWorld
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	hide_all_hud_items \{dont_restore_input}
	kill_start_key_binding
	pausemusic \{1}
	root_window :settags \{menu_state = on}
	SafeCallback <...>
endscript

script KillChapterMenu 
	dialog_box_exit
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if gotparam need_unpause_streams
		pausestream 0
	endif
	if gotparam inside_run
		unpausegame
		unpauseskaters
		show_all_hud_items
	else
		if gotparam mark_first_input
			mark_first_input_received <...>
		endif
		if screenelementexists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
		root_window :settags menu_state = off
		change dont_restore_start_key_binding = 0
		restore_start_key_binding
		pausemusic 0
		skater :unpausephysics
		skater :AddSkaterToWorld
		show_all_hud_items
	endif
	SafeCallback <...>
endscript

script career_post_load 
	careerfunc \{func = setappropriatenodeflags}
	PlaylistNextTrack
endscript
game_progress_debug_active = 0

script game_progress_debug_menu_kill 
	if screenelementexists \{id = progress_debug_anchor}
		destroyscreenelement \{id = progress_debug_anchor}
	endif
	generic_ui_destroy
	change \{game_progress_debug_active = 0}
	show_all_hud_sprites
	skater :enableplayerinput
endscript

script game_progress_debug_menu_create 
	change game_progress_debug_active = 1
	if NOT gotparam previously_selected_index
		disassociatefromobject
		handle_start_pressed <...>
	endif
	skater :killskater no_node
	skater :disableplayerinput
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = progress_debug_anchor
	}
	assignalias id = progress_debug_anchor alias = current_menu_anchor
	hide_all_hud_sprites
	pause_menu_gradient parent = current_menu_anchor
	createscreenelement {
		type = vscrollingmenu
		parent = progress_debug_anchor
		id = progress_debug_menu
		dims = (200.0, 550.0)
		pos = (80.0, 80.0)
		just = [left top]
		internal_just = [left top]
	}
	createscreenelement {
		type = vmenu
		parent = progress_debug_menu
		id = progress_debug_vmenu
		font = text_a1
		just = [left top]
		padding_scale = 0.9
		internal_scale = 1
		internal_just = [left top]
	}
	createscreenelement {
		type = textelement
		parent = progress_debug_anchor
		font = text_a1
		text = "Atom debug unlocking"
		just = [left top]
		scale = 1.0
		rgba = [255 255 255 255]
		not_focusable
		pos = (80.0, 50.0)
		shadow
		shadow_offs = (2.0, 2.0)
	}
	assignalias id = progress_debug_vmenu alias = current_menu
	setscreenelementprops {
		id = current_menu
		event_handlers = [
			{pad_back game_progress_debug_menu_kill}
		]
		replace_handlers
	}
	create_helper_text helper_text_elements = [{text = "\\m0 Unlock"} {text = "\\m1 Exit"}]
	careerfunc func = getstoryatomuiparams
	foreachin <atom_ui_params> do = game_progress_debug_menu_add_item pass_index
	launchevent type = focus target = current_menu data = {grid_index = <previously_selected_index>}
endscript

script game_progress_debug_menu_focus 
	getprops
	settags \{old_rgba = [
			255
			255
			255
			128
		]}
	obj_getid
	setscreenelementprops id = {<objid> child = 0} rgba = [255 255 255 255]
	if screenelementexists id = {<objid> child = 1}
		setscreenelementprops id = {<objid> child = 1} rgba = [255 255 255 255]
	endif
endscript

script game_progress_debug_menu_unfocus 
	getsingletag \{old_rgba}
	obj_getid
	setscreenelementprops id = {<objid> child = 0} rgba = <old_rgba>
	if screenelementexists id = {<objid> child = 1}
		setscreenelementprops id = {<objid> child = 1} rgba = <old_rgba>
	endif
endscript

script game_progress_debug_menu_add_item 
	if gotparam debug_menu_text
		createscreenelement {
			type = containerelement
			parent = current_menu
			dims = (500.0, 20.0)
			just = [left top]
			event_handlers = [
				{focus game_progress_debug_menu_focus}
				{unfocus game_progress_debug_menu_unfocus}
				{pad_choose game_progress_debug_menu_choose params = <...>}
			]
			tags = {
				tag_grid_x = <foreachin_index>
			}
		}
		container = <id>
		<text_params> = {
			font = text_a1
			rgba = [255 255 255 128]
			scale = (0.6)
		}
		createscreenelement {
			type = textelement
			parent = <container>
			text = <debug_menu_text>
			<text_params>
			just = [left top]
			pos = (0.0, 0.0)
		}
		formattext textname = status_text "- %s" s = <state> dontassertforchecksums
		createscreenelement {
			type = textelement
			parent = <container>
			text = <status_text>
			<text_params>
			just = [left top]
			pos = (370.0, 0.0)
		}
	endif
endscript

script game_progress_debug_menu_choose 
	getsingletag tag_grid_x
	disassociatefromobject
	game_progress_debug_menu_kill
	change game_progress_debug_active = 1
	switch <state>
		case locked
		if gotparam debug_require_level
			if NOT levelis <debug_require_level>
				formattext textname = error "You must be in %s to unlock this atom!" s = <debug_require_level> dontassertforchecksums
				block_action = 1
			endif
		endif
		if NOT gotparam block_action
			careerfunc func = debugforceatomunlocked params = {name = <name>}
		endif
		default
		printf "can't do anything with this atom"
	endswitch
	game_progress_debug_menu_create previously_selected_index = <tag_grid_x>
	if gotparam error
		create_panel_message text = <error> pos = (320.0, 40.0) time = 2000 parent = current_menu_anchor
	endif
endscript

script progression_debug_process_atom_goals goal_grade = 1
	if ((<goal_grade> < 1) || (<goal_grade> > 3))
		softassert "goal_grade must be between 1 and 3"
	endif
	if careerfunc func = getgoalsassociatedwithatoms params = {atoms = <atoms> debugunlockatomifnotgoalatom}
		<i> = 0
		begin
		if gotparam min_goal_points
			if careerfunc func = hasgoalpointsinstructure params = {goal_points = <min_goal_points>}
				printf "PROG DEBUG - aborting winning of goals due to meeting goal points requirement"
				break
			endif
		endif
		printf "PROG DEBUG - beating goal %s" s = (<goals> [<i>])
		careerfunc func = fakebeatprogressiongoal params = {goal_id = (<goals> [<i>]) goal_grade = <goal_grade>}
		create_panel_message text = "Please wait!"
		GoalPakManager_WaitForPaks
		wait 5 gameframes
		<i> = (<i> + 1)
		repeat <num_goals>
	endif
endscript

script progression_debug_process_gaps 
	CreateGapList zone = <zone>
	getarraysize gaplist
	<i> = 0
	begin
	if gotparam count
		if NOT (<i> < <count>)
			break
		endif
	endif
	<gap_struct> = (<gaplist> [<i>])
	<gap_text> = (<gap_struct>.gap_name)
	<zone_name> = (<gap_struct>.zone)
	printf "PROG DEBUG - getting gap %s" s = <gap_text>
	skater :StartGap GapID = debug_gap
	skater :endgap GapID = debug_gap text = <gap_text> zone = <zone_name>
	<i> = (<i> + 1)
	repeat <array_size>
	skater :clearpanel_landed
endscript

script progression_debug_process_scripts 
	getarraysize <script_list>
	if (<array_size> > 0)
		<i> = 0
		begin
		<scr> = (<script_list> [<i>])
		if scriptexists <scr>
			printf "PROG DEBUG - running script %s" s = <scr>
			<scr>
		else
			printf "PROG DEBUG - script %s not found" s = <scr>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script progression_debug_process_structure 
	printf "PROG DEBUG - processing structure"
	printstruct <...>
	net_view_goals_create_searching_text text = "Processing..." scale = 0.75 parent = root_window
	if gotparam required_atoms
		progression_debug_process_atom_goals {
			atoms = <required_atoms>
			goal_grade = <required_atoms_goal_grade>
		}
	endif
	if gotparam chalk_challenge_percent
		careerfunc func = debugfakebeatchalkchallenges params = {
			percent = <chalk_challenge_percent>
			goal_grade = <chalk_challenge_grade>
		}
	endif
	if gotparam zone_gaps
		foreachin <zone_gaps> do = progression_debug_process_gaps
	endif
	if gotparam optional_atoms
		progression_debug_process_atom_goals {
			atoms = <optional_atoms>
			goal_grade = <optional_atoms_goal_grade>
			min_goal_points = <min_goal_points>
		}
	endif
	if gotparam additional_scripts
		progression_debug_process_scripts script_list = <additional_scripts>
	endif
	careerfunc func = updateatoms
	if screenelementexists id = net_view_goals_searching_cont
		runscriptonscreenelement id = net_view_goals_searching_cont net_view_goals_searching_fade_out_and_die
	endif
	printf "PROG DEBUG - done"
endscript

script game_progress_checkpoint_menu_create 
	disassociatefromobject
	root_window :handle_start_pressed <...> device_num = 0
	skater :killskater no_node
	skater :disableplayerinput
	createscreenelement {
		type = containerelement
		parent = root_window
		id = progress_debug_anchor
	}
	assignalias id = progress_debug_anchor alias = current_menu_anchor
	hide_all_hud_sprites
	pause_menu_gradient parent = current_menu_anchor
	createscreenelement {
		type = vscrollingmenu
		parent = progress_debug_anchor
		id = progress_debug_menu
		dims = (200.0, 550.0)
		pos = (80.0, 80.0)
		just = [left top]
		internal_just = [left top]
	}
	createscreenelement {
		type = vmenu
		parent = progress_debug_menu
		id = progress_debug_vmenu
		font = text_a1
		just = [left top]
		padding_scale = 0.9
		internal_scale = 1
		internal_just = [left top]
	}
	createscreenelement {
		type = textelement
		parent = progress_debug_anchor
		font = text_a1
		text = "Progress checkpoint unlocking"
		just = [left top]
		scale = 1.0
		rgba = [255 255 255 255]
		not_focusable
		pos = (80.0, 50.0)
		shadow
		shadow_offs = (2.0, 2.0)
	}
	assignalias id = progress_debug_vmenu alias = current_menu
	setscreenelementprops {
		id = current_menu
		event_handlers = [
			{pad_back game_progress_debug_menu_kill}
		]
		replace_handlers
	}
	create_helper_text helper_text_elements = [{text = "\\m0 Unlock"} {text = "\\m1 Exit"}]
	foreachin $chapter_info_debug_checkpoints do = game_progress_checkpoint_menu_add_item
	launchevent type = focus target = current_menu
endscript

script game_progress_checkpoint_menu_add_item 
	createscreenelement {
		type = containerelement
		parent = current_menu
		dims = (500.0, 20.0)
		just = [left top]
		event_handlers = [
			{focus game_progress_debug_menu_focus}
			{unfocus game_progress_debug_menu_unfocus}
			{pad_choose game_progress_checkpoint_menu_choose params = <...>}
		]
		tags = {
			tag_grid_x = <foreachin_index>
		}
	}
	container = <id>
	createscreenelement {
		type = textelement
		parent = <container>
		text = <debug_menu_text>
		font = text_a1
		rgba = [255 255 255 128]
		scale = 0.6
		just = [left top]
		pos = (0.0, 0.0)
	}
endscript

script game_progress_checkpoint_menu_choose 
	setbuttoneventmappings \{block_menu_input}
	change \{game_progress_debug_active = 1}
	progression_debug_process_structure <...>
	change \{game_progress_debug_active = 0}
	wait \{2
		seconds}
	setbuttoneventmappings \{unblock_menu_input}
	game_progress_debug_menu_kill
endscript

script game_progress_write_achievement 
	writeachievements achievement = <achievement>
endscript

script game_progress_create_permanent_compass_blips 
	if NOT iscreated \{UI_CribBlip}
		createcompositeobject \{components = [
				{
					component = compassblip
					compassbliptype = home
				}
			]
			params = {
				name = UI_CribBlip
				pos = (382.7477, 4.1782, -307.17062)
			}}
	endif
endscript

script game_progress_destroy_permanent_compass_blips 
	if iscreated \{UI_CribBlip}
		UI_CribBlip :die
	endif
endscript

script chapter_1_startup 
	if gamemodeequals \{is_career}
		if NOT cd
			setglobalflag \{flag = $career_started}
			if istrue \{$entered_from_autolaunch}
				careerfunc \{func = setappropriatenodeflags}
			endif
		endif
		setglobalflag \{flag = $NO_DISPLAY_COMPASS}
		changenodeflag \{NODEFLAG_PERMANENT_PEDS
			1}
		game_progress_set_initial_unlocked_specials
	endif
endscript

script game_progress_set_initial_unlocked_specials 
	<locked_tricks> = {
		Trick_NTTSpecial
		Trick_NailTheGrab
		Trick_NTMSpecial
		Trick_NoComplyManual
		Trick_MoshManual
		Trick_BoardslideHandDrag
		Trick_BoardslideBodyVarial
		Trick_RocketBackflip
		Trick_WaxTheRail
	}
	GetConfigurableTricksFromType special
	getarraysize <configurabletricks>
	<i> = 0
	begin
	<trick> = (<configurabletricks> [<i>])
	if NOT structurecontains structure = <locked_tricks> <trick>
		careerfunc func = setspecialtricklocked params = {trick_id = <trick> locked = false}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<purchased_tricks> = [
		Trick_The900
		Trick_NosegrabManual
		Trick_Darkslide
		Trick_NTTSpecial
		Trick_NailTheGrab
		Trick_NTMSpecial
		Trick_NoComplyManual
		Trick_MoshManual
		Trick_BoardslideHandDrag
		Trick_BoardslideBodyVarial
		Trick_RocketBackflip
		Trick_WaxTheRail
	]
	getarraysize <purchased_tricks>
	<i> = 0
	begin
	<trick> = (<purchased_tricks> [<i>])
	careerfunc func = setspecialtrickpurchased params = {trick_id = <trick> purchased = true}
	<i> = (<i> + 1)
	repeat <array_size>
endscript
test_lifestyle_display = 0

script test_lifestyle_weight {weight_script = game_progress_get_lifestyle_weighting
	}
	if screenelementexists id = test_lifestyle_weight_container
		destroyscreenelement id = test_lifestyle_weight_container
	endif
	<max_width> = (200.0, 0.0)
	<bar_height> = (0.0, 20.0)
	createscreenelement {
		id = test_lifestyle_weight_container
		parent = root_window
		type = containerelement
		pos = (160.0, 50.0)
		just = [left top]
		z_priority = 1000
	}
	if checksumequals a = <weight_script> b = game_progress_get_lifestyle_weighting
		<text> = "Lifestyle Alignment:"
	else
		<text> = "Lifestyle Ped Attract:"
	endif
	createscreenelement {
		parent = test_lifestyle_weight_container
		type = textelement
		just = [left top]
		font = text_a1
		scale = (0.75, 0.62)
		pos = (-80.0, -25.0)
		rgba = [128 128 128 255]
		text = <text>
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		parent = test_lifestyle_weight_container
		type = spriteelement
		pos = (-100.0, -2.0)
		just = [left top]
		texture = white
		dims = (<max_width> + (100.0, 146.0))
		rgba = [32 32 32 255]
		z_priority = 999
	}
	<general_bar_params> = {
		parent = test_lifestyle_weight_container
		type = spriteelement
		just = [left top]
		texture = white
		dims = (100.0, 20.0)
	}
	<general_bar_text_params> = {
		type = textelement
		just = [right top]
		font = text_a1
		scale = (1.0, 0.62)
		pos = (-10.0, 0.0)
	}
	createscreenelement {
		id = tlw_career
		pos = (0.0, 0.0)
		rgba = ($goal_career_ui_scheme.main)
		<general_bar_params>
	}
	createscreenelement {
		parent = <id>
		rgba = ($goal_career_ui_scheme.main)
		text = "0.0"
		<general_bar_text_params>
	}
	createscreenelement {
		id = tlw_hardcore
		pos = (0.0, 30.0)
		rgba = ($goal_hardcore_ui_scheme.main)
		<general_bar_params>
	}
	createscreenelement {
		parent = <id>
		rgba = ($goal_hardcore_ui_scheme.main)
		text = "0.0"
		<general_bar_text_params>
	}
	createscreenelement {
		id = tlw_rigger
		pos = (0.0, 60.0)
		rgba = ($goal_rigger_ui_scheme.main)
		<general_bar_params>
	}
	createscreenelement {
		parent = <id>
		rgba = ($goal_rigger_ui_scheme.main)
		text = "0.0"
		<general_bar_text_params>
	}
	createscreenelement {
		id = tlw_generic
		pos = (0.0, 90.0)
		rgba = ($goal_generic_ui_scheme.main)
		<general_bar_params>
	}
	createscreenelement {
		parent = <id>
		rgba = ($goal_generic_ui_scheme.main)
		text = "0.0"
		<general_bar_text_params>
	}
	createscreenelement {
		id = tlw_total
		pos = (0.0, 120.0)
		rgba = [192 192 192 255]
		<general_bar_params>
	}
	createscreenelement {
		parent = <id>
		rgba = [192 192 192 255]
		text = "0.0"
		<general_bar_text_params>
	}
	begin
	if ($test_lifestyle_display = 0)
		if screenelementexists id = test_lifestyle_weight_container
			destroyscreenelement id = test_lifestyle_weight_container
		endif
		return
	endif
	none = {
		num_goals = 118
		num_goals_beaten = 1
		beaten_percent = 0.01
		num_tracks = 0
		num_tracks_beaten = 0
		num_tracks_beaten_percent = 0.0
	}
	career = {
		num_goals = 24
		num_goals_beaten = 11
		beaten_percent = 0.46
		num_tracks = 3
		num_tracks_beaten = 1
		num_tracks_beaten_percent = 0.33
	}
	hardcore = {
		num_goals = 16
		num_goals_beaten = 0
		beaten_percent = 0.0
		num_tracks = 3
		num_tracks_beaten = 0
		num_tracks_beaten_percent = 0.0
	}
	rigger = {
		num_goals = 17
		num_goals_beaten = 0
		beaten_percent = 0.1
		num_tracks = 3
		num_tracks_beaten = 0
		num_tracks_beaten_percent = 0.0
	}
	<weight_script> {
	}
	<dims> = ((<career_weight> * <max_width>) + <bar_height>)
	formattext textname = text "%w" w = <career_weight> decimalplaces = 2
	setscreenelementprops id = tlw_career scale = (1.0, 1.0) dims = <dims>
	setscreenelementprops id = {tlw_career child = 0} text = <text>
	<dims> = ((<hardcore_weight> * <max_width>) + <bar_height>)
	formattext textname = text "%w" w = <hardcore_weight> decimalplaces = 2
	setscreenelementprops id = tlw_hardcore scale = (1.0, 1.0) dims = <dims>
	setscreenelementprops id = {tlw_hardcore child = 0} text = <text>
	<dims> = ((<rigger_weight> * <max_width>) + <bar_height>)
	formattext textname = text "%w" w = <rigger_weight> decimalplaces = 2
	setscreenelementprops id = tlw_rigger scale = (1.0, 1.0) dims = <dims>
	setscreenelementprops id = {tlw_rigger child = 0} text = <text>
	if NOT gotparam generic_weight
		<generic_weight> = 0.0
	endif
	<dims> = ((<generic_weight> * <max_width>) + <bar_height>)
	formattext textname = text "%w" w = <generic_weight> decimalplaces = 2
	setscreenelementprops id = tlw_generic scale = (1.0, 1.0) dims = <dims>
	setscreenelementprops id = {tlw_generic child = 0} text = <text>
	<dims> = ((<total_progression> * <max_width>) + <bar_height>)
	formattext textname = text "%w" w = <total_progression> decimalplaces = 2
	setscreenelementprops id = tlw_total scale = (1.0, 1.0) dims = <dims>
	setscreenelementprops id = {tlw_total child = 0} text = <text>
	wait 2 gameframes
	repeat
endscript

script debug_beat_all_goals grade = 1
	change game_progress_debug_active = 1
	<pak_status> = [has_pak pakless]
	<pak_idx> = 0
	begin
	gman_getgoalsbypak pak = (<pak_status> [<pak_idx>])
	if (<goals_by_pak_size> > 0)
		<i> = 0
		begin
		<goal_id> = (<goals_by_pak> [<i>])
		gman_getgoalstring goal = <goal_id>
		printf "DEBUG BEAT: %s" s = <goal_string>
		careerfunc func = fakebeatprogressiongoal params = {goal_id = <goal_id> goal_grade = <grade>}
		wait 1 gameframe
		<i> = (<i> + 1)
		repeat <goals_by_pak_size>
	endif
	<pak_idx> = (<pak_idx> + 1)
	repeat 2
	careerfunc func = updateatoms
	wait 5 gameframes
	change game_progress_debug_active = 0
endscript

script sk9_sponsor_check_atom \{cash = 100
		show_explanation = 0
		type = Clothing_Accessories}
	careerfunc func = AddCash params = {cash = <cash>}
	if ($game_progress_debug_active = 1)
		return
	endif
	printf \{'-- sk9_sponsor_check_atom'}
	spawnscriptnow sk9_sponsor_check_ui params = {cash = <cash> type = <type> written_cash_text = <written_cash_text> show_explanation = <show_explanation>}
endscript

script sk9_sponsor_check_ui written_cash_text = "One hundred dollars and zero cents"
	printf '-- sk9_sponsor_check_ui'
	begin
	if IsScreenClear
		break
	endif
	wait 2 gameframes
	repeat
	root_window :settags menu_state = on
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> display_name
	careerfunc func = getsponsor params = {type = <type>}
	getlocalsystemtime
	<human_month> = (<localsystemtime>.month + 1)
	if NOT ispal
		formattext textname = date_text "%m/%d/%y" m = <human_month> d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	else
		formattext textname = date_text "%d/%m/%y" m = <human_month> d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	endif
	formattext textname = cash_text "$%c" c = <cash>
	load_sponsor_logos_pak
	goal_presentation_pause
	if screenelementexists id = sponsor_check_anchor
		destroyscreenelement id = sponsor_check_anchor
	endif
	createscreenelement {
		id = sponsor_check_anchor
		type = containerelement
		parent = root_window
		event_handlers = [
			{pad_choose launchevent params = {broadcast type = sponsor_check_dismissed}}
		]
	}
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	createscreenelement {
		id = sponsor_check_image_anchor
		type = containerelement
		parent = sponsor_check_anchor
		pos = (640.0, 360.0)
		z_priority = 1
		just = [center center]
	}
	createscreenelement {
		parent = sponsor_check_image_anchor
		type = spriteelement
		texture = check
		dims = (512.0, 256.0)
	}
	createscreenelement {
		parent = sponsor_check_image_anchor
		type = spriteelement
		texture = (<sponsor_info>.texture)
		pos = (-220.0, -40.0)
		dims = (108.0, 54.0)
		z_priority = 3
		just = [left bottom]
	}
	createscreenelement {
		parent = sponsor_check_image_anchor
		type = textelement
		font = text_a1
		text = <date_text>
		pos = (112.0, -43.0)
		z_priority = 3
		scale = 0.5
		rgba = [0 0 0 255]
		just = [left bottom]
	}
	createscreenelement {
		parent = sponsor_check_image_anchor
		type = textelement
		font = text_a1
		text = <display_name>
		pos = (-160.0, -7.0)
		z_priority = 3
		scale = 0.6
		rgba = [0 0 0 255]
		just = [left bottom]
	}
	createscreenelement {
		parent = sponsor_check_image_anchor
		type = textelement
		font = text_a1
		text = <cash_text>
		pos = (127.0, -3.0)
		z_priority = 3
		scale = 0.6
		rgba = [0 0 0 255]
		just = [left bottom]
	}
	createscreenelement {
		parent = sponsor_check_image_anchor
		type = textelement
		font = text_a1
		text = <written_cash_text>
		pos = (-220.0, 18.0)
		z_priority = 3
		scale = 0.5
		rgba = [0 0 0 255]
		just = [left bottom]
	}
	if (<show_explanation> = 1)
		if screenelementexists id = sponsor_check_explanation
			destroyscreenelement id = sponsor_check_explanation
		endif
		createscreenelement {
			id = sponsor_check_explanation
			type = containerelement
			parent = root_window
			pos = (640.0, 610.0)
			just = [center top]
			internal_just = [center top]
		}
		createscreenelement {
			type = spriteelement
			parent = sponsor_check_explanation
			dims = (1280.0, 170.0)
			pos = (0.0, 50.0)
			rgba = [45 45 45 255]
		}
		createscreenelement {
			parent = sponsor_check_explanation
			type = textelement
			font = text_a1
			text = "You got a sponsor check for completing goals."
			z_priority = 3
			scale = 0.75
			rgba = [200 200 200 255]
		}
	endif
	sponsor_check_image_anchor :domorph {
		scale = 0.1
		rot_angle = -900
		time = 0
	}
	soundevent event = General_Goal_Success_Sound_sfx success_sfx_type = none
	sponsor_check_image_anchor :domorph {
		scale = 1.3
		rot_angle = RandomRange (-12.0, 12.0)
		time = 0.85
	}
	create_helper_text parent = sponsor_check_anchor helper_text_elements = [{text = "\\m0 continue"}]
	launchevent type = focus target = sponsor_check_anchor
	block untilevent = sponsor_check_dismissed
	fadetoblack on alpha = 1 time = 0.2
	if screenelementexists id = sponsor_check_anchor
		destroyscreenelement id = sponsor_check_anchor
	endif
	if screenelementexists id = sponsor_check_explanation
		destroyscreenelement id = sponsor_check_explanation
	endif
	unload_sponsor_logos_pak
	Destroy_MenuFx time = 0.2
	fadetoblack off time = 0.2 no_wait
	goal_presentation_unpause
	root_window :settags menu_state = off
endscript

script sk9_secret_area_unlock_check 
	if gamemodeequals is_career
		get_game_area_locked_state game_area = philly_dc_subway
		<dc_philly_unlocked> = <locked_state>
		get_game_area_locked_state game_area = philly_balt_bridge
		<philly_balt_unlocked> = <locked_state>
		get_game_area_locked_state game_area = balt_dc_bridge
		<balt_dc_unlocked> = <locked_state>
		if ((<dc_philly_unlocked> = unlocked) &&
				(<philly_balt_unlocked> = unlocked) &&
				(<balt_dc_unlocked> = unlocked))
			changenodeflag nodeflag_z_secret_lock 0
			changenodeflag nodeflag_z_secret_unlock 1
			changenodeflag nodeflag_z_secret_lock_wp 0
			changenodeflag nodeflag_z_secret_unlock_wp 1
		else
			changenodeflag nodeflag_z_secret_lock 1
			changenodeflag nodeflag_z_secret_unlock 0
			changenodeflag nodeflag_z_secret_lock_wp 1
			changenodeflag nodeflag_z_secret_unlock_wp 0
		endif
	endif
endscript

script game_atoms_movie_call moviename = 'newstory_C2' bg_music = 1
	if istrue $game_progress_debug_active
		return
	endif
	begin
	if IsScreenClear
		break
	endif
	wait 2 gameframes
	repeat
	root_window :settags menu_state = on
	if screenelementexists id = net_view_goals_searching_cont
		destroyscreenelement id = net_view_goals_searching_cont
	endif
	goal_presentation_pause
	fadetoblack on alpha = 1 time = 0.23 z_priority = -200
	wait 0.26 seconds ignoreslomo
	igc_temporarily_disable_rendering 3 gameframes
	if (<bg_music> = 0)
		goal_presentation_disable_music
	endif
	killallmovies blocking
	playmovie {
		movie = <moviename>
		textureslot = 0
		texturepri = -100
		start_frame = 0
		no_hold
		no_looping
	}
	spawnscriptnow goal_generic_video_pad_handler
	create_helper_text {
		helper_text_elements = [
			{text = "\\m0 continue"}
		]
	}
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	if screenelementexists id = goal_generic_video_wait_anchor
		destroyscreenelement id = goal_generic_video_wait_anchor
	endif
	if (<bg_music> = 0)
		goal_presentation_restore_music
	endif
	fadetoblack off time = 0.25
	root_window :settags menu_state = off
	if gotparam unlock_flag
		setglobalflag flag = (<unlock_flag>)
	endif
	goal_presentation_unpause
endscript

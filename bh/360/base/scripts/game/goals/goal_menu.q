
script goal_generic_view_goal_pausemenu \{z_priority = 0
		parent = root_window
		skate9_arcade_hack = 0}
	RequireParams \{[
			goal
		]
		all}
	if NOT goal_get_title goal = <goal>
		<view_goals_title> = qs(0x44b6cf9f)
	endif
	if goal_get_descrip_list goal = <goal>
		<view_goals_dialog> = qs(0x00000000)
	else
		<view_goals_dialog> = qs(0x00000000)
	endif
	if NOT get_goal_am_pro_sick_text goal = <goal>
		<view_goals_text_am> = qs(0x00000000)
		<view_goals_text_pro> = qs(0x00000000)
		<view_goals_text_sick> = qs(0x00000000)
	endif
	if (<skate9_arcade_hack> = 1)
		<view_goals_dialog> = qs(0xcbaa34fa)
	endif
	goal_generic_view_goal_pausemenu_display {
		goal = <goal>
		Title = <view_goals_title>
		dialog_text = <view_goals_dialog>
		descrip_list = <view_goals_descrip_list>
		am_text = <view_goals_text_am>
		pro_text = <view_goals_text_pro>
		sick_text = <view_goals_text_sick>
		z_priority = <z_priority>
		parent = <parent>
	}
endscript

script goal_generic_view_goal_pausemenu_display \{z_priority = 0}
	RequireParams \{[
			Title
			dialog_text
			am_text
			pro_text
			sick_text
		]
		all}
	GetLowerCaseString <Title>
	<Title> = <LowerCaseString>
	goal_generic_view_goal_pausemenu_kill
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		id = goal_view_goal_anchor
		Pos = (900.0, 20.0)
		scale = 1
		z_priority = <z_priority>
	}
	if NOT GotParam \{arcade}
		CreateScreenElement {
			type = SpriteElement
			parent = goal_view_goal_anchor
			texture = cap_whitenoise
			Pos = (55.0, 115.0)
			just = [center center]
			dims = (650.0, 105.0)
			rgba = [220 220 220 215]
			rot_angle = 4
			z_priority = (<z_priority> + 2)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = goal_view_goal_anchor
			texture = cap_whitenoise
			Pos = (140.0, 580.0)
			just = [center center]
			dims = (700.0, 200.0)
			rgba = [200 200 200 135]
			rot_angle = -34
			z_priority = (<z_priority> + 2)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = goal_view_goal_anchor
			texture = cap_whitenoise
			Pos = (-170.0, 600.0)
			just = [center center]
			dims = (400.0, 370.0)
			rgba = [180 180 180 95]
			rot_angle = -90
			z_priority = (<z_priority> + 2)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = goal_view_goal_anchor
			texture = menu_headerbar
			Pos = (45.0, 120.0)
			just = [center center]
			dims = (640.0, 105.0)
			rgba = ($goal_ui_scheme.main)
			z_priority = (<z_priority> + 1)
		}
		ui_create_messy_background {
			parent = goal_view_goal_anchor
			dims = (800.0, 585.0)
			Pos = (-320.0, 85.0)
			z_priority = (<z_priority> - 5)
			rot_angle = 7.5
		}
	else
		SetScreenElementProps \{id = goal_view_goal_anchor
			z_priority = 100}
		LegacyDoScreenElementMorph \{id = goal_view_goal_anchor
			Pos = {
				(0.0, -25.0)
				relative
			}}
		<z_priority> = 100
		arcade = {arcade}
	endif
	CreateScreenElement {
		type = TextElement
		parent = goal_view_goal_anchor
		id = goal_view_goal_title
		text = <Title>
		font = text_a1
		Pos = (-220.0, 100.0)
		scale = (1.1, 0.85)
		rgba = [220 220 220 255]
		shadow
		shadow_rgba = [10 10 10 255]
		shadow_offs = (2.0, 2.0)
		z_priority = (<z_priority> + 10)
		font_spacing = 2
		just = [left center]
		internal_just = [left top]
	}
	GetScreenElementDims id = <id>
	if (<width> > 480)
		<scale> = ((480.0 / <width>) * (1.1, 0.85))
		LegacyDoScreenElementMorph id = <id> time = 0 scale = <scale>
	endif
	if GotParam \{arcade}
		GetScreenElementDims id = <id>
		goal_arcade_menu_bg {
			parent = goal_view_goal_anchor
			local_id = Bg
			Pos = (((0.5, 0.0) * <width>) + (-220.0, 100.0))
			width = (<width> + 40)
			height = (<height> + 20)
			z_priority = 1
			Bg_rgba = [60 170 255 100]
		}
		goal_arcade_menu_bg {
			parent = goal_view_goal_anchor
			local_id = shadow
			width = (<width> + 40)
			height = (<height> + 20)
			z_priority = 0
			Pos = (((0.5, 0.0) * <width>) + (-218.0, 102.0))
			fg_rgba = [0 0 0 255]
			noBG
		}
	endif
	<descrip_height> = (0.0, 260.0)
	if GotParam \{descrip_list}
		goal_show_descrip_list {
			parent = goal_view_goal_anchor
			Pos = (-220.0, 135.0)
			goal = <goal>
			<arcade>
		}
		GetScreenElementDims \{id = view_goals_descrip_list_anchor}
		<descrip_height> = ((0.0, 1.0) * <height> + (0.0, 135.0))
	else
		CreateScreenElement {
			type = TextBlockElement
			parent = goal_view_goal_anchor
			text = <dialog_text>
			font = text_a1
			Pos = (-220.0, 135.0)
			scale = (0.7, 0.6)
			rgba = [128 128 128 255]
			shadow
			shadow_rgba = [10 10 10 255]
			shadow_offs = (2.5, 2.5)
			z_priority = (<z_priority> + 10)
			dims = (700.0, 0.0)
			just = [left top]
			font_spacing = 3
			internal_just = [left top]
			allow_expansion
		}
		GetScreenElementDims id = <id>
		<descrip_height> = ((0.0, 1.0) * <height> + (0.0, 145.0))
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = goal_view_goal_anchor
		texture = menu_goal_underline
		Pos = ((20.0, 0.0) + <descrip_height>)
		just = [center center]
		dims = (520.0, 8.0)
		rgba = [128 128 128 255]
		z_priority = (<z_priority> + 2)
	}
	if GotParam \{goal}
		GMan_GetGrade goal = <goal>
	endif
	<padding> = 8
	<text_height> = 0
	if GotParam \{return_params}
		<text_height> = (<text_height> + <return_params>.text_height + <padding>)
		RemoveParameter \{return_params}
	endif
	if GotParam \{return_params}
		<text_height> = (<text_height> + <return_params>.text_height + <padding>)
		RemoveParameter \{return_params}
	endif
endscript

script goal_generic_view_goal_pausemenu_kill 
	if ScreenElementExists \{id = goal_view_goal_anchor}
		DestroyScreenElement \{id = goal_view_goal_anchor}
	endif
endscript

script goal_get_descrip_list 
	RequireParams \{[
			goal
		]
		all}
	if NOT GotParam \{checkpoint}
		GMan_GetCurrentCheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if StructureContains structure = <checkpoint_ui> view_goals_descrip_list
			return true view_goals_descrip_list = (<checkpoint_ui>.view_goals_descrip_list)
		endif
	endif
	return \{false}
endscript

script get_goal_am_pro_sick_text 
	RequireParams \{[
			goal
		]
		all}
	if NOT GotParam \{checkpoint}
		GMan_GetCurrentCheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if goal_get_checkpoint_ui goal = <goal> checkpoint = <checkpoint>
		if StructureContains structure = <checkpoint_ui> view_goals_text_am
			if StructureContains structure = <checkpoint_ui> view_goals_text_pro
				if StructureContains structure = <checkpoint_ui> view_goals_text_sick
					return {
						true
						view_goals_text_am = (<checkpoint_ui>.view_goals_text_am)
						view_goals_text_pro = (<checkpoint_ui>.view_goals_text_pro)
						view_goals_text_sick = (<checkpoint_ui>.view_goals_text_sick)
					}
				endif
			endif
		endif
	endif
	GMan_GetConstants goal = <goal>
	if GotParam \{view_goals_text_am}
		if GotParam \{view_goals_text_pro}
			if GotParam \{view_goals_text_sick}
				return {
					true
					view_goals_text_am = <view_goals_text_am>
					view_goals_text_pro = <view_goals_text_pro>
					view_goals_text_sick = <view_goals_text_sick>
				}
			endif
		endif
	endif
	return \{false}
endscript

script goal_generic_view_goal_focus 
	ui_kill_message_hack \{id = ui_alert_uber}
	StartRendering
	wait \{1
		second}
	if ScreenElementExists \{id = goal_classic_mode_view_goals_vmenu}
		LaunchEvent \{type = focus
			target = goal_classic_mode_view_goals_vmenu}
	endif
endscript
view_goal_info_exiting = 0

script goal_generic_exit_menu \{do_pause = 1}
	Change \{view_goal_info_exiting = 1}
	if ScreenElementExists \{id = goal_view_goal_anchor}
		DestroyScreenElement \{id = goal_view_goal_anchor}
	endif
	if ScreenElementExists \{id = goal_classic_mode_view_bg_anchor}
		DestroyScreenElement \{id = goal_classic_mode_view_bg_anchor}
	endif
	if GotParam \{callback_Script}
		<callback_Script> <callback_params>
	endif
	begin
	if GMan_GoalIsFinishedDeactivating goal = <goal>
		break
	endif
	wait \{2
		gameframes}
	repeat
	if (<do_pause> = 1)
		enable_pause
		show_all_hud_items
	endif
	Change \{view_goal_info_exiting = 0}
endscript

script goal_generic_video_pad_handler 
	if ScreenElementExists \{id = goal_generic_video_wait_anchor}
		DestroyScreenElement \{id = goal_generic_video_wait_anchor}
	endif
	wait \{1
		second}
	CreateScreenElement \{type = ContainerElement
		id = goal_generic_video_wait_anchor
		parent = root_window
		event_handlers = [
			{
				pad_choose
				goal_generic_video_kill_button
			}
			{
				pad_start
				goal_generic_video_kill_button
			}
		]}
	LaunchEvent \{type = focus
		target = goal_generic_video_wait_anchor}
endscript

script goal_generic_video_kill_button 
	KillMovie \{TextureSlot = 0}
	skater :Input_Debounce \{x
		time = 0.25}
	Die
endscript

script goal_generic_exit_menu_and_restart 
	GMan_SetData goal = <goal> params = {goal_no_end_messages_during_retry = 1}
	Change \{dont_create_speech_boxes = 1}
	goal_generic_exit_menu <...>
	GMan_SetData goal = <goal> params = {goal_no_end_messages_during_retry = 0}
	goal_retry_last_goal
endscript

script goal_generic_view_leaderboard 
	printf \{'--- goal_generic_view_leaderboard'}
	if NOT GotParam \{from_view_goals}
		unpauseskaters
		pauseskaters
	endif
	if GotParam \{finish_goal}
		back_to_game = back_to_game
		helper_text_to_game = helper_text_to_game
	endif
	Change \{current_leaderboard_type = me}
	goal_get_leaderboard_columns goal = <goal>
	GMan_GetGoalType goal = <goal>
	Change current_leaderboard_goal_type = <goal_type>
	request_leaderboard leaderboard_id = <goal> <back_to_game> <helper_text_to_game> <...> columns = <leaderboard_columns> leaderboard_type = <goal_type> listtype = me do_pause = <do_pause>
endscript

script goal_failed_retry_options \{txt = qs(0xfe82a453)}
	RequireParams \{[
			goal
		]
		all}
	if NOT IsSoundEventPlaying \{GoalFail_NoMusicMessing}
		if NOT IsSoundEventPlaying \{GoalUtils_SFX_FailGoal}
			SoundEvent \{event = GoalFail_NoMusicMessing}
		endif
	endif
	GMan_PauseAllGoals
	skater :KillSkater \{no_node}
	skater :PausePhysics
	skater :DisablePlayerInput
	disable_pause
	PauseGame
	<retry_text> = qs(0xd2e7f2b2)
	GMan_GetGoalType goal = <goal>
	if (<goal_type> = classic)
		if GMan_GetData goal = <goal> name = ended_from_end_run
			if (<ended_from_end_run> = false)
				<retry_text> = qs(0xb35ee5df)
			endif
		endif
	endif
	create_dialog_box {
		Title = qs(0x5c9b76c1)
		text = <txt>
		Pos = (320.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 255]
		text_scale = 0.6
		buttons = [
			{font = text_a1 text = <retry_text> pad_choose_script = goal_failed_retry_current}
			{font = text_a1 text = qs(0x67d9c56d) pad_choose_script = goal_failed_quit pad_choose_params = {goal = <goal>}}
		]
	}
	ui_kill_message_hack \{id = ui_alert_uber}
	StartRendering
endscript

script goal_failed_retry_current 
	dialog_box_exit
	skater :UnPausePhysics
	skater :EnablePlayerInput
	skater :KillSkater \{no_node}
	enable_pause
	GMan_UnPauseAllGoals
	UnpauseGame
	goal_retry_current_goal
endscript

script goal_failed_retry_first 
	dialog_box_exit
	skater :UnPausePhysics
	skater :EnablePlayerInput
	skater :KillSkater \{no_node}
	enable_pause
	GMan_UnPauseAllGoals
	GMan_SpawnedSafeFailCheckpoint goal = <goal>
	UnpauseGame
	goal_retry_last_goal
endscript

script goal_failed_quit 
	dialog_box_exit
	skater :UnPausePhysics
	skater :EnablePlayerInput
	skater :KillSkater \{no_node}
	enable_pause
	GMan_UnPauseAllGoals
	UnpauseGame
	GMan_SpawnedSafeFailCheckpoint goal = <goal>
endscript

script goal_show_descrip_list \{parent = root_window
		animate = 0}
	printf \{'-- goal_show_descrip_list'}
	if NOT GotParam \{goal}
		if NOT Gman_GetActivatedGoalId
			softassert \{qs(0x32a2e0ba)}
			return
		endif
		<goal> = <activated_goal_id>
	endif
	if NOT GotParam \{checkpoint}
		GMan_GetCurrentCheckpoint goal = <goal>
		<checkpoint> = <current_checkpoint>
	endif
	if NOT GotParam \{list}
		if NOT goal_get_descrip_list goal = <goal>
			softassert qs(0xb2dbe096) c = <checkpoint>
			return
		endif
		<list> = <view_goals_descrip_list>
	endif
	if ScreenElementExists \{id = view_goals_descrip_list_anchor}
		DestroyScreenElement \{id = view_goals_descrip_list_anchor}
	endif
	CreateScreenElement {
		id = view_goals_descrip_list_anchor
		type = vmenu
		parent = <parent>
		Pos = <Pos>
		just = [left top]
		internal_just = [left top]
	}
	color_Params = {}
	if GotParam \{arcade}
		color_Params = {has_rgba = $goal_arcade_text_unfocus}
	endif
	begin
	if GetNextArrayElement <list> index = <index>
		goal_show_list_item {
			<element>
			sub_goal_info = <sub_goal_info>
			goal = <goal>
			checkpoint = <checkpoint>
			<color_Params>
		}
	else
		break
	endif
	repeat
	SetScreenElementLock \{id = view_goals_descrip_list_anchor
		on}
	SetScreenElementLock \{id = view_goals_descrip_list_anchor
		off}
	if (<animate> = 1)
		spawnscriptnow goal_animate_descrip_list params = {
			list = <list>
			element = <element>
			goal = <goal>
			checkpoint = <checkpoint>
		}
	endif
endscript

script goal_animate_descrip_list 
	printf \{'-- goal_animate_descrip_list'}
	wait \{0.5
		seconds
		ignoreslomo}
	begin
	if GetNextArrayElement <list> index = <index>
		goal_cross_out_list_item <element> goal = <goal> checkpoint = <checkpoint> index = <index>
	else
		break
	endif
	repeat
endscript

script goal_show_list_item \{has_rgba = [
			128
			128
			128
			255
		]
		not_rgba = [
			200
			200
			200
			255
		]}
	printf \{'-- goal_show_list_item'}
	RequireParams \{[
			goal
		]
		all}
	if GMan_FlagFunc func = is_set goal = <goal> checkpoint = <checkpoint> tool = <flag_tool> params = {flag = <flag>}
		CreateScreenElement {
			type = TextElement
			parent = view_goals_descrip_list_anchor
			font = text_a1
			text = <text>
			rgba = <has_rgba>
			scale = (0.75, 0.65000004)
		}
	else
		CreateScreenElement {
			type = TextElement
			parent = view_goals_descrip_list_anchor
			font = text_a1
			text = <text>
			rgba = <not_rgba>
			scale = (0.75, 0.65000004)
		}
	endif
	GetScreenElementDims id = <id>
	if (<width> > 475)
		<scale> = ((475.0 / <width>) * (0.75, 0.65000004))
		LegacyDoScreenElementMorph id = <id> time = 0 scale = <scale>
	endif
endscript

script goal_cross_out_list_item 
	printf \{'-- goal_cross_out_list_item'}
	RequireParams \{[
			goal
		]
		all}
	if GMan_FlagFunc func = was_set_this_try goal = <goal> checkpoint = <checkpoint> tool = <flag_tool> params = {flag = <flag>}
		ResolveScreenElementID id = {view_goals_descrip_list_anchor child = <index>}
		if GotParam \{resolved_id}
			GetScreenElementDims id = <resolved_id>
			CreateScreenElement {
				type = SpriteElement
				parent = <resolved_id>
				Pos = (0.0, 18.0)
				rgba = ($goal_ui_scheme.main)
				scale = (0.0, 2.0)
				texture = white
				just = [left top]
			}
			<strike_id> = <id>
			<strike_id> :LegacyDoMorph scale = (<width> * (0.34, 0.0) + (0.0, 2.0)) time = 0.25
			GMan_GetGoalType goal = <goal>
			if checksumequals a = <goal_type> b = classic
				if GMan_GetData goal = <goal> name = goal_classic_achieved_pro
					if (<goal_classic_achieved_pro> = 1)
						return
					endif
				endif
				GMan_GetGrade goal = <goal>
				if (<grade> >= 2)
					GMan_SetData goal = <goal> params = {goal_classic_achieved_pro = 1}
				endif
				if NOT ScreenElementExists id = <resolved_id>
					return
				endif
				CreateScreenElement {
					type = TextElement
					parent = <resolved_id>
					Pos = ((1.5, 0.0) * <width> + (150.0, 25.0))
					scale = 0.2
					rgba = ($goal_ui_scheme.main)
					font = text_a1
					text = qs(0x7c7e405e)
					just = [center center]
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
				SoundEvent \{event = midgoal_rank_sfx}
				<reward_id> = <id>
				if ScreenElementExists id = <reward_id>
					<reward_id> :LegacyDoMorph scale = 1.4 time = 0.25
				endif
				if ScreenElementExists id = <reward_id>
					<reward_id> :LegacyDoMorph scale = 0.9 time = 0.1
				endif
				if ScreenElementExists id = <reward_id>
					RunScriptOnScreenElement id = <reward_id> goal_cross_out_list_item_fade_and_die
				endif
			endif
		endif
	endif
endscript

script goal_cross_out_list_item_fade_and_die 
	wait \{1
		second
		ignoreslomo}
	LegacyDoMorph \{alpha = 0.0
		time = 0.5}
	Die
endscript

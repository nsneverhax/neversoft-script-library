goal_presentation_hold_requests = 0
goal_playing_presentation = 0
goal_option_replay_presentation = 0
goal_presentation_waiting_for_start = 0

script goal_presentation_pause 
	disable_pause
	do_actual_pause
	hide_all_hud_sprites
	unpausespawnedscript \{igc_temporarily_disable_rendering_with_wait}
endscript

script goal_presentation_unpause 
	show_all_hud_sprites
	do_actual_unpause
	enable_pause
endscript

script goal_presentation_hold_skater 
	skater :KillSkater \{no_node}
	hide_all_hud_sprites
	skater :DisablePlayerInput
	skater :DisableCameraControl
	skater :Vibrate \{off}
	disable_pause
endscript

script goal_presentation_unhold_skater 
	show_all_hud_sprites
	skater :EnablePlayerInput
	skater :EnableCameraControl
	if NOT IsTrue \{$goal_is_between_retries}
		enable_pause
	endif
endscript

script goal_presentation_disable_music 
endscript

script goal_presentation_disable_music_arcade 
endscript

script goal_presentation_restore_music 
endscript

script goal_presentation_restore_music_arcade 
endscript

script goal_presentation_move_skater 
	goal_move_player <...>
	hide_all_hud_sprites
	skater :DisablePlayerInput
	skater :DisableCameraControl
	disable_pause
endscript

script goal_presentation_pre_start 
	disable_pause
	Change \{goal_presentation_waiting_for_start = 1}
endscript

script goal_presentation_movie_onStart 
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	if NOT goal_is_arcade_subgoal goal = <goal_id>
		goal_presentation_disable_music
	else
		goal_presentation_disable_music_arcade
	endif
	wait \{1
		gameframe}
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	<should_pause> = 0
	<should_pause> = <paused>
	if (<should_pause> = 1)
		goal_presentation_pause
	else
		goal_presentation_hold_skater
	endif
	<no_looping> = no_looping
	if GotParam \{loop}
		if (<loop> = 1)
			RemoveParameter \{no_looping}
		endif
	endif
	fadetoblack \{off
		time = 0.25
		no_wait}
	skater :Vibrate \{off}
	EnableActuators \{0}
	PlayMovie {
		movie = <movie_name>
		TextureSlot = 0
		TexturePri = -100
		<no_looping>
		nowait
		no_hold
		start_frame = <start_frame>
		loop_start = <loop_start>
		loop_end = <loop_end>
	}
	if ScreenElementExists \{id = goal_presentation_movie_bg}
		DestroyScreenElement \{id = goal_presentation_movie_bg}
	endif
	CreateScreenElement \{id = goal_presentation_movie_bg
		type = SpriteElement
		parent = root_window
		texture = white
		just = [
			left
			top
		]
		dims = (1280.0, 720.0)
		rgba = [
			0
			0
			0
			255
		]
		Pos = (0.0, 0.0)
		z_priority = -1000}
	goal_presentation_movie_update goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> movie_skippable = <skippable>
endscript

script goal_presentation_movie_update \{movie_skippable = 1}
	<movie_started> = false
	begin
	if IsMoviePlaying \{TextureSlot = 0}
		<movie_started> = true
		break
	endif
	wait \{1
		gameframe}
	repeat 30
	if checksumequals a = <movie_started> b = true
		if (<movie_skippable> = 1)
			spawnscriptnow \{goal_generic_video_pad_handler}
		endif
		begin
		if NOT IsMoviePlaying \{TextureSlot = 0}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	GMan_PresentationFunc goal = <goal> checkpoint = <checkpoint> tool = <tool> func = Stop
endscript

script goal_presentation_movie_onStop \{end_fade_in = 0}
	if ScreenElementExists \{id = goal_generic_video_wait_anchor}
		DestroyScreenElement \{id = goal_generic_video_wait_anchor}
	endif
	if NOT goal_is_arcade_subgoal goal = <goal_id>
		goal_presentation_restore_music
	else
		goal_presentation_restore_music_arcade
	endif
	goal_presentation_unpause
	goal_presentation_unhold_skater
	skater :Vibrate \{on}
	EnableActuators \{1}
	KillMovie \{TextureSlot = 0
		nowait}
	if (<end_fade_in> > 0)
		fadetoblack \{on
			time = 0.0
			alpha = 1
			no_wait}
	endif
	if ScreenElementExists \{id = goal_presentation_movie_bg}
		DestroyScreenElement \{id = goal_presentation_movie_bg}
	endif
	if (<end_fade_in> > 0)
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_description_onStart 
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	skater :Vibrate \{off}
	EnableActuators \{0}
	goal_presentation_hold_skater
	GetArraySize <data>
	goal_presentation_description_shot {
		data = <data>
		cam_iter = 0
		cam_iter_end = <array_size>
		goal_id = <goal_id>
		checkpoint_id = <checkpoint_id>
		tool_id = <tool_id>
	}
endscript
goal_presentation_sound_buss_set_active = 0

script goal_presentation_description_shot 
	RequireParams \{[
			cam_iter
			cam_iter_end
			goal_id
			checkpoint_id
			tool_id
		]
		all}
	if NOT Gman_GetActivatedGoalId
		printf 'WARNING: goal_presentation_description_shot: error, goal %g no longer activated' g = <goal_id>
		GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
		return
	endif
	if NOT checksumequals a = <activated_goal_id> b = <goal_id>
		printf 'WARNING: goal_presentation_description_shot: error, activated goal is %a now instead of %g' a = <activated_goal_id> g = <goal_id>
		GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
		return
	endif
	GMan_GetCurrentCheckpoint goal = <goal_id>
	if NOT checksumequals a = <checkpoint_id> b = <current_checkpoint>
		printf qs(0x314779fb) a = <checkpoint_id> b = <current_checkpoint>
		GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
		return
	endif
	if (<cam_iter> >= <cam_iter_end>)
		GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
		igc_temporarily_disable_rendering \{2
			gameframes}
		return
	endif
	<element> = (<data> [<cam_iter>])
	if StructureContains structure = <element> control_flag
		if NOT StructureContains structure = (<element>.control_flag) tool_name
			ScriptAssert \{qs(0x87aeac44)}
		endif
		if NOT StructureContains structure = (<element>.control_flag) flag_name
			ScriptAssert \{qs(0x9c46a4ca)}
		endif
		if GMan_FlagFunc goal = <goal_id> tool = (<element>.control_flag.tool_name) func = is_set params = {flag = (<element>.control_flag.flag_name)}
			goal_presentation_description_shot {
				cam_iter = (<cam_iter> + 1)
				cam_iter_end = <cam_iter_end>
				data = <data>
				goal_id = <goal_id>
				checkpoint_id = <checkpoint_id>
				tool_id = <tool_id>
			}
			return
		endif
	endif
	if StructureContains structure = <element> on_start_script
		spawnscriptnow (<element>.on_start_script) params = {<element> shot = <cam_iter>}
	endif
	if ScreenElementExists \{id = goal_presentation_description_pad_handler}
		DestroyScreenElement \{id = goal_presentation_description_pad_handler}
	endif
	<skippable> = 1
	<skippable> = (<element>.skippable)
	if (<skippable> = 1)
		if NOT ScreenElementExists \{id = goal_presentation_description_anchor}
			CreateScreenElement \{id = goal_presentation_description_anchor
				type = ContainerElement
				parent = root_window}
		endif
		<skip_all> = 0
		<skip_all> = (<element>.skip_all)
		if (<skip_all> = 1)
			<event_handlers> = [
				{pad_choose goal_presentation_description_skip_all params = {goal_id = <goal_id> tool_id = <tool_id> func = Stop SoundEvent = (<element>.SoundEvent)}}
			]
		else
			<event_handlers> = [
				{pad_choose goal_presentation_description_shot_kill params = {name = (<element>.name) SoundEvent = (<element>.SoundEvent)}}
			]
		endif
		CreateScreenElement {
			id = goal_presentation_description_pad_handler
			type = ContainerElement
			parent = goal_presentation_description_anchor
			event_handlers = <event_handlers>
		}
		RunScriptOnScreenElement \{id = goal_presentation_description_pad_handler
			WaitThenFocusScreenElement}
	endif
	if StructureContains structure = <element> text
		goal_presentation_description_text text = (<element>.text)
	else
		goal_presentation_description_text \{text = qs(0x00000000)}
	endif
	if StructureContains structure = <element> SoundEvent
		if NOT (($goal_presentation_sound_buss_set_active) = 1)
			Change \{goal_presentation_sound_buss_set_active = 1}
		endif
		if StructureContains structure = <element> SoundPed
			SoundEvent {
				event = (<element>.SoundEvent)
				Object = (<element>.SoundPed)
				Priority = 109
				logic_priority = 50
				dropoff_function = standard
				use_pos_info = false
				animate_mouth = true
			}
		else
			SoundEvent event = (<element>.SoundEvent)
		endif
	else
		if StructureContains structure = <element> text
			SoundEvent \{event = sk9_Double_SFX}
		endif
	endif
	if StructureContains structure = <element> morphs
		<morphs> = (<element>.morphs)
		if (<cam_iter> > 0)
			<prev_element> = (<data> [(<cam_iter> - 1)])
			if StructureContains structure = <prev_element> morphs
				GetArraySize (<prev_element>.morphs)
				if (<array_size> > 0)
					<prev_i> = (<array_size> - 1)
					begin
					<m> = (<prev_element>.morphs [<prev_i>])
					if StructureContains structure = <m> Pos
						<last_pos> = (<m>.Pos)
						<last_quat> = (<m>.Quat)
						break
					endif
					<prev_i> = (<prev_i> - 1)
					repeat <array_size>
				endif
			endif
			if GotParam \{last_pos}
				<last_morph> = [{Pos = <last_pos> Quat = <last_quat> time = 0}]
				<morphs> = (<last_morph> + <morphs>)
			endif
		endif
	endif
	PlayIGCCam {
		name = $igc_custom_camera_name
		controlscript = goal_presentation_description_shot_morphs
		controlscript = (<element>.controlscript)
		params = {morphs = <morphs>}
		exitscript = goal_presentation_description_shot
		ExitParams = {
			cam_iter = (<cam_iter> + 1)
			cam_iter_end = <cam_iter_end>
			data = <data>
			goal_id = <goal_id>
			checkpoint_id = <checkpoint_id>
			tool_id = <tool_id>
		}
	}
endscript

script goal_presentation_description_text 
	RequireParams \{[
			text
		]
		all}
	if NOT ScreenElementExists \{id = goal_presentation_description_anchor}
		CreateScreenElement \{id = goal_presentation_description_anchor
			type = ContainerElement
			parent = root_window}
	endif
	if NOT ScreenElementExists \{id = goal_presentation_bg}
		if NOT (<text> = qs(0x00000000))
			CreateScreenElement \{type = SpriteElement
				parent = goal_presentation_description_anchor
				id = goal_presentation_bg
				texture = white
				rgba = [
					0
					0
					0
					90
				]
				just = [
					left
					top
				]
				Pos = (0.0, 550.0)
				dims = (1280.0, 170.0)
				alpha = 0.0}
			LegacyDoScreenElementMorph \{id = goal_presentation_bg
				alpha = 1.0
				time = 0.2}
		endif
	endif
	if NOT ScreenElementExists \{id = goal_presentation_text}
		CreateScreenElement {
			type = TextBlockElement
			parent = goal_presentation_description_anchor
			id = goal_presentation_text
			text = <text>
			font = text_a1
			just = [center top]
			Pos = (640.0, 500.0)
			dims = (1000.0, 300.0)
			rgba = [200 200 200 255]
			scale = (0.95, 0.75)
			spacing = 0
			shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0.0
		}
		LegacyDoScreenElementMorph \{id = goal_presentation_text
			alpha = 1.0
			time = 0.2}
	else
		SetScreenElementProps {
			id = goal_presentation_text
			text = <text>
		}
	endif
endscript

script goal_presentation_description_kill_text 
	if ScreenElementExists \{id = goal_presentation_description_pad_handler}
		if ScreenElementExists \{id = goal_presentation_text}
			DestroyScreenElement \{id = goal_presentation_text}
		endif
		if ScreenElementExists \{id = goal_presentation_bg}
			DestroyScreenElement \{id = goal_presentation_bg}
		endif
	else
		if ScreenElementExists \{id = goal_presentation_description_anchor}
			DestroyScreenElement \{id = goal_presentation_description_anchor}
		endif
	endif
endscript

script goal_presentation_description_shot_morphs 
	if GotParam \{morphs}
		GetArraySize (<morphs>)
		<morph_count> = <array_size>
		<i> = 0
		if (<morph_count> > 0)
			begin
			printf 'Goal presentation: Playing IGC morph %i of %c' i = (<i> + 1) c = <morph_count>
			CCam_DoMorph {
				LockTo = World
				FOV = 72.0
				time = 0
				(<morphs> [<i>])
			}
			if StructureContains structure = (<morphs> [<i>]) time
				if ((<morphs> [<i>].time) > 0)
					CCam_WaitMorph
				endif
			endif
			<i> = (<i> + 1)
			repeat <morph_count>
		endif
	endif
endscript

script goal_presentation_description_shot_kill \{name = $igc_custom_camera_name}
	skater :Input_Debounce \{x}
	if GotParam \{SoundEvent}
		StopSoundEvent <SoundEvent>
	elseif IsSoundEventPlaying \{sk9_Double_SFX}
		StopSoundEvent \{sk9_Double_SFX}
	endif
	SoundEvent \{event = Skip_Cam_SFX}
	KillSkaterCamAnim name = <name>
	if ScreenElementExists \{id = goal_presentation_description_pad_handler}
		DestroyScreenElement \{id = goal_presentation_description_pad_handler}
	endif
endscript

script goal_presentation_description_skip_all 
	printf \{'goal_presentation_description_skip_all'}
	if GotParam \{SoundEvent}
		StopSoundEvent <SoundEvent>
	elseif IsSoundEventPlaying \{sk9_Double_SFX}
		StopSoundEvent \{sk9_Double_SFX}
	endif
	SoundEvent \{event = Skip_Cam_SFX}
	GMan_PresentationFunc goal = <goal_id> tool = <tool_id> func = Stop
endscript

script goal_presentation_description_onStop \{end_fade_in = 0}
	if ScreenElementExists \{id = goal_presentation_description_anchor}
		DestroyScreenElement \{id = goal_presentation_description_anchor}
	endif
	killspawnedscript \{name = goal_presentation_description_shot}
	goal_presentation_description_shot_kill
	if (($goal_presentation_sound_buss_set_active) = 1)
		Change \{goal_presentation_sound_buss_set_active = 0}
	endif
	skater :Vibrate \{on}
	EnableActuators \{1}
	goal_presentation_unhold_skater
	if (<end_fade_in> > 0)
		fadetoblack \{on
			alpha = 1
			time = 0}
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_cutscene_onStart 
	if ($goal_autotest_running = 1)
		GMan_PresentationFunc goal = <goal_id> tool = <tool_id> func = Stop
		return
	endif
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	UnpauseGame
	if GotParam \{ObjectAliases}
		GetArraySize \{ObjectAliases}
		if (<array_size> > 0)
			<index> = 0
			begin
			if StructureContains structure = (<ObjectAliases> [<index>]) GameObj
				if IsCreated ((<ObjectAliases> [<index>]).GameObj)
					((<ObjectAliases> [<index>]).GameObj) :Obj_SetOutlineFlag off
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if GotParam \{retry_last}
		<goal_is_retrying> = {GoalRetry}
	endif
	PlayCutscene name = <cutscene_name> ObjectAliases = <ObjectAliases> <goal_is_retrying>
	spawnscriptnow goal_presentation_cutscene_update params = {
		goal_id = <goal_id>
		tool_id = <tool_id>
		cutscene_name = <cutscene_name>
		ObjectAliases = <ObjectAliases>
	}
endscript

script goal_presentation_cutscene_update 
	WaitMovie \{name = cutscene}
	if ($goal_option_replay_presentation = 1)
		wait \{2
			seconds
			ignoreslomo}
		create_dialog_box {
			Title = qs(0x733df8df)
			text = qs(0x01400adf)
			buttons = [
				{text = qs(0x5efcce15)
					pad_choose_script = goal_presentation_cutscene_onStart
					pad_choose_params = {<...>}
				}
				{text = qs(0x0a59a215)
					pad_choose_script = GMan_PresentationFunc
					pad_choose_params = {goal = <goal_id> tool = <tool_id> func = Stop}
				}
			]
		}
	else
		GMan_PresentationFunc goal = <goal_id> tool = <tool_id> func = Stop
	endif
endscript

script goal_presentation_cutscene_onStop \{end_fade_in = 0}
	KillSkaterCamAnim \{name = cutscene}
	cutscene_subtitle_cleanup
	if (<end_fade_in> > 0)
		fadetoblack \{on
			alpha = 1
			time = 0}
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_dialogbox_onStart 
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	<remove_save_option> = false
	<remove_index> = -1
	if StructureContains structure = <data> buttons
		GetArraySize (<data>.buttons)
		if (<array_size> > 0)
			<index> = 0
			begin
			if StructureContains structure = ((<data>.buttons) [<index>]) pad_choose_params
				if StructureContains structure = (((<data>.buttons) [<index>]).pad_choose_params) action
					if IsChecksum ((((<data>.buttons) [<index>]).pad_choose_params).action)
						if checksumequals a = ((((<data>.buttons) [<index>]).pad_choose_params).action) b = save
							if NOT game_progress_has_valid_save
								<remove_save_option> = true
								<remove_index> = <index>
								break
							endif
						endif
					endif
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if (<remove_save_option> = true)
		<new_buttons> = []
		<index> = 0
		begin
		if NOT (<index> = <remove_index>)
			<temp_array> = [{}]
			SetArrayElement arrayName = temp_array index = 0 newValue = ((<data>.buttons) [<index>])
			<new_buttons> = (<new_buttons> + <temp_array>)
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		<buttons> = <new_buttons>
	else
		<buttons> = (<data>.buttons)
	endif
	create_dialog_box {
		Title = (<data>.Title)
		text = (<data>.descrip)
		buttons = <buttons>
	}
	RunScriptOnScreenElement {
		id = dialog_box_anchor
		goal_presentation_dialogbox_waitForDeath
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
endscript

script goal_presentation_dialogbox_waitForDeath 
	OnExitRun {
		goal_presentation_dialogbox_stop
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
	Block
endscript

script goal_presentation_dialogbox_stop 
	GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
endscript

script goal_presentation_dialogbox_onStop 
	goal_presentation_unpause
	ui_event \{event = menu_change
		data = {
			state = uistate_gameplay
		}}
endscript
goal_presentation_vo_curr_stream = None

script goal_presentation_vo_onStart 
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	OnExitRun {
		goal_presentation_vo_stop
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
	create_console_message \{text = qs(0xe64820c0)}
	goal_presentation_hold_skater
	if ScreenElementExists \{id = goal_presentation_vo_anchor}
		DestroyScreenElement \{id = goal_presentation_vo_anchor}
	endif
	<skippable> = 1
	if (<skippable> = 1)
		CreateScreenElement \{id = goal_presentation_vo_anchor
			type = ContainerElement
			parent = root_window
			event_handlers = [
				{
					pad_choose
					goal_presentation_vo_skip
				}
			]}
		RunScriptOnScreenElement \{id = goal_presentation_vo_anchor
			WaitThenFocusScreenElement}
		create_helper_text \{parent = goal_presentation_vo_anchor
			helper_text_elements = [
				{
					text = qs(0x3591cd35)
				}
			]}
	endif
	GetArraySize <vo_list>
	if (<array_size> > 0)
		<i> = 0
		begin
		<iter> = (<vo_list> [<i>])
		if IsStructure \{iter}
			<stream_name> = (<vo_list> [<i>].stream)
			<Object> = (<vo_list> [<i>].Object)
		else
			<stream_name> = (<vo_list> [<i>])
			<Object> = skater
		endif
		FormatText checksumname = stream_id '%s' s = <stream_name>
		if StreamExists <stream_id>
			FormatText checksumname = event 'VO_IGC_%s' s = <stream_name>
			<Object> :goal_presentation_vo_play {
				stream_string = <stream_name>
				stream = <stream_id>
				event = <event>
				Object = <Object>
			}
			wait \{2
				gameframes}
		else
			softassert qs(0x1f40bd0a) s = <stream_name>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script goal_presentation_vo_skip 
	skater :Input_Debounce \{x}
	killspawnedscript \{name = goal_presentation_vo_onStart}
	Die
endscript

script goal_presentation_vo_stop 
	GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
endscript

script goal_presentation_vo_play 
	printf \{'---------------------'}
	printf \{'goal_presentation_vo_play:'}
	printstruct <...>
	Change goal_presentation_vo_curr_stream = <stream>
	AppendSuffixToChecksum base = <event> SuffixString = '_struct'
	SoundEvent {
		event = <event>
		Object = <Object>
		dropoff_function = standard
		use_pos_info = true
		animate_mouth = false
		logic_priority = 50
	}
	printf \{'goal_presentation_vo_play - waiting for vo to finish'}
	begin
	wait \{2
		gameframes}
	if NOT issoundplaying <stream>
		break
	endif
	repeat
	Change \{goal_presentation_vo_curr_stream = None}
endscript

script goal_presentation_vo_onStop 
	if issoundplaying ($goal_presentation_vo_curr_stream)
		StopSound ($goal_presentation_vo_curr_stream)
	endif
	killspawnedscript \{name = goal_presentation_vo_play}
	killspawnedscript \{name = goal_presentation_vo_onStart}
	goal_presentation_unhold_skater
endscript

script goal_presentation_ui_onStart \{rollout_before = 0}
	if NOT GMan_GoalExists goal = <goal_id>
		return
	endif
	if NOT GMan_GetGoalState goal = <goal_id> states = [goal_activated]
		return
	endif
	if NOT StructureContains structure = <data> callback_Script
		printstruct <...>
		softassert \{'missing callback_script in goal presentation ui data'}
		return
	endif
	if (<rollout_before> = 1)
		goal_rollout_skater
	endif
	goal_presentation_hold_skater
	(<data>.callback_Script) {<data> <...>}
	if GMan_GoalExists goal = <goal_id>
		GMan_PresentationFunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = Stop
	endif
endscript

script goal_presentation_ui_onStop \{end_fade_in = 0}
	<end_fade_in> = (<data>.end_fade_in)
	goal_presentation_unhold_skater
	if (<end_fade_in> > 0)
		fadetoblack \{on
			time = 0.0
			alpha = 1
			no_wait}
		if ScreenElementExists \{id = goal_presentation_movie_bg}
			DestroyScreenElement \{id = goal_presentation_movie_bg}
		endif
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_subtitled_movie \{skippable = 0
		do_pause = true
		end_fade_in = 0}
	if (<do_pause> = true)
		OnExitRun \{goal_presentation_subtitled_movie_done}
		goal_presentation_pause
	endif
	KillAllMovies \{blocking}
	training_vid_audioparams_start
	igc_temporarily_disable_rendering \{2
		gameframes}
	fadetoblack \{off
		time = 0.25
		no_wait}
	PlaySubtitledMovie SubbedMovie = <movie>
	if ScreenElementExists \{id = goal_presentation_movie_bg}
		DestroyScreenElement \{id = goal_presentation_movie_bg}
	endif
	CreateScreenElement \{id = goal_presentation_movie_bg
		type = SpriteElement
		parent = root_window
		texture = white
		just = [
			left
			top
		]
		dims = (1280.0, 720.0)
		rgba = [
			0
			0
			0
			255
		]
		Pos = (0.0, 0.0)
		z_priority = -1000}
	wait \{0.5
		seconds
		ignoreslomo}
	if (<skippable> = 1)
		ControllerDebounce \{x}
	endif
	begin
	wait \{1
		gameframe}
	if NOT IsMoviePlaying \{TextureSlot = 0}
		training_vid_audioparams_end
		break
	else
		if (<skippable> = 1)
			if ControllerPressed \{x}
				KillSubtitledMovie SubbedMovie = <movie>
			endif
		endif
	endif
	repeat
	if (<end_fade_in> = 0)
		if ScreenElementExists \{id = goal_presentation_movie_bg}
			DestroyScreenElement \{id = goal_presentation_movie_bg}
		endif
	endif
endscript

script goal_presentation_subtitled_movie_done 
	goal_presentation_unpause
endscript

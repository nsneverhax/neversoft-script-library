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
	skater :disablecameracontrol
	skater :Vibrate \{OFF}
	disable_pause
endscript

script goal_presentation_unhold_skater 
	show_all_hud_sprites
	skater :EnablePlayerInput
	skater :enablecameracontrol
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
	skater :disablecameracontrol
	disable_pause
endscript

script goal_presentation_pre_start 
	disable_pause
	Change \{goal_presentation_waiting_for_start = 1}
endscript

script goal_presentation_movie_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	if NOT goal_is_arcade_subgoal goal = <goal_id>
		goal_presentation_disable_music
	else
		goal_presentation_disable_music_arcade
	endif
	Wait \{1
		gameframe}
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
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
	if GotParam \{Loop}
		if (<Loop> = 1)
			RemoveParameter \{no_looping}
		endif
	endif
	fadetoblack \{OFF
		time = 0.25
		no_wait}
	skater :Vibrate \{OFF}
	EnableActuators \{0}
	PlayMovie {
		movie = <movie_name>
		textureSlot = 0
		TexturePri = -100
		<no_looping>
		noWait
		no_hold
		start_frame = <start_frame>
		loop_start = <loop_start>
		loop_end = <loop_end>
	}
	if ScreenElementExists \{id = goal_presentation_movie_bg}
		DestroyScreenElement \{id = goal_presentation_movie_bg}
	endif
	CreateScreenElement \{id = goal_presentation_movie_bg
		Type = SpriteElement
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
	<movie_started> = FALSE
	begin
	if IsMoviePlaying \{textureSlot = 0}
		<movie_started> = true
		break
	endif
	Wait \{1
		gameframe}
	repeat 30
	if checksumequals a = <movie_started> b = true
		if (<movie_skippable> = 1)
			SpawnScriptNow \{goal_generic_video_pad_handler}
		endif
		begin
		if NOT IsMoviePlaying \{textureSlot = 0}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	gman_presentationfunc goal = <goal> checkpoint = <checkpoint> tool = <tool> func = stop
endscript

script goal_presentation_movie_onstop \{end_fade_in = 0}
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
	skater :Vibrate \{On}
	EnableActuators \{1}
	KillMovie \{textureSlot = 0
		noWait}
	if (<end_fade_in> > 0)
		fadetoblack \{On
			time = 0.0
			alpha = 1
			no_wait}
	endif
	if ScreenElementExists \{id = goal_presentation_movie_bg}
		DestroyScreenElement \{id = goal_presentation_movie_bg}
	endif
	if (<end_fade_in> > 0)
		fadetoblack OFF time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_description_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	skater :Vibrate \{OFF}
	EnableActuators \{0}
	goal_presentation_hold_skater
	GetArraySize <data>
	goal_presentation_description_shot {
		data = <data>
		cam_iter = 0
		cam_iter_end = <array_Size>
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
	if NOT GMan_GetActivatedGoalId
		printf 'WARNING: goal_presentation_description_shot: error, goal %g no longer activated' g = <goal_id>
		gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
		return
	endif
	if NOT checksumequals a = <activated_goal_id> b = <goal_id>
		printf 'WARNING: goal_presentation_description_shot: error, activated goal is %a now instead of %g' a = <activated_goal_id> g = <goal_id>
		gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
		return
	endif
	gman_getcurrentcheckpoint goal = <goal_id>
	if NOT checksumequals a = <checkpoint_id> b = <current_checkpoint>
		printf qs(0x314779fb) a = <checkpoint_id> b = <current_checkpoint>
		gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
		return
	endif
	if (<cam_iter> >= <cam_iter_end>)
		gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
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
		if gman_flagfunc goal = <goal_id> tool = (<element>.control_flag.tool_name) func = is_set params = {flag = (<element>.control_flag.flag_name)}
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
		SpawnScriptNow (<element>.on_start_script) params = {<element> shot = <cam_iter>}
	endif
	if ScreenElementExists \{id = goal_presentation_description_pad_handler}
		DestroyScreenElement \{id = goal_presentation_description_pad_handler}
	endif
	<skippable> = 1
	<skippable> = (<element>.skippable)
	if (<skippable> = 1)
		if NOT ScreenElementExists \{id = goal_presentation_description_anchor}
			CreateScreenElement \{id = goal_presentation_description_anchor
				Type = ContainerElement
				parent = root_window}
		endif
		<skip_all> = 0
		<skip_all> = (<element>.skip_all)
		if (<skip_all> = 1)
			<event_handlers> = [
				{pad_choose goal_presentation_description_skip_all params = {goal_id = <goal_id> tool_id = <tool_id> func = stop SoundEvent = (<element>.SoundEvent)}}
			]
		else
			<event_handlers> = [
				{pad_choose goal_presentation_description_shot_kill params = {Name = (<element>.Name) SoundEvent = (<element>.SoundEvent)}}
			]
		endif
		CreateScreenElement {
			id = goal_presentation_description_pad_handler
			Type = ContainerElement
			parent = goal_presentation_description_anchor
			event_handlers = <event_handlers>
		}
		RunScriptOnScreenElement \{id = goal_presentation_description_pad_handler
			waitthenfocusscreenelement}
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
		if StructureContains structure = <element> soundped
			SoundEvent {
				event = (<element>.SoundEvent)
				object = (<element>.soundped)
				Priority = 109
				logic_priority = 50
				dropoff_function = standard
				use_pos_info = FALSE
				animate_mouth = true
			}
		else
			SoundEvent event = (<element>.SoundEvent)
		endif
	else
		if StructureContains structure = <element> text
			SoundEvent \{event = sk9_double_sfx}
		endif
	endif
	if StructureContains structure = <element> morphs
		<morphs> = (<element>.morphs)
		if (<cam_iter> > 0)
			<prev_element> = (<data> [(<cam_iter> - 1)])
			if StructureContains structure = <prev_element> morphs
				GetArraySize (<prev_element>.morphs)
				if (<array_Size> > 0)
					<prev_i> = (<array_Size> - 1)
					begin
					<m> = (<prev_element>.morphs [<prev_i>])
					if StructureContains structure = <m> Pos
						<last_pos> = (<m>.Pos)
						<last_quat> = (<m>.Quat)
						break
					endif
					<prev_i> = (<prev_i> - 1)
					repeat <array_Size>
				endif
			endif
			if GotParam \{last_pos}
				<last_morph> = [{Pos = <last_pos> Quat = <last_quat> time = 0}]
				<morphs> = (<last_morph> + <morphs>)
			endif
		endif
	endif
	PlayIGCCam {
		Name = $igc_custom_camera_name
		controlscript = goal_presentation_description_shot_morphs
		controlscript = (<element>.controlscript)
		params = {morphs = <morphs>}
		exitscript = goal_presentation_description_shot
		exitparams = {
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
			Type = ContainerElement
			parent = root_window}
	endif
	if NOT ScreenElementExists \{id = goal_presentation_bg}
		if NOT (<text> = qs(0x00000000))
			CreateScreenElement \{Type = SpriteElement
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
			legacydoscreenelementmorph \{id = goal_presentation_bg
				alpha = 1.0
				time = 0.2}
		endif
	endif
	if NOT ScreenElementExists \{id = goal_presentation_text}
		CreateScreenElement {
			Type = TextBlockElement
			parent = goal_presentation_description_anchor
			id = goal_presentation_text
			text = <text>
			font = text_a1
			just = [center top]
			Pos = (640.0, 500.0)
			dims = (1000.0, 300.0)
			rgba = [200 200 200 255]
			Scale = (0.95, 0.75)
			spacing = 0
			Shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0.0
		}
		legacydoscreenelementmorph \{id = goal_presentation_text
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
		<morph_count> = <array_Size>
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

script goal_presentation_description_shot_kill \{Name = $igc_custom_camera_name}
	skater :Input_Debounce \{X}
	if GotParam \{SoundEvent}
		StopSoundEvent <SoundEvent>
	elseif IsSoundEventPlaying \{sk9_double_sfx}
		StopSoundEvent \{sk9_double_sfx}
	endif
	SoundEvent \{event = skip_cam_sfx}
	KillSkaterCamAnim Name = <Name>
	if ScreenElementExists \{id = goal_presentation_description_pad_handler}
		DestroyScreenElement \{id = goal_presentation_description_pad_handler}
	endif
endscript

script goal_presentation_description_skip_all 
	printf \{'goal_presentation_description_skip_all'}
	if GotParam \{SoundEvent}
		StopSoundEvent <SoundEvent>
	elseif IsSoundEventPlaying \{sk9_double_sfx}
		StopSoundEvent \{sk9_double_sfx}
	endif
	SoundEvent \{event = skip_cam_sfx}
	gman_presentationfunc goal = <goal_id> tool = <tool_id> func = stop
endscript

script goal_presentation_description_onstop \{end_fade_in = 0}
	if ScreenElementExists \{id = goal_presentation_description_anchor}
		DestroyScreenElement \{id = goal_presentation_description_anchor}
	endif
	KillSpawnedScript \{Name = goal_presentation_description_shot}
	goal_presentation_description_shot_kill
	if (($goal_presentation_sound_buss_set_active) = 1)
		Change \{goal_presentation_sound_buss_set_active = 0}
	endif
	skater :Vibrate \{On}
	EnableActuators \{1}
	goal_presentation_unhold_skater
	if (<end_fade_in> > 0)
		fadetoblack \{On
			alpha = 1
			time = 0}
		fadetoblack OFF time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_cutscene_onstart 
	if ($goal_autotest_running = 1)
		gman_presentationfunc goal = <goal_id> tool = <tool_id> func = stop
		return
	endif
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	UnPauseGame
	if GotParam \{objectaliases}
		GetArraySize \{objectaliases}
		if (<array_Size> > 0)
			<index> = 0
			begin
			if StructureContains structure = (<objectaliases> [<index>]) GameObj
				if IsCreated ((<objectaliases> [<index>]).GameObj)
					((<objectaliases> [<index>]).GameObj) :Obj_SetOutlineFlag OFF
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if GotParam \{retry_last}
		<goal_is_retrying> = {goalretry}
	endif
	playcutscene Name = <cutscene_name> objectaliases = <objectaliases> <goal_is_retrying>
	SpawnScriptNow goal_presentation_cutscene_update params = {
		goal_id = <goal_id>
		tool_id = <tool_id>
		cutscene_name = <cutscene_name>
		objectaliases = <objectaliases>
	}
endscript

script goal_presentation_cutscene_update 
	waitmovie \{Name = cutscene}
	if ($goal_option_replay_presentation = 1)
		Wait \{2
			Seconds
			ignoreslomo}
		create_dialog_box {
			title = qs(0x733df8df)
			text = qs(0x01400adf)
			buttons = [
				{text = qs(0x5efcce15)
					pad_choose_script = goal_presentation_cutscene_onstart
					pad_choose_params = {<...>}
				}
				{text = qs(0x0a59a215)
					pad_choose_script = gman_presentationfunc
					pad_choose_params = {goal = <goal_id> tool = <tool_id> func = stop}
				}
			]
		}
	else
		gman_presentationfunc goal = <goal_id> tool = <tool_id> func = stop
	endif
endscript

script goal_presentation_cutscene_onstop \{end_fade_in = 0}
	KillSkaterCamAnim \{Name = cutscene}
	cutscene_subtitle_cleanup
	if (<end_fade_in> > 0)
		fadetoblack \{On
			alpha = 1
			time = 0}
		fadetoblack OFF time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_dialogbox_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	<remove_save_option> = FALSE
	<remove_index> = -1
	if StructureContains structure = <data> buttons
		GetArraySize (<data>.buttons)
		if (<array_Size> > 0)
			<index> = 0
			begin
			if StructureContains structure = ((<data>.buttons) [<index>]) pad_choose_params
				if StructureContains structure = (((<data>.buttons) [<index>]).pad_choose_params) action
					if ischecksum ((((<data>.buttons) [<index>]).pad_choose_params).action)
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
			repeat <array_Size>
		endif
	endif
	if (<remove_save_option> = true)
		<new_buttons> = []
		<index> = 0
		begin
		if NOT (<index> = <remove_index>)
			<temp_array> = [{}]
			SetArrayElement ArrayName = temp_array index = 0 NewValue = ((<data>.buttons) [<index>])
			<new_buttons> = (<new_buttons> + <temp_array>)
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
		<buttons> = <new_buttons>
	else
		<buttons> = (<data>.buttons)
	endif
	create_dialog_box {
		title = (<data>.title)
		text = (<data>.descrip)
		buttons = <buttons>
	}
	RunScriptOnScreenElement {
		id = dialog_box_anchor
		goal_presentation_dialogbox_waitfordeath
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
endscript

script goal_presentation_dialogbox_waitfordeath 
	OnExitRun {
		goal_presentation_dialogbox_stop
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
	Block
endscript

script goal_presentation_dialogbox_stop 
	gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
endscript

script goal_presentation_dialogbox_onstop 
	goal_presentation_unpause
	ui_event \{event = menu_change
		data = {
			state = Uistate_gameplay
		}}
endscript
goal_presentation_vo_curr_stream = None

script goal_presentation_vo_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
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
			Type = ContainerElement
			parent = root_window
			event_handlers = [
				{
					pad_choose
					goal_presentation_vo_skip
				}
			]}
		RunScriptOnScreenElement \{id = goal_presentation_vo_anchor
			waitthenfocusscreenelement}
		create_helper_text \{parent = goal_presentation_vo_anchor
			helper_text_elements = [
				{
					text = qs(0x3591cd35)
				}
			]}
	endif
	GetArraySize <vo_list>
	if (<array_Size> > 0)
		<i> = 0
		begin
		<iter> = (<vo_list> [<i>])
		if isstructure \{iter}
			<stream_name> = (<vo_list> [<i>].Stream)
			<object> = (<vo_list> [<i>].object)
		else
			<stream_name> = (<vo_list> [<i>])
			<object> = skater
		endif
		formatText checksumName = stream_id '%s' s = <stream_name>
		if streamexists <stream_id>
			formatText checksumName = event 'VO_IGC_%s' s = <stream_name>
			<object> :goal_presentation_vo_play {
				stream_string = <stream_name>
				Stream = <stream_id>
				event = <event>
				object = <object>
			}
			Wait \{2
				gameframes}
		else
			SoftAssert qs(0x1f40bd0a) s = <stream_name>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script goal_presentation_vo_skip 
	skater :Input_Debounce \{X}
	KillSpawnedScript \{Name = goal_presentation_vo_onstart}
	Die
endscript

script goal_presentation_vo_stop 
	gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
endscript

script goal_presentation_vo_play 
	printf \{'---------------------'}
	printf \{'goal_presentation_vo_play:'}
	printstruct <...>
	Change goal_presentation_vo_curr_stream = <Stream>
	AppendSuffixToChecksum Base = <event> SuffixString = '_struct'
	SoundEvent {
		event = <event>
		object = <object>
		dropoff_function = standard
		use_pos_info = true
		animate_mouth = FALSE
		logic_priority = 50
	}
	printf \{'goal_presentation_vo_play - waiting for vo to finish'}
	begin
	Wait \{2
		gameframes}
	if NOT issoundplaying <Stream>
		break
	endif
	repeat
	Change \{goal_presentation_vo_curr_stream = None}
endscript

script goal_presentation_vo_onstop 
	if issoundplaying ($goal_presentation_vo_curr_stream)
		stopsound ($goal_presentation_vo_curr_stream)
	endif
	KillSpawnedScript \{Name = goal_presentation_vo_play}
	KillSpawnedScript \{Name = goal_presentation_vo_onstart}
	goal_presentation_unhold_skater
endscript

script goal_presentation_ui_onstart \{rollout_before = 0}
	if NOT gman_goalexists goal = <goal_id>
		return
	endif
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	if NOT StructureContains structure = <data> callBack_Script
		printstruct <...>
		SoftAssert \{'missing callback_script in goal presentation ui data'}
		return
	endif
	if (<rollout_before> = 1)
		goal_rollout_skater
	endif
	goal_presentation_hold_skater
	(<data>.callBack_Script) {<data> <...>}
	if gman_goalexists goal = <goal_id>
		gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
	endif
endscript

script goal_presentation_ui_onstop \{end_fade_in = 0}
	<end_fade_in> = (<data>.end_fade_in)
	goal_presentation_unhold_skater
	if (<end_fade_in> > 0)
		fadetoblack \{On
			time = 0.0
			alpha = 1
			no_wait}
		if ScreenElementExists \{id = goal_presentation_movie_bg}
			DestroyScreenElement \{id = goal_presentation_movie_bg}
		endif
		fadetoblack OFF time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_subtitled_movie \{skippable = 0
		do_pause = true
		end_fade_in = 0}
	if (<do_pause> = true)
		OnExitRun \{goal_presentation_subtitled_movie_done}
		goal_presentation_pause
	endif
	killallmovies \{blocking}
	training_vid_audioparams_start
	igc_temporarily_disable_rendering \{2
		gameframes}
	fadetoblack \{OFF
		time = 0.25
		no_wait}
	playsubtitledmovie subbedmovie = <movie>
	if ScreenElementExists \{id = goal_presentation_movie_bg}
		DestroyScreenElement \{id = goal_presentation_movie_bg}
	endif
	CreateScreenElement \{id = goal_presentation_movie_bg
		Type = SpriteElement
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
	Wait \{0.5
		Seconds
		ignoreslomo}
	if (<skippable> = 1)
		ControllerDebounce \{X}
	endif
	begin
	Wait \{1
		gameframe}
	if NOT IsMoviePlaying \{textureSlot = 0}
		training_vid_audioparams_end
		break
	else
		if (<skippable> = 1)
			if ControllerPressed \{X}
				killsubtitledmovie subbedmovie = <movie>
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

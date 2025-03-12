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
	skater :killskater \{no_node}
	hide_all_hud_sprites
	skater :disableplayerinput
	skater :disablecameracontrol
	skater :vibrate \{off}
	disable_pause
endscript

script goal_presentation_unhold_skater 
	show_all_hud_sprites
	skater :enableplayerinput
	skater :enablecameracontrol
	if NOT istrue \{$goal_is_between_retries}
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
	skater :disableplayerinput
	skater :disablecameracontrol
	disable_pause
endscript

script goal_presentation_pre_start 
	disable_pause
	change \{goal_presentation_waiting_for_start = 1}
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
	wait \{1
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
	if gotparam \{loop}
		if (<loop> = 1)
			removeparameter \{no_looping}
		endif
	endif
	fadetoblack \{off
		time = 0.25
		no_wait}
	skater :vibrate \{off}
	enableactuators \{0}
	playmovie {
		movie = <movie_name>
		textureslot = 0
		texturepri = -100
		<no_looping>
		nowait
		no_hold
		start_frame = <start_frame>
		loop_start = <loop_start>
		loop_end = <loop_end>
	}
	if screenelementexists \{id = goal_presentation_movie_bg}
		destroyscreenelement \{id = goal_presentation_movie_bg}
	endif
	createscreenelement \{id = goal_presentation_movie_bg
		type = spriteelement
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
		pos = (0.0, 0.0)
		z_priority = -1000}
	goal_presentation_movie_update goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> movie_skippable = <skippable>
endscript

script goal_presentation_movie_update \{movie_skippable = 1}
	<movie_started> = false
	begin
	if ismovieplaying \{textureslot = 0}
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
		if NOT ismovieplaying \{textureslot = 0}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	gman_presentationfunc goal = <goal> checkpoint = <checkpoint> tool = <tool> func = stop
endscript

script goal_presentation_movie_onstop \{end_fade_in = 0}
	if screenelementexists \{id = goal_generic_video_wait_anchor}
		destroyscreenelement \{id = goal_generic_video_wait_anchor}
	endif
	if NOT goal_is_arcade_subgoal goal = <goal_id>
		goal_presentation_restore_music
	else
		goal_presentation_restore_music_arcade
	endif
	goal_presentation_unpause
	goal_presentation_unhold_skater
	skater :vibrate \{on}
	enableactuators \{1}
	killmovie \{textureslot = 0
		nowait}
	if (<end_fade_in> > 0)
		fadetoblack \{on
			time = 0.0
			alpha = 1
			no_wait}
	endif
	if screenelementexists \{id = goal_presentation_movie_bg}
		destroyscreenelement \{id = goal_presentation_movie_bg}
	endif
	if (<end_fade_in> > 0)
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_description_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	skater :vibrate \{off}
	enableactuators \{0}
	goal_presentation_hold_skater
	getarraysize <data>
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
	requireparams \{[
			cam_iter
			cam_iter_end
			goal_id
			checkpoint_id
			tool_id
		]
		all}
	if NOT gman_getactivatedgoalid
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
	if structurecontains structure = <element> control_flag
		if NOT structurecontains structure = (<element>.control_flag) tool_name
			scriptassert \{qs(0x87aeac44)}
		endif
		if NOT structurecontains structure = (<element>.control_flag) flag_name
			scriptassert \{qs(0x9c46a4ca)}
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
	if structurecontains structure = <element> on_start_script
		spawnscriptnow (<element>.on_start_script) params = {<element> shot = <cam_iter>}
	endif
	if screenelementexists \{id = goal_presentation_description_pad_handler}
		destroyscreenelement \{id = goal_presentation_description_pad_handler}
	endif
	<skippable> = 1
	<skippable> = (<element>.skippable)
	if (<skippable> = 1)
		if NOT screenelementexists \{id = goal_presentation_description_anchor}
			createscreenelement \{id = goal_presentation_description_anchor
				type = containerelement
				parent = root_window}
		endif
		<skip_all> = 0
		<skip_all> = (<element>.skip_all)
		if (<skip_all> = 1)
			<event_handlers> = [
				{pad_choose goal_presentation_description_skip_all params = {goal_id = <goal_id> tool_id = <tool_id> func = stop soundevent = (<element>.soundevent)}}
			]
		else
			<event_handlers> = [
				{pad_choose goal_presentation_description_shot_kill params = {name = (<element>.name) soundevent = (<element>.soundevent)}}
			]
		endif
		createscreenelement {
			id = goal_presentation_description_pad_handler
			type = containerelement
			parent = goal_presentation_description_anchor
			event_handlers = <event_handlers>
		}
		runscriptonscreenelement \{id = goal_presentation_description_pad_handler
			waitthenfocusscreenelement}
	endif
	if structurecontains structure = <element> text
		goal_presentation_description_text text = (<element>.text)
	else
		goal_presentation_description_text \{text = qs(0x00000000)}
	endif
	if structurecontains structure = <element> soundevent
		if NOT (($goal_presentation_sound_buss_set_active) = 1)
			change \{goal_presentation_sound_buss_set_active = 1}
		endif
		if structurecontains structure = <element> soundped
			soundevent {
				event = (<element>.soundevent)
				object = (<element>.soundped)
				priority = 109
				logic_priority = 50
				dropoff_function = standard
				use_pos_info = false
				animate_mouth = true
			}
		else
			soundevent event = (<element>.soundevent)
		endif
	else
		if structurecontains structure = <element> text
			soundevent \{event = sk9_double_sfx}
		endif
	endif
	if structurecontains structure = <element> morphs
		<morphs> = (<element>.morphs)
		if (<cam_iter> > 0)
			<prev_element> = (<data> [(<cam_iter> - 1)])
			if structurecontains structure = <prev_element> morphs
				getarraysize (<prev_element>.morphs)
				if (<array_size> > 0)
					<prev_i> = (<array_size> - 1)
					begin
					<m> = (<prev_element>.morphs [<prev_i>])
					if structurecontains structure = <m> pos
						<last_pos> = (<m>.pos)
						<last_quat> = (<m>.quat)
						break
					endif
					<prev_i> = (<prev_i> - 1)
					repeat <array_size>
				endif
			endif
			if gotparam \{last_pos}
				<last_morph> = [{pos = <last_pos> quat = <last_quat> time = 0}]
				<morphs> = (<last_morph> + <morphs>)
			endif
		endif
	endif
	playigccam {
		name = $igc_custom_camera_name
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
	requireparams \{[
			text
		]
		all}
	if NOT screenelementexists \{id = goal_presentation_description_anchor}
		createscreenelement \{id = goal_presentation_description_anchor
			type = containerelement
			parent = root_window}
	endif
	if NOT screenelementexists \{id = goal_presentation_bg}
		if NOT (<text> = qs(0x00000000))
			createscreenelement \{type = spriteelement
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
				pos = (0.0, 550.0)
				dims = (1280.0, 170.0)
				alpha = 0.0}
			legacydoscreenelementmorph \{id = goal_presentation_bg
				alpha = 1.0
				time = 0.2}
		endif
	endif
	if NOT screenelementexists \{id = goal_presentation_text}
		createscreenelement {
			type = textblockelement
			parent = goal_presentation_description_anchor
			id = goal_presentation_text
			text = <text>
			font = text_a1
			just = [center top]
			pos = (640.0, 500.0)
			dims = (1000.0, 300.0)
			rgba = [200 200 200 255]
			scale = (0.95, 0.75)
			spacing = 0
			shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0.0
		}
		legacydoscreenelementmorph \{id = goal_presentation_text
			alpha = 1.0
			time = 0.2}
	else
		setscreenelementprops {
			id = goal_presentation_text
			text = <text>
		}
	endif
endscript

script goal_presentation_description_kill_text 
	if screenelementexists \{id = goal_presentation_description_pad_handler}
		if screenelementexists \{id = goal_presentation_text}
			destroyscreenelement \{id = goal_presentation_text}
		endif
		if screenelementexists \{id = goal_presentation_bg}
			destroyscreenelement \{id = goal_presentation_bg}
		endif
	else
		if screenelementexists \{id = goal_presentation_description_anchor}
			destroyscreenelement \{id = goal_presentation_description_anchor}
		endif
	endif
endscript

script goal_presentation_description_shot_morphs 
	if gotparam \{morphs}
		getarraysize (<morphs>)
		<morph_count> = <array_size>
		<i> = 0
		if (<morph_count> > 0)
			begin
			printf 'Goal presentation: Playing IGC morph %i of %c' i = (<i> + 1) c = <morph_count>
			ccam_domorph {
				lockto = world
				fov = 72.0
				time = 0
				(<morphs> [<i>])
			}
			if structurecontains structure = (<morphs> [<i>]) time
				if ((<morphs> [<i>].time) > 0)
					ccam_waitmorph
				endif
			endif
			<i> = (<i> + 1)
			repeat <morph_count>
		endif
	endif
endscript

script goal_presentation_description_shot_kill \{name = $igc_custom_camera_name}
	skater :input_debounce \{x}
	if gotparam \{soundevent}
		stopsoundevent <soundevent>
	elseif issoundeventplaying \{sk9_double_sfx}
		stopsoundevent \{sk9_double_sfx}
	endif
	soundevent \{event = skip_cam_sfx}
	killskatercamanim name = <name>
	if screenelementexists \{id = goal_presentation_description_pad_handler}
		destroyscreenelement \{id = goal_presentation_description_pad_handler}
	endif
endscript

script goal_presentation_description_skip_all 
	printf \{'goal_presentation_description_skip_all'}
	if gotparam \{soundevent}
		stopsoundevent <soundevent>
	elseif issoundeventplaying \{sk9_double_sfx}
		stopsoundevent \{sk9_double_sfx}
	endif
	soundevent \{event = skip_cam_sfx}
	gman_presentationfunc goal = <goal_id> tool = <tool_id> func = stop
endscript

script goal_presentation_description_onstop \{end_fade_in = 0}
	if screenelementexists \{id = goal_presentation_description_anchor}
		destroyscreenelement \{id = goal_presentation_description_anchor}
	endif
	killspawnedscript \{name = goal_presentation_description_shot}
	goal_presentation_description_shot_kill
	if (($goal_presentation_sound_buss_set_active) = 1)
		change \{goal_presentation_sound_buss_set_active = 0}
	endif
	skater :vibrate \{on}
	enableactuators \{1}
	goal_presentation_unhold_skater
	if (<end_fade_in> > 0)
		fadetoblack \{on
			alpha = 1
			time = 0}
		fadetoblack off time = <end_fade_in> no_wait
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
	unpausegame
	if gotparam \{objectaliases}
		getarraysize \{objectaliases}
		if (<array_size> > 0)
			<index> = 0
			begin
			if structurecontains structure = (<objectaliases> [<index>]) gameobj
				if iscreated ((<objectaliases> [<index>]).gameobj)
					((<objectaliases> [<index>]).gameobj) :obj_setoutlineflag off
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if gotparam \{retry_last}
		<goal_is_retrying> = {goalretry}
	endif
	playcutscene name = <cutscene_name> objectaliases = <objectaliases> <goal_is_retrying>
	spawnscriptnow goal_presentation_cutscene_update params = {
		goal_id = <goal_id>
		tool_id = <tool_id>
		cutscene_name = <cutscene_name>
		objectaliases = <objectaliases>
	}
endscript

script goal_presentation_cutscene_update 
	waitmovie \{name = cutscene}
	if ($goal_option_replay_presentation = 1)
		wait \{2
			seconds
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
	killskatercamanim \{name = cutscene}
	cutscene_subtitle_cleanup
	if (<end_fade_in> > 0)
		fadetoblack \{on
			alpha = 1
			time = 0}
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_dialogbox_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	<remove_save_option> = false
	<remove_index> = -1
	if structurecontains structure = <data> buttons
		getarraysize (<data>.buttons)
		if (<array_size> > 0)
			<index> = 0
			begin
			if structurecontains structure = ((<data>.buttons) [<index>]) pad_choose_params
				if structurecontains structure = (((<data>.buttons) [<index>]).pad_choose_params) action
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
			repeat <array_size>
		endif
	endif
	if (<remove_save_option> = true)
		<new_buttons> = []
		<index> = 0
		begin
		if NOT (<index> = <remove_index>)
			<temp_array> = [{}]
			setarrayelement arrayname = temp_array index = 0 newvalue = ((<data>.buttons) [<index>])
			<new_buttons> = (<new_buttons> + <temp_array>)
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		<buttons> = <new_buttons>
	else
		<buttons> = (<data>.buttons)
	endif
	create_dialog_box {
		title = (<data>.title)
		text = (<data>.descrip)
		buttons = <buttons>
	}
	runscriptonscreenelement {
		id = dialog_box_anchor
		goal_presentation_dialogbox_waitfordeath
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
endscript

script goal_presentation_dialogbox_waitfordeath 
	onexitrun {
		goal_presentation_dialogbox_stop
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
	block
endscript

script goal_presentation_dialogbox_stop 
	gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
endscript

script goal_presentation_dialogbox_onstop 
	goal_presentation_unpause
	ui_event \{event = menu_change
		data = {
			state = uistate_gameplay
		}}
endscript
goal_presentation_vo_curr_stream = none

script goal_presentation_vo_onstart 
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	onexitrun {
		goal_presentation_vo_stop
		params = {goal_id = <goal_id> checkpoint_id = <checkpoint_id> tool_id = <tool_id>}
	}
	create_console_message \{text = qs(0xe64820c0)}
	goal_presentation_hold_skater
	if screenelementexists \{id = goal_presentation_vo_anchor}
		destroyscreenelement \{id = goal_presentation_vo_anchor}
	endif
	<skippable> = 1
	if (<skippable> = 1)
		createscreenelement \{id = goal_presentation_vo_anchor
			type = containerelement
			parent = root_window
			event_handlers = [
				{
					pad_choose
					goal_presentation_vo_skip
				}
			]}
		runscriptonscreenelement \{id = goal_presentation_vo_anchor
			waitthenfocusscreenelement}
		create_helper_text \{parent = goal_presentation_vo_anchor
			helper_text_elements = [
				{
					text = qs(0x3591cd35)
				}
			]}
	endif
	getarraysize <vo_list>
	if (<array_size> > 0)
		<i> = 0
		begin
		<iter> = (<vo_list> [<i>])
		if isstructure \{iter}
			<stream_name> = (<vo_list> [<i>].stream)
			<object> = (<vo_list> [<i>].object)
		else
			<stream_name> = (<vo_list> [<i>])
			<object> = skater
		endif
		formattext checksumname = stream_id '%s' s = <stream_name>
		if streamexists <stream_id>
			formattext checksumname = event 'VO_IGC_%s' s = <stream_name>
			<object> :goal_presentation_vo_play {
				stream_string = <stream_name>
				stream = <stream_id>
				event = <event>
				object = <object>
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
	skater :input_debounce \{x}
	killspawnedscript \{name = goal_presentation_vo_onstart}
	die
endscript

script goal_presentation_vo_stop 
	gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
endscript

script goal_presentation_vo_play 
	printf \{'---------------------'}
	printf \{'goal_presentation_vo_play:'}
	printstruct <...>
	change goal_presentation_vo_curr_stream = <stream>
	appendsuffixtochecksum base = <event> suffixstring = '_struct'
	soundevent {
		event = <event>
		object = <object>
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
	change \{goal_presentation_vo_curr_stream = none}
endscript

script goal_presentation_vo_onstop 
	if issoundplaying ($goal_presentation_vo_curr_stream)
		stopsound ($goal_presentation_vo_curr_stream)
	endif
	killspawnedscript \{name = goal_presentation_vo_play}
	killspawnedscript \{name = goal_presentation_vo_onstart}
	goal_presentation_unhold_skater
endscript

script goal_presentation_ui_onstart \{rollout_before = 0}
	if NOT gman_goalexists goal = <goal_id>
		return
	endif
	if NOT gman_getgoalstate goal = <goal_id> states = [goal_activated]
		return
	endif
	if NOT structurecontains structure = <data> callback_script
		printstruct <...>
		softassert \{'missing callback_script in goal presentation ui data'}
		return
	endif
	if (<rollout_before> = 1)
		goal_rollout_skater
	endif
	goal_presentation_hold_skater
	(<data>.callback_script) {<data> <...>}
	if gman_goalexists goal = <goal_id>
		gman_presentationfunc goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> func = stop
	endif
endscript

script goal_presentation_ui_onstop \{end_fade_in = 0}
	<end_fade_in> = (<data>.end_fade_in)
	goal_presentation_unhold_skater
	if (<end_fade_in> > 0)
		fadetoblack \{on
			time = 0.0
			alpha = 1
			no_wait}
		if screenelementexists \{id = goal_presentation_movie_bg}
			destroyscreenelement \{id = goal_presentation_movie_bg}
		endif
		fadetoblack off time = <end_fade_in> no_wait
	endif
endscript

script goal_presentation_subtitled_movie \{skippable = 0
		do_pause = true
		end_fade_in = 0}
	if (<do_pause> = true)
		onexitrun \{goal_presentation_subtitled_movie_done}
		goal_presentation_pause
	endif
	killallmovies \{blocking}
	training_vid_audioparams_start
	igc_temporarily_disable_rendering \{2
		gameframes}
	fadetoblack \{off
		time = 0.25
		no_wait}
	playsubtitledmovie subbedmovie = <movie>
	if screenelementexists \{id = goal_presentation_movie_bg}
		destroyscreenelement \{id = goal_presentation_movie_bg}
	endif
	createscreenelement \{id = goal_presentation_movie_bg
		type = spriteelement
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
		pos = (0.0, 0.0)
		z_priority = -1000}
	wait \{0.5
		seconds
		ignoreslomo}
	if (<skippable> = 1)
		controllerdebounce \{x}
	endif
	begin
	wait \{1
		gameframe}
	if NOT ismovieplaying \{textureslot = 0}
		training_vid_audioparams_end
		break
	else
		if (<skippable> = 1)
			if controllerpressed \{x}
				killsubtitledmovie subbedmovie = <movie>
			endif
		endif
	endif
	repeat
	if (<end_fade_in> = 0)
		if screenelementexists \{id = goal_presentation_movie_bg}
			destroyscreenelement \{id = goal_presentation_movie_bg}
		endif
	endif
endscript

script goal_presentation_subtitled_movie_done 
	goal_presentation_unpause
endscript

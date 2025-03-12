current_tutorial_header = 'guitar'
current_tutorial_id = 'guitar_basics'
current_tutorial_lesson = 'lesson0'
current_tutorial_page = 'page0'
tutorial_paused = 0

script tutorial_system_get_tutorial 
	printf \{channel = tutorial
		qs(0xa511d13f)}
	requireparams \{[
			tutorial_header
			tutorial_id
		]
		all}
	formattext checksumname = tutorial_array '%s_tutorials' s = <tutorial_header>
	getarraysize ($<tutorial_array>)
	i = 0
	begin
	if structurecontains structure = ($<tutorial_array> [<i>]) id
		if (($<tutorial_array> [<i>].id) = <tutorial_id>)
			return tutorial_struct = ($<tutorial_array> [<i>])
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert 'Tutorial %t not found in %s_tutorials' t = <tutorial_id> s = <tutorial_header>
endscript

script tutorial_system_get_lesson 
	printf \{channel = tutorial
		qs(0x3fdcf05c)}
	requireparams \{[
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	tutorial_system_get_tutorial {
		tutorial_header = <tutorial_header>
		tutorial_id = <tutorial_id>
	}
	getarraysize (<tutorial_struct>.lessons)
	i = 0
	begin
	lesson = (<tutorial_struct>.lessons [<i>])
	if structurecontains structure = <lesson> id
		if ((<lesson>.id) = <lesson_id>)
			return lesson_struct = <lesson>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert 'Lesson %l not found in tutorial %t!' l = <lesson_id> t = <tutorial_id>
endscript

script tutorial_system_get_page 
	printf \{channel = tutorial
		qs(0xd1cfdd23)}
	requireparams \{[
			tutorial_header
			tutorial_id
			lesson_id
			page_id
		]
		all}
	tutorial_system_get_lesson {
		tutorial_header = <tutorial_header>
		tutorial_id = <tutorial_id>
		lesson_id = <lesson_id>
	}
	array = []
	getarraysize (<lesson_struct>.pages)
	i = 0
	begin
	page = (<lesson_struct>.pages [<i>])
	if structurecontains structure = <page> id
		if ((<page>.id) = <page_id>)
			addarrayelement array = <array> element = <page>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getarraysize <array>
	if (<array_size> = 0)
		scriptassert 'Page %p not found in lesson %l' p = <page_id> l = <lesson_id>
	elseif (<array_size> = 1)
		return page_struct = (<array> [0])
	else
		i = 0
		begin
		page = (<array> [<i>])
		page_found = 1
		if structurecontains \{structure = page
				hardware}
			if NOT tutorial_system_hardware_check hardware = (<page>.hardware)
				<page_found> = 0
			endif
		endif
		if structurecontains \{structure = page
				lefty_flip}
			if NOT tutorial_system_lefty_flip_page_check page_struct = <page>
				<page_found> = 0
			endif
		endif
		if (<page_found> = 1)
			found_page = <page>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if NOT gotparam \{found_page}
			scriptassert 'Page %p with correct settings not found in lesson %l' p = <page_id> l = <lesson_id>
		endif
		return page_struct = <found_page>
	endif
endscript

script tutorial_system_start 
	printf \{channel = tutorial
		qs(0xe6f2ee46)}
	requireparams \{[
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	change \{current_level = load_z_visualizer}
	crowd_system_deinit
	wait \{4
		gameframes}
	venue_system_init
	wait \{4
		gameframes}
	crowd_system_init
	wait \{4
		gameframes}
	tutorial_system_start_lesson {
		tutorial_header = <tutorial_header>
		tutorial_id = <tutorial_id>
		lesson_id = <lesson_id>
	}
endscript

script tutorial_system_start_lesson \{event = menu_replace}
	printf \{channel = tutorial
		qs(0xd6698f67)}
	requireparams \{[
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	getfirstplayer
	usefourlanehighway player = <player> reset
	generic_menu_pad_choose_sound
	change \{check_for_unplugged_controllers = 1}
	menu_music_off
	printf \{channel = sfx
		qs(0x0841284e)}
	tutorial_system_start_page {
		tutorial_header = <tutorial_header>
		tutorial_id = <tutorial_id>
		lesson_id = <lesson_id>
		page_id = 'page0'
		event = <event>
		part = <part>
		autosave = <autosave>
	}
endscript

script tutorial_system_start_page \{event = menu_replace}
	printf \{channel = tutorial
		qs(0x25f26d76)}
	requireparams \{[
			tutorial_header
			tutorial_id
			lesson_id
			page_id
		]
		all}
	tutorial_system_get_page <...>
	change current_tutorial_header = <tutorial_header>
	change current_tutorial_id = <tutorial_id>
	change current_tutorial_lesson = <lesson_id>
	change current_tutorial_page = <page_id>
	formattext checksumname = state 'UIstate_tutorial_%s' s = (<page_struct>.type)
	if gotparam \{autosave}
		ui_memcard_autosave_replace event = <event> state = <state> data = {page_struct = <page_struct> part = <part>}
	else
		ui_event_wait event = <event> data = {state = <state> page_struct = <page_struct> part = <part>}
	endif
endscript

script tutorial_system_page_complete 
	printf \{channel = tutorial
		qs(0x05081698)}
	requireparams \{[
			page_struct
		]
		all}
	if screenelementexists \{id = tutorial_main}
		tutorial_main :obj_killspawnedscript \{name = tutorial_system_handle_completion}
	endif
	if structurecontains structure = <page_struct> audio_stream
		if tutorial_system_is_sound_playing sound = (<page_struct>.audio_stream)
			tutorial_system_stop_sound sound = (<page_struct>.audio_stream)
		endif
	endif
	if gotparam \{retry_page}
		tutorial_system_start_page {
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = ($current_tutorial_lesson)
			page_id = (<page_struct>.id)
		}
	elseif structurecontains structure = <page_struct> next_page
		tutorial_system_start_page {
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = ($current_tutorial_lesson)
			page_id = (<page_struct>.next_page)
		}
	else
		tutorial_system_get_lesson {
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = ($current_tutorial_lesson)
		}
		tutorial_system_lesson_complete lesson_struct = <lesson_struct>
	endif
endscript

script tutorial_system_lesson_complete 
	printf \{channel = tutorial
		qs(0xd56112d0)}
	requireparams \{[
			lesson_struct
		]
		all}
	tutorial_system_disable_pause
	get_savegame_from_controller controller = ($primary_controller)
	if NOT tutorial_system_is_lesson_complete {
			savegame = <savegame>
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = (<lesson_struct>.id)
		}
		save_tutorial_lesson_globaltag {
			savegame = <savegame>
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = (<lesson_struct>.id)
			value = complete
		}
		autosave = 1
		if structurecontains structure = <lesson_struct> is_new
			fire_achievement name = achievement_whatsnew controller = ($primary_controller)
		endif
		tutorial_system_check_tutorial_completion savegame = <savegame>
		if tutorial_system_is_tutorial_complete savegame = <savegame> tutorial_header = ($current_tutorial_header) tutorial_id = ($current_tutorial_id)
			if screenelementexists \{id = tutorial_main}
				launchevent \{type = unfocus
					target = tutorial_main}
			endif
			tutorial_system_lesson_complete_anim
			if screenelementexists \{id = tutorial_main}
				launchevent \{type = focus
					target = tutorial_main}
			endif
		endif
	endif
	if screenelementexists \{id = tutorial_main}
		tutorial_main :se_setprops \{tutorial_instructions_text = qs(0x03ac90f0)}
		launchevent \{type = unfocus
			target = tutorial_main}
	endif
	make_generic_menu \{vmenu_id = lesson_complete_vmenu
		desc = 'generic_tutorial_popup'
		pad_back_sound = nullscript
		pad_back_script = nullscript
		z_priority = 50}
	generic_menu :se_setprops \{challenge_instrument_alpha = 0.0}
	generic_menu :se_setprops \{title_text = qs(0xd50843f0)}
	generic_menu :se_setprops \{description_text = qs(0x0b2e51f3)}
	add_generic_tutorial_menu_text_item {
		text = qs(0x494b4d7f)
		pad_choose_script = tutorial_system_continue_next_lesson
		pad_choose_params = {lesson_struct = <lesson_struct> autosave = <autosave>}
	}
	add_generic_tutorial_menu_text_item {
		text = qs(0xcda53e5f)
		pad_choose_script = tutorial_system_replay_lesson
		pad_choose_params = {autosave = <autosave>}
	}
	if gotparam \{autosave}
		pad_choose_script = ui_memcard_autosave_replace
		pad_choose_params = {event = menu_back state = uistate_tutorial_menu_lessons menu_music = on}
	else
		pad_choose_script = generic_event_back
		pad_choose_params = {state = uistate_tutorial_menu_lessons menu_music = on}
	endif
	add_generic_tutorial_menu_text_item {
		text = qs(0xf95de497)
		pad_choose_script = <pad_choose_script>
		pad_choose_params = <pad_choose_params>
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		all_buttons}
	change \{check_for_unplugged_controllers = 0}
	launchevent \{type = focus
		target = lesson_complete_vmenu}
endscript

script tutorial_system_continue_next_lesson 
	printf \{channel = tutorial
		qs(0x43d20210)}
	requireparams \{[
			lesson_struct
		]
		all}
	if structurecontains structure = <lesson_struct> next_lesson
		if gotparam \{autosave}
			ui_memcard_autosave_replace {
				event = menu_back
				state = uistate_tutorial_setup
				data = {
					tutorial_header = ($current_tutorial_header)
					tutorial_id = ($current_tutorial_id)
					lesson_id = (<lesson_struct>.next_lesson)
				}
			}
		else
			ui_event {
				event = menu_back
				state = uistate_tutorial_setup
				data = {
					tutorial_header = ($current_tutorial_header)
					tutorial_id = ($current_tutorial_id)
					lesson_id = (<lesson_struct>.next_lesson)
				}
			}
		endif
	else
		change \{check_for_unplugged_controllers = 0}
		if gotparam \{autosave}
			ui_memcard_autosave_replace \{event = menu_back
				state = uistate_tutorial_menu_lessons
				menu_music = on}
		else
			generic_event_back \{state = uistate_tutorial_menu_lessons
				menu_music = on}
		endif
	endif
	destroy_generic_menu
endscript

script tutorial_system_replay_lesson 
	printf \{channel = tutorial
		qs(0xd086a16d)}
	if gotparam \{autosave}
		ui_memcard_autosave_replace {
			event = menu_back
			state = uistate_tutorial_setup
			data = {
				tutorial_header = ($current_tutorial_header)
				tutorial_id = ($current_tutorial_id)
				lesson_id = ($current_tutorial_lesson)
			}
		}
	else
		ui_event {
			event = menu_back
			state = uistate_tutorial_setup
			data = {
				tutorial_header = ($current_tutorial_header)
				tutorial_id = ($current_tutorial_id)
				lesson_id = ($current_tutorial_lesson)
			}
		}
	endif
	destroy_generic_menu
endscript

script tutorial_system_check_tutorial_completion 
	printf \{channel = tutorial
		qs(0x90b764d1)}
	requireparams \{[
			savegame
		]
		all}
	tutorial_system_get_tutorial {
		tutorial_header = ($current_tutorial_header)
		tutorial_id = ($current_tutorial_id)
	}
	tutorial_complete = 1
	getarraysize (<tutorial_struct>.lessons)
	i = 0
	begin
	lesson_struct = (<tutorial_struct>.lessons [<i>])
	if NOT tutorial_system_is_lesson_complete {
			savegame = <savegame>
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = (<lesson_struct>.id)
		}
		<tutorial_complete> = 0
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<tutorial_complete> = 1)
		save_tutorial_globaltag {
			savegame = <savegame>
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			value = complete
		}
	endif
endscript

script tutorial_system_is_tutorial_complete 
	printf \{channel = tutorial
		qs(0x0772bd47)}
	requireparams \{[
			savegame
			tutorial_header
			tutorial_id
		]
		all}
	get_tutorial_globaltag <...>
	if (<tutorial_tag> = not_complete)
		return \{false}
	else
		return \{true}
	endif
endscript

script tutorial_system_is_lesson_complete 
	printf \{channel = tutorial
		qs(0x8e5ee903)}
	requireparams \{[
			savegame
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	get_tutorial_lesson_globaltag <...>
	if (<tutorial_tag> = not_complete)
		return \{false}
	else
		return \{true}
	endif
endscript

script tutorial_system_lesson_complete_anim \{anim_text = qs(0x8399081c)}
	printf \{channel = tutorial
		qs(0xc840d7d0)}
	if screenelementexists \{id = yourock_text}
		return
	endif
	if screenelementexists \{id = you_rock_physics}
		destroyscreenelement \{id = you_rock_physics}
	endif
	if NOT screenelementexists \{id = tutorial_main}
		return
	endif
	spawnscriptnow create_exploding_text id = lesson_anim params = {parent = 'you_rock_physics' text = <anim_text> text_physics = 1 placement = top}
	spawnscriptnow \{you_rock_script}
	tutorial_main :se_setprops \{tutorial_instructions_text = qs(0x03ac90f0)}
	wait \{5.5
		seconds}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
endscript

script tutorial_system_create_description 
	printf \{channel = tutorial
		qs(0x7530ee46)}
	requireparams \{[
			page_struct
		]
		all}
	if structurecontains structure = <page_struct> title_page
		desc = 'tutorial_title'
	else
		desc = 'tutorial_main'
	endif
	tutorial_system_destroy_description
	createscreenelement {
		parent = root_window
		type = descinterface
		id = tutorial_main
		desc = <desc>
	}
	<id> :se_setprops tutorial_instructions_text = (<page_struct>.text)
	launchevent \{type = focus
		target = tutorial_main}
	return desc_id = <id>
endscript

script tutorial_system_destroy_description 
	printf \{channel = tutorial
		qs(0xc37d7682)}
	if screenelementexists \{id = tutorial_main}
		launchevent \{type = unfocus
			target = tutorial_main}
		destroyscreenelement \{id = tutorial_main}
	endif
endscript

script tutorial_system_create_pausemenu_description 
	printf \{channel = tutorial
		qs(0x4771c078)}
	make_generic_menu {
		vmenu_id = tutorial_pause_vmenu
		desc = 'generic_tutorial_popup'
		pad_back_script = <pad_back_script>
		pad_back_params = <pad_back_params>
		z_priority = 600
	}
	generic_menu :se_setprops \{title_text = qs(0x662aaaf7)}
	generic_menu :se_setprops \{description_text = qs(0x00000000)}
endscript

script tutorial_system_destroy_pausemenu_description 
	printf \{channel = tutorial
		qs(0xba0b5d28)}
	destroy_generic_menu
	change \{tutorial_paused = 0}
endscript

script tutorial_system_create_image_flipbook 
	printf \{channel = tutorial
		qs(0x4843297d)}
	requireparams \{[
			desc_id
		]
		all}
	if <desc_id> :desc_resolvealias name = alias_tutorial_flipbook_window param = tutorial_flipbook_window
		createscreenelement {
			type = spriteelement
			parent = <tutorial_flipbook_window>
			id = tutorial_flipbook
			pos = (0.0, 0.0)
			z_priority = 2
			pos_anchor = [center , top]
			just = [center , top]
		}
	endif
endscript

script tutorial_system_destroy_image_flipbook 
	printf \{channel = tutorial
		qs(0x8be11b4c)}
	if screenelementexists \{id = tutorial_flipbook}
		destroyscreenelement \{id = tutorial_flipbook}
	endif
endscript

script tutorial_system_flip_images 
	printf \{channel = tutorial
		qs(0xeafe5da2)}
	if screenelementexists \{id = tutorial_flipbook}
		getarraysize (<page_struct>.images)
		current_index = 0
		time_shown = 0
		begin
		if ($tutorial_paused = 0)
			if structurecontains structure = (<page_struct>.images [<current_index>]) scale
				scale = ((<page_struct>.images [<current_index>]).scale)
			else
				scale = (2.0, 2.0)
			endif
			setscreenelementprops id = tutorial_flipbook texture = ((<page_struct>.images [<current_index>]).image) scale = <scale>
			<time_shown> = ((<page_struct>.images [<current_index>]).time_shown)
			wait <time_shown> seconds
			<current_index> = (<current_index> + 1)
			if (<current_index> = <array_size>)
				<current_index> = 0
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script tutorial_system_wait_for_complete 
	printf \{channel = tutorial
		qs(0x788b5ba3)}
	requireparams \{[
			page_struct
		]
		all}
	if structurecontains structure = <page_struct> time_shown
		time_shown = (<page_struct>.time_shown)
		wait <time_shown> seconds
	else
		wait \{1
			seconds}
	endif
endscript

script tutorial_system_setup_event_handlers 
	if screenelementexists \{id = tutorial_main}
		setscreenelementprops {
			id = tutorial_main
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_choose tutorial_system_page_complete params = {page_struct = <page_struct>}}
			]
			replace_handlers
		}
	endif
endscript

script tutorial_system_handle_completion 
	printf \{channel = tutorial
		qs(0x5db89a09)}
	if structurecontains structure = <page_struct> wait_for_user_input
		if structurecontains structure = <page_struct> audio_stream
			tutorial_system_play_sound sound = (<page_struct>.audio_stream)
		endif
	else
		if structurecontains structure = <page_struct> audio_stream
			<desc_id> :obj_spawnscriptnow tutorial_system_play_audio_and_wait params = {sound = (<page_struct>.audio_stream)}
		endif
		tutorial_system_wait_for_complete <...>
		begin
		if NOT scriptisrunning \{tutorial_system_play_audio_and_wait}
			break
		endif
		wait \{1
			gameframe}
		repeat
		tutorial_system_page_complete page_struct = <page_struct>
	endif
endscript

script tutorial_system_play_audio_and_wait 
	printf \{channel = tutorial
		qs(0x57f08ce0)}
	requireparams \{[
			sound
		]
		all}
	wait ($tutorial_system_pre_vo_wait_time) seconds
	tutorial_system_play_sound sound = <sound> wait
	wait ($tutorial_system_post_vo_wait_time) seconds
endscript

script tutorial_system_create_video \{video = 'career_intro'}
	printf \{channel = tutorial
		qs(0x02fa4e2c)}
	destroy_bink_sub_heaps
	createscreenelement {
		type = movieelement
		parent = tutorial_main
		textureslot = 2
		movie = <video>
		pos = (0.0, 87.0)
		dims = (1024.0, 400.0)
		pos_anchor = [center center]
		just = [center center]
		z_priority = 2
		alpha = 1.0
		rgba = [255 255 255 255]
	}
endscript

script tutorial_system_destroy_video 
	printf \{channel = tutorial
		qs(0x6f7a02e7)}
	spawnscriptnow \{endmovie
		params = {
			slot = 2
		}}
endscript

script tutorial_system_menu_focus 
	printf \{channel = tutorial
		qs(0x0584d47c)}
	requireparams \{[
			item_struct
		]
		all}
	helper_text = qs(0x00000000)
	if structurecontains structure = <item_struct> helper_text
		helper_text = (<item_struct>.helper_text)
	endif
	generic_menu :se_setprops help_text_caption_text = <helper_text>
endscript

script tutorial_system_play_sound \{volume = 0}
	printf \{channel = tutorial
		qs(0x999c682c)}
	requireparams \{[
			sound
		]
		all}
	tutorial_system_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	if streamexists <sound_id>
		playsound <sound_id> vol = <volume> buss = tutorial_vo
		if gotparam \{wait}
			tutorial_system_wait_for_sound sound = <sound>
		endif
	else
		wait \{2
			seconds}
	endif
endscript

script tutorial_system_wait_for_sound 
	printf \{channel = tutorial
		qs(0x717a9229)}
	requireparams \{[
			sound
		]
		all}
	begin
	if NOT tutorial_system_is_sound_playing sound = <sound>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script tutorial_system_is_sound_playing 
	requireparams \{[
			sound
		]
		all}
	tutorial_system_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	if streamexists <sound_id>
		if issoundplaying <sound_id>
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script tutorial_system_get_language_prefix 
	if english
		return \{language_prefix = 'EN'}
	elseif german
		return \{language_prefix = 'GR'}
	elseif french
		return \{language_prefix = 'FR'}
	elseif italian
		return \{language_prefix = 'IT'}
	elseif spanish
		return \{language_prefix = 'SP'}
	endif
	return \{language_prefix = 'EN'}
endscript

script tutorial_system_stop_sound \{volume = 0}
	printf \{channel = tutorial
		qs(0x8113de19)}
	requireparams \{[
			sound
		]
		all}
	tutorial_system_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	if streamexists <sound_id>
		stopsound <sound_id> vol = <volume> buss = tutorial_vo
	endif
endscript

script tutorial_system_start_gameplay 
	printf \{channel = tutorial
		qs(0x8ecd8fb6)}
	requireparams \{[
			song
		]
		all}
	getfirstplayer
	getplayerinfo <player> part
	if (<part> = vocals)
		setplayerinfo <player> vocals_highway_view = scrolling
	endif
	gman_songfunc func = set_current_song params = {song = <song>}
	ui_event_wait \{event = menu_change
		state = uistate_play_song}
endscript

script tutorial_system_start_song 
	printf \{channel = tutorial
		qs(0xde4926ed)}
	change \{current_transition = fastintrotutorial}
	start_song {
		starttime = 0
		device_num = <device_num>
		uselaststarttime = <uselaststarttime>
	}
endscript

script tutorial_system_set_part 
	printf \{channel = tutorial
		qs(0xd7c72b87)}
	requireparams \{[
			part
		]
		all}
	getfirstplayer
	setplayerinfo <player> part = <part>
endscript

script tutorial_system_setup_players 
	printf \{channel = tutorial
		qs(0x7d54580f)}
	reset_all_player_in_game_status
	getfirstplayer
	setplayerinfo <player> in_game = 1
	setplayerinfo <player> difficulty = medium
	setplayerinfo <player> controller = ($primary_controller)
	usefourlanehighway player = <playerinfo> reset
endscript

script tutorial_system_exit_cleanup 
	printf \{channel = tutorial
		qs(0xc98e5753)}
	reset_all_player_in_game_status
endscript

script tutorial_system_hardware_check 
	printf \{channel = tutorial
		qs(0x0cfeed8e)}
	requireparams \{[
			hardware
		]
		all}
	getfirstplayer
	getplayerinfo <player> part
	getplayerinfo <player> controller
	if (<part> = guitar || <part> = bass)
		switch (<hardware>)
			case touchguitar
			if isguitartouchcontroller controller = <controller>
				return \{true}
			endif
			case notouchguitar
			if NOT isguitartouchcontroller controller = <controller>
				return \{true}
			endif
			default
			return \{false}
		endswitch
		return \{false}
	elseif (<part> = drum)
		switch (<hardware>)
			case rbdrum
			if isrbdrum controller = <controller>
				return \{true}
			endif
			case ghdrum
			if NOT isrbdrum controller = <controller>
				return \{true}
			endif
			default
			return \{false}
		endswitch
		return \{false}
	else
		return \{true}
	endif
endscript

script tutorial_system_lefty_flip_page_check 
	printf \{channel = tutorial
		qs(0x181c8944)}
	requireparams \{[
			page_struct
		]
		all}
	getfirstplayer
	getplayerinfo <player> lefty_flip
	if (<page_struct>.lefty_flip = <lefty_flip>)
		return \{true}
	else
		return \{false}
	endif
endscript

script tutorial_system_enable_pause 
	printf \{channel = tutorial
		qs(0x56612ed2)}
	enable_pause
endscript

script tutorial_system_disable_pause 
	printf \{channel = tutorial
		qs(0xcdfdc492)}
	disable_pause
endscript

script tutorial_system_start_pressed 
	printf \{channel = tutorial
		qs(0xeb480667)}
	change \{tutorial_paused = 1}
	if screenelementexists \{id = tutorial_main}
		launchevent \{type = unfocus
			target = tutorial_main}
	endif
	pausegame
	pausegh3sounds
	<pad_back_script> = tutorial_system_pausemenu_resume
	options = [
		{
			text = qs(0x4f636726)
			func = tutorial_system_pausemenu_resume
		}
		{
			text = qs(0x9c8bd769)
			func = tutorial_system_pausemenu_restart_lesson
		}
		{
			text = qs(0xfceafb8f)
			func = tutorial_system_pausemenu_skip_lesson
		}
		{
			text = qs(0x976cf9e7)
		}
		{
			text = qs(0x67d9c56d)
			func = tutorial_system_pausemenu_quit
		}
	]
	change last_start_pressed_device = ($primary_controller)
	ui_create_pausemenu pad_back_script = <pad_back_script> options = <options>
	launchevent \{type = focus
		target = tutorial_pause_vmenu}
endscript

script tutorial_system_pausemenu_restart_lesson 
	printf \{channel = tutorial
		qs(0xeedaa255)}
	stopsoundsbybuss \{tutorial_vo}
	unpausegh3
	tutorial_system_replay_lesson
endscript

script tutorial_system_pausemenu_skip_lesson 
	printf \{channel = tutorial
		qs(0x204a0a96)}
	stopsoundsbybuss \{tutorial_vo}
	unpausegh3
	tutorial_system_get_lesson {
		tutorial_header = ($current_tutorial_header)
		tutorial_id = ($current_tutorial_id)
		lesson_id = ($current_tutorial_lesson)
	}
	tutorial_system_continue_next_lesson lesson_struct = <lesson_struct>
endscript

script tutorial_system_pausemenu_quit 
	printf \{channel = tutorial
		qs(0x258564c3)}
	stopsoundsbybuss \{tutorial_vo}
	change \{check_for_unplugged_controllers = 0}
	unpausegh3
	menu_music_on
	ui_event \{event = menu_back
		data = {
			state = uistate_mainmenu
		}}
endscript

script tutorial_system_pausemenu_destroy 
	printf \{channel = tutorial
		qs(0x1a185869)}
	if ($tutorial_paused = 0)
		return
	endif
	printscriptinfo \{'tutorial_system_pausemenu_destroy'}
	launchevent \{type = unfocus
		target = current_menu}
	if screenelementexists \{id = tutorial_main}
		launchevent \{type = focus
			target = tutorial_main}
	endif
	generic_event_back
endscript

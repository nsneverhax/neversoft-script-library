current_tutorial_header = 'guitar'
current_tutorial_id = 'guitar_basics'
current_tutorial_lesson = 'lesson0'
current_tutorial_page = 'page0'
tutorial_paused = 0

script tutorial_system_get_tutorial 
	printf \{channel = tutorial
		qs(0xa511d13f)}
	RequireParams \{[
			tutorial_header
			tutorial_id
		]
		all}
	formatText checksumName = tutorial_array '%s_tutorials' s = <tutorial_header>
	GetArraySize ($<tutorial_array>)
	i = 0
	begin
	if StructureContains structure = ($<tutorial_array> [<i>]) id
		if (($<tutorial_array> [<i>].id) = <tutorial_id>)
			return tutorial_struct = ($<tutorial_array> [<i>])
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	ScriptAssert 'Tutorial %t not found in %s_tutorials' t = <tutorial_id> s = <tutorial_header>
endscript

script tutorial_system_get_lesson 
	printf \{channel = tutorial
		qs(0x3fdcf05c)}
	RequireParams \{[
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	tutorial_system_get_tutorial {
		tutorial_header = <tutorial_header>
		tutorial_id = <tutorial_id>
	}
	GetArraySize (<tutorial_struct>.lessons)
	i = 0
	begin
	lesson = (<tutorial_struct>.lessons [<i>])
	if StructureContains structure = <lesson> id
		if ((<lesson>.id) = <lesson_id>)
			return lesson_struct = <lesson>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	ScriptAssert 'Lesson %l not found in tutorial %t!' l = <lesson_id> t = <tutorial_id>
endscript

script tutorial_system_get_page 
	printf \{channel = tutorial
		qs(0xd1cfdd23)}
	RequireParams \{[
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
	GetArraySize (<lesson_struct>.pages)
	i = 0
	begin
	page = (<lesson_struct>.pages [<i>])
	if StructureContains structure = <page> id
		if ((<page>.id) = <page_id>)
			AddArrayElement array = <array> element = <page>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize <array>
	if (<array_Size> = 0)
		ScriptAssert 'Page %p not found in lesson %l' p = <page_id> l = <lesson_id>
	elseif (<array_Size> = 1)
		return page_struct = (<array> [0])
	else
		i = 0
		begin
		page = (<array> [<i>])
		page_found = 1
		if StructureContains \{structure = page
				hardware}
			if NOT tutorial_system_hardware_check hardware = (<page>.hardware)
				<page_found> = 0
			endif
		endif
		if StructureContains \{structure = page
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
		repeat <array_Size>
		if NOT GotParam \{found_page}
			ScriptAssert 'Page %p with correct settings not found in lesson %l' p = <page_id> l = <lesson_id>
		endif
		return page_struct = <found_page>
	endif
endscript

script tutorial_system_start 
	printf \{channel = tutorial
		qs(0xe6f2ee46)}
	RequireParams \{[
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	Change \{current_level = load_z_visualizer}
	crowd_system_deinit
	Wait \{4
		gameframes}
	venue_system_init
	Wait \{4
		gameframes}
	crowd_system_init
	Wait \{4
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
	RequireParams \{[
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	getfirstplayer
	usefourlanehighway Player = <Player> reset
	generic_menu_pad_choose_sound
	Change \{check_for_unplugged_controllers = 1}
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
	RequireParams \{[
			tutorial_header
			tutorial_id
			lesson_id
			page_id
		]
		all}
	tutorial_system_get_page <...>
	Change current_tutorial_header = <tutorial_header>
	Change current_tutorial_id = <tutorial_id>
	Change current_tutorial_lesson = <lesson_id>
	Change current_tutorial_page = <page_id>
	formatText checksumName = state 'UIstate_tutorial_%s' s = (<page_struct>.Type)
	if GotParam \{autosave}
		ui_memcard_autosave_replace event = <event> state = <state> data = {page_struct = <page_struct> part = <part>}
	else
		ui_event_wait event = <event> data = {state = <state> page_struct = <page_struct> part = <part>}
	endif
endscript

script tutorial_system_page_complete 
	printf \{channel = tutorial
		qs(0x05081698)}
	RequireParams \{[
			page_struct
		]
		all}
	if ScreenElementExists \{id = tutorial_main}
		tutorial_main :Obj_KillSpawnedScript \{Name = tutorial_system_handle_completion}
	endif
	if StructureContains structure = <page_struct> audio_stream
		if tutorial_system_is_sound_playing Sound = (<page_struct>.audio_stream)
			tutorial_system_stop_sound Sound = (<page_struct>.audio_stream)
		endif
	endif
	if GotParam \{retry_page}
		tutorial_system_start_page {
			tutorial_header = ($current_tutorial_header)
			tutorial_id = ($current_tutorial_id)
			lesson_id = ($current_tutorial_lesson)
			page_id = (<page_struct>.id)
		}
	elseif StructureContains structure = <page_struct> next_page
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
	RequireParams \{[
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
		if StructureContains structure = <lesson_struct> is_new
			fire_achievement Name = achievement_whatsnew controller = ($primary_controller)
		endif
		tutorial_system_check_tutorial_completion savegame = <savegame>
		if tutorial_system_is_tutorial_complete savegame = <savegame> tutorial_header = ($current_tutorial_header) tutorial_id = ($current_tutorial_id)
			if ScreenElementExists \{id = tutorial_main}
				LaunchEvent \{Type = unfocus
					target = tutorial_main}
			endif
			tutorial_system_lesson_complete_anim
			if ScreenElementExists \{id = tutorial_main}
				LaunchEvent \{Type = focus
					target = tutorial_main}
			endif
		endif
	endif
	if ScreenElementExists \{id = tutorial_main}
		tutorial_main :se_setprops \{tutorial_instructions_text = qs(0x03ac90f0)}
		LaunchEvent \{Type = unfocus
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
	if GotParam \{autosave}
		pad_choose_script = ui_memcard_autosave_replace
		pad_choose_params = {event = menu_back state = uistate_tutorial_menu_lessons menu_music = On}
	else
		pad_choose_script = generic_event_back
		pad_choose_params = {state = uistate_tutorial_menu_lessons menu_music = On}
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
	Change \{check_for_unplugged_controllers = 0}
	LaunchEvent \{Type = focus
		target = lesson_complete_vmenu}
endscript

script tutorial_system_continue_next_lesson 
	printf \{channel = tutorial
		qs(0x43d20210)}
	RequireParams \{[
			lesson_struct
		]
		all}
	if StructureContains structure = <lesson_struct> next_lesson
		if GotParam \{autosave}
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
		Change \{check_for_unplugged_controllers = 0}
		if GotParam \{autosave}
			ui_memcard_autosave_replace \{event = menu_back
				state = uistate_tutorial_menu_lessons
				menu_music = On}
		else
			generic_event_back \{state = uistate_tutorial_menu_lessons
				menu_music = On}
		endif
	endif
	destroy_generic_menu
endscript

script tutorial_system_replay_lesson 
	printf \{channel = tutorial
		qs(0xd086a16d)}
	if GotParam \{autosave}
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
	RequireParams \{[
			savegame
		]
		all}
	tutorial_system_get_tutorial {
		tutorial_header = ($current_tutorial_header)
		tutorial_id = ($current_tutorial_id)
	}
	tutorial_complete = 1
	GetArraySize (<tutorial_struct>.lessons)
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
	repeat <array_Size>
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
	RequireParams \{[
			savegame
			tutorial_header
			tutorial_id
		]
		all}
	get_tutorial_globaltag <...>
	if (<tutorial_tag> = not_complete)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script tutorial_system_is_lesson_complete 
	printf \{channel = tutorial
		qs(0x8e5ee903)}
	RequireParams \{[
			savegame
			tutorial_header
			tutorial_id
			lesson_id
		]
		all}
	get_tutorial_lesson_globaltag <...>
	if (<tutorial_tag> = not_complete)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script tutorial_system_lesson_complete_anim \{anim_text = qs(0x8399081c)}
	printf \{channel = tutorial
		qs(0xc840d7d0)}
	if ScreenElementExists \{id = yourock_text}
		return
	endif
	if ScreenElementExists \{id = you_rock_physics}
		DestroyScreenElement \{id = you_rock_physics}
	endif
	if NOT ScreenElementExists \{id = tutorial_main}
		return
	endif
	SpawnScriptNow create_exploding_text id = lesson_anim params = {parent = 'you_rock_physics' text = <anim_text> text_physics = 1 placement = top}
	SpawnScriptNow \{you_rock_script}
	tutorial_main :se_setprops \{tutorial_instructions_text = qs(0x03ac90f0)}
	Wait \{5.5
		Seconds}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
endscript

script tutorial_system_create_description 
	printf \{channel = tutorial
		qs(0x7530ee46)}
	RequireParams \{[
			page_struct
		]
		all}
	if StructureContains structure = <page_struct> title_page
		desc = 'tutorial_title'
	else
		desc = 'tutorial_main'
	endif
	tutorial_system_destroy_description
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = tutorial_main
		desc = <desc>
	}
	<id> :se_setprops tutorial_instructions_text = (<page_struct>.text)
	LaunchEvent \{Type = focus
		target = tutorial_main}
	return desc_id = <id>
endscript

script tutorial_system_destroy_description 
	printf \{channel = tutorial
		qs(0xc37d7682)}
	if ScreenElementExists \{id = tutorial_main}
		LaunchEvent \{Type = unfocus
			target = tutorial_main}
		DestroyScreenElement \{id = tutorial_main}
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
	Change \{tutorial_paused = 0}
endscript

script tutorial_system_create_image_flipbook 
	printf \{channel = tutorial
		qs(0x4843297d)}
	RequireParams \{[
			desc_id
		]
		all}
	if <desc_id> :desc_resolvealias Name = alias_tutorial_flipbook_window param = tutorial_flipbook_window
		CreateScreenElement {
			Type = SpriteElement
			parent = <tutorial_flipbook_window>
			id = tutorial_flipbook
			Pos = (0.0, 0.0)
			z_priority = 2
			pos_anchor = [center , top]
			just = [center , top]
		}
	endif
endscript

script tutorial_system_destroy_image_flipbook 
	printf \{channel = tutorial
		qs(0x8be11b4c)}
	if ScreenElementExists \{id = tutorial_flipbook}
		DestroyScreenElement \{id = tutorial_flipbook}
	endif
endscript

script tutorial_system_flip_images 
	printf \{channel = tutorial
		qs(0xeafe5da2)}
	if ScreenElementExists \{id = tutorial_flipbook}
		GetArraySize (<page_struct>.images)
		current_index = 0
		time_shown = 0
		begin
		if ($tutorial_paused = 0)
			if StructureContains structure = (<page_struct>.images [<current_index>]) Scale
				Scale = ((<page_struct>.images [<current_index>]).Scale)
			else
				Scale = (2.0, 2.0)
			endif
			SetScreenElementProps id = tutorial_flipbook texture = ((<page_struct>.images [<current_index>]).image) Scale = <Scale>
			<time_shown> = ((<page_struct>.images [<current_index>]).time_shown)
			Wait <time_shown> Seconds
			<current_index> = (<current_index> + 1)
			if (<current_index> = <array_Size>)
				<current_index> = 0
			endif
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script tutorial_system_wait_for_complete 
	printf \{channel = tutorial
		qs(0x788b5ba3)}
	RequireParams \{[
			page_struct
		]
		all}
	if StructureContains structure = <page_struct> time_shown
		time_shown = (<page_struct>.time_shown)
		Wait <time_shown> Seconds
	else
		Wait \{1
			Seconds}
	endif
endscript

script tutorial_system_setup_event_handlers 
	if ScreenElementExists \{id = tutorial_main}
		SetScreenElementProps {
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
	if StructureContains structure = <page_struct> wait_for_user_input
		if StructureContains structure = <page_struct> audio_stream
			tutorial_system_play_sound Sound = (<page_struct>.audio_stream)
		endif
	else
		if StructureContains structure = <page_struct> audio_stream
			<desc_id> :Obj_SpawnScriptNow tutorial_system_play_audio_and_wait params = {Sound = (<page_struct>.audio_stream)}
		endif
		tutorial_system_wait_for_complete <...>
		begin
		if NOT ScriptIsRunning \{tutorial_system_play_audio_and_wait}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		tutorial_system_page_complete page_struct = <page_struct>
	endif
endscript

script tutorial_system_play_audio_and_wait 
	printf \{channel = tutorial
		qs(0x57f08ce0)}
	RequireParams \{[
			Sound
		]
		all}
	Wait ($tutorial_system_pre_vo_wait_time) Seconds
	tutorial_system_play_sound Sound = <Sound> Wait
	Wait ($tutorial_system_post_vo_wait_time) Seconds
endscript

script tutorial_system_create_video \{video = 'career_intro'}
	printf \{channel = tutorial
		qs(0x02fa4e2c)}
	destroy_bink_sub_heaps
	CreateScreenElement {
		Type = movieelement
		parent = tutorial_main
		textureSlot = 2
		movie = <video>
		Pos = (0.0, 87.0)
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
	SpawnScriptNow \{endmovie
		params = {
			slot = 2
		}}
endscript

script tutorial_system_menu_focus 
	printf \{channel = tutorial
		qs(0x0584d47c)}
	RequireParams \{[
			item_struct
		]
		all}
	helper_text = qs(0x00000000)
	if StructureContains structure = <item_struct> helper_text
		helper_text = (<item_struct>.helper_text)
	endif
	generic_menu :se_setprops help_text_caption_text = <helper_text>
endscript

script tutorial_system_play_sound \{Volume = 0}
	printf \{channel = tutorial
		qs(0x999c682c)}
	RequireParams \{[
			Sound
		]
		all}
	tutorial_system_get_language_prefix
	formatText checksumName = sound_id '%a_%b' a = <language_prefix> b = <Sound>
	if streamexists <sound_id>
		PlaySound <sound_id> vol = <Volume> buss = tutorial_vo
		if GotParam \{Wait}
			tutorial_system_wait_for_sound Sound = <Sound>
		endif
	else
		Wait \{2
			Seconds}
	endif
endscript

script tutorial_system_wait_for_sound 
	printf \{channel = tutorial
		qs(0x717a9229)}
	RequireParams \{[
			Sound
		]
		all}
	begin
	if NOT tutorial_system_is_sound_playing Sound = <Sound>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script tutorial_system_is_sound_playing 
	RequireParams \{[
			Sound
		]
		all}
	tutorial_system_get_language_prefix
	formatText checksumName = sound_id '%a_%b' a = <language_prefix> b = <Sound>
	if streamexists <sound_id>
		if issoundplaying <sound_id>
			return \{true}
		else
			return \{FALSE}
		endif
	else
		return \{FALSE}
	endif
endscript

script tutorial_system_get_language_prefix 
	if English
		return \{language_prefix = 'EN'}
	elseif German
		return \{language_prefix = 'GR'}
	elseif French
		return \{language_prefix = 'FR'}
	elseif Italian
		return \{language_prefix = 'IT'}
	elseif Spanish
		return \{language_prefix = 'SP'}
	endif
	return \{language_prefix = 'EN'}
endscript

script tutorial_system_stop_sound \{Volume = 0}
	printf \{channel = tutorial
		qs(0x8113de19)}
	RequireParams \{[
			Sound
		]
		all}
	tutorial_system_get_language_prefix
	formatText checksumName = sound_id '%a_%b' a = <language_prefix> b = <Sound>
	if streamexists <sound_id>
		stopsound <sound_id> vol = <Volume> buss = tutorial_vo
	endif
endscript

script tutorial_system_start_gameplay 
	printf \{channel = tutorial
		qs(0x8ecd8fb6)}
	RequireParams \{[
			song
		]
		all}
	getfirstplayer
	getplayerinfo <Player> part
	if (<part> = vocals)
		setplayerinfo <Player> vocals_highway_view = scrolling
	endif
	gman_songfunc func = set_current_song params = {song = <song>}
	ui_event_wait \{event = menu_change
		state = uistate_play_song}
endscript

script tutorial_system_start_song 
	printf \{channel = tutorial
		qs(0xde4926ed)}
	Change \{current_transition = fastintrotutorial}
	start_song {
		starttime = 0
		device_num = <device_num>
		uselaststarttime = <uselaststarttime>
	}
endscript

script tutorial_system_set_part 
	printf \{channel = tutorial
		qs(0xd7c72b87)}
	RequireParams \{[
			part
		]
		all}
	getfirstplayer
	setplayerinfo <Player> part = <part>
endscript

script tutorial_system_setup_players 
	printf \{channel = tutorial
		qs(0x7d54580f)}
	reset_all_player_in_game_status
	getfirstplayer
	setplayerinfo <Player> in_game = 1
	setplayerinfo <Player> difficulty = medium
	setplayerinfo <Player> controller = ($primary_controller)
	usefourlanehighway Player = <playerinfo> reset
endscript

script tutorial_system_exit_cleanup 
	printf \{channel = tutorial
		qs(0xc98e5753)}
	reset_all_player_in_game_status
endscript

script tutorial_system_hardware_check 
	printf \{channel = tutorial
		qs(0x0cfeed8e)}
	RequireParams \{[
			hardware
		]
		all}
	getfirstplayer
	getplayerinfo <Player> part
	getplayerinfo <Player> controller
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
			return \{FALSE}
		endswitch
		return \{FALSE}
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
			return \{FALSE}
		endswitch
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script tutorial_system_lefty_flip_page_check 
	printf \{channel = tutorial
		qs(0x181c8944)}
	RequireParams \{[
			page_struct
		]
		all}
	getfirstplayer
	getplayerinfo <Player> lefty_flip
	if (<page_struct>.lefty_flip = <lefty_flip>)
		return \{true}
	else
		return \{FALSE}
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
	Change \{tutorial_paused = 1}
	if ScreenElementExists \{id = tutorial_main}
		LaunchEvent \{Type = unfocus
			target = tutorial_main}
	endif
	PauseGame
	PauseGh3Sounds
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
	Change last_start_pressed_device = ($primary_controller)
	ui_create_pausemenu pad_back_script = <pad_back_script> options = <options>
	LaunchEvent \{Type = focus
		target = tutorial_pause_vmenu}
endscript

script tutorial_system_pausemenu_restart_lesson 
	printf \{channel = tutorial
		qs(0xeedaa255)}
	StopSoundsByBuss \{tutorial_vo}
	unpausegh3
	tutorial_system_replay_lesson
endscript

script tutorial_system_pausemenu_skip_lesson 
	printf \{channel = tutorial
		qs(0x204a0a96)}
	StopSoundsByBuss \{tutorial_vo}
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
	StopSoundsByBuss \{tutorial_vo}
	Change \{check_for_unplugged_controllers = 0}
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	if ScreenElementExists \{id = tutorial_main}
		LaunchEvent \{Type = focus
			target = tutorial_main}
	endif
	generic_event_back
endscript

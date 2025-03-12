
script ui_create_bonus_videos 
	change \{rich_presence_context = presence_videos}
	locked_option_flags = {
		not_focusable
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [216 181 117 255]
	}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_videos_menu_id
		type = descinterface
		desc = 'mainmenu'
		exclusive_device = ($primary_controller)
		tags = {
		}
		event_handlers = [
			{pad_back ui_bonus_videos_back}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x9560fb22)
	}
	attempt_to_add_friend_feed \{parent_id = options_videos_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = options_videos_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = options_videos_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = options_videos_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = options_videos_menu_id
		}}
	mainmenu_setup_option {
		choose_state = uistate_bonus_videos_credits
		back_script = ui_bonus_videos_back
		menu_item_text = ($bonus_videos [0].text)
		screen_id = options_videos_menu_id
		helper_text = qs(0x03ac90f0)
	}
	getarraysize ($bonus_videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($bonus_videos [<i>].id)
		movie = ($bonus_videos [<i>].movie)
		getterritory
		if gotparam \{territory}
			if NOT (<territory> = territory_us)
				if structurecontains structure = ($bonus_videos [<i>]) movienoesrb
					movie = ($bonus_videos [<i>].movienoesrb)
				endif
			else
			endif
		endif
		mainmenu_setup_option {
			choose_script = ui_bonus_videos_play_video_if_not_playing
			choose_params = {movie = <movie>}
			back_script = ui_bonus_videos_back
			menu_item_text = ($bonus_videos [<i>].text)
			screen_id = options_videos_menu_id
			helper_text = qs(0x03ac90f0)
		}
	else
		mainmenu_setup_option {
			choose_script = ui_bonus_videos_negative_sfx
			back_script = ui_bonus_videos_back
			menu_item_text = qs(0x24a08263)
			screen_id = options_videos_menu_id
			helper_text = qs(0x03ac90f0)
			<locked_option_flags>
		}
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	main_menu_finalize
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_bonus_videos 
	clean_up_user_control_helpers
	if screenelementexists \{id = options_videos_menu_id}
		destroyscreenelement \{id = options_videos_menu_id}
	endif
endscript

script ui_bonus_videos_play_video_if_not_playing \{movie = 'atvi'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT scriptisrunning \{ui_bonus_videos_play_video}
		ui_bonus_videos_play_video movie = <movie>
	endif
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	destroy_friend_feed
	launchevent \{type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	if ui_bonus_videos_is_locked movie = <movie>
	else
		audio_ui_menu_music_off
		spawnscriptnow \{audio_crowd_silence_front_end
			params = {
				immediate = 1
			}}
		fadetoblack \{on
			alpha = 1.0
			time = 0
			z_priority = 200}
		clean_up_user_control_helpers
		netsessionfunc \{func = removeallcontrollers}
		if ((<movie> = 'career_intro') || (<movie> = 'career_ending'))
			<stream> = <movie>
			ui_career_movie_preload_stream stream = <stream>
			if ($g_career_movie_stream != none)
				printf \{qs(0xb15638bb)
					s = $g_career_movie_stream}
				startpreloadedstream \{$g_career_movie_stream
					buss = encore_events
					forcesafepreload = 1
					vol = 0.0}
			endif
		endif
		destroy_song_and_musicstudio_heaps \{do_unloads}
		setbinkheap \{heap_cas_cache}
		playmovieandwait noblack movie = <movie> hide_glitch_frames = 4
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
		if ((<movie> = 'career_intro') || (<movie> = 'career_ending'))
			stopsound unique_id = ($g_career_movie_stream) fade_time = 0.1 fade_type = linear
			change \{g_career_movie_stream = none}
		endif
		if ($invite_controller = -1)
			netsessionfunc func = addcontrollers params = {controller = ($primary_controller)}
		else
			netsessionfunc func = addcontrollers params = {controller = ($invite_controller)}
		endif
		menu_finish
		fadetoblack \{off
			time = 0}
		spawnscriptnow \{sfx_backgrounds_new_area
			params = {
				bg_sfx_area = frontend_menu_music
			}}
		audio_ui_menu_music_on
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	attempt_to_add_friend_feed \{parent_id = options_videos_menu_id
		menu = main_generic}
	current_menu :se_setprops \{unblock_events}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_bonus_videos_is_locked 
	getarraysize ($bonus_videos)
	i = 0
	begin
	if gotparam \{id}
		if (<id> = ($bonus_videos [<i>].id))
			getglobaltags ($bonus_videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	elseif gotparam \{movie}
		if (<movie> = ($bonus_videos [<i>].movie))
			getglobaltags ($bonus_videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script get_movie_id_by_name 
	getarraysize ($bonus_videos)
	i = 0
	begin
	if (($bonus_videos [<i>].movie) = <movie>)
		return id = ($bonus_videos [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert \{qs(0xbb136b8e)}
endscript

script ui_bonus_videos_negative_sfx 
	ui_sfx \{menustate = generic
		uitype = negativeselect}
endscript

script ui_bonus_videos_back 
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script ui_bonus_videos_anim_in 
	mainmenu_animate \{id = options_videos_menu_id}
endscript

script ui_bonus_videos_anim_out 
	mainmenu_animate \{id = options_videos_menu_id}
endscript

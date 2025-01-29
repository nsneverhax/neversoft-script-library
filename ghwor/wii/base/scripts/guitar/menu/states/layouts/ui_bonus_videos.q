
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	locked_option_flags = {
		not_focusable
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [216 181 117 255]
	}
	uistack_createboundscreenelement {
		parent = root_window
		id = options_videos_menu_id
		Type = descinterface
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
		menu_item_text = ($Bonus_videos [0].text)
		screen_id = options_videos_menu_id
		helper_text = qs(0x03ac90f0)
	}
	GetArraySize ($Bonus_videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($Bonus_videos [<i>].id)
		movie = ($Bonus_videos [<i>].movie)
		getterritory
		if GotParam \{territory}
			if NOT (<territory> = territory_us)
				if StructureContains structure = ($Bonus_videos [<i>]) movienoesrb
					movie = ($Bonus_videos [<i>].movienoesrb)
				endif
			else
			endif
		endif
		mainmenu_setup_option {
			choose_script = ui_bonus_videos_play_video_if_not_playing
			choose_params = {movie = <movie>}
			back_script = ui_bonus_videos_back
			menu_item_text = ($Bonus_videos [<i>].text)
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
	repeat (<array_Size> - 1)
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
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_bonus_videos 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = options_videos_menu_id}
		DestroyScreenElement \{id = options_videos_menu_id}
	endif
endscript

script ui_bonus_videos_play_video_if_not_playing \{movie = 'atvi'}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScriptIsRunning \{ui_bonus_videos_play_video}
		ui_bonus_videos_play_video movie = <movie>
	endif
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_friend_feed
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	if ui_bonus_videos_is_locked movie = <movie>
	else
		audio_ui_menu_music_off
		SpawnScriptNow \{audio_crowd_silence_front_end
			params = {
				immediate = 1
			}}
		fadetoblack \{On
			alpha = 1.0
			time = 0
			z_priority = 200}
		clean_up_user_control_helpers
		NetSessionFunc \{func = removeallcontrollers}
		if ((<movie> = 'career_intro') || (<movie> = 'career_ending'))
			<Stream> = <movie>
			ui_career_movie_preload_stream Stream = <Stream>
			if ($g_career_movie_stream != None)
				printf \{qs(0xb15638bb)
					s = $g_career_movie_stream}
				StartPreLoadedStream \{$g_career_movie_stream
					buss = Encore_Events
					forcesafepreload = 1
					vol = 0.0}
			endif
		endif
		PlayMovieAndWait noblack movie = <movie> hide_glitch_frames = 4
		if ((<movie> = 'career_intro') || (<movie> = 'career_ending'))
			stopsound unique_id = ($g_career_movie_stream) fade_time = 0.1 fade_type = linear
			Change \{g_career_movie_stream = None}
		endif
		if ($invite_controller = -1)
			NetSessionFunc func = addcontrollers params = {controller = ($primary_controller)}
		else
			NetSessionFunc func = addcontrollers params = {controller = ($invite_controller)}
		endif
		menu_finish
		fadetoblack \{OFF
			time = 0}
		SpawnScriptNow \{sfx_backgrounds_new_area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
		audio_ui_menu_music_on
		add_gamertag_helper exclusive_device = <device_num>
		add_user_control_helper controller = <device_num> text = qs(0xc18d5e76) button = green z = 100000
		add_user_control_helper controller = <device_num> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	attempt_to_add_friend_feed \{parent_id = options_videos_menu_id
		menu = main_generic}
	current_menu :se_setprops \{unblock_events}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_bonus_videos_is_locked 
	GetArraySize ($Bonus_videos)
	i = 0
	begin
	if GotParam \{id}
		if (<id> = ($Bonus_videos [<i>].id))
			GetGlobalTags ($Bonus_videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{FALSE}
			endif
		endif
	elseif GotParam \{movie}
		if (<movie> = ($Bonus_videos [<i>].movie))
			GetGlobalTags ($Bonus_videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{FALSE}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script ui_bonus_videos_negative_sfx 
	ui_sfx \{menustate = Generic
		uitype = negativeselect}
endscript

script ui_bonus_videos_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script ui_bonus_videos_anim_in 
	mainmenu_animate \{id = options_videos_menu_id}
endscript

script ui_bonus_videos_anim_out 
	mainmenu_animate \{id = options_videos_menu_id}
endscript

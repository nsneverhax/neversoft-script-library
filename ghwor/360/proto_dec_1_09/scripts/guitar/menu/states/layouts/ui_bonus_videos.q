
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	locked_option_flags = {
		not_focusable
		text_focus_color = [220 30 30 255]
		text_unfocus_color = [216 181 117 255]
	}
	uistack_createboundscreenelement \{parent = root_window
		id = options_videos_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
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
		back_script = generic_event_back
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
			back_script = generic_event_back
			menu_item_text = ($Bonus_videos [<i>].text)
			screen_id = options_videos_menu_id
			helper_text = qs(0x03ac90f0)
		}
	else
		mainmenu_setup_option {
			choose_script = ui_bonus_videos_negative_sfx
			back_script = generic_event_back
			menu_item_text = qs(0x24a08263)
			screen_id = options_videos_menu_id
			helper_text = qs(0x03ac90f0)
			<locked_option_flags>
		}
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> - 1)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	if ui_bonus_videos_is_locked id = <id>
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
		destroy_song_and_musicstudio_heaps \{do_unloads}
		setbinkheap \{heap_cas_cache}
		PlayMovieAndWait noblack movie = <movie>
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
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
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
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

script get_movie_id_by_name 
	GetArraySize ($Bonus_videos)
	i = 0
	begin
	if (($Bonus_videos [<i>].movie) = <movie>)
		return id = ($Bonus_videos [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	ScriptAssert \{qs(0xbb136b8e)}
endscript

script ui_bonus_videos_negative_sfx 
	ui_sfx \{menustate = Generic
		uitype = negativeselect}
endscript

script ui_bonus_videos_anim_in 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = options_videos_menu_id}
		begin
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops {
			chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = <Pos>
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01
		}
		options_videos_menu_id :se_waitprops
		repeat 1
	endif
endscript

script ui_bonus_videos_anim_out 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = options_videos_menu_id}
		begin
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		options_videos_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01}
		options_videos_menu_id :se_waitprops
		repeat 1
	endif
endscript

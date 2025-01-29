
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	make_generic_barrel_menu \{texture = tv_clouds}
	add_generic_barrel_menu_text_item {
		text = ($Bonus_videos [0].text)
		choose_state = uistate_bonus_videos_credits
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
		add_generic_barrel_menu_text_item {
			text = ($Bonus_videos [<i>].text)
			pad_choose_script = ui_bonus_videos_play_video_if_not_playing
			pad_choose_params = {movie = <movie>}
		}
	else
		add_generic_barrel_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = ui_bonus_videos_negative_sfx}
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> - 1)
	generic_barrel_menu_finish
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if GotParam \{vmenu_id}
		AssignAlias id = <vmenu_id> alias = current_menu
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	endif
endscript

script ui_destroy_bonus_videos 
	clean_up_user_control_helpers
	destroy_generic_barrel_menu
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
		menu_music_off
		SpawnScriptNow \{BG_Crowd_Front_End_Silence
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
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
		menu_music_on
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
	SoundEvent \{event = ui_sfx_negative_select}
endscript

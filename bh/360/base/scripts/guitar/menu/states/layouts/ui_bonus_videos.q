
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	CreateScreenElement \{parent = root_window
		id = videos
		type = DescInterface
		desc = 'options_menu'
		title_text = qs(0x9560fb22)}
	if NOT videos :Desc_ResolveAlias \{name = alias_options_vmenu}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :SE_SetProps {
		event_handlers = [
			{pad_up ui_flash_scroll_arrow params = {desc_id = videos up}}
			{pad_up SmoothMenuScroll params = {Dir = -1 isVertical = true play_scroll_sound = 1}}
			{pad_down ui_flash_scroll_arrow params = {desc_id = videos down}}
			{pad_down SmoothMenuScroll params = {Dir = 1 isVertical = true play_scroll_sound = 1}}
			{pad_left ui_flash_scroll_arrow params = {desc_id = videos up}}
			{pad_left SmoothMenuScroll params = {Dir = -1 isVertical = true play_scroll_sound = 1}}
			{pad_right ui_flash_scroll_arrow params = {desc_id = videos down}}
			{pad_right SmoothMenuScroll params = {Dir = 1 isVertical = true play_scroll_sound = 1}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	add_generic_barrel_menu_text_item {
		text = ($Bonus_Videos [0].text)
		choose_state = UIstate_bonus_videos_credits
		parent = current_menu
	}
	GetArraySize ($Bonus_Videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($Bonus_Videos [<i>].id)
		movie = ($Bonus_Videos [<i>].movie)
		GetTerritory
		if GotParam \{territory}
			if NOT (<territory> = TERRITORY_US)
				if StructureContains structure = ($Bonus_Videos [<i>]) movienoesrb
					movie = ($Bonus_Videos [<i>].movienoesrb)
				endif
			else
			endif
		endif
		add_generic_barrel_menu_text_item {
			text = ($Bonus_Videos [<i>].text)
			pad_choose_script = ui_bonus_videos_play_video_if_not_playing
			pad_choose_params = {movie = <movie>}
			parent = current_menu
		}
	else
		add_generic_barrel_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = ui_bonus_videos_negative_sfx
			parent = current_menu}
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_bonus_videos 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = videos}
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
	LaunchEvent \{type = unfocus
		target = current_menu}
	current_menu :SE_SetProps \{block_events}
	if ui_bonus_videos_is_locked id = <id>
	else
		Menu_Music_Off
		spawnscriptnow \{BG_Crowd_Front_End_Silence
			params = {
				immediate = 1
			}}
		fadetoblack \{on
			alpha = 1.0
			time = 0
			z_priority = 200}
		clean_up_user_control_helpers
		NetSessionFunc \{func = RemoveAllControllers}
		destroy_song_and_musicstudio_heaps \{do_unloads}
		SetBinkHeap \{heap_cas_cache}
		PlayMovieAndWait noblack movie = <movie>
		SetBinkHeap \{heap_bink}
		create_song_and_musicstudio_heaps
		if ($invite_controller = -1)
			NetSessionFunc func = AddControllers params = {controller = ($primary_controller)}
		else
			NetSessionFunc func = AddControllers params = {controller = ($invite_controller)}
		endif
		menu_finish
		fadetoblack \{off
			time = 0}
		spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = FrontEnd_Menu_Music
			}}
		menu_music_on
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	current_menu :SE_SetProps \{unblock_events}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script ui_bonus_videos_is_locked 
	GetArraySize ($Bonus_Videos)
	i = 0
	begin
	if GotParam \{id}
		if (<id> = ($Bonus_Videos [<i>].id))
			GetGlobalTags ($Bonus_Videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	elseif GotParam \{movie}
		if (<movie> = ($Bonus_Videos [<i>].movie))
			GetGlobalTags ($Bonus_Videos [<i>].id)
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
	GetArraySize ($Bonus_Videos)
	i = 0
	begin
	if (($Bonus_Videos [<i>].movie) = <movie>)
		return id = ($Bonus_Videos [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	ScriptAssert \{qs(0xbb136b8e)}
endscript

script ui_bonus_videos_negative_sfx 
	SoundEvent \{event = UI_SFX_Negative_Select}
endscript

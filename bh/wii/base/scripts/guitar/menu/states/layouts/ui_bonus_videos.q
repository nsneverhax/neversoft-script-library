
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	CreateScreenElement \{parent = root_window
		id = videos
		Type = descinterface
		desc = 'options_menu'
		title_text = qs(0x9560fb22)}
	if NOT videos :desc_resolvealias \{Name = 0xa39f6109}
		return
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :se_setprops {
		event_handlers = [
			{pad_up 0x0c5f870a params = {desc_id = videos up}}
			{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true play_scroll_sound = 1}}
			{pad_down 0x0c5f870a params = {desc_id = videos down}}
			{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true play_scroll_sound = 1}}
			{pad_left 0x0c5f870a params = {desc_id = videos up}}
			{pad_left smoothmenuscroll params = {Dir = -1 isvertical = true play_scroll_sound = 1}}
			{pad_right 0x0c5f870a params = {desc_id = videos down}}
			{pad_right smoothmenuscroll params = {Dir = 1 isvertical = true play_scroll_sound = 1}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	add_generic_barrel_menu_text_item {
		text = ($Bonus_videos [0].text)
		choose_state = uistate_bonus_videos_credits
		parent = current_menu
	}
	GetArraySize ($Bonus_videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($Bonus_videos [<i>].id)
		movie = ($Bonus_videos [<i>].movie)
		if NOT isnabuild
			if StructureContains structure = ($Bonus_videos [<i>]) movienoesrb
				movie = ($Bonus_videos [<i>].movienoesrb)
			endif
		endif
		add_generic_barrel_menu_text_item {
			text = ($Bonus_videos [<i>].text)
			pad_choose_script = ui_bonus_videos_play_video
			pad_choose_params = {movie = <movie>}
			parent = current_menu
		}
	else
		add_generic_barrel_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = ui_bonus_videos_negative_sfx
			parent = current_menu}
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
	DestroyScreenElement \{id = videos}
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
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
		PlayMovieAndWait noblack movie = <movie>
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
		add_gamertag_helper exclusive_device = <device_num>
		add_user_control_helper controller = <device_num> text = qs(0xc18d5e76) button = green z = 100000
		add_user_control_helper controller = <device_num> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	current_menu :se_setprops \{unblock_events}
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

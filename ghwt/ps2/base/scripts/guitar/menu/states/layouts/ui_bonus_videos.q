
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	make_generic_menu \{title = qs(0x884db659)
		scrolling}
	add_generic_menu_text_item {
		text = ($Bonus_videos [0].text)
		choose_state = uistate_bonus_videos_credits
	}
	GetArraySize ($Bonus_videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($Bonus_videos [<i>].id)
		if (($Bonus_videos [<i>].id) = ghmetallica)
			movie = ($Bonus_videos [<i>].movie)
			if IsPAL
				movie = 'gh_metallica_noesrb'
			endif
			add_generic_menu_text_item {
				text = ($Bonus_videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($Bonus_videos [<i>]) movie = <movie>}
			}
		else
			add_generic_menu_text_item {
				text = ($Bonus_videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($Bonus_videos [<i>])}
			}
		endif
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = ui_bonus_videos_negative_sfx}
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> - 1)
	menu_finish
endscript

script ui_destroy_bonus_videos 
	destroy_generic_menu
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

endscript

script ui_bonus_videos_negative_sfx 
	SoundEvent \{event = ui_sfx_negative_select}
endscript

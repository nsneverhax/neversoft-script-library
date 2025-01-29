
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	KillSpawnedScript \{Name = ui_destroy_bonus_videos_spawned}
	set_bink_heap_state \{state = big}
	0x5e1a3a04 \{title = qs(0x9560fb22)
		pad_back_script = 0x462881bd
		option_arrows}
	GetArraySize ($Bonus_videos)
	i = 0
	0xd7691599 = 0
	begin
	if NOT ui_bonus_videos_is_locked id = ($Bonus_videos [<i>].id)
		if (($Bonus_videos [<i>].id) = Credits)
			0x9d0992fe {
				text = ($Bonus_videos [<i>].text)
				choose_state = uistate_bonus_videos_credits
			}
		else
			movie = ($Bonus_videos [<i>].movie)
			if (IsPAL)
				0x8dbdaee4 \{'VIDEO: IsPal'}
				if (<movie> = 'band_hero_teaser')
					movie = 'Band_Hero_Teaser_NO_ESRB'
				elseif (<movie> = 'djhero_teaser')
					movie = 'DJHero_Teaser_NO_ESRB'
				endif
			endif
			0x8dbdaee4 'VIDEO: %v' v = <movie>
			0x9d0992fe {
				text = ($Bonus_videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($Bonus_videos [<i>]) movie = <movie>}
			}
		endif
	else
		<0xd7691599> = (<0xd7691599> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<0xd7691599> > 0)
		begin
		0x9d0992fe \{text = qs(0x24a08263)
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			focus_rgba = [
				160
				150
				140
				175
			]
			unfocus_rgba = [
				160
				150
				140
				175
			]}
		repeat <0xd7691599>
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_bonus_videos 
	SpawnScriptNow \{ui_destroy_bonus_videos_spawned}
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
endscript

script ui_destroy_bonus_videos_spawned 
	if ($bink_heap_state = small)
		return
	endif
	KillMovie \{textureSlot = 1}
	waitforallmoviestofinish
	set_bink_heap_state \{state = small}
	menu_music_on
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = frontend_menu_music
		}}
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ui_bonus_videos_is_locked id = <id>
		return
	endif
	ui_event_block \{event = menu_unfocus}
	current_menu :se_setprops \{block_events}
	DestroyScreenElement \{id = preview_movie}
	waitforallmoviestofinish
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
	0xe5a305c6
	PlayMovieAndWait noblack movie = <movie>
	0xd3f993c8 \{sustain}
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

endscript

script ui_bonus_videos_negative_sfx 
	SoundEvent \{event = ui_sfx_negative_select}
endscript

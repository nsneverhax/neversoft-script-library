
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	KillSpawnedScript \{Name = ui_destroy_bonus_videos_spawned}
	set_bink_heap_state \{state = big}
	CreateScreenElement {
		Type = descinterface
		desc = 'videos'
		parent = root_window
		id = current_menu_anchor
		just = [center center]
		exclusive_device = ($primary_controller)
		tags = {
			current_preview = None
		}
	}
	if <id> :desc_resolvealias Name = alias_vmenu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_back
					generic_event_back
				}
			]}
		current_menu :obj_spawnscript \{highlight_motion}
		GetArraySize ($Bonus_videos)
		i = 0
		0xd7691599 = 0
		begin
		if NOT ui_bonus_videos_is_locked id = ($Bonus_videos [<i>].id)
			if (($Bonus_videos [<i>].id) = Credits)
				add_menu_frontend_item {
					text = ($Bonus_videos [<i>].text)
					choose_state = uistate_bonus_videos_credits
					focus_script = ui_bonus_videos_focus
					focus_params = {Credits}
					unfocus_script = ui_bonus_videos_unfocus
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
				add_menu_frontend_item {
					text = ($Bonus_videos [<i>].text)
					pad_choose_script = ui_bonus_videos_play_video
					pad_choose_params = {($Bonus_videos [<i>]) movie = <movie>}
					focus_script = ui_bonus_videos_focus
					focus_params = {($Bonus_videos [<i>])}
					unfocus_script = ui_bonus_videos_unfocus
				}
			endif
		else
			<0xd7691599> = (<0xd7691599> + 1)
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<0xd7691599> > 0)
			begin
			add_menu_frontend_item {
				text = qs(0x24a08263)
				pad_choose_script = nullscript
				pad_choose_sound = ui_bonus_videos_negative_sfx
				focus_script = ui_bonus_videos_focus
				focus_params = {($Bonus_videos [0]) locked}
				unfocus_script = ui_bonus_videos_unfocus
				rgba = [160 150 140 175]
				not_focusable
			}
			repeat <0xd7691599>
		endif
		GetScreenElementDims id = <item_id>
		<height> = (<height> * <array_Size>)
		current_menu :SetTags {total_height = <height>}
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_bonus_videos 
	KillSpawnedScript \{Name = ui_bonus_video_preview}
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
	KillSpawnedScript \{Name = ui_bonus_video_preview}
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
	spawnscript ui_bonus_video_preview params = <...>
	current_menu :se_setprops \{unblock_events}
	ui_event_block \{event = menu_focus}
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

script ui_bonus_videos_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_bonus_videos_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_bonus_videos_focus 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	current_menu :se_setprops \{block_events}
	Obj_GetID
	GetTags
	se_setprops \{rgba = [
			0
			0
			0
			255
		]}
	<objID> :se_getparentid
	current_menu :GetTags \{total_height}
	GetScreenElementPosition id = <objID>
	scroll_perc = ((<screenelementpos>.(0.0, 1.0)) / (<total_height>))
	scroll_len = 370
	scroll_pos = (((<scroll_perc> * 370) * (0.0, 1.0)) + (1.0, 0.0))
	current_menu_anchor :se_setprops setlist_b_scrollthumb_pos = <scroll_pos>
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		<objID> :se_getparentid
		<parent_id> :se_getprops
		hscale = ((1.0, 0.0).<Scale>)
		<parent_id> :se_getparentid
		<parent_id> :se_getprops
		<resolved_id> :se_setprops rot_angle = <rot_angle>
		GetScreenElementDims id = <objID>
		<width> = (<width> * <hscale>)
		<0xc446b6d3> = 15
		Scale = (((1.0, 0.0) * ((<width> + (<0xc446b6d3> * 2)) / 256.0)) + (0.0, 1.0))
		GetScreenElementPosition id = <objID> summed
		<screenelementpos> = (<screenelementpos> - ((1.0, 0.0) * <0xc446b6d3>))
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<screenelementpos> = (<screenelementpos> - ((1.0, 0.0) * <0xc446b6d3>))
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<screenelementpos> = (<screenelementpos> - ((1.0, 0.0) * <0xc446b6d3>))
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
	current_menu :se_setprops \{unblock_events}
	if ((GotParam Credits) || (GotParam locked))
		current_menu_anchor :se_setprops \{video_placeholder_texture = video_placeholder}
		current_menu_anchor :se_setprops \{info_text = qs(0x00000000)}
	else
		formatText checksumName = 0xb5a0f202 'Video_%n' n = <movie>
		current_menu_anchor :se_setprops video_placeholder_texture = <0xb5a0f202>
		formatText checksumName = movie_checksum '%m' m = <movie>
		current_menu_anchor :se_setprops \{info_text = qs(0x00000000)}
	endif
endscript

script ui_bonus_video_preview \{movie = 'atvi'}
	Wait \{0.35000002
		Second}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	current_menu_anchor :GetTags
	clean_up_user_control_helpers
	if ((GotParam Credits) || (GotParam locked))
		DestroyScreenElement \{id = preview_movie}
		waitforallmoviestofinish
		current_menu_anchor :se_setprops \{info_text = qs(0x00000000)}
		menu_music_on
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		current_menu_anchor :se_setprops \{video_placeholder_alpha = 1.0
			time = 0.1}
	elseif GotParam \{movie}
		menu_music_off
		SpawnScriptNow \{BG_Crowd_Front_End_Silence
			params = {
				immediate = 1
			}}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if (<movie> = <current_preview>)
			if ScreenElementExists \{id = preview_movie}
				return
			endif
		endif
		if current_menu_anchor :desc_resolvealias \{Name = alias_video_container}
			DestroyScreenElement \{id = preview_movie}
			waitforallmoviestofinish
			formatText checksumName = movie_checksum '%m' m = <movie>
			current_menu_anchor :se_setprops \{info_text = qs(0x00000000)}
			set_bink_heap_state \{state = big}
			if GotParam \{locked}
				alpha = 0.1
			endif
			CreateScreenElement {
				Type = movieelement
				parent = <resolved_id>
				id = preview_movie
				dims = (490.0, 275.0)
				just = [center center]
				pos_anchor = [center center]
				Pos = (0.0, 0.0)
				textureSlot = 1
				TexturePri = 1000
				no_hold
				movie = <movie>
				alpha = <alpha>
			}
			current_menu_anchor :SetTags current_preview = <movie>
			begin
			if IsMoviePlaying \{textureSlot = 1}
				break
			endif
			Wait \{1
				gameframes}
			repeat
			current_menu_anchor :se_setprops \{video_placeholder_alpha = 0.0
				time = 0.1}
		endif
	endif
endscript

script ui_bonus_videos_unfocus 
	se_setprops \{rgba = [
			255
			255
			255
			255
		]}
endscript

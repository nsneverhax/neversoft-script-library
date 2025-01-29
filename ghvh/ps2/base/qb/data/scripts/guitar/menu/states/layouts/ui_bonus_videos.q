
script ui_create_bonus_videos 
	Change \{rich_presence_context = presence_videos}
	CreateScreenElement {
		Type = descinterface
		desc = 'videos'
		parent = root_window
		id = current_menu_anchor
		just = [center center]
		exclusive_device = ($primary_controller)
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
		begin
		if NOT ui_bonus_videos_is_locked id = ($Bonus_videos [<i>].id)
			if (($Bonus_videos [<i>].id) = Credits)
				add_menu_frontend_item {
					text = ($Bonus_videos [<i>].text)
					choose_state = uistate_bonus_videos_credits
					focus_script = ui_bonus_videos_focus
					unfocus_script = ui_bonus_videos_unfocus
				}
			else
				add_menu_frontend_item {
					text = ($Bonus_videos [<i>].text)
					pad_choose_script = ui_bonus_videos_play_video
					pad_choose_params = {($Bonus_videos [<i>])}
					focus_script = ui_bonus_videos_focus
					unfocus_script = ui_bonus_videos_unfocus
				}
			endif
		else
			add_menu_frontend_item \{text = qs(0x24a08263)
				pad_choose_script = ui_bonus_videos_negative_sfx
				focus_script = ui_bonus_videos_focus
				unfocus_script = ui_bonus_videos_unfocus
				rgba = [
					110
					100
					90
					175
				]}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		GetScreenElementDims id = <item_id>
		<height> = (<height> * <array_Size>)
		current_menu :SetTags {total_height = <height>}
	endif
	menu_finish
endscript

script ui_destroy_bonus_videos 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
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

script ui_bonus_videos_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_bonus_videos_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_bonus_videos_focus 
endscript

script ui_bonus_videos_unfocus 
endscript

freestyle_drum_nowbar_time = 0.15
freestyle_drum_light_order = [
	green
	orange
	blue
	yellow
	red
	Purple
]
drum_gem_colors = [
	green
	red
	yellow
	blue
	orange
	white
]
freestyle_drummer_hit_anim_params = [
	{
		piece = kick
		drumkit_params = {
			target = kick
			anim = gh4_drummer_mii_bassdrum
		}
	}
	{
		piece = snare
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_snare
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_snare
			hand = 'right'
		}
		drumkit_params = {
			target = snare
			anim = gh4_drummer_mii_snare
		}
	}
	{
		piece = tom_mid
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_tom01
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_tom01
			hand = 'right'
		}
		drumkit_params = {
			target = tom1
			anim = gh4_drummer_mii_tom01
		}
	}
	{
		piece = tom_hi
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_tom02
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_tom02
			hand = 'right'
		}
		drumkit_params = {
			target = tom2
			anim = gh4_drummer_mii_tom02
		}
	}
	{
		piece = crash
		drummer_params_left = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_cymbal01
			hand = 'right'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_cymbal01
			hand = 'right'
		}
		drumkit_params = {
			target = crash1
			anim = gh4_drummer_mii_cymbal01
		}
	}
	{
		piece = hi_hat_closed
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_hihat
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_hihat
			hand = 'right'
		}
		drumkit_params = {
			target = hihat
			anim = gh4_drummer_mii_hihat
		}
	}
	{
		piece = hi_hat_open
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_hihat
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_hihat
			hand = 'right'
		}
		drumkit_params = {
			target = hihat
			anim = gh4_drummer_mii_hihat
		}
	}
	{
		piece = ride
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_hihat
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_hihat
			hand = 'right'
		}
		drumkit_params = {
			target = hihat
			anim = gh4_drummer_mii_hihat
		}
	}
	{
		piece = cowbell
		drummer_params_left = {
			target = LeftArmPartial
			anim = gh4_drummer_mii_lefthand_hihat
			hand = 'left'
		}
		drummer_params_right = {
			target = RightArmPartial
			anim = gh4_drummer_mii_righthand_hihat
			hand = 'right'
		}
		drumkit_params = {
			target = hihat
			anim = gh4_drummer_mii_hihat
		}
	}
]

script freestyle_drummer_play_hit_anim 
	GetArraySize \{$freestyle_drummer_hit_anim_params}
	i = 0
	anim_params = {}
	character = ($freestyle_player_data [<Player>].character)
	begin
	if (($freestyle_drummer_hit_anim_params [<i>].piece) = <piece>)
		<anim_params> = ($freestyle_drummer_hit_anim_params [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<hand> = right)
		drummer_param_name = drummer_params_right
	else
		drummer_param_name = drummer_params_left
	endif
	if StructureContains structure = <anim_params> <drummer_param_name>
		drummer_params = (<anim_params>.<drummer_param_name>)
		freestyle_drummer_play_anim {
			anim_target = (<drummer_params>.target)
			anim = (<drummer_params>.anim)
			hand = (<drummer_params>.hand)
			kill_idle
			character = <character>
		}
	endif
	if StructureContains structure = <anim_params> drumkit_params
		drumkit_params = (<anim_params>.drumkit_params)
		freestyle_drummer_play_anim {
			anim_target = (<drumkit_params>.target)
			anim = (<drumkit_params>.anim)
			character = <character>
		}
	endif
endscript

script freestyle_drum_hit \{drum = 0}
	freestyle_mii_notify_note_played Player = <Player>
	freestyle_increment_total_notes_played Player = <Player>
	freestyle_drummer_play_hit_anim <...>
	freestyle_hint_notify_drum_note_played <...>
	if (($freestyle_player_data [<Player>].has_highway = true) && (<auto_play_note> = FALSE))
		freestyle_spawn_drum_gem <...>
		freestyle_stats_drum_note_played <...>
	endif
	if (($freestyle_game_mode) = tutorial)
		if ScreenElementExists \{id = freestyle_tutorial_info_pane}
			freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
			LaunchEvent Type = drum_hit target = <resolved_id> data = {<...>}
		endif
	endif
	if ScreenElementExists \{id = freestyle_nunchuk_hud}
		freestyle_nunchuk_hud :desc_resolvealias \{Name = alias_event_handler}
		LaunchEvent Type = drum_hit target = <resolved_id> data = {<...>}
	endif
endscript

script freestyle_find_drum_light_index 
	RequireParams \{[
			light
		]
		all}
	GetArraySize \{$freestyle_drum_light_order}
	i = 0
	light_index = -1
	begin
	if ($freestyle_drum_light_order [<i>] = <light>)
		<light_index> = <i>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<light_index> = -1)
		ScriptAssert 'Unable to find index for drum light %a' a = <light>
	endif
	return light_index = <light_index>
endscript

script find_drum_color_index 
	RequireParams \{[
			button
		]
		all}
	GetArraySize \{$drum_gem_colors}
	i = 0
	button_index = -1
	begin
	if ($drum_gem_colors [<i>] = <button>)
		<button_index> = <i>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<button_index> = -1)
		ScriptAssert 'Unable to find index for drum button %a' a = <button>
	endif
	return button_index = <button_index>
endscript

script freestyle_spawn_drum_gem 
	RequireParams \{[
			Player
			button
			gem_mask
		]
		all}
	highway_player = ($freestyle_player_data [<Player>].highway_player)
	nowbar_offset = ($freestyle_player_data [<Player>].nowbar_offset)
	GetSongTimeMs
	marker = (<time> - <nowbar_offset>)
	if NOT ($freestyle_player_data [<Player>].instrument = drums)
		gem_type = played
	else
		gem_type = None
	endif
	freestyle_spawn_gems_on_highway {
		highway_player = <highway_player>
		event_mask = <gem_mask>
		marker = <marker>
		length = 0
		gem_type = <gem_type>
		play_spawn_anim = 1
		is_drum = true
	}
	if (<button> = Purple)
		<button> = white
	endif
	find_drum_color_index button = <button>
	gem = <button_index>
	if (<gem> > -1)
		if NOT (<button> = white)
			button_text = ($gem_colors_text [<gem>])
			formatText checksumName = button_release_spawn 'button_%c_p%p' c = <button_text> p = <highway_player> AddToStringLookup = true
			freestyle_update_single_note button_index = <gem> highway_player = <highway_player> state = pressed
			hold_time = ($freestyle_drum_nowbar_time * <velocity>)
			if (<hold_time> < ($freestyle_drum_nowbar_time * 0.5))
				<hold_time> = ($freestyle_drum_nowbar_time * 0.5)
			endif
			KillSpawnedScript id = <button_release_spawn>
			SpawnScriptLater {
				freestyle_single_note_releaser
				id = <button_release_spawn>
				params = {delay = <hold_time> button_index = <gem> highway_player = <highway_player>}
			}
		endif
	endif
endscript

script freestyle_single_note_releaser 
	RequireParams \{[
			delay
			button_index
			highway_player
		]
		all}
	Wait <delay> Seconds
	freestyle_update_single_note button_index = <button_index> highway_player = <highway_player> state = Released
endscript

script freestyle_toggle_drum_assist 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = drum_assist
	toogle_bool bool_value = <drum_assist>
	freestyle_set_player_param Player = <Player> param = drum_assist value = <toggled_bool>
	if (($freestyle_game_mode) = tutorial)
		freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
		LaunchEvent Type = drum_helper_toggle target = <resolved_id>
	endif
	freestyle_clear_and_respawn_player_gem_tracks Player = <Player>
	freestyle_hint_notify_drum_helper_changed Player = <Player>
	freestyle_drum_assist_hud_update Player = <Player>
endscript

script freestyle_notify_hat_mode_changed 
	printf 'Player %p changed hat mode to %h' p = <Player> h = <hat_mode>
	freestyle_set_player_param Player = <Player> param = hat_mode value = <hat_mode>
	freestyle_update_audio_effects_hud_drum Player = <Player>
	freestyle_hint_notify_hat_mode_changed Player = <Player>
endscript

script freestyle_notify_selected_drum_pads_changed 
	printf {
		'Player %p changed selected pads (nunchuk=%n, remote=%r)'
		p = <Player>
		n = <nunchuk_pad>
		r = <remote_pad>
	}
	freestyle_nunchuk_hud_drum_pads_changed <...>
endscript

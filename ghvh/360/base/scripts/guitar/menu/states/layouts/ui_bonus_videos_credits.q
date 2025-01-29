
script ui_create_bonus_videos_credits 
	cas_destroy_all_characters
	generic_ui_destroy
	SpawnScriptNow create_credits_menu params = {<...>}
endscript

script ui_destroy_bonus_videos_credits 
	SpawnScriptNow \{end_credits_button}
endscript

script ui_create_endgame_unlock 
	cas_destroy_all_characters
	generic_ui_destroy
	SpawnScriptNow create_endgame_unlock params = {<...>}
endscript

script ui_destroy_endgame_unlock 
	printf \{channel = bort
		qs(0xe874b7ae)}
	DestroyScreenElement \{id = endgame_unlock_screen}
endscript

script create_endgame_unlock 
	printf \{channel = bort
		qs(0x927621f4)}
	if ScreenElementExists \{id = endgame_unlock_screen}
		DestroyScreenElement \{id = endgame_unlock_screen}
	endif
	textures_array = []
	AddArrayElement array = <textures_array> element = bnd_vintagehalen
	textures_array = <array>
	CreateScreenElement {
		parent = root_window
		id = endgame_unlock_screen
		Type = descinterface
		desc = 'rewards'
		exclusive_device = <exclusive_device>
		rewards_image_placeholder_texture = (<textures_array> [0])
		careercomplete_alpha = 1.0
	}
	SoundEvent \{event = unlock_new_item}
	if <id> :desc_resolvealias Name = alias_list_menu
	else
		ScriptAssert \{qs(0xa6c07304)}
	endif
	CreateScreenElement {
		parent = <resolved_id>
		Type = descinterface
		desc = 'rewards_unlockable'
		autosizedims = true
		unlockable_text = qs(0x7b37188d)
		unlockable_control_pos = {(0.0, 0.0) relative}
		unlockable_rgba = (($g_menu_colors).menu_main_focus)
		rewards_checkbox_alpha = 1
		unlockable_alpha = 1
	}
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{pad_choose generic_event_replace params = {state = uistate_bonus_videos_credits data = {end_credits = 1}}}
		]
	}
	<id> :obj_spawnscript anim_reward params = {menu_id = endgame_unlock_screen index = 0 item_textures = <textures_array>}
	SpawnScriptNow set_focus_to_menu params = {w_time = 1.5 menu_id = <resolved_id>}
	if ResolveScreenElementID \{id = [
				{
					id = endgame_unlock_screen
				}
				{
					local_id = rewards_container
				}
				{
					local_id = go_buy
				}
			]}
		<resolved_id> :se_setprops text = qs(0x0eeeefb9)
	endif
	endgame_unlock_screen :Obj_SpawnScriptNow \{endgame_unlock_screen_anim}
	unlockvanhalenaltbandcheat
	menu_music_on
endscript

script endgame_unlock_screen_anim 
	begin
	Wait \{5
		Seconds}
	rewards_image_pulse_anim
	repeat
endscript

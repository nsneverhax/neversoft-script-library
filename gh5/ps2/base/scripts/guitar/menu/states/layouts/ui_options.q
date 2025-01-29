ui_options_from_submenu = 0

script ui_create_options 
	StartRendering
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	Change \{top_rockers_enabled = 0}
	Change \{memcard_after_func = None}
	update_ingame_controllers controller = ($primary_controller)
	CreateScreenElement {
		Type = descinterface
		desc = 'settings_menu'
		id = current_menu_anchor
		parent = root_window
		just = [center center]
		exclusive_device = ($primary_controller)
	}
	if <id> :desc_resolvealias Name = alias_menu_items_text
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
		add_menu_frontend_item \{text = qs(0x3e3a98e6)
			choose_state = uistate_options_cheats
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [
				255
				255
				255
				255
			]}
		add_menu_frontend_item {
			text = qs(0x9baf87e5)
			pad_choose_script = menu_choose_band_make_selection
			pad_choose_params = {from_options = 1 device_num = ($primary_controller) event_params = {event = menu_back}}
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [255 255 255 255]
		}
		if NOT current_band_has_band_name
			<item_id> :se_setprops not_focusable rgba = [140 140 140 255]
		endif
		add_menu_frontend_item \{text = qs(0x98846417)
			pad_choose_script = ui_options_continue_to_data_submenu
			pad_choose_params = {
				is_popup
			}
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [
				255
				255
				255
				255
			]}
		add_menu_frontend_item \{text = qs(0x550b8c8e)
			choose_state = uistate_options_calibrate_lag
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [
				255
				255
				255
				255
			]}
		add_menu_frontend_item \{text = qs(0xa0345d1c)
			choose_state = uistate_options_audio
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [
				255
				255
				255
				255
			]}
		add_menu_frontend_item \{text = qs(0x7305a834)
			pad_choose_script = ui_options_continue_to_settings_submenu
			pad_choose_params = {
				is_popup
			}
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [
				255
				255
				255
				255
			]}
		add_menu_frontend_item \{text = qs(0x9560fb22)
			choose_state = uistate_bonus_videos
			focus_script = ui_options_focus
			unfocus_script = ui_options_unfocus
			rgba = [
				255
				255
				255
				255
			]}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			curr_id = (<children> [<i>])
			<curr_id> :se_setprops {
				tags = {index = <i>}
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
		current_menu_anchor :Obj_SpawnScriptNow \{0x44f4a908}
	endif
	clean_up_user_control_helpers
	menu_finish
endscript

script ui_return_options 
	clean_up_user_control_helpers
	menu_finish
endscript

script ui_options_anim_in 
	if NOT ($ui_options_from_submenu)
		menu_transition_in \{menu = current_menu_anchor}
	else
		Change \{ui_options_from_submenu = 0}
	endif
	current_menu_anchor :se_setprops \{highlight_alpha = 1}
	current_menu :obj_spawnscript \{highlight_motion}
endscript

script ui_options_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_destroy_options 
	KillSpawnedScript \{Name = 0x44f4a908}
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	Type = guitar
	text = qs(0x9504b94a)
	if NOT IsGuitarController controller = <controller>
		Type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			Type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {Type = <Type> text = <text>}
endscript

script 0x44f4a908 
	if desc_resolvealias \{Name = 0xb8c758ee
			param = 0xccfaaa11}
		<0xccfaaa11> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
endscript

script ui_options_set_settings 
	if ScreenElementExists \{id = current_menu}
		GetGlobalTags \{user_options}
		current_menu :SetTags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	RemoveParameter \{event}
	RemoveParameter \{controller}
	if NOT ($playing_song)
		if CheckForSignIn local controller_index = <device_num>
			RemoveParameter \{device_num}
			if ScreenElementExists \{id = current_menu}
				GetGlobalTags \{user_options}
				new_user_options = <...>
				current_menu :GetSingleTag \{user_options}
				if GotParam \{user_options}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						generic_menu_pad_back_sound
						SpawnScriptNow \{ui_memcard_autosave_replace}
						return
					endif
				endif
			endif
		endif
	endif
	generic_event_back
endscript

script ui_options_focus 
	Obj_GetID
	GetTags
	se_setprops rgba = (($default_color_scheme).text_focus_color)
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
		<0xc446b6d3> = 10
		Scale = (((1.0, 0.0) * ((<width> + (<0xc446b6d3> * 2)) / 256.0)) + (0.0, 1.5))
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
endscript

script ui_options_unfocus 
	se_setprops rgba = (($default_color_scheme).text_color)
endscript

script ui_options_continue_to_settings_submenu 
	if is_ui_event_running
		return \{FALSE}
	endif
	current_menu :Obj_KillSpawnedScript \{Name = highlight_motion}
	ui_event_block event = menu_change data = {state = uistate_options_settings <...>}
endscript

script ui_options_continue_to_data_submenu 
	if is_ui_event_running
		return \{FALSE}
	endif
	current_menu :Obj_KillSpawnedScript \{Name = highlight_motion}
	ui_event_block event = menu_change data = {state = uistate_options_data <...>}
endscript

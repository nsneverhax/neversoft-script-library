freestyle_styleselect_after_song = 0
freestyle_needs_advanced_setup = 0

script ui_create_freestyle_styleselect 
	CreateScreenElement \{parent = root_window
		id = freestyle_styleselect_tree
		Type = descinterface
		desc = 'freestyle_styleselect_tree_v2'}
	freestyle_styleselect_tree :desc_resolvealias \{Name = 0x8db0944c}
	<resolved_id> :desc_resolvealias Name = 0x220750d1
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	freestyle_styleselect_tree :desc_resolvealias \{Name = alias_freestyle_styleselect_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = styleselect}}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_back freestyle_revert_from_styleselect}
		]
	}
	LaunchEvent Type = focus target = <resolved_id>
	GetArraySize ($freestyle_styleset)
	counter = 0
	begin
	if freestyle_find_style_index_by_menu_order menu_order = (<counter> + 1)
		CreateScreenElement {
			parent = <resolved_id>
			id = ($freestyle_styleset [<style_index>].id)
			dims = (480.0, 50.0)
			Type = descinterface
			event_handlers = [
				{pad_choose freestyle_select_style params = {index = <style_index>}}
				{focus freestyle_focus_style params = {index = <style_index>}}
				{focus generic_barrel_menu_item_focus}
				{unfocus generic_barrel_menu_item_unfocus}
			]
			desc = 'menurow_txt_desc'
			menurow_txt_item_text = ($freestyle_styleset [<style_index>].visible_name)
			menurow_internal_just = [center center]
			menurow_just = [center center]
		}
		LaunchEvent Type = unfocus target = <id>
	endif
	counter = (<counter> + 1)
	repeat <array_Size>
endscript

script freestyle_focus_style \{index = 0}
	freestyle_play_preview_stream style_index = <index>
endscript

script freestyle_select_style \{index = 0}
	freestyle_apply_style_settings index = <index>
	Change \{freestyle_game_mode = standard}
	Change \{freestyle_recording_mode = record}
	Change \{freestyle_postgame_viewed = 0}
	generic_event_replace \{data = {
			state = uistate_freestyle_game
			clear_previous_stack
		}}
endscript

script freestyle_revert_from_styleselect 
	if (($freestyle_styleselect_after_song) = 0)
		generic_event_back
	elseif (($freestyle_styleselect_after_song) = 1)
		generic_event_choose \{state = uistate_freestyle_mainmenu}
	endif
endscript

script ui_destroy_freestyle_styleselect 
	freestyle_stop_preview_stream
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freestyle_styleselect_tree}
	generic_ui_destroy
endscript

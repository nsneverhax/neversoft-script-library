freestyle_styleselect_after_song = 0
freestyle_needs_advanced_setup = 0

script ui_create_freestyle_styleselect 
	CreateScreenElement \{parent = root_window
		id = freestyle_styleselect_tree
		Type = descinterface
		desc = 'freestyle_styleselect_tree_v2'}
	freestyle_styleselect_tree :desc_resolvealias \{Name = banner_animatable}
	<resolved_id> :obj_spawnscript ui_shakeytime
	freestyle_styleselect_tree :desc_resolvealias \{Name = alias_skull_add_container}
	<resolved_id> :obj_spawnscript ui_shakey
	<resolved_id> :obj_spawnscript ui_frazzmatazz
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
	create_2d_spring_system \{desc_id = freestyle_styleselect_tree
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	GetArraySize ($freestyle_styleset)
	counter = 0
	begin
	if freestyle_find_style_index_by_menu_order menu_order = (<counter> + 1)
		CreateScreenElement {
			parent = <resolved_id>
			id = ($freestyle_styleset [<style_index>].id)
			dims = (512.0, 56.0)
			Type = TextBlockElement
			just = [center center]
			internal_just = [left center]
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			text = ($freestyle_styleset [<style_index>].visible_name)
			font = fontgrid_title_a1
			internal_scale = (1.0, 1.0)
			event_handlers = [
				{pad_choose freestyle_select_style params = {index = <style_index>}}
				{focus freestyle_focus_style params = {index = <style_index>}}
				{focus freestyle_menu_option_focus}
				{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_styleselect_tree Pos = (-8.0, 4.0) Scale = (0.75, 0.75)}}
				{unfocus freestyle_menu_option_unfocus}
			]
			Scale = ($freestyle_unfocus_scale)
			rgba = ($freestyle_unfocus_rgba)
			z_priority = 12
		}
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

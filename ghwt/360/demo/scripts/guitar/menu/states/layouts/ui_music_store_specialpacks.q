
script ui_create_music_store_specialpacks 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	music_store_set_previous_history previous_history = [] new_entry = qs(0x1ebfcbab) <do_not_animate>
	music_store_pre_sort_list list = <list> state_list = [alpha artist date price]
	getarraysize <list>
	if (<array_size> > 0)
		i = 0
		begin
		add_music_store_purchase_item {
			text = ((<list> [<i>]).name)
			price = ((<list> [<i>]).price)
			choose_state = uistate_music_store_specialpacks_details
			choose_state_data = {previous_history = <previous_history> pack_struct = (<list> [<i>])}
			additional_focus_script = music_store_pack_focus
			additional_focus_params = {option_struct = (<list> [<i>])}
			additional_unfocus_script = music_store_pack_unfocus
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
	spawnscriptnow \{music_store_fade_in_options}
	add_user_control_helper \{text = qs(0x52d4ae3c)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0c4db477)
		button = red
		z = 100000}
	music_store_add_sort_info state_list = [alpha artist date price] previous_history = <previous_history> list = <list>
endscript

script ui_destroy_music_store_specialpacks 
	destroy_music_store_menus
endscript

script ui_deinit_music_store_specialpacks 
	music_store_reset_sort_index
endscript

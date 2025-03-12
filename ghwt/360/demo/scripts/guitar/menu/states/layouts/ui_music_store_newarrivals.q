
script ui_create_music_store_newarrivals 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	music_store_set_previous_history previous_history = [] new_entry = qs(0xad0d2e6d) <do_not_animate>
	music_store_pre_sort_list list = <list> state_list = [alpha artist date type price]
	getarraysize <list>
	if (<array_size> > 0)
		i = 0
		begin
		add_music_store_purchase_item {
			text = ((<list> [<i>]).name)
			price = ((<list> [<i>]).price)
			pad_choose_script = music_store_new_arrivals_decide_action
			pad_choose_params = {previous_history = <previous_history> option_struct = (<list> [<i>]) list = <list>}
			additional_focus_script = music_store_new_arrivals_decide_focus
			additional_focus_params = {option_struct = (<list> [<i>])}
			additional_unfocus_script = music_store_new_arrivals_decide_unfocus
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
	music_store_add_sort_info state_list = [alpha artist date type price] previous_history = <previous_history> list = <list>
endscript

script ui_destroy_music_store_newarrivals 
	destroy_music_store_menus
endscript

script ui_deinit_music_store_newarrivals 
	music_store_reset_sort_index
endscript

script music_store_new_arrivals_decide_action 
	if ((<option_struct>.type) = song)
		generic_blocking_execute_script pad_script = generic_event_choose pad_params = {state = uistate_music_store_songs_details data = {<...> song_struct = <option_struct> full_list = <list>}}
	elseif ((<option_struct>.type) = pack)
		generic_blocking_execute_script pad_script = generic_event_choose pad_params = {state = uistate_music_store_specialpacks_details data = {<...> pack_struct = <option_struct>}}
	elseif ((<option_struct>.type) = album)
		generic_blocking_execute_script pad_script = generic_event_choose pad_params = {state = uistate_music_store_albums_details data = {<...> album_struct = <option_struct>}}
	else
		scriptassert qs(0x4ea75a1f) i = (<option_struct>.name) donotresolve
	endif
endscript

script music_store_new_arrivals_decide_focus 
	if ((<option_struct>.type) = song)
		music_store_song_focus option_struct = <option_struct>
	elseif ((<option_struct>.type) = pack)
		music_store_pack_focus option_struct = <option_struct>
	elseif ((<option_struct>.type) = album)
		music_store_album_focus option_struct = <option_struct>
	else
		scriptassert qs(0x8b439d7c) i = (<option_struct>.name) donotresolve
	endif
endscript

script music_store_new_arrivals_decide_unfocus 
	music_store_clear_album_info
endscript

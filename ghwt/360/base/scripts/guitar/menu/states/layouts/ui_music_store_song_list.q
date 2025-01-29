
script ui_create_music_store_song_list 
	music_store_reset_sort_index
	if GotParam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	if GotParam \{more_artist}
		music_store_set_previous_history previous_history = <previous_history> new_entry = <more_artist> <do_not_animate>
	elseif GotParam \{more_album}
		music_store_set_previous_history previous_history = <previous_history> new_entry = <more_album> <do_not_animate>
	endif
	music_store_pre_sort_list list = <list> state_list = [alpha date difficulty Duration price]
	GetArraySize <list>
	if (<array_Size> > 0)
		i = 0
		begin
		add_music_store_purchase_item {
			text = ((<list> [<i>]).Name)
			price = ((<list> [<i>]).price)
			choose_state = uistate_music_store_songs_details
			choose_state_data = {previous_history = <previous_history> song_struct = (<list> [<i>]) no_additional_artist_album}
			additional_focus_script = music_store_song_focus
			additional_focus_params = {option_struct = (<list> [<i>])}
			additional_unfocus_script = music_store_song_unfocus
		}
		i = (<i> + 1)
		repeat <array_Size>
	endif
	SpawnScriptNow \{music_store_fade_in_options}
	add_user_control_helper \{text = qs(0x52d4ae3c)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0c4db477)
		button = red
		z = 100000}
	music_store_add_sort_info state_list = [alpha date difficulty Duration price] previous_history = <previous_history> list = <list>
endscript

script ui_destroy_music_store_song_list 
	destroy_music_store_menus
endscript

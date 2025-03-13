
script ui_create_music_store_songs_additional 
	if gotparam \{selected_index}
		do_not_animate = {do_not_animate}
	endif
	if gotparam \{pack_list}
		formattext textname = hist_text qs(0x344aa009) a = <pack_list>
		music_store_set_previous_history previous_history = <previous_history> new_entry = <hist_text> <do_not_animate>
	elseif gotparam \{album_list}
		formattext textname = hist_text qs(0x344aa009) a = <album_list>
		music_store_set_previous_history previous_history = <previous_history> new_entry = <hist_text> <do_not_animate>
	endif
	getarraysize <list>
	if (<array_size> > 0)
		i = 0
		begin
		add_music_store_purchase_item {
			text = ((<list> [<i>]).name)
			price = ((<list> [<i>]).price)
		}
		i = (<i> + 1)
		repeat <array_size>
	else
		if NOT cd
			add_music_store_item \{text = qs(0x434e83fa)}
		endif
	endif
	spawnscriptnow \{music_store_fade_in_options}
	add_user_control_helper \{text = qs(0x0c4db477)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_songs_additional 
	destroy_music_store_menus
endscript

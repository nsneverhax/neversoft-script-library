
script ui_create_art_gallery \{gallery_struct = 0x69696969}
	images = (<gallery_struct>.images)
	images = (<gallery_struct>.images)
	getarraysize <images>
	can_scroll = 0
	if (<array_size> > 1)
		can_scroll = 1
		<array> = [{pad_back art_gallery_back}]
		addarrayelement {
			array = <array>
			element = {pad_up art_gallery_viewer_scroll params = {direction = up gallery_struct = <gallery_struct>}}
		}
		addarrayelement {
			array = <array>
			element = {pad_down art_gallery_viewer_scroll params = {direction = down gallery_struct = <gallery_struct>}}
		}
		addarrayelement {
			array = <array>
			element = {pad_left art_gallery_viewer_scroll params = {direction = up gallery_struct = <gallery_struct>}}
		}
		addarrayelement {
			array = <array>
			element = {pad_right art_gallery_viewer_scroll params = {direction = down gallery_struct = <gallery_struct>}}
		}
		addarrayelement {
			array = <array>
			element = {pad_choose art_gallery_play_movie params = {gallery_struct = <gallery_struct>}}
		}
	endif
	createscreenelement {
		parent = root_window
		type = descinterface
		id = art_gallery_viewer_id
		desc = 'art_gallery'
		pos_anchor = [center , center]
		just = [center , center]
		pos = (0.0, 0.0)
		autosizedims = true
		event_handlers = <array>
		exclusive_device = ($primary_controller)
		tags = {
			current_index = 0
		}
		z_priority = 500
		art_name_text = (<images> [0].caption)
	}
	createscreenelement {
		parent = art_gallery_viewer_id
		id = art_gallery_image_id
		type = spriteelement
		pos_anchor = [center , center]
		just = [center , center]
		pos = (0.0, 40.0)
		z_priority = 120
		texture = (<images> [0].texture)
		alpha = 1.0
	}
	art_gallery_update_helpers {
		gallery_struct = <gallery_struct>
		index = 0
	}
	launchevent \{type = focus
		target = art_gallery_viewer_id}
endscript

script art_gallery_update_helpers \{gallery_struct = 0x69696969
		index = !i1768515945}
	images = (<gallery_struct>.images)
	getarraysize <images>
	if (<array_size> = 0)
		return
	endif
	if (<index> >= <array_size>)
		return
	endif
	<image> = ((<gallery_struct>).images [<index>])
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	if structurecontains structure = <image> bink
		spawnscriptnow \{audio_ui_menu_music_on}
		add_user_control_helper \{text = qs(0xb826f529)
			button = green
			z = 100000}
	endif
	if (<array_size> > 1)
		add_user_control_helper \{text = qs(0x69200ef1)
			button = strumbar
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_art_gallery 
	clean_up_user_control_helpers
	if screenelementexists \{id = art_gallery_viewer_id}
		destroyscreenelement \{id = art_gallery_viewer_id}
	endif
endscript

script art_gallery_back 
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script art_gallery_viewer_scroll \{direction = !q1768515945
		gallery_struct = 0x69696969}
	if NOT screenelementexists \{id = art_gallery_viewer_id}
		return
	endif
	art_gallery_viewer_id :se_setprops \{block_events}
	if art_gallery_viewer_id :getsingletag \{current_index}
		if (<direction> = up)
			ui_sfx \{menustate = generic
				uitype = scrollup}
			index_to_add = -1
		elseif (<direction> = down)
			ui_sfx \{menustate = generic
				uitype = scrolldown}
			index_to_add = 1
		else
			scriptassert 'Invalid direction specified: %d' d = <direction>
		endif
		current_index = (<current_index> + <index_to_add>)
		getarraysize (<gallery_struct>.images)
		if (<current_index> >= <array_size>)
			current_index = 0
		elseif (<current_index> < 0)
			current_index = (<array_size> - 1)
		endif
		image = ((<gallery_struct>).images [<current_index>])
		destroyscreenelement \{id = art_gallery_image_id}
		createscreenelement {
			parent = art_gallery_viewer_id
			id = art_gallery_image_id
			type = spriteelement
			pos_anchor = [center , center]
			just = [center , center]
			pos = (0.0, 40.0)
			z_priority = 120
			alpha = 1.0
			texture = (<image>.texture)
		}
		art_gallery_viewer_id :se_setprops {
			art_name_text = (<image>.caption)
		}
		art_gallery_viewer_id :settags current_index = <current_index>
		art_gallery_update_helpers {
			gallery_struct = <gallery_struct>
			index = <current_index>
		}
	endif
	art_gallery_viewer_id :se_setprops \{unblock_events}
endscript

script art_gallery_play_movie \{gallery_struct = 0x69696969}
	images = (<gallery_struct>.images)
	getarraysize <images>
	if (<array_size> = 0)
		return
	endif
	if art_gallery_viewer_id :getsingletag \{current_index}
		if (<current_index> >= <array_size>)
			return
		endif
		<image> = ((<gallery_struct>).images [<current_index>])
		if structurecontains structure = <image> bink
			ui_sfx \{menustate = generic
				uitype = select}
			art_gallery_viewer_id :se_setprops \{block_events}
			clean_up_user_control_helpers
			hide_glitch \{num_frames = 10}
			destroy_song_and_musicstudio_heaps \{do_unloads}
			setbinkheap \{heap_cas_cache}
			playmovieandwait movie = (<image>.bink) hide_glitch_frames = 4
			setbinkheap \{heap_bink}
			create_song_and_musicstudio_heaps
			art_gallery_viewer_id :se_setprops \{unblock_events}
			art_gallery_update_helpers {
				gallery_struct = <gallery_struct>
				index = <current_index>
			}
		endif
	endif
endscript

script ui_art_anim_in 
	mainmenu_animate \{id = art_gallery_menu_id}
endscript

script ui_art_anim_out 
	mainmenu_animate \{id = art_gallery_menu_id}
endscript

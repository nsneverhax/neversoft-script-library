art_gallery_pak = None

script ui_create_art_gallery \{gallery_struct = 0x69696969}
	formatText TextName = path 'pak/gallery/%a.pak' a = <pakname>
	Change art_gallery_pak = <path>
	LoadPak ($art_gallery_pak) Heap = quota_misc
	images = (<gallery_struct>.images)
	images = (<gallery_struct>.images)
	GetArraySize <images>
	can_scroll = 0
	if (<array_Size> > 1)
		can_scroll = 1
		<array> = [{pad_back art_gallery_back}]
		AddArrayElement {
			array = <array>
			element = {pad_up art_gallery_viewer_scroll params = {direction = up gallery_struct = <gallery_struct>}}
		}
		AddArrayElement {
			array = <array>
			element = {pad_down art_gallery_viewer_scroll params = {direction = down gallery_struct = <gallery_struct>}}
		}
		AddArrayElement {
			array = <array>
			element = {pad_left art_gallery_viewer_scroll params = {direction = up gallery_struct = <gallery_struct>}}
		}
		AddArrayElement {
			array = <array>
			element = {pad_right art_gallery_viewer_scroll params = {direction = down gallery_struct = <gallery_struct>}}
		}
		AddArrayElement {
			array = <array>
			element = {pad_choose art_gallery_play_movie params = {gallery_struct = <gallery_struct>}}
		}
	endif
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = art_gallery_viewer_id
		desc = 'art_gallery'
		pos_anchor = [center , center]
		just = [center , center]
		Pos = (0.0, 0.0)
		autosizedims = true
		event_handlers = <array>
		exclusive_device = ($primary_controller)
		tags = {
			current_index = 0
		}
		z_priority = 500
		art_name_text = (<images> [0].caption)
	}
	CreateScreenElement {
		parent = art_gallery_viewer_id
		id = art_gallery_image_id
		Type = SpriteElement
		pos_anchor = [center , center]
		just = [center , center]
		Pos = (0.0, 40.0)
		z_priority = 120
		texture = (<images> [0].texture)
		alpha = 1.0
		Scale = 2.0
	}
	art_gallery_update_helpers {
		gallery_struct = <gallery_struct>
		index = 0
	}
	audio_ui_menu_music_on
	LaunchEvent \{Type = focus
		target = art_gallery_viewer_id}
endscript

script art_gallery_update_helpers \{gallery_struct = 0x69696969
		index = !i1768515945}
	images = (<gallery_struct>.images)
	GetArraySize <images>
	if (<array_Size> = 0)
		return
	endif
	if (<index> >= <array_Size>)
		return
	endif
	<image> = ((<gallery_struct>).images [<index>])
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	if StructureContains structure = <image> bink
		SpawnScriptNow \{audio_ui_menu_music_on}
		add_user_control_helper \{text = qs(0xb826f529)
			button = green
			z = 100000}
	endif
	if ((<image>.caption) = qs(0x77366960))
		add_user_control_helper \{text = qs(0xb826f529)
			button = green
			z = 100000}
	endif
	if (<array_Size> > 1)
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
	if ScreenElementExists \{id = art_gallery_viewer_id}
		DestroyScreenElement \{id = art_gallery_viewer_id}
	endif
	UnLoadPak ($art_gallery_pak)
	WaitUnloadPak ($art_gallery_pak) Block
	Change \{art_gallery_pak = None}
endscript

script art_gallery_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script art_gallery_viewer_scroll \{direction = !q1768515945
		gallery_struct = 0x69696969}
	if NOT ScreenElementExists \{id = art_gallery_viewer_id}
		return
	endif
	art_gallery_viewer_id :se_setprops \{block_events}
	if art_gallery_viewer_id :GetSingleTag \{current_index}
		if (<direction> = up)
			ui_sfx \{menustate = Generic
				uitype = scrollup}
			index_to_add = -1
		elseif (<direction> = down)
			ui_sfx \{menustate = Generic
				uitype = scrolldown}
			index_to_add = 1
		else
			ScriptAssert 'Invalid direction specified: %d' d = <direction>
		endif
		current_index = (<current_index> + <index_to_add>)
		GetArraySize (<gallery_struct>.images)
		if (<current_index> >= <array_Size>)
			current_index = 0
		elseif (<current_index> < 0)
			current_index = (<array_Size> - 1)
		endif
		image = ((<gallery_struct>).images [<current_index>])
		DestroyScreenElement \{id = art_gallery_image_id}
		CreateScreenElement {
			parent = art_gallery_viewer_id
			id = art_gallery_image_id
			Type = SpriteElement
			pos_anchor = [center , center]
			just = [center , center]
			Pos = (0.0, 40.0)
			z_priority = 120
			alpha = 1.0
			Scale = 2.0
			texture = (<image>.texture)
		}
		art_gallery_viewer_id :se_setprops {
			art_name_text = (<image>.caption)
		}
		art_gallery_viewer_id :SetTags current_index = <current_index>
		art_gallery_update_helpers {
			gallery_struct = <gallery_struct>
			index = <current_index>
		}
	endif
	art_gallery_viewer_id :se_setprops \{unblock_events}
endscript

script art_gallery_play_movie \{gallery_struct = 0x69696969}
	images = (<gallery_struct>.images)
	GetArraySize <images>
	if (<array_Size> = 0)
		return
	endif
	if art_gallery_viewer_id :GetSingleTag \{current_index}
		if (<current_index> >= <array_Size>)
			return
		endif
		<image> = ((<gallery_struct>).images [<current_index>])
		if StructureContains structure = <image> bink
			ui_sfx \{menustate = Generic
				uitype = select}
			fadetoblack \{On
				time = 0
				alpha = 1.0
				z_priority = 1000}
			art_gallery_viewer_id :se_setprops \{block_events}
			clean_up_user_control_helpers
			hide_glitch \{num_frames = 10}
			destroy_song_and_musicstudio_heaps \{do_unloads}
			setbinkheap \{heap_cas_cache}
			PlayMovieAndWait movie = (<image>.bink) hide_glitch_frames = 4
			setbinkheap \{heap_bink}
			create_song_and_musicstudio_heaps
			art_gallery_viewer_id :se_setprops \{unblock_events}
			art_gallery_update_helpers {
				gallery_struct = <gallery_struct>
				index = <current_index>
			}
		elseif StructureContains structure = <image> state
			ui_event event = menu_change data = {state = (<image>.state)}
		endif
	endif
endscript

script ui_art_anim_in 
	mainmenu_animate \{id = art_gallery_menu_id}
endscript

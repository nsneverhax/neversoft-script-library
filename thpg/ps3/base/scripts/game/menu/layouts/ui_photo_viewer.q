current_viewed_photo = ""

script ui_create_photo_viewer 
	printf \{'ui_create_photo_viewer'}
	kill_start_key_binding
	photo_unload_photo
	if screenelementexists \{id = photo_album_container}
		destroyscreenelement \{id = photo_album_container}
	endif
	ui_photo_album
endscript

script ui_destroy_photo_viewer 
	printf \{'ui_destroy_photo_viewer'}
	generic_ui_destroy
	if screenelementexists \{id = helper_text_anchor_photo}
		destroyscreenelement \{id = helper_text_anchor_photo}
	endif
	if ($photo_loading_photo = 1)
		scriptassert \{'Eh?'}
	endif
	photo_unload_photo
endscript

script ui_photo_viewer_exit 
	printf 'ui_photo_viewer_exit'
	if ($photo_loading_photo = 0)
		if screenelementexists id = photo_album_container
			setscreenelementprops {
				id = photo_album_container
				event_handlers = [
					{pad_back nullscript}
					{pad_square nullscript}
					{pad_left nullscript}
					{pad_right nullscript}
					{pad_down nullscript}
					{pad_up nullscript}
				]
				replace_handlers
			}
		endif
		killspawnedscript name = ui_photo_change_anim
		killspawnedscript name = photo_load_and_show_photo
		photo_unload_photo
		if screenelementexists id = photo_album_container
			destroyscreenelement id = photo_album_container
		endif
		restore_start_key_binding
		ui_change_state state = UIstate_view_status
	else
		printf 'ui_photo_viewer_exit supressed'
	endif
endscript
photo_loading_photo = 0

script ui_photo_viewer_view_photo 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	printf 'ui_photo_viewer_view_photo'
	if (<filename> = $current_viewed_photo)
		printf 'The photo is already loaded. filename=%f' f = <filename>
		launchevent type = focus target = photo_album_container data = {grid_index = <index>}
		return
	endif
	if NOT screenelementexists id = photo_album_container
		printf 'Um, no photo UI!'
		return
	endif
	soundevent event = PhotoSFX_page_turn
	photo_unload_photo
	change photo_loading_photo = 1
	spawnscriptlater photo_load_and_show_photo params = {filename = <filename> index = <index> photo_sponsor = <photo_sponsor>}
endscript

script photo_load_and_show_photo 
	if NOT screenelementexists id = photo_album_container
		change photo_loading_photo = 0
		return
	endif
	setbuttoneventmappings block_menu_input
	setscreenelementprops {
		id = photo_album_container
		event_handlers = [
			{pad_back nullscript}
			{pad_square nullscript}
			{pad_left nullscript}
			{pad_right nullscript}
			{pad_down nullscript}
			{pad_up nullscript}
		]
		replace_handlers
	}
	mempushcontext animexportdata
	photodeleteimageasset
	PhotoDeleteTexture
	if photo_load_from_memcard filename = <filename>
		if photocreateimageasset name = photo_image_asset
			mempopcontext animexportdata
			createscreenelement {
				type = containerelement
				parent = photo_current_container
				id = photo_preview_container
				just = [center center]
				pos = {(0.5, 0.5) proportional}
			}
			createscreenelement {
				parent = photo_preview_container
				id = photo_haze
				type = spriteelement
				pos = (0.0, 0.0)
				dims = (820.0, 470.0)
				just = [center center]
				texture = HUD_photo_overlay
				rgba = [50 42 38 150]
				z_priority = 4
				Random (@ flip_h @ flip_v @ )
			}
			createscreenelement {
				parent = photo_preview_container
				id = photo_preview_screen_elem
				type = spriteelement
				pos = (0.0, 0.0)
				dims = (800.0, 450.0)
				just = [center center]
				texture = photo_image_asset
				z_priority = 3.5
				alpha = 0.0
			}
			if gotparam photo_sponsor
				switch <photo_sponsor>
					case Transworld
					<pos> = $goal_photo_transworld_logo_pos
					<sponsor_logo> = HUD_transworld
					case slap
					<pos> = $goal_photo_slap_logo_pos
					<sponsor_logo> = HUD_slap_magazine
					case focus
					<pos> = $goal_photo_focus_logo_pos
					<sponsor_logo> = HUD_focus_magazine
				endswitch
				createscreenelement {
					type = spriteelement
					parent = photo_preview_container
					pos = <pos>
					dims = (350.0, 175.0)
					texture = <sponsor_logo>
					z_priority = 4.5
					rot_angle = -17
				}
			endif
			doscreenelementmorph {
				id = photo_preview_screen_elem
				alpha = 1.0
				time = 0.25
			}
			setscreenelementprops {
				id = {photo_current_container child = text}
				text = <filename>
			}
			doscreenelementmorph {
				id = {photo_current_container child = text}
				alpha = 1.0
				time = 0.25
			}
			change current_viewed_photo = <filename>
		else
			mempopcontext animexportdata
			photodeleteimageasset
			PhotoDeleteTexture
			change current_viewed_photo = ""
		endif
	else
		if NOT cardisinslot
			do_ok_dialog_box {
				preserve_case
				text_dims = (500.0, 0.0)
				vmenu_width = 400
				title = "Loading failed"
				text = "No storage device was selected or the in-use storage device is unavailable."
			}
		else
			do_ok_dialog_box {
				preserve_case
				text_dims = (500.0, 0.0)
				vmenu_width = 400
				title = "Loading failed"
				text = "Failed to load photograph file"
			}
		endif
		mempopcontext animexportdata
		photodeleteimageasset
		PhotoDeleteTexture
		change current_viewed_photo = ""
	endif
	setbuttoneventmappings unblock_menu_input
	change photo_loading_photo = 0
	launchevent type = focus target = photo_album_container data = {grid_index = <index>}
	photo_restore_ui_handlers
endscript

script photo_restore_ui_handlers 
	if screenelementexists \{id = photo_album_container}
		setscreenelementprops \{id = photo_album_container
			event_handlers = [
				{
					pad_back
					ui_photo_viewer_exit
				}
				{
					pad_square
					ui_photo_viewer_delete
				}
				{
					pad_left
					ui_photo_change
					params = {
						left
					}
				}
				{
					pad_right
					ui_photo_change
					params = {
						right
					}
				}
				{
					pad_down
					ui_photo_change
					params = {
						down
					}
				}
				{
					pad_up
					ui_photo_change
					params = {
						up
					}
				}
			]
			replace_handlers}
	endif
endscript

script photo_unload_photo 
	printf 'photo_unload_photo'
	if ($photo_loading_photo = 1)
		scriptassert 'Trying to unload photo whilst loading'
	endif
	if NOT ($current_viewed_photo = "")
		change current_viewed_photo = ""
		if screenelementexists id = photo_current_container
			if screenelementexists id = photo_preview_screen_elem
				doscreenelementmorph {
					id = photo_preview_screen_elem
					alpha = 0.0
					time = 0.25
				}
			endif
			if screenelementexists id = {photo_current_container child = text}
				doscreenelementmorph {
					id = {photo_current_container child = text}
					alpha = 0.0
					time = 0.25
				}
			endif
			wait 0.15 seconds ignoreslomo
		endif
		photodeleteimageasset
		wait 5 gameframes ignoreslomo
		if screenelementexists id = photo_preview_container
			destroyscreenelement id = photo_preview_container
		endif
		photodeleteimageasset
		PhotoDeleteTexture
	endif
endscript

script photo_load_from_memcard 
	change savingorloading = loading
	loaded = 0
	if game_progress_check_valid_save
		if cardisinslot
			mcmess_loadingdata filetype = photo
			casttointeger filename
			formattext textname = textname "%d" d = <filename> integer_width = 6
			killallmovies blocking
			mc_waitasyncopsfinished
			loadfrommemorycard filename = <textname> filetype = photo
			mc_waitasyncopsfinished
			if (<result> = true)
				loaded = 1
			endif
			destroy_dialog_box
		endif
	endif
	ui_photo_album_helper_text_show
	if (<loaded> = 1)
		return true
	else
		return false
	endif
endscript

script ui_photo_album_helper_text_show 
	create_helper_text \{anchor_id = helper_text_anchor_photo
		helper_text_elements = [
			{
				text = "\\m1 BACK"
			}
			{
				text = "\\md DELETE"
			}
		]}
endscript

script ui_photo_album 
	if screenelementexists id = photo_viewer_main_anchor
		destroyscreenelement id = photo_viewer_main_anchor
	endif
	if screenelementexists id = photo_album_container
		destroyscreenelement id = photo_album_container
	endif
	PhotoFunc get_count
	<total> = <count>
	if (<total> > ($max_profile_photos))
		<total> = ($max_profile_photos)
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = photo_album_container
		event_handlers = [
		]
		tags = {
			index = 0
			count = <total>
		}
		focusable_child = photo_hmenu_top
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = white
		dims = (1280.0, 720.0)
		pos = (0.0, 0.0)
		rgba = [0 0 0 255]
		just = [left top]
		z_priority = -4999
	}
	tilesprite {
		texture = map_bg_news
		parent = photo_album_container
		tile_dims = (1500.0, 920.0)
		dims = (250.0, 250.0)
		pos = (-300.0, -200.0)
		sprite_props = {rgba = [150 70 70 255]}
		container_props = {z_priority = -30.0}
	}
	runscriptonscreenelement tilespriteloop id = <id> params = {move_x = 1 move_y = 0.5}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = white3
		dims = (320.0, 1208.0)
		just = [center center]
		rgba = [0 0 0 200]
		pos = (650.0, 520.0)
		rot_angle = 90
		z_priority = -10.0
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = white3
		dims = (320.0, 1208.0)
		just = [center center]
		rgba = [0 0 0 150]
		pos = (1100.0, 200.0)
		rot_angle = 0
		z_priority = -10.0
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = white3
		dims = (320.0, 1208.0)
		just = [center center]
		rgba = [0 0 0 150]
		pos = (200.0, 200.0)
		flip_v
		z_priority = -10.0
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = white3
		dims = (320.0, 1208.0)
		just = [center center]
		rgba = [0 0 0 100]
		pos = (650.0, 100.0)
		rot_angle = -90
		z_priority = -10.0
	}
	createscreenelement {
		parent = photo_album_container
		type = spriteelement
		texture = cap_blackswipe_h
		dims = (800.0, 128.0)
		just = [left center]
		rgba = [0 0 0 255]
		pos = (10.0, -30.0)
		z_priority = -3
	}
	createscreenelement {
		parent = photo_album_container
		type = spriteelement
		texture = cap_blackswipe_h
		just = [left center]
		rgba = [0 0 0 255]
		pos = (775.0, -30.0)
		flip_v
		z_priority = -3
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = menu_sideA
		rgba = [0 0 0 105]
		dims = (37.0, 60.0)
		just = [center center]
		pos = (235.0, 90.0)
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = menu_sideA
		rgba = [0 0 0 105]
		dims = (37.0, 60.0)
		flip_v
		pos = (1058.0, 90.0)
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		texture = white
		rgba = [0 0 0 105]
		just = [center center]
		dims = (786.0, 60.0)
		pos = (647.0, 90.0)
	}
	createscreenelement {
		type = hmenu
		parent = photo_album_container
		id = photo_hmenu_top
		regular_space_amount = 30
		just = [center center]
		pos = (645.0, 80.0)
	}
	createscreenelement {
		type = hmenu
		parent = photo_album_container
		id = photo_hmenu_bottom
		regular_space_amount = 30
		just = [center center]
		pos = (645.0, 100.0)
	}
	<i> = 0
	<dims> = (12.0, 12.0)
	<hmenu> = photo_hmenu_top
	begin
	focus = {rgba = [200 200 200 255]}
	if (<i> > (<total> - 1))
		focus = {not_focusable rgba = [64 64 64 255]}
	endif
	if (<i> >= (($max_profile_photos) / 2))
		<hmenu> = photo_hmenu_bottom
	endif
	createscreenelement {
		type = spriteelement
		parent = <hmenu>
		texture = white
		dims = <dims>
		<focus>
		event_handlers = [
			{focus ui_photo_menu_focus}
			{unfocus ui_photo_menu_unfocus}
		]
		tags = {
			tag_grid_x = <i>
		}
	}
	<i> = (<i> + 1)
	<dims> = (12.0, 12.0)
	repeat ($max_profile_photos)
	createscreenelement {
		type = containerelement
		parent = photo_album_container
		id = photo_current_container
		pos = (640.0, 370.0)
		dims = (820.0, 470.0)
		rot_angle = RandomRange (-2.5, 2.5)
	}
	createscreenelement {
		type = spriteelement
		parent = photo_current_container
		texture = white
		pos = {(0.5, 0.5) proportional}
		rgba = [200 200 200 255]
		just = [center center]
		dims = (820.0, 470.0)
		z_priority = 3
	}
	createscreenelement {
		type = spriteelement
		parent = photo_current_container
		texture = white
		pos = {(0.5, 0.5) proportional}
		rgba = [0 0 0 255]
		just = [center center]
		dims = (800.0, 450.0)
		z_priority = 3.1
	}
	createscreenelement {
		type = textelement
		parent = photo_current_container
		local_id = text
		font = text_a1
		text = ""
		just = [left bottom]
		pos = {(0.025, 0.97499996) proportional}
		rgba = [240 240 240 155]
		z_priority = 5
		scale = (0.7, 0.5)
		font_spacing = 1
		alpha = 0.0
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		id = photo_left_arrow
		texture = arrow_select
		rgba = [255 255 255 255]
		shadow
		shadow_rgba = [100 100 100 100]
		shadowoffs = [3 , 3]
		pos = (230.0, 375.0)
		z_priority = 11
	}
	createscreenelement {
		type = spriteelement
		parent = photo_album_container
		id = photo_right_arrow
		texture = arrow_select
		rgba = [255 255 255 255]
		shadow
		shadow_rgba = [100 100 100 100]
		shadowoffs = [3 , 3]
		pos = (1050.0, 375.0)
		flip_v
		z_priority = 11
	}
	if NOT (<total> = 0)
		PhotoFunc get_meta_data index = 0
		if structurecontains structure = <meta_data> photo_sponsor
			<photo_sponsor> = (<meta_data>.photo_sponsor)
		endif
		spawnscriptnow ui_photo_viewer_view_photo params = {filename = (<meta_data>.name) photo_sponsor = <photo_sponsor> index = 0}
	endif
	launchevent type = focus target = photo_album_container
	create_helper_text {
		anchor_id = helper_text_anchor_photo
		helper_text_elements = [{text = "\\m1 BACK"}]
	}
endscript

script ui_photo_menu_focus 
	gettags
	setprops \{dims = (24.0, 24.0)}
	domorph \{rgba = [
			200
			200
			200
			255
		]
		time = 0.1}
endscript

script ui_photo_menu_unfocus 
	gettags
	setprops \{dims = (12.0, 12.0)}
	domorph \{rgba = [
			200
			200
			200
			255
		]
		time = 0.1}
endscript

script ui_photo_change 
	if NOT scriptisrunning \{ui_photo_change_handler}
		ui_photo_change_handler <...>
	endif
endscript

script ui_photo_change_handler 
	printf 'ui_photo_change_handler'
	gettags
	if (<count> = 0)
		return
	endif
	if scriptisrunning ui_photo_change_performing
		showing = 1
	endif
	if scriptisrunning ui_photo_viewer_view_photo
		showing = 1
	endif
	if scriptisrunning photo_load_and_show_photo
		showing = 1
	endif
	if scriptisrunning ui_photo_viewer_delete
		showing = 1
	endif
	if NOT gotparam showing
		if gotparam left
			new_index = (<index> - 1)
			if (<new_index> >= (($max_profile_photos) / 2))
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_bottom
				launchevent type = unfocus target = photo_hmenu_top
			else
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_top
				launchevent type = unfocus target = photo_hmenu_bottom
			endif
			if (<new_index> < 0)
				<new_index> = 0
				return
			endif
			killspawnedscript name = ui_photo_change_anim
			<id> :settags index = <new_index>
		endif
		if gotparam right
			new_index = (<index> + 1)
			if (<new_index> >= (($max_profile_photos) / 2))
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_bottom
				launchevent type = unfocus target = photo_hmenu_top
			else
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_top
				launchevent type = unfocus target = photo_hmenu_bottom
			endif
			if (<new_index> > <count> - 1)
				<new_index> = (<count> - 1)
				return
			endif
			killspawnedscript name = ui_photo_change_anim
			<id> :settags index = <new_index>
		endif
		if gotparam down
			new_index = (<index> + (($max_profile_photos) / 2))
			if (<new_index> > <count> - 1)
				<new_index> = (<count> - 1)
			endif
			if (<new_index> >= (($max_profile_photos) / 2))
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_bottom
				launchevent type = unfocus target = photo_hmenu_top
			else
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_top
				launchevent type = unfocus target = photo_hmenu_bottom
			endif
			killspawnedscript name = ui_photo_change_anim
			<id> :settags index = <new_index>
		endif
		if gotparam up
			new_index = (<index> - (($max_profile_photos) / 2))
			if (<new_index> < 0)
				<new_index> = 0
			endif
			if (<new_index> >= (($max_profile_photos) / 2))
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_bottom
				launchevent type = unfocus target = photo_hmenu_top
			else
				setscreenelementprops id = photo_album_container focusable_child = photo_hmenu_top
				launchevent type = unfocus target = photo_hmenu_bottom
			endif
			killspawnedscript name = ui_photo_change_anim
			<id> :settags index = <new_index>
		endif
		launchevent type = unfocus target = photo_album_container
		launchevent type = focus target = photo_album_container data = {grid_index = <new_index>}
		spawnscriptnow ui_photo_change_anim params = {<...>}
		wait 5 gameframes
	endif
endscript

script ui_photo_change_anim 
	if NOT screenelementexists id = photo_album_container
		return
	endif
	doscreenelementmorph {
		id = photo_left_arrow
		rgba = [255 255 255 255]
		scale = (1.0, 1.0)
		time = 0.0
	}
	doscreenelementmorph {
		id = photo_right_arrow
		rgba = [255 255 255 255]
		scale = (1.0, 1.0)
		time = 0.0
	}
	if gotparam left
		doscreenelementmorph {
			id = photo_left_arrow
			rgba = [200 70 70 255]
			scale = (1.25, 1.25)
			time = 0.3
		}
		wait 0.3 seconds ignoreslomo
		doscreenelementmorph {
			id = photo_left_arrow
			rgba = [255 255 255 255]
			scale = (1.0, 1.0)
			time = 0.3
		}
		wait 0.3 seconds ignoreslomo
	elseif gotparam right
		doscreenelementmorph {
			id = photo_right_arrow
			rgba = [200 70 70 255]
			scale = (1.25, 1.25)
			time = 0.3
		}
		wait 0.3 seconds ignoreslomo
		doscreenelementmorph {
			id = photo_right_arrow
			rgba = [255 255 255 255]
			scale = (1.0, 1.0)
			time = 0.3
		}
		wait 0.3 seconds ignoreslomo
	endif
	PhotoFunc get_meta_data index = <new_index>
	if structurecontains structure = <meta_data> photo_sponsor
		<photo_sponsor> = (<meta_data>.photo_sponsor)
	endif
	spawnscriptnow ui_photo_viewer_view_photo params = {filename = (<meta_data>.name) index = <new_index> photo_sponsor = <photo_sponsor>}
endscript

script ui_photo_viewer_delete 
	if scriptisrunning ui_photo_change_handler
		return
	endif
	if scriptisrunning ui_photo_change_anim
		return
	endif
	if scriptisrunning ui_photo_change_performing
		return
	endif
	if scriptisrunning ui_photo_viewer_view_photo
		return
	endif
	if scriptisrunning photo_load_and_show_photo
		return
	endif
	PhotoFunc get_count
	old_count = <count>
	if screenelementexists id = photo_album_container
		setscreenelementprops {
			id = photo_album_container
			event_handlers = [
				{pad_back nullscript}
				{pad_square nullscript}
				{pad_left nullscript}
				{pad_right nullscript}
				{pad_down nullscript}
				{pad_up nullscript}
			]
			replace_handlers
		}
		launchevent type = unfocus target = photo_album_container
	endif
	kill_start_key_binding
	create_dialog_box {
		preserve_case
		text_dims = (500.0, 0.0)
		vmenu_width = 400
		title = "Delete Photo"
		text = "Are you sure you wish to delete this photo?"
		buttons = [{font = text_a1 text = "Delete Photo" pad_choose_script = ui_photo_viewer_delete_do_it}
			{font = text_a1 text = "Cancel" pad_choose_script = ui_photo_viewer_delete_cancel}
		]
	}
	wait 2 gameframes
	if screenelementexists id = dialog_box_vmenu
		launchevent type = focus target = dialog_box_vmenu
	endif
	setbuttoneventmappings unblock_menu_input
	block type = photo_viewer_delete_dialog_done
	kill_start_key_binding
	PhotoFunc get_count
	if (<old_count> > <count>)
		if (<count> = 0)
			ui_photo_viewer_exit
		else
			generic_ui_destroy
			ui_photo_album
		endif
	endif
endscript

script ui_photo_viewer_delete_do_it 
	photo_album_container :gettags
	PhotoFunc get_meta_data index = <index>
	mc_waitasyncopsfinished
	if delete_extra_saved_data filetype = photo name = (<meta_data>.name)
		PhotoFunc remove index = <index>
	endif
	dialog_box_exit
	ui_photo_album_helper_text_show
	unpausespawnedscript \{ui_photo_viewer_delete}
	broadcastevent \{type = photo_viewer_delete_dialog_done}
endscript

script ui_photo_viewer_delete_cancel 
	photo_restore_ui_handlers
	launchevent \{type = focus
		target = photo_album_container}
	dialog_box_exit
	ui_photo_album_helper_text_show
	unpausespawnedscript \{ui_photo_viewer_delete}
	broadcastevent \{type = photo_viewer_delete_dialog_done}
endscript

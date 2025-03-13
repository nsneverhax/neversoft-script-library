
script ui_create_rewards 
	progression_get_new_unlocks
	getarraysize \{new_unlocks}
	new_unlocks_size = <array_size>
	printstruct channel = mychannel <...>
	names_array = []
	textures_array = []
	items_array = []
	cntr = 0
	if (<array_size> > 0)
		begin
		this_item = (<new_unlocks> [<cntr>])
		name = qs(0x03ac90f0)
		texture = black
		if ((<this_item>.type) = car_piece)
			part = ((<this_item>.item).part)
			desc_id = ((<this_item>.item).desc_id)
			if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
				scriptassert '%s %t not found' s = <part> t = <desc_id>
			endif
			name = <frontend_desc>
			if gotparam \{polaroid}
				texture = <polaroid>
			else
				texture = rewards_image_placeholder
			endif
			printf \{channel = mychannel
				qs(0x0ae91de7)}
			printstruct channel = mychannel <...>
		elseif ((<this_item>.type) = car_pieces)
			list_of_pieces = (<this_item>.char_pieces)
			getarraysize \{list_of_pieces}
			if (<array_size> > 0)
				my_item = (<list_of_pieces> [0])
				part = (<my_item>.part)
				desc_id = (<my_item>.desc_id)
				if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
					scriptassert '%s %t not found' s = <part> t = <desc_id>
				endif
				if structurecontains \{structure = this_item
						group_name}
					name = (<this_item>.group_name)
				else
					name = <frontend_desc>
				endif
				if gotparam \{polaroid}
					texture = <polaroid>
				else
					texture = rewards_image_placeholder
				endif
			endif
		elseif ((<this_item>.type) = character)
			printf \{channel = mychannel
				qs(0xa7610f6d)}
			get_musician_profile_struct_by_id id = (<this_item>.item) savegame = 0
			name = (<profile_struct>.fullname)
			texture = (<profile_struct>.polaroid)
			removeparameter \{profile_struct}
		elseif ((<this_item>.type) = level)
			printf \{channel = mychannel
				qs(0x1231ef40)}
			name = ($levelzones.(<this_item>.item).title)
			texture = video
		endif
		addarrayelement array = <names_array> element = <name>
		names_array = <array>
		addarrayelement array = <textures_array> element = <texture>
		textures_array = <array>
		addarrayelement array = <items_array> element = <this_item>
		items_array = <array>
		cntr = (<cntr> + 1)
		repeat <new_unlocks_size>
	endif
	getarraysize <names_array>
	num_unlocks = <array_size>
	if screenelementexists \{id = my_rewards_id}
		destroyscreenelement \{id = my_rewards_id}
	endif
	printf \{channel = mychannel
		qs(0x808bf60b)}
	get_all_exclusive_devices
	texture = (<textures_array> [(<num_unlocks> -1)])
	if (<texture> = video)
		texture = black
	endif
	createscreenelement {
		parent = root_window
		id = my_rewards_id
		type = descinterface
		desc = 'rewards'
		rewards_image_placeholder_texture = <texture>
		exclusive_device = <exclusive_device>
	}
	soundevent \{event = unlock_new_item}
	if my_rewards_id :desc_resolvealias \{name = alias_list_menu}
	else
		scriptassert \{qs(0xc9e6e307)}
	endif
	i = 0
	if (<num_unlocks> > 0)
		if (<num_unlocks> > 1)
			<add_sound_event> = true
		else
			<add_sound_event> = false
		endif
		begin
		createscreenelement {
			parent = <resolved_id>
			type = descinterface
			desc = 'rewards_unlockable'
			autosizedims = true
			unlockable_text = (<names_array> [<i>])
			unlockable_control_pos = {(0.0, 0.0) relative}
			rewards_checkbox_alpha = 0
			unlockable_alpha = 0
		}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose rewards_continue_to_next_screen}
				{focus my_menu_focus params = {id = <id> item_textures = <textures_array> items_array = <items_array> item_index = <i> add_sound_event = <add_sound_event>}}
				{unfocus my_menu_unfocus params = {id = <id>}}
			]
		}
		<id> :obj_spawnscript anim_reward params = {menu_id = my_rewards_id index = <i> item_textures = <textures_array>}
		i = (<i> + 1)
		repeat <num_unlocks>
		gamemode_getnumplayers
		check_player = 1
		begin
		printf channel = bort qs(0x3d0c26e3) p = <check_player>
		achievements_unchained player = <check_player>
		achievements_its_alive player = <check_player>
		achievements_evh player = <check_player>
		check_player = (<check_player> + 1)
		repeat <num_players>
	endif
	my_rewards_id :obj_spawnscript \{highlight_motion
		params = {
			menu_id = my_rewards_id
		}}
	t = ((<num_unlocks> * 0.5) + 1.0)
	spawnscriptnow set_focus_to_menu params = {w_time = <t> menu_id = <resolved_id>}
endscript

script ui_destroy_rewards 
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_rewards_id}
	killallmovies
endscript

script ui_deinit_rewards 
	progression_reset_new_unlocks
	printf \{channel = mychannel
		qs(0x5b35d1d6)}
endscript

script rewards_continue_to_next_screen 
	printf \{channel = test
		qs(0xf21db64a)}
	se_setprops \{block_events}
	progression_reset_new_unlocks
	ui_win_song_continue_next_menu
endscript

script my_menu_focus \{add_sound_event = true}
	se_setprops unlockable_rgba = (($g_menu_colors).menu_main_focus)
	texture = (<item_textures> [<item_index>])
	if (<texture> = video)
		texture = black
	endif
	setscreenelementprops {
		id = my_rewards_id
		rewards_image_placeholder_texture = <texture>
	}
	if ((<item_textures> [<item_index>]) = video)
		if my_rewards_id :desc_resolvealias \{name = alias_movie_parent}
			current_movie = ''
			<resolved_id> :getsingletag current_movie
			if NOT (<current_movie> = ($ui_select_venue_info.(<items_array> [<item_index>].item).movie))
				destroyscreenelement \{id = reward_movie}
				waitforallmoviestofinish
				createscreenelement {
					type = movieelement
					parent = <resolved_id>
					id = reward_movie
					dims = (280.0, 280.0)
					just = [center center]
					pos_anchor = [center center]
					pos = (3.0, 0.0)
					textureslot = 1
					texturepri = 1000
					no_hold
					movie = ($ui_select_venue_info.(<items_array> [<item_index>].item).movie)
					z_priority = 10000
				}
				<resolved_id> :settags current_movie = ($ui_select_venue_info.(<items_array> [<item_index>].item).movie)
			endif
		endif
	else
		destroyscreenelement \{id = reward_movie}
		killallmovies
		if my_rewards_id :desc_resolvealias \{name = alias_movie_parent}
			<resolved_id> :settags current_movie = ''
		endif
	endif
	obj_getid
	gettags
	if (<add_sound_event> = true)
		if NOT scriptisrunning \{set_focus_to_menu}
			generic_menu_up_or_down_sound
		endif
	endif
endscript

script my_menu_unfocus 
	se_setprops unlockable_rgba = (($g_menu_colors).menu_main_unfocus)
endscript

script anim_reward 
	getarraysize <item_textures>
	w_time = ((<array_size> - <index>) * 0.5)
	wait <w_time> second
	texture = (<item_textures> [<index>])
	if (<texture> = video)
		texture = black
	endif
	setscreenelementprops {
		id = <menu_id>
		rewards_image_placeholder_texture = <texture>
	}
	<menu_id> :obj_spawnscriptnow rewards_image_pulse_anim
	soundevent \{event = unlock_item_text_appear}
	se_setprops \{unlockable_alpha = 1
		time = 0.4
		anim = gentle}
	se_setprops \{rewards_checkbox_alpha = 1
		time = 0.4
		anim = gentle}
endscript

script rewards_image_pulse_anim 
	se_setprops \{rewards_image_placeholder_scale = 1.4499999
		time = 0.01}
	se_waitprops
	se_setprops \{rewards_image_placeholder_scale = 1.2
		time = 0.01}
	se_waitprops
	se_setprops \{rewards_image_placeholder_scale = 0.9
		time = 0.01}
	se_waitprops
	se_setprops \{rewards_image_placeholder_scale = 1
		time = 0.01}
	se_waitprops
	se_setprops \{rewards_image_placeholder_scale = 1.15
		time = 0.01}
	se_waitprops
	se_setprops \{rewards_image_placeholder_scale = 1
		time = 0.01}
endscript

script set_focus_to_menu 
	wait <w_time> second
	launchevent type = focus target = <menu_id>
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

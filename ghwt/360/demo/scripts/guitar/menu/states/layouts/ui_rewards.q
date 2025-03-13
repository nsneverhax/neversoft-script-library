
script ui_create_rewards 
	progression_get_new_unlocks
	getarraysize \{new_unlocks}
	new_unlocks_size = <array_size>
	printstruct channel = mychannel <...>
	names_array = []
	textures_array = []
	cntr = 0
	if (<array_size> > 0)
		begin
		this_item = (<new_unlocks> [<cntr>])
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
		endif
		addarrayelement array = <names_array> element = <name>
		names_array = <array>
		addarrayelement array = <textures_array> element = <texture>
		textures_array = <array>
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
	createscreenelement {
		parent = root_window
		id = my_rewards_id
		type = descinterface
		desc = 'rewards'
		rewards_image_placeholder_texture = (<textures_array> [(<num_unlocks> -1)])
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
			unlockable_control_pos = {(-300.0, 0.0) relative}
			rewards_checkbox_alpha = 0
			unlockable_alpha = 0
		}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose rewards_continue_to_next_screen}
				{focus my_menu_focus params = {id = <id> item_textures = <textures_array> item_index = <i> add_sound_event = <add_sound_event>}}
				{unfocus my_menu_unfocus params = {id = <id>}}
			]
		}
		<id> :obj_spawnscript anim_reward params = {index = <i> item_textures = <textures_array>}
		i = (<i> + 1)
		repeat <num_unlocks>
	endif
	t = ((<num_unlocks> * 0.5) + 1.0)
	spawnscriptnow set_focus_to_menu params = {w_time = <t> menu_id = <resolved_id>}
endscript

script ui_destroy_rewards 
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_rewards_id}
endscript

script ui_deinit_rewards 
	progression_reset_new_unlocks
	printf \{channel = mychannel
		qs(0x5b35d1d6)}
endscript

script rewards_continue_to_next_screen 
	printf \{channel = test
		qs(0xf21db64a)}
	ui_att_ballpark_should_i_show_ad
	printstruct channel = mychannel <...>
	if (<show_att_ad> = 1)
		generic_event_choose \{state = uistate_att_ballpark}
	else
		ui_win_song_continue_next_menu
	endif
endscript

script my_menu_focus \{add_sound_event = true}
	setscreenelementprops {
		id = <id>
		unlockable_rgba = (($g_menu_colors).brick)
		scale = 1.04
	}
	setscreenelementprops {
		id = my_rewards_id
		rewards_image_placeholder_texture = (<item_textures> [<item_index>])
	}
	if (<add_sound_event> = true)
		if NOT scriptisrunning \{set_focus_to_menu}
			generic_menu_up_or_down_sound
		endif
	endif
endscript

script my_menu_unfocus 
	setscreenelementprops {
		id = <id>
		unlockable_rgba = (($g_menu_colors).black)
		scale = 1.0
	}
endscript

script anim_reward 
	getarraysize <item_textures>
	w_time = ((<array_size> - <index>) * 0.5)
	wait <w_time> second
	setscreenelementprops {
		id = my_rewards_id
		rewards_image_placeholder_texture = (<item_textures> [<index>])
	}
	soundevent \{event = unlock_item_text_appear}
	se_setprops \{unlockable_control_pos = {
			(300.0, 0.0)
			relative
		}
		unlockable_alpha = 1
		time = 0.2
		anim = gentle}
	wait \{0.3
		second}
	se_setprops \{rewards_checkbox_alpha = 1
		time = 0.2
		anim = gentle}
endscript

script set_focus_to_menu 
	wait <w_time> second
	launchevent type = focus target = <menu_id>
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

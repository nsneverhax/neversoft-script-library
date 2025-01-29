
script ui_create_rewards 
	progression_get_new_unlocks
	GetArraySize \{new_unlocks}
	new_unlocks_size = <array_Size>

	if (<new_unlocks_size> > 10)
		<new_unlocks_size> = 10
	endif
	names_array = []
	textures_array = []
	items_array = []
	cntr = 0
	if (<array_Size> > 0)
		begin
		this_item = (<new_unlocks> [<cntr>])
		Name = qs(0x99b9ca8b)
		texture = unknown
		if ((<this_item>.Type) = car_piece)
			part = ((<this_item>.item).part)
			desc_id = ((<this_item>.item).desc_id)
			ps2_load_car_part_script
			if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

			endif
			ps2_unload_car_part_script
			Name = <frontend_desc>
			if GotParam \{polaroid}
				texture = <polaroid>
			else
				texture = rewards_image_placeholder
			endif


		elseif ((<this_item>.Type) = car_pieces)
			list_of_pieces = (<this_item>.char_pieces)
			GetArraySize \{list_of_pieces}
			if (<array_Size> > 0)
				my_item = (<list_of_pieces> [0])
				part = (<my_item>.part)
				desc_id = (<my_item>.desc_id)
				ps2_load_car_part_script
				if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

				endif
				ps2_unload_car_part_script
				if StructureContains \{structure = this_item
						group_name}
					Name = (<this_item>.group_name)
				else
					Name = <frontend_desc>
				endif
				if GotParam \{polaroid}
					texture = <polaroid>
				else
					texture = rewards_image_placeholder
				endif
			endif
		elseif ((<this_item>.Type) = character)

			get_musician_profile_struct_by_id id = (<this_item>.item) savegame = 0
			Name = (<profile_struct>.fullname)
			texture = (<profile_struct>.polaroid)
			RemoveParameter \{profile_struct}
		elseif ((<this_item>.Type) = level)

			Name = ($LevelZones.(<this_item>.item).title)
			formatText checksumName = 0xe279f677 'Venue_Reward_%t' t = ($LevelZones.(<this_item>.item).Name)
			texture = <0xe279f677>
		endif
		AddArrayElement array = <names_array> element = <Name>
		names_array = <array>
		AddArrayElement array = <textures_array> element = <texture>
		textures_array = <array>
		AddArrayElement array = <items_array> element = <this_item>
		items_array = <array>
		cntr = (<cntr> + 1)
		repeat <new_unlocks_size>
	endif
	GetArraySize <names_array>
	num_unlocks = <array_Size>
	if ScreenElementExists \{id = my_rewards_id}
		DestroyScreenElement \{id = my_rewards_id}
	endif

	get_all_exclusive_devices
	texture = (<textures_array> [(<num_unlocks> -1)])
	if (<texture> = video)
		texture = black
	endif
	CreateScreenElement {
		parent = root_window
		id = my_rewards_id
		Type = descinterface
		desc = 'rewards'
		rewards_image_placeholder_texture = <texture>
		exclusive_device = <exclusive_device>
	}
	SoundEvent \{event = unlock_new_item}
	if my_rewards_id :desc_resolvealias \{Name = alias_list_menu}
	else

	endif
	i = 0
	if (<num_unlocks> > 0)
		if (<num_unlocks> > 1)
			<add_sound_event> = true
		else
			<add_sound_event> = FALSE
		endif
		begin
		CreateScreenElement {
			parent = <resolved_id>
			Type = descinterface
			desc = 'rewards_unlockable'
			autosizedims = true
			unlockable_text = (<names_array> [<i>])
			unlockable_control_pos = {(0.0, 0.0) relative}
			rewards_checkbox_alpha = 0
			unlockable_alpha = 0
		}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose rewards_continue_to_next_screen}
				{focus my_menu_focus params = {id = <id> item_textures = <textures_array> items_array = <items_array> item_index = <i> add_sound_event = <add_sound_event>}}
				{unfocus my_menu_unfocus params = {id = <id>}}
			]
		}
		<id> :obj_spawnscript anim_reward params = {index = <i> item_textures = <textures_array>}
		i = (<i> + 1)
		repeat <num_unlocks>
	endif
	my_rewards_id :obj_spawnscript \{highlight_motion
		params = {
			menu_id = my_rewards_id
		}}
	t = ((<num_unlocks> * 0.5) + 1.0)
	SpawnScriptNow set_focus_to_menu params = {w_time = <t> menu_id = <resolved_id>}
	if 0x8658e568
		destroy_loading_screen
	endif
endscript

script ui_destroy_rewards 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_rewards_id}
	killallmovies
endscript

script ui_deinit_rewards 
	progression_reset_new_unlocks

endscript

script rewards_continue_to_next_screen 

	se_setprops \{block_events}
	progression_reset_new_unlocks
	ui_win_song_continue_next_menu
endscript

script my_menu_focus \{add_sound_event = true}
	texture = (<item_textures> [<item_index>])
	if (<texture> = video)
		texture = black
	endif
	SetScreenElementProps {
		id = my_rewards_id
		rewards_image_placeholder_texture = <texture>
	}
	if ((<item_textures> [<item_index>]) = video)
		if my_rewards_id :desc_resolvealias \{Name = alias_movie_parent}
			current_movie = ''
			<resolved_id> :GetSingleTag current_movie
			if NOT (<current_movie> = ($ui_select_venue_info.(<items_array> [<item_index>].item).movie))
				if ScreenElementExists \{id = reward_movie}
					DestroyScreenElement \{id = reward_movie}
					killallmovies
				endif
				Wait \{1
					gameframe}
				CreateScreenElement {
					Type = movieelement
					parent = <resolved_id>
					id = reward_movie
					dims = (280.0, 280.0)
					just = [center center]
					pos_anchor = [center center]
					Pos = (3.0, 0.0)
					textureSlot = 1
					TexturePri = 1000
					no_hold
					movie = ($ui_select_venue_info.(<items_array> [<item_index>].item).movie)
					z_priority = 10000
				}
				<resolved_id> :SetTags current_movie = ($ui_select_venue_info.(<items_array> [<item_index>].item).movie)
			endif
		endif
	else
		if ScreenElementExists \{id = reward_movie}
			DestroyScreenElement \{id = reward_movie}
			killallmovies
		endif
	endif
	Obj_GetID
	GetTags
	if my_rewards_id :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		GetScreenElementChildren id = <objID>
		GetScreenElementChildren id = (<children> [0])
		GetScreenElementChildren id = (<children> [0])
		GetScreenElementDims id = (<children> [0])
		Scale = (((1.0, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.5))
		GetScreenElementPosition id = (<children> [0]) summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (-48.0, 24.0))} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = (<children> [0]) summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (-48.0, 4.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = (<children> [0]) summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (-48.0, 24.0))} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
	if (<add_sound_event> = true)
		if NOT ScriptIsRunning \{set_focus_to_menu}
			generic_menu_up_or_down_sound
		endif
	endif
endscript

script my_menu_unfocus 
	SetScreenElementProps {
		id = <id>
		unlockable_rgba = (($g_menu_colors).black)
		Scale = 1.0
	}
endscript

script anim_reward 
	GetArraySize <item_textures>
	w_time = ((<array_Size> - <index>) * 0.5)
	Wait <w_time> Second
	texture = (<item_textures> [<index>])
	if (<texture> = video)
		texture = black
	endif
	SetScreenElementProps {
		id = my_rewards_id
		rewards_image_placeholder_texture = <texture>
	}
	SoundEvent \{event = unlock_item_text_appear}
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
	Wait <w_time> Second
	LaunchEvent Type = focus target = <menu_id>
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript


script ui_create_universal_help \{next_state_name = None
		next_state_script = nullscript
		next_state_params = {
		}
		next_state_event = menu_replace
		help_global_index = !i1768515945
		device_num = !i1768515945
		show_mainmenu_bg = 0
		viewing_from_help_index = 0
		as_popup = 0
		fade_out = 0}
	if ((<as_popup> = 1) && (<next_state_script> = nullscript))
		ScriptAssert \{'When using as popup (inline), must specify next_state_script.'}
	endif
	clean_up_user_control_helpers
	if (<as_popup> = 0)
		destroy_friend_feed
	endif
	sdcardmanagerfunc \{func = push_lock_card}
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	GetArraySize ($g_universal_help_popups [<help_global_index>].page)
	if (<array_Size> <= 0)
		ScriptAssert 'Missing help pages for state: %s' s = <next_state_name>
	endif
	if (<as_popup> = 1)
		<element_create_func> = CreateScreenElement
	else
		<element_create_func> = uistack_createboundscreenelement
	endif
	<element_create_func> {
		Type = ContainerElement
		id = universal_help_popup_id
		parent = root_window
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		z_priority = 500.0
		exclusive_device = <device_num>
		tags = {
			current_help_page_index = 0
			num_help_pages = <array_Size>
			next_state_name = <next_state_name>
			help_global_index = <help_global_index>
			next_state_name = <next_state_name>
			next_state_script = <next_state_script>
			next_state_params = <next_state_params>
			next_state_event = <next_state_event>
			as_popup = <as_popup>
			fade_out = <fade_out>
			device_num = <device_num>
		}
	}
	if (<viewing_from_help_index> = 0)
		if StructureContains structure = ($g_universal_help_popups [<help_global_index>]) bg_alpha
			<bg_alpha> = (($g_universal_help_popups [<help_global_index>]).bg_alpha)
		endif
	endif
	CreateScreenElement {
		Type = descinterface
		parent = universal_help_popup_id
		desc = ($g_universal_help_popups [<help_global_index>].nxgui_desc)
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		alpha = 0.0
		dlog_heading_text = ($g_universal_help_popups [<help_global_index>].help_context_title)
		layout_2_image_alpha = 0.0
		dlog_darken_sprite_alpha = <bg_alpha>
		tags = {
			current_help_page_index = 0
			num_help_pages = <array_Size>
			current_state_name = <current_state_name>
		}
	}
	ui_universal_help_populate_layout {
		help_global_index = <help_global_index>
		page_num = 0
		initial_setup = 1
	}
	ui_universal_help_add_handlers {
		help_context = ($g_universal_help_popups [<help_global_index>].help_context)
		next_state_name = <next_state_name>
		next_state_script = <next_state_script>
		next_state_params = <next_state_params>
		next_state_event = <next_state_event>
		initial_setup = 1
	}
	if NOT GotParam \{do_not_play_popup_sfx}
		ui_sfx \{menustate = universalpopup
			uitype = select}
	endif
	LaunchEvent \{Type = focus
		target = universal_help_popup_id}
	universal_help_popup_id :Obj_SpawnScriptNow ui_universal_help_anim_in params = {next_state_name = <next_state_name>}
endscript

script ui_destroy_universal_help \{show_mainmenu_bg = 0}
	sdcardmanagerfunc \{func = pop_lock_card}
	if (<show_mainmenu_bg> = 1)
		destroy_mainmenu_bg
	endif
	clean_up_user_control_helpers
endscript

script ui_universal_help_populate_layout \{help_global_index = !i1768515945
		page_num = !i1768515945
		alpha_time = 0.0
		initial_setup = 0}
	<layout> = ($g_universal_help_popups [<help_global_index>].page [<page_num>].layout)
	if ((<layout> != layout_1) && (<layout> != layout_2))
		ScriptAssert \{'Invalid help page layout specified!'}
	endif
	<extra_params> = {}
	if (<layout> = layout_1)
		<text_desc> = 'dialog_box_universal_item_lg'
		<menu_alias> = alias_layout_1_menu
		AddParam \{structure_name = extra_params
			Name = layout_1_alpha
			value = 1.0}
		AddParam \{structure_name = extra_params
			Name = layout_2_alpha
			value = 0.0}
	else
		<text_desc> = 'dialog_box_universal_item_sm'
		<menu_alias> = alias_layout_2_menu
		AddParam \{structure_name = extra_params
			Name = layout_1_alpha
			value = 0.0}
		AddParam \{structure_name = extra_params
			Name = layout_2_alpha
			value = 1.0}
	endif
	ResolveScreenElementID \{id = {
			universal_help_popup_id
			child = 0
		}}
	<layout_id> = <resolved_id>
	<layout_id> :se_setprops alpha = 0 time = <alpha_time>
	if NOT <layout_id> :desc_resolvealias Name = <menu_alias> param = menu_alias_id
		ScriptAssert 'Could not find alias %l in the help page layout!' l = <menu_alias>
	endif
	DestroyScreenElement id = <menu_alias_id> preserve_parent
	if (<layout> = layout_2)
		AddParam {
			structure_name = extra_params
			Name = layout_2_image_texture
			value = ($g_universal_help_popups [<help_global_index>].page [<page_num>].image)
		}
	endif
	<desc_alpha> = 1.0
	if (<initial_setup> = 1)
		<desc_alpha> = 0.0
	endif
	GetArraySize ($g_universal_help_popups [<help_global_index>].page [<page_num>].text)
	if (<array_Size> > 0)
		<i> = 0
		begin
		CreateScreenElement {
			Type = descinterface
			parent = <menu_alias_id>
			desc = <text_desc>
			pos_anchor = [center , center]
			just = [center , center]
			autosizedims = true
			text_text = ($g_universal_help_popups [<help_global_index>].page [<page_num>].text [<i>])
			alpha = <desc_alpha>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<layout_id> :se_setprops {
		dlog_heading_text = ($g_universal_help_popups [<help_global_index>].help_context_title)
		<extra_params>
	}
	if (<initial_setup> = 0)
		<layout_id> :se_setprops alpha = 1 time = <alpha_time>
	endif
endscript

script ui_universal_help_change_page \{direction = next}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = universal_help_popup_id}
		LaunchEvent \{Type = unfocus
			target = universal_help_popup_id}
		universal_help_popup_id :se_setprops \{block_events}
		universal_help_popup_id :GetTags
		if (<direction> = next)
			<current_help_page_index> = (<current_help_page_index> + 1)
			if (<current_help_page_index> >= <num_help_pages>)
				<current_help_page_index> = 0
			endif
		else
			<current_help_page_index> = (<current_help_page_index> - 1)
			if (<current_help_page_index> < 0)
				<current_help_page_index> = (<num_help_pages> - 1)
			endif
		endif
		universal_help_popup_id :SetTags current_help_page_index = <current_help_page_index>
		ResolveScreenElementID \{id = {
				universal_help_popup_id
				child = 0
			}}
		ui_universal_help_populate_layout {
			help_global_index = <help_global_index>
			page_num = <current_help_page_index>
			alpha_time = 0.5
		}
		if (<direction> = next)
			ui_sfx \{menustate = Generic
				uitype = scrolldown}
		else
			ui_sfx \{menustate = Generic
				uitype = scrollup}
		endif
		universal_help_popup_id :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = universal_help_popup_id}
	endif
endscript

script ui_universal_help_add_handlers \{help_context = !q1768515945
		next_state_name = !q1768515945
		next_state_script = !q1768515945
		next_state_params = 0x69696969
		next_state_event = !q1768515945
		intial_setup = 0}
	if ScreenElementExists \{id = universal_help_popup_id}
		universal_help_popup_id :GetSingleTag \{num_help_pages}
		if (<next_state_script> = songlist_continue_for_quickplay)
			array = [
				{
					pad_choose
					ui_sfx
					params = {
						menustate = setlist
						uitype = complete
					}
				}
			]
		else
			array = [
				{
					pad_choose
					ui_sfx
					params = {
						menustate = Generic
						uitype = select
					}
				}
			]
		endif
		if (<initial_setup> = 1)
			AddArrayElement {
				array = <array>
				element = {
					pad_choose
					ui_universal_help_skip_anim_in
					params = {next_state_name = <next_state_name>}
				}
			}
		else
			AddArrayElement {
				array = <array>
				element = {
					pad_choose
					universal_help_flip_globaltag_and_continue
					params = {
						help_context = <help_context>
						next_state_name = <next_state_name>
						next_state_script = <next_state_script>
						next_state_params = <next_state_params>
						next_state_event = <next_state_event>
					}
				}
			}
			if (<num_help_pages> > 1)
				AddArrayElement {
					array = <array>
					element = {
						pad_right
						ui_universal_help_change_page
						params = {
							direction = next
						}
					}
				}
				AddArrayElement {
					array = <array>
					element = {
						pad_down
						ui_universal_help_change_page
						params = {
							direction = next
						}
					}
				}
				AddArrayElement {
					array = <array>
					element = {
						pad_left
						ui_universal_help_change_page
						params = {
							direction = previous
						}
					}
				}
				AddArrayElement {
					array = <array>
					element = {
						pad_up
						ui_universal_help_change_page
						params = {
							direction = previous
						}
					}
				}
			endif
		endif
		if (<next_state_name> = uistate_mainmenu_play)
			universal_help_popup_id :GetSingleTag \{device_num}
			AddArrayElement {
				array = <array>
				element = {
					pad_option2
					universal_help_flip_globaltag_and_continue
					params = {
						help_context = <help_context>
						next_state_name = None
						next_state_script = main_menu_select_training_from_universal_help
						next_state_params = {device_num = <device_num>}
						next_state_event = NULL
					}
				}
			}
		endif
		universal_help_popup_id :se_setprops {
			event_handlers = <array>
			replace_handlers
		}
	endif
endscript

script universal_help_find_help_index \{help_context = !q1768515945}
	GetArraySize ($g_universal_help_popups)
	<help_index> = -1
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (($g_universal_help_popups [<i>].help_context) = <help_context>)
			<help_index> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return help_index = <help_index>
endscript

script universal_help_display_help_check \{device_num = -1
		help_context = !q1768515945}
	<help_tag_checksum> = universal_help_display
	<show_help_page> = 0
	<help_index> = -1
	if NOT InNetGame
		if (<device_num> = -1)
			<device_num> = ($primary_controller)
		endif
		universal_help_find_help_index help_context = <help_context>
		if (<help_index> != -1)
			if NOT ininternetmode
				if ((<device_num> >= 0) && (<device_num> < 4))
					get_savegame_from_controller controller = <device_num>
					GetGlobalTags user_options savegame = <savegame> param = <help_tag_checksum>
					if ((<...>.<help_tag_checksum>) != always_off)
						if ((<...>.<help_tag_checksum>) = always_on)
							<show_help_page> = 1
						elseif ((<...>.<help_tag_checksum>) = Normal)
							if (($g_universal_help_popups [<help_index>].triggered) = Always)
								<show_help_page> = 1
							elseif (($g_universal_help_popups [<help_index>].triggered) = never)
								<show_help_page> = 0
							else
								get_universal_help_globaltag savegame = <savegame> help_context = <help_context>
								if (<help_viewed_tag> = 0)
									<show_help_page> = 1
								endif
							endif
						else
							ScriptAssert \{'Invalid universal help global display tag option'}
						endif
					endif
				endif
			endif
		endif
	endif
	return {
		show_help_page = <show_help_page>
		help_index = <help_index>
	}
endscript

script universal_help_flip_globaltag_and_continue \{help_context = !q1768515945
		next_state_name = !q1768515945
		next_state_script = !q1768515945
		next_state_params = 0x69696969
		next_state_event = !q1768515945}
	printf \{'------------ universal_help_flip_globaltag_and_continue ------------'}
	<help_tag_checksum> = universal_help_display
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options savegame = <savegame> param = <help_tag_checksum>
	if ((<...>.<help_tag_checksum>) = Normal)
		save_universal_help_globaltag {
			savegame = <savegame>
			help_context = <help_context>
			viewed_value = 1
		}
	endif
	<as_popup> = 0
	<fade_out> = 0
	if ScreenElementExists \{id = universal_help_popup_id}
		universal_help_popup_id :GetSingleTag \{fade_out}
		if universal_help_popup_id :GetSingleTag \{as_popup}
			if (<as_popup> = 1)
				if (<fade_out> = 1)
					universal_help_popup_id :se_setprops \{alpha = 0
						time = 0.4}
					universal_help_popup_id :se_waitprops
				endif
				DestroyScreenElement \{id = universal_help_popup_id}
			endif
		endif
	endif
	if (<next_state_name> != None)
		if (<as_popup> = 1)
			ScriptAssert \{'DO NOT use universal help in popup mode with a next state! This mode must call exit script.'}
		endif
		if (<next_state_name> = uistate_songlist)
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
		endif
		ui_event {
			event = <next_state_event>
			state = <next_state_name>
			data = <next_state_params>
		}
	else
		<next_state_script> <next_state_params>
	endif
endscript

script ui_universal_help_anim_in 
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0x784c64ff)
		button = green
		z = 100000}
	if ScreenElementExists \{id = universal_help_popup_id}
		universal_help_popup_id :GetSingleTag \{help_global_index}
		<layout> = ($g_universal_help_popups [<help_global_index>].page [0].layout)
		if (<layout> = layout_1)
			<menu_alias> = alias_layout_1_menu
		else
			<menu_alias> = alias_layout_2_menu
		endif
		ResolveScreenElementID \{id = {
				universal_help_popup_id
				child = 0
			}}
		<layout_id> = <resolved_id>
		<layout_id> :se_setprops layout_container_scale = 0.3
		<layout_id> :se_waitprops
		<layout_id> :se_setprops {
			alpha = 1.0
			layout_container_scale = 1.5
		}
		<layout_id> :se_waitprops
		<layout_id> :se_setprops {
			layout_container_scale = 1.0
			time = 0.1
		}
		<layout_id> :se_waitprops
		Wait \{0.1
			Seconds}
		if <layout_id> :desc_resolvealias Name = <menu_alias>
			GetScreenElementChildren id = <resolved_id>
			if GotParam \{children}
				GetArraySize <children>
			else
				<array_Size> = 0
			endif
			if (<layout> = layout_2)
				<array_Size> = (<array_Size> + 1)
			endif
			if (<array_Size> > 0)
				<i> = 0
				<done_image> = 0
				begin
				ui_sfx \{menustate = universalpopup
					uitype = animatein}
				if ((<layout> = layout_2) && (<done_image> = 0))
					<layout_id> :se_setprops {
						layout_2_image_alpha = 1.0
						time = 0.2
					}
					<done_image> = 1
					Wait \{0.2
						Seconds}
				else
					(<children> [<i>]) :se_setprops {
						alpha = 1.0
						time = 0.2
					}
					(<children> [<i>]) :se_waitprops
					<i> = (<i> + 1)
				endif
				Wait \{0.2
					Seconds}
				repeat <array_Size>
			endif
		endif
	endif
	universal_help_popup_id :GetTags
	ui_universal_help_add_handlers {
		help_context = ($g_universal_help_popups [<help_global_index>].help_context)
		next_state_name = <next_state_name>
		next_state_script = <next_state_script>
		next_state_params = <next_state_params>
		next_state_event = <next_state_event>
		initial_setup = 0
	}
	user_control_helper_change_text \{text = qs(0x182f0173)
		button = green
		z = 100000}
	if (<next_state_name> = uistate_mainmenu_play)
		add_user_control_helper \{text = qs(0xd093953b)
			button = yellow
			z = 100000}
	endif
	universal_help_popup_id :GetSingleTag \{num_help_pages}
	if (<num_help_pages> > 1)
		if user_control_helper_exists \{button = strumbar}
			user_control_helper_change_text \{text = qs(0x0f671db0)
				button = strumbar}
		else
			add_user_control_helper \{text = qs(0x0f671db0)
				button = strumbar
				z = 100000}
		endif
	endif
endscript

script ui_universal_help_skip_anim_in 
	LaunchEvent \{Type = unfocus
		target = universal_help_popup_id}
	universal_help_popup_id :se_setprops \{block_events}
	universal_help_popup_id :Obj_KillSpawnedScript \{Name = ui_universal_help_anim_in}
	StopSoundEvent \{audio_ui_generic_popup
		fade_time = 0.15
		fade_type = linear}
	StopSoundEvent \{audio_ui_universal_popup_text_animate_in
		fade_time = 0.05
		fade_type = linear}
	if IsSoundEventPlaying \{audio_ui_setlist_complete}
		StopSoundEvent \{audio_ui_setlist_complete}
		StopSoundEvent \{audio_ui_setlist_complete_guitar}
		ui_sfx \{menustate = Generic
			uitype = select}
	endif
	if ScreenElementExists \{id = universal_help_popup_id}
		universal_help_popup_id :GetSingleTag \{help_global_index}
		<layout> = ($g_universal_help_popups [<help_global_index>].page [0].layout)
		if (<layout> = layout_1)
			<menu_alias> = alias_layout_1_menu
		else
			<menu_alias> = alias_layout_2_menu
		endif
		ResolveScreenElementID \{id = {
				universal_help_popup_id
				child = 0
			}}
		<layout_id> = <resolved_id>
		<layout_id> :se_setprops {
			alpha = 1.0
			layout_container_scale = 1.0
		}
		if <layout_id> :desc_resolvealias Name = <menu_alias>
			GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<layout> = layout_2)
				<array_Size> = (<array_Size> + 1)
			endif
			if (<array_Size> > 0)
				<i> = 0
				<done_image> = 0
				begin
				if ((<layout> = layout_2) && (<done_image> = 0))
					<layout_id> :se_setprops {
						layout_2_image_alpha = 1.0
					}
					<done_image> = 1
				else
					(<children> [<i>]) :se_setprops {
						alpha = 1.0
					}
					(<children> [<i>]) :se_waitprops
					<i> = (<i> + 1)
				endif
				repeat <array_Size>
			endif
		endif
	endif
	universal_help_popup_id :GetTags
	ui_universal_help_add_handlers {
		help_context = ($g_universal_help_popups [<help_global_index>].help_context)
		next_state_name = <next_state_name>
		next_state_script = <next_state_script>
		next_state_params = <next_state_params>
		next_state_event = <next_state_event>
		initial_setup = 0
	}
	user_control_helper_change_text \{text = qs(0x182f0173)
		button = green
		z = 100000}
	if (<next_state_name> = uistate_mainmenu_play)
		add_user_control_helper \{text = qs(0xd093953b)
			button = yellow
			z = 100000}
	endif
	universal_help_popup_id :GetSingleTag \{num_help_pages}
	if (<num_help_pages> > 1)
		if user_control_helper_exists \{button = strumbar}
			user_control_helper_change_text \{text = qs(0x0f671db0)
				button = strumbar}
		else
			add_user_control_helper \{text = qs(0x0f671db0)
				button = strumbar
				z = 100000}
		endif
	endif
	universal_help_popup_id :se_setprops \{unblock_events}
	LaunchEvent \{Type = focus
		target = universal_help_popup_id}
endscript

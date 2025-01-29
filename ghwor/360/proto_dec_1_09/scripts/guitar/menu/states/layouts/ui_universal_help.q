g_universal_help_popups = [
	{
		help_context = 0x269c1006
		help_context_title = qs(0x2247b69b)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0x19986eb1)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0xb4dbc708)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = training_menu
		help_context_title = qs(0xd093953b)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0xe5a63fa0)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0x8b614b0b)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = gh_studio
		help_context_title = $guitar_main_menu_ghstudio_string
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0xc541352b)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = music_store
		help_context_title = qs(0xa8e9637f)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0x1612579b)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0x0ad0fa60)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = rock_star_creator
		help_context_title = qs(0x9f894c1e)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0xfa9fe0f9)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = leaderboards_menu
		help_context_title = qs(0xa1ae7e56)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0x93e5b75f)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0x99b24eb4)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = options_menu
		help_context_title = qs(0x976cf9e7)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0x735b4547)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0x76a542e2)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = quickplay_songlist
		help_context_title = qs(0xd2c06b17)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0xcaef892a)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0x5450bb23)
				image = icon_instrument_guitar_top
			}
		]
	}
	{
		help_context = quickplay_to_gameplay
		help_context_title = qs(0x8c241c9b)
		nxgui_desc = 'universal_help_popup'
		triggered = once
		page = [
			{
				text = qs(0xecb938d2)
				image = icon_instrument_guitar_top
			}
			{
				text = qs(0x6ddf5cec)
				image = icon_instrument_guitar_top
			}
		]
	}
]

script ui_create_universal_help \{next_state_name = None
		next_state_script = nullscript
		next_state_params = {
		}
		help_global_index = !i1768515945
		device_num = !i1768515945}
	clean_up_user_control_helpers
	GetArraySize ($g_universal_help_popups [<help_global_index>].page)
	if (<array_Size> <= 0)
		ScriptAssert 'Missing help pages for state: %s' s = <next_state_name>
	endif
	uistack_createboundscreenelement {
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
			help_global_index = <help_global_index> s
		}
	}
	CreateScreenElement {
		Type = descinterface
		parent = universal_help_popup_id
		desc = ($g_universal_help_popups [<help_global_index>].nxgui_desc)
		Pos = (0.0, 0.0)
		pos_anchor = [center , center]
		just = [center , center]
		help_details_text_text = ($g_universal_help_popups [<help_global_index>].page [0].text)
		help_details_sprite_texture = ($g_universal_help_popups [<help_global_index>].page [0].image)
		tags = {
			current_help_page_index = 0
			num_help_pages = <array_Size>
			current_state_name = <current_state_name>
		}
	}
	ui_universal_help_add_handlers {
		num_help_pages = <array_Size>
		help_context = ($g_universal_help_popups [<help_global_index>].help_context)
		next_state_name = <next_state_name>
		next_state_script = <next_state_script>
		next_state_params = <next_state_params>
	}
	AssignAlias \{id = universal_help_popup_id
		alias = current_menu}
	LaunchEvent \{Type = focus
		target = universal_help_popup_id}
endscript

script ui_destroy_universal_help 
	clean_up_user_control_helpers
endscript

script ui_universal_help_change_page \{direction = next}
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
		CreateScreenElement {
			Type = descinterface
			parent = universal_help_popup_id
			desc = ($g_universal_help_popups [<help_global_index>].nxgui_desc)
			Pos = (0.0, 0.0)
			pos_anchor = [center , center]
			just = [center , center]
			help_details_text_text = ($g_universal_help_popups [<help_global_index>].page [<current_help_page_index>].text)
			help_details_sprite_texture = ($g_universal_help_popups [<help_global_index>].page [<current_help_page_index>].image)
			tags = {
				current_help_page_index = <current_help_page_index>
				num_help_pages = <num_help_pages>
				next_state_name = <next_state_name>
			}
			alpha = 0
		}
		<resolved_id> :se_setprops alpha = 0 time = 0.5
		if (<direction> = next)
			ui_sfx \{menustate = Generic
				uitype = scrolldown}
		else
			ui_sfx \{menustate = Generic
				uitype = scrollup}
		endif
		<id> :se_setprops alpha = 1 time = 0.5
		DestroyScreenElement id = <resolved_id>
		universal_help_popup_id :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = universal_help_popup_id}
	endif
endscript

script ui_universal_help_add_handlers \{num_help_pages = !i1768515945
		help_context = !q1768515945
		next_state_name = !q1768515945
		next_state_script = !q1768515945
		next_state_params = 0x69696969}
	if ScreenElementExists \{id = universal_help_popup_id}
		array = [
			{
				pad_choose
				universal_help_flip_globaltag_and_continue
				params = {
					help_context = <help_context>
					next_state_name = <next_state_name>
					next_state_script = <next_state_script>
					next_state_params = <next_state_params>
				}
			}
			{
				pad_choose
				ui_sfx
				params = {
					menustate = Generic
					uitype = select
				}
			}
		]
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
		universal_help_popup_id :se_setprops {
			event_handlers = <array>
		}
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
		if (<num_help_pages> > 1)
			add_user_control_helper \{text = qs(0x0f671db0)
				button = strumbar
				z = 100000}
		endif
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

script universal_help_display_help_check \{device_num = !i1768515945
		help_context = !q1768515945}
	<help_tag_checksum> = universal_help_display
	<show_help_page> = 0
	<help_index> = -1
	if NOT InNetGame
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
		next_state_params = 0x69696969}
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
	if (<next_state_name> != None)
		generic_event_replace {
			state = <next_state_name>
			data = <next_state_params>
		}
	else
		<next_state_script> <next_state_params>
	endif
endscript

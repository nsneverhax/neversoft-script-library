music_store_visited = 0

script create_music_store_menu \{pad_back_script = generic_event_back}
	if ScreenElementExists \{id = gh_music_store}
		return
	endif
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	update_ingame_controllers controller = <exclusive_device>
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	music_store_determine_currency
	CreateScreenElement {
		id = gh_music_store
		parent = root_window
		Type = descinterface
		desc = 'gh_music_store'
		exclusive_device = <exclusive_device>
		credits_availible_currency_texture = <money_icon>
		credits_availible_text_text = <credits_text>
	}
	if gh_music_store :desc_resolvealias \{Name = alias_options_list_vmenu
			param = gh_music_store_menu}
		AssignAlias id = <gh_music_store_menu> alias = current_menu
		<gh_music_store_menu> :SetTags {total_length = 0}
	else
		ScriptAssert \{qs(0x2784bcef)}
	endif
	if gh_music_store :desc_resolvealias \{Name = alias_menu_history_hmenu
			param = gh_music_store_history_menu}
		CreateScreenElement {
			parent = <gh_music_store_history_menu>
			Type = TextBlockElement
			text = qs(0x64a75b5f)
			font = fontgrid_text_a3
			dims = (0.0, 26.0)
			fit_height = `scale	down	if	larger`
			fit_width = `expand	dims`
			rgba = [0 0 0 255]
			internal_just = [left , top]
			z_priority = 50
		}
		main_id = <id>
		GetScreenElementDims id = <main_id>
		CreateScreenElement {
			parent = <gh_music_store_history_menu>
			Type = WindowElement
			dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		}
		SetScreenElementProps id = <main_id> parent = <id> Pos = (0.0, 0.0) just = [left , top]
		SpawnScriptNow music_store_animate_main_history params = {id = <main_id>}
	else
		ScriptAssert \{qs(0xf9593720)}
	endif
	add_generic_menu_up_down_sound_handlers
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_option2 ui_menu_select_sfx}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
			]
			replace_handlers
		}
	endif
	gh_music_store :SetTags \{sort_index = 0}
	Change \{music_store_visited = 1}
endscript

script add_music_store_item \{parent = current_menu}
	if GotParam \{text}
		StringLength string = <text>
		if (<str_len> >= 25)
			stringncopy string = <text> length = 24
			text = (<new_string> + qs(0x3871eb3b))
		endif
	endif
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'gh_music_store_item'
		options_list_item_text_text = <text>
		autosizedims = true
	}
	if GotParam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{replace_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_replace data = {state = <replace_state> <replace_state_data> container_id = <id>}}
	endif
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{focus music_store_item_focus params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus music_store_item_unfocus params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose music_store_item_select_anim params = {id = <id>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
			]
		}
	endif
	<parent> :GetSingleTag total_length
	if GotParam \{total_length}
		total_length = (<total_length> + 40)
		<parent> :SetTags {total_length = <total_length>}
		if (<total_length> > 310)
			music_store_turn_on_arrows
		endif
	endif
endscript

script add_music_store_purchase_item \{parent = current_menu}
	if GotParam \{text}
		StringLength string = <text>
		if (<str_len> >= 25)
			stringncopy string = <text> length = 24
			text = (<new_string> + qs(0x3871eb3b))
		endif
	endif
	music_store_determine_currency
	if GotParam \{price}
		formatText TextName = price_text qs(0x581d2af2) p = <price>
	endif
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'gh_music_store_purchase_item'
		options_list_item_money_texture = <money_icon>
		options_list_item_price_text = <price_text>
		options_list_item_text_text = <text>
		autosizedims = true
	}
	if GotParam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{replace_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_replace data = {state = <replace_state> <replace_state_data> container_id = <id>}}
	endif
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{focus music_store_item_focus params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus music_store_item_unfocus params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose music_store_item_select_anim params = {id = <id>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
			]
		}
	endif
	<parent> :GetSingleTag total_length
	if GotParam \{total_length}
		total_length = (<total_length> + 40)
		<parent> :SetTags {total_length = <total_length>}
		if (<total_length> > 310)
			music_store_turn_on_arrows
		endif
	endif
endscript

script add_music_store_purchase_dialogue \{parent = current_menu}
	music_store_determine_currency
	if GotParam \{price}
		formatText TextName = price_text qs(0x581d2af2) p = <price>
	endif
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'gh_music_store_purchase_dialogue'
		options_list_item_text_text = <text>
		options_list_purchase_item_options_list_item_money_texture = <money_icon>
		options_list_purchase_item_options_list_item_price_text = <price_text>
		autosizedims = true
		not_focusable
	}
	<parent> :GetSingleTag total_length
	if GotParam \{total_length}
		total_length = (<total_length> + 40)
		<parent> :SetTags {total_length = <total_length>}
		if (<total_length> > 310)
			music_store_turn_on_arrows
		endif
	endif
endscript

script destroy_music_store 
	if ScreenElementExists \{id = gh_music_store}
		DestroyScreenElement \{id = gh_music_store}
	endif
endscript

script destroy_music_store_menus 
	music_store_clear_options
	music_store_clear_sort_info
	music_store_clear_history
	if NOT GotParam \{preserve_album_info}
		music_store_clear_album_info
	endif
	music_store_turn_off_arrows
	clean_up_user_control_helpers
endscript

script music_store_clear_options 
	if ScreenElementExists \{id = current_menu}
		DestroyScreenElement \{id = current_menu
			preserve_parent}
		current_menu :SetTags \{total_length = 0}
	endif
endscript

script music_store_turn_on_arrows 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{arrows_alpha = 0.5}
	endif
endscript

script music_store_turn_off_arrows 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{arrows_alpha = 0.0}
	endif
endscript

script music_store_add_history_item 
	RequireParams \{[
			text
		]
		all}
	if GotParam \{text}
		StringLength string = <text>
		if (<str_len> >= 25)
			stringncopy string = <text> length = 24
			text = (<new_string> + qs(0x3871eb3b))
		endif
	endif
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_menu_history_hmenu
				param = gh_music_store_history_menu}
			CreateScreenElement {
				parent = <gh_music_store_history_menu>
				Type = TextBlockElement
				text = qs(0xa5766a28)
				font = fontgrid_text_a3
				dims = (15.0, 26.0)
				fit_height = `scale	down	if	larger`
				fit_width = `expand	dims`
				rgba = [0 0 0 255]
				internal_just = [left , top]
				just = [left , center]
				pos_anchor = [left , center]
				z_priority = 50
			}
			CreateScreenElement {
				parent = <gh_music_store_history_menu>
				Type = TextBlockElement
				Pos = (0.0, 0.0)
				text = <text>
				font = fontgrid_text_a3
				dims = (0.0, 26.0)
				fit_height = `scale	down	if	larger`
				fit_width = `expand	dims`
				rgba = [0 0 0 255]
				internal_just = [left , top]
				just = [left , center]
				pos_anchor = [left , center]
				z_priority = 50
			}
			if GotParam \{animate_in}
				hist_id = <id>
				GetScreenElementDims id = <hist_id>
				dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				CreateScreenElement {
					Pos = (0.0, 0.0)
					parent = <gh_music_store_history_menu>
					Type = WindowElement
					dims = (0.0, 26.0)
					just = [left , center]
					pos_anchor = [left , center]
				}
				SetScreenElementProps id = <hist_id> parent = <id> Pos = (0.0, 0.0) just = [left , center] pos_anchor = [left , center]
				SetScreenElementProps id = <id> dims = <dims>
				SpawnScriptNow music_store_animate_new_history params = {id = <hist_id> width = <width>}
			endif
		else
			ScriptAssert \{qs(0x41fde101)}
		endif
	endif
endscript

script music_store_clear_history 
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_menu_history_hmenu
				param = gh_music_store_history_menu}
			DestroyScreenElement id = <gh_music_store_history_menu> preserve_parent
			CreateScreenElement {
				parent = <gh_music_store_history_menu>
				Type = TextBlockElement
				text = qs(0x64a75b5f)
				font = fontgrid_text_a3
				dims = (0.0, 26.0)
				fit_height = `scale	down	if	larger`
				fit_width = `expand	dims`
				rgba = [0 0 0 255]
				internal_just = [left , top]
				z_priority = 50
			}
		else
			ScriptAssert \{qs(0xb3db4f72)}
		endif
	endif
endscript

script music_store_add_album_info_item 
	RequireParams \{[
			text
		]
		all}
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_title_info_menu
				param = gh_music_store_album_info_menu}
			CreateScreenElement {
				parent = <gh_music_store_album_info_menu>
				Type = TextBlockElement
				text = <text>
				font = fontgrid_text_a3
				dims = (390.0, 28.0)
				fit_height = `scale	down	if	larger`
				fit_width = `expand	dims`
				rgba = [220 122 5 200]
				internal_just = [center , center]
				z_priority = 50
			}
			item_id = <id>
			GetScreenElementDims id = <item_id>
			if (<width> > 390)
				dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				CreateScreenElement {
					parent = <gh_music_store_album_info_menu>
					Type = ContainerElement
					dims = (390.0, 28.0)
					just = [left , center]
				}
				CreateScreenElement {
					parent = <id>
					Type = ContainerElement
					dims = (390.0, 28.0)
					just = [left , top]
				}
				ticker_id = <id>
				text = (qs(0xdea80396) + <text>)
				SetScreenElementProps id = <item_id> parent = <ticker_id> pos_anchor = [left , center] just = [left , center] Pos = (0.0, 0.0) internal_just = [left , center] text = <text>
				GetScreenElementDims id = <item_id>
				new_dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				CreateScreenElement {
					parent = <ticker_id>
					Type = TextBlockElement
					text = <text>
					font = fontgrid_text_a3
					dims = <new_dims>
					fit_height = `scale	down	if	larger`
					fit_width = `expand	dims`
					rgba = [220 122 5 200]
					internal_just = [center , center]
					z_priority = 50
					just = [left , center]
					pos_anchor = [left , center]
					internal_just = [left , center]
					Pos = (<width> * (1.0, 0.0))
				}
				SpawnScriptNow music_store_scroll_album_info params = {id = <ticker_id> width = <width>}
			endif
		else
			ScriptAssert \{qs(0x7593769d)}
		endif
	endif
endscript

script music_store_scroll_album_info 
	RequireParams \{[
			id
			width
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	time = (<width> * 0.01)
	begin
	if ScreenElementExists id = <id>
		new_pos = (<width> * (-1.0, 0.0))
		<id> :se_setprops Pos = {relative <new_pos>} time = <time>
	endif
	Wait <time> Seconds
	if ScreenElementExists id = <id>
		<id> :se_setprops Pos = (0.0, 0.0)
	endif
	repeat
endscript

script music_store_clear_album_info 
	if ScriptIsRunning \{music_store_scroll_album_info}
		KillSpawnedScript \{Name = music_store_scroll_album_info}
	endif
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_title_info_menu
				param = gh_music_store_album_info_menu}
			DestroyScreenElement id = <gh_music_store_album_info_menu> preserve_parent
		else
			ScriptAssert \{qs(0x43ff3582)}
		endif
	endif
endscript

script music_store_add_sort_info_item 
	RequireParams \{[
			text
		]
		all}
	if NOT GotParam \{focused}
		alpha = 0.5
	endif
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_sort_info_hmenu
				param = gh_music_store_sort_info_menu}
			CreateScreenElement {
				parent = <gh_music_store_sort_info_menu>
				Type = TextBlockElement
				text = <text>
				font = fontgrid_text_a3
				dims = (0.0, 32.0)
				fit_height = `scale	down	if	larger`
				fit_width = `expand	dims`
				rgba = [220 122 5 200]
				internal_just = [left , center]
				z_priority = 50
				alpha = <alpha>
			}
		else
			ScriptAssert \{qs(0xa02af5ca)}
		endif
	endif
endscript

script music_store_add_sort_info 
	RequireParams \{[
			state_list
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	music_store_clear_sort_info
	if ScreenElementExists \{id = current_menu}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_option2 music_store_rotate_sort params = {state_list = <state_list> previous_history = <previous_history> list = <list>}}
			]
			replace_handlers
		}
	endif
	add_user_control_helper \{text = qs(0xa3a9dad6)
		button = yellow
		z = 100000}
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_sort_info_hmenu
				param = gh_music_store_sort_info_menu}
			<gh_music_store_sort_info_menu> :se_setprops alpha = 0.0
			music_store_add_all_sort_items state_list = <state_list>
			<gh_music_store_sort_info_menu> :se_setprops alpha = 1.0 time = 0.2
		endif
	endif
endscript

script music_store_clear_sort_info 
	if ScreenElementExists \{id = current_menu}
		SetScreenElementProps \{id = current_menu
			event_handlers = [
				{
					pad_option2
					nullscript
				}
			]
			replace_handlers}
	endif
	music_store_clear_sort_info_menu
endscript

script music_store_clear_sort_info_menu 
	if ScreenElementExists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{Name = alias_sort_info_hmenu
				param = gh_music_store_sort_info_menu}
			DestroyScreenElement id = <gh_music_store_sort_info_menu> preserve_parent
		else
			ScriptAssert \{qs(0x202243aa)}
		endif
	endif
endscript

script music_store_motd_callback 
	if GotParam \{motd_text}
		Change \{retrieved_message_of_the_day = 1}
		Change message_of_the_day = <motd_text>
	endif
	if GotParam \{success}
		if (<success> = success)
			if GlobalExists \{Name = motd_subject}
				music_store_set_motd text = ($motd_subject)
				return
			endif
		endif
	endif
	music_store_set_motd \{text = qs(0x2464e74b)}
endscript

script music_store_set_motd 
	RequireParams \{[
			text
		]
		all}
	if ScreenElementExists \{id = gh_music_store}
		if (($music_store_visited) = 0)
			rgba = [224 224 224 255]
		else
			rgba = [220 122 5 200]
		endif
		CreateScreenElement {
			id = temp_motd_block
			parent = root_window
			Type = TextBlockElement
			fit_width = qs(0xd607fd45)
			fit_height = qs(0xc79d7639)
			text = <text>
			dims = (1025.0, 2000.0)
			just = [left , top]
			alpha = 0.0
			font = fontgrid_text_a3
			internal_just = [left , top]
		}
		GetScreenElementChildren \{id = temp_motd_block}
		if GotParam \{children}
			GetArraySize <children>
			if (<array_Size> > 0)
				if gh_music_store :desc_resolvealias \{Name = alias_motd_text_1
						param = gh_music_store_motd_1}
					if gh_music_store :desc_resolvealias \{Name = alias_motd_text_2
							param = gh_music_store_motd_2}
						text_params = {
							Type = TextBlockElement
							dims = (0.0, 32.0)
							just = [0.0 , 0.0]
							pos_anchor = [-1.0 , -1.0]
							z_priority = 6
							font = fontgrid_text_a3
							fit_width = `expand	dims`
							fit_height = `scale	down	if	larger`
							internal_just = [-1.0 , -1.0]
							rgba = <rgba>
						}
						i = 0
						begin
						if music_store_get_screen_element_text id = (<children> [<i>])
							CreateScreenElement {
								parent = <gh_music_store_motd_1>
								<text_params>
								text = (<text> + qs(0x713755f7))
							}
							CreateScreenElement {
								parent = <gh_music_store_motd_2>
								<text_params>
								text = (<text> + qs(0x713755f7))
							}
						endif
						i = (<i> + 1)
						repeat <array_Size>
						CreateScreenElement {
							parent = <gh_music_store_motd_1>
							<text_params>
							text = qs(0xa0ee0db2)
						}
						CreateScreenElement {
							parent = <gh_music_store_motd_2>
							<text_params>
							text = qs(0xa0ee0db2)
						}
						GetScreenElementDims id = <gh_music_store_motd_1>
						if (<width> > 1025)
							new_pos = (<width> * (1.0, 0.0))
							gh_music_store :se_setprops motd_text_2_pos = {relative <new_pos>}
							SpawnScriptNow music_store_scroll_motd params = {width = <width>}
						else
							gh_music_store :se_setprops \{motd_text_1_internal_just = [
									center
									center
								]
								motd_text_2_alpha = 0.0}
						endif
					else
						ScriptAssert \{qs(0x8ee895f0)}
					endif
				else
					ScriptAssert \{qs(0xf289b02b)}
				endif
			endif
		endif
		if ScreenElementExists \{id = temp_motd_block}
			DestroyScreenElement \{id = temp_motd_block}
		endif
	endif
endscript

script music_store_get_screen_element_text 
	RequireParams \{[
			id
		]
		all}
	if ScreenElementExists id = <id>
		GetScreenElementProps id = <id>
		return true text = <text>
	else
		return \{FALSE}
	endif
endscript

script music_store_turn_on_preview_bar 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{preview_bar_alpha = 1.0}
	endif
endscript

script music_store_turn_off_preview_bar 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{preview_bar_alpha = 0.0}
	endif
endscript

script music_store_turn_set_preview_bar 
	RequireParams \{[
			progress
		]
		all}
	if (<progress> < 0)
		progress = 0
	endif
	if (<progress> > 1)
		progress = 1
	endif
	progress_scale = (<progress> * (1.0, 0.0) + (0.0, 1.0))
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops preview_bar_fill_scale = <progress_scale>
	endif
endscript

script music_store_turn_on_loading 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{loading_alpha = 1.0}
		SpawnScriptNow \{music_store_animate_loading}
	endif
endscript

script music_store_turn_off_loading 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{loading_alpha = 0.0}
		if ScriptIsRunning \{music_store_animate_loading}
			KillSpawnedScript \{Name = music_store_animate_loading}
		endif
	endif
endscript

script music_store_animate_loading 
	begin
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{loading_rot_angle = 0}
		gh_music_store :se_setprops \{loading_rot_angle = 360
			time = 1.5}
	endif
	Wait \{2
		Seconds}
	repeat
endscript

script music_store_turn_on_current_credits 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{credits_availible_alpha = 1.0}
	endif
endscript

script music_store_turn_off_current_credits 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{credits_availible_alpha = 0.0}
	endif
endscript

script music_store_item_focus 
	if ScreenElementExists id = <id>
		<id> :se_setprops options_list_item_point_alpha = 1.0
		<id> :se_setprops options_list_item_alpha = 1.0
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script music_store_item_unfocus 
	if ScreenElementExists id = <id>
		<id> :se_setprops options_list_item_point_alpha = 0.0
		<id> :se_setprops options_list_item_alpha = 0.6
	endif
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script music_store_item_select_anim 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{generic_menu_block_input = 1}
	GetScreenElementChildren id = <id>
	GetArraySize <children>
	if (<array_Size> > 0)
		menu_item_id = (<children> [0])
	endif
	GetScreenElementPosition id = <menu_item_id>
	newscreenlementpos = (<screenelementpos> + (20.0, 0.0))
	if ScreenElementExists id = <menu_item_id>
		SetScreenElementProps {id = <menu_item_id> Pos = <newscreenlementpos> time = 0.1}
	else
		Change \{generic_menu_block_input = 0}
		return
	endif
	Wait \{0.1
		Seconds}
	if ScreenElementExists id = <menu_item_id>
		SetScreenElementProps {id = <menu_item_id> Pos = <screenelementpos> time = 0.1}
	else
		Change \{generic_menu_block_input = 0}
		return
	endif
	Wait \{0.11
		Seconds}
	Change \{generic_menu_block_input = 0}
endscript

script music_store_wipe_in_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{generic_menu_block_input = 1}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{options_list_smenu_alpha = 0.0}
		gh_music_store :se_setprops \{options_list_patch_scale = (0.0, 0.95)}
		gh_music_store :se_setprops \{options_list_patch_scale = (0.9, 0.95)
			time = 0.2
			anim = gentle}
	endif
	Wait \{0.25
		Seconds}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{options_list_smenu_alpha = 1.0}
	endif
	if ScreenElementExists \{id = current_menu}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		if (<array_Size> > 8)
			array_Size = 8
		endif
		if (<array_Size> > 0)
			if (<array_Size> > 1)
				i = 1
				begin
				if ScreenElementExists id = (<children> [<i>])
					SetScreenElementProps {id = (<children> [<i>]) alpha = 0.0}
				endif
				i = (<i> + 1)
				repeat (<array_Size> -1)
			endif
			if ScreenElementExists id = (<children> [0])
				SetScreenElementProps {
					id = (<children> [0])
					options_list_item_pos = {relative (-550.0, 0.0)}
				}
				SetScreenElementProps {
					id = (<children> [0])
					options_list_item_pos = {relative (550.0, 0.0)}
					time = 0.1
				}
				Wait \{0.1
					Seconds}
			endif
			if (<array_Size> > 1)
				i = 1
				begin
				if ScreenElementExists id = (<children> [<i>])
					SetScreenElementProps {id = (<children> [<i>]) alpha = 1.0 time = 0.1}
					Wait \{0.1
						Seconds}
				endif
				i = (<i> + 1)
				repeat (<array_Size> -1)
			endif
		endif
	endif
	Change \{generic_menu_block_input = 0}
endscript

script music_store_wipe_in_album_info 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{title_info_menu_alpha = 0.0}
		gh_music_store :se_setprops \{title_info_bg_scale = (0.0, 0.9)}
		gh_music_store :se_setprops \{title_info_bg_scale = (1.0, 0.9)
			time = 0.2
			anim = gentle}
	endif
	Wait \{0.25
		Seconds}
	music_store_fade_in_album_info
endscript

script music_store_fade_in_album_info 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{title_info_menu_alpha = 1.0
			time = 0.15
			anim = gentle}
	endif
endscript

script music_store_fade_out_album_info 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{title_info_menu_alpha = 0.0
			time = 0.1
			anim = gentle}
	endif
endscript

script music_store_scroll_motd 
	RequireParams \{[
			width
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	time = (<width> * 0.003)
	begin
	if ScreenElementExists \{id = gh_music_store}
		new_pos = (<width> * (-1.0, 0.0))
		gh_music_store :se_setprops motd_text_pos = {relative <new_pos>} time = <time>
	endif
	Wait <time> Seconds
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{motd_text_pos = (0.0, 0.0)}
	endif
	repeat
endscript

script music_store_set_previous_history 
	RequireParams \{[
			previous_history
			new_entry
		]
		all}
	GetArraySize <previous_history>
	if (<array_Size> > 0)
		i = 0
		begin
		music_store_add_history_item text = (<previous_history> [<i>])
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{do_not_animate}
		music_store_add_history_item text = <new_entry>
	else
		music_store_add_history_item text = <new_entry> animate_in
	endif
	AddArrayElement array = <previous_history> element = <new_entry>
	return previous_history = <array>
endscript

script music_store_change_album_cover 
	RequireParams \{[
			texture
		]
		all}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops large_album_cover_bg_texture = <texture>
	endif
	SpawnScriptNow music_store_change_album_cover_anim params = {texture = <texture>}
endscript

script music_store_change_album_cover_anim 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	RequireParams \{[
			texture
		]
		all}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops new_album_cover_image_z_priority = 30 current_album_cover_image_z_priority = 100 new_album_cover_image_texture = <texture>
		gh_music_store :se_setprops \{new_album_cover_pos = (-100.0, 0.0)
			current_album_cover_pos = (100.0, 0.0)
			time = 0.2
			anim = gentle}
	endif
	Wait \{0.25
		Seconds}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops \{new_album_cover_image_z_priority = 100
			current_album_cover_image_z_priority = 30}
		gh_music_store :se_setprops \{new_album_cover_pos = (0.0, 0.0)
			current_album_cover_pos = (0.0, 0.0)
			time = 0.2
			anim = gentle}
	endif
	Wait \{0.25
		Seconds}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :se_setprops new_album_cover_image_z_priority = 30 current_album_cover_image_z_priority = 100 current_album_cover_image_texture = <texture>
	endif
endscript

script music_store_fade_in_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{generic_menu_block_input = 1}
	if ScreenElementExists \{id = current_menu}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		if (<array_Size> > 1)
			if (<array_Size> > 7)
				array_Size = 7
			endif
			i = 1
			begin
			if ScreenElementExists id = (<children> [<i>])
				SetScreenElementProps {id = (<children> [<i>]) alpha = 0.0}
			endif
			i = (<i> + 1)
			repeat (<array_Size> -1)
			i = 1
			begin
			if ScreenElementExists id = (<children> [<i>])
				SetScreenElementProps {id = (<children> [<i>]) alpha = 1.0 time = 0.1}
				Wait \{0.11
					Seconds}
			endif
			i = (<i> + 1)
			repeat (<array_Size> -1)
		endif
	else
		return
	endif
	Change \{generic_menu_block_input = 0}
endscript

script music_store_animate_main_history 
	if ScreenElementExists id = <id>
		<id> :se_setprops Pos = {relative (0.0, 40.0)}
		<id> :se_setprops Pos = {relative (0.0, -40.0)} time = 0.2
	else
		return
	endif
endscript

script music_store_animate_new_history 
	if ScreenElementExists id = <id>
		GetScreenElementPosition id = <id>
		new_relative_pos = (<width> * (-1.0, 0.0))
		<id> :se_setprops Pos = {relative <new_relative_pos>}
		<id> :se_setprops Pos = {relative (-1 * <new_relative_pos>)} time = 0.2
	endif
endscript

script music_store_rotate_sort 
	RequireParams \{[
			state_list
			list
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	gh_music_store :GetSingleTag \{sort_index}
	sort_index = (<sort_index> + 1)
	GetArraySize <state_list>
	if (<sort_index> >= <array_Size>)
		sort_index = 0
	endif
	gh_music_store :SetTags sort_index = <sort_index>
	music_store_clear_sort_info_menu
	music_store_add_all_sort_items state_list = <state_list>
	music_store_get_sort_key state_list = <state_list>
	music_store_sort_list list = <list> key = <key> previous_history = <previous_history>
endscript

script music_store_sort_list 
	RequireParams \{[
			list
			key
		]}
	sortstorestructarray array = <list> key = <key>
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	music_store_clear_options
	if GotParam \{sorted_array}
		GetArraySize <sorted_array>
		if (<array_Size> > 0)
			i = 0
			begin
			add_music_store_purchase_item {
				text = ((<sorted_array> [<i>]).Name)
				price = ((<sorted_array> [<i>]).price)
				pad_choose_script = music_store_new_arrivals_decide_action
				pad_choose_params = {previous_history = <previous_history> option_struct = (<sorted_array> [<i>]) list = <list>}
				additional_focus_script = music_store_new_arrivals_decide_focus
				additional_focus_params = {option_struct = (<sorted_array> [<i>])}
				additional_unfocus_script = music_store_clear_album_info
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	else
		ScriptAssert \{qs(0xf3a30645)}
	endif
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
	music_store_fade_in_options
endscript

script music_store_get_sort_key 
	RequireParams \{[
			state_list
		]
		all}
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :GetSingleTag \{sort_index}
		GetArraySize <state_list>
		if (<sort_index> >= <array_Size>)
			sort_index = 0
		endif
		if ((<state_list> [<sort_index>]) = alpha)
			return \{key = Name}
		elseif ((<state_list> [<sort_index>]) = difficulty)
			return \{key = difficulty}
		elseif ((<state_list> [<sort_index>]) = date)
			return \{key = date}
		elseif ((<state_list> [<sort_index>]) = artist)
			return \{key = artist}
		elseif ((<state_list> [<sort_index>]) = Type)
			return \{key = Type}
		elseif ((<state_list> [<sort_index>]) = Duration)
			return \{key = Duration}
		elseif ((<state_list> [<sort_index>]) = price)
			return \{key = price}
		else
			ScriptAssert qs(0x3549825d) s = (<state_list> [<sort_index>]) donotresolve
		endif
	else
		ScriptAssert \{qs(0x7985520f)}
	endif
endscript

script music_store_pre_sort_list 
	RequireParams \{[
			list
			state_list
		]}
	if ScreenElementExists \{id = gh_music_store}
		music_store_get_sort_key state_list = <state_list>
		sortstorestructarray array = <list> key = <key>
		list = <sorted_array>
	endif
	return list = <list>
endscript

script music_store_get_sort_names 
	array = []
	GetArraySize <state_list>
	if (<sort_index> < <array_Size>)
		i = <sort_index>
		begin
		music_store_get_sort_state_name sort_state = (<state_list> [<i>])
		AddArrayElement array = <array> element = <Name>
		i = (<i> + 1)
		repeat (<array_Size> - <sort_index>)
	endif
	if (<sort_index> > 0)
		i = 0
		begin
		music_store_get_sort_state_name sort_state = (<state_list> [<i>])
		AddArrayElement array = <array> element = <Name>
		i = (<i> + 1)
		repeat <sort_index>
	endif
	return names = <array>
endscript

script music_store_get_sort_state_name 
	if (<sort_state> = alpha)
		return \{Name = qs(0x25befb85)}
	elseif (<sort_state> = difficulty)
		return \{Name = qs(0xfe2cfc75)}
	elseif (<sort_state> = date)
		return \{Name = qs(0x996fff58)}
	elseif (<sort_state> = artist)
		return \{Name = qs(0xff00fab4)}
	elseif (<sort_state> = Type)
		return \{Name = qs(0x8533d9d2)}
	elseif (<sort_state> = Duration)
		return \{Name = qs(0x080c48bc)}
	elseif (<sort_state> = price)
		return \{Name = qs(0x943c433d)}
	else
		ScriptAssert qs(0xbf0b5c0b) s = <sort_state> donotresolve
	endif
endscript

script music_store_reset_sort_index 
	if ScreenElementExists \{id = gh_music_store}
		gh_music_store :SetTags \{sort_index = 0}
	endif
endscript

script music_store_add_all_sort_items 
	RequireParams \{[
			state_list
		]
		all}
	gh_music_store :GetSingleTag \{sort_index}
	music_store_get_sort_names state_list = <state_list> sort_index = <sort_index>
	if NOT GotParam \{names}
		ScriptAssert \{qs(0x446121f9)}
	endif
	GetArraySize <names>
	if (<array_Size> > 0)
		music_store_add_sort_info_item \{text = qs(0xa3a9dad6)
			focused}
		music_store_add_sort_info_item \{text = qs(0xc4992bba)
			focused}
		music_store_add_sort_info_item text = (<names> [0]) focused
	endif
	if (<array_Size> > 1)
		i = 1
		begin
		music_store_add_sort_info_item text = (<names> [<i>])
		i = (<i> + 1)
		repeat (<array_Size> -1)
	endif
endscript

script music_store_filter_list 
	RequireParams \{[
			filter
			value
			list
		]
		all}
	array = []
	GetArraySize <list>
	if (<array_Size> > 0)
		i = 0
		begin
		if StructureContains structure = (<list> [<i>]) <filter>
			if GotParam \{less_than}
				if (((<list> [<i>]).<filter>) < <value>)
					AddArrayElement array = <array> element = (<list> [<i>])
				endif
			elseif GotParam \{greater_than}
				if (((<list> [<i>]).<filter>) > <value>)
					AddArrayElement array = <array> element = (<list> [<i>])
				endif
			elseif GotParam \{less_than_equal}
				if (((<list> [<i>]).<filter>) <= <value>)
					AddArrayElement array = <array> element = (<list> [<i>])
				endif
			elseif GotParam \{greater_than_equal}
				if (((<list> [<i>]).<filter>) >= <value>)
					AddArrayElement array = <array> element = (<list> [<i>])
				endif
			else
				if (((<list> [<i>]).<filter>) = <value>)
					AddArrayElement array = <array> element = (<list> [<i>])
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return filtered_list = <array>
endscript

script music_store_generate_date 
	RequireParams \{[
			year
			month
			day
		]
		all}
	date = 0
	date = (<date> + (<year> * 512))
	date = (<date> + (<month> * 32))
	date = (<date> + <day>)
	return date = <date>
endscript

script music_store_determine_currency 
	if isps3
		getterritory
		if (<territory> = territory_us)
			money_icon = dollar_sign
		else
			money_icon = euro_sign
		endif
	else
		money_icon = xbl_symbol
	endif
	return money_icon = <money_icon>
endscript

script music_store_get_duration_string 
	RequireParams \{[
			Duration
		]
		all}
	original_duration = <Duration>
	CastToInteger \{Duration}
	minutes = (<Duration> / 60)
	Seconds = (<original_duration> - (<minutes> * 60))
	formatText TextName = duration_string qs(0xc2560af5) m = <minutes> s = <Seconds>
	printstruct <...>
	return string = <duration_string>
endscript

script music_store_song_focus 
	if GotParam \{alt_focus}
		music_store_set_song_info_items_alt option_struct = <option_struct>
	else
		music_store_set_song_info_items option_struct = <option_struct>
	endif
endscript

script music_store_song_unfocus 
	music_store_clear_album_info
endscript

script music_store_pack_focus 
	music_store_set_pack_info_items option_struct = <option_struct>
endscript

script music_store_pack_unfocus 
	music_store_clear_album_info
endscript

script music_store_album_focus 
	music_store_set_album_info_items option_struct = <option_struct>
endscript

script music_store_album_unfocus 
	music_store_clear_album_info
endscript

script music_store_set_song_info_items 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	RequireParams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.artist)
	if StructureContains structure = <option_struct> album
		music_store_add_album_info_item text = (<option_struct>.album)
	endif
	music_store_get_duration_string Duration = (<option_struct>.Duration)
	music_store_add_album_info_item text = <string>
endscript

script music_store_set_song_info_items_alt 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	RequireParams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.Name)
	music_store_add_album_info_item text = (<option_struct>.artist)
	if StructureContains structure = <option_struct> album
		music_store_add_album_info_item text = (<option_struct>.album)
	endif
endscript

script music_store_set_pack_info_items 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	RequireParams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.Name)
endscript

script music_store_set_album_info_items 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	RequireParams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.artist)
	music_store_add_album_info_item text = (<option_struct>.Name)
endscript

script music_store_preview_list 
	RequireParams \{[
			list
		]
		all}
	begin
	GetArraySize <list>
	i = 0
	begin
	if (((<list> [<i>]).Type) = song)
		music_store_song_focus option_struct = (<list> [<i>]) alt_focus
	elseif (((<list> [<i>]).Type) = album)
		music_store_album_focus option_struct = (<list> [<i>])
	elseif (((<list> [<i>]).Type) = pack)
		music_store_pack_focus option_struct = (<list> [<i>])
	else
		ScriptAssert = qs(0x48869381) i = ((<list> [<i>]).Name) t = ((<list> [<i>]).Type) donotresolve
	endif
	Wait \{1.5
		Seconds}
	i = (<i> + 1)
	repeat <array_Size>
	repeat
endscript

script music_store_end_preview_list 
	if ScriptIsRunning \{music_store_preview_list}
		KillSpawnedScript \{Name = music_store_preview_list}
	endif
	music_store_clear_album_info
endscript
test_dlc_list = [
	{
		Name = qs(0x7b025f8c)
		artist = qs(0xf7415580)
		difficulty = 5
		date = 402410
		Type = song
		Duration = 500
		price = 200
		album = qs(0x0be0053c)
	}
	{
		Name = qs(0x502f0c4f)
		artist = qs(0xf7415580)
		difficulty = 2
		date = 402410
		Type = song
		Duration = 200
		price = 200
		album = qs(0x0be0053c)
	}
	{
		Name = qs(0xf078b275)
		artist = qs(0x60d19940)
		difficulty = 1
		date = 402412
		Type = song
		Duration = 150
		price = 200
		album = qs(0x47ad91a3)
	}
	{
		Name = qs(0x0675abc9)
		artist = qs(0xa8b3b076)
		difficulty = 4
		date = 403084
		Type = song
		Duration = 400
		price = 150
		album = qs(0xce14d961)
	}
	{
		Name = qs(0xfe926865)
		artist = qs(0x4e503de3)
		difficulty = 0
		date = 403084
		Type = pack
		Duration = 0
		price = 500
	}
	{
		Name = qs(0xd5bf3ba6)
		artist = qs(0xa8b3b076)
		difficulty = 0
		date = 403085
		Type = pack
		Duration = 0
		price = 500
	}
	{
		Name = qs(0x22903705)
		artist = qs(0xa8b3b076)
		difficulty = 0
		date = 403084
		Type = album
		Duration = 0
		price = 1000
	}
	{
		Name = qs(0x09bd64c6)
		artist = qs(0xf7415580)
		difficulty = 0
		date = 403084
		Type = album
		Duration = 0
		price = 900
	}
]

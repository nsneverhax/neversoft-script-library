music_store_visited = 0

script create_music_store_menu \{pad_back_script = generic_event_back}
	if screenelementexists \{id = gh_music_store}
		return
	endif
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	update_ingame_controllers controller = <exclusive_device>
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	music_store_determine_currency
	createscreenelement {
		id = gh_music_store
		parent = root_window
		type = descinterface
		desc = 'gh_music_store'
		exclusive_device = <exclusive_device>
		credits_availible_currency_texture = <money_icon>
		credits_availible_text_text = <credits_text>
	}
	if gh_music_store :desc_resolvealias \{name = alias_options_list_vmenu
			param = gh_music_store_menu}
		assignalias id = <gh_music_store_menu> alias = current_menu
		<gh_music_store_menu> :settags {total_length = 0}
	else
		scriptassert \{qs(0x2784bcef)}
	endif
	if gh_music_store :desc_resolvealias \{name = alias_menu_history_hmenu
			param = gh_music_store_history_menu}
		createscreenelement {
			parent = <gh_music_store_history_menu>
			type = textblockelement
			text = qs(0x64a75b5f)
			font = fontgrid_text_a3
			dims = (0.0, 26.0)
			fit_height = `scale down if larger`
			fit_width = `expand dims`
			rgba = [0 0 0 255]
			internal_just = [left , top]
			z_priority = 50
		}
		main_id = <id>
		getscreenelementdims id = <main_id>
		createscreenelement {
			parent = <gh_music_store_history_menu>
			type = windowelement
			dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
		}
		setscreenelementprops id = <main_id> parent = <id> pos = (0.0, 0.0) just = [left , top]
		spawnscriptnow music_store_animate_main_history params = {id = <main_id>}
	else
		scriptassert \{qs(0xf9593720)}
	endif
	add_generic_menu_up_down_sound_handlers
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
	if gotparam \{pad_option2_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_option2 ui_menu_select_sfx}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
			]
			replace_handlers
		}
	endif
	gh_music_store :settags \{sort_index = 0}
	change \{music_store_visited = 1}
endscript

script add_music_store_item \{parent = current_menu}
	if gotparam \{text}
		stringlength string = <text>
		if (<str_len> >= 25)
			stringncopy string = <text> length = 24
			text = (<new_string> + qs(0x3871eb3b))
		endif
	endif
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'gh_music_store_item'
		options_list_item_text_text = <text>
		autosizedims = true
	}
	if gotparam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{replace_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_replace data = {state = <replace_state> <replace_state_data> container_id = <id>}}
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus music_store_item_focus params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus music_store_item_unfocus params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if gotparam \{pad_choose_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose music_store_item_select_anim params = {id = <id>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
			]
		}
	endif
	<parent> :getsingletag total_length
	if gotparam \{total_length}
		total_length = (<total_length> + 40)
		<parent> :settags {total_length = <total_length>}
		if (<total_length> > 310)
			music_store_turn_on_arrows
		endif
	endif
endscript

script add_music_store_purchase_item \{parent = current_menu}
	if gotparam \{text}
		stringlength string = <text>
		if (<str_len> >= 25)
			stringncopy string = <text> length = 24
			text = (<new_string> + qs(0x3871eb3b))
		endif
	endif
	music_store_determine_currency
	if gotparam \{price}
		formattext textname = price_text qs(0x581d2af2) p = <price>
	endif
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'gh_music_store_purchase_item'
		options_list_item_money_texture = <money_icon>
		options_list_item_price_text = <price_text>
		options_list_item_text_text = <text>
		autosizedims = true
	}
	if gotparam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{replace_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_replace data = {state = <replace_state> <replace_state_data> container_id = <id>}}
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus music_store_item_focus params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus music_store_item_unfocus params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if gotparam \{pad_choose_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose music_store_item_select_anim params = {id = <id>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
			]
		}
	endif
	<parent> :getsingletag total_length
	if gotparam \{total_length}
		total_length = (<total_length> + 40)
		<parent> :settags {total_length = <total_length>}
		if (<total_length> > 310)
			music_store_turn_on_arrows
		endif
	endif
endscript

script add_music_store_purchase_dialogue \{parent = current_menu}
	music_store_determine_currency
	if gotparam \{price}
		formattext textname = price_text qs(0x581d2af2) p = <price>
	endif
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'gh_music_store_purchase_dialogue'
		options_list_item_text_text = <text>
		options_list_purchase_item_options_list_item_money_texture = <money_icon>
		options_list_purchase_item_options_list_item_price_text = <price_text>
		autosizedims = true
		not_focusable
	}
	<parent> :getsingletag total_length
	if gotparam \{total_length}
		total_length = (<total_length> + 40)
		<parent> :settags {total_length = <total_length>}
		if (<total_length> > 310)
			music_store_turn_on_arrows
		endif
	endif
endscript

script destroy_music_store 
	if screenelementexists \{id = gh_music_store}
		destroyscreenelement \{id = gh_music_store}
	endif
endscript

script destroy_music_store_menus 
	music_store_clear_options
	music_store_clear_sort_info
	music_store_clear_history
	if NOT gotparam \{preserve_album_info}
		music_store_clear_album_info
	endif
	music_store_turn_off_arrows
	clean_up_user_control_helpers
endscript

script music_store_clear_options 
	if screenelementexists \{id = current_menu}
		destroyscreenelement \{id = current_menu
			preserve_parent}
		current_menu :settags \{total_length = 0}
	endif
endscript

script music_store_turn_on_arrows 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{arrows_alpha = 0.5}
	endif
endscript

script music_store_turn_off_arrows 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{arrows_alpha = 0.0}
	endif
endscript

script music_store_add_history_item 
	requireparams \{[
			text
		]
		all}
	if gotparam \{text}
		stringlength string = <text>
		if (<str_len> >= 25)
			stringncopy string = <text> length = 24
			text = (<new_string> + qs(0x3871eb3b))
		endif
	endif
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_menu_history_hmenu
				param = gh_music_store_history_menu}
			createscreenelement {
				parent = <gh_music_store_history_menu>
				type = textblockelement
				text = qs(0xa5766a28)
				font = fontgrid_text_a3
				dims = (15.0, 26.0)
				fit_height = `scale down if larger`
				fit_width = `expand dims`
				rgba = [0 0 0 255]
				internal_just = [left , top]
				just = [left , center]
				pos_anchor = [left , center]
				z_priority = 50
			}
			createscreenelement {
				parent = <gh_music_store_history_menu>
				type = textblockelement
				pos = (0.0, 0.0)
				text = <text>
				font = fontgrid_text_a3
				dims = (0.0, 26.0)
				fit_height = `scale down if larger`
				fit_width = `expand dims`
				rgba = [0 0 0 255]
				internal_just = [left , top]
				just = [left , center]
				pos_anchor = [left , center]
				z_priority = 50
			}
			if gotparam \{animate_in}
				hist_id = <id>
				getscreenelementdims id = <hist_id>
				dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				createscreenelement {
					pos = (0.0, 0.0)
					parent = <gh_music_store_history_menu>
					type = windowelement
					dims = (0.0, 26.0)
					just = [left , center]
					pos_anchor = [left , center]
				}
				setscreenelementprops id = <hist_id> parent = <id> pos = (0.0, 0.0) just = [left , center] pos_anchor = [left , center]
				setscreenelementprops id = <id> dims = <dims>
				spawnscriptnow music_store_animate_new_history params = {id = <hist_id> width = <width>}
			endif
		else
			scriptassert \{qs(0x41fde101)}
		endif
	endif
endscript

script music_store_clear_history 
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_menu_history_hmenu
				param = gh_music_store_history_menu}
			destroyscreenelement id = <gh_music_store_history_menu> preserve_parent
			createscreenelement {
				parent = <gh_music_store_history_menu>
				type = textblockelement
				text = qs(0x64a75b5f)
				font = fontgrid_text_a3
				dims = (0.0, 26.0)
				fit_height = `scale down if larger`
				fit_width = `expand dims`
				rgba = [0 0 0 255]
				internal_just = [left , top]
				z_priority = 50
			}
		else
			scriptassert \{qs(0xb3db4f72)}
		endif
	endif
endscript

script music_store_add_album_info_item 
	requireparams \{[
			text
		]
		all}
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_title_info_menu
				param = gh_music_store_album_info_menu}
			createscreenelement {
				parent = <gh_music_store_album_info_menu>
				type = textblockelement
				text = <text>
				font = fontgrid_text_a3
				dims = (390.0, 28.0)
				fit_height = `scale down if larger`
				fit_width = `expand dims`
				rgba = [220 122 5 200]
				internal_just = [center , center]
				z_priority = 50
			}
			item_id = <id>
			getscreenelementdims id = <item_id>
			if (<width> > 390)
				dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				createscreenelement {
					parent = <gh_music_store_album_info_menu>
					type = containerelement
					dims = (390.0, 28.0)
					just = [left , center]
				}
				createscreenelement {
					parent = <id>
					type = containerelement
					dims = (390.0, 28.0)
					just = [left , top]
				}
				ticker_id = <id>
				text = (qs(0xdea80396) + <text>)
				setscreenelementprops id = <item_id> parent = <ticker_id> pos_anchor = [left , center] just = [left , center] pos = (0.0, 0.0) internal_just = [left , center] text = <text>
				getscreenelementdims id = <item_id>
				new_dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				createscreenelement {
					parent = <ticker_id>
					type = textblockelement
					text = <text>
					font = fontgrid_text_a3
					dims = <new_dims>
					fit_height = `scale down if larger`
					fit_width = `expand dims`
					rgba = [220 122 5 200]
					internal_just = [center , center]
					z_priority = 50
					just = [left , center]
					pos_anchor = [left , center]
					internal_just = [left , center]
					pos = (<width> * (1.0, 0.0))
				}
				spawnscriptnow music_store_scroll_album_info params = {id = <ticker_id> width = <width>}
			endif
		else
			scriptassert \{qs(0x7593769d)}
		endif
	endif
endscript

script music_store_scroll_album_info 
	requireparams \{[
			id
			width
		]
		all}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	time = (<width> * 0.01)
	begin
	if screenelementexists id = <id>
		new_pos = (<width> * (-1.0, 0.0))
		<id> :se_setprops pos = {relative <new_pos>} time = <time>
	endif
	wait <time> seconds
	if screenelementexists id = <id>
		<id> :se_setprops pos = (0.0, 0.0)
	endif
	repeat
endscript

script music_store_clear_album_info 
	if scriptisrunning \{music_store_scroll_album_info}
		killspawnedscript \{name = music_store_scroll_album_info}
	endif
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_title_info_menu
				param = gh_music_store_album_info_menu}
			destroyscreenelement id = <gh_music_store_album_info_menu> preserve_parent
		else
			scriptassert \{qs(0x43ff3582)}
		endif
	endif
endscript

script music_store_add_sort_info_item 
	requireparams \{[
			text
		]
		all}
	if NOT gotparam \{focused}
		alpha = 0.5
	endif
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_sort_info_hmenu
				param = gh_music_store_sort_info_menu}
			createscreenelement {
				parent = <gh_music_store_sort_info_menu>
				type = textblockelement
				text = <text>
				font = fontgrid_text_a3
				dims = (0.0, 32.0)
				fit_height = `scale down if larger`
				fit_width = `expand dims`
				rgba = [220 122 5 200]
				internal_just = [left , center]
				z_priority = 50
				alpha = <alpha>
			}
		else
			scriptassert \{qs(0xa02af5ca)}
		endif
	endif
endscript

script music_store_add_sort_info 
	requireparams \{[
			state_list
		]
		all}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	music_store_clear_sort_info
	if screenelementexists \{id = current_menu}
		setscreenelementprops {
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
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_sort_info_hmenu
				param = gh_music_store_sort_info_menu}
			<gh_music_store_sort_info_menu> :se_setprops alpha = 0.0
			music_store_add_all_sort_items state_list = <state_list>
			<gh_music_store_sort_info_menu> :se_setprops alpha = 1.0 time = 0.2
		endif
	endif
endscript

script music_store_clear_sort_info 
	if screenelementexists \{id = current_menu}
		setscreenelementprops \{id = current_menu
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
	if screenelementexists \{id = gh_music_store}
		if gh_music_store :desc_resolvealias \{name = alias_sort_info_hmenu
				param = gh_music_store_sort_info_menu}
			destroyscreenelement id = <gh_music_store_sort_info_menu> preserve_parent
		else
			scriptassert \{qs(0x202243aa)}
		endif
	endif
endscript

script music_store_motd_callback 
	if gotparam \{motd_text}
		change \{retrieved_message_of_the_day = 1}
		change message_of_the_day = <motd_text>
	endif
	if gotparam \{success}
		if (<success> = success)
			if globalexists \{name = motd_subject}
				music_store_set_motd text = ($motd_subject)
				return
			endif
		endif
	endif
	music_store_set_motd \{text = qs(0x2464e74b)}
endscript

script music_store_set_motd 
	requireparams \{[
			text
		]
		all}
	if screenelementexists \{id = gh_music_store}
		if (($music_store_visited) = 0)
			rgba = [224 224 224 255]
		else
			rgba = [220 122 5 200]
		endif
		createscreenelement {
			id = temp_motd_block
			parent = root_window
			type = textblockelement
			fit_width = qs(0xd607fd45)
			fit_height = qs(0xc79d7639)
			text = <text>
			dims = (1025.0, 2000.0)
			just = [left , top]
			alpha = 0.0
			font = fontgrid_text_a3
			internal_just = [left , top]
		}
		getscreenelementchildren \{id = temp_motd_block}
		if gotparam \{children}
			getarraysize <children>
			if (<array_size> > 0)
				if gh_music_store :desc_resolvealias \{name = alias_motd_text_1
						param = gh_music_store_motd_1}
					if gh_music_store :desc_resolvealias \{name = alias_motd_text_2
							param = gh_music_store_motd_2}
						text_params = {
							type = textblockelement
							dims = (0.0, 32.0)
							just = [0.0 , 0.0]
							pos_anchor = [-1.0 , -1.0]
							z_priority = 6
							font = fontgrid_text_a3
							fit_width = `expand dims`
							fit_height = `scale down if larger`
							internal_just = [-1.0 , -1.0]
							rgba = <rgba>
						}
						i = 0
						begin
						if music_store_get_screen_element_text id = (<children> [<i>])
							createscreenelement {
								parent = <gh_music_store_motd_1>
								<text_params>
								text = (<text> + qs(0x713755f7))
							}
							createscreenelement {
								parent = <gh_music_store_motd_2>
								<text_params>
								text = (<text> + qs(0x713755f7))
							}
						endif
						i = (<i> + 1)
						repeat <array_size>
						createscreenelement {
							parent = <gh_music_store_motd_1>
							<text_params>
							text = qs(0xa0ee0db2)
						}
						createscreenelement {
							parent = <gh_music_store_motd_2>
							<text_params>
							text = qs(0xa0ee0db2)
						}
						getscreenelementdims id = <gh_music_store_motd_1>
						if (<width> > 1025)
							new_pos = (<width> * (1.0, 0.0))
							gh_music_store :se_setprops motd_text_2_pos = {relative <new_pos>}
							spawnscriptnow music_store_scroll_motd params = {width = <width>}
						else
							gh_music_store :se_setprops \{motd_text_1_internal_just = [
									center
									center
								]
								motd_text_2_alpha = 0.0}
						endif
					else
						scriptassert \{qs(0x8ee895f0)}
					endif
				else
					scriptassert \{qs(0xf289b02b)}
				endif
			endif
		endif
		if screenelementexists \{id = temp_motd_block}
			destroyscreenelement \{id = temp_motd_block}
		endif
	endif
endscript

script music_store_get_screen_element_text 
	requireparams \{[
			id
		]
		all}
	if screenelementexists id = <id>
		getscreenelementprops id = <id>
		return true text = <text>
	else
		return \{false}
	endif
endscript

script music_store_turn_on_preview_bar 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{preview_bar_alpha = 1.0}
	endif
endscript

script music_store_turn_off_preview_bar 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{preview_bar_alpha = 0.0}
	endif
endscript

script music_store_turn_set_preview_bar 
	requireparams \{[
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
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops preview_bar_fill_scale = <progress_scale>
	endif
endscript

script music_store_turn_on_loading 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{loading_alpha = 1.0}
		spawnscriptnow \{music_store_animate_loading}
	endif
endscript

script music_store_turn_off_loading 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{loading_alpha = 0.0}
		if scriptisrunning \{music_store_animate_loading}
			killspawnedscript \{name = music_store_animate_loading}
		endif
	endif
endscript

script music_store_animate_loading 
	begin
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{loading_rot_angle = 0}
		gh_music_store :se_setprops \{loading_rot_angle = 360
			time = 1.5}
	endif
	wait \{2
		seconds}
	repeat
endscript

script music_store_turn_on_current_credits 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{credits_availible_alpha = 1.0}
	endif
endscript

script music_store_turn_off_current_credits 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{credits_availible_alpha = 0.0}
	endif
endscript

script music_store_item_focus 
	if screenelementexists id = <id>
		<id> :se_setprops options_list_item_point_alpha = 1.0
		<id> :se_setprops options_list_item_alpha = 1.0
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script music_store_item_unfocus 
	if screenelementexists id = <id>
		<id> :se_setprops options_list_item_point_alpha = 0.0
		<id> :se_setprops options_list_item_alpha = 0.6
	endif
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script music_store_item_select_anim 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{generic_menu_block_input = 1}
	getscreenelementchildren id = <id>
	getarraysize <children>
	if (<array_size> > 0)
		menu_item_id = (<children> [0])
	endif
	getscreenelementposition id = <menu_item_id>
	newscreenlementpos = (<screenelementpos> + (20.0, 0.0))
	if screenelementexists id = <menu_item_id>
		setscreenelementprops {id = <menu_item_id> pos = <newscreenlementpos> time = 0.1}
	else
		change \{generic_menu_block_input = 0}
		return
	endif
	wait \{0.1
		seconds}
	if screenelementexists id = <menu_item_id>
		setscreenelementprops {id = <menu_item_id> pos = <screenelementpos> time = 0.1}
	else
		change \{generic_menu_block_input = 0}
		return
	endif
	wait \{0.11
		seconds}
	change \{generic_menu_block_input = 0}
endscript

script music_store_wipe_in_options 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{generic_menu_block_input = 1}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{options_list_smenu_alpha = 0.0}
		gh_music_store :se_setprops \{options_list_patch_scale = (0.0, 0.95)}
		gh_music_store :se_setprops \{options_list_patch_scale = (0.9, 0.95)
			time = 0.2
			anim = gentle}
	endif
	wait \{0.25
		seconds}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{options_list_smenu_alpha = 1.0}
	endif
	if screenelementexists \{id = current_menu}
		getscreenelementchildren \{id = current_menu}
		getarraysize <children>
		if (<array_size> > 8)
			array_size = 8
		endif
		if (<array_size> > 0)
			if (<array_size> > 1)
				i = 1
				begin
				if screenelementexists id = (<children> [<i>])
					setscreenelementprops {id = (<children> [<i>]) alpha = 0.0}
				endif
				i = (<i> + 1)
				repeat (<array_size> -1)
			endif
			if screenelementexists id = (<children> [0])
				setscreenelementprops {
					id = (<children> [0])
					options_list_item_pos = {relative (-550.0, 0.0)}
				}
				setscreenelementprops {
					id = (<children> [0])
					options_list_item_pos = {relative (550.0, 0.0)}
					time = 0.1
				}
				wait \{0.1
					seconds}
			endif
			if (<array_size> > 1)
				i = 1
				begin
				if screenelementexists id = (<children> [<i>])
					setscreenelementprops {id = (<children> [<i>]) alpha = 1.0 time = 0.1}
					wait \{0.1
						seconds}
				endif
				i = (<i> + 1)
				repeat (<array_size> -1)
			endif
		endif
	endif
	change \{generic_menu_block_input = 0}
endscript

script music_store_wipe_in_album_info 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{title_info_menu_alpha = 0.0}
		gh_music_store :se_setprops \{title_info_bg_scale = (0.0, 0.9)}
		gh_music_store :se_setprops \{title_info_bg_scale = (1.0, 0.9)
			time = 0.2
			anim = gentle}
	endif
	wait \{0.25
		seconds}
	music_store_fade_in_album_info
endscript

script music_store_fade_in_album_info 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{title_info_menu_alpha = 1.0
			time = 0.15
			anim = gentle}
	endif
endscript

script music_store_fade_out_album_info 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{title_info_menu_alpha = 0.0
			time = 0.1
			anim = gentle}
	endif
endscript

script music_store_scroll_motd 
	requireparams \{[
			width
		]
		all}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	time = (<width> * 0.003)
	begin
	if screenelementexists \{id = gh_music_store}
		new_pos = (<width> * (-1.0, 0.0))
		gh_music_store :se_setprops motd_text_pos = {relative <new_pos>} time = <time>
	endif
	wait <time> seconds
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{motd_text_pos = (0.0, 0.0)}
	endif
	repeat
endscript

script music_store_set_previous_history 
	requireparams \{[
			previous_history
			new_entry
		]
		all}
	getarraysize <previous_history>
	if (<array_size> > 0)
		i = 0
		begin
		music_store_add_history_item text = (<previous_history> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam \{do_not_animate}
		music_store_add_history_item text = <new_entry>
	else
		music_store_add_history_item text = <new_entry> animate_in
	endif
	addarrayelement array = <previous_history> element = <new_entry>
	return previous_history = <array>
endscript

script music_store_change_album_cover 
	requireparams \{[
			texture
		]
		all}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops large_album_cover_bg_texture = <texture>
	endif
	spawnscriptnow music_store_change_album_cover_anim params = {texture = <texture>}
endscript

script music_store_change_album_cover_anim 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	requireparams \{[
			texture
		]
		all}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops new_album_cover_image_z_priority = 30 current_album_cover_image_z_priority = 100 new_album_cover_image_texture = <texture>
		gh_music_store :se_setprops \{new_album_cover_pos = (-100.0, 0.0)
			current_album_cover_pos = (100.0, 0.0)
			time = 0.2
			anim = gentle}
	endif
	wait \{0.25
		seconds}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops \{new_album_cover_image_z_priority = 100
			current_album_cover_image_z_priority = 30}
		gh_music_store :se_setprops \{new_album_cover_pos = (0.0, 0.0)
			current_album_cover_pos = (0.0, 0.0)
			time = 0.2
			anim = gentle}
	endif
	wait \{0.25
		seconds}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :se_setprops new_album_cover_image_z_priority = 30 current_album_cover_image_z_priority = 100 current_album_cover_image_texture = <texture>
	endif
endscript

script music_store_fade_in_options 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{generic_menu_block_input = 1}
	if screenelementexists \{id = current_menu}
		getscreenelementchildren \{id = current_menu}
		getarraysize <children>
		if (<array_size> > 1)
			if (<array_size> > 7)
				array_size = 7
			endif
			i = 1
			begin
			if screenelementexists id = (<children> [<i>])
				setscreenelementprops {id = (<children> [<i>]) alpha = 0.0}
			endif
			i = (<i> + 1)
			repeat (<array_size> -1)
			i = 1
			begin
			if screenelementexists id = (<children> [<i>])
				setscreenelementprops {id = (<children> [<i>]) alpha = 1.0 time = 0.1}
				wait \{0.11
					seconds}
			endif
			i = (<i> + 1)
			repeat (<array_size> -1)
		endif
	else
		return
	endif
	change \{generic_menu_block_input = 0}
endscript

script music_store_animate_main_history 
	if screenelementexists id = <id>
		<id> :se_setprops pos = {relative (0.0, 40.0)}
		<id> :se_setprops pos = {relative (0.0, -40.0)} time = 0.2
	else
		return
	endif
endscript

script music_store_animate_new_history 
	if screenelementexists id = <id>
		getscreenelementposition id = <id>
		new_relative_pos = (<width> * (-1.0, 0.0))
		<id> :se_setprops pos = {relative <new_relative_pos>}
		<id> :se_setprops pos = {relative (-1 * <new_relative_pos>)} time = 0.2
	endif
endscript

script music_store_rotate_sort 
	requireparams \{[
			state_list
			list
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gh_music_store :getsingletag \{sort_index}
	sort_index = (<sort_index> + 1)
	getarraysize <state_list>
	if (<sort_index> >= <array_size>)
		sort_index = 0
	endif
	gh_music_store :settags sort_index = <sort_index>
	music_store_clear_sort_info_menu
	music_store_add_all_sort_items state_list = <state_list>
	music_store_get_sort_key state_list = <state_list>
	music_store_sort_list list = <list> key = <key> previous_history = <previous_history>
endscript

script music_store_sort_list 
	requireparams \{[
			list
			key
		]}
	sortstorestructarray array = <list> key = <key>
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	music_store_clear_options
	if gotparam \{sorted_array}
		getarraysize <sorted_array>
		if (<array_size> > 0)
			i = 0
			begin
			add_music_store_purchase_item {
				text = ((<sorted_array> [<i>]).name)
				price = ((<sorted_array> [<i>]).price)
				pad_choose_script = music_store_new_arrivals_decide_action
				pad_choose_params = {previous_history = <previous_history> option_struct = (<sorted_array> [<i>]) list = <list>}
				additional_focus_script = music_store_new_arrivals_decide_focus
				additional_focus_params = {option_struct = (<sorted_array> [<i>])}
				additional_unfocus_script = music_store_clear_album_info
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	else
		scriptassert \{qs(0xf3a30645)}
	endif
	if screenelementexists \{id = current_menu}
		launchevent \{type = focus
			target = current_menu}
	endif
	music_store_fade_in_options
endscript

script music_store_get_sort_key 
	requireparams \{[
			state_list
		]
		all}
	if screenelementexists \{id = gh_music_store}
		gh_music_store :getsingletag \{sort_index}
		getarraysize <state_list>
		if (<sort_index> >= <array_size>)
			sort_index = 0
		endif
		if ((<state_list> [<sort_index>]) = alpha)
			return \{key = name}
		elseif ((<state_list> [<sort_index>]) = difficulty)
			return \{key = difficulty}
		elseif ((<state_list> [<sort_index>]) = date)
			return \{key = date}
		elseif ((<state_list> [<sort_index>]) = artist)
			return \{key = artist}
		elseif ((<state_list> [<sort_index>]) = type)
			return \{key = type}
		elseif ((<state_list> [<sort_index>]) = duration)
			return \{key = duration}
		elseif ((<state_list> [<sort_index>]) = price)
			return \{key = price}
		else
			scriptassert qs(0x3549825d) s = (<state_list> [<sort_index>]) donotresolve
		endif
	else
		scriptassert \{qs(0x7985520f)}
	endif
endscript

script music_store_pre_sort_list 
	requireparams \{[
			list
			state_list
		]}
	if screenelementexists \{id = gh_music_store}
		music_store_get_sort_key state_list = <state_list>
		sortstorestructarray array = <list> key = <key>
		list = <sorted_array>
	endif
	return list = <list>
endscript

script music_store_get_sort_names 
	array = []
	getarraysize <state_list>
	if (<sort_index> < <array_size>)
		i = <sort_index>
		begin
		music_store_get_sort_state_name sort_state = (<state_list> [<i>])
		addarrayelement array = <array> element = <name>
		i = (<i> + 1)
		repeat (<array_size> - <sort_index>)
	endif
	if (<sort_index> > 0)
		i = 0
		begin
		music_store_get_sort_state_name sort_state = (<state_list> [<i>])
		addarrayelement array = <array> element = <name>
		i = (<i> + 1)
		repeat <sort_index>
	endif
	return names = <array>
endscript

script music_store_get_sort_state_name 
	if (<sort_state> = alpha)
		return \{name = qs(0x25befb85)}
	elseif (<sort_state> = difficulty)
		return \{name = qs(0xfe2cfc75)}
	elseif (<sort_state> = date)
		return \{name = qs(0x996fff58)}
	elseif (<sort_state> = artist)
		return \{name = qs(0xff00fab4)}
	elseif (<sort_state> = type)
		return \{name = qs(0x8533d9d2)}
	elseif (<sort_state> = duration)
		return \{name = qs(0x080c48bc)}
	elseif (<sort_state> = price)
		return \{name = qs(0x943c433d)}
	else
		scriptassert qs(0xbf0b5c0b) s = <sort_state> donotresolve
	endif
endscript

script music_store_reset_sort_index 
	if screenelementexists \{id = gh_music_store}
		gh_music_store :settags \{sort_index = 0}
	endif
endscript

script music_store_add_all_sort_items 
	requireparams \{[
			state_list
		]
		all}
	gh_music_store :getsingletag \{sort_index}
	music_store_get_sort_names state_list = <state_list> sort_index = <sort_index>
	if NOT gotparam \{names}
		scriptassert \{qs(0x446121f9)}
	endif
	getarraysize <names>
	if (<array_size> > 0)
		music_store_add_sort_info_item \{text = qs(0xa3a9dad6)
			focused}
		music_store_add_sort_info_item \{text = qs(0xc4992bba)
			focused}
		music_store_add_sort_info_item text = (<names> [0]) focused
	endif
	if (<array_size> > 1)
		i = 1
		begin
		music_store_add_sort_info_item text = (<names> [<i>])
		i = (<i> + 1)
		repeat (<array_size> -1)
	endif
endscript

script music_store_filter_list 
	requireparams \{[
			filter
			value
			list
		]
		all}
	array = []
	getarraysize <list>
	if (<array_size> > 0)
		i = 0
		begin
		if structurecontains structure = (<list> [<i>]) <filter>
			if gotparam \{less_than}
				if (((<list> [<i>]).<filter>) < <value>)
					addarrayelement array = <array> element = (<list> [<i>])
				endif
			elseif gotparam \{greater_than}
				if (((<list> [<i>]).<filter>) > <value>)
					addarrayelement array = <array> element = (<list> [<i>])
				endif
			elseif gotparam \{less_than_equal}
				if (((<list> [<i>]).<filter>) <= <value>)
					addarrayelement array = <array> element = (<list> [<i>])
				endif
			elseif gotparam \{greater_than_equal}
				if (((<list> [<i>]).<filter>) >= <value>)
					addarrayelement array = <array> element = (<list> [<i>])
				endif
			else
				if (((<list> [<i>]).<filter>) = <value>)
					addarrayelement array = <array> element = (<list> [<i>])
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return filtered_list = <array>
endscript

script music_store_generate_date 
	requireparams \{[
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
	requireparams \{[
			duration
		]
		all}
	original_duration = <duration>
	casttointeger \{duration}
	minutes = (<duration> / 60)
	seconds = (<original_duration> - (<minutes> * 60))
	formattext textname = duration_string qs(0xc2560af5) m = <minutes> s = <seconds>
	printstruct <...>
	return string = <duration_string>
endscript

script music_store_song_focus 
	if gotparam \{alt_focus}
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
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	requireparams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.artist)
	if structurecontains structure = <option_struct> album
		music_store_add_album_info_item text = (<option_struct>.album)
	endif
	music_store_get_duration_string duration = (<option_struct>.duration)
	music_store_add_album_info_item text = <string>
endscript

script music_store_set_song_info_items_alt 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	requireparams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.name)
	music_store_add_album_info_item text = (<option_struct>.artist)
	if structurecontains structure = <option_struct> album
		music_store_add_album_info_item text = (<option_struct>.album)
	endif
endscript

script music_store_set_pack_info_items 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	requireparams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.name)
endscript

script music_store_set_album_info_items 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	requireparams \{[
			option_struct
		]
		all}
	music_store_clear_album_info
	music_store_add_album_info_item text = (<option_struct>.artist)
	music_store_add_album_info_item text = (<option_struct>.name)
endscript

script music_store_preview_list 
	requireparams \{[
			list
		]
		all}
	begin
	getarraysize <list>
	i = 0
	begin
	if (((<list> [<i>]).type) = song)
		music_store_song_focus option_struct = (<list> [<i>]) alt_focus
	elseif (((<list> [<i>]).type) = album)
		music_store_album_focus option_struct = (<list> [<i>])
	elseif (((<list> [<i>]).type) = pack)
		music_store_pack_focus option_struct = (<list> [<i>])
	else
		scriptassert = qs(0x48869381) i = ((<list> [<i>]).name) t = ((<list> [<i>]).type) donotresolve
	endif
	wait \{1.5
		seconds}
	i = (<i> + 1)
	repeat <array_size>
	repeat
endscript

script music_store_end_preview_list 
	if scriptisrunning \{music_store_preview_list}
		killspawnedscript \{name = music_store_preview_list}
	endif
	music_store_clear_album_info
endscript
test_dlc_list = [
	{
		name = qs(0x7b025f8c)
		artist = qs(0xf7415580)
		difficulty = 5
		date = 402410
		type = song
		duration = 500
		price = 200
		album = qs(0x0be0053c)
	}
	{
		name = qs(0x502f0c4f)
		artist = qs(0xf7415580)
		difficulty = 2
		date = 402410
		type = song
		duration = 200
		price = 200
		album = qs(0x0be0053c)
	}
	{
		name = qs(0xf078b275)
		artist = qs(0x60d19940)
		difficulty = 1
		date = 402412
		type = song
		duration = 150
		price = 200
		album = qs(0x47ad91a3)
	}
	{
		name = qs(0x0675abc9)
		artist = qs(0xa8b3b076)
		difficulty = 4
		date = 403084
		type = song
		duration = 400
		price = 150
		album = qs(0xce14d961)
	}
	{
		name = qs(0xfe926865)
		artist = qs(0x4e503de3)
		difficulty = 0
		date = 403084
		type = pack
		duration = 0
		price = 500
	}
	{
		name = qs(0xd5bf3ba6)
		artist = qs(0xa8b3b076)
		difficulty = 0
		date = 403085
		type = pack
		duration = 0
		price = 500
	}
	{
		name = qs(0x22903705)
		artist = qs(0xa8b3b076)
		difficulty = 0
		date = 403084
		type = album
		duration = 0
		price = 1000
	}
	{
		name = qs(0x09bd64c6)
		artist = qs(0xf7415580)
		difficulty = 0
		date = 403084
		type = album
		duration = 0
		price = 900
	}
]

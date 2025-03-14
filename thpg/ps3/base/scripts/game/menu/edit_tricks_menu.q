edit_tricks_menu_1_index = 0
edit_tricks_menu_2_index = 0
special_trick_menu_animate_time = 0.2
special_trick_menu_right_up = (1500.0, -40.0)
special_trick_menu_right_down = (640.0, -40.0)
special_trick_menu_left_down = (90.0, -40.0)
special_trick_menu_left_up = (1500.0, -40.0)
viewing_tricks_not_editing = 0

script edit_tricks_menu_can_edit 
	printf \{"--- edit_tricks_menu_can_edit"}
	tricks_editable = 1
	tricks_viewable = 1
	<tricks_editable> = 0
	return {tricks_editable = <tricks_editable>
		tricks_viewable = <tricks_viewable>
	}
endscript

script create_edit_tricks_menu 
	printf "--- create_edit_tricks_menu"
	hide_current_goal
	if screenelementexists id = edit_tricks_menu_parts_anchor
		destroyscreenelement id = edit_tricks_menu_parts_anchor
	endif
	dialog_box_exit
	if gotparam from_view_tricks
		change viewing_tricks_not_editing = 1
	else
		if gotparam from_remap_tricks
			change viewing_tricks_not_editing = 0
		endif
	endif
	if NOT infrontend
		if NOT gotparam from_view_tricks
			kill_start_key_binding
		endif
	endif
	edit_tricks_menu_can_edit
	<menu_title> = "TRICK CONTROLS"
	if NOT infrontend
		pausemusicandstreams 1
	else
	endif
	if gotparam from_ss_menu
		<menu_back_params> = {callback = edit_tricks_menu_exit from_ss_menu}
	else
		<menu_back_params> = {callback = edit_tricks_menu_exit}
	endif
	GetCurrentSkaterProfileIndex
	GetGameMode
	switch <gamemode>
		case freeskate
		if insplitscreengame
			GetCurrentSkaterProfileIndex
			if (<currentskaterprofileindex> = 1)
				second_player = second_player
			endif
			done_script = create_ss_menu
			done_params = {<second_player>}
		endif
		case singlesession
		done_script = ui_change_state
		done_params = {state = UIstate_freeskate_ready}
		case net
		case netlobby
		done_script = menu_stack_create_latest
		done_params = nullscript
		if isxenon
			if AcceptedGameInvite
				done_script = ui_change_state
				done_params = {state = UIstate_net_invite_ready}
			endif
		endif
		if innetgame
			done_script = ui_change_state
			done_params = {state = UIstate_view_status}
		endif
		case career
		done_script = ui_change_state
		if gman_hasactivegoals
			done_params = {state = uistate_pausemenu}
		else
			done_params = {state = UIstate_view_status}
		endif
		default
		printf "Holy jehosavitz, what in the world is going on"
	endswitch
	make_cas_menu {
		title = <menu_title>
		scrolling = <scrolling>
		pausemenu
		pad_back_script = <done_script>
		pad_back_params = <done_params>
	}
	add_cas_menu_item {
		text = "basic tricks"
		pad_choose_script = create_edit_tricks_menu_basic
		pad_choose_params = {done_params = <done_params>}
	}
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			addparams arcade_goal
		endif
	endif
	if NOT gotparam arcade_goal
		add_cas_menu_item {
			text = "special tricks"
			pad_choose_script = create_edit_tricks_menu_special
			pad_choose_params = {done_params = <done_params>}
		}
	endif
	add_cas_menu_item {
		text = "OTHER ABILITIES"
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = other_tricks}
	}
	if gamemodeequals is_career
		if NOT gotparam arcade_goal
			add_cas_menu_item {
				text = "TUTORIAL VIDEOS"
				pad_choose_script = create_edit_tricks_sub_menu
				pad_choose_params = {type = tutorial_vids}
			}
		endif
	endif
	cas_menu_finish
endscript

script create_edit_tricks_menu_basic done_script = create_edit_tricks_menu done_params = {}
	make_cas_menu {
		title = "basic tricks"
		pausemenu
		pad_back_script = <done_script>
		pad_back_params = <done_params>
	}
	add_cas_menu_item {
		text = "GRAB TRICKS"
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = grab_tricks}
	}
	add_cas_menu_item {
		text = "FLIP TRICKS"
		label_offset = (-20.0, 0.0)
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = flip_tricks}
	}
	add_cas_menu_item {
		text = "INVERT TRICKS"
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = lip_tricks}
	}
	add_cas_menu_item {
		text = "GRIND TRICKS"
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = grind_tricks}
	}
	add_cas_menu_item {
		text = "FLATLAND TRICKS"
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = flatland_tricks}
	}
	cas_menu_finish
endscript

script create_edit_tricks_menu_special done_script = create_edit_tricks_menu done_params = {}
	make_cas_menu {
		title = "special tricks"
		pausemenu
		pad_back_script = <done_script>
		pad_back_params = <done_params>
		highlight_add = (20.0, 0.0)
	}
	add_cas_menu_item {
		text = "REMAP SPECIAL TRICKS"
		label_offset = (30.0, 0.0)
		pad_choose_script = create_edit_tricks_sub_menu
		pad_choose_params = {type = special_tricks}
	}
	if gamemodeequals is_career
		add_cas_menu_item {
			text = "PURCHASE SPECIAL TRICKS"
			pad_choose_script = create_edit_tricks_sub_menu
			pad_choose_params = {type = buy_specials}
		}
	endif
	cas_menu_finish
endscript

script edit_tricks_sub_menu_heading_create 
endscript

script create_edit_tricks_sub_menu 
	printf "--- create_edit_tricks_sub_menu"
	pulse_blur
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	goalmanager_hidepoints
	setscreenelementlock id = root_window off
	<vertical_bar_offset> = (75.0, 17.0)
	<key_combo_highlight_bar_scale> = (3.9, 0.7)
	<key_combo_highlight_bar_pos> = (140.0, -10.0)
	<key_combo_short_highlight_bar_scale> = (1.0, 0.7)
	<key_combo_short_highlight_bar_pos> = (-42.0, -10.0)
	<trick_highlight_bar_scale> = (2.9, 0.7)
	scrolling = {}
	if gotparam key_combo_array
		getarraysize <key_combo_array>
		if (<array_size> > 9)
			scrolling = {scrolling scroll_bar_offset = (0.0, 0.0)}
		endif
	endif
	pad_back_params = {callback = edit_tricks_sub_menu_exit}
	highlight_add = (60.0, 0.0)
	switch <type>
		case grab_tricks
		<title> = "GRAB TRICKS"
		<key_combo_array> = ($edit_tricks_menu_grab_key_combos)
		<trick_type> = grabtrick
		scrolling = {scrolling scroll_bar_offset = (0.0, 0.0)}
		case flip_tricks
		<title> = "FLIP TRICKS"
		<key_combo_array> = ($edit_tricks_menu_flip_key_combos)
		<trick_type> = fliptrick
		scrolling = {scrolling scroll_bar_offset = (0.0, 0.0)}
		case lip_tricks
		<title> = "INVERT TRICKS"
		<key_combo_array> = ($edit_tricks_menu_lip_key_combos)
		<trick_type> = InvertTrick
		case grind_tricks
		create_grind_tricks_menu <...>
		return
		case flatland_tricks
		create_flatland_tricks_menu <...>
		return
		case special_tricks
		<title> = "REMAP SPECIAL TRICKS"
		<vertical_bar_offset> = (30.0, 17.0)
		<trick_type> = special_tricks
		scrolling = {scrolling scroll_bar_offset = (0.0, 0.0)}
		highlight_add = (90.0, 0.0)
		pad_back_params = {callback = edit_tricks_sub_menu_exit from_special}
		case other_tricks
		create_other_tricks_menu <...>
		return
		case tutorial_vids
		create_tutorial_vids_menu <...>
		return
		case buy_specials
		ui_create_buy_specials
		return
	endswitch
	make_cas_menu {
		title = <title>
		menu_id = edit_tricks_sub_menu_anchor
		vmenu_id = edit_tricks_menu_1
		pausemenu
		width = 550
		highlight_add = <highlight_add>
		pad_back_script = generic_menu_pad_back
		pad_back_params = <pad_back_params>
		<scrolling>
		scroll_bar_offset = (4.0, 12.0)
	}
	additional_menu_focus_params = {key_combo_array = <key_combo_array> type = <type>}
	setscreenelementprops {
		id = edit_tricks_menu_1
		event_handlers = [
			{focus edit_tricks_menu_update_items_focus params = <additional_menu_focus_params>}
			{unfocus edit_tricks_menu_update_items_unfocus params = <additional_menu_focus_params>}
		]
		replace_handlers
	}
	edit_tricks_menu_can_edit
	if (<tricks_editable> = 0)
		<helper_text> = $generic_helper_text_no_accept
	else
		<helper_text> = $generic_helper_text
	endif
	createscreenelement {
		type = containerelement
		parent = edit_tricks_sub_menu_anchor
		id = edit_tricks_menu_parts_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 840.0)
	}
	if infrontend
		<root_pos> = (40.0, 10.0)
	else
		<root_pos> = (40.0, 20.0)
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = edit_tricks_sub_menu_title
		pos = (<root_pos> + (80.0, 70.0))
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = edit_tricks_menu_vertical_bar
		texture = black
		rgba = [0 0 0 128]
		scale = (2.0, 70.0)
		pos = (0.0, 100.0)
		just = [left top]
		z_priority = 4
	}
	<vertical_bar_id> = <id>
	<vscrolling_menu_id> = <id>
	edit_tricks_sub_menu_heading_create trick_type = <trick_type>
	if (<trick_type> = special_tricks)
		create_special_tricks_menu
		return
	endif
	<rgba> = ($cas_color_scheme.text_color)
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<rgba> = $goal_arcade_text_unfocus
		endif
	endif
	if gotparam key_combo_array
		getarraysize <key_combo_array>
		<index> = 0
		begin
		key_combo = (<key_combo_array> [<index>])
		GetTrickTextFromKeyCombo key_combo = <key_combo> trick_array = $ButtonCombos
		if (<tricks_editable> = 0)
			<pad_choose_script> = nullscript
		else
			<pad_choose_script> = edit_tricks_menu_goto_trick_list
		endif
		if (<type> = lip_tricks)
			formattext textname = key_text "%a + %b" a = <key_text> b = "\\bh"
		endif
		add_cas_menu_item {
			text = <key_text>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = {key_combo = <key_combo> index = <index>}
			additional_focus_script = edit_tricks_sub_menu_item_focus
			additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
			additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
			additional_unfocus_params = {color = ($cas_color_scheme.text_color)}
			just = [right center]
		}
		setscreenelementprops {
			id = {<item_container_id> child = text}
			pos = (-15.0, 0.0)
		}
		createscreenelement {
			type = textelement
			parent = <item_container_id>
			id = <key_combo>
			local_id = trick_string
			font = text_a1
			text = ""
			scale = (0.4, 0.45000002)
			pos = (0.0, 0.0)
			just = [left center]
			rgba = <rgba>
			z_priority = 30
		}
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT (<type> = lip_tricks)
			begin
			key_combo = (<key_combo_array> [(<index> - <array_size>)])
			GetTrickTextFromKeyCombo key_combo = <key_combo> trick_array = $ButtonCombos
			if (<tricks_editable> = 0)
				<pad_choose_script> = nullscript
			else
				<pad_choose_script> = edit_tricks_menu_goto_trick_list
			endif
			if (<type> = flip_tricks)
				<button> = "\\b1"
			elseif (<type> = grab_tricks)
				<button> = "\\b2"
			endif
			formattext textname = key_text "%a%b" a = <key_text> b = <button>
			add_cas_menu_item {
				text = <key_text>
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {key_combo = <key_combo> index = <index>}
				additional_focus_script = edit_tricks_sub_menu_item_focus
				additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
				additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
				additional_unfocus_params = {color = ($cas_color_scheme.text_color)}
				just = [right center]
			}
			setscreenelementprops {
				id = {<item_container_id> child = text}
				pos = (-15.0, 0.0)
			}
			if isps3
				if (<type> = flip_tricks)
					doscreenelementmorph {
						id = {<item_container_id> child = text}
						scale = 0.9
						relative_scale
					}
				endif
			endif
			createscreenelement {
				type = textelement
				parent = <item_container_id>
				id = (<key_combo> + 1)
				local_id = trick_string
				font = text_a1
				text = ""
				scale = (0.4, 0.45000002)
				pos = (0.0, 0.0)
				just = [left center]
				rgba = <rgba>
				z_priority = 30
			}
			<index> = (<index> + 1)
			repeat <array_size>
			if NOT (<type> = grab_tricks)
				begin
				key_combo = (<key_combo_array> [(<index> - (<array_size> * 2))])
				if ((<key_combo> = Air_SquareU) || (<key_combo> = Air_SquareR) || (<key_combo> = Air_SquareD) || (<key_combo> = Air_SquareL))
					GetTrickTextFromKeyCombo key_combo = <key_combo> trick_array = $ButtonCombos
					if (<tricks_editable> = 0)
						<pad_choose_script> = nullscript
					else
						<pad_choose_script> = edit_tricks_menu_goto_trick_list
					endif
					formattext textname = key_text "%a\\b1\\b1" a = <key_text>
					add_cas_menu_item {
						text = <key_text>
						pad_choose_script = <pad_choose_script>
						pad_choose_params = {key_combo = <key_combo> index = <index>}
						additional_focus_script = edit_tricks_sub_menu_item_focus
						additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
						additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
						additional_unfocus_params = {color = ($cas_color_scheme.text_color)}
						just = [right center]
					}
					setscreenelementprops {
						id = {<item_container_id> child = text}
						pos = (-15.0, 0.0)
					}
					if isps3
						doscreenelementmorph {
							id = {<item_container_id> child = text}
							scale = 0.85
							relative_scale
						}
					endif
					createscreenelement {
						type = textelement
						parent = <item_container_id>
						id = (<key_combo> + 2)
						local_id = trick_string
						font = text_a1
						text = ""
						scale = (0.4, 0.45000002)
						pos = (0.0, 0.0)
						just = [left center]
						rgba = <rgba>
						z_priority = 30
					}
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
	endif
	if NOT (<tricks_editable> = 0)
		if gotparam trick_type
			make_cas_menu {
				title = "SELECT REPLACEMENT"
				title_scale = 0.6
				title_pos = (70.0, 90.0)
				title_bg_pos = (65.0, 60.0)
				title_bg_scale = (1.7, 1.0)
				keep_current
				set_anchor_props
				anchorPos = (30.0, -600.0)
				anchor_z = 20
				extra_z = 20
				menu_id = choose_tricks_anchor
				vmenu_id = edit_tricks_menu_2
				desired_width = 340
				scrolling
				no_bg
				no_mask
				pad_back_script = edit_tricks_menu_back_from_trick_list
				no_highlight_bar
				bar_dims = (300.0, 32.0)
			}
			if NOT gotparam scrolling
				change cas_menu_is_scrolling = 0
			endif
			setscreenelementprops {
				id = edit_tricks_menu_2
				event_handlers = [
					{focus edit_tricks_menu_2_focus params = <additional_menu_focus_params>}
					{unfocus edit_tricks_menu_2_unfocus params = <additional_menu_focus_params>}
				]
				replace_handlers
			}
			createscreenelement {
				type = textelement
				id = sub_head_title_choose_tricks
				parent = current_menu_anchor
				text = "TRICKS"
				rgba = ($cas_color_scheme.title_color)
				font = text_a1
				pos = (90.0, 95.0)
				scale = 0.5
			}
			if GetConfigurableTricksFromType type = <trick_type> <special>
				stars
				stars
				getarraysize <configurabletricks>
				<index> = 0
				if (<array_size> > 0)
					begin
					<trick_name> = (<configurabletricks> [<index>])
					if NOT TrickIsLocked trick = <trick_name>
						removeparameter extra_trick_string
						GetTrickDisplayText trick = <trick_name>
						if NOT (<type> = lip_tricks)
							if gotparam extra_trick_string
								formattext textname = trick_display_text "%f / %s" f = <trick_display_text> s = <extra_trick_string>
							endif
						endif
						if (<index> = (<array_size> - 1))
							add_cas_menu_item {
								text = <trick_display_text>
								trick = <trick_name>
								focus_script = edit_tricks_choose_trick_item_focus
								unfocus_script = edit_tricks_choose_trick_item_unfocus
								pad_choose_script = edit_tricks_menu_bind_trick
								pad_choose_params = {new_trick = <trick_name> callback = edit_tricks_menu_back_from_trick_list}
							}
						else
							if (<index> = 0)
								add_cas_menu_item {
									text = <trick_display_text>
									focus_script = edit_tricks_choose_trick_item_focus
									unfocus_script = edit_tricks_choose_trick_item_unfocus
									trick = <trick_name>
									pad_choose_script = edit_tricks_menu_bind_trick
									pad_choose_params = {new_trick = <trick_name> callback = edit_tricks_menu_back_from_trick_list}
								}
							else
								add_cas_menu_item {
									text = <trick_display_text>
									trick = <trick_name>
									focus_script = edit_tricks_choose_trick_item_focus
									unfocus_script = edit_tricks_choose_trick_item_unfocus
									pad_choose_script = edit_tricks_menu_bind_trick
									pad_choose_params = {new_trick = <trick_name> callback = edit_tricks_menu_back_from_trick_list}
								}
							endif
						endif
						<index> = (<index> + 1)
					endif
					repeat <array_size>
				endif
			endif
			doscreenelementmorph id = choose_tricks_anchor alpha = 1 time = 0.2
			setscreenelementlock id = edit_tricks_menu_2 on
			setscreenelementlock id = edit_tricks_menu_2 off
			launchevent type = unfocus target = edit_tricks_menu_2
		endif
	endif
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	assignalias id = edit_tricks_menu_1 alias = current_menu
	cas_menu_finish helper_text = <helper_text>
endscript

script create_grind_tricks_menu 
	make_cas_menu {
		title = "GRIND TRICKS"
		menu_id = edit_tricks_sub_menu_anchor
		vmenu_id = edit_tricks_menu_1
		scrolling
		pausemenu
		width = 850
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = edit_tricks_sub_menu_exit from_view_tricks}
		highlight_add = (250.0, 0.0)
	}
	createscreenelement {
		type = containerelement
		parent = edit_tricks_sub_menu_anchor
		id = edit_tricks_menu_parts_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 840.0)
	}
	if infrontend
		<root_pos> = (40.0, 10.0)
	else
		<root_pos> = (40.0, 20.0)
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = edit_tricks_sub_menu_title
		pos = (<root_pos> + (80.0, 70.0))
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = edit_tricks_menu_vertical_bar
		texture = black
		rgba = [0 0 0 128]
		scale = (2.0, 70.0)
		pos = (0.0, 100.0)
		just = [left top]
		z_priority = 4
	}
	<tricks> = [
		{combo = "PARALLEL TO RAIL" fs = "front side" bs = "back side" is_subheading = 1}
		{combo = "\\b0" fs = "FS 50-50" bs = "BS 50-50"}
		{combo = "\\b7 , \\b7 + \\b0" fs = "FS Noseblunt" bs = "BS Noseblunt"}
		{combo = "\\b4 , \\b4 + \\b0" fs = "FS Blunt" bs = "BS Blunt"}
		{combo = "\\b7 + \\b0" fs = "FS Nosegrind" bs = "BS Nosegrind"}
		{combo = "\\bd + \\b0" fs = "FS Crooked" bs = "BS Overcrook"}
		{combo = "\\b5 + \\b0" fs = "FS Noseslide" bs = "BS Tailslide"}
		{combo = "\\ba + \\b0" fs = "FS Smith" bs = "BS Feeble"}
		{combo = "\\b4 + \\b0" fs = "FS 5-0" bs = "BS 5-0"}
		{combo = "\\bc + \\b0" fs = "FS Feeble" bs = "BS Smith"}
		{combo = "\\b6 + \\b0" fs = "FS Tailslide" bs = "BS Noseslide"}
		{combo = "\\bb + \\b0" fs = "FS Overcrook" bs = "BS Crooked"}
		{combo = "PERPENDICULAR TO RAIL" fs = "front side" bs = "back side" is_subheading = 1}
		{combo = "\\b0" fs = "FS Boardslide" bs = "BS Lipslide"}
		{combo = "\\b7 , \\b7 + \\b0" fs = "FS Noseblunt" bs = "BS Noseblunt"}
		{combo = "\\b4 , \\b4 + \\b0" fs = "FS Blunt" bs = "BS Blunt"}
		{combo = "\\b7 + \\b0" fs = "FS Nosegrind" bs = "BS Nosegrind"}
		{combo = "\\bd + \\b0" fs = "FS Crooked" bs = "BS Overcrook"}
		{combo = "\\b5 + \\b0" fs = "FS Lipslide" bs = "BS Boardslide"}
		{combo = "\\ba + \\b0" fs = "FS Smith" bs = "BS Feeble"}
		{combo = "\\b4 + \\b0" fs = "FS 5-0" bs = "BS 5-0"}
		{combo = "\\bc + \\b0" fs = "FS Feeble" bs = "BS Smith"}
		{combo = "\\b6 + \\b0" fs = "FS Boardslide" bs = "BS Lipslide"}
		{combo = "\\bb + \\b0" fs = "FS Overcrook" bs = "BS Crooked"}
		{combo = "DOUBLE TAPS" fs = "front side" bs = "back side" is_subheading = 1}
		{combo = "\\b7 + \\b0,\\b0" fs = "FS Hang Ten Nosegrind" bs = "BS Hang Ten Nosegrind"}
		{combo = "\\bd + \\b0,\\b0" fs = "FS Five O Overturn" bs = "BS Five O Overturn"}
		{combo = "\\b5 + \\b0,\\b0" fs = "FS Crail Slide" bs = "BS Crail Slide"}
		{combo = "\\ba + \\b0,\\b0" fs = "FS Salad" bs = "BS Salad"}
		{combo = "\\b4 + \\b0,\\b0" fs = "FS Five O Hand Drag" bs = "BS Five O Hand Drag"}
		{combo = "\\bc + \\b0,\\b0" fs = "FS Hurricane" bs = "BS Hurricane"}
		{combo = "\\b6 + \\b0,\\b0" fs = "FS Noseslide Tailgrab" bs = "BS Noseslide Tailgrab"}
		{combo = "\\bb + \\b0,\\b0" fs = "FS One Foot Crook" bs = "BS One Foot Crook"}
		{combo = "GRIND EXTENSIONS" fs = "front side" bs = "back side" is_subheading = 1}
		{combo = "\\b0,\\b0" fs = "FS 50-50" bs = "BS 50-50"}
		{combo = "\\b1,\\b1" fs = "FS Nosegrind" bs = "BS Nosegrind"}
		{combo = "\\b2,\\b2" fs = "FS 5-0" bs = "BS 5-0"}
		{combo = "\\b0,\\b1" fs = "FS Noseslide" bs = "BS Noseslide"}
		{combo = "\\b1,\\b0" fs = "FS Tailslide" bs = "BS Tailslide"}
		{combo = "\\b1,\\b2" fs = "FS Crooked" bs = "BS Crooked"}
		{combo = "\\b2,\\b1" fs = "FS Overcrook" bs = "BS Overcrook"}
		{combo = "\\b0,\\b2" fs = "FS Smith" bs = "BS Smith"}
		{combo = "\\b2,\\b0" fs = "FS Feeble" bs = "BS Smith"}
		{combo = "\\b7 , \\b7 + \\b0" fs = "FS Noseblunt" bs = "BS Noseblunt"}
		{combo = "\\b4 , \\b4 + \\b0" fs = "FS Blunt" bs = "BS Blunt"}
	]
	getarraysize <tricks>
	<index> = 0
	begin
	<trick> = (<tricks> [<index>])
	if structurecontains structure = <trick> is_subheading
		<is_subheading> = (<trick>.is_subheading)
	else
		<is_subheading> = 0
	endif
	if (<is_subheading> = 1)
		<cas_heading> = cas_heading
		<text_color> = ($cas_color_scheme.text_color_2)
		position = {}
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				<text_color> = [200 200 200 255]
			endif
		endif
	else
		removeparameter cas_heading
		<text_color> = ($cas_color_scheme.text_color)
		position = {just = [right center] pos = (-5.0, 0.0)}
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				<text_color> = $goal_arcade_text_unfocus
			endif
		endif
	endif
	add_cas_menu_item {
		text = (<trick>.combo)
		cas_heading = <cas_heading>
		additional_focus_script = edit_tricks_sub_menu_item_focus
		additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
		additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
		additional_unfocus_params = {color = ($cas_color_scheme.text_color)}
		text_width = 130
		<position>
	}
	if gotparam position
		setscreenelementprops {
			id = {<item_container_id> child = text}
			<position>
		}
	endif
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		font = text_a1
		text = (<trick>.fs)
		scale = (0.4, 0.45000002)
		pos = (50.0, 0.0)
		just = [left center]
		rgba = <text_color>
		local_id = column_2
		z_priority = 30
	}
	getscreenelementdims id = <id>
	if (<width> > 125)
		<scale> = ((125.0 / <width>) * (0.4, 0.45000002))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		font = text_a1
		text = (<trick>.bs)
		scale = (0.4, 0.45000002)
		pos = (180.0, 0.0)
		just = [left center]
		rgba = <text_color>
		local_id = column_3
		z_priority = 30
	}
	getscreenelementdims id = <id>
	if (<width> > 125)
		<scale> = ((125.0 / <width>) * (0.4, 0.45000002))
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	assignalias id = edit_tricks_menu_1 alias = current_menu
	cas_menu_finish helper_text = $generic_helper_text_no_accept
endscript

script create_flatland_tricks_menu 
	make_cas_menu {
		title = "FLATLAND TRICKS"
		menu_id = edit_tricks_sub_menu_anchor
		vmenu_id = edit_tricks_menu_1
		pausemenu
		width = 550
		highlight_add = (90.0, 0.0)
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = edit_tricks_sub_menu_exit from_view_tricks}
	}
	createscreenelement {
		type = containerelement
		parent = edit_tricks_sub_menu_anchor
		id = edit_tricks_menu_parts_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 840.0)
	}
	if infrontend
		<root_pos> = (40.0, 10.0)
	else
		<root_pos> = (40.0, 20.0)
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = edit_tricks_sub_menu_title
		pos = (<root_pos> + (80.0, 70.0))
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = edit_tricks_menu_vertical_bar
		texture = black
		rgba = [0 0 0 128]
		scale = (2.0, 70.0)
		pos = (0.0, 100.0)
		just = [left top]
		z_priority = 4
	}
	<tricks> = [
		{combo = "FROM MANUAL (\\b7 , \\b4)" name = "" is_subheading = 1}
		{combo = "\\b1 , \\b1" name = "360 Fingerflip"}
		{combo = "\\b1 , \\b0" name = "Casper"}
		{combo = "\\b1 , \\b2" name = "Anti Casper"}
		{combo = "\\b0 , \\b0" name = "Pogo"}
		{combo = "\\b0 , \\b1" name = "Truckstand"}
		{combo = "\\b0 , \\b2" name = "Switch Foot Pogo"}
		{combo = "\\b2 , \\b2" name = "Crossfoot Pogo"}
		{combo = "\\b2 , \\b1" name = "Rail"}
		{combo = "\\b2 , \\b0" name = "One Foot Manual"}
		{combo = "\\b6 , \\b5 , \\b1" name = "Spacewalk"}
		{combo = "FROM NOSE MANUAL (\\b4 , \\b7)" name = "" is_subheading = 1}
		{combo = "\\b1 , \\b1" name = "360 Shove Manual"}
		{combo = "\\b1 , \\b0" name = "Casper"}
		{combo = "\\b1 , \\b2" name = "Anti Casper"}
		{combo = "\\b0 , \\b0" name = "Pogo"}
		{combo = "\\b0 , \\b1" name = "Truckstand"}
		{combo = "\\b0 , \\b2" name = "Switch Foot Pogo"}
		{combo = "\\b2 , \\b2" name = "Crossfoot Pogo"}
		{combo = "\\b2 , \\b1" name = "Rail"}
		{combo = "\\b2 , \\b0" name = "One Foot Nose Manual"}
		{combo = "\\b6 , \\b5 , \\b1" name = "Spacewalk"}
	]
	getarraysize <tricks>
	<index> = 0
	begin
	<trick> = (<tricks> [<index>])
	if structurecontains structure = <trick> is_subheading
		<is_subheading> = (<trick>.is_subheading)
	else
		<is_subheading> = 0
	endif
	if (<is_subheading> = 1)
		<cas_heading> = cas_heading
		<text_color> = ($cas_color_scheme.text_color_2)
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				<text_color> = [200 200 200 255]
			endif
		endif
	else
		removeparameter cas_heading
		<text_color> = ($cas_color_scheme.text_color)
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				<text_color> = $goal_arcade_text_unfocus
			endif
		endif
	endif
	add_cas_menu_item {
		text = (<trick>.combo)
		cas_heading = <cas_heading>
		additional_focus_script = edit_tricks_sub_menu_item_focus
		additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
		additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
		additional_unfocus_params = {color = ($cas_color_scheme.text_color)}
	}
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		font = text_a1
		text = (<trick>.name)
		scale = (0.4, 0.45000002)
		pos = (0.0, 0.0)
		just = [left center]
		rgba = <text_color>
		local_id = column_2
		z_priority = 30
	}
	getscreenelementdims id = <id>
	if (<width> > 160)
		<mod> = ((160.0) / <width>)
		doscreenelementmorph {
			id = <id>
			scale = ((0.4, 0.45000002) * <mod>)
		}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	assignalias id = edit_tricks_menu_1 alias = current_menu
	cas_menu_finish helper_text = $generic_helper_text_no_accept
endscript

script create_other_tricks_menu 
	make_cas_menu {
		title = "OTHER ABILITIES"
		menu_id = edit_tricks_sub_menu_anchor
		vmenu_id = edit_tricks_menu_1
		pausemenu
		width = 2000
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = edit_tricks_sub_menu_exit from_view_tricks from_tutorial}
		highlight_add = (-20.0, 0.0)
		dims = (350.0, 460.0)
	}
	createscreenelement {
		type = containerelement
		parent = edit_tricks_sub_menu_anchor
		id = edit_tricks_menu_parts_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 840.0)
	}
	if infrontend
		<root_pos> = (40.0, 10.0)
	else
		<root_pos> = (40.0, 20.0)
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = edit_tricks_sub_menu_title
		pos = (<root_pos> + (80.0, 70.0))
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = edit_tricks_menu_vertical_bar
		texture = black
		rgba = [0 0 0 128]
		scale = (2.0, 70.0)
		pos = (0.0, 100.0)
		just = [left top]
		z_priority = 4
	}
	if isxenon
		<tricks> = [
			{name = "Revert" descrip = "\\bh while coming down a quarter pipe."}
			{name = "Caveman" descrip = "While running, jump (\\b3) and press \\bi."}
			{name = "Grind" descrip = "Press \\b0 near a rail."}
			{name = "Flip Tricks" descrip = "Press \\b1 plus a direction in the air. Press \\b1, \\b1 for a double flip and \\b1, \\b1, \\b1 for a triple flip."}
			{name = "Grab Tricks" descrip = "Press \\b2 plus a direction in the air."}
			{name = "Invert Tricks" descrip = "Press \\b0 + \\bh near the top of a quarter pipe. Press combos of \\b0, \\b1, and \\b2 to do invert modifiers."}
			{name = "No Comply" descrip = "Press \\b7 + \\b3 while skating."}
			{name = "Natas Spin" descrip = "Press \\b0 + \\bfwhen landing on something you can spin on. Press combos of \\b0, \\b1, and \\b2 to do natas modifiers."}
			{name = "Wall Plant" descrip = "When skating towards a wall, jump (\\b3) then press \\b3 again when at the wall."}
			{name = "Wall Ride" descrip = "Press \\b0 when in the air along a wall."}
			{name = "Spine Transfer" descrip = "When in the air, \\ml over back to back quarter pipes."}
			{name = "Flips" descrip = "When in the air, \\bg and use \\bk up or down to do flips."}
			{name = "Acid Drop" descrip = "\\bh over a quarter pipe."}
			{name = "Bank Drop" descrip = "\\bh over a banked surface."}
			{name = "Boneless" descrip = "Press \\b7 , \\b7 + \\b3 while skating."}
			{name = "Stall" descrip = "To stall, \\bh + \\b0.  Press combos of \\b0, \\b1, and \\b2 to do stall modifiers."}
			{name = "Nollie" descrip = "Click\\bj to go into the nollie stance."}
			{name = "Focus" descrip = "Click\\bj, \\bj to go into focus mode."}
			{name = "Nail the Trick" descrip = "Ollie (\\b3) then \\bj + \\bm to go into Nail the Trick mode. Use \\bk to control your left foot and \\bl to control your right foot."}
			{name = "Nail the Grab" descrip = "Enter Nail the Trick mode. Pull and hold \\bg and \\bk or \\bl direction to Nail a Grab. To land, release \\bg and \\bk or \\bl."}
			{name = "Nail the Manual" descrip = "Enter Nail the Trick mode. Pull and hold \\bh and \\bk or \\bl direction to balance in Nail the Manual."}
			{name = "Aggro Kick" descrip = "Press \\bf while skating."}
			{name = "Aggro Push" descrip = "During a Manual, press \\bf near a high wall."}
			{name = "Aggro Skitch Boost" descrip = "Press \\bf while skating near a car."}
			{name = "Skate Checking" descrip = "Pull\\bg while skating."}
			{name = "Carve" descrip = "Press and release \\be on a QP or Bowl vert transition."}
			{name = "Slash Grind" descrip = "Press and hold \\be at the top of a QP or Bowl vert."}
			{name = "Rig-a-Kit" descrip = "Press \\m2 to enter the Rig-a-Kit menu."}
			{name = "Mod Environment" descrip = "In the Rig-a-Kit menu, select the hammer piece. Place over the hammer icon and press \\b3 to modify."}
			{name = "Climb" descrip = "While walking, jump (\\b3) and press \\bf at the climb spot.  For ladders use \\bk."}
			{name = "Take a Picture" descrip = "Click\\bm when in the camera target."}
		]
	else
		<tricks> = [
			{name = "Revert" descrip = "\\bh while coming down a quarter pipe."}
			{name = "Caveman" descrip = "While running, jump (\\b3) and press \\bi."}
			{name = "Grind" descrip = "Press \\b0 near a rail."}
			{name = "Flip Tricks" descrip = "Press \\b1 plus a direction in the air. Press \\b1 , \\b1 for a double flip and \\b1, \\b1, \\b1 for a triple flip."}
			{name = "Grab Tricks" descrip = "Press \\b2 plus a direction in the air."}
			{name = "Invert Tricks" descrip = "Press \\b0 + \\bh near the top of a quarter pipe. Press combos of \\b0, \\b1, and \\b2 to do invert modifiers."}
			{name = "No Comply" descrip = "Press \\b7 + \\b3 while skating."}
			{name = "Natas Spin" descrip = "Press \\b0 + \\bfwhen landing on something you can spin on. Press combos of \\b0, \\b1, and \\b2 to do natas modifiers."}
			{name = "Wall Plant" descrip = "When skating towards a wall, jump (\\b3) then press \\b3 again when at the wall."}
			{name = "Wall Ride" descrip = "Press \\b0 when in the air along a wall."}
			{name = "Spine Transfer" descrip = "When in the air, \\ml over back to back quarter pipes."}
			{name = "Flips" descrip = "When in the air, \\bg and use \\bk up or down to do flips."}
			{name = "Acid Drop" descrip = "\\bh over a quarter pipe."}
			{name = "Bank Drop" descrip = "\\bh over a banked surface."}
			{name = "Boneless" descrip = "Press \\b7 , \\b7 + \\b3 while skating."}
			{name = "Stall" descrip = "To stall, \\bh + \\b0.  Press combos of \\b0, \\b1, and \\b2 to do stall modifiers."}
			{name = "Nollie" descrip = "Press\\bj to go into the nollie stance."}
			{name = "Focus" descrip = "Press\\bj, \\bj to go into focus mode."}
			{name = "Nail the Trick" descrip = "Ollie (\\b3) then \\bj + \\bm to go into Nail the Trick mode. Use \\bk to control your left foot and \\bl to control your right foot."}
			{name = "Nail the Grab" descrip = "Enter Nail the Trick mode. \\bg and \\bk or \\bl direction to Nail the Grab. To land, release \\bg and \\bk or \\bl."}
			{name = "Nail the Manual" descrip = "Enter Nail the Trick mode. \\bh and \\bk or \\bl direction to balance in Nail a Manual."}
			{name = "Aggro Kick" descrip = "Press \\bf while skating."}
			{name = "Aggro Push" descrip = "During a Manual, press \\bf near a high wall."}
			{name = "Aggro Skitch Boost" descrip = "Press \\bf while skating near a car."}
			{name = "Skate Checking" descrip = "Press\\bg while skating."}
			{name = "Carve" descrip = "Press \\be on a QP or Bowl vert transition."}
			{name = "Slash Grind" descrip = "Press \\be at the top of a QP or Bowl vert."}
			{name = "Rig-a-Kit" descrip = "Press \\m2 to enter the Rig-a-Kit menu."}
			{name = "Mod Environment" descrip = "In the Rig-a-Kit menu, select the hammer piece. Place over the hammer icon and press \\b3 to modify."}
			{name = "Climb" descrip = "While walking, jump (\\b3) and press \\bf at the climb spot.  For ladders use \\bk."}
			{name = "Take a Picture" descrip = "Press\\bm when in the camera target."}
		]
	endif
	getarraysize <tricks>
	<count> = <array_size>
	<index> = 0
	begin
	<trick> = (<tricks> [<index>])
	<text_color> = ($cas_color_scheme.text_color_2)
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<text_color> = $goal_arcade_text_unfocus
		endif
	endif
	if (structurecontains structure = trick name = selection_height)
		selection_height = (<trick>.selection_height)
	endif
	add_cas_menu_item {
		text = (<trick>.name)
		cas_heading = <cas_heading>
		additional_focus_script = edit_tricks_sub_menu_item_focus
		additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
		additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
		additional_unfocus_params = {color = ($cas_color_scheme.text_color_2)}
	}
	createscreenelement {
		type = textblockelement
		parent = <item_container_id>
		font = text_a1
		text = (<trick>.descrip)
		scale = (0.4, 0.45000002)
		pos = ((75.0, -10.0))
		dims = (850.0, 0.0)
		allow_expansion
		rgba = <text_color>
		local_id = column_2
		z_priority = 30
		just = [left top]
		internal_just = [left top]
	}
	getscreenelementchildren id = <id>
	getarraysize <children>
	setscreenelementprops id = <item_container_id> dims = ((0.0, 1.0) * (<array_size> * 25))
	<index> = (<index> + 1)
	repeat <count>
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	assignalias id = edit_tricks_menu_1 alias = current_menu
	cas_menu_finish helper_text = $generic_helper_text_no_accept
endscript

script create_tutorial_vids_menu 
	make_cas_menu {
		title = "TUTORIAL VIDEOS"
		menu_id = edit_tricks_sub_menu_anchor
		vmenu_id = edit_tricks_menu_1
		pausemenu
		width = 2000
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = edit_tricks_sub_menu_exit from_view_tricks from_tutorial}
		highlight_add = (-20.0, 0.0)
	}
	createscreenelement {
		type = containerelement
		parent = edit_tricks_sub_menu_anchor
		id = edit_tricks_menu_parts_anchor
		dims = (640.0, 480.0)
		pos = (320.0, 840.0)
	}
	if infrontend
		<root_pos> = (40.0, 10.0)
	else
		<root_pos> = (40.0, 20.0)
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		id = edit_tricks_sub_menu_title
		pos = (<root_pos> + (80.0, 70.0))
	}
	createscreenelement {
		type = spriteelement
		parent = current_menu_anchor
		id = edit_tricks_menu_vertical_bar
		texture = black
		rgba = [0 0 0 128]
		scale = (2.0, 70.0)
		pos = (0.0, 100.0)
		just = [left top]
		z_priority = 4
	}
	if isps3
		StoryMenu = "Press \\bm to toggle show the story menu."
	else
		StoryMenu = "Click \\bm to toggle show the story menu."
	endif
	<tutorials> = [
		{name = "Grind" descrip = "How to balance a grind." video = $Grind_Balance_Video}
		{name = "Manual" descrip = "How to balance a manual." video = $Manual_Balance_Video}
		{name = "Revert to Manual" descrip = "Tony's How to Revert to Manual." video = $Revert2Manual_video}
		{name = "Aggro Kick" descrip = "Mike V's Aggro Kick tutorial." video = $AggroKick_Video}
		{name = "NTT Intro" descrip = "Arto's Nail the Trick intro." video = $TRAIN_NTTIntro_Video}
		{name = "NTT Kickflip" descrip = "Nail the Trick - kickflip." video = $TRAIN_NTTKickflip_Video}
		{name = "NTT Shove It" descrip = "Nail the Trick - shove it." video = $TRAIN_NTTShoveIt_Video}
		{name = "NTT Impossible" descrip = "Nail the Trick - impossible." video = $TRAIN_NTTImpossible_Video}
		{name = "NTT Both Feet" descrip = "Nail the Trick - Using both feet." video = $TRAIN_NTTBoothFeet_Video}
		{name = "NTT Branch" descrip = "Nail the Trick - Branching tricks." video = $TRAIN_NTTBranch_Video}
		{name = "NTG Intro" descrip = "Bob's Nail the Grab intro." video = $TRAIN_NTGIntro_Video}
		{name = "NTG Tweak" descrip = "Nail the Grab - Tweaks." video = $TRAIN_NTGTweaks_Video}
		{name = "NTG Transfer" descrip = "Nail the Grab - Transfers." video = $TRAIN_NTGTransfers_Video}
		{name = "NTG Finger flip" descrip = "Nail the Grab - Finger flip." video = $TRAIN_NTGFingerFlip_Video}
		{name = "NTM Intro" descrip = "Stevie's Nail the Manual intro." video = $TRAIN_NTMIntro_Video}
		{name = "NTM Ollie" descrip = "Nail the Manual - Ollie." video = $TRAIN_NTMOllie_Video}
		{name = "Rig-a-kit Kicker" descrip = "How to use the RAK Menu." video = $RAK_Kicker_Video}
		{name = "Rig-a-kit Controls" descrip = "More on the Rig-a-Kit Controls." video = $RAK_RailQP_Video}
		{name = "Adjust Camera" descrip = "How to adjust the Rig-a-Kit Camera." video = $Camera_Adjust_Video}
		{name = "Upgrade Skills" descrip = "How to upgrade new skills." video = $Skill_Upgrade_Video}
		{name = "Story Menu" descrip = <StoryMenu> video = $Story_Menu_Video}
		{name = "VE Basic Clips" descrip = "How to insert a clip." video = $VE_Insert_Remove_Video}
		{name = "VE Basic Trim" descrip = "How to trim a clip." video = $VE_Trim02_Video}
		{name = "VE Adv ScreenFX" descrip = "Adding FX to an edit." video = $VE_FX_Video}
		{name = "VE Adv Overlays" descrip = "Adding overlays to an edit." video = $VE_Overlay_Insert_Move_Video}
		{name = "VE Adv Submit" descrip = "Assemble footage for Volcom." video = $VE_Scoring_Video}
		{name = "Skate Lounge" descrip = "Create your own custom Skate Lounge!" video = $RAK_Skate_Lounge_Video}
	]
	getarraysize <tutorials>
	<index> = 0
	begin
	<tutorial> = (<tutorials> [<index>])
	<text_color> = ($cas_color_scheme.text_color_2)
	add_cas_menu_item {
		text = (<tutorial>.name)
		cas_heading = <cas_heading>
		pad_choose_script = tutorial_video_play
		pad_choose_params = {movie = (<tutorial>.video)}
		additional_focus_script = edit_tricks_sub_menu_item_focus
		additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
		additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
		additional_unfocus_params = {color = ($cas_color_scheme.text_color_2)}
	}
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		font = text_a1
		text = (<tutorial>.descrip)
		scale = (0.4, 0.45000002)
		pos = (75.0, 0.0)
		rgba = <text_color>
		local_id = column_2
		z_priority = 30
		just = [left center]
	}
	<index> = (<index> + 1)
	repeat <array_size>
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	assignalias id = edit_tricks_menu_1 alias = current_menu
	cas_menu_finish helper_text = $generic_helper_text
endscript

script tutorial_video_play 
	kill_start_key_binding
	launchevent \{type = unfocus
		target = current_menu}
	if objectexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
	goal_presentation_subtitled_movie movie = <movie> do_pause = false
	create_helper_text \{parent = root_window
		$generic_helper_text}
	wait \{0.5
		seconds}
	launchevent \{type = focus
		target = current_menu}
	restore_start_key_binding
endscript

script edit_tricks_sub_menu_item_focus 
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<color> = [200 200 200 255]
		endif
	endif
	if screenelementexists id = {<id> child = trick_string}
		setscreenelementprops {
			id = {<id> child = trick_string}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_2}
		setscreenelementprops {
			id = {<id> child = column_2}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_3}
		setscreenelementprops {
			id = {<id> child = column_3}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_4}
		setscreenelementprops {
			id = {<id> child = column_4}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_5}
		setscreenelementprops {
			id = {<id> child = column_5}
			rgba = <color>
		}
	endif
endscript

script edit_tricks_sub_menu_item_unfocus 
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<color> = $goal_arcade_text_unfocus
		endif
	endif
	if screenelementexists id = {<id> child = trick_string}
		setscreenelementprops {
			id = {<id> child = trick_string}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_2}
		setscreenelementprops {
			id = {<id> child = column_2}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_3}
		setscreenelementprops {
			id = {<id> child = column_3}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_4}
		setscreenelementprops {
			id = {<id> child = column_4}
			rgba = <color>
		}
	endif
	if screenelementexists id = {<id> child = column_5}
		setscreenelementprops {
			id = {<id> child = column_5}
			rgba = <color>
		}
	endif
endscript

script edit_tricks_choose_trick_item_focus 
	<id> :getsingletag color_scheme
	printf \{"focus params"}
	setscreenelementprops {
		id = {<id> child = text}
		rgba = ($cas_color_scheme.text_focus_color)
	}
	<id> :getsingletag scrolling_option
	if gotparam \{scrolling_option}
		current_menu_anchor :getsingletag \{scrolling_num_options}
		cas_update_scrollbar option = <scrolling_option> num_options = <scrolling_num_options>
	endif
	wait \{0.1
		seconds}
endscript

script edit_tricks_choose_trick_item_unfocus 
	<id> :getsingletag rgba
	setscreenelementprops {
		id = {<id> child = text}
		rgba = <rgba>
	}
	wait \{0.1
		seconds}
endscript

script edit_tricks_menu_2_focus 
	assignalias \{id = choose_tricks_anchor
		alias = current_menu_anchor}
	assignalias \{id = edit_tricks_menu_2
		alias = current_menu}
	doscreenelementmorph \{id = choose_tricks_anchor
		pos = (250.0, -40.0)
		time = 0.2}
endscript

script edit_tricks_menu_2_unfocus 
	doscreenelementmorph \{id = choose_tricks_anchor
		pos = (250.0, -500.0)
		time = 0.2}
endscript

script edit_tricks_menu_update_items_unfocus 
	doscreenelementmorph \{id = edit_tricks_sub_menu_anchor
		alpha = 0.37}
endscript

script edit_tricks_menu_update_items_focus 
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	assignalias id = edit_tricks_menu_1 alias = current_menu
	doscreenelementmorph {
		id = edit_tricks_sub_menu_anchor
		alpha = 1
	}
	if gotparam key_combo_array
		getarraysize <key_combo_array>
		<index> = 0
		begin
		key_combo = (<key_combo_array> [<index>])
		if GetTrickFromKeyCombo key_combo = <key_combo>
			if NOT (<type> = lip_tricks)
				if gotparam extra_trick_string
					formattext textname = trick_string "%f" f = <trick_string> s = <extra_trick_string>
				endif
			endif
			setscreenelementprops {
				id = <key_combo>
				text = <trick_string>
			}
		endif
		<index> = (<index> + 1)
		removeparameter extra_trick_string
		repeat <array_size>
		if NOT (<type> = lip_tricks)
			begin
			key_combo = (<key_combo_array> [(<index> - <array_size>)])
			if GetTrickFromKeyCombo key_combo = <key_combo>
				if gotparam extra_trick_string
					formattext textname = trick_string "%s" f = <trick_string> s = <extra_trick_string>
				endif
				setscreenelementprops {
					id = (<key_combo> + 1)
					text = <trick_string>
				}
			endif
			<index> = (<index> + 1)
			removeparameter extra_trick_string
			repeat <array_size>
			if NOT (<type> = grab_tricks)
				begin
				key_combo = (<key_combo_array> [(<index> - (<array_size> * 2))])
				if ((<key_combo> = Air_SquareU) || (<key_combo> = Air_SquareR) || (<key_combo> = Air_SquareD) || (<key_combo> = Air_SquareL))
					if GetTrickFromKeyCombo key_combo = <key_combo>
						double = (<trick_checksum>.params.extratricks)
						triple = ((<double> [0]).params.extratricks)
						triple_text = (<triple> [0].params.name)
						setscreenelementprops {
							id = (<key_combo> + 2)
							text = <triple_text>
						}
					endif
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
	endif
endscript

script create_special_tricks_menu 
	printf "--- create_special_tricks_menu"
	setscreenelementprops {
		id = edit_tricks_menu_1
		event_handlers = [
			{focus edit_tricks_menu_create_current_mapping_list params = {key_combo_array = <key_combo_array> type = <type>}}
			{unfocus edit_tricks_menu_destroy_current_mapping_list}
		]
		replace_handlers
	}
	createscreenelement {
		type = containerelement
		id = choose_trick_menu_container
		parent = root_window
		pos = $special_trick_menu_right_up
		scale = 2.0
	}
	createscreenelement {
		type = containerelement
		parent = choose_trick_menu_container
		id = special_tricks_left_scroll_bar_container
	}
	createscreenelement {
		type = containerelement
		parent = choose_trick_menu_container
		id = special_tricks_right_scroll_bar_container
	}
	createscreenelement {
		type = textelement
		parent = choose_trick_menu_container
		local_id = title
		font = text_a1
		text = "Select Trick"
		rgba = [200 200 200 255]
		scale = <title_scale>
		scale = 0.6
		pos = (40.0, 75.0)
		font_spacing = 2
		z_priority = -4.1
		just = [left center]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = spriteelement
		parent = choose_trick_menu_container
		texture = menu_highlight
		local_id = title_bg
		pos = (5.0, 73.0)
		just = [left center]
		scale = (0.8, 1.0)
		z_priority = -4.2
		rgba = ($goal_ui_scheme.main)
		flip_v
		flip_h
	}
	createscreenelement {
		type = textelement
		parent = choose_trick_menu_container
		local_id = title
		font = text_a1
		text = "Select Combo"
		rgba = [200 200 200 255]
		scale = <title_scale>
		scale = 0.6
		pos = (320.0, 75.0)
		font_spacing = 2
		z_priority = -4.1
		just = [left center]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = spriteelement
		parent = choose_trick_menu_container
		texture = menu_highlight
		local_id = title_bg
		pos = (285.0, 73.0)
		just = [left center]
		scale = (0.8, 1.0)
		z_priority = -4.2
		rgba = ($goal_ui_scheme.main)
		flip_v
		flip_h
	}
	ui_create_messy_background {
		parent = choose_trick_menu_container
		dims = (1000.0, 370.0)
		pos = (-100.0, 25.0)
		rgba = [200 200 200 255]
		z_priority = -10
		rot_angle = -4
	}
	createscreenelement {
		type = containerelement
		parent = choose_trick_menu_container
		id = sub_menu_tricks_menu_container
	}
	createscreenelement {
		type = vscrollingmenu
		parent = sub_menu_tricks_menu_container
		id = sub_menu_container_menu_2
		pos = (100.0, 110.0)
		just = [left top]
		dims = (400.0, 230.0)
		internal_just = [left top]
	}
	<vscrolling_menu_id> = <id>
	createscreenelement {
		type = vmenu
		parent = <vscrolling_menu_id>
		id = edit_tricks_menu_2
		pos = (0.0, 0.0)
		just = [left top]
		dont_allow_wrap
		event_handlers = [{focus edit_tricks_menu_show_on_focus}
			{unfocus edit_tricks_menu_hide_on_unfocus params = <unfocus_params>}
			{pad_back edit_tricks_menu_back_from_trick_list}
			{pad_up set_which_arrow params = {arrow = edit_tricks_menu_up_arrow}}
			{pad_down set_which_arrow params = {arrow = edit_tricks_menu_down_arrow}}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back_sound}
		]
	}
	edit_tricks_menu_2 :settags scrolling_parent = <vscrolling_menu_id>
	setscreenelementprops {
		id = edit_tricks_menu_1
		event_handlers = [{focus edit_tricks_menu_special_tricks_focus}]
		replace_handlers
	}
	GetCurrentSkaterProfileIndex
	GetSkaterProfileInfo player = <currentskaterprofileindex>
	<index> = 0
	begin
	special_tricks_menu_add_slot index = <index>
	<index> = (<index> + 1)
	repeat <max_specials>
	text_rgba = [128 123 20 255]
	special_tricks_menu_create_menu_3
	assignalias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
	cas_menu_finish
endscript

script destroy_special_tricks_menu 
	if screenelementexists \{id = choose_trick_menu_container}
		destroyscreenelement \{id = choose_trick_menu_container}
	endif
	if screenelementexists \{id = choose_trick_helper}
		destroyscreenelement \{id = choose_trick_helper}
	endif
endscript

script special_tricks_menu_create_menu_3 
	printf "--- special_tricks_create_menu_3"
	setscreenelementlock id = current_menu_anchor off
	if objectexists id = special_tricks_menu_key_combo_up_arrow
		destroyscreenelement id = special_tricks_menu_key_combo_up_arrow
	endif
	if objectexists id = special_tricks_menu_key_combo_down_arrow
		destroyscreenelement id = special_tricks_menu_key_combo_down_arrow
	endif
	createscreenelement {
		type = containerelement
		parent = choose_trick_menu_container
		id = sub_menu_combo_menu_container
	}
	createscreenelement {
		type = vscrollingmenu
		parent = sub_menu_combo_menu_container
		id = edit_tricks_menu_3_parent
		pos = (350.0, 135.0)
		just = [left top]
		dims = (300.0, 200.0)
		internal_just = [left top]
	}
	getscreenelementprops id = edit_tricks_menu_3_parent
	createscreenelement {
		type = textelement
		text = "combo"
		pos = (10.0, -20.0)
		scale = 0.5
		font = text_a1
		parent = edit_tricks_menu_3_parent
		id = combo_header
		z_priority = -4.1
		rgba = ($goal_ui_scheme.main)
	}
	createscreenelement {
		type = vmenu
		parent = edit_tricks_menu_3_parent
		id = edit_tricks_menu_3
		just = [left top]
		event_handlers = [{focus edit_tricks_menu_show_on_focus}
			{pad_back special_tricks_menu_goto_trick_list params = {hold_menu back}}
			{pad_up set_which_arrow params = {arrow = special_tricks_menu_key_combo_up_arrow}}
			{pad_down set_which_arrow params = {arrow = special_tricks_menu_key_combo_down_arrow}}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back_sound}
		]
		dont_allow_wrap
	}
endscript

script special_tricks_menu_create_current_mapping_list 
	printf "--- special_tricks_menu_create_current_mapping_list"
	if screenelementexists id = special_tricks_current_mapping
		destroyscreenelement id = special_tricks_current_mapping
	endif
	launchevent type = unfocus target = edit_tricks_menu_3
	setscreenelementlock id = edit_tricks_menu_parts_anchor off
	GetStackedScreenElementPos x id = edit_tricks_menu_vertical_bar offset = (0.0, 10.0)
	createscreenelement {
		type = vmenu
		parent = edit_tricks_menu_parts_anchor
		id = special_tricks_current_mapping
		pos = (300.0, 100.0)
		just = [left top]
		alpha = 0
	}
	GetCurrentSkaterProfileIndex
	GetSkaterProfileInfo player = <currentskaterprofileindex>
	<index> = 0
	begin
	special_tricks_menu_add_special_to_mapping index = <index>
	<index> = (<index> + 1)
	repeat <max_specials>
	edit_tricks_menu_assign_current_menu_alias
endscript

script special_tricks_get_slot_id_from_index 
	if NOT gotparam \{index}
		script_assert \{"Did not pass in index!"}
	endif
	formattext checksumname = slot_id 'trickslot_%d' d = <index>
	return slot_id = <slot_id>
endscript

script edit_tricks_menu_create_current_mapping_list 
	printf "--- edit_tricks_menu_create_current_mapping_list"
	if objectexists id = edit_tricks_menu_current_mapping
		destroyscreenelement id = edit_tricks_menu_current_mapping
	endif
	text_rgba = [128 128 128 240]
	setscreenelementlock id = edit_tricks_menu_parts_anchor off
	GetStackedScreenElementPos x id = edit_tricks_menu_vertical_bar offset = (10.0, 27.0)
	createscreenelement {
		type = vmenu
		parent = edit_tricks_menu_parts_anchor
		id = edit_tricks_menu_current_mapping
		pos = <pos>
		just = [left top]
	}
	if gotparam key_combo_array
		getarraysize <key_combo_array>
		<index> = 0
		begin
		createscreenelement {
			type = containerelement
			parent = edit_tricks_menu_current_mapping
			dims = (100.0, 22.0)
		}
		if GetTrickFromKeyCombo key_combo = (<key_combo_array> [<index>])
			if NOT (<type> = lip_tricks)
				if gotparam extra_trick_string
					formattext textname = trick_string "%f / %s" f = <trick_string> s = <extra_trick_string>
				endif
			endif
			createscreenelement {
				type = textelement
				parent = <id>
				font = text_a1
				rgba = <text_rgba>
				text = <trick_string>
				pos = (-5.0, 0.0)
				scale = 0.75
				just = [left center]
			}
		endif
		<index> = (<index> + 1)
		removeparameter extra_trick_string
		repeat <array_size>
	endif
	edit_tricks_menu_assign_current_menu_alias
endscript

script edit_tricks_menu_destroy_current_mapping_list 
	if objectexists \{id = edit_tricks_menu_current_mapping}
		destroyscreenelement \{id = edit_tricks_menu_current_mapping}
	endif
endscript

script special_tricks_add_categories 
	printf "--- special_tricks_add_categories"
	destroyscreenelement id = edit_tricks_menu_2 preserve_parent
	setscreenelementprops {
		id = edit_tricks_menu_2
		event_handlers = [{pad_back generic_menu_pad_back_sound}
			{pad_back edit_tricks_menu_back_from_trick_list params = {right}}
		]
		replace_handlers
	}
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (40.0, 24.0)
		not_focusable
	}
	<anchor_id> = <id>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = "categories"
		rgba = ($goal_ui_scheme.main)
		pos = (-50.0, -10.0)
		scale = 0.5
		just = [left top]
		z_priority = -4.1
		not_focusable
	}
	getarraysize $special_trick_types
	special_tricks_left_scroll_bar_container :settags num_options = <array_size>
	edit_tricks_menu_2 :settags temp_item_num = 1
	foreachin $special_trick_types do = special_tricks_menu_add_type_category params = {index = <index>}
endscript

script special_tricks_menu_add_type_category 
	printf "--- special_tricks_menu_add_type_category"
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (40.0, 24.0)
	}
	<anchor_id> = <id>
	highlight_color = ($goal_ui_scheme.main)
	edit_tricks_menu_2 :getsingletag temp_item_num
	setscreenelementprops {
		id = <anchor_id>
		event_handlers = [{focus special_tricks_menu_focus params = {option = <temp_item_num>}}
			{unfocus special_tricks_menu_unfocus params = {rgba = ($cas_color_scheme.text_color)}}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose special_tricks_menu_add_type params = {<...>}}
			{pad_start special_tricks_menu_add_type params = {<...>}}
		]
	}
	edit_tricks_menu_2 :settags temp_item_num = (<temp_item_num> + 1)
	unhighlight_color = [128 128 128 240]
	getlowercasestring <heading>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <lowercasestring>
		rgba = ($cas_color_scheme.text_color)
		pos = (-15.0, 10.0)
		just = [left center]
		scale = (0.35000002, 0.3)
		z_priority = -4.1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		font = text_a1
		texture = menu_highlight
		rgba = ($cas_color_scheme.item_bg_color)
		pos = (-35.0, 10.0)
		just = [left center]
		scale = (0.75, 0.8)
		z_priority = -4.2
	}
endscript

script edit_tricks_sub_menu_add_key_combo {pad_choose_script = edit_tricks_menu_goto_trick_list
		highlight_bar_scale = (1.0, 0.7)
		parent = edit_tricks_menu_1
	}
	printf "--- edit_tricks_sub_menu_add_key_combo"
	edit_tricks_menu_can_edit
	if NOT gotparam focus_params
		focus_params = {highlight_bar_scale = <highlight_bar_scale>
			highlight_bar_pos = <highlight_bar_pos>
		}
	endif
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = containerelement
		parent = <parent>
		dims = (100.0, 22.0)
		event_handlers = [{focus edit_tricks_menu_key_combo_focus params = <focus_params>}
			{unfocus edit_tricks_menu_key_combo_unfocus}
		]
		tags = {tag_grid_x = <index>}
		<not_focusable>
	}
	<anchor_id> = <id>
	if NOT gotparam pad_choose_params
		pad_choose_params = {
			key_combo = <key_combo>
			index = <index>
			id = <anchor_id>
			highlight_script = edit_tricks_menu_key_combo_focus
			highlight_bar_scale = <short_highlight_bar_scale>
			highlight_bar_pos = <short_highlight_bar_pos>
		}
	endif
	setscreenelementprops {
		id = <anchor_id>
		event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_start <pad_choose_script> params = <pad_choose_params>}
			{pad_choose generic_menu_pad_choose_sound}
		]
	}
	if gotparam not_focusable
		<text_rgba> = [70 70 70 90]
	else
		<text_rgba> = [128 128 128 255]
	endif
	combo_scale = 0.7
	GetTrickTextFromKeyCombo key_combo = <key_combo> trick_array = $ButtonCombos
	GetTrickTextFromKeyCombo key_combo = <key_combo> trick_array = $specialcombos
	pos = (55.0, 10.0)
	if (<type> = InvertTrick)
		formattext textname = key_text "%a + %b" a = <key_text> b = "\\bh"
		pos = (75.0, 10.0)
	endif
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		local_id = combo_text
		font = text_a1
		text = <key_text>
		rgba = <text_rgba>
		scale = (0.35000002, 0.3)
		pos = <pos>
		just = [right center]
		z_priority = -4.1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		local_id = item_bg_bar
		font = text_a1
		texture = menu_highlight
		rgba = ($cas_color_scheme.item_bg_color)
		scale = (0.45000002, 0.8)
		pos = (-15.0, 10.0)
		just = [left center]
		z_priority = -4.2
	}
endscript

script GetTrickTextFromKeyCombo 
	return key_text = (<trick_array>.<key_combo>)
endscript

script edit_tricks_sub_menu_add_trick pad_choose_script = edit_tricks_menu_bind_trick
	text_rgba = [128 128 128 240]
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (400.0, 24.0)
		event_handlers = [{focus edit_tricks_menu_focus params = <focus_params>}
			{unfocus edit_tricks_menu_unfocus params = {rgba = <text_rgba>}}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_start <pad_choose_script> params = <pad_choose_params>}
			{pad_choose generic_menu_pad_choose_sound}
		]
	}
	<anchor_id> = <id>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <text>
		pos = (0.0, 0.0)
		just = [left top]
		rgba = <text_rgba>
		scale = 0.75
		z_priority = 20
	}
endscript

script edit_tricks_sub_menu_add_header 
	text_rgba = [128 123 20 255]
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (400.0, 24.0)
		not_focusable
	}
	<anchor_id> = <id>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <text>
		pos = (0.0, 0.0)
		just = [left top]
		rgba = <text_rgba>
		scale = 0.75
		z_priority = 2
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = white2
		pos = (-10.0, 0.0)
		just = [left top]
		rgba = [0 0 0 100]
		scale = (46.0, 2.25)
		z_priority = 2
	}
endscript

script special_tricks_menu_invalid_selection 
	create_helper_text {
		helper_text_elements = [
			{text = "\\m0 continue"}
		]
		parent = root_window
		anchor_id = choose_trick_helper
		z_priority = 101
	}
	switch <index>
		case 3
		<text> = "Finish Arto's Career story to earn a new special trick and unlock this slot."
		case 4
		<text> = "Finish Bob and Ryan's Career story to earn a new special trick and unlock this slot."
		case 5
		<text> = "Finish Stevie's Career story to earn a new special trick and unlock this slot."
		case 6
		<text> = "Finish Mike V's Hardcore story to earn a new special trick and unlock this slot."
		case 7
		<text> = "Finish Dustin's Hardcore story to earn a new special trick and unlock this slot."
		case 8
		<text> = "Finish Lance's Hardcore story to earn a new special trick and unlock this slot."
		case 9
		<text> = "Finish Jeff King's Rigger story to earn a new special trick and unlock this slot."
		case 10
		<text> = "Finish Bam's Rigger story to earn a new special trick and unlock this slot."
		case 11
		<text> = "Finish Rodney, Daewon, and Vanessa's Rigger story to earn a new special trick and unlock this slot."
	endswitch
	create_dialog_box {
		title = "LOCKED TRICK"
		text = <text>
		buttons = [
			{text = "CONTINUE" pad_choose_script = special_tricks_menu_exit_dialog}
		]
	}
endscript

script special_tricks_menu_exit_dialog 
	dialog_box_exit
	cas_menu_finish
endscript

script special_tricks_menu_add_slot {pad_choose_script = special_tricks_menu_goto_trick_list
		highlight_bar_scale = (3.9, 0.7)
		highlight_bar_pos = (-105.0, -18.0)
	}
	printf "--- special_ticks_menu_add_slot"
	edit_tricks_menu_can_edit
	unhighlight_color = [128 128 128 240]
	<children> = [
		{null}
	]
	if gamemodeequals is_career
		<show_lock> = true
		switch <index>
			case 0
			case 1
			case 2
			<show_lock> = false
			case 3
			if gman_haswongoal goal = m_c1_finaloutro
				<show_lock> = false
			endif
			case 4
			if gman_haswongoal goal = m_c2_comppark
				<show_lock> = false
			endif
			case 5
			if gman_haswongoal goal = m_c3_finaloutro
				<show_lock> = false
			endif
			case 6
			if gman_haswongoal goal = m_h1_finalepic_outro
				<show_lock> = false
			endif
			case 7
			if gman_haswongoal goal = m_h2_bossbattle
				<show_lock> = false
			endif
			case 8
			if gman_haswongoal goal = m_h3_secret2
				<show_lock> = false
			endif
			case 9
			if gman_haswongoal goal = m_r1_showdown
				<show_lock> = false
			endif
			case 10
			if gman_haswongoal goal = m_r2_show2
				<show_lock> = false
			endif
			case 11
			if gman_haswongoal goal = m_r3_bell
				<show_lock> = false
			endif
		endswitch
		if (<show_lock> = true)
			setarrayelement arrayname = children index = 0 newvalue = {
				type = spriteelement
				texture = pause_viewgoals_locked
				scale = (0.5, 0.5)
				pos = (-55.0, -2.0)
				alpha = 1
				rgba = [128 128 128 255]
			}
			<pad_choose_script> = special_tricks_menu_invalid_selection
		endif
	endif
	if NOT infrontend
		if innetgame
			pad_choose_script = nullscript
		endif
	endif
	special_tricks_get_slot_id_from_index index = <index>
	formattext textname = slot_num "%s:" s = (<index> + 1)
	add_cas_menu_item {
		text = <slot_num>
		pad_choose_script = <pad_choose_script>
		pad_choose_params = {highlight_script = edit_tricks_menu_focus highlight_bar_scale = (0.6, 0.7) highlight_bar_pos = <highlight_bar_pos> index = <index>}
		id = <slot_id>
		additional_focus_script = edit_tricks_sub_menu_item_focus
		additional_focus_params = {color = ($cas_color_scheme.text_focus_color)}
		additional_unfocus_script = edit_tricks_sub_menu_item_unfocus
		additional_unfocus_params = {color = ($cas_color_scheme.text_color)}
		children = <children>
	}
	createscreenelement {
		type = textelement
		parent = <slot_id>
		local_id = trick_string
		font = text_a1
		text = ""
		pos = (25.0, 0.0)
		just = [left center]
		rgba = ($cas_color_scheme.text_color)
		z_priority = 30
		scale = (0.4, 0.45000002)
	}
	createscreenelement {
		type = textelement
		parent = <slot_id>
		local_id = combo_text
		font = text_a1
		text = ""
		pos = (20.0, 0.0)
		just = [right center]
		rgba = [128 128 128 255]
		z_priority = 30
		scale = (0.4, 0.4)
	}
endscript

script special_tricks_menu_add_special_to_mapping 
	printf "--- special_tricks_menu_add_special_to_mapping"
	GetSpecialTrickInfo index = <index>
	unhighlight_color = [128 128 128 240]
	createscreenelement {
		type = containerelement
		parent = special_tricks_current_mapping
		dims = (40.0, 22.0)
	}
	<anchor_id> = <id>
	if (<special_trickname> = unassigned)
		<trick_display_text> = "Unassigned"
		<special_trickslot_text> = ""
	else
		GetTrickDisplayText trick = <special_trickname>
		GetKeyComboBoundToTrick special trick = <special_trickname>
		GetTrickTextFromKeyCombo key_combo = <current_key_combo> trick_array = $specialcombos
		special_trickslot_text = <key_text>
	endif
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		scale = 0.75
		text = <trick_display_text>
		pos = (10.0, 0.0)
		just = [left top]
		rgba = <unhighlight_color>
	}
	combo_scale = 0.75
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		scale = <combo_scale>
		text = <special_trickslot_text>
		pos = (320.0, 0.0)
		just = [left top]
	}
	special_tricks_get_slot_id_from_index index = <index>
	setscreenelementprops {
		id = {<slot_id> child = trick_string}
		text = <trick_display_text>
	}
	getscreenelementdims id = {<slot_id> child = trick_string}
	if (<width> > 140)
		<mod> = ((140.0) / <width>)
		doscreenelementmorph {
			id = {<slot_id> child = trick_string}
			scale = ((0.4, 0.45000002) * <mod>)
		}
	endif
	trickstruct = (<special_trickname>)
	if (structurecontains structure = <trickstruct> name = scr)
		scr = ((<special_trickname>).scr)
		if (<scr> = InvertTrick)
			formattext textname = special_trickslot_text "%a + %b" a = <special_trickslot_text> b = "\\bh"
		endif
	endif
	setscreenelementprops {
		id = {<slot_id> child = combo_text}
		text = <special_trickslot_text>
	}
	getscreenelementdims id = {<slot_id> child = combo_text}
	if (<width> > 90)
		<mod> = ((90.0) / <width>)
		doscreenelementmorph {
			id = {<slot_id> child = combo_text}
			scale = ((0.4, 0.4) * <mod>)
		}
	endif
endscript

script special_tricks_menu_add_type 
	printf "--- special_tricks_menu_add_type"
	if (<type> = Manual)
		GetConfigurableTricksFromType type = flatland special
	else
		GetConfigurableTricksFromType type = <type> special
	endif
	setscreenelementlock id = edit_tricks_menu_2 off
	destroyscreenelement id = edit_tricks_menu_2 preserve_parent
	setscreenelementprops {
		id = edit_tricks_menu_2
		event_handlers = [{pad_back generic_menu_pad_back_sound}
			{pad_back special_tricks_menu_goto_trick_list params = {no_move}}
		]
		replace_handlers
	}
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (40.0, 24.0)
		not_focusable
	}
	<anchor_id> = <id>
	getlowercasestring <heading>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <lowercasestring>
		rgba = ($goal_ui_scheme.main)
		pos = (-50.0, -10.0)
		scale = 0.5
		just = [left top]
		z_priority = -4.1
	}
	getarraysize <configurabletricks>
	index = 0
	begin
	if ((<index> = 0) && (<type> = fliptrick))
		<first_item> = first_item
	else
		removeparameter first_item
		if ((<index> = (<array_size> - 1)) && (<type> = Manual))
		else
			removeparameter last_item
		endif
	endif
	<trick> = (<configurabletricks> [<index>])
	<trick_is_locked> = 0
	if gamemodeequals is_career
		if structurecontains structure = shop_specials_bought name = <trick>
			if (($shop_specials_bought.(<trick>)) = 0)
				<trick_is_locked> = 1
			endif
		endif
	endif
	if getglobalflag flag = $CHEAT_UNLOCK_AND_OWN_ALL_SPECIALS
		<trick_is_locked> = 0
	endif
	if (<trick_is_locked> = 0)
		special_tricks_menu_add_trick {
			trick = (<configurabletricks> [<index>])
			type = <type>
			first_item = <first_item>
			last_item = <last_item>
			option = (<index> + 1)
		}
	else
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	special_tricks_left_scroll_bar_container :settags num_options = <array_size>
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (40.0, 24.0)
		not_focusable
	}
	setscreenelementlock id = edit_tricks_menu_2 on
	setscreenelementlock id = edit_tricks_menu_2 off
	launchevent type = focus target = edit_tricks_menu_2
endscript

script is_trick_locked 
	if NOT gotparam trick
		return
	endif
	skater = ((<trick>.params).skater)
	unlockflag = ((<trick>.params).unlockflag)
	if gotparam unlockflag
		if getglobalflag flag = <unlockflag>
			return trick_is_locked = 0
		else
			return trick_is_locked = 1
		endif
	endif
	if NOT gotparam skater
		return trick_is_locked = 0
	endif
	getarraysize $master_skater_list
	index = 0
	begin
	name = (($master_skater_list [<index>]).name)
	if (<name> = <skater>)
		flag = (($master_skater_list [<index>]).unlock_flag)
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if NOT gotparam flag
		return
	endif
	if getglobalflag flag = <flag>
		return trick_is_locked = 0
	else
		return trick_is_locked = 1
	endif
endscript

script special_tricks_menu_add_trick 
	printf "--- special_tricks_menu_add_trick"
	if NOT getglobalflag flag = $CHEAT_UNLOCK_AND_OWN_ALL_SPECIALS
		if careerfunc func = isspecialtricklocked params = {trick_id = <trick>}
			return
		endif
		if NOT careerfunc func = isspecialtrickpurchased params = {trick_id = <trick>}
			return
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = edit_tricks_menu_2
		dims = (40.0, 24.0)
		<not_focusable>
	}
	<anchor_id> = <id>
	highlight_color = [128 123 20 255]
	if NOT gotparam not_focusable
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [
				{focus
					special_tricks_menu_focus
					params = {
						first_item = <first_item>
						last_item = <last_item>
						option = <option>
					}
				}
				{unfocus special_tricks_menu_unfocus params = {rgba = <unfocus_rgba>}}
				{pad_choose special_tricks_menu_select_trick params = {rgba = <highlight_color> highlight_bar_scale = (2.25, 0.7) trick = <trick> type = <type> id = <anchor_id>}}
				{pad_start special_tricks_menu_select_trick params = {rgba = <highlight_color> highlight_bar_scale = (2.25, 0.7) trick = <trick> type = <type> id = <anchor_id>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
		}
	endif
	unhighlight_color = [128 128 128 240]
	GetTrickDisplayText trick = <trick>
	if gotparam not_focusable
		<text_rgba> = [50 50 50 255]
	else
		<text_rgba> = ($cas_color_scheme.text_color)
	endif
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <trick_display_text>
		rgba = <text_rgba>
		pos = (-15.0, 10.0)
		just = [left center]
		scale = (0.35000002, 0.3)
		z_priority = -4.1
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = menu_highlight
		rgba = ($cas_color_scheme.item_bg_color)
		pos = (-35.0, 10.0)
		just = [left center]
		dims = (210.0, 25.0)
		z_priority = -4.2
	}
endscript

script edit_tricks_menu_focus highlight_bar_scale = (1.0, 0.7) highlight_bar_pos = (-10.0, -2.0)
	printf "--- edit_tricks_menu_focus"
	gettags
	setscreenelementlock id = <id> off
	killspawnedscript name = do_random_effect
	killspawnedscript name = text_twitch_effect2
	highlight_color = [128 123 20 255]
	if objectexists id = edit_tricks_menu_highlight_bar
		destroyscreenelement id = edit_tricks_menu_highlight_bar
	endif
	bar_rgba = [25 25 25 255]
	highlight_angle = 0
	if (<highlight_bar_scale>.(1.0, 0.0) > 1)
		highlight_angle = (<highlight_angle> / (<highlight_bar_scale>.(1.0, 0.0)))
	endif
	if NOT gotparam no_arrows
		if objectexists id = edit_tricks_menu_up_arrow
			if gotparam first_item
				setscreenelementprops {
					id = edit_tricks_menu_up_arrow
					rgba = [128 128 128 0]
				}
			else
				setscreenelementprops {
					id = edit_tricks_menu_up_arrow
					rgba = [128 128 128 85]
				}
			endif
		endif
		if objectexists id = edit_tricks_menu_down_arrow
			if gotparam last_item
				setscreenelementprops {
					id = edit_tricks_menu_down_arrow
					rgba = [128 128 128 0]
				}
			else
				setscreenelementprops {
					id = edit_tricks_menu_down_arrow
					rgba = [128 128 128 85]
				}
			endif
		endif
		if (objectexists id = edit_tricks_menu_up_arrow)
			assignalias id = edit_tricks_menu_2 alias = current_menu
			edit_tricks_menu_2 :gettags
			if gotparam arrow_id
				menu_vert_blink_arrow {id = <arrow_id>}
			endif
		endif
	endif
endscript

script edit_tricks_menu_unfocus 
	gettags
	unhighlight_color = [128 128 128 240]
	killspawnedscript name = text_twitch_effect3
	doscreenelementmorph id = {<id> child = 0} scale = 1 relative_scale
	if gotparam flagged_deck
		runscriptonscreenelement id = {<id> child = 0} do_scale_down params = {rgba = [25 83 67 128] no_sound}
	else
		setscreenelementprops id = {<id> child = 0} rgba = <unhighlight_color>
	endif
	if objectexists id = edit_tricks_menu_highlight_bar
		destroyscreenelement id = edit_tricks_menu_highlight_bar
	endif
endscript

script special_tricks_menu_focus highlight_bar_scale = (2.25, 0.7)
	printf "--- special_tricks_menu_focus"
	gettags
	highlight_color = [128 123 20 255]
	setscreenelementprops id = {<id> child = 0} rgba = ($cas_color_scheme.text_focus_color)
	setscreenelementprops id = {<id> child = 1} rgba = ($cas_color_scheme.bar_color)
	setscreenelementlock id = <id> off
	highlight_angle = 0
	highlight_angle = (<highlight_angle> / (<highlight_bar_scale>.(1.0, 0.0)))
	bar_color = [25 25 25 255]
endscript

script special_tricks_menu_unfocus 
	printf \{"--- special_tricks_menu_unfocus"}
	gettags
	killspawnedscript \{name = text_twitch_effect3}
	doscreenelementmorph id = {<id> child = 0} scale = 1 relative_scale
	setscreenelementprops id = {<id> child = 0} rgba = ($cas_color_scheme.text_color)
	setscreenelementprops id = {<id> child = 1} rgba = ($cas_color_scheme.item_bg_color)
endscript

script edit_tricks_menu_key_combo_focus highlight_bar_pos = (-42.0, -10.0)
	printf "--- edit_tricks_menu_key_combo_focus"
	gettags
	bar_color = [25 25 25 255]
	highlight_angle = 0
	highlight_angle = (<highlight_angle> / (<highlight_bar_scale>.(1.0, 0.0)))
	if gotparam rgba
		doscreenelementmorph {
			id = {<id> child = 0}
			rgba = <rgba>
			relative_scale
		}
	endif
	doscreenelementmorph {
		id = {<id> child = item_bg_bar}
		rgba = ($cas_color_scheme.bar_color)
	}
	combo_scale = {scale1 = 1.1 scale2 = 1.15}
	setscreenelementlock id = <id> off
	if (objectexists id = special_tricks_menu_key_combo_up_arrow)
		assignalias id = edit_tricks_menu_3 alias = current_menu
		edit_tricks_menu_3 :gettags
		if gotparam arrow_id
			menu_vert_blink_arrow {id = <arrow_id>}
		endif
	endif
endscript

script edit_tricks_menu_key_combo_unfocus 
	gettags
	killspawnedscript \{name = text_twitch_effect2}
	doscreenelementmorph {
		id = {<id> child = 0}
		scale = 1
		relative_scale
	}
	doscreenelementmorph {
		id = {<id> child = item_bg_bar}
		rgba = ($cas_color_scheme.item_bg_color)
	}
	if objectexists \{id = key_combo_highlight_bar}
		destroyscreenelement \{id = key_combo_highlight_bar}
	endif
endscript

script edit_tricks_menu_goto_trick_list 
	launchevent \{type = unfocus
		target = edit_tricks_menu_1}
	edit_tricks_menu_1_index = <index>
	if gotparam \{key_combo}
		setscreenelementprops {
			id = edit_tricks_menu_2
			tags = {new_key_combo = <key_combo>}
		}
	endif
	if screenelementexists \{id = special_trick_menu_left_down}
		doscreenelementmorph \{id = special_trick_menu_left_down
			alpha = 1}
	endif
	launchevent \{type = focus
		target = edit_tricks_menu_2}
endscript

script edit_tricks_menu_special_tricks_focus 
	printf \{"--- edit_tricks_menu_special_tricks_focus"}
	special_tricks_menu_create_current_mapping_list
endscript

script special_tricks_menu_goto_trick_list 
	printf "--- special_tricks_menu_goto_trick_list (pad back)"
	gettags
	if gotparam increment_index
		index = (<index> + 1)
	endif
	if NOT gotparam hold_menu
		special_tricks_add_categories
	endif
	if objectexists id = special_tricks_temp_trick_highlight_bar
		destroyscreenelement id = special_tricks_temp_trick_highlight_bar
	endif
	if gotparam element_to_unfocus
		setscreenelementprops {
			id = <element_to_unfocus>
			rgba = ($cas_color_scheme.item_bg_color)
		}
	endif
	if objectexists id = special_tricks_current_mapping
		destroyscreenelement id = special_tricks_current_mapping
	endif
	launchevent type = unfocus target = edit_tricks_menu_1
	if gotparam index
		setscreenelementprops {
			id = edit_tricks_menu_2
			tags = {index = <index>}
		}
	endif
	if gotparam highlight_script
		runscriptonscreenelement id = <id> <highlight_script> params = {highlight_bar_pos = <highlight_bar_pos> highlight_bar_scale = <highlight_bar_scale>}
	endif
	setscreenelementlock id = edit_tricks_menu_2 on
	setscreenelementlock id = edit_tricks_menu_2 off
	launchevent type = unfocus target = edit_tricks_menu_3
	if gotparam index
		GetSpecialTrickInfo index = <index>
		if (<special_trickslot> = unassigned)
			launchevent type = focus target = edit_tricks_menu_2
		else
			<special_trickname_string> = ((<special_trickname>).params.name)
			formattext textname = special_trickname_intermediate_string '%s' s = <special_trickname_string>
			formattext checksumname = special_trickname_checksum '%s' s = <special_trickname_intermediate_string>
			launchevent type = focus target = edit_tricks_menu_2 data = {child_id = <special_trickname_checksum>}
		endif
	else
		launchevent type = focus target = edit_tricks_menu_2
	endif
	if NOT gotparam no_move
		if NOT gotparam back
			wait $special_trick_menu_animate_time seconds
			doscreenelementmorph {
				id = choose_trick_menu_container
				pos = $special_trick_menu_right_up
				time = 0.0
			}
			doscreenelementmorph {
				id = choose_trick_menu_container
				pos = $special_trick_menu_right_down
				time = $special_trick_menu_animate_time
			}
		else
			doscreenelementmorph {
				id = choose_trick_menu_container
				pos = $special_trick_menu_right_down
				time = $special_trick_menu_animate_time
			}
		endif
	endif
endscript

script edit_tricks_menu_back_from_trick_list 
	printf "--- edit_tricks_menu_back_from_trick_list"
	if objectexists id = key_combo_highlight_bar
		destroyscreenelement id = key_combo_highlight_bar
	endif
	if screenelementexists id = choose_trick_helper
		destroyscreenelement id = choose_trick_helper
	endif
	if screenelementexists id = choose_trick_menu_container
		if gotparam right
			doscreenelementmorph {
				id = choose_trick_menu_container
				pos = $special_trick_menu_right_up
				time = $special_trick_menu_animate_time
			}
		else
			doscreenelementmorph {
				id = choose_trick_menu_container
				pos = $special_trick_menu_left_up
				time = $special_trick_menu_animate_time
			}
		endif
	endif
	doscreenelementmorph {
		id = edit_tricks_sub_menu_anchor
		alpha = 1
		time = 0.2
	}
	launchevent type = unfocus target = edit_tricks_menu_2
	if objectexists id = edit_tricks_menu_1
		launchevent type = focus target = edit_tricks_menu_1 data = {grid_index = $edit_tricks_menu_1_index}
	endif
	if objectexists id = edit_tricks_menu_up_arrow
		setscreenelementprops {
			id = edit_tricks_menu_up_arrow
			rgba = [128 128 128 0]
		}
	endif
	if objectexists id = edit_tricks_menu_down_arrow
		setscreenelementprops {
			id = edit_tricks_menu_down_arrow
			rgba = [128 128 128 0]
		}
	endif
endscript

script edit_tricks_menu_bind_trick 
	printf "edit_tricks_menu_bind_trick"
	if NOT gotparam new_key_combo
		edit_tricks_menu_2 :gettags
	endif
	if NOT gotparam new_key_combo
		printf "no new_key_combo"
		return
	endif
	if NOT gotparam new_trick
		printf "no new_trick"
		return
	endif
	if insplitscreengame
		<update_mappings> = 0
	else
		<update_mappings> = 1
	endif
	if gotparam special
		if GetTrickFromKeyCombo special key_combo = <new_key_combo>
			printf "special key combo already bound"
			BindTrickToKeyCombo {
				special
				index = <current_index>
				key_combo = unassigned
				trick = unassigned
				update_mappings = <update_mappings>
			}
		endif
		if GetKeyComboBoundToTrick special trick = <new_trick>
			printf "special trick already bound"
			BindTrickToKeyCombo {
				special
				index = <current_index>
				key_combo = unassigned
				trick = unassigned
				update_mappings = <update_mappings>
			}
		endif
	else
		printf "no param special"
		if GetKeyComboBoundToTrick trick = <new_trick>
			printf "trick already bound 1 to %a" a = <current_key_combo>
			if GetTrickFromKeyCombo key_combo = <new_key_combo>
				printf "rebinding 1"
				BindTrickToKeyCombo {
					key_combo = <current_key_combo>
					trick = <trick_checksum>
					update_mappings = <update_mappings>
				}
			endif
		endif
	endif
	if gotparam special
		printf "binding new special trick"
		BindTrickToKeyCombo {
			special
			index = <index>
			key_combo = <new_key_combo>
			trick = <new_trick>
			update_mappings = <update_mappings>
		}
	else
		printf "binding new trick"
		BindTrickToKeyCombo {
			key_combo = <new_key_combo>
			trick = <new_trick>
			update_mappings = <update_mappings>
		}
	endif
	GetCurrentSkaterProfileIndex
	if insplitscreengame
		printf "in a split screen game"
	else
		UpdateTrickMappings skater = <currentskaterprofileindex>
	endif
	if gotparam callback
		<callback>
	endif
endscript

script special_tricks_menu_select_trick 
	printf "--- special_tricks_menu_select_trick"
	launchevent type = unfocus target = edit_tricks_menu_2
	doscreenelementmorph {
		id = edit_tricks_menu_2
		alpha = 1
	}
	if gotparam id
		setscreenelementprops {
			id = {<id> child = 1}
			rgba = ($cas_color_scheme.bar_color)
		}
		setscreenelementprops {
			id = edit_tricks_menu_3
			event_handlers = [{pad_back special_tricks_menu_goto_trick_list params = {element_to_unfocus = <id>}}]
			replace_handlers
		}
		bar_color = [25 25 25 255]
		highlight_angle = 0
		highlight_angle = (<highlight_angle> / (<highlight_bar_scale>.(1.0, 0.0)))
	endif
	destroyscreenelement id = sub_menu_combo_menu_container
	special_tricks_menu_create_menu_3
	edit_tricks_menu_3 :settags trick = <trick>
	switch <type>
		case grabtrick
		<key_combo_array> = ($special_trick_air_key_combos)
		case fliptrick
		<key_combo_array> = ($special_trick_flip_key_combos)
		case InvertTrick
		<key_combo_array> = ($special_trick_lip_key_combos)
		case grindtrick
		<key_combo_array> = ($special_trick_grind_key_combos)
		case Manual
		<key_combo_array> = ($special_trick_manual_key_combos)
		default
		script_assert "Unknown type"
	endswitch
	getarraysize <key_combo_array>
	<key_combo_index> = 0
	begin
	if (<key_combo_index> = 0)
		<first_item> = first_item
	else
		if (<key_combo_index> = (<array_size> - 1))
			<last_item> = last_item
		endif
	endif
	if GetTrickFromKeyCombo special key_combo = (<key_combo_array> [<key_combo_index>])
		edit_tricks_menu_2 :gettags
		GetSpecialTrickInfo index = <index>
		if NOT (<special_trickslot> = (<key_combo_array> [<key_combo_index>]))
			<not_focusable> = not_focusable
		endif
	endif
	edit_tricks_sub_menu_add_key_combo {
		key_combo = (<key_combo_array> [<key_combo_index>])
		parent = edit_tricks_menu_3
		pad_choose_script = special_tricks_menu_select_key_combo
		focus_params = {highlight_bar_scale = (1.0, 0.7)
			up_arrow_id = special_tricks_menu_key_combo_up_arrow
			down_arrow_id = special_tricks_menu_key_combo_down_arrow
			key_combo = (<key_combo_array> [<key_combo_index>])
			<first_item>
			<last_item>
			option = (<key_combo_index> + 1)
		}
		pad_choose_params = {id = <anchor_id>
			highlight_script = edit_tricks_menu_key_combo_focus
			highlight_bar_scale = <short_highlight_bar_scale>
			key_combo = (<key_combo_array> [<key_combo_index>])
			index = <key_combo_index>
			special
		}
		not_focusable = <not_focusable>
		type = <type>
	}
	removeparameter first_item
	removeparameter last_item
	removeparameter not_focusable
	<key_combo_index> = (<key_combo_index> + 1)
	repeat <array_size>
	special_tricks_right_scroll_bar_container :settags num_options = (<array_size> - 1)
	setscreenelementlock id = edit_tricks_menu_3 on
	setscreenelementlock id = edit_tricks_menu_3_parent on
	launchevent type = focus target = edit_tricks_menu_3
	doscreenelementmorph id = edit_tricks_menu_2 alpha = 0.6
	spawnscriptlater special_tricks_menu_shift_page_left
endscript

script special_tricks_menu_shift_page_left 
	wait \{2
		frames}
	doscreenelementmorph {
		id = choose_trick_menu_container
		pos = ($special_trick_menu_left_down)
		time = ($special_trick_menu_animate_time)
	}
	printf \{"moved the anchor"}
endscript

script special_tricks_menu_select_key_combo 
	edit_tricks_menu_2 :gettags
	edit_tricks_menu_3 :gettags
	printf \{"special_tricks_menu_select_key_combo"}
	edit_tricks_menu_bind_trick new_key_combo = <key_combo> new_trick = <trick> index = <index> special
	special_tricks_menu_goto_trick_list \{no_move}
	edit_tricks_menu_back_from_trick_list
endscript

script edit_tricks_menu_show_on_focus 
	printf \{"--- edit_tricks_menu_show_on_focus"}
	gettags
	domorph \{alpha = 1}
	create_helper_text \{$generic_helper_text
		parent = root_window
		anchor_id = choose_trick_helper
		z_priority = 101}
endscript

script edit_tricks_menu_hide_on_unfocus 
	printf "--- edit_tricks_menu_hide_on_unfocus"
	domorph alpha = 0
	if objectexists id = special_tricks_menu_key_combo_up_arrow
		setscreenelementprops {
			id = special_tricks_menu_key_combo_up_arrow
			rgba = [128 128 128 0]
		}
	endif
	if objectexists id = special_tricks_menu_key_combo_down_arrow
		setscreenelementprops {
			id = special_tricks_menu_key_combo_down_arrow
			rgba = [128 128 128 0]
		}
	endif
	if objectexists id = edit_tricks_menu_up_arrow
		setscreenelementprops {
			id = edit_tricks_menu_up_arrow
			rgba = [128 128 128 0]
		}
	endif
	if objectexists id = edit_tricks_menu_down_arrow
		setscreenelementprops {
			id = edit_tricks_menu_down_arrow
			rgba = [128 128 128 0]
		}
	endif
	if screenelementexists id = choose_trick_helper
		destroyscreenelement id = choose_trick_helper
	endif
endscript

script edit_tricks_menu_assign_current_menu_alias 
	printf \{"--- edit_tricks_menu_assign_current_menu_alias"}
	if NOT gotparam \{id}
		gettags
	endif
	assignalias id = <id> alias = current_menu
endscript

script edit_tricks_menu_exit 
	if gotparam just_remove
		if screenelementexists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
		if screenelementexists id = edit_tricks_sub_menu_anchor
			destroyscreenelement id = edit_tricks_sub_menu_anchor
		endif
		return
	endif
	change viewing_tricks_not_editing = 0
	if infrontend
		unpauseskaters
		MakeSkaterGoto SkateshopAI params = {BlendOk}
		change cas_cam_angle = 154
		cas_setup_rotating_camera cam_anim = careerCam
	else
		if innetgame
			pause_game_and_create_pause_menu
		else
			if gman_hasactivegoals
				<back_state> = uistate_pausemenu
			else
				<back_state> = UIstate_achieve_main
			endif
			ui_change_state state = <back_state>
		endif
	endif
endscript

script edit_tricks_sub_menu_exit 
	printf "--- edit_tricks_sub_menu_exit"
	if screenelementexists id = edit_tricks_sub_menu_anchor
		destroyscreenelement id = edit_tricks_sub_menu_anchor
	endif
	if screenelementexists id = choose_tricks_anchor
		destroyscreenelement id = choose_tricks_anchor
	endif
	if screenelementexists id = choose_trick_menu_container
		destroyscreenelement id = choose_trick_menu_container
	endif
	if gotparam from_view_tricks
		<from_view_tricks> = from_view_tricks
	endif
	if gotparam from_special
		create_edit_tricks_menu_special <from_view_tricks>
	elseif gotparam from_tutorial
		create_edit_tricks_menu <from_view_tricks>
	else
		create_edit_tricks_menu_basic <from_view_tricks>
	endif
endscript
edit_tricks_menu_grab_key_combos = [
	Air_CircleU
	Air_CircleUR
	Air_CircleR
	Air_CircleDR
	Air_CircleD
	Air_CircleDL
	Air_CircleL
	Air_CircleUL
]
edit_tricks_menu_lip_key_combos = [
	Lip_TriangleU
	Lip_TriangleUR
	Lip_TriangleR
	Lip_TriangleDR
	Lip_TriangleD
	Lip_TriangleDL
	Lip_TriangleL
	Lip_TriangleUL
]
edit_tricks_menu_flip_key_combos = [
	Air_SquareU
	Air_SquareUR
	Air_SquareR
	Air_SquareDR
	Air_SquareD
	Air_SquareDL
	Air_SquareL
	Air_SquareUL
	Air_D_D_Square
	Air_U_U_Square
]
special_trick_types = [
	{
		type = fliptrick
		heading = "AIR TRICKS"
	}
	{
		type = grabtrick
		heading = "GRAB TRICKS"
	}
	{
		type = InvertTrick
		heading = "INVERT TRICKS"
	}
	{
		type = grindtrick
		heading = "GRIND TRICKS"
	}
	{
		type = Manual
		heading = "MANUAL TRICKS"
	}
]
special_trick_air_key_combos = [
	SpAir_D_L_Circle
	SpAir_D_R_Circle
	SpAir_D_U_Circle
	SpAir_L_D_Circle
	SpAir_L_R_Circle
	SpAir_L_U_Circle
	SpAir_R_D_Circle
	SpAir_R_L_Circle
	SpAir_R_U_Circle
	SpAir_U_D_Circle
	SpAir_U_L_Circle
	SpAir_U_R_Circle
	SpAir_D_L_Square
	SpAir_D_R_Square
	SpAir_D_U_Square
	SpAir_L_D_Square
	SpAir_L_R_Square
	SpAir_L_U_Square
	SpAir_R_D_Square
	SpAir_R_L_Square
	SpAir_R_U_Square
	SpAir_U_D_Square
	SpAir_U_L_Square
	SpAir_U_R_Square
]
special_trick_flip_key_combos = [
	SpAir_D_L_Square
	SpAir_D_R_Square
	SpAir_D_U_Square
	SpAir_L_D_Square
	SpAir_L_R_Square
	SpAir_L_U_Square
	SpAir_R_D_Square
	SpAir_R_L_Square
	SpAir_R_U_Square
	SpAir_U_D_Square
	SpAir_U_L_Square
	SpAir_U_R_Square
	SpAir_D_L_Circle
	SpAir_D_R_Circle
	SpAir_D_U_Circle
	SpAir_L_D_Circle
	SpAir_L_R_Circle
	SpAir_L_U_Circle
	SpAir_R_D_Circle
	SpAir_R_L_Circle
	SpAir_R_U_Circle
	SpAir_U_D_Circle
	SpAir_U_L_Circle
	SpAir_U_R_Circle
]
special_trick_grind_key_combos = [
	SpGrind_D_L_Triangle
	SpGrind_D_R_Triangle
	SpGrind_D_U_Triangle
	SpGrind_L_D_Triangle
	SpGrind_L_R_Triangle
	SpGrind_L_U_Triangle
	SpGrind_R_D_Triangle
	SpGrind_R_L_Triangle
	SpGrind_R_U_Triangle
	SpGrind_U_D_Triangle
	SpGrind_U_L_Triangle
	SpGrind_U_R_Triangle
]
special_trick_lip_key_combos = [
	SpLip_D_L_Triangle
	SpLip_D_R_Triangle
	SpLip_D_U_Triangle
	SpLip_L_D_Triangle
	SpLip_L_R_Triangle
	SpLip_L_U_Triangle
	SpLip_R_D_Triangle
	SpLip_R_L_Triangle
	SpLip_R_U_Triangle
	SpLip_U_D_Triangle
	SpLip_U_L_Triangle
	SpLip_U_R_Triangle
]
special_trick_manual_key_combos = [
	SpMan_D_L_Triangle
	SpMan_D_R_Triangle
	SpMan_D_U_Triangle
	SpMan_L_D_Triangle
	SpMan_L_R_Triangle
	SpMan_L_U_Triangle
	SpMan_R_D_Triangle
	SpMan_R_L_Triangle
	SpMan_R_U_Triangle
	SpMan_U_D_Triangle
	SpMan_U_L_Triangle
	SpMan_U_R_Triangle
]
ButtonCombos = {
	Air_CircleU = "\\b7 + \\b2"
	Air_CircleUR = "\\bd + \\b2"
	Air_CircleR = "\\b5 + \\b2"
	Air_CircleDR = "\\ba + \\b2"
	Air_CircleD = "\\b4 + \\b2"
	Air_CircleDL = "\\bc + \\b2"
	Air_CircleL = "\\b6 + \\b2"
	Air_CircleUL = "\\bb + \\b2"
	Air_U_U_Circle = "\\b7\\b7 + \\b2"
	Air_R_R_Circle = "\\b5\\b5 + \\b2"
	Air_D_D_Circle = "\\b4\\b4 + \\b2"
	Air_L_L_Circle = "\\b6\\b6 + \\b2"
	Air_SquareU = "\\b7 + \\b1"
	Air_SquareUR = "\\bd + \\b1"
	Air_SquareR = "\\b5 + \\b1"
	Air_SquareDR = "\\ba + \\b1"
	Air_SquareD = "\\b4 + \\b1"
	Air_SquareDL = "\\bc + \\b1"
	Air_SquareL = "\\b6 + \\b1"
	Air_SquareUL = "\\bb + \\b1"
	Air_U_U_Square = "\\b7\\b7 + \\b1"
	Air_R_R_Square = "\\b5\\b5 + \\b1"
	Air_D_D_Square = "\\b4\\b4 + \\b1"
	Air_L_L_Square = "\\b6\\b6 + \\b1"
	Lip_TriangleU = "\\b7 + \\b0"
	Lip_TriangleUR = "\\bd + \\b0"
	Lip_TriangleR = "\\b5 + \\b0"
	Lip_TriangleDR = "\\ba + \\b0"
	Lip_TriangleD = "\\b4 + \\b0"
	Lip_TriangleDL = "\\bc + \\b0"
	Lip_TriangleL = "\\b6 + \\b0"
	Lip_TriangleUL = "\\bb + \\b0"
}
specialcombos = {
	SpAir_D_L_Circle = "\\b4\\b6 + \\b2"
	SpAir_D_R_Circle = "\\b4\\b5 + \\b2"
	SpAir_D_U_Circle = "\\b4\\b7 + \\b2"
	SpAir_L_D_Circle = "\\b6\\b4 + \\b2"
	SpAir_L_R_Circle = "\\b6\\b5 + \\b2"
	SpAir_L_U_Circle = "\\b6\\b7 + \\b2"
	SpAir_R_D_Circle = "\\b5\\b4 + \\b2"
	SpAir_R_L_Circle = "\\b5\\b6 + \\b2"
	SpAir_R_U_Circle = "\\b5\\b7 + \\b2"
	SpAir_U_D_Circle = "\\b7\\b4 + \\b2"
	SpAir_U_L_Circle = "\\b7\\b6 + \\b2"
	SpAir_U_R_Circle = "\\b7\\b5 + \\b2"
	SpAir_D_L_Square = "\\b4\\b6 + \\b1"
	SpAir_D_R_Square = "\\b4\\b5 + \\b1"
	SpAir_D_U_Square = "\\b4\\b7 + \\b1"
	SpAir_L_D_Square = "\\b6\\b4 + \\b1"
	SpAir_L_R_Square = "\\b6\\b5 + \\b1"
	SpAir_L_U_Square = "\\b6\\b7 + \\b1"
	SpAir_R_D_Square = "\\b5\\b4 + \\b1"
	SpAir_R_L_Square = "\\b5\\b6 + \\b1"
	SpAir_R_U_Square = "\\b5\\b7 + \\b1"
	SpAir_U_D_Square = "\\b7\\b4 + \\b1"
	SpAir_U_L_Square = "\\b7\\b6 + \\b1"
	SpAir_U_R_Square = "\\b7\\b5 + \\b1"
	SpGrind_D_L_Triangle = "\\b4\\b6 + \\b0"
	SpGrind_D_R_Triangle = "\\b4\\b5 + \\b0"
	SpGrind_D_U_Triangle = "\\b4\\b7 + \\b0"
	SpGrind_L_D_Triangle = "\\b6\\b4 + \\b0"
	SpGrind_L_R_Triangle = "\\b6\\b5 + \\b0"
	SpGrind_L_U_Triangle = "\\b6\\b7 + \\b0"
	SpGrind_R_D_Triangle = "\\b5\\b4 + \\b0"
	SpGrind_R_L_Triangle = "\\b5\\b6 + \\b0"
	SpGrind_R_U_Triangle = "\\b5\\b7 + \\b0"
	SpGrind_U_D_Triangle = "\\b7\\b4 + \\b0"
	SpGrind_U_L_Triangle = "\\b7\\b6 + \\b0"
	SpGrind_U_R_Triangle = "\\b7\\b5 + \\b0"
	SpLip_D_L_Triangle = "\\b4\\b6 + \\b0"
	SpLip_D_R_Triangle = "\\b4\\b5 + \\b0"
	SpLip_D_U_Triangle = "\\b4\\b7 + \\b0"
	SpLip_L_D_Triangle = "\\b6\\b4 + \\b0"
	SpLip_L_R_Triangle = "\\b6\\b5 + \\b0"
	SpLip_L_U_Triangle = "\\b6\\b7 + \\b0"
	SpLip_R_D_Triangle = "\\b5\\b4 + \\b0"
	SpLip_R_L_Triangle = "\\b5\\b6 + \\b0"
	SpLip_R_U_Triangle = "\\b5\\b7 + \\b0"
	SpLip_U_D_Triangle = "\\b7\\b4 + \\b0"
	SpLip_U_L_Triangle = "\\b7\\b6 + \\b0"
	SpLip_U_R_Triangle = "\\b7\\b5 + \\b0"
	SpMan_D_L_Triangle = "\\b4\\b6 + \\b0"
	SpMan_D_R_Triangle = "\\b4\\b5 + \\b0"
	SpMan_D_U_Triangle = "\\b4\\b7 + \\b0"
	SpMan_L_D_Triangle = "\\b6\\b4 + \\b0"
	SpMan_L_R_Triangle = "\\b6\\b5 + \\b0"
	SpMan_L_U_Triangle = "\\b6\\b7 + \\b0"
	SpMan_R_D_Triangle = "\\b5\\b4 + \\b0"
	SpMan_R_L_Triangle = "\\b5\\b6 + \\b0"
	SpMan_R_U_Triangle = "\\b5\\b7 + \\b0"
	SpMan_U_D_Triangle = "\\b7\\b4 + \\b0"
	SpMan_U_L_Triangle = "\\b7\\b6 + \\b0"
	SpMan_U_R_Triangle = "\\b7\\b5 + \\b0"
}

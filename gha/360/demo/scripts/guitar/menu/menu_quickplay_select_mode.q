g_mqsm_created = 0
g_mqsm_do_flash = 1

script create_select_quickplay_mode 
	spawnscriptnow \{menu_music_on}
	if ($g_mqsm_created)
		return
	endif
	change \{g_mqsm_created = 1}
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = mqsm_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = spriteelement
		parent = mqsm_container
		texture = toprockers_poster
		pos = (740.0, 30.0)
		just = [
			right
			top
		]
		dims = (620.0, 620.0)
		z_priority = 1.2
		rot_angle = -3}
	text_params = {type = textblockelement line_spacing = 0.75 dims = (420.0, 100.0) font = text_a6 just = [center center] rot_angle = -3}
	createscreenelement {
		<text_params>
		parent = mqsm_container
		id = single_quickplay_text
		text = "SINGLE QUICKPLAY"
		rgba = (($g_menu_colors).violet_focus)
		pos = (432.0, 120.0)
		scale = 1.0
	}
	createscreenelement {
		<text_params>
		parent = mqsm_container
		id = coop_quickplay_text
		text = "MULTIPLAYER CO-OP"
		rgba = (($g_menu_colors).brown_unfocus)
		pos = (462.0, 593.0)
		scale = 0.7
	}
	new_menu \{scrollid = scrolling_select_quickplay_mode
		vmenuid = vmenu_select_quickplay_mode
		menu_pos = (640.0, 260.0)
		use_backdrop = 0
		exclusive_device = $primary_controller
		event_handlers = [
			{
				pad_back
				ui_flow_manager_respond_to_action
				params = {
					action = go_back
				}
			}
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
		]
		exclusive_device = $primary_controller}
	createscreenelement \{type = containerelement
		parent = vmenu_select_quickplay_mode
		dims = (100.0, 100.0)
		event_handlers = [
			{
				focus
				mqsm_focus
				params = {
					id = single_quickplay_text
				}
			}
			{
				unfocus
				mqsm_unfocus
				params = {
					id = single_quickplay_text
				}
			}
			{
				pad_choose
				ui_flow_manager_respond_to_action
				params = {
					action = select_p1_quickplay
				}
			}
		]
		exclusive_device = $primary_controller}
	createscreenelement \{type = containerelement
		parent = vmenu_select_quickplay_mode
		dims = (100.0, 100.0)
		event_handlers = [
			{
				focus
				mqsm_focus
				params = {
					id = coop_quickplay_text
				}
			}
			{
				unfocus
				mqsm_unfocus
				params = {
					id = coop_quickplay_text
				}
			}
			{
				pad_choose
				ui_flow_manager_respond_to_action
				params = {
					action = select_p2_quickplay
				}
			}
		]
		exclusive_device = $primary_controller}
	new_menu \{scrollid = scrolling_tr_select_difficulty_mode
		vmenuid = vmenu_tr_select_difficulty_mode
		menu_pos = (710.0, 200.0)
		use_backdrop = 0
		exclusive_device = $primary_controller
		internal_just = [
			left
			center
		]
		event_handlers = [
			{
				pad_back
				mqsm_unfocus_difficulty_menu
			}
			{
				pad_back
				ui_flow_manager_respond_to_action
				params = {
					action = go_back
				}
			}
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
		]
		exclusive_device = $primary_controller}
	<i> = 0
	<bar_pos> = (850.0, 243.0)
	begin
	formattext checksumname = bar_id 'bar_%i' i = <i>
	createscreenelement {
		type = spriteelement
		parent = mqsm_container
		id = <bar_id>
		texture = white
		rgba = (($g_menu_colors).dk_violet_bar)
		alpha = 0.7
		pos = <bar_pos>
		dims = (300.0, 40.0)
		z_priority = 1.2
	}
	<bar_pos> = (<bar_pos> + (0.0, 48.0))
	<i> = (<i> + 1)
	repeat 4
	text_params = {type = textelement parent = vmenu_tr_select_difficulty_mode scale = 1.0 font = text_a6 rgba = [150 150 150 100]}
	createscreenelement {
		<text_params>
		id = easy_text
		text = "EASY"
		event_handlers = [
			{focus mqsm_diff_highlight params = {index = 0 diff = 'easy'}}
			{unfocus mqsm_diff_unhighlight params = {index = 0 diff = 'easy'}}
			{pad_choose mqsm_selected_difficulty params = {diff = easy}}
		]
		exclusive_device = $primary_controller
	}
	createscreenelement {
		<text_params>
		id = medium_text
		text = "MEDIUM"
		event_handlers = [
			{focus mqsm_diff_highlight params = {index = 1 diff = 'medium'}}
			{unfocus mqsm_diff_unhighlight params = {index = 1 diff = 'medium'}}
			{pad_choose mqsm_selected_difficulty params = {diff = medium}}
		]
		exclusive_device = $primary_controller
	}
	createscreenelement {
		<text_params>
		id = hard_text
		text = "HARD"
		event_handlers = [
			{focus mqsm_diff_highlight params = {index = 2 diff = 'hard'}}
			{unfocus mqsm_diff_unhighlight params = {index = 2 diff = 'hard'}}
			{pad_choose mqsm_selected_difficulty params = {diff = hard}}
		]
		exclusive_device = $primary_controller
	}
	createscreenelement {
		<text_params>
		id = expert_text
		text = "EXPERT"
		event_handlers = [
			{focus mqsm_diff_highlight params = {index = 3 diff = 'expert'}}
			{unfocus mqsm_diff_unhighlight params = {index = 3 diff = 'expert'}}
			{pad_choose mqsm_selected_difficulty params = {diff = expert}}
		]
		exclusive_device = $primary_controller
	}
	launchevent \{type = unfocus
		target = vmenu_tr_select_difficulty_mode}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script mqsm_focus 
	if ($g_mqsm_do_flash)
		killspawnedscript \{name = mqsm_focus_flash}
		spawnscriptnow id = <id> mqsm_focus_flash params = {id = <id>}
	else
		doscreenelementmorph id = <id> rgba = (($g_menu_colors).lt_violet_bar) scale = 1.0 time = 0.15
	endif
endscript

script mqsm_focus_flash 
	<time> = 0.15
	begin
	doscreenelementmorph id = <id> rgba = (($g_menu_colors).lt_violet_bar) scale = 1.0 time = <time> motion = ease_out
	wait <time> seconds
	doscreenelementmorph id = <id> rgba = (($g_menu_colors).violet_focus) scale = 0.9 time = <time> motion = ease_in
	wait <time> seconds
	repeat
endscript

script mqsm_unfocus 
	doscreenelementmorph id = <id> rgba = (($g_menu_colors).brown_unfocus) scale = 0.7 time = 0.15
endscript

script mqsm_focus_difficulty_menu 
	launchevent \{type = unfocus
		target = vmenu_select_quickplay_mode}
	if ($g_mqsm_do_flash)
		killspawnedscript \{name = mqsm_focus_flash}
	endif
	if ($top_rockers_which_mode = p1_quickplay)
		doscreenelementmorph id = single_quickplay_text rgba = (($g_menu_colors).lt_violet_bar) scale = 1.0 time = 0.15
		doscreenelementmorph \{id = coop_quickplay_text
			alpha = 0.6
			time = 0.15}
	else
		doscreenelementmorph id = coop_quickplay_text rgba = (($g_menu_colors).lt_violet_bar) scale = 1.0 time = 0.15
		doscreenelementmorph \{id = single_quickplay_text
			alpha = 0.6
			time = 0.15}
	endif
	change \{g_mqsm_created = 1}
	time = 0.3
	<i> = 0
	begin
	formattext checksumname = bar_id 'bar_%i' i = <i>
	doscreenelementmorph id = <bar_id> rgba = (($g_menu_colors).dk_violet_bar) time = <time>
	<i> = (<i> + 1)
	repeat 4
	doscreenelementmorph id = easy_text rgba = (($g_menu_colors).white) time = <time>
	doscreenelementmorph id = medium_text rgba = (($g_menu_colors).white) time = <time>
	doscreenelementmorph id = hard_text rgba = (($g_menu_colors).white) time = <time>
	doscreenelementmorph id = expert_text rgba = (($g_menu_colors).white) time = <time>
	launchevent \{type = focus
		target = vmenu_tr_select_difficulty_mode}
endscript

script mqsm_unfocus_difficulty_menu 
	if NOT screenelementexists \{id = vmenu_tr_select_difficulty_mode}
		return
	endif
	launchevent \{type = unfocus
		target = vmenu_tr_select_difficulty_mode}
	doscreenelementmorph \{id = single_quickplay_text
		alpha = 1
		time = 0.15}
	doscreenelementmorph \{id = coop_quickplay_text
		alpha = 1
		time = 0.15}
	time = 0.3
	<i> = 0
	begin
	formattext checksumname = bar_id 'bar_%i' i = <i>
	doscreenelementmorph id = <bar_id> rgba = (($g_menu_colors).dk_violet_bar) time = <time>
	<i> = (<i> + 1)
	repeat 4
	doscreenelementmorph id = easy_text rgba = (($g_menu_colors).grey150) time = <time> alpha = 0.4
	doscreenelementmorph id = medium_text rgba = (($g_menu_colors).grey150) time = <time> alpha = 0.4
	doscreenelementmorph id = hard_text rgba = (($g_menu_colors).grey150) time = <time> alpha = 0.4
	doscreenelementmorph id = expert_text rgba = (($g_menu_colors).grey150) time = <time> alpha = 0.4
	launchevent \{type = focus
		target = vmenu_select_quickplay_mode}
endscript

script mqsm_diff_highlight 
	time = 0.2
	formattext checksumname = bar_id 'bar_%i' i = <index>
	formattext checksumname = text_id '%d_text' d = <diff>
	doscreenelementmorph id = <bar_id> rgba = (($g_menu_colors).lt_violet_bar) time = <time>
	doscreenelementmorph id = <text_id> rgba = (($g_menu_colors).violet_focus) time = <time>
endscript

script mqsm_diff_unhighlight 
	time = 0.2
	formattext checksumname = bar_id 'bar_%i' i = <index>
	formattext checksumname = text_id '%d_text' d = <diff>
	doscreenelementmorph id = <bar_id> rgba = (($g_menu_colors).dk_violet_bar) time = <time>
	doscreenelementmorph id = <text_id> rgba = (($g_menu_colors).white) time = <time>
endscript

script mqsm_selected_difficulty 
	change current_difficulty = <diff>
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script destroy_select_quickplay_mode 
	if ($g_mqsm_do_flash)
		killspawnedscript \{name = mqsm_focus_flash}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_select_quickplay_mode}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mqsm_container}
	destroy_menu \{menu_id = scrolling_tr_select_difficulty_mode}
	change \{g_mqsm_created = 0}
endscript

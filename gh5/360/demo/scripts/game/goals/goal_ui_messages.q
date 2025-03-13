hud_message_stack_order_right = [
	goal_viewport_viewport_element
	goal_ui_rank_info
	goal_ui_counter0
	goal_ui_counter1
	goal_ui_counter2
	goal_ui_counter3
	goal_ui_alert
]
hud_message_stack_order_left = [
	ui_show_progress_bar_anchor
	goal_arrow_element_shim
	goal_ui_instruction
	goal_ui_instruction2
]

script goal_ui_display_message 
	spawnscriptnow hud_message params = {<...>} id = goal_ui_scripts
endscript

script ui_display_message 
	if gotparam \{wait_time}
		if NOT (<wait_time> = 0.0)
			wait <wait_time> seconds ignoreslomo
		endif
	endif
	spawnscriptnow noqbid hud_message params = {<...>} id = goal_ui_scripts
endscript
hud_counter_ids = [
	goal_ui_counter0
	goal_ui_counter1
	goal_ui_counter2
	goal_ui_counter3
]
hud_counters_size = 4
hud_counter_bar_w = 100
hud_counter_bar_h = 14

script goal_create_counter \{separator = qs(0x8e590b97)
		hud_counter_caption = qs(0x5d027e99)
		initial_count = 0
		counter_index = 0
		is_bar = 0
		marker_array = [
			{
				number = 0
				color = `default`
			}
		]}
	if NOT cd
		getarraysize ($hud_counter_ids)
		if NOT (<array_size> = $hud_counters_size)
			softassert qs(0xf8205598) a = <array_size> s = ($hud_counters_size)
		endif
	endif
	if (<is_bar> = 1)
		if NOT gotparam \{color}
			<color> = greenlt
		endif
	endif
	spawnscriptnow {
		hud_message params = {
			type = counter
			meter_type = <meter_type>
			<...>
		}
		id = goal_ui_scripts
	}
endscript

script ui_messages_check_all_positions 
	begin
	if NOT getnextarrayelement ($hud_message_stack_order_right) index = <index>
		break
	endif
	ui_messages_check_position right id = <element>
	removeparameter \{element}
	repeat
	removeparameter \{index}
	begin
	if NOT getnextarrayelement $hud_message_stack_order_left index = <index>
		break
	endif
	ui_messages_check_position left id = <element>
	removeparameter \{element}
	repeat
endscript

script ui_messages_check_position 
	requireparams \{[
			id
		]
		all}
	if gotparam \{right}
		<array> = $hud_message_stack_order_right
	endif
	if gotparam \{left}
		<array> = $hud_message_stack_order_left
	endif
	if NOT gotparam \{array}
		softassert \{qs(0xfb1dd7da)}
	endif
	<padding> = (0.0, 10.0)
	<basepos> = (0.0, 0.0)
	begin
	if getnextarrayelement <array> index = <index>
		if checksumequals a = <id> b = <element>
			break
		endif
		if screenelementexists id = <element>
			getscreenelementdims id = <element>
			<basepos> = (<basepos> + <padding> + ((0.0, 1.0) * <height>))
		endif
	else
		break
	endif
	repeat
	if screenelementexists id = <id>
		legacydoscreenelementmorph id = <id> pos = <basepos> time = 0.1 motion = ease_out
	endif
	return pos = <basepos>
endscript

script goal_get_counter_info 
	requireparams \{[
			counter_index
		]
		all}
	if ((<counter_index> >= $hud_counters_size) || (<counter_index> < 0))
		softassert qs(0xc8fa418b) i = <counter_index>
		return
	endif
	<counter_id> = ($hud_counter_ids [<counter_index>])
	if NOT screenelementexists id = <counter_id>
		printf qs(0x77d4002d) d = <counter_id>
		return
	endif
	<counter_id> :getsingletag counter_info
	return counter_info = <counter_info>
endscript

script goal_set_counter_info 
	requireparams \{[
			counter_index
			params
		]
		all}
	if NOT gotparam \{counter_info}
		goal_get_counter_info counter_index = <counter_index>
		if NOT gotparam \{counter_info}
			return
		endif
	endif
	<counter_id> = ($hud_counter_ids [(<counter_index>)])
	<counter_id> :settags counter_info = {
		<counter_info>
		<params>
	}
endscript

script goal_update_counter \{counter_index = 0}
	goal_get_counter_info counter_index = <counter_index>
	if NOT gotparam \{counter_info}
		return
	endif
	if NOT screenelementexists id = (<counter_info>.element_id)
		softassert qs(0xa27a0735) d = (<counter_info>.element_id)
		return
	endif
	if gotparam \{number_collected}
		<num_collected> = <number_collected>
	endif
	if gotparam \{num_collected}
		goal_set_counter_info counter_info = <counter_info> counter_index = <counter_index> params = {number_collected = <num_collected>}
		goal_get_counter_info counter_index = <counter_index>
	endif
	switch <update_color>
		case greenlt
		<update_rgba> = [0 225 0 255]
		case green
		<update_rgba> = ($goal_career_ui_scheme.main)
		case bluedk
		<update_rgba> = [80 120 180 255]
		case bluelt
		<update_rgba> = [40 200 200 255]
		case violet
		<update_rgba> = ($goal_rigger_ui_scheme.main)
		case amber
		<update_rgba> = [180 140 60 255]
		case orange
		<update_rgba> = ($goal_hardcore_ui_scheme.main)
		case red
		<update_rgba> = ($goal_generic_ui_scheme.main)
		default
		<update_rgba> = [180 180 180 255]
	endswitch
	runscriptonscreenelement id = (<counter_info>.element_id) goal_update_counter_spawned params = (<...>)
endscript

script goal_update_counter_spawned 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if ((<counter_info>.is_bar) = 1)
		<total_number_float> = ((<counter_info>.total_number) * 1.0)
		<dims_for_width> = ($hud_counter_bar_w * ((<counter_info>.number_collected) / <total_number_float>))
		casttointeger \{dims_for_width}
		getscreenelementdims id = {(<counter_info>.element_id) child = bar}
		if (<width> < <dims_for_width>)
			addparams \{increase}
		endif
		if gotparam \{update_rgba}
			legacydoscreenelementmorph id = {(<counter_info>.element_id) child = bar} rgba = <update_rgba> time = 0.25
		endif
		<marker_array> = (<counter_info>.marker_array)
		getarraysize <marker_array>
		begin
		setscreenelementprops {
			id = {(<counter_info>.element_id) child = bar}
			dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * $hud_counter_bar_h))
		}
		<i> = 0
		begin
		legacydoscreenelementmorph {
			id = {(<counter_info>.element_id) child = {marker_container child = <i>}}
			alpha = 1.0
		}
		<x> = ($hud_counter_bar_w * (((<marker_array> [<i>]).number) / <total_number_float>))
		casttointeger \{x}
		if (<width> >= <x>)
			switch ((<marker_array> [<i>]).color)
				case greenlt
				<bar_rgba> = [0 225 0 255]
				case green
				<bar_rgba> = ($goal_career_ui_scheme.main)
				case bluedk
				<bar_rgba> = [80 120 180 255]
				case bluelt
				<bar_rgba> = [40 200 200 255]
				case violet
				<bar_rgba> = ($goal_rigger_ui_scheme.main)
				case amber
				<bar_rgba> = [180 140 60 255]
				case orange
				<bar_rgba> = ($goal_hardcore_ui_scheme.main)
				case red
				<bar_rgba> = ($goal_generic_ui_scheme.main)
				default
				<bar_rgba> = [180 180 180 255]
			endswitch
		endif
		if (<width> > <x>)
			legacydoscreenelementmorph {
				id = {(<counter_info>.element_id) child = {marker_container child = <i>}}
				alpha = 0.0
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if gotparam \{increase}
			<width> = (<width> + 1)
			if (<width> > <dims_for_width>)
				break
			endif
		else
			<width> = (<width> - 1)
			if (<width> < <dims_for_width>)
				break
			endif
		endif
		if NOT gotparam \{no_wait}
			wait \{1
				gameframe}
		endif
		repeat
		legacydoscreenelementmorph id = {(<counter_info>.element_id) child = bar} rgba = <bar_rgba> time = 0.25
	else
		formattext textname = counter_complete qs(0x646d1d57) a = (<counter_info>.number_collected) b = (<counter_info>.text)
		setscreenelementprops id = {(<counter_info>.element_id) child = text} text = <counter_complete>
	endif
	if screenelementexists id = {(<counter_info>.element_id) child = bar_bg}
		getscreenelementdims id = {(<counter_info>.element_id) child = bar_bg}
		<bar_h> = <height>
	else
		<bar_h> = 0
	endif
	getscreenelementdims id = {(<counter_info>.element_id) child = text}
	<height> = (<bar_h> + <height>)
	setscreenelementprops id = (<counter_info>.element_id) dims = ((0.0, 1.0) * <height> + (0.0, 10.0))
	if screenelementexists id = {(<counter_info>.element_id) child = bg}
		if screenelementexists id = {(<counter_info>.element_id) child = {bg child = bg}}
			destroyscreenelement id = {(<counter_info>.element_id) child = {bg child = bg}}
			destroyscreenelement id = {(<counter_info>.element_id) child = {bg child = shadow}}
		endif
	endif
	ui_messages_check_position right id = (<counter_info>.element_id)
endscript

script ui_kill_all_messages \{instant = 0}
	if screenelementexists \{id = goal_ui_instruction}
		ui_kill_message_hack \{id = goal_ui_instruction}
	endif
	if screenelementexists \{id = goal_ui_instruction2}
		ui_kill_message_hack \{id = goal_ui_instruction2}
	endif
	if screenelementexists \{id = goal_ui_alert_signpost}
		ui_kill_message_hack \{id = goal_ui_alert_signpost}
	endif
	if screenelementexists \{id = goal_ui_dialog}
		ui_kill_message_hack \{id = goal_ui_dialog}
	endif
	<i> = 0
	begin
	ui_kill_message_hack id = ($hud_counter_ids [<i>])
	<i> = (<i> + 1)
	repeat $hud_counters_size
	killspawnedscript \{name = goal_ui_morph_in_rank_info}
	if screenelementexists \{id = goal_ui_rank_info}
		goal_ui_rank_info :legacydomorph alpha = 0.0 time = <time>
		goal_ui_rank_info :die
	endif
	<wait_for_morph> = 0
	if screenelementexists \{id = goal_ui_alert}
		legacydoscreenelementmorph \{id = goal_ui_alert
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in}
		<wait_for_morph> = 1
	endif
	if screenelementexists \{id = goal_ui_alert_icon}
		legacydoscreenelementmorph \{id = goal_ui_alert_icon
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in}
		<wait_for_morph> = 1
	endif
	if screenelementexists \{id = ui_alert}
		legacydoscreenelementmorph \{id = ui_alert
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in
			pos = (-300.0, 300.0)}
		<wait_for_morph> = 1
	endif
	if screenelementexists \{id = ui_alert_uber}
		legacydoscreenelementmorph \{id = ui_alert_uber
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in}
		if screenelementexists \{id = ui_alert_uber_background}
			legacydoscreenelementmorph \{id = ui_alert_uber_background
				alpha = 0
				time = 0.1
				anim = ease_out}
		endif
		<wait_for_morph> = 1
	endif
	if screenelementexists \{id = goal_ui_alert}
		ui_kill_message_hack \{id = goal_ui_alert}
	endif
	if screenelementexists \{id = goal_ui_alert_icon}
		ui_kill_message_hack \{id = goal_ui_alert_icon}
	endif
	if screenelementexists \{id = ui_alert}
		ui_kill_message_hack \{id = ui_alert}
	endif
endscript

script ui_kill_message_hack 
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script goal_ui_kill_all_messages 
	killspawnedscript \{id = goal_ui_scripts}
	spawnscriptnow noqbid ui_kill_all_messages params = {<...>}
	spawnscriptnow \{noqbid
		goal_destroy_counter}
endscript

script ui_kill_message 
	switch <type>
		case alert_signpost
		ui_kill_message_hack \{id = ui_alert_signpost}
		case alert
		ui_kill_message_hack \{id = ui_alert}
		case counter
		if NOT gotparam \{counter_index}
			<counter_index> = 0
		endif
		ui_kill_message_hack id = ($hud_counter_ids [<counter_index>])
		case instruction
		ui_kill_message_hack \{id = goal_ui_instruction}
		case instruction_general
		ui_kill_message_hack \{id = goal_ui_instruction2}
		case alert_goal
		<i> = 0
		begin
		if screenelementexists id = ($hud_counter_ids [<i>])
			legacydoscreenelementmorph {
				id = ($hud_counter_ids [<i>])
				alpha = 1.0
				time = 0.25
			}
		endif
		<i> = (<i> + 1)
		repeat $hud_counters_size
		ui_kill_message_hack \{id = goal_ui_alert}
		ui_kill_message_hack \{id = goal_ui_alert_icon}
		case uberalert
		ui_kill_message_hack \{id = ui_alert_uber}
		ui_kill_message_hack \{id = ui_alert_uber_background}
		case dialog
		ui_kill_message_hack \{id = goal_ui_dialog}
		default
		softassert qs(0x4c67ba75) t = <type>
		ui_kill_message_hack \{id = goal_ui_alert}
	endswitch
	ui_messages_check_all_positions
endscript

script goal_ui_kill_message 
	spawnscriptnow ui_kill_message id = <type> params = {<...>}
endscript

script goal_destroy_counter 
	spawnscriptnow ui_kill_message params = {<...> type = counter}
endscript

script ui_alert_signpost_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert_signpost}
	endif
endscript

script ui_alert_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert}
	endif
endscript

script ui_alert_uber_script \{time = 1.0}
	gettags
	legacydomorph \{id = ui_alert_uber
		alpha = 1.0
		scale = 1.2
		relative_scale
		time = 0.25}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		legacydomorph \{id = ui_alert_uber
			scale = 1.0
			relative_scale
			alpha = 0
			time = 0.25}
		ui_kill_message \{type = uberalert}
	endif
endscript

script goal_ui_counter_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = counter}
	endif
endscript

script goal_ui_instruction_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	<id> :getsingletag no_fade
	if (<no_fade> = 0)
		legacydoscreenelementmorph id = {<id> child = text} alpha = 1.0 time = 0.25
	else
		legacydoscreenelementmorph id = {<id> child = text} alpha = 1.0
	endif
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		legacydomorph \{alpha = 0.0}
		ui_kill_message \{type = instruction}
	endif
endscript

script goal_ui_instruction2_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	<id> :getsingletag no_fade
	if (<no_fade> = 0)
		legacydoscreenelementmorph id = {<id> child = text} alpha = 1.0 time = 0.25
	else
		legacydoscreenelementmorph id = {<id> child = text} alpha = 1.0
	endif
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		legacydomorph \{alpha = 0.0}
		ui_kill_message \{type = instruction}
	endif
endscript

script goal_ui_alert_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert_goal}
	endif
endscript

script goal_ui_dialog_script \{time = 0}
	gettags
	legacydomorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = dialog}
	endif
endscript

script goal_ui_announce_state 
	printf \{'goal_ui_announce_state'}
	if screenelementexists \{id = goal_ui_announce_state_base_id}
		destroyscreenelement \{id = goal_ui_announce_state_base_id}
	endif
	createscreenelement \{type = containerelement
		parent = player_hud
		id = goal_ui_announce_state_base_id
		just = [
			left
			top
		]
		pos = (66.0, 340.0)
		alpha = 0}
	switch <state>
		case announce_skill
		ui_display_message \{type = alert_goal
			text = qs(0x61e0e92c)
			color = green
			icon = hud_message_overspray
			time = 5}
		case announce_line
		ui_display_message \{type = alert_goal
			text = qs(0x405fd381)
			color = green
			icon = hud_message_overspray
			time = 2}
		case announce_spot
		ui_display_message \{type = alert_goal
			text = qs(0xb3f12012)
			color = green
			icon = hud_message_overspray
			time = 2}
		case announce_graffiti
		ui_display_message \{type = alert_goal
			text = qs(0xbdf83828)
			color = green
			icon = hud_message_overspray
			time = 2}
		case am_possible
		ui_display_message \{type = alert_goal
			text = qs(0xe322071f)
			color = orange
			time = 3}
		case am_achieved
		ui_display_message \{type = alert_goal
			text = qs(0x67d47f96)
			color = orange
			time = 3}
		case am_success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			color = green
			time = 3
			has_background}
		ui_display_message \{type = alert_goal
			text = qs(0x9cc5466e)
			color = orange
			icon = icon_small_am
			time = 5}
		case pro_possible
		ui_display_message \{type = alert_goal
			text = qs(0x0560aae0)
			color = bluelt
			time = 5}
		case pro_achieved
		ui_display_message \{type = alert_goal
			text = qs(0x50b0e3d8)
			color = bluelt
			time = 3}
		case pro_success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			color = green
			time = 3
			has_background}
		ui_display_message \{type = alert_goal
			text = qs(0x71362a61)
			color = bluelt
			icon = icon_small_pro
			time = 5}
		case sick_possible
		ui_display_message \{type = alert_goal
			text = qs(0xe0a6972e)
			color = amber
			time = 5}
		case sick_achieved
		ui_display_message \{type = alert_goal
			text = qs(0xce2770a8)
			color = amber
			time = 3}
		case sick_success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			color = green
			time = 3
			has_background}
		ui_display_message \{type = alert_goal
			text = qs(0xc27db687)
			color = amber
			icon = icon_small_sick
			time = 5}
		case success_but_not_better_than_previous_grade
		ui_display_message \{type = instruction
			text = qs(0x9eb8c71b)
			time = 3}
		case success_but_already_achieved_sick
		ui_display_message \{type = instruction
			text = qs(0xa4452695)
			time = 3}
		case success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			color = green
			has_background}
		case failed_prompt_retry
		ui_display_message \{type = uberalert
			text = qs(0x5033bdb4)
			color = red
			has_background}
		case failed
		default
		ui_display_message \{type = uberalert
			text = qs(0x5033bdb4)
			color = red
			has_background}
	endswitch
endscript
goal_dialog_box_active = 0

script goal_dialog_box 
	change \{goal_dialog_box_active = 1}
	if gman_getactivatedgoalid
		gman_pausegoal goal = <activated_goal_id>
	endif
	pauseskaters
	skater :pausephysics
	create_dialog_box {
		title = <title>
		text = <text>
		buttons = [
			{
				text = qs(0xf3eac8b9)
				pad_choose_script = goal_dialog_box_ok
			}
		]
		no_helper_text
	}
	startrendering
	block \{type = event_dialog_ok}
	if gotparam \{activated_goal_id}
		gman_unpausegoal goal = <activated_goal_id>
	endif
	change \{goal_dialog_box_active = 0}
endscript

script goal_dialog_box_ok 
	dialog_box_exit
	unpauseskaters
	skater :unpausephysics
	broadcastevent \{type = event_dialog_ok}
endscript

script goal_ui_trick_stacker_num_remaining 
	gman_getdata \{goal = $trick_stacker_goal}
	getarraysize <trick_list>
	<tricks_remaining> = (<array_size> - 1)
	formattext textname = num_text '%t' t = <tricks_remaining>
	if screenelementexists \{id = goal_ui_trick_stacker_remaining}
		destroyscreenelement \{id = goal_ui_trick_stacker_remaining}
	endif
	createscreenelement {
		id = goal_ui_trick_stacker_remaining
		parent = player_hud
		type = textelement
		text = <num_text>
		font = text_a1
		pos = (500.0, 350.0)
		scale = 0.75
		just = [center center]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		not_focusable
	}
	begin
	block \{anytypes = [
			{
				type = event_trick_stacker_hide_num_remaining
			}
			{
				type = event_trick_stacker_show_num_remaining
			}
			{
				type = event_add_trick_approved
			}
		]}
	switch <event_type>
		case event_trick_stacker_hide_num_remaining
		goal_ui_trick_stacker_remaining :legacydomorph \{alpha = 0}
		case event_trick_stacker_show_num_remaining
		goal_ui_trick_stacker_remaining :legacydomorph \{alpha = 1}
		case event_add_trick_approved
		<tricks_remaining> = (<tricks_remaining> - 1)
		formattext textname = num_text '%t' t = <tricks_remaining>
		setscreenelementprops id = goal_ui_trick_stacker_remaining text = <num_text>
		if (<tricks_remaining> = 0)
			destroyscreenelement \{id = goal_ui_trick_stacker_remaining}
			break
		endif
	endswitch
	repeat
endscript

script goal_ui_trick_stacker_update 
	<trick_stacker_slots> = 6
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <id>
	formattext textname = element_text 'goal_ui_trick_stacker_%i' i = <id>
	switch <status>
		case add
		printf channel = ui '##### Add %e' e = <element_text>
		if NOT (<id> = 'crusher')
			goal_ui_trick_stacker_determine_pos
			<alpha> = 0
			<rot_angle> = -360
			<pointer_pos> = ((585.0, 0.0) + ((0.0, 1.0) * (<pos>.(0.0, 1.0))))
			legacydoscreenelementmorph id = ui_pointer pos = <pointer_pos> time = 0.3 anim = ease_in
		else
			<pos> = (500.0, 35.0)
			<alpha> = 1
			<rot_angle> = 0
		endif
		createscreenelement {
			id = <element>
			parent = player_hud
			type = textblockelement
			text = <trick_text>
			font = text_a1
			pos = (500.0, -50.0)
			dims = (315.0, 0.0)
			allow_expansion
			scale = 0.45000002
			just = [center center]
			rgba = <rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			not_focusable
			alpha = <alpha>
		}
		<element> :legacydomorph pos = <pos> time = 0.5 rot_angle = <rot_angle> alpha = 1
		soundevent \{event = stacker_sfx_add_trick}
		case pending
		printf channel = ui '##### Pending %e' e = <element_text>
		<element> :legacydomorph alpha = 0.3
		case remove
		printf channel = ui '##### Remove %e' e = <element_text>
		legacydoscreenelementmorph id = <element> scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in
		wait \{0.1
			seconds
			ignoreslomo}
		ui_kill_message_hack id = <element>
		broadcastevent \{type = event_trick_stacker_collapse_stack}
		case restore
		printf channel = ui '##### Restore %e' e = <element_text>
		<element> :legacydomorph alpha = 1.0
	endswitch
endscript

script goal_ui_trick_stacker_determine_pos \{base_pos = (500.0, 350.0)}
	gman_getdata \{goal = $trick_stacker_goal}
	getarraysize <trick_list>
	<pos> = <base_pos>
	<offset> = (0.0, -55.0)
	<current_id> = 0
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		<pos> = (<pos> + <offset>)
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	return pos = <pos>
endscript

script goal_ui_trick_stacker_collapse_stack \{base_pos = (500.0, 350.0)}
	begin
	block \{type = event_trick_stacker_collapse_stack}
	wait \{5
		gameframes}
	gman_getdata \{goal = $trick_stacker_goal}
	getarraysize <trick_list>
	<pos> = <base_pos>
	<offset> = (0.0, -55.0)
	<current_id> = 0
	printf \{channel = ui
		'----- goal_UI_trick_stacker_collapse_stack : processing...'}
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		printf channel = ui '----- moving element %i to pos %p' i = <current_id> p = <pos>
		legacydoscreenelementmorph id = <element> pos = <pos> time = 0.1 anim = ease_in
		<pos> = (<pos> + <offset>)
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	soundevent \{event = soundevent
		event = sk8_filmtricklandsfx}
	broadcastevent \{type = event_trick_stacker_show_num_remaining}
	<posy> = (<pos>.(0.0, 1.0))
	if (<posy> < 350)
		<pos> = (<pos> - <offset>)
	endif
	<pointer_pos> = ((585.0, 0.0) + ((0.0, 1.0) * (<pos>.(0.0, 1.0))))
	legacydoscreenelementmorph id = ui_pointer pos = <pointer_pos>
	repeat
endscript

script goal_ui_trick_stacker_crush_stack \{base_pos = (500.0, 500.0)}
	gman_getdata \{goal = $trick_stacker_goal}
	getarraysize <trick_list>
	<current_id> = <array_size>
	legacydoscreenelementmorph id = goal_ui_trick_stacker_crusher pos = <base_pos> time = 1 alpha = 1 anim = ease_out
	printf \{channel = ui
		'----- goal_UI_trick_stacker_drop_stack : processing...'}
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	formattext textname = element_text 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		printf channel = ui '%e crushed' e = <element_text>
		<pos> = (<base_pos> + ((1.0, 0.0) * (2 * (RandomInteger (-50.0, 50.0)))))
		<spin> = (2 * (RandomInteger (-360.0, 360.0)))
		legacydoscreenelementmorph id = <element> pos = <pos> time = 1 rot_angle = <spin> alpha = 0 anim = ease_out
		wait \{0.1
			seconds
			ignoreslomo}
	else
		printf channel = ui '%e does not exist' e = <element_text>
	endif
	<current_id> = (<current_id> - 1)
	repeat <array_size>
	broadcastevent \{type = event_drop_stack_complete}
endscript

script goal_ui_trick_stacker_die 
	gman_getdata \{goal = $trick_stacker_goal}
	getarraysize <trick_list>
	<current_id> = 0
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		destroyscreenelement id = <element>
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	if screenelementexists \{id = goal_ui_trick_stacker_crusher}
		destroyscreenelement \{id = goal_ui_trick_stacker_crusher}
	endif
	if screenelementexists \{id = mission_ui}
		destroyscreenelement \{id = mission_ui}
	endif
endscript

script goal_ui_announce_pending_grade 
	requireparams \{[
			goal
			grade
			mode
		]
		all}
	if (<grade> = 0)
		if NOT checksumequals a = <mode> b = fail
			softassert 'Unexpectedly showing %m ui for grade = 0.' m = <mode>
		endif
	endif
	switch <mode>
		case fail
		goal_ui_display_message \{type = uberalert
			color = red
			text = qs(0x4557b930)}
		case land_it
		goal_ui_display_message type = uberalert color = green text = <announcemsg>
		case got_it
		goal_ui_display_message type = uberalert color = green text = <announcemsg>
		default
		softassert 'Unknown mode %m' m = <mode>
	endswitch
endscript

script goal_ui_update_rank_info \{time = 0.1}
	if NOT screenelementexists \{id = goal_ui_rank_info}
		return
	endif
	spawnscriptnow goal_ui_update_rank_info_spawned params = {<...>}
endscript

script goal_ui_update_rank_info_spawned 
	getscreenelementdims \{id = goal_ui_rank_info}
	failed = none
	possible = none
	move_up = 0
	switch <state>
		case am_possible
		possible = am
		case pro_possible
		possible = pro
		case sick_possible
		possible = sick
		case am_achieved
		possible = am
		case pro_achieved
		possible = pro
		case sick_achieved
		possible = sick
		case am_success
		addparams \{done}
		case pro_success
		addparams \{done}
		case sick_success
		addparams \{done}
		case failed
		addparams \{done}
		case am_failed
		addparams \{done}
		failed = am
		case pro_failed
		failed = pro
		case sick_failed
		failed = sick
	endswitch
	goal_ui_rank_info :settags {
		title = <title>
		am_text = <am_text>
		pro_text = <pro_text>
		sick_text = <sick_text>
		am_current = <am_current>
		pro_current = <pro_current>
		sick_current = <sick_current>
		am_total = <am_total>
		pro_total = <pro_total>
		sick_total = <sick_total>
	}
	goal_ui_rank_info :gettags
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = title
		}}
	if screenelementexists id = <resolved_id>
		setscreenelementprops {
			id = {<resolved_id> child = text}
			text = <title>
		}
	endif
	removeparameter \{resolved_id}
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = am
		}}
	if screenelementexists id = <resolved_id>
		formattext textname = am_text <am_text> a = <am_current> b = <am_total>
		am_percent = ((<am_current> * 1.0) / (<am_total> * 1.0))
		setscreenelementprops {
			id = {<resolved_id> child = text}
			text = <am_text>
		}
		legacydoscreenelementmorph {
			id = {<resolved_id> child = bar}
			scale = (((1.0, 0.0) * <am_percent>) + (0.0, 1.0))
			relative_scale
			time = <time>
		}
		if (<failed> = am)
			<resolved_id> :legacydomorph {
				pos = {(300.0, 0.0) relative}
				time = <time>
			}
			<resolved_id> :die
			move_up = 1
			failed = pro
		endif
		if (<possible> = am)
			runscriptonscreenelement id = <resolved_id> goal_ui_rank_pulse
		endif
	endif
	removeparameter \{resolved_id}
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = pro
		}}
	if screenelementexists id = <resolved_id>
		formattext textname = pro_text <pro_text> a = <pro_current> b = <pro_total>
		pro_percent = ((<pro_current> * 1.0) / (<pro_total> * 1.0))
		setscreenelementprops {
			id = {<resolved_id> child = text}
			text = <pro_text>
		}
		legacydoscreenelementmorph {
			id = {<resolved_id> child = bar}
			scale = (((1.0, 0.0) * <pro_percent>) + (0.0, 1.0))
			relative_scale
			time = <time>
		}
		if NOT (<move_up> = 0)
			<resolved_id> :legacydomorph {
				pos = {((0.0, -35.0) * <move_up>) relative}
				time = (<time> * <move_up>)
			}
		endif
		if (<failed> = pro)
			<resolved_id> :legacydomorph {
				pos = {(300.0, 0.0) relative}
				time = <time>
			}
			<resolved_id> :die
			move_up = (<move_up> + 1)
			failed = sick
		endif
		if (<possible> = pro)
			runscriptonscreenelement id = <resolved_id> goal_ui_rank_pulse
		endif
	endif
	removeparameter \{resolved_id}
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = sick
		}}
	if screenelementexists id = <resolved_id>
		formattext textname = sick_text <sick_text> a = <sick_current> b = <sick_total>
		sick_percent = ((<sick_current> * 1.0) / (<sick_total> * 1.0))
		setscreenelementprops {
			id = {<resolved_id> child = text}
			text = <sick_text>
		}
		legacydoscreenelementmorph {
			id = {<resolved_id> child = bar}
			scale = (((1.0, 0.0) * <sick_percent>) + (0.0, 1.0))
			relative_scale
			time = <time>
		}
		if NOT (<move_up> = 0)
			<resolved_id> :legacydomorph {
				pos = {((0.0, -35.0) * <move_up>) relative}
				time = (<time> * <move_up>)
			}
		endif
		if (<failed> = sick)
			<resolved_id> :legacydomorph {
				pos = {(300.0, 0.0) relative}
				time = <time>
			}
			<resolved_id> :die
		endif
		if (<possible> = sick)
			runscriptonscreenelement id = <resolved_id> goal_ui_rank_pulse
		endif
	endif
	if gotparam \{done}
		killspawnedscript \{name = goal_ui_morph_in_rank_info}
		goal_ui_rank_info :legacydomorph alpha = 0.0 time = <time>
		goal_ui_rank_info :die
	endif
	if gotparam \{intro}
		spawnscriptnow \{goal_ui_morph_in_rank_info}
	endif
endscript

script goal_ui_morph_in_rank_info \{time = 0.1}
	goal_ui_rank_info :legacydomorph \{alpha = 0.0}
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = sick
		}}
	sick_id = <resolved_id>
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = pro
		}}
	pro_id = <resolved_id>
	resolvescreenelementid \{id = {
			goal_ui_rank_info
			child = am
		}}
	am_id = <resolved_id>
	<sick_id> :legacydomorph pos = {(300.0, -70.0) relative}
	<pro_id> :legacydomorph pos = {(300.0, -35.0) relative}
	<am_id> :legacydomorph pos = {(300.0, 0.0) relative}
	goal_ui_rank_info :legacydomorph alpha = 1.0 time = <time>
	<sick_id> :legacydomorph {
		pos = {(-300.0, 0.0) relative}
		time = <time>
	}
	<sick_id> :legacydomorph {
		pos = {((0.0, 35.0) * 2) relative}
		time = (<time> * 2)
	}
	<pro_id> :legacydomorph {
		pos = {(-300.0, 0.0) relative}
		time = <time>
	}
	<pro_id> :legacydomorph {
		pos = {(0.0, 35.0) relative}
		time = <time>
	}
	<am_id> :legacydomorph {
		pos = {(-300.0, 0.0) relative}
		time = <time>
	}
endscript

script goal_ui_rank_pulse \{time = 0.2}
	legacydomorph scale = 0.9 relative_scale time = (<time> / 2.0) motion = smooth
	begin
	legacydomorph scale = 1.1 relative_scale time = <time> motion = smooth
	legacydomorph scale = 0.9 relative_scale time = <time> motion = smooth
	repeat 4
	legacydomorph scale = 1.0 relative_scale time = (<time> / 2.0) motion = smooth
endscript

HUD_message_stack_order_right = [
	goal_viewport_viewport_element
	goal_ui_rank_info
	goal_ui_counter0
	goal_ui_counter1
	goal_ui_counter2
	goal_ui_counter3
	goal_ui_alert
]
HUD_message_stack_order_left = [
	ui_show_progress_bar_anchor
	goal_arrow_element_shim
	goal_ui_instruction
	goal_ui_instruction2
]

script goal_ui_display_message 
	spawnscriptnow HUD_message params = {<...>} id = goal_ui_scripts
endscript

script ui_display_message 
	if GotParam \{wait_time}
		if NOT (<wait_time> = 0.0)
			wait <wait_time> seconds ignoreslomo
		endif
	endif
	spawnscriptnow noqbid HUD_message params = {<...>} id = goal_ui_scripts
endscript
HUD_counter_ids = [
	goal_ui_counter0
	goal_ui_counter1
	goal_ui_counter2
	goal_ui_counter3
]
HUD_counters_size = 4
HUD_counter_bar_w = 100
HUD_counter_bar_h = 14

script goal_create_counter \{separator = qs(0x8e590b97)
		hud_counter_caption = qs(0x5d027e99)
		initial_count = 0
		counter_index = 0
		is_bar = 0
		marker_array = [
			{
				number = 0
				Color = Default
			}
		]}
	if NOT CD
		GetArraySize ($HUD_counter_ids)
		if NOT (<array_size> = $HUD_counters_size)
			softassert qs(0xf8205598) a = <array_size> s = ($HUD_counters_size)
		endif
	endif
	if (<is_bar> = 1)
		if NOT GotParam \{Color}
			<Color> = greenLt
		endif
	endif
	spawnscriptnow {
		HUD_message params = {
			type = counter
			meter_type = <meter_type>
			<...>
		}
		id = goal_ui_scripts
	}
endscript

script ui_messages_check_all_positions 
	begin
	if NOT GetNextArrayElement ($HUD_message_stack_order_right) index = <index>
		break
	endif
	ui_messages_check_position right id = <element>
	RemoveParameter \{element}
	repeat
	RemoveParameter \{index}
	begin
	if NOT GetNextArrayElement $HUD_message_stack_order_left index = <index>
		break
	endif
	ui_messages_check_position left id = <element>
	RemoveParameter \{element}
	repeat
endscript

script ui_messages_check_position 
	RequireParams \{[
			id
		]
		all}
	if GotParam \{right}
		<array> = $HUD_message_stack_order_right
	endif
	if GotParam \{left}
		<array> = $HUD_message_stack_order_left
	endif
	if NOT GotParam \{array}
		softassert \{qs(0xfb1dd7da)}
	endif
	<padding> = (0.0, 10.0)
	<basePos> = (0.0, 0.0)
	begin
	if GetNextArrayElement <array> index = <index>
		if checksumequals a = <id> b = <element>
			break
		endif
		if ScreenElementExists id = <element>
			GetScreenElementDims id = <element>
			<basePos> = (<basePos> + <padding> + ((0.0, 1.0) * <height>))
		endif
	else
		break
	endif
	repeat
	if ScreenElementExists id = <id>
		LegacyDoScreenElementMorph id = <id> Pos = <basePos> time = 0.1 motion = ease_out
	endif
	return Pos = <basePos>
endscript

script goal_get_counter_info 
	RequireParams \{[
			counter_index
		]
		all}
	if ((<counter_index> >= $HUD_counters_size) || (<counter_index> < 0))
		softassert qs(0xc8fa418b) i = <counter_index>
		return
	endif
	<counter_id> = ($HUD_counter_ids [<counter_index>])
	if NOT ScreenElementExists id = <counter_id>
		printf qs(0x77d4002d) d = <counter_id>
		return
	endif
	<counter_id> :GetSingleTag counter_info
	return counter_info = <counter_info>
endscript

script goal_set_counter_info 
	RequireParams \{[
			counter_index
			params
		]
		all}
	if NOT GotParam \{counter_info}
		goal_get_counter_info counter_index = <counter_index>
		if NOT GotParam \{counter_info}
			return
		endif
	endif
	<counter_id> = ($HUD_counter_ids [(<counter_index>)])
	<counter_id> :SetTags counter_info = {
		<counter_info>
		<params>
	}
endscript

script goal_update_counter \{counter_index = 0}
	goal_get_counter_info counter_index = <counter_index>
	if NOT GotParam \{counter_info}
		return
	endif
	if NOT ScreenElementExists id = (<counter_info>.element_id)
		softassert qs(0xa27a0735) d = (<counter_info>.element_id)
		return
	endif
	if GotParam \{number_collected}
		<num_collected> = <number_collected>
	endif
	if GotParam \{num_collected}
		goal_set_counter_info counter_info = <counter_info> counter_index = <counter_index> params = {number_collected = <num_collected>}
		goal_get_counter_info counter_index = <counter_index>
	endif
	switch <update_color>
		case greenLt
		<update_rgba> = [0 225 0 255]
		case green
		<update_rgba> = ($goal_career_ui_scheme.main)
		case blueDk
		<update_rgba> = [80 120 180 255]
		case blueLt
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
	RunScriptOnScreenElement id = (<counter_info>.element_id) goal_update_counter_spawned params = (<...>)
endscript

script goal_update_counter_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ((<counter_info>.is_bar) = 1)
		<total_number_float> = ((<counter_info>.total_number) * 1.0)
		<dims_for_width> = ($HUD_counter_bar_w * ((<counter_info>.number_collected) / <total_number_float>))
		CastToInteger \{dims_for_width}
		GetScreenElementDims id = {(<counter_info>.element_id) child = bar}
		if (<width> < <dims_for_width>)
			AddParams \{increase}
		endif
		if GotParam \{update_rgba}
			LegacyDoScreenElementMorph id = {(<counter_info>.element_id) child = bar} rgba = <update_rgba> time = 0.25
		endif
		<marker_array> = (<counter_info>.marker_array)
		GetArraySize <marker_array>
		begin
		SetScreenElementProps {
			id = {(<counter_info>.element_id) child = bar}
			dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * $HUD_counter_bar_h))
		}
		<i> = 0
		begin
		LegacyDoScreenElementMorph {
			id = {(<counter_info>.element_id) child = {marker_container child = <i>}}
			alpha = 1.0
		}
		<x> = ($HUD_counter_bar_w * (((<marker_array> [<i>]).number) / <total_number_float>))
		CastToInteger \{x}
		if (<width> >= <x>)
			switch ((<marker_array> [<i>]).Color)
				case greenLt
				<bar_rgba> = [0 225 0 255]
				case green
				<bar_rgba> = ($goal_career_ui_scheme.main)
				case blueDk
				<bar_rgba> = [80 120 180 255]
				case blueLt
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
			LegacyDoScreenElementMorph {
				id = {(<counter_info>.element_id) child = {marker_container child = <i>}}
				alpha = 0.0
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if GotParam \{increase}
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
		if NOT GotParam \{no_wait}
			wait \{1
				gameframe}
		endif
		repeat
		LegacyDoScreenElementMorph id = {(<counter_info>.element_id) child = bar} rgba = <bar_rgba> time = 0.25
	else
		FormatText TextName = counter_complete qs(0x646d1d57) a = (<counter_info>.number_collected) b = (<counter_info>.text)
		SetScreenElementProps id = {(<counter_info>.element_id) child = text} text = <counter_complete>
	endif
	if ScreenElementExists id = {(<counter_info>.element_id) child = bar_bg}
		GetScreenElementDims id = {(<counter_info>.element_id) child = bar_bg}
		<bar_h> = <height>
	else
		<bar_h> = 0
	endif
	GetScreenElementDims id = {(<counter_info>.element_id) child = text}
	<height> = (<bar_h> + <height>)
	SetScreenElementProps id = (<counter_info>.element_id) dims = ((0.0, 1.0) * <height> + (0.0, 10.0))
	if ScreenElementExists id = {(<counter_info>.element_id) child = Bg}
		if ScreenElementExists id = {(<counter_info>.element_id) child = {Bg child = Bg}}
			DestroyScreenElement id = {(<counter_info>.element_id) child = {Bg child = Bg}}
			DestroyScreenElement id = {(<counter_info>.element_id) child = {Bg child = shadow}}
		endif
	endif
	ui_messages_check_position right id = (<counter_info>.element_id)
endscript

script ui_kill_all_messages \{instant = 0}
	if ScreenElementExists \{id = goal_ui_instruction}
		ui_kill_message_hack \{id = goal_ui_instruction}
	endif
	if ScreenElementExists \{id = goal_ui_instruction2}
		ui_kill_message_hack \{id = goal_ui_instruction2}
	endif
	if ScreenElementExists \{id = goal_ui_alert_signpost}
		ui_kill_message_hack \{id = goal_ui_alert_signpost}
	endif
	if ScreenElementExists \{id = goal_ui_dialog}
		ui_kill_message_hack \{id = goal_ui_dialog}
	endif
	<i> = 0
	begin
	ui_kill_message_hack id = ($HUD_counter_ids [<i>])
	<i> = (<i> + 1)
	repeat $HUD_counters_size
	killspawnedscript \{name = goal_ui_morph_in_rank_info}
	if ScreenElementExists \{id = goal_ui_rank_info}
		goal_ui_rank_info :LegacyDoMorph alpha = 0.0 time = <time>
		goal_ui_rank_info :Die
	endif
	<wait_for_morph> = 0
	if ScreenElementExists \{id = goal_ui_alert}
		LegacyDoScreenElementMorph \{id = goal_ui_alert
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in}
		<wait_for_morph> = 1
	endif
	if ScreenElementExists \{id = goal_ui_alert_icon}
		LegacyDoScreenElementMorph \{id = goal_ui_alert_icon
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in}
		<wait_for_morph> = 1
	endif
	if ScreenElementExists \{id = ui_alert}
		LegacyDoScreenElementMorph \{id = ui_alert
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in
			Pos = (-300.0, 300.0)}
		<wait_for_morph> = 1
	endif
	if ScreenElementExists \{id = ui_alert_uber}
		LegacyDoScreenElementMorph \{id = ui_alert_uber
			scale = (2.5, 0.0)
			alpha = 0
			time = 0.1
			anim = ease_in}
		if ScreenElementExists \{id = ui_alert_uber_background}
			LegacyDoScreenElementMorph \{id = ui_alert_uber_background
				alpha = 0
				time = 0.1
				anim = ease_out}
		endif
		<wait_for_morph> = 1
	endif
	if ScreenElementExists \{id = goal_ui_alert}
		ui_kill_message_hack \{id = goal_ui_alert}
	endif
	if ScreenElementExists \{id = goal_ui_alert_icon}
		ui_kill_message_hack \{id = goal_ui_alert_icon}
	endif
	if ScreenElementExists \{id = ui_alert}
		ui_kill_message_hack \{id = ui_alert}
	endif
endscript

script ui_kill_message_hack 
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
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
		if NOT GotParam \{counter_index}
			<counter_index> = 0
		endif
		ui_kill_message_hack id = ($HUD_counter_ids [<counter_index>])
		case instruction
		ui_kill_message_hack \{id = goal_ui_instruction}
		case instruction_general
		ui_kill_message_hack \{id = goal_ui_instruction2}
		case alert_goal
		<i> = 0
		begin
		if ScreenElementExists id = ($HUD_counter_ids [<i>])
			LegacyDoScreenElementMorph {
				id = ($HUD_counter_ids [<i>])
				alpha = 1.0
				time = 0.25
			}
		endif
		<i> = (<i> + 1)
		repeat $HUD_counters_size
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
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert_signpost}
	endif
endscript

script ui_alert_script \{time = 0}
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert}
	endif
endscript

script ui_alert_uber_script \{time = 1.0}
	GetTags
	LegacyDoMorph \{id = ui_alert_uber
		alpha = 1.0
		scale = 1.2
		relative_scale
		time = 0.25}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		LegacyDoMorph \{id = ui_alert_uber
			scale = 1.0
			relative_scale
			alpha = 0
			time = 0.25}
		ui_kill_message \{type = uberalert}
	endif
endscript

script goal_ui_counter_script \{time = 0}
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = counter}
	endif
endscript

script goal_ui_instruction_script \{time = 0}
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	<id> :GetSingleTag no_fade
	if (<no_fade> = 0)
		LegacyDoScreenElementMorph id = {<id> child = text} alpha = 1.0 time = 0.25
	else
		LegacyDoScreenElementMorph id = {<id> child = text} alpha = 1.0
	endif
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		LegacyDoMorph \{alpha = 0.0}
		ui_kill_message \{type = instruction}
	endif
endscript

script goal_ui_instruction2_script \{time = 0}
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	<id> :GetSingleTag no_fade
	if (<no_fade> = 0)
		LegacyDoScreenElementMorph id = {<id> child = text} alpha = 1.0 time = 0.25
	else
		LegacyDoScreenElementMorph id = {<id> child = text} alpha = 1.0
	endif
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		LegacyDoMorph \{alpha = 0.0}
		ui_kill_message \{type = instruction}
	endif
endscript

script goal_ui_alert_script \{time = 0}
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert_goal}
	endif
endscript

script goal_ui_dialog_script \{time = 0}
	GetTags
	LegacyDoMorph \{alpha = 1.0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = dialog}
	endif
endscript

script goal_ui_announce_state 
	printf \{'goal_ui_announce_state'}
	if ScreenElementExists \{id = goal_ui_announce_state_base_id}
		DestroyScreenElement \{id = goal_ui_announce_state_base_id}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = player_hud
		id = goal_ui_announce_state_base_id
		just = [
			left
			top
		]
		Pos = (66.0, 340.0)
		alpha = 0}
	switch <state>
		case announce_skill
		ui_display_message \{type = alert_goal
			text = qs(0x61e0e92c)
			Color = green
			icon = HUD_message_overspray
			time = 5}
		case announce_line
		ui_display_message \{type = alert_goal
			text = qs(0x405fd381)
			Color = green
			icon = HUD_message_overspray
			time = 2}
		case announce_spot
		ui_display_message \{type = alert_goal
			text = qs(0xb3f12012)
			Color = green
			icon = HUD_message_overspray
			time = 2}
		case announce_graffiti
		ui_display_message \{type = alert_goal
			text = qs(0xbdf83828)
			Color = green
			icon = HUD_message_overspray
			time = 2}
		case am_possible
		ui_display_message \{type = alert_goal
			text = qs(0xe322071f)
			Color = orange
			time = 3}
		case am_achieved
		ui_display_message \{type = alert_goal
			text = qs(0x67d47f96)
			Color = orange
			time = 3}
		case am_success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			Color = green
			time = 3
			has_background}
		ui_display_message \{type = alert_goal
			text = qs(0x9cc5466e)
			Color = orange
			icon = icon_small_am
			time = 5}
		case pro_possible
		ui_display_message \{type = alert_goal
			text = qs(0x0560aae0)
			Color = blueLt
			time = 5}
		case pro_achieved
		ui_display_message \{type = alert_goal
			text = qs(0x50b0e3d8)
			Color = blueLt
			time = 3}
		case pro_success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			Color = green
			time = 3
			has_background}
		ui_display_message \{type = alert_goal
			text = qs(0x71362a61)
			Color = blueLt
			icon = icon_small_pro
			time = 5}
		case sick_possible
		ui_display_message \{type = alert_goal
			text = qs(0xe0a6972e)
			Color = amber
			time = 5}
		case sick_achieved
		ui_display_message \{type = alert_goal
			text = qs(0xce2770a8)
			Color = amber
			time = 3}
		case sick_success
		ui_display_message \{type = uberalert
			text = qs(0x9e5f587a)
			Color = green
			time = 3
			has_background}
		ui_display_message \{type = alert_goal
			text = qs(0xc27db687)
			Color = amber
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
			Color = green
			has_background}
		case failed_prompt_retry
		ui_display_message \{type = uberalert
			text = qs(0x5033bdb4)
			Color = red
			has_background}
		case failed
		default
		ui_display_message \{type = uberalert
			text = qs(0x5033bdb4)
			Color = red
			has_background}
	endswitch
endscript
goal_dialog_box_active = 0

script goal_dialog_box 
	Change \{goal_dialog_box_active = 1}
	if Gman_GetActivatedGoalId
		GMan_PauseGoal goal = <activated_goal_id>
	endif
	pauseskaters
	skater :PausePhysics
	create_dialog_box {
		Title = <Title>
		text = <text>
		buttons = [
			{
				text = qs(0xf3eac8b9)
				pad_choose_script = goal_dialog_box_ok
			}
		]
		no_helper_text
	}
	StartRendering
	Block \{type = event_dialog_ok}
	if GotParam \{activated_goal_id}
		GMan_UnPauseGoal goal = <activated_goal_id>
	endif
	Change \{goal_dialog_box_active = 0}
endscript

script goal_dialog_box_ok 
	dialog_box_exit
	unpauseskaters
	skater :UnPausePhysics
	broadcastevent \{type = event_dialog_ok}
endscript

script goal_UI_trick_stacker_num_remaining 
	GMan_GetData \{goal = $trick_stacker_goal}
	GetArraySize <trick_list>
	<tricks_remaining> = (<array_size> - 1)
	FormatText TextName = num_text '%t' t = <tricks_remaining>
	if ScreenElementExists \{id = goal_ui_trick_stacker_remaining}
		DestroyScreenElement \{id = goal_ui_trick_stacker_remaining}
	endif
	CreateScreenElement {
		id = goal_ui_trick_stacker_remaining
		parent = player_hud
		type = TextElement
		text = <num_text>
		font = text_a1
		Pos = (500.0, 350.0)
		scale = 0.75
		just = [center center]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		not_focusable
	}
	begin
	Block \{anytypes = [
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
		goal_ui_trick_stacker_remaining :LegacyDoMorph \{alpha = 0}
		case event_trick_stacker_show_num_remaining
		goal_ui_trick_stacker_remaining :LegacyDoMorph \{alpha = 1}
		case event_add_trick_approved
		<tricks_remaining> = (<tricks_remaining> - 1)
		FormatText TextName = num_text '%t' t = <tricks_remaining>
		SetScreenElementProps id = goal_ui_trick_stacker_remaining text = <num_text>
		if (<tricks_remaining> = 0)
			DestroyScreenElement \{id = goal_ui_trick_stacker_remaining}
			break
		endif
	endswitch
	repeat
endscript

script goal_UI_trick_stacker_update 
	<trick_stacker_slots> = 6
	FormatText checksumname = element 'goal_ui_trick_stacker_%i' i = <id>
	FormatText TextName = element_text 'goal_ui_trick_stacker_%i' i = <id>
	switch <status>
		case add
		printf channel = ui '##### Add %e' e = <element_text>
		if NOT (<id> = 'crusher')
			goal_UI_trick_stacker_determine_pos
			<alpha> = 0
			<rot_angle> = -360
			<pointer_pos> = ((585.0, 0.0) + ((0.0, 1.0) * (<Pos>.(0.0, 1.0))))
			LegacyDoScreenElementMorph id = ui_pointer Pos = <pointer_pos> time = 0.3 anim = ease_in
		else
			<Pos> = (500.0, 35.0)
			<alpha> = 1
			<rot_angle> = 0
		endif
		CreateScreenElement {
			id = <element>
			parent = player_hud
			type = TextBlockElement
			text = <trick_text>
			font = text_a1
			Pos = (500.0, -50.0)
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
		<element> :LegacyDoMorph Pos = <Pos> time = 0.5 rot_angle = <rot_angle> alpha = 1
		SoundEvent \{event = Stacker_SFX_Add_Trick}
		case pending
		printf channel = ui '##### Pending %e' e = <element_text>
		<element> :LegacyDoMorph alpha = 0.3
		case remove
		printf channel = ui '##### Remove %e' e = <element_text>
		LegacyDoScreenElementMorph id = <element> scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in
		wait \{0.1
			seconds
			ignoreslomo}
		ui_kill_message_hack id = <element>
		broadcastevent \{type = event_trick_stacker_collapse_stack}
		case restore
		printf channel = ui '##### Restore %e' e = <element_text>
		<element> :LegacyDoMorph alpha = 1.0
	endswitch
endscript

script goal_UI_trick_stacker_determine_pos \{base_pos = (500.0, 350.0)}
	GMan_GetData \{goal = $trick_stacker_goal}
	GetArraySize <trick_list>
	<Pos> = <base_pos>
	<offset> = (0.0, -55.0)
	<current_id> = 0
	begin
	FormatText checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if ScreenElementExists id = <element>
		<Pos> = (<Pos> + <offset>)
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	return Pos = <Pos>
endscript

script goal_UI_trick_stacker_collapse_stack \{base_pos = (500.0, 350.0)}
	begin
	Block \{type = event_trick_stacker_collapse_stack}
	wait \{5
		gameframes}
	GMan_GetData \{goal = $trick_stacker_goal}
	GetArraySize <trick_list>
	<Pos> = <base_pos>
	<offset> = (0.0, -55.0)
	<current_id> = 0
	printf \{channel = ui
		'----- goal_UI_trick_stacker_collapse_stack : processing...'}
	begin
	FormatText checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if ScreenElementExists id = <element>
		printf channel = ui '----- moving element %i to pos %p' i = <current_id> p = <Pos>
		LegacyDoScreenElementMorph id = <element> Pos = <Pos> time = 0.1 anim = ease_in
		<Pos> = (<Pos> + <offset>)
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	SoundEvent \{event = SoundEvent
		event = sk8_FilmTrickLandSFX}
	broadcastevent \{type = event_trick_stacker_show_num_remaining}
	<posy> = (<Pos>.(0.0, 1.0))
	if (<posy> < 350)
		<Pos> = (<Pos> - <offset>)
	endif
	<pointer_pos> = ((585.0, 0.0) + ((0.0, 1.0) * (<Pos>.(0.0, 1.0))))
	LegacyDoScreenElementMorph id = ui_pointer Pos = <pointer_pos>
	repeat
endscript

script goal_UI_trick_stacker_crush_stack \{base_pos = (500.0, 500.0)}
	GMan_GetData \{goal = $trick_stacker_goal}
	GetArraySize <trick_list>
	<current_id> = <array_size>
	LegacyDoScreenElementMorph id = goal_ui_trick_stacker_crusher Pos = <base_pos> time = 1 alpha = 1 anim = ease_out
	printf \{channel = ui
		'----- goal_UI_trick_stacker_drop_stack : processing...'}
	begin
	FormatText checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	FormatText TextName = element_text 'goal_ui_trick_stacker_%i' i = <current_id>
	if ScreenElementExists id = <element>
		printf channel = ui '%e crushed' e = <element_text>
		<Pos> = (<base_pos> + ((1.0, 0.0) * (2 * (RandomInteger (-50.0, 50.0)))))
		<spin> = (2 * (RandomInteger (-360.0, 360.0)))
		LegacyDoScreenElementMorph id = <element> Pos = <Pos> time = 1 rot_angle = <spin> alpha = 0 anim = ease_out
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

script goal_UI_trick_stacker_die 
	GMan_GetData \{goal = $trick_stacker_goal}
	GetArraySize <trick_list>
	<current_id> = 0
	begin
	FormatText checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if ScreenElementExists id = <element>
		DestroyScreenElement id = <element>
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	if ScreenElementExists \{id = goal_ui_trick_stacker_crusher}
		DestroyScreenElement \{id = goal_ui_trick_stacker_crusher}
	endif
	if ScreenElementExists \{id = mission_UI}
		DestroyScreenElement \{id = mission_UI}
	endif
endscript

script goal_ui_announce_pending_grade 
	RequireParams \{[
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
			Color = red
			text = qs(0x4557b930)}
		case land_it
		goal_ui_display_message type = uberalert Color = green text = <announceMsg>
		case got_it
		goal_ui_display_message type = uberalert Color = green text = <announceMsg>
		default
		softassert 'Unknown mode %m' m = <mode>
	endswitch
endscript

script goal_ui_update_rank_info \{time = 0.1}
	if NOT ScreenElementExists \{id = goal_ui_rank_info}
		return
	endif
	spawnscriptnow goal_ui_update_rank_info_spawned params = {<...>}
endscript

script goal_ui_update_rank_info_spawned 
	GetScreenElementDims \{id = goal_ui_rank_info}
	failed = None
	possible = None
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
		AddParams \{done}
		case pro_success
		AddParams \{done}
		case sick_success
		AddParams \{done}
		case failed
		AddParams \{done}
		case am_failed
		AddParams \{done}
		failed = am
		case pro_failed
		failed = pro
		case sick_failed
		failed = sick
	endswitch
	goal_ui_rank_info :SetTags {
		Title = <Title>
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
	goal_ui_rank_info :GetTags
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = Title
		}}
	if ScreenElementExists id = <resolved_id>
		SetScreenElementProps {
			id = {<resolved_id> child = text}
			text = <Title>
		}
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = am
		}}
	if ScreenElementExists id = <resolved_id>
		FormatText TextName = am_text <am_text> a = <am_current> b = <am_total>
		am_percent = ((<am_current> * 1.0) / (<am_total> * 1.0))
		SetScreenElementProps {
			id = {<resolved_id> child = text}
			text = <am_text>
		}
		LegacyDoScreenElementMorph {
			id = {<resolved_id> child = bar}
			scale = (((1.0, 0.0) * <am_percent>) + (0.0, 1.0))
			relative_scale
			time = <time>
		}
		if (<failed> = am)
			<resolved_id> :LegacyDoMorph {
				Pos = {(300.0, 0.0) relative}
				time = <time>
			}
			<resolved_id> :Die
			move_up = 1
			failed = pro
		endif
		if (<possible> = am)
			RunScriptOnScreenElement id = <resolved_id> goal_ui_rank_pulse
		endif
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = pro
		}}
	if ScreenElementExists id = <resolved_id>
		FormatText TextName = pro_text <pro_text> a = <pro_current> b = <pro_total>
		pro_percent = ((<pro_current> * 1.0) / (<pro_total> * 1.0))
		SetScreenElementProps {
			id = {<resolved_id> child = text}
			text = <pro_text>
		}
		LegacyDoScreenElementMorph {
			id = {<resolved_id> child = bar}
			scale = (((1.0, 0.0) * <pro_percent>) + (0.0, 1.0))
			relative_scale
			time = <time>
		}
		if NOT (<move_up> = 0)
			<resolved_id> :LegacyDoMorph {
				Pos = {((0.0, -35.0) * <move_up>) relative}
				time = (<time> * <move_up>)
			}
		endif
		if (<failed> = pro)
			<resolved_id> :LegacyDoMorph {
				Pos = {(300.0, 0.0) relative}
				time = <time>
			}
			<resolved_id> :Die
			move_up = (<move_up> + 1)
			failed = sick
		endif
		if (<possible> = pro)
			RunScriptOnScreenElement id = <resolved_id> goal_ui_rank_pulse
		endif
	endif
	RemoveParameter \{resolved_id}
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = sick
		}}
	if ScreenElementExists id = <resolved_id>
		FormatText TextName = sick_text <sick_text> a = <sick_current> b = <sick_total>
		sick_percent = ((<sick_current> * 1.0) / (<sick_total> * 1.0))
		SetScreenElementProps {
			id = {<resolved_id> child = text}
			text = <sick_text>
		}
		LegacyDoScreenElementMorph {
			id = {<resolved_id> child = bar}
			scale = (((1.0, 0.0) * <sick_percent>) + (0.0, 1.0))
			relative_scale
			time = <time>
		}
		if NOT (<move_up> = 0)
			<resolved_id> :LegacyDoMorph {
				Pos = {((0.0, -35.0) * <move_up>) relative}
				time = (<time> * <move_up>)
			}
		endif
		if (<failed> = sick)
			<resolved_id> :LegacyDoMorph {
				Pos = {(300.0, 0.0) relative}
				time = <time>
			}
			<resolved_id> :Die
		endif
		if (<possible> = sick)
			RunScriptOnScreenElement id = <resolved_id> goal_ui_rank_pulse
		endif
	endif
	if GotParam \{done}
		killspawnedscript \{name = goal_ui_morph_in_rank_info}
		goal_ui_rank_info :LegacyDoMorph alpha = 0.0 time = <time>
		goal_ui_rank_info :Die
	endif
	if GotParam \{intro}
		spawnscriptnow \{goal_ui_morph_in_rank_info}
	endif
endscript

script goal_ui_morph_in_rank_info \{time = 0.1}
	goal_ui_rank_info :LegacyDoMorph \{alpha = 0.0}
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = sick
		}}
	sick_id = <resolved_id>
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = pro
		}}
	pro_id = <resolved_id>
	ResolveScreenElementID \{id = {
			goal_ui_rank_info
			child = am
		}}
	am_id = <resolved_id>
	<sick_id> :LegacyDoMorph Pos = {(300.0, -70.0) relative}
	<pro_id> :LegacyDoMorph Pos = {(300.0, -35.0) relative}
	<am_id> :LegacyDoMorph Pos = {(300.0, 0.0) relative}
	goal_ui_rank_info :LegacyDoMorph alpha = 1.0 time = <time>
	<sick_id> :LegacyDoMorph {
		Pos = {(-300.0, 0.0) relative}
		time = <time>
	}
	<sick_id> :LegacyDoMorph {
		Pos = {((0.0, 35.0) * 2) relative}
		time = (<time> * 2)
	}
	<pro_id> :LegacyDoMorph {
		Pos = {(-300.0, 0.0) relative}
		time = <time>
	}
	<pro_id> :LegacyDoMorph {
		Pos = {(0.0, 35.0) relative}
		time = <time>
	}
	<am_id> :LegacyDoMorph {
		Pos = {(-300.0, 0.0) relative}
		time = <time>
	}
endscript

script goal_ui_rank_pulse \{time = 0.2}
	LegacyDoMorph scale = 0.9 relative_scale time = (<time> / 2.0) motion = smooth
	begin
	LegacyDoMorph scale = 1.1 relative_scale time = <time> motion = smooth
	LegacyDoMorph scale = 0.9 relative_scale time = <time> motion = smooth
	repeat 4
	LegacyDoMorph scale = 1.0 relative_scale time = (<time> / 2.0) motion = smooth
endscript

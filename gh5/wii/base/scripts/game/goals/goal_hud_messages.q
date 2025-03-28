
script hud_message \{Type = Default
		text = qs(0x2ba2c9a2)
		Color = Default
		time = 3000}
	return
	if ($ui_gameplay_show_hud = 0)
		return
	endif
	switch <Color>
		case greenlt
		<rgba> = [0 225 0 255]
		case green
		<rgba> = [80 180 120 255]
		case bluedk
		<rgba> = [80 120 180 255]
		case bluelt
		<rgba> = [40 200 200 255]
		case violet
		<rgba> = [140 100 180 255]
		case amber
		<rgba> = [180 140 60 255]
		case orange
		<rgba> = [200 100 40 255]
		case red
		<rgba> = [200 70 70 255]
		case CLEAR
		<rgba> = [0 0 0 0]
		default
		<rgba> = [180 180 180 255]
	endswitch
	switch <Type>
		case alert_signpost
		hud_message_create_alert_signpost <...>
		case alert
		hud_message_create_alert <...>
		case counter
		hud_message_create_counter <...>
		case instruction
		hud_message_create_instruction <...>
		case instruction_general
		hud_message_create_instruction2 <...>
		case uberalert
		hud_message_create_uberalert <...>
		case alert_goal
		hud_message_create_alert_goal <...>
		case dialog
		hud_message_create_dialog <...>
		default
		SoftAssert qs(0x6fcab700) t = <Type>
		return
	endswitch
	ui_messages_check_all_positions
	if GotParam \{override_time}
		time = <override_time>
	endif
	if ScreenElementExists id = <msg_parent>
		RunScriptOnScreenElement id = <msg_parent> <style_script> params = {time = <time>}
	endif
endscript

script hud_message_create_alert_signpost 
	<msg_parent> = ui_alert_signpost
	<style_script> = ui_alert_signpost_script
	<time> = 3
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = center
		}}
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = center}
		not_focusable
		just = [center bottom]
		child_anchor = [center bottom]
		dims = (0.0, 0.0)
		alpha = 0.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		just = [center bottom]
		dims = ((1.0, 0.0) * (<width> - 10))
		internal_scale = 0.7
		internal_just = [center top]
		rgba = <rgba>
		allow_expansion
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	GetScreenElementDims id = <id>
	SetScreenElementProps id = <msg_parent> dims = ((0.0, 1.0) * <height>)
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
		time = <time>
	}
endscript

script hud_message_create_alert 
	<msg_parent> = ui_alert
	<style_script> = ui_alert_script
	<time> = 3
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = bottom
		}}
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = bottom}
		not_focusable
		just = [center bottom]
		child_anchor = [center bottom]
		dims = (0.0, 0.0)
		alpha = 0.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		just = [center bottom]
		dims = ((1.0, 0.0) * (<width> - 10))
		internal_scale = 0.7
		internal_just = [left center]
		rgba = <rgba>
		allow_expansion
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	GetScreenElementDims id = <id>
	SetScreenElementProps id = <msg_parent> dims = ((0.0, 1.0) * <height>)
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
		time = <time>
	}
endscript

script hud_message_create_counter \{counter_index = 0
		is_bar = 0}
	formatText checksumName = msg_parent 'goal_ui_counter%i' i = <counter_index>
	<style_script> = goal_ui_counter_script
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	<countertext> = qs(0x00000000)
	if ((GotParam total_number) && (<is_bar> = 0))
		formatText TextName = countertext qs(0x2e73f682) b = <separator> c = <total_number> d = <hud_counter_caption>
	else
		countertext = <hud_counter_caption>
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = right
		}}
	CreateScreenElement {
		Type = ContainerElement
		parent = {hud_message child = right}
		id = <msg_parent>
		just = [center top]
		allow_expansion
		tags = {
			counter_info = {
				text = <countertext>
				number_collected = <initial_count>
				total_number = <total_number>
				is_bar = <is_bar>
				element_id = <msg_parent>
				rgba = <rgba>
				marker_array = <marker_array>
			}
		}
	}
	<container_id> = <id>
	if (<is_bar> = 1)
		<bar_pos_offset> = (0.0, 5.0)
		CreateScreenElement {
			local_id = bar_bg
			Type = SpriteElement
			parent = <container_id>
			texture = white
			Pos = <bar_pos_offset>
			rgba = [0 0 0 128]
			dims = ($hud_counter_bar_w * (1.0, 0.0) + $hud_counter_bar_h * (0.0, 1.0) + (4.0, 4.0))
			just = [center center]
			z_priority = 0
		}
		<bar_fg_x> = ($hud_counter_bar_w * (0.5, 0.0))
		<total_number_float> = (<total_number> * 1.0)
		<dims_for_width> = ($hud_counter_bar_w * (<initial_count> / <total_number_float>))
		CastToInteger \{dims_for_width}
		CreateScreenElement {
			local_id = bar
			Type = SpriteElement
			parent = <container_id>
			texture = white
			Pos = (<bar_pos_offset> - <bar_fg_x>)
			rgba = <rgba>
			dims = (((1.0, 0.0) * <dims_for_width>) + ($hud_counter_bar_h * (0.0, 1.0)))
			just = [left center]
			z_priority = 1
		}
		if GotParam \{marker_array}
			CreateScreenElement {
				Type = ContainerElement
				parent = <container_id>
				local_id = marker_container
				Pos = (<bar_pos_offset> - <bar_fg_x>)
				dims = ($hud_counter_bar_h * (0.0, 1.0))
				just = [center center]
			}
			GetArraySize \{marker_array}
			<i> = 0
			begin
			switch ((<marker_array> [<i>]).Color)
				case greenlt
				<marker_rgba> = [0 225 0 255]
				case green
				<marker_rgba> = ($goal_career_ui_scheme.main)
				case bluedk
				<marker_rgba> = [80 120 180 255]
				case bluelt
				<marker_rgba> = [40 200 200 255]
				case violet
				<marker_rgba> = ($goal_rigger_ui_scheme.main)
				case amber
				<marker_rgba> = [180 140 60 255]
				case orange
				<marker_rgba> = ($goal_hardcore_ui_scheme.main)
				case red
				<marker_rgba> = ($goal_generic_ui_scheme.main)
				default
				<marker_rgba> = [180 180 180 255]
			endswitch
			<total_number_float> = (<total_number> * 1.0)
			<dims_for_width> = ($hud_counter_bar_w * (((<marker_array> [<i>]).number) / <total_number_float>))
			CastToInteger \{dims_for_width}
			CreateScreenElement {
				Type = SpriteElement
				parent = {<container_id> child = marker_container}
				texture = white
				Pos = ((1.0, 0.0) * <dims_for_width>)
				rgba = <marker_rgba>
				dims = ((3.0, 0.0) + ($hud_counter_bar_h * (0.0, 1.0)))
				just = [center top]
				z_priority = 2
			}
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		<text_pos> = ($hud_counter_bar_h * (0.0, 1.0) + <bar_pos_offset>)
		if GotParam \{icon}
			CreateScreenElement {
				Type = SpriteElement
				parent = <container_id>
				texture = <icon>
				Pos = (<bar_pos_offset> - <bar_fg_x> - (16.0, 0.0))
				dims = (32.0, 32.0)
				just = [left center]
				z_priority = 7
			}
		endif
	else
		<text_pos> = (0.0, 0.0)
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = right
		}}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = text_a1
		text = <countertext>
		just = [center top]
		Pos = <text_pos>
		dims = ((1.0, 0.0) * (<width> - 10))
		internal_scale = 0.7
		internal_just = [left top]
		allow_expansion
		rgba = <rgba>
		z_priority = 10
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [20 10 0 200]
	}
	goal_update_counter counter_index = <counter_index>
endscript

script hud_message_create_instruction \{no_fade = 0}
	<msg_parent> = goal_ui_instruction
	<style_script> = goal_ui_instruction_script
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = left
		}}
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = left}
		not_focusable
		Pos = (0.0, 0.0)
		just = [center top]
		child_anchor = [center top]
		dims = (0.0, 0.0)
		alpha = 0.0
		tags = {
			no_fade = <no_fade>
		}
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		rgba = <rgba>
		dims = ((1.0, 0.0) * (<width> - 10))
		Pos = (0.0, 0.0)
		just = [center top]
		internal_just = [left top]
		internal_scale = 0.7
		alpha = 0.0
		allow_expansion
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	GetScreenElementDims id = <id>
	SetScreenElementProps id = <msg_parent> dims = ((0.0, 1.0) * <height>)
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
	}
endscript

script hud_message_create_instruction2 \{no_fade = 0}
	<msg_parent> = goal_ui_instruction2
	<style_script> = goal_ui_instruction2_script
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = left
		}}
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = left}
		not_focusable
		just = [center top]
		child_anchor = [center top]
		dims = (0.0, 0.0)
		alpha = 0.0
		tags = {
			no_fade = <no_fade>
		}
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		rgba = <rgba>
		dims = ((1.0, 0.0) * (<width> - 10))
		Pos = (0.0, 0.0)
		just = [center top]
		internal_just = [left top]
		internal_scale = 0.7
		alpha = 0.0
		allow_expansion
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	GetScreenElementDims id = <id>
	SetScreenElementProps id = <msg_parent> dims = ((0.0, 1.0) * <height>)
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
	}
endscript

script hud_message_create_uberalert 
	<msg_parent> = ui_alert_uber
	<style_script> = ui_alert_uber_script
	if (<time> = 3000)
		<time> = 2
	endif
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = center
		}}
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = center}
		not_focusable
		just = [center top]
		child_anchor = [center top]
		dims = (0.0, 0.0)
		alpha = 0.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		just = [center top]
		internal_just = [center top]
		internal_scale = 0.7
		dims = ((1.0, 0.0) * (<width> - 10))
		rgba = <rgba>
		allow_expansion
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
		time = <time>
	}
endscript

script hud_message_create_alert_goal \{time = 3}
	<msg_parent> = goal_ui_alert
	<style_script> = goal_ui_alert_script
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	GetScreenElementDims \{id = {
			hud_message
			child = right
		}}
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = right}
		not_focusable
		just = [center top]
		child_anchor = [center top]
		dims = (0.0, 0.0)
		alpha = 0.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		just = [center top]
		dims = ((1.0, 0.0) * (<width> - 10))
		internal_scale = 0.7
		internal_just = [center top]
		rgba = <rgba>
		allow_expansion
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	GetScreenElementDims id = <id>
	SetScreenElementProps id = <msg_parent> dims = ((0.0, 1.0) * <height>)
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
		time = <time>
	}
endscript

script hud_message_create_rank_info 
	ScriptAssert \{'hud_message_create_rank_info: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script hud_message_create_dialog 
	<msg_parent> = goal_ui_dialog
	<style_script> = goal_ui_dialog_script
	if ScreenElementExists id = <msg_parent>
		<msg_parent> :Die
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <msg_parent>
		parent = {hud_message child = center}
		not_focusable
		Pos = (0.0, 380.0)
		just = [center bottom]
		child_anchor = [center bottom]
		dims = (0.0, 0.0)
		alpha = 0.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <msg_parent>
		local_id = text
		font = text_a1
		text = <text>
		just = [center bottom]
		dims = (1024.0, 0.0)
		internal_scale = 0.7
		internal_just = [center top]
		rgba = <rgba>
		allow_expansion
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	return {
		msg_parent = <msg_parent>
		style_script = <style_script>
	}
endscript

script create_speech_box 
	SpawnScriptNow create_speech_box_spawned params = {<...>}
endscript

script create_speech_box_spawned \{text_rgba = [
			200
			200
			200
			255
		]
		anchor_id = speech_box_anchor
		pause_input_time = 1000
		z_priority = 5}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	font = text_a1
	if ScreenElementExists id = <anchor_id>
		DestroyScreenElement id = <anchor_id>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = {hud_message child = bottom_right}
		id = <anchor_id>
		Pos = (0.0, 0.0)
		just = [center bottom]
		child_anchor = [right center]
		dims = (450.0, 40.0)
		z_priority = <z_priority>
	}
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [
				{pad_option <pad_option_script> params = <pad_option_params>}
			]
			replace_handlers
		}
	elseif GotParam \{event_handlers}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <anchor_id>
		font = <font>
		just = [right center]
		Pos = (10.0, 2.0)
		text = <text>
		rgba = <text_rgba>
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		Scale = (0.8, 0.7)
	}
	LaunchEvent Type = focus target = <anchor_id>
	if GotParam \{pause_input}
		SpawnScriptLater TemporarilyDisableInput params = {time = <pause_input_time>}
	endif
endscript

script speech_box_exit \{anchor_id = speech_box_anchor}
	if ScreenElementExists id = <anchor_id>
		DestroyScreenElement id = <anchor_id>
	endif
	LaunchEvent \{Type = speech_box_destroyed}
endscript

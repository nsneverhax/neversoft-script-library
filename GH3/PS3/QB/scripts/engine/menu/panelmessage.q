
script kill_panel_message_if_it_exists 
	if ScreenElementExists Id = <Id>
		DestroyScreenElement Id = <Id>
	endif
endscript

script kill_panel_messages 
	kill_panel_message_if_it_exists \{Id = panel_message_layer}
endscript

script hide_panel_messages 
	if ScreenElementExists \{Id = panel_message_layer}
		DoScreenElementMorph \{Id = panel_message_layer
			Alpha = 0}
	endif
endscript

script show_panel_messages 
	if ScreenElementExists \{Id = panel_message_layer}
		DoScreenElementMorph \{Id = panel_message_layer
			Alpha = 1}
	endif
endscript

script create_panel_message_layer_if_needed 
	if NOT ScreenElementExists \{Id = panel_message_layer}
		SetScreenElementLock \{Id = root_window
			OFF}
		CreateScreenElement \{Type = ContainerElement
			PARENT = root_window
			Id = panel_message_layer}
	endif
endscript

script create_panel_message \{Text = "Default panel message"
		Pos = (320.0, 70.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = text_A1
		Time = 1500
		z_priority = -5
		just = [
			Center
			Center
		]
		PARENT = panel_message_layer
		Scale = 0.65000004}
	if NOT (<font_face> = text_A1)
		<font_face> = text_A1
	endif
	if GotParam \{Id}
		kill_panel_message_if_it_exists Id = <Id>
	endif
	create_panel_message_layer_if_needed
	SetScreenElementLock Id = <PARENT> OFF
	CreateScreenElement {
		Type = TextElement
		PARENT = <PARENT>
		Id = <Id>
		font = <font_face>
		Text = <Text>
		Scale = <Scale>
		Pos = <Pos>
		just = <just>
		rgba = <rgba>
		z_priority = <z_priority>
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		font_spacing = 2
		NOT_FOCUSABLE
	}
	if GotParam \{style}
		if GotParam \{Params}
			RunScriptOnScreenElement Id = <Id> <style> Params = <Params>
		else
			RunScriptOnScreenElement Id = <Id> <style> Params = <...>
		endif
	else
		RunScriptOnScreenElement Id = <Id> panel_message_wait_and_die Params = {Time = <Time>}
	endif
endscript

script create_panel_sprite \{Pos = (320.0, 60.0)
		rgba = [
			128
			128
			128
			100
		]
		z_priority = -5
		PARENT = panel_message_layer
		just = [
			Center
			Center
		]}
	if GotParam \{Id}
		if ScreenElementExists Id = <Id>
			RunScriptOnScreenElement Id = <Id> kill_panel_message
		endif
	endif
	create_panel_message_layer_if_needed
	SetScreenElementLock Id = <PARENT> OFF
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <PARENT>
		texture = <texture>
		Id = <Id>
		Scale = <Scale>
		Pos = <Pos>
		just = <just>
		rgba = <rgba>
		z_priority = <z_priority>
		BLEND = <BLEND>
	}
	if GotParam \{style}
		if GotParam \{Params}
			RunScriptOnScreenElement Id = <Id> <style> Params = <Params>
		else
			RunScriptOnScreenElement Id = <Id> <style> Params = <...>
		endif
	else
		if GotParam \{Time}
			RunScriptOnScreenElement Id = <Id> panel_message_wait_and_die Params = {Time = <Time>}
		endif
	endif
endscript

script create_panel_block \{Text = "Default panel message"
		Pos = (320.0, 240.0)
		Dims = (250.0, 0.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = text_A1
		Time = 2000
		just = [
			Center
			Center
		]
		internal_just = [
			Center
			Center
		]
		z_priority = -5
		Scale = 0.125
		PARENT = panel_message_layer}
	create_panel_message_layer_if_needed
	SetScreenElementLock Id = <PARENT> OFF
	if GotParam \{Id}
		if ScreenElementExists Id = <Id>
			DestroyScreenElement Id = <Id>
		endif
	endif
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = <PARENT>
		Id = <Id>
		font = <font_face>
		Text = <Text>
		Dims = <Dims>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		line_spacing = <line_spacing>
		rgba = <rgba>
		Scale = <Scale>
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = $UI_text_shadow_offset
		allow_expansion
		z_priority = <z_priority>
	}
	if GotParam \{style}
		if GotParam \{Params}
			RunScriptOnScreenElement Id = <Id> <style> Params = <Params>
		else
			RunScriptOnScreenElement Id = <Id> <style> Params = <...>
		endif
	else
		if NOT GotParam \{hold}
			RunScriptOnScreenElement Id = <Id> panel_message_wait_and_die Params = {Time = <Time>}
		endif
	endif
endscript

script create_intro_panel_block \{Text = "Default intro panel message"
		Pos = (320.0, 60.0)
		Dims = (250.0, 0.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = text_A1
		Time = 2000
		just = [
			Center
			Center
		]
		internal_just = [
			Center
			Center
		]
		z_priority = -5
		Scale = 0.5
		PARENT = panel_message_layer}
	create_panel_message_layer_if_needed
	SetScreenElementLock Id = <PARENT> OFF
	if GotParam \{Id}
		if ScreenElementExists Id = <Id>
			DestroyScreenElement Id = <Id>
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = <Id>
		Pos = (0.0, 0.0)
	}
	<the_id> = <Id>
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = <the_id>
		font = <font_face>
		Text = <Text>
		Dims = <Dims>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		line_spacing = <line_spacing>
		rgba = <rgba>
		Scale = <Scale>
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = $UI_text_shadow_offset
		allow_expansion
		z_priority = (<z_priority> + 3)
	}
	grad_color = [17 67 92 255]
	if GotParam \{create_bg}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <the_id>
			texture = goal_grad
			Pos = (<Pos> + (300.0, 0.0))
			Scale = (21.0, 10.0)
			just = [Center Center]
			rgba = <grad_color>
			Alpha = 0.4
			z_priority = (<z_priority> + 1)
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <the_id>
			texture = goal_grad
			Pos = (<Pos> + (300.0, -20.0))
			Scale = (21.0, 1.0)
			just = [Center Center]
			rgba = <grad_color>
			Alpha = 0.6
			z_priority = (<z_priority> + 1)
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <the_id>
			texture = goal_grad
			Pos = (<Pos> + (300.0, 20.0))
			Scale = (21.0, 1.0)
			just = [Center Center]
			rgba = <grad_color>
			Alpha = 0.6
			flip_v
			z_priority = (<z_priority> + 1)
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <the_id>
			Pos = (<Pos> + (320.0, 0.0))
			just = [Center Center]
			Scale = (13.0, 1.0)
			texture = roundbar_middle
			z_priority = (<z_priority> + 2)
			rgba = [128 128 128 20]
		}
		GetScreenElementPosition Id = <Id>
		GetScreenElementDims Id = <Id>
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <the_id>
			Pos = (<ScreenELementPos> + (-16.0, 16.0))
			just = [Center Center]
			Scale = 1
			texture = roundbar_tip_left
			z_priority = (<z_priority> + 2)
			rgba = [128 128 128 20]
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <the_id>
			Pos = (<ScreenELementPos> + <width> * (1.0, 0.0) + (16.0, 16.0))
			just = [Center Center]
			Scale = 1
			texture = roundbar_tip_right
			z_priority = (<z_priority> + 2)
			rgba = [128 128 128 20]
		}
	endif
	if GotParam \{style}
		if GotParam \{Params}
			RunScriptOnScreenElement Id = <the_id> <style> Params = <Params>
		else
			RunScriptOnScreenElement Id = <the_id> <style> Params = <...>
		endif
	else
		RunScriptOnScreenElement Id = <the_id> panel_message_wait_and_die Params = {Time = <Time>}
	endif
endscript

script panel_message_wait_and_die \{Time = 1500}
	Wait <Time> IgnoreSlomo
	DIE
endscript

script kill_panel_message 
	DIE
endscript

script hide_panel_message 
	if ScreenElementExists Id = <Id>
		SetScreenElementProps {
			Id = <Id>
			Hide
		}
		<Id> :DoMorph Alpha = 0
	endif
endscript

script show_panel_message 
	if ScreenElementExists Id = <Id>
		SetScreenElementProps {
			Id = <Id>
			UnHide
		}
		<Id> :DoMorph Alpha = 1
	endif
endscript

script destroy_panel_message 
	if ScreenElementExists Id = <Id>
		<Id> :DIE
	endif
endscript

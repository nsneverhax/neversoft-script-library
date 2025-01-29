
script kill_panel_message_if_it_exists 
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script kill_panel_messages 
	ScriptAssert \{'kill_panel_messages: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script hide_panel_messages 
	ScriptAssert \{'hide_panel_messages: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script show_panel_messages 
	ScriptAssert \{'show_panel_messages: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_panel_message_layer_if_needed 
	if NOT ScreenElementExists \{id = panel_message_layer}
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = panel_message_layer}
	endif
endscript

script create_panel_message \{text = qs(0xee9e2315)
		Pos = (320.0, 70.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = fontgrid_text_a3
		time = 1500
		z_priority = -5
		just = [
			center
			center
		]
		parent = panel_message_layer
		Scale = 0.65000004}
	if NOT (<font_face> = fontgrid_text_a3)
		<font_face> = fontgrid_text_a3
	endif
	if GotParam \{id}
		kill_panel_message_if_it_exists id = <id>
	endif
	create_panel_message_layer_if_needed
	SetScreenElementLock id = <parent> OFF
	CreateScreenElement {
		Type = TextElement
		parent = <parent>
		id = <id>
		font = <font_face>
		text = <text>
		Scale = <Scale>
		Pos = <Pos>
		just = <just>
		rgba = <rgba>
		z_priority = <z_priority>
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		font_spacing = 2
		not_focusable
	}
	if GotParam \{style}
		if GotParam \{params}
			RunScriptOnScreenElement id = <id> <style> params = <params>
		else
			RunScriptOnScreenElement id = <id> <style> params = <...>
		endif
	else
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
	endif
endscript

script create_panel_sprite 
	ScriptAssert \{': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_panel_block 
	ScriptAssert \{': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_intro_panel_block 
	ScriptAssert \{': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script panel_message_wait_and_die \{time = 1500}
	Wait <time> ignoreslomo
	Die
endscript

script kill_panel_message 
	Die
endscript

script hide_panel_message 
	if ScreenElementExists id = <id>
		SetScreenElementProps {
			id = <id>
			Hide
		}
		<id> :legacydomorph alpha = 0
	endif
endscript

script show_panel_message 
	if ScreenElementExists id = <id>
		SetScreenElementProps {
			id = <id>
			unhide
		}
		<id> :legacydomorph alpha = 1
	endif
endscript

script destroy_panel_message 
	if ScreenElementExists id = <id>
		<id> :Die
	endif
endscript

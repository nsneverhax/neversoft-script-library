
script ui_create_helper_dialogue {
		Pos = (-350.0, -200.0)
		dims = (600.0, 400.0)
		Scale = (1.0, 1.0)
		choose_script = generic_event_back
		back_script = generic_event_back
		font = fontgrid_bordello
		font_rgba = (($g_menu_colors).menu_gold)
		text_buffer = (30.0, 35.0)
		text_scale = 0.5
		image_buffer = (0.0, 0.0)
		image_portion = 0.5
		z_priority = 10000
	}
	PushAssetContext \{context = z_soundcheck}
	if ScreenElementExists \{id = helper_root}
		DestroyScreenElement \{id = helper_root}
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = helper_root
		parent = root_window
		Pos = <Pos>
		Scale = <Scale>
		pos_anchor = [center , center]
		event_handlers = [
			{pad_choose <choose_script>}
		]
		just = [center , center]
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = descinterface
		parent = <id>
		desc = 'helper_box_bg'
		dims = (600.0, 400.0)
		just = [left , top]
		pos_anchor = [left , top]
	}
	if NOT GotParam \{dims}
		GetScreenElementDims id = <id>
		dims = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
	endif
	if ((GotParam text) && (GotParam image))
		image_height = ((<dims>.(0.0, 1.0)) * <image_portion>)
		text_height = ((<dims>.(0.0, 1.0)) - <image_height>)
		width = (<dims>.(1.0, 0.0))
		CreateScreenElement {
			Type = SpriteElement
			parent = helper_root
			texture = <image>
			dims = (<width> * (1.0, 0.0) + <image_height> * (0.0, 1.0) - (2 * <image_buffer>))
			Pos = <image_buffer>
			z_priority = (<z_priority> + 4)
			just = [left top]
		}
		CreateScreenElement {
			Type = TextBlockElement
			parent = helper_root
			font = <font>
			rgba = <font_rgba>
			text = <text>
			dims = (<width> * (1.0, 0.0) + <text_height> * (0.0, 1.0) - (2 * <text_buffer>))
			z_priority = (<z_priority> + 4)
			just = [left top]
			Pos = (<image_height> * (0.0, 1.0) + <text_buffer>)
			internal_scale = <text_scale>
			fit_width = wrap
			fit_height = `scale	down	if	larger`
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = (($g_menu_colors).menu_shadow)
		}
	elseif GotParam \{text}
		CreateScreenElement {
			Type = TextBlockElement
			parent = helper_root
			font = <font>
			rgba = <font_rgba>
			text = <text>
			dims = (<dims> - (2 * <text_buffer>))
			z_priority = (<z_priority> + 4)
			just = [left top]
			Pos = <text_buffer>
			internal_scale = <text_scale>
			fit_width = wrap
			fit_height = `scale	down	if	larger`
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = (($g_menu_colors).menu_shadow)
		}
	elseif GotParam \{image}
		CreateScreenElement {
			Type = SpriteElement
			parent = helper_root
			texture = <image>
			dims = (<dims> - (2 * <image_buffer>))
			Pos = <image_buffer>
			z_priority = (<z_priority> + 4)
			just = [left top]
		}
	else
		printf \{qs(0x174e82ca)}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	if GotParam \{life}
		SpawnScriptNow helper_dialogue_delayed_kill params = {life = <life>}
	endif
	PopAssetContext \{context = z_soundcheck}
endscript

script ui_destroy_helper_dialogue 
	if ScreenElementExists \{id = helper_root}
		DestroyScreenElement \{id = helper_root}
	endif
	if ScriptIsRunning \{helper_dialogue_delayed_kill}
		KillSpawnedScript \{Name = helper_dialogue_delayed_kill}
	endif
endscript

script helper_dialogue_delayed_kill 
	Wait <life> Seconds
	generic_event_back
endscript

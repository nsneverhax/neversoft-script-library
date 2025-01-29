
script startup 
endscript

script 0xf27f34df 
	Change \{0x5ef13385 = 20.0}
	SetGlobalTags \{user_options
		params = {
			ps2_widescreen = 1
		}}
	SetScreen \{widescreen = 1}
	song = hotblooded
	difficulty = expert
	level = load_z_metalfest
	starttime = 0
	controller = 0
	game_mode = p1_quickplay
	setup_4_player_bot
	autolaunch <...>
endscript
0xb0da7bc1 = qs(0x15adb7e5)

script 0x16f4b3cf 
	if NOT ScreenElementExists \{id = 0x2ec066f9}
		CreateScreenElement \{Type = ContainerElement
			id = 0x2ec066f9
			parent = root_window
			Pos = (250.0, 500.0)
			just = [
				left
				top
			]
			z_priority = 4}
		CreateScreenElement \{Type = SpriteElement
			id = 0x25927299
			parent = 0x2ec066f9
			texture = 0xef68655c
			Pos = (0.0, 0.0)
			dims = (96.0, 96.0)}
		CreateScreenElement {
			Type = TextElement
			id = 0xfa974f4d
			parent = 0x2ec066f9
			text = ($0xb0da7bc1)
			font = text_a1
			Pos = (64.0, 0.0)
			Scale = (1.0, 1.0)
			rgba = [210 0 0 250]
			just = [left center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
	endif
endscript

script 0xbabe176c 
	if ScreenElementExists \{id = 0x2ec066f9}
		DestroyScreenElement \{id = 0x2ec066f9}
	endif
endscript

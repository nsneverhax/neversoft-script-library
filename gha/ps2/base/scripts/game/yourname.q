use_pcmcia = 'true'
viewer_ip = '10.2.1.1'
viewer_subnet = '255.252.0.0'
viewer_gateway = '10.2.0.1'
use_qbr = 0

script startup 
endscript
0xd30b1f8a = 0
0xb0da7bc1 = 'BUILD LABEL'

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

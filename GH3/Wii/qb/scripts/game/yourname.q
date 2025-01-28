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
	if NOT screenelementexists \{id = 0x2ec066f9}
		createscreenelement \{type = containerelement
			id = 0x2ec066f9
			parent = root_window
			pos = (250.0, 500.0)
			just = [
				left
				top
			]
			z_priority = 4}
		createscreenelement \{type = spriteelement
			id = 0x25927299
			parent = 0x2ec066f9
			texture = 0xef68655c
			pos = (0.0, 0.0)
			dims = (96.0, 96.0)}
		createscreenelement {
			type = textelement
			id = 0xfa974f4d
			parent = 0x2ec066f9
			text = ($0xb0da7bc1)
			font = text_a1
			pos = (64.0, 0.0)
			scale = (1.0, 1.0)
			rgba = [210 0 0 250]
			just = [left center]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
	endif
endscript

script 0xbabe176c 
	if screenelementexists \{id = 0x2ec066f9}
		destroyscreenelement \{id = 0x2ec066f9}
	endif
endscript

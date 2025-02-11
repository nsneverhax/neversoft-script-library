
script create_attract_keypad_menu 
	create_menu_backdrop \{texture = Newspaper_BG_2P}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ak_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = ak_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite \{parent = ak_container
		tex = keypad_mag
		Pos = (440.0, 340.0)
		dims = (416.0, 544.0)
		just = [
			center
			center
		]
		rot_angle = -8
		z = -1}
	displayText \{parent = ak_container
		text = "PIN UP"
		Pos = (420.0, 130.0)
		z = 5
		Scale = 1.5
		just = [
			center
			center
		]
		rgba = [
			0
			0
			0
			255
		]
		font = text_a6
		rot = -8
		noshadow}
	displayText \{parent = ak_container
		text = "PIN UP"
		Pos = (423.0, 133.0)
		z = 5
		Scale = 1.5
		just = [
			center
			center
		]
		rgba = [
			147
			147
			116
			255
		]
		font = text_a6
		rot = -8
		noshadow}
	displayText \{parent = ak_container
		text = "KEYPAD"
		Pos = (477.0, 586.0)
		z = 5
		Scale = 0.75
		just = [
			center
			center
		]
		rgba = [
			0
			0
			0
			255
		]
		font = text_a8
		rot = -8
		noshadow}
	displaySprite \{parent = ak_container
		tex = Newspaper_Loser_2P
		Pos = (257.0, 146.0)
		just = [
			center
			center
		]
		rot_angle = -8
		z = 5}
	displaySprite \{parent = ak_container
		tex = Newspaper_Loser_2P
		Pos = (582.0, 101.0)
		just = [
			center
			center
		]
		rot_angle = -8
		z = 5}
	CreateScreenElement \{Type = SpriteElement
		parent = ak_container
		id = ak_pad1
		texture = keypad_pad1
		Pos = (342.0, 262.0)
		Scale = (0.8125, 1.0624999)
		just = [
			center
			center
		]
		rot_angle = -8
		z_priority = 10
		alpha = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = ak_container
		id = ak_pad3
		texture = keypad_pad3
		Pos = (502.0, 240.0)
		Scale = (0.8125, 1.0624999)
		just = [
			center
			center
		]
		rot_angle = -8
		z_priority = 10
		alpha = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = ak_container
		id = ak_pad5
		texture = keypad_pad5
		Pos = (434.0, 340.0)
		Scale = (0.8125, 1.0624999)
		just = [
			center
			center
		]
		rot_angle = -8
		z_priority = 10
		alpha = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = ak_container
		id = ak_pad8
		texture = keypad_pad8
		Pos = (447.0, 428.0)
		Scale = (0.8125, 1.0624999)
		just = [
			center
			center
		]
		rot_angle = -8
		z_priority = 10
		alpha = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = ak_container
		id = ak_pad0
		texture = keypad_pad0
		Pos = (460.0, 518.0)
		Scale = (0.8125, 1.0624999)
		just = [
			center
			center
		]
		rot_angle = -8
		z_priority = 10
		alpha = 0}
	displaySprite \{parent = ak_container
		rgba = [
			225
			222
			220
			255
		]
		Pos = (790.0, 470.0)
		dims = (64.0, 320.0)
		just = [
			center
			center
		]
		z = 2}
	displaySprite \{parent = ak_container
		rgba = [
			225
			222
			220
			255
		]
		Pos = (920.0, 466.0)
		dims = (64.0, 320.0)
		just = [
			center
			center
		]
		z = 2}
	displaySprite \{parent = ak_container
		tex = Song_Summary_Percent_Fill_GPlayer
		Pos = (912.0, 147.0)
		just = [
			center
			center
		]
		Scale = (1.7, 1.2)
		rot_angle = 8
		alpha = 0.5
		z = 4}
	axe_op = (775.0, 115.0)
	axe_s_op = (779.0, 119.0)
	club_op = (925.0, 115.0)
	club_s_op = (929.0, 119.0)
	displayText \{parent = ak_container
		id = ak_axe
		text = "AXE"
		Pos = (775.0, 115.0)
		z = 5
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			150
			30
			10
			255
		]
		font = text_a10_Large
		rot = -2
		noshadow}
	displayText \{parent = ak_container
		id = ak_axe_shadow
		text = "AXE"
		Pos = (779.0, 119.0)
		z = 5
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a10_Large
		rot = -3
		noshadow}
	displayText \{parent = ak_container
		id = ak_club
		text = "CLUB"
		Pos = (925.0, 115.0)
		z = 5
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			150
			30
			10
			255
		]
		font = text_a10_Large
		rot = 5
		noshadow}
	displayText \{parent = ak_container
		id = ak_club_shadow
		text = "CLUB"
		Pos = (929.0, 119.0)
		z = 5
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a10_Large
		rot = 4
		noshadow}
	SpawnScriptNow ak_shake params = {id = ak_axe op = <axe_op>}
	SpawnScriptNow ak_shake params = {id = ak_axe_shadow op = <axe_s_op>}
	SpawnScriptNow ak_shake params = {id = ak_club op = <club_op>}
	SpawnScriptNow ak_shake params = {id = ak_club_shadow op = <club_s_op>}
	CreateScreenElement \{Type = TextBlockElement
		parent = ak_container
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		Pos = (700.0, 190.0)
		Scale = 0.5
		text = "Use the keypad to create your own secret Axe Club pin number!"
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		dims = (650.0, 180.0)
		line_spacing = 0.85
		rot_angle = 2}
	CreateScreenElement \{Type = TextBlockElement
		parent = ak_container
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		Pos = (698.0, 240.0)
		Scale = 0.5
		text = "Any time you play an Axe Club game, your scores and statistics are automatically transmitted to and from the game through the CoinUp Network and database"
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		dims = (650.0, 300.0)
		line_spacing = 0.85
		rot_angle = 2}
	CreateScreenElement \{Type = TextBlockElement
		parent = ak_container
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		Pos = (725.0, 365.0)
		Scale = 0.5
		text = "Track your lifetime statistics and personal bests"
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		dims = (625.0, 120.0)
		line_spacing = 0.85
		rot_angle = 2}
	CreateScreenElement \{Type = TextBlockElement
		parent = ak_container
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		Pos = (723.0, 415.0)
		Scale = 0.5
		text = "See how your statistics compare against Guitar Hero Arcade greats"
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		dims = (625.0, 120.0)
		line_spacing = 0.85
		rot_angle = 2}
	CreateScreenElement \{Type = TextBlockElement
		parent = ak_container
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		Pos = (721.0, 465.0)
		Scale = 0.5
		text = "Win money and other prizes by competing in national and local tournaments"
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		dims = (625.0, 180.0)
		line_spacing = 0.85
		rot_angle = 2}
	CreateScreenElement \{Type = TextBlockElement
		parent = ak_container
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		Pos = (718.0, 536.0)
		Scale = 0.5
		text = "Form a 'Rocking Crew' with your friends and compare your statistics with other Crews"
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		dims = (625.0, 180.0)
		line_spacing = 0.85
		rot_angle = 2}
	displaySprite \{parent = ak_container
		tex = Newspaper_Star_Empty
		Pos = (710.0, 382.0)
		just = [
			center
			center
		]
		Scale = 0.75
		z = 4
		rot_angle = 2}
	displaySprite \{parent = ak_container
		tex = Newspaper_Star_Empty
		Pos = (708.0, 432.0)
		just = [
			center
			center
		]
		Scale = 0.75
		z = 4
		rot_angle = 2}
	displaySprite \{parent = ak_container
		tex = Newspaper_Star_Empty
		Pos = (706.0, 482.0)
		just = [
			center
			center
		]
		Scale = 0.75
		z = 4
		rot_angle = 2}
	displaySprite \{parent = ak_container
		tex = Newspaper_Star_Empty
		Pos = (703.0, 553.0)
		just = [
			center
			center
		]
		Scale = 0.75
		z = 4
		rot_angle = 2}
	SpawnScriptNow \{animate_attract_keypad_menu}
endscript

script destroy_attract_keypad_menu 
	KillSpawnedScript \{Name = animate_attract_keypad_menu}
	KillSpawnedScript \{Name = ak_shake}
	destroy_menu \{menu_id = ak_container}
	destroy_menu_backdrop
endscript

script animate_attract_keypad_menu 
	Wait \{1
		Seconds}
	ak_pad8 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Seconds}
	ak_pad8 :DoMorph \{alpha = 0
		time = 0.125}
	Wait \{0.625
		Seconds}
	ak_pad0 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Second}
	ak_pad0 :DoMorph \{alpha = 0
		time = 0.125}
	Wait \{0.625
		Seconds}
	ak_pad0 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Second}
	ak_pad0 :DoMorph \{alpha = 0
		time = 0.125}
	Wait \{0.625
		Seconds}
	ak_pad8 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Second}
	ak_pad8 :DoMorph \{alpha = 0
		time = 0.125}
	Wait \{0.625
		Seconds}
	ak_pad1 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Second}
	ak_pad1 :DoMorph \{alpha = 0
		time = 0.125}
	Wait \{0.625
		Seconds}
	ak_pad3 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Second}
	ak_pad3 :DoMorph \{alpha = 0
		time = 0.125}
	Wait \{0.625
		Seconds}
	ak_pad5 :DoMorph \{alpha = 1
		time = 0}
	Wait \{0.25
		Second}
	ak_pad5 :DoMorph \{alpha = 0
		time = 0.125}
endscript

script ak_shake 
	printf "ak_shake: id = %a op = %b" a = <id> b = <op>
	Scale = 0.25
	begin
	<Scale> = (<Scale> * -0.7)
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <op> Scale = (1.0 + <Scale>) time = 0.08 motion = ease_out
	endif
	repeat 12
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <op> Scale = 1 motion = ease_out
	endif
endscript

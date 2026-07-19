graphic_test_selection = test_graphic1
graphic_test_speed = 5
graphic_test_axis = 0

script launch_graphic_test 
	generic_ui_destroy
	skater :killskater \{no_node}
	skater :disableplayerinput
	change \{graphic_test_selection = test_graphic1}
	legacydoscreenelementmorph \{id = hud_container
		alpha = 0}
	lock = off
	if areassetslocked
		allowassetloading \{on}
		lock = on
	endif
	loadtexture \{'Test\\graphic_test'}
	loadtexture \{'Test\\graphic_test2'}
	loadtexture \{'Test\\graphic_test3'}
	loadtexture \{'Test\\graphic_test4'}
	if (<lock> = on)
		allowassetloading \{off}
	endif
	disable_pause
	setanalogstickactiveformenus \{1}
	setscreenelementlock \{id = root_window
		off}
	if NOT screenelementexists \{id = graphic_test_anchor}
		createscreenelement \{id = graphic_test_anchor
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)
			z_priority = 5000
			alpha = 1
			scale = 1}
	endif
	setscreenelementprops \{id = graphic_test_anchor
		event_handlers = [
			{
				pad_start
				destroy_graphic_test
			}
			{
				pad_space
				test_graphic_switch
				params = {
					selection = test_graphic1
				}
			}
			{
				pad_back
				test_graphic_switch
				params = {
					selection = test_graphic2
				}
			}
			{
				pad_choose
				test_graphic_switch
				params = {
					selection = test_graphic3
				}
			}
			{
				pad_square
				test_graphic_switch
				params = {
					selection = test_graphic4
				}
			}
			{
				pad_up
				test_graphic_move
				params = {
					dir = up
				}
			}
			{
				pad_right
				test_graphic_move
				params = {
					dir = right
				}
			}
			{
				pad_down
				test_graphic_move
				params = {
					dir = down
				}
			}
			{
				pad_left
				test_graphic_move
				params = {
					dir = left
				}
			}
			{
				pad_r2
				test_graphic_scale
				params = {
					dir = up
				}
			}
			{
				pad_l2
				test_graphic_scale
				params = {
					dir = down
				}
			}
			{
				pad_r3
				test_graphic_toggle_axis
			}
			{
				pad_r1
				test_graphic_z
				params = {
					up
				}
			}
			{
				pad_l1
				test_graphic_z
				params = {
					down
				}
			}
			{
				pad_l3
				test_graphic_toggle_speed
			}
		]
		replace_handlers}
	legacydoscreenelementmorph \{id = graphic_test_anchor
		alpha = 1}
	launchevent \{type = focus
		target = graphic_test_anchor}
	pausegame
	<elements> = [test_graphic1 test_graphic2 test_graphic3 test_graphic4]
	<textures> = [graphic_test graphic_test2 graphic_test3 graphic_test4]
	<i> = 0
	begin
	<element> = (<elements> [<i>])
	if NOT screenelementexists id = <element>
		createscreenelement {
			id = <element>
			parent = graphic_test_anchor
			type = spriteelement
			pos = (320.0, 224.0)
			texture = (<textures> [<i>])
		}
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script test_graphic_switch 
	change graphic_test_selection = <selection>
endscript

script test_graphic_move 
	switch <dir>
		case up
		<delta> = ((0.0, -1.0) * $graphic_test_speed)
		case right
		<delta> = ((1.0, 0.0) * $graphic_test_speed)
		case down
		<delta> = ((0.0, 1.0) * $graphic_test_speed)
		case left
		<delta> = ((-1.0, 0.0) * $graphic_test_speed)
	endswitch
	getscreenelementprops id = ($graphic_test_selection)
	legacydoscreenelementmorph id = ($graphic_test_selection) pos = (<delta> + <pos>) time = 0
endscript

script test_graphic_scale 
	getscreenelementprops id = ($graphic_test_selection)
	getscreenelementdims id = ($graphic_test_selection)
	if NOT (ispair <scale>)
		<scale> = (<scale> * (1.0, 1.0))
	endif
	if ($graphic_test_axis = 0)
		<delta> = ((1.0, 0.0) * ($graphic_test_speed / (<width> / <scale> [0])))
	else
		<delta> = ((0.0, 1.0) * ($graphic_test_speed / (<height> / <scale> [1])))
	endif
	if (<dir> = up)
		legacydoscreenelementmorph id = ($graphic_test_selection) scale = (<scale> + <delta>) time = 0
	else
		legacydoscreenelementmorph id = ($graphic_test_selection) scale = (<scale> - <delta>) time = 0
	endif
endscript

script test_graphic_z 
	getscreenelementprops id = ($graphic_test_selection)
	if gotparam \{up}
		setscreenelementprops id = ($graphic_test_selection) z_priority = (<z_priority> + 1)
	else
		setscreenelementprops id = ($graphic_test_selection) z_priority = (<z_priority> - 1)
	endif
endscript

script test_graphic_toggle_axis 
	if ($graphic_test_axis = 0)
		change \{graphic_test_axis = 1}
		printf \{qs(0x3b9f4a81)}
	else
		change \{graphic_test_axis = 0}
		printf \{qs(0x22847bc0)}
	endif
endscript

script test_graphic_toggle_speed 
	if ($graphic_test_speed = 1)
		change \{graphic_test_speed = 5}
	else
		change \{graphic_test_speed = 1}
	endif
	printf qs(0xd0467bb3) d = ($graphic_test_speed)
endscript

script destroy_graphic_test 
	enable_pause
	unpausegame
	skater :enableplayerinput
	legacydoscreenelementmorph \{id = hud_container
		alpha = 1}
	if screenelementexists \{id = graphic_test_anchor}
		legacydoscreenelementmorph \{id = graphic_test_anchor
			alpha = 0}
		launchevent \{type = unfocus
			target = graphic_test_anchor}
		setanalogstickactiveformenus \{0}
	endif
endscript

ui_physics_struct = {
	top = 0
	right = 1280
	bottom = 720
	left = 0
}
g_gravity = 1000.0
g_drag_force = -20.0
doing_you_rock_test = 0
physics_test_type = 1

script create_ui_physics_test 
	change \{doing_you_rock_test = 0}
	check_screen_for_physics
	if gotparam \{debug}
		destroy_debugging_menu
		create_menu_backdrop \{texture = white
			rgba = [
				50
				50
				50
				255
			]}
	endif
	new_menu \{scrollid = scrolling_ui_physics_test
		vmenuid = vmenu_ui_physics_test
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		exclusive_device = $primary_controller
		event_handlers = [
			{
				pad_up
				ui_physics_scroll_up
				params = {
					debug
				}
			}
			{
				pad_down
				ui_physics_scroll_down
				params = {
					debug
				}
			}
			{
				pad_back
				destroy_ui_physics_test
				params = {
					debug
				}
			}
		]}
	launchevent \{type = focus
		target = vmenu_ui_physics_test}
	switch $physics_test_type
		case 1
		createscreenelement \{type = textelement
			parent = root_window
			id = test_type_text
			font = fontgrid_bordello
			scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			pos = (320.0, 100.0)
			text = qs(0x2bb2acfd)
			z_priority = 100.0}
		createscreenelement \{type = physicselement
			id = slime_container
			parent = root_window
			pos = (450.0, 50.0)
			mass = 40.0
			center = (63.0, 63.0)
			radius = 89.1
			elasticity = 0.75
			check_screen_collision
			apply_gravity
			apply_drag}
		createscreenelement \{type = spriteelement
			id = slime
			parent = slime_container
			texture = test_texture_slime_128
			pos = (0.0, 0.0)
			just = [
				left
				top
			]
			z_priority = 30}
		createscreenelement \{type = physicselement
			id = weight_container
			parent = root_window
			pos = (650.0, 50.0)
			mass = 100.0
			center = (63.0, 63.0)
			radius = 89.1
			elasticity = 0.25
			check_screen_collision
			apply_gravity
			apply_drag}
		createscreenelement \{type = spriteelement
			id = weight
			parent = weight_container
			texture = test_texture_weight_128
			pos = (0.0, 0.0)
			just = [
				left
				top
			]
			z_priority = 30}
		case 2
		createscreenelement \{type = textelement
			parent = root_window
			id = test_type_text
			font = fontgrid_bordello
			scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			pos = (460.0, 100.0)
			text = qs(0x5e46da1d)
			z_priority = 100.0}
		createscreenelement \{type = physicselement
			id = snake_test_container
			parent = root_window
			pos = (550.0, 100.0)
			mass = 40.0
			center = (63.0, 63.0)
			radius = 89.1
			elasticity = 0.75
			initial_force = (-2000000.0, -1500000.0)
			apply_gravity}
		runscriptonscreenelement id = <id> check_screen_collisions params = {id = <id>}
		createscreenelement \{type = spriteelement
			id = snake_head
			parent = snake_test_container
			texture = test_texture_slime_128
			pos = (0.0, 0.0)
			just = [
				left
				top
			]
			z_priority = 30}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (1160.0, 640.0)
				force = (-150000.0, 0.0)
				dist = 40
				horizontal
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (1160.0, 640.0)
				force = (0.0, -150000.0)
				dist = 40
				vertical
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (1200.0, 120.0)
				force = (-150000.0, 0.0)
				dist = 40
				horizontal
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (1200.0, 120.0)
				force = (0.0, 150000.0)
				dist = 40
				vertical
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (80.0, 80.0)
				force = (150000.0, 0.0)
				dist = 40
				horizontal
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (80.0, 80.0)
				force = (0.0, 150000.0)
				dist = 40
				vertical
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (120.0, 600.0)
				force = (150000.0, 0.0)
				dist = 40
				horizontal
			}}
		runscriptonscreenelement \{id = snake_test_container
			apply_positional_force
			params = {
				id = snake_test_container
				force_pos = (120.0, 600.0)
				force = (0.0, -150000.0)
				dist = 40
				vertical
			}}
		case 3
		createscreenelement \{type = textelement
			parent = root_window
			id = test_type_text
			font = fontgrid_bordello
			scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			pos = (320.0, 100.0)
			text = qs(0x9811007d)
			z_priority = 100.0}
		launchevent \{type = unfocus
			target = vmenu_ui_physics_test}
		change \{doing_you_rock_test = 1}
		create_exploding_text \{parent = 'you_rock_physics'
			text = qs(0x6f6d143d)
			debug}
	endswitch
	if gotparam \{debug}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		launchevent \{type = focus
			target = vmenu_ui_physics_test}
	endif
endscript

script ui_physics_scroll_up 
	change physics_test_type = ($physics_test_type - 1)
	if ($physics_test_type = 0)
		change \{physics_test_type = 3}
	endif
	destroy_ui_physics_test
	if gotparam \{debug}
		create_ui_physics_test \{debug}
	endif
endscript

script ui_physics_scroll_down 
	change physics_test_type = ($physics_test_type + 1)
	if ($physics_test_type = 4)
		change \{physics_test_type = 1}
	endif
	destroy_ui_physics_test
	if gotparam \{debug}
		create_ui_physics_test \{debug}
	endif
endscript

script destroy_ui_physics_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_ui_physics_test}
	destroy_menu_backdrop
	destroyscreenelement \{id = test_type_text}
	if screenelementexists \{id = snake_test_container}
		destroyscreenelement \{id = snake_test_container}
	endif
	if screenelementexists \{id = slime_container}
		destroyscreenelement \{id = slime_container}
	endif
	if screenelementexists \{id = weight_container}
		destroyscreenelement \{id = weight_container}
	endif
	if ($doing_you_rock_test)
		destroy_exploding_text
	endif
	if gotparam \{debug}
		create_debugging_menu
	endif
endscript

script apply_continuous_force \{force = (0.0, 0.0)}
	begin
	<id> :applyforce force = <force>
	getscreenelementprops id = <id>
	wait \{1
		gameframe}
	repeat
endscript

script apply_positional_force \{force_pos = (0.0, 0.0)
		force = (0.0, 0.0)
		dist = 0}
	begin
	getscreenelementprops id = <id>
	if gotparam \{horizontal}
		<y_pos> = ((<pos>.(0.0, 1.0)) + (<center>.(0.0, 1.0)))
		if (<y_pos> > ((<force_pos>.(0.0, 1.0)) - <dist>) &&
				<y_pos> < ((<force_pos>.(0.0, 1.0)) + <dist>))
			<id> :applyforce force = <force>
		endif
	elseif gotparam \{vertical}
		<x_pos> = ((<pos>.(1.0, 0.0)) + (<center>.(1.0, 0.0)))
		if (<x_pos> > ((<force_pos>.(1.0, 0.0)) - <dist>) &&
				<x_pos> < ((<force_pos>.(1.0, 0.0)) + <dist>))
			<id> :applyforce force = <force>
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script vector_magnitude \{vect = (0.0, 0.0)}
	<vect_x> = (<vect>.(1.0, 0.0))
	<vect_y> = (<vect>.(0.0, 1.0))
	<vect_x> = (<vect_x> * <vect_x>)
	<vect_y> = (<vect_y> * <vect_y>)
	sqrt (<vect_x> + <vect_y>)
	return magnitude = <sqrt>
endscript

script normalize_vector \{vect = (0.0, 0.0)}
	vector_magnitude vect = <vect>
	if (<magnitude> > 0.0)
		<vect_x> = ((<vect>.(1.0, 0.0)) / <magnitude>)
		<vect_y> = ((<vect>.(0.0, 1.0)) / <magnitude>)
		return vect = ((<vect_x> * (1.0, 0.0)) + (<vect_y> * (0.0, 1.0)))
	else
		scriptassert \{qs(0x3c4dee56)}
	endif
endscript

script check_screen_collisions {
		top = ($ui_physics_struct.top)
		left = ($ui_physics_struct.left)
		bottom = ($ui_physics_struct.bottom)
		right = ($ui_physics_struct.right)
		top_offset = 0
		left_offset = 0
		bottom_offset = 0
		right_offset = 0
	}
	<top> = (<top> + <top_offset>)
	<left> = (<left> + <left_offset>)
	<bottom> = (<bottom> + <bottom_offset>)
	<right> = (<right> + <right_offset>)
	<tl> = ((<top> * (0.0, 1.0)) + (<left> * (1.0, 0.0)))
	<br> = ((<bottom> * (0.0, 1.0)) + (<right> * (1.0, 0.0)))
	begin
	<id> :circleaabbcollisioncheck tl = <tl> br = <br>
	wait \{1
		gameframe}
	repeat
endscript

script check_screen_for_physics 
	getdisplaysettings
	printstruct <...>
	if (<widescreen> = false)
		change \{structurename = ui_physics_struct
			top = 36}
		change \{structurename = ui_physics_struct
			right = 1096}
		change \{structurename = ui_physics_struct
			bottom = 684}
		change \{structurename = ui_physics_struct
			left = 184}
	else
		change \{structurename = ui_physics_struct
			top = 0}
		change \{structurename = ui_physics_struct
			right = 1280}
		change \{structurename = ui_physics_struct
			bottom = 720}
		change \{structurename = ui_physics_struct
			left = 0}
	endif
endscript

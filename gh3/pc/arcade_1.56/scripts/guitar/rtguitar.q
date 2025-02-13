rt_guitar_num_controllers = 0
rt_guitar_left_bounce = 0
rt_guitar_right_bounce = 0
rt_guitar_left_enabled = 0
rt_guitar_right_enabled = 0
rt_guitar_left_initialized = 0
rt_guitar_right_initialized = 0
rt_guitar_left_mate_changed = 0
rt_guitar_right_mate_changed = 0
rt_game_out_of_order = 0
rt_guitar_light = [
	180
	180
	180
	255
]
rt_guitar_dark = [
	100
	100
	100
	255
]
rt_guitar_sticks_big = (192.0, 192.0)
rt_guitar_sticks_small = (160.0, 160.0)
rt_guitar_guitar_big = (384.0, 192.0)
rt_guitar_guitar_small = (320.0, 160.0)
in_rt_guitar_menu = 0
rt_which_guitar_pressed = 0
rt_from_options = 0
rt_max_controllers_to_check = 4
rt_mating_guitars = 0
rt_guitar_left_boot_message = 0
rt_guitar_right_boot_message = 0

script create_rt_guitar_mating_screen \{mate_guitars = 0}
	printf "create_rt_guitar_mating_screen: start (mate_guitars = %d)" d = <mate_guitars>
	Change \{rt_mating_guitars = 0}
	disable_coin_display
	Change \{in_rt_guitar_menu = 1}
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	menu_font = text_a5
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = rt_guitar_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Controller_2p_BG}
	displayText \{parent = rt_guitar_container
		text = "Guitar Status"
		Pos = (690.0, 140.0)
		Scale = 1.6
		just = [
			center
			center
		]
		rgba = [
			90
			25
			20
			255
		]
		font = text_a10
		z = 100
		noshadow}
	displayText \{parent = rt_guitar_container
		text = "The only reason to remate"
		id = rt_status_text1
		Pos = (640.0, 320.0)
		Scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 100
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	displayText \{parent = rt_guitar_container
		text = "is if you've gotten new"
		id = rt_status_text2
		Pos = (640.0, 360.0)
		Scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 100
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	displayText \{parent = rt_guitar_container
		text = "guitars, or you've"
		id = rt_status_text3
		Pos = (640.0, 400.0)
		Scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 100
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	displayText \{parent = rt_guitar_container
		text = "physically switched them."
		id = rt_status_text4
		Pos = (640.0, 440.0)
		Scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 100
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = rt_guitar_container
		text = "Left Guitar"
		Pos = (370.0, 325.0)
		Scale = 0.9
		just = [
			center
			center
		]
		rgba = [
			185
			180
			135
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			90
			25
			20
			255
		]
		shadow_offs = (2.0, 2.0)
		rot_angle = 2}
	CreateScreenElement \{Type = TextElement
		parent = rt_guitar_container
		id = rt_guitar_left_status
		text = "not found"
		Pos = (370.0, 365.0)
		Scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			220
			25
			20
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)
		rot_angle = 2}
	CreateScreenElement \{parent = rt_guitar_container
		Type = SpriteElement
		id = rt_guitar_left_sprite
		just = [
			center
			center
		]
		texture = star_power_test_image_rt
		Pos = (370.0, 485.0)
		rot_angle = 90
		rgba = [
			55
			55
			55
			255
		]
		Scale = 0.25
		z = 105}
	<id> :SetTags old_pos = <Pos>
	CreateScreenElement \{Type = TextElement
		parent = rt_guitar_container
		text = "Right Guitar"
		Pos = (905.0, 405.0)
		Scale = 0.9
		just = [
			center
			center
		]
		rgba = [
			185
			180
			135
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			90
			25
			20
			255
		]
		shadow_offs = (2.0, 2.0)
		rot_angle = -3}
	CreateScreenElement \{Type = TextElement
		parent = rt_guitar_container
		id = rt_guitar_right_status
		text = "not found"
		Pos = (900.0, 452.0)
		Scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			210
			25
			20
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (2.0, 2.0)
		rot_angle = -3}
	CreateScreenElement \{parent = rt_guitar_container
		Type = SpriteElement
		id = rt_guitar_right_sprite
		just = [
			center
			center
		]
		texture = star_power_test_image_rt
		Pos = (900.0, 570.0)
		rot_angle = 90
		rgba = [
			55
			55
			55
			255
		]
		Scale = 0.25
		z = 105}
	<id> :SetTags old_pos = <Pos>
	CreateScreenElement \{Type = TextElement
		parent = rt_guitar_container
		id = rt_guitar_total_seen
		Pos = (635.0, 645.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			90
			25
			20
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	rt_num_active_guitars
	formatText TextName = total_guitars_seen "controllers: %d" d = <num_active_guitars>
	SetScreenElementProps id = rt_guitar_total_seen text = <total_guitars_seen>
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	if (<mate_guitars> = 0)
		add_user_control_helper \{text = "REMATE"
			button = orange
			z = 100}
		add_user_control_helper \{text = "DONE"
			button = red
			z = 100}
		event_handlers = [
			{pad_L1 rt_guitar_remate_2}
			{pad_back ui_flow_manager_respond_to_action params = {action = continue}}
		]
		new_menu {
			scrollid = menu_rt_guitar_screen
			vmenuid = vmenu_rt_guitar_screen
			menu_pos = (120.0, 190.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = None
		}
		LaunchEvent \{Type = focus
			target = menu_rt_guitar_screen}
	endif
	if (<mate_guitars> = 1)
		SpawnScriptNow \{rt_guitars_check_status}
		Change \{rt_from_options = 0}
	else
		rt_guitars_check_if_present
		Change \{rt_from_options = 1}
	endif
	SpawnScriptNow \{rt_bounce_guitar}
	printf \{"create_rt_guitar_mating_screen: end"}
endscript

script destroy_rt_guitar_mating_screen 
	Change \{rt_guitar_num_controllers = 0}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = rt_bounce_guitar}
	if ($rt_from_options = 0)
	else
		destroy_menu \{menu_id = menu_rt_guitar_screen}
	endif
	destroy_menu \{menu_id = rt_guitar_container}
	destroy_menu_backdrop
	Change \{in_rt_guitar_menu = 0}
	if ($rt_from_options = 0)
		enable_coin_display
	else
	endif
endscript

script rt_guitar_check_for_pressed \{which_fret = green}
	guitar_index = 0
	active_controllers = [0 0 0 0]
	current_guitar = 0
	Change \{rt_which_guitar_pressed = -1}
	GetActiveControllers
	num_guitars_to_check = $rt_max_controllers_to_check
	printf \{"rt_guitar_check_for_pressed: start"}
	switch <which_fret>
		case red
		check_button = 4096
		case yellow
		check_button = 256
		case blue
		check_button = 16
		case orange
		check_button = 1
		default
		check_button = 65536
	endswitch
	begin
	<num_guitars_to_check> = $rt_max_controllers_to_check
	<current_guitar> = 0
	begin
	if (<active_controllers> [<current_guitar>] = 1)
		GetHeldPattern controller = <current_guitar> nobrokenstring
		if (<hold_pattern> && <check_button>)
			Change rt_which_guitar_pressed = <current_guitar>
			printf \{"guitar %d holding button, exiting"
				d = $rt_which_guitar_pressed}
			break
		endif
	endif
	Increment \{current_guitar}
	<num_guitars_to_check> = (<num_guitars_to_check> - 1)
	if (<num_guitars_to_check> = 0)
		break
	endif
	repeat 4
	if ($rt_which_guitar_pressed != -1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script rt_guitars_check_ID_and_ver 
	active_controllers = [0 0 0 0]
	GetActiveControllers
	GetInputHandlerBotIndex \{Player = 1}
	max_num_controllers_to_check = $rt_max_controllers_to_check
	controller_index = 0
	total_controllers = 0
	mated_controllers = 0
	num_controllers_can_mate = 0
	left_guitar_set = 0
	right_guitar_set = 0
	left_id = -1
	right_id = -1
	controller_fret_id_offset = 1
	begin
	if (<active_controllers> [<controller_index>] = 1)
	endif
	<max_num_controllers_to_check> = (<max_num_controllers_to_check> - 1)
	<controller_index> = (<controller_index> + 1)
	if (<max_num_controllers_to_check> = 0)
		break
	endif
	repeat <controller>
endscript

script rt_guitars_check 
	active_controllers = [0 0 0 0]
	GetActiveControllers
	GetInputHandlerBotIndex \{Player = 1}
	max_num_controllers_to_check = $rt_max_controllers_to_check
	controller_index = 0
	total_controllers = 0
	mated_controllers = 0
	num_controllers_can_mate = 0
	left_guitar_set = 0
	right_guitar_set = 0
	left_id = -1
	right_id = -1
	controller_fret_id_offset = 1
	begin
	if (<active_controllers> [<controller_index>] = 1)
		printf "rt_guitars_check: active controller at index %d" d = <controller_index>
		CheckWhichGuitarSide controller = <controller_index>
		GetRTGuitarUSBID controller = <controller_index>
		if (<isRTGuitar> = 1)
			printf \{"rt_guitars_check: is one of our guitars"}
			Increment \{num_controllers_can_mate}
		else
			printf \{"rt_guitars_check: isn't one of our guitars"}
		endif
		<max_num_controllers_to_check> = (<max_num_controllers_to_check> - 1)
		if ((<leftGuitar> = 1) || (<rightGuitar> = 1))
			if (<leftGuitar> = 1)
				if (<left_guitar_set> = 0)
					Increment \{left_guitar_set}
					<left_id> = <guitarID>
				else
					<left_guitar_set> = 0
				endif
				Increment \{mated_controllers}
			else
				if (<right_guitar_set> = 0)
					Increment \{right_guitar_set}
					<right_id> = <guitarID>
				else
					<right_guitar_set> = 0
				endif
				Increment \{mated_controllers}
			endif
		endif
		Increment \{total_controllers}
	else
		printf "rt_guitars_check: controller at index %d not active" d = <controller_index>
	endif
	<controller_index> = (<controller_index> + 1)
	if (<max_num_controllers_to_check> = 0)
		break
	endif
	repeat <controller>
	return left_guitar_set = <left_guitar_set> right_guitar_set = <right_guitar_set> num_controllers_can_mate = <num_controllers_can_mate>
endscript

script rt_guitars_check_if_present 
	rt_guitars_check
	printf "rt_guitars_check_if_present: %e possible mated controllers" e = <num_controllers_can_mate>
	if (<left_guitar_set> = 1)
		rt_guitar_left_status :SetProps \{text = "found"}
		rt_guitar_left_status :SetProps \{rgba = [
				90
				255
				20
				255
			]}
		rt_guitar_left_sprite :SetProps \{rgba = [
				255
				255
				255
				255
			]}
	endif
	if (<right_guitar_set> = 1)
		rt_guitar_right_status :SetProps \{text = "found"}
		rt_guitar_right_status :SetProps \{rgba = [
				90
				255
				20
				255
			]}
		rt_guitar_right_sprite :SetProps \{rgba = [
				255
				255
				255
				255
			]}
	endif
endscript

script rt_guitar_remate \{left_already_set = 0
		right_already_set = 0}
	if ($rt_mating_guitars = 0) printf "rt_guitar_remate: enter mating"
		Change \{rt_mating_guitars = 1}
		if (<left_already_set> = 0)
			SetScreenElementProps \{id = rt_status_text1
				text = "Hold down green fret"}
			SetScreenElementProps \{id = rt_status_text2
				text = "button on left guitar"}
			rt_guitar_check_for_pressed \{which_fret = green}
			printf \{"guitar found at %d, setting"
				d = $rt_which_guitar_pressed}
			controller_index = 0
			begin
			MateGuitarToSide \{controller = $rt_which_guitar_pressed
				whichSide = 0}
			Wait \{0.25
				Seconds}
			CheckWhichGuitarSide \{controller = $rt_which_guitar_pressed}
			printf "check guitar result for %f : left = %d, right = %e" f = $rt_which_guitar_pressed d = <leftGuitar> e = <rightGuitar>
			if (<leftGuitar> = 1)
				Change \{player1_device = $rt_which_guitar_pressed}
				Change \{structurename = player1_status
					controller = $rt_which_guitar_pressed}
				Change \{rt_guitar_left_initialized = 1}
				Change \{rt_guitar_left_enabled = 1}
				break
			endif
			repeat
			rt_guitar_left_status :SetProps \{text = "found"}
			rt_guitar_left_status :SetProps \{rgba = [
					90
					255
					20
					255
				]}
			rt_guitar_left_sprite :SetProps \{rgba = [
					255
					255
					255
					255
				]}
			SetScreenElementProps \{id = rt_status_text1
				text = "Hit blue fret to continue"}
			SetScreenElementProps \{id = rt_status_text2
				text = "to mating right guitar"}
			rt_guitar_check_for_pressed \{which_fret = blue}
		else
			Change \{rt_guitar_left_initialized = 1}
			Change \{rt_guitar_left_enabled = 1}
			printf \{"rt_guitar_remate: initialized left guitar"}
		endif
		if (<right_already_set> = 0)
			SetScreenElementProps \{id = rt_status_text1
				text = "Hold down green fret"}
			SetScreenElementProps \{id = rt_status_text2
				text = "button on right guitar"}
			rt_guitar_check_for_pressed \{which_fret = green}
			printf \{"guitar found at %d, setting"
				d = $rt_which_guitar_pressed}
			controller_index = 0
			begin
			MateGuitarToSide \{controller = $rt_which_guitar_pressed
				whichSide = 1}
			Wait \{0.25
				Seconds}
			CheckWhichGuitarSide \{controller = $rt_which_guitar_pressed}
			if (<rightGuitar> = 1)
				Change \{player2_device = $rt_which_guitar_pressed}
				Change \{structurename = player2_status
					controller = $rt_which_guitar_pressed}
				Change \{rt_guitar_right_initialized = 1}
				Change \{rt_guitar_right_enabled = 1}
				break
			endif
			repeat
			rt_guitar_right_status :SetProps \{text = "found"}
			rt_guitar_right_status :SetProps \{rgba = [
					90
					255
					20
					255
				]}
			rt_guitar_right_sprite :SetProps \{rgba = [
					255
					255
					255
					255
				]}
			SetScreenElementProps \{id = rt_status_text1
				text = "Guitars mated"}
			SetScreenElementProps \{id = rt_status_text2
				text = ""}
		else
			Change \{rt_guitar_right_initialized = 1}
			Change \{rt_guitar_right_enabled = 1}
			printf \{"rt_guitar_remate: initialized right guitar"}
		endif
		Change \{rt_mating_guitars = 0}
	else
		printf \{"rt_guitar_remate: already mating, skipping"}
	endif
endscript

script rt_guitar_remate_2 \{from_boot = 0}
	printf \{"rt_guitar_remate_2: start"}
	rt_mated_guitars = 0
	rt_right_wasnt_found = 0
	rt_left_wasnt_found = 0
	rt_ok_to_set = 1
	rt_first_guitar_mated = 2
	rt_first_side_set = 2
	rt_last_left = 0
	rt_last_right = 0
	Change \{rt_guitar_right_enabled = 0}
	Change \{rt_guitar_left_enabled = 0}
	if ($rt_mating_guitars = 0)
		printf \{"rt_guitar_remate_2: not mating, so let's set we are"}
		rt_guitar_left_status :SetProps \{text = "waiting"}
		rt_guitar_left_status :SetProps \{rgba = [
				255
				255
				20
				255
			]}
		rt_guitar_left_sprite :SetProps \{rgba = [
				0
				0
				0
				255
			]}
		rt_guitar_right_status :SetProps \{text = "waiting"}
		rt_guitar_right_status :SetProps \{rgba = [
				255
				255
				20
				255
			]}
		rt_guitar_right_sprite :SetProps \{rgba = [
				0
				0
				0
				255
			]}
		Change \{rt_mating_guitars = 1}
		Change \{rt_guitar_left_bounce = 0}
		Change \{rt_guitar_right_bounce = 0}
		rt_num_active_guitars
		num_controllers_can_mate = <num_active_guitars>
		printf "rt_guitar_remate_2: we can mate %d guitars" d = <num_controllers_can_mate>
		sideToSet = 0
		if (<num_controllers_can_mate>)
			begin
			printf "rt_guitar_remate_2: %d guitars left in loop" d = <num_controllers_can_mate>
			SetScreenElementProps \{id = rt_status_text1
				text = "Hold green fret down on"}
			SetScreenElementProps \{id = rt_status_text2
				text = "guitar you want to mate."}
			SetScreenElementProps \{id = rt_status_text3
				text = "Press the start button to"}
			SetScreenElementProps \{id = rt_status_text4
				text = "mate the guitar to that side."}
			begin
			CheckStartWaitingCount
			if (<start1_waiting> || <start2_waiting>)
				if (<start1_waiting>)
					printf \{"rt_guitar_remate_2: left start pressed"}
					if ((<rt_mated_guitars> = 1) && (<rt_first_side_set> = 0))
						printf \{"rt_guitar_remate_2: whoops, same side pressed as last mate!"}
						<rt_ok_to_set> = 0
					else
						<rt_ok_to_set> = 1
						<sideToSet> = 0
					endif
				else
					printf \{"rt_guitar_remate_2: right start pressed"}
					if ((<rt_mated_guitars> = 1) && (<rt_first_side_set> = 1))
						printf \{"rt_guitar_remate_2: whoops, same side pressed as last mate!"}
						<rt_ok_to_set> = 0
					else
						<rt_ok_to_set> = 1
						<sideToSet> = 1
					endif
				endif
				ClearStartWaitingCount
				break
			endif
			Wait \{1
				Frame}
			repeat
			if (<rt_ok_to_set>)
				printf \{"rt_guitar_remate_2: waiting for fret"}
				rt_guitar_check_for_pressed \{which_fret = green}
				if (<rt_mated_guitars> = 1)
					printf "rt_guitar_remate_2: rt_first_guitar_mated = %d" d = <rt_first_guitar_mated>
				endif
				if ((<rt_first_guitar_mated> = $rt_which_guitar_pressed) && (<rt_mated_guitars> = 1))
					SetScreenElementProps \{id = rt_status_text1
						text = "Guitar already mated."}
					SetScreenElementProps \{id = rt_status_text2
						text = "Please mate the"}
					SetScreenElementProps \{id = rt_status_text3
						text = "other guitar."}
					SetScreenElementProps \{id = rt_status_text4
						text = ""}
					Wait \{2
						Seconds}
				else
					begin
					printf "rt_guitar_remate_2: mating device %d to %e" d = $rt_which_guitar_pressed e = <sideToSet>
					MateGuitarToSide controller = $rt_which_guitar_pressed whichSide = <sideToSet>
					Wait \{0.25
						Seconds}
					CheckWhichGuitarSide \{controller = $rt_which_guitar_pressed}
					if (<sideToSet> = 0)
						if (<leftGuitar> = 1)
							rt_guitar_left_status :SetProps \{text = "mated"}
							rt_guitar_left_status :SetProps \{rgba = [
									90
									255
									20
									255
								]}
							rt_guitar_left_sprite :SetProps \{rgba = [
									255
									255
									255
									255
								]}
							<rt_last_left> = $player1_device
							Change \{player1_device = $rt_which_guitar_pressed}
							Change \{structurename = player1_status
								controller = $rt_which_guitar_pressed}
							if ($rt_guitar_left_initialized = 0)
								<rt_left_wasnt_found> = 1
							endif
							Change \{rt_guitar_left_initialized = 1}
							Change \{rt_guitar_left_enabled = 1}
							Change \{rt_guitar_left_mate_changed = 1}
							SetScreenElementProps \{id = rt_status_text1
								text = "Left guitar mated"}
							SetScreenElementProps \{id = rt_status_text2
								text = ""}
							SetScreenElementProps \{id = rt_status_text3
								text = ""}
							SetScreenElementProps \{id = rt_status_text4
								text = ""}
							<rt_mated_guitars> = (<rt_mated_guitars> + 1)
							break
						endif
					else
						if (<rightGuitar> = 1)
							rt_guitar_right_status :SetProps \{text = "mated"}
							rt_guitar_right_status :SetProps \{rgba = [
									90
									255
									20
									255
								]}
							rt_guitar_right_sprite :SetProps \{rgba = [
									255
									255
									255
									255
								]}
							<rt_last_right> = $player2_device
							Change \{player2_device = $rt_which_guitar_pressed}
							Change \{structurename = player2_status
								controller = $rt_which_guitar_pressed}
							if ($rt_guitar_right_initialized = 0)
								<rt_right_wasnt_found> = 1
							endif
							Change \{rt_guitar_right_initialized = 1}
							Change \{rt_guitar_right_enabled = 1}
							Change \{rt_guitar_right_mate_changed = 1}
							SetScreenElementProps \{id = rt_status_text1
								text = "Right guitar mated"}
							SetScreenElementProps \{id = rt_status_text2
								text = ""}
							SetScreenElementProps \{id = rt_status_text3
								text = ""}
							SetScreenElementProps \{id = rt_status_text4
								text = ""}
							<rt_mated_guitars> = (<rt_mated_guitars> + 1)
							break
						endif
					endif
					repeat
					if (<rt_mated_guitars> = 1)
						<rt_first_side_set> = <sideToSet>
						<rt_first_guitar_mated> = $rt_which_guitar_pressed
						printf "rt_guitar_remate_2: rt_first_side_set now = %d, rt_first_guitar_mated = %e" d = <rt_first_side_set> e = <rt_first_guitar_mated>
					else
						printf "rt_guitar_remate_2: rt_mated_guitars now = %d" d = <rt_mated_guitars>
					endif
					Wait \{1
						Second}
					<num_controllers_can_mate> = (<num_controllers_can_mate> - 1)
					printf "rt_guitar_remate_2: num_controllers_can_mate now %d" d = <num_controllers_can_mate>
					if (<num_controllers_can_mate> = 0)
						break
					endif
				endif
			else
				SetScreenElementProps \{id = rt_status_text1
					text = "Can't mate guitar"}
				SetScreenElementProps \{id = rt_status_text2
					text = "to the same side."}
				SetScreenElementProps \{id = rt_status_text3
					text = "Please remate to"}
				SetScreenElementProps \{id = rt_status_text4
					text = "a different side."}
				Wait \{2
					Seconds}
			endif
			repeat
		endif
		SetScreenElementProps \{id = rt_status_text1
			text = "Mating complete"}
		if (<from_boot> = 0)
			SetScreenElementProps \{id = rt_status_text2
				text = "Hit red fret to exit"}
			SetScreenElementProps \{id = rt_status_text3
				text = "or orange fret to mate"}
			SetScreenElementProps \{id = rt_status_text4
				text = "again"}
		else
			SetScreenElementProps \{id = rt_status_text2
				text = ""}
			SetScreenElementProps \{id = rt_status_text3
				text = ""}
			SetScreenElementProps \{id = rt_status_text4
				text = ""}
		endif
		if (<rt_mated_guitars> = 1)
			printf \{"rt_guitar_remate_2: only one guitar mated"}
			if (($rt_guitar_left_enabled = 1) && ($rt_guitar_left_mate_changed = 1))
				printf \{"rt_guitar_remate_2: setting right guitar to not found"}
				rt_guitar_right_status :SetProps \{text = "not found"}
				rt_guitar_right_status :SetProps \{rgba = [
						255
						90
						20
						255
					]}
				rt_guitar_right_sprite :SetProps \{rgba = [
						0
						0
						0
						255
					]}
				if (<rt_left_wasnt_found>)
					printf \{"rt_guitar_remate_2: right guitar uninitialized"}
					Change \{rt_guitar_right_initialized = 0}
				endif
				printf \{"rt_guitar_remate_2: right guitar disabled"}
				Change \{rt_guitar_right_enabled = 0}
				if ($player1_device = $player2_device)
					Change player2_device = <rt_last_left>
					Change structurename = player2_status controller = <rt_last_left>
				endif
			else
				printf \{"rt_guitars_check_status: left not found"}
			endif
			if (($rt_guitar_right_enabled = 1) && ($rt_guitar_right_mate_changed = 1))
				printf \{"rt_guitar_remate_2: setting left guitar to not found"}
				rt_guitar_left_status :SetProps \{text = "not found"}
				rt_guitar_left_status :SetProps \{rgba = [
						255
						90
						20
						255
					]}
				rt_guitar_left_sprite :SetProps \{rgba = [
						0
						0
						0
						255
					]}
				if (<rt_right_wasnt_found>)
					printf \{"rt_guitar_remate_2: left guitar uninitialized"}
					Change \{rt_guitar_left_initialized = 0}
				endif
				printf \{"rt_guitar_remate_2: left guitar disabled"}
				Change \{rt_guitar_left_enabled = 0}
				if ($player1_device = $player2_device)
					Change player1_device = <rt_last_right>
					Change structurename = player1_status controller = <rt_last_right>
				endif
			else
				printf \{"rt_guitars_check_status: right not found"}
			endif
		endif
		Change \{rt_mating_guitars = 0}
	endif
	printf \{"rt_guitar_remate_2: done"}
endscript

script rt_guitars_check_status 
	rt_guitars_check
	printf \{"rt_guitars_check_status: start"}
	if (<left_guitar_set> = 1)
		printf \{"rt_guitars_check_status: left found"}
		rt_guitar_left_status :SetProps \{text = "found"}
		rt_guitar_left_status :SetProps \{rgba = [
				90
				255
				20
				255
			]}
		rt_guitar_left_sprite :SetProps \{rgba = [
				255
				255
				255
				255
			]}
	else
		printf \{"rt_guitars_check_status: left not found"}
	endif
	if (<right_guitar_set> = 1)
		printf \{"rt_guitars_check_status: right found"}
		rt_guitar_right_status :SetProps \{text = "found"}
		rt_guitar_right_status :SetProps \{rgba = [
				90
				255
				20
				255
			]}
		rt_guitar_right_sprite :SetProps \{rgba = [
				255
				255
				255
				255
			]}
	else
		printf \{"rt_guitars_check_status: right not found"}
	endif
	rt_guitar_remate_2 \{from_boot = 1}
	Wait \{5
		Seconds}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script check_rt_guitars 
	num_controllers_can_mate = 0
	found_left = 0
	found_right = 0
	duplicate_mated = 0
	if (arcade_use_mating = 1)
		active_controllers = [0 0 0 0]
		GetActiveControllers
		GetInputHandlerBotIndex \{Player = 1}
		max_num_controllers_to_check = $rt_max_controllers_to_check
		controller_index = 0
		begin
		if (<active_controllers> [<controller_index>] = 1)
			CheckWhichGuitarSide controller = <controller_index>
			<max_num_controllers_to_check> = (<max_num_controllers_to_check> - 1)
			if (<isRTGuitar> = 1)
				if ((<leftGuitar> = 1) || (<rightGuitar> = 1))
					if (<leftGuitar> = 1)
						if (<found_left> = 0)
							<found_left> = 1
							Change player1_device = <controller_index>
							Change structurename = player1_status controller = <controller_index>
							Change \{rt_guitar_left_initialized = 1}
							Change \{rt_guitar_left_enabled = 1}
							printf "check_rt_guitars: left guitar found index %d (p1_dev = %e, p1_stat.ctrl = %f)" d = <controller_index> e = $player1_device f = ($player1_status.controller)
						else
							printf \{"check_rt_guitars: duplicate lefts found, setting to remate all"}
							<duplicate_mated> = 1
							<num_controllers_can_mate> = (2)
							Change \{rt_guitar_left_initialized = 0}
							Change \{rt_guitar_left_enabled = 0}
						endif
					else
						if (<found_right> = 0)
							<found_right> = 1
							Change player2_device = <controller_index>
							Change structurename = player2_status controller = <controller_index>
							Change \{rt_guitar_right_initialized = 1}
							Change \{rt_guitar_right_enabled = 1}
							printf "check_rt_guitars: right guitar found index %d (p2_dev = %e, p2_stat.ctrl = %f)" d = <controller_index> e = $player2_device f = ($player2_status.controller)
						else
							printf \{"check_rt_guitars: duplicate rights found, setting to remate all"}
							<duplicate_mated> = 1
							<num_controllers_can_mate> = (2)
							Change \{rt_guitar_right_initialized = 0}
							Change \{rt_guitar_right_enabled = 0}
						endif
					endif
				else
					Increment \{num_controllers_can_mate}
				endif
			endif
		endif
		<controller_index> = (<controller_index> + 1)
		if ((<max_num_controllers_to_check> = 0) || (<duplicate_mated> = 1))
			break
		endif
		repeat <controller>
		rt_check_and_save_guitar_state
	endif
	printf "check_rt_guitars: returning %d controllers that should mate" d = <num_controllers_can_mate>
	return unmated_controllers = <num_controllers_can_mate>
endscript

script rt_check_and_save_guitar_state 
	GetGlobalTags \{arcade_audits}
	<arcade_left_guitar_device> = $player1_device
	<arcade_right_guitar_device> = $player2_device
	SetGlobalTags arcade_audits params = {arcade_left_guitar_device = <arcade_left_guitar_device> , arcade_right_guitar_device = <arcade_right_guitar_device>}
endscript

script rt_swap_guitars 
	printf "rt_swap_guitars: before controller p1=%d p2=%e" d = ($player1_status.controller) e = ($player2_status.controller)
	printf \{"rt_swap_guitars: before device p1=%d p2=%e"
		d = $player1_device
		e = $player2_device}
	cur_player_one = ($player1_status.controller)
	cur_player_two = ($player2_status.controller)
	Change structurename = player1_status controller = <cur_player_two>
	Change structurename = player2_status controller = <cur_player_one>
	<cur_player_one> = $player1_device
	<cur_player_two> = $player2_device
	Change player1_device = <cur_player_two>
	Change player2_device = <cur_player_one>
	rt_check_and_save_guitar_state
	SoundEvent \{event = Box_Check_SFX}
	printf "rt_swap_guitars: adjusts after left=%d right=%e [swaptest]" d = (<arcade_left_guitar_device>) e = (<arcade_right_guitar_device>)
endscript

script rt_bounce_guitar 
	printf \{"rt_bounce_guitar: start"}
	begin
	if ($rt_guitar_left_bounce = 1)
		if ScreenElementExists \{id = rt_guitar_left_sprite}
			printf \{"rt_bounce_guitar: left set 1"}
			rt_guitar_left_sprite :GetTags
			DoScreenElementMorph id = rt_guitar_left_sprite Pos = (<old_pos> + (10.0, 15.0)) time = 0.5 motion = ease_out
		endif
	endif
	if ($rt_guitar_right_bounce = 1)
		if ScreenElementExists \{id = rt_guitar_right_sprite}
			printf \{"rt_bounce_guitar: right set 1"}
			rt_guitar_right_sprite :GetTags
			DoScreenElementMorph id = rt_guitar_right_sprite Pos = (<old_pos> + (10.0, 15.0)) time = 0.5 motion = ease_out
		endif
	endif
	Wait \{0.5
		Seconds}
	if ($rt_guitar_left_bounce = 1)
		if ScreenElementExists \{id = rt_guitar_left_sprite}
			printf \{"rt_bounce_guitar: left set 2"}
			rt_guitar_left_sprite :GetTags
			DoScreenElementMorph id = rt_guitar_left_sprite Pos = (<old_pos>) time = 0.5 motion = ease_in
		endif
	endif
	if ($rt_guitar_right_bounce = 1)
		if ScreenElementExists \{id = rt_guitar_right_sprite}
			printf \{"rt_bounce_guitar: right set 1"}
			rt_guitar_right_sprite :GetTags
			DoScreenElementMorph id = rt_guitar_right_sprite Pos = (<old_pos>) time = 0.5 motion = ease_in
		endif
	endif
	Wait \{0.5
		Seconds}
	repeat
endscript

script create_rt_guitar_watch_stuff 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = rt_guitar_status_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		id = rt_guitar_status_left_container
		parent = rt_guitar_status_container
		Pos = (0.0, 0.0)}
	displayText \{parent = rt_guitar_status_left_container
		text = "LEFT GUITAR"
		id = rt_left_status_text1
		Pos = (50.0, 670.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 10008
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	displayText \{parent = rt_guitar_status_left_container
		text = "NOT FOUND"
		id = rt_left_status_text2
		Pos = (50.0, 695.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 10008
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = ContainerElement
		id = rt_guitar_status_right_container
		parent = rt_guitar_status_container
		Pos = (0.0, 0.0)}
	displayText \{parent = rt_guitar_status_right_container
		text = "RIGHT GUITAR"
		id = rt_right_status_text1
		Pos = (1220.0, 670.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 10008
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	displayText \{parent = rt_guitar_status_right_container
		text = "NOT FOUND"
		id = rt_right_status_text2
		Pos = (1220.0, 695.0)
		Scale = 0.5
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a11
		z = 10008
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	if ($rt_guitar_left_initialized = 0)
		printf \{"create_rt_guitar_watch_stuff: left guitar uninitialized"}
		rt_guitar_status_left_container :DoMorph \{alpha = 1
			time = 0}
	else
		printf \{"create_rt_guitar_watch_stuff: left guitar initialized"}
		rt_guitar_status_left_container :DoMorph \{alpha = 0
			time = 0}
	endif
	if ($rt_guitar_right_initialized = 0)
		printf \{"create_rt_guitar_watch_stuff: right guitar uninitialized"}
		rt_guitar_status_right_container :DoMorph \{alpha = 1
			time = 0}
	else
		printf \{"create_rt_guitar_watch_stuff: right guitar initialized"}
		rt_guitar_status_right_container :DoMorph \{alpha = 0
			time = 0}
	endif
	SpawnScriptNow \{rt_guitar_watch}
	SpawnScriptNow \{rt_IO_board_watch}
endscript

script rt_guitar_watch 
	printf \{"rt_guitar_watch: start"}
	begin
	if ($rt_mating_guitars = 0)
		if (($rt_guitar_left_initialized = 1) || ($rt_guitar_left_mate_changed = 1))
			IfGuitarStillPluggedIn \{controller = $player1_device}
			if (<isPluggedIn> = 0)
				if (($rt_guitar_left_enabled = 1) || ($rt_guitar_left_mate_changed = 1))
					if ($rt_guitar_left_mate_changed = 0)
						GetGlobalTags \{arcade_audits}
						<arcade_guitar_left_drops> = (<arcade_guitar_left_drops> + 1)
						SetGlobalTags arcade_audits params = {arcade_guitar_left_drops = <arcade_guitar_left_drops>}
						if ($rt_file_output_guitar_info != 0)
							write_rt_debug_info \{output_text = 'Left guitar drop detected'}
						endif
					endif
					Change \{rt_guitar_left_enabled = 0}
					rt_left_status_text2 :SetProps \{text = "DISABLED"}
					rt_guitar_status_left_container :DoMorph \{alpha = 1
						time = 0}
					if (($arcade_in_menu = 1) || ($arcade_in_game = 1))
						if NOT ($game_mode = p1_quickplay)
							PauseGame
							rt_guitar_create_disconnect_menu
							rt_guitar_wait_for_guitar \{which_player = 1}
							rt_guitar_destroy_disconnect_menu
							UnPauseGame
						else
							if ($active_player = 1)
								PauseGame
								rt_guitar_create_disconnect_menu
								rt_guitar_wait_for_guitar \{which_player = 1}
								rt_guitar_destroy_disconnect_menu
								UnPauseGame
							endif
						endif
					endif
				else
					rt_guitar_status_left_container :GetProps
					if (<alpha> = 0)
						rt_left_status_text2 :SetProps \{text = "DISABLED"}
						rt_guitar_status_left_container :DoMorph \{alpha = 1
							time = 0}
					endif
				endif
			else
				if (($rt_guitar_left_enabled = 0) || ($rt_guitar_left_mate_changed = 1))
					Change \{rt_guitar_left_enabled = 1}
					if ($rt_game_out_of_order = 1)
						destroy_rt_out_of_order_message
						Change \{rt_game_out_of_order = 0}
					endif
					rt_guitar_status_left_container :DoMorph \{alpha = 0
						time = 0}
				endif
			endif
			Change \{rt_guitar_left_mate_changed = 0}
		else
			rt_guitar_status_left_container :GetProps
			if ($rt_file_output_guitar_info != 0)
				if ($rt_guitar_left_boot_message = 0)
					write_rt_debug_info \{output_text = 'Left guitar not found at boot'}
					Change \{rt_guitar_left_boot_message = 1}
				endif
			endif
			if (<alpha> = 0)
				rt_left_status_text2 :SetProps \{text = "NOT FOUND"}
				rt_guitar_status_left_container :DoMorph \{alpha = 1
					time = 0}
			endif
		endif
		if (($rt_guitar_right_initialized = 1) || ($rt_guitar_right_mate_changed = 1))
			IfGuitarStillPluggedIn \{controller = $player2_device}
			if (<isPluggedIn> = 0)
				if (($rt_guitar_right_enabled = 1) || ($rt_guitar_right_mate_changed = 1))
					printf \{"rt_guitar_watch: right guitar (%d) disabled"
						d = $player2_device}
					if ($rt_guitar_right_mate_changed = 0)
						GetGlobalTags \{arcade_audits}
						<arcade_guitar_right_drops> = (<arcade_guitar_right_drops> + 1)
						SetGlobalTags arcade_audits params = {arcade_guitar_right_drops = <arcade_guitar_right_drops>}
						if ($rt_file_output_guitar_info != 0)
							write_rt_debug_info \{output_text = 'Right guitar drop detected'}
						endif
					endif
					Change \{rt_guitar_right_enabled = 0}
					rt_right_status_text2 :SetProps \{text = "DISABLED"}
					rt_guitar_status_right_container :DoMorph \{alpha = 1
						time = 0}
					if (($arcade_in_menu = 1) || ($arcade_in_game = 1))
						if NOT ($game_mode = p1_quickplay)
							PauseGame
							rt_guitar_create_disconnect_menu
							rt_guitar_wait_for_guitar \{which_player = 2}
							rt_guitar_destroy_disconnect_menu
							UnPauseGame
						else
							if ($active_player = 2)
								PauseGame
								rt_guitar_create_disconnect_menu
								rt_guitar_wait_for_guitar \{which_player = 2}
								rt_guitar_destroy_disconnect_menu
								UnPauseGame
							endif
						endif
					endif
				else
					rt_guitar_status_right_container :GetProps
					printf "rt_guitar_watch: right alpha = %d" d = <alpha>
					if (<alpha> = 0)
						rt_right_status_text2 :SetProps \{text = "DISABLED"}
						rt_guitar_status_right_container :DoMorph \{alpha = 1
							time = 0}
					endif
				endif
			else
				if (($rt_guitar_right_enabled = 0) || ($rt_guitar_right_mate_changed = 1))
					Change \{rt_guitar_right_enabled = 1}
					if ($rt_game_out_of_order = 1)
						destroy_rt_out_of_order_message
						Change \{rt_game_out_of_order = 0}
					endif
					rt_guitar_status_right_container :DoMorph \{alpha = 0
						time = 0}
				endif
			endif
			Change \{rt_guitar_right_mate_changed = 0}
		else
			rt_guitar_status_right_container :GetProps
			if ($rt_file_output_guitar_info != 0)
				if ($rt_guitar_right_boot_message = 0)
					write_rt_debug_info \{output_text = 'Right guitar not found at boot'}
					Change \{rt_guitar_right_boot_message = 1}
				endif
			endif
			if (<alpha> = 0)
				rt_right_status_text2 :SetProps \{text = "NOT FOUND"}
				rt_guitar_status_right_container :DoMorph \{alpha = 1
					time = 0}
			endif
		endif
		if ((($rt_guitar_right_enabled = 0) && ($rt_guitar_left_enabled = 0)) || (($rt_guitar_right_initialized = 0) && ($rt_guitar_left_initialized = 0)))
			if (($is_attract_mode = 1) && ($rt_game_out_of_order = 0))
				Change \{rt_game_out_of_order = 1}
				create_rt_out_of_order_message \{status = no_guitars}
			endif
		endif
	endif
	Wait \{2
		Seconds}
	repeat
endscript

script rt_guitar_create_disconnect_menu 
	printf \{"rt_guitar_create_disconnect_menu: start"}
	CreateScreenElement \{Type = ContainerElement
		id = rt_disconnect_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displaySprite \{id = rt_disconnect_bg_overlay
		parent = root_window
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		z = 10009
		dims = (1280.0, 720.0)}
	CreateScreenElement \{Type = SpriteElement
		id = rt_disconnect_bg
		parent = rt_disconnect_container
		texture = Encore_Menu_BG
		rgba = [
			255
			0
			0
			255
		]
		Pos = (640.0, 360.0)
		Scale = 2.7
		just = [
			center
			center
		]
		z_priority = 10010
		alpha = 1}
	CreateScreenElement \{Type = SpriteElement
		id = rt_disconnect_bg_title
		parent = rt_disconnect_container
		texture = Encore_Menu_BG
		rgba = [
			255
			0
			0
			255
		]
		Pos = (640.0, 240.0)
		Scale = (1.0, 0.6)
		just = [
			center
			center
		]
		z_priority = 10011
		alpha = 1}
	CreateScreenElement \{Type = TextElement
		parent = rt_disconnect_container
		font = text_a4
		Scale = 0.65000004
		rgba = [
			255
			255
			255
			255
		]
		text = "GUITAR ERROR"
		id = rt_disconnect_title_1
		Pos = (640.0, 232.0)
		just = [
			center
			center
		]
		z_priority = 10012
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextElement
		parent = rt_disconnect_container
		font = text_a4
		Scale = 0.9
		rgba = [
			255
			255
			255
			255
		]
		text = "Searching for right guitar"
		id = rt_disconnect_msg_1
		Pos = (650.0, 315.0)
		just = [
			center
			center
		]
		z_priority = 10011
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextElement
		parent = rt_disconnect_container
		id = rt_disconnect_timer
		font = text_a4
		Scale = 1.6
		rgba = [
			255
			255
			255
			255
		]
		text = "15"
		Pos = (650.0, 390.0)
		just = [
			center
			center
		]
		rot_angle = 0
		z_priority = 10011
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	printf \{"rt_guitar_create_disconnect_menu: done"}
endscript

script rt_guitar_destroy_disconnect_menu 
	if ScreenElementExists \{id = rt_disconnect_bg_overlay}
		DestroyScreenElement \{id = rt_disconnect_bg_overlay}
	endif
	if ScreenElementExists \{id = rt_disconnect_container}
		DestroyScreenElement \{id = rt_disconnect_container}
	endif
endscript

script rt_guitar_wait_for_guitar 
	printf \{"rt_guitar_wait_for_guitar: start"}
	rt_timer_val = 15
	GetGlobalTags \{arcade_audits}
	<arcade_guitar_drops_in_game> = (<arcade_guitar_drops_in_game> + 1)
	SetGlobalTags arcade_audits params = {arcade_guitar_drops_in_game = <arcade_guitar_drops_in_game>}
	if (<which_player> = 1)
		which_device = $player1_device
		rt_disconnect_msg_1 :SetProps \{text = "Searching for left guitar"}
	else
		which_device = $player2_device
		rt_disconnect_msg_1 :SetProps \{text = "Searching for right guitar"}
	endif
	begin
	formatText TextName = timer_current "%d" d = <rt_timer_val>
	rt_disconnect_timer :SetProps text = <timer_current>
	printf "rt_guitar_wait_for_guitar: timer now %d" d = <rt_timer_val>
	IfGuitarStillPluggedIn controller = <which_device>
	if (<isPluggedIn> = 1)
		printf \{"rt_guitar_wait_for_guitar: device returned"}
		device_returned = 1
		if (<which_player> = 1)
			Change \{rt_guitar_left_enabled = 1}
			rt_guitar_status_left_container :DoMorph \{alpha = 0
				time = 0}
		else
			Change \{rt_guitar_right_enabled = 1}
			rt_guitar_status_right_container :DoMorph \{alpha = 0
				time = 0}
		endif
		break
	endif
	Wait \{1
		Second}
	if (<isPluggedIn> = 1)
		printf \{"rt_guitar_wait_for_guitar: device returned"}
		device_returned = 1
		if (<which_player> = 1)
			Change \{rt_guitar_left_enabled = 1}
			rt_guitar_status_left_container :DoMorph \{alpha = 0
				time = 0}
		else
			Change \{rt_guitar_right_enabled = 1}
			rt_guitar_status_right_container :DoMorph \{alpha = 0
				time = 0}
		endif
		break
	endif
	<rt_timer_val> = (<rt_timer_val> - 1)
	formatText \{TextName = timer_current
		"%d"
		d = $rt_timer_val}
	rt_disconnect_timer :SetProps text = <timer_current>
	if (<rt_timer_val> <= 0)
		printf \{"rt_guitar_wait_for_guitar: timer expired"}
		device_returned = 0
		break
	endif
	repeat
	if (<device_returned> = 0)
		rt_disconnect_msg_1 :SetProps \{text = "Guitar not found, rebooting."}
		GetGlobalTags \{arcade_audits}
		<arcade_guitar_drop_reboots> = (<arcade_guitar_drop_reboots> + 1)
		SetGlobalTags arcade_audits params = {arcade_guitar_drop_reboots = <arcade_guitar_drop_reboots>}
		if ($rt_file_output_guitar_info != 0)
			write_rt_debug_info \{output_text = 'In game guitar drop reboot triggered'}
		endif
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
		SetWatchdogBlockFlag \{blockState = true}
		Wait \{10
			Seconds}
		printf \{"rt_guitar_wait_for_guitar: rebooting!"}
		ThrowWatchdogBone \{Seconds = 0}
		Wait \{30
			Seconds}
	endif
endscript

script rt_num_active_guitars 
	active_controllers = [0 0 0 0]
	controller_index = 0
	current_active_guitars = 0
	GetActiveControllers
	GetInputHandlerBotIndex \{Player = 1}
	max_num_controllers_to_check = $rt_max_controllers_to_check
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		CheckWhichGuitarSide controller = <controller_index>
		if (<isRTGuitar> = 1)
			<current_active_guitars> = (<current_active_guitars> + 1)
		endif
	endif
	<max_num_controllers_to_check> = (<max_num_controllers_to_check> - 1)
	<controller_index> = (<controller_index> + 1)
	if ((<max_num_controllers_to_check> = 0))
		break
	endif
	repeat <controller>
	return num_active_guitars = <current_active_guitars>
endscript

script create_rt_out_of_order_message 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = rt_out_of_order_container
		Pos = (0.0, 0.0)}
	displaySprite \{id = rt_out_of_order_bg_overlay
		parent = rt_out_of_order_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		z = 10009
		dims = (1280.0, 720.0)}
	CreateScreenElement \{Type = SpriteElement
		id = rt_disconnect_bg
		parent = rt_out_of_order_container
		texture = Encore_Menu_BG
		rgba = [
			255
			0
			0
			255
		]
		Pos = (640.0, 360.0)
		Scale = 2.5
		just = [
			center
			center
		]
		z_priority = 10010
		alpha = 1}
	CreateScreenElement \{Type = ContainerElement
		parent = rt_out_of_order_container
		id = rt_out_of_order_text_container
		Pos = (0.0, 0.0)}
	displayText \{parent = rt_out_of_order_container
		id = rt_out_of_order_detail_text
		Pos = (640.0, 320.0)
		Scale = 1.2
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10011
		shadow_offs = (2.0, 2.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	displayText \{parent = rt_out_of_order_container
		text = "CALL ATTENDANT"
		Pos = (640.0, 370.0)
		Scale = 1.2
		just = [
			center
			center
		]
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10011
		shadow_offs = (2.0, 2.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	switch <status>
		case no_guitars
		rt_out_of_order_detail_text :SetProps \{text = "GUITAR MALFUNCTION"}
		case no_io_board
		rt_out_of_order_detail_text :SetProps \{text = "I/O BOARD MALFUNCTION"}
		default
		rt_out_of_order_detail_text :SetProps \{text = "Unknown problem"}
	endswitch
	SpawnScriptNow \{update_rt_out_of_order_message}
endscript

script destroy_rt_out_of_order_message 
	KillSpawnedScript \{Name = update_rt_out_of_order_message}
	destroy_menu \{menu_id = rt_out_of_order_container}
endscript

script update_rt_out_of_order_message 
	begin
	if ($is_test_mode)
		rt_out_of_order_container :DoMorph \{alpha = 0
			time = 0}
	else
		rt_out_of_order_container :DoMorph \{alpha = 1
			time = 0}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script toggle_rt_out_of_order_message 
	printf "toggle_rt_out_of_order_message: called with %s" s = <status>
	if ($rt_game_out_of_order)
		switch <status>
			case out_of_order_hide
			printf \{"toggle_rt_out_of_order_message: hiding"}
			rt_out_of_order_container :DoMorph \{alpha = 0
				time = 0}
			default
			printf \{"toggle_rt_out_of_order_message: unhiding"}
			rt_out_of_order_container :DoMorph \{alpha = 1
				time = 0}
		endswitch
	endif
endscript

script rt_IO_board_watch 
	begin
	CheckIfIOBoardIsPresent
	if NOT (<ioBoardPresent>)
		printf \{"rt_IO_board_watch: board not present"}
		if ($rt_game_out_of_order = 0)
			printf \{"rt_IO_board_watch: game not out of order, setting message"}
			Change \{rt_game_out_of_order = 1}
			create_rt_out_of_order_message \{status = no_io_board}
			GetGlobalTags \{arcade_audits}
			<arcade_io_drops> = (<arcade_io_drops> + 1)
			SetGlobalTags arcade_audits params = {arcade_io_drops = <arcade_io_drops>}
			if ($rt_file_output_IO_drops != 0)
				write_rt_debug_info \{output_text = 'IO board lost'}
			endif
		else
			printf \{"rt_IO_board_watch: game already out of order"}
		endif
	else
		if ($rt_game_out_of_order = 1)
			destroy_rt_out_of_order_message
			Change \{rt_game_out_of_order = 0}
			if ($rt_file_output_IO_drops != 0)
				write_rt_debug_info \{output_text = 'IO board returned'}
			endif
		endif
	endif
	Wait \{5
		Seconds}
	repeat
endscript

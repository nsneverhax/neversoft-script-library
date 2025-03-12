guitar_motion_beat_accuracy = 0.25
guitar_motion_beat_credit = 1000
guitar_motion_beat_points = 10
guitar_motion_background_points = 1.0
guitar_motion_note_hit_points = 50.0
guitar_motion_new_motion_mult = [
	1.0
	0.5
	0.25
	0.1
]
guitar_motions = {
	bounce = {
		id = motion_bounce
		debug_text = qs(0xb87813a4)
		score_logic = beat
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 200
				value = [
					-1.0
					-0.75
				]
			}
			{
				axis = neck_lr
				wait_time = 300
				value = [
					-0.3
					1.0
				]
			}
			{
				axis = neck_lr
				wait_time = 250
				value = [
					-1.0
					-0.75
				]
			}
		]
	}
	jump = {
		id = motion_jump
		debug_text = qs(0x2831879f)
		score_logic = beat
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 200
				value = [
					-1.0
					-0.75
				]
			}
			{
				axis = neck_lr
				wait_time = 300
				min_time = 250
				value = [
					-0.6
					1.0
				]
			}
			{
				axis = neck_lr
				wait_time = 100
				value = [
					-1.0
					-0.75
				]
			}
		]
	}
	big_jump = {
		id = motion_big_jump
		debug_text = qs(0x2e560688)
		score_logic = always
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 200
				value = [
					-1.0
					-0.75
				]
			}
			{
				axis = neck_lr
				wait_time = 300
				min_time = 400
				value = [
					-0.6
					1.0
				]
			}
			{
				axis = neck_lr
				wait_time = 500
				value = [
					-1.0
					-0.75
				]
			}
		]
	}
	behind_the_head_fast = {
		id = motion_behind_the_head
		debug_text = qs(0xeaddda2a)
		score_logic = sustained
		sequence = [
			{
				axis = neck_lr
				value = [
					-1.0
					-0.6
				]
			}
			{
				axis = face_ud
				wait_time = 500
				delta_value = 0.2
			}
			{
				axis = neck_lr
				wait_time = 750
				value = [
					0.2
					1.0
				]
				min_time = 500
			}
		]
	}
	sniper = {
		id = motion_sniper
		debug_text = qs(0x97544c95)
		score_logic = sustained
		sequence = [
			{
				axis = neck_ud
				value = [
					0.01
					1.0
				]
			}
			{
				axis = face_ud
				value = [
					-0.4
					0.2
				]
			}
			{
				axis = face_ud
				wait_time = 720
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 500
				value = [
					-0.2
					0.2
				]
				min_time = 500
			}
		]
	}
	invert = {
		id = motion_invert
		debug_text = qs(0x7416debf)
		score_logic = sustained
		no_repeat = 800
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.3
					0.0
				]
			}
			{
				axis = face_ud
				value = [
					-0.5
					0.0
				]
				wait_time = 250
			}
			{
				axis = neck_ud
				value = [
					0.5
					1.0
				]
				wait_time = 200
				min_time = 500
			}
		]
	}
	battlecry = {
		id = motion_battlecry
		debug_text = qs(0x99cf9691)
		score_logic = always
		sequence = [
			{
				axis = face_ud
				value = [
					-1.0
					-0.8
				]
			}
			{
				axis = neck_lr
				value = [
					0.7
					1.0
				]
				wait_time = 500
			}
			{
				axis = neck_lr
				value = [
					-0.2
					0.0
				]
				wait_time = 250
			}
			{
				axis = neck_lr
				value = [
					0.7
					1.0
				]
				wait_time = 250
			}
			{
				axis = neck_lr
				value = [
					-0.2
					0.0
				]
				wait_time = 250
			}
		]
	}
	snap = {
		id = motion_snap
		debug_text = qs(0xa599c0bb)
		score_logic = always
		sequence = [
			{
				axis = face_ud
				value = [
					-1.0
					-0.3
				]
			}
			{
				axis = neck_ud
				value = [
					-1.0
					-0.6
				]
				wait_time = 500
			}
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
				wait_time = 500
			}
			{
				axis = neck_ud
				value = [
					0.0
					0.0
				]
				wait_time = 250
			}
		]
	}
	guitarspin = {
		id = motion_guitarspin
		debug_text = qs(0x78945283)
		score_logic = always
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.2
					0.2
				]
			}
			{
				axis = neck_lr
				value = [
					0.6
					1.0
				]
				wait_time = 250
			}
			{
				axis = face_ud
				value = [
					0.1
					0.5
				]
				wait_time = 250
			}
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
				wait_time = 250
			}
		]
	}
	powerslide = {
		id = motion_powerslide
		debug_text = qs(0xc8259dbb)
		score_logic = sustained
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.3
					-0.1
				]
			}
			{
				axis = neck_lr
				value_delta = -0.6
				wait_time = 500
			}
			{
				axis = neck_lr
				value_delta = 0.2
				wait_time = 250
			}
			{
				axis = face_ud
				value = [
					-1.0
					-0.2
				]
				wait_time = 250
				min_time = 500
			}
		]
	}
	activate_starpower = {
		id = motion_activate_starpower
		debug_text = qs(0xc7e5f609)
		score_logic = sustained
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.3
					-0.0
				]
			}
			{
				axis = neck_ud
				value = [
					-1.0
					-0.98999995
				]
				wait_time = 250
			}
		]
	}
	dig = {
		id = motion_dig
		debug_text = qs(0x919f81ef)
		score_logic = always
		no_repeat = 200
		sequence = [
			{
				axis = neck_ud
				value = [
					0.6
					1.0
				]
			}
			{
				axis = neck_lr
				value = [
					-1.0
					-0.6
				]
			}
			{
				axis = face_ud
				value = [
					-0.5
					-0.2
				]
				min_time = 100
				wait_time = 150
			}
		]
	}
	jam_dig = {
		id = jam_motion_dig
		debug_text = qs(0xf9357f28)
		no_repeat = 1000
		score_logic = jam_mode
		sequence = [
			{
				axis = neck_ud
				value = [
					0.4
					1.0
				]
			}
			{
				axis = neck_ud
				wait_time = 300
				value = [
					-0.2
					0.2
				]
			}
		]
	}
	lefty = {
		id = motion_lefty
		debug_text = qs(0x094be081)
		score_logic = sustained
		sequence = [
			{
				axis = neck_ud
				value = [
					-1.0
					-0.5
				]
			}
			{
				axis = neck_lr
				value = [
					0.4
					0.6
				]
				wait_time = 500
				min_time = 500
			}
		]
	}
}
guitar_motion_ids = {
	motion_behind_the_head = {
		text = qs(0x88a4da2f)
		score = 50.0
	}
	motion_sniper = {
		text = qs(0xd5962fbb)
		score = 50.0
	}
	motion_invert = {
		text = qs(0x5ead5229)
		score = 50.0
	}
	motion_battlecry = {
		text = qs(0x86602cef)
		score = 50.0
	}
	motion_snap = {
		text = qs(0xdf2f5309)
		score = 50.0
	}
	motion_guitarspin = {
		text = qs(0xf3b3823c)
		score = 50.0
	}
	motion_powerslide = {
		text = qs(0xcf3f9c71)
		score = 50.0
	}
	motion_activate_starpower = {
		text = qs(0x3d1d0b36)
		score = 50.0
	}
	motion_dig = {
		text = qs(0xb66653cf)
		score = 50.0
	}
	motion_lefty = {
		text = qs(0xc4f5c74b)
		score = 50.0
	}
	motion_bounce = {
		text = qs(0x9fc979d3)
		score = 10.0
	}
	motion_jump = {
		text = qs(0x9f1c34e9)
		score = 10.0
	}
	motion_big_jump = {
		text = qs(0x8e478572)
		score = 10.0
	}
	jam_motion_dig = {
		text = qs(0x2b096b30)
	}
}
guitar_motions_test_performed = {
}

script guitar_motion_test 
	setscriptcannotpause
	onexitrun \{guitar_motion_test_end}
	change \{guitar_motions_test_performed = {
		}}
	destroyscreenelement \{id = guitar_motion_test_bg}
	createscreenelement \{id = guitar_motion_test_bg
		parent = root_window
		type = spriteelement
		pos = (0.0, 0.0)
		dims = (1280.0, 250.0)
		texture = white
		rgba = [
			0
			0
			0
			192
		]
		just = [
			left
			top
		]
		z_priority = 1004}
	destroyscreenelement \{id = guitar_motion_test_text}
	createscreenelement \{id = guitar_motion_test_text
		parent = root_window
		type = containerelement
		pos = (250.0, 120.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 1005}
	createscreenelement \{parent = guitar_motion_test_text
		type = textblockelement
		text = qs(0xc5651163)
		pos = (300.0, -70.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.6}
	createscreenelement \{parent = guitar_motion_test_text
		type = textblockelement
		text = qs(0x6368dba4)
		pos = (500.0, -70.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.6}
	createscreenelement \{parent = guitar_motion_test_text
		type = textblockelement
		text = qs(0x29ec13d5)
		pos = (700.0, -70.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a3
		scale = 0.6}
	createscreenelement \{id = guitar_motion_test_text_up
		parent = guitar_motion_test_text
		type = textblockelement
		text = qs(0x03ac90f0)
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a3
		scale = 0.7}
	createscreenelement \{id = guitar_motion_test_text_left
		parent = guitar_motion_test_text
		type = textblockelement
		text = qs(0x03ac90f0)
		pos = (0.0, 30.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a3
		scale = 0.7}
	createscreenelement \{id = guitar_motion_test_text_face
		parent = guitar_motion_test_text
		type = textblockelement
		text = qs(0x03ac90f0)
		pos = (0.0, 60.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a3
		scale = 0.7}
	begin
	if NOT guitarmotion_test \{func = prototype
			player = 1}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script guitar_motion_test_end 
	guitarmotion_test \{func = prototype_end
		player = 1}
	destroyscreenelement \{id = guitar_motion_test_text}
	destroyscreenelement \{id = guitar_motion_test_bg}
endscript

script guitar_motion_got_pattern 
	getplayerinfo <player> text
	formattext checksumname = points_id 'guitar_performance_debug_%s' s = <text>
	if NOT screenelementexists id = <points_id>
		return
	endif
	if gotparam \{pattern}
		if structurecontains structure = $guitar_motions_test_performed <pattern>
			<pattern_count> = ($guitar_motions_test_performed.<pattern>.value + 1)
		else
			<pattern_count> = 1
		endif
		<gmtp> = $guitar_motions_test_performed
		<pattern_struct> = {value = <pattern_count>}
		addparam name = <pattern> value = <pattern_struct> type = structure structure_name = gmtp
		change guitar_motions_test_performed = <gmtp>
		guitar_motion_message text = ($guitar_motions.<pattern>.debug_text)
	elseif gotparam \{pattern_id}
		if structurecontains structure = $guitar_motion_ids <pattern_id>
			guitar_motion_message text = ($guitar_motion_ids.<pattern_id>.text)
		else
			printf 'WARNING: unknown guitar motion pattern id %s' s = <pattern_id>
			guitar_motion_message \{text = qs(0x95d0b0f7)}
		endif
	endif
endscript

script guitar_motion_message 
	createscreenelement {
		parent = root_window
		type = textblockelement
		text = <text>
		font = fontgrid_text_a3
		just = [left center]
		pos = (270.0, 400.0)
		rgba = [192 255 0 255]
		dims = (400.0, 200.0)
		scale = 0.65000004
		z_priority = 1000
		shadow
		shadow_offs = (3.0, 3.0)
	}
	runscriptonscreenelement guitar_motion_message_wait_and_die id = <id>
endscript

script guitar_motion_message_wait_and_die 
	se_setprops \{alpha = 0.1
		pos = {
			(0.0, -70.0)
			relative
		}
		time = 1}
	se_waitprops
	die
endscript

script guitar_motion_show_performance_tally 
	formattext textname = tally_text qs(0x11a2f5cd) s = ($guitar_motions.<foreachin_name>.debug_text) v = <value>
	createscreenelement {
		parent = guitar_motion_performance_menu
		type = textelement
		dims = (100.0, 10.0)
		text = <tally_text>
		font = fontgrid_text_a3
		just = [top left]
		scale = 0.65000004
		allow_expansion
	}
endscript

script guitar_performance_debug_points 
	getplayerinfo <player> text
	formattext checksumname = points_id 'guitar_performance_debug_%s' s = <text>
	if NOT screenelementexists id = <points_id>
		return
	endif
	formattext textname = text qs(0x581d2af2) p = <points>
	createscreenelement {
		parent = <points_id>
		type = textblockelement
		text = <text>
		font = fontgrid_text_a3
		just = [top left]
		pos = (0.0, -34.0)
		rgba = [192 255 0 255]
		dims = (400.0, 0.0)
		z_priority = 1000
		scale = 0.7
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
	}
	runscriptonscreenelement guitar_performance_debug_points_wait_and_die id = <id>
endscript

script guitar_performance_debug_points_wait_and_die 
	se_setprops \{alpha = 0.0
		pos = {
			(0.0, -50.0)
			relative
		}
		motion = ease_in
		time = 1}
	se_waitprops
	die
endscript

script guitar_performance_debug_display 
	formattext checksumname = points_id 'guitar_performance_debug_%s' s = ($<player_status>.text)
	if screenelementexists id = <points_id>
		destroyscreenelement id = <points_id>
	endif
	createscreenelement {
		id = <points_id>
		parent = <parent>
		type = textblockelement
		dims = (200.0, 80.0)
		text = qs(0x03ac90f0)
		rgba = [192 255 0 255]
		pos = (240.0, 370.0)
		font = fontgrid_text_a3
		just = [top left]
		scale = 0.65000004
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
	}
	createscreenelement {
		parent = <parent>
		type = textblockelement
		dims = (200.0, 80.0)
		text = qs(0xbcb2fc3b)
		rgba = [192 255 0 255]
		pos = (240.0, 250.0)
		font = fontgrid_text_a3
		just = [top left]
		scale = 0.65000004
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
	}
endscript

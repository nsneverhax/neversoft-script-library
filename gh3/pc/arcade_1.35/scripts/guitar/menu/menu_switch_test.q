switch_test_guitar_root_pos = (100.0, 0.0)
switch_test_guitar_offset = (990.0, 0.0)
in_switch_test_menu = 0
color_array = [
	[
		0
		165
		130
		255
	]
	[
		230
		80
		90
		255
	]
	[
		220
		160
		25
		255
	]
	[
		0
		135
		210
		255
	]
	[
		215
		120
		40
		255
	]
]
num_guitars = 2
new_switch_test_strum = 0
st_star_power_activated_p1 = 0
st_star_power_activated_p2 = 0
st_star_power_activated_sound_p1 = 0
st_star_power_activated_sound_p2 = 0
st_star_power_interval_timer_p1 = 0
st_star_power_interval_timer_p2 = 0
st_star_power_interval_time = 20

script create_switch_test_menu 
	menu_music_off
	Change \{in_switch_test_menu = 1}
	disable_pause
	clean_up_user_control_helpers
	ClearKeypad
	CreateScreenElement \{Type = ContainerElement
		id = switch_test_container
		parent = root_window
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite \{parent = switch_test_container
		tex = options_video_poster
		rot_angle = 1
		Pos = (640.0, 215.0)
		dims = (820.0, 440.0)
		just = [
			center
			center
		]
		z = 1
		font = $video_settings_menu_font}
	displayText \{parent = switch_test_container
		Pos = (630.0, 350.0)
		just = [
			center
			top
		]
		text = "SWITCH TEST"
		Scale = 1.5
		rgba = [
			240
			235
			0
			255
		]
		font = text_a5}
	switch_test_create_guitars
	CreateScreenElement \{Type = TextElement
		parent = switch_test_container
		id = test_to_exit_switch
		just = [
			center
			bottom
		]
		font = text_a5
		text = "Press TEST to exit"
		Scale = 0.75
		rgba = [
			240
			235
			0
			255
		]
		Pos = (630.0, 726.0)
		z_priority = 51}
	test_to_exit_switch :SetProps \{Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	switch_test_create_pressed_notes
	switch_test_create_keypad
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			255
			255
			255
			255
		]
		id = button_bg2
		Pos = (335.0, 440.0)
		dims = (270.0, 270.0)
		just = [
			left
			top
		]
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			64
			64
			64
			255
		]
		id = button_bg
		Pos = (345.0, 450.0)
		dims = (250.0, 250.0)
		just = [
			left
			top
		]
		z_priority = 2}
	displayText \{parent = switch_test_container
		id = left_start_test_text
		Pos = (408.0, 455.0)
		just = [
			center
			top
		]
		text = "Start 1"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = right_start_test_text
		Pos = (533.0, 455.0)
		just = [
			center
			top
		]
		text = "Start 2"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = test_test_text
		Pos = (408.0, 519.0)
		just = [
			center
			top
		]
		text = "Test"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = vol_up_test_text
		Pos = (533.0, 519.0)
		just = [
			center
			top
		]
		text = "Vol. +"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = service_test_text
		Pos = (408.0, 551.0)
		just = [
			center
			top
		]
		text = "Service"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = vol_down_test_text
		Pos = (533.0, 551.0)
		just = [
			center
			top
		]
		text = "Vol. -"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = coin1_test_text
		Pos = (408.0, 615.0)
		just = [
			center
			top
		]
		text = "Coin 1"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = coin2_test_text
		Pos = (533.0, 615.0)
		just = [
			center
			top
		]
		text = "Coin 2"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = bill_test_text
		Pos = (470.0, 647.0)
		just = [
			center
			top
		]
		text = "Bill"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	SpawnScriptNow \{switch_test_watch_fret_buttons}
	SpawnScriptNow \{switch_test_watch_buttons}
	SpawnScriptNow \{switch_test_watch_keypad}
	SpawnScriptNow \{switch_test_watch_tilt}
	printf \{"create_switch_test_menu: left guitar = %d, right guitar = %e [swaptest]"
		d = $player1_device
		e = $player2_device}
endscript

script destroy_switch_test_menu 
	ClearKeypad
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = switch_test_watch_guitars}
	KillSpawnedScript \{Name = switch_test_animate_id}
	KillSpawnedScript \{Name = switch_test_set_id}
	KillSpawnedScript \{Name = switch_test_watch_guitars}
	KillSpawnedScript \{Name = switch_test_watch_buttons}
	KillSpawnedScript \{Name = switch_test_watch_keypad}
	KillSpawnedScript \{Name = switch_test_watch_fret_buttons}
	KillSpawnedScript \{Name = switch_test_watch_tilt}
	KillSpawnedScript \{Name = create_switch_test_guitar_strum}
	if ScreenElementExists \{id = switch_test_container}
		DestroyScreenElement \{id = switch_test_container}
	endif
	switch_test_destroy_pressed_notes
	Change \{in_switch_test_menu = 0}
endscript

script switch_test_create_guitars 
	displaySprite \{parent = switch_test_container
		id = guitar_1_star_label
		Pos = (170.0, 640.0)
		tex = star_power_test_image_rt
		rgba = [
			255
			255
			255
			255
		]
		just = [
			center
			center
		]
		Scale = 0.3
		z = 20}
	GuitarGetAnalogueInfo \{controller = $player1_device}
	displayText {
		parent = switch_test_container
		id = guitar_1_star_val
		Pos = (160.0, 690.0)
		just = [center center]
		text = <l2raw>
		Scale = 0.7
		rgba = [255 255 255 255]
		font = text_a4
		z = 19
	}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		texture = menu_pause_frame_banner
		rgba = [
			255
			255
			255
			255
		]
		id = guitar1_titlebg
		Pos = (160.0, 80.0)
		just = [
			center
			center
		]
		z_priority = 1
		Scale = 1.2}
	displayText \{parent = switch_test_container
		id = guitar1_title
		Pos = (160.0, 52.0)
		just = [
			center
			center
		]
		text = "Left Guitar"
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			255
			255
			255
			255
		]
		id = guitar1_bg2
		Pos = (30.0, 145.0)
		dims = (260.0, 430.0)
		just = [
			left
			top
		]
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			64
			64
			64
			255
		]
		id = guitar1_bg
		Pos = (40.0, 155.0)
		dims = (240.0, 410.0)
		just = [
			left
			top
		]
		z_priority = 2}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_greenfret
		Pos = (50.0, 165.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_greenfrettext
		Pos = (100.0, 165.0)
		just = [
			left
			top
		]
		text = "Green Fret"
		rgba = [
			0
			255
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_redfret
		Pos = (50.0, 215.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_redfrettext
		Pos = (100.0, 215.0)
		just = [
			left
			top
		]
		text = "Red Fret"
		rgba = [
			255
			0
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_yellowfret
		Pos = (50.0, 265.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_yellowfrettext
		Pos = (100.0, 265.0)
		just = [
			left
			top
		]
		text = "Yellow Fret"
		rgba = [
			255
			255
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_bluefret
		Pos = (50.0, 315.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_bluefrettext
		Pos = (100.0, 315.0)
		just = [
			left
			top
		]
		text = "Blue Fret"
		rgba = [
			0
			0
			255
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_orangefret
		Pos = (50.0, 365.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_orangefrettext
		Pos = (100.0, 365.0)
		just = [
			left
			top
		]
		text = "Orange Fret"
		rgba = [
			255
			128
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_strumup
		Pos = (50.0, 465.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_strumuptext
		Pos = (100.0, 465.0)
		just = [
			left
			top
		]
		text = "Strum Up"
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar1_strumdown
		Pos = (50.0, 515.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar1_strumdowntext
		Pos = (100.0, 515.0)
		just = [
			left
			top
		]
		text = "Strum Down"
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	displaySprite \{parent = switch_test_container
		id = guitar_2_star_label
		Pos = (1130.0, 640.0)
		tex = star_power_test_image_rt
		rgba = [
			255
			255
			255
			255
		]
		just = [
			center
			center
		]
		Scale = 0.3
		z = 20}
	GuitarGetAnalogueInfo \{controller = $player2_device}
	displayText {
		parent = switch_test_container
		id = guitar_2_star_val
		Pos = (1120.0, 690.0)
		just = [center center]
		Scale = 0.7
		text = <l2raw>
		rgba = [255 255 255 255]
		font = text_a4
		z_priority = 5
	}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		texture = menu_pause_frame_banner
		rgba = [
			255
			255
			255
			255
		]
		id = guitar2_titlebg
		Pos = (1120.0, 80.0)
		just = [
			center
			center
		]
		z_priority = 1
		Scale = 1.2}
	displayText \{parent = switch_test_container
		id = guitar2_title
		Pos = (1120.0, 52.0)
		just = [
			center
			center
		]
		text = "Right Guitar"
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			255
			255
			255
			255
		]
		id = guitar2_bg2
		Pos = (990.0, 145.0)
		dims = (260.0, 430.0)
		just = [
			left
			top
		]
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			64
			64
			64
			255
		]
		id = guitar2_bg
		Pos = (1000.0, 155.0)
		dims = (240.0, 410.0)
		just = [
			left
			top
		]
		z_priority = 2}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_greenfret
		Pos = (1010.0, 165.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_greenfrettext
		Pos = (1060.0, 165.0)
		just = [
			left
			top
		]
		text = "Green Fret"
		rgba = [
			0
			255
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_redfret
		Pos = (1010.0, 215.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_redfrettext
		Pos = (1060.0, 215.0)
		just = [
			left
			top
		]
		text = "Red Fret"
		rgba = [
			255
			0
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_yellowfret
		Pos = (1010.0, 265.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_yellowfrettext
		Pos = (1060.0, 265.0)
		just = [
			left
			top
		]
		text = "Yellow Fret"
		rgba = [
			255
			255
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_bluefret
		Pos = (1010.0, 315.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_bluefrettext
		Pos = (1060.0, 315.0)
		just = [
			left
			top
		]
		text = "Blue Fret"
		rgba = [
			0
			0
			255
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_orangefret
		Pos = (1010.0, 365.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_orangefrettext
		Pos = (1060.0, 365.0)
		just = [
			left
			top
		]
		text = "Orange Fret"
		rgba = [
			255
			128
			0
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_strumup
		Pos = (1010.0, 465.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_strumuptext
		Pos = (1060.0, 465.0)
		just = [
			left
			top
		]
		text = "Strum Up"
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = guitar2_strumdown
		Pos = (1010.0, 515.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = guitar2_strumdowntext
		Pos = (1060.0, 515.0)
		just = [
			left
			top
		]
		text = "Strum Down"
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10
		Scale = 0.7
		Shadow}
	SpawnScriptNow \{switch_test_watch_guitars}
endscript

script switch_test_create_pressed_notes 
	fret_button_offset = (0.0, 67.0)
	index = 0
	start_note_pos = ($switch_test_guitar_root_pos + (8.0, 365.0))
	GetArraySize \{$gem_colors_text}
	cur_pos = <start_note_pos>
	begin
	index2 = 0
	begin
	formatText checksumName = pressed_spr_chk '%s_pressed_sprite_%i' s = ($gem_colors_text [<index2>]) i = <index>
	CreateScreenElement {
		parent = switch_test_container
		Type = SpriteElement
		id = <pressed_spr_chk>
		just = [center center]
		texture = training_guitar_button_down
		Pos = <cur_pos>
		rot_angle = 90
		rgba = ($color_array [<index2>])
		Scale = (0.36, 0.36)
		z_priority = 3
	}
	<cur_pos> = (<cur_pos> + <fret_button_offset>)
	<index2> = (<index2> + 1)
	safe_hide id = <pressed_spr_chk>
	repeat <array_Size>
	<cur_pos> = (<start_note_pos> + $switch_test_guitar_offset)
	<index> = (<index> + 1)
	repeat $num_guitars
endscript

script switch_test_destroy_pressed_notes 
	GetArraySize \{$gem_colors_text}
	index = 0
	begin
	index2 = 0
	begin
	formatText checksumName = sprite_to_destroy '%s_pressed_sprite_%i' s = ($gem_colors_text [<index2>]) i = <index>
	safe_destroy id = <sprite_to_destroy>
	repeat <array_Size>
	repeat $num_guitars
endscript

script switch_test_star_power_flash 
	if ScreenElementExists id = <id>
		<which_star_icon_val> :DoMorph rgba = [0 0 255 255] time = 0.2
		<which_star_icon_id> :DoMorph rgba = [255 255 255 255] time = 1.5
	endif
endscript

script switch_test_star_power_quiet 
	formatText checksumName = which_star_icon_id 'guitar_%d_star_label' d = <which_star>
	formatText checksumName = which_star_icon_val 'guitar_%d_star_val' d = <which_star>
	<which_star_icon_id> :DoMorph rgba = <Color> time = 0
	<which_star_icon_val> :DoMorph rgba = <Color> time = 0
endscript

script switch_test_activate_star_power_test 
	if (<which_star> = 1)
		if ($st_star_power_activated_p1 = 0)
			Change \{st_star_power_activated_p1 = 1}
			formatText checksumName = which_star_icon_id 'guitar_%d_star_label' d = <which_star>
			formatText checksumName = which_star_icon_val 'guitar_%d_star_val' d = <which_star>
			if ($st_star_power_activated_sound_p1 = 0)
				SoundEvent \{event = Star_Power_Deployed_SFX}
				Change \{st_star_power_activated_sound_p1 = 1}
			endif
			SpawnScriptNow switch_test_animate_id params = {id = <which_star_icon_id> Color = [0 0 255 255]}
			SpawnScriptNow switch_test_animate_id params = {id = <which_star_icon_val> Color = [0 0 255 255]}
		endif
	elseif (<which_star> = 2)
		if ($st_star_power_activated_p2 = 0)
			Change \{st_star_power_activated_p2 = 1}
			formatText checksumName = which_star_icon_id 'guitar_%d_star_label' d = <which_star>
			formatText checksumName = which_star_icon_val 'guitar_%d_star_val' d = <which_star>
			if ($st_star_power_activated_sound_p2 = 0)
				SoundEvent \{event = Star_Power_Deployed_SFX}
				Change \{st_star_power_activated_sound_p2 = 1}
			endif
			SpawnScriptNow switch_test_animate_id params = {id = <which_star_icon_id> Color = [0 0 255 255]}
			SpawnScriptNow switch_test_animate_id params = {id = <which_star_icon_val> Color = [0 0 255 255]}
		endif
	endif
endscript
switch_test_coin1_sound = 0
switch_test_coin2_sound = 0
switch_test_bill_sound = 0
switch_test_service_sound = 0
switch_test_start1_sound = 0
switch_test_start2_sound = 0
switch_test_vol_up_sound = 0
switch_test_vol_dn_sound = 0
switch_test_test_sound = 0

script switch_test_watch_fret_buttons 
	Wait \{0.25
		Seconds}
	printf \{"switch_test_watch_fret_buttons: spawned"}
	begin
	which_player = 0
	hold_pattern = 0
	which_guitar = $player1_device
	begin
	printf "switch_test_watch_fret_buttons: checking device %e %d" e = $num_guitars d = <which_guitar>
	if (<which_player> = 0)
		if ($rt_guitar_left_enabled = 1)
			GetHeldPattern controller = <which_guitar> nobrokenstring
		else
			<hold_pattern> = 0
		endif
	else
		if ($rt_guitar_right_enabled = 1)
			GetHeldPattern controller = <which_guitar> nobrokenstring
		else
			<hold_pattern> = 0
		endif
	endif
	check_button = 65536
	array_count = 0
	begin
	if (<hold_pattern> && <check_button>)
		printf "switch_test_watch_fret_buttons: calling show_pressed_note for player %d with device %e" d = <which_player> e = <which_guitar>
		SpawnScriptNow switch_test_show_pressed_note params = {note = <array_count> player_num = <which_player>}
	else
		SpawnScriptNow switch_test_hide_pressed_note params = {note = <array_count> player_num = <which_player>}
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	<which_guitar> = $player2_device
	<which_player> = 1
	repeat $num_guitars
	Wait \{1
		gameframe}
	repeat
	printf \{"switch_test_watch_fret_buttons: exit"}
endscript

script switch_test_watch_tilt 
	Wait \{0.25
		Seconds}
	printf \{"switch_test_watch_tilt: spawned"}
	begin
	which_player = 0
	which_guitar = $player1_device
	l2raw = 0
	begin
	if (<which_player> = 0)
		if ($rt_guitar_left_enabled = 1)
			GuitarGetAnalogueInfo controller = <which_guitar>
		else
			<l2raw> = 0
		endif
	else
		if ($rt_guitar_right_enabled = 1)
			GuitarGetAnalogueInfo controller = <which_guitar>
		else
			<l2raw> = 0
		endif
	endif
	formatText checksumName = player_status 'player%i_status' i = (<which_player> + 1)
	if (<l2raw> >= (<player_status>.star_tilt_threshold_di))
		switch_test_star_power_quiet which_star = (<which_player> + 1) Color = [0 0 255 255]
	else
		switch_test_star_power_quiet which_star = (<which_player> + 1) Color = [255 255 255 255]
	endif
	if (<l2raw> < (<player_status>.star_tilt_threshold_di))
		if (<which_guitar> = 0)
			Change \{st_star_power_activated_sound_p1 = 0}
		elseif (<which_guitar> = 1)
			Change \{st_star_power_activated_sound_p2 = 0}
		endif
	endif
	formatText checksumName = which_star_text_id 'guitar_%d_star_val' d = (<which_player> + 1)
	formatText TextName = star_text_val "%d" d = <l2raw>
	<which_star_text_id> :SetProps text = <star_text_val>
	formatText checksumName = which_star_icon_id 'guitar_%d_star_label' d = (<which_player> + 1)
	<which_star_icon_id> :DoMorph rot_angle = (<l2raw> * 90.0 / 128.0) time = 0.04 motion = ease_out
	if ($st_star_power_activated_p1 = 1)
		if ($st_star_power_interval_timer_p1 = $st_star_power_interval_time)
			Change \{st_star_power_activated_p1 = 0}
			Change \{st_star_power_interval_timer_p1 = 0}
		else
			Change st_star_power_interval_timer_p1 = ($st_star_power_interval_timer_p1 + 1)
		endif
	endif
	if ($st_star_power_activated_p2 = 1)
		if ($st_star_power_interval_timer_p2 = $st_star_power_interval_time)
			Change \{st_star_power_activated_p2 = 0}
			Change \{st_star_power_interval_timer_p2 = 0}
		else
			Change st_star_power_interval_timer_p2 = ($st_star_power_interval_timer_p2 + 1)
		endif
	endif
	<which_guitar> = $player2_device
	<which_player> = 1
	repeat $num_guitars
	Wait \{1
		gameframe}
	repeat
	printf \{"switch_test_watch_tilt: exit"}
endscript

script switch_test_watch_buttons 
	Wait \{0.25
		Seconds}
	printf \{"switch_test_watch_buttons: spawned"}
	begin
	CheckCoinWaitingCount
	CheckCoinDown
	if (<coin1_down>)
		if ($switch_test_coin1_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_coin1_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = coin1_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_coin1_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = coin1_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	if (<coin2_down>)
		if ($switch_test_coin2_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_coin2_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = coin2_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_coin2_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = coin2_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	if (<bill_down>)
		if ($switch_test_bill_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_bill_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = bill_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_bill_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = bill_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	if (<service_down>)
		if ($switch_test_service_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_service_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = service_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_service_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = service_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	ClearCoinWaitingCount
	CheckStartWaitingCount
	CheckStartDown
	if (<start1_down>)
		if ($switch_test_start1_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_start1_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = left_start_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_start1_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = left_start_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	if (<start2_down>)
		if ($switch_test_start2_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_start2_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = right_start_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_start2_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = right_start_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	ClearStartWaitingCount
	CheckVolumeWaitingCount
	CheckVolumeDown
	if (<vol_up_down>)
		if ($switch_test_vol_up_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_vol_up_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = vol_up_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_vol_up_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = vol_up_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	if (<vol_dn_down>)
		if ($switch_test_vol_dn_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_vol_dn_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = vol_down_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_vol_dn_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = vol_down_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	ClearVolumeWaitingCount
	CheckTestDown
	if (<test_down>)
		if ($switch_test_test_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_test_sound = 1}
		endif
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = test_test_text
				Color = [
					0
					255
					0
					255
				]
			}}
	else
		Change \{switch_test_test_sound = 0}
		SpawnScriptNow \{switch_test_set_id
			params = {
				id = test_test_text
				Color = [
					255
					255
					255
					255
				]
			}}
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{"switch_test_watch_buttons: exit"}
endscript

script switch_test_animate_id \{Color = [
			0
			255
			0
			255
		]}
	if ScreenElementExists id = <id>
		<id> :DoMorph rgba = <Color> time = 0.2
		<id> :DoMorph rgba = [255 255 255 255] time = 1
	endif
endscript

script switch_test_set_id \{Color = [
			0
			255
			0
			255
		]}
	if ScreenElementExists id = <id>
		<id> :DoMorph rgba = <Color> time = 0
	endif
endscript

script stop_switch_test_guitar_strum 
	Change \{new_switch_test_strum = 0}
	begin
	if ($new_switch_test_strum = 1)
		StopSoundEvent <event>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
switch_test_note_p1 = 0
switch_test_note_p2 = 0

script switch_test_watch_guitars 
	begin
	if ($rt_guitar_left_enabled = 1)
		GetStrum \{controller = $player1_device}
		if (<strum> > 0)
			SpawnScriptNow create_switch_test_guitar_strum params = {device = $player1_device Player = 1 strum = <strum>}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_strumdown
					Color = [
						0
						0
						0
						255
					]
				}}
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_strumup
					Color = [
						0
						0
						0
						255
					]
				}}
			Change \{switch_test_note_p1 = 0}
		endif
	endif
	if ($rt_guitar_right_enabled = 1)
		GetStrum \{controller = $player2_device}
		if (<strum> > 0)
			SpawnScriptNow create_switch_test_guitar_strum params = {device = $player2_device Player = 2 strum = <strum>}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_strumdown
					Color = [
						0
						0
						0
						255
					]
				}}
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_strumup
					Color = [
						0
						0
						0
						255
					]
				}}
			Change \{switch_test_note_p2 = 0}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_switch_test_guitar_strum 
	printf "create_switch_test_guitar_strum: called with device=%d" d = <device>
	Change \{new_switch_test_strum = 1}
	GetHeldPattern controller = <device> nobrokenstring
	printf "create_switch_test_guitar_strum: hold_pattern=%d" d = <hold_pattern>
	check_button = 65536
	array_count = 0
	if ((<device> = $player1_device && $switch_test_note_p1 = 0) || (<device> = $player2_device && $switch_test_note_p2 = 0))
		switch <hold_pattern>
			case 65536
			SoundEvent \{event = Cheat_Single_Strum_Note_1}
			case 4096
			SoundEvent \{event = Cheat_Single_Strum_Note_2}
			case 256
			SoundEvent \{event = Cheat_Single_Strum_Note_3}
			case 16
			SoundEvent \{event = Cheat_Single_Strum_Note_4}
			case 1
			SoundEvent \{event = Cheat_Single_Strum_Note_5}
			case 69632
			SoundEvent \{event = Cheat_Chord_Strum_1}
			case 65792
			SoundEvent \{event = Cheat_Chord_Strum_10}
			case 65552
			SoundEvent \{event = Cheat_Chord_Strum_4}
			case 4352
			SoundEvent \{event = Cheat_Chord_Strum_2}
			case 4112
			SoundEvent \{event = Cheat_Chord_Strum_3}
			case 4097
			SoundEvent \{event = Cheat_Chord_Strum_6}
			case 272
			SoundEvent \{event = Cheat_Chord_Strum_5}
			case 257
			SoundEvent \{event = Cheat_Chord_Strum_7}
			case 17
			SoundEvent \{event = Cheat_Chord_Strum_8}
			case 69888
			SoundEvent \{event = Cheat_Chord_Strum_9}
			case 4368
			SoundEvent \{event = Cheat_Chord_Strum_11}
			case 273
			SoundEvent \{event = Cheat_Chord_Strum_12}
			default
			SoundEvent \{event = Single_Player_Bad_Note_Guitar}
		endswitch
		if (<device> = $player1_device)
			Change \{switch_test_note_p1 = 1}
		elseif (<device> = $player2_device)
			Change \{switch_test_note_p2 = 1}
		endif
	endif
	if (<Player> = 1)
		if (<strum> > 1)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_strumup
					Color = [
						0
						255
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_strumdown
					Color = [
						0
						255
						0
						255
					]
				}}
		endif
	else
		if (<strum> > 1)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_strumup
					Color = [
						0
						255
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_strumdown
					Color = [
						0
						255
						0
						255
					]
				}}
		endif
	endif
endscript

script switch_test_show_pressed_note 
	printf "switch_test_show_pressed_note: called with note=%d and player_num=%e" d = <note> e = <player_num>
	switch (<note>)
		case 0
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_greenfret
					Color = [
						0
						255
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_greenfret
					Color = [
						0
						255
						0
						255
					]
				}}
		endif
		case 1
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_redfret
					Color = [
						255
						0
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_redfret
					Color = [
						255
						0
						0
						255
					]
				}}
		endif
		case 2
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_yellowfret
					Color = [
						255
						255
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_yellowfret
					Color = [
						255
						255
						0
						255
					]
				}}
		endif
		case 3
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_bluefret
					Color = [
						0
						0
						255
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_bluefret
					Color = [
						0
						0
						255
						255
					]
				}}
		endif
		case 4
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_orangefret
					Color = [
						255
						128
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_orangefret
					Color = [
						255
						128
						0
						255
					]
				}}
		endif
	endswitch
endscript

script switch_test_hide_pressed_note 
	switch (<note>)
		case 0
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_greenfret
					Color = [
						0
						0
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_greenfret
					Color = [
						0
						0
						0
						255
					]
				}}
		endif
		case 1
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_redfret
					Color = [
						0
						0
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_redfret
					Color = [
						0
						0
						0
						255
					]
				}}
		endif
		case 2
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_yellowfret
					Color = [
						0
						0
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_yellowfret
					Color = [
						0
						0
						0
						255
					]
				}}
		endif
		case 3
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_bluefret
					Color = [
						0
						0
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_bluefret
					Color = [
						0
						0
						0
						255
					]
				}}
		endif
		case 4
		if (<player_num> = 0)
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar1_orangefret
					Color = [
						0
						0
						0
						255
					]
				}}
		else
			SpawnScriptNow \{switch_test_set_id
				params = {
					id = guitar2_orangefret
					Color = [
						0
						0
						0
						255
					]
				}}
		endif
	endswitch
endscript

script switch_test_create_keypad 
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			255
			255
			255
			255
		]
		id = keypad_bg2
		Pos = (680.0, 440.0)
		dims = (180.0, 230.0)
		just = [
			left
			top
		]
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			64
			64
			64
			255
		]
		id = keypad_bg
		Pos = (690.0, 450.0)
		dims = (160.0, 210.0)
		just = [
			left
			top
		]
		z_priority = 2}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_1
		Pos = (700.0, 460.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_2
		Pos = (750.0, 460.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_3
		Pos = (800.0, 460.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_4
		Pos = (700.0, 510.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_5
		Pos = (750.0, 510.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_6
		Pos = (800.0, 510.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_7
		Pos = (700.0, 560.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_8
		Pos = (750.0, 560.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_9
		Pos = (800.0, 560.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_star
		Pos = (700.0, 610.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_0
		Pos = (750.0, 610.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	CreateScreenElement \{Type = SpriteElement
		parent = switch_test_container
		rgba = [
			0
			0
			0
			255
		]
		id = keypad_pound
		Pos = (800.0, 610.0)
		dims = (40.0, 40.0)
		just = [
			left
			top
		]
		z_priority = 4}
	displayText \{parent = switch_test_container
		id = keypad_1_text
		Pos = (720.0, 455.0)
		just = [
			center
			top
		]
		text = "1"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_2_text
		Pos = (770.0, 455.0)
		just = [
			center
			top
		]
		text = "2"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_3_text
		Pos = (820.0, 455.0)
		just = [
			center
			top
		]
		text = "3"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_4_text
		Pos = (720.0, 505.0)
		just = [
			center
			top
		]
		text = "4"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_5_text
		Pos = (770.0, 505.0)
		just = [
			center
			top
		]
		text = "5"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_6_text
		Pos = (820.0, 505.0)
		just = [
			center
			top
		]
		text = "6"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_7_text
		Pos = (720.0, 555.0)
		just = [
			center
			top
		]
		text = "7"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_8_text
		Pos = (770.0, 555.0)
		just = [
			center
			top
		]
		text = "8"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_9_text
		Pos = (820.0, 555.0)
		just = [
			center
			top
		]
		text = "9"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_star_text
		Pos = (720.0, 605.0)
		just = [
			center
			top
		]
		text = "*"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_0_text
		Pos = (770.0, 605.0)
		just = [
			center
			top
		]
		text = "0"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
	displayText \{parent = switch_test_container
		id = keypad_pound_text
		Pos = (820.0, 605.0)
		just = [
			center
			top
		]
		text = "#"
		Scale = 0.7
		rgba = [
			255
			255
			255
			255
		]
		font = text_a4
		z = 10}
endscript
switch_test_keypad_1_sound = 0
switch_test_keypad_2_sound = 0
switch_test_keypad_3_sound = 0
switch_test_keypad_4_sound = 0
switch_test_keypad_5_sound = 0
switch_test_keypad_6_sound = 0
switch_test_keypad_7_sound = 0
switch_test_keypad_8_sound = 0
switch_test_keypad_9_sound = 0
switch_test_keypad_star_sound = 0
switch_test_keypad_0_sound = 0
switch_test_keypad_pound_sound = 0

script switch_test_watch_keypad 
	Wait \{0.25
		Seconds}
	printf \{"switch_test_watch_keypad: spawned"}
	begin
	KeypadDown \{key = 1}
	if (<down> = 1)
		if ($switch_test_keypad_1_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_1_sound = 1}
		endif
		keypad_1 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_1_sound = 0}
		keypad_1 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 2}
	if (<down> = 1)
		if ($switch_test_keypad_2_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_2_sound = 1}
		endif
		keypad_2 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_2_sound = 0}
		keypad_2 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 3}
	if (<down> = 1)
		if ($switch_test_keypad_3_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_3_sound = 1}
		endif
		keypad_3 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_3_sound = 0}
		keypad_3 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 4}
	if (<down> = 1)
		if ($switch_test_keypad_4_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_4_sound = 1}
		endif
		keypad_4 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_4_sound = 0}
		keypad_4 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 5}
	if (<down> = 1)
		if ($switch_test_keypad_5_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_5_sound = 1}
		endif
		keypad_5 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_5_sound = 0}
		keypad_5 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 6}
	if (<down> = 1)
		if ($switch_test_keypad_6_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_6_sound = 1}
		endif
		keypad_6 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_6_sound = 0}
		keypad_6 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 7}
	if (<down> = 1)
		if ($switch_test_keypad_7_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_7_sound = 1}
		endif
		keypad_7 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_7_sound = 0}
		keypad_7 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 8}
	if (<down> = 1)
		if ($switch_test_keypad_8_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_8_sound = 1}
		endif
		keypad_8 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_8_sound = 0}
		keypad_8 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 9}
	if (<down> = 1)
		if ($switch_test_keypad_9_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_9_sound = 1}
		endif
		keypad_9 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_9_sound = 0}
		keypad_9 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 10}
	if (<down> = 1)
		if ($switch_test_keypad_star_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_star_sound = 1}
		endif
		keypad_star :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_star_sound = 0}
		keypad_star :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 0}
	if (<down> = 1)
		if ($switch_test_keypad_0_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_0_sound = 1}
		endif
		keypad_0 :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_0_sound = 0}
		keypad_0 :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	KeypadDown \{key = 11}
	if (<down> = 1)
		if ($switch_test_keypad_pound_sound = 0)
			SoundEvent \{event = Practice_Mode_Snare}
			Change \{switch_test_keypad_pound_sound = 1}
		endif
		keypad_pound :SetProps \{rgba = [
				0
				255
				0
				255
			]}
	else
		Change \{switch_test_keypad_pound_sound = 0}
		keypad_pound :SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{"switch_test_watch_keypad: exit"}
endscript

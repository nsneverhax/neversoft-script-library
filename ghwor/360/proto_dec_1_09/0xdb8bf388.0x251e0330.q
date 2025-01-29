0xeee325c8 = {
	Name = 'minigame_travis_test_bed'
	goal_type = game_mode
	checkpoints = [
		{
			Name = 'minigame_intro_screen_CP'
			next_checkpoint = 0xfa3bdeeb
			tools = [
				{
					Name = 'minigame_intro_screen'
					Type = menu
					template = dialog_box
					template_settings = {
						heading_text = qs(0x789decb2)
						body_text = qs(0x1356135c)
						options = [
							{
								text = qs(0x7a1c16f0)
								func = 0xce4802ff
							}
							{
								text = qs(0x55c34bc7)
								func = 0x0b6190a7
							}
						]
					}
				}
			]
		}
		{
			Name = 'minigame_ingame_CP'
			tools = [
				{
					Name = 'minigame_custom_songs'
					Type = custom_song
					beat_callback = 0x77017d8a
					beat_callback_form_time_ms = $0xe43872a0
					rhythm_callback = 0x50d95124
					lead_callback = 0xaa49f0d2
					bass_callback = 0x60412086
					keyboard_callback = 0x66f1c5a4
					drums_callback = 0xe427eda6
					note_callback_form_time_ms = $0x6ea0ff2b
					custom_songs = [
						{
							song = 0x32151024
							file_name = 'echoloco'
							start_measure = 0
						}
						{
							song = 0x4bc7218e
							file_name = 'echoloco'
							start_measure = 0
						}
						{
							song = 0xf8712545
							file_name = 'paintthefires'
							start_measure = 0
						}
					]
				}
				{
					Name = 'minigame_pause'
					Type = Pause
					settings = {
						default_options = {
						}
						custom_options = [
							{
								text = qs(0x67d9c56d)
								func = 0x0b6190a7
							}
						]
					}
				}
			]
		}
	]
}
0xe43872a0 = 100
0x6ea0ff2b = 0

script 0x77017d8a 
	0x52ed48c6 :Obj_SpawnScriptNow 0x49c5e451 params = {beat_num = <beat_num>}
endscript

script 0x50d95124 
	0x52ed48c6 :Obj_SpawnScriptNow 0x7b93fcb1 params = {gem_pattern_array = <gem_pattern_array>}
endscript

script 0xaa49f0d2 
endscript

script 0x60412086 
	0x52ed48c6 :Obj_SpawnScriptNow 0x6a792836 params = {gem_pattern_array = <gem_pattern_array>}
endscript

script 0x66f1c5a4 
endscript

script 0xe427eda6 
	0x52ed48c6 :Obj_SpawnScriptNow 0x28782fa4 params = {gem_pattern_array = <gem_pattern_array>}
endscript

script 0x49c5e451 
	pulse_time = (($0xe43872a0) / 1000.0)
	Mod a = <beat_num> b = 4
	if (<Mod> = 0 || <Mod> = 2)
		se_setprops rot_angle = 1 time = (<pulse_time> / 2)
	else
		se_setprops rot_angle = -1 time = (<pulse_time> / 2)
	endif
	Wait <pulse_time> Seconds
endscript

script 0xce4802ff 
	create_loading_screen
	gman_passcheckpoint \{goal = 0x2b0c327c}
endscript

script 0xde8f55a0 
	0x1f13d01b :obj_spawnscript \{0x0eb239b7}
endscript

script 0x0eb239b7 
	0x2e58bf2e
	0xc543d52b \{goal = 0x2b0c327c
		tool = 0x1c5c11d1
		checkpoint = 0xfa3bdeeb
		func = load
		params = {
			song = 0xf8712545
		}}
	Block \{Type = goal_custom_song_load_complete}
	0xc543d52b \{goal = 0x2b0c327c
		tool = 0x1c5c11d1
		checkpoint = 0xfa3bdeeb
		func = Play}
	0xc543d52b \{goal = 0x2b0c327c
		tool = 0x1c5c11d1
		checkpoint = 0xfa3bdeeb
		func = get_curr_song_params}
endscript

script 0x0b6190a7 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
	gman_quickremovegoal \{goal_name = 0x2b0c327c}
endscript

script 0xd5ebccdf 
	printf \{channel = minigame
		qs(0x92de11c8)}
	create_menu_backdrop \{texture = white
		rgba = [
			220
			220
			220
			255
		]}
	audio_ui_menu_music_off
	uistack_createboundscreenelement \{parent = root_window
		id = 0x1f13d01b
		Type = ContainerElement}
	gman_quickstartgoal \{goal_struct = 0xeee325c8
		goal_name = 0x2b0c327c}
endscript

script 0xb03cf6c1 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	audio_ui_menu_music_on
endscript

script 0x2e58bf2e 
	printf \{channel = musicstudio
		qs(0x49ff0409)}
	CreateScreenElement \{parent = 0x1f13d01b
		id = 0xd5c032a7
		Type = ContainerElement
		Scale = 0.75
		Pos = (500.0, 200.0)
		event_handlers = [
			{
				pad_start
				0x0b6190a7
			}
		]}
	LaunchEvent Type = focus target = <id>
	CreateScreenElement \{Type = SpriteElement
		id = 0x52ed48c6
		parent = 0xd5c032a7
		just = [
			center
			center
		]
		z_priority = 10
		texture = 0xb9196f27
		dims = (512.0, 512.0)
		Pos = (640.0, 360.0)}
	CreateScreenElement {
		Type = SpriteElement
		id = 0xd3f6018d
		parent = <id>
		Pos = (0.0, 30.0)
		just = [right center]
		pos_anchor = [center center]
		z_priority = 9
		texture = 0xd042a904
		dims = (512.0, 128.0)
		rot_angle = 12
	}
	<id> :obj_spawnscript 0x15b48d63 params = {controller = 0}
	clean_up_user_control_helpers
	add_user_control_helper controller = <controller> text = qs(0x55c34bc7) button = start z = 100000
endscript

script 0x6a792836 
	0xf2ac78a0 = [
		{
			rgba = [0 165 30 255]
		}
		{
			rgba = [230 30 40 255]
		}
		{
			rgba = [240 240 0 255]
		}
		{
			rgba = [0 135 210 255]
		}
		{
			rgba = [220 160 25 255]
		}
		{
			rgba = [147 112 219 255]
		}
	]
	color_index = 0
	GetArraySize <gem_pattern_array>
	begin
	if ((<gem_pattern_array> [<color_index>]) = 1)
		break
	endif
	<color_index> = (<color_index> + 1)
	repeat <array_Size>
	CreateScreenElement {
		parent = 0xd3f6018d
		Type = SpriteElement
		just = [center center]
		texture = white
		Pos = (100.0, 60.0)
		dims = (80.0, 45.0)
		rgba = (<0xf2ac78a0> [<color_index>].rgba)
		z_priority = 9
	}
	if ScreenElementExists id = <id>
		<id> :se_setprops time = 0.5 Pos = (-2000.0, 65.0) motion = smooth
		<id> :se_waitprops
	endif
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript
0xe38ec5ea = 0

script 0x7b93fcb1 
	if ($0xe38ec5ea = 0)
		se_setprops \{Pos = (620.0, 360.0)}
		Change \{0xe38ec5ea = 1}
	else
		se_setprops \{Pos = (640.0, 360.0)}
		Change \{0xe38ec5ea = 0}
	endif
endscript

script 0x28782fa4 
	if NOT (<gem_pattern_array> [0] = 1)
		return
	endif
	0xd3f6018d :se_setprops \{Scale = 1.05}
	0xd3f6018d :se_setprops \{Scale = 1
		time = 0.2}
	0xd3f6018d :se_waitprops
endscript

script 0x15b48d63 
	begin
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <righty>
		if (<spc_v_dist> > 0)
			<spc_v_dist> = 0
		endif
		0x3506381e = 12.0
		0x06582be6 = 80.0
		<line_rot> = (<0x3506381e> - (<0x06582be6> - <0x3506381e>) * <spc_v_dist>)
		0xd3f6018d :se_setprops time = 0.1 rot_angle = <line_rot> motion = smooth
		0xd3f6018d :se_waitprops
		Wait \{1
			gameframe}
	else
		Wait \{1
			gameframe}
	endif
	repeat
endscript

script 0xf1d67dfd 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = 0x721b7a0a}
endscript

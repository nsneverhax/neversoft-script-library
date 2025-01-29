
script ui_init_jam_song_wizard 
endscript
jam_auto_drum_loops_A = [
	{
		name_text = qs(0x3ffdff2c)
		loop = Metal1_drum_loop
		drum_kit_index = 0
	}
	{
		name_text = qs(0xfe3a0ec0)
		loop = Hip_Hop1_drum_loop
		drum_kit_index = 3
	}
	{
		name_text = qs(0x819bb0b9)
		loop = Pop2_drum_loop
		drum_kit_index = 2
	}
	{
		name_text = qs(0x78e66a86)
		loop = Rock3_drum_loop
		drum_kit_index = 1
	}
	{
		name_text = qs(0xd9050164)
		loop = Alternative1_drum_loop
		drum_kit_index = 4
	}
	{
		name_text = qs(0x837e0315)
		loop = andyloop2_1_drum_loop
		drum_kit_index = 12
	}
	{
		name_text = qs(0xab67c023)
		loop = andyloop1_2_drum_loop
		drum_kit_index = 6
	}
	{
		name_text = qs(0x5e8c371c)
		loop = breakbeat4_drum_loop
		drum_kit_index = 17
	}
	{
		name_text = qs(0xbaec499b)
		loop = andyloop4_5_drum_loop
		drum_kit_index = 13
	}
	{
		name_text = qs(0xa8ef060f)
		loop = Hip_Hop3_drum_loop
		drum_kit_index = 10
	}
	{
		name_text = qs(0xaf833eaf)
		loop = andyloop5_2_drum_loop
		drum_kit_index = 4
	}
	{
		name_text = qs(0x9872f6aa)
		loop = andyloop6_4_drum_loop
		drum_kit_index = 12
	}
	{
		name_text = qs(0x4d52fc8b)
		loop = andyloop4_5_drum_loop
		drum_kit_index = 2
	}
	{
		name_text = qs(0x7b8722de)
		loop = breakbeat1_drum_loop
		drum_kit_index = 11
	}
	{
		name_text = qs(0x105db5ee)
		loop = Rock2_drum_loop
		drum_kit_index = 1
	}
	{
		name_text = qs(0xb946c952)
		loop = Rock4_drum_loop
		drum_kit_index = 1
	}
	{
		name_text = qs(0x3f43db6a)
		loop = breakbeat9_drum_loop
		drum_kit_index = 7
	}
	{
		name_text = qs(0x70b42e72)
		loop = breakbeat8_drum_loop
		drum_kit_index = 0
	}
	{
		name_text = qs(0xd3ccbd55)
		loop = andyloop5_3_drum_loop
		drum_kit_index = 13
	}
	{
		name_text = qs(0x8b6cf123)
		loop = andyloop6_1_drum_loop
		drum_kit_index = 2
	}
	{
		name_text = qs(0x0d01351b)
		loop = None
	}
]
jam_auto_bass_loops_A = [
	{
		name_text = qs(0x3ffdff2c)
		loop = Metal1_bass_loop
	}
	{
		name_text = qs(0xfe3a0ec0)
		loop = hiphop1_bass_loop
	}
	{
		name_text = qs(0x819bb0b9)
		loop = classic_3_bass_loop
	}
	{
		name_text = qs(0x78e66a86)
		loop = modern_rock_3_bass_loop
	}
	{
		name_text = qs(0x41e3127d)
		loop = funky_1_bass_loop
	}
	{
		name_text = qs(0x6ae494db)
		loop = punky_1_bass_loop
	}
	{
		name_text = qs(0x70b42e72)
		loop = Meta3_bass_loop
	}
	{
		name_text = qs(0xdc91cbc7)
		loop = modern_rock_1_bass_loop
	}
	{
		name_text = qs(0x8c4362ac)
		loop = classic_1_bass_loop
	}
	{
		name_text = qs(0x2175141f)
		loop = Metal2_bass_loop
	}
	{
		name_text = qs(0x610240d7)
		loop = hiphop3_bass_loop
	}
	{
		name_text = qs(0xcf539dde)
		loop = classic_2_bass_loop
	}
	{
		name_text = qs(0xb9f588cc)
		loop = classic_4_bass_loop
	}
	{
		name_text = qs(0x90025ccf)
		loop = funky_2_bass_loop
	}
	{
		name_text = qs(0xfe4712a3)
		loop = modern_rock_4_bass_loop
	}
	{
		name_text = qs(0x41349bc4)
		loop = Meta3_bass_loop
	}
	{
		name_text = qs(0xf3220803)
		loop = Meta4_bass_loop
	}
	{
		name_text = qs(0x11c9e887)
		loop = classic_5_bass_loop
	}
	{
		name_text = qs(0x8408788b)
		loop = country_bass_loop
	}
	{
		name_text = qs(0x0d01351b)
		loop = None
	}
]

script ui_create_jam_song_wizard 
	spawnscriptnow create_jam_song_wizard_menu params = {<...>}
endscript

script create_jam_song_wizard_menu 
	if NOT ($target_jam_camera_prop = jam_advanced_recording)
		SoundEvent \{event = Song_Wizard_On}
	endif
	CreateScreenElement {
		parent = root_window
		id = jam_song_wizard
		type = DescInterface
		Pos = (1280.0, 0.0)
		desc = 'song_wizard'
		exclusive_device = ($primary_controller)
		bass_arrow_up_alpha = 0
		bass_arrow_down_alpha = 0
		drum_arrow_up_alpha = 0
		drum_arrow_down_alpha = 0
	}
	jam_song_wizard :SetTags \{bass_bank = 0}
	jam_song_wizard :SetTags \{drum_bank = 0}
	LaunchEvent \{type = unfocus
		target = jam_song_wizard}
	jam_song_wizard :SE_SetProps \{tempo_hilite_alpha = 0}
	jam_song_wizard :SE_SetProps \{bass_hilite_alpha = 0}
	jam_song_wizard :SE_SetProps \{drum_hilite_alpha = 0}
	jam_song_wizard :SE_SetProps \{Pos = (-20.0, 0.0)
		time = 0.15}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{Pos = (15.0, 0.0)
		time = 0.1}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{Pos = (-10.0, 0.0)
		time = 0.1}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{Pos = (0.0, 0.0)
		time = 0.1}
	jam_song_wizard :SE_WaitProps
	musicstudio_init_volumes \{no_tracks}
	jam_song_wizard :SetTags \{tempo_index = 1
		bass_index = 0
		drums_index = 0}
	if jam_song_wizard :Desc_ResolveAlias \{name = new_song_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps \{event_handlers = [
				{
					pad_back
					generic_event_back
				}
				{
					pad_up
					sound_options_scroll
				}
				{
					pad_down
					sound_options_scroll
				}
			]}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if (<i> = 3)
				choose_func = new_song_create_choose
			else
				choose_func = new_song_sub_menu_choose
			endif
			<current_item> :SE_SetProps {
				event_handlers = [
					{focus ui_new_song_menu_focus}
					{unfocus ui_new_song_menu_unfocus}
					{pad_choose <choose_func>}
				]
				replace_handlers
				tags = {
					index = <i>
					first_select = 1
				}
			}
			i = (<i> + 1)
			repeat <array_size>
			<current_item> = (<children> [0])
		endif
	endif
	index = 1
	begin
	if (<index> = 1)
		loop_array = jam_auto_bass_loops_A
		target_menu = bass_menu
	else
		loop_array = jam_auto_drum_loops_A
		target_menu = drums_menu
	endif
	if jam_song_wizard :Desc_ResolveAlias name = <target_menu>
		AssignAlias id = <resolved_id> alias = sub_menu
		GetArraySize ($<loop_array>)
		i = 0
		begin
		CreateScreenElement {
			type = ContainerElement
			parent = sub_menu
			dims = (100.0, 60.0)
			exclusive_device = ($primary_controller)
			event_handlers = [
				{focus new_song_sub_menu_button_focus params = {parent_menu_index = <index>}}
				{unfocus new_song_sub_menu_button_unfocus params = {parent_menu_index = <index>}}
			]
			replace_handlers
			tags = {
				index = <i>
			}
		}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	<index> = (<index> + 1)
	repeat 2
	LaunchEvent \{type = focus
		target = current_menu
		data = {
			child_index = 3
		}}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_setup_new_song 
	Change \{jam_band_new_song = 1}
	GetArraySize ($jam_quantize)
	Change jam_current_quantize = (<array_size> - 1)
	Change \{jam_current_tuning = 0}
	jam_recording_create_editable_arrays
	Change \{jam_melody_octave_range = 2}
	Change \{jam_lead_octave_range = 2}
	Change \{jam_rhythm_chord_type = 0}
	jam_init_scales
	Change \{jam_current_instrument_effects = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_active_effects = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{custom_chord_pattern = [
			1
			1
			1
			1
			1
			1
			1
		]}
	jam_recording_setup_timesig
	musicstudio_create_fretbars
	ClearCustomSong
	musicstudio_init_all_line6_effects
	SetSongInfo genre = -1 bpm = ($jam_current_bpm) song_version = $jam_song_version downloaded = 0 drum_kit = $jam_current_drum_kit file_id = {file_id = [0 , 0]} tuning = 0 bass_kit = 0
	Change \{jam_melody_pan = 0}
	Change \{bass_kit_mode = 0}
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	volume = 0
	pan = 0
	switch <index>
		case 0
		volume = ($musicstudio_lead_volume_default)
		case 1
		pan = 0
		volume = ($musicstudio_rhythm_volume_default)
		case 2
		pan = ($musicstudio_bass_pan_default)
		volume = ($musicstudio_bass_volume_default)
		case 3
		pan = ($musicstudio_drums_pan_default)
		volume = ($musicstudio_drums_volume_default)
		case 4
		pan = ($musicstudio_keyboard_pan_default)
		volume = ($musicstudio_keyboard_volume_default)
	endswitch
	SetTrackInfo track = ($jam_tracks [<index>].id) volume = <volume> pan = <pan> Effect = ($jam_current_instrument_effects [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	musicstudio_init_volumes
	musicstudio_init_pan
	reset_song_time \{starttime = 0}
endscript

script ui_new_song_menu_focus 
	GetTags
	if (<index> = 3)
		if jam_song_wizard :Desc_ResolveAlias \{name = new_song_button}
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
			<resolved_id> :Obj_SpawnScript pulse_song_button
		endif
		SE_SetProps \{rgba = [
				128
				64
				0
				255
			]}
	else
		SE_SetProps \{rgba = [
				220
				140
				0
				255
			]}
	endif
endscript

script ui_new_song_menu_unfocus 
	GetTags
	if (<index> = 3)
		if jam_song_wizard :Desc_ResolveAlias \{name = new_song_button}
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_off_textures [<i>])}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
		killspawnedscript \{name = pulse_song_button}
		jam_song_wizard :SE_SetProps \{button_song_rgba = [
				240
				240
				240
				255
			]}
		SE_SetProps \{rgba = [
				0
				0
				0
				255
			]}
	else
		SE_SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
endscript

script pulse_song_button 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	jam_song_wizard :SE_SetProps \{button_song_rgba = [
			255
			220
			150
			255
		]
		time = 0.5
		motion = ease_out}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{button_song_rgba = [
			208
			144
			80
			255
		]
		time = 0.5
		motion = ease_out}
	jam_song_wizard :SE_WaitProps
	repeat
endscript

script new_song_sub_menu_choose 
	SoundEvent \{event = GHMix_Select}
	if NOT GotParam \{index}
		GetTags
	endif
	switch <index>
		case 0
		jam_song_wizard :SE_SetProps \{tempo_hilite_alpha = 0.6}
		target_menu = tempo_menu
		case 1
		jam_song_wizard :SE_SetProps \{bass_hilite_alpha = 0.6
			bass_bank_text_rgba = [
				220
				220
				220
				255
			]
			bass_arrow_up_alpha = 1
			bass_arrow_down_alpha = 1}
		target_menu = bass_menu
		case 2
		jam_song_wizard :SE_SetProps \{drum_hilite_alpha = 0.6
			drum_bank_text_rgba = [
				220
				220
				220
				255
			]
			drum_arrow_up_alpha = 1
			drum_arrow_down_alpha = 1}
		target_menu = drums_menu
	endswitch
	LaunchEvent \{type = unfocus
		target = current_menu}
	if (<index> = 0)
		if jam_song_wizard :Desc_ResolveAlias name = <target_menu>
			AssignAlias id = <resolved_id> alias = sub_menu
			sub_menu :Menu_GetSelectedIndex
			if (<first_select> = 1)
				<selected_index> = 1
			endif
			sub_menu :SE_SetProps {
				replace_handlers
				event_handlers = [
					{pad_back new_song_sub_menu_cancel params = {target_menu = <target_menu> parent_menu_index = <index> original_index = <selected_index>}}
					{pad_choose new_song_sub_menu_back params = {target_menu = <target_menu> parent_menu_index = <index>}}
					{pad_up sound_options_scroll}
					{pad_down sound_options_scroll}
				]
			}
			if GetScreenElementChildren \{id = sub_menu}
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				<current_item> :SE_SetProps {
					event_handlers = [
						{focus new_song_sub_menu_button_focus params = {parent_menu_index = <index>}}
						{unfocus new_song_sub_menu_button_unfocus params = {parent_menu_index = <index>}}
					]
					replace_handlers
					tags = {
						index = <i>
					}
				}
				i = (<i> + 1)
				repeat <array_size>
				<current_item> = (<children> [0])
			endif
		endif
	else
		if jam_song_wizard :Desc_ResolveAlias name = <target_menu>
			AssignAlias id = <resolved_id> alias = sub_menu
			printf \{channel = jam_mode
				qs(0x9dc0414d)}
			sub_menu :Menu_GetSelectedIndex
			if (<selected_index> < 0)
				<selected_index> = 0
			endif
			sub_menu :SE_SetProps {
				replace_handlers
				event_handlers = [
					{pad_back new_song_sub_menu_cancel params = {target_menu = <target_menu> parent_menu_index = <index> original_index = <selected_index>}}
					{pad_choose new_song_sub_menu_back params = {target_menu = <target_menu> parent_menu_index = <index>}}
					{pad_up jam_wizard_auto_up params = {index = <index>}}
					{pad_down jam_wizard_auto_down params = {index = <index>}}
				]
			}
		endif
	endif
	if (<index> = 0 && <first_select> = 1)
		LaunchEvent \{type = focus
			target = sub_menu
			data = {
				child_index = 1
			}}
		SetTags \{first_select = 0}
	else
		LaunchEvent \{type = focus
			target = sub_menu}
	endif
endscript

script jam_wizard_auto_up 
	printf \{channel = jam_mode
		qs(0xdf8268f7)}
	sound_options_scroll
	killspawnedscript \{name = scale_auto_arrows}
	spawnscriptnow scale_auto_arrows id = jam_song_wizard_spawns params = {index = <index> up}
endscript

script jam_wizard_auto_down 
	printf \{channel = jam_mode
		qs(0x0dabdefd)}
	sound_options_scroll
	killspawnedscript \{name = scale_auto_arrows}
	spawnscriptnow scale_auto_arrows id = jam_song_wizard_spawns params = {index = <index> down}
endscript

script scale_auto_arrows \{index = 1}
	if (<index> = 1)
		if GotParam \{up}
			jam_song_wizard :SetProps \{bass_arrow_up_scale = 1.4}
			jam_song_wizard :SetProps \{bass_arrow_up_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
		if GotParam \{down}
			jam_song_wizard :SetProps \{bass_arrow_down_scale = 1.4}
			jam_song_wizard :SetProps \{bass_arrow_down_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
	else
		if GotParam \{up}
			jam_song_wizard :SetProps \{drum_arrow_up_scale = 1.4}
			jam_song_wizard :SetProps \{drum_arrow_up_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
		if GotParam \{down}
			jam_song_wizard :SetProps \{drum_arrow_down_scale = 1.4}
			jam_song_wizard :SetProps \{drum_arrow_down_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
	endif
endscript
jam_wizard_button_on_textures = [
	button_on_left
	button_on_middle
	button_on_right
]
jam_wizard_button_off_textures = [
	button_off_left
	button_off_middle
	button_off_right
]

script new_song_sub_menu_button_focus 
	GetTags
	Obj_GetID
	if (<parent_menu_index> = 0)
		SE_SetProps \{texture = button_on}
		if GetScreenElementChildren id = <objID>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if (<i> = 3)
				<current_item> :SE_SetProps {rgba = [128 , 64 , 0 , 255]}
			else
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	jam_song_wizard :GetTags
	switch <tempo_index>
		case 0
		curr_selected_bpm = 100
		case 1
		curr_selected_bpm = 120
		case 2
		curr_selected_bpm = 140
	endswitch
	GetTags
	switch <parent_menu_index>
		case 0
		killspawnedscript \{name = jam_recording_metronome}
		switch <index>
			case 0
			tempo_bpm = 100
			case 1
			tempo_bpm = 120
			case 2
			tempo_bpm = 140
		endswitch
		reset_song_time \{starttime = 0}
		SoundEvent \{event = Jam_Mode_Metronome
			downbeat = 1}
		spawnscriptnow jam_recording_metronome id = jam_song_wizard_spawns params = {bpm = <tempo_bpm> time = 0 sound_only}
		case 1
		killspawnedscript \{name = jam_auto_bass_preview}
		if NOT (<index> = 0)
			jam_song_wizard :SetProps bass_text = ($jam_auto_bass_loops_A [(<index> - 1)].name_text)
			reset_song_time \{starttime = 0}
			spawnscriptnow jam_auto_bass_preview id = jam_song_wizard_spawns params = {bass_loop = ($jam_auto_bass_loops_A [(<index> - 1)].loop) bpm = <curr_selected_bpm>}
		else
			jam_song_wizard :SetProps \{bass_text = qs(0xae01dcbe)}
		endif
		case 2
		killspawnedscript \{name = jam_play_drum_loop}
		if NOT (<index> = 0)
			jam_song_wizard :SetProps drum_text = ($jam_auto_drum_loops_A [(<index> - 1)].name_text)
			script_assert \{qs(0x1ea08306)}
			reset_song_time \{starttime = 0}
			spawnscriptnow jam_play_drum_loop id = jam_song_wizard_spawns params = {loop_velocity ignore_touch drum_loop = ($jam_auto_drum_loops_A [(<index> - 1)].loop) bpm = <curr_selected_bpm> loop_repeat = 1 time = 0}
		else
			jam_song_wizard :SetProps \{drum_text = qs(0xae01dcbe)}
		endif
	endswitch
endscript

script new_song_sub_menu_button_unfocus 
	Obj_GetID
	if (<parent_menu_index> = 0)
		SE_SetProps \{texture = button_off}
		if GetScreenElementChildren id = <objID>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if (<i> = 3)
				<current_item> :SE_SetProps {rgba = [100 , 100 , 100 , 255]}
			else
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_off_textures [<i>])}
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script new_song_sub_menu_back 
	GhMix_Pad_Back_Sound
	GetTags
	switch <parent_menu_index>
		case 0
		jam_song_wizard :SetTags {tempo_index = <tag_selected_index>}
		killspawnedscript \{name = jam_recording_metronome}
		case 1
		jam_song_wizard :SE_SetProps \{bass_arrow_up_alpha = 0
			bass_arrow_down_alpha = 0}
		jam_song_wizard :SetTags {bass_index = <tag_selected_index>}
		killspawnedscript \{name = jam_auto_bass_preview}
		case 2
		jam_song_wizard :SE_SetProps \{drum_arrow_up_alpha = 0
			drum_arrow_down_alpha = 0}
		jam_song_wizard :SetTags {drums_index = <tag_selected_index>}
		killspawnedscript \{name = jam_play_drum_loop}
	endswitch
	LaunchEvent \{type = unfocus
		target = sub_menu}
	if GetScreenElementChildren \{id = sub_menu}
		if (<parent_menu_index> = 0)
			(<children> [<tag_selected_index>]) :SE_SetProps texture = button_on
			if GetScreenElementChildren id = (<children> [<tag_selected_index>])
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				if (<i> = 3)
					<current_item> :SE_SetProps {rgba = [128 , 64 , 0 , 255]}
				else
					<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script new_song_sub_menu_cancel 
	printstruct channel = jam_mode <...>
	SoundEvent \{event = Recording_Stop}
	GetTags
	LaunchEvent \{type = unfocus
		target = sub_menu}
	LaunchEvent type = focus target = sub_menu data = {child_index = <original_index>}
	LaunchEvent \{type = unfocus
		target = sub_menu}
	switch <parent_menu_index>
		case 0
		killspawnedscript \{name = jam_recording_metronome}
		case 1
		jam_song_wizard :SE_SetProps \{bass_arrow_up_alpha = 0
			bass_arrow_down_alpha = 0}
		killspawnedscript \{name = jam_auto_bass_preview}
		case 2
		jam_song_wizard :SE_SetProps \{drum_arrow_up_alpha = 0
			drum_arrow_down_alpha = 0}
		killspawnedscript \{name = jam_play_drum_loop}
	endswitch
	if GetScreenElementChildren \{id = sub_menu}
		if (<parent_menu_index> = 0)
			if GetScreenElementChildren id = (<children> [<tag_selected_index>])
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				if (<i> = 3)
					<current_item> :SE_SetProps {rgba = [100 , 100 , 100 , 255]}
				else
					<current_item> :SE_SetProps {texture = ($jam_wizard_button_off_textures [<i>])}
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
			if GetScreenElementChildren \{id = sub_menu}
				if GetScreenElementChildren id = (<children> [<original_index>])
					GetArraySize <children>
					i = 0
					begin
					<current_item> = (<children> [<i>])
					if (<i> = 3)
						<current_item> :SE_SetProps {rgba = [128 , 64 , 0 , 255]}
					else
						<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
			endif
		else
			if (<parent_menu_index> = 1)
				if NOT (<original_index> = 0)
					jam_song_wizard :SetProps bass_text = ($jam_auto_bass_loops_A [(<original_index> - 1)].name_text)
				else
					jam_song_wizard :SetProps \{bass_text = qs(0xae01dcbe)}
				endif
			else
				if NOT (<original_index> = 0)
					jam_song_wizard :SetProps drum_text = ($jam_auto_drum_loops_A [(<original_index> - 1)].name_text)
				else
					jam_song_wizard :SetProps \{drum_text = qs(0xae01dcbe)}
				endif
			endif
		endif
	endif
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script new_song_create_choose \{tempo_index = 1
		bass_index = 0
		drums_index = 0}
	if NOT GotParam \{new_jamroom}
		LaunchEvent \{type = unfocus
			target = current_menu}
		SoundEvent \{event = GHMix_Select}
		jam_song_wizard :GetTags
		spawnscriptnow \{jam_wizard_show_loading_screen
			id = jam_song_wizard_spawns}
		wait \{1
			second}
	endif
	switch <tempo_index>
		case 0
		Change \{jam_current_bpm = 100}
		case 1
		Change \{jam_current_bpm = 120}
		case 2
		Change \{jam_current_bpm = 140}
	endswitch
	jam_setup_new_song \{no_drum}
	SetSongInfo bpm = ($jam_current_bpm)
	if NOT (<bass_index> = 0)
		jam_copy_bass_loop_to_track bass_loop = ($jam_auto_bass_loops_A [(<bass_index> - 1)].loop) bpm = ($jam_current_bpm)
	endif
	if NOT (<drums_index> = 0)
		Change jam_current_drum_kit = ($jam_auto_drum_loops_A [(<drums_index> - 1)].drum_kit_index)
		jam_copy_drum_loop_to_track drum_loop = ($jam_auto_drum_loops_A [(<drums_index> - 1)].loop) bpm = ($jam_current_bpm)
	endif
	wait \{1
		seconds}
	LoadDrumKitAll \{async = 0}
	generic_event_choose \{no_sound
		state = uistate_jam_band}
endscript

script jam_copy_drum_loop_to_track \{bpm = 120}
	loop_midi_notes = [38 46 48 49 45 36]
	if NOT GlobalExists name = <drum_loop> type = array
		return
	endif
	GetArraySize ($<drum_loop>)
	jam_drum_loop_bpm = 125.0
	time_scale_percentage = (<jam_drum_loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	index = 0
	num_loops = 0
	begin
	note_time = ($<drum_loop> [<index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	<note_time> = (<note_time> + (<num_loops> * <ms_per_loop>))
	note_type = ($<drum_loop> [<index>] [1])
	note_velocity = ($<drum_loop> [<index>] [2])
	switch <note_type>
		case (<loop_midi_notes> [0])
		<hold_pattern> = 65536
		case (<loop_midi_notes> [1])
		<hold_pattern> = 4096
		case (<loop_midi_notes> [2])
		<hold_pattern> = 256
		case (<loop_midi_notes> [3])
		<hold_pattern> = 16
		case (<loop_midi_notes> [4])
		<hold_pattern> = 1
		case (<loop_midi_notes> [5])
		<hold_pattern> = 1048576
	endswitch
	if (<note_time> >= <last_fretbar_time>)
		break
	endif
	jam_record_note_drum velocity = <note_velocity> hold_pattern = <hold_pattern> time = <note_time> auto
	<index> = (<index> + 1)
	if (<index> >= <array_size>)
		<num_loops> = (<num_loops> + 1)
		<index> = 0
	endif
	repeat
endscript

script jam_copy_bass_loop_to_track \{bpm = 120}
	if NOT GlobalExists name = <bass_loop> type = array
		return
	endif
	GetArraySize ($<bass_loop>)
	jam_bass_loop_bpm = 125.0
	time_scale_percentage = (<jam_bass_loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	bass_index = 0
	num_loops = 0
	note_count = 0
	begin
	note_time = ($<bass_loop> [<bass_index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	<note_time> = (<note_time> + (<num_loops> * <ms_per_loop>))
	CastToInteger \{note_time}
	note_type = ($<bass_loop> [<bass_index>] [1])
	note_velocity = ($<bass_loop> [<bass_index>] [2])
	note_length = ($<bass_loop> [<bass_index>] [3])
	<note_length> = (<note_length> * <time_scale_percentage>)
	CastToInteger \{note_length}
	if (<note_time> >= <last_fretbar_time>)
		break
	endif
	if (<note_count> >= (($gemarraysize) - 1))
		break
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<note_time> / <quantize>)
	CastToInteger \{intervals}
	new_time = (<intervals> * <quantize>)
	time_before = (<note_time> - <new_time>)
	time_after = ((<new_time> + <quantize>) - <note_time>)
	if (<time_after> <= <time_before>)
		<new_time> = (<new_time> + <quantize>)
	endif
	CastToInteger \{new_time}
	jam_get_bass_string_fret midi_note = <note_type>
	type = 0
	if (<note_velocity> <= 1)
		<type> = 3
	endif
	AddJamSessionSound track = ($jam_tracks [2].id) time = <new_time> string = <string> Fret = <Fret> type = <type> Effect = 0 chord_type = 0 velocity = 127
	gem_array = ($jam_tracks [2].gem_array)
	AddNoteTrackItem name = <gem_array> time = <new_time> length = <note_length> pattern = <pattern>
	<bass_index> = (<bass_index> + 1)
	<note_count> = (<note_count> + 1)
	if (<bass_index> >= <array_size>)
		<num_loops> = (<num_loops> + 1)
		<bass_index> = 0
	endif
	repeat
endscript

script jam_auto_bass_preview \{bpm = 120}
	curr_song_time = 0
	if NOT GlobalExists name = <bass_loop> type = array
		return
	endif
	GetArraySize ($<bass_loop>)
	jam_bass_loop_bpm = 125.0
	time_scale_percentage = (<jam_bass_loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	index = 0
	begin
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	note_time = ($<bass_loop> [<index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	note_type = ($<bass_loop> [<index>] [1])
	note_velocity = ($<bass_loop> [<index>] [2])
	note_length = ($<bass_loop> [<index>] [3])
	<note_length> = (<note_length> * <time_scale_percentage>)
	CastToInteger \{note_length}
	if (<curr_song_time> >= <note_time>)
		killspawnedscript \{name = jam_auto_bass_stop_note}
		if (<note_velocity> = 0)
			jam_auto_bass_play_note midi_note = <note_type> type = 3
		else
			jam_auto_bass_play_note midi_note = <note_type> type = 0
		endif
		spawnscriptnow jam_auto_bass_stop_note id = jam_song_wizard_spawns params = {note_length = <note_length>}
		<index> = (<index> + 1)
	endif
	if (<index> >= <array_size>)
		begin
		GetSongTimeMs
		CastToInteger \{time}
		curr_song_time = <time>
		if (<curr_song_time> >= <ms_per_loop>)
			reset_song_time \{starttime = 1}
			curr_song_time = 0
			index = 0
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_auto_bass_stop_note 
	wait (<note_length> / 1000.0) seconds
	StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
endscript

script jam_auto_bass_play_note 
	if (<midi_note> < 64)
		printf \{channel = jam_mode
			qs(0xa32a57a7)}
	endif
	jam_get_bass_string_fret midi_note = <midi_note>
	jam_get_sample_checksum string = <string> Fret = <Fret> type = <type> jam_instrument = 2
	StopSound \{unique_id = $jam_input_current_bass
		fade_type = linear
		fade_time = 0.05}
	PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass send_vol2 = -24
	Change jam_input_current_bass = <unique_id>
endscript

script jam_get_bass_string_fret 
	Fret = (<midi_note> - 64)
	orig_fret = <Fret>
	string = 0
	begin
	if (<Fret> > 4)
		Fret = (<Fret> - 5)
	else
		break
	endif
	<string> = (<string> + 1)
	repeat 3
	Mod a = <orig_fret> b = 6
	gem_patterns = [32 1 2 4 8 16]
	pattern = (<gem_patterns> [<Mod>])
	return Fret = <Fret> string = <string> pattern = <pattern>
endscript

script jam_wizard_show_loading_screen 
	clean_up_user_control_helpers
	spawnscriptnow \{jam_wizard_update_loading_text
		id = jam_song_wizard_spawns}
	spawnscriptnow \{jam_wizard_animate_loading_image
		id = jam_song_wizard_spawns}
	jam_song_wizard :SetProps \{loading_alpha = 1
		time = 0.3}
	jam_song_wizard :SE_WaitProps
endscript

script jam_wizard_remove_loading_screen 
	jam_song_wizard :SetProps \{loading_alpha = 0
		time = 0.3}
	jam_song_wizard :SE_WaitProps
	killspawnedscript \{name = ghtunes_update_loading_text}
	killspawnedscript \{name = jam_wizard_animate_loading_image}
endscript

script jam_wizard_animate_loading_image 
	time_between = 0.15
	if jam_song_wizard :Desc_ResolveAlias \{name = lightbar}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps {texture = loading_light_on}
			wait <time_between> seconds
			<current_item> :SE_SetProps {texture = loading_light_off}
			<i> = (<i> + 1)
			if (<i> = <array_size>)
				<i> = 0
			endif
			repeat
		endif
	endif
endscript

script jam_wizard_update_loading_text 
	time_between = 0.3
	loading_text_base = qs(0xfa9a5967)
	period_array = [qs(0x00000000) qs(0xefb47879) qs(0xab24dd29) qs(0xb723938a)]
	count = 0
	begin
	FormatText TextName = loading_text qs(0xeef7df84) s = <loading_text_base> a = (<period_array> [<count>])
	jam_song_wizard :SetProps loading_text = <loading_text>
	wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script ui_destroy_jam_song_wizard 
	spawnscriptnow destroy_jam_song_wizard_menu params = {<...>}
endscript

script destroy_jam_song_wizard_menu 
	killspawnedscript \{name = create_jam_song_wizard_menu}
	killspawnedscript \{id = jam_song_wizard_spawns}
	clean_up_user_control_helpers
	jam_song_wizard :SE_SetProps \{Pos = (1280.0, 0.0)
		time = 0.15}
	jam_song_wizard :SE_WaitProps
	if ScreenElementExists \{id = jam_song_wizard}
		DestroyScreenElement \{id = jam_song_wizard}
	endif
endscript

script ui_deinit_jam_song_wizard 
endscript

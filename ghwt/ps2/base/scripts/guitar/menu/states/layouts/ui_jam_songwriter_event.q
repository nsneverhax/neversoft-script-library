
script 0x1da661a8 
	SpawnScriptNow 0x51c263f8 id = 0x922b3d7b params = {<...>}
endscript

script 0x476efaf3 

endscript

script 0x9442459e 
endscript

script 0xad7a7559 

	KillSpawnedScript \{id = 0x922b3d7b}
	destroy_jam_recording_menu
	KillCamAnim \{Name = jam_view_cam}
	Change \{jam_view_cam_created = 0}
endscript

script 0x51c263f8 

	cas_free_resources
	unload_songqpak
	jamsession_unload \{song_prefix = 'editable'}
	if ($jam_view_cam_created = 0)
		do_jam_loading \{no_band}
	endif
	disable_pause
	UnPauseGame
	menu_music_off
	BG_Crowd_Front_End_Silence
	destroy_loading_screen
	StartRendering
	formatText checksumName = specialeventnum 'special_event%d' d = ($current_special_event_num)
	<challenge_struct> = ($special_events_challenges.<specialeventnum>.<challenge>)
	Change \{jam_current_recording_player = 1}
	setplayerinfo \{$jam_current_recording_player
		jam_instrument = 0}
	loadjam \{file_name = 'ironman'
		save = 0}
	gettrackinfo \{track = rhythm}
	Change jam_current_bpm = <bpm>

	create_jam_recording_menu \{editing = 1}
	clean_up_user_control_helpers
	CreateScreenElement \{Type = ContainerElement
		id = jam_songwriter_container
		parent = jam_studio_element
		Pos = (0.0, 0.0)}
	jam_songwriter_container :SetTags \{0x58bea416 = ready
		controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	GetArraySize (<challenge_struct>.steps)
	<0x73f568a5> = 0
	begin
	jam_songwriter_container :GetTags
	if (<0x58bea416> = ready)
		<0x346cad04> = ((<challenge_struct>.steps) [<0x73f568a5>])
		SpawnScriptNow <0x346cad04> id = 0x922b3d7b
		jam_songwriter_container :SetTags \{0x58bea416 = 0x83aa57c1}
	elseif (<0x58bea416> = 0x183ada5a)
		<0x73f568a5> = (<0x73f568a5> + 1)
		jam_songwriter_container :SetTags \{0x58bea416 = ready}
	elseif (<0x58bea416> = 0x83d41fbe)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script finish_jam_songwriter_event \{songwriter_result = 0}

	<event_handlers> = [
		{pad_choose generic_event_back params = {state = uistate_gig_posters}}
	]
	generic_event_replace state = uistate_special_event_win no_sound data = {<...>}
endscript

script songwriter_c1_intro 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	jam_songwriter_container :SetTags \{0x5d7cbd27 = 2824}
	getplayerinfo ($jam_current_recording_player) part
	switch (<part>)
		case guitar
		jam_songwriter_container :SetTags \{inst_name = qs(0x3edd5718)
			0x72c735d7 = 1
			0x31b49276 = 6
			0xde97e63d = 7
			0xdd507add = 7.5
			0xccb9f5ac = 8
			0xfad09baf = 8.5
			0x649545fa = 9
			paste_time = 10}
		case bass
		jam_songwriter_container :SetTags \{inst_name = qs(0x4f551cbe)
			0x72c735d7 = 2
			0x31b49276 = 2
			0xde97e63d = 3
			0xdd507add = 4
			0xccb9f5ac = 4.5
			0xfad09baf = 6
			0x649545fa = 6.5
			paste_time = 7}
		case drum
		jam_songwriter_container :SetTags \{inst_name = qs(0xfd52050f)
			0x72c735d7 = 3
			0x31b49276 = 2
			0xde97e63d = 3
			0xdd507add = 4
			0xccb9f5ac = 4.5
			0xfad09baf = 6
			0x649545fa = 6.5
			paste_time = 7}
	endswitch
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x17a924cf)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xc70557ad)
			time = 5
		}}
	jam_control_bar_down
	Wait \{0.15
		Seconds}
	jam_control_bar_down
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 215.0)
			angle = 110
			time = -1
		}}
	Block \{Type = 0x4cdf77b3}
	0xe411cc53 \{all}
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xf5812579)
			time = 8
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (590.0, 470.0)
			angle = 0
			time = -1
			id = 1
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (735.0, 470.0)
			angle = 0
			time = -1
			id = 2
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (850.0, 470.0)
			angle = 0
			time = -1
			id = 3
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (960.0, 470.0)
			angle = 0
			time = -1
			id = 4
		}}
	Block \{Type = 0x4cdf77b3}
	0xe411cc53 \{all}
	jam_songwriter_container :SetTags \{0x58bea416 = 0x183ada5a}
endscript

script songwriter_c1_record_notes 
	jam_songwriter_container :GetTags
	formatText TextName = text qs(0xb78e5ebc) a = <inst_name>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = 5}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	formatText TextName = text qs(0xf3907ca5) a = <inst_name>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 490.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	begin
	if (($jam_current_track) = <0x72c735d7>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	formatText TextName = text qs(0x8d8124fa) a = <0x31b49276>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 180.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	begin

	if (($jam_highway_play_time) >= (<0x31b49276> * <0x5d7cbd27>))
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xcd6d2206)
			time = -1
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 233.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	getplayerinfo ($jam_current_recording_player) controller
	<stop> = 0
	begin
	if ControllerMake start <controller>
		<stop> = 1
	elseif (($jam_highway_play_time) >= (<0xde97e63d> * <0x5d7cbd27>))
		<stop> = 1
		jam_control_bar_choose
	endif
	if (<stop> = 1)
		notetrack_size_after = ($<appended_id>)

		if (<notetrack_size_after> > <notetrack_size>)

			break
		else
			formatText TextName = text qs(0x6dc1a33d) a = <0x31b49276>
			SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
			<notetrack_size> = <notetrack_size_after>
			0x70f201e2 \{controls = [
					0
					0
					0
					0
					0
					1
					0
					0
					0
					0
					0
					0
					0
					0
				]}
			begin
			if (($jam_highway_play_time) <= (<0x31b49276> * <0x5d7cbd27>))
				0x70f201e2 \{controls = [
						0
						0
						0
						1
						0
						0
						0
						0
						0
						0
						0
						0
						0
						0
					]}
				<stop> = 0
				break
			endif
			Wait \{1
				gameframe}
			repeat
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x65260c4b)
			time = 5
		}}
	jam_songwriter_container :SetTags \{0x58bea416 = 0x183ada5a}
endscript

script songwriter_c1_delete_notes 
	jam_songwriter_container :GetTags
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xdc5b9881)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	formatText TextName = text qs(0xafd1af25) a = <0xdd507add>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 180.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	begin

	if (($jam_highway_play_time) >= (<0xdd507add> * <0x5d7cbd27>))
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x6895ed29)
			time = -1
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 362.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
		]}
	jam_songwriter_container :SetTags {0xd3a2e252 = (<0xdd507add> * <0x5d7cbd27>) 0x9ca91f74 = (<0xccb9f5ac> * <0x5d7cbd27>)}
	getplayerinfo ($jam_current_recording_player) controller
	begin
	if ControllerMake start <controller>
		notetrack_size_after = ($<appended_id>)

		if (<notetrack_size_after> < <notetrack_size>)

			break
		else
			formatText TextName = text qs(0x2539ec84) a = <0xdd507add>
			SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
			<notetrack_size> = <notetrack_size_after>
			0x70f201e2 \{controls = [
					0
					0
					0
					0
					0
					1
					0
					0
					0
					0
					0
					0
					0
					0
				]}
			begin
			if (($jam_highway_play_time) <= (<0xdd507add> * <0x5d7cbd27>))
				0x70f201e2 \{controls = [
						0
						0
						0
						1
						0
						0
						0
						0
						0
						0
						0
						0
						0
						0
					]}
				<stop> = 0
				break
			endif
			Wait \{1
				gameframe}
			repeat
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xb99c8ad0)
			time = 5
		}}
	jam_songwriter_container :SetTags \{0x58bea416 = 0x183ada5a}
endscript

script songwriter_c1_copy_notes 
	jam_songwriter_container :GetTags
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x38c436f7)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	formatText TextName = text qs(0x30d7b152) a = <0xfad09baf>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 180.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	begin

	if (($jam_highway_play_time) >= (<0xfad09baf> * <0x5d7cbd27>))
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	formatText TextName = text qs(0xf9672c6c) a = <0x649545fa>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 380.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
		]}
	jam_songwriter_container :SetTags {0xedde4888 = (<0xfad09baf> * <0x5d7cbd27>) 0xf641a82d = (<0x649545fa> * <0x5d7cbd27>)}
	getplayerinfo ($jam_current_recording_player) controller
	begin
	if ControllerMake start <controller>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	formatText TextName = text qs(0xa0b99ddc) a = <paste_time>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 410.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
		]}
	getplayerinfo ($jam_current_recording_player) controller
	begin
	if ControllerMake start <controller>

		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x8b9277b0)
			time = 5
		}}
	jam_songwriter_container :SetTags \{0x58bea416 = 0x183ada5a}
endscript

script songwriter_c1_outro 
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x68d4951d)
			time = 4
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	LaunchEvent \{Type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	getplayerinfo ($jam_current_recording_player) controller
	create_popup_warning_menu {
		title = qs(0x823e5100)
		textblock = {
			text = qs(0xc3e51713)
			dims = (840.0, 600.0)
			Pos = (640.0, 370.0)
			Scale = 0.55
		}
		player_device = <controller>
		options = [
			{
				func = 0x4101e0f5
				text = qs(0x56fbf662)
			}
			{
				func = finish_jam_songwriter_event
				func_params = {songwriter_result = 0}
				text = qs(0x44d65516)
			}
		]
	}
	jam_songwriter_container :SetTags \{0x58bea416 = 0x83d41fbe}
endscript

script songwriter_c2_intro 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x268234ad)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	getplayerinfo ($jam_current_recording_player) part
	switch (<part>)
		case guitar
		<inst_name> = qs(0x3edd5718)
		<0x72c735d7> = 1
		case bass
		<inst_name> = qs(0x4f551cbe)
		<0x72c735d7> = 2
		case drum
		<inst_name> = qs(0xfd52050f)
		<0x72c735d7> = 3
	endswitch
	formatText TextName = text qs(0x97e251c5) a = <inst_name>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = 5}
	0xfd34f005 low_bound = 0 high_bound = 2000 inst = <0x72c735d7>
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	formatText TextName = text qs(0xfef9e7b0) a = <inst_name>
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <text> time = -1}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 490.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	0xd379bc03
	begin
	if (($jam_current_track) = <0x72c735d7>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	jam_songwriter_container :SetTags \{0x58bea416 = 0x183ada5a}
endscript

script songwriter_c2_effect 
	getplayerinfo ($jam_current_recording_player) part
	switch (<part>)
		case guitar
		<inst_name> = qs(0x3edd5718)
		<0xafe52123> = qs(0x68de2e15)
		<0x9b6d2bb4> = qs(0x2b7df811)
		<0x55fdd63f> = jam_open_effects_menu
		<0x5e101a34> = qs(0x5c84d4ea)
		case bass
		<inst_name> = qs(0x4f551cbe)
		<0xafe52123> = qs(0x1dd298b3)
		<0x9b6d2bb4> = qs(0x2b7df811)
		<0x55fdd63f> = jam_open_effects_menu
		<0x5e101a34> = qs(0x5c84d4ea)
		case drum
		<inst_name> = qs(0xfd52050f)
		<0xafe52123> = qs(0xc0712096)
		<0x9b6d2bb4> = qs(0x2f25c819)
		<0x55fdd63f> = jam_open_drumkit_menu
		<0x5e101a34> = qs(0x9df0e899)
	endswitch
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <0xafe52123> time = 5}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xe38a6aca)
			time = -1
		}}
	0x70f201e2 \{controls = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	getplayerinfo ($jam_current_recording_player) controller
	begin
	if ControllerMake start <controller>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0xed0fc7ec
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <0x9b6d2bb4> time = -1}

	Block Type = <0x55fdd63f>

	0xed0fc7ec
	SpawnScriptNow 0x4d924d1b id = 0x922b3d7b params = {text = <0x5e101a34> time = -1}

	begin
	if ControllerMake start <controller>

		break
	endif
	if ControllerMake X <controller>

		break
	endif
	Wait \{1
		gameframe}
	repeat

	0x7402c9e6
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x27d8d566)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	jam_songwriter_container :SetTags \{0x58bea416 = 0x183ada5a}
endscript

script songwriter_c2_sections 
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x9519c22b)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
	<0x4175e015> = 0
	<0xf31c87a0> = 8000
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xad90700f)
			time = 5
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 233.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			1
			1
			0
			1
			0
			1
			1
			0
			1
			0
			0
			0
			0
			0
		]}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	getplayerinfo ($jam_current_recording_player) controller
	begin
	if ControllerMake start <controller>
		notetrack_size_after = ($<appended_id>)

		if (<notetrack_size_after> > <notetrack_size>)

			break
		else
			SpawnScriptNow \{0x4d924d1b
				id = 0x922b3d7b
				params = {
					text = qs(0x8c8540b9)
					time = -1
				}}
			<notetrack_size> = <notetrack_size_after>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	<0xea88f2e5> = 8001
	<0x052b231e> = 15000
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0xe7566b1f)
			time = -1
		}}
	SpawnScriptNow \{0x66558fcb
		id = 0x922b3d7b
		params = {
			end_pos = (355.0, 233.0)
			angle = 100
			time = -1
		}}
	0x70f201e2 \{controls = [
			1
			1
			0
			1
			0
			1
			1
			0
			1
			0
			0
			0
			0
			0
		]}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	getplayerinfo ($jam_current_recording_player) controller
	begin
	if ControllerMake start <controller>
		notetrack_size_after = ($<appended_id>)

		if (<notetrack_size_after> > <notetrack_size>)
			break
		else
			SpawnScriptNow \{0x4d924d1b
				id = 0x922b3d7b
				params = {
					text = qs(0x8c8540b9)
					time = -1
				}}
			<notetrack_size> = <notetrack_size_after>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	0x7402c9e6
	0xed0fc7ec
	SpawnScriptNow \{0x4d924d1b
		id = 0x922b3d7b
		params = {
			text = qs(0x28f437fb)
			time = 5
		}}
	Block \{Type = 0x4cdf77b3}
	0xed0fc7ec
endscript

script 0x4d924d1b 
	0x067345ec
	if NOT ScreenElementExists \{id = 0x90e48eb5}
		CreateScreenElement \{Type = SpriteElement
			parent = jam_songwriter_container
			id = 0x90e48eb5
			texture = tutorial_narrator_drummer_0
			just = [
				left
				top
			]
			Pos = (895.0, 20.0)
			Scale = 1.5
			z_priority = 80}
	endif
	CreateScreenElement \{Type = SpriteElement
		parent = jam_songwriter_container
		id = 0xa70d4285
		texture = slot_boarder
		just = [
			left
			top
		]
		Pos = (970.0, 90.0)
		Scale = 0
		z_priority = 79}
	CreateScreenElement {
		Type = TextBlockElement
		parent = 0xa70d4285
		id = 0xf96997c4
		font = fontgrid_text_a8
		just = [left top]
		internal_just = [center center]
		z_priority = 100
		rgba = [255 255 255 255]
		Pos = (30.0, 17.0)
		dims = (450.0, 85.0)
		text = <text>
		Scale = 1
		internal_scale = (0.65000004, 0.55)
		z_priority = 81
	}
	0xa70d4285 :se_setprops \{Pos = (440.0, 50.0)
		Scale = (1.0, 1.2)
		time = 0.3}
	if (<time> = -1)
		return
	endif
	Wait <time> Seconds
	0x067345ec
	broadcastevent \{Type = 0x4cdf77b3}
endscript

script 0x067345ec 
	if ScreenElementExists \{id = 0xa70d4285}
		0xa70d4285 :se_setprops \{Pos = (980.0, 90.0)
			Scale = 0
			time = 5}
		DestroyScreenElement \{id = 0xa70d4285}
	endif
endscript

script 0x66558fcb 
	0xe411cc53
	if GotParam \{id}
		formatText checksumName = id 'songwriter_arrow%a' a = <id>
	else
		id = 0xb18ac166
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_songwriter_container
		id = <id>
		texture = tutorial_arrow
		just = [center center]
		Pos = (600.0, 130.0)
		Scale = 0.6
		z_priority = 99
		rot_angle = <angle>
	}
	<id> :se_setprops Pos = <end_pos> time = 0.2
endscript

script 0xe411cc53 
	if GotParam \{all}
		<count> = 0
		begin
		formatText checksumName = arrow 'songwriter_arrow%a' a = <count>
		if ScreenElementExists id = <arrow>
			DestroyScreenElement id = <arrow>
		endif
		<count> = (<count> + 1)
		repeat 5
	else
		if ScreenElementExists \{id = 0xb18ac166}
			DestroyScreenElement \{id = 0xb18ac166}
		endif
	endif
endscript

script 0xed0fc7ec 
	Wait \{0.8
		Seconds}
endscript

script 0x70f201e2 
	LaunchEvent \{Type = focus
		target = current_menu}
	jam_songwriter_container :SetTags {controls_enabled = <controls>}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0x643800a7)
		button = strumbar
		z = 100}
endscript

script 0x7402c9e6 
	0xe411cc53
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
endscript

script 0xfd34f005 \{inst = 0}
	highlight_low_pos = ((<low_bound> / 1000.0) * $jam_highway_pixels_per_second)
	highlight_high_pos = ((<high_bound> / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = 0x74db0e4b}
		DestroyScreenElement \{id = 0x74db0e4b}
	endif
	if (<inst> > 0)
		if (<inst> = 3)
			<0xb7ec3849> = ((130 + (108 * <inst>)) * (0.0, 1.0))
			<0x3f8be202> = (0.0, 115.0)
		else
			<0xb7ec3849> = ((130 + (105 * <inst>)) * (0.0, 1.0))
			<0x3f8be202> = (0.0, 105.0)
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = jam_highway_container
			id = 0x74db0e4b
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_low_pos> + <0xb7ec3849>)
			dims = (<0x3f8be202> + ((1.0, 0.0) * (<highlight_high_pos> [0] - <highlight_low_pos> [0])))
			z_priority = 10
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			parent = jam_highway_container
			id = 0x74db0e4b
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			Pos = (<highlight_low_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<highlight_high_pos> [0] - <highlight_low_pos> [0])))
			z_priority = 10
		}
	endif
endscript

script 0xd379bc03 
	if ScreenElementExists \{id = 0x74db0e4b}
		DestroyScreenElement \{id = 0x74db0e4b}
	endif
endscript

script 0x4101e0f5 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	destroy_jam_recording_menu
	jam_recording_create_jamsession_arrays
	song_prefix = 'editable'
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	formatText checksumName = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		end_time = ($<gem_array> [(($<notetrack_size>) - 2)])
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
	endif
	<count> = (<count> + 1)
	repeat 4
	getplayerinfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 1)
		<jam_instrument> = 0
	endif
	start_jam_song difficulty = expert inst = <jam_instrument> end_time = <last_end_time>
endscript

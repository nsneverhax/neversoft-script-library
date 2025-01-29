
script do_jam_loading 
	if NOT 0x8658e568
		OnExitRun \{0xdf9f604d}
		0x10b35a47 \{Wait}
	endif
	printf \{channel = jam_mode
		qs(0x983f859b)}
	setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol) - 100)} time = 3}
	if ($jam_view_cam_created = 0)
		unload_songqpak
		create_loading_screen \{jam_mode = 1}
		destroy_band
		Change \{current_level = load_z_studio}
		Load_Venue \{block_scripts = 0}
		if NOT GotParam \{no_band}
			Change \{jam_mode_band = 1}
			Change \{structurename = player1_status
				character_id = GUITARIST}
			Change \{structurename = player1_status
				part = guitar}
			create_band \{async = 1}
			Change \{jam_mode_band = 0}
		endif
		apply_band_logo_to_venue \{step = build}
		Wait \{2
			gameframes}
		apply_band_logo_to_venue \{step = apply}
		create_bandname_viewport
		bandmanager_allchangestance \{stance = Stance_A
			no_wait}
		band_setarmanimstrength \{Name = GUITARIST
			target = fret_anim_mod
			Strength = 1.0}
		band_setarmanimstrength \{Name = BASSIST
			target = fret_anim_mod
			Strength = 1.0}
		band_setarmanimstrength \{Name = vocalist
			target = fret_anim_mod
			Strength = 1.0}
		drummer :Anim_Command \{target = drumkit
			Command = applydrumkitdifference_prepareanims
			params = {
				anims = [
					gh_drum_tom_1
					gh_drum_tom_2
					gh_drum_snare
					gh_drum_cymbal_1
					gh_drum_cymbal_2
					gh_drum_cymbal_3
					gh_drum_kick
					gh_drum_cymbal_hh_open
					gh_drum_cymbal_hh_closed
				]
				hold_list = [
					gh_drum_cymbal_hh_closed
				]
			}}
		Change \{target_jam_camera_prop = jam_look_at_mixer}
		Wait \{2
			gameframes}
		if NOT GotParam \{no_band}
			if ObjectExists \{id = drummer}
				drummer :Anim_Command \{target = Body
					Command = DegenerateBlend_AddBranch
					params = {
						Tree = $faceoff_drummer_notempo
						BlendDuration = 0.0
						params = {
							anim = drum_andy_standardlp_hs_100_01
						}
					}}
			endif
		endif
		destroy_bg_viewport
		setup_bg_viewport
		PlayIGCCam \{Name = jam_view_cam
			viewport = bg_viewport
			controlscript = jam_camera_script
			play_hold = 1}
		Change \{jam_view_cam_created = 1}
		0xc1c4e84c \{mode = jammode
			0xd607e2e6 = 1}
	endif
	printf \{channel = jam_mode
		qs(0xbd55d6cd)}
	Wait \{0.5
		Seconds}
	setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol)} time = 1}
endscript

script jam_init_menu_light_show 
	LightShow_InitEventMappings \{force_pakname = 'z_studio'}
	lightshow_dummyloop
	LightShow_SetTime \{time = 0.0}
	LightShow_PlaySnapshot \{save = true
		UseSnapshotPositions = true
		Name = flare_01}
endscript

script 0xca3b4a95 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script create_jam_menu 
	if IsLoggedIn
		0xd7b863a3
	endif
	Change \{rich_presence_context = presence_music_studio}
	jam_init_reverb
	begin
	if ($jam_view_cam_created = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_init_menu_light_show
	destroy_all_exploding_text
	printf \{channel = jam_mode
		qs(0xca3cd2d6)}
	Change \{signin_jam_mode = 0}
	KillCamAnim \{Name = ch_view_cam}
	KillCamAnim \{Name = menu_view_cam}
	directorylisting = $jam_curr_directory_listing
	disable_pause
	UnPauseGame
	menu_music_off
	BG_Crowd_Front_End_Silence
	if NOT ($target_jam_camera_prop = jam_look_at_mixer)
		Change \{target_jam_camera_prop = jam_look_at_mixer}
		jam_camera_wait
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_container}
	make_generic_menu \{title = qs(0x67c266fb)
		pad_back_script = menu_jam_back
		vmenu_id = jam_menu
		dims = (400.0, 400.0)}
	add_generic_menu_text_item \{icon = icon_jam_recording
		text = qs(0x3a7c1e04)
		choose_state = uistate_jam_select_song
		choose_state_data = {
			curr_tab = 0
		}}
	normal_controller = 0
	if NOT isdrumcontroller controller = ($primary_controller)
		if NOT IsGuitarController controller = ($primary_controller)
			<normal_controller> = 1
		endif
	endif
	add_generic_menu_text_item \{icon = icon_jam_ghmix
		text = qs(0x886500cd)
		choose_state = uistate_jam_select_song
		choose_state_data = {
			curr_tab = 0
			advanced_record = 1
		}}
	add_generic_menu_text_item {
		icon = icon_jam_ghtunes
		text = qs(0x0da353d6)
		<0x3a146d74>
		choose_state = uistate_jam_ghtunes
	}
	add_generic_menu_text_item \{icon = icon_jam_tutorial
		text = qs(0x800a3aa0)
		pad_choose_script = jam_goto_tutorials}
	0xca3b4a95
	LaunchEvent \{Type = focus
		target = current_menu}
	destroy_loading_screen
	StartRendering
	SpawnScriptNow \{jam_recording_check_disconnect}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script jam_picked_ghtunes 
	generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_ghtunes jam = 2 require_live = 1}
endscript

script jam_ghmix_failed_dialog 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	destroy_popup_warning_menu
	formatText \{TextName = dialog_txt
		qs(0x8acdea9d)}
	create_popup_warning_menu {
		title = qs(0x886500cd)
		textblock = {
			text = <dialog_txt>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ghmix_refresh}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_ghmix_refresh 
	destroy_popup_warning_menu
	ui_event \{event = menu_refresh}
endscript

script jam_change_look_at_cam \{cam = jam_look_at_mixer}
	return
	Change target_jam_camera_prop = <cam>
	Change \{jam_view_cam_morph_time = 0.4}
	Change \{jam_camera_changing = 0}
endscript

script jam_goto_tutorials 
	<wrong_controller> = 0
	if NOT IsGuitarController controller = ($primary_controller)
		if NOT isdrumcontroller controller = ($primary_controller)
			if NOT ($allow_controller_for_all_instruments = 1)
				LaunchEvent \{Type = unfocus
					target = current_menu}
				create_popup_warning_menu \{no_background
					title = qs(0xaa163738)
					textblock = {
						text = qs(0xb96d4917)
					}
					options = [
						{
							func = {
								jam_return_to_jam
							}
							func_params = {
							}
							text = qs(0x0e41fe46)
						}
					]}
				<wrong_controller> = 1
			endif
		endif
	endif
	if (<wrong_controller> = 0)
		destroy_jam_song_select_menu
		generic_event_choose \{state = uistate_jam_tutorials}
	endif
endscript

script jam_return_to_jam 
	destroy_popup_warning_menu
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script menu_jam_back 
	if NOT ui_event_exists_in_stack \{Name = 'recording_disconnect'}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		clean_up_user_control_helpers
		0xf7e0f992 \{Wait}
		KillCamAnim \{Name = jam_view_cam}
		generic_event_back \{nosound}
	endif
endscript

script destroy_jam_menu 
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = jam_tutorial_select_container}
		DestroyScreenElement \{id = jam_tutorial_select_container}
	endif
	if ScreenElementExists \{id = jam_container}
		DestroyScreenElement \{id = jam_container}
	endif
	destroy_generic_menu
	KillSpawnedScript \{Name = jam_recording_check_disconnect}
	KillSpawnedScript \{id = jam_spawns}
	destroy_menu_backdrop
	destroy_viewport_ui
	LightShow_Shutdown
endscript

script jam_menu_get_lefty 
	if ($is_attract_mode = 1)
		return \{lefty = 0}
	endif
	lefty = 0
	getplayerinfo <Player> lefty_flip
	return lefty = <lefty_flip>
endscript

script has_lefty_adj_control_press 
	jam_menu_get_lefty Player = <Player>
	if (<lefty> = 0)
		if (<Dir> = up)
			if ControllerPressed up <controller>
				return \{true}
			endif
		else
			if ControllerPressed down <controller>
				return \{true}
			endif
		endif
	else
		if (<Dir> = down)
			if ControllerPressed up <controller>
				return \{true}
			endif
		else
			if ControllerPressed down <controller>
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

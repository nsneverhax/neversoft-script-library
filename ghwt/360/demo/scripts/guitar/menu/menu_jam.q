
script do_jam_loading 
	printf \{channel = jam_mode
		qs(0x983f859b)}
	setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol) - 100)} time = 3}
	if ($jam_view_cam_created = 0)
		unload_songqpak
		create_loading_screen \{jam_mode = 1}
		destroy_band
		change \{current_level = load_z_studio}
		load_venue \{block_scripts = 0}
		if NOT gotparam \{no_band}
			change \{jam_mode_band = 1}
			change \{structurename = player1_status
				character_id = guitarist}
			change \{structurename = player1_status
				part = guitar}
			create_band \{async = 1}
			change \{jam_mode_band = 0}
		endif
		apply_band_logo_to_venue \{step = build}
		wait \{2
			gameframes}
		apply_band_logo_to_venue \{step = apply}
		create_bandname_viewport
		bandmanager_allchangestance \{stance = stance_a
			no_wait}
		band_setarmanimstrength \{name = guitarist
			target = fret_anim_mod
			strength = 1.0}
		band_setarmanimstrength \{name = bassist
			target = fret_anim_mod
			strength = 1.0}
		band_setarmanimstrength \{name = vocalist
			target = fret_anim_mod
			strength = 1.0}
		drummer :anim_command \{target = drumkit
			command = applydrumkitdifference_prepareanims
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
		change \{target_jam_camera_prop = jam_look_at_mixer}
		wait \{2
			gameframes}
		if NOT gotparam \{no_band}
			if objectexists \{id = drummer}
				drummer :anim_command \{target = body
					command = degenerateblend_addbranch
					params = {
						tree = $faceoff_drummer_notempo
						blendduration = 0.0
						params = {
							anim = drum_andy_standardlp_hs_100_01
						}
					}}
			endif
		endif
		destroy_bg_viewport
		setup_bg_viewport
		playigccam \{name = jam_view_cam
			viewport = bg_viewport
			controlscript = jam_camera_script
			play_hold = 1}
		change \{jam_view_cam_created = 1}
	endif
	printf \{channel = jam_mode
		qs(0xbd55d6cd)}
	wait \{0.5
		seconds}
	setsoundbussparams {crowd_beds = {vol = ($default_bussset.crowd_beds.vol)} time = 1}
endscript

script jam_init_menu_light_show 
	lightshow_initeventmappings \{force_pakname = 'z_studio'}
	lightshow_dummyloop
	lightshow_settime \{time = 0.0}
	lightshow_playsnapshot \{save = true
		usesnapshotpositions = true
		name = flare_01}
endscript

script create_jam_menu 
	change \{rich_presence_context = presence_music_studio}
	jam_init_reverb
	begin
	if ($jam_view_cam_created = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_init_menu_light_show
	destroy_all_exploding_text
	printf \{channel = jam_mode
		qs(0xca3cd2d6)}
	change \{signin_jam_mode = 0}
	killcamanim \{name = ch_view_cam}
	killcamanim \{name = menu_view_cam}
	directorylisting = $jam_curr_directory_listing
	disable_pause
	unpausegame
	menu_music_off
	bg_crowd_front_end_silence
	if NOT ($target_jam_camera_prop = jam_look_at_mixer)
		change \{target_jam_camera_prop = jam_look_at_mixer}
		jam_camera_wait
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = jam_container}
	make_generic_menu \{title = qs(0x67c266fb)
		pad_back_script = menu_jam_back
		vmenu_id = jam_menu
		dims = (400.0, 400.0)}
	add_generic_menu_icon_item \{icon = icon_jam_recording
		text = qs(0x3a7c1e04)
		choose_state = uistate_jam_select_song
		choose_state_data = {
			curr_tab = 0
		}}
	normal_controller = 0
	if NOT isdrumcontroller controller = ($primary_controller)
		if NOT isguitarcontroller controller = ($primary_controller)
			<normal_controller> = 1
		endif
	endif
	if (<normal_controller> = 0 || $allow_controller_for_all_instruments = 1)
		add_generic_menu_icon_item \{icon = icon_jam_ghmix
			text = qs(0x886500cd)
			choose_state = uistate_jam_select_song
			choose_state_data = {
				curr_tab = 0
				advanced_record = 1
			}}
	else
		add_generic_menu_icon_item \{icon = icon_jam_ghmix
			text = qs(0x886500cd)
			pad_choose_script = jam_ghmix_failed_dialog}
	endif
	add_generic_menu_icon_item \{icon = icon_jam_ghtunes
		text = qs(0x5204e0ef)
		pad_choose_script = jam_picked_ghtunes}
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		id = ghtunes_sm
		text = qs(0x7ca19d0c)
		font = fontgrid_text_a6
		just = [left top]
		scale = 0.3
		pos = (200.0, 10.0)
		rgba = ($menu_unfocus_color)
	}
	<item_container_id> :se_setprops {
		event_handlers = [
			{focus retail_menu_focus params = {id = <id>}}
			{unfocus retail_menu_unfocus params = {id = <id>}}
		]
	}
	add_generic_menu_icon_item \{icon = icon_jam_tutorial
		text = qs(0x800a3aa0)
		pad_choose_script = jam_goto_tutorials}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	launchevent \{type = focus
		target = current_menu}
	destroy_loading_screen
	startrendering
endscript

script jam_picked_ghtunes 
	generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_ghtunes jam = 2 require_live = 1}
endscript

script jam_ghmix_failed_dialog 
	launchevent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	destroy_popup_warning_menu
	if isxenon
		formattext \{textname = dialog_txt
			qs(0x8acdea9d)}
	elseif isps3
		formattext \{textname = dialog_txt
			qs(0x8acdea9d)}
	endif
	create_popup_warning_menu {
		title = qs(0x886500cd)
		textblock = {
			text = <dialog_txt>
			pos = (640.0, 370.0)
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
	change target_jam_camera_prop = <cam>
	change \{jam_view_cam_morph_time = 0.4}
	change \{jam_camera_changing = 0}
endscript

script jam_goto_tutorials 
	<wrong_controller> = 0
	if NOT isguitarcontroller controller = ($primary_controller)
		if NOT isdrumcontroller controller = ($primary_controller)
			if NOT ($allow_controller_for_all_instruments = 1)
				launchevent \{type = unfocus
					target = current_menu}
				create_popup_warning_menu \{no_background
					title = qs(0xaa163738)
					textblock = {
						text = qs(0x456d03e4)
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
	launchevent \{type = focus
		target = current_menu}
endscript

script menu_jam_back 
	launchevent \{type = unfocus
		target = current_menu}
	create_loading_screen
	killcamanim \{name = jam_view_cam}
	generic_event_back \{nosound}
endscript

script destroy_jam_menu 
	set_focus_color
	set_unfocus_color
	if screenelementexists \{id = jam_tutorial_select_container}
		destroyscreenelement \{id = jam_tutorial_select_container}
	endif
	if screenelementexists \{id = jam_container}
		destroyscreenelement \{id = jam_container}
	endif
	destroy_generic_menu
	killspawnedscript \{id = jam_spawns}
	destroy_menu_backdrop
	destroy_viewport_ui
endscript

script jam_menu_get_lefty 
	if ($is_attract_mode = 1)
		return \{lefty = 0}
	endif
	lefty = 0
	getplayerinfo <player> lefty_flip
	return lefty = <lefty_flip>
endscript

script has_lefty_adj_control_press 
	jam_menu_get_lefty player = <player>
	if (<lefty> = 0)
		if (<dir> = up)
			if controllerpressed up <controller>
				return \{true}
			endif
		else
			if controllerpressed down <controller>
				return \{true}
			endif
		endif
	else
		if (<dir> = down)
			if controllerpressed up <controller>
				return \{true}
			endif
		else
			if controllerpressed down <controller>
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

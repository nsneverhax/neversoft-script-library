
script debug_menu_back_to_retail_menu 
	if ($debug_from_gameplay = 1)
		ui_sfx \{menustate = generic
			uitype = back}
		generic_event_back \{state = uistate_pausemenu}
	else
		ui_sfx \{menustate = generic
			uitype = back}
		generic_event_back \{state = uistate_mainmenu}
	endif
endscript

script debug_menu_prototype_setlist 
	ui_event \{event = menu_change
		data = {
			state = uistate_songlist
		}}
endscript

script debug_menu_start_4p_vocal_proto 
	change \{game_mode = quickplay}
	botplayoff \{player = 1}
	botplayoff \{player = 2}
	botplayoff \{player = 3}
	botplayoff \{player = 4}
	setplayerinfo \{player = 1
		part = vocals}
	setplayerinfo \{player = 2
		part = vocals}
	setplayerinfo \{player = 3
		part = vocals}
	setplayerinfo \{player = 4
		part = vocals}
	debug_menu_select_start_song
endscript

script debug_menu_unlockall 
	lockglobaltags \{off}
	lockglobaltags \{freeplay_check_off}
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	difficulties = [easy medium hard expert]
	getarraysize <difficulties>
	diff_size = <array_size>
	getsonglistsize
	if (<array_size> > 0)
		i = 0
		begin
		getsonglistchecksum index = <i>
		get_song_saved_in_globaltags song = <song_checksum>
		if (<saved_in_globaltags> = 1)
			setglobaltags savegame = <savegame> <song_checksum> params = {unlocked = 1}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize ($bonus_songs.tier1.songs)
	if (<array_size> > 0)
		i = 0
		begin
		setglobaltags savegame = <savegame> ($bonus_songs.tier1.songs [<i>]) params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	i = 0
	getarraysize ($bonus_videos)
	if (<array_size> > 0)
		begin
		video_checksum = ($bonus_videos [<i>].id)
		setglobaltags savegame = <savegame> <video_checksum> params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	get_levelzonearray_size
	if (<array_size> > 0)
		index = 0
		begin
		get_levelzonearray_checksum index = <index>
		globaltag_unlock_venue venue = <level_checksum> savegame = <savegame>
		index = (<index> + 1)
		repeat <array_size>
	endif
	getarraysize ($g_bonus_art_galleries)
	index = 0
	begin
	gallery_id = ($g_bonus_art_galleries [<index>].id)
	setglobaltags savegame = <savegame> <gallery_id> params = {unlocked = 1} packtype = unlockedtags
	<index> = (<index> + 1)
	repeat <array_size>
	debug_unlock_career_songs savegame = <savegame>
	unlock_all_profiles savegame = <savegame>
	unlock_purchase_all_cas_parts savegame = <savegame>
	unlock_purchase_all_outfit_presets savegame = <savegame>
	unlock_all_career_powers savegame = <savegame>
	debug_unlock_all_cheats \{controller = $primary_controller}
	lockglobaltags \{freeplay_check_on}
	lockglobaltags
endscript

script debug_unlock_career_songs 
	<unlock_index> = 0
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	<unlock_array_size> = <array_size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<songs_array> = ($<chapter>.songs)
	getarraysize <songs_array>
	<song_array_size> = <array_size>
	<song_index> = 0
	begin
	<song> = (<songs_array> [<song_index>])
	setglobaltags savegame = <savegame> <song> params = {unlocked = 1}
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	<inner_index> = (<inner_index> + 1)
	repeat <unlock_array_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
endscript

script debug_menu_add_quickplay_stars \{stars = 100}
	get_savegame_from_controller controller = ($primary_controller)
	getglobaltags savegame = <savegame> quickplay_progression_tags
	setglobaltags savegame = <savegame> quickplay_progression_tags params = {
		total_stars = (<total_stars> + <stars>)
		total_award_points = (<total_award_points> + <stars>)
	}
	updateatoms savegame = <savegame>
	updateatoms savegame = <savegame> global_atoms = 1
endscript

script debug_menu_show_measures_check 
	if ($debug_show_measures = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_toggle_show_measures 
	if debug_menu_show_measures_check
		debug_menu_turn_off_show_measures
	else
		debug_menu_turn_on_show_measures
	endif
endscript

script debug_menu_turn_on_show_measures 
	if screenelementexists \{id = debug_measures_text}
		destroyscreenelement \{id = debug_measures_text}
	endif
	change \{debug_show_measures = 1}
	createscreenelement \{type = textelement
		parent = root_window
		id = debug_measures_text
		font = debug
		text = qs(0xaa4c0def)
		scale = 1
		pos = (850.0, 250.0)
		rgba = [
			255
			187
			0
			255
		]
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 1000
		hide}
	if ($playing_song = 1)
		debug_measures_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_measures 
	if screenelementexists \{id = debug_measures_text}
		destroyscreenelement \{id = debug_measures_text}
	endif
	change \{debug_show_measures = 0}
endscript

script debug_menu_toggle_show_song_stars 
	if debug_menu_show_song_stars_check
		debug_menu_turn_off_show_song_stars
	else
		debug_menu_turn_on_show_song_stars
	endif
endscript

script debug_menu_turn_on_show_song_stars 
	if screenelementexists \{id = debug_songstars_text}
		destroyscreenelement \{id = debug_songstars_text}
	endif
	change \{debug_show_song_stars = 1}
	createscreenelement \{type = textelement
		parent = root_window
		id = debug_songstars_text
		font = debug
		text = qs(0xfbf320c8)
		scale = 1
		pos = (850.0, 300.0)
		rgba = [
			255
			187
			0
			255
		]
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 1000
		hide}
	if ($playing_song = 1)
		debug_songstars_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_song_stars 
	if screenelementexists \{id = debug_songstars_text}
		destroyscreenelement \{id = debug_songstars_text}
	endif
	change \{debug_show_song_stars = 0}
endscript

script debug_menu_show_song_time_check 
	if ($debug_show_song_time = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_toggle_show_song_time 
	if debug_menu_show_song_time_check
		debug_menu_turn_off_show_song_time
	else
		debug_menu_turn_on_show_song_time
	endif
endscript

script debug_menu_turn_on_show_song_time 
	if screenelementexists \{id = debug_songtime_text}
		destroyscreenelement \{id = debug_songtime_text}
	endif
	change \{debug_show_song_time = 1}
	createscreenelement \{type = textelement
		parent = root_window
		id = debug_songtime_text
		font = debug
		text = qs(0xecafd78a)
		scale = 1
		pos = (850.0, 200.0)
		rgba = [
			255
			187
			0
			255
		]
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100
		hide}
	if ($playing_song = 1)
		debug_songtime_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_song_time 
	if screenelementexists \{id = debug_songtime_text}
		destroyscreenelement \{id = debug_songtime_text}
	endif
	change \{debug_show_song_time = 0}
endscript

script debug_menu_show_song_name_check 
	if ($debug_show_song_name = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_toggle_show_song_name 
	if debug_menu_show_song_name_check
		debug_menu_turn_off_show_song_name
	else
		debug_menu_turn_on_show_song_name
	endif
endscript

script debug_menu_turn_on_show_song_name 
	if screenelementexists \{id = debug_songname_text}
		destroyscreenelement \{id = debug_songname_text}
	endif
	change \{debug_show_song_name = 1}
	createscreenelement \{type = textelement
		parent = root_window
		id = debug_songname_text
		font = debug
		text = qs(0x13e67977)
		scale = 1
		pos = (850.0, 150.0)
		rgba = [
			255
			187
			0
			255
		]
		just = [
			left
			top
		]
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100
		hide}
	if ($playing_song = 1)
		debug_songname_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_song_name 
	if screenelementexists \{id = debug_songname_text}
		destroyscreenelement \{id = debug_songname_text}
	endif
	change \{debug_show_song_name = 0}
endscript

script debug_menu_turn_on_show_camera_name 
	if screenelementexists \{id = debug_camera_name_text}
		destroyscreenelement \{id = debug_camera_name_text}
	endif
	if screenelementexists \{id = debug_camera_name_text2}
		destroyscreenelement \{id = debug_camera_name_text2}
	endif
	cameracuts_updatedebugcameraname
endscript

script debug_menu_turn_off_show_camera_name 
	if screenelementexists \{id = debug_camera_name_text}
		destroyscreenelement \{id = debug_camera_name_text}
	endif
	if screenelementexists \{id = debug_camera_name_text2}
		destroyscreenelement \{id = debug_camera_name_text2}
	endif
	cameracuts_updatedebugcameraname
endscript

script debug_menu_turn_on_show_input_log 
	kill_debug_elements
	init_play_log
endscript

script debug_menu_turn_off_show_input_log 
	kill_debug_elements
	init_play_log
endscript

script debug_menu_turn_on_view_volumes 
	kill_debug_elements
endscript

script debug_menu_turn_off_view_volumes 
	kill_debug_elements
endscript

script debug_menu_turn_on_screen_noise 
	engineconfig \{enablescreenfx = noise2}
endscript

script debug_menu_turn_off_screen_noise 
	engineconfig \{disablescreenfx = noise2}
endscript

script debug_menu_turn_on_motion_blur 
	engineconfig \{enablescreenfx = motionblur}
endscript

script debug_menu_turn_off_motion_blur 
	engineconfig \{disablescreenfx = motionblur}
endscript

script debug_menu_turn_on_ad_overlay 
	spawnscript \{dynamicaddebugoverlay}
endscript

script debug_menu_turn_off_ad_overlay 
	dynamicaddebugoverlay_destroy
endscript

script debug_menu_turn_on_venue_ad_override 
	ok_for_venue_ad_on
endscript

script debug_menu_turn_off_venue_ad_override 
	ok_for_venue_ad_off
endscript

script debug_menu_turn_on_band_visibility 
	if ($debug_band_member1_visible = 1)
		if compositeobjectexists \{musician1}
			band_unhide \{name = musician1}
		endif
	endif
	if ($debug_band_member2_visible = 1)
		if compositeobjectexists \{musician2}
			band_unhide \{name = musician2}
		endif
	endif
	if ($debug_band_member3_visible = 1)
		if compositeobjectexists \{musician3}
			band_unhide \{name = musician3}
		endif
	endif
	if ($debug_band_member4_visible = 1)
		if compositeobjectexists \{musician4}
			band_unhide \{name = musician4}
		endif
	endif
endscript

script debug_menu_turn_off_band_visibility 
	hide_band
endscript

script debug_menu_turn_on_band_member_visibility \{obj = musician1}
	if ($debug_band_visible = 1)
		if compositeobjectexists <obj>
			band_unhide name = <obj>
		endif
	endif
endscript

script debug_menu_turn_off_band_member_visibility \{obj = musician1}
	if compositeobjectexists <obj>
		<obj> :hide
	endif
endscript

script debug_menu_turn_on_highway_visibility 
	change \{cheat_performancemode = 0}
	if screenelementexists \{id = gem_containerp1}
		legacydoscreenelementmorph \{id = gem_containerp1
			alpha = 1}
	endif
	if screenelementexists \{id = gem_containerp2}
		legacydoscreenelementmorph \{id = gem_containerp2
			alpha = 1}
	endif
	if screenelementexists \{id = gem_containerp3}
		legacydoscreenelementmorph \{id = gem_containerp3
			alpha = 1}
	endif
	if screenelementexists \{id = gem_containerp4}
		legacydoscreenelementmorph \{id = gem_containerp4
			alpha = 1}
	endif
	if screenelementexists \{id = highway_containerp1}
		legacydoscreenelementmorph \{id = highway_containerp1
			alpha = 1}
	endif
	if screenelementexists \{id = highway_containerp2}
		legacydoscreenelementmorph \{id = highway_containerp2
			alpha = 1}
	endif
	if screenelementexists \{id = highway_containerp3}
		legacydoscreenelementmorph \{id = highway_containerp3
			alpha = 1}
	endif
	if screenelementexists \{id = highway_containerp4}
		legacydoscreenelementmorph \{id = highway_containerp4
			alpha = 1}
	endif
	if screenelementexists \{id = vocals_highway_p1}
		legacydoscreenelementmorph \{id = vocals_highway_p1
			alpha = 1}
	endif
	if screenelementexists \{id = vocals_highway_p2}
		legacydoscreenelementmorph \{id = vocals_highway_p2
			alpha = 1}
	endif
	enable_highway_prepass
	show_hud
endscript

script debug_menu_turn_off_highway_visibility 
	change \{cheat_performancemode = 1}
	if screenelementexists \{id = gem_containerp1}
		legacydoscreenelementmorph \{id = gem_containerp1
			alpha = 0}
	endif
	if screenelementexists \{id = gem_containerp2}
		legacydoscreenelementmorph \{id = gem_containerp2
			alpha = 0}
	endif
	if screenelementexists \{id = gem_containerp3}
		legacydoscreenelementmorph \{id = gem_containerp3
			alpha = 0}
	endif
	if screenelementexists \{id = gem_containerp4}
		legacydoscreenelementmorph \{id = gem_containerp4
			alpha = 0}
	endif
	if screenelementexists \{id = highway_containerp1}
		legacydoscreenelementmorph \{id = highway_containerp1
			alpha = 0}
	endif
	if screenelementexists \{id = highway_containerp2}
		legacydoscreenelementmorph \{id = highway_containerp2
			alpha = 0}
	endif
	if screenelementexists \{id = highway_containerp3}
		legacydoscreenelementmorph \{id = highway_containerp3
			alpha = 0}
	endif
	if screenelementexists \{id = highway_containerp4}
		legacydoscreenelementmorph \{id = highway_containerp4
			alpha = 0}
	endif
	if screenelementexists \{id = vocals_highway_p1}
		legacydoscreenelementmorph \{id = vocals_highway_p1
			alpha = 0}
	endif
	if screenelementexists \{id = vocals_highway_p2}
		legacydoscreenelementmorph \{id = vocals_highway_p2
			alpha = 0}
	endif
	disable_highway_prepass
	hide_hud
endscript

script debug_menu_visibility_check 
	requireparams \{[
			type
		]
		all}
	formattext checksumname = global 'debug_%s_visible' s = <type>
	if (($<global>) = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_set_visibility 
	types = ['crowd' 'stage' 'scene_ped']
	getarraysize <types>
	i = 0
	begin
	if debug_menu_visibility_check type = (<types> [<i>])
		debug_menu_turn_on_visibility type = (<types> [<i>])
	else
		debug_menu_turn_off_visibility type = (<types> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script debug_menu_turn_on_visibility 
	requireparams \{[
			type
		]
		all}
	formattext checksumname = global 'debug_%s_visible' s = <type>
	change globalname = <global> newvalue = 1
	if NOT (<type> = 'crowd')
		formattext checksumname = type_checksum '%s' s = <type>
		hideobjectbytype type = <type_checksum> unhide
	else
		hide_crowd_models \{active = false}
	endif
endscript

script debug_menu_turn_off_visibility 
	requireparams \{[
			type
		]
		all}
	formattext checksumname = global 'debug_%s_visible' s = <type>
	change globalname = <global> newvalue = 0
	if NOT (<type> = 'crowd')
		formattext checksumname = type_checksum '%s' s = <type>
		hideobjectbytype type = <type_checksum>
	else
		hide_crowd_models \{active = true}
	endif
endscript

script debug_menu_check_cas_assets 
	if scriptexists \{check_cas}
		check_cas \{textures
			preset_profiles
			savegames}
	endif
endscript

script debug_menu_dump_heaps 
	finaldumpheaps
endscript

script debug_menu_autosave_check 
	getglobaltags \{user_options}
	if (<autosave> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_turn_on_autosave 
	setglobaltags \{user_options
		params = {
			autosave = 1
		}}
endscript

script debug_menu_turn_off_autosave 
	setglobaltags \{user_options
		params = {
			autosave = 0
		}}
endscript

script debug_menu_save_replay 
	if NOT are_replays_enabled
		return
	endif
	createscreenelement \{type = textelement
		parent = root_window
		id = info_text
		font = debug
		pos = (640.0, 32.0)
		just = [
			center
			top
		]
		scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = qs(0x153fc55f)
		z_priority = 1.0}
	wait \{2
		gameframes}
	getfirstplayer
	getplayerinfo <player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	formattext textname = filename qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	writedatabuffer name = replay filename = <filename>
	destroyscreenelement \{id = info_text}
endscript

script debug_menu_play_credits 
	ui_sfx \{menustate = generic
		uitype = select}
	reset_score \{player = 1}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{1
		difficulty = hard}
	change \{end_credits = 1}
	generic_event_choose \{state = uistate_end_credits}
endscript

script debug_menu_quit_credits 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_back \{state = uistate_debug}
	band_unload_anim_paks
endscript

script debug_menu_turn_on_lightshow 
	lightshow_displaydebuginfo
endscript

script debug_menu_turn_off_lightshow 
	destroyscreenelement \{id = lightshow_debuganchor}
endscript

script debug_menu_color_calibration 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_choose \{state = uistate_debug_color_calibration}
endscript

script debug_menu_color_histogram 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_choose \{state = uistate_debug_color_histogram}
endscript

script debug_menu_play_rockout 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_choose \{state = uistate_rockout}
endscript

script debug_menu_ui_physics_test 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_choose \{state = uistate_physics
		data = {
			debug
		}}
endscript

script debug_menu_test_velocity_strum 
	if screenelementexists \{id = test_velocity_strum_cont}
		killspawnedscript \{name = debug_menu_test_velocity_strum_update}
		destroyscreenelement \{id = test_velocity_strum_cont}
	else
		createscreenelement \{type = containerelement
			parent = root_window
			id = test_velocity_strum_cont
			pos = (100.0, 300.0)}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			pos = (0.0, 0.0)
			text = qs(0x2f63c463)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]
			scale = 0.5}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_num_text
			pos = (0.0, 50.0)
			text = qs(0x9e0cb7ef)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			pos = (0.0, 100.0)
			text = qs(0x189a82bf)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]
			scale = 0.5}
		createscreenelement \{type = textelement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_average_text
			pos = (0.0, 150.0)
			text = qs(0x9e0cb7ef)
			font = fontgrid_text_a1
			rgba = [
				200
				200
				200
				255
			]
			just = [
				left
				center
			]}
		spawnscriptnow \{debug_menu_test_velocity_strum_update}
	endif
endscript

script debug_menu_test_velocity_strum_update 
	avg_count = 0
	lefty_sum = 0
	trigger_sum = 0
	strum = 0
	max_velocity = -999
	first_frame_hit = 0
	begin
	guitargetanalogueinfo controller = ($primary_controller)
	formattext textname = velocity_text qs(0x73307931) s = <righttrigger>
	if controllermake \{up}
		strum = 1
	endif
	if controllermake \{down}
		strum = 1
	endif
	if (<strum> = 1)
		if (<avg_count> = 0)
			printf \{channel = velocity_test
				qs(0x03ac90f0)}
			printf \{channel = velocity_test
				qs(0x01569320)}
			printf \{channel = velocity_test
				qs(0x670ca128)}
			<first_frame_hit> = <righttrigger>
		endif
		printf channel = velocity_test qs(0x4354a1e3) a = <avg_count> s = <righttrigger>
		if (<righttrigger> > <max_velocity>)
			<max_velocity> = <righttrigger>
		endif
		test_velocity_strum_num_text :se_setprops text = <velocity_text>
		if (<righttrigger> != -128)
			<trigger_sum> = (<trigger_sum> + <righttrigger>)
			<avg_count> = (<avg_count> + 1)
		else
			printf \{channel = velocity_test
				qs(0x03ac90f0)}
			printf channel = velocity_test qs(0x59a6dff9) s = <first_frame_hit>
			if (<avg_count> > 0)
				average = (<trigger_sum> / <avg_count>)
				formattext textname = average_text qs(0x73307931) s = <average>
				printf channel = velocity_test qs(0x21850867) s = <average>
				test_velocity_strum_average_text :se_setprops text = <average_text>
			endif
			printf channel = velocity_test qs(0xee76c5c1) s = <max_velocity>
			printf channel = velocity_test qs(0xbde6dc99) s = <avg_count>
			if (<first_frame_hit> > ($guitar_accent_note_threshold_value))
				printf \{channel = velocity_test
					qs(0x03ac90f0)}
				printf \{channel = velocity_test
					qs(0xa6e09a1d)}
				printf \{channel = velocity_test
					qs(0x03ac90f0)}
			endif
			printf \{channel = velocity_test
				qs(0x01569320)}
			printf \{channel = velocity_test
				qs(0x03ac90f0)}
			<trigger_sum> = 0
			<avg_count> = 0
			<strum> = 0
			<max_velocity> = -999
			<strum> = 0
			<first_frame_hit> = 0
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script debug_menu_mic_debugger 
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_back \{state = uistate_debug}
	ui_event_wait \{event = menu_replace
		state = uistate_mic_debug}
endscript

script debug_menu_nxgui_sandbox 
	ui_event \{event = menu_change
		state = uistate_nxgui_sandbox}
endscript

script debug_menu_ui_sfx_test 
	ui_event \{event = menu_change
		state = uistate_ui_sfx_test}
endscript

script get_part_text \{part = guitar}
	return part_text = ($part_list_props.<part>.text)
endscript

script get_part_text_nl \{part = !q1768515945}
	return part_text = ($part_list_props.<part>.text_nl)
endscript

script debug_menu_build_replay_menu 
	array = []
	startwildcardsearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT getwildcardfile
		break
	endif
	addarrayelement array = <array> element = {basename = <basename> filename = <filename>}
	<index> = (<index> + 1)
	repeat
	endwildcardsearch
	return item_params = <array>
endscript

script debug_menu_replay_menu_name_builder 
	requireparams \{[
			index
			basename
			filename
		]
		all}
	return name = <basename>
endscript

script debug_menu_replay_menu_choose_script_builder 
	requireparams \{[
			index
			basename
			filename
		]
		all}
	return pad_choose_script = debug_menu_play_replay pad_choose_params = {replay = <filename> song_name = qs(0xfa9bd01d)}
endscript

script debug_menu_play_replay 
	debug_menu_back_to_retail_menu
	restart_gem_scroller <...>
endscript

script debug_menu_difficulty_analyzer_back 
	killspawnedscript \{name = debug_menu_wait_for_diff_analyzer_spawned}
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script debug_menu_build_difficulty_analyzer_menu 
	array = []
	getsonglistsize
	full_size = <array_size>
	getarraysize \{$debug_songlist}
	array_size = (<full_size> + <array_size>)
	index = 0
	begin
	getsonglistchecksum index = <index>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	addarrayelement array = <array> element = {song_checksum = <song_checksum> song_title = <song_title>}
	<index> = (<index> + 1)
	repeat <array_size>
	return item_params = <array>
endscript

script debug_menu_difficulty_analyzer_menu_name_builder 
	requireparams \{[
			index
			song_checksum
			song_title
		]
		all}
	return name = <song_title>
endscript

script debug_menu_difficulty_analyzer_menu_params_builder 
	requireparams \{[
			index
			song_checksum
			song_title
		]
		all}
	return menu_params = {song_name = <song_checksum>}
endscript

script debug_menu_difficulty_analyzer_menu_focus_script_builder 
	requireparams \{[
			index
			song_checksum
			song_title
		]
		all}
	return additional_focus_script = debug_menu_wait_for_diff_analyzer additional_focus_params = {song_checksum = <song_checksum>}
endscript

script debug_menu_wait_for_diff_analyzer 
	killspawnedscript \{name = debug_menu_wait_for_diff_analyzer_spawned}
	spawnscriptnow debug_menu_wait_for_diff_analyzer_spawned params = {<...>}
endscript

script debug_menu_wait_for_diff_analyzer_spawned 
	wait \{0.5
		seconds}
	difficulty_analyzer_show instrument = guitar difficulty = all song_name = <song_checksum>
endscript

script debug_menu_build_difficulty_analyzer_instrument_menu 
	requireparams \{[
			song_name
		]
		all}
	array = []
	getarraysize \{$instrument_checksums}
	index = 0
	begin
	instrument = ($instrument_text [<index>])
	addarrayelement array = <array> element = {instrument_text = <instrument> instrument = ($instrument_checksums [<index>]) song_name = <song_name>}
	<index> = (<index> + 1)
	repeat <array_size>
	printf \{qs(0x452cb686)}
	printstruct <...>
	if (<song_name> = debug_output)
		addarrayelement array = <array> element = {all instrument_text = qs(0xbdd39334) instrument = all song_name = <song_name>}
	endif
	return item_params = <array>
endscript

script debug_menu_difficulty_analyzer_instrument_menu_name_builder 
	requireparams \{[
			index
			instrument_text
			instrument
			song_name
		]
		all}
	return name = <instrument_text>
endscript

script debug_menu_difficulty_analyzer_instrument_menu_params_builder 
	requireparams \{[
			index
			instrument_text
			instrument
			song_name
		]
		all}
	return menu_params = {instrument = <instrument> song_name = <song_name>}
endscript

script debug_menu_build_difficulty_analyzer_difficulty_menu 
	requireparams \{[
			song_name
		]
		all}
	array = []
	getarraysize \{$difficulty_list}
	index = 0
	begin
	difficulty = ($difficulty_list [<index>])
	get_difficulty_text difficulty = <difficulty>
	addarrayelement array = <array> element = {difficulty_text = <difficulty_text> difficulty = <difficulty> instrument = <instrument> song_name = <song_name>}
	<index> = (<index> + 1)
	repeat <array_size>
	if (<song_name> = debug_output)
		addarrayelement array = <array> element = {all = 1 difficulty_text = qs(0xbdd39334) difficulty = all instrument = <instrument> song_name = <song_name>}
	endif
	return item_params = <array>
endscript

script debug_menu_difficulty_analyzer_difficulty_menu_name_builder 
	requireparams \{[
			index
			difficulty_text
			difficulty
			instrument
			song_name
		]
		all}
	return name = <difficulty_text>
endscript

script debug_menu_difficulty_analyzer_difficulty_menu_choose_script_builder 
	requireparams \{[
			index
			difficulty_text
			difficulty
			instrument
			song_name
		]
		all}
	if (<all> = 1)
		pad_choose_script = output_diff_scores
		pad_choose_params = {all = 1 instrument = <instrument>}
	else
		if (<song_name> = debug_output)
			pad_choose_script = output_diff_scores
			pad_choose_params = {instrument = <instrument> difficulty = <difficulty>}
		endif
	endif
	return pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>
endscript

script debug_menu_difficulty_analyzer_difficulty_menu_focus_script_builder 
	requireparams \{[
			index
			difficulty_text
			difficulty
			instrument
			song_name
		]
		all}
	if (<song_name> != debug_output)
		additional_focus_script = difficulty_analyzer_show
		additional_focus_params = {instrument = <instrument> difficulty = <difficulty> song_name = <song_name>}
	endif
	return additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>
endscript

script debug_menu_is_valid_playermode 
	requireparams \{[
			mode
		]
		all}
	extendcrc <mode> '_props' out = props
	if (($<props>.type = tutorial) || ($<props>.type = competitive) || ($<props>.type = pro_faceoff))
		return \{false}
	else
		return \{true}
	endif
endscript

script debug_menu_play_song_get_value 
	getarraysize \{$gamemode_list}
	index = 0
	begin
	if ($game_mode = ($gamemode_list) [<index>])
		if debug_menu_is_valid_playermode mode = ($game_mode)
			return value = <index>
		else
			return \{value = 0}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{value = 0}
endscript

script debug_menu_play_song_get_text 
	requireparams \{[
			value
		]
		all}
	mode = (($gamemode_list) [<value>])
	extendcrc <mode> '_props' out = props
	return text = ($<props>.debug_name)
endscript

script debug_menu_play_song_option_left 
	requireparams \{[
			value
		]
		all}
	getarraysize \{$gamemode_list}
	num_gamemodes = <array_size>
	new_value = (<value> -1)
	begin
	if (<new_value> < 0)
		<new_value> = (<num_gamemodes> - 1)
	endif
	<mode> = (($gamemode_list) [<new_value>])
	if debug_menu_is_valid_playermode mode = <mode>
		change game_mode = <mode>
		break
	endif
	new_value = (<new_value> -1)
	repeat
endscript

script debug_menu_play_song_option_right 
	requireparams \{[
			value
		]
		all}
	getarraysize \{$gamemode_list}
	num_gamemodes = <array_size>
	new_value = (<value> + 1)
	begin
	if (<new_value> >= <num_gamemodes>)
		<new_value> = 0
	endif
	<mode> = (($gamemode_list) [<new_value>])
	if debug_menu_is_valid_playermode mode = <mode>
		change game_mode = <mode>
		break
	endif
	new_value = (<new_value> + 1)
	repeat
endscript

script debug_menu_translate_gamemode 
	requireparams \{[
			num_players
		]
		all}
	getmaxlocalplayers
	player = 1
	begin
	setplayerinfo <player> in_game = 0
	<player> = (<player> + 1)
	repeat <max_players>
	player = 1
	begin
	setplayerinfo <player> in_game = 1
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script debug_menu_num_players_choose 
	requireparams \{[
			num_players
		]
		all}
	setplayerinfo 1 device = <device_num>
	debug_menu_translate_gamemode num_players = <num_players>
	gamemode_gettype
	if (<type> = career)
		change \{current_chapter = quest_chapter_axel}
	endif
endscript

script debug_menu_build_musician_menu_items 
	array = []
	index = 0
	begin
	formattext checksumname = global_name 'debug_musician%a' a = (<index> + 1) addtostringlookup = true
	addarrayelement array = <array> element = {global_name = <global_name>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_musician_menu_name_builder 
	requireparams \{[
			index
			global_name
		]
		all}
	formattext textname = text qs(0xf566904b) i = (<index> + 1)
	return name = <text>
endscript

script debug_menu_musician_menu_value_builder 
	requireparams \{[
			index
			global_name
		]
		all}
	return value = ($<global_name>)
endscript

script debug_menu_musician_menu_text_builder 
	requireparams \{[
			index
			global_name
			value
		]
		all}
	get_part_text_nl part = <value>
	return text = <part_text>
endscript

script debug_menu_musician_type_option_left 
	requireparams \{[
			index
			global_name
			value
		]
		all}
	getarraysize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	change globalname = <global_name> newvalue = ($part_list [<i>])
endscript

script debug_menu_musician_type_option_right 
	requireparams \{[
			index
			global_name
			value
		]
		all}
	getarraysize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	change globalname = <global_name> newvalue = ($part_list [<i>])
endscript

script debug_menu_build_bot_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	addarrayelement array = <array> element = {player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_bot_menu_name_builder 
	requireparams \{[
			index
			player
		]
		all}
	formattext textname = text qs(0xfddc86bc) i = <player>
	return name = <text>
endscript

script debug_menu_bot_check 
	requireparams \{[
			index
			player
		]
		all}
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_turn_on_bot 
	requireparams \{[
			index
			player
		]
		all}
	kill_debug_elements
	botplayon player = <player>
endscript

script debug_menu_turn_off_bot 
	requireparams \{[
			index
			player
		]
		all}
	kill_debug_elements
	botplayoff player = <player>
endscript

script debug_menu_bot_instructions_check 
	getplayerinfo \{1
		bot_show_debug_widget}
	if (<bot_show_debug_widget> = 1)
		return \{true}
	elseif (<bot_show_debug_widget> = 0)
		return \{false}
	else
		return \{true}
	endif
endscript

script debug_menu_turn_on_bot_instructions 
	togglebotdebugwidget \{action = on}
endscript

script debug_menu_turn_off_bot_instructions 
	togglebotdebugwidget \{action = off}
endscript

script debug_menu_build_star_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x967664e3) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_star_menu_name_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	return name = <name>
endscript

script debug_menu_star_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	getplayerinfo <player> star_power_debug_mode
	return value = <star_power_debug_mode>
endscript

script debug_menu_star_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch (<value>)
		case 0
		text = qs(0x9dd9821b)
		case 1
		text = qs(0x782ba2cb)
		case 2
		text = qs(0xd9c6ffbe)
		case 3
		text = qs(0x82f96fc3)
		default
		text = qs(0x4b8729ef)
	endswitch
	return text = <text>
endscript

script debug_menu_star_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	<new_value> = (<value> -1)
	if (<new_value> < 0)
		<new_value> = 3
	endif
	setplayerinfo <player> star_power_debug_mode = <new_value>
endscript

script debug_menu_star_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	<new_value> = (<value> + 1)
	if (<new_value> > 3)
		<new_value> = 0
	endif
	setplayerinfo <player> star_power_debug_mode = <new_value>
endscript

script debug_menu_build_hyperspeed_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x58400222) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_hyperspeed_menu_name_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	return name = <name>
endscript

script debug_menu_hyperspeed_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	getplayerinfo <player> hyperspeed
	return value = <hyperspeed>
endscript

script debug_menu_hyperspeed_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	formattext textname = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_hyperspeed_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	<new_value> = (<value> -0.01)
	if (<new_value> < $hyperspeed_fastest)
		<new_value> = $hyperspeed_fastest
	endif
	setplayerinfo <player> hyperspeed = <new_value>
endscript

script debug_menu_hyperspeed_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	<new_value> = (<value> + 0.01)
	if (<new_value> > $hyperspeed_slowest)
		<new_value> = $hyperspeed_slowest
	endif
	setplayerinfo <player> hyperspeed = <new_value>
endscript

script debug_menu_scoring_attribute_menu_name_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	return name = <name>
endscript

script debug_menu_build_sp_mult_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x23982ecc) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_sp_mult_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_sp_mult_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_sp_mult_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_sp_mult_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_sp_mult_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_sp_mult_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_sp_mult_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_mult_max_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0xb6d59e6b) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_mult_max_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_mult_max_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_mult_max_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_mult_max_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_mult_max_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_mult_max_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_mult_max_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_mult_enhance_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0xf76faa1f) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_mult_enhance_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_mult_enhance_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_mult_enhance_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_mult_enhance_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_mult_enhance_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_mult_enhance_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_mult_enhance_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_sp_gain_mult_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0xb974bd95) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_sp_gain_mult_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_star_power_gain_multiplier_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_sp_gain_mult_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_sp_gain_mult_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_star_power_gain_multiplier_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_sp_gain_mult_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_star_power_gain_multiplier_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_sp_note_streak_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x3209e0fd) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_sp_note_streak_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_sp_note_streak_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_sp_note_streak_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_sp_note_streak_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_sp_note_streak_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_sp_note_streak_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_sp_note_streak_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_crowd_meter_start_bonus_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x28bacf77) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_crowd_meter_start_bonus_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_crowd_meter_start_bonus_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_crowd_meter_start_bonus_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_crowd_meter_start_bonus_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_crowd_meter_start_bonus_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_crowd_meter_start_bonus_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_crowd_meter_start_bonus_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_miss_note_bonus_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x2525e1f7) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_miss_note_bonus_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_miss_note_bonus_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_miss_note_bonus_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_miss_note_bonus_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_miss_note_bonus_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_miss_note_bonus_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_miss_note_bonus_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_resurrection_lives_menu_items 
	array = []
	index = 0
	begin
	player = (<index> + 1)
	formattext textname = name qs(0x23cc7e45) i = <player>
	addarrayelement array = <array> element = {name = <name> player = <player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_resurrection_lives_menu_value_builder 
	requireparams \{[
			index
			name
			player
		]
		all}
	formattext checksumname = name 'debug_resurrection_lives_%d' d = <player>
	return value = ($<name>)
endscript

script debug_menu_resurrection_lives_menu_text_builder 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	switch <value>
		case 0
		text = qs(0x128bfaaa)
		case 1
		text = qs(0xf751ec3f)
		case 2
		text = qs(0xdc7cbffc)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_resurrection_lives_type_option_left 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	formattext checksumname = name 'debug_resurrection_lives_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_resurrection_lives_type_option_right 
	requireparams \{[
			index
			name
			player
			value
		]
		all}
	kill_debug_elements
	getarraysize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	formattext checksumname = name 'debug_resurrection_lives_%d' d = <player>
	change globalname = <name> newvalue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_input_logic_lag_get_value 
	getplatform
	switch <platform>
		case ps2
		value = ($default_lag_settings.ps2.input_lag_ms)
		case ps3
		value = ($default_lag_settings.ps3.input_lag_ms)
		case windx
		case xenon
		value = ($default_lag_settings.xenon.input_lag_ms)
		case wii
		value = ($default_lag_settings.wii.input_lag_ms)
		default
		value = 0
	endswitch
	return value = <value>
endscript

script debug_menu_input_logic_lag_get_text 
	requireparams \{[
			value
		]
		all}
	formattext textname = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_input_logic_lag_option_left 
	requireparams \{[
			value
		]
		all}
	<new_value> = (<value> -1)
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_input_logic_lag_option_right 
	requireparams \{[
			value
		]
		all}
	<new_value> = (<value> + 1)
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> input_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_gem_logic_lag_get_value 
	getplatform
	switch <platform>
		case ps2
		value = ($default_lag_settings.ps2.gem_lag_ms)
		case ps3
		value = ($default_lag_settings.ps3.gem_lag_ms)
		case windx
		case xenon
		value = ($default_lag_settings.xenon.gem_lag_ms)
		case wii
		value = ($default_lag_settings.wii.gem_lag_ms)
		default
		value = 0
	endswitch
	return value = <value>
endscript

script debug_menu_gem_logic_lag_get_text 
	requireparams \{[
			value
		]
		all}
	formattext textname = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_gem_logic_lag_option_left 
	requireparams \{[
			value
		]
		all}
	<new_value> = (<value> -1)
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_gem_logic_lag_option_right 
	requireparams \{[
			value
		]
		all}
	<new_value> = (<value> + 1)
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> gem_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_audio_logic_lag_get_value 
	getplatform
	switch <platform>
		case ps2
		value = ($default_lag_settings.ps2.audio_lag_ms)
		case ps3
		value = ($default_lag_settings.ps3.audio_lag_ms)
		case windx
		case xenon
		value = ($default_lag_settings.xenon.audio_lag_ms)
		case wii
		value = ($default_lag_settings.wii.audio_lag_ms)
		default
		value = 0
	endswitch
	return value = <value>
endscript

script debug_menu_audio_logic_lag_get_text 
	requireparams \{[
			value
		]
		all}
	formattext textname = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_audio_logic_lag_option_left 
	requireparams \{[
			value
		]
		all}
	<new_value> = (<value> -1)
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_audio_logic_lag_option_right 
	requireparams \{[
			value
		]
		all}
	<new_value> = (<value> + 1)
	getplatform
	switch <platform>
		case ps2
		ps2_props = ($default_lag_settings.ps2)
		ps2_props = {<ps2_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps2 = <ps2_props>}
		case ps3
		ps3_props = ($default_lag_settings.ps3)
		ps3_props = {<ps3_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) ps3 = <ps3_props>}
		case windx
		case xenon
		xenon_props = ($default_lag_settings.xenon)
		xenon_props = {<xenon_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> audio_lag_ms = <new_value>}
		change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_force_score_get_value 
	return \{value = $debug_forcescore}
endscript

script debug_menu_force_score_get_text 
	requireparams \{[
			value
		]
		all}
	switch <value>
		case off
		text = qs(0x128bfaaa)
		case poor
		text = qs(0xeb157b5b)
		case medium
		text = qs(0x79990567)
		case good
		text = qs(0x81f3f6be)
		default
		text = qs(0x128bfaaa)
	endswitch
	return text = <text>
endscript

script debug_menu_force_score_option_left 
	requireparams \{[
			value
		]
		all}
	getarraysize ($forcescore_list)
	i = 0
	begin
	<fs> = ($forcescore_list [<i>])
	if (<value> = <fs>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	change debug_forcescore = ($forcescore_list [<i>])
endscript

script debug_menu_force_score_option_right 
	requireparams \{[
			value
		]
		all}
	getarraysize ($forcescore_list)
	i = 0
	begin
	<fs> = ($forcescore_list [<i>])
	if (<value> = <fs>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	change debug_forcescore = ($forcescore_list [<i>])
endscript

script debug_menu_select_start_song \{force_intro = 0
		force_long_intro = 0
		force_encore = 0
		force_transformation = 0}
	if (<force_intro> = 1)
		change \{current_transition = forceintro}
	endif
	if (<force_long_intro> = 1)
		change \{current_transition = forcelongintro}
	endif
	if (<force_encore> = 1)
		change \{current_transition = encore}
		change \{debug_encore = 1}
		debug_select_venue
		return
	endif
	if (<force_transformation> = 1)
		<current_chapter> = ($current_chapter)
		if (<current_chapter> = none)
			quest_progression_find_chapter_from_venue venue = ($current_level)
			<current_chapter> = <chapter>
			change current_chapter = <current_chapter>
		endif
		setglobaltags savegame = ($primary_controller) career_progression_tags params = {encore_ready = 1} progression = true
		change \{debug_career_transformations = 1}
		playlist_clear
		quest_progression_add_transformation_songs chapter_global = <current_chapter>
	endif
	if gotparam \{song_name}
		playlist_clear
		playlist_setcurrentsong song = <song_name>
	endif
	if gotparam \{starttime}
		change current_starttime = <starttime>
	endif
	change \{song_heap_required = 0}
	if ($debug_from_gameplay = 1)
		restart_warning_select_restart \{dont_save_song_data}
	else
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_choose {
			data = {
				state = uistate_play_song
				starttime = <starttime>
				uselaststarttime = <uselaststarttime>
			}
		}
	endif
	vocals_distribute_mics
endscript

script debug_menu_play_celeb_intro_get_value 
	return value = {
		value1 = ($debug_selected_intro_1)
		value2 = ($debug_selected_intro_2)
	}
endscript

script debug_menu_play_celeb_intro_get_text \{value = 0x69696969}
	if NOT structurecontains \{structure = value
			value1}
		scriptassert \{'Missing value1 from celeb intro get value!'}
	elseif NOT structurecontains \{structure = value
			value2}
		scriptassert \{'Missing value2 from celeb intro get value!'}
	endif
	quest_checksum = ($quest_progression_unlocks [(<value>.value1)] [(<value>.value2)])
	venue_checksum = ($<quest_checksum>.venue)
	intro_name = ($levelzones.<venue_checksum>.name)
	formattext textname = select_string qs(0x0bc409e2) a = <intro_name>
	return text = <select_string>
endscript

script debug_menu_play_celeb_intro_option_left \{value = 0x69696969}
	if NOT structurecontains \{structure = value
			value1}
		scriptassert \{'Missing value1 from celeb intro get value!'}
	elseif NOT structurecontains \{structure = value
			value2}
		scriptassert \{'Missing value2 from celeb intro get value!'}
	endif
	<new_value1> = (<value>.value1)
	<new_value2> = ((<value>.value2) - 1)
	<found_values> = 0
	if (<new_value2> < 0)
		begin
		<new_value1> = (<new_value1> - 1)
		if (<new_value1> < 0)
			getarraysize ($quest_progression_unlocks)
			<new_value1> = (<array_size> - 1)
		endif
		getarraysize ($quest_progression_unlocks [<new_value1>])
		if (<array_size> > 0)
			<new_value2> = (<array_size> - 1)
			<found_values> = 1
			break
		endif
		repeat
	endif
	change debug_selected_intro_1 = <new_value1>
	change debug_selected_intro_2 = <new_value2>
endscript

script debug_menu_play_celeb_intro_option_right \{value = 0x69696969}
	if NOT structurecontains \{structure = value
			value1}
		scriptassert \{'Missing value1 from celeb intro get value!'}
	elseif NOT structurecontains \{structure = value
			value2}
		scriptassert \{'Missing value2 from celeb intro get value!'}
	endif
	<new_value1> = (<value>.value1)
	<new_value2> = ((<value>.value2) + 1)
	<found_values> = 0
	getarraysize ($quest_progression_unlocks [<new_value1>])
	if (<new_value2> >= <array_size>)
		begin
		<new_value1> = (<new_value1> + 1)
		getarraysize ($quest_progression_unlocks)
		if (<new_value1> >= <array_size>)
			<new_value1> = 0
		endif
		getarraysize ($quest_progression_unlocks [<new_value1>])
		if (<array_size> > 0)
			<new_value2> = 0
			break
		endif
		repeat
	endif
	change debug_selected_intro_1 = <new_value1>
	change debug_selected_intro_2 = <new_value2>
endscript

script debug_start_song_with_celeb_intro 
	if ($debug_selected_intro = -1)
		printf \{channel = band
			qs(0x9be9bbab)}
		change \{game_mode = career}
		debug_menu_select_start_song
		return
	endif
	quest_checksum = ($quest_progression_unlocks [$debug_selected_intro_1] [$debug_selected_intro_2])
	song_name = ($<quest_checksum>.songs [0])
	venue = ($<quest_checksum>.venue)
	printf channel = band qs(0xbba52acc) a = <song_name> b = <venue>
	printf channel = band qs(0xbd425a18) a = <intro>
	change \{debug_current_transition = celebintro}
	playlist_setcurrentsong song = <song_name>
	change current_level = <venue>
	change g_band_lobby_current_level = <venue>
	change \{current_starttime = 0}
	change \{debug_play_celeb_intro = 1}
	change \{game_mode = career}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		part = vocals}
	setplayerinfo 1 controller = <device_num>
	change \{g_net_leader_player_num = 1}
	threadsafesetglobalinteger global_name = primary_controller new_value = <device_num>
	get_savegame_from_controller controller = <device_num>
	change current_chapter = <quest_checksum>
	debug_select_venue level = <venue>
endscript

script debug_select_venue \{norestart = 0}
	ui_sfx \{menustate = generic
		uitype = select}
	destroy_crowd_models
	wait \{10
		gameframes}
	kill_gem_scroller
	if gotparam \{level}
		change current_level = <level>
	endif
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	changenodeflag \{ls_3_5_pre
		1}
	changenodeflag \{ls_3_5_post
		0}
	changenodeflag \{ls_encore_pre
		1}
	changenodeflag \{ls_encore_post
		0}
	playlist_getcurrentsong
	if (<current_song> = null)
		if NOT stringequals a = ($song_heap_pakname) b = 'none'
			debug_restore_song_from_pakname pakname = ($song_heap_pakname)
			playlist_setcurrentsong song = <current_song>
		else
			playlist_setcurrentsong song = ($startup_song)
		endif
	endif
	destroypakmanmap \{map = zones}
	memory_create_zone_maps
	load_venue \{block_scripts = 1}
	wait \{5
		gameframes}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		spawnscriptnow \{testlevel_debug}
	else
		crowd_reset \{player = 1}
	endif
	enable_pause
	if NOT ui_event_exists_in_stack \{name = 'gameplay'}
		dbreak
		<norestart> = 1
	endif
	if (<norestart> = 0)
		gh_start_pressed
		restart_gem_scroller starttime = ($current_starttime) device_num = <device_num>
	else
		toggleviewmode \{viewerreload}
		toggleviewmode \{viewerreload}
	endif
	getnumplayersingame
	if (<num_players> = 0)
		setplayerinfo \{1
			in_game = 1}
	endif
	guitar_support_init_crowd
	if ($debug_play_celeb_intro = 1)
		if ($debug_from_gameplay = 1)
			restart_warning_select_restart \{dont_save_song_data}
		else
			ui_sfx \{menustate = generic
				uitype = select}
			generic_event_choose \{data = {
					state = uistate_play_song
					starttime = 0
					uselaststarttime = 0
				}}
		endif
	else
		if ui_event_exists_in_stack \{name = 'gameplay'}
			ui_sfx \{menustate = generic
				uitype = select}
			ui_event \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		else
			generic_event_choose \{state = uistate_gameplay}
		endif
	endif
endscript

script debug_restore_song_from_pakname 
	requireparams \{[
			pakname
		]
		all}
	stringremove text = <pakname> remove = 'songs/' new_string = a
	stringremove text = <a> remove = '_song.pak' new_string = b
	formattext checksumname = c <b>
	printstruct <...>
	return current_song = <c>
endscript

script testlevel_debug 
	begin
	if controllermake \{circle
			0}
		debug_next_peds
	endif
	if controllermake \{circle
			1}
		debug_next_peds
	endif
	wait \{1
		gameframe}
	repeat
endscript
debug_ped_row = 0

script debug_next_peds 
	kill \{prefix = z_testlevel_peds_row0}
	kill \{prefix = z_testlevel_peds_row1}
	kill \{prefix = z_testlevel_peds_row2}
	kill \{prefix = z_testlevel_peds_row3}
	kill \{prefix = z_testlevel_peds_row4}
	kill \{prefix = z_testlevel_peds_row5}
	kill \{prefix = z_testlevel_peds_row6}
	kill \{prefix = z_testlevel_peds_row7}
	wait \{1
		gameframe}
	begin
	change debug_ped_row = ($debug_ped_row + 1)
	formattext checksumname = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if isalive prefix = <row>
		break
	else
		change \{debug_ped_row = -1}
	endif
	repeat
endscript

script debug_menu_turn_on_whammy_rewind 
	spawnscript \{quickplay_whammy_rewind}
	pausespawnedscript \{quickplay_whammy_rewind}
endscript

script debug_menu_turn_off_whammy_rewind 
	killspawnedscript \{name = quickplay_whammy_rewind}
endscript

script debug_menu_build_change_venue_menu 
	array = []
	get_levelzonearray_size
	index = 0
	begin
	get_levelzonearray_checksum index = <index>
	addarrayelement array = <array> element = {level_checksum = <level_checksum>}
	<index> = (<index> + 1)
	repeat <array_size>
	return item_params = <array>
endscript

script debug_menu_change_venue_menu_name_builder 
	requireparams \{[
			index
			level_checksum
		]
		all}
	formattext textname = level_name qs(0x5af41da1) t = ($levelzones.<level_checksum>.title) n = ($levelzones.<level_checksum>.name)
	return name = <level_name>
endscript

script debug_menu_change_venue_menu_choose_script_builder 
	requireparams \{[
			index
			level_checksum
		]
		all}
	return pad_choose_script = debug_select_venue pad_choose_params = {level = <level_checksum> norestart = 0}
endscript

script debug_menu_build_change_musician_menu 
	requireparams \{[
			part
		]
		all}
	array = []
	get_savegame_from_controller controller = ($primary_controller)
	characterprofilegetlist savegame = <savegame> categories = [cars ghrockers presetcars modifiable locked debug]
	getarraysize <profile_list>
	index = 0
	begin
	characterprofilegetstruct savegame = <savegame> name = (<profile_list> [<index>])
	get_fullname_of_character savegame = <savegame> id = (<profile_list> [<index>])
	addarrayelement array = <array> element = {fullname = <fullname> part = <part> profile_struct = <profile_struct> savegame = <savegame>}
	<index> = (<index> + 1)
	repeat <array_size>
	return item_params = <array>
endscript

script debug_menu_change_musician_menu_name_builder 
	requireparams \{[
			index
			fullname
			part
			profile_struct
			savegame
		]
		all}
	return name = <fullname>
endscript

script debug_menu_change_musician_menu_params_builder 
	requireparams \{[
			index
			fullname
			part
			profile_struct
			savegame
		]
		all}
	return menu_params = {profile_struct = <profile_struct> part = <part>}
endscript

script debug_is_part_in_band 
	i = 1
	begin
	getplayerinfo <i> part out = player_part
	if (<part> = <player_part>)
		return true player = <i>
	endif
	i = (<i> + 1)
	repeat 4
	return \{false}
endscript

script debug_select_cameracut \{jumptoviewer = 0}
	ui_sfx \{menustate = generic
		uitype = select}
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <camera_array_pakname>
	change debug_camera_array_count = <index>
	destroy_cameracuts
	wait \{3
		gameframes}
	create_cameracuts
	if (<jumptoviewer> = 1)
		debug_menu_back_to_retail_menu
		gh_unpause_ui
		enable_pause
		change \{viewer_buttons_enabled = 1}
		toggleviewmode
	endif
endscript

script debug_menu_build_camera_cut_group_menu 
	<array> = []
	getpakmancurrentname \{map = zones}
	<camera_count> = 0
	getarraysize \{$cameracutprefixarray}
	<camera_cut_prefix_array_size> = <array_size>
	get_camera_special_suffix
	index = 0
	begin
	formattext checksumname = camera_array '%s_%p%b' s = <pakname> p = ($cameracutprefixarray [<index>]) b = <special_suffix>
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		if (<array_size> > 0)
			formattext textname = group_name qs(0x434efee9) p = ($cameracutprefixarray [<index>]) b = <special_suffix>
			addarrayelement array = <array> element = {camera_count = <index> group_name = <group_name>}
		endif
	else
		formattext checksumname = camera_array 'default_%p' p = ($cameracutprefixarray [<index>])
		if globalexists name = <camera_array>
			getarraysize $<camera_array>
			if (<array_size> > 0)
				formattext textname = group_name qs(0x246e6341) p = ($cameracutprefixarray [<index>])
				addarrayelement array = <array> element = {camera_count = <index> group_name = <group_name>}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <camera_cut_prefix_array_size>
	return item_params = <array>
endscript

script debug_menu_camera_cut_group_menu_name_builder 
	requireparams \{[
			index
			camera_count
			group_name
		]
		all}
	return name = <group_name>
endscript

script debug_menu_camera_cut_group_menu_params_builder 
	requireparams \{[
			index
			camera_count
			group_name
		]
		all}
	return menu_params = {camera_count = <camera_count>}
endscript

script debug_menu_build_camera_cut_menu 
	requireparams \{[
			camera_count
		]
		all}
	array = []
	getpakmancurrentname \{map = zones}
	get_camera_special_suffix
	formattext checksumname = camera_array '%s_%p%b' s = <pakname> p = ($cameracutprefixarray [<camera_count>]) b = <special_suffix>
	if globalexists name = <camera_array>
		getarraysize $<camera_array>
		index = 0
		begin
		formattext textname = camera_name qs(0x3efec28c) s = <pakname> p = ($cameracutprefixarray [<camera_count>]) i = <index>
		if structurecontains structure = ($<camera_array> [<index>]) name
			formattext textname = name qs(0x73307931) s = ($<camera_array> [<index>].name) dontassertforchecksums
		elseif structurecontains structure = ($<camera_array> [<index>]) params
			if structurecontains structure = ($<camera_array> [<index>].params) name
				formattext textname = name qs(0x73307931) s = ($<camera_array> [<index>].params.name) dontassertforchecksums
			endif
		endif
		addarrayelement array = <array> element = {name = <name> pakname = <pakname> camera_count = <camera_count>}
		<index> = (<index> + 1)
		repeat <array_size>
	else
		formattext checksumname = camera_array 'default_%p' p = ($cameracutprefixarray [<camera_count>])
		if globalexists name = <camera_array>
			getarraysize $<camera_array>
			index = 0
			begin
			formattext textname = camera_name qs(0xc62762df) p = ($cameracutprefixarray [<camera_count>]) i = <index>
			if structurecontains structure = ($<camera_array> [<index>]) name
				formattext textname = name qs(0x73307931) s = ($<camera_array> [<index>].name) dontassertforchecksums
			elseif structurecontains structure = ($<camera_array> [<index>]) params
				if structurecontains structure = ($<camera_array> [<index>].params) name
					formattext textname = name qs(0x73307931) s = ($<camera_array> [<index>].params.name) dontassertforchecksums
				endif
			endif
			addarrayelement array = <array> element = {name = <name> pakname = 'default' camera_count = <camera_count>}
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return item_params = <array>
endscript

script debug_menu_camera_cut_menu_name_builder 
	requireparams \{[
			index
			name
			pakname
			camera_count
		]
		all}
	return name = <name>
endscript

script debug_menu_camera_cut_menu_choose_script_builder 
	requireparams \{[
			index
			name
			pakname
			camera_count
		]
		all}
	return pad_choose_script = debug_select_cameracut pad_choose_params = {camera_array_pakname = <pakname> camera_array = ($cameracutprefixarray [<camera_count>]) index = <index>}
endscript

script debug_menu_camera_cut_menu_square_script_builder 
	requireparams \{[
			index
			name
			pakname
			camera_count
		]
		all}
	return pad_square_script = debug_select_cameracut pad_square_params = {camera_array_pakname = <pakname> camera_array = ($cameracutprefixarray [<camera_count>]) index = <index> jumptoviewer = 1}
endscript

script debug_menu_build_skip_by_time_menu \{looppoint = 0}
	array = []
	menu_func = debug_menu_select_start_song
	if (<looppoint> = 1)
		menu_func = debug_set_looppoint
		addarrayelement array = <array> element = {name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<num_fretbar_notes> - 1)
	max_time = (<fretbar_time> / 1000)
	time = 0
	begin
	formattext textname = name qs(0x3c09de0c) s = <time>
	if (<time> < <max_time>)
		addarrayelement array = <array> element = {name = <name> menu_func = <menu_func> starttime = (<time> * 1000) song_name = <current_song>}
	else
		break
	endif
	<time> = (<time> + 5)
	repeat
	return item_params = <array>
endscript

script debug_menu_skip_by_time_menu_name_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return name = <name>
endscript

script debug_menu_skip_by_time_menu_choose_script_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return pad_choose_script = <menu_func> pad_choose_params = {song_name = <song_name> starttime = <starttime>}
endscript

script debug_set_looppoint 
	ui_sfx \{menustate = generic
		uitype = select}
	change current_looppoint = <starttime>
	gh_start_pressed
endscript

script debug_menu_build_skip_by_marker_menu \{looppoint = 0}
	array = []
	menu_func = debug_menu_select_start_song
	if (<looppoint> = 1)
		menu_func = debug_set_looppoint
		addarrayelement array = <array> element = {name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	getarraysize <marker_array>
	marker_array_size = <array_size>
	if (<marker_array_size> = 0)
		addarrayelement array = <array> element = {name = qs(0x6a7a8f12) menu_func = <menu_func> starttime = -1000000 song_name = <current_song>}
	else
		measure_num = 1
		beat_num = 0
		fretbar_index = 0
		index = 0
		begin
		marker_time = (<marker_array> [<index>].time)
		timesig_index = 0
		current_timesig_num = 0
		songfilemanager func = get_num_timesig_notes song_name = <current_song>
		if (<num_timesig_notes> > 0)
			begin
			songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_index>
			if (<marker_time> > <timesig_time>)
				current_timesig_num = <timesig_num>
				break
			endif
			timesig_index = (<timesig_index> + 1)
			repeat <num_timesig_notes>
		endif
		songfilemanager func = get_num_fretbar_notes song_name = <current_song>
		begin
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_index>
		if (<fretbar_time> > <marker_time>)
			break
		endif
		if (<beat_num> >= <timesig_num>)
			measure_num = (<measure_num> + 1)
			beat_num = 0
		endif
		beat_num = (<beat_num> + 1)
		fretbar_index = (<fretbar_index> + 1)
		repeat <num_fretbar_notes>
		formattext {
			textname = name
			qs(0x015c83f3)
			a = (<marker_array> [<index>].marker)
			s = (<marker_time> / 1000)
			m = <measure_num>
			b = <beat_num>
		}
		addarrayelement {
			array = <array>
			element = {
				name = <name>
				menu_func = <menu_func>
				starttime = (<marker_array> [<index>].time)
				song_name = <current_song>
			}
		}
		<index> = (<index> + 1)
		repeat <marker_array_size>
	endif
	return item_params = <array>
endscript

script debug_menu_skip_by_marker_menu_name_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return name = <name>
endscript

script debug_menu_skip_by_marker_menu_choose_script_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return pad_choose_script = <menu_func> pad_choose_params = {song_name = <song_name> starttime = <starttime>}
endscript

script debug_menu_build_skip_by_measure_menu \{looppoint = 0}
	array = []
	menu_func = debug_menu_select_start_song
	if (<looppoint> = 1)
		menu_func = debug_set_looppoint
		addarrayelement array = <array> element = {name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	timesig_entry = 0
	songfilemanager func = get_num_timesig_notes song_name = <current_song>
	timesig_num_val = 0
	measure_count = 0
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	fretbar_entry = 0
	fretbar_count = 0
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	fretbar_entry = 0
	fretbar_count = 0
	begin
	if (<timesig_entry> < <num_timesig_notes>)
		songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_entry>
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		if (<timesig_time> <= <fretbar_time>)
			timesig_num_val = <timesig_num>
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num_val>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	fretbar_entry = (<fretbar_entry> + 1)
	repeat <num_fretbar_notes>
	if (<measure_count> > 150)
		measures_per_menuitem = 2
	else
		measures_per_menuitem = 1
	endif
	timesig_entry = 0
	measure_count = 0
	fretbar_entry = 0
	fretbar_count = 0
	measures_per_menuitem_count = 0
	begin
	if (<timesig_entry> < <num_timesig_notes>)
		songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_entry>
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		if (<timesig_time> <= <fretbar_time>)
			timesig_num_val = <timesig_num>
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	if (<fretbar_count> = 0)
		measures_per_menuitem_count = (<measures_per_menuitem_count> + 1)
		if (<measures_per_menuitem_count> = <measures_per_menuitem>)
			songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
			time = <fretbar_time>
			formattext textname = name qs(0x5fe38f1e) s = (<time> / 1000.0) m = <measure_count>
			addarrayelement {
				array = <array>
				element = {
					name = <name>
					menu_func = <menu_func>
					starttime = <time>
					song_name = <current_song>
				}
			}
			measures_per_menuitem_count = 0
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num_val>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	fretbar_entry = (<fretbar_entry> + 1)
	repeat <num_fretbar_notes>
	return item_params = <array>
endscript

script debug_menu_skip_by_measure_menu_name_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return name = <name>
endscript

script debug_menu_skip_by_measure_menu_choose_script_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return pad_choose_script = <menu_func> pad_choose_params = {song_name = <song_name> starttime = <starttime>}
endscript

script debug_menu_build_skip_by_vocal_phrase_menu \{looppoint = 0}
	array = []
	menu_func = debug_menu_select_start_song
	if (<looppoint> = 1)
		menu_func = debug_set_looppoint
		addarrayelement array = <array> element = {name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	getarraysize <marker_array>
	marker_array_size = <array_size>
	if (<marker_array_size> = 0)
		addarrayelement array = <array> element = {name = qs(0x6a7a8f12) menu_func = <menu_func> starttime = -1000000 song_name = <current_song>}
	else
		measure_num = 1
		beat_num = 0
		fretbar_index = 0
		index = 0
		begin
		marker_time = (<marker_array> [<index>].time)
		timesig_index = 0
		current_timesig_num = 0
		songfilemanager func = get_num_timesig_notes song_name = <current_song>
		if (<num_timesig_notes> > 0)
			begin
			songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_index>
			if (<marker_time> > <timesig_time>)
				current_timesig_num = <timesig_num>
				break
			endif
			timesig_index = (<timesig_index> + 1)
			repeat <num_timesig_notes>
		endif
		songfilemanager func = get_num_fretbar_notes song_name = <current_song>
		begin
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_index>
		if (<fretbar_time> > <marker_time>)
			break
		endif
		if (<beat_num> >= <timesig_num>)
			measure_num = (<measure_num> + 1)
			beat_num = 0
		endif
		beat_num = (<beat_num> + 1)
		fretbar_index = (<fretbar_index> + 1)
		repeat <num_fretbar_notes>
		formattext {
			textname = name
			qs(0x015c83f3)
			a = (<marker_array> [<index>].marker)
			s = (<marker_time> / 1000)
			m = <measure_num>
			b = <beat_num>
		}
		addarrayelement {
			array = <array>
			element = {
				name = <name>
				menu_func = <menu_func>
				starttime = (<marker_array> [<index>].time)
				song_name = <current_song>
			}
		}
		<index> = (<index> + 1)
		repeat <marker_array_size>
	endif
	return item_params = <array>
endscript

script debug_menu_skip_by_vocal_phrase_menu_name_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return name = <name>
endscript

script debug_menu_skip_by_vocal_phrase_menu_choose_script_builder 
	requireparams \{[
			index
			name
			starttime
			menu_func
		]
		all}
	return pad_choose_script = <menu_func> pad_choose_params = {song_name = <song_name> starttime = <starttime>}
endscript

script debug_menu_build_song_source_menu 
	<array> = []
	getarraysize ($gh_songlist)
	<gh_songlist_size> = <array_size>
	if (<gh_songlist_size> > 0)
		<index> = 0
		begin
		if globalexists name = (($gh_songlist [<index>]).list)
			<song_source_global> = (($gh_songlist [<index>]).list)
			getarraysize ($<song_source_global>)
			if (<array_size> > 0)
				addarrayelement {
					array = <array>
					element = {
						song_source_title = (($gh_songlist [<index>]).frontend_desc)
						song_source_global = <song_source_global>
					}
				}
			endif
		endif
		<index> = (<index> + 1)
		repeat <gh_songlist_size>
	endif
	getarraysize ($additional_songlist)
	<additional_songlist_size> = <array_size>
	if (<additional_songlist_size> > 0)
		<index> = 0
		begin
		if globalexists name = (($additional_songlist [<index>]).list)
			<song_source_global> = (($additional_songlist [<index>]).list)
			getarraysize ($<song_source_global>)
			if (<array_size> > 0)
				addarrayelement {
					array = <array>
					element = {
						song_source_title = (($additional_songlist [<index>]).frontend_desc)
						song_source_global = <song_source_global>
					}
				}
			endif
		endif
		<index> = (<index> + 1)
		repeat <additional_songlist_size>
	endif
	return item_params = <array>
endscript

script debug_menu_play_song_source_name_builder \{index = !i1768515945
		song_source_title = 0x69696969
		song_source_global = !q1768515945}
	return name = <song_source_title>
endscript

script debug_menu_play_song_params_builder \{index = !i1768515945
		song_source_global = !q1768515945}
	return menu_params = {song_source_global = <song_source_global>}
endscript

script debug_menu_build_play_song_menu 
	getarraysize ($<song_source_global>)
	<array> = []
	if (<array_size> > 0)
		<index> = 0
		begin
		<song_checksum> = ($<song_source_global> [<index>])
		get_song_title song = <song_checksum>
		addarrayelement {
			array = <array>
			element = {
				song_title = <song_title>
				song_checksum = <song_checksum>
			}
		}
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return item_params = <array>
endscript

script debug_menu_play_song_menu_name_builder 
	requireparams \{[
			index
			song_title
			song_checksum
		]
		all}
	return name = <song_title>
endscript

script debug_menu_song_part_menu_params_builder 
	requireparams \{[
			index
			song_checksum
		]
		all}
	return menu_params = {song_checksum = <song_checksum>}
endscript

script debug_menu_build_song_part_menu_items 
	requireparams \{[
			song_checksum
		]
		all}
	playlist_clear
	playlist_setcurrentsong song = <song_checksum>
	array = []
	getnumplayersingame
	getfirstplayer
	begin
	addarrayelement array = <array> element = {player = <player>}
	getnextplayer player = <player>
	repeat <num_players>
	return item_params = <array>
endscript

script debug_menu_song_part_menu_name_builder 
	requireparams \{[
			index
			player
		]
		all}
	formattext textname = name qs(0xc75c44b2) i = <player> addtostringlookup = true
	return name = <name>
endscript

script debug_menu_song_part_menu_value_builder 
	requireparams \{[
			index
			player
		]
		all}
	getplayerinfo <player> part
	printf \{qs(0xc5d6a665)}
	printstruct <...>
	if (<part> = vocals)
		getplayerinfo <player> vocal_track
		if (<vocal_track> = 1)
			return \{value = backup_vocals}
		endif
	endif
	return value = <part>
endscript

script debug_menu_song_part_menu_text_builder 
	requireparams \{[
			index
			player
			value
		]
		all}
	if (<value> = backup_vocals)
		return \{text = 'backup vocals'}
	endif
	get_part_text_nl part = <value>
	return text = <part_text>
endscript

script debug_menu_song_part_type_option_left 
	requireparams \{[
			index
			player
			value
		]
		all}
	printf \{qs(0xfc18ff32)}
	printstruct <...>
	if (<value> = guitar)
		setplayerinfo <player> part = vocals
		setplayerinfo <player> vocal_track = 1
		return
	elseif (<value> = backup_vocals)
		setplayerinfo <player> part = vocals
		setplayerinfo <player> vocal_track = 0
		return
	endif
	getarraysize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_size> -1)
	endif
	setplayerinfo <player> part = ($part_list [<i>])
endscript

script debug_menu_song_part_type_option_right 
	requireparams \{[
			index
			player
			value
		]
		all}
	if (<value> = vocals)
		setplayerinfo <player> part = vocals
		setplayerinfo <player> vocal_track = 1
		return
	elseif (<value> = backup_vocals)
		setplayerinfo <player> part = guitar
		setplayerinfo <player> vocal_track = 0
		return
	endif
	getarraysize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	setplayerinfo <player> part = ($part_list [<i>])
endscript

script debug_menu_build_song_difficulty_menu_items 
	array = []
	getnumplayersingame
	getfirstplayer
	begin
	addarrayelement array = <array> element = {player = <player>}
	getnextplayer player = <player>
	repeat <num_players>
	return item_params = <array>
endscript

script debug_menu_song_difficulty_menu_name_builder 
	requireparams \{[
			index
			player
		]
		all}
	getplayerinfo <player> part
	get_part_text_nl part = <part>
	formattext textname = name qs(0x1f989f42) i = <player> p = <part_text> addtostringlookup = true
	return name = <name>
endscript

script debug_menu_song_difficulty_menu_value_builder 
	requireparams \{[
			index
			player
		]
		all}
	getplayerinfo <player> difficulty
	return value = <difficulty>
endscript

script debug_menu_song_difficulty_menu_text_builder 
	requireparams \{[
			index
			player
			value
		]
		all}
	getplayerinfo <player> double_kick_drum
	if (<double_kick_drum> = 1)
		difficulty_text_nl = qs(0x09d21b93)
	else
		get_difficulty_text_nl difficulty = <value>
	endif
	return text = <difficulty_text_nl>
endscript

script debug_menu_song_difficulty_type_option_left 
	requireparams \{[
			index
			player
			value
		]
		all}
	getarraysize ($difficulty_list)
	i = 0
	begin
	<difficulty> = ($difficulty_list [<i>])
	if (<value> = <difficulty>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getplayerinfo <player> part
	if (<part> = drum)
		getplayerinfo <player> double_kick_drum
		if (<double_kick_drum> = 1)
			setplayerinfo <player> double_kick_drum = 0
		else
			<i> = (<i> -1)
		endif
	else
		<i> = (<i> -1)
	endif
	if (<i> < 0)
		getplayerinfo <player> part
		if (<part> = drum)
			setplayerinfo <player> double_kick_drum = 1
		endif
		<i> = (<array_size> -1)
	endif
	setplayerinfo <player> difficulty = ($difficulty_list [<i>])
endscript

script debug_menu_song_difficulty_type_option_right 
	requireparams \{[
			index
			player
			value
		]
		all}
	getarraysize ($difficulty_list)
	i = 0
	begin
	<difficulty> = ($difficulty_list [<i>])
	if (<value> = <difficulty>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getplayerinfo <player> part
	if (<part> = drum)
		getplayerinfo <player> double_kick_drum
		if (<double_kick_drum> = 0 && <difficulty> = expert)
			setplayerinfo <player> double_kick_drum = 1
		else
			<i> = (<i> + 1)
		endif
	else
		<i> = (<i> + 1)
	endif
	if (<i> = <array_size>)
		getplayerinfo <player> part
		if (<part> = drum)
			setplayerinfo <player> double_kick_drum = 0
		endif
		<i> = 0
	endif
	setplayerinfo <player> difficulty = ($difficulty_list [<i>])
endscript

script debug_menu_build_bot_setup_menu_items 
	array = []
	getnumplayersingame
	getfirstplayer
	begin
	addarrayelement array = <array> element = {player = <player>}
	getnextplayer player = <player>
	repeat <num_players>
	return item_params = <array>
endscript

script debug_menu_bot_setup_menu_name_builder 
	requireparams \{[
			index
			player
		]
		all}
	getplayerinfo <player> part
	get_part_text_nl part = <part>
	getplayerinfo <player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	if (<part> = drum)
		getplayerinfo <player> double_kick_drum
		if (<double_kick_drum> = 1)
			difficulty_text_nl = qs(0x09d21b93)
		endif
	endif
	formattext textname = name qs(0xad69fc0a) i = <player> p = <part_text> d = <difficulty_text_nl> addtostringlookup = true
	return name = <name>
endscript

script debug_menu_bot_setup_check 
	requireparams \{[
			index
			player
		]
		all}
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_autotest_conditional 
	if globalexists \{name = autotest_max_suites}
		return \{true}
	else
		return \{false}
	endif
endscript

script debug_menu_build_test_suite_select_menu 
	array = []
	if globalexists \{name = autotest_max_suites}
		index = 0
		begin
		found_suite = 0
		formattext checksumname = suite_struct 'autotest_suite%x' x = <index>
		if globalexists name = <suite_struct> type = structure
			<found_suite> = 1
		endif
		if (<found_suite> = 1)
			autotest_get_suite suite_num = <index>
			addarrayelement array = <array> element = {suite_num = <index> suite_struct = <suite_struct>}
		endif
		<index> = (<index> + 1)
		repeat $autotest_max_suites
	endif
	return item_params = <array>
endscript

script debug_menu_test_suite_select_menu_name_builder 
	requireparams \{[
			index
			suite_num
			suite_struct
		]
		all}
	return name = (<suite_struct>.name)
endscript

script debug_menu_test_suite_select_menu_choose_script_builder 
	requireparams \{[
			index
			suite_num
			suite_struct
		]
		all}
	return pad_choose_script = autotest_push_test_suite pad_choose_params = {suite_num = <suite_num>}
endscript

script debug_menu_test_suite_select_menu_square_script_builder 
	requireparams \{[
			index
			suite_num
			suite_struct
		]
		all}
	return \{pad_square_script = autotest_pop_test_suite}
endscript

script debug_menu_build_friend_feed_select_menu 
	array = []
	if netfeed \{func = gettitleid
			out = titleid}
		if friend_feed_get_product_msgs {
				titleid = <titleid>
				out_param = msg_array
			}
			getarraysize <msg_array>
			i = 0
			begin
			addarrayelement array = <array> element = {msg_struct = (<msg_array> [<i>])}
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return item_params = <array>
endscript

script debug_menu_friend_feed_select_menu_name_builder 
	requireparams \{[
			index
			msg_struct
		]
		all}
	formattext textname = dummy_name qs(0x35b12509) a = (<msg_struct>.name) dontassertforchecksums
	return name = <dummy_name>
endscript

script debug_menu_friend_feed_select_menu_choose_script_builder 
	requireparams \{[
			index
			msg_struct
		]
		all}
	return {
		pad_choose_script = debug_menu_friend_feed_send_msg_choose_script
		pad_choose_params = {msg_struct = <msg_struct>}
	}
endscript

script debug_menu_friend_feed_send_msg_choose_script 
	printf \{qs(0xfe0f5aea)}
	friend_feed_send_dummy_messages {
		player = 1
		controller_index = ($primary_controller)
		dest = ($g_friend_feed_test_destination_array [($g_friend_feed_test_destination_index)].value)
		count = ($g_friend_feed_test_msg_count)
		param_test = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)])
		event = (<msg_struct>.name)
		msg_type = `default`
	}
endscript

script debug_menu_friend_feed_select_menu_square_script_builder 
	requireparams \{[
			index
			msg_struct
		]
		all}
	return \{true}
endscript

script debug_menu_friend_feed_select_menu_params_builder 
	printf \{qs(0x74bd0f40)}
	requireparams \{[
			index
			msg_struct
		]
		all}
	menu_params = {msg_struct = <msg_struct>}
	printstruct <...>
	return menu_params = <menu_params>
endscript

script debug_menu_friend_feed_nullscript 
endscript
g_friend_feed_test_msg_count = 1
g_friend_feed_text_msg_count_max = 20

script debug_menu_friend_feed_count_get_value 
	return \{value = $g_friend_feed_test_msg_count}
endscript

script debug_menu_friend_feed_count_text_script 
	formattext textname = text qs(0x35b12509) a = ($g_friend_feed_test_msg_count)
	return text = <text>
endscript

script debug_menu_friend_feed_count_right 
	switch <value>
		case $g_friend_feed_text_msg_count_max
		change \{g_friend_feed_test_msg_count = 1}
		default
		change g_friend_feed_test_msg_count = ($g_friend_feed_test_msg_count + 1)
	endswitch
endscript

script debug_menu_friend_feed_count_left 
	switch <value>
		case 1
		change g_friend_feed_test_msg_count = ($g_friend_feed_text_msg_count_max)
		default
		change g_friend_feed_test_msg_count = ($g_friend_feed_test_msg_count - 1)
	endswitch
endscript
g_friend_feed_test_value_type_index = 2
g_friend_feed_test_value_type_array = [
	min
	max
	rand
]

script debug_menu_friend_feed_value_type_get_value 
	return \{value = $g_friend_feed_test_value_type_index}
endscript

script debug_menu_friend_feed_value_type_text_script 
	formattext textname = text qs(0x0bc409e2) a = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)]) dontassertforchecksums
	return text = <text>
endscript

script debug_menu_friend_feed_value_type_right 
	switch <value>
		case 2
		change \{g_friend_feed_test_value_type_index = 0}
		default
		change g_friend_feed_test_value_type_index = ($g_friend_feed_test_value_type_index + 1)
	endswitch
endscript

script debug_menu_friend_feed_value_type_left 
	switch <value>
		case 0
		change \{g_friend_feed_test_value_type_index = 2}
		default
		change g_friend_feed_test_value_type_index = ($g_friend_feed_test_value_type_index - 1)
	endswitch
endscript

script debug_menu_friend_feed_autotest_back_script 
	printf \{qs(0x59626651)}
	killspawnedscript \{name = debug_menu_friend_feed_autotest_spawned}
	generic_event_back
endscript

script debug_menu_friend_feed_autotest_start_script 
	spawnscriptnow \{debug_menu_friend_feed_autotest_spawned}
endscript
g_friend_feed_autotest_wait_time_seconds = 10

script debug_menu_friend_feed_autotest_spawned 
	if netfeed \{func = gettitleid
			out = titleid}
		if friend_feed_get_product_msgs {
				titleid = <titleid>
				out_param = msg_array
			}
			getarraysize <msg_array>
			i = 0
			if (<array_size> > 0)
				begin
				friend_feed_send_dummy_messages {
					player = 1
					controller_index = ($primary_controller)
					dest = myfriends
					count = ($g_friend_feed_test_msg_count)
					param_test = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)])
					event = (<msg_array> [<i>].name)
					msg_type = `default`
				}
				wait ($g_friend_feed_test_autotest_time_array [($g_friend_feed_test_autotest_time_index)].value) seconds
				<i> = (<i> + 1)
				if (<i> >= <array_size>)
					i = 0
				endif
				repeat
			endif
		endif
	endif
endscript
g_friend_feed_test_autotest_time_index = 0
g_friend_feed_test_autotest_time_array = [
	{
		text = qs(0x9ce19fe6)
		value = 10
	}
	{
		text = qs(0x562fe96a)
		value = 30
	}
	{
		text = qs(0x7806dc8e)
		value = 60
	}
	{
		text = qs(0x25dfae0f)
		value = 300
	}
	{
		text = qs(0xd24c3aa7)
		value = 900
	}
	{
		text = qs(0xfc782dcc)
		value = 1800
	}
	{
		text = qs(0xffbf0d70)
		value = 3600
	}
]

script debug_menu_friend_feed_autotest_time_get_value 
	return \{value = $g_friend_feed_test_autotest_time_index}
endscript

script debug_menu_friend_feed_autotest_time_text_script 
	return text = ($g_friend_feed_test_autotest_time_array [($g_friend_feed_test_autotest_time_index)].text)
endscript

script debug_menu_friend_feed_autotest_time_right 
	getarraysize ($g_friend_feed_test_autotest_time_array)
	if (<value> >= (<array_size> - 1))
		change \{g_friend_feed_test_autotest_time_index = 0}
	else
		change g_friend_feed_test_autotest_time_index = ($g_friend_feed_test_autotest_time_index + 1)
	endif
endscript

script debug_menu_friend_feed_autotest_time_left 
	getarraysize ($g_friend_feed_test_autotest_time_array)
	if (<value> <= 0)
		change g_friend_feed_test_autotest_time_index = (<array_size> - 1)
	else
		change g_friend_feed_test_autotest_time_index = ($g_friend_feed_test_autotest_time_index -1)
	endif
endscript
g_friend_feed_test_destination_index = 0
g_friend_feed_test_destination_array = [
	{
		text = qs(0xdcd408cb)
		value = myfriends
	}
	{
		text = qs(0x180baddc)
		value = myself
	}
	{
		text = qs(0x5c41ba21)
		value = nobody
	}
]

script debug_menu_friend_feed_destination_get_value 
	return \{value = $g_friend_feed_test_destination_index}
endscript

script debug_menu_friend_feed_destination_text_script 
	return text = ($g_friend_feed_test_destination_array [($g_friend_feed_test_destination_index)].text)
endscript

script debug_menu_friend_feed_destination_right 
	getarraysize ($g_friend_feed_test_destination_array)
	if (<value> >= (<array_size> - 1))
		change \{g_friend_feed_test_destination_index = 0}
	else
		change g_friend_feed_test_destination_index = ($g_friend_feed_test_destination_index + 1)
	endif
endscript

script debug_menu_friend_feed_destination_left 
	getarraysize ($g_friend_feed_test_destination_array)
	if (<value> <= 0)
		change g_friend_feed_test_destination_index = (<array_size> - 1)
	else
		change g_friend_feed_test_destination_index = ($g_friend_feed_test_destination_index -1)
	endif
endscript

script debug_menu_friend_feed_test_strings_to_tty 
	friend_feed_test_all_messages param_test = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)])
endscript

script debug_menu_is_micstand_visible 
	formattext checksumname = cas_musician_name 'musician%n' n = ($cas_current_player)
	if compositeobjectexists name = <cas_musician_name>
		if <cas_musician_name> :atomicishidden cas_mic_stand
			return \{false}
		endif
	endif
	<i> = 1
	begin
	formattext checksumname = musician_name 'musician%n' n = <i>
	formattext checksumname = musician_info 'musician%n_info' n = <i>
	if compositeobjectexists name = <musician_name>
		if ($<musician_info>.part = vocals)
			if <cas_musician_name> :atomicishidden cas_mic_stand
				return \{false}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	return \{true}
endscript

script debug_menu_turn_micstand_on 
	change \{debug_micstand_visible = 1}
	formattext checksumname = cas_musician_name 'musician%n' n = ($cas_current_player)
	if compositeobjectexists name = <cas_musician_name>
		<cas_musician_name> :show_mic_stand
	endif
	<i> = 1
	begin
	formattext checksumname = musician_name 'musician%n' n = <i>
	formattext checksumname = musician_info 'musician%n_info' n = <i>
	if compositeobjectexists name = <musician_name>
		if ($<musician_info>.part = vocals)
			<musician_name> :show_mic_stand
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script debug_menu_turn_micstand_off 
	change \{debug_micstand_visible = 0}
	formattext checksumname = cas_musician_name 'musician%n' n = ($cas_current_player)
	if compositeobjectexists name = <cas_musician_name>
		<cas_musician_name> :hide_mic_stand
	endif
	<i> = 1
	begin
	formattext checksumname = musician_name 'musician%n' n = <i>
	formattext checksumname = musician_info 'musician%n_info' n = <i>
	if compositeobjectexists name = <musician_name>
		if ($<musician_info>.part = vocals)
			<musician_name> :hide_mic_stand
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script debug_menu_virtual_controller_choose 
	change g_virtual_controller = <virtual_controller>
	change g_virtual_controller_enabled = ((($g_virtual_controller_data) [<virtual_controller>]).enabled)
	change g_virtual_controller_type = ((($g_virtual_controller_data) [<virtual_controller>]).type)
	change g_virtual_controller_source_device = ((($g_virtual_controller_data) [<virtual_controller>]).source_device)
endscript

script debug_menu_virtual_controller_type_get_value 
	return \{value = $g_virtual_controller_type}
endscript

script debug_menu_virtual_controller_type_text_script 
	switch <value>
		case guitar
		text = qs(0x826ca62c)
		case drum
		text = qs(0x5e52ecaa)
		case controller
		text = qs(0xf1d564e1)
		default
		text = qs(0x3f1bbbb1)
	endswitch
	return text = <text>
endscript

script debug_menu_virtual_controller_type_right 
	switch <value>
		case guitar
		change \{g_virtual_controller_type = drum}
		case drum
		change \{g_virtual_controller_type = controller}
		case controller
		change \{g_virtual_controller_type = guitar}
		default
		change \{g_virtual_controller_type = controller}
	endswitch
endscript

script debug_menu_virtual_controller_type_left 
	switch <value>
		case guitar
		change \{g_virtual_controller_type = controller}
		case drum
		change \{g_virtual_controller_type = guitar}
		case controller
		change \{g_virtual_controller_type = drum}
		default
		change \{g_virtual_controller_type = controller}
	endswitch
endscript

script debug_menu_virtual_controller_source_get_value 
	return \{value = $g_virtual_controller_source_device}
endscript

script debug_menu_virtual_controller_source_text_script 
	switch <value>
		case 0
		text = qs(0x787beab2)
		case 1
		text = qs(0x5356b971)
		case 2
		text = qs(0x4a4d8830)
		case 3
		text = qs(0x050c1ef7)
		default
		text = qs(0x3f1bbbb1)
	endswitch
	return text = <text>
endscript

script debug_menu_virtual_controller_source_right 
	getactivecontrollers
	virtual_controller = ($g_virtual_controller)
	next = (<value> + 1)
	begin
	if (<next> >= 4)
		next = -1
		break
	else
		if (((<active_controllers> [<next>]) = 1) && (<virtual_controller> != <next>))
			break
		endif
	endif
	next = (<next> + 1)
	repeat
	change g_virtual_controller_source_device = <next>
endscript

script debug_menu_virtual_controller_source_left 
	getactivecontrollers
	virtual_controller = ($g_virtual_controller)
	next = (<value> - 1)
	begin
	if (<next> < -1)
		<next> = 3
	endif
	if (<next> = -1)
		break
	else
		if (((<active_controllers> [<next>]) = 1) && (<virtual_controller> != <next>))
			break
		endif
	endif
	next = (<next> - 1)
	repeat
	change g_virtual_controller_source_device = <next>
endscript

script debug_menu_virtual_controller_accept_settings 
	error = 0
	error_msg = qs(0x00000000)
	getactivecontrollers
	if ($g_virtual_controller < 0 || $g_virtual_controller > 4)
		error = 1
		printf qs(0x36c0a5cd) d = ($g_virtual_controller)
	endif
	if (<active_controllers> [($g_virtual_controller)] = 1 && ($g_virtual_controller_enabled) = 1)
		error = 2
		printf qs(0xec79463d) d = ($g_virtual_controller)
	endif
	if ($debug_from_gameplay = 1)
		error = 3
		printf \{qs(0xe0b5b2f0)}
	endif
	if (<error> > 0)
		return
	endif
	if (($g_virtual_controller_enabled) = 1)
		controller_override_enabled = 0
		if (($g_virtual_controller_enabled) = 1)
			if ($g_virtual_controller_source_device >= 0 && $g_virtual_controller_source_device <= 4)
				controller_override_enabled = 1
			endif
		endif
		enablevirtualcontroller {
			virtual_controller = ($g_virtual_controller)
			type = ($g_virtual_controller_type)
			controller_override = <controller_override_enabled>
			source_device = ($g_virtual_controller_source_device)
		}
	else
		disablevirtualcontroller {
			virtual_controller = ($g_virtual_controller)
			source_device = ((($g_virtual_controller_data) [($g_virtual_controller)]).source_device)
		}
	endif
	generic_event_back
endscript

script debug_launch_cameracut \{camera = 'cameras'
		index = 0
		use_default = 0}
	getpakmancurrentname \{map = zones}
	formattext checksumname = camera_array '%s_%p' s = <pakname> p = <camera>
	if NOT globalexists name = <camera_array>
		pakname = 'default'
	elseif (<use_default> = 1)
		pakname = 'default'
	endif
	debug_select_cameracut {
		camera_array_pakname = <pakname>
		camera_array = <camera>
		index = <index>
	}
endscript

script debug_autolaunch_cameracut 
	begin
	if ($playing_song = 1 && $start_gem_scroller_running = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	debug_launch_cameracut camera = <camera> index = <index> use_default = <use_default>
endscript

script debug_cycle_cameracut \{direction = !q1768515945}
	if ($debug_cameracut_mode_on = 0)
		debug_cycle_cameracut_on
		change \{debug_cameracut_mode_on = 1}
	endif
	<count_to_add> = 1
	if (<direction> != next)
		<count_to_add> = -1
	endif
	change debug_cameracut_iterator = (($debug_cameracut_iterator) + <count_to_add>)
	getpakmancurrentname \{map = zones}
	begin
	getarraysize ($cameracutprefixarray)
	if (<direction> = next)
		if (($debug_cameracut_group_iterator) >= <array_size>)
			change \{debug_cameracut_group_iterator = 0}
			change \{debug_cameracut_iterator = 0}
		endif
	else
		if (($debug_cameracut_group_iterator) < 0)
			change debug_cameracut_group_iterator = (<array_size> - 1)
			change \{debug_cameracut_iterator = 0}
		endif
	endif
	get_camera_special_suffix
	formattext checksumname = camera_array_1 '%s_%p%b' s = <pakname> p = ($cameracutprefixarray [($debug_cameracut_group_iterator)]) b = <special_suffix>
	formattext checksumname = camera_array_2 'default_%p' p = ($cameracutprefixarray [($debug_cameracut_group_iterator)])
	<found_cam_global> = 0
	if globalexists name = <camera_array_1>
		<camera_array> = <camera_array_1>
		<found_cam_global> = 1
	elseif globalexists name = <camera_array_2>
		<camera_array> = <camera_array_2>
		<found_cam_global> = 1
	endif
	if (<found_cam_global> = 1)
		getarraysize ($<camera_array>)
		if (<direction> = next)
			if (($debug_cameracut_iterator) >= <array_size>)
				change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) + 1)
				change \{debug_cameracut_iterator = 0}
			else
				if (($debug_cameracut_iterator) >= <array_size>)
					change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) + 1)
					change \{debug_cameracut_iterator = 0}
				else
					break
				endif
			endif
		else
			if (($debug_cameracut_iterator) < 0)
				change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) - 1)
				change debug_cameracut_iterator = (<array_size> - 1)
			else
				if (($debug_cameracut_iterator) >= <array_size>)
					change debug_cameracut_iterator = (<array_size> - 1)
				else
					break
				endif
			endif
		endif
	else
		change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) + <count_to_add>)
	endif
	repeat
	debug_select_cameracut {
		camera_array_pakname = <pakname>
		camera_array = ($cameracutprefixarray [($debug_cameracut_group_iterator)])
		index = ($debug_cameracut_iterator)
	}
	if structurecontains structure = ($<camera_array> [($debug_cameracut_iterator)]) name
		formattext textname = name qs(0x73307931) s = ($<camera_array> [($debug_cameracut_iterator)].name) dontassertforchecksums
	elseif structurecontains structure = ($<camera_array> [($debug_cameracut_iterator)]) params
		if structurecontains structure = ($<camera_array> [($debug_cameracut_iterator)].params) name
			formattext textname = name qs(0x73307931) s = ($<camera_array> [($debug_cameracut_iterator)].params.name) dontassertforchecksums
		endif
	endif
	if gotparam \{name}
		spawnscriptnow lightshow_debug_dislay_name params = {debug_text = <name>}
	endif
endscript

script debug_cycle_cameracut_on 
	if NOT userviewerinfe
		gh_pause_ui
	else
		switch_to_obj_speed
		set_viewer_speed
	endif
	unpausespawnedscript \{update_crowd_model_cam}
	if viewportexists \{id = bg_viewport}
		disable_bg_viewport
	endif
	enable_crowd_models_cfunc \{active = true}
	hide_hud
endscript

script debug_cycle_cameracut_off 
	show_hud
	if viewportexists \{id = bg_viewport}
		enable_bg_viewport
	endif
	gh_unpause_ui
	if userviewerinfe
		disable_pause
	else
		enable_pause
	endif
	change \{debug_cameracut_mode_on = 0}
endscript

script debug_menu_build_song_changelist_menu 
	array = []
	addarrayelement array = <array> element = {text = qs(0x6b99acd4)}
	return item_params = <array>
endscript

script debug_menu_song_changelist_menu_name_builder \{changelist_string = qs(0x58ec0776)}
	if globalexists \{name = g_song_changelist}
		formattext textname = changelist_string qs(0xda71077f) c = ($g_song_changelist)
	endif
	return name = <changelist_string>
endscript

script debug_menu_song_changelist_menu_choose_script_builder 
	return \{choose_script = null_script}
endscript

script debug_menu_strict_small_pools_get_value 
	if getstrictsmallpools
		return \{value = 1}
	else
		return \{value = 0}
	endif
endscript

script debug_menu_strict_small_pools_get_text 
	if getstrictsmallpools
		return \{text = qs(0x78f5ad74)}
	else
		return \{text = qs(0x1527ff9c)}
	endif
endscript

script debug_menu_strict_small_pools_option_toggle 
	if getstrictsmallpools
		setstrictsmallpools \{enable = 0}
	else
		setstrictsmallpools \{enable = 1}
	endif
endscript

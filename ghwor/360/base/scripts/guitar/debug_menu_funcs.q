
script debug_menu_back_to_retail_menu 
	if ($debug_from_gameplay = 1)
		ui_sfx \{menustate = Generic
			uitype = back}
		generic_event_back \{state = Uistate_pausemenu}
	else
		ui_sfx \{menustate = Generic
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
	Change \{game_mode = quickplay}
	botplayoff \{Player = 1}
	botplayoff \{Player = 2}
	botplayoff \{Player = 3}
	botplayoff \{Player = 4}
	setplayerinfo \{Player = 1
		part = vocals}
	setplayerinfo \{Player = 2
		part = vocals}
	setplayerinfo \{Player = 3
		part = vocals}
	setplayerinfo \{Player = 4
		part = vocals}
	debug_menu_select_start_song
endscript

script debug_menu_unlockall 
	lockglobaltags \{OFF}
	lockglobaltags \{freeplay_check_off}
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	difficulties = [easy medium hard expert]
	GetArraySize <difficulties>
	diff_size = <array_Size>
	getsonglistsize
	if (<array_Size> > 0)
		i = 0
		begin
		getsonglistchecksum index = <i>
		get_song_saved_in_globaltags song = <song_checksum>
		if (<saved_in_globaltags> = 1)
			SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 1}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	GetArraySize ($bonus_songs.tier1.songs)
	if (<array_Size> > 0)
		i = 0
		begin
		SetGlobalTags savegame = <savegame> ($bonus_songs.tier1.songs [<i>]) params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	i = 0
	GetArraySize ($Bonus_videos)
	if (<array_Size> > 0)
		begin
		video_checksum = ($Bonus_videos [<i>].id)
		SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = 1}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	get_LevelZoneArray_size
	if (<array_Size> > 0)
		index = 0
		begin
		get_LevelZoneArray_checksum index = <index>
		globaltag_unlock_venue venue = <level_checksum> savegame = <savegame>
		index = (<index> + 1)
		repeat <array_Size>
	endif
	GetArraySize ($g_bonus_art_galleries)
	index = 0
	begin
	gallery_id = ($g_bonus_art_galleries [<index>].id)
	SetGlobalTags savegame = <savegame> <gallery_id> params = {unlocked = 1} packtype = unlockedtags
	<index> = (<index> + 1)
	repeat <array_Size>
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
	GetArraySize \{$quest_progression_unlocks}
	<unlocks_size> = <array_Size>
	begin
	<inner_index> = 0
	GetArraySize ($quest_progression_unlocks [<unlock_index>])
	<unlock_array_size> = <array_Size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<songs_array> = ($<chapter>.songs)
	GetArraySize <songs_array>
	<song_array_size> = <array_Size>
	<song_index> = 0
	begin
	<song> = (<songs_array> [<song_index>])
	SetGlobalTags savegame = <savegame> <song> params = {unlocked = 1}
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	<inner_index> = (<inner_index> + 1)
	repeat <unlock_array_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
endscript

script debug_menu_add_quickplay_stars \{stars = 100}
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags savegame = <savegame> quickplay_progression_tags
	SetGlobalTags savegame = <savegame> quickplay_progression_tags params = {
		total_stars = (<total_stars> + <stars>)
		total_award_points = (<total_award_points> + <stars>)
	}
	UpdateAtoms savegame = <savegame>
	UpdateAtoms savegame = <savegame> global_atoms = 1
endscript

script debug_menu_show_measures_check 
	if ($debug_show_measures = 1)
		return \{true}
	else
		return \{FALSE}
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
	if ScreenElementExists \{id = debug_measures_text}
		DestroyScreenElement \{id = debug_measures_text}
	endif
	Change \{debug_show_measures = 1}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = debug_measures_text
		font = debug
		text = qs(0xaa4c0def)
		Scale = 1
		Pos = (850.0, 250.0)
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
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 1000
		Hide}
	if ($playing_song = 1)
		debug_measures_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_measures 
	if ScreenElementExists \{id = debug_measures_text}
		DestroyScreenElement \{id = debug_measures_text}
	endif
	Change \{debug_show_measures = 0}
endscript

script debug_menu_toggle_show_song_stars 
	if debug_menu_show_song_stars_check
		debug_menu_turn_off_show_song_stars
	else
		debug_menu_turn_on_show_song_stars
	endif
endscript

script debug_menu_turn_on_show_song_stars 
	if ScreenElementExists \{id = debug_songstars_text}
		DestroyScreenElement \{id = debug_songstars_text}
	endif
	Change \{debug_show_song_stars = 1}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = debug_songstars_text
		font = debug
		text = qs(0xfbf320c8)
		Scale = 1
		Pos = (850.0, 300.0)
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
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 1000
		Hide}
	if ($playing_song = 1)
		debug_songstars_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_song_stars 
	if ScreenElementExists \{id = debug_songstars_text}
		DestroyScreenElement \{id = debug_songstars_text}
	endif
	Change \{debug_show_song_stars = 0}
endscript

script debug_menu_show_song_time_check 
	if ($debug_show_song_time = 1)
		return \{true}
	else
		return \{FALSE}
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
	if ScreenElementExists \{id = debug_songtime_text}
		DestroyScreenElement \{id = debug_songtime_text}
	endif
	Change \{debug_show_song_time = 1}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = debug_songtime_text
		font = debug
		text = qs(0xecafd78a)
		Scale = 1
		Pos = (850.0, 200.0)
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
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100
		Hide}
	if ($playing_song = 1)
		debug_songtime_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_song_time 
	if ScreenElementExists \{id = debug_songtime_text}
		DestroyScreenElement \{id = debug_songtime_text}
	endif
	Change \{debug_show_song_time = 0}
endscript

script debug_menu_show_song_name_check 
	if ($debug_show_song_name = 1)
		return \{true}
	else
		return \{FALSE}
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
	if ScreenElementExists \{id = debug_songname_text}
		DestroyScreenElement \{id = debug_songname_text}
	endif
	Change \{debug_show_song_name = 1}
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = debug_songname_text
		font = debug
		text = qs(0x13e67977)
		Scale = 1
		Pos = (850.0, 150.0)
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
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100
		Hide}
	if ($playing_song = 1)
		debug_songname_text :se_setprops \{unhide}
	endif
endscript

script debug_menu_turn_off_show_song_name 
	if ScreenElementExists \{id = debug_songname_text}
		DestroyScreenElement \{id = debug_songname_text}
	endif
	Change \{debug_show_song_name = 0}
endscript

script debug_menu_turn_on_show_camera_name 
	if ScreenElementExists \{id = debug_camera_name_text}
		DestroyScreenElement \{id = debug_camera_name_text}
	endif
	if ScreenElementExists \{id = debug_camera_name_text2}
		DestroyScreenElement \{id = debug_camera_name_text2}
	endif
	CameraCuts_UpdateDebugCameraName
endscript

script debug_menu_turn_off_show_camera_name 
	if ScreenElementExists \{id = debug_camera_name_text}
		DestroyScreenElement \{id = debug_camera_name_text}
	endif
	if ScreenElementExists \{id = debug_camera_name_text2}
		DestroyScreenElement \{id = debug_camera_name_text2}
	endif
	CameraCuts_UpdateDebugCameraName
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
		if CompositeObjectExists \{musician1}
			band_unhide \{Name = musician1}
		endif
	endif
	if ($debug_band_member2_visible = 1)
		if CompositeObjectExists \{musician2}
			band_unhide \{Name = musician2}
		endif
	endif
	if ($debug_band_member3_visible = 1)
		if CompositeObjectExists \{musician3}
			band_unhide \{Name = musician3}
		endif
	endif
	if ($debug_band_member4_visible = 1)
		if CompositeObjectExists \{musician4}
			band_unhide \{Name = musician4}
		endif
	endif
endscript

script debug_menu_turn_off_band_visibility 
	Hide_Band
endscript

script debug_menu_turn_on_band_member_visibility \{Obj = musician1}
	if ($debug_band_visible = 1)
		if CompositeObjectExists <Obj>
			band_unhide Name = <Obj>
		endif
	endif
endscript

script debug_menu_turn_off_band_member_visibility \{Obj = musician1}
	if CompositeObjectExists <Obj>
		<Obj> :Hide
	endif
endscript

script debug_menu_turn_on_highway_visibility 
	Change \{Cheat_PerformanceMode = 0}
	if ScreenElementExists \{id = gem_containerp1}
		legacydoscreenelementmorph \{id = gem_containerp1
			alpha = 1}
	endif
	if ScreenElementExists \{id = gem_containerp2}
		legacydoscreenelementmorph \{id = gem_containerp2
			alpha = 1}
	endif
	if ScreenElementExists \{id = gem_containerp3}
		legacydoscreenelementmorph \{id = gem_containerp3
			alpha = 1}
	endif
	if ScreenElementExists \{id = gem_containerp4}
		legacydoscreenelementmorph \{id = gem_containerp4
			alpha = 1}
	endif
	if ScreenElementExists \{id = highway_containerp1}
		legacydoscreenelementmorph \{id = highway_containerp1
			alpha = 1}
	endif
	if ScreenElementExists \{id = highway_containerp2}
		legacydoscreenelementmorph \{id = highway_containerp2
			alpha = 1}
	endif
	if ScreenElementExists \{id = highway_containerp3}
		legacydoscreenelementmorph \{id = highway_containerp3
			alpha = 1}
	endif
	if ScreenElementExists \{id = highway_containerp4}
		legacydoscreenelementmorph \{id = highway_containerp4
			alpha = 1}
	endif
	if ScreenElementExists \{id = vocals_highway_p1}
		legacydoscreenelementmorph \{id = vocals_highway_p1
			alpha = 1}
	endif
	if ScreenElementExists \{id = vocals_highway_p2}
		legacydoscreenelementmorph \{id = vocals_highway_p2
			alpha = 1}
	endif
	enable_highway_prepass
	show_hud
endscript

script debug_menu_turn_off_highway_visibility 
	Change \{Cheat_PerformanceMode = 1}
	if ScreenElementExists \{id = gem_containerp1}
		legacydoscreenelementmorph \{id = gem_containerp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = gem_containerp2}
		legacydoscreenelementmorph \{id = gem_containerp2
			alpha = 0}
	endif
	if ScreenElementExists \{id = gem_containerp3}
		legacydoscreenelementmorph \{id = gem_containerp3
			alpha = 0}
	endif
	if ScreenElementExists \{id = gem_containerp4}
		legacydoscreenelementmorph \{id = gem_containerp4
			alpha = 0}
	endif
	if ScreenElementExists \{id = highway_containerp1}
		legacydoscreenelementmorph \{id = highway_containerp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = highway_containerp2}
		legacydoscreenelementmorph \{id = highway_containerp2
			alpha = 0}
	endif
	if ScreenElementExists \{id = highway_containerp3}
		legacydoscreenelementmorph \{id = highway_containerp3
			alpha = 0}
	endif
	if ScreenElementExists \{id = highway_containerp4}
		legacydoscreenelementmorph \{id = highway_containerp4
			alpha = 0}
	endif
	if ScreenElementExists \{id = vocals_highway_p1}
		legacydoscreenelementmorph \{id = vocals_highway_p1
			alpha = 0}
	endif
	if ScreenElementExists \{id = vocals_highway_p2}
		legacydoscreenelementmorph \{id = vocals_highway_p2
			alpha = 0}
	endif
	disable_highway_prepass
	hide_hud
endscript

script debug_menu_visibility_check 
	RequireParams \{[
			Type
		]
		all}
	formatText checksumName = Global 'debug_%s_visible' s = <Type>
	if (($<Global>) = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script debug_menu_set_visibility 
	types = ['crowd' 'stage' 'scene_ped']
	GetArraySize <types>
	i = 0
	begin
	if debug_menu_visibility_check Type = (<types> [<i>])
		debug_menu_turn_on_visibility Type = (<types> [<i>])
	else
		debug_menu_turn_off_visibility Type = (<types> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script debug_menu_turn_on_visibility 
	RequireParams \{[
			Type
		]
		all}
	formatText checksumName = Global 'debug_%s_visible' s = <Type>
	Change GlobalName = <Global> NewValue = 1
	if NOT (<Type> = 'crowd')
		formatText checksumName = type_checksum '%s' s = <Type>
		HideObjectByType Type = <type_checksum> unhide
	else
		hide_crowd_models \{Active = FALSE}
	endif
endscript

script debug_menu_turn_off_visibility 
	RequireParams \{[
			Type
		]
		all}
	formatText checksumName = Global 'debug_%s_visible' s = <Type>
	Change GlobalName = <Global> NewValue = 0
	if NOT (<Type> = 'crowd')
		formatText checksumName = type_checksum '%s' s = <Type>
		HideObjectByType Type = <type_checksum>
	else
		hide_crowd_models \{Active = true}
	endif
endscript

script debug_menu_check_cas_assets 
	if ScriptExists \{check_cas}
		check_cas \{textures
			preset_profiles
			savegames}
	endif
endscript

script debug_menu_dump_heaps 
	finaldumpheaps
endscript

script debug_menu_autosave_check 
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script debug_menu_turn_on_autosave 
	SetGlobalTags \{user_options
		params = {
			autosave = 1
		}}
endscript

script debug_menu_turn_off_autosave 
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
endscript

script debug_menu_save_replay 
	if NOT are_replays_enabled
		return
	endif
	CreateScreenElement \{Type = TextElement
		parent = root_window
		id = info_text
		font = debug
		Pos = (640.0, 32.0)
		just = [
			center
			top
		]
		Scale = 1.0
		rgba = [
			210
			210
			210
			250
		]
		text = qs(0x153fc55f)
		z_priority = 1.0}
	Wait \{2
		gameframes}
	getfirstplayer
	getplayerinfo <Player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	formatText TextName = FileName qs(0x87b34504) s = <song_prefix> d = <difficulty_text_nl>
	WriteDataBuffer Name = replay FileName = <FileName>
	DestroyScreenElement \{id = info_text}
endscript

script debug_menu_play_credits 
	ui_sfx \{menustate = Generic
		uitype = select}
	reset_score \{Player = 1}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{1
		difficulty = hard}
	Change \{end_credits = 1}
	generic_event_choose \{state = uistate_end_credits}
endscript

script debug_menu_quit_credits 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_back \{state = uistate_debug}
	band_unload_anim_paks
endscript

script debug_menu_turn_on_lightshow 
	lightshow_displaydebuginfo
endscript

script debug_menu_turn_off_lightshow 
	DestroyScreenElement \{id = lightshow_debuganchor}
endscript

script debug_menu_color_calibration 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_debug_color_calibration}
endscript

script debug_menu_color_histogram 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_debug_color_histogram}
endscript

script debug_menu_play_rockout 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_rockout}
endscript

script debug_menu_ui_physics_test 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_physics
		data = {
			debug
		}}
endscript

script debug_menu_test_velocity_strum 
	if ScreenElementExists \{id = test_velocity_strum_cont}
		KillSpawnedScript \{Name = debug_menu_test_velocity_strum_update}
		DestroyScreenElement \{id = test_velocity_strum_cont}
	else
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = test_velocity_strum_cont
			Pos = (100.0, 300.0)}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			Pos = (0.0, 0.0)
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
			Scale = 0.5}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_num_text
			Pos = (0.0, 50.0)
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
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			Pos = (0.0, 100.0)
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
			Scale = 0.5}
		CreateScreenElement \{Type = TextElement
			parent = test_velocity_strum_cont
			id = test_velocity_strum_average_text
			Pos = (0.0, 150.0)
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
		SpawnScriptNow \{debug_menu_test_velocity_strum_update}
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
	GuitarGetAnalogueInfo controller = ($primary_controller)
	formatText TextName = velocity_text qs(0x73307931) s = <righttrigger>
	if ControllerMake \{up}
		strum = 1
	endif
	if ControllerMake \{down}
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
				formatText TextName = average_text qs(0x73307931) s = <average>
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
	Wait \{1
		gameframe}
	repeat
endscript

script debug_menu_mic_debugger 
	ui_sfx \{menustate = Generic
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
	StartWildcardSearch \{wildcard = 'buffers\\*.rep'}
	index = 0
	begin
	if NOT GetWildcardFile
		break
	endif
	AddArrayElement array = <array> element = {basename = <basename> FileName = <FileName>}
	<index> = (<index> + 1)
	repeat
	EndWildcardSearch
	return item_params = <array>
endscript

script debug_menu_replay_menu_name_builder 
	RequireParams \{[
			index
			basename
			FileName
		]
		all}
	return Name = <basename>
endscript

script debug_menu_replay_menu_choose_script_builder 
	RequireParams \{[
			index
			basename
			FileName
		]
		all}
	return pad_choose_script = debug_menu_play_replay pad_choose_params = {replay = <FileName> song_name = qs(0xfa9bd01d)}
endscript

script debug_menu_play_replay 
	debug_menu_back_to_retail_menu
	restart_gem_scroller <...>
endscript

script debug_menu_difficulty_analyzer_back 
	KillSpawnedScript \{Name = debug_menu_wait_for_diff_analyzer_spawned}
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script debug_menu_build_difficulty_analyzer_menu 
	array = []
	getsonglistsize
	full_size = <array_Size>
	GetArraySize \{$debug_songlist}
	array_Size = (<full_size> + <array_Size>)
	index = 0
	begin
	getsonglistchecksum index = <index>
	get_song_struct song = <song_checksum>
	get_song_title song = <song_checksum>
	AddArrayElement array = <array> element = {song_checksum = <song_checksum> song_title = <song_title>}
	<index> = (<index> + 1)
	repeat <array_Size>
	return item_params = <array>
endscript

script debug_menu_difficulty_analyzer_menu_name_builder 
	RequireParams \{[
			index
			song_checksum
			song_title
		]
		all}
	return Name = <song_title>
endscript

script debug_menu_difficulty_analyzer_menu_params_builder 
	RequireParams \{[
			index
			song_checksum
			song_title
		]
		all}
	return menu_params = {song_name = <song_checksum>}
endscript

script debug_menu_difficulty_analyzer_menu_focus_script_builder 
	RequireParams \{[
			index
			song_checksum
			song_title
		]
		all}
	return additional_focus_script = debug_menu_wait_for_diff_analyzer additional_focus_params = {song_checksum = <song_checksum>}
endscript

script debug_menu_wait_for_diff_analyzer 
	KillSpawnedScript \{Name = debug_menu_wait_for_diff_analyzer_spawned}
	SpawnScriptNow debug_menu_wait_for_diff_analyzer_spawned params = {<...>}
endscript

script debug_menu_wait_for_diff_analyzer_spawned 
	Wait \{0.5
		Seconds}
	difficulty_analyzer_show instrument = guitar difficulty = all song_name = <song_checksum>
endscript

script debug_menu_build_difficulty_analyzer_instrument_menu 
	RequireParams \{[
			song_name
		]
		all}
	array = []
	GetArraySize \{$instrument_checksums}
	index = 0
	begin
	instrument = ($instrument_text [<index>])
	AddArrayElement array = <array> element = {instrument_text = <instrument> instrument = ($instrument_checksums [<index>]) song_name = <song_name>}
	<index> = (<index> + 1)
	repeat <array_Size>
	printf \{qs(0x452cb686)}
	printstruct <...>
	if (<song_name> = debug_output)
		AddArrayElement array = <array> element = {all instrument_text = qs(0xbdd39334) instrument = all song_name = <song_name>}
	endif
	return item_params = <array>
endscript

script debug_menu_difficulty_analyzer_instrument_menu_name_builder 
	RequireParams \{[
			index
			instrument_text
			instrument
			song_name
		]
		all}
	return Name = <instrument_text>
endscript

script debug_menu_difficulty_analyzer_instrument_menu_params_builder 
	RequireParams \{[
			index
			instrument_text
			instrument
			song_name
		]
		all}
	return menu_params = {instrument = <instrument> song_name = <song_name>}
endscript

script debug_menu_build_difficulty_analyzer_difficulty_menu 
	RequireParams \{[
			song_name
		]
		all}
	array = []
	GetArraySize \{$difficulty_list}
	index = 0
	begin
	difficulty = ($difficulty_list [<index>])
	get_difficulty_text difficulty = <difficulty>
	AddArrayElement array = <array> element = {difficulty_text = <difficulty_text> difficulty = <difficulty> instrument = <instrument> song_name = <song_name>}
	<index> = (<index> + 1)
	repeat <array_Size>
	if (<song_name> = debug_output)
		AddArrayElement array = <array> element = {all = 1 difficulty_text = qs(0xbdd39334) difficulty = all instrument = <instrument> song_name = <song_name>}
	endif
	return item_params = <array>
endscript

script debug_menu_difficulty_analyzer_difficulty_menu_name_builder 
	RequireParams \{[
			index
			difficulty_text
			difficulty
			instrument
			song_name
		]
		all}
	return Name = <difficulty_text>
endscript

script debug_menu_difficulty_analyzer_difficulty_menu_choose_script_builder 
	RequireParams \{[
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
	RequireParams \{[
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
	RequireParams \{[
			mode
		]
		all}
	ExtendCrc <mode> '_props' out = props
	if (($<props>.Type = tutorial) || ($<props>.Type = competitive) || ($<props>.Type = pro_faceoff))
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script debug_menu_play_song_get_value 
	GetArraySize \{$gamemode_list}
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
	repeat <array_Size>
	return \{value = 0}
endscript

script debug_menu_play_song_get_text 
	RequireParams \{[
			value
		]
		all}
	mode = (($gamemode_list) [<value>])
	ExtendCrc <mode> '_props' out = props
	return text = ($<props>.debug_name)
endscript

script debug_menu_play_song_option_left 
	RequireParams \{[
			value
		]
		all}
	GetArraySize \{$gamemode_list}
	num_gamemodes = <array_Size>
	new_value = (<value> -1)
	begin
	if (<new_value> < 0)
		<new_value> = (<num_gamemodes> - 1)
	endif
	<mode> = (($gamemode_list) [<new_value>])
	if debug_menu_is_valid_playermode mode = <mode>
		Change game_mode = <mode>
		break
	endif
	new_value = (<new_value> -1)
	repeat
endscript

script debug_menu_play_song_option_right 
	RequireParams \{[
			value
		]
		all}
	GetArraySize \{$gamemode_list}
	num_gamemodes = <array_Size>
	new_value = (<value> + 1)
	begin
	if (<new_value> >= <num_gamemodes>)
		<new_value> = 0
	endif
	<mode> = (($gamemode_list) [<new_value>])
	if debug_menu_is_valid_playermode mode = <mode>
		Change game_mode = <mode>
		break
	endif
	new_value = (<new_value> + 1)
	repeat
endscript

script debug_menu_translate_gamemode 
	RequireParams \{[
			num_players
		]
		all}
	getmaxlocalplayers
	Player = 1
	begin
	setplayerinfo <Player> in_game = 0
	<Player> = (<Player> + 1)
	repeat <max_players>
	Player = 1
	begin
	setplayerinfo <Player> in_game = 1
	<Player> = (<Player> + 1)
	repeat <num_players>
endscript

script debug_menu_num_players_choose 
	RequireParams \{[
			num_players
		]
		all}
	setplayerinfo 1 device = <device_num>
	debug_menu_translate_gamemode num_players = <num_players>
	gamemode_gettype
	if (<Type> = career)
		Change \{current_chapter = quest_chapter_axel}
	endif
endscript

script debug_menu_build_musician_menu_items 
	array = []
	index = 0
	begin
	formatText checksumName = global_name 'debug_musician%a' a = (<index> + 1) AddToStringLookup = true
	AddArrayElement array = <array> element = {global_name = <global_name>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_musician_menu_name_builder 
	RequireParams \{[
			index
			global_name
		]
		all}
	formatText TextName = text qs(0xf566904b) i = (<index> + 1)
	return Name = <text>
endscript

script debug_menu_musician_menu_value_builder 
	RequireParams \{[
			index
			global_name
		]
		all}
	return value = ($<global_name>)
endscript

script debug_menu_musician_menu_text_builder 
	RequireParams \{[
			index
			global_name
			value
		]
		all}
	get_part_text_nl part = <value>
	return text = <part_text>
endscript

script debug_menu_musician_type_option_left 
	RequireParams \{[
			index
			global_name
			value
		]
		all}
	GetArraySize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	Change GlobalName = <global_name> NewValue = ($part_list [<i>])
endscript

script debug_menu_musician_type_option_right 
	RequireParams \{[
			index
			global_name
			value
		]
		all}
	GetArraySize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	Change GlobalName = <global_name> NewValue = ($part_list [<i>])
endscript

script debug_menu_build_bot_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	AddArrayElement array = <array> element = {Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_bot_menu_name_builder 
	RequireParams \{[
			index
			Player
		]
		all}
	formatText TextName = text qs(0xfddc86bc) i = <Player>
	return Name = <text>
endscript

script debug_menu_bot_check 
	RequireParams \{[
			index
			Player
		]
		all}
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script debug_menu_turn_on_bot 
	RequireParams \{[
			index
			Player
		]
		all}
	kill_debug_elements
	botplayon Player = <Player>
endscript

script debug_menu_turn_off_bot 
	RequireParams \{[
			index
			Player
		]
		all}
	kill_debug_elements
	botplayoff Player = <Player>
endscript

script debug_menu_bot_instructions_check 
	getplayerinfo \{1
		bot_show_debug_widget}
	if (<bot_show_debug_widget> = 1)
		return \{true}
	elseif (<bot_show_debug_widget> = 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script debug_menu_turn_on_bot_instructions 
	togglebotdebugwidget \{action = On}
endscript

script debug_menu_turn_off_bot_instructions 
	togglebotdebugwidget \{action = OFF}
endscript

script debug_menu_build_star_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x967664e3) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_star_menu_name_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	return Name = <Name>
endscript

script debug_menu_star_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	getplayerinfo <Player> star_power_debug_mode
	return value = <star_power_debug_mode>
endscript

script debug_menu_star_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	<new_value> = (<value> -1)
	if (<new_value> < 0)
		<new_value> = 3
	endif
	setplayerinfo <Player> star_power_debug_mode = <new_value>
endscript

script debug_menu_star_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	<new_value> = (<value> + 1)
	if (<new_value> > 3)
		<new_value> = 0
	endif
	setplayerinfo <Player> star_power_debug_mode = <new_value>
endscript

script debug_menu_build_hyperspeed_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x58400222) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_hyperspeed_menu_name_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	return Name = <Name>
endscript

script debug_menu_hyperspeed_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	getplayerinfo <Player> Hyperspeed
	return value = <Hyperspeed>
endscript

script debug_menu_hyperspeed_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	formatText TextName = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_hyperspeed_type_option_left 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	<new_value> = (<value> -0.01)
	if (<new_value> < $hyperspeed_fastest)
		<new_value> = $hyperspeed_fastest
	endif
	setplayerinfo <Player> Hyperspeed = <new_value>
endscript

script debug_menu_hyperspeed_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	<new_value> = (<value> + 0.01)
	if (<new_value> > $hyperspeed_slowest)
		<new_value> = $hyperspeed_slowest
	endif
	setplayerinfo <Player> Hyperspeed = <new_value>
endscript

script debug_menu_scoring_attribute_menu_name_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	return Name = <Name>
endscript

script debug_menu_build_sp_mult_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x23982ecc) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_sp_mult_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_sp_mult_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_sp_mult_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_sp_mult_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_sp_mult_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_sp_mult_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_mult_max_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0xb6d59e6b) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_mult_max_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_mult_max_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_mult_max_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_mult_max_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_mult_max_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_mult_max_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_mult_enhance_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0xf76faa1f) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_mult_enhance_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_mult_enhance_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_mult_enhance_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_mult_enhance_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_mult_enhance_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_mult_enhance_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_sp_gain_mult_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0xb974bd95) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_sp_gain_mult_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_star_power_gain_multiplier_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_sp_gain_mult_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_star_power_gain_multiplier_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_sp_gain_mult_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_star_power_gain_multiplier_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_sp_note_streak_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x3209e0fd) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_sp_note_streak_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_sp_note_streak_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_sp_note_streak_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_sp_note_streak_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_sp_note_streak_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_sp_note_streak_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_crowd_meter_start_bonus_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x28bacf77) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_crowd_meter_start_bonus_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_crowd_meter_start_bonus_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_crowd_meter_start_bonus_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_crowd_meter_start_bonus_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_crowd_meter_start_bonus_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_crowd_meter_start_bonus_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_miss_note_bonus_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x2525e1f7) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_miss_note_bonus_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_miss_note_bonus_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_miss_note_bonus_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_miss_note_bonus_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_miss_note_bonus_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_miss_note_bonus_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_build_resurrection_lives_menu_items 
	array = []
	index = 0
	begin
	Player = (<index> + 1)
	formatText TextName = Name qs(0x23cc7e45) i = <Player>
	AddArrayElement array = <array> element = {Name = <Name> Player = <Player>}
	<index> = (<index> + 1)
	repeat 4
	return item_params = <array>
endscript

script debug_menu_resurrection_lives_menu_value_builder 
	RequireParams \{[
			index
			Name
			Player
		]
		all}
	formatText checksumName = Name 'debug_resurrection_lives_%d' d = <Player>
	return value = ($<Name>)
endscript

script debug_menu_resurrection_lives_menu_text_builder 
	RequireParams \{[
			index
			Name
			Player
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
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	formatText checksumName = Name 'debug_resurrection_lives_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_resurrection_lives_type_option_right 
	RequireParams \{[
			index
			Name
			Player
			value
		]
		all}
	kill_debug_elements
	GetArraySize ($debug_sa_level_list)
	i = 0
	begin
	if (<value> = $debug_sa_level_list [<i>])
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	formatText checksumName = Name 'debug_resurrection_lives_%d' d = <Player>
	Change GlobalName = <Name> NewValue = ($debug_sa_level_list [<i>])
endscript

script debug_menu_input_logic_lag_get_value 
	GetPlatform
	switch <Platform>
		case PS2
		value = ($default_lag_settings.PS2.input_lag_ms)
		case PS3
		value = ($default_lag_settings.PS3.input_lag_ms)
		case windx
		case Xenon
		value = ($default_lag_settings.Xenon.input_lag_ms)
		case wii
		value = ($default_lag_settings.wii.input_lag_ms)
		default
		value = 0
	endswitch
	return value = <value>
endscript

script debug_menu_input_logic_lag_get_text 
	RequireParams \{[
			value
		]
		all}
	formatText TextName = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_input_logic_lag_option_left 
	RequireParams \{[
			value
		]
		all}
	<new_value> = (<value> -1)
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_input_logic_lag_option_right 
	RequireParams \{[
			value
		]
		all}
	<new_value> = (<value> + 1)
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> input_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_gem_logic_lag_get_value 
	GetPlatform
	switch <Platform>
		case PS2
		value = ($default_lag_settings.PS2.gem_lag_ms)
		case PS3
		value = ($default_lag_settings.PS3.gem_lag_ms)
		case windx
		case Xenon
		value = ($default_lag_settings.Xenon.gem_lag_ms)
		case wii
		value = ($default_lag_settings.wii.gem_lag_ms)
		default
		value = 0
	endswitch
	return value = <value>
endscript

script debug_menu_gem_logic_lag_get_text 
	RequireParams \{[
			value
		]
		all}
	formatText TextName = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_gem_logic_lag_option_left 
	RequireParams \{[
			value
		]
		all}
	<new_value> = (<value> -1)
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_gem_logic_lag_option_right 
	RequireParams \{[
			value
		]
		all}
	<new_value> = (<value> + 1)
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> gem_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_audio_logic_lag_get_value 
	GetPlatform
	switch <Platform>
		case PS2
		value = ($default_lag_settings.PS2.audio_lag_ms)
		case PS3
		value = ($default_lag_settings.PS3.audio_lag_ms)
		case windx
		case Xenon
		value = ($default_lag_settings.Xenon.audio_lag_ms)
		case wii
		value = ($default_lag_settings.wii.audio_lag_ms)
		default
		value = 0
	endswitch
	return value = <value>
endscript

script debug_menu_audio_logic_lag_get_text 
	RequireParams \{[
			value
		]
		all}
	formatText TextName = text qs(0xfd68af01) i = <value>
	return text = <text>
endscript

script debug_menu_audio_logic_lag_option_left 
	RequireParams \{[
			value
		]
		all}
	<new_value> = (<value> -1)
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_audio_logic_lag_option_right 
	RequireParams \{[
			value
		]
		all}
	<new_value> = (<value> + 1)
	GetPlatform
	switch <Platform>
		case PS2
		ps2_props = ($default_lag_settings.PS2)
		ps2_props = {<ps2_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS2 = <ps2_props>}
		case PS3
		ps3_props = ($default_lag_settings.PS3)
		ps3_props = {<ps3_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) PS3 = <ps3_props>}
		case windx
		case Xenon
		xenon_props = ($default_lag_settings.Xenon)
		xenon_props = {<xenon_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) Xenon = <xenon_props>}
		case wii
		wii_props = ($default_lag_settings.wii)
		wii_props = {<ps2_props> audio_lag_ms = <new_value>}
		Change default_lag_settings = {($default_lag_settings) wii = <wii_props>}
		default
		printf \{channel = sfx
			qs(0xbb3931d5)}
	endswitch
endscript

script debug_menu_force_score_get_value 
	return \{value = $debug_forcescore}
endscript

script debug_menu_force_score_get_text 
	RequireParams \{[
			value
		]
		all}
	switch <value>
		case OFF
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
	RequireParams \{[
			value
		]
		all}
	GetArraySize ($forcescore_list)
	i = 0
	begin
	<fs> = ($forcescore_list [<i>])
	if (<value> = <fs>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	Change debug_forcescore = ($forcescore_list [<i>])
endscript

script debug_menu_force_score_option_right 
	RequireParams \{[
			value
		]
		all}
	GetArraySize ($forcescore_list)
	i = 0
	begin
	<fs> = ($forcescore_list [<i>])
	if (<value> = <fs>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	Change debug_forcescore = ($forcescore_list [<i>])
endscript

script debug_menu_select_start_song \{force_intro = 0
		force_long_intro = 0
		force_encore = 0
		force_transformation = 0}
	if (<force_intro> = 1)
		Change \{current_transition = forceintro}
	endif
	if (<force_long_intro> = 1)
		Change \{current_transition = forcelongintro}
	endif
	if (<force_encore> = 1)
		Change \{current_transition = ENCORE}
		Change \{debug_encore = 1}
		debug_select_venue
		return
	endif
	if (<force_transformation> = 1)
		<current_chapter> = ($current_chapter)
		if (<current_chapter> = None)
			quest_progression_find_chapter_from_venue venue = ($current_level)
			<current_chapter> = <chapter>
			Change current_chapter = <current_chapter>
		endif
		SetGlobalTags savegame = ($primary_controller) career_progression_tags params = {encore_ready = 1} Progression = true
		Change \{debug_career_transformations = 1}
		playlist_clear
		quest_progression_add_transformation_songs chapter_global = <current_chapter>
	endif
	if GotParam \{song_name}
		playlist_clear
		playlist_setcurrentsong song = <song_name>
	endif
	if GotParam \{starttime}
		Change current_starttime = <starttime>
	endif
	Change \{song_heap_required = 0}
	if ($debug_from_gameplay = 1)
		restart_warning_select_restart \{dont_save_song_data}
	else
		ui_sfx \{menustate = Generic
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
	if NOT StructureContains \{structure = value
			value1}
		ScriptAssert \{'Missing value1 from celeb intro get value!'}
	elseif NOT StructureContains \{structure = value
			value2}
		ScriptAssert \{'Missing value2 from celeb intro get value!'}
	endif
	quest_checksum = ($quest_progression_unlocks [(<value>.value1)] [(<value>.value2)])
	venue_checksum = ($<quest_checksum>.venue)
	intro_name = ($LevelZones.<venue_checksum>.Name)
	formatText TextName = select_string qs(0x0bc409e2) a = <intro_name>
	return text = <select_string>
endscript

script debug_menu_play_celeb_intro_option_left \{value = 0x69696969}
	if NOT StructureContains \{structure = value
			value1}
		ScriptAssert \{'Missing value1 from celeb intro get value!'}
	elseif NOT StructureContains \{structure = value
			value2}
		ScriptAssert \{'Missing value2 from celeb intro get value!'}
	endif
	<new_value1> = (<value>.value1)
	<new_value2> = ((<value>.value2) - 1)
	<found_values> = 0
	if (<new_value2> < 0)
		begin
		<new_value1> = (<new_value1> - 1)
		if (<new_value1> < 0)
			GetArraySize ($quest_progression_unlocks)
			<new_value1> = (<array_Size> - 1)
		endif
		GetArraySize ($quest_progression_unlocks [<new_value1>])
		if (<array_Size> > 0)
			<new_value2> = (<array_Size> - 1)
			<found_values> = 1
			break
		endif
		repeat
	endif
	Change debug_selected_intro_1 = <new_value1>
	Change debug_selected_intro_2 = <new_value2>
endscript

script debug_menu_play_celeb_intro_option_right \{value = 0x69696969}
	if NOT StructureContains \{structure = value
			value1}
		ScriptAssert \{'Missing value1 from celeb intro get value!'}
	elseif NOT StructureContains \{structure = value
			value2}
		ScriptAssert \{'Missing value2 from celeb intro get value!'}
	endif
	<new_value1> = (<value>.value1)
	<new_value2> = ((<value>.value2) + 1)
	<found_values> = 0
	GetArraySize ($quest_progression_unlocks [<new_value1>])
	if (<new_value2> >= <array_Size>)
		begin
		<new_value1> = (<new_value1> + 1)
		GetArraySize ($quest_progression_unlocks)
		if (<new_value1> >= <array_Size>)
			<new_value1> = 0
		endif
		GetArraySize ($quest_progression_unlocks [<new_value1>])
		if (<array_Size> > 0)
			<new_value2> = 0
			break
		endif
		repeat
	endif
	Change debug_selected_intro_1 = <new_value1>
	Change debug_selected_intro_2 = <new_value2>
endscript

script debug_start_song_with_celeb_intro 
	if ($debug_selected_intro = -1)
		printf \{channel = Band
			qs(0x9be9bbab)}
		Change \{game_mode = career}
		debug_menu_select_start_song
		return
	endif
	quest_checksum = ($quest_progression_unlocks [$debug_selected_intro_1] [$debug_selected_intro_2])
	song_name = ($<quest_checksum>.songs [0])
	venue = ($<quest_checksum>.venue)
	printf channel = Band qs(0xbba52acc) a = <song_name> b = <venue>
	printf channel = Band qs(0xbd425a18) a = <Intro>
	Change \{debug_current_transition = celebintro}
	playlist_setcurrentsong song = <song_name>
	Change current_level = <venue>
	Change g_band_lobby_current_level = <venue>
	Change \{current_starttime = 0}
	Change \{debug_play_celeb_intro = 1}
	Change \{game_mode = career}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		part = vocals}
	setplayerinfo 1 controller = <device_num>
	Change \{g_net_leader_player_num = 1}
	threadsafesetglobalinteger global_name = primary_controller new_value = <device_num>
	get_savegame_from_controller controller = <device_num>
	Change current_chapter = <quest_checksum>
	debug_select_venue level = <venue>
endscript

script debug_select_venue \{norestart = 0}
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_crowd_models
	Wait \{10
		gameframes}
	kill_gem_scroller
	if GotParam \{level}
		Change current_level = <level>
	endif
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	ChangeNodeFlag \{LS_3_5_PRE
		1}
	ChangeNodeFlag \{LS_3_5_POST
		0}
	ChangeNodeFlag \{LS_ENCORE_PRE
		1}
	ChangeNodeFlag \{LS_ENCORE_POST
		0}
	playlist_getcurrentsong
	if (<current_song> = NULL)
		if NOT stringequals a = ($song_heap_pakname) b = 'none'
			debug_restore_song_from_pakname pakname = ($song_heap_pakname)
			playlist_setcurrentsong song = <current_song>
		else
			playlist_setcurrentsong song = ($startup_song)
		endif
	endif
	DestroyPakManMap \{map = zones}
	memory_create_zone_maps
	Load_Venue \{block_scripts = 1}
	Wait \{5
		gameframes}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		SpawnScriptNow \{testlevel_debug}
	else
		crowd_reset \{Player = 1}
	endif
	enable_pause
	if NOT ui_event_exists_in_stack \{Name = 'gameplay'}
		dbreak
		<norestart> = 1
	endif
	if (<norestart> = 0)
		gh_start_pressed
		restart_gem_scroller starttime = ($current_starttime) device_num = <device_num>
	else
		ToggleViewMode \{viewerreload}
		ToggleViewMode \{viewerreload}
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
			ui_sfx \{menustate = Generic
				uitype = select}
			generic_event_choose \{data = {
					state = uistate_play_song
					starttime = 0
					uselaststarttime = 0
				}}
		endif
	else
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			ui_sfx \{menustate = Generic
				uitype = select}
			ui_event \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		else
			generic_event_choose \{state = Uistate_gameplay}
		endif
	endif
endscript

script debug_restore_song_from_pakname 
	RequireParams \{[
			pakname
		]
		all}
	stringremove text = <pakname> remove = 'songs/' new_string = a
	stringremove text = <a> remove = '_song.pak' new_string = b
	formatText checksumName = c <b>
	printstruct <...>
	return current_song = <c>
endscript

script testlevel_debug 
	begin
	if ControllerMake \{circle
			0}
		debug_next_peds
	endif
	if ControllerMake \{circle
			1}
		debug_next_peds
	endif
	Wait \{1
		gameframe}
	repeat
endscript
debug_ped_row = 0

script debug_next_peds 
	kill \{prefix = Z_TestLevel_Peds_Row0}
	kill \{prefix = Z_TestLevel_Peds_Row1}
	kill \{prefix = Z_TestLevel_Peds_Row2}
	kill \{prefix = Z_TestLevel_Peds_Row3}
	kill \{prefix = Z_TestLevel_Peds_Row4}
	kill \{prefix = Z_TestLevel_Peds_Row5}
	kill \{prefix = Z_TestLevel_Peds_Row6}
	kill \{prefix = Z_TestLevel_Peds_Row7}
	Wait \{1
		gameframe}
	begin
	Change debug_ped_row = ($debug_ped_row + 1)
	formatText checksumName = row 'Z_TestLevel_Peds_row%r' r = ($debug_ped_row)
	create prefix = <row>
	if IsAlive prefix = <row>
		break
	else
		Change \{debug_ped_row = -1}
	endif
	repeat
endscript

script debug_menu_turn_on_whammy_rewind 
	spawnscript \{quickplay_whammy_rewind}
	pausespawnedscript \{quickplay_whammy_rewind}
endscript

script debug_menu_turn_off_whammy_rewind 
	KillSpawnedScript \{Name = quickplay_whammy_rewind}
endscript

script debug_menu_build_change_venue_menu 
	array = []
	get_LevelZoneArray_size
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	AddArrayElement array = <array> element = {level_checksum = <level_checksum>}
	<index> = (<index> + 1)
	repeat <array_Size>
	return item_params = <array>
endscript

script debug_menu_change_venue_menu_name_builder 
	RequireParams \{[
			index
			level_checksum
		]
		all}
	formatText TextName = level_name qs(0x5af41da1) t = ($LevelZones.<level_checksum>.title) n = ($LevelZones.<level_checksum>.Name)
	return Name = <level_name>
endscript

script debug_menu_change_venue_menu_choose_script_builder 
	RequireParams \{[
			index
			level_checksum
		]
		all}
	return pad_choose_script = debug_select_venue pad_choose_params = {level = <level_checksum> norestart = 0}
endscript

script debug_menu_build_change_musician_menu 
	RequireParams \{[
			part
		]
		all}
	array = []
	get_savegame_from_controller controller = ($primary_controller)
	characterprofilegetlist savegame = <savegame> categories = [cars ghrockers presetcars modifiable locked debug]
	GetArraySize <profile_list>
	index = 0
	begin
	characterprofilegetstruct savegame = <savegame> Name = (<profile_list> [<index>])
	get_fullname_of_character savegame = <savegame> id = (<profile_list> [<index>])
	AddArrayElement array = <array> element = {fullname = <fullname> part = <part> profile_struct = <profile_struct> savegame = <savegame>}
	<index> = (<index> + 1)
	repeat <array_Size>
	return item_params = <array>
endscript

script debug_menu_change_musician_menu_name_builder 
	RequireParams \{[
			index
			fullname
			part
			profile_struct
			savegame
		]
		all}
	return Name = <fullname>
endscript

script debug_menu_change_musician_menu_params_builder 
	RequireParams \{[
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
		return true Player = <i>
	endif
	i = (<i> + 1)
	repeat 4
	return \{FALSE}
endscript

script debug_select_cameracut \{jumptoviewer = 0}
	ui_sfx \{menustate = Generic
		uitype = select}
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <index>
	destroy_cameracuts
	Wait \{3
		gameframes}
	create_cameracuts
	if (<jumptoviewer> = 1)
		debug_menu_back_to_retail_menu
		gh_unpause_ui
		enable_pause
		Change \{viewer_buttons_enabled = 1}
		ToggleViewMode
	endif
endscript

script debug_menu_build_camera_cut_group_menu 
	<array> = []
	GetPakManCurrentName \{map = zones}
	<camera_count> = 0
	GetArraySize \{$CameraCutPrefixArray}
	<camera_cut_prefix_array_size> = <array_Size>
	get_camera_special_suffix
	index = 0
	begin
	formatText checksumName = Camera_Array '%s_%p%b' s = <pakname> p = ($CameraCutPrefixArray [<index>]) b = <special_suffix>
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		if (<array_Size> > 0)
			formatText TextName = group_name qs(0x434efee9) p = ($CameraCutPrefixArray [<index>]) b = <special_suffix>
			AddArrayElement array = <array> element = {camera_count = <index> group_name = <group_name>}
		endif
	else
		formatText checksumName = Camera_Array 'default_%p' p = ($CameraCutPrefixArray [<index>])
		if GlobalExists Name = <Camera_Array>
			GetArraySize $<Camera_Array>
			if (<array_Size> > 0)
				formatText TextName = group_name qs(0x246e6341) p = ($CameraCutPrefixArray [<index>])
				AddArrayElement array = <array> element = {camera_count = <index> group_name = <group_name>}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <camera_cut_prefix_array_size>
	return item_params = <array>
endscript

script debug_menu_camera_cut_group_menu_name_builder 
	RequireParams \{[
			index
			camera_count
			group_name
		]
		all}
	return Name = <group_name>
endscript

script debug_menu_camera_cut_group_menu_params_builder 
	RequireParams \{[
			index
			camera_count
			group_name
		]
		all}
	return menu_params = {camera_count = <camera_count>}
endscript

script debug_menu_build_camera_cut_menu 
	RequireParams \{[
			camera_count
		]
		all}
	array = []
	GetPakManCurrentName \{map = zones}
	get_camera_special_suffix
	formatText checksumName = Camera_Array '%s_%p%b' s = <pakname> p = ($CameraCutPrefixArray [<camera_count>]) b = <special_suffix>
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		index = 0
		begin
		formatText TextName = Camera_Name qs(0x3efec28c) s = <pakname> p = ($CameraCutPrefixArray [<camera_count>]) i = <index>
		if StructureContains structure = ($<Camera_Array> [<index>]) Name
			formatText TextName = Name qs(0x73307931) s = ($<Camera_Array> [<index>].Name) DontAssertForChecksums
		elseif StructureContains structure = ($<Camera_Array> [<index>]) params
			if StructureContains structure = ($<Camera_Array> [<index>].params) Name
				formatText TextName = Name qs(0x73307931) s = ($<Camera_Array> [<index>].params.Name) DontAssertForChecksums
			endif
		endif
		AddArrayElement array = <array> element = {Name = <Name> pakname = <pakname> camera_count = <camera_count>}
		<index> = (<index> + 1)
		repeat <array_Size>
	else
		formatText checksumName = Camera_Array 'default_%p' p = ($CameraCutPrefixArray [<camera_count>])
		if GlobalExists Name = <Camera_Array>
			GetArraySize $<Camera_Array>
			index = 0
			begin
			formatText TextName = Camera_Name qs(0xc62762df) p = ($CameraCutPrefixArray [<camera_count>]) i = <index>
			if StructureContains structure = ($<Camera_Array> [<index>]) Name
				formatText TextName = Name qs(0x73307931) s = ($<Camera_Array> [<index>].Name) DontAssertForChecksums
			elseif StructureContains structure = ($<Camera_Array> [<index>]) params
				if StructureContains structure = ($<Camera_Array> [<index>].params) Name
					formatText TextName = Name qs(0x73307931) s = ($<Camera_Array> [<index>].params.Name) DontAssertForChecksums
				endif
			endif
			AddArrayElement array = <array> element = {Name = <Name> pakname = 'default' camera_count = <camera_count>}
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	return item_params = <array>
endscript

script debug_menu_camera_cut_menu_name_builder 
	RequireParams \{[
			index
			Name
			pakname
			camera_count
		]
		all}
	return Name = <Name>
endscript

script debug_menu_camera_cut_menu_choose_script_builder 
	RequireParams \{[
			index
			Name
			pakname
			camera_count
		]
		all}
	return pad_choose_script = debug_select_cameracut pad_choose_params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) index = <index>}
endscript

script debug_menu_camera_cut_menu_square_script_builder 
	RequireParams \{[
			index
			Name
			pakname
			camera_count
		]
		all}
	return pad_square_script = debug_select_cameracut pad_square_params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) index = <index> jumptoviewer = 1}
endscript

script debug_menu_build_skip_by_time_menu \{looppoint = 0}
	array = []
	menu_func = debug_menu_select_start_song
	if (<looppoint> = 1)
		menu_func = debug_set_looppoint
		AddArrayElement array = <array> element = {Name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	songfilemanager func = get_fretbar_note song_name = <current_song> index = (<num_fretbar_notes> - 1)
	max_time = (<fretbar_time> / 1000)
	time = 0
	begin
	formatText TextName = Name qs(0x3c09de0c) s = <time>
	if (<time> < <max_time>)
		AddArrayElement array = <array> element = {Name = <Name> menu_func = <menu_func> starttime = (<time> * 1000) song_name = <current_song>}
	else
		break
	endif
	<time> = (<time> + 5)
	repeat
	return item_params = <array>
endscript

script debug_menu_skip_by_time_menu_name_builder 
	RequireParams \{[
			index
			Name
			starttime
			menu_func
		]
		all}
	return Name = <Name>
endscript

script debug_menu_skip_by_time_menu_choose_script_builder 
	RequireParams \{[
			index
			Name
			starttime
			menu_func
		]
		all}
	return pad_choose_script = <menu_func> pad_choose_params = {song_name = <song_name> starttime = <starttime>}
endscript

script debug_set_looppoint 
	ui_sfx \{menustate = Generic
		uitype = select}
	Change current_looppoint = <starttime>
	gh_start_pressed
endscript

script debug_menu_build_skip_by_marker_menu \{looppoint = 0}
	array = []
	menu_func = debug_menu_select_start_song
	if (<looppoint> = 1)
		menu_func = debug_set_looppoint
		AddArrayElement array = <array> element = {Name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	GetArraySize <marker_array>
	marker_array_size = <array_Size>
	if (<marker_array_size> = 0)
		AddArrayElement array = <array> element = {Name = qs(0x6a7a8f12) menu_func = <menu_func> starttime = -1000000 song_name = <current_song>}
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
		formatText {
			TextName = Name
			qs(0x015c83f3)
			a = (<marker_array> [<index>].marker)
			s = (<marker_time> / 1000)
			m = <measure_num>
			b = <beat_num>
		}
		AddArrayElement {
			array = <array>
			element = {
				Name = <Name>
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
	RequireParams \{[
			index
			Name
			starttime
			menu_func
		]
		all}
	return Name = <Name>
endscript

script debug_menu_skip_by_marker_menu_choose_script_builder 
	RequireParams \{[
			index
			Name
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
		AddArrayElement array = <array> element = {Name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
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
			formatText TextName = Name qs(0x5fe38f1e) s = (<time> / 1000.0) m = <measure_count>
			AddArrayElement {
				array = <array>
				element = {
					Name = <Name>
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
	RequireParams \{[
			index
			Name
			starttime
			menu_func
		]
		all}
	return Name = <Name>
endscript

script debug_menu_skip_by_measure_menu_choose_script_builder 
	RequireParams \{[
			index
			Name
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
		AddArrayElement array = <array> element = {Name = qs(0x9888eddd) menu_func = <menu_func> starttime = -1000000}
	endif
	playlist_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	GetArraySize <marker_array>
	marker_array_size = <array_Size>
	if (<marker_array_size> = 0)
		AddArrayElement array = <array> element = {Name = qs(0x6a7a8f12) menu_func = <menu_func> starttime = -1000000 song_name = <current_song>}
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
		formatText {
			TextName = Name
			qs(0x015c83f3)
			a = (<marker_array> [<index>].marker)
			s = (<marker_time> / 1000)
			m = <measure_num>
			b = <beat_num>
		}
		AddArrayElement {
			array = <array>
			element = {
				Name = <Name>
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
	RequireParams \{[
			index
			Name
			starttime
			menu_func
		]
		all}
	return Name = <Name>
endscript

script debug_menu_skip_by_vocal_phrase_menu_choose_script_builder 
	RequireParams \{[
			index
			Name
			starttime
			menu_func
		]
		all}
	return pad_choose_script = <menu_func> pad_choose_params = {song_name = <song_name> starttime = <starttime>}
endscript

script debug_menu_build_song_source_menu 
	<array> = []
	GetArraySize ($gh_songlist)
	<gh_songlist_size> = <array_Size>
	if (<gh_songlist_size> > 0)
		<index> = 0
		begin
		if GlobalExists Name = (($gh_songlist [<index>]).list)
			<song_source_global> = (($gh_songlist [<index>]).list)
			GetArraySize ($<song_source_global>)
			if (<array_Size> > 0)
				AddArrayElement {
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
	GetArraySize ($additional_songlist)
	<additional_songlist_size> = <array_Size>
	if (<additional_songlist_size> > 0)
		<index> = 0
		begin
		if GlobalExists Name = (($additional_songlist [<index>]).list)
			<song_source_global> = (($additional_songlist [<index>]).list)
			GetArraySize ($<song_source_global>)
			if (<array_Size> > 0)
				AddArrayElement {
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
	return Name = <song_source_title>
endscript

script debug_menu_play_song_params_builder \{index = !i1768515945
		song_source_global = !q1768515945}
	return menu_params = {song_source_global = <song_source_global>}
endscript

script debug_menu_build_play_song_menu 
	GetArraySize ($<song_source_global>)
	<array> = []
	if (<array_Size> > 0)
		<index> = 0
		begin
		<song_checksum> = ($<song_source_global> [<index>])
		get_song_title song = <song_checksum>
		AddArrayElement {
			array = <array>
			element = {
				song_title = <song_title>
				song_checksum = <song_checksum>
			}
		}
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return item_params = <array>
endscript

script debug_menu_play_song_menu_name_builder 
	RequireParams \{[
			index
			song_title
			song_checksum
		]
		all}
	return Name = <song_title>
endscript

script debug_menu_song_part_menu_params_builder 
	RequireParams \{[
			index
			song_checksum
		]
		all}
	return menu_params = {song_checksum = <song_checksum>}
endscript

script debug_menu_build_song_part_menu_items 
	RequireParams \{[
			song_checksum
		]
		all}
	playlist_clear
	playlist_setcurrentsong song = <song_checksum>
	array = []
	getnumplayersingame
	getfirstplayer
	begin
	AddArrayElement array = <array> element = {Player = <Player>}
	getnextplayer Player = <Player>
	repeat <num_players>
	return item_params = <array>
endscript

script debug_menu_song_part_menu_name_builder 
	RequireParams \{[
			index
			Player
		]
		all}
	formatText TextName = Name qs(0xc75c44b2) i = <Player> AddToStringLookup = true
	return Name = <Name>
endscript

script debug_menu_song_part_menu_value_builder 
	RequireParams \{[
			index
			Player
		]
		all}
	getplayerinfo <Player> part
	printf \{qs(0xc5d6a665)}
	printstruct <...>
	if (<part> = vocals)
		getplayerinfo <Player> vocal_track
		if (<vocal_track> = 1)
			return \{value = backup_vocals}
		endif
	endif
	return value = <part>
endscript

script debug_menu_song_part_menu_text_builder 
	RequireParams \{[
			index
			Player
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
	RequireParams \{[
			index
			Player
			value
		]
		all}
	printf \{qs(0xfc18ff32)}
	printstruct <...>
	if (<value> = guitar)
		setplayerinfo <Player> part = vocals
		setplayerinfo <Player> vocal_track = 1
		return
	elseif (<value> = backup_vocals)
		setplayerinfo <Player> part = vocals
		setplayerinfo <Player> vocal_track = 0
		return
	endif
	GetArraySize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> -1)
	if (<i> < 0)
		<i> = (<array_Size> -1)
	endif
	setplayerinfo <Player> part = ($part_list [<i>])
endscript

script debug_menu_song_part_type_option_right 
	RequireParams \{[
			index
			Player
			value
		]
		all}
	if (<value> = vocals)
		setplayerinfo <Player> part = vocals
		setplayerinfo <Player> vocal_track = 1
		return
	elseif (<value> = backup_vocals)
		setplayerinfo <Player> part = guitar
		setplayerinfo <Player> vocal_track = 0
		return
	endif
	GetArraySize ($part_list)
	i = 0
	begin
	<part> = ($part_list [<i>])
	if (<value> = <part>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = (<i> + 1)
	if (<i> = <array_Size>)
		<i> = 0
	endif
	setplayerinfo <Player> part = ($part_list [<i>])
endscript

script debug_menu_build_song_difficulty_menu_items 
	array = []
	getnumplayersingame
	getfirstplayer
	begin
	AddArrayElement array = <array> element = {Player = <Player>}
	getnextplayer Player = <Player>
	repeat <num_players>
	return item_params = <array>
endscript

script debug_menu_song_difficulty_menu_name_builder 
	RequireParams \{[
			index
			Player
		]
		all}
	getplayerinfo <Player> part
	get_part_text_nl part = <part>
	formatText TextName = Name qs(0x1f989f42) i = <Player> p = <part_text> AddToStringLookup = true
	return Name = <Name>
endscript

script debug_menu_song_difficulty_menu_value_builder 
	RequireParams \{[
			index
			Player
		]
		all}
	getplayerinfo <Player> difficulty
	return value = <difficulty>
endscript

script debug_menu_song_difficulty_menu_text_builder 
	RequireParams \{[
			index
			Player
			value
		]
		all}
	getplayerinfo <Player> double_kick_drum
	if (<double_kick_drum> = 1)
		difficulty_text_nl = qs(0x09d21b93)
	else
		get_difficulty_text_nl difficulty = <value>
	endif
	return text = <difficulty_text_nl>
endscript

script debug_menu_song_difficulty_type_option_left 
	RequireParams \{[
			index
			Player
			value
		]
		all}
	GetArraySize ($difficulty_list)
	i = 0
	begin
	<difficulty> = ($difficulty_list [<i>])
	if (<value> = <difficulty>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	getplayerinfo <Player> part
	if (<part> = drum)
		getplayerinfo <Player> double_kick_drum
		if (<double_kick_drum> = 1)
			setplayerinfo <Player> double_kick_drum = 0
		else
			<i> = (<i> -1)
		endif
	else
		<i> = (<i> -1)
	endif
	if (<i> < 0)
		getplayerinfo <Player> part
		if (<part> = drum)
			setplayerinfo <Player> double_kick_drum = 1
		endif
		<i> = (<array_Size> -1)
	endif
	setplayerinfo <Player> difficulty = ($difficulty_list [<i>])
endscript

script debug_menu_song_difficulty_type_option_right 
	RequireParams \{[
			index
			Player
			value
		]
		all}
	GetArraySize ($difficulty_list)
	i = 0
	begin
	<difficulty> = ($difficulty_list [<i>])
	if (<value> = <difficulty>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	getplayerinfo <Player> part
	if (<part> = drum)
		getplayerinfo <Player> double_kick_drum
		if (<double_kick_drum> = 0 && <difficulty> = expert)
			setplayerinfo <Player> double_kick_drum = 1
		else
			<i> = (<i> + 1)
		endif
	else
		<i> = (<i> + 1)
	endif
	if (<i> = <array_Size>)
		getplayerinfo <Player> part
		if (<part> = drum)
			setplayerinfo <Player> double_kick_drum = 0
		endif
		<i> = 0
	endif
	setplayerinfo <Player> difficulty = ($difficulty_list [<i>])
endscript

script debug_menu_build_bot_setup_menu_items 
	array = []
	getnumplayersingame
	getfirstplayer
	begin
	AddArrayElement array = <array> element = {Player = <Player>}
	getnextplayer Player = <Player>
	repeat <num_players>
	return item_params = <array>
endscript

script debug_menu_bot_setup_menu_name_builder 
	RequireParams \{[
			index
			Player
		]
		all}
	getplayerinfo <Player> part
	get_part_text_nl part = <part>
	getplayerinfo <Player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	if (<part> = drum)
		getplayerinfo <Player> double_kick_drum
		if (<double_kick_drum> = 1)
			difficulty_text_nl = qs(0x09d21b93)
		endif
	endif
	formatText TextName = Name qs(0xad69fc0a) i = <Player> p = <part_text> d = <difficulty_text_nl> AddToStringLookup = true
	return Name = <Name>
endscript

script debug_menu_bot_setup_check 
	RequireParams \{[
			index
			Player
		]
		all}
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script debug_menu_autotest_conditional 
	if GlobalExists \{Name = autotest_max_suites}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script debug_menu_build_test_suite_select_menu 
	array = []
	if GlobalExists \{Name = autotest_max_suites}
		index = 0
		begin
		found_suite = 0
		formatText checksumName = suite_struct 'autotest_suite%x' X = <index>
		if GlobalExists Name = <suite_struct> Type = structure
			<found_suite> = 1
		endif
		if (<found_suite> = 1)
			autotest_get_suite suite_num = <index>
			AddArrayElement array = <array> element = {suite_num = <index> suite_struct = <suite_struct>}
		endif
		<index> = (<index> + 1)
		repeat $autotest_max_suites
	endif
	return item_params = <array>
endscript

script debug_menu_test_suite_select_menu_name_builder 
	RequireParams \{[
			index
			suite_num
			suite_struct
		]
		all}
	return Name = (<suite_struct>.Name)
endscript

script debug_menu_test_suite_select_menu_choose_script_builder 
	RequireParams \{[
			index
			suite_num
			suite_struct
		]
		all}
	return pad_choose_script = autotest_push_test_suite pad_choose_params = {suite_num = <suite_num>}
endscript

script debug_menu_test_suite_select_menu_square_script_builder 
	RequireParams \{[
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
			GetArraySize <msg_array>
			i = 0
			begin
			AddArrayElement array = <array> element = {msg_struct = (<msg_array> [<i>])}
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return item_params = <array>
endscript

script debug_menu_friend_feed_select_menu_name_builder 
	RequireParams \{[
			index
			msg_struct
		]
		all}
	formatText TextName = dummy_name qs(0x35b12509) a = (<msg_struct>.Name) DontAssertForChecksums
	return Name = <dummy_name>
endscript

script debug_menu_friend_feed_select_menu_choose_script_builder 
	RequireParams \{[
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
		Player = 1
		controller_index = ($primary_controller)
		dest = ($g_friend_feed_test_destination_array [($g_friend_feed_test_destination_index)].value)
		count = ($g_friend_feed_test_msg_count)
		param_test = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)])
		event = (<msg_struct>.Name)
		msg_type = Default
	}
endscript

script debug_menu_friend_feed_select_menu_square_script_builder 
	RequireParams \{[
			index
			msg_struct
		]
		all}
	return \{true}
endscript

script debug_menu_friend_feed_select_menu_params_builder 
	printf \{qs(0x74bd0f40)}
	RequireParams \{[
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
	formatText TextName = text qs(0x35b12509) a = ($g_friend_feed_test_msg_count)
	return text = <text>
endscript

script debug_menu_friend_feed_count_right 
	switch <value>
		case $g_friend_feed_text_msg_count_max
		Change \{g_friend_feed_test_msg_count = 1}
		default
		Change g_friend_feed_test_msg_count = ($g_friend_feed_test_msg_count + 1)
	endswitch
endscript

script debug_menu_friend_feed_count_left 
	switch <value>
		case 1
		Change g_friend_feed_test_msg_count = ($g_friend_feed_text_msg_count_max)
		default
		Change g_friend_feed_test_msg_count = ($g_friend_feed_test_msg_count - 1)
	endswitch
endscript
g_friend_feed_test_value_type_index = 2
g_friend_feed_test_value_type_array = [
	min
	Max
	rand
]

script debug_menu_friend_feed_value_type_get_value 
	return \{value = $g_friend_feed_test_value_type_index}
endscript

script debug_menu_friend_feed_value_type_text_script 
	formatText TextName = text qs(0x0bc409e2) a = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)]) DontAssertForChecksums
	return text = <text>
endscript

script debug_menu_friend_feed_value_type_right 
	switch <value>
		case 2
		Change \{g_friend_feed_test_value_type_index = 0}
		default
		Change g_friend_feed_test_value_type_index = ($g_friend_feed_test_value_type_index + 1)
	endswitch
endscript

script debug_menu_friend_feed_value_type_left 
	switch <value>
		case 0
		Change \{g_friend_feed_test_value_type_index = 2}
		default
		Change g_friend_feed_test_value_type_index = ($g_friend_feed_test_value_type_index - 1)
	endswitch
endscript

script debug_menu_friend_feed_autotest_back_script 
	printf \{qs(0x59626651)}
	KillSpawnedScript \{Name = debug_menu_friend_feed_autotest_spawned}
	generic_event_back
endscript

script debug_menu_friend_feed_autotest_start_script 
	SpawnScriptNow \{debug_menu_friend_feed_autotest_spawned}
endscript
g_friend_feed_autotest_wait_time_seconds = 10

script debug_menu_friend_feed_autotest_spawned 
	if netfeed \{func = gettitleid
			out = titleid}
		if friend_feed_get_product_msgs {
				titleid = <titleid>
				out_param = msg_array
			}
			GetArraySize <msg_array>
			i = 0
			if (<array_Size> > 0)
				begin
				friend_feed_send_dummy_messages {
					Player = 1
					controller_index = ($primary_controller)
					dest = myfriends
					count = ($g_friend_feed_test_msg_count)
					param_test = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)])
					event = (<msg_array> [<i>].Name)
					msg_type = Default
				}
				Wait ($g_friend_feed_test_autotest_time_array [($g_friend_feed_test_autotest_time_index)].value) Seconds
				<i> = (<i> + 1)
				if (<i> >= <array_Size>)
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
	GetArraySize ($g_friend_feed_test_autotest_time_array)
	if (<value> >= (<array_Size> - 1))
		Change \{g_friend_feed_test_autotest_time_index = 0}
	else
		Change g_friend_feed_test_autotest_time_index = ($g_friend_feed_test_autotest_time_index + 1)
	endif
endscript

script debug_menu_friend_feed_autotest_time_left 
	GetArraySize ($g_friend_feed_test_autotest_time_array)
	if (<value> <= 0)
		Change g_friend_feed_test_autotest_time_index = (<array_Size> - 1)
	else
		Change g_friend_feed_test_autotest_time_index = ($g_friend_feed_test_autotest_time_index -1)
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
	GetArraySize ($g_friend_feed_test_destination_array)
	if (<value> >= (<array_Size> - 1))
		Change \{g_friend_feed_test_destination_index = 0}
	else
		Change g_friend_feed_test_destination_index = ($g_friend_feed_test_destination_index + 1)
	endif
endscript

script debug_menu_friend_feed_destination_left 
	GetArraySize ($g_friend_feed_test_destination_array)
	if (<value> <= 0)
		Change g_friend_feed_test_destination_index = (<array_Size> - 1)
	else
		Change g_friend_feed_test_destination_index = ($g_friend_feed_test_destination_index -1)
	endif
endscript

script debug_menu_friend_feed_test_strings_to_tty 
	friend_feed_test_all_messages param_test = ($g_friend_feed_test_value_type_array [($g_friend_feed_test_value_type_index)])
endscript

script debug_menu_is_micstand_visible 
	formatText checksumName = cas_musician_name 'musician%n' n = ($cas_current_player)
	if CompositeObjectExists Name = <cas_musician_name>
		if <cas_musician_name> :atomicishidden cas_mic_stand
			return \{FALSE}
		endif
	endif
	<i> = 1
	begin
	formatText checksumName = musician_name 'musician%n' n = <i>
	formatText checksumName = musician_info 'musician%n_info' n = <i>
	if CompositeObjectExists Name = <musician_name>
		if ($<musician_info>.part = vocals)
			if <cas_musician_name> :atomicishidden cas_mic_stand
				return \{FALSE}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	return \{true}
endscript

script debug_menu_turn_micstand_on 
	Change \{debug_micstand_visible = 1}
	formatText checksumName = cas_musician_name 'musician%n' n = ($cas_current_player)
	if CompositeObjectExists Name = <cas_musician_name>
		<cas_musician_name> :show_mic_stand
	endif
	<i> = 1
	begin
	formatText checksumName = musician_name 'musician%n' n = <i>
	formatText checksumName = musician_info 'musician%n_info' n = <i>
	if CompositeObjectExists Name = <musician_name>
		if ($<musician_info>.part = vocals)
			<musician_name> :show_mic_stand
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script debug_menu_turn_micstand_off 
	Change \{debug_micstand_visible = 0}
	formatText checksumName = cas_musician_name 'musician%n' n = ($cas_current_player)
	if CompositeObjectExists Name = <cas_musician_name>
		<cas_musician_name> :hide_mic_stand
	endif
	<i> = 1
	begin
	formatText checksumName = musician_name 'musician%n' n = <i>
	formatText checksumName = musician_info 'musician%n_info' n = <i>
	if CompositeObjectExists Name = <musician_name>
		if ($<musician_info>.part = vocals)
			<musician_name> :hide_mic_stand
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script debug_menu_virtual_controller_choose 
	Change g_virtual_controller = <virtual_controller>
	Change g_virtual_controller_enabled = ((($g_virtual_controller_data) [<virtual_controller>]).Enabled)
	Change g_virtual_controller_type = ((($g_virtual_controller_data) [<virtual_controller>]).Type)
	Change g_virtual_controller_source_device = ((($g_virtual_controller_data) [<virtual_controller>]).source_device)
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
		Change \{g_virtual_controller_type = drum}
		case drum
		Change \{g_virtual_controller_type = controller}
		case controller
		Change \{g_virtual_controller_type = guitar}
		default
		Change \{g_virtual_controller_type = controller}
	endswitch
endscript

script debug_menu_virtual_controller_type_left 
	switch <value>
		case guitar
		Change \{g_virtual_controller_type = controller}
		case drum
		Change \{g_virtual_controller_type = guitar}
		case controller
		Change \{g_virtual_controller_type = drum}
		default
		Change \{g_virtual_controller_type = controller}
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
	GetActiveControllers
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
	Change g_virtual_controller_source_device = <next>
endscript

script debug_menu_virtual_controller_source_left 
	GetActiveControllers
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
	Change g_virtual_controller_source_device = <next>
endscript

script debug_menu_virtual_controller_accept_settings 
	error = 0
	error_msg = qs(0x00000000)
	GetActiveControllers
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
			Type = ($g_virtual_controller_type)
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

script debug_launch_cameracut \{Camera = 'cameras'
		index = 0
		use_default = 0}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Camera_Array '%s_%p' s = <pakname> p = <Camera>
	if NOT GlobalExists Name = <Camera_Array>
		pakname = 'default'
	elseif (<use_default> = 1)
		pakname = 'default'
	endif
	debug_select_cameracut {
		Camera_Array_pakname = <pakname>
		Camera_Array = <Camera>
		index = <index>
	}
endscript

script debug_autolaunch_cameracut 
	begin
	if ($playing_song = 1 && $start_gem_scroller_running = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	debug_launch_cameracut Camera = <Camera> index = <index> use_default = <use_default>
endscript

script debug_cycle_cameracut \{direction = !q1768515945}
	if ($debug_cameracut_mode_on = 0)
		debug_cycle_cameracut_on
		Change \{debug_cameracut_mode_on = 1}
	endif
	<count_to_add> = 1
	if (<direction> != next)
		<count_to_add> = -1
	endif
	Change debug_cameracut_iterator = (($debug_cameracut_iterator) + <count_to_add>)
	GetPakManCurrentName \{map = zones}
	begin
	GetArraySize ($CameraCutPrefixArray)
	if (<direction> = next)
		if (($debug_cameracut_group_iterator) >= <array_Size>)
			Change \{debug_cameracut_group_iterator = 0}
			Change \{debug_cameracut_iterator = 0}
		endif
	else
		if (($debug_cameracut_group_iterator) < 0)
			Change debug_cameracut_group_iterator = (<array_Size> - 1)
			Change \{debug_cameracut_iterator = 0}
		endif
	endif
	get_camera_special_suffix
	formatText checksumName = camera_array_1 '%s_%p%b' s = <pakname> p = ($CameraCutPrefixArray [($debug_cameracut_group_iterator)]) b = <special_suffix>
	formatText checksumName = camera_array_2 'default_%p' p = ($CameraCutPrefixArray [($debug_cameracut_group_iterator)])
	<found_cam_global> = 0
	if GlobalExists Name = <camera_array_1>
		<Camera_Array> = <camera_array_1>
		<found_cam_global> = 1
	elseif GlobalExists Name = <camera_array_2>
		<Camera_Array> = <camera_array_2>
		<found_cam_global> = 1
	endif
	if (<found_cam_global> = 1)
		GetArraySize ($<Camera_Array>)
		if (<direction> = next)
			if (($debug_cameracut_iterator) >= <array_Size>)
				Change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) + 1)
				Change \{debug_cameracut_iterator = 0}
			else
				if (($debug_cameracut_iterator) >= <array_Size>)
					Change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) + 1)
					Change \{debug_cameracut_iterator = 0}
				else
					break
				endif
			endif
		else
			if (($debug_cameracut_iterator) < 0)
				Change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) - 1)
				Change debug_cameracut_iterator = (<array_Size> - 1)
			else
				if (($debug_cameracut_iterator) >= <array_Size>)
					Change debug_cameracut_iterator = (<array_Size> - 1)
				else
					break
				endif
			endif
		endif
	else
		Change debug_cameracut_group_iterator = (($debug_cameracut_group_iterator) + <count_to_add>)
	endif
	repeat
	debug_select_cameracut {
		Camera_Array_pakname = <pakname>
		Camera_Array = ($CameraCutPrefixArray [($debug_cameracut_group_iterator)])
		index = ($debug_cameracut_iterator)
	}
	if StructureContains structure = ($<Camera_Array> [($debug_cameracut_iterator)]) Name
		formatText TextName = Name qs(0x73307931) s = ($<Camera_Array> [($debug_cameracut_iterator)].Name) DontAssertForChecksums
	elseif StructureContains structure = ($<Camera_Array> [($debug_cameracut_iterator)]) params
		if StructureContains structure = ($<Camera_Array> [($debug_cameracut_iterator)].params) Name
			formatText TextName = Name qs(0x73307931) s = ($<Camera_Array> [($debug_cameracut_iterator)].params.Name) DontAssertForChecksums
		endif
	endif
	if GotParam \{Name}
		SpawnScriptNow lightshow_debug_dislay_name params = {debug_text = <Name>}
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
	if ViewportExists \{id = bg_viewport}
		disable_bg_viewport
	endif
	enable_crowd_models_cfunc \{Active = true}
	hide_hud
endscript

script debug_cycle_cameracut_off 
	show_hud
	if ViewportExists \{id = bg_viewport}
		enable_bg_viewport
	endif
	gh_unpause_ui
	if userviewerinfe
		disable_pause
	else
		enable_pause
	endif
	Change \{debug_cameracut_mode_on = 0}
endscript

script debug_menu_build_song_changelist_menu 
	array = []
	AddArrayElement array = <array> element = {text = qs(0x6b99acd4)}
	return item_params = <array>
endscript

script debug_menu_song_changelist_menu_name_builder \{changelist_string = qs(0x58ec0776)}
	if GlobalExists \{Name = g_song_changelist}
		formatText TextName = changelist_string qs(0xda71077f) c = ($g_song_changelist)
	endif
	return Name = <changelist_string>
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

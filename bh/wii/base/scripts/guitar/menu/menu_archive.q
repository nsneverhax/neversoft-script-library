
script songlist_is_in_archive_mode 
	if ScreenElementExists \{id = SongList}
		SongList :GetSingleTag \{mode}
		if (<mode> = archive)
			return \{true}
		elseif (<mode> = music_store)
			SongList :GetSingleTag \{music_store_mode}
			if (<music_store_mode> = archive)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script archive_came_from_music_store 
	if ScreenElementExists \{id = songlist_music_store}
		songlist_music_store :GetSingleTag \{mode}
		if (<mode> = music_store)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script archive_setup_filterspec 
	if StructureContains structure = ($g_songlist_archive_filterspecs) <target>
		songlist_change_filterspec filterspec = ($g_songlist_archive_filterspecs.<target>)
	else
		songlist_clear_filterspec
	endif
endscript

script archive_songlist_back 
	if archive_came_from_music_store
		Change \{g_music_store_current_pack_checksum = NULL}
		Change \{g_songlist_last_visible_index = 4}
		SongList :SetTags \{music_store_mode = hub
			music_store_seek_override = true}
		songlist_music_store_disallow_sorting
		generic_event_back \{data = {
				bypass_return_script = songlist_music_store_go_to_hub
			}}
	else
		generic_event_back
	endif
endscript

script archive_songlist_has_data 
	RequireParams \{[
			list
		]}
	archive_get_songlist_ids list = <list>
	(<songlist_ids>.SongList) :GetSingleTag list_page_size
	if (<list_page_size> <= 0)
		return \{FALSE}
	endif
	return \{true}
endscript

script archive_choose_songlist 
	RequireParams \{[
			target
		]}
	archive_unfocus_all_songlists
	SongList :GetTags
	archive_setup_songlist_target target = <target>
	if (<target> = music_store)
		return
	endif
	<sortspec> = {
		key = (($g_songlist_sort_array [($g_songlist_sort_index)]).key)
		alt_key = (($g_songlist_sort_array [($g_songlist_sort_index)]).alt_key)
		ascending
	}
	sdcardmanagerfunc \{func = push_lock_card}
	contentmanfunc {
		func = request_page
		Name = <list_name>
		current_page
		Seek = 0
		callback = archive_choose_songlist_part_2
		sortspec = <sortspec>
		filterspec = ($g_songlist_filterspec)
		invert_filterspec = ($g_songlist_invert_filterspec)
	}
endscript

script archive_choose_songlist_part_2 
	Change \{g_songlist_last_visible_index = 4}
	songlist_refresh_menus
	begin
	SongList :GetSingleTag \{initial_built}
	if (<initial_built> = true)
		break
	endif
	printf \{qs(0x79b23eb6)}
	WaitOneGameFrame
	repeat
	SongList :GetTags
	if archive_songlist_has_data list = <archive_source>
		songlist_hilight_bar_cont :se_setprops \{alpha = 1.0}
	endif
	if NOT GotParam \{no_helpers}
		clean_up_user_control_helpers
		songlist_create_default_user_control_helpers mode = <mode>
	endif
	current_menu :se_setprops \{unblock_events}
	LaunchEvent \{Type = focus
		target = current_menu}
	sdcardmanagerfunc \{func = pop_lock_card}
endscript

script archive_toggle_songlist 
	SongList :GetSingleTag \{archive_source}
	if (<archive_source> = wii)
		<target> = sd
	else
		<target> = wii
	endif
	if archive_songlist_has_data list = <target>
		archive_choose_songlist target = <target>
	endif
endscript

script archive_unfocus_all_songlists 
	archive_get_songlist_ids \{list = wii}
	(<songlist_ids>.menu) :se_setprops unblock_events
	LaunchEvent Type = unfocus target = (<songlist_ids>.menu)
	(<songlist_ids>.hilight_bar) :se_setprops alpha = 0.0
	(<songlist_ids>.menu) :se_setprops block_events
	archive_get_songlist_ids \{list = sd}
	(<songlist_ids>.menu) :se_setprops unblock_events
	LaunchEvent Type = unfocus target = (<songlist_ids>.menu)
	(<songlist_ids>.hilight_bar) :se_setprops alpha = 0.0
	(<songlist_ids>.menu) :se_setprops block_events
	archive_get_songlist_ids \{list = music_store}
	(<songlist_ids>.menu) :se_setprops unblock_events
	LaunchEvent Type = unfocus target = (<songlist_ids>.menu)
	(<songlist_ids>.hilight_bar) :se_setprops alpha = 0.0
	(<songlist_ids>.menu) :se_setprops block_events
endscript

script archive_get_songlist_ids 
	RequireParams \{[
			list
		]}
	if (<list> = wii)
		<SongList> = songlist_wii
	elseif (<list> = sd)
		<SongList> = songlist_sd
	else
		<SongList> = songlist_music_store
	endif
	RemoveParameter \{list}
	if NOT ScreenElementExists id = <SongList>
		return
	endif
	<SongList> :desc_resolvealias Name = alias_songlist_vmenu param = menu
	<SongList> :desc_resolvealias Name = alias_music_store_slider_nub_cont param = slider_nub
	<SongList> :desc_resolvealias Name = alias_songlist_hilight_bar_cont param = hilight_bar
	return songlist_ids = <...>
endscript

script archive_setup_songlist_target 
	RequireParams \{[
			target
		]}
	archive_get_songlist_ids list = <target>
	if NOT GotParam \{songlist_ids}
		ScriptAssert \{'Doh!'}
		return
	endif
	archive_setup_filterspec target = <target>
	AssignAlias id = (<songlist_ids>.SongList) alias = SongList
	AssignAlias id = (<songlist_ids>.menu) alias = current_menu
	AssignAlias id = (<songlist_ids>.slider_nub) alias = songlist_slider_nub_cont
	AssignAlias id = (<songlist_ids>.hilight_bar) alias = songlist_hilight_bar_cont
	if (<target> != music_store)
		sdcardmanagerfunc \{func = push_lock_card}
		Wait \{3
			gameframes}
		sdcardmanagerfunc \{func = pop_lock_card}
	endif
endscript
g_archive_sd_eject_is_bad = 0

script archive_select_song 
	SongList :GetSingleTag \{archive_source}
	Change \{g_archive_sd_eject_is_bad = 1}
	if (<archive_source> = sd)
		formatText TextName = body_text ($wii_ra_message_transfer_popup_sd) s = (<ui_struct>.song_title)
	else
		formatText TextName = body_text ($wii_ra_message_transfer_popup_local) s = (<ui_struct>.song_title)
	endif
	archive_unfocus_all_songlists
	if archive_came_from_music_store
		music_store_select_sfx
	else
		generic_menu_pad_choose_sound
	endif
	create_dialog_box {
		no_background
		heading_text = qs(0x976cf9e7)
		body_text = <body_text>
		back_button_script = archive_destroy_popup
		options = [
			{
				func = archive_transfer_song
				func_params = {
					Source = <archive_source>
					delete_after
					song = (<ui_struct>.song_checksum)
				}
				text = qs(0xb523a42d)
			}
			{
				func = archive_transfer_song
				func_params = {
					Source = <archive_source>
					song = (<ui_struct>.song_checksum)
				}
				text = qs(0x63b5b49e)
			}
			{
				func = archive_delete_song
				func_params = {
					Source = <archive_source>
					song = (<ui_struct>.song_checksum)
					song_title = (<ui_struct>.song_title)
				}
				text = qs(0x271a1633)
			}
		]
	}
endscript

script archive_transfer_song 
	SpawnScriptNow archive_transfer_song_spawned params = <...>
endscript

script archive_transfer_song_spawned 
	archive_destroy_popup \{no_refocus}
	sdcardmanagerfunc \{func = force_hold_ejects}
	disablereset
	push_block_home_button
	sdcardmanagerfunc \{func = setup_transfer}
	if (<Source> = sd)
		<transfer_type> = restore
	else
		<transfer_type> = backup
	endif
	<error_text> = qs(0xccb15e78)
	if GotParam \{delete_after}
		wii_dlc_get_error_text error_crc = cntsd_result_start_transfer transfer_type = <transfer_type>
	else
		wii_dlc_get_error_text error_crc = cntsd_result_start_transfer transfer_type = <transfer_type> copy_to_sd
	endif
	formatText TextName = transfer_text qs(0x1145fd86) s = <error_text>
	sdcardmanagerfunc func = <transfer_type> content_name = <song>
	sdcardmanagerfunc \{func = get_state}
	if (<state> != Idle)
		create_dialog_box {
			heading_text = qs(0x131b4d0f)
			body_text = <transfer_text>
		}
		dialog_box_container :obj_spawnscript \{archive_animate_progress_bar}
		begin
		sdcardmanagerfunc \{func = get_state}
		if (<state> = Idle)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		destroy_dialog_box
	endif
	sdcardmanagerfunc \{func = get_transfer_results}
	sdcardmanagerfunc \{func = shutdown_transfer}
	pop_block_home_button
	enablereset
	printstruct <...>
	if archive_handle_error <...>
		return
	elseif archive_handle_error (<transfer_results>.<song>)
		return
	endif
	if GotParam \{delete_after}
		if (<Source> = sd)
			sdcardmanagerfunc func = delete content_name = <song>
		else
			dlcmanagerfunc func = delete content_name = <song>
		endif
		if archive_handle_error <...>
			if (<Source> = sd)
				dlcmanagerfunc func = delete content_name = <song>
			endif
			return
		endif
	endif
	archive_refresh_menus
endscript

script archive_refresh_menus 
	SpawnScriptNow archive_refresh_menus_spawned params = <...>
endscript

script archive_set_menu_error 
	if NOT GotParam \{archive_source}
		SongList :GetSingleTag \{archive_source}
	endif
	archive_get_songlist_ids list = <archive_source>
	if GotParam \{error_text}
		(<songlist_ids>.hilight_bar) :se_setprops alpha = 0.0
		(<songlist_ids>.SongList) :se_setprops error_text = <error_text> dimmer_alpha = 1.0
	else
		(<songlist_ids>.SongList) :se_setprops error_text = qs(0x03ac90f0) dimmer_alpha = 0.0
	endif
endscript

script archive_refresh_menus_spawned 
	sdcardmanagerfunc \{func = force_hold_ejects}
	printf \{qs(0x3c7c76a8)}
	archive_unfocus_all_songlists
	if ($g_songlist_archive_setup_complete = 1)
		Change \{g_songlist_archive_setup_complete = 0}
		contentmanfunc \{func = refresh
			Name = gh_songlist
			no_enum
			sync_sd}
	endif
	SongList :GetSingleTag \{archive_source}
	archive_set_menu_error \{archive_source = wii
		error_text = qs(0x6359a068)}
	archive_set_menu_error \{archive_source = sd
		error_text = qs(0x6359a068)}
	begin
	if contentmanfunc \{func = is_ready
			Name = gh_songlist}
		break
	endif
	WaitOneGameFrame
	repeat
	archive_setup_songlist_target \{target = sd}
	Change \{g_songlist_last_visible_index = 4}
	songlist_refresh_menus
	begin
	SongList :GetSingleTag \{initial_built}
	if (<initial_built> = true)
		break
	endif
	printf \{qs(0xe11dfb78)}
	WaitOneGameFrame
	repeat
	if sdcardmanagerfunc \{func = get_card_blocks}
		if (<card_blocks> = 1)
			formatText TextName = blocks_text qs(0x646d1d57) a = <card_blocks> b = ($wii_dlc_block)
		else
			formatText TextName = blocks_text qs(0x646d1d57) a = <card_blocks> b = ($wii_dlc_blocks)
		endif
		SongList :se_setprops songlist_blocks_text = <blocks_text>
		if NOT archive_songlist_has_data \{list = sd}
			archive_set_menu_error \{error_text = $wii_ra_no_songs}
		else
			archive_set_menu_error
		endif
	else
		printf \{qs(0x95b5c22e)}
		SongList :se_setprops \{songlist_blocks_text = qs(0x03ac90f0)}
		wii_dlc_get_error_text <...>
		printf qs(0x415f8594) s = <error_text>
		archive_set_menu_error error_text = <error_text>
	endif
	archive_setup_songlist_target \{target = wii}
	Change \{g_songlist_last_visible_index = 4}
	songlist_refresh_menus
	begin
	SongList :GetSingleTag \{initial_built}
	if (<initial_built> = true)
		break
	endif
	printf \{qs(0x5435ef96)}
	WaitOneGameFrame
	repeat
	if (<wii_blocks> = 1)
		formatText TextName = blocks_text qs(0x646d1d57) a = <wii_blocks> b = ($wii_dlc_block)
	else
		formatText TextName = blocks_text qs(0x646d1d57) a = <wii_blocks> b = ($wii_dlc_blocks)
	endif
	if NOT archive_songlist_has_data \{list = wii}
		archive_set_menu_error \{error_text = $wii_ra_no_songs}
	else
		archive_set_menu_error
	endif
	SongList :se_setprops songlist_blocks_text = <blocks_text>
	Change \{g_songlist_archive_setup_complete = 1}
	archive_setup_songlist_target target = <archive_source>
	archive_refocus_songlist
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
endscript

script archive_refocus_songlist 
	SongList :GetSingleTag \{archive_source}
	if (<archive_source> = wii)
		<other_source> = sd
	else
		<other_source> = wii
	endif
	clean_up_user_control_helpers
	if archive_songlist_has_data list = <archive_source>
		archive_choose_songlist target = <archive_source>
	elseif archive_songlist_has_data list = <other_source>
		archive_choose_songlist target = <other_source>
	else
		archive_choose_songlist target = <archive_source>
	endif
endscript

script archive_animate_progress_bar 
	if NOT ScreenElementExists \{id = 0x4a2f438b}
		Obj_GetID
		CreateScreenElement {
			Type = descinterface
			desc = 'music_store_progress_bar_BH'
			id = 0x4a2f438b
			parent = <objID>
			z_priority = 10001
		}
	endif
	OnExitRun \{hide_glitch
		params = {
			num_frames = 3
		}}
	0x4a2f438b :obj_spawnscript \{0x854acc32}
	<blingy> = 0
	<0xcf28cbc0> = 0
	Change \{0x0c03ad74 = 0}
	begin
	sdcardmanagerfunc \{func = get_progress}
	0x88353ef1 progress = <progress> 0xcf28cbc0 = <0xcf28cbc0>
	if ((<progress> > 0.95) && (<blingy> = 0))
		if 0x4a2f438b :desc_resolvealias \{Name = 0xb9d36ce4}
			<resolved_id> :obj_spawnscript 0x3bb230a1
			<blingy> = 1
		endif
	endif
	if ((<blingy> = 1) && (<progress> <= 0.95))
		KillSpawnedScript \{Name = 0x3bb230a1}
		<blingy> = 0
		<0xcf28cbc0> = 0
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script archive_delete_song 
	printf \{qs(0xf70e92b8)}
	archive_destroy_popup \{no_refocus}
	Change \{g_archive_sd_eject_is_bad = 1}
	options = [
		{
			text = qs(0xf7723015)
			func = archive_destroy_popup
		}
	]
	if (<Source> = sd)
		<func> = archive_delete_song_sd
		<body_text> = ($wii_ra_message_delete_popup_sd)
	else
		<func> = archive_delete_song_nand
		<body_text> = ($wii_ra_message_delete_popup_local)
	endif
	<element> = {
		text = qs(0x271a1633)
		func = <func>
		func_params = {song = <song>}
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	formatText TextName = body_text <body_text> s = <song_title>
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = ($wii_ra_title_delete_popup)
		body_text = <body_text>
		back_button_script = archive_destroy_popup
		options = <options>
	}
endscript

script archive_delete_song_sd 
	sdcardmanagerfunc func = delete content_name = <song>
	if archive_handle_error <...>
		return
	endif
	archive_destroy_popup \{no_refocus}
	archive_refresh_menus
	printf \{qs(0x20c4558a)}
endscript

script archive_delete_song_nand 
	dlcmanagerfunc func = delete content_name = <song>
	archive_destroy_popup \{no_refocus}
	archive_refresh_menus
	printf \{qs(0x20c4558a)}
endscript

script archive_destroy_popup 
	Change \{g_archive_sd_eject_is_bad = 0}
	destroy_dialog_box
	if NOT GotParam \{no_refocus}
		archive_refocus_songlist
	endif
	if GotParam \{refresh}
		if sdcardmanagerfunc \{func = card_recently_ejected}
			sdcardmanagerfunc \{func = force_hold_ejects
				OFF}
		else
			archive_refresh_menus
		endif
	endif
	if GotParam \{pop_lock}
		sdcardmanagerfunc \{func = pop_lock_card}
	endif
endscript

script archive_songlist_destroy 
	if ScreenElementExists \{id = songlist_rock_archive}
		DestroyScreenElement \{id = songlist_rock_archive}
	endif
	if ScreenElementExists \{id = songlist_music_store}
		songlist_music_store :GetTags
		if (<mode> = archive_entry)
			if (<cs_registered> = true)
				contentmanfunc func = unregister_content_source Name = <list_name>
			endif
			DestroyScreenElement \{id = songlist_music_store}
		endif
	endif
	if ScriptIsRunning \{songlist_request_page_when_ready}
		KillSpawnedScript \{Name = songlist_request_page_when_ready}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
endscript

script archive_create_eject_popup 
	sdcardmanagerfunc \{func = push_lock_card}
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = qs(0xaa163738)
		body_text = ($g_sd_card_state_change_error_archive)
		back_button_script = archive_destroy_popup
		0xec0fa383 = {refresh pop_lock no_refocus}
		options = [
			{
				text = qs(0x0e41fe46)
				func = archive_destroy_popup
				func_params = {refresh pop_lock no_refocus}
			}
		]
	}
endscript

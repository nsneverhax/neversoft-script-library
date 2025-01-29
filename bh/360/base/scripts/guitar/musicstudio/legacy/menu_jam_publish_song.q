jam_signin_upload = 0
jam_signin_manage = 0
musicstudio_logo_card_depth = -5.0
musicstudio_logo_card_scale_x = 7.0
musicstudio_logo_card_scale_z = 4.0

script create_jam_publish_song_menu \{new_genre = -1}
	printf channel = jam_publish qs(0x6924c21a) s = <FileName>
	NetSessionFunc \{func = stats_init}
	Change \{target_jam_camera_prop = jam_publish}
	jam_camera_wait
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_publish_song_container}
	back_drop_color = [50 50 50 255]
	rot = 0
	header_x = 320
	header_y = 80
	header_foreground_color = <back_drop_color>
	header_background_color = [255 255 255 255]
	make_generic_menu {
		Title = qs(0x7ba7b302)
		pad_back_script = jam_publish_song_back_warning
		pad_back_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
		vmenu_id = create_publish_song_menu
		dims = (400.0, 400.0)
		no_up_down_sound_handlers
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
	}
	<new_song> = 0
	GetSongInfo
	if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
		<new_song> = 1
	endif
	<unmodifiable_color> = [50 50 50 255]
	FormatText TextName = name qs(0x0d0647cc) s = <newfilename>
	if (<new_song> = 1)
		add_generic_musicstudio_menu_text_item {
			text = <name>
			choose_state = UIstate_jam_publish_text_entry
			choose_state_data = {choose_script = jam_name_choose_script text = <newfilename> choose_params = {FileName = <FileName>}}
		}
	else
		add_generic_musicstudio_menu_text_item {
			text = <name>
			additional_unfocus_script = unfocus_published_data
			additional_unfocus_params = {Color = <unmodifiable_color>}
		}
		<item_container_id> :SetProps generic_menu_smenu_textitem_text_rgba = <unmodifiable_color>
	endif
	printf channel = jam_mode qs(0x63bb92f7) s = <new_genre>
	GetArraySize \{$jam_genre_list}
	if ((<new_genre> >= 0) && (<new_genre> < <array_size>))
		FormatText TextName = genre qs(0xb8f92f6b) s = ($jam_genre_list [<new_genre>].name_text)
	else
		FormatText \{TextName = genre
			qs(0xb8f92f6b)
			s = qs(0xd0ef7f05)}
	endif
	if (<new_song> = 1)
		add_generic_musicstudio_menu_text_item {
			text = <genre>
			choose_state = UIstate_jam_publish_genre
			choose_state_data = {choose_script = jam_genre_choose_script}
		}
	else
		add_generic_musicstudio_menu_text_item {
			text = <genre>
			additional_unfocus_script = unfocus_published_data
			additional_unfocus_params = {Color = <unmodifiable_color>}
		}
		<item_container_id> :SetProps generic_menu_smenu_textitem_text_rgba = <unmodifiable_color>
	endif
	add_generic_musicstudio_menu_text_item {
		icon = icon_jam_preview
		text = qs(0x23e0b711)
		pad_choose_script = jam_preview_song_choose_script
		pad_choose_params = {FileName = <newfilename>}
	}
	add_generic_musicstudio_menu_text_item \{icon = icon_graphics
		text = qs(0x110cf5a6)
		pad_choose_script = jam_album_art_choose_script}
	add_generic_musicstudio_menu_text_item {
		icon = icon_save
		text = qs(0x2e843138)
		pad_choose_script = jam_save_and_quit_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	add_generic_musicstudio_menu_text_item {
		icon = icon_jam_upload
		text = qs(0xe50aaa19)
		pad_choose_script = jam_upload_song_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	add_generic_musicstudio_menu_text_item {
		icon = icon_jam_upload
		text = qs(0xfde202a4)
		pad_choose_script = jam_delete_song_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	jam_publish_draw_album_cover
	LaunchEvent \{type = focus
		target = current_menu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	if ($jam_signin_upload = 1)
		Change \{jam_signin_upload = 0}
		spawnscriptnow jam_upload_song_choose_script params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	elseif ($jam_signin_manage = 1)
		Change \{jam_signin_manage = 0}
		spawnscriptnow jam_delete_song_choose_script params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	endif
	StartRendering
endscript

script unfocus_published_data 
	<id> :SetProps generic_menu_smenu_textitem_text_rgba = <Color>
endscript

script jam_publish_draw_album_cover 
	StopRendering
	cas_update_band_logo \{album_art}
	ensure_band_logo_object_created
	SetCASAppearance \{appearance = {
			CAS_BAND_LOGO = {
				desc_id = CAS_Band_Logo_id
			}
		}}
	Change \{cas_override_object = BandLogoObject}
	KillCamAnim \{name = jam_publish_song_igc_name}
	PlayIGCCam \{id = jam_publish_song_igc
		name = jam_publish_song_igc_name
		viewport = bg_viewport
		LockTo = World
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 1.0, 0.0)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	BandLogoObject :Obj_SetPosition \{position = (0.26, -1.3299999, -1.3)}
	BandLogoObject :Obj_SetOrientation \{Dir = (0.0, 0.0, 1.0)}
	BandLogoObject :SwitchOnAtomic \{CAS_BAND_LOGO}
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
	BandLogoObject :Obj_SetBoundingSphere \{10.0}
	StartRendering
endscript

script jam_preview_song_choose_script 
	printf \{channel = jam_publish
		qs(0xc66e5c95)}
	create_song_preview_menu FileName = <FileName>
endscript

script jam_album_art_choose_script 
	get_savegame_from_controller controller = ($primary_controller)
	Change cas_current_savegame = <savegame>
	CasBlockForLoading
	Change \{cas_editing_new_character = false}
	ensure_band_logo_object_created
	if StructureContains structure = (($editable_jam_album_cover) [0]) base_tex
		SetCASAppearance appearance = {
			CAS_BAND_LOGO = {
				desc_id = CAS_Band_Logo_id
				CAP = ($editable_jam_album_cover)
			}
		}
	else
		SetCASAppearance \{appearance = {
				CAS_BAND_LOGO = {
					desc_id = CAS_Band_Logo_id
				}
			}}
	endif
	Change \{cas_override_object = BandLogoObject}
	KillCamAnim \{name = jam_publish_song_igc_name}
	PlayIGCCam \{id = jam_publish_song_igc
		name = jam_publish_song_igc_name
		viewport = bg_viewport
		LockTo = World
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 1.0, 0.0)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	BandLogoObject :Obj_SetPosition \{position = (0.26, -1.3299999, -1.3)}
	BandLogoObject :Obj_SetOrientation \{Dir = (0.0, 0.0, 1.0)}
	BandLogoObject :SwitchOnAtomic \{CAS_BAND_LOGO}
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
	BandLogoObject :Obj_SetBoundingSphere \{10.0}
	get_savegame_from_controller controller = ($primary_controller)
	ui_event event = menu_change data = {state = UIstate_cap_main text = qs(0xdbb8277f) savegame = <savegame> part = CAS_BAND_LOGO num_icons = 0 album_cover = 1}
	printf \{channel = jam_publish
		qs(0xbeabca70)}
endscript

script jam_go_back_from_album_art 
	KillCamAnim \{all}
	Change \{target_jam_camera_prop = jam_publish}
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{name = jam_view_cam
		viewport = bg_viewport
		controlscript = jam_camera_script
		params = {
			start_camera = jam_publish
		}
		Play_hold = 1}
	Change \{jam_view_cam_created = 1}
	if NOT GetCASAppearance
		ScriptAssert \{qs(0xd09a342c)}
	endif
	if StructureContains structure = (<appearance>.CAS_BAND_LOGO) CAP
		Change editable_jam_album_cover = ((<appearance>.CAS_BAND_LOGO).CAP)
		Change \{editable_jam_album_cover_size = 1}
	endif
	Change \{cas_override_object = None}
	Change \{cas_current_savegame = -1}
	generic_event_back
endscript

script jam_genre_choose_script 
	printf channel = jam_publish qs(0xb4298068) s = <genre>
	SetSongInfo genre = <genre>
	ui_event event = menu_back data = {new_genre = <genre>}
endscript

script jam_track_select_choose_script 
	if (<guitar_num> = 1)
		SetSongInfo playback_track1 = <track>
	else
		SetSongInfo playback_track2 = <track>
	endif
	ui_event \{event = menu_back}
endscript

script jam_upload_song_choose_script 
	printf \{channel = musicstudio
		qs(0x0036b410)}
	if NOT NetSessionFunc \{func = IsOldEnoughForOnline}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	show_ghtunes_connecting_popup
	LaunchEvent \{type = unfocus
		target = current_menu}
	NetSessionFunc \{func = stats_init}
	NetSessionFunc \{func = live_settings_init}
	printf \{channel = musicstudio
		qs(0x2b1be7d3)}
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if IsPS3
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 Jam = 2}
			return \{false}
		endif
		printf \{channel = musicstudio
			qs(0x3200d692)}
		if CheckForSignIn local controller_index = ($primary_controller)
			if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
				jam_upload_song_failed \{dialog = 20}
				return \{false}
			endif
		endif
		printf \{channel = musicstudio
			qs(0x7d414055)}
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{false}
		endif
		printf \{channel = musicstudio
			qs(0x645a7114)}
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				destroy_dialog_box
				jam_upload_song_failed \{dialog = 5}
				return
			endif
			printf \{channel = musicstudio
				qs(0x4f7722d7)}
		else
			destroy_dialog_box
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 Jam = 2}
			return
		endif
	endif
	printf \{channel = musicstudio
		qs(0x566c1396)}
	if NOT NetSessionFunc \{func = IsOldEnoughForOnline}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	printf \{channel = musicstudio
		qs(0xd1f40f59)}
	if NOT jam_do_lobby_check_upload
		return
	endif
	printf \{channel = musicstudio
		qs(0xc8ef3e18)}
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	printf \{channel = musicstudio
		qs(0x59885301)}
	if (<genre> < 0)
		jam_upload_song_failed \{dialog = 1}
		return
	endif
	printf \{channel = musicstudio
		qs(0x40936240)}
	if ($ghtunes_verified = 0)
		VerifyJamUserContent controller = ($primary_controller)
		Block \{type = verify_jam_user_content}
		printf \{channel = jam_mode
			qs(0x3ba11da7)}
		Change \{ghtunes_verified = 1}
	endif
	printf \{channel = musicstudio
		qs(0x6bbe3183)}
	if NetSessionFunc \{func = IsCableUnplugged}
		destroy_dialog_box
		jam_upload_song_failed \{dialog = 5}
		return
	endif
	printf \{channel = musicstudio
		qs(0x72a500c2)}
	if ($ghtunes_killswitch = 1)
		jam_upload_song_failed \{dialog = 16}
		return
	endif
	printf \{channel = musicstudio
		qs(0x24ffa744)}
	if NOT IsAcceptableString string = <newfilename>
		if ((NetSessionFunc func = is_lobby_available) && (NetSessionFunc func = is_ghtunes_lobby_available))
			destroy_dialog_box
			printf channel = jam_publish qs(0x9b3a53e4) s = <newfilename>
			jam_upload_song_failed dialog = 10 FileName = <newfilename>
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 0)
					if NetSessionFunc \{func = IsCableUnplugged}
						destroy_dialog_box
						jam_upload_song_failed \{dialog = 5}
					endif
					destroy_dialog_box
					jam_upload_song_failed \{dialog = 19}
				else
					destroy_dialog_box
					jam_upload_song_failed \{dialog = 5}
				endif
			else
				destroy_dialog_box
				jam_upload_song_failed \{dialog = 19}
			endif
		endif
		return
	else
		printf channel = jam_publish qs(0x2fb2f934) s = <newfilename>
	endif
	jam_upload_song_dialog \{dialog = 3}
	printf \{channel = musicstudio
		qs(0x884ae848)}
	JamUserCanUpload controller = ($primary_controller)
	Block \{type = jam_user_can_upload}
	printf \{channel = musicstudio
		qs(0x4b3dfcef)}
	if (<event_data>.failed = 1)
		if (<event_data>.fail_type = 1)
			jam_upload_song_failed \{dialog = 14}
		else
			jam_upload_song_failed \{dialog = 5}
		endif
		return
	endif
	printf \{channel = musicstudio
		qs(0x5226cdae)}
	GetJamUserContentList check_showcase controller = ($primary_controller)
	Block \{type = get_jam_user_content_list}
	printf \{channel = musicstudio
		qs(0x790b9e6d)}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 16}
	else
		printf \{channel = musicstudio
			qs(0x6010af2c)}
		GetSongInfo
		<file_id> = (<file_id>.file_id)
		if (((<file_id> [0]) = 0) && ((<file_id> [1]) = 0))
			slot_array = $jam_curr_slot_array
			StopRendering
			generic_event_choose state = UIstate_jam_publish_slot data = {choose_script = jam_upload_song_legal_check
				genre = <genre>
				FileName = <FileName>
				newfilename = <newfilename>
				slot_array = <slot_array>}
			jam_upload_song_dialog_destroy
		else
			UpdateJamUserContent controller = ($primary_controller)
			Block \{type = update_jam_user_content}
			jam_upload_song_dialog_destroy
			if (<event_data>.failed = 0)
				jam_upload_song_success dialog = 2 FileName = <FileName> newfilename = <newfilename> genre = <genre>
			elseif (<event_data>.failed = 2)
				jam_upload_song_failed dialog = 12 FileName = <FileName> newfilename = <newfilename> genre = <genre>
			else
				jam_upload_song_failed dialog = 11 FileName = <FileName> newfilename = <newfilename> genre = <genre>
			endif
		endif
	endif
endscript

script jam_delete_song_choose_script 
	if NOT NetSessionFunc \{func = IsOldEnoughForOnline}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	LaunchEvent \{type = unfocus
		target = current_menu}
	NetSessionFunc \{func = stats_init}
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if IsPS3
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 Jam = 2 new_data = {manage = 1}}
			return \{false}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
				jam_upload_song_failed \{dialog = 20}
				return \{false}
			endif
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{false}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 Jam = 2 new_data = {manage = 1}}
			return
		endif
	endif
	show_ghtunes_connecting_popup
	if NOT jam_do_lobby_check_upload
		return
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	if ($ghtunes_killswitch = 1)
		jam_upload_song_failed \{dialog = 16}
		return
	endif
	jam_upload_song_dialog \{dialog = 3}
	GetJamUserContentList controller = ($primary_controller)
	Block \{type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 5}
	else
		slot_array = $jam_curr_slot_array
		StopRendering
		generic_event_choose state = UIstate_jam_publish_slot data = {choose_script = jam_upload_song_legal_check
			genre = <genre>
			FileName = <FileName>
			newfilename = <newfilename>
			slot_array = <slot_array>
			delete_only}
		jam_upload_song_dialog_destroy
	endif
endscript

script UpdateJamUserContent_callback 
	broadcastevent type = update_jam_user_content data = {failed = <fail_type>}
endscript

script UpdateJamUserContent_failed_callback 
	broadcastevent type = update_jam_user_content data = {failed = <fail_type>}
endscript

script jam_remove_song_from_slot_check \{Slot = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	jam_upload_check_dialog dialog = 1 Slot = <Slot> genre_chk = <genre_chk>
endscript

script jam_remove_song_from_slot \{Slot = 0}
	destroy_dialog_box
	NetSessionFunc \{func = stats_init}
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if IsPS3
			jam_upload_song_failed \{dialog = 8}
			return \{false}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{false}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			jam_upload_song_failed \{dialog = 8}
			return
		endif
	endif
	show_ghtunes_connecting_popup
	if NOT jam_do_lobby_check_upload
		return
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	jam_upload_song_dialog \{dialog = 1}
	RemoveJamUserContent controller = ($primary_controller) Slot = <Slot> genre = <genre_chk>
	Block \{type = remove_jam_user_content}
	jam_upload_song_dialog_destroy
	printstruct channel = jam_mode ($jam_curr_slot_array)
	printstruct channel = jam_mode ($jam_curr_directory_listing)
	curr_slot_file_id = ($jam_curr_slot_array [<Slot>].file_id.file_id)
	GetArraySize ($jam_curr_directory_listing) param = directory_size
	j = 0
	begin
	curr_directory_file_id = ($jam_curr_directory_listing [<j>].fileid.file_id)
	if NOT (<curr_directory_file_id> = 0)
		<curr_directory_file_id> = ($jam_curr_directory_listing [<j>].fileid.file_id)
		if (<curr_slot_file_id> [1] = <curr_directory_file_id> [1])
			if (<curr_slot_file_id> [0] = <curr_directory_file_id> [0])
				StopRendering
				ClearCustomSong
				jam_recording_create_editable_arrays
				Change memcard_jamsession_file_name = ($jam_curr_directory_listing [<j>].FileName)
				Change \{memcard_after_func = StopRendering}
				ui_memcard_load_jam \{event = menu_replace
					data = {
						state = UIstate_jam_publish_update_fileid
					}}
				return
			endif
		endif
	endif
	<j> = (<j> + 1)
	repeat <directory_size>
	jam_upload_song_success \{dialog = 1}
endscript

script file_id_test 
	GetSongInfo
	printstruct channel = jam_mode <file_id>
endscript

script jam_upload_song_legal_check 
	jam_upload_check_dialog dialog = 2 <...>
endscript

script jam_upload_song_to_slot_check \{Slot = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	if jam_verify_publishing_rules FileName = <newfilename> Slot = <Slot>
		if GotParam \{replace}
			jam_upload_check_dialog dialog = 0 Slot = <Slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
		else
			jam_upload_song_to_slot Slot = <Slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
		endif
	endif
endscript

script jam_upload_song_to_slot 
	jam_upload_song_dialog \{dialog = 4}
	NetSessionFunc \{func = stats_init}
	SetSongInfo genre = <genre>
	jam_update_song_artist_name
	if GotParam \{replace}
		if NOT CheckForSignIn controller_index = ($primary_controller)
			if IsPS3
				jam_upload_song_failed \{dialog = 8}
				return \{false}
			endif
			if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
				jam_upload_song_failed \{dialog = 5}
				return \{false}
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				if NetSessionFunc \{func = IsCableUnplugged}
					jam_upload_song_failed \{dialog = 5}
					return
				endif
			else
				jam_upload_song_failed \{dialog = 8}
				return
			endif
		endif
		show_ghtunes_connecting_popup
		if NOT jam_do_lobby_check_upload
			return
		endif
		if NOT NetSessionFunc \{func = can_view_user_content}
			jam_upload_song_failed \{dialog = 6}
			return
		endif
		jam_upload_song_dialog \{dialog = 1}
		RemoveJamUserContent controller = ($primary_controller) Slot = <Slot> genre = ($jam_genre_list [<genre>].checksum)
		Block \{type = remove_jam_user_content}
		jam_upload_song_dialog_destroy
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if IsPS3
			jam_upload_song_failed \{dialog = 8}
			return \{false}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{false}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			jam_upload_song_failed \{dialog = 8}
			return
		endif
	endif
	show_ghtunes_connecting_popup
	if NOT jam_do_lobby_check_upload
		return
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	jam_upload_song_dialog \{dialog = 0}
	printf channel = jam_publish qs(0xf50293a7) s = <newfilename> a = <genre>
	FormatText TextName = newfilename_nonlocal '%s' s = <newfilename>
	AddJamUserContent controller = ($primary_controller) Slot = <Slot> FileName = <newfilename_nonlocal> genre = ($jam_genre_list [<genre>].checksum)
	Block \{type = add_jam_user_content}
	jam_upload_song_dialog_destroy
	if (<event_data>.failed = 0)
		jam_save_and_quit_choose_script FileName = <FileName> newfilename = <newfilename> genre = <genre>
	else
		if (<event_data>.failed = 1)
			jam_upload_song_failed dialog = 4 FileName = <FileName> newfilename = <newfilename> genre = <genre>
		else
			jam_upload_song_failed dialog = 15 FileName = <FileName> newfilename = <newfilename> genre = <genre>
		endif
	endif
endscript

script jam_verify_publishing_rules 
	count = 0
	verified_note_count = 0
	last_end_time = 0
	begin
	GetTrackSize track = ($jam_tracks [<count>].id)
	if (<track_size> > 0)
		end_time = 0
		if GetCustomNote track = ($jam_tracks [<count>].id) index = (<track_size> - 1)
			end_time = <note_time>
		endif
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
	endif
	if (<track_size> >= $ghtunes_minimum_note_count)
		<verified_note_count> = 1
	endif
	<count> = (<count> + 1)
	repeat 5
	if (<verified_note_count> = 0)
		jam_upload_song_failed \{dialog = 2}
		return \{false}
	endif
	if (<last_end_time> < $ghtunes_minimum_song_time)
		jam_upload_song_failed \{dialog = 3}
		return \{false}
	endif
	GetArraySize \{$jam_curr_slot_array}
	index = 0
	begin
	if (($jam_curr_slot_array [<index>].has_content) = 1)
		slot_filename = ($jam_curr_slot_array [<index>].FileName)
		FormatText TextName = filename_nonlocal '%s' s = <FileName>
		if (<filename_nonlocal> = <slot_filename>)
			if NOT (<Slot> = <index>)
				jam_upload_song_failed \{dialog = 7}
				return \{false}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script AddJamUserContent_callback 
	printf \{channel = jam_publish
		qs(0xb79f3d27)}
	broadcastevent \{type = add_jam_user_content
		data = {
			failed = 0
		}}
endscript

script AddJamUserContent_failed_callback 
	printf \{channel = jam_publish
		qs(0xbce15630)}
	broadcastevent \{type = add_jam_user_content
		data = {
			failed = 1
		}}
endscript

script AddJamUserContent_failed_size_callback 
	printf \{channel = jam_publish
		qs(0x7134fb9c)}
	broadcastevent \{type = add_jam_user_content
		data = {
			failed = 2
		}}
endscript
jam_curr_slot_array = [
	0
	0
	0
	0
	0
]
jam_user_is_showcased = 0

script GetJamUserContentList_callback 
	printf \{channel = jam_mode
		qs(0x5b6ac636)}
	if GotParam \{is_showcased}
		Change jam_user_is_showcased = <is_showcased>
	else
		Change \{jam_user_is_showcased = 0}
	endif
	Change jam_curr_slot_array = <slot_array>
	broadcastevent \{type = get_jam_user_content_list
		data = {
			failed = 0
		}}
endscript

script GetJamUserContentList_failed_callback 
	printf \{channel = jam_mode
		qs(0x2c7733a9)}
	Change \{jam_user_is_showcased = 0}
	broadcastevent \{type = get_jam_user_content_list
		data = {
			failed = 1
		}}
endscript

script JamUserCanUpload_callback 
	wait \{1
		second}
	broadcastevent \{type = jam_user_can_upload
		data = {
			failed = 0
		}}
endscript

script JamUserCanUpload_callback_failed 
	wait \{1
		second}
	broadcastevent type = jam_user_can_upload data = {failed = 1 fail_type = <fail_type>}
endscript

script RemoveJamUserContent_callback 
	broadcastevent \{type = remove_jam_user_content}
endscript

script jam_upload_song_dialog \{dialog = 0
		ghtunes = 0}
	if (<ghtunes> = 0)
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	destroy_dialog_box
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = upload_dialog
			qs(0x3f0d3de7)}
		case 1
		FormatText \{TextName = upload_dialog
			qs(0xab3efa6a)}
		case 2
		FormatText \{TextName = upload_dialog
			qs(0xb503f9a6)}
		case 3
		FormatText \{TextName = upload_dialog
			qs(0xbc410800)}
		case 4
		FormatText \{TextName = upload_dialog
			qs(0x487100b3)}
		case 5
		FormatText \{TextName = upload_dialog
			qs(0xc1cdb4da)}
	endswitch
	create_dialog_box {
		heading_text = qs(0x5204e0ef)
		body_text = <upload_dialog>
	}
	dialog_box_container :Obj_SpawnScript \{jam_recording_animate_spinning_record}
	if (<dialog> = 3)
		dialog_box_container :Obj_SpawnScript \{jam_publish_timeout}
	endif
endscript

script jam_upload_song_dialog_destroy 
	destroy_dialog_box
endscript

script jam_publish_timeout 
	wait \{20
		seconds}
	jam_upload_song_failed \{dialog = 5}
endscript

script jam_upload_song_success \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = Title
			qs(0x275580df)}
		FormatText \{TextName = upload_dialog
			qs(0x4ac404b0)}
		<dialog> = 0
		case 1
		FormatText \{TextName = Title
			qs(0x2b72c6cd)}
		FormatText \{TextName = upload_dialog
			qs(0x7ce4b64a)}
		<dialog> = 1
		case 2
		FormatText \{TextName = Title
			qs(0x1af40d3a)}
		FormatText \{TextName = upload_dialog
			qs(0xbb24e4e3)}
		<dialog> = 0
	endswitch
	destroy_dialog_box
	if (<dialog> = 0)
		create_dialog_box {
			heading_text = <Title>
			body_text = <upload_dialog>
			options = [
				{
					func = jam_save_and_quit_choose_script
					func_params = {dialog = <dialog> FileName = <FileName> newfilename = <newfilename> genre = <genre>}
					text = qs(0x182f0173)
				}
			]
		}
	else
		create_dialog_box {
			heading_text = <Title>
			body_text = <upload_dialog>
			options = [
				{
					func = jam_upload_song_success_go_back
					func_params = {dialog = <dialog>}
					text = qs(0x182f0173)
				}
			]
		}
	endif
endscript

script jam_upload_song_success_go_back 
	if (<dialog> = 0)
		jamsession_unload \{song_prefix = 'editable'}
		ClearCustomSong
		generic_event_back \{state = UIstate_jam_select_song
			data = {
				show_popup = 0
			}}
		destroy_dialog_box
	else
		generic_event_back
		destroy_dialog_box
	endif
	destroy_generic_menu
endscript

script jam_upload_song_failed \{dialog = 0}
	printscriptinfo \{'jam_upload_song_failed'}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		if IsXenonOrWinDX
			upload_dialog = qs(0xab79bf04)
		elseif IsPS3
			upload_dialog = qs(0x06001e5e)
		endif
		case 1
		upload_dialog = qs(0x4623a4fe)
		case 2
		FormatText TextName = text qs(0x5a47560f) s = ($ghtunes_minimum_note_count)
		upload_dialog = <text>
		case 3
		minimum_seconds = ($ghtunes_minimum_song_time / 1000)
		CastToInteger \{minimum_seconds}
		FormatText TextName = text qs(0x9757f57d) s = <minimum_seconds>
		upload_dialog = <text>
		case 4
		upload_dialog = qs(0x456ac8da)
		case 5
		upload_dialog = qs(0xb9f3b9df)
		case 6
		if IsXenonOrWinDX
			upload_dialog = qs(0x32b700a5)
		elseif IsPS3
			upload_dialog = qs(0x3541af30)
		endif
		case 7
		upload_dialog = qs(0x7cc9a727)
		case 8
		if IsXenonOrWinDX
			upload_dialog = qs(0xab994a63)
		elseif IsPS3
			upload_dialog = qs(0xeed6e041)
		endif
		case 9
		if IsXenonOrWinDX
			upload_dialog = qs(0x24463799)
		elseif IsPS3
			upload_dialog = qs(0xeed6e041)
		endif
		case 10
		FormatText TextName = text qs(0x2970079e) s = <FileName>
		upload_dialog = <text>
		case 11
		upload_dialog = qs(0xac11a184)
		case 12
		upload_dialog = qs(0x05f99039)
		case 13
		if IsXenonOrWinDX
			upload_dialog = $lost_network_message_xenon
		elseif IsPS3
			upload_dialog = $lost_network_message_ps3
		endif
		case 14
		upload_dialog = qs(0x4bf318f9)
		case 15
		upload_dialog = qs(0xb2a15dea)
		case 16
		upload_dialog = qs(0xb9f3b9df)
		case 17
		upload_dialog = qs(0xe50cc88e)
		case 18
		upload_dialog = qs(0xb9f3b9df)
		case 19
		upload_dialog = qs(0xb14f4b49)
		case 20
		if IsXenonOrWinDX
			upload_dialog = qs(0xd840d20c)
		elseif IsPS3
			upload_dialog = qs(0xeed6e041)
		endif
	endswitch
	destroy_dialog_box
	create_dialog_box {
		template = large_body
		heading_text = qs(0x762bc5d2)
		body_text = <upload_dialog>
		options = [
			{
				func = jam_upload_song_failed_go_back
				func_params = {dialog = <dialog> <...>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_upload_song_failed_go_back 
	if (<dialog> = 4)
		generic_event_back \{state = uistate_jam_publish_song}
		destroy_dialog_box
	elseif (<dialog> = 2 || <dialog> = 3)
		destroy_dialog_box
		generic_event_back
	elseif (<dialog> = 7 || <dialog> = 18)
		destroy_dialog_box
		generic_event_back
	else
		destroy_dialog_box
		LaunchEvent \{type = focus
			target = current_menu}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_upload_check_dialog \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	NetSessionFunc \{func = stats_init}
	show_ghtunes_connecting_popup
	if NOT jam_do_lobby_check_upload
		return
	endif
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = Title
			qs(0xe6cd2b61)}
		FormatText TextName = upload_dialog qs(0xd10ce512) s = (<Slot> + 1)
		func = jam_upload_song_to_slot
		func_params = {<...> replace}
		case 1
		FormatText \{TextName = Title
			qs(0x9d4a3853)}
		FormatText TextName = upload_dialog qs(0x28fb319a) s = (<Slot> + 1)
		func = jam_remove_song_from_slot
		func_params = {<...>}
		case 2
		show_ghtunes_connecting_popup
		wait \{2
			seconds}
		JamUpdateSubmissionAgreement controller = ($primary_controller)
		Block \{type = verify_update_submission_agreement}
		destroy_dialog_box
		submission_error = 0
		if (<event_data>.failed = 1)
			<submission_error> = 1
		endif
		if NOT GlobalExists \{name = ghtunes_submission_agreement_array}
			<submission_error> = 1
		else
			GetArraySize \{$ghtunes_submission_agreement_array}
			if (<array_size> <= 0)
				<submission_error> = 1
			endif
		endif
		if (<submission_error> = 1)
			jam_upload_song_failed \{dialog = 16}
			return
		endif
		ghtunes_show_submission_agreement Slot = <Slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
		return
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = <Title>
		body_text = <upload_dialog>
		options = [
			{
				func = jam_upload_check_dialog_go_back
				text = qs(0x320a8d1c)
			}
			{
				func = <func>
				func_params = <func_params>
				text = qs(0x182f0173)
			}
		]
	}
endscript

script jam_upload_check_dialog_go_back 
	destroy_dialog_box
	add_user_control_helper \{text = qs(0x0307b55c)
		button = start
		z = 100000}
	menu_finish
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script jam_name_choose_script 
	printf channel = jam_publish qs(0xda5d9e2e) s = <text>
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_size> > 0)
		index = 0
		begin
		if ((<directorylisting> [<index>].FileName) = <text>)
			if NOT (<text> = <FileName>)
				jam_rename_song_failed dialog = 0 <...>
				return
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	ui_event event = menu_back data = {FileName = <FileName> newfilename = <text>}
endscript

script jam_rename_song_failed \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
			qs(0x4f3d7ad7)}
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0xbc9950cd)
		body_text = <dialog>
		options = [
			{
				func = jam_rename_song_failed_go_back
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_rename_song_failed_go_back 
	destroy_dialog_box
	ui_event event = menu_back data = {FileName = <FileName> newfilename = <FileName>}
endscript

script jam_save_and_quit_choose_script 
	printf channel = jam_publish qs(0xcbd5f814) s = <genre>
	printf channel = jam_mode qs(0xcf21ba8f) s = <genre>
	StopRendering
	if (<FileName> != <newfilename>)
		Change memcard_jamsession_file_name = <FileName>
		Change memcard_jamsession_new_file_name = <newfilename>
		Change \{memcard_after_func = jam_publish_unload}
		ui_memcard_rename_jam \{event = menu_back
			data = {
				state = UIstate_jam_select_song
				show_popup = 0
			}}
	else
		Change memcard_jamsession_file_name = <FileName>
		jam_publish_save_song
	endif
endscript

script jam_publish_save_song 
	Change \{memcard_after_func = jam_publish_unload}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = UIstate_jam_select_song
			show_popup = 0
		}}
endscript

script jam_publish_unload 
	jamsession_unload \{song_prefix = 'editable'}
	ClearCustomSong
endscript

script jam_publish_reinit_band_logo 
	cas_update_band_logo \{empty_logo}
endscript

script jam_publish_song_back_warning 
	RequireParams \{[
			FileName
			newfilename
			genre
		]
		all}
	LaunchEvent \{type = unfocus
		target = current_menu}
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0xaa163738)
		no_background
		body_text = qs(0xe861caa9)
		options = [
			{
				func = jam_publish_song_back_cancel
				func_params = {}
				text = qs(0xf7723015)
			}
			{
				func = jam_save_and_quit_choose_script
				func_params = {dialog = <dialog> FileName = <FileName> newfilename = <newfilename> genre = <genre>}
				text = qs(0xb2415b7d)
			}
			{
				func = jam_publish_song_back_no_save
				func_params = {}
				text = qs(0x06d0b6b0)
			}
		]
	}
endscript

script jam_publish_song_back_cancel 
	destroy_dialog_box
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script jam_publish_song_back_no_save 
	destroy_dialog_box
	jam_publish_song_back
endscript

script jam_publish_song_back 
	jam_publish_unload
	generic_event_back \{state = UIstate_jam_select_song
		data = {
			show_popup = 0
		}}
endscript

script destroy_jam_publish_song_menu 
	destroy_song_preview_menu
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = jam_publish_song_container}
		DestroyScreenElement \{id = jam_publish_song_container}
	endif
	destroy_generic_menu
	killspawnedscript \{id = jam_publish_song_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script ui_create_jam_publish_signin 
	if GotParam \{manage}
		Change \{jam_signin_manage = 1}
	else
		Change \{jam_signin_upload = 1}
	endif
	spawnscriptnow \{ui_create_jam_publish_signin_spawned}
endscript

script ui_create_jam_publish_signin_spawned 
	wait \{5
		gameframes}
	generic_event_back \{params = {
			state = uistate_jam_publish_song
		}}
endscript

script jam_do_lobby_check_upload 
	printf \{channel = musicstudio
		qs(0xc820e0be)}
	if NOT NetSessionFunc \{func = is_ghtunes_lobby_available}
		printf \{channel = musicstudio
			qs(0x321b2fa5)}
		wait \{1
			gameframe}
		<timeout> = 35.0
		ResetTimer
		begin
		if NetSessionFunc \{func = IsCableUnplugged}
			printf \{channel = musicstudio
				qs(0x19367c66)}
			jam_upload_song_failed \{dialog = 5}
			return \{false}
		endif
		if NetSessionFunc \{func = is_ghtunes_lobby_available}
			destroy_dialog_box
			break
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 0)
					if NetSessionFunc \{func = IsCableUnplugged}
						printf \{channel = musicstudio
							qs(0x002d4d27)}
						jam_upload_song_failed \{dialog = 5}
					endif
					destroy_dialog_box
					printf \{channel = musicstudio
						qs(0x4f6cdbe0)}
					jam_upload_song_failed \{dialog = 19}
				else
					destroy_dialog_box
					printf \{channel = musicstudio
						qs(0x5677eaa1)}
					jam_upload_song_failed \{dialog = 5}
				endif
				return \{false}
			endif
		endif
		printf \{channel = musicstudio
			qs(0x7d5ab962)}
		if TimeGreaterThan <timeout>
			destroy_dialog_box
			jam_upload_song_failed \{dialog = 19}
			return \{false}
		endif
		wait \{1
			gameframe}
		repeat
	endif
	printf \{channel = musicstudio
		qs(0x64418823)}
	return \{true}
endscript

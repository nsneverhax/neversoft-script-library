jam_signin_upload = 0
jam_signin_manage = 0

script create_jam_publish_song_menu \{new_genre = -1}
	printf channel = jam_publish qs(0x6924c21a) s = <FileName>
	NetSessionFunc \{func = stats_init}
	Change \{target_jam_camera_prop = jam_publish}
	jam_camera_wait
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_publish_song_container}
	spinner_offset = 0
	back_drop_color = [50 50 50 255]
	rot = 0
	header_x = 320
	header_y = 80
	header_foreground_color = <back_drop_color>
	header_background_color = [255 255 255 255]
	make_generic_menu {
		title = qs(0x7ba7b302)
		pad_back_script = jam_publish_song_back_warning
		pad_back_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
		vmenu_id = create_publish_song_menu
	}
	<new_song> = 0
	getsonginfo
	if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
		<new_song> = 1
	endif
	<unmodifiable_color> = [50 50 50 255]
	formatText TextName = Name qs(0x354eaa8f) s = <newfilename>
	if (<new_song> = 1)
		add_generic_menu_text_item {
			text = <Name>
			left_justify
			choose_state = uistate_jam_publish_text_entry
			choose_state_data = {choose_script = jam_name_choose_script text = <newfilename> choose_params = {FileName = <FileName>}}
		}
	else
		add_generic_menu_text_item {
			text = <Name>
			left_justify
			additional_unfocus_script = unfocus_published_data
			additional_unfocus_params = {Color = <unmodifiable_color>}
		}
		<item_container_id> :SetProps generic_menu_smenu_textitem_text_rgba = <unmodifiable_color>
	endif
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	printf channel = jam_mode qs(0x63bb92f7) s = <new_genre>
	GetArraySize \{$jam_genre_list}
	if ((<new_genre> >= 0) && (<new_genre> < <array_Size>))
		formatText TextName = genre qs(0x9761dc34) s = ($jam_genre_list [<new_genre>].name_text)
	else
		formatText \{TextName = genre
			qs(0x9761dc34)
			s = qs(0xd0ef7f05)}
	endif
	if (<new_song> = 1)
		add_generic_menu_text_item {
			text = <genre>
			left_justify
			choose_state = uistate_jam_publish_genre
			choose_state_data = {choose_script = jam_genre_choose_script}
		}
	else
		add_generic_menu_text_item {
			text = <genre>
			left_justify
			additional_unfocus_script = unfocus_published_data
			additional_unfocus_params = {Color = <unmodifiable_color>}
		}
		<item_container_id> :SetProps generic_menu_smenu_textitem_text_rgba = <unmodifiable_color>
	endif
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	getsonginfo
	if (<playback_track1> >= 0)
		formatText TextName = guitar_playback_text qs(0x9f58d214) s = ($jam_tracks [<playback_track1>].name_text)
	else
		formatText \{TextName = guitar_playback_text
			qs(0x4b58976a)}
	endif
	if (<playback_track2> >= 0)
		formatText TextName = bass_playback_text qs(0xdaaba80e) s = ($jam_tracks [<playback_track2>].name_text)
	else
		formatText \{TextName = bass_playback_text
			qs(0x14bdca76)}
	endif
	add_generic_menu_text_item {
		text = <guitar_playback_text>
		left_justify
		choose_state = uistate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 1 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	add_generic_menu_text_item {
		text = <bass_playback_text>
		left_justify
		choose_state = uistate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 2 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	add_generic_menu_text_item {
		icon = icon_jam_preview
		text = qs(0x23e0b711)
		left_justify
		pad_choose_script = jam_preview_song_choose_script
		pad_choose_params = {FileName = <newfilename>}
	}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	add_generic_menu_text_item \{icon = icon_graphics
		text = qs(0x110cf5a6)
		left_justify
		pad_choose_script = jam_album_art_choose_script}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	add_generic_menu_text_item {
		icon = icon_save
		text = qs(0x2e843138)
		left_justify
		pad_choose_script = jam_save_and_quit_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	add_generic_menu_text_item {
		icon = icon_jam_upload
		text = qs(0xe50aaa19)
		left_justify
		pad_choose_script = jam_upload_song_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	add_generic_menu_text_item {
		icon = icon_jam_upload
		text = qs(0xfde202a4)
		left_justify
		pad_choose_script = jam_delete_song_choose_script
		pad_choose_params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	}
	<item_container_id> :SetTags spinner_offset = <spinner_offset>
	jam_publish_draw_album_cover
	LaunchEvent \{Type = focus
		target = current_menu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	if ($jam_signin_upload = 1)
		Change \{jam_signin_upload = 0}
		SpawnScriptNow jam_upload_song_choose_script params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	elseif ($jam_signin_manage = 1)
		Change \{jam_signin_manage = 0}
		SpawnScriptNow jam_delete_song_choose_script params = {genre = <new_genre> FileName = <FileName> newfilename = <newfilename>}
	endif
	if NOT ScreenElementExists \{id = jam_album_cover}
		PushAssetContext context = ($cas_band_logo_details.AssetContext)
		CreateScreenElement {
			Type = SpriteElement
			parent = root_window
			id = jam_album_cover
			texture = ($cas_band_logo_details.textureasset)
			just = [center center]
			rgba = [255 255 255 250]
			Pos = (900.0, 327.0)
			dims = (280.0, 280.0)
			z_priority = -100
		}
		PopAssetContext
	endif
	unblock_invites
	StartRendering
endscript

script unfocus_published_data 
	<id> :SetProps generic_menu_smenu_textitem_text_rgba = <Color>
endscript

script jam_publish_draw_album_cover 
	StopRendering
	cas_update_band_logo \{album_art}
	ensure_band_logo_object_created
	if StructureContains structure = (($editable_jam_album_cover) [0]) base_tex
		setcasappearance appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
				cap = ($editable_jam_album_cover)
			}
		}
	else
		setcasappearance \{appearance = {
				cas_band_logo = {
					desc_id = cas_band_logo_id
				}
			}}
	endif
	Change \{cas_override_object = bandlogoobject}
	bandlogoobject :Obj_SetPosition \{position = (-0.89, 0.76, 16.68)}
	bandlogoobject :Obj_SetOrientation \{Dir = (0.0, 0.0, -1.0)}
	bandlogoobject :SwitchOnAtomic \{cas_band_logo}
	bandlogoobject :Obj_ApplyScaling \{Scale = 1.0}
	bandlogoobject :Obj_SetBoundingSphere \{10.0}
	Wait \{1
		gameframe}
	StartRendering
endscript

script jam_preview_song_choose_script 
	printf \{channel = jam_publish
		qs(0xc66e5c95)}
	create_song_preview_menu FileName = <FileName>
endscript

script jam_album_art_choose_script 
	if ($cas_heap_state = in_cas)
		ScriptAssert \{'Should in in_game heap state!'}
	endif
	casblockforloading
	cas_load_and_setup_resources \{album_art
		no_cam}
	Change \{cas_editing_new_character = FALSE}
	ensure_band_logo_object_created
	if StructureContains structure = (($editable_jam_album_cover) [0]) base_tex
		setcasappearance appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
				cap = ($editable_jam_album_cover)
			}
		}
	else
		setcasappearance \{appearance = {
				cas_band_logo = {
					desc_id = cas_band_logo_id
				}
			}}
	endif
	Change \{cas_override_object = bandlogoobject}
	bandlogoobject :Obj_SetPosition \{position = (-0.89, 0.76, 16.68)}
	bandlogoobject :Obj_SetOrientation \{Dir = (0.0, 0.0, -1.0)}
	bandlogoobject :SwitchOnAtomic \{cas_band_logo}
	bandlogoobject :Obj_ApplyScaling \{Scale = 1.0}
	bandlogoobject :Obj_SetBoundingSphere \{10.0}
	get_savegame_from_controller controller = ($primary_controller)
	ui_event event = menu_change data = {state = uistate_cap_main text = qs(0xdbb8277f) savegame = <savegame> part = cas_band_logo num_icons = 0 album_cover = 1}
	printf \{channel = jam_publish
		qs(0xbeabca70)}
endscript

script jam_go_back_from_album_art 
	KillCamAnim \{all}
	Change \{target_jam_camera_prop = jam_publish}
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Name = jam_view_cam
		viewport = bg_viewport
		controlscript = jam_camera_script
		params = {
			start_camera = jam_publish
		}
		play_hold = 1}
	Change \{jam_view_cam_created = 1}
	if NOT getcasappearance
		ScriptAssert \{qs(0xd09a342c)}
	endif
	if StructureContains structure = (<appearance>.cas_band_logo) cap
		Change editable_jam_album_cover = ((<appearance>.cas_band_logo).cap)
		Change \{editable_jam_album_cover_size = 1}
	endif
	Change \{cas_override_object = None}
	generic_event_back
endscript

script jam_genre_choose_script 
	printf channel = jam_publish qs(0xb4298068) s = <genre>
	setsonginfo genre = <genre>
	ui_event event = menu_back data = {new_genre = <genre>}
endscript

script jam_track_select_choose_script 
	if (<guitar_num> = 1)
		setsonginfo playback_track1 = <track>
	else
		setsonginfo playback_track2 = <track>
	endif
	ui_event \{event = menu_back}
endscript

script jam_upload_song_choose_script 
	if NOT NetSessionFunc \{func = isoldenoughforonline}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	show_ghtunes_connecting_popup
	LaunchEvent \{Type = unfocus
		target = current_menu}
	NetSessionFunc \{func = stats_init}
	NetSessionFunc \{func = live_settings_init}
	printf \{qs(0x128d792e)}
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 jam = 1}
			printf \{qs(0x67a3fecf)}
			return \{FALSE}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			printf \{qs(0xba37c2e1)}
			return \{FALSE}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				destroy_popup_warning_menu
				jam_upload_song_failed \{dialog = 5}
				printf \{qs(0x4794d4c4)}
				return
			endif
		else
			destroy_popup_warning_menu
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 jam = 1}
			printf \{qs(0xda6ebcfc)}
			return
		endif
	endif
	if NOT NetSessionFunc \{func = isoldenoughforonline}
		jam_upload_song_failed \{dialog = 6}
		printf \{qs(0x27cdaad9)}
		return
	endif
	if NOT jam_do_lobby_check_upload
		printf \{qs(0xfa5996f7)}
		return
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		printf \{qs(0x07fa80d2)}
		return
	endif
	if (<genre> < 0)
		jam_upload_song_failed \{dialog = 1}
		printf \{qs(0x1adc40c6)}
		return
	endif
	if ($ghtunes_verified = 0)
		verifyjamusercontent controller = ($primary_controller)
		Block \{Type = verify_jam_user_content}
		printf \{channel = jam_mode
			qs(0x3ba11da7)}
		Change \{ghtunes_verified = 1}
	endif
	if NetSessionFunc \{func = iscableunplugged}
		destroy_popup_warning_menu
		jam_upload_song_failed \{dialog = 5}
		printf \{qs(0xe77f56e3)}
		return
	endif
	if ($ghtunes_killswitch = 1)
		jam_upload_song_failed \{dialog = 16}
		printf \{qs(0x145d3397)}
		return
	endif
	if NOT isacceptablestring string = <newfilename>
		if ((NetSessionFunc func = is_lobby_available) && (NetSessionFunc func = is_ghtunes_lobby_available))
			destroy_popup_warning_menu
			printf channel = jam_publish qs(0x9b3a53e4) s = <newfilename>
			jam_upload_song_failed dialog = 10 FileName = <newfilename>
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 0)
					if NetSessionFunc \{func = iscableunplugged}
						destroy_popup_warning_menu
						jam_upload_song_failed \{dialog = 5}
					endif
					destroy_popup_warning_menu
					jam_upload_song_failed \{dialog = 19}
				else
					destroy_popup_warning_menu
					jam_upload_song_failed \{dialog = 5}
				endif
			endif
		endif
		printf \{qs(0xe9fe25b2)}
		return
	else
		printf channel = jam_publish qs(0x2fb2f934) s = <newfilename>
	endif
	jam_upload_song_dialog \{dialog = 3}
	jamusercanupload controller = ($primary_controller)
	Block \{Type = jam_user_can_upload}
	if (<event_data>.failed = 1)
		if (<event_data>.fail_type = 1)
			jam_upload_song_failed \{dialog = 14}
		else
			jam_upload_song_failed \{dialog = 5}
		endif
		printf \{qs(0x346a199c)}
		return
	endif
	getjamusercontentlist check_showcase controller = ($primary_controller)
	Block \{Type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 16}
	else
		getsonginfo
		<file_id> = (<file_id>.file_id)
		if (((<file_id> [0]) = 0) && ((<file_id> [1]) = 0))
			slot_array = $jam_curr_slot_array
			StopRendering
			generic_event_choose state = uistate_jam_publish_slot data = {choose_script = jam_upload_song_legal_check
				genre = <genre>
				FileName = <FileName>
				newfilename = <newfilename>
				slot_array = <slot_array>}
			jam_upload_song_dialog_destroy
		else
			updatejamusercontent controller = ($primary_controller)
			Block \{Type = update_jam_user_content}
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
	if NOT NetSessionFunc \{func = isoldenoughforonline}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	LaunchEvent \{Type = unfocus
		target = current_menu}
	NetSessionFunc \{func = stats_init}
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 jam = 1 new_data = {manage = 1}}
			return \{FALSE}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{FALSE}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = uistate_jam_publish_signin require_live = 1 jam = 1 new_data = {manage = 1}}
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
	getjamusercontentlist controller = ($primary_controller)
	Block \{Type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 5}
	else
		slot_array = $jam_curr_slot_array
		StopRendering
		generic_event_choose state = uistate_jam_publish_slot data = {choose_script = jam_upload_song_legal_check
			genre = <genre>
			FileName = <FileName>
			newfilename = <newfilename>
			slot_array = <slot_array>
			delete_only}
		jam_upload_song_dialog_destroy
	endif
endscript

script updatejamusercontent_callback 
	broadcastevent Type = update_jam_user_content data = {failed = <fail_type>}
endscript

script updatejamusercontent_failed_callback 
	broadcastevent Type = update_jam_user_content data = {failed = <fail_type>}
endscript

script jam_remove_song_from_slot_check \{slot = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	jam_upload_check_dialog dialog = 1 slot = <slot> genre_chk = <genre_chk>
endscript

script jam_remove_song_from_slot \{slot = 0}
	destroy_popup_warning_menu
	NetSessionFunc \{func = stats_init}
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			jam_upload_song_failed \{dialog = 8}
			return \{FALSE}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{FALSE}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
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
	removejamusercontent controller = ($primary_controller) slot = <slot> genre = <genre_chk>
	Block \{Type = remove_jam_user_content}
	jam_upload_song_dialog_destroy
	printstruct channel = jam_mode ($jam_curr_slot_array)
	printstruct channel = jam_mode ($jam_curr_directory_listing)
	curr_slot_file_id = ($jam_curr_slot_array [<slot>].file_id.file_id)
	GetArraySize ($jam_curr_directory_listing) param = directory_size
	j = 0
	begin
	curr_directory_file_id = ($jam_curr_directory_listing [<j>].fileid.file_id)
	if NOT (<curr_directory_file_id> = 0)
		<curr_directory_file_id> = ($jam_curr_directory_listing [<j>].fileid.file_id)
		if (<curr_slot_file_id> [1] = <curr_directory_file_id> [1])
			if (<curr_slot_file_id> [0] = <curr_directory_file_id> [0])
				StopRendering
				clearjamsession
				jam_recording_create_editable_arrays
				Change memcard_jamsession_file_name = ($jam_curr_directory_listing [<j>].FileName)
				Change \{memcard_after_func = StopRendering}
				ui_memcard_load_jam \{event = menu_replace
					data = {
						state = uistate_jam_publish_update_fileid
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
	getsonginfo
	printstruct channel = jam_mode <file_id>
endscript

script jam_upload_song_legal_check 
	jam_upload_check_dialog dialog = 2 <...>
endscript

script jam_upload_song_to_slot_check \{slot = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	if jam_verify_publishing_rules FileName = <newfilename> slot = <slot>
		if GotParam \{replace}
			jam_upload_check_dialog dialog = 0 slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
		else
			jam_upload_song_to_slot slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
		endif
	endif
endscript

script jam_upload_song_to_slot 
	jam_upload_song_dialog \{dialog = 4}
	NetSessionFunc \{func = stats_init}
	setsonginfo genre = <genre>
	if GotParam \{replace}
		if NOT CheckForSignIn controller_index = ($primary_controller)
			if isps3
				jam_upload_song_failed \{dialog = 8}
				return \{FALSE}
			endif
			if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
				jam_upload_song_failed \{dialog = 5}
				return \{FALSE}
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				if NetSessionFunc \{func = iscableunplugged}
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
		removejamusercontent controller = ($primary_controller) slot = <slot> genre = ($jam_genre_list [<genre>].checksum)
		Block \{Type = remove_jam_user_content}
		jam_upload_song_dialog_destroy
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			jam_upload_song_failed \{dialog = 8}
			return \{FALSE}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			jam_upload_song_failed \{dialog = 5}
			return \{FALSE}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
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
	formatText TextName = newfilename_nonlocal '%s' s = <newfilename>
	addjamusercontent controller = ($primary_controller) slot = <slot> FileName = <newfilename_nonlocal> genre = ($jam_genre_list [<genre>].checksum)
	Block \{Type = add_jam_user_content}
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
	if ((($<notetrack_size>) / 2) >= $ghtunes_minimum_note_count)
		<verified_note_count> = 1
	endif
	<count> = (<count> + 1)
	repeat 5
	if (<verified_note_count> = 0)
		jam_upload_song_failed \{dialog = 2}
		return \{FALSE}
	endif
	if (<last_end_time> < $ghtunes_minimum_song_time)
		jam_upload_song_failed \{dialog = 3}
		return \{FALSE}
	endif
	GetArraySize \{$jam_curr_slot_array}
	index = 0
	begin
	if (($jam_curr_slot_array [<index>].has_content) = 1)
		slot_filename = ($jam_curr_slot_array [<index>].FileName)
		formatText TextName = filename_nonlocal '%s' s = <FileName>
		if (<filename_nonlocal> = <slot_filename>)
			if NOT (<slot> = <index>)
				jam_upload_song_failed \{dialog = 7}
				return \{FALSE}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script addjamusercontent_callback 
	printf \{channel = jam_publish
		qs(0xb79f3d27)}
	broadcastevent \{Type = add_jam_user_content
		data = {
			failed = 0
		}}
endscript

script addjamusercontent_failed_callback 
	printf \{channel = jam_publish
		qs(0xbce15630)}
	broadcastevent \{Type = add_jam_user_content
		data = {
			failed = 1
		}}
endscript

script addjamusercontent_failed_size_callback 
	printf \{channel = jam_publish
		qs(0x7134fb9c)}
	broadcastevent \{Type = add_jam_user_content
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

script getjamusercontentlist_callback 
	printf \{channel = jam_mode
		qs(0x5b6ac636)}
	if GotParam \{is_showcased}
		Change jam_user_is_showcased = <is_showcased>
	else
		Change \{jam_user_is_showcased = 0}
	endif
	Change jam_curr_slot_array = <slot_array>
	broadcastevent \{Type = get_jam_user_content_list
		data = {
			failed = 0
		}}
endscript

script getjamusercontentlist_failed_callback 
	printf \{channel = jam_mode
		qs(0x2c7733a9)}
	Change \{jam_user_is_showcased = 0}
	broadcastevent \{Type = get_jam_user_content_list
		data = {
			failed = 1
		}}
endscript

script jamusercanupload_callback 
	Wait \{1
		Second}
	broadcastevent \{Type = jam_user_can_upload
		data = {
			failed = 0
		}}
endscript

script jamusercanupload_callback_failed 
	Wait \{1
		Second}
	broadcastevent Type = jam_user_can_upload data = {failed = 1 fail_type = <fail_type>}
endscript

script removejamusercontent_callback 
	broadcastevent \{Type = remove_jam_user_content}
endscript

script jam_upload_song_dialog \{dialog = 0
		ghtunes = 0}
	if (<ghtunes> = 0)
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText \{TextName = upload_dialog
			qs(0x3f0d3de7)}
		case 1
		formatText \{TextName = upload_dialog
			qs(0xab3efa6a)}
		case 2
		formatText \{TextName = upload_dialog
			qs(0xb503f9a6)}
		case 3
		formatText \{TextName = upload_dialog
			qs(0xbc410800)}
		case 4
		formatText \{TextName = upload_dialog
			qs(0x487100b3)}
		case 5
		formatText \{TextName = upload_dialog
			qs(0xc1cdb4da)}
	endswitch
	create_popup_warning_menu {
		title = qs(0x5204e0ef)
		textblock = {
			text = <upload_dialog>
		}
	}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	if (<dialog> = 3)
		popup_warning_container :obj_spawnscript \{jam_publish_timeout}
	endif
endscript

script jam_upload_song_dialog_destroy 
	destroy_popup_warning_menu
endscript

script jam_publish_timeout 
	Wait \{20
		Seconds}
	jam_upload_song_failed \{dialog = 5}
endscript

script jam_upload_song_success \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText \{TextName = title
			qs(0x275580df)}
		formatText \{TextName = upload_dialog
			qs(0x4ac404b0)}
		<dialog> = 0
		case 1
		formatText \{TextName = title
			qs(0x2b72c6cd)}
		formatText \{TextName = upload_dialog
			qs(0x7ce4b64a)}
		<dialog> = 1
		case 2
		formatText \{TextName = title
			qs(0x1af40d3a)}
		formatText \{TextName = upload_dialog
			qs(0xbb24e4e3)}
		<dialog> = 0
	endswitch
	destroy_popup_warning_menu
	if (<dialog> = 0)
		create_popup_warning_menu {
			title = <title>
			textblock = {
				text = <upload_dialog>
				Pos = (640.0, 370.0)
			}
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {jam_save_and_quit_choose_script}
					func_params = {dialog = <dialog> FileName = <FileName> newfilename = <newfilename> genre = <genre>}
					text = qs(0x182f0173)
				}
			]
		}
	else
		create_popup_warning_menu {
			title = <title>
			textblock = {
				text = <upload_dialog>
				Pos = (640.0, 370.0)
			}
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {jam_upload_song_success_go_back}
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
		clearjamsession
		generic_event_back \{state = uistate_jam_select_song
			data = {
				show_popup = 0
			}}
		destroy_popup_warning_menu
	else
		generic_event_back
		destroy_popup_warning_menu
	endif
	destroy_generic_menu
endscript

script jam_upload_song_failed \{dialog = 0}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		if isXenon
			upload_dialog = qs(0xab79bf04)
		elseif isps3
			upload_dialog = qs(0x06001e5e)
		endif
		case 1
		upload_dialog = qs(0x4623a4fe)
		case 2
		formatText TextName = text qs(0x5a47560f) s = ($ghtunes_minimum_note_count)
		upload_dialog = <text>
		case 3
		minimum_seconds = ($ghtunes_minimum_song_time / 1000)
		CastToInteger \{minimum_seconds}
		formatText TextName = text qs(0x9757f57d) s = <minimum_seconds>
		upload_dialog = <text>
		case 4
		upload_dialog = qs(0x456ac8da)
		case 5
		upload_dialog = qs(0xb9f3b9df)
		case 6
		if isXenon
			upload_dialog = qs(0x3ec48030)
		elseif isps3
			upload_dialog = qs(0x3541af30)
		endif
		case 7
		upload_dialog = qs(0x7cc9a727)
		case 8
		if isXenon
			upload_dialog = qs(0xab994a63)
		elseif isps3
			upload_dialog = qs(0xeed6e041)
		endif
		case 9
		if isXenon
			upload_dialog = qs(0x24463799)
		elseif isps3
			upload_dialog = qs(0xeed6e041)
		endif
		case 10
		formatText TextName = text qs(0x2970079e) s = <FileName>
		upload_dialog = <text>
		case 11
		upload_dialog = qs(0xac11a184)
		case 12
		upload_dialog = qs(0x05f99039)
		case 13
		if isXenon
			upload_dialog = $lost_network_message_xenon
		elseif isps3
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
		upload_dialog = qs(0xa77d9761)
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x762bc5d2)
		textblock = {
			text = <upload_dialog>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_upload_song_failed_go_back}
				func_params = {dialog = <dialog> <...>}
				text = qs(0x320a8d1c)
			}
		]
		long
	}
endscript

script jam_upload_song_failed_go_back 
	if (<dialog> = 4)
		generic_event_back \{state = uistate_jam_publish_song}
		destroy_popup_warning_menu
	elseif (<dialog> = 2 || <dialog> = 3)
		destroy_popup_warning_menu
		generic_event_back
	elseif (<dialog> = 7 || <dialog> = 18)
		destroy_popup_warning_menu
		generic_event_back
	else
		destroy_popup_warning_menu
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
endscript

script jam_upload_check_dialog \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	NetSessionFunc \{func = stats_init}
	show_ghtunes_connecting_popup
	if NOT jam_do_lobby_check_upload
		return
	endif
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText \{TextName = title
			qs(0xe6cd2b61)}
		formatText TextName = upload_dialog qs(0xd10ce512) s = (<slot> + 1)
		func = jam_upload_song_to_slot
		func_params = {<...> replace}
		case 1
		formatText \{TextName = title
			qs(0x9d4a3853)}
		formatText TextName = upload_dialog qs(0x28fb319a) s = (<slot> + 1)
		func = jam_remove_song_from_slot
		func_params = {<...>}
		case 2
		show_ghtunes_connecting_popup
		jamupdatesubmissionagreement controller = ($primary_controller)
		Block \{Type = verify_update_submission_agreement}
		destroy_popup_warning_menu
		submission_error = 0
		if (<event_data>.failed = 1)
			<submission_error> = 1
		endif
		if NOT GlobalExists \{Name = ghtunes_submission_agreement_array}
			<submission_error> = 1
		else
			GetArraySize \{$ghtunes_submission_agreement_array}
			if (<array_Size> <= 0)
				<submission_error> = 1
			endif
		endif
		if (<submission_error> = 1)
			jam_upload_song_failed \{dialog = 16}
			return
		endif
		ghtunes_show_submission_agreement slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
		return
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <upload_dialog>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_upload_check_dialog_go_back}
				text = qs(0x320a8d1c)
			}
			{
				func = {<func>}
				func_params = <func_params>
				text = qs(0x182f0173)
			}
		]
	}
endscript

script jam_upload_check_dialog_go_back 
	destroy_popup_warning_menu
	add_user_control_helper \{text = qs(0x0307b55c)
		button = start
		z = 100000}
	menu_finish
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script jam_name_choose_script 
	printf channel = jam_publish qs(0xda5d9e2e) s = <text>
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_Size> > 0)
		index = 0
		begin
		if ((<directorylisting> [<index>].FileName) = <text>)
			if NOT (<text> = <FileName>)
				jam_rename_song_failed dialog = 0 <...>
				return
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	ui_event event = menu_back data = {FileName = <FileName> newfilename = <text>}
endscript

script jam_rename_song_failed \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText \{TextName = dialog
			qs(0x4f3d7ad7)}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0xbc9950cd)
		textblock = {
			text = <dialog>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_rename_song_failed_go_back}
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_rename_song_failed_go_back 
	destroy_popup_warning_menu
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
				state = uistate_jam_select_song
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
			state = uistate_jam_select_song
			show_popup = 0
		}}
endscript

script jam_publish_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0xaa163738)
		no_background
		textblock = {
			text = qs(0xe861caa9)
		}
		options = [
			{
				func = {jam_publish_song_back_cancel}
				func_params = {}
				text = qs(0xf7723015)
			}
			{
				func = {jam_save_and_quit_choose_script}
				func_params = {dialog = <dialog> FileName = <FileName> newfilename = <newfilename> genre = <genre>}
				text = qs(0xb2415b7d)
			}
			{
				func = {jam_publish_song_back_no_save}
				func_params = {}
				text = qs(0x06d0b6b0)
			}
		]
	}
endscript

script jam_publish_song_back_cancel 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script jam_publish_song_back_no_save 
	destroy_popup_warning_menu
	jam_publish_song_back
endscript

script jam_publish_song_back 
	jam_publish_unload
	generic_event_back \{state = uistate_jam_select_song
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
	KillSpawnedScript \{id = jam_publish_song_spawns}
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
	SpawnScriptNow \{ui_create_jam_publish_signin_spawned}
endscript

script ui_create_jam_publish_signin_spawned 
	Wait \{5
		gameframes}
	generic_event_back \{params = {
			state = uistate_jam_publish_song
		}}
endscript

script jam_do_lobby_check_upload 
	printf \{qs(0xc820e0be)}
	if NOT NetSessionFunc \{func = is_ghtunes_lobby_available}
		printf \{qs(0xf2441f97)}
		Wait \{1
			gameframe}
		<timeout> = 20.0
		ResetTimer
		begin
		if NetSessionFunc \{func = iscableunplugged}
			jam_upload_song_failed \{dialog = 5}
		endif
		if NetSessionFunc \{func = is_ghtunes_lobby_available}
			destroy_popup_warning_menu
			break
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 0)
					if NetSessionFunc \{func = iscableunplugged}
						jam_upload_song_failed \{dialog = 5}
					endif
					destroy_popup_warning_menu
					jam_upload_song_failed \{dialog = 19}
				else
					destroy_popup_warning_menu
					jam_upload_song_failed \{dialog = 5}
				endif
				return \{FALSE}
			endif
		endif
		if TimeGreaterThan <timeout>
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 5}
			return \{FALSE}
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	printf \{qs(0x68cc4a00)}
	return \{true}
endscript

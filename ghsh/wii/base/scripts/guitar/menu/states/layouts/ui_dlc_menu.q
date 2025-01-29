ui_dlc_should_restore_network_game = 0
ui_dlc_needs_setup = 0
ui_dlc_menu_submenu = first
ui_dlc_we_disabled_hb = 0

script ui_init_dlc_menu 
	SpawnScriptLater \{menu_music_off}
	Change \{ui_dlc_menu_submenu = first}
	Change \{ui_dlc_needs_setup = 1}
	Change ui_dlc_should_restore_network_game = ($is_network_game)
	get_home_button_allowed
	Change ui_dlc_we_disabled_hb = (1 - <disabled>)
	set_home_button_notallowed
	Change \{is_network_game = 0}
endscript

script ui_deinit_dlc_menu 
	SpawnScriptLater \{menu_music_on}
	SpawnScriptLater \{dlc_deinitialize}
endscript
ui_dlc_dwc_check_popup_frame_count = 0

script ui_dlc_poll_dwc 
	Wait \{4
		gameframes}
	begin
	if ScreenElementExists \{id = generic_popupelement}
		Change \{ui_dlc_dwc_check_popup_frame_count = 0}
	elseif ($ui_dlc_dwc_check_popup_frame_count < 4)
		Change ui_dlc_dwc_check_popup_frame_count = ($ui_dlc_dwc_check_popup_frame_count + 1)
	elseif NOT dlcisdwcokay
		dlc_handle_error error_text = (qs(0x09b62e0f)) fatal = 1
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script ui_create_dlc_menu 
	getactiveprofilename
	formatText TextName = profile_name_text qs(0x73307931) s = <profile_name>
	CreateScreenElement {
		parent = root_window
		id = dlc_base_interface
		Type = descinterface
		desc = 'DLC_Base_Menu'
		exclusive_device = ($primary_controller)
		username_text = <profile_name_text>
		albumcover_texture = dlc_generic_album
		musicstore_text = qs(0xa8e9637f)
		availabletext_text = qs(0x00000000)
		availablelabel_text = qs(0x00000000)
		submenu_label_text = qs(0x00000000)
		notebook_bg_texture = dlc_notebook_bg_main
	}
	RunScriptOnScreenElement \{id = dlc_base_interface
		ui_dlc_poll_dwc}
	if dlc_base_interface :desc_resolvealias \{Name = alias_patchsplat}
		AssignAlias id = <resolved_id> alias = dlc_patchsplat
	endif
	if dlc_base_interface :desc_resolvealias \{Name = alias_submenudesc}
		AssignAlias id = <resolved_id> alias = dlc_submenu
		if ($ui_dlc_menu_submenu = first)
			ui_dlc_menu_setup_first_menu
		else
			ui_dlc_menu_setup_second_menu num = ($dlc_current_secondary_menu)
		endif
	endif
	if (($ui_dlc_needs_setup) = 1)
		SpawnScriptLater \{dlc_setup}
	endif
endscript

script ui_dlc_menu_setup_first_menu 
	Change \{ui_dlc_menu_submenu = first}
	SpawnScriptNow ui_dlc_menu_setup_first_menu_spawned params = <...>
endscript

script ui_dlc_menu_setup_first_menu_spawned 
	clean_up_user_control_helpers
	ui_dlc_move_splat
	dlc_base_interface :se_setprops \{notebook_bg_texture = dlc_notebook_bg_main
		availabletext_text = qs(0x00000000)
		availablelabel_text = qs(0x00000000)
		submenu_label_text = qs(0x00000000)}
	dlc_submenu :se_setprops {
		desc = 'DLC_First_Menu'
		motd_header_text = qs(0x6043e467)
		motd_message_text = ($message_of_the_day)
		license_message_text = qs(0xfcc7d7f7)
		setlist_label_text = qs(0x16e58719)
		store_label_text = qs(0x8d3e932e)
		newreleases_label_text = qs(0x65413caf)
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	add_user_control_helper \{text = qs(0xe678814d)
		button = orange
		z = 100}
	if dlc_submenu :desc_resolvealias \{Name = alias_selectionhighlight}
		AssignAlias id = <resolved_id> alias = selectionhighlight
	endif
	if dlc_submenu :desc_resolvealias \{Name = alias_mainmenu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					generic_event_back
				}
				{
					pad_up
					generic_menu_up_or_down_sound
				}
				{
					pad_down
					generic_menu_up_or_down_sound
				}
				{
					pad_L1
					ui_dlc_goto_rock_archive
				}
			]}
		AssignAlias \{alias = tmprowitem
			id = {
				current_menu
				child = 0
			}}
		tmprowitem :se_setprops \{event_handlers = [
				{
					pad_choose
					ui_dlc_menu_setup_second_menu
					params = {
						num = 0
					}
				}
				{
					focus
					ui_first_menu_focus
				}
				{
					unfocus
					ui_first_menu_unfocus
				}
			]}
		AssignAlias \{alias = tmprowitem
			id = {
				current_menu
				child = 1
			}}
		tmprowitem :se_setprops \{event_handlers = [
				{
					pad_choose
					ui_dlc_menu_setup_second_menu
					params = {
						num = 1
					}
				}
				{
					focus
					ui_first_menu_focus
				}
				{
					unfocus
					ui_first_menu_unfocus
				}
			]}
		AssignAlias \{alias = tmprowitem
			id = {
				current_menu
				child = 2
			}}
		tmprowitem :se_setprops \{event_handlers = [
				{
					pad_choose
					ui_dlc_menu_setup_second_menu
					params = {
						num = 2
					}
				}
				{
					focus
					ui_first_menu_focus
				}
				{
					unfocus
					ui_first_menu_unfocus
				}
			]}
	endif
	Change \{dlc_last_focus_id = 0}
	dlc_resetpreview
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = $dlc_current_secondary_menu
		}}
endscript

script ui_dlc_goto_rock_archive 
	if (($ui_dlc_needs_setup) = 1)
		return
	endif
	generic_event_choose \{state = uistate_rock_archive}
endscript

script ui_first_menu_focus 
	Obj_GetID
	AssignAlias alias = tmptextitem id = {<objID> child = 0}
	selectionhighlight :se_setprops alpha = 1 Pos = (0.0, 0.0) parent = <objID> just = [left , center] pos_anchor = [left , center]
endscript

script ui_first_menu_unfocus 
endscript

script ui_dlc_menu_setup_second_menu 
	Change \{ui_dlc_menu_submenu = Second}
	SpawnScriptNow ui_dlc_menu_setup_second_menu_spawned params = <...>
endscript
dlc_menu_list = [
	'New_Releases'
	'Store'
	'Set_List'
]
dlc_splat_pos_list = [
	(-94.0, -5.0)
	(11.0, -0.5)
	(85.0, 0.0)
]
dlc_splat_rot_list = [
	0
	165
	-5
]
dlc_current_secondary_menu = -1

script ui_dlc_menu_setup_second_menu_spawned 
	if (($ui_dlc_needs_setup) = 1)
		return
	endif
	Change \{dlc_last_focus_song_index = -1}
	dlc_make_helpers
	dlc_submenu :se_setprops \{desc = 'DLC_Second_Menu'
		songinfoleft_text = qs(0x00000000)
		songinforight_text = qs(0x00000000)
		sorttext_text = qs(0x00000000)
		songinfoname_text = qs(0x00000000)
		songinfoartist_text = qs(0x00000000)}
	dlc_set_sort_mode_text
	if dlc_submenu :desc_resolvealias \{Name = alias_menu_container}
		AssignAlias id = <resolved_id> alias = dlc_menu_container
	endif
	if dlc_submenu :desc_resolvealias \{Name = alias_selectionhighlight}
		AssignAlias id = <resolved_id> alias = selectionhighlight
	endif
	Change dlc_current_secondary_menu = <num>
	ui_dlc_move_splat num = <num>
	ExtendCrc ui_dlc_menu_setup_ ($dlc_menu_list [<num>]) out = setup_func
	ExtendCrc dlc_notebook_bg_ ($dlc_menu_list [<num>]) out = bg_texture
	dlc_base_interface :se_setprops {
		notebook_bg_texture = <bg_texture>
	}
	<setup_func>
	dlc_resetpreview
	dlc_refresh_song_list
endscript

script ui_dlc_menu_toggle_secondary_menu 
	Change \{dlc_last_focus_song_index = -1}
	dlc_resetpreview
	<num> = ($dlc_current_secondary_menu + 1)
	if (<num> > 2)
		<num> = 0
	endif
	Change dlc_current_secondary_menu = <num>
	Change \{dlc_last_focus_id = 0}
	ui_dlc_move_splat num = <num>
	ExtendCrc ui_dlc_menu_setup_ ($dlc_menu_list [<num>]) out = setup_func
	ExtendCrc dlc_notebook_bg_ ($dlc_menu_list [<num>]) out = bg_texture
	dlc_base_interface :se_setprops {
		notebook_bg_texture = <bg_texture>
	}
	<setup_func>
	dlc_refresh_song_list
endscript

script ui_dlc_menu_setup_new_releases 
	dlc_base_interface :se_setprops \{submenu_label_text = qs(0x65413caf)}
	dlc_submenu :se_setprops {
		songinfoleft_text = (qs(0xbd1aae8f))
	}
endscript

script ui_dlc_menu_setup_store 
	dlc_base_interface :se_setprops \{submenu_label_text = qs(0x8d3e932e)}
	dlc_submenu :se_setprops {
		songinfoleft_text = (qs(0xbd1aae8f))
	}
endscript

script ui_dlc_menu_setup_set_list 
	dlc_base_interface :se_setprops \{submenu_label_text = qs(0x16e58719)}
	dlc_submenu :se_setprops {
		songinfoleft_text = (qs(0x0d9d81a8))
	}
	if cntsdiscardpresent
		cntsdcardwasejected
		if dlc_enumerate_sd
			Change \{dlc_menu_sd_indices_valid = 1}
		else
			Change \{dlc_menu_sd_indices_valid = 0}
			Change \{dlc_menu_sd_indices = {
				}}
		endif
	else
		cntsdcardwasejected
		Change \{dlc_menu_sd_indices_valid = 0}
		Change \{dlc_menu_sd_indices = {
			}}
	endif
endscript

script ui_destroy_dlc_menu 
	dlc_resetpreview
	dlc_destroy_popup
	DestroyScreenElement \{id = dlc_base_interface}
	clean_up_user_control_helpers
endscript

script ui_dlc_move_splat \{num = -1}
	if ScreenElementExists \{id = dlc_patchsplat}
		RunScriptOnScreenElement id = dlc_patchsplat ui_dlc_move_splat_spawned params = {num = <num>}
	endif
endscript

script ui_dlc_move_splat_spawned 
	se_setprops \{Scale = (0.25, 0.25)
		time = 0.075}
	se_waitprops
	if (<num> < 0)
		se_setprops \{alpha = 0}
		return
	endif
	se_setprops {
		Pos = ($dlc_splat_pos_list [<num>])
		rot_angle = ($dlc_splat_rot_list [<num>])
		alpha = 1
	}
	se_setprops \{Scale = (1.0, 1.0)
		time = 0.075}
	se_waitprops
endscript

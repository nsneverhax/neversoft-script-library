
script ui_create_hall_of_records 
	SpawnScriptNow \{audio_ui_menu_music_on
		params = {
			Unpause
		}}
	Change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement \{parent = root_window
		id = hor_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				hall_of_records_back
			}
		]}
	mainmenu_setup_physics_elements \{screen_id = hor_menu_id}
	current_menu :se_setprops \{loop_view = FALSE
		loop_center = FALSE}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = hor_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = hor_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = hor_menu_id
		}}
	mainmenu_setup_option \{back_script = hall_of_records_back
		menu_item_text = qs(0xd3cd2799)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
		not_focusable}
	mainmenu_setup_option \{back_script = hall_of_records_back
		menu_item_text = qs(0x4dfc41db)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
		not_focusable}
	mainmenu_setup_option \{back_script = hall_of_records_back
		menu_item_text = qs(0x9882324e)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
		not_focusable}
	mainmenu_setup_option \{choose_state = uistate_bonus_videos
		back_script = hall_of_records_back
		menu_item_text = qs(0x9560fb22)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{back_script = hall_of_records_back
		menu_item_text = qs(0x29b727d2)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
		not_focusable}
	<achievements_text> = qs(0x2be0ec23)
	if isps3
		<0xaef51a91> = qs(0xddd9b5d4)
	endif
	mainmenu_setup_option {
		back_script = hall_of_records_back
		menu_item_text = <achievements_text>
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
		not_focusable
	}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = current_menu}
	StartRendering
	SpawnScriptNow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript

script ui_destroy_hall_of_records 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = hor_menu_id}
		DestroyScreenElement \{id = hor_menu_id}
	endif
endscript

script hall_of_records_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

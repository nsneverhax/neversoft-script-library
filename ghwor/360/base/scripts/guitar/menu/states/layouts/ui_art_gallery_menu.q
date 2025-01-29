
script ui_create_art_gallery_menu 
	Change \{respond_to_signin_changed = 1}
	Change \{rich_presence_context = presence_art_galleries}
	SpawnScriptNow \{audio_ui_menu_music_on}
	uistack_createboundscreenelement {
		parent = root_window
		id = art_gallery_menu_id
		Type = descinterface
		desc = 'mainmenu'
		exclusive_device = ($primary_controller)
		tags = {
			current_gallery_pak = None
		}
		event_handlers = [
			{pad_back art_gallery_menu_back}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x67ef7413)
	}
	attempt_to_add_friend_feed \{parent_id = art_gallery_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = art_gallery_menu_id}
	current_menu :se_setprops \{loop_view = FALSE
		loop_center = FALSE}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = art_gallery_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = art_gallery_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = art_gallery_menu_id
		}}
	GetArraySize ($g_bonus_art_galleries)
	if (<array_Size> > 0)
		gallery_index = 0
		begin
		gallery_struct = ($g_bonus_art_galleries [<gallery_index>])
		lock_params = {}
		<menu_item_text> = (<gallery_struct>.text_desc)
		if art_gallery_is_locked gallery_id = (<gallery_struct>.id)
			lock_params = {not_focusable}
			<menu_item_text> = qs(0x24a08263)
		endif
		mainmenu_setup_option {
			choose_script = art_gallery_choose_gallery
			choose_params = {gallery_struct = <gallery_struct>}
			back_script = art_gallery_menu_back
			menu_item_text = <menu_item_text>
			screen_id = art_gallery_menu_id
			helper_text = qs(0x03ac90f0)
			<lock_params>
		}
		gallery_index = (<gallery_index> + 1)
		repeat <array_Size>
	endif
	main_menu_finalize
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_art_gallery_menu 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = art_gallery_menu_id}
		DestroyScreenElement \{id = art_gallery_menu_id}
	endif
endscript

script art_gallery_menu_back 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	mainmenu_animate \{id = art_gallery_menu_id
		block_events = 1}
	ui_event_add_params \{play_anim_out = 0}
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script art_gallery_is_locked \{gallery_id = !q1768515945}
	getsavegamefromcontroller controller = ($primary_controller)
	GetArraySize ($g_bonus_art_galleries)
	i = 0
	begin
	GetGlobalTags savegame = <savegame> <gallery_id>
	if (<unlocked> = 0)
		return \{true}
	else
		return \{FALSE}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script art_gallery_choose_gallery \{gallery_struct = 0x69696969}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	mainmenu_animate \{id = art_gallery_menu_id
		block_events = 1}
	ui_event_add_params \{play_anim_out = 0}
	destroy_friend_feed
	generic_event_choose state = uistate_art_gallery data = {pakname = (<gallery_struct>.pak) gallery_struct = <gallery_struct>}
endscript

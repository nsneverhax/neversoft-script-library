
script create_tutorial_select_menu 
	Change \{rich_presence_context = presence_menus}
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	if ((<allowances> = drum) || (<allowances> = rb_drum))
		if isrbdrum \{controller = $primary_controller}
			create_popup_warning_menu \{no_background
				title = qs(0x388cd3db)
				textblock = {
					text = qs(0x97d50180)
				}
				options = [
					{
						func = tutorials_event_back
						text = qs(0x320a8d1c)
						no_sound
					}
				]}
			return
		endif
	endif
	make_generic_menu \{title = qs(0xc6510dd1)
		pad_back_script = tutorials_event_back
		vmenu_id = tutorial_select_menu}
	generic_menu :se_setprops \{vmenu_spacing_between = -10}
	if generic_menu :desc_resolvealias \{Name = alias_generic_menu_smenu
			param = generic_smenu}
		<generic_smenu> :SetTags treat_not_focusable_as_header
		<generic_smenu> :se_setprops Pos = {relative (20.0, 0.0)}
	endif
	GetArraySize \{$tutorial_lessons}
	<total_size> = <array_Size>
	<i> = 0
	begin
	<lessons> = ($tutorial_lessons [<i>])
	ForEachIn <lessons> do = add_lesson_menu_item params = {allowances = <allowances> lesson = <i>}
	<i> = (<i> + 1)
	repeat <total_size>
	menu_finish
	LaunchEvent \{Type = focus
		target = current_menu}
	current_menu :Obj_SpawnScriptNow menu_tutorial_select_check_disconnected_controllers params = {allowances = <allowances>}
endscript

script menu_tutorial_select_check_disconnected_controllers 
	<my_allowances> = <allowances>
	begin
	check_tutorial_allowances
	if NOT (<my_allowances> = <allowances>)
		destroy_tutorial_select_menu
		create_tutorial_select_menu allowances = <allowances>
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script destroy_tutorial_select_menu 

	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	generic_ui_destroy
	destroy_generic_menu
	clean_up_user_control_helpers
endscript
tutorial_lessons = [
	$guitar_lessons
	$drum_lessons
	$vocals_lessons
	$band_lessons
]
guitar_lessons = [
	{
		text = qs(0x14aded97)
		item = 'basic'
		focusable = -1
	}
	{
		text = qs(0xc2c32aa4)
		item = 'basic'
	}
	{
		text = qs(0x371c93c9)
		item = 'star_power'
	}
	{
		text = qs(0xe47db24a)
		item = 'advanced_techniques'
	}
	{
		text = qs(0x323949fa)
		item = 'new_features'
	}
	{
		text = qs(0xdfa3757d)
		item = 'versus'
	}
]
drum_lessons = [
	{
		text = qs(0x58bf794f)
		item = 'basic'
		focusable = -1
	}
	{
		text = qs(0xc2c32aa4)
		item = 'drum_basic'
	}
	{
		text = qs(0x500e1674)
		item = 'drum_int'
	}
]
vocals_lessons = [
	{
		text = qs(0x97626cf4)
		item = 'basic'
		focusable = -1
	}
	{
		text = qs(0x1b9f6f84)
		item = 'vocals'
	}
]
band_lessons = [
	{
		text = qs(0xdabf99c0)
		item = 'band'
	}
]

script add_lesson_menu_item \{focusable = 1}
	<needs_mic> = 0
	if NOT (<focusable> = -1)
		if (<lesson> = 0)
			if NOT (<allowances> = guitar || <allowances> = all)
				<focusable> = 0
			endif
		elseif (<lesson> = 1)
			if NOT (<allowances> = drum || <allowances> = all)
				<focusable> = 0
			endif
		elseif (<lesson> = 2)
			<needs_mic> = 1
			if NOT (<allowances> = vocals || <allowances> = all)
				<focusable> = 0
			endif
		endif
	endif
	formatText checksumName = lesson_tag '%i_lesson' i = <item>
	GetGlobalTags \{training}
	if ((<...>.<lesson_tag>) = complete)
		<icon> = Options_Controller_Check
	else
		<icon> = Options_Controller_X
	endif
	if (<focusable> = 1)
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			pad_choose_script = menu_tutorial_select_choose
			pad_choose_params = {item = <item> needs_mic = <needs_mic>}
		}
		<item_container_id> :se_setprops generic_menu_smenu_iconitem_text_pos = {relative (-15.0, 0.0)}
		<item_container_id> :se_setprops generic_menu_smenu_iconitem_container_pos = {relative (0.0, -5.0)}
	elseif (<focusable> = 0)
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			not_focusable
		}
		<item_container_id> :se_setprops generic_menu_smenu_iconitem_text_pos = {relative (-15.0, 0.0)}
		<item_container_id> :se_setprops generic_menu_smenu_iconitem_container_pos = {relative (0.0, -5.0)}
	else
		add_generic_menu_text_item {
			icon = empty
			text = <text>
			not_focusable
			header_text
			internal_just = [left center]
		}
	endif
endscript

script menu_tutorial_select_choose \{item = basic
		needs_mic = 0}
	if (<needs_mic> = 1)
		ui_get_controller_parts_allowed \{controller = $primary_controller}


		if NOT StructureContains structure = <allowed> vocals
			LaunchEvent \{Type = unfocus
				target = current_menu}
			if isXenon
				text = qs(0xec4dbd17)
			else
				text = qs(0xe2f3f704)
			endif
			create_popup_warning_menu {
				no_background
				title = qs(0xaa163738)
				textblock = {
					text = <text>
				}
				options = [
					{
						func = {ui_event}
						func_params = {event = menu_refresh}
						text = qs(0x0e41fe46)
					}
				]
			}
			return
		endif
	endif
	formatText checksumName = tutorial_script 'training_%i_tutorial_script' i = <item>
	Change \{rich_presence_context = presence_tutorial}
	set_training_script Name = <tutorial_script>
	formatText checksumName = 0xb03126b4 'uistate_play_tutorial_%i' i = <item>
	generic_event_choose state = <0xb03126b4>
endscript

script tutorials_event_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	current_menu :Obj_KillSpawnedScript \{Name = menu_tutorial_select_check_disconnected_controllers}
	se_setprops \{block_events}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	Change \{in_tutorial_mode = 0}
	0xf7e0f992 \{Wait}
	destroy_band
	destroy_bandname_viewport
	frontend_load_soundcheck
	destroy_loading_screen
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		create_loading_screen \{destroy_state = 'gig_posters'}
		break
	endif
	i = (<i> + 1)
	repeat <stack_size>
	generic_event_back \{data = {
			pass_to_gigboard = true
		}
		no_sound}
endscript

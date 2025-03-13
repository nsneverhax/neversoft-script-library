
script create_tutorial_select_menu 
	change \{rich_presence_context = presence_tutorial}
	if screenelementexists \{id = dialog_box_container}
		destroy_dialog_box
	endif
	if (<allowances> = drum)
		if isrbdrum \{controller = $primary_controller}
			create_dialog_box \{no_background
				heading_text = qs(0x388cd3db)
				body_text = qs(0x97d50180)
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
	if generic_menu :desc_resolvealias \{name = alias_generic_menu_smenu
			param = generic_smenu}
		<generic_smenu> :settags treat_not_focusable_as_header
	endif
	getarraysize \{$tutorial_lessons}
	<total_size> = <array_size>
	<i> = 0
	begin
	<lessons> = ($tutorial_lessons [<i>])
	foreachin <lessons> do = add_lesson_menu_item params = {allowances = <allowances> lesson = <i>}
	<i> = (<i> + 1)
	repeat <total_size>
	menu_finish
	launchevent \{type = focus
		target = current_menu}
	current_menu :obj_spawnscriptnow menu_tutorial_select_check_disconnected_controllers params = {allowances = <allowances>}
endscript

script menu_tutorial_select_check_disconnected_controllers 
	<my_allowances> = <allowances>
	begin
	check_tutorial_allowances \{allow_rb_drums = 0}
	if NOT (<my_allowances> = <allowances>)
		destroy_tutorial_select_menu
		create_tutorial_select_menu allowances = <allowances>
		return
	endif
	wait \{10
		gameframes}
	repeat
endscript

script destroy_tutorial_select_menu 
	printf \{channel = newdebug
		qs(0xa8f2b97f)}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if screenelementexists \{id = dialog_box_container}
		destroy_dialog_box
	endif
	generic_ui_destroy
	destroy_generic_menu
	clean_up_user_control_helpers
endscript
tutorial_lessons = [
	$guitar_lessons
	$drums_lessons
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
		item = 'guitar_basic'
	}
	{
		text = qs(0x371c93c9)
		item = 'guitar_star_power'
	}
	{
		text = qs(0xe47db24a)
		item = 'guitar_advanced'
	}
	{
		text = qs(0x323949fa)
		item = 'guitar_new_features'
	}
	{
		text = qs(0xdfa3757d)
		item = 'versus'
	}
]
drums_lessons = [
	{
		text = qs(0x58bf794f)
		item = 'basic'
		focusable = -1
	}
	{
		text = qs(0xc2c32aa4)
		item = 'drums_basic'
	}
	{
		text = qs(0x500e1674)
		item = 'drums_intermediate'
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
		formattext checksumname = lesson_tag 'tutorial_lessons_%i' i = <item>
		getglobaltags \{tutorials}
		if ((<...>.<lesson_tag>) = complete)
			<icon> = tutorial_complete
		else
			<icon> = tutorial_incomplete
		endif
	endif
	if (<focusable> = 1)
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			pad_choose_script = menu_tutorial_select_choose
			pad_choose_params = {item = <item> needs_mic = <needs_mic>}
		}
	elseif (<focusable> = 0)
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			not_focusable
		}
	else
		add_generic_menu_icon_item {
			icon = empty
			text = <text>
			not_focusable
			header_text
		}
	endif
endscript

script menu_tutorial_select_choose \{item = basic
		needs_mic = 0}
	if (<needs_mic> = 1)
		ui_get_controller_parts_allowed \{controller = $primary_controller}
		audio_ui_menu_music_off \{pause}
		printf \{channel = sfx
			qs(0x0841284e)}
		printf \{'menu_tutorial_select_choose'}
		printstruct <...>
		if NOT structurecontains structure = <allowed> vocals
			launchevent \{type = unfocus
				target = current_menu}
			if isxenonorwindx
				text = qs(0xec4dbd17)
			else
				text = qs(0x588788f4)
			endif
			create_dialog_box {
				no_background
				heading_text = qs(0xaa163738)
				body_text = <text>
				options = [
					{
						func = ui_event
						func_params = {event = menu_refresh}
						text = qs(0x0e41fe46)
					}
				]
			}
			return
		endif
	endif
	formattext checksumname = tutorial_script 'tutorial_lessons_%i_script' i = <item>
	set_tutorial_script name = <tutorial_script>
	ui_sfx \{menustate = generic
		uitype = select}
	generic_event_choose \{state = uistate_play_tutorial}
endscript

script tutorials_event_back 
	ui_sfx \{menustate = generic
		uitype = back}
	ui_event_get_stack
	generic_event_back \{data = {
			pass_to_gigboard = true
		}}
endscript

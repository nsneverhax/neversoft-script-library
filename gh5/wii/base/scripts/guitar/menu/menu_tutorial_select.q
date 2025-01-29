
script create_tutorial_select_menu 
	Change \{rich_presence_context = presence_tutorial}
	if ScreenElementExists \{id = dialog_box_container}
		destroy_dialog_box
	endif
	if (<allowances> = drum)
		if isrbdrum \{controller = $primary_controller}
			create_dialog_box \{no_background
				heading_text = qs(0x388cd3db)
				body_text = qs(0x97d50180)
				options = [
					{
						func = create_tutorial_select_men
						func_params = {
							allowances = not_specific
						}
						text = qs(0x0e41fe46)
					}
				]}
			return
		endif
	endif
	make_generic_menu \{title = qs(0xc6510dd1)
		pad_back_script = tutorials_event_back
		vmenu_id = tutorial_select_menu}
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
	current_menu :obj_spawnscript \{pollformic}
endscript

script destroy_tutorial_select_menu 
	printf \{channel = newdebug
		qs(0xa8f2b97f)}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ScreenElementExists \{id = dialog_box_container}
		destroy_dialog_box
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
	$versus_lessons
]
guitar_lessons = [
	{
		text = $wii_guitar_basics
		item = 'basic'
	}
	{
		text = $wii_guitar_star_power
		item = 'star_power'
	}
	{
		text = $wii_advanced_guitar
		item = 'advanced_techniques'
	}
	{
		text = $wii_new_guitar_bass
		item = 'new_features'
	}
]
drum_lessons = [
	{
		text = $wii_drum_basics
		item = 'drum_basic'
	}
	{
		text = $wii_intermediate_drums
		item = 'drum_int'
	}
]
vocals_lessons = [
	{
		text = $wii_vocals_lessons
		item = 'vocals'
	}
]
band_lessons = [
	{
		text = $wii_band_lessons
		item = 'band'
	}
]
versus_lessons = [
	{
		text = $wii_versus_lessons
		item = 'versus'
	}
]

script add_lesson_menu_item 
	<focusable> = 1
	if (<lesson> = 0 || <lesson> = 4)
		if NOT (<allowances> = guitar || <allowances> = all)
			<focusable> = 0
		endif
		<state> = uistate_play_tutorial_guitar
	elseif (<lesson> = 1)
		if NOT (<allowances> = drum || <allowances> = all)
			<focusable> = 0
		endif
		<state> = uistate_play_tutorial_drum
	elseif (<lesson> = 2)
		if NOT (<allowances> = vocals || <allowances> = all)
			<focusable> = 0
		endif
		<state> = uistate_play_tutorial_vocals
	else
		<state> = uistate_play_tutorial_vocals
	endif
	formatText checksumName = lesson_tag '%i_lesson' i = <item>
	GetGlobalTags \{training}
	if ((<...>.<lesson_tag>) = complete)
		<icon> = tutorial_complete
	else
		<icon> = tutorial_incomplete
	endif
	if (<focusable> = 1)
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			pad_choose_script = menu_tutorial_select_choose
			pad_choose_params = {item = <item> choose_state = <state>}
		}
	else
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			not_focusable
		}
	endif
endscript

script menu_tutorial_select_choose \{item = basic
		needs_mic = 0}
	if (<needs_mic> = 1)
		ui_get_controller_parts_allowed \{controller = $primary_controller}
		menu_music_off \{Pause}
		printf \{channel = sfx
			qs(0x0841284e)}
		printf \{'menu_tutorial_select_choose'}
		printstruct <...>
		if NOT StructureContains structure = <allowed> vocals
			LaunchEvent \{Type = unfocus
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
	formatText checksumName = tutorial_script 'training_%i_tutorial_script' i = <item>
	set_training_script Name = <tutorial_script>
	generic_event_choose state = <choose_state>
endscript

script tutorials_event_back 
	generic_event_back \{data = {
			pass_to_gigboard = true
		}}
endscript

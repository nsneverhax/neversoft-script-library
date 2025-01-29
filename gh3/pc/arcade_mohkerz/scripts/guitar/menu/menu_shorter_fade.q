shorter_fade_text_color = [
	255
	255
	255
	255
]
shorter_fade_text_dropshadow_color = [
	0
	0
	0
	255
]
shorter_fade_text_highlight_color = [
	230
	171
	60
	255
]
shorter_fade_text_warning_color = [
	205
	60
	60
	255
]
shorter_fade_text_warning_root = (375.0, 450.0)
shorter_fade_default_time_choices = [
	60000.0
	75000.0
	90000.0
	105000.0
	120000.0
	135000.0
	150000.0
	165000.0
	180000.0
	88888890.0
]
shorter_fade_default_time_choice_strings = [
	"1:00"
	"1:15"
	"1:30"
	"1:45"
	"2:00"
	"2:15"
	"2:30"
	"2:45"
	"3:00"
	"Off"
]
shorter_fade_menuItems = [
	{
		text = "Song Fading Enabled"
		handler = shorter_fade_option_handler
		option = 0
		needRestart = 0
		choices = [
			0
			1
		]
	}
	{
		text = "Beginner fade time"
		handler = shorter_fade_option_handler
		option = 0
		needRestart = 0
		choices = [
			60000.0
			75000.0
			90000.0
			105000.0
			120000.0
			135000.0
			150000.0
			165000.0
			180000.0
			88888890.0
		]
	}
	{
		text = "Easy fade time"
		handler = shorter_fade_option_handler
		option = 0
		needRestart = 0
		choices = [
			60000.0
			75000.0
			90000.0
			105000.0
			120000.0
			135000.0
			150000.0
			165000.0
			180000.0
			88888890.0
		]
	}
	{
		text = "Medium fade time"
		handler = shorter_fade_option_handler
		option = 0
		needRestart = 0
		choices = [
			60000.0
			75000.0
			90000.0
			105000.0
			120000.0
			135000.0
			150000.0
			165000.0
			180000.0
			88888890.0
		]
	}
	{
		text = "Hard fade time"
		handler = shorter_fade_option_handler
		option = 0
		needRestart = 0
		choices = [
			60000.0
			75000.0
			90000.0
			105000.0
			120000.0
			135000.0
			150000.0
			165000.0
			180000.0
			88888890.0
		]
	}
	{
		text = "Expert fade time"
		handler = shorter_fade_option_handler
		option = 0
		needRestart = 0
		choices = [
			60000.0
			75000.0
			90000.0
			105000.0
			120000.0
			135000.0
			150000.0
			165000.0
			180000.0
			88888890.0
		]
	}
	{
	}
	{
		text = "Reset to Defaults"
		handler = shorter_fade_reset_handler
	}
]
shorter_fade_defaults = [
	0
	0
	1
	2
	3
	4
]
shorter_fade_values_old = [
	0
	0
	0
	0
	0
	0
]
shorter_fade_values_new = [
]
shorter_fade_need_restart = 0

script get_song_fading_enabled_idx 
	return song_fading_enabled = <val>
endscript

script get_song_fade_time_idx 
	printf "get_song_fade_time_idx: called with val=%d" d = <val>
	GetArraySize \{$shorter_fade_default_time_choices}
	itemCount = <array_Size>
	i = 0
	begin
	if (<val> = $shorter_fade_default_time_choices [<i>])
		printf "get_song_fade_time_idx: time %t found at %d" t = ($shorter_fade_default_time_choices [<i>]) d = <i>
		fade_time_idx = <i>
		break
	else
		printf "get_song_fade_time_idx: no match at %d (%t)" d = <i> t = ($shorter_fade_default_time_choices [<i>])
	endif
	i = (<i> + 1)
	repeat <itemCount>
	printf "get_song_fade_time_idx: returning idx %d" d = <fade_time_idx>
	return fade_time_idx = <fade_time_idx>
endscript

script shorter_fade_get_choices 
	if StructureContains structure = ($shorter_fade_menuItems [<i>]) Name = choices
		return choices = (($shorter_fade_menuItems [<i>]).choices)
	endif
endscript

script shorter_fade_set_value 
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = <i> NewValue = <v>
endscript

script shorter_fade_load_values 
	GetGlobalTags \{arcade_adjustments}
	SetArrayElement ArrayName = shorter_fade_values_old globalarray index = 0 NewValue = <arcade_song_fading_enabled>
	get_song_fade_time_idx val = <arcade_beginner_fade_time>
	SetArrayElement ArrayName = shorter_fade_values_old globalarray index = 1 NewValue = <fade_time_idx>
	get_song_fade_time_idx val = <arcade_easy_fade_time>
	SetArrayElement ArrayName = shorter_fade_values_old globalarray index = 2 NewValue = <fade_time_idx>
	get_song_fade_time_idx val = <arcade_medium_fade_time>
	SetArrayElement ArrayName = shorter_fade_values_old globalarray index = 3 NewValue = <fade_time_idx>
	get_song_fade_time_idx val = <arcade_hard_fade_time>
	SetArrayElement ArrayName = shorter_fade_values_old globalarray index = 4 NewValue = <fade_time_idx>
	get_song_fade_time_idx val = <arcade_expert_fade_time>
	SetArrayElement ArrayName = shorter_fade_values_old globalarray index = 5 NewValue = <fade_time_idx>
	Change \{shorter_fade_values_new = $shorter_fade_values_old}
	Change \{shorter_fade_need_restart = 0}
endscript

script shorter_fade_toggle_warning \{state = None}
	GetGlobalTags \{arcade_adjustments}
	if (<state> != None)
		if (<state> = On)
			<arcade_song_fading_enabled> = 1
		else
			<arcade_song_fading_enabled> = 0
		endif
	endif
	if (((<arcade_credits_for_premium> != 0) && (<arcade_song_fading_enabled> != 0)))
		printf \{"shorter_fade_toggle_warning: showing warning"}
		fade_warning_text_1 :SetProps \{unhide}
		fade_warning_text_2 :SetProps \{unhide}
		fade_warning_text_3 :SetProps \{unhide}
	else
		printf \{"shorter_fade_toggle_warning: hiding warning"}
		fade_warning_text_1 :SetProps \{Hide}
		fade_warning_text_2 :SetProps \{Hide}
		fade_warning_text_3 :SetProps \{Hide}
	endif
endscript

script shorter_fade_create_pricing_warning 
	displayText \{parent = fade_screen_container
		id = fade_warning_text_1
		text = "Warning, premium pricing active."
		Pos = $shorter_fade_text_warning_root
		Scale = 0.6
		just = [
			left
			top
		]
		rgba = $shorter_fade_text_warning_color
		font = text_a4
		z = 11
		Shadow
		shadow_rgba = [
			160
			130
			105
			255
		]
		shadow_offs = (-3.0, 3.0)
		rot = 2}
	displayText {
		parent = fade_screen_container
		id = fade_warning_text_2
		text = "Please review pricing to make sure players"
		Pos = ($shorter_fade_text_warning_root + (0.0, 23.0))
		Scale = 0.6
		just = [left top]
		rgba = $shorter_fade_text_warning_color
		font = text_a4
		z = 11
		Shadow
		shadow_rgba = [160 130 105 255]
		shadow_offs = (-3.0, 3.0)
		rot = 2
	}
	displayText {
		parent = fade_screen_container
		id = fade_warning_text_3
		text = "aren't paying extra for songs they can't finish."
		Pos = ($shorter_fade_text_warning_root + (0.0, 46.0))
		Scale = 0.6
		just = [left top]
		rgba = $shorter_fade_text_warning_color
		font = text_a4
		z = 11
		Shadow
		shadow_rgba = [160 130 105 255]
		shadow_offs = (-3.0, 3.0)
		rot = 2
	}
endscript

script shorter_fade_destroy_pricing_warning 
	DestroyScreenElement \{id = fade_warning_text_1}
	DestroyScreenElement \{id = fade_warning_text_2}
	DestroyScreenElement \{id = fade_warning_text_3}
endscript

script shorter_fade_save_values 
	GetArraySize \{$shorter_fade_values_new}
	valueCount = <array_Size>
	GetGlobalTags \{arcade_adjustments}
	shorter_fade_get_choices \{i = 0}
	<arcade_song_fading_enabled> = (<choices> [($shorter_fade_values_new [0])])
	SetGlobalTags arcade_adjustments params = {arcade_song_fading_enabled = <arcade_song_fading_enabled>}
	shorter_fade_get_choices \{i = 1}
	<arcade_beginner_fade_time> = (<choices> [($shorter_fade_values_new [1])])
	SetGlobalTags arcade_adjustments params = {arcade_beginner_fade_time = <arcade_beginner_fade_time>}
	shorter_fade_get_choices \{i = 2}
	<arcade_easy_fade_time> = (<choices> [($shorter_fade_values_new [2])])
	SetGlobalTags arcade_adjustments params = {arcade_easy_fade_time = <arcade_easy_fade_time>}
	shorter_fade_get_choices \{i = 3}
	<arcade_medium_fade_time> = (<choices> [($shorter_fade_values_new [3])])
	SetGlobalTags arcade_adjustments params = {arcade_medium_fade_time = <arcade_medium_fade_time>}
	shorter_fade_get_choices \{i = 4}
	<arcade_hard_fade_time> = (<choices> [($shorter_fade_values_new [4])])
	SetGlobalTags arcade_adjustments params = {arcade_hard_fade_time = <arcade_hard_fade_time>}
	shorter_fade_get_choices \{i = 5}
	<arcade_expert_fade_time> = (<choices> [($shorter_fade_values_new [5])])
	SetGlobalTags arcade_adjustments params = {arcade_expert_fade_time = <arcade_expert_fade_time>}
	destroy_bg_viewport
endscript

script shorter_fade_reset_values 
	printf \{"shorter_fade_reset_values: resetting all values"}
	GetArraySize \{$shorter_fade_values_new}
	valueCount = <array_Size>
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = 0 NewValue = ($shorter_fade_defaults [0])
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = 1 NewValue = ($shorter_fade_defaults [1])
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = 2 NewValue = ($shorter_fade_defaults [2])
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = 3 NewValue = ($shorter_fade_defaults [3])
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = 4 NewValue = ($shorter_fade_defaults [4])
	SetArrayElement ArrayName = shorter_fade_values_new globalarray index = 5 NewValue = ($shorter_fade_defaults [5])
endscript

script create_shorter_fade_menu 
	menuDim = (600.0, 500.0)
	menuPos = (640.0, 285.0)
	menuItemDim = (600.0, 32.0)
	menuItemOptionDim = (250.0, 32.0)
	menuItemOptionPos = (0.0, 16.0)
	menuItemOptionJust = [left center]
	menuItemValueDim = (250.0, 32.0)
	menuItemValuePos = (600.0, 16.0)
	menuItemValueJust = [right center]
	menuItemHiliteDim = (650.0, 48.0)
	menuItemHilitePos = (-25.0, 34.0)
	menuItemHiliteJust = [left center]
	menuItemHiliteRot = -0.5
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = fade_screen_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		event_handlers = [
			{
				pad_back
				menu_flow_go_back
			}
		]}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = SpriteElement
		id = light_overlay
		parent = fade_screen_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite \{parent = fade_screen_container
		tex = graphics_options_poster_part1
		Pos = (640.0, 360.0)
		Scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 1
		rot_angle = 2}
	displaySprite \{parent = fade_screen_container
		tex = graphics_options_poster_part3
		Pos = (640.0, 360.0)
		Scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 3
		rot_angle = 2}
	CreateScreenElement \{Type = TextElement
		parent = fade_screen_container
		text = "SONG FADING"
		Pos = (817.0, 120.0)
		Scale = (1.57, 1.47)
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a5
		z_priority = 10
		rot_angle = 6
		Shadow
		shadow_rgba = [
			160
			130
			105
			255
		]
		shadow_offs = (-3.0, 3.0)}
	displaySprite \{parent = fade_screen_container
		tex = Tape_V_01
		Pos = (1070.0, 330.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaySprite \{parent = fade_screen_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (1067.0, 333.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaySprite \{parent = fade_screen_container
		tex = tape_H_02
		Pos = (190.0, 475.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = fade_screen_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (187.0, 478.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	CreateScreenElement {
		Type = VMenu
		id = fade_menu
		parent = fade_screen_container
		Pos = <menuPos>
		dims = <menuDim>
		just = [center center]
		rot_angle = 2
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back shorter_fade_back_handler}
		]
	}
	menuTextProps = {
		Type = TextElement
		font = text_a4
		Scale = 0.7
		rgba = $shorter_fade_text_color
		z_priority = 20
		Shadow
		shadow_rgba = $shorter_fade_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	GetArraySize \{$shorter_fade_menuItems}
	menuItemCount = <array_Size>
	i = 0
	begin
	formatText checksumName = itemId 'item%i' i = <i>
	formatText checksumName = optionId 'option%i' i = <i>
	formatText checksumName = valueId 'value%i' i = <i>
	formatText checksumName = hiliteId 'hilite%i' i = <i>
	CreateScreenElement {
		Type = ContainerElement
		id = <itemId>
		parent = fade_menu
		dims = <menuItemDim>
	}
	if StructureContains structure = ($shorter_fade_menuItems [<i>]) Name = text
		SetScreenElementProps {
			id = <itemId>
			event_handlers = [
				{pad_choose (($shorter_fade_menuItems [<i>]).handler) params = {i = <i>}}
				{focus shorter_fade_focus_handler params = {i = <i>}}
				{unfocus shorter_fade_unfocus_handler params = {i = <i>}}
			]
		}
		CreateScreenElement {
			Type = SpriteElement
			id = <hiliteId>
			parent = <itemId>
			texture = graphics_options_highlight
			Pos = <menuItemHilitePos>
			dims = <menuItemHiliteDim>
			rot_angle = <menuItemHiliteRot>
			just = <menuItemHiliteJust>
			alpha = 0
			z_priority = 1.5
			<mode_disable>
		}
		CreateScreenElement {
			<menuTextProps>
			id = <optionId>
			text = (($shorter_fade_menuItems [<i>]).text)
			parent = <itemId>
			dims = <menuItemOptionDim>
			Pos = <menuItemOptionPos>
			just = <menuItemOptionJust>
			<mode_disable>
		}
		if StructureContains structure = ($shorter_fade_menuItems [<i>]) Name = option
			CreateScreenElement {
				<menuTextProps>
				id = <valueId>
				text = "Value"
				parent = <itemId>
				dims = <menuItemValueDim>
				Pos = <menuItemValuePos>
				just = <menuItemValueJust>
				<mode_disable>
			}
			formatText checksumName = choiceMenuId 'choiceMenu%i' i = <i>
			CreateScreenElement {
				Type = VMenu
				id = <choiceMenuId>
				parent = <itemId>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
					{pad_back shorter_fade_choice_end_handler params = {i = <i>}}
					{pad_choose shorter_fade_choice_end_handler params = {i = <i>}}
				]
			}
			shorter_fade_get_choices i = <i>
			GetArraySize <choices>
			choiceCount = <array_Size>
			c = (<choiceCount> -1)
			begin
			formatText checksumName = choiceItemId 'choiceItem%i_%c' i = <i> c = <c>
			CreateScreenElement {
				<menuTextProps>
				id = <choiceItemId>
				parent = <choiceMenuId>
				event_handlers = [
					{focus shorter_fade_choice_focus_handler params = {i = <i> c = <c>}}
				]
				<mode_disable>
			}
			c = (<c> - 1)
			repeat <choiceCount>
		endif
	else
		SetScreenElementProps id = <itemId> not_focusable
	endif
	i = (<i> + 1)
	repeat <menuItemCount>
	shorter_fade_create_pricing_warning
	shorter_fade_toggle_warning
	shorter_fade_load_values
	shorter_fade_update_value_items
	LaunchEvent \{Type = focus
		target = fade_menu}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_shorter_fade_menu 
	shorter_fade_destroy_pricing_warning
	DestroyScreenElement \{id = fade_screen_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script shorter_fade_back_handler 
	shorter_fade_save_values
	if ($shorter_fade_need_restart = 1)
		ui_flow_manager_respond_to_action \{action = need_restart}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script shorter_fade_update_value_items 
	GetArraySize \{$shorter_fade_menuItems}
	menuItemCount = <array_Size>
	i = 0
	begin
	if StructureContains structure = ($shorter_fade_menuItems [<i>]) Name = option
		formatText checksumName = valueId 'value%i' i = <i>
		shorter_fade_get_choices i = <i>
		if (<i> = 0)
			if ((<choices> [($shorter_fade_values_new [<i>])]) = 0)
				printf \{"shorter_fade_update_value_items: value is off"}
				formatText \{TextName = valtext
					"Off"}
				shorter_fade_toggle_warning \{state = OFF}
			elseif ((<choices> [($shorter_fade_values_new [<i>])]) = 1)
				printf \{"shorter_fade_update_value_items: value is on"}
				formatText \{TextName = valtext
					"On"}
				shorter_fade_toggle_warning \{state = On}
			endif
		else
			printf "shorter_fade_update_value_items: updating item %d to %e (%f)" d = <i> e = ($shorter_fade_default_time_choice_strings [($shorter_fade_values_new [<i>])]) f = ($shorter_fade_values_new [<i>])
			formatText TextName = valtext "%s" s = ($shorter_fade_default_time_choice_strings [($shorter_fade_values_new [<i>])])
		endif
		SetScreenElementProps id = <valueId> text = <valtext>
	endif
	i = (<i> + 1)
	repeat <menuItemCount>
endscript

script shorter_fade_reset_handler 
	SoundEvent \{event = ui_sfx_select}
	shorter_fade_reset_values
	shorter_fade_update_value_items
	shorter_fade_save_values
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
endscript

script shorter_fade_choice_focus_handler 
	shorter_fade_set_value i = <i> v = <c>
	shorter_fade_update_value_items
endscript

script shorter_fade_focus_handler 
	formatText checksumName = hiliteId 'hilite%i' i = <i>
	SetScreenElementProps id = <hiliteId> alpha = 1
endscript

script shorter_fade_unfocus_handler 
	formatText checksumName = hiliteId 'hilite%i' i = <i>
	SetScreenElementProps id = <hiliteId> alpha = 0
endscript

script shorter_fade_option_handler 
	formatText checksumName = valueId 'value%i' i = <i>
	SetScreenElementProps id = <valueId> rgba = $shorter_fade_text_highlight_color
	formatText checksumName = choiceMenuId 'choiceMenu%i' i = <i>
	formatText checksumName = choiceItemId 'choiceItem%i_%c' i = <i> c = ($shorter_fade_values_new [<i>])
	LaunchEvent \{Type = unfocus
		target = fade_menu}
	LaunchEvent Type = focus target = <choiceMenuId> data = {child_id = <choiceItemId>}
	shorter_fade_focus_handler i = <i>
endscript

script shorter_fade_choice_end_handler 
	SoundEvent \{event = ui_sfx_select}
	formatText checksumName = valueId 'value%i' i = <i>
	SetScreenElementProps id = <valueId> rgba = $shorter_fade_text_color
	formatText checksumName = choiceMenuId 'choiceMenu%i' i = <i>
	LaunchEvent Type = unfocus target = <choiceMenuId>
	LaunchEvent \{Type = focus
		target = fade_menu}
	shorter_fade_save_values
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
endscript

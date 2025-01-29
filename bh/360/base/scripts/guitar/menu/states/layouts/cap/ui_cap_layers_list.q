max_cap_layers = 40

script ui_create_cap_layers_list 
	Change \{cas_logo_data_dirty = 1}
	if GotParam \{new_layer_selected}
		ui_event_remove_params \{param = new_layer_selected}
		spawnscriptnow continue_to_shape_list params = {part = <part> div_id = <div_id>}
	else
		if NOT checksumequals a = <part> b = CAS_BAND_LOGO
			show_history = {show_history}
		endif
		make_generic_car_menu {
			vmenu_id = create_cap_layers_list_vmenu
			Title = qs(0x255515f3)
			<show_history>
			exclusive_device = <state_device>
		}
		if NOT is_cap_layers_full part = <part> div_id = <div_id>
			add_car_menu_text_item {
				text = qs(0xcd097cc4)
				choose_state = UIstate_cap_shape_list
				choose_state_data = {part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <override_base_name>}
			}
		endif
		add_current_layers_to_menu state_device = <state_device> part = <part> div_id = <div_id> copy_params = <copy_params> focus_item = <focus_item> paste_item = <paste_item> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <override_base_name>
		add_car_menu_text_item \{text = qs(0x00000000)
			not_focusable}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			if GotParam \{paste_item}
				<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<paste_item> + 1)
				paste_item = (<paste_item> -1)
				if (<paste_item> < 0)
					paste_item = 0
				endif
				spawnscriptlater set_generic_menu_scrollbar_index params = {vmenu = create_cap_layers_list_vmenu index = (<paste_item>)}
				ui_event_remove_params \{param = paste_item}
			elseif GotParam \{focus_item}
				<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<focus_item> + 1)
			endif
		endif
		if GotParam \{copy_params}
			add_user_control_helper controller = <state_device> text = qs(0x032d8a5e) button = green z = 100000
			add_user_control_helper controller = <state_device> text = qs(0x3fc1c076) button = red z = 100000
			if NOT checksumequals a = <part> b = CAS_BAND_LOGO
				menu_finish car_rotate_zoom controller = <state_device>
			endif
		elseif GotParam \{re_order_params}
			add_user_control_helper controller = <state_device> text = qs(0x3fc1c076) button = green z = 100000
			if NOT checksumequals a = <part> b = CAS_BAND_LOGO
				menu_finish car_rotate_zoom controller = <state_device>
			endif
		else
			if checksumequals a = <part> b = CAS_BAND_LOGO
				menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
			else
				setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
				menu_finish car_helper_text controller = <state_device>
			endif
		endif
	endif
endscript

script focus_re_order_element 
	if ScreenElementExists \{id = create_cap_layers_list_vmenu}
		LaunchEvent \{type = unfocus
			target = create_cap_layers_list_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = re_order_element}
		LaunchEvent \{type = focus
			target = re_order_element}
	else
		return
	endif
	if GotParam \{fix_highlight}
		wait \{1
			gameframe}
		if ScreenElementExists \{id = create_cap_layers_list_vmenu}
			LaunchEvent \{type = unfocus
				target = create_cap_layers_list_vmenu}
		endif
	endif
endscript

script ui_destroy_cap_layers_list 
	if ScreenElementExists \{id = num_layers}
		DestroyScreenElement \{id = num_layers}
	endif
	destroy_generic_menu
endscript

script ui_deinit_cap_layers_list 
	if ScreenElementExists \{id = num_layers}
		DestroyScreenElement \{id = num_layers}
	endif
	destroy_generic_menu
	cap_copy_layer_cleanup
	cap_re_order_cleanup
endscript

script ui_return_cap_layers_list 
	if NOT ((GotParam re_order_params) || (GotParam copy_params))
		if ScreenElementExists \{id = layers_list_focus}
			DestroyScreenElement \{id = layers_list_focus}
		endif
	elseif GotParam \{re_order_params}
		printf \{qs(0xed8df0f0)}
		cap_re_order_layer_handler_change state_device = <state_device> <re_order_params> camera_list = <camera_list> zoom_camera = <zoom_camera>
		spawnscriptlater \{focus_re_order_element
			params = {
				fix_highlight = 1
			}}
	elseif GotParam \{copy_params}
		printf \{qs(0x76d07988)}
		cap_change_copy_handler <copy_params> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> exclusive_device = <state_device>
		spawnscriptlater \{focus_copy_element
			params = {
				fix_highlight = 1
			}}
	endif
	if GotParam \{copy_params}
		add_user_control_helper controller = <state_device> text = qs(0x032d8a5e) button = green z = 100000
		add_user_control_helper controller = <state_device> text = qs(0x3fc1c076) button = red z = 100000
		if NOT checksumequals a = <part> b = CAS_BAND_LOGO
			menu_finish car_rotate_zoom controller = <state_device>
		endif
	elseif GotParam \{re_order_params}
		add_user_control_helper controller = <state_device> text = qs(0x3fc1c076) button = green z = 100000
		if NOT checksumequals a = <part> b = CAS_BAND_LOGO
			menu_finish car_rotate_zoom controller = <state_device>
		endif
	else
		if checksumequals a = <part> b = CAS_BAND_LOGO
			menu_finish \{car_helper_text
				no_rotate_zoom_text}
		else
			menu_finish car_helper_text controller = <state_device>
		endif
	endif
endscript

script add_current_layers_to_menu 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if GetCAPSectionsArray appearance = $cas_current_appearance part = <part>
		num_layers = 0
		if GotParam \{CAP}
			GetArraySize (CAP)
			cap_array_size = <array_size>
			if (<cap_array_size> > 0)
				get_div_info part = <part> desc_id = <desc_id> div_id = <div_id>
				i = 0
				begin
				if StructureContains structure = (<CAP> [<i>]) layers
					if is_target_in_div target = (<CAP> [<i>]) part = <part> div_id = <div_id>
						GetArraySize (<CAP> [<i>].layers)
						j = 0
						begin
						if NOT GotParam \{target}
							printf \{qs(0x8f2a48f2)}
						endif
						if StructureContains structure = ((<CAP> [<i>]).layers [<j>]) texture
							if NOT MatchLayers sections = <sections> texture = ((<CAP> [<i>]).layers [<j>].texture) target = <target> material = <material>
								printf qs(0x597b6b8a) t = <texture> DoNotResolve
							endif
						elseif StructureContains structure = ((<CAP> [<i>]).layers [<j>]) font
							if NOT MatchLayers font = ((<CAP> [<i>]).layers [<j>].font) text = ((<CAP> [<i>]).layers [<j>].text) sections = <sections> target = <target> material = <material>
								printf qs(0x6a7bb545) f = <font> DoNotResolve
							endif
						endif
						if GotParam \{mask}
							add_car_menu_text_item {
								text = (<mask>.frontend_desc)
								pad_choose_script = layers_list_select_layer
								pad_choose_params = {state_device = <state_device> part = <part> section_index = <section_index> mask_index = <mask_index> cap_index = <i> layer_index = <j> mask = <mask> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <override_base_name>}
								additional_focus_script = <additional_focus_script>
								additional_focus_params = <additional_focus_params>
							}
							if GotParam \{focus_item}
								if (<focus_item> = <j>)
									if ScreenElementExists \{id = generic_menu}
										if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
												param = generic_smenu}
											printf qs(0xa36130bf) i = <focus_item>
											if GotParam \{paste_item}
												<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<paste_item> + 1)
												ui_event_remove_params \{param = paste_item}
											else
												<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<focus_item>)
											endif
										endif
									endif
									layers_list_set_focus mask = <mask> container_id = <item_container_id>
									ui_event_remove_params \{param = focus_item}
								endif
							endif
							num_layers = (<num_layers> + 1)
						endif
						j = (<j> + 1)
						repeat <array_size>
					endif
				endif
				i = (<i> + 1)
				repeat <cap_array_size>
			endif
		endif
	endif
	if ScreenElementExists \{id = num_layers}
		DestroyScreenElement \{id = num_layers}
	endif
	FormatText TextName = text qs(0x1af30f77) i = <num_layers> j = ($max_cap_layers)
	CreateScreenElement {
		type = TextBlockElement
		parent = root_window
		id = num_layers
		font = fontgrid_title_a1
		text = <text>
		Pos = (470.0, 153.0)
		rgba = [220 , 220 , 220 , 255]
		dims = (200.0, 30.0)
		z_priority = 200
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
		internal_just = [center , center]
	}
	if GotParam \{focus_item}
		ui_event_remove_params \{param = focus_item}
	endif
	if GotParam \{paste_item}
		ui_event_remove_params \{param = paste_item}
	endif
endscript

script cap_re_order_layer_handler_change 
	printf \{qs(0x3a7ad4ad)}
	RequireParams \{[
			part
			cap_index
			layer_current_index
		]
		all}
	if NOT ScreenElementExists \{id = re_order_element}
		CreateScreenElement {
			type = ContainerElement
			id = re_order_element
			parent = root_window
			event_handlers = [
				{pad_up move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> -1) layer_current_index = <layer_current_index>}}
				{pad_down move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> + 1) layer_current_index = <layer_current_index>}}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose cap_re_order_layer_handler_change_return params = {state_device = <state_device> part = <part> camera_list = <camera_list> zoom_camera = <zoom_camera>}}
			]
			z_priority = <z_priority>
		}
	endif
	if NOT checksumequals a = <part> b = CAS_BAND_LOGO
		setup_cas_menu_handlers vmenu_id = re_order_element camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script cap_re_order_cleanup 
	if ScreenElementExists \{id = re_order_element}
		DestroyScreenElement \{id = re_order_element}
	endif
	if ScreenElementExists \{id = layers_list_focus}
		DestroyScreenElement \{id = layers_list_focus}
	endif
	ui_event_remove_params \{param = re_order_params}
	ui_event_remove_params \{param = focus_item}
endscript

script cap_re_order_layer_handler_change_return 
	LaunchEvent \{type = unfocus
		target = re_order_element}
	if NOT ScreenElementExists \{id = create_cap_layers_list_vmenu}
		return
	endif
	LaunchEvent \{type = focus
		target = create_cap_layers_list_vmenu}
	cap_re_order_cleanup
	clean_up_user_control_helpers
	if checksumequals a = <part> b = CAS_BAND_LOGO
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		menu_finish car_helper_text controller = <state_device>
	endif
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :ScrollingMenu_ClearOverrideVisibleIndex
		endif
	endif
	if NOT checksumequals a = <part> b = CAS_BAND_LOGO
		setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script move_layer 
	RequireParams \{[
			part
			cap_index
			layer_target_index
			layer_current_index
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if (<layer_target_index> < 0)
		printf \{qs(0x0973b884)}
		return
	endif
	GetArraySize (<CAP> [<cap_index>].layers)
	if (<layer_target_index> > (<array_size> -1))
		printf \{qs(0xa80d5117)}
		return
	endif
	generic_menu_up_or_down_sound
	MoveArrayElement array = (<CAP> [<cap_index>].layers) target = <layer_target_index> current = <layer_current_index>
	SetArrayElement arrayName = CAP index = <cap_index> newValue = {
		(<CAP> [<cap_index>])
		layers = <array>
	}
	SetCASAppearanceCAP part = <part> CAP = <CAP>
	UpdateCASModelCAP part = <part>
	ui_event_add_params focus_item = <layer_target_index>
	ui_event \{event = menu_refresh}
	spawnscriptlater set_generic_menu_scrollbar_index params = {vmenu = create_cap_layers_list_vmenu index = <layer_target_index>}
	layer_current_index = <layer_target_index>
	SetScreenElementProps {
		id = re_order_element
		event_handlers =
		[
			{pad_up move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> -1) layer_current_index = <layer_current_index>}}
			{pad_down move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> + 1) layer_current_index = <layer_current_index>}}
		]
		replace_handlers
	}
	spawnscriptlater \{focus_re_order_element}
endscript

script is_CAP_in_div 
	RequireParams \{[
			part
			CAP
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT GotParam \{divisions}
		return \{true}
	elseif NOT GotParam \{div_id}
		return \{true}
	else
		GetArraySize \{divisions}
		if (<array_size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				if ((<CAP>.material) = (<divisions> [<i>].material))
					if StructureContains structure = <CAP> (<divisions> [<i>].target)
						return \{true}
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script get_num_layers 
	num_layers = 0
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{CAP}
		GetArraySize (CAP)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if StructureContains structure = (<CAP> [<i>]) layers
				if is_target_in_div target = (<CAP> [<i>]) part = <part> div_id = <div_id>
					GetArraySize (<CAP> [<i>].layers)
					j = 0
					begin
					num_layers = (<num_layers> + 1)
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
	return num_layers = <num_layers>
endscript

script is_cap_layers_full 
	RequireParams \{[
			part
		]
		all}
	get_num_layers part = <part> div_id = <div_id>
	if (<num_layers> > (($max_cap_layers) -1))
		return \{true}
	else
		return \{false}
	endif
endscript

script get_extra_cap_saving_flags 
	RequireParams \{[
			part
			base_tex
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	ui_rotation = 0
	aspect_ratio = 1.0
	if GotParam \{cap_textures}
		GetArraySize <cap_textures>
		i = 0
		if (<array_size> > 0)
			begin
			entry = (<cap_textures> [<i>])
			if StructureContains structure = <entry> base_tex
				if StructureContains structure = <entry> user_layer_settings
					if ((<entry>.base_tex) = <base_tex>)
						if StructureContains structure = (<entry>.user_layer_settings) aspect_ratio
							aspect_ratio = ((<entry>.user_layer_settings).aspect_ratio)
						endif
						if StructureContains structure = (<entry>.user_layer_settings) ui_rotated_90
							ui_rotation = 90
						endif
						if StructureContains structure = (<entry>.user_layer_settings) ui_rotated_180
							ui_rotation = 180
						endif
						if StructureContains structure = (<entry>.user_layer_settings) ui_rotated_270
							ui_rotation = 270
						endif
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return part_ui_rotation = <ui_rotation> part_aspect_ratio = <aspect_ratio>
endscript

script extract_current_layers 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{CAP}
		GetArraySize (CAP)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if StructureContains structure = (<CAP> [<i>]) layers
				if is_target_in_div target = (<CAP> [<i>]) part = <part> div_id = <div_id>
					get_extra_cap_saving_flags part = <part> base_tex = ((<CAP> [<i>]).base_tex)
					return layers = ((<CAP> [<i>]).layers) ui_rotation = <part_ui_rotation> aspect_ratio = <part_aspect_ratio>
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
endscript

script cap_copy_layer 
	RequireParams \{[
			part
			cap_index
			layer
			layer_index
		]}
	if NOT is_cap_layers_full part = <part> div_id = <div_id>
		if NOT GetCASAppearancePart part = <part>
			ScriptAssert '%s not found' s = <part> DoNotResolve
		endif
		InsertArrayElement array = ((<CAP> [<cap_index>]).layers) element = <layer> index = <layer_index>
		SetArrayElement arrayName = CAP index = <cap_index> newValue = {
			(<CAP> [<cap_index>])
			layers = <array>
		}
		SetCASAppearanceCAP part = <part> CAP = <CAP>
		UpdateCASModelCAP part = <part>
	endif
endscript

script continue_to_shape_list 
	printf \{qs(0xa3374ec1)}
	begin
	if is_menu_camera_finished
		destroy_generic_menu
		printf \{qs(0x54841d1d)}
		ui_event_wait event = menu_change data = {state = UIstate_cap_shape_list <...>}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script layers_list_set_focus 
	if ScreenElementExists \{id = layers_list_focus}
		DestroyScreenElement \{id = layers_list_focus}
	endif
	CreateScreenElement {
		parent = <container_id>
		type = DescInterface
		desc = 'layers_list_focus'
		id = layers_list_focus
		autoSizeDims = true
		layers_list_focus_text_text = (<mask>.frontend_desc)
		layers_list_focus_text_rgba = (($cas_color_scheme).text_focus_color)
		layers_list_focus_text_font = fontgrid_title_a1
		z_priority = 100
	}
endscript

script layers_list_select_layer 
	if GetCAPSectionsArray appearance = $cas_current_appearance part = <part>
		layers_list_set_focus <...>
		generic_event_choose data = {is_popup state = UIstate_cap_layers_options <...>}
	endif
endscript

script cap_change_copy_handler 
	printf \{qs(0xa5f71727)}
	RequireParams \{[
			part
			cap_index
			layer_index
			layer
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if NOT GotParam \{CAP}
		ScriptAssert \{qs(0x8db60c15)}
	endif
	GetArraySize (<CAP> [<cap_index>].layers)
	if NOT ScreenElementExists \{id = copy_element}
		CreateScreenElement {
			type = ContainerElement
			id = copy_element
			parent = root_window
			event_handlers = [
				{pad_up cap_decrement_target}
				{pad_down cap_increment_target}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose cap_paste_layer params = {exclusive_device = <exclusive_device> cap_index = <cap_index> part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}}
				{pad_back generic_menu_pad_choose_sound}
				{pad_back cap_copy_layer_handler_change_return params = {camera_list = <camera_list> zoom_camera = <zoom_camera> part = <part>}}
			]
			z_priority = <z_priority>
		}
		parent_id = <id>
		if NOT checksumequals a = <part> b = CAS_BAND_LOGO
			setup_cas_menu_handlers vmenu_id = copy_element camera_list = <camera_list> zoom_camera = <zoom_camera>
		endif
		copy_element :SetTags {
			curent_index = <layer_index>
			target_index = <layer_index>
			layer = <layer>
			max_layer = <array_size>
		}
		if ScreenElementExists \{id = copy_indicator}
			DestroyScreenElement \{id = copy_indicator}
		endif
		GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
		CreateScreenElement {
			type = DescInterface
			desc = 'layers_list_copy'
			parent = (<children> [<layer_index>])
			id = copy_indicator
			dims = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			Pos = (0.0, 0.0)
		}
	endif
endscript

script cap_copy_layer_cleanup 
	if ScreenElementExists \{id = copy_element}
		DestroyScreenElement \{id = copy_element}
	endif
	if ScreenElementExists \{id = layers_list_focus}
		DestroyScreenElement \{id = layers_list_focus}
	endif
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	ui_event_remove_params \{param = copy_params}
	ui_event_remove_params \{param = focus_item}
	ui_event_remove_params \{param = paste_item}
endscript

script cap_copy_layer_handler_change_return 
	LaunchEvent \{type = unfocus
		target = copy_element}
	LaunchEvent \{type = focus
		target = create_cap_layers_list_vmenu}
	cap_copy_layer_cleanup
	clean_up_user_control_helpers
	if checksumequals a = <part> b = CAS_BAND_LOGO
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		menu_finish car_helper_text controller = <state_device>
	endif
	if NOT checksumequals a = <part> b = CAS_BAND_LOGO
		setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :ScrollingMenu_ClearOverrideVisibleIndex
		endif
	endif
endscript

script cap_decrement_target 
	copy_element :GetTags
	if (<target_index> = 0)
		printf \{qs(0x218fbf36)}
		return
	endif
	generic_menu_up_or_down_sound
	copy_element :SetTags target_index = (<target_index> -1)
	printf qs(0x06814f4b) i = (<target_index> -1)
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
	CreateScreenElement {
		type = DescInterface
		desc = 'layers_list_copy'
		parent = (<children> [(<target_index> -1)])
		id = copy_indicator
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
	}
	set_generic_menu_scrollbar_index vmenu = create_cap_layers_list_vmenu index = (<target_index> -1)
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			printf \{qs(0x657fa8ff)}
			<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<target_index> -1)
		endif
	endif
endscript

script cap_increment_target 
	copy_element :GetTags
	if (<target_index> > (<max_layer> -1))
		printf \{qs(0x4d5b9d6b)}
		return
	endif
	generic_menu_up_or_down_sound
	copy_element :SetTags target_index = (<target_index> + 1)
	printf qs(0x06814f4b) i = (<target_index> + 1)
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
	CreateScreenElement {
		type = DescInterface
		desc = 'layers_list_copy'
		parent = (<children> [(<target_index> + 1)])
		id = copy_indicator
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
	}
	set_generic_menu_scrollbar_index vmenu = create_cap_layers_list_vmenu index = (<target_index> + 1)
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<target_index> + 1)
		endif
	endif
endscript

script focus_copy_element 
	if ScreenElementExists \{id = create_cap_layers_list_vmenu}
		LaunchEvent \{type = unfocus
			target = create_cap_layers_list_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = copy_element}
		LaunchEvent \{type = focus
			target = copy_element}
		copy_element :GetTags
	else
		return
	endif
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	if ScreenElementExists \{id = create_cap_layers_list_vmenu}
		GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
		CreateScreenElement {
			type = DescInterface
			desc = 'layers_list_copy'
			parent = (<children> [<target_index>])
			id = copy_indicator
			dims = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			Pos = (0.0, 0.0)
		}
	endif
	if GotParam \{fix_highlight}
		wait \{1
			gameframe}
		if ScreenElementExists \{id = create_cap_layers_list_vmenu}
			LaunchEvent \{type = unfocus
				target = create_cap_layers_list_vmenu}
		endif
	endif
endscript

script cap_paste_layer 
	printf \{qs(0x68c6b732)}
	copy_element :GetTags
	if (<target_index> < (<curent_index> + 1))
		curent_index = (<curent_index> + 1)
	endif
	ui_event_add_params focus_item = <curent_index>
	ui_event_add_params paste_item = <target_index>
	layer_index = <target_index>
	cap_copy_layer <...>
	copy_element :SetTags max_layer = (<max_layer> + 1) curent_index = <curent_index>
	if NOT is_cap_layers_full part = <part> div_id = <div_id>
		ui_event \{event = menu_refresh}
		spawnscriptlater \{focus_copy_element}
		cap_paste_layer_animate
	else
		printf \{qs(0xa1033b7c)}
		LaunchEvent \{type = unfocus
			target = copy_element}
		cap_copy_layer_handler_change_return camera_list = <camera_list> zoom_camera = <zoom_camera> part = <part>
		generic_event_choose data = {state = UIstate_generic_dialog_box player_device = <exclusive_device> template = continue is_popup confirm_func = cap_layers_full_alert_return heading_text = qs(0xec8d6d4f) body_text = qs(0x300fda36)}
	endif
endscript

script cap_layers_full_alert_return 
	generic_event_back
	ui_event_wait \{event = menu_refresh}
endscript

script cap_paste_layer_animate 
	spawnscriptnow \{cap_paste_layer_animate_worker}
endscript

script cap_paste_layer_animate_worker 
	wait \{0.1
		seconds}
	if ScreenElementExists \{id = copy_indicator}
		copy_indicator :SE_SetProps \{layer_copy_indicator_left_flash_alpha = 1.0
			layer_copy_indicator_right_flash_alpha = 1.0
			time = 0.1}
	else
		return
	endif
	wait \{0.15
		seconds}
	if ScreenElementExists \{id = copy_indicator}
		copy_indicator :SE_SetProps \{layer_copy_indicator_left_flash_alpha = 0.0
			layer_copy_indicator_right_flash_alpha = 0.0
			time = 0.1}
	else
		return
	endif
endscript

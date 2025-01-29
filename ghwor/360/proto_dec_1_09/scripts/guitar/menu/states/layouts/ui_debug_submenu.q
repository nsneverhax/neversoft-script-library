
script ui_create_debug_submenu 
	if debug_submenu_exists id = <menu_id>
		if StructureContains structure = <menu_struct> back_script
			pad_back_script = (<menu_struct>.back_script)
		else
			pad_back_script = generic_event_back
		endif
		make_generic_menu {
			vmenu_id = debug_vmenu
			Pos = (675.0, 20.0)
			dims = (400.0, 500.0)
			title_pos = (675.0, 20.0)
			title_just = [left top]
			z_priority = 100.0
			pad_back_script = <pad_back_script>
			title = (<menu_struct>.title)
			scrolling
			use_all_controllers
		}
		if StructureContains structure = <menu_struct> additional_start_script
			additional_start_script = (<menu_struct>.additional_start_script)
			if StructureContains structure = <menu_struct> additional_start_params
				additional_start_params = (<menu_struct>.additional_start_params)
			endif
			<additional_start_script> <additional_start_params>
		endif
		if StructureContains structure = <menu_struct> paged
			debug_submenu_get_num_items menu_struct = <menu_struct> menu_params = <menu_params>
			debug_vmenu :SetTags page = 0 index = 0 num_items = <num_items>
			debug_vmenu :se_setprops {
				event_handlers = [
					{pad_up debug_submenu_items_up params = {menu_params = <menu_params> menu_struct = <menu_struct>}}
					{pad_down debug_submenu_items_down params = {menu_params = <menu_params> menu_struct = <menu_struct>}}
				]
			}
			debug_vmenu :obj_spawnscript debug_submenu_construct_menu params = {menu_params = <menu_params> menu_struct = <menu_struct> paged = 1}
		else
			debug_vmenu :obj_spawnscript debug_submenu_construct_menu params = {menu_params = <menu_params> menu_struct = <menu_struct>}
		endif
	else
		ui_event_wait \{event = menu_back}
	endif
endscript

script ui_destroy_debug_submenu 
	if debug_submenu_exists id = <menu_id>
		if StructureContains structure = <menu_struct> additional_exit_script
			additional_exit_script = (<menu_struct>.additional_exit_script)
			if StructureContains structure = <menu_struct> additional_exit_params
				additional_exit_params = (<menu_struct>.additional_exit_params)
			endif
			<additional_exit_script> <additional_exit_params>
		endif
	endif
	generic_ui_destroy
endscript

script debug_submenu_get_num_items 
	num_items = 0
	if StructureContains structure = <menu_struct> items
		GetArraySize (<menu_struct>.items)
		item_size = <array_Size>
		if (<item_size> > 0)
			i = 0
			begin
			item_struct = (<menu_struct>.items [<i>])
			if StructureContains structure = <item_struct> Type
				if StructureContains structure = <item_struct> multiitem
					if StructureContains structure = <item_struct> build_script
						build_script = (<item_struct>.build_script)
						if StructureContains structure = <item_struct> build_params
							build_params = (<item_struct>.build_params)
						endif
						if GotParam \{menu_params}
							build_params = {<build_params> <menu_params>}
						endif
						<build_script> <build_params>
					else
						ScriptAssert qs(0x7a56cbd8) t = (<menu_struct>.title)
					endif
					if GotParam \{item_params}
						GetArraySize \{item_params}
						if (<array_Size> > 0)
							j = 0
							begin
							<num_items> = (<num_items> + 1)
							<j> = (<j> + 1)
							repeat <array_Size>
						endif
					else
						ScriptAssert qs(0x1b24eb16) t = (<menu_struct>.title)
					endif
				else
					<num_items> = (<num_items> + 1)
				endif
			endif
			<i> = (<i> + 1)
			repeat <item_size>
		endif
	endif
	return num_items = <num_items>
endscript

script debug_submenu_construct_menu \{paged = 0}
	LaunchEvent \{Type = unfocus
		target = debug_vmenu}
	se_setprops \{block_events}
	GetTags
	if (<paged> = 1)
		generic_menu_clear_items
	endif
	item_count = 0
	if StructureContains structure = <menu_struct> items
		GetArraySize (<menu_struct>.items)
		item_size = <array_Size>
		if (<item_size> > 0)
			i = 0
			begin
			item_struct = (<menu_struct>.items [<i>])
			if StructureContains structure = <item_struct> Type
				if StructureContains structure = <item_struct> multiitem
					if StructureContains structure = <item_struct> build_script
						build_script = (<item_struct>.build_script)
						if StructureContains structure = <item_struct> build_params
							build_params = (<item_struct>.build_params)
						endif
						if GotParam \{menu_params}
							build_params = {<build_params> <menu_params>}
						endif
						<build_script> <build_params>
					else
						ScriptAssert qs(0x7a56cbd8) t = (<menu_struct>.title)
					endif
					if GotParam \{item_params}
						GetArraySize \{item_params}
						if (<array_Size> > 0)
							j = 0
							begin
							add_item = 1
							if (<paged> = 1)
								start_index = (<page> * ($debug_items_per_page))
								end_index = ((<page> + 1) * ($debug_items_per_page) - 1)
								if (<end_index> > (<num_items> -1))
									end_index = (<num_items> -1)
								endif
								if (<item_count> > <end_index>)
									break
								endif
								if (<item_count> < <start_index>)
									<add_item> = 0
								endif
							endif
							if (<add_item> = 1)
								multiitem_params = (<item_params> [<j>])
								if StructureContains structure = <item_struct> name_script
									name_builder = (<item_struct>.name_script)
									<name_builder> {<multiitem_params> index = <j>}
								endif
								if StructureContains structure = <item_struct> focus_script
									focus_script_builder = (<item_struct>.focus_script)
									<focus_script_builder> {<multiitem_params> index = <j>}
								endif
								if (<item_struct>.Type = new_menu)
									if StructureContains structure = <item_struct> menu_params
										menu_params_builder = (<item_struct>.menu_params)
										<menu_params_builder> {<multiitem_params> index = <j>}
									endif
									pad_choose_script = generic_event_choose
									pad_choose_params = {state = uistate_debug_submenu data = {menu_id = (<item_struct>.menu_id) menu_params = <menu_params>}}
									RemoveParameter \{menu_params}
									if StructureContains structure = <item_struct> additional_choose_script
										additional_choose_script = (<item_struct>.additional_choose_script)
									endif
									if StructureContains structure = <item_struct> additional_choose_params
										additional_choose_params = (<item_struct>.additional_choose_params)
									endif
								elseif (<item_struct>.Type = run_script)
									if StructureContains structure = <item_struct> choose_script
										choose_script_builder = (<item_struct>.choose_script)
										<choose_script_builder> {<multiitem_params> index = <j>}
									endif
									if StructureContains structure = <item_struct> square_script
										square_script_builder = (<item_struct>.square_script)
										<square_script_builder> {<multiitem_params> index = <j>}
									endif
								elseif (<item_struct>.Type = toggle)
									pad_choose_script = debug_submenu_toggle_item
									pad_choose_params = {multiitem = 1 index = <j> multiitem_params = <multiitem_params> item_struct = <item_struct>}
								elseif (<item_struct>.Type = option)
									pad_left_script = debug_submenu_toggle_left
									pad_left_params = {multiitem = 1 index = <j> multiitem_params = <multiitem_params> item_struct = <item_struct>}
									pad_right_script = debug_submenu_toggle_right
									pad_right_params = {multiitem = 1 index = <j> multiitem_params = <multiitem_params> item_struct = <item_struct>}
								endif
								add_generic_menu_text_item {
									text = <Name>
									pad_choose_script = <pad_choose_script>
									pad_choose_params = <pad_choose_params>
									pad_square_script = <pad_square_script>
									pad_square_params = <pad_square_params>
									additional_choose_script = <additional_choose_script>
									additional_choose_params = <additional_choose_params>
									additional_focus_script = <additional_focus_script>
									additional_focus_params = <additional_focus_params>
									pad_left_script = <pad_left_script>
									pad_left_params = <pad_left_params>
									pad_right_script = <pad_right_script>
									pad_right_params = <pad_right_params>
								}
								if (<item_struct>.Type = option)
									debug_submenu_set_option_text {
										multiitem = 1
										container_id = <item_container_id>
										item_struct = <item_struct>
										index = <j>
										multiitem_params = <multiitem_params>
									}
								elseif (<item_struct>.Type = toggle)
									debug_submenu_set_toggle_text {
										multiitem = 1
										container_id = <item_container_id>
										item_struct = <item_struct>
										index = <j>
										multiitem_params = <multiitem_params>
									}
								endif
								RemoveParameter \{Name}
								RemoveParameter \{pad_choose_script}
								RemoveParameter \{pad_choose_params}
								RemoveParameter \{pad_square_script}
								RemoveParameter \{pad_square_params}
								RemoveParameter \{additional_choose_script}
								RemoveParameter \{additional_choose_params}
								RemoveParameter \{additional_focus_script}
								RemoveParameter \{additional_focus_params}
								RemoveParameter \{pad_left_script}
								RemoveParameter \{pad_left_params}
								RemoveParameter \{pad_right_script}
								RemoveParameter \{pad_right_params}
							endif
							<item_count> = (<item_count> + 1)
							<j> = (<j> + 1)
							repeat <array_Size>
						endif
					else
						ScriptAssert qs(0x1b24eb16) t = (<menu_struct>.title)
					endif
				else
					add_item = 1
					if (<paged> = 1)
						start_index = (<page> * ($debug_items_per_page))
						end_index = ((<page> + 1) * ($debug_items_per_page) - 1)
						if (<end_index> > (<num_items> -1))
							end_index = (<num_items> -1)
						endif
						if (<item_count> > <end_index>)
							break
						endif
						if (<item_count> < <start_index>)
							<add_item> = 0
						endif
					endif
					if (<add_item> = 1)
						if (<item_struct>.Type = new_menu)
							debug_submenu_get_new_menu_choose_script item_struct = <item_struct>
						elseif (<item_struct>.Type = run_script)
							if StructureContains structure = <item_struct> choose_script
								pad_choose_script = (<item_struct>.choose_script)
							endif
							if StructureContains structure = <item_struct> choose_params
								pad_choose_params = (<item_struct>.choose_params)
							endif
						elseif (<item_struct>.Type = toggle)
							pad_choose_script = debug_submenu_toggle_item
							pad_choose_params = {item_struct = <item_struct>}
						elseif (<item_struct>.Type = option)
							if StructureContains structure = <item_struct> option_select
								select_struct = (<item_struct>.option_select)
								if StructureContains structure = <select_struct> Type
									if (<select_struct>.Type = new_menu)
										debug_submenu_get_new_menu_choose_script item_struct = <select_struct>
									elseif (<select_struct>.Type = run_script)
										if StructureContains structure = <select_struct> choose_script
											pad_choose_script = (<select_struct>.choose_script)
										endif
										if StructureContains structure = <select_struct> choose_params
											pad_choose_params = (<select_struct>.choose_params)
										endif
									endif
								endif
							endif
							pad_left_script = debug_submenu_toggle_left
							pad_left_params = {item_struct = <item_struct>}
							pad_right_script = debug_submenu_toggle_right
							pad_right_params = {item_struct = <item_struct>}
						endif
						if StructureContains structure = <item_struct> focus_script
							additional_focus_script = (<item_struct>.focus_script)
						endif
						if StructureContains structure = <item_struct> focus_params
							additional_focus_params = (<item_struct>.focus_params)
						endif
						add_generic_menu_text_item {
							text = (<item_struct>.text)
							pad_choose_script = <pad_choose_script>
							pad_choose_params = <pad_choose_params>
							additional_choose_script = <additional_choose_script>
							additional_choose_params = <additional_choose_params>
							additional_focus_script = <additional_focus_script>
							additional_focus_params = <additional_focus_params>
							pad_left_script = <pad_left_script>
							pad_left_params = <pad_left_params>
							pad_right_script = <pad_right_script>
							pad_right_params = <pad_right_params>
						}
						if (<item_struct>.Type = toggle)
							debug_submenu_set_toggle_text container_id = <item_container_id> item_struct = <item_struct>
						elseif (<item_struct>.Type = option)
							debug_submenu_set_option_text container_id = <item_container_id> item_struct = <item_struct>
						endif
						RemoveParameter \{pad_choose_script}
						RemoveParameter \{pad_choose_params}
						RemoveParameter \{additional_choose_script}
						RemoveParameter \{additional_choose_params}
						RemoveParameter \{additional_focus_script}
						RemoveParameter \{additional_focus_params}
						RemoveParameter \{pad_left_script}
						RemoveParameter \{pad_left_params}
						RemoveParameter \{pad_right_script}
						RemoveParameter \{pad_right_params}
					endif
					<item_count> = (<item_count> + 1)
				endif
			endif
			<i> = (<i> + 1)
			repeat <item_size>
		endif
	endif
	if (<item_count> = 0)
		add_generic_menu_text_item \{text = qs(0x30cd4207)
			not_focusable}
	endif
	if StructureContains structure = <menu_struct> nobg
		generic_menu :se_setprops \{generic_menu_bg_alpha = 0}
	endif
	se_setprops \{unblock_events}
	LaunchEvent Type = focus target = debug_vmenu data = {child_index = <index>}
endscript

script debug_submenu_items_up 
	GetTags
	current_index = (<page> * $debug_items_per_page + <index>)
	if (<current_index> = 0)
		last_page = ((<num_items> - 1) / $debug_items_per_page)
		Mod a = (<num_items> - 1) b = ($debug_items_per_page)
		last_item = <Mod>
		SetTags index = <last_item> page = <last_page>
		obj_spawnscript debug_submenu_construct_menu params = {menu_params = <menu_params> menu_struct = <menu_struct> paged = 1}
	elseif (<index> = 0)
		last_item = ($debug_items_per_page - 1)
		SetTags index = <last_item> page = (<page> - 1)
		obj_spawnscript debug_submenu_construct_menu params = {menu_params = <menu_params> menu_struct = <menu_struct> paged = 1}
	else
		SetTags index = (<index> - 1)
	endif
endscript

script debug_submenu_items_down 
	GetTags
	current_index = (<page> * $debug_items_per_page + <index>)
	if (<current_index> = (<num_items> - 1))
		SetTags \{index = 0
			page = 0}
		obj_spawnscript debug_submenu_construct_menu params = {menu_params = <menu_params> menu_struct = <menu_struct> paged = 1}
	elseif (<index> = ($debug_items_per_page - 1))
		SetTags index = 0 page = (<page> + 1)
		obj_spawnscript debug_submenu_construct_menu params = {menu_params = <menu_params> menu_struct = <menu_struct> paged = 1}
	else
		SetTags index = (<index> + 1)
	endif
endscript

script debug_submenu_exists 
	RequireParams \{[
			id
		]
		all}
	GetArraySize ($debug_submenus)
	i = 0
	if (<array_Size> > 0)
		begin
		temp_struct = ($debug_submenus [<i>])
		if StructureContains structure = <temp_struct> id
			if (<temp_struct>.id = <id>)
				return true menu_struct = <temp_struct>
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script debug_submenu_get_new_menu_choose_script 
	RequireParams \{[
			item_struct
		]
		all}
	if StructureContains structure = <item_struct> menu_params
		menu_params = (<item_struct>.menu_params)
	endif
	if StructureContains structure = <item_struct> additional_choose_script
		additional_choose_script = (<item_struct>.additional_choose_script)
	endif
	if StructureContains structure = <item_struct> additional_choose_params
		additional_choose_params = (<item_struct>.additional_choose_params)
	endif
	return {
		pad_choose_script = generic_event_choose
		pad_choose_params = {state = uistate_debug_submenu data = {menu_id = (<item_struct>.menu_id) menu_params = <menu_params>}}
		additional_choose_script = <additional_choose_script>
		additional_choose_params = <additional_choose_params>
	}
endscript

script debug_submenu_global_condition_check 
	RequireParams \{[
			Global
		]
		all}
	if ($<Global> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script debug_submenu_get_condition_script \{multiitem = 0}
	RequireParams \{[
			item_struct
		]
		all}
	<global_exists> = 0
	if (<multiitem> = 0)
		if StructureContains \{structure = item_struct
				Global}
			condition_script = debug_submenu_global_condition_check
			condition_params = {Global = (<item_struct>.Global)}
			<global_exists> = 1
		endif
	endif
	if (<global_exists> = 0)
		if StructureContains \{structure = item_struct
				condition_script}
			condition_script = (<item_struct>.condition_script)
			if StructureContains \{structure = item_struct
					condition_params}
				condition_params = (<item_struct>.condition_params)
			endif
			if (<multiitem> = 1)
				condition_params = {<condition_params> index = <index> <multiitem_params>}
			endif
		else
			ScriptAssert qs(0x85fff78a) s = (<item_struct>.text)
		endif
	endif
	return condition_script = <condition_script> condition_params = <condition_params>
endscript

script debug_submenu_set_toggle_text \{multiitem = 0}
	RequireParams \{[
			container_id
			item_struct
		]
		all}
	debug_submenu_get_condition_script item_struct = <item_struct> index = <index> multiitem_params = <multiitem_params> multiitem = <multiitem>
	if (<multiitem> = 1)
		if StructureContains structure = <item_struct> name_script
			name_builder = (<item_struct>.name_script)
			<name_builder> {<multiitem_params> index = <index>}
		endif
	else
		Name = (<item_struct>.text)
	endif
	if <condition_script> <condition_params>
		formatText TextName = toggle_text qs(0xd0b2f45b) t = <Name>
	else
		formatText TextName = toggle_text qs(0x158c86e6) t = <Name>
	endif
	<container_id> :se_setprops generic_menu_smenu_textitem_text_text = <toggle_text>
endscript

script debug_submenu_toggle_item \{multiitem = 0}
	RequireParams \{[
			container_id
			item_struct
		]
		all}
	debug_submenu_get_condition_script item_struct = <item_struct> index = <index> multiitem_params = <multiitem_params> multiitem = <multiitem>
	if <condition_script> <condition_params>
		if (<multiitem> = 0)
			if StructureContains \{structure = item_struct
					Global}
				Change GlobalName = (<item_struct>.Global) NewValue = 0
			endif
		endif
		if StructureContains \{structure = item_struct
				off_script}
			ui_sfx \{menustate = Generic
				uitype = select}
			off_script = (<item_struct>.off_script)
			if StructureContains \{structure = item_struct
					off_params}
				off_params = (<item_struct>.off_params)
			endif
			if (<multiitem> = 1)
				off_params = {<off_params> index = <index> <multiitem_params>}
			endif
			<off_script> <off_params>
		endif
	else
		if (<multiitem> = 0)
			if StructureContains \{structure = item_struct
					Global}
				Change GlobalName = (<item_struct>.Global) NewValue = 1
			endif
		endif
		if StructureContains \{structure = item_struct
				on_script}
			ui_sfx \{menustate = Generic
				uitype = select}
			on_script = (<item_struct>.on_script)
			if StructureContains \{structure = item_struct
					on_params}
				on_params = (<item_struct>.on_params)
			endif
			if (<multiitem> = 1)
				on_params = {<on_params> index = <index> <multiitem_params>}
			endif
			<on_script> <on_params>
		endif
	endif
	debug_submenu_set_toggle_text container_id = <container_id> item_struct = <item_struct> index = <index> multiitem_params = <multiitem_params> multiitem = <multiitem>
endscript

script debug_submenu_set_option_text \{multiitem = 0}
	RequireParams \{[
			container_id
			item_struct
		]
		all}
	if StructureContains \{structure = item_struct
			value_script}
		value_script = (<item_struct>.value_script)
		if StructureContains \{structure = item_struct
				value_params}
			value_params = (<item_struct>.value_params)
		endif
		if (<multiitem> = 1)
			value_params = {<value_params> index = <index> <multiitem_params>}
		endif
	else
		printf \{qs(0x7019c48d)}
		printstruct <item_struct>
		return
	endif
	<value_script> <value_params>
	if StructureContains structure = <item_struct> text_script
		text_script = (<item_struct>.text_script)
		<text_script> value = <value> index = <index> <multiitem_params>
		if (<multiitem> = 1)
			if StructureContains structure = <item_struct> name_script
				name_builder = (<item_struct>.name_script)
				<name_builder> {<multiitem_params> index = <index>}
			endif
		else
			Name = (<item_struct>.text)
		endif
		formatText TextName = item_text qs(0x06327b65) t = <Name> v = <text>
	else
		printf \{qs(0xca3c8d45)}
		printstruct <item_struct>
		return
	endif
	<container_id> :se_setprops generic_menu_smenu_textitem_text_text = <item_text>
endscript

script debug_submenu_toggle_left \{multiitem = 0}
	RequireParams \{[
			container_id
			item_struct
		]
		all}
	if StructureContains \{structure = item_struct
			value_script}
		value_script = (<item_struct>.value_script)
		if StructureContains \{structure = item_struct
				value_params}
			value_params = (<item_struct>.value_params)
		endif
		if (<multiitem> = 1)
			value_params = {<value_params> index = <index> <multiitem_params>}
		endif
	else
		ScriptAssert qs(0x939a0b19) t = (<item_struct>.text)
	endif
	<value_script> <value_params>
	if StructureContains structure = <item_struct> left_script
		pad_left_script = (<item_struct>.left_script)
		if StructureContains structure = <item_struct> left_params
			pad_left_params = (<item_struct>.left_params)
		endif
		pad_left_params = {<pad_left_params> value = <value>}
		if (<multiitem> = 1)
			pad_left_params = {<pad_left_params> index = <index> <multiitem_params>}
		endif
	endif
	<pad_left_script> <pad_left_params>
	debug_submenu_set_option_text container_id = <container_id> item_struct = <item_struct> index = <index> multiitem_params = <multiitem_params> multiitem = <multiitem>
endscript

script debug_submenu_toggle_right \{multiitem = 0}
	RequireParams \{[
			container_id
			item_struct
		]
		all}
	if StructureContains \{structure = item_struct
			value_script}
		value_script = (<item_struct>.value_script)
		if StructureContains \{structure = item_struct
				value_params}
			value_params = (<item_struct>.value_params)
		endif
		if (<multiitem> = 1)
			value_params = {<value_params> index = <index> <multiitem_params>}
		endif
	else
		ScriptAssert qs(0x939a0b19) t = (<item_struct>.text)
	endif
	<value_script> <value_params>
	if StructureContains structure = <item_struct> right_script
		pad_right_script = (<item_struct>.right_script)
		if StructureContains structure = <item_struct> right_params
			pad_right_params = (<item_struct>.right_params)
		endif
		pad_right_params = {<pad_right_params> value = <value>}
		if (<multiitem> = 1)
			pad_right_params = {<pad_right_params> index = <index> <multiitem_params>}
		endif
	endif
	<pad_right_script> <pad_right_params>
	debug_submenu_set_option_text container_id = <container_id> item_struct = <item_struct> index = <index> multiitem_params = <multiitem_params> multiitem = <multiitem>
endscript

script ui_menu_scroll_sfx 
	SoundEvent \{event = audio_ui_generic_scroll_up}
endscript

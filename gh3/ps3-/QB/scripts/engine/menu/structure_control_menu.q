
script create_vmenu_with_title \{PARENT = root_window
		Text = "Default Title"
		vmenu_id = structure_control_vmenu
		Scale = 1.8
		padding_scale = 0.8
		internal_scale = 0.5
		Pos = (50.0, 180.0)
		Dims = (200.0, 100.0)
		internal_just = [
			LEFT
			Top
		]
		just = [
			LEFT
			Top
		]
		title_color = [
			240
			90
			8
			255
		]
		title_scale = 0.7}
	SetScreenElementLock Id = <PARENT> OFF
	CreateScreenElement {
		Type = VMenu
		PARENT = <PARENT>
		Id = <vmenu_id>
		font = text_A1
		just = [LEFT Top]
		Pos = <Pos>
		Scale = <Scale>
		padding_scale = <padding_scale>
		internal_scale = <internal_scale>
		internal_just = <internal_just>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = text_A1
		Text = <Text>
		Scale = <title_scale>
		rgba = <title_color>
		NOT_FOCUSABLE
	}
	AssignAlias Id = <vmenu_id> alias = current_menu
endscript

script structure_control_menu_create \{title_color = [
			240
			90
			8
			255
		]
		label_color = [
			176
			210
			224
			255
		]
		value_color = [
			255
			255
			255
			255
		]
		run_callback_on_create = 0}
	create_vmenu_with_title <...>
	SetScreenElementProps {
		Id = current_menu
		event_handlers = [
			{pad_back <pad_back_script> Params = <pad_back_params>}
			{pad_square structure_control_menu_toggle_link}
			{pad_choose structure_control_menu_toggle_step_speed}
		]
		Replace_Handlers
	}
	current_menu :SetTags label_color = <label_color> value_color = <value_color>
	structure_control_menu_toggle_link
	structure_control_menu_toggle_step_speed
	if NOT GlobalExists Name = <Structure> Type = Structure
		ScriptAssert "global structure '%s' does not exist!" S = <Structure>
	endif
	GetArraySize \{control_items}
	I = 0
	begin
	structure_control_menu_add_item {
		menu_callback = <callback>
		menu_structure = <Structure>
		index_item_labels = <index_item_labels>
		(<control_items> [<I>])
	}
	I = (<I> + 1)
	repeat <array_Size>
	if GotParam \{choose_items}
		ForEachIn <choose_items> do = structure_control_menu_add_choose_item
	endif
	if (<run_callback_on_create> = 1)
		<callback> <Structure>
	endif
	LaunchEvent \{Type = Focus
		Target = current_menu}
endscript

script structure_control_menu_refresh \{Id = current_menu}
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	GetScreenElementChildren Id = <Id>
	GetArraySize \{children}
	I = 0
	begin
	RunScriptOnScreenElement Id = (<children> [<I>]) structure_control_menu_control_item_refresh
	I = (<I> + 1)
	repeat <array_Size>
endscript

script structure_control_menu_toggle_link 
	values_linked = 1
	current_menu :GetSingleTag \{values_linked}
	if (<values_linked> = 0)
		current_menu :SetTags \{values_linked = 1}
	else
		current_menu :SetTags \{values_linked = 0}
	endif
endscript

script structure_control_menu_toggle_step_speed 
	if current_menu :GetSingleTag \{choose_action_override}
		<choose_action_override> :structure_control_menu_choose_item_action
	else
		step_speed = 1
		current_menu :GetSingleTag \{step_speed}
		if (<step_speed> = 10)
			current_menu :SetTags \{step_speed = 1}
		else
			current_menu :SetTags \{step_speed = 10}
		endif
	endif
endscript

script structure_control_menu_verify_presence 
	if NOT StructureContains Structure = (<Structure>) <Param>
		ScriptAssert \{"param does not exist in given structure! look above for details"}
	endif
	if GlobalExists Name = <Param>
		ScriptAssert \{"you can't have a param name that conflicts with a global. this causes script interpreter errors"}
	endif
endscript

script structure_control_menu_add_item \{Text = "Default Param Name"
		Min = 1
		MAX = 10
		range_loop = 0
		step = 1}
	if GotParam \{separator}
		CreateScreenElement \{Type = TextElement
			PARENT = current_menu
			Text = " "
			font = text_A1
			Scale = 0.4
			NOT_FOCUSABLE}
		return
	endif
	if NOT GotParam \{callback}
		callback = <menu_callback>
	endif
	if NOT GotParam \{Structure}
		Structure = <menu_structure>
	endif
	structure_control_menu_verify_presence Structure = <Structure> Param = <Param>
	if IsArray (<Structure>.<Param>)
		GetArraySize (<Structure>.<Param>)
		I = 0
		begin
		if GotParam \{index_item_labels}
			Sub = (<index_item_labels> [<I>])
		else
			Sub = <I>
		endif
		FormatText TextName = new_text "%s(%i)" S = <Text> I = <Sub>
		MangleChecksums A = <Param> B = <I>
		structure_control_menu_add_control_item {
			<...>
			array_param_index = <I>
			array_param_size = <array_Size>
			Text = <new_text>
			Id = <mangled_ID>
		}
		I = (<I> + 1)
		repeat <array_Size>
	else
		structure_control_menu_add_control_item {
			<...>
			Text = <Text>
			Id = <Param>
		}
	endif
endscript

script structure_control_menu_add_choose_item \{Text = "Default Text"}
	current_menu :GetSingleTag \{label_color}
	CreateScreenElement {
		Type = TextElement
		PARENT = current_menu
		local_id = <Id>
		Text = <Text>
		font = text_A1
		Scale = 0.4
		rgba = <label_color>
		<focusable>
		event_handlers = [
			{Focus structure_control_menu_choose_item_focus}
			{unfocus structure_control_menu_choose_item_unfocus}
		]
	}
	<Id> :SetTags {
		action = {
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
		}
	}
endscript

script structure_control_menu_add_control_item 
	control_params = <...>
	current_menu :GetSingleTag \{label_color}
	CreateScreenElement {
		Type = TextElement
		PARENT = current_menu
		local_id = <Id>
		Text = <Text>
		font = text_A1
		Scale = 0.4
		rgba = <label_color>
		event_handlers = [
			{Focus structure_control_menu_control_item_focus}
			{unfocus structure_control_menu_control_item_unfocus}
		]
	}
	PARENT = <Id>
	<PARENT> :SetTags control_params = <control_params>
	current_menu :GetSingleTag \{value_color}
	CreateScreenElement {
		Type = TextElement
		PARENT = <PARENT>
		local_id = value_display
		font = text_A1
		just = [Center Top]
		Pos = (450.0, 0.0)
		Text = " "
		rgba = <value_color>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <PARENT>
		local_id = left_arrow
		texture = left_arrow
		rgba = <label_color>
		Pos = (375.0, 5.0)
		just = [RIGHT Top]
		Scale = 0.75
		Alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <PARENT>
		local_id = right_arrow
		texture = right_arrow
		rgba = <label_color>
		Pos = (525.0, 5.0)
		just = [LEFT Top]
		Scale = 0.75
		Alpha = 0
	}
	SetScreenElementProps {
		Id = <PARENT>
		event_handlers = [{PAD_LEFT structure_control_menu_control_item_change Params = {LEFT}}
			{pad_right structure_control_menu_control_item_change Params = {RIGHT}}
		]
		Replace_Handlers
	}
	<PARENT> :structure_control_menu_control_item_refresh
endscript

script structure_control_menu_find_existing_value_index 
	if GotParam \{values}
		GetArraySize \{values}
		num_values = <array_Size>
		GetArraySize \{value_labels}
		if NOT (<num_values> = <array_Size>)
			ScriptAssert \{"Mismatch in size of values and value_labels!"}
		endif
		selection_index = -1
		I = 0
		begin
		if ((<values> [<I>]) = <Value>)
			selection_index = <I>
		endif
		I = (<I> + 1)
		repeat <num_values>
		if (<selection_index> < 0)
			ScriptAssert \{"current param value not found in item options"}
		endif
		SetTags selection_index = <selection_index>
	endif
endscript

script structure_control_menu_control_item_change 
	Obj_GetID
	GetSingleTag \{control_params}
	current_menu :GetSingleTag \{step_speed}
	if GotParam \{LEFT}
		DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1
		DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 0
		if StructureContains \{Structure = control_params
				values}
			GetSingleTag \{selection_index}
			selection_index = (<selection_index> -1)
			GetArraySize (<control_params>.values)
			if (<selection_index> < 0)
				if ((<control_params>.range_loop) = 1)
					selection_index = (<array_Size> -1)
					DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1 Time = 0.3
				else
					selection_index = 0
				endif
			else
				if ((<selection_index> > 0) || ((<control_params>.range_loop) = 1))
					DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1 Time = 0.3
				endif
			endif
			New_Value = (<control_params>.values [<selection_index>])
			SetTags selection_index = <selection_index>
		else
			New_Value = ((<control_params>.Value) - ((<control_params>.step) * <step_speed>))
			if NOT (<New_Value> > (<control_params>.Min))
				if ((<control_params>.range_loop) = 1)
					New_Value = ((<control_params>.MAX) + <New_Value>)
					DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1 Time = 0.3
				else
					New_Value = (<control_params>.Min)
				endif
			else
				DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1 Time = 0.3
			endif
		endif
	endif
	if GotParam \{RIGHT}
		DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 0
		DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1
		if StructureContains \{Structure = control_params
				values}
			GetSingleTag \{selection_index}
			selection_index = (<selection_index> + 1)
			GetArraySize (<control_params>.values)
			if NOT (<selection_index> < <array_Size>)
				if ((<control_params>.range_loop) = 1)
					selection_index = 0
					DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1 Time = 0.3
				else
					selection_index = (<array_Size> -1)
				endif
			else
				if ((<selection_index> < (<array_Size> -1)) || ((<control_params>.range_loop) = 1))
					DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1 Time = 0.3
				endif
			endif
			New_Value = (<control_params>.values [<selection_index>])
			SetTags selection_index = <selection_index>
		else
			New_Value = ((<control_params>.Value) + ((<control_params>.step) * <step_speed>))
			if NOT (<New_Value> < (<control_params>.MAX))
				if ((<control_params>.range_loop) = 1)
					New_Value = (<New_Value> - (<control_params>.MAX))
					DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1 Time = 0.3
				else
					New_Value = (<control_params>.MAX)
				endif
			else
				DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1 Time = 0.3
			endif
		endif
	endif
	structure_control_menu_change_structure New_Value = <New_Value>
endscript

script structure_control_menu_change_structure 
	GetSingleTag \{control_params}
	Structure = (<control_params>.Structure)
	Param = (<control_params>.Param)
	param_links = (<control_params>.param_links)
	Value = <New_Value>
	Index = (<control_params>.array_param_index)
	structure_control_menu_apply_param_change Param {
		Structure = <Structure>
		Param = <Param>
		New_Value = <Value>
		Index = <Index>
	}
	current_menu :GetSingleTag \{values_linked}
	if (<values_linked> = 1)
		if GotParam \{Index}
			I = 0
			begin
			if NOT (<I> = <Index>)
				structure_control_menu_apply_param_change Param {
					Structure = <Structure>
					Param = <Param>
					New_Value = <Value>
					Index = <I>
				}
			endif
			I = (<I> + 1)
			repeat (<control_params>.array_param_size)
		endif
		if GotParam \{param_links}
			I = 0
			GetArraySize \{param_links}
			begin
			structure_control_menu_apply_param_change Param {
				Structure = <Structure>
				Param = (<param_links> [<I>])
				New_Value = <Value>
				Index = <Index>
			}
			I = (<I> + 1)
			repeat <array_Size>
		endif
	endif
	(<control_params>.callback) (<Structure>)
endscript

script structure_control_menu_apply_param_change 
	structure_control_menu_verify_presence Structure = <Structure> Param = <Param>
	Id = <Param>
	if GotParam \{Index}
		array_value = (<Structure>.<Param>)
		SetArrayElement ArrayName = array_value Index = <Index> NewValue = <New_Value>
		AddParam Name = <Param> structure_name = new_params Value = <array_value>
		MangleChecksums A = <Param> B = <Index>
		Id = <mangled_ID>
	else
		AddParam Name = <Param> structure_name = new_params Value = <New_Value>
	endif
	Change GlobalName = <Structure> NewValue = {(<Structure>) <new_params>}
	RunScriptOnScreenElement Id = {current_menu child = <Id>} structure_control_menu_control_item_refresh
endscript

script structure_control_menu_control_item_refresh 
	Obj_GetID
	if NOT GetSingleTag \{control_params}
		return
	endif
	Structure = (<control_params>.Structure)
	Param = (<control_params>.Param)
	Index = (<control_params>.array_param_index)
	values = (<control_params>.values)
	structure_control_menu_verify_presence Structure = <Structure> Param = <Param>
	if GotParam \{Index}
		array_value = (<Structure>.<Param>)
		New_Value = (<array_value> [<Index>])
	else
		New_Value = (<Structure>.<Param>)
		if GotParam \{values}
			structure_control_menu_find_existing_value_index <control_params> Value = <New_Value>
		endif
	endif
	new_params = {<control_params> Value = <New_Value>}
	SetTags control_params = <new_params>
	control_params = <new_params>
	if GotParam \{values}
		GetSingleTag \{selection_index}
		display_value = (<control_params>.value_labels [<selection_index>])
	else
		FormatText TextName = display_value "%v" V = (<control_params>.Value) DecimalPlaces = 2
	endif
	SetScreenElementProps {
		Id = {<ObjID> child = value_display}
		Text = <display_value>
	}
endscript

script structure_control_menu_control_item_focus 
	Obj_GetID
	GetSingleTag \{control_params}
	if StructureContains \{Structure = control_params
			values}
		GetSingleTag \{selection_index}
		GetArraySize (<control_params>.values)
		if ((<selection_index> > 0) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1
		endif
		if ((<selection_index> < (<array_Size> -1)) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1
		endif
	else
		if (((<control_params>.Value) > (<control_params>.Min)) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 1
		endif
		if (((<control_params>.Value) < (<control_params>.MAX)) || ((<control_params>.range_loop) = 1))
			DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 1
		endif
	endif
endscript

script structure_control_menu_control_item_unfocus 
	Obj_GetID
	DoScreenElementMorph Id = {<ObjID> child = right_arrow} Alpha = 0
	DoScreenElementMorph Id = {<ObjID> child = left_arrow} Alpha = 0
endscript

script structure_control_menu_choose_item_focus 
	GetProps
	SetTags old_rgba = <rgba>
	SetProps \{rgba = [
			255
			208
			0
			200
		]}
	Obj_GetID
	current_menu :SetTags choose_action_override = <ObjID>
endscript

script structure_control_menu_choose_item_unfocus \{old_rgba = [
			176
			210
			244
			255
		]}
	GetSingleTag \{old_rgba}
	SetProps rgba = <old_rgba>
	current_menu :RemoveTags \{[
			choose_action_override
		]}
endscript

script structure_control_menu_choose_item_action 
	GetSingleTag \{action}
	(<action>.pad_choose_script) (<action>.pad_choose_params)
endscript

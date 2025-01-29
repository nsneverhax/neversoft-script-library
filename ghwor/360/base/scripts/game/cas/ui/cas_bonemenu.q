
script cas_bonemenu_begin 
	printf \{'cas_bonemenu_begin'}
	if NOT checksumequals \{a = $cas_reskin_preview
			b = None}
		ScriptAssert \{'bonemenu logic issue'}
	endif
	ExtendCrc <part> '_reskin' out = reskin_object
	Change cas_reskin_preview = <reskin_object>
	Change \{cas_flush_temporaries = 0}
endscript

script cas_bonemenu_apply_changes 
	updatecurrentcasmodel buildscript = modelbuilder_update_reskins buildscriptparams = {kill_objects = <kill_objects>}
endscript

script cas_bonemenu_exit 
	printf \{'cas_bonemenu_exit'}
	cas_bonemenu_cleanup
	if NOT is_accepting_invite_or_sigining_out
		cas_bonemenu_apply_changes \{kill_objects = 1}
	endif
	flushdeadobjects
	if getcurrentcasobject
		<cas_object> :Obj_ForceUpdate
	endif
	ExtendCrc <part> '_reskin' out = reskin_object
	if NOT checksumequals a = $cas_reskin_preview b = <reskin_object>
		ScriptAssert \{'bonemenu logic issue'}
	endif
	Change \{cas_reskin_preview = None}
	Change \{cas_flush_temporaries = 1}
endscript

script cas_bonemenu_cleanup 
	ForEachIn \{$master_editable_list
		do = cas_bonemenu_cleanup_foreach}
endscript

script cas_bonemenu_cleanup_foreach 
	ExtendCrc <part> '_reskin' out = reskin_object
	if CompositeObjectExists Name = <reskin_object>
		printf 'cas_bonemenu_cleanup_foreach: Deleting %a' a = <reskin_object>
		<reskin_object> :Die
	endif
endscript

script cas_create_bonemenu_slider 
	cas_get_bone_slider_ids deform_info = <deform_info>
	sliderbar_add_item {
		text = (<deform_info>.frontend_desc)
		focus_script = cas_bonemenu_focus
		focus_params = {
			pad_left_handler = cas_bone_menu_down
			pad_right_handler = cas_bone_menu_up
			handler_params = {deform_info = <deform_info> part = <part>}
			up_arrow_id = <up_arrow_id>
			down_arrow_id = <down_arrow_id>
			part = <part>
			color_bar_id = <slider_id>
		}
		unfocus_script = cas_bonemenu_unfocus
		unfocus_params = {
			up_arrow_id = <up_arrow_id>
			down_arrow_id = <down_arrow_id>
			color_bar_id = <slider_id>
		}
		pad_choose_script = guitar_select_handler_change
		pad_choose_params = {
			pad_down_handler = cas_bone_menu_down
			pad_up_handler = cas_bone_menu_up
			up_arrow_id = <up_arrow_id>
			down_arrow_id = <down_arrow_id>
			color_bar_id = <slider_id>
			handler_params = {deform_info = <deform_info> part = <part>}
		}
		child_texture = bw_slider
		icon_id = <slider_id>
		icon_scale = $colormenu_bar_scale
		icon_rgba = $colormenu_bar_unfocus_rgba
		icon_pos = $colormenu_bar_pos
		text_pos = $colormenu_text_pos
		text_just = [right center]
		tab = tab3
		anchor_id = <anchor_id>
		up_arrow_id = <up_arrow_id>
		down_arrow_id = <down_arrow_id>
		arrow_pos_up = $colormenu_arrow_pos_up
		arrow_pos_down = $colormenu_arrow_pos_down
		arrow_rgba = $colormenu_arrow_rgba
		text_pos = <text_pos>
		icon_pos = <icon_pos>
		arrow_pos_up = <arrow_pos_up>
		arrow_pos_down = <arrow_pos_down>
		dims = <dims>
		bar_pos = $colormenu_bar_pos
	}
	cas_refresh_bone_sliders deform_info = <deform_info> part = <part>
endscript

script cas_get_bone_slider_ids 
	MangleChecksums a = bone_deform_slider b = (<deform_info>.group_name)
	slider_id = <mangled_ID>
	MangleChecksums a = bone_deform_anchor b = (<deform_info>.group_name)
	anchor_id = <mangled_ID>
	MangleChecksums a = bone_deform_slider_up_arrow b = (<deform_info>.group_name)
	up_arrow_id = <mangled_ID>
	MangleChecksums a = bone_deform_slider_down_arrow b = (<deform_info>.group_name)
	down_arrow_id = <mangled_ID>
	return {
		slider_id = <slider_id>
		anchor_id = <anchor_id>
		up_arrow_id = <up_arrow_id>
		down_arrow_id = <down_arrow_id>
	}
endscript

script cas_bone_menu_down 
	cas_get_bone_slider_value part = <part> group_name = (<deform_info>.group_name)
	slider = (<slider> - 0.1)
	cas_get_min_bone_slider deform_info = <deform_info>
	if (<slider> < <min_slider>)
		slider = <min_slider>
	endif
	cas_set_bone_slider part = <part> group_name = (<deform_info>.group_name) slider = <slider>
	cas_bonemenu_apply_changes
	cas_refresh_bone_sliders deform_info = <deform_info> part = <part>
endscript

script cas_bone_menu_up 
	cas_get_bone_slider_value part = <part> group_name = (<deform_info>.group_name)
	slider = (<slider> + 0.1)
	cas_get_max_bone_slider deform_info = <deform_info>
	if (<slider> > <max_slider>)
		slider = <max_slider>
	endif
	cas_set_bone_slider part = <part> group_name = (<deform_info>.group_name) slider = <slider>
	cas_bonemenu_apply_changes
	cas_refresh_bone_sliders deform_info = <deform_info> part = <part>
endscript

script cas_refresh_given_bone_slider 
	RequireParams \{[
			part
			group_name
			deform_array
		]
		all}
	i = 0
	GetArraySize <deform_array> globalarray
	begin
	if checksumequals a = ($<deform_array> [<i>].group_name) b = <group_name>
		cas_refresh_bone_sliders deform_info = ($<deform_array> [<i>]) part = <part>
		return
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cas_refresh_bone_sliders 
	cas_get_min_bone_slider deform_info = <deform_info>
	cas_get_max_bone_slider deform_info = <deform_info>
	cas_get_bone_slider_value part = <part> group_name = (<deform_info>.group_name)
	sliderbar_rescale_to_bar min = <min_slider> Max = <max_slider> value = <slider> left = $colormenu_wrap_arrow_left right = $colormenu_wrap_arrow_right
	cas_get_bone_slider_ids deform_info = <deform_info>
	if ScreenElementExists id = <up_arrow_id>
		SetScreenElementProps {
			id = <up_arrow_id>
			Pos = ((1.0, 0.0) * <x_val>)
			Scale = $colormenu_arrow_scale
		}
	endif
	if ScreenElementExists id = <down_arrow_id>
		SetScreenElementProps {
			id = <down_arrow_id>
			Pos = ((1.0, 0.0) * <x_val>)
			Scale = $colormenu_arrow_scale
		}
	endif
endscript

script cas_bonemenu_focus 
	GetTags
	Obj_GetID
	<id> = <objID>
	legacydoscreenelementmorph id = {<id> child = 2} alpha = 1.0 time = 0
	if GotParam \{pad_left_handler}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_left <pad_left_handler> params = <handler_params>}
			]
			replace_handlers
		}
	endif
	if GotParam \{pad_right_handler}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_right <pad_right_handler> params = <handler_params>}
			]
			replace_handlers
		}
	endif
	SetScreenElementProps {
		id = <color_bar_id>
		rgba = $colormenu_bar_focus_rgba
	}
	legacydoscreenelementmorph {
		id = <down_arrow_id>
		Scale = $colormenu_arrow_scale
	}
	legacydoscreenelementmorph {
		id = <up_arrow_id>
		Scale = $colormenu_arrow_scale
	}
endscript

script cas_bonemenu_unfocus 
	GetTags
	Obj_GetID
	<id> = <objID>
	legacydoscreenelementmorph id = {<id> child = 2} alpha = 0 time = 0
	SetScreenElementProps {
		id = <color_bar_id>
		rgba = $colormenu_bar_unfocus_rgba
	}
endscript

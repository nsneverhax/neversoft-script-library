exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script make_menu_frontend {
		screen = drummer
		pad_back_script = generic_event_back
		item_scale = 2.0
		exclusive_device = ($primary_controller)
	}
	set_focus_color
	set_unfocus_color
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	else
		add_gamertag_helper exclusive_device = <exclusive_device>
	endif
	destroy_viewport_ui
	title_dims = (550.0, 125.0)
	title_rgba = (($g_menu_colors).alert_red)
	switch (<screen>)
		case drummer
		create_viewport_ui \{texture = `tex/zones/sound_stage/alpha_texture_drummer.dds`}
		desc = 'viewport_drummer'
		title_rgba = [220 200 200 255]
		title_dims = (550.0, 200.0)
		case guitarist
		create_viewport_ui \{texture = `tex/zones/sound_stage/alpha_texture_guitarist.dds`}
		desc = 'viewport_guitarist'
		case bassist
		create_viewport_ui \{texture = `tex/zones/sound_stage/alpha_texture_basist.dds`}
		desc = 'viewport_bassist'
		title_dims = (600.0, 300.0)
	endswitch
	update_ingame_controllers controller = <exclusive_device>
	destroyscreenelement \{id = current_menu_anchor}
	assignalias id = <window_id> alias = current_menu_anchor
	createscreenelement {
		parent = <window_id>
		type = descinterface
		desc = <desc>
		exclusive_device = <exclusive_device>
	}
	desc_id = <id>
	if gotparam \{title}
		if <desc_id> :desc_resolvealias name = alias_title_container
			split_text_into_menu {
				text = <title>
				dims = <title_dims>
				fit_major = `fit content`
				fit_minor = `fit content`
				text_params = {
					z_priority = 525.0
					rgba = <title_rgba>
					font = fontgrid_text_a11_large
					use_shadow = true
					shadow_rgba =
					[
						0 , 0 , 0 , 255
					]
					shadow_offs = (-3.0, -3.0)
				}
				pos_anchor = [center center]
				just = [center , center]
				internal_just = [center center]
				parent = <resolved_id>
				spacing_between = -10
				pos = (0.0, 15.0)
			}
			letter_scale = [1.8 1.5 1.2 1.5]
			s = Random (@ 0 @ 1 )
			i = 0
			begin
			text_element = (<text_element_array> [<i>])
			<text_element> :se_setprops internal_scale = (<letter_scale> [<s>])
			s = (<s> + 1)
			if (<s> > 3)
				s = 0
			endif
			i = (<i> + 1)
			repeat <text_element_array_size>
		endif
	endif
	if NOT gotparam \{no_menu}
		if <id> :desc_resolvealias name = alias_body
			getscreenelementdims id = <resolved_id>
			createscreenelement {
				type = descinterface
				parent = <resolved_id>
				desc = 'menu_frontend'
				menu_dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
			}
			if <id> :desc_resolvealias name = alias_menu
				assignalias id = <resolved_id> alias = current_menu
				current_menu :se_setprops {
					event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
						{pad_back <pad_back_script> params = <pad_back_params>}
					]
					spacing_between = <spacing_between>
					internal_just = [left center]
					tags = {item_scale = <item_scale>}
				}
			endif
		endif
	endif
	return {window_id = <window_id> desc_id = <desc_id>}
endscript

script clear_exclusive_devices 
	change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 0
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 1
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 2
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 3
			newvalue = -1}
	endif
	setarrayelement arrayname = exclusive_mp_controllers globalarray index = ($num_exclusive_mp_controllers) newvalue = <device>
	change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript

script add_menu_frontend_item {
		pad_choose_script = nullscript
		rgba = ($menu_unfocus_color)
		item_height = 50
	}
	if screenelementexists \{id = current_menu}
		getscreenelementdims \{id = current_menu}
		current_menu :getsingletag \{item_scale}
		if gotparam \{choose_state}
			pad_choose_script = generic_event_choose
			pad_choose_params = {state = <choose_state> data = {<choose_state_data>}}
		endif
		if gotparam \{not_focusable}
			focus = {not_focusable}
		endif
		createscreenelement {
			type = descinterface
			parent = current_menu
			desc = 'menu_item'
			autosizedims = false
			scale = <item_scale>
			item_dims = (((1.0, 0.0) * <width> * (1.0 / <item_scale>)) + ((0.0, 1.0) * <item_height>))
			dims = (((1.0, 0.0) * <width> * (1.0 / <item_scale>)) + ((0.0, 1.0) * <item_height>))
			item_text = <text>
			text_rgba = <rgba>
			text_pos = <pos>
			text_internal_just = [center center]
			event_handlers = [
				{focus menu_frontend_focus}
				{unfocus menu_frontend_unfocus}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_choose generic_menu_pad_choose_sound}
			]
			tags = {rgba = <rgba>}
			<focus>
		}
		resolvescreenelementid id = {<id> child = 0}
		return item_container_id = <resolved_id> item_id = <id>
	endif
endscript

script menu_frontend_focus 
	if desc_resolvealias \{name = alias_text}
		retail_menu_focus id = <resolved_id>
	endif
endscript

script menu_frontend_unfocus 
	gettags
	if gotparam \{rgba}
		set_unfocus_color rgba = <rgba>
	endif
	if desc_resolvealias \{name = alias_text}
		retail_menu_unfocus id = <resolved_id>
	endif
	if gotparam \{rgba}
		set_unfocus_color
	endif
endscript

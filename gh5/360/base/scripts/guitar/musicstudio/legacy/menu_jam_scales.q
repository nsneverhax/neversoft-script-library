jam_roots = [
	{
		name_text = qs(0x69bdca15)
	}
	{
		name_text = qs(0x429099d6)
	}
	{
		name_text = qs(0xe0187c88)
	}
	{
		name_text = qs(0x5b8ba897)
	}
	{
		name_text = qs(0x94ad3a75)
	}
	{
		name_text = qs(0x0dd10f11)
	}
	{
		name_text = qs(0x8618959b)
	}
	{
		name_text = qs(0x26fc5cd2)
	}
	{
		name_text = qs(0x3fe76d93)
	}
	{
		name_text = qs(0xd7c68cba)
	}
	{
		name_text = qs(0x70a6fb54)
	}
	{
		name_text = qs(0x1bcfad22)
	}
]

script create_menu_jam_scales \{controller = 0}
	LaunchEvent Type = unfocus target = <vmenu_id>
	formatText checksumName = player_pause_scales 'jam_band_pause_scales_%s' s = <select_player>
	if ScreenElementExists id = <player_pause_scales>
		DestroyScreenElement id = <player_pause_scales>
	endif
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		case 1
		inst_logo = theme_guitar
		case 2
		inst_logo = theme_bass
		case 3
		inst_logo = theme_drum
		case 4
		case 5
		inst_logo = theme_vocal
	endswitch
	formatText TextName = player_string qs(0x033007b2) s = <select_player>
	if ($jam_advanced_record = 0)
		CreateScreenElement {
			Type = ContainerElement
			id = <player_pause_scales>
			parent = <player_cont>
			Pos = (0.0, -40.0)
		}
		getplayerinfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		CreateScreenElement {
			parent = <player_pause_scales>
			Type = descinterface
			Pos = (-141.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_band_pause_screen'
			inst_icon_texture = <inst_logo>
			player_number_text = <player_string>
			pause_header_text = qs(0xf5bd05ec)
			band_leader_alpha = <band_leader_alpha>
		}
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{Color = white220}
		set_unfocus_color rgba = <pause_font_color>
		menu_pos = (0.0, 140.0)
	else
		CreateScreenElement {
			local_id = clip_window_pause_scales
			Type = WindowElement
			parent = <player_cont>
			just = [left top]
			Pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		CreateScreenElement {
			Type = ContainerElement
			id = <player_pause_scales>
			parent = <id>
			Pos = (133.0, -57.0)
		}
		CreateScreenElement {
			parent = <player_pause_scales>
			Type = descinterface
			Pos = (-143.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_advanced_pause_screen'
			pause_header_text = qs(0xf5bd05ec)
			inst_icon_texture = <inst_logo>
		}
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{Color = white220}
		set_unfocus_color rgba = <pause_font_color>
		menu_pos = (2.0, 140.0)
	endif
	formatText checksumName = player_pause_scales_cont 'jam_band_pause_scales_cont_%s' s = <select_player>
	if ScreenElementExists id = <player_pause_scales_cont>
		DestroyScreenElement id = <player_pause_scales_cont>
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <player_pause_scales_cont>
		parent = <player_pause_scales>
		Pos = <menu_pos>
	}
	formatText checksumName = scrolling_scales 'jam_scrolling_scales_%s' s = <select_player>
	formatText checksumName = vmenu_scales 'jam_vmenu_scales_%s' s = <select_player>
	getplayerinfo <select_player> controller
	new_menu {
		scrollid = <scrolling_scales>
		vmenuid = <vmenu_scales>
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		default_colors = 0
		exclusive_device = <controller>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_circle destroy_menu_jam_scales params = {select_player = <select_player>}}
			{pad_start destroy_menu_jam_scales params = {select_player = <select_player>}}
		]
		menu_parent = <player_pause_scales_cont>
	}
	text_params = {Type = TextElement font = fontgrid_text_a3 just = [center center] Scale = 0.6 rgba = ($menu_unfocus_color) z_priority = 60}
	formatText checksumName = scales_root_text 'jam_scales_root_txt_%s' s = <select_player>
	formatText checksumName = scales_root_ctn 'jam_scales_root_ctn_%s' s = <select_player>
	CreateScreenElement {
		Type = ContainerElement
		id = <scales_root_ctn>
		parent = <vmenu_scales>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_root_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_root_text>}}
			{pad_choose change_scales_option params = {ops_array = jam_roots ops_index = jam_track_rootnotes text_id = <scales_root_text> parent = <player_pause_scales_cont> vmenu_scales = <vmenu_scales> select_player = <select_player>}}
		]
	}
	roots = ($jam_track_rootnotes)
	getplayerinfo <select_player> jam_instrument
	root = (<roots> [<jam_instrument>])
	formatText TextName = root_text qs(0x1684e961) s = ($jam_roots [<root>].name_text)
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_pause_scales_cont>
		id = <scales_root_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [left center]
		Scale = 1
		rgba = <pause_font_color>
		Pos = (15.0, 0.0)
		dims = (180.0, 30.0)
		text = <root_text>
		z_priority = 60
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	printf channel = jam_mode qs(0x73307931) s = ($jam_roots [<root>].name_text)
	formatText checksumName = scales_scale_text 'jam_scales_scale_txt_%s' s = <select_player>
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_scales>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_scale_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_scale_text>}}
			{pad_choose change_scales_option params = {ops_array = jam_scales_new ops_index = jam_track_scaleindex text_id = <scales_scale_text> parent = <player_pause_scales_cont> vmenu_scales = <vmenu_scales> select_player = <select_player>}}
		]
	}
	<scale_indices> = ($jam_track_scaleindex)
	<scale_index> = (<scale_indices> [<jam_instrument>])
	<scale_name_txt> = (($jam_scales_new [<scale_index>]).name_text)
	formatText TextName = scale_text qs(0x7dde4785) s = <scale_name_txt>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_pause_scales_cont>
		id = <scales_scale_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [left center]
		Scale = 1
		rgba = <pause_font_color>
		Pos = (15.0, 30.0)
		dims = (180.0, 30.0)
		text = <scale_text>
		z_priority = 60
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	if (<jam_instrument> = 1)
		formatText checksumName = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_scales>
			dims = (100.0, 60.0)
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <scales_range_txt>}}
				{unfocus retail_menu_unfocus params = {id = <scales_range_txt>}}
				{pad_choose jam_scales_toggle_lead_range params = {select_player = <select_player>}}
			]
		}
		switch ($jam_lead_octave_range)
			case 1
			<Range> = qs(0x359c9c2f)
			case 2
			<Range> = qs(0x448b8949)
		endswitch
		formatText TextName = range_text qs(0x322ac4ff) s = <Range>
		CreateScreenElement {
			Type = TextBlockElement
			parent = <player_pause_scales_cont>
			id = <scales_range_txt>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			Scale = 1
			rgba = <pause_font_color>
			Pos = (15.0, 60.0)
			dims = (180.0, 30.0)
			text = <range_text>
			z_priority = 60
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
	elseif (<jam_instrument> = 4)
		formatText checksumName = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_scales>
			dims = (100.0, 60.0)
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <scales_range_txt>}}
				{unfocus retail_menu_unfocus params = {id = <scales_range_txt>}}
				{pad_choose jam_scales_toggle_melody_range params = {select_player = <select_player>}}
			]
		}
		switch ($jam_melody_octave_range)
			case 1
			<Range> = qs(0x359c9c2f)
			case 2
			<Range> = qs(0x448b8949)
		endswitch
		formatText TextName = range_text qs(0x322ac4ff) s = <Range>
		CreateScreenElement {
			Type = TextBlockElement
			parent = <player_pause_scales_cont>
			id = <scales_range_txt>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			Scale = 1
			rgba = <pause_font_color>
			Pos = (15.0, 60.0)
			dims = (180.0, 30.0)
			text = <range_text>
			z_priority = 60
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
	endif
	if (<jam_instrument> = 0)
		formatText checksumName = chord_type_txt 'jam_chord_type_txt_%s' s = <select_player>
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_scales>
			dims = (100.0, 60.0)
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <chord_type_txt>}}
				{unfocus retail_menu_unfocus params = {id = <chord_type_txt>}}
				{pad_choose jam_scales_toggle_chord_type params = {select_player = <select_player>}}
			]
		}
		switch ($jam_rhythm_chord_type)
			case 0
			<chord_type> = qs(0x596dd695)
			case 1
			<chord_type> = qs(0x27c54a39)
		endswitch
		CreateScreenElement {
			Type = TextBlockElement
			parent = <player_pause_scales_cont>
			id = <chord_type_txt>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			Scale = 1
			rgba = <pause_font_color>
			Pos = (8.0, 60.0)
			dims = (170.0, 30.0)
			text = <chord_type>
			z_priority = 60
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
	endif
	if (<jam_instrument> = 0)
		create_menu_jam_scales_rhythm select_player = <select_player> player_pause_scales = <player_pause_scales_cont> parent = <vmenu_scales> font_color = <pause_font_color>
	else
		guitar_jam_scales_get_diatonic instrument = <jam_instrument>
		create_menu_jam_scales_leadbass select_player = <select_player> player_pause_scales = <player_pause_scales_cont> parent = <vmenu_scales> font_color = <pause_font_color> diatonic = <diatonic>
	endif
	if NOT (<jam_instrument> = 3)
		jam_scales_update_note_gems Player = <select_player>
	endif
	formatText checksumName = scales_band_text 'jam_scales_band_txt_%s' s = <select_player>
	formatText checksumName = scales_band_text_ctn 'jam_scales_band_ctn_%s' s = <select_player>
	if ScreenElementExists id = <scales_band_text>
		DestroyScreenElement id = <scales_band_text>
		DestroyScreenElement id = <scales_band_text_ctn>
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <scales_band_text_ctn>
		parent = <vmenu_scales>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_band_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_band_text>}}
			{pad_choose jam_set_band_scale params = {select_player = <select_player>}}
		]
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_pause_scales_cont>
		id = <scales_band_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		Pos = (0.0, 308.0)
		dims = (180.0, 30.0)
		text = qs(0x6da8e017)
		z_priority = 60
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	<scales_band_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	formatText checksumName = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formatText checksumName = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	if ScreenElementExists id = <scales_custom_text>
		DestroyScreenElement id = <scales_custom_text>
		DestroyScreenElement id = <scales_custom_ctn>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_scales>
		id = <scales_custom_ctn>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_custom_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_custom_text>}}
			{pad_choose change_scales_option_custom params = {select_player = <select_player> VMenu = <vmenu_scales>}}
		]
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_pause_scales_cont>
		id = <scales_custom_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		Pos = (0.0, 338.0)
		dims = (180.0, 30.0)
		text = qs(0x7718adc8)
		z_priority = 60
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	<scales_custom_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> custom
		<scales_custom_text> :se_setprops rgba = [120 120 120 0]
		<scales_custom_ctn> :se_setprops not_focusable
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
	LaunchEvent Type = focus target = <vmenu_scales>
endscript

script create_menu_jam_scales_rhythm 
	<parent> :SetTags num_buttons = 7 last_previewed_note = None
	button_text_params = {Type = TextElement font = fontgrid_text_a1 just = [center center] Scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {Type = TextBlockElement font = fontgrid_text_a3 just = [left center] rgba = <font_color>}
	<x_buttons> = -95
	<x_notes> = 41
	<x_notes_off> = 24
	<y_buttons> = 117
	<y_notes> = 95
	<y_inc> = 30
	<buttons> = [
		[1 2 0 0 0]
		[1 0 3 0 0]
		[0 2 3 0 0]
		[0 2 0 4 0]
		[0 0 3 4 0]
		[0 0 3 0 5]
		[0 0 0 4 5]
	]
	formatText checksumName = note_previews 'jam_preview_ctn_%s' s = <select_player>
	CreateScreenElement {
		Type = ContainerElement
		id = <note_previews>
		parent = <player_pause_scales>
		Pos = (0.0, 0.0)
	}
	<loop_count> = 0
	begin
	<cur_buttons> = (<buttons> [<loop_count>])
	<inner_loop_count> = 0
	begin
	<cur_button> = (<cur_buttons> [<inner_loop_count>])
	switch (<cur_button>)
		case 0
		<sprite> = gray_button
		case 1
		<sprite> = green_button
		case 2
		<sprite> = red_button
		case 3
		<sprite> = yellow_button
		case 4
		<sprite> = blue_button
		case 5
		<sprite> = orange_button
	endswitch
	CreateScreenElement {
		Type = SpriteElement
		parent = <note_previews>
		texture = <sprite>
		just = [left bottom]
		Pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		Scale = 0.68
		z_priority = 60
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	formatText checksumName = scales_note_text 'jam_scales_note_txt%n_%s' n = <loop_count> s = <select_player>
	formatText checksumName = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
	CreateScreenElement {
		<note_text_params>
		parent = <note_previews>
		id = <scales_note_text>
		Pos = ((<x_notes> * (1.0, 0.0)) + ((<y_notes> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		text = qs(0x9e0cb7ef)
		internal_just = [left , center]
		z_priority = 60
		dims = (50.0, 33.0)
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <scales_note_ctn>
		dims = (0.0, 0.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_note_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_note_text>}}
			{pad_choose jam_scales_custom_choose params = {index = <loop_count> VMenu = <parent> parent = <player_pause_scales> select_player = <select_player>}}
		]
	}
	<scales_note_ctn> :se_setprops not_focusable
	<loop_count> = (<loop_count> + 1)
	repeat 7
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script create_menu_jam_scales_leadbass \{diatonic = 0}
	<parent> :SetTags {num_buttons = 6 last_previewed_note = None}
	button_text_params = {Type = TextElement font = fontgrid_text_a1 just = [center center] Scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {Type = TextBlockElement font = fontgrid_text_a3 just = [left center] rgba = <font_color>}
	<x_buttons> = -95
	<x_notes> = 41
	<x_notes_off> = 24
	<y_buttons> = 122
	<y_notes> = 97
	<y_inc> = 35
	<num_notes> = 6
	<button_scale> = 0.75
	<buttons> = [
		[0 0 0 0 0]
		[1 0 0 0 0]
		[0 2 0 0 0]
		[0 0 3 0 0]
		[0 0 0 4 0]
		[0 0 0 0 5]
		[0 0 0 4 5]
	]
	formatText checksumName = note_previews 'jam_preview_ctn_%s' s = <select_player>
	if ScreenElementExists id = <note_previews>
		DestroyScreenElement id = <note_previews>
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <note_previews>
		parent = <player_pause_scales>
		Pos = (0.0, 0.0)
	}
	if (<diatonic> = 1)
		<num_notes> = 7
		<button_scale> = 0.7
		<y_inc> = 30.2
		<parent> :SetTags num_buttons = 7
	endif
	formatText checksumName = diatonic_ctn 'jam_scales_note_ctn6_%s' s = <select_player>
	if ScreenElementExists id = <diatonic_ctn>
		DestroyScreenElement id = <diatonic_ctn>
	endif
	<loop_count> = 0
	begin
	<cur_buttons> = (<buttons> [<loop_count>])
	<inner_loop_count> = 0
	begin
	<cur_button> = (<cur_buttons> [<inner_loop_count>])
	switch (<cur_button>)
		case 0
		<sprite> = gray_button
		case 1
		<sprite> = green_button
		case 2
		<sprite> = red_button
		case 3
		<sprite> = yellow_button
		case 4
		<sprite> = blue_button
		case 5
		<sprite> = orange_button
	endswitch
	CreateScreenElement {
		Type = SpriteElement
		parent = <note_previews>
		texture = <sprite>
		just = [left bottom]
		Pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		Scale = <button_scale>
		z_priority = 60
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	formatText checksumName = scales_note_text 'jam_scales_note_txt%n_%s' n = <loop_count> s = <select_player>
	formatText checksumName = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
	CreateScreenElement {
		<note_text_params>
		parent = <note_previews>
		id = <scales_note_text>
		Pos = ((<x_notes> * (1.0, 0.0)) + ((<y_notes> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		text = qs(0x9e0cb7ef)
		internal_just = [left , center]
		z_priority = 60
		dims = (50.0, 33.0)
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	if ScreenElementExists id = <scales_note_ctn>
		DestroyScreenElement id = <scales_note_ctn>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <scales_note_ctn>
		dims = (0.0, 0.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_note_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_note_text>}}
			{pad_choose jam_scales_custom_choose params = {index = <loop_count> parent = <player_pause_scales> VMenu = <parent> select_player = <select_player>}}
		]
	}
	<scales_note_ctn> :se_setprops not_focusable
	<loop_count> = (<loop_count> + 1)
	repeat <num_notes>
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
	<pause_font_color> = [80 80 80 255]
	formatText checksumName = player_pause_scales_cont 'jam_band_pause_scales_cont_%s' s = <select_player>
	formatText checksumName = scales_band_text 'jam_scales_band_txt_%s' s = <select_player>
	formatText checksumName = scales_band_text_ctn 'jam_scales_band_ctn_%s' s = <select_player>
	if ScreenElementExists id = <scales_band_text>
		DestroyScreenElement id = <scales_band_text>
		DestroyScreenElement id = <scales_band_text_ctn>
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <scales_band_text_ctn>
		parent = <parent>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_band_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_band_text>}}
			{pad_choose jam_set_band_scale params = {select_player = <select_player>}}
		]
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_pause_scales_cont>
		id = <scales_band_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		Pos = (0.0, 308.0)
		dims = (160.0, 25.0)
		text = qs(0x6da8e017)
		z_priority = 60
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	<scales_band_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	formatText checksumName = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formatText checksumName = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	if ScreenElementExists id = <scales_custom_text>
		DestroyScreenElement id = <scales_custom_text>
		DestroyScreenElement id = <scales_custom_ctn>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <scales_custom_ctn>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_custom_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_custom_text>}}
			{pad_choose change_scales_option_custom params = {select_player = <select_player> VMenu = <vmenu_scales>}}
		]
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_pause_scales_cont>
		id = <scales_custom_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		Pos = (0.0, 338.0)
		dims = (160.0, 25.0)
		text = qs(0x7718adc8)
		z_priority = 60
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	<scales_custom_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
endscript

script jam_scales_update_note_gems 
	formatText checksumName = scales_root_title 'jam_scales_root_title_%s' s = <Player>
	formatText checksumName = scales_root_text 'jam_scales_root_txt_%s' s = <Player>
	formatText checksumName = scales_root_ctn 'jam_scales_root_ctn_%s' s = <Player>
	formatText checksumName = scales_custom_text 'jam_scales_custom_txt_%s' s = <Player>
	formatText checksumName = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <Player>
	formatText checksumName = note_previews 'jam_preview_ctn_%s' s = <Player>
	getplayerinfo <Player> jam_instrument
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	<diatonic> = 0
	if (<jam_instrument> = 1 || <jam_instrument> = 2)
		scale_index = ($jam_track_scaleindex [<jam_instrument>])
		guitar_jam_scales_get_diatonic instrument = <jam_instrument>
	endif
	if StructureContains structure = <chosen_scale> custom
		if ScreenElementExists id = <scales_custom_text>
			<scales_custom_text> :se_setprops rgba = [120 120 120 0]
			<scales_custom_ctn> :se_setprops not_focusable
		endif
		<note_previews> :se_setprops Pos = (0.0, 0.0)
	else
		if ScreenElementExists id = <scales_custom_text>
			<scales_custom_text> :se_setprops text = qs(0x7718adc8)
			<scales_custom_text> :se_setprops rgba = ($menu_unfocus_color)
			<scales_custom_ctn> :se_setprops focusable
		endif
		<note_previews> :se_setprops Pos = (0.0, 0.0)
	endif
	if (<jam_instrument> = 1 || <jam_instrument> = 2)
		formatText checksumName = player_pause_scales_cont 'jam_band_pause_scales_cont_%s' s = <Player>
		formatText checksumName = vmenu_scales 'jam_vmenu_scales_%s' s = <Player>
		create_menu_jam_scales_leadbass select_player = <Player> player_pause_scales = <player_pause_scales_cont> parent = <vmenu_scales> font_color = [80 80 80 255] diatonic = <diatonic>
	endif
	<cur_active_scale_name> = ($jam_track_scales_new [<jam_instrument>])
	<cur_scale> = ($<cur_active_scale_name>)
	if (<jam_instrument> = 0)
		<gems_shown> = 7
	else
		<gems_shown> = 6
		if (<diatonic> = 1)
			<gems_shown> = 7
		endif
	endif
	<loop_count> = 0
	begin
	formatText checksumName = scales_note_text 'jam_scales_note_txt%n_%s' n = <loop_count> s = <Player>
	if ScreenElementExists id = <scales_note_text>
		<note_struct> = (<cur_scale> [<loop_count>])
		jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) Type = 0 jam_instrument = <jam_instrument>
		<final_text> = <note_text>
		if StructureContains structure = <chosen_scale> chromatic
			<main_note> = <note_text>
			if (<jam_instrument> = 0)
				<note_struct> = (<cur_scale> [<loop_count> + 7])
			else
				<note_struct> = (<cur_scale> [<loop_count> + 6])
			endif
			jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) Type = 0 jam_instrument = <jam_instrument>
			formatText TextName = final_text qs(0x53cfde30) a = <main_note> b = <note_text>
		endif
		<scales_note_text> :SetProps text = <final_text>
	endif
	if StructureContains structure = <chosen_scale> custom
		formatText checksumName = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <Player>
		if ScreenElementExists id = <scales_note_ctn>
			<scales_note_ctn> :se_setprops focusable
		endif
	endif
	<loop_count> = (<loop_count> + 1)
	repeat <gems_shown>
endscript

script change_scales_option 
	generic_menu_pad_choose_sound
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
	SetScreenElementProps id = <vmenu_scales> block_events
	formatText checksumName = scales_event_handler 'jam_scales_event_handler_%s' s = <select_player>
	getplayerinfo <select_player> controller
	CreateScreenElement {
		Type = ContainerElement
		parent = <text_id>
		id = <scales_event_handler>
		z_priority = 60
		exclusive_device = <controller>
		event_handlers = [
			{pad_up change_scales_option_updown params = {up ops_array = <ops_array> ops_index = <ops_index> text_id = <text_id> select_player = <select_player>}}
			{pad_down change_scales_option_updown params = {down ops_array = <ops_array> ops_index = <ops_index> text_id = <text_id> select_player = <select_player>}}
			{pad_choose change_scales_option_back params = {ops_array = <ops_array> vmenu_scales = <vmenu_scales> select_player = <select_player>}}
			{pad_circle change_scales_option_back params = {ops_array = <ops_array> vmenu_scales = <vmenu_scales> select_player = <select_player> back}}
			{pad_start change_scales_option_back params = {ops_array = <ops_array> vmenu_scales = <vmenu_scales> select_player = <select_player> back}}
		]
	}
	LaunchEvent Type = focus target = <scales_event_handler>
	if checksumequals a = <ops_array> b = jam_roots
		formatText checksumName = scales_arrow_up 'scales_arrow_up_%a' a = <select_player>
		CreateScreenElement {
			Type = SpriteElement
			parent = <scales_event_handler>
			id = <scales_arrow_up>
			texture = up_arrow
			just = [center center]
			Pos = (-15.0, 8.0)
			Scale = 0.5
			z_priority = 70
		}
		formatText checksumName = scales_arrow_down 'scales_arrow_down_%a' a = <select_player>
		CreateScreenElement {
			Type = SpriteElement
			parent = <scales_event_handler>
			id = <scales_arrow_down>
			texture = down_arrow
			just = [center center]
			Pos = (-15.0, 18.0)
			Scale = 0.5
			z_priority = 70
		}
	else
		formatText checksumName = scales_arrow_up 'scales_arrow_up_%a' a = <select_player>
		CreateScreenElement {
			Type = SpriteElement
			parent = <scales_event_handler>
			id = <scales_arrow_up>
			texture = up_arrow
			just = [center center]
			Pos = (-15.0, 8.0)
			Scale = 0.5
			z_priority = 70
		}
		formatText checksumName = scales_arrow_down 'scales_arrow_down_%a' a = <select_player>
		CreateScreenElement {
			Type = SpriteElement
			parent = <scales_event_handler>
			id = <scales_arrow_down>
			texture = down_arrow
			just = [center center]
			Pos = (-15.0, 18.0)
			Scale = 0.5
			z_priority = 70
		}
	endif
endscript

script change_scales_option_updown 
	getplayerinfo <select_player> jam_instrument
	ops = ($<ops_index>)
	index_in_ops = (<ops> [<jam_instrument>])
	if GotParam \{up}
		SoundEvent \{event = scale_scroll_up}
		new_option = (<index_in_ops> - 1)
		if (<new_option> < 0)
			GetArraySize ($<ops_array>)
			<new_option> = (<array_Size> - 1)
		endif
		formatText checksumName = scales_arrow_up 'scales_arrow_up_%a' a = <select_player>
		legacydoscreenelementmorph id = <scales_arrow_up> Scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <scales_arrow_up> Scale = 1.0 relative_scale time = 0.1
	elseif GotParam \{down}
		SoundEvent \{event = scale_scroll_down}
		new_option = (<index_in_ops> + 1)
		GetArraySize ($<ops_array>)
		if (<new_option> >= <array_Size>)
			<new_option> = 0
		endif
		formatText checksumName = scales_arrow_down 'scales_arrow_down_%a' a = <select_player>
		legacydoscreenelementmorph id = <scales_arrow_down> Scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <scales_arrow_down> Scale = 1.0 relative_scale time = 0.1
	endif
	SetArrayElement ArrayName = <ops_index> globalarray index = <jam_instrument> NewValue = <new_option>
	<chosen_scale> = ($<ops_array> [<new_option>])
	if checksumequals a = <ops_array> b = jam_roots
		<text> = <chosen_scale>
		formatText TextName = text qs(0x1684e961) s = <chosen_scale>
	else
		<text> = (<chosen_scale>.Name)
		formatText TextName = text qs(0x7dde4785) s = (<chosen_scale>.Name)
	endif
	SetScreenElementProps id = <text_id> text = <text>
	jam_update_scalemenu_scales ops_array = <ops_array> select_player = <select_player> new_option = <new_option>
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script jam_update_scalemenu_scales 
	getplayerinfo <select_player> jam_instrument
	formatText checksumName = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formatText checksumName = scales_root_text 'jam_scales_root_txt_%s' s = <select_player>
	formatText checksumName = scales_root_ctn 'jam_scales_root_ctn_%s' s = <select_player>
	formatText checksumName = scales_root_title 'jam_scales_root_title_%s' s = <select_player>
	formatText checksumName = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	formatText checksumName = note_previews 'jam_preview_ctn_%s' s = <select_player>
	formatText checksumName = VMenu 'jam_vmenu_scales_%s' s = <select_player>
	<VMenu> :GetTags
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> custom
		<scales_custom_text> :se_setprops rgba = [120 120 120 0]
		<scales_custom_ctn> :se_setprops not_focusable
		<note_previews> :se_setprops Pos = (0.0, 0.0)
		if checksumequals a = <ops_array> b = jam_scales_new
			<loop_count> = 0
			begin
			formatText checksumName = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
			<scales_note_ctn> :se_setprops focusable
			<loop_count> = (<loop_count> + 1)
			repeat <num_buttons>
		endif
	else
		<scales_custom_text> :se_setprops text = qs(0x7718adc8)
		<scales_custom_ctn> :se_setprops focusable
		<note_previews> :se_setprops Pos = (0.0, 0.0)
		if checksumequals a = <ops_array> b = jam_scales_new
			<loop_count> = 0
			begin
			formatText checksumName = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
			<scales_note_ctn> :se_setprops not_focusable
			<loop_count> = (<loop_count> + 1)
			repeat <num_buttons>
		endif
	endif
	guitar_jam_scales_change_scale jam_instrument = <jam_instrument>
	jam_scales_update_note_gems Player = <select_player>
endscript

script change_scales_option_back 
	SetScreenElementProps id = <vmenu_scales> unblock_events
	formatText checksumName = scales_event_handler 'jam_scales_event_handler_%s' s = <select_player>
	if ScreenElementExists id = <scales_event_handler>
		DestroyScreenElement id = <scales_event_handler>
	endif
	generic_menu_pad_back_sound
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
endscript

script change_scales_option_custom 
	getplayerinfo <select_player> jam_instrument
	<scale_index> = (($jam_track_scaleindex) [<jam_instrument>])
	<premade_struct> = (($jam_scales_new) [<scale_index>])
	if StructureContains structure = <premade_struct> custom
		return
	endif
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	<final_custom> = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	if (<jam_instrument> = 0)
		<premade_scale_name> = (<premade_struct>.pattern_rhythm)
		<premade_scale> = ($<premade_scale_name>)
		<count> = 0
		begin
		<note> = (<premade_scale> [<count>])
		<note> = (<note> + <root_note>)
		if (<note> >= 12)
			<note> = (<note> - <root_note>)
			<used_amount> = (12 - <note>)
			<note> = (<root_note> - <used_amount>)
		endif
		SetArrayElement ArrayName = final_custom index = <count> NewValue = <note>
		<count> = (<count> + 1)
		repeat 7
	else
		<premade_scale_name> = (<premade_struct>.pattern)
		<premade_scale> = ($<premade_scale_name>)
		<count> = 0
		begin
		<note> = (<premade_scale> [<count>])
		<string> = (<note> [0])
		<fret> = (<note> [1])
		jam_get_sample_checksum fret = <fret> string = <string> Type = <note_type> jam_instrument = <jam_instrument>
		<new_value> = (<note_id> + <root_note>)
		if (<new_value> > 11)
			<new_value> = (<new_value> - 12)
		endif
		SetArrayElement ArrayName = final_custom index = <count> NewValue = <new_value>
		<count> = (<count> + 1)
		repeat 6
	endif
	<custom_names_array> = ($jam_track_custom_scales_new)
	<custom_name> = (<custom_names_array> [<jam_instrument>])
	Change GlobalName = <custom_name> NewValue = <final_custom>
	GetArraySize ($jam_scales_new)
	SetArrayElement ArrayName = jam_track_scaleindex globalarray index = <jam_instrument> NewValue = (<array_Size> -1)
	<custom_struct> = (($jam_scales_new) [(<array_Size> -1)])
	<text> = qs(0x780a0bdc)
	formatText checksumName = text_id 'jam_scales_scale_txt_%s' s = <select_player>
	SetScreenElementProps id = <text_id> text = <text>
	formatText checksumName = VMenu 'jam_vmenu_scales_%s' s = <select_player>
	LaunchEvent Type = unfocus target = <VMenu>
	formatText checksumName = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formatText checksumName = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	<scales_custom_text> :se_setprops rgba = [120 120 120 0]
	<scales_custom_ctn> :se_setprops not_focusable
	formatText checksumName = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	<scales_custom_text> :se_setprops rgba = [120 120 120 0]
	<VMenu> :GetTags
	<loop_count> = 0
	begin
	formatText checksumName = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
	<scales_note_ctn> :se_setprops focusable
	<loop_count> = (<loop_count> + 1)
	repeat <num_buttons>
	jam_scales_update_note_gems Player = <select_player>
	formatText checksumName = scales_note_ctn 'jam_scales_note_ctn0_%s' s = <select_player>
	LaunchEvent Type = focus target = <VMenu> data = {child_id = <scales_note_ctn>}
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	generic_menu_pad_choose_sound
endscript

script jam_scales_custom_choose 
	SetScreenElementProps id = <VMenu> block_events
	formatText checksumName = scales_custom_event_handler 'jam_scales_custom_event_handler_%s' s = <select_player>
	getplayerinfo <select_player> controller
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <scales_custom_event_handler>
		z_priority = 75
		exclusive_device = <controller>
		event_handlers = [
			{pad_up jam_scales_custom_updown params = {up index = <index> select_player = <select_player> handler = <scales_custom_event_handler> parent_menu = <VMenu>}}
			{pad_down jam_scales_custom_updown params = {down index = <index> select_player = <select_player> handler = <scales_custom_event_handler> parent_menu = <VMenu>}}
			{pad_choose jam_scales_custom_edit_back params = {select_player = <select_player> handler = <scales_custom_event_handler> VMenu = <VMenu>}}
			{pad_circle jam_scales_custom_edit_back params = {select_player = <select_player> handler = <scales_custom_event_handler> VMenu = <VMenu>}}
			{pad_start jam_scales_custom_edit_back params = {select_player = <select_player> handler = <scales_custom_event_handler> VMenu = <VMenu>}}
		]
	}
	LaunchEvent Type = focus target = <scales_custom_event_handler>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = 0)
		<start_top> = (88.0, 91.0)
		<start_bottom> = (88.0, 101.0)
		<y_off> = 30
	else
		<start_top> = (88.0, 93.0)
		<start_bottom> = (88.0, 103.0)
		<y_off> = 35
	endif
	formatText checksumName = custom_arrow_up 'custom_scale_arrow_up_%a' a = <select_player>
	<Pos> = <start_top>
	<add> = (<index> * <y_off>)
	<Pos> = (<Pos> + (<add> * (0.0, 1.0)))
	CreateScreenElement {
		Type = SpriteElement
		parent = <scales_custom_event_handler>
		id = <custom_arrow_up>
		texture = up_arrow
		just = [center center]
		Pos = <Pos>
		Scale = 0.5
		z_priority = 70
	}
	formatText checksumName = custom_arrow_down 'custom_scale_arrow_down_%a' a = <select_player>
	<Pos> = <start_bottom>
	<add> = (<index> * <y_off>)
	<Pos> = (<Pos> + (<add> * (0.0, 1.0)))
	CreateScreenElement {
		Type = SpriteElement
		parent = <scales_custom_event_handler>
		id = <custom_arrow_down>
		texture = down_arrow
		just = [center center]
		Pos = <Pos>
		Scale = 0.5
		z_priority = 70
	}
	custom_scales = ($jam_track_custom_scales_new)
	cur_scale_name = (<custom_scales> [<jam_instrument>])
	cur_scale = ($<cur_scale_name>)
	cur_note = (<cur_scale> [<index>])
	KillSpawnedScript \{Name = jam_scales_audible_note_preview}
	SpawnScriptNow jam_scales_audible_note_preview params = {select_player = <select_player> target_note = <cur_note> note_index = <index>}
endscript

script jam_scales_custom_updown 
	getplayerinfo <select_player> jam_instrument
	<custom_scales> = ($jam_track_custom_scales_new)
	<cur_scale_name> = (<custom_scales> [<jam_instrument>])
	<cur_scale> = ($<cur_scale_name>)
	<cur_note> = (<cur_scale> [<index>])
	if GotParam \{up}
		<cur_note> = (<cur_note> - 1)
		GetArraySize ($jam_roots)
		if (<cur_note> < 0)
			<cur_note> = (<array_Size> -1)
		endif
		formatText checksumName = custom_arrow_up 'custom_scale_arrow_up_%a' a = <select_player>
		legacydoscreenelementmorph id = <custom_arrow_up> Scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <custom_arrow_up> Scale = 1.0 relative_scale time = 0.1
	elseif GotParam \{down}
		<cur_note> = (<cur_note> + 1)
		GetArraySize ($jam_roots)
		if (<cur_note> >= <array_Size>)
			<cur_note> = 0
		endif
		formatText checksumName = custom_arrow_down 'custom_scale_arrow_down_%a' a = <select_player>
		legacydoscreenelementmorph id = <custom_arrow_down> Scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <custom_arrow_down> Scale = 1.0 relative_scale time = 0.1
	endif
	KillSpawnedScript \{Name = jam_scales_audible_note_preview}
	SpawnScriptNow jam_scales_audible_note_preview params = {select_player = <select_player> target_note = <cur_note> note_index = <index>}
	SetArrayElement ArrayName = cur_scale index = <index> NewValue = <cur_note>
	Change GlobalName = <cur_scale_name> NewValue = <cur_scale>
	<new_text> = ($jam_roots [<cur_note>].name_text)
	formatText checksumName = scales_note_text 'jam_scales_note_txt%n_%s' n = <index> s = <select_player>
	<scales_note_text> :SetProps text = <new_text>
endscript

script jam_scales_custom_edit_back 
	LaunchEvent Type = unfocus target = <handler>
	DestroyScreenElement id = <handler>
	GetArraySize ($jam_scales_new)
	jam_update_scalemenu_scales ops_array = jam_scales_new select_player = <select_player> new_option = (<array_Size> -1)
	SetScreenElementProps id = <VMenu> unblock_events
	LaunchEvent Type = focus target = <VMenu>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	generic_menu_pad_back_sound
endscript

script destroy_menu_jam_scales 
	generic_menu_pad_back_sound
	formatText checksumName = vmenu_scales 'jam_vmenu_scales_%s' s = <select_player>
	LaunchEvent Type = unfocus target = <vmenu_scales>
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	getplayerinfo \{1
		jam_instrument}
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	formatText checksumName = scrolling_scales 'jam_scrolling_scales_%s' s = <select_player>
	destroy_menu menu_id = <scrolling_scales>
	formatText checksumName = player_pause_scales 'jam_band_pause_scales_%s' s = <select_player>
	if ScreenElementExists id = <player_pause_scales>
		DestroyScreenElement id = <player_pause_scales>
	endif
	if ScreenElementExists \{id = {
				jam_pause_container
				child = clip_window_pause_scales
			}}
		DestroyScreenElement \{id = {
				jam_pause_container
				child = clip_window_pause_scales
			}}
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x00688155)
			button = start
			z = 100}
		jam_ghmix_note_quick_update Player = ($jam_current_recording_player)
	endif
	formatText checksumName = vmenu_options 'vmenu_options_%s' s = <select_player>
	if ScreenElementExists id = <vmenu_options>
		LaunchEvent Type = focus target = <vmenu_options>
	endif
endscript

jam_ghtunes_normal_num_slots = 5
jam_ghtunes_upgrade1_num_slots = 10
jam_ghtunes_max_num_slots = 15
ghtunes_num_rated_upgrade1 = 20
ghtunes_num_rated_upgrade2 = 50

script check_num_unlocked_slots 
	num_slots = ($jam_ghtunes_normal_num_slots)
	GetGlobalTags \{user_options
		param = ghtunes_num_songs_rated}
	num_rated_for_upgrade = ($ghtunes_num_rated_upgrade1_us)
	getterritory
	if GotParam \{territory}
		if NOT (<territory> = territory_us)
			num_rated_for_upgrade = ($ghtunes_num_rated_upgrade1_europe)
		endif
	endif
	if (<ghtunes_num_songs_rated> >= <num_rated_for_upgrade>)
		num_slots = ($jam_ghtunes_upgrade1_num_slots)
	endif
	if ($jam_user_is_showcased = 1)
		num_slots = ($jam_ghtunes_max_num_slots)
	endif
	return num_slots = <num_slots>
endscript

script ui_create_jam_publish_slot 
	if GotParam \{delete_only}
		make_generic_menu \{title = qs(0xdf01ca8b)
			vmenu_id = jam_publish_slot_vmenu}
	else
		make_generic_menu \{title = qs(0x7a8e72f8)
			vmenu_id = jam_publish_slot_vmenu}
	endif
	if GotParam \{delete_only}
		num_slots = ($jam_ghtunes_max_num_slots)
	else
		GetGlobalTags \{user_options
			param = ghtunes_num_songs_rated}
		printf channel = jam_mode qs(0x9f03a9e0) a = <ghtunes_num_songs_rated> b = ($ghtunes_num_rated_to_upgrade)
		if (<ghtunes_num_songs_rated> >= ($ghtunes_num_rated_upgrade2))
			num_slots = ($jam_ghtunes_max_num_slots)
		elseif (<ghtunes_num_songs_rated> >= ($ghtunes_num_rated_upgrade1))
			num_slots = ($jam_ghtunes_upgrade1_num_slots)
		else
			num_slots = ($jam_ghtunes_normal_num_slots)
		endif
	endif
	generic_menu :se_setprops \{vmenu_spacing_between = -10}
	i = 0
	begin
	has_content = 0
	if ((<slot_array> [<i>].has_content) = 1)
		GetArraySize \{$jam_genre_list}
		genre_count = 0
		genre_text = qs(0x00000000)
		begin
		if (($jam_genre_list [<genre_count>].checksum) = (<slot_array> [<i>].genre))
			genre_text = ($jam_genre_list [<genre_count>].name_text)
			break
		endif
		<genre_count> = (<genre_count> + 1)
		repeat <array_Size>
		formatText TextName = slot_text qs(0x8c5c152d) n = (<slot_array> [<i>].FileName)
		if GotParam \{delete_only}
			add_generic_menu_text_item {
				text = <slot_text>
				pad_start_script = jam_remove_song_from_slot_check
				pad_start_params = {slot = <i> genre_chk = (<slot_array> [<i>].genre)}
				additional_focus_script = ui_jam_slot_draw_helpers
				additional_focus_params = {has_content = 1 delete_only = 1}
			}
		else
			add_generic_menu_text_item {
				not_focusable
				text = <slot_text>
			}
		endif
	else
		formatText \{TextName = slot_text
			qs(0x71d71562)}
		if GotParam \{delete_only}
			add_generic_menu_text_item {
				not_focusable
				text = <slot_text>
			}
		else
			add_generic_menu_text_item {
				text = <slot_text>
				pad_choose_script = <choose_script>
				pad_choose_params = {slot = <i> genre = <genre> FileName = <FileName> newfilename = <newfilename>}
				additional_focus_script = ui_jam_slot_draw_helpers
				additional_focus_params = {has_content = 0}
			}
		endif
	endif
	<item_container_id> :se_setprops textitem_text_dims = (280.0, 35.0)
	if GotParam \{delete_only}
		if (<i> = 4)
			add_generic_menu_text_item \{text = qs(0xb662f6ca)
				heading}
		endif
	endif
	i = (<i> + 1)
	repeat <num_slots>
	if (<num_slots> < ($jam_ghtunes_max_num_slots))
		add_generic_menu_text_item \{text = qs(0xe7f27138)
			heading}
		add_generic_menu_text_item \{text = qs(0xbd79c436)
			heading}
	endif
	bx_refreshmenuitemsindexes \{vmenu_id = jam_publish_slot_vmenu}
	bx_genericmenu_setupscrollbar num_items = <num_items>
	menu_finish
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	StartRendering
endscript

script ui_jam_slot_draw_helpers 
	clean_up_user_control_helpers
	if (<has_content> = 1)
		add_user_control_helper \{text = qs(0x0307b55c)
			button = start
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_jam_publish_slot 
	if ScreenElementExists \{id = ghtunes_legal_dialog_box}
		DestroyScreenElement \{id = ghtunes_legal_dialog_box}
	endif
	StopRendering
	destroy_generic_menu
endscript
0xc7f7e7e2 = 10
0xc324a3ae = 0
0x99e1a045 = 999999999
0x5011865e = 0

script ghtunes_show_submission_agreement \{start_at = 1
		num_results = 0}
	clean_up_user_control_helpers
	printf \{qs(0x8931adb2)}
	printf \{qs(0xa09e3728)}
	printf qs(0x3466483d) a = <start_at> b = <num_results>
	printf \{qs(0x8931adb2)}
	if ScreenElementExists \{id = ghtunes_legal_dialog_box}
		DestroyScreenElement \{id = ghtunes_legal_dialog_box}
	endif
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = ghtunes_legal_dialog_box
		desc = 'ghtunes_legal_dialog'
		Pos = (10.0, -6.0)
		Scale = 1
		z_priority = 1000
		event_handlers = [
			{pad_up ghtunes_submission_scroll params = {up}}
			{pad_down ghtunes_submission_scroll params = {down}}
			{pad_option2 0xc351470c params = {parent_menu = <parent_menu> slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>}}
			{pad_option 0x5882fe9b params = {parent_menu = <parent_menu> slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>}}
			{pad_choose ghtunes_submission_accept params = {slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>}}
			{pad_back ghtunes_submission_decline params = {}}
		]
	}
	ghtunes_legal_dialog_box :SetProps legal_title_text = ($ghtunes_submission_agreement_array [0])
	if ghtunes_legal_dialog_box :desc_resolvealias \{Name = alias_text_menu}
		GetArraySize ($ghtunes_submission_agreement_array)
		Mod a = <array_Size> b = $0xc7f7e7e2
		Change 0x99e1a045 = (<array_Size> - <Mod>)
		<i> = <start_at>
		if (((<start_at>) + ($0xc7f7e7e2)) < (<array_Size> -1))
			<repeat_for> = ($0xc7f7e7e2)
		else
			<repeat_for> = (<array_Size> - <start_at>)
		endif
		printf \{qs(0x8931adb2)}
		printf qs(0x8ad2fa44) a = <i> b = <repeat_for>
		printf \{qs(0x8931adb2)}
		begin
		CreateScreenElement {
			Type = TextBlockElement
			parent = <resolved_id>
			font = fontgrid_text_a3
			just = [left top]
			internal_just = [left top]
			Scale = 1
			internal_scale = 0.6
			rgba = [200 200 200 255]
			dims = (900.0, 30.0)
			text = ($ghtunes_submission_agreement_array [<i>])
			z_priority = 35
			fit_width = wrap
			fit_height = `expand	dims`
			scale_mode = proportional
			text_case = Original
		}
		<i> = (<i> + 1)
		repeat (<repeat_for>)
	endif
	LaunchEvent \{Type = focus
		target = ghtunes_legal_dialog_box}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xeb3848a8)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xe8ad3fa3)
		button = red
		z = 100000}
	if ((($0xc324a3ae / $0xc7f7e7e2) + 1) > 1)
		add_user_control_helper \{text = qs(0xa42bd569)
			button = yellow
			z = 10000}
	endif
	if (($0xc324a3ae + <repeat_for>) != <array_Size>)
		add_user_control_helper \{text = qs(0x2931d48b)
			button = blue
			z = 10000}
		Change \{0x5011865e = 0}
	else
		Change \{0x5011865e = 1}
	endif
endscript

script 0x5882fe9b 
	printstruct <...>
	if (($0x5011865e) = 1)
		return
	endif
	if ($0xc324a3ae = 0)
		Change 0xc324a3ae = ($0xc7f7e7e2 + 1)
	else
		Change 0xc324a3ae = ($0xc324a3ae + $0xc7f7e7e2)
	endif
	SoundEvent \{event = ghtunes_ui_select}
	ghtunes_show_submission_agreement parent_menu = <parent_menu> start_at = $0xc324a3ae num_results = $0xc7f7e7e2 slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
endscript

script 0xc351470c 
	if NOT ((($0xc324a3ae / $0xc7f7e7e2) + 1) > 1)
		return
	endif
	Change 0xc324a3ae = ($0xc324a3ae - $0xc7f7e7e2)
	if ($0xc324a3ae < 1)
		Change \{0xc324a3ae = 1}
		return
	endif
	SoundEvent \{event = ghtunes_ui_back}
	ghtunes_show_submission_agreement parent_menu = <parent_menu> start_at = $0xc324a3ae num_results = $0xc7f7e7e2 slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
endscript

script ghtunes_destroy_submission_agreement 
	if ScreenElementExists \{id = ghtunes_legal_dialog_box}
		DestroyScreenElement \{id = ghtunes_legal_dialog_box}
	endif
endscript

script ghtunes_submission_scroll 
	ui_menu_scroll_sfx
	<scroll_speed> = (0.0, 20.0)
	if ghtunes_legal_dialog_box :desc_resolvealias \{Name = alias_text_menu}
		GetScreenElementProps id = <resolved_id>
		<up_limit> = 0
		<down_limit> = (((<dims> [1]) * -1) + 400)
		if GotParam \{up}
			if ((<Pos> [1]) < <up_limit>)
				<new_pos> = (<Pos> + <scroll_speed>)
			else
				<new_pos> = (1.0, 0.0)
			endif
		elseif GotParam \{down}
			if ((<Pos> [1]) > <down_limit>)
				<new_pos> = (<Pos> - <scroll_speed>)
			else
				<new_pos> = ((1.0, 0.0) + (<down_limit> * (0.0, 1.0)))
			endif
		endif
		<ratio> = (360.0 / (<down_limit> * -1))
		<scroll_pos_y> = (((<new_pos> [1] * -1) * <ratio>) + 42)
		<scroll_pos> = ((1.0, 0.0) + ((<scroll_pos_y>) * (0.0, 1.0)))
		ghtunes_legal_dialog_box :SetProps scrollbar_pos = <scroll_pos>
		<resolved_id> :SetProps Pos = <new_pos>
	endif
endscript

script ghtunes_submission_accept 
	Change \{0xc324a3ae = 1}
	Change \{0x5011865e = 0}
	ui_menu_select_sfx
	clean_up_user_control_helpers
	ghtunes_destroy_submission_agreement
	jam_upload_song_to_slot_check slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
endscript

script ghtunes_submission_decline 
	Change \{0xc324a3ae = 1}
	Change \{0x5011865e = 0}
	generic_menu_pad_back_sound
	clean_up_user_control_helpers
	ghtunes_destroy_submission_agreement
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

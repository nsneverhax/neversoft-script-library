jam_ghtunes_normal_num_slots = 5
jam_ghtunes_upgrade1_num_slots = 10
jam_ghtunes_max_num_slots = 15
ghtunes_num_rated_upgrade1 = 20
ghtunes_num_rated_upgrade2 = 50

script ui_create_jam_publish_slot 
	if GotParam \{delete_only}
		make_generic_menu \{title = qs(0xfde202a4)
			vmenu_id = jam_publish_slot_vmenu}
	else
		make_generic_menu \{title = qs(0xfff6fa12)
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
		formatText TextName = slot_text qs(0xc47d6d84) s = (<i> + 1) n = (<slot_array> [<i>].FileName)
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
		formatText TextName = slot_text qs(0xeac75b19) s = (<i> + 1)
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

script ghtunes_show_submission_agreement 
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
			{pad_choose ghtunes_submission_accept params = {slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>}}
			{pad_back ghtunes_submission_decline params = {}}
		]
	}
	ghtunes_legal_dialog_box :SetProps legal_title_text = ($ghtunes_submission_agreement_array [0])
	if ghtunes_legal_dialog_box :desc_resolvealias \{Name = alias_text_menu}
		GetArraySize ($ghtunes_submission_agreement_array)
		<i> = 1
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
			dims = (985.0, 30.0)
			text = ($ghtunes_submission_agreement_array [<i>])
			z_priority = 35
			fit_width = wrap
			fit_height = `expand	dims`
			scale_mode = proportional
			text_case = Original
		}
		<i> = (<i> + 1)
		repeat (<array_Size> -1)
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
	ui_menu_select_sfx
	clean_up_user_control_helpers
	ghtunes_destroy_submission_agreement
	jam_upload_song_to_slot_check slot = <slot> FileName = <FileName> newfilename = <newfilename> genre = <genre>
endscript

script ghtunes_submission_decline 
	generic_menu_pad_back_sound
	clean_up_user_control_helpers
	ghtunes_destroy_submission_agreement
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

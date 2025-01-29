g_music_store_purchase_struct = {
}
g_music_store_purchase_flow_stack = {
}

script ui_create_music_store_purchase 
	music_store_select_sfx
	if GotParam \{go_to_confirm}
		ui_event_remove_params \{param = go_to_confirm}
		SpawnScriptNow \{music_store_purchase_accepted}
	else
		Change g_music_store_purchase_struct = <purchase_struct>
		SongList :Obj_SpawnScriptNow create_music_store_purchase_spawned params = {<...>}
	endif
endscript

script create_music_store_purchase_spawned 
	if (<purchase_struct>.purchased = 1)
		if NOT StructureContains \{structure = purchase_struct
				album_pack_only}
			music_store_purchase_create_dialog <...>
			return
		endif
	endif
	if (<purchase_struct>.Type = song)
		if StructureContains \{structure = purchase_struct
				pack_list}
			<pack_list> = (<purchase_struct>.pack_list)
			GetArraySize <pack_list>
			if (<array_Size> > 0)
				songlist_component :membfunc_songlist_uistack_getlistname
				filterspec = [
					{
						key = song_checksum
						union_list = <pack_list>
						comparator = equal
					}
				]
				contentmanfunc {
					func = request_page
					current_page
					Name = <list_name>
					filterspec = <filterspec>
					callback = music_store_purchase_pack_type_callback
				}
			endif
		else
			music_store_purchase_create_dialog
		endif
	else
		if StructureContains \{structure = purchase_struct
				pack_contents}
			<pack_contents> = (<purchase_struct>.pack_contents)
			GetArraySize <pack_contents>
			if (<array_Size> > 0)
				music_store_purchase_create_dialog \{songlist_purchase_struct}
			else
				music_store_purchase_create_dialog
			endif
		else
			music_store_purchase_create_dialog
		endif
	endif
endscript

script music_store_purchase_pack_type_callback 
	if (<content_size> > 0)
		songlist_component :membfunc_songlist_uistack_getlistname
		contentmanfunc {
			func = request_data
			Name = <list_name>
			start_index = 0
			end_index = (<content_size> - 1)
			callback = music_store_purchase_pack_type_callback_part_ii
		}
	else
		music_store_purchase_create_dialog
	endif
endscript

script music_store_purchase_pack_type_callback_part_ii 
	<pack_index> = -1
	<album_index> = -1
	GetArraySize <Range>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if ((<Range> [<i>]).Type = pack)
			if (<pack_index> = -1)
				<pack_index> = <i>
			endif
		elseif ((<Range> [<i>]).Type = album)
			if (<album_index> = -1)
				<album_index> = <i>
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if (<pack_index> >= 0)
		<pack_purchase_struct> = (<Range> [<pack_index>])
	endif
	if (<album_index> >= 0)
		<album_purchase_struct> = (<Range> [<album_index>])
	endif
	music_store_purchase_create_dialog {
		pack_purchase_struct = <pack_purchase_struct>
		album_purchase_struct = <album_purchase_struct>
	}
endscript

script music_store_purchase_create_dialog 
	<purchase_struct> = ($g_music_store_purchase_struct)
	Change g_music_store_current_pack_checksum = (<purchase_struct>.song_checksum)
	if (<purchase_struct>.purchased = 0)
		<options> = []
		<func> = music_store_purchase_accepted
		if (<purchase_struct>.Type = pack)
			<purchase_text> = qs(0x0326db58)
		elseif (<purchase_struct>.Type = album)
			<purchase_text> = qs(0xae58936d)
		elseif (<purchase_struct>.Type = song)
			<purchase_text> = qs(0x520c0ec0)
		elseif (<purchase_struct>.Type = import)
			<purchase_text> = qs(0x95e3bf48)
		elseif (<purchase_struct>.Type = patch)
			if (<purchase_struct>.price = 0)
				<purchase_text> = qs(0xab8d6a22)
			else
				<purchase_text> = qs(0xc1be0b27)
			endif
		endif
		if NOT StructureContains \{structure = purchase_struct
				album_pack_only}
			<element> = {
				func = music_store_preliminary_checks
				func_params = {purchase_struct = <purchase_struct>}
				text = <purchase_text>
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		if GotParam \{pack_purchase_struct}
			<element> = {
				func = music_store_purchase_new_view_go_back
				func_params = {purchase_struct = <pack_purchase_struct> Type = pack previous = hub}
				text = qs(0x24d72d3e)
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		if GotParam \{album_purchase_struct}
			<element> = {
				func = music_store_purchase_new_view_go_back
				func_params = {purchase_struct = <album_purchase_struct> Type = album previous = hub}
				text = qs(0x19b7d5d3)
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		if NOT (<purchase_struct>.Type = patch)
			if GotParam \{songlist_purchase_struct}
				<element> = {
					func = music_store_purchase_new_view_go_back
					func_params = {purchase_struct = <purchase_struct> Type = SongList previous = (<purchase_struct>.Type)}
					text = qs(0xa62cd1de)
				}
				AddArrayElement array = <options> element = <element>
				<options> = <array>
			endif
		endif
		<element> = {
			func = music_store_purchase_destroy_dialog_and_return
			text = qs(0xf7723015)
		}
		AddArrayElement array = <options> element = <element>
		<options> = <array>
		<artist> = (<purchase_struct>.song_artist)
		if StructureContains \{structure = purchase_struct
				song_original_artist}
			if ((<purchase_struct>.song_original_artist) = 0)
				formatText TextName = artist qs(0x485d0ab7) s = <artist>
			else
				formatText TextName = artist qs(0x6e44cc91) s = <artist>
			endif
		else
			formatText TextName = artist qs(0x6e44cc91) s = <artist>
		endif
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers)
			<artist> = qs(0x00000000)
		endif
		if GotParam \{album_purchase_struct}
			if GotParam \{pack_purchase_struct}
				formatText TextName = text qs(0x7746b6e7) i = (<purchase_struct>.song_title) a = <artist>
			else
				formatText TextName = text qs(0xf71bdd68) i = (<purchase_struct>.song_title) a = <artist>
			endif
		elseif GotParam \{pack_purchase_struct}
			formatText TextName = text qs(0x03532fd5) i = (<purchase_struct>.song_title) a = <artist>
		else
			<warning_text> = qs(0x03ac90f0)
			if StructureContains structure = <purchase_struct> pack_list
				<pack_list> = (<purchase_struct>.pack_list)
				GetArraySize <pack_list>
				if (<array_Size> > 0)
					<i> = 0
					begin
					if dlcmanagerfunc func = get_content_flags content_name = (<pack_list> [<i>])
						if (<content_flags>.owned = 1)
							<warning_text> = qs(0x337e58eb)
						endif
					endif
					<i> = (<i> + 1)
					repeat <array_Size>
				endif
			endif
			formatText TextName = text qs(0x31de6a2f) i = (<purchase_struct>.song_title) a = <artist> w = <warning_text>
		endif
		title = qs(0xb7b2ba93)
		<options> = <options>
	else
		<artist> = (<purchase_struct>.song_artist)
		if StructureContains \{structure = purchase_struct
				song_original_artist}
			if ((<purchase_struct>.song_original_artist) = 0)
				formatText TextName = artist qs(0x485d0ab7) s = <artist>
			else
				formatText TextName = artist qs(0x6e44cc91) s = <artist>
			endif
		endif
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers)
			<artist> = qs(0x00000000)
		endif
		formatText TextName = text qs(0x3b2e76d7) i = (<purchase_struct>.song_title) a = <artist>
		title = qs(0x01371302)
	endif
	if StructureContains \{structure = purchase_struct
			album_pack_only}
		<artist> = (<purchase_struct>.song_artist)
		if StructureContains \{structure = purchase_struct
				song_original_artist}
			if ((<purchase_struct>.song_original_artist) = 0)
				formatText TextName = artist qs(0x485d0ab7) s = <artist>
			else
				formatText TextName = artist qs(0x6e44cc91) s = <artist>
			endif
		endif
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers)
			<artist> = qs(0x00000000)
		endif
		if GotParam \{pack_purchase_struct}
			formatText TextName = text qs(0x5133f513) i = (<purchase_struct>.song_title) a = <artist>
		elseif GotParam \{album_purchase_struct}
			formatText TextName = text qs(0x66853af2) i = (<purchase_struct>.song_title) a = <artist>
		endif
	endif
	songlist_component :GetSingleTag \{exclusive_device}
	create_dialog_box {
		heading_text = <title>
		body_text = <text>
		player_device = <exclusive_device>
		back_button_script = music_store_purchase_destroy_dialog_and_return
		options = <options>
		no_helper_pills
	}
	if isps3
		if (<purchase_struct>.purchased = 0)
			<menu_id> :se_getprops z_priority
			GetDisplaySettings
			if (<height> >= 720)
				<logo> = playstation_logo_hd720
				<Pos> = (240.0, 180.0)
				<Scale> = 1.0
			else
				<logo> = playstation_logo_sd
				<Pos> = (240.0, 180.0)
				<Scale> = 1.5
			endif
			CreateScreenElement {
				Type = SpriteElement
				parent = root_window
				id = ps_logo
				texture = <logo>
				just = [left top]
				Pos = <Pos>
				Scale = <Scale>
				z_priority = 1000
			}
		endif
	endif
	if (<purchase_struct>.purchased = 1)
		<options> = []
		<purchase_text> = qs(0x01371302)
		<element> = {
			func = music_store_preliminary_checks
			func_params = {purchase_struct = <purchase_struct>}
			text = <purchase_text>
		}
		AddArrayElement array = <options> element = <element>
		<options> = <array>
		<element> = {
			func = music_store_purchase_destroy_dialog_and_return
			text = qs(0xf7723015)
		}
		AddArrayElement array = <options> element = <element>
		<options> = <array>
		<artist> = (<purchase_struct>.song_artist)
		if StructureContains \{structure = purchase_struct
				song_original_artist}
			if ((<purchase_struct>.song_original_artist) = 0)
				formatText TextName = artist qs(0x485d0ab7) s = <artist>
			else
				formatText TextName = artist qs(0x6e44cc91) s = <artist>
			endif
		else
			formatText TextName = artist qs(0x6e44cc91) s = <artist>
		endif
		songlist_component :GetSingleTag \{music_store_mode}
		if (<music_store_mode> = special_offers)
			<artist> = qs(0x00000000)
		endif
		<heading_text> = qs(0x01371302)
		formatText TextName = text qs(0x3b2e76d7) i = (<purchase_struct>.song_title) a = <artist>
		songlist_component :GetSingleTag \{exclusive_device}
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0x01371302)
			body_text = <text>
			player_device = <exclusive_device>
			back_button_script = music_store_purchase_destroy_dialog_and_return
			options = <options>
			no_helper_pills
		}
	endif
endscript

script music_store_purchase_new_view_go_back 
	RequireParams \{[
			purchase_struct
		]
		all}
	ui_sfx \{menustate = musicstore
		uitype = back}
	destroy_dialog_box
	if GotParam \{previous}
		Change g_music_store_previous_menu = <previous>
	else
		previous = hub
	endif
	songlist_change_sort_index index = ($g_songlist_sort_indexes.music_store)
	generic_event_back Wait state = uistate_songlist data = {
		bypass_return_script = songlist_music_store_view_pack_songs
		bypass_return_params = {
			new_pivot_checksum = (<purchase_struct>.song_checksum)
			ui_struct = <purchase_struct>
			Type = <Type>
			previous = <previous>
		}
	}
endscript

script music_store_purchase_destroy_dialog_and_return \{clear_cart = 0}
	if (<clear_cart> = 1)
		marketplacefunc \{func = clear_cart}
	endif
	ui_sfx \{menustate = musicstore
		uitype = back}
	destroy_dialog_box
	songlist_component :GetSingleTag \{songlist_needs_refresh}
	if GotParam \{songlist_needs_refresh}
		if (<songlist_needs_refresh> = 1)
			songlist_component :membfunc_songlist_uistack_getlistname
			contentmanfunc func = refresh Name = <list_name> no_enum
		endif
	endif
	songlist_component :SetTags \{songlist_needs_refresh = 0}
	Change \{g_songlist_refresh_menus = 1}
	Change \{generic_menu_block_input = 0}
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
	generic_event_back \{Wait
		data = {
		}}
endscript

script music_store_preliminary_checks 
	RequireParams \{[
			purchase_struct
		]
		all}
	marketplacefunc \{func = get_cart_confirmation_info}
	if ((<purchase_struct>.purchased) = 0)
		if (((<confirmation_info>.top_wii_points) - (<purchase_struct>.price)) < 0)
			music_store_handle_error \{error_crc = ec_error_insufficient_funds
				error_code = -1
				support_code = 205810}
		else
			music_store_choose_download_location purchase_struct = <purchase_struct>
		endif
	endif
	if ((<purchase_struct>.Type) = song)
		music_store_choose_download_location purchase_struct = <purchase_struct>
	else
		GetArraySize (<purchase_struct>.pack_list)
		<all_downloaded> = 1
		<index> = 0
		if (<purchase_struct>.Type = patch)
			begin
			<song_checksum> = ((<purchase_struct>.pack_list) [<index>])
			<song_struct> = ($download_songlist_props.<song_checksum>)
			<song_name> = (<song_struct>.Name)
			dlcmanagerfunc func = get_content_state prefix = <song_name>
			if (<content_state> = present || <content_state> = archived)
				if get_marketplace_song_struct song_name = (<song_checksum>)
					if (<song_entry>.patched = 0)
						<all_downloaded> = 0
					endif
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		elseif ((<purchase_struct>.purchased) = 1)
			begin
			if NOT is_song_downloaded song_checksum = ((<purchase_struct>.pack_list) [<index>])
				<all_downloaded> = 0
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		else
			<all_downloaded> = 0
		endif
		if (<all_downloaded> = 0)
			music_store_choose_download_location purchase_struct = <purchase_struct>
		else
			music_store_create_owned_dialog purchase_struct = <purchase_struct>
		endif
	endif
endscript

script music_store_create_owned_dialog 
	RequireParams \{[
			purchase_struct
		]
		all}
	songlist_destroy_dialog_box
	options = []
	<element> = {
		func = music_store_purchase_destroy_dialog_and_return
		text = qs(0x0e41fe46)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	if ((<purchase_struct>.Type) = patch)
		<body_text> = qs(0xa27a5dc6)
	elseif ((<purchase_struct>.Type) = album)
		<body_text> = qs(0xd8827321)
	elseif ((<purchase_struct>.Type) = import)
		<body_text> = qs(0x2df72051)
	else
		<body_text> = qs(0x3bdbb15b)
	endif
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = <heading_text>
		body_text = <body_text>
		player_device = <exclusive_device>
		options = <options>
		no_helper_pills
	}
endscript

script music_store_choose_download_location 
	RequireParams \{[
			purchase_struct
		]
		all}
	destroy_dialog_box
	<options> = []
	<heading_text> = qs(0x21656a1d)
	if NOT ((<purchase_struct>.Type) = import)
		<title_text> = (<purchase_struct>.song_title)
	else
		if faststructurecontains structure = <purchase_struct> Name = title
			<title_text> = (<purchase_struct>.title)
		else
			<title_text> = (<purchase_struct>.song_title)
		endif
	endif
	<artist_text> = qs(0x00000000)
	if NOT (((<purchase_struct>.Type) = import) || ((<purchase_struct>.Type) = patch))
		formatText TextName = artist_text qs(0x16b0bc42) a = (<purchase_struct>.song_artist)
		if (faststructurecontains structure = <purchase_struct> Name = song_original_artist)
			if ((<purchase_struct>.song_original_artist) = 0)
				formatText TextName = artist_text qs(0xcaa4148b) a = (<purchase_struct>.song_artist)
			endif
		endif
	endif
	if NOT marketplacefunc \{func = get_ecard_info}
		if ((<purchase_struct>.purchased) = 0)
			formatText TextName = body_text qs(0xc3be1961) s = <title_text> a = <artist_text>
		else
			formatText TextName = body_text qs(0x084729ff) s = <title_text> a = <artist_text>
		endif
	else
		formatText TextName = body_text qs(0xbe5797f0) s = <title_text> a = <artist_text>
	endif
	printstruct <purchase_struct>
	if (((<purchase_struct>.Type) = song) || ((<purchase_struct>.Type) = patch))
		<func_params> = {purchase_struct = <purchase_struct> Type = song}
	elseif (<purchase_struct>.Type = album)
		<func_params> = {purchase_struct = <purchase_struct> Type = SongList previous = albums}
	elseif (<purchase_struct>.Type = pack)
		<func_params> = {purchase_struct = <purchase_struct> Type = SongList previous = packs}
	elseif (<purchase_struct>.Type = import)
		<func_params> = {purchase_struct = <purchase_struct> Type = SongList previous = special_offers}
	endif
	<cancel_params> = {}
	if marketplacefunc \{func = get_ecard_info}
		<func_params> = {<func_params> previous = special_offers}
		<cancel_params> = {clear_cart = 1}
	endif
	<element> = {
		func = music_store_purchase_go_to_song_selection
		func_params = {<func_params> mode = nand}
		text = qs(0x57d491ac)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	<element> = {
		func = music_store_check_sd_card_inserted
		func_params = {<func_params> mode = sdcard}
		text = qs(0x93160aae)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	<element> = {
		func = music_store_purchase_destroy_dialog_and_return
		func_params = <cancel_params>
		text = qs(0xf7723015)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = <heading_text>
		body_text = <body_text>
		player_device = <exclusive_device>
		back_button_script = music_store_purchase_destroy_dialog_and_return
		back_button_params = <cancel_params>
		options = <options>
		no_helper_pills
	}
endscript

script music_store_mark_item_to_download 
	RequireParams \{[
			ui_struct
		]
		all}
	if dlcmanagerfunc func = get_content_flags content_name = (<ui_struct>.song_checksum)
		if ((<content_flags>.present = 0) && (<content_flags>.archived = 0))
			<new_value> = (1 - (<content_flags>.in_cart))
			dlcmanagerfunc func = set_content_flags content_name = (<ui_struct>.song_checksum) in_cart = <new_value>
			printf 'New value for %s in cart: %d' s = (<ui_struct>.song_checksum) d = <new_value>
			se_setprops music_store_download_arrow_alpha = (1.0 * <new_value>)
			music_store_update_running_block_total
		endif
	endif
endscript

script music_store_purchase_go_to_song_selection \{purchase_struct = 0x69696969
		mode = !q1768515945
		previous = songs}
	printstruct <...>
	if (<mode> = sdcard)
		Change \{g_songlist_sd_card_required = 1}
	endif
	marketplacefunc func = set_cart_mode mode = <mode>
	if (<purchase_struct>.code = album_pack_only)
		<purchase_struct> = ({<purchase_struct> code = (<purchase_struct>.song_checksum)})
	endif
	marketplacefunc func = add_to_cart purchase_struct = <purchase_struct>
	if NOT music_store_purchase_content \{dry_run = 1}
		return
	endif
	if (<Type> = song)
		if (<previous> != special_offers)
			Change g_music_store_previous_menu = <previous>
		endif
		music_store_purchase_accepted purchase_struct = <purchase_struct>
		return
	endif
	songlist_component :SetTags \{music_store_mode = download_list}
	music_store_update_running_block_total
	music_store_purchase_new_view_go_back purchase_struct = <purchase_struct> Type = <Type> previous = <previous>
endscript

script music_store_update_running_block_total 
	marketplacefunc \{func = get_cart_confirmation_info}
	formatText TextName = top qs(0x628fce13) s = (<confirmation_info>.top_blocks)
	formatText TextName = middle qs(0x628fce13) s = (<confirmation_info>.middle_blocks)
	formatText TextName = bottom qs(0x628fce13) s = (<confirmation_info>.bottom_blocks)
	songlist_detail :se_setprops {
		top_blocks_value_text = <top>
		middle_blocks_value_text = <middle>
		bottom_blocks_value_text = <bottom>
	}
	if (<confirmation_info>.have_enough_blocks = FALSE)
		songlist_detail :se_setprops \{valid_blocks_alpha = 0.0
			invalid_blocks_alpha = 1.0}
	else
		songlist_detail :se_setprops \{valid_blocks_alpha = 1.0
			invalid_blocks_alpha = 0.0}
	endif
endscript

script music_store_check_sd_card_inserted 
	songlist_destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
	if NOT sdcardmanagerfunc \{func = get_card_error}
		if NOT sdcardmanagerfunc \{func = is_card_write_protected}
			music_store_purchase_go_to_song_selection <...>
		else
			music_store_check_sd_card_inserted_write_proteced_create_dialog <...>
		endif
	else
		music_store_check_sd_card_inserted_create_dialog <...>
	endif
endscript

script music_store_check_sd_card_inserted_create_dialog 
	songlist_destroy_dialog_box
	<options> = []
	<element> = {
		func = music_store_purchase_destroy_dialog_and_return
		text = qs(0xf7723015)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	<element> = {
		func = music_store_check_sd_card_inserted
		func_params = <...>
		text = qs(0x5d8b66a0)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	wii_dlc_get_error_text error_crc = <error_crc>
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = qs(0x79597197)
		body_text = <error_text>
		player_device = <exclusive_device>
		back_button_script = music_store_purchase_destroy_dialog_and_return
		options = <options>
		no_helper_pills
	}
endscript

script music_store_check_sd_card_inserted_write_proteced_create_dialog 
	songlist_destroy_dialog_box
	<options> = []
	<element> = {
		func = music_store_purchase_destroy_dialog_and_return
		text = qs(0x0e41fe46)
	}
	AddArrayElement array = <options> element = <element>
	<options> = <array>
	wii_dlc_get_error_text error_crc = <error_crc>
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_dialog_box {
		dlg_z_priority = 1001
		heading_text = qs(0x79597197)
		body_text = <error_text>
		player_device = <exclusive_device>
		back_button_script = music_store_purchase_destroy_dialog_and_return
		options = <options>
		no_helper_pills
	}
endscript

script music_store_purchase_accepted 
	printscriptinfo \{'music_store_purchase_accepted'}
	destroy_dialog_box
	if NOT marketplacefunc func = can_checkout_cart pin = <pin>
		if (<error_crc> = ec_error_points_restricted)
			create_dialog_box \{template = dlc_pin
				callback = tmp_dlc_pin_script
				back_button_script = music_store_purchase_destroy_dialog_and_return}
			return
		endif
		music_store_handle_error <...>
		songlist_component :GetSingleTag \{music_store_mode}
		if NOT (<music_store_mode> = download_list)
			marketplacefunc \{func = clear_cart}
		endif
		return
	endif
	marketplacefunc \{func = get_cart_confirmation_info}
	songlist_destroy_dialog_box
	current_menu :se_setprops \{block_events}
	create_dialog_box {
		template = dlc_confirm
		dlg_z_priority = 1001
		initial_focus_index = 0
		options = [
			{
				text = qs(0xf7723015)
				func = music_store_clear_cart
			}
			{
				text = qs(0x326e2d2f)
				func = music_store_purchase_accepted_continued
			}
		]
		<confirmation_info>
	}
endscript

script music_store_clear_cart 
	songlist_component :GetSingleTag \{music_store_mode}
	if NOT (<music_store_mode> = download_list)
		marketplacefunc \{func = clear_cart}
	endif
	music_store_purchase_destroy_dialog_and_return
endscript

script music_store_purchase_accepted_continued 
	printf \{'In music_store_purchase_accepted_continued------------------------------------------------'}
	hide_glitch \{num_frames = 3}
	songlist_destroy_dialog_box
	music_store_purchase_content
endscript

script music_store_show_checkout_progress_dialog 
	SpawnScriptNow \{music_store_show_checkout_progress_dialog_spawned}
endscript

script music_store_show_checkout_progress_dialog_spawned 
	Wait \{3
		gameframes}
	create_dialog_box \{heading_text = qs(0x131b4d0f)
		body_text = qs(0x38a7644e)
		dlg_z_priority = 1001}
	LaunchEvent \{Type = focus
		target = dialog_box_desc_id}
	dialog_box_desc_id :se_setprops \{event_handlers = [
			{
				pad_back
				music_store_checkout_try_cancel
			}
		]
		replace_handlers}
	spawn_autosave_ui_icon
	dialog_box_container :obj_spawnscript \{music_store_animate_progress_bar}
endscript

script music_store_checkout_try_cancel 
	if marketplacefunc \{func = cancel_cart}
		sdcardmanagerfunc \{func = force_hold_ejects
			OFF}
		ui_sfx \{menustate = Generic
			uitype = select}
	endif
endscript

script music_store_get_checkout_stage_text 
	switch (<Stage>)
		case Idle
		return \{stage_text = qs(0x03ac90f0)}
		case dry_run
		return \{stage_text = qs(0x84249f97)}
		case purchasing
		return \{stage_text = qs(0xb4471488)}
		case updating
		case required_contents
		case catalog
		case downloading
		return \{stage_text = qs(0xd649ff64)}
		case canceling
		return \{stage_text = qs(0x0b800ffc)}
		case sd_backup_catalog
		case sd_backup_normal
		formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0007) s = qs(0xb0a778a5)
		formatText TextName = stage_text qs(0x73307931) s = <error_text>
		return stage_text = <stage_text>
	endswitch
	return \{stage_text = qs(0x03ac90f0)}
endscript

script music_store_animate_progress_bar 
	if NOT ScreenElementExists \{id = music_store_progress_bar}
		Obj_GetID
		CreateScreenElement {
			Type = descinterface
			desc = 'music_store_progress_bar'
			id = music_store_progress_bar
			parent = <objID>
			z_priority = 10001
		}
	endif
	OnExitRun \{hide_glitch
		params = {
			num_frames = 3
		}}
	count_songs_to_download
	totaldownloadcount = <downloadcount>
	<last_stage> = None
	begin
	if marketplacefunc \{func = is_inited}
		marketplacefunc \{func = get_cart_progress}
		if NOT ((<Stage> = downloading) || (<Stage> = sd_backup_normal) || (<Stage> = sd_backup_catalog) || (<Stage> = updating))
			<progress> = 0
			if user_control_helper_exists \{button = red}
				user_control_destroy_helper \{button = red}
			endif
		else
			if NOT (<Stage> = updating)
				if NOT user_control_helper_exists \{button = red}
					add_user_control_helper \{text = qs(0xf7723015)
						button = red
						z = 100000}
				endif
			endif
		endif
		<delta> = (400.0 * <progress>)
		OFF = (0.0, 0.0)
		setpaircomponents {
			OFF
			X = <delta>
			y = 0
		}
		<pow_alpha> = 0.0
		if (<progress> > 0.99499995)
			<pow_alpha> = 1.0
		endif
		music_store_progress_bar :se_setprops {
			rightbar_pos = ((375.0, 0.0) - <OFF>)
			leftbar_pos = ((-375.0, 0.0) + <OFF>)
			powholder_alpha = <pow_alpha>
		}
		if (<Stage> != Idle)
			music_store_get_checkout_stage_text Stage = <Stage>
			count_songs_to_download
			if (<Stage> = downloading && <downloadcount> > 0)
				formatText TextName = body_text qs(0x5b0625cc) t = <song_title> X = ((<totaldownloadcount> - <downloadcount>) + 1) y = <totaldownloadcount>
			else
				formatText TextName = body_text qs(0x73307931) s = <stage_text>
			endif
			dialog_box_desc_id :se_setprops dlog_body_text = <body_text>
			<last_stage> = <Stage>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script count_songs_to_download 
	marketplacefunc \{func = get_cart_contents}
	GetArraySize <downloads>
	downloadcount = 0
	if (<array_Size> > 0)
		i = 0
		begin
		if dlcmanagerfunc func = get_content_flags content_name = (<downloads> [<i>])
			if ((<content_flags>.present = 0) && (<content_flags>.archived = 0) && (<content_flags>.in_cart = 1))
				if dlcmanagerfunc func = get_content_index content_name = (<downloads> [<i>])
					if (<content_index> > 1)
						if NOT faststructurecontains structure = $download_patch_props Name = (<downloads> [<i>])
							if (<downloadcount> = 0)
								get_song_title song = (<downloads> [<i>])
							endif
							downloadcount = (<downloadcount> + 1)
						endif
					endif
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return downloadcount = <downloadcount> song_title = <song_title>
endscript

script broadcast_dlc_purchased_friend_feed_msg \{purchase_struct = 0x69696969}
	if ((<purchase_struct>.purchased) = 0)
		song_artist = ''
		if (<purchase_struct>.Type = song || <purchase_struct>.Type = album)
			if (faststructurecontains structure = <purchase_struct> Name = artist)
				formatText TextName = song_artist 'by %a' a = (<purchase_struct>.artist)
			endif
		endif
		broadcastevent Type = dlc_purchased data = {
			Player = 1
			controller_index = ($primary_controller)
			song_checksum = (<purchase_struct>.song_checksum)
			song_artist = <song_artist>
			song_type = (<purchase_struct>.Type)
		}
	endif
endscript

script music_store_start_saving_net_error 
	Change \{g_songlist_net_error_handling = save_error}
endscript

script music_store_have_saved_error 
	if ($g_songlist_net_saved_error = None)
		return \{FALSE}
	endif
	return \{true}
endscript

script music_store_stop_saving_net_error 
	Change \{g_songlist_net_error_handling = throw_error}
	if ($g_songlist_net_saved_error = connection_lost)
		Change \{g_songlist_net_saved_error = None}
		callback_marketplace_connection_lost
		return \{true}
	endif
	if ($g_songlist_net_saved_error = not_signed_in)
		Change \{g_songlist_net_saved_error = None}
		callback_marketplace_not_signed_in
		return \{true}
	endif
	Change \{g_songlist_net_saved_error = None}
	return \{FALSE}
endscript

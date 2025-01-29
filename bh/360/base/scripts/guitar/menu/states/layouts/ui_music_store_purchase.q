g_music_store_purchase_struct = {
}
music_store_attempted_purchase = 0

script ui_create_music_store_purchase 
	music_store_select_sfx
	Change g_music_store_purchase_struct = <purchase_struct>
	songlist :Obj_SpawnScriptNow create_music_store_purchase_spawned params = {<...>}
endscript

script create_music_store_purchase_spawned 
	if (<purchase_struct>.purchased = 1)
		if NOT StructureContains \{structure = purchase_struct
				album_pack_only}
			music_store_purchase_create_dialog <...>
			return
		endif
	endif
	if (<purchase_struct>.type = song)
		if StructureContains \{structure = purchase_struct
				pack_list}
			<pack_list> = (<purchase_struct>.pack_list)
			GetArraySize <pack_list>
			if (<array_size> > 0)
				songlist :GetSingleTag \{list_name}
				filterspec = [
					{
						key = song_checksum
						union_list = <pack_list>
						comparator = equal
					}
				]
				ContentManFunc {
					func = request_page
					current_page
					name = <list_name>
					seek = 0
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
			if (<array_size> > 0)
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
	Change \{g_songlist_ignore_pivot_hack = 1}
	if (<content_size> > 0)
		songlist :GetSingleTag \{list_name}
		ContentManFunc {
			func = request_data
			name = <list_name>
			start_index = 0
			end_index = (<content_size> - 1)
			callback = music_store_purchase_pack_type_callback_part_II
		}
	else
		music_store_purchase_create_dialog
	endif
endscript

script music_store_purchase_pack_type_callback_part_II 
	<pack_index> = -1
	<album_index> = -1
	GetArraySize <Range>
	if (<array_size> > 0)
		<i> = 0
		begin
		if ((<Range> [<i>]).type = pack)
			if (<pack_index> = -1)
				<pack_index> = <i>
			endif
		elseif ((<Range> [<i>]).type = album)
			if (<album_index> = -1)
				<album_index> = <i>
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
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
	if (<purchase_struct>.purchased = 0)
		<options> = []
		if GotParam \{pack_purchase_struct}
			<element> = {
				func = music_store_purchase_new_view_go_back
				func_params = {purchase_struct = <pack_purchase_struct>}
				text = qs(0x24d72d3e)
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		if GotParam \{album_purchase_struct}
			<element> = {
				func = music_store_purchase_new_view_go_back
				func_params = {purchase_struct = <album_purchase_struct>}
				text = qs(0x19b7d5d3)
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		if GotParam \{songlist_purchase_struct}
			<element> = {
				func = music_store_purchase_new_view_go_back
				func_params = {purchase_struct = <purchase_struct>}
				text = qs(0xa62cd1de)
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		<element> = {
			func = music_store_purchase_destroy_dialog_and_return
			text = qs(0xf7723015)
		}
		AddArrayElement array = <options> element = <element>
		<options> = <array>
		if NOT StructureContains \{structure = purchase_struct
				album_pack_only}
			<element> = {
				func = music_store_purchase_accepted
				func_params = {purchase_struct = <purchase_struct>}
				text = qs(0xb73cb78f)
			}
			AddArrayElement array = <options> element = <element>
			<options> = <array>
		endif
		FormatText TextName = text qs(0xdd0e65a3) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
		if StructureContains \{structure = purchase_struct
				song_original_artist}
			if (<purchase_struct>.song_original_artist = 0)
				FormatText TextName = text qs(0x103fa662) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
			endif
		endif
		Title = qs(0xb7b2ba93)
		<options> = <options>
	else
		FormatText TextName = text qs(0xe64839f0) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
		if StructureContains \{structure = purchase_struct
				song_original_artist}
			if (<purchase_struct>.song_original_artist = 0)
				FormatText TextName = text qs(0x8d915900) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
			endif
		endif
		Title = qs(0x01371302)
	endif
	if StructureContains \{structure = purchase_struct
			album_pack_only}
		if GotParam \{pack_purchase_struct}
			FormatText TextName = text qs(0xd7aa53b6) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
			if StructureContains \{structure = purchase_struct
					song_original_artist}
				if (<purchase_struct>.song_original_artist = 0)
					FormatText TextName = text qs(0xe4f34a69) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
				endif
			endif
		elseif GotParam \{album_purchase_struct}
			FormatText TextName = text qs(0x8f456955) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
			if StructureContains \{structure = purchase_struct
					song_original_artist}
				if (<purchase_struct>.song_original_artist = 0)
					FormatText TextName = text qs(0x974ac00b) i = (<purchase_struct>.song_title) a = (<purchase_struct>.song_artist)
				endif
			endif
		endif
	endif
	songlist :GetSingleTag \{exclusive_device}
	if ScreenElementExists \{id = dialog_box_container}
		return
	endif
	create_dialog_box {
		heading_text = <Title>
		body_text = <text>
		player_device = <exclusive_device>
		back_button_script = music_store_purchase_destroy_dialog_and_return
		options = <options>
		no_helper_pills
	}
	if IsPS3
		if (<purchase_struct>.purchased = 0)
			<menu_id> :SE_GetProps z_priority
			GetDisplaySettings
			if (<height> >= 720)
				<logo> = Playstation_Logo_HD720
				<Pos> = (200.0, 30.0)
				<scale> = 1.0
			else
				<logo> = Playstation_Logo_SD
				<Pos> = (200.0, 30.0)
				<scale> = 1.5
			endif
			CreateScreenElement {
				type = SpriteElement
				parent = root_window
				id = PS_Logo
				texture = <logo>
				just = [left top]
				Pos = <Pos>
				scale = <scale>
				z_priority = 10000
			}
		endif
	endif
	spawnscriptnow \{music_store_purchase_create_default_user_control_helpers}
	if (<purchase_struct>.purchased = 1)
		if StructureContains \{structure = purchase_struct
				album_pack_only}
			if GotParam \{pack_purchase_struct}
				spawnscriptnow music_store_purchase_accepted params = {purchase_struct = <pack_purchase_struct>}
			elseif GotParam \{album_purchase_struct}
				spawnscriptnow music_store_purchase_accepted params = {purchase_struct = <album_purchase_struct>}
			endif
		else
			spawnscriptnow music_store_purchase_accepted params = {purchase_struct = <purchase_struct>}
		endif
	endif
endscript

script music_store_purchase_new_view_go_back 
	RequireParams \{[
			purchase_struct
		]
		all}
	destroy_dialog_box
	Change \{g_songlist_last_visible_index = 4}
	generic_event_back data = {bypass_return_script = songlist_music_store_view_pack_songs ui_struct = <purchase_struct>}
endscript

script music_store_purchase_destroy_dialog_and_return 
	destroy_dialog_box
	Change \{g_songlist_refresh_menus = 1}
	Change \{g_songlist_last_visible_index = 4}
	generic_event_back \{data = {
			no_pivot
		}}
endscript

script music_store_purchase_create_default_user_control_helpers 
	wait \{3
		gameframes}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_purchase 
	if IsPS3
		DestroyScreenElement \{id = PS_Logo}
	endif
	Change \{g_music_store_purchase_struct = {
		}}
endscript

script music_store_purchase_accepted 
	RequireParams \{[
			purchase_struct
		]
		all}
	destroy_dialog_box
	music_store_purchase_content purchase_struct = <purchase_struct>
	if ($shutdown_game_for_signin_change_flag = 0)
		ui_event event = menu_replace data = {is_popup state = UIstate_music_store_scan_marketplace data = {purchase_struct = <purchase_struct>}}
	endif
endscript

script music_store_purchase_content 
	printf \{'music_store_purchase_content - Starting checkout'}
	printstruct <purchase_struct>
	Change \{music_store_attempted_purchase = 1}
	reset_dlc_signin_state
	Change \{generic_menu_block_input = 1}
	push_unsafe_for_shutdown \{reason = music_store_purchase_content}
	MarketplaceFunc func = checkout id = (<purchase_struct>.code)
	begin
	MarketplaceFunc \{func = get_state}
	if NOT (<state> = checkout)
		if NOT (<state> = download)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	pop_unsafe_for_shutdown \{reason = music_store_purchase_content}
	Change \{generic_menu_block_input = 0}
	printf \{'music_store_purchase_content - Done checkout'}
endscript

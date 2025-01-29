
script create_song_preview_menu \{ghtunes = 0
		song_select = 0
		num_ratings = 0
		advanced_record = 0}
	menu_music_off
	musicstudio_stop_menu_music
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	if (<ghtunes> = 0)
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
	endif
	if (<ghtunes> = 0)
		CreateScreenElement {
			parent = root_window
			id = song_preview_element
			Type = descinterface
			desc = 'gh_tunes_preview'
			event_handlers = [
				{pad_back song_preview_menu_back params = {ghtunes = <ghtunes> song_select = <song_select> advanced_record = <advanced_record>}}
				{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes>}}
			]
			exclusive_device = ($primary_controller)
			helper_text_ghtunes_alpha = 0
			helper_text_preview_alpha = 1
			just = [bottom right]
			rot_angle = 90
			z_priority = 100
		}
	else
		event_handlers = [
			{pad_back song_preview_menu_back params = {ghtunes = <ghtunes> song_select = <song_select> board_index = <board_index> start_at = <start_at>}}
			{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes>}}
			{pad_option2 song_preview_save_song params = {ghtunes = <ghtunes> FileName = <FileName> board_index = <board_index> start_at = <start_at>}}
			{pad_square ghtunes_view_user_content params = {selected_index = <selected_index> ghtunes = <ghtunes> FileName = <FileName> board_index = <board_index> start_at = <start_at> user_id = <user_id> user_name = <user_name>}}
			{pad_start song_preview_show_gamercard params = {user_id = <user_id>}}
			{pad_L1 ghtunes_show_terms_of_service params = {parent_menu = song_preview_element user_id = <user_id> selected_index = <selected_index>}}
		]
		CreateScreenElement {
			parent = root_window
			id = song_preview_element
			Type = descinterface
			desc = 'gh_tunes_preview'
			event_handlers = <event_handlers>
			exclusive_device = ($primary_controller)
			helper_text_ghtunes_alpha = 1
			helper_text_preview_alpha = 0
			just = [bottom right]
			rot_angle = 90
			z_priority = 100
		}
	endif
	LaunchEvent \{Type = unfocus
		target = song_preview_element}
	if NOT GotParam \{file_id}
		getsonginfo
	endif
	create_jam_song_info_text parent = song_preview_element Pos = (485.0, 332.0) column_offset = (215.0, 0.0) z_priority = 60 FileName = <FileName> file_id = <file_id> num_ratings = <num_ratings>
	song_preview_draw_album_cover
	if (<ghtunes> = 0)
		jam_publish_draw_album_cover
	endif
	if ScreenElementExists \{id = song_preview_element}
		SoundEvent \{event = ghtunes_on}
		song_preview_element :SetProps \{playbar_dims = (0.0, 14.0)}
		song_preview_element :SetProps \{rot_angle = -1
			time = 0.2}
		song_preview_element :se_waitprops
		song_preview_element :SetProps \{rot_angle = 1
			time = 0.02}
		song_preview_element :se_waitprops
		song_preview_element :SetProps \{rot_angle = -0.5
			time = 0.02}
		song_preview_element :se_waitprops
		song_preview_element :SetProps \{rot_angle = 0.5
			time = 0.02}
		song_preview_element :se_waitprops
		song_preview_element :SetProps \{rot_angle = 0
			time = 0.02}
		song_preview_element :se_waitprops
	endif
	musicstudio_initialize_song
	playback_custom_song \{start_time = 0}
	SpawnScriptNow song_preview_update_playbar params = {song_length = <song_length>}
	Change song_preview_curr_song_length = <song_length>
	if ScreenElementExists \{id = song_preview_element}
		song_preview_element :SetProps \{timer_text = qs(0x959c9972)}
	endif
	clean_up_user_control_helpers
	if (<ghtunes> = 0)
		add_user_control_helper \{text = qs(0xb458b767)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	else
		ghtunes_song_preview_helper_text
	endif
	LaunchEvent \{Type = focus
		target = song_preview_element}
endscript

script ghtunes_song_preview_helper_text 
	add_user_control_helper \{text = qs(0xb458b767)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if isxenonorwindx
		if NOT NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			add_user_control_helper \{text = qs(0xe618e644)
				button = yellow
				z = 100000}
		endif
	else
		add_user_control_helper \{text = qs(0xe618e644)
			button = yellow
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xd9bf4807)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xb7bb830d)
		button = orange
		z = 100000}
	if isxenonorwindx
		add_user_control_helper \{text = qs(0x9a7d1fe5)
			button = start
			z = 100000}
	endif
endscript

script song_preview_show_gamercard 
	printf \{channel = jam_mode
		'song_preview_show_gamercard'}
	if isxenonorwindx
		if GotParam \{user_id}
			NetSessionFunc func = showGamerCard params = {player_xuid = (<user_id>.user_id)}
		endif
	endif
endscript

script song_preview_save_song 
	printf \{channel = musicstudio
		qs(0xa6dda4fd)}
	if is_accepting_invite_or_sigining_out
		printf \{channel = musicstudio
			qs(0x92c3afb6)}
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return
		endif
	endif
	printf \{channel = jam_mode
		qs(0xa6dda4fd)}
	if ScreenElementExists \{id = song_preview_element}
		LaunchEvent \{Type = unfocus
			target = song_preview_element}
	endif
	if (<ghtunes> = 0)
		return
	endif
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_Size> > 0)
		index = 0
		begin
		if ((<directorylisting> [<index>].FileName) = <FileName>)
			song_preview_save_song_failed dialog = 0 <...>
			return
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	SoundEvent \{event = ghtunes_ui_select}
	destroy_song_preview_menu \{ghtunes = 1}
	Change \{memcard_after_func = song_preview_unload}
	Change memcard_jamsession_file_name = <FileName>
	musicstudio_initialize_empty_song FileName = <FileName>
	ui_memcard_save_jam event = menu_back data = {state = uistate_jam_ghtunes straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
endscript

script song_preview_save_song_failed \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = song_preview_element}
	SoundEvent \{event = Menu_Warning_SFX}
	clean_up_user_control_helpers
	jam_stop_all_sound
	stop_custom_song
	KillSpawnedScript \{Name = song_preview_update_playbar}
	switch <dialog>
		case 0
		formatText \{TextName = dialog
			qs(0xbcf241ef)}
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0x86289d11)
		body_text = <dialog>
		options = [
			{
				func = song_preview_menu_back
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script song_preview_play_pause 
	printf \{channel = jam_mode
		qs(0xe0524aa4)}
	SoundEvent \{event = ghtunes_ui_select}
	if ScriptIsRunning \{song_preview_update_playbar}
		musicstudio_stop_song_preview
	else
		playback_custom_song \{start_time = $song_preview_curr_song_time}
		SpawnScriptNow \{song_preview_update_playbar
			params = {
				song_length = $song_preview_curr_song_length
			}}
	endif
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_lead) fade_type = log_fast fade_time = 0.3
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
endscript

script musicstudio_stop_song_preview 
	GetSongTimeMs
	Change song_preview_curr_song_time = <time>
	stop_custom_song
	KillSpawnedScript \{Name = song_preview_update_playbar}
endscript
song_preview_curr_song_length = 0
song_preview_curr_song_time = 0

script song_preview_update_playbar 
	if NOT ScreenElementExists \{id = song_preview_element}
		return
	endif
	song_preview_element :SetProps \{playbar_dims = (0.0, 32.0)}
	playbar_max_x = 494
	if (<song_length> > 0)
		begin
		GetSongTimeMs
		playbar_x = ((<time> / <song_length>) * <playbar_max_x>)
		song_preview_element :SetProps playbar_dims = ((0.0, 32.0) + ((1.0, 0.0) * <playbar_x>))
		CastToInteger \{time}
		Mod a = <time> b = 60000
		<Seconds> = (<Mod> / 1000)
		<minutes> = (<time> / 60000)
		<sec_check> = (<Seconds> / 10)
		if (<sec_check> < 1)
			formatText TextName = song_time_text qs(0xeacde407) a = <minutes> b = <Seconds>
		else
			formatText TextName = song_time_text qs(0xcc868dda) a = <minutes> b = <Seconds>
		endif
		CastToInteger \{time}
		Mod a = <song_length> b = 60000
		<Seconds> = (<Mod> / 1000)
		<minutes> = (<song_length> / 60000)
		<sec_check> = (<Seconds> / 10)
		if (<sec_check> < 1)
			formatText TextName = song_length_text qs(0xeacde407) a = <minutes> b = <Seconds>
		else
			formatText TextName = song_length_text qs(0xcc868dda) a = <minutes> b = <Seconds>
		endif
		formatText TextName = song_time_text qs(0x7cf490df) a = <song_time_text> b = <song_length_text>
		song_preview_element :SetProps timer_text = <song_time_text>
		if (<time> >= <song_length>)
			Change \{song_preview_curr_song_time = 0}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script song_preview_draw_album_cover 
	cas_update_band_logo \{album_art}
	PushAssetContext context = ($cas_band_logo_details.AssetContext)
	if ScreenElementExists \{id = jam_preview_album_cover}
		DestroyScreenElement \{id = jam_preview_album_cover}
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = song_preview_element
		id = jam_preview_album_cover
		texture = ($cas_band_logo_details.textureasset)
		dims = (300.0, 300.0)
		Pos = (303.0, 388.0)
		just = [center center]
		z_priority = 60
	}
	PopAssetContext
endscript

script remove_missing_album_cover_textures 
	getactualcasoptionstruct \{part = cas_band_logo
		desc_id = cas_band_logo_id}
	album_cover = ($editable_jam_album_cover)
	GetArraySize <album_cover> param = album_cover_size
	i = 0
	begin
	if StructureContains structure = (<album_cover> [<i>]) Name = layers
		curr_layers = (<album_cover> [<i>].layers)
		j = 0
		begin
		GetArraySize <curr_layers> param = layers_size
		if (<j> >= <layers_size>)
			break
		endif
		remove = 0
		if StructureContains structure = (<curr_layers> [<j>]) Name = texture
			curr_texture = (<curr_layers> [<j>].texture)
			match_layers_texture prof_texture = <curr_texture> sections = <sections>
			if NOT GotParam \{mask}
				printf channel = logo qs(0x0edb7dc6) s = <curr_texture>
				<remove> = 1
			endif
		elseif StructureContains structure = (<curr_layers> [<j>]) Name = font
			curr_font = (<curr_layers> [<j>].font)
			curr_text = (<curr_layers> [<j>].text)
			match_layers_font prof_font = <curr_font> prof_text = <curr_text> sections = <sections>
			if NOT GotParam \{mask}
				printf channel = logo qs(0x3cc1f19d) s = <curr_font>
				<remove> = 1
			endif
		endif
		if (<remove> = 1)
			RemoveArrayElement array = <curr_layers> index = <j>
			<curr_layers> = <array>
		else
			<j> = (<j> + 1)
		endif
		repeat
		SetArrayElement ArrayName = album_cover index = <i> NewValue = {
			(<album_cover> [<i>])
			layers = <curr_layers>
		}
	endif
	<i> = (<i> + 1)
	repeat <album_cover_size>
	Change editable_jam_album_cover = <album_cover>
endscript

script song_preview_menu_back 
	LaunchEvent \{Type = unfocus
		target = song_preview_element}
	destroy_dialog_box
	KillSpawnedScript \{Name = song_preview_update_playbar}
	SoundEvent \{event = ghtunes_off}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_preview_element}
		song_preview_element :SetProps \{rot_angle = 90
			time = 0.2}
		song_preview_element :se_waitprops
	endif
	destroy_song_preview_menu ghtunes = <ghtunes>
	if (<ghtunes> = 1)
		song_preview_unload
		ui_event event = menu_back state = uistate_jam_ghtunes data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
	elseif (<song_select> = 1)
		jam_popup_preview_song_go_back advanced_record = <advanced_record>
	endif
endscript

script song_preview_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearcustomsong
endscript

script destroy_song_preview_menu \{ghtunes = 0}
	jam_stop_all_sound
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	stop_custom_song
	KillSpawnedScript \{Name = song_preview_update_playbar}
	if (<ghtunes> = 0)
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
	musicstudio_start_menu_music
endscript

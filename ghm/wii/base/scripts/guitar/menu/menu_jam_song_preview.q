ghtunes_preview_status = playing

script create_song_preview_menu \{ghtunes = 0
		num_ratings = 0}
	menu_music_off
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	if (<ghtunes> = 0)
		LaunchEvent \{Type = unfocus
			target = current_menu}
		CreateScreenElement {
			parent = root_window
			id = song_preview_element
			Type = descinterface
			desc = 'gh_tunes_preview'
			event_handlers = [
				{pad_back song_preview_menu_back params = {ghtunes = <ghtunes>}}
				{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes> user_id = <user_id>}}
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
			{pad_back song_preview_menu_back params = {ghtunes = <ghtunes> board_index = <board_index> start_at = <start_at>}}
			{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes> user_id = <user_id>}}
			{pad_option2 song_preview_save_song params = {ghtunes = <ghtunes> FileName = <FileName> board_index = <board_index> start_at = <start_at>}}
			{pad_option ghtunes_view_user_content params = {selected_index = <selected_index> ghtunes = <ghtunes> FileName = <FileName> board_index = <board_index> start_at = <start_at> user_id = <user_id> user_name = <user_name>}}
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
	getsonginfo
	GetArraySize \{$drum_kits}
	printf channel = jam_mode qs(0xdf0adb60) s = <drum_kit>
	if ((<drum_kit> >= <array_Size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	Change jam_current_drum_kit = <drum_kit>
	loaddrumkitall drum_kit = ($drum_kits [<drum_kit>].string_id) percussion_kit = ($drum_kits [<drum_kit>].percussion_string_id) async = 0
	GetArraySize \{$pause_melody_kit_options}
	if ((<melody_kit> >= <array_Size>) || (<melody_kit> < 0))
		<melody_kit> = 0
	endif
	Change jam_current_melody_kit = <melody_kit>
	0x541c59af melody_kit = <melody_kit>
	Wait \{1
		gameframe}
	if GotParam \{bass_kit}
		GetArraySize \{$pause_bass_kit_options}
		if ((<bass_kit> >= <array_Size>) || (<bass_kit> < 0))
			<bass_kit> = 0
		endif
		Change bass_kit_mode = <bass_kit>
		loadbasskit bass_kit = <bass_kit>
	else
		Change \{bass_kit_mode = 0}
	endif
	0xc1c4e84c \{mode = jammode
		Force = 1}
	Change \{ghtunes_preview_status = playing}
	SpawnScriptNow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 0
			start_time = 0
			in_game = 0
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 1
			start_time = 0
			in_game = 0
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 2
			start_time = 0
			in_game = 0
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 4
			start_time = 0
			in_game = 0
		}}
	SpawnScriptNow \{guitar_jam_drum_playback
		params = {
			start_time = 0
		}}
	SpawnScriptNow song_preview_update_playbar params = {song_length = <song_length> <...>}
	Change song_preview_curr_song_length = <song_length>
	if ScreenElementExists \{id = song_preview_element}
		song_preview_element :SetProps \{timer_text = qs(0x959c9972)}
	endif
	song_preview_control_helpers <...>
	LaunchEvent \{Type = focus
		target = song_preview_element}
endscript

script song_preview_show_gamercard 
	printf \{channel = jam_mode
		'song_preview_show_gamercard'}
	if isXenon
		if GotParam \{user_id}
			NetSessionFunc func = showGamerCard params = {player_xuid = (<user_id>.user_id)}
		endif
	endif
endscript

script song_preview_save_song 
	if NOT current_band_save_created controller = ($primary_controller)
		return
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
	jam_get_num_songs
	if (<user_song_count> >= ($jam_max_user_songs))
		song_preview_save_song_failed dialog = 1 <...>
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
	index = (<array_Size> - 1)
	begin
	if ((<directorylisting> [<index>].song_version) = 0)
		Change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
		break
	endif
	<index> = (<index> -1)
	repeat <array_Size>
	ui_memcard_save_jam event = menu_back data = {state = uistate_jam_ghtunes straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
endscript

script song_preview_save_song_failed \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = song_preview_element}
	SoundEvent \{event = Menu_Warning_SFX}
	clean_up_user_control_helpers
	jam_stop_all_sound
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = song_preview_update_playbar}
	switch <dialog>
		case 0
		formatText \{TextName = dialog
			qs(0xbcf241ef)}
		case 1
		formatText \{TextName = dialog
			qs(0x214955d6)
			s = $jam_max_user_songs}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x86289d11)
		textblock = {
			text = <dialog>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {song_preview_menu_back}
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
	if ScriptIsRunning \{guitar_jam_playback_recording}
		Change \{ghtunes_preview_status = paused}
		GetSongTimeMs
		Change song_preview_curr_song_time = <time>
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = song_preview_update_playbar}
	elseif ScriptIsRunning \{guitar_jam_drum_playback}
		Change \{ghtunes_preview_status = paused}
		GetSongTimeMs
		Change song_preview_curr_song_time = <time>
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = song_preview_update_playbar}
	else
		Change \{ghtunes_preview_status = playing}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 0
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 1
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 2
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 4
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_drum_playback
			params = {
				start_time = $song_preview_curr_song_time
			}}
		SpawnScriptNow song_preview_update_playbar params = {song_length = $song_preview_curr_song_length <...>}
	endif
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_lead) fade_type = log_fast fade_time = 0.3
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
	song_preview_control_helpers <...>
endscript

script song_preview_control_helpers 
	clean_up_user_control_helpers
	if ($ghtunes_preview_status = playing)
		add_user_control_helper \{text = qs(0x48a351fa)
			button = green
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xffb0c002)
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<ghtunes> = 1)
		if current_band_save_created controller = ($primary_controller)
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
		if isXenon
			if GotParam \{user_id}
				add_user_control_helper \{text = qs(0x9a7d1fe5)
					button = start
					z = 100000}
			endif
		endif
	endif
endscript
song_preview_curr_song_length = 0
song_preview_curr_song_time = 0

script song_preview_update_playbar 
	if NOT ScreenElementExists \{id = song_preview_element}
		return
	endif
	song_preview_element :SetProps \{playbar_dims = (0.0, 14.0)}
	playbar_max_x = 344
	begin
	GetSongTimeMs
	if (<time> >= <song_length>)
		Change \{song_preview_curr_song_time = 0}
		Change \{ghtunes_preview_status = paused}
		if NOT ScreenElementExists \{id = ghtunes_terms_dialog_box}
			song_preview_control_helpers <...>
		endif
		break
	endif
	playbar_x = ((<time> / <song_length>) * <playbar_max_x>)
	song_preview_element :SetProps playbar_dims = ((0.0, 14.0) + ((1.0, 0.0) * <playbar_x>))
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
	song_preview_element :SetProps timer_text = <song_time_text>
	Wait \{1
		gameframe}
	repeat
endscript

script song_preview_draw_album_cover 
	remove_missing_album_cover_textures
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
		dims = (256.0, 256.0)
		Pos = (346.0, 353.0)
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
	destroy_popup_warning_menu
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
	endif
endscript

script song_preview_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
endscript

script destroy_song_preview_menu \{ghtunes = 0}
	jam_stop_all_sound
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = song_preview_update_playbar}
	if (<ghtunes> = 0)
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100
			all_buttons}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
endscript

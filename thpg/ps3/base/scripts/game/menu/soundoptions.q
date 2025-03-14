current_soundtrack = ``
current_user_music_vol = 5
current_user_sound_vol = 7
current_genre = "Hip Hop"
hiphop_toggle = 0
punk_toggle = 0
rock_toggle = 0
SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 0
SOUNDOPTIONS_current_user_music_vol = 0
SOUNDOPTIONS_current_user_sound_vol = 0
SOUNDOPTIONS_was_checked = 0

script launch_sound_options_menu 
	if gotparam \{from_options}
		create_sound_options_menu \{from_options}
	else
		create_sound_options_menu
	endif
endscript

script sound_options_check_globals 
	if getglobalflag \{flag = $SOUNDS_SONGORDER_RANDOM}
		change \{SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 1}
	else
		change \{SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 0}
	endif
	change SOUNDOPTIONS_current_user_music_vol = ($current_user_music_vol)
	change SOUNDOPTIONS_current_user_sound_vol = ($current_user_sound_vol)
	change \{SOUNDOPTIONS_was_checked = 1}
endscript

script sound_options_reset_globals 
	change \{SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 0}
	change \{SOUNDOPTIONS_current_user_music_vol = 0}
	change \{SOUNDOPTIONS_current_user_sound_vol = 0}
	change \{SOUNDOPTIONS_was_checked = 0}
endscript

script sound_options_has_changed 
	if getglobalflag \{flag = $SOUNDS_SONGORDER_RANDOM}
		if ($SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 0)
			return \{true}
		endif
	else
		if ($SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 1)
			return \{true}
		endif
	endif
	if NOT (($SOUNDOPTIONS_current_user_music_vol) = ($current_user_music_vol))
		return \{true}
	endif
	if NOT (($SOUNDOPTIONS_current_user_sound_vol) = ($current_user_sound_vol))
		return \{true}
	endif
	return \{false}
endscript

script sound_options_restore_globals 
	if sound_options_has_changed
		if ($SOUNDOPTIONS_SOUNDS_SONGORDER_RANDOM = 1)
			if NOT getglobalflag flag = $SOUNDS_SONGORDER_RANDOM
				PlaylistStop
				SetPlaylistOptions name = master weightedgenres repeatplay
				PlaylistPlay
				setglobalflag flag = $SOUNDS_SONGORDER_RANDOM
			endif
		else
			if getglobalflag flag = $SOUNDS_SONGORDER_RANDOM
				PlaylistStop
				PlaylistAlphabetizeByArtist
				SetPlaylistOptions name = master repeatplay
				PlaylistPlay
				unsetglobalflag flag = $SOUNDS_SONGORDER_RANDOM
			endif
		endif
		if NOT (($SOUNDOPTIONS_current_user_music_vol) = ($current_user_music_vol))
			switch ($SOUNDOPTIONS_current_user_music_vol)
				case 10
				<vol> = 12
				case 9
				<vol> = 9
				case 8
				<vol> = 6
				case 7
				<vol> = 4
				case 6
				<vol> = 2
				case 5
				<vol> = 0
				case 4
				<vol> = -8
				case 3
				<vol> = -11
				case 2
				<vol> = -15
				case 1
				<vol> = -20
				case 0
				<vol> = -100
			endswitch
			if (($current_user_music_vol = 0) && (($SOUNDOPTIONS_current_user_music_vol) > 0))
				PlaylistPlay
			endif
			if (($SOUNDOPTIONS_current_user_music_vol) = 0)
				StopAllPlaylists
			endif
			soundbussunlock user_music
			setsoundbussparams {user_music = {vol = <vol>}}
			soundbusslock user_music
			change current_user_music_vol = ($SOUNDOPTIONS_current_user_music_vol)
		endif
		if NOT (($SOUNDOPTIONS_current_user_sound_vol) = ($current_user_sound_vol))
			switch ($SOUNDOPTIONS_current_user_sound_vol)
				case 10
				<vol> = 0
				case 9
				<vol> = -1
				case 8
				<vol> = -2
				case 7
				<vol> = -3
				case 6
				<vol> = -4
				case 5
				<vol> = -6
				case 4
				<vol> = -8
				case 3
				<vol> = -11
				case 2
				<vol> = -15
				case 1
				<vol> = -20
				case 0
				<vol> = -100
			endswitch
			change global_user_sfx_number = ($SOUNDOPTIONS_current_user_sound_vol)
			soundbussunlock user_sfx
			setsoundbussparams {user_sfx = {vol = <vol>}}
			soundbusslock user_sfx
			change current_user_sound_vol = ($SOUNDOPTIONS_current_user_sound_vol)
		endif
	endif
	change SOUNDOPTIONS_was_checked = 0
endscript
0x053c83d6 = 0

script create_sound_options_menu 
	if ($SOUNDOPTIONS_was_checked = 0)
		sound_options_check_globals
	endif
	if NOT ($0x053c83d6 = 1)
		printpushpopdebuginfo push name = "create_sound_options_menu"
		pushsoundbussparams
		setsoundbussparams $default_bussset time = 0.5
		change 0x053c83d6 = 1
	endif
	make_cas_menu {
		menu_id = menu_sound
		vmenu_id = vmenu_sound
		title = "SOUND OPTIONS"
		pausemenu
		ticker
		width = 550
		highlight_add = (50.0, 0.0)
	}
	flag = ""
	setscreenelementprops {
		id = vmenu_sound
		event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = sound_options_exit <flag>}}
		]
	}
	if getglobalflag flag = $SOUNDS_SONGORDER_RANDOM
		song_text = "RANDOM"
	else
		song_text = "IN ORDER"
	endif
	if istrue $forceambientsfxtomusicvolume
		sound_override = not_focusable
		song_text = "Level Music!"
	endif
	add_cas_menu_item {
		id = menu_song_order
		text = "SONGS"
		extra_text = <song_text>
		<sound_override>
		option_arrows
		option_arrows_callback = toggle_song_order
	}
	add_cas_menu_item {
		id = menu_skip_track
		text = "SKIP TRACK"
		additional_focus_script = skip_track_focus
		additional_unfocus_script = skip_track_unfocus
		pad_choose_script = skip_track
		pad_choose_sound = nullscript
		<sound_override>
	}
	if NOT infrontend
		if ($current_soundtrack = ``)
			flag = ""
		else
			flag = not_focusable
		endif
		add_cas_menu_item {
			id = menu_playlist
			text = "MUSIC PLAYLIST"
			pad_choose_script = create_playlist_menu
			pad_choose_params = {pop_sound_buss}
			<sound_override>
			<flag>
		}
	endif
	formattext textname = cdvol "%v" v = ($current_user_music_vol)
	add_cas_menu_item {
		id = menu_music_level
		text = "MUSIC LEVEL"
		extra_text = <cdvol>
		additional_focus_script = menu_music_special_focus
		additional_unfocus_script = menu_music_special_unfocus
		option_arrows
		option_arrows_callback = menu_alter_music
	}
	menu_music_level :menu_alter_music
	formattext textname = sfxvol "%v" v = ($current_user_sound_vol)
	add_cas_menu_item {
		id = menu_sound_level
		text = "SFX LEVEL"
		extra_text = <sfxvol>
		option_arrows
		option_arrows_callback = menu_alter_sound
	}
	menu_sound_level :menu_alter_sound
	if getglobalflag flag = $SOUNDS_SPECIALSOUNDS_OFF
		sounds_specialsounds = off
	else
		sounds_specialsounds = on
	endif
	if getglobalflag flag = $SOUNDS_MUSICBOXES_OFF
		sounds_music_boxes = off
	else
		sounds_music_boxes = on
	endif
	if gotparam from_options
		params = from_options
	else
		params = ""
	endif
	add_cas_menu_item {
		id = menu_done
		text = "DONE"
		pad_choose_script = sound_options_exit
		pad_choose_params = {<params>}
	}
	cas_menu_finish helper_text = {
		helper_text_elements = [
			{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
		]
	}
endscript

script add_music_track_text parent = current_menu_anchor pos = (80.0, 325.0)
	if ($in_playlist_menu = 1)
		<pos> = (350.0, 10.0)
	endif
	if ($current_user_music_vol = 0)
		return
	endif
	if screenelementexists id = music_track_anchor
		destroyscreenelement id = music_track_anchor
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = music_track_anchor
		pos = <pos>
		dims = (0.0, 0.0)
		alpha = 0
		scale = 0.85
	}
	current_genre = ""
	GetNowPlayingTrackInfo
	<current_band_text> = <trackartist>
	<current_track_text> = <tracktitle>
	on_rgba = [128 123 20 255]
	off_rgba = [128 128 128 240]
	createscreenelement {
		type = spriteelement
		parent = music_track_anchor
		id = music_track_bg
		texture = HUD_bg_timer
		just = [left center]
		scale = (3.1, 1.1)
		pos = (-25.0, 45.0)
		rgba = [30 20 10 255]
		alpha = 0.25
		z_priority = 0
	}
	createscreenelement {
		type = textelement
		parent = music_track_anchor
		text = "ARTIST:"
		font = text_a1
		just = [right center]
		scale = 0.45000002
		pos = (34.0, 35.0)
		rgba = [100 100 100 255]
		alpha = 1
		z_priority = 1
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		font_spacing = 2
	}
	createscreenelement {
		type = textelement
		parent = music_track_anchor
		id = music_band_text
		text = <current_band_text>
		font = text_a1
		just = [left center]
		scale = 0.45000002
		pos = (40.0, 35.0)
		rgba = [70 100 100 255]
		alpha = 1
		z_priority = 1
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		font_spacing = 2
	}
	getscreenelementdims id = music_band_text
	if (<width> > 125)
		<scale> = ((125.0 / <width>) * 0.5)
		doscreenelementmorph id = music_band_text time = 0 scale = <scale>
	endif
	createscreenelement {
		type = textelement
		parent = music_track_anchor
		text = "TRACK:"
		font = text_a1
		just = [right center]
		scale = 0.45000002
		pos = (34.0, 58.0)
		rgba = [100 100 100 255]
		alpha = 1
		z_priority = 1
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		font_spacing = 2
	}
	createscreenelement {
		type = textelement
		parent = music_track_anchor
		id = music_track_text
		text = <current_track_text>
		font = text_a1
		just = [left center]
		scale = 0.45000002
		pos = (40.0, 58.0)
		rgba = [70 100 100 255]
		alpha = 1
		z_priority = 1
		shadow
		shadow_offs = $trick_text_shadow_offset
		shadow_rgba = $trick_text_shadow_color
		font_spacing = 2
	}
	getscreenelementdims id = music_track_text
	if (<width> > 125)
		<scale> = ((125.0 / <width>) * 0.5)
		doscreenelementmorph id = music_track_text time = 0 scale = <scale>
	endif
	createscreenelement {
		type = textelement
		parent = music_track_anchor
		id = music_track_genre
		text = <current_genre>
		font = text_a1
		just = [right top]
		scale = (0.8, 0.6)
		pos = (32.0, 58.0)
		rgba = [0 0 0 255]
		alpha = 0.8
		z_priority = 3
	}
	doscreenelementmorph id = music_track_anchor alpha = 1 time = 0.3
	if istrue $forceambientsfxtomusicvolume
		doscreenelementmorph id = music_track_anchor alpha = 0
	endif
endscript

script spawn_update_music_track_text 
	if screenelementexists \{id = music_track_anchor}
		runscriptonscreenelement id = music_track_anchor update_music_track_text params = {<...>}
	endif
	if screenelementexists \{id = pause_ticker_container_master}
		spawnscriptlater \{ui_ticker_refresh}
	endif
endscript

script update_music_track_text 
	if screenelementexists \{id = music_track_anchor}
		doscreenelementmorph \{id = music_track_anchor
			alpha = 0
			time = 0.3}
		wait \{0.3
			seconds}
		if screenelementexists \{id = music_track_anchor}
			add_music_track_text
		endif
	endif
endscript

script sound_options_exit 
	if sound_options_has_changed
		create_dialog_box {
			title = "Confirm changes?"
			text = "Would you like to apply the changes you have made?"
			pos = (320.0, 240.0)
			just = [center center]
			pad_back_script = destroy_dialog_box
			buttons = [
				{font = text_a1 text = "YES" pad_choose_script = sound_options_exit_choose pad_choose_params = {<...>}}
				{font = text_a1 text = "NO" pad_choose_script = sound_options_exit_choose pad_choose_params = {<...> discard}}
				{font = text_a1 text = "CANCEL" pad_choose_script = destroy_dialog_box}
			]
			no_helper_text
		}
	else
		sound_options_exit_choose <...>
	endif
endscript

script sound_options_exit_choose 
	if gotparam discard
		sound_options_restore_globals
	endif
	sound_options_reset_globals
	killspawnedscript name = shake_projector
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if gotparam just_remove
		return
	endif
	if ($0x053c83d6 = 1)
		printpushpopdebuginfo pop name = 'sound_options_exit'
		popsoundbussparams
		change 0x053c83d6 = 0
	endif
	if NOT infrontend
		ui_change_state state = UIstate_pauseoptions
	else
		ui_change_state state = UIstate_pauseoptions
	endif
endscript

script toggle_song_order 
	if NOT istrue $enable_playlist
		return
	endif
	if gotparam left
		soundevent event = Pause_Menu_Scroll_LEFT_SFX
	else
		soundevent event = Pause_Menu_Scroll_RIGHT_SFX
	endif
	if NOT getglobalflag flag = $SOUNDS_SONGORDER_RANDOM
		setscreenelementprops id = {menu_song_order child = extra_text} text = "RANDOM"
		PlaylistStop
		SetPlaylistOptions name = master weightedgenres repeatplay
		PlaylistPlay
		setglobalflag flag = $SOUNDS_SONGORDER_RANDOM
	else
		setscreenelementprops id = {menu_song_order child = extra_text} text = "IN ORDER"
		PlaylistStop
		PlaylistAlphabetizeByArtist
		SetPlaylistOptions name = master repeatplay
		PlaylistPlay
		unsetglobalflag flag = $SOUNDS_SONGORDER_RANDOM
	endif
endscript

script toggle_special_sounds 
	if NOT getglobalflag \{flag = $SOUNDS_SPECIALSOUNDS_OFF}
		setglobalflag \{flag = $SOUNDS_SPECIALSOUNDS_OFF}
	else
		unsetglobalflag \{flag = $SOUNDS_SPECIALSOUNDS_OFF}
		soundevent \{event = toggle_special_sounds_sfx}
	endif
endscript

script toggle_music_zones 
	if NOT getglobalflag \{flag = $SOUNDS_MUSICBOXES_OFF}
		setglobalflag \{flag = $SOUNDS_MUSICBOXES_OFF}
		change \{music_was_paused = 0}
	else
		unsetglobalflag \{flag = $SOUNDS_MUSICBOXES_OFF}
	endif
	if NOT infrontend
		root_window :settags \{need_music_zone_refresh}
	endif
endscript

script menu_alter_music 
	gettags
	<value> = ($current_user_music_vol)
	if gotparam left
		if (<value> > 0)
			<value> = (<value> - 1)
		endif
	else
		if gotparam right
			if (<value> < 10)
				<value> = (<value> + 1)
			endif
		endif
	endif
	switch <value>
		case 10
		<vol> = 12
		case 9
		<vol> = 9
		case 8
		<vol> = 6
		case 7
		<vol> = 4
		case 6
		<vol> = 2
		case 5
		<vol> = 0
		case 4
		<vol> = -8
		case 3
		<vol> = -11
		case 2
		<vol> = -15
		case 1
		<vol> = -20
		case 0
		<vol> = -100
	endswitch
	if (($current_user_music_vol = 0) && (<value> > 0))
		PlaylistPlay
	endif
	if (<value> = 0)
		StopAllPlaylists
	endif
	soundbussunlock user_music
	setsoundbussparams {user_music = {vol = <vol>}}
	soundbusslock user_music
	if NOT ($current_user_music_vol = <value>)
		soundevent event = Pause_Menu_Level_Change_SFX
	endif
	change current_user_music_vol = <value>
	formattext textname = cdvol "%v" v = ($current_user_music_vol)
	setscreenelementprops id = {menu_music_level child = extra_text} text = <cdvol>
	left_alpha = unhide
	right_alpha = unhide
	if (<value> = 0)
		left_alpha = hide
	else
		if (<value> = 10)
			right_alpha = hide
		endif
	endif
	setscreenelementprops {
		id = {menu_music_level child = arrow_left}
		<left_alpha>
	}
	setscreenelementprops {
		id = {menu_music_level child = arrow_right}
		<right_alpha>
	}
endscript

script menu_alter_sound 
	gettags
	<value> = ($current_user_sound_vol)
	if gotparam left
		if (<value> > 0)
			<value> = (<value> - 1)
		endif
	else
		if gotparam right
			if (<value> < 10)
				<value> = (<value> + 1)
			endif
		endif
	endif
	switch <value>
		case 10
		<vol> = 3
		case 9
		<vol> = 2
		case 8
		<vol> = 1
		case 7
		<vol> = 0
		case 6
		<vol> = -3
		case 5
		<vol> = -6
		case 4
		<vol> = -8
		case 3
		<vol> = -11
		case 2
		<vol> = -15
		case 1
		<vol> = -20
		case 0
		<vol> = -100
	endswitch
	change global_user_sfx_number = <value>
	soundbussunlock user_sfx
	setsoundbussparams {user_sfx = {vol = <vol>}}
	soundbusslock user_sfx
	if NOT ($current_user_sound_vol = <value>)
		soundevent event = Pause_Menu_Level_Change_SFX
	endif
	change current_user_sound_vol = <value>
	formattext textname = sfxvol "%v" v = ($current_user_sound_vol)
	setscreenelementprops id = {menu_sound_level child = extra_text} text = <sfxvol>
	left_alpha = unhide
	right_alpha = unhide
	if (<value> = 0)
		left_alpha = hide
	else
		if (<value> = 10)
			right_alpha = hide
		endif
	endif
	setscreenelementprops {
		id = {menu_sound_level child = arrow_left}
		<left_alpha>
	}
	setscreenelementprops {
		id = {menu_sound_level child = arrow_right}
		<right_alpha>
	}
endscript

script menu_music_special_focus 
	if NOT infrontend
	endif
endscript

script menu_music_special_unfocus 
	if NOT infrontend
	endif
endscript

script skip_track_focus 
	if NOT infrontend
	endif
endscript

script skip_track_unfocus 
	if NOT infrontend
	endif
endscript

script sound_options_set_level 
	formattext textname = vol "%v" v = <level>
	if gotparam \{id}
		setscreenelementprops {
			id = {<id> child = extra_text}
			text = <vol>
		}
	endif
	<level> = (<level> * 10)
	switch <type>
		case cdvol
		printf \{"can't get here"}
		case sfxvol
		SetSfxVolume <level>
	endswitch
endscript

script skip_track 
	setspawnedscriptnorepeatfor \{time = 1.0}
	theme_menu_pad_choose_sound
	PlaylistNextTrack
endscript

script pulse_item 
	domorph \{time = 0.05
		scale = 0.9}
	domorph \{time = 0.05
		scale = 1.0}
endscript
in_playlist_menu = 0

script create_playlist_menu 
	on_rgba = [128 123 20 255]
	if NOT cd
		if NOT istrue $enable_playlist
			return
		endif
	endif
	if infrontend
		pushassetcontext context = z_mainmenu
	endif
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	change in_playlist_menu = 1
	make_cas_menu {
		title = "MUSIC PLAYLIST"
		pausemenu
		width = 1100
		highlight_add = (350.0, 0.0)
		MenuOffset = (0.0, -50.0)
		scrolling
		pad_back_script = exit_playlist_menu
	}
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			if screenelementexists id = pause_title_container
				doscreenelementmorph id = pause_title_container pos = {(0.0, -35.0) relative}
			endif
		endif
	endif
	setscreenelementprops {
		id = current_menu
		event_handlers = [
			{pad_option2 ui_select_genre}
			{pad_l1 ui_toggle_genre params = {left}}
			{pad_r1 ui_toggle_genre}
		]
	}
	ui_create_genre_toggle
	text_params = {scale = 0.8 just = [left center] rgba = ($goal_ui_scheme.main)}
	extra = {}
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			text_params = {<text_params> rgba = [200 200 200 255]}
			extra = {no_bg}
		endif
	endif
	ui_menu_column_headings {
		text_params = <text_params>
		<extra>
		width = 1280
		columns = [
			{text = "artist"
				pos = (90.0, 95.0)
			}
			{text = "track"
				pos = (440.0, 95.0)
			}
			{text = "genre"
				pos = (790.0, 95.0)
			}
		]
	}
	getarraysize $playlist_tracks
	text_scale = (0.4, 0.45000002)
	<i> = 0
	begin
	if IsTrackForbidden ($playlist_tracks [<i>].asset)
		toggle = off
	else
		toggle = on
	endif
	<genre> = ($playlist_tracks [<i>].display_genre)
	switch (<genre>)
		case "Metal"
		case "Reggae"
		case "Rock"
		case "Funk"
		<genre> = "Rock/Other"
		case "HipHop"
		<genre> = "Hip Hop"
	endswitch
	getlowercasestring ($playlist_tracks [<i>].title)
	<title> = <lowercasestring>
	getlowercasestring <genre>
	<genre> = <lowercasestring>
	<rgba> = ($cas_color_scheme.text_color_2)
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<rgba> = $goal_arcade_text_unfocus
		endif
	endif
	add_cas_menu_item {
		text = ($playlist_tracks [<i>].artist)
		toggle = <toggle>
		toggle_script = ui_toggle_song
		toggle_params = {asset = ($playlist_tracks [<i>].asset)}
		extras_offset = (380.0, 0.0)
		children = [
			{type = textelement
				font = text_a1
				text = <title>
				scale = 0.45000002
				pos = (90.0, 0.0)
				rgba = <rgba>
				local_id = column_2
				just = [left center]
			}
			{type = textelement
				font = text_a1
				text = <genre>
				scale = 0.45000002
				pos = (265.0, 0.0)
				rgba = <rgba>
				local_id = column_3
				just = [left center]
			}
		]
		additional_focus_script = ui_focus_song
		additional_unfocus_script = ui_unfocus_song
		pad_square_script = ui_preview_song
		pad_square_params = {asset = ($playlist_tracks [<i>].asset)}
		text_width = 160
	}
	getscreenelementdims id = {<item_container_id> child = column_2}
	if (<width> > 160)
		<mod> = (160.0 / <width>)
		printf "mod:%m" m = <mod>
		doscreenelementmorph {
			id = {<item_container_id> child = column_2}
			scale = (0.45000002 * <mod>)
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	cas_menu_finish helper_text = {
		helper_text_elements = [{text = "\\m1 BACK"}
			{text = "\\m0 TOGGLE TRACK"}
			{text = "\\m8 TOGGLE GENRE"}
			{text = "\\m5 PLAY"}
		]
	}
	if infrontend
		popassetcontext
	endif
endscript

script ui_select_genre 
	printf "TOGGLING GENRE: %a" a = $current_genre
	soundevent event = UI_Toggle_Genre_SFX
	getarraysize $playlist_tracks
	<i> = 0
	begin
	<genre> = ($playlist_tracks [<i>].display_genre)
	switch (<genre>)
		case "Metal"
		case "Reggae"
		case "Rock"
		case "Funk"
		<genre> = "Rock/Other"
		case "HipHop"
		<genre> = "Hip Hop"
	endswitch
	switch (<genre>)
		case "Rock/Other"
		<toggle> = ($rock_toggle)
		case "Hip Hop"
		<toggle> = ($hiphop_toggle)
		case "Punk"
		<toggle> = ($punk_toggle)
	endswitch
	if (<genre> = $current_genre)
		if (<toggle> = 1)
			AllowMusicTrack ($playlist_tracks [<i>].asset)
		else
			ForbidMusicTrack ($playlist_tracks [<i>].asset)
			GetNowPlayingTrackInfo
			if gotparam trackasset
				if (<trackasset> = ($playlist_tracks [<i>].asset))
					PlaylistNextTrack
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	switch ($current_genre)
		case "Rock/Other"
		if ($rock_toggle = 1)
			change rock_toggle = 0
		else
			change rock_toggle = 1
		endif
		case "Hip Hop"
		if ($hiphop_toggle = 1)
			change hiphop_toggle = 0
		else
			change hiphop_toggle = 1
		endif
		case "Punk"
		if ($punk_toggle = 1)
			change punk_toggle = 0
		else
			change punk_toggle = 1
		endif
	endswitch
	create_playlist_menu no_buss_push
endscript

script ui_toggle_genre 
	if NOT gotparam left
		soundevent event = View_Gaps_Scroll_RIGHT_SFX
		switch $current_genre
			case "Hip Hop"
			change current_genre = "Punk"
			case "Punk"
			change current_genre = "Rock/Other"
			case "Rock/Other"
			change current_genre = "Hip Hop"
		endswitch
	else
		soundevent event = View_Gaps_Scroll_LEFT_SFX
		switch $current_genre
			case "Hip Hop"
			change current_genre = "Rock/Other"
			case "Punk"
			change current_genre = "Hip Hop"
			case "Rock/Other"
			change current_genre = "Punk"
		endswitch
	endif
	ui_create_genre_toggle
endscript

script ui_create_genre_toggle 
	<width> = 460
	if screenelementexists id = genre_toggle
		destroyscreenelement id = genre_toggle
	endif
	createscreenelement {
		id = genre_toggle
		parent = main_menu_anchor
		type = containerelement
		pos = (640.0, 150.0)
		just = [center center]
		z_priority = -1
		dims = (1280.0, 0.0)
		child_anchor = [center center]
		scale = 1.5
	}
	<container_id> = <id>
	<width> = (<width> / 4.0)
	createscreenelement {
		parent = <container_id>
		type = spriteelement
		texture = white
		scale = (<width> * (1.0, 0.0) + (0.0, 6.3))
		just = [left center]
		rgba = [0 0 0 255]
		z_priority = -1
	}
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			destroyscreenelement id = <id>
			doscreenelementmorph id = <container_id> pos = {(150.0, -15.0) relative}
		endif
	endif
	createscreenelement {
		parent = <container_id>
		type = textelement
		rgba = ($cas_color_scheme.text_color)
		just = [right center]
		font = text_a1
		z_priority = 5
		text = "\\ma"
		scale = 0.45000002
		pos = (-150.0, 4.0)
	}
	createscreenelement {
		parent = <container_id>
		type = textelement
		rgba = ($cas_color_scheme.text_color)
		just = [left center]
		font = text_a1
		z_priority = 5
		text = "\\mb"
		scale = 0.45000002
		pos = (160.0, 4.0)
	}
	<genres> = [
		"Hip Hop"
		"Punk"
		"Rock/Other"
	]
	getarraysize <genres>
	<i> = 0
	begin
	if ($current_genre = (<genres> [<i>]))
		<rgba> = ($goal_ui_scheme.main)
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				<rgba> = [200 200 200 255]
			endif
		endif
	else
		<rgba> = $goal_arcade_text_unfocus
	endif
	createscreenelement {
		parent = <container_id>
		type = textelement
		rgba = <rgba>
		just = [center center]
		font = text_a1
		z_priority = 5
		text = (<genres> [<i>])
		scale = 0.45000002
		pos = ((-100.0, 2.0) + (100.0, 0.0) * <i>)
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script ui_toggle_song 
	if IsTrackForbidden <asset>
		AllowMusicTrack <asset>
	else
		ForbidMusicTrack <asset>
		GetNowPlayingTrackInfo
		if gotparam \{trackasset}
			if (<trackasset> = <asset>)
				PlaylistNextTrack
			endif
		endif
	endif
endscript

script ui_preview_song 
	soundevent \{event = generic_menu_pad_choose_sfx}
	AllowMusicTrack <asset>
	PlayTrack <asset>
	setscreenelementprops id = {<id> child = checkbox} texture = widget_checkbox_on
	<id> :settags toggle = on
endscript

script ui_focus_song 
	on_rgba = ($goal_ui_scheme.main)
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<on_rgba> = [200 200 200 255]
		endif
	endif
	doscreenelementmorph id = {<id> child = column_2} rgba = <on_rgba>
	doscreenelementmorph id = {<id> child = column_3} rgba = <on_rgba>
endscript

script ui_unfocus_song 
	off_rgba = ($cas_color_scheme.text_color_2)
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			<off_rgba> = $goal_arcade_text_unfocus
		endif
	endif
	doscreenelementmorph id = {<id> child = column_2} rgba = <off_rgba>
	doscreenelementmorph id = {<id> child = column_3} rgba = <off_rgba>
endscript

script exit_playlist_menu 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	change \{in_playlist_menu = 0}
	if gotparam \{from_options}
		create_sound_options_menu \{from_options}
	else
		create_sound_options_menu
	endif
endscript

script add_tracks_to_menu 
	getarraysize \{$playlist_tracks}
	index = 0
	begin
	if ((<index> = locked_track1) || (<index> = locked_track2))
		createscreenelement \{type = containerelement
			parent = current_menu
			dims = (0.0, 0.0)
			heap = topdown
			not_focusable}
	else
		playlist_menu_add_item {index = <index>}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script is_genre_on 
	printf "is_genre_on"
	on = 1
	getarraysize $playlist_tracks
	index = 0
	begin
	if ((($playlist_tracks [<index>]).display_genre) = <genre>)
		if ((<index> = locked_track1) || (<index> = locked_track2))
		else
			if NOT TrackEnabled <index>
				on = 0
				break
			endif
		endif
	endif
	index = (<index> + 1)
	repeat <array_size>
	return on = <on>
endscript

script playlist_hmenu_add_item 
	off_rgba = [128 128 128 240]
	switch <genre>
		case 0
		dims = (130.0, 50.0)
		case 1
		dims = (165.0, 50.0)
		case 2
		dims = (220.0, 50.0)
		default
		return
	endswitch
	createscreenelement {
		type = containerelement
		parent = playlist_hmenu
		dims = <dims>
		event_handlers = [{focus playlist_hmenu_focus}
			{unfocus playlist_hmenu_unfocus}
		]
	}
	anchor_id = <id>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		z_priority = 50
		font = text_a1
		text = <text>
		rgba = <off_rgba>
		scale = 1.5
		just = [left center]
	}
	GetStackedScreenElementPos x id = <id> offset = (4.0, 13.0)
	is_genre_on genre = <genre>
	if (<on> = 1)
		alpha = 1
	else
		alpha = 0
	endif
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = checkmark
		pos = <pos>
		alpha = <alpha>
		just = [left center]
		rgba = <off_rgba>
		z_priority = 5
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = checkbox
		pos = (<pos> + (0.0, 5.0))
		just = [left center]
		scale = 0.5
		rgba = <off_rgba>
		z_priority = 5
	}
endscript

script update_genre_checks 
	genre = 0
	begin
	is_genre_on genre = <genre>
	if (<on> = 1)
		alpha = 1
	else
		alpha = 0
	endif
	doscreenelementmorph id = {playlist_hmenu child = {<genre> child = 1}} alpha = <alpha>
	genre = (<genre> + 1)
	repeat 3
endscript

script playlist_hmenu_focus 
	gettags
	on_rgba = [128 123 20 255]
	doscreenelementmorph {id = {<id> child = 0} rgba = <on_rgba>}
	doscreenelementmorph {id = {<id> child = 1} rgba = <on_rgba>}
	playlist_hmenu :gettags
	if gotparam \{arrow_id}
		blink_arrow {id = <arrow_id>}
	endif
endscript

script playlist_hmenu_unfocus 
	gettags
	off_rgba = [128 128 128 240]
	doscreenelementmorph {id = {<id> child = 0} rgba = <off_rgba>}
	doscreenelementmorph {id = {<id> child = 1} rgba = <off_rgba>}
	playlist_hmenu :gettags
	if gotparam \{arrow_id}
		blink_arrow {id = <arrow_id>}
	endif
endscript

script focus_playlist_hmenu 
	gettags
	if (<tag_selected_id> = top_item)
		launchevent \{type = unfocus
			target = playlist_vmenu}
		doscreenelementmorph \{id = playlist_bottom_anchor
			alpha = 0.5}
		launchevent \{type = focus
			target = playlist_hmenu}
		doscreenelementmorph \{id = playlist_top_anchor
			alpha = 1.0}
	endif
endscript

script focus_playlist_vmenu 
	launchevent \{type = unfocus
		target = playlist_hmenu}
	doscreenelementmorph \{id = playlist_top_anchor
		alpha = 0.5}
	launchevent \{type = focus
		target = playlist_vmenu}
	doscreenelementmorph \{id = playlist_bottom_anchor
		alpha = 1.0}
endscript

script playlist_menu_add_item highlight_bar_scale = (4.3500004, 0.5) highlight_bar_pos = (321.0, 0.0)
	off_rgba = [128 128 128 240]
	bar_rgba = [25 25 25 255]
	if (<index> = 0)
		id = top_item
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu
		id = <id>
		dims = (500.0, 20.0)
		event_handlers = [{focus playlist_menu_focus params = <focus_params>}
			{unfocus playlist_menu_unfocus}
		]
		heap = topdown
	}
	<anchor_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = de_highlight_bar
		pos = <highlight_bar_pos>
		scale = <highlight_bar_scale>
		just = [center center]
		rgba = <bar_rgba>
		alpha = 0
		z_priority = 3
		heap = topdown
	}
	band = (($playlist_tracks [<index>]).band)
	track_title = (($playlist_tracks [<index>]).track_title)
	genre = (($playlist_tracks [<index>]).display_genre)
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <band>
		pos = (50.0, 0.0)
		just = [left center]
		rgba = <off_rgba>
		scale = 0.7
		heap = topdown
	}
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <track_title>
		pos = (245.0, 0.0)
		just = [left center]
		rgba = <off_rgba>
		scale = 0.7
		heap = topdown
	}
	switch <genre>
		case 0
		genre_text = "Punk"
		case 1
		genre_text = "Hip Hop"
		case 2
		genre_text = "Rock/Other"
		default
		genre_text = ""
	endswitch
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = text_a1
		text = <genre_text>
		pos = (510.0, 0.0)
		just = [center center]
		rgba = <off_rgba>
		scale = 0.7
		heap = topdown
	}
	if TrackEnabled <index>
		alpha = 1
	else
		alpha = 0
	endif
	checkboxpos = (700.0, -4.0)
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = checkmark
		pos = <checkboxpos>
		alpha = <alpha>
		just = [left center]
		rgba = <off_rgba>
		z_priority = 5
		heap = topdown
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = checkbox
		pos = (<checkboxpos> + (0.0, 5.0))
		just = [left center]
		scale = 0.5
		rgba = <off_rgba>
		z_priority = 4
		heap = topdown
	}
endscript

script playlist_menu_focus 
	gettags
	on_rgba = [128 123 20 255]
	doscreenelementmorph id = {<id> child = 0} alpha = 1
	index = 1
	begin
	if screenelementexists id = {<id> child = <index>}
		doscreenelementmorph {id = {<id> child = <index>} rgba = <on_rgba>}
	else
		break
	endif
	index = (<index> + 1)
	repeat 4
	playlist_vmenu :gettags
	if gotparam arrow_id
		menu_vert_blink_arrow {id = <arrow_id>}
	endif
	generic_menu_update_arrows menu_id = playlist_vmenu up_arrow_id = view_gaps_menu_up_arrow down_arrow_id = view_gaps_menu_down_arrow
endscript

script playlist_menu_unfocus 
	gettags
	off_rgba = [128 128 128 240]
	doscreenelementmorph id = {<id> child = 0} alpha = 0
	index = 1
	begin
	if screenelementexists id = {<id> child = <index>}
		doscreenelementmorph {id = {<id> child = <index>} rgba = <off_rgba>}
	else
		break
	endif
	index = (<index> + 1)
	repeat
endscript

script create_soundtrack_menu 
	make_new_themed_sub_menu title = "SOUNDTRACKS" scrolling skateshop_pos = (230.0, 100.0) dims = (300.0, 250.0) right_bracket_z = 1
	setscreenelementprops {id = sub_menu
		event_handlers = [
			{pad_back generic_menu_pad_back params = {callback = create_sound_options_menu}}
		]
	}
	theme_menu_add_item {text = "PROVING GROUND Playlist"
		pad_choose_script = SetSoundtrack
		pad_choose_params = {track = ""}
		centered
		no_bg
		first_item
	}
	numsoundtracks = 0
	if (<numsoundtracks> > 0)
		index = 0
		begin
		GetSoundtrackName <index>
		theme_menu_add_item {text = <soundtrackname>
			pad_choose_script = SetSoundtrack
			pad_choose_params = {track = <soundtrackname>}
			centered
			no_bg
			max_width = 380
		}
		<index> = (<index> + 1)
		repeat <numsoundtracks>
	endif
	theme_menu_add_item {text = "Done"
		id = menu_done
		pad_choose_script = create_sound_options_menu
		centered
		no_bg
		last_item
	}
	finish_themed_scrolling_menu force_end_pos
endscript

script SetSoundtrack 
	formattext checksumname = trackchecksum '%t' t = <track>
	printf "soundtrack = %i" i = <trackchecksum>
	generic_menu_pad_choose
	SoundtrackExists trackname = <track>
	printf "soundtrack index = %i" i = <index>
	if NOT ($current_soundtrack = <trackchecksum>)
		stopmusic
	endif
	if (<index> = -1)
		printf "use playlist"
		UseStandardSoundtrack
	else
		printf "use soundtrack"
	endif
	change current_soundtrack = <trackchecksum>
	if infrontend
		create_sound_options_menu
	else
		create_sound_options_menu from_options
	endif
endscript

script SoundtrackExists trackname = ""
	printf "trackname = %t" t = <trackname>
	formattext checksumname = tracknamesum '%t' t = <trackname>
	GetNumSoundtracks
	if NOT (<numsoundtracks> = 0)
		index = 0
		begin
		GetSoundtrackName <index>
		printf "soundtrackname = %t" t = <soundtrackname>
		formattext checksumname = soundtracksum '%s' s = <soundtrackname>
		if (<tracknamesum> = <soundtracksum>)
			return {index = <index>}
		endif
		index = (<index> + 1)
		repeat <numsoundtracks>
	endif
	return {index = -1}
endscript

script current_soundtrack_exists 
	GetNumSoundtracks
	if NOT (<numsoundtracks> = 0)
		index = 0
		begin
		GetSoundtrackName <index>
		formattext checksumname = soundtracksum '%s' s = <soundtrackname>
		if ($current_soundtrack = <soundtracksum>)
			return {index = <index>}
		endif
		index = (<index> + 1)
		repeat <numsoundtracks>
	endif
	return \{index = -1}
endscript

script ui_sound_set_game_music \{vol = 0}
endscript

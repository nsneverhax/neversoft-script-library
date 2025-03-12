whammy_matching_small_gem_dims = (56.0, 16.0)
whammy_matching_large_gem_dims = (112.0, 32.0)
whammy_matching_colors = [
	[
		75
		255
		75
		255
	]
	[
		255
		75
		75
		255
	]
	[
		255
		255
		75
		255
	]
	[
		75
		75
		255
		255
	]
	[
		255
		155
		75
		255
	]
]

script reset_whammy_matching_array 
	get_song_struct song = <song_name>
	getplayerinfo <player> part
	if (<part> = bass)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	getnumplayersingame
	if ($game_mode = career || ($game_mode = quickplay && <num_players> = 2) ||
			($game_mode = practice && (<part> = bass)))
		if structurecontains structure = <song_struct> use_coop_notetracks
			if (<part> = bass)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty>
	formattext checksumname = song '%s_%p%d_WhammyController' s = <song_prefix> p = <part> d = <difficulty_text_nl> addtostringlookup = true
	setplayerinfo <player> current_song_whammy_matching_array = <song>
endscript

script whammy_matching_hit \{count = 0}
	destroyscreenelement \{id = whammy_matching_message_element}
	formattext textname = wm_text qs(0x8cbd354e) s = <count>
	createscreenelement {
		id = whammy_matching_message_element
		parent = root_window
		type = textelement
		text = <wm_text>
		font = fontgrid_text_a1
		just = [center center]
		internal_just = [center center]
		pos = (325.0, 420.0)
		rgba = [255 192 0 255]
		z_priority = 1000
		scale = 0.5
		shadow
		shadow_offs = (3.0, 3.0)
	}
	runscriptonscreenelement \{whammy_matching_message_wait_and_die
		id = whammy_matching_message_element}
endscript

script whammy_matching_message_wait_and_die 
	se_setprops \{scale = 0.7
		time = 0.05}
	se_waitprops
	se_setprops \{scale = 0.5
		alpha = 0.1
		time = 1}
	se_waitprops
	die
endscript

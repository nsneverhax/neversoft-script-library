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
	if (($<player_status>.part) = bass)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay ||
			($game_mode = training && ($<player_status>.part = bass)))
		if StructureContains structure = <song_struct> use_coop_notetracks
			if (($<player_status>.part) = bass)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty>
	formatText checksumName = song '%s_%p%d_WhammyController' s = <song_prefix> p = <part> d = <difficulty_text_nl> AddToStringLookup
	Change structurename = <player_status> current_song_whammy_matching_array = <song>
endscript

script whammy_matching_hit \{count = 0}
	DestroyScreenElement \{id = whammy_matching_message_element}
	formatText TextName = wm_text qs(0x8cbd354e) s = <count>
	CreateScreenElement {
		id = whammy_matching_message_element
		parent = root_window
		Type = TextElement
		text = <wm_text>
		font = fontgrid_text_a11
		just = [center center]
		internal_just = [center center]
		Pos = (325.0, 420.0)
		rgba = [255 192 0 255]
		z_priority = 1000
		Scale = 0.5
		Shadow
		shadow_offs = (3.0, 3.0)
	}
	RunScriptOnScreenElement \{whammy_matching_message_wait_and_die
		id = whammy_matching_message_element}
endscript

script whammy_matching_message_wait_and_die 
	se_setprops \{Scale = 0.7
		time = 0.05}
	se_waitprops
	se_setprops \{Scale = 0.5
		alpha = 0.1
		time = 1}
	se_waitprops
	Die
endscript

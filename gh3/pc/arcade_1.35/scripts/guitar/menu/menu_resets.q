menu_resets_current_index = 0
menu_resets_total_menu_items = 0
menu_resets_element_info = [
	{
		text = "CLEAR CREDITS"
		handler = reset_waiting_credits
		Pos = (650.0, 220.0)
	}
	{
		text = "CLEAR PRICING"
		handler = reset_pricing_data
		Pos = (650.0, 265.0)
	}
	{
		text = "CLEAR EARNINGS DATA"
		handler = reset_coin_data
		Pos = (650.0, 310.0)
	}
	{
		text = "CLEAR HIGH SCORES"
		handler = reset_high_scores
		Pos = (650.0, 355.0)
	}
	{
		text = "CLEAR PLAY DATA"
		handler = reset_play_data
		Pos = (650.0, 400.0)
	}
	{
		text = "CLEAR SONG DATA"
		handler = reset_song_data
		Pos = (650.0, 445.0)
	}
	{
		text = "FACTORY RESET"
		handler = reset_everything
		Pos = (650.0, 490.0)
	}
	{
		text = "CRC CHECK"
		handler = run_crc_check
		Pos = (650.0, 580.0)
	}
]
menu_resets_root_pos = (506.0, 100.0)
menu_resets_offset = (0.0, 60.0)

script create_resets_menu 
	Change \{menu_resets_current_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = resets_container}
	displaySprite \{parent = resets_container
		tex = graphics_options_poster_part1
		Pos = (640.0, 340.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		rot_angle = 2}
	displaySprite \{parent = resets_container
		tex = Tape_V_01
		Pos = (1070.0, 280.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaySprite \{parent = resets_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (1067.0, 283.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaySprite \{parent = resets_container
		tex = tape_H_02
		Pos = (190.0, 525.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = resets_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (187.0, 528.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	text_resets_desc_root_loc = (650.0, 90.0)
	displayText parent = resets_container text = "UTILITIES" Pos = <text_resets_desc_root_loc> Scale = 1 just = [center center] rgba = [250 250 250 255] font = text_a11_Large z = 10 rot_angle = 6
	text_resets_message_root_loc = (650.0, 640.0)
	displayText parent = resets_container id = resets_message_text text = "complete" Pos = <text_resets_message_root_loc> Scale = 1.3 just = [center center] rgba = [250 250 250 255] font = text_a5 z = 10
	resets_message_text :DoMorph \{alpha = 0
		time = 0}
	GetArraySize \{$menu_resets_element_info}
	Change menu_resets_total_menu_items = <array_Size>
	set_focus_color \{rgba = [
			230
			171
			60
			255
		]}
	set_unfocus_color \{rgba = [
			255
			255
			255
			255
		]}
	text_params = {parent = resets_container
		Type = TextElement
		font = text_a5
		rgba = ($menu_unfocus_color)
		Scale = 1.0
		z_priority = 10
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (-1.5, 1.5)
	}
	index = 0
	cur_menu_pos = <menu_resets_root_pos>
	begin
	formatText checksumName = reset_text_name 'resets_text_%i' i = <index>
	CreateScreenElement {
		<text_params>
		id = <reset_text_name>
		text = ($menu_resets_element_info [<index>].text)
		Pos = ($menu_resets_element_info [<index>].Pos)
		Scale = 1
		Enabled = 1
		event_handlers = [
			{focus resets_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ($menu_resets_element_info [<index>].handler)}
			{pad_up resets_change_index params = {move = up}}
			{pad_down resets_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<cur_menu_pos> = (<cur_menu_pos> + <menu_resets_offset>)
	<index> = (<index> + 1)
	repeat $menu_resets_total_menu_items
	LaunchEvent \{Type = focus
		target = resets_text_0}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_resets_menu 
	KillSpawnedScript \{Name = resets_show_message}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = resets_container}
	destroy_menu \{menu_id = resets_scroll}
endscript

script resets_change_index \{move = up}
	formatText checksumName = last_text_id 'resets_text_%d' d = ($menu_resets_current_index)
	if (<move> = up)
		if ($menu_resets_current_index = 0)
			Change menu_resets_current_index = ($menu_resets_total_menu_items - 1)
		else
			Change menu_resets_current_index = ($menu_resets_current_index - 1)
		endif
	else
		if ($menu_resets_current_index = ($menu_resets_total_menu_items - 1))
			Change \{menu_resets_current_index = 0}
		else
			Change menu_resets_current_index = ($menu_resets_current_index + 1)
		endif
	endif
	index = ($menu_resets_current_index)
	printf "resets_change_index: index now %d" d = <index>
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'resets_text_%d' d = <index>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script resets_menu_hilight 
	index = ($menu_resets_current_index)
	GetTags
	printf "resets_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	retail_menu_focus
endscript

script reset_coin_data \{display_message = 1
		save = 1}
	GetGlobalTags \{arcade_audits}
	<arcade_total_coins> = 0
	<arcade_num_bills> = 0
	<arcade_total_credits> = 0
	<arcade_service_credits> = 0
	<arcade_total_bonus_credits> = 0
	SetGlobalTags arcade_audits params = {
		arcade_total_coins = <arcade_total_coins>
		arcade_num_bills = <arcade_num_bills>
		arcade_total_credits = <arcade_total_credits>
		arcade_service_credits = <arcade_service_credits>
		arcade_total_bonus_credits = <arcade_total_bonus_credits>
	}
	if (<save> = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "COIN DATA RESET"
			}}
	endif
endscript

script reset_play_data \{display_message = 1
		save = 1}
	setup_init_arcade_song_audits
	if (<save> = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "PLAY DATA RESET"
			}}
	endif
endscript

script reset_song_data \{display_message = 1
		save = 1}
	setup_setlisttags \{SetList_Songs = GH3_General_Songs
		Force = 1}
	GlobalTags_UnlockAll \{SongList = GH3_General_Songs}
	if ($family_mode_enabled = 1 || $family_mode_enabled = 3)
		GetArraySize ($disney_restricted_songs)
		i = 0
		begin
		Progression_RestrictSong tier_global = GH3_General_Songs song = ($disney_restricted_songs [<i>]) restricted = 1
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if ($family_mode_enabled = 2 || $family_mode_enabled = 3)
		GetArraySize ($chuck_restricted_songs)
		i = 0
		begin
		Progression_RestrictSong tier_global = GH3_General_Songs song = ($chuck_restricted_songs [<i>]) restricted = 1
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	setup_arcade_audit_tags
	if (<save> = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "SONG DATA RESET"
			}}
	endif
endscript

script reset_high_scores \{display_message = 1
		save = 1}
	printf \{"reset_high_scores: start"}
	GetArraySize \{$difficulty_list}
	num_difficulty = <array_Size>
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	formatText checksumName = default_topscores 'default_topscores_%d' d = <difficulty_text_nl>
	formatText checksumName = default_songtagswithdifficulty_diff 'default_songtagswithdifficulty_%d' d = <difficulty_text_nl>
	get_songlist_size
	song_array_size = <array_Size>
	song_count = 0
	begin
	get_songlist_checksum index = <song_count>
	get_song_prefix song = <song_checksum>
	formatText checksumName = songname '%s_%d' s = (<song_prefix>) d = <difficulty_text_nl> AddToStringLookup = true
	get_song_struct song = <song_checksum>
	if (<song_struct>.version = gh3)
		printf "reset_high_scores: resetting song %s" s = (<song_struct>.title)
		if GetGlobalTags <songname> noassert = 1
			get_song_title song = <song_checksum>
			SetGlobalTags <songname> params = {(<default_songtagswithdifficulty_diff>) (<default_topscores>)}
			printf \{"reset_high_scores: reset 1"}
		endif
		if GetGlobalTags <song_checksum> noassert = 1
			SetGlobalTags <song_checksum> params = {($default_songtags)}
			printf \{"reset_high_scores: reset 2"}
		endif
	endif
	song_count = (<song_count> + 1)
	repeat <song_array_size>
	<array_count> = (<array_count> + 1)
	repeat <num_difficulty>
	if (<save> = 1)
		printf \{"reset_high_scores: saving"}
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "HIGH SCORES RESET"
			}}
	endif
	printf \{"reset_high_scores: done"}
endscript

script reset_waiting_credits \{display_message = 1
		save = 1}
	clear_waiting_credits
	if (<save> = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "CREDITS RESET"
			}}
	endif
endscript

script reset_pricing_data \{display_message = 1
		save = 1}
	setup_arcade_adjustments_tags
	if (<save> = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "PRICING RESET"
			}}
	endif
endscript

script run_crc_check \{display_message = 1
		save = 1}
	setup_arcade_crc_tags
	if (<save> = 1)
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	if (<display_message> = 1)
		SoundEvent \{event = Box_Check_SFX}
		SpawnScriptNow \{resets_show_message
			params = {
				message = "POWER CYCLE FOR CRC CHECK"
			}}
	endif
endscript

script reset_everything 
	clear_waiting_credits \{save = 0}
	setup_arcade_hardware_tags
	reset_coin_data \{display_message = 0
		save = 0}
	reset_play_data \{display_message = 0
		save = 0}
	reset_song_data \{display_message = 0
		save = 0}
	reset_high_scores \{display_message = 0
		save = 0}
	reset_pricing_data \{display_message = 0
		save = 0}
	GetGlobalTags \{user_options}
	SetGlobalTags \{user_options
		params = {
			lag_calibration = 0.0
		}}
	Change winport_song_skew = ($winport_song_skew_default)
	WinPortSetSongSkew value = ($winport_song_skew)
	GetGlobalTags \{arcade_hardware_adjustments}
	Change lamp_brightness_level = <arcade_lamp_brightness_level>
	Change no_fail_mode = <arcade_no_fail>
	Change structurename = player1_status star_tilt_threshold_di = <arcade_tilt_p1>
	Change structurename = player2_status star_tilt_threshold_di = <arcade_tilt_p2>
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	SoundEvent \{event = GH_SFX_BattleMode_WhammyAttack_P1}
	SpawnScriptNow \{resets_show_message
		params = {
			message = "EVERYTHING RESET"
		}}
endscript

script resets_show_message 
	printf "resets_show_message: setting message = %s" s = <message>
	resets_message_text :SetProps text = <message>
	resets_message_text :DoMorph \{alpha = 1
		time = 0.2}
	resets_message_text :DoMorph \{alpha = 0
		time = 1}
	printf \{"resets_show_message: done"}
endscript

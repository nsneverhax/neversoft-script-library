
script ui_create_leaderboard_list 
	if ($current_leaderboard_group = song)
		make_generic_menu {
			title = qs(0xa1ae7e56)
			exclusive_device = ($primary_controller)
			scrolling
		}
		get_songlist_size
		add_menu_script = add_generic_menu_text_item
	else
		GetArraySize ($current_leaderboard_array)
		make_menu_frontend {
			screen = GUITARIST
			title = qs(0xa1ae7e56)
			exclusive_device = ($primary_controller)
		}
		add_menu_script = add_menu_frontend_item
	endif
	array_entry = 0
	begin
	<use_song> = 0
	switch ($current_leaderboard_group)
		case song
		get_songlist_checksum index = <array_entry>
		get_song_struct song = <song_checksum>
		get_song_version song = <song_checksum>
		<text> = (<song_struct>.title)
		if (<song_struct>.leaderboard = 1)
			<use_song> = 1
		endif
		if (<song_version> = ($current_song_version))
			pad_choose_params = {song_checksum = <song_checksum> index = <array_entry>}
		endif
		default
		<text> = (($current_leaderboard_array) [<array_entry>].title)
		pad_choose_params = {leaderboard_id = (($current_leaderboard_array) [<array_entry>].leaderboard_id)}
		<use_song> = 1
	endswitch
	if (<use_song> = 1)
		<add_menu_script> {
			text = <text>
			pad_choose_script = ui_leaderboard_list_select
			pad_choose_params = <pad_choose_params>
		}
		<array_entry> = (<array_entry> + 1)
	endif
	repeat <array_Size>
	if 0x8658e568
		destroy_loading_screen
	endif
	menu_finish
endscript

script ui_destroy_leaderboard_list 
	create_loading_screen
	generic_ui_destroy
endscript

script ui_leaderboard_list_select 
	if ($current_leaderboard_group = song)
		Change song_checksum = <song_checksum>
		get_song_prefix song = ($song_checksum)
		switch ($current_leaderboard_instrument)
			case guitar
			instrument = 'guitar'
			case backup
			instrument = 'backup'
			case drums
			instrument = 'drums'
			case mic
			instrument = 'mic'
			case Band
			instrument = 'band'
		endswitch
		formatText checksumName = leaderboard_id '%s_%i' s = <song_prefix> i = <instrument> AddToStringLookup = true
		Change current_leaderboard_id = <leaderboard_id>
	else
		Change song_checksum = <leaderboard_id>
		Change current_leaderboard_id = <leaderboard_id>
	endif
	Change \{force_mainmenu_signin = 0}
	if isps3
		set_primary_controller device_num = <device_num> state = uistate_leaderboard_load data = {my_status = 1} require_live = 1
	else
		set_primary_controller device_num = <device_num> state = uistate_leaderboard_load data = {my_status = 1} leaderboards = 1
	endif
endscript

script ui_leaderboard_list_cash 
	if NOT 0xa9642264
		return
	endif
	create_loading_screen
	Change \{current_leaderboard_group = cash}
	Change \{current_leaderboard_instrument = guitar}
	Change \{song_checksum = lb_career_cash}
	Change \{current_leaderboard_id = lb_career_cash}
	if isXenon
		Change \{current_leaderboard_array = $master_leaderboard_cash_list}
	else
		Change \{current_leaderboard_array = $master_leaderboard_cash_list_ps3}
	endif
	Change \{force_mainmenu_signin = 0}
	if isps3
		set_primary_controller device_num = <device_num> state = uistate_leaderboard_load data = {my_status = 1} require_live = 1
	else
		set_primary_controller device_num = <device_num> state = uistate_leaderboard_load data = {my_status = 1} leaderboards = 1
	endif
endscript

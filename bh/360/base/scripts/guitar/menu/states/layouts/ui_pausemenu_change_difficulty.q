
script ui_create_pausemenu_change_difficulty 
	options = []
	pausemenu_change_difficulty_get_current_index
	diff_index = 0
	GetArraySize \{$difficulty_list}
	begin
	<text> = ($difficulty_list_props.($difficulty_list [<diff_index>]).text)
	if NOT GotParam \{player_is_expert_plus}
		if (<difficulty_index> = <diff_index>)
			<text> = (<text> + qs(0x11e243f5))
		endif
	endif
	new_option = {
		text = <text>
		func = pausemenu_change_difficulty_choose
		func_params = {difficulty = ($difficulty_list [<diff_index>])}
	}
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	<diff_index> = (<diff_index> + 1)
	repeat <array_size>
	if GotParam \{song_has_expert_plus}
		<text> = ($difficulty_list_props.($difficulty_list [(<diff_index> - 1)]).text)
		if GotParam \{player_is_expert_plus}
			<text> = (<text> + qs(0xec0fc8bf))
			<difficulty_index> = (<difficulty_index> + 1)
		else
			<text> = (<text> + qs(0xc8561069))
		endif
		new_option = {
			text = <text>
			func = pausemenu_change_difficulty_choose
			func_params = {difficulty = ($difficulty_list [(<diff_index> - 1)]) expert_plus = 1}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	if GotParam \{enable_pause}
		ui_create_pausemenu {
			title_text = qs(0x9f281c76)
			options = <options>
			pad_back_script = generic_event_back
			enable_pause = <enable_pause>
			focus_index = <difficulty_index>
		}
	else
		ui_create_pausemenu {
			title_text = qs(0x9f281c76)
			options = <options>
			pad_back_script = generic_event_back
			focus_index = <difficulty_index>
		}
	endif
endscript

script ui_destroy_pausemenu_change_difficulty 
	ui_destroy_pausemenu
endscript

script pausemenu_change_difficulty_choose 
	RemoveParameter \{base_name}
	if GotParam \{no_warning}
		generic_event_choose state = UIstate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
	else
		generic_event_choose state = UIstate_pausemenu_change_difficulty_warning data = {<...> difficulty = <difficulty>}
	endif
endscript

script pausemenu_change_difficulty_get_current_index 
	<player_selected> = 1
	<player_device> = ($last_start_pressed_device)
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> controller
		if (<controller> = <player_device>)
			<player_selected> = <player>
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	<player> = <player_selected>
	GetPlayerInfo <player> difficulty
	switch <difficulty>
		case beginner
		<difficulty_index> = 0
		case easy
		<difficulty_index> = 1
		case medium
		<difficulty_index> = 2
		case hard
		<difficulty_index> = 3
		case expert
		<difficulty_index> = 4
	endswitch
	GetPlayerInfo <player> double_kick_drum
	GetPlayerInfo <player> part
	if ($end_credits = 1)
		Progression_GetCreditsSong
		get_ui_song_struct_items song = <credits_song>
	else
		if ui_event_exists_in_stack \{name = 'debug'}
			GMan_SongTool_GetCurrentSong
		else
			<current_song> = ($current_playlist [0])
		endif
		get_ui_song_struct_items song = <current_song>
	endif
	if (<ui_struct>.song_double_kick = 1)
		if ((<part> = Drum) && (<difficulty> = expert) && (<double_kick_drum> = 1))
			return difficulty_index = <difficulty_index> player = <player> song_has_expert_plus player_is_expert_plus
		endif
		if (<part> = Drum)
			return difficulty_index = <difficulty_index> player = <player> song_has_expert_plus
		endif
	endif
	return difficulty_index = <difficulty_index> player = <player>
endscript

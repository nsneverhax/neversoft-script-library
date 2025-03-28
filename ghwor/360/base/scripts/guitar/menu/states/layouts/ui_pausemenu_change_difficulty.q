
script ui_create_pausemenu_change_difficulty \{failed_song = 0}
	<failed_song_params> = {}
	if (<failed_song> = 1)
		<failed_song_params> = {
			title_text = qs(0x5c9b76c1)
		}
	endif
	options = []
	pausemenu_change_difficulty_get_current_index
	diff_index = 0
	GetArraySize \{$difficulty_list}
	begin
	<text> = ($difficulty_list_props.($difficulty_list [<diff_index>]).text)
	if NOT GotParam \{player_is_expert_plus}
		if (<difficulty_index> = <diff_index>)
			<text> = (<text> + qs(0x2f976f1e))
			<not_focusable> = 1
		endif
	endif
	new_option = {
		text = <text>
		func = pausemenu_change_difficulty_choose
		func_params = {difficulty = ($difficulty_list [<diff_index>])}
		not_focusable = <not_focusable>
	}
	RemoveParameter \{not_focusable}
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	<diff_index> = (<diff_index> + 1)
	repeat <array_Size>
	if GotParam \{song_has_expert_plus}
		<text> = ($difficulty_list_props.($difficulty_list [(<diff_index> - 1)]).text)
		if GotParam \{player_is_expert_plus}
			<text> = (<text> + qs(0xec0fc8bf))
			<difficulty_index> = (<difficulty_index> + 1)
			<not_focusable> = 1
		else
			<text> = (<text> + qs(0xc8561069))
		endif
		new_option = {
			text = <text>
			func = pausemenu_change_difficulty_choose
			func_params = {difficulty = ($difficulty_list [(<diff_index> - 1)]) expert_plus = 1}
			not_focusable = <not_focusable>
		}
		RemoveParameter \{not_focusable}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
	endif
	<focus_index> = 0
	if (<difficulty_index> = 0)
		<focus_index> = 1
	endif
	if GotParam \{enable_pause}
		ui_create_pausemenu {
			title_text = qs(0x9f281c76)
			options = <options>
			pad_back_script = generic_event_back
			enable_pause = <enable_pause>
			focus_index = <focus_index>
			<failed_song_params>
		}
	else
		ui_create_pausemenu {
			title_text = qs(0x9f281c76)
			options = <options>
			pad_back_script = generic_event_back
			focus_index = <focus_index>
			<failed_song_params>
		}
	endif
	<difficulty_index> = ($g_pausemenu_selected_index)
	pause_menu_desc_id :SetTags difficulty_index = <difficulty_index>
endscript

script ui_destroy_pausemenu_change_difficulty 
	pause_menu_desc_id :GetSingleTag \{difficulty_index}
	ui_destroy_pausemenu
	Change g_pausemenu_selected_index = <difficulty_index>
endscript

script pausemenu_change_difficulty_choose 
	RemoveParameter \{base_name}
	if GotParam \{no_warning}
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose state = uistate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
	else
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose state = uistate_pausemenu_change_difficulty_warning data = {<...> difficulty = <difficulty>}
	endif
endscript

script pausemenu_change_difficulty_get_current_index 
	<player_selected> = 1
	<player_device> = ($last_start_pressed_device)
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> controller
		if (<controller> = <player_device>)
			<player_selected> = <Player>
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	<Player> = <player_selected>
	getplayerinfo <Player> difficulty
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
	getplayerinfo <Player> double_kick_drum
	getplayerinfo <Player> part
	get_savegame_from_controller controller = ($primary_controller)
	if ($end_credits = 1)
		progression_getcreditssong
		get_ui_song_struct_items song = <credits_song> savegame = <savegame>
	else
		playlist_getcurrentsong
		fix_song_id_suddendeath_hack song_id = <current_song>
		get_ui_song_struct_items song = <song_id> savegame = <savegame>
	endif
	if (<ui_struct>.song_double_kick = 1)
		if ((<part> = drum) && (<difficulty> = expert) && (<double_kick_drum> = 1))
			return difficulty_index = <difficulty_index> Player = <Player> song_has_expert_plus player_is_expert_plus
		endif
		if (<part> = drum)
			return difficulty_index = <difficulty_index> Player = <Player> song_has_expert_plus
		endif
	endif
	return difficulty_index = <difficulty_index> Player = <Player>
endscript

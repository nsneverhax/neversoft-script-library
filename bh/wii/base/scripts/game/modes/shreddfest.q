shreddfest_info = {
	Name = 'shreddfest'
	goal_type = game_mode
	data = {
		defeated_players = 0
		scaling = 1
		require_missed_notes_in_a_row = 1
		results_screen_goal_data = {
			column_title = qs(0xa097642c)
			data_source = player_goal_data
			var_name = notes_missed
			ranking_method = lowest_to_highest
		}
	}
	player_data = {
		notes_missed = 0
		safe = 0
	}
	constants = {
		allowed_misses = 3
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'venue_handler'
					Type = venue
					venue_name = load_z_cairo
				}
				{
					Name = 'pause'
					Type = Pause
					settings = {
						default_options = {
							resume
							restart
							quit
						}
						custom_options = [
						]
					}
				}
				{
					Name = 'listener'
					Type = event_listener
					callback_mode = any
					events = [
						missed_notep1
						missed_notep2
						missed_notep3
						missed_notep4
					]
				}
				{
					Name = 'streak_watcher'
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = current_run
							Type = int
						}
					]
				}
				{
					Name = 'win_timer'
					Type = Timer
					start_time = 5
					end_time = 0
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					timer_style = example_style_1
					attach_hud_to_player = 0
				}
			]
		}
	]
}

script shreddfest_post_activate 
	printf \{'Shreddfest::Post_Activate'
		channel = shreddfest}
	gman_setdata \{goal = shreddfest
		params = {
			defeated_players = 0
		}}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_setdata goal = shreddfest Player = <Player> params = {notes_missed = 0}
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script shreddfest_main_enter 
	printf \{'Shreddfest::Main_Enter'
		channel = shreddfest}
	active_controllers = [0 0 0 0]
	GetActiveControllers
	SpawnScriptNow \{shreddfest_startsong_watcher}
endscript

script shreddfest_create_difficulty_indicators 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		formatText checksumName = element_id 'p%p_difficulty' p = <Player>
		formatText checksumName = parent_id 'gem_containerp%p' p = <Player>
		CreateScreenElement {
			Type = TextElement
			id = <element_id>
			parent = <parent_id>
			rgba = [255 255 255 255]
			font = fontgrid_text_a1
			Pos = (512.0, 660.0)
			text = qs(0x84359337)
			just = [left top]
			Scale = (0.5, 0.5)
			z_priority = 31
		}
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script shreddfest_startsong_watcher 
	begin
	GetSongTime
	if (<songtime> < 0)
		break
	endif
	Wait \{5
		gameframe}
	repeat
	begin
	GetSongTime
	if (<songtime> >= -1)
		break
	endif
	Wait \{5
		gameframe}
	repeat
	shreddfest_create_difficulty_indicators
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> difficulty
		get_difficulty_text difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		formatText checksumName = difficulty_indicator 'p%p_difficulty' p = <Player>
		SetScreenElementProps id = <difficulty_indicator> text = <difficulty_text>
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script shreddfest_main_streak_watcher_varupdated 
	Mod a = <current_value> b = (20)
	if ((<Mod> = 0) && (<current_value> > 0))
		printf channel = shreddfest 'current run for player %p = %s' s = <current_value> p = <Player>
		SpawnScriptNow shreddfest_adjust_difficulty params = {Player = <Player> adjustment = up}
	endif
	if gman_getdata \{goal = shreddfest
			Name = require_missed_notes_in_a_row}
		if (<current_value> = 1)
			gman_setdata goal = shreddfest Player = <Player> params = {notes_missed = 0}
		endif
	endif
endscript

script shreddfest_main_listener_gotevent 
	getnumplayersingame
	gman_getdata \{goal = shreddfest
		Name = defeated_players}
	if (<defeated_players> >= (<num_players> - 1))
		return
	endif
	<Player> = (<event_data>.Player)
	gman_getdata goal = shreddfest Player = <Player> Name = notes_missed
	if gman_getdata \{goal = shreddfest
			Name = scaling}
		gman_getdata goal = shreddfest Player = <Player> Name = safe
		if (<safe> = 1)
			return
		endif
	endif
	<notes_missed> = (<notes_missed> + 1)
	gman_setdata goal = shreddfest Player = <Player> params = {notes_missed = <notes_missed>}
	if gman_getdata \{goal = shreddfest
			Name = debug_no_fail}
		return
	endif
	gman_getconstant \{goal = shreddfest
		Name = allowed_misses}
	if (<notes_missed> >= <allowed_misses>)
		SpawnScriptNow shreddfest_elimination_criteria_met params = {<...>}
	endif
endscript

script shreddfest_elimination_criteria_met 
	if gman_getdata \{goal = shreddfest
			Name = scaling}
		getplayerinfo <Player> difficulty
		if (<difficulty> = beginner)
			printf \{channel = shreddfest
				qs(0xc09de50c)}
		else
			SpawnScriptNow shreddfest_make_player_safe params = {Player = <Player>}
			SpawnScriptNow shreddfest_adjust_difficulty params = {Player = <Player> adjustment = down}
			gman_setdata goal = shreddfest Player = <Player> params = {notes_missed = 0}
			printf channel = shreddfest qs(0x9155cee0) d = <difficulty>
		endif
	elseif gman_getdata \{goal = shreddfest
			Name = escalating}
		getplayerinfo <Player> difficulty
		if (<difficulty> = expert)
			printf \{channel = shreddfest
				qs(0xe8cacf39)}
		else
			SpawnScriptNow shreddfest_adjust_difficulty params = {Player = <Player> adjustment = up}
			gman_setdata goal = shreddfest Player = <Player> params = {notes_missed = 0}
			printf channel = shreddfest qs(0x9155cee0) d = <difficulty>
		endif
	else
		shreddfest_destroy_player Player = <Player>
	endif
endscript

script shreddfest_make_player_safe 
	gman_setdata goal = shreddfest Player = <Player> params = {safe = 1}
	Wait \{3
		Seconds}
	gman_setdata goal = shreddfest Player = <Player> params = {safe = 0}
endscript

script shreddfest_adjust_difficulty 
	getplayerinfo <Player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	printf channel = shreddfest qs(0x9d146790) p = <Player> s = <difficulty_text>
	switch <adjustment>
		case up
		switch <difficulty>
			case beginner
			setplayerinfo <Player> difficulty = easy
			case easy
			setplayerinfo <Player> difficulty = medium
			case medium
			setplayerinfo <Player> difficulty = hard
			case hard
			setplayerinfo <Player> difficulty = expert
		endswitch
		case down
		switch <difficulty>
			case easy
			setplayerinfo <Player> difficulty = beginner
			case medium
			setplayerinfo <Player> difficulty = easy
			case hard
			setplayerinfo <Player> difficulty = medium
			case expert
			setplayerinfo <Player> difficulty = hard
		endswitch
		case beginner
		setplayerinfo <Player> difficulty = beginner
		case easy
		setplayerinfo <Player> difficulty = easy
		case medium
		setplayerinfo <Player> difficulty = medium
		case hard
		setplayerinfo <Player> difficulty = hard
		case expert
		setplayerinfo <Player> difficulty = expert
	endswitch
	getplayerinfo <Player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	printf channel = shreddfest qs(0x8d18eb01) p = <Player> s = <difficulty_text>
	formatText checksumName = difficulty_indicator 'p%p_difficulty' p = <Player>
	SetScreenElementProps id = <difficulty_indicator> text = <difficulty_text>
endscript

script shreddfest_show_note_miss 
	if (<notes_missed> < 6)
		new_text = qs(0x47fef028)
		begin
		formatText TextName = new_text '%aX' a = <new_text>
		repeat <notes_missed>
		hud_create_message Player = <Player> text = <new_text> Priority = <notes_missed>
	endif
endscript

script shreddfest_destroy_player 
	gman_getdata \{goal = shreddfest
		Name = defeated_players}
	<defeated_players> = (<defeated_players> + 1)
	gman_setdata goal = shreddfest params = {defeated_players = <defeated_players>}
	getnumplayersingame
	if (<defeated_players> = (<num_players> - 1))
		gman_timerfunc \{goal = shreddfest
			tool = win_timer
			func = start}
		gman_getdata \{goal = shreddfest
			Name = player_notes_missed}
		winner_id = 0
		cur_id = 1
		lowest_notes_missed = 50
		begin
		gman_getdata goal = shreddfest Player = <cur_id> Name = notes_missed
		if ((<notes_missed>) < (<lowest_notes_missed>))
			<lowest_notes_missed> = <notes_missed>
			<winner_id> = <cur_id>
		endif
		<cur_id> = (<cur_id> + 1)
		repeat (<num_players> - 1)
		SpawnScriptNow shreddfest_win_timer params = {winner = (<winner_id>)}
		gman_timerfunc goal = shreddfest tool = win_timer func = attach_timer_to_player params = {Player = (<winner_id>)}
		gman_timerfunc \{goal = shreddfest
			tool = win_timer
			func = show}
	elseif (<defeated_players> = (<num_players>))
		printf \{'Last player failed before timer, end song, he still won'
			channel = shreddfest}
		gman_passcheckpoint \{goal = shreddfest}
	endif
	gman_disable_highway Player = <Player>
	SpawnScriptNow shreddfest_eliminate_warning params = {Player = <Player>}
endscript

script shreddfest_eliminate_warning \{Player = 1}
	gman_getdata \{goal = shreddfest
		Name = defeated_players}
	getnumplayersingame
	if (<defeated_players> = (<num_players>))
		return
	endif
	formatText checksumName = miss_msg 'shredd_miss_%p' p = <Player>
	if ScreenElementExists id = <miss_msg>
		DestroyScreenElement id = <miss_msg>
	endif
	hud_create_message Player = <Player> text = qs(0x90d59c88) Priority = 1 post_on_highway
endscript

script shreddfest_main_win_timer_expire 
	gman_passcheckpoint \{goal = shreddfest}
endscript

script shreddfest_win_timer 
	hud_create_message Player = <winner> text = qs(0x61add21b) Priority = 1 post_on_highway
endscript

script shreddfest_main_pass 
	if ($is_network_game)
		if IsHost
			SpawnScriptNow \{online_end_song}
		endif
	else
		gman_songtool_songwon
	endif
endscript

script shreddfest_main_exit 
	printf \{'Shreddfest::Main_Exit'
		channel = shreddfest}
	roadie_battle_deinit
	KillSpawnedScript \{Name = shreddfest_startsong_watcher}
endscript

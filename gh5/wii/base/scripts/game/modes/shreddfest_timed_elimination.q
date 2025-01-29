shreddfest_timed_elimination_info = {
	Name = 'shreddfest_timed_elimination'
	goal_type = game_mode
	data = {
		current_section = 0
		defeated_players = 0
		eliminated_players = [
		]
		elimination_interval_type = section
		elimination_interval = 2
		results_screen_goal_data = {
			column_title = qs(0x302c47e0)
			data_source = player_info_data
			var_name = score
			ranking_method = highest_to_lowest
		}
	}
	player_data = {
		alive = 1
		lives = 5
		notes_missed = 0
		safe = 0
	}
	constants = {
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
					Name = 'elimination_timer'
					Type = Timer
					start_time = 30
					end_time = 0
					timer_style = example_style_1
					dont_expire_checkpoint
					dont_start_on_enter
					dont_show_on_enter
					attach_hud_to_player = 0
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

script shreddfest_timed_elimination_post_activate 
	printf \{'shreddfest_timed_elimination::Post_Activate'
		channel = shreddfest}
	gman_setdata \{goal = shreddfest_timed_elimination
		params = {
			defeated_players = 0
			eliminated_players = [
			]
		}}
endscript

script shreddfest_timed_elimination_main_enter 
	printf \{'shreddfest_timed_elimination::Main_Enter'
		channel = shreddfest}
	SpawnScriptNow \{shreddfest_timed_elimination_startsong_watcher}
endscript

script shreddfest_timed_elimination_startsong_watcher 
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
	shreddfest_time_elimation_start_timers
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> difficulty
		get_difficulty_text difficulty = <difficulty>
		difficulty_text = <difficulty_text_nl>
		hud_create_message Player = <Player> text = <difficulty_text> Priority = 1 post_on_highway
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script shreddfest_time_elimation_start_timers 
	printf \{channel = shreddfest
		'entering shreddfest_time_elimation_start_timers...'}
	gman_getdata \{goal = shreddfest_timed_elimination
		Name = elimination_interval_type}
	gman_timerfunc \{goal = shreddfest_timed_elimination
		tool = elimination_timer
		func = attach_timer_to_player
		params = {
			Player = 0
		}}
	shreddfest_time_elimation_reset_timer
	gman_timerfunc \{goal = shreddfest_timed_elimination
		tool = elimination_timer
		func = reset}
	gman_timerfunc \{goal = shreddfest_timed_elimination
		tool = elimination_timer
		func = start}
	gman_timerfunc \{goal = shreddfest_timed_elimination
		tool = elimination_timer
		func = show}
endscript

script shreddfest_time_elimation_reset_timer 
	gman_getdata \{goal = shreddfest_timed_elimination
		Name = elimination_interval_type}
	gman_getdata \{goal = shreddfest_timed_elimination
		Name = current_section}
	switch <elimination_interval_type>
		case timed
		printf \{channel = shreddfest
			'timed mode'}
		gman_getdata \{goal = shreddfest_timed_elimination
			Name = elimination_interval}
		<new_time> = (<elimination_interval>)
		case section
		printf \{channel = shreddfest
			'section mode'}
		gman_getdata \{goal = shreddfest_timed_elimination
			Name = elimination_interval}
		GetSongTimeMs
		CastToInteger \{time}
		GetArraySize \{$current_section_array}
		if ((<current_section> + <elimination_interval>) < <array_Size>)
			<new_time> = ((($current_section_array [(<current_section> + <elimination_interval>)].time) - (<time>)) / 1000)
		else
			gman_songtool_getcurrentsong
			songfilemanager func = get_song_end_time song_name = <current_song>
			<new_time> = (((<total_end_time>) - (<time>)) / 1000)
		endif
		<current_section> = (<current_section> + <elimination_interval>)
		gman_setdata goal = shreddfest_timed_elimination params = {current_section = <current_section>}
	endswitch
	if (<new_time> < 0)
		<new_time> = 30
	endif
	gman_timerfunc goal = shreddfest_timed_elimination tool = elimination_timer func = set_start_time params = {time = (<new_time>)}
endscript

script shreddfest_timed_elimination_main_elimination_timer_expire 
	<worst_score> = 999999999
	<eliminated> = 0
	gman_getdata \{goal = shreddfest_timed_elimination
		Name = eliminated_players}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT ArrayContains array = <eliminated_players> contains = <Player>
			getplayerinfo <Player> score
			if (<score> = <worst_score>)
				<eliminated> = 0
			elseif (<score> < <worst_score>)
				<worst_score> = <score>
				<eliminated> = <Player>
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	shreddfest_timed_elimination_destroy_player eliminated_player = <eliminated>
	shreddfest_time_elimation_start_timers
endscript

script shreddfest_timed_elimination_destroy_player 
	if NOT (<eliminated_player> = 0)
		gman_getdata \{goal = shreddfest_timed_elimination}
		<defeated_players> = (<defeated_players> + 1)
		<eliminated_players_new> = (<eliminated_players> + (<eliminated_player>))
		gman_setdata goal = shreddfest_timed_elimination params = {defeated_players = <defeated_players> eliminated_players = <eliminated_players_new>}
		getnumplayersingame
		if (<defeated_players> = (<num_players> - 1))
			gman_timerfunc \{goal = shreddfest_timed_elimination
				tool = win_timer
				func = start}
			<top_score> = 0
			<winner> = 0
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> score
				if (<score> > <top_score>)
					<top_score> = <score>
					<winner> = <Player>
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
			endif
			SpawnScriptNow shreddfest_timed_elimination_win_timer params = {winner = <winner>}
			gman_timerfunc goal = shreddfest_timed_elimination tool = win_timer func = attach_timer_to_player params = {Player = <winner>}
			gman_timerfunc \{goal = shreddfest_timed_elimination
				tool = win_timer
				func = show}
		elseif (<defeated_players> = <num_players>)
			printf \{'Last player failed before timer, end song, he still won'
				channel = shreddfest}
			gman_passcheckpoint \{goal = shreddfest_timed_elimination}
		endif
		SpawnScriptNow shreddfest_timed_elimination_eliminate_player params = {Player = <eliminated_player>}
		SpawnScriptNow shreddfest_timed_elimination_eliminate_warning params = {Player = <eliminated_player>}
	endif
endscript

script shreddfest_timed_elimination_eliminate_player 
	setplayerinfo <Player> interactive = 0
	getplayerinfo <Player> part
	if (<part> = vocals)
		vocals_hide_player Player = <Player>
	else
		get_highway_hud_root_id Player = <Player>
		SetScreenElementProps id = <highway_hud_root> skull_alpha = 1.0
		formatText checksumName = Name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <Name>
			safe_hide id = <Name>
		endif
		formatText checksumName = Name 'gem_containerp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <Name>
			safe_hide id = <Name>
		endif
		formatText checksumName = Name 'Gem_basebarp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <Name>
			safe_hide id = <Name>
		endif
	endif
endscript

script shreddfest_timed_elimination_revive_player 
	gman_getdata \{goal = shreddfest_timed_elimination}
	<defeated_players> = (<defeated_players> + 1)
	RemoveArrayElement {
		array = <eliminated_players>
		element = (<Player>)
	}
	gman_setdata goal = shreddfest_timed_elimination params = {defeated_players = <defeated_players> eliminated_players = <array>}
	setplayerinfo <Player> interactive = 1
	if (<part> = vocals)
		vocals_unhide_player Player = <Player>
	else
		get_highway_hud_root_id Player = <Player>
		SetScreenElementProps id = <highway_hud_root> skull_alpha = 0.0
		formatText checksumName = Name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <Name>
			safe_show id = <Name>
		endif
		formatText checksumName = Name 'gem_containerp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <Name>
			safe_show id = <Name>
		endif
		formatText checksumName = Name 'Gem_basebarp%p' p = <Player> AddToStringLookup = true
		if ScreenElementExists id = <Name>
			safe_show id = <Name>
		endif
	endif
endscript

script shreddfest_timed_elimination_eliminate_warning \{Player = 1}
	getnumplayersingame
	gman_getdata \{goal = shreddfest_timed_elimination
		Name = defeated_players}
	if (<defeated_players> = <num_players>)
		return
	endif
	formatText checksumName = miss_msg 'shredd_miss_%p' p = <Player>
	if ScreenElementExists id = <miss_msg>
		DestroyScreenElement id = <miss_msg>
	endif
	hud_create_message Player = <Player> text = qs(0x90d59c88) Priority = 1 post_on_highway
endscript

script shreddfest_timed_elimination_main_win_timer_expire 
	gman_passcheckpoint \{goal = shreddfest_timed_elimination}
endscript

script shreddfest_timed_elimination_win_timer 
	hud_create_message Player = <winner> text = qs(0x61add21b) Priority = 1 post_on_highway
endscript

script shreddfest_timed_elimination_main_pass 
	if ($is_network_game)
		if IsHost
			SpawnScriptNow \{online_end_song}
		endif
	else
		gman_songtool_songwon
	endif
endscript

script shreddfest_timed_elimination_main_exit 
	printf \{'shreddfest_timed_elimination::Main_Exit'
		channel = shreddfest}
	KillSpawnedScript \{Name = shreddfest_timed_elimination_startsong_watcher}
endscript

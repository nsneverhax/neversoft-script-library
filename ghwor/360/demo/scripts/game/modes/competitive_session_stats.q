session_points_1st = 5
session_points_2nd = 3
session_points_3rd = 1
session_points_default = 0

script session_stats_reset 
	getbandsstatus
	getarraysize <bands>
	i = 1
	begin
	setbandinfo <i> session_points = 0
	setbandinfo <i> session_points_earned_last_song = 0
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script session_stats_update_scores 
	requireparams \{[
			order
			size
		]
		all}
	last_score = -1
	current_rank = 1
	i = 0
	begin
	point_award = ($session_points_default)
	current_band = (<order> [<i>].band_num)
	score = (<order> [<i>].band_result)
	if (<last_score> != -1 && <score> = <last_score>)
		<current_rank> = (<current_rank> - 1)
	endif
	if (<current_rank> = 1)
		if teammodeequals \{team_mode = two_teams}
			point_award = 1
		else
			point_award = ($session_points_1st)
		endif
	elseif (<current_rank> = 2)
		if teammodeequals \{team_mode = two_teams}
			point_award = 0
		else
			point_award = ($session_points_2nd)
		endif
	elseif (<current_rank> = 3)
		point_award = ($session_points_3rd)
	endif
	<current_rank> = (<current_rank> + 1)
	last_score = <score>
	getbandinfo <current_band> session_points
	<session_points> = (<session_points> + <point_award>)
	setbandinfo <current_band> session_points = <session_points>
	setbandinfo <current_band> session_points_earned_last_song = <point_award>
	i = (<i> + 1)
	repeat <size>
endscript

script session_stats_get_player_stats 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> band
	getbandinfo <band> session_points
	getbandinfo <band> session_points_earned_last_song
	return player_session_points = <session_points> earned_last_song = <session_points_earned_last_song>
endscript

script print_session_stats \{channel = 0x00000000}
	printf '**************************************************' channel = <channel>
	printf 'Competitive Session Stats:' channel = <channel>
	getnumplayersingame
	getfirstplayer
	if (<num_players> < 1 || <num_players> > 8)
		printf 'ABORTING: Num players is whack, its %a' a = <num_players> channel = <channel>
		printf '**************************************************' channel = <channel>
		return
	endif
	begin
	getplayerinfo <player> band
	getbandinfo <band> session_points
	getbandinfo <band> session_points_earned_last_song
	printf 'P %a (Band %b): %c (+%d)' a = <player> b = <band> c = <session_points> d = <session_points_earned_last_song> channel = <channel>
	getnextplayer player = <player>
	repeat <num_players>
	printf '**************************************************' channel = <channel>
endscript

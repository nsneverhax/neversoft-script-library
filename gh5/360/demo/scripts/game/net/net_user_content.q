net_user_content_leaderboards = [
	{
		checksum = user_content_best_songs
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
	}
	{
		checksum = user_content_title_az
		rating_func = code_alphanumeric_rate
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
	}
	{
		checksum = user_content_best_weekly
		rating_func = net_user_content_best_weekly_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
	}
	{
		checksum = user_content_fast_movers
		rating_func = code_fast_movers_rate
		active = 1
		always_update = 0
		download_rerate = 1
		delta = 0
		genre = 0
	}
	{
		checksum = user_content_recently_added
		rating_func = code_recent_update_rate
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
	}
	{
		checksum = user_content_showcase
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
		do_not_write
	}
	{
		checksum = user_content_file_id
		rating_func = code_file_id_rate
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
	}
	{
		checksum = user_content_alternative
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_pop
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_experimental
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_hip_hop
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_rock
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_metal
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_electronic
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_other
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 1
	}
	{
		checksum = user_content_ghost
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
		do_not_remove
	}
	{
		checksum = user_content_banned_content
		rating_func = net_user_content_standard_rate_function
		active = 1
		always_update = 0
		download_rerate = 0
		delta = $net_user_content_rating_delta
		genre = 0
		do_not_write
		do_not_remove
	}
]
is_user_content_top_artists_active = 0
net_user_content_ratings_average = 5
net_user_content_weighting_factor = 1
net_user_content_stars_to_rating_conversion = 100000
net_user_content_rating_delta = 10000
net_user_content_default_leaderboard = user_content_best_songs
net_user_content_fast_movers_days = 5
ghtunes_killswitch = 0
net_user_content_top_artist_board = user_content_top_artists
net_user_content_by_artist_board = user_content_by_artist
net_user_content_showcase_board = user_content_showcase
net_user_content_banned_users_board = user_content_banned_users
net_user_content_uid_to_gamertag_board = user_content_uid_to_gamertag
net_user_content_genre_lookup_struct = {
	alternative = 'alternative'
	pop = 'pop'
	experimental = 'experimental'
	hip_hop = 'hip_hop'
	rock = 'rock'
	metal = 'metal'
	electronic = 'electronic'
	other = 'other'
}
net_user_content_super_user_list = [
	[
		590292
		491675273
	]
	[
		590292
		491944986
	]
	[
		590292
		491946307
	]
]

script is_super_user 
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> user_options param = unlock_cheat_superuser
	if NOT gotparam \{unlock_cheat_superuser}
		return \{false}
	endif
	if (<unlock_cheat_superuser> = 1)
		netsessionfunc func = get_user_id params = {controller_index = <controller>}
		getarraysize ($net_user_content_super_user_list)
		index = 0
		begin
		curr_user_id = ($net_user_content_super_user_list [<index>])
		if (<curr_user_id> [0] = <user_id> [0] && <curr_user_id> [1] = <user_id> [1])
			printf \{channel = jam_mode
				qs(0xd6e13a78)}
			return \{true}
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script net_user_content_get_write_leaderboards 
	requireparams \{[
			genre
		]
		all}
	array = []
	getarraysize \{$net_user_content_leaderboards}
	genre_board_name = nullchecksum
	formattext checksumname = genre_board_name 'user_content_%d' d = ($net_user_content_genre_lookup_struct.<genre>)
	got_genre = 0
	i = 0
	begin
	if NOT structurecontains structure = ($net_user_content_leaderboards [<i>]) do_not_write
		if (<download_rerate> = 0)
			if ($net_user_content_leaderboards [<i>].genre = 0)
				if (<remove_list> = 1)
					if NOT structurecontains structure = ($net_user_content_leaderboards [<i>]) do_not_remove
						addarrayelement array = <array> element = ($net_user_content_leaderboards [<i>])
					endif
				else
					addarrayelement array = <array> element = ($net_user_content_leaderboards [<i>])
				endif
			else
				if checksumequals a = <genre_board_name> b = ($net_user_content_leaderboards [<i>].checksum)
					addarrayelement array = <array> element = ($net_user_content_leaderboards [<i>])
					got_genre = 1
				endif
			endif
		else
			if ($net_user_content_leaderboards [<i>].download_rerate = 1)
				addarrayelement array = <array> element = ($net_user_content_leaderboards [<i>])
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<got_genre> = 1)
		printf \{qs(0xc8ad4543)}
	endif
	return leaderboard_array = <array>
endscript

script net_user_content_standard_rate_function 
	requireparams \{[
			vote0
			vote1
			vote2
			vote3
			vote4
			vote5
			vote6
			vote7
			vote8
			vote9
			stars
		]
		all}
	unadjusted_rating = 0
	total_votes = (<vote0> + <vote1> + <vote2> + <vote3> + <vote4> + <vote5> + <vote6> + <vote7> + <vote8> + <vote9>)
	if (<total_votes> > 0)
		unadjusted_rating = ((<vote1> + <vote2> * 2 + <vote3> * 3 + <vote4> * 4 + <vote5> * 5 + <vote6> * 6 + <vote7> * 7 + <vote8> * 8 + <vote9> * 9) / <total_votes>)
	endif
	stars = (($net_user_content_ratings_average * $net_user_content_weighting_factor + <total_votes> * <unadjusted_rating>) / ($net_user_content_weighting_factor + <total_votes> * 1.0))
	rating = (<stars> * $net_user_content_stars_to_rating_conversion)
	casttointeger \{rating}
	return rating = <rating> stars = <stars>
endscript

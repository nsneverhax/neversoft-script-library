gstar_power_triggered = 0
achievements_table = [
	{
		name = achievement_nauseousnumerologist
		fetcher = getplayerinfo
		field = score
		comparator = 133337
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_nauseousnumerologist
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4112
		condition_test = ach_compare_nibbles
		check_time = during_song
	}
	{
		name = achievement_scionsofexcess
		fetcher = getnumplayersingame
		field = num_players
		comparator = 1
		condition_test = ach_check_greater_than
		check_time = during_song
	}
	{
		name = achievement_scionsofexcess
		fetcher = getbandinfo
		field = current_mult
		comparator = 11
		condition_test = ach_check_equality
		check_time = during_song
	}
	{
		name = achievement_scionsofexcess
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = during_song
	}
	{
		name = achievement_patronofthearts
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = jamsession
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_patronofthearts
		fetcher = ach_get_song_stars
		field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_patronofthearts
		fetcher = getplayerinfo
		field = total_notes
		comparator = 200
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_apostatesoforthodoxy
		fetcher = getnumplayersingame
		field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_apostatesoforthodoxy
		fetcher = ach_get_song_stars
		field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_apostatesoforthodoxy
		fetcher = check_is_standard_band
		field = standard_band
		comparator = 1
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		name = achievement_apostatesoforthodoxy
		fetcher = ach_get_difficulties
		field = num_beginner
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_apostatesoforthodoxy
		fetcher = ach_get_difficulties
		field = num_easy
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_apostatesoforthodoxy
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_bearersofthestandard
		fetcher = getnumplayersingame
		field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_bearersofthestandard
		fetcher = ach_get_song_stars
		field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_bearersofthestandard
		fetcher = check_is_standard_band
		field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_bearersofthestandard
		fetcher = ach_get_difficulties
		field = num_beginner
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_bearersofthestandard
		fetcher = ach_get_difficulties
		field = num_easy
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_bearersofthestandard
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_mathematicsharpshooters
		fetcher = getbandinfo
		field = score
		comparator = 1000
		condition_test = ach_check_multiple_of
		check_time = end_song
	}
	{
		name = achievement_mathematicsharpshooters
		fetcher = getnumplayersingame
		field = num_players
		comparator = 1
		condition_test = ach_check_greater_than
		check_time = end_song
	}
	{
		name = achievement_mathematicsharpshooters
		fetcher = getbandinfo
		field = score
		comparator = 0
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		name = achievement_mathematicsharpshooters
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_deerhunter
		fetcher = get_player_or_band_info
		field = score
		comparator = 6
		condition_test = ach_check_multiple_of
		check_time = end_song
	}
	{
		name = achievement_deerhunter
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_deerhunter
		fetcher = get_player_or_band_info
		field = score
		comparator = 0
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_band_config
		field = num_guitars
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_band_config
		field = num_bass
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_band_config
		field = num_vocals
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_band_config
		field = num_drums
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4112
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_scores_all_match
		field = all_match
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_song_ratings
		field = guitar_difficulty_rating
		comparator = 0
		condition_test = ach_check_greater_than
		check_time = end_song
	}
	{
		name = achievement_stringtwins
		fetcher = get_song_ratings
		field = bass_difficulty_rating
		comparator = 0
		condition_test = ach_check_greater_than
		check_time = end_song
	}
	{
		name = achievement_stellarcenturion
		fetcher = get_achievement_info
		field = quest_star_power_deployed
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_gemcollector
		fetcher = get_achievement_info
		field = quest_notes_hit
		comparator = 75000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_gemhoarder
		fetcher = get_achievement_info
		field = quest_notes_hit
		comparator = 150000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_mythicalmillionaire
		fetcher = getplayerinfo
		field = score
		comparator = 1000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_mythicalmillionaire
		fetcher = quickplay_using_powers
		field = using_powers
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_mythicalmillionaire
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		field = played_momentum
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		field = played_momentum_plus
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		field = played_streakers
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		field = played_do_or_die
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		field = played_perfectionist
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		field = played_faceoff
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_amateurastrologer
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_amateurastrologer
		fetcher = quickplay_get_award_info
		field = current_award_points_total
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = avatarassetaward_avt_soundgardenshirt
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = avatarassetaward_avt_soundgardenshirt
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = blackrain
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = achievement_accomplishedastrologer
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_accomplishedastrologer
		fetcher = quickplay_get_award_info
		field = current_award_points_total
		comparator = 500
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_adeptastrologer
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_adeptastrologer
		fetcher = quickplay_get_award_info
		field = current_award_points_total
		comparator = 1000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = avatarassetaward_avt_johnnyjacket
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = avatarassetaward_avt_johnnyjacket
		fetcher = quickplay_get_award_info
		field = current_award_points_total
		comparator = 1500
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = achievement_aceastrologer
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_aceastrologer
		fetcher = quickplay_get_award_info
		field = current_award_points_total
		comparator = 2000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_goldmaster
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_goldmaster
		fetcher = quickplay_get_award_info
		field = total_new_awards
		comparator = 3
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_diamondmaster
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_diamondmaster
		fetcher = quickplay_get_award_info
		field = new_diamond_awards
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = quickplay_get_band_award_info
		field = num_band
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = getnumplayersingame
		field = num_players
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = get_band_config
		field = num_guitars
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = get_band_config
		field = num_bass
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = get_band_config
		field = num_vocals
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_goldstandard
		fetcher = get_band_config
		field = num_drums
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_manageroffate
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_manageroffate
		fetcher = get_playlist_info
		field = playlist_size
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_manageroffate
		fetcher = get_playlist_info
		field = is_random
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_manageroffate
		fetcher = get_playlist_info
		field = num_5star_songs
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_mockeroffate
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_mockeroffate
		fetcher = get_playlist_info
		field = playlist_size
		comparator = 5
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_mockeroffate
		fetcher = get_playlist_info
		field = is_random
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_mockeroffate
		fetcher = get_playlist_info
		field = infinite
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_mockeroffate
		fetcher = get_playlist_info
		field = num_5star_songs
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_selfimprover
		fetcher = quickplay_get_combo_award_info
		field = total_new_above_gold_awards
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_selfimprover
		fetcher = quickplay_get_target_info
		field = targetting_player
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_selfimprover
		fetcher = quickplay_get_target_info_primary
		field = target
		comparator = self
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_selfimprover
		fetcher = quickplay_get_target_info
		field = result
		comparator = success
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_championofchallenges
		fetcher = quickplay_get_combo_award_info
		field = total_new_above_gold_awards
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_championofchallenges
		fetcher = quickplay_get_target_info
		field = targetting_player
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_championofchallenges
		fetcher = quickplay_get_target_info_primary
		field = target
		comparator = other
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_championofchallenges
		fetcher = quickplay_get_target_info
		field = result
		comparator = success
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_playeroftheearworm
		fetcher = get_song_data
		field = num_times_played
		comparator = 10
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_ultimateanswerer
		fetcher = get_award_point_data
		field = remaining_awards
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_alteredvirtuoso
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_alteredvirtuoso
		fetcher = ach_get_song_stars
		field = stars
		comparator = 40
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = avatarassetaward_avt_guitarheroshirt
		fetcher = ach_get_song_stars
		field = stars
		comparator = 0
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = achievement_poorboys
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_poorboys
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = bohemianrhapsody
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_poorboys
		fetcher = ach_get_difficulties_vocals
		field = num_medium_or_higher
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = rush2112p4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = ach_get_difficulties
		field = num_medium_or_higher
		comparator = 3
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = get_band_config
		field = num_guitars
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = get_band_config
		field = num_bass
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = get_band_config
		field = num_vocals
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_themeek
		fetcher = get_band_config
		field = num_drums
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		name = achievement_giantslayer
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_giantslayer
		fetcher = getnumplayersingame
		field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_giantslayer
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = holywars
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_giantslayer
		fetcher = getplayerinfo
		field = part
		comparator = bass
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_giantslayer
		fetcher = ach_get_difficulties
		field = num_hard_or_higher
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_chosenone
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_chosenone
		fetcher = getnumplayersingame
		field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_chosenone
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = furyofthestorm
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_chosenone
		fetcher = getplayerinfo
		field = part
		comparator = drum
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_chosenone
		fetcher = ach_get_difficulties
		field = num_hard_or_higher
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_handmutilator
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_handmutilator
		fetcher = getnumplayersingame
		field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_handmutilator
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = blackwidow
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_handmutilator
		fetcher = getplayerinfo
		field = part
		comparator = guitar
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_handmutilator
		fetcher = ach_get_difficulties
		field = num_expert
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_handmutilator
		fetcher = quickplay_using_powers
		field = using_powers
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thetrickster
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_thetrickster
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = spiderman
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thetrickster
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thedynamo
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_thedynamo
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = uprising
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thedynamo
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thesiren
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_thesiren
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = beencaughtstealing
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thesiren
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_therecluse
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_therecluse
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = childrenofthegrave
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_therecluse
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_axeclaimer
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_axeclaimer
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = rush2112p7
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_axeclaimer
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = avatarassetaward_avt_legendaryguitar
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = avatarassetaward_avt_legendaryguitar
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = rush2112p7
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = avatarassetaward_avt_legendaryguitar
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = achievement_theexalted
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_theexalted
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = bodies
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_theexalted
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thebrute
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_thebrute
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = paranoid
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thebrute
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thevigil
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_thevigil
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = renegade
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_thevigil
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_theeternal
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_theeternal
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = batcountry
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_theeternal
		fetcher = quest_chapter_totals_primary
		field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_divineliberator
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_divineliberator
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = thisdaywefight
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_divineliberator
		fetcher = get_current_level
		field = current_level
		comparator = load_z_finalbattle
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = avatarassetaward_avt_demigodhelmet
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = avatarassetaward_avt_demigodhelmet
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = thisdaywefight
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = avatarassetaward_avt_demigodhelmet
		fetcher = get_current_level
		field = current_level
		comparator = load_z_finalbattle
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		name = achievement_saviorofrock
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_saviorofrock
		fetcher = playlist_getcurrentsong
		field = current_song
		comparator = suddendeathgh6career
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_saviorofrock
		fetcher = get_current_level
		field = current_level
		comparator = load_z_finalbattle
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_pseudoperfectionist
		fetcher = getprevnumdominatedregchapters
		field = number_of_dominated_chapters
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_pseudoperfectionist
		fetcher = quest_chapter_totals_primary
		field = number_of_dominated_regular_chapters
		comparator = 2
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_partialperfectionist
		fetcher = getprevnumdominatedregchapters
		field = number_of_dominated_chapters
		comparator = 3
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_partialperfectionist
		fetcher = quest_chapter_totals_primary
		field = number_of_dominated_regular_chapters
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_perfectperfectionist
		fetcher = getprevnumdominatedregchapters
		field = number_of_dominated_chapters
		comparator = 8
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		name = achievement_perfectperfectionist
		fetcher = quest_chapter_totals_primary
		field = number_of_dominated_regular_chapters
		comparator = 9
		condition_test = ach_check_equality
		check_time = end_song
	}
]
tutorial_achievements_table = [
	{
		name = achievement_quicklearner
		fetcher = get_gametype_bitfield
		field = mode
		comparator = 65536
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		name = achievement_quicklearner
		fetcher = ach_fullcombo_test
		field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
]
feed_achievements_table = [
	{
		name = achievement_trackerofdeeds
		fetcher = get_achievement_info
		field = ff_clicks
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = feed_update
	}
]
songlist_based_achievements = [
	{
		name = achievement_anthemicarchivist
		fetcher = get_cached_content_size
		field = content_size
		comparator = 115
		condition_test = ach_check_greater_than_equal_to
		check_time = songlist_update
	}
]
g_current_song = xxx
g_number_of_dominated_chapters = -1
g_number_of_dominated_regular_chapters = -1

script init_achievements 
	kill_all_achievement_scripts
	playlist_getcurrentsong
	change g_current_song = <current_song>
	quest_chapter_totals_primary
	change g_number_of_dominated_chapters = <number_of_dominated_chapters>
	change g_number_of_dominated_regular_chapters = <number_of_dominated_regular_chapters>
	if should_update_achievements
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			getplayerinfo <player> bot_play
			if (1 = <bot_play>)
				getplayerinfo <player> bot_original_controller out = controller
			endif
			<ach_array> = achievements_table
			gamemode_gettype
			if (<type> = tutorial)
				<ach_array> = tutorial_achievements_table
			endif
			createachievementrequirements controller = <controller> arr = <ach_array>
			getarraysize $<ach_array>
			i = 0
			begin
			extendcrcplayer (($<ach_array> [<i>]).name) <player> out = ach_id
			if (($<ach_array> [<i>].check_time) = during_song)
				spawnscriptnow in_song_achievement_test params = {($<ach_array> [<i>]) player = <player> controller = <controller> time = beginsong} id = <ach_id>
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			getnextplayer player = <player> local
			repeat <num_players>
			block \{type = event_endsong_check_achievements}
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			getplayerinfo <player> bot_play
			if (1 = <bot_play>)
				getplayerinfo <player> bot_original_controller out = controller
			endif
			<ach_array> = achievements_table
			gamemode_gettype
			if (<type> = tutorial)
				<ach_array> = tutorial_achievements_table
			endif
			getarraysize $<ach_array>
			i = 0
			begin
			name = (($<ach_array> [<i>]).name)
			extendcrcplayer <name> <player> out = ach_id
			if achievement_test ($<ach_array> [<i>]) player = <player> controller = <controller> time = endsong
			else
				i2 = (<i> + 1)
				begin
				if (<i2> = <array_size>)
					break
				endif
				next_name = (($<ach_array> [<i2>]).name)
				if (<next_name> = <name>)
					<i> = (<i> + 1)
					<i2> = (<i2> + 1)
				else
					break
				endif
				repeat
			endif
			<i> = (<i> + 1)
			if (<i> = <array_size>)
				break
			endif
			mod a = <i> b = 20
			if (<mod> = 0)
				wait \{1
					gameframe}
			endif
			repeat
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	endif
endscript

script should_update_achievements 
	if demobuild
		return \{false}
	endif
	if NOT isbandcheating
		gamemode_gettype
		if ((<type> != freeplay) && ($game_mode != training) && ($game_mode != practice) && ($calibrate_lag_enabled = 0))
			if innetgame
				if sessionisover
					return \{false}
				endif
			endif
			return \{true}
		endif
	endif
	return \{false}
endscript

script song_won_update_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 1)
		gamemode_gettype
		if (<type> = quickplay)
			getplayerinfo <player> band
			getbandinfo <band> stars
			if (<stars> >= 5)
				change g_songlist_num_5star_songs = ($g_songlist_num_5star_songs + 1)
			endif
		endif
	endif
	if isps3
		song_won_update_achievement_counters player = <player>
	else
		begin
		song_won_update_achievement_counters player = <player>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	broadcastevent \{type = event_endsong_check_achievements}
endscript

script test_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		getplayerinfo <player> controller
		createachievementrequirements controller = <controller> arr = <array_name>
		getarraysize $<array_name>
		i = 0
		begin
		achievement_test ($<array_name> [<i>]) player = <player> controller = <controller>
		<i> = (<i> + 1)
		repeat <array_size>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
endscript

script test_feed_achievements 
	kill_all_achievement_scripts
	createachievementrequirements controller = <controller> arr = feed_achievements_table
	getarraysize \{$feed_achievements_table}
	i = 0
	begin
	achievement_test ($feed_achievements_table [<i>]) player = -1 controller = <controller>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script test_songlist_based_achievements 
	kill_all_achievement_scripts
	test_achievements \{array_name = songlist_based_achievements}
endscript

script kill_all_achievement_scripts 
	killspawnedscript \{name = in_song_achievement_test}
endscript

script in_song_achievement_test 
	achievement_test <...>
endscript

script achievement_test \{award_type = achievement}
	switch <fetcher>
		case playlist_getcurrentsong
		fetcher = ach_getcurrentsong
		case getprevnumdominatedchapters
		fetcher = ach_prev_num_dominated_chapters
		case getprevnumdominatedregchapters
		fetcher = ach_prev_num_dominated_regular_chapters
		case getnumplayersingame
		case getplayerinfo
		params = {player = <player> <field>}
		case getbandinfo
		getplayerinfo <player> band
		params = {<band> <field>}
		case getglobaltags
		get_savegame_from_controller controller = <controller>
		params = {savegame = <savegame> param = <field>}
		case num_players_in_star_power
		getfirstplayer \{on_screen}
		params = {player = <player>}
		default
		params = {fetch_func = <fetcher> player = <player> controller = <controller> field = <field>}
		<fetcher> = fetchachievementdata
	endswitch
	if (<check_time> = during_song)
		if gotparam \{time}
			if (<time> = endsong)
				return
			endif
		endif
		begin
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass name = <name> controller = <controller> award_type = <award_type>
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		if (<check_time> = end_song)
			if gotparam \{time}
				if (<time> = beginsong)
					return
				endif
			endif
		endif
		if (<check_time> = begin_song)
			if gotparam \{time}
				if (<time> = endsong)
					return
				endif
			endif
		endif
		<fetcher> <params> out = term_a
		if gettype \{name = comparator}
			if (<type> = int)
				if gettype \{name = term_a}
					if (<type> = float)
						casttointeger \{term_a}
					endif
				endif
			endif
		endif
		if <condition_test> term_a = <term_a> term_b = <comparator>
			finalprintf qs(0xdcbc46d3) a = <name> b = <fetcher> c = <field> d = <condition_test> e = <comparator> s = <term_a> t = <award_type> p = <player>
			achievement_test_pass name = <name> controller = <controller> award_type = <award_type>
			return \{true}
		else
			finalprintf qs(0x5c3bd148) a = <name> b = <fetcher> c = <field> d = <condition_test> e = <comparator> s = <term_a> t = <award_type> p = <player>
			return \{false}
		endif
	endif
endscript

script dump_req_arr 
	getarraysize \{$achievements_table}
	i = 0
	begin
	name = ($achievements_table [<i>].name)
	get_achievement_structure achievement_name = <name> controller = 0
	printstruct <achievement_structure>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script achievement_test_pass 
	get_achievement_structure achievement_name = <name> controller = <controller>
	setarrayelement arrayname = <achievement_structure> globalarray index = 1 newvalue = (($<achievement_structure> [1]) + 1)
	if (($<achievement_structure> [0]) = ($<achievement_structure> [1]))
		finalprintf qs(0x98bdbceb) a = <name>
		fire_achievement name = <name> controller = <controller> type = <award_type>
	endif
endscript

script ach_check_equality 
	if (<term_a> = <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_check_greater_than_equal_to 
	if (<term_a> >= <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_check_greater_than 
	if (<term_a> > <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_check_less_than 
	if (<term_a> < <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_compare_nibbles 
	if NOT (<term_a> && <term_b>)
		return \{false}
	else
		return \{true}
	endif
endscript

script ach_check_not_equal 
	if NOT (<term_a> = <term_b>)
		return \{true}
	else
		return \{false}
	endif
endscript

script ach_check_multiple_of 
	mod a = <term_a> b = <term_b>
	if (<mod> = 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script get_achievement_structure 
	formattext textname = controller_suffix '_%d' d = <controller>
	extendcrc <achievement_name> <controller_suffix> out = achievement_structure
	return achievement_structure = <achievement_structure>
endscript

script fire_achievement \{type = achievement}
	if demobuild
		return \{false}
	endif
	printf qs(0xa6e2a7fb) s = <name> d = <controller> t = <type>
	if (<type> = achievement)
		writeachievements achievement = <name> controller_id = <controller>
	elseif (<type> = unlock_avatar)
		unlockavatar avatar_asset = <name> controller_id = <controller>
	endif
endscript

script debugunlockavatar1 
	printf \{'debugunlockavatar1 : Called!'}
	unlockavatar avatar_asset = avatarassetaward_avt_johnnyjacket controller_id = ($primary_controller)
endscript

script debugunlockavatar2 
	printf \{'debugunlockavatar2 : Called!'}
	unlockavatar avatar_asset = avatarassetaward_avt_guitarheroshirt controller_id = ($primary_controller)
endscript

script debugunlockavatar3 
	printf \{'debugunlockavatar3 : Called!'}
	unlockavatar avatar_asset = avatarassetaward_avt_soundgardenshirt controller_id = ($primary_controller)
endscript

script debugunlockavatar4 
	printf \{'debugunlockavatar4 : Called!'}
	unlockavatar avatar_asset = avatarassetaward_avt_legendaryguitar controller_id = ($primary_controller)
endscript

script debugunlockavatar5 
	printf \{'debugunlockavatar5 : Called!'}
	unlockavatar avatar_asset = avatarassetaward_avt_demigodhelmet controller_id = ($primary_controller)
endscript

script check_is_avatar 
	getplayerinfo <player> character_id
	get_savegame_from_controller controller = <controller>
	if is_avatar_character id = <character_id> savegame = <savegame>
		return \{is_avatar = 1}
	else
		return \{is_avatar = 0}
	endif
endscript

script quickplay_using_powers 
	if gman_ispowerscoreenabled
		return \{using_powers = 1}
	else
		return \{using_powers = 0}
	endif
endscript

script get_song_completion_precentage 
	gman_songfunc \{func = get_current_song}
	getsongtimems
	songfilemanager func = get_song_end_time song_name = <current_song>
	completion_percentage = 0
	if (<total_end_time> > 0)
		<completion_percentage> = ((<time> / <total_end_time>) * 100)
	endif
	if (<completion_percentage> > 100)
		<completion_percentage> = 100
	endif
	printf qs(0x415136c5) a = <time> b = <total_end_time> c = <completion_percentage>
	return completion_percentage = <completion_percentage>
endscript

script ach_get_song_stars 
	getplayerinfo <player> band
	getbandinfo <band> projected_song_stars
	return stars = <projected_song_stars>
endscript

script ach_get_difficulties \{part = none}
	num_beginner = 0
	num_easy = 0
	num_medium = 0
	num_hard = 0
	num_expert = 0
	getnumplayersingame
	getfirstplayer
	begin
	if NOT (<part> = none)
		getplayerinfo <player> part out = current_part
	else
		current_part = none
	endif
	if (<part> = <current_part>)
		getplayerinfo <player> difficulty
		switch <difficulty>
			case beginner
			<num_beginner> = (<num_beginner> + 1)
			case easy
			<num_easy> = (<num_easy> + 1)
			case medium
			<num_medium> = (<num_medium> + 1)
			case hard
			<num_hard> = (<num_hard> + 1)
			case expert
			<num_expert> = (<num_expert> + 1)
			default
			scriptassert qs(0xd06add8c) s = <part>
		endswitch
	endif
	getnextplayer player = <player>
	repeat <num_players>
	num_medium_or_higher = (<num_medium> + <num_hard> + <num_expert>)
	num_hard_or_higher = (<num_hard> + <num_expert>)
	return num_beginner = <num_beginner> num_easy = <num_easy> num_medium = <num_medium> num_hard = <num_hard> num_expert = <num_expert> num_medium_or_higher = <num_medium_or_higher> num_hard_or_higher = <num_hard_or_higher>
endscript

script ach_get_difficulties_guitar 
	ach_get_difficulties \{part = guitar}
	return <...>
endscript

script ach_get_difficulties_bass 
	ach_get_difficulties \{part = bass}
	return <...>
endscript

script ach_get_difficulties_drum 
	ach_get_difficulties \{part = drum}
	return <...>
endscript

script ach_get_difficulties_vocals 
	ach_get_difficulties \{part = vocals}
	return <...>
endscript

script get_progression_stars 
	get_savegame_from_controller controller = <controller>
	get_current_progression_stars savegame = <savegame>
	return total_stars = <total_stars>
endscript

script quest_encore_complete 
	get_savegame_from_controller controller = <controller>
	if quest_progression_check_encore_complete chapter = <field> savegame = <savegame>
		return \{term_a = true}
	else
		return \{term_a = false}
	endif
endscript

script quest_encore_complete_primary 
	quest_encore_complete controller = ($primary_controller) field = <field>
	return term_a = <term_a>
endscript

script quest_chapter_dominated 
	get_savegame_from_controller controller = <controller>
	if quest_progression_check_chapter_dominated chapter = <field> savegame = <savegame>
		return \{term_a = true}
	else
		return \{term_a = false}
	endif
endscript

script quest_chapter_totals 
	get_savegame_from_controller controller = <controller>
	quest_progression_get_number_of_completed_chapters savegame = <savegame>
	<num_unfinished_chapters> = (<number_of_chapters> - <number_of_unlocked_chapters>)
	<num_undominated_chapters> = (<number_of_chapters> - <number_of_dominated_chapters>)
	if (($g_just_completed_chapter) = 1)
		<just_completed> = true
	else
		<just_completed> = false
	endif
	return <...>
endscript

script quest_chapter_totals_primary 
	get_savegame_from_controller controller = ($primary_controller)
	quest_progression_get_number_of_completed_chapters savegame = <savegame>
	<num_unfinished_chapters> = (<number_of_chapters> - <number_of_unlocked_chapters>)
	<num_undominated_chapters> = (<number_of_chapters> - <number_of_dominated_chapters>)
	if (($g_just_completed_chapter) = 1)
		<just_completed> = true
	else
		<just_completed> = false
	endif
	return <...>
endscript

script get_player_or_band_info \{player = !i1768515945}
	getnumplayersingame
	if (<num_players> > 1)
		getplayerinfo <player> band
		getbandinfo <band> score
	else
		getplayerinfo <player> score
	endif
	return score = <score>
endscript

script quickplay_get_combo_award_info \{player = !i1768515945}
	getnumplayersingame
	if (<num_players> > 1)
		quickplay_get_band_award_info
	else
		quickplay_get_award_info player = <player>
	endif
	return {
		gold_awards = <gold_awards>
		diamond_awards = <diamond_awards>
		platinum_awards = <platinum_awards>
		new_gold_awards = <new_gold_awards>
		new_diamond_awards = <new_diamond_awards>
		new_platinum_awards = <new_platinum_awards>
		total_awards = <total_awards>
		total_new_awards = <total_new_awards>
		total_new_above_gold_awards = <total_new_above_gold_awards>
	}
endscript

script quickplay_get_award_info \{player = !i1768515945}
	gold_awards = 0
	diamond_awards = 0
	platinum_awards = 0
	new_gold_awards = 0
	new_diamond_awards = 0
	new_platinum_awards = 0
	total_awards = 0
	total_new_awards = 0
	total_new_above_gold_awards = 0
	quickplay_get_overall_awards_progress player = <player>
	if NOT gman_ispowerscoreenabled
		quickplay_get_challenge_outro_stats player = <player>
		fastgetarraysize array = (<player_challenge_stats>)
		if (<array_size> > 0)
			<i> = 0
			begin
			<current_level> = ((<player_challenge_stats> [<i>]).challenge_grade)
			<previous_level> = ((<player_challenge_stats> [<i>]).previous_grade)
			if (<current_level> > 0)
				<total_awards> = (<total_awards> + 1)
				if (<current_level> = 1)
					<gold_awards> = (<gold_awards> + 1)
					if NOT (<current_level> = <previous_level>)
						<new_gold_awards> = (<new_gold_awards> + 1)
						<total_new_awards> = (<total_new_awards> + 1)
					endif
				endif
				if (<current_level> = 2)
					<platinum_awards> = (<platinum_awards> + 1)
					if NOT (<current_level> = <previous_level>)
						<new_platinum_awards> = (<new_platinum_awards> + 1)
						<total_new_awards> = (<total_new_awards> + 1)
						<total_new_above_gold_awards> = (<total_new_above_gold_awards> + 1)
					endif
				endif
				if (<current_level> = 3)
					<diamond_awards> = (<diamond_awards> + 1)
					if NOT (<current_level> = <previous_level>)
						<new_diamond_awards> = (<new_diamond_awards> + 1)
						<total_new_awards> = (<total_new_awards> + 1)
						<total_new_above_gold_awards> = (<total_new_above_gold_awards> + 1)
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return {
		gold_awards = <gold_awards>
		diamond_awards = <diamond_awards>
		platinum_awards = <platinum_awards>
		new_gold_awards = <new_gold_awards>
		new_diamond_awards = <new_diamond_awards>
		new_platinum_awards = <new_platinum_awards>
		total_awards = <total_awards>
		total_new_awards = <total_new_awards>
		total_new_above_gold_awards = <total_new_above_gold_awards>
		current_award_points_total = <current_award_points_total>
	}
	player_challenge_stats = []
	previous_level = 0
	current_award_points_total = 0
endscript

script quickplay_get_band_award_info 
	gold_awards = 0
	diamond_awards = 0
	platinum_awards = 0
	new_gold_awards = 0
	new_diamond_awards = 0
	new_platinum_awards = 0
	total_awards = 0
	total_new_awards = 0
	total_new_above_gold_awards = 0
	num_guitars = 0
	num_bass = 0
	num_drums = 0
	num_vocals = 0
	num_band = 0
	quickplay_get_overall_awards_progress player = <player>
	if NOT gman_ispowerscoreenabled
		quickplay_get_challenge_outro_stats \{player = 0}
		getarraysize <player_challenge_stats>
		if (<array_size> > 0)
			<i> = 0
			begin
			<current_level> = ((<player_challenge_stats> [<i>]).challenge_grade)
			if (<current_level> > 0)
				<num_band> = (<num_band> + 1)
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		getnumplayersingame
		getfirstplayer
		begin
		getplayerinfo <player> part
		quickplay_get_challenge_outro_stats player = <player>
		getarraysize <player_challenge_stats>
		if (<array_size> > 0)
			<i> = 0
			begin
			<current_level> = ((<player_challenge_stats> [<i>]).challenge_grade)
			<previous_level> = ((<player_challenge_stats> [<i>]).previous_grade)
			if (<current_level> > 0)
				<total_awards> = (<total_awards> + 1)
				if (<current_level> = 1)
					<gold_awards> = (<gold_awards> + 1)
					if NOT (<current_level> = <previous_level>)
						<new_gold_awards> = (<new_gold_awards> + 1)
						<total_new_awards> = (<total_new_awards> + 1)
					endif
				endif
				if (<current_level> = 2)
					<platinum_awards> = (<platinum_awards> + 1)
					if NOT (<current_level> = <previous_level>)
						<new_platinum_awards> = (<new_platinum_awards> + 1)
						<total_new_awards> = (<total_new_awards> + 1)
					endif
				endif
				if (<current_level> = 3)
					<diamond_awards> = (<diamond_awards> + 1)
					if NOT (<current_level> = <previous_level>)
						<new_diamond_awards> = (<new_diamond_awards> + 1)
						<total_new_awards> = (<total_new_awards> + 1)
					endif
				endif
				if (<current_level> > 0)
					switch <part>
						case guitar
						<num_guitars> = (<num_guitars> + 1)
						case bass
						<num_bass> = (<num_bass> + 1)
						case drum
						<num_drums> = (<num_drums> + 1)
						case vocals
						<num_vocals> = (<num_vocals> + 1)
						default
						scriptassert qs(0x1aad6e58) s = <part>
					endswitch
				endif
				if (<current_level> > 1)
					if NOT (<current_level> = <previous_level>)
						<total_new_above_gold_awards> = (<total_new_above_gold_awards> + 1)
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return {
		gold_awards = <gold_awards>
		diamond_awards = <diamond_awards>
		platinum_awards = <platinum_awards>
		new_gold_awards = <new_gold_awards>
		new_diamond_awards = <new_diamond_awards>
		new_platinum_awards = <new_platinum_awards>
		total_awards = <total_awards>
		total_new_awards = <total_new_awards>
		total_new_above_gold_awards = <total_new_above_gold_awards>
		num_guitars = <num_guitars>
		num_bass = <num_bass>
		num_drums = <num_drums>
		num_vocals = <num_vocals>
		num_band = <num_band>
	}
endscript

script quickplay_get_target_info_primary 
	quickplay_get_target_info controller = ($primary_controller)
	return targetting = <targetting> targetting_player = <targetting_player> target = <target> result = <result>
endscript

script quickplay_get_target_info 
	targetting = 0
	targetting_player = 0
	target = null
	result = null
	if gman_goalisactive \{goal = quickplay}
		gman_getdata \{goal = quickplay
			name = targeted_challenge}
		if NOT checksumequals a = <targeted_challenge> b = null
			<targetting> = 1
			quickplay_targeting_player_get_result
			if NOT checksumequals a = <result> b = not_targeting_player
				<targetting_player> = 1
				quickplay_targeting_player_get_opponent_gamertag
				<opponent_gamertag> = <gamertag>
				netsessionfunc func = get_gamertag params = {controller = <controller>}
				if (<opponent_gamertag> = <name>)
					<target> = self
				else
					<target> = other
				endif
			endif
		endif
	endif
	return targetting = <targetting> targetting_player = <targetting_player> target = <target> result = <result>
endscript

script get_playlist_info 
	return num_5star_songs = ($g_songlist_num_5star_songs) is_random = ($g_songlist_random_playlist) infinite = ($g_songlist_infinite_playlist) playlist_size = ($g_songlist_playlist_size)
endscript

script get_band_config 
	num_guitars = 0
	num_bass = 0
	num_drums = 0
	num_vocals = 0
	getnumplayersingame
	getfirstplayer
	begin
	getplayerinfo <player> part
	switch <part>
		case guitar
		<num_guitars> = (<num_guitars> + 1)
		case bass
		<num_bass> = (<num_bass> + 1)
		case drum
		<num_drums> = (<num_drums> + 1)
		case vocals
		<num_vocals> = (<num_vocals> + 1)
		default
		scriptassert qs(0x1aad6e58) s = <part>
	endswitch
	getnextplayer player = <player>
	repeat <num_players>
	return num_guitars = <num_guitars> num_bass = <num_bass> num_drums = <num_drums> num_vocals = <num_vocals>
endscript

script get_current_level 
	return current_level = ($current_level)
endscript

script get_scores_all_match 
	all_match = 0
	getnumplayersingame
	if (<num_players> > 1)
		<all_match> = 1
		getfirstplayer
		getplayerinfo <player> score out = compare_score
		getnextplayer player = <player>
		begin
		getplayerinfo <player> score
		if NOT (<score> = <compare_score>)
			<all_match> = 0
			break
		endif
		getnextplayer player = <player>
		repeat (<num_players> - 1)
	endif
	return all_match = <all_match>
endscript

script get_song_fc 
	song_fc = 0
	getplayerinfo <player> notes_hit
	getplayerinfo <player> total_notes
	if (<notes_hit> = <total_notes>)
		<song_fc> = 1
	endif
	return song_fc = <song_fc>
endscript

script get_achievement_info 
	get_savegame_from_controller controller = <controller>
	getglobaltags achievement_info savegame = <savegame> param = <field>
	return <...>
endscript

script get_gametype_bitfield 
	mode = 0
	gamemode_gettype
	switch (<type>)
		case quickplay
		<mode> = 4096
		case career
		<mode> = 256
		case competitive
		<mode> = 16
		case freeplay
		<mode> = 1
		case tutorial
		<mode> = 65536
		default
		scriptassert qs(0x66bb1769) s = <type>
	endswitch
	return <mode>
endscript

script song_won_update_achievement_counters 
	gamemode_gettype
	getnumplayersingame
	get_savegame_from_player player = <player>
	achievement_global_tags = {}
	switch (<type>)
		case quickplay
		achievement_global_tags = {<achievement_global_tags> played_quickplay = 1}
		case competitive
		switch (($competitive_rules))
			case faceoff
			achievement_global_tags = {<achievement_global_tags> played_faceoff = 1}
			case momentum
			achievement_global_tags = {<achievement_global_tags> played_momentum = 1}
			case momentum_plus
			achievement_global_tags = {<achievement_global_tags> played_momentum_plus = 1}
			case streakers
			achievement_global_tags = {<achievement_global_tags> played_streakers = 1}
			case do_or_die
			achievement_global_tags = {<achievement_global_tags> played_do_or_die = 1}
			case perfectionist
			achievement_global_tags = {<achievement_global_tags> played_perfectionist = 1}
			case elimination
			achievement_global_tags = {<achievement_global_tags> played_elimination = 1}
			case team_faceoff
			achievement_global_tags = {<achievement_global_tags> played_team_faceoff = 1}
			case team_momentum
			achievement_global_tags = {<achievement_global_tags> played_team_momentum = 1}
			case team_streakers
			achievement_global_tags = {<achievement_global_tags> played_team_streakers = 1}
			case team_do_or_die
			achievement_global_tags = {<achievement_global_tags> played_team_do_or_die = 1}
			case team_perfectionist
			achievement_global_tags = {<achievement_global_tags> played_team_perfectionist = 1}
			case team_elimination
			achievement_global_tags = {<achievement_global_tags> played_team_elimination = 1}
			case band_vs_band
			achievement_global_tags = {<achievement_global_tags> played_p8_pro_faceoff = 1}
			default
			scriptassert qs(0xa6d815a7) s = ($competitive_rules)
		endswitch
		case career
		achievement_global_tags = {<achievement_global_tags> played_career = 1}
		case tutorial
		printf \{qs(0x05111391)}
		case freeplay
		printf \{qs(0x89ed9637)}
		default
		scriptassert qs(0xa6d815a7) s = <type>
	endswitch
	if (<type> = quickplay)
		getglobaltags achievement_info savegame = <savegame> param = quickplay_songs_completed
		achievement_global_tags = {<achievement_global_tags> quickplay_songs_completed = (<quickplay_songs_completed> + 1)}
	elseif (($is_network_game = 1) && (<type> = competitive) && ($competitive_rules = faceoff))
		getglobaltags achievement_info savegame = <savegame> param = online_pro_faceoff_games_played
		achievement_global_tags = {<achievement_global_tags> online_pro_faceoff_games_played = (<online_pro_faceoff_games_played> + 1)}
	endif
	if (($game_mode = fest_mode) && (<num_players> = 4))
		getglobaltags achievement_info savegame = <savegame> param = four_player_shredfest_games_played
		achievement_global_tags = {<achievement_global_tags> four_player_shredfest_games_played = (<four_player_shredfest_games_played> + 1)}
	endif
	if (<type> = career)
		getglobaltags achievement_info savegame = <savegame> param = quest_star_power_deployed
		getplayerinfo <player> star_power_use_count
		achievement_global_tags = {<achievement_global_tags> quest_star_power_deployed = (<quest_star_power_deployed> + <star_power_use_count>)}
		getglobaltags achievement_info savegame = <savegame> param = quest_notes_hit
		getplayerinfo <player> notes_hit
		achievement_global_tags = {<achievement_global_tags> quest_notes_hit = (<quest_notes_hit> + <notes_hit>)}
		getglobaltags achievement_info savegame = <savegame> param = quest_score
		getplayerinfo <player> score
		achievement_global_tags = {<achievement_global_tags> quest_score = (<quest_score> + <score>)}
	endif
	if (<num_players> = 1)
		if (<type> = quickplay)
			getplayerinfo <player> stars
			if (<stars> >= 5)
				change g_songlist_num_5star_songs = ($g_songlist_num_5star_songs + 1)
			endif
		endif
	endif
	printf qs(0x7507ebe3) d = <player> a = <savegame>
	printstruct <achievement_global_tags>
	setglobaltags achievement_info savegame = <savegame> params = <achievement_global_tags>
endscript

script get_song_ratings 
	get_song_difficulty_ratings song = ($g_current_song)
	return {
		guitar_difficulty_rating = <guitar_difficulty_rating>
		bass_difficulty_rating = <bass_difficulty_rating>
		vocals_difficulty_rating = <vocals_difficulty_rating>
		drums_difficulty_rating = <drums_difficulty_rating>
		band_difficulty_rating = <band_difficulty_rating>
	}
endscript

script ach_getcurrentsong 
	return term_a = ($g_current_song)
endscript

script ach_prev_num_dominated_chapters 
	return term_a = ($g_number_of_dominated_chapters)
endscript

script ach_prev_num_dominated_regular_chapters 
	return term_a = ($g_number_of_dominated_regular_chapters)
endscript

script ach_fullcombo_test 
	getplayerinfo <player> part
	playlist_getcurrentsong
	passed = 1
	if (<current_song> = jamsession)
		<passed> = 0
	else
		getsongtimems
		songfilemanager func = get_song_end_time song_name = <current_song>
		if ((<total_end_time> <= 0) || (<time> < <total_end_time>))
			<passed> = 0
		else
			if (<part> != vocals)
				getplayerinfo <player> notes_hit
				getplayerinfo <player> total_notes
				getplayerinfo <player> max_notes
				getplayerinfo <player> unnecessary_notes
				if ((<notes_hit> < <total_notes>) || (<total_notes> = 0) || (<unnecessary_notes> > 0))
					<passed> = 0
				endif
			else
				getplayerinfo <player> vocal_phrase_quality
				getplayerinfo <player> vocal_phrase_max_qual
				if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
					<passed> = 0
				endif
			endif
		endif
	endif
	return passed = <passed>
endscript

script get_song_data 
	<song_id> = ($last_song_played)
	fix_song_id_suddendeath_hack song_id = <song_id>
	if NOT song_is_jamsession song = <song_id>
		get_savegame_from_controller controller = <controller>
		getglobaltags <song_id> param = num_times_played savegame = <savegame>
	else
		<num_times_played> = 0
	endif
	return num_times_played = <num_times_played>
endscript

script get_award_point_data \{controller = !i1768515945}
	if NOT song_is_jamsession song = ($last_song_played)
		get_savegame_from_controller controller = <controller>
		quickplay_get_awards_for_song song_name = ($last_song_played) savegame = <savegame>
		remaining_awards = (<awards_total> - <awards_earned>)
		remaining_challenge_awards = (<challenge_awards_total> - <challenge_awards>)
	else
		<num_challenges> = -1
		<awards_earned> = -1
		<awards_total> = -1
		<challenge_awards> = -1
		<challenge_awards_total> = -1
		<qp_power_stars> = -1
		<remaining_awards> = -1
		<remaining_challenge_awards> = -1
	endif
	return {
		num_challenges = <num_challenges>
		awards_earned = <awards_earned>
		awards_total = <awards_total>
		challenge_awards = <challenge_awards>
		challenge_awards_total = <challenge_awards_total>
		qp_power_stars = <qp_power_stars>
		remaining_awards = <remaining_awards>
		remaining_challenge_awards = <remaining_challenge_awards>
	}
	savegame = 0
endscript

script check_is_standard_band 
	if is_standard_band
		return \{standard_band = 1}
	endif
	return \{standard_band = 0}
endscript

script num_players_in_star_power 
	getnumplayersingame \{on_screen
		out = num_players}
	players_in_star_power = 0
	begin
	getplayerinfo <player> star_power_used
	if (<star_power_used> = 1)
		<players_in_star_power> = (<players_in_star_power> + 1)
	else
		break
	endif
	getnextplayer player = <player> on_screen
	repeat <num_players>
	return term_a = <players_in_star_power>
endscript

script is_standard_band 
	getnumplayersingame
	num_lead = 0
	num_bass = 0
	num_vocal = 0
	num_drum = 0
	if (<num_players> = 4)
		getfirstplayer
		begin
		getplayerinfo <player> part
		switch <part>
			case guitar
			<num_lead> = (<num_lead> + 1)
			case bass
			<num_bass> = (<num_bass> + 1)
			case vocals
			<num_vocal> = (<num_vocal> + 1)
			case drum
			<num_drum> = (<num_drum> + 1)
			default
			scriptassert qs(0x03695c6c) s = <part>
		endswitch
		getnextplayer player = <player>
		repeat <num_players>
		printstruct <...>
		if ((<num_lead> = 1) && (<num_bass> = 1) && (<num_vocal> = 1) && (<num_drum> = 1))
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_ischeating 
	if ($cheat_autokick = 1 || $cheat_freedrum = 1)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	if ($cheat_alwaysslide = 1)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> part
		if (<part> = guitar)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick != 1 && $cheat_freedrum != 1)
		return \{false}
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		if (<part> = drum)
			printf \{qs(0x90144029)}
			return \{true}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return \{false}
endscript

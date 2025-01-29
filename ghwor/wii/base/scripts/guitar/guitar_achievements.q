gStar_Power_Triggered = 0
achievements_table = [
	{
		Name = achievement_nauseousnumerologist
		fetcher = getplayerinfo
		Field = score
		comparator = 133337
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_nauseousnumerologist
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4112
		condition_test = ach_compare_nibbles
		check_time = during_song
	}
	{
		Name = achievement_scionsofexcess
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 1
		condition_test = ach_check_greater_than
		check_time = during_song
		first_player_only
		early_out
	}
	{
		Name = achievement_scionsofexcess
		fetcher = getbandinfo
		Field = current_mult
		comparator = 11
		condition_test = ach_check_equality
		check_time = during_song
		first_player_only
	}
	{
		Name = achievement_scionsofexcess
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = during_song
		first_player_only
		early_out
	}
	{
		Name = achievement_patronofthearts
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = jamsession
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_patronofthearts
		fetcher = ach_get_song_stars
		Field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_patronofthearts
		fetcher = getplayerinfo
		Field = total_notes
		comparator = 200
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_apostatesoforthodoxy
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_apostatesoforthodoxy
		fetcher = ach_get_song_stars
		Field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_apostatesoforthodoxy
		fetcher = check_is_standard_band
		Field = standard_band
		comparator = 1
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		Name = achievement_apostatesoforthodoxy
		fetcher = ach_get_difficulties
		Field = num_beginner
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_apostatesoforthodoxy
		fetcher = ach_get_difficulties
		Field = num_easy
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_apostatesoforthodoxy
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_bearersofthestandard
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_bearersofthestandard
		fetcher = ach_get_song_stars
		Field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_bearersofthestandard
		fetcher = check_is_standard_band
		Field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_bearersofthestandard
		fetcher = ach_get_difficulties
		Field = num_beginner
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_bearersofthestandard
		fetcher = ach_get_difficulties
		Field = num_easy
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_bearersofthestandard
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_mathematicsharpshooters
		fetcher = getbandinfo
		Field = score
		comparator = 1000
		condition_test = ach_check_multiple_of
		check_time = end_song
	}
	{
		Name = achievement_mathematicsharpshooters
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 1
		condition_test = ach_check_greater_than
		check_time = end_song
	}
	{
		Name = achievement_mathematicsharpshooters
		fetcher = getbandinfo
		Field = score
		comparator = 0
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		Name = achievement_mathematicsharpshooters
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_deerhunter
		fetcher = getplayerinfo
		Field = score
		comparator = 6
		condition_test = ach_check_multiple_of
		check_time = end_song
	}
	{
		Name = achievement_deerhunter
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_deerhunter
		fetcher = getplayerinfo
		Field = score
		comparator = 0
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		Name = achievement_stringtwins
		fetcher = get_band_config
		Field = num_guitars
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_stringtwins
		fetcher = get_band_config
		Field = num_bass
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_stringtwins
		fetcher = get_band_config
		Field = num_vocals
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_stringtwins
		fetcher = get_band_config
		Field = num_drums
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_stringtwins
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4112
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_stringtwins
		fetcher = get_scores_all_match
		Field = all_match
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_stellarcenturion
		fetcher = get_achievement_info
		Field = quest_star_power_deployed
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_gemcollector
		fetcher = get_achievement_info
		Field = quest_notes_hit
		comparator = 100000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_gemhoarder
		fetcher = get_achievement_info
		Field = quest_notes_hit
		comparator = 150000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_mythicalmillionaire
		fetcher = getplayerinfo
		Field = score
		comparator = 1000000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_mythicalmillionaire
		fetcher = quickplay_using_powers
		Field = using_powers
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_mythicalmillionaire
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		Field = played_momentum
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		Field = played_momentum_plus
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		Field = played_streakers
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		Field = played_do_or_die
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		Field = played_perfectionist
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_seasonedcompetitor
		fetcher = get_achievement_info
		Field = played_faceoff
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_amateurastrologer
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_amateurastrologer
		fetcher = quickplay_get_award_info
		Field = current_award_points_total
		comparator = 100
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = avatarassetaward_avt_tshirt2
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = avatarassetaward_avt_tshirt2
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = blackrain
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = achievement_accomplishedastrologer
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_accomplishedastrologer
		fetcher = quickplay_get_award_info
		Field = current_award_points_total
		comparator = 500
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_adeptastrologer
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_adeptastrologer
		fetcher = quickplay_get_award_info
		Field = current_award_points_total
		comparator = 1000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = avatarassetaward_avt_johnnyjacket
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = avatarassetaward_avt_johnnyjacket
		fetcher = quickplay_get_award_info
		Field = current_award_points_total
		comparator = 1500
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = achievement_aceastrologer
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_aceastrologer
		fetcher = quickplay_get_award_info
		Field = current_award_points_total
		comparator = 2000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_goldmaster
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_goldmaster
		fetcher = quickplay_get_award_info
		Field = total_new_awards
		comparator = 3
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_diamondmaster
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_diamondmaster
		fetcher = quickplay_get_award_info
		Field = new_diamond_awards
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_goldstandard
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_goldstandard
		fetcher = quickplay_get_band_award_info
		Field = num_band
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_goldstandard
		fetcher = check_is_standard_band
		Field = standard_band
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_manageroffate
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_manageroffate
		fetcher = get_playlist_info
		Field = num_5star_songs
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_manageroffate
		fetcher = get_playlist_info
		Field = is_random
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_mockeroffate
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_mockeroffate
		fetcher = get_playlist_info
		Field = num_5star_songs
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_mockeroffate
		fetcher = get_playlist_info
		Field = is_random
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_selfimprover
		fetcher = quickplay_get_award_info
		Field = total_new_above_gold_awards
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_selfimprover
		fetcher = quickplay_get_target_info
		Field = targetting_player
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_selfimprover
		fetcher = quickplay_get_target_info
		Field = target
		comparator = self
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_selfimprover
		fetcher = quickplay_get_target_info
		Field = Result
		comparator = success
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_championofchallenges
		fetcher = quickplay_get_award_info
		Field = total_new_above_gold_awards
		comparator = 1
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_championofchallenges
		fetcher = quickplay_get_target_info
		Field = targetting_player
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_championofchallenges
		fetcher = quickplay_get_target_info
		Field = target
		comparator = other
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_championofchallenges
		fetcher = quickplay_get_target_info
		Field = Result
		comparator = success
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_playeroftheearworm
		fetcher = get_song_data
		Field = num_times_played
		comparator = 10
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_ultimateanswerer
		fetcher = get_award_point_data
		Field = remaining_awards
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_alteredvirtuoso
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_alteredvirtuoso
		fetcher = ach_get_song_stars
		Field = stars
		comparator = 40
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = avatarassetaward_avt_tshirt1
		fetcher = ach_get_song_stars
		Field = stars
		comparator = 0
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = achievement_poorboys
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_poorboys
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = bohemianrhapsody
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_poorboys
		fetcher = ach_get_difficulties_vocals
		Field = num_medium_or_higher
		comparator = 2
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = rush2112p4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = ach_get_difficulties
		Field = num_medium_or_higher
		comparator = 3
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = get_band_config
		Field = num_guitars
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = get_band_config
		Field = num_bass
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = get_band_config
		Field = num_vocals
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		Name = achievement_themeek
		fetcher = get_band_config
		Field = num_drums
		comparator = 2
		condition_test = ach_check_less_than
		check_time = end_song
	}
	{
		Name = achievement_giantslayer
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_giantslayer
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_giantslayer
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = holywars
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_giantslayer
		fetcher = getplayerinfo
		Field = part
		comparator = bass
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_giantslayer
		fetcher = ach_get_difficulties
		Field = num_hard_or_higher
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_chosenone
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_chosenone
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_chosenone
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = furyofthestorm
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_chosenone
		fetcher = getplayerinfo
		Field = part
		comparator = drum
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_chosenone
		fetcher = ach_get_difficulties
		Field = num_hard_or_higher
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_handmutilator
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 4096
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_handmutilator
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_handmutilator
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = blackwidow
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_handmutilator
		fetcher = getplayerinfo
		Field = part
		comparator = guitar
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_handmutilator
		fetcher = ach_get_difficulties
		Field = num_expert
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_handmutilator
		fetcher = quickplay_using_powers
		Field = using_powers
		comparator = 0
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thetrickster
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_thetrickster
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = spiderman
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thetrickster
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thedynamo
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_thedynamo
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = uprising
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thedynamo
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thesiren
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_thesiren
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = beencaughtstealing
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thesiren
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_therecluse
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_therecluse
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = childrenofthegrave
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_therecluse
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_axeclaimer
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_axeclaimer
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = rush2112p7
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_axeclaimer
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = avatarassetaward_avt_legendary
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = avatarassetaward_avt_legendary
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = rush2112p7
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = avatarassetaward_avt_legendary
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = achievement_theexalted
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_theexalted
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = bodies
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_theexalted
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thebrute
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_thebrute
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = paranoid
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thebrute
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thevigil
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_thevigil
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = renegade
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_thevigil
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_theeternal
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_theeternal
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = batcountry
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_theeternal
		fetcher = quest_chapter_totals_primary
		Field = just_completed
		comparator = true
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_divineliberator
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_divineliberator
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = thisdaywefight
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = avatarassetaward_avt_helmet
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = avatarassetaward_avt_helmet
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = thisdaywefight
		condition_test = ach_check_equality
		check_time = end_song
		award_type = unlock_avatar
	}
	{
		Name = achievement_saviorofrock
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 256
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_saviorofrock
		fetcher = playlist_getcurrentsong
		Field = current_song
		comparator = suddendeathgh6career
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_pseudoperfectionist
		fetcher = getprevnumdominatedregchapters
		Field = number_of_dominated_chapters
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_pseudoperfectionist
		fetcher = quest_chapter_totals_primary
		Field = number_of_dominated_regular_chapters
		comparator = 2
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_partialperfectionist
		fetcher = getprevnumdominatedregchapters
		Field = number_of_dominated_chapters
		comparator = 3
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_partialperfectionist
		fetcher = quest_chapter_totals_primary
		Field = number_of_dominated_regular_chapters
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_perfectperfectionist
		fetcher = getprevnumdominatedregchapters
		Field = number_of_dominated_chapters
		comparator = 8
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_perfectperfectionist
		fetcher = quest_chapter_totals_primary
		Field = number_of_dominated_regular_chapters
		comparator = 9
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_roadieapprentice
		fetcher = get_achievement_info
		Field = roadie_battle_coop_games_played
		comparator = 3
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiebattler
		fetcher = get_achievement_info
		Field = roadie_battle_competitive_games_played
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiewizard
		fetcher = get_achievement_info
		Field = roadie_battle_total_games_played
		comparator = 20
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiesabotuer
		fetcher = get_achievement_info
		Field = roadie_battle_total_imps_summoned
		comparator = 250
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiesorceror
		fetcher = roadie_battle_get_roadie_stats
		Field = roadie_score
		comparator = 75000
		condition_test = ach_check_greater_than_equal_to
		check_time = roadie_stats_received
	}
	{
		Name = achievement_roadiebackup
		fetcher = getplayerinfo
		Field = roadie_battle_roadie_index
		comparator = -1
		condition_test = ach_check_not_equal
		check_time = end_song
	}
	{
		Name = achievement_roadiebackup
		fetcher = getplayerinfo
		Field = score
		comparator = 300000
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiemultiplier
		fetcher = getplayerinfo
		Field = roadie_battle_roadie_index
		comparator = -1
		condition_test = ach_check_not_equal
		check_time = during_song
		early_out
	}
	{
		Name = achievement_roadiemultiplier
		fetcher = getplayerinfo
		Field = multiplier
		comparator = 48
		condition_test = ach_check_greater_than_equal_to
		check_time = during_song
	}
	{
		Name = achievement_roadiewingman
		fetcher = get_achievement_info
		Field = roadie_battle_other_roadie_assists
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiemasterassistant
		fetcher = roadie_battle_calculate_roadie_assist
		Field = assist_percentage
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadiemasterassistant
		fetcher = getplayerinfo
		Field = stars
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadietoeleven
		fetcher = roadie_battle_get_roadie_stats
		Field = roadie_dial_score
		comparator = 11
		condition_test = ach_check_greater_than_equal_to
		check_time = roadie_stats_received
	}
	{
		Name = achievement_roadierescuer
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_roadierescuer
		fetcher = roadie_battle_get_min_assist_percent_all_players
		Field = min_assist_percent
		comparator = 20
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
	{
		Name = achievement_roadierescuer
		fetcher = roadie_battle_get_num_roadies_in_game
		Field = num_roadies
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_roadieteamup
		fetcher = getnumplayersingame
		Field = num_players
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_roadieteamup
		fetcher = roadie_battle_get_num_roadies_in_game
		Field = num_roadies
		comparator = 4
		condition_test = ach_check_equality
		check_time = end_song
	}
	{
		Name = achievement_roadieteamup
		fetcher = roadie_battle_get_min_assist_percent_all_players
		Field = min_assist_percent
		comparator = 50
		condition_test = ach_check_greater_than_equal_to
		check_time = end_song
	}
]
tutorial_achievements_table = [
	{
		Name = achievement_quicklearner
		fetcher = get_gametype_bitfield
		Field = mode
		comparator = 65536
		condition_test = ach_compare_nibbles
		check_time = end_song
	}
	{
		Name = achievement_quicklearner
		fetcher = ach_fullcombo_test
		Field = passed
		comparator = 1
		condition_test = ach_check_equality
		check_time = end_song
	}
]
feed_achievements_table = [
	{
		Name = achievement_trackerofdeeds
		fetcher = get_achievement_info
		Field = ff_clicks
		comparator = 5
		condition_test = ach_check_greater_than_equal_to
		check_time = feed_update
	}
]
songlist_based_achievements = [
	{
		Name = achievement_anthemicarchivist
		fetcher = get_cached_content_size
		Field = content_size
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
	Change g_current_song = <current_song>
	quest_chapter_totals_primary
	Change g_number_of_dominated_chapters = <number_of_dominated_chapters>
	Change g_number_of_dominated_regular_chapters = <number_of_dominated_regular_chapters>
	if should_update_achievements
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			<first_player> = <Player>
			begin
			getplayerinfo <Player> controller
			getplayerinfo <Player> bot_play
			if (1 = <bot_play>)
				getplayerinfo <Player> bot_original_controller out = controller
			endif
			<ach_array> = achievements_table
			gamemode_gettype
			if (<Type> = tutorial)
				<ach_array> = tutorial_achievements_table
			endif
			createachievementrequirements controller = <controller> arr = <ach_array>
			GetArraySize $<ach_array>
			i = 0
			begin
			extendcrcplayer (($<ach_array> [<i>]).Name) <Player> out = ach_id
			if StructureContains structure = ($<ach_array> [<i>]) first_player_only
				<first_player_only> = true
			else
				<first_player_only> = FALSE
			endif
			if ((($<ach_array> [<i>].check_time) = during_song) && ((<first_player_only> = FALSE) || (<Player> = <first_player>)))
				SpawnScriptNow in_song_achievement_test params = {($<ach_array> [<i>]) Player = <Player> controller = <controller> time = beginsong script_id = <ach_id>} id = <ach_id>
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			getnextplayer Player = <Player> local
			repeat <num_players>
			Block \{Type = event_endsong_check_achievements}
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			getplayerinfo <Player> bot_play
			if (1 = <bot_play>)
				getplayerinfo <Player> bot_original_controller out = controller
			endif
			<ach_array> = achievements_table
			gamemode_gettype
			if (<Type> = tutorial)
				<ach_array> = tutorial_achievements_table
			endif
			GetArraySize $<ach_array>
			i = 0
			begin
			Name = (($<ach_array> [<i>]).Name)
			extendcrcplayer <Name> <Player> out = ach_id
			if (($<ach_array> [<i>].check_time) = roadie_stats_received)
				SpawnScriptNow {
					roadie_battle_delayed_achievement_test
					params = {($<ach_array> [<i>]) Player = <Player> controller = <controller> time = roadie_stats_received}
				}
			else
				if achievement_test ($<ach_array> [<i>]) Player = <Player> controller = <controller> time = endsong
				else
					i2 = (<i> + 1)
					begin
					if (<i2> = <array_Size>)
						break
					endif
					next_name = (($<ach_array> [<i2>]).Name)
					if (<next_name> = <Name>)
						<i> = (<i> + 1)
						<i2> = (<i2> + 1)
					else
						break
					endif
					repeat
				endif
			endif
			<i> = (<i> + 1)
			if (<i> = <array_Size>)
				break
			endif
			Mod a = <i> b = 20
			if (<Mod> = 0)
				Wait \{1
					gameframe}
			endif
			repeat
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
	endif
endscript

script should_update_achievements 
	if demobuild
		return \{FALSE}
	endif
	if NOT isbandcheating
		gamemode_gettype
		if ((<Type> != freeplay) && ($game_mode != training) && ($game_mode != practice) && ($calibrate_lag_enabled = 0))
			if InNetGame
				if sessionisover
					return \{FALSE}
				endif
			endif
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script song_won_update_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 1)
		gamemode_gettype
		if (<Type> = quickplay)
			getplayerinfo <Player> Band
			getbandinfo <Band> stars
			if (<stars> >= 5)
				Change g_songlist_num_5star_songs = ($g_songlist_num_5star_songs + 1)
			endif
		endif
	endif
	if ((isps3) || (isngc))
		song_won_update_achievement_counters Player = <Player>
	else
		begin
		song_won_update_achievement_counters Player = <Player>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	broadcastevent \{Type = event_endsong_check_achievements}
	unpausespawnedscript \{init_achievements}
	Wait \{10
		gameframes}
endscript

script test_achievements 
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		getplayerinfo <Player> controller
		createachievementrequirements controller = <controller> arr = <array_name>
		GetArraySize $<array_name>
		i = 0
		begin
		achievement_test ($<array_name> [<i>]) Player = <Player> controller = <controller>
		<i> = (<i> + 1)
		repeat <array_Size>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
endscript

script test_feed_achievements 
	kill_all_achievement_scripts
	createachievementrequirements controller = <controller> arr = feed_achievements_table
	GetArraySize \{$feed_achievements_table}
	i = 0
	begin
	achievement_test ($feed_achievements_table [<i>]) Player = -1 controller = <controller>
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script test_songlist_based_achievements \{controller = 0}
	kill_all_achievement_scripts
	test_achievements \{array_name = songlist_based_achievements}
endscript

script kill_all_achievement_scripts 
	KillSpawnedScript \{Name = in_song_achievement_test}
	KillSpawnedScript \{Name = roadie_battle_delayed_achievement_test}
endscript

script in_song_achievement_test 
	achievement_test <...>
endscript

script roadie_battle_delayed_achievement_test \{time = !q1768515945}
	if NOT inroadiebattlemode
		return
	endif
	if (<time> = roadie_stats_received)
		roadie_battle_wait_for_stats_received
	endif
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
		params = {Player = <Player> <Field>}
		case getbandinfo
		getplayerinfo <Player> Band
		params = {<Band> <Field>}
		case GetGlobalTags
		get_savegame_from_controller controller = <controller>
		params = {savegame = <savegame> param = <Field>}
		case num_players_in_star_power
		getfirstplayer \{on_screen}
		params = {Player = <Player>}
		case roadie_battle_get_roadie_stats
		getplayerinfo Player = <Player> roadie_battle_roadie_index
		if (<roadie_battle_roadie_index> = -1)
			return
		endif
		params = {roadie = <roadie_battle_roadie_index> param = <Field> return_param = term_a}
		default
		params = {fetch_func = <fetcher> Player = <Player> controller = <controller> Field = <Field>}
		<fetcher> = fetchachievementdata
	endswitch
	if (<check_time> = during_song)
		if GotParam \{time}
			if (<time> = endsong)
				return
			endif
		endif
		WaitOneGameFrame
		begin
		<fetcher> <params> out = term_a
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass Name = <Name> controller = <controller> award_type = <award_type>
			break
		else
			if GotParam \{early_out}
				KillSpawnedScript id = <script_id>
			endif
		endif
		WaitOneGameFrame
		repeat
	else
		if (<check_time> = end_song)
			if GotParam \{time}
				if (<time> = beginsong)
					return
				endif
			endif
		endif
		if (<check_time> = begin_song)
			if GotParam \{time}
				if (<time> = endsong)
					return
				endif
			endif
		endif
		<fetcher> <params> out = term_a
		if gettype \{Name = comparator}
			if (<Type> = int)
				if gettype \{Name = term_a}
					if (<Type> = float)
						CastToInteger \{term_a}
					endif
				endif
			endif
		endif
		if <condition_test> term_a = <term_a> term_b = <comparator>
			achievement_test_pass Name = <Name> controller = <controller> award_type = <award_type>
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script achievement_test_pass 
	get_achievement_structure achievement_name = <Name> controller = <controller>
	SetArrayElement ArrayName = <achievement_structure> globalarray index = 1 NewValue = (($<achievement_structure> [1]) + 1)
	if (($<achievement_structure> [0]) = ($<achievement_structure> [1]))
		finalprintf qs(0xa95b969a) a = <Name>
		fire_achievement Name = <Name> controller = <controller> Type = <award_type>
	endif
endscript

script ach_check_equality 
	if (<term_a> = <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_check_greater_than_equal_to 
	if (<term_a> >= <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_check_greater_than 
	if (<term_a> > <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_check_less_than 
	if (<term_a> < <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_compare_nibbles 
	if NOT (<term_a> && <term_b>)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script ach_check_not_equal 
	if NOT (<term_a> = <term_b>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ach_check_multiple_of 
	Mod a = <term_a> b = <term_b>
	if (<Mod> = 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script get_achievement_structure 
	formatText TextName = controller_suffix '_%d' d = <controller>
	ExtendCrc <achievement_name> <controller_suffix> out = achievement_structure
	return achievement_structure = <achievement_structure>
endscript

script fire_achievement \{Type = achievement
		controller = !i1768515945}
	if demobuild
		return \{FALSE}
	endif
	printf 'Fire achievement %s for controller %d type %t' s = <Name> d = <controller> t = <Type>
	if isngc
		if (<Type> = achievement)
			if NOT is_achievement_unlocked achievement_name = <Name>
				if getachievementtitletext achievement_name = <Name>
					formatText TextName = text qs(0x568ac274) s = <title_text>
					displaynotification text = <text> position = bottomcenter Type = award
					WriteAchievements achievement = <Name> controller_id = <controller>
					broadcastevent Type = wiiward_unlocked data = {Player = 1 controller_index = <controller> wiiward_name = <Name>}
				endif
			endif
		endif
	else
		if (<Type> = achievement)
			WriteAchievements achievement = <Name> controller_id = <controller>
		elseif (<Type> = unlock_avatar)
			unlockavatar avatar_asset = <Name> controller_id = <controller>
		endif
	endif
endscript

script quickplay_using_powers 
	if gman_ispowerscoreenabled
		return \{using_powers = 1}
	else
		return \{using_powers = 0}
	endif
endscript

script ach_get_song_stars 
	getplayerinfo <Player> Band
	getbandinfo <Band> projected_song_stars
	return stars = <projected_song_stars>
endscript

script ach_get_difficulties \{part = None}
	num_beginner = 0
	num_easy = 0
	num_medium = 0
	num_hard = 0
	num_expert = 0
	getnumplayersingame
	getfirstplayer
	begin
	if NOT (<part> = None)
		getplayerinfo <Player> part out = current_part
	else
		current_part = None
	endif
	if (<part> = <current_part>)
		getplayerinfo <Player> difficulty
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
			ScriptAssert qs(0xd06add8c) s = <part>
		endswitch
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
	num_medium_or_higher = (<num_medium> + <num_hard> + <num_expert>)
	num_hard_or_higher = (<num_hard> + <num_expert>)
	return num_beginner = <num_beginner> num_easy = <num_easy> num_medium = <num_medium> num_hard = <num_hard> num_expert = <num_expert> num_medium_or_higher = <num_medium_or_higher> num_hard_or_higher = <num_hard_or_higher>
endscript

script ach_get_difficulties_vocals 
	ach_get_difficulties \{part = vocals}
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
		<just_completed> = FALSE
	endif
	return <...>
endscript

script quickplay_get_award_info \{Player = !i1768515945}
	gold_awards = 0
	diamond_awards = 0
	platinum_awards = 0
	new_gold_awards = 0
	new_diamond_awards = 0
	new_platinum_awards = 0
	total_awards = 0
	total_new_awards = 0
	total_new_above_gold_awards = 0
	quickplay_get_overall_awards_progress Player = <Player>
	if NOT gman_ispowerscoreenabled
		quickplay_get_challenge_outro_stats Player = <Player>
		fastgetarraysize array = (<player_challenge_stats>)
		if (<array_Size> > 0)
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
			repeat <array_Size>
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
	quickplay_get_overall_awards_progress Player = <Player>
	if NOT gman_ispowerscoreenabled
		quickplay_get_challenge_outro_stats \{Player = 0}
		GetArraySize <player_challenge_stats>
		if (<array_Size> > 0)
			<i> = 0
			begin
			<current_level> = ((<player_challenge_stats> [<i>]).challenge_grade)
			if (<current_level> > 0)
				<num_band> = (<num_band> + 1)
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		getnumplayersingame
		getfirstplayer
		begin
		getplayerinfo <Player> part
		quickplay_get_challenge_outro_stats Player = <Player>
		GetArraySize <player_challenge_stats>
		if (<array_Size> > 0)
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
						ScriptAssert qs(0x1aad6e58) s = <part>
					endswitch
				endif
				if (<current_level> > 1)
					if NOT (<current_level> = <previous_level>)
						<total_new_above_gold_awards> = (<total_new_above_gold_awards> + 1)
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		getnextplayer Player = <Player>
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

script quickplay_get_target_info 
	targetting = 0
	targetting_player = 0
	target = NULL
	Result = NULL
	if GMan_GoalIsActive \{goal = quickplay}
		gman_getdata \{goal = quickplay
			Name = targeted_challenge}
		if NOT checksumequals a = <targeted_challenge> b = NULL
			<targetting> = 1
			quickplay_targeting_player_get_result
			if NOT checksumequals a = <Result> b = not_targeting_player
				<targetting_player> = 1
				quickplay_targeting_player_get_opponent_gamertag
				<opponent_gamertag> = <gamertag>
				NetSessionFunc func = get_gamertag params = {controller = <controller>}
				if (<opponent_gamertag> = <Name>)
					<target> = self
				else
					<target> = other
				endif
			endif
		endif
	endif
	return targetting = <targetting> targetting_player = <targetting_player> target = <target> Result = <Result>
endscript

script get_playlist_info 
	return num_5star_songs = ($g_songlist_num_5star_songs) is_random = ($g_songlist_random_playlist) infinite = ($g_songlist_infinite_playlist)
endscript

script get_band_config 
	num_guitars = 0
	num_bass = 0
	num_drums = 0
	num_vocals = 0
	getnumplayersingame
	getfirstplayer
	begin
	getplayerinfo <Player> part
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
		ScriptAssert qs(0x1aad6e58) s = <part>
	endswitch
	getnextplayer Player = <Player>
	repeat <num_players>
	return num_guitars = <num_guitars> num_bass = <num_bass> num_drums = <num_drums> num_vocals = <num_vocals>
endscript

script get_scores_all_match 
	all_match = 0
	getnumplayersingame
	if (<num_players> > 1)
		<all_match> = 1
		getfirstplayer
		getplayerinfo <Player> score out = compare_score
		getnextplayer Player = <Player>
		begin
		getplayerinfo <Player> score
		if NOT (<score> = <compare_score>)
			<all_match> = 0
			break
		endif
		getnextplayer Player = <Player>
		repeat (<num_players> - 1)
	endif
	return all_match = <all_match>
endscript

script get_achievement_info 
	get_savegame_from_controller controller = <controller>
	GetGlobalTags achievement_info savegame = <savegame> param = <Field>
	return <...>
endscript

script get_gametype_bitfield 
	mode = 0
	gamemode_gettype
	switch (<Type>)
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
		ScriptAssert qs(0x66bb1769) s = <Type>
	endswitch
	return <mode>
endscript

script song_won_update_achievement_counters 
	gamemode_gettype
	getnumplayersingame
	get_savegame_from_player Player = <Player>
	achievement_global_tags = {}
	if inroadiebattlemode
		GetGlobalTags achievement_info savegame = <savegame> param = roadie_battle_total_games_played
		achievement_global_tags = {<achievement_global_tags> roadie_battle_total_games_played = (<roadie_battle_total_games_played> + 1)}
		switch ($roadie_battle_mode)
			case coop
			GetGlobalTags achievement_info savegame = <savegame> param = roadie_battle_coop_games_played
			achievement_global_tags = {<achievement_global_tags> roadie_battle_coop_games_played = (<roadie_battle_coop_games_played> + 1)}
			case competitive
			GetGlobalTags achievement_info savegame = <savegame> param = roadie_battle_competitive_games_played
			achievement_global_tags = {<achievement_global_tags> roadie_battle_competitive_games_played = (<roadie_battle_competitive_games_played> + 1)}
			default
			ScriptAssert \{'unhandled roadie battle mode %m'
				m = $roadie_battle_mode}
		endswitch
		SetGlobalTags achievement_info savegame = <savegame> params = <achievement_global_tags>
		return
	endif
	switch (<Type>)
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
			case PERFECTIONIST
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
			case roadie_battle
			<do_nothing> = true
			default
			ScriptAssert qs(0xa6d815a7) s = ($competitive_rules)
		endswitch
		case career
		achievement_global_tags = {<achievement_global_tags> played_career = 1}
		case tutorial
		printf \{qs(0x05111391)}
		case freeplay
		printf \{'Ignoring achievement info in freeplay mode'}
		default
		ScriptAssert qs(0xa6d815a7) s = <Type>
	endswitch
	if (<Type> = quickplay)
		GetGlobalTags achievement_info savegame = <savegame> param = quickplay_songs_completed
		achievement_global_tags = {<achievement_global_tags> quickplay_songs_completed = (<quickplay_songs_completed> + 1)}
	elseif (($is_network_game = 1) && (<Type> = competitive) && ($competitive_rules = faceoff))
		GetGlobalTags achievement_info savegame = <savegame> param = online_pro_faceoff_games_played
		achievement_global_tags = {<achievement_global_tags> online_pro_faceoff_games_played = (<online_pro_faceoff_games_played> + 1)}
	endif
	if (($game_mode = fest_mode) && (<num_players> = 4))
		GetGlobalTags achievement_info savegame = <savegame> param = four_player_shredfest_games_played
		achievement_global_tags = {<achievement_global_tags> four_player_shredfest_games_played = (<four_player_shredfest_games_played> + 1)}
	endif
	if (<Type> = career)
		GetGlobalTags achievement_info savegame = <savegame> param = quest_star_power_deployed
		getplayerinfo <Player> star_power_use_count
		achievement_global_tags = {<achievement_global_tags> quest_star_power_deployed = (<quest_star_power_deployed> + <star_power_use_count>)}
		GetGlobalTags achievement_info savegame = <savegame> param = quest_notes_hit
		getplayerinfo <Player> notes_hit
		achievement_global_tags = {<achievement_global_tags> quest_notes_hit = (<quest_notes_hit> + <notes_hit>)}
		GetGlobalTags achievement_info savegame = <savegame> param = quest_score
		getplayerinfo <Player> score
		achievement_global_tags = {<achievement_global_tags> quest_score = (<quest_score> + <score>)}
	endif
	if (<num_players> = 1)
		if (<Type> = quickplay)
			getplayerinfo <Player> stars
			if (<stars> >= 5)
				Change g_songlist_num_5star_songs = ($g_songlist_num_5star_songs + 1)
			endif
		endif
	endif
	printf qs(0x7507ebe3) d = <Player> a = <savegame>
	printstruct <achievement_global_tags>
	SetGlobalTags achievement_info savegame = <savegame> params = <achievement_global_tags>
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
	getplayerinfo <Player> part
	playlist_getcurrentsong
	passed = 1
	if (<current_song> = jamsession)
		<passed> = 0
	else
		GetSongTimeMs
		songfilemanager func = get_song_end_time song_name = <current_song>
		if ((<total_end_time> <= 0) || (<time> < <total_end_time>))
			<passed> = 0
		else
			if (<part> != vocals)
				getplayerinfo <Player> notes_hit
				getplayerinfo <Player> total_notes
				getplayerinfo <Player> max_notes
				getplayerinfo <Player> unnecessary_notes
				if ((<notes_hit> < <total_notes>) || (<total_notes> = 0) || (<unnecessary_notes> > 0))
					<passed> = 0
				endif
			else
				getplayerinfo <Player> vocal_phrase_quality
				getplayerinfo <Player> vocal_phrase_max_qual
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
		GetGlobalTags <song_id> param = num_times_played savegame = <savegame>
	else
		<num_times_played> = 0
	endif
	return num_times_played = <num_times_played>
endscript

script get_award_point_data \{controller = !i1768515945}
	if NOT song_is_jamsession song = ($last_song_played)
		get_savegame_from_controller controller = <controller>
		quickplay_get_awards_for_song song_name = ($last_song_played) savegame = <savegame> controller = <controller>
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
	getplayerinfo <Player> star_power_used
	if (<star_power_used> = 1)
		<players_in_star_power> = (<players_in_star_power> + 1)
	else
		break
	endif
	getnextplayer Player = <Player> on_screen
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
		getplayerinfo <Player> part
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
			ScriptAssert qs(0x03695c6c) s = <part>
		endswitch
		getnextplayer Player = <Player>
		repeat <num_players>
		printstruct <...>
		if ((<num_lead> = 1) && (<num_bass> = 1) && (<num_vocal> = 1) && (<num_drum> = 1))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

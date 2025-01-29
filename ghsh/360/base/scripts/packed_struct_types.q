
script init_packed_structs \{globaltag_sets = 1}
	GetArraySize ($gh_songlist)
	num_songs = (<array_Size> + 255)
	num_parts = 5
	num_diffs = 5
	num_completetags = 64
	num_unlockedtags = (<num_songs> * <num_parts> * <num_diffs> * 2)
	num_se_gig_tags = 128
	num_gigtags = 1200
	num_charactertags = 16
	num_songtags_scores = (<num_songs> * <num_parts> * <num_diffs>)
	num_songtags_lean = (<num_songs>)
	GetArraySize ($preset_musician_profiles_modifiable)
	num_preset_profiles = <array_Size>
	packed_compression = (2.0 / 3.0)
	PushMemProfile \{'packedstructs'}
	setuppackedstructtypes {
		types =
		[
			{
				Name = createarocker
				pool_size = (<globaltag_sets> * ($max_num_create_a_rockers))
				buffer_size = (21000 * <packed_compression>)
			}
			{
				Name = presetcars
				pool_size = (<globaltag_sets> * <num_preset_profiles>)
				buffer_size = (13500 * <packed_compression>)
			}
			{
				Name = logos
				pool_size = (<globaltag_sets> * ($max_num_logo_saves))
				buffer_size = (1750 * <packed_compression>)
			}
			{
				Name = guitars
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				Name = basses
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				Name = drums
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (2000 * <packed_compression>)
			}
			{
				Name = vocals
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = 150
			}
			{
				Name = completetags
				pool_size = (<num_completetags> * <globaltag_sets>)
				fields =
				[
					{
						Name = complete
						Type = bool
					}
				]
			}
			{
				Name = unlockedtags
				pool_size = (<num_unlockedtags> * <globaltag_sets>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
				]
			}
			{
				Name = gigtags
				pool_size = (<num_gigtags> * <globaltag_sets>)
				fields =
				[
					{
						Name = cash_earned
						Type = int
						low_limit = 0
						high_limit = 1
					}
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = first_time_unlocked
						Type = bool
					}
					{
						Name = completed
						Type = int
						low_limit = -1
						high_limit = 3
						default_value = 0
					}
					{
						Name = started
						Type = bool
					}
					{
						Name = encore_unlocked
						Type = bool
					}
					{
						Name = boss_unlocked
						Type = bool
					}
				]
			}
			{
				Name = charactertags
				pool_size = (<num_charactertags> * <globaltag_sets>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = unlocked_for_purchase
						Type = bool
					}
				]
			}
			{
				Name = songtags_scores
				pool_size = (<num_songtags_scores> * <globaltag_sets>)
				fields =
				[
					{
						Name = names
						Type = wstring
						max_length = ($tr_max_band_characters)
						array_Size = 3
					}
					{
						Name = scores
						Type = int
						low_limit = 0
						high_limit = 16777215
						array_Size = 3
					}
					{
						Name = tr_stars
						Type = int
						low_limit = 0
						high_limit = 5
						array_Size = 3
					}
					{
						Name = bestscore
						Type = int
						low_limit = 0
						high_limit = 16777215
					}
					{
						Name = beststars
						Type = int
						low_limit = 0
						high_limit = 5
					}
					{
						Name = tr_percent100
						Type = bool
					}
					{
						Name = tr_double_bass_complete
						Type = bool
					}
					{
						Name = double_bass_complete
						Type = bool
					}
					{
						Name = achievement_gold_star
						Type = bool
					}
					{
						Name = stars
						Type = int
						low_limit = 0
						high_limit = 5
					}
					{
						Name = score
						Type = int
						low_limit = 0
						high_limit = 16777215
					}
					{
						Name = percent100
						Type = bool
					}
					{
						Name = song_percent
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = new_song_info
						Type = bool
					}
				]
			}
			{
				Name = songtags_lean
				pool_size = (<num_songtags_lean> * <globaltag_sets>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = available_on_other_client
						Type = int
						low_limit = 0
						high_limit = 8
					}
				]
			}
		]
	}
	PopMemProfile
endscript


script init_packed_structs \{globaltag_sets = 1}
	getarraysize ($gh_songlist)
	num_songs = (<array_size> + 255)
	num_parts = 5
	num_diffs = 5
	num_completetags = 64
	num_unlockedtags = (<num_songs> * <num_parts> * <num_diffs> * 2)
	num_se_gig_tags = 128
	num_gigtags = 1200
	num_charactertags = 16
	num_songtags_scores = (<num_songs> * <num_parts> * <num_diffs>)
	num_songtags_lean = (<num_songs>)
	getarraysize ($preset_musician_profiles_modifiable)
	num_preset_profiles = <array_size>
	packed_compression = (2.0 / 3.0)
	pushmemprofile \{'packedstructs'}
	setuppackedstructtypes {
		types =
		[
			{
				name = createarocker
				pool_size = (<globaltag_sets> * ($max_num_create_a_rockers))
				buffer_size = (21000 * <packed_compression>)
			}
			{
				name = presetcars
				pool_size = (<globaltag_sets> * <num_preset_profiles>)
				buffer_size = (13500 * <packed_compression>)
			}
			{
				name = logos
				pool_size = (<globaltag_sets> * ($max_num_logo_saves))
				buffer_size = (1750 * <packed_compression>)
			}
			{
				name = guitars
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				name = basses
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				name = drums
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (2000 * <packed_compression>)
			}
			{
				name = vocals
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = 150
			}
			{
				name = completetags
				pool_size = (<num_completetags> * <globaltag_sets>)
				fields =
				[
					{
						name = complete
						type = bool
					}
				]
			}
			{
				name = unlockedtags
				pool_size = (<num_unlockedtags> * <globaltag_sets>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
				]
			}
			{
				name = gigtags
				pool_size = (<num_gigtags> * <globaltag_sets>)
				fields =
				[
					{
						name = cash_earned
						type = int
						low_limit = 0
						high_limit = 1
					}
					{
						name = unlocked
						type = bool
					}
					{
						name = first_time_unlocked
						type = bool
					}
					{
						name = completed
						type = int
						low_limit = -1
						high_limit = 3
						default_value = 0
					}
					{
						name = started
						type = bool
					}
					{
						name = encore_unlocked
						type = bool
					}
					{
						name = boss_unlocked
						type = bool
					}
				]
			}
			{
				name = charactertags
				pool_size = (<num_charactertags> * <globaltag_sets>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = unlocked_for_purchase
						type = bool
					}
				]
			}
			{
				name = songtags_scores
				pool_size = (<num_songtags_scores> * <globaltag_sets>)
				fields =
				[
					{
						name = names
						type = wstring
						max_length = ($tr_max_band_characters)
						array_size = 3
					}
					{
						name = scores
						type = int
						low_limit = 0
						high_limit = 16777215
						array_size = 3
					}
					{
						name = tr_stars
						type = int
						low_limit = 0
						high_limit = 5
						array_size = 3
					}
					{
						name = bestscore
						type = int
						low_limit = 0
						high_limit = 16777215
					}
					{
						name = beststars
						type = int
						low_limit = 0
						high_limit = 5
					}
					{
						name = tr_percent100
						type = bool
					}
					{
						name = achievement_gold_star
						type = bool
					}
					{
						name = stars
						type = int
						low_limit = 0
						high_limit = 5
					}
					{
						name = score
						type = int
						low_limit = 0
						high_limit = 16777215
					}
					{
						name = percent100
						type = bool
					}
					{
						name = unlocked
						type = bool
					}
				]
			}
			{
				name = songtags_lean
				pool_size = (<num_songtags_lean> * <globaltag_sets>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = available_on_other_client
						type = int
						low_limit = 0
						high_limit = 8
					}
				]
			}
		]
	}
	popmemprofile
endscript

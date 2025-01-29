unlockable_accessories_text = qs(0x290326a6)
unlockable_bass_text = qs(0xda11c527)
unlockable_bass_h_text = qs(0xd92f56a4)
unlockable_bass_pieces2_text = qs(0x0b254642)
unlockable_character_text = qs(0x36cd37ad)
unlockable_characters_text = qs(0x526a5544)
unlockable_cheats_text = qs(0x01141cc6)
unlockable_drumset_text = qs(0xff9d0283)
unlockable_drumsticks_text = qs(0x1745a4a5)
unlockable_extras_text = qs(0xcd2292f1)
unlockable_guitar_text = qs(0x75228ca3)
unlockable_guitar_h_text = qs(0xad57d918)
unlockable_guitar_pieces2_text = qs(0x20847c62)
unlockable_mic2_text = qs(0xb60c51cf)
unlockable_mic3_text = qs(0xb60c51cf)
unlockable_mic_pieces2_text = qs(0x8828c659)
unlockable_options_text = qs(0x98f68461)
unlockable_outfit_text = qs(0xcc637188)
unlockable_pack_text = qs(0x48d09a56)
unlockable_pants2_text = qs(0x982b950e)
unlockable_shoes2_text = qs(0x4faad679)
unlockable_top2_text = qs(0xd2b66773)
unlockable_venues_text = qs(0xbdf350a0)
venue_progression = [
	{
		venue_to_unlock = load_Z_Mall
		stars_required = 0
	}
	{
		venue_to_unlock = load_Z_Montreux
		stars_required = 15
	}
	{
		venue_to_unlock = load_Z_Cabo
		stars_required = 30
	}
	{
		venue_to_unlock = load_Z_CentralPark
		stars_required = 45
	}
	{
		venue_to_unlock = load_Z_Tokyo
		stars_required = 60
	}
	{
		venue_to_unlock = load_Z_EasterIsland
		stars_required = 75
	}
	{
		venue_to_unlock = load_Z_AwardShow
		stars_required = 90
	}
	{
		venue_to_unlock = load_Z_Gorge
		stars_required = 105
	}
	{
		venue_to_unlock = load_Z_Paris
		stars_required = 120
	}
	{
		venue_to_unlock = load_Z_Space
		stars_required = 135
	}
]
gig_progression = [
	{
		gig_to_unlock = c_ABC
		requires_venue_stars = 6
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_AmericanPie
		unlocked_with_venue
		current_venue = load_Z_Cube
	}
	{
		gig_to_unlock = c_AMillionWays
		unlocked_with_venue
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_AngelsOfTheSilences
		unlocked_with_venue
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_BackAgain
		unlocked_with_venue
		current_venue = load_Z_Paris
	}
	{
		gig_to_unlock = c_BadReputation
		requires_venue_stars = 6
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_BeautifulSoul
		unlocked_with_venue
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_Believe
		unlocked_with_venue
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_BlackCat
		requires_venue_stars = 9
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_BlackHorseCherryTree
		unlocked_with_venue
		current_venue = load_Z_Paris
	}
	{
		gig_to_unlock = c_BringMeToLife
		unlocked_with_venue
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_DirtyLittleSecret
		unlocked_with_venue
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_DoYouReally
		unlocked_with_venue
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_DontSpeak
		requires_venue_stars = 6
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_EveryRoseHasItsThorn
		unlocked_with_venue
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_Fascination
		unlocked_with_venue
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_Gasoline
		unlocked_with_venue
		current_venue = load_Z_Space
	}
	{
		gig_to_unlock = c_HandsDown
		unlocked_with_venue
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_HangMeUpToDry
		unlocked_with_venue
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_HappyTogether
		unlocked_with_venue
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_HonkeyTonkWomen
		requires_venue_stars = 9
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_IfYouCouldOnlySee
		unlocked_with_venue
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_IHeardItThrough
		requires_venue_stars = 6
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_IWantYouToWantMe
		unlocked_with_venue
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_InABigCountry
		unlocked_with_venue
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_JustAGirl
		requires_venue_stars = 6
		current_venue = load_Z_Paris
	}
	{
		gig_to_unlock = c_Kids
		unlocked_with_venue
		current_venue = load_Z_Paris
	}
	{
		gig_to_unlock = c_KungFuFighting
		unlocked_with_venue
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_LesArtistes
		unlocked_with_venue
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_LetsDance
		requires_venue_stars = 6
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_LikeWhoa
		unlocked_with_venue
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_Lifeline
		requires_venue_stars = 9
		current_venue = load_Z_Paris
	}
	{
		gig_to_unlock = c_LipsOfAnAngel
		unlocked_with_venue
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_LoveIsABattlefield
		unlocked_with_venue
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_LoveStory
		requires_venue_stars = 6
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_MrRoboto
		requires_venue_stars = 9
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_Naive
		unlocked_with_venue
		current_venue = load_Z_Space
	}
	{
		gig_to_unlock = c_OceanAve
		unlocked_with_venue
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_PrettyWoman
		requires_venue_stars = 6
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_OurLipsAreSealed
		unlocked_with_venue
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_Paralyzer
		unlocked_with_venue
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_PictureToBurn
		requires_venue_stars = 6
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_PicturesOfYou
		unlocked_with_venue
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_PutYourRecordsOn
		unlocked_with_venue
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_Rio
		requires_venue_stars = 9
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_Rockstar
		unlocked_with_venue
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_SantaMonica
		unlocked_with_venue
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_SheWillBeLoved
		requires_venue_stars = 6
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_SoYesterday
		unlocked_with_venue
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_Special_BandHero
		unlocked_with_venue
		current_venue = load_Z_Cube
	}
	{
		gig_to_unlock = c_Sponsor_Ahead
		requires_venue_stars = 12
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_Sponsor_AudioTechnica
		requires_venue_stars = 9
		current_venue = load_Z_Mall
	}
	{
		gig_to_unlock = c_Sponsor_BCRich
		requires_venue_stars = 12
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_Sponsor_DaisyRock
		requires_venue_stars = 9
		current_venue = load_Z_Montreux
	}
	{
		gig_to_unlock = c_Sponsor_ErnieBall
		requires_venue_stars = 12
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_Sponsor_ESP
		requires_venue_stars = 9
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_Sponsor_EMG
		requires_venue_stars = 9
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_Sponsor_Ibanez
		requires_venue_stars = 12
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_Sponsor_McSwain
		requires_venue_stars = 12
		current_venue = load_Z_Paris
	}
	{
		gig_to_unlock = c_Sponsor_PorkPie
		requires_venue_stars = 12
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_Sponsor_PRS
		requires_venue_stars = 12
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_Sponsor_Schecter
		requires_venue_stars = 12
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_Sponsor_SeymourDuncan
		requires_venue_stars = 12
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_Sponsor_Tama
		requires_venue_stars = 12
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_Sponsor_Zildjian
		requires_venue_stars = 12
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_StealMyKisses
		unlocked_with_venue
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_SugarWereGoingDown
		requires_venue_stars = 9
		current_venue = load_Z_Tokyo
	}
	{
		gig_to_unlock = c_TakeAPicture
		unlocked_with_venue
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_TakeBackTheCity
		unlocked_with_venue
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_TakeWhatYouTake
		requires_venue_stars = 6
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_TheAdventure
		requires_venue_stars = 9
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_TheImpressionThatIGet
		requires_venue_stars = 6
		current_venue = load_Z_Space
	}
	{
		gig_to_unlock = c_TurnOffTheLights
		requires_venue_stars = 9
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_WalkingOnSunshine
		requires_venue_stars = 9
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_Wannabe
		unlocked_with_venue
		current_venue = load_Z_Cabo
	}
	{
		gig_to_unlock = c_WarwickAve
		unlocked_with_venue
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_WhenImGone
		unlocked_with_venue
		current_venue = load_Z_EasterIsland
	}
	{
		gig_to_unlock = c_WhipIt
		unlocked_with_venue
		current_venue = load_Z_CentralPark
	}
	{
		gig_to_unlock = c_YMCA
		requires_venue_stars = 9
		current_venue = load_Z_AwardShow
	}
	{
		gig_to_unlock = c_YouBelongWithMe
		requires_venue_stars = 6
		current_venue = load_Z_Gorge
	}
	{
		gig_to_unlock = c_YouHadMe
		unlocked_with_venue
		current_venue = load_Z_Space
	}
]
progression_gig_list = [
	{
		venue = load_Z_Mall
		gig_list = gig_list_Mall
	}
	{
		venue = load_Z_Montreux
		gig_list = gig_list_Montreux
	}
	{
		venue = load_Z_Cabo
		gig_list = gig_list_Cabo
	}
	{
		venue = load_Z_CentralPark
		gig_list = gig_list_CentralPark
	}
	{
		venue = load_Z_Tokyo
		gig_list = gig_list_Tokyo
	}
	{
		venue = load_Z_EasterIsland
		gig_list = gig_list_EasterIsland
	}
	{
		venue = load_Z_AwardShow
		gig_list = gig_list_AwardShow
	}
	{
		venue = load_Z_Gorge
		gig_list = gig_list_Gorge
	}
	{
		venue = load_Z_Paris
		gig_list = gig_list_Paris
	}
	{
		venue = load_Z_Space
		gig_list = gig_list_Space
	}
	{
		venue = load_Z_Cube
		gig_list = gig_list_Cube
	}
]
reward_progression = [
	{
		requires_completed_gig = c_ABC
		requires_completed_difficulty = gold
		frontend_desc = qs(0x1c23d3f5)
		vague_frontend_desc = unlockable_bass_h_text
		unlock_icon = unlockable_bass_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Bass_Body
				desc_id = Bass105_pin
			}
		]
	}
	{
		requires_completed_gig = c_AmericanPie
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xe4628005)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = Cheat_PerformanceMode
	}
	{
		requires_completed_gig = c_AMillionWays
		requires_completed_difficulty = gold
		frontend_desc = qs(0xa9b644e7)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Quinton_3
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Pop_Torso_Quin3
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Pop_Leg_Quin3
			}
		]
	}
	{
		requires_completed_gig = c_AngelsOfTheSilences
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x80fb0bf7)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Rock_hat_halo
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Rock_hat_halo
			}
		]
	}
	{
		requires_completed_gig = c_BackAgain
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xb1df3479)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR103_Hero_manta
			}
		]
	}
	{
		requires_completed_gig = c_BadReputation
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xa259798b)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Pop_Head_WW2Helm
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Pop_Head_WW2Helm
			}
		]
	}
	{
		requires_completed_gig = c_BeautifulSoul
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x64cf763b)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR105_Skull
			}
			{
				part = CAS_Bass_Body
				desc_id = Bass104_Skull
			}
		]
	}
	{
		requires_completed_gig = c_Believe
		requires_completed_difficulty = gold
		frontend_desc = qs(0xbcdd46e5)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Eddie_3
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Rock_Legs_Eddie2
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Rock_Shoe_Eddie2
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Rock_Acc_LEddie2
			}
		]
	}
	{
		requires_completed_gig = c_BlackCat
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x8910f283)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Bmtl_Hat_Viking
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Bmtl_Head_Viking
			}
		]
	}
	{
		requires_completed_gig = c_BlackHorseCherryTree
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x0ec46e0b)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR27_NSFT_Acoustic
			}
		]
	}
	{
		requires_completed_gig = c_BringMeToLife
		requires_completed_difficulty = gold
		frontend_desc = qs(0x485695e2)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Pandora_3
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Goth_Torso_PndrStraps
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Goth_Legs_PndrRose
			}
			{
				part = CAS_Female_Shoes
				desc_id = F_Goth_Shoe_PndrPlats
			}
			{
				part = CAS_Female_Acc_Left
				desc_id = F_Goth_ACC_LPndrBuckles
			}
			{
				part = CAS_Female_Acc_Right
				desc_id = F_Goth_ACC_RPndrBuckles
			}
		]
	}
	{
		requires_completed_gig = c_DirtyLittleSecret
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x52454c38)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Johnny_4
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Punk_Torso_Jstripe
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Punk_Legs_Jzip
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Punk_Acc_LJstudband
			}
		]
	}
	{
		requires_completed_gig = c_DoYouReally
		requires_completed_difficulty = gold
		frontend_desc = qs(0xfece0d3b)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Izzy_3
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Glam_Torso_Mink
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Glam_Legs_Rose
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Glam_Shoes_mart
			}
		]
	}
	{
		requires_completed_gig = c_DontSpeak
		requires_completed_difficulty = None
		frontend_desc = qs(0xe9f63d64)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 8
	}
	{
		requires_completed_gig = c_DontSpeak
		requires_completed_difficulty = None
		frontend_desc = qs(0xe9f63d64)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 9
	}
	{
		requires_completed_gig = c_DontSpeak
		requires_completed_difficulty = None
		frontend_desc = qs(0xe9f63d64)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Shoes
				desc_id = M_Spnr_Shoe_VansL_NDoubt
			}
		]
	}
	{
		requires_completed_gig = c_DontSpeak
		requires_completed_difficulty = gold
		frontend_desc = qs(0xe9f63d64)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Bass_Body
				desc_id = Bass110_Tony1
			}
		]
	}
	{
		requires_completed_gig = c_EveryRoseHasItsThorn
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x250a0bee)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 12
	}
	{
		requires_completed_gig = c_Fascination
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x83fa3e83)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = Cheat_HUDFreeMode
	}
	{
		requires_completed_gig = c_Gasoline
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x432b3273)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Pop_Head_GasMask
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Pop_Head_GasMask
			}
		]
	}
	{
		requires_completed_gig = c_HandsDown
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xef260699)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Female_Acc_Right
				desc_id = F_Goth_Acc_RGlove
			}
			{
				part = CAS_Female_Acc_Left
				desc_id = F_Metl_Acc_LJewlGnlt
			}
			{
				part = CAS_Female_Acc_Right
				desc_id = F_Metl_Acc_RJewlGnlt
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Goth_Acc_LStrait
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Goth_Acc_LStraps
			}
			{
				part = CAS_Male_Acc_Right
				desc_id = M_Clsc_accs_RDrkbnd
			}
			{
				part = CAS_Male_Acc_Right
				desc_id = M_Goth_Acc_warmerR
			}
		]
	}
	{
		requires_completed_gig = c_HangMeUpToDry
		requires_completed_difficulty = gold
		frontend_desc = qs(0x46899a9b)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Johnny_3
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Punk_Legs_Jny_3
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Punk_AccL_Jny_3
			}
		]
	}
	{
		requires_completed_gig = c_HappyTogether
		requires_completed_difficulty = gold
		frontend_desc = qs(0xded8fa1f)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Clive_3
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Clsc_Torso_Clive2
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Clsc_Legs_Clive2
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Clsc_Shoes_Clive2
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Clsc_Acc_L3Rings
			}
			{
				part = CAS_Male_Acc_Right
				desc_id = M_Clsc_Acc_R3Rings
			}
		]
	}
	{
		requires_completed_gig = c_HonkeyTonkWomen
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x98f71df2)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Eddie_4
			}
		]
	}
	{
		requires_completed_gig = c_IHeardItThrough
		requires_completed_difficulty = gold
		frontend_desc = qs(0x812e2cb3)
		vague_frontend_desc = unlockable_drumset_text
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD07`
	}
	{
		requires_completed_gig = c_IWantYouToWantMe
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x10768421)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Clive_4
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Clsc_Torso_Clive3
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Clsc_Legs_Clive3
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Clsc_Shoe_Clive3
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Clsc_Hat_Clive3
			}
		]
	}
	{
		requires_completed_gig = c_IfYouCouldOnlySee
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x09247354)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Female_Hat
				desc_id = F_Fun_Hat_EyeBall
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Fun_Hat_EyeBall
			}
		]
	}
	{
		requires_completed_gig = c_InABigCountry
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x08284de5)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR101_Hero_Ana
			}
		]
	}
	{
		requires_completed_gig = c_JustAGirl
		requires_completed_difficulty = None
		frontend_desc = qs(0x1a4e98dd)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 5
	}
	{
		requires_completed_gig = c_JustAGirl
		requires_completed_difficulty = None
		frontend_desc = qs(0x1a4e98dd)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 7
	}
	{
		requires_completed_gig = c_JustAGirl
		requires_completed_difficulty = None
		frontend_desc = qs(0x1a4e98dd)
		vague_frontend_desc = unlockable_characters_text
		unlock_icon = unlockable_character
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Female_Shoes
				desc_id = F_Spnr_Shoe_VansL_NDoubt
			}
		]
	}
	{
		requires_completed_gig = c_Kids
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xb8e4bb17)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 13
	}
	{
		requires_completed_gig = c_KungFuFighting
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xf6d2e44a)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Hat_Ninja_c1
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Hat_Ninja_c1
			}
		]
	}
	{
		requires_completed_gig = c_LesArtistes
		requires_completed_difficulty = gold
		frontend_desc = qs(0x31648098)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Casey_3
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Rock_Torso_ECCorset
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Rock_Legs_ECChaps
			}
			{
				part = CAS_Female_Shoes
				desc_id = F_Rock_shoe_ECBBoot
			}
		]
	}
	{
		requires_completed_gig = c_LetsDance
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3de9b9b4)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 14
	}
	{
		requires_completed_gig = c_Lifeline
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xffab8b28)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Female_Acc_Face
				desc_id = F_Rock_Glasses_Fly
			}
			{
				part = CAS_Male_Acc_Face
				desc_id = M_Pop_Glasses_BugEyes
			}
		]
	}
	{
		requires_completed_gig = c_LikeWhoa
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x6e49f39a)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = Cheat_AirInstruments
	}
	{
		requires_completed_gig = c_LipsOfAnAngel
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x35cfd256)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Axel_4
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Metl_Torso_Axel3
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Mtl_Legs_Axel3
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Mtl_Shoes_Axel3
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Mtl_AccL_Axel3
			}
		]
	}
	{
		requires_completed_gig = c_LoveIsABattlefield
		requires_completed_difficulty = gold
		frontend_desc = qs(0x7c8fbedc)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR102_Hero_Axe
			}
			{
				part = CAS_Bass_Body
				desc_id = Bass102_Axe
			}
		]
	}
	{
		requires_completed_gig = c_LoveStory
		requires_completed_difficulty = None
		frontend_desc = qs(0x49d2e738)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 2
	}
	{
		requires_completed_gig = c_MrRoboto
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xa91d296f)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = Cheat_AlwaysSlide
	}
	{
		requires_completed_gig = c_Naive
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xf5bff3ef)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Bmtl_Hat_Brain
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Fun_Hat_Chickenmask
			}
		]
	}
	{
		requires_completed_gig = c_OceanAve
		requires_completed_difficulty = gold
		frontend_desc = qs(0x46286dc9)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Judy_3
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Punk_Torso_JudyNails1
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Punk_Legs_JudyNails1
			}
			{
				part = CAS_Female_Shoes
				desc_id = F_Punk_Shoe_JudyNails1
			}
		]
	}
	{
		requires_completed_gig = c_PicturesOfYou
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x790b1485)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR120_KBRD_LP
			}
		]
	}
	{
		requires_completed_gig = c_PrettyWoman
		requires_completed_difficulty = gold
		frontend_desc = qs(0x93686b10)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Female_Acc_Face
				desc_id = F_Clsc_Glasses_WtNose
			}
			{
				part = CAS_Male_Acc_Face
				desc_id = M_Clsc_Glasses_WtNose
			}
		]
	}
	{
		requires_completed_gig = c_OurLipsAreSealed
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3192836f)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Mic
				desc_id = Mic_Dark
			}
		]
	}
	{
		requires_completed_gig = c_Paralyzer
		requires_completed_difficulty = gold
		frontend_desc = qs(0xc52c9ee4)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Mic
				desc_id = Mic_D3414S
			}
		]
	}
	{
		requires_completed_gig = c_PictureToBurn
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x5d8b6727)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR142_G6e_Body02
			}
			{
				part = CAS_Guitar_Body
				desc_id = GTR143_DDSM
			}
		]
	}
	{
		requires_completed_gig = c_PutYourRecordsOn
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xf0919344)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Midori_4
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Pop_Torso_Midori01
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Pop_Legs_Midori01
			}
			{
				part = CAS_Female_Shoes
				desc_id = F_Pop_Shoe_Midori01
			}
			{
				part = CAS_Female_Acc_Left
				desc_id = F_Pop_Acc_LGlove_Midori01
			}
			{
				part = CAS_Female_Acc_Right
				desc_id = F_Pop_Acc_RGlove_Midori01
			}
		]
	}
	{
		requires_completed_gig = c_Rio
		requires_completed_difficulty = gold
		frontend_desc = qs(0xd18267e9)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = Cheat_AutoKick
	}
	{
		requires_completed_gig = c_Rockstar
		requires_completed_difficulty = gold
		frontend_desc = qs(0x72df0e3f)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Axel_3
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Metl_Torso_Axel2GH5
			}
			{
				part = CAS_Male_Acc_Left
				desc_id = M_Metl_AccL_Axel2Gh5
			}
			{
				part = CAS_Male_Acc_Right
				desc_id = M_Metl_AccR_Axel2Gh5
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Metl_Legs_Axel2GH5
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Metl_Shoes_Axel2GH5
			}
		]
	}
	{
		requires_completed_gig = c_SantaMonica
		requires_completed_difficulty = gold
		frontend_desc = qs(0xebbd3ee5)
		vague_frontend_desc = unlockable_bass_h_text
		unlock_icon = unlockable_bass_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Bass_Body
				desc_id = Bass103_Cross
			}
		]
	}
	{
		requires_completed_gig = c_SheWillBeLoved
		requires_completed_difficulty = None
		frontend_desc = qs(0x24db99a5)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 0
	}
	{
		requires_completed_gig = c_SoYesterday
		requires_completed_difficulty = gold
		frontend_desc = qs(0xfe48bccf)
		vague_frontend_desc = unlockable_mic2_text
		unlock_icon = unlockable_mic2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Mic
				desc_id = Mic_Ice_Cream_Cone
			}
		]
	}
	{
		requires_completed_gig = c_StealMyKisses
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe824e7eb)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Quinton_4
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Pop_Torso_Quinton4
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Pop_Legs_Quinton4
			}
		]
	}
	{
		requires_completed_gig = c_SugarWereGoingDown
		requires_completed_difficulty = diamond
		frontend_desc = qs(0xf68058a5)
		vague_frontend_desc = unlockable_character_text
		unlock_icon = unlockable_character
		reward_type = character
		profile_idx = 11
	}
	{
		requires_completed_gig = c_TakeAPicture
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xc03cbe45)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = Cheat_InvisibleCharacters
	}
	{
		requires_completed_gig = c_TakeBackTheCity
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xc0109cea)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Izzy_4
			}
			{
				part = CAS_Male_Torso
				desc_id = M_Glam_Torso_Ljacket
			}
			{
				part = CAS_Male_Legs
				desc_id = M_Glam_Legs_DoubleBelt
			}
			{
				part = CAS_Male_Shoes
				desc_id = M_Glam_Shoe_Cowboy
			}
		]
	}
	{
		requires_completed_gig = c_TakeWhatYouTake
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x2d508775)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Judy_4
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Punk_Torso_JudyNails2
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Punk_Legs_JudyNails2
			}
		]
	}
	{
		requires_completed_gig = c_TheAdventure
		requires_completed_difficulty = None
		frontend_desc = qs(0xdebf11f9)
		vague_frontend_desc = unlockable_venues_text
		unlock_icon = unlockable_venues
		reward_type = venue_reward
		venue_checksum = load_z_visualizer
	}
	{
		requires_completed_gig = c_TheImpressionThatIGet
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x23babcad)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Bmtl_Hat_SkullHelmet
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Bmtl_Hat_Lars4
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Hat_Gorilla
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Rock_Hat_RetroTV
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Fun_Hat_Demon
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Bmtl_Hat_SkullHelmet
			}
		]
	}
	{
		requires_completed_gig = c_TurnOffTheLights
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe9df2a18)
		vague_frontend_desc = unlockable_extras_text
		unlock_icon = unlockable_extras
		reward_type = cheat
		cheat_name = Cheat_FocusMode
	}
	{
		requires_completed_gig = c_WalkingOnSunshine
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x627a20d5)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Pandora_4
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Goth_Torso_PndrTrench
			}
			{
				part = CAS_Female_Shoes
				desc_id = F_Goth_Shoe_PndrSpike
			}
		]
	}
	{
		requires_completed_gig = c_Wannabe
		requires_completed_difficulty = gold
		frontend_desc = qs(0x7c7bd3e2)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Midori_3
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Pop_Torso_Midori02
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Pop_Legs_Midori02
			}
			{
				part = CAS_Female_Shoes
				desc_id = F_Pop_Shoe_Midori02
			}
			{
				part = CAS_Female_Acc_Left
				desc_id = F_Pop_Acc_LGlove_Midori02
			}
			{
				part = CAS_Female_Acc_Right
				desc_id = F_Pop_Acc_RGlove_Midori02
			}
		]
	}
	{
		requires_completed_gig = c_WarwickAve
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x79744504)
		vague_frontend_desc = unlockable_outfit_text
		unlock_icon = unlockable_outfit
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Full_Body
				desc_id = Casey_4
			}
			{
				part = CAS_Female_Torso
				desc_id = F_Rock_Torso_CTank
			}
			{
				part = CAS_Female_Legs
				desc_id = F_Rock_Legs_CBotStud
			}
			{
				part = CAS_Female_Acc_Left
				desc_id = F_Rock_Acc_LCloth
			}
		]
	}
	{
		requires_completed_gig = c_WhenImGone
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xe77c211d)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR104_spider
			}
		]
	}
	{
		requires_completed_gig = c_WhipIt
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xb6a10f2c)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Rock_hat_Spacehelmet
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Pop_Acc_Catears
			}
		]
	}
	{
		requires_completed_gig = c_YMCA
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xb6b937e1)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Metl_Hat_Studs
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Metl_Hat_Studs
			}
		]
	}
	{
		requires_completed_gig = c_YouBelongWithMe
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x76a634e4)
		vague_frontend_desc = unlockable_guitar_h_text
		unlock_icon = unlockable_guitar_h
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR130_Taylor_SB
			}
			{
				part = CAS_Guitar_Body
				desc_id = GTR142_G6e_Body
			}
		]
	}
	{
		requires_completed_gig = c_YouHadMe
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x271a2e03)
		vague_frontend_desc = unlockable_cheats_text
		unlock_icon = unlockable_cheats
		reward_type = cheat
		cheat_name = Cheat_allHOPOs
	}
	{
		requires_completed_gig = c_Special_BandHero
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x0897ef6e)
		vague_frontend_desc = unlockable_accessories_text
		unlock_icon = unlockable_accessories
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Male_Hat
				desc_id = M_Metl_Horn
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Funpart_hat_clown
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Rock_Hat_Pumpkin
			}
			{
				part = CAS_Male_Hat
				desc_id = M_Fun_Hat_Magical
			}
			{
				part = CAS_Female_Hat
				desc_id = F_Metl_Acc_Horn
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_Ahead
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x1c181ad7)
		unlock_icon = unlockable_drumsticks
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_AHEAD_5AB
			}
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_AHEAD_5
			}
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_AHEAD_5B
			}
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_AHEAD_Rock
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_AudioTechnica
		requires_completed_difficulty = gold
		frontend_desc = qs(0xc5482074)
		unlock_icon = unlockable_mic2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Mic
				desc_id = Mic_Standard1
			}
			{
				part = CAS_Mic
				desc_id = Mic_Standard2
			}
			{
				part = CAS_Mic
				desc_id = Mic_Standard3
			}
			{
				part = CAS_Mic
				desc_id = Mic_Standard4
			}
			{
				part = CAS_Mic
				desc_id = Mic_Standard5
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_BCRich
		requires_completed_difficulty = platinum
		frontend_desc = qs(0xee465e0b)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR20_BC_Rich_Beast
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_DaisyRock
		requires_completed_difficulty = gold
		frontend_desc = qs(0xd051f361)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = gtr92_DR_Star
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_EMG
		requires_completed_difficulty = gold
		frontend_desc = qs(0x01129373)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Pickups
				desc_id = GTR_EMG_pickup1
			}
			{
				part = CAS_Guitar_Pickups
				desc_id = GTR_EMG_pickup6
			}
			{
				part = CAS_Guitar_Pickups
				desc_id = GTR_EMG_pickup3
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_ErnieBall
		requires_completed_difficulty = gold
		frontend_desc = qs(0xf7858073)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Bass_Body
				desc_id = Bass_MM_StingRay
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_ESP
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x1394af33)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR31_ESP_VIPER
			}
			{
				part = CAS_Guitar_Body
				desc_id = GTR36_SuperV
			}
			{
				part = CAS_Guitar_Body
				desc_id = gtr64_esp_F
			}
			{
				part = CAS_Guitar_Body
				desc_id = GTR66_ESP_Shini
			}
			{
				part = CAS_Bass_Body
				desc_id = Bass64_F405
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_Ibanez
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x9a551aea)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Bass_Body
				desc_id = IBANEZ_ICB_Body
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_McSwain
		requires_completed_difficulty = gold
		frontend_desc = qs(0x97f44731)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR13_McSwain_Machine
			}
			{
				part = CAS_Guitar_Body
				desc_id = GTR14_McSwain_Life
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_PorkPie
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3e44759b)
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_Pork2`
	}
	{
		requires_completed_gig = c_Sponsor_PorkPie
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3e44759b)
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_Pork3`
	}
	{
		requires_completed_gig = c_Sponsor_PorkPie
		requires_completed_difficulty = gold
		frontend_desc = qs(0x3e44759b)
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/Drumshell_DS_Pork7`
	}
	{
		requires_completed_gig = c_Sponsor_PRS
		requires_completed_difficulty = gold
		frontend_desc = qs(0xb0233a75)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR83_PRS_STLA
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_Schecter
		requires_completed_difficulty = gold
		frontend_desc = qs(0x672716f3)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Body
				desc_id = GTR72_SCH_Devil
			}
			{
				part = CAS_Bass_Body
				desc_id = Bass_Schect_030
			}
			{
				part = CAS_Bass_Head
				desc_id = BAS_Neckhead_SCH_STL03
			}
			{
				part = CAS_Bass_Head
				desc_id = BS_SCH_T_NHEAD02
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_SeymourDuncan
		requires_completed_difficulty = platinum
		frontend_desc = qs(0x8ec62d02)
		unlock_icon = unlockable_guitar_pieces2
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Guitar_Pickups
				desc_id = GTR_pickup_SD01
			}
		]
	}
	{
		requires_completed_gig = c_Sponsor_Tama
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2de5f5e1)
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD02`
	}
	{
		requires_completed_gig = c_Sponsor_Tama
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2de5f5e1)
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD08`
	}
	{
		requires_completed_gig = c_Sponsor_Tama
		requires_completed_difficulty = gold
		frontend_desc = qs(0x2de5f5e1)
		unlock_icon = unlockable_drumset
		reward_type = CAS_texture
		texture = `tex/models/Characters/Layers/CADrm/GH5_TamaShell_LD13`
	}
	{
		requires_completed_gig = c_Sponsor_Zildjian
		requires_completed_difficulty = diamond
		frontend_desc = qs(0x59519670)
		unlock_icon = unlockable_drumsticks
		reward_type = CAS
		car_pieces = [
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_travis2
			}
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_travis
			}
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_Adrian
			}
			{
				part = CAS_Drums_Sticks
				desc_id = Drumsticks_Ronnie
			}
		]
	}
	{
		requires_completed_gig = c_TheImpressionThatIGet
		requires_completed_difficulty = None
		frontend_desc = qs(0x09555112)
		unlock_icon = 0x00000000
		reward_type = venue
		venue_checksum = load_Z_Cube
		run_career_outro_and_credits
	}
]
gig_star_rewards = {
	default_star_rewards = {
		gold = 1
		platinum = 1
		diamond = 1
	}
}

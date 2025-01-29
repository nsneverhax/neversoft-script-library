bonus_songs = {
	prefix = 'bonus'
	num_tiers = 1
	tier1 = {
		title = qs(0xb11ddafd)
		songs = [
		]
		level = load_z_artdeco
		defaultunlocked = 0
	}
}
Bonus_videos = [
	{
		text = qs(0x77366960)
		id = Credits
		movie = 'credits'
		unlocked
	}
	{
		text = qs(0x353e054f)
		id = career_intro
		movie = 'career_intro'
		unlocked
	}
	{
		text = qs(0xf5c57ba9)
		id = career_ending
		movie = 'career_ending'
	}
	{
		text = qs(0x8a360b95)
		id = initial_boot_movie
		movie = 'initial_boot_movie'
		unlocked
	}
]
g_bonus_art_galleries = [
	{
		id = default_gallery
		text_desc = qs(0xb718f775)
		pak = 'lightshow_galleries'
		images = [
			{
				texture = credits_image
				caption = qs(0x77366960)
				bink = 'Credits_Movie'
			}
			{
				texture = game_intro_image
				caption = qs(0x1865276f)
				bink = 'initial_boot_movie'
			}
		]
		unlocked
	}
	{
		id = neversoft_gallery
		text_desc = qs(0x0978b483)
		pak = 'lightshow_galleries'
		images = [
			{
				texture = thps3_image
				caption = qs(0xe3e4bc0f)
				bink = 'thps_logo_1'
			}
			{
				texture = thps4_image
				caption = qs(0xc8c9efcc)
				bink = 'thps_logo_2'
			}
			{
				texture = thug_image
				caption = qs(0xd1d2de8d)
				bink = 'thps_logo_3'
			}
			{
				texture = thug2_image
				caption = qs(0x9e93484a)
				bink = 'thps_logo_4'
			}
			{
				texture = thaw_image
				caption = qs(0x5fa9b379)
				bink = 'thps_logo_5'
			}
			{
				texture = thp8_image
				caption = qs(0xaca52ac8)
				bink = 'thps_logo_6'
			}
			{
				texture = thpg_image
				caption = qs(0xb5be1b89)
				bink = 'thps_logo_7'
			}
		]
		locked
	}
	{
		id = axel_gallery
		text_desc = qs(0x0539af5a)
		pak = 'char1_galleries'
		images = [
			{
				texture = character_axelsteel_01
				caption = qs(0x7088c0ae)
			}
			{
				texture = character_axelsteel_02
				caption = qs(0x0ce9e575)
			}
			{
				texture = character_axel_bh
				caption = qs(0x27fc2413)
			}
			{
				texture = character_axelsteel_03
				caption = qs(0x35deea4e)
			}
			{
				texture = character_axelsteel_04
				caption = qs(0xd4f0e02a)
			}
			{
				texture = character_axelsteel_05
				caption = qs(0x3bde537e)
			}
			{
				texture = avatar_mini_axel
				caption = qs(0x4feeedc5)
			}
		]
		locked
	}
	{
		id = judy_gallery
		text_desc = qs(0xa9028c21)
		pak = 'char1_galleries'
		images = [
			{
				texture = character_judynails_01
				caption = qs(0x4753d33e)
			}
			{
				texture = character_judynails_02
				caption = qs(0x3b32f6e5)
			}
			{
				texture = character_judynails_04
				caption = qs(0x8356484f)
			}
			{
				texture = character_judynails_bh
				caption = qs(0x9e0cfffd)
			}
			{
				texture = character_judynails_05
				caption = qs(0xada1a57c)
			}
			{
				texture = character_judynails_06
				caption = qs(0xec391191)
			}
			{
				texture = character_judynails_03
				caption = qs(0xfb942dfb)
			}
			{
				texture = avatar_mini_judy
				caption = qs(0x2113633c)
			}
		]
		locked
	}
	{
		id = johnny_gallery
		text_desc = qs(0x525fe42c)
		pak = 'char1_galleries'
		images = [
			{
				texture = character_johnnynapalm_01
				caption = qs(0xb277e778)
			}
			{
				texture = character_johnnynapalm_02
				caption = qs(0xce16c2a3)
			}
			{
				texture = character_johnnynapalm_03
				caption = qs(0x76727c09)
			}
			{
				texture = character_johnnynapalm_bh
				caption = qs(0x82b72b85)
			}
			{
				texture = character_johnnynapalm_04
				caption = qs(0x0c8308e4)
			}
			{
				texture = character_johnnynapalm_05
				caption = qs(0x60e64073)
			}
			{
				texture = avatar_mini_johnny
				caption = qs(0x811e176e)
			}
		]
		locked
	}
	{
		id = casey_gallery
		text_desc = qs(0xd88aefc7)
		pak = 'char1_galleries'
		images = [
			{
				texture = character_caseylynch_01
				caption = qs(0x52e20c2e)
			}
			{
				texture = character_caseylynch_02
				caption = qs(0x2e8329f5)
			}
			{
				texture = character_caseylynch_03
				caption = qs(0x96e7975f)
			}
			{
				texture = character_caseylynch_bh
				caption = qs(0xa56705b8)
			}
			{
				texture = character_caseylynch_04
				caption = qs(0xeb6efbfc)
			}
			{
				texture = character_caseylynch_05
				caption = qs(0xd045a9aa)
			}
			{
				texture = avatar_mini_casey
				caption = qs(0x594d64ae)
			}
		]
		locked
	}
	{
		id = pandora1_gallery
		text_desc = qs(0x33080fb7)
		pak = 'char2_galleries'
		images = [
			{
				texture = character_pandora_01
				caption = qs(0xfb497f6c)
			}
			{
				texture = character_pandora_02
				caption = qs(0xedb0f59e)
			}
			{
				texture = character_pandora_03
				caption = qs(0xc478416c)
			}
			{
				texture = character_pandora_04
				caption = qs(0x6a10d0fd)
			}
			{
				texture = character_pandora_05
				caption = qs(0x97e92888)
			}
			{
				texture = character_pandora_06
				caption = qs(0x3981b919)
			}
		]
		locked
	}
	{
		id = pandora2_gallery
		text_desc = qs(0x18255c74)
		pak = 'char2_galleries'
		images = [
			{
				texture = character_pandora_07
				caption = qs(0x19e9fdab)
			}
			{
				texture = character_pandora_08
				caption = qs(0x30214959)
			}
			{
				texture = character_pandora_09
				caption = qs(0x9e49d8c8)
			}
			{
				texture = character_pandora_10
				caption = qs(0x96a1ed44)
			}
			{
				texture = character_pandora_bh
				caption = qs(0x16811918)
			}
			{
				texture = character_pandora_11
				caption = qs(0x9d4f92e2)
			}
			{
				texture = character_pandora_12
				caption = qs(0xebee7fe6)
			}
			{
				texture = avatar_mini_pandora
				caption = qs(0xd97c15d4)
			}
		]
		locked
	}
	{
		id = lars_gallery
		text_desc = qs(0x9dd7644f)
		pak = 'char2_galleries'
		images = [
			{
				texture = character_larsumlaut_01
				caption = qs(0x62ce0435)
			}
			{
				texture = character_larsumlaut_02
				caption = qs(0x1eaf21ee)
			}
			{
				texture = character_larsumlaut_03
				caption = qs(0xa6cb9f44)
			}
			{
				texture = character_larsumlaut_05
				caption = qs(0x7d8d21d8)
			}
			{
				texture = character_larsumlaut_06
				caption = qs(0xdf3269ff)
			}
			{
				texture = character_larsumlaut_04
				caption = qs(0xb8007ba7)
			}
			{
				texture = avatar_mini_lars
				caption = qs(0xf0a6caff)
			}
		]
		locked
	}
	{
		id = clive_gallery
		text_desc = qs(0xccb97235)
		pak = 'char2_galleries'
		images = [
			{
				texture = character_clivewinston_01
				caption = qs(0xc01044a9)
			}
			{
				texture = character_clivewinston_02
				caption = qs(0x0e133991)
			}
			{
				texture = character_clivewinston_bh
				caption = qs(0x3a16fc92)
			}
		]
		locked
	}
	{
		id = eddie_gallery
		text_desc = qs(0x91c2e6b5)
		pak = 'char3_galleries'
		images = [
			{
				texture = character_eddieknox_01
				caption = qs(0x2450277e)
			}
			{
				texture = character_eddieknox_02
				caption = qs(0x14d1beeb)
			}
			{
				texture = character_eddieknox_bh
				caption = qs(0xe5639530)
			}
			{
				texture = avatar_mini_eddie
				caption = qs(0xaec1ca4b)
			}
		]
		locked
	}
	{
		id = dylan_gallery
		text_desc = qs(0xa113847a)
		pak = 'char3_galleries'
		images = [
			{
				texture = character_dylan_02
				caption = qs(0x826fa05a)
			}
			{
				texture = character_dylan_01
				caption = qs(0x60f32d92)
			}
		]
		locked
	}
	{
		id = echo_gallery
		text_desc = qs(0xa26ff67a)
		pak = 'char3_galleries'
		images = [
			{
				texture = character_echo_01
				caption = qs(0xf8d997b5)
			}
			{
				texture = character_echo_02
				caption = qs(0x27c3d7ef)
			}
		]
		locked
	}
	{
		id = izzy_gallery
		text_desc = qs(0x3ba5cbc5)
		pak = 'char3_galleries'
		images = [
			{
				texture = character_izzysparks_01
				caption = qs(0x94f74082)
			}
			{
				texture = character_izzysparks_02
				caption = qs(0xe8966559)
			}
			{
				texture = character_izzysparks_03
				caption = qs(0x50f2dbf3)
			}
			{
				texture = character_izzysparks_bh
				caption = qs(0xc90b770d)
			}
			{
				texture = avatar_mini_izzy
				caption = qs(0xee0cf6a6)
			}
		]
		locked
	}
	{
		id = midori_gallery
		text_desc = qs(0x4c47fb49)
		pak = 'char4_galleries'
		images = [
			{
				texture = character_midorisour_01
				caption = qs(0xbfa5f534)
			}
			{
				texture = character_midorisour_02
				caption = qs(0xc3c4d0ef)
			}
			{
				texture = character_midorisour_03
				caption = qs(0xaab43f51)
			}
			{
				texture = character_midorisour_04
				caption = qs(0xd6d51a8a)
			}
			{
				texture = character_midorisour_05
				caption = qs(0x68a82c49)
			}
			{
				texture = character_midorisour_06
				caption = qs(0x7478f4c9)
			}
		]
		locked
	}
	{
		id = quincy_gallery
		text_desc = qs(0x960585a9)
		pak = 'char3_galleries'
		images = [
			{
				texture = character_quincystyles_01
				caption = qs(0x45c32e5e)
			}
			{
				texture = character_quincystyles_02
				caption = qs(0x3a9fbff6)
			}
			{
				texture = character_quincystyles_03
				caption = qs(0x4d016d06)
			}
			{
				texture = character_quincystyles_04
				caption = qs(0xd6a42169)
			}
			{
				texture = character_quincystyles_05
				caption = qs(0xa23cc8e6)
			}
			{
				texture = character_quincystyles_06
				caption = qs(0x2c3e253d)
			}
		]
		locked
	}
	{
		id = god_gallery
		text_desc = qs(0x7705ed10)
		pak = 'char4_galleries'
		images = [
			{
				texture = character_rockgod_01
				caption = qs(0xc0133434)
			}
			{
				texture = character_rockgod_02
				caption = qs(0x60534620)
			}
			{
				texture = character_demigod_01
				caption = qs(0xff687b41)
			}
			{
				texture = avatar_mini_rockgod
				caption = qs(0x4df54221)
			}
		]
		locked
	}
	{
		id = lou_gallery
		text_desc = qs(0x88f8861c)
		pak = 'char4_galleries'
		images = [
			{
				texture = character_lou_01
				caption = qs(0x2a3bc0f3)
			}
			{
				texture = character_lou_02
				caption = qs(0x28aaaa6a)
			}
			{
				texture = character_lou_03
				caption = qs(0x09c6435d)
			}
			{
				texture = character_lou_04
				caption = qs(0x75a76686)
			}
			{
				texture = avatar_mini_lou
				caption = qs(0x4a8b226b)
			}
		]
		locked
	}
	{
		id = misc_char_gallery
		text_desc = qs(0x9437d5c2)
		pak = 'char4_galleries'
		images = [
			{
				texture = character_malesinger_01
				caption = qs(0x63aa63b5)
			}
			{
				texture = character_rhythmguitarist01
				caption = qs(0x24191873)
			}
			{
				texture = character_rhythmguitarist02
				caption = qs(0xbccb7f6e)
			}
			{
				texture = character_minotaur_01
				caption = qs(0x8fbc90b1)
			}
			{
				texture = character_beast_01
				caption = qs(0x83bff55a)
			}
			{
				texture = avatar_mini_metalhead
				caption = qs(0xf597b77f)
			}
		]
		locked
	}
	{
		id = gh3_guitar1_gallery
		text_desc = qs(0x7ae54ea3)
		pak = 'guitar_galleries'
		images = [
			{
				texture = instrument_gh3_adamsmasher
				caption = qs(0x4d3e3fbf)
			}
			{
				texture = instrument_gh3_fortune
				caption = qs(0x38e846a3)
			}
			{
				texture = instrument_gh3_fury
				caption = qs(0xb20b3483)
			}
			{
				texture = instrument_gh3_nemesis13
				caption = qs(0x61c3fd22)
			}
			{
				texture = instrument_gh3_nslimited
				caption = qs(0x7c690737)
			}
			{
				texture = instrument_gh3_queensofheart
				caption = qs(0x8ca46acd)
			}
			{
				texture = instrument_gh3_rojimbo
				caption = qs(0xcb8dc7f6)
			}
			{
				texture = instrument_gh3_suicideking
				caption = qs(0xe6ed907f)
			}
		]
		locked
	}
	{
		id = gh3_guitar2_gallery
		text_desc = qs(0x51c81d60)
		pak = 'guitar_galleries'
		images = [
			{
				texture = instrument_gh3_theaxeofgoodandevil
				caption = qs(0x514e26db)
			}
			{
				texture = instrument_gh3_thebrawntome
				caption = qs(0x4733a03c)
			}
			{
				texture = instrument_gh3_thedisposed
				caption = qs(0xdf16b2d8)
			}
			{
				texture = instrument_gh3_theenforcer
				caption = qs(0xae5d5ab6)
			}
			{
				texture = instrument_gh3_themessenger
				caption = qs(0x5cd0325d)
			}
			{
				texture = instrument_gh3_thestarrazer
				caption = qs(0x3da2b1b4)
			}
			{
				texture = instrument_gh3_thewidowmako
				caption = qs(0x67722077)
			}
		]
		locked
	}
	{
		id = gh6_guitar_gallery
		text_desc = qs(0xeae0a56c)
		pak = 'guitar_galleries'
		images = [
			{
				texture = instrument_gh6_arthasguitars
				caption = qs(0x82a38329)
			}
			{
				texture = instrument_gh6_axelfantasyguitar
				caption = qs(0xe7e3cb99)
			}
			{
				texture = instrument_gh6_demigodguitar
				caption = qs(0xf41cb246)
			}
			{
				texture = instrument_gh6_johnnypowe
				caption = qs(0x88c2fcae)
			}
			{
				texture = instrument_gh6_judyfantasyguitar
				caption = qs(0x9cf764d9)
			}
			{
				texture = instrument_gh6_newmaleguitar
				caption = qs(0x93d94620)
			}
			{
				texture = instrument_gh6_pandoraguitar
				caption = qs(0xd312678f)
			}
		]
		locked
	}
	{
		id = bh_lightshow_gallery
		text_desc = qs(0x0ac01bf5)
		pak = 'lightshow_galleries'
		images = [
			{
				texture = lightshow_bh_awardshow
				caption = qs(0x9926a727)
				bink = 'Lightshow_BH_AwardShow'
			}
			{
				texture = lightshow_bh_cabo
				caption = qs(0x3b9bb709)
				bink = 'Lightshow_BH_Cabo'
			}
			{
				texture = lightshow_bh_centralpark
				caption = qs(0x0629719f)
				bink = 'Lightshow_BH_CentralPark'
			}
			{
				texture = lightshow_bh_gorge
				caption = qs(0xb48c481d)
				bink = 'Lightshow_BH_Gorge'
			}
			{
				texture = lightshow_bh_mall
				caption = qs(0x7e84f970)
				bink = 'Lightshow_BH_Mall'
			}
			{
				texture = lightshow_bh_paris
				caption = qs(0x58a87a89)
				bink = 'Lightshow_BH_Paris'
			}
			{
				texture = lightshow_ghwt_bonechurch
				caption = qs(0x18c43bd7)
				bink = 'Lightshow_GH4_Bonechurch'
			}
		]
		locked
	}
	{
		id = gh5_lightshow_gallery
		text_desc = qs(0xd655074a)
		pak = 'lightshow_galleries'
		images = [
			{
				texture = lightshow_gh5_cairo
				caption = qs(0x7196b4d1)
				bink = 'Lightshow_GH5_Cairo'
			}
			{
				texture = lightshow_gh5_dublin
				caption = qs(0x2d18d9da)
				bink = 'Lightshow_GH5_Dublin'
			}
			{
				texture = lightshow_gh5_freakshow
				caption = qs(0x31984d26)
				bink = 'Lightshow_GH5_Freakshow'
			}
			{
				texture = lightshow_gh5_guitarhenge
				caption = qs(0x8cac823e)
				bink = 'Lightshow_GH5_Guitarhenge'
			}
			{
				texture = lightshow_gh5_norway
				caption = qs(0xe9c20e9a)
				bink = 'Lightshow_GH5_Norway'
			}
			{
				texture = lightshow_gh5_sanfran
				caption = qs(0x40c9ee8a)
				bink = 'Lightshow_GH5_SanFran'
			}
		]
		locked
	}
	{
		id = gh6_lightshow_gallery
		text_desc = qs(0x88e6fd39)
		pak = 'lightshow_galleries'
		images = [
			{
				texture = lightshow_gh6_barbarian
				caption = qs(0xb003d66b)
				bink = 'Lightshow_GH6_Barbarian'
			}
			{
				texture = lightshow_gh6_cbgb
				caption = qs(0x92fea666)
				bink = 'Lightshow_GH6_CBGB'
			}
			{
				texture = lightshow_gh6_forest
				caption = qs(0x69bfc4f4)
				bink = 'Lightshow_GH6_DarkForest'
			}
			{
				texture = lightshow_gh6_demonclub
				caption = qs(0xe79e2e05)
				bink = 'Lightshow_GH6_Demon'
			}
			{
				texture = lightshow_gh6_rooftop
				caption = qs(0xc771f39f)
				bink = 'Lightshow_GH6_Rooftop'
			}
		]
		locked
	}
	{
		id = gh3_highway1_gallery
		text_desc = qs(0x2cd0d4af)
		pak = 'highway_galleries'
		images = [
			{
				texture = ui_gh3_highway_axel_fm_01
				caption = qs(0x632cd898)
			}
			{
				texture = ui_gh3_highway_casey_fm_
				caption = qs(0xcc879cf0)
			}
			{
				texture = ui_gh3_highway_devil_fm_01
				caption = qs(0x23c32e39)
			}
			{
				texture = ui_gh3_highway_grim_fm_01
				caption = qs(0x8ad07624)
			}
			{
				texture = ui_gh3_highway_izzy_fm_01
				caption = qs(0x05c9b26a)
			}
			{
				texture = ui_gh3_highway_johnny_fm_01
				caption = qs(0xe7eb59c6)
			}
		]
		locked
	}
	{
		id = gh3_highway2_gallery
		text_desc = qs(0x07fd876c)
		pak = 'highway_galleries'
		images = [
			{
				texture = ui_gh3_highway_judy_fm_01
				caption = qs(0x97a6f204)
			}
			{
				texture = ui_gh3_highway_lars_fm_01
				caption = qs(0x4a99f301)
			}
			{
				texture = ui_gh3_highway_midori_fm_01
				caption = qs(0x57ce2cf5)
			}
			{
				texture = ui_gh3_highway_rockabill_d_mls
				caption = qs(0xc728a257)
			}
			{
				texture = ui_gh3_highway_rockgod_fm_01
				caption = qs(0x80c82646)
			}
		]
		locked
	}
	{
		id = gh4_highway1_gallery
		text_desc = qs(0xc64be763)
		pak = 'highway_galleries'
		images = [
			{
				texture = ui_gh4_highway_black_02
				caption = qs(0x5381146c)
			}
			{
				texture = ui_gh4_highway_classic_01
				caption = qs(0xe0a9b18d)
			}
			{
				texture = ui_gh4_highway_classic_02
				caption = qs(0xcb84e24e)
			}
			{
				texture = ui_gh4_highway_classic_04
				caption = qs(0xd29fd30f)
			}
			{
				texture = ui_gh4_highway_glam_01
				caption = qs(0x399b3f7d)
			}
			{
				texture = ui_gh4_highway_goth_01
				caption = qs(0x2f5588e0)
			}
		]
		locked
	}
	{
		id = gh4_highway2_gallery
		text_desc = qs(0xed66b4a0)
		pak = 'highway_galleries'
		images = [
			{
				texture = ui_gh4_highway_metal_02
				caption = qs(0xb1c7d96c)
			}
			{
				texture = ui_gh4_highway_pop_01
				caption = qs(0x25cd3c69)
			}
			{
				texture = ui_gh4_highway_punk_01
				caption = qs(0x0297b312)
			}
			{
				texture = ui_gh4_highway_rock_01
				caption = qs(0x581d0a77)
			}
			{
				texture = ui_gh4_highway_rock_02
				caption = qs(0x733059b4)
			}
		]
		locked
	}
	{
		id = gh3_venue_gallery
		text_desc = qs(0xee120675)
		pak = 'venue1_galleries'
		images = [
			{
				texture = venue_gh3_backyard_party
				caption = qs(0xb1da0ede)
			}
			{
				texture = venue_gh3_video_shoot
				caption = qs(0x933aeae5)
			}
			{
				texture = venue_gh3_art_deco
				caption = qs(0x94cc7120)
			}
			{
				texture = venue_gh3_prison
				caption = qs(0x785abf97)
			}
			{
				texture = venue_gh3_wikker_man
				caption = qs(0x05fec885)
			}
			{
				texture = venue_gh3_budokan
				caption = qs(0x952c14d6)
			}
			{
				texture = venue_gh3_hell
				caption = qs(0x820c475b)
			}
		]
		locked
	}
	{
		id = gh4_venue1_gallery
		text_desc = qs(0x49495c6d)
		pak = 'venue1_galleries'
		images = [
			{
				texture = venue_gh4_aircraft_carrier
				caption = qs(0xdae5ca6a)
			}
			{
				texture = venue_gh4_ball_park
				caption = qs(0x0aafc18e)
			}
			{
				texture = venue_gh4_bayou_bar
				caption = qs(0x1038cdf4)
			}
			{
				texture = venue_gh4_castle
				caption = qs(0x4444d7ea)
			}
			{
				texture = venue_gh4_goth_bar
				caption = qs(0x04acef90)
			}
			{
				texture = venue_gh4_credits_01
				caption = qs(0x5383729e)
			}
			{
				texture = venue_gh4_credits_02
				caption = qs(0x78ae215d)
			}
		]
		locked
	}
	{
		id = gh4_venue2_gallery
		text_desc = qs(0x62640fae)
		pak = 'venue2_galleries'
		images = [
			{
				texture = venue_gh4_hong_kong_harbor
				caption = qs(0x2c856d3e)
			}
			{
				texture = venue_gh4_new_york
				caption = qs(0x68dfc4d8)
			}
			{
				texture = venue_gh4_state_fair
				caption = qs(0xb2a0d45c)
			}
			{
				texture = venue_gh4_teslas_coil
				caption = qs(0xe9df5e99)
			}
		]
		locked
	}
	{
		id = gh5_venue1_gallery
		text_desc = qs(0x8566a6e9)
		pak = 'venue2_galleries'
		images = [
			{
				texture = venue_gh5_cairo
				caption = qs(0x7196b4d1)
			}
			{
				texture = venue_gh5_collider
				caption = qs(0xa6f99d1d)
			}
			{
				texture = venue_gh5_dublin
				caption = qs(0x2d18d9da)
			}
			{
				texture = venue_gh5_freakshow
				caption = qs(0x31984d26)
			}
			{
				texture = venue_gh5_guitar_henge
				caption = qs(0x8cac823e)
			}
		]
		locked
	}
	{
		id = gh5_venue2_gallery
		text_desc = qs(0xae4bf52a)
		pak = 'venue3_galleries'
		images = [
			{
				texture = venue_gh5_mexico_city
				caption = qs(0x4b9bbddb)
			}
			{
				texture = venue_gh5_nashville
				caption = qs(0xa36d3d13)
			}
			{
				texture = venue_gh5_new_orleans
				caption = qs(0x8a2dd332)
			}
			{
				texture = venue_gh5_subway
				caption = qs(0xe8f17401)
			}
			{
				texture = venue_gh5_vegas
				caption = qs(0xeab93c80)
			}
		]
		locked
	}
	{
		id = gh6_venue1_gallery
		text_desc = qs(0xb00e228a)
		pak = 'venue3_galleries'
		images = [
			{
				texture = venue_gh6_barbarian_stage
				caption = qs(0xb003d66b)
			}
			{
				texture = venue_gh6_dark_forest
				caption = qs(0x69bfc4f4)
			}
			{
				texture = venue_gh6_demon_club
				caption = qs(0xe79e2e05)
			}
			{
				texture = venue_gh6_mansion
				caption = qs(0xea05fb90)
			}
			{
				texture = venue_gh6_medieval_stage
				caption = qs(0x6dc02041)
			}
			{
				texture = venue_gh6_rooftop
				caption = qs(0xc771f39f)
			}
		]
		locked
	}
]

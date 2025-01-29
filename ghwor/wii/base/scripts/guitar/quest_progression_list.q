quest_progression_thresholds = [
	0
	1
	4
	5
	9
	10
]
quest_progression_unlocks = [
	[
		quest_chapter_johnny
		quest_chapter_newfemale
	]
	[
		quest_chapter_judy
		quest_chapter_newmale
	]
	[
		quest_chapter_midboss
	]
	[
		quest_chapter_pandora
		quest_chapter_lars
		quest_chapter_casey
		quest_chapter_axel
	]
	[
		quest_chapter_finale
	]
	[
		quest_chapter_demigod
	]
]
g_quest_recent_unlocked_awards = [
]
g_chapter_completed_percentage = 5
g_chapter_dominated_percentage = 5
g_rush_percentage = 5
g_final_battle_percentage = 10
g_demigod_percentage = 5
quest_chapter_johnny = {
	Name = 'quest_chapter_johnny'
	venue = load_z_punkstage
	ENCORE = spiderman
	reward = None
	rocker_id = gh_rocker_johnny
	power_rocker = gh_rocker_johnny_2
	hero_info = johnny_hero_info
	power_tag = johnny_power
	outro_vo = 'Johnny_Outro'
	alt_outro_vo = 'Johnny_Outro_Generic'
	stars_for_encore = 35
	stars_for_reward = 320
	songs = [
		whatdoiget
		werenotgonnatakeit
		cherrybomb
		selfesteemgh6
		motivation
		reignition
		blackrain
		spiderman
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_punkstage
				}
				{
					reward_type = rocker_power
					power_name = johnny_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0xefacf16c)
			unlock_text = [
				{
					text = qs(0x6379a172)
				}
				{
					text = qs(0x80e481c2)
					alt_text = qs(0x2d8fbb37)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
				{
					text = qs(0x19e63c8d)
				}
				{
					text = qs(0x00000000)
					alt_text = qs(0x2a9e30a3)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_johnny_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr135b_johnny
						}
						{
							part = cas_full_bass
							desc_id = bass135b_johnny
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_male_torso
							desc_id = m_fun_torso_spike
						}
						{
							part = cas_female_torso
							desc_id = f_fun_torso_band
						}
						{
							part = cas_male_torso
							desc_id = m_fun_torso_band
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `johnny	napalm2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `johnny	napalm2	band	male	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `johnny	napalm2	band	male	2`
				}
				{
					reward_type = rocker_power
					power_name = johnny_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0xeb150bc9)
			unlock_text = [
				{
					text = qs(0xb5acf5d0)
				}
				{
					text = qs(0x64a853d6)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_johnny_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr135b_johnny_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass135b_johnny_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_newfemale = {
	Name = 'quest_chapter_newfemale'
	venue = load_z_riothouse
	ENCORE = uprising
	reward = None
	rocker_id = gh_rocker_echo_tesla
	power_rocker = gh_rocker_echo_tesla_2
	hero_info = newfemale_hero_info
	power_tag = newfemale_power
	outro_vo = 'Newgirl_Outro'
	alt_outro_vo = 'Newgirl_Outro_Generic'
	stars_for_encore = 27
	stars_for_reward = 400
	songs = [
		bleeditout
		ticktickboom
		getfree
		machinehead
		iknowwhatiam
		again
		lasso
		slowhands
		wish
		uprising
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_riothouse
				}
				{
					reward_type = rocker_power
					power_name = newfemale_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0x0bfef2c8)
			unlock_text = [
				{
					text = qs(0xaf34930c)
				}
				{
					text = qs(0x4a67a263)
					alt_text = qs(0x2d8fbb37)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
				{
					text = qs(0x6a6644b9)
				}
				{
					text = qs(0x00000000)
					alt_text = qs(0x2a9e30a3)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_echo_tesla_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_guitar_body
							desc_id = gtr130_steampunk
						}
						{
							part = cas_full_bass
							desc_id = bass130_steampunk
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_female_acc_face
							desc_id = f_fun_glasses_echo2
						}
						{
							part = cas_female_shoes
							desc_id = f_fun_shoe_etesla2
						}
						{
							part = cas_male_torso
							desc_id = m_fun_torso_cyborg
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `echo	tesla	2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `echo	tesla	2	band	female	2`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `echo	tesla2	band	male	1`
				}
				{
					reward_type = rocker_power
					power_name = newfemale_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0x2f8c014b)
			unlock_text = [
				{
					text = qs(0x3cab47ed)
				}
				{
					text = qs(0xc2f76bf2)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_echo_tesla_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_guitar_body
							desc_id = gtr130_steampunk_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass130_steampunk_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_judy = {
	Name = 'quest_chapter_judy'
	venue = load_z_houseband
	ENCORE = beencaughtstealing
	reward = None
	rocker_id = gh_rocker_judy
	power_rocker = gh_rocker_judy_2
	hero_info = judy_hero_info
	power_tag = judy_power
	outro_vo = 'Judy_Outro'
	stars_for_encore = 45
	stars_for_reward = 400
	songs = [
		bohemianrhapsody
		sevennationarmy
		fascinationstreet
		losingmyreligion
		tonesofhome
		nowayback
		graduate
		interstatelovesong
		howyouremindme
		beencaughtstealing
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_houseband
				}
				{
					reward_type = rocker_power
					power_name = judy_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0xed9f1795)
			unlock_text = [
				{
					text = qs(0x44614fc7)
				}
				{
					text = qs(0x81c63013)
				}
				{
					text = qs(0x2f2ce561)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_judy_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr138_judy
						}
						{
							part = cas_full_bass
							desc_id = bass138_judy
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_female_acc_left
							desc_id = f_punk_acc_ljudyarm
						}
						{
							part = cas_female_acc_right
							desc_id = f_punk_acc_rjudyarm
						}
						{
							part = cas_female_torso
							desc_id = f_punk_torso_judywing
						}
						{
							part = cas_male_acc_left
							desc_id = m_punk_acc_ljudyarm
						}
						{
							part = cas_male_acc_right
							desc_id = m_punk_acc_rjudyarm
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `judy2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `judy2	band	male	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `judy2	band	male	2`
				}
				{
					reward_type = rocker_power
					power_name = judy_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0x40169422)
			unlock_text = [
				{
					text = qs(0x664abea8)
				}
				{
					text = qs(0xa398f759)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_judy_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr138_judy_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass138_judy_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_newmale = {
	Name = 'quest_chapter_newmale'
	venue = load_z_mansionstudio
	ENCORE = childrenofthegrave
	reward = None
	rocker_id = gh_rocker_austin_tejas
	power_rocker = gh_rocker_austin_tejas_2
	hero_info = newmale_hero_info
	power_tag = newmale_power
	outro_vo = 'Newmale_Outro'
	stars_for_encore = 27
	stars_for_reward = 400
	songs = [
		lunaticfringe
		fortunateson
		listentoherheart
		straycatblues
		burninforyou
		freeride
		cryin
		moneyfornothing
		rockininthefreeworld
		childrenofthegrave
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_mansionstudio
				}
				{
					reward_type = rocker_power
					power_name = newmale_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0xddf7d000)
			unlock_text = [
				{
					text = qs(0xb15aa4d7)
				}
				{
					text = qs(0xcc711212)
				}
				{
					text = qs(0x1586c7f2)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_austin_tejas_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr140_pumpkin
						}
						{
							part = cas_full_bass
							desc_id = bass140_pumpkin
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_female_acc_left
							desc_id = f_fun_acc_lglow
						}
						{
							part = cas_female_acc_right
							desc_id = f_fun_acc_rglow
						}
						{
							part = cas_male_acc_left
							desc_id = m_fun_acc_lglow
						}
						{
							part = cas_male_acc_right
							desc_id = m_fun_acc_rglow
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `austin	tejas2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `austin	tejas2	band	male	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `austin	tejas2	band	male	2`
				}
				{
					reward_type = rocker_power
					power_name = newmale_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0xfbb4aae9)
			unlock_text = [
				{
					text = qs(0xef7af050)
				}
				{
					text = qs(0xbc10649b)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_austin_tejas_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr140_pumpkin_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass140_pumpkin_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_midboss = {
	Name = 'quest_chapter_midboss'
	venue = load_z_modular
	ENCORE = rush2112p7
	reward = None
	load_screen_title = qs(0x3d7ebd7a)
	load_screen_text = qs(0xe3e74919)
	rocker_id = gh_rocker_austin_tejas
	hero_info = midboss_hero_info
	power_tag = None
	outro_vo = 'Map_Unlock_3rd_Tier'
	stars_for_encore = 3
	stars_for_reward = 180
	song_percentage_value = 1
	songs = [
		rush2112p1
		rush2112p2
		rush2112p3
		rush2112p4
		rush2112p5
		rush2112p6
		rush2112p7
	]
	boss_chapter
	chapter_unlocks = [
		{
			reward_when = encore_completed
			unlock_text_header = qs(0x55e2dff3)
			unlock_text = [
				{
					text = qs(0x2d8fbb37)
				}
				{
					text = qs(0xad0b7c09)
				}
				{
					text = qs(0x2a9e30a3)
				}
				{
					text = qs(0x9b688ff8)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_modular
				}
				{
					reward_type = song
					song_checksum = rush2112p1
				}
				{
					reward_type = song
					song_checksum = rush2112p2
				}
				{
					reward_type = song
					song_checksum = rush2112p3
				}
				{
					reward_type = song
					song_checksum = rush2112p4
				}
				{
					reward_type = song
					song_checksum = rush2112p5
				}
				{
					reward_type = song
					song_checksum = rush2112p6
				}
				{
					reward_type = song
					song_checksum = rush2112p7
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr137_demi
						}
						{
							part = cas_full_bass
							desc_id = bass137_demi
						}
					]
				}
			]
		}
	]
}
quest_chapter_pandora = {
	Name = 'quest_chapter_pandora'
	venue = load_z_epicstage
	ENCORE = bodies
	reward = None
	rocker_id = gh_rocker_pandora
	power_rocker = gh_rocker_pandora_2
	hero_info = pandora_hero_info
	power_tag = pandora_power
	outro_vo = 'Pandora_Outro'
	stars_for_encore = 24
	stars_for_reward = 360
	songs = [
		suffocate
		imnotok
		nosecretsthisyear
		dancedance
		itsonlyanotherparsec
		feelgooddrag
		theoutsider
		savior
		bodies
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_epicstage
				}
				{
					reward_type = rocker_power
					power_name = pandora_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0xb9ca7451)
			unlock_text = [
				{
					text = qs(0x9d58ced2)
				}
				{
					text = qs(0xaabf8833)
				}
				{
					text = qs(0x19b9c26b)
				}
				{
					text = qs(0xe01dbc10)
				}
				{
					text = qs(0x00000000)
					alt_text = qs(0x2a9e30a3)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_pandora_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr_pandora
						}
						{
							part = cas_full_bass
							desc_id = bass142_pandora
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_female_legs
							desc_id = f_pandband01_legs
						}
						{
							part = cas_female_shoes
							desc_id = f_pandband01_shoes
						}
						{
							part = cas_female_shoes
							desc_id = f_pandband02_shoes
						}
						{
							part = cas_female_torso
							desc_id = f_pandband01_torso
						}
						{
							part = cas_female_torso
							desc_id = f_pandband02_torso
						}
						{
							part = cas_male_torso
							desc_id = m_pandoraband_torso
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `pandora	power	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `pandora	power	band	female	2`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `pandora	2	band	male	1`
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_guitar_body
							desc_id = gtr188_prs_orianthi
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_guitar_body
							desc_id = gtr23_bc_rich_assassin
						}
					]
				}
				{
					reward_type = rocker_power
					power_name = pandora_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0x57a8636b)
			unlock_text = [
				{
					text = qs(0xed3e2104)
				}
				{
					text = qs(0x8b0f8ad5)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_pandora_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr_pandora_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass142_pandora_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_lars = {
	Name = 'quest_chapter_lars'
	venue = load_z_festival
	ENCORE = paranoid
	reward = None
	rocker_id = gh_rocker_lars
	power_rocker = gh_rocker_lars_2
	hero_info = lars_hero_info
	power_tag = lars_power
	outro_vo = 'Lars_Outro'
	stars_for_encore = 27
	stars_for_reward = 400
	songs = [
		waidmannsheil
		imbroken
		dancingthroughsunday
		hardtosee
		bloodlines
		ravenous
		psychosocial
		tiesthatbind
		calling
		paranoid
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_festival
				}
				{
					reward_type = rocker_power
					power_name = lars_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0x21bed3e0)
			unlock_text = [
				{
					text = qs(0x46c10ef0)
				}
				{
					text = qs(0x61dae64e)
				}
				{
					text = qs(0xf05bfd0c)
				}
				{
					text = qs(0x252b5eb5)
				}
				{
					text = qs(0x00000000)
					alt_text = qs(0x2a9e30a3)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_lars_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr139_battleaxe
						}
						{
							part = cas_full_bass
							desc_id = bass139_battleaxe
						}
					]
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_male_hat
							desc_id = m_fun_hat_xhood
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `lars	umlaut2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `lars	umlaut2	band	male	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `lars	umlaut2	band	male	2`
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_guitar_body
							desc_id = gtr182_bc_rich_king
						}
					]
				}
				{
					reward_type = rocker_power
					power_name = lars_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0xd9085a54)
			unlock_text = [
				{
					text = qs(0xb7ff176b)
				}
				{
					text = qs(0x08d67d08)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_lars_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr139_battleaxe_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass139_battleaxe_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_casey = {
	Name = 'quest_chapter_casey'
	venue = load_z_barbarian
	ENCORE = renegade
	reward = None
	rocker_id = gh_rocker_casey
	power_rocker = gh_rocker_casey_2
	hero_info = casey_hero_info
	power_tag = casey_power
	outro_vo = 'Casey_Outro'
	stars_for_encore = 24
	stars_for_reward = 360
	songs = [
		lovegun
		nomoremrniceguy
		sharpdressedman
		scumbagblues
		feelslikethefirsttime
		aqualung
		moveitonover
		callmethebreeze
		renegade
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_barbarian
				}
				{
					reward_type = rocker_power
					power_name = casey_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0xd702432e)
			unlock_text = [
				{
					text = qs(0xb0ad7006)
				}
				{
					text = qs(0x2b681449)
				}
				{
					text = qs(0x0fc2c5cc)
				}
				{
					text = qs(0x00000000)
					alt_text = qs(0x2a9e30a3)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_casey_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr16_mcswain_snake02
						}
						{
							part = cas_full_bass
							desc_id = bass116_mcswain_snake
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `casey	2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `casey	2	band	male	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `casey	2	band	male	2`
				}
				{
					reward_type = rocker_power
					power_name = casey_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0x83bcfe72)
			unlock_text = [
				{
					text = qs(0xb402c280)
				}
				{
					text = qs(0x915b15e7)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_casey_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr16_mcswain_snake_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass116_mcswain_snake_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_axel = {
	Name = 'quest_chapter_axel'
	venue = load_z_egypt
	ENCORE = batcountry
	reward = None
	rocker_id = gh_rocker_axel
	power_rocker = gh_rocker_axel_2
	hero_info = axel_hero_info
	power_tag = axel_power
	outro_vo = 'Axel_Outro'
	stars_for_encore = 40
	stars_for_reward = 360
	songs = [
		poursomesugaronme
		jetcitywoman
		Ghost
		unskinnybop
		moderndaycowboy
		rockinamerica
		Burn
		indians
		batcountry
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_egypt
				}
				{
					reward_type = rocker_power
					power_name = axel_power
					power_level = 1
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0x1d37453b)
			unlock_text = [
				{
					text = qs(0x18a257a3)
				}
				{
					text = qs(0x989cd089)
				}
				{
					text = qs(0xecbe79a9)
				}
				{
					text = qs(0x00000000)
					alt_text = qs(0x2a9e30a3)
					show_alt_text_if = quest_is_first_chapter_unlocked
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_axel_2
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr150_nvsft_axel
						}
						{
							part = cas_full_bass
							desc_id = bass150_nvsft_axel
						}
					]
				}
				{
					reward_type = outfit_preset
					outfit_preset = `axel	steel2	band	female	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `axel	steel2	band	male	1`
				}
				{
					reward_type = outfit_preset
					outfit_preset = `axel	steel2	band	male	2`
				}
				{
					reward_type = rocker_power
					power_name = axel_power
					power_level = 2
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0x224393e9)
			unlock_text = [
				{
					text = qs(0x08b73051)
				}
				{
					text = qs(0x62295d7d)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_axel_2_ghost
				}
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr150_nvsft_axel_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass150_nvsft_axel_ghost
						}
					]
				}
			]
		}
	]
}
quest_chapter_finale = {
	Name = 'quest_chapter_finale'
	venue = load_z_finalbattle
	ENCORE = suddendeathgh6career
	reward = None
	load_screen_title = qs(0x78a9cc67)
	load_screen_text = qs(0x8ff7b2e8)
	rocker_id = gh_rocker_austin_tejas
	hero_info = finale_hero_info
	power_tag = None
	outro_vo = 'Map_Demigod_Complete'
	stars_for_song1 = 12
	stars_for_song2 = 12
	stars_for_song3 = 30
	stars_for_encore = 0
	stars_for_reward = 35
	song_percentage_value = 3
	songs = [
		holywars
		thisdaywefight
		suddendeathgh6career
	]
	boss_chapter
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_finalbattle
				}
			]
		}
		{
			reward_when = encore_completed
			unlock_text_header = qs(0xd12fcb36)
			unlock_text = [
				{
					text = qs(0x8e19f89a)
				}
				{
					text = qs(0xba806880)
				}
				{
					text = qs(0x23aafcdd)
				}
				{
					text = qs(0x89987daa)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = character
					profile_name = gh_rocker_demigod
				}
				{
					reward_type = venue
					venue_checksum = load_z_credits
				}
				{
					reward_type = song
					song_checksum = suddendeath
				}
				{
					reward_type = song
					song_checksum = settingfire
				}
				{
					reward_type = song
					song_checksum = speeding
				}
				{
					reward_type = song
					song_checksum = blackwidow
				}
				{
					reward_type = song
					song_checksum = furyofthestorm
				}
				{
					reward_type = song
					song_checksum = nemesis
				}
				{
					reward_type = song
					song_checksum = deadfall
				}
				{
					reward_type = song
					song_checksum = prepareforwar
				}
				{
					reward_type = song
					song_checksum = chemicalwarfare
				}
			]
		}
	]
}
quest_chapter_demigod = {
	Name = 'quest_chapter_demigod'
	venue = load_z_credits
	ENCORE = None
	reward = None
	rocker_id = gh_rocker_demigod
	hero_info = demigod_hero_info
	power_tag = None
	outro_vo = 'Map_Demigod_Complete'
	stars_for_encore = 0
	stars_for_reward = 440
	songs = [
		settingfire
		speeding
		blackwidow
		furyofthestorm
		nemesis
		deadfall
		prepareforwar
		chemicalwarfare
		holywars
		thisdaywefight
		suddendeath
	]
	chapter_unlocks = [
		{
			reward_when = chapter_unlocked
			rewards = [
				{
					reward_type = venue
					venue_checksum = load_z_credits
				}
			]
		}
		{
			reward_when = chapter_dominated
			unlock_text_header = qs(0xaacc21ca)
			unlock_text = [
				{
					text = qs(0x37b62c82)
				}
				{
					text = qs(0xf4b983e5)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
				{
					text = qs(0x00000000)
				}
			]
			rewards = [
				{
					reward_type = cas
					car_pieces = [
						{
							part = cas_full_guitar
							desc_id = gtr137_demi_ghost
						}
						{
							part = cas_full_bass
							desc_id = bass137_demi_ghost
						}
					]
				}
				{
					reward_type = character
					profile_name = gh_rocker_demigod_spirit
				}
			]
		}
	]
}

default_custom_musician_profile_female = {
	allowed_parts = [
		drum
		vocals
		guitar
		bass
	]
	blurb = qs(0x03ac90f0)
	appearance = {
		cas_body = {
			desc_id = gh4_car_female
		}
		cas_physique = {
			desc_id = femalephysique
		}
		cas_guitar_body = {
			desc_id = guitar_body01
		}
		cas_guitar_neck = {
			desc_id = guitar_neck01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_01.dds`
					material = guitar_neck1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head01
		}
		cas_guitar_pickguards = {
			desc_id = guitar_pickg01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01a
		}
		cas_guitar_knobs = {
			desc_id = gtr_knobs_style_01a
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01a
		}
		cas_bass_body = {
			desc_id = cab_body_b2a
		}
		cas_bass_neck = {
			desc_id = cab_neck_bn1a
		}
		cas_bass_head = {
			desc_id = cab_head_bh6a
		}
		cas_bass_pickguards = {
			desc_id = cab_pickg_e1
		}
		cas_bass_pickups = {
			desc_id = cab_hbuck_pickup_a2
		}
		cas_bass_knobs = {
			desc_id = cab_knob_chndr05
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb3a
		}
		cas_mic = {
			desc_id = rock
		}
		cas_mic_stand = {
			desc_id = rock
		}
		cas_drums = {
			desc_id = basic
		}
		cas_female_win_anim = {
			desc_id = win_hype
		}
		cas_female_lose_anim = {
			desc_id = lose_angryatcrowd
		}
		cas_female_intro_anim = {
			desc_id = intro_hype
		}
		genre = rock
	}
}
default_custom_musician_profile_male = {
	allowed_parts = [
		drum
		vocals
		guitar
		bass
	]
	blurb = qs(0x03ac90f0)
	appearance = {
		cas_body = {
			desc_id = gh4_car_male
		}
		cas_physique = {
			desc_id = malephysique
		}
		cas_guitar_body = {
			desc_id = guitar_body01
		}
		cas_guitar_neck = {
			desc_id = guitar_neck01
			cap = [
				{
					base_tex = `tex/models/car_instruments/guitars/neck_maple_tb_01.dds`
					material = guitar_neck1_primary
					diffuse
					pre_layer = [
						{
							texture = `tex/models/characters/layers/cag/neck1_inlay_dots1_d_01.img`
						}
					]
				}
			]
		}
		cas_guitar_head = {
			desc_id = guitar_head01
		}
		cas_guitar_pickguards = {
			desc_id = guitar_pickg01
		}
		cas_guitar_pickups = {
			desc_id = gtr_pickups_style_01a
		}
		cas_guitar_knobs = {
			desc_id = gtr_knobs_style_01a
		}
		cas_guitar_bridges = {
			desc_id = gtr_hardware01a
		}
		cas_bass_body = {
			desc_id = cab_body_b2a
		}
		cas_bass_neck = {
			desc_id = cab_neck_bn1a
		}
		cas_bass_head = {
			desc_id = cab_head_bh6a
		}
		cas_bass_pickguards = {
			desc_id = cab_pickg_e1
		}
		cas_bass_pickups = {
			desc_id = cab_hbuck_pickup_a2
		}
		cas_bass_knobs = {
			desc_id = cab_knob_chndr05
		}
		cas_bass_bridges = {
			desc_id = cab_bridge_bb3a
		}
		cas_mic = {
			desc_id = paramore
		}
		cas_mic_stand = {
			desc_id = poptastic
		}
		cas_drums = {
			desc_id = basic
		}
		cas_male_intro_anim = {
			desc_id = intro_waving
		}
		cas_male_win_anim = {
			desc_id = win_robot
		}
		cas_male_lose_anim = {
			desc_id = lose_angryatcrowd
		}
		genre = rock
	}
}
net_musician_profiles = [
	{
		name = netappearance1
		fullname = qs(0xa038ae98)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
		}
	}
	{
		name = netappearance2
		fullname = qs(0x8b15fd5b)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
		}
	}
	{
		name = netappearance3
		fullname = qs(0x920ecc1a)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
		}
	}
	{
		name = netappearance4
		fullname = qs(0xdd4f5add)
		allowed_parts = [
			drum
			vocals
			guitar
			bass
		]
		selection_not_allowed
		appearance = {
		}
	}
]
modifiable_preset_musician_parts = [
	cas_female_hair
	cas_female_hat_hair
	cas_female_hat
	cas_female_facial_hair
	cas_female_torso
	cas_female_legs
	cas_female_shoes
	cas_female_acc_left
	cas_female_acc_right
	cas_female_acc_face
	cas_female_acc_ears
	cas_male_hair
	cas_male_hat_hair
	cas_male_hat
	cas_male_facial_hair
	cas_male_torso
	cas_male_legs
	cas_male_shoes
	cas_male_acc_left
	cas_male_acc_right
	cas_male_acc_face
	cas_male_acc_ears
]
modifiable_preset_musician_instrument_parts = [
	cas_full_instrument
	cas_guitar_body
	cas_guitar_neck
	cas_guitar_head
	cas_guitar_pickguards
	cas_guitar_bridges
	cas_guitar_knobs
	cas_guitar_pickups
	cas_guitar_strings
	cas_guitar_highway
	cas_bass_body
	cas_bass_neck
	cas_bass_head
	cas_bass_pickguards
	cas_bass_pickups
	cas_bass_bridges
	cas_bass_knobs
	cas_bass_strings
	cas_bass_highway
	cas_drums
	cas_drums_sticks
	cas_drums_highway
	cas_mic
	cas_mic_stand
]
default_band = {
	guitarist = randomcharacter
	bassist = randomcharacter
	vocalist = randomcharacter
	drummer = randomcharacter
}
worst_female_band = {
	guitarist = worstfemaleguitarist
	bassist = worstfemalebassist
	vocalist = worstfemalevocalist
	drummer = worstfemaledrummer
}
worst_male_band = {
	guitarist = worstmaleguitarist
	bassist = worstmalebassist
	vocalist = worstmalevocalist
	drummer = worstmaledrummer
}
band_zakkbossbattle = {
	guitarist = randomcharacter
	bassist = zakkwylde
	vocalist = randomcharacter
	drummer = randomcharacter
}
band_stillborn = {
	guitarist = zakkwylde
	bassist = randomcharacter
	vocalist = zakkwylde
	drummer = randomcharacter
}
band_crazytrain = {
	guitarist = zakkwylde
	bassist = randomcharacter
	vocalist = ozzy
	drummer = randomcharacter
}
band_mrcrowley = {
	guitarist = zakkwylde
	bassist = randomcharacter
	vocalist = ozzy
	drummer = randomcharacter
}
band_tedbossbattle = {
	guitarist = randomcharacter
	bassist = tednugent
	vocalist = randomcharacter
	drummer = randomcharacter
}
band_stranglehold = {
	guitarist = tednugent
	bassist = randomcharacter
	vocalist = randomcharacter
	drummer = randomcharacter
}
band_miserybusiness = {
	guitarist = randomcharacter
	bassist = randomcharacter
	vocalist = hayley
	drummer = randomcharacter
}
band_hendrix = {
	guitarist = jimi
	bassist = randomcharacter
	vocalist = jimi
	drummer = randomcharacter
	allow_player_selected_characters = false
}
band_dammit = {
	guitarist = randomcharacter
	bassist = randomcharacter
	vocalist = randomcharacter
	drummer = travis
}
band_today = {
	guitarist = billy
	bassist = randomcharacter
	vocalist = billy
	drummer = randomcharacter
}
band_demolitionman = {
	guitarist = randomcharacter
	bassist = sting
	vocalist = sting
	drummer = randomcharacter
}
band_finalgig_male_singer = {
	guitarist = zakkwylde
	bassist = sting
	vocalist = ozzy
	drummer = travis
}
band_finalgig_female_singer = {
	guitarist = tednugent
	bassist = sting
	vocalist = hayley
	drummer = travis
}
jam_mode_band = 0
jam_mode_band_profiles = {
	guitarist = guitarist
	bassist = bassist
	vocalist = singer
	drummer = drummer
}

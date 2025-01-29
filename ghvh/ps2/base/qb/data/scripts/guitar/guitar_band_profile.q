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
		$preset_musician_instrument_hack
		cas_female_win_anim = {
			desc_id = win_hype
		}
		cas_female_lose_anim = {
			desc_id = lose_angryatcrowd
		}
		cas_female_intro_anim = {
			desc_id = intro_hype
		}
		cas_female_base_torso = {
			desc_id = female_full
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
		$preset_musician_instrument_hack
		cas_male_intro_anim = {
			desc_id = intro_waving
		}
		cas_male_win_anim = {
			desc_id = win_robot
		}
		cas_male_lose_anim = {
			desc_id = lose_angryatcrowd
		}
		cas_male_base_torso = {
			desc_id = male_full
		}
		genre = rock
	}
}
net_musician_profiles = [
	{
		Name = netappearance1
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
		Name = netappearance2
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
		Name = netappearance3
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
		Name = netappearance4
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
	cas_guitar_finish
	cas_guitar_body_detail
	cas_guitar_neck_finish
	cas_guitar_head_finish
	cas_guitar_head_detail
	cas_guitar_pickguard_finish
	cas_guitar_logo
	cas_bass_finish
	cas_bass_body_detail
	cas_bass_neck_finish
	cas_bass_head_finish
	cas_bass_head_detail
	cas_bass_pickguard_finish
	cas_guitar_logo
	cas_drum_finish
	cas_drum_detail
]
default_band = {
	GUITARIST = randomcharacter
	BASSIST = randomcharacter
	vocalist = randomcharacter
	drummer = randomcharacter
}
worst_female_band = {
	GUITARIST = worstfemaleguitarist
	BASSIST = worstfemalebassist
	vocalist = worstfemalevocalist
	drummer = worstfemaledrummer
}
worst_male_band = {
	GUITARIST = worstmaleguitarist
	BASSIST = worstmalebassist
	vocalist = worstmalevocalist
	drummer = worstmaledrummer
}
band_vanhalen = {
	GUITARIST = eddie_van_halen
	BASSIST = wolf_van_halen
	vocalist = david_lee_roth
	drummer = alex_van_halen
	allow_player_selected_characters = FALSE
}
band_vanhalen_alt = {
	GUITARIST = eddie_van_halen_alt
	BASSIST = wolf_van_halen_alt
	vocalist = david_lee_roth_alt
	drummer = alex_van_halen_alt
	allow_player_selected_characters = FALSE
}
band_vanhalen_eddie_drill = {
	GUITARIST = eddiedrill
	BASSIST = wolf_van_halen
	vocalist = david_lee_roth
	drummer = alex_van_halen
	allow_player_selected_characters = FALSE
}
band_vanhalen_eddie_alt_drill = {
	GUITARIST = eddiealtdrill
	BASSIST = wolf_van_halen_alt
	vocalist = david_lee_roth_alt
	drummer = alex_van_halen_alt
	allow_player_selected_characters = FALSE
}
band_vanhalen_wolf_drill = {
	GUITARIST = eddie_van_halen
	BASSIST = wolfdrill
	vocalist = david_lee_roth
	drummer = alex_van_halen
	allow_player_selected_characters = FALSE
}
band_vanhalen_dlr_guitar = {
	GUITARIST = eddie_van_halen
	BASSIST = wolf_van_halen
	vocalist = dlr_guitar
	drummer = alex_van_halen
	allow_player_selected_characters = FALSE
}
band_vanhalen_dlr_alt_guitar = {
	GUITARIST = eddie_van_halen_alt
	BASSIST = wolf_van_halen_alt
	vocalist = dlr_alt_guitar
	drummer = alex_van_halen_alt
	allow_player_selected_characters = FALSE
}
band_alex_headtohead = {
	GUITARIST = randomcharacter
	BASSIST = randomcharacter
	vocalist = randomcharacter
	drummer = alex_van_halen2
}
band_alex_headtohead_alt = {
	GUITARIST = randomcharacter
	BASSIST = randomcharacter
	vocalist = randomcharacter
	drummer = alex_van_halen2
}
jam_mode_band = 0
jam_mode_band_profiles = {
	GUITARIST = GUITARIST
	BASSIST = BASSIST
	vocalist = singer
	drummer = drummer
}

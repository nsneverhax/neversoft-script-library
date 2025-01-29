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
		cas_female_physique = {
			desc_id = femalephysique1
		}
		genre = rock
		presets = {
		}
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
		cas_male_physique = {
			desc_id = malephysique1
		}
		genre = rock
		presets = {
		}
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
	cas_bass_body
	cas_bass_neck
	cas_bass_head
	cas_bass_pickguards
	cas_bass_pickups
	cas_bass_bridges
	cas_bass_knobs
	cas_bass_strings
	cas_drums
	cas_drums_sticks
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
default_temporary_profile = {
	allowed_parts = [
		drum
		vocals
		guitar
		bass
	]
	selection_not_allowed
	presets = {
	}
}
default_band = {
	GUITARIST = savedbandmember
	BASSIST = savedbandmember
	vocalist = savedbandmember
	drummer = savedbandmember
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
jam_mode_band = 0
jam_mode_band_profiles = {
	GUITARIST = savedbandmember
	BASSIST = savedbandmember
	vocalist = savedbandmember
	drummer = savedbandmember
}

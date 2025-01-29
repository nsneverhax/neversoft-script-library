cas_preset_face_skin_female = [
	{
		desc_id = gh4_car_female
		cap = [
			{
				base_tex = `tex/models/characters/global/global_blank_head_dnc.dds`
				material = car_female_head
				cas_1
				post_layer = [
					{
						texture = `tex/models/characters/layers/car/female/makeup/car_female_makeup06.img`
						flags = 4
					}
					{
						texture = `tex/models/characters/layers/car/female/makeup/car_female_makeup_lip03.img`
						flags = 4
					}
				]
			}
		]
		random_weight = 2.0
	}
]
cas_preset_face_skin_male = [
	{
		desc_id = gh4_car_male
		random_weight = 1.5
	}
]

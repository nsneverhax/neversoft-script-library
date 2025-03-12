cas_omit_from_report = [
	maleclothing
	malehathair
	malehairhair
	malehair
	femaleclothing
	femalehathair
	femalehairhair
	femalehair
	genderspecific
	character
]
cas_budget_groups = [
	{
		name = character
		exclusive_groups = [
			{
				name = createarocker
				inclusive_groups = [
					{
						name = body
						parts = [
							{
								part = cas_body
								xen_skin_budget = 570
								xen_tex_budget = 3796
								xen_qb_budget = 0
							}
						]
					}
					{
						name = genderspecific
						exclusive_groups = [
							{
								name = male
								inclusive_groups = [
									{
										name = maleclothing
										parts = [
											{
												part = cas_male_hat
												xen_skin_budget = 86
												xen_tex_budget = 306
												xen_qb_budget = 0
											}
											{
												part = cas_male_facial_hair
												xen_skin_budget = 50
												xen_tex_budget = 226
												xen_qb_budget = 0
											}
											{
												part = cas_male_torso
												xen_skin_budget = 178
												xen_tex_budget = 1518
												xen_qb_budget = 0
											}
											{
												part = cas_male_legs
												xen_skin_budget = 198
												xen_tex_budget = 946
												xen_qb_budget = 0
											}
											{
												part = cas_male_shoes
												xen_skin_budget = 150
												xen_tex_budget = 378
												xen_qb_budget = 0
											}
											{
												part = cas_male_acc_left
												xen_skin_budget = 70
												xen_tex_budget = 146
												xen_qb_budget = 0
											}
											{
												part = cas_male_acc_right
												xen_skin_budget = 74
												xen_tex_budget = 142
												xen_qb_budget = 0
											}
											{
												part = cas_male_acc_face
												xen_skin_budget = 78
												xen_tex_budget = 106
												xen_qb_budget = 0
											}
											{
												part = cas_male_acc_ears
												xen_skin_budget = 22
												xen_tex_budget = 98
												xen_qb_budget = 0
											}
											{
												part = cas_male_teeth
												xen_skin_budget = 20
												xen_tex_budget = 120
												xen_qb_budget = 0
											}
										]
									}
									{
										name = malehair
										exclusive_groups = [
											{
												name = malehathair
												parts = [
													{
														part = cas_male_hat_hair
														xen_skin_budget = 106
														xen_tex_budget = 946
														xen_qb_budget = 0
													}
												]
											}
											{
												name = malehairhair
												parts = [
													{
														part = cas_male_hair
														xen_skin_budget = 106
														xen_tex_budget = 946
														xen_qb_budget = 0
													}
												]
											}
										]
									}
								]
							}
							{
								name = female
								inclusive_groups = [
									{
										name = femaleclothing
										parts = [
											{
												part = cas_female_hat
												xen_skin_budget = 66
												xen_tex_budget = 274
												xen_qb_budget = 0
											}
											{
												part = cas_female_torso
												xen_skin_budget = 182
												xen_tex_budget = 1558
												xen_qb_budget = 0
											}
											{
												part = cas_female_legs
												xen_skin_budget = 226
												xen_tex_budget = 1098
												xen_qb_budget = 0
											}
											{
												part = cas_female_shoes
												xen_skin_budget = 146
												xen_tex_budget = 354
												xen_qb_budget = 0
											}
											{
												part = cas_female_acc_left
												xen_skin_budget = 60
												xen_tex_budget = 198
												xen_qb_budget = 0
											}
											{
												part = cas_female_acc_right
												xen_skin_budget = 64
												xen_tex_budget = 182
												xen_qb_budget = 0
											}
											{
												part = cas_female_acc_face
												xen_skin_budget = 46
												xen_tex_budget = 106
												xen_qb_budget = 0
											}
											{
												part = cas_female_acc_ears
												xen_skin_budget = 22
												xen_tex_budget = 114
												xen_qb_budget = 0
											}
											{
												part = cas_female_teeth
												xen_skin_budget = 20
												xen_tex_budget = 120
												xen_qb_budget = 0
											}
										]
									}
									{
										name = femalehair
										exclusive_groups = [
											{
												name = femalehathair
												parts = [
													{
														part = cas_female_hat_hair
														xen_skin_budget = 134
														xen_tex_budget = 978
														xen_qb_budget = 0
													}
												]
											}
											{
												name = femalehairhair
												parts = [
													{
														part = cas_female_hair
														xen_skin_budget = 134
														xen_tex_budget = 978
														xen_qb_budget = 0
													}
												]
											}
										]
									}
								]
							}
						]
					}
				]
			}
			{
				name = fullbody
				parts = [
					{
						part = cas_full_body
						xen_skin_budget = 750
						xen_tex_budget = 6000
						xen_qb_budget = 0
					}
				]
			}
		]
	}
	{
		name = instrument
		exclusive_groups = [
			{
				name = stringsandvocals
				inclusive_groups = [
					{
						name = vocals
						parts = [
							{
								part = cas_mic
								xen_skin_budget = 42
								xen_tex_budget = 434
								xen_qb_budget = 0
							}
							{
								part = cas_mic_stand
								xen_skin_budget = 62
								xen_tex_budget = 434
								xen_qb_budget = 0
							}
						]
					}
					{
						name = strings
						exclusive_groups = [
							{
								name = guitar
								parts = [
									{
										part = cas_guitar_body
										xen_skin_budget = 70
										xen_tex_budget = 466
										xen_qb_budget = 32
									}
									{
										part = cas_guitar_neck
										xen_skin_budget = 15
										xen_tex_budget = 346
										xen_qb_budget = 0
									}
									{
										part = cas_guitar_head
										xen_skin_budget = 85
										xen_tex_budget = 340
										xen_qb_budget = 0
									}
									{
										part = cas_guitar_pickguards
										xen_skin_budget = 25
										xen_tex_budget = 302
										xen_qb_budget = 0
									}
									{
										part = cas_guitar_pickups
										xen_skin_budget = 45
										xen_tex_budget = 186
										xen_qb_budget = 0
									}
									{
										part = cas_guitar_bridges
										xen_skin_budget = 40
										xen_tex_budget = 174
										xen_qb_budget = 0
									}
									{
										part = cas_guitar_knobs
										xen_skin_budget = 47
										xen_tex_budget = 78
										xen_qb_budget = 0
									}
									{
										part = cas_guitar_misc
										xen_skin_budget = 35
										xen_tex_budget = 78
										xen_qb_budget = 0
									}
								]
							}
							{
								name = bass
								parts = [
									{
										part = cas_bass_body
										xen_skin_budget = 60
										xen_tex_budget = 534
										xen_qb_budget = 32
									}
									{
										part = cas_bass_neck
										xen_skin_budget = 12
										xen_tex_budget = 350
										xen_qb_budget = 0
									}
									{
										part = cas_bass_head
										xen_skin_budget = 75
										xen_tex_budget = 360
										xen_qb_budget = 0
									}
									{
										part = cas_bass_pickguards
										xen_skin_budget = 30
										xen_tex_budget = 338
										xen_qb_budget = 0
									}
									{
										part = cas_bass_pickups
										xen_skin_budget = 40
										xen_tex_budget = 102
										xen_qb_budget = 0
									}
									{
										part = cas_bass_bridges
										xen_skin_budget = 35
										xen_tex_budget = 142
										xen_qb_budget = 0
									}
									{
										part = cas_bass_knobs
										xen_skin_budget = 43
										xen_tex_budget = 90
										xen_qb_budget = 0
									}
									{
										part = cas_bass_misc
										xen_skin_budget = 35
										xen_tex_budget = 78
										xen_qb_budget = 0
									}
								]
							}
							{
								name = fullinstrument
								parts = [
									{
										part = cas_full_instrument
										xen_skin_budget = 100
										xen_tex_budget = 1000
										xen_qb_budget = 0
									}
								]
							}
						]
					}
				]
			}
			{
				name = drums
				parts = [
					{
						part = cas_drums
						xen_skin_budget = 550
						xen_tex_budget = 1022
						xen_qb_budget = 0
					}
					{
						part = cas_drums_sticks
						xen_skin_budget = 22
						xen_tex_budget = 46
						xen_qb_budget = 0
					}
				]
			}
		]
	}
]
cas_band_logo_budget = [
	{
		name = bandlogo
		parts = [
			{
				part = cas_band_logo
				xen_skin_budget = 30
				xen_tex_budget = 300
				xen_qb_budget = 0
			}
		]
	}
]

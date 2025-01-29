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
cas_budget_in_kb = 1
cas_budget_groups = [
	{
		Name = character
		exclusive_groups = [
			{
				Name = createarocker
				inclusive_groups = [
					{
						Name = Body
						parts = [
							{
								part = cas_body
								xen_budget = 3948
								ps3_budget = 490
								ps3_budget_vram = 3370
							}
						]
					}
					{
						Name = genderspecific
						exclusive_groups = [
							{
								Name = male
								inclusive_groups = [
									{
										Name = maleclothing
										parts = [
											{
												part = cas_male_hat
												xen_budget = 328
												ps3_budget = 64
												ps3_budget_vram = 220
											}
											{
												part = cas_male_facial_hair
												xen_budget = 272
												ps3_budget = 44
												ps3_budget_vram = 172
											}
											{
												part = cas_male_torso
												xen_budget = 1560
												ps3_budget = 142
												ps3_budget_vram = 1468
											}
											{
												part = cas_male_legs
												xen_budget = 1000
												ps3_budget = 172
												ps3_budget_vram = 864
											}
											{
												part = cas_male_shoes
												xen_budget = 436
												ps3_budget = 124
												ps3_budget_vram = 314
											}
											{
												part = cas_male_acc_left
												xen_budget = 188
												ps3_budget = 58
												ps3_budget_vram = 94
											}
											{
												part = cas_male_acc_right
												xen_budget = 192
												ps3_budget = 76
												ps3_budget_vram = 100
											}
											{
												part = cas_male_acc_face
												xen_budget = 184
												ps3_budget = 56
												ps3_budget_vram = 58
											}
											{
												part = cas_male_acc_ears
												xen_budget = 120
												ps3_budget = 10
												ps3_budget_vram = 20
											}
										]
									}
									{
										Name = malehair
										exclusive_groups = [
											{
												Name = malehathair
												parts = [
													{
														part = cas_male_hat_hair
														xen_budget = 1000
														ps3_budget = 84
														ps3_budget_vram = 868
													}
												]
											}
											{
												Name = malehairhair
												parts = [
													{
														part = cas_male_hair
														xen_budget = 1000
														ps3_budget = 84
														ps3_budget_vram = 868
													}
												]
											}
										]
									}
								]
							}
							{
								Name = female
								inclusive_groups = [
									{
										Name = femaleclothing
										parts = [
											{
												part = cas_female_hat
												xen_budget = 320
												ps3_budget = 48
												ps3_budget_vram = 184
											}
											{
												part = cas_female_torso
												xen_budget = 1612
												ps3_budget = 142
												ps3_budget_vram = 1510
											}
											{
												part = cas_female_legs
												xen_budget = 1220
												ps3_budget = 160
												ps3_budget_vram = 934
											}
											{
												part = cas_female_shoes
												xen_budget = 408
												ps3_budget = 126
												ps3_budget_vram = 232
											}
											{
												part = cas_female_acc_left
												xen_budget = 244
												ps3_budget = 62
												ps3_budget_vram = 102
											}
											{
												part = cas_female_acc_right
												xen_budget = 216
												ps3_budget = 58
												ps3_budget_vram = 102
											}
											{
												part = cas_female_acc_face
												xen_budget = 136
												ps3_budget = 34
												ps3_budget_vram = 52
											}
											{
												part = cas_female_acc_ears
												xen_budget = 120
												ps3_budget = 10
												ps3_budget_vram = 36
											}
										]
									}
									{
										Name = femalehair
										exclusive_groups = [
											{
												Name = femalehathair
												parts = [
													{
														part = cas_female_hat_hair
														xen_budget = 1052
														ps3_budget = 86
														ps3_budget_vram = 940
													}
												]
											}
											{
												Name = femalehairhair
												parts = [
													{
														part = cas_female_hair
														xen_budget = 1052
														ps3_budget = 86
														ps3_budget_vram = 940
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
				Name = fullbody
				parts = [
					{
						part = cas_full_body
						xen_budget = 9000
						ps3_budget = 700
						ps3_budget_vram = 7000
					}
				]
			}
		]
	}
	{
		Name = instrument
		exclusive_groups = [
			{
				Name = stringsandvocals
				inclusive_groups = [
					{
						Name = vocals
						parts = [
							{
								part = cas_mic
								xen_budget = 460
								ps3_budget = 30
								ps3_budget_vram = 358
							}
							{
								part = cas_mic_stand
								xen_budget = 472
								ps3_budget = 52
								ps3_budget_vram = 362
							}
						]
					}
					{
						Name = strings
						exclusive_groups = [
							{
								Name = guitar
								parts = [
									{
										part = cas_guitar_body
										xen_budget = 516
										ps3_budget = 62
										ps3_budget_vram = 456
									}
									{
										part = cas_guitar_neck
										xen_budget = 348
										ps3_budget = 12
										ps3_budget_vram = 270
									}
									{
										part = cas_guitar_head
										xen_budget = 385
										ps3_budget = 60
										ps3_budget_vram = 270
									}
									{
										part = cas_guitar_pickguards
										xen_budget = 312
										ps3_budget = 26
										ps3_budget_vram = 240
									}
									{
										part = cas_guitar_pickups
										xen_budget = 196
										ps3_budget = 32
										ps3_budget_vram = 110
									}
									{
										part = cas_guitar_bridges
										xen_budget = 200
										ps3_budget = 38
										ps3_budget_vram = 120
									}
									{
										part = cas_guitar_knobs
										xen_budget = 92
										ps3_budget = 22
										ps3_budget_vram = 41
									}
								]
							}
							{
								Name = bass
								parts = [
									{
										part = cas_bass_body
										xen_budget = 552
										ps3_budget = 53
										ps3_budget_vram = 507
									}
									{
										part = cas_bass_neck
										xen_budget = 348
										ps3_budget = 12
										ps3_budget_vram = 292
									}
									{
										part = cas_bass_head
										xen_budget = 401
										ps3_budget = 70
										ps3_budget_vram = 250
									}
									{
										part = cas_bass_pickguards
										xen_budget = 336
										ps3_budget = 22
										ps3_budget_vram = 276
									}
									{
										part = cas_bass_pickups
										xen_budget = 120
										ps3_budget = 30
										ps3_budget_vram = 40
									}
									{
										part = cas_bass_bridges
										xen_budget = 164
										ps3_budget = 22
										ps3_budget_vram = 48
									}
									{
										part = cas_bass_knobs
										xen_budget = 108
										ps3_budget = 24
										ps3_budget_vram = 24
									}
								]
							}
							{
								Name = fullinstrument
								parts = [
									{
										part = cas_full_instrument
										xen_budget = 1400
										ps3_budget = 60
										ps3_budget_vram = 200
									}
								]
							}
						]
					}
				]
			}
			{
				Name = drums
				parts = [
					{
						part = cas_drums
						xen_budget = 1588
						ps3_budget = 404
						ps3_budget_vram = 1030
					}
					{
						part = cas_drums_sticks
						xen_budget = 55
						ps3_budget = 14
						ps3_budget_vram = 14
					}
				]
			}
		]
	}
]
cas_band_logo_budget = [
	{
		Name = bandlogo
		parts = [
			{
				part = cas_band_logo
				xen_budget = 270
				ps3_budget = 35
				ps3_budget_vram = 270
			}
		]
	}
]

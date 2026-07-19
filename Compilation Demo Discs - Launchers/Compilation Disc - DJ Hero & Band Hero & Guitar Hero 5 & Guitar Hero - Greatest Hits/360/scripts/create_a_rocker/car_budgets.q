cas_omit_from_report = [
	MaleClothing
	MaleHatHair
	MaleHairHair
	MaleHair
	FemaleClothing
	FemaleHatHair
	FemaleHairHair
	FemaleHair
	GenderSpecific
	character
]
cas_budget_in_kb = 1
cas_budget_groups = [
	{
		name = character
		exclusive_groups = [
			{
				name = createarocker
				inclusive_groups = [
					{
						name = Body
						parts = [
							{
								part = CAS_Body
								xen_budget = 3948
								ps3_budget = 490
								ps3_budget_vram = 3370
							}
						]
					}
					{
						name = GenderSpecific
						exclusive_groups = [
							{
								name = Male
								inclusive_groups = [
									{
										name = MaleClothing
										parts = [
											{
												part = CAS_Male_Hat
												xen_budget = 328
												ps3_budget = 64
												ps3_budget_vram = 220
											}
											{
												part = CAS_Male_Facial_Hair
												xen_budget = 272
												ps3_budget = 44
												ps3_budget_vram = 172
											}
											{
												part = CAS_Male_Torso
												xen_budget = 1560
												ps3_budget = 142
												ps3_budget_vram = 1468
											}
											{
												part = CAS_Male_Legs
												xen_budget = 1000
												ps3_budget = 172
												ps3_budget_vram = 864
											}
											{
												part = CAS_Male_Shoes
												xen_budget = 436
												ps3_budget = 124
												ps3_budget_vram = 314
											}
											{
												part = CAS_Male_Acc_Left
												xen_budget = 188
												ps3_budget = 58
												ps3_budget_vram = 94
											}
											{
												part = CAS_Male_Acc_Right
												xen_budget = 192
												ps3_budget = 76
												ps3_budget_vram = 100
											}
											{
												part = CAS_Male_Acc_Face
												xen_budget = 184
												ps3_budget = 56
												ps3_budget_vram = 58
											}
											{
												part = CAS_Male_Acc_Ears
												xen_budget = 120
												ps3_budget = 10
												ps3_budget_vram = 20
											}
										]
									}
									{
										name = MaleHair
										exclusive_groups = [
											{
												name = MaleHatHair
												parts = [
													{
														part = CAS_Male_Hat_Hair
														xen_budget = 1000
														ps3_budget = 84
														ps3_budget_vram = 868
													}
												]
											}
											{
												name = MaleHairHair
												parts = [
													{
														part = CAS_Male_Hair
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
								name = Female
								inclusive_groups = [
									{
										name = FemaleClothing
										parts = [
											{
												part = CAS_Female_Hat
												xen_budget = 320
												ps3_budget = 48
												ps3_budget_vram = 184
											}
											{
												part = CAS_Female_Torso
												xen_budget = 1612
												ps3_budget = 142
												ps3_budget_vram = 1510
											}
											{
												part = CAS_Female_Legs
												xen_budget = 1220
												ps3_budget = 160
												ps3_budget_vram = 934
											}
											{
												part = CAS_Female_Shoes
												xen_budget = 408
												ps3_budget = 126
												ps3_budget_vram = 232
											}
											{
												part = CAS_Female_Acc_Left
												xen_budget = 244
												ps3_budget = 62
												ps3_budget_vram = 102
											}
											{
												part = CAS_Female_Acc_Right
												xen_budget = 216
												ps3_budget = 58
												ps3_budget_vram = 102
											}
											{
												part = CAS_Female_Acc_Face
												xen_budget = 136
												ps3_budget = 34
												ps3_budget_vram = 52
											}
											{
												part = CAS_Female_Acc_Ears
												xen_budget = 120
												ps3_budget = 10
												ps3_budget_vram = 36
											}
										]
									}
									{
										name = FemaleHair
										exclusive_groups = [
											{
												name = FemaleHatHair
												parts = [
													{
														part = CAS_Female_Hat_Hair
														xen_budget = 1052
														ps3_budget = 86
														ps3_budget_vram = 940
													}
												]
											}
											{
												name = FemaleHairHair
												parts = [
													{
														part = CAS_Female_Hair
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
				name = FullBody
				parts = [
					{
						part = CAS_Full_Body
						xen_budget = 9000
						ps3_budget = 700
						ps3_budget_vram = 7000
					}
				]
			}
		]
	}
	{
		name = instrument
		exclusive_groups = [
			{
				name = StringsAndVocals
				inclusive_groups = [
					{
						name = Vocals
						parts = [
							{
								part = CAS_Mic
								xen_budget = 460
								ps3_budget = 30
								ps3_budget_vram = 358
							}
							{
								part = CAS_Mic_Stand
								xen_budget = 472
								ps3_budget = 52
								ps3_budget_vram = 362
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
										part = CAS_Guitar_Body
										xen_budget = 516
										ps3_budget = 62
										ps3_budget_vram = 456
									}
									{
										part = CAS_Guitar_Neck
										xen_budget = 348
										ps3_budget = 12
										ps3_budget_vram = 270
									}
									{
										part = CAS_Guitar_Head
										xen_budget = 385
										ps3_budget = 60
										ps3_budget_vram = 270
									}
									{
										part = CAS_Guitar_Pickguards
										xen_budget = 312
										ps3_budget = 26
										ps3_budget_vram = 240
									}
									{
										part = CAS_Guitar_Pickups
										xen_budget = 196
										ps3_budget = 32
										ps3_budget_vram = 110
									}
									{
										part = CAS_Guitar_Bridges
										xen_budget = 200
										ps3_budget = 38
										ps3_budget_vram = 120
									}
									{
										part = CAS_Guitar_Knobs
										xen_budget = 92
										ps3_budget = 22
										ps3_budget_vram = 41
									}
								]
							}
							{
								name = Bass
								parts = [
									{
										part = CAS_Bass_Body
										xen_budget = 552
										ps3_budget = 53
										ps3_budget_vram = 507
									}
									{
										part = CAS_Bass_Neck
										xen_budget = 348
										ps3_budget = 12
										ps3_budget_vram = 292
									}
									{
										part = CAS_Bass_Head
										xen_budget = 401
										ps3_budget = 70
										ps3_budget_vram = 250
									}
									{
										part = CAS_Bass_Pickguards
										xen_budget = 336
										ps3_budget = 22
										ps3_budget_vram = 276
									}
									{
										part = CAS_Bass_Pickups
										xen_budget = 120
										ps3_budget = 30
										ps3_budget_vram = 40
									}
									{
										part = CAS_Bass_Bridges
										xen_budget = 164
										ps3_budget = 22
										ps3_budget_vram = 48
									}
									{
										part = CAS_Bass_Knobs
										xen_budget = 108
										ps3_budget = 24
										ps3_budget_vram = 24
									}
								]
							}
							{
								name = FullInstrument
								parts = [
									{
										part = CAS_Full_Instrument
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
				name = Drums
				parts = [
					{
						part = CAS_Drums
						xen_budget = 1588
						ps3_budget = 404
						ps3_budget_vram = 1030
					}
					{
						part = CAS_Drums_Sticks
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
		name = BandLogo
		parts = [
			{
				part = CAS_Band_Logo
				xen_budget = 270
				ps3_budget = 35
				ps3_budget_vram = 270
			}
		]
	}
]

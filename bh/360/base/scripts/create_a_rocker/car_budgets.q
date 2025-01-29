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
								xen_skin_budget = 570
								xen_tex_budget = 3796
								xen_qb_budget = 0
							}
						]
					}
					{
						name = GenderSpecific
						exclusive_groups = [
							{
								name = male
								inclusive_groups = [
									{
										name = MaleClothing
										parts = [
											{
												part = CAS_Male_Hat
												xen_skin_budget = 86
												xen_tex_budget = 306
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Facial_Hair
												xen_skin_budget = 50
												xen_tex_budget = 226
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Torso
												xen_skin_budget = 178
												xen_tex_budget = 1518
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Legs
												xen_skin_budget = 198
												xen_tex_budget = 946
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Shoes
												xen_skin_budget = 150
												xen_tex_budget = 378
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Acc_Left
												xen_skin_budget = 70
												xen_tex_budget = 146
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Acc_Right
												xen_skin_budget = 74
												xen_tex_budget = 142
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Acc_Face
												xen_skin_budget = 78
												xen_tex_budget = 106
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Acc_Ears
												xen_skin_budget = 22
												xen_tex_budget = 98
												xen_qb_budget = 0
											}
											{
												part = CAS_Male_Teeth
												xen_skin_budget = 20
												xen_tex_budget = 120
												xen_qb_budget = 0
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
														xen_skin_budget = 106
														xen_tex_budget = 946
														xen_qb_budget = 0
													}
												]
											}
											{
												name = MaleHairHair
												parts = [
													{
														part = CAS_Male_Hair
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
										name = FemaleClothing
										parts = [
											{
												part = CAS_Female_Hat
												xen_skin_budget = 66
												xen_tex_budget = 274
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Torso
												xen_skin_budget = 182
												xen_tex_budget = 1558
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Legs
												xen_skin_budget = 226
												xen_tex_budget = 1098
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Shoes
												xen_skin_budget = 146
												xen_tex_budget = 354
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Acc_Left
												xen_skin_budget = 60
												xen_tex_budget = 198
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Acc_Right
												xen_skin_budget = 64
												xen_tex_budget = 182
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Acc_Face
												xen_skin_budget = 46
												xen_tex_budget = 106
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Acc_Ears
												xen_skin_budget = 22
												xen_tex_budget = 114
												xen_qb_budget = 0
											}
											{
												part = CAS_Female_Teeth
												xen_skin_budget = 20
												xen_tex_budget = 120
												xen_qb_budget = 0
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
														xen_skin_budget = 134
														xen_tex_budget = 978
														xen_qb_budget = 0
													}
												]
											}
											{
												name = FemaleHairHair
												parts = [
													{
														part = CAS_Female_Hair
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
				name = FullBody
				parts = [
					{
						part = CAS_Full_Body
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
				name = StringsAndVocals
				inclusive_groups = [
					{
						name = vocals
						parts = [
							{
								part = CAS_Mic
								xen_skin_budget = 42
								xen_tex_budget = 434
								xen_qb_budget = 0
							}
							{
								part = CAS_Mic_Stand
								xen_skin_budget = 62
								xen_tex_budget = 434
								xen_qb_budget = 0
							}
						]
					}
					{
						name = Strings
						exclusive_groups = [
							{
								name = guitar
								parts = [
									{
										part = CAS_Guitar_Body
										xen_skin_budget = 70
										xen_tex_budget = 466
										xen_qb_budget = 32
									}
									{
										part = CAS_Guitar_Neck
										xen_skin_budget = 15
										xen_tex_budget = 346
										xen_qb_budget = 0
									}
									{
										part = CAS_Guitar_Head
										xen_skin_budget = 85
										xen_tex_budget = 340
										xen_qb_budget = 0
									}
									{
										part = CAS_Guitar_Pickguards
										xen_skin_budget = 25
										xen_tex_budget = 302
										xen_qb_budget = 0
									}
									{
										part = CAS_Guitar_Pickups
										xen_skin_budget = 45
										xen_tex_budget = 186
										xen_qb_budget = 0
									}
									{
										part = CAS_Guitar_Bridges
										xen_skin_budget = 40
										xen_tex_budget = 174
										xen_qb_budget = 0
									}
									{
										part = CAS_Guitar_Knobs
										xen_skin_budget = 47
										xen_tex_budget = 78
										xen_qb_budget = 0
									}
									{
										part = CAS_Guitar_Misc
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
										part = CAS_Bass_Body
										xen_skin_budget = 60
										xen_tex_budget = 534
										xen_qb_budget = 32
									}
									{
										part = CAS_Bass_Neck
										xen_skin_budget = 12
										xen_tex_budget = 350
										xen_qb_budget = 0
									}
									{
										part = CAS_Bass_Head
										xen_skin_budget = 75
										xen_tex_budget = 360
										xen_qb_budget = 0
									}
									{
										part = CAS_Bass_Pickguards
										xen_skin_budget = 30
										xen_tex_budget = 338
										xen_qb_budget = 0
									}
									{
										part = CAS_Bass_Pickups
										xen_skin_budget = 40
										xen_tex_budget = 102
										xen_qb_budget = 0
									}
									{
										part = CAS_bass_Bridges
										xen_skin_budget = 35
										xen_tex_budget = 142
										xen_qb_budget = 0
									}
									{
										part = CAS_Bass_Knobs
										xen_skin_budget = 43
										xen_tex_budget = 90
										xen_qb_budget = 0
									}
									{
										part = CAS_Bass_Misc
										xen_skin_budget = 35
										xen_tex_budget = 78
										xen_qb_budget = 0
									}
								]
							}
							{
								name = FullInstrument
								parts = [
									{
										part = CAS_Full_Instrument
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
						part = CAS_Drums
						xen_skin_budget = 550
						xen_tex_budget = 1022
						xen_qb_budget = 0
					}
					{
						part = CAS_Drums_Sticks
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
		name = BandLogo
		parts = [
			{
				part = CAS_BAND_LOGO
				xen_skin_budget = 30
				xen_tex_budget = 300
				xen_qb_budget = 0
			}
		]
	}
]

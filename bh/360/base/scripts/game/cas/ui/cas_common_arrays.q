generic_widget_scale_params = {
	step = 0.1
	fill_type = `Center	Out`
	icon = widget_scale
	pad_direction = vert
}
generic_widget_spread_horiz_params = {
	step = 0.1
	fill_type = `Center	Left/Right`
	icon = widget_spread
	pad_direction = horiz
}
generic_widget_spread_vert_params = {
	step = 0.1
	fill_type = `Center	Up/Down`
	icon = widget_spread
	icon_rot = 90
	pad_direction = vert
}
generic_widget_move_vert_params = {
	step = 0.1
	fill_type = `Center	Up/Down`
	icon = widget_uni_move
	pad_direction = vert
}
generic_widget_move_horz_params = {
	step = 0.1
	fill_type = `Center	Left/Right`
	icon = widget_uni_move
	icon_rot = 90
	pad_direction = horiz
}
cas_head_bone_options = [
	{
		text = qs(0xf8e8e019)
		group_name = FaceFullness
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0xb0e937da)
		group_name = JawProminence
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xc051d1ab)
		group_name = JawShape
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0x16fc5cf5)
		$generic_widget_spread_horiz_params
		group_name = ChinProminence
		bonemenu
	}
	{
		text = qs(0x23ad871a)
		$generic_widget_spread_horiz_params
		group_name = ChinWidth
		bonemenu
	}
	{
		text = qs(0x67d1a042)
		$generic_widget_spread_horiz_params
		group_name = ChinHeight
		bonemenu
	}
	{
		text = qs(0xa54f0c3f)
		$generic_widget_spread_vert_params
		group_name = ChinAngle
		bonemenu
	}
	{
		text = qs(0x9233b900)
		$generic_widget_spread_horiz_params
		group_name = ChinCleft
		bonemenu
	}
	{
		text = qs(0xa70e0d95)
		$generic_widget_spread_vert_params
		group_name = Wattle
		bonemenu
	}
	{
		text = qs(0x37acd2d4)
		group_name = CheekboneProminence
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xa8ec3d68)
		group_name = CheekboneDepth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0x516cd719)
		group_name = EarProminence
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xde88b585)
		group_name = EarSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0xb28d1bae)
		group_name = EarShape
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xcfb7d01a)
		group_name = EarTip
		$generic_widget_spread_vert_params
		bonemenu
	}
	{
		text = qs(0xcbbd9d6b)
		group_name = EarlobeSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0xe977c14d)
		group_name = EarlobeLength
		$generic_widget_spread_vert_params
		bonemenu
	}
]
cas_eye_bone_options = [
	{
		text = qs(0x718ceac0)
		group_name = EyeScale
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0x36291eb1)
		group_name = EyeShape
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0x2857348f)
		group_name = EyeCornerShape
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x1f8b4dd9)
		group_name = EyeAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0xb1cc1727)
		group_name = EyePosition
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x29344d54)
		group_name = EyeDistance
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xaa2546c1)
		desc_id = EyeColor
		hist_tex = widget_color
		part = CAS_Eyes
		stance = Stance_Select_Head
		replacemenu
	}
]
cas_brow_bone_options = [
	{
		text = qs(0x36291eb1)
		group_name = EyebrowShape
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x409ddb91)
		group_name = EyebrowSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0x1f8b4dd9)
		group_name = EyebrowAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x29344d54)
		group_name = EyebrowDistance
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xb1cc1727)
		group_name = BrowPosition
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x9a18a9d5)
		group_name = BrowDepth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xe8775204)
		desc_id = Eyebrows
		hist_tex = widget_brow_style
		part = CAS_Eyebrows
		stance = Stance_Select_Head
		return_stance = Stance_Select_Head
		replacemenu
	}
	{
		text = qs(0xaa2546c1)
		desc_id = Eyebrows
		hist_tex = widget_color
		part = CAS_Body
		stance = Stance_Select_Head
		return_stance = Stance_Select_Head
		materialmenu
	}
]
cas_nose_bone_options = [
	{
		text = qs(0x409ddb91)
		group_name = NoseSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0x9969c6fc)
		group_name = NoseWidth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0x9b55b8f6)
		group_name = NoseLength
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0x1f8b4dd9)
		group_name = NoseAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0xb1cc1727)
		group_name = NosePosition
		$generic_widget_move_vert_params
		invert = {
			invert
		}
		bonemenu
	}
	{
		text = qs(0xc64e5a53)
		group_name = NoseTipHeight
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x4e4172f8)
		group_name = NoseTipWidth
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x3335dd4f)
		group_name = NoseTipLength
		$generic_widget_move_horz_params
		bonemenu
	}
	{
		text = qs(0xc8a3f9dd)
		group_name = NoseTipAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0xeb75c094)
		group_name = NoseNostrilSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0x9e2080cd)
		group_name = NoseNostrilHeight
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0xe899db98)
		group_name = NoseNostrilAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0xcc450cf2)
		group_name = NoseBridge
		$generic_widget_move_horz_params
		bonemenu
	}
]
cas_mouth_bone_options = [
	{
		text = qs(0x409ddb91)
		group_name = MouthScale
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0x1f8b4dd9)
		group_name = MouthAngle
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0x9a18a9d5)
		group_name = MouthDepth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs(0xb1cc1727)
		group_name = MouthPosition
		$generic_widget_move_vert_params
		invert = {
			invert
		}
		bonemenu
	}
	{
		text = qs(0x4f69eab1)
		group_name = LipShapeUpper
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x2c4c53ac)
		group_name = LipShapeLower
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs(0x2baf81a4)
		group_name = UpperLipThickness
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs(0xb2f1b506)
		group_name = LowerLipThickness
		$generic_widget_scale_params
		bonemenu
	}
]
cas_physique_bone_options = [
	{
		text = qs(0x6e2e3fea)
		group_name = height
		step = 0.25
		fill_type = `Bottom	to	Top`
		icon = widget_uni_scale
		bonemenu
	}
]
cag_instruments = [
	{
		text = qs(0x9504b94a)
		icon = icon_cag_guitar
		desc_id = guitar
		instrument_name = guitar
		body_part = CAS_Guitar_Body
		neck_part = CAS_Guitar_Neck
		head_part = CAS_Guitar_Head
		pick_guard_part = CAS_Guitar_Pickguards
		pickups_part = CAS_Guitar_Pickups
		knobs_part = CAS_Guitar_Knobs
		bridge_part = CAS_Guitar_Bridges
		misc_part = CAS_Guitar_Misc
		string_part = CAS_Guitar_Strings
	}
	{
		text = qs(0x7d4f9214)
		icon = icon_cag_bass
		desc_id = bass
		instrument_name = bass
		body_part = CAS_Bass_Body
		neck_part = CAS_Bass_Neck
		head_part = CAS_Bass_Head
		pick_guard_part = CAS_Bass_Pickguards
		pickups_part = CAS_Bass_Pickups
		knobs_part = CAS_Bass_Knobs
		bridge_part = CAS_bass_Bridges
		misc_part = CAS_Bass_Misc
		string_part = CAS_Bass_Strings
	}
	{
		text = qs(0xcf488ba5)
		desc_id = Drum
		instrument_name = Drum
		body_part = CAS_Drums
		stick_part = CAS_Drums_Sticks
	}
	{
		text = qs(0xc0b34c9f)
		desc_id = mic
		instrument_name = mic
		body_part = CAS_Mic
		stand_part = CAS_Mic_Stand
	}
]
cas_genre_list = [
	{
		frontend_desc = qs(0x3b7f4394)
		desc_id = Pop
		icon = icon_genre_Pop
	}
	{
		frontend_desc = qs(0x3b7647f0)
		desc_id = `Classic	Rock`
		icon = icon_genre_Classic
	}
	{
		frontend_desc = qs(0xfbfef3d4)
		desc_id = Punk
		icon = icon_genre_Punk
	}
	{
		frontend_desc = qs(0xe9fc0d89)
		desc_id = rock
		icon = icon_genre_Rock
	}
	{
		frontend_desc = qs(0xa7602f65)
		desc_id = `Glam	Rock`
		icon = icon_genre_Glam
	}
	{
		frontend_desc = qs(0x3b440e23)
		desc_id = Goth
		icon = icon_genre_Goth
	}
	{
		frontend_desc = qs(0xfe37a2a0)
		desc_id = `Heavy	Metal`
		icon = icon_genre_HeavyMetal
	}
	{
		frontend_desc = qs(0xf39d9fe1)
		desc_id = `Black	Metal`
		icon = icon_genre_BlackMetal
	}
	{
		frontend_desc = qs(0x99e16acb)
		desc_id = any
		icon = icon_genre_Mix
	}
]
CAS_Sponsors = [
	{
		id = `BC	Rich`
		display_name = qs(0x3a7cc0df)
		texture = bc_rich_logo
	}
	{
		id = ESP
		display_name = qs(0x72ab389b)
		texture = esp_logo
	}
	{
		id = Schecter
		display_name = qs(0xc4df43c6)
		texture = schecter_logo
	}
	{
		id = Ibanez
		display_name = qs(0x0b6538fe)
		texture = ibanez_logo
	}
	{
		id = McSwain
		display_name = qs(0x0d8538f7)
		texture = mcswain_logo
	}
	{
		id = `Music	Man`
		display_name = qs(0x5f8c33e9)
		texture = music_man_logo
	}
	{
		id = Daisy
		display_name = qs(0x3fe90329)
		texture = daisy_rock_logo
	}
	{
		id = PRS
		display_name = qs(0xb2219f15)
		texture = prs_logo
	}
	{
		id = EMG
		display_name = qs(0xc7ee9ca1)
		texture = EMG_logo
	}
	{
		id = `Seymour	Duncan`
		display_name = qs(0x32eefc85)
		texture = SeymourDuncan_logo
	}
	{
		id = `Audio	Technica`
		display_name = qs(0x6821508f)
		texture = audio_technica_logo
	}
	{
		id = Tama
		display_name = qs(0x3db3746d)
		texture = tama_logo
	}
	{
		id = `Pork	Pie`
		display_name = qs(0x4b7eea37)
		texture = porkpie_logo
	}
	{
		id = Zildjian
		display_name = qs(0xee4507a6)
		texture = Zildjian_logo
	}
	{
		id = Ahead
		display_name = qs(0xb431e035)
		texture = ahead_logo
	}
	{
		id = Regal
		display_name = qs(0xdc422f60)
		texture = regal_tip_logo
	}
]

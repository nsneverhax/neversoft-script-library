cas_drums = [
	{
		desc_id = basic
		frontend_desc = qs(0xad046885)
		mesh = 'models\\CAR_Instruments\\Drums\\SingleBassKit.skin'
		sections = [
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\drumshell_ds_pork1.dds'
				material = cad_drums_01_primary
				$car_rocker_drums_factoredglobal_0
				desc_id = finishes
				frontend_desc = qs(0x9f20f698)
				mask = $singlebasskit2_finishes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_0
				desc_id = details
				frontend_desc = qs(0x50a6f3e5)
				mask = $singlebasskit2_finishes_bassdrum
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = car_graphics
				frontend_desc = qs(0xde6cb37a)
				mask = $car_graphics
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = car_icon_decals
				frontend_desc = qs(0xcd9be7cd)
				mask = $car_icons
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = car_primitives
				frontend_desc = qs(0x7dc468d3)
				mask = $car_basic_primitives_1
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = car_outlines_primitives
				frontend_desc = qs(0x955f1285)
				mask = $car_basic_primitives_2
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x80142024)
				mask = $car_gradiant_shapes
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = car_sponsors
				frontend_desc = qs(0xc26f9911)
				mask = $car_sponsors
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = `font a1`
				frontend_desc = qs(0x272e6e53)
				mask = $car_fontgrid_text_a10
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = `font a6`
				frontend_desc = qs(0x0c033d90)
				mask = $car_fontgrid_bordello
			}
			{
				base_tex = 'tex\\models\\CAR_Instruments\\Drums\\bass_skin_DS_15a.dds'
				material = cad_drums_01_bassdrum
				$car_rocker_drums_factoredglobal_3
				desc_id = `font a8`
				frontend_desc = qs(0x15180cd1)
				mask = $car_fontgrid_denim_title
			}
		]
	}
]
cas_drums_sticks = [
	{
		desc_id = drumsticks1
		frontend_desc = qs(0x4a301f1d)
		mesh = 'models\\CAR_Instruments\\Drums\\CAD_Sticks_01.skin'
	}
]
car_rocker_drums_factoredglobal_0 = {
	diffuse
	pre_userlayer
}
car_rocker_drums_factoredglobal_3 = {
	userlayer
	diffuse
}

cas_band_logo_details = {
	AssetContext = band_logo
	texdict = `models/skater_male/shared/car_logo_test.tex`
	textureasset = `tex\models\characters\global\global_blank_logo.dds`
}
cas_band_logo = [
	{
		desc_id = cas_band_logo_id
		frontend_desc = qs(0x50df6bb6)
		mesh = 'models/Skater_Male/Shared/CAR_Logo_Test.skin'
		materials = [
			band_logo_primary
		]
		random_weight = 1.0
		sections = [
			{
				desc_id = car_primitives
				frontend_desc = qs(0x7dc468d3)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_basic_primitives_1
				userlayer
				omit_base_tex
				diffuse
			}
			{
				desc_id = car_outlines_primitives
				frontend_desc = qs(0x955f1285)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_basic_primitives_2
				userlayer
				omit_base_tex
				diffuse
			}
			{
				desc_id = car_tattoo_decal
				frontend_desc = qs(0x80142024)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_gradiant_shapes
				userlayer
				omit_base_tex
				diffuse
			}
			{
				desc_id = car_icon_decals
				frontend_desc = qs(0xcd9be7cd)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_icons
				userlayer
				omit_base_tex
				diffuse
			}
			{
				desc_id = car_graphics
				frontend_desc = qs(0xde6cb37a)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_graphics
				userlayer
				omit_base_tex
				diffuse
			}
			{
				desc_id = car_sponsors
				frontend_desc = qs(0xc26f9911)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_sponsors
				userlayer
				omit_base_tex
				diffuse
			}
			{
				desc_id = `font	a1`
				frontend_desc = qs(0xf9a2451f)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_fontgrid_text_a10
				diffuse
				omit_base_tex
				userlayer
			}
			{
				desc_id = `font	a6`
				frontend_desc = qs(0xd28f16dc)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_fontgrid_bordello
				diffuse
				omit_base_tex
				userlayer
			}
			{
				desc_id = `font	a8`
				frontend_desc = qs(0xcb94279d)
				base_tex = 'tex\\models\\Characters\\Global\\Global_Blank_Logo.dds'
				material = band_logo_primary
				mask = $car_fontgrid_denim_title
				diffuse
				omit_base_tex
				userlayer
			}
		]
	}
]

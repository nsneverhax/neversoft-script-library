cas_band_logo_details = {
	assetcontext = band_logo
	texdict = `models/skater_male/shared/car_logo_test.tex`
	textureasset = `tex\models\characters\global\global_blank_logo.dds`
}
cas_band_logo = [
	{
		desc_id = cas_band_logo_id
		frontend_desc = qs(0x50df6bb6)
		mesh = `models/skater_male/shared/car_logo_test`
		materials = [
			band_logo_primary
		]
		random_weight = 1.0
		cap_textures = [
			{
				base_tex = `tex\models\characters\global\global_blank_logo`
				material = band_logo_primary
				omit_base_tex
				user_layer_settings = {
					diffuse
				}
			}
		]
	}
]

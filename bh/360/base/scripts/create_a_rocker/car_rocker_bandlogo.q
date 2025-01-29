CAS_Band_Logo_Details = {
	AssetContext = band_logo
	texdict = `models/Skater_Male/Shared/CAR_Logo_Test.tex`
	textureasset = `tex\models\Characters\Global\Global_Blank_Logo.dds`
}
CAS_BAND_LOGO = [
	{
		desc_id = CAS_Band_Logo_id
		frontend_desc = qs(0x50df6bb6)
		mesh = `models/Skater_Male/Shared/CAR_Logo_Test`
		materials = [
			Band_Logo_Primary
		]
		random_weight = 1.0
		cap_textures = [
			{
				base_tex = `tex\models\Characters\Global\Global_Blank_Logo`
				material = Band_Logo_Primary
				omit_base_tex
				user_layer_settings = {
					diffuse
				}
			}
		]
	}
]

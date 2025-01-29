wii_materials = [
	{
		Name = mat_rm_flare
		technique = wii_wibble_1pass
		BlendMode = add
		MaterialProps = [
			{
				Name = m_amplitudeu
				floatproperty = 0.0
			}
			{
				Name = m_frequencyu
				floatproperty = 0.0
			}
			{
				Name = m_phaseu
				floatproperty = 0.0
			}
			{
				Name = m_velocityu
				floatproperty = 0.0
			}
			{
				Name = m_amplitudev
				floatproperty = 0.0
			}
			{
				Name = m_frequencyv
				floatproperty = 0.0
			}
			{
				Name = m_phasev
				floatproperty = 0.0
			}
			{
				Name = m_velocityV
				floatproperty = 0.0
			}
			{
				Name = m_drot
				floatproperty = 1.0
			}
			{
				Name = m_centerx
				floatproperty = 0.5
			}
			{
				Name = m_centery
				floatproperty = 0.5
			}
			{
				Name = m_sampdiffuse0
				textureproperty = lnzflare
			}
		]
	}
	{
		Name = mat_rm_glow01
		technique = wii_wibble_1pass
		BlendMode = add
		MaterialProps = [
			{
				Name = m_amplitudeu
				floatproperty = 0.0
			}
			{
				Name = m_frequencyu
				floatproperty = 0.0
			}
			{
				Name = m_phaseu
				floatproperty = 0.0
			}
			{
				Name = m_velocityu
				floatproperty = 0.0
			}
			{
				Name = m_amplitudev
				floatproperty = 0.0
			}
			{
				Name = m_frequencyv
				floatproperty = 0.0
			}
			{
				Name = m_phasev
				floatproperty = 0.0
			}
			{
				Name = m_velocityV
				floatproperty = 0.0
			}
			{
				Name = m_drot
				floatproperty = 0.75
			}
			{
				Name = m_centerx
				floatproperty = 0.5
			}
			{
				Name = m_centery
				floatproperty = 0.5
			}
			{
				Name = m_sampdiffuse0
				textureproperty = sb_tubeglow02
			}
		]
	}
	{
		Name = mat_flamin_rail_left
		technique = fire_2d
		BlendMode = add
		MaterialProps = [
			{
				Name = m_sampdiffuse0
				textureproperty = nb_perfglow01
			}
			{
				Name = m_sampnoisevolume1
				textureproperty = noise_32x32x32
			}
			{
				Name = m_noise1speedx
				floatproperty = -0.4
			}
			{
				Name = m_noise1speedy
				floatproperty = 0.4
			}
			{
				Name = m_noise1speedz
				floatproperty = 0.2
			}
			{
				Name = m_maskdistortionx
				floatproperty = 0.5
			}
			{
				Name = m_maskdistortiony
				floatproperty = 1.5
			}
			{
				Name = m_colordistortion
				floatproperty = 0.5
			}
			{
				Name = m_alphabias
				floatproperty = 0.5
			}
			{
				Name = m_alphanoisescale
				floatproperty = 1.0
			}
			{
				Name = m_alphapower
				floatproperty = 1.0
			}
			{
				Name = m_noisemasktop
				floatproperty = 1.0
			}
			{
				Name = m_noisemaskbottom
				floatproperty = 0.0
			}
			{
				Name = m_alphatop
				floatproperty = -1.0
			}
			{
				Name = m_alphabottom
				floatproperty = 2.0
			}
			{
				Name = m_psPass0MaterialColor
				vectorproperty = [
					2.0
					2.0
					2.0
					4.0
				]
			}
			{
				Name = m_vsnoisevolume1tiling
				vectorproperty = [
					4.0
					1.0
					1.0
					0.0
				]
			}
		]
	}
	{
		Name = mat_flamin_rail_right
		technique = fire_2d
		BlendMode = add
		MaterialProps = [
			{
				Name = m_sampdiffuse0
				textureproperty = nb_perfglow01
			}
			{
				Name = m_sampnoisevolume1
				textureproperty = noise_32x32x32
			}
			{
				Name = m_noise1speedx
				floatproperty = 0.4
			}
			{
				Name = m_noise1speedy
				floatproperty = 0.4
			}
			{
				Name = m_noise1speedz
				floatproperty = 0.2
			}
			{
				Name = m_maskdistortionx
				floatproperty = 0.5
			}
			{
				Name = m_maskdistortiony
				floatproperty = 1.5
			}
			{
				Name = m_colordistortion
				floatproperty = 0.5
			}
			{
				Name = m_alphabias
				floatproperty = 0.5
			}
			{
				Name = m_alphanoisescale
				floatproperty = 1.0
			}
			{
				Name = m_alphapower
				floatproperty = 1.0
			}
			{
				Name = m_noisemasktop
				floatproperty = 1.0
			}
			{
				Name = m_noisemaskbottom
				floatproperty = 0.0
			}
			{
				Name = m_alphatop
				floatproperty = -1.0
			}
			{
				Name = m_alphabottom
				floatproperty = 2.0
			}
			{
				Name = m_psPass0MaterialColor
				vectorproperty = [
					2.0
					2.0
					2.0
					4.0
				]
			}
			{
				Name = m_vsnoisevolume1tiling
				vectorproperty = [
					4.0
					1.0
					1.0
					0.0
				]
			}
		]
	}
	{
		Name = mat_flamin_rail_top
		technique = fire_2d
		BlendMode = add
		MaterialProps = [
			{
				Name = m_sampdiffuse0
				textureproperty = nb_perfglow01
			}
			{
				Name = m_sampnoisevolume1
				textureproperty = noise_32x32x32
			}
			{
				Name = m_noise1speedx
				floatproperty = -0.01
			}
			{
				Name = m_noise1speedy
				floatproperty = 0.4
			}
			{
				Name = m_noise1speedz
				floatproperty = 0.2
			}
			{
				Name = m_maskdistortionx
				floatproperty = 0.5
			}
			{
				Name = m_maskdistortiony
				floatproperty = 1.5
			}
			{
				Name = m_colordistortion
				floatproperty = 0.5
			}
			{
				Name = m_alphabias
				floatproperty = 0.5
			}
			{
				Name = m_alphanoisescale
				floatproperty = 1.0
			}
			{
				Name = m_alphapower
				floatproperty = 1.0
			}
			{
				Name = m_noisemasktop
				floatproperty = 1.0
			}
			{
				Name = m_noisemaskbottom
				floatproperty = 0.0
			}
			{
				Name = m_alphatop
				floatproperty = -1.0
			}
			{
				Name = m_alphabottom
				floatproperty = 2.0
			}
			{
				Name = m_psPass0MaterialColor
				vectorproperty = [
					2.0
					2.0
					2.0
					4.0
				]
			}
			{
				Name = m_vsnoisevolume1tiling
				vectorproperty = [
					8.0
					1.0
					1.0
					0.0
				]
			}
		]
	}
	{
		Name = mat_meter_wibble_glow
		technique = wii_wibble_1pass
		BlendMode = add
		MaterialProps = [
			{
				Name = m_amplitudeu
				floatproperty = 0.0
			}
			{
				Name = m_frequencyu
				floatproperty = 0.0
			}
			{
				Name = m_phaseu
				floatproperty = 0.0
			}
			{
				Name = m_velocityu
				floatproperty = 0.0
			}
			{
				Name = m_amplitudev
				floatproperty = 0.0
			}
			{
				Name = m_frequencyv
				floatproperty = 0.0
			}
			{
				Name = m_phasev
				floatproperty = 0.0
			}
			{
				Name = m_velocityV
				floatproperty = 0.0
			}
			{
				Name = m_drot
				floatproperty = 1.0
			}
			{
				Name = m_centerx
				floatproperty = 0.5
			}
			{
				Name = m_centery
				floatproperty = 0.5
			}
			{
				Name = m_sampdiffuse0
				textureproperty = sb_tubeglow02
			}
		]
	}
	{
		Name = mat_sp_ready_fire
		technique = wii_modulate_1pass
		BlendMode = add
		MaterialProps = [
			{
				Name = m_sampdiffuse0
				textureproperty = sp_fill_glow02
			}
		]
	}
]

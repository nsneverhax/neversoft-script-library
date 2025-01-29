cas_shader_default = $cas_shader_skin
cas_shader_skin = {
	variable_mappings = {
		diffuse = {
			shader_var = m_psPass0MaterialColor
			Type = vector
		}
		transition = {
			shader_var = m_pstansitioncolor
			Type = vector
		}
		transition_width = {
			shader_var = m_pstansitionwidth
			Type = float
		}
		transition_position = {
			shader_var = m_pstansitionposition
			Type = float
		}
		dark = {
			shader_var = m_psdarkcolor
			Type = vector
		}
		edge = {
			shader_var = m_psedgecolor
			Type = vector
		}
		edge_power = {
			shader_var = m_psedgepower
			Type = float
		}
		edge_amount = {
			shader_var = m_psedgeamount
			Type = float
		}
		spec_power = {
			shader_var = m_psspecularpower
			Type = vector
		}
		spec_color = {
			shader_var = m_pspass0specularcolor
			Type = vector
		}
		envmap_intensity = {
			shader_var = m_envmapintensity
			Type = float
		}
		normal_map = {
			shader_var = m_normalmapbumpinesspass0
			Type = float
		}
	}
}
cas_shader_hair = {
	variable_mappings = {
		diffuse = {
			shader_var = m_psdiffusecolor
			Type = vector
		}
		edge = {
			shader_var = m_psedgecolor
			Type = vector
		}
		edge_specular_start = {
			shader_var = m_psedgespecularstart
			Type = float
		}
		edge_specular_end = {
			shader_var = m_psedgespecularend
			Type = float
		}
		edge_specular_power = {
			shader_var = m_psedgespecularpower
			Type = float
		}
		edge_mix = {
			shader_var = m_psedgemix
			Type = float
		}
		primary = {
			shader_var = m_psrcolor
			Type = vector
		}
		primary_spec_power = {
			shader_var = m_psrspecwidth
			Type = float
		}
		secondary = {
			shader_var = m_pstrtcolor
			Type = vector
		}
		secondary_spec_power = {
			shader_var = m_pstrtspecwidth
			Type = float
		}
		normal_map = {
			shader_var = m_psmapinfluence
			Type = float
		}
		light_wrapping = {
			shader_var = m_pslightwrapping
			Type = float
		}
		ambient_cutoff = {
			shader_var = m_psambientcutoff
			Type = float
		}
	}
}

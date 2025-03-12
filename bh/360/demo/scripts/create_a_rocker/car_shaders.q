cas_shader_default = $cas_shader_skin
cas_shader_skin = {
	variable_mappings = {
		diffuse = {
			shader_var = m_pspass0materialcolor
			type = vector
		}
		transition = {
			shader_var = m_pstansitioncolor
			type = vector
		}
		transition_width = {
			shader_var = m_pstansitionwidth
			type = float
		}
		transition_position = {
			shader_var = m_pstansitionposition
			type = float
		}
		dark = {
			shader_var = m_psdarkcolor
			type = vector
		}
		edge = {
			shader_var = m_psedgecolor
			type = vector
		}
		edge_power = {
			shader_var = m_psedgepower
			type = float
		}
		edge_amount = {
			shader_var = m_psedgeamount
			type = float
		}
		spec_power = {
			shader_var = m_psspecularpower
			type = vector
		}
		spec_color = {
			shader_var = m_pspass0specularcolor
			type = vector
		}
		envmap_intensity = {
			shader_var = m_envmapintensity
			type = float
		}
		normal_map = {
			shader_var = m_normalmapbumpinesspass0
			type = float
		}
	}
}
cas_shader_skin_masked1 = {
	variable_mappings = {
		diffuse = {
			shader_var = m_pspass0materialcolor
			type = vector
		}
		transition = {
			shader_var = m_pstansitioncolor
			type = vector
		}
		dark = {
			shader_var = m_psdarkcolor
			type = vector
		}
		edge = {
			shader_var = m_psedgecolor
			type = vector
		}
	}
}
cas_shader_skin_masked2 = {
	variable_mappings = {
		diffuse = {
			shader_var = m_pspass0materialcolormasked
			type = vector
		}
		transition = {
			shader_var = m_pstansitioncolormasked
			type = vector
		}
		dark = {
			shader_var = m_psdarkcolormasked
			type = vector
		}
		edge = {
			shader_var = m_psedgecolormasked
			type = vector
		}
	}
}
cas_shader_hair = {
	variable_mappings = {
		diffuse = {
			shader_var = m_psdiffusecolor
			type = vector
		}
		edge = {
			shader_var = m_psedgecolor
			type = vector
		}
		edge_specular_start = {
			shader_var = m_psedgespecularstart
			type = float
		}
		edge_specular_end = {
			shader_var = m_psedgespecularend
			type = float
		}
		edge_specular_power = {
			shader_var = m_psedgespecularpower
			type = float
		}
		edge_mix = {
			shader_var = m_psedgemix
			type = float
		}
		primary = {
			shader_var = m_psrcolor
			type = vector
		}
		primary_spec_power = {
			shader_var = m_psrspecwidth
			type = float
		}
		secondary = {
			shader_var = m_pstrtcolor
			type = vector
		}
		secondary_spec_power = {
			shader_var = m_pstrtspecwidth
			type = float
		}
		normal_map = {
			shader_var = m_psmapinfluence
			type = float
		}
		light_wrapping = {
			shader_var = m_pslightwrapping
			type = float
		}
		ambient_cutoff = {
			shader_var = m_psambientcutoff
			type = float
		}
	}
}

cas_shader_default = $cas_shader_skin
cas_shader_skin = {
	variable_mappings = {
		diffuse = {
			shader_Var = m_psPass0MaterialColor
			type = vector
		}
		transition = {
			shader_Var = m_psTansitionColor
			type = vector
		}
		transition_width = {
			shader_Var = m_psTansitionWidth
			type = float
		}
		transition_position = {
			shader_Var = m_psTansitionPosition
			type = float
		}
		dark = {
			shader_Var = m_psDarkColor
			type = vector
		}
		edge = {
			shader_Var = m_psEdgeColor
			type = vector
		}
		edge_power = {
			shader_Var = m_psEdgePower
			type = float
		}
		edge_amount = {
			shader_Var = m_psEdgeAmount
			type = float
		}
		spec_power = {
			shader_Var = m_psSpecularPower
			type = vector
		}
		spec_color = {
			shader_Var = m_psPass0SpecularColor
			type = vector
		}
		envmap_intensity = {
			shader_Var = m_envMapIntensity
			type = float
		}
		normal_map = {
			shader_Var = m_normalMapBumpinessPass0
			type = float
		}
	}
}
cas_shader_skin_masked1 = {
	variable_mappings = {
		diffuse = {
			shader_Var = m_psPass0MaterialColor
			type = vector
		}
		transition = {
			shader_Var = m_psTansitionColor
			type = vector
		}
		dark = {
			shader_Var = m_psDarkColor
			type = vector
		}
		edge = {
			shader_Var = m_psEdgeColor
			type = vector
		}
	}
}
cas_shader_skin_masked2 = {
	variable_mappings = {
		diffuse = {
			shader_Var = m_psPass0MaterialColorMasked
			type = vector
		}
		transition = {
			shader_Var = m_psTansitionColorMasked
			type = vector
		}
		dark = {
			shader_Var = m_psDarkColorMasked
			type = vector
		}
		edge = {
			shader_Var = m_psEdgeColorMasked
			type = vector
		}
	}
}
cas_shader_hair = {
	variable_mappings = {
		diffuse = {
			shader_Var = m_psdiffusecolor
			type = vector
		}
		edge = {
			shader_Var = m_psEdgeColor
			type = vector
		}
		edge_specular_start = {
			shader_Var = m_psEdgeSpecularStart
			type = float
		}
		edge_specular_end = {
			shader_Var = m_psEdgeSpecularEnd
			type = float
		}
		edge_specular_power = {
			shader_Var = m_psEdgeSpecularPower
			type = float
		}
		edge_mix = {
			shader_Var = m_psEdgeMix
			type = float
		}
		primary = {
			shader_Var = m_psrcolor
			type = vector
		}
		primary_spec_power = {
			shader_Var = m_psRSpecWidth
			type = float
		}
		secondary = {
			shader_Var = m_pstrtcolor
			type = vector
		}
		secondary_spec_power = {
			shader_Var = m_psTRTSpecWidth
			type = float
		}
		normal_map = {
			shader_Var = m_psMapInfluence
			type = float
		}
		light_wrapping = {
			shader_Var = m_psLightWrapping
			type = float
		}
		ambient_cutoff = {
			shader_Var = m_psAmbientCutoff
			type = float
		}
	}
}

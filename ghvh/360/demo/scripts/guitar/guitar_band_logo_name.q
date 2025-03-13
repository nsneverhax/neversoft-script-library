
script apply_band_logo_to_venue 
	if isdefined_nopt_video_capture_tool
		return
	endif
	venue_texture_name = `tex\zones\z_recordstore\jg_rs_logotemp_d_dnc.dds`
	printf 'apply_band_logo_to_venue %s' s = <step> donotresolve
	if ($is_attract_mode = 0)
		getpakmancurrentname \{map = zones}
		if NOT gotparam \{pakname}
			scriptassert \{'Zone not found'}
		endif
		formattext checksumname = zone_tex_dict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
		formattext checksumname = zone_context '%t' t = <pakname>
		pushassetcontext context = <zone_context>
		if NOT isassetloaded name = <zone_tex_dict>
			scriptassert \{'Zone texdict not found'}
		endif
		if NOT istextureindictionary dictionary = <zone_tex_dict> texture = <venue_texture_name>
			printf 'Nowhere to put Band Logo in %s' s = <pakname>
			popassetcontext
			return
		endif
		popassetcontext
		if (<step> = build)
			cas_update_band_logo controller = ($primary_controller)
		elseif (<step> = apply)
			replacetexture {
				src_tex_dict_assetname = ($cas_band_logo_details.texdict)
				src_tex_dict_assetcontext = ($cas_band_logo_details.assetcontext)
				src_tex_dict_texturename = ($cas_band_logo_details.textureasset)
				dest_tex_dict_assetname = <zone_tex_dict>
				dest_tex_dict_assetcontext = <zone_context>
				dest_tex_dict_texturename = <venue_texture_name>
			}
			apply_band_logo_to_venue_apply_to_other_dict {
				tex_dict = `models/venues/recordstore/encore_bandart_skin.tex`
				zone_context = <zone_context>
				venue_texture_name = <venue_texture_name>
			}
			apply_band_logo_to_venue_apply_to_other_dict {
				tex_dict = `models/venues/recordstore/encore_record_skin.tex`
				zone_context = <zone_context>
				venue_texture_name = <venue_texture_name>
			}
		else
			scriptassert \{'Unknown step type'}
		endif
	else
		printf \{'No band logos in attract mode'}
	endif
endscript

script apply_band_logo_to_venue_apply_to_other_dict 
	pushassetcontext context = <zone_context>
	if NOT isassetloaded name = <tex_dict>
		popassetcontext
		return
	endif
	if NOT istextureindictionary dictionary = <tex_dict> texture = <venue_texture_name>
		popassetcontext
		return
	endif
	popassetcontext
	replacetexture {
		src_tex_dict_assetname = ($cas_band_logo_details.texdict)
		src_tex_dict_assetcontext = ($cas_band_logo_details.assetcontext)
		src_tex_dict_texturename = ($cas_band_logo_details.textureasset)
		dest_tex_dict_assetname = <tex_dict>
		dest_tex_dict_assetcontext = <zone_context>
		dest_tex_dict_texturename = <venue_texture_name>
	}
endscript


script apply_band_logo_to_venue 
	venue_texture_name = `tex\zones\z_band_logo\jg_rs_logotemp_d_dnc.dds`
	printf 'apply_band_logo_to_venue %s' s = <step> donotresolve
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		formattext checksumname = zone_tex_dict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
		formattext checksumname = zone_context '%t' t = <pakname>
		pushassetcontext context = <zone_context>
		if NOT isassetloaded name = <zone_tex_dict>
			printf 'Zone texdict %s not found' s = <zone_tex_dict>
			popassetcontext
			return
		endif
		if NOT istextureindictionary dictionary = <zone_tex_dict> texture = <venue_texture_name>
			printf 'Nowhere to put Band Logo in %s' s = <pakname>
			popassetcontext
			return
		endif
		popassetcontext
		if (<step> = build)
			if ($primary_controller != -1)
				cas_update_band_logo controller = ($primary_controller)
			endif
		elseif (<step> = apply)
			replacetexture {
				src_tex_dict_assetname = ($cas_band_logo_details.texdict)
				src_tex_dict_assetcontext = ($cas_band_logo_details.assetcontext)
				src_tex_dict_texturename = ($cas_band_logo_details.textureasset)
				dest_tex_dict_assetname = <zone_tex_dict>
				dest_tex_dict_assetcontext = <zone_context>
				dest_tex_dict_texturename = <venue_texture_name>
			}
		else
			scriptassert \{'Unknown step type'}
		endif
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

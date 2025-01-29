
script apply_band_logo_to_venue 
	venue_texture_name = `tex\zones\Z_Band_Logo\JG_RS_LOGOTemp_D_dnc.dds`
	printf 'apply_band_logo_to_venue %s' s = <step> DoNotResolve
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		FormatText checksumname = zone_tex_dict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
		FormatText checksumname = zone_context '%t' t = <pakname>
		PushAssetContext context = <zone_context>
		if NOT IsAssetLoaded name = <zone_tex_dict>
			printf 'Zone texdict %s not found' s = <zone_tex_dict>
			PopAssetContext
			return
		endif
		if NOT IsTextureInDictionary dictionary = <zone_tex_dict> texture = <venue_texture_name>
			printf 'Nowhere to put Band Logo in %s' s = <pakname>
			PopAssetContext
			return
		endif
		PopAssetContext
		if (<step> = build)
			if ($primary_controller != -1)
				cas_update_band_logo controller = ($primary_controller)
			endif
		elseif (<step> = apply)
			ReplaceTexture {
				src_tex_dict_assetname = ($CAS_Band_Logo_Details.texdict)
				src_tex_dict_assetcontext = ($CAS_Band_Logo_Details.AssetContext)
				src_tex_dict_texturename = ($CAS_Band_Logo_Details.textureasset)
				dest_tex_dict_assetname = <zone_tex_dict>
				dest_tex_dict_assetcontext = <zone_context>
				dest_tex_dict_texturename = <venue_texture_name>
			}
		else
			ScriptAssert \{'Unknown step type'}
		endif
	endif
endscript

script apply_band_logo_to_venue_apply_to_other_dict 
	PushAssetContext context = <zone_context>
	if NOT IsAssetLoaded name = <tex_dict>
		PopAssetContext
		return
	endif
	if NOT IsTextureInDictionary dictionary = <tex_dict> texture = <venue_texture_name>
		PopAssetContext
		return
	endif
	PopAssetContext
	ReplaceTexture {
		src_tex_dict_assetname = ($CAS_Band_Logo_Details.texdict)
		src_tex_dict_assetcontext = ($CAS_Band_Logo_Details.AssetContext)
		src_tex_dict_texturename = ($CAS_Band_Logo_Details.textureasset)
		dest_tex_dict_assetname = <tex_dict>
		dest_tex_dict_assetcontext = <zone_context>
		dest_tex_dict_texturename = <venue_texture_name>
	}
endscript

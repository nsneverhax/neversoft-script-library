band_builder_anims = {
}

script band_anim_reset_loading 
	printf \{'band_anim_reset_loading'}
	Change \{band_builder_anims = {
		}}
endscript

script band_anim_set_appearance 
	RequireParams \{[
			info_struct
			appearance_checksum
		]
		all}
	struct = ($band_builder_anims)
	AddParam Name = <info_struct> structure_name = struct value = <appearance_checksum>
	Change band_builder_anims = <struct>
endscript

script band_anim_check_appearance 
	RequireParams \{[
			info_struct
			appearance_checksum
		]
		all}
	if StructureContains structure = $band_builder_anims <info_struct>
		if (<appearance_checksum> = (($band_builder_anims).<info_struct>))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_load_single_anim_pak \{song = None
		async = 0}
	ExtendCrc <Name> '_Info' out = info_struct
	anim_struct = ($<info_struct>.anim_struct)
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <song> member = <part>
		if StructureContains structure = <anim_struct_member> anims
			GetArraySize (<anim_struct_member>.anims)
			if (<array_Size> > 0)
				<i> = 0
				begin
				animloadaddrequest {
					group = loop_anims
					file = (<anim_struct_member>.anims [<i>])
				}
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
		elseif StructureContains structure = <anim_struct_member> pak
			pakname = (<anim_struct_member>.pak)
			queue_gh5_anim_loops {
				pak_name = <pakname>
				group = loop_anims
			}
		else
			printf 'No animation pak or anim list specified for %s' s = <Name>
		endif
	endif
	if NOT <Name> :GetSingleTag appearance_checksum
		ScriptAssert \{'Missing appearance_checksum'}
	endif
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printstruct ($band_builder_anims)
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		if (<character_id> = emptyguy)
			win_anim_name = None
			lose_anim_name = None
		endif
		Change structurename = <info_struct> win_anim_name = <win_anim_name>
		Change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
	endif
	if NOT (<win_anim_name> = None)
		smartloadpakman map = win_anims pak_name = <win_anim_name> async = <async> tags = {Type = animpak part = <part> song = None}
	endif
	if NOT (<lose_anim_name> = None)
		smartloadpakman map = lose_anims pak_name = <lose_anim_name> async = <async> tags = {Type = animpak part = <part> song = None}
	endif
endscript

script prepare_for_pending_animpaks 
	smartunloadpak async = <async> tags = {Type = animpak}
endscript

script band_stop_anims 
	i = 0
	begin
	Name = (($g_persistent_band_data [<i>]).object)
	if CompositeObjectExists Name = <Name>
		<Name> :obj_killallspawnedscripts
	endif
	i = (<i> + 1)
	repeat 4
	bandmanager_removeallcharacters
endscript

script band_unload_anim_paks \{async = 1}
	smartunloadpak async = <async> tags = {Type = animpak}
endscript

script band_unload_song_anim_paks \{async = 1}
endscript

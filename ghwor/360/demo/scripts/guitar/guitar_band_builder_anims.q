band_builder_anims = {
}

script band_anim_reset_loading 
	printf \{'band_anim_reset_loading'}
	change \{band_builder_anims = {
		}}
endscript

script band_anim_set_appearance 
	requireparams \{[
			info_struct
			appearance_checksum
		]
		all}
	struct = ($band_builder_anims)
	addparam name = <info_struct> structure_name = struct value = <appearance_checksum>
	change band_builder_anims = <struct>
endscript

script band_anim_check_appearance 
	requireparams \{[
			info_struct
			appearance_checksum
		]
		all}
	if structurecontains structure = $band_builder_anims <info_struct>
		if (<appearance_checksum> = (($band_builder_anims).<info_struct>))
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_load_single_anim_pak \{song = none
		async = 0}
	extendcrc <name> '_Info' out = info_struct
	anim_struct = ($<info_struct>.anim_struct)
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <song> member = <part>
		if structurecontains structure = <anim_struct_member> anims
			getarraysize (<anim_struct_member>.anims)
			if (<array_size> > 0)
				<i> = 0
				begin
				animloadaddrequest {
					group = loop_anims
					file = (<anim_struct_member>.anims [<i>])
				}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		elseif structurecontains structure = <anim_struct_member> pak
			pakname = (<anim_struct_member>.pak)
			queue_gh5_anim_loops {
				pak_name = <pakname>
				group = loop_anims
			}
		else
			printf 'No animation pak or anim list specified for %s' s = <name>
		endif
	endif
	if NOT <name> :getsingletag appearance_checksum
		scriptassert \{'Missing appearance_checksum'}
	endif
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printstruct ($band_builder_anims)
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		if (<character_id> = emptyguy)
			win_anim_name = none
			lose_anim_name = none
		endif
		change structurename = <info_struct> win_anim_name = <win_anim_name>
		change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf 'Avoiding rerandomizing anims for %s' s = <info_struct>
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
	endif
	printf 'win_anim_name = %w' w = <win_anim_name>
	printf 'lose_anim_name = %w' w = <lose_anim_name>
	if NOT (<win_anim_name> = none)
		animloadaddrequest {
			group = win_lose_anims
			file = <win_anim_name>
		}
	endif
	if NOT (<lose_anim_name> = none)
		animloadaddrequest {
			group = win_lose_anims
			file = <lose_anim_name>
		}
	endif
endscript

script prepare_for_pending_animpaks 
endscript

script band_stop_anims 
	i = 0
	begin
	name = (($g_persistent_band_data [<i>]).object)
	if compositeobjectexists name = <name>
		<name> :obj_killallspawnedscripts
	endif
	i = (<i> + 1)
	repeat 4
	bandmanager_removeallcharacters
endscript

script band_unload_anim_paks \{async = 1}
endscript

script band_unload_song_anim_paks \{async = 1}
endscript

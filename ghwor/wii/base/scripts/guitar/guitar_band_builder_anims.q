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
				printf channel = marc qs(0xefc22d6a) a = (<anim_struct_member>.anims [<i>])
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
		song_outro_get_random_animation_for_part part = <part>
		if NOT ((GotParam anim) || (GotParam anim_index))
			ScriptAssert \{qs(0x4ecdbc6c)}
		endif
		song_outro_get_random_camera_for_anim part = <part> anim_index = <anim_index>
		if NOT ((GotParam cam) || (GotParam cam_index) || (GotParam cam_initial_speed))
			ScriptAssert \{qs(0x0f075f55)}
		endif
		outro_anim_name = <anim>
		outro_cam_name = <cam>
		outro_cam_initial_speed = <cam_initial_speed>
		Change structurename = <info_struct> outro_anim_name = <anim>
		Change structurename = <info_struct> outro_cam_name = <cam>
		Change structurename = <info_struct> outro_cam_initial_speed = <cam_initial_speed>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf 'Avoiding rerandomizing anims for %s' s = <info_struct>
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		outro_anim_name = ($<info_struct>.outro_anim_name)
		outro_cam_name = ($<info_struct>.outro_cam_name)
		outro_cam_initial_speed = ($<info_struct>.outro_cam_initial_speed)
	endif
	printf 'win_anim_name = %w' w = <win_anim_name>
	printf 'lose_anim_name = %w' w = <lose_anim_name>
	printf 'outro_anim_name = %w' w = <outro_anim_name>
	printf 'outro_cam_name = %w' w = <outro_cam_name>
	if NOT (<win_anim_name> = None)
		animloadaddrequest {
			group = win_lose_anims
			file = <win_anim_name>
		}
	endif
	if NOT (<lose_anim_name> = None)
		animloadaddrequest {
			group = win_lose_anims
			file = <lose_anim_name>
		}
	endif
	if NOT (<outro_anim_name> = None)
		animloadaddrequest {
			group = win_lose_anims
			file = <outro_anim_name>
		}
	endif
	if NOT (<outro_cam_name> = None)
		animloadaddrequest {
			group = win_lose_anims
			file = <outro_cam_name>
		}
	endif
endscript

script prepare_for_pending_animpaks 
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
endscript

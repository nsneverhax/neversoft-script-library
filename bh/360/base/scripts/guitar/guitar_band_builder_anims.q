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
	AddParam name = <info_struct> structure_name = struct value = <appearance_checksum>
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
	return \{false}
endscript

script band_load_anim_paks \{song = None}
	GetTrueStartTime
	is_training = 0
	anim_paks_set_state state = ingame async = <async>
	band_size = 4
	GetArraySize \{$Anim_Loop_Load_Order}
	iLoad = 0
	iSlotIndex = 0
	begin
	load_part = ($Anim_Loop_Load_Order [<iLoad>])
	if (<band_size> > 0)
		iPlayer = 0
		begin
		RemoveParameter \{player}
		if StructureContains structure = ($persistent_band_data [<iPlayer>]) player
			player = (($persistent_band_data [<iPlayer>]).player)
		endif
		if (<load_part> = (($persistent_band_data [<iPlayer>]).instrument))
			band_load_single_anim_pak {
				character_id = (($persistent_band_data [<iPlayer>]).character_id)
				part = (($persistent_band_data [<iPlayer>]).instrument)
				name = (($persistent_band_data [<iPlayer>]).Object)
				savegame = (($persistent_band_data [<iPlayer>]).savegame)
				async = <async>
				player = <player>
				song = <song>
				slot_index = <iSlotIndex>
			}
			iSlotIndex = (<iSlotIndex> + 1)
		endif
		if ((($persistent_band_data [<iPlayer>]).character_id) = EmptyGuy)
			is_training = 1
		endif
		iPlayer = (<iPlayer> + 1)
		repeat <band_size>
	endif
	iLoad = (<iLoad> + 1)
	repeat <array_size>
	print_loading_time starttime = <starttime> text = qs(0x7d662bfd)
endscript

script band_load_single_anim_pak \{song = None
		async = 0}
	ExtendCrc <name> '_Info' out = info_struct
	anim_struct = ($<info_struct>.anim_struct)
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <song> member = <part>
		if StructureContains structure = <anim_struct_member> pak
			pakname = (<anim_struct_member>.pak)
			SmartLoadPakman map = loop_anims pak_name = <pakname> async = <async> tags = {type = looppak part = <part> song = <song>}
		else
			printf 'No animation pak specified for %s' s = <name>
		endif
	endif
	if NOT <name> :GetSingleTag appearance_checksum
		ScriptAssert \{'Missing appearance_checksum'}
	endif
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printf 'New anims for %s' s = <info_struct>
		printstruct ($band_builder_anims)
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		if ((<character_id> = EmptyGuy))
			win_anim_name = None
			lose_anim_name = None
		endif
		Change structurename = <info_struct> win_anim_name = <win_anim_name>
		Change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf 'Avoiding rerandomizing anims for %s' s = <info_struct>
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
	endif
	printf 'win_anim_name = %w' w = <win_anim_name>
	printf 'lose_anim_name = %w' w = <lose_anim_name>
	if NOT (<win_anim_name> = None)
		SmartLoadPakman map = win_anims pak_name = <win_anim_name> async = <async> tags = {type = animpak part = <part> song = None}
	endif
	if NOT (<lose_anim_name> = None)
		SmartLoadPakman map = lose_anims pak_name = <lose_anim_name> async = <async> tags = {type = animpak part = <part> song = None}
	endif
endscript

script prepare_for_pending_animpaks 
	printscriptinfo \{'prepare_for_pending_animpaks'}
	printf \{'prepare_for_pending_animpaks - SmartUnloadPak looppak'}
	SmartUnloadPak async = <async> tags = {type = looppak}
	SmartUnloadPak async = <async> tags = {type = animpak}
	printf \{'prepare_for_pending_animpaks - SmartUnloadPak nextsongpak'}
	SmartUnloadPak async = <async> tags = {type = nextsongpak}
endscript

script grab_custom_anim_name_from_key 
	RequireParams \{[
			part
			desc_id
			key
			who
		]
		all}
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if ($game_mode = p2_pro_faceoff)
		if GotParam \{headtohead_anim_name}
			if NOT (<who> = Drummer)
				printf 'headtohead_anim_name = %s' s = <headtohead_anim_name>
				key = headtohead_anim_name
			endif
		endif
	endif
	if GotParam <key>
		custom_anim_name = (<...>.<key>)
	endif
	if NOT GotParam \{custom_anim_name}
		printf 'Could not find key %p %d %k' p = <part> d = <desc_id> k = <key>
		return \{false}
	endif
	if IsArray <custom_anim_name>
		GetRandomArrayElement <custom_anim_name>
		custom_anim_name = <element>
	endif
	return true custom_anim_name = <custom_anim_name>
endscript

script get_cas_custom_anim 
endscript

script band_start_anims 
	i = 0
	begin
	part = (($persistent_band_data [<i>]).instrument)
	name = (($persistent_band_data [<i>]).Object)
	GMan_SongTool_GetCurrentSong
	printf channel = AnimInfo qs(0xfaaf841e) a = <name> b = <part>
	if CompositeObjectExists name = <name>
		band_member_start_anims {
			name = <name>
			instrument = <part>
			loading_into_song = <current_song>
		}
	endif
	i = (<i> + 1)
	repeat 4
	Band_RestartIdles
endscript

script band_stop_anims 
	i = 0
	begin
	name = (($persistent_band_data [<i>]).Object)
	if CompositeObjectExists name = <name>
		<name> :obj_killallspawnedscripts
	endif
	i = (<i> + 1)
	repeat 4
	BandManager_RemoveAllCharacters
endscript

script band_unload_anim_paks \{async = 1}
	SmartUnloadPak async = <async> tags = {type = animpak}
endscript

script band_unload_song_anim_paks \{async = 1}
	SmartUnloadPak async = <async> tags = {type = looppak}
endscript

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

script band_load_anim_paks \{song = none}
	gettruestarttime
	is_training = 0
	anim_paks_set_state state = ingame async = <async>
	band_size = 4
	getarraysize \{$anim_loop_load_order}
	iload = 0
	islotindex = 0
	begin
	load_part = ($anim_loop_load_order [<iload>])
	if (<band_size> > 0)
		iplayer = 0
		begin
		removeparameter \{player}
		if structurecontains structure = ($persistent_band_data [<iplayer>]) player
			player = (($persistent_band_data [<iplayer>]).player)
		endif
		if (<load_part> = (($persistent_band_data [<iplayer>]).instrument))
			band_load_single_anim_pak {
				character_id = (($persistent_band_data [<iplayer>]).character_id)
				part = (($persistent_band_data [<iplayer>]).instrument)
				name = (($persistent_band_data [<iplayer>]).object)
				savegame = (($persistent_band_data [<iplayer>]).savegame)
				async = <async>
				player = <player>
				song = <song>
				slot_index = <islotindex>
			}
			islotindex = (<islotindex> + 1)
		endif
		if ((($persistent_band_data [<iplayer>]).character_id) = emptyguy)
			is_training = 1
		endif
		iplayer = (<iplayer> + 1)
		repeat <band_size>
	endif
	iload = (<iload> + 1)
	repeat <array_size>
	print_loading_time starttime = <starttime> text = qs(0x7d662bfd)
endscript

script band_load_single_anim_pak \{song = none
		async = 0}
	extendcrc <name> '_Info' out = info_struct
	anim_struct = ($<info_struct>.anim_struct)
	if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <song> member = <part>
		if structurecontains structure = <anim_struct_member> pak
			pakname = (<anim_struct_member>.pak)
			smartloadpakman map = loop_anims pak_name = <pakname> async = <async> tags = {type = looppak part = <part> song = <song>}
		else
			printf 'No animation pak specified for %s' s = <name>
		endif
	endif
	if NOT <name> :getsingletag appearance_checksum
		scriptassert \{'Missing appearance_checksum'}
	endif
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printf 'New anims for %s' s = <info_struct>
		printstruct ($band_builder_anims)
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		if ((<character_id> = emptyguy))
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
		smartloadpakman map = win_anims pak_name = <win_anim_name> async = <async> tags = {type = animpak part = <part> song = none}
	endif
	if NOT (<lose_anim_name> = none)
		smartloadpakman map = lose_anims pak_name = <lose_anim_name> async = <async> tags = {type = animpak part = <part> song = none}
	endif
endscript

script prepare_for_pending_animpaks 
	printscriptinfo \{'prepare_for_pending_animpaks'}
	printf \{'prepare_for_pending_animpaks - SmartUnloadPak looppak'}
	smartunloadpak async = <async> tags = {type = looppak}
	smartunloadpak async = <async> tags = {type = animpak}
	printf \{'prepare_for_pending_animpaks - SmartUnloadPak nextsongpak'}
	smartunloadpak async = <async> tags = {type = nextsongpak}
endscript

script grab_custom_anim_name_from_key 
	requireparams \{[
			part
			desc_id
			key
			who
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if ($game_mode = p2_pro_faceoff)
		if gotparam \{headtohead_anim_name}
			if NOT (<who> = drummer)
				printf 'headtohead_anim_name = %s' s = <headtohead_anim_name>
				key = headtohead_anim_name
			endif
		endif
	endif
	if gotparam <key>
		custom_anim_name = (<...>.<key>)
	endif
	if NOT gotparam \{custom_anim_name}
		printf 'Could not find key %p %d %k' p = <part> d = <desc_id> k = <key>
		return \{false}
	endif
	if isarray <custom_anim_name>
		getrandomarrayelement <custom_anim_name>
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
	name = (($persistent_band_data [<i>]).object)
	gman_songtool_getcurrentsong
	printf channel = animinfo qs(0xfaaf841e) a = <name> b = <part>
	if compositeobjectexists name = <name>
		band_member_start_anims {
			name = <name>
			instrument = <part>
			loading_into_song = <current_song>
		}
	endif
	i = (<i> + 1)
	repeat 4
	band_restartidles
endscript

script band_stop_anims 
	i = 0
	begin
	name = (($persistent_band_data [<i>]).object)
	if compositeobjectexists name = <name>
		<name> :obj_killallspawnedscripts
	endif
	i = (<i> + 1)
	repeat 4
	bandmanager_removeallcharacters
endscript

script band_unload_anim_paks \{async = 1}
	smartunloadpak async = <async> tags = {type = animpak}
endscript

script band_unload_song_anim_paks \{async = 1}
	smartunloadpak async = <async> tags = {type = looppak}
endscript

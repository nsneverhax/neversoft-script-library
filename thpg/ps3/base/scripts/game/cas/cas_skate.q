CAS_PAKS = [
	{
		name = CAS_SOUNDS
		pak = 'pak\\cas_sounds\\cas_sounds.pak'
		loaded = 0
		no_raw_flag
	}
	{
		name = CAS_CAREER
		pak = 'pak\\cas_career\\cas_career.pak'
		loaded = 0
	}
	{
		name = CAS_DECKS
		pak = 'pak\\cas_decks\\cas_decks.pak'
		loaded = 0
	}
	{
		name = CAS_PROS
		pak = 'pak\\cas_pros\\cas_pros.pak'
		loaded = 0
	}
]

script CreateSkintoneID 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	if NOT gotparam head_desc_id
		GetPlayerAppearancePart part = <character_part>
		<head_desc_id> = <desc_id>
	endif
	skintone_id = <base_id>
	if gotparam head_desc_id
		getactualcasoptionstruct part = <character_part> desc_id = <head_desc_id>
		if gotparam skintone
			if NOT (<skintone> = 1)
				if (<skintone> < 10)
					formattext textname = suffix '_Color0%d' d = <skintone>
				else
					formattext textname = suffix '_Color%d' d = <skintone>
				endif
				appendsuffixtochecksum base = <base_id> suffixstring = <suffix>
				skintone_id = <appended_id>
			endif
		else
			printf 'Invalid skintone id, using #1...'
		endif
	else
		printf 'No skintone whatsoever, using #1...'
	endif
	return skintone_id = <skintone_id>
endscript

script CreateHeadID 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	if NOT gotparam head_desc_id
		GetPlayerAppearancePart part = <character_part>
		<head_desc_id> = <desc_id>
	endif
	head_id = <base_id>
	if gotparam head_desc_id
		getactualcasoptionstruct part = <character_part> desc_id = <head_desc_id>
		if gotparam head
			if NOT (<head> = 1)
				if (<head> < 10)
					formattext textname = suffix '_Head0%d' d = <head>
				else
					formattext textname = suffix '_Head%d' d = <head>
				endif
				appendsuffixtochecksum base = <base_id> suffixstring = <suffix>
				head_id = <appended_id>
			endif
		else
			printf 'Invalid head, using #1...'
		endif
	else
		printf 'No head_desc_id whatsoever, using #1...'
	endif
	return head_id = <head_id>
endscript

script findfrontenddescfromchecksum 
	part_struct = ($<part>)
	getarraysize <part_struct>
	<return_val> = "Unknown"
	<i> = 0
	begin
	if ((<part_struct> [<i>].desc_id) = <desc_id>)
		<return_val> = (<part_struct> [<i>].frontend_desc)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return frontend_desc = <return_val>
endscript

script cas_notify_changed_item 
	if getunnamedchecksum <part>
		ReverseResolveCharacterPart part = <checksum>
		if isarray resolved_part
			scriptassert 'Cant deal with arrays here!'
		endif
		switch <resolved_part>
			case cas_torso
			printf "cas_notify_changed_item %s - Torso" s = <desc_id>
			CAS_SFX_Skater_Torso_Change <...>
			case cas_legs
			printf "cas_notify_changed_item %s - Legs" s = <desc_id>
			CAS_SFX_Skater_Legs_Change <...>
			case cas_hat
			printf "cas_notify_changed_item %s - Hat" s = <desc_id>
			CAS_SFX_Skater_Hat_Change <...>
			case CAS_Glasses
			printf "cas_notify_changed_item %s - Glasses" s = <desc_id>
			soundevent event = CAS_SFX_Skater_Glasses_Change
			case cas_shoes
			printf "cas_notify_changed_item %s - Shoes" s = <desc_id>
			soundevent event = CAS_SFX_Skater_Shoes_Change
			case CAS_DECK_GRAPHIC
			printf "cas_notify_changed_item %s - Deck Graphic" s = <desc_id>
			soundevent event = CAS_SFX_Skater_BoardGraphic_Change
			case CAS_GRIPTAPE
			printf "cas_notify_changed_item %s - Grip tape" s = <desc_id>
			soundevent event = CAS_SFX_Skater_Griptape_Change
			case cas_eyes
			printf "cas_notify_changed_item %s - Eyeballs" s = <desc_id>
			case CAS_Head
			printf "cas_notify_changed_item %s - Face" s = <desc_id>
			case cas_hair
			printf "cas_notify_changed_item %s - Hair" s = <desc_id>
			soundevent event = CAS_SFX_Skater_Hair_Change
			case cas_socks
			printf "cas_notify_changed_item %s - Socks" s = <desc_id>
			soundevent event = CAS_SFX_Skater_Socks_Change
			case CAS_Accessory01
			case CAS_Accessory02
			case CAS_Accessory03
			printf "cas_notify_changed_item %s - Accessory" s = <desc_id>
			CAS_SFX_Skater_Change_Accessory <...>
			default
			printf "cas_notify_changed_item %s - Something else" s = <desc_id>
		endswitch
	endif
endscript
cas_skater_invalid = 1

script cas_ensure_skater_loaded 
	printf 'cas_ensure_skater_loaded'
	requireparams [name] all
	if NOT gotparam force
		if NOT infrontend
			if ($cas_skater_invalid = 0)
				return
			endif
		endif
	endif
	<desired_name> = <name>
	GetCurrentSkaterProfileIndex
	if NOT GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
		scriptassert "missing name param in profile"
	endif
	if gotparam force
		name = FORCED_IT
	endif
	if ($cas_skater_invalid = 1)
		name = FORCED_IT
	endif
	if gotparam load_paks
		name = FORCED_IT
	endif
	if NOT (<desired_name> = <name>)
		printf 'cas_ensure_skater_loaded - %s' s = <desired_name>
		printscriptinfo
		selectcurrentskater name = <desired_name>
		if infrontend
			if gotparam loading_screen
				if NOT isloadingscreenactive
					<hide_loading> = 1
					cas_show_loading_screen
				endif
			endif
			if gotparam load_paks
				mempushcontext bottomupheap
				load_cas_paks paks = [CAS_PROS CAS_CAREER CAS_DECKS]
				mempopcontext
			endif
		endif
		if objectexists id = skater
			refresh_skater_model profile = <currentskaterprofileindex> skater = 0
			if (<currentskaterprofileindex> = 0)
				UpdateTrickMappings skater = <currentskaterprofileindex>
			endif
		endif
		if infrontend
			if gotparam hide_loading
				cas_hide_loading_screen
			endif
		endif
	endif
	change cas_skater_invalid = 0
endscript

script cas_get_current_skater_name 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
	return current_skater = <name>
endscript

script cas_show_loading_screen 
	if NOT isloadingscreenactive
		setbuttoneventmappings \{block_menu_input}
		load_level_handle_loading_screen
	endif
endscript

script cas_hide_loading_screen 
	if isloadingscreenactive
		hideloadingscreen
		setbuttoneventmappings \{unblock_menu_input}
		ui_restart_2player_bg
	endif
endscript

script cas_skeleton_swapped 
	printf "cas_skeleton_swapped"
	if ($video_editor_in_video_editor = 0)
		init_skater_anim_tree
	endif
	if NOT getpakmancurrentname map = zones
		return
	endif
	formattext checksumname = zone_name '%s' s = <pakname>
	if (<zone_name> = z_bedroom)
		igc_temporarily_disable_rendering 5 gameframes
		MakeSkaterGoto CasAI
	elseif (<zone_name> = z_mainmenu)
		if infrontend
			if ($is_changing_levels = 0)
				skater_playanim anim = ($skateshop_idle_anim)
				skater :SwitchOffBoard
			endif
		endif
	endif
endscript

script cas_update_ragdoll_bones 
	GetCurrentSkaterProfileIndex
	GetRagdollBonesFromProfile profile = <currentskaterprofileindex>
	GetPlayerAppearance player = <currentskaterprofileindex>
	ragdoll_setaccessorybones \{accessory_bones = $skater_accessory_bones}
	ragdoll_setdisabledbones \{disabled_bones = $skater_accessory_bones}
	ragdoll_setenabledbones enabled_bones = <bones>
	printf \{'ragdoll bones:'}
	printstruct <bones>
endscript

script load_cas_paks 
	requireparams \{[
			paks
		]
		all}
	getarraysize <paks>
	i = 0
	begin
	load_cas_pak pak = (<paks> [<i>])
	i = (<i> + 1)
	repeat <array_size>
endscript

script load_cas_pak 
	requireparams [pak] all
	if NOT cd
		if istrue $cas_artist
			printf '$cas_artist set, bailing...'
			return
		endif
	endif
	getarraysize ($CAS_PAKS)
	i = 0
	begin
	pak_entry = ($CAS_PAKS [<i>])
	if ((<pak_entry>.name) = <pak>)
		if gotparam unload
			if ((<pak_entry>.loaded) = 1)
				printf 'load_cas_pak - Unloading %s' s = (<pak_entry>.pak)
				unloadpak (<pak_entry>.pak)
				waitunloadpak (<pak_entry>.pak)
				pak_entry = {<pak_entry> loaded = 0}
				setarrayelement arrayname = CAS_PAKS globalarray index = <i> newvalue = <pak_entry>
			endif
		else
			if ((<pak_entry>.loaded) = 0)
				printf 'load_cas_pak - Loading %s' s = (<pak_entry>.pak)
				if structurecontains structure = <pak_entry> no_raw_flag
					loadpak (<pak_entry>.pak)
				else
					loadpak (<pak_entry>.pak) is_raw
				endif
				pak_entry = {<pak_entry> loaded = 1}
				setarrayelement arrayname = CAS_PAKS globalarray index = <i> newvalue = <pak_entry>
			endif
		endif
		return true
	endif
	i = (<i> + 1)
	repeat <array_size>
	return false
endscript

script unload_cas_pak 
	requireparams \{[
			pak
		]
		all}
	load_cas_pak pak = <pak> unload
endscript

script unload_cas_paks 
	requireparams \{[
			paks
		]
		all}
	getarraysize <paks>
	i = 0
	begin
	unload_cas_pak pak = (<paks> [<i>])
	i = (<i> + 1)
	repeat <array_size>
endscript

script unload_all_cas_paks 
	printf \{'unload_all_cas_paks'}
	getarraysize \{$CAS_PAKS}
	i = 0
	begin
	unload_cas_pak pak = (($CAS_PAKS [<i>]).name)
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_item_is_visible 
	<is_visible> = 1
	if structurecontains structure = ($<part> [<part_index>]) hidden
		<is_visible> = 0
	endif
	if structurecontains structure = ($<part> [<part_index>]) only_with
		get_current_skater_name
		getarraysize ($<part> [<part_index>].only_with)
		<index> = 0
		<is_visible> = 0
		begin
		if checksumequals a = <name> b = (($<part> [<part_index>].only_with) [<index>])
			<is_visible> = 1
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if checksumequals a = <part> b = CAS_DECK_GRAPHIC
		if NOT (($<part> [<part_index>].desc_id) = Decks_Target)
			<is_visible> = 1
		endif
	endif
	if structurecontains structure = ($<part> [<part_index>]) only_if_unlocked
		<is_visible> = 0
		get_skater_unlocked name = <only_if_unlocked>
		if (<is_unlocked> = 1)
			<is_visible> = 1
		endif
	endif
	if structurecontains structure = ($<part> [<part_index>]) only_with_neversoft_skater
		<is_visible> = 0
		get_is_neversoft_skater
		if (<is_neversoft_skater> = 1)
			<is_visible> = 1
		endif
	endif
	if structurecontains structure = ($<part> [<part_index>]) not_with_hoody_up
		get_has_hoody_up
		if (<has_hoody_up> = 1)
			<is_visible> = 0
		endif
	endif
	if structurecontains structure = ($<part> [<part_index>]) not_with_certain_shirts
		check_for_incompatible_shirts
		if (<incompatible>)
			<is_visible> = 0
		endif
	endif
	if structurecontains structure = ($<part> [<part_index>]) not_with_certain_pants
		check_for_incompatible_pants
		if (<incompatible>)
			<is_visible> = 0
		endif
	endif
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	getarraysize $CAS_Character_ForEach_List
	i = 0
	hasOnlyWith = 0
	onlyWithMatch = 0
	begin
	cas_char = ((($CAS_Character_ForEach_List) [<i>]).character_type)
	GetCharacterOnlyWith character_type = <cas_char>
	if structurecontains structure = ($<part> [<part_index>]) <only_with>
		hasOnlyWith = 1
		if (<character_type> = <cas_char>)
			onlyWithMatch = 1
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if ((<hasOnlyWith> = 1) && (<onlyWithMatch> = 0))
		<is_visible> = 0
	endif
	if istrue $worst_case_cas_debug
		<is_visible> = 1
	endif
	return is_visible = <is_visible> secret_color = <secret_color>
endscript
appearance_custom_skater_worst_case_net_packet = {
	required_character_type = cas_punk
	CAS_PUNK_Bare_Torso = {
		desc_id = none
	}
	cas_body = {
		desc_id = Punkbody
	}
	board = {
		desc_id = `default`
	}
	griptape = {
		desc_id = `default`
	}
	deck_graphic = {
		desc_id = `default`
	}
	cas_eyes = {
		desc_id = brown
		eyes
	}
	CAS_PUNK_Lower_Legs = {
		desc_id = lower
		legs
	}
	CAS_PUNK_Head = {
		desc_id = PUNK_Body_Head01
	}
	CAS_PUNK_Scalp = {
		desc_id = Scalp
		1
	}
	CAS_PUNK_Hair = {
		desc_id = PUNK_Hair_Mohawk01
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Hands = {
		desc_id = hands
	}
	CAS_PUNK_Torso = {
		desc_id = Punk_Shirt_Cutoffs01
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Torso_Sec = {
		desc_id = none
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Hat_Sec = {
		desc_id = none
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Legs = {
		desc_id = Punk_Pants_Plaid02
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	cas_shoes = {
		desc_id = Shared_Shoes_DC02
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Accessory01 = {
		desc_id = PUNK_ACC_Bracelet01_L
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Accessory02 = {
		desc_id = PUNK_ACC_Bracelet02_R
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Socks = {
		desc_id = PUNK_Socks_Long01
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Accessory03 = {
		desc_id = PUNK_ACC_Earrings01
		h = 50
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Hat = {
		desc_id = Punk_Hat_Generic01
		h = 50
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_PUNK_Glasses = {
		desc_id = PUNK_Glasses_Electric01
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_Hat_Logo = {
		desc_id = Almost1
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_Front_Logo = {
		desc_id = Almost1
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
	CAS_Back_Logo = {
		desc_id = Almost1
		h = 100
		s = 50
		v = 50
		use_default_hsv = 0
	}
}

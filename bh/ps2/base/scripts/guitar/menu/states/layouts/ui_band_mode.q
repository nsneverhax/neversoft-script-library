
script ui_init_band_mode 
	0xfd22d1e7 \{num = 0}
endscript

script ui_deinit_band_mode 
	0x88e84c31
endscript

script ui_create_band_mode 
	0x04d11dea \{num = 0}
	gamemode_gettype
	if (<Type> = career)
		register_new_progression_atoms \{career_band}
	endif
	SpawnScriptNow \{0xf2d3e5f3
		params = {
			mode = band_mode
		}}
endscript

script ui_destroy_band_mode 
	KillSkaterCamAnim \{Name = 0x716ccbe1}
	0x981ef6bf
endscript

script sanity_check_fix_deleted_characters 
	fix_deleted_character_player_status \{Player = 1}
	fix_deleted_character_player_status \{Player = 2}
	fix_deleted_character_player_status \{Player = 3}
	fix_deleted_character_player_status \{Player = 4}
endscript

script fix_deleted_character_player_status 
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status player_status = <player_status>
	if NOT profile_exists id = ($<player_status>.character_id) savegame = <savegame>
		Change structurename = <player_status> character_id = Judy
	endif
endscript

script ui_get_controller_parts_allowed 

	if (($allow_controller_for_all_instruments) = 0)
		allowed = {}
		if IsGuitarController controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {vocals}
		endif
	else
		allowed = {guitar bass drum vocals}
		if IsGuitarController controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {guitar bass drum vocals}
		endif
	endif
	if is_regular_controller controller = <controller>
		if controller_has_headset controller = <controller>
			allowed = {<allowed> vocals}
		endif
	endif
	if GotParam \{filter_by_character}
		filter_allowed_parts_by_character_type allowed = <allowed> controller = <controller>
	endif
	return allowed = <allowed>
endscript

script get_controller_part 

	if IsGuitarController controller = <controller>
		return \{controller_part = guitar}
	elseif isdrumcontroller controller = <controller>
		return \{controller_part = drum}
	else
		return \{controller_part = vocals}
	endif
endscript

script ui_band_mode_highlight_motion 
	if desc_resolvealias \{Name = alias_highlight}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_Size>)
				curr = 0
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = FALSE
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = FALSE
			endif
			Wait \{0.1
				Second}
			repeat
		endif
	endif
endscript

script ui_band_mode_focus \{offset = (0.0, 34.0)
		start_pos = (0.0, -120.0)}
	retail_menu_focus
	Obj_GetID
	<objID> :se_getparentid
	<parent_id> :GetTags
	myinterfaceelement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		if <current_desc> :desc_resolvealias Name = alias_highlight
			GetScreenElementDims id = <objID>
			Scale = (((0.9, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.0))
			screenelementpos = (<start_pos> + (<offset> * <tag_selected_index>))
			<resolved_id> :se_setprops Pos = <screenelementpos> Scale = <Scale>
			<resolved_id> :se_waitprops
			<resolved_id> :se_setprops Pos = (<screenelementpos> + (0.0, -10.0)) time = 0.05
			<resolved_id> :se_waitprops
			<resolved_id> :se_setprops Pos = <screenelementpos> Scale = <Scale> time = 0.05
			<resolved_id> :se_waitprops
		endif
	endif
endscript

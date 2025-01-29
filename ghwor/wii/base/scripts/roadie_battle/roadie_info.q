max_roadie_count = 4
max_players_in_roadie_battle = 4
roadie_infos = [
	{
	}
	{
	}
	{
	}
	{
	}
]
active_roadie_count = 0
signed_in_roadie_count = 0
roadie_battle_signed_in_ds_aids = [
]

script roadie_battle_set_default_roadie_info 
	<roadie> = 0
	begin
	setstructureparam array_name = roadie_infos array_index = <roadie> param = Player value = -1
	setstructureparam array_name = roadie_infos array_index = <roadie> param = Name value = qs(0x652ecdf5)
	setstructureparam array_name = roadie_infos array_index = <roadie> param = ds_aid value = (<roadie> + 1)
	setstructureparam array_name = roadie_infos array_index = <roadie> param = Active value = FALSE
	setstructureparam array_name = roadie_infos array_index = <roadie> param = avatar value = -1
	setstructureparam array_name = roadie_infos array_index = <roadie> param = connected value = FALSE
	setstructureparam array_name = roadie_infos array_index = <roadie> param = signed_in value = FALSE
	setstructureparam array_name = roadie_infos array_index = <roadie> param = timed_out value = FALSE
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	roadie_battle_reset_game_roadie_info
	Change \{active_roadie_count = 0}
	Change \{signed_in_roadie_count = 0}
	Change \{roadie_battle_signed_in_ds_aids = [
		]}
endscript

script roadie_battle_reset_game_roadie_info 
	roadie = 0
	begin
	setstructureparam array_name = roadie_infos array_index = <roadie> param = mine_notes_attack_active value = FALSE
	setstructureparam array_name = roadie_infos array_index = <roadie> param = roadie_difficulty value = -1
	setstructureparam array_name = roadie_infos array_index = <roadie> param = charge_per_hit_gem value = 0.0
	setstructureparam array_name = roadie_infos array_index = <roadie> param = charge_per_sustain_second value = 0.0
	setstructureparam array_name = roadie_infos array_index = <roadie> param = charge_to_fill value = 0.0
	setstructureparam array_name = roadie_infos array_index = <roadie> param = current_charge value = 0.0
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_get_roadie_info 
	RequireParams \{[
			roadie
			param
		]
		all}
	if NOT GotParam \{return_param}
		<return_param> = <param>
	endif
	return_params = {}
	setstructureparam struct_name = return_params param = <return_param> value = ($roadie_infos [<roadie>].<param>)
	return <return_params>
endscript

script roadie_battle_set_roadie_info 
	RequireParams \{[
			roadie
			param
			value
		]
		all}
	setstructureparam array_name = roadie_infos array_index = <roadie> param = <param> value = <value>
endscript

script roadie_battle_find_roadie_for_player \{Player = !i1768515945
		assert = 0x00000028}
	getplayerinfo Player = <Player> roadie_battle_roadie_index
	if (<roadie_battle_roadie_index> >= 0)
		return true roadie = <roadie_battle_roadie_index>
	endif
	if (<assert> = true)
		ScriptAssert 'No roadie found for player %p' a = <Player>
	endif
	return \{FALSE
		roadie = -1}
endscript

script roadie_battle_find_roadie_by_aid \{aid = !i1768515945
		assert = 0x00000028}
	roadie_index = 0
	begin
	if (($roadie_infos [<roadie_index>].ds_aid) = <aid>)
		return true roadie = <roadie_index>
	endif
	<roadie_index> = (<roadie_index> + 1)
	repeat $max_roadie_count
	if (<assert> = true)
		ScriptAssert 'No roadie found with aid %a' a = <aid>
	endif
	return \{FALSE
		roadie = -1}
endscript

script roadie_battle_assign_roadie_to_player \{roadie = !i1768515945
		Player = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = Player return_param = old_player
	if (<old_player> >= 1)
		setplayerinfo Player = <old_player> roadie_battle_roadie_index = -1
	endif
	if (<Player> >= 1)
		setplayerinfo Player = <Player> roadie_battle_roadie_index = <roadie>
	endif
	roadie_battle_set_roadie_info roadie = <roadie> param = Player value = <Player>
endscript

script roadie_battle_set_connected_ds_roadie_info 
	wiidscommunication :getstatus
	Change active_roadie_count = <current_ds_count>
	roadie = 0
	if ($active_roadie_count > 0)
		begin
		roadie_battle_set_roadie_info roadie = <roadie> param = Active value = true
		roadie_battle_set_roadie_info roadie = <roadie> param = connected value = true
		roadie_battle_set_roadie_info roadie = <roadie> param = ds_aid value = (<ds_info> [<roadie>].aid)
		formatText TextName = localized_name qs(0x73307931) s = (<ds_info> [<roadie>].Name)
		roadie_battle_set_roadie_info roadie = <roadie> param = Name value = <localized_name>
		<roadie> = (<roadie> + 1)
		repeat $active_roadie_count
	endif
endscript

script roadie_battle_deactivate_roadie \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = Active
	if (<Active> = true)
		roadie_battle_assign_roadie_to_player roadie = <roadie> Player = -1
		roadie_battle_signout roadie = <roadie>
		roadie_battle_set_roadie_info roadie = <roadie> param = Active value = FALSE
		Change active_roadie_count = ($active_roadie_count - 1)
	endif
endscript

script roadie_battle_band_has_active_roadie \{Band = !i1768515945}
	getnumplayersingame
	getfirstplayer
	begin
	getplayerinfo <Player> Band out = players_band
	if (<players_band> = <Band>)
		if roadie_battle_find_roadie_for_player Player = <Player>
			return \{true}
		endif
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
	return \{FALSE}
endscript

script roadie_battle_form_team_name \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = Player
	roadie_battle_get_roadie_info roadie = <roadie> param = Name
	get_fullname_for_player Player = <Player>
	formatText TextName = team_name qs(0xbec43836) p = <fullname> r = <Name>
	return roadie_team_name = <team_name>
endscript

script roadie_battle_signin \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = FALSE)
		roadie_battle_set_roadie_info roadie = <roadie> param = signed_in value = true
		roadie_battle_update_signed_in_aids
		Change signed_in_roadie_count = ($signed_in_roadie_count + 1)
	endif
endscript

script roadie_battle_signout \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_set_roadie_info roadie = <roadie> param = signed_in value = FALSE
		roadie_battle_update_signed_in_aids
		Change signed_in_roadie_count = ($signed_in_roadie_count - 1)
	endif
endscript

script roadie_battle_update_signed_in_aids 
	<aids> = []
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
		<aids> = (<aids> + <ds_aid>)
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	Change roadie_battle_signed_in_ds_aids = <aids>
endscript

script roadie_battle_get_num_roadies_in_game 
	return num_roadies = ($signed_in_roadie_count)
endscript

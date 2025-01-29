roadie_battle_charge_per_minute = 300
roadie_battle_sustain_gem_time_secs = 1.0
roadie_battle_star_power_charge_multiplier = 2.0
roadie_battle_charge_needed_to_spin = [
	55
	65
	75
]
roadie_battle_charge_synchronization_interval_secs = 0.5

script roadie_battle_init_charge 
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	<song_duration_minutes> = (<total_end_time> / 60000.0)
	<total_song_charge> = (<song_duration_minutes> * $roadie_battle_charge_per_minute)
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = Player
		roadiebattle_countgemsforplayer song = <current_song> Player = <Player>
		<sustain_gems> = ((<gem_counts>.total_length) / ($roadie_battle_sustain_gem_time_secs * 1000))
		<charge_per_hit_gem> = (<total_song_charge> / ((<gem_counts>.total) + <sustain_gems>))
		<charge_per_sustain_second> = (<charge_per_hit_gem> / $roadie_battle_sustain_gem_time_secs)
		roadie_battle_set_roadie_info roadie = <roadie> param = charge_per_hit_gem value = <charge_per_hit_gem>
		roadie_battle_set_roadie_info roadie = <roadie> param = charge_per_sustain_second value = <charge_per_sustain_second>
		roadie_battle_update_charge_to_fill roadie = <roadie>
		formatText checksumName = sustain_script_id 'roadie_battle_sustain_script_%r' r = <roadie> AddToStringLookup = true
		roadie_battle_set_roadie_info roadie = <roadie> param = sustain_script_id value = <sustain_script_id>
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	SpawnScriptNow \{roadie_battle_charge_synchronizer}
endscript

script roadie_battle_deinit_charge 
	KillSpawnedScript \{Name = roadie_battle_sustain_charger}
	KillSpawnedScript \{Name = roadie_battle_charge_synchronizer}
endscript

script roadie_battle_update_charge_to_fill \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = roadie_difficulty
	roadie_battle_set_roadie_info roadie = <roadie> param = charge_to_fill value = ($roadie_battle_charge_needed_to_spin [<roadie_difficulty>])
endscript

script roadie_battle_add_charge \{roadie = !i1768515945
		charge = !f1768515945}
	<Player> = ($roadie_infos [<roadie>].Player)
	<charge_to_fill> = ($roadie_infos [<roadie>].charge_to_fill)
	getplayerinfo <Player> star_power_used
	if (<star_power_used> = 1)
		<charge_to_add> = (<charge> * $roadie_battle_star_power_charge_multiplier)
	else
		<charge_to_add> = <charge>
	endif
	<new_charge> = (($roadie_infos [<roadie>].current_charge) + <charge_to_add>)
	if (<new_charge> >= <charge_to_fill>)
		wiidscommunication :sendmessage {
			roadie_add_spin
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
		<new_charge> = (<new_charge> - <charge_to_fill>)
		roadie_battle_update_charge_to_fill roadie = <roadie>
		SpawnScriptNow {
			roadie_battle_hud_start_spin_added_effect
			params = {
				roadie = <roadie>
				Player = <Player>
				bonus_spin = FALSE
			}
		}
	endif
	roadie_battle_set_roadie_info roadie = <roadie> param = current_charge value = <new_charge>
	roadie_battle_hud_update_spin_meter roadie = <roadie> Player = <Player>
endscript

script roadie_battle_add_bonus_spin_for_all_roadies 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		SpawnScriptNow {
			roadie_battle_hud_start_spin_added_effect
			params = {
				roadie = <roadie>
				Player = ($roadie_infos [<roadie>].Player)
				bonus_spin = true
			}
		}
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	wiidscommunication :sendmessage \{roadie_add_spin
		destination_aids = $roadie_battle_signed_in_ds_aids}
endscript

script roadie_battle_start_charging_sustain \{roadie = !i1768515945}
	SpawnScriptNow {
		roadie_battle_sustain_charger
		id = ($roadie_infos [<roadie>].sustain_script_id)
		params = {
			roadie = <roadie>
			charge_per_sustain_second = ($roadie_infos [<roadie>].charge_per_sustain_second)
		}
	}
endscript

script roadie_battle_stop_charging_sustain \{roadie = !i1768515945}
	KillSpawnedScript id = ($roadie_infos [<roadie>].sustain_script_id)
endscript

script roadie_battle_sustain_charger \{roadie = !i1768515945
		charge_per_sustain_second = !f1768515945}
	begin
	WaitOneGameFrame
	getframelength
	<charge_generated> = (<charge_per_sustain_second> * <frame_length>)
	roadie_battle_add_charge roadie = <roadie> charge = <charge_generated>
	repeat
endscript

script roadie_battle_charge_synchronizer 
	<wait_per_roadie> = ($roadie_battle_charge_synchronization_interval_secs / $max_roadie_count)
	begin
	<roadie> = 0
	begin
	if (($roadie_infos [<roadie>].signed_in) = true)
		<charge_fill> = (($roadie_infos [<roadie>].current_charge) / (($roadie_infos [<roadie>].charge_to_fill)))
		wiidscommunication :sendmessage {
			roadie_update_charge
			charge_fill = <charge_fill>
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
	endif
	<roadie> = (<roadie> + 1)
	Wait <wait_per_roadie> Seconds
	repeat $max_roadie_count
	repeat
endscript

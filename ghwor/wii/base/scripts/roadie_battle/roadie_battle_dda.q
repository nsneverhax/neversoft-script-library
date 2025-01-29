roadie_battle_dda_easy_start_time_secs = 30.0
roadie_battle_dda_coop_thresholds = [
	$crowd_poor_medium
	$crowd_medium_good
]
roadie_battle_dda_competitive_individual_thresholds = [
	-5000
	5000
]

script roadie_battle_dda_start 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_set_roadie_difficulty roadie = <roadie> difficulty = 0
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	SpawnScriptNow \{roadie_battle_dda_updater}
endscript

script roadie_battle_dda_stop 
	KillSpawnedScript \{Name = roadie_battle_dda_updater}
endscript

script roadie_battle_dda_updater 
	Wait \{$roadie_battle_dda_easy_start_time_secs
		Seconds}
	begin
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = Player
		if ($roadie_battle_mode = coop)
			roadie_battle_choose_difficulty_coop roadie = <roadie> Player = <Player>
		else
			roadie_battle_choose_difficulty_competitive roadie = <roadie> Player = <Player>
		endif
		roadie_battle_set_roadie_difficulty roadie = <roadie> difficulty = <chosen_difficulty>
	endif
	<roadie> = (<roadie> + 1)
	Wait \{1
		Second}
	repeat $max_roadie_count
	repeat
endscript

script roadie_battle_set_roadie_difficulty \{roadie = !i1768515945
		difficulty = !i1768515945}
	if (($roadie_infos [<roadie>].roadie_difficulty) != <difficulty>)
		printf channel = roadie_battle 'Changing difficulty for roadie %r to %d' r = <roadie> d = <difficulty>
		roadie_battle_set_roadie_info roadie = <roadie> param = roadie_difficulty value = <difficulty>
		wiidscommunication :sendmessage {
			roadie_set_difficulty
			difficulty = <difficulty>
			destination_aid = ($roadie_infos [<roadie>].ds_aid)
		}
	endif
endscript

script roadie_battle_calculate_difficulty_from_threshold \{threshold_array_name = !q1768515945
		compare_value = !f1768515945}
	GetArraySize $<threshold_array_name>
	<difficulty> = 0
	begin
	if (<compare_value> < ($<threshold_array_name> [<difficulty>]))
		break
	endif
	<difficulty> = (<difficulty> + 1)
	repeat <array_Size>
	return difficulty = <difficulty>
endscript

script roadie_battle_choose_difficulty_coop \{roadie = !i1768515945
		Player = !i1768515945}
	getplayerinfo <Player> current_health
	roadie_battle_calculate_difficulty_from_threshold {
		threshold_array_name = roadie_battle_dda_coop_thresholds
		compare_value = <current_health>
	}
	return chosen_difficulty = <difficulty>
endscript

script roadie_battle_choose_difficulty_competitive \{roadie = !i1768515945
		Player = !i1768515945}
	getplayerinfo <Player> Band out = my_band
	getbandsstatus
	GetArraySize <bands>
	<other_band> = 1
	<score_total> = 0
	<score_count> = 0
	begin
	if ((<other_band> != <my_band>) && (<bands> [(<other_band> - 1)].in_game = 1))
		if roadie_battle_band_has_active_roadie Band = <other_band>
			getbandinfo <other_band> score
			<score_total> = (<score_total> + <score>)
			<score_count> = (<score_count> + 1)
		endif
	endif
	<other_band> = (<other_band> + 1)
	repeat <array_Size>
	<avg_opponent_score> = (<score_total> / <score_count>)
	getbandinfo <my_band> score
	<difference> = (<score> - <avg_opponent_score>)
	<threshold_array_name> = roadie_battle_dda_competitive_individual_thresholds
	roadie_battle_calculate_difficulty_from_threshold {
		threshold_array_name = <threshold_array_name>
		compare_value = <difference>
	}
	return chosen_difficulty = <difficulty>
endscript

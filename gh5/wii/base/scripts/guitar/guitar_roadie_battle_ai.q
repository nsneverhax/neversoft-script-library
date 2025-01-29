roadie_battle_ai_difficulty_modifier_easy = 0.25
roadie_battle_ai_difficulty_modifier_medium = 0.15
roadie_battle_ai_difficulty_modifier_hard = 0.08
roadie_battle_ai_difficulty_modifier_expert = 0.02
roadie_battle_ai_esteem_danger = 0.35000002
roadie_battle_ai_esteem_bad = 0.2
roadie_battle_ai_esteem_normal = 0.15
roadie_battle_ai_esteem_good = 0.1
roadie_battle_ai_attack_effects = 0.2
roadie_battle_ai_attack_soundboard = 0.2
roadie_battle_ai_attack_amp = 0.3
roadie_battle_ai_attack_guitar = 0.9
roadie_battle_ai_attack_speaker = 0.2
roadie_battle_ai_attack_effects_time = 15
roadie_battle_ai_attack_soundboard_time = 20
roadie_battle_ai_attack_amp_time = 22
roadie_battle_ai_attack_guitar_time = 30
roadie_battle_ai_attack_speaker_time = 12
roadie_battle_ai_repair_effects_time = 4
roadie_battle_ai_repair_soundboard_time = 6
roadie_battle_ai_repair_amp_time = 7
roadie_battle_ai_repair_guitar_time = 6
roadie_battle_ai_repair_speaker_time = 5
roadie_battle_ai_time_mod_danger_low = 0.65000004
roadie_battle_ai_time_mod_danger_high = 0.75
roadie_battle_ai_time_mod_bad_low = 0.75
roadie_battle_ai_time_mod_bad_high = 0.85
roadie_battle_ai_time_mod_normal_low = 0.9
roadie_battle_ai_time_mod_normal_high = 1.3
roadie_battle_ai_time_mod_good_low = 1.5
roadie_battle_ai_time_mod_good_high = 2
roadie_battle_ai_lobby_wait_danger = 1
roadie_battle_ai_lobby_wait_bad = 2
roadie_battle_ai_lobby_wait_normal = 3
roadie_battle_ai_lobby_wait_good = 5
roadie_battle_ai_switch_sides_time = 3

script roadie_battle_ai_loop \{roadie = 2}
	<opponent> = (3 - <roadie>)
	roadie_battle_get_player_from_roadie roadie = <roadie>
	getplayerinfo <Player> difficulty
	switch <difficulty>
		case easy
		<difficulty_mod> = ($roadie_battle_ai_difficulty_modifier_easy)
		case medium
		<difficulty_mod> = ($roadie_battle_ai_difficulty_modifier_medium)
		case hard
		<difficulty_mod> = ($roadie_battle_ai_difficulty_modifier_hard)
		case expert
		<difficulty_mod> = ($roadie_battle_ai_difficulty_modifier_expert)
	endswitch
	begin
	<repair_chance> = 0.0
	roadie_battle_ai_check_equipment roadie = <roadie>
	if (<need_repair> = 1)
		if (<roadie_battle_amp_attack> > 0)
			<repair_chance> = (<repair_chance> + $roadie_battle_ai_attack_amp)
		endif
		if (<roadie_battle_guitar_attack> > 0)
			<repair_chance> = (<repair_chance> + $roadie_battle_ai_attack_guitar)
		endif
		if (<roadie_battle_effects_attack> > 0)
			<repair_chance> = (<repair_chance> + $roadie_battle_ai_attack_effects)
		endif
		if (<roadie_battle_soundboard_attack> > 0)
			<repair_chance> = (<repair_chance> + $roadie_battle_ai_attack_soundboard)
		endif
		if (<roadie_battle_speaker_attack> > 0)
			<repair_chance> = (<repair_chance> + $roadie_battle_ai_attack_speaker)
		endif
	else
		<repair_chance> = -5.0
	endif
	<repair_chance> = (<repair_chance> + <difficulty_mod>)
	roadie_battle_ai_get_esteem roadie = <roadie>
	switch <esteem>
		case danger
		<repair_chance> = (<repair_chance> + $roadie_battle_ai_esteem_danger)
		<wait_time> = ($roadie_battle_ai_lobby_wait_danger)
		GetRandomValue a = ($roadie_battle_ai_time_mod_danger_low) b = ($roadie_battle_ai_time_mod_danger_high) Name = wait_time_mod
		case bad
		<repair_chance> = (<repair_chance> + $roadie_battle_ai_esteem_bad)
		<wait_time> = ($roadie_battle_ai_lobby_wait_bad)
		GetRandomValue a = ($roadie_battle_ai_time_mod_bad_low) b = ($roadie_battle_ai_time_mod_bad_high) Name = wait_time_mod
		case Normal
		<repair_chance> = (<repair_chance> + $roadie_battle_ai_esteem_normal)
		<wait_time> = ($roadie_battle_ai_lobby_wait_normal)
		GetRandomValue a = ($roadie_battle_ai_time_mod_normal_low) b = ($roadie_battle_ai_time_mod_normal_high) Name = wait_time_mod
		case good
		<repair_chance> = (<repair_chance> + $roadie_battle_ai_esteem_good)
		<wait_time> = ($roadie_battle_ai_lobby_wait_good)
		GetRandomValue a = ($roadie_battle_ai_time_mod_good_low) b = ($roadie_battle_ai_time_mod_good_high) Name = wait_time_mod
	endswitch
	<wait_time> = (<wait_time> * <wait_time_mod>)
	printf 'Roadie AI: %r in lobby waiting %s seconds...' r = <roadie> s = <wait_time>
	Wait <wait_time> Seconds
	roadie_battle_ai_check_equipment roadie = <opponent>
	if (<none_to_attack> = 1)
		<repair_chance> = 2.0
	endif
	GetRandomValue \{a = 0.0
		b = 1.0
		Name = repair_value}
	if (<repair_value> <= <repair_chance>)
		roadie_battle_ai_repair_equipment roadie = <roadie>
	else
		roadie_battle_ai_attack_equipment roadie = <roadie>
	endif
	repeat
endscript

script roadie_battle_ai_check_equipment 
	roadie_battle_get_player_from_roadie roadie = <roadie>
	getplayerinfo <Player> roadie_battle_amp_attack
	getplayerinfo <Player> roadie_battle_effects_attack
	getplayerinfo <Player> roadie_battle_guitar_attack
	getplayerinfo <Player> roadie_battle_soundboard_attack
	getplayerinfo <Player> roadie_battle_speaker_attack
	<repairable> = []
	<attackable> = []
	if (<roadie_battle_amp_attack> > 0)
		<repairable> = (<repairable> + amp)
	else
		<attackable> = (<attackable> + amp)
	endif
	if (<roadie_battle_effects_attack> > 0)
		<repairable> = (<repairable> + effects)
	else
		<attackable> = (<attackable> + effects)
	endif
	if (<roadie_battle_guitar_attack> > 0)
		<repairable> = (<repairable> + guitar)
	else
		<attackable> = (<attackable> + guitar)
	endif
	if (<roadie_battle_soundboard_attack> > 0)
		<repairable> = (<repairable> + soundboard)
	else
		<attackable> = (<attackable> + soundboard)
	endif
	if (<roadie_battle_speaker_attack> > 0)
		<repairable> = (<repairable> + speaker)
	else
		<attackable> = (<attackable> + speaker)
	endif
	GetArraySize <repairable>
	if (<array_Size> > 0)
		<need_repair> = 1
	else
		<need_repair> = 0
	endif
	GetArraySize <attackable>
	if (<array_Size> = 0)
		<none_to_attack> = 1
	else
		<none_to_attack> = 0
	endif
	return {
		roadie_battle_amp_attack = <roadie_battle_amp_attack>
		roadie_battle_effects_attack = <roadie_battle_effects_attack>
		roadie_battle_guitar_attack = <roadie_battle_guitar_attack>
		roadie_battle_soundboard_attack = <roadie_battle_soundboard_attack>
		roadie_battle_speaker_attack = <roadie_battle_speaker_attack>
		none_to_attack = <none_to_attack>
		need_repair = <need_repair>
		repairable = <repairable>
		attackable = <attackable>
	}
endscript

script roadie_battle_ai_attack_equipment 
	printf 'Roadie AI: %r decided to attack...' r = <roadie>
	<opponent> = (3 - <roadie>)
	roadie_battle_ai_check_equipment roadie = <opponent>
	printstruct <...>
	if (<none_to_attack> = 1)
		printf 'Roadie AI: %r found nothing to attack!' r = <roadie>
		return
	endif
	<weights> = []
	if (<roadie_battle_amp_attack> < 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_amp / $roadie_battle_ai_attack_amp_time))
	endif
	if (<roadie_battle_effects_attack> < 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_effects / $roadie_battle_ai_attack_effects_time))
	endif
	if (<roadie_battle_guitar_attack> < 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_guitar / $roadie_battle_ai_attack_guitar_time))
	endif
	if (<roadie_battle_soundboard_attack> < 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_soundboard / $roadie_battle_ai_attack_soundboard_time))
	endif
	if (<roadie_battle_speaker_attack> < 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_speaker / $roadie_battle_ai_attack_speaker_time))
	endif
	getrandomarrayelementweighted elements = <attackable> weights = <weights>
	<equipment> = <element>
	switch <equipment>
		case amp
		<wait_time> = $roadie_battle_ai_attack_amp_time
		case effects
		<wait_time> = $roadie_battle_ai_attack_effects_time
		case guitar
		<wait_time> = $roadie_battle_ai_attack_guitar_time
		case soundboard
		<wait_time> = $roadie_battle_ai_attack_soundboard_time
		case speaker
		<wait_time> = $roadie_battle_ai_attack_speaker_time
	endswitch
	if (($roadie_infos [(<roadie> -1)].previous_action) = repair)
		<roadie_info> = (($roadie_infos [(<roadie> -1)]) + {previous_action = Attack})
		SetArrayElement ArrayName = roadie_infos globalarray index = (<roadie> -1) NewValue = <roadie_info>
		roadie_battle_roadie_animate_expression roadie = <roadie> expression = running
		Wait \{$roadie_battle_ai_switch_sides_time
			Seconds}
	endif
	printf 'Roadie AI: %r attacking... done in %s seconds' r = <roadie> s = <wait_time>
	roadie_battle_roadie_animate_expression roadie = <roadie> expression = sabotaging
	Wait <wait_time> Seconds
	roadie_battle_launch_attack roadie = <roadie> equipment = <equipment>
	wiidscommunication :sendmessage roadie_attack roadie = <roadie> equipment = <equipment>
endscript

script roadie_battle_ai_repair_equipment 
	printf 'Roadie AI: %r decided to repair...' r = <roadie>
	<opponent> = (3 - <roadie>)
	roadie_battle_ai_check_equipment roadie = <roadie>
	if (<need_repair> != 1)
		printf 'Roadie AI: %r found nothing to repair!' r = <roadie>
		return
	endif
	<weights> = []
	if (<roadie_battle_amp_attack> >= 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_amp / $roadie_battle_ai_repair_amp_time))
	endif
	if (<roadie_battle_effects_attack> >= 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_effects / $roadie_battle_ai_repair_effects_time))
	endif
	if (<roadie_battle_guitar_attack> >= 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_guitar / $roadie_battle_ai_repair_guitar_time))
	endif
	if (<roadie_battle_soundboard_attack> >= 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_soundboard / $roadie_battle_ai_repair_soundboard_time))
	endif
	if (<roadie_battle_speaker_attack> >= 0)
		<weights> = (<weights> + ($roadie_battle_ai_attack_speaker / $roadie_battle_ai_repair_speaker_time))
	endif
	get_heaviest_array_element elements = <repairable> weights = <weights>
	<equipment> = <element>
	switch <equipment>
		case amp
		<wait_time> = $roadie_battle_ai_repair_amp_time
		case effects
		<wait_time> = $roadie_battle_ai_repair_effects_time
		case guitar
		<wait_time> = $roadie_battle_ai_repair_guitar_time
		case soundboard
		<wait_time> = $roadie_battle_ai_repair_soundboard_time
		case speaker
		<wait_time> = $roadie_battle_ai_repair_speaker_time
	endswitch
	if (($roadie_infos [(<roadie> -1)].previous_action) = Attack)
		<roadie_info> = (($roadie_infos [(<roadie> -1)]) + {previous_action = repair})
		SetArrayElement ArrayName = roadie_infos globalarray index = (<roadie> -1) NewValue = <roadie_info>
		roadie_battle_roadie_animate_expression roadie = <roadie> expression = running
		Wait \{$roadie_battle_ai_switch_sides_time
			Seconds}
	endif
	printf 'Roadie AI: %r repairing... done in %s seconds' r = <roadie> s = <wait_time>
	roadie_battle_roadie_animate_expression roadie = <roadie> expression = repairing
	Wait <wait_time> Seconds
	roadie_battle_stop_attack roadie = <roadie> equipment = <equipment>
	wiidscommunication :sendmessage roadie_repair roadie = <roadie> equipment = <equipment>
endscript

script roadie_battle_ai_get_esteem 
	<opponent> = (3 - <roadie>)
	roadie_battle_get_player_from_roadie roadie = <roadie>
	getplayerinfo <Player> score
	<our_score> = <score>
	roadie_battle_get_player_from_roadie roadie = <opponent>
	getplayerinfo <Player> score
	<score_diff> = (<our_score> - <score>)
	if (<score_diff> <= ($roadie_battle_ai_modifiers_global.scorediff_danger))
		<esteem> = danger
	elseif (<score_diff> <= ($roadie_battle_ai_modifiers_global.scorediff_bad))
		<esteem> = bad
	elseif (<score_diff> <= ($roadie_battle_ai_modifiers_global.scorediff_normal))
		<esteem> = Normal
	else
		<esteem> = good
	endif
	return esteem = <esteem>
endscript

script get_heaviest_array_element 
	<Max> = 0
	<max_index> = 0
	<index> = 0
	GetArraySize <elements>
	begin
	<weight> = (<weights> [<index>])
	if (<weight> > <Max>)
		<Max> = <weight>
		<max_index> = <index>
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	<element> = (<elements> [<max_index>])
	return element = <element>
endscript

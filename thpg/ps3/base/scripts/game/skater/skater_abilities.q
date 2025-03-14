skater_cheat_all_abilities = 0
skater_ability_ids = [
	aggro_kick
	aggro_speed_increase
	aggro_push
	aggro_skitch
	aggro_score
	aggro_perfect_window
	bowl_carve
	bowl_slash_switchup
	bowl_combo
	ntt_on
	ntt_perfect_flips
	ntt_body_spin
	ntg_on
	ntg_perfect_grabs
	ntg_trucksup_grabs
	ntm_on
	ntm_perfect_ollie
	ntm_trucksup_branching
	bodycheck_on
	bodycheck_uppercut
	bodycheck_charge_check
	rigger_mode
	rigger_wrench
	rigger_camera
	climb_wall
	climb_pole
	climb_wall_fast
]

script sync_abilities_across_profiles 
	begin
	if objectexists id = player1
		break
	else
		printf 'sync_abilities_across_profiles - waiting for player 1...'
	endif
	wait 1 gameframe
	repeat
	begin
	if objectexists id = player2
		break
	else
		printf 'sync_abilities_across_profiles - waiting for player 2...'
	endif
	wait 1 gameframe
	repeat
	begin
	if getnextarrayelement $skater_ability_ids index = <index>
		if skater :skaterprofile_isabilityactive ability = <element>
			AbilityFlags_SetAbilityValue player = 1 ability = <element> state = on
		else
			AbilityFlags_SetAbilityValue player = 1 ability = <element> state = off
		endif
	else
		break
	endif
	repeat
endscript

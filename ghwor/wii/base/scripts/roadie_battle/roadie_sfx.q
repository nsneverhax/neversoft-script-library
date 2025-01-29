roadie_busses = [
	roadie_battle_p1_mode
	roadie_battle_p2_mode
	roadie_battle_p3_mode
	roadie_battle_p4_mode
]
roadie_vo = {
	win = [
		rb_roadie1_win
		rb_roadie2_win
		rb_roadie3_win
		rb_roadie4_win
	]
	attacked = [
		rb_roadie1_attacked
		rb_roadie2_attacked
		rb_roadie3_attacked
		rb_roadie4_attacked
	]
	join = [
		rb_roadie1_confirm
		rb_roadie2_confirm
		rb_roadie3_confirm
		rb_roadie4_confirm
	]
	repair = [
		rb_roadie1_repairs
		rb_roadie2_repairs
		rb_roadie3_repairs
		rb_roadie4_repairs
	]
	buff = [
		rb_roadie1_buffs
		rb_roadie2_buffs
		rb_roadie3_buffs
		rb_roadie4_buffs
	]
	fretboard = [
		rb_roadie1_fretboard
		rb_roadie2_fretboard
		rb_roadie3_fretboard
		rb_roadie4_fretboard
	]
}
roadie_win_vo_has_played = FALSE

script roadie_battle_play_roadie_vo \{roadie = !i1768515945
		vo_type = !q1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = avatar
	StopSoundsByBuss ($roadie_busses [<avatar>])
	SoundEvent event = ($roadie_vo.<vo_type> [<avatar>])
endscript

script roadie_battle_play_roadie_vo_delayed \{roadie = !i1768515945
		vo_type = !q1768515945
		delay_time_secs = !f1768515945}
	SpawnScriptNow {
		roadie_battle_play_roadie_vo_delayed_spawned
		params = {
			roadie = <roadie>
			vo_type = <vo_type>
			delay_time_secs = <delay_time_secs>
		}
	}
endscript

script roadie_battle_play_roadie_vo_delayed_spawned \{roadie = !i1768515945
		vo_type = !q1768515945
		delay_time_secs = !f1768515945}
	Wait <delay_time_secs> Seconds
	roadie_battle_play_roadie_vo roadie = <roadie> vo_type = <vo_type>
endscript

script roadie_battle_play_fretboard_sfx 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_play_roadie_vo roadie = <roadie> vo_type = fretboard
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_maybe_play_win_vo \{roadie = !i1768515945
		delay_time_secs = !f1768515945}
	if ($roadie_win_vo_has_played = FALSE)
		roadie_battle_play_roadie_vo_delayed roadie = <roadie> vo_type = win delay_time_secs = <delay_time_secs>
		Change \{roadie_win_vo_has_played = true}
	endif
endscript

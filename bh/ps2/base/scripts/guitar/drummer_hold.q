
script hold_body_loops 
	Wait \{$drummer_offset
		Seconds}
	if (<body_type> = Idle)
		KillSpawnedScript \{Name = drummer_transit_loops}
		index = 0
		drummer :Obj_SpawnScriptNow drummer_transit_idles params = {state = <state> tapin = <tapin> currentset = <currentset> last_hit = <last_hit>}
		if CompositeObjectExists \{drummer2}
			Wait \{1
				Frame}
			drummer2 :Obj_SpawnScriptNow drummer_transit_idles params = {state = <state> tapin = <tapin> currentset = <currentset> last_hit = <last_hit>}
		endif
	else
		KillSpawnedScript \{Name = drummer_transit_idles}
		drummer :Obj_SpawnScriptNow drummer_transit_loops params = {state = <state> BlendDuration = <BlendDuration>}
		if CompositeObjectExists \{drummer2}
			Wait \{1
				Frame}
			drummer2 :Obj_SpawnScriptNow drummer_transit_loops params = {state = <state> BlendDuration = <BlendDuration>}
		endif
	endif
	drummer_ids = [musician1]
	state = in
	tapin = FALSE
	last_hit = FALSE
	currentset = 0
	BlendDuration = 0.0
endscript

script idle_check 
	time_from_idle = (((1 - $drum_idlepoint_arm_shit) * $drum_slowest_arm_hit) / 1000.0)
	time_to_hit_1 = (<time_to_hit_1> / 1000.0)
	waitTime = 0.0
	if ($drummer_idle = true)
		Change \{drummer_idle = FALSE}
		if (<time_to_hit_1> > <time_from_idle>)
			waitTime = (<time_to_hit_1> - <time_from_idle>)
			Wait <waitTime> Seconds
			SpawnScriptNow hold_body_loops params = {
				body_type = Loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				BlendDuration = <time_from_idle>
			}
		else
			SpawnScriptNow hold_body_loops params = {
				body_type = Loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				BlendDuration = <time_to_hit_1>
			}
		endif
	else
		if (<should_idle> = true)
			SpawnScriptNow hold_body_loops params = {
				body_type = Idle
				last_hit = <last_hit>
				currentset = <currentset>
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				tapin = <tapin>
			}
			waitTime = (<time_to_hit_1> - <time_from_idle>)
			Wait <waitTime> Seconds
			SpawnScriptNow hold_body_loops params = {
				body_type = Loop
				num_drummers = <num_drummers>
				drummer_ids = <drummer_ids>
				state = in
				BlendDuration = <time_from_idle>
			}
		endif
	endif
	return lost_time = (<waitTime> * 1000.0)
	num_drummers = 0
	drummer_ids = [musician2]
	last_hit = FALSE
	currentset = 0
	tapin = FALSE
endscript

script hold_transit_requests \{time_to_trans_long = 0.0
		time_to_trans_short = 0.0}
	currentset = $current_db_base
	idle_check {
		last_hit = <last_hit>
		time_to_hit_1 = <time_to_hit_1>
		num_drummers = <num_drummers>
		drummer_ids = <drummer_ids>
		should_idle = <should_idle>
		tapin = <tapin>
		currentset = <currentset>
	}
	0xad8b48df
endscript
0xad14cdc7 = [
	1.0
	0.9927499
	0.97199994
	0.93924993
	0.89599997
	0.84375006
	0.784
	0.71825
	0.64800006
	0.57475
	0.5
	0.42525002
	0.35200003
	0.28175
	0.216
	0.15625
	0.104
	0.0607499
	0.027999999
	0.00725001
	0.0
]
0x1bd54232 = [
	1.0
	0.9927499
	0.97199994
	0.93924993
	0.89599997
	0.84375006
	0.784
	0.71825
	0.64800006
	0.57475
	0.5
	0.42525002
	0.35200003
	0.28175
	0.216
	0.15625
	0.104
	0.0607499
	0.027999999
	0.00725001
	0.0
]

script hold_body_trans 
	Wait <waitTime> Seconds
	0xa1e646e3
endscript
0x6b846a4a = [
	1.0
	0.9927499
	0.97199994
	0.93924993
	0.89599997
	0.84375006
	0.784
	0.71825
	0.64800006
	0.57475
	0.5
	0.42525002
	0.35200003
	0.28175
	0.216
	0.15625
	0.104
	0.0607499
	0.027999999
	0.00725001
	0.0
]

script hold_transit_arms 
	Wait \{$drummer_offset
		Seconds}
	0x9334aad7
endscript

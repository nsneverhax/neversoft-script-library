
script ntt_start_focus_effect 
	if istrue \{$ntt_use_focus_effect}
		spawnscriptlater \{NTTBloom
			id = NTTBloom_ScriptId
			params = {
				wait_time = 0.25
			}}
		nail_the_trick_into_sfx
	endif
endscript

script ntt_end_focus_effect 
	if istrue \{$ntt_use_focus_effect}
		spawnscriptlater \{EndNTTBloom
			id = EndNTTBloom_ScriptID}
		nail_the_trick_out_of_sfx
	endif
endscript

script set_ntt_slomo \{time = 0.0
		speed = 1.0
		no_lerp = 0}
	obj_killspawnedscript \{name = ntt_lerp_slomo}
	if (<time> = 0.0)
		setslomo <speed> nail_the_trick
	else
		if gotparam \{wait}
			ntt_lerp_slomo time = <time> end_speed = <speed>
		else
			obj_spawnscriptnow {
				ntt_lerp_slomo
				params = {
					time = <time>
					end_speed = <speed>
					no_lerp = <no_lerp>
				}
			}
		endif
	endif
endscript

script ntt_lerp_slomo 
	if istrue <no_lerp>
		wait <time> seconds ignoreslomo
	else
		getdeltatime ignore_slomo
		GetSlomo
		speed = <slomo>
		target_dist = (<end_speed> - <speed>)
		target_time = <time>
		adj = ((<target_dist> / <target_time>) * <delta_time>)
		if (<adj> < 0.001)
			<adj> = 0.001
		endif
		begin
		setslomo <speed> nail_the_trick
		<speed> = (<speed> + <adj>)
		if (<adj> > 0)
			if (<speed> > <end_speed>)
				break
			endif
		endif
		if (<adj> < 0)
			if (<speed> < <end_speed>)
				break
			endif
		endif
		wait 1 gameframe
		repeat
	endif
	setslomo <end_speed> nail_the_trick
endscript

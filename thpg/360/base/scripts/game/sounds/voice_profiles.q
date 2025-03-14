SoundEventScriptData = {
	KnockDown = {
		logic_priority = 90
		event_string = '_KnockDown'
		use_sex = true
		can_use_memory = true
		can_use_stream = false
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	ShakesFist = {
		logic_priority = 80
		event_string = '_ShakesFist'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	attack = {
		logic_priority = 70
		event_string = '_Attack'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	Tackle = {
		logic_priority = 70
		event_string = '_Attack'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	GuardWarning = {
		logic_priority = 65
		event_string = '_Warning'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	GuardTaunt = {
		logic_priority = 65
		event_string = '_Taunt'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	GetAngry = {
		logic_priority = 60
		event_string = '_GetAngry'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	Chase = {
		logic_priority = 50
		event_string = '_Chase'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	avoid = {
		logic_priority = 40
		event_string = '_Avoid'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	BooLand = {
		logic_priority = 30
		event_string = '_BooLand'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.4
		max_delay = 0.8
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	CheerLand = {
		logic_priority = 30
		event_string = '_CheerLand'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.4
		max_delay = 0.8
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	Notice = {
		logic_priority = 10
		event_string = '_Notice'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	far = {
		logic_priority = 75
		event_string = '_Attention'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	KeepItUp = {
		logic_priority = 20
		event_string = '_KeepItUp'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	vehiclehitped = {
		logic_priority = 15
		event_string = '_VehicleHitPed'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	Impatient = {
		logic_priority = 25
		event_string = '_Impatient'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	idle = {
		logic_priority = 10
		event_string = '_Idle'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	honk = {
		logic_priority = 75
		event_string = '_Honk'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
	vehiclestoppedforped = {
		logic_priority = 75
		event_string = '_VehicleStoppedForPed'
		use_sex = false
		can_use_memory = false
		can_use_stream = true
		min_delay = 0.0
		max_delay = 0.0
		use_pos_info = true
		animate_mouth = false
		no_pitch_mod = false
	}
}
noticevovoiceprofiles = {
	teenmaleskater1 = false
	TeenMaleSkater2 = false
	SecurityGuard3 = true
}

script playvoiceoverbyevent 
	obj_spawnscriptnow PlayVoiceoverByEvent_Spawned params = <...>
endscript

script PlayVoiceoverByEvent_Spawned 
	eventcache_add event_id = Playing_Vo event_data = {vo_event_id = <event_id>}
	if structurecontains structure = $SoundEventScriptData <event_id>
		event_string = ($SoundEventScriptData.<event_id>.event_string)
		use_sex = ($SoundEventScriptData.<event_id>.use_sex)
		can_use_memory = ($SoundEventScriptData.<event_id>.can_use_memory)
		can_use_stream = ($SoundEventScriptData.<event_id>.can_use_stream)
		min_delay = ($SoundEventScriptData.<event_id>.min_delay)
		max_delay = ($SoundEventScriptData.<event_id>.max_delay)
		logic_priority = ($SoundEventScriptData.<event_id>.logic_priority)
		use_pos_info = ($SoundEventScriptData.<event_id>.use_pos_info)
		animate_mouth = ($SoundEventScriptData.<event_id>.animate_mouth)
		no_pitch_mod = ($SoundEventScriptData.<event_id>.no_pitch_mod)
	else
		printf "WARNING: PlayVoiceoverByEvent_Spawned - unhandled event_id - %a" a = <event_id>
		return
	endif
	if (<use_sex> = true)
		getsingletag profile
		switch (<profile>.sex)
			case female
			appended_id = Generic_Female
			case kid
			appended_id = Generic_Kid
			case male
			default
			getsingletag profile
			switch (<profile>.voice_profile)
				case thug1
				appended_id = thug1
				case THUG2
				appended_id = thug1
				default
				appended_id = generic_male
			endswitch
		endswitch
	else
		getsingletag voice_profile
		if NOT gotparam voice_profile
			printf "WARNING! no voice profile passed to PlayVoiceoverByEvent_Spawned"
			appended_id = generic_male
		else
			appended_id = <voice_profile>
		endif
	endif
	appendsuffixtochecksum base = <appended_id> suffixstring = <event_string>
	if ((<can_use_memory> = true) && ((pendingpakmanloads map = zones noparse = true) || (<can_use_stream> = false)))
		appendsuffixtochecksum base = <appended_id> suffixstring = '_Sound'
	else
		appendsuffixtochecksum base = <appended_id> suffixstring = '_Stream'
	endif
	if (<max_delay> > 0.0)
		getrandomvalue name = wait_time a = <min_delay> b = <max_delay>
		wait wait_time seconds
	endif
	full_event_id = <appended_id>
	appendsuffixtochecksum base = <full_event_id> suffixstring = '_struct'
	if globalexists name = <appended_id> type = structure
		sound_params = {use_pos_info = <use_pos_info>
			animate_mouth = <animate_mouth>
			no_pitch_mod = <no_pitch_mod>
			finished_event_id = <finished_event_id>
			started_event_id = <started_event_id>
			failed_event_id = <failed_event_id>
			logic_priority = <logic_priority>
			stream_priority = (<appended_id>.default_priority)
			buss_id = (<appended_id>.default_buss)
			no_repeat_for = (<appended_id>.norepeatfor)}
		soundevent {event = <full_event_id> <sound_params>}
	else
		if gotparam failed_event_id
			eventcache_add event_id = <failed_event_id>
		endif
	endif
endscript

script VoOverride use_pos_info = true animate_mouth = false no_pitch_mod = false
	begin
	blockuntilevent type = Playing_Vo
	if ((<data>.vo_event_id) = <overridden_event_id>)
		appendsuffixtochecksum base = <event_id> suffixstring = '_struct'
		sound_params = {use_pos_info = <use_pos_info>
			animate_mouth = <animate_mouth>
			no_pitch_mod = <no_pitch_mod>
			finished_event_id = <finished_event_id>
			started_event_id = <started_event_id>
			failed_event_id = <failed_event_id>
			logic_priority = 99
			stream_priority = (<appended_id>.default_priority)
			buss_id = (<appended_id>.default_buss)
			no_repeat_for = (<appended_id>.norepeatfor)}
		soundevent {event = <event_id> <sound_params>}
	endif
	repeat
endscript

script debug_voice_printf 
	if (enable_voice_debug = 1)
		printf <...>
	endif
endscript

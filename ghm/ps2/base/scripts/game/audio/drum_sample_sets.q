drum_sample_test = 0
drum_input_current_cymbal = NULL
drum_input_current_hihat = NULL
drum_input_current_kick = NULL
drum_input_current_snare = NULL
drum_input_current_tom = NULL
drum_pads = [
	{
		id = snare
		string_id = 'snare'
		name_text = qs(0x91233341)
	}
	{
		id = kick
		string_id = 'kick'
		name_text = qs(0x6e4b4a3e)
	}
	{
		id = tom1
		string_id = 'tom1'
		name_text = qs(0xbd024849)
	}
	{
		id = tom2
		string_id = 'tom2'
		name_text = qs(0x962f1b8a)
	}
	{
		id = hihat
		string_id = 'hihat'
		name_text = qs(0xd6060436)
	}
	{
		id = cymbal
		string_id = 'cymbal'
		name_text = qs(0x95ba86cc)
	}
]
drum_kits = [
	{
		id = heavyrock
		string_id = 'heavyrock'
		name_text = qs(0x083da487)
		percussion_id = rockpercussion
		percussion_string_id = 'heavyrock'
	}
]

script play_drum_sample 
	if ($game_mode = training)
		if NOT ($current_speedfactor = 1.0)
			if NOT playerinfoequals \{1
					part = drum}
				if ($current_time * 1000 < $current_starttime)
					return
				endif
			endif
		endif
	endif
	playdrumsample_cfunc <...>
	return drum_sample = <drum_sample>
endscript

script play_drum_sample_unoptimized \{drum_set = heavyrock
		pad = snare
		velocity = 127
		second_pedal_position = 127
		buss = drums_ingame
		scale_volume = 5
		loop_pitch = 0
		pan_left = -1.0
		pan_right = 1.0
		pan_mono = 0.0}
	drum_set = heavyrock
	slot = 7
	if ((<buss> = drums_ingame) || (<buss> = drums_ingame_kick) || (<buss> = drums_ingame_toms) || (<buss> = drums_ingame_hats) || (<buss> = drums_ingame_cymbals) || (<buss> = drums_ingame_snare))
		slot = 2
	endif
	if (<buss> = practicemode_drums)
		return
	endif
	CastToInteger \{velocity}
	if (<velocity> < 0)
		<velocity> = 0
	endif
	if (<velocity> > 127)
		<velocity> = 127
	endif
	if IsTrue \{$debugsoundfx}



	endif
	if (<velocity> < 0 || <velocity> > 127)

		return
	endif
	if NOT GotParam \{drum_checksum}
		if NOT GotParam \{drum_kit_string}
			GetArraySize \{$drum_kits}
			index = ($jam_current_drum_kit)
			drum_kit_string = ''
			<drum_kit_string> = ($drum_kits [<index>].string_id)
		endif
		if (<drum_kit_string> = '')

			return
		endif
		GetArraySize \{$drum_pads}
		index = 0
		pad_string = ''
		begin
		if (($drum_pads [<index>].id) = <pad>)
			<pad_string> = ($drum_pads [<index>].string_id)
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
		if (<pad_string> = '')

			return
		endif
		formatText checksumName = 0x42515ef6 '%a_%b_sampleset' a = <drum_kit_string> b = <pad_string>
	else
		0x42515ef6 = <drum_checksum>
	endif
	GetArraySize ($<0x42515ef6>)
	if NOT GlobalExists Name = <0x42515ef6> Type = array

		return
	endif
	index = 0
	0x28da71e4 = 0.0
	0x250becce = 0.0
	begin
	if (($<0x42515ef6> [<index>].velocity_cutoff) > <velocity>)
		<0x250becce> = (1.0 * ($<0x42515ef6> [<index>].velocity_cutoff))
		break
	endif
	<0x28da71e4> = (1.0 * ($<0x42515ef6> [<index>].velocity_cutoff))
	<0xe132fcd1> = <index>
	<index> = (<index> + 1)
	if (<index> >= <array_Size>)
		<0x250becce> = 127.0
		break
	endif
	repeat
	0xc92fa624 = 0.0
	0xf76abbfa = 0.0
	volume_low = ($<0x42515ef6> [<0xe132fcd1>].volume_low)
	volume_high = ($<0x42515ef6> [<0xe132fcd1>].volume_high)
	pitch_low = ($<0x42515ef6> [<0xe132fcd1>].pitch_low)
	pitch_high = ($<0x42515ef6> [<0xe132fcd1>].pitch_high)
	<0xc92fa624> = (((<volume_high> - <volume_low>) * ((<velocity> - <0x28da71e4>) / (<0x250becce> - <0x28da71e4>))) + <volume_low>)
	<0xf76abbfa> = (((<pitch_high> - <pitch_low>) * ((<velocity> - <0x28da71e4>) / (<0x250becce> - <0x28da71e4>))) + <pitch_low>)
	GetArraySize ($<0x42515ef6> [<0xe132fcd1>].sample_array)
	GetRandomValue Name = 0x0eb9b057 integer a = 0 b = (<array_Size> -1)
	0x1e1afcc0 = ($<0x42515ef6> [<0xe132fcd1>].sample_array [<0x0eb9b057>])
	if ($drum_sample_test = 1)
		<0x1e1afcc0> = drum_snare5
	endif
	if IsTrue \{$debugsoundfx}
		<0x49aa5663> = 1
	endif
	if ($jam_reverb = 1)
		if StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_left
			pan_left = ($<0x42515ef6> [<0xe132fcd1>].pan_left)
			pan_right = ($<0x42515ef6> [<0xe132fcd1>].pan_right)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_left> pan1y = 1.0 pan2x = <pan_right> pan2y = 1.0 buss = <buss> send_vol2 = -9 slot = <slot>
		elseif StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_mono
			pan_mono = ($<0x42515ef6> [<0xe132fcd1>].pan_mono)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_mono> pan1y = 1.0 buss = <buss> send_vol2 = -9 slot = <slot>
		else
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) buss = <buss> send_vol2 = -9 slot = <slot>
		endif
	else
		if StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_left
			pan_left = ($<0x42515ef6> [<0xe132fcd1>].pan_left)
			pan_right = ($<0x42515ef6> [<0xe132fcd1>].pan_right)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_left> pan1y = 1.0 pan2x = <pan_right> pan2y = 1.0 buss = <buss> slot = <slot>
		elseif StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_mono
			pan_mono = ($<0x42515ef6> [<0xe132fcd1>].pan_mono)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_mono> pan1y = 1.0 buss = <buss> slot = <slot>
		else
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) buss = <buss> slot = <slot>
		endif
	endif
	if IsTrue \{$debugsoundfx}



	endif
	return drum_sample = <0x42515ef6>
endscript
loadeddrumkitpaks_cymbal = 'none'
loadeddrumkitpaks_floortom = 'none'
loadeddrumkitpaks_hihat = 'none'
loadeddrumkitpaks_hitom = 'none'
loadeddrumkitpaks_kick = 'none'
loadeddrumkitpaks_snare = 'none'
loadeddrumkitpaks_cymbal_percussion = 'none'
loadeddrumkitpaks_floortom_percussion = 'none'
loadeddrumkitpaks_hihat_percussion = 'none'
loadeddrumkitpaks_hitom_percussion = 'none'
loadeddrumkitpaks_kick_percussion = 'none'
loadeddrumkitpaks_snare_percussion = 'none'
drumkitparts = {
	cymbal = 'cymbal'
	floortom = 'floortom'
	hihat = 'hihat'
	hitom = 'hitom'
	kick = 'kick'
	cymbal = 'cymbal'
	snare = 'snare'
}
last_drum_kit_loaded = 'none'

script loaddrumkitall \{drum_kit = 'heavyrock'
		async = 1
		reset_percussion = 1
		Heap = 0xc39f2ba1}
	if (<reset_percussion> = 1)
		Change \{is_percussion_kit = 0}
	endif
	return
	if (<drum_kit> = $last_drum_kit_loaded)
		if GotParam \{percussion_kit}
			if (<percussion_kit> = $0x2fbd45b0)

				return
			endif
		else

			return
		endif
	endif
	unloaddrumkitall
	if NOT GotParam \{Heap}
		<Heap> = 0xc39f2ba1
	endif
	loaddrumkit Type = cymbal drum_kit = <drum_kit> async = <async> Heap = <Heap>
	loaddrumkit Type = floortom drum_kit = <drum_kit> async = <async> Heap = <Heap>
	loaddrumkit Type = hihat drum_kit = <drum_kit> async = <async> Heap = <Heap>
	loaddrumkit Type = hitom drum_kit = <drum_kit> async = <async> Heap = <Heap>
	loaddrumkit Type = kick drum_kit = <drum_kit> async = <async> Heap = <Heap>
	loaddrumkit Type = snare drum_kit = <drum_kit> async = <async> Heap = <Heap>
	Change last_drum_kit_loaded = <drum_kit>
	Change 0x11afd57c = <drum_kit>
	if GotParam \{percussion_kit}
		loaddrumkit Type = cymbal drum_kit = <percussion_kit> async = <async> percussion Heap = <Heap>
		loaddrumkit Type = floortom drum_kit = <percussion_kit> async = <async> percussion Heap = <Heap>
		loaddrumkit Type = hihat drum_kit = <percussion_kit> async = <async> percussion Heap = <Heap>
		loaddrumkit Type = hitom drum_kit = <percussion_kit> async = <async> percussion Heap = <Heap>
		loaddrumkit Type = kick drum_kit = <percussion_kit> async = <async> percussion Heap = <Heap>
		loaddrumkit Type = snare drum_kit = <percussion_kit> async = <async> percussion Heap = <Heap>
		Change 0x2fbd45b0 = <percussion_kit>
		Change 0x5c345721 = <percussion_kit>
	endif
endscript

script loaddrumkit \{Type = snare
		drum_kit = 'heavyrock'
		async = 1
		Heap = 0xc39f2ba1}
	return
endscript

script unloaddrumkitall 
	return
endscript

script unloaddrumkit \{Type = snare}
	return
endscript

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
		percussion_string_id = 'rockpercussion'
	}
	{
		id = classicrock
		string_id = 'classicrock'
		name_text = qs(0x8c4362ac)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = fusion
		string_id = 'fusion'
		name_text = qs(0x4d52fc8b)
		percussion_id = brazilianpercussion
		percussion_string_id = 'brazilianpercussion'
	}
	{
		id = hiphop
		string_id = 'hiphop'
		name_text = qs(0xfe3a0ec0)
		percussion_id = hiphoppercussion
		percussion_string_id = 'hiphoppercussion'
	}
	{
		id = modernrock
		string_id = 'modernrock'
		name_text = qs(0xdc91cbc7)
		percussion_id = latinpercussion
		percussion_string_id = 'latinpercussion'
	}
	{
		id = bliphop
		string_id = 'Bliphop'
		name_text = qs(0x3d9fff99)
		percussion_id = robot
		percussion_string_id = 'robot'
	}
	{
		id = electrobass
		string_id = 'Electro'
		name_text = qs(0xab67c023)
		percussion_id = electropercussion
		percussion_string_id = 'electropercussion'
	}
	{
		id = housekit
		string_id = 'House'
		name_text = qs(0xa89adf58)
		percussion_id = electropercussion
		percussion_string_id = 'electropercussion'
	}
	{
		id = oldschool
		string_id = 'Oldschool'
		name_text = qs(0x22fbae34)
		percussion_id = oldschoolpercussion
		percussion_string_id = 'oldschoolpercussion'
	}
	{
		id = cheesy
		string_id = 'Cheesy'
		name_text = qs(0xd5fb15a5)
		percussion_id = eightysdrums
		percussion_string_id = 'Eightys'
	}
	{
		id = eightys
		string_id = 'Eightys'
		name_text = qs(0x5b2da104)
		percussion_id = computight
		percussion_string_id = 'Computight'
	}
	{
		id = computight
		string_id = 'Computight'
		name_text = qs(0xec704d64)
		percussion_id = robot
		percussion_string_id = 'robot'
	}
	{
		id = india
		string_id = 'India'
		name_text = qs(0x18b01739)
		percussion_id = brazilianpercussion
		percussion_string_id = 'brazilianpercussion'
	}
	{
		id = jazzy
		string_id = 'Jazzy'
		name_text = qs(0xd3ccbd55)
		percussion_id = brazilianpercussion
		percussion_string_id = 'brazilianpercussion'
	}
	{
		id = orchestral
		string_id = 'Orchestral'
		name_text = qs(0x3255a109)
		percussion_id = latinpercussion
		percussion_string_id = 'latinpercussion'
	}
	{
		id = scratch
		string_id = 'scratch'
		name_text = qs(0x67301359)
		percussion_id = electro
		percussion_string_id = 'Electro'
	}
	{
		id = scratch_electro
		string_id = 'scratch_electro'
		name_text = qs(0xbd5c5092)
		percussion_id = electro
		percussion_string_id = 'Electro'
	}
	{
		id = dub
		string_id = 'dub'
		name_text = qs(0x5e8c371c)
		percussion_id = pigmy
		percussion_string_id = 'pigmy'
	}
	{
		id = conga
		string_id = 'conga'
		name_text = qs(0xa3f7d085)
		percussion_id = latinpercussion
		percussion_string_id = 'latinpercussion'
	}
	{
		id = gunshot
		string_id = 'gunshot'
		name_text = qs(0x20b29f07)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = pigmy
		string_id = 'pigmy'
	}
	{
		id = indiagirl
		string_id = 'Indiagirl'
	}
	{
		id = rockpercussion
		string_id = 'rockpercussion'
	}
	{
		id = monstervoice
		string_id = 'monstervoice'
	}
	{
		id = brazilianpercussion
		string_id = 'brazilianpercussion'
	}
	{
		id = hiphoppercussion
		string_id = 'hiphoppercussion'
	}
	{
		id = latinpercussion
		string_id = 'latinpercussion'
	}
	{
		id = oldschoolpercussion
		string_id = 'oldschoolpercussion'
	}
	{
		id = electropercussion
		string_id = 'electropercussion'
	}
	{
		id = robot
		string_id = 'Robot'
	}
]

script play_drum_sample 
	printf \{qs(0xf314dc9e)}
	printf qs(0xdf6ef640) d = ($practice_enabled) e = ($0xdbe52d7a)
	if ($practice_enabled = 1)
		if ($0xdbe52d7a = 1)
			printf \{qs(0xfc69ce23)}
			return
		endif
	endif
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
		printf channel = sfx qs(0x2d388a61) s = <buss>
		printf channel = sfx qs(0xc7e8d4d3) s = <drum_set>
		printf channel = sfx qs(0x674e9fff) s = <pad>
	endif
	if (<velocity> < 0 || <velocity> > 127)
		printf \{channel = sfx
			qs(0xd20d5697)}
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
			printf \{channel = sfx
				qs(0xfa93a607)}
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
			printf \{channel = sfx
				qs(0x8c454bc4)}
			return
		endif
		formatText checksumName = 0x42515ef6 '%a_%b_sampleset' a = <drum_kit_string> b = <pad_string>
	else
		0x42515ef6 = <drum_checksum>
	endif
	GetArraySize ($<0x42515ef6>)
	if NOT GlobalExists Name = <0x42515ef6> Type = array
		printf \{channel = sfx
			qs(0x2db0057d)}
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
	if (<pad> = cymbal)
		if (<buss> = jammode_drums)
			buss = jammode_drums_cymbals
		endif
		if (<buss> = drums_ingame)
			buss = drums_ingame_cymbals
		endif
		if issoundplayingbyid \{$drum_input_current_cymbal}
			stopsound unique_id = ($drum_input_current_cymbal) fade_type = linear fade_time = 1.0
		endif
	endif
	if (<pad> = hihat)
		if issoundplayingbyid \{$drum_input_current_hihat}
			stopsound unique_id = ($drum_input_current_hihat) fade_type = linear fade_time = 0.1
		endif
	endif
	if (<pad> = kick)
		if issoundplayingbyid \{$drum_input_current_kick}
			stopsound unique_id = ($drum_input_current_kick) fade_type = linear fade_time = 0.05
		endif
	endif
	if (<pad> = snare)
		if issoundplayingbyid \{$drum_input_current_snare}
			stopsound unique_id = ($drum_input_current_snare) fade_type = linear fade_time = 0.1
		endif
	endif
	if ((<pad> = tom1) || (<pad> = tom2))
		if issoundplayingbyid \{$drum_input_current_tom}
			stopsound unique_id = ($drum_input_current_tom) fade_type = linear fade_time = 0.1
		endif
	endif
	if IsTrue \{$debugsoundfx}
		<0x49aa5663> = 1
	endif
	if ($jam_reverb = 1)
		if StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_left
			pan_left = ($<0x42515ef6> [<0xe132fcd1>].pan_left)
			pan_right = ($<0x42515ef6> [<0xe132fcd1>].pan_right)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_left> pan1y = 1.0 pan2x = <pan_right> pan2y = 1.0 buss = <buss> send_vol2 = -9
		elseif StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_mono
			pan_mono = ($<0x42515ef6> [<0xe132fcd1>].pan_mono)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_mono> pan1y = 1.0 buss = <buss> send_vol2 = -9
		else
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) buss = <buss> send_vol2 = -9
		endif
	else
		if StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_left
			pan_left = ($<0x42515ef6> [<0xe132fcd1>].pan_left)
			pan_right = ($<0x42515ef6> [<0xe132fcd1>].pan_right)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_left> pan1y = 1.0 pan2x = <pan_right> pan2y = 1.0 buss = <buss>
		elseif StructureContains structure = ($<0x42515ef6> [<0xe132fcd1>]) pan_mono
			pan_mono = ($<0x42515ef6> [<0xe132fcd1>].pan_mono)
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) pan1x = <pan_mono> pan1y = 1.0 buss = <buss>
		else
			PlaySound 0x49aa5663 = <0x49aa5663> <0x1e1afcc0> vol = (<0xc92fa624> + <scale_volume>) pitch = (<0xf76abbfa> + <loop_pitch>) buss = <buss>
		endif
	endif
	if IsTrue \{$debugsoundfx}
		printf channel = sfx qs(0x481304b4) a = <0x28da71e4> b = <0x250becce> c = <volume_low> d = <volume_high> e = <pitch_low> f = <pitch_high>
		printf channel = sfx qs(0xc86c799f) s = <0x0eb9b057> a = <0xc92fa624> b = <0xf76abbfa>
		printf \{channel = sfx
			qs(0xabc711d5)}
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
0x2fbd45b0 = 'none'
0x11afd57c = 'none'
0x5c345721 = 'none'

script loaddrumkitall \{drum_kit = 'heavyrock'
		async = 1
		reset_percussion = 1
		Heap = 0xc39f2ba1}
	if (<reset_percussion> = 1)
		Change \{is_percussion_kit = 0}
	endif
	if (<drum_kit> = $last_drum_kit_loaded)
		if GotParam \{percussion_kit}
			if (<percussion_kit> = $0x2fbd45b0)
				printf 'LoadDrumKitAll - %s and %p already loaded' s = <drum_kit> p = <percussion_kit>
				return
			endif
		else
			printf 'LoadDrumKitAll - %s already loaded' s = <drum_kit>
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

script 0xd7221b77 
	0x595d37c4 Type = cymbal drum_kit = <drum_kit> async = <async>
	0x595d37c4 Type = floortom drum_kit = <drum_kit> async = <async>
	0x595d37c4 Type = hihat drum_kit = <drum_kit> async = <async>
	0x595d37c4 Type = hitom drum_kit = <drum_kit> async = <async>
	0x595d37c4 Type = kick drum_kit = <drum_kit> async = <async>
	0x595d37c4 Type = snare drum_kit = <drum_kit> async = <async>
	Change 0x11afd57c = <drum_kit>
	if GotParam \{percussion_kit}
		0x595d37c4 Type = cymbal drum_kit = <percussion_kit> async = <async> percussion
		0x595d37c4 Type = floortom drum_kit = <percussion_kit> async = <async> percussion
		0x595d37c4 Type = hihat drum_kit = <percussion_kit> async = <async> percussion
		0x595d37c4 Type = hitom drum_kit = <percussion_kit> async = <async> percussion
		0x595d37c4 Type = kick drum_kit = <percussion_kit> async = <async> percussion
		0x595d37c4 Type = snare drum_kit = <percussion_kit> async = <async> percussion
		Change 0x5c345721 = <percussion_kit>
	endif
endscript

script 0x595d37c4 \{Type = snare
		drum_kit = 'heavyrock'}
	if StructureContains structure = $drumkitparts <Type>
		if GotParam \{percussion}
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<Type>)
			formatText TextName = 0xb82d334b 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<Type>)
		else
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<Type>)
			formatText TextName = 0xb82d334b 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<Type>)
		endif
		formatText checksumName = 0xf8617b35 '%s_%t_startup' s = <drum_kit> t = ($drumkitparts.<Type>)
		Change GlobalName = <global_pak_crc> NewValue = <0xf8617b35>
		printf 'Set %a to %b' a = <0xb82d334b> b = <0xf8617b35>
		return 0x822f0d09 = <global_pak_crc> 0x2ada3fb1 = <0xf8617b35>
	else
		printscriptinfo \{'LoadDrumKit'}
		ScriptAssert \{'Invalid Drumkit type'}
		return \{0x822f0d09 = None
			0x2ada3fb1 = None}
	endif
endscript

script loaddrumkit \{Type = snare
		drum_kit = 'heavyrock'
		async = 1
		Heap = 0xc39f2ba1}
	0x595d37c4 <...>
	if NOT (<0x822f0d09> = None)
		if (<Heap> = 0xc39f2ba1)
			<0x2ada3fb1> 0xcd98d3f6 = 0xa47d93f4
		elseif (<Heap> = 0xb5d472b2)
			<0x2ada3fb1> 0xcd98d3f6 = 0xac3d83a2
		else
			ScriptAssert \{qs(0x2dd19cb3)}
		endif
	endif
endscript

script unloaddrumkitall 
	unloaddrumkit \{Type = cymbal}
	unloaddrumkit \{Type = floortom}
	unloaddrumkit \{Type = hihat}
	unloaddrumkit \{Type = hitom}
	unloaddrumkit \{Type = kick}
	unloaddrumkit \{Type = snare}
	unloaddrumkit \{Type = cymbal
		percussion}
	unloaddrumkit \{Type = floortom
		percussion}
	unloaddrumkit \{Type = hihat
		percussion}
	unloaddrumkit \{Type = hitom
		percussion}
	unloaddrumkit \{Type = kick
		percussion}
	unloaddrumkit \{Type = snare
		percussion}
	Change \{last_drum_kit_loaded = 'none'}
	Change \{0x2fbd45b0 = 'none'}
endscript

script 0x7f49d207 \{Type = snare}
	if ($last_drum_kit_loaded = 'none')
		return \{0x822f0d09 = None
			0x2ada3fb1 = None}
	endif
	if StructureContains structure = $drumkitparts <Type>
		if GotParam \{percussion}
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<Type>)
			formatText TextName = 0xb82d334b 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<Type>)
		else
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<Type>)
			formatText TextName = 0xb82d334b 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<Type>)
		endif
		if GotParam \{percussion}
			formatText checksumName = 0xf8617b35 '%s_%t_startup' s = $0x2fbd45b0 t = ($drumkitparts.<Type>) DontAssertForChecksums
		else
			formatText checksumName = 0xf8617b35 '%s_%t_startup' s = ($last_drum_kit_loaded) t = ($drumkitparts.<Type>) DontAssertForChecksums
		endif
		Change GlobalName = <global_pak_crc> NewValue = 'none'
		printf 'Set %a to %b' a = <0xb82d334b> b = 'none'
		return 0x822f0d09 = <global_pak_crc> 0x2ada3fb1 = <0xf8617b35>
	else
		printscriptinfo \{'UnLoadDrumKit'}
		ScriptAssert \{'Invalid Drumkit type'}
		return \{0x822f0d09 = None
			0x2ada3fb1 = None}
	endif
endscript

script unloaddrumkit \{Type = snare}
	0x7f49d207 <...>
	if NOT (<0x822f0d09> = None)
		if NOT (<0x822f0d09> = 'none')
			(<0x2ada3fb1>) 0xcd98d3f6 = 0x5d1876d5
		else
			if GotParam \{percussion}
				printf qs(0xf9aaff68) a = <Type>
			else
				printf qs(0x0fbf5224) a = <Type>
			endif
		endif
	endif
endscript

script 0x5d1876d5 
	0xe7b77a42 <...>
endscript

script 0xac3d83a2 
	LoadSound <...> Heap = 0xb5d472b2
endscript

script 0xa47d93f4 
	LoadSound <...> Heap = 0xc39f2ba1
endscript

script heavyrock_cymbal_startup 
	<0xcd98d3f6> 'HeavyRockCrash_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockCrash_Lvl_8_01'
	<0xcd98d3f6> 'HeavyRockCrash_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockRide_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockRide_Lvl_8_01'
	<0xcd98d3f6> 'HeavyRockRide_Lvl_6_01'
endscript

script heavyrock_floortom_startup 
	<0xcd98d3f6> 'HeavyRockFlTom_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockFlTom_Lvl_8_01'
	<0xcd98d3f6> 'HeavyRockFlTom_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockFlTom_Lvl_4_01'
endscript

script heavyrock_hihat_startup 
	<0xcd98d3f6> 'HeavyRockHHClosed_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockHHClosed_Lvl_8_01'
	<0xcd98d3f6> 'HeavyRockHHClosed_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockHHClosed_Lvl_6_02'
	<0xcd98d3f6> 'HeavyRockHHClosed_Lvl_4_01'
	<0xcd98d3f6> 'HeavyRockHHClosed_Lvl_4_02'
	<0xcd98d3f6> 'HeavyRockHHOpen_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockHHOpen_Lvl_9_01'
	<0xcd98d3f6> 'HeavyRockHHOpen_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockHHOpen_Lvl_6_02'
	<0xcd98d3f6> 'HeavyRockHHOpen_Lvl_2_01'
endscript

script heavyrock_hitom_startup 
	<0xcd98d3f6> 'HeavyRockHiTom_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockHiTom_Lvl_8_01'
	<0xcd98d3f6> 'HeavyRockHiTom_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockHiTom_Lvl_4_01'
endscript

script heavyrock_kick_startup 
	<0xcd98d3f6> 'HeavyRockKick_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockKick_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockKick_Lvl_2_01'
endscript

script heavyrock_snare_startup 
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_12_01'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_12_02'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_12_03'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_10_01'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_8_01'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_6_01'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_4_01'
	<0xcd98d3f6> 'HeavyRockSnare_Lvl_2_01'
endscript

script classicrock_cymbal_startup 
	<0xcd98d3f6> 'classicRockCrash_Lvl_10_01'
	<0xcd98d3f6> 'classicRockCrash_Lvl_8_01'
	<0xcd98d3f6> 'classicRockCrash_Lvl_6_01'
	<0xcd98d3f6> 'classicRockRide_Lvl_10_01'
	<0xcd98d3f6> 'classicRockRide_Lvl_8_01'
	<0xcd98d3f6> 'classicRockRide_Lvl_6_01'
endscript

script classicrock_floortom_startup 
	<0xcd98d3f6> 'classicRockFlTom_Lvl_10_01'
	<0xcd98d3f6> 'classicRockFlTom_Lvl_8_01'
	<0xcd98d3f6> 'classicRockFlTom_Lvl_6_01'
	<0xcd98d3f6> 'classicRockFlTom_Lvl_4_01'
endscript

script classicrock_hihat_startup 
	<0xcd98d3f6> 'classicRockHHClosed_Lvl_10_01'
	<0xcd98d3f6> 'classicRockHHClosed_Lvl_8_01'
	<0xcd98d3f6> 'classicRockHHClosed_Lvl_6_01'
	<0xcd98d3f6> 'classicRockHHClosed_Lvl_4_01'
	<0xcd98d3f6> 'classicRockHHOpen_Lvl_10_01'
	<0xcd98d3f6> 'classicRockHHOpen_Lvl_9_01'
	<0xcd98d3f6> 'classicRockHHOpen_Lvl_6_01'
	<0xcd98d3f6> 'classicRockHHOpen_Lvl_2_01'
endscript

script classicrock_hitom_startup 
	<0xcd98d3f6> 'classicRockHiTom_Lvl_10_01'
	<0xcd98d3f6> 'classicRockHiTom_Lvl_8_01'
	<0xcd98d3f6> 'classicRockHiTom_Lvl_6_01'
	<0xcd98d3f6> 'classicRockHiTom_Lvl_4_01'
endscript

script classicrock_kick_startup 
	<0xcd98d3f6> 'classicRockKick_Lvl_10_01'
	<0xcd98d3f6> 'classicRockKick_Lvl_6_01'
	<0xcd98d3f6> 'classicRockKick_Lvl_2_01'
endscript

script classicrock_snare_startup 
	<0xcd98d3f6> 'classicRockSnare_Lvl_12_01'
	<0xcd98d3f6> 'classicRockSnare_Lvl_12_02'
	<0xcd98d3f6> 'classicRockSnare_Lvl_12_03'
	<0xcd98d3f6> 'classicRockSnare_Lvl_10_01'
	<0xcd98d3f6> 'classicRockSnare_Lvl_8_01'
	<0xcd98d3f6> 'classicRockSnare_Lvl_6_01'
	<0xcd98d3f6> 'classicRockSnare_Lvl_4_01'
	<0xcd98d3f6> 'classicRockSnare_Lvl_2_01'
endscript

script fusion_cymbal_startup 
	<0xcd98d3f6> 'FusionCrash_Lvl_10_01'
	<0xcd98d3f6> 'FusionCrash_Lvl_8_01'
	<0xcd98d3f6> 'FusionCrash_Lvl_6_01'
	<0xcd98d3f6> 'FusionRide_Lvl_10_01'
	<0xcd98d3f6> 'FusionRide_Lvl_8_01'
	<0xcd98d3f6> 'FusionRide_Lvl_6_01'
endscript

script fusion_floortom_startup 
	<0xcd98d3f6> 'FusionFlTom_Lvl_10_01'
	<0xcd98d3f6> 'FusionFlTom_Lvl_8_01'
	<0xcd98d3f6> 'FusionFlTom_Lvl_6_01'
	<0xcd98d3f6> 'FusionFlTom_Lvl_4_01'
endscript

script fusion_hihat_startup 
	<0xcd98d3f6> 'FusionHHClosed_Lvl_10_01'
	<0xcd98d3f6> 'FusionHHClosed_Lvl_8_01'
	<0xcd98d3f6> 'FusionHHClosed_Lvl_6_01'
	<0xcd98d3f6> 'FusionHHClosed_Lvl_4_01'
	<0xcd98d3f6> 'FusionHHOpen_Lvl_10_01'
	<0xcd98d3f6> 'FusionHHOpen_Lvl_9_01'
	<0xcd98d3f6> 'FusionHHOpen_Lvl_6_01'
	<0xcd98d3f6> 'FusionHHOpen_Lvl_2_01'
endscript

script fusion_hitom_startup 
	<0xcd98d3f6> 'FusionHiTom_Lvl_10_01'
	<0xcd98d3f6> 'FusionHiTom_Lvl_8_01'
	<0xcd98d3f6> 'FusionHiTom_Lvl_6_01'
	<0xcd98d3f6> 'FusionHiTom_Lvl_4_01'
endscript

script fusion_kick_startup 
	<0xcd98d3f6> 'FusionKick_Lvl_10_01'
	<0xcd98d3f6> 'FusionKick_Lvl_6_01'
	<0xcd98d3f6> 'FusionKick_Lvl_2_01'
endscript

script fusion_snare_startup 
	<0xcd98d3f6> 'FusionSnare_Lvl_12_01'
	<0xcd98d3f6> 'FusionSnare_Lvl_12_02'
	<0xcd98d3f6> 'FusionSnare_Lvl_12_03'
	<0xcd98d3f6> 'FusionSnare_Lvl_10_01'
	<0xcd98d3f6> 'FusionSnare_Lvl_8_01'
	<0xcd98d3f6> 'FusionSnare_Lvl_6_01'
	<0xcd98d3f6> 'FusionSnare_Lvl_4_01'
	<0xcd98d3f6> 'FusionSnare_Lvl_2_01'
endscript

script hiphop_cymbal_startup 
	<0xcd98d3f6> 'HipHopCrash_Lvl_10_01'
endscript

script hiphop_floortom_startup 
	<0xcd98d3f6> 'HipHopFlTom_Lvl_10_01'
endscript

script hiphop_hihat_startup 
	<0xcd98d3f6> 'HipHopHHOpen_Lvl_10_01'
endscript

script hiphop_hitom_startup 
	<0xcd98d3f6> 'HipHopHiTom_Lvl_10_01'
endscript

script hiphop_kick_startup 
	<0xcd98d3f6> 'HipHopKick_Lvl_10_01'
endscript

script hiphop_snare_startup 
	<0xcd98d3f6> 'HipHopSnare_Lvl_10_01'
endscript

script modernrock_cymbal_startup 
	<0xcd98d3f6> 'modernrockCrash_Lvl_10_01'
	<0xcd98d3f6> 'modernrockCrash_Lvl_8_01'
	<0xcd98d3f6> 'modernrockCrash_Lvl_6_01'
	<0xcd98d3f6> 'modernrockCrash_Lvl_4_01'
	<0xcd98d3f6> 'modernrockRide_Lvl_10_01'
	<0xcd98d3f6> 'modernrockRide_Lvl_8_01'
	<0xcd98d3f6> 'modernrockRide_Lvl_6_01'
	<0xcd98d3f6> 'modernrockRide_Lvl_4_01'
endscript

script modernrock_floortom_startup 
	<0xcd98d3f6> 'modernrockFlTom_Lvl_10_01'
	<0xcd98d3f6> 'modernrockFlTom_Lvl_8_01'
	<0xcd98d3f6> 'modernrockFlTom_Lvl_6_01'
	<0xcd98d3f6> 'modernrockFlTom_Lvl_4_01'
endscript

script modernrock_hihat_startup 
	<0xcd98d3f6> 'modernrockHHClosed_Lvl_10_01'
	<0xcd98d3f6> 'modernrockHHClosed_Lvl_9_01'
	<0xcd98d3f6> 'modernrockHHClosed_Lvl_8_01'
	<0xcd98d3f6> 'modernrockHHClosed_Lvl_6_01'
	<0xcd98d3f6> 'modernrockHHClosed_Lvl_4_01'
	<0xcd98d3f6> 'modernrockHHClosed_Lvl_2_01'
	<0xcd98d3f6> 'modernrockHHOpen_Lvl_10_01'
	<0xcd98d3f6> 'modernrockHHOpen_Lvl_9_01'
	<0xcd98d3f6> 'modernrockHHOpen_Lvl_8_01'
	<0xcd98d3f6> 'modernrockHHOpen_Lvl_6_01'
	<0xcd98d3f6> 'modernrockHHOpen_Lvl_4_01'
	<0xcd98d3f6> 'modernrockHHOpen_Lvl_2_01'
endscript

script modernrock_hitom_startup 
	<0xcd98d3f6> 'modernrockHiTom_Lvl_10_01'
	<0xcd98d3f6> 'modernrockHiTom_Lvl_8_01'
	<0xcd98d3f6> 'modernrockHiTom_Lvl_6_01'
	<0xcd98d3f6> 'modernrockHiTom_Lvl_4_01'
endscript

script modernrock_kick_startup 
	<0xcd98d3f6> 'modernrockKick_Lvl_10_01'
	<0xcd98d3f6> 'modernrockKick_Lvl_6_01'
	<0xcd98d3f6> 'modernrockKick_Lvl_2_01'
endscript

script modernrock_snare_startup 
	<0xcd98d3f6> 'modernrockSnare_Lvl_12_01'
	<0xcd98d3f6> 'modernrockSnare_Lvl_12_02'
	<0xcd98d3f6> 'modernrockSnare_Lvl_12_03'
	<0xcd98d3f6> 'modernrockSnare_Lvl_10_01'
	<0xcd98d3f6> 'modernrockSnare_Lvl_8_01'
	<0xcd98d3f6> 'modernrockSnare_Lvl_6_01'
	<0xcd98d3f6> 'modernrockSnare_Lvl_4_01'
	<0xcd98d3f6> 'modernrockSnare_Lvl_2_01'
endscript

script rockpercussion_cymbal_startup 
	<0xcd98d3f6> 'RockPercussion_Gong_Lvl_10_01'
	<0xcd98d3f6> 'RockPercussion_Gong_Lvl_6_01'
endscript

script rockpercussion_floortom_startup 
	<0xcd98d3f6> 'RockPercussion_RotoTomMed_Lvl_10_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomMed_Lvl_8_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomMed_Lvl_6_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomMed_Lvl_4_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomMed_Lvl_2_01'
endscript

script rockpercussion_hihat_startup 
	<0xcd98d3f6> 'RockPercussion_Tambourine_Lvl_12_01'
	<0xcd98d3f6> 'RockPercussion_Tambourine_Lvl_12_02'
	<0xcd98d3f6> 'RockPercussion_Tambourine_Lvl_12_03'
	<0xcd98d3f6> 'RockPercussion_Tambourine_Lvl_10_01'
	<0xcd98d3f6> 'RockPercussion_Tambourine_Lvl_10_02'
	<0xcd98d3f6> 'RockPercussion_Tambourine_Lvl_10_03'
endscript

script rockpercussion_hitom_startup 
	<0xcd98d3f6> 'RockPercussion_RotoTomHi_Lvl_10_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomHi_Lvl_8_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomHi_Lvl_6_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomHi_Lvl_4_01'
	<0xcd98d3f6> 'RockPercussion_RotoTomHi_Lvl_2_01'
endscript

script rockpercussion_kick_startup 
	<0xcd98d3f6> 'RockPercussion_ConcertBassDrum_Lvl_10_01'
	<0xcd98d3f6> 'RockPercussion_ConcertBassDrum_Lvl_8_01'
	<0xcd98d3f6> 'RockPercussion_ConcertBassDrum_Lvl_6_01'
	<0xcd98d3f6> 'RockPercussion_ConcertBassDrum_Lvl_4_01'
endscript

script rockpercussion_snare_startup 
	<0xcd98d3f6> 'RockPercussion_HandClap_Lvl_10_01'
	<0xcd98d3f6> 'RockPercussion_HandClap_Lvl_10_02'
	<0xcd98d3f6> 'RockPercussion_HandClap_Lvl_10_03'
	<0xcd98d3f6> 'RockPercussion_HandClap_Lvl_10_04'
	<0xcd98d3f6> 'RockPercussion_HandClap_Lvl_10_05'
endscript

script latinpercussion_cymbal_startup 
	<0xcd98d3f6> 'LatinPercussion_Clave_Lvl_10_01'
	<0xcd98d3f6> 'LatinPercussion_Clave_Lvl_10_02'
	<0xcd98d3f6> 'LatinPercussion_Clave_Lvl_10_03'
	<0xcd98d3f6> 'LatinPercussion_Clave_Lvl_10_04'
endscript

script latinpercussion_floortom_startup 
	<0xcd98d3f6> 'LatinPercussion_LowTimbale_Lvl_10_01'
	<0xcd98d3f6> 'LatinPercussion_LowTimbale_Lvl_10_02'
	<0xcd98d3f6> 'LatinPercussion_LowTimbale_Lvl_8_01'
	<0xcd98d3f6> 'LatinPercussion_LowTimbale_Lvl_6_01'
	<0xcd98d3f6> 'LatinPercussion_LowTimbale_Lvl_4_01'
	<0xcd98d3f6> 'LatinPercussion_LowTimbale_Lvl_2_01'
endscript

script latinpercussion_hihat_startup 
	<0xcd98d3f6> 'LatinPercussion_Maraca_Lvl_10_01'
	<0xcd98d3f6> 'LatinPercussion_Maraca_Lvl_10_02'
	<0xcd98d3f6> 'LatinPercussion_Maraca_Lvl_10_03'
endscript

script latinpercussion_hitom_startup 
	<0xcd98d3f6> 'LatinPercussion_HighTimbale_Lvl_10_01'
	<0xcd98d3f6> 'LatinPercussion_HighTimbale_Lvl_10_02'
	<0xcd98d3f6> 'LatinPercussion_HighTimbale_Lvl_8_01'
	<0xcd98d3f6> 'LatinPercussion_HighTimbale_Lvl_6_01'
	<0xcd98d3f6> 'LatinPercussion_HighTimbale_Lvl_4_01'
	<0xcd98d3f6> 'LatinPercussion_HighTimbale_Lvl_2_01'
endscript

script latinpercussion_kick_startup 
	<0xcd98d3f6> 'LatinPercussion_BoxDrum_Lvl_10_01'
	<0xcd98d3f6> 'LatinPercussion_BoxDrum_Lvl_8_01'
	<0xcd98d3f6> 'LatinPercussion_BoxDrum_Lvl_6_01'
	<0xcd98d3f6> 'LatinPercussion_BoxDrum_Lvl_4_01'
	<0xcd98d3f6> 'LatinPercussion_BoxDrum_Lvl_2_01'
endscript

script latinpercussion_snare_startup 
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_12_01'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_12_02'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_12_03'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_10_01'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_8_01'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_7_01'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_5_01'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_4_01'
	<0xcd98d3f6> 'LatinPercussion_Conga_Lvl_2_01'
endscript

script brazilianpercussion_cymbal_startup 
	<0xcd98d3f6> 'BrazilianPercussion_WhistleHi_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_WhistleHi_Lvl_10_02'
	<0xcd98d3f6> 'BrazilianPercussion_WhistleHi_Lvl_10_03'
	<0xcd98d3f6> 'BrazilianPercussion_WhistleLow_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_WhistleLow_Lvl_10_02'
	<0xcd98d3f6> 'BrazilianPercussion_WhistleLow_Lvl_10_03'
endscript

script brazilianpercussion_floortom_startup 
	<0xcd98d3f6> 'BrazilianPercussion_QuicaLow_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_QuicaLow_Lvl_8_01'
	<0xcd98d3f6> 'BrazilianPercussion_QuicaLow_Lvl_6_01'
endscript

script brazilianpercussion_hihat_startup 
	<0xcd98d3f6> 'BrazilianPercussion_Pandiero_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_Pandiero_Lvl_8_01'
	<0xcd98d3f6> 'BrazilianPercussion_Pandiero_Lvl_6_01'
	<0xcd98d3f6> 'BrazilianPercussion_Pandiero_Lvl_4_01'
endscript

script brazilianpercussion_hitom_startup 
	<0xcd98d3f6> 'BrazilianPercussion_QuicaHigh_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_QuicaHigh_Lvl_8_01'
	<0xcd98d3f6> 'BrazilianPercussion_QuicaHigh_Lvl_6_01'
endscript

script brazilianpercussion_kick_startup 
	<0xcd98d3f6> 'BrazilianPercussion_Surdo_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_Surdo_Lvl_8_01'
	<0xcd98d3f6> 'BrazilianPercussion_Surdo_Lvl_6_01'
endscript

script brazilianpercussion_snare_startup 
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_12_01'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_12_02'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_12_03'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_10_01'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_8_01'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_6_01'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_4_01'
	<0xcd98d3f6> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_2_01'
endscript

script hiphoppercussion_cymbal_startup 
	<0xcd98d3f6> 'HipHopPercussion_Cymbal_Lvl_10_01'
	<0xcd98d3f6> 'HipHopPercussion_Cymbal_Lvl_8_01'
	<0xcd98d3f6> 'HipHopPercussion_Cymbal_Lvl_6_01'
	<0xcd98d3f6> 'HipHopPercussion_Cymbal_Lvl_4_01'
endscript

script hiphoppercussion_floortom_startup 
	<0xcd98d3f6> 'HipHopPercussion_Scratch_Lvl_10_01'
	<0xcd98d3f6> 'HipHopPercussion_Scratch_Lvl_8_01'
	<0xcd98d3f6> 'HipHopPercussion_Scratch_Lvl_6_01'
	<0xcd98d3f6> 'HipHopPercussion_Scratch_Lvl_4_01'
	<0xcd98d3f6> 'HipHopPercussion_Scratch_Lvl_2_01'
endscript

script hiphoppercussion_hihat_startup 
	<0xcd98d3f6> 'HipHopPercussion_HiHat_Lvl_10_01'
	<0xcd98d3f6> 'HipHopPercussion_HiHat_Lvl_8_01'
	<0xcd98d3f6> 'HipHopPercussion_HiHat_Lvl_6_01'
	<0xcd98d3f6> 'HipHopPercussion_HiHat_Lvl_4_01'
	<0xcd98d3f6> 'HipHopPercussion_HiHat_Lvl_2_01'
endscript

script hiphoppercussion_hitom_startup 
	<0xcd98d3f6> 'HipHopPercussion_Vocal_Lvl_10_01'
	<0xcd98d3f6> 'HipHopPercussion_Vocal_Lvl_8_01'
	<0xcd98d3f6> 'HipHopPercussion_Vocal_Lvl_6_01'
endscript

script hiphoppercussion_kick_startup 
	<0xcd98d3f6> 'HipHopPercussion_Kick_Lvl_10_01'
	<0xcd98d3f6> 'HipHopPercussion_Kick_Lvl_8_01'
	<0xcd98d3f6> 'HipHopPercussion_Kick_Lvl_6_01'
endscript

script hiphoppercussion_snare_startup 
	<0xcd98d3f6> 'HipHopPercussion_Snare_Lvl_10_01'
	<0xcd98d3f6> 'HipHopPercussion_Snare_Lvl_8_01'
	<0xcd98d3f6> 'HipHopPercussion_Snare_Lvl_6_01'
endscript

script bliphop_cymbal_startup 
	<0xcd98d3f6> 'Bliphop_Crash'
endscript

script bliphop_floortom_startup 
	<0xcd98d3f6> 'Bliphop_Tom2'
endscript

script bliphop_hihat_startup 
	<0xcd98d3f6> 'Bliphop_Hihat_10'
endscript

script bliphop_hitom_startup 
	<0xcd98d3f6> 'Bliphop_Tom1'
endscript

script bliphop_kick_startup 
	<0xcd98d3f6> 'Bliphop_kick_10'
endscript

script bliphop_snare_startup 
	<0xcd98d3f6> 'Bliphop_snare_10'
endscript

script electro_cymbal_startup 
	<0xcd98d3f6> 'Electro_cowbell'
endscript

script electro_floortom_startup 
	<0xcd98d3f6> 'Electro_tomlow'
endscript

script electro_hihat_startup 
	<0xcd98d3f6> 'Electro_hhclose'
	<0xcd98d3f6> 'Electro_hhopen'
endscript

script electro_hitom_startup 
	<0xcd98d3f6> 'Electro_tommed'
	<0xcd98d3f6> 'Electro_tomhigh'
endscript

script electro_kick_startup 
	<0xcd98d3f6> 'Electro_kick'
endscript

script electro_snare_startup 
	<0xcd98d3f6> 'Electro_snare'
endscript

script electropercussion_cymbal_startup 
	<0xcd98d3f6> 'Elecperc_clap'
endscript

script electropercussion_floortom_startup 
	<0xcd98d3f6> 'Elecperc_conga'
endscript

script electropercussion_hihat_startup 
	<0xcd98d3f6> 'Elecperc_cabasa'
endscript

script electropercussion_hitom_startup 
	<0xcd98d3f6> 'Elecperc_conga2'
endscript

script electropercussion_kick_startup 
	<0xcd98d3f6> 'Elecperc_kick'
endscript

script electropercussion_snare_startup 
	<0xcd98d3f6> 'Elecperc_rimshot'
endscript

script oldschoolpercussion_cymbal_startup 
	<0xcd98d3f6> 'Oldschoolperc_clap'
endscript

script oldschoolpercussion_floortom_startup 
	<0xcd98d3f6> 'Oldschoolperc_timbalelow'
endscript

script oldschoolpercussion_hihat_startup 
	<0xcd98d3f6> 'Oldschoolperc_hhclose'
	<0xcd98d3f6> 'Oldschoolperc_hhopen'
endscript

script oldschoolpercussion_hitom_startup 
	<0xcd98d3f6> 'Oldschoolperc_timbalemed'
endscript

script oldschoolpercussion_kick_startup 
	<0xcd98d3f6> 'Oldschoolperc_kick'
endscript

script oldschoolpercussion_snare_startup 
	<0xcd98d3f6> 'Oldschoolperc_timbalehigh'
endscript

script computight_cymbal_startup 
	<0xcd98d3f6> 'Compukit_cowbell'
endscript

script computight_floortom_startup 
	<0xcd98d3f6> 'Compukit_woodlow'
endscript

script computight_hihat_startup 
	<0xcd98d3f6> 'Compukit_hhclose'
	<0xcd98d3f6> 'Compukit_hhopen'
endscript

script computight_hitom_startup 
	<0xcd98d3f6> 'Compukit_woodhigh'
endscript

script computight_kick_startup 
	<0xcd98d3f6> 'Compukit_kick'
endscript

script computight_snare_startup 
	<0xcd98d3f6> 'Compukit_snare'
endscript

script cheesy_cymbal_startup 
	<0xcd98d3f6> 'Cheesy_scratch2'
	<0xcd98d3f6> 'Cheesy_scratch1'
	<0xcd98d3f6> 'Cheesy_cowbell'
endscript

script cheesy_floortom_startup 
	<0xcd98d3f6> 'Cheesy_vocode1'
	<0xcd98d3f6> 'Cheesy_vocode2'
endscript

script cheesy_hihat_startup 
	<0xcd98d3f6> 'Cheesy_hhat1'
	<0xcd98d3f6> 'Cheesy_hhat2'
endscript

script cheesy_hitom_startup 
	<0xcd98d3f6> 'Cheesy_brass'
	<0xcd98d3f6> 'Cheesy_orch'
endscript

script cheesy_kick_startup 
	<0xcd98d3f6> 'Cheesy_kick'
endscript

script cheesy_snare_startup 
	<0xcd98d3f6> 'Cheesy_snare'
endscript

script eightys_cymbal_startup 
	<0xcd98d3f6> 'Eightys_crash3'
	<0xcd98d3f6> 'Eightys_crash2'
	<0xcd98d3f6> 'Eightys_crash1'
endscript

script eightys_floortom_startup 
	<0xcd98d3f6> 'Eightys_tomlow'
endscript

script eightys_hihat_startup 
	<0xcd98d3f6> 'Eightys_hhclosed'
	<0xcd98d3f6> 'Eightys_hhopen'
endscript

script eightys_hitom_startup 
	<0xcd98d3f6> 'Eightys_tomhigh'
	<0xcd98d3f6> 'Eightys_tommed'
endscript

script eightys_kick_startup 
	<0xcd98d3f6> 'Eightys_kick'
endscript

script eightys_snare_startup 
	<0xcd98d3f6> 'Eightys_snare1'
	<0xcd98d3f6> 'Eightys_snare2'
endscript

script oldschool_cymbal_startup 
	<0xcd98d3f6> 'Oldschool_crash'
	<0xcd98d3f6> 'Oldschool_ride'
endscript

script oldschool_floortom_startup 
	<0xcd98d3f6> 'Oldschool_tomlow'
endscript

script oldschool_hihat_startup 
	<0xcd98d3f6> 'Oldschool_hhclose'
	<0xcd98d3f6> 'Oldschool_hhopen'
endscript

script oldschool_hitom_startup 
	<0xcd98d3f6> 'Oldschool_tomhi'
	<0xcd98d3f6> 'Oldschool_tommed'
endscript

script oldschool_kick_startup 
	<0xcd98d3f6> 'Oldschool_kick1'
	<0xcd98d3f6> 'Oldschool_kick2'
endscript

script oldschool_snare_startup 
	<0xcd98d3f6> 'Oldschool_snare1'
	<0xcd98d3f6> 'Oldschool_snare2'
	<0xcd98d3f6> 'Oldschool_snare3'
endscript

script house_cymbal_startup 
	<0xcd98d3f6> 'House_crash'
	<0xcd98d3f6> 'House_ride'
endscript

script house_floortom_startup 
	<0xcd98d3f6> 'House_tomlow'
endscript

script house_hihat_startup 
	<0xcd98d3f6> 'House_hhclose'
	<0xcd98d3f6> 'House_hhopen'
endscript

script house_hitom_startup 
	<0xcd98d3f6> 'House_tomhigh'
	<0xcd98d3f6> 'House_tommed'
endscript

script house_kick_startup 
	<0xcd98d3f6> 'House_kick1'
	<0xcd98d3f6> 'House_kick2'
	<0xcd98d3f6> 'House_kick3'
endscript

script house_snare_startup 
	<0xcd98d3f6> 'House_snare1'
	<0xcd98d3f6> 'House_snare2'
	<0xcd98d3f6> 'House_clap'
endscript

script india_kick_startup 
	<0xcd98d3f6> 'india_kick'
endscript

script india_hitom_startup 
	<0xcd98d3f6> 'india_tom1'
endscript

script india_cymbal_startup 
	<0xcd98d3f6> 'india_crash'
endscript

script india_hihat_startup 
	<0xcd98d3f6> 'india_ping'
endscript

script india_snare_startup 
	<0xcd98d3f6> 'india_snare'
endscript

script india_floortom_startup 
	<0xcd98d3f6> 'india_tom2'
endscript

script indiagirl_kick_startup 
	<0xcd98d3f6> 'India_girlkick'
endscript

script indiagirl_hitom_startup 
	<0xcd98d3f6> 'India_girl4'
endscript

script indiagirl_cymbal_startup 
	<0xcd98d3f6> 'India_girl_longer2'
endscript

script indiagirl_hihat_startup 
	<0xcd98d3f6> 'India_girl2'
	<0xcd98d3f6> 'India_girl_longer'
endscript

script indiagirl_snare_startup 
	<0xcd98d3f6> 'India_girl1'
endscript

script indiagirl_floortom_startup 
	<0xcd98d3f6> 'India_girl3'
endscript

script orchestral_kick_startup 
	<0xcd98d3f6> 'orch_kick'
endscript

script orchestral_hitom_startup 
	<0xcd98d3f6> 'orch_tom1'
endscript

script orchestral_cymbal_startup 
	<0xcd98d3f6> 'orch_crash'
endscript

script orchestral_hihat_startup 
	<0xcd98d3f6> 'orch_hihat'
endscript

script orchestral_snare_startup 
	<0xcd98d3f6> 'orch_snare'
endscript

script orchestral_floortom_startup 
	<0xcd98d3f6> 'orch_tom2'
endscript

script jazzy_kick_startup 
	<0xcd98d3f6> 'j_kick'
endscript

script jazzy_hitom_startup 
	<0xcd98d3f6> 'j_tom1'
endscript

script jazzy_cymbal_startup 
	<0xcd98d3f6> 'j_crash'
endscript

script jazzy_hihat_startup 
	<0xcd98d3f6> 'j_hihat'
endscript

script jazzy_snare_startup 
	<0xcd98d3f6> 'j_snare'
endscript

script jazzy_floortom_startup 
	<0xcd98d3f6> 'j_tom2'
endscript

script scratch_floortom_startup 
	<0xcd98d3f6> 'DJ_aahh1'
	<0xcd98d3f6> 'DJ_aahh7'
	<0xcd98d3f6> 'DJ_Laser10'
	<0xcd98d3f6> 'DJ_ugh14'
	<0xcd98d3f6> 'DJ_blast18'
endscript

script scratch_snare_startup 
	<0xcd98d3f6> 'DJ_aahh2'
	<0xcd98d3f6> 'DJ_aahh8'
	<0xcd98d3f6> 'DJ_Laser11'
	<0xcd98d3f6> 'DJ_ugh15'
	<0xcd98d3f6> 'DJ_blast19'
endscript

script scratch_hihat_startup 
	<0xcd98d3f6> 'DJ_aahh3'
	<0xcd98d3f6> 'DJ_aahh9'
	<0xcd98d3f6> 'DJ_stab12'
	<0xcd98d3f6> 'DJ_ugh16'
	<0xcd98d3f6> 'DJ_ahhya20'
endscript

script scratch_hitom_startup 
	<0xcd98d3f6> 'DJ_aahh4'
	<0xcd98d3f6> 'DJ_whew26'
	<0xcd98d3f6> 'DJ_stab13'
	<0xcd98d3f6> 'DJ_ugh17'
	<0xcd98d3f6> 'DJ_ahhya21'
endscript

script scratch_cymbal_startup 
	<0xcd98d3f6> 'DJ_aahh5'
	<0xcd98d3f6> 'DJ_aahh6'
	<0xcd98d3f6> 'DJ_shortbaby23'
	<0xcd98d3f6> 'DJ_ugh26'
	<0xcd98d3f6> 'DJ_whistle28'
endscript

script scratch_kick_startup 
	<0xcd98d3f6> 'DJ_aahhfull31'
	<0xcd98d3f6> 'DJ_rewind29'
	<0xcd98d3f6> 'DJ_backspin22'
	<0xcd98d3f6> 'DJ_fastrewind24'
	<0xcd98d3f6> 'DJ_backforth25'
endscript

script robot_kick_startup 
	<0xcd98d3f6> 'robot_zero'
	<0xcd98d3f6> 'robot_one'
	<0xcd98d3f6> 'robot_two'
	<0xcd98d3f6> 'robot_three'
	<0xcd98d3f6> 'robot_rock'
endscript

script robot_floortom_startup 
	<0xcd98d3f6> 'robot_technology'
	<0xcd98d3f6> 'robot_beat'
	<0xcd98d3f6> 'robot_harder'
	<0xcd98d3f6> 'robot_baby'
	<0xcd98d3f6> 'robot_bionic'
endscript

script robot_cymbal_startup 
	<0xcd98d3f6> 'robot_energize'
	<0xcd98d3f6> 'robot_jam'
	<0xcd98d3f6> 'robot_on'
	<0xcd98d3f6> 'robot_it'
	<0xcd98d3f6> 'robot_future'
endscript

script robot_hihat_startup 
	<0xcd98d3f6> 'robot_electro'
	<0xcd98d3f6> 'robot_fire'
	<0xcd98d3f6> 'robot_faster'
	<0xcd98d3f6> 'robot_floor'
	<0xcd98d3f6> 'robot_freak'
endscript

script robot_snare_startup 
	<0xcd98d3f6> 'robot_boy'
	<0xcd98d3f6> 'robot_compute'
	<0xcd98d3f6> 'robot_better'
	<0xcd98d3f6> 'robot_drop'
	<0xcd98d3f6> 'robot_electricity'
endscript

script robot_hitom_startup 
	<0xcd98d3f6> 'robot_fresh'
	<0xcd98d3f6> 'robot_funky'
	<0xcd98d3f6> 'robot_stronger'
	<0xcd98d3f6> 'robot_get'
	<0xcd98d3f6> 'robot_girl'
endscript

script scratch_electro_kick_startup 
	<0xcd98d3f6> 'scratch_electro_kick'
endscript

script scratch_electro_hitom_startup 
	<0xcd98d3f6> 'scratch_electro_tom1'
endscript

script scratch_electro_cymbal_startup 
	<0xcd98d3f6> 'scratch_electro_crash'
endscript

script scratch_electro_hihat_startup 
	<0xcd98d3f6> 'scratch_electro_hihat'
endscript

script scratch_electro_snare_startup 
	<0xcd98d3f6> 'scratch_electro_snare'
endscript

script scratch_electro_floortom_startup 
	<0xcd98d3f6> 'scratch_electro_tom2'
endscript

script dub_kick_startup 
	<0xcd98d3f6> 'dub_kick'
endscript

script dub_hitom_startup 
	<0xcd98d3f6> 'dub_tom1'
endscript

script dub_cymbal_startup 
	<0xcd98d3f6> 'dub_cymbal'
endscript

script dub_hihat_startup 
	<0xcd98d3f6> 'dub_hihat'
endscript

script dub_snare_startup 
	<0xcd98d3f6> 'dub_snare'
endscript

script dub_floortom_startup 
	<0xcd98d3f6> 'dub_tom2'
endscript

script pigmy_kick_startup 
	<0xcd98d3f6> 'pigmy_kick'
endscript

script pigmy_hitom_startup 
	<0xcd98d3f6> 'pigmy_tom1'
endscript

script pigmy_cymbal_startup 
	<0xcd98d3f6> 'pigmy_cymbal'
endscript

script pigmy_hihat_startup 
	<0xcd98d3f6> 'pigmy_hihat'
endscript

script pigmy_snare_startup 
	<0xcd98d3f6> 'pigmy_snare'
endscript

script pigmy_floortom_startup 
	<0xcd98d3f6> 'pigmy_tom2'
endscript

script conga_kick_startup 
	<0xcd98d3f6> 'conga_kick'
endscript

script conga_hitom_startup 
	<0xcd98d3f6> 'conga_tom1'
endscript

script conga_cymbal_startup 
	<0xcd98d3f6> 'conga_cymbal'
	<0xcd98d3f6> 'conga_crash'
endscript

script conga_hihat_startup 
	<0xcd98d3f6> 'conga_hihat'
endscript

script conga_snare_startup 
	<0xcd98d3f6> 'conga_snare'
endscript

script conga_floortom_startup 
	<0xcd98d3f6> 'conga_tom2'
endscript

script gunshot_cymbal_startup 
	<0xcd98d3f6> 'Gun_ricocrash'
	<0xcd98d3f6> 'Gun_ricochet'
endscript

script gunshot_floortom_startup 
	<0xcd98d3f6> 'Gun_tom2'
endscript

script gunshot_hihat_startup 
	<0xcd98d3f6> 'Gun_hihat'
	<0xcd98d3f6> 'Gun_hihat_open'
endscript

script gunshot_hitom_startup 
	<0xcd98d3f6> 'Gun_tom1'
endscript

script gunshot_kick_startup 
	<0xcd98d3f6> 'Gun_kickheavy'
	<0xcd98d3f6> 'Gun_kickheavy2'
endscript

script gunshot_snare_startup 
	<0xcd98d3f6> 'Gun_robosnare'
	<0xcd98d3f6> 'Gun_heavysnare'
	<0xcd98d3f6> 'Gun_snare'
endscript

script play_all_drum_samples 
	waitTime = 0.3
	velocity = 7
	pad = snare
	printf channel = sfx qs(0xc7e8d4d3) s = <drumset>
	printf channel = sfx qs(0x674e9fff) s = <pad_type>
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		if (<pad> = snare)
			<pad> = kick
			velocity = 7
		elseif (<pad> = kick)
			<pad> = tom1
			velocity = 7
		elseif (<pad> = tom1)
			<pad> = tom2
			velocity = 7
		elseif (<pad> = tom2)
			<pad> = hihat
			velocity = 7
		elseif (<pad> = hihat)
			<pad> = cymbal
			velocity = 7
		elseif (<pad> = cymbal)
			break
		endif
	endif
	repeat
endscript

script play_kick_samples 
	waitTime = 0.3
	velocity = 7
	pad = kick
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_snare_samples 
	waitTime = 0.3
	velocity = 7
	pad = snare
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_hitom_samples 
	waitTime = 0.3
	velocity = 7
	pad = tom1
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_fltom_samples 
	waitTime = 0.3
	velocity = 7
	pad = tom2
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_hihat_samples 
	waitTime = 0.3
	velocity = 7
	pad = hihat
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_cymbal_samples 
	waitTime = 0.3
	velocity = 7
	pad = cymbal
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

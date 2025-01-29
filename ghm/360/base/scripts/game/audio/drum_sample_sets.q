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
		id = blackalbum
		string_id = 'blackalbum'
		name_text = qs(0x38aba396)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = andjusticeforall
		string_id = 'andjusticeforall'
		name_text = qs(0x9582c7bb)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = garageinc
		string_id = 'garageinc'
		name_text = qs(0x2b13cf75)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = load
		string_id = 'load'
		name_text = qs(0x3c469ddb)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = masterofpuppets
		string_id = 'masterofpuppets'
		name_text = qs(0xaa2a4580)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = noleafclover
		string_id = 'noleafclover'
		name_text = qs(0x5d547e22)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = reload
		string_id = 'reload'
		name_text = qs(0x0c10f4c3)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = ridethelightning
		string_id = 'ridethelightning'
		name_text = qs(0xd3d6d24f)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = stanger
		string_id = 'stanger'
		name_text = qs(0x5550e98f)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = deathmagnetic
		string_id = 'deathmagnetic'
		name_text = qs(0x8438fc89)
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = killemall
		string_id = 'killemall'
		name_text = qs(0x48400fda)
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
last_drum_kit_loaded = None

script loaddrumkitall \{drum_kit = 'heavyrock'
		async = 1
		reset_percussion = 1}
	if (<reset_percussion> = 1)
		Change \{is_percussion_kit = 0}
	endif
	formatText checksumName = csum '%s' s = <drum_kit>
	if (<csum> = $last_drum_kit_loaded)
		printf 'LoadDrumKitAll - %s already loaded' s = <drum_kit>
		return
	endif
	unloaddrumkitall
	loaddrumkit Type = cymbal drum_kit = <drum_kit> async = <async>
	loaddrumkit Type = floortom drum_kit = <drum_kit> async = <async>
	loaddrumkit Type = hihat drum_kit = <drum_kit> async = <async>
	loaddrumkit Type = hitom drum_kit = <drum_kit> async = <async>
	loaddrumkit Type = kick drum_kit = <drum_kit> async = <async>
	loaddrumkit Type = snare drum_kit = <drum_kit> async = <async>
	if GotParam \{percussion_kit}
		loaddrumkit Type = cymbal drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit Type = floortom drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit Type = hihat drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit Type = hitom drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit Type = kick drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit Type = snare drum_kit = <percussion_kit> async = <async> percussion
	endif
	Change last_drum_kit_loaded = <csum>
endscript

script loaddrumkit \{Type = snare
		drum_kit = 'heavyrock'
		async = 1}
	if StructureContains structure = $drumkitparts <Type>
		if GotParam \{percussion}
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<Type>)
		else
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<Type>)
		endif
		if NOT ($<global_pak_crc> = 'none')
			unloaddrumkit Type = <Type>
		endif
		formatText TextName = drumkit_pakname 'pak/drumkits/%s_%t.pak' s = <drum_kit> t = ($drumkitparts.<Type>)
		if NOT LoadPakAsync pak_name = <drumkit_pakname> Heap = heap_drumkitaudio async = <async>
			DownloadContentLost
			return
		endif
		Change GlobalName = <global_pak_crc> NewValue = <drumkit_pakname>
	else
		printscriptinfo \{qs(0x6d0085b6)}
		ScriptAssert \{qs(0x0d594f4d)}
	endif
endscript

script unloaddrumkitall 
	Change \{last_drum_kit_loaded = None}
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
endscript

script unloaddrumkit \{Type = snare}
	if StructureContains structure = $drumkitparts <Type>
		if GotParam \{percussion}
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<Type>)
		else
			formatText checksumName = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<Type>)
		endif
		if NOT ($<global_pak_crc> = 'none')
			UnLoadPak ($<global_pak_crc>)
			Change GlobalName = <global_pak_crc> NewValue = 'none'
		endif
	else
		printscriptinfo \{qs(0x73feec57)}
		ScriptAssert \{qs(0x0d594f4d)}
	endif
endscript

script blackalbum_cymbal_startup 
	LoadSound \{'Drums/BlackAlbum/Black_Crash1'}
	LoadSound \{'Drums/BlackAlbum/Black_Crash2'}
	LoadSound \{'Drums/BlackAlbum/Black_Crash3'}
	LoadSound \{'Drums/BlackAlbum/Black_Crash4'}
	LoadSound \{'Drums/BlackAlbum/Black_Crash5'}
endscript

script blackalbum_floortom_startup 
	LoadSound \{'drums/BlackAlbum/Black_FlTom1'}
	LoadSound \{'drums/BlackAlbum/Black_FlTom3'}
	LoadSound \{'drums/BlackAlbum/Black_FlTom4'}
endscript

script blackalbum_hihat_startup 
	LoadSound \{'drums/BlackAlbum/Black_HiHat5'}
	LoadSound \{'drums/BlackAlbum/Black_HiHat6'}
	LoadSound \{'drums/BlackAlbum/Black_HiHat7'}
endscript

script blackalbum_hitom_startup 
	LoadSound \{'drums/BlackAlbum/Black_Tom1'}
	LoadSound \{'drums/BlackAlbum/Black_Tom2'}
endscript

script blackalbum_kick_startup 
	LoadSound \{'drums/BlackAlbum/Black_Kick1'}
	LoadSound \{'drums/BlackAlbum/Black_Kick2'}
	LoadSound \{'drums/BlackAlbum/Black_Kick3'}
	LoadSound \{'drums/BlackAlbum/Black_Kick4'}
endscript

script blackalbum_snare_startup 
	LoadSound \{'drums/BlackAlbum/Black_Snare1'}
	LoadSound \{'drums/BlackAlbum/Black_Snare2'}
	LoadSound \{'drums/BlackAlbum/Black_Snare3'}
endscript

script killemall_cymbal_startup 
	LoadSound \{'Drums/killemall/kill_Crash1'}
	LoadSound \{'Drums/killemall/kill_Crash2'}
endscript

script killemall_floortom_startup 
	LoadSound \{'drums/killemall/kill_FlTom1'}
endscript

script killemall_hihat_startup 
	LoadSound \{'drums/killemall/kill_HiHat5'}
	LoadSound \{'drums/killemall/kill_HiHat6'}
	LoadSound \{'drums/killemall/kill_HiHat7'}
endscript

script killemall_hitom_startup 
	LoadSound \{'drums/killemall/kill_Tom1'}
endscript

script killemall_kick_startup 
	LoadSound \{'drums/killemall/kill_Kick1'}
	LoadSound \{'drums/killemall/kill_Kick2'}
	LoadSound \{'drums/killemall/kill_Kick3'}
endscript

script killemall_snare_startup 
	LoadSound \{'drums/killemall/kill_Snare1'}
	LoadSound \{'drums/killemall/kill_Snare2'}
	LoadSound \{'drums/killemall/kill_Snare3'}
endscript

script ridethelightning_cymbal_startup 
	LoadSound \{'Drums/ridethelightning/ride_Crash1'}
endscript

script ridethelightning_floortom_startup 
	LoadSound \{'drums/ridethelightning/ride_FlTom1'}
endscript

script ridethelightning_hihat_startup 
	LoadSound \{'drums/ridethelightning/ride_HiHat1'}
	LoadSound \{'drums/ridethelightning/ride_HiHat2'}
	LoadSound \{'drums/ridethelightning/ride_HiHat4'}
endscript

script ridethelightning_hitom_startup 
	LoadSound \{'drums/ridethelightning/ride_Tom1'}
endscript

script ridethelightning_kick_startup 
	LoadSound \{'drums/ridethelightning/ride_Kick1'}
	LoadSound \{'drums/ridethelightning/ride_Kick2'}
	LoadSound \{'drums/ridethelightning/ride_Kick3'}
endscript

script ridethelightning_snare_startup 
	LoadSound \{'drums/ridethelightning/ride_Snare1'}
	LoadSound \{'drums/ridethelightning/ride_Snare2'}
	LoadSound \{'drums/ridethelightning/ride_Snare3'}
	LoadSound \{'drums/ridethelightning/ride_Snare4'}
endscript

script stanger_cymbal_startup 
	LoadSound \{'Drums/stanger/stanger_Crash7'}
	LoadSound \{'Drums/stanger/stanger_Crash9'}
endscript

script stanger_floortom_startup 
	LoadSound \{'drums/stanger/stanger_FlTom1'}
	LoadSound \{'drums/stanger/stanger_FlTom2'}
endscript

script stanger_hihat_startup 
	LoadSound \{'drums/stanger/stanger_HiHat1'}
	LoadSound \{'drums/stanger/stanger_HiHat2'}
	LoadSound \{'drums/stanger/stanger_HiHat3'}
	LoadSound \{'drums/stanger/stanger_HiHat4'}
	LoadSound \{'drums/stanger/stanger_HiHat5'}
endscript

script stanger_hitom_startup 
	LoadSound \{'drums/stanger/stanger_Tom1'}
	LoadSound \{'drums/stanger/stanger_Tom2'}
endscript

script stanger_kick_startup 
	LoadSound \{'drums/stanger/stanger_Kick1'}
endscript

script stanger_snare_startup 
	LoadSound \{'drums/stanger/stanger_Snare1'}
	LoadSound \{'drums/stanger/stanger_Snare2'}
	LoadSound \{'drums/stanger/stanger_Snare3'}
endscript

script reload_cymbal_startup 
	LoadSound \{'Drums/reload/reload_Crash1'}
	LoadSound \{'Drums/reload/reload_Crash2'}
endscript

script reload_floortom_startup 
	LoadSound \{'drums/reload/reload_FlTom1'}
endscript

script reload_hihat_startup 
	LoadSound \{'drums/reload/reload_HiHat1'}
	LoadSound \{'drums/reload/reload_HiHat3'}
endscript

script reload_hitom_startup 
	LoadSound \{'drums/reload/reload_Tom1'}
endscript

script reload_kick_startup 
	LoadSound \{'drums/reload/reload_Kick1'}
	LoadSound \{'drums/reload/reload_Kick4'}
	LoadSound \{'drums/reload/reload_Kick3'}
endscript

script reload_snare_startup 
	LoadSound \{'drums/reload/reload_Snare1'}
	LoadSound \{'drums/reload/reload_Snare2'}
	LoadSound \{'drums/reload/reload_Snare3'}
endscript

script masterofpuppets_cymbal_startup 
	LoadSound \{'Drums/masterofpuppets/master_Crash1'}
endscript

script masterofpuppets_floortom_startup 
	LoadSound \{'drums/masterofpuppets/master_FlTom1'}
	LoadSound \{'drums/masterofpuppets/master_FlTom2'}
endscript

script masterofpuppets_hihat_startup 
	LoadSound \{'drums/masterofpuppets/master_HiHat1'}
	LoadSound \{'drums/masterofpuppets/master_HiHat2'}
	LoadSound \{'drums/masterofpuppets/master_HiHat3'}
endscript

script masterofpuppets_hitom_startup 
	LoadSound \{'drums/masterofpuppets/master_Tom1'}
endscript

script masterofpuppets_kick_startup 
	LoadSound \{'drums/masterofpuppets/master_Kick1'}
	LoadSound \{'drums/masterofpuppets/master_Kick2'}
	LoadSound \{'drums/masterofpuppets/master_Kick3'}
endscript

script masterofpuppets_snare_startup 
	LoadSound \{'drums/masterofpuppets/master_Snare1'}
	LoadSound \{'drums/masterofpuppets/master_Snare2'}
	LoadSound \{'drums/masterofpuppets/master_Snare3'}
	LoadSound \{'drums/masterofpuppets/master_Snare4'}
endscript

script noleafclover_cymbal_startup 
	LoadSound \{'Drums/noleafclover/noleaf_Crash2'}
	LoadSound \{'Drums/noleafclover/noleaf_Crash5'}
endscript

script noleafclover_floortom_startup 
	LoadSound \{'drums/noleafclover/NoLeaf_FlTom1'}
	LoadSound \{'drums/noleafclover/NoLeaf_FlTom2'}
endscript

script noleafclover_hihat_startup 
	LoadSound \{'drums/noleafclover/noleaf_HiHat5'}
	LoadSound \{'drums/noleafclover/noleaf_HiHat6'}
	LoadSound \{'drums/noleafclover/noleaf_HiHat7'}
endscript

script noleafclover_hitom_startup 
	LoadSound \{'drums/noleafclover/noleaf_Tom1'}
	LoadSound \{'drums/noleafclover/noleaf_Tom2'}
endscript

script noleafclover_kick_startup 
	LoadSound \{'drums/noleafclover/noleaf_Kick1'}
	LoadSound \{'drums/noleafclover/noleaf_Kick2'}
	LoadSound \{'drums/noleafclover/noleaf_Kick3'}
endscript

script noleafclover_snare_startup 
	LoadSound \{'drums/noleafclover/noleaf_Snare1'}
	LoadSound \{'drums/noleafclover/noleaf_Snare2'}
	LoadSound \{'drums/noleafclover/noleaf_Snare3'}
	LoadSound \{'drums/noleafclover/noleaf_Snare4'}
endscript

script andjusticeforall_cymbal_startup 
	LoadSound \{'Drums/andjusticeforall/ajfa_Crash7'}
	LoadSound \{'Drums/andjusticeforall/ajfa_Crash9'}
endscript

script andjusticeforall_floortom_startup 
	LoadSound \{'drums/andjusticeforall/ajfa_FlTom1'}
	LoadSound \{'drums/andjusticeforall/ajfa_FlTom2'}
	LoadSound \{'drums/andjusticeforall/ajfa_FlTom3'}
endscript

script andjusticeforall_hihat_startup 
	LoadSound \{'drums/andjusticeforall/ajfa_HiHat1'}
	LoadSound \{'drums/andjusticeforall/ajfa_HiHat2'}
	LoadSound \{'drums/andjusticeforall/ajfa_HiHat3'}
	LoadSound \{'drums/andjusticeforall/ajfa_HiHat5'}
endscript

script andjusticeforall_hitom_startup 
	LoadSound \{'drums/andjusticeforall/ajfa_Tom1'}
	LoadSound \{'drums/andjusticeforall/ajfa_Tom2'}
	LoadSound \{'drums/andjusticeforall/ajfa_Tom3'}
endscript

script andjusticeforall_kick_startup 
	LoadSound \{'drums/andjusticeforall/ajfa_Kick1'}
	LoadSound \{'drums/andjusticeforall/ajfa_Kick2'}
	LoadSound \{'drums/andjusticeforall/ajfa_Kick3'}
endscript

script andjusticeforall_snare_startup 
	LoadSound \{'drums/andjusticeforall/ajfa_Snare1'}
	LoadSound \{'drums/andjusticeforall/ajfa_Snare2'}
	LoadSound \{'drums/andjusticeforall/ajfa_Snare3'}
	LoadSound \{'drums/andjusticeforall/ajfa_Snare4'}
	LoadSound \{'drums/andjusticeforall/ajfa_Snare5'}
endscript

script deathmagnetic_cymbal_startup 
	LoadSound \{'Drums/deathmagnetic/death_Crash1'}
	LoadSound \{'Drums/deathmagnetic/death_Crash2'}
	LoadSound \{'Drums/deathmagnetic/death_Crash3'}
	LoadSound \{'Drums/deathmagnetic/death_China1'}
endscript

script deathmagnetic_floortom_startup 
	LoadSound \{'drums/deathmagnetic/death_FlTom1'}
endscript

script deathmagnetic_hihat_startup 
	LoadSound \{'drums/deathmagnetic/death_HiHat1'}
	LoadSound \{'drums/deathmagnetic/death_HiHat2'}
	LoadSound \{'drums/deathmagnetic/death_HiHat4'}
	LoadSound \{'drums/deathmagnetic/death_HiHat5'}
	LoadSound \{'drums/deathmagnetic/death_HiHat7'}
	LoadSound \{'drums/deathmagnetic/death_HiHat9'}
	LoadSound \{'drums/deathmagnetic/death_hatclosed1'}
	LoadSound \{'drums/deathmagnetic/death_hatclosed2'}
endscript

script deathmagnetic_hitom_startup 
	LoadSound \{'drums/deathmagnetic/death_Tom1'}
endscript

script deathmagnetic_kick_startup 
	LoadSound \{'drums/deathmagnetic/death_Kick1'}
	LoadSound \{'drums/deathmagnetic/death_Kick2'}
	LoadSound \{'drums/deathmagnetic/death_Kick3'}
endscript

script deathmagnetic_snare_startup 
	LoadSound \{'drums/deathmagnetic/death_Snare1'}
	LoadSound \{'drums/deathmagnetic/death_Snare2'}
endscript

script load_cymbal_startup 
	LoadSound \{'Drums/load/load_Crash1'}
endscript

script load_floortom_startup 
	LoadSound \{'drums/load/load_FlTom1'}
endscript

script load_hihat_startup 
	LoadSound \{'drums/load/load_HiHat1'}
	LoadSound \{'drums/load/load_HiHat2'}
	LoadSound \{'drums/load/load_HiHat4'}
endscript

script load_hitom_startup 
	LoadSound \{'drums/load/load_Tom1'}
endscript

script load_kick_startup 
	LoadSound \{'drums/load/load_Kick1'}
	LoadSound \{'drums/load/load_Kick2'}
endscript

script load_snare_startup 
	LoadSound \{'drums/load/load_Snare1'}
	LoadSound \{'drums/load/load_Snare2'}
endscript

script garageinc_cymbal_startup 
	LoadSound \{'Drums/GarageInc/garage_Crash1'}
	LoadSound \{'Drums/GarageInc/garage_Crash2'}
	LoadSound \{'Drums/GarageInc/garage_Crash3'}
endscript

script garageinc_floortom_startup 
	LoadSound \{'drums/GarageInc/garage_FlTom1'}
	LoadSound \{'drums/GarageInc/garage_FlTom2'}
endscript

script garageinc_hihat_startup 
	LoadSound \{'drums/GarageInc/garage_HiHat1'}
	LoadSound \{'drums/GarageInc/garage_HiHat2'}
	LoadSound \{'drums/GarageInc/garage_HiHat3'}
endscript

script garageinc_hitom_startup 
	LoadSound \{'drums/GarageInc/garage_Tom1'}
	LoadSound \{'drums/GarageInc/garage_Tom2'}
endscript

script garageinc_kick_startup 
	LoadSound \{'drums/GarageInc/garage_Kick1'}
	LoadSound \{'drums/GarageInc/garage_Kick2'}
endscript

script garageinc_snare_startup 
	LoadSound \{'drums/GarageInc/garage_Snare1'}
	LoadSound \{'drums/GarageInc/garage_Snare2'}
	LoadSound \{'drums/GarageInc/garage_Snare3'}
	LoadSound \{'drums/GarageInc/garage_Snare4'}
endscript

script heavyrock_cymbal_startup 
	LoadSound \{'drums/heavyrockkit/HeavyRockCrash_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockCrash_Lvl_8_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockCrash_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockRide_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockRide_Lvl_8_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockRide_Lvl_6_01'}
endscript

script heavyrock_floortom_startup 
	LoadSound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_8_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_4_01'}
endscript

script heavyrock_hihat_startup 
	LoadSound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_8_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_6_02'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_4_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_4_02'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_9_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_6_02'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_2_01'}
endscript

script heavyrock_hitom_startup 
	LoadSound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_8_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_4_01'}
endscript

script heavyrock_kick_startup 
	LoadSound \{'drums/heavyrockkit/HeavyRockKick_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockKick_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockKick_Lvl_2_01'}
endscript

script heavyrock_snare_startup 
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_12_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_12_02'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_12_03'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_10_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_8_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_6_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_4_01'}
	LoadSound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_2_01'}
endscript

script classicrock_cymbal_startup 
	LoadSound \{'drums/classicrockkit/classicRockCrash_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockCrash_Lvl_8_01'}
	LoadSound \{'drums/classicrockkit/classicRockCrash_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockRide_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockRide_Lvl_8_01'}
	LoadSound \{'drums/classicrockkit/classicRockRide_Lvl_6_01'}
endscript

script classicrock_floortom_startup 
	LoadSound \{'drums/classicrockkit/classicRockFlTom_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockFlTom_Lvl_8_01'}
	LoadSound \{'drums/classicrockkit/classicRockFlTom_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockFlTom_Lvl_4_01'}
endscript

script classicrock_hihat_startup 
	LoadSound \{'drums/classicrockkit/classicRockHHClosed_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHClosed_Lvl_8_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHClosed_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHClosed_Lvl_4_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHOpen_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHOpen_Lvl_9_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHOpen_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockHHOpen_Lvl_2_01'}
endscript

script classicrock_hitom_startup 
	LoadSound \{'drums/classicrockkit/classicRockHiTom_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockHiTom_Lvl_8_01'}
	LoadSound \{'drums/classicrockkit/classicRockHiTom_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockHiTom_Lvl_4_01'}
endscript

script classicrock_kick_startup 
	LoadSound \{'drums/classicrockkit/classicRockKick_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockKick_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockKick_Lvl_2_01'}
endscript

script classicrock_snare_startup 
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_12_01'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_12_02'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_12_03'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_10_01'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_8_01'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_6_01'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_4_01'}
	LoadSound \{'drums/classicrockkit/classicRockSnare_Lvl_2_01'}
endscript

script fusion_cymbal_startup 
	LoadSound \{'drums/Fusionkit/FusionCrash_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionCrash_Lvl_8_01'}
	LoadSound \{'drums/Fusionkit/FusionCrash_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionRide_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionRide_Lvl_8_01'}
	LoadSound \{'drums/Fusionkit/FusionRide_Lvl_6_01'}
endscript

script fusion_floortom_startup 
	LoadSound \{'drums/Fusionkit/FusionFlTom_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionFlTom_Lvl_8_01'}
	LoadSound \{'drums/Fusionkit/FusionFlTom_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionFlTom_Lvl_4_01'}
endscript

script fusion_hihat_startup 
	LoadSound \{'drums/Fusionkit/FusionHHClosed_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionHHClosed_Lvl_8_01'}
	LoadSound \{'drums/Fusionkit/FusionHHClosed_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionHHClosed_Lvl_4_01'}
	LoadSound \{'drums/Fusionkit/FusionHHOpen_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionHHOpen_Lvl_9_01'}
	LoadSound \{'drums/Fusionkit/FusionHHOpen_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionHHOpen_Lvl_2_01'}
endscript

script fusion_hitom_startup 
	LoadSound \{'drums/Fusionkit/FusionHiTom_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionHiTom_Lvl_8_01'}
	LoadSound \{'drums/Fusionkit/FusionHiTom_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionHiTom_Lvl_4_01'}
endscript

script fusion_kick_startup 
	LoadSound \{'drums/Fusionkit/FusionKick_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionKick_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionKick_Lvl_2_01'}
endscript

script fusion_snare_startup 
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_12_01'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_12_02'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_12_03'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_10_01'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_8_01'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_6_01'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_4_01'}
	LoadSound \{'drums/Fusionkit/FusionSnare_Lvl_2_01'}
endscript

script hiphop_cymbal_startup 
	LoadSound \{'drums/hiphopkit/HipHopCrash_Lvl_10_01'}
endscript

script hiphop_floortom_startup 
	LoadSound \{'drums/hiphopkit/HipHopFlTom_Lvl_10_01'}
endscript

script hiphop_hihat_startup 
	LoadSound \{'drums/hiphopkit/HipHopHHOpen_Lvl_10_01'}
endscript

script hiphop_hitom_startup 
	LoadSound \{'drums/hiphopkit/HipHopHiTom_Lvl_10_01'}
endscript

script hiphop_kick_startup 
	LoadSound \{'drums/hiphopkit/HipHopKick_Lvl_10_01'}
endscript

script hiphop_snare_startup 
	LoadSound \{'drums/hiphopkit/HipHopSnare_Lvl_10_01'}
endscript

script modernrock_cymbal_startup 
	LoadSound \{'drums/modernrockkit/modernrockCrash_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockCrash_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockCrash_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockCrash_Lvl_4_01'}
	LoadSound \{'drums/modernrockkit/modernrockRide_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockRide_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockRide_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockRide_Lvl_4_01'}
endscript

script modernrock_floortom_startup 
	LoadSound \{'drums/modernrockkit/modernrockFlTom_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockFlTom_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockFlTom_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockFlTom_Lvl_4_01'}
endscript

script modernrock_hihat_startup 
	LoadSound \{'drums/modernrockkit/modernrockHHClosed_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHClosed_Lvl_9_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHClosed_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHClosed_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHClosed_Lvl_4_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHClosed_Lvl_2_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHOpen_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHOpen_Lvl_9_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHOpen_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHOpen_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHOpen_Lvl_4_01'}
	LoadSound \{'drums/modernrockkit/modernrockHHOpen_Lvl_2_01'}
endscript

script modernrock_hitom_startup 
	LoadSound \{'drums/modernrockkit/modernrockHiTom_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockHiTom_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockHiTom_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockHiTom_Lvl_4_01'}
endscript

script modernrock_kick_startup 
	LoadSound \{'drums/modernrockkit/modernrockKick_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockKick_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockKick_Lvl_2_01'}
endscript

script modernrock_snare_startup 
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_12_01'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_12_02'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_12_03'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_10_01'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_8_01'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_6_01'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_4_01'}
	LoadSound \{'drums/modernrockkit/modernrockSnare_Lvl_2_01'}
endscript

script rockpercussion_cymbal_startup 
	LoadSound \{'drums/rockpercussion/RockPercussion_Gong_Lvl_10_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_Gong_Lvl_6_01'}
endscript

script rockpercussion_floortom_startup 
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_10_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_8_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_6_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_4_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_2_01'}
endscript

script rockpercussion_hihat_startup 
	LoadSound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_12_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_12_02'}
	LoadSound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_12_03'}
	LoadSound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_10_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_10_02'}
	LoadSound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_10_03'}
endscript

script rockpercussion_hitom_startup 
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_10_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_8_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_6_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_4_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_2_01'}
endscript

script rockpercussion_kick_startup 
	LoadSound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_10_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_8_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_6_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_4_01'}
endscript

script rockpercussion_snare_startup 
	LoadSound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_01'}
	LoadSound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_02'}
	LoadSound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_03'}
	LoadSound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_04'}
	LoadSound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_05'}
endscript

script latinpercussion_cymbal_startup 
	LoadSound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_02'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_03'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_04'}
endscript

script latinpercussion_floortom_startup 
	LoadSound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_10_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_10_02'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_8_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_6_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_4_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_2_01'}
endscript

script latinpercussion_hihat_startup 
	LoadSound \{'drums/latinpercussion/LatinPercussion_Maraca_Lvl_10_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Maraca_Lvl_10_02'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Maraca_Lvl_10_03'}
endscript

script latinpercussion_hitom_startup 
	LoadSound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_10_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_10_02'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_8_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_6_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_4_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_2_01'}
endscript

script latinpercussion_kick_startup 
	LoadSound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_10_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_8_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_6_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_4_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_2_01'}
endscript

script latinpercussion_snare_startup 
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_12_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_12_02'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_12_03'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_10_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_8_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_7_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_5_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_4_01'}
	LoadSound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_2_01'}
endscript

script brazilianpercussion_cymbal_startup 
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleHi_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleHi_Lvl_10_02'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleHi_Lvl_10_03'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleLow_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleLow_Lvl_10_02'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleLow_Lvl_10_03'}
endscript

script brazilianpercussion_floortom_startup 
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaLow_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaLow_Lvl_8_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaLow_Lvl_6_01'}
endscript

script brazilianpercussion_hihat_startup 
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_8_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_6_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_4_01'}
endscript

script brazilianpercussion_hitom_startup 
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaHigh_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaHigh_Lvl_8_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaHigh_Lvl_6_01'}
endscript

script brazilianpercussion_kick_startup 
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Surdo_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Surdo_Lvl_8_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_Surdo_Lvl_6_01'}
endscript

script brazilianpercussion_snare_startup 
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_12_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_12_02'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_12_03'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_10_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_8_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_6_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_4_01'}
	LoadSound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_2_01'}
endscript

script hiphoppercussion_cymbal_startup 
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_10_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_8_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_6_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_4_01'}
endscript

script hiphoppercussion_floortom_startup 
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_10_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_8_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_6_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_4_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_2_01'}
endscript

script hiphoppercussion_hihat_startup 
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_10_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_8_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_6_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_4_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_2_01'}
endscript

script hiphoppercussion_hitom_startup 
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Vocal_Lvl_10_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Vocal_Lvl_8_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Vocal_Lvl_6_01'}
endscript

script hiphoppercussion_kick_startup 
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Kick_Lvl_10_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Kick_Lvl_8_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Kick_Lvl_6_01'}
endscript

script hiphoppercussion_snare_startup 
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Snare_Lvl_10_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Snare_Lvl_8_01'}
	LoadSound \{'drums/HipHopPercussion/HipHopPercussion_Snare_Lvl_6_01'}
endscript

script bliphop_cymbal_startup 
	LoadSound \{'drums/Bliphop/Bliphop_Crash'}
endscript

script bliphop_floortom_startup 
	LoadSound \{'drums/Bliphop/Bliphop_Tom2'}
endscript

script bliphop_hihat_startup 
	LoadSound \{'drums/Bliphop/Bliphop_Hihat_10'}
endscript

script bliphop_hitom_startup 
	LoadSound \{'drums/Bliphop/Bliphop_Tom1'}
endscript

script bliphop_kick_startup 
	LoadSound \{'drums/Bliphop/Bliphop_kick_10'}
endscript

script bliphop_snare_startup 
	LoadSound \{'drums/Bliphop/Bliphop_snare_10'}
endscript

script electro_cymbal_startup 
	LoadSound \{'drums/Electro/Electro_cowbell'}
endscript

script electro_floortom_startup 
	LoadSound \{'drums/Electro/Electro_tomlow'}
endscript

script electro_hihat_startup 
	LoadSound \{'drums/Electro/Electro_hhclose'}
	LoadSound \{'drums/Electro/Electro_hhopen'}
endscript

script electro_hitom_startup 
	LoadSound \{'drums/Electro/Electro_tommed'}
	LoadSound \{'drums/Electro/Electro_tomhigh'}
endscript

script electro_kick_startup 
	LoadSound \{'drums/Electro/Electro_kick'}
endscript

script electro_snare_startup 
	LoadSound \{'drums/Electro/Electro_snare'}
endscript

script electropercussion_cymbal_startup 
	LoadSound \{'drums/Electropercussion/Elecperc_clap'}
endscript

script electropercussion_floortom_startup 
	LoadSound \{'drums/Electropercussion/Elecperc_conga'}
endscript

script electropercussion_hihat_startup 
	LoadSound \{'drums/Electropercussion/Elecperc_cabasa'}
endscript

script electropercussion_hitom_startup 
	LoadSound \{'drums/Electropercussion/Elecperc_conga2'}
endscript

script electropercussion_kick_startup 
	LoadSound \{'drums/Electropercussion/Elecperc_kick'}
endscript

script electropercussion_snare_startup 
	LoadSound \{'drums/Electropercussion/Elecperc_rimshot'}
endscript

script oldschoolpercussion_cymbal_startup 
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_clap'}
endscript

script oldschoolpercussion_floortom_startup 
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_timbalelow'}
endscript

script oldschoolpercussion_hihat_startup 
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_hhclose'}
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_hhopen'}
endscript

script oldschoolpercussion_hitom_startup 
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_timbalemed'}
endscript

script oldschoolpercussion_kick_startup 
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_kick'}
endscript

script oldschoolpercussion_snare_startup 
	LoadSound \{'drums/Oldschoolpercussion/Oldschoolperc_timbalehigh'}
endscript

script computight_cymbal_startup 
	LoadSound \{'drums/Computight/Compukit_cowbell'}
endscript

script computight_floortom_startup 
	LoadSound \{'drums/Computight/Compukit_woodlow'}
endscript

script computight_hihat_startup 
	LoadSound \{'drums/Computight/Compukit_hhclose'}
	LoadSound \{'drums/Computight/Compukit_hhopen'}
endscript

script computight_hitom_startup 
	LoadSound \{'drums/Computight/Compukit_woodhigh'}
endscript

script computight_kick_startup 
	LoadSound \{'drums/Computight/Compukit_kick'}
endscript

script computight_snare_startup 
	LoadSound \{'drums/Computight/Compukit_snare'}
endscript

script cheesy_cymbal_startup 
	LoadSound \{'drums/Cheesy/Cheesy_scratch2'}
	LoadSound \{'drums/Cheesy/Cheesy_scratch1'}
	LoadSound \{'drums/Cheesy/Cheesy_cowbell'}
endscript

script cheesy_floortom_startup 
	LoadSound \{'drums/Cheesy/Cheesy_vocode1'}
	LoadSound \{'drums/Cheesy/Cheesy_vocode2'}
endscript

script cheesy_hihat_startup 
	LoadSound \{'drums/Cheesy/Cheesy_hhat1'}
	LoadSound \{'drums/Cheesy/Cheesy_hhat2'}
endscript

script cheesy_hitom_startup 
	LoadSound \{'drums/Cheesy/Cheesy_brass'}
	LoadSound \{'drums/Cheesy/Cheesy_orch'}
endscript

script cheesy_kick_startup 
	LoadSound \{'drums/Cheesy/Cheesy_kick'}
endscript

script cheesy_snare_startup 
	LoadSound \{'drums/Cheesy/Cheesy_snare'}
endscript

script eightys_cymbal_startup 
	LoadSound \{'drums/Eightys/Eightys_crash3'}
	LoadSound \{'drums/Eightys/Eightys_crash2'}
	LoadSound \{'drums/Eightys/Eightys_crash1'}
endscript

script eightys_floortom_startup 
	LoadSound \{'drums/Eightys/Eightys_tomlow'}
endscript

script eightys_hihat_startup 
	LoadSound \{'drums/Eightys/Eightys_hhclosed'}
	LoadSound \{'drums/Eightys/Eightys_hhopen'}
endscript

script eightys_hitom_startup 
	LoadSound \{'drums/Eightys/Eightys_tomhigh'}
	LoadSound \{'drums/Eightys/Eightys_tommed'}
endscript

script eightys_kick_startup 
	LoadSound \{'drums/Eightys/Eightys_kick'}
endscript

script eightys_snare_startup 
	LoadSound \{'drums/Eightys/Eightys_snare1'}
	LoadSound \{'drums/Eightys/Eightys_snare2'}
endscript

script oldschool_cymbal_startup 
	LoadSound \{'drums/Oldschool/Oldschool_crash'}
	LoadSound \{'drums/Oldschool/Oldschool_ride'}
endscript

script oldschool_floortom_startup 
	LoadSound \{'drums/Oldschool/Oldschool_tomlow'}
endscript

script oldschool_hihat_startup 
	LoadSound \{'drums/Oldschool/Oldschool_hhclose'}
	LoadSound \{'drums/Oldschool/Oldschool_hhopen'}
endscript

script oldschool_hitom_startup 
	LoadSound \{'drums/Oldschool/Oldschool_tomhi'}
	LoadSound \{'drums/Oldschool/Oldschool_tommed'}
endscript

script oldschool_kick_startup 
	LoadSound \{'drums/Oldschool/Oldschool_kick1'}
	LoadSound \{'drums/Oldschool/Oldschool_kick2'}
endscript

script oldschool_snare_startup 
	LoadSound \{'drums/Oldschool/Oldschool_snare1'}
	LoadSound \{'drums/Oldschool/Oldschool_snare2'}
	LoadSound \{'drums/Oldschool/Oldschool_snare3'}
endscript

script house_cymbal_startup 
	LoadSound \{'drums/House/House_crash'}
	LoadSound \{'drums/House/House_ride'}
endscript

script house_floortom_startup 
	LoadSound \{'drums/House/House_tomlow'}
endscript

script house_hihat_startup 
	LoadSound \{'drums/House/House_hhclose'}
	LoadSound \{'drums/House/House_hhopen'}
endscript

script house_hitom_startup 
	LoadSound \{'drums/House/House_tomhigh'}
	LoadSound \{'drums/House/House_tommed'}
endscript

script house_kick_startup 
	LoadSound \{'drums/House/House_kick1'}
	LoadSound \{'drums/House/House_kick2'}
	LoadSound \{'drums/House/House_kick3'}
endscript

script house_snare_startup 
	LoadSound \{'drums/House/House_snare1'}
	LoadSound \{'drums/House/House_snare2'}
	LoadSound \{'drums/House/House_clap'}
endscript

script india_kick_startup 
	LoadSound \{'drums/India/india_kick'}
endscript

script india_hitom_startup 
	LoadSound \{'drums/India/india_tom1'}
endscript

script india_cymbal_startup 
	LoadSound \{'drums/India/india_crash'}
endscript

script india_hihat_startup 
	LoadSound \{'drums/India/india_ping'}
endscript

script india_snare_startup 
	LoadSound \{'drums/India/india_snare'}
endscript

script india_floortom_startup 
	LoadSound \{'drums/India/india_tom2'}
endscript

script indiagirl_kick_startup 
	LoadSound \{'drums/Indiagirl/India_girlkick'}
endscript

script indiagirl_hitom_startup 
	LoadSound \{'drums/Indiagirl/India_girl4'}
endscript

script indiagirl_cymbal_startup 
	LoadSound \{'drums/Indiagirl/India_girl_longer2'}
endscript

script indiagirl_hihat_startup 
	LoadSound \{'drums/Indiagirl/India_girl2'}
	LoadSound \{'drums/Indiagirl/India_girl_longer'}
endscript

script indiagirl_snare_startup 
	LoadSound \{'drums/Indiagirl/India_girl1'}
endscript

script indiagirl_floortom_startup 
	LoadSound \{'drums/Indiagirl/India_girl3'}
endscript

script orchestral_kick_startup 
	LoadSound \{'drums/Orchestral/orch_kick'}
endscript

script orchestral_hitom_startup 
	LoadSound \{'drums/Orchestral/orch_tom1'}
endscript

script orchestral_cymbal_startup 
	LoadSound \{'drums/Orchestral/orch_crash'}
endscript

script orchestral_hihat_startup 
	LoadSound \{'drums/Orchestral/orch_hihat'}
endscript

script orchestral_snare_startup 
	LoadSound \{'drums/Orchestral/orch_snare'}
endscript

script orchestral_floortom_startup 
	LoadSound \{'drums/Orchestral/orch_tom2'}
endscript

script jazzy_kick_startup 
	LoadSound \{'drums/Jazzy/j_kick'}
endscript

script jazzy_hitom_startup 
	LoadSound \{'drums/Jazzy/j_tom1'}
endscript

script jazzy_cymbal_startup 
	LoadSound \{'drums/Jazzy/j_crash'}
endscript

script jazzy_hihat_startup 
	LoadSound \{'drums/Jazzy/j_hihat'}
endscript

script jazzy_snare_startup 
	LoadSound \{'drums/Jazzy/j_snare'}
endscript

script jazzy_floortom_startup 
	LoadSound \{'drums/Jazzy/j_tom2'}
endscript

script scratch_floortom_startup 
	LoadSound \{'drums/Scratch/DJ_aahh1'}
	LoadSound \{'drums/Scratch/DJ_aahh7'}
	LoadSound \{'drums/Scratch/DJ_Laser10'}
	LoadSound \{'drums/Scratch/DJ_ugh14'}
	LoadSound \{'drums/Scratch/DJ_blast18'}
endscript

script scratch_snare_startup 
	LoadSound \{'drums/Scratch/DJ_aahh2'}
	LoadSound \{'drums/Scratch/DJ_aahh8'}
	LoadSound \{'drums/Scratch/DJ_Laser11'}
	LoadSound \{'drums/Scratch/DJ_ugh15'}
	LoadSound \{'drums/Scratch/DJ_blast19'}
endscript

script scratch_hihat_startup 
	LoadSound \{'drums/Scratch/DJ_aahh3'}
	LoadSound \{'drums/Scratch/DJ_aahh9'}
	LoadSound \{'drums/Scratch/DJ_stab12'}
	LoadSound \{'drums/Scratch/DJ_ugh16'}
	LoadSound \{'drums/Scratch/DJ_ahhya20'}
endscript

script scratch_hitom_startup 
	LoadSound \{'drums/Scratch/DJ_aahh4'}
	LoadSound \{'drums/Scratch/DJ_whew26'}
	LoadSound \{'drums/Scratch/DJ_stab13'}
	LoadSound \{'drums/Scratch/DJ_ugh17'}
	LoadSound \{'drums/Scratch/DJ_ahhya21'}
endscript

script scratch_cymbal_startup 
	LoadSound \{'drums/Scratch/DJ_aahh5'}
	LoadSound \{'drums/Scratch/DJ_aahh6'}
	LoadSound \{'drums/Scratch/DJ_shortbaby23'}
	LoadSound \{'drums/Scratch/DJ_ugh26'}
	LoadSound \{'drums/Scratch/DJ_whistle28'}
endscript

script scratch_kick_startup 
	LoadSound \{'drums/Scratch/DJ_aahhfull31'}
	LoadSound \{'drums/Scratch/DJ_rewind29'}
	LoadSound \{'drums/Scratch/DJ_backspin22'}
	LoadSound \{'drums/Scratch/DJ_fastrewind24'}
	LoadSound \{'drums/Scratch/DJ_backforth25'}
endscript

script robot_kick_startup 
	LoadSound \{'drums/robot/robot_zero'}
	LoadSound \{'drums/robot/robot_one'}
	LoadSound \{'drums/robot/robot_two'}
	LoadSound \{'drums/robot/robot_three'}
	LoadSound \{'drums/robot/robot_rock'}
endscript

script robot_floortom_startup 
	LoadSound \{'drums/robot/robot_technology'}
	LoadSound \{'drums/robot/robot_beat'}
	LoadSound \{'drums/robot/robot_harder'}
	LoadSound \{'drums/robot/robot_baby'}
	LoadSound \{'drums/robot/robot_bionic'}
endscript

script robot_cymbal_startup 
	LoadSound \{'drums/robot/robot_energize'}
	LoadSound \{'drums/robot/robot_jam'}
	LoadSound \{'drums/robot/robot_on'}
	LoadSound \{'drums/robot/robot_it'}
	LoadSound \{'drums/robot/robot_future'}
endscript

script robot_hihat_startup 
	LoadSound \{'drums/robot/robot_electro'}
	LoadSound \{'drums/robot/robot_fire'}
	LoadSound \{'drums/robot/robot_faster'}
	LoadSound \{'drums/robot/robot_floor'}
	LoadSound \{'drums/robot/robot_freak'}
endscript

script robot_snare_startup 
	LoadSound \{'drums/robot/robot_boy'}
	LoadSound \{'drums/robot/robot_compute'}
	LoadSound \{'drums/robot/robot_better'}
	LoadSound \{'drums/robot/robot_drop'}
	LoadSound \{'drums/robot/robot_electricity'}
endscript

script robot_hitom_startup 
	LoadSound \{'drums/robot/robot_fresh'}
	LoadSound \{'drums/robot/robot_funky'}
	LoadSound \{'drums/robot/robot_stronger'}
	LoadSound \{'drums/robot/robot_get'}
	LoadSound \{'drums/robot/robot_girl'}
endscript

script scratch_electro_kick_startup 
	LoadSound \{'drums/Scratch_Electro/scratch_electro_kick'}
endscript

script scratch_electro_hitom_startup 
	LoadSound \{'drums/Scratch_Electro/scratch_electro_tom1'}
endscript

script scratch_electro_cymbal_startup 
	LoadSound \{'drums/Scratch_Electro/scratch_electro_crash'}
endscript

script scratch_electro_hihat_startup 
	LoadSound \{'drums/Scratch_Electro/scratch_electro_hihat'}
endscript

script scratch_electro_snare_startup 
	LoadSound \{'drums/Scratch_Electro/scratch_electro_snare'}
endscript

script scratch_electro_floortom_startup 
	LoadSound \{'drums/Scratch_Electro/scratch_electro_tom2'}
endscript

script dub_kick_startup 
	LoadSound \{'drums/dub/dub_kick'}
endscript

script dub_hitom_startup 
	LoadSound \{'drums/dub/dub_tom1'}
endscript

script dub_cymbal_startup 
	LoadSound \{'drums/dub/dub_cymbal'}
endscript

script dub_hihat_startup 
	LoadSound \{'drums/dub/dub_hihat'}
endscript

script dub_snare_startup 
	LoadSound \{'drums/dub/dub_snare'}
endscript

script dub_floortom_startup 
	LoadSound \{'drums/dub/dub_tom2'}
endscript

script pigmy_kick_startup 
	LoadSound \{'drums/pigmy/pigmy_kick'}
endscript

script pigmy_hitom_startup 
	LoadSound \{'drums/pigmy/pigmy_tom1'}
endscript

script pigmy_cymbal_startup 
	LoadSound \{'drums/pigmy/pigmy_cymbal'}
endscript

script pigmy_hihat_startup 
	LoadSound \{'drums/pigmy/pigmy_hihat'}
endscript

script pigmy_snare_startup 
	LoadSound \{'drums/pigmy/pigmy_snare'}
endscript

script pigmy_floortom_startup 
	LoadSound \{'drums/pigmy/pigmy_tom2'}
endscript

script conga_kick_startup 
	LoadSound \{'drums/conga/conga_kick'}
endscript

script conga_hitom_startup 
	LoadSound \{'drums/conga/conga_tom1'}
endscript

script conga_cymbal_startup 
	LoadSound \{'drums/conga/conga_cymbal'}
	LoadSound \{'drums/conga/conga_crash'}
endscript

script conga_hihat_startup 
	LoadSound \{'drums/conga/conga_hihat'}
endscript

script conga_snare_startup 
	LoadSound \{'drums/conga/conga_snare'}
endscript

script conga_floortom_startup 
	LoadSound \{'drums/conga/conga_tom2'}
endscript

script gunshot_cymbal_startup 
	LoadSound \{'drums/Gunshot/Gun_ricocrash'}
	LoadSound \{'drums/Gunshot/Gun_ricochet'}
endscript

script gunshot_floortom_startup 
	LoadSound \{'drums/Gunshot/Gun_tom2'}
endscript

script gunshot_hihat_startup 
	LoadSound \{'drums/Gunshot/Gun_hihat'}
	LoadSound \{'drums/Gunshot/Gun_hihat_open'}
endscript

script gunshot_hitom_startup 
	LoadSound \{'drums/Gunshot/Gun_tom1'}
endscript

script gunshot_kick_startup 
	LoadSound \{'drums/Gunshot/Gun_kickheavy'}
	LoadSound \{'drums/Gunshot/Gun_kickheavy2'}
endscript

script gunshot_snare_startup 
	LoadSound \{'drums/Gunshot/Gun_robosnare'}
	LoadSound \{'drums/Gunshot/Gun_heavysnare'}
	LoadSound \{'drums/Gunshot/Gun_snare'}
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

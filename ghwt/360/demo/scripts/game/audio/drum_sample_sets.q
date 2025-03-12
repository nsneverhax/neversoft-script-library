drum_sample_test = 0
drum_input_current_cymbal = null
drum_input_current_hihat = null
drum_input_current_kick = null
drum_input_current_snare = null
drum_input_current_tom = null
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
last_drum_kit_loaded = none

script loaddrumkitall \{drum_kit = 'heavyrock'
		async = 1
		reset_percussion = 1}
	if (<reset_percussion> = 1)
		change \{is_percussion_kit = 0}
	endif
	formattext checksumname = csum '%s' s = <drum_kit>
	if (<csum> = $last_drum_kit_loaded)
		printf 'LoadDrumKitAll - %s already loaded' s = <drum_kit>
		return
	endif
	unloaddrumkitall
	loaddrumkit type = cymbal drum_kit = <drum_kit> async = <async>
	loaddrumkit type = floortom drum_kit = <drum_kit> async = <async>
	loaddrumkit type = hihat drum_kit = <drum_kit> async = <async>
	loaddrumkit type = hitom drum_kit = <drum_kit> async = <async>
	loaddrumkit type = kick drum_kit = <drum_kit> async = <async>
	loaddrumkit type = snare drum_kit = <drum_kit> async = <async>
	if gotparam \{percussion_kit}
		loaddrumkit type = cymbal drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit type = floortom drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit type = hihat drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit type = hitom drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit type = kick drum_kit = <percussion_kit> async = <async> percussion
		loaddrumkit type = snare drum_kit = <percussion_kit> async = <async> percussion
	endif
	change last_drum_kit_loaded = <csum>
endscript

script loaddrumkit \{type = snare
		drum_kit = 'heavyrock'
		async = 1}
	if structurecontains structure = $drumkitparts <type>
		if gotparam \{percussion}
			formattext checksumname = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<type>)
		else
			formattext checksumname = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<type>)
		endif
		if NOT ($<global_pak_crc> = 'none')
			unloaddrumkit type = <type>
		endif
		formattext textname = drumkit_pakname 'pak/drumkits/%s_%t.pak' s = <drum_kit> t = ($drumkitparts.<type>)
		if NOT loadpakasync pak_name = <drumkit_pakname> heap = heap_drumkitaudio async = <async>
			downloadcontentlost
			return
		endif
		change globalname = <global_pak_crc> newvalue = <drumkit_pakname>
	else
		printscriptinfo \{qs(0x6d0085b6)}
		scriptassert \{qs(0x0d594f4d)}
	endif
endscript

script unloaddrumkitall 
	change \{last_drum_kit_loaded = none}
	unloaddrumkit \{type = cymbal}
	unloaddrumkit \{type = floortom}
	unloaddrumkit \{type = hihat}
	unloaddrumkit \{type = hitom}
	unloaddrumkit \{type = kick}
	unloaddrumkit \{type = snare}
	unloaddrumkit \{type = cymbal
		percussion}
	unloaddrumkit \{type = floortom
		percussion}
	unloaddrumkit \{type = hihat
		percussion}
	unloaddrumkit \{type = hitom
		percussion}
	unloaddrumkit \{type = kick
		percussion}
	unloaddrumkit \{type = snare
		percussion}
endscript

script unloaddrumkit \{type = snare}
	if structurecontains structure = $drumkitparts <type>
		if gotparam \{percussion}
			formattext checksumname = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($drumkitparts.<type>)
		else
			formattext checksumname = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($drumkitparts.<type>)
		endif
		if NOT ($<global_pak_crc> = 'none')
			unloadpak ($<global_pak_crc>)
			change globalname = <global_pak_crc> newvalue = 'none'
		endif
	else
		printscriptinfo \{qs(0x73feec57)}
		scriptassert \{qs(0x0d594f4d)}
	endif
endscript

script heavyrock_cymbal_startup 
	loadsound \{'drums/heavyrockkit/HeavyRockCrash_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockCrash_Lvl_8_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockCrash_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockRide_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockRide_Lvl_8_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockRide_Lvl_6_01'}
endscript

script heavyrock_floortom_startup 
	loadsound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_8_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockFlTom_Lvl_4_01'}
endscript

script heavyrock_hihat_startup 
	loadsound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_8_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_6_02'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_4_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHClosed_Lvl_4_02'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_9_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_6_02'}
	loadsound \{'drums/heavyrockkit/HeavyRockHHOpen_Lvl_2_01'}
endscript

script heavyrock_hitom_startup 
	loadsound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_8_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockHiTom_Lvl_4_01'}
endscript

script heavyrock_kick_startup 
	loadsound \{'drums/heavyrockkit/HeavyRockKick_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockKick_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockKick_Lvl_2_01'}
endscript

script heavyrock_snare_startup 
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_12_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_12_02'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_12_03'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_10_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_8_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_6_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_4_01'}
	loadsound \{'drums/heavyrockkit/HeavyRockSnare_Lvl_2_01'}
endscript

script classicrock_cymbal_startup 
	loadsound \{'drums/classicrockkit/classicRockCrash_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockCrash_Lvl_8_01'}
	loadsound \{'drums/classicrockkit/classicRockCrash_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockRide_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockRide_Lvl_8_01'}
	loadsound \{'drums/classicrockkit/classicRockRide_Lvl_6_01'}
endscript

script classicrock_floortom_startup 
	loadsound \{'drums/classicrockkit/classicRockFlTom_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockFlTom_Lvl_8_01'}
	loadsound \{'drums/classicrockkit/classicRockFlTom_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockFlTom_Lvl_4_01'}
endscript

script classicrock_hihat_startup 
	loadsound \{'drums/classicrockkit/classicRockHHClosed_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockHHClosed_Lvl_8_01'}
	loadsound \{'drums/classicrockkit/classicRockHHClosed_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockHHClosed_Lvl_4_01'}
	loadsound \{'drums/classicrockkit/classicRockHHOpen_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockHHOpen_Lvl_9_01'}
	loadsound \{'drums/classicrockkit/classicRockHHOpen_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockHHOpen_Lvl_2_01'}
endscript

script classicrock_hitom_startup 
	loadsound \{'drums/classicrockkit/classicRockHiTom_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockHiTom_Lvl_8_01'}
	loadsound \{'drums/classicrockkit/classicRockHiTom_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockHiTom_Lvl_4_01'}
endscript

script classicrock_kick_startup 
	loadsound \{'drums/classicrockkit/classicRockKick_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockKick_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockKick_Lvl_2_01'}
endscript

script classicrock_snare_startup 
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_12_01'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_12_02'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_12_03'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_10_01'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_8_01'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_6_01'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_4_01'}
	loadsound \{'drums/classicrockkit/classicRockSnare_Lvl_2_01'}
endscript

script fusion_cymbal_startup 
	loadsound \{'drums/Fusionkit/FusionCrash_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionCrash_Lvl_8_01'}
	loadsound \{'drums/Fusionkit/FusionCrash_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionRide_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionRide_Lvl_8_01'}
	loadsound \{'drums/Fusionkit/FusionRide_Lvl_6_01'}
endscript

script fusion_floortom_startup 
	loadsound \{'drums/Fusionkit/FusionFlTom_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionFlTom_Lvl_8_01'}
	loadsound \{'drums/Fusionkit/FusionFlTom_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionFlTom_Lvl_4_01'}
endscript

script fusion_hihat_startup 
	loadsound \{'drums/Fusionkit/FusionHHClosed_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionHHClosed_Lvl_8_01'}
	loadsound \{'drums/Fusionkit/FusionHHClosed_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionHHClosed_Lvl_4_01'}
	loadsound \{'drums/Fusionkit/FusionHHOpen_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionHHOpen_Lvl_9_01'}
	loadsound \{'drums/Fusionkit/FusionHHOpen_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionHHOpen_Lvl_2_01'}
endscript

script fusion_hitom_startup 
	loadsound \{'drums/Fusionkit/FusionHiTom_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionHiTom_Lvl_8_01'}
	loadsound \{'drums/Fusionkit/FusionHiTom_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionHiTom_Lvl_4_01'}
endscript

script fusion_kick_startup 
	loadsound \{'drums/Fusionkit/FusionKick_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionKick_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionKick_Lvl_2_01'}
endscript

script fusion_snare_startup 
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_12_01'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_12_02'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_12_03'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_10_01'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_8_01'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_6_01'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_4_01'}
	loadsound \{'drums/Fusionkit/FusionSnare_Lvl_2_01'}
endscript

script hiphop_cymbal_startup 
	loadsound \{'drums/hiphopkit/HipHopCrash_Lvl_10_01'}
endscript

script hiphop_floortom_startup 
	loadsound \{'drums/hiphopkit/HipHopFlTom_Lvl_10_01'}
endscript

script hiphop_hihat_startup 
	loadsound \{'drums/hiphopkit/HipHopHHOpen_Lvl_10_01'}
endscript

script hiphop_hitom_startup 
	loadsound \{'drums/hiphopkit/HipHopHiTom_Lvl_10_01'}
endscript

script hiphop_kick_startup 
	loadsound \{'drums/hiphopkit/HipHopKick_Lvl_10_01'}
endscript

script hiphop_snare_startup 
	loadsound \{'drums/hiphopkit/HipHopSnare_Lvl_10_01'}
endscript

script modernrock_cymbal_startup 
	loadsound \{'drums/modernrockkit/modernrockCrash_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockCrash_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockCrash_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockCrash_Lvl_4_01'}
	loadsound \{'drums/modernrockkit/modernrockRide_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockRide_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockRide_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockRide_Lvl_4_01'}
endscript

script modernrock_floortom_startup 
	loadsound \{'drums/modernrockkit/modernrockFlTom_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockFlTom_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockFlTom_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockFlTom_Lvl_4_01'}
endscript

script modernrock_hihat_startup 
	loadsound \{'drums/modernrockkit/modernrockHHClosed_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockHHClosed_Lvl_9_01'}
	loadsound \{'drums/modernrockkit/modernrockHHClosed_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockHHClosed_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockHHClosed_Lvl_4_01'}
	loadsound \{'drums/modernrockkit/modernrockHHClosed_Lvl_2_01'}
	loadsound \{'drums/modernrockkit/modernrockHHOpen_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockHHOpen_Lvl_9_01'}
	loadsound \{'drums/modernrockkit/modernrockHHOpen_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockHHOpen_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockHHOpen_Lvl_4_01'}
	loadsound \{'drums/modernrockkit/modernrockHHOpen_Lvl_2_01'}
endscript

script modernrock_hitom_startup 
	loadsound \{'drums/modernrockkit/modernrockHiTom_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockHiTom_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockHiTom_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockHiTom_Lvl_4_01'}
endscript

script modernrock_kick_startup 
	loadsound \{'drums/modernrockkit/modernrockKick_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockKick_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockKick_Lvl_2_01'}
endscript

script modernrock_snare_startup 
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_12_01'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_12_02'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_12_03'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_10_01'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_8_01'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_6_01'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_4_01'}
	loadsound \{'drums/modernrockkit/modernrockSnare_Lvl_2_01'}
endscript

script rockpercussion_cymbal_startup 
	loadsound \{'drums/rockpercussion/RockPercussion_Gong_Lvl_10_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_Gong_Lvl_6_01'}
endscript

script rockpercussion_floortom_startup 
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_10_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_8_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_6_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_4_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomMed_Lvl_2_01'}
endscript

script rockpercussion_hihat_startup 
	loadsound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_12_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_12_02'}
	loadsound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_12_03'}
	loadsound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_10_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_10_02'}
	loadsound \{'drums/rockpercussion/RockPercussion_Tambourine_Lvl_10_03'}
endscript

script rockpercussion_hitom_startup 
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_10_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_8_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_6_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_4_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_RotoTomHi_Lvl_2_01'}
endscript

script rockpercussion_kick_startup 
	loadsound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_10_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_8_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_6_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_ConcertBassDrum_Lvl_4_01'}
endscript

script rockpercussion_snare_startup 
	loadsound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_01'}
	loadsound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_02'}
	loadsound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_03'}
	loadsound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_04'}
	loadsound \{'drums/rockpercussion/RockPercussion_HandClap_Lvl_10_05'}
endscript

script latinpercussion_cymbal_startup 
	loadsound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_02'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_03'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Clave_Lvl_10_04'}
endscript

script latinpercussion_floortom_startup 
	loadsound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_10_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_10_02'}
	loadsound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_8_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_6_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_4_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_LowTimbale_Lvl_2_01'}
endscript

script latinpercussion_hihat_startup 
	loadsound \{'drums/latinpercussion/LatinPercussion_Maraca_Lvl_10_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Maraca_Lvl_10_02'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Maraca_Lvl_10_03'}
endscript

script latinpercussion_hitom_startup 
	loadsound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_10_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_10_02'}
	loadsound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_8_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_6_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_4_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_HighTimbale_Lvl_2_01'}
endscript

script latinpercussion_kick_startup 
	loadsound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_10_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_8_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_6_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_4_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_BoxDrum_Lvl_2_01'}
endscript

script latinpercussion_snare_startup 
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_12_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_12_02'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_12_03'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_10_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_8_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_7_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_5_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_4_01'}
	loadsound \{'drums/latinpercussion/LatinPercussion_Conga_Lvl_2_01'}
endscript

script brazilianpercussion_cymbal_startup 
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleHi_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleHi_Lvl_10_02'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleHi_Lvl_10_03'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleLow_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleLow_Lvl_10_02'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_WhistleLow_Lvl_10_03'}
endscript

script brazilianpercussion_floortom_startup 
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaLow_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaLow_Lvl_8_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaLow_Lvl_6_01'}
endscript

script brazilianpercussion_hihat_startup 
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_8_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_6_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Pandiero_Lvl_4_01'}
endscript

script brazilianpercussion_hitom_startup 
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaHigh_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaHigh_Lvl_8_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_QuicaHigh_Lvl_6_01'}
endscript

script brazilianpercussion_kick_startup 
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Surdo_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Surdo_Lvl_8_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_Surdo_Lvl_6_01'}
endscript

script brazilianpercussion_snare_startup 
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_12_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_12_02'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_12_03'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_10_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_8_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_6_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_4_01'}
	loadsound \{'drums/Brazilianpercussion/BrazilianPercussion_CiaxaDeGuerra_Lvl_2_01'}
endscript

script hiphoppercussion_cymbal_startup 
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_10_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_8_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_6_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Cymbal_Lvl_4_01'}
endscript

script hiphoppercussion_floortom_startup 
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_10_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_8_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_6_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_4_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Scratch_Lvl_2_01'}
endscript

script hiphoppercussion_hihat_startup 
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_10_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_8_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_6_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_4_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_HiHat_Lvl_2_01'}
endscript

script hiphoppercussion_hitom_startup 
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Vocal_Lvl_10_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Vocal_Lvl_8_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Vocal_Lvl_6_01'}
endscript

script hiphoppercussion_kick_startup 
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Kick_Lvl_10_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Kick_Lvl_8_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Kick_Lvl_6_01'}
endscript

script hiphoppercussion_snare_startup 
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Snare_Lvl_10_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Snare_Lvl_8_01'}
	loadsound \{'drums/HipHopPercussion/HipHopPercussion_Snare_Lvl_6_01'}
endscript

script bliphop_cymbal_startup 
	loadsound \{'drums/Bliphop/Bliphop_Crash'}
endscript

script bliphop_floortom_startup 
	loadsound \{'drums/Bliphop/Bliphop_Tom2'}
endscript

script bliphop_hihat_startup 
	loadsound \{'drums/Bliphop/Bliphop_Hihat_10'}
endscript

script bliphop_hitom_startup 
	loadsound \{'drums/Bliphop/Bliphop_Tom1'}
endscript

script bliphop_kick_startup 
	loadsound \{'drums/Bliphop/Bliphop_kick_10'}
endscript

script bliphop_snare_startup 
	loadsound \{'drums/Bliphop/Bliphop_snare_10'}
endscript

script electro_cymbal_startup 
	loadsound \{'drums/Electro/Electro_cowbell'}
endscript

script electro_floortom_startup 
	loadsound \{'drums/Electro/Electro_tomlow'}
endscript

script electro_hihat_startup 
	loadsound \{'drums/Electro/Electro_hhclose'}
	loadsound \{'drums/Electro/Electro_hhopen'}
endscript

script electro_hitom_startup 
	loadsound \{'drums/Electro/Electro_tommed'}
	loadsound \{'drums/Electro/Electro_tomhigh'}
endscript

script electro_kick_startup 
	loadsound \{'drums/Electro/Electro_kick'}
endscript

script electro_snare_startup 
	loadsound \{'drums/Electro/Electro_snare'}
endscript

script electropercussion_cymbal_startup 
	loadsound \{'drums/Electropercussion/Elecperc_clap'}
endscript

script electropercussion_floortom_startup 
	loadsound \{'drums/Electropercussion/Elecperc_conga'}
endscript

script electropercussion_hihat_startup 
	loadsound \{'drums/Electropercussion/Elecperc_cabasa'}
endscript

script electropercussion_hitom_startup 
	loadsound \{'drums/Electropercussion/Elecperc_conga2'}
endscript

script electropercussion_kick_startup 
	loadsound \{'drums/Electropercussion/Elecperc_kick'}
endscript

script electropercussion_snare_startup 
	loadsound \{'drums/Electropercussion/Elecperc_rimshot'}
endscript

script oldschoolpercussion_cymbal_startup 
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_clap'}
endscript

script oldschoolpercussion_floortom_startup 
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_timbalelow'}
endscript

script oldschoolpercussion_hihat_startup 
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_hhclose'}
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_hhopen'}
endscript

script oldschoolpercussion_hitom_startup 
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_timbalemed'}
endscript

script oldschoolpercussion_kick_startup 
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_kick'}
endscript

script oldschoolpercussion_snare_startup 
	loadsound \{'drums/Oldschoolpercussion/Oldschoolperc_timbalehigh'}
endscript

script computight_cymbal_startup 
	loadsound \{'drums/Computight/Compukit_cowbell'}
endscript

script computight_floortom_startup 
	loadsound \{'drums/Computight/Compukit_woodlow'}
endscript

script computight_hihat_startup 
	loadsound \{'drums/Computight/Compukit_hhclose'}
	loadsound \{'drums/Computight/Compukit_hhopen'}
endscript

script computight_hitom_startup 
	loadsound \{'drums/Computight/Compukit_woodhigh'}
endscript

script computight_kick_startup 
	loadsound \{'drums/Computight/Compukit_kick'}
endscript

script computight_snare_startup 
	loadsound \{'drums/Computight/Compukit_snare'}
endscript

script cheesy_cymbal_startup 
	loadsound \{'drums/Cheesy/Cheesy_scratch2'}
	loadsound \{'drums/Cheesy/Cheesy_scratch1'}
	loadsound \{'drums/Cheesy/Cheesy_cowbell'}
endscript

script cheesy_floortom_startup 
	loadsound \{'drums/Cheesy/Cheesy_vocode1'}
	loadsound \{'drums/Cheesy/Cheesy_vocode2'}
endscript

script cheesy_hihat_startup 
	loadsound \{'drums/Cheesy/Cheesy_hhat1'}
	loadsound \{'drums/Cheesy/Cheesy_hhat2'}
endscript

script cheesy_hitom_startup 
	loadsound \{'drums/Cheesy/Cheesy_brass'}
	loadsound \{'drums/Cheesy/Cheesy_orch'}
endscript

script cheesy_kick_startup 
	loadsound \{'drums/Cheesy/Cheesy_kick'}
endscript

script cheesy_snare_startup 
	loadsound \{'drums/Cheesy/Cheesy_snare'}
endscript

script eightys_cymbal_startup 
	loadsound \{'drums/Eightys/Eightys_crash3'}
	loadsound \{'drums/Eightys/Eightys_crash2'}
	loadsound \{'drums/Eightys/Eightys_crash1'}
endscript

script eightys_floortom_startup 
	loadsound \{'drums/Eightys/Eightys_tomlow'}
endscript

script eightys_hihat_startup 
	loadsound \{'drums/Eightys/Eightys_hhclosed'}
	loadsound \{'drums/Eightys/Eightys_hhopen'}
endscript

script eightys_hitom_startup 
	loadsound \{'drums/Eightys/Eightys_tomhigh'}
	loadsound \{'drums/Eightys/Eightys_tommed'}
endscript

script eightys_kick_startup 
	loadsound \{'drums/Eightys/Eightys_kick'}
endscript

script eightys_snare_startup 
	loadsound \{'drums/Eightys/Eightys_snare1'}
	loadsound \{'drums/Eightys/Eightys_snare2'}
endscript

script oldschool_cymbal_startup 
	loadsound \{'drums/Oldschool/Oldschool_crash'}
	loadsound \{'drums/Oldschool/Oldschool_ride'}
endscript

script oldschool_floortom_startup 
	loadsound \{'drums/Oldschool/Oldschool_tomlow'}
endscript

script oldschool_hihat_startup 
	loadsound \{'drums/Oldschool/Oldschool_hhclose'}
	loadsound \{'drums/Oldschool/Oldschool_hhopen'}
endscript

script oldschool_hitom_startup 
	loadsound \{'drums/Oldschool/Oldschool_tomhi'}
	loadsound \{'drums/Oldschool/Oldschool_tommed'}
endscript

script oldschool_kick_startup 
	loadsound \{'drums/Oldschool/Oldschool_kick1'}
	loadsound \{'drums/Oldschool/Oldschool_kick2'}
endscript

script oldschool_snare_startup 
	loadsound \{'drums/Oldschool/Oldschool_snare1'}
	loadsound \{'drums/Oldschool/Oldschool_snare2'}
	loadsound \{'drums/Oldschool/Oldschool_snare3'}
endscript

script house_cymbal_startup 
	loadsound \{'drums/House/House_crash'}
	loadsound \{'drums/House/House_ride'}
endscript

script house_floortom_startup 
	loadsound \{'drums/House/House_tomlow'}
endscript

script house_hihat_startup 
	loadsound \{'drums/House/House_hhclose'}
	loadsound \{'drums/House/House_hhopen'}
endscript

script house_hitom_startup 
	loadsound \{'drums/House/House_tomhigh'}
	loadsound \{'drums/House/House_tommed'}
endscript

script house_kick_startup 
	loadsound \{'drums/House/House_kick1'}
	loadsound \{'drums/House/House_kick2'}
	loadsound \{'drums/House/House_kick3'}
endscript

script house_snare_startup 
	loadsound \{'drums/House/House_snare1'}
	loadsound \{'drums/House/House_snare2'}
	loadsound \{'drums/House/House_clap'}
endscript

script india_kick_startup 
	loadsound \{'drums/India/india_kick'}
endscript

script india_hitom_startup 
	loadsound \{'drums/India/india_tom1'}
endscript

script india_cymbal_startup 
	loadsound \{'drums/India/india_crash'}
endscript

script india_hihat_startup 
	loadsound \{'drums/India/india_ping'}
endscript

script india_snare_startup 
	loadsound \{'drums/India/india_snare'}
endscript

script india_floortom_startup 
	loadsound \{'drums/India/india_tom2'}
endscript

script indiagirl_kick_startup 
	loadsound \{'drums/Indiagirl/India_girlkick'}
endscript

script indiagirl_hitom_startup 
	loadsound \{'drums/Indiagirl/India_girl4'}
endscript

script indiagirl_cymbal_startup 
	loadsound \{'drums/Indiagirl/India_girl_longer2'}
endscript

script indiagirl_hihat_startup 
	loadsound \{'drums/Indiagirl/India_girl2'}
	loadsound \{'drums/Indiagirl/India_girl_longer'}
endscript

script indiagirl_snare_startup 
	loadsound \{'drums/Indiagirl/India_girl1'}
endscript

script indiagirl_floortom_startup 
	loadsound \{'drums/Indiagirl/India_girl3'}
endscript

script orchestral_kick_startup 
	loadsound \{'drums/Orchestral/orch_kick'}
endscript

script orchestral_hitom_startup 
	loadsound \{'drums/Orchestral/orch_tom1'}
endscript

script orchestral_cymbal_startup 
	loadsound \{'drums/Orchestral/orch_crash'}
endscript

script orchestral_hihat_startup 
	loadsound \{'drums/Orchestral/orch_hihat'}
endscript

script orchestral_snare_startup 
	loadsound \{'drums/Orchestral/orch_snare'}
endscript

script orchestral_floortom_startup 
	loadsound \{'drums/Orchestral/orch_tom2'}
endscript

script jazzy_kick_startup 
	loadsound \{'drums/Jazzy/j_kick'}
endscript

script jazzy_hitom_startup 
	loadsound \{'drums/Jazzy/j_tom1'}
endscript

script jazzy_cymbal_startup 
	loadsound \{'drums/Jazzy/j_crash'}
endscript

script jazzy_hihat_startup 
	loadsound \{'drums/Jazzy/j_hihat'}
endscript

script jazzy_snare_startup 
	loadsound \{'drums/Jazzy/j_snare'}
endscript

script jazzy_floortom_startup 
	loadsound \{'drums/Jazzy/j_tom2'}
endscript

script scratch_floortom_startup 
	loadsound \{'drums/Scratch/DJ_aahh1'}
	loadsound \{'drums/Scratch/DJ_aahh7'}
	loadsound \{'drums/Scratch/DJ_Laser10'}
	loadsound \{'drums/Scratch/DJ_ugh14'}
	loadsound \{'drums/Scratch/DJ_blast18'}
endscript

script scratch_snare_startup 
	loadsound \{'drums/Scratch/DJ_aahh2'}
	loadsound \{'drums/Scratch/DJ_aahh8'}
	loadsound \{'drums/Scratch/DJ_Laser11'}
	loadsound \{'drums/Scratch/DJ_ugh15'}
	loadsound \{'drums/Scratch/DJ_blast19'}
endscript

script scratch_hihat_startup 
	loadsound \{'drums/Scratch/DJ_aahh3'}
	loadsound \{'drums/Scratch/DJ_aahh9'}
	loadsound \{'drums/Scratch/DJ_stab12'}
	loadsound \{'drums/Scratch/DJ_ugh16'}
	loadsound \{'drums/Scratch/DJ_ahhya20'}
endscript

script scratch_hitom_startup 
	loadsound \{'drums/Scratch/DJ_aahh4'}
	loadsound \{'drums/Scratch/DJ_whew26'}
	loadsound \{'drums/Scratch/DJ_stab13'}
	loadsound \{'drums/Scratch/DJ_ugh17'}
	loadsound \{'drums/Scratch/DJ_ahhya21'}
endscript

script scratch_cymbal_startup 
	loadsound \{'drums/Scratch/DJ_aahh5'}
	loadsound \{'drums/Scratch/DJ_aahh6'}
	loadsound \{'drums/Scratch/DJ_shortbaby23'}
	loadsound \{'drums/Scratch/DJ_ugh26'}
	loadsound \{'drums/Scratch/DJ_whistle28'}
endscript

script scratch_kick_startup 
	loadsound \{'drums/Scratch/DJ_aahhfull31'}
	loadsound \{'drums/Scratch/DJ_rewind29'}
	loadsound \{'drums/Scratch/DJ_backspin22'}
	loadsound \{'drums/Scratch/DJ_fastrewind24'}
	loadsound \{'drums/Scratch/DJ_backforth25'}
endscript

script robot_kick_startup 
	loadsound \{'drums/robot/robot_zero'}
	loadsound \{'drums/robot/robot_one'}
	loadsound \{'drums/robot/robot_two'}
	loadsound \{'drums/robot/robot_three'}
	loadsound \{'drums/robot/robot_rock'}
endscript

script robot_floortom_startup 
	loadsound \{'drums/robot/robot_technology'}
	loadsound \{'drums/robot/robot_beat'}
	loadsound \{'drums/robot/robot_harder'}
	loadsound \{'drums/robot/robot_baby'}
	loadsound \{'drums/robot/robot_bionic'}
endscript

script robot_cymbal_startup 
	loadsound \{'drums/robot/robot_energize'}
	loadsound \{'drums/robot/robot_jam'}
	loadsound \{'drums/robot/robot_on'}
	loadsound \{'drums/robot/robot_it'}
	loadsound \{'drums/robot/robot_future'}
endscript

script robot_hihat_startup 
	loadsound \{'drums/robot/robot_electro'}
	loadsound \{'drums/robot/robot_fire'}
	loadsound \{'drums/robot/robot_faster'}
	loadsound \{'drums/robot/robot_floor'}
	loadsound \{'drums/robot/robot_freak'}
endscript

script robot_snare_startup 
	loadsound \{'drums/robot/robot_boy'}
	loadsound \{'drums/robot/robot_compute'}
	loadsound \{'drums/robot/robot_better'}
	loadsound \{'drums/robot/robot_drop'}
	loadsound \{'drums/robot/robot_electricity'}
endscript

script robot_hitom_startup 
	loadsound \{'drums/robot/robot_fresh'}
	loadsound \{'drums/robot/robot_funky'}
	loadsound \{'drums/robot/robot_stronger'}
	loadsound \{'drums/robot/robot_get'}
	loadsound \{'drums/robot/robot_girl'}
endscript

script scratch_electro_kick_startup 
	loadsound \{'drums/Scratch_Electro/scratch_electro_kick'}
endscript

script scratch_electro_hitom_startup 
	loadsound \{'drums/Scratch_Electro/scratch_electro_tom1'}
endscript

script scratch_electro_cymbal_startup 
	loadsound \{'drums/Scratch_Electro/scratch_electro_crash'}
endscript

script scratch_electro_hihat_startup 
	loadsound \{'drums/Scratch_Electro/scratch_electro_hihat'}
endscript

script scratch_electro_snare_startup 
	loadsound \{'drums/Scratch_Electro/scratch_electro_snare'}
endscript

script scratch_electro_floortom_startup 
	loadsound \{'drums/Scratch_Electro/scratch_electro_tom2'}
endscript

script dub_kick_startup 
	loadsound \{'drums/dub/dub_kick'}
endscript

script dub_hitom_startup 
	loadsound \{'drums/dub/dub_tom1'}
endscript

script dub_cymbal_startup 
	loadsound \{'drums/dub/dub_cymbal'}
endscript

script dub_hihat_startup 
	loadsound \{'drums/dub/dub_hihat'}
endscript

script dub_snare_startup 
	loadsound \{'drums/dub/dub_snare'}
endscript

script dub_floortom_startup 
	loadsound \{'drums/dub/dub_tom2'}
endscript

script pigmy_kick_startup 
	loadsound \{'drums/pigmy/pigmy_kick'}
endscript

script pigmy_hitom_startup 
	loadsound \{'drums/pigmy/pigmy_tom1'}
endscript

script pigmy_cymbal_startup 
	loadsound \{'drums/pigmy/pigmy_cymbal'}
endscript

script pigmy_hihat_startup 
	loadsound \{'drums/pigmy/pigmy_hihat'}
endscript

script pigmy_snare_startup 
	loadsound \{'drums/pigmy/pigmy_snare'}
endscript

script pigmy_floortom_startup 
	loadsound \{'drums/pigmy/pigmy_tom2'}
endscript

script conga_kick_startup 
	loadsound \{'drums/conga/conga_kick'}
endscript

script conga_hitom_startup 
	loadsound \{'drums/conga/conga_tom1'}
endscript

script conga_cymbal_startup 
	loadsound \{'drums/conga/conga_cymbal'}
	loadsound \{'drums/conga/conga_crash'}
endscript

script conga_hihat_startup 
	loadsound \{'drums/conga/conga_hihat'}
endscript

script conga_snare_startup 
	loadsound \{'drums/conga/conga_snare'}
endscript

script conga_floortom_startup 
	loadsound \{'drums/conga/conga_tom2'}
endscript

script gunshot_cymbal_startup 
	loadsound \{'drums/Gunshot/Gun_ricocrash'}
	loadsound \{'drums/Gunshot/Gun_ricochet'}
endscript

script gunshot_floortom_startup 
	loadsound \{'drums/Gunshot/Gun_tom2'}
endscript

script gunshot_hihat_startup 
	loadsound \{'drums/Gunshot/Gun_hihat'}
	loadsound \{'drums/Gunshot/Gun_hihat_open'}
endscript

script gunshot_hitom_startup 
	loadsound \{'drums/Gunshot/Gun_tom1'}
endscript

script gunshot_kick_startup 
	loadsound \{'drums/Gunshot/Gun_kickheavy'}
	loadsound \{'drums/Gunshot/Gun_kickheavy2'}
endscript

script gunshot_snare_startup 
	loadsound \{'drums/Gunshot/Gun_robosnare'}
	loadsound \{'drums/Gunshot/Gun_heavysnare'}
	loadsound \{'drums/Gunshot/Gun_snare'}
endscript

script play_all_drum_samples 
	waittime = 0.3
	velocity = 7
	pad = snare
	printf channel = sfx qs(0xc7e8d4d3) s = <drumset>
	printf channel = sfx qs(0x674e9fff) s = <pad_type>
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
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
	waittime = 0.3
	velocity = 7
	pad = kick
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_snare_samples 
	waittime = 0.3
	velocity = 7
	pad = snare
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_hitom_samples 
	waittime = 0.3
	velocity = 7
	pad = tom1
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_fltom_samples 
	waittime = 0.3
	velocity = 7
	pad = tom2
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_hihat_samples 
	waittime = 0.3
	velocity = 7
	pad = hihat
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script play_cymbal_samples 
	waittime = 0.3
	velocity = 7
	pad = cymbal
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

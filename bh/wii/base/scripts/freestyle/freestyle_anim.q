freestyle_intro_anim_length_secs = 11.0

script z_freestyle_crowd_peds 
	if GotParam \{Name}
		if StructureContains structure = ($Crowd_Profiles) Name = <Name>
			anim_set = ($Crowd_Profiles.<Name>.anim_set)
			Obj_SpawnScriptNow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = Idle}
			return
		endif
	endif
endscript

script freestyle_trigger_oneshot_anim 
	RequireParams \{[
			Player
			anim
		]}
	freestyle_turn_off_ik Player = <Player>
	freestyle_get_player_param Player = <Player> param = character
	<character> :Obj_SwitchScript empty_script
	<character> :Obj_KillSpawnedScript Name = hero_play_adjusting_random_anims
	<character> :hero_play_anim anim = <anim> tempomatching = 0
endscript

script freestyle_begin_default_stance 
	RequireParams \{[
			Player
		]
		all}
	freestyle_turn_on_ik Player = <Player>
	freestyle_get_player_param Player = <Player> param = instrument
	switch (<instrument>)
		case guitar
		stance = ($freestyle_mii_anim_set.guitar_stances [0])
		case bass
		stance = ($freestyle_mii_anim_set.bass_stances [0])
		case drums
		stance = ($freestyle_mii_anim_set.drummer_stance)
		default
		ScriptAssert 'Unhandled instrument %i' i = <instrument>
	endswitch
	freestyle_change_stance Player = <Player> stance = <stance> index = 0
endscript

script freestyle_update_guitarist_hands \{Player = 0}
	getguitarinputproperties Player = <Player>
	if (<pattern_changed> = true)
		freestyle_try_fret_anims event_triggered = <pattern_held> Player = <Player>
	endif
	if ((<strum_changed> = true) && ((<strum_held> = strum_up) || (<strum_held> = strum_down)))
		freestyle_guitarist_strum blendtime = 0.0 Player = <Player>
	endif
endscript

script freestyle_register_stance_index 
	RequireParams \{[
			Player
			index
		]
		all}
	setstructureparam array_name = freestyle_player_data array_index = <Player> param = last_stance_index value = <index>
endscript

script freestyle_request_next_stance 
	RequireParams \{[
			Player
			stance
		]}
	character = ($freestyle_player_data [<Player>].character)
	ExtendCrc <character> '_Info' out = character_info
	Change structurename = <character_info> next_stance = <stance>
endscript

script freestyle_change_stance 
	RequireParams \{[
			stance
			Player
			index
		]
		all}
	character = ($freestyle_player_data [<Player>].character)
	ExtendCrc <character> '_Info' out = character_info
	Change structurename = <character_info> stance = None
	Change structurename = <character_info> next_stance = <stance>
	<character> :Obj_SwitchScript guitarist_idle
	freestyle_register_stance_index Player = <Player> index = <index>
endscript

script freestyle_drummer_play_anim \{anim_target = kick
		anim = gh4_drummer_mii_bassdrum
		hand = 'None'}
	formatText checksumName = branch_name 'mii_drummer_play_drum_branch_%a' a = <hand>
	RequireParams \{[
			character
		]
		all}
	<character> :Anim_Command {
		target = <anim_target>
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $<branch_name>
			BlendDuration = 0.0
			params = {
				drum_anim = <anim>
			}
		}
	}
	if GotParam \{kill_idle}
		formatText checksumName = script_name 'freestyle_drummer_play_idle_%a_hand' a = <hand>
		KillSpawnedScript Name = <script_name>
		SpawnScriptLater <script_name> params = {character = <character>}
	endif
endscript

script freestyle_drummer_play_idle_right_hand 
	RequireParams \{[
			character
		]
		all}
	<character> :Anim_Command {
		target = drumtimerright
		Command = Timer_WaitAnimComplete
	}
	begin
	freestyle_drummer_play_anim anim_target = RightArmPartial anim = gh4_drummer_mii_righthand_idle hand = 'right' character = <character>
	<character> :Anim_Command {
		target = drumtimerright
		Command = Timer_WaitAnimComplete
	}
	repeat
endscript

script freestyle_drummer_play_idle_left_hand 
	RequireParams \{[
			character
		]
		all}
	<character> :Anim_Command {
		target = drumtimerleft
		Command = Timer_WaitAnimComplete
	}
	begin
	freestyle_drummer_play_anim anim_target = LeftArmPartial anim = gh4_drummer_mii_lefthand_idle hand = 'left' character = <character>
	<character> :Anim_Command {
		target = drumtimerleft
		Command = Timer_WaitAnimComplete
	}
	repeat
endscript

script freestyle_try_fret_anims \{event_triggered = 0
		Player = 0}
	highest_gem = -1
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	add_gem = 0
	if ((<gem_mask> = 0) && (<event_triggered> = 0))
		add_gem = 1
	elseif (<gem_mask> && <event_triggered>)
		add_gem = 1
		highest_gem = <gem>
	endif
	<gem> = (<gem> + 1)
	repeat 6
	switch <highest_gem>
		case -1
		freestyle_guitarist_play_fret fret_anim = gh4_guitarist_mii_fret_open Player = <Player>
		case 0
		freestyle_guitarist_play_fret fret_anim = gh4_guitarist_mii_fret_green Player = <Player>
		case 1
		freestyle_guitarist_play_fret fret_anim = gh4_guitarist_mii_fret_red Player = <Player>
		case 2
		freestyle_guitarist_play_fret fret_anim = gh4_guitarist_mii_fret_yellow Player = <Player>
		case 3
		freestyle_guitarist_play_fret fret_anim = gh4_guitarist_mii_fret_blue Player = <Player>
		case 4
		freestyle_guitarist_play_fret fret_anim = gh4_guitarist_mii_fret_orange Player = <Player>
		default
		ScriptAssert \{qs(0xb0a2f962)}
	endswitch
endscript

script freestyle_guitarist_strum \{blendtime = 0.0
		Player = 0}
	character = ($freestyle_player_data [<Player>].character)
	<character> :Anim_Command {
		target = LeftArm
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $mii_guitarist_play_hand_branch
			BlendDuration = <blendtime>
			params = {
				hand_anim = gh4_guitarist_mii_strum
			}
		}
	}
endscript

script freestyle_guitarist_play_fret \{blendtime = 0.1
		fret_anim = gh4_guitarist_mii_fret_open
		Player = 0}
	character = ($freestyle_player_data [<Player>].character)
	<character> :Anim_Command {
		target = RightArm
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $mii_guitarist_play_hand_branch
			BlendDuration = <blendtime>
			params = {
				hand_anim = <fret_anim>
			}
		}
	}
endscript

script freestyle_kill_anim_scripts 
	KillSpawnedScript \{Name = freestyle_drummer_play_idle_right_hand}
	KillSpawnedScript \{Name = freestyle_drummer_play_idle_left_hand}
endscript

script freestyle_turn_off_ik 
	RequireParams \{[
			Player
		]}
	freestyle_get_player_param Player = <Player> param = character
	<character> :Anim_Command {
		target = Ik
		Command = IK_SetChainStrength
		params = {
			Strength = 0.0
			BlendDuration = 0.25
			Chain = Bone_IK_Hand_Guitar_L
		}
	}
	<character> :Anim_Command {
		target = Ik
		Command = IK_SetChainStrength
		params = {
			Strength = 0.0
			BlendDuration = 0.25
			Chain = Bone_IK_Hand_Guitar_R
		}
	}
endscript

script freestyle_turn_on_ik 
	RequireParams \{[
			Player
		]}
	freestyle_get_player_param Player = <Player> param = character
	<character> :Anim_Command {
		target = Ik
		Command = IK_SetChainStrength
		params = {
			Strength = 1.0
			BlendDuration = 0.25
			Chain = Bone_IK_Hand_Guitar_L
		}
	}
	<character> :Anim_Command {
		target = Ik
		Command = IK_SetChainStrength
		params = {
			Strength = 1.0
			BlendDuration = 0.25
			Chain = Bone_IK_Hand_Guitar_R
		}
	}
endscript

script freestyle_play_band_intro_anims 
	SpawnScriptNow \{freestyle_play_band_intro_anims_spawned}
endscript

script get_random_anim_from_array 
	RequireParams \{[
			array
		]
		all}
	GetArraySize <array>
	if (<array_Size> = 0)
		ScriptAssert \{'Animation array list is empty!!'}
	endif
	GetRandomValue a = 0 b = (<array_Size> - 1) Name = i integer
	anim = (<array> [<i>])
	return anim = <anim>
endscript

script freestyle_play_band_intro_anims_spawned 
	Wait \{10
		frames}
	Player = 0
	begin
	SpawnScriptNow freestyle_band_member_intro_spawned params = {Player = <Player>}
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_band_member_intro_spawned 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = instrument
	freestyle_get_player_param Player = <Player> param = character
	switch (<instrument>)
		case guitar
		get_random_anim_from_array array = ($freestyle_mii_anim_set.guitar_intro)
		freestyle_trigger_oneshot_anim Player = <Player> anim = <anim>
		<character> :hero_wait_until_anim_finished
		freestyle_trigger_oneshot_anim Player = <Player> anim = ($freestyle_mii_anim_set.transitions.Intro.GUITARIST)
		<character> :hero_wait_until_anim_finished
		case bass
		get_random_anim_from_array array = ($freestyle_mii_anim_set.bass_intro)
		freestyle_trigger_oneshot_anim Player = <Player> anim = <anim>
		<character> :hero_wait_until_anim_finished
		freestyle_trigger_oneshot_anim Player = <Player> anim = ($freestyle_mii_anim_set.transitions.Intro.BASSIST)
		<character> :hero_wait_until_anim_finished
	endswitch
	freestyle_begin_default_stance Player = <Player>
endscript

script freestyle_play_single_anim 
	RequireParams \{[
			Player
			anim
		]
		all}
	SpawnScriptNow freestyle_play_single_anim_spawned params = <...>
endscript

script freestyle_play_single_anim_spawned 
	RequireParams \{[
			Player
			anim
		]
		all}
	freestyle_trigger_oneshot_anim Player = <Player> anim = <anim>
	freestyle_get_player_param Player = <Player> param = character
	<character> :hero_wait_until_anim_finished
	freestyle_get_player_param Player = <Player> param = instrument
	switch <instrument>
		case guitar
		freestyle_trigger_oneshot_anim Player = <Player> anim = ($freestyle_mii_anim_set.transitions.solo.GUITARIST)
		<character> :hero_wait_until_anim_finished
		case bass
		freestyle_trigger_oneshot_anim Player = <Player> anim = ($freestyle_mii_anim_set.transitions.solo.BASSIST)
		<character> :hero_wait_until_anim_finished
	endswitch
	freestyle_begin_default_stance Player = <Player>
endscript

script freestyle_play_solo_end_anim 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_player_param Player = <Player> param = instrument
	if ((<instrument> = guitar) || (<instrument> = bass))
		celebration_set = ($freestyle_mii_anim_set.solo_celebration)
		GetArraySize <celebration_set>
		GetRandomValue Name = rand_index a = 0 b = (<array_Size> -1) integer
		freestylerecordsoloanimation player_index = <Player> anim_index = <rand_index>
		celebration = (<celebration_set> [<rand_index>])
		freestyle_play_single_anim Player = <Player> anim = <celebration>
	endif
endscript

script freestyle_kill_spawned_anim_scripts 
	KillSpawnedScript \{Name = freestyle_play_band_intro_anims_spawned}
	KillSpawnedScript \{Name = freestyle_play_band_outro_anims_spawned}
	KillSpawnedScript \{Name = freestyle_play_single_anim_spawned}
endscript

script freestyle_wait_for_oneshot_anims 
	Player = 0
	begin
	freestyle_get_player_param Player = <Player> param = character
	freestyle_get_player_param Player = <Player> param = instrument
	switch (<instrument>)
		case guitar
		case bass
		<character> :hero_wait_until_anim_finished
	endswitch
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_play_band_outro_anims 
	SpawnScriptNow \{freestyle_play_band_outro_anims_spawned}
endscript

script freestyle_play_band_outro_anims_spawned 
	Player = 0
	begin
	freestyle_get_player_param Player = <Player> param = instrument
	switch (<instrument>)
		case guitar
		get_random_anim_from_array array = ($freestyle_mii_anim_set.guitar_outro)
		freestyle_trigger_oneshot_anim Player = <Player> anim = <anim>
		case bass
		get_random_anim_from_array array = ($freestyle_mii_anim_set.bass_outro)
		freestyle_trigger_oneshot_anim Player = <Player> anim = <anim>
	endswitch
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	freestyle_wait_for_oneshot_anims
endscript

script freestyle_are_outro_anims_playing 
	if ScriptIsRunning \{freestyle_play_band_outro_anims_spawned}
		return \{true}
	endif
	return \{FALSE}
endscript

script freestyle_start_anim_loops 
	Player = 0
	begin
	freestyle_begin_default_stance Player = <Player>
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

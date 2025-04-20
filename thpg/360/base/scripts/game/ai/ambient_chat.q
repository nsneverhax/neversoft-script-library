chat_comment_cooldown_seconds = 300
chat_anim_cooldown_seconds = 30
chat_contexts = {
	generic = {
		generic_male = [
			Male01_Excited_Generic01
			Male01_Excited_Generic02
			Male01_Excited_Generic03
			Male01_Excited_Generic04
			Male01_Excited_Generic07
			Male01_Neutral_Generic01
			Male01_Neutral_Generic02
			Male01_Neutral_Generic03
			Male01_Neutral_Generic04
			Male01_Neutral_Generic05
		]
		Generic_Male02 = [
			Male02_Excited_Generic05
			Male02_Excited_Generic06
			Male02_Neutral_Generic06
			Male02_Neutral_Generic07
			Male02_Neutral_Generic08
			Male02_Neutral_Generic09
		]
		Generic_Female = [
			Female01_SmellyGuy
			Female01_LostGame
			Female01_HeyBeautiful
			Female01_StockUp
			Female01_Hardcore
			Female01_Rigger
			Female01_Pro
			Female01_Homeless
			Female01_SkatersInTown
			Female01_ClothingStores
			Female01_TrafficLights
		]
	}
	dc = {
		generic_male = [
			Male01_Riot
		]
		Generic_Male02 = [
			Male02_Riot
		]
		Generic_Female = [
			Female01_Riot
		]
	}
}
chat_comments = {
	Male01_Excited_Generic01 = {
		vo_event = VO_Chat_Male1_ExcitedST_Generic01
		comment_type = excited
		response_type = ExcitedAgree
	}
	Male01_Excited_Generic02 = {
		vo_event = VO_Chat_Male1_ExcitedST_Generic02
		comment_type = excited
		response_type = ExcitedDisagree
	}
	Male01_Excited_Generic03 = {
		vo_event = VO_Chat_Male1_ExcitedST_Generic03
		comment_type = excited
		response_type = ExcitedAgree
	}
	Male01_Excited_Generic04 = {
		vo_event = VO_Chat_Male1_ExcitedST_Generic04
		comment_type = excited
		response_type = ExcitedDisagree
	}
	Male02_Excited_Generic05 = {
		vo_event = VO_Chat_Male2_ExcitedST_Generic05
		comment_type = excited
		response_type = ExcitedAgree
	}
	Male02_Excited_Generic06 = {
		vo_event = VO_Chat_Male2_ExcitedST_Generic06
		comment_type = excited
		response_type = NeutralDisagree
	}
	Male01_Excited_Generic07 = {
		vo_event = VO_Chat_Male1_ExcitedST_Generic07
		comment_type = excited
		response_type = ExcitedAgree
	}
	Male01_Neutral_Generic01 = {
		vo_event = VO_Chat_Male1_NeutralST_Generic01
		comment_type = neutral
		response_type = NeutralModerate
	}
	Male01_Neutral_Generic02 = {
		vo_event = VO_Chat_Male1_NeutralST_Generic02
		comment_type = neutral
		response_type = NeutralDisagree
	}
	Male01_Neutral_Generic03 = {
		vo_event = VO_Chat_Male1_NeutralST_Generic03
		comment_type = neutral
		response_type = NeutralAgree
	}
	Male01_Neutral_Generic04 = {
		vo_event = VO_Chat_Male1_NeutralST_Generic04
		comment_type = neutral
		response_type = NeutralAgree
	}
	Male01_Neutral_Generic05 = {
		vo_event = VO_Chat_Male1_NeutralST_Generic05
		comment_type = neutral
		response_type = NeutralAgree
	}
	Male02_Neutral_Generic06 = {
		vo_event = VO_Chat_Male2_NeutralST_Generic06
		comment_type = neutral
		response_type = NeutralModerate
	}
	Male02_Neutral_Generic07 = {
		vo_event = VO_Chat_Male2_NeutralST_Generic07
		comment_type = neutral
		response_type = NeutralDisagree
	}
	Male02_Neutral_Generic08 = {
		vo_event = VO_Chat_Male2_NeutralST_Generic08
		comment_type = neutral
		response_type = NeutralAgree
	}
	Male02_Neutral_Generic09 = {
		vo_event = VO_Chat_Male2_NeutralST_Generic09
		comment_type = neutral
		response_type = NeutralModerate
	}
}
chat_comment_pose_associations = {
	Sit = {
		neutral = [
		]
		excited = [
		]
	}
	stand = {
		neutral = [
			PedM_NS_Talk01_F
			PedM_NS_Talk02_F
			PedM_NS_Talk03_F
			PedM_NS_Talk04_F
			PedM_NS_Talk05_F
		]
		excited = [
			PedM_NS_Talk01_F
			PedM_NS_Talk02_F
			PedM_NS_Talk03_F
			PedM_NS_Talk04_F
			PedM_NS_Talk05_F
		]
	}
}
chat_responses = {
	NeutralAgree = {
		generic_male = [
			VO_Chat_Male1_NPR_01
			VO_Chat_Male1_NPR_02
			VO_Chat_Male1_NPR_03
			VO_Chat_Male1_NPR_04
			VO_Chat_Male1_NPR_05
			VO_Chat_Male1_NPR_06
			VO_Chat_Male1_NPR_07
			VO_Chat_Male1_NPR_08
			VO_Chat_Male1_NPR_09
			VO_Chat_Male1_NPR_10
			VO_Chat_Male1_NPR_11
			VO_Chat_Male1_NPR_12
			VO_Chat_Male1_NPR_13
			VO_Chat_Male1_NPR_14
			VO_Chat_Male1_NPR_15
		]
		Generic_Male02 = [
			VO_Chat_Male2_NPR_01
			VO_Chat_Male2_NPR_02
			VO_Chat_Male2_NPR_03
			VO_Chat_Male2_NPR_04
			VO_Chat_Male2_NPR_05
			VO_Chat_Male2_NPR_06
			VO_Chat_Male2_NPR_07
			VO_Chat_Male2_NPR_08
			VO_Chat_Male2_NPR_09
			VO_Chat_Male2_NPR_10
			VO_Chat_Male2_NPR_11
			VO_Chat_Male2_NPR_12
			VO_Chat_Male2_NPR_13
			VO_Chat_Male2_NPR_14
		]
		Generic_Female = [
			VO_Chat_Chat_Female01_Nuetral01
			VO_Chat_Chat_Female01_Nuetral02
			VO_Chat_Chat_Female01_Nuetral03
			VO_Chat_Chat_Female01_Positive01
			VO_Chat_Chat_Female01_Positive02
			VO_Chat_Chat_Female01_Positive03
		]
	}
	NeutralModerate = {
		generic_male = [
			VO_Chat_Male1_NMR_01
			VO_Chat_Male1_NMR_02
			VO_Chat_Male1_NMR_03
			VO_Chat_Male1_NMR_04
			VO_Chat_Male1_NMR_05
			VO_Chat_Male1_NMR_06
			VO_Chat_Male1_NMR_07
			VO_Chat_Male1_NMR_08
			VO_Chat_Male1_NMR_09
			VO_Chat_Male1_NMR_10
			VO_Chat_Male1_NMR_11
			VO_Chat_Male1_NMR_12
			VO_Chat_Male1_NMR_13
			VO_Chat_Male1_NMR_14
			VO_Chat_Male1_NMR_15
		]
		Generic_Male02 = [
			VO_Chat_Male2_NMR_01
			VO_Chat_Male2_NMR_02
			VO_Chat_Male2_NMR_03
			VO_Chat_Male2_NMR_04
			VO_Chat_Male2_NMR_05
			VO_Chat_Male2_NMR_06
			VO_Chat_Male2_NMR_07
			VO_Chat_Male2_NMR_08
			VO_Chat_Male2_NMR_09
			VO_Chat_Male2_NMR_10
			VO_Chat_Male2_NMR_11
			VO_Chat_Male2_NMR_12
			VO_Chat_Male2_NMR_13
			VO_Chat_Male2_NMR_14
			VO_Chat_Male2_NMR_15
		]
	}
	NeutralDisagree = {
		generic_male = [
			VO_Chat_Male1_NNR_01
			VO_Chat_Male1_NNR_02
			VO_Chat_Male1_NNR_03
			VO_Chat_Male1_NNR_04
			VO_Chat_Male1_NNR_05
			VO_Chat_Male1_NNR_06
			VO_Chat_Male1_NNR_07
			VO_Chat_Male1_NNR_08
			VO_Chat_Male1_NNR_09
			VO_Chat_Male1_NNR_10
			VO_Chat_Male1_NNR_11
			VO_Chat_Male1_NNR_12
			VO_Chat_Male1_NNR_13
			VO_Chat_Male1_NNR_14
			VO_Chat_Male1_NNR_15
			VO_Chat_Male1_NNR_16
		]
		Generic_Male02 = [
			VO_Chat_Male2_NNR_01
			VO_Chat_Male2_NNR_02
			VO_Chat_Male2_NNR_03
			VO_Chat_Male2_NNR_04
			VO_Chat_Male2_NNR_05
			VO_Chat_Male2_NNR_06
			VO_Chat_Male2_NNR_07
			VO_Chat_Male2_NNR_08
			VO_Chat_Male2_NNR_09
			VO_Chat_Male2_NNR_10
			VO_Chat_Male2_NNR_11
			VO_Chat_Male2_NNR_12
			VO_Chat_Male2_NNR_13
			VO_Chat_Male2_NNR_14
			VO_Chat_Male2_NNR_15
			VO_Chat_Male2_NNR_16
		]
		Generic_Female = [
			VO_Chat_Chat_Female01_Negative01
			VO_Chat_Chat_Female01_Negative02
			VO_Chat_Chat_Female01_Negative03
		]
	}
	ExcitedAgree = {
		generic_male = [
			VO_Chat_Male1_EPR_01
			VO_Chat_Male1_EPR_02
			VO_Chat_Male1_EPR_03
			VO_Chat_Male1_EPR_04
			VO_Chat_Male1_EPR_05
			VO_Chat_Male1_EPR_06
			VO_Chat_Male1_EPR_07
			VO_Chat_Male1_EPR_08
			VO_Chat_Male1_EPR_09
			VO_Chat_Male1_EPR_10
		]
		Generic_Male02 = [
			VO_Chat_Male2_EPR_01
			VO_Chat_Male2_EPR_02
			VO_Chat_Male2_EPR_03
			VO_Chat_Male2_EPR_04
			VO_Chat_Male2_EPR_05
			VO_Chat_Male2_EPR_06
			VO_Chat_Male2_EPR_07
			VO_Chat_Male2_EPR_08
			VO_Chat_Male2_EPR_09
			VO_Chat_Male2_EPR_10
		]
		Generic_Female = [
			VO_Chat_Chat_Female01_Positive01
			VO_Chat_Chat_Female01_Positive02
			VO_Chat_Chat_Female01_Positive03
			VO_Chat_Chat_Female01_Suprised01
			VO_Chat_Chat_Female01_Suprised02
			VO_Chat_Chat_Female01_Suprised03
		]
	}
	ExcitedDisagree = {
		generic_male = [
			VO_Chat_Male1_ENR_01
			VO_Chat_Male1_ENR_02
			VO_Chat_Male1_ENR_03
			VO_Chat_Male1_ENR_04
			VO_Chat_Male1_ENR_05
			VO_Chat_Male1_ENR_06
			VO_Chat_Male1_ENR_07
			VO_Chat_Male1_ENR_08
			VO_Chat_Male1_ENR_09
			VO_Chat_Male1_ENR_10
		]
		Generic_Male02 = [
			VO_Chat_Male2_ENR_01
			VO_Chat_Male2_ENR_02
			VO_Chat_Male2_ENR_03
			VO_Chat_Male2_ENR_04
			VO_Chat_Male2_ENR_05
			VO_Chat_Male2_ENR_06
			VO_Chat_Male2_ENR_07
			VO_Chat_Male2_ENR_08
			VO_Chat_Male2_ENR_09
		]
		Generic_Female = [
			VO_Chat_Chat_Female01_Negative01
			VO_Chat_Chat_Female01_Negative02
			VO_Chat_Chat_Female01_Negative03
		]
	}
}
chat_response_pose_associations = {
	Sit = {
		NeutralAgree = [
		]
		NeutralDisagree = [
		]
		ExcitedAgree = [
		]
		ExcitedDisagree = [
		]
	}
	stand = {
		NeutralAgree = [
			PedM_NPR_Talk01_F
			PedM_NPR_Talk02_F
			PedM_NPR_Talk03_F
			PedM_NPR_Talk04_F
		]
		NeutralDisagree = [
			PedM_NNR_Talk01_F
			PedM_NNR_Talk02_F
			PedM_NNR_Talk03_F
			PedM_NNR_Talk04_F
			PedM_NNR_Talk05_F
		]
		ExcitedAgree = [
			PedM_EPR_Talk01_F
			PedM_EPR_Talk03_F
			PedM_EPR_Talk03_F
			PedM_EPR_Talk04_F
		]
		ExcitedDisagree = [
			PedM_ENR_Talk01_F
			PedM_ENR_Talk02_F
			PedM_ENR_Talk03_F
			PedM_ENR_Talk04_F
			PedM_ENR_Talk05_F
		]
		NeutralModerate = [
			PedM_NPR_Talk01_F
			PedM_NPR_Talk02_F
			PedM_NPR_Talk03_F
			PedM_NPR_Talk04_F
		]
	}
}

script AnimScript_Chat_Talk 
	sound_params = {
		stream_priority = 50
		logic_priority = 50
		animate_mouth = true
		started_event_id = Chat_VO_Started
		finished_event_id = Chat_VO_Finished
		failed_event_id = Chat_VO_Failed
		buss_id = ChatVO
		no_pitch_mod = false
		use_pos_info = true
		can_use_stream = true
	}
	soundevent {event = <vo_event> <sound_params>}
	blockuntilevent type = Chat_VO_Started
	Interact_PlayAnim {
		anim = <anim>
		reaction_state = normal
		blend_period = 0.2
	}
	blockuntilevent anytypes = [Chat_VO_Finished Chat_VO_Failed]
endscript

script AnimScript_Chat_Idle 
	begin
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 1
				anim = PedM_WaitingBus02
				reaction_state = normal
			}
			{
				weight = 1
				anim = PedM_Waiting03
				reaction_state = normal
			}
			{
				weight = 3
				anim = PedM_Idle02_F
				reaction_state = normal
			}
		]
		reaction_state = transition
		blend_period = 0.4}
	repeat
endscript

script Get_Chat_Data pose = stand
	<ped1> :Chat_GetVoiceProfile
	GetBestChat voice_profile = <voice_profile>
	<chat_data> = ($chat_comments.<chat>)
	printstruct <...>
	<comment_vo> = (<chat_data>.vo_event)
	<comment_type> = (<chat_data>.comment_type)
	Chat_GetBestAnim anims = ($chat_comment_pose_associations.<pose>.<comment_type>)
	<comment_anim> = <anim>
	<response_type> = (<chat_data>.response_type)
	<ped2> :Chat_GetVoiceProfile
	Chat_GetBestResponse responses = ($chat_responses.<response_type>.<voice_profile>)
	Chat_GetBestAnim anims = ($chat_response_pose_associations.<pose>.<response_type>)
	<response_anim> = <anim>
	return {comment_anim = <comment_anim> response_anim = <response_anim> comment_vo = <comment_vo> response_vo = <response_vo>}
endscript

script Chat_GetBestResponse 
	getrandomarrayelement \{responses}
	return response_vo = <element>
endscript

script Chat_GetVoiceProfile 
	getsingletag \{voice_profile}
	if NOT gotparam \{voice_profile}
		softassert \{"WARNING: No voice profile set a chat ped! Defaulting to generic_male"}
		<voice_profile> = generic_male
	endif
	return voice_profile = <voice_profile>
endscript

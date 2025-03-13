nondrummer_anim_node_ids = [
	body
	bodytimer
	moment_blend
	moment_branch
	momenttimer
	strumtimer
	frettimer
	fingertimer
	facialtimer
	ik
	righthandik
	lefthandik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
	strum_anim_mod
	fret_anim_mod
	chord_anim_mod
	chordhandnode
	strumhandnode
	low_chord
	med_chord
	high_chord
	maleanimadjust
	maleanimadjust_moment
	tweakbonesnode
	mirrornode
	femalediff
	vocal_face_mod
	lipflap
	heel
	fat
	enable_new_strum
	dynamic_strums
	righthandpartial
	dynamic_strum_base
	dynamic_strum_roll_high
	dynamic_strum_roll_mid
	dynamic_strum_roll_low
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
]
vocalist_anim_node_ids = [
	vocalist_pose_node
	body
	bodytimer
	moment_blend
	moment_branch
	momenttimer
	facialtimer
	ik
	righthandik
	lefthandik
	face
	maleanimadjust
	maleanimadjust_moment
	tweakbonesnode
	mirrornode
	femalediff
	vocal_face_mod
	lipflap
	heel
	fat
	autovocals_switch
	autovocals_mouth_idle
	db_phonemes
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
]
drummer_anim_node_ids = [
	body
	bodytimer
	facialtimer
	ik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
	femalediff
	drumkit
	moment_branch
	moment_blend
	momenttimer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	tweakbonesnode
	mirrornode
	heel
	fat
	db_eye_lookat
	db_head_lookat
	eye_lookat_switch
	eye_lookat_type
]

script get_anim_struct_member 
	if gotparam \{loading_into_song}
		if songfilemanager func = has_perf_file song_name = <loading_into_song>
			get_song_prefix song = <loading_into_song>
			gamemode_gettype
			if (<type> = career)
				if NOT structurecontains structure = $download_songlist_props <loading_into_song>
					get_band_configuration song = <loading_into_song>
					if (<band> != default_band)
						if venue_should_use_song_performance song = <loading_into_song>
							if (<anim_struct> = car_female_anim_struct)
								anim_struct = car_female_alt_anim_struct
							else
								anim_struct = car_male_alt_anim_struct
							endif
						endif
					endif
				endif
			endif
			extendcrc <anim_struct> '_' out = song_anim_struct_name
			extendcrc <song_anim_struct_name> <song_prefix> out = song_anim_struct_name
			if songfilemanager func = get_song_anim_struct song_name = <loading_into_song> anim_struct_name = <song_anim_struct_name>
				if structurecontains structure = <song_anim_struct> <member>
					return true anim_struct_member = (<song_anim_struct>.<member>)
				elseif (<member> = bass)
					if structurecontains structure = <song_anim_struct> guitar
						return true anim_struct_member = (<song_anim_struct>.guitar)
					endif
				endif
			endif
		endif
	endif
	if globalexists name = <anim_struct> type = structure
		if structurecontains structure = ($<anim_struct>) <member>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass)
			if structurecontains structure = ($<anim_struct>) guitar
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	return \{false}
endscript

script unload_band_song_anims \{song = unknown}
	printf \{qs(0xaf472415)}
	band_stop_anims
	band_unload_song_anim_paks song = <song> async = <async>
endscript

script emptyscript 
endscript

script hero_play_strum_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = rightarm}
		anim_command {
			target = rightarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_strumming_branch
				blendduration = $strum_anim_blend_time
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script band_play_strum_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_strum_anim anim = <anim>
	endif
endscript

script hero_play_fret_anim \{blendduration = $fret_blend_time}
	if anim_animnodeexists \{id = leftarm}
		anim_command {
			target = leftarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_fret_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_fret_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_fret_anim anim = <anim>
	endif
endscript

script hero_play_finger_anim \{blendduration = 0.2}
	if anim_animnodeexists \{id = lefthand}
		anim_command {
			target = lefthand
			command = degenerateblend_addbranch
			params = {
				tree = $hero_finger_branch
				blendduration = <blendduration>
				params = {
					finger_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_finger_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_finger_anim anim = <anim>
	endif
endscript

script hero_play_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		obj_getid
		extendcrc <objid> '_Info' out = info_struct
		part = ($<info_struct>.part)
		if (<part> = vocals)
			tree = $vocalist_face_branch
		else
			tree = $hero_face_branch
		endif
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = <tree>
				blendduration = <blendduration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = $hero_empty_branch
				blendduration = <blendduration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim \{heel_anim = 0
		fat_anim = 0}
	if (<heel_anim> != 0)
		anim_command target = heel command = applyheeldifference_setanim params = {anim = <heel_anim>}
	endif
	if (<fat_anim> != 0)
		if anim_animnodeexists \{id = fat}
			anim_command target = fat command = applyfatdifference_setanim params = {anim = <fat_anim>}
		endif
	endif
endscript

script hero_wait_until_anim_finished \{timer = bodytimer}
	begin
	if hero_anim_complete timer = <timer>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_complete \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_isanimcomplete
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script handle_moment_anim_blending 
	obj_getid
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.0
		}}
	anim_command \{target = momenttimer
		command = timer_waitanimcomplete}
	wait \{2
		gameframes}
	end_moment_anim
endscript

script end_moment_anim 
	obj_getid
	obj_killspawnedscript \{name = handle_drummer_moment_anim_blending}
	if anim_animnodeexists \{id = moment_blend}
		anim_command \{target = moment_blend
			command = partialswitch_setstate
			params = {
				off
				blendduration = 0.0
			}}
		anim_command \{target = moment_branch
			command = degenerateblend_addbranch
			params = {
				tree = $hero_empty_branch
				blendduration = 0.0
			}}
	endif
	extendcrc <objid> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<part> = guitar || <part> = bass)
		chain = guitar
	else
		chain = slave
	endif
	band_setikchain name = <objid> chain = <chain>
	obj_teleport
	wait \{1
		gameframe}
	getsingletag \{frontend_character}
	if (<frontend_character> = 0)
		band_movetostartnode name = <objid>
	endif
endscript

script handle_drummer_moment_anim_blending 
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.1
		}}
	anim_command \{target = momenttimer
		command = timer_waitanimcomplete}
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.1
		}}
endscript

script hide_mic 
	switchoffatomic \{cas_mic}
	switchoffatomic \{cas_mic_stand}
endscript

script show_mic 
	switchonatomic \{cas_mic}
	switchonatomic \{cas_mic_stand}
endscript

script hide_mic_stand 
	switchoffatomic \{cas_mic_stand}
endscript

script show_mic_stand 
	switchonatomic \{cas_mic_stand}
endscript

script hide_mic_microphone 
	switchoffatomic \{cas_mic}
endscript

script show_mic_microphone 
	switchonatomic \{cas_mic}
endscript

script hide_drumkit 
	switchoffatomic \{cas_drums}
endscript

script show_drumkit 
	switchonatomic \{cas_drums}
endscript
disable_tempo_matching_for_guitarist = 0
disable_tempo_matching_for_bassist = 0
disable_tempo_matching_for_vocalist = 0
disable_tempo_matching_for_drummer = 0

script disable_tempo \{name = none}
	switch <name>
		case all
		change \{disable_tempo_matching_for_guitarist = 1}
		change \{disable_tempo_matching_for_bassist = 1}
		change \{disable_tempo_matching_for_vocalist = 1}
		change \{disable_tempo_matching_for_drummer = 1}
		case guitarist
		change \{disable_tempo_matching_for_guitarist = 1}
		case bassist
		change \{disable_tempo_matching_for_bassist = 1}
		case vocalist
		change \{disable_tempo_matching_for_vocalist = 1}
		case drummer
		change \{disable_tempo_matching_for_drummer = 1}
		default
		scriptassert
	endswitch
endscript

script enable_tempo \{name = all}
	switch <name>
		case all
		change \{disable_tempo_matching_for_guitarist = 0}
		change \{disable_tempo_matching_for_bassist = 0}
		change \{disable_tempo_matching_for_vocalist = 0}
		change \{disable_tempo_matching_for_drummer = 0}
		case guitarist
		change \{disable_tempo_matching_for_guitarist = 0}
		case bassist
		change \{disable_tempo_matching_for_bassist = 0}
		case vocalist
		change \{disable_tempo_matching_for_vocalist = 0}
		case drummer
		change \{disable_tempo_matching_for_drummer = 0}
		default
		scriptassert
	endswitch
endscript

script vocalist_facial_animations_start \{blendtime = 0.3}
	anim_command target = vocal_face_mod command = modulate_startblend params = {blendtime = <blendtime> blendcurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{blendtime = 0.3}
	anim_command target = vocal_face_mod command = modulate_startblend params = {blendtime = <blendtime> blendcurve = [0 1]}
endscript
generic_static_tree = {
	type = degenerateblend
	id = body
}
guitarist_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = avatarface
			[
				{
					type = applydifference
					[
						{
							type = degenerateblend
							id = db_eye_lookat
							default_degeneration_duration = 0.0
						}
						{
							type = partialswitch
							state = off
							id = eye_lookat_switch
							[
								{
									type = switchclearbones
									state = off
									id = eye_lookat_type
								}
								{
									type = applypartial
									[
										{
											type = degenerateblend
											id = db_head_lookat
											default_degeneration_duration = 0.0
										}
										{
											type = applyheeldifference
											id = heel
											[
												{
													type = ik
													two_bone_chains = ik_params
													id = ik
													[
														{
															type = chordhand
															id = chordhandnode
															min_twist = 17.62
															max_twist = 145.40999
															min_roll = -7.3700004
															max_roll = 169.1
															hand_bone = bone_guitar_fret_pos
															elbow_bone = elbow_bone_chord
															negate_rolls = negate_rolls
															[
																{
																	type = ik
																	two_bone_chains = hero_ik_hand_l_params
																	id = lefthandik
																	[
																		{
																			type = tweakbones
																			id = tweakbonesnode
																			[
																				{
																					type = partialswitch
																					state = on
																					[
																						{
																							type = tensionstorage
																							min_stress_anim = face_tension_min
																							max_stress_anim = face_tension_max
																							active = use_face_tension
																							[
																								{
																									type = degenerateblend
																									id = face
																								}
																							]
																						}
																						{
																							type = applydifference
																							id = lefthandpartial
																							[
																								{
																									$hero_arm_branch
																								}
																								{
																									type = chordhand
																									id = strumhandnode
																									min_twist = 40.0
																									max_twist = 150.0
																									min_roll = -0.0
																									max_roll = 65.0
																									hand_bone = bone_guitar_body
																									elbow_bone = elbow_bone_strum
																									enable_debug_output = false
																									[
																										{
																											type = ik
																											two_bone_chains = hero_ik_hand_r_params
																											id = righthandik
																											[
																												{
																													type = applyfatdifference
																													id = fat
																													[
																														{
																															type = applypartial
																															id = righthandpartial
																															strength = 1.0
																															[
																																{
																																	type = degenerateblend
																																	id = dynamic_strum_base
																																}
																																{
																																	type = switch
																																	state = off
																																	id = moment_blend
																																	[
																																		{
																																			type = applyfemaledifference
																																			id = maleanimadjust_moment
																																			anim = gh_rocker_female_guitarraise_d
																																			[
																																				{
																																					type = degenerateblend
																																					id = moment_branch
																																				}
																																			]
																																		}
																																		{
																																			type = applyfemaledifference
																																			id = maleanimadjust
																																			anim = gh_rocker_female_guitarraise_d
																																			[
																																				{
																																					type = degenerateblend
																																					id = body
																																				}
																																			]
																																		}
																																	]
																																}
																															]
																														}
																													]
																												}
																											]
																										}
																										{
																											type = degenerateblend
																											id = dynamic_strum_roll_high
																										}
																										{
																											type = degenerateblend
																											id = dynamic_strum_roll_mid
																										}
																										{
																											type = degenerateblend
																											id = dynamic_strum_roll_low
																										}
																									]
																								}
																							]
																						}
																					]
																				}
																			]
																		}
																	]
																}
																{
																	type = degenerateblend
																	id = low_chord
																}
																{
																	type = degenerateblend
																	id = med_chord
																}
																{
																	type = degenerateblend
																	id = high_chord
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
frontend_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = avatarface
			[
				{
					type = applyheeldifference
					id = heel
					[
						{
							type = ik
							two_bone_chains = ik_params
							id = ik
							[
								{
									type = applyfatdifference
									id = fat
									[
										{
											type = applyfemaledifference
											id = maleanimadjust
											anim = gh_rocker_female_guitarraise_d
											[
												{
													type = applyfemaledrummerdifference
													id = femalediff
													[
														{
															type = tweakbones
															id = tweakbonesnode
															[
																{
																	type = partialswitch
																	state = on
																	[
																		{
																			type = degenerateblend
																			id = face
																		}
																		{
																			type = applydifference
																			id = lefthandpartial
																			[
																				{
																					$hero_arm_branch
																				}
																				{
																					type = partialswitch
																					state = off
																					id = moment_blend
																					[
																						{
																							type = degenerateblend
																							id = moment_branch
																						}
																						{
																							type = degenerateblend
																							id = body
																						}
																					]
																				}
																			]
																		}
																	]
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_arm_branch = {
	type = add
	[
		{
			type = modulate
			strength = 1.0
			id = fret_anim_mod
			[
				{
					type = degenerateblend
					id = leftarm
				}
			]
		}
		{
			type = modulate
			strength = 1.0
			id = strum_anim_mod
			[
				{
					type = degenerateblend
					id = dynamic_strums
				}
			]
		}
	]
}
dynamic_strum_source = {
	type = source
	anim = anim
}
dynamic_strum_branch = {
	type = add
	[
		{
			type = play
			start = startanim
			[
				{
					type = source
					anim = strumanim
				}
			]
		}
		{
			type = source
			anim = baseanim
		}
	]
}
dynamic_strum_idle_branch = {
	type = add
	[
		{
			type = cycle
			start = startanim
			[
				{
					type = source
					anim = strumanim
				}
			]
		}
		{
			type = source
			anim = baseanim
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_moment_branch = {
	type = timer_type
	id = momenttimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = play
	id = strumtimer
	anim = strum_name
	[
		{
			type = source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = play
	id = frettimer
	anim = fret_anim
	[
		{
			type = source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = play
	id = fingertimer
	anim = finger_anim
	[
		{
			type = source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = play
	id = facialtimer
	anim = facial_anim
	[
		{
			type = facialhacksource
			anim = facial_anim
		}
	]
}
hero_face_branch_cycle = {
	type = cycle
	id = facialtimer
	anim = facial_anim
	[
		{
			type = facialhacksource
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	type = playnodurationblending
	id = facialtimer
	anim = facial_anim
	[
		{
			type = facialhacksource
			anim = facial_anim
		}
	]
}
drummer_face_branch_blend = {
	type = cycle
	id = facialtimer
	anim = idle_anim
	[
		{
			type = blendonactivevalue
			active_value_source = av_drum_face_rock
			[
				{
					type = facialhacksource
					anim = idle_anim
				}
				{
					type = facialhacksource
					anim = rocking_anim
				}
			]
		}
	]
}
hero_play_branch = {
	type = play
	id = timer_id
	anim = anim_name
	[
		{
			type = source
			anim = anim_name
		}
	]
}
hero_cycle_branch = {
	type = cycle
	id = timer_id
	anim = anim_name
	start = start_time
	[
		{
			type = source
			anim = anim_name
		}
	]
}
hero_empty_branch = {
	type = blank
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			type = source
			anim = anim_name
		}
	]
}
vocalist_static_tree = $vocalist_static_tree_poselog
vocalist_static_tree_poselog = {
	type = poselog
	start_recording = false
	output_space = model
	id = vocalist_pose_node
	[
		{
			$vocalist_static_tree_standard
		}
	]
}
vocalist_static_tree_standard = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ik
			two_bone_chains = singer_ik_params_arms
			id = ik
			[
				{
					type = avatarface
					[
						{
							type = applyheeldifference
							id = heel
							[
								{
									type = ik
									two_bone_chains = singer_ik_params_legs
									id = ik
									[
										{
											type = applyfatdifference
											id = fat
											[
												{
													type = tweakbones
													id = tweakbonesnode
													[
														{
															type = applydifference
															[
																{
																	type = degenerateblend
																	id = db_eye_lookat
																	default_degeneration_duration = 0.0
																}
																{
																	type = partialswitch
																	state = off
																	id = eye_lookat_switch
																	[
																		{
																			type = switchclearbones
																			state = off
																			id = eye_lookat_type
																		}
																		{
																			type = applypartial
																			[
																				{
																					type = degenerateblend
																					id = db_head_lookat
																					default_degeneration_duration = 0.0
																				}
																				{
																					type = partialswitch
																					state = off
																					id = autovocals_switch
																					[
																						{
																							type = applydifference
																							strength = 1.0
																							[
																								{
																									type = add
																									[
																										{
																											type = cycle
																											anim_events = off
																											[
																												{
																													type = source
																													anim = gh_av_male_blinks
																												}
																											]
																										}
																										{
																											type = modulateonactivevalue
																											active_value_source = av_brow_mod
																											[
																												{
																													type = timeonactivevalue
																													active_value_source = av_brow_scrub
																													anim_events = off
																													[
																														{
																															type = blendonactivevalue
																															active_value_source = av_brow_emot
																															[
																																{
																																	type = source
																																	anim = gh_av_male_brow_inner
																																}
																																{
																																	type = source
																																	anim = gh_av_male_brow_outter
																																}
																															]
																														}
																													]
																												}
																											]
																										}
																									]
																								}
																								{
																									type = partialswitch
																									state = on
																									id = autovocals_mouth_idle
																									[
																										{
																											type = cycle
																											anim = gh_av_male_mouth_idle
																											[
																												{
																													type = source
																													anim = gh_av_male_mouth_idle
																												}
																											]
																										}
																										{
																											type = degenerateblend
																											id = db_phonemes
																											default_degeneration_duration = 0.0
																										}
																									]
																								}
																							]
																						}
																						{
																							type = applydifference
																							[
																								{
																									type = lipflap
																									player = player
																									scale = 1.5
																									state = on
																									only_freeform = true
																									id = lipflap
																									[
																										{
																											type = source
																											anim = gh_rocker_male_mouthopen
																										}
																									]
																								}
																								{
																									type = partialswitch
																									state = on
																									[
																										{
																											type = modulate
																											id = vocal_face_mod
																											strength = 1
																											[
																												{
																													type = tensionstorage
																													min_stress_anim = face_tension_min
																													max_stress_anim = face_tension_max
																													active = use_face_tension
																													[
																														{
																															type = degenerateblend
																															id = face
																														}
																													]
																												}
																											]
																										}
																										{
																											type = switch
																											state = off
																											id = moment_blend
																											[
																												{
																													type = degenerateblend
																													id = moment_branch
																												}
																												{
																													type = degenerateblend
																													id = body
																												}
																											]
																										}
																									]
																								}
																							]
																						}
																					]
																				}
																			]
																		}
																	]
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
eye_lookat_off = {
	type = source
	anim = gh_male_eye_lookat_center
}
head_lookat_off = {
	type = modulate
	strength = 0.0
	[
		{
			type = source
			anim = gh_male_head_center
		}
	]
}
eye_lookat_tree1 = {
	type = timeonactivevalue
	active_value_source = av_eyerot_1
	anim_events = off
	[
		{
			type = modulateonactivevalue
			active_value_source = av_eyemag_1
			[
				{
					type = source
					anim = gh_male_eye_lookat_outer
				}
			]
		}
	]
}
eye_lookat_tree2 = {
	type = timeonactivevalue
	active_value_source = av_eyerot_2
	anim_events = off
	[
		{
			type = modulateonactivevalue
			active_value_source = av_eyemag_2
			[
				{
					type = source
					anim = gh_male_eye_lookat_outer
				}
			]
		}
	]
}
head_lookat_tree1 = {
	type = modulate
	strength = strength
	[
		{
			type = timeonactivevalue
			active_value_source = av_headrot_1
			anim_events = off
			[
				{
					type = blendonactivevalue
					active_value_source = av_headmag_1
					[
						{
							type = source
							anim = gh_male_head_center
						}
						{
							type = source
							anim = gh_male_head_lookat
						}
					]
				}
			]
		}
	]
}
head_lookat_tree2 = {
	type = modulate
	strength = strength
	[
		{
			type = timeonactivevalue
			active_value_source = av_headrot_2
			anim_events = off
			[
				{
					type = blendonactivevalue
					active_value_source = av_headmag_2
					[
						{
							type = source
							anim = gh_male_head_center
						}
						{
							type = source
							anim = gh_male_head_lookat
						}
					]
				}
			]
		}
	]
}
vocal_tree0 = {
	type = cycleonactivevalue
	active_value_source = av_vocal_cycle_0
	anim_events = off
	[
		{
			type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					type = source
					anim = anim_closed
				}
				{
					type = source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree1 = {
	type = cycleonactivevalue
	active_value_source = av_vocal_cycle_1
	anim_events = off
	[
		{
			type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					type = source
					anim = anim_closed
				}
				{
					type = source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree2 = {
	type = cycleonactivevalue
	active_value_source = av_vocal_cycle_2
	anim_events = off
	[
		{
			type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					type = source
					anim = anim_closed
				}
				{
					type = source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree3 = {
	type = cycleonactivevalue
	active_value_source = av_vocal_cycle_3
	anim_events = off
	[
		{
			type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					type = source
					anim = anim_closed
				}
				{
					type = source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree4 = {
	type = cycleonactivevalue
	active_value_source = av_vocal_cycle_4
	anim_events = off
	[
		{
			type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					type = source
					anim = anim_closed
				}
				{
					type = source
					anim = anim_open
				}
			]
		}
	]
}
vocal_tree5 = {
	type = cycleonactivevalue
	active_value_source = av_vocal_cycle_5
	anim_events = off
	[
		{
			type = blendonactivevalue
			active_value_source = av_pitch_volume
			[
				{
					type = source
					anim = anim_closed
				}
				{
					type = source
					anim = anim_open
				}
			]
		}
	]
}
new_drummer_static_tree = {
	type = avatarface
	[
		{
			type = applydifference
			[
				{
					type = degenerateblend
					id = db_eye_lookat
					default_degeneration_duration = 0.0
				}
				{
					type = partialswitch
					state = off
					id = eye_lookat_switch
					[
						{
							type = switchclearbones
							state = off
							id = eye_lookat_type
						}
						{
							type = applypartial
							[
								{
									type = degenerateblend
									id = db_head_lookat
									default_degeneration_duration = 0.0
								}
								{
									type = constraintbones
									constraintbones = hero_constraintbones
									[
										{
											type = tweakbones
											id = tweakbonesnode
											[
												{
													type = partialswitch
													state = on
													[
														{
															type = tensionstorage
															min_stress_anim = face_tension_min
															max_stress_anim = face_tension_max
															active = use_face_tension
															[
																{
																	type = degenerateblend
																	id = face
																}
															]
														}
														{
															type = switch
															state = off
															id = moment_blend
															[
																{
																	type = ik
																	two_bone_chains = drummer_ik_params
																	id = ik
																	[
																		{
																			type = applyheeldifference
																			id = heel
																			[
																				{
																					type = applyfemaledrummerdifference
																					id = femalediff
																					[
																						{
																							type = degenerateblend
																							id = moment_branch
																						}
																					]
																				}
																			]
																		}
																	]
																}
																{
																	$drumdroid_tree
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_moment_branch = {
	type = timer_type
	id = momenttimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_source_only = {
	type = source
	anim = anim
}
drum_kit_channel_list = [
	{
		name = tom_1
		bones = [
			bone_mic_adjust_height
		]
	}
	{
		name = tom_2
		bones = [
			bone_mic_adjust_angle
		]
	}
	{
		name = snare
		bones = [
			bone_mic_stand
		]
	}
	{
		name = cymbal_hh
		bones = [
			bone_guitar_string_2
			bone_guitar_string_3
			bone_guitar_string_4
		]
	}
	{
		name = cymbal_1
		bones = [
			bone_ik_hand_guitar_l
		]
	}
	{
		name = cymbal_2
		bones = [
			bone_ik_hand_guitar_r
		]
	}
	{
		name = cymbal_3
		bones = [
			bone_guitar_string_1
		]
	}
	{
		name = kick
		bones = [
			bone_thigh_r
			bone_toe_r
			bone_ik_foot_slave_r
			bone_guitar_string_5
			bone_guitar_string_6
			bone_mic_adjust_height
			bone_mic_adjust_angle
			bone_mic_microphone
		]
	}
]
empty_ik_params = [
]
car_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_ik_hand_r_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
	}
]
hero_ik_hand_l_params = [
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
	}
]
test_ik_hand_r_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		newtarget = bone_ik_hand_guitar_r
		stretch = 1.0
	}
]
test_ik_hand_l_params = [
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		newtarget = bone_ik_hand_guitar_l
		stretch = 1.0
	}
]
hero_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_feet_ik_params = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
singer_ik_params_arms = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
]
singer_ik_params_legs = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
drummer_ik_feet_params = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
drummer_ik_hand_r_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
]
drummer_ik_hand_l_params = [
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
]
drummer_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
guitar_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_constraintbones = [
	{
		type = twistchild
		bone = bone_twist_wrist_l
		target = bone_palm_l
		amount = 0.5
	}
	{
		type = twistchild
		bone = bone_twist_wrist_r
		target = bone_palm_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_r
		target = bone_bicep_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_l
		target = bone_bicep_l
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_top_r
		target = bone_bicep_r
		amount = 1.0
	}
	{
		type = twist
		bone = bone_twist_bicep_top_l
		target = bone_bicep_l
		amount = 1.0
	}
	{
		type = twistthigh
		bone = bone_twist_thigh_r
		target = bone_thigh_r
		amount = 1.0
	}
	{
		type = twistthigh
		bone = bone_twist_thigh_l
		target = bone_thigh_l
		amount = 1.0
	}
]

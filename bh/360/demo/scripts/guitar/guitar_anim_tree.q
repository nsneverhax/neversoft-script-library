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
	enable_new_strum
	dynamic_strums
	righthandpartial
	dynamic_strum_base
	dynamic_strum_roll_high
	dynamic_strum_roll_mid
	dynamic_strum_roll_low
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
						if 0x34e770c0 song = <loading_into_song>
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
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct_name> donotresolve
					printstruct <...>
					return true anim_struct_member = (<song_anim_struct>.<member>)
				elseif (<member> = bass)
					printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
					if structurecontains structure = <song_anim_struct> guitar
						printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct_name> donotresolve
						return true anim_struct_member = (<song_anim_struct>.guitar)
					endif
				endif
			endif
		endif
	endif
	if globalexists name = <anim_struct> type = structure
		if structurecontains structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
			printstruct <...>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if structurecontains structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> donotresolve
	printstruct <...>
	return \{false}
endscript

script unload_band_anims 
	printf \{qs(0xa3779ec3)}
	band_stop_anims
	band_unload_anim_paks async = <async>
endscript

script unload_band_song_anims \{song = unknown}
	printf \{qs(0xaf472415)}
	band_stop_anims
	band_unload_song_anim_paks song = <song> async = <async>
endscript

script emptyscript 
endscript

script hero_pause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 1.0
			}}
	endif
endscript

script hero_enable_mirroring 
	if anim_animnodeexists \{id = mirrornode}
		anim_command \{target = mirrornode
			command = mirror_setstate
			params = {
				on
			}}
	endif
endscript

script hero_disable_mirroring 
	if anim_animnodeexists \{id = mirrornode}
		anim_command \{target = mirrornode
			command = mirror_setstate
			params = {
				off
			}}
	endif
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

script hero_add_clothing_difference_anim 
	if NOT gotparam \{anim}
		return
	endif
	anim_command target = heel command = applyheeldifference_setanim params = {anim = <anim>}
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

script hero_wait_until_anim_near_end \{timer = bodytimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end timer = <timer> time_from_end = <time_from_end>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_near_end \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_wait params = {secondsfromend = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script killanim 
	obj_killallspawnedscripts
	skeleton_getskeletonname
	extendcrc <skeletonname> '_default' out = anim
	hero_play_anim anim = <anim> blendduration = 0.0
endscript

script handle_moment_anim_blending 
	obj_getid
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.0
		}}
	ragdoll_markforreset
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
	if (<part> = guitar || <part> = bass || <part> = rhythm)
		chain = guitar
	else
		chain = slave
	endif
	band_setikchain name = <objid> chain = <chain>
	ragdoll_markforreset
	increase_band_bounding_spheres
	wait \{1
		gameframe}
	getsingletag \{frontend_character}
	if (<frontend_character> = 0)
		band_movetostartnode name = <objid>
	endif
endscript

script stop_loop_cameras 
	if (<name> = drummer)
		return
	endif
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	if compositeobjectexists name = <camera1>
		if <camera1> :anim_animnodeexists id = bodytimer
			<camera1> :anim_command target = bodytimer command = tempomatch_pause
		endif
	endif
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	if compositeobjectexists name = <camera2>
		if <camera2> :anim_animnodeexists id = bodytimer
			<camera2> :anim_command target = bodytimer command = tempomatch_pause
		endif
	endif
endscript

script start_loop_cameras 
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	if compositeobjectexists name = <camera1>
		if <camera1> :anim_animnodeexists id = bodytimer
			<camera1> :anim_command target = bodytimer command = tempomatch_unpause
		endif
	endif
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	if compositeobjectexists name = <camera2>
		if <camera2> :anim_animnodeexists id = bodytimer
			<camera2> :anim_command target = bodytimer command = tempomatch_unpause
		endif
	endif
endscript

script set_timer_node_speed 
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

script end_drummer_moment_anim 
endscript

script drummer_faceoff_rest 
	anim = drum_hth_loop_notempo
	anim_command {
		target = faceoff_branch
		command = degenerateblend_addbranch
		params = {
			tree = $faceoff_drummer_notempo
			blendduration = 0.0
			params = {
				anim = <anim>
			}
		}
	}
	anim_command \{target = faceoff_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.3
		}}
endscript

script drummer_faceoff_play 
	anim_command \{target = faceoff_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	type = cycle
	id = faceoff_timer
	anim = anim
	[
		{
			type = source
			anim = anim
		}
	]
}

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
	type = ragdoll
	[
		{
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
frontend_static_tree = {
	type = ragdoll
	[
		{
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
																					type = degenerateblend
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
vocalist_static_tree = {
	type = ragdoll
	[
		{
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
													type = tweakbones
													id = tweakbonesnode
													[
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
drummer_static_tree = {
	type = ragdoll
	[
		{
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
															id = faceoff_blend
															[
																{
																	type = degenerateblend
																	id = faceoff_branch
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
																					type = degenerateblend
																					id = moment_branch
																				}
																			]
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
new_drummer_static_tree = {
	type = ragdoll
	[
		{
			type = avatarface
			[
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
hero_cymbal_branch = {
	type = play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			type = source
			anim = cymbal_anim
		}
	]
}
hero_simple_source = {
	type = play
	anim = anim
	[
		{
			type = source
			anim = anim
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

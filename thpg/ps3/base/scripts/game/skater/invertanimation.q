
script Skater_PlayInvertAnim \{sync = 0}
	handlefliporboardrotateafter
	if anim_animnodeexists \{id = BodyPoseCapture}
		anim_command \{target = BodyPoseCapture
			command = posecapture_capture}
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $Invert_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
endscript

script Skater_PlayInvertRangeAnim \{sync = 0}
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $InvertRange_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
endscript

script Skater_BlendInvertBalance \{blendtime = 0.1}
	anim_command {
		target = invertbalancemod
		command = modulate_startblend
		params = {
			blendcurve = <blendcurve>
			blendtime = <blendtime>
		}
	}
	wait <blendtime> seconds
endscript
Invert_AnimBranch = {
	type = skaterflip
	[
		{
			type = boardrotate
			[
				{
					type = posecapture
					id = BodyPoseCapture
					[
						{
							type = ik
							id = ik
							two_bone_chains = Skater_IK_Params
							[
								{
									type = play
									anim = anim
									id = bodytimer
									[
										{
											type = source
											anim = anim
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
InvertRange_AnimBranch = {
	type = skaterflip
	[
		{
			type = boardrotate
			[
				{
					type = posecapture
					id = BodyPoseCapture
					[
						{
							type = ik
							id = ik
							two_bone_chains = Skater_IK_Params
							[
								{
									type = applydifference
									[
										{
											type = modulate
											id = invertbalancemod
											[
												{
													type = wobble
													anim = range_anim
													reverse = true
													[
														{
															type = source
															anim = range_anim
														}
													]
												}
											]
										}
										{
											type = source
											anim = base_anim
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

Skater_StaticAnimTree = {
	type = PoseExport
	id = SkaterPoseExport
	[
		{
			type = cutsceneoverlay
			id = SkaterCutsceneOverlay
			updatechildatfullblend = false
			[
				{
					type = constraintbones
					constraintbones = Skater_ConstraintBones
					[
						{
							type = ragdoll
							[
								{
									type = applydifferencewithfacefixuphack
									strength = 1.0
									[
										{
											type = add
											[
												{
													type = nestedtree
													tree = WheelSpin_animbranch
												}
												{
													type = degenerateblend
													id = face
												}
											]
										}
										{
											type = partialswitch
											id = SkaterPartialSwitchId
											state = on
											[
												{
													type = degenerateblend
													id = SkaterPartialBody
												}
												{
													type = ik
													id = IK_BelowBodyInTree
													two_bone_chains = Skater_IK_Params
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
			]
		}
	]
}

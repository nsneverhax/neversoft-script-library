
script Skater_PlayAirAnim sync = 0
	handlefliporboardrotateafter
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $InAir_AnimBranch
			blendduration = <blendduration>
			params = {
				<...>
			}
		}
	}
	if gotparam groundgone
		anim_command {
			target = inair_takeoff
			command = modulate_setstrength
			params = {
				strength = 0.0
			}
		}
	endif
	if gotparam play_apex_once
		anim_command {
			target = inair_apex_playonce
			command = modulate_setstrength
			params = {
				strength = 1.0
			}
		}
		anim_command {
			target = inair_apex_cycle
			command = modulate_setstrength
			params = {
				strength = 0.0
			}
		}
	else
		anim_command {
			target = inair_apex_playonce
			command = modulate_setstrength
			params = {
				strength = 0.0
			}
		}
		anim_command {
			target = inair_apex_cycle
			command = modulate_setstrength
			params = {
				strength = 1.0
			}
		}
	endif
endscript
InAir_AnimBranch = {
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
							type = applydifference
							[
								{
									$InAirUpper_AnimBranch
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
InAirUpper_AnimBranch = {
	type = ollielandblend
	blendcurve = land_blend_curve
	blendintime = land_blend_time
	maxblendtime = land_blend_max
	blendthreshold = land_blend_threshold
	holdtime = 0.0
	id = ollielandblend
	UseWalkComponent = 1
	highdropstartblendtime = 0.3
	highdropendblendtime = 1.5
	sync = sync
	[
		{
			type = takeoffblend
			blendcurve = takeoff_blend_curve
			blendintime = takeoff_blend_time
			id = takeoffblend
			sync = sync
			[
				{
					$InAirTakeOff_AnimBranch
				}
				{
					type = add
					[
						{
							type = modulate
							strength = 1.0
							id = inair_apex_cycle
							[
								{
									$InAirApex_AnimBranch
								}
							]
						}
						{
							type = modulate
							strength = 0.0
							id = inair_apex_playonce
							[
								{
									$InAirApex_PlayOnce_AnimBranch
								}
							]
						}
					]
				}
			]
		}
		{
			$InAirLand_AnimBranch
		}
	]
}
InAirTakeOff_AnimBranch = {
	type = modulate
	id = inair_takeoff
	strength = 1.0
	[
		{
			type = play
			id = bodytimer
			anim = takeoff_anim
			anim_events = on
			[
				{
					type = source
					anim = takeoff_anim
				}
			]
		}
	]
}
InAirApex_AnimBranch = {
	type = cycle
	anim = apex_anim
	[
		{
			type = source
			anim = apex_anim
		}
	]
}
InAirApex_PlayOnce_AnimBranch = {
	type = play
	anim = apex_anim
	[
		{
			type = source
			anim = apex_anim
		}
	]
}
InAirLand_AnimBranch = {
	type = modulate
	strength = 1.0
	[
		{
			type = source
			anim = land_anim
		}
	]
}

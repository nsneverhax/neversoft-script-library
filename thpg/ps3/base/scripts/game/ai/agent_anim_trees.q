agent_anim_node_ids = [
	pedmainanimparentnode
	pedfamanimparentnode
	pedblendroot
	famtimer
	pedfamanimnode
	bodytimer
	bodysource
	bodyoverlay
	lookatcontroller
	AgentFAMAnimNode
	agent
	AgentCutsceneOverlay
	face_source
	face_timer
	fam
]
agent_staticanimtree = {
	type = cutsceneoverlay
	id = AgentCutsceneOverlay
	updatechildatfullblend = true
	[
		{
			type = ragdoll
			[
				{
					type = ai_agent
					id = agent
				}
			]
		}
	]
}
agent_human_staticanimtree = {
	type = cutsceneoverlay
	id = AgentCutsceneOverlay
	updatechildatfullblend = true
	[
		{
			type = fam
			id = fam
			anim = SK8_Face_HighRez_JawFalp_D
			[
				{
					type = ragdoll
					[
						{
							type = bonealign
							bone_id = bone_head
							align_type = head
							[
								{
									type = ai_agent
									id = agent
								}
							]
						}
					]
				}
			]
		}
	]
}
agent_vehicle_staticanimtree = {
	type = vehiclephysicssource
}
Agent_AnimBranch_Reaction_Basic = {
	type = my_timer_type
	speed = my_speed
	anim = my_anim
	anim_events = on
	[
		{
			type = motionextractedsource
			anim = my_anim
		}
	]
}
Agent_AnimBranch_Reaction = {
	type = ai_orient
	orient_type = my_orient_type
	[
		{
			type = my_timer_type
			speed = my_speed
			anim = my_anim
			anim_events = on
			[
				{
					type = motionextractedsource
					anim = my_anim
				}
			]
		}
	]
}
agent_animbranch_famstandard = {
	type = degenerateblend
	id = pedfamanimparentnode
}
Agent_AnimBranch_FAMAnim = {
	type = param_timer_type
	id = famtimer
	speed = param_speed
	start = param_start
	anim = param_anim
	anim_events = on
	[
		{
			id = AgentFAMAnimNode
			type = source
			anim = param_anim
		}
	]
}
Agent_AnimBranch_FAMAnim_Empty = {
	type = blank
}

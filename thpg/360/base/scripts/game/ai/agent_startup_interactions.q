
script RegisterInteractions 
	RegisterInteraction {
		name = act_intersection
		behaviors =
		{
			interact =
			{
				id = Bv_MasterNode_Intersection
			}
		}
	}
	RegisterInteraction {
		name = ACT_AmbientScene
		behaviors =
		{
			interact =
			{
				id = Bv_RunAmbientScene
				params = {behavior_id = Bv_AmbientScene}
			}
		}
	}
	RegisterInteraction {
		name = ACT_AmbientChat
		behaviors =
		{
			interact =
			{
				id = Bv_RunInteraction
				params = {behavior_id = Bv_MasterNode_AmbientChat}
			}
		}
	}
	RegisterInteraction {
		name = ACT_UseIntersection
		behaviors =
		{
			interact =
			{
				id = Bv_InteractNode_UseIntersection
			}
		}
	}
	RegisterInteraction {
		name = ACT_UseCrosswalk
		behaviors =
		{
			interact =
			{
				id = Bv_InteractNode_UseCrosswalk
			}
		}
	}
	RegisterInteraction {
		name = ACT_Path
		behaviors =
		{
			interact =
			{
				id = Bv_InteractNode_FollowPath
			}
		}
	}
	RegisterInteraction {
		name = ACT_SkatePath
		behaviors =
		{
			interact =
			{
				id = Bv_InteractNode_MoveAndUse_WaitForReaction
			}
			move =
			{
				id = Bv_InteractNode_MoveTo
			}
			use =
			{
				id = Bv_InteractNode_FixedPathSkaterPed
			}
		}
	}
	RegisterInteraction {
		name = Act_Custom
		behaviors =
		{
			interact =
			{
				id = Bv_RunInteraction
				params = {behavior_id = Bv_InteractNode_AnimScript}
			}
		}
	}
	RegisterInteraction {
		name = ACT_Custom_Rest
		needs_satisfied = {rest = {satisfaction = 1.0
				threshold = 0.5}}
		behaviors =
		{
			interact =
			{
				id = Bv_RunInteraction
				params = {behavior_id = Bv_InteractNode_AnimScript}
			}
		}
	}
	RegisterInteraction {
		name = ACT_SceneControl
		behaviors =
		{
			interact =
			{
				id = Bv_SceneControl
			}
		}
	}
	RegisterInteraction {
		name = ACT_Guard_Circle
		intercept_shape = circle
		maintain_node = false
		behaviors =
		{
			interact =
			{
				id = Bv_RunInteraction
				params = {behavior_id = Bv_Guard_Prepare}
			}
		}
	}
	RegisterInteraction {
		name = ACT_Guard_Line
		intercept_shape = line
		maintain_node = false
		behaviors =
		{
			interact =
			{
				id = Bv_RunInteraction
				params = {behavior_id = Bv_GuardLine_Prepare}
			}
		}
	}
endscript

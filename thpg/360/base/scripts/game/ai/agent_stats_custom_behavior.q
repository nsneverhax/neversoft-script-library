custom_behavior_standard = {
	common_detection = Bv_StandardCommonDetection
	alert_state_combat = Bv_Agent_No_Combat
	alert_state_investigate = Bv_Agent_Investigate
	alert_state_search = Bv_Agent_Search
	alert_state_life = Bv_Agent_Life
	interact_node_combat_move = Bv_InteractNode_Combat_Standard_Move
	interact_node_attack = Bv_InteractNode_Combat_Standard_Attack
	interact_node_cover_hide = Bv_InteractNode_Combat_Standard_CoverHide
	interact_node_cover_attack = Bv_InteractNode_Combat_Standard_CoverAttack
}
custom_behavior_goal_ped = {
	$custom_behavior_standard
	alert_state_life = Bv_GoalPed
}
custom_behavior_goal_ped_look_at_only = {
	$custom_behavior_standard
	alert_state_life = Bv_GoalPedLookAtOnly
}
custom_behavior_civilian = {
	$custom_behavior_standard
	alert_state_life = Bv_AmbientPed
	alert_state_combat = Bv_AngryAnnoyed
}
custom_behavior_guard = {
	$custom_behavior_standard
	alert_state_combat = Bv_Agent_Combat
	common_detection = Bv_GuardPedCommonDetection
}
custom_behavior_dummy = {
	$custom_behavior_standard
	alert_state_life = Bv_DummyPed
}
custom_behavior_spectator = {
	$custom_behavior_standard
	alert_state_life = Bv_SpectatorPed
}
custom_behavior_vehicle = {
	$custom_behavior_standard
	alert_state_life = Bv_Vehicle
}

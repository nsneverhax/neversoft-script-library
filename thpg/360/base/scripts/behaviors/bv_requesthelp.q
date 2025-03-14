Task_RequestHelp_ProcessEvent = {
	enter = RequestHelp_ProcessEvent
}

script RequestHelp_ProcessEvent 
	<attacker_id> = invalid
	<radius> = 0
	switch <event_type>
		case shot
		case ShotMissed
		case Shot_At_By_Hero
		case Knock_Off_Horse
		<attacker_id> = (<event_data>.attacker)
		<radius> = 62.5
		default
		scriptassert "Unhandled event to request help for"
	endswitch
	agent_requesthelp {attacker = <attacker_id> , radius = <radius>}
endscript

script RegisterBehaviors_RequestHelp 
	registerstate \{name = Bv_ManageRequestHelp
		transitions = [
			{
				events = [
					shot
					ShotMissed
					Shot_At_By_Hero
					Knock_Off_Horse
				]
				recur = true
				responses = [
					{
						replacement = child
						state = Bv_RequestHelp
					}
				]
			}
		]}
	registerstate \{name = Bv_RequestHelp
		task = {
			name = Task_RequestHelp_ProcessEvent
		}
		transitions = [
		]}
endscript

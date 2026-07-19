
script fsm_set \{replacement = child}
	fsm_replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript

script register_fsm_states 
	registerstate \{name = state_testfsm
		task = {
			name = task_debug
			params = {
				label = state_message
				message = 'Fsm Test State'
			}
		}
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = this
						behavior = state_testfsm2
					}
				]
			}
		]}
	registerstate \{name = state_testfsm2
		task = {
			name = task_debug
			params = {
				label = state_message
				message = 'Fsm Test State 2'
			}
		}}
endscript

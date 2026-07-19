
script Fsm_Set \{replacement = child}
	Fsm_Replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript

script Register_Fsm_States 
	RegisterState \{name = State_TestFsm
		task = {
			name = Task_Debug
			params = {
				label = State_Message
				message = 'Fsm Test State'
			}
		}
		Transitions = [
			{
				events = [
					Enter_Behavior
				]
				responses = [
					{
						replacement = this
						behavior = State_TestFsm2
					}
				]
			}
		]}
	RegisterState \{name = State_TestFsm2
		task = {
			name = Task_Debug
			params = {
				label = State_Message
				message = 'Fsm Test State 2'
			}
		}}
endscript

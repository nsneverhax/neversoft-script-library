
script fsm_set \{replacement = child}
	Fsm_Replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript

script Register_Fsm_States 
	RegisterState \{Name = State_TestFsm
		task = {
			Name = Task_Debug
			params = {
				label = State_Message
				message = 'Fsm Test State'
			}
		}
		transitions = [
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
	RegisterState \{Name = State_TestFsm2
		task = {
			Name = Task_Debug
			params = {
				label = State_Message
				message = 'Fsm Test State 2'
			}
		}}
endscript

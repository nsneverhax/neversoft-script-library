
script Fsm_Set \{replacement = child}
	Fsm_Replace {
		hierarchy = current
		replacement = <replacement>
		State = <State>
		Params = <Params>
	}
endscript

script Register_Fsm_States 
	RegisterState \{Name = State_TestFsm
		Task = {
			Name = Task_Debug
			Params = {
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
	RegisterState \{Name = State_TestFsm2
		Task = {
			Name = Task_Debug
			Params = {
				label = State_Message
				message = 'Fsm Test State 2'
			}
		}}
endscript

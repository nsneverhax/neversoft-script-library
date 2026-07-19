
script StartFSMExample 
	RegisterMyTestStates
	SetupMyStateMachine
endscript

script RegisterMyTestStates 
	printf \{qs("\L//\\//\\ registering state structure")}
	RegisterState \{name = Bv_MyTestState
		Transitions = [
			{
				events = [
					Enter_State
					MyChildScriptTrigger
				]
				responses = [
					{
						replacement = child
						state = Bv_MyScriptChild
						params = [
							{
								name = param1
								ref = input_param
							}
							{
								name = param2
								val = my_param_2
							}
							{
								name = param3
								val = my_param_3
							}
						]
					}
				]
			}
			{
				events = [
					ChildTrigger
				]
				responses = [
					{
						replacement = child
						state = Bv_Message
						params = [
							{
								name = message
								val = qs("\LChildTrigger fired!")
							}
						]
					}
				]
			}
			{
				events = [
					RecurTrigger
				]
				recur = true
				responses = [
					{
						replacement = child2
						state = Bv_Message
						params = [
							{
								name = message
								val = qs("\LRecurTrigger fired!")
							}
						]
					}
				]
			}
		]}
endscript

script SetupMyStateMachine 
	printf \{qs("\L//\\//\\ setup state machine")}
	CreateCompositeObject \{params = {
			name = MyStateMachine
			permanent
		}
		Components = [
			{
				Component = EventCache
			}
			{
				Component = StateMachineManager
			}
		]
		heap = FrontEnd}
	MyStateMachine :Fsm_Set \{state = Bv_MyTestState
		params = {
			input_param = my_input_param
		}}
endscript

script Bv_MyTestStateInScript 
	printf \{qs("\L//\\//\\ Bv_MyTestStateInScript")}
	Fsm_Set state = Bv_MyScriptChild params = {param1 = <input_param> param2 = my_param_2 param3 = <input_param>}
	begin
	blockuntilevent \{anytypes = [
			MyChildScriptTrigger
			ChildTrigger
			RecurTrigger
		]}
	switch <type>
		case MyChildScriptTrigger
		Fsm_Set state = Bv_MyScriptChild replacement = child params = {param1 = <input_param> param2 = my_param_2 param3 = my_param_3}
		case ChildTrigger
		Fsm_Set \{state = Bv_Message
			replacement = child
			params = {
				message = qs("\LChildTrigger fired!")
			}}
		case RecurTrigger
		Fsm_Set \{state = Bv_Message
			replacement = child2
			params = {
				message = qs("\LRecurTrigger fired!")
			}}
	endswitch
	repeat
endscript

script Bv_MyScriptChild 
	printf \{qs("\L//\\//\\ MyScriptChild Fired")}
	printstruct <...>
	begin
	blockuntilevent \{anytypes = [
			ScriptChildEvent1
			ScriptChildEvent2
		]}
	switch <type>
		case ScriptChildEvent1
		printf \{qs("\L//\\//\\ MyScriptChildLoop1")}
		Fsm_Set state = Bv_MessageLoop replacement = mess1 params = {message = qs("\LMyScriptChildLoop1") event = <type>}
		case ScriptChildEvent2
		printf \{qs("\L//\\//\\ MyScriptChildLoop2")}
		Fsm_Set state = Bv_MessageLoop replacement = mess2 params = {message = qs("\LMyScriptChildLoop2") event = <type>}
	endswitch
	Wait \{1
		frame}
	repeat
endscript

script Bv_MessageLoop 
	begin
	printf <message>
	Wait \{10
		frames}
	repeat
endscript


script StartFSMExample 
	RegisterMyTestStates
	SetupMyStateMachine
endscript

script RegisterMyTestStates 
	printf \{"//\\\\//\\\\ registering state structure"}
	RegisterState \{Name = Bv_MyTestState
		transitions = [
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
								Name = param1
								ref = input_param
							}
							{
								Name = param2
								val = my_param_2
							}
							{
								Name = param3
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
								Name = message
								val = "ChildTrigger fired!"
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
								Name = message
								val = "RecurTrigger fired!"
							}
						]
					}
				]
			}
		]}
endscript

script SetupMyStateMachine 
	printf \{"//\\\\//\\\\ setup state machine"}
	CreateCompositeObject \{params = {
			Name = MyStateMachine
			permanent
		}
		components = [
			{
				component = EventCache
			}
			{
				component = StateMachineManager
			}
		]
		Heap = FrontEnd}
	MyStateMachine :fsm_set \{state = Bv_MyTestState
		params = {
			input_param = my_input_param
		}}
endscript

script Bv_MyTestStateInScript 
	printf \{"//\\\\//\\\\ Bv_MyTestStateInScript"}
	fsm_set state = Bv_MyScriptChild params = {param1 = <input_param> param2 = my_param_2 param3 = <input_param>}
	begin
	blockuntilevent \{anytypes = [
			MyChildScriptTrigger
			ChildTrigger
			RecurTrigger
		]}
	switch <Type>
		case MyChildScriptTrigger
		fsm_set state = Bv_MyScriptChild replacement = child params = {param1 = <input_param> param2 = my_param_2 param3 = my_param_3}
		case ChildTrigger
		fsm_set \{state = Bv_Message
			replacement = child
			params = {
				message = "ChildTrigger fired!"
			}}
		case RecurTrigger
		fsm_set \{state = Bv_Message
			replacement = child2
			params = {
				message = "RecurTrigger fired!"
			}}
	endswitch
	repeat
endscript

script Bv_MyScriptChild 
	printf \{"//\\\\//\\\\ MyScriptChild Fired"}
	printstruct <...>
	begin
	blockuntilevent \{anytypes = [
			ScriptChildEvent1
			ScriptChildEvent2
		]}
	switch <Type>
		case ScriptChildEvent1
		printf \{"//\\\\//\\\\ MyScriptChildLoop1"}
		fsm_set state = Bv_MessageLoop replacement = mess1 params = {message = "MyScriptChildLoop1" event = <Type>}
		case ScriptChildEvent2
		printf \{"//\\\\//\\\\ MyScriptChildLoop2"}
		fsm_set state = Bv_MessageLoop replacement = mess2 params = {message = "MyScriptChildLoop2" event = <Type>}
	endswitch
	Wait \{1
		Frame}
	repeat
endscript

script Bv_MessageLoop 
	begin
	printf <message>
	Wait \{10
		frames}
	repeat
endscript

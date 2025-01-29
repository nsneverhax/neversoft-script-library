
script StartFSMExample 
	RegisterMyTestStates
	SetupMyStateMachine
endscript

script RegisterMyTestStates 
	printf \{qs(0xe199831e)}
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
								val = qs(0x008cfa10)
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
								val = qs(0xa568cd0b)
							}
						]
					}
				]
			}
		]}
endscript

script SetupMyStateMachine 
	printf \{qs(0x3e917be0)}
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
	printf \{qs(0x94e4d34a)}
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
				message = qs(0x008cfa10)
			}}
		case RecurTrigger
		fsm_set \{state = Bv_Message
			replacement = child2
			params = {
				message = qs(0xa568cd0b)
			}}
	endswitch
	repeat
endscript

script Bv_MyScriptChild 
	printf \{qs(0x72ee849c)}
	printstruct <...>
	begin
	blockuntilevent \{anytypes = [
			ScriptChildEvent1
			ScriptChildEvent2
		]}
	switch <Type>
		case ScriptChildEvent1
		printf \{qs(0x0fd9dd27)}
		fsm_set state = Bv_MessageLoop replacement = mess1 params = {message = qs(0xdbc712a1) event = <Type>}
		case ScriptChildEvent2
		printf \{qs(0x24f48ee4)}
		fsm_set state = Bv_MessageLoop replacement = mess2 params = {message = qs(0xf0ea4162) event = <Type>}
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

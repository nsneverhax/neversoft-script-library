
script startfsmexample 
	registermyteststates
	setupmystatemachine
endscript

script registermyteststates 
	printf \{"//\\\\//\\\\ registering state structure"}
	registerstate \{name = bv_myteststate
		transitions = [
			{
				events = [
					enter_state
					mychildscripttrigger
				]
				responses = [
					{
						replacement = child
						state = bv_myscriptchild
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
					childtrigger
				]
				responses = [
					{
						replacement = child
						state = bv_message
						params = [
							{
								name = message
								val = "ChildTrigger fired!"
							}
						]
					}
				]
			}
			{
				events = [
					recurtrigger
				]
				recur = true
				responses = [
					{
						replacement = child2
						state = bv_message
						params = [
							{
								name = message
								val = "RecurTrigger fired!"
							}
						]
					}
				]
			}
		]}
endscript

script setupmystatemachine 
	printf \{"//\\\\//\\\\ setup state machine"}
	createcompositeobject \{params = {
			name = mystatemachine
			permanent
		}
		components = [
			{
				component = eventcache
			}
			{
				component = statemachinemanager
			}
		]
		heap = frontend}
	mystatemachine :fsm_set \{state = bv_myteststate
		params = {
			input_param = my_input_param
		}}
endscript

script bv_myteststateinscript 
	printf \{"//\\\\//\\\\ Bv_MyTestStateInScript"}
	fsm_set state = bv_myscriptchild params = {param1 = <input_param> param2 = my_param_2 param3 = <input_param>}
	begin
	blockuntilevent \{anytypes = [
			mychildscripttrigger
			childtrigger
			recurtrigger
		]}
	switch <type>
		case mychildscripttrigger
		fsm_set state = bv_myscriptchild replacement = child params = {param1 = <input_param> param2 = my_param_2 param3 = my_param_3}
		case childtrigger
		fsm_set \{state = bv_message
			replacement = child
			params = {
				message = "ChildTrigger fired!"
			}}
		case recurtrigger
		fsm_set \{state = bv_message
			replacement = child2
			params = {
				message = "RecurTrigger fired!"
			}}
	endswitch
	repeat
endscript

script bv_myscriptchild 
	printf \{"//\\\\//\\\\ MyScriptChild Fired"}
	printstruct <...>
	begin
	blockuntilevent \{anytypes = [
			scriptchildevent1
			scriptchildevent2
		]}
	switch <type>
		case scriptchildevent1
		printf \{"//\\\\//\\\\ MyScriptChildLoop1"}
		fsm_set state = bv_messageloop replacement = mess1 params = {message = "MyScriptChildLoop1" event = <type>}
		case scriptchildevent2
		printf \{"//\\\\//\\\\ MyScriptChildLoop2"}
		fsm_set state = bv_messageloop replacement = mess2 params = {message = "MyScriptChildLoop2" event = <type>}
	endswitch
	wait \{1
		frame}
	repeat
endscript

script bv_messageloop 
	begin
	printf <message>
	wait \{10
		frames}
	repeat
endscript

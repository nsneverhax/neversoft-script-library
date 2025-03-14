
script startfsmexample 
	registermyteststates
	setupmystatemachine
endscript

script registermyteststates 
	printf \{qs(0xe199831e)}
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
								val = qs(0x008cfa10)
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
								val = qs(0xa568cd0b)
							}
						]
					}
				]
			}
		]}
endscript

script setupmystatemachine 
	printf \{qs(0x3e917be0)}
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
	printf \{qs(0x94e4d34a)}
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
				message = qs(0x008cfa10)
			}}
		case recurtrigger
		fsm_set \{state = bv_message
			replacement = child2
			params = {
				message = qs(0xa568cd0b)
			}}
	endswitch
	repeat
endscript

script bv_myscriptchild 
	printf \{qs(0x72ee849c)}
	printstruct <...>
	begin
	blockuntilevent \{anytypes = [
			scriptchildevent1
			scriptchildevent2
		]}
	switch <type>
		case scriptchildevent1
		printf \{qs(0x0fd9dd27)}
		fsm_set state = bv_messageloop replacement = mess1 params = {message = qs(0xdbc712a1) event = <type>}
		case scriptchildevent2
		printf \{qs(0x24f48ee4)}
		fsm_set state = bv_messageloop replacement = mess2 params = {message = qs(0xf0ea4162) event = <type>}
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

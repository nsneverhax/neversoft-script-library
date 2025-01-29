g_enable_facebook = 0

script facebook_register {
		0x55 username
		0x55 password
		0x52 controller = ($primary_controller)
	}
	NetSessionFunc {
		Obj = facebook
		func = register_account
		params = {
			controller_index = <controller>
			username = <username>
			password = <password>
			callback = facebook_register_callback
			callback_params = {controller = <controller>}
		}
	}
endscript

script facebook_unregister {
		0x52 controller = ($primary_controller)
	}
	NetSessionFunc {
		Obj = facebook
		func = unregister_account
		params = {
			controller_index = <controller>
			callback = facebook_unregister_callback
			callback_params = {controller = <controller>}
		}
	}
endscript

script facebook_post {
		0x55 message
		0x52 controller = ($primary_controller)
		0x52 retry_on_fail = 1
	}
	NetSessionFunc {
		Obj = facebook
		func = post
		params = {
			controller_index = <controller>
			message = <message>
			callback = facebook_post_callback
			callback_params = {message = <message> controller = <controller> retry_on_fail = <retry_on_fail>}
		}
	}
endscript

script facebook_get_info \{controller = !i1768515945}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = facebook_info
	return facebook_info = <facebook_info>
endscript

script facebook_set_info \{element = !q1768515945
		controller = !i1768515945}
	RequireParams \{[
			value
		]
		all}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = facebook_info
	RemoveComponent structure_name = facebook_info Name = <element>
	AddParam structure_name = facebook_info Name = <element> value = <value>
	SetGlobalTags savegame = <savegame> user_options params = {facebook_info = <facebook_info>}
endscript

script 0x08155a39 \{controller = !i1768515945}
	facebook_get_info controller = <controller>
	if (<facebook_info>.username = qs(0x03ac90f0) || <facebook_info>.password = qs(0x03ac90f0))
		return \{FALSE}
	else
		return true facebook_info = <facebook_info>
	endif
endscript

script 0xf59af0b2 
	if ScreenElementExists \{id = current_menu}
		current_menu :GetSingleTag \{user_options}
		<0x73cd1f25> = (<user_options>.facebook_info)
		GetGlobalTags \{user_options
			param = facebook_info}
		<0x7c0f2f8e> = <facebook_info>
		if (<0x73cd1f25>.username != <0x7c0f2f8e>.username ||
				<0x73cd1f25>.password != <0x7c0f2f8e>.password ||
				<0x73cd1f25>.broadcast_enabled != <0x7c0f2f8e>.broadcast_enabled)
			ui_memcard_autosave_replace
			return
		endif
	endif
	generic_event_back
endscript

script facebook_register_callback \{controller = !i1768515945}
	if (<Result> = success)
		printf \{qs(0x56b075fe)
			channel = facebook}
		return
	endif
	printf \{qs(0x462bca5b)
		channel = facebook}
endscript

script facebook_unregister_callback \{controller = !i1768515945}
	if (<Result> = success)
		printf \{qs(0xc34dbf56)
			channel = facebook}
		return
	endif
	printf \{qs(0x39dcbe2b)
		channel = facebook}
endscript

script facebook_post_callback \{controller = !i1768515945
		retry_on_fail = !i1768515945}
	if (<Result> = success)
		printf \{qs(0x9481cb42)
			channel = facebook}
		printf qs(0xa77146ee) m = <message> channel = facebook
		printf \{qs(0x03ac90f0)
			channel = facebook}
		return
	endif
	printf \{qs(0xb9953b24)
		channel = facebook}
	if (<retry_on_fail> = 1)
		if 0x08155a39 controller = <controller>
			facebook_register username = (<facebook_info>.username) password = (<facebook_info>.password) controller = <controller>
			printf \{qs(0xe17c2f3e)
				channel = facebook}
			facebook_post message = <message> controller = <controller> retry_on_fail = 0
		endif
	endif
endscript

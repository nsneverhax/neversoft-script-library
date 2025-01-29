g_enable_twitter = 0

script twitter_register {
		0x55 username
		0x55 password
		0x52 controller = ($primary_controller)
	}
	NetSessionFunc {
		Obj = twitter
		func = register_account
		params = {
			controller_index = <controller>
			username = <username>
			password = <password>
			callback = twitter_register_callback
			callback_params = {controller = <controller>}
		}
	}
endscript

script twitter_unregister {
		0x52 controller = ($primary_controller)
	}
	NetSessionFunc {
		Obj = twitter
		func = unregister_account
		params = {
			controller_index = <controller>
			callback = twitter_unregister_callback
			callback_params = {controller = <controller>}
		}
	}
endscript

script twitter_post {
		0x55 message
		0x52 controller = ($primary_controller)
		0x52 retry_on_fail = 1
	}
	NetSessionFunc {
		Obj = twitter
		func = post
		params = {
			controller_index = <controller>
			message = <message>
			callback = twitter_post_callback
			callback_params = {message = <message> controller = <controller> retry_on_fail = <retry_on_fail>}
		}
	}
endscript

script twitter_get_info \{controller = !i1768515945}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = twitter_info
	return twitter_info = <twitter_info>
endscript

script twitter_set_info \{element = !q1768515945
		controller = !i1768515945}
	RequireParams \{[
			value
		]
		all}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = twitter_info
	RemoveComponent structure_name = twitter_info Name = <element>
	AddParam structure_name = twitter_info Name = <element> value = <value>
	SetGlobalTags savegame = <savegame> user_options params = {twitter_info = <twitter_info>}
endscript

script 0x959f4979 \{controller = !i1768515945}
	twitter_get_info controller = <controller>
	if (<twitter_info>.username = qs(0x03ac90f0) || <twitter_info>.password = qs(0x03ac90f0))
		return \{FALSE}
	else
		return true twitter_info = <twitter_info>
	endif
endscript

script 0xf939648f 
	if ScreenElementExists \{id = current_menu}
		current_menu :GetSingleTag \{user_options}
		<0x8fb7f64d> = (<user_options>.twitter_info)
		GetGlobalTags \{user_options
			param = twitter_info}
		<0x4d7e6904> = <twitter_info>
		if (<0x8fb7f64d>.username != <0x4d7e6904>.username ||
				<0x8fb7f64d>.password != <0x4d7e6904>.password ||
				<0x8fb7f64d>.broadcast_enabled != <0x4d7e6904>.broadcast_enabled)
			ui_memcard_autosave_replace
			return
		endif
	endif
	generic_event_back
endscript

script twitter_register_callback \{controller = !i1768515945}
	if (<Result> = success)
		printf \{qs(0x56b075fe)
			channel = twitter}
		return
	endif
	printf \{qs(0x462bca5b)
		channel = twitter}
endscript

script twitter_unregister_callback \{controller = !i1768515945}
	if (<Result> = success)
		printf \{qs(0xc34dbf56)
			channel = twitter}
		return
	endif
	printf \{qs(0x39dcbe2b)
		channel = twitter}
endscript

script twitter_post_callback \{controller = !i1768515945
		retry_on_fail = !i1768515945}
	if (<Result> = success)
		printf \{qs(0x9481cb42)
			channel = twitter}
		printf qs(0xa77146ee) m = <message> channel = twitter
		printf \{qs(0x03ac90f0)
			channel = twitter}
		return
	endif
	printf \{qs(0xb9953b24)
		channel = twitter}
	if (<retry_on_fail> = 1)
		if 0x959f4979 controller = <controller>
			twitter_register username = (<twitter_info>.username) password = (<twitter_info>.password) controller = <controller>
			printf \{qs(0xe17c2f3e)
				channel = twitter}
			twitter_post message = <message> controller = <controller> retry_on_fail = 0
		endif
	endif
endscript

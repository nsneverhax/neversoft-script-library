
script twitter_register {
		0x55 username
		0x55 password
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	setbuttoneventmappings \{block_menu_input}
	netsessionfunc {
		obj = twitter
		func = register_account
		params = {
			controller_index = <controller>
			username = <username>
			password = <password>
			callback = twitter_register_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script twitter_register_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}}
	if (<result> = success)
		printf \{qs(0x6cc1b30e)}
		<status> = register_success
		<did_succeed> = 1
	else
		printf \{qs(0xb0d8aa77)}
		<status> = register_fail
		<did_succeed> = 0
	endif
	twitter_figured_out_can_post result = <result> registered = <did_succeed> controller_index = <controller>
	<callback_params> = {<callback_params> did_succeed = <did_succeed> status = <status> error_code = <error_code> controller = <controller>}
	spawnscript <callback> params = {<callback_params>}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script twitter_unregister {
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	setbuttoneventmappings \{block_menu_input}
	if screenelementexists \{id = dialog_box_desc_id}
		dialog_box_desc_id :obj_spawnscriptnow \{social_networks_animate_load}
	endif
	netsessionfunc {
		obj = twitter
		func = unregister_account
		params = {
			controller_index = <controller>
			callback = twitter_unregister_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script twitter_unregister_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}}
	if (<result> = success)
		printf \{qs(0x96eafdd3)}
		<status> = unregister_success
		<did_succeed> = 1
	else
		printf \{qs(0x1af9c732)}
		<status> = unregister_fail
		<did_succeed> = 0
	endif
	twitter_figured_out_can_post result = success registered = 0 controller_index = <controller>
	<callback_params> = {<callback_params> did_succeed = <did_succeed> status = <status> error_code = <error_code> controller = <controller>}
	spawnscript <callback> params = {<callback_params>}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script twitter_is_registered {
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	setbuttoneventmappings \{block_menu_input}
	netsessionfunc {
		obj = twitter
		func = is_registered
		params = {
			controller_index = <controller>
			callback = twitter_is_registered_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script twitter_is_registered_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}}
	<callback_params> = {<callback_params> registered = <registered>}
	spawnscript <callback> params = {<callback_params>}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script twitter_post \{message_struct = 0x69696969
		callback = nullscript
		callback_params = {
		}}
	printf \{qs(0x083ce3bf)}
	printstruct <...>
	setbuttoneventmappings \{block_menu_input}
	twitter_text = (<message_struct>.preset_text)
	if structurecontains structure = <message_struct> custom_text
		formattext textname = twitter_text qs(0x6ecbac27) a = (<message_struct>.custom_text) b = (<message_struct>.preset_text)
	endif
	curr_callback = twitter_post_callback
	curr_callback_params = {message_struct = <message_struct> callback = <callback> callback_params = <callback_params>}
	social_networks_strip_bad_chars string = <twitter_text> out_param = twitter_text
	if checkforsignin
		if NOT netsessionfunc {
				obj = twitter
				func = post
				params = {
					controller_index = (<message_struct>.controller)
					message = <twitter_text>
					callback = <curr_callback>
					callback_params = <curr_callback_params>
				}
			}
			curr_callback_params = {<curr_callback_params> result = failed error_code = twitter_unknown_error}
			<curr_callback> <curr_callback_params>
		endif
	else
		curr_callback_params = {<curr_callback_params> result = failed error_code = twitter_unknown_error}
		<curr_callback> <curr_callback_params>
	endif
endscript

script twitter_post_callback \{message_struct = 0x69696969
		callback = nullscript
		callback_params = {
		}}
	printf \{qs(0x53c4b0fa)}
	if (<result> = success)
		printf \{qs(0x9481cb42)}
		printf qs(0xa77146ee) m = (<message_struct>.preset_text)
		printf \{qs(0x03ac90f0)}
		<status> = post_success
		<did_succeed> = 1
	else
		printf \{qs(0xb9953b24)}
		<status> = post_fail
		<did_succeed> = 0
	endif
	<callback_params> = {<callback_params> message_struct = <message_struct> did_succeed = <did_succeed> status = <status> error_code = <error_code>}
	spawnscript <callback> params = {<callback_params>}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script twitter_get_info \{controller = !i1768515945}
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> user_options param = twitter_info
	return twitter_info = <twitter_info>
endscript

script twitter_set_info \{element = !q1768515945
		controller = !i1768515945}
	requireparams \{[
			value
		]
		all}
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> user_options param = twitter_info
	removecomponent structure_name = twitter_info name = <element>
	addparam structure_name = twitter_info name = <element> value = <value>
	setglobaltags savegame = <savegame> user_options params = {twitter_info = <twitter_info>}
endscript

script twitter_broadcast_is_enabled {
		0x52 controller = ($primary_controller)
	}
	return \{true}
endscript

script twitter_accepted_terms {
		0x52 controller = ($primary_controller)
	}
	twitter_get_info controller = <controller>
	if ((<twitter_info>.accepted_terms) = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script twitter_check_is_registered_flag {
		0x52 controller = ($primary_controller)
	}
	controller_index = <controller>
	if isps3
		controller_index = 0
	endif
	ret = false
	if ($g_twitter_can_post [<controller_index>] = 1)
		ret = true
	endif
	return <ret>
endscript
g_twitter_can_post = [
	0
	0
	0
	0
	0
	0
	0
	0
]

script twitter_figure_out_can_post \{controller_index = !i1768515945}
	printf \{qs(0xeca79385)}
	extra_callback = <callback>
	extra_callback_params = <callback_params>
	netsessionfunc {
		obj = twitter
		func = is_registered
		params = {
			controller_index = <controller_index>
			callback = twitter_figured_out_can_post
			callback_params = {
				controller_index = <controller_index>
				extra_callback = <extra_callback>
				extra_callback_params = <extra_callback_params>
			}
		}
	}
endscript

script twitter_figured_out_can_post 
	printf qs(0xa7ed0c62) d = <controller_index>
	if isps3
		controller_index = 0
	endif
	if checksumequals a = <result> b = success
		if (<registered> = 1)
			setarrayelement globalarray arrayname = g_twitter_can_post index = <controller_index> newvalue = 1
		else
			setarrayelement globalarray arrayname = g_twitter_can_post index = <controller_index> newvalue = 0
		endif
	endif
	if gotparam \{extra_callback}
		<extra_callback> <extra_callback_params> result = <result> error_code = <error_code>
	endif
endscript

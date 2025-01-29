
script twitter_register {
		0x55 username
		0x55 password
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	SetButtonEventMappings \{block_menu_input}
	NetSessionFunc {
		Obj = twitter
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
		}
		registered_accounts = [
		]
		dev_error_code = 0
		error_code = None}
	if (<Result> = success)
		printf \{qs(0x6cc1b30e)}
		<status> = register_success
		<did_succeed> = 1
		GetArraySize (<registered_accounts>)
		if (<array_Size> > 0)
			twitter_set_info controller = ($primary_controller) element = account_id value = (<registered_accounts> [0].account_id)
		else
			ScriptAssert \{'twitter_register_callback succeeded but failed to return an account id'}
		endif
	else
		printf \{qs(0xb0d8aa77)}
		<status> = register_fail
		<did_succeed> = 0
	endif
	twitter_figured_out_can_post Result = <Result> registered = <did_succeed> controller_index = <controller>
	<callback_params> = {<callback_params> did_succeed = <did_succeed> status = <status> error_code = <error_code> controller = <controller> dev_error_code = <dev_error_code>}
	spawnscript <callback> params = {<callback_params>}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script twitter_unregister {
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	SetButtonEventMappings \{block_menu_input}
	if ScreenElementExists \{id = dialog_box_desc_id}
		dialog_box_desc_id :Obj_SpawnScriptNow \{social_networks_animate_load}
	endif
	twitter_get_info
	NetSessionFunc {
		Obj = twitter
		func = unregister_account
		params = {
			account_id = (<twitter_info>.account_id)
			controller_index = <controller>
			callback = twitter_unregister_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script twitter_unregister_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}
		dev_error_code = 0
		error_code = None}
	if (<Result> = success)
		printf \{qs(0x96eafdd3)}
		<status> = unregister_success
		<did_succeed> = 1
	else
		printf \{qs(0x1af9c732)}
		<status> = unregister_fail
		<did_succeed> = 0
	endif
	<callback_params> = {<callback_params> did_succeed = <did_succeed> status = <status> error_code = <error_code> controller = <controller> dev_error_code = <dev_error_code>}
	spawnscript <callback> params = {<callback_params>}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script twitter_post \{message_struct = 0x69696969
		callback = nullscript
		callback_params = {
		}}
	printf \{qs(0x083ce3bf)}
	printstruct <...>
	SetButtonEventMappings \{block_menu_input}
	twitter_text = (<message_struct>.preset_text)
	if StructureContains structure = <message_struct> custom_text
		formatText TextName = twitter_text qs(0x6ecbac27) a = (<message_struct>.custom_text) b = (<message_struct>.preset_text)
	endif
	curr_callback = twitter_post_callback
	curr_callback_params = {message_struct = <message_struct> callback = <callback> callback_params = <callback_params>}
	social_networks_strip_bad_chars string = <twitter_text> out_param = twitter_text
	twitter_get_info
	if CheckForSignIn
		if NOT NetSessionFunc {
				Obj = twitter
				func = post
				params = {
					controller_index = (<message_struct>.controller)
					message = <twitter_text>
					callback = <curr_callback>
					callback_params = <curr_callback_params>
					account_id = (<twitter_info>.account_id)
				}
			}
			curr_callback_params = {<curr_callback_params> Result = failed error_code = twitter_unknown_error}
			<curr_callback> <curr_callback_params>
		endif
	else
		curr_callback_params = {<curr_callback_params> Result = failed error_code = twitter_unknown_error}
		<curr_callback> <curr_callback_params>
	endif
endscript

script twitter_post_callback \{message_struct = 0x69696969
		callback = nullscript
		callback_params = {
		}
		dev_error_code = 0
		error_code = None}
	printf \{qs(0x53c4b0fa)}
	if (<Result> = success)
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
	<callback_params> = {<callback_params> message_struct = <message_struct> did_succeed = <did_succeed> status = <status> error_code = <error_code> dev_error_code = <dev_error_code>}
	spawnscript <callback> params = {<callback_params>}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script twitter_get_info \{controller = 0}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = twitter_info
	return twitter_info = <twitter_info>
endscript

script twitter_set_info \{element = !q1768515945
		controller = 0}
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
		return \{FALSE}
	endif
endscript

script twitter_check_is_registered_flag \{controller = 0}
	ret = FALSE
	if (($register_account) = 1)
		<ret> = FALSE
	else
		controller_index = <controller>
		if ((isps3) || (isngc))
			controller_index = 0
		endif
		<ret> = FALSE
		if ($g_twitter_can_post [<controller_index>] = 1)
			<ret> = true
		endif
		twitter_get_info
		if NOT is_net_id_zero net_id = (<twitter_info>.account_id)
			<ret> = true
		endif
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
	NetSessionFunc {
		Obj = twitter
		func = get_registered_accounts
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

script twitter_figured_out_can_post \{controller_index = 0}
	printf qs(0xa7ed0c62) d = <controller_index>
	if ((isps3) || (isngc))
		controller_index = 0
	endif
	if checksumequals a = <Result> b = success
		if (<registered> = 1)
			SetArrayElement globalarray ArrayName = g_twitter_can_post index = <controller_index> NewValue = 1
		else
			SetArrayElement globalarray ArrayName = g_twitter_can_post index = <controller_index> NewValue = 0
		endif
	endif
	if GotParam \{extra_callback}
		<extra_callback> <extra_callback_params> Result = <Result> error_code = <error_code>
	endif
endscript

script twitter_get_registered_accounts 
	printf \{'-- twitter_get_registered_accounts --'}
	NetSessionFunc \{Obj = twitter
		func = get_registered_accounts
		params = {
			callback = twitter_get_registered_accounts_callback
		}}
endscript

script twitter_get_registered_accounts_callback \{registered_accounts = !a1768515945
		Result = !q1768515945
		error_code = None
		dev_error_code = 0}
	printf \{'-- twitter_get_registered_accounts_callback --'}
	GetArraySize (<registered_accounts>)
	i = 0
	array = []
	if (<array_Size> > 0)
		begin
		if NOT ((<registered_accounts> [<i>].account_name) = qs(0x03ac90f0))
			AddArrayElement {
				array = <array>
				element = {
					account_id = ((<registered_accounts> [<i>]).account_id)
					account_name = ((<registered_accounts> [<i>]).account_name)
				}
			}
		endif
		<i> = (<i> + 1)
		repeat (<array_Size>)
	endif
	printstruct <...>
	broadcastevent {
		Type = social_networks_get_registered_accounts
		data = {
			Result = <Result>
			registered_accounts = <array>
			error_code = <error_code>
			dev_error_code = <dev_error_code>
		}
	}
endscript

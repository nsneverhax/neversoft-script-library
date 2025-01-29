
script facebook_register {
		0x55 username
		0x55 password
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	SetButtonEventMappings \{block_menu_input}
	NetSessionFunc {
		Obj = facebook
		func = register_account
		params = {
			controller_index = <controller>
			username = <username>
			password = <password>
			callback = facebook_register_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script facebook_register_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}}
	if (<Result> = success)
		printf \{qs(0x6874bf22)}
		<status> = register_success
		<did_succeed> = 1
	else
		printf \{qs(0x1751757c)}
		<status> = register_fail
		<did_succeed> = 0
	endif
	facebook_figured_out_can_post Result = <Result> registered = <did_succeed> controller_index = <controller>
	<callback_params> = {<callback_params> did_succeed = <did_succeed> status = <status> error_code = <error_code> controller = <controller>}
	spawnscript <callback> params = {<callback_params>}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script facebook_unregister {
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	SetButtonEventMappings \{block_menu_input}
	if ScreenElementExists \{id = dialog_box_desc_id}
		dialog_box_desc_id :Obj_SpawnScriptNow \{social_networks_animate_load}
	endif
	NetSessionFunc {
		Obj = facebook
		func = unregister_account
		params = {
			controller_index = <controller>
			callback = facebook_unregister_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script facebook_unregister_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}}
	if (<Result> = success)
		printf \{qs(0x0dcbba39)}
		<status> = unregister_success
		<did_succeed> = 1
	else
		printf \{qs(0xe02c110e)}
		<status> = unregister_fail
		<did_succeed> = 0
	endif
	facebook_figured_out_can_post Result = success registered = 0 controller_index = <controller>
	<callback_params> = {<callback_params> did_succeed = <did_succeed> status = <status> error_code = <error_code> controller = <controller>}
	spawnscript <callback> params = {<callback_params>}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script facebook_is_registered {
		0x52 controller = ($primary_controller)
		0x54 callback = nullscript
		0x59 callback_params = {}
	}
	SetButtonEventMappings \{block_menu_input}
	NetSessionFunc {
		Obj = facebook
		func = is_registered
		params = {
			controller_index = <controller>
			callback = facebook_is_registered_callback
			callback_params = {controller = <controller> callback = <callback> callback_params = <callback_params>}
		}
	}
endscript

script facebook_is_registered_callback \{controller = !i1768515945
		callback = nullscript
		callback_params = {
		}}
	<callback_params> = {<callback_params> registered = <registered>}
	spawnscript <callback> params = {<callback_params>}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script facebook_post \{message_struct = 0x69696969
		callback = nullscript
		callback_params = {
		}}
	printf \{qs(0x93f46d9c)}
	printstruct <...>
	SetButtonEventMappings \{block_menu_input}
	<params> = {
		controller_index = (<message_struct>.controller)
		callback = facebook_post_callback
		callback_params = {message_struct = <message_struct> callback = <callback> callback_params = <callback_params>}
	}
	if StructureContains structure = <message_struct> image_url
		if StructureContains structure = <message_struct> image_href
			<params> = {
				<params>
				image_url = (<message_struct>.image_url)
				image_href = (<message_struct>.image_href)
			}
		endif
	endif
	if StructureContains structure = <message_struct> custom_text
		<params> = {
			<params>
			message = (<message_struct>.custom_text)
		}
	endif
	if StructureContains structure = <message_struct> facebook_name
		facebook_name = (<message_struct>.facebook_name)
		social_networks_strip_bad_chars string = <facebook_name> out_param = facebook_name
		<params> = {
			<params>
			Name = <facebook_name>
		}
	endif
	if StructureContains structure = <message_struct> facebook_caption
		facebook_caption = (<message_struct>.facebook_caption)
		social_networks_strip_bad_chars string = <facebook_caption> out_param = facebook_caption
		<params> = {
			<params>
			caption = <facebook_caption>
		}
	endif
	if StructureContains structure = <message_struct> facebook_description
		facebook_description = (<message_struct>.facebook_description)
		social_networks_strip_bad_chars string = <facebook_description> out_param = facebook_description
		<params> = {
			<params>
			description = <facebook_description>
		}
	endif
	if CheckForSignIn
		if NOT NetSessionFunc {
				Obj = facebook
				func = post
				params = <params>
			}
			curr_callback = (<params>.callback)
			curr_callback_params = {(<params>.callback_params) Result = failed error_code = facebook_unknown_error}
			<curr_callback> <curr_callback_params>
		endif
	else
		curr_callback = (<params>.callback)
		curr_callback_params = {(<params>.callback_params) Result = failed error_code = facebook_unknown_error}
		<curr_callback> <curr_callback_params>
	endif
endscript

script facebook_post_callback \{message_struct = 0x69696969
		callback = nullscript
		callback_params = {
		}}
	printf \{qs(0xca2dab9d)}
	if (<Result> = success)
		printf \{qs(0x9481cb42)}
		printf qs(0xa77146ee) m = (<message_struct>.text)
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
	SetButtonEventMappings \{unblock_menu_input}
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

script facebook_broadcast_is_enabled {
		0x52 controller = ($primary_controller)
	}
	return \{true}
endscript

script facebook_accepted_terms {
		0x52 controller = ($primary_controller)
	}
	facebook_get_info controller = <controller>
	if ((<facebook_info>.accepted_terms) = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script facebook_check_is_registered_flag {
		0x52 controller = ($primary_controller)
	}
	controller_index = <controller>
	if isps3
		controller_index = 0
	endif
	ret = FALSE
	if ($g_facebook_can_post [<controller_index>] = 1)
		ret = true
	endif
	return <ret>
endscript
g_facebook_can_post = [
	0
	0
	0
	0
	0
	0
	0
	0
]

script facebook_figure_out_can_post \{controller_index = !i1768515945}
	extra_callback = <callback>
	extra_callback_params = <callback_params>
	NetSessionFunc {
		Obj = facebook
		func = is_registered
		params = {
			controller_index = <controller_index>
			callback = facebook_figured_out_can_post
			callback_params = {
				controller_index = <controller_index>
				extra_callback = <extra_callback>
				extra_callback_params = <extra_callback_params>
			}
		}
	}
endscript

script facebook_figured_out_can_post 
	printf qs(0x261778b5) d = <controller_index>
	if isps3
		controller_index = 0
	endif
	if checksumequals a = <Result> b = success
		if (<registered> = 1)
			SetArrayElement globalarray ArrayName = g_facebook_can_post index = <controller_index> NewValue = 1
		else
			SetArrayElement globalarray ArrayName = g_facebook_can_post index = <controller_index> NewValue = 0
		endif
	endif
	if GotParam \{extra_callback}
		<extra_callback> <extra_callback_params> Result = <Result> error_code = <error_code>
	endif
endscript

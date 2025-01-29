friend_feed_defs = [
	{
		titleid = 5263
		def = gh6_friend_feed_def
	}
	{
		titleid = 5264
		def = gh6_friend_feed_def
	}
]
gh6_friend_feed_def = {
	game_variables = {
		retrievable = [
			{
				Name = score
				Type = int
			}
			{
				Name = num_songs
				Type = int
			}
			{
				Name = star_count
				Type = int
			}
			{
				Name = instrument_type
				Type = enumeration
				values = [
					{
						Name = guitar
						value = qs(0x09048d9e)
					}
					{
						Name = bass
						value = qs(0xb6237ee8)
					}
					{
						Name = drums
						value = qs(0xbcbd3cf7)
					}
					{
						Name = vocals
						value = qs(0x879f5b50)
					}
				]
			}
			{
				Name = song_name
				Type = function_lookup
				value = ff_get_song_string
			}
		]
		passable = [
			{
				Name = encore_complete
				Type = enumeration
				values = [
					{
						Name = quest_chapter_pandora
						value = qs(0x0dee3094)
					}
					{
						Name = quest_chapter_judy
						value = qs(0x5e7bf074)
					}
					{
						Name = quest_chapter_casey
						value = qs(0x08eb1c35)
					}
					{
						Name = quest_chapter_axel
						value = qs(0x30867e8d)
					}
					{
						Name = quest_chapter_johnny
						value = qs(0x4d75ec17)
					}
					{
						Name = quest_chapter_newfemale
						value = qs(0x35e65374)
					}
					{
						Name = quest_chapter_newmale
						value = qs(0x3eec17e4)
					}
					{
						Name = quest_chapter_lars
						value = qs(0x8fce59b7)
					}
					{
						Name = quest_chapter_finale
						value = qs(0xb5bd032e)
					}
					{
						Name = quest_chapter_demigod
						value = qs(0x865bc98d)
					}
				]
			}
			{
				Name = item_type
				Type = enumeration
				values = [
					{
						Name = cas
						value = qs(0x3546f363)
					}
					{
						Name = venue
						value = qs(0x09bc6def)
					}
					{
						Name = venue_reward
						value = qs(0x09bc6def)
					}
					{
						Name = character
						value = qs(0xe75bddf8)
					}
					{
						Name = cheat
						value = qs(0xb55b2189)
					}
					{
						Name = cas_texture
						value = qs(0x6761b7dc)
					}
				]
			}
		]
		do_not_send = [
			gamertag_string
		]
	}
	message_array = [
		{
			Name = 0x95031b48
			consolidate = 1
			Priority = 1
			shortcut = 0xe151797b
			cross_title = 1
			strings = [
				{
					Type = Default
					format_string = qs(0x29cca53e)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
						{
							Name = b
							value = instrument_type
						}
					]
				}
				{
					Type = facebook
					format_string = qs(0x29cca53e)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
						{
							Name = b
							value = instrument_type
						}
					]
					image_url = qs(0x80ed4126)
				}
				{
					Type = twitter
					format_string = qs(0xf7b85dc1)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
						{
							Name = b
							value = instrument_type
						}
					]
				}
			]
			passed_variables = [
			]
		}
		{
			Name = cheated
			consolidate = 0
			Priority = 1
			shortcut = None
			cross_title = 0
			strings = [
				{
					Type = Default
					format_string = qs(0x1d673475)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
						{
							Name = b
							value = song_name
						}
					]
				}
			]
			passed_variables = [
			]
		}
		{
			Name = created_rocker
			consolidate = 0
			Priority = 1
			shortcut = car
			cross_title = 0
			strings = [
				{
					Type = Default
					format_string = qs(0xef699da9)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
					]
				}
			]
			passed_variables = [
			]
		}
		{
			Name = encore_complete
			consolidate = 0
			Priority = 1
			shortcut = car
			cross_title = 0
			strings = [
				{
					Type = Default
					format_string = qs(0xfbc8ae3e)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
						{
							Name = b
							value = encore_complete
						}
					]
				}
			]
			passed_variables = [
			]
		}
		{
			Name = unlock_item_type
			consolidate = 0
			Priority = 1
			shortcut = band_lobby
			cross_title = 0
			strings = [
				{
					Type = Default
					format_string = qs(0xfe5ff809)
					string_items = [
						{
							Name = a
							value = gamertag_string
						}
						{
							Name = b
							value = item_type
						}
					]
				}
			]
			passed_variables = [
				item_type
			]
		}
	]
}
g_friend_feed_extra_output = 0
g_friend_feed_additional_asserts = 0

script friend_feed_test 
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x76ecdc10)}
	endif
	if friend_feed_get_message_structure \{titleid = 5263
			msg_type = Default
			event = unlock_item_type
			Platform = xen
			item_type = cas
			out_param = the_string
			out_image = the_image
			controller_index = 0
			Player = 1
			gamertag_string = 'derpy'}
		printf \{qs(0xd3c26582)}
	else
		printf \{qs(0x05731881)}
	endif
	printstruct <...>
endscript

script friend_feed_get_message_structure \{titleid = !i1768515945
		event = !q1768515945
		msg_type = !q1768515945
		controller_index = !i1768515945
		Player = !i1768515945
		out_param = !q1768515945}
	printf \{qs(0x1b503bb8)}
	ret = true
	friend_feed_get_msg_def titleid = <titleid> event = <event> out_param = msg_def
	friend_feeed_get_variable_definitions titleid = <titleid> out_param = variable_defs
	if friend_feed_check_dynamic_params msg_def = <msg_def> <...>
		if friend_feed_get_msg_string_def msg_def = <msg_def> msg_type = <msg_type> out_param = string_def
			GetArraySize (<string_def>.string_items)
			i = 0
			return_struct = {}
			begin
			value_to_get = (<string_def>.string_items [<i>].value)
			if friend_feed_should_add_variable variable = <value_to_get> titleid = <titleid>
				if NOT GotParam <value_to_get>
					if friend_feed_can_lookup_value variable_defs = <variable_defs> variable_name = <value_to_get>
						printf qs(0x06fb400d) d = <value_to_get>
					endif
					if ff_get_source_value controller_index = <controller_index> Type = <value_to_get> Player = <Player>
						tmp_param = <value>
					else
						printf qs(0xc4979b50) s = <value_to_get>
						ret = FALSE
						break
					endif
				else
					tmp_param = (<...>.<value_to_get>)
				endif
				if GotParam \{tmp_param}
					AddParam structure_name = tmp_struct Name = <value_to_get> value = <tmp_param>
					RemoveParameter \{tmp_param}
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
			if GotParam \{tmp_struct}
				AddParam structure_name = return_struct Name = <out_param> value = <tmp_struct>
			endif
		else
			printf qs(0x336319b4) d = <event> e = <msg_type>
		endif
	else
		ret = FALSE
	endif
	return <ret> <return_struct>
endscript

script friend_feed_get_message_string_from_message \{Platform = !q1768515945
		titleid = !i1768515945
		event = !q1768515945
		msg_type = !q1768515945
		msg = 0x69696969
		gamertag_string = 0x69696969
		out_string = !q1768515945
		out_params = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x1b1e5629)}
	endif
	ret = FALSE
	if friend_feed_get_msg_def titleid = <titleid> event = <event> out_param = msg_def
		friend_feeed_get_variable_definitions titleid = <titleid> out_param = variable_defs
		if friend_feed_get_msg_string_def msg_def = <msg_def> msg_type = <msg_type> out_param = string_def
			msg_params = {<msg> gamertag_string = <gamertag_string>}
			if friend_feed_verify_all_params msg_params = <msg_params> string_def = <string_def>
				friend_feed_get_string_format_params msg_params = <msg_params> string_def = <string_def> variable_defs = <variable_defs> out_param = format_params
				formatText TextName = tmp_string (<string_def>.format_string) <format_params>
				if GotParam \{tmp_string}
					AddParam structure_name = return_struct Name = <out_string> value = <tmp_string>
					AddParam {
						structure_name = return_struct
						Name = <out_params>
						value = {
							consolidate = (<msg_def>.consolidate)
							cross_title = (<msg_def>.cross_title)
							shortcut = (<msg_def>.shortcut)
							Priority = (<msg_def>.Priority)
						}
					}
					ret = true
				endif
			endif
		endif
	endif
	return <ret> <return_struct>
endscript

script friend_feed_get_message_string \{Platform = !q1768515945
		titleid = !i1768515945
		Player = !i1768515945
		controller_index = !i1768515945
		event = !q1768515945
		msg_type = !q1768515945
		out_param = !q1768515945}
	printf \{qs(0x3ce8cd3d)}
	ret = FALSE
	getlocalgamertag controller = <controller_index>
	gamertag_string = <gamertag>
	RemoveParameter \{gamertag}
	friend_feed_get_msg_def titleid = <titleid> event = <event> out_param = msg_def
	friend_feeed_get_variable_definitions titleid = <titleid> out_param = variable_defs
	if friend_feed_get_msg_string_def msg_def = <msg_def> msg_type = <msg_type> out_param = string_def
		tmp_struct_pass = <...>
		AddParam \{structure_name = tmp_struct_pass
			Name = out_param
			value = msg_struct}
		if friend_feed_get_message_structure <tmp_struct_pass>
			msg_struct = {<msg_struct> gamertag_string = <gamertag_string>}
			if friend_feed_verify_all_params msg_params = <msg_struct> string_def = <string_def>
				friend_feed_get_string_format_params msg_params = <msg_struct> string_def = <string_def> variable_defs = <variable_defs> out_param = format_params
				formatText TextName = tmp_string (<string_def>.format_string) <format_params>
				if GotParam \{tmp_string}
					AddParam structure_name = return_struct Name = <out_param> value = <tmp_string>
					if GotParam \{out_image}
						image_url = qs(0x00000000)
						friend_feed_get_message_image_url string_def = <string_def> out_param = image_url
						AddParam structure_name = return_struct Name = <out_image> value = <image_url>
					endif
					ret = true
				endif
			endif
		endif
	endif
	return <ret> <return_struct>
endscript

script friend_feed_test_all_messages {
	}
	printf \{qs(0x024306c7)}
	GetArraySize ($friend_feed_defs)
	i = 0
	begin
	printf qs(0xf13d3432) d = ($friend_feed_defs [<i>].def)
	friend_feed_def = ($friend_feed_defs [<i>].def)
	friend_feed_test_definition feed_def = ($<friend_feed_def>) titleid = ($friend_feed_defs [<i>].titleid)
	i = (<i> + 1)
	repeat <array_Size>
endscript

script friend_feed_get_message_image_url \{string_def = 0x69696969
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0xf2cbfe4e)}
	endif
	ret = FALSE
	if StructureContains structure = <string_def> Name = image_url
		tmp_image = (<string_def>.image_url)
		AddParam structure_name = return_struct Name = <out_param> value = <tmp_image>
		ret = true
	endif
	return <ret> <return_struct>
endscript

script friend_feed_test_definition \{feed_def = 0x69696969
		titleid = !i1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x877005da)}
	endif
	friend_feed_get_general_test_params feed_def = <feed_def> titleid = <titleid> out_param = test_params
	var_defs = (<feed_def>.game_variables)
	GetArraySize (<feed_def>.message_array)
	i = 0
	begin
	appended_test_params = <test_params>
	AddParam structure_name = appended_test_params Name = event value = (<feed_def>.message_array [<i>].Name)
	friend_feed_test_message feed_msg = (<feed_def>.message_array [<i>]) var_defs = <var_defs> test_params = <appended_test_params>
	i = (<i> + 1)
	repeat <array_Size>
endscript

script friend_feed_get_general_test_params \{feed_def = 0x69696969
		titleid = !i1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x57479860)}
	endif
	ret = true
	tmp_struct = {}
	AddParam \{structure_name = tmp_struct
		Name = gamertag_string
		value = 'gamertag_string'}
	AddParam structure_name = tmp_struct Name = titleid value = <titleid>
	AddParam \{structure_name = tmp_struct
		Name = Platform
		value = xbox360}
	AddParam structure_name = return_struct Name = <out_param> value = <tmp_struct>
	return <ret> <return_struct>
endscript

script friend_feed_test_message \{feed_msg = 0x69696969
		var_defs = 0x69696969
		test_params = 0x69696969}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0xd391be37)}
	endif
	printf qs(0x7c1e2320) d = (<feed_msg>.Name)
	passed_vars = (<feed_msg>.passed_variables)
	GetArraySize (<feed_msg>.strings)
	i = 0
	begin
	printf qs(0x9a47b7c1) d = (<feed_msg>.strings [<i>].Type)
	appended_test_params = <test_params>
	AddParam structure_name = appended_test_params Name = msg_type value = (<feed_msg>.strings [<i>].Type)
	if friend_feed_test_message_string {
			msg_string = (<feed_msg>.strings [<i>])
			var_defs = <var_defs>
			passed_vars = <passed_vars>
			test_params = <appended_test_params>
			out_param = test_string
		}
		printf qs(0x63852812) a = <test_string>
	else
		printf \{qs(0x0e98f901)}
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script friend_feed_test_message_string \{msg_string = 0x69696969
		var_defs = 0x69696969
		passed_vars = !a1768515945
		test_params = 0x69696969
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x1f0bd697)}
	endif
	ret = FALSE
	if friend_feed_generate_dummy_message passed_vars = <passed_vars> string_def = <msg_string> var_defs = <var_defs> titleid = (<test_params>.titleid) out_param = dummy_msg_struct
		if friend_feed_get_message_string_from_message {
				<test_params>
				msg = <dummy_msg_struct>
				out_string = tmp_string
				out_params = tmp_params
			}
			AddParam structure_name = return_struct Name = <out_param> value = <tmp_string>
			ret = true
		else
		endif
	else
		printf \{qs(0x575a8c20)}
	endif
	return <ret> <return_struct>
endscript

script friend_feed_generate_dummy_message \{string_def = 0x69696969
		var_defs = 0x69696969
		passed_vars = !a1768515945
		titleid = !i1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0xe00c010f)}
	endif
	ret = true
	GetArraySize (<string_def>.string_items)
	i = 0
	return_struct = {}
	tmp_struct = {}
	begin
	value_to_add = (<string_def>.string_items [<i>].value)
	if friend_feed_should_add_variable titleid = <titleid> variable = <value_to_add>
		if friend_feed_find_variable_definition variable_defs = <var_defs> variable_name = <value_to_add> out_param = variable_def
		else
			printf qs(0x4270be98) d = <value_to_add>
		endif
		formatText TextName = dummy_value qs(0x35b12509) a = <value_to_add> DontAssertForChecksums
		AddParam structure_name = tmp_struct Name = <value_to_add> value = <dummy_value>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	GetArraySize <passed_vars>
	if (<array_Size> > 0)
		i = 0
		begin
		value_to_add = (<passed_vars> [<i>])
		formatText TextName = dummy_value qs(0x35b12509) a = <value_to_add> DontAssertForChecksums
		AddParam structure_name = tmp_struct Name = <value_to_add> value = <dummy_value>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{tmp_struct}
		AddParam structure_name = return_struct Name = <out_param> value = <tmp_struct>
	endif
	return <ret> <return_struct>
endscript

script friend_feed_lookup_value_from_checksum \{variable_defs = 0x69696969
		variable_name = !q1768515945
		variable_value = !q1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x87e34134)}
	endif
	ret = FALSE
	if friend_feed_find_variable_definition variable_defs = <variable_defs> variable_name = <variable_name> out_param = variable_def
		if checksumequals a = (<variable_def>.Type) b = enumeration
			GetArraySize (<variable_def>.values)
			i = 0
			begin
			if checksumequals a = (<variable_def>.values [<i>].Name) b = <variable_value>
				AddParam structure_name = return_struct Name = <out_param> value = (<variable_def>.values [<i>].value)
				ret = true
				break
			endif
			i = (<i> + 1)
			repeat <array_Size>
		elseif checksumequals a = (<variable_def>.Type) b = function_lookup
			function_to_call = (<variable_def>.value)
			if <function_to_call> param = <variable_value>
				AddParam structure_name = return_struct Name = <out_param> value = <Result>
				ret = true
			endif
		else
			printf qs(0x6ff71438) d = (<variable_def>.Type) c = <variable_name>
		endif
	endif
	return <ret> <return_struct>
endscript

script friend_feed_find_variable_definition \{variable_defs = 0x69696969
		variable_name = !q1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x0a42c467)}
	endif
	ret = FALSE
	GetArraySize (<variable_defs>.retrievable)
	if (<array_Size> > 0)
		i = 0
		begin
		if checksumequals a = (<variable_defs>.retrievable [<i>].Name) b = <variable_name>
			AddParam structure_name = return_struct Name = <out_param> value = (<variable_defs>.retrievable [<i>])
			ret = true
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<ret> = FALSE)
		GetArraySize (<variable_defs>.passable)
		if (<array_Size> > 0)
			i = 0
			begin
			if checksumequals a = (<variable_defs>.passable [<i>].Name) b = <variable_name>
				AddParam structure_name = return_struct Name = <out_param> value = (<variable_defs>.passable [<i>])
				ret = true
				break
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return <ret> <return_struct>
endscript

script friend_feeed_get_variable_definitions \{titleid = !i1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x3f091577)}
	endif
	ret = FALSE
	ret = FALSE
	if friend_feed_get_product_feed_def titleid = <titleid> out_param = feed_def
		AddParam structure_name = return_struct Name = <out_param> value = (<feed_def>.game_variables)
		ret = true
	endif
	return <ret> <return_struct>
endscript

script friend_feed_should_add_variable \{variable = !q1768515945
		titleid = !i1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x1265d423)}
	endif
	ret = true
	if friend_feed_get_product_feed_def titleid = <titleid> out_param = feed_def
		GetArraySize (<feed_def>.game_variables.do_not_send)
		i = 0
		begin
		if checksumequals a = <variable> b = (<feed_def>.game_variables.do_not_send [<i>])
			ret = FALSE
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return <ret>
endscript

script friend_feed_get_string_format_params \{msg_params = 0x69696969
		string_def = 0x69696969
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x4b858e4d)}
	endif
	ret = true
	GetArraySize (<string_def>.string_items)
	i = 0
	begin
	value_name = (<string_def>.string_items [<i>].value)
	if ischecksum (<msg_params>.<value_name>)
		if friend_feed_lookup_value_from_checksum {
				variable_defs = <variable_defs>
				variable_name = <value_name>
				variable_value = (<msg_params>.<value_name>)
				out_param = tmp_value
			}
			AddParam structure_name = tmp_struct Name = (<string_def>.string_items [<i>].Name) value = <tmp_value>
		else
			ScriptAssert qs(0x7149c3f0) d = <value_name>
		endif
	else
		AddParam structure_name = tmp_struct Name = (<string_def>.string_items [<i>].Name) value = (<msg_params>.<value_name>)
	endif
	i = (<i> + 1)
	repeat <array_Size>
	AddParam structure_name = return_struct Name = <out_param> value = <tmp_struct>
	return <ret> <return_struct>
endscript

script friend_feed_can_lookup_value \{variable_defs = 0x69696969
		variable_name = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x42c3c36c)}
	endif
	ret = FALSE
	GetArraySize (<variable_defs>.retrievable)
	i = 0
	begin
	if checksumequals a = (<variable_defs>.retrievable [<i>].Name) b = <variable_name>
		ret = true
		break
	endif
	repeat <array_Size>
	return <ret>
endscript

script friend_feed_verify_all_params \{msg_params = 0x69696969
		string_def = 0x69696969}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x2ef5ba87)}
	endif
	ret = true
	GetArraySize (<string_def>.string_items)
	i = 0
	begin
	if NOT StructureContains structure = <msg_params> Name = (<string_def>.string_items [<i>].value)
		printf qs(0xa7c5cf1f) d = (<string_def>.string_items [<i>].value)
		printstruct <msg_params>
		ret = FALSE
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return <ret>
endscript

script friend_feed_get_msg_string_def \{msg_def = 0x69696969
		msg_type = !q1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x3a4a1c8f)}
	endif
	ret = FALSE
	GetArraySize (<msg_def>.strings)
	i = 0
	begin
	if checksumequals a = (<msg_def>.strings [<i>].Type) b = <msg_type>
		ret = true
		AddParam structure_name = return_struct Name = <out_param> value = (<msg_def>.strings [<i>])
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return <ret> <return_struct>
endscript

script friend_feed_check_dynamic_params \{msg_def = 0x69696969}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0xf97cbf95)}
	endif
	ret = true
	GetArraySize (<msg_def>.passed_variables)
	if (0 < <array_Size>)
		i = 0
		begin
		if NOT GotParam (<msg_def>.passed_variables [<i>])
			printf qs(0xfaefa2eb) d = (<msg_def>.passed_variables [<i>])
			ret = FALSE
		endif
		repeat <array_Size>
	endif
	return <ret>
endscript

script friend_feed_get_msg_def \{titleid = !i1768515945
		event = !q1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x495128c4)}
	endif
	ret = FALSE
	if friend_feed_get_product_msgs titleid = <titleid> out_param = product_msgs
		GetArraySize <product_msgs>
		i = 0
		begin
		if checksumequals a = (<product_msgs> [<i>].Name) b = <event>
			ret = true
			AddParam structure_name = return_struct Name = <out_param> value = (<product_msgs> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return <ret> <return_struct>
endscript

script friend_feed_get_product_msgs \{titleid = !i1768515945
		out_param = !q1768515945}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x3decb5c8)}
	endif
	ret = FALSE
	if friend_feed_get_product_feed_def titleid = <titleid> out_param = feed_def
		AddParam structure_name = return_struct Name = <out_param> value = (<feed_def>.message_array)
		ret = true
	endif
	return <ret> <return_struct>
endscript

script friend_feed_get_product_feed_def {
		titleid = <titleid>
		0x54 out_param
	}
	if ($g_friend_feed_extra_output = 1)
		printf \{qs(0x2ee7a414)}
	endif
	ret = FALSE
	feed_def = NULL
	GetArraySize ($friend_feed_defs)
	i = 0
	begin
	if (($friend_feed_defs [<i>].titleid) = <titleid>)
		friend_feed_def = ($friend_feed_defs [<i>].def)
		ret = true
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	AddParam structure_name = return_struct Name = <out_param> value = ($<friend_feed_def>)
	return <ret> <return_struct>
endscript

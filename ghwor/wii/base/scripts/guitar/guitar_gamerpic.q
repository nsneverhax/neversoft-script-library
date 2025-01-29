
script gamerpic_sys_init 
	gamerpictextureinit \{max_pics = 16}
endscript

script gamerpic_set_screenelement_texture \{local_user_index = !i1768515945
		se_prop = !q1768515945
		failure_texture = !q1768515945
		loading_alpha_property = NULL}
	setscriptcannotpause
	if isngc
		return \{FALSE}
	endif
	if GotParam \{local_id}
	else
		if isps3
			RequireParams \{[
					net_id_gamertag
				]
				all}
			<net_id> = <net_id_gamertag>
		else
			RequireParams \{[
					net_id_64_bit
					local_user_index
				]
				all}
			<net_id> = <net_id_64_bit>
			if ((<local_user_index> < 0) || (<local_user_index> > 3))
				ScriptAssert 'gamerpic_set_screenelement_texture: bad controller index %i' i = <local_user_index>
				return
			endif
		endif
	endif
	<texture_to_use> = <failure_texture>
	if gamerpictexturerequest {
			local_user_index = <local_user_index>
			net_id = <net_id>
			local_id = <local_id>
		}
		if (<loading_alpha_property> != NULL)
			<props_struct> = {}
			AddParam structure_name = props_struct Name = <loading_alpha_property> value = 1.0
			se_setprops <props_struct>
		endif
		begin
		if gamerpictexturegetstatus {
				local_user_index = <local_user_index>
				net_id = <net_id>
				local_id = <local_id>
			}
			if (<status> = loaded)
				<texture_to_use> = <asset_name>
				break
			endif
			if ((<status> != loading) && (<status> != unloading))
				ScriptAssert 'gamerpic_set_screenelement_texture: some problem with status: %s' s = <status>
				break
			endif
		else
			printf \{channel = gamerpic
				'gamerpic_set_screenelement_texture: failed downloading image'}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		if (<loading_alpha_property> != NULL)
			AddParam structure_name = props_struct Name = <loading_alpha_property> value = 0.0
			se_setprops <props_struct>
		endif
	else
		printf \{channel = gamerpic
			'gamerpic_set_screenelement_texture: no room for new images..'}
	endif
	props_param = {}
	AddParam {
		structure_name = props_param
		Name = <se_prop>
		value = <texture_to_use>
	}
	printf channel = gamerpic 'gamerpic_set_screenelement_texture: texture is %s' s = <texture_to_use>
	se_setprops <props_param>
endscript

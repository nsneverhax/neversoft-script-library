
script gamerpic_sys_init 
	gamerpictextureinit \{max_pics = 34}
endscript

script gamerpic_set_screenelement_texture \{local_user_index = !i1768515945
		se_prop = !q1768515945
		failure_texture = !q1768515945
		loading_alpha_property = null}
	setscriptcannotpause
	if gotparam \{local_id}
	else
		if isps3
			requireparams \{[
					net_id_gamertag
				]
				all}
			<net_id> = <net_id_gamertag>
		else
			requireparams \{[
					net_id_64_bit
					local_user_index
				]
				all}
			<net_id> = <net_id_64_bit>
			if ((<local_user_index> < 0) || (<local_user_index> > 3))
				scriptassert 'gamerpic_set_screenelement_texture: bad controller index %i' i = <local_user_index>
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
		if (<loading_alpha_property> != null)
			<props_struct> = {}
			addparam structure_name = props_struct name = <loading_alpha_property> value = 1.0
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
				scriptassert 'gamerpic_set_screenelement_texture: some problem with status: %s' s = <status>
				break
			endif
		else
			printf \{channel = gamerpic
				'gamerpic_set_screenelement_texture: failed downloading image'}
			break
		endif
		wait \{1
			gameframe}
		repeat
		if (<loading_alpha_property> != null)
			addparam structure_name = props_struct name = <loading_alpha_property> value = 0.0
			se_setprops <props_struct>
		endif
	else
		printf \{channel = gamerpic
			'gamerpic_set_screenelement_texture: no room for new images..'}
	endif
	props_param = {}
	addparam {
		structure_name = props_param
		name = <se_prop>
		value = <texture_to_use>
	}
	printf channel = gamerpic 'gamerpic_set_screenelement_texture: texture is %s' s = <texture_to_use>
	se_setprops <props_param>
	if gotparam \{local_id}
		begin
		block \{type = local_gamerpic_changed}
		if structurecontains structure = <event_data> playerid
			if ((<event_data>.playerid) = <local_id>)
				props_param = {}
				addparam {
					structure_name = props_param
					name = <se_prop>
					value = <failure_texture>
				}
				printf \{channel = gamerpic
					'gamerpic_set_screenelement_texture: dropping to failure texture'}
				se_setprops <props_param>
				wait \{2
					gameframes}
				gamerpictexturecancel flush_user = (<event_data>.playerid) local_only
				wait \{2
					gameframes}
				obj_spawnscriptnow gamerpic_set_screenelement_texture params = {
					local_id = <local_id>
					local_user_index = <local_user_index>
					se_prop = <se_prop>
					failure_texture = <failure_texture>
				}
			endif
		endif
		repeat
	endif
endscript

script gamerpic_cancel_texture_downloads 
	gamerpictexturecancel \{all}
endscript

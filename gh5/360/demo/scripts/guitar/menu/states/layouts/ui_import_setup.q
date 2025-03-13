import_entry_step = none

script ui_create_import_setup 
	ui_create_import_setup_dialog
endscript

script ui_create_import_setup_dialog 
	if gotparam \{allow_cancel}
		options = [
			{
				text = qs(0xf7723015)
				func = import_cancel_setup
			}
		]
	endif
	if NOT screenelementexists \{id = dialog_box_container}
		create_dialog_box {
			heading_text = qs(0x131b4d0f)
			body_text = qs(0x935b1832)
			player_device = ($primary_controller)
			options = <options>
		}
		add_gamertag_helper exclusive_device = ($primary_controller)
	endif
endscript

script ui_destroy_import_setup 
	destroy_dialog_box
	clean_up_user_control_helpers
endscript

script ui_deinit_import_setup 
	if scriptisrunning \{setup_import}
		killspawnedscript \{name = setup_import}
	endif
	push_unsafe_for_shutdown \{reason = import_deinit}
	if marketplacefunc \{func = is_inited}
		marketplacefunc \{func = deinit}
	endif
	flushdeferreddeletes
	memdeleteheap \{name = heap_musicstore}
	if isps3
		memdeleteheap \{name = heap_musicstore_vram}
		vmheap \{func = free_commerce}
		vmheap \{func = swap_in}
	endif
	create_bink_sub_heaps
	create_song_and_musicstudio_heaps
	pop_unsafe_for_shutdown \{reason = import_deinit}
endscript

script ui_init_import_setup 
	push_unsafe_for_shutdown \{reason = import_init}
	destroy_band
	destroy_song_and_musicstudio_heaps \{do_unloads}
	destroy_bink_sub_heaps
	flushdeferreddeletes
	if isps3
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
		mempushcontext \{heap_bink}
		meminitheap name = 'heap_musicstore' size = (1 * 1024 * 1024) vram_size = (1000 * 1024)
		mempopcontext
	else
		mempushcontext \{heap_bink}
		meminitheap name = 'heap_musicstore' size = (1 * 1024 * 1024)
		mempopcontext
	endif
	pop_unsafe_for_shutdown \{reason = import_init}
	spawnscriptnow setup_import state = <state>
endscript

script setup_import \{state = uistate_import}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if (($net_temp_live_settings_overwritten) = 0)
		printf \{qs(0x9dc02730)}
		netsessionfunc \{func = live_settings_init}
		import_wait_for_net_live_settings
	endif
	if isxenonorwindx
		if NOT netsessionfunc func = canpurchasecontent params = {controller_index = ($primary_controller)}
			import_setup_failed \{fail_text = qs(0x6bc7c154)}
			return
		endif
	endif
	if isps3
		netsessionfunc \{func = cdn_init}
	endif
	printf \{qs(0x09ed0951)}
	if NOT globalexists \{name = downloaded_offerings}
		import_setup_failed \{destroymenu
			errorcode = 6}
		return
	else
		getarraysize \{$downloaded_offerings}
		if (<array_size> = 0)
			import_setup_failed \{destroymenu
				errorcode = 7}
			return
		endif
	endif
	if NOT globalexists \{name = downloaded_offering_init_settings}
		import_setup_failed \{destroymenu
			errorcode = 3}
		return
	endif
	netsessionfunc \{func = is_leaderboard_lobby_available}
	printf \{qs(0x22c05a92)}
	if scriptexists \{marketplace_additional_region_check}
		if NOT marketplace_additional_region_check
			if NOT gotparam \{region_fail_text}
				region_fail_text = qs(0x3161396f)
			endif
			if NOT cd
				if isps3
					getterritory
					getlocale
					formattext textname = append qs(0x6da7d208) t = <territory> l = <locale> dontassertforchecksums
					region_fail_text = (<region_fail_text> + <append>)
				endif
			endif
			import_setup_failed destroymenu fail_text = <region_fail_text>
			return
		endif
	endif
	printf \{qs(0x3bdb6bd3)}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	pushmemprofile \{'MarketplaceInit'}
	if NOT marketplacefunc func = init userid = <valid_user> ($downloaded_offering_init_settings)
		popmemprofile
		if gotparam \{invalid_region}
			import_setup_failed \{destroymenu
				fail_text = qs(0x3161396f)}
		else
			import_setup_failed \{destroymenu
				errorcode = 4
				fail_text = qs(0x1ed12636)}
		endif
		return
	endif
	printf \{qs(0x749afd14)}
	popmemprofile
	change \{import_entry_step = initing}
	if NOT import_wait_for_init
		import_setup_failed \{destroymenu
			errorcode = 5
			fail_text = qs(0x1ed12636)}
		return
	endif
	if isps3
		if NOT import_enumerate_store userid = <valid_user>
			if gotparam \{enum_error}
				if (<enum_error> = invalid_account)
					if NOT cd
						fail_text = (<fail_text> + qs(0x8a78bc57))
					endif
				endif
			endif
			import_setup_failed destroymenu errorcode = 11 fail_text = <fail_text>
			return
		endif
	endif
	destroy_dialog_box
	ui_create_import_setup_dialog \{allow_cancel}
	printf \{qs(0x6d81cc55)}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	import_wait_for_download_content_list
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	change \{import_download_content_list_finished = 0}
	netsessionfunc {
		obj = content_unlock
		func = download_content_list
		params = {
			controller_index = ($primary_controller)
			callback = callback_import_download_content_list
		}
	}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	printf \{qs(0x46ac9f96)}
	import_wait_for_download_content_list
	printf \{qs(0x5fb7aed7)}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	generic_event_choose no_sound state = <state>
endscript
import_download_content_list_finished = 1

script callback_import_download_content_list 
	change \{import_download_content_list_finished = 1}
	if NOT marketplacefunc \{func = is_inited}
		return
	endif
	if (<result> = error)
		printf \{'download_content_list fail'}
		if scriptisrunning \{setup_import}
			killspawnedscript \{name = setup_import}
		endif
		import_setup_failed \{destroymenu
			errorcode = 8}
		return
	endif
	printf \{'download_content_list success'}
endscript

script import_wait_for_download_content_list 
	begin
	if (($import_download_content_list_finished) = 1)
		return
	endif
	printf \{qs(0x77661465)}
	wait \{0.02
		seconds}
	repeat 3000
	printf \{qs(0x81f379d9)}
	import_setup_failed \{errorcode = 9}
	if scriptisrunning \{setup_import}
		killspawnedscript \{name = setup_import}
	endif
endscript

script import_wait_for_net_live_settings 
	begin
	if globalexists \{name = downloaded_offerings}
		return
	endif
	printf \{qs(0x9cbad3bc)}
	wait \{0.02
		seconds}
	repeat 1000
endscript

script import_setup_failed \{fail_text = qs(0xd8f3244a)
		accept_func = import_setup_failed_ok}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if netsessionfunc \{func = iscableunplugged}
		fail_text = qs(0xf8fc9e4e)
	endif
	if NOT cd
		if gotparam \{errorcode}
			formattext textname = fail_text qs(0xc85fd987) s = <fail_text> d = <errorcode>
		endif
	endif
	create_dialog_box {
		player_device = ($primary_controller)
		heading_text = <heading_text>
		body_text = <fail_text>
		options = [
			{
				func = <accept_func>
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script import_setup_failed_ok 
	destroy_dialog_box
	generic_event_back_block \{state = uistate_options
		nosound}
endscript

script import_setup_failed_ok_alt 
	destroy_dialog_box
	generic_event_back_block \{state = uistate_import
		nosound}
endscript

script import_check_signin_state 
	if isxenonorwindx
		if netsessionfunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return \{false
				fail_text = qs(0x9cfe4a9b)}
		endif
	endif
	if NOT checkforsignin controller_index = ($primary_controller)
		if isps3
			return \{false
				fail_text = qs(0x6dcc7555)}
		endif
		if NOT checkforsignin network_platform_only controller_index = ($primary_controller)
			return \{false
				fail_text = qs(0xf13aa4d1)}
		endif
		if checkforsignin local controller_index = ($primary_controller)
			if netsessionfunc \{func = iscableunplugged}
				return \{false
					fail_text = qs(0x8216ad67)}
			endif
		else
			if isxenonorwindx
				dialog_txt = qs(0x0a2293d5)
			elseif isps3
				dialog_txt = qs(0x6dcc7555)
			endif
			return false fail_text = <dialog_txt>
		endif
	endif
	if isps3
		return \{true
			valid_user = 0}
	else
		return true valid_user = ($primary_controller)
	endif
endscript

script import_purchase_content 
	requireparams \{[
			code
		]
		all}
	printf \{'import_purchase_content - Starting checkout'}
	change \{generic_menu_block_input = 1}
	push_unsafe_for_shutdown \{reason = music_store_purchase_content}
	if isps3
		if marketplacefunc func = get_content_info id = <code>
			if (<purchased> = 1)
				import_setup_failed \{errorcode = 12
					accept_func = import_setup_failed_ok_alt
					fail_text = qs(0x2340837e)}
				pop_unsafe_for_shutdown \{reason = music_store_purchase_content}
				change \{generic_menu_block_input = 0}
				return
			endif
		else
			import_setup_failed \{errorcode = 13}
			pop_unsafe_for_shutdown \{reason = music_store_purchase_content}
			change \{generic_menu_block_input = 0}
			return
		endif
	endif
	change \{music_store_attempted_purchase = 1}
	marketplacefunc func = checkout id = <code>
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = checkout)
		break
	endif
	wait \{1
		gameframe}
	repeat
	pop_unsafe_for_shutdown \{reason = music_store_purchase_content}
	change \{generic_menu_block_input = 0}
	printf \{'music_store_purchase_content - Done checkout'}
	if isps3
		generic_event_choose \{nosound
			state = uistate_import_scan_marketplace}
	else
		generic_event_back \{nosound
			state = uistate_import}
	endif
endscript

script import_get_product_code 
	requireparams \{[
			offer
		]
		all}
	if structurecontains structure = <offer> omit_locales
		getlocale
		omit_list = (<offer>.omit_locales)
		if arraycontains array = <omit_list> contains = <locale>
			return \{false}
		endif
	endif
	if isxenon
		if structurecontains structure = <offer> worldwide
			return true code = (<offer>.worldwide)
		endif
	endif
	if marketplacefunc \{func = get_region_checksum}
		if structurecontains structure = <offer> <region_checksum>
			return true code = (<offer>.<region_checksum>)
		endif
	endif
	return \{false}
endscript

script import_cancel_setup 
	printf \{'import_cancel_setup'}
	if scriptisrunning \{setup_import}
		killspawnedscript \{name = setup_import}
	endif
	generic_event_back
endscript

script import_wait_for_init 
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = initing)
		break
	endif
	printf \{qs(0x0228325e)}
	wait \{1
		gameframe}
	repeat
	if (<state> = init)
		return \{true}
	endif
	return \{false}
endscript

script import_enumerate_store 
	if isxenon
		scriptassert \{qs(0x382064b1)}
	endif
	mark_unsafe_for_shutdown
	if marketplacefunc \{func = enum_content}
		begin
		marketplacefunc \{func = get_state}
		if NOT (<state> = enum)
			break
		endif
		printf \{qs(0xa63efc50)}
		wait \{1
			gameframe}
		repeat
		printf \{qs(0xa840b03b)}
		if marketplacefunc \{func = is_enum_valid}
			mark_safe_for_shutdown
			return \{true}
		else
			printf \{qs(0x05aee8e5)}
			if marketplacefunc \{func = get_enum_error_result}
				printf qs(0x5d0e464d) e = <error>
				enum_error = <error>
			endif
		endif
	endif
	mark_safe_for_shutdown
	return false enum_error = <enum_error>
endscript

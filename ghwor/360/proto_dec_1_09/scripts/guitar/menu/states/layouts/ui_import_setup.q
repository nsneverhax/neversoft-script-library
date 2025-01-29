import_entry_step = None

script ui_create_import_setup 
	ui_create_import_setup_dialog
endscript

script ui_create_import_setup_dialog 
	if GotParam \{allow_cancel}
		options = [
			{
				text = qs(0xf7723015)
				func = import_cancel_setup
			}
		]
	endif
	if NOT ScreenElementExists \{id = dialog_box_container}
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
	if ScriptIsRunning \{setup_import}
		KillSpawnedScript \{Name = setup_import}
	endif
	pushunsafeforshutdown \{context = import_deinit}
	if marketplacefunc \{func = is_inited}
		marketplacefunc \{func = deinit}
	endif
	flushdeferreddeletes
	memdeleteheap \{Name = heap_musicstore}
	if isps3
		memdeleteheap \{Name = heap_musicstore_vram}
		vmheap \{func = free_commerce}
		vmheap \{func = swap_in}
	endif
	create_bink_sub_heaps
	create_song_and_musicstudio_heaps
	if ScriptExists \{import_shutdown}
		import_shutdown
	endif
	popunsafeforshutdown \{context = import_deinit}
endscript

script ui_init_import_setup 
	pushunsafeforshutdown \{context = import_init}
	destroy_band
	destroy_song_and_musicstudio_heaps \{do_unloads}
	destroy_bink_sub_heaps
	flushdeferreddeletes
	if isps3
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
		MemPushContext \{heap_bink}
		MemInitHeap Name = 'heap_musicstore' size = (1 * 1024 * 1024) vram_size = (1000 * 1024)
		MemPopContext
	else
		MemPushContext \{heap_bink}
		MemInitHeap Name = 'heap_musicstore' size = (1 * 1024 * 1024)
		MemPopContext
	endif
	popunsafeforshutdown \{context = import_init}
	SpawnScriptNow setup_import state = <state>
endscript

script setup_import \{state = uistate_import}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	NetSessionFunc \{func = live_settings_init}
	NetSessionFunc \{Obj = live_settings
		func = get_settings}
	import_wait_for_net_live_settings
	if isxenonorwindx
		if NOT NetSessionFunc func = canpurchasecontent params = {controller_index = ($primary_controller)}
			import_setup_failed \{fail_text = qs(0x6bc7c154)}
			return
		endif
	endif
	if isps3
		NetSessionFunc \{func = cdn_init}
	endif
	printf \{qs(0x09ed0951)}
	if NOT GlobalExists \{Name = downloaded_offerings}
		import_setup_failed \{destroymenu
			ErrorCode = 1}
		return
	else
		GetArraySize \{$downloaded_offerings}
		if (<array_Size> = 0)
			import_setup_failed \{destroymenu
				ErrorCode = 2}
			return
		endif
	endif
	if NOT GlobalExists \{Name = downloaded_offering_init_settings}
		import_setup_failed \{destroymenu
			ErrorCode = 3}
		return
	endif
	NetSessionFunc \{func = is_leaderboard_lobby_available}
	printf \{qs(0x22c05a92)}
	if ScriptExists \{marketplace_additional_region_check}
		if NOT marketplace_additional_region_check
			if NOT GotParam \{region_fail_text}
				region_fail_text = qs(0x3161396f)
			endif
			if NOT CD
				if isps3
					getterritory
					getlocale
					formatText TextName = append qs(0x6da7d208) t = <territory> l = <locale> DontAssertForChecksums
					region_fail_text = (<region_fail_text> + <append>)
				endif
			endif
			import_setup_failed destroymenu fail_text = <region_fail_text> ErrorCode = 4
			return
		endif
	endif
	printf \{qs(0x3bdb6bd3)}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	PushMemProfile \{'MarketplaceInit'}
	if NOT marketplacefunc func = init userid = <valid_user> ($downloaded_offering_init_settings)
		PopMemProfile
		if GotParam \{invalid_region}
			import_setup_failed \{destroymenu
				fail_text = qs(0x3161396f)}
		else
			import_setup_failed \{destroymenu
				ErrorCode = 5
				fail_text = qs(0x1ed12636)}
		endif
		return
	endif
	printf \{qs(0x749afd14)}
	PopMemProfile
	Change \{import_entry_step = initing}
	if NOT import_wait_for_init
		import_setup_failed \{destroymenu
			ErrorCode = 6
			fail_text = qs(0x1ed12636)}
		return
	endif
	if isps3
		if NOT import_enumerate_store userid = <valid_user>
			if GotParam \{enum_error}
				if (<enum_error> = invalid_account)
					if NOT CD
						fail_text = (<fail_text> + qs(0x8a78bc57))
					endif
				endif
			endif
			import_setup_failed destroymenu ErrorCode = 7 fail_text = <fail_text>
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
	Change \{import_download_content_list_finished = 0}
	NetSessionFunc {
		Obj = content_unlock
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
	if ScriptExists \{import_startup}
		import_startup
	endif
endscript
import_download_content_list_finished = 1

script callback_import_download_content_list 
	Change \{import_download_content_list_finished = 1}
	if NOT ui_event_exists_in_stack \{Name = 'import_setup'}
		return
	endif
	if (<Result> = error)
		printf \{'download_content_list fail'}
		if ScriptIsRunning \{setup_import}
			KillSpawnedScript \{Name = setup_import}
		endif
		import_setup_failed \{destroymenu
			ErrorCode = 8}
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
	Wait \{0.02
		Seconds}
	repeat 3000
	printf \{qs(0x81f379d9)}
	import_setup_failed \{ErrorCode = 9}
	if ScriptIsRunning \{setup_import}
		KillSpawnedScript \{Name = setup_import}
	endif
endscript

script import_wait_for_net_live_settings 
	begin
	if GlobalExists \{Name = downloaded_offerings}
		return
	endif
	printf \{qs(0x9cbad3bc)}
	Wait \{0.02
		Seconds}
	repeat 1000
endscript

script import_setup_failed \{fail_text = qs(0xd8f3244a)
		accept_func = import_setup_failed_ok}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if NetSessionFunc \{func = iscableunplugged}
		fail_text = qs(0xf8fc9e4e)
	endif
	if NOT CD
		if GotParam \{ErrorCode}
			formatText TextName = fail_text qs(0xc85fd987) s = <fail_text> d = <ErrorCode>
		endif
	endif
	create_dialog_box {
		player_device = ($primary_controller)
		heading_text = <heading_text>
		body_text = <fail_text>
		error_code = <ErrorCode>
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
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return \{FALSE
				fail_text = qs(0x9cfe4a9b)}
		endif
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			return \{FALSE
				fail_text = qs(0x6dcc7555)}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			return \{FALSE
				fail_text = qs(0xf13aa4d1)}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				return \{FALSE
					fail_text = qs(0x8216ad67)}
			endif
		else
			if isxenonorwindx
				dialog_txt = qs(0x0a2293d5)
			elseif isps3
				dialog_txt = qs(0x6dcc7555)
			endif
			return FALSE fail_text = <dialog_txt>
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
	RequireParams \{[
			code
		]
		all}
	printf \{'import_purchase_content - Starting checkout'}
	Change \{generic_menu_block_input = 1}
	pushunsafeforshutdown \{context = music_store_purchase_content}
	Change \{music_store_attempted_purchase = 1}
	reset_dlc_signin_state
	marketplacefunc func = checkout id = <code>
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = checkout)
		if NOT (<state> = download)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	popunsafeforshutdown \{context = music_store_purchase_content}
	Change \{generic_menu_block_input = 0}
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
	RequireParams \{[
			offer
		]
		all}
	if StructureContains structure = <offer> omit_locales
		getlocale
		omit_list = (<offer>.omit_locales)
		if ArrayContains array = <omit_list> contains = <locale>
			return \{FALSE}
		endif
	endif
	if isXenon
		if StructureContains structure = <offer> worldwide
			return true code = (<offer>.worldwide)
		endif
	endif
	if marketplacefunc \{func = get_region_checksum}
		if StructureContains structure = <offer> <region_checksum>
			code = (<offer>.<region_checksum>)
			if isps3
				if NOT marketplacefunc func = get_content_info id = <code>
					return \{FALSE}
				endif
			endif
			return true code = <code>
		endif
	endif
	return \{FALSE}
endscript

script import_cancel_setup 
	printf \{'import_cancel_setup'}
	ui_sfx \{menustate = Generic
		uitype = select}
	if ScriptIsRunning \{setup_import}
		KillSpawnedScript \{Name = setup_import}
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
	Wait \{1
		gameframe}
	repeat
	if (<state> = init)
		return \{true}
	endif
	return \{FALSE}
endscript

script import_enumerate_store 
	if isXenon
		ScriptAssert \{qs(0x382064b1)}
	endif
	pushunsafeforshutdown \{context = import_enumerate_store}
	if marketplacefunc \{func = enum_content}
		begin
		marketplacefunc \{func = get_state}
		if NOT (<state> = enum)
			break
		endif
		printf \{qs(0xa63efc50)}
		Wait \{1
			gameframe}
		repeat
		printf \{qs(0xa840b03b)}
		if marketplacefunc \{func = is_enum_valid}
			popunsafeforshutdown \{context = import_enumerate_store}
			return \{true}
		else
			printf \{qs(0x05aee8e5)}
			if marketplacefunc \{func = get_enum_error_result}
				printf qs(0x5d0e464d) e = <error>
				enum_error = <error>
			endif
		endif
	endif
	popunsafeforshutdown \{context = import_enumerate_store}
	return FALSE enum_error = <enum_error>
endscript

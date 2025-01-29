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
		killspawnedscript \{name = setup_import}
	endif
	push_unsafe_for_shutdown \{reason = import_deinit}
	if MarketplaceFunc \{func = is_inited}
		MarketplaceFunc \{func = deinit}
	endif
	FlushDeferredDeletes
	MemDeleteHeap \{name = heap_musicstore}
	if IsPS3
		MemDeleteHeap \{name = heap_musicstore_vram}
		VMHeap \{func = free_commerce}
		VMHeap \{func = swap_in}
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
	FlushDeferredDeletes
	if IsPS3
		VMHeap \{func = swap_out}
		VMHeap \{func = alloc_commerce}
		MemPushContext \{heap_bink}
		MemInitHeap name = 'heap_musicstore' size = (1 * 1024 * 1024) vram_size = (1000 * 1024)
		MemPopContext
	else
		MemPushContext \{heap_bink}
		MemInitHeap name = 'heap_musicstore' size = (1 * 1024 * 1024)
		MemPopContext
	endif
	pop_unsafe_for_shutdown \{reason = import_init}
	spawnscriptnow setup_import state = <state>
endscript

script setup_import \{state = UIstate_import}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	NetSessionFunc \{Obj = live_settings
		func = get_settings}
	import_wait_for_net_live_settings
	if IsXenonOrWinDX
		if NOT NetSessionFunc func = CanPurchaseContent params = {controller_index = ($primary_controller)}
			import_setup_failed \{fail_text = qs(0x6bc7c154)}
			return
		endif
	endif
	if IsPS3
		NetSessionFunc \{func = cdn_init}
	endif
	printf \{qs(0x09ed0951)}
	if NOT GlobalExists \{name = downloaded_offerings}
		import_setup_failed \{destroymenu
			ErrorCode = 1}
		return
	else
		GetArraySize \{$downloaded_offerings}
		if (<array_size> = 0)
			import_setup_failed \{destroymenu
				ErrorCode = 2}
			return
		endif
	endif
	if NOT GlobalExists \{name = downloaded_offering_init_settings}
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
				if IsPS3
					GetTerritory
					GetLocale
					FormatText TextName = append qs(0x6da7d208) t = <territory> l = <locale> DontAssertForChecksums
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
	if NOT MarketplaceFunc func = init userid = <valid_user> ($downloaded_offering_init_settings)
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
	if IsPS3
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
endscript
import_download_content_list_finished = 1

script callback_import_download_content_list 
	Change \{import_download_content_list_finished = 1}
	if NOT ui_event_exists_in_stack \{name = 'import_setup'}
		return
	endif
	if (<result> = error)
		printf \{'download_content_list fail'}
		if ScriptIsRunning \{setup_import}
			killspawnedscript \{name = setup_import}
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
	wait \{0.02
		seconds}
	repeat 3000
	printf \{qs(0x81f379d9)}
	import_setup_failed \{ErrorCode = 9}
	if ScriptIsRunning \{setup_import}
		killspawnedscript \{name = setup_import}
	endif
endscript

script import_wait_for_net_live_settings 
	begin
	if GlobalExists \{name = downloaded_offerings}
		return
	endif
	printf \{qs(0x9cbad3bc)}
	wait \{0.02
		seconds}
	repeat 1000
endscript

script import_setup_failed \{fail_text = qs(0xd8f3244a)
		accept_func = import_setup_failed_ok}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	if NetSessionFunc \{func = IsCableUnplugged}
		fail_text = qs(0xf8fc9e4e)
	endif
	if NOT CD
		if GotParam \{ErrorCode}
			FormatText TextName = fail_text qs(0xc85fd987) s = <fail_text> d = <ErrorCode>
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
	generic_event_back_block \{state = UIstate_options
		nosound}
endscript

script import_setup_failed_ok_alt 
	destroy_dialog_box
	generic_event_back_block \{state = UIstate_import
		nosound}
endscript

script import_check_signin_state 
	if IsXenonOrWinDX
		if NetSessionFunc func = XenonIsGuest params = {controller_index = ($primary_controller)}
			return \{false
				fail_text = qs(0x9cfe4a9b)}
		endif
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if IsPS3
			return \{false
				fail_text = qs(0x6dcc7555)}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			return \{false
				fail_text = qs(0xf13aa4d1)}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				return \{false
					fail_text = qs(0x8216ad67)}
			endif
		else
			if IsXenonOrWinDX
				dialog_txt = qs(0x0a2293d5)
			elseif IsPS3
				dialog_txt = qs(0x6dcc7555)
			endif
			return false fail_text = <dialog_txt>
		endif
	endif
	if IsPS3
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
	push_unsafe_for_shutdown \{reason = music_store_purchase_content}
	Change \{music_store_attempted_purchase = 1}
	reset_dlc_signin_state
	MarketplaceFunc func = checkout id = <code>
	begin
	MarketplaceFunc \{func = get_state}
	if NOT (<state> = checkout)
		if NOT (<state> = download)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	pop_unsafe_for_shutdown \{reason = music_store_purchase_content}
	Change \{generic_menu_block_input = 0}
	printf \{'music_store_purchase_content - Done checkout'}
	if IsPS3
		generic_event_choose \{nosound
			state = UIstate_import_scan_marketplace}
	else
		generic_event_back \{nosound
			state = UIstate_import}
	endif
endscript

script import_get_product_code 
	RequireParams \{[
			offer
		]
		all}
	if StructureContains structure = <offer> omit_locales
		GetLocale
		omit_list = (<offer>.omit_locales)
		if ArrayContains array = <omit_list> contains = <locale>
			return \{false}
		endif
	endif
	if isXenon
		if StructureContains structure = <offer> WORLDWIDE
			return true code = (<offer>.WORLDWIDE)
		endif
	endif
	if MarketplaceFunc \{func = get_region_checksum}
		if StructureContains structure = <offer> <region_checksum>
			code = (<offer>.<region_checksum>)
			if IsPS3
				if NOT MarketplaceFunc func = get_content_info id = <code>
					return \{false}
				endif
			endif
			return true code = <code>
		endif
	endif
	return \{false}
endscript

script import_cancel_setup 
	printf \{'import_cancel_setup'}
	if ScriptIsRunning \{setup_import}
		killspawnedscript \{name = setup_import}
	endif
	generic_event_back
endscript

script import_wait_for_init 
	begin
	MarketplaceFunc \{func = get_state}
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
	if isXenon
		ScriptAssert \{qs(0x382064b1)}
	endif
	mark_unsafe_for_shutdown
	if MarketplaceFunc \{func = enum_content}
		begin
		MarketplaceFunc \{func = get_state}
		if NOT (<state> = enum)
			break
		endif
		printf \{qs(0xa63efc50)}
		wait \{1
			gameframe}
		repeat
		printf \{qs(0xa840b03b)}
		if MarketplaceFunc \{func = is_enum_valid}
			mark_safe_for_shutdown
			return \{true}
		else
			printf \{qs(0x05aee8e5)}
			if MarketplaceFunc \{func = get_enum_error_result}
				printf qs(0x5d0e464d) e = <error>
				enum_error = <error>
			endif
		endif
	endif
	mark_safe_for_shutdown
	return false enum_error = <enum_error>
endscript

import_entry_step = None

script ui_create_import_setup 
	if NOT ScreenElementExists \{id = dialog_box_container}
		create_dialog_box {
			heading_text = qs(0xaa163738)
			body_text = qs(0xb8a48518)
			player_device = ($primary_controller)
			options = [
				{
					text = qs(0xf7723015)
					func = import_cancel_setup
				}
			]
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
	push_unsafe_for_shutdown \{reason = import_deinit}
	if ($import_marketplace_init = 1)
		marketplacefunc \{func = deinit}
	endif
	Change \{import_marketplace_init = 0}
	flushdeferreddeletes
	memdeleteheap \{Name = heap_musicstore}
	if isps3
		memdeleteheap \{Name = heap_musicstore_vram}
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
		MemPushContext \{heap_bink}
		MemInitHeap Name = 'heap_musicstore' size = (1 * 1024 * 1024) vram_size = (1000 * 1024)
		MemPopContext
	elseif isngc
		MemPushContext \{quota_samples}
		MemInitHeap Name = 'heap_musicstore' size = (1 * 1024 * 1024)
		MemPopContext
	else
		MemPushContext \{heap_bink}
		MemInitHeap Name = 'heap_musicstore' size = (1 * 1024 * 1024)
		MemPopContext
	endif
	pop_unsafe_for_shutdown \{reason = import_init}
	SpawnScriptNow setup_import state = <state>
endscript
import_marketplace_init = 0
import_block_exit = 0

script setup_import \{state = uistate_import}
	Change \{import_marketplace_init = 0}
	Change \{import_block_exit = 0}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if (($net_temp_live_settings_overwritten) = 0)
		printf \{qs(0x9dc02730)}
		NetSessionFunc \{func = live_settings_init}
		import_wait_for_net_live_settings
	endif
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
			ErrorCode = 6
			fail_text = qs(0x1ed12636)}
		return
	else
		GetArraySize \{$downloaded_offerings}
		if (<array_Size> = 0)
			import_setup_failed \{destroymenu
				ErrorCode = 7
				fail_text = qs(0x1ed12636)}
			return
		endif
	endif
	if NOT GlobalExists \{Name = downloaded_offering_init_settings}
		import_setup_failed \{destroymenu
			ErrorCode = 3
			fail_text = qs(0x1ed12636)}
		return
	endif
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
			import_setup_failed destroymenu fail_text = <region_fail_text>
			return
		endif
	endif
	printf \{qs(0x3bdb6bd3)}
	Change \{import_block_exit = 1}
	PushMemProfile \{'MarketplaceInit'}
	if NOT marketplacefunc func = init userid = <valid_user> ($downloaded_offering_init_settings)
		PopMemProfile
		if GotParam \{invalid_region}
			import_setup_failed \{destroymenu
				fail_text = qs(0x3161396f)}
		else
			import_setup_failed \{destroymenu
				ErrorCode = 4
				fail_text = qs(0x1ed12636)}
		endif
		return
	endif
	printf \{qs(0x749afd14)}
	PopMemProfile
	Change \{import_entry_step = initing}
	if NOT import_wait_for_init
		import_setup_failed \{destroymenu
			ErrorCode = 5
			fail_text = qs(0x1ed12636)}
		return
	endif
	Change \{import_block_exit = 0}
	Change \{import_marketplace_init = 1}
	printf \{qs(0x6d81cc55)}
	import_wait_for_download_content_list
	Change \{g_import_wait_for_download_content_list_count = 0}
	Change \{import_download_content_list_finished = 0}
	NetSessionFunc {
		Obj = content_unlock
		func = download_content_list
		params = {
			controller_index = ($primary_controller)
			callback = callback_import_download_content_list
		}
	}
	printf \{qs(0x46ac9f96)}
	import_wait_for_download_content_list
	printf \{qs(0x5fb7aed7)}
	if (($g_import_wait_for_download_content_list_count) < 50)
		Wait (50 - ($g_import_wait_for_download_content_list_count)) gameframes
	endif
	Change \{g_import_wait_for_download_content_list_count = 0}
	printf \{qs(0xd82fb218)}
	generic_event_choose no_sound state = <state>
endscript
import_download_content_list_finished = 1

script callback_import_download_content_list 
	if ($import_marketplace_init = 0)
		return
	endif
	if (<Result> = error)
		printf \{'download_content_list fail'}
		if ScriptIsRunning \{setup_import}
			KillSpawnedScript \{Name = setup_import}
		endif
		Change \{import_download_content_list_finished = -1}
		import_setup_failed \{destroymenu
			ErrorCode = 8
			fail_text = qs(0x020d0296)}
		return
	endif
	printf \{'download_content_list success'}
	Change \{import_download_content_list_finished = 1}
endscript
g_import_wait_for_download_content_list_count = 0

script import_wait_for_download_content_list 
	begin
	if (($import_download_content_list_finished) = 1)
		return \{true}
	endif
	if (($import_download_content_list_finished) = -1)
		return \{FALSE}
	endif
	if music_store_have_saved_error
		break
	endif
	Change g_import_wait_for_download_content_list_count = ($g_import_wait_for_download_content_list_count)
	printf \{qs(0x77661465)}
	Wait \{1
		gameframe}
	repeat 3000
	printf \{qs(0x81f379d9)}
	import_setup_failed \{ErrorCode = 9
		fail_text = qs(0x020d0296)}
	if ScriptIsRunning \{setup_import}
		KillSpawnedScript \{Name = setup_import}
	endif
	return \{FALSE}
endscript

script import_wait_for_net_live_settings 
	begin
	if GlobalExists \{Name = downloaded_offerings}
		return
	endif
	printf \{qs(0x9cbad3bc)}
	Wait \{1
		gameframe}
	repeat 1000
endscript

script import_setup_failed 
	Change \{import_marketplace_init = 0}
	music_store_start_saving_net_error
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
			formatText TextName = fail_text qs(0xcee1a081) s = <fail_text> d = <ErrorCode>
		endif
	endif
	SetButtonEventMappings \{unblock_menu_input}
	create_dialog_box {
		player_device = ($primary_controller)
		heading_text = <heading_text>
		body_text = <fail_text>
		options = [
			{
				func = import_setup_failed_ok
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script import_setup_failed_ok 
	if music_store_stop_saving_net_error
		return
	endif
	destroy_dialog_box
	songlist_back
endscript

script import_check_signin_state 
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return \{FALSE
				fail_text = 'You are currently signed into a guest gamer profile. In order to browse the list of offers, you must be signed into Xbox LIVE, and not a guest of a multiplayer enabled gamer profile.'}
		endif
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			return \{FALSE
				fail_text = 'You must be signed in to the PlayStation®Network to browse the list of offers.'}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			return \{FALSE
				fail_text = 'The current gamer profile is not enabled for Xbox LIVE, or the network connection has been lost.  Please check your settings to browse the list of offers.'}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				return \{FALSE
					fail_text = qs(0x8216ad67)}
			endif
		else
			if isxenonorwindx
				dialog_txt = 'No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to browse the list of offers.'
			elseif isps3
				dialog_txt = 'You must be signed in to the PlayStation®Network to browse the list of offers.'
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
	push_unsafe_for_shutdown \{reason = music_store_purchase_content}
	<purchase_struct> = {code = <code>}
	marketplacefunc func = get_content_info id = <code>
	<purchase_struct> = {<purchase_struct> purchased = <purchased> price = <cost> song_checksum = <code> Type = import}
	if StructureContains structure = $download_songpacks_props Name = <code>
		<purchase_struct> = (<purchase_struct> + ($download_songpacks_props.<code>))
	endif
	music_store_preliminary_checks purchase_struct = <purchase_struct>
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
	if isngc
		if StructureContains structure = <offer> worldwide
			return true code = (<offer>.worldwide)
		endif
	endif
	if marketplacefunc \{func = get_region_checksum}
		if StructureContains structure = <offer> <region_checksum>
			return true code = (<offer>.<region_checksum>)
		endif
	endif
	return \{FALSE}
endscript

script import_cancel_setup 
	printf \{'import_cancel_setup'}
	if ($import_block_exit = 1)
		return
	endif
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


script wii_dlc_get_error_text \{error_crc = ec_error_ok
		show_support_code = FALSE
		song_title = qs(0x8618db05)
		wii_blocks = 0
		sd_blocks = 0}
	if NOT ((<error_crc> = ec_error_ok) || (<error_crc> = ec_error_not_busy))
		if GotParam \{error_code}
			if (((<error_code> < -4900) && (<error_code> > -4915)) ||
					((<error_code> < -4960) && (<error_code> > -4964)) ||
					((<error_code> < -4964) && (<error_code> > -4974)) ||
					((<error_code> < -7900) && (<error_code> > -7918)))
				<error_text> = ($wii_dlc_net_error_text)
				<fatal> = 1
				<show_support_code> = true
			endif
		endif
		<content_index> = -1
		if GotParam \{song}
			dlcmanagerfunc func = get_content_index content_name = <song>
			if (<content_index> > 1)
				get_song_title song = <song>
			elseif (<content_index> = 1)
				<song_title> = ($wii_ra_catalog_name)
			endif
		endif
		if (<show_support_code> = FALSE)
			<fatal> = 0
			switch <error_crc>
				case ec_error_net_na
				<error_text> = ($wii_dlc_net_error_text)
				<show_support_code> = true
				<fatal> = 1
				case ec_error_eula
				<error_text> = ($wii_dlc_no_eula_text)
				<fatal> = 1
				case ec_error_register
				case ec_error_shop_setup
				<error_text> = ($wii_dlc_no_shop_account_text)
				<fatal> = 1
				case ec_error_points_restricted
				<error_text> = ($wii_dlc_pin_entry_text)
				case ec_error_insufficient_funds
				<error_text> = ($wii_dlc_wii_points_insufficient_text)
				case ec_error_invalid_pcpw
				<error_text> = ($wii_dlc_pin_fail_text)
				case ec_error_canceled
				case cntsd_result_cancelled
				case nhttp_error_canceled
				<error_text> = ($wii_dlc_cancel_op_text)
				return FALSE error_text = <error_text>
				case ec_error_sync
				<error_text> = ($wii_dlc_sync_needed_text)
				<show_support_code> = true
				<fatal> = 1
				case ec_error_cfg_home_space
				case ec_error_cfg_user_space
				<error_text> = ($wii_dlc_connect_insufficient_blocks_text)
				<fatal> = 1
				case ec_error_cfg_home_inode
				case ec_error_cfg_user_inode
				<error_text> = ($wii_dlc_connect_insufficient_inodes_text)
				<fatal> = 1
				case ec_error_user_blocks
				case ec_error_cache_blocks
				if GotParam \{failed_update}
					formatText TextName = error_text ($wii_dlc_update_insufficient_blocks_text) d = <blocks>
				else
					formatText TextName = error_text ($wii_dlc_nand_insufficient_blocks_text) d = <blocks>
				endif
				case ec_error_user_inodes
				case ec_error_cache_inodes
				if GotParam \{failed_update}
					<error_text> = ($wii_dlc_update_insufficient_inodes_text)
				else
					<error_text> = ($wii_dlc_nand_insufficient_inodes_text)
				endif
				case ec_error_sd_no_space
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0008b) d = <blocks>
				case nhttp_error_buffull
				case nhttp_error_httpparse
				<error_text> = ($wii_dlc_preview_bad_download)
				case nhttp_error_connect
				case nhttp_error_dns
				case nhttp_error_socket
				case nhttp_error_revolutionwifi
				<error_text> = ($wii_dlc_preview_no_connect)
				case nhttp_error_dns_proxy
				case nhttp_error_connect_proxy
				<error_text> = ($wii_dlc_preview_bad_proxy)
				case cnt_result_ecc_crit
				case cnt_result_authentication
				<error_text> = ($wii_dlc_post_download_corruption)
				case dlc_cannot_list_all_content
				<error_text> = ($wii_dlc_cannot_list_all)
				case cntsd_result_sd_not_inserted
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0001)
				case cntsd_result_sd_corrupt
				Change \{g_songlist_sd_card_required = 0}
				if GotParam \{transfer_type}
					if (<transfer_type> = restore)
						formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0003) s = <song_title>
					else
						formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0010) s = <song_title>
					endif
				else
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0010) s = <song_title>
				endif
				case cntsd_result_unknown_format
				case cntsd_result_unknown
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0003) s = <song_title>
				case cntsd_result_incorrect_device
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0004) s = <song_title>
				case cntsd_result_cache_blocks
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0005) d = <blocks>
				case cntsd_result_cache_inodes
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0006)
				case cntsd_result_user_blocks
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0005b) d = <blocks>
				case cntsd_result_user_inodes
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0006b)
				case cntsd_result_sd_no_space
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0008) d = <blocks>
				case cntsd_result_sd_write_protected
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0009)
				case cntsd_result_sd_unknown
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0010) s = <song_title>
				case cntsd_result_content_invalid
				if (<content_index> = 1)
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0011_catalog)
				else
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0011) s = <song_title>
				endif
				case cntsd_result_no_ticket
				Change \{g_songlist_sd_card_required = 0}
				if (<content_index> = 1)
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0012_catalog)
				else
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0012) s = <song_title>
				endif
				case cntsd_result_sd_not_supported
				Change \{g_songlist_sd_card_required = 0}
				formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0013)
				case cntsd_result_sd_ejected
				Change \{g_songlist_sd_card_required = 0}
				if GotParam \{transfer_type}
					if (<transfer_type> = restore)
						formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0016)
					else
						formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0017)
					endif
				else
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0017b)
				endif
				case cntsd_result_noexists
				if GotParam \{transfer_type}
					if (<transfer_type> = restore)
						formatText \{TextName = error_text
							$wii_ra_message_song_noexists_sd}
					else
						formatText \{TextName = error_text
							$wii_ra_message_song_noexists_wii}
					endif
				else
					formatText \{TextName = error_text
						$wii_ra_message_song_noexists_unknown}
				endif
				case cntsd_result_exists
				if GotParam \{transfer_type}
					if (<transfer_type> = restore)
						formatText TextName = error_text $wii_ra_message_song_exists_wii s = <song_title>
					else
						formatText TextName = error_text $wii_ra_message_song_exists_sd s = <song_title>
					endif
				else
					formatText \{TextName = error_text
						$wii_ra_message_song_exists_unknown}
				endif
				case cntsd_result_start_transfer
				if (<transfer_type> = restore)
					formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0002) s = <song_title>
				else
					if GotParam \{copy_to_sd}
						formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0007b) s = <song_title>
					else
						formatText TextName = error_text ($cntsd_messages.rvlcntsd_message_0007) s = <song_title>
					endif
				endif
				case cntsd_result_wrong_wii
				formatText TextName = error_text ($wii_cntsd_result_incorrect_device_catalog)
				case sd_card_state_change
				formatText TextName = error_text ($g_sd_card_state_change_error)
				default
				if GotParam \{error_code}
					if (<error_code> <= -3000 && <error_code> >= -3600)
						<error_text> = ($wii_ra_error_unexpected)
					else
						<error_text> = ($wii_dlc_other_error_text)
						<show_support_code> = true
					endif
				else
					<error_text> = ($wii_dlc_other_error_text)
					<show_support_code> = true
				endif
				<fatal> = 1
			endswitch
		endif
		if (<show_support_code> = true)
			if GotParam \{support_code}
				formatText TextName = error_text qs(0x25fd76a0) s = <error_text> t = <support_code>
			endif
		endif
		return true error_text = <error_text> fatal = <fatal>
	endif
	return \{FALSE}
endscript

script music_store_handle_error \{params = {
		}}
	<show_support_code> = FALSE
	if wii_dlc_get_error_text <...>
		Change \{g_songlist_net_error_handling = save_error}
		if GotParam \{error_text}
			printf qs(0x0c12f890) s = <error_text>
		endif
		if GotParam \{error_code}
			printf qs(0xd360c545) s = <error_code>
		endif
		if GotParam \{error_crc}
			printf qs(0x2bfa0506) s = <error_crc>
		endif
		if NOT GotParam \{func}
			if GotParam \{fatal}
				if (<fatal> = 1)
					<func> = dlc_error_exit_to_main_menu_part1
				else
					<func> = dlc_error_destroy_error_dialog
				endif
			else
				<func> = dlc_error_destroy_error_dialog
			endif
		endif
		if GotParam \{fatal_func}
			if GotParam \{fatal}
				if (<fatal> = 1)
					<func> = <fatal_func>
				endif
			endif
		endif
		destroy_dialog_box
		LaunchEvent \{Type = unfocus
			target = current_menu}
		<params> = (<params> + ({wrapped_func = <func>}))
		create_dialog_box {
			heading_text = qs(0x79597197)
			template = large_body
			body_text = <error_text>
			back_button_script = music_store_handle_error_func_wrapper
			back_button_params = <params>
			options = [
				{
					func = music_store_handle_error_func_wrapper
					func_params = <params>
					text = qs(0x0e41fe46)
				}
			]
			dlg_z_priority = 1001
		}
		return \{true}
	else
		printf \{'Checkout finished, no errors, no problems'}
		return \{FALSE}
	endif
endscript

script music_store_handle_error_func_wrapper 
	if music_store_have_saved_error
		Change \{generic_menu_block_input = 0}
		music_store_stop_saving_net_error
		return
	endif
	(<wrapped_func>) <...>
endscript

script archive_handle_error 
	if wii_dlc_get_error_text <...>
		destroy_dialog_box
		sdcardmanagerfunc \{func = force_hold_ejects}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		create_dialog_box {
			heading_text = qs(0x79597197)
			body_text = <error_text>
			back_button_script = archive_destroy_popup
			back_button_params = {refresh no_refocus}
			options = [
				{
					func = archive_destroy_popup
					func_params = {refresh no_refocus}
					text = qs(0x0e41fe46)
				}
			]
		}
		return \{true}
	else
		printf \{'Transfer finished, no errors, no problems'}
		return \{FALSE}
	endif
endscript

script dlc_error_exit_to_main_menu_part1 
	if music_store_have_saved_error
		Change \{generic_menu_block_input = 0}
		music_store_stop_saving_net_error
		return
	endif
	destroy_dialog_box
	getngcneterrors \{reset = 1}
	if (<dwc_error_code> > 0)
		printf \{'handling ngc error'}
		formatText TextName = error_msg qs(0xcfb2fe82) d = (<dwc_error_code>) s = (<dwc_error_text>)
		create_dialog_box {
			heading_text = qs(0x79597197)
			body_text = <error_msg>
			options = [
				{
					func = dlc_error_exit_to_main_menu_part2
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		printf \{'not handling ngc error'}
		wii_music_store_back
	endif
endscript

script dlc_error_exit_to_main_menu_part2 
	destroy_dialog_box
	wii_music_store_back
endscript

script dlc_error_destroy_error_dialog 
	Change \{generic_menu_block_input = 0}
	if music_store_stop_saving_net_error
		return
	endif
	music_store_purchase_destroy_dialog_and_return
endscript

script dlc_error_music_store_sdcard_purchase_error 
	Change \{generic_menu_block_input = 0}
	if music_store_stop_saving_net_error
		return
	endif
	if GotParam \{allow_ejects}
		sdcardmanagerfunc \{func = force_hold_ejects
			OFF}
	endif
	songlist_destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
	generic_event_back \{data = {
			bypass_return_script = songlist_back
		}}
endscript

script dlc_error_music_store_sdcard_songlist_error 
	Change \{generic_menu_block_input = 0}
	if music_store_stop_saving_net_error
		return
	endif
	if GotParam \{allow_ejects}
		sdcardmanagerfunc \{func = force_hold_ejects
			OFF}
	endif
	songlist_destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
	songlist_back
endscript

script dlc_error_music_store_purchase_go_to_scan_marketplace 
	songlist_destroy_dialog_box
	Change \{generic_menu_block_input = 0}
	ui_event \{event = menu_replace
		data = {
			is_popup
			state = uistate_music_store_scan_marketplace
			data = {
				purchase_struct = {
				}
			}
		}}
endscript

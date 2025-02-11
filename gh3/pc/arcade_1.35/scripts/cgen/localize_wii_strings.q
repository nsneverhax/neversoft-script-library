wii_invite_confirm = "Are you sure you want to invite %a to play a game?"
wii_invite = "Invite Friend"
wii_invite_title = "INVITE"
wii_loading_friends_list = "Loading Friends Roster"
wii_adding_friend = "Please Wait While Friend is Added"
wii_deleting_friend = "Deleting Friend"
wii_accept = "ACCEPT"
wii_accept_invite = "ACCEPT INVITE"
wii_add_friend = "ADD FRIEND"
wii_approving1 = "Submitting name for approval.  "
wii_approving2 = "Submitting name for approval.. "
wii_approving3 = "Submitting name for approval..."
wii_approving_title = "APPROVING NAME"
wii_back = "BACK"
wii_cancel = "CANCEL"
wii_connected = "You are connected to the Nintendo WiFi Connection."
wii_connecting = "Connecting to Nintendo Wi-Fi Connection...\\nPlease wait a moment"
wii_controller_settings = "CONTROLLER SETTINGS"
wii_create_match = "Create Match"
wii_create_new = "Create New"
wii_delete = "DELETE?"
wii_delete_confirm = "Are you sure you want to delete %a from your friend roster?"
wii_delete_confirm2 = "Are you sure you want to delete %a"
wii_delete_friend = "DELETE FRIEND"
wii_delete_profile = "DELETE PROFILE"
wii_delete_profile2 = "Delete Profile"
wii_deleted_friend = "%a has been deleted from your friend roster."
wii_diff_name = "Please choose a different name."
wii_done = "DONE"
wii_enter_12 = "ENTER 12 DIGIT"
wii_enter_profile_name = "ENTER PROFILE NAME"
wii_error = "ERROR"
wii_failed_connect = "Failed to connect to internet."
wii_failed_connect2 = "You failed to connected to the Nintendo WiFi Connection."
wii_friend_code = "FRIEND CODE!"
wii_friend_code2 = "Friend Code:"
wii_friends = "FRIENDS"
wii_lb_title = "Leaderboard"
wii_lb_waiting = "Retrieving Leaderboard"
wii_invalid_name = "INVALID NAME"
wii_legends = "THE LEGENDS OF ROCK"
wii_license = "Licensed by Nintendo"
wii_login = "Login"
wii_login_error = "Login Error"
wii_net_info1 = "Jump right into a Friends match and rock the house against a Friend who has invited you"
wii_net_info2 = "Play an Non-Ranked or Ranked match against a stranger online"
wii_net_info3 = "Create and host your own online match"
wii_net_info4 = "Setup and make changes to your Auto-Match Options."
wii_net_info5 = "Check out who the best of the best are and see where you rank"
wii_net_info6 = "Check out the newest available downloads for Guitar Hero 3"
wii_net_info7 = "Be A Guitar Hero, and join the online community!"
wii_net_info8 = "Select 'Message Of The Day' to see the latest news in the Guitar Hero universe"
wii_net_info9 = "Add Friends, Delete Friends, and Accept or Reject an Invite through the Friends Roster"
wii_net_info10 = "Sign-Out of Nintendo Wi-Fi Connection (You will no longer recieve invites)"
wii_next = "NEXT"
wii_no = "NO"
wii_no_prof = "You don't have any Profiles saved.\\n Select PROFILE MANAGER from the main menu to create one."
wii_no_prof_title = "NO PROFILES"
wii_ok = "OK"
wii_options = "OPTIONS"
wii_options_for = "Options for %a"
wii_profile_manager = "PROFILE MANAGER"
wii_profiles = "PROFILES"
wii_quickmatch_friends = "Auto-Match: Friends"
wii_ranked = "RANKED?:"
wii_reason = "REASON"
wii_reject_invite = "REJECT INVITE"
wii_rejected = "REJECTED"
wii_controller_unplugged = "Communications with the Wii Remote have been interrupted."
wii_reject_phrase1 = "No thanks, I am in another game right now."
wii_reject_phrase2 = "No thanks, I'm busy at the moment."
wii_reject_phrase3 = "No thanks, I'm about to go off line."
wii_reject_phrase4 = "No thanks, I'm busy, but invite me later."
wii_reject_phrase5 = "No thanks, I'm busy, but I'll invite you later."
wii_reject_dialog = "From: %a \\n %b"
wii_searching = "SEARCHING"
wii_select_profile = "Select a profile"
wii_show_friends_list = "Show Friends Roster"
wii_sign_out = "Sign-Out"
wii_sponsored_by = "SPONSORED BY:"
wii_strangers_confirm = "You are about to communicate with a Stranger. Are you sure you want to continue?"
wii_strangers_match = "Strangers Match"
wii_strangers_ranked = "STRANGERS (RANKED)"
wii_strangers_title = "Strangers?"
wii_strangers_unranked = "STRANGERS (UNRANKED)"
wii_tour = "TOUR"
wii_updown = "UP/DOWN"
wii_who_play = "Who do you want to play with?"
wii_wifi = "WIFI CONNECTION"
wii_yes = "YES"
wii_dwc_error_noconnect_wifi_text = "Unable to connect to Nintendo Wi-Fi Connection. For help, check the software instruction booklet, or go to support.nintendo.com."
wii_dwc_error_noconnect_inet_text = "Unable to connect to the Internet.  Confirm the Internet settings of the Wii console"
wii_dwc_error_noconnect_friend_text = "There is no response. Either the player is not connected to Nintendo Wi-Fi Connection, or you have been removed from the player's friend roster."
wii_dwc_error_noservice_traffic_text = "Either Nintendo Wi-Fi Connection is experiencing high traffic volumes, or the service is down. Please try again later. For help, visit support.nintendo.com."
wii_dwc_error_noservice_discontinued_text = "Nintendo Wi-Fi Connection service for this software has been discontinued. Visit support.nintendo.com for a list of current Nintendo Wi-Fi Connection-compativle software."
wii_dwc_error_nomemory_text = "There is not enough available space in Wii system memory."
wii_dwc_error_nomemory_damaged_text = "The Wii system memory has been damaged. Refer to the Wii operations manual for further instructions."
wii_dwc_error_disconnect_text = "Disconnected from network during transmission."
wii_auto_match_options_text = "AUTO-MATCH OPTIONS"
wii_auto_match_text = "Auto-Match"
wii_auot_match_player_options = "Auto-Match Player Options"

script get_string_wii \{message = unknown}
	localized_string = ""
	switch <message>
		case loading
		localized_string = "Loading data. Please do not touch the Power Button or RESET."
		case saving
		localized_string = "Saving data. Please do not touch the Power Button or RESET."
		case autosaving
		localized_string = "Autosaving data. Please do not touch the Power Button or RESET."
		case overwriting
		localized_string = "Overwriting data. Please do not touch the Power Button or RESET."
		case formatting
		localized_string = "formatting"
		case load_successful
		localized_string = "Load Successful."
		case format_successful
		localized_string = "Format Successful."
		case save_successful
		localized_string = "Save Successful."
		case overwrite_successful
		localized_string = "Overwrite Successful."
		case boot_autosave_warning
		localized_string = "boot_autosave_warning"
		case check_memcard
		localized_string = "Checking save data.  Please do not touch the Power Button or RESET."
		case no_memcard_boot
		localized_string = "no_memcard_boot"
		case no_memcard_save_boot
		localized_string = "no_memcard_save_boot"
		case no_save_boot
		localized_string = "No Guitar Hero III save data present. Guitar Hero III uses an\\nAutosave feature. 185 KB of space is required\\nto save game data. Do you want to create a save\\nfile now?"
		case no_save_ingame
		localized_string = "No Guitar Hero III save data present."
		case save_failed
		localized_string = "Save failed! Could not write to/read from Wii system memory.\\nFor details, please read the Wii Operations Manual."
		case overwrite_failed
		localized_string = "Overwrite failed! Could not write to/read from Wii system memory.\\nFor details, please read the Wii Operations Manual."
		case attempt_format
		localized_string = "attempt_format"
		case confirm_format
		localized_string = "confirm_format"
		case already_formatted
		localized_string = "already_formatted"
		case format_failed
		localized_string = "format_failed"
		case format_cancelled
		localized_string = "format_cancelled"
		case no_memcard_ingame
		localized_string = "no_memcard_ingame"
		case load_failed
		localized_string = "Load failed! Could not write to/read from Wii system memory.\\nFor details, please read the Wii Operations Manual."
		case overwrite_warning_boot
		localized_string = "overwrite_warning_boot"
		case disable_autosave
		localized_string = "Autosave has been disabled.\\nAutosave can be re-enabled in the options menu."
		case overwrite_warning_ingame
		localized_string = "WARNING: Saving will overwrite any existing Guitar Hero III data. Are you sure you want to save?"
		case lose_progress_ingame
		localized_string = "WARNING: If you load data, you will lose your\\ncurrent game progress. Continue with load?"
		case insufficient_space_boot
		localized_string = "There is not enough available space in Wii system memory.\\nCreate <X> block(s) of free space either by moving data to an SD Card or deleting data in the Data Management screen.\\nContinue without saving?"
		case insufficient_space_ingame
		localized_string = "There is not enough available space in Wii system memory.\\nCreate <X> block(s) of free space either by moving data to an SD Card or deleting data in the Data Management screen."
		case corrupt_boot
		localized_string = "This file cannot be used because the data is corrupted.\\nWould you like to overwrite the corrupted file?"
		case confirm_overwrite_boot
		localized_string = "Are you sure you wish to overwrite the save file?"
		case new_memcard_ingame
		localized_string = "new_memcard_ingame"
		case warning_480p
		localized_string = "Progressive Mode may not work on all televisions.  If it doesn't work on yours, please wait 15 seconds and we'll automatically switch back."
		case now_in_480p
		localized_string = "You are now in Progressive Mode.  Do you want to keep this display mode?"
		default
		printf "No match, string %d not localized" d = <message>
		localized_string = "???"
	endswitch
	return localized_string = <localized_string>
endscript


script ui_create_wii_friends_list \{for_invite = 0
		offline = 0}
	z_priority = 100.0
	CreateScreenElement \{Type = ContainerElement
		id = wii_friend_code_container
		parent = root_window
		Pos = (420.0, -400.0)
		alpha = 0.75}
	menu_anchor = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = online_setlist_popup_bg
		dims = (512.0, 256.0)
		Pos = (420.0, -190.0)
		just = [center top]
		z_priority = <z_priority>
		alpha = 1.0
	}
	getmyfriendnum
	formatText TextName = friendkeytext $wii_friend_code3 s = <myfriendkey>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <menu_anchor>
		id = wii_friend_code_helper_text
		font = fontgrid_text_a1
		Scale = 0.7
		rgba = ($online_lobby_item_text_color)
		text = <friendkeytext>
		just = [center top]
		internal_just = [center center]
		z_priority = (<z_priority> + 0.1)
		Pos = (420.0, -25.0)
		dims = (1300.0, 100.0)
	}
	wii_friend_code_container :se_setprops \{Pos = (420.0, 110.0)
		time = 0.5}
	menu_params = {
		title = $wii_friend_roster_lc
		vmenu_id = wii_friends_list_vmenu
		scrolling
		use_all_controllers
	}
	if (<for_invite> = 0)
		<menu_params> = {
			<menu_params>
			pad_option2_script = generic_event_choose
			pad_option2_params = {state = uistate_enter_friend_num data = {offline = <offline>}}
		}
	endif
	make_generic_menu <menu_params>
	if (<offline> = 1)
		updatefriendslist
	endif
	wii_friends_list_vmenu :SetTags offline = <offline>
	wii_friends_list_vmenu :SetTags for_invite = <for_invite>
	wii_friends_list_vmenu :SetTags \{state = Base}
	printf qs(0xa0bc64c4) d = <for_invite>
	populate_friends
	SpawnScriptNow \{generic_menu_animate_in}
	if (<for_invite> = 1)
		ui_helpers_wii_friends_list \{state = invite_only}
	else
		ui_helpers_wii_friends_list \{state = Base}
	endif
	CreateScreenElement \{parent = root_window
		id = inviteinfobar
		Type = descinterface
		desc = 'invite_info1'
		Pos = (130.0, 30.0)
		Scale = 1.1}
	if (<for_invite> = 1)
		inviteinfobar :se_setprops \{alpha = 0.0}
	endif
	if ($ui_friends_list_tut_shown = 0)
		getnumfriends
		totalfriends = (<numfriendsonline> + <numfriendsoffline> + <numfriendspending>)
		if (<totalfriends> = 0)
			ui_wii_friends_invite_tutorial
			Change \{ui_friends_list_tut_shown = 1}
		else
			Change \{ui_friends_list_tut_shown = 1}
		endif
	endif
endscript
ui_friends_list_tut_shown = 0

script ui_destroy_wii_friends_list 
	destroy_generic_menu
	clean_up_user_control_helpers
	if ScreenElementExists \{id = wii_friend_code_container}
		DestroyScreenElement \{id = wii_friend_code_container}
	endif
	if ScreenElementExists \{id = inviteinfobar}
		DestroyScreenElement \{id = inviteinfobar}
	endif
	KillSpawnedScript \{Name = ui_wii_friends_invite_blink_invite}
	if ScreenElementExists \{id = invite_tut_container}
		DestroyScreenElement \{id = invite_tut_container}
	endif
endscript

script ui_helpers_wii_friends_list 
	if NOT GotParam \{state}
		wii_friends_list_vmenu :GetSingleTag \{state}
	endif
	clean_up_user_control_helpers
	switch <state>
		case Base
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0xc29d3992)
			button = yellow
			z = 100000}
		case popup
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		case reject
		add_user_control_helper \{text = $wii_send
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		case invite_only
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
	endswitch
	wii_friends_list_vmenu :SetTags state = <state>
endscript
friendlist_selection_index = 0

script populate_friends 
	getfriendslist
	GetArraySize <friendlist>
	wii_friends_list_vmenu :GetSingleTag \{for_invite}
	wii_friends_list_vmenu :GetSingleTag \{offline}
	if (<for_invite> = 1)
		choose_script = friendlist_invite_friend
	else
		choose_script = friendlist_friend_options
	endif
	if (<array_Size> > 0)
		friend = 0
		begin
		getfriendinfo index = <friend>
		formatText TextName = friendname qs(0x4d4555da) s = <nickname>
		if (<status> > 0 && <offline> = 0)
			if (<haspendinginvite> = 1)
				<icon> = pending_invite
			else
				<icon> = online_icon
			endif
		else
			if GotParam \{is_pending_friend}
				<icon> = pending_friend
			else
				if (<offline> = 1)
					<icon> = friend
				else
					<icon> = offline_icon
				endif
			endif
		endif
		add_friend = 0
		if (<for_invite> = 1)
			if (<status> > 0 && <haspendinginvite> = 0)
				<add_friend> = 1
			endif
		else
			<add_friend> = 1
		endif
		if (<add_friend> = 1)
			add_generic_menu_icon_item {
				icon = <icon>
				text = <friendname>
				pad_choose_script = <choose_script>
				additional_focus_script = select_friend
				additional_focus_params = {friend = <friend>}
			}
		endif
		<friend> = (<friend> + 1)
		repeat <array_Size>
	else
		if ScreenElementExists \{id = inviteinfobar}
			inviteinfobar :se_setprops \{valid_info_alpha = 0
				invalid_invite_alpha = 1}
		endif
	endif
endscript

script clear_menu 
	RequireParams \{[
			menu
		]
		all}
	GetScreenElementChildren id = <menu>
	if GotParam \{children}
		i = 0
		GetArraySize <children>
		if (<array_Size> > 0)
			begin
			DestroyScreenElement id = (<children> [<i>])
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script select_friend 
	Change friendlist_selection_index = <friend>
	getfriendinfo index = <friend>
	if GotParam \{is_pending_friend}
		inviteinfobar :se_setprops \{valid_info_alpha = 0
			invalid_invite_alpha = 1}
	else
		if (<haspendinginvite> = 1)
			<invite_props> = {}
			if (<game_mode> = p4_career)
				base_game_mode = <game_mode>
				<invite_props> = {
					<invite_props>
					gamemode_text = qs(0xdf90fff4)
				}
			else
				netoptions :pref_size \{Name = game_modes}
				i = 0
				begin
				netoptions :pref_getstruct Name = game_modes index = <i>
				if (<game_mode> = <pref_struct>.search_chk)
					<base_game_mode> = (<pref_struct>.checksum)
					<invite_props> = {
						<invite_props>
						gamemode_text = (<pref_struct>.Name)
					}
					break
				endif
				i = (<i> + 1)
				repeat <size>
			endif
			get_required_inst_and_players friend = <friend> base_game_mode = <base_game_mode> detail_game_mode = <game_mode> num_inviting_players = <num_players>
			if (<min_required_players> = <max_required_players>)
				formatText TextName = players '%d' d = <max_required_players>
			else
				formatText TextName = players '%d-%e' d = <min_required_players> e = <max_required_players>
			endif
			<invite_props> = {
				<invite_props>
				players_text = <players>
			}
			if StructureContains \{structure = required_instruments
					guitar1}
				<invite_props> = {
					<invite_props>
					guitar_alpha = 1
				}
			else
				<invite_props> = {
					<invite_props>
					guitar_alpha = 0.2
				}
			endif
			if StructureContains \{structure = required_instruments
					guitar2}
				<invite_props> = {
					<invite_props>
					bass_alpha = 1
				}
			else
				<invite_props> = {
					<invite_props>
					bass_alpha = 0.2
				}
			endif
			if StructureContains \{structure = required_instruments
					vocals}
				<invite_props> = {
					<invite_props>
					vocal_alpha = 1
				}
			else
				<invite_props> = {
					<invite_props>
					vocal_alpha = 0.2
				}
			endif
			if StructureContains \{structure = required_instruments
					drums}
				<invite_props> = {
					<invite_props>
					drum_alpha = 1
				}
			else
				<invite_props> = {
					<invite_props>
					drum_alpha = 0.2
				}
			endif
			<invite_props> = {
				<invite_props>
				valid_info_alpha = 1
				invalid_invite_alpha = 0
			}
			inviteinfobar :se_setprops <invite_props>
		else
			inviteinfobar :se_setprops \{valid_info_alpha = 0
				invalid_invite_alpha = 1}
		endif
	endif
endscript

script refresh_and_destroy 
	destroy_generic_popup
	Wait \{1
		gameframe}
	refresh_friends_list
endscript

script refresh_friends_list 
	ui_event_get_top
	if NOT (ScreenElementExists id = wii_friends_list_vmenu)
		return
	endif
	clear_menu \{menu = wii_friends_list_vmenu}
	populate_friends
	LaunchEvent \{Type = focus
		target = wii_friends_list_vmenu
		data = {
			child_index = $friendlist_selection_index
		}}
	Change \{disable_menu_sounds = 0}
endscript

script friendlist_friend_options 
	create_context_friend_menu
endscript

script friendlist_add_friend 
	ScriptAssert \{'friendlist_add_friend: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script friendlist_delete_friend 
	wii_friends_list_vmenu :GetSingleTag \{offline}
	friend = $friendlist_selection_index
	printf qs(0x803c5ef3) a = <friend>
	printf qs(0x542e87e4) c = <friend>
	deletefriend index = <friend> offline = <offline>
endscript

script create_context_friend_menu 
	destroy_generic_popup
	getnumfriends
	totalfriends = (<numfriendsonline> + <numfriendsoffline> + <numfriendspending>)
	if (<totalfriends> = 0)
		return
	endif
	wii_friends_list_vmenu :GetSingleTag \{offline}
	friend = $friendlist_selection_index
	getfriendinfo index = <friend>
	formatText TextName = text $wii_options_for a = <nickname>
	if (<haspendinginvite> = 1 && <offline> = 0)
		create_generic_popup {
			title = $wii_options
			option_menu = 4
			focus_option = 4
			message = <text>
			option1 = {
				title = $wii_accept_invite
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose request_accept_invite}
				]
			}
			option2 = {
				title = $wii_reject_invite
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose choose_reject_phrase}
				]
			}
			option3 = {
				title = $wii_delete_friend
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {Name = <nickname>}}
				]
			}
			option4 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			back_script = block_refresh_and_destroy
			previous_menu = vmenu_friendlist
		}
	elseif (<status> > 0 && <offline> = 0)
		create_generic_popup {
			title = $wii_options
			option_menu = 3
			focus_option = 3
			message = <text>
			option1 = {
				title = $wii_invite
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose friendlist_invite_friend}
				]
			}
			option2 = {
				title = $wii_delete_friend
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {Name = <nickname>}}
				]
			}
			option3 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			back_script = block_refresh_and_destroy
		}
	else
		create_generic_popup {
			title = $wii_options
			option_menu = 2
			focus_option = 2
			message = <text>
			option1 = {
				title = $wii_delete_friend
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {Name = <nickname>}}
				]
			}
			option2 = {
				title = $wii_cancel
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			back_script = block_refresh_and_destroy
		}
	endif
	ui_helpers_wii_friends_list \{state = popup}
endscript

script choose_reject_phrase 
	destroy_generic_popup
	Wait \{1
		gameframe}
	create_new_generic_popup \{title = $wii_reason
		title_effect
		popup_type = phrase_window
		phrase_array = reject_phrases_short
		phrase_func = send_reject_phrase
		back_script = back_out_of_rejection}
	ui_helpers_wii_friends_list \{state = reject}
endscript

script back_out_of_rejection 
	destroy_generic_popup
	create_context_friend_menu
endscript

script send_reject_phrase 
	friend = $friendlist_selection_index
	printf qs(0x8a05825c) a = <friend>
	phrase_text = ($<phrase_array> [<phrase_index>])
	printf qs(0xbb489105) a = <phrase_text> b = <friend>
	sendrejectphrase index = <friend> phrase = <phrase_index>
	formatText \{checksumName = inviteid
		'invite_id%a'
		a = $friendlist_selection_index}
	if ScreenElementExists id = <inviteid>
		DestroyScreenElement id = <inviteid>
	endif
	block_refresh_and_destroy
endscript

script confirm_delete_friend 
	destroy_generic_popup
	Wait \{1
		gameframe}
	formatText TextName = text $wii_delete_confirm a = <Name>
	wii_friends_list_vmenu :GetSingleTag \{offline}
	if (<offline> = 1)
		<delete_script> = context_menu_choose_delete_friend_offline
	else
		<delete_script> = context_menu_choose_delete_friend
	endif
	create_generic_popup {
		title = $wii_delete
		yes_no_menu
		focus_no
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose <delete_script> params = {Name = <Name>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script context_menu_choose_delete_friend 
	destroy_generic_popup
	Wait \{1
		gameframe}
	friendlist_delete_friend
	enable_network_wait_variable
	create_generic_popup \{loading_window
		message = $wii_deleting_friend
		wait_variable = network_wait_var
		previous_menu = vmenu_friendlist}
	formatText TextName = text $wii_deleted_friend a = <Name>
	Wait \{1
		gameframe}
	create_generic_popup {
		title = $wii_done
		ok_menu
		message = <text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script friendlist_invite_friend 
	destroy_generic_popup
	getelapsedtime \{starttime = $last_cancel_matchmaking_time}
	printf 'elapsed time %d' d = <ElapsedTime>
	if (<ElapsedTime> < 33000)
		create_generic_popup \{title = $wii_invite_title
			ok_menu
			message = $wii_invite_too_soon
			ok_eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					block_refresh_and_destroy
				}
			]
			back_script = block_refresh_and_destroy}
		return
	endif
	gamemode_gettype
	if NOT (<Type> = career)
		is_controller_online controller_index = <device_num>
		if NOT (<online> = 1)
			create_intrument_config_warning \{helper_controls_script = ui_helpers_wii_friends_list
				msg_txt = $wii_controller_not_signed_in}
			return
		endif
		if NOT is_valid_instrument_config
			create_intrument_config_warning \{helper_controls_script = ui_helpers_wii_friends_list}
			return
		endif
	endif
	friend = $friendlist_selection_index
	getfriendinfo index = <friend>
	formatText TextName = text $wii_invite_confirm a = <nickname>
	create_generic_popup {
		title = $wii_invite_title
		yes_no_menu
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose friendlist_confirm_invite_friend params = {index = <resolvedindex> nickname = <nickname>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script context_menu_choose_delete_friend_offline 
	destroy_generic_popup
	Wait \{1
		gameframe}
	friendlist_delete_friend
	formatText TextName = text $wii_deleted_friend a = <Name>
	create_generic_popup {
		title = $wii_done
		ok_menu
		message = <text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script friendlist_confirm_invite_friend 
	printf \{qs(0xb865b4f5)}
	SetButtonEventMappings \{block_menu_input}
	formatText TextName = friend_name qs(0x4d4555da) s = <nickname>
	destroy_generic_popup
	Wait \{5
		gameframe}
	Change invite_index = <index>
	if ui_event_exists_in_stack \{Name = 'band_mode'}
		printf \{qs(0xfcf5855c)}
		enable_network_wait_variable
		create_dialog_box \{wait_variable = network_wait_var
			heading_text = qs(0xabf4f150)
			body_text = $wii_loading_message
			full_blackout = 1}
		generic_event_back_block
		SpawnScriptNow ui_band_mode_friends_match params = {friend_index = <index>}
	else
		printf \{qs(0xcfc68bad)}
		generic_event_back_block
		start_invite_matchmaking action = HOST friend_index = <index> <...>
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script block_refresh_and_destroy 
	SetButtonEventMappings \{block_menu_input}
	refresh_and_destroy
	ui_helpers_wii_friends_list \{state = Base}
	Wait \{0.5
		Seconds}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script ui_wii_friends_invite_tutorial 
	create_generic_popup \{title = $wii_dlc_archived
		ok_menu
		message = $wii_invite_info
		default_blackout
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				ui_wii_friends_invite_destroy_tutorial
			}
		]
		back_script = ui_wii_friends_invite_destroy_tutorial}
	spawnscript \{ui_wii_friends_invite_blink_invite}
endscript

script ui_wii_friends_invite_blink_invite 
	if ScreenElementExists \{id = invite_tut_container}
		DestroyScreenElement \{id = invite_tut_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		id = invite_tut_container
		parent = root_window
		Pos = $invite_pos
		just = [
			left
			top
		]
		z_priority = 10000000.0}
	CreateScreenElement \{Type = SpriteElement
		id = invite_tut_icon
		parent = invite_tut_container
		dims = (128.0, 128.0)
		texture = general_invite_icon
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		z_priority = 10000000.0
		alpha = 0.0}
	begin
	invite_tut_icon :legacydomorph \{time = 0.5
		alpha = 1.0}
	Wait \{0.75
		Seconds}
	invite_tut_icon :legacydomorph \{time = 0.5
		alpha = 0.0}
	Wait \{0.5
		Seconds}
	repeat
endscript

script ui_wii_friends_invite_destroy_tutorial 
	KillSpawnedScript \{Name = ui_wii_friends_invite_blink_invite}
	if ScreenElementExists \{id = invite_tut_container}
		DestroyScreenElement \{id = invite_tut_container}
	endif
	destroy_generic_popup
endscript

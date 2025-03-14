
script ui_create_net_invite_ready 
	printf 'UI: ui_create_net_invite_ready'
	pause_menu_fmv_play
	if screenelementexists id = main_menu_bg
		doscreenelementmorph id = main_menu_bg alpha = 1
	endif
	make_cas_menu {
		title = "Xbox LIVE Invite"
		pausemenu
		preserve_case
	}
	add_cas_menu_item {
		text = "READY"
		pad_choose_script = ui_net_join_game
	}
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [{text = "\\m0 ACCEPT"}
			]
		}
	}
endscript

script ui_net_join_game 
	joininviteserver
endscript

script ui_destroy_net_invite_ready 
	printf \{'UI: ui_destroy_net_invite_ready'}
	generic_ui_destroy
endscript

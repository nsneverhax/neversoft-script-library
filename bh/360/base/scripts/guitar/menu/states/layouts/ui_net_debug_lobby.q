
script ui_create_net_debug_lobby \{mode = host}
	printstruct <...>
	if (<mode> = host)
		text = qs(0xabdef7c1)
	else
		text = qs(0x0f3ba1d5)
	endif
	make_generic_menu {
		Title = (<text> + qs(0xbad18748))
		menu_bg = menu_bg_1
		noTitleBG
		centered
		centered_offset = (0.0, 200.0)
	}
	if NOT (<mode> = host)
		SetScreenElementProps \{id = current_menu
			event_handlers = [
				{
					pad_square
					al_refresh
				}
			]}
	endif
	menu_finish
endscript

script ui_destroy_net_debug_lobby 
	generic_ui_destroy
endscript

script ui_create_net_debug_lobby_join \{server_name = qs(0x2e920c41)}
	make_generic_menu {
		Title = (qs(0xa73a9f5b) + <server_name>)
		menu_bg = menu_bg_1
		noTitleBG
		centered
		centered_offset = (0.0, 200.0)
	}
endscript

script ui_destroy_net_debug_lobby_join 
	generic_ui_destroy
endscript

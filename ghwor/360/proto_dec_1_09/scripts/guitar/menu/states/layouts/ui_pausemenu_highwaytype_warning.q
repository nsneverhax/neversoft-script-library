
script ui_create_pausemenu_highwaytype_warning 
	RequireParams \{[
			highway_type
		]
		all}
	disable_pause
	player_device = ($last_start_pressed_device)
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> controller
		if (<controller> = <player_device>)
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	<Player> = <player_selected>
	create_dialog_box {
		body_text = qs(0x843b1d75)
		player_device = <player_device>
		no_background
		options = [
			{
				func = highwaytype_warning_go_back
				text = qs(0xf7723015)
			}
			{
				func = highwaytype_warning_select_yes
				func_params = {Player = <Player> highway_type = <highway_type>}
				text = qs(0xb8790f2f)
			}
		]
	}
endscript

script ui_destroy_pausemenu_highwaytype_warning 
	destroy_dialog_box
endscript

script highwaytype_warning_go_back 
	ui_sfx \{menustate = Generic
		uitype = select}
	enable_pause
	generic_event_back
endscript

script highwaytype_warning_select_yes 
	vocals_safely_set_highway_view Player = <Player> highway_type = <highway_type>
	restart_warning_select_restart Player = <Player>
endscript

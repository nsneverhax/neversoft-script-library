ui_mainmenu_sixaxis_text = "Please connect a second SIXAXIS™ Wireless Controller to play a 2 player match."
ui_mainmenu_sixaxis_title = "SIXAXIS™ Wireless Controller Disconnected"
memcardmessages_format_text = "Formatting memory card. Do not remove memory card, SIXAXIS™ Wireless Controller, or reset/switch off system."

script get_connect_second_sixaxis_controller_text 
	if french
		<text> = "Connecter une deuxième manette sans fil SIXAXIS™ pour faire une partie à deux joueurs."
	elseif italian
		<text> = "Collega un secondo controller wireless SIXAXIS™ per giocare una partita a 2 giocatori."
	elseif german
		<text> = "Bitte schließ für ein 2-Spieler-Spiel einen zweiten SIXAXIS™ Wireless-Controller an."
	elseif spanish
		<text> = "Conecta un segundo mando inalámbrico SIXAXIS™ para jugar una partida de dos jugadores."
	else
		<text> = $ui_mainmenu_sixaxis_text
	endif
	return text = <text>
endscript

script get_connect_second_sixaxis_controller_title 
	if french
		<title> = "manette sans fil SIXAXIS™ déconnectée"
	elseif italian
		<title> = "controller wireless SIXAXIS™ rimosso"
	elseif german
		<title> = "SIXAXIS™ Wireless-Controller anschliessen"
	elseif spanish
		<title> = "mando inalámbrico SIXAXIS™ desconectado"
	else
		<title> = $ui_mainmenu_sixaxis_title
	endif
	return title = <title>
endscript

allow_dvd_errors = 1

script ngc_dvd_fatal_e 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'An error has occurred.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Press the Eject Button, remove the'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Game Disc, and turn the power off.'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Please read the Wii Operations Manual'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'for more information.'
		Scale = 2}
endscript

script ngc_dvd_retry_e 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'The Game Disc could not be read.'
		y = 270
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Refer to the Wii Operations Manual for details.'
		Scale = 2}
endscript

script ngc_dvd_retry_b 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'The Game Disc could not be read.'
		y = 270
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Please read the Wii Operations Manual'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'for more information.'
		Scale = 2}
endscript

script ngc_dvd_cover_open_e 
endscript

script ngc_dvd_no_disk_e 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Please insert the Guitar Hero: Aerosmith Game Disc.'
		y = 320
		Scale = 2}
endscript

script ngc_pal60_e 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Would you like to display'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'in 60 Hz mode?'
		Scale = 2}
	ngc_menu \{font = 'dialog'
		sr = 128
		sg = 128
		sb = 0
		sa = 255
		ur = 64
		ug = 32
		ub = 0
		ua = 255
		items = 2
		item0 = 'Yes'
		item1 = 'No'
		Scale = 2}
endscript

script ngc_60hz_e 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Screen display has been set'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'to 60 Hz mode'
		Scale = 2}
endscript

script ngc_50hz_e 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Screen display has been set'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'to 50 Hz mode'
		Scale = 2}
endscript

script ngc_dvd_fatal_f 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Une erreur est survenue.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Eteignez la console et'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'référez-vous au'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'manuel d\'instructions'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Nintendo Wii pour'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'de plus amples informations.'
		Scale = 2}
endscript

script ngc_dvd_retry_f 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Impossible de lire le disque.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Veuillez vous référer au mode'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'd\'emploi Wii pour plus de détails.'
		Scale = 2}
endscript

script ngc_dvd_cover_open_f 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Le couvercle est ouvert.'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Pour continuer à jouer,'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'veuillez fermer le couvercle.'
		Scale = 2}
endscript

script ngc_dvd_no_disk_f 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Veuillez insérer le disque'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Guitar Hero: Aerosmith.'
		Scale = 2}
endscript

script ngc_pal60_f 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Voulez-vous afficher'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'l\'image en mode 60 Hz?'
		Scale = 2}
	ngc_menu \{font = 'dialog'
		sr = 128
		sg = 128
		sb = 0
		sa = 255
		ur = 64
		ug = 32
		ub = 0
		ua = 255
		items = 2
		item0 = 'Oui'
		item1 = 'Non'
		Scale = 2}
endscript

script ngc_60hz_f 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'L\'affichage est en'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'mode 60 Hz.'
		Scale = 2}
endscript

script ngc_50hz_f 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'L\'affichage est en'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'mode 50 Hz.'
		Scale = 2}
endscript

script ngc_dvd_fatal_d 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Ein Fehler ist aufgetreten.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Bitte schalten Sie den'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Nintendo Wii aus und lesen'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Sie die Bedienungsanleitung, um'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'weitere Informationen zu erhalten.'
		Scale = 2}
endscript

script ngc_dvd_retry_d 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Diese Disc kann nicht gelesen werden.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Bitte lies die'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Wii-Bedienungsanleitung,'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'um weitere Informationen'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'zu erhalten.'
		Scale = 2}
endscript

script ngc_dvd_cover_open_d 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Der Disc-Deckel ist geöffnet.'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Bitte den Disc-Deckel schließen,'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'um mit dem Spiel fortzufahren.'
		Scale = 2}
endscript

script ngc_dvd_no_disk_d 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Bitte schiebe die'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Guitar Hero: Aerosmith-Disc ein.'
		Scale = 2}
endscript

script ngc_pal60_d 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Soll die Darstellung im'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = '60Hz-Modus erfolgen?'
		Scale = 2}
	ngc_menu \{font = 'dialog'
		sr = 128
		sg = 128
		sb = 0
		sa = 255
		ur = 64
		ug = 32
		ub = 0
		ua = 255
		items = 2
		item0 = 'Ja'
		item1 = 'Nein'
		Scale = 2}
endscript

script ngc_60hz_d 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Die Bildschirmdarstellung'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'erfolgt im 60Hz-Modus.'
		Scale = 2}
endscript

script ngc_50hz_d 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Die Bildschirmdarstellung'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'erfolgt im 50Hz-Modus.'
		Scale = 2}
endscript

script ngc_dvd_fatal_s 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Se ha producido un error.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Apaga la consola y consulta'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'el manual de instrucciones'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'de Nintendo Wii para'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'obtener más información.'
		Scale = 2}
endscript

script ngc_dvd_retry_s 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'No se puede leer el disco.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Consulta el manual de'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'instrucciones de la consola Wii'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'para obtener más información.'
		Scale = 2}
endscript

script ngc_dvd_cover_open_s 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'La tapa está abierta.'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Si quieres seguir jugando,'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'debes cerrar la tapa.'
		Scale = 2}
endscript

script ngc_dvd_no_disk_s 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Inserta el disco de '
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Guitar Hero: Aerosmith.'
		Scale = 2}
endscript

script ngc_pal60_s 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Este juego es compatible'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'con el modo 60 Hz.'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = '¿Quieres verlo en ese modo?'
		Scale = 2}
	ngc_menu \{font = 'dialog'
		sr = 128
		sg = 128
		sb = 0
		sa = 255
		ur = 64
		ug = 32
		ub = 0
		ua = 255
		items = 2
		item0 = 'Sí'
		item1 = 'No'
		Scale = 2}
endscript

script ngc_60hz_s 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'La pantalla se ha configurado'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'en modo 60 Hz.'
		Scale = 2}
endscript

script ngc_50hz_s 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'La pantalla se ha configurado'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = ' en modo 50 Hz.'
		Scale = 2}
endscript

script ngc_dvd_fatal_i 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Si è verificato un errore.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Spegni e consulta il'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'manuale di istruzioni'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'del Nintendo Wii'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'per ulteriori indicazioni.'
		Scale = 2}
endscript

script ngc_dvd_retry_i 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Impossibile leggere il disco.'
		y = 128
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Per maggiori informazioni,'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'consulta il manuale di'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'istruzioni della console Wii.'
		Scale = 2}
endscript

script ngc_dvd_cover_open_i 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Il coperchio del disco è aperto.'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Se vuoi proseguire nel gioco,'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'chiudi il coperchio del disco.'
		Scale = 2}
endscript

script ngc_dvd_no_disk_i 
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Inserisci il disco di'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'Guitar Hero: Aerosmith.'
		Scale = 2}
endscript

script ngc_pal60_i 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Visualizzare in modalità 60Hz?'
		y = 160
		Scale = 2}
	ngc_menu \{font = 'dialog'
		sr = 128
		sg = 128
		sb = 0
		sa = 255
		ur = 64
		ug = 32
		ub = 0
		ua = 255
		items = 2
		item0 = 'Sì'
		item1 = 'No'
		Scale = 2}
endscript

script ngc_60hz_i 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Visualizzazione impostata a 60Hz'
		y = 192
		Scale = 2}
endscript

script ngc_50hz_i 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Visualizzazione impostata a 50Hz'
		y = 192
		Scale = 2}
endscript

script ngc_dvd_fatal 
	if French
		ngc_dvd_fatal_f
	else
		if German
			ngc_dvd_fatal_d
		else
			if Spanish
				ngc_dvd_fatal_s
			else
				if Italian
					ngc_dvd_fatal_i
				else
					ngc_dvd_fatal_e
				endif
			endif
		endif
	endif
endscript

script ngc_dvd_retry 
	if French
		ngc_dvd_retry_f
	else
		if German
			ngc_dvd_retry_d
		else
			if Spanish
				ngc_dvd_retry_s
			else
				if Italian
					ngc_dvd_retry_i
				else
					if 0x7dabca53
						ngc_dvd_retry_b
					else
						ngc_dvd_retry_e
					endif
				endif
			endif
		endif
	endif
endscript

script ngc_dvd_cover_open 
	if French
		ngc_dvd_cover_open_f
	else
		if German
			ngc_dvd_cover_open_d
		else
			if Spanish
				ngc_dvd_cover_open_s
			else
				if Italian
					ngc_dvd_cover_open_i
				else
					ngc_dvd_cover_open_e
				endif
			endif
		endif
	endif
endscript

script ngc_dvd_no_disk 
	if French
		ngc_dvd_no_disk_f
	else
		if German
			ngc_dvd_no_disk_d
		else
			if Spanish
				ngc_dvd_no_disk_s
			else
				if Italian
					ngc_dvd_no_disk_i
				else
					ngc_dvd_no_disk_e
				endif
			endif
		endif
	endif
endscript

script ngc_dvd_wrong_disk 
	if French
		ngc_dvd_no_disk_f
	else
		if German
			ngc_dvd_no_disk_d
		else
			if Spanish
				ngc_dvd_no_disk_s
			else
				if Italian
					ngc_dvd_no_disk_i
				else
					ngc_dvd_no_disk_e
				endif
			endif
		endif
	endif
endscript

script ngc_pal60 
	if French
		ngc_pal60_f
	else
		if German
			ngc_pal60_d
		else
			if Spanish
				ngc_pal60_s
			else
				if Italian
					ngc_pal60_i
				else
					ngc_pal60_e
				endif
			endif
		endif
	endif
endscript

script ngc_dvd_60hz 
	if French
		ngc_60hz_f
	else
		if German
			ngc_60hz_d
		else
			if Spanish
				ngc_60hz_s
			else
				if Italian
					ngc_60hz_i
				else
					ngc_60hz_e
				endif
			endif
		endif
	endif
endscript

script ngc_50hz 
	if French
		ngc_50hz_f
	else
		if German
			ngc_50hz_d
		else
			if Spanish
				ngc_50hz_s
			else
				if Italian
					ngc_50hz_i
				else
					ngc_50hz_e
				endif
			endif
		endif
	endif
endscript

script ngc_widescreen 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Do you want to display'
		y = 160
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'in Progressive Mode?'
		Scale = 2}
	ngc_menu \{font = 'dialog'
		sr = 128
		sg = 128
		sb = 0
		sa = 255
		ur = 64
		ug = 32
		ub = 0
		ua = 255
		items = 2
		item0 = 'Yes'
		item1 = 'No'
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = ' '}
endscript

script ngc_license 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = '  '
		y = 192
		Scale = 2}
endscript

script ngc_memerror 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = '  '
		y = 192
		Scale = 2}
endscript

script ngc_progressive 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Screen has been set'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'to Progressive Mode'
		Scale = 2}
endscript

script ngc_progressive_off 
	ngc_bgcolor \{r = 0
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = 'dialog'
		text = 'Progressive Mode has'
		y = 192
		Scale = 2}
	ngc_message \{font = 'dialog'
		text = 'been turned to off.'
		Scale = 2}
endscript

script ngc_select0 
	ngc_setstandard
	0x1f903e6e 0x3f160798 = <0x3f160798>
endscript

script ngc_select1 
	ngc_setstandard
	0x7bfb96ae
endscript

script ngc_selectpal0 
	ngc_setstandard
	0x293d991f
endscript

script ngc_selectpal1 
	ngc_setstandard
	0x3b8836f1
endscript

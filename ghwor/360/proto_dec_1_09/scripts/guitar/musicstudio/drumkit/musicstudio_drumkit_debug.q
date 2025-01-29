
script debug_set_and_load_kit_from_index \{song = NULL}
	if (<song> != NULL)
		get_song_drum_kit_index song = <song>
		loaddrumkitall {
			drum_kit_index = <drum_kit_index>
			async = 0
			song = <song>
			Force
		}
	else
		loaddrumkitall {
			drum_kit_index = <drum_kit_index>
			percussion_kit_index = <percussion_kit_index>
			async = 0
			Force
		}
	endif
endscript

script debug_preview_all_drumkits \{SongList = 1
		drum_kits = 1
		perc_kits = 1}
	if (<SongList> = 1)
		<song_struct> = ($gh6_songlist_props)
		GetArraySize ($gh6_songlist)
		ii = 0
		begin
		<song> = (($gh5_songlist) [<ii>])
		printf channel = drumkit_preview qs(0xb7bcf4cf) a = <song>
		debug_preview_drums song = <song> previewkit = 1
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
	if (<drum_kits> = 1)
		GetArraySize ($drum_kits)
		ii = 0
		begin
		<kit> = (($drum_kits) [<ii>].id)
		printf channel = drumkit_preview qs(0x3e033ea1) a = <kit>
		debug_preview_drums drum_kit_index = <ii> previewkit = 1
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
	if (<perc_kits> = 1)
		GetArraySize ($percussion_drum_kits)
		ii = 0
		begin
		<kit> = (($percussion_drum_kits) [<ii>].id)
		printf channel = drumkit_preview qs(0xaff31234) a = <kit>
		debug_preview_drums percussion_kit_index = <ii> previewperc = 1
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
endscript

script debug_preview_drums \{drum_kit_index = 0
		percussion_kit_index = 0
		song = NULL
		previewkit = 0
		previewperc = 0}
	debug_set_and_load_kit_from_index {
		drum_kit_index = <drum_kit_index>
		percussion_kit_index = <percussion_kit_index>
		song = <song>
	}
	<controller> = 0
	<Player> = 1
	if (<previewkit> = 1)
		musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 0
	endif
	if (<previewperc> = 1)
		musicstudio_drum_kit_preview_loop controller = <controller> Player = <Player> percussion = 1
	endif
endscript

script debug_play_all_drum_samples \{song = NULL}
	debug_set_and_load_kit_from_index
	<iterate_velocity> = 0
	if (<iterate_velocity> = 1)
		<base_vel> = 7
	else
		<base_vel> = 127
	endif
	velocity = <base_vel>
	pad = snare
	begin
	get_per_pad_kit Type = <pad> drum_kit_index = <drum_kit_index>
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity> drum_kit_string = <drum_kit_string>
	<velocity> = (<velocity> + 2)
	Wait \{0.3
		Seconds}
	if (<velocity> >= 127)
		if (<pad> = snare)
			<pad> = kick
			velocity = <base_vel>
		elseif (<pad> = kick)
			<pad> = tom1
			velocity = <base_vel>
		elseif (<pad> = tom1)
			<pad> = tom2
			velocity = <base_vel>
		elseif (<pad> = tom2)
			<pad> = hihat
			velocity = <base_vel>
		elseif (<pad> = hihat)
			<pad> = cymbal
			velocity = <base_vel>
		elseif (<pad> = cymbal)
			break
		endif
	endif
	repeat
endscript

script debug_play_test_samples \{pad = kick}
	waitTime = 0.3
	velocity = 7
	drumset = classicrock
	pad = <pad>
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waitTime> Seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script print_drum_pad_kits \{message = ''
		percussion = 0}
	if (<percussion> = 1)
		printf qs(0xc2b1f611) {
			z = <message>
			a = $perpad_drum_p_cymbal
			b = $perpad_drum_p_tom2
			c = $perpad_drum_p_hihat
			d = $perpad_drum_p_tom1
			e = $perpad_drum_p_kick
			f = $perpad_drum_p_snare
		}
	else
		printf qs(0xc2b1f611) {
			z = <message>
			a = $perpad_drum_cymbal
			b = $perpad_drum_tom2
			c = $perpad_drum_hihat
			d = $perpad_drum_tom1
			e = $perpad_drum_kick
			f = $perpad_drum_snare
		}
	endif
endscript

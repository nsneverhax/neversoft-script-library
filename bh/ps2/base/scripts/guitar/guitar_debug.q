
script debug_gem_text 
	if (<pattern> && 65536)
		formatText TextName = text qs(0x14db9cdc) t = <text> p = <prefix>
	else
		formatText TextName = text qs(0xa0e44c32) t = <text> p = <prefix>
	endif
	if (<pattern> && 4096)
		formatText TextName = text qs(0xfadeba75) t = <text>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 256)
		formatText TextName = text qs(0x192a63be) t = <text>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 16)
		formatText TextName = text qs(0xb01ca824) t = <text>
	else
		formatText TextName = text qs(0x79548c8f) t = <text>
	endif
	if (<pattern> && 1)
		formatText TextName = text qs(0x4e0b861f) t = <text>
	else
		formatText TextName = text qs(0xcd911679) t = <text>
	endif
	return <...>
endscript

script debug_output 
	if ($output_log_file = 1)
		<showtime> = (<time> - ($check_time_early * 1000.0))
		formatText TextName = text qs(0x6f973620) t = <showtime> c = ($<player_status>.controller)
		if (<ignore_time> >= 0)
			debug_gem_text text = <text> pattern = <ignore_strum> prefix = qs(0x10ec1370)
		else
			formatText TextName = text qs(0xbf0b68d5) t = <text>
		endif
		GetHeldPattern controller = ($<player_status>.controller) Player = ($<player_status>.Player) nobrokenstring
		debug_gem_text text = <text> pattern = <strummed_pattern> prefix = qs(0xc7e758af)
		debug_gem_text text = <text> pattern = <original_strum> prefix = qs(0x859889df)
		debug_gem_text text = <text> pattern = <hold_pattern> prefix = qs(0x918eb2e5)
		if (<hit_strum> = 1)
			if (<fake_strum> = 1)
				formatText TextName = text qs(0x5b352041) t = <text>
			else
				formatText TextName = text qs(0xdc2df0df) t = <text>
			endif
		else
			if (<fake_strum> = 1)
				formatText TextName = text qs(0xbbea5772) t = <text>
			else
				formatText TextName = text qs(0x4578889e) t = <text>
			endif
		endif
		if (<strummed_before_forming> >= 0.0)
			formatText TextName = text qs(0x41fac866) t = <text>
		else
			formatText TextName = text qs(0xa5a7ffad) t = <text>
		endif
		if (<tapping> = 1)
			action_tap = qs(0x18c99bac)
		else
			action_tap = qs(0x92e2c9d5)
		endif
		get_input_debug_text <...>
		formatText TextName = text qs(0x4793bf41) t = <text> h = <action_hit> m = <action_mis> u = <action_unn> l = <action_tol> i = <input_text> k = <action_tap>
		formatText TextName = text qs(0xd30b02ca) t = <text> o = ($<player_status>.hammer_on_tolerance) n = <notes_open>
		GetArraySize <strum_hits>
		if (<array_Size> > 0)
			formatText TextName = text qs(0x14f47ad7) t = <text>
			<index> = 0
			begin
			<strum> = (<strum_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs(0x03ac90f0)
			<index> = (<index> + 1)
			repeat <array_Size>
			formatText TextName = text qs(0x36151a48) t = <text>
		endif
		GetArraySize <hammer_hits>
		if (<array_Size> > 0)
			formatText TextName = text qs(0x93ecaa49) t = <text>
			<index> = 0
			begin
			<strum> = (<hammer_hits> [<index>])
			debug_gem_text text = <text> pattern = <strum> prefix = qs(0x03ac90f0)
			<index> = (<index> + 1)
			repeat <array_Size>
			formatText TextName = text qs(0x36151a48) t = <text>
		endif
		if GotParam \{off_note}
			GetGlobalTags \{user_options}
			if GotParam \{lag_calibration}
				CastToInteger \{lag_calibration}
				Mod a = <lag_calibration> b = 1000
				<video_offset> = <Mod>
				<audio_offset> = ((<lag_calibration> / 1000) - 1)
				<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
				CastToInteger \{off_note}
			endif
			formatText TextName = text qs(0x7fe80a6d) t = <text> o = <off_note>
		endif
		ExtendCrc log ($<player_status>.text) out = log_channel

	endif
endscript

script FlexParticleWarning 
	SetScreenElementLock \{id = root_window
		OFF}
	if ObjectExists \{id = particle_warn_anchor}
		DestroyScreenElement \{id = particle_warn_anchor}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = particle_warn_anchor
		Pos = (25.0, 80.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = particle_warn_anchor
		id = particle_warn_text
		Pos = (0.0, 0.0)
		text = qs(0x475886ae)
		font = debug
		rgba = [
			255
			0
			0
			255
		]
		just = [
			left
			top
		]}
	SetScreenElementLock \{id = root_window
		On}
	Wait \{2
		Seconds}
	if ObjectExists \{id = particle_warn_anchor}
		DestroyScreenElement \{id = particle_warn_anchor}
	endif
endscript

script charge_star_power \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	if (gamemode_isbandscoring)
		getbandindexbyplayer Player = ($<player_status>.Player)
		band_id = ($band_ids [<band_index>])
		Change structurename = <band_id> star_power_amount = 100
	else
		Change structurename = <player_status> star_power_amount = 100
	endif
endscript

script activate_star_power \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	<player_text> = ($0x57e22f28 [<Player>])
	star_power_activate_and_drain <...>
endscript

script wait_until_ingame \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	begin
	if NOT (($<player_status>.playline_song_measure_time) = 0)
		break
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_infinite_star_power \{Player = 1}
	wait_until_ingame Player = <Player>
	charge_star_power Player = <Player>
	SpawnScriptNow activate_star_power params = {Player = <Player> infinite_drain}
	begin
	charge_star_power Player = <Player>
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_trigger_star_power \{Player = 1}
	wait_until_ingame Player = <Player>
	<player_status> = ($0x2994109a [<Player>])
	begin
	if (($<player_status>.star_power_amount) >= 50.0)
		activate_star_power Player = <Player>
	endif
	if (($band1_status.star_power_amount) >= 50.0)
		activate_star_power Player = <Player>
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script auto_full_star_power \{Player = 1}
	wait_until_ingame Player = <Player>
	<player_status> = ($0x2994109a [<Player>])
	begin
	if (($<player_status>.star_power_used) = 0)
		charge_star_power Player = <Player>
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script init_star_power_debug \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	if (($<player_status>.star_power_debug_mode) = 1)
		SpawnScriptNow auto_infinite_star_power params = {Player = <Player>}
	else
		if (($<player_status>.star_power_debug_mode) = 2)
			SpawnScriptNow auto_trigger_star_power params = {Player = <Player>}
		else
			if (($<player_status>.star_power_debug_mode) = 3)
				SpawnScriptNow auto_full_star_power params = {Player = <Player>}
			endif
		endif
	endif
endscript

script deinit_star_power_debug 
	KillSpawnedScript \{Name = auto_infinite_star_power}
	KillSpawnedScript \{Name = auto_trigger_star_power}
	KillSpawnedScript \{Name = auto_full_star_power}
	KillSpawnedScript \{Name = activate_star_power}
endscript

script update_rock_meter_debug_text 
	begin
	if ScreenElementExists id = <id>
		if ($current_num_players > 1)
			<Player> = 1
			begin
			<player_status> = ($0x2994109a [<Player>])
			<part> = qs(0xbc6d5b69)
			if (($<player_status>.part) = bass)
				<part> = qs(0x26fc5cd2)
			endif
			if (($<player_status>.part) = guitar)
				<part> = qs(0x5b8ba897)
			endif
			if (($<player_status>.part) = drum)
				<part> = qs(0x70a6fb54)
			endif
			if (($<player_status>.part) = vocals)
				<part> = qs(0x08528b87)
			endif
			formatText checksumName = rmdt 'rock_meter_debug_text%i' i = <Player> AddToStringLookup
			formatText TextName = string qs(0x589fda4a) p = <part> v = ($<player_status>.current_health)
			SetScreenElementProps id = <rmdt> text = <string>
			<Player> = (<Player> + 1)
			repeat $current_num_players
		endif
		formatText \{TextName = text_string
			qs(0x0bc409e2)
			a = $current_crowd}
		SetScreenElementProps id = <id> text = <text_string>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script setlist_quit_song_menu_input 
	setscriptcannotpause
	<return_to_base_selection> = 0
	begin
	Block \{Type = setlist_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = setlist_menu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	if (<return_to_base_selection> > 0)
		begin
		LaunchEvent \{Type = pad_up
			target = setlist_menu}
		Wait RandomFloat (0.2, 0.6) Seconds
		repeat <return_to_base_selection>
	endif
	<count> = RandomInteger (1.0, 8.0)
	<return_to_base_selection> = <count>
	begin
	LaunchEvent \{Type = pad_down
		target = setlist_menu}
	Wait RandomFloat (0.2, 0.6) Seconds
	repeat <count>
	setlist_menu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {setlist_menu child = <selected_index>}
	Block \{Type = song_started}
	Wait RandomFloat (5.0, 60.0) Seconds

	LaunchEvent \{Type = pad_start
		target = root_window}
	Block \{Type = pause_menu_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = current_menu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	begin
	LaunchEvent \{Type = pad_down
		target = current_menu}
	Wait \{0.3
		Seconds}
	repeat 5
	current_menu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {current_menu child = <selected_index>}
	Block \{Type = popup_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = dialog_box_vmenu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	LaunchEvent \{Type = pad_down
		target = dialog_box_vmenu}
	Wait \{0.5
		Seconds}
	dialog_box_vmenu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {dialog_box_vmenu child = <selected_index>}
	Block \{Type = popup_created}
	Wait RandomFloat (1.0, 2.0) Seconds
	begin
	if ScreenElementExists \{id = dialog_box_vmenu}
		break
	endif
	Wait \{1
		gameframes}
	repeat

	LaunchEvent \{Type = pad_down
		target = dialog_box_vmenu}
	Wait \{0.5
		Seconds}
	dialog_box_vmenu :menu_getselectedindex
	LaunchEvent Type = pad_choose target = {dialog_box_vmenu child = <selected_index>}
	repeat
endscript

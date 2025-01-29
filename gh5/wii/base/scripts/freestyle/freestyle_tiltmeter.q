freestyle_tiltmeter_count = 0
freestyle_last_tilt_region = [
	-1
	-1
	-1
]
freestyle_manual_tilt_update = FALSE

script freestyle_init_tiltmeter 
	counter = 0
	Change \{freestyle_tiltmeter_count = 0}
	begin
	freestyle_set_player_param Player = <counter> param = tiltmeter_id value = None
	if (($freestyle_player_data [<counter>].has_highway) = true)
		if ((($freestyle_player_data [<counter>].instrument) = guitar) || (($freestyle_player_data [<counter>].instrument) = bass))
			formatText checksumName = tiltmeter_id 'freestyle_tiltmeter_%i' i = ($freestyle_tiltmeter_count)
			freestyle_set_player_param Player = <counter> param = tiltmeter_id value = <tiltmeter_id>
			highway_player = ($freestyle_player_data [<counter>].highway_player)
			formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
			CreateScreenElement {
				dims = (400.0, 400.0)
				parent = <freestyle_highway_name>
				id = <tiltmeter_id>
				Type = descinterface
				desc = 'freestyle_tiltmeter'
				z_priority = -1.5
			}
			<tiltmeter_id> :desc_resolvealias Name = alias_freestyle_tiltmeter_container
			instrument = ($freestyle_player_data [<counter>].instrument)
			if ((<instrument> = guitar) || (<instrument> = bass))
				if (($freestyle_player_data [<counter>].lefty) = FALSE)
					<tiltmeter_id> :se_setprops {Pos = ($highway_guitarfreestyle.tiltmeter_righty_pos)}
					scale_flip = (((-1.0, 0.0) * ($highway_guitarfreestyle.tiltmeter_xscale))
						+ ((0.0, 1.0) * ($highway_guitarfreestyle.tiltmeter_yscale)))
					<resolved_id> :se_setprops {Scale = <scale_flip>}
				else
					<tiltmeter_id> :se_setprops {Pos = ($highway_guitarfreestyle.tiltmeter_lefty_pos)}
					scale_flip = (((1.0, 0.0) * ($highway_guitarfreestyle.tiltmeter_xscale))
						+ ((0.0, 1.0) * ($highway_guitarfreestyle.tiltmeter_yscale)))
					<resolved_id> :se_setprops {Scale = <scale_flip>}
				endif
			endif
			<tiltmeter_id> :SetTags Player = <counter>
			Change freestyle_tiltmeter_count = (($freestyle_tiltmeter_count) + 1)
		endif
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_deinit_tiltmeter 
	if ($freestyle_tiltmeter_count > 0)
		Player = 0
		begin
		tiltmeter_id = ($freestyle_player_data [<Player>].tiltmeter_id)
		if (<tiltmeter_id> != None)
			DestroyScreenElement id = <tiltmeter_id>
		endif
		Player = (<Player> + 1)
		repeat ($freestyle_max_players)
	endif
endscript

script freestyle_update_tiltmeter 
	if ($freestyle_tiltmeter_count > 0)
		counter = 0
		Player = 0
		begin
		tiltmeter_id = ($freestyle_player_data [<Player>].tiltmeter_id)
		if (<tiltmeter_id> != None)
			<last_tilt> = ($freestyle_last_tilt_region [<counter>])
			getguitartiltvalue Player = <Player>
			getguitaractivetilt Player = <Player>
			if (($freestyle_player_data [<Player>].lefty) = true)
				angle = (45 + ((1 - <tilt_value>) * (-90)))
			elseif (($freestyle_player_data [<Player>].lefty) = FALSE)
				angle = (-45 + ((1 - <tilt_value>) * (90)))
			endif
			<tiltmeter_id> :desc_resolvealias Name = alias_freestyle_tiltmeter_guitars
			<resolved_id> :se_setprops {rot_angle = <angle>}
			if ((<last_tilt> != <active_tilt>) || ($freestyle_manual_tilt_update = true))
				if (<active_tilt> = 0)
					if (($freestyle_player_data [<Player>].instrument) = guitar)
						<tiltmeter_id> :se_setprops {
							tilt_needle_texture = tilt_guitar_orange
							tilt_wedge_texture = tilt_wedge_guitar_orange
						}
					elseif (($freestyle_player_data [<Player>].instrument) = bass)
						<tiltmeter_id> :se_setprops {
							tilt_needle_texture = tilt_bass_orange
							tilt_wedge_texture = tilt_wedge_orange
						}
					endif
				elseif (<active_tilt> = 1)
					if (($freestyle_player_data [<Player>].instrument) = guitar)
						<tiltmeter_id> :se_setprops {
							tilt_needle_texture = tilt_guitar_blue
							tilt_wedge_texture = tilt_wedge_guitar_blue
						}
					elseif (($freestyle_player_data [<Player>].instrument) = bass)
						<tiltmeter_id> :se_setprops {
							tilt_needle_texture = tilt_bass_blue
							tilt_wedge_texture = tilt_wedge_blue
						}
					endif
				elseif (<active_tilt> = 2)
					if (($freestyle_player_data [<Player>].instrument) = guitar)
						<tiltmeter_id> :se_setprops {
							tilt_needle_texture = tilt_guitar_green
							tilt_wedge_texture = tilt_wedge_guitar_green
						}
					elseif (($freestyle_player_data [<Player>].instrument) = bass)
						<tiltmeter_id> :se_setprops {
							tilt_needle_texture = tilt_bass_green
							tilt_wedge_texture = tilt_wedge_green
						}
					endif
				endif
				freestyle_tilt_changed_notify highway_player = ($freestyle_player_data [<Player>].highway_player) last_tilt = <last_tilt> new_tilt = <active_tilt>
				SetArrayElement globalarray ArrayName = freestyle_last_tilt_region index = <counter> NewValue = <active_tilt>
				if ($freestyle_manual_tilt_update = true)
					Change \{freestyle_manual_tilt_update = FALSE}
				endif
			endif
			counter = (<counter> + 1)
		endif
		Player = (<Player> + 1)
		repeat ($freestyle_max_players)
	endif
endscript

script freestyle_tilt_changed_notify 
	printf 'Highway %a: tilt changed %b -> %c' a = <highway_player> b = <last_tilt> c = <new_tilt>
	freestyle_show_beat_glow highway_player = <highway_player> tilt = <new_tilt>
	updatehighwaytilt Player = <highway_player>
	freestyle_solo_tilt Player = <highway_player> tilt = <new_tilt>
endscript

script freestyle_animate_mock_hud_element \{frequency = 2.0}
	Obj_GetID
	if GotParam \{guitar_tiltmeter}
		incremental_time = ((<frequency> * 1.0) / 3 / 2)
		if GotParam \{righty}
			<objID> :desc_resolvealias Name = alias_freestyle_tiltmeter_container
			<objID> :se_getprops Pos
			<objID> :se_setprops Pos = (<Pos> + (40.0, 0.0))
			<resolved_id> :se_setprops {
				Scale = (-0.85, 0.85)
			}
			angle_0 = -45
			angle_1 = 0
			angle_2 = 45
		else
			angle_0 = 45
			angle_1 = 0
			angle_2 = -45
		endif
		begin
		<objID> :desc_resolvealias Name = alias_freestyle_tiltmeter_guitars
		<resolved_id> :se_setprops {
			rot_angle = <angle_0>
		}
		<objID> :se_setprops {
			tilt_needle_texture = tilt_guitar_green
			tilt_wedge_texture = tilt_wedge_guitar_green
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_1>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_guitar_blue
			tilt_wedge_texture = tilt_wedge_guitar_blue
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_2>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_guitar_orange
			tilt_wedge_texture = tilt_wedge_guitar_orange
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_1>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_guitar_blue
			tilt_wedge_texture = tilt_wedge_guitar_blue
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_0>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_guitar_green
			tilt_wedge_texture = tilt_wedge_guitar_green
		}
		repeat
	elseif GotParam \{bass_tiltmeter}
		incremental_time = ((<frequency> * 1.0) / 3 / 2)
		if GotParam \{righty}
			<objID> :desc_resolvealias Name = alias_freestyle_tiltmeter_container
			<objID> :se_getprops Pos
			<objID> :se_setprops Pos = (<Pos> + (40.0, 0.0))
			<resolved_id> :se_setprops {
				Scale = (-0.85, 0.85)
			}
			angle_0 = -45
			angle_1 = 0
			angle_2 = 45
		else
			angle_0 = 45
			angle_1 = 0
			angle_2 = -45
		endif
		begin
		<objID> :desc_resolvealias Name = alias_freestyle_tiltmeter_guitars
		<resolved_id> :se_setprops {
			rot_angle = <angle_0>
		}
		<objID> :se_setprops {
			tilt_needle_texture = tilt_bass_green
			tilt_wedge_texture = tilt_wedge_green
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_1>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_bass_blue
			tilt_wedge_texture = tilt_wedge_blue
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_2>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_bass_orange
			tilt_wedge_texture = tilt_wedge_orange
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_1>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_bass_blue
			tilt_wedge_texture = tilt_wedge_blue
		}
		<resolved_id> :se_setprops {
			rot_angle = <angle_0>
			time = <incremental_time>
		}
		Wait <incremental_time> Seconds
		<objID> :se_setprops {
			tilt_needle_texture = tilt_bass_green
			tilt_wedge_texture = tilt_wedge_green
		}
		repeat
	elseif GotParam \{drum_assist}
		if NOT GotParam \{righty}
			<objID> :se_setprops {
				drum_assist_scale = (-1.0, 1.0)
			}
		endif
		if NOT freestyle_is_instrument_ai \{instrument = drums}
			freestyle_find_player_with_instrument \{instrument = drums}
			instrument_handler = ($freestyle_player_data [<player_with_instrument>].instrument_handler)
			if (<instrument_handler> = drums_nunchuk)
				<objID> :se_setprops {
					drumkit_assist_visibility = 0
					nunchuk_assist_visibility = 1
				}
			else
				<objID> :se_setprops {
					drumkit_assist_visibility = 1
					nunchuk_assist_visibility = 0
				}
			endif
		else
			<objID> :se_setprops {
				drumkit_assist_visibility = 1
				nunchuk_assist_visibility = 0
			}
		endif
		begin
		<objID> :se_setprops {
			drum_assist_glow_visibility = 1
			time = 0.1
		}
		Wait (<frequency> / 2) Seconds
		<objID> :se_setprops {
			drum_assist_glow_visibility = 0
			time = 0.1
		}
		Wait (<frequency> / 2) Seconds
		repeat
	endif
endscript

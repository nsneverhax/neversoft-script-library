CANCEL_GROUND = 1
cancel_air = 2
cancel_rail = 4
cancel_wall = 8
cancel_lip = 16
cancel_wallplant = 32
CANCEL_MANUAL = 64
cancel_hang = 128
cancel_ladder = 256
PURE_GROUND = 510
PURE_AIR = 509
PURE_RAIL = 507
PURE_WALL = 503
PURE_LIP = 495
PURE_WALLPLANT = 479
PURE_MANUAL = 447
PURE_HANG = 383
PURE_LADDER = 255
require_ground = 65536
require_air = 131072
REQUIRE_RAIL = 262144
require_wall = 524288
require_lip = 1048576
require_wallplant = 2097152
require_manual = 4194304
require_hang = 8388608
require_ladder = 16777216
cancel_skate = 512
CANCEL_WALK = 1024
cancel_drive = 2048
require_skate = 33554432
require_walk = 67108864
require_drive = 134217728

script defaultgapscript 
	printf \{"DefaultGapScript"}
	soundevent \{event = SKUtils_SFX_MainGapSound}
	if skating
		if onground
			LandGapsImmediately = 1
		endif
	else
		if walking
			LandGapsImmediately = 1
		endif
	endif
	if gotparam \{LandGapsImmediately}
		getnumberofnongaptricks
		if (<numberofnongaptricks> = 0)
			landskatertricks
		endif
	endif
endscript

script got_gap_for_first_time 
	if inmultiplayergame
		return
	endif
	if ((igc_playing) = 1)
		return
	endif
	if getglobalflag flag = $no_display_trickstring
		return
	endif
	if NOT intraining
		if gotparam multiple_new_gaps
			<gap_msg> = "FOUND MULTIPLE GAPS!"
		else
			formattext textname = gap_msg "FOUND GAP: %t" t = <gap_text>
		endif
	endif
	ui_display_message type = alert color = bluelt text = <gap_msg>
	soundevent event = found_gap_success_sound
endscript

script GetGap 
	StartGap {GapID = GetGap_DefaultID flags = <flags> tricktext = <tricktext> trickscript = <trickscript> zone = <zone>}
	endgap {GapID = GetGap_DefaultID score = <score> text = <text> gapscript = <gapscript> markerids = <markerids> zone = <zone>}
endscript

script Gap_Gen_Rail2Rail 
	Gap_Gen_RailHop <...>
endscript

script Gap_Gen_Ledge2Ledge 
	Gap_Gen_LedgeHop <...>
endscript

script Gap_Gen_Rail2Ledge 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Rail 2 Ledge" score = 50 <...>
	endif
endscript

script Gap_Gen_Rail2Bench 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Rail 2 Bench" score = 50 <...>
	endif
endscript

script Gap_Gen_Ledge2Rail 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Ledge 2 Rail" score = 50 <...>
	endif
endscript

script Gap_Gen_Ledge2Bench 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Ledge 2 Bench" score = 50 <...>
	endif
endscript

script Gap_Gen_Wire2Ledge 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Wire 2 Ledge" score = 50 <...>
	endif
endscript

script Gap_Gen_Bench2Rail 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Bench 2 Rail" score = 50 <...>
	endif
endscript

script Gap_Gen_Bench2Ledge 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Bench 2 Ledge" score = 50 <...>
	endif
endscript

script Gap_Gen_WireHop 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Wire hop" score = 25 <...>
	endif
endscript

script Gap_Gen_BenchHop 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Bench hop" score = 25 <...>
	endif
endscript

script Gap_Gen_RailHop 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Rail hop" score = 25 <...>
	endif
endscript

script Gap_Gen_LedgeHop 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Ledge hop" score = 25 <...>
	endif
endscript

script Gap_Gen_AcrossTheStreet 
	if gotparam \{start}
		Gap_Gen_Rail <...>
	else
		Gap_Gen_End GapID = <GapID> text = "Across the street" score = 50 <...>
	endif
endscript

script Gap_Gen_HighLip 
	if gotparam \{start}
		StartGap {
			GapID = <GapID>
			flags = [
				require_lip
				CANCEL_GROUND
				cancel_wall
				CANCEL_MANUAL
				cancel_rail
				cancel_wallplant
				cancel_hang
				cancel_ladder
			]
			<...>
		}
	else
		wait \{1
			frame}
		Gap_Gen_End GapID = <GapID> text = "High lip" score = 100 <...>
	endif
endscript

script Gap_Gen_RampTransfer 
	if NOT gotparam \{text}
		text = "Ramp Transfer"
	endif
	if gotparam \{start}
		StartGap {
			GapID = <GapID>
			flags = [PURE_AIR CANCEL_WALK]
			<...>}
	else
		Gap_Gen_End GapID = <GapID> score = 100 <...>
	endif
endscript

script Gap_Gen_Rail 
	if gotparam start
		StartGap {
			GapID = <GapID>
			flags = [
				CANCEL_GROUND
				CANCEL_MANUAL
				cancel_wall
				cancel_lip
				cancel_wallplant
				cancel_hang
				cancel_ladder
			]
			<...>
		}
	else
		if gotparam end
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
		else
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
		endif
	endif
endscript

script Gap_Gen_Lip 
	if gotparam start
		StartGap {
			GapID = <GapID>
			flags = [
				require_lip
				CANCEL_GROUND
				cancel_wall
				CANCEL_MANUAL
				cancel_rail
				cancel_wallplant
				cancel_hang
				cancel_ladder
			]
			<...>
		}
	else
		if gotparam end
			wait 1 frame
			endgap {
				GapID = <GapID>
				text = <text>
				score = <score>
			}
		else
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
		endif
	endif
endscript

script Gap_Gen_Transfer 
	if gotparam start
		StartGap {
			GapID = <GapID>
			flags = [PURE_AIR CANCEL_WALK]
			<...>
		}
	else
		if gotparam end
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
		else
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
		endif
	endif
endscript

script Gap_Gen_PureAir 
	if gotparam start
		StartGap {
			GapID = <GapID>
			flags = [PURE_AIR CANCEL_WALK]
			<...>
		}
	else
		if gotparam end
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
		else
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
		endif
	endif
endscript

script Gap_Gen_Manual 
	if gotparam start
		StartGap {
			GapID = <GapID>
			flags = PURE_MANUAL
			<...>
		}
	else
		if gotparam end
			Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
		else
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
		endif
	endif
endscript

script Gap_Gen_End 
	if gotparam \{end}
		endgap {
			GapID = <GapID>
			text = <text>
			score = <score>
			<...>
		}
	else
		printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
	endif
endscript

script Gap_CarHop \{gapscript = CarHopGapScript}
	StartGap {GapID = <StartGapID> flags = PURE_AIR}
	endgap {GapID = <EndGapID> text = "Car hop" score = 100 gapscript = <gapscript>}
endscript

script CarHopGapScript 
	broadcastevent \{type = SkaterCarHop}
endscript

script LipGap1 
	Gap_Gen_HighLip <...>
endscript

script LedgeGap1 
	Gap_Gen_Ledge2Ledge <...>
endscript

script LedgeGap2 
	Gap_Gen_Ledge2Ledge <...>
endscript

script LedgeGap3 
	Gap_Gen_Ledge2Ledge <...>
endscript

script LedgeGap4 
	Gap_Gen_Ledge2Ledge <...>
endscript

script LedgeGap5 
	Gap_Gen_Ledge2Ledge <...>
endscript

script RailHop1 
	Gap_Gen_RailHop <...>
endscript

script RailHop2 
	Gap_Gen_RailHop <...>
endscript

script RampTransfer1 
	Gap_Gen_RampTransfer <...>
endscript

script Rail2Ledge1 
	Gap_Gen_Rail2Ledge <...>
endscript

script Rail2Ledge2 
	Gap_Gen_Rail2Ledge <...>
endscript

script RampTransfer2 
	Gap_Gen_RampTransfer <...>
endscript

script RampTransfer3 
	Gap_Gen_RampTransfer <...>
endscript

script RampTransfer4 
	Gap_Gen_RampTransfer <...>
endscript

script RampTransfer5 
	Gap_Gen_RampTransfer <...>
endscript

script HighLip1 
	Gap_Gen_HighLip <...>
endscript

script BenchHop1 
	Gap_Gen_BenchHop <...>
endscript

script BenchHop2 
	Gap_Gen_BenchHop <...>
endscript

script BenchHop3 
	Gap_Gen_BenchHop <...>
endscript

script Bench2Rail1 
	Gap_Gen_Bench2Rail <...>
endscript

script Bench2Rail2 
	Gap_Gen_Bench2Rail <...>
endscript

script Bench2Rail3 
	Gap_Gen_Bench2Rail <...>
endscript

script WireHop1 
	Gap_Gen_WireHop <...>
endscript

script RailGap1 
	Gap_Gen_RailHop <...>
endscript

script RailGap2 
	Gap_Gen_RailHop <...>
endscript

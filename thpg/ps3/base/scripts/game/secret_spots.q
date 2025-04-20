global_secret_spots = {
	Z_BCity_GetCash_01
	Z_BCity_GetCash_02
	Z_BCity_GetCash_03
	Z_BCity_GetCash_04
	Z_BCity_GetCash_05
	Z_BCity_GetCash_06
	Z_BCity_GetCash_07
	Z_BCity_GetCash_08
	Z_BCity_GetCash_09
	Z_BCity_GetCash_10
	Z_Bell_GetCash_01
	Z_Bell_GetCash_02
	Z_Bell_GetCash_03
	Z_Bell_GetCash_04
	Z_Bell_GetCash_05
	Z_Bell_GetCash_06
	Z_Bell_GetCash_07
	Z_Bell_GetCash_08
	Z_Bell_GetCash_09
	Z_Bell_GetCash_10
	Z_BW_Bridge_GetCash_01
	Z_BW_Bridge_GetCash_02
	Z_BW_Bridge_GetCash_03
	Z_BW_Bridge_GetCash_04
	Z_BW_Bridge_GetCash_05
	Z_BW_Bridge_GetCash_06
	Z_BW_Bridge_GetCash_07
	Z_FDR_GetCash_04
	Z_FDR_GetCash_08
	Z_FDR_GetCash_02
	Z_FDR_GetCash_03
	Z_FDR_GetCash_07
	Z_FDR_GetCash_01
	Z_FDR_GetCash_06
	Z_FDR_GetCash_09
	Z_FDR_GetCash_10
	z_harbor_GetCash_01
	z_harbor_GetCash_02
	z_harbor_GetCash_03
	z_harbor_GetCash_04
	z_harbor_GetCash_05
	z_harbor_GetCash_06
	z_harbor_GetCash_07
	z_harbor_GetCash_08
	z_harbor_GetCash_09
	z_harbor_GetCash_10
	Z_Lansdowne_GetCash_01
	Z_Lansdowne_GetCash_02
	Z_Lansdowne_GetCash_03
	Z_Lansdowne_GetCash_04
	Z_Lansdowne_GetCash_05
	Z_Lansdowne_GetCash_06
	Z_Lansdowne_GetCash_07
	Z_Lansdowne_GetCash_08
	Z_Lansdowne_GetCash_09
	Z_Lansdowne_GetCash_10
	Z_Love_GetCash_01
	Z_Love_GetCash_02
	Z_Love_GetCash_03
	Z_Love_GetCash_04
	Z_Love_GetCash_05
	Z_Love_GetCash_06
	Z_Love_GetCash_07
	Z_Love_GetCash_08
	Z_Love_GetCash_09
	Z_Love_GetCash_10
	Z_Monuments_GetCash_01
	Z_Monuments_GetCash_02
	Z_Monuments_GetCash_03
	Z_Monuments_GetCash_04
	Z_Monuments_GetCash_05
	Z_Monuments_GetCash_06
	Z_Monuments_GetCash_07
	Z_Monuments_GetCash_08
	Z_Monuments_GetCash_09
	Z_Monuments_GetCash_10
	Z_Museum_Int_GetCash_01
	Z_Museum_Int_GetCash_02
	Z_Museum_Int_GetCash_03
	Z_Museum_Int_GetCash_04
	Z_Museum_Int_GetCash_05
	Z_Museum_Int_GetCash_06
	Z_Museum_Int_GetCash_07
	Z_Museum_Int_GetCash_08
	Z_Museum_Int_GetCash_09
	Z_Museum_Int_GetCash_10
	Z_Museums_GetCash_06
	Z_Museums_GetCash_01
	Z_Museums_GetCash_02
	Z_Museums_GetCash_03
	Z_Museums_GetCash_04
	Z_Museums_GetCash_05
	Z_Museums_GetCash_07
	Z_Museums_GetCash_08
	Z_Museums_GetCash_09
	Z_Museums_GetCash_10
	z_pb_bridge_GetCash_01
	z_pb_bridge_GetCash_02
	z_pb_bridge_GetCash_03
	z_pb_bridge_GetCash_04
	z_pb_bridge_GetCash_05
	z_pb_bridge_GetCash_07
	z_pb_bridge_GetCash_08
	z_pb_bridge_GetCash_09
	z_pb_bridge_GetCash_10
	z_pb_bridge_GetCash_06
	Z_Secret_GetCash_01
	Z_Secret_GetCash_03
	Z_Secret_GetCash_07
	Z_Secret_GetCash_08
	Z_Slums_GetCash_01
	Z_Slums_GetCash_02
	Z_Slums_GetCash_03
	Z_Slums_GetCash_04
	Z_Slums_GetCash_05
	Z_Slums_GetCash_06
	Z_Slums_GetCash_07
	Z_Slums_GetCash_08
	Z_Slums_GetCash_09
	Z_Slums_GetCash_10
	Z_WP_Bridge_GetCash_01
	Z_WP_Bridge_GetCash_02
	Z_WP_Bridge_GetCash_03
	Z_WP_Bridge_GetCash_04
	Z_WP_Bridge_GetCash_05
	Z_WP_Bridge_GetCash_06
	Z_WP_Bridge_GetCash_07
	Z_WP_Bridge_GetCash_08
	Z_WP_Bridge_GetCash_09
	Z_WP_Bridge_GetCash_10
}

script Cash_Collect 
	if NOT inside
		return
	endif
	if inmultiplayergame
		return
	endif
	if gotparam \{created}
		return
	endif
	if gotparam \{destroyed}
		return
	endif
	if gman_hasactivegoals
		return
	endif
	spawnscriptnow Cash_Collect_Effect params = {<...>}
	kill prefix = <cash_prefix>
	kill name = <cash_prefix>
	careerfunc func = foundsecretspot params = {spot = <cash_prefix>}
endscript

script Cash_Collect_Effect 
	switch <ammount>
		case am
		<ammount> = 10
		<cash_effect> = 2
		case pro
		<ammount> = 20
		<cash_effect> = 4
		case sick
		<ammount> = 30
		<cash_effect> = 6
	endswitch
	game_progress_add_cash cash = <ammount>
	formattext textname = txt "$%x" x = <ammount>
	ui_display_message {
		type = uberalert
		text = <txt>
		color = green
		has_background
	}
	begin
	screenflash time = 0.1
	soundevent event = Cash_SFX
	wait 10 frames
	repeat <cash_effect>
endscript
cash_collect_created_icons = [
]

script cash_collect_kill_icons 
	<secret_spots> = [
		Z_BCity_GetCash_01_icon
		Z_BCity_GetCash_02_icon
		Z_BCity_GetCash_03_icon
		Z_BCity_GetCash_04_icon
		Z_BCity_GetCash_05_icon
		Z_BCity_GetCash_06_icon
		Z_BCity_GetCash_07_icon
		Z_BCity_GetCash_08_icon
		Z_BCity_GetCash_09_icon
		Z_BCity_GetCash_10_icon
		Z_Bell_GetCash_01_icon
		Z_Bell_GetCash_02_icon
		Z_Bell_GetCash_03_icon
		Z_Bell_GetCash_04_icon
		Z_Bell_GetCash_05_icon
		Z_Bell_GetCash_06_icon
		Z_Bell_GetCash_07_icon
		Z_Bell_GetCash_08_icon
		Z_Bell_GetCash_09_icon
		Z_Bell_GetCash_10_icon
		Z_BW_Bridge_GetCash_01_icon
		Z_BW_Bridge_GetCash_02_icon
		Z_BW_Bridge_GetCash_03_icon
		Z_BW_Bridge_GetCash_04_icon
		Z_BW_Bridge_GetCash_05_icon
		Z_BW_Bridge_GetCash_06_icon
		Z_BW_Bridge_GetCash_07_icon
		Z_FDR_GetCash_04_icon
		Z_FDR_GetCash_08_icon
		Z_FDR_GetCash_02_icon
		Z_FDR_GetCash_03_icon
		Z_FDR_GetCash_07_icon
		Z_FDR_GetCash_01_icon
		Z_FDR_GetCash_06_icon
		Z_FDR_GetCash_09_icon
		Z_FDR_GetCash_10_icon
		z_harbor_GetCash_01_icon
		z_harbor_GetCash_02_icon
		z_harbor_GetCash_03_icon
		z_harbor_GetCash_04_icon
		z_harbor_GetCash_05_icon
		z_harbor_GetCash_06_icon
		z_harbor_GetCash_07_icon
		z_harbor_GetCash_08_icon
		z_harbor_GetCash_09_icon
		z_harbor_GetCash_10_icon
		Z_Lansdowne_GetCash_01_icon
		Z_Lansdowne_GetCash_02_icon
		Z_Lansdowne_GetCash_03_icon
		Z_Lansdowne_GetCash_04_icon
		Z_Lansdowne_GetCash_05_icon
		Z_Lansdowne_GetCash_06_icon
		Z_Lansdowne_GetCash_07_icon
		Z_Lansdowne_GetCash_08_icon
		Z_Lansdowne_GetCash_09_icon
		Z_Lansdowne_GetCash_10_icon
		Z_Love_GetCash_01_icon
		Z_Love_GetCash_02_icon
		Z_Love_GetCash_03_icon
		Z_Love_GetCash_04_icon
		Z_Love_GetCash_05_icon
		Z_Love_GetCash_06_icon
		Z_Love_GetCash_07_icon
		Z_Love_GetCash_08_icon
		Z_Love_GetCash_09_icon
		Z_Love_GetCash_10_icon
		Z_Monuments_GetCash_01_icon
		Z_Monuments_GetCash_02_icon
		Z_Monuments_GetCash_03_icon
		Z_Monuments_GetCash_04_icon
		Z_Monuments_GetCash_05_icon
		Z_Monuments_GetCash_06_icon
		Z_Monuments_GetCash_07_icon
		Z_Monuments_GetCash_08_icon
		Z_Monuments_GetCash_09_icon
		Z_Monuments_GetCash_10_icon
		Z_Museum_Int_GetCash_01_icon
		Z_Museum_Int_GetCash_02_icon
		Z_Museum_Int_GetCash_03_icon
		Z_Museum_Int_GetCash_04_icon
		Z_Museum_Int_GetCash_05_icon
		Z_Museum_Int_GetCash_06_icon
		Z_Museum_Int_GetCash_07_icon
		Z_Museum_Int_GetCash_08_icon
		Z_Museum_Int_GetCash_09_icon
		Z_Museum_Int_GetCash_10_icon
		Z_Museums_GetCash_06_icon
		Z_Museums_GetCash_01_icon
		Z_Museums_GetCash_02_icon
		Z_Museums_GetCash_03_icon
		Z_Museums_GetCash_04_icon
		Z_Museums_GetCash_05_icon
		Z_Museums_GetCash_07_icon
		Z_Museums_GetCash_08_icon
		Z_Museums_GetCash_09_icon
		Z_Museums_GetCash_10_icon
		z_pb_bridge_GetCash_01_icon
		z_pb_bridge_GetCash_02_icon
		z_pb_bridge_GetCash_03_icon
		z_pb_bridge_GetCash_04_icon
		z_pb_bridge_GetCash_05_icon
		z_pb_bridge_GetCash_07_icon
		z_pb_bridge_GetCash_08_icon
		z_pb_bridge_GetCash_09_icon
		z_pb_bridge_GetCash_10_icon
		z_pb_bridge_GetCash_06_icon
		Z_Secret_GetCash_01_icon
		Z_Secret_GetCash_03_icon
		Z_Secret_GetCash_07_icon
		Z_Secret_GetCash_08_icon
		Z_Slums_GetCash_01_icon
		Z_Slums_GetCash_02_icon
		Z_Slums_GetCash_03_icon
		Z_Slums_GetCash_04_icon
		Z_Slums_GetCash_05_icon
		Z_Slums_GetCash_06_icon
		Z_Slums_GetCash_07_icon
		Z_Slums_GetCash_08_icon
		Z_Slums_GetCash_09_icon
		Z_Slums_GetCash_10_icon
		Z_WP_Bridge_GetCash_01_icon
		Z_WP_Bridge_GetCash_02_icon
		Z_WP_Bridge_GetCash_03_icon
		Z_WP_Bridge_GetCash_04_icon
		Z_WP_Bridge_GetCash_05_icon
		Z_WP_Bridge_GetCash_06_icon
		Z_WP_Bridge_GetCash_07_icon
		Z_WP_Bridge_GetCash_08_icon
		Z_WP_Bridge_GetCash_09_icon
		Z_WP_Bridge_GetCash_10_icon
	]
	getarraysize <secret_spots>
	<index> = 0
	begin
	if iscreated (<secret_spots> [<index>])
		<temp_array> = [null]
		setarrayelement arrayname = temp_array index = 0 newvalue = (<secret_spots> [<index>])
		change cash_collect_created_icons = (($cash_collect_created_icons) + <temp_array>)
		kill name = (<secret_spots> [<index>])
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script cash_collect_restore_icons 
	getarraysize \{$cash_collect_created_icons}
	if (<array_size> > 0)
		<index> = 0
		begin
		if isinnodearray (($cash_collect_created_icons) [<index>])
			if NOT iscreated (($cash_collect_created_icons) [<index>])
				create name = (($cash_collect_created_icons) [<index>])
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		change \{cash_collect_created_icons = [
			]}
	endif
endscript

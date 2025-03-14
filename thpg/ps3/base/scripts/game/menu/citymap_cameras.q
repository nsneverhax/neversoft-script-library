
script debug_city_map_show_cams 
	if screenelementexists id = debug_city_map_cam_anchor
		destroyscreenelement id = debug_city_map_cam_anchor
	endif
	if gotparam die
		killspawnedscript name = debug_city_map_show_cams
		return
	endif
	if ($debug_city_map_cams = 1)
		begin
		if screenelementexists id = debug_city_map_cam_anchor
			destroyscreenelement id = debug_city_map_cam_anchor
		endif
		if ($debug_city_map_cams = 0)
			return
		endif
		createscreenelement {
			id = debug_city_map_cam_anchor
			parent = root_window
			type = containerelement
		}
		printf '<-------------------------------------------->'
		printf '< debug_city_map_show_cams ACTIVE, UPDATING. >'
		printf '<-------------------------------------------->'
		getpakmancurrentname map = zones
		<zone_name> = <pakname>
		formattext checksumname = array_name 'city_map_cameras_%s' s = <zone_name>
		if globalexists name = <array_name> type = array
			getarraysize <array_name>
			if (<array_size> > 0)
				<i> = 0
				begin
				<cam_pos> = (<array_name> [<i>].pos)
				createscreenelement {
					parent = debug_city_map_cam_anchor
					type = textelement
					text = "C"
					font = text_a1
					scale = 0.25
					pos3d = <cam_pos>
					shadow
					shadow_rgba = [24 24 24 255]
					shadow_offs = (2.0, 2.0)
				}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
		wait 1 second
		repeat
	endif
endscript

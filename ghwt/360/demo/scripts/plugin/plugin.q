
script plugin_quickview 
	spawnscriptnow plugin_quickview_spawned params = <...>
endscript

script plugin_quickview_spawned 
	printstruct <...>
	stoprendering
	finishrendering
	wait \{3
		gameframes}
	killtexturesplats \{all}
	preallocsplats
	switch <export_type>
		case scene
		scriptassert \{qs(0x179af63d)}
		case sky
		switch <project>
			case gun2
			tod_change_sky sky = <sky>
			default
			change_sky sky = <sky>
		endswitch
		case zone
		switch <project>
			case gun2
			getpakmancurrentname \{map = zones}
			zone_name = <pakname>
			formattext textname = zone qs(0xa2f2c278) z = <zone> dontassertforchecksums
			if NOT (<zone_name> = <zone>)
				jumptozone zone = <zone>
			else
				blockpendingpakmanloads \{map = zones}
				refreshcurrentzones
			endif
			default
			if NOT (<zone> = viewer)
				formattext checksumname = zone 'load_%z' z = <zone> dontassertforchecksums
			endif
			getcurrentlevel
			if NOT (<level> = <zone>)
				setpakmancurrentblock \{map = zones
					pak = none}
				change_level level = <zone>
			else
				blockpendingpakmanloads \{map = zones}
				refreshcurrentzones
			endif
		endswitch
		case viewer
		switch <project>
			case gun2
			getmissionname
			if NOT (<mission> = viewer)
				load_new_mission mission_pak = <viewer> reload_zones
			else
				blockpendingpakmanloads \{map = zones}
				refreshcurrentzones
			endif
			case gh3
			printf \{qs(0xe07578bf)}
			select_venue \{norestart
				level = viewer}
			printf \{qs(0xf2bb8756)}
			case gh3_demo
			printf \{qs(0x757404da)}
			select_venue \{norestart
				level = viewer}
			printf \{qs(0xa2b821a6)}
			case gh4
			printf \{qs(0x58e06a2a)}
			select_venue \{norestart
				level = viewer}
			printf \{qs(0x23f5155e)}
			default
			getcurrentlevel
			if NOT (<level> = viewer)
				setpakmancurrentblock \{map = zones
					pak = none}
				change_level \{level = viewer}
			else
				blockpendingpakmanloads \{map = zones}
				refreshcurrentzones
			endif
		endswitch
		case mission
		switch <project>
			case gun2
			printf \{qs(0x625a9d67)}
			load_new_mission mission_pak = <mission> reload_zones
			default
			blockpendingpakmanloads \{map = zones}
			refreshcurrentzones
		endswitch
		case model
		change \{view_mode = 0}
		toggleviewmode
		toggleviewmode
		toggleviewmode
		exit_view_models_menu
		toggle_model_viewer
		view_model modelname = <model>
		case skin
		change \{view_mode = 0}
		toggleviewmode
		toggleviewmode
		toggleviewmode
		exit_view_models_menu
		toggle_model_viewer
		view_model \{profile = ped_batmasterson
			animloadscript = animload_ped_male
			extraanim = animload_ped_male
			defaultanim = mv_idle_denton
			skeletonname = gun}
		default
	endswitch
	if nodeflagexists \{nodeflag_viewerlights}
		changenodeflag \{nodeflag_viewerlights
			0}
		changenodeflag \{nodeflag_viewerlights
			1}
	endif
	startrendering
	kill_panel_message_if_it_exists \{id = quickview}
endscript

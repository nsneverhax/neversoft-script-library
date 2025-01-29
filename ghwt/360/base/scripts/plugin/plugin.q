
script Plugin_Quickview 
	SpawnScriptNow Plugin_Quickview_Spawned params = <...>
endscript

script Plugin_Quickview_Spawned 
	printstruct <...>
	StopRendering
	FinishRendering
	Wait \{3
		gameframes}
	KillTextureSplats \{all}
	PreAllocSplats
	switch <export_type>
		case scene
		ScriptAssert \{qs(0x179af63d)}
		case sky
		switch <project>
			case gun2
			TOD_Change_Sky sky = <sky>
			default
			Change_Sky sky = <sky>
		endswitch
		case zone
		switch <project>
			case gun2
			GetPakManCurrentName \{map = zones}
			zone_name = <pakname>
			formatText TextName = zone qs(0xa2f2c278) z = <zone> DontAssertForChecksums
			if NOT (<zone_name> = <zone>)
				JumpToZone zone = <zone>
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
			default
			if NOT (<zone> = viewer)
				formatText checksumName = zone 'load_%z' z = <zone> DontAssertForChecksums
			endif
			GetCurrentLevel
			if NOT (<level> = <zone>)
				SetPakManCurrentBlock \{map = zones
					pak = None}
				change_level level = <zone>
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
		endswitch
		case viewer
		switch <project>
			case gun2
			GetMissionName
			if NOT (<mission> = viewer)
				load_new_mission mission_pak = <viewer> reload_zones
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
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
			GetCurrentLevel
			if NOT (<level> = viewer)
				SetPakManCurrentBlock \{map = zones
					pak = None}
				change_level \{level = viewer}
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
		endswitch
		case mission
		switch <project>
			case gun2
			printf \{qs(0x625a9d67)}
			load_new_mission mission_pak = <mission> reload_zones
			default
			BlockPendingPakManLoads \{map = zones}
			RefreshCurrentZones
		endswitch
		case Model
		Change \{view_mode = 0}
		ToggleViewMode
		ToggleViewMode
		ToggleViewMode
		exit_view_models_menu
		toggle_model_viewer
		view_model modelName = <Model>
		case skin
		Change \{view_mode = 0}
		ToggleViewMode
		ToggleViewMode
		ToggleViewMode
		exit_view_models_menu
		toggle_model_viewer
		view_model \{Profile = Ped_BatMasterson
			animLoadScript = animload_ped_male
			extraAnim = animload_ped_male
			Defaultanim = MV_Idle_Denton
			skeletonname = gun}
		default
	endswitch
	if NodeFlagExists \{NODEFLAG_VIEWERLIGHTS}
		ChangeNodeFlag \{NODEFLAG_VIEWERLIGHTS
			0}
		ChangeNodeFlag \{NODEFLAG_VIEWERLIGHTS
			1}
	endif
	StartRendering
	kill_panel_message_if_it_exists \{id = quickview}
endscript

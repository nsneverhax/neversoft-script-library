
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
		ScriptAssert \{"Scene type exports are no longer supported. Use Zone type instead"}
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
			formatText TextName = zone "%z" z = <zone> DontAssertForChecksums
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
			printf \{"Gh3 viewer refresh"}
			select_venue \{norestart}
			printf \{"Gh3 viewer refresh done"}
			case gh3_demo
			printf \{"Gh3 Demo viewer refresh"}
			select_venue \{norestart}
			printf \{"Gh3 Demo viewer refresh done"}
			case gh4
			printf \{"Gh4 viewer refresh"}
			select_venue \{norestart}
			printf \{"Gh4 viewer refresh done"}
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
			printf \{"######################### loading new mission"}
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

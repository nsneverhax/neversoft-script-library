
script Plugin_Quickview 
	SpawnScriptNow Plugin_Quickview_Spawned Params = <...>
endscript

script Plugin_Quickview_Spawned 
	PrintStruct <...>
	StopRendering
	FinishRendering
	Wait \{3
		GameFrames}
	KillTextureSplats \{All}
	PreAllocSplats
	switch <export_type>
		case scene
		ScriptAssert \{"Scene type exports are no longer supported. Use Zone type instead"}
		case Sky
		switch <project>
			case gun2
			TOD_Change_Sky Sky = <Sky>
			default
			Change_Sky Sky = <Sky>
		endswitch
		case zone
		switch <project>
			case gun2
			GetPakManCurrentName \{map = Zones}
			zone_name = <pakname>
			FormatText TextName = zone "%z" Z = <zone> DontAssertForChecksums
			if NOT (<zone_name> = <zone>)
				JumpToZone zone = <zone>
			else
				BlockPendingPakManLoads \{map = Zones}
				RefreshCurrentZones
			endif
			default
			if NOT (<zone> = viewer)
				FormatText ChecksumName = zone 'load_%z' Z = <zone> DontAssertForChecksums
			endif
			GetCurrentLevel
			if NOT (<Level> = <zone>)
				SetPakManCurrentBlock \{map = Zones
					pak = NONE}
				change_level Level = <zone>
			else
				BlockPendingPakManLoads \{map = Zones}
				RefreshCurrentZones
			endif
		endswitch
		case viewer
		switch <project>
			case gun2
			GetMissionName
			if NOT (<Mission> = viewer)
				load_new_mission mission_pak = <viewer> reload_zones
			else
				BlockPendingPakManLoads \{map = Zones}
				RefreshCurrentZones
			endif
			case gh3
			Printf \{"Gh3 viewer refresh"}
			select_venue \{NoRestart}
			Printf \{"Gh3 viewer refresh done"}
			case gh3_demo
			Printf \{"Gh3 Demo viewer refresh"}
			select_venue \{NoRestart}
			Printf \{"Gh3 Demo viewer refresh done"}
			case gh4
			Printf \{"Gh4 viewer refresh"}
			select_venue \{NoRestart}
			Printf \{"Gh4 viewer refresh done"}
			default
			GetCurrentLevel
			if NOT (<Level> = viewer)
				SetPakManCurrentBlock \{map = Zones
					pak = NONE}
				change_level \{Level = viewer}
			else
				BlockPendingPakManLoads \{map = Zones}
				RefreshCurrentZones
			endif
		endswitch
		case Mission
		switch <project>
			case gun2
			Printf \{"######################### loading new mission"}
			load_new_mission mission_pak = <Mission> reload_zones
			default
			BlockPendingPakManLoads \{map = Zones}
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
		case Skin
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
			SkeletonName = gun}
		default
	endswitch
	if NodeFlagExists \{NODEFLAG_VIEWERLIGHTS}
		ChangeNodeFlag \{NODEFLAG_VIEWERLIGHTS
			0}
		ChangeNodeFlag \{NODEFLAG_VIEWERLIGHTS
			1}
	endif
	StartRendering
	kill_panel_message_if_it_exists \{Id = quickview}
endscript

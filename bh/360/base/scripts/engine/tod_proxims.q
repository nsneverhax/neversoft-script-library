SE_Brightness = 5
currentTODSettings = Default_TOD_Manager

script TOD_Proxim_Create_LightFX 
	ScreenFX_ClearFXInstances \{viewport = 0}
	if InSplitScreenGame
		ScreenFX_ClearFXInstances \{viewport = 0}
	endif
	TOD_Proxim_Update_LightFX \{viewport = bg_viewport
		time = 0}
endscript

script TOD_Proxim_Update_LightFX 
	TOD_Proxim_Update_LightFX_Viewport viewport = bg_viewport <...>
endscript

script toggle_default_sceenfx 
	TOD_Proxim_Update_LightFX_Viewport
endscript

script TOD_Proxim_Update_LightFX_Viewport \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 1}
	printf \{qs(0x449d27d9)}
	ScreenFX_ClearFXInstances viewport = <viewport>
	if StructureContains structure = <fxParam> screen_fx
		begin
		if GetNextArrayElement (<fxParam>.screen_fx)
			printf (<element>.name)
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				<element>
			}
		else
			break
		endif
		repeat
	endif
endscript

script TOD_Proxim_Reapply_LightFX 
	TOD_Proxim_Update_LightFX \{fxParam = $currentTODSettings
		time = 0.0}
endscript

script TOD_Proxim_Apply_Default 
	TOD_Proxim_Update_LightFX \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 0.0}
endscript

script TOD_Proxim_Apply_BW_01 
	TOD_Proxim_Update_LightFX \{fxParam = $BW_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script ApplyVenueToneMap_Default 
	if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			name = tone_map
			scefName = tone_map
			type = ToneMap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			name = tone_map
			scefName = tone_map
			type = ToneMap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	endif
endscript

script ApplyVenueToneMap \{viewport = bg_viewport
		texture = 'tex\\LUTs\\lut_default_dnc.dds'}
	if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			name = tone_map
			scefName = tone_map
			type = ToneMap
			texture = <texture>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			name = tone_map
			scefName = tone_map
			type = ToneMap
			texture = <texture>
		}
	endif
endscript

script Venue_ScreenFX \{viewport = bg_viewport}
	if ExistsPakManMap \{map = zones}
		GetPakManCurrent \{map = zones}
		switch <pak>
			case Z_Visualizer
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_z_Visualizer_default_dnc.dds'}
			case Z_Cube
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Cube_default_dnc.dds'}
			case Z_EasterIsland
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_easterisland_default_dnc.dds'}
			case Z_Montreux
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Montreux_default_dnc.dds'}
			case Z_Tokyo
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Tokyo_default_dnc.dds'}
			case Z_Cabo
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Cabo_default_dnc.dds'}
			case Z_Paris
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Paris_default_dnc.dds'}
			case Z_CentralPark
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_CentralPark_default_dnc.dds'}
			case Z_Gorge
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Gorge_default_dnc.dds'}
			case Z_Mall
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Mall_default_dnc.dds'}
			case Z_Space
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Space_default_dnc.dds'}
			case Z_AwardShow
			ApplyVenueToneMap \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Awardshow_default_dnc.dds'}
			default
			ApplyVenueToneMap_Default viewport = <viewport>
		endswitch
	else
		ApplyVenueToneMap_Default viewport = <viewport>
	endif
endscript

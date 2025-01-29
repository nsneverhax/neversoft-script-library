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
	if StructureContains structure = <fxParam> screen_FX
		begin
		if GetNextArrayElement (<fxParam>.screen_FX)
			printf (<element>.Name)
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

script tod_proxim_apply_default 
	TOD_Proxim_Update_LightFX \{fxParam = $Default_TOD_Manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_01 
	TOD_Proxim_Update_LightFX \{fxParam = $bw_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script applyvenuetonemap_default 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_cairo 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_neworleans 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_mexico 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_nashville 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_norway 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_dublin 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_vegas 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_subway 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_sanfran 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_carhenge 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_freakshow 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_sepia3_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_sepia3_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_dragrace 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_lhc 
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = tone_map
		ScreenFX_AddFXInstance {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = tone_map
			scefName = tone_map
			Type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script venue_screenfx \{viewport = bg_viewport}
	if existspakmanmap \{map = zones}
		GetPakManCurrent \{map = zones}
		switch <pak>
			case z_cairo
			applyvenuetonemap_cairo {
				viewport = <viewport>
			}
			case z_sanfrancisco
			applyvenuetonemap_sanfran {
				viewport = <viewport>
			}
			case z_carhenge
			applyvenuetonemap_carhenge {
				viewport = <viewport>
			}
			case z_dragrace
			applyvenuetonemap_dragrace {
				viewport = <viewport>
			}
			case z_dublin
			applyvenuetonemap_dublin {
				viewport = <viewport>
			}
			case z_freakshow
			applyvenuetonemap_freakshow {
				viewport = <viewport>
			}
			case z_mexicocity
			applyvenuetonemap_mexico {
				viewport = <viewport>
			}
			case z_nashville
			applyvenuetonemap_nashville {
				viewport = <viewport>
			}
			case z_neworleans
			applyvenuetonemap_neworleans {
				viewport = <viewport>
			}
			case z_norway
			applyvenuetonemap_norway {
				viewport = <viewport>
			}
			case z_subway
			applyvenuetonemap_subway {
				viewport = <viewport>
			}
			case z_vegas
			applyvenuetonemap_vegas {
				viewport = <viewport>
			}
			case z_montreux
			applyvenuetonemap_montreaux {
				viewport = <viewport>
			}
			case z_paris
			applyvenuetonemap_paris {
				viewport = <viewport>
			}
			case z_lhc
			applyvenuetonemap_lhc {
				viewport = <viewport>
			}
		endswitch
	endif
endscript

se_brightness = 5
currenttodsettings = default_tod_manager

script tod_proxim_create_lightfx 
	screenfx_clearfxinstances \{viewport = 0}
	if insplitscreengame
		screenfx_clearfxinstances \{viewport = 0}
	endif
	tod_proxim_update_lightfx \{viewport = bg_viewport
		time = 0}
endscript

script tod_proxim_update_lightfx 
	tod_proxim_update_lightfx_viewport viewport = bg_viewport <...>
endscript

script toggle_default_sceenfx 
	tod_proxim_update_lightfx_viewport
endscript

script tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 1}
	printf \{qs(0x449d27d9)}
	screenfx_clearfxinstances viewport = <viewport>
	if structurecontains structure = <fxparam> screen_fx
		begin
		if getnextarrayelement (<fxparam>.screen_fx)
			printf (<element>.name)
			screenfx_addfxinstance {
				viewport = <viewport>
				<element>
			}
		else
			break
		endif
		repeat
	endif
endscript

script tod_proxim_reapply_lightfx 
	tod_proxim_update_lightfx \{fxparam = $currenttodsettings
		time = 0.0}
endscript

script tod_proxim_apply_default 
	tod_proxim_update_lightfx \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script tod_proxim_apply_bw_01 
	tod_proxim_update_lightfx \{fxparam = $bw_01_tod_manager
		viewport = bg_viewport
		time = 0.0}
endscript

script applyvenuetonemap_default 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_cairo 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_neworleans 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_mexico 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_nashville 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_norway 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_dublin 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_vegas 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_subway 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_w_gain_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_sanfran 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_warmHi_coolLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_carhenge 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_freakshow 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_sepia3_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_sepia3_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_dragrace 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script applyvenuetonemap_lhc 
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_desat_gritty_CoolHi_WarmLo_dnc.dds'
		}
	endif
endscript

script venue_screenfx \{viewport = bg_viewport}
	if existspakmanmap \{map = zones}
		getpakmancurrent \{map = zones}
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

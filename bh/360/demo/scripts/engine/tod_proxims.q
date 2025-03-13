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
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = 'tex\\LUTs\\lut_default_dnc.dds'
		}
	endif
endscript

script 0x20566539 \{viewport = bg_viewport
		texture = 'tex\\LUTs\\lut_default_dnc.dds'}
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = tone_map
		screenfx_addfxinstance {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = <texture>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = tone_map
			scefname = tone_map
			type = tonemap
			texture = <texture>
		}
	endif
endscript

script venue_screenfx \{viewport = bg_viewport}
	if existspakmanmap \{map = zones}
		getpakmancurrent \{map = zones}
		switch <pak>
			case z_visualizer
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_z_Visualizer_default_dnc.dds'}
			case z_cube
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Cube_default_dnc.dds'}
			case z_easterisland
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_easterisland_default_dnc.dds'}
			case z_montreux
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Montreux_default_dnc.dds'}
			case z_tokyo
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Tokyo_default_dnc.dds'}
			case z_cabo
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Cabo_default_dnc.dds'}
			case z_paris
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Paris_default_dnc.dds'}
			case z_centralpark
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_CentralPark_default_dnc.dds'}
			case z_gorge
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Gorge_default_dnc.dds'}
			case 0x53d2aff0
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Mall_default_dnc.dds'}
			case z_space
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Space_default_dnc.dds'}
			case z_awardshow
			0x20566539 \{viewport = bg_viewport
				texture = 'tex\\LUTs\\lut_Z_Awardshow_default_dnc.dds'}
			default
			applyvenuetonemap_default viewport = <viewport>
		endswitch
	else
		applyvenuetonemap_default viewport = <viewport>
	endif
endscript

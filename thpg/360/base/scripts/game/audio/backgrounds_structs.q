skate8_sfx_background_areas_and_states = {
	Bmore_City = {
		`default` = sk9_BG_Bmore_City
		volume_params = {
			sk9_BG_Bmore_City = 120
		}
		fade_from = {
		}
	}
	Bmore_Harbor = {
		`default` = sk9_BG_Bmore_Harbor
		volume_params = {
			sk9_BG_Bmore_Harbor = 100
		}
		fade_from = {
		}
	}
	Bmore_Lansdowne = {
		`default` = sk9_BG_Bmore_Lansdowne
		volume_params = {
			sk9_BG_Bmore_Lansdowne = 100
		}
		fade_from = {
		}
	}
	Bmore_Roofs = {
		`default` = sk9_BG_Bmore_Roofs
		volume_params = {
			sk9_BG_Bmore_Roofs = 100
		}
		fade_from = {
		}
	}
	Bmore_Underground = {
		`default` = sk9_BG_Bmore_Underground
		volume_params = {
			sk9_BG_Bmore_Underground = 100
		}
		fade_from = {
		}
	}
	Bridge_DC_Philly = {
		`default` = sk9_BG_Bridge_DC_Philly
		volume_params = {
			sk9_BG_Bridge_DC_Philly = 100
		}
		fade_from = {
		}
	}
	Bridge_Bmore_DC = {
		`default` = sk9_BG_Bmore_Harbor
		volume_params = {
			sk9_BG_Bmore_Harbor = 100
		}
		fade_from = {
		}
	}
	Bridge_Philly_Bmore = {
		`default` = sk9_BG_PB_Bridge
		volume_params = {
			sk9_BG_PB_Bridge = 140
		}
		fade_from = {
		}
	}
	Bridge_Philly_Bmore_Tunnel = {
		`default` = SK9_BG_Bridge_Philly_Bmore_Tunnel
		volume_params = {
			SK9_BG_Bridge_Philly_Bmore_Tunnel = 100
		}
		fade_from = {
		}
	}
	crib = {
		`default` = sk9_BG_Crib
		volume_params = {
			sk9_BG_Crib = 50
		}
		fade_from = {
		}
	}
	DC_City = {
		`default` = sk9_BG_DC_City
		volume_params = {
			sk9_BG_DC_City = 100
		}
		fade_from = {
		}
	}
	DC_Moon = {
		`default` = sk9_BG_DC_Moon
		volume_params = {
			sk9_BG_DC_Moon = 100
		}
		fade_from = {
		}
	}
	DC_Museum = {
		`default` = sk9_BG_DC_Museum
		volume_params = {
			sk9_BG_DC_Museum = 80
		}
		fade_from = {
		}
	}
	DC_Roofs = {
		`default` = sk9_BG_DC_Roofs
		volume_params = {
			sk9_BG_DC_Roofs = 100
		}
		fade_from = {
		}
	}
	Philly_FDR_OutsideBridge = {
		`default` = sk9_BG_Philly_FDR_OutsideBridge
		volume_params = {
			sk9_BG_Philly_FDR_OutsideBridge = 100
		}
		fade_from = {
		}
	}
	Philly_FDR_UnderBridge = {
		`default` = sk9_BG_Philly_FDR_UnderBridge
		volume_params = {
			sk9_BG_Philly_FDR_UnderBridge = 100
		}
		fade_from = {
		}
	}
	Philly_Slums = {
		`default` = sk9_BG_Philly_Slums
		volume_params = {
			sk9_BG_Philly_Slums = 100
		}
		fade_from = {
		}
	}
	Philly_Slums_Roof = {
		`default` = sk9_BG_Philly_City_Roof
		volume_params = {
			sk9_BG_Philly_City_Roof = 130
		}
		fade_from = {
		}
	}
	Philly_City = {
		`default` = sk9_BG_Philly_City
		volume_params = {
			sk9_BG_Philly_City = 100
		}
		fade_from = {
		}
	}
	Philly_City_Roof = {
		`default` = sk9_BG_Philly_City_Roof
		volume_params = {
			sk9_BG_Philly_City_Roof = 130
		}
		fade_from = {
		}
	}
	Philly_City_Parking = {
		`default` = sk9_BG_Philly_City_Parking
		volume_params = {
			sk9_BG_Philly_City_Parking = 100
		}
		fade_from = {
		}
	}
}

script Generic_BG_Functionality_Script newBG = Houses_Skater_Backyard newOneShots = BG_OneShot_SkaterBackyard
	if inside
		if gotparam newBG
			printf channel = sfx "CHANGING LOOPING STREAM BG AREA %b" b = <newBG>
			skate8_sfx_backgrounds_new_area bg_sfx_area = <newBG>
		else
			printf channel = sfx "STOOOPID!  YOU CALLED Generic_BG_Functionality_Script but didn't pass a NewBG Param! - not doing anything"
		endif
		if gotparam newOneShots
			Change_BG_One_Shots soundevent = <newOneShots>
		else
			printf channel = sfx "Did not pass in a new one shots, so - not doing anything"
		endif
	else
		if gotparam destroyed
		else
			if gotparam created
			else
				if gotparam exitBG
					skate8_sfx_backgrounds_new_area bg_sfx_area = <exitBG>
				endif
				if gotparam exitOneShots
					Change_BG_One_Shots soundevent = <exitOneShots>
				endif
			endif
		endif
	endif
endscript

script BG_SFX_City_Generic 
	Generic_BG_Functionality_Script newBG = City_Generic newOneShots = BG_OneShot_Neighborhood_EXT <...>
endscript

script BG_SFX_Bmore_City 
	Generic_BG_Functionality_Script {
		newBG = Bmore_City
		newOneShots = BG_OneShot_Bmore_City
		<...>
	}
endscript

script BG_SFX_Bmore_Lansdowne 
	Generic_BG_Functionality_Script {
		newBG = Bmore_Lansdowne
		newOneShots = BG_OneShot_Bmore_Lansdowne
		<...>
	}
endscript

script BG_SFX_Bmore_Harbor 
	Generic_BG_Functionality_Script {
		newBG = Bmore_Harbor
		newOneShots = BG_OneShot_Bmore_Harbor
		<...>
	}
endscript

script BG_SFX_Bmore_Roofs 
	Generic_BG_Functionality_Script {
		newBG = Bmore_Roofs
		newOneShots = BG_OneShot_Bmore_Roofs
		<...>
	}
endscript

script BG_SFX_Bmore_Underground 
	Generic_BG_Functionality_Script {
		newBG = Bmore_Underground
		<...>
	}
endscript

script BG_SFX_BCity 
	Generic_BG_Functionality_Script {
		newBG = Bmore_City
		newOneShots = BG_OneShot_Bmore_City
		<...>
	}
endscript

script BG_SFX_BCity_Roofs 
	Generic_BG_Functionality_Script {
		newBG = Bmore_Roofs
		newOneShots = BG_OneShot_Bmore_Roofs
		<...>
	}
endscript

script BG_SFX_Bridge_DC_Philly 
	Generic_BG_Functionality_Script {
		newBG = Bridge_DC_Philly
		<...>
	}
endscript

script BG_SFX_Bridge_Bmore_DC 
	Generic_BG_Functionality_Script {
		newBG = Bridge_Bmore_DC
		newOneShots = BG_OneShot_Bridges
		<...>
	}
endscript

script BG_SFX_Bridge_Philly_Bmore 
	Generic_BG_Functionality_Script {
		newBG = Bridge_Philly_Bmore
		newOneShots = BG_OneShot_Bridges
		<...>
	}
endscript

script BG_SFX_Bridge_Philly_Bmore_Tunnel 
	Generic_BG_Functionality_Script {
		newBG = Bridge_Philly_Bmore_Tunnel
		<...>
	}
endscript

script BG_SFX_Crib 
	Generic_BG_Functionality_Script {
		newBG = crib
		<...>
	}
endscript

script BG_SFX_DC_City 
	Generic_BG_Functionality_Script {
		newBG = DC_City
		newOneShots = BG_OneShot_DC_City
		<...>
	}
endscript

script BG_SFX_DC_Moon 
	Generic_BG_Functionality_Script {
		newBG = DC_Moon
		newOneShots = BG_OneShot_Moon
		<...>
	}
endscript

script BG_SFX_DC_Museum 
	Generic_BG_Functionality_Script {
		newBG = DC_Museum
		newOneShots = BG_OneShot_DC_Museums
		<...>
	}
endscript

script BG_SFX_DC_Roofs 
	Generic_BG_Functionality_Script {
		newBG = DC_Roofs
		newOneShots = BG_OneShot_DC_Roofs
		<...>
	}
endscript

script BG_SFX_Philly_FDR_UnderBridge 
	Generic_BG_Functionality_Script {
		newBG = Philly_FDR_UnderBridge
		<...>
	}
endscript

script BG_SFX_Philly_FDR_OutsideBridge 
	Generic_BG_Functionality_Script {
		newBG = Philly_FDR_OutsideBridge
		<...>
	}
endscript

script BG_SFX_Philly_Slums 
	Generic_BG_Functionality_Script {
		newBG = Philly_Slums
		newOneShots = BG_OneShot_Philly_Slums
		<...>
	}
endscript

script BG_SFX_Philly_Slums_Roof 
	Generic_BG_Functionality_Script {
		newBG = Philly_Slums_Roof
		<...>
	}
endscript

script BG_SFX_Philly_Love 
	Generic_BG_Functionality_Script {
		newBG = Philly_City
		newOneShots = BG_OneShot_Philly_City
		<...>
	}
endscript

script BG_SFX_Philly_Love_Roof 
	Generic_BG_Functionality_Script {
		newBG = Philly_City_Roof
		<...>
	}
endscript

script BG_SFX_Philly_Bell 
	Generic_BG_Functionality_Script {
		newBG = Philly_City
		newOneShots = BG_OneShot_Philly_City
		<...>
	}
endscript

script BG_SFX_Philly_Bell_Roof 
	Generic_BG_Functionality_Script {
		newBG = Philly_City_Roof
		<...>
	}
endscript

script BG_SFX_Philly_Bell_Parking 
	Generic_BG_Functionality_Script {
		newBG = Philly_City_Parking
		newOneShots = BG_OneShot_Philly_City_Parking
		<...>
	}
endscript

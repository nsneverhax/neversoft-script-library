vehiclesoundglobals = {
	enginedropofffunction = standard
	enginedropoffdist = 30.0
	enginepriority = 10
}
vehiclesoundprofiles = {
	GenericVehicle = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 1.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 750
				dropoffendrpm = 1800
				minpitch = -0.0
				maxpitch = 0.5
				maxvol = 1.0
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 2200
				dropoffendrpm = 2800
				minpitch = -3.0
				maxpitch = 3
				maxvol = 1.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -3
				maxpitch = 3
				maxvol = 1.0
			}
		]
	}
	HeavyTruck = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 1000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_diesel_1000rpm_loop
				dropoffstartrpm = 1300
				dropoffendrpm = 2000
				minpitch = -1.0
				maxpitch = 1.5
				maxvol = 1.3
			}
			{
				EngineSound = sk9_diesel_2000rpm_loop
				dropoffstartrpm = 2100
				dropoffendrpm = 2600
				minpitch = -1.0
				maxpitch = 2.0
				maxvol = 0.8
			}
			{
				EngineSound = sk9_diesel_3000rpm_loop
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 0.8
			}
		]
	}
	Compact_4Cyl = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_red = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_blue = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_gold = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_green = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_burgundy = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_lightblue = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_black = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_darkteal = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Compact_4Cyl_bronze = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 2.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Compact_4cyl_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1200
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_Compact_4cyl_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Compact_4cyl_3000rpm_loop
				minpitch = -1.5
				maxpitch = 1.5
				maxvol = 1.3
			}
		]
	}
	Sedan_6cyl = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Sedan_6cyl_1000rpm_loop
				dropoffstartrpm = 1000
				dropoffendrpm = 1300
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_Sedan_6cyl_2000rpm_loop
				dropoffstartrpm = 2000
				dropoffendrpm = 2300
				minpitch = 0.0
				maxpitch = 3.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Sedan_6cyl_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
		]
	}
	Sedan_6cyl_Black = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Sedan_6cyl_1000rpm_loop
				dropoffstartrpm = 1000
				dropoffendrpm = 1300
				minpitch = -0.1
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_Sedan_6cyl_2000rpm_loop
				dropoffstartrpm = 2000
				dropoffendrpm = 2300
				minpitch = 0.0
				maxpitch = 3.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Sedan_6cyl_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
		]
	}
	Sedan_6cyl_Tan = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Sedan_6cyl_1000rpm_loop
				dropoffstartrpm = 1000
				dropoffendrpm = 1300
				minpitch = 0.1
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_Sedan_6cyl_2000rpm_loop
				dropoffstartrpm = 2000
				dropoffendrpm = 2300
				minpitch = 0.0
				maxpitch = 3.0
				maxvol = 1.2
			}
			{
				EngineSound = sk9_Sedan_6cyl_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
		]
	}
	JeepSUV = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -2.0
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	Classic_V8 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_Classic_V8_1000rpm_loop
				dropoffstartrpm = 800
				dropoffendrpm = 1200
				minpitch = -1.0
				maxpitch = 1.0
				maxvol = 2.5
			}
			{
				EngineSound = sk9_Classic_V8_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -3.0
				maxpitch = 2.0
				maxvol = 2.5
			}
			{
				EngineSound = sk9_Classic_V8_3000rpm_loop
				minpitch = -1.0
				maxpitch = 2.0
				maxvol = 2.0
			}
		]
	}
	Workvan1 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -1.9
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	Workvan2 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -2.0
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	Workvan_Black = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -2.1
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	Minivan1 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -1.4
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.1
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	Minivan2 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -1.6
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	Minivan3 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 2000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_JeepSUV_1000rpm_loop
				dropoffstartrpm = 900
				dropoffendrpm = 1600
				minpitch = -1.5
				maxpitch = 2.0
				maxvol = 1.5
			}
			{
				EngineSound = sk9_JeepSUV_2000rpm_loop
				dropoffstartrpm = 1900
				dropoffendrpm = 2200
				minpitch = -1.9
				maxpitch = 1.0
				maxvol = 2.0
			}
			{
				EngineSound = sk9_JeepSUV_3000rpm_loop
				minpitch = -2.0
				maxpitch = 1.0
				maxvol = 1.0
			}
		]
	}
	PickupTruck1 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 1000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_diesel_1000rpm_loop
				dropoffstartrpm = 1300
				dropoffendrpm = 2000
				minpitch = -1.1
				maxpitch = 1.5
				maxvol = 1.3
			}
			{
				EngineSound = sk9_diesel_2000rpm_loop
				dropoffstartrpm = 2100
				dropoffendrpm = 2600
				minpitch = -1.1
				maxpitch = 2.0
				maxvol = 0.8
			}
			{
				EngineSound = sk9_diesel_3000rpm_loop
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 0.8
			}
		]
	}
	PickupTruck2 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 1000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_diesel_1000rpm_loop
				dropoffstartrpm = 1300
				dropoffendrpm = 2000
				minpitch = -1.0
				maxpitch = 1.5
				maxvol = 1.3
			}
			{
				EngineSound = sk9_diesel_2000rpm_loop
				dropoffstartrpm = 2100
				dropoffendrpm = 2600
				minpitch = -1.0
				maxpitch = 2.0
				maxvol = 0.8
			}
			{
				EngineSound = sk9_diesel_3000rpm_loop
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 0.8
			}
		]
	}
	PickupTruck3 = {
		shiftupsound = sk9_Generic_gearshift1
		shiftdownsound = sk9_Generic_gearshift2
		shiftvolume = 0.0
		MinEngineVol = 1.5
		MaxEngineVol = 3.0
		dopplerfactor = 1000
		Gears = [
			{
				minrpm = 500
				upshiftvel = 10
				upshiftrpm = 2000
			}
			{
				downshiftvel = 5
				downshiftrpm = 1500
				upshiftvel = 20
				upshiftrpm = 3000
			}
			{
				downshiftvel = 15
				downshiftrpm = 2500
				maxrpm = 5000
				maxVel = 50
			}
		]
		engineblend = [
			{
				EngineSound = sk9_diesel_1000rpm_loop
				dropoffstartrpm = 1300
				dropoffendrpm = 2000
				minpitch = -0.9
				maxpitch = 1.5
				maxvol = 1.3
			}
			{
				EngineSound = sk9_diesel_2000rpm_loop
				dropoffstartrpm = 2100
				dropoffendrpm = 2600
				minpitch = -0.9
				maxpitch = 2.0
				maxvol = 0.8
			}
			{
				EngineSound = sk9_diesel_3000rpm_loop
				minpitch = 0.0
				maxpitch = 2.0
				maxvol = 0.8
			}
		]
	}
}
VehicleSoundRefreshed = true

script vehiclesoundrefresh 
	begin
	if ($VehicleSoundRefreshed = true)
		printf \{"VehicleSoundRefreshed"}
		broadcastevent \{type = vehicle_sounds_updated}
		change \{VehicleSoundRefreshed = false}
	endif
	wait \{0.5
		seconds}
	repeat
endscript
